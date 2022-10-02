#include "game-state-title.h"
#include <gb\gb.h>
#include "basic-font-words.h"
#include "constants.h"

// ------------------------------------------------------------------------------------

void title_enter()
{
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

void title_update()
{
	;
}

void title_exit()
{
	;
}
