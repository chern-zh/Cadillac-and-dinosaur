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


*-------------------------随机出兵-----------------------------------------------
	org	$30248
	jmp	$7e500
	org	$7e500
	move.w	(A0)+,D0	
	cmpi.w	#$10,D0
	beq	_random
	cmpi.w	#$11,D0
	beq	_random
	cmpi.w	#$12,D0
	beq	_random
	cmpi.w	#$14,D0
	beq	_random
	;cmpi.w	#$15,D0
	;beq	_random
	cmpi.w	#$16,D0
	beq	_random
	cmpi.w	#$17,D0
	beq	_random
	cmpi.w	#$18,D0
	beq	_random
	move.w	(A0)+,D1
	move.w	(A0)+,D2
	jmp	$3024e
_random
	moveq	#$0,D1
	move.w	($2416,A6),D1
	add.w	D0,D1	
	divu.w	#$20,D1
	swap	D1
	mulu.w	#$4,D1
	move.w	_radomernmy(PC,D1),D0
	addi.w	#$2,D1
	move.w	_radomernmy(PC,D1),D4	/小类，出场方式
	move.w	(A0)+,D1
	move.w	(A0)+,D2
	move.w	(A0)+,D3
	add.w	($1386,A6),D2
	add.w	($138a,A6),D3
	add.w	D3,D3	
	adda.l	#$2,A0
	jmp	$3025c

_radomernmy
        dc.w    $0018,$0022,$0011,$0020,$0010,$0001,$0012,$0011
        dc.w    $0021,$0000,$0011,$0023,$0017,$0000,$0016,$0000
        dc.w    $0018,$0011,$001a,$0002,$0010,$0001,$0012,$0011
        dc.w    $0014,$0010,$0013,$0003,$0017,$0000,$001A,$0001
        dc.w    $0011,$0011,$001B,$0010,$0014,$0010,$0020,$0000
        dc.w    $001D,$0040,$0013,$0005,$0012,$0021,$0016,$0001
        dc.w    $0018,$0022,$0011,$0020,$0010,$0001,$0012,$0011
        dc.w    $0014,$0010,$0017,$0000,$0012,$0011,$0018,$0022
	
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


*-----------------------血量处理---------------------------
	org	$118ce
	jsr	$7ed00
	org	$7ed00
	;tst.w	$102000
	;beq	_jxgd
	;tst.w	$102100
	;beq	_jxgd
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
