#include <avr/io.h>
#include <util/delay.h>

#define LED_1_ID                7
#define LED_2_ID                6
#define LED_3_ID                5
#define LED_4_ID                4

enum leds {
        led1 = 0,
        led2,
        led3,
        led4
};

uint8_t get_pin(enum leds led)
{
        uint8_t ret;

        switch (led) {
        case led1:
                ret = LED_1_ID;
                break;
        case led2:
                ret = LED_2_ID;
                break;
        case led3:
                ret = LED_3_ID;
                break;
        case led4:
                ret = LED_4_ID;
                break;
        default:
                ret = LED_1_ID;
                break;
        }

        return ret;
}

void led_init(void)
{
        // set led pins to output
        DDRC |= (1 << LED_1_ID) | (1 << LED_2_ID) | (1 << LED_3_ID) | (1 << LED_4_ID);
}

void led_set(enum leds led)
{
        // set led pin high
        PORTC |= (1 << (get_pin(led)));
}

void led_reset(enum leds led)
{
        // set led pin low
        PORTC &= ~(1 << (get_pin(led)));
}

void led_toggle(enum leds led)
{
        // XOR to flip the pin
        PORTC ^= (1 << (get_pin(led)));
}

int main(void)
{
        led_init();

        while (1) {
                led_toggle(led1);
                _delay_ms(500);
        }

        return 0;
}
