*-----------------------------------------------------------
* 名称       :
* 说明       :($28,A6)为动作地址
* 制作       :判断晕厥点处断点，监视($28,A6)第一次读即为起始地址
*-----------------------------------------------------------
	;ORG  $1236
	
	*大个子：2FE92   0807
	*1BOSS：2FCAE开始  0007
*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
        org		$588ba          *屠夫
        jsr		_tufu_y_xf
        org         $50810
        jmp         _7c_y_xf
*================================汉娜招式==============================
	    org	    $143e
	    jsr	    _zhaoshi	
	
	
	    org		$187a00
	    dc.l	    $17B08000,$00000405,$00285000,$17B08000   		/17A8为胳膊肘66A
	    dc.l	    $0100040F,$00285000,$17C08000,$020004C6 
	    dc.l	    $00285000,$FFF40000
_zhaoshi
	cmpa.l	#$A1340,A0
	bne	    _no_change
	movea.l	#$187a00,A0		/更换A0地址
_no_change
	move.l	A0,($28,A6)
	move.w	(A0)+,D0
	rts
_tufu_y_xf
	jsr		$49ca
	movem.l	D0-D1,-(A7)
	move.w	($10,A6),D0	    /Y
	cmpi.b   #$4,($4d9,A5)
	bne      _no_y
_ceshi_y
	move.w   ($748,A5),D1
	cmp.w	D1,D0		/Y坐标是否低于卷轴Y
	bge		_and_37f
	move.w	D1,($10,A6)
	addi.w   #$20,($10,A6)
	movem.l	(A7)+,D0-D1
	rts
_all_rts
    move.w      ($10,A6),D1
    cmp.w       D0,D1
    beq         _nowj_y
    tst.b       ($3274,A5)
    beq         _c2p
    move.w      ($3284,A5),($10,A6)
    bra         _nowj_y 
_c2p
    tst.b       ($33f4,A5)
    beq         _c3p
    move.w      ($3404,A5),($10,A6)
    bra         _nowj_y
_c3p
    tst.b       ($3574,A5)
    beq         _nowj_y
    move.w      ($3584,A5),($10,A6)
_nowj_y    
	movem.l	(A7)+,D0-D1
	rts		
_no_y
	cmpi.b      #$7,($4d9,A5)
	bne         _2guanjc
    cmpi.b      #$1,($786,A5)
    beq         _ceshi_y
    tst.b      ($786,A5)
    beq         _and_7f
    cmpi.w      #$710,($744,A5)
    ble         _all_rts
    bra         _and_1ff
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
    bra         _and_1ff
_1guanjc
    tst.b       ($4d9,A5)
    bne         _and_7f
    cmpi.b      #$1,($786,A5)
    beq         _and_7f
_and_1ff     
	and.w       #$1ff,($10,A6)
	bra         _all_rts
_and_37f     
	and.w       #$37f,($10,A6)
	bra         _all_rts
_and_7f     
	and.w       #$7f,($10,A6)
	bra         _all_rts
_and_ff     
	and.w       #$ff,($10,A6)
	bra         _all_rts
_and_17f     
	and.w       #$17f,($10,A6)
	bra         _all_rts	
_7c_y_xf
        move.w      (A0)+,($10,A1)
        cmpi.b      #$2,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$3,($4d9,A5)
        beq         _7c_rts
        tst.b       ($786,A5)
        bne         _move_a6
        cmpi.b      #$5,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$1,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$7,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$6,($4d9,A5)
        bne         _move_a6
        cmpi.w      #$700,($744,A5)
        bge         _7c_rts
_move_a6
        movem.l     A6,-(A7)
        cmpi.w      #$b274,($76,A6)
        beq         _move76
        cmpi.w      #$b3f4,($76,A6)
        beq         _move76
        cmpi.w      #$b574,($76,A6)
        beq         _move76
        cmpi.w      #$b274,($76,A1)
        beq         _move761
        cmpi.w      #$b3f4,($76,A1)
        beq         _move761
        cmpi.w      #$b574,($76,A1)
        beq         _move761
        movem.l     (A7)+,A6
        rts
_move76
        movea.w     ($76,A6),A6
        move.w      ($10,A6),($10,A1)
        movem.l     (A7)+,A6
        rts
_move761
        movea.w     ($76,A1),A6
        move.w      ($10,A6),($10,A1)
        movem.l     (A7)+,A6
_7c_rts
        rts




























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
