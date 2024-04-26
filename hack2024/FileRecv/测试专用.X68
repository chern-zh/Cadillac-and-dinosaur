	org	$1880
	jsr	_x
	org	$1896
	jmp	_y


	org	$107000	
_x
	add.l	D1,($8,A6)
	add.l	D1,($8,A6)
	add.l	D1,($8,A6)
	add.l	D1,($8,A6)
	add.l	D1,($8,A6)
	add.l	D1,($8,A6)
	moveq	#$0,D1
	rts
_y
	add.l	D1,($10,A6)
	add.l	D1,($10,A6)
	add.l	D1,($10,A6)
	add.l	D1,($10,A6)
	add.l	D1,($10,A6)
	add.l	D1,($10,A6)
	rts

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
