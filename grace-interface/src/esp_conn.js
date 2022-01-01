

class UsbEsp {
    constructor() {
        this.port = undefined;
        this.mac = "";

        this.change_cb = undefined;

        this.grace_verified = false;
    }


    handle_line = (in_string) => {
        console.log("Got string: " + in_string);

        if(/^P /.test(in_string)) {
            if(!this.grace_verified) {
                this.grace_verified = true;
                this.triggerChange({action: 'verifyGrace'});
                console.log("GOT DURG")
            }
        }
        else if(/Maximum number of WiFi connection retries reached!/.test(in_string)) {
            this.triggerChange({action: 'wifiFailed'});
        }
        else if(/XNM::WiFi: Network connected!/.test(in_string))
            this.triggerChange({action: 'wifiOK'});

        try {
            let match = /P (.*)/.exec(in_string);
            if(match !== undefined) {
                const in_json = JSON.parse(match[1]);
                console.log(in_json);
            }

        }
        catch(e) {}
    }

    request_port = async () => {
        this.port = await navigator.serial.requestPort();
        await this.port.open({baudRate: 115200});

        const reader = this.port.readable.getReader();

        let str_buffer = "";

        this.triggerChange({action: 'waitingGrace'});

        // Listen to data coming from the serial device.
        while (true) {
            const { value, done } = await reader.read();
            if (done) {
                // Allow the serial port to be closed later.
                reader.releaseLock();
                break;
            }

            str_buffer += String.fromCharCode.apply(null, value);

            const str_split = str_buffer.split("\n");

            console.log("String split is: " + JSON.stringify(str_split));
            let n = 0;
            while(n < (str_split.length - 1)) {
                this.handle_line(str_split[n]);
                n++;
            }

            str_buffer = str_split[str_split.length - 1];
        }
    }

    send = (data) => {
        if(this.port === undefined)
            return;

        const w = this.port.writable.getWriter();
        const out_str = JSON.stringify(data) + "\n";
        const out_arr = new TextEncoder("ascii-8").encode(out_str);

        w.write(out_arr); 

        w.releaseLock();
    }

    triggerChange = (data) => {
        console.log("Triggering update!");

        if(this.change_cb === undefined)
            return;

        this.change_cb(data);
    }

    onChange = (upd) => {
        console.log("Configuring change cb");
        this.change_cb = upd;
    }

    restartEsp = () => {
        this.send({set: {_system: {reboot: true}}});
        this.send({set: {_system: {reboot: true}}});
    }

    setWifi = (ssid, password) => {
        this.send({set: {_system: {wifi_ssid: ssid, wifi_password: password, reboot: true}}});
        this.triggerChange({action: 'wifi_waiting'});
    }
}

export default UsbEsp;