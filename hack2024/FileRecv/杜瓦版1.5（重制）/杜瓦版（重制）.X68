*------------------------三倍出兵-----------------------------------
	org	$fddc 
	move.b	($f,A2),($96,A0)
	
	org	$8797e		//8关实验室3倍玻璃怪
	jsr	_glasstri
	
	org	$258b2		///火箭炮
	jsr	_huojianpao

	;org	$fea0		///3BOSS派兵
	;jsr	_3bosstri	
	
	org	$101c00
_tripleb
	move.b	($f,A2),($96,A0)
	movem.l  	D0,-(A7)		;入栈
	moveq	#0,D0
	move.w	($2,A2),D0
	andi.w	#$f,D0
	cmpi.w	#$1,D0
	bne	_triple
_rts
	movem.l	(A7)+,D0
	rts
_triple
	cmpi.b	#$3,D0
	beq	_19ba
	cmpi.w	#$FC,($4,A2)
	beq	_rts
	;cmpi.w	#$38,($4,A2)
	;beq	_rts
	cmpi.b	#$3,($786,A5)
	beq	_8gsb
	tst.b	($786,A5)
	bne	_goto
	cmpi.w	#$40,($4,A2)
	beq	_rts
	cmpi.w	#$c4,($4,A2)
	beq	_rts
	cmpi.w	#$c8,($4,A2)
	beq	_rts
_goto
	jsr	$19de
	bcs	_rts
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
_double
	jsr	$19de
	bcs	_rts
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
	bra	_rts
_19ba
	jsr	$19ba
	bcs	_rts
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
	jsr	$19ba
	bcs	_rts
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
	bra	_rts
_8gsb
	cmpi.b	#$7,($4d9,A5)
	beq	_goto
	bra	_rts
_glasstri
	jsr	$94450
	jsr	$87984
	jsr	$87984
	rts
_huojianpao
	movem.l 		D0-D7/A0-A6,-(A7)
	jsr     		$263d6
	addi.w  		#$c,($c,A0)
	jsr     		$263d6
	subi.w  		#$c,($c,A0)
	movem.l 		(A7)+,D0-D7/A0-A6
	subq.w  		#1,D2
	rts
_3bosstri	
	move.b	($f,A2),($96,A0)
	movem.l  	D0,-(A7)		;入栈
	moveq	#0,D0
	move.w	($2,A2),D0
	andi.w	#$f,D0
	cmpi.w	#$1,D0
	bne	_triple3
_rts1
	movem.l	(A7)+,D0
	rts
_triple3
	cmpi.b	#$3,D0
	beq	_19ba3
	jsr	$19de
	bcs	_rts1
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),D0
	add.w	($744,A5),D0
	move.w	D0,($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
	jsr	$19de
	bcs	_rts1
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),D0
	add.w	($744,A5),D0
	move.w	D0,($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
	bra	_rts1
_19ba3
	jsr	$19ba
	bcs	_rts1
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),D0
	add.w	($744,A5),D0
	move.w	D0,($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
	jsr	$19ba
	bcs	_rts1
	move.b	#$1,($0,A0)
	move.w	($4,A2),($20,A0)
	move.w	($6,A2),D0
	add.w	($744,A5),D0
	move.w	D0,($8,A0)
	move.w	($8,A2),($10,A0)
	move.w	($a,A2),($26,A0)
	move.w	($c,A2),($5c,A0)
	move.b	($e,A2),($5b,A0)
	move.b	($f,A2),($96,A0)
	bra	_rts1

*----------------------------取消单只BOSS死不动，慢动作--------------------------------
		org		$778c	/正常走此指令，打死单只BOSS后不能动，不无敌	;
		jmp		_nomove
		org		$81fea	;仅派兵BOSS触发此指令，不走此指令，打死BOSS后依旧能动					
		jmp		_cancelpb		
		org		$acee
		jmp		_gguan	
		org		$b1d0
		jsr		_begin
		org		$a8ae
		jsr		_set_difficulty
		org		$18a1a		//过场景
		jsr		_clrcj
		org		$3740
		jmp		_dms1vx	
		
		
		org		$102e00
_nomove
		cmpi.b		#$1,($7fd4,A5)
		bge		_clrg1
		rts
_clrg1
		clr.b		($7fd4,A5)
		move.w		#$ff07, D0
		move.l		#$4440000,D1
		jmp		$7796
_cancelpb	
		move.b		#$6,($4,A6)
		cmpi.b		#$1,($7fd6,A5)
		bge		_clrg2
		rts
_clrg2
		clr.b		($7fd6,A5)
		jmp		$81ff0	


;=======================================================================================
_gguan
	cmpi.b	#$6,($4d9,A5)
	beq	_guoguan
	;cmpi.b	#$7,($4d9,A5)
	;beq	_kill2
	bra	_kill3
_guoguan
	addq.b	#1,($7fd4,A5)
	addq.b	#1,($7fd6,A5)
	move.b	#1,($4d4,A5)
	jmp	$acf4
_kill2
	addq.b	#1,($7fd2,A5)
	cmpi.b	#$2,($7fd2,A5)
	bge	_guoguan
	rts
_kill3
	addq.b	#1,($7fd2,A5)
	cmpi.b	#$3,($7fd2,A5)
	bge	_guoguan
	cmpi.w	#$150,($20,A6)
	beq	_stcl
	rts
_stcl
;------------------------------------大龙清版与尸体处理相关-----------------------------------------                		
	movem.l	A0-A6/D0-D1,-(A7)
	movea.l	A6,A0					;复制一下大龙150地址到A0
	movea.w	($B0,A0),A6					;大龙后手		
	jsr	$1a9e						;内存清理,并回收
	clr.w	($b0,A6)
	movea.w	($B2,A0),A6					;大龙后手
	jsr	$1a9e
	clr.w	($b0,A6)
	movea.w	($B4,A0),A6					;大龙前手
	jsr	$1a9e
	clr.w	($b0,A6)
	movea.w	($B6,A0),A6					;大龙前手
	jsr	$1a9e
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
	jsr	$1a9e
	clr.w	($b0,A6)		
_acee_js
	movem.l	(A7)+,A0-A6/D0-D1
	move.w	#$28,($20,A6)	/尸体消失
	move.w	#$0,($26,A6)		
	rts				;结束，换尸体ID，退出过关
		
		
*==============================================================================================================================		

_set_difficulty
	move.b	#$7,($7668,A5)
	move.b	#$3,($766c,A5)
	move.b	#$5f,($777b,A5)
	jsr	$3d2a
	rts
_begin
	add.w	D0,D0
	move.w	D0,($20,A0)
	clr.l	($7fd0,A5)
	clr.l	($7fd4,A6)
	move.b	#$40,($333a,A5)		/开局锁40暴击出场
	move.b	#$40,($34ba,A5)
	move.b	#$40,($363a,A5)
	btst	#$2,($16,A5)	;1P按了下方向键
	bne	_ms1v2
	btst	#$2,($17,A5)	;2P按了下方向键
	bne	_ms1v2
	btst	#$2,($18,A5)	;3P按了下方向键
	bne	_ms1v2
	btst	#$3,($16,A5)	;1P按了上方向键
	bne	_ms1v3
	btst	#$3,($17,A5)	;2P按了上方向键
	bne	_ms1v3
	btst	#$3,($18,A5)	;3P按了上方向键
	bne	_ms1v3
	clr.b	($7f55,A5)
	rts
_ms1v2
	move.b	#$1,($7f55,A5)
	rts
_ms1v3
	move.b	#$2,($7f55,A5)
	rts		
_clrcj
	move.b	#$1,($0,A6)
	clr.l	($7fd0,A5)
	clr.l	($7fd4,A6)
	rts	
_dms1vx
	tst.b	($7f55,A5)
	beq	_noms	
	move.b	($7f55,A5),($4ef,A5)
	rts
_noms
	move.b	D0,($4ef,A5)
	rts

*================================汉娜招式==============================
	org	$143e
	jsr	_zhaoshi
	org	$fcac
	jmp	_jiabei
	org	$1036c	*无限时间
	jsr	_ms_show

	org	$104f00
	dc.l	$17B08000,$00000405,$00285000,$17B08000   		/17A8为胳膊肘66A
	dc.l	$0100040F,$00285000,$17C08000,$020004C6 
	dc.l	$00285000,$FFF40000
	
	org	$105000
_zhaoshi
	cmpa.l	#$9fae8,A0
	bne	_no_change
	movea.l	#$104f00,A0		/更换A0地址
_no_change
	move.l	A0,($28,A6)
	move.w	(A0)+,D0
	rts
_jiabei
	jsr	$fd30
	cmpi.w	#$1,($2,A2)
	beq	_is3c
	cmpi.w	#$FC,($4,A2)
	beq	_fcb4
	cmpi.w	#$40,($4,A2)
	beq	_fcb4
	;cmpi.w	#$c8,($4,A2)
	;beq	_fcb4
	;cmpi.w	#$c4,($4,A2)
	;beq	_fcb4
_kais
	jsr	$fd30
	jsr	$fd30
_fcb4
	bcs	_fcbe
	jmp	$fcb4
_fcbe
	jmp	$fcbe

_is3c
	cmpi.w	#$3c,($4,A2)
	bne	_fcb4
	bra	_kais
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
*---------------------------模式显示----------------------------------------
_ms_show
	movem.l		D0-D3/A0-A3,-(A7)	
	lea		$90a01c,A1		/90a31c，6表示左右位置，ec表示上下位置	90B4F4
	lea		$102ce0,A0
	tst.b		($7f55,A5)
	beq		_c0a
	adda.l		#$8,A0
	cmpi.b		#$1,($7f55,A5)
	beq		_c0a
	adda.l		#$8,A0	
_c0a	
	jsr		$c0a
	;lea      		$90a31c,A1		*游戏难度
	;moveq   		#0,D0
	;move.b   		($7668,A5),D0		*游戏难度
	;move.w   		D0,($0,A1)
	;move.w   		#$2,($2,A1)
	;move.b   		($766c,A5),D0		*游戏难度
	;move.w   		D0,($100,A1)
	;move.w   		#$2,($102,A1)
	;move.w   		($5ee,A5),D0		*游戏难度
	;lsr.b    		#4,D0
	;move.w   		D0,($200,A1)
	;move.w   		#$2,($202,A1)
	;move.w   		($5ee,A5),D0		*游戏难度
	;andi.w    		#$f,D0
	;move.w   		D0,($280,A1)
	;move.w   		#$2,($282,A1)
	
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










*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
