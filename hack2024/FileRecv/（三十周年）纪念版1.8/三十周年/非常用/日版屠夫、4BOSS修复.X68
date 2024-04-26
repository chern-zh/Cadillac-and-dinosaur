*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org		$5a0be	/屠夫
	jsr		$184b00
	
	org		$4c030	/4BOSS
	jsr		$184b00
	
	
	org		$184b00
	jsr		$1b6c
	cmpi.b	#$1,($4d9,A5)		/2关不需修复
	beq		_r
	cmpi.b	#$6,($4d9,A5)
	beq		_dianti
	cmpi.b	#$5,($4d9,A5)
	beq		_6tree
	cmpi.b	#$7,($4d9,A5)
	bne		_xf
	cmpi.b	#$2,($786,A5)
	bne		_xf
	cmpi.w	#$730,($744,A5)
	bge		_xf
_r
	rts
_dianti
	cmpi.b	#$1,($786,A5)
	bne		_xf
	tst.w	($748,A5)
	beq		_xf
	rts
_6tree
	cmpi.b	#$1,($786,A5)
	bne		_xf				/非2场景修复
	rts	
_xf	
	movem.l	D0-D1,-(A7)
	move.w	($748,A5),D0	/Y卷轴
	move.w	($10,A6),D1	/屠夫Y
	cmp.w	D0,D1		/Y坐标是否低于卷轴Y
	ble		_Yxiufu
	sub.w	D0,D1
	cmpi.w	#$80,D1
	bcc		_Yxiufu
	bra		_X	
_Yxiufu
	move.w	($748,A5),($10,A6)
	addi.w	#$20,($10,A6)
_X
	move.w	($744,A5),D0
	move.w	($8,A6),D1
	cmp.w	D0,D1
	ble		_XX
	sub.w	D0,D1
	cmpi.w	#$200,D1
	bcc		_xiufuX
	movem.l	(A7)+,D0-D1
	rts
	
_XX
	sub.w	D1,D0
	cmpi.w	#$80,D0
	bcc		_xiufuX
	movem.l	(A7)+,D0-D1
	rts
_xiufuX
	move.w	($744,A5),($8,A6)
	addi.w	#$80,($8,A6)
	movem.l	(A7)+,D0-D1
	rts











*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
