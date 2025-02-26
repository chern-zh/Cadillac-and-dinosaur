*-----------------------------------------------------------
* 名称       :
* 说明       
*-------------子弹回血-----------------------------------
	org		$1361e
	jsr		_return_and_plus

*---------------------过场景+赠送gun-------------------------
	org	$18a98
	jsr	_cjwd
*=============================无限模式===============================================		
_return_and_plus
		tst.w		($b4,A6)
		beq		_no_p
		movea.w		($b4,A6),A5
		move.w		#$3c,($6c,A5)
		movea.w		#$8000,A5
_no_p
		moveq		#0,D0
		move.b		($3,A6),D0
		rts

*---------------------过场景赠送gun-------------------------
_cjwd	
	move.b	#$1,($0,A6)
	tst.b	($786,A5)		*关卡开始才给枪
	beq	_make_gun
	rts
_make_gun
	movem.l	D0-D6/A0-A6,-(A7)
	jsr	$4818
	bcs	_not
	move.b	#$1,($0,A0)
	move.w  ($2,A6),($2,A0)
	move.w  #$0,($20,A0)
	;moveq	#$0,D0
	;jsr     $119c
	;andi.w  #$7,D0
	;add.w   D0,D0
	;move.w  _wqgun(PC,D0.w),D0
	move.w  #0008,($26,A0)
	move.w  ($8,A6),($8,A0)
	move.w  ($c,A6),($c,A0)
	move.w  ($10,A6),($10,A0)
	move.w  A6,($70,A0)
	move.w  A0,($b4,A6)
	movea.l  A6,A2
	movea.l  A0,A6
	moveq   #$0,D0
	jsr     $24d44
	move.w  #$258,($a4,A6)
	move.b  #$8,($5,A6)
	movea.l A6,A0
	movea.l A2,A6
	move.w  ($a0,A0),($b6,A6)
_not
	movem.l (A7)+, D0-D6/A0-A6
	rts
_wqgun
	;dc.l	$00000002,$00080008,$0006000a,$000c0002














*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
