;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module game_state_credits
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _credits_enter
	.globl _credits_update
	.globl _credits_exit
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
;game-state-credits.c:6: void credits_enter()
;	---------------------------------
; Function credits_enter
; ---------------------------------
_credits_enter::
;game-state-credits.c:9: }
	ret
;game-state-credits.c:11: uint8_t credits_update(struct input_state* input_state)
;	---------------------------------
; Function credits_update
; ---------------------------------
_credits_update::
;game-state-credits.c:15: return gs_credits;
	ld	e, #0x06
;game-state-credits.c:16: }
	ret
;game-state-credits.c:18: void credits_exit()
;	---------------------------------
; Function credits_exit
; ---------------------------------
_credits_exit::
;game-state-credits.c:21: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
