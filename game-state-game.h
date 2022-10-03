#ifndef __GAME_STATE_GAME_H__
#define __GAME_STATE_GAME_H__

#include <stdint.h>
#include "input.h"

// ------------------------------------------------------------------------------------

void game_enter();
uint8_t game_update(struct input_state* input_state);
void game_exit();

#endif // __GAME_STATE_GAME_H__