#include "input.h"
#include <gb/gb.h>

// ------------------------------------------------------------------------------------

void update_input_state(struct input_state* is, uint8_t button_state)
{
	// cache our previous state
	is->previous_state = is->current_state;

	// set our current input state relative to the passed in button state
	is->current_state = ((button_state & J_A) == J_A) << btn_a;
	is->current_state |= ((button_state & J_B) == J_B) << btn_b;
	is->current_state |= ((button_state & J_UP) == J_UP) << btn_up;
	is->current_state |= ((button_state & J_DOWN) == J_DOWN) << btn_down;
	is->current_state |= ((button_state & J_LEFT) == J_LEFT) << btn_left;
	is->current_state |= ((button_state & J_RIGHT) == J_RIGHT) << btn_right;
	is->current_state |= ((button_state & J_START) == J_START) << btn_start;
	is->current_state |= ((button_state & J_SELECT) == J_SELECT) << btn_select;

	// calculate which buttons have been held
	is->held_buttons = is->previous_state & is->current_state;

	// calculate which buttons have just been depressed
	is->depressed_buttons = (is->current_state ^ is->held_buttons);

	// calculate which buttons have just been released
	is->released_buttons = (is->previous_state ^ is->held_buttons);
}

// ------------------------------------------------------------------------------------

uint8_t was_input_depressed(struct input_state* is, uint8_t button)
{
	return (is->depressed_buttons & (1 << button)) != 0x00;
}

uint8_t was_input_released(struct input_state* is, uint8_t button)
{
	return (is->released_buttons & (1 << button)) != 0x00;
}

uint8_t is_input_held(struct input_state* is, uint8_t button)
{
	return (is->held_buttons & (1 << button)) != 0x00;
}
