
import './App.css';

import ReactMarkdown from 'react-markdown';
import { useEffect, useReducer, useState } from 'react';
import UsbEsp from './esp_conn';
import { SwitchTransition, CSSTransition } from 'react-transition-group';

const greeting_text = [
  "# There we go <3",
  "Your little dragon head was connected :>",
  `We would like to show you a symbol of our connection, 
and there is no better way to do that than through a little dragon head :D`,
  "[We all helped design it together], {and make it look extra pretty <3}",
  "so that it's extra nice for you to keep close and look at.",
  `If you wish, you can connect it to your home WiFi. 
  That way, it can show you who of us three is switched in, or if we are asleep.`,
  "If you don't care for that, you can close this website. Otherwise:",
  "!wifi_conn"
]

const esp = new UsbEsp();

function appTextReducer(state, args) {
  switch(args.action) {
    default:
      return state;

    case 'wifiFailed':
      state = Object.assign({}, state);
      state.text_remaining = state.text_remaining.concat(["Oh, that didn't connect. Could you try again?", 
        "!wifi_conn"])
      state.state = 'text';

      return state;
    case 'wifi_waiting':
      state = Object.assign({}, state);
      state.text_remaining = state.text_remaining.concat(["Thank you!",
    "If the present stays one solid colour, it connected successfully. Otherwise you will have to reconnect, reload the website and try again (sorry, programming this is harder than we thought >.<)",
    "You won't need this website any more, you can configure the device over MQTT or let it be.",
      `It might be blinking now - that's it downloading an update. 
      It'll do that from time to time as we add some nice bits and bobs of nerd stuff :>`,
     "## Thank you again for being such good friends. Hopefully you will love this <3"]);
      state.state = 'text';

      return state;
    case 'wifiOK':
      state = Object.assign({}, state);
      state.text_remaining = state.text_remaining.concat(["And it looks like it works!", "!text"]);
      state.state = 'text';

      return state;
    case 'waitingGrace':
      state = Object.assign({}, state);
      state.text_remaining = state.text_remaining.concat(["Right, waiting for it to ping...", "Don't be alarmed, this might take a few seconds."]);
      state.state = 'text';

      return state;
    case 'verifyGrace':
      state = Object.assign({}, state);

      state.text_remaining = [].concat(state.text_remaining.slice(), greeting_text.slice());
      state.state = 'greetingText';

      return state;

    case 'tick':
      console.log("ticking")

      if(state.text_wait <= 0 && state.text_remaining.length === 0)
        return state;

      state = Object.assign({}, state);

      state.text_wait -= 1;

      if(state.text_wait > 0)
        return state;
      
      if(state.text_remaining.length > 0) {
        state.text_remaining = state.text_remaining.slice();
        let next_text = state.text_remaining.shift();

        let state_match = /^!(.*)/.exec(next_text)
        if(state_match)
          state.state = state_match[1];
        else {
          state.current_text = state.current_text + next_text + "\n\n";
          state.text_wait = next_text.length / 40;
        }
      }

      return state;
  }
}

function DurgInputSelector(props) {

  let form_button = <div style={{visible: false}} />

  switch(props.state.state) {
    default: break;
    case 'connection':
      form_button = <button onClick={e => {
        e.preventDefault();
        esp.request_port();
      }}>
        Connect :>
      </button>
    break;

    case 'wifi_conn':
      form_button = <form onSubmit={e => {
        e.preventDefault();

        const ssid = e.target[0].value;
        const pswd = e.target[1].value;

        console.log("SSID: " + ssid + " Password: " + pswd);

        esp.setWifi(ssid, pswd);
      }}>
        <label htmlFor="wifi_ssid"> SSID: </label>
        <input type="text" id="wifi_ssid" />
        <label htmlFor="wifi_psswd"> Password: </label>
        <input type="password" id="wifi_psswd" />
        <input type="submit" value="OK!" />
      </form> 
    break;
  }

  return  <SwitchTransition >
    <CSSTransition key={props.state.state} classNames='inputs'>
      {form_button}
    </CSSTransition>
  </SwitchTransition>
}

function App() {
  let [currentTextState, updateTextState] = useReducer(appTextReducer, {
    text_wait: 0,
    text_remaining: ["# Hi <3",
  "Before we get started, could you please plug in the present to this computer?",
  "After it's connected we'll procceed :)",
  "Click \"connect\" and then look for a JTAG debugger device in the popup.",
  "!connection"],
    current_text: "",
    state: 'text'
  });

  
  useEffect(() => {
    console.log("Restarting effect...");
    esp.onChange(updateTextState);

    let timeout = setInterval(() => {
        updateTextState({action: 'tick'});
    }, 1000);

    return () => { clearTimeout(timeout) }
  }, [updateTextState]);

  const c = currentTextState.current_text;

  return (
    <div className="App">
      <ReactMarkdown className="ChatWindow" children={c} />

      <DurgInputSelector state={currentTextState} />
    </div>
  );
}

export default App;
