*7F30\7F32\7F34:非关底BOSS血量行数、关底BOSS血量行数、玩家回血上限
*7f70\7F72\\非关底BOSS血量、关底BOSS血量
*7F20：关卡数，7F22：关卡数百位
*7F3C，3D，3E：1P、2P、3P手雷和弹药状态 开关。7F3a：强制过关读秒数

*----------------------------开局选人---------------------------
	org	$b1d0		/选人界面按下选定键会运行的指令
	jsr	$191200
	org	$191200
	add.w	D0,D0
	move.w	D0,($20,A0)
	;move.b	#$8,($47d,A5)	*开局赠送8个币
	;move.b	#$8,($48d,A5)	*开局赠送8个币
	;move.b	#$8,($49d,A5)	*开局赠送8个币
	movem.l	D0,-(A7)		
	move.b	($636,A5),D0
	add.b	D0,($15,A5)
	movem.l	(A7)+,D0
	move.b	#$1,($7f3c,A5)
	move.b	#$2,($7f3d,A5)
	move.b	#$1,($7f3e,A5)
	move.b	($7f21,A5),($4d9,A5)
	move.b      #$a0,($11e,A0)
	;movem.l	D0-D1/A0-A3,-(A7)
	;movea.l	A0,A3
	;jsr	$11738
	;movem.l	(A7)+,D0-D1/A0-A3
	;move.b	#$40,($333a,A5)		/开局锁40暴击出场
	;move.b	#$40,($34ba,A5)
	;move.b	#$40,($363a,A5)
	rts

*=====================开局选人时间赋值=====================
	org	$ae3e
	jsr	$190000	
*---------------------过场景清空缓存+赠送gun-------------------------
	org	$18a98
	jsr	_cjwd
	
	org	$190000
;---------------------------开局-----------------------------------
	clr.l	($7fa0,A5)
	clr.l	($7fa4,A5)
	clr.l	($7fa8,A5)
	clr.l	($7f30,A5)
	clr.l	($7f34,A5)
	clr.l	($7f38,A5)
	clr.l	($7f3c,A5)
	clr.l	($7f70,A5)
	clr.l	($7fe0,A5)
	clr.l	($7f66,A5)
	clr.l	($7f20,A5)	
	move.b	#$a,($9,A6)
	rts
	
;====================场景===========================
_cjwd	
	move.b	#$2,($0,A6)
	move.w 	#$1a8,($ec,A6)
	clr.l	($7fe0,A5)
	tst.b	($786,A5)		*关卡开始才给枪
	beq	_1Pgun
	rts
_1Pgun
	cmpa.l	#$FFFFB274,A6
	bne	_2Pgun
	cmpi.b	#$1,($7f3c,A5)
	beq	_make_gun
	rts
_3Pgun
	cmpa.l	#$FFFFB574,A6
	bne	_2Pgun
	cmpi.b	#$1,($7f3e,A5)
	beq	_make_gun
	rts	
_2Pgun	
	cmpi.b	#$1,($7f3d,A5)
	beq	_make_gun
	rts	
_make_gun
	movem.l	D0-D6/A0-A6,-(A7)
	jsr	$4818
	bcs	_not
	move.b	#$1,($0,A0)
	move.w  ($2,A6),($2,A0)
	move.w  #$0,($20,A0)
	moveq	#$0,D0
	jsr     $119c
	andi.w  #$7,D0
	add.w   D0,D0
	move.w  _wqgun(PC,D0.w),D0
	move.w  D0,($26,A0)
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
_wqgun
	dc.l	$00000002,$00080008,$0006000a,$000c0002
_qzcjsj
	;add.w	D1,D1
	;move.w	(A0,D1.w),D1
	;addq.w	#1,($50c,A5)
	;rts
	;org	$7b3d4		*场景强制时间赋值指令,$FF850C
	;jsr	_qzcjsj


*-----------------------------1V3---------------------------------------------
        org     $659e
        jmp     $101c00
        org     $101c00
        move.b  #$2,($4ef,A5)       ;强制1V3模式
        move.b  D0,($7fee,A5)          ;将实际玩家数量放入ffffee
        rts

	;org	$fde2
	;cmpi.b	#$2,($4ef,A5)	*三人出兵
*-----------------------屠夫Y坐标修复----------------------
	org		$588ba
	jsr		_tu_y
        org         $50810
        jmp         _7c_y_xf	
*--------------------过关--------------------------
	ORG	$abec
	jsr	_go_nextlevel
	ORG	$180800
_go_nextlevel
	andi.b	#$7,($4d9,A5)
	clr.l	($7fa0,A5)		*过关相关
	clr.l	($7fa4,A5)		*过关相关
	clr.l	($7fa8,A5)		*过关相关    
	clr.l	($7fe0,A5)		*BOSS清版
	rts
_tu_y
	jsr		$49ca
	movem.l	D0-D1,-(A7)
	move.w	($10,A6),D0	    /Y
	cmpi.b   #$4,($4d9,A5)
	bne      _no_y
_ceshi_y
	move.w   ($748,A5),D1
	cmp.w	D1,D0		/Y坐标是否低于卷轴Y
	bge		_and_37f
	move.w	D1,($10,A6)
	addi.w   #$20,($10,A6)
	movem.l	(A7)+,D0-D1
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
_7c_y_xf
        move.w      (A0)+,($10,A1)
        cmpi.b      #$2,($4d9,A5)
        beq         _7c_rts
        movem.l     A6,-(A7)
        cmpi.w      #$b274,($76,A6)
        beq         _move76
        cmpi.w      #$b3f4,($76,A6)
        beq         _move76
        cmpi.w      #$b574,($76,A6)
        beq         _move76
        cmpi.w      #$b274,($76,A1)
        beq         _move761
        cmpi.w      #$b3f4,($76,A1)
        beq         _move761
        cmpi.w      #$b574,($76,A1)
        beq         _move761
        movem.l     (A7)+,A6
        rts
_move76
        movea.w     ($76,A6),A6
        move.w      ($10,A6),($10,A1)
        movem.l     (A7)+,A6
        rts
_move761
        movea.w     ($76,A1),A6
        move.w      ($10,A6),($10,A1)
        movem.l     (A7)+,A6
_7c_rts
        rts

	
*===================开车不掉枪===================================
	org	$1bc84
	nop
	nop	//clr.w	($b6,A6)


;------------------------BOSS加血程序-----------------------------------------    
	org     		$31e44
	jsr		_bossplus
	move.w		($6c,A6),($6e,A6)
     
	org		$31446
	jsr		_jyggjx
	move.w		($6c,A6),($6e,A6)
*-------------------------------------------------------------------------------------
	org		$106400
_bossplus
	move.w		#$64,($6a,A6)
	cmpi.b		#$7,($4d9,A5)                   ;检测是否8关
	bne		_7guan                       ;否，
	cmpi.b		#$3,($786,A5) 
	beq		_guandijx
	bra		_nogd_player
_7guan
	cmpi.b		#$6,($4d9,A5)                   ;检测是否7关
	bne		_5guan                       ;否，
	cmpi.b		#$3,($786,A5) 
	beq		_guandijx	
	bra		_nogd_player
_5guan
	cmpi.b		#$4,($4d9,A5)                   ;检测是否5关
	bne		_3guan                       ;否，
	cmpi.w		#$D80,($744,A5)                    ;
	bge		_guandijx                       ;
	bra		_nogd_player     
_3guan     
	cmpi.b		#$2,($4d9,A5)                   ;检测是否3关
	bne		_else_guan                       ;否，跳到关检测
	cmpi.w		#$f00,($744,A5)                    ;
	ble		_nogd_player                       ;否，跳到非关底玩家数量检测
	bra		_guandijx
_else_guan
	cmpi.b		#$2,($786,A5)                    ;检测是否第3场景
	bne		_nogd_player                       ;否，跳到非关底玩家数量检测
_guandijx
	move.w	#$320,($6c,A6)	*关底BOSS血量
	rts
_nogd_player
	cmpi.w  #$11c,($20,A6)                   ;是否幻影
	beq     _jcs_11c64
	cmpi.w  #$64,($20,A6)                   ;是否4幻影
	beq     _jcs_11c64
	cmpi.w  #$7c,($20,A6)                   ;是否3B
	beq     _jcsl				/3BOSS非关底直接6行血
	cmpi.w  #$120,($20,A6)                   ;是否6B幼体
	beq     _jcsl
	cmpi.w  #$10,($20,A6)                   ;是否6B，6BOSS非幼体会走两次加血路线
	beq     _jcsl     
	addq.b	#1,($7fe0,A5)		/BOSS清版+1
	move.b	#$39,($96,A6)		*爆物标志39
_jcsl  
	moveq	#0,D0
	move.b	($7fee,A5),D0
	mulu.w	#$64,D0
	add.w	#$190,D0
	move.w	D0,($6c,A6)	*非关底BOSS血量
	rts
_jcs_11c64
	move.b	#$34,($96,A6)		*幻影爆物标志34
	bra	_jcsl
*-------------------------精英怪加血---------------------------------------------
_jyggjx
	move.w		#$64,($6a,A6)
	cmpi.w		#$148,($20,A6)	/翼龙
	beq		_kl
	cmpi.w		#$60,($20,A6)	/龙
	beq		_12c_plus1
	cmpi.w		#$98,($20,A6)	/龙
	beq		_12c_plus1
	cmpi.w		#$74,($20,A6)	/龙
	beq		_12c_plus1		
	cmpi.w		#$48,($20,A6)		*爆物标志#$3a
	beq		_12c_plus_48
	cmpi.w		#$16c,($20,A6)		*爆物标志#$3a
	beq		_12c_plus
	cmpi.w		#$18,($20,A6)		*爆物标志#$3a
	beq		_12c_plus
	cmpi.w		#$c,($20,A6)		*爆物标志#$3a
	beq		_12c_plus
	move.w		#$64,($6c,A6)
	rts
_kl
	move.w		#$32,($6a,A6)		*翼龙血量	
	move.w		($6a,A6),($6c,A6)	
	rts
_12c_plus_48
	move.b		#$3a,($96,A6)	
_12c_plus
	tst.b		($4d9,A5)
	beq		_1guanjx_1
	cmpi.b		#$3,($786,A5)
	bne		_12c_plus1
	cmpi.b		#$7,($4d9,A5)
	bne		_12c_plus1
	move.w		#$320,($6c,A6)
	rts
_12c_plus1
	move.w		#$12c,($6c,A6)
	rts
_1guanjx_1
	cmpi.b		#$2,($786,A5)
	bne		_12c_plus1
	cmpi.w		#$ee,($744,A5)
	ble		_12c_plus1
	move.w		#$320,($6c,A6)
	rts	
	
*======================死命下来后给枪===========================================
	org		$18bc0	*检测是否续币
	nop
	nop
	nop
	nop
	jsr		$18a400
	
	org		$18a400
	jsr		$4818
	bcs		_nowq
	move.b	#$1,($0,A0)
	move.w  ($2,A6),($2,A0)
	move.w  #$0,($20,A0)
	move.w  D0,-(A7)
	moveq	#$0,D0
	jsr     $119c
	andi.w  #$3,D0
	add.w   D0,D0
	move.w  _wq(PC,D0.w),D0
	move.w  D0,($26,A0)
	move.w  (A7)+,D0
	move.w  ($8,A6),($8,A0)
	move.w  ($c,A6),($c,A0)
	move.w  ($10,A6),($10,A0)
	move.w  A6,($70,A0)
	move.w  A0,($b4,A6)
	move.w  A6,-(A7)
	move.w  A0,-(A7)
	lea     (A0),A6
	moveq   #$0,D0
	jsr     $24d44
	move.w  #$258,($a4,A6)
	move.b  #$8,($5,A6)
	movea.w (A7)+,A0
	movea.w (A7)+,A6
	move.w  ($a0,A0),($b6,A6)
_nowq
	rts
_wq
	dc.w	$0006,$0008,$000a,$0002

	
;-----------------------------------6B非幼体加血---------------------------------------------	
	org		$36ade
	nop
	jsr		$105300
	org		$105300
	cmpi.b		#$5,($4d9,A5)
	bne		_noytjx			/非6关底加血
	cmpi.b		#$2,($786,A5)
	bne		_noytjx	
	move.w		#$190,($6c,A6)	/6关底加血
	move.w		($6c,A6),($6e,A6)
	rts
_noytjx	
	move.w		#$190,($6c,A6)	/非6关底加血
	move.w		($6c,A6),($6e,A6)
	rts

_3B_stxs
	cmpi.b	#$2,($4d9,A5)
	bne	_3B_huan
	tst.b	($4d1,A5)		*是否过关
	beq	_3B_huan
	jmp	$49ca
_3B_huan
	move.w	#$8,($20,A6)
	move.w	#$78,($80,A6)	*尸体隐现时间
	jmp	$49ca
_clrA0de
	move.w	#$a0,($20,A6)
	clr.w	($de,A6)
	rts
*===================3BOSS尸体消失===================================
	org	$50782		*3BOSS倒下才会一直运行的尸体显示指令
	jmp	_3B_stxs

*======================铁头龙色板修复==================================
	org	$52ebe
	jsr	_clrA0de
*--------------------------------------------------------------






















































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
