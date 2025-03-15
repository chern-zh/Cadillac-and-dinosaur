
*----------------开局暴击------------------------
	;org		$1f5c
	;jsr		$	
*-----------------------------------------------------------------------------------
	org		$1166a
	jmp		$181000
	org		$181000
	move.w		($6c,A3),D0		;跳转破坏的指令
	moveq  		#$0, D1			;跳转破坏的指令
	cmpi.b		#$1,($7f88,A5)
	beq		_bj_ms1
	cmpi.b		#$2,($7f88,A5)
	beq		_bj_ms2
	cmpi.b		#$3,($7f88,A5)
	beq		_bj_ms3
_bj_ms4	
	cmpi.b		#$6,($4d9,A5)
	bne		_ms4goon	
	cmpi.b		#$3,($786,A5)
	bne		_ms4goon
	tst.b		($7f18,A5)
	bne		_ms4goon
_1_suo20
	move.b		#$28,($c6,A3)		/模式四，7关底单人锁28
	bra		_hannanjc			
_ms4goon
        cmpi.w  #$4b, D0		;75%血量
        bcc     _suiji4_
        moveq   #$20, D1
        cmpi.w  #$32, D0		;50%血量
        bcc     _suiji4_
        moveq   #$40, D1
        cmpi.w  #$19, D0			;25%血量
        bcc     _suiji4_
        moveq   #$60, D1		
_suiji4_        
        jsr     $119c
        andi.w  #$1f,D0
        add.w   D0,D1
        move.l  A6,-(A7)
        movea.l #$1065e0,A6
	move.b	(A6,D1.w),($c6,A3)
	movea.l	(A7)+,A6
	bra	_hannanjc	
	
_bj_ms1	
        cmpi.w  #$4b, D0		;75%血量
        bcc     _suiji1_
        moveq   #$20, D1
        cmpi.w  #$32, D0		;50%血量
        bcc     _suiji1_
        moveq   #$40, D1
        cmpi.w  #$19, D0			;25%血量
        bcc     _suiji1_
        moveq   #$60, D1		
_suiji1_        
        jsr     $119c
        andi.w  #$1f,D0
        add.w   D0,D1
        move.l  A6,-(A7)
        movea.l #$106400,A6
	move.b	(A6,D1.w),($c6,A3)
	movea.l	(A7)+,A6
	bra	_hannanjc

_bj_ms2
        ;cmpi.w  #$140, D0		;320%血量
        ;bcc     _suiji2_
        ;moveq   #$20, D1
        ;cmpi.w  #$f0, D0		;240%血量
        ;bcc     _suiji2_
        ;moveq   #$40, D1
        ;cmpi.w  #$a0, D0			;160%血量
        ;bcc     _suiji2_
        ;moveq   #$60, D1
        ;cmpi.w  #$50, D0			;80%血量
        ;bcc     _suiji2_
        ;move.w   #$80, D1		
_suiji2_        
        jsr     $119c
        andi.w  #$3f,D0
        move.l  A6,-(A7)
        movea.l #$106480,A6
	move.b	(A6,D0.w),($c6,A3)
	movea.l	(A7)+,A6
	bra	_hannanjc
	
_bj_ms3
        cmpi.w  #$50, D0		;80%血量
        bcc     _suiji3_
        moveq   #$20, D1
        cmpi.w  #$37, D0		;55%血量
        bcc     _suiji3_
        moveq   #$40, D1
        cmpi.w  #$1e, D0			;30%血量
        bcc     _suiji3_
        moveq   #$60, D1
        cmpi.w  #$a, D0			;10%血量
        bcc     _suiji3_
        move.w   #$80, D1
        cmpi.w  #$5, D0			;5%血量
        bcc     _suiji3_
        move.w   #$a0, D1		
_suiji3_        
        jsr     $119c
        andi.w  #$1f,D0
        add.w   D0,D1              
        move.l  A6,-(A7)
        movea.l #$106520,A6
	move.b	(A6,D1.w),($c6,A3)
	movea.l	(A7)+,A6
	bra	_hannanjc

;----------------------------------------------------------		
_hannanjc
	cmpi.b	#$2,($3,A3)	/是否汉娜
	bne	_jack
	addi.b	#$6,($c6,A3)	/汉娜暴击+6
_rts
	rts	

_jack
	tst.b	($3,A3)		/是否杰克
	bne	_rts
	addi.b	#$3,($c6,A3)	/杰克暴击+3
	rts












*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
