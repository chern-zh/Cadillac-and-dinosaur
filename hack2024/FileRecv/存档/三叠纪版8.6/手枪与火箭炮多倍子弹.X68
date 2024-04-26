*--------------- ÷«π-------------------------	
	org		$2533e
	jsr		$183250
	org		$25930
	jsr		_huojianpao
	
	org		$183250
	movem.l 		D0-D7/A0-A6, -(A7)
	jsr     		$26414.l
	jsr     		$26414.l
	movem.l 		(A7)+, D0-D7/A0-A6
	moveq   		#$f, D3
	rts
	
_huojianpao
	movem.l 		D0-D7/A0-A6,-(A7)
	jsr     		$26454
	addi.w  		#$c,($c,A0)
	jsr     		$26454
	subi.w  		#$c,($c,A0)
	movem.l 		(A7)+,D0-D7/A0-A6
	subq.w  		#1,D2
	rts
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
