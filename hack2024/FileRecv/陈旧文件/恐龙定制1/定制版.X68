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

		org      $164EA			;血条头部（最左边）	
		jmp      _cx1
		org      $1648a			;血条中部
		jmp      _cx
	    	org      $1649E			;血条尾部（最右边）	
		jmp      _cx2
		
		
		org 	$18d88                       ;原某个读取血量的程序（不停的读）
		nop
        		jmp     _hjkl
        			
*------------------------敌兵高血量颜色显示修复-----------------------------------
	org	$17834
	jsr	_xfxt
	rts
	
	
*-------------子弹回血-----------------------------------
	org		$1361e
	jsr		_return_and_plus

*---------------------过场景+赠送gun-------------------------
	org	$18a98
	jsr	_cjwd
	
*========================1BOSS关底X坐标修复==========================
	org	$428a4
	jsr	_1boss_xf
	
*==================过关删血==过关读取血量算分数======================
	;org	$acee
	;jsr	_acee

	org	$7e822
	move.w	#$64,D0
	org	$7e8ec
	move.w	#$64,D0
*==========挨打枪掉落、不消失============
	org	$2492e
	nop
	nop

	org	$2476e
	nop
	nop


*=====================无限时间=====================
	org	$103ea
	rts

		
*--------------------------分离各P血管色板显存--------------------------------------	

		org	$106600				;找个空白处写程序
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
		rts		

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
_hjkl	
        	bsr    _sub_17834			 *改变颜色子程序
		
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
		cmpi.w   #$3e8,D0                     
		ble     _10guan
		cmpi.w   #$44c,D0                     
		ble     _11guan
		cmpi.w   #$4b0,D0                     
		ble     _12guan
		cmpi.w   #$514,D0                     
		ble     _13guan
		cmpi.w   #$578,D0                     
		ble     _14guan 
		cmpi.w   #$5dc,D0                     
		ble     _15guan 
		cmpi.w   #$640,D0                     
		ble     _16guan
		cmpi.w   #$6a4,D0                     
		ble     _17guan
		cmpi.w   #$708,D0                     
		ble     _18guan
		cmpi.w   #$76c,D0                     
		ble     _19guan
		cmpi.w   #$7d0,D0                     
		ble     _20guan                   
		bra	_21_ys_guan		;高于20行血全部染成一个颜色
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
_10guan		
		move.l  #$F79EF458,(A1)
		bra     _quzhan	
_11guan		
		move.l  #$F066F79e,(A1)
		bra     _quzhan
_12guan		
		move.l  #$F364F666,(A1)
		bra     _quzhan
_13guan		
		move.l  #$Fd91F364,(A1)
		bra     _quzhan
_14guan		
		move.l  #$F76cFd91,(A1)
		bra     _quzhan
_15guan		
		move.l  #$Fd13F76c,(A1)
		bra     _quzhan
_16guan		
		move.l  #$F111Fd13,(A1)
		bra     _quzhan
_17guan		
		move.l  #$F789F111,(A1)
		bra     _quzhan
_18guan		
		move.l  #$Fa0cF789,(A1)
		bra     _quzhan
_19guan		
		move.l  #$F25aFa0c,(A1)
		bra     _quzhan
_20guan		
		move.l  #$Fa11F25a,(A1)
		bra     _quzhan
_21_ys_guan		
		move.l  #$F196Fa11,(A1)
		bra     _quzhan
	
		
*------------------------敌兵高血量颜色显示修复----------------------------------
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
	dc.l	$0fff0789,$01110000,$0fff0a0c,$07890000
	dc.l	$0fff025a,$0a0c0000,$0fff0a11,$025a0000
	dc.l	$0fff0196,$0a110000,$0fff0711,$01960000


*=============================无限模式===============================================		
_return_and_plus
		tst.w		($b4,A6)
		beq		_no_p
		movea.w		($b4,A6),A5
		move.w		#$3c,($6c,A5)
		movea.w		#$8000,A5
_no_p
		moveq		#0,D0
		move.b		($3,A6),D0
		rts

*---------------------过场景赠送gun-------------------------
_cjwd	
	move.b	#$1,($0,A6)
	tst.b	($786,A5)		*关卡开始才给枪
	beq	_make_gun
	rts
_make_gun
	movem.l	D0-D6/A0-A6,-(A7)
	jsr	$4818
	bcs	_not
	move.b	#$1,($0,A0)
	move.w  ($2,A6),($2,A0)
	move.w  #$0,($20,A0)
	move.w  #8,($26,A0)
	move.w  ($8,A6),($8,A0)
	move.w  ($c,A6),($c,A0)
	move.w  ($10,A6),($10,A0)
	move.w  A6,($70,A0)
	move.w  A0,($b4,A6)
	movea.l  A6,A2
	movea.l  A0,A6
	moveq   #$0,D0
	jsr     $24d44
	move.w  #$258,($a4,A6)
	move.b  #$8,($5,A6)
	movea.l A6,A0
	movea.l A2,A6
	move.w  ($a0,A0),($b6,A6)
_not
	movem.l (A7)+, D0-D6/A0-A6
	rts

_1boss_xf
	tst.b	($4d9,A5)
	bne	_noxf
	cmpi.b	#2,($786,A5)
	bne	_noxf
	cmpi.w	#$430,($8,A6)
	ble	_noxf
	move.w	#$380,($8,A6)
	
_noxf
	move.b	($5,A6),D0
	add.w	D0,D0
	rts

_acee
	move.b	#$1,($4d4,A5)
	move.w	#$64,($32e0,A5)
	move.w	#$64,($32e2,A5)
	move.w	#$64,($3460,A5)
	move.w	#$64,($3462,A5)
	move.w	#$64,($35e0,A5)
	move.w	#$64,($35e2,A5)
	rts

































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
