#include "game-state-password.h"
#include <gb\gb.h>
#include "sprites\password-background-sprites.h"
#include "backgrounds\password-background-map.h"
#include "cursor.h"
#include "game-state.h"

// ------------------------------------------------------------------------------------

struct cursor _cursor;

// ------------------------------------------------------------------------------------

void password_enter()
{
	// load background data
	set_bkg_data(0, 66, k_password_background_sprites);
	set_bkg_tiles(0, 0, 20, 18, k_password_background_map);

	// create cursor
	struct cursor cursor;
	create_cursor(&cursor, cursor_single_piece, 0, 10, 18, 8, 8);
}

uint8_t password_update(struct input_state* input_state)
{
	input_state;

	return gs_enter_password;
}

void password_exit()
{
	;
}
