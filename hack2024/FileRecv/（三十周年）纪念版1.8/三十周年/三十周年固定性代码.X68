*多倍子弹、幻影修复、3BOSS尸体消失、大龙爆物、BOSS清版、迅猛龙、马云头像、多暴击模式、模式显示
*角色防御，攻击，招式相关、1V3出兵、1BOSS不晕、九十行血修复

*----------------------火箭炮-------手枪--------------
	org	$252c0
	jsr	_shouqiang
	org	$258b2
	jsr	_huojianpao
*--------------UZI---M16-----------------
	org	$2553e	/UZI
	jsr	_uzim16
	
	org	$256A4	/M16
	jsr	_uzim16	
*--------———4BOSS、大龙、马云额外爆出16%补给-----------------
	org	$2AB10
	jsr	_extra_bw
	org	$2a68a
	jsr	_extra_bw
	org	$2a814
	jsr	_extra_bw
	org	$2ac04
	jsr	_extra_bw
	;org	$2ac18
	;jsr	_extra_bw
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
*-----------------------迅猛龙欠揍---------------------------------
	org	$4dd7a
	jsr	_xmlqz
*==============================马云变身头像-------------------------------------
	org	$52d76		/地址1
	jsr	_mytx
	org	$52e5e		/地址2
	jsr	_mytx
*---------------------------------多模式暴击-------------------------------------
	org	$1166a
	jmp	_baojims
*---------------------------模式显示----------------------------------------
	org	$1036c
	nop
	jsr	_ms_show
*---------------------------九十行血修复----------------------------------------
	org	$17766
	jmp	_xlxf910

*---------------------------ID展示修复（临时）-----------------------------------------
	;org	$e8f6		*主循环进入敌兵主程序
	;jsr	_idshow_fix
*---------------------------屠夫Y坐标修复-----------------------------------------
	org	$59ea0		*
	jsr	_y_tufu





	org	$105000
_shouqiang
	movem.l	D0-D7/A0-A6,-(A7)
	jsr	$26396
	jsr	$26396
	movem.l	(A7)+,D0-D7/A0-A6
	moveq	#$f,D3
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
_uzim16
	movem.l	D0-D7/A0-A6,-(A7)
	jsr	$26396
	jsr	$26396
	movem.l	(A7)+,D0-D7/A0-A6
	moveq	#$12,D3
	rts	
*====================BOSS额外爆物================================
_extra_bw
	jsr	$24ab8
	tst.b	($7f88,A5)
	beq	_jygbw
	cmpi.b	#$5,($3,A6)	/4BOSS
	beq	_ex50
	cmpi.b	#$22,($3,A6)	/8BOSS
	beq	_ex
	cmpi.b	#$18,($3,A6)	/11C
	beq	_ex
	cmpi.b	#$f,($3,A6)	/屠夫
	beq	_ex50
	cmpi.b	#$15,($3,A6)	/马云
	beq	_ex50
	cmpi.b	#$16,($3,A6)	/铁头龙
	beq	_ex50	
	rts
_jygbw	
	cmpi.b	#$d,($3,A6)	/大个子
	beq	_ex
	cmpi.b	#$23,($3,A6)	/16C
	beq	_ex50
	rts	
_ex
	move.b	#$36,($96,A6)	/100%出16%补给血
	jsr	$24ab8
	rts
_ex50
	move.b	#$1e,($96,A6)	/50%出16%补给血
	jsr	$24ab8
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
*==========================迅猛龙欠揍======================================
_xmlqz
	tst.w	($26,A6)		/是否游走迅猛龙
	bne	_noff
	move.b	#$ff,($c0,A6)	/迅猛龙	
_noff
	move.w	#$64,($6a,A6)	/迅猛龙加血
	move.w	#$c8,($6c,A6)
	move.w	($6c,A6),($6e,A6)
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
*---------------------------------多模式暴击-------------------------------------
_baojims
	move.w		($6c,A3),D0		;跳转破坏的指令
	moveq  		#$0, D1			;跳转破坏的指令
	tst.b		($7f88,A5)
	beq		_bj_ms_x
_bj_ms_s
	cmpi.w		#$32,D0			*50%血量
	bcc		_randombaoji
	move.b		#$40,($11e,A3)
	rts
_randombaoji	
	jsr		$119c
	andi.w		#$3f,D0
	add.w   		D0,D1
	move.l  		A6,-(A7)
	movea.l 		#$18f220,A6
	move.b		(A6,D1),($11e,A3)
	movea.l		(A7)+,A6
	rts
_bj_ms_x	
	jmp		$11670
_bj_ms
	move.b		#$40,($11e,A3)
	rts
*---------------------------模式显示----------------------------------------
_ms_show
	movem.l		D0-D3/A0-A3,-(A7)	
	lea		$90a31c,A1		/90a31c，6表示左右位置，ec表示上下位置	90B4F4
	lea		$102ce0,A0
	tst.b		($7f88,A5)
	beq		_c0a
	adda.l		#$8,A0
	cmpi.b		#$1,($7f88,A5)
	beq		_c0a
	adda.l		#$8,A0
	cmpi.b		#$2,($7f88,A5)
	beq		_c0a
	adda.l		#$8,A0	
_c0a	
	jsr		$c0a
	bra		_no_diff
	
	lea      		$90b19c,A1		*游戏难度
	moveq   		#0,D0
	move.b   		($7668,A5),D0		*游戏难度
	move.w   		D0,($0,A1)
	move.w   		#$2,($2,A1)
	move.b   		($766c,A5),D0		*游戏难度
	move.w   		D0,($100,A1)
	move.w   		#$2,($102,A1)
	move.w   		($5ee,A5),D0		*游戏难度
	lsr.b    		#4,D0
	move.w   		D0,($200,A1)
	move.w   		#$2,($202,A1)
	move.w   		($5ee,A5),D0		*游戏难度
	andi.w    	#$f,D0
	move.w   		D0,($280,A1)
	move.w   		#$2,($282,A1)
_no_diff
	moveq		#$0,D0
	move.b		($1a,A5),D0
	subq.b		#$8,D0
	btst		#$0,D0
	bne		_plus_s
	btst		#$1,D0
	bne		_plus_s
	btst		#$2,D0
	bne		_plus_s
	clr.b		($7f55,A5)
_chu_z
	movem.l		(A7)+,D0-D3/A0-A3
	rts
_plus_s
	addq.b		#1,($7f55,A5)
	cmpi.b		#$9,($7f55,A5)
	bge		_clr_cj_s
	bra		_chu_z
_clr_cj_s
	move.w		#$10,($50c,A5)
	clr.b		($7f55,A5)
	bra		_chu_z
*---------------------------九十行血修复----------------------------------------
_1hsj
	dc.w	$000d,$000e,$000f
_3hsj
	dc.w	$01a0,$01c0,$01e0
_xlxf910
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
;------------------------------------------------------------------------
_y_tufu
        moveq   #0,D0
        move.b  ($5,A6),D0
	movem.l	D0-D1,-(A7)
	move.w	($10,A6),D0	    /Y
	cmpi.b   #$4,($4d9,A5)
	bne      _no_y
_ceshiy
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
    beq         _ceshiy
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
	












*==============================角色防御，攻击，招式相关====================================
	org	$2c7c0
	dc.w	$001e,$0022,$001e,$001e	/角色防御，数值越低防御越高
	
	org	$19700
	move.w	#$700,D0		/杰克66A
	move.w	#$10,D1

	org	$1beb4		/汉娜66A
	dc.w	$0800,$fff0
	
	org	$1bebc		//麦斯66A
	dc.w	$0500,$0000
	
	org	$a0f02		/杰克AB打晕敌人
	dc.w	$0001

*=============================1V3出兵相关-------------------------------------
	org	$fd54
	tst.b	($7f18,A5)
	org	$fd64
	cmpi.b	#$2,($7f18,A5)
*===================大个子、晕,1BOSS不晕================================
	org	$2b13c
	cmpi.b	#$C,($3,A6)
*======================刀兵不掉刀======================================
        org     $42902
        nop
        nop
*=============================马云掉枪======================================
	org	$5d7bc
	move.w	#$1a,($26,A0)		*换成手榴弹
*--------------------------武器弹药修改-------------------------------------
	;org	$24d60	/手枪初始
	;moveq	#$a,D0
	
	;org	$24e06
	;moveq	#$8,D0	/霰弹枪初始

	;org	$28504	/霰弹枪/Bp $2848A
	;dc.w	$0008
	
	;org	$284e4	/手枪
	;dc.w	$000a

	;org	$2850c	/火箭炮
	;dc.w	$0006
	;org	$24e2c	/火箭初始
	;moveq	#6,D0





































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
