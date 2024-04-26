*===================按开始键换人==========================
	org     $AAF6		*游戏中，时刻运行的指令
	jsr     _start_cc
	
*============================过场景刷新色板时重新写入=====================================
		org		$6010		*载入色板后部分指令
		jmp		_yuanzl
		org		$ee88
		jsr		_5BE6	
		
*--------------分配123P---------------------------------------		
	org		$146b8
	jsr		_ID_check
	org		$145fc
	jsr		_ID_check
	org		$144f8			/不动时
	jsr		_ID_check	
	org		$1443c
	jsr		_ID_check	
	org		$143ba
	jsr		_ID_check	
	org		$14368
	jsr		_ID_check						
	org		$142c2			/动时
	jsr		_ID_check			
	org		$14270
	jsr		_ID_check


	org		$192000			/空白地址
	
_ID_check
	cmpa.l  #$ffffb274,A0	/
	beq     _1p
	cmpa.l  #$ffffb3f4,A0
	beq     _2p
	cmpa.l  #$ffffb574,A0
	beq     _3p
_p_check_r
	movem.w D0-D3,(A4)
	addq.l  #8, A4
	rts
_1p
	andi.b  #$f0,D3	/
	bra	_p_check_r
_2p
	andi.b  #$f0,D3	/
	addq.b  #1, D3
	bra	_p_check_r
_3p
	andi.b  #$f0,D3	/
	addq.b  #2, D3
	bra	_p_check_r
*--------------------------------------
_start_cc
	jsr	$185fe
	movem.l  D0-D7/A0-A6,-(A7)       
	moveq	#$0,D2
	moveq	#$0,D3
	move.b  ($1a,A5),D2
	move.b  ($1f,A5),D3
	not.b   D3
	and.b   D3,D2
	btst     #$0,d2           ;1P按了开始
	bne      _1P_change
	btst     #$1,d2           ;2P按了开始
	bne      _2P_change     
	btst     #$2,d2           ;3P按了开始
	bne      _3P_change     
_bsover       
	movem.l  (A7)+,D0-D7/A0-A6         
	rts
_1P_change
	addq.b	#$1,($7f30,A5)
	moveq	#$0,D1
	move.b	($7f30,A5),D1
	andi.b	#$f,D1
	movea.l	#$914000,A1
	bsr	_write_123P
	bra	_bsover 
_2P_change
	moveq	#$0,D1
	addq.b	#$1,($7f31,A5)
	move.b	($7f31,A5),D1
	andi.b	#$f,D1
	movea.l	#$914020,A1
	bsr	_write_123P
	bra	_bsover 
_3P_change
	moveq	#$0,D1
	addq.b	#$1,($7f32,A5)
	move.b	($7f32,A5),D1
	andi.b	#$f,D1
	movea.l	#$914040,A1
	bsr	_write_123P
	bra	_bsover 
_write_123P
	lsl.w   #5,D1
	movea.l #$192400,A3
	adda.w  D1,A3
	movem.l (A3),D0-D6/A2
	movem.l D0-D6/A2,(A1)
	or.l	#$f000f000,(A1)+		/设置亮度，也可以直接改色板数据，首位加个F就可以了
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	rts

_5BE6
		jsr		$5be6
		bsr		_123random
		rts	
_yuanzl
		moveq   #$0,D0
		move.w  (A0)+,D0
		lsl.w   #5,D0
		movea.l #$b60bc,A3
		adda.l  D0,A3
		movem.l (A3)+,D0-D6/A2
		movem.l D0-D6/A2,(A1)
		lea     ($20,A1),A1
		dbra    D7,_yuanzl
		cmpi.b	#$c,($4d0,A5)
		beq	_123random
		rts
_123random
		movem.l D0-D6/A0-A3,-(A7)			*入栈
		moveq	#$0,D1
		move.b	($7f30,A5),D1
		andi.b	#$f,D1
		movea.l	#$914000,A1
		bsr	_write_no_light
		moveq	#$0,D1		
		move.b	($7f31,A5),D1
		andi.b	#$f,D1
		movea.l	#$914020,A1
		bsr	_write_no_light	
		moveq	#$0,D1		
		move.b	($7f32,A5),D1
		andi.b	#$f,D1
		movea.l	#$914040,A1
		bsr	_write_no_light
		movem.l	(A7)+,D0-D6/A0-A3
		rts
_write_no_light
		lsl.w   #5,D1
		movea.l #$192400,A3
		adda.w  D1,A3
		movem.l (A3),D0-D6/A2
		movem.l D0-D6/A2,(A1)
		rts
	
	org			$192400
_1tao
    dc.w       $0111,$0FCA,$0D96,$0A64,$0730,$0640,$0a31,$0c62
    dc.w       $0d84,$0fb8,$0fff,$0Bbd,$099b,$0779,$0FFF,$00A9
_1tao1	   
    dc.w       $0111,$0FCa,$0d96,$0a64,$0742,$0702,$0b06,$0f6a
    dc.w       $0Fad,$0Fef,$0d9F,$0b7d,$085a,$0527,$0FFF,$00A9 
_1tao2	   
    dc.w       $0111,$0fca,$0c96,$0a64,$0742,$0730,$0963,$0b96
    dc.w       $0dc9,$0ffc,$0bdf,$08ad,$057a,$0047,$0FFF,$00A9
_1tao3	  	   
    dc.w       $0111,$0FCA,$0C96,$0A64,$0742,$0555,$0777,$0999
    dc.w       $0bbb,$0ddd,$0Eee,$0ccc,$0aaa,$0888,$0FFF,$00A9

	   
_2tao	
    dc.w       $0111,$0fca,$0c96,$0a64,$0742,$0050,$0380,$06C5		/原版黄帽的，不要的`		
    dc.w       $09F8,$0DFB,$0FFC,$0FE0,$0FA0,$0B60,$0FFF,$00A9
_2tao1	   
    dc.w       $0111,$0FCA,$0C96,$0a64,$0742,$0568,$078a,$09ac
    dc.w       $0bce,$0dEF,$0f99,$0d66,$0a22,$0700,$0FFF,$00A9
_2tao2	   
    dc.w       $0111,$0fca,$0c96,$0a64,$0742,$0111,$0755,$0a88
    dc.w       $0dbb,$0Fee,$0f6c,$0d58,$0845,$0633,$0FFF,$00A9
_2tao3	  	   
    dc.w       $0111,$0fca,$0c96,$0a64,$0742,$0050,$0380,$06C5			
    dc.w       $09F8,$0DFB,$0cFF,$0adf,$089e,$065c,$0FFF,$00A9
		
		
_3tao	
    dc.w       $0111,$0FCA,$0c96,$0a64,$0742,$0800,$0B00,$0F60				
    dc.w       $0F90,$0FE0,$0FB0,$0E80,$0B50,$0730,$0FFF,$00A9
_3tao1	   
    dc.w       $0111,$0Fca,$0d97,$0953,$0640,$0333,$0555,$0777
    dc.w       $0999,$0ddd,$0ff0,$0da0,$0a60,$0640,$0fff,$00A9
_3tao2	   
    dc.w       $0111,$0fca,$0c96,$0a64,$0742,$0007,$023B,$047E
    dc.w       $08BE,$0CEF,$0CFF,$0ADF,$089E,$065C,$0FFF,$00A9
_3tao3	  	   
    dc.w       $0111,$0Fca,$0c96,$0a64,$0742,$0500,$0800,$0b00
    dc.w       $0f40,$0f80,$09cf,$069d,$007a,$0057,$0fff,$00A9	

_4tao	
    dc.w       $0111,$0111,$0111,$0111,$0111,$0111,$0111,$0111				
    dc.w       $0111,$0111,$0111,$0111,$0111,$0111,$0111,$00A9
_4tao1	   
    dc.w       $0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$0fff
    dc.w       $0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$00A9
_4tao2	   
    dc.w       $0111,$0FCA,$0C96,$0A64,$0742,$0555,$0777,$0999
    dc.w       $0bbb,$0ddd,$0Eee,$0ccc,$0aaa,$0888,$0FFF,$00A9
_4tao3	  	   
    dc.w       $0111,$0Fca,$0c96,$0a64,$0742,$0700,$0900,$0b00
    dc.w       $0d10,$0f30,$0cff,$09dd,$06aa,$0377,$0fff,$00A9


*-----------------NOP掉不可选相同人物指令-------------------------
		org		$b23a
		nop
		nop
		nop
		org		$442e
		nop
		nop
		nop
		org		$445a
		nop
		nop
		nop
		org		$4486
		nop
		nop
		nop
		nop









*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
