#ifndef __GAME_STATE_H__
#define __GAME_STATE_H__

// ------------------------------------------------------------------------------------

enum e_game_state
{
	gs_splash			= 0,
	gs_title			= 1,
	gs_enter_password	= 2,
	gs_chapter_intro	= 3,
	gs_game				= 4,
	gs_pause			= 5,
	gs_credits			= 6
};

#endif // __GAME_STATE_H__
