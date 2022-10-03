;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module game_state_pause
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _pause_enter
	.globl _pause_update
	.globl _pause_exit
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
;game-state-pause.c:6: void pause_enter()
;	---------------------------------
; Function pause_enter
; ---------------------------------
_pause_enter::
;game-state-pause.c:9: }
	ret
;game-state-pause.c:11: uint8_t pause_update(struct input_state* input_state)
;	---------------------------------
; Function pause_update
; ---------------------------------
_pause_update::
;game-state-pause.c:15: return gs_pause;
	ld	e, #0x05
;game-state-pause.c:16: }
	ret
;game-state-pause.c:18: void pause_exit()
;	---------------------------------
; Function pause_exit
; ---------------------------------
_pause_exit::
;game-state-pause.c:21: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
