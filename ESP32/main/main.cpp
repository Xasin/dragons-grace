/* Hello World Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_spi_flash.h"
#include "nvs_flash.h"

#include <cmath>

#include <xnm/neocontroller.h>

#include <xnm/net_helpers.h>
#include <xnm/i2c/AW9201.h>
#include <xnm/i2c/MasterAction.h>

#include <esp_log.h>

#include <xnm/property_point.h>

#include "leds.h"


XNM::Neo::NeoController test(GPIO_NUM_6, RMT_CHANNEL_0, 20);

XNM::I2C::AW9201 booper;

uint16_t als_val = 0;
float smoothed_als = 100;
bool has_aw  = false;

int brightness_override = 100;
int face_override = -1;
int global_face = -1;

XNM::PropertyPoint::CustomProperty face_property(XNM::NetHelpers::propp, "face");

cJSON * face_get_json() {
    cJSON * out = cJSON_CreateObject();

    if(brightness_override == -1) {
        cJSON_AddStringToObject(out, "brightness", "auto");
    }
    else
        cJSON_AddNumberToObject(out, "brightness", brightness_override);

    return out;
}
void face_set_json(const cJSON * data) {
    auto item = cJSON_GetObjectItem(data, "brightness");

    if(cJSON_IsString(item) && strcmp(item->valuestring, "auto") == 0)
        brightness_override = -1;
    else if(cJSON_IsNumber(item))
        brightness_override = item->valueint;

    item = cJSON_GetObjectItem(data, "face");
    if(cJSON_IsNumber(item))
        face_override = item->valueint;

    face_property.poke_update();
}


esp_err_t event_handler(void *context, system_event_t *event)
{
    XNM::NetHelpers::event_handler(event);
    return ESP_OK;
}

void init_als() {
    auto i = XNM::I2C::MasterAction(0x23);
    i.write(0b00010000);
    i.execute();
}

uint16_t read_als() {
    auto i = XNM::I2C::MasterAction(0x23);
    uint8_t res[2] = {};
    
    i.read(res, 2);
    i.execute();

    return uint16_t(res[0]) << 8 | uint16_t(res[1]);
}

void flash_task(void *args) {
    test.init();

    static uint8_t bMod = 0;

    static  TickType_t face_transition_start = 0;
    static  int last_face_id = 0;

    while(true) {
        vTaskDelay(25/portTICK_PERIOD_MS);


        auto &c = test.colors;

        int current_face_id = (xTaskGetTickCount()/5000) % 3 + 1;
        if(global_face > -1)
            current_face_id = global_face;
        if(face_override > -1)
            current_face_id = face_override;

        if(XNM::NetHelpers::get_state() == XNM::NetHelpers::DOWNLOADING_OTA)
            current_face_id = 4;

        current_face_id = std::max(std::min(4, current_face_id), 0);
        
        if(face_transition_start == 0 && (last_face_id != current_face_id)) {
            face_transition_start = xTaskGetTickCount();
        }
        else if((xTaskGetTickCount() - face_transition_start) > 1000) {
            last_face_id = current_face_id;
            face_transition_start = 0;
        }

        auto &face_a = DURG::faces[last_face_id];
        auto &face_b = DURG::faces[current_face_id];

        int amount = 0;
        if(face_transition_start != 0)
            amount = std::min<int>(255, (xTaskGetTickCount() - face_transition_start) * 255 / 1000);
        
        for(int i=0; i<DURG::led_positions.size(); i++) {
            c[i] = face_a.colors[DURG::led_positions[i].t];
        
            c[i].merge_transition(face_b.colors[DURG::led_positions[i].t], 255*amount);
        
            if(DURG::led_positions[i].t == 2) {
                switch(XNM::NetHelpers::get_state()) {
                    default: break;
                    case XNM::NetHelpers::DOWNLOADING_OTA: c[i] = Material::BLUE; break;
                    case XNM::NetHelpers::WIFI_CONNECTING: c[i] = Material::RED; break;
                }
            }
            
            if(DURG::led_positions[i].t > 1)
                c[i].bMod(150);
        }

        auto adj_als = als_val;

        smoothed_als = 0.992F*smoothed_als + 0.008F*adj_als;

        bMod = 90 * sqrtf(std::min<float>(1, std::max<float>(0, (smoothed_als - 5.0F)/(30.0F - 5.0F))));

        if(brightness_override > -1)
            bMod = brightness_override;

        for (int i = 0; i < test.colors.length(); i++)
            test.colors[i].bMod(bMod);

        test.update();
    }
}

extern "C"
void app_main(void)
{
    XNM::I2C::MasterAction::init(GPIO_NUM_8, GPIO_NUM_2, 0, 10000);

    // Initialize NVS — it is used to store PHY calibration data
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND)
    {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);

    esp_event_loop_create_default();
    esp_event_loop_init(event_handler, nullptr);

    printf("Minimum free heap size: %d bytes\n", esp_get_minimum_free_heap_size());

    xTaskCreate(flash_task, "LEDs", 4096, nullptr, 20, nullptr);

    face_property.on_get_state = face_get_json;
    face_property.on_process = face_set_json;

    face_property.init();

    XNM::NetHelpers::mqtt.subscribe_to("/esp32/dragons-grace/xaseiresh", [](Xasin::MQTT::MQTT_Packet data) {
        global_face = std::min<int>(3, atoi(data.data.data()));
    });

    init_als();
    vTaskDelay(100);
    als_val = read_als();

    XNM::NetHelpers::init_global_r3_ca();
    XNM::NetHelpers::init();

    booper.init();

    while(true) {
       vTaskDelay(300);

        als_val = read_als();
    }

    printf("Restarting now.\n");
    fflush(stdout);
    esp_restart();
}
