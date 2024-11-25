*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
	ORG     $63900
	move.b  ($23,A6),($23,A0)
	ORG     $588ba
	jsr     $49ca.l
	
	ORG     $5c94a
	jsr     $49ca.l
	org     $4bf3c          //对话时色斑
	jmp     $49ca.l
	org     $4c05e  //4B色板
	jsr     $49ca.l
	org             $5FFAE
	jmp             $49ca.l
	org             $45d30
	jsr             $49ca.l
	org             $45892
	jsr             $49ca.l
	org             $5b2b2  //100
	jsr             $49ca.l
	org             $5b15e  //100
	jsr             $49ca.l

	org     $35a5c      
	moveq   #$0,D0
	move.b  ($5,A6),D0

	org             $3965c      
	moveq           #$0,D0
	move.b          ($5,A6),D0

*==========================================================================================================================	
	org	$2345e
	jsr	_seban
	org	$38e30		;屠夫额外的地址
	jsr	_tuseban14
	org    	$4c3b4		/4BOSS轨迹修复
	jmp    	_guiji4


	org	$101500
_seban
	moveq	#0,D0
	move.w	($20,A6),D0
	cmpi.w	#$158,D0
	beq	_seban_dalong	
	cmpi.w	#$f4,D0
	beq	_seban_tufu
	cmpi.w	#$11c,D0
	beq	_seban_huanying
	cmpi.w	#$140,D0
	beq	_seban_xiaokonglong
	cmpi.w	#$50,D0
	beq	_seban_houzi
	cmpi.w	#$c,D0
	beq	_seban_lianqiu	
	cmpi.w	#$18,D0
	beq	_seban_qinglang
	cmpi.w	#$64,D0
	beq	_seban_4boss
	cmpi.w	#$90,D0
	beq	_seban_5boss
	cmpi.w	#$A0,D0
	beq	_seban_tietou
	rts
;------------------------------------------------------------------	
_seban_houzi
	bra	_move_80
_seban_xiaokonglong
	tst.b	($4d9,A5)
	beq	_move_91	
	rts
_seban_tufu
	tst.b	($4d9,A5)
	beq	_move_9a	
	rts
_seban_dalong
	tst.b	($4d9,A5)
	beq	_move_91	
	cmpi.b	#$4,($4d9,A5)
	beq	_move_88
	rts
_seban_huanying	
	cmpi.b	#$2,($4d9,A5)
	beq	_move_96
	cmpi.b	#$5,($4d9,A5)
	beq	_move_82
	cmpi.b	#$7,($4d9,A5)
	beq	_move_93
	tst.b	($4d9,A5)
	beq	_move_93
	rts
_seban_lianqiu
	cmpi.b	#$7,($4d9,A5)
	beq	_move_85
	rts
_seban_qinglang
	tst.b	($4d9,A5)
	beq	_1guanjc    		
	cmpi.b	#$1,($4d9,A5)
	beq	_move_9e
	cmpi.b	#$2,($4d9,A5)
	beq	_move_9c
	cmpi.b	#$4,($4d9,A5)
	beq	_move_9e
	cmpi.b	#$5,($4d9,A5)
	beq	_move_8a
	rts
_1guanjc
	tst.b		($786,A5)
	bne		_move_9c
	rts
_seban_4boss
	tst.b	($4d9,A5)
	beq	_move_96
	cmpi.b	#$5,($4d9,A5)
	beq	_move_96
	cmpi.b	#$4,($4d9,A5)
	beq	_move_91
	cmpi.b	#$3,($4d9,A5)
	beq	_move_91
	rts
_seban_5boss
	cmpi.b	#$5,($4d9,A5)
	beq	_move_99
	rts
_seban_tietou
	cmpi.b	#$7,($4d9,A5)
	beq	_move_9f
	rts	
;---------------------------------------------------------------------------
_move_80
	move.b	#$80,($23,A6)
	rts

_move_82
	move.b	#$82,($23,A6)
	rts
_move_85
	move.b	#$85,($23,A6)
	rts
_move_88
	move.b	#$88,($23,A6)
	rts
_move_8a
	move.b	#$8a,($23,A6)
	rts
_move_91
	move.b	#$91,($23,A6)
	rts
_move_93
	move.b	#$93,($23,A6)
	rts
_move_96
	move.b	#$96,($23,A6)
	rts
_move_99
	move.b	#$99,($23,A6)
	rts
_move_9a
	move.b	#$9a,($23,A6)
	rts
_move_9c
	move.b	#$9c,($23,A6)
	rts
_move_9e
	move.b	#$9e,($23,A6)
	rts
_move_9f
	move.b	#$9f,($23,A6)
	rts

;---------------------------f4------------------------------------------
_tuseban14
	tst.b	($4d9,A5)
	beq	_move_9a
	rts

_guiji4
	;cmpi.b 	#$3,($4d9,A5)
	;bne    	_4Bxf_
	;cmpi.b 	#$2,($786,A5)
	;bne    	_4Bxf_
	;cmpi.b	#$400,($744,A5)
	;ble	_4Bxf_ 
	;jsr	$1862
	;jmp	$4c3ba
_4Bxf_
	jmp	$4c3ae














*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
