
*--------------------------分离各P血管色板显存--------------------------------------	

		org	$180000				;找个空白处写程序
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

		
		
		org	$16474				;会用到 色板显存 的各个指令
		jsr	_flgpsbxc
		
		org	$164DC
		jsr	_flgpsbxc
		
		org	$16518
		jsr	_flgpsbxc
		
		org	$1656e
		jsr	_flgpsbxc
		
		org	$165F4
		jsr	_flgpsbxc



*-----------------------------------大于64血时的处理方法---------------------------------------

		org      $0164EA			;血条头部（最左边）	
		jmp      $181000
		org      $181000
_cx1		
		cmpi.w   #$64, D0                    ;对比剩血是否小等于64
		beq      _0t1
		blt      _1t1                              
		subi.w   #$64, D0                    ;循环减64
		bra      _cx1			;回到检测血量，大等于于64则继续减	
_0t1		
		jmp      $164f2
_1t1		
        		jmp      $164F0
			


		org      $1648a			;血条中部
		jmp      $181040
		org      $181040
_cx		
		cmpi.w   #$64, D4                     ;对比剩血是否小等于64
		beq      _0t
		blt      _1t                              
		subi.w   #$64, D4                      ;循环减64
		bra      _cx
_0t		
		jmp      $16492
_1t		
        		jmp      $16490
		

	    	org      $01649E			;血条尾部（最右边）	
		jmp      $181070
		org      $181070
_cx2		
		cmpi.w   #$64, D0                     ;对比剩血是否小等于64
		beq      _0t2
		blt      _1t2                              
		subi.w   #$64, D0                      ;循环减64
		bra      _cx2
_0t2		
		jmp      $164a6
_1t2		
        		jmp      $164A4
		
		
		
		
*------------------------------------按血量染色-------------------------------------------
	org 	$18d88                       ;原某个读取血量的程序（不停的读）
		nop
        	jmp     $184000
	org 	$184000
	jsr	$185000	
        	jsr    _sub_17834			 *改变颜色子程序
		
        tst.w   ($6c,a6)			;原来的不管
        bgt     loc_18dc6			;原来的不管
        jmp     $18d90			;原来的不管	
loc_18dc6
        jmp     $18dc6			;原来的不管
		
		
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

_cxgs
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
		cmpi.w   #$384,D0                     
		ble     _9guan                    
		bra	_10_ys_guan		;高于9行血全部染成一个颜色
;------------------------------------------------------------------------------------------------------ 		
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
_9guan		
		move.l  #$F458F0AA,(A1)
		bra     _quzhan						
_10_ys_guan		
		move.l  #$F79EF458,(A1)
		bra     _quzhan			
		
*-----------------------多模式回血--------------------------------------------
_ms_return
                  ;tst.b        ($7f70,A5)
                  ;beq          _move1f4
		cmpi.b	#$1,($7f70,A5)          *模式C
		beq	_no_plus
		;cmpi.b	#$2,($7f70,A5)          *模式B
		;beq	_plus_algrio
_move1f4
		move.w	#$1F4,($6c,A6)		
_no_plus
		rts
_plus_algrio
		tst.b	($4d9,A5)
		beq	_no_plus
		cmpi.w	#$1f4,($6c,A6)
		bcc	_move1f4
		movem.l	D0-D1,-(A7)
		moveq	#0,D0
		moveq	#0,D1
		move.w	#$1f4,D1
		move.w	($6c,A6),D0
		sub.w	D0,D1
		divu.w	#$2,D1
		add.w	D1,($6c,A6)
		movem.l	(A7)+,D0-D1
		rts	
;----------------------------初始血量与吃血调整------------------------------------	
		; org		$28AB8			;这方法好像也可以
		; BRA		$28ac2
	
		; org		$28AC8
		; BRA		$28aD4	
	

   *------------设置出场时的血量-----------
    org $4dc2			*过关
    
	jsr	_ms_return
	move.w ($6c,A6),($6e,A6)
	
        ;move.w #$1f4,($6c,a6)
        ;move.w ($6c,a6),($6e,a6)
        ;move.w #$64,($6a,a6)

    org $4DF0			*死命、投币、开局加血
        move.w #$1f4,($6c,a6)
        move.w #$1f4,($6e,a6)
        move.w #$64,($6a,a6)
   *-----------设置吃食物回血上限---------------
    org $28ab8
 	cmpi.w	#$3e8,($6c,A0)
    ;org $28ac8
 	;cmpi.w	#$320,D0
	;bls	$28ad4 	
	;move.w	#$320,D0		*编译出现偏差
    org $28ae4
	move.w	#$3e8,($6c,A6)
    org $28af2
	move.w	#$63,($6c,A6)

*---------------------------------暴击显示----------------------------------------------------------------
	org		$185000         ;存放暴击程序的空白地址（可以改成别的）              
_bjxscx1        
                        movem.l	D0-D1/A0,-(A7)                          ;D0入栈
                        moveq       #0,D1
                        move.w      #$101,D1                    
                        movea.l     #$90a69c,A0
                        tst.b	($2,A6)                  ;检测1P
                        beq         _show_begin               ;1P
                        move.w      #$192,D1
                        movea.l     #$90ae9c,A0
                        cmpi.b      #$1,($2,A6)                          ;检测2P
                        beq         _show_begin
                        move.w      #$19e,D1
                        movea.l     #$90b69c,A0
                        cmpi.b      #$2,($2,A6)                          ;检测3P
                        beq         _show_begin                 _3p
_return               
                        movem.l     (A7)+,D0-D1/A0                                                                                      
                        rts
_show_begin
		     cmpi.b	#$1,($c6,A6)
		     bne		_zcxsbaoji
		     suba.l	#$8,A0
_zcxsbaoji
                        moveq	#$0,D0                                  ;清空D0  
                        move.b      ($11e,A6),D0                  ;暴击值代入D0
                        cmpi.b      #$a0,D0
                        beq         _a0_show
                        move.w      #$20,($0,A0)
                        lsr.b       #4,D0                                  ;取十位
                        move.w      D0,($80,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      D1,($82,A0)                  ;样式                        
                        move.b      ($11e,A6),D0                  ;暴击值再次代入D0   
                        andi.b      #$f,D0                                  ;取个位
                        move.w      D0,($100,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      D1,($102,A0)            ;样式
                        bra         _return           
_a0_show
                        move.w      #$1,($0,A0)
                        move.w      D1,($2,A0)
                        move.w      #$0,($80,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      D1,($82,A0)                  ;样式                           
                        move.w      #$0,($100,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      D1,($102,A0)            ;样式
                        bra         _return
	
*------------------------敌兵高血量颜色显示修复-----------------------------------
	org	$17834
	jsr	_xfxt
	rts
	org	$185100
_1hsj
	dc.w	$000d,$000e,$000f
_3hsj
	dc.w	$01a0,$01c0,$01e0
_xfxt
	moveq   #$0,D4
	move.b  ($0,A6),D4
	add.w   D4,D4
	move.w  _1hsj(PC,D4.w),($8,A3)
	addi.w  #$180,($8,A3)
	move.w  _3hsj(PC,D4.w),D5
	move.w  D0,D3
	moveq   #$0,D4
_17782
	cmpi.w  #$64,D3
	ble     _17794
	subi.w  #$64,D3
	addq.w  #$2,D4
	bra     _17782
_17794
	move.w  D4,($a,A3)
	add.w   D4,D4
	add.w   D4,D4
	movea.l #$914400,A1
	adda.w  D5,A1
	lea     ($6,A1),A1
	moveq   #$2,D0
_177aa
	moveq   #$0,D5
	move.w  (A1),D5
	andi.w  #$f000,D5
	or.w    _2hsj(PC,D4.w),D5
	addq.w  #2,D4
	move.w  D5,(A1)+
	dbra    D0,_177aa
	move.w  D3,D0
	rts
_2hsj
	dc.l	$0fff0fe0,$0e000000,$0fff0909,$0fe00000
	dc.l	$0fff05e5,$09090000,$0fff000d,$05e50000
	dc.l	$0fff0ecb,$000d0000,$0fff0e4a,$0ecb0000
	dc.l	$0fff07cf,$0e4a0000,$0fff00aa,$07cf0000
	dc.l	$0fff0458,$00aa0000,$0fff079e,$04580000
	dc.l	$0fff0666,$079e0000,$0fff0364,$06660000
	dc.l	$0fff0d91,$03640000,$0fff076c,$0d910000
	dc.l	$0fff0d13,$076c0000,$0fff0111,$0d130000


























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
