#include "game-state-chapter-intro.h"
#include <gb\gb.h>
#include "basic-font-words.h"
#include "constants.h"
#include "game-state.h"

// ------------------------------------------------------------------------------------

void chapter_intro_enter()
{
	// load font sprites
	set_sprite_data(0, 38, k_basic_font_sprites);

	// "GRIDWALKER"
	create_basic_font_word(&k_chapter_word_sprites[0],
		7,
		0,
		SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
		SCREEN_MIN_Y + (3 * SPRITE_TILE_HEIGHT),
		SPRITE_TILE_WIDTH,
		0);
}

uint8_t chapter_intro_update(struct input_state* input_state)
{
	if (was_input_depressed(input_state, btn_select))
	{
		return gs_title;
	}

	return gs_chapter_intro;
}

void chapter_intro_exit()
{
	for (int i = 0; i < 7; ++i)
	{
		move_sprite(i, 0, 0);
	}
}
