#ifndef __CURSOR_H__
#define __CURSOR_H__

#include <stdint.h>

// ------------------------------------------------------------------------------------

enum e_cursor
{
	single_piece,
	two_piece,
	four_piece,
	eight_piece
};

// ------------------------------------------------------------------------------------

struct cursor
{
	uint8_t start_sprite_index;
	uint8_t end_sprite_index;
	uint8_t position_x;
	uint8_t position_y;
	uint8_t size_x;
	uint8_t size_y;
};

// ------------------------------------------------------------------------------------

struct cursor create_cursor(
	uint8_t cursor_type,
	uint8_t start_sprite_index,
	uint8_t position_x,
	uint8_t position_y,
	uint8_t size_x,
	uint8_t size_y);

void move_cursor(struct cursor* cursor, uint8_t position_x, uint8_t position_y);

void hide_cursor(struct cursor* cursor);

#endif // __CURSOR_H__