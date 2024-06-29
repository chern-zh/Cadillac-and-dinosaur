*=============================备注================================
*模式标志位：ffff88
*ffff30,玩家衣服颜色色斑
*20，xuan关
*BOSS清版：ffffe0
*1V3标志位：ffff18
*
*
*-------------开局加载闪现投币英文指令------------------
	;org	$97fd6
	;jsr	_coin
	
*-----------------------随机队列的随机数-------------------------
	;org	$ab26
	;jsr	_move_num
*--------------------大龙持续唤兵-------------------
	org	$65080
	jsr	_continus_dl

*-------------------模式选择---------------------------
	org	$b1d0
	jsr	_select
	
	org	$af7c		*选关
	jmp	_xuanguan
;-----------------1V3、开局、过场景、--------------------------
	org	$3740
	jmp	_onev3
	org	$ad66		/开局清空缓存
	jsr	_beginclear
	org	$18a1a		/过场景
	jsr	_changeancen
*----------------------随机出兵-------------------------
	org		$fddc
	jsr		_randomsj	
*==============================================================
*==============================================================
	org	$190000
_coin
	;move.b	#$8,($47d,A5)	*开局赠送8个币
	;move.b	#$8,($48d,A5)	*开局赠送8个币
	;move.b	#$8,($49d,A5)	*开局赠送8个币
_continus_dl
	move.b	#$1,($502,A5)
	moveq	#0,D0
	move.b	($5,A6),D0
	rts
_xuanguan
	movem.l	D0-D1/A0,-(A7)
	moveq	#$0,D0
	moveq	#$0,D1
	move.b	($16,A5),D0
	move.b	($1b,A5),D1
	not.b	D1
	and.b	D1,D0
	btst    #$3,D0    ;1P点按上方向键
	beq     _time_minus	;等于0，没按
	addq.b	#$1,($7f2e,A5)
	andi.b	#$7,($7f2e,A5)
	addq.b	#$1,($7f2f,A5)		*按键次数
_time_minus	
	movem.l (A7)+, D0-D1/A0
	subq.b	#1,($a,A6)
	bne	_afa6
	jmp	$af82
_afa6
	jmp	$afa6	
_select
	;move.b	#$7,($7668,A5)
	;move.b	#$3,($766c,A5)
	move.b	#$40,($3392,A5)		/开局锁40暴击出场
	move.b	#$40,($3512,A5)
	move.b	#$40,($3692,A5)
	move.b	#$3,($7f30,A5)		/开局色板
	move.b	#$7,($7f31,A5)
	move.b	#$f,($7f32,A5)
	cmpi.b	#$8,($7f2f,A5)	*是否玄关了？
	blt	_no_xg
	move.b	($7f2e,A5),($4d9,A5)
_no_xg
	move.w	#$0,($7f2e,A5)
	add.w	D0,D0
	move.w	D0,($20,A0)
	move.b   ($636,A5),($7f68,A5)
	btst	#$2,($16,A5)	;1P按了下方向键
	bne	_hasms1
	btst	#$2,($17,A5)	;2P按了下方向键
	bne	_hasms1
	btst	#$2,($18,A5)	;3P按了下方向键
	bne	_hasms1
	;btst	#$3,($16,A5)	;1P按了上方向键
	;bne	_hasms
	;btst	#$3,($17,A5)	;2P按了上方向键
	;bne	_hasms
	;btst	#$3,($18,A5)	;3P按了上方向键
	;bne	_hasms								
	;move.b	#$1,($7f88,A5)	/模式标志位内存置1
	;rts	
_hasms
	move.b	#$30,($3392,A5)		/开局锁40暴击出场
	move.b	#$30,($3512,A5)
	move.b	#$30,($3692,A5)
	clr.b	($7f88,A5)	/模式标志位内存置			
	rts
_hasms1		
	move.b	#$1,($7f88,A5)	/模式标志位内存置1
	rts		
*===============================1V3、开局、过场景、=============================
_onev3
	move.b	#$2,($4ef,A5)       ;强制1V3模式
	;tst.b	($7f88,A5)
	;beq	_qlbms
	move.b	D0,($7f18,A5)          ;将实际玩家数量放入ffff18
	rts
_qlbms
	;move.b	#$2,($7f18,A5)
	;rts
_changeancen
	;clr.l	$ffb328		*禁止带武器枪
	;clr.l	$ffb4a8
	;clr.l	$ffb628
	clr.l	($7fe0,A5)	/BOSS清版，大龙个数
	move.b	#$2, ($0,A6)	/加无敌
	move.w	#$1e8, ($ec,A6)
	rts
_beginclear
	clr.l	($7fe0,A5)	/BOSS清版，E2大龙场景个数
	clr.l	($7fd0,A5)	/D2，主BOSS个数
	clr.l	($7fd4,A5)	/单只BOSS死后不动标志位
	jsr	$5b88	
	rts

;---------------------------随机出兵---------------------------------------
_randomsj	
	movem.l  		D0-D1/A6,-(A7)		;入栈
	move.b		($4ea,A5),D0
	move.w		($327c,A5),D1
	add.b		D0,D1
	move.b            ($7f68,A5),D0
	add.b             D0,D1
	moveq		#0,D0	
	move.b		($3,A2),D0		;检测是否箱子或破门等
	andi.b		#$f,D0			;取个位
	cmpi.b		#$1,D0
	beq		_nosuiji
	cmpi.b		#$3,D0
	beq		_nosuiji		
	cmpi.w  		#$28,($20,A0)       ;是否胖子
	beq     		_sj13_
	cmpi.w 		#$8,($20,A0)        ;是否马甲
	beq     		_sj13_        
	cmpi.w  		#$38,($20,A0)       ;是否刀手
	beq     		_sj13_
	cmpi.w  		#$34,($20,A0)       ;是否猎人
	beq     		_sj13_
	cmpi.w  		#$50,($20,A0)       ;猴子
	beq     		_sj13_
	bra		_nosuiji
_sj13_
	tst.b		($7f88,A5)
	beq		_easyms
	cmpi.b		#$7,($4d9,A5)		;是否8关
	bne		_jc7	
	cmpi.b		#$3,($786,A5)		;是否关底
	beq		_8gdsj
	bra		_no_gdsj
_jc7	
	cmpi.b		#$6,($4d9,A5)		;7关
	bne		_jc6
	cmpi.b		#$3,($786,A5)		;是否关底
	beq		_nosuiji			/7关底不随机	
	bra		_no_gdsj
_jc6
	cmpi.b		#$5,($4d9,A5)		;6关
	bne		_jc5
	cmpi.b		#$2,($786,A5)		;是否关底
	beq		_gdsj
	bra		_no_gdsj	
_jc5
	cmpi.b		#$4,($4d9,A5)		;5关
	bne		_jc4
	cmpi.w		#$D80,($744,A5)		;是否关底
	ble		_no_gdsj			/5关随机
	bra		_gdsj
_jc4
	cmpi.b		#$3,($4d9,A5)		;4关
	bne		_jc3	
	cmpi.b		#$2,($786,A5)		;是否第3场景
	bne		_no_gdsj			
	bra		_gdsj
_jc3
	cmpi.b		#$2,($4d9,A5)		;3关
	bne		_jc2			;
	;cmpi.w		#$E00,($744,A5)		;检测3关卷轴
	;bhi		_nosuiji			/3关后半部分不随机
	;bra		_no_gdsj
	bra		_nosuiji		
_jc2
	cmpi.b		#$1,($4d9,A5)		;2关
	bne		_jc1
	cmpi.b		#$2,($786,A5)		;是否第3场景
	beq		_gdsj	
	bra		_no_gdsj	
_jc1
	cmpi.b		#$2,($786,A5)		;是否第3场景
	bne		_no_gdsj
	bra		_gdsj
_nosuiji
	movem.l  		(A7)+,D0-D1/A6			;把原来D0中的数据移回去
	move.b		($f,A2),($96,A0)	
	rts
*============================模式随机=================================
_gdsj
	moveq		#0,D0	
	jsr		$119c                   	;进入随机程序
	add.b		D1,D0
	andi.w		#$1f,D0
	add.w             D0,D0
	add.w             D0,D0
	lea		$18f000,A6		*模式3关底随机
	move.w		(A6,D0.w),($20,A0)		;取表中随机一个敌兵
	addq.b  		#$2,D0
	move.w		(A6,D0.w),($26,A0)		;取下表中紧随的出场方式
	bra		_nosuiji			
_8gdsj
	cmpi.b		#$cc,($f,A2)
	beq		_8gd_boss
	clr.l		D0	
	jsr		$119c                   	;进入随机程序
	andi.w		#$3,D0			;随机数在D0里，求余,限制范围( )
	add.w             D0,D0
	add.w             D0,D0
	lea		$18f200,A6
	move.w		(A6,D0.w),($20,A0)		;取表中随机一个敌兵
	addq.b  		#$2,D0
	move.w		(A6,D0.w),($26,A0)		;取下表中紧随的出场方式
	addq.b		#1,($7f42,A5)
	moveq		#$0,D0
	move.b		($7f42,A5),D0
	andi.b		#$7,D0
	lea		$18f210,A6
	move.b		(A6,D0.w),($96,A0)
	movem.l  		(A7)+,D0-D1/A6		;出栈	
	rts
_8gd_boss
	clr.l		D0	
	jsr		$119c                   	;进入随机程序
	andi.w		#$7,D0			;随机数在D0里，求余,限制范围( )
	add.w             D0,D0
	add.w             D0,D0
	lea		$18f260,A6
	move.w		(A6,D0.w),($20,A0)		;取表中随机一个敌兵
	addq.b  		#$2,D0
	move.w		(A6,D0.w),($26,A0)		;取下表中紧随的出场方式
	move.b		#$1,($96,A0)
	movem.l  		(A7)+,D0-D1/A6		;出栈	
	rts
			
_no_gdsj
	clr.l		D0	
	jsr		$119c                   	;进入随机程序
	add.b		D1,D0	
	andi.w		#$3f,D0			;随机数在D0里，求余,限制范围( )
	add.w             D0,D0
	add.w             D0,D0
	lea		$18f100,A6
	move.w		(A6,D0.w),($20,A0)		;取表中随机一个敌兵
	addq.b  		#$2,D0
	move.w		(A6,D0.w),($26,A0)		;取下表中紧随的出场方式
	cmpi.w		#$150,($20,A0)
	beq		_dt150
	cmpi.w		#$c,($20,A0)
	beq		_xsdc
	bra		_nosuiji
_dt150
	cmpi.b		#$6,($4d9,A5)
	bne		_nosuiji
	cmpi.b		#$1,($786,A5)
	bne		_nosuiji
	move.w		#$11c,($20,A0)		/换成11C
	bra		_nosuiji
_xsdc
	cmpi.b		#$7,($4d9,A5)
	bne		_nosuiji
	cmpi.b		#$1,($786,A5)
	bne		_nosuiji
	move.w		#$16c,($20,A0)		/换成16C
	bra		_nosuiji
_easyms
	cmpi.b		#$6,($4d9,A5)
	bne		_x_random
	cmpi.b		#$3,($786,A5)
	beq		_nosuiji
_x_random
	move.w		($4,A2),D0
	move.w		($7f8a,A5),D1
	cmp.w		D0,D1
	beq		_the_same
	moveq		#0,D0	
	jsr		$119c                   	;进入随机程序
	move.b		($4ea,A5),D1
	add.b		D1,D0
	andi.w		#$1f,D0			;随机数在D0里，求余,限制范围( )
	add.w             D0,D0
	add.w             D0,D0
	lea		$18f300,A6
	move.w		(A6,D0.w),($20,A0)		;取表中随机一个敌兵
	addq.b  		#$2,D0
	move.w		(A6,D0.w),($26,A0)		;取下表中紧随的出场方式
	move.w		($20,A0),($7f8c,A5)
	move.w		($26,A0),($7f8e,A5)
	bra		_check_c
_the_same
	move.w		($7f8c,A5),($20,A0)
	move.w		($7f8e,A5),($26,A0)	
_check_c
	move.w		($4,A2),($7f8a,A5)
	cmpi.w		#$c,($20,A0)
	beq		_qlms_c
	bra		_nosuiji
_qlms_c
	cmpi.b		#$7,($4d9,A5)
	bne		_nosuiji	
	cmpi.b		#$1,($786,A5)
	bne		_nosuiji
	move.w		#$18,($20,A0)
	bra		_nosuiji


;-------------------------------模式队列----------------------------                  

	org	$18f000		/模式关底随机
	
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0008,$0402,$0008,$0002,$0008,$0202,$0018,$0000
        dc.w    $0028,$0006,$000c,$0000,$0028,$0204,$0028,$0400
        dc.w    $0038,$0200,$0038,$000c,$0038,$000a,$0034,$0200
        
        dc.w    $0050,$0206,$0050,$0006,$0050,$0006,$0048,$0200
        dc.w    $0034,$0400,$0034,$0200,$0034,$0000,$0038,$020c
        dc.w    $0050,$0206,$016c,$0000,$0008,$0202,$0028,$0204
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
           
	org	$18f100		/模式非关底随机
	
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0008,$0402,$0090,$0000,$0008,$0202,$011c,$0000
        dc.w    $00F4,$0000,$0028,$0204,$0028,$0400,$0064,$0000
        dc.w    $00A0,$0000,$0038,$000c,$0038,$000a,$0048,$0200
        
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0090,$0000,$0050,$0006,$0050,$0006,$011C,$0000
        dc.w    $0034,$040c,$0034,$020c,$00F4,$0000,$016c,$0000
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        
        dc.w    $0008,$0402,$00A0,$0000,$0008,$0202,$0064,$0000
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0028,$0004,$0028,$0204,$0028,$0406,$000c,$0000
        dc.w    $0090,$0000,$00A0,$0000,$00F4,$0000,$0150,$0000
        
        dc.w    $0038,$0200,$0038,$020c,$0038,$020a,$0064,$0000
        dc.w    $0050,$0206,$0050,$0206,$0050,$0206,$0018,$0000
        dc.w    $0034,$0400,$0034,$0200,$0034,$0000,$011C,$0000
        dc.w    $0150,$0000,$0090,$0000,$00A0,$0000,$00F4,$0000


	org	$18f200		/模式第8关底随机
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.l	$37003710		//8关底补给队列
	
	org	$18f260
	dc.l	$00f40000,$00900000,$00a00000,$00640000
	dc.l	$00a00000,$00f40000,$011c0000,$00900000
  
	;org	$18f2a0		/模式二非关底补给队列
        
        ;dc.l    $00380025,$001f0039,$00373822,$1c003802
        
	;org	$18f2b0		/模式二关底补给队列
       ; dc.l    $25370001,$25381c00
      
*==================18F220、模式三暴击==================================
*==================18F220、模式三暴击==================================
        
	org	$18f300		/轻量版随机
        
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0008,$0002,$0008,$0200,$0008,$0402,$0008,$0202
        dc.w    $0038,$020a,$0038,$020c,$0038,$000c,$0038,$0008
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        
        dc.w    $0034,$040c,$0034,$020c,$0034,$000c,$0034,$020c
        dc.w    $0028,$0400,$0028,$0204,$0028,$0006,$0028,$0204
        dc.w    $0050,$0006,$0050,$0206,$0050,$0006,$0050,$0206
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000




































































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
