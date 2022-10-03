#include "game-state-splash.h"
#include "game-state.h"

// ------------------------------------------------------------------------------------

void splash_enter()
{
	;
}

uint8_t splash_update(struct input_state* input_state)
{
	input_state;

	return gs_pause;
}

void splash_exit()
{
	;
}
