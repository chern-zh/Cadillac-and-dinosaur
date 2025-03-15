*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :

;===========================================
	org	$81428
	jsr	$184800
	org	$184800
	cmpi.b	#$1,($7f88,A5)
	beq	_guy
	cmpi.b	#$3,($7f88,A5)
	beq	_guy
	cmpi.b	#$6,($4d9,A5)
	bne	_guy
	cmpi.b	#$3,($786,A5)
	bne	_guy
	cmpi.b	#$2,($7f88,A5)
	beq	_no_guy
	cmpi.b	#$3,($7f88,A5)
	beq	_no_guy
	cmpi.b	#$2,($7f18,A5)
	beq	_guy		/模式四，三人可带枪
	tst.b	($7f18,A5)
	beq	_make_28
	move.b	#$36,($333a,A5)		/模式四双人开局锁36暴击
	move.b	#$36,($34ba,A5)
	move.b	#$36,($363a,A5)
	bra	_guy		/模式四，两人可带枪		
_make_28
	move.b	#$28,($333a,A5)		/模式四单人全程锁28暴击
	move.b	#$28,($34ba,A5)
	move.b	#$28,($363a,A5)	
_no_guy
	clr.l	$ffb328
	clr.l	$ffb4a8
	clr.l	$ffb628
_guy
	jsr	$1da46
	rts
	
*===================多倍子弹====================
*-----------手枪--------------
	org	$252c0
	jsr	$184900
	org	$258b2
	jsr	_huojianpao
	org	$184900
	movem.l	D0-D7/A0-A6,-(A7)
	jsr	$26396
	jsr	$26396
	movem.l	(A7)+,D0-D7/A0-A6
	moveq	#$f,D3
	rts
_huojianpao
	movem.l 		D0-D7/A0-A6,-(A7)
	jsr     		$263d6
	addi.w  		#$c,($c,A0)
	jsr     		$263d6
	subi.w  		#$c,($c,A0)
	movem.l 		(A7)+,D0-D7/A0-A6
	subq.w  		#1,D2
	rts
*--------------UZI---M16-----------------
	org	$2553e	/UZI
	jsr	$184980
	
	org	$256A4	/M16
	jsr	$184980
	
	org	$184980
	movem.l	D0-D7/A0-A6,-(A7)
	jsr	$26396
	jsr	$26396
	movem.l	(A7)+,D0-D7/A0-A6
	moveq	#$12,D3
	rts


*--------------模式三————4BOSS、大龙、马云额外爆出16%补给-----------------
	org	$2AB10
	jsr	$184a00
	
	org	$2a68a
	jsr	$184a00

	org	$2a814
	jsr	$184a00
	
	org	$2ac04
	jsr	$184a00
	
	;org	$2ac18
	;jsr	$184a00
	
	org	$184a00
	jsr	$24ab8
	cmpi.b	#$3,($7f88,A5)
	bne	_no_ex
	cmpi.b	#$5,($3,A6)	/4BOSS
	beq	_ex50
	cmpi.b	#$22,($3,A6)	/8BOSS
	beq	_ex50
	cmpi.b	#$18,($3,A6)	/11C
	beq	_ex50	
_no_ex
	rts
_ex
	move.b	#$36,($96,A6)	/100%出16%补给血
	jsr	$24ab8
	rts
_ex50
	move.b	#$1e,($96,A6)	/50%出16%补给血
	jsr	$24ab8
	rts



	org	$64ea8		*大龙爆物
	jsr	$184a80
	org	$184a80
	move.w	($10,A6),($10,A0)
	move.b	($96,A6),($96,A0)
	rts
_3Bxs
	cmpi.b	#$2,($4d9,A5)
	bne	_3B_huan
	cmpi.w	#$2ccc,($744,A5)
	bls	_3B_huan
	jmp	$1b6c
_3B_huan
	move.w	#$8,($20,A6)
	move.w	#$78,($80,A6)	*尸体隐现时间
	jmp	$1b6c
*=============================3BOSS尸体消失======================================
	org	$50754
	jmp	_3Bxs
*--------------------------武器弹药修改-------------------------------------
	;org	$24d60	/手枪初始
	;moveq	#$a,D0
	
	;org	$24e06
	;moveq	#$8,D0	/霰弹枪初始

	;org	$28504	/霰弹枪/Bp $2848A
	;dc.w	$0008
	
	;org	$284e4	/手枪
	;dc.w	$000a

	;org	$2850c	/火箭炮
	;dc.w	$0006

;===========================4BOSS修复、对话调节=========================================
	ORG     $4bf20                  ;4BOSS对话调节
	jmp	_4BOSScoming
	
*-----------------------------------------------------------------


	org	$185200
_4BOSScoming
	cmpi.b		#$6,($4d9,A5)
	beq		_7guan4boss
	cmpi.b		#$3,($4d9,A5)
	bne		_4BOSSjc
	cmpi.b		#$2,($786,A5)
	bne		_4BOSSjc
	cmpi.w		#$300,($744,A5)
	ble		_4BOSSjc
	cmpi.w		#$470,($744,A5)
	blt		_4bf52
	jmp		$4bf28	
_4bf52
	rts	
_4BOSSjc
	move.b		#$a,($6,A6)
	clr.b		($4fc,A5)
	rts

_7guan4boss
	cmpi.b		#$3,($786,A5)
	bne		_4BOSSjc
	cmpi.w		#$3c0,($744,A5)
	blt		_4bf52
	jmp		$4bf28
















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
