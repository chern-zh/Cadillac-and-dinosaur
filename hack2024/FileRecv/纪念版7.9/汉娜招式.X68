	;ORG	$143e
	;jsr	$1014c0
    
	;org	$1014c0
	;cmpa.l	#$9fb28,A0	/汉娜下上A动作表格
	;beq	_hn
_yuan    
	;move.l	A0,($28,A6)
	;move.w	(A0)+,D0    
	;rts    
_hn    
	;movea.l	#$101500,A0
	;bra	_yuan
	

	;org	$101500
	org	$9fb28		/直接改表格即可
	dc.w	$17B0,$8000,$0000,$0405,$0028,$5000,$17B0,$8000
	dc.w	$0100,$040F,$0028,$5000,$17C0,$8000,$0200,$04C6 
	dc.w	$0028,$5000,$FFF4	

	org	$1be98		/汉娜28A距离
	dc.w	$0500


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
