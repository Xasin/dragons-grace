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

XNM::Neo::NeoController test(GPIO_NUM_6, RMT_CHANNEL_0, 20);

XNM::I2C::AW9201 booper;

esp_err_t event_handler(void *context, system_event_t *event)
{
    XNM::NetHelpers::event_handler(event);
    return ESP_OK;
}

void flash_task(void *args) {
    test.init();

    while(true) {
        vTaskDelay(25/portTICK_PERIOD_MS);

        for (int i = 0; i < test.colors.length(); i++)
            test.colors[i] = XNM::Neo::Color::HSV(xTaskGetTickCount() / 30.0F, 255, 60);

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

    XNM::NetHelpers::WIFI::set_nvs("TP-LINK_84CDC2", "f36eebda48");
    Xasin::MQTT::Handler::set_nvs_uri("mqtts://xaseiresh.hopto.org");

    XNM::NetHelpers::init_global_r3_ca();
    XNM::NetHelpers::init();

    booper.init();

    for(int i=0; i<127; i++) {
        vTaskDelay(10);

        if(XNM::I2C::MasterAction::poke(i) == ESP_OK)
            ESP_LOGI("I2C", "Got address %x", i);
    }

    while(true) {
       vTaskDelay(100);

        booper.update();
        if(booper.is_touched())
            ESP_LOGI("BOOPR", "I am %stouched! Value is %d", booper.is_touched() ? "" : "not ", booper.cap_value());
    }

    printf("Restarting now.\n");
    fflush(stdout);
    esp_restart();
}
