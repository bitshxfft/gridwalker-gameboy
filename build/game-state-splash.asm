;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module game_state_splash
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _splash_enter
	.globl _splash_update
	.globl _splash_exit
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
;game-state-splash.c:6: void splash_enter()
;	---------------------------------
; Function splash_enter
; ---------------------------------
_splash_enter::
;game-state-splash.c:9: }
	ret
;game-state-splash.c:11: uint8_t splash_update(struct input_state* input_state)
;	---------------------------------
; Function splash_update
; ---------------------------------
_splash_update::
;game-state-splash.c:15: return gs_pause;
	ld	e, #0x05
;game-state-splash.c:16: }
	ret
;game-state-splash.c:18: void splash_exit()
;	---------------------------------
; Function splash_exit
; ---------------------------------
_splash_exit::
;game-state-splash.c:21: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
