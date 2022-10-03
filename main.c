#include <gb/gb.h>
#include "basic-font-words.h"
#include "constants.h"
#include "game-state.h"
#include "game-state-chapter-intro.h"
#include "game-state-credits.h"
#include "game-state-game.h"
#include "game-state-password.h"
#include "game-state-pause.h"
#include "game-state-splash.h"
#include "game-state-title.h"
#include "input.h"
#include "sprites/basic-font.h"
#include "utility.h"

// ------------------------------------------------------------------------------------

int main()
{
	SHOW_SPRITES;
	DISPLAY_ON;

	struct input_state input_state;
	input_state.current_state = 0x00;
	input_state.previous_state = 0x00;
	input_state.depressed_buttons = 0x00;
	input_state.held_buttons = 0x00;
	input_state.released_buttons = 0x00;

	void (*enter_state_funcs[7])() =
	{
		splash_enter,
		title_enter,
		password_enter,
		chapter_intro_enter,
		game_enter,
		pause_enter,
		credits_enter
	};

	uint8_t (*update_state_funcs[7])(struct input_state*) =
	{
		splash_update,
		title_update,
		password_update,
		chapter_intro_update,
		game_update,
		pause_update,
		credits_update
	};

	void (*exit_state_funcs[7])() =
	{
		splash_exit,
		title_exit,
		password_exit,
		chapter_intro_exit,
		game_exit,
		pause_exit,
		credits_exit
	};

	uint8_t game_state = gs_title;
	(enter_state_funcs[game_state])();

	while (1)
	{
		update_input_state(&input_state, joypad());

		uint8_t next_game_state = (update_state_funcs[game_state])(&input_state);
		if (next_game_state != game_state)
		{
			(exit_state_funcs[game_state])();
			game_state = next_game_state;
			(enter_state_funcs[game_state])();
		}

		wait_vbls_done(1);
	}
}