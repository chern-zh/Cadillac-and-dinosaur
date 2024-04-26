		org		$13550
		jsr		_return_and_plus
		org		$5a0be
		jsr		_tufu_xy

*=============================无限模式===============================================
		org		$23e3a		*20子弹数量显存
		dc.l		$00040004
		
		org		$105700
_return_and_plus
		tst.w		($b4,A6)
		beq		_no_p
		cmpa.w		#$b274,A6
		beq		_plus
		cmpa.w		#$b3f4,A6
		beq		_plus		
		cmpa.w		#$b574,A6
		beq		_plus
		bra		_no_p
_plus
		movea.w		($b4,A6),A5
		move.w		#$14,($6c,A5)
		movea.w		#$8000,A5
_no_p
		moveq		#0,D0
		move.b		($3,A6),D0
		rts
*================================tufu XY==========================================================
_tufu_xy
		jsr		$1b6c
		movem.l		D0-D1,-(A7)
		move.w		($10,A6),D0	    /Y
		cmpi.b		#$4,($4d9,A5)
		bne		_no_y
_ceshi_y
		move.w		($748,A5),D1
		cmp.w		D1,D0		/Y坐标是否低于卷轴Y
		bge		_and_37f
		move.w		D1,($10,A6)
		addi.w		#$20,($10,A6)
		movem.l		(A7)+,D0-D1
		rts
_all_rts
		move.w      ($10,A6),D1
		cmp.w       D0,D1
		beq         _nowj_y
		tst.b       ($3274,A5)
		beq         _c2p
		move.w      ($3284,A5),($10,A6)
		bra         _nowj_y 
_c2p
    tst.b       ($33f4,A5)
    beq         _c3p
    move.w      ($3404,A5),($10,A6)
    bra         _nowj_y
_c3p
    tst.b       ($3574,A5)
    beq         _nowj_y
    move.w      ($3584,A5),($10,A6)
_nowj_y    
	movem.l	(A7)+,D0-D1
	rts		
_no_y
	cmpi.b      #$7,($4d9,A5)
	bne         _2guanjc
    cmpi.b      #$1,($786,A5)
    beq         _ceshi_y
    tst.b      ($786,A5)
    beq         _and_7f
    cmpi.w      #$710,($744,A5)
    ble         _all_rts
    bra         _and_1ff
_2guanjc
    cmpi.b      #$1,($4d9,A5)
    bne         _6guanjc
    cmpi.b      #$2,($786,A5)
    beq         _and_ff
    bra         _and_7f
_6guanjc
    cmpi.b      #$5,($4d9,A5)
    bne         _1guanjc
    tst.b       ($786,A5)
    beq         _and_7f
    bra         _and_1ff
_1guanjc
    tst.b       ($4d9,A5)
    bne         _and_7f
    cmpi.b      #$1,($786,A5)
    beq         _and_7f
_and_1ff     
	and.w       #$1ff,($10,A6)
	bra         _all_rts
_and_37f     
	and.w       #$37f,($10,A6)
	bra         _all_rts
_and_7f     
	and.w       #$7f,($10,A6)
	bra         _all_rts
_and_ff     
	and.w       #$ff,($10,A6)
	bra         _all_rts
_and_17f     
	and.w       #$17f,($10,A6)
	bra         _all_rts	
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


*-------------------------第4只11C--------------------------------------------------
_morethan4
	jsr		$19de		;调内存
	bcs		_8596c		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b0,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$580,($8,A0)		;X坐标
	move.w		#$24,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体	
	tst.b		($4ef,A5)
	beq		_85868	
*-------------------------第5只11C----------------------------------------------------------
	jsr		$19de		;调内存
	bcs		_8596c		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b2,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$5b0,($8,A0)		;X坐标
	move.w		#$38,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体
*-------------------------第6只11C----------------------------------------------------------
	jsr		$19de		;调内存
	bcs		_8596c		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b4,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$550,($8,A0)		;X坐标
	move.w		#$38,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体	
_85868
	jmp		$85868	
_8596c
	jmp		$8596c
*-----------------------------判断11C存在，过关----------------------------------
_check11c_e
	or.w		($a4,A6),D0	
	or.w		($b0,A6),D0
	or.w		($b2,A6),D0
	or.w		($b4,A6),D0		
	bne		_858fe		；是否全部11C阵亡
	jmp		$858e6		；全部阵亡，进入过关程序
_858fe
	jmp		$858fe	

*-----------------------------全部11C血量加到主体0084上----------------------------------
_addto0084	
	tst.w		($b0,A6)
	beq		_B2jc
	movea.w		($b0,A6),A0
	move.w		($6c,A0),D0
	add.w		D0,($6c,A6)
	move.w		($6e,A0),D0
	add.w		D0,($6e,A6)	
_B2jc	
	tst.w		($b2,A6)
	beq		_B4jc
	movea.w		($b2,A6),A0
	move.w		($6c,A0),D0
	add.w		D0,($6c,A6)
	move.w		($6e,A0),D0
	add.w		D0,($6e,A6)
_B4jc	
	tst.w		($b4,A6)
	beq		_A4jc
	movea.w		($b4,A6),A0
	move.w		($6c,A0),D0
	add.w		D0,($6c,A6)
	move.w		($6e,A0),D0
	add.w		D0,($6e,A6)
_A4jc
	tst.w		($a4,A6)
	beq		_85956
	jmp		$85942
_85956
	jmp		$85956	

*-----------------------------11C阵亡减1、死亡幻影放入($a8,A0)，用于过关慢动作----------------------------------
_die11c_1

	tst.w		($b0,A0)
	beq		_B2tst
	move.w		($b0,A0),D0
	cmpa.w		D0,A6
	bne		_B2tst
	subq.b		#1,($aa,A0)
	bne		_nob0a8		；是否是最后一只幻影	
	move.w		D0,($a8,A0)	；是，放入($a8,A0)，过关用到
_nob0a8
	clr.w		($b0,A0)		；从0084主体中清除当前幻影地址


_B2tst
	tst.w			($b2,A0)
	beq			_B4tst
	move.w			($b2,A0),D0
	cmpa.w			D0,A6
	bne			_B4tst
	subq.b			#1,($aa,A0)
	bne			_nob2a8		；是否最后一只幻影	
	move.w			D0,($a8,A0)	；是，放入($a8,A0)，过关用到
_nob2a8
	clr.w			($b2,A0)		；从0084主体中清除当前幻影地址

_B4tst
	tst.w			($b4,A0)
	beq			_a4tst
	move.w			($b4,A0),D0
	cmpa.w			D0,A6
	bne			_a4tst
	subq.b			#1,($aa,A0)
	bne			_nob4a8		；是否最后一只幻影	
	move.w			D0,($a8,A0)	；是，放入($a8,A0)，过关用到
_nob4a8
	clr.w			($b4,A0)		；从0084主体中清除当前幻影地址

_a4tst
	tst.w		($a4,A0)
	beq		_859e8	
	jmp		$859d2
_859e8
	jmp		$859e8


;-------------------------------11C免疫队友飞轮散花-----------------------------------------
_nohurt11c	
	tst.w		($b0,A6)
	beq		_jcb2
	movea.w		($b0,A6),A0
	move.w		A0,(-$70bc,A5)	
	jmp		$85a1c
_jcb2
	tst.w		($b2,A6)
	beq		_jca4
	movea.w		($b2,A6),A0
	move.w		A0,(-$70bc,A5)
	jmp		$85a1c	
_jcb4
	tst.w			($b4,A6)
	beq			_jca4
	movea.w			($b4,A6),A0
	move.w			A0,(-$70bc,A5)
_85a1c	
	jmp		$85a1c
_jca4
	tst.w		($a4,A6)
	beq		_85a1c
	jmp		$85a14

;------------------------------11C互相接收飞镖------------------------------------------
_accept_each
	movea.w		($b0,A6),A0
	movea.w		($b0,A0),A0		；4号11C地址移到A0
	tst.b		($0,A0)			；检测4号11C
	beq		_5hao11C
	jsr		$47b34
	bcs		_47b2a		
_5hao11C
	movea.w		($b0,A6),A0
	movea.w		($b2,A0),A0		；5号11C地址移到A0
	tst.b		($0,A0)
	beq		_6hao11C
	jsr		$47b34
	bcs		_47b2a
_6hao11C
	movea.w		($b0,A6),A0
	movea.w		($b4,A0),A0		；6号11C地址移到A0
	tst.b		($0,A0)
	beq		_3hao11C
	jsr		$47b34
	bcs		_47b2a
_3hao11C
	movea.w		($b0,A6),A0		；跳转破坏的两个指令
	movea.w		($a4,A0),A0		；3号11C地址移到A0
	jmp		$47b18
_47b2a
	jmp		$47b2a
	
*========================================================================================
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

*============================暴击=======================================
_bjxs
	bsr	_bjxs_sub
	tst.w	($6c,A6)
	bgt	_18d48
	jmp	$18d12
_18d48
	jmp	$18d48

_bjxs_sub
                        movem.l	D0/A0,-(A7)                          ;D0入栈                    
                        movea.l     #$90a69c,A0
                        tst.b	($2,A6)                  ;检测1P
                        beq         _show_begin               ;1P
                        movea.l     #$90ae9c,A0
                        cmpi.b      #$1, ($2,A6)                          ;检测2P
                        beq         _show_begin
                        movea.l     #$90b69c,A0
                        cmpi.b      #$2, ($2,A6)                          ;检测3P
                        beq         _show_begin                 _3p
_return               
                        movem.l     (A7)+,D0/A0                                                                                      
                        rts
_show_begin
                        moveq	#$0,D0                                  ;清空D0  
                        move.b      ($11e,A6),D0                  ;暴击值代入D0
                        cmpi.b      #$a0,D0
                        beq         _a0_show
                        move.w      #$20,($0,A0)
                        lsr.b       #4, D0                                  ;取十位
                        move.w      D0, ($80,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      #$102,($82,A0)                  ;样式                        
                        move.b      ($11e,A6),D0                  ;暴击值再次代入D0   
                        andi.b      #$f, D0                                  ;取个位
                        move.w      D0,($100,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      #$102,($102,A0)            ;样式
                        bra         _return           
_a0_show
                        move.w      #$1,($0,A0)
                        move.w      #$102,($2,A0)
                        move.w      #$0, ($80,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      #$102,($82,A0)                  ;样式                           
                        move.w      #$0,($100,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      #$102,($102,A0)            ;样式
                        bra         _return
                        
_bj_check
		moveq	#0,D0
		moveq	#0,D1
		move.b	($11e,A3),D0
		move.b	($11f,A3),D1
		cmp.b	D0,D1
		beq	_go_baoji
		jmp	$188888
_go_baoji
		move.w	($6c,A3),D0
		moveq	#0,D1
		rts		
		
_double_bj
			move.b  (A6,D1.w),($11e,A3)
			move.b  ($11e,A3),($11f,A3)
			rts
*====================大龙爆物转移================================
_dlbw
	move.w	($10,A6),($10,A0)
	move.b	($96,A6),($96,A0)
	rts
_3Bxs
	cmpi.b	#$2,($4d9,A5)
	bne	_3B_huan
	cmpi.w	#$2ccc,($744,A5)
	bls	_3B_huan
	jmp	$1b6c
_3B_huan
	move.w	#$8,($20,A6)
	move.w	#$78,($80,A6)	*尸体隐现时间
	jmp	$1b6c
*-----------------------------------------------------------------
_4BOSScoming
	cmpi.b		#$3,($4d9,A5)
	bne		_4BOSSjc
	cmpi.b		#$2,($786,A5)
	bne		_4BOSSjc
	cmpi.w		#$470,($744,A5)
	blt		_4bf52
	jmp		$4bf28	
_4bf52
	rts	
_4BOSSjc
	move.b		#$a,($6,A6)
	clr.b		($4fc,A5)
	rts
*==============================BOSS清版========================================	
_editorshow
	add.b 	($7fe0,A5),D0
	movea.l	($a0,A6),A0
	moveq	#0,D1
	tst.b	D0
	bne	_noeditor
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90a8ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$101500,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3 
_noeditor
	rts
*===========================马云头像==================================
_mytx
	cmpi.b	#$4,($4d9,A5)
	bne	_dhrts
	cmpi.w	#$1100,($744,A5)
	bls	_dhrts
	jsr	$884d2
_dhrts
	rts

*---------------------------模式难度显示----------------------------------------
_ms_show
	movem.l		D0-D3/A0-A3,-(A7)	
	lea		$90a51c,A1		/90a31c，6表示左右位置，ec表示上下位置	90B4F4
	moveq   		#0,D0
	moveq   		#0,D1
	;move.w   		($5ee,A5),D0		*游戏难度
	;lsr.b    		#4,D0
	;move.w   		D0,($0,A1)
	;move.w   		#$2,($2,A1)
	;move.w   		($5ee,A5),D0		*游戏难度
	;andi.w			#$f,D0
	;move.w   		D0,($80,A1)
	;move.w   		#$2,($82,A1)
	tst.w		($7f88,A5)
	beq		_no_display
	move.b		($7f88,A5),D0
	move.w		D0,($0,A1)
	move.w		#$2,($2,A1)
	move.b		($7f89,A5),D1
	move.w		D1,($80,A1)
	move.w		#$2,($82,A1)
_no_display	
	movem.l		(A7)+,D0-D3/A0-A3
	rts




*================================同人不同色======================================
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
		
;---------------------------幻影个数与出场坐标-----------------------------------
;----------------------第一只11C出场坐标--------------------------------------
	org		$85822
	move.w		#$5b0,($8,A0)		;X坐标
	move.w		#$10,($10,A0)		;Y坐标	

;----------------------第二只11C出场坐标---------------------------------------
	org		$8584c
	move.w		#$5b0,($8,A0)		;X坐标
	move.w		#$5f,($10,A0)		;Y坐标
	
;----------------------第三只11C出场坐标---------------------------------------
	org		$85886
	move.w		#$580,($8,A0)		;X坐标
	move.w		#$4c,($10,A0)		;Y坐标
;---------------------------加载4只以上11C--------------------------------------
	org		$85862		;检测玩家数量，是否加载第三个11C的判断地址
	jmp		_morethan4	
*-----------------------------判断11C存在，过关----------------------------------
	org		$858e0
	jmp		_check11c_e
*-----------------------------全部11C血量加到主体0084上----------------------------------
	org		$8593c
	jmp		_addto0084	
*-----------------------------11C阵亡减1、死亡幻影放入($a8,A0)，用于过关慢动作----------------------------------
	org		$859cc
	jmp		_die11c_1
;-------------------------------11C免疫队友飞轮散花-----------------------------------------
	org		$85a0e
	jmp		_nohurt11c	
;------------------------------11C互相接收飞镖------------------------------------------
	org		$47b10
	nop
	jmp		_accept_each	
*==================================九十血修复=============================================	
	org	$17766
	jsr	_xfxt
	rts
*----------------BOSS高血量防御------------------------------	
	org	$2b8f2
	addi.w	#$0,D2

	org	$2ba24
	addi.w	#$0,D2

	
*-----------------------------------暴击------------------------------------------------
	org		$18D0A                        ;一直会运行的某个血条相关程序
	jmp		_bjxs                        ;插入“暴击程序”
	nop	
	
	org		$1166a
	jsr		_bj_check
	org		$116a2
	jsr		_double_bj
	
	org	$2b8bc		*读
	move.b	($11e,A2),D0
	
	org	$2b9ee		*读
	move.b	($11e,A6),D0
*====================大龙爆物转移================================
	org	$64ea8		*大龙爆物
	jsr	_dlbw
*=============================3BOSS尸体消失======================================
	org	$50754
	jmp	_3Bxs
;===========================4BOSS修复、对话调节=========================================
	ORG     $4bf20                  ;4BOSS对话调节
	jmp	_4BOSScoming
;-------------------BOSS清版------------------------
	org 	$812e6                  ;监视小兵数量内存的指令
	jsr	_editorshow

	org	$101500		*作者代码
	dc.w	$0148,$4143,$4B45,$4420,$4259,$2047,$6559,$7540
	
*==============================马云变身头像-------------------------------------
	org	$52d76		/地址1
	jsr	_mytx
	org	$52e5e		/地址2
	jsr	_mytx
*---------------------------模式显示----------------------------------------
	org	$1036c
	nop
	jsr	_ms_show	
	
	
	











*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
