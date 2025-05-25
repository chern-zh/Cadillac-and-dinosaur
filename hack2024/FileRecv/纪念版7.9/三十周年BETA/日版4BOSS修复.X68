*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------	
	org		$5f008
	jmp		_7xf
	
	org		$107e00

_7xf
	move.w	($744,A5),D1
	addi.w	#$a8,D1
	move.w	D1,($88,A6)
	tst.b	($3274,A5)
	beq		_2p
	move.w	($3284,A5),($8a,A6)
	jmp		$5f014
_2p
	tst.b	($33f4,A5)
	beq		_3p
	move.w	($3404,A5),($8a,A6)
	jmp		$5f014
_3p
	move.w	($3584,A5),($8a,A6)
	jmp		$5f014






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
