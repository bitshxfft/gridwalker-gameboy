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
	.globl _draw_basic_font_word
	.globl _is_input_held
	.globl _was_input_released
	.globl _was_input_depressed
	.globl _update_input_state
	.globl _set_sprite_data
	.globl _wait_vbl_done
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
;input.h:33: void update_input_state(struct input_state* is, uint8_t button_state)
;	---------------------------------
; Function update_input_state
; ---------------------------------
_update_input_state::
	add	sp, #-5
;input.h:36: is->previous_state = is->current_state;
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	pop	bc
	push	bc
	inc	bc
	ld	a, (bc)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (hl)
	ld	(de), a
;input.h:39: is->current_state = ((button_state & J_A) == J_A) << btn_a;
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	and	a, #0x10
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, #0x10
	or	a, d
	ld	a, #0x01
	jr	Z, 00104$
	xor	a, a
00104$:
;input.h:40: is->current_state |= ((button_state & J_B) == J_B) << btn_b;
	ld	(bc), a
	ld	e, a
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x20
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	sub	a, #0x20
	or	a, l
	ld	a, #0x01
	jr	Z, 00106$
	xor	a, a
00106$:
	add	a, a
	or	a, e
	ld	e, a
	ld	(bc), a
;input.h:41: is->current_state |= ((button_state & J_UP) == J_UP) << btn_up;
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	sub	a, #0x04
	or	a, l
	ld	a, #0x01
	jr	Z, 00108$
	xor	a, a
00108$:
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	(bc), a
;input.h:42: is->current_state |= ((button_state & J_DOWN) == J_DOWN) << btn_down;
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x08
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	sub	a, #0x08
	or	a, l
	ld	a, #0x01
	jr	Z, 00110$
	xor	a, a
00110$:
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	(bc), a
;input.h:43: is->current_state |= ((button_state & J_LEFT) == J_LEFT) << btn_left;
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x02
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	sub	a, #0x02
	or	a, l
	ld	a, #0x01
	jr	Z, 00112$
	xor	a, a
00112$:
	swap	a
	and	a, #0xf0
	or	a, e
	ld	e, a
	ld	(bc), a
;input.h:44: is->current_state |= ((button_state & J_RIGHT) == J_RIGHT) << btn_right;
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	dec	a
	or	a, l
	ld	a, #0x01
	jr	Z, 00114$
	xor	a, a
00114$:
	swap	a
	rlca
	and	a, #0xe0
	or	a, e
	ld	e, a
	ld	(bc), a
;input.h:45: is->current_state |= ((button_state & J_START) == J_START) << btn_start;
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x80
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	sub	a, #0x80
	or	a, l
	ld	a, #0x01
	jr	Z, 00116$
	xor	a, a
00116$:
	rrca
	rrca
	and	a, #0xc0
	or	a, e
	ld	e, a
	ld	(bc), a
;input.h:46: is->current_state |= ((button_state & J_SELECT) == J_SELECT) << btn_select;
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x40
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	sub	a, #0x40
	or	a, l
	ld	a, #0x01
	jr	Z, 00118$
	xor	a, a
00118$:
	rrca
	and	a, #0x80
	or	a, e
	ld	d, a
	ld	(bc), a
;input.h:49: is->held_buttons = is->previous_state & is->current_state;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ldhl	sp,	#2
;input.h:52: is->depressed_buttons = (is->current_state ^ is->held_buttons);
;input.h:55: is->released_buttons = (is->previous_state ^ is->held_buttons);
	ld	a, (hl-)
	dec	hl
	and	a, d
	ld	e, a
	ld	(bc), a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, d
	xor	a, e
	ld	(bc), a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl)
	xor	a, e
	ld	(bc), a
;input.h:56: }
	add	sp, #5
	ret
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
;input.h:60: uint8_t was_input_depressed(struct input_state* is, uint8_t button)
;	---------------------------------
; Function was_input_depressed
; ---------------------------------
_was_input_depressed::
;input.h:62: return (is->depressed_buttons & (1 << button)) != 0x00;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, (hl)
	ld	hl, #0x0001
	inc	c
	jr	00104$
00103$:
	add	hl, hl
00104$:
	dec	c
	jr	NZ,00103$
	ld	c, #0x00
	and	a, l
	ld	e, a
	ld	a, c
	and	a, h
	or	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	e, a
;input.h:63: }
	ret
;input.h:65: uint8_t was_input_released(struct input_state* is, uint8_t button)
;	---------------------------------
; Function was_input_released
; ---------------------------------
_was_input_released::
;input.h:67: return (is->released_buttons & (1 << button)) != 0x00;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, (hl)
	ld	hl, #0x0001
	inc	c
	jr	00104$
00103$:
	add	hl, hl
00104$:
	dec	c
	jr	NZ,00103$
	ld	c, #0x00
	and	a, l
	ld	e, a
	ld	a, c
	and	a, h
	or	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	e, a
;input.h:68: }
	ret
;input.h:70: uint8_t is_input_held(struct input_state* is, uint8_t button)
;	---------------------------------
; Function is_input_held
; ---------------------------------
_is_input_held::
;input.h:72: return (is->held_buttons & (1 << button)) != 0x00;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, (hl)
	ld	hl, #0x0001
	inc	c
	jr	00104$
00103$:
	add	hl, hl
00104$:
	dec	c
	jr	NZ,00103$
	ld	c, #0x00
	and	a, l
	ld	e, a
	ld	a, c
	and	a, h
	or	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	e, a
;input.h:73: }
	ret
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
;main.c:10: int main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:13: set_sprite_data(0, 38, basic_font_sprites);
	ld	de, #_basic_font_sprites
	push	de
	ld	hl, #0x2600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:20: SPRITE_TILE_WIDTH,
	ld	hl, #_SPRITE_TILE_WIDTH
	ld	b, (hl)
;main.c:19: SCREEN_MIN_Y + (3 * SPRITE_TILE_HEIGHT),
	ld	a, (#_SPRITE_TILE_HEIGHT)
	ld	e, a
	add	a, a
	add	a, e
	ld	hl, #_SCREEN_MIN_Y
	ld	c, (hl)
	add	a, c
	ld	c, a
;main.c:18: SCREEN_MIN_X + (5 * SPRITE_TILE_WIDTH),
	ld	a, b
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	hl, #_SCREEN_MIN_X
	ld	e, (hl)
	add	a, e
	ld	e, a
;main.c:15: draw_basic_font_word(&k_gridwalker_word_sprites[0],
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	d, c
	push	de
	ld	hl, #0x0a
	push	hl
	ld	de, #_k_gridwalker_word_sprites
	push	de
	call	_draw_basic_font_word
	add	sp, #8
;main.c:28: SPRITE_TILE_WIDTH,
	ld	hl, #_SPRITE_TILE_WIDTH
	ld	b, (hl)
;main.c:27: SCREEN_MIN_Y + (10 * SPRITE_TILE_HEIGHT),
	ld	a, (#_SPRITE_TILE_HEIGHT)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	ld	hl, #_SCREEN_MIN_Y
	ld	c, (hl)
	add	a, c
	ld	c, a
;main.c:26: SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	hl, #_SCREEN_MIN_X
	ld	e, (hl)
	add	a, e
	ld	e, a
;main.c:23: draw_basic_font_word(&k_new_game_word_sprites[0],
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	d, c
	push	de
	ld	hl, #0xa08
	push	hl
	ld	de, #_k_new_game_word_sprites
	push	de
	call	_draw_basic_font_word
	add	sp, #8
;main.c:36: SPRITE_TILE_WIDTH,
	ld	hl, #_SPRITE_TILE_WIDTH
	ld	b, (hl)
;main.c:35: SCREEN_MIN_Y + (12 * SPRITE_TILE_HEIGHT),
	ld	a, (#_SPRITE_TILE_HEIGHT)
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	ld	hl, #_SCREEN_MIN_Y
	ld	c, (hl)
	add	a, c
	ld	c, a
;main.c:34: SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	hl, #_SCREEN_MIN_X
	ld	e, (hl)
	add	a, e
	ld	e, a
;main.c:31: draw_basic_font_word(&k_continue_word_sprites[0],
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	d, c
	push	de
	ld	hl, #0x1208
	push	hl
	ld	de, #_k_continue_word_sprites
	push	de
	call	_draw_basic_font_word
	add	sp, #8
;main.c:39: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:40: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:42: while (1)
00102$:
;main.c:44: wait_vbls_done(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_wait_vbls_done
	inc	sp
;main.c:46: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
