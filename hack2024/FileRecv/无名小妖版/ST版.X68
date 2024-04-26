*=============================备注================================
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
	;org	$ad66		/开局清空缓存
	;jsr	_beginclear
	org	$18a1a		/过场景
	jsr	_changeancen
*----------------------随机出兵-------------------------
	org		$fddc
	jsr		_randomsj	
*==============================BOSS==========================================
*----------------1BOSS过关个数处理-----------------------
	org	$45dc2
	jsr	_number_boss_1
*----------------2BOSS，音乐、派兵、过关、尸体处理---------------
	org	$59e08		/派兵
	jsr	_pb_2
	org	$59e16		/音乐
	jsr	_music_2
	org	$5bb6e		/过关
	jsr	_pass2
	org	$59f04		/屠夫不掉刀
	jmp	$59f54
*----------------3BOSS，音乐、派兵、过关、尸体处理---------------
	org	$4fe12		/派兵
	jmp	_pb_3
	org	$4fde0		/音乐
	jsr	_music_3
	org	$50336		/过关
	jsr	_pass3
*----------------4BOSS，音乐、派兵、过关、尸体处理---------------
	org	$4bfc6		/派兵
	jsr	_pb_4
	org	$4bfba			/4BOSS出场音乐
	jsr	_4Bccyy
	org	$4bf4c			/4BOSS对话音乐
	jsr	_4Bdhyy	
	org	$7796			/4BOSS死亡音乐
	jmp	_music_4_die
	org	$4c89a		/过关
	jsr	_pass4
*----------------马云，音乐、派兵、震死小兵---------------
	org	$5178a		/派兵
	jsr	_pb_5
	org	$51772		/音乐
	jsr	_music_5
	org	$52d28		/震死小兵，也是慢动作地址
	jmp	$52d36

*----------------5BOSS，音乐、派兵、过关、尸体处理---------------
	org	$53e64		/派兵
	jsr	_pb_5
	org	$5574e		/过关
	jsr	_pass5
*----------------6BOSS，音乐、派兵、过关、清版+1、-1--------------------------
	org	$36ac2		/派兵
	jsr	_pb_6
	org	$36a9e		/音乐
	jsr	_music_6
	org	$38c30		/6BOSS非幼体过关
	jsr	_6b_noyt
	org	$5fc68		/6BOSS幼体过关
	jsr	_6b_noyt	
;取消6B慢动作、震死小兵
	org		$38c12		/慢动作NOP掉
	nop		
	nop
	nop	
	nop		
	nop
	nop

;-----------------------------取消打死178慢动作、变身、清版-1--------------------------------
	org	$6be7a
	jsr	_music_8
	org	$6cd3a			/178慢动作
	nop
	nop
	nop
	org     	$6ce06			/178变身坐标
	nop
	bra	$6ce1e	
	org	$6cef8			/加载大龙,清版-1
	jsr	_minus_178
	org	$64f54			/大龙音乐
	jsr	_music_8
	org	$6501c			/大龙派兵
	jsr	_pb_8
	org	$66b64			/大龙过关、清版-1
	jsr	_pass8
		
;===================================幻影与4B修复================================
;幻影死亡飞镖BUG修复
	org	$8598C
	jmp	_11c_xf
	ORG	$5e4a4
	jmp	_11c_gj			/幻影修复
    	ORG    $4c386
    	jmp    _64_gj		/修复
;飞镖调节
	org	$47730
	jmp	_11c_feibiao

*--------------------------BOSS尸体处理----------------------------------
*-------------------------幻影尸体消失、马云清版-1，变身相关----------------------------------------------
        	ORG	$2aec6		/前端
        	jsr	_change_begin
*----------------------------取消单只BOSS死不动，慢动作--------------------------------
		org		$778c	/正常走此指令，打死单只BOSS后不能动，不无敌	;
		jmp		_7fd4	
		org		$81fea	;仅派兵BOSS触发此指令，不走此指令，打死BOSS后依旧能动					
		jmp		_7fd6
*---------------------------------------------------------------------------------
	org	$acee
	jmp	_no_english
	
;------------------------------多模式BOSS加血------------------------
*---------------------BOSS加血--------------------------
	org	$31d76
	jsr	_boss_getengry
	move.w	($6c,A6),($6e,A6)	
;---------------------6BOSS非幼体加血-------------------------------           
	ORG	$36a10
	jsr	_6bossno
	nop
;----------------------小兵加血------------------------------
	org	$31378
	jsr	_xbjx
	move.w	($6c,A6),($6e,A6)
*-----------------------------BOSS派兵时主BOSS+1------------------------------------
	org	$81e06
	jsr	_true_boss	
	
	
	
	
	

*======================================================================================================================
*=======================================================================================================================
	org	$107000
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
	;move.b	#$40,($3392,A5)		/开局锁40暴击出场
	;move.b	#$40,($3512,A5)
	;move.b	#$40,($3692,A5)
	clr.l	($7fe0,A5)	/BOSS清版,D2，主BOSS个数,单只BOSS死后不动标志位
	clr.l	($7fd0,A5)
	move.b	#$7,($7668,A5)	/强制游戏最高难度
	move.b	#$3,($766c,A5)	/强制游戏最高难度
	cmpi.b	#$8,($7f2f,A5)	*是否玄关了？
	blt	_no_xg
	move.b	($7f2e,A5),($4d9,A5)
_no_xg
	move.w	#$0,($7f2e,A5)
	add.w	D0,D0
	move.w	D0,($20,A0)
	btst	#$2,($16,A5)	;1P按了下方向键
	bne	_v3ms
	clr.w	($7f88,A5)
	rts
_v3ms
	move.w	#$5633,($7f88,A5)
	rts		
*===============================1V3、开局、过场景、=============================
_onev3
	move.b	#$2,($4ef,A5)       ;强制1V3模式
	tst.w	($7f88,A5)
	beq	_no_v3
	move.b	#$2,($7f18,A5)
	rts
_no_v3
	move.b	D0,($7f18,A5)          ;将实际玩家数量放入ffff18
	rts
_changeancen
	clr.l	($7fe0,A5)	/BOSS清版，大龙个数
	move.b	#$2, ($0,A6)	/加无敌
	move.w	#$e8, ($ec,A6)
	rts
_beginclear
	clr.l	($7fe0,A5)	/BOSS清版,D2，主BOSS个数,单只BOSS死后不动标志位
	jsr	$5b88	
	rts

;---------------------------随机出兵---------------------------------------
_randomsj	
	movem.l  		D0-D1/A6,-(A7)		;入栈
	moveq		#0,D0	
	move.b		($3,A2),D0		;检测是否箱子或破门等
	andi.b		#$f,D0			;取个位
	cmpi.b		#$1,D0
	beq		_no_suiji
	cmpi.b		#$3,D0
	beq		_no_suiji		
	cmpi.w  		#$28,($20,A0)       ;是否胖子
	beq     		_random_chb
	cmpi.w 		#$8,($20,A0)        ;是否马甲
	beq     		_random_chb     
	cmpi.w  		#$38,($20,A0)       ;是否刀手
	beq     		_random_chb
	cmpi.w  		#$34,($20,A0)       ;是否猎人
	beq     		_random_chb
	cmpi.w  		#$50,($20,A0)       ;猴子
	beq     		_random_chb
	bra		_no_suiji
_random_chb
	cmpi.b		#$2,($4d9,A5)		;3关
	beq		_no_suiji
	cmpi.b		#$6,($741,A5)		;是否关底
	beq		_suiji			/	
_no_suiji
	movem.l  		(A7)+,D0-D1/A6			;把原来D0中的数据移回去
	move.b		($f,A2),($96,A0)	
	rts
*============================随机=================================
_suiji
	moveq		#0,D0	
	jsr		$119c                   	;进入随机程序
	andi.w		#$3,D0
	add.w		D0,D0
	add.w		D0,D0                     ;乘个4，变为4的倍数
	move.w		_xbdata(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addq.b		#2,D0
	move.w		_xbdata(PC,D0),($26,A0)	;取下表中紧随的出场方式	
	move.b		($f,A2),($96,A0)
	movem.l  		(A7)+,D0-D1/A6		;出栈	
	rts
_xbdata
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0002


_number_boss_1
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg1
	jsr	$acee
_nogg1	
	rts
	
_pb_2
	cmpi.b	#$1,($4d9,A5)
	bne	_nopb2
	cmpi.b	#$2,($786,A5)
	bne	_nopb2
	jsr	$81df8
_nopb2
	rts
	
_music_2
	cmpi.b	#$1,($4d9,A5)
	bne	_nomusic2	
	cmpi.b	#$2,($786,A5)
	bne	_nomusic2	
	jsr	$77de
_nomusic2
	rts
	
_pass2
	cmpi.b	#$1,($4d9,A5)
	bne	_nogg2	
	cmpi.b	#$2,($786,A5)
	bne	_nogg2
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg2	
	jsr	$acee
	rts
_nogg2
	jsr	_jc_minus1
	rts
	
_pb_3
	cmpi.b	#$2,($4d9,A5)
	bne	_nopb3
	jmp	$81df8
_nopb3
	rts
	
_music_3
	cmpi.b	#$2,($4d9,A5)
	bne	_nomusic3
	jsr	$77de
_nomusic3
	rts
	
_pass3
	cmpi.b	#$2,($4d9,A5)
	bne	_nogg3	
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg3	
	jsr	$acee
_nogg3
	rts
	
_pb_4
	cmpi.b	#$3,($4d9,A5)
	bne	_nopb4
	cmpi.b	#$2,($786,A5)
	bne	_nopb4	
	jsr	$81df8
	rts
_nopb4
	rts
	
_4Bccyy
	cmpi.b	#$3,($4d9,A5)
	bne	_noccmusic4
	cmpi.b	#$2,($786,A5)
	bne	_noccmusic4	
	jsr	$77de
_noccmusic4
	rts

_4Bdhyy
	cmpi.b	#$3,($4d9,A5)
	bne	_nodhmusic4
	cmpi.b	#$2,($786,A5)
	bne	_nodhmusic4	
	jsr	$77de
_nodhmusic4
	rts
_music_4_die
	moveq	#$0,D2
	cmpi.w	#$64,($20,A6)
	bne	_77de
	cmpi.b	#$3,($4d9,A5)
	bne	_4rts
	cmpi.b	#$2,($786,A5)
	bne	_4rts	
_77de
	jmp	$77de	
_4rts
	rts
_pass4
	cmpi.b	#$3,($4d9,A5)
	bne	_nogg4	
	cmpi.b	#$2,($786,A5)
	bne	_nogg4
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg4	
	jsr	$acee
	rts
_nogg4	
	rts
_pb_5
	cmpi.b	#$4,($4d9,A5)
	bne	_nopb5
	cmpi.w	#$1100,($744,A5)
	bls	_nopb5
	jsr	$81df8
_nopb5
	rts

_music_5
	cmpi.b	#$4,($4d9,A5)
	bne	_nomusic5
	cmpi.w	#$1100,($744,A5)
	bls	_nomusic5
	jsr	$77de
_nomusic5
	rts
_pass5
	cmpi.b	#$4,($4d9,A5)
	bne	_nogg5	
	cmpi.w	#$1100,($744,A5)
	bls	_nogg5
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg5	
	jsr	$acee
	rts
_nogg5
	jsr	_jc_minus1
	rts
	
_pb_6
	cmpi.b	#$5,($4d9,A5)
	bne	_nopb6
	cmpi.b	#$2,($786,A5)
	bne	_nopb6
	addq.b	#$1,($7fd2,A5)	/6关底主BOSS个数+1	
	jsr	$81df8
	rts
_nopb6
	addq.b	#1,($7fe0,A5)	/6BOSS清版+1
	rts
	
_music_6
	cmpi.b	#$5,($4d9,A5)
	bne	_nomusic6
	cmpi.b	#$2,($786,A5)
	bne	_nomusic6
	jsr	$77de
_nomusic6
	rts
	
_6b_noyt
	cmpi.b	#$5,($4d9,A5)
	bne	_nogg6	
	cmpi.b	#$2,($786,A5)
	bne	_nogg6
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg66	
	jsr	$acee
	rts
_nogg6
	subq.b	#1,($7fe0,A5)	/6BOSS清版-1
_nogg66
	move.w	#$28,($20,A6)	/尸体消失
	move.w	#$0,($26,A6)	
	rts
	
_music_8
	cmpi.b	#$3,($786,A5)
	bne	_nomusic178
	jsr	$77de
_nomusic178
	rts
	
_minus_178	
	clr.w	($26,A0)
	jsr	_jc_minus1
	rts
	
_pb_8
	cmpi.b	#$3,($786,A5)
	bne	_nopb8
	jsr	$81df8
_nopb8
	rts
	
_pass8
	cmpi.b	#$7,($4d9,A5)
	bne	_nogg8
	cmpi.b	#$3,($786,A5)
	bne	_nogg8
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg8	
	jsr	$acee
	rts
_nogg8
	jsr	_jc_minus1


;------------------------------------大龙清版与尸体处理相关-----------------------------------------                
_dll		
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

_11c_xf
	cmpi.b  	#$6,($4d9,A5)
	bne     	_clr
	cmpi.b  	#$3,($786,A5)
	bne     	_clr
	jmp     	_no_clr
_clr
	clr.w   	($c6,A6)
_no_clr
	movea.w 	($c6,A6),A0
	clr.w   	($6e,A6)
	jmp     	$85994


_11c_gj
	cmpi.b	#$6,($4d9,A5)
	bne	_7xf_
	cmpi.b	#$3,($786,A5)
	bne	_7xf_    
	jsr	$1862
	jmp	$5e4aa
_7xf_
	jmp	$5e49e
	
_64_gj
    	cmpi.b #$3,($4d9,A5)
    	bne    _4Bxf_
    	cmpi.b #$2,($786,A5)
    	bne    _4Bxf_   
    	jsr    $1862
    	jmp    $4c38c
_4Bxf_
    	jmp    $4c380
_11c_feibiao
	cmpi.b	#$6,($4d9,A5)
	bne	_47738
	cmpi.b	#$3,($786,A5)
	bne	_47738
	jmp	$47742
_47738
	jmp	$47738
	
_change_begin
        	move.b  #$1, ($0,A6)		;原来跳转破环的指令
	cmpi.w  #$11c, ($20,A6)          ;优先处理幻影
	beq     _11csht
	cmpi.w  #$90, ($20,A6)          ;优先处理马云
	beq     _90sht
	cmpi.w  #$f4, ($20,A6)          ;是否屠夫
	beq     _f4sht
	rts
		
_11csht
	cmpi.b	#$6,($4d9,A5)
	bne	_huan_ID	
	cmpi.b	#$3,($786,A5)
	bne	_huan_ID
	rts	
_f4sht
	cmpi.b	#$1,($4d9,A5)
	bne	_huan_ID
	cmpi.b	#$2,($786,A5)
	bne	_huan_ID
	rts				
_90sht
	cmpi.b	#$4,($4d9,A5)
	bne	_90_minus
	cmpi.w	#$1100,($744,A5)
	ble	_90_minus
	rts
_90_minus
	jsr	_jc_minus1		
_huan_ID
	move.w	#$28,($20,A6)			;把敌兵尸体换ID，尸体消失
	move.w  	#$0, ($26,A6)
	rts
	
_7fd4
		cmpi.b		#$1,($7fd4,A5)
		bge		_clrg1
		rts
_clrg1
		clr.b		($7fd4,A5)
		move.w		#$ff07, D0
		move.l		#$4440000,D1
		jmp		$7796
		
_7fd6
		move.b		#$6,($4,A6)
		cmpi.b		#$1,($7fd6,A5)
		bge		_clrg2
		rts
_clrg2
		clr.b		($7fd6,A5)
		jmp		$81ff0


_no_english
	addq.b	#1,($7fd4,A5)
	addq.b	#1,($7fd6,A5)
	move.b	#$0,($7fd2,A5)
	move.b	#$1,($4d4,A5)
	jmp	$acf4
	
*--------------------通用关底检测BOSS-1---屠夫、4B、铁头、大龙、马云、178------------------------------------------

_jc_minus1
	cmpi.b	#$6,($741,A5)		;是否关底
	beq	_no_minus		
	subq.b	#$1,($7fe0,A5)	/BOSS清版-1
_no_minus	
	rts

_boss_getengry
	move.w		#$64,($6a,A6)
	cmpi.w		#$120,($20,A6)		/是否6BOSS幼体
	beq		_guandi_plus
	cmpi.b		#$6,($741,A5)		;是否关底
	beq		_guandi_plus
_no_guandi_plus
	cmpi.w		#$11c,($20,A6)
	beq		_no_gd_plus
	cmpi.w		#$64,($20,A6)
	beq		_no_gd_plus
	cmpi.w		#$7c,($20,A6)
	beq		_no_gd_plus
	cmpi.w		#$10,($20,A6)
	beq		_no_gd_plus	
	addq.b		#1,($7fe0,A5)		/BOSS清版+1
_no_gd_plus
	move.w		#$384,($6c,A6)		*非关底9+1+1
	bra		_player_number_plus1
_guandi_plus
	move.w		#$4b0,($6c,A6)		*关底11+2+2
_player_number_plus2
	moveq		#0,D0
	move.b		($7f18,A5),D0
	mulu.w		#$c8,D0
	add.w		D0,($6c,A6)
	rts

_player_number_plus1
	moveq		#0,D0
	move.b		($7f18,A5),D0
	mulu.w		#$64,D0
	add.w		D0,($6c,A6)
	rts
*--------------------------------小兵加血-----------------------------------
_xbjx
	move.w		D1,($6a,A6)
	cmpi.w		#$18,($20,A6)
	beq		_jyg
	cmpi.w		#$48,($20,A6)
	beq		_jyg
	cmpi.w		#$c,($20,A6)
	beq		_jyg
	cmpi.w		#$50,($20,A6)
	beq		_jyg
	cmpi.w		#$16c,($20,A6)
	beq		_jyg
	cmpi.w		#$148,($20,A6)
	beq		_jyg148
	move.w		D0,($6c,A6)
	rts
_jyg
	move.w		#$64,($6a,A6)
	move.w		#$190,($6c,A6)
	rts
_jyg148
	move.w		#$64,($6a,A6)
	move.w		#$64,($6c,A6)
	rts

_6bossno
	bra	_no_gd_plus

_true_boss
	move.w  #$58,($20,A0)
	cmpi.w	#$A0,($20,A6)
	beq	_no_true
	addq.b	#1,($7fd2,A5)	/主BOSS个数+1
_no_true
	rts



















































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
