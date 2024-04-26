*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org	$17766
	jsr	_xfxt
	rts
	org	$101c00
_1hsj
	dc.w	$000d,$000e,$000f
_3hsj
	dc.w	$01a0,$01c0,$01e0
_xfxt
	moveq   #$0,D4
	move.b  ($0,A6),D4
	add.w   D4,D4
	move.w  _1hsj(PC,D4.w),($8,A3)
	addi.w  #$180,($8,A3)
	move.w  _3hsj(PC,D4.w),D5
	move.w  D0,D3
	moveq   #$0,D4
_17782
	cmpi.w  #$64,D3
	ble     _17794
	subi.w  #$64,D3
	addq.w  #$2,D4
	bra     _17782
_17794
	move.w  D4,($a,A3)
	add.w   D4,D4
	add.w   D4,D4
	movea.l #$914400,A1
	adda.w  D5,A1
	lea     ($6,A1),A1
	moveq   #$2,D0
_177aa
	moveq   #$0,D5
	move.w  (A1),D5
	andi.w  #$f000,D5
	or.w    _2hsj(PC,D4.w),D5
	addq.w  #2,D4
	move.w  D5,(A1)+
	dbra    D0,_177aa
	move.w  D3,D0
	rts
_2hsj
	dc.l	$0fff0fe0,$0e000000,$0fff0909,$0fe00000
	dc.l	$0fff05e5,$09090000,$0fff000d,$05e50000
	dc.l	$0fff0ecb,$000d0000,$0fff0e4a,$0ecb0000
	dc.l	$0fff07cf,$0e4a0000,$0fff00aa,$07cf0000
	dc.l	$0fff0458,$00aa0000,$0fff079e,$04580000






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
