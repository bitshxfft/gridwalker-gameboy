#include "cursor.h"
#include "sprites/cursor-sprites.h"

// ------------------------------------------------------------------------------------

struct cursor create_cursor(
	uint8_t cursor_type,
	uint8_t start_sprite_index,
	uint8_t position_x,
	uint8_t position_y,
	uint8_t size_x,
	uint8_t size_y)
{
	// #TODO: create cursor struct with given params
	// - load sprites
	// - position sprites
	// - create and return cursor struct

	switch (cursor_type)
	{
		case single_piece:
		{
			break;
		}

		case two_piece:
		{
			break;
		}

		case four_piece:
		{
			break;
		}

		case eight_piece:
		{
			break;
		}
	}
}

void move_cursor(struct cursor* cursor, uint8_t position_x, uint8_t position_y)
{
	// #TODO: move cursor and update cursor struct with given params
}

void hide_cursor(struct cursor* cursor)
{
	// #TODO: hide cursor (set all sprites off-screen) and update cursor struct
}