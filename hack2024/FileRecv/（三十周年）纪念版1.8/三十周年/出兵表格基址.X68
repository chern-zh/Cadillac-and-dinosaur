*-----------------------走动场景出兵-------------------------------------------
	org	$fb94
	jsr	$18b000
	org	$18b000
	tst.b	($7f88,A5)		/是否模式四
	beq	_yuanbg1			/否，走原指令
	moveq	#$0,D0
	move.b	($4d9,A5),D0
	add.w	D0,D0
	add.w	D0,D0
	movea.l	_zdbg(PC,D0),A1
	
_yuanbg1
	moveq	#$0,D0
	move.b	($786,A5),D0
	rts
_zdbg
	dc.l	$00180000,$00180500,$00180c00,$00181600
	dc.l	$00182000,$00182b00,$00183300,$00184300	
	
*-----------------------固定场景出兵-------------------------------------------
	org	$81266		/加载每关固定场景出兵表格基址
	jmp	$18b100
	org	$18b100
	moveq	#$0,D0
	move.b	($4d9,A5),D0	
	tst.b	($7f88,A5)		/是否模式四
	beq	_yuanbg2			/否，走原指令
	add.w	D0,D0
	add.w	D0,D0
	movea.l	_gdcbbg(PC,D0),A0	
	jmp	$81274	
_gdcbbg
	dc.l	$00180300,$00180800,$00181400,$00181b00
	dc.l	$00182400,$00182e00,$00183900,$00184700
_yuanbg2
	jmp	$8126c
	
*-----------------------BOSS战场景出兵-------------------------------------------
	org	$81e26
	jmp	$18b200
	org	$18b200
	moveq	#$0,D0
	move.b	($4d9,A5),D0
	tst.b	($7f88,A5)		/是否模式四
	beq	_yuanbg3			/否，走原指令
	add.w	D0,D0
	add.w	D0,D0
	movea.l	_bossbg1(PC,D0),A0		/按时间出兵表格
	movea.l	_bossbg2(PC,D0),A1		/按心情出兵表格
	jmp	$81e38
_bossbg1
	dc.l	$00184e00,$00185300,$00185b00,$00186100
	dc.l	$00187700,$00187c00,$00188700,$00189000	
_bossbg2
	dc.l	$00184f00,$00185400,$00185c00,$00186400
	dc.l	$00187800,$00187d00,$00188800,$00189500
_yuanbg3
	jmp	$81e2c
























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
