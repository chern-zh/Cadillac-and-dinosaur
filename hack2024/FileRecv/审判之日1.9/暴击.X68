	org	$18d88
		nop
	jmp	_baoji

	org	$106500
_baoji
	bsr	_sub_baoji
	tst.w	($6c,A6)
	bgt	_local_18dc6
	jmp	$18d90
_local_18dc6
	jmp	$18dc6	
_sub_baoji      
	movem.l	D0-D1/A0,-(A7)                          ;D0ÈëÕ»
	moveq	#0,D0
	move.l	#$102,D1
	cmpi.b	#$1,($2,A6)
	bgt	_3p
	beq	_2p
_1p
	;move.w	#$10c,D1		*1P±©»÷ÑÕÉ«                  
	movea.l	#$90a714,A0
	bsr	_baoji_xuanran
	movem.l	(A7)+,D0-D1/A0
	rts
_2p
	;move.w	#$10c,D1		*2P±©»÷ÑÕÉ«                  
	movea.l	#$90af14,A0
	bsr	_baoji_xuanran
	movem.l	(A7)+,D0-D1/A0
	rts
_3p
	;move.w	#$10c,D1		*3P±©»÷ÑÕÉ«                  
	movea.l	#$90b714,A0
	bsr	_baoji_xuanran
	movem.l	(A7)+,D0-D1/A0
	rts
_baoji_xuanran	
	move.b	($c6,A6),D0
	lsr.b	#4,D0
	move.w	D0,($0,A0)
	move.w	D1,($2,A0)
	move.b	($c6,A6),D0
	andi.b	#$f,D0
	move.w	D0,($80,A0)
	move.w	D1,($82,A0)
	rts





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
