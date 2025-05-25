*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	ORG	$18904		;按键时会运行的某个指令
	jmp	$105500
	nop
	org	$105500
	movem.l	D0,-(A7)
	lsr.b	#4,D0		;取D0的十位
	cmpi.b	#$3,D0		;检测D0中的十位是否3,3代表是AB组合键
	beq	_1		;是3，则跳转
	movem.l	(A7)+,D0	
_anjian
	move.b	D0,($a0,A6)	;不是3，则正常出动作
	move.b	($a1,A6),D1	;跳转时破环的指令 
	jmp	$1890a
_1
	movem.l	(A7)+,D0
	move.b	#$0,D0		;清楚AB按键动作
	bra	_anjian



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
