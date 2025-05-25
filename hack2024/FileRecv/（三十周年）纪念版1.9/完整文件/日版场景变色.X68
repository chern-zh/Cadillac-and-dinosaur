		org		$5c74
		nop
		jsr		_rbjt	
		
		org		$5de6
		nop
		jsr		_rbjt	


		

		org		$184100	
_rbjt		
		movem.l   d0-d6/a2,(a1)				;
		
		cmpi.b		#$1,($4d9,A5)		
		beq		_hs
		tst.b		($4d9,A5)
		bne		_8ad2_tui
		cmpi.b		#$2,($786,A5)
		beq		_hs
		bra		_8ad2_tui		
		
_hs
		cmpi.b		#$4,($7f88,A5)
		beq		_ms4
		cmpi.b		#$3,($7f88,A5)
		beq		_ms3
		bra		_8ad2_tui

_ms4
		cmpa.l	#$914800,a1					;小于918000的不要交换，可能是人物色板跟其他
		blt		_8ad2_tui		
		;---------------------------------
		movem.l	D0-D7,-(a7)					;再次改变写入显存数据的R跟G色(交换)		
		move.w	#$f,D4						;循环计数		
_bhjhgoon
		move.w	(a1),D0						;要变换的数据给D0	
			;；--------低1位→低3位---------
		move.w	D0,D3						;复制份给D3 
		lsl.W	#$8,D3						;低1位→低3位
		andi.L	#$f00,D3					;留低3位
			;；--------低3位→低1位---------		
		move.w	D0,D1						;复制份给D1			
		lsr.W	#$8,D1						;低3位→低1位		
		andi.L	#$f,D1						;留低1位	
			;；----------低2位----------
		move.l	D0,D2						;用来放低2位
			;；----------最终交换----------		
		andi.L	#$f0f0,D2					;要交替的位置都清零，其他2、4位保留		
		or.l	D1,D2						;低3位写入
		or.l	D3,D2						;低1位写入
			;---------------------------------
		move.w  D2, (A1)+					;最终结果D2写入显存
		dbra	d4,_bhjhgoon				;循环20次(f)后退出	
		movem.l	(a7)+,D0-D7		
		suba.l  #$20,a1						;显存地址回到开始处
		;----------------------------------
_8ad2_tui
		lea   	($20,a1),a1					;下一组色板
		rts
		
_ms3		
		cmpa.l	#$914800,a1					;小于918000的不要交换，可能是人物色板跟其他
		blt	_8ad2_tui1	
		;---------------------------------
		movem.l	D0-D7,-(a7)					;再次改变写入显存数据的R跟G色(交换)		
		move.w	#$f,D4						;循环计数		
_bhjhgoon1
		move.w	(a1),D0						;要变换的数据给D0	
		clr.l	D1
		move.b	D0,D1
		andi.w	#$ff00,D0
		ror.w	#$8,D0
		ror.b	#$4,D0
		ror.w	#$8,D1
		add.w	D1,D0
		ror.w	#$4,D0
		move.w  D0, (A1)+					;最终结果D2写入显存
		dbra	d4,_bhjhgoon1				;循环20次(f)后退出	
		movem.l	(a7)+,D0-D7		
		suba.l  #$20,a1						;显存地址回到开始处
		;----------------------------------
_8ad2_tui1
		lea   	($20,a1),a1					;下一组色板
		rts
	

		
		
		
		
		
		
		






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
