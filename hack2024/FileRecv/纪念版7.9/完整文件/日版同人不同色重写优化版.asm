*---------------------------美版代码借用--------------------------------
			;org		$145c6			;不动的时的搬砖程序
			;jsr		$1d0000	
			;org		$1450a
			;jsr		$1d0000			
			;org		$14786
			;jsr		$1d0000
			;org		$146ca
			;jsr		$1d0000
			;org		$1450a
			;jsr		$1d0000
			;org		$14488
			;jsr		$1d0000
			;org		$14436
			;jsr		$1d0000			
			;org		$14390			;动时的搬砖程序
			;jsr		$1d0000			
			;org		$1433e
			;jsr		$1d0000
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
*--------------分配123P---------------------------------------		
	org		$14368
	jsr		_ID_check
	org		$143ba
	jsr		_ID_check
	org		$145fc
	jsr		_ID_check
	org		$146b8
	jsr		_ID_check
	org		$144f8			/不动时
	jsr		_ID_check	
	org		$1443c
	jsr		_ID_check									
	org		$142c2			/动时
	jsr		_ID_check			
	org		$14270
	jsr		_ID_check

	org		$1d0000			/空白地址
_ID_check
	bsr     _check_P
	movem.w D0-D3, (A4)
	addq.l  #8, A4
	rts
_check_P
	cmpa.l  #$ffffb274, A0	/
	beq     _1p
	cmpa.l  #$ffffb3f4, A0
	beq     _2p
	cmpa.l  #$ffffb574, A0
	beq     _3p
	rts
_1p
	andi.b  #$f0, D3	/
	rts
_2p
	andi.b  #$f0, D3	/
	addq.b  #1, D3
	rts
_3p
	andi.b  #$f0, D3	/
	addq.b  #2, D3
	rts

*============================角色随机衣服优化版=====================================
		org		$6010		*载入色板后部分指令
		jmp		_yuanzl

		org		$ee88
		jsr		_5BE6
		
		org		$184c00
_5BE6
		jsr		$5be6
		jsr		_123random
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
		beq		_123random
		rts
_123random
		movem.l D0-D1/A1-A2,-(A7)
		moveq	#$0,D1
_1P_check
		moveq	#$0,D0
		tst.b	($333b,A5)
		beq		_1P_apply
		move.b	($333b,A5),D0
		movea.l	#$914000,A2
		bsr		_write_123P
_2P_check		
		moveq	#$0,D0
		tst.b	($34bb,A5)
		beq		_2P_apply
		move.b	($34bb,A5),D0
		movea.l	#$914020,A2
		bsr		_write_123P		
_3P_check		
		moveq	#$0,D0
		tst.b	($363b,A5)
		beq		_3P_apply
		move.b	($363b,A5),D0
		movea.l	#$914040,A2
		bsr		_write_123P
		movem.l (A7)+, D0-D1/A1-A2
		rts		
_1P_apply
		moveq	#$0,D0
		jsr		$119c
		divu.w	#$c,D0					*求余, 即限制范围
		swap	D0		    			*余数在高位，交叉下
		addi.b	#$1,D0					*平移随机区间
		move.b	($34bb,A5),D1
		cmp.b	D1,D0
		beq		_1P_apply
		move.b	($363b,A5),D1
		cmp.b	D1,D0
		beq		_1P_apply
		move.b	D0,($333b,A5)				*色板号也写入1P内存中
		movea.l	#$914000,A2
		jsr		_write_123P
		bra		_2P_check
_2P_apply
		moveq	#$0,D0
		jsr		$119c
		divu.w	#$c,D0					*求余, 即限制范围(0，7)
		swap	D0		    			*余数在高12位，交叉下
		addi.b	#$1,D0					*平移随机区间至(1，8)
		move.b	($333b,A5),D1
		cmp.b	D0,D1
		beq		_2P_apply
		move.b	($363b,A5),D1
		cmp.b	D0,D1
		beq		_2P_apply
		move.b	D0,($34bb,A5)				*色板号也写入2P内存中
		movea.l	#$914020,A2
		jsr		_write_123P
		bra		_3P_check
_3P_apply
		moveq	#$0,D0
		jsr		$119c
		divu.w	#$c,D0					*求余, 即限制范围(0，7)
		swap	D0		    			*余数在高位，交叉下
		addi.b	#$1,D0					*平移随机区间至(1，8)
		move.b	($34bb,A5),D1
		cmp.b	D0,D1
		beq		_3P_apply
		move.b	($333b,A5),D1
		cmp.b	D0,D1
		beq		_3P_apply
		move.b	D0,($363b,A5)				*色板号也写入3P内存中
		movea.l	#$914040,A2
		jsr		_write_123P
		movem.l (A7)+, D0-D1/A1-A2
		rts		
_write_123P
		subi.b	#$1,D0
		mulu.w	#$20,D0
		movea.l	#_1tao,A1
		adda.l	D0,A1
_move_color
		moveq	#$0,D1		/
		move.b  #$f, D1
A1_A2_loop
		dbra    D1, A1_A2_goon	/循环
		rts

A1_A2_goon
		move.w  (A1)+,(A2)+		/
		bra     A1_A2_loop

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



	