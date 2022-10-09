#ifndef __GAME_STATE_PASSWORD_H__
#define __GAME_STATE_PASSWORD_H__

#include <stdint.h>
#include "cursor.h"
#include "input.h"

// ------------------------------------------------------------------------------------

void password_enter();
uint8_t password_update(struct input_state* input_state);
void password_exit();

#endif // __GAME_STATE_PASSWORD_H__