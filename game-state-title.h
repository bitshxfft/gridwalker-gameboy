#ifndef __GAME_STATE_TITLE_H__
#define __GAME_STATE_TITLE_H__

#include <stdint.h>
#include "input.h"

// ------------------------------------------------------------------------------------

void title_enter();
uint8_t title_update(struct input_state* input_state);
void title_exit();

#endif // __GAME_STATE_TITLE_H__