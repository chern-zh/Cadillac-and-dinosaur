*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org	$11770		*挨打刷爆击，写
	move.b	(A6,D1.w),($11e,A3)
	
	org	$2b98a		*读
	move.b	($11e,A2),D0
	
	org	$2babc		*读
	move.b	($11e,A6),D0
	
	org	$4ac1a
	move.b	($11e,A2),D0
	
	org	$4ad4c
	move.b	($11e,A6),D0

*------------------------------------暴击显示-------------------------------------------
	;org		$103ba                      ;毫秒-1指令
	;jmp		_ms
	org		$18d88
			nop
	jmp		_ms
	
*================================同人不同色======================================
*--------------分配123P---------------------------------------		
		
	org		$145c6	
	jsr		_ID_check					
	org		$14786
	jsr		_ID_check	
	org		$146ca
	jsr		_ID_check	
	org		$1450a
	jsr		_ID_check	
	org		$14488
	jsr		_ID_check	
	org		$14436
	jsr		_ID_check				
	org		$14390			
	jsr		_ID_check				
	org		$1433e
	jsr		_ID_check		
*-----------------NOP掉不可选相同人物指令-------------------------
	org	$b23a
	nop
	nop
	nop
	
	org	$728c
	nop
	nop
	nop
	
	org	$72b8
	nop
	nop
	nop
	
	org	$72e4
	nop
	nop
	nop
	nop

*---------------------------------暴击显示----------------------------------------------------------------
	org		$101d00
_ms
	bsr		_bjxs
	tst.w		($6c,A6)
	bgt		_18dc6
	jmp		$18d90
_18dc6
	jmp		$18dc6
	
_bjxs      
	movem.l		D0-D1/A0-A1,-(A7)                          ;D0入栈
	moveq		#0,D1
	move.w		#$102,D1                    
	movea.l		#$90a714,A0
	tst.b		($2,A6)                  ;检测1P
	beq		_show_begin               ;1P
	move.w		#$102,D1
	movea.l		#$90af14,A0
	cmpi.b		#$1,($2,A6)                          ;检测2P
	beq         _show_begin
	move.w      #$102,D1
	movea.l     #$90b714,A0
	cmpi.b      #$2,($2,A6)                          ;检测3P
	beq         _show_begin                 _3p
_return               
	movem.l     (A7)+,D0-D1/A0-A1                                                                                      
	rts
_show_begin
	tst.b		($7f66,A5)
	beq		_no_1v3
	move.w		#$101,D1
_no_1v3
	moveq	#$0,D0                                  ;清空D0  
	move.b      ($11e,A6),D0                  ;暴击值代入D0
	lsr.b       #4,D0                                  ;取十位
	move.w      D0,($0,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
	move.w      D1,($2,A0)                  ;样式                        
	move.b      ($11e,A6),D0                  ;暴击值再次代入D0   
	andi.b      #$f,D0                                  ;取个位
	move.w      D0,($80,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
	move.w      D1,($82,A0)            ;样式
	bra         _return           


*================================同人不同色===========
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
	addq.b  #3, D3
	bra	_p_check_r
_2p
	andi.b  #$f0,D3	/
	addq.b  #1, D3
	bra	_p_check_r
_3p
	andi.b  #$f0,D3	/
	addq.b  #2, D3
	bra	_p_check_r




































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
