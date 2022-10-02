#ifndef __GAME_STATE_H__
#define __GAME_STATE_H__

// ------------------------------------------------------------------------------------

enum e_game_state
{
	splash			= 1 << 0,
	title			= 1 << 1,
	enter_password	= 1 << 2,
	chapter_intro	= 1 << 3,
	game			= 1 << 4,
	pause			= 1 << 5,
	credits			= 1 << 6
};

#endif // __GAME_STATE_H__
