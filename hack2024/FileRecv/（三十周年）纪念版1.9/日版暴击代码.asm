		org     $018D0A                        ;一直会运行的某个血条相关程序
        jmp     _bjxscx                        ;插入“暴击程序”


        org     $102d00         ;存放暴击程序的空白地址（可以改成别的）
_bjxscx                        
        bsr     _bjxscx1        ;跳到暴击显示子程序
		bsr		_msxs
        tst.w   ($6c,A6)        ;原来的不管
        bgt     _18d48          ;原来的不管
        jmp     $18d12          ;原来的不管
_18d48                        
        jmp     $18d48                ;原来的不管
_msxs
	movem.l		D0-D3/A0-A3,-(A7)	
	lea			$90a41c,A1		/90a41c，6表示左右位置，ec表示上下位置	
	lea			$182ee0,A0
		cmpi.b	#$1,($7f88,A5)
		beq		_c0a
		adda.l	#$8,A0
		cmpi.b	#$2,($7f88,A5)
		beq		_c0a
		adda.l	#$8,A0
		cmpi.b	#$3,($7f88,A5)
		beq		_c0a
		adda.l	#$8,A0	
_c0a	
	jsr			$c0a
	movem.l		(A7)+,D0-D3/A0-A3 
_qbrts
	rts
	org			$182ee0
	dc.w		$1a6d,$6f64,$6523,$3140		
	org			$182ee8
	dc.w		$1a6d,$6f64,$6523,$3240
	org			$182ef0
	dc.w		$1a6d,$6f64,$6523,$3340
	org			$182ef8
	dc.w		$1a6d,$6f64,$6523,$3440		
        ;/////////////////////////////////////////////////////////////////////////////////               
_bjxscx1        
        movem.l  D0,-(A7)                          ;D0入栈                  
        clr.l   D0                                  ;清空D0  		
        cmpi.b  #$0, ($2,A6)                  ;检测1P
        bne     _2p                      	  ;不是1P检测2P
        move.b  ($c6,A6),D0                  ;暴击值代入D0                        
        lsr.b   #4, D0                        ;取十位
        move.w  D0, $90a71C                   ;十位数要显示的位置(90a71C改了会移动显示位置)                          
        move.w  #$19E, $90a71e                ;样式                        
        move.b  ($c6,A6),D0                  ;暴击值再次代入D0   
        andi.b  #$f, D0                       ;取个位
        move.w  D0, $90a79c                   ;个位数要显示的位置(90a79c改了会移动显示位置)  
        move.w  #$19E, $90a79e           	  ;样式           

_2p                        
                        cmpi.b  #$1, ($2,A6)                          ;检测2P
                        bne     _3p
                        move.b  ($c6,A6),D0
                        lsr.b   #4, D0
                        move.w  D0, $90af1C
                        move.w  #$19E, $90af1e
                        move.b  ($c6,A6),D0
                        andi.b  #$f, D0
                        move.w  D0, $90af9c
                        move.w  #$19E, $90af9e        
_3p                        
                        cmpi.b  #$2, ($2,A6)                          ;检测3P
                        bne     _rts
                        move.b  ($c6,A6),D0
                        lsr.b   #4, D0
                        move.w  D0, $90b71C
                        move.w  #$19E, $90b71e
                        move.b  ($c6,A6),D0
                        andi.b  #$f, D0
                        move.w  D0, $90b79C
                        move.w  #$19E, $90b79E  
_rts               
                        movem.l  (A7)+, D0   		;D0出栈                                                                                   
                        rts
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
