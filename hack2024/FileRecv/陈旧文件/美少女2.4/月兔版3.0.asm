*月野兔平均型：受到敌方伤害越多，防御越高，有月野兔出场时，全员伤害有暴击属性。
*水星回复型，吃血时回血加倍。
*火星野蛮型，捡水晶数量+2。
*金星技巧型，自身移速较快。
*木星暴力型，自身防御高
*抓人动作1C，摔人1E，敌兵被抓动作01

	org		$9670		*扣血
	nop
	jsr		_kouxie
	
	;org		$117ce		*敌兵扣血碎步骤
	;nop
	;jmp		_dibingkx
	org		$920c		*敌兵扣血总数值$9208
	jsr		_baoji_
	;org		$117da
	;nop
	;jsr		_xiufu34
	
	
	org		$9638		*水星回血加倍
	nop
	jsr		_huixie_double
	
	org		$606a		*时刻运行的分数流转指令，奖命
	jsr		_bone
	
	org		$a596		*捡水星+1
	nop
	jmp		_plus_2
	
	org		$ab2e		*开局赋血
	jsr		_jiaxie_fenshu	
	org		$970a		*死命或接币赋血
	jsr		_jiaxie_plus
*-----------------------------------------------------------------
	org		$7f000
*---------------------------暴击---------------------------------
_kouxie
	cmpi.b	#$4,($1,A0)		*检测是否木星，伤害减免
	bne		_nnn
	cmpi.w	#$2,D0
	blt		_nnn
	subq.w	#1,D0		*检测是否木星，伤害减免
_nnn
	sub.w	D0,($34,A0)
	sub.w	D0,($32,A0)
	cmpi.b	#$1,($1,A0)		*检测是否月野兔
	bne		_nobaoji
	cmpi.b	#$f,($5,A0)		*月野兔是否在AB
	beq		_nobaoji
	movem.l	D1/A1,-(A7)
	jsr		$ae3c
	andi.w	#$7,D1
	addq.b	#1,D1
	move.w	D1,($6ff0,A6)	*$10eff0
	movem.l	(A7)+,D1/A1
_nobaoji	
	rts
*-----------------------------------------------------------------------	
_baoji_
	clr.b	($77,A0)
	cmpi.b	#$5,($1,A0)		*小于6是我方
	ble		_wofang
	cmpi.b	#$1,$102001		*检测月野兔是否出场
	beq		_plusbj
	cmpi.b	#$1,$102101		*检测月野兔是否出场
	beq		_plusbj
_wofang
	rts
_plusbj
	
	sub.w	D0,($34,A0)
	add.w	($6ff0,A6),D0
	add.w	D0,($34,A0)
	sub.w	($6ff0,A6),D0
	rts

*-----------------------------水星回血加倍--------------------------------------
_huixie_double
	cmpi.b	#$2,($1,A0)
	bne		_no_double
	add.w	D0,D0		*回血加倍
_no_double	
	add.w   D0,($34,A0)
	add.w   ($32,A0),D0
	rts
*--------------------------------奖命---------------------------------------
_bone
	cmpi.b	#$1,$102001		*月野兔是否出场
	beq	_baojixs
	cmpi.b	#$1,$102101		*月野兔是否出场
	beq	_baojixs
	bra	_noxs
_baojixs
	moveq	#$0,D1
	move.w	($6ff0,A6),D1		*暴击显示
	addi.l	#$ce000050,D1		*CE为颜色
	move.l	D1,$905d94
	move.l	#$ce000050,$905d98
_noxs
	move.l	($2a,A5),D0
	moveq	#$7,D1
	cmpa.l	#$109596,A5		*是否2P分数
	beq		_2pbone
_1pbone
	cmp.l	($6fe0,A6),D0	*$10efe0
	blt		_no_bone
	addq.b	#1,$1020f4
	addi.l	#$300000,($6fe0,A6)
_no_bone
	rts
_2pbone
	cmp.l	($6fe4,A6),D0	*$10efe4
	blt		_no_bone
	addq.b	#1,$1021f4
	addi.l	#$300000,($6fe4,A6)
	rts
*------------------------------火星捡水晶+2------------------------------------------
_plus_2
	cmpi.b	#$3,($1,A1)		*是否火星
	bne		_plus_one
	addq.w	#2,($2e,A1)
	cmpi.w	#$5,($2e,A1)
	ble		_ab56
	move.w	#$5,($2e,A1)
	jmp		$a5b6
_plus_one
	addq.w	#1,($2e,A1)
_ab56
	jmp		$a5b6
*------------------------------------金星血条1.5倍、奖命分数---------------------------------------------
_jiaxie_fenshu
	move.l	#$300000,($6fe0,A6)
	move.l	#$300000,($6fe4,A6)
_jiaxie_plus
	cmpi.b	#$5,($1,A0)		*是否金星
	bne	_jx40
	move.w  #$60,($30,A0)
	rts
_jx40
	move.w  #$40,($30,A0)
	rts
*-------------------------------------------------------------------------------------

	







