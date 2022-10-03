#ifndef __INPUT_H__
#define __INPUT_H__

#include <stdint.h>

// ------------------------------------------------------------------------------------

enum e_buttons
{
	btn_a		= 0,
	btn_b		= 1,
	btn_up		= 2,
	btn_down	= 3,
	btn_left	= 4,
	btn_right	= 5,
	btn_start	= 6,
	btn_select	= 7,
};

// ------------------------------------------------------------------------------------

struct input_state
{
	uint8_t previous_state;
	uint8_t current_state;
	uint8_t held_buttons;
	uint8_t depressed_buttons;
	uint8_t released_buttons;
};

// ------------------------------------------------------------------------------------

void update_input_state(struct input_state* is, uint8_t button_state);
uint8_t was_input_depressed(struct input_state* is, uint8_t button);
uint8_t was_input_released(struct input_state* is, uint8_t button);
uint8_t is_input_held(struct input_state* is, uint8_t button);

#endif // __INPUT_H__
