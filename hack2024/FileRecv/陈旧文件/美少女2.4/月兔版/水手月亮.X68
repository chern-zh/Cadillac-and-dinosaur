;-----------------------------------------------------------
	;ORG	$a69c
	;nop
	;subi.w	#$1,($2e,A1)	/魔法-1

	;org	$5e78
	;move.w	#$4,($2e,A5)	/初始魔法等级4 	


	;org	$ab2e		/角色赋血
	;move.w	#$40,($30,A0)	

*---------------------------爆物怪-------------------------------------------------
	;org	$12238		/小类01，必爆血
	;bra	$12242
	;org	$12232

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

*------------------------------4BOSS-------------------------------------
	org	$1b95e
	jmp	$7e600
	org	$7e600
	cmpi.w	#$B,($1384,A6)		/是否4.4
	beq	_jcxl4
	jmp	$1b98c
_jcxl4
	move.w	($30,A0),D0
	lsr.w	#1,D0
	jmp	$1b964	

*----------------------------2、4BOSS修复---------------------------------------
	org	$91d6
	jmp	$7e700
	org	$7e700
	cmpi.w	#$3,($1384,A6)		/是否2.2
	bne	_jc44
	cmpi.w	#$19,(A0)
	beq	_91e6		/
_9208
	jmp	$9208
_jc44
	cmpi.w	#$b,($1384,A6)		/是否4.4
	bne	_9208		
	cmpi.w	#$19,(A0)
	bne	_9208
_91e6
	jmp	$91e6	



*-------------------------双女王-----------------------------------------------
	org	$30248
	jsr	$7e500
	org	$7e500
	cmpi.w	#$1a,($1384,A6)
	bne	_8rts
	tst.w	$102000
	beq	_8rts
	tst.w	$102100
	beq	_8rts
	move.w	#$22,D0
	move.w	#$0,D1
	move.w	#$1c0,D2
	add.w	($1386,A6),D2
	move.w	#$c0,D3
	add.w	D3,D3
	move.w	#$0,D4
	move.l	A0,-(A7)
	jsr	$66f0
	movea.l	(A7)+,A0	
_8rts
	move.w	(A0)+,D0
	move.w	(A0)+,D1
	move.w	(A0)+,D2
	rts











*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
