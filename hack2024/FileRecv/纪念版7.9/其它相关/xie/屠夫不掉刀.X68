*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
*---------屠夫不掉dao 
	ORG	$58700
	jmp	$108e8e
	org	$108e8e
	cmpi.b	#$1,($4d9,A5)
	bne	_no_diaodao
	cmpi.b	#$2,($786,A5)
	bne	_no_diaodao
	jsr	$119c
	jmp	$58706
_no_diaodao
	jmp	$58750	
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
