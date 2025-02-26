
*------------------------敌兵高血量颜色显示修复-----------------------------------
	org	$17834
	jsr	_xfxt
	rts
	
	
*========================================幻影大龙巡逻程序修改=============================================
	org	$10a58
	jsr	_11C_64_150
*-------------------------------大个子与4B晕厥------------------------------------
	org		$2b20a
	jmp		_yunque
	


	
	
	org	$185100
*------------------------敌兵高血量颜色显示修复-----------------------------------
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
	dc.l	$0fff0666,$079e0000,$0fff0111,$06660000

*========================================幻影大龙巡逻程序修改=============================================
_11C_64_150
	jsr	$2b904
	cmpi.w	#$11c,($20,A3)
	beq	_a376
	cmpi.w	#$150,($20,A3)
	beq	_a376
	cmpi.w	#$64,($20,A3)
	beq	_a376
	rts
_a376
	cmpi.b	#$3,($786,A5)
	bne	_rts
	move.w	A2,($76,A3)
_rts	
	rts

*-------------------------------大个子与4B晕厥------------------------------------
_yunque	
	cmpi.w		#$64,($20,A6)	/4BOSS不晕
	beq		_4b_yun
	cmpi.b		#$d,($3,A6)	/大个子不晕、1BOSS晕	
	beq		_2b54e	
	jmp		$2b214		/非64与48均晕	
_2b54e
	jmp		$2b54e		/不晕
_4b_yun
        cmpi.b          #$4,($4d9,A5)
        bne             _2b54e
        jmp             $2b214











*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
