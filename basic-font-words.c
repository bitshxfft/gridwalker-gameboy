#include "basic-font-words.h"
#include <gb\gb.h>
#include "sprites\gridwalker-sprites.h"

// ------------------------------------------------------------------------------------

const uint8_t k_new_game_word_sprites[] =
{
	SPRITE_BASIC_FONT_N_INDEX,
	SPRITE_BASIC_FONT_E_INDEX,
	SPRITE_BASIC_FONT_W_INDEX,
	SPRITE_EMPTY_INDEX,
	SPRITE_BASIC_FONT_G_INDEX,
	SPRITE_BASIC_FONT_A_INDEX,
	SPRITE_BASIC_FONT_M_INDEX,
	SPRITE_BASIC_FONT_E_INDEX
};

const uint8_t k_continue_word_sprites[] =
{
	SPRITE_BASIC_FONT_C_INDEX,
	SPRITE_BASIC_FONT_O_INDEX,
	SPRITE_BASIC_FONT_N_INDEX,
	SPRITE_BASIC_FONT_T_INDEX,
	SPRITE_BASIC_FONT_I_INDEX,
	SPRITE_BASIC_FONT_N_INDEX,
	SPRITE_BASIC_FONT_U_INDEX,
	SPRITE_BASIC_FONT_E_INDEX
};

const uint8_t k_password_word_sprites[] =
{
	SPRITE_BASIC_FONT_P_INDEX,
	SPRITE_BASIC_FONT_A_INDEX,
	SPRITE_BASIC_FONT_S_INDEX,
	SPRITE_BASIC_FONT_S_INDEX,
	SPRITE_BASIC_FONT_W_INDEX,
	SPRITE_BASIC_FONT_O_INDEX,
	SPRITE_BASIC_FONT_R_INDEX,
	SPRITE_BASIC_FONT_D_INDEX
};

const uint8_t k_chapter_word_sprites[] =
{
	SPRITE_BASIC_FONT_C_INDEX,
	SPRITE_BASIC_FONT_H_INDEX,
	SPRITE_BASIC_FONT_A_INDEX,
	SPRITE_BASIC_FONT_P_INDEX,
	SPRITE_BASIC_FONT_T_INDEX,
	SPRITE_BASIC_FONT_E_INDEX,
	SPRITE_BASIC_FONT_R_INDEX
};

// ------------------------------------------------------------------------------------

void create_basic_font_word(
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

		set_sprite_tile(tile_index_start + i, character);
		move_sprite(
			tile_index_start + i,
			start_position_x + (i * position_step_x),
			start_position_y + (i * position_step_y));
	}
}
