;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _wait_vbls_done
	.globl _title_exit
	.globl _title_update
	.globl _title_enter
	.globl _splash_exit
	.globl _splash_update
	.globl _splash_enter
	.globl _pause_exit
	.globl _pause_update
	.globl _pause_enter
	.globl _password_exit
	.globl _password_update
	.globl _password_enter
	.globl _game_exit
	.globl _game_update
	.globl _game_enter
	.globl _credits_exit
	.globl _credits_update
	.globl _credits_enter
	.globl _chapter_intro_exit
	.globl _chapter_intro_update
	.globl _chapter_intro_enter
	.globl _update_input_state
	.globl _wait_vbl_done
	.globl _joypad
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
;utility.h:8: void wait_vbls_done(uint8_t num_loops)
;	---------------------------------
; Function wait_vbls_done
; ---------------------------------
_wait_vbls_done::
;utility.h:10: for (uint8_t loop_counter = 0; loop_counter < num_loops; ++loop_counter)
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;utility.h:12: wait_vbl_done();
	call	_wait_vbl_done
;utility.h:10: for (uint8_t loop_counter = 0; loop_counter < num_loops; ++loop_counter)
	inc	c
;utility.h:14: }
	jr	00103$
_SCREEN_MIN_X:
	.db #0x08	; 8
_SCREEN_MIN_Y:
	.db #0x10	; 16
_SCREEN_WIDTH:
	.db #0xa0	; 160
_SCREEN_HEIGHT:
	.db #0x90	; 144
_SPRITE_TILE_WIDTH:
	.db #0x08	; 8
_SPRITE_TILE_HEIGHT:
	.db #0x08	; 8
;main.c:18: int main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-58
;main.c:20: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:21: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:24: input_state.current_state = 0x00;
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de), a
;main.c:25: input_state.previous_state = 0x00;
	xor	a, a
	ld	(bc), a
;main.c:26: input_state.depressed_buttons = 0x00;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;main.c:27: input_state.held_buttons = 0x00;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;main.c:28: input_state.released_buttons = 0x00;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;main.c:30: void (*enter_state_funcs[7])() =
	ldhl	sp,	#5
	ld	a, l
	ld	d, h
	ldhl	sp,	#47
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #<(_splash_enter)
	inc	hl
	ld	(hl), #>(_splash_enter)
	ldhl	sp,	#47
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	ld	a, #<(_title_enter)
	ld	(de), a
	inc	de
	ld	a, #>(_title_enter)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_password_enter)
	inc	de
	ld	a, #>(_password_enter)
	ld	(de), a
	ldhl	sp,#47
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_chapter_intro_enter)
	inc	de
	ld	a, #>(_chapter_intro_enter)
	ld	(de), a
	ldhl	sp,#47
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_game_enter)
	inc	de
	ld	a, #>(_game_enter)
	ld	(de), a
	ldhl	sp,#47
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_pause_enter)
	inc	de
	ld	a, #>(_pause_enter)
	ld	(de), a
	ldhl	sp,#47
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_credits_enter)
	inc	de
	ld	a, #>(_credits_enter)
	ld	(de), a
;main.c:41: uint8_t (*update_state_funcs[7])(struct input_state*) =
	ldhl	sp,	#19
	ld	a, l
	ld	d, h
	ldhl	sp,	#49
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #<(_splash_update)
	inc	hl
	ld	(hl), #>(_splash_update)
	ldhl	sp,	#49
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	ld	a, #<(_title_update)
	ld	(de), a
	inc	de
	ld	a, #>(_title_update)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_password_update)
	inc	de
	ld	a, #>(_password_update)
	ld	(de), a
	ldhl	sp,#49
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_chapter_intro_update)
	inc	de
	ld	a, #>(_chapter_intro_update)
	ld	(de), a
	ldhl	sp,#49
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_game_update)
	inc	de
	ld	a, #>(_game_update)
	ld	(de), a
	ldhl	sp,#49
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_pause_update)
	inc	de
	ld	a, #>(_pause_update)
	ld	(de), a
	ldhl	sp,#49
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_credits_update)
	inc	de
	ld	a, #>(_credits_update)
	ld	(de), a
;main.c:52: void (*exit_state_funcs[7])() =
	ldhl	sp,	#33
	ld	a, l
	ld	d, h
	ldhl	sp,	#51
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #<(_splash_exit)
	inc	hl
	ld	(hl), #>(_splash_exit)
	ldhl	sp,	#51
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	ld	a, #<(_title_exit)
	ld	(de), a
	inc	de
	ld	a, #>(_title_exit)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_password_exit)
	inc	de
	ld	a, #>(_password_exit)
	ld	(de), a
	ldhl	sp,#51
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_chapter_intro_exit)
	inc	de
	ld	a, #>(_chapter_intro_exit)
	ld	(de), a
	ldhl	sp,#51
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_game_exit)
	inc	de
	ld	a, #>(_game_exit)
	ld	(de), a
	ldhl	sp,#51
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_pause_exit)
	inc	de
	ld	a, #>(_pause_exit)
	ld	(de), a
	ldhl	sp,#51
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #<(_credits_exit)
	inc	de
	ld	a, #>(_credits_exit)
	ld	(de), a
;main.c:63: uint8_t game_state = gs_title;
	ldhl	sp,	#57
	ld	(hl), #0x01
;main.c:64: (enter_state_funcs[game_state])();
	push	bc
	call	_title_enter
	pop	bc
;main.c:66: while (1)
00104$:
;main.c:68: update_input_state(&input_state, joypad());
	call	_joypad
	ld	a, e
	ld	e, c
	ld	d, b
	push	bc
	push	af
	inc	sp
	push	de
	call	_update_input_state
	add	sp, #3
	pop	bc
;main.c:70: uint8_t next_game_state = (update_state_funcs[game_state])(&input_state);
	ldhl	sp,	#57
	ld	a, (hl)
	ld	e, #0x00
	add	a, a
	rl	e
	ldhl	sp,	#53
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,#49
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#53
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#57
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#56
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	___sdcc_call_hl
	pop	hl
	ld	a, e
	pop	bc
	ldhl	sp,	#55
;main.c:71: if (next_game_state != game_state)
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	Z, 00102$
;main.c:73: (exit_state_funcs[game_state])();
	ldhl	sp,#51
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#58
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#57
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	___sdcc_call_hl
	pop	bc
;main.c:74: game_state = next_game_state;
	ldhl	sp,	#55
	ld	a, (hl+)
	inc	hl
;main.c:75: (enter_state_funcs[game_state])();
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ld	d, #0x00
	add	a, a
	rl	d
	ld	e, a
	ldhl	sp,	#47
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#57
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#56
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	___sdcc_call_hl
	pop	bc
00102$:
;main.c:78: wait_vbls_done(1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_wait_vbls_done
	inc	sp
	pop	bc
	jp	00104$
;main.c:80: }
	add	sp, #58
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
