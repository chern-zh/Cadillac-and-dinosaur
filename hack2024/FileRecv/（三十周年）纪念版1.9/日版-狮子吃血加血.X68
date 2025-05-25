
	org	$3d560
	jsr	$103b00
	org	$103b00
	move.w	($d2,A6),($d4,A6)
	cmpi.w	#$10,($20,A0)	/狮子吃的是否是血
	bne	_rts		/否，退出
	cmpi.w	#$5,($26,A6)	/吃中小血+半行血、吃大血+一行
	bge	_jia32
	addi.w	#$64,($6c,A6)
	addi.w	#$64,($6e,A6)
	rts
_jia32
	addi.w	#$32,($6c,A6)
	addi.w	#$32,($6e,A6)		
_rts	
	rts

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
