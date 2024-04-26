*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org	$12946
	jmp	_hanna_s
	
	org	$180000
_hanna_s

	cmp.w	D1,D0
	bhi	_129a4
	jmp	$1294c
_129a4
	cmpi.b	#$2,($3,A2)
	beq	_hanna
	jmp	$129a4
_hanna
	move.w	($10,A2),D0
	move.w	($10,A3),D1
	cmp.w	D1,D0
	blt	_bug1
	jmp	$129a4
_bug1	
	addi.w	#$a,D0
	cmp.w	D1,D0
	blt	_wujiu
	jmp	$1294c	
_wujiu
	jmp	$129a4
	

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
