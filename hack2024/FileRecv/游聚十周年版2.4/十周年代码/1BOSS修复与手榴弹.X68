	org	$42884
	jmp	_1bossxf
	
	org	$19916
	nop
	jsr	_run_grenade


	org	$102f20	
_1bossxf
	tst.w	($26,A6)
	beq	_1boss
	jmp	$4288a
_1boss
	andi.w	#$3ff,($8,A6)
	jmp	$42890
*---------------------------手雷--------------------------------------
_run_grenade
	movea.w	($b4,A6),A0
	clr.b	($a8,A0)
	cmpi.w	#$1A,($26,A0)	*检测手里道具是否为手雷
	bne	_no_grenade
	cmpi.b	#$2,($3,A6)	*删去汉娜此功能
	beq	_no_grenade
	move.b	#$1,($a8,A0)
	cmpi.l	#$70405040,$2c9c0
	bne	_run_grenade
	cmpi.l	#$50506040,$2c9e6
	bne	_run_grenade
	cmpi.l	#$50506040,$2c9d6
	bne	_run_grenade
_no_grenade
	rts




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
