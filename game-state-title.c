#include "game-state-title.h"
#include <gb\gb.h>
#include "sprites\basic-font-sprites.h"
#include "sprites\title-background-sprites.h"
#include "backgrounds\title-background-map.h"
#include "basic-font-words.h"
#include "constants.h"
#include "game-state.h"

// ------------------------------------------------------------------------------------

void on_title_menu_selection_updated();

// ------------------------------------------------------------------------------------

uint8_t menu_selection = 0;
uint8_t menu_options[2] = { gs_enter_password, gs_chapter_intro };

// ------------------------------------------------------------------------------------

void title_enter()
{
	menu_selection = 0;

	// load background data
	set_bkg_data(0, 61, k_title_background_sprites);
	set_bkg_tiles(0, 0, 20, 18, k_title_background_map);

	// load font sprites
	set_sprite_data(0, 38, k_basic_font_sprites);

	// "CONTINUE"
	create_basic_font_word(&k_continue_word_sprites[0],
		8,
		0,
		SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
		SCREEN_MIN_Y + (10 * SPRITE_TILE_HEIGHT),
		SPRITE_TILE_WIDTH,
		0);

	// "NEW GAME"
	create_basic_font_word(&k_new_game_word_sprites[0], 8, 8, 0, 0, 0, 0);
}

uint8_t title_update(struct input_state* input_state)
{
	if (was_input_depressed(input_state, btn_up)
		|| was_input_depressed(input_state, btn_down))
	{
		menu_selection ^= 0x01; // toggle between index 0 and 1
		on_title_menu_selection_updated();
	}

	if (was_input_depressed(input_state, btn_start))
	{
		return menu_options[menu_selection];
	}

	return gs_title;
}

void title_exit()
{
	for (int i = 0; i < 16; ++i)
	{
		move_sprite(i, 0, 0);
	}
}

// ------------------------------------------------------------------------------------

void on_title_menu_selection_updated()
{
	uint8_t i = 0;
	uint8_t selected_x = SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH);

	if (menu_selection == 0x01)
	{
		// move "CONTINUE" sprites off screen
		for (i = 0; i < 8; ++i)
		{
			move_sprite(i, 0, 0);
		}

		// move "NEW GAME" sprites on screen
		uint8_t y = SCREEN_MIN_Y + (12 * SPRITE_TILE_HEIGHT);
		for (i = 8; i < 16; ++i)
		{
			move_sprite(i, selected_x, y);
			selected_x += SPRITE_TILE_WIDTH;
		}
	}
	else
	{
		// move "NEW GAME" sprites off screen
		for (i = 8; i < 16; ++i)
		{
			move_sprite(i, 0, 0);
		}

		// move "CONTINUE" sprites on screen
		uint8_t y = SCREEN_MIN_Y + (10 * SPRITE_TILE_HEIGHT);
		for (i = 0; i < 8; ++i)
		{
			move_sprite(i, selected_x, y);
			selected_x += SPRITE_TILE_WIDTH;
		}
	}
}
