	org	$20ea4
	jsr	_qzdq		/Ç¿ÖÆµôÇ¹³ÌÐò
	
	;org         $64c4
	;jmp         _gongji_l
*--------------------------------------------------------------------------
	org	$102d00	
_qzdq	
	jsr	$8e4c
	cmpi.b	#$7,($4d9,A5)
	bne	_rts
	cmpi.b	#$3,($786,A5)
	bne	_rts
	cmpi.w	#$201,($3274,A5)
	bne	_2p
	move.w	#$101,($3274,A5)
_2p
	cmpi.w	#$201,($33f4,A5)
	bne	_3p
	move.w	#$101,($33f4,A5)
_3p
	cmpi.w	#$201,($3574,A5)
	bne	_qq
	move.w	#$101,($3574,A5)
_qq
	clr.l	$ffb328
	clr.l	$ffb4a8
	clr.l	$ffb628
_rts
	rts
_gongji_l
        lsr.w           #5,D1           *ÉËº¦¿ÛÑªÖµ
        bne             _compute
        jmp             $64ca
_compute	
        tst.b           ($7f70,A5)
        beq             _64cc
        cmpi.b          #$2,($dd,A2)
        bge             _shhjb
        tst.b           ($dd,A2)
        beq             _jca0a2
_64cc
        jmp             $64cc
_shhjb
        mulu.w          #$7,D1
        divu.w          #$5,D1
        jmp             $64cc
_jca0a2
        movem.l         A3,-(A7)
        cmpi.w          #$c8f4,($a0,A2)
        bcs             _a2a2
        cmpi.w          #$dd14,($a0,A2)
        bhi             _a2a2
        movea.w         ($a0,A2),A3
        bra             _jc2n
_a2a2
        cmpi.w          #$c8f4,($a2,A2)
        bcs             _zhjchzh
        cmpi.w          #$dd14,($a2,A2)
        bhi             _zhjchzh
        movea.w         ($a2,A2),A3 
_jc2n
        cmpi.b          #$2,($dd,A3)
        bge             _shhjb1
_zhjchzh
        movem.l         (A7)+,A3
        jmp             $64cc
_shhjb1
        mulu.w          #$7,D1
        divu.w          #$5,D1
        bra             _zhjchzh








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
