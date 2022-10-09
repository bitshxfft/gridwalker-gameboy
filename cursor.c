#include "cursor.h"
#include <gb\gb.h>
#include "sprites/cursor-sprites.h"

// ------------------------------------------------------------------------------------

void create_cursor(
	struct cursor* cursor,
	uint8_t cursor_type,
	uint8_t tile_index_start,
	uint8_t position_x,
	uint8_t position_y,
	uint8_t size_x,
	uint8_t size_y)
{
	cursor->cursor_type = cursor_type;

	switch (cursor_type)
	{
		case cursor_single_piece:
		{
			set_sprite_data(2, 1, k_cursor_sprites);
			set_sprite_tile(tile_index_start, 0);
			cursor->size_x = 8;
			cursor->size_y = 8;
			cursor->start_sprite_index = tile_index_start;
			cursor->end_sprite_index = tile_index_start;
			break;
		}

		case cursor_two_piece:
		{
			set_sprite_data(0, 2, k_cursor_sprites);
			set_sprite_tile(tile_index_start, 0);
			set_sprite_tile(tile_index_start + 1, 0);
			cursor->size_x = size_x;
			cursor->size_y = 8;
			cursor->start_sprite_index = tile_index_start;
			cursor->end_sprite_index = tile_index_start + 1;
			break;
		}

		case cursor_four_piece:
		{
			set_sprite_data(3, 4, k_cursor_sprites);
			for (uint8_t i = 0; i < 4; ++i)
			{
				set_sprite_tile(tile_index_start + i, i);
			}

			cursor->size_x = size_x;
			cursor->size_y = size_y;
			cursor->start_sprite_index = tile_index_start;
			cursor->end_sprite_index = tile_index_start + 3;
			break;
		}
	}

	move_cursor(cursor, position_x, position_y);
}

void move_cursor(struct cursor* cursor, uint8_t position_x, uint8_t position_y)
{
	cursor->position_x = position_x;
	cursor->position_y = position_y;

	switch (cursor->cursor_type)
	{
		case cursor_single_piece:
		{
			move_sprite(cursor->start_sprite_index, position_x, position_y);
			break;
		}

		case cursor_two_piece:
		{
			// left
			move_sprite(cursor->start_sprite_index, position_x, position_y);
			// right
			move_sprite(cursor->start_sprite_index + 1, (position_x + cursor->size_x) - 3, position_y);
			break;
		}

		case cursor_four_piece:
		{
			uint8_t max_x = (position_x + cursor->size_x) - 5;
			uint8_t max_y = (position_y + cursor->size_y) - 5;

			// bottom left
			move_sprite(cursor->start_sprite_index, position_x, max_y);
			// top left
			move_sprite(cursor->start_sprite_index + 1, position_x, position_y);
			// top right
			move_sprite(cursor->start_sprite_index + 2, max_x, position_y);
			// bottom right
			move_sprite(cursor->start_sprite_index + 3, max_x, max_y);
			break;
		}
	}
}

void hide_cursor(struct cursor* cursor)
{
	for (uint8_t i = cursor->start_sprite_index; i <= cursor->end_sprite_index; ++i)
	{
		move_sprite(i, 0, 0);
	}
}