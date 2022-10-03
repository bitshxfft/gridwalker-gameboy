;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module game_state_title
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _draw_basic_font_word
	.globl _set_sprite_data
	.globl _was_input_depressed
	.globl _menu_options
	.globl _menu_selection
	.globl _title_enter
	.globl _title_update
	.globl _title_exit
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
_menu_selection::
	.ds 1
_menu_options::
	.ds 2
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
;game-state-title.c:14: void title_enter()
;	---------------------------------
; Function title_enter
; ---------------------------------
_title_enter::
;game-state-title.c:17: set_sprite_data(0, 38, basic_font_sprites);
	ld	de, #_basic_font_sprites
	push	de
	ld	hl, #0x2600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;game-state-title.c:25: SPRITE_TILE_WIDTH,
	ld	hl, #_SPRITE_TILE_WIDTH
	ld	b, (hl)
;game-state-title.c:24: SCREEN_MIN_Y + (3 * SPRITE_TILE_HEIGHT),
	ld	a, (#_SPRITE_TILE_HEIGHT)
	ld	e, a
	add	a, a
	add	a, e
	ld	hl, #_SCREEN_MIN_Y
	ld	c, (hl)
	add	a, c
	ld	c, a
;game-state-title.c:23: SCREEN_MIN_X + (5 * SPRITE_TILE_WIDTH),
	ld	a, b
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	hl, #_SCREEN_MIN_X
	ld	e, (hl)
	add	a, e
	ld	e, a
;game-state-title.c:20: draw_basic_font_word(&k_gridwalker_word_sprites[0],
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
;game-state-title.c:34: SPRITE_TILE_WIDTH,
	ld	hl, #_SPRITE_TILE_WIDTH
	ld	b, (hl)
;game-state-title.c:33: SCREEN_MIN_Y + (10 * SPRITE_TILE_HEIGHT),
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
;game-state-title.c:32: SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	hl, #_SCREEN_MIN_X
	ld	e, (hl)
	add	a, e
	ld	e, a
;game-state-title.c:29: draw_basic_font_word(&k_new_game_word_sprites[0],
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
;game-state-title.c:43: SPRITE_TILE_WIDTH,
	ld	hl, #_SPRITE_TILE_WIDTH
	ld	b, (hl)
;game-state-title.c:42: SCREEN_MIN_Y + (12 * SPRITE_TILE_HEIGHT),
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
;game-state-title.c:41: SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	hl, #_SCREEN_MIN_X
	ld	e, (hl)
	add	a, e
	ld	e, a
;game-state-title.c:38: draw_basic_font_word(&k_continue_word_sprites[0],
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
;game-state-title.c:45: }
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
;game-state-title.c:47: uint8_t title_update(struct input_state* input_state)
;	---------------------------------
; Function title_update
; ---------------------------------
_title_update::
;game-state-title.c:49: if (was_input_depressed(input_state, btn_up)
	ld	a, #0x02
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_was_input_depressed
	add	sp, #3
	ld	a, e
	or	a, a
	jr	NZ, 00101$
;game-state-title.c:50: || was_input_depressed(input_state, btn_down))
	ld	a, #0x03
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_was_input_depressed
	add	sp, #3
	ld	a, e
	or	a, a
	jr	Z, 00102$
00101$:
;game-state-title.c:52: menu_selection ^= 0x01; // toggle between index 0 and 1
	ld	hl, #_menu_selection
	ld	a, (hl)
	xor	a, #0x01
	ld	(hl), a
00102$:
;game-state-title.c:55: if (was_input_depressed(input_state, btn_start))
	ld	a, #0x06
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_was_input_depressed
	add	sp, #3
	ld	a, e
	or	a, a
	jr	Z, 00105$
;game-state-title.c:57: return menu_options[menu_selection];
	ld	bc, #_menu_options+0
	ld	a, c
	ld	hl, #_menu_selection
	add	a, (hl)
	ld	c, a
	jr	NC, 00118$
	inc	b
00118$:
	ld	a, (bc)
	ld	e, a
	ret
00105$:
;game-state-title.c:60: return gs_title;
	ld	e, #0x01
;game-state-title.c:61: }
	ret
;game-state-title.c:63: void title_exit()
;	---------------------------------
; Function title_exit
; ---------------------------------
_title_exit::
;game-state-title.c:65: for (int i = 0; i < 26; ++i)
	ld	bc, #0x0000
00104$:
	ld	a, c
	sub	a, #0x1a
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;game-state-title.c:67: move_sprite(i, 0, 0);
	ld	e, c
;c:/gameboy-dev/gbdk/include/gb\gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gameboy-dev/gbdk/include/gb\gb.h:1521: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;game-state-title.c:65: for (int i = 0; i < 26; ++i)
	inc	bc
;game-state-title.c:69: }
	jr	00104$
	.area _CODE
	.area _INITIALIZER
__xinit__menu_selection:
	.db #0x00	; 0
__xinit__menu_options:
	.db #0x03	; 3
	.db #0x02	; 2
	.area _CABS (ABS)
