	org	$42884
	jmp	_1bossxf



	org	$102f20	
_1bossxf
	tst.w	($26,A6)
	beq	_1boss
	jmp	$4288a
_1boss
	andi.w	#$3ff,($8,A6)
	jmp	$42890


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
