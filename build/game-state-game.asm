;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module game_state_game
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _game_enter
	.globl _game_update
	.globl _game_exit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;game-state-game.c:6: void game_enter()
;	---------------------------------
; Function game_enter
; ---------------------------------
_game_enter::
;game-state-game.c:9: }
	ret
;game-state-game.c:11: uint8_t game_update(struct input_state* input_state)
;	---------------------------------
; Function game_update
; ---------------------------------
_game_update::
;game-state-game.c:15: return gs_game;
	ld	e, #0x04
;game-state-game.c:16: }
	ret
;game-state-game.c:18: void game_exit()
;	---------------------------------
; Function game_exit
; ---------------------------------
_game_exit::
;game-state-game.c:21: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
