#ifndef __BASIC_FONT_WORDS_H__
#define __BASIC_FONT_WORDS_H__

#include "sprites/basic-font.h"

// ------------------------------------------------------------------------------------

void draw_basic_font_word(
	const uint8_t* characters,
	uint8_t character_count,
	uint8_t tile_index_start,
	uint8_t start_position_x,
	uint8_t start_position_y,
	uint8_t position_step_x,
	uint8_t position_step_y);

// ------------------------------------------------------------------------------------

extern const uint8_t k_gridwalker_word_sprites[];
extern const uint8_t k_new_game_word_sprites[];
extern const uint8_t k_continue_word_sprites[];

#endif // __BASIC_FONT_WORDS_H__