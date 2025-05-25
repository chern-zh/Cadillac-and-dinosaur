*========================================屠夫巡逻程序=====================================================
	org	$5a4f4
	moveq	#$0,D1
	tst.b	($3274,A5)
	beq	_2Pxljc
	lea	($3274,A5),A0
	move.w	($32e0,A5),D1	
_2Pxljc
	tst.b	($33f4,A5)
	beq	_3Pxljc
	move.w	($3460,A5),D0
	cmp.w	D0,D1		*1P血量是否大于2P
	bge	_3Pxljc		*大于则跳，保留1P
	lea	($33f4,A5),A0
	move.w	D0,D1
_3Pxljc	
	tst.b	($3574,A5)
	beq	_bla0
	move.w	($35e0,A5),D0
	cmp.w	D0,D1
	bge	_bla0
	lea	($3574,A5),A0
	move.w	D0,D1
_bla0
	rts

*========================================幻影巡逻程序修改=============================================
	;org	$1100a		*武器扣血
	;jsr	$185400
	org	$1098a
	jsr	_11C150
	
	org	$102f00
_11C150
	jsr	$2b836
	cmpi.w	#$11c,($20,A3)
	beq	_a376
	cmpi.w	#$150,($20,A3)
	beq	_a376
	rts
_a376
	cmpi.b	#$3,($786,A5)
	bne	_rts
	move.w	A2,($76,A3)
_rts	
	rts



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
