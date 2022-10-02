#include <gb/gb.h>
#include "constants.h"
#include "input.h"
#include "sprites/basic-font.h"
#include "basic-font-words.h"
#include "utility.h"

// ------------------------------------------------------------------------------------

int main()
{
	SHOW_SPRITES;
	DISPLAY_ON;

	// #TODO: set up and show title state

	while (1)
	{
		wait_vbls_done(1);
	}
}