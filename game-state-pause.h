#ifndef __GAME_STATE_PAUSE_H__
#define __GAME_STATE_PAUSE_H__

#include <stdint.h>
#include "input.h"

// ------------------------------------------------------------------------------------

void pause_enter();
uint8_t pause_update(struct input_state* input_state);
void pause_exit();

#endif // __GAME_STATE_PAUSE_H__
