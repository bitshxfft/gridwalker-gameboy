#ifndef __CURSOR_H__
#define __CURSOR_H__

#include <stdint.h>

// ------------------------------------------------------------------------------------

enum e_cursor
{
	cursor_single_piece,
	cursor_two_piece,
	cursor_four_piece,
};

// ------------------------------------------------------------------------------------

struct cursor
{
	uint8_t cursor_type;
	uint8_t start_sprite_index;
	uint8_t end_sprite_index;
	uint8_t position_x;
	uint8_t position_y;
	uint8_t size_x;
	uint8_t size_y;
};

// ------------------------------------------------------------------------------------

void create_cursor(
	struct cursor* cursor,
	uint8_t cursor_type,
	uint8_t tile_index_start,
	uint8_t position_x,
	uint8_t position_y,
	uint8_t size_x,
	uint8_t size_y);

void move_cursor(struct cursor* cursor, uint8_t position_x, uint8_t position_y);

void hide_cursor(struct cursor* cursor);

#endif // __CURSOR_H__