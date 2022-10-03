;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module game_state_chapter_intro
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _draw_basic_font_word
	.globl _set_sprite_data
	.globl _was_input_depressed
	.globl _chapter_intro_enter
	.globl _chapter_intro_update
	.globl _chapter_intro_exit
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
;game-state-chapter-intro.c:9: void chapter_intro_enter()
;	---------------------------------
; Function chapter_intro_enter
; ---------------------------------
_chapter_intro_enter::
;game-state-chapter-intro.c:12: set_sprite_data(0, 38, basic_font_sprites);
	ld	de, #_basic_font_sprites
	push	de
	ld	hl, #0x2600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;game-state-chapter-intro.c:20: SPRITE_TILE_WIDTH,
	ld	hl, #_SPRITE_TILE_WIDTH
	ld	b, (hl)
;game-state-chapter-intro.c:19: SCREEN_MIN_Y + (3 * SPRITE_TILE_HEIGHT),
	ld	a, (#_SPRITE_TILE_HEIGHT)
	ld	e, a
	add	a, a
	add	a, e
	ld	hl, #_SCREEN_MIN_Y
	ld	c, (hl)
	add	a, c
	ld	c, a
;game-state-chapter-intro.c:18: SCREEN_MIN_X + (6 * SPRITE_TILE_WIDTH),
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	hl, #_SCREEN_MIN_X
	ld	e, (hl)
	add	a, e
	ld	e, a
;game-state-chapter-intro.c:15: draw_basic_font_word(&k_chapter_word_sprites[0],
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	d, c
	push	de
	ld	hl, #0x07
	push	hl
	ld	de, #_k_chapter_word_sprites
	push	de
	call	_draw_basic_font_word
	add	sp, #8
;game-state-chapter-intro.c:22: }
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
;game-state-chapter-intro.c:24: uint8_t chapter_intro_update(struct input_state* input_state)
;	---------------------------------
; Function chapter_intro_update
; ---------------------------------
_chapter_intro_update::
;game-state-chapter-intro.c:26: if (was_input_depressed(input_state, btn_select))
	ld	a, #0x07
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
;game-state-chapter-intro.c:28: return gs_title;
;game-state-chapter-intro.c:31: return gs_chapter_intro;
	ld	e, #0x01
	ret	NZ
	ld	e, #0x03
;game-state-chapter-intro.c:32: }
	ret
;game-state-chapter-intro.c:34: void chapter_intro_exit()
;	---------------------------------
; Function chapter_intro_exit
; ---------------------------------
_chapter_intro_exit::
;game-state-chapter-intro.c:36: for (int i = 0; i < 7; ++i)
	ld	bc, #0x0000
00104$:
	ld	a, c
	sub	a, #0x07
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;game-state-chapter-intro.c:38: move_sprite(i, 0, 0);
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
;game-state-chapter-intro.c:36: for (int i = 0; i < 7; ++i)
	inc	bc
;game-state-chapter-intro.c:40: }
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
