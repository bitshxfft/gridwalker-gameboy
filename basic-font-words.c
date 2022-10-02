#include "basic-font-words.h"
#include <gb\gb.h>

// ------------------------------------------------------------------------------------

const uint8_t k_gridwalker_word_sprites[] =
{
	BASIC_FONT_G,
	BASIC_FONT_R,
	BASIC_FONT_I,
	BASIC_FONT_D,
	BASIC_FONT_W,
	BASIC_FONT_A,
	BASIC_FONT_L,
	BASIC_FONT_K,
	BASIC_FONT_E,
	BASIC_FONT_R
};

const uint8_t k_new_game_word_sprites[] =
{
	BASIC_FONT_N,
	BASIC_FONT_E,
	BASIC_FONT_W,
	BASIC_FONT_SKIP_CHARACTER,
	BASIC_FONT_G,
	BASIC_FONT_A,
	BASIC_FONT_M,
	BASIC_FONT_E
};

const uint8_t k_continue_word_sprites[] =
{
	BASIC_FONT_C,
	BASIC_FONT_O,
	BASIC_FONT_N,
	BASIC_FONT_T,
	BASIC_FONT_I,
	BASIC_FONT_N,
	BASIC_FONT_U,
	BASIC_FONT_E
};

// ------------------------------------------------------------------------------------

void draw_basic_font_word(
	const uint8_t* characters,
	uint8_t character_count,
	uint8_t tile_index_start,
	uint8_t start_position_x,
	uint8_t start_position_y,
	uint8_t position_step_x,
	uint8_t position_step_y)
{
	for (uint8_t i = 0; i < character_count; ++i)
	{
		uint8_t character = characters[i];

		if (character == BASIC_FONT_SKIP_CHARACTER)
		{
			continue;
		}

		set_sprite_tile(tile_index_start + i, character);
		move_sprite(
			tile_index_start + i,
			start_position_x + (i * position_step_x),
			start_position_y + (i * position_step_y));
	}
}
