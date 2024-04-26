    	ORG  	$4848e		/
    	jmp	$107000		/ÕÒ¸ö¿Õ°×µØÖ·¼´¿É
    
    	org	$107000
    	cmpi.w	#$60,($20,A6)
    	bne	_yuan
    	move.l  	#$2020000, ($4,A6)
	clr.b   	($7a,A6)
	move.b  	#$ff, ($2,A6)
	move.b  	#$8, ($59,A6)
	jmp	$4851a

_yuan
	addq.b	#2,($4,A6)  
	jmp	$4851a

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
