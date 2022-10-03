#include "game-state-pause.h"
#include "game-state.h"

// ------------------------------------------------------------------------------------

void pause_enter()
{
	;
}

uint8_t pause_update(struct input_state* input_state)
{
	input_state;

	return gs_pause;
}

void pause_exit()
{
	;
}
