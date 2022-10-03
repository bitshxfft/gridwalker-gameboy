#ifndef __GAME_STATE_SPLASH_H__
#define __GAME_STATE_SPLASH_H__

#include <stdint.h>
#include "input.h"

// ------------------------------------------------------------------------------------

void splash_enter();
uint8_t splash_update(struct input_state* input_state);
void splash_exit();

#endif // __GAME_STATE_SPLASH_H__