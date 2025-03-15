		org     $018D0A                        ;一直会运行的某个血条相关程序
        jmp     _bjxscx                        ;插入“暴击程序”
		org	$20942
		jsr	_msxs

        org     $102d00         ;存放暴击程序的空白地址（可以改成别的）
_bjxscx                        
        jsr     _bjxscx1        ;跳到暴击显示子程序
	jsr	_sub_17834	/多层血条
        tst.w   ($6c,A6)        ;原来的不管
        bgt     _18d48          ;原来的不管
        jmp     $18d12          ;原来的不管
_18d48                        
        jmp     $18d48                ;原来的不管


        
*===============================模式显示====================================================
_msxs
	move.w	($0,A4),($4c,A6)
	movem.l		D0-D3/A0-A3,-(A7)	
	lea			$90a31c,A1		/90a41c，6表示左右位置，ec表示上下位置	
	lea			$102ee0,A0
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
	rts		
   ;/////////////////////////////////////////////////////////////////////////////////               
_bjxscx1        
        movem.l  D0,-(A7)                          ;D0入栈                  
        clr.l   D0                                  ;清空D0  		
        cmpi.b  #$0, ($2,A6)                  ;检测1P
        bne     _2p                      	  ;不是1P检测2P
        move.b  ($c6,A6),D0                  ;暴击值代入D0                        
        lsr.b   #4, D0                        ;取十位
        move.w  D0, $90a71C                   ;十位数要显示的位置(90a71C改了会移动显示位置)                          
        move.w  #$192, $90a71e                ;样式                        
        move.b  ($c6,A6),D0                  ;暴击值再次代入D0   
        andi.b  #$f, D0                       ;取个位
        move.w  D0, $90a79c                   ;个位数要显示的位置(90a79c改了会移动显示位置)  
        move.w  #$192, $90a79e           	  ;样式           

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
                        move.w  #$19f, $90b71e
                        move.b  ($c6,A6),D0
                        andi.b  #$f, D0
                        move.w  D0, $90b79C
                        move.w  #$19f, $90b79E  
_rts               
                        movem.l  (A7)+, D0   		;D0出栈                                                                                   
                        rts
	org			$102ee0
	dc.w		$026d,$6f64,$6523,$3140		
	org			$102ee8
	dc.w		$026d,$6f64,$6523,$3240
	org			$102ef0
	dc.w		$026d,$6f64,$6523,$3340
	org			$102ef8
	dc.w		$026d,$6f64,$6523,$3440

*==========================多层血条=============================================
		org	$163A6				;会用到 色板显存 的各个指令
		jsr	_flgpsbxc
		
		org	$1640E
		jsr	_flgpsbxc
		
		org	$1644A
		jsr	_flgpsbxc
		
		org	$164A0
		jsr	_flgpsbxc
		
		org	$16526
		jsr	_flgpsbxc
*--------------------------分离各P血管色板显存--------------------------------------	
		org	$183000				;找个空白处写程序
_flgpsbxc		
		cmpi.b	#1,($2,a6)			;对比几P	
		blt	_1p_xs					;小于1自然是1P
		beq	_2p_xs					;等于1自然是2P		
		bgt	_3p_xs					;大于1自然是3P
		RTS
_1p_xs	
		move.w   #$18D,($2,A0)	
		RTS	
_2p_xs
		move.w   #$18e,($2,A0)	
		RTS			
_3p_xs			
		move.w   #$18F,($2,A0)	
		RTS

*-----------------------------------大于64血时的处理方法---------------------------------------
		org      $1641C			;血条头部（最左边）	
		jmp      $183100
		org      $183100
_cx1		
		cmpi.w   #$64, D0                    ;对比剩血是否小等于64
		beq      _0t1
		blt      _1t1                              
		subi.w   #$64, D0                    ;循环减64
		bra      _cx1			;回到检测血量，大等于于64则继续减	
_0t1		
		jmp      $16424
_1t1		
        		jmp      $16422

		org      $163BC			;血条中部
		jmp      $183200
		org      $183200
_cx		
		cmpi.w   #$64, D4                     ;对比剩血是否小等于64
		beq      _0t
		blt      _1t                              
		subi.w   #$64, D4                      ;循环减64
		bra      _cx
_0t		
		jmp      $163C4
_1t		
        		jmp      $163C2
		

	    	org      $163D0			;血条尾部（最右边）	
		jmp      $183300
		org      $183300
_cx2		
		cmpi.w   #$64, D0                     ;对比剩血是否小等于64
		beq      _0t2
		blt      _1t2                              
		subi.w   #$64, D0                      ;循环减64
		bra      _cx2
_0t2		
		jmp      $163D8
_1t2		
        		jmp      $163D6
		
		
		
		
*------------------------------------按血量染色-------------------------------------------
	org 	$183400				
_sub_17834		
        movem.l A1-A6/d1-d7, -(A7)             ;入栈
		
	
     ;----------------------------按P数指定色板显存-------------------------------
	 
		cmpi.b	#1,($2,a6)			;对比几P	
		blt	_1p_9145A0			;小于1自然是1P
		beq	_2p_914740			;等于1自然是2P		
		bgt	_3p_9148E0			;大于1自然是3P
		
_1p_9145A0	
		movea.l  #$9145A2,A1			;1P血管色显存
		bra	_jxxie				;跳到染色处
_2p_914740	
		movea.l  #$9145C2,A1			;2P血管色显存
		bra	_jxxie			
_3p_9148E0		
		movea.l  #$9145E2,A1			;3P血管色显存

	;--------------------------------染色坊---------------------------------------	
		
_jxxie		
		move.w  ($6c,a6),D0                     ;剩血代入DO
		cmpi.w   #$64,D0                        ;对比剩下是否高于64
		ble     _1guan                          ;小等于64则显示原来的 黄红 色
		cmpi.w   #$c8,D0                        ;对比剩下是否高于200
		ble     _2guan                          ;小于等于200，则染成2行
		cmpi.w   #$12c,D0                     
		ble     _3guan                          		
		cmpi.w   #$190,D0                     
		ble     _4guan
		cmpi.w   #$1f4,D0                     
		ble     _5guan
		cmpi.w   #$258,D0                     
		ble     _6guan
		cmpi.w   #$2bc,D0                     
		ble     _7guan
		cmpi.w   #$320,D0                     
		ble     _8guan                     
		bra	_9_ys_guan		;高于8行血全部染成一个颜色
_quzhan		
        		movem.l (A7)+, A1-A6/d1-d7				;染色程序结束，出栈给回原来的寄存器数据	
		rts		
_1guan		
		move.l  #$FFE0fe00,(A1)				;1管血染成 黄红 色，这个你们可以直接在显存色板上面改试试
		bra     _quzhan		
_2guan		
		move.l  #$e909fFE0,(A1)
		bra     _quzhan	
_3guan		
		move.l  #$f5e5e909,(A1)
		bra     _quzhan		
_4guan		
		move.l  #$f00Df5E5,(A1)
		bra     _quzhan			
_5guan		
		move.l  #$FECBF00D,(A1)
		bra     _quzhan		
_6Guan		
		move.l  #$FE4AFECB,(A1)
		bra     _quzhan	
_7guan		
		move.l  #$F7CFFE4A,(A1)
		bra     _quzhan		
_8guan		
		move.l  #$F0AAF7CF,(A1)
		bra     _quzhan						
_9_ys_guan		
		move.l  #$F0AAF0AA,(A1)
		bra     _quzhan			
		

   *------------设置出场时的血量-----------
    org 		$1F64
    jmp		$183600
    org		$183600
    cmpi.b	#$2,($7f88,A5)
    bne		_dgxt
	move.w	#$1f4,($6c,a6)		/模式2，出场4行血
	move.w	($6c,a6),($6e,a6)
	jmp	$1f70
_dgxt
        move.w	#$64,($6c,a6)		/非模式2，走原指令
        jmp	$1f6a	

	
    org		$1f92
    jmp		$183680
    org		$183680
    cmpi.b	#$2,($7f88,A5)
    bne		_dgxt1
	move.w	#$1f4,($6c,a6)		/模式2，出场4行血
	move.w	($6c,a6),($6e,a6)
	jmp	$1f9e
_dgxt1
        move.w	#$64,($6c,a6)		/非模式2，走原指令
        jmp	$1f98
   *-----------设置吃食物回血上限---------------
    org		$28a3a
    jmp		$183700
    org		$183700
    cmpi.b	#$2,($7f88,A5)
    bne		_yuanzl 
	cmpi.w	#$1f4,($6c,A0)
	beq	_28a74
	jmp	$28a44
_yuanzl
 	cmpi.w	#$64,($6c,A0)
	beq	_28a74
	jmp	$28a44 	
_28a74
	jmp	$28a74 
	
    org		$28a4a
    jmp		$183800
    nop
    nop
    nop
    org		$183800
    cmpi.b	#$2,($7f88,A5)
    bne		_yzling    
	cmpi.w	#$1f4,D0
	bls	_28a56 	
	move.w	#$1f4,D0
_28a56
	jmp	$28a56
_yzling
	cmpi.w	#$64,D0
	bls	_28a56 	
	move.w	#$64,D0
	jmp	$28a56
	
    org 		$28a66
    jsr		$1838b0
    org		$1838b0
    cmpi.b	#$2,($7f88,A5)
    bne		_yzhiling    
	move.w	#$1f4,($6c,A6)
	rts
_yzhiling
	move.w	#$64,($6c,A6)
	rts		

*===================闪血====================
	org	$165e6
	jmp	$183900
	org	$183900
	cmpi.b	#$2,($7f88,A5)
	bne	_fsx	
	cmpi.w	#$32,($6c,A6)		/低于50闪血
	bgt	_165fa
	jmp	$165ee
_fsx
	cmpi.w	#$f,($6c,A6)
	bgt	_165fa
	jmp	$165ee

_165fa
	jmp	$165fa




















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
