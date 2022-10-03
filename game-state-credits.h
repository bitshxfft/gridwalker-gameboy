#ifndef __GAME_STATE_CREDITS_H__
#define __GAME_STATE_CREDITS_H__

#include <stdint.h>
#include "input.h"

// ------------------------------------------------------------------------------------

void credits_enter();
uint8_t credits_update(struct input_state* input_state);
void credits_exit();

#endif // __GAME_STATE_CREDITS_H__