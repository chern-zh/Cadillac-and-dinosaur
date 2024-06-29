
*==========7fc0=0：1V3模式，=1练习模式：=2：1V2模式======================
*==============7FC1：练习模式的关卡
*-------------------————开局游戏清空缓存——————————————————--—	
	org		$a8ae                       ;开始游戏清理数据
	jsr		_begin_cl	
	
	org		$fe5a
	jsr		_daobingchuli
	
	org		$18bc8		/投币下来加载火箭炮，重刷幻影色板
	jsr		_again
	
	ORG		$104900
_begin_cl
	clr.l		($7fc0,A5)
	clr.l		($7f20,A5)
	clr.l		($7f10,A5)
	move.b		#$7,($7668,A5)
	move.b		#$3,($766c,A5)
	move.b		#$5f,($777b,A5)
	jsr		$6b88
	rts
	
_again
	cmpi.b		#$1,($7fc0,A5)
	bne		_noagain
	jsr		_random_color
	cmpi.l		#$1,($100,A6)
	bne		_noagain
	addi.b		#$2,($a3,A6)	/某P玩家初始投币，命数+2
	cmpa.l		#$FFFFB3F4,A6
	beq		_90aa08		/2P命数显存地址
	cmpa.l		#$FFFFB574,A6
	beq		_90b208		/3P命数显存地址,参考$163e4
_90a208
	move.w		#$3,$90a208	/1P命数显存地址	
_noagain
	jsr		$65a4
	rts
_90aa08
	move.w		#$3,$90aa08
	bra		_noagain
_90b208
	move.w		#$3,$90b208
	bra		_noagain
_daobingchuli
	cmpi.b		#$ee,($f,A2)
	bne		_no_f
	cmpi.b		#$1,($7fc0,A5)
	bne		_clr_a2_f
	move.w		#$148,($20,A0)
	move.w		#$100,($8,A0)
	move.w		#$0,($26,A0)
	move.w		#$120,($5c,A0)
_clr_a2_f
	move.b		#$0,($96,A0)
	rts
_no_f
	move.b		($f,A2),($96,A0)
	rts
	


	
*===============================奖命=====================================
	org	$6bcc
	jmp	$104a00
	org	$104a00
	cmpi.b	#$1,($7fc0,A5)
	beq	_no_bonus
	move.b	#$1,($10e,A6)
	jmp	$6bd2	
_no_bonus
	jmp	$6bfc
	
*-----------------------------1V3---------------------------------------------
        org     $659e
        jmp     $101c00
        org     $101c00
	tst.b	($7fc0,A5)
	beq	_1V3
	cmpi.b	#$2,($7fc0,A5)
	beq	_1V3
	tst.b	($7fc1,A5)	/检测练习关卡
	beq	_1V1
	cmpi.b	#$1,($7fc1,A5)	/检测练习关卡
	beq	_1V2	
	bra	_1V3
_1V1
        move.b  #$0,($4ef,A5)       ;强制1V1模式
        rts
_1V2	
        move.b  #$1,($4ef,A5)       ;强制1V2模式
        rts	
_1V3
        move.b  #$2,($4ef,A5)       ;强制1V3模式
        rts
_jingji1v3
	cmpi.b	#$2,($7fc0,A5)
	beq	_101d00
	movea.l	#$2c9b6,A6
	rts
_101d00
	movea.l	#$101d00,A6
	rts
*--------------------1V3竞技模式暴击---------------------------------------------
	org	$1176a
	jsr	_jingji1v3
	
	
*-------------------开场---------------------------
	org	$b1d0
	jsr	$102000
	org	$102000
	add.w	D0,D0
	move.w	D0,($20,A0)
	btst	#$2,($16,A5)	;1P按了下方向键
	bne	_down
	btst	#$2,($17,A5)	;2P按了下方向键
	bne	_down
	btst	#$2,($18,A5)	;3P按了下方向键
	bne	_down
	btst	#$3,($16,A5)	;1P按了上方向键
	bne	_up
	btst	#$3,($17,A5)	;2P按了上方向键
	bne	_up
	btst	#$3,($18,A5)	;3P按了上方向键
	bne	_up		
	move.b	#$30,($3393,A5)	
	move.b	#$30,($3513,A5)
	move.b	#$30,($3693,A5)
	clr.b	($7fc0,A5)
	clr.b	($7f11,A5)
	cmpi.b	#$8,($7f21,A5)
	bge	_yes_xg
	clr.b	($4d9,A5)		
	rts
_up
	move.b	#$1,($7fc0,A5)	;有人按了上键，进入练习模式
	clr.b	($7f11,A5)
	move.b	#$20,($3393,A5)	
	move.b	#$20,($3513,A5)
	move.b	#$20,($3693,A5)
	addq.b	#$2,($a3,A0)	/初始3命
	move.w	#$18,($5f0,A5)		/强制直接最高难度
	move.w	#$18,($5ee,A5)
	move.b	#$5,($4d9,A5)		
	rts	
_down
	move.b	#$1,($7fc0,A5)	;有人按了下键，进入固定暴击练习模式
	move.b	#$1,($7f11,A5)
	move.b	#$20,($3393,A5)	
	move.b	#$20,($3513,A5)
	move.b	#$20,($3693,A5)
	addq.b	#$2,($a3,A0)	/初始3命
	move.w	#$18,($5f0,A5)		/强制直接最高难度
	move.w	#$18,($5ee,A5)
	move.b	#$5,($4d9,A5)		
	rts
	
	;move.b	#$1,($7fc0,A5)	;有人按了下键，进入固定暴击练习模式
	;move.b	#$1,($7f11,A5)
	;move.b	#$40,($3393,A5)	
	;move.b	#$40,($3513,A5)
	;move.b	#$40,($3693,A5)
	;cmpi.b	#$8,($7f21,A5)
	;bge	_yes_xg
	;clr.b	($4d9,A5)		
	;rts
_yes_xg
	move.b	($7f20,A5),($4d9,A5)
	rts	
*-------------------————过关时更换场景——————————————————--—  
	;org		$abb8		*通关
	;jmp		$102200
	;org		$102200
	;cmpi.b		#$2,($7fc1,A5)
	;beq		_abc2
	;cmpi.b		#$7,($4d9,A5)
	;bne		_abe8
_abc2
	;jmp		$abc2	
_abe8
	;jmp		$abe8

	ORG		$abec
	jmp		$102300
	ORG		$102300
	andi.b		#$7,($4d9,a5)
	cmpi.b		#$1,($7fc0,A5)
	bne		_1V23rts
	;cmpi.b		#$2,($7fc1,A5)
	;beq		_across
	cmpi.b		#$3,($7fc1,A5)
	beq		_must_across	
_bjs
	clr.b		($7fc2,A5)
	addq.b		#$1,($7fc1,A5)
_1V23rts	
	jmp		$abf2
_across	
	;cmpi.b		#$8,($1a,A5)
	;bgt		_bjs
_must_across
	move.w		#$1800,($4d0,A5)
	jmp		$ac00


;----------------------------------加载场景--------------------------------     
     	ORG  		$20448
     	jsr 		$107000   
     	ORG  		$107000
     	cmpi.b		#$1,($7fc0,A5)
     	bne		_zccj
	cmpi.b		#$ff,($7fc2,A5)
	beq		_zccj
	move.b		#$ff,($7fc2,A5)
	move.b		#$6,($4d9,A5)
	move.b		#$3,($786,A5)		  	
    	movem.l 		D0-D7/A0-A6,-(A7)	         
    	jsr 		$8a44                   ;载入色板
    	jsr 		$892c                   ;设置亮度
    	move.b 		#$c,$ff84d0
    	jsr 		$2228a                  ;加载场景
    	jsr 		$162ae
    	movem.l 		(A7)+,D0-D7/A0-A6   
	rts    
_zccj
    	jsr 		$206d4
	rts



;===============================1V3练习7BOSS随机暴击===================================
	org		$81962
	jsr		_apx1072
	org		$107200
_apx1072
	move.b		#$2,($aa,A6)		/原指令
	tst.b		($7fc0,A5)
	beq		_rtsss
	;cmpi.b		#$8,($1a,A5)
	;bgt		_updown_check
_suijibjbj
	tst.b		($7fc1,A5)
	beq		_random_color
	move.w		#$1f,($5f0,A5)		/强制直接最高难度
	move.w		#$1f,($5ee,A5)
	tst.b		($7f11,A5)
	beq		_1V23bj
	move.b		#$24,($3393,A5)
	cmpi.b		#$1,($7fc1,A5)
	beq		_move23p
	move.b		#$2a,($3393,A5)
	cmpi.b		#$2,($7fc1,A5)
	beq		_move23p
	move.b		#$30,($3393,A5)
	;cmpi.b		#$3,($7fc1,A5)
_move23p
	move.b		($3393,A5),($3513,A5)
	move.b		($3393,A5),($3693,A5)
_random_color
	movem.l 		D0-D2/A0-A3,-(A7)		;入栈(目的借用寄存器)
	movea.l		#$107440,A3
	movea.l 		#$9143c0,A1				;11C显色存
	moveq		#$0,D0
	moveq		#$0,D1
	moveq		#$0,D2	
	jsr		$119c
	andi.w		#$1f,D0
	move.b		(A3,D0.w),D1
	andi.w		#$ff,D1						;去掉低34位
	mulu.w  		#$20,D1						;取得色板号X20
	movea.l  		#$b8172,A2					;色板数据基址(第一个是白人是色板)
	add.l		D1,A2						;得出此敌人色板数据
	move.b		#$f,D2								;2行（双字节16组）搬运20次
_A1_A2_loop_all
	dbra		D2,_A1_A2_goon_all					;循环20次
	bra		_dtsb_over						;搬运完成收工退出
_A1_A2_goon_all
	move.w		(A2)+,(A1)							;搬运色板数据到显色
	or.w		#$f000,(A1)+						;低4位加上F
	bra		_A1_A2_loop_all						;继续下一组
_dtsb_over
	movem.l		(A7)+,D0-D2/A0-A3				;收工
_rtsss
	rts

_1V23bj
	movem.l		D0/A6,-(A7)
	movea.l		#$107400,A6
	moveq		#$0,D0
	jsr		$119c
	andi.w		#$1f,D0
	move.b		(A6,D0.w),($3393,A5)
	moveq		#$0,D0
	jsr		$119c
	andi.w		#$1f,D0
	move.b		(A6,D0.w),($3513,A5)
	moveq		#$0,D0
	jsr		$119c
	andi.w		#$1f,D0
	move.b		(A6,D0.w),($3693,A5)
	movem.l		(A7)+,D0/A6
	bra		_random_color
_1V4bj
	;movem.l		D0/A6,-(A7)
	;movea.l		#$107420,A6
	;moveq		#$0,D0
	;jsr		$119c
	;andi.w		#$f,D0
	;move.b		(A6,D0.w),($333a,A5)
	move.b		#$40,($3393,A5)
	move.b		($3393,A5),($3513,A5)
	move.b		($3393,A5),($3693,A5)
	;movem.l		(A7)+,D0/A6
	bra		_random_color
_updown_check	
	btst		#$2,($16,A5)	;1P按了下方向键
	bne		_down_30
	btst		#$2,($17,A5)	;2P按了下方向键
	bne		_down_30
	btst		#$2,($18,A5)	;3P按了下方向键
	bne		_down_30
	btst		#$3,($16,A5)	;1P按了上方向键
	bne		_up_40
	btst		#$3,($17,A5)	;2P按了上方向键
	bne		_up_40
	btst		#$3,($18,A5)	;3P按了上方向键
	bne		_up_40
	bra		_suijibjbj
_down_30
	move.b		#$30,($3393,A5)
	move.b		#$30,($3513,A5)
	move.b		#$30,($3693,A5)
	bra		_random_color	
_up_40
	move.b		#$40,($3393,A5)
	move.b		#$40,($3513,A5)
	move.b		#$40,($3693,A5)
	bra		_random_color

	org		$107400
	dc.w		$4030,$2424,$2a2a,$2a2a,$2a2a,$3030,$2a2a,$4024	/1V3
	dc.w		$2020,$3024,$2a2a,$302a,$2a2a,$3030,$2a2a,$2440
	
	org		$107420
	dc.w		$4030,$3030,$2a30,$2a2a,$2440,$2a30,$3040,$3030	/1V4
	;dc.w		$2020,$2a30,$2424,$302a,$2a2a,$3024,$2a2a
	
	org		$107440
	dc.w		$1112,$1314,$1622,$9394,$a221,$1911,$1213,$1416	/幻影色板
	dc.w		$2293,$94a2,$2119,$a222,$9394,$1112,$1316,$3a3a

;=================================7.4场景出兵表格替换（练习模式）=======================================
	;org		$fe5a
	;move.b		($f,A2),($96,A0)
	
	org		$fc22
	jsr		$107500
	org		$107500
	cmpi.b		#$1,($7fc0,A5)	*是否练习模式
	bne		_no_bg
	cmpi.b		#$3,($786,A5)	*是否7关底
	bne		_no_bg
	cmpi.b		#$6,($4d9,A5)	*是否7关底
	bne		_no_bg
	move.l		#$107f00,($c,A4)
	rts	
_no_bg
	move.l		(A1,D0.w),($c,A4)
	rts



;===========================================================================
;-------------------------------------作者daima ------------------------
        org 	$7b3c4                  ;监视小兵数量内存的指令
        jsr	$189000
       org	$189000
       moveq	#$0,D0
       move.b	($4f3,A5),D0
       bne	_nozz
       cmpi.b	#$2,($7fc0,A5)
       beq	_w1V2
       tst.b	($7fc0,A5)
       beq	_w1V3
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90a8ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$107600,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3
_nozz
	rts
_w1V2
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90a6ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$107620,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3
	rts
_w1V3
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90a6ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$107640,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3
	rts
*=========================天台玩家起始坐标赋值=================================
	;org	$4e42
	;jmp	$107700
	;org	$107700
	;add.w	D1,D1
	;add.w	D1,D0
	;adda.w	D0,A0
	;move.w	(A0)+,($8,A6)
	;move.w	(A0)+,($c,A6)
	;move.w	(A0)+,($10,A6)
	;cmpi.w	#$100,($7fc0,A5)
	;bne	_noXYZ
	;move.w	#$40,($8,A6)
	;move.w	#$00,($c,A6)
	;move.w	#$30,($10,A6)
_noXYZ
	;rts

*===================杰克AB打晕敌人====================================
	org	$a275a
	dc.w	$0001
*=========================NOP掉不可选相同人物指令================================================
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

*===============7BOSS派兵==============
	;org		$7c062
	;jsr		_7bosspb
		
	;org		$
_7bosspb
	;move.l		A0,($a4,A6)
	;cmpa.l		#$B5980,A0		/是否7BOSS首兵
	;bne		_pbrts
	;cmpi.b		#$3,($7fc1,A5)
	;bne		_pbrts
	;move.w		#$6ee0,D0
	;rts
_pbrts
	;move.w		(A0),D0
	;rts
*========================选关================================
	org		$af7c
	jmp		_xuanguan
	
*========================难度显示============================
	org		$103f2
	jsr		_diff_show
	
	org		$107900
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
	addq.b	#$1,($7f20,A5)
	andi.b	#$7,($7f20,A5)
	addq.b	#$1,($7f21,A5)		*按键次数
_time_minus	
	movem.l (A7)+, D0-D1/A0
	subq.b	#1,($a,A6)
	bne	_afa6
	jmp	$af82
_afa6
	jmp	$afa6
_diff_show
	cmpi.b	#$9,($1a,A5)
	bge	_7fe3p1
	clr.b	($7f13,A5)
	bra	_showdiffu
_7fe3p1
	addq.b	#1,($7f13,A5)
	cmpi.b	#$4,($7f13,A5)
	ble	_showdiffu
	clr.b	($7fe3,A5)
	move.w	#$1800,($4d0,A5)
_showdiffu
	move.b	#$32,($4ea,A5)
	movem.l	D0-D3/A0-A3,-(A7)
	lea      $90a51c,A1		*游戏难度
	moveq    #0,D0
	move.b   ($7668,A5),D0		*游戏难度
	move.w   D0,($0,A1)
	move.w   #$1e,($2,A1)
	move.b   ($766c,A5),D0		*游戏难度
	move.w   D0,($100,A1)
	move.w   #$1e,($102,A1)
	move.w   ($5ee,A5),D0		*游戏难度
	lsr.b    #4,D0
	move.w   D0,($200,A1)
	move.w   #$1e,($202,A1)
	move.w   ($5ee,A5),D0		*游戏难度
	andi.w    #$f,D0
	move.w   D0,($280,A1)
	move.w   #$1e,($282,A1)
	tst.b	($7f11,A5)
	beq	_no_gd
	lea	$90a21c,A1
	move.w	#$23,($0,A1)
	move.w	#$02,($2,A1)
	move.w	#$23,($80,A1)
	move.w	#$02,($82,A1)
_no_gd
	movem.l	(A7)+,D0-D3/A0-A3
	rts
_continus_dl
	move.b	#$1,($502,A5)
	moveq	#0,D0
	move.b	($5,A6),D0
	rts	
*============================大龙持续召唤兵==============================
	org	$619ae
	jsr	_continus_dl

























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
