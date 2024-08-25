*-----------------------------------------------------------
* Ãû³Æ       :
* ËµÃ÷       
	org		$11738
	jmp		_baoji

*---------------ÊÖÇ¹Ë«±¶×Óµ¯-------------------------	
	org		$2533e
	jsr		_lgun
*-----------»ð¼ýÅÚË«±¶×Óµ¯-----------------------------
	org		$25930
	jsr		_huojianpao	
*-----------UZI»úÇ¹¶à±¶×Óµ¯-------------------
	org		$255bc
	jsr		_uzi_m16
*-----------M16¶à±¶×Óµ¯-------------------
	org		$25722
	jsr		_uzi_m16
*-------------×Óµ¯»ØÑª-----------------------------------
	org		$1361e
	jsr		_return_and_plus

;===========================================================================
;===========================================================================	
	org		$183200
_lgun
	movem.l 		D0-D7/A0-A6,-(A7)
	jsr     		$26414
	addq.w  		#$8,($c,A0)
	jsr     		$26414
	subq.w  		#$8,($c,A0)
	movem.l 		(A7)+,D0-D7/A0-A6
	moveq   		#$f,D3
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
_uzi_m16
         tst.b             ($7fee,A5)
         beq               _uzi_double
         jsr               $26414
         moveq             #$12,D3
         rts
_uzi_double
	movem.l		D0-D7/A0-A6,-(A7)
	jsr		$26414
	addq.w		#4,($c,A0)
	jsr		$26414
	subq.w		#4,($c,A0)
	movem.l		(A7)+,D0-D7/A0-A6
	moveq		#$12,D3
	rts	
_baoji
	;cmpi.w		#$f,($6c,A3)
	;bcc		_bj_1	
	;move.b		#$60,($11e,A3)
	;rts
_bj_1
	movem.l		A6,-(A7)
	moveq		#0,D0
	jsr		$119c
	andi.w		#$3f,D0
	movea.l		#$2c9b6,A6
	move.b		(A6,D0.w),($11e,A3)
	movem.l		(A7)+,A6
	rts
*=============================ÎÞÏÞÄ£Ê½===============================================		
_return_and_plus
		tst.w		($b4,A6)
		beq		_no_p
		cmpa.w		#$b274,A6
		beq		_minusornot1P
		cmpa.w		#$b3f4,A6
		beq		_minusornot2P		
		cmpa.w		#$b574,A6
		beq		_minusornot3P
		bra		_no_p
_it_plus
		movea.w		($b4,A6),A5
		move.w		#$3c,($6c,A5)
		movea.w		#$8000,A5
_no_p
		moveq		#0,D0
		move.b		($3,A6),D0
		rts
_minusornot1P
		cmpi.b		#$1,($7f3c,A5)
		beq		_it_plus
		bra		_no_p
_minusornot2P
		cmpi.b		#$1,($7f3d,A5)
		beq		_it_plus
		bra		_no_p
_minusornot3P
		cmpi.b		#$1,($7f3e,A5)
		beq		_it_plus
		bra		_no_p
		
*=============================ÎÞÏÞÄ£Ê½===============================================
		org		$2855a		*×Óµ¯+ÁÔÇ¹
		dc.w		$000f
		
		org		$28562		*×Óµ¯+ÊÖÇ¹
		dc.w		$000e
		
		org		$28572		*×Óµ¯+UZI
		dc.w		$0030
		
		org		$2857a		*×Óµ¯+M16
		dc.w		$0030
		
		org		$28582		*×Óµ¯+ö±µ¯Ç¹
		dc.w		$000a
		
		org		$2858a		*×Óµ¯+ÅÚµ¯
		dc.w		$000a
		

		;org		$24eac		/ÅÚµ¯³õÊ¼µ¯Ò©
		;nop
		;jsr		_infinite
		;org		$24de0		/ÊÖÇ¹³õÊ¼µ¯Ò©
		;nop
		;jsr		_infinite
		;org		$24da0		/ÁÔÇ¹³õÊ¼µ¯Ò©
		;nop
		;jsr		_infinite
		;org		$24e36		/UZI³õÊ¼µ¯Ò©
		;nop
		;jsr		_infinite
		;org		$24e60		/M16³õÊ¼µ¯Ò©
		;nop
		;jsr		_infinite	
		;org		$24e86		/ö±µ¯Ç¹³õÊ¼µ¯Ò©
		;nop
		;jsr		_infinite	


*--------------------------·´±©»÷---------------------------------
	org	$11770		*°¤´òË¢±¬»÷£¬Ð´
	move.b	(A6,D1.w),($11e,A3)
	
	org	$2b98a		*¶Á
	move.b	($11e,A2),D0
	
	org	$2babc		*¶Á
	move.b	($11e,A6),D0
	
	;org	$4ac1a
	;move.b	($11e,A2),D0
	
	;org	$4ad4c
	;move.b	($11e,A6),D0















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
