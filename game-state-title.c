#include "game-state-title.h"
#include <gb\gb.h>
#include "basic-font-words.h"
#include "constants.h"
#include "game-state.h"

// ------------------------------------------------------------------------------------

uint8_t menu_selection = 0;
uint8_t menu_options[2] = { gs_chapter_intro, gs_enter_password };

// ------------------------------------------------------------------------------------

void title_enter()
{
	menu_selection = 0;

	// load font sprites
	set_sprite_data(0, 38, basic_font_sprites);

	// "GRIDWALKER"
	draw_basic_font_word(&k_gridwalker_word_sprites[0],
		10,
		0,
		SCREEN_MIN_X + (5 * SPRITE_TILE_WIDTH),
		SCREEN_MIN_Y + (3 * SPRITE_TILE_HEIGHT),
		SPRITE_TILE_WIDTH,
		0);

	// "NEW GAME"
	draw_basic_font_word(&k_new_game_word_sprites[0],
		8,
		10,
		SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
		SCREEN_MIN_Y + (10 * SPRITE_TILE_HEIGHT),
		SPRITE_TILE_WIDTH,
		0);

	// "CONTINUE"
	draw_basic_font_word(&k_continue_word_sprites[0],
		8,
		18,
		SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
		SCREEN_MIN_Y + (12 * SPRITE_TILE_HEIGHT),
		SPRITE_TILE_WIDTH,
		0);
}

uint8_t title_update(struct input_state* input_state)
{
	if (was_input_depressed(input_state, btn_up)
		|| was_input_depressed(input_state, btn_down))
	{
		menu_selection ^= 0x01; // toggle between index 0 and 1
	}

	if (was_input_depressed(input_state, btn_start))
	{
		return menu_options[menu_selection];
	}

	return gs_title;
}

void title_exit()
{
	for (int i = 0; i < 26; ++i)
	{
		move_sprite(i, 0, 0);
	}
}
