*==============按开始键换人===================
        ORG     $AAF6		*时刻运行的指令
        jsr     _ajbs

*------------------------动态分配123P---------------------------------------		
			
			org		$14786
			jsr		$1d0000
			org		$146ca
			jsr		$1d0000
			org		$145c6	
			jsr		$1d0000
			org		$1450a
			jsr		$1d0000
			org		$14488
			jsr		$1d0000
			org		$14436
			jsr		$1d0000			
			org		$14390			
			jsr		$1d0000			
			org		$1433e
			jsr		$1d0000	

			org		$1d0000	
			cmpa.l	#$FffFB274,A0							;是否1P
			BEQ		_zd1p
			cmpa.l	#$FffFB3f4,A0							;是否2P
			BEQ		_zd2p
			cmpa.l	#$FffFB574,A0							;是否3P
			BEQ		_zd3p
_flover
			movem.w D0-D3, (A4)							*原来被jsr跳转破坏的指令，补回
			addq.l  #8, A4								*原来被jsr跳转破坏的指令，补回
			rts				
_zd1p		
			andi.b	#$F0,D3								;12位清零	
			bra		_flover
_zd2p		
			andi.b	#$F0,D3								;12位清零			
			ADDQ.b	#1,D3								;加1，就是2P指定用914020
			bra		_flover
_zd3p		
			andi.b	#$F0,D3								;12位清零			
			ADDQ.b	#2,D3								;加2，就是3P指定用914040
			bra		_flover		
*--------------------------------------------------------------------------------------------------------
_ajbs
        jsr     $186cc
		movem.l  D0-D7/A0-A6,-(A7)       
		moveq	#$0,D2
		moveq	#$0,D3
		move.b  ($1a,A5),D2
		move.b  ($1f,A5),D3
		not.b   D3
		and.b   D3,D2
		BTST     #$0,d2           ;1P按了开始
		bNE      _1pbs
		BTST     #$1,d2           ;2P按了开始
		bNE      _2pbs     
		BTST     #$2,d2           ;3P按了开始
		bNE      _3pbs      
_bsover       
		movem.l  (A7)+,D0-D7/A0-A6         
		rts 

_1pbs   
		BTST    #$8,($3274,A5)
		beq     _bsover
		tst.w   ($327a,A5)
		bne    _bsover
		movea.l  #$FFFFb274,A0 
		add.b    #1,($3277,A5)      
		andi.b   #3,($3277,A5)              *大于3置0       
		bsr      _CZSX  
		bra      _bsover
_2pbs       
		BTST    #$8,($33F4,A5)
		beq     _bsover
		tst.w   ($33FA,A5)
		bne    _bsover
		movea.l  #$FFFFb3F4,A0 
		add.b    #1,($33F7,A5)     
		andi.b   #3,($33F7,A5)              *大于3置0
		bsr      _CZSX  
		bra      _bsover
_3pbs  
		BTST    #$8,($3574,A5)
		beq     _bsover
		tst.w   ($357A,A5)
		bne    _bsover     
		movea.l  #$FFFFb574,A0 
		add.b    #1,($3577,A5)    
		andi.b   #3,($3577,A5)              *大于3置0     
		bsr      _CZSX  
		bra      _bsover             
*----------------------------------------属性重置-------------------------------------------------------- 
_CZSX    
			moveq	#$0,D1
           move.b  ($3,A0),D1
           movea.l #$1d0200, A1
           lsl.w   #4, D1               *等价于*$10
           adda.w  D1, A1  
           move.w  ($0,A1),($6,A0)
           move.w  ($2,A1),($20,A0)
           move.w  ($4,A1),($28,A0)
           move.w  ($6,A1),($2a,A0)
           move.w  ($8,A1),($46,A0)
           move.w  ($a,A1),($48,A0)
           move.w  ($c,A1),($66,A0)
           rts
		org		$1d0200
        dc.w        $0002,$0000,$0009,$e508,$0000,$1a00,$50e4,$0000
        dc.w        $0002,$0004,$0009,$F4C4,$0C00,$0100,$5104,$0000
        dc.w        $0002,$0008,$000A,$0744,$1800,$3900,$5124,$0000
        dc.w        $0002,$000c,$000A,$1788,$2400,$0100,$5144,$0000



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
