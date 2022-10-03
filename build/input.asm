;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module input
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _update_input_state
	.globl _was_input_depressed
	.globl _was_input_released
	.globl _is_input_held
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
;input.c:6: void update_input_state(struct input_state* is, uint8_t button_state)
;	---------------------------------
; Function update_input_state
; ---------------------------------
_update_input_state::
	add	sp, #-5
;input.c:9: is->previous_state = is->current_state;
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
;input.c:12: is->current_state = ((button_state & J_A) == J_A) << btn_a;
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
;input.c:13: is->current_state |= ((button_state & J_B) == J_B) << btn_b;
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
;input.c:14: is->current_state |= ((button_state & J_UP) == J_UP) << btn_up;
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
;input.c:15: is->current_state |= ((button_state & J_DOWN) == J_DOWN) << btn_down;
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
;input.c:16: is->current_state |= ((button_state & J_LEFT) == J_LEFT) << btn_left;
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
;input.c:17: is->current_state |= ((button_state & J_RIGHT) == J_RIGHT) << btn_right;
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
;input.c:18: is->current_state |= ((button_state & J_START) == J_START) << btn_start;
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
;input.c:19: is->current_state |= ((button_state & J_SELECT) == J_SELECT) << btn_select;
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
;input.c:22: is->held_buttons = is->previous_state & is->current_state;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ldhl	sp,	#2
;input.c:25: is->depressed_buttons = (is->current_state ^ is->held_buttons);
;input.c:28: is->released_buttons = (is->previous_state ^ is->held_buttons);
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
;input.c:29: }
	add	sp, #5
	ret
;input.c:33: uint8_t was_input_depressed(struct input_state* is, uint8_t button)
;	---------------------------------
; Function was_input_depressed
; ---------------------------------
_was_input_depressed::
;input.c:35: return (is->depressed_buttons & (1 << button)) != 0x00;
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
;input.c:36: }
	ret
;input.c:38: uint8_t was_input_released(struct input_state* is, uint8_t button)
;	---------------------------------
; Function was_input_released
; ---------------------------------
_was_input_released::
;input.c:40: return (is->released_buttons & (1 << button)) != 0x00;
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
;input.c:41: }
	ret
;input.c:43: uint8_t is_input_held(struct input_state* is, uint8_t button)
;	---------------------------------
; Function is_input_held
; ---------------------------------
_is_input_held::
;input.c:45: return (is->held_buttons & (1 << button)) != 0x00;
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
;input.c:46: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
