;-----------------------------------------------------------
	;ORG	$a69c
	;nop
	;subi.w	#$1,($2e,A1)	/魔法-1

	;org	$5e78
	;move.w	#$4,($2e,A5)	/初始魔法等级4 	


	;org	$ab2e		/角色赋血
	;move.w	#$40,($30,A0)	


*-------------------------时间-------------------------------------------
	org	$301c6
	move.w	#$9099,($2416,A6)
	bra	$301d2

	org	$3019c
	jsr	$7e400
	org	$7e400
	cmpi.w	#$ffff,D0
	beq	_ffff	
	move.w	#$9999,($2418,A6)
	move.w	($2418,A6),($2416,A6)
	moveq	#$0,D0
	rts
_ffff
	move.w	D0,($2416,A6)
	moveq	#$0,D0
	rts	
*---------------------------女王------------------------------------------------
	org	$1efe8		/激活女王
	jmp	$7dd00
	nop
	org	$7dd00
	cmpi.w	#$1a,($1384,A6)		/是否8关底
	bne	_1eff0
	cmp.l	($13c4,A6),D0
	bne	_1f00a
_1eff0
	jmp	$1eff0	
_1f00a
	jmp	$1f00a	
	
*----------------------------------披风男-----------------------------------------	
	org	$1e804		/披风男
	jmp	$7de00
	nop
	org	$7de00
	cmpi.w	#$19,($1384,A6)		/是否8.1
	bne	_1e80c
	cmp.l	($13c4,A6),D0
	bne	_1e826
_1e80c
	jmp	$1e80c	
_1e826
	jmp	$1e826

*----------------------------黄毛-----------------------------------------------	
	org	$1dce8		/黄毛
	jmp	$7df00
	nop
	org	$7df00
	cmpi.w	#$11,($1384,A6)		/是否5.4
	bne	_1dcf0
	cmp.l	($13c4,A6),D0
	bne	_1dd16
_1dcf0
	jmp	$1dcf0	
_1dd16
	jmp	$1dd16

*-----------------------------大猫怪-------------------------------------------------
	org	$1c7a6
	jsr	$7e000
	org	$7e000
	cmpi.w	#$16,($1384,A6)
	beq	_xueliang20
	move.w	#$60,($32,A0)
	rts	
_xueliang20
	move.w	#$20,($32,A0)
	rts

	org	$1c6fe		/激活大猫怪
	jmp	$7e100
	nop
	org	$7e100
	cmpi.w	#$1,($1384,A6)		/是否7
	beq	_jcjz
	cmpi.w	#$15,($1384,A6)		/是7
	beq	_jcjz
	cmpi.w	#$16,($1384,A6)		/是7
	beq	_jcjz
	cmpi.w	#$17,($1384,A6)		/是7
	beq	_jcjz
	jmp	$1c706
_jcjz	
	cmp.l	($13c4,A6),D0
	bne	_1c70c
	jmp	$1c706	
_1c70c
	jmp	$1c70c

*------------------------2BOSS---老巫婆-------------------------------------
	org	$19a2e
	jmp	$7e200
	org	$7e200
	cmpi.w	#$3,($1384,A6)		/是否2.2
	beq	_jcxl
	jmp	$19a6a
_jcxl
	move.w	($30,A0),D0
	lsr.w	#1,D0
	jmp	$19a34
	


*----------------------------------闪电姐妹 -----------------------------------------	
	org	$1595a		/激活闪电姐妹
	jmp	$7e300
	nop
	org	$7e300
	tst.w	($1384,A6)		/是否1
	bne	_15962
	cmp.w	($13c4,A6),D0
	bne	_1597a
_15962
	jmp	$15962	
_1597a
	jmp	$1597a


*-------------------------双倍出兵-----------------------------------------------
	org	$30248
	jsr	$7e500
	org	$7e500
	tst.w	$102000
	beq	_8rts
	tst.w	$102100
	beq	_8rts
	cmpa.l	#$315de,A0	/是否3BOSS蝙蝠地址
	beq	_8rts
	cmpa.l	#$30d3e,A0	/是否2BOSS地址
	beq	_8rts
	cmpa.l	#$324d2,A0	/是否4BOSS地址
	beq	_8rts
	move.w	(A0),D0
	move.w	($2,A0),D1
	move.w	($4,A0),D2
	addi.w	#$10,D2
	move.w	($6,A0),D3
	cmpa.l	#$3487c,A0
	bne	_queen
	move.w	#$e0,D3
_queen
	move.w	($8,A0),D4
	add.w	($1386,A6),D2	
	add.w	($138a,A6),D3
	add.w	D3,D3
	move.l	A0,-(A7)
	jsr	$66f0
	movea.l	(A7)+,A0	
_8rts
	move.w	(A0)+,D0
	move.w	(A0)+,D1
	move.w	(A0)+,D2
	rts

*-------------------------双倍出兵-----------------------------------------------
	;org	$30268
	;jsr	$7ec00
	;org	$7ec00
	;cmpa.l	#$316f8,A0
	;bne	_bossrts
	;tst.w	$102000
	;beq	_bossrts
	;tst.w	$102100
	;beq	_bossrts
	;move.w	(A0),D0
	;move.w	($2,A0),D1
	;move.w	($4,A0),D2	
	;move.w	($6,A0),D3
	;move.w	($8,A0),D4
	;move.l	A0,-(A7)
	;jsr	$66f0
	;movea.l	(A7)+,A0	
_bossrts
	;move.w	(A0)+,D0
	;move.w	(A0)+,D1
	;move.w	(A0)+,D2
	;rts

*-----------------------血量处理---------------------------
	org	$118ce
	jsr	$7ed00
	org	$7ed00
	tst.w	$102000
	beq	_jxgd
	tst.w	$102100
	beq	_jxgd
	cmpi.w	#$13,(A0)
	beq	_1B
	cmpi.w	#$19,(A0)
	beq	_2B
	cmpi.w	#$1a,(A0)
	beq	_36B
	cmpi.w	#$1b,(A0)
	beq	_4B
	cmpi.w	#$20,(A0)
	beq	_5B
	;cmpi.w	#$1d,(A0)
	;beq	_7B
	cmpi.w	#$22,(A0)
	beq	_8B
	cmpi.w	#$21,(A0)
	beq	_pifengB
	move.w	($30,A0),($32,A0)
	rts
_1B
	tst.w	($1384,A6)		/是否1关底
	beq	_jxgd	
	move.w	#$30,($30,A0)
	move.w	($30,A0),($32,A0)
	rts	
_2B
	cmpi.w	#$3,($1384,A6)		/是否2关底
	beq	_jxgd	
	move.w	#$30,($30,A0)
	move.w	($30,A0),($32,A0)
	rts
_4B
	cmpi.w	#$b,($1384,A6)		/是否4关底
	beq	_jxgd	
	move.w	#$30,($30,A0)
	move.w	($30,A0),($32,A0)
	rts
_5B
	cmpi.w	#$11,($1384,A6)		/是否5关底
	beq	_jxgd	
	move.w	#$30,($30,A0)
	move.w	($30,A0),($32,A0)
	rts
_7B
	;cmpi.w	#$3,($1384,A6)		/是否7关底
	;beq	_jxgd	
	;move.w	#$30,($30,A0)
	;move.w	($30,A0),($32,A0)
	;rts
_8B
	cmpi.w	#$1a,($1384,A6)		/是否8关底
	beq	_jxgd	
	move.w	#$30,($30,A0)
	move.w	($30,A0),($32,A0)
	rts
_pifengB
	cmpi.w	#$19,($1384,A6)		/是否8关底
	beq	_jxgd	
	move.w	#$30,($30,A0)
	move.w	($30,A0),($32,A0)
	rts
_36B
	cmpi.w	#$5,($1384,A6)		/是3关底
	beq	_jxgd
	cmpi.w	#$6,($1384,A6)		/是否3关底
	beq	_jxgd
	cmpi.w	#$14,($1384,A6)		/是否6关底
	beq	_jxgd	
	move.w	#$30,($30,A0)
	move.w	($30,A0),($32,A0)
	rts	
_jxgd
	move.w	($30,A0),($32,A0)
	rts

*---------------------------爆物怪-------------------------------------------------
	;org	$12238		/小类01，必爆血
	;bra	$12242
	;org	$12232
	org	$12210
	jmp	$7ef00
	nop
	
	org	$7ef00
	cmpi.w	#$19,(A0)
	beq	_1222e
	cmpi.w	#$1a,(A0)
	beq	_1222e
	cmpi.w	#$1b,(A0)
	beq	_1222e
	cmpi.w	#$22,(A0)
	beq	_1222e
	cmpi.w	#$21,(A0)
	beq	_1222e
	cmpi.w	#$20,(A0)
	beq	_1222e
	cmpi.w	#$1d,(A0)
	beq	_1222e
	cmpi.w	#$16,(A0)
	beq	_12218	
	jmp	$1228a
_12218
	jmp	$12218

_1222e
	move.w	#$1,D0
	jmp	$1221c










*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
