#ifndef __GAME_STATE_CHAPTER_INTRO_H__
#define __GAME_STATE_CHAPTER_INTRO_H__

#include <stdint.h>
#include "input.h"

// ------------------------------------------------------------------------------------

void chapter_intro_enter();
uint8_t chapter_intro_update(struct input_state* input_state);
void chapter_intro_exit();

#endif // __GAME_STATE_CHAPTER_INTRO_H__