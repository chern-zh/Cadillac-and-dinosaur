*----------------------------开局清空缓存---------------------------
	org	$ad66
	jsr	_clrbegin	
	
	org	$4dba
	jsr	_beginbj
*---------------------过场景清空缓存-------------------------
	ORG 		 $18a98
	jsr		_clr1901
*------------------玄关--------------------------------------
	org	$ab26
	jsr	_fbf4	
*-------------------————随即关卡——————————————————--— 
;----------------首次随机关-------------------------
	org	$b1d0		/选人界面按下选定键会运行的指令
	jsr	_b1d0	
*=======================================================
	ORG	$abec
	jsr	_nextstage
*==========================================================
	org	$190000
_beginbj
	move.w   #$4848,($11e,A3)
	rts
_clrbegin
	clr.l	($7fa0,A5)
	clr.l	($7fa4,A5)
	clr.l	($7fa8,A5)
	clr.l	($7f30,A5)
	clr.l	($7f34,A5)
	clr.l	($7f38,A5)
	clr.l	($7f3c,A5)
	clr.l	($7f20,A5)
	clr.l	($7fe0,A5)
	clr.l	($7f66,A5)
	clr.l	($7f7c,A5)
	clr.l	($7f76,A5)
	clr.l	($7f72,A5)
	clr.l	($7f94,A5)
	clr.l	($7f98,A5)
	clr.l	($7f9c,A5)
	clr.l	($7f48,A5)	
	jsr	$89e6
	rts
_clr1901
	move.b		#$2,($0,A6)
	move.w		#$258,($ec,A6)
	clr.l		($7fe0,A5)
	clr.l		($7f82,A5)
	tst.b		($7f77,A5)
	beq		_zjfhui
	movem.l 		D0-D7/A0-A6,-(A7)	
	jsr 		$892c                    ;设置亮度
	jsr 		$162ae		;加载血条与头像
	cmpi.b		#$f,($7f77,A5)
	bne		_chuzhanjk
	clr.b		($7f77,A5)  
_chuzhanjk 	
	movem.l 		(A7)+,D0-D7/A0-A6
_zjfhui
	rts		
_fbf4
	jsr	$fbf4
	cmpi.b	#$6,($4d1,A5)
	bne	_zhijierts
	movem.l 	D0-D2/A0-A2,-(A7)
	moveq	#0,D0
	moveq	#0,D1
	moveq	#0,D2
	move.b	($1a,A5),D0
	subq.b	#8,D0
	btst	#$0,D0
	bne	_jcupdown1
	btst	#$1,D0
	bne	_jcupdown2
	btst	#$2,D0
	bne	_jcupdown3
_udrts 	
	movem.l 	(A7)+,D0-D2/A0-A2
_zhijierts
	rts	
_jcupdown1
	moveq	#0,D0
	moveq	#0,D1  
	move.b	($16,A5),D0
	move.b	($1b,A5),D1
	not.b	D1
	and.b	D1,D0
	btst	#$3,D0    ;1P按了上方向键
	bne	_123pup
	btst	#$2,D0    ;1P按了下方向键
	bne	_123pdown
	bra	_udrts
_jcupdown2
	moveq	#0,D0
	moveq	#0,D1
	move.b	($17,A5),D0
	move.b	($1c,A5),D1
	not.b	D1
	and.b	D1,D0
	btst	#$3,D0    ;2P按了上方向键
	bne	_123pup
	btst	#$2,D0    ;2P按了下方向键
	bne	_123pdown
	bra	_udrts
_jcupdown3
	moveq	#0,D0
	moveq	#0,D1
	move.b	($18,A5),D0
	move.b	($1d,A5),D1
	not.b	D1
	and.b	D1,D0
	btst	#$3,D0    ;3P按了上方向键
	bne	_123pup
	btst	#$2,D0    ;3P按了下方向键
	bne	_123pdown
	bra	_udrts
_123pup
	move.b	#$1,($7f9f,A5)
	addq.b	#1,($7f9e,A5)
	andi.b	#$7,($7f9e,A5)
	move.b	($7f9e,A5),D2
	addq.b	#1,D2
	bsr	_select_xc
	bra	_udrts 
_123pdown
	move.b	#$1,($7f9f,A5)
	subq.b	#1,($7f9e,A5)
	andi.b	#$7,($7f9e,A5)
	move.b	($7f9e,A5),D2
	addq.b	#1,D2
	bsr	_select_xc
	bra	_udrts
_select_xc
	movea.l	#$90aaf4,A0
	move.l	#$4e0001,($0,A0)
	move.l	#$450001,($80,A0)
	move.l	#$580001,($100,A0)
	move.l	#$540001,($180,A0)	
	move.l	#$530001,($280,A0)
	move.l	#$540001,($300,A0)
	move.l	#$410001,($380,A0)
	move.l	#$470001,($400,A0)
	move.l	#$450001,($480,A0)
	move.l	#$3a0001,($500,A0)
	move.w	D2,($580,A0)
	move.w	#$1,($582,A0)
	rts	
_b1d0
         clr.b	($7fba,A5)
         clr.b	($4d9,A5)
	add.w	D0,D0
	move.w	D0,($20,A0)
	add.w	D0,($14,A5)
	movem.l	D0,-(A7)
	move.b   ($636,A5),D0
	add.b	D0,($15,A5)
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
         moveq          #0,D0
         jsr            $119c
         andi.w         #$7,D0
         add.w          D0,D0
         add.w          D0,D0
         move.w         _yc1_a(PC,D0.w),($7f5c,A5)
         addq.w         #2,D0
         move.w         _yc1_a(PC,D0.w),($7f5e,A5)
	movem.l        (A7)+,D0
	rts	
_down
	move.b		#$1,($7f70,A5)		*挑战模式正序八关C模式
         moveq          #0,D0
         jsr            $119c
         andi.w         #$7,D0
         add.w          D0,D0
         add.w          D0,D0
         move.w         _yc1_c(PC,D0.w),($7f5c,A5)
         addq.w         #2,D0
         move.w         _yc1_c(PC,D0.w),($7f5e,A5)
	bsr		_true_c
	movem.l        (A7)+,D0
	rts
_up
	move.b	      #$2,($7f70,A5)		*简易模式正序八关B模式
         moveq          #0,D0
         jsr            $119c
         andi.w         #$7,D0
         add.w          D0,D0
         add.w          D0,D0
         move.w         _yc1_b(PC,D0.w),($7f5c,A5)
         addq.w         #2,D0
         move.w         _yc1_b(PC,D0.w),($7f5e,A5)
	movem.l        (A7)+,D0
	rts
_yc1_a	
         dc.l           $000c0000,$00480200,$016c0000,$00180000
         dc.l           $000c0000,$00480200,$016c0000,$00180000
_yc1_b
         dc.l           $011c0000,$00480200,$016c0000,$00180000
         dc.l           $011c0000,$00480200,$016c0000,$00180000
_yc1_c
         dc.l           $011c0000,$00480200,$011c0000,$00480200
         dc.l           $011c0000,$00480200,$011c0000,$00480200
_true_c
         	btst		#$1,($16,A5)	;1P按了左方向键
	bne		_left_right
	btst		#$1,($17,A5)	;2P按了左方向键
	bne		_left_right
	btst		#$1,($18,A5)	;3P按了左方向键
	bne		_left_right
	btst		#$0,($16,A5)	;1P按了右方向键
	bne		_left_right
	btst		#$0,($17,A5)	;2P按了右方向键
	bne		_left_right
	btst		#$0,($18,A5)	;3P按了右方向键
	bne		_left_right
	rts
_left_right
	move.b		#$1,($7fba,A5)
	rts	
;--------------------过关--------------------------
_nextstage
	clr.l	($7fa0,A5)
	clr.l	($7fa4,A5)
	clr.l	($7fa8,A5)    
	clr.l	($7fe0,A5)
	clr.l	($7f76,A5)
	tst.b	($7f73,A5)		;隐藏关2回8关标志
	beq	_randomlevel
	cmpi.b	#$7,($4d9,A5)
	bne	_zhijiefh
	move.b	#$71,($7f73,A5)
	move.b	#$2,($786,A5)
_zhijiefh
	rts
_randomlevel
	tst.b	($7f9f,A5)
	beq	_no_select
	move.b	($7f9e,A5),($4d9,A5)
	clr.b	($7f9f,A5)
_no_select
	andi.b	#$7,($4d9,A5)
_7f94
	tst.b	($7f94,A5)
	bne	_7f95
	move.b	($4d9,A5),($7f94,A5)
	addq.b	#1,($7f94,A5)
	rts	
_7f95
	tst.b	($7f95,A5)
	bne	_7f96
	move.b	($4d9,A5),($7f95,A5)
	addq.b	#1,($7f95,A5)
	rts
_7f96
	tst.b	($7f96,A5)
	bne	_7f97
	move.b	($4d9,A5),($7f96,A5)
	addq.b	#1,($7f96,A5)
	rts
_7f97
	tst.b	($7f97,A5)
	bne	_7f98
	move.b	($4d9,A5),($7f97,A5)
	addq.b	#1,($7f97,A5)
	rts
_7f98
	tst.b	($7f98,A5)
	bne	_7f99
	move.b	($4d9,A5),($7f98,A5)
	addq.b	#1,($7f98,A5)
	rts
_7f99
	tst.b	($7f99,A5)
	bne	_7f9a
	move.b	($4d9,A5),($7f99,A5)
	addq.b	#1,($7f99,A5)
	rts
_7f9a
	tst.b	($7f9a,A5)
	bne	_7f_go
	move.b	($4d9,A5),($7f9a,A5)
	addq.b	#1,($7f9a,A5)
	rts
_7f_go
	rts


;==========================================出场音乐=============================================
	org	$4285c
	jsr	_music_1
	org	$58612                    ;取消2B开场音乐
	jsr	_music_2
	org	$517d6                    ;取消5B开场音乐
	jsr	_music_5
	org	$61882                    ;取消8B开场音乐
	jsr	_music_8
	
	
	org	$104e00
_music_2
	cmpi.b	#$1,($4D9,A5)		;是否2关
	bne	_music_no
	cmpi.b	#$2,($786,A5)
	bne	_music_no	
	jsr	$a63c
_music_no
	rts

_music_5
	cmpi.b	#$4,($4D9,A5)		;是否5关
	bne	_music_no
	cmpi.w	#$1100,($744,A5)
	ble	_music_no	
	jsr	$a63c
	rts
_music_8
	cmpi.b	#$3,($786,A5)
	bne	_music_no	
	jsr	$a63c
	rts
_music_1
	tst.b	($4d9,A5)
	bne	_1bmusic
	jsr	$a63c
	rts
_1bmusic
	moveq	#6,D0		*借用第六关树林音乐
	jsr	$a63c
	rts	
*----------------------------取消单只BOSS死不动，慢动作--------------------------------
		org		$a5ea	/正常走此指令，打死单只BOSS后不能动，不无敌	;
		jmp		_no_move1
		
		org		$7c0ce	;仅派兵BOSS触发此指令，不走此指令，打死BOSS后依旧能动，					
		jmp		_no_move

		org		$7bf82		/检测派兵BOSS是否死亡
		jmp		_boss_pb_die
		nop		
;------------------------------------------------------------------------------------		
		org		$105000
_no_move1
		cmpi.b		#$1,$ffffa4
		bge		_clr1
		rts
_clr1
		clr.b		($7fa4,A5)
		move.w		#$ff07, D0
		move.l		#$4440000, D1
		jmp		$a5f4
_no_move		
		move.b		#$6,($4,A6)	*消除BOSS派兵
		cmpi.b		#$1, ($7fa6,A5)
		bge		_clr2
		rts
_clr2
		clr.b		($7fa6,A5)
		jmp		$7c0d4
_boss_pb_die
		tst.w		($6c,A0)
		beq		_7c0ce
		jmp		$7bf8a
_7c0ce
		cmpi.b		#$5,($4d9,A5)
		bne		_true_7c0ce
		cmpi.b		#$2,($786,A5)
		bne		_true_7c0ce
		tst.b		($7f74,A5)
		beq		_true_7c0ce
		cmpi.b		#$6,($7fa2,A5)
		bge		_true_7c0ce
		jmp		$7bf8a

_true_7c0ce
		jmp		$7c0ce

*--------------------------------幻影、屠夫尸体消失，马云清版-1--------------------------------------------
	org		$2af8c
	move.l		#$4000000,($4,A6)	
	org		$2af94		*前端
	jsr		$18f400
	org		$52ebe		*后端
	jsr		_houduan
	org		$52e6a		*动作
	jsr		_act_b
	org		$52e9c		*动作
	jsr		_act_e	
	org		$18f400
*---------------前端------------------------------
	cmpi.w		#$f4,($20,A6)
	bne		_11cshiti
	cmpi.b		#$1,($4d9,A5)		
	bne		_hmj
	cmpi.b		#$2,($786,A5)
	bne		_hmj
	subi.w		#$100,($26,A6)
	beq		_bhmj		*最后一阶，不变身，过关
	move.w		#$90,($20,A6)
	bra		_bhmj	
_11cshiti	
	cmpi.w		#$11c,($20,A6)
	beq		_11cjc			;
	cmpi.w		#$90,($20,A6)
	beq		_5gjc	
	bra		_bhmj	
_5gjc
	cmpi.b		#$4,($4d9,A5)		
	bne		_5boss_minus
	cmpi.w		#$1100,($744,A5)
	ble		_5boss_minus	
	bra		_bhmj
_11cjc
	tst.b		($7f77,A5)
	beq		_no1minus
	subq.b		#$1,($7fe0,A5)	
_no1minus
	cmpi.b		#$6,($4d9,A5)		
	bne		_hmj
	cmpi.b		#$3,($786,A5)
	bne		_hmj
	bra		_bhmj		
_5boss_minus
	subq.b		#$1,($7fe0,A5)	
_hmj	
	move.w		#$38,($20,A6)		;尸体换成小兵
	move.w		#$0,($26,A6)	
_bhmj	
	move.b		#$1,($0,A6)
	rts
*---------------------------后端------------------------------
_houduan
	clr.w		($de,A6)
	cmpi.b		#$F,($3,A6)
	bne		_90A0
	move.w		#$F4,($20,A6)
	move.b		#$e,($96,A6)
	rts
_90A0
	move.w		#$A0,($20,A6)
	rts
*--------------------------动作--------------------------------
_act_b
	cmpi.b		#$f,($3,A6)
	beq		_tufu_act1
	jsr		$120e
	rts
_tufu_act1
	cmpi.w		#$200,($26,A6)
	bne		_second1
_first1
	moveq		#$12,D0		*屠夫开始动作
	jsr		$120e
	rts
_second1
	moveq		#$3,D0		*屠夫开始动作
	jsr		$120e
	rts
_act_e
	cmpi.b		#$f,($3,A6)
	beq		_tufu_act2
	jsr		$120e
	rts
_tufu_act2
	cmpi.w		#$200,($26,A6)
	bne		_second2
_first2
	moveq		#$14,D0		*屠夫结束动作
	jsr		$120e
	rts
_second2
	moveq		#$2,D0		*屠夫结束动作
	jsr		$120e
	rts	
*------------------------取消马云慢动作，震死小兵、变身头像------------------------------------------------
	org		$52d8a		/震死小兵
	jmp		$105170
	org		$105170
	cmpi.b		#$4,($4d9,A5)
	bne		_52d98
	cmpi.w		#$1100,($744,A5)
	ble		_52d98
	cmpi.b		#$1,($7f70,A5)
	beq		_52d98
	move.b		#$2,($50e,A5)		
	beq		_52d9c
_52d98
	jmp		$52d98
_52d9c
	jmp		$52d9c

	org		$52dba		/震死小兵
	jsr		$1051c0
	org		$1051c0
	cmpi.b		#$4,($4d9,A5)
	bne		_90rts
	cmpi.w		#$1100,($744,A5)
	ble		_90rts
	cmpi.b		#$1,($7f70,A5)
	beq		_90rts
	move.b		#$2,($50e,A5)	
_90rts
	rts

	org		$52dde		/取消变身头像
	nop
	nop
	nop

;--------------------------------------6BOSS相关-----------------------------------------------
	;org		$5edc8
	;move.w		#$300,($26,A0)		;设置6BOSS出箱为3阶

	;org		$36B86
	;cmpi.b		#$3,($26,A6)		;设置3阶状态开始派兵
;-----------------6B派兵与清版+1------------------------------------------	
	org		$36b90
	jmp		$105200
	org		$105200
	cmpi.b		#$5,($4d9,A5)
	bne		_no6pb
	cmpi.b		#$2,($786,A5)	
	bne		_no6pb
	;addq.b		#1,$ffffc6
	;cmpi.b		#$2,$ffffc6
	;bge		_no6pb
	jsr		$7bedc
	jmp		$36b96	
_no6pb
	addq.b		#1,($7fe0,A5)		/6BOSS不派兵时清版+1
	jmp		$36b96
	
	org		$38ce0			;慢动作
	nop
	nop
	nop
	
	org		$38CE6			;move.b	#$2,($50e,A5)取消震死小兵
	nop
	nop
	nop
;-----------------------------------6B非幼体加血---------------------------------------------	
	org		$36ade              *只有ID：10走此.D0=190
	nop
	jsr		_6b_jjx
	org		$105300
_6b_jjx
	move.w            #$190,($6c,A6)             
	cmpi.b		#$7,($4d9,A5)
	bne		_noytjx			/非6关底加血
	cmpi.b		#$3,($786,A5)
	bne		_noytjx
	move.w            #$320,($6c,A6)
_noytjx	
	moveq             #0,D0
         move.b            ($7fee,A5),D0
         mulu.w            #$32,D0
	add.w		D0,($6c,A6)
	cmpi.b            #$3,($dd,A6)
	bge               _xie_2_3
	move.w		($6c,A6),($6e,A6)
	rts
_xie_2_3
        add.w          #$64,($6c,A6)
        move.w	     ($6c,A6),($6e,A6)
        rts

	
	
*------------------------------------BOSS派兵---------------------------------------------
	org		$4286a		*1BOSS派兵
	jsr		_1b_pb
	org		$58604		*2B
	jsr		_2b_pb
	org		$4fe40		*3B派兵-----3B派兵是jmp跳转
	jmp		_3b_pb
	org		$4bff4		*4BOSS派兵
	jsr		_4b_pb
	org		$517ee		/马云派兵
	jsr		_5b_pb
	org		$53eda		/铁头龙派兵
	jsr		_5b_pb
	org		$6194a		*大龙派兵
	jsr		_8b_pb
**====================4BOSS登场修改===============4BOSS对话-----------------------------------------	
	ORG		$4bf4e
	jmp		_4BOSScoming
;------------------------隐藏6BOSS多量变身------------------------------------------
	org		$5e094
	jsr		_6b_plus
	
;--------------------$105500-------------------------------------------------	
	org		$105500
_1b_pb
	tst.b		($4d9,A5)
	bne		_bossplus1	
	jsr		$7bedc
	rts
_bossplus1
	addq.b		#1,($7fe0,A5)
	rts	
_2b_pb
	cmpi.b		#$1,($4d9,A5)
	bne		_no_pb
	cmpi.b		#$2,($786,A5)
	bne		_no_pb	
	jsr		$7bedc
	rts	
_3b_pb
	cmpi.b		#$2,($4d9,A5)
	bne		_no_pb
	;cmpi.w		#$2ccc,($744,A5)
	;bls		_no_pb	
	jmp		$7bedc
_4b_pb
	cmpi.b		#$3,($4d9,A5)
	bne		_no_pb
	cmpi.b		#$2,($786,A5)
	bne		_no_pb
	cmpi.w		#$440,($744,A5)
	ble		_no_pb		
	jsr		$7bedc
	rts
_5b_pb
	cmpi.b		#$4,($4d9,A5)
	bne		_no_pb
	cmpi.w		#$1100,($744,A5)
	ble		_no_pb		
	jsr		$7bedc
	rts
_8b_pb
	;cmpi.b		#$7,($4d9,A5)
	;bne		_no_8pb
	cmpi.b		#$3,($786,A5)
	bne		_no_pb
	jsr		$7bedc
_no_pb
	rts

_4BOSScoming
	cmpi.b		#$3,($4d9,A5)
	bne		_4BOSSjc
	cmpi.b		#$2,($786,A5)
	bne		_4BOSSjc
	cmpi.w		#$300,($744,A5)
	ble		_4BOSSjc
	cmpi.w		#$470,($744,A5)
	blt		_4bf80
	jmp		$4bf56	
_4bf80
	rts	
_4BOSSjc
	move.b		#$a,($6,A6)
	clr.b		($4fc,A5)
	rts
	
_6b_plus
	clr.w		($de,A6)
	tst.b		($7f74,A5)
	beq		_no_6_plus
	cmpi.b		#$5,($4d9,A5)
	bne		_no_6_plus
	cmpi.b		#$2,($786,A5)
	bne		_no_6_plus
	tst.w		($26,A6)		*检测是否第2次变身,0000为3阶6BOSS
	beq		_3jie_6boss
	jsr		$483c
	bcs		_6_plus_fail3
	move.b		#$1, ($0,A0)
	move.w		#$10, ($20,A0)
	move.b		($24,A6),($24,A0)
	move.w		($26,A6),($26,A0)
	move.w		($8,A6),($8,A0)
	move.w		($c,A6),($c,A0)
	move.w		($10,A6),($10,A0)
	rts	
_3jie_6boss
	jsr		$483c
	bcs		_6_plus_fail2
	move.b		#$1, ($0,A0)
	move.w		#$10, ($20,A0)
	move.b		($24,A6),($24,A0)
	move.w		($26,A6),($26,A0)
	move.w		($8,A6),($8,A0)
	move.w		($c,A6),($c,A0)
	move.w		($10,A6),($10,A0)
	jsr		$483c
	bcs		_6_plus_fail1
	move.b		#$1, ($0,A0)
	move.w		#$10, ($20,A0)
	move.b		($24,A6),($24,A0)
	move.w		($26,A6),($26,A0)
	move.w		($8,A6),($8,A0)
	move.w		($c,A6),($c,A0)
	move.w		($10,A6),($10,A0)
	clr.l		($4,A0)
_no_6_plus
	rts
_6_plus_fail3
	addq.b		#1,($7fa2,A5)	
_6_plus_fail2
	addq.b		#1,($7fa2,A5)	
_6_plus_fail1	
	addq.b		#1,($7fa2,A5)
	rts
            
*---------------------------------------7BOSS守4关调节-----------------------------------------
	;org		$451e8
	;cmpi.b		#$3,($4d9,A5)		;调节到第4关互相接收飞镖
	
;--------------------------178死亡慢动作-----------------------------
		org		$69668
		nop
		nop
		nop
				
;------------------------178变身坐标调节------------------
		org		$69748
		subq.b		#1,($7fe0,A5)	;178清版-1
		jmp		$69760


;----------------------178生双大龙===================================
		org	$6991c
		jsr	$107700
		nop
		nop
		org	$107700
		move.w	($10,A6),($10,A0)
		move.w	A0,(-$70bc,A5)
		rts
		cmpi.b	#$7,($4d9,A5)
		bne	_syc
		cmpi.b	#$3,($786,A5)
		bne	_syc
		jsr	$483c.l
		bcs	_syc
		move.b	#$1, ($0,A0)
		move.w	#$150, ($20,A0)
		move.w	#$0, ($26,A0)
		move.b	($24,A6),($24,A0)
		move.b	($22,A6),($22,A0)
		move.w	($8,A6),($8,A0)
		sub.w	#$30,($8,A0)
		move.w	($c,A6),($c,A0)
		move.w	($10,A6),($10,A0)
		move.w	A0,(-$70bc,A5)	
_syc
		rts
*-----------------------------1V3---8关底清版(走1boss分支代码，8关底存在1boss才会生效)------------------------------------------
        org     $659e
        jmp     _1v3v3v3
        
        org	$4288a		*大个子8关底免疫清版
        jsr	_1bossmy
        
        
        org     $101c00
_1v3v3v3
        move.b  #$2,($4ef,A5)       ;强制1V3模式
        move.b  D0,($7fee,A5)          ;将实际玩家数量放入ffffee
        rts
_1bossmy
	jsr	$326f8
	tst.b	($50e,A5)
	beq	_1myrts
	cmpi.b	#$3,($786,A5)
	bne	_1myrts
	cmpi.b	#$7,($4d9,A5)
	bne	_1myrts
	movem.l 	D0/A0-A6,-(A7)
	lea	($48f4,A5),A0
	moveq	#0,D0
	move.w	#$17,D0
_isobj
	tst.b	($0,A0)
	beq	_next_e0
	bsr	_checkisboss
_next_e0
	lea	($e0,A0),A0
	dbra	D0,_isobj	
	movem.l	(A7)+,D0/A0-A6
_1myrts
	rts
_checkisboss
	cmpi.w	#$10,($20,A0)
	beq	_clr8_10
	cmpi.w	#$90,($20,A0)
	beq	_clr8_boss
	cmpi.w	#$A0,($20,A0)
	beq	_clr8_boss
	cmpi.w	#$F4,($20,A0)
	beq	_clr8_boss
	cmpi.w	#$64,($20,A0)
	beq	_clr8_boss
	cmpi.w	#$11C,($20,A0)
	beq	_clr8_boss
	cmpi.w	#$7C,($20,A0)
	beq	_clr8_boss
	rts	
_clr8_10	
	clr.w	($26,A0)
_clr8_boss
	movea.l	A0,A6
	jsr	$326f8
	rts
	
	org	$fde2
	cmpi.b	#$2,($7fee,A5)
				
*----------------------------3BOSS随机派兵相关---------------------------------------		
	org		$ff1e
	jmp		$101d00
	org		$101d00
	movem.l		D0,-(A7)			;把D0移到空位置
	clr.l		D0
	jsr		$119c
         andi.w		#$7,D0			;随机数在D0里，求余,限制范围( )
	mulu.w		#$4,D0                                 ;乘个4，变为4的倍数
	move.w		_3b_xiaobing_data(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addi.b		#$2,D0
	move.w		_3b_xiaobing_data(PC,D0),($26,A0)	;取下表中紧随的出场方式		

;--------------------------------3B随机补给程序------------------------------------        
_sjbuji1
	clr.l		D0
	jsr		$119c                   ;进入随机程序
	andi.w		#$f,D0			;随机数在D0里，求余,限制范围( )
	move.b		_3b_buji_data(PC,D0),($96,A0)	   ;取下表中随机一个补给
	movem.l		(A7)+,D0			;把原来D0中的数据移回去
	clr.b		($5b,A0)
	jmp		$ff24
;-------------------------------3B静态数据表----------------------------------------
_3b_xiaobing_data
        dc.w    $0048,$0200,$0018,$0000,$000c,$0000,$016c,$0000
        dc.w    $000c,$0000,$016c,$0000,$0048,$0200,$0018,$0000
_3b_buji_data
        dc.w    $0031,$2b32,$0325,$0005,$062b,$200c,$382b,$2b1a
                   

;---------------------------随机出兵---------------------------------------
	org		$fe5a
	jsr		$107000
	org		$107000
	;cmpi.b            #$ee,($f,A2)
	;bne               _no_c_boss
	;cmpi.b		#$1,($7f70,A5)
	;beq		_c_boss
	;tst.b		($7fee,A5)
	;bne		_c_boss
	;move.w		#$138,($20,A0)
_c_boss
	;clr.b		($96,A0)
	;rts	
_no_c_boss
	movem.l  		D0,-(A7)		;入栈
	moveq		#0,D0		
	move.b		($3,A2),d0		;检测是否箱子或破门等
	andi.b		#$f,D0			;取个位
	cmpi.b		#$1,D0			;是否特效，包装敌兵等
	beq 		_nosuiji
	cmpi.b		#$3,D0			;是否道具，箱子等
	beq 		_xzjc
	cmpi.b              #$3,($786,A5)
	beq                 _78gd_no
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
	cmpi.w  		#$18,($20,A0)       ;狮子
	beq     		_sj1_
	cmpi.w  		#$c,($20,A0)       ;链球
	beq     		_sj1_	
_nosuiji
	move.b		($f,A2),($96,A0)
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts
_78gd_no
         cmpi.w                 #$7c,($20,A0)
         bne                    _nosuiji
         tst.b                  ($7f70,A5)
         bne                    _nosuiji
         move.w                 #$16c,($20,A0)
         clr.w                  ($26,A0)
         bra                    _nosuiji
_xzjc
	cmpi.w  		#$14,($4,A2)       ;是否箱子
	bne     		_nosuiji
	bra		_xzsj			
_sj1_	
	cmpi.b		#$7,($4d9,A5)		;是否8关
	bne		_jc7
	cmpi.b		#$1,($786,A5)		;是否2场景
	beq		_no_lianqiu
	cmpi.b		#$2,($786,A5)		;是否3场景
	beq		_no_dalong	
	cmpi.b		#$3,($786,A5)		;是否关底
	beq		_8gdsj
	bra		_no_gdsj
_jc7	
	cmpi.b		#$6,($4d9,A5)		;7关
	bne		_jc6
	cmpi.b		#$3,($786,A5)		;是否关底
	beq		_gdsj
	cmpi.b		#$1,($786,A5)		;是否电梯
	beq		_dianticl	
	bra		_no_gdsj	
_jc6
	cmpi.b		#$5,($4d9,A5)		;6关
	bne		_jc5
	tst.b		($7f74,A5)
	beq		_jc6_go
	cmpi.b		#$1,($786,A5)
	beq		_nosuiji	
_jc6_go
	cmpi.b		#$2,($786,A5)		;是否关底
	beq		_gdsj
	bra		_no_gdsj	
_jc5
	cmpi.b		#$4,($4d9,A5)		;5关
	bne		_jc4
	cmpi.w		#$d80,($744,A5)		;是否关底
	bge		_gdsj
	bra		_no_gdsj
_jc4
	cmpi.b		#$3,($4d9,A5)		;4关
	bne		_jc3
	cmpi.b		#$2,($786,A5)		;是否第3场景
	bne		_no_gdsj			
	cmpi.w		#$120,($744,A5)		;是否关底
	bge		_gdsj
	bra		_no_gdsj
_jc3
	cmpi.b		#$2,($4d9,A5)		;3关
	bne		_jc2			;
	cmpi.w		#$910,($744,A5)		;检测3关卷轴
	bge		_nosuiji			/3关后半部分不随机
	;tst.b		($7f79,A5)
	;bne		_nosuiji
	bra		_no_gdsj		
_jc2
	cmpi.b		#$1,($4d9,A5)		;2关
	bne		_jc1			;
	cmpi.b		#$2,($786,A5)		;是否第3场景
	beq		_gdsj
	tst.b		($7f73,A5)
	beq		_no_gdsj
	cmpi.w		#$b00,($744,A5)
	bge		_no_gdsj
	bra		_geigexie	
_jc1
	cmpi.b		#$2,($786,A5)		;是否第3场景
	bne		_no_gdsj			;
	bra		_gdsj			*1关底出精英怪		
*----------------------------非关底随机----------------------------------------------
_dianticl	
	tst.b		($7f77,A5)
	beq		_no_dalong
	move.w		($7f5c,A5),($20,A0)
	move.w		($7f5e,A5),($26,A0)
	moveq		#0,D0	
	addq.w		#1,($7f66,A5)
	move.w		($7f66,A5),D0
	andi.w		#$7,D0
	cmpi.w            #$48,($20,A0)
	beq               _yc_48
	cmpi.w            #$11c,($20,A0)
	bne               _yc_no11c
	addq.b		#1,($7fe0,A5)
	move.b		_sect11c(PC,D0),($96,A0)
	bra               _geigexie	
_yc_48
	move.b		_sect48(PC,D0),($96,A0)
	bra               _geigexie	
_yc_no11c       
	move.b		_sectno11c(PC,D0),($96,A0)
_geigexie	
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts
_sect11c
        dc.l            $10000026,$1010000e
_sect48
        dc.l            $10000026,$10000010
_sectno11c
        dc.l            $10000037,$10000000		
_no_gdsj
	moveq		#0,D0	
	jsr		$119c                   	;进入随机程序	
         andi.w		#$1f,D0
         add.w		D0,D0
         add.w		D0,D0                      ;乘个4，变为4的倍数
	move.w		_nogdsjdata(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addq.b		#$2,D0
	move.w		_nogdsjdata(PC,D0),($26,A0)	;取下表中紧随的出场方式
	cmpi.w		#$7c,($20,A0)
	bne		_no_gdbj	
	cmpi.b		#$2,($4d9,A5)           *3关不能3BOSS
	beq		_no_gdsj
	bra		_no_gdbj	                  
_nogdsjdata
        dc.w    $0090,$0000,$016c,$0000,$0048,$0200,$0018,$0000
        dc.w    $0148,$0000,$00a0,$0000,$011c,$0000,$00f4,$0000
        dc.w    $00f4,$0000,$00f4,$0000,$0090,$0000,$000c,$0000
        dc.w    $0048,$0200,$0060,$0000,$011c,$0000,$007c,$0000
        dc.w    $000c,$0000,$011c,$0000,$0064,$0000,$0048,$0200
        dc.w    $016c,$0000,$0018,$0000,$000c,$0000,$0098,$0000
        dc.w    $0150,$0000,$0064,$0000,$0090,$0000,$00a0,$0000
        dc.w    $0074,$0200,$016c,$0000,$00a0,$0000,$0018,$0000       
_no_dalong
	clr.l		D0	
	jsr		$119c                   	;进入随机程序	
         divu.w		#$18,D0			;随机数在D0里，求余,限制范围( )
         swap                   D0
         add.w		D0,D0
         add.w		D0,D0                      ;乘个4，变为4的倍数
	move.w		_no_dldata(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addq.b		#$2,D0
	move.w		_no_dldata(PC,D0),($26,A0)	;取下表中紧随的出场方式
	bra		_no_gdbj	                  
_no_dldata
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $016c,$0000,$00a0,$0000,$011c,$0000,$00f4,$0000
        dc.w    $0048,$0200,$016c,$0000,$0090,$0000,$00a0,$0000
        dc.w    $011c,$0000,$00f4,$0000,$0090,$0000,$00a0,$0000
        dc.w    $0048,$0200,$0064,$0000,$000c,$0000,$0018,$0000
        dc.w    $0090,$0000,$0064,$0000,$00f4,$0000,$000c,$0000
        
_no_lianqiu
	clr.l		D0	
	jsr		$119c                   	;进入随机程序	
         divu.w		#$14,D0			;随机数在D0里，求余,限制范围( )
         swap           D0
         add.w		D0,D0
         add.w		D0,D0                      ;乘个4，变为4的倍数
	move.w		_no_lianqiu1data(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addq.b		#$2,D0
	move.w		_no_lianqiu1data(PC,D0),($26,A0)	;取下表中紧随的出场方式
	bra		_no_gdbj	                  
_no_lianqiu1data
        dc.w    $0048,$0200,$016c,$0000,$0048,$0200,$0018,$0000
        dc.w    $016c,$0000,$00a0,$0000,$011c,$0000,$00f4,$0000
        dc.w    $016c,$0000,$0064,$0000,$0090,$0000,$00a0,$0000
        dc.w    $011c,$0000,$00f4,$0000,$0090,$0000,$00a0,$0000  
        dc.w    $0048,$0200,$016c,$0000,$0048,$0200,$0018,$0000     
_no_gdbj
	clr.l   		D0
	jsr		$119c                   ;进入随机程序
	andi.w		#$1f,D0		;随机数在D0里，求余,限制范围( )
	move.b		_no_gdbj1data(PC,D0),($96,A0)	        ;取下表中随机一个补给
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去
	clr.b  		($5b,A0)
         	rts
;-------------------------------非关底补给静态数据表----------------------------------------
_no_gdbj1data
        dc.w    $0300,$3731,$2700,$1337,$2738,$0037,$2501,$3800
        dc.w    $0301,$0e00,$0127,$1327,$0038,$3837,$2538,$010b
        ;dc.w    $1531,$3216,$1a1b,$0022,$2300,$0027,$292f,$0036
        ;dc.w    $3133,$3436,$0005,$1f00,$0025,$0026,$0e00,$0036
_8gdsj
	moveq		#$0,D0
	jsr		$119c
	andi.w		#$3,D0
         add.w		D0,D0
         add.w		D0,D0                      ;乘个4，变为4的倍数
	move.w		_8gdsj1data(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addq.b  		#$2,D0
	move.w		_8gdsj1data(PC,D0),($26,A0)	;取下表中紧随的出场方式
	clr.b		($96,A0)
	addq.w		#1,($7f66,A5)
	moveq		#$0,D0
	move.w		($7f66,A5),D0
	andi.w		#$7,D0
	bne		_cccz11				
	move.b		#$e,($96,A0)		/每8个关底小兵给个48%血
_cccz11
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts					/取消关底补给	
_8gdsj1data
	dc.w	$0018,$0000,$0048,$0200,$000c,$0000,$016c,$0000
		
;----------------------------关底随机队列-----------------------------------------
_gdsj
	cmpi.b		#$cc,($f,A2)
	beq		_fub_random
_zheshiceshi
	clr.l		D0	
	jsr		$119c                   	;进入随机程序
	divu.w		#$24,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
         add.w		D0,D0
         add.w		D0,D0                      ;乘个4，变为4的倍数
	move.w		_gdsj1data(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addq.b  		#$2,D0
	move.w		_gdsj1data(PC,D0),($26,A0)	;取下表中紧随的出场方式
_gdbuji111
	addq.w		#1,($7f66,A5)
	moveq		#$0,D0
	move.w		($7f66,A5),D0
	andi.w		#$3,D0				
	move.b		_gdbbb(PC,D0),($96,A0)		/每4个关底小兵给个32%血
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts					/取消关底补给
;-------------------------------静态数据表----------------------------------------
_gdbbb
	dc.l	$00103700,$00001037,$00001000,$00103700
                  
_gdsj1data
        dc.w    $0008,$0402,$0008,$0402,$0008,$0202,$0008,$0002
        dc.w    $000c,$0000,$000c,$0000,$000c,$0000,$000c,$0000
        dc.w    $0018,$0000,$0018,$0000,$0018,$0000,$0018,$0000
        dc.w    $0028,$0406,$0028,$0402,$0028,$0206,$0028,$0004
        dc.w    $0038,$0208,$0038,$020c,$0038,$0008,$0038,$000c
        dc.w    $0048,$0200,$0048,$0200,$0048,$0200,$0048,$0200
        dc.w    $0050,$0206,$0050,$0006,$0050,$0206,$0050,$0006
        dc.w    $016c,$0000,$016c,$0000,$016c,$0000,$016c,$0000  
        dc.w    $0034,$040c,$0034,$040c,$0034,$0200,$0034,$000c

;---------------------------随机箱子及宝物----------------------------
_xzsj
	moveq		#0,D0
	jsr		$119c                   ;进入随机程序
	andi.w		#$f,D0		    	 ;余数在高12位，交叉下
         add.w		D0,D0                      ;乘个2	
	move.w		_xzdata(PC,D0),($26,A0)	        ;取下表中随机一个补给
         bra     		_xzsjbj
_xzdata
        dc.w    $0002,$0006,$0008,$000a,$0000,$000a,$000c,$0004
        dc.w    $0002,$0000,$0004,$000a,$000c,$000a,$0004,$0002        
_xzsjbj
	jsr		$119c                   ;进入随机程序
	andi.w		#$1f,D0		    	 ;余数在高12位，交叉下
	move.b		_xzbjdata(PC,D0),($96,A0)	        ;取下表中随机一个补给
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去
	clr.b  		($5b,A0)	
         	rts
_xzbjdata
        dc.w    $0300,$0f0e,$000c,$0121,$0c06,$0505,$000a,$0505
        dc.w    $0003,$2010,$000c,$0121,$1606,$0505,$1800,$0505
_fub_random
	moveq		#0,D0
	jsr		$119c
	move.b		#$26,($96,A0)
	tst.b		($4d9,A5)
	beq		_random_1b	
	cmpi.b		#$1,($4d9,A5)
	beq		_random_2b
	cmpi.b		#$3,($4d9,A5)
	beq		_random_4b
	cmpi.b		#$5,($4d9,A5)
	beq		_random_6b
	bra		_zheshiceshi
_random_1b
	andi.w		#$7,D0
	add.w		D0,D0
	move.w		_1brandom(PC,D0),($20,A0)
	clr.w		($26,A0)
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts					/取消关底补给
_1brandom
	dc.w	$00f4,$0178,$011c,$0064,$00a0,$0090,$00f4,$0090
_random_2b
	andi.w		#$7,D0
	add.w		D0,D0
	move.w		_2brandom(PC,D0),($20,A0)
	clr.w		($26,A0)
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts					/取消关底补给
_2brandom
	dc.w	$0178,$00a0,$0090,$0150,$0064,$011c,$0090,$0150
_random_4b
	andi.w		#$7,D0
	add.w		D0,D0
	move.w		_4brandom(PC,D0),($20,A0)
	clr.w		($26,A0)
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts					/取消关底补给
_4brandom
	dc.w	$00f4,$00a0,$0090,$0150,$00f4,$00a0,$0090,$011c
_random_6b
	andi.w		#$7,D0
	add.w		D0,D0
	move.w		_6brandom(PC,D0),($20,A0)
	clr.w		($26,A0)
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去	
	rts		/取消关底补给
_6brandom
	dc.w	$00f4,$0090,$11c,$0064,$00a0,$0090,$11c,$0064	
*------------------------屠夫不掉刀、马云不掉枪、1BOSS晕、4BOSS不晕--------------------------------

	ORG		$58700		/*---------屠夫不掉dao
	jmp		$58750
	
	org		$58758		*修复屠夫捡刀BUG
	dc.l		$600000ce

	;org		$5bfa0		/马云不掉
	;org		$10a1e		/敌人被AB打中后不进入无敌状态
	;move.b		#$1,($0,A3)

	org		$2b20a
	;cmpi.b		#$C,($3,A6)		*1BOSS,D为大个子
	;beq		$2b54e
	;cmpi.b		#$4,($dd,A6)
	jmp		_noyunjue
	nop
	nop
	
	org		$10a58			*11C大龙巡逻程序修改
	jsr		_11C150
	
	org		$186400
_noyunjue
	cmpi.b		#$4,($dd,A6)
	beq		_2b54e
	cmpi.b		#$c,($3,A6)
	beq		_2b54e
	cmpi.w		#$120,($20,A6)
	bne		_2b214
	cmpi.b		#$5,($4d9,A5)
	bne		_2b214
	cmpi.b		#$2,($786,A5)
	bne		_2b214
	tst.b		($7f74,A5)
	beq		_2b214
_2b54e
	jmp		$2b54e		;不晕	
_2b214
	jmp		$2b214

_11C150
	jsr	$2b904
	tst.b	($7f70,A5)	*检测是否A模式
	beq	_15011crts
	cmpi.w	#$11c,($20,A3)
	beq	_a376
	cmpi.w	#$150,($20,A3)
	beq	_a376
	rts
_a376
	cmpi.b	#$3,($786,A5)
	bne	_15011crts
	move.w	A2,($76,A3)
_15011crts	
	rts	
;------------------------BOSS加血程序-----------------------------------------    
     org     	$31e44
     jsr		_jx_boss_
     move.w	($6c,A6),($6e,A6)
*-------------------------精英怪加血---------------------------------------------
	org		$31446
	jsr		_jx_xb
	move.w		($6c,A6),($6e,A6)
	
*------------------------4阶屠夫-------------------------------------------
        org             $59b1e
        jsr             _tufu_infinite1
        
        org             $59ba0
        jsr             _tufu_infinite2
*------------------------4阶狮子-------------------------------------------
        org             $3afd2
        jmp             _sz_4l
*------------------------敌兵等级显示--------------------------------------
        org             $149b0
        jmp             _dbdj_show
        nop
        
;===============================================================================    
     org		$106400
_jx_boss_
	move.w		D1,($6a,A6)
	cmpi.b		#$3,($786,A5)                    ;检测是否7关第4场景
	bne		_begin_boss                       ;否，跳到非关底玩家数量检测
	cmpi.b		#$7,($4d9,A5)
	beq		_8guan
	moveq		#0,D0
	move.b		($7fee,A5),D0
	move.w		#$320,($6c,A6)
	mulu.w		#$64,D0
	add.w		D0,($6c,A6)
	tst.b		($7f70,A5)
	beq		_no64_plus
	add.w		#$64,($6c,A6)
	cmpi.b		#$2,($7f70,A5)
	beq		_no64_plus
	add.w		#$64,($6c,A6)
_no64_plus		
	rts
_begin_boss
	tst.b       ($7f70,A5)
	beq         _clr_dd
	cmpi.w	#$48,($20,A6)
	beq	_clr_dd
	cmpi.w	#$7c,($20,A6)
	beq	_clr_dd
	cmpi.w	#$120,($20,A6)
	beq	_clr_dd
	moveq       #0,D0
	jsr         $119c
	andi.w      #$f,D0
         move.b      _plus_data(PC,D0),($dd,A6)
         bra		_boss_plus_abc
_plus_data
         dc.l	$00000400,$00040000,$04000400,$00040400
_clr_dd
         clr.b	($dd,A6)
_boss_plus_abc
	tst.b  	($4d9,A5)                   ;检测是否1关
	bne     	_2guan                       ;否，跳到2关检测
	cmpi.b  	#$2,($786,A5)                    ;检测是否1关第3场景
	bne     	_nogd_player                       ;否，跳到非关底玩家数量检测
	bra	_320_10h
_2guan
	cmpi.b  #$1,($4d9,A5)                   ;检测是否2关
	bne     _3guan                       ;否，跳到3关检测
	cmpi.b  #$2,($786,A5)                    ;检测是否2关第3场景
	bne     _nogd_player                       ;否，跳到非关底玩家数量检测
	bra	    _320_10h
_3guan     
     cmpi.b  #$2,($4d9,A5)                   ;检测是否3关
     bne     _4guan                       ;否，跳到4关检测
     cmpi.w	#$7c,($20,A6)
     beq		_320_10h
     ;cmpi.w  #$2c00,($744,A5)                    ;检测卷轴
     bra     _nogd_player                       ;否，跳到非关底玩家数量检测
     ;bra	    _320_10h
_4guan
     cmpi.b  #$3,($4d9,A5)                   ;检测是否4关
     bne     _5guan                       ;否，跳到5关检测
     cmpi.b  #$2,($786,A5)                    ;检测是否4关第3场景
     bne     _nogd_player                       ;否，跳到非关底玩家数量检测
     cmpi.w  #$400,($744,A5)                    ;检测卷轴
     ble     _nogd_player                       ;否，跳到非关底玩家数量检测     
     bra	    _320_10h   
_5guan
     cmpi.b  #$4,($4d9,A5)                   ;检测是否5关
     bne     _6guan                       ;否，跳到6关检测
     cmpi.w  #$1100,($744,A5)                    ;检测卷轴
     ble     _nogd_player                       ;否，跳到非关底玩家数量检测     
     bra	    _320_10h
_6guan
     cmpi.b  #$5,($4d9,A5)                   ;检测是否6关
     bne     _nogd_player                       ;否，跳到7关检测
     cmpi.w	#$48,($20,A6)		*6隐藏的1BOSS+血
     beq		_320_10h
     cmpi.w	#$f00,($744,A5)
     ble		_nogd_player 
_320_10h
     move.w	#$320,($6c,A6)
     moveq	#0,D0
     move.b	($7fee,A5),D0
     mulu.w	#$64,D0
     add.w	D0,($6c,A6)
     tst.b	($7f70,A5)
     beq		_gdboss_rts
     add.w	#$64,($6c,A6)
     cmpi.b	#$2,($7f70,A5)
     beq		_boss_b
     add.w	#$64,($6c,A6)
_boss_c
     cmpi.b       #$4,($dd,A6)
     bne		_gdboss_rts
     add.w	#$c8,($6c,A6)
     rts	
_boss_b
     cmpi.b       #$4,($dd,A6)
     bne		_gdboss_rts
     add.w	#$64,($6c,A6)
_gdboss_rts
     rts
_8guan
        moveq           #0,D0
	cmpi.w		#$178,($20,A6)
	beq		_algor_plus
	cmpi.w		#$150,($20,A6)
	beq		_algor_plus
	move.w		#$640,($6c,A6)
	rts
_algor_plus		
        move.b          ($7fee,A5),D0
        move.w          #$3e8,($6c,A6)	
        mulu.w          #$c8,D0		*8关底每多一人+2行
        add.w           D0,($6c,A6)
	movem.l	D0-D2,-(A7)
	moveq	#0,D0
	moveq	#0,D1
	moveq	#0,D2
	tst.b	($3274,A5)
	beq	_if2p
	addq.b	#1,D0
	move.w	($32e0,A5),D1
	add.w	D1,D2
_if2p
	tst.b	($33f4,A5)
	beq	_if3p
	addq.b	#1,D0
	move.w	($3460,A5),D1
	add.w	D1,D2
_if3p
	tst.b	($3574,A5)
	beq	_all_c
	addq.b	#1,D0
	move.w	($35e0,A5),D1
	add.w	D1,D2
_all_c
	move.w	D0,D1
	beq	_nomore7
	mulu.w	#$1f4,D0
	cmp.w	D0,D2
	bls	_nomore7
	sub.w	D0,D2
	divu.w	D1,D2
	;add.w	D2,D2
	add.w	D2,($6c,A6)
_nomore7	
	movem.l	(A7)+,D0-D2
	rts
_nogd_player
        cmpi.w		#$11c,($20,A6)                   ;是否幻影
        beq		_nogd_player_ms
        cmpi.w		#$64,($20,A6)                   ;是否4幻影
        beq		_nogd_player_ms
        cmpi.w		#$7c,($20,A6)                   ;是否3B
        beq		_nogd_player_ms			/3BOSS非关底直接6行血
        cmpi.w		#$120,($20,A6)                   ;是否6B幼体
        beq		_nogd_player_ms
        cmpi.w		#$10,($20,A6)                   ;是否6B，6BOSS非幼体会走两次加血路线
        beq		_nogd_player_ms    
        addq.b		#1,($7fe0,A5)		/BOSS清版+1
_nogd_player_ms
        move.w          #$12c,($6c,A6)
        moveq           #0,D0
        move.b          ($7fee,A5),D0
        tst.b	($7f70,A5)
        beq	_nogd_player_a
        cmpi.b	#$2,($7f70,A5)
        beq	_nogd_player_b
_nogd_player_c
        mulu.w          #$64,D0
        add.w           D0,($6c,A6)
        tst.b		($dd,A6)
        beq		_noc_rts
        addi.w          #$64,($6c,A6)
_noc_rts         
        rts
_nogd_player_a
        mulu.w          #$32,D0
        add.w           D0,($6c,A6)     
        rts
_nogd_player_b
        mulu.w          #$64,D0
        add.w           D0,($6c,A6)     
        rts
*-------------------------小兵加血---------------------------------------------
_jx_xb
	move.w		  D1,($6a,A6)
	cmpi.w		#$16c,($20,A6)
	beq		_jyguai
	cmpi.w		#$c,($20,A6)
	beq		_jyguai
	cmpi.w		#$18,($20,A6)
	beq		_jyguai
	cmpi.w		#$48,($20,A6)
	beq		_jyguai
	cmpi.w		#$148,($20,A6)	/翼龙
	beq		_148jx	
	cmpi.w		#$60,($20,A6)	/霸王龙
	beq		_jyguai_fa
	cmpi.w		#$98,($20,A6)	/三角龙
	beq		_jyguai_c8
	cmpi.w		#$74,($20,A6)	/迅猛龙
	beq		_jyguai_c8	
	move.w		D0,($6c,A6)
	rts
_jyguai	
	cmpi.b		#$3,($786,A5)
	bne		_jy_no84
	cmpi.b		#$7,($4d9,A5)
	bne		_jy_no84
	move.w		#$5dc,($6c,A6)
	rts
_jy_no84
	move.w		#$12c,($6c,A6)
	cmpi.w		#$18,($20,A6)
	bne		_jyg_rts
         tst.b		($7fee,A5)
         bne		_jyg_rts
        	move.w		#$fa,($6c,A6)
_jyg_rts
         rts 
_jyguai_fa
        	move.w		#$fa,($6c,A6)
        	rts
_jyguai_c8
        	move.w		#$c8,($6c,A6)
        	rts
_148jx
	move.w		#$32,($6a,A6)
	move.w            ($6a,A6),($6c,A6)
         rts


*------------------------------------------------------------------------------
_guiji7
        cmpi.b #$6,($4d9,A5)
        bne    _7xf_
        cmpi.b #$3,($786,A5)
        bne    _7xf_    
        jsr    $1862
        jmp    $5cca6
_7xf_
        jmp    $5cc9a
    
_guiji4
        cmpi.b 	#$3,($4d9,A5)
        bne    	_4Bxf_
        cmpi.b 	#$2,($786,A5)
        bne    	_4Bxf_
        cmpi.w	#$440,($744,A5)
        ble	_4Bxf_   
        jsr    $1862
        jmp    $4c3ba
_4Bxf_
        jmp    $4c3ae  

_feibiao47
	cmpi.b	#$6,($4d9,A5)
	bne	_451f0
	cmpi.b	#$3,($786,A5)
	bne	_451f0
	jmp	$451fa
_451f0
	jmp	$451f0

_fbbug7
	cmpi.b  		#$6, ($4d9,A5)
	bne     		_clr
	cmpi.b  		#$3, ($786,A5)
	bne    		_clr
	jmp     		_no_clr
_clr
	clr.w   		($c6,A6)
_no_clr
	movea.w 		($c6,A6),A0
	clr.w   		($6e,A6)
	jmp     		$81a9a.l
	
_tufu_infinite1
        move.b          #$1,($ab,A6)
        cmpi.b          #$5,($4d9,A5)
        beq             _tufu6
        cmpi.b          #$1,($4d9,A5)
        beq             _tufu2
        cmpi.b          #$7,($4d9,A5)
        beq             _tufu8
_tufuno
        cmpi.b          #$4,($dd,A6)
        bne             _tfirts
        clr.b           ($ab,A6)
_tfirts
        rts
_tufu2
        cmpi.b          #$2,($786,A5)
        beq             _tufuno
        rts
_tufu6
        tst.b          ($786,A5)
        beq             _tufuno
        rts
_tufu8
        tst.b          ($786,A5)
        beq             _tufuno
        cmpi.b          #$1,($786,A5)
        beq             _tfirts
        cmpi.w          #$700,($744,A5)
        bge             _tufuno
        rts   
_tufu_infinite2
        move.b          (A0,D0.w),($bf,A6)
        cmpi.b          #$5,($4d9,A5)
        beq             _tufu6_
        cmpi.b          #$1,($4d9,A5)
        beq             _tufu2_
        cmpi.b          #$7,($4d9,A5)
        beq             _tufu8_
_tufuno_
        cmpi.b          #$4,($dd,A6)
        bne             _tfirts
        move.b           #$2,($bf,A6)
        rts
_tufu2_
        cmpi.b          #$2,($786,A5)
        beq             _tufuno_
        rts
_tufu6_
        tst.b          ($786,A5)
        beq             _tufuno_
        rts
_tufu8_
        tst.b          ($786,A5)
        beq             _tufuno_
        cmpi.b          #$1,($786,A5)
        beq             _tfirts
        cmpi.w          #$700,($744,A5)
        bge             _tufuno_
        rts     
_sz_4l
        cmpi.b          #$4,($dd,A6)
        bne             _random_eat
        jmp             $3afe0
_random_eat
        jsr             $119c
        jmp             $3afd8
_dbdj_show
        tst.b           ($7f70,A5)
        beq             _no_djshow
        movem.l         D0-D4/A0-A3,-(A7)	
        lea             ($48f4,A5),A0
        moveq           #$0,D4
        move.w          #$17,D4
_nextmemory
        tst.b           ($0,A0)
        beq             _nmemory
*----------------------------------------------------------------------
 *D0=X坐标 D1=Y坐标 D2=砖块号 D3=色号
_ht
	cmpi.w	#$0,($6c,A0)
	ble	_nmemory    //血值，小于等于0退出
	cmpi.b       #$4,($dd,A0)
	bne         _nmemory
	move.w	($8,A0),D0    //X
	move.w      ($744,A5),D1
	cmp.w      D0,D1
	bge         _nmemory
	sub.w       #$180,D0
	cmp.w      D0,D1
	ble         _nmemory
	move.w	($8,A0),D0    //X
	sub.w	($69b6,A5),D0
	subq.w	#8,D0
	move.w	($0c,A0),D1
	add.w	($10,A0),D1    //Y
	sub.w	($69b8,A5),D1
	not.b	D1
	addq.w	#1,D1
	;subq.w	#8,D1     //Y坐标-8，字符位置在脚底
	;move.w   #$4e25,D2
	move.w   #$4e09,D2
	moveq	#$5,D3    //色号，可以改变颜色
	movem.w	D0-D3,(A4)   //写入显存
	addq.l	#8,A4      //+8=下一个字符的显存位置
	addq.w	#$8,D0     //字符间距为8，因为字符的大小就是8X8像素
	;move.w	($dc,A0),D2         *敌兵等级	
	;add.w    #$4e00,D2
	move.w	#$4e04,D2
	movem.w	D0-D3,(A4)   //写入显
	addq.l	#8,A4      //+8=下一个字符的显存位置
_nmemory        
        lea             ($e0,A0),A0
        dbra            D4,_nextmemory
        movem.l         (A7)+,D0-D4/A0-A3
*循环结束后，接原版数据。补上并跳回
_no_djshow
	tst.b	($4aa,A5)
	beq	_14a52
	jmp	$149B8
_14a52
	jmp	$14A52	   //跳回

*-------------------4BOSS与幻影修复-----------------------------------
        org             $5cca0		/幻影轨迹修复
        jmp             _guiji7
        org             $4c3b4		/4BOSS轨迹修复
        jmp             _guiji4
        org             $81a92		//幻影死亡飞镖BUG修复
        jmp             _fbbug7
        org             $451e8		;7BOSS与4BOSS飞镖相关
        jmp             _feibiao47
;-------------------------------------BOSS清版相关------------------------
        ;org 	$7b3c4                  ;监视小兵数量内存的指令
        ;jsr	$189000
       ; org	$189000
       ; moveq	#$0,D0
       ; move.b	($4f3,A5),D0
       ; add.b	($7fe0,A5),D0
	;cmpi.b	#$1,D0
	;bge	_rts
	;cmpi.b	#$7,($4d9,A5)
	;bne	_nott
	;cmpi.b	#$2,($786,A5)
	;bne	_nott
	;cmpi.w	#$cb0,($744,A5)
	;bcs	_nott
_ttjs
	;movem.l	D0-D3/A0-A3,-(A7)	
	;lea	$90a3a4,A1		/90a6ec，6表示左右位置，ec表示上下位置
	;lea	$189200,A0
	;jsr	$c0a
	;movem.l	(A7)+,D0-D3/A0-A3
	;rts	
	
_nott	
	;movem.l	D0-D3/A0-A3,-(A7)	
	;lea	$90a6ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
	;lea	$189100,A0
	;jsr	$c0a
	;movem.l	(A7)+,D0-D3/A0-A3
_rts
	;rts
    


	
*-------------------暴击调整、七八关底清除锁暴击-------------------------------------
	org	$1173c
	moveq	#0,D0
	jmp	_bj_check
	
	org	$619ae
	jsr	_clr123pbj
	
	org	$5c906
	jsr	_clr123pbj
	
	
	
	
	org	$180f00
_bj_check
	cmpi.b	#$1,($c6,A3)	*是否锁60
	bne	_randombj
	tst.b	($2,A3)
	bne	_clock_2p
	move.b	($7f49,A5),($11e,A3)	*两个位置都放
	move.b	($11e,A3),($11f,A3)	*两个位置都放
	rts
_clock_2p
	cmpi.b	#$1,($2,A3)
	bne	_clock_3p
	move.b	($7f4b,A5),($11e,A3)	*两个位置都放
	move.b	($11e,A3),($11f,A3)	*两个位置都放
	rts
_clock_3p
	move.b	($7f4d,A5),($11e,A3)	*两个位置都放
	move.b	($11e,A3),($11f,A3)	*两个位置都放
	rts	
_randombj
	move.b	($11e,A3),D0
	move.b	($11f,A3),D1
	cmp.b	D0,D1
	beq	_go_baoji	
	jmp	$77777
_go_baoji	
	moveq	#0,D0
	jsr	$119c
	andi.w	#$3f,D0
	move.l	A6,-(A7)
	movea.l	#$2c9b6,A6
	move.b	(A6,D0.w),($11e,A3)
	move.b	($11e,A3),($11f,A3)
	movea.l	(A7)+,A6
	rts
_clr123pbj
	cmpi.b	#$3,($786,A5)
	bne	_noclr123
	tst.b		($333a,A5)
	beq		_clr2p
	clr.b		($333a,A5)
	move.w		#$4848,($3392,A5)
_clr2p
	tst.b		($34ba,A5)
	beq		_clr3p
	clr.b		($34ba,A5)
	move.w		#$4848,($3512,A5)
_clr3p
	tst.b		($363a,A5)
	beq		_noclr123
	clr.b		($363a,A5)
	move.w		#$4848,($3692,A5)
_noclr123
	moveq		#$0,D0
	move.b		($5,A6),D0
	rts
	
	;bra	$1175c
	;cmpi.w	#$64,D0
	;bge	$1175c
	;move.b	#$50,($c6,A3)		/血量低于100强制暴击
	;bra	$11778

	;org	$2c9b6
	;dc.w	$6030,$4548,$3e3e,$4048,$3e38,$3838,$4040,$4840
	;dc.w	$403e,$4830,$383e,$4048,$3e38,$3e40,$3e40,$5550
*----------------闪血------------------
	org	$166b4
	cmpi.w	#$63,($6c,A6)		/血量低于100闪血  

;-----------人物招式加强、统一-------------
	org	$1a9ca	/火箭腿
	move.w	#$ffe8,($1c,A6)	/下降速度
	move.w	#$80,D1		/距离

	
;-----------白人招式加强-------------
	org	$19782	/白人跑时66A距离
	move.w	#$0020,D1
	
	org	$53e8	/直跳
	dc.w	$ffb6

	org	$54de	/跑时右跳
	dc.w	$0280,$0018,$0600,$ffb6

	org	$550e	/跑时左跳
	dc.w	$fd80,$ffe8,$0600,$ffb6	

	org	$1bf06	/28A
	dc.w	$0400,$ffed

;-----------汉娜招式加强-------------
	org	$5670
	dc.w	$ffa8	/直跳

	org	$5766	/跑时右跳
	dc.w	$0280,$0018,$0700,$ffb0	

	org	$5796	/跑时左跳
	dc.w	$fd80,$ffe8,$0700,$ffb0

	org	$1bf16	/28A
	dc.w	$0800

	org	$1bf32	/66A
	dc.w	$0800,$fff0

;-----------麦斯招式加强-------------
	org	$1bf3A	/66A
	dc.w	$0600,$0000

	;org	$1bf26	/28A

;-----------黄帽招式加强-------------
	org	$1bf10	/28A
	dc.w	$0000

	org	$1bf2a	/66A	(bp $1abd4)
	dc.w	$0700,$ffe8

	org	$5622	/跑时右跳
	dc.w	$0280,$0018,$0500,$ffc0	/距离、速度、高度、高度
	
	org	$5652	/跑时左跳
	dc.w	$fd80,$ffe8,$0500,$ffc0	/距离、速度、高度、高度	
	
	
*----------------BOSS高血量防御------------------------------	
	org	$2b9c0
	addi.w	#$0,D2

	org	$2baf2
	addi.w	#$0,D2	
	
*====================3BOSS任意场景===============================
	org	$4fecc		*7C	jsr	$12cb4
	jsr	_3Bcj
	org	$5102e	
	jsr	_3Bcj
	org	$105b00
_3Bcj
	cmpi.b	#$2,($4d9,A5)
	bne	_nojccj
	jsr	$12cb4
_nojccj
	rts
_3B_stxs
	cmpi.b	#$2,($4d9,A5)
	bne	_3B_huan
	;cmpi.w	#$2ccc,($744,A5)
	;bls	_3B_huan
	jmp	$49ca
_3B_huan
	move.w	#$8,($20,A6)
	move.w	#$78,($80,A6)	*尸体隐现时间
	movem.l     D0,-(A7)
	moveq       #0,D0
	jsr         $119c
	andi.w      #$1f,D0
	move.b      _bjo3d(PC,D0),($96,A6)
	movem.l     (A7)+,D0
	jsr         $24b36
	jmp	$49ca
_bjo3d
        dc.w    $0300,$3731,$2700,$1337,$2738,$0037,$2501,$3800
        dc.w    $0301,$0e00,$0127,$1327,$0038,$3837,$2538,$010b
_dalongbaowu
	move.w	($10,A6),($10,A0)
	move.b	($96,A6),($96,A0)   *大龙爆物
	move.w	($dc,A6),($dc,A0)   *大龙等级
	rts
_clr_obj
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+
	move.l	D0,(A4)+	
	move.b	D0,($59,A6)
	move.b	D0,($63,A6)
	move.b	D0,($7d,A6)
	move.b	D0,($87,A6)
	move.b	D0,($96,A6)
	move.l	D0,($dc,A6)
	rts
_3B_music
	cmpi.b	#$2,($4d9,A5)
	bne	_no3music
	;cmpi.w	#$2ccc,($744,A5)
	;ble	_no3music
	jsr	$a63c
_no3music
	rts
_clr_knife
	cmpi.w	#$4,($26,A6)
	bne	_24642
_48d4
	jmp	$48d4	*清理并回收内存
_24642
	cmpi.b	#$3,($786,A5)
	bne	_msc_jq
	cmpi.b   #$7,($4d9,A5)
	bne      _msc_jq
	bra	_clrcc
_msc_jq	
         cmpi.b   #$1,($7f70,A5)
         bne      _hasgun
	tst.b	($7fba,A5)
	bne	_hasgun
_clrcc
	cmpi.w	#$c,($26,A6)
	ble	_48d4
_hasgun
	jsr	$121e
	jmp	$24642
*===================3BOSS尸体消失===================================
	org	$50782		*3BOSS倒下才会一直运行的尸体显示指令
	jmp	_3B_stxs

*=====================大龙爆物=====================================
	org	$617d6
	jsr	_dalongbaowu

*===================敌兵内存清理======================================
	org	$490e
	jmp	_clr_obj
*==================3BOSS音乐=========================================
	org	$4fe0e
	jsr	_3B_music
*----------------------清理匕首-------------------------------------
	org	$2463c
	jmp	_clr_knife
	org         $4040a          *刀兵挨打不掉匕首
	nop
	nop
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
	cmpi.w		#$120,($20,A6)	/幼体，$5e460跳转
	beq		_6guanjc1
	cmpi.w		#$48,($20,A6)
	beq		_1guanjc	
	jmp		_guoguan		/7BOSS直接过关	
_1guanjc
	cmpi.b		#$0,($4d9,A5)
	bne		_boss_minus
	cmpi.b		#$2,($786,A5)
	bne		_boss_minus
	bra		_jc_2			;第1关打死2个1BOSS
_2guanjc
	cmpi.b		#$1,($4d9,A5)
	bne		_boss_minus
	cmpi.b		#$2,($786,A5)
	bne		_boss_minus
	bra		_jc_2			;第2关打死3个BOSS
_3guanjc
	cmpi.b		#$2,($4d9,A5)
	bne		_rts3
	;cmpi.w		#$2ccc,($744,A5)
	;bls		_rts3	
	bra		_jc_3			;第3关打死3个BOSS
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
_6guanjc1
	cmpi.b		#$4,($4d9,A5)
	bne		_6guanjc
	move.b		#$1,($7f74,A5)		*第6关隐藏路线标志位
_6guanjc
	cmpi.b		#$5,($4d9,A5)
	bne		_boss_minus
	cmpi.b		#$2,($786,A5)
	bne		_boss_minus
	tst.b		($7f74,A5)	
	beq		_jc_2			;第6关打死2个6BOSS
	bra		_jc_6
_8guanjc
	cmpi.b		#$7,($4d9,A5)
	bne		_dl
	cmpi.b		#$3,($786,A5)
	bne		_dl	
	bra		_guoguan			;第8关打死1个大龙	
_jc_6
	addq.b		#1,($7fa2,A5)		*第6关隐藏路线6个
	cmpi.b		#$6,($7fa2,A5)		*第6关隐藏路线6个
	bge		_clr_7f74
	rts
_clr_7f74
	clr.b		($7f74,A5)
	bra		_guoguan
	
_jc_8
	addq.b		#1,($7fa2,A5)		*第1关打死8个
	cmpi.b		#$8,($7fa2,A5)		*第1关打死8个
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
	clr.w		($26,A6)
	rts		
_guoguan
	move.b		#$1,($4d4,A5)
	clr.b		($7ff2,A5)
	addq.b		#1,($7fa4,A5)
	addq.b		#1,($7fa6,A5)	
	jmp		$acf4
	
;------------------------------------大龙清版与尸体处理相关-----------------------------------------                
_dl
		subq.b	#$1,($7fe0,A5)
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

*========================================屠夫巡逻程序=====================================================
	org	$58cf0
	moveq	#$0,D1
	tst.b	($3274,A5)
	beq	_2Pxljc
	lea	($3274,A5),A0
	move.w	($32e0,A5),D1	
_2Pxljc
	tst.b	($33f4,A5)
	beq	_3Pxljc
	move.w	($3460,A5),D0
	cmp.w	D0,D1		*1P血量是否大于2P
	bge	_3Pxljc		*大于则跳，保留1P
	lea	($33f4,A5),A0
	move.w	D0,D1
_3Pxljc	
	tst.b	($3574,A5)
	beq	_bla0
	move.w	($35e0,A5),D0
	cmp.w	D0,D1
	bge	_bla0
	lea	($3574,A5),A0
	move.w	D0,D1
_bla0
	rts

*-------------无限时间----------
	org	$103ea
	jsr	_wxtime
	
*================隐藏关卡=========================
	org	$10d58
	jsr	_scret
	
;----------------------------------加载场景--------------------------------     
     	ORG  	$20448
     	jsr 	_8gxshd
     	
;==========================每关开头地图=======================
	;org	$c642
	;tst.b	($4d9,A5)
	;beq	$c6a8
*========================过场景============================
	org	$ace8
	jmp	_yinctx
	
*======================电梯进入时处理=====================
	;org	$2076a
	;jsr	_diantichuqu
*===========================三关随机处理、电台处理 ==========================
	org		$8bd72
	jsr		_3guan_diantai
*----------------------------------------------------------
	org		$5c94a
	jsr		_huanying


	
	org	$184600
_wxtime
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90a01c,A1		/90a41c，6表示左右位置，ec表示上下位置	
	lea	$102fa0,A0
	tst.b	($7fba,A5)
	beq	_abcms
	lea	$102fd0,A0
	bra	_msc_coa
_abcms
	moveq	#0,D0
	move.b	($7f70,A5),D0		*模式显示
	lsl.b	#4,D0
	adda.l	D0,A0
_msc_coa
	jsr	$c0a
	
	lea      $90b19c,A1		*游戏难度
	moveq    #0,D0
	move.b   ($7668,A5),D0		*游戏难度
	move.w   D0,($0,A1)
	move.w   #$2,($2,A1)
	move.b   ($766c,A5),D0		*游戏难度
	move.w   D0,($100,A1)
	move.w   #$2,($102,A1)
	move.w   ($5ee,A5),D0		*游戏难度
	lsr.b    #4,D0
	move.w   D0,($200,A1)
	move.w   #$2,($202,A1)
	move.w   ($5ee,A5),D0		*游戏难度
	andi.w    #$f,D0
	move.w   D0,($280,A1)
	move.w   #$2,($282,A1)
	
	move.b	($7f5c,A5),D0		*电梯敌兵ID
	andi.w	#$f,D0
	move.w	D0,($380,A1)
	move.w   #$2,($382,A1)
	move.b	($7f5d,A5),D0		*电梯敌兵ID
	lsr.b	#4,D0
	move.w	D0,($400,A1)
	move.w   #$2,($402,A1)
	move.b	($7f5d,A5),D0		*电梯敌兵ID
	andi.w	#$f,D0
	move.w	D0,($480,A1)
	move.w   #$2,($482,A1)
	
	tst.b	($7f74,A5)
	beq	_no_s6
	move.w	#$6,$90b09c
_no_s6	
	moveq	#0,D0
	movea.l	#$90a19c,A0
	move.l	#$1001e,($0,A0)
	move.b	($7f94,A5),D0
	beq	_no_next
	move.w	D0,($80,A0)
	move.w	#$1e,($82,A0)
	move.b	($7f95,A5),D0
	beq	_no_next
	move.w	D0,($100,A0)
	move.w	#$1e,($102,A0)
	move.b	($7f96,A5),D0
	beq	_no_next
	move.w	D0,($180,A0)
	move.w	#$1e,($182,A0)
	move.b	($7f97,A5),D0
	beq	_no_next
	move.w	D0,($200,A0)
	move.w	#$1e,($202,A0)
	move.b	($7f98,A5),D0
	beq	_no_next
	move.w	D0,($280,A0)
	move.w	#$1e,($282,A0)
	move.b	($7f99,A5),D0
	beq	_no_next
	move.w	D0,($300,A0)
	move.w	#$1e,($302,A0)
	move.b	($7f9a,A5),D0
	beq	_no_next
	move.w	D0,($380,A0)
	move.w	#$1e,($382,A0)
_no_next	
	movem.l	(A7)+,D0-D3/A0-A3
_nomoshi
	cmpi.b	#$9,($1a,A5)
	blt	_rts18
	addq.b	#1,($7fe3,A5)
	cmpi.b	#$8,($7fe3,A5)
	ble	_rts18
	clr.b	($7fe3,A5)
	move.w	#$1800,($4d0,A5)
_rts18
	cmpi.b	#$1,($7f70,A5)		*是否CD
	bne	_nocd
	cmpi.b	#$1,($7fba,A5)		*等于1是C
	beq	_nocd			*不等于1是D，跳
	cmpi.b	#$1a,($1d,A5)
	beq	_d60
	clr.b	($7f4c,A5)
	bra	_over2	
_d60
	addq.b	#1,($7f4c,A5)
	cmpi.b	#$5,($7f4c,A5)
	ble	_over2
	move.b	#1,($363a,A5)
	move.b	#$60,($7f4d,A5)
	move.w	#$6060,($3692,A5)
	bra	_over2
_nocd
	cmpi.b	#$30,($1b,A5)	*1P是否按着AB
	bne	_jc2p60
	addq.b	#1,($7f48,A5)
	cmpi.b	#$3,($7f48,A5)
	ble	_jc2p601
	cmpi.b	#$4,($7f48,A5)
	beq	_1_48
	cmpi.b	#$5,($7f48,A5)
	beq	_1_50
	cmpi.b	#$6,($7f48,A5)
	beq	_1_55
	cmpi.b	#$7,($7f48,A5)
	beq	_1_5c
	cmpi.b	#$8,($7f48,A5)
	beq	_1_60
	move.b	#$3,($7f48,A5)
	bra	_jc2p601
_1_48
	move.b	#$48,($7f49,A5)
	move.w	#$4848,($3392,A5)
	move.b	#1,($333a,A5)
	bra	_jc2p601
_1_50
	move.b	#$50,($7f49,A5)
	move.w	#$5050,($3392,A5)
	move.b	#1,($333a,A5)
	bra	_jc2p601
_1_55
	move.b	#$55,($7f49,A5)
	move.w	#$5555,($3392,A5)
	move.b	#1,($333a,A5)
	bra	_jc2p601
_1_5c
	move.b	#$5c,($7f49,A5)
	move.w	#$5c5c,($3392,A5)
	move.b	#1,($333a,A5)
	bra	_jc2p601
_1_60
	move.b	#$60,($7f49,A5)
	move.w	#$6060,($3392,A5)
	move.b	#1,($333a,A5)
	bra	_jc2p601	
_jc2p60	
	clr.b	($7f48,A5)
_jc2p601
	cmpi.b	#$30,($1c,A5)	*2P是否按着AB
	bne	_jc3p60
	addq.b	#1,($7f4a,A5)
	cmpi.b	#$3,($7f4a,A5)
	ble	_jc3p601
	cmpi.b	#$4,($7f4a,A5)
	beq	_2_48
	cmpi.b	#$5,($7f4a,A5)
	beq	_2_50
	cmpi.b	#$6,($7f4a,A5)
	beq	_2_55
	cmpi.b	#$7,($7f4a,A5)
	beq	_2_5c
	cmpi.b	#$8,($7f4a,A5)
	beq	_2_60
	move.b	#$3,($7f4a,A5)
	bra	_jc3p601
_2_48
	move.b	#$48,($7f4b,A5)
	move.w	#$4848,($3512,A5)
	move.b	#1,($34ba,A5)
	bra	_jc3p601
_2_50
	move.b	#$50,($7f4b,A5)
	move.w	#$5050,($3512,A5)
	move.b	#1,($34ba,A5)
	bra	_jc3p601
_2_55
	move.b	#$55,($7f4b,A5)
	move.w	#$5555,($3512,A5)
	move.b	#1,($34ba,A5)
	bra	_jc3p601
_2_5c
	move.b	#$5c,($7f4b,A5)
	move.w	#$5c5c,($3512,A5)
	move.b	#1,($34ba,A5)
	bra	_jc3p601
_2_60
	move.b	#$60,($7f4b,A5)
	move.w	#$6060,($3512,A5)
	move.b	#1,($34ba,A5)
	bra	_jc3p601
_jc3p60
	clr.b	($7f4a,A5)
_jc3p601
	cmpi.b	#$30,($1d,A5)	*3P是否按着AB
	bne	_over60
	addq.b	#1,($7f4c,A5)
	cmpi.b	#$3,($7f4c,A5)
	ble	_over2
	cmpi.b	#$4,($7f4c,A5)
	beq	_3_48
	cmpi.b	#$5,($7f4c,A5)
	beq	_3_50
	cmpi.b	#$6,($7f4c,A5)
	beq	_3_55
	cmpi.b	#$7,($7f4c,A5)
	beq	_3_5c
	cmpi.b	#$8,($7f4c,A5)
	beq	_3_60
	move.b	#$3,($7f4c,A5)
	bra	_over2
_3_48
	move.b	#$48,($7f4d,A5)
	move.w	#$4848,($3692,A5)
	move.b	#1,($363a,A5)
	bra	_over2
_3_50
	move.b	#$50,($7f4d,A5)
	move.w	#$5050,($3692,A5)
	move.b	#1,($363a,A5)
	bra	_over2
_3_55
	move.b	#$55,($7f4d,A5)
	move.w	#$5555,($3692,A5)
	move.b	#1,($363a,A5)
	bra	_over2
_3_5c
	move.b	#$5c,($7f4d,A5)
	move.w	#$5c5c,($3692,A5)
	move.b	#1,($363a,A5)
	bra	_over2
_3_60
	move.b	#$60,($7f4d,A5)
	move.w	#$6060,($3692,A5)
	move.b	#1,($363a,A5)
	bra	_over2
_over60
	clr.b	($7f4c,A5)	
_over2
	tst.b	($7f73,A5)
	beq	_nocount
	cmpi.b	#$7,($4d9,A5)
	bne	_nocount
	cmpi.b	#$1,($786,A5)
	bne	_nocount
	subq.b	#1,($7f7b,A5)
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90A3B4,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$1808b0,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3  
	move.w  ($7f7a,A5),$90acc4                                                   
	move.w  #$102, $90acc6             
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90aacc,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$1808e0,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3
	tst.b	($7f7b,A5)	*倒计时是否结束
	beq	_gotoscret
	bra	_nocount	
_gotoscret
	clr.b	($4d9,A5)
	move.w	#$0c06,($4d0,A5)
	cmpi.b   #$1,($7f70,A5)
	bne      _nocount
         move.w   #$5a5a,($3392,A5)
         move.w   #$5a5a,($3512,A5)
         move.w   #$5a5a,($3692,A5)		
_nocount
	rts

_scret
	move.b	($2,A2),($2,A3)
	tst.b	($4d9,A5)
	bne	_jcor8
	tst.b	($786,A5)
	bne	_noscret
	move.b	#$e,($7f77,A5)
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90A3dc,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$180880,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3
	rts		
_jcor8
	cmpi.b	#$7,($4d9,A5)
	bne	_noscret
	cmpi.b	#$1,($786,A5)
	bne	_noscret
	tst.w	($744,A5)
	bne	_noscret
	move.b	#1,($7f73,A5)
	move.b	#$a,($7f7b,A5)
	rts
_xdla
	dc.w	$0048,$0018,$016c,$00f4
_noscret
	rts

 *======================加载任意场景================================  
_8gxshd
     	cmpi.b		#$71,($7f73,A5)
     	bne		_zccj1
	cmpi.b		#$ff,($7f78,A5)
	beq		_zccj1
	move.b		#$ff,($7f78,A5)
	move.b		#$7,($4d9,A5)
	move.b		#$2,($786,A5)	  	
    	movem.l 		D0-D7/A0-A6,-(A7)	         
    	jsr 		$8a44                   ;载入色板
    	jsr 		$892c                   ;设置亮度
    	move.b 		#$c,($4d0,A5)
    	jsr 		$2228a                  ;加载场景
    	clr.b		($7f73,A5)
    	jsr 		$162ae		*加载血条与头像
    	movem.l 		(A7)+,D0-D7/A0-A6  
	move.w		#$250,($3284,A5) 
	move.w		#$240,($3404,A5)
	move.w		#$230,($3584,A5)
	rts    
_zccj1
    	jsr 		$206d4
	rts	
	

_yinctx
     	tst.b		($7f77,A5)
     	beq		_zccj
	tst.b		($4d9,A5)
	beq		_jz7dianti
	clr.b		($4d9,A5)
	move.b		#$1,($786,A5)
	tst.b	         ($3274,A5)
	beq	         _you_2p
	;cmpi.w	         #$1f4,($32e0,A5)
         ;blt               _you_2p
         move.w            #$5e5e,($3392,A5)
_you_2p
	tst.b	         ($33f4,A5)
	beq               _you_3p
	;cmpi.w	         #$1f4,($3460,A5)
         ;blt               _you_3p
         move.w            #$5e5e,($3512,A5)
_you_3p
	tst.b	         ($3574,A5)
	beq	         _jz8xsd
	;cmpi.w	         #$1f4,($35e0,A5)
         ;blt               _jz8xsd
         move.w            #$5e5e,($3692,A5)
	bra		_jz8xsd
_jz7dianti
	move.b		#$6,($4d9,A5)
	move.b		#$1,($786,A5)
_jz8xsd		  	
    	movem.l 		D0-D7/A0-A6,-(A7)	         
    	jsr 		$8a44                   ;载入色板
    	jsr 		$892c                   ;设置亮度
    	move.b 		#$c,($4d0,A5)
    	jsr 		$2228a                  ;加载场景
    	tst.b		($4d9,A5)
    	bne		_tgzg
    	jsr		$b52		;清除电梯前景
    	subq.b		#1,($7a8,A5)
    	addq.b		#1,($7f77,A5)
_tgzg
    	jsr 		$162ae		;加载血条与头像
    	movem.l 		(A7)+,D0-D7/A0-A6    
_zccj
	jmp		$18566
	
*===========================三关随机处理、电台处理、隐藏关幻影电梯坐标修复 ==========================
_3guan_diantai
	move.w		#$160,($20,A0)
	move.b		#$3,($7f79,A5)
	rts
_huanying
	jsr		$49ca
	tst.b		($7f77,A5)
	beq		_noxiufuhuanying
	cmpi.b		#$6,($4d9,A5)
	bne		_noxiufuhuanying
	cmpi.w		#$38,($8,A6)
	bge		_jcsxb
	bra		_xfhuanying
_jcsxb
	cmpi.w		#$148,($8,A6)
	ble		_noxiufuhuanying
	bra		_xfhuanying
_noxiufuhuanying
	rts
_xfhuanying
	move.w		#$BE,($8,A6)
	move.w		#$3A,($10,A6)
	rts

*--------------------------------出兵表格替换=============================
	;org	$FC12
	;jsr	_zoudongcb
	org	$fc22
	jsr	_zdcjcb
	org	$7b34a
	jmp	_gudingcb
	org	$8576e
	jmp	_xiayu
	nop
	nop
	org	$85970
	jmp	_xiao_yu
	nop
	nop
	org	$20a12
	jmp	_juanzhou_x
	org	$208fa
	jmp	_juanzhou_jc
	org	$fcea		*加载道具OBJ
	jsr	_load_obj
*================================2关处理==============================
	org	$1da40		*自动行走程序
	jsr	_clrzdmove
	org	$18ab6		*2、4关开局开车动作
	jmp	_nodriveact
	nop
	nop


	
	
	org	$8ad2
	nop
	jsr	_rbjt	
		
	org	$8c44
	nop
	jsr	_rbjt
	
	;org	$7b51a
	;jmp	_ggcountdown
		
		
	org	$180a00
_gudingcb
	moveq	#$0,D0
	move.b	($4d9,A5),D0
	cmpi.b	#$1,D0
	beq	_2guangdth
	cmpi.b	#$5,D0
	beq	_6guangdth	
_nogdhb
	jmp	$7b350

_2guangdth
	tst.b	($7f73,A5)
	beq	_nogdhb
	movea.l	#$181a00,A0
	jmp	$7b358
_6guangdth
	tst.b	($7f74,A5)
	beq	_nogdhb
	tst.b	($786,A5)
	beq	_nogdhb
	movea.l	#$182600,A0
	jmp	$7b358

_zdcjcb
	cmpi.b	#$5,($4d9,A5)
	beq	_6_zdcjcb
	tst.b	($7f73,A5)
	beq	_nohzdcjcb
	cmpi.b	#$1,($4d9,A5)
	bne	_nohzdcjcb
	cmpi.b	#$2,($786,A5)
	beq	_qu8guan
	move.l	_2gbgdz(PC,D0),($c,A4)
	rts
_2gbgdz
	dc.l	$00181100,$00181280
_qu8guan
	move.b	#$6,($4d9,A5)
	move.w	#$0c06,($4d0,A5)
_nohzdcjcb
	move.l	(A1,D0.w),($c,A4)
	rts
_6_zdcjcb
	tst.b	($7f74,A5)
	beq	_nohzdcjcb
	move.l	_6gbgdz(PC,D0),($c,A4)
	rts	
_6gbgdz
	dc.l	$000b0126,$00182300,$00182500
	
_rbjt		
		movem.l   D0-D6/A2,(A1)
		cmpa.l	#$914800,A1					;小于914800的不要交换，可能是人物色板跟其他
		blt	_8ad2_tui
		cmpi.b	#$6,($4d9,A5)
		bne	_tst7f74
		cmpi.b	#$1,($786,A5)
		bne	_8ad2_tui	
		tst.b	($7f77,A5)
		beq	_8ad2_tui	
		bra	_change_red

_tst7f74
		cmpi.b	#$5,($4d9,A5)
		bne	_tst7f73
		tst.b	($786,A5)
		beq	_8ad2_tui	
		tst.b	($7f74,A5)
		beq	_8ad2_tui	
		bra	_change_c6	
_tst7f73
		cmpi.b	#$1,($4d9,A5)
		bne	_black3	
		tst.b	($7f73,A5)
		beq	_8ad2_tui

_change_red
		movem.l	D0-D7,-(A7)					;再次改变写入显存数据的R跟G色(交换)		
		move.l	#$f,D4						;循环计数		
_bhjhgoon
		andi.w	#$ff00,(A1)+
		dbra	D4,_bhjhgoon				;循环20次(f)后退出
		movem.l	(A7)+,D0-D7		
		suba.l  #$20,A1						;显存地址回到开始处
		bra	_8ad2_tui	
_black3
		cmpi.b	#$2,($4d9,A5)
		bne	_8ad2_tui			
_change_black	
		movem.l	D0-D7,-(A7)					;再次改变写入显存数据的R跟G色(交换)		
		move.l	#$f,D4						;循环计数		
_bhjhgoon1
		tst.b	($7f70,A5)
		bne	_black000
		andi.w	#$fff0,(A1)+
		bra	_comehere
_black000
		andi.w	#$f000,(A1)+
_comehere
		dbra	D4,_bhjhgoon1				;循环20次(f)后退出
		movem.l	(A7)+,D0-D7		
		suba.l  #$20,A1						;显存地址回到开始处	
_8ad2_tui
		lea   	($20,A1),A1					;下一组色板
		rts
_change_c6
		movem.l	D0-D7,-(A7)					;再次改变写入显存数据的R跟G色(交换)		
		move.l	#$f,D4						;循环计数		
_colorgoon
		andi.w	#$ff0f,(A1)+
		dbra	D4,_colorgoon				;循环20次(f)后退出
		movem.l	(A7)+,D0-D7		
		suba.l  #$20,A1						;显存地址回到开始处
		bra	_8ad2_tui		
		
		
_xiayu
	cmpi.b	#$5,($4d9,A5)
	beq	_pk500
	cmpi.b	#$1,($4d9,A5)
	beq	_pk880
_pk500
	tst.b	($7f74,A5)
	bne	_85778
	cmpi.w	#$500,($744,A5)
	bge	_85796
_85778
	jmp	$85778
_pk880
	cmpi.w	#$880,($744,A5)
	bge	_85796
	jmp	$85778
_85796
	jmp	$85796
	
_xiao_yu
	cmpi.b	#$5,($4d9,A5)
	beq	_pk5001
	cmpi.b	#$1,($4d9,A5)
	beq	_pk8801
_pk5001
	tst.b	($7f74,A5)
	bne	_pkeee
	cmpi.w	#$500,($744,A5)
	bge	_859c8
	jmp	$8597a
_pk8801
	cmpi.w	#$880,($744,A5)
	bge	_859c8
	jmp	$8597a
_859c8
	jmp	$859c8
_pkeee
	cmpi.w	#$eee,($744,A5)
	bge	_859c8
	jmp	$8597a	
;-------------------------卷轴---------------------------------
_juanzhou_x
	addq.b	#1,($6c,A6)
	cmpi.l	#$21c1a,($56,A6)
	bne	_next_x1
	tst.b	($7f73,A5)
	beq	_next_x1
	move.b	#$4,($5,A6)
	rts
_next_x1
	cmpi.l	#$21c5a,($56,A6)
	bne	_next_x2
	tst.b	($7f73,A5)
	beq	_next_x2
	move.b	#$1,($5,A6)
	rts
_next_x2
	cmpi.l	#$21efa,($56,A6)
	bne	_next_x3
	tst.b	($7f74,A5)
	beq	_next_x3
	move.w	#$1d0,($4c,A6)
_next_x3
	rts
_juanzhou_jc
	cmpa.l	#$21efa,A4
	bne	_jc_go_on
	tst.b	($7f74,A5)
	beq	_jc_go_on
	move.w	#$1d0,D0		;虚假卷轴
_jc_go_on
	cmp.w	($8,A6),D0
	bhi	_20918
	jmp	$2090c	
_20918
	jmp	$20918	
_clrzdmove
	move.b	($4e4,A5),($4dd,A5)
	tst.b	($7f73,A5)
	beq	_no_clrmove
	cmpi.b	#$1,($4d9,A5)
	bne	_no_clrmove
	move.b	#$8,($4de,A5)
_no_clrmove
	rts
_nodriveact	
	tst.b	($7f73,A5)
	bne	_18ac0
	cmpi.b	#$1,($4d9,A5)
	beq	_18aca
_18ac0
	jmp	$18ac0
_18aca
	jmp	$18aca

_load_obj
	move.w	($a,A2),($26,A0)
	cmpa.l	#$AD4D2,A2
	beq	_huan_obj
	cmpa.l	#$AD4EE,A2
	beq	_huan_obj1
_nohuanobj
	rts
_huan_obj
	tst.b	($7f74,A5)
	beq	_nohuanobj
	move.w	#$e0,($20,A0)
	rts
_huan_obj1
	tst.b	($7f74,A5)
	beq	_nohuanobj
	lea	($1c,A2),A2
	rts

	
*===========杰克AB打晕敌兵===============================
	org	$a275a
	dc.w	$0001
















































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
