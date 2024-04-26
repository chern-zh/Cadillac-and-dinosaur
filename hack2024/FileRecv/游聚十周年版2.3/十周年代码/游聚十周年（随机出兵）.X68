;------------------------------------BOSS死亡过关、尸体消失相关---------------------------------------
	org		$acee
	jmp		$104a00
	org		$104a00
	cmpi.w		#$f4,($20,A6)
	beq		_2guanjc
	cmpi.w		#$7c,($20,A6)
	beq		_3guanjc
	cmpi.w		#$64,($20,A6)
	beq		_4guanjc
	cmpi.w		#$a0,($20,A6)
	beq		_5guanjc	
	cmpi.w		#$150,($20,A6)
	beq		_8guanjc
	cmpi.w		#$10,($20,A6)
	beq		_6guanjc
	cmpi.w		#$120,($20,A6)	/$5e460跳转
	beq		_6guanjc	
	cmpi.w		#$48,($20,A6)
	beq		_1guanjc	
	jmp		_guoguan		/7BOSS直接过关	
_1guanjc
	tst.b		($4d9,A5)
	bne		_no_gg
	cmpi.b		#$2,($786,A5)
	bne		_no_gg
	bra		_jc_3			;第1关打死3个1BOSS
_2guanjc
	cmpi.b		#$1,($4d9,A5)
	bne		_boss_minus
	cmpi.b		#$2,($786,A5)
	bne		_boss_minus
	bra		_jc_3			;第2关打死3个BOSS
_3guanjc
	cmpi.b		#$2,($4d9,A5)
	bne		_rts3
	;cmpi.w		#$2ccc,($744,A5)
	;bls		_rts3	
	bra		_jc_4			;第3关打死6个BOSS
_4guanjc
	cmpi.b		#$3,($4d9,A5)
	bne		_no_gg
	cmpi.b		#$2,($786,A5)
	bne		_no_gg
	cmpi.w		#$440,($744,A5)
	ble		_no_gg	
	bra		_jc_2			;第4关打死2个BOSS
_5guanjc
	cmpi.b		#$4,($4d9,A5)		;第5关打死2个BOSS
	bne		_boss_minus
	cmpi.w		#$1100,($744,A5)
	ble		_boss_minus
	bra		_jc_2
_6guanjc
	cmpi.b		#$5,($4d9,A5)
	bne		_boss_minus
	cmpi.b		#$2,($786,A5)
	bne		_boss_minus	
	bra		_jc_2			;第6关打死2个6BOSS
_8guanjc
	cmpi.b		#$7,($4d9,A5)
	bne		_dl
	cmpi.b		#$3,($786,A5)
	bne		_dl	
	bra		_guoguan			;第8关打死1个大龙	
_jc_6
	addq.b		#1,($7fa2,A5)		*第3关打死6个摩托
	cmpi.b		#$6,($7fa2,A5)		*第3关打死6个摩托
	bge		_guoguan
	rts
_jc_4
	addq.b		#1,($7fa2,A5)		*第1关打死8个
	cmpi.b		#$4,($7fa2,A5)		*第1关打死8个
	bge		_guoguan
	rts
_jc_3
	addq.b		#1,($7fa2,A5)		*第2关打死3个
	cmpi.b		#$3,($7fa2,A5)		*第2关打死3个
	bge		_guoguan
	rts	
_jc_2
	addq.b		#1,($7fa2,A5)
	cmpi.b		#$2,($7fa2,A5)
	bge		_guoguan
	cmpi.w		#$150,($20,A6)
	beq		_dll	
_rts3
	rts	
_boss_minus
	subq.b		#$1,($7fe0,A5)		/屠夫、铁头龙、6B、6B幼体，清版-1
	cmpi.w		#$f4,($20,A6)
	beq		_rts3			/屠夫在这里不换尸体
_no_gg
	move.w		#$28,($20,A6)
	move.w		#$0,($26,A6)
	rts		
_guoguan
	move.b		#$1,($4d4,A5)
	clr.b		($7ff2,A5)
	addq.b		#1,($7fa4,A5)
	addq.b		#1,($7fa6,A5)	
	jmp		$acf4
	
;------------------------------------大龙清版与尸体处理相关-----------------------------------------                
_dl
		subq.b	#1,($7fe0,A5)
_dll		
		movem.l	A0-A6/D0-D1,-(A7)
		movea.l	A6,A0					;复制一下大龙150地址到A0
		movea.w	($B0,A0),A6					;大龙后手		
		jsr	$48fc						;内存清理,并回收
		clr.w	($b0,A6)
		movea.w	($B2,A0),A6					;大龙后手
		jsr	$48fc
		clr.w	($b0,A6)
		movea.w	($B4,A0),A6					;大龙前手
		jsr	$48fc
		clr.w	($b0,A6)
		movea.w	($B6,A0),A6					;大龙前手
		jsr	$48fc
		clr.w	($b0,A6)
		clr.l	($B0,A0)
		clr.l	($B4,A0)		
		;--------------------------搜索大龙身体154，并清零----------------------------
		movea.l	#$FFFFDD14,A1					;c8f4
_154_zt
		cmpa.w	($b0,A1),A0						;是否大龙基址
		beq	_154_clr						;找到则执行清理，并退出（只有1个）
		suba.w	#$e0,A1							;偏移到下一个OBJ
		cmpa.w	#$c8f4,A1					;搜索完毕，没有退出
		blt	_acee_js						;没有退出
		bra	_154_zt							;循环
_154_clr
		movea.w	A1,A6
		jsr	$48fc
		clr.w	($b0,A6)		
_acee_js
		movem.l	(A7)+,A0-A6/D0-D1
		bra	_no_gg				;结束，退出过关

;-------------------------------3B派兵-----3B派兵是jmp跳转----------------------------------------
	org		$4fe40
	jmp		$105a00
	org		$105a00
	cmpi.b		#$2,($4d9,A5)
	bne		_no_3pb
	;cmpi.w		#$2ccc,($744,A5)
	;ble		_no_3pb
	;addq.b		#1,$ffffc3	;派兵次数
	;cmpi.b		#$2,$ffffc3	;	
	;bge		_no_3pb		;派兵次数最多1次，1倍派兵	
	jmp		$7bedc
_no_3pb
	rts
*----------------------------3BOSS随机派兵相关---------------------------------------		
	org		$ff1e
	jsr		$101d00
	;move.b		($f,A2),($96,A0)
	org		$101d00
	cmpi.w		#$48,($20,A0)
	beq		_no3bsj
	movem.l		D0,-(A7)			;把D0移到空位置
	clr.l		D0
	jsr		$119c
         andi.w		#$3,D0			;随机数在D0里，求余,限制范围( )
	mulu.w		#$4,D0			;乘个4，变为4的倍数
	move.w		_3b_xb(PC,D0.w),($20,A0)	;取下表中随机一个敌兵
	addi.b		#$2,D0
	move.w		_3b_xb(PC,D0.w),($26,A0)	;取下表中紧随的出场方式		
	move.b		#$0,($96,A0)	   	;取下表中随机一个补给
	movem.l		(A7)+,D0			;把原来D0中的数据移回去
	move.b		#$0,($5b,A0)
	rts
;-------------------------------3B静态数据表----------------------------------------
_3b_xb
        dc.w    $0048,$0200,$0018,$0000,$000c,$0000,$016c,$0000
_no3bsj
	move.b		($f,A2),($96,A0)
	rts

;---------------------------随机出兵---------------------------------------
	org		$fe5a
	jsr		_random_pb
	org		$107000
_random_pb
	movem.l  		D0-D2/A6,-(A7)		;入栈
	moveq		#$0,D0		
	move.b		($3,A2),D0		;检测是否箱子或破门等
	andi.b		#$f,D0			;取个位
	cmpi.b		#$1,D0			;是否特效，包装敌兵等
	beq 		_nosuiji
	cmpi.b		#$3,D0			;是否道具，箱子等
	beq 		_nosuiji
	cmpi.w  		#$28,($20,A0)       ;是否胖子
	beq     		_sj1_
	cmpi.w 		#$8,($20,A0)        ;是否马甲
	beq     		_sj1_        
	cmpi.w  		#$38,($20,A0)       ;是否刀手
	beq     		_sj1_
	cmpi.w  		#$34,($20,A0)       ;是否猎人
	beq     		_sj1_
	cmpi.w  		#$50,($20,A0)       ;猴子
	beq     		_sj1_
	cmpi.w  		#$100,($20,A0)      ;是否扔雷猴
	beq     		_sj1_
	cmpi.w  		#$fc,($20,A0)       ;是否飞刀手
	beq     		_sj1_
	cmpi.w  		#$118,($20,A0)       ;摩托车
	beq     		_sj1_	
_nosuiji
	move.b		($f,A2),($96,A0)
	movem.l  		(A7)+,D0-D2/A6			;把原来D0中的数据移回去	
	rts			
_sj1_
	cmpi.b		#$7,($4d9,A5)
	bne		_jc7	
	cmpi.b		#$3,($786,A5)		;是否关底
	beq		_gdsj
	bra		_no_gdsj
_jc7
	cmpi.b		#$6,($4d9,A5)		;7关
	bne		_jc5
	cmpi.b		#$3,($786,A5)		;是否关底
	beq		_gdsj
	cmpi.b		#$1,($786,A5)		;是否电梯
	beq		_dianti_suiji
	bra		_no_gdsj	
_jc5
	cmpi.b		#$4,($4d9,A5)		;5关
	bne		_jc3
	cmpi.w		#$D80,($744,A5)		;是否关底
	bge		_gdsj
	bra		_no_gdsj
_jc3
	cmpi.b		#$2,($4d9,A5)		;3关
	bne		_jc_cj3			;
	cmpi.w		#$f00,($744,A5)		;检测3关卷轴
	bge		_nosuiji			/3关后半部分不随机
	bra		_no_gdsj		
_jc_cj3
	cmpi.b		#$2,($786,A5)		;是否第3场景(1、2、4、6)关
	beq		_gdsj	
*----------------------------非关底随机----------------------------------------------
_no_gdsj
	moveq		#$0,D0	
	jsr		$119c                   	;进入随机程序	
	andi.w		#$3f,D0
	add.w		D0,D0
	add.w		D0,D0
	movea.l		#$18a000,A6
	move.w		(A6,D0.w),($20,A0)	;取下表中随机一个敌兵
	addq.b		#2,D0
	move.w		(A6,D0.w),($26,A0)	;取下表中紧随的出场方式
	cmpi.w		#$c,($20,A0)
	bne		_cb_next
	cmpi.b		#$7,($4d9,A5)
	bne		_no_gdbj
	cmpi.b		#$1,($786,A5)
	bne		_no_gdbj
	move.w		#$16c,($20,A0)
	bra		_no_gdbj
_cb_next
	cmpi.w		#$7c,($20,A0)
	bne		_no_gdbj
	cmpi.b		#$7,($4d9,A5)
	beq		_7c_8g
	cmpi.b		#$2,($4d9,A5)
	bne		_no_gdbj
_huans
	move.w		#$11c,($20,A0)
	bra		_no_gdbj
_7c_8g
	cmpi.b		#$2,($786,A5)
	beq		_huans
	bra		_no_gdbj	                  
_dianti_suiji
	move.w		#$18,($20,A0)	;取下表中随机一个敌兵
	clr.w		($26,A0)	;取下表中紧随的出场方式
_no_gdbj
	clr.b		($96,A0)
	movem.l  		(A7)+,D0-D2/A6			;把原来D0中的数据移回去
	clr.b  		($5b,A0)
         	rts
        
;----------------------------关底随机队列-----------------------------------------
_gdsj
	moveq		#$0,D0	
	jsr		$119c                   	;进入随机程序
	andi.w		#$1f,D0			;随机数在D0里，求余,限制范围( )
	mulu.w   		#$4,D0                     ;乘个4，变为4的倍数
	movea.l		#$18a200,A6
	move.w		(A6,D0.w),($20,A0)	;取下表中随机一个敌兵
	addq.b  		#2,D0
	move.w		(A6,D0.w),($26,A0)	;取下表中紧随的出场方式
	clr.b		($96,A0)	
	movem.l  		(A7)+,D0-D2/A6			;把原来D0中的数据移回去	
	rts						/取消关底补给
;-------------------------------爆物数据表----------------------------------------
	;org	$B7B52	*39，非幻影BOSS
	;dc.w	$0207,$0500,$0004,$0d0e,$1400,$1600,$0019,$1a1b
	;dc.w	$1c1d,$1e1f,$0021,$0023,$2400,$2200,$0028,$002a
	;org	$B7B72	*3a，大个子
	;dc.w	$0401,$0602,$0d0e,$1500,$0017,$1800,$1b00,$1d00
	;dc.w	$001f,$2021,$2223,$2400,$2300,$2100,$2900,$2b00
	;org	$B7AB2	*34，非关底，幻影
	;dc.w	$0201,$0504,$0706,$0201,$0504,$0706,$0102,$0605
	;dc.w	$0201,$0504,$0706,$0201,$0704,$0706,$0604,$0000
*----------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
        
	org	$18a000	*非关底随机

	dc.l    $00480200,$016c0000,$000c0000,$00180000
	dc.l    $00A00000,$00900000,$00F40000,$007C0000
	dc.l    $011C0000,$00640000,$01500000,$01480000
	dc.l    $00F40000,$011c0000,$00640000,$00180000
	
	dc.l    $00600000,$00740200,$000c0000,$00180000
	dc.l    $00480200,$016c0000,$00A00000,$00900000
	dc.l    $00480200,$016c0000,$000c0000,$00A00000
	dc.l    $00900000,$00F40000,$011c0000,$00640000
	
	dc.l    $00480200,$016c0000,$000c0000,$00180000
	dc.l    $00A00000,$00900000,$00F40000,$007C0000
	dc.l    $011C0000,$00640000,$01500000,$016c0000
	dc.l    $00F40000,$011c0000,$00640000,$00180000
	
	dc.l    $00600000,$00740200,$000c0000,$00180000
	dc.l    $00480200,$016c0000,$00A00000,$00900000
	dc.l    $00480200,$016c0000,$000c0000,$00A00000
	dc.l    $00900000,$00F40000,$011c0000,$00640000
     
                 
	org	$18a200	*关底随机                  

	dc.l    $00480200,$016c0000,$000c0000,$00180000
	dc.l    $0034000c,$0034040c,$0034020c,$00480200
	dc.l    $00080002,$00080402,$00080402,$016c0000
	dc.l    $00280406,$00280006,$00280206,$00180000

	dc.l    $00380008,$0038000c,$0038020c,$00380208
	dc.l    $00500206,$00500006,$00500006,$00500206
	dc.l    $00480200,$016c0000,$000c0000,$00180000
	dc.l    $00480200,$016c0000,$000c0000,$00180000	



























































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
