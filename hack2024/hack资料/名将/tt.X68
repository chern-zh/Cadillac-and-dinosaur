*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org	$51310
	nop
	jsr	_test
	
	org	$5184a	*投币检测
	nop
	jsr	_test2
	
	;org	$42ea	*模仿血量	$51018
	;jsr	_xieliang
	
	org	$190000
_xieliang
	;moveq	#0,D0
	;bra	_moved5
	
_test2
	lea	($a4,A0),A4
	bra	_moved5
_test
	lea	($ba,A0),A3
_moved5
	move.b	($28b7,A5),D5
	btst	#0,D5
	bne	_testp2
	bset	#0,D5
	rts
_testp2
	btst	#1,D5
	bne	_testp3
	bset	#1,D5
	rts
_testp3
	btst	#2,D5
	bne	_testp4
	bset	#2,D5
	rts
_testp4
	btst	#3,D5
	bne	_rts
	bset	#3,D5
_rts
	rts

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
