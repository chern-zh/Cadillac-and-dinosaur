*-----------------NOP掉不可选相同人物指令-------------------------
		org		$b23e
		nop
		org		$442e
		nop
		nop
		org		$445a
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
*-----------------------------------------------------------------
	org		$437c		/续币与选中人物
	jsr		_continue_coin
	org		$19250		/按方向键时
	jsr		_moving
	
	org		$1d0100
_moving
	moveq   #$0, D0
	move.b  D0, ($80,A6)	
	bra		_seban
_continue_coin
	move.b  #$1, ($0,A6)
_seban
	movem.l D0-D1/A1-A2, -(A7)
	clr.l   D0
	clr.l   D1
	movea.l #$0, A1
	movea.l #$0, A2
	bsr     _color123p
	movem.l (A7)+, D0-D1/A1-A2
	rts


_color123p
	movea.l #_1tao, A1		/1P专用第1套色板起始地址载入A1
	movea.l #$914000, A2		/1P显存地址载入A2
	cmpa.l	#$ffffb274, A6		/是否1P
	beq     _check_name
	adda.l	#$80,A1			/2P专用第2套色板起始地址载入A1
	adda.l	#$20,A2			/2P显存地址载入A2
	cmpa.l  #$ffffb3f4, A6		/
	beq     _check_name
	adda.l	#$80,A1			/3P专用第3套色板起始地址载入A1
	adda.l	#$20,A2			/3P显存地址载入A2
	cmpa.l  #$ffffb574, A6		/
	beq     _check_name
	rts


_check_name
	cmpi.b  #$0, ($3,A6)		/是否杰克
	beq     _move_color	
	adda.l	#$20,A1
	cmpi.b  #$2, ($3,A6)		/汉娜
	beq     _move_color
	adda.l	#$20,A1
	cmpi.b  #$1, ($3,A6)		/黄帽
	beq     _move_color
	adda.l	#$20,A1
	bra		_move_color			/只有麦斯了，不用检测了，直接跳吧
	;cmpi.b  #$3, ($3,A6)		/麦斯
	;beq     _move_color

_move_color
	clr.l   D0		/
	move.b  #$f, D0
A1_A2_loop
	dbra    D0, A1_A2_goon	/循环
	rts

A1_A2_goon

	move.w	(A2),D1
	andi.w	#$f000,D1
	move.w  (A1)+,(A2)	
	or.w	D1,(A2)+
	bra     A1_A2_loop

_1tao
	dc.w       $0111,$0FCA,$0D96,$0A64,$0730,$0640,$0a31,$0c62
	dc.w       $0d84,$0fb8,$0fff,$0Bbd,$099b,$0779,$0FFF,$00A9
_1tao1	   
	dc.w       $0111,$0FCB,$0EA8,$0B75,$0843,$0702,$0b06,$0f6a
	dc.w       $0Fad,$0Fef,$0d9F,$0b7d,$085a,$0527,$0FFF,$00A9 
_1tao2	   
	dc.w       $0111,$0E87,$0A54,$0643,$0430,$0703,$0a06,$0d5a
	dc.w       $0f8a,$0fce,$09cf,$069d,$007a,$0057,$0FFF,$00A9
_1tao3	  	   
	dc.w       $0111,$0FCA,$0C96,$0A64,$0742,$0555,$0777,$0999
	dc.w       $0bbb,$0ddd,$0Eee,$0ccc,$0aaa,$0888,$0FFF,$00A9

	   
_2tao	
	dc.w       $0111,$0E87,$0A54,$0643,$0430,$0050,$0380,$06C5			
	dc.w       $09F8,$0DFB,$0FFC,$0FE0,$0FA0,$0B60,$0FFF,$00A9
_2tao1	   
	dc.w       $0111,$0FCA,$0C86,$0853,$0630,$0058,$007C,$06BE
	dc.w       $09EF,$0FEF,$0ECF,$0B9D,$097A,$0657,$0FFF,$00A9
_2tao2	   
	dc.w       $0111,$0E87,$0A54,$0643,$0430,$0500,$0800,$0B00
	dc.w       $0F40,$0F80,$0AFC,$0DF0,$05A0,$0270,$0FFF,$00A9
_2tao3	  	   
	dc.w       $0111,$0fca,$0c96,$0a64,$0742,$0050,$0380,$06C5			
	dc.w       $09F8,$0DFB,$0cFF,$0adf,$089e,$065c,$0FFF,$00A9
		
		
_3tao	
	dc.w       $0111,$0FCA,$0D98,$0963,$0750,$0800,$0B00,$0F60				
	dc.w       $0F90,$0FE0,$0FB0,$0E80,$0B50,$0730,$0FFF,$00A9
_3tao1	   
	dc.w       $0111,$0FA8,$0B75,$0740,$0430,$0070,$0890,$0DC3
	dc.w       $0FF8,$0EFC,$0FEB,$0DB8,$0A96,$0860,$0FFF,$00A9
_3tao2	   
	dc.w       $0111,$0E87,$0A54,$0643,$0430,$0007,$023B,$047E
	dc.w       $08BE,$0CEF,$0CFF,$0ADF,$089E,$065C,$0FFF,$00A9
_3tao3	  	   
	dc.w       $0111,$0Fca,$0c96,$0a64,$0742,$0500,$0800,$0b00
	dc.w       $0f40,$0f80,$09cf,$069d,$007a,$0057,$0fff,$00A9





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
