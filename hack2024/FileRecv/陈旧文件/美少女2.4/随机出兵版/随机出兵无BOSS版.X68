;-----------------------------------------------------------
	;ORG	$a69c
	;nop
	;subi.w	#$1,($2e,A1)	/魔法-1

	;org	$5e78
	;move.w	#$4,($2e,A5)	/初始魔法等级4 	


	;org	$ab2e		/角色赋血
	;move.w	#$40,($30,A0)	


*-------------------------时间-------------------------------------------
	org	$301c6
	move.w	#$9099,($2416,A6)
	bra	$301d2

	org	$3019c
	jsr	$7e400
	org	$7e400
	cmpi.w	#$ffff,D0
	beq	_ffff	
	move.w	#$9999,($2418,A6)
	move.w	($2418,A6),($2416,A6)
	moveq	#$0,D0
	rts
_ffff
	move.w	D0,($2416,A6)
	moveq	#$0,D0
	rts	


*-------------------------随机出兵-----------------------------------------------
	org	$30248
	jmp	$7e500
	org	$7e500
	move.w	(A0)+,D0	
	cmpi.w	#$10,D0
	beq	_random
	cmpi.w	#$11,D0
	beq	_random
	cmpi.w	#$12,D0
	beq	_random
	cmpi.w	#$14,D0
	beq	_random
	cmpi.w	#$16,D0
	beq	_random
	cmpi.w	#$17,D0
	beq	_random
	cmpi.w	#$18,D0
	beq	_random
	move.w	(A0)+,D1
	move.w	(A0)+,D2
	jmp	$3024e
_random
	moveq	#$0,D1
	move.w	($2416,A6),D1
	add.w	D0,D1	
	divu.w	#$19,D1
	swap	D1
	mulu.w	#$4,D1
	move.w	_radomernmy(PC,D1),D0
	addi.w	#$2,D1
	move.w	_radomernmy(PC,D1),D4	/小类，出场方式
	move.w	(A0)+,D1
	move.w	(A0)+,D2
	move.w	(A0)+,D3
	add.w	($1386,A6),D2
	add.w	($138a,A6),D3
	add.w	D3,D3	
	adda.l	#$2,A0
	jmp	$3025c

_radomernmy
        dc.w    $0018,$0022,$0011,$0001,$0012,$0011,$0014,$0010
        dc.w    $0011,$0023,$0017,$0000,$0016,$0000,$0017,$0000
        dc.w    $0018,$0011,$0010,$0001,$0012,$0011,$0012,$0011
        dc.w    $0014,$0010,$0013,$0003,$0017,$0000,$0018,$0022
        dc.w    $0011,$0011,$0014,$0010,$0012,$0021,$0016,$0001
        dc.w    $0018,$0022,$0011,$0020,$0010,$0001,$0012,$0011,$0013,$0005  
        
        











*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
