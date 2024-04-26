*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org		$588ba
	jsr		$187a00
	org		$187a00
	jsr		$49ca
	cmpi.b      #$1,($4d9,A5)
	beq         _jc222guan
	cmpi.b      #$6,($4d9,A5)
	bne         _dd56
	cmpi.b      #$1,($786,A5)
	bne         _goYYY
	tst.w       ($748,A5)
	bne         _jc222guan
	bra         _goYYY
_dd56
    cmpi.b      #$5,($4d9,A5)
    bne         _fei6
    cmpi.b      #$1,($786,A5)
    beq         _and_17f
    bra         _goYYY
_fei6
	cmpi.b      #$7,($4d9,A5)
	bne         _goYYY
	cmpi.b      #$2,($786,A5)
	bne         _goYYY
	cmpi.w      #$700,($744,A5)
     bge        _goYYY
     andi.w     #$3ff,($10,A6)
     ;cmpi.w     #$200,($10,A6)
     ;bge        _jc222guan
     ;move.w     #$220,($10,A6)
     rts	
_goYYY
	movem.l	D0-D1,-(A7)
	move.w	($748,A5),D0	/Y卷轴
	move.w	($10,A6),D1	/屠夫Y
	cmp.w	D0,D1		/Y坐标是否低于卷轴Y
	ble		_Yrr
	movem.l	(A7)+,D0-D1
_jc222guan	
	cmpi.b      #$4,($4d9,A5)
	beq         _and_37f
	cmpi.b      #$7,($4d9,A5)
	bne         _2guanjc
    cmpi.b      #$1,($786,A5)
    beq         _and_37f
    tst.b      ($786,A5)
    beq         _and_7f
    bra         _and_17f
_2guanjc
    cmpi.b      #$1,($4d9,A5)
    bne         _6guanjc
    cmpi.b      #$2,($786,A5)
    beq         _and_ff
    bra         _and_7f
_6guanjc
    cmpi.b      #$5,($4d9,A5)
    bne         _1guanjc
    tst.b       ($786,A5)
    beq         _and_7f
    cmpi.b      #$1,($786,A5)
    beq         _and_17f
    bra         _and_1ff
_1guanjc
    tst.b       ($4d9,A5)
    bne         _and_7f
    cmpi.b      #$1,($786,A5)
    beq         _and_7f
    ;bra         _and_1ff
_and_1ff     
	and.w       #$1ff,($10,A6)
	rts
_and_37f     
	and.w       #$37f,($10,A6)
	rts
_and_7f     
	and.w       #$7f,($10,A6)
	rts
_and_ff     
	and.w       #$ff,($10,A6)
	rts
_and_17f     
	and.w       #$17f,($10,A6)
	rts	
_Yrr
	move.w	($748,A5),($10,A6)
	addi.w	#$10,($10,A6)
	movem.l	(A7)+,D0-D1
	rts
	;cmpi.b	#$1,($4d9,A5)		/2关不需修复
	;beq		_r
	;cmpi.b	#$5,($4d9,A5)
	;beq		_tree_
	;cmpi.b	#$6,($4d9,A5)
	;beq		_dianti
	;cmpi.b	#$7,($4d9,A5)
	;bne		_xf
	;cmpi.b	#$2,($786,A5)
	;bne		_xf
	;cmpi.w	#$730,($744,A5)
	;bge		_xf
_r
	;rts
_dianti
	cmpi.b	#$1,($786,A5)
	bne		_xf
	tst.w	($748,A5)
	beq		_xf
	rts
_tree_
	cmpi.b	#$1,($786,A5)
	bne		_xf
	rts
_xf
	movem.l	D0-D1,-(A7)
	move.w	($748,A5),D0	/Y卷轴
	move.w	($10,A6),D1	/屠夫Y
	cmp.w	D0,D1		/Y坐标是否低于卷轴Y
	ble		_Yxiufu
	sub.w	D0,D1
	cmpi.w	#$80,D1
	bcc		_Yxiufu
	bra		_X	
_Yxiufu
	move.w	($748,A5),($10,A6)
	addi.w	#$20,($10,A6)
_X
	move.w	($744,A5),D0
	move.w	($8,A6),D1
	cmp.w	D0,D1
	ble		_XX
	sub.w	D0,D1
	cmpi.w	#$200,D1
	bcc		_xiufuX
	movem.l	(A7)+,D0-D1
	rts
	
_XX
	sub.w	D1,D0
	cmpi.w	#$80,D0
	bcc		_xiufuX
	movem.l	(A7)+,D0-D1
	rts
_xiufuX
	move.w	($744,A5),($8,A6)
	addi.w	#$80,($8,A6)
	movem.l	(A7)+,D0-D1
	rts


















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
