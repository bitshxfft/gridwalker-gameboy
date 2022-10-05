#include "game-state-password.h"
#include <gb\gb.h>
#include "sprites\password-background-sprites.h"
#include "backgrounds\password-background-map.h"
#include "game-state.h"

// ------------------------------------------------------------------------------------

void password_enter()
{
	// load background data
	set_bkg_data(0, 66, k_password_background_sprites);
	set_bkg_tiles(0, 0, 20, 18, k_password_background_map);
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
