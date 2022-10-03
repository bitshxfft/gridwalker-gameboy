;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module basic_font_words
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _k_chapter_word_sprites
	.globl _k_password_word_sprites
	.globl _k_continue_word_sprites
	.globl _k_new_game_word_sprites
	.globl _k_gridwalker_word_sprites
	.globl _draw_basic_font_word
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
;basic-font-words.c:69: void draw_basic_font_word(
;	---------------------------------
; Function draw_basic_font_word
; ---------------------------------
_draw_basic_font_word::
	dec	sp
	dec	sp
;basic-font-words.c:78: for (uint8_t i = 0; i < character_count; ++i)
	ld	e, #0x00
00108$:
	ld	a, e
	ldhl	sp,	#6
	sub	a, (hl)
	jr	NC, 00109$
;basic-font-words.c:80: uint8_t character = characters[i];
	dec	hl
	push	de
	ld	d, #0x00
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
;basic-font-words.c:82: if (character == BASIC_FONT_SKIP_CHARACTER)
	ld	c, a
	inc	a
	jr	Z, 00103$
;basic-font-words.c:87: set_sprite_tile(tile_index_start + i, character);
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, e
	ld	d, a
	ld	b, d
;c:/gameboy-dev/gbdk/include/gb\gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	a, #<(_shadow_OAM)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_shadow_OAM)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), c
;basic-font-words.c:91: start_position_y + (i * position_step_y));
	push	de
	ldhl	sp,	#13
	ld	d, (hl)
	push	de
	call	__muluchar
	pop	hl
	ld	a, e
	pop	de
	ldhl	sp,	#9
	add	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;basic-font-words.c:90: start_position_x + (i * position_step_x),
	push	de
	ldhl	sp,	#12
	ld	d, (hl)
	push	de
	call	__muluchar
	pop	hl
	ld	a, e
	pop	de
	ldhl	sp,	#8
	add	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;c:/gameboy-dev/gbdk/include/gb\gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gameboy-dev/gbdk/include/gb\gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;basic-font-words.c:91: start_position_y + (i * position_step_y));
00103$:
;basic-font-words.c:78: for (uint8_t i = 0; i < character_count; ++i)
	inc	e
	jr	00108$
00109$:
;basic-font-words.c:93: }
	inc	sp
	inc	sp
	ret
_k_gridwalker_word_sprites:
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x11	; 17
_k_new_game_word_sprites:
	.db #0x0d	; 13
	.db #0x04	; 4
	.db #0x16	; 22
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x04	; 4
_k_continue_word_sprites:
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x13	; 19
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x14	; 20
	.db #0x04	; 4
_k_password_word_sprites:
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x16	; 22
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x03	; 3
_k_chapter_word_sprites:
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x13	; 19
	.db #0x04	; 4
	.db #0x11	; 17
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
