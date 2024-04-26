*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*---------------------落雷地址18C5E-------------------------------

	
	org	$18D88
		nop
	jmp	$106500
	
	org	$106500
	;bsr	_bjxscx1
	move.l	#$A111A222,($7f00,A5)
	move.l	#$A333A444,($7f04,A5)
	move.l	#$A555A666,($7f08,A5)
	move.l	#$A777A888,($7f0c,A5)
	jsr	$106d00
	tst.w	($6c,A6)
	bgt	_loc_18dc6
	jmp	$18D90
_loc_18dc6	
	jmp	$18DC6
_bjxscx1        
                        movem.l	D0/A0,-(A7)                          ;D0入栈                   
                        movea.l     #$90a69c,A0
                        tst.b	($2,A6)                  ;检测1P
                        beq         _show_begin               ;1P
                        movea.l     #$90ae9c,A0
                        cmpi.b      #$1,($2,A6)                          ;检测2P
                        beq         _show_begin
                        movea.l     #$90b69c,A0
                        cmpi.b      #$2,($2,A6)                          ;检测3P
                        beq         _show_begin                 _3p
_return               
                        movem.l     (A7)+,D0/A0                                                                                      
                        rts
_show_begin
                        moveq	#$0,D0                                  ;清空D0  
                        move.b      ($c6,A6),D0                  ;暴击值代入D0
                        lsr.b       #4,D0                                  ;取十位
                        move.w      D0,($80,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      #$102,($82,A0)                  ;样式                        
                        move.b      ($c6,A6),D0                  ;暴击值再次代入D0   
                        andi.b      #$f,D0                                  ;取个位
                        move.w      D0,($100,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      #$102,($102,A0)            ;样式
                        bra         _return           



	org		$106d00
_luolei
	tst.b		($7fe2,A5)		*是否过关
	beq		_go_luolei
	clr.l		($7ff0,A5)
	clr.l		($7ff4,A5)
	rts
_go_luolei
	movem.l		D0-D6/A0-A6,-(A7)
	moveq		#$0,D0
	moveq		#$0,D1
	tst.w		($7ff0,A5)
	beq		_xie
	clr.w		($7ff0,A5)
	jsr		$4860
	bcs		_xie
	move.b		#$1,($0,A0)
	move.w		#$48,($20,A0)
	move.b		($2,A6),($2,A0)
	move.b		($3,A6),($3,A0)
_xie
	tst.w		($7ff2,A5)
	beq		_thing
*--------------------------------爆血-----------------------------------------
	jsr		$4818
	bcs		_thing
	move.b		#$1,($0,A0)
	move.w		#$10,($20,A0)
	move.b		($4e9,A5),D0
	move.b		($4da,A5),D1
	add.b		D0,D1
	move.w		D1,D0
	andi.w		#$ff,D1
	andi.w		#$3f,D0
	move.w		($744,A5),($8,A0)
	add.w		D1,($8,A0)
	move.w		($748,A5),($10,A0)
	add.w		D0,($10,A0)
	move.w		($3280,A5),($c,A0)		*1P高度为基准
	move.w		($7ff2,A5),($26,A0)
	clr.w		($7ff2,A5)
	move.b		#$2,($6,A0)

_thing
	tst.w		($7ff4,A5)
	beq		_enemy
*--------------------------------爆枪-----------------------------------------
	jsr		$4818
	bcs		_enemy
	move.b		#$1,($0,A0)
	move.w		#$0,($20,A0)
	move.b		($4e9,A5),D0
	move.b		($4da,A5),D1
	add.b		D0,D1
	move.w		D1,D0
	andi.w		#$ff,D1
	andi.w		#$3f,D0
	move.w		($744,A5),($8,A0)
	add.w		D1,($8,A0)
	move.w		($748,A5),($10,A0)
	add.w		D0,($10,A0)
	move.w		($3280,A5),($c,A0)		*1P高度为基准
	move.w		($7ff4,A5),($26,A0)
	clr.w		($7ff4,A5)
	move.b		#$2,($6,A0)
_enemy
	tst.w		($7ff6,A5)
	beq		_no
	moveq		#0,D0
	cmpi.w		#$48,($7ff6,A5)
	beq		_48
	cmpi.w		#$f4,($7ff6,A5)
	beq		_f4
	cmpi.w		#$7c,($7ff6,A5)
	beq		_7c
	cmpi.w		#$64,($7ff6,A5)
	beq		_64
	cmpi.w		#$90,($7ff6,A5)
	beq		_90_A0
	cmpi.w		#$A0,($7ff6,A5)
	beq		_90_A0
	cmpi.w		#$11c,($7ff6,A5)
	beq		_11c
	cmpi.w		#$150,($7ff6,A5)
	beq		_150
	moveq		#0,D0
	move.b		($4e9,A5),D0
	divu.w		#$3,D0
	swap		D0
	add.b		D0,D0
	lsl.w		#$8,D0
	cmpi.w		#$8,($7ff6,A5)
	beq		_8
	cmpi.w		#$28,($7ff6,A5)
	beq		_28
	cmpi.w		#$34,($7ff6,A5)
	beq		_34
	moveq		#0,D0
	move.b		($4e9,A5),D0
	andi.b		#$1,D0
	add.b		D0,D0
	lsl.w		#$8,D0
	cmpi.w		#$38,($7ff6,A5)
	beq		_38
	cmpi.w		#$50,($7ff6,A5)
	beq		_50
	cmpi.w		#$18,($7ff6,A5)
	beq		_18
	cmpi.w		#$c,($7ff6,A5)
	beq		_c
	cmpi.w		#$16c,($7ff6,A5)
	beq		_c	
_no
	movem.l		(A7)+,D0-D6/A0-A6
	rts
_48
	move.w		#$200,D0
	bra		_loading	
_f4
	cmpi.b		#$1,($4d9,A5)
	bne		_loading
	cmpi.b		#$2,($786,A5)
	bne		_loading
	bra		_no
_7c
	cmpi.b		#$2,($4d9,A5)
	beq		_no
	cmpi.b		#$6,($4d9,A5)
	bne		_loading
	cmpi.b		#$1,($786,A5)
	bne		_loading	
	bra		_no
_64
	cmpi.b		#$3,($4d9,A5)
	bne		_jc7guan
	cmpi.b		#$2,($786,A5)
	bne		_loading
	bra		_no
_jc7guan
	cmpi.b		#$6,($4d9,A5)
	bne		_loading
	cmpi.b		#$3,($786,A5)
	bne		_loading	
	bra		_no
_90_A0
	cmpi.b		#$4,($4d9,A5)
	bne		_loading
	cmpi.w		#$1000,($744,A5)
	ble		_loading
	bra		_no	
_11c
	bra		_loading
_150
	cmpi.b		#$3,($786,A5)
	beq		_no
	cmpi.b		#$6,($4d9,A5)
	bne		_loading
	cmpi.b		#$1,($786,A5)
	bne		_loading	
	bra		_no	
_8
	move.b		#$a,D0
	bra		_loading
_28
	move.b		#$2,D0
	bra		_loading
_34
	move.b		#$6,D0
	bra		_loading
_38
	move.b		#$6,D0
	bra		_loading	
_50
	move.b		#$a,D0
	bra		_loading
_18
	move.w		#$6,D0
	bra		_loading
_c
	moveq		#0,D0
	bra		_loading	
_loading
	jsr		$483c
	bcs		_no_loading
	move.b		#$1,($0,A0)
	move.w		($7ff6,A5),($20,A0)
	clr.w		($7ff6,A5)
	move.w		D0,($26,A0)
	move.b		($4e9,A5),D0
	move.b		($4da,A5),D1
	add.b		D0,D1
	move.w		D1,D0
	andi.w		#$ff,D1
	andi.w		#$3f,D0
	move.w		($744,A5),($8,A0)
	add.w		D1,($8,A0)
	move.w		($748,A5),($10,A0)
	add.w		D0,($10,A0)
	move.w		#$0,($5c,A0)
	move.b		#$0,($5b,A0)
	move.b		#$0,($96,A0)
_no_loading
	bra		_no
*====================================================================================================+
***======================================================================================================
_clr1901
	clr.l		($7fe0,A5)
	move.b		#$1,($0,A6)
	rts
_music_2
	cmpi.b	#$1,($4D9,A5)		;是否2关
	bne	_music_no
	cmpi.b	#$2,($786,A5)
	bne	_music_no	
	jsr	$a63c
_music_no
	rts
_music_3
	cmpi.b	#$2,($4d9,A5)
	bne	_music_no
	jsr	$a63c
	rts
_4boss_die_music
	moveq	#$0,D2
	cmpi.w	#$7c,($20,A6)
	beq	_7c_die_music
	cmpi.b	#$5,($3,A6)
	bne	_a63c
	cmpi.b	#$3,($4d9,A5)
	bne	_4_die_music
	cmpi.b	#$2,($786,A5)
	bne	_4_die_music	
_a63c
	jmp	$a63c	
_4_die_music
	rts
_7c_die_music
	cmpi.b	#$2,($4d9,A5)
	beq	_a63c
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
_die_body
	cmpi.w		#$f4,($20,A6)
	beq		_f4shiti
	cmpi.w		#$11c,($20,A6)
	beq		_11cshiti		
	cmpi.w		#$90,($20,A6)
	beq		_90shiti
	bra		_bhmj
_f4shiti
	cmpi.b		#$1,($4d9,A5)		
	bne		_hmj
	cmpi.b		#$2,($786,A5)
	bne		_hmj
	bra		_bhmj
_11cshiti	
	cmpi.b		#$6,($4d9,A5)		
	bne		_hmj
	cmpi.b		#$3,($786,A5)
	bne		_hmj
	bra		_bhmj	
_90shiti
	cmpi.b		#$4,($4d9,A5)		
	bne		_5boss_minus
	cmpi.w		#$1100,($744,A5)
	ble		_5boss_minus	
	bra		_bhmj
_5boss_minus
	subq.b		#$1,($7fe0,A5)	
_hmj
	move.w		#$28,($20,A6)		;尸体换成小兵
	move.w		#$0,($26,A6)	
_bhmj	
	move.b		#$1,($0,A6)
	rts
_5boss_kill_0
	cmpi.b		#$4,($4d9,A5)
	bne		_52d98
	cmpi.w		#$1100,($744,A5)
	ble		_52d98
	move.b		#$2,($50e,A5)		
	beq		_52d9c
_52d98
	jmp		$52d98
_52d9c
	jmp		$52d9c
_5boss_kill_1
	cmpi.b		#$4,($4d9,A5)
	bne		_90rts
	cmpi.w		#$1100,($744,A5)
	ble		_90rts
	move.b		#$2,($50e,A5)	
_90rts
	rts
	
_2b_pb
	cmpi.b		#$1,($4d9,A5)
	bne		_no_pb_1
	cmpi.b		#$2,($786,A5)
	bne		_no_pb_1	
	jsr		$7bedc
	rts	
_3b_pb
	cmpi.b		#$2,($4d9,A5)
	bne		_no_pb
	jmp		$7bedc
_4b_pb
	cmpi.b		#$3,($4d9,A5)
	bne		_no_pb
	cmpi.b		#$2,($786,A5)
	bne		_no_pb		
	jsr		$7bedc
	rts
_5b_pb
	cmpi.b		#$4,($4d9,A5)
	bne		_no_pb_1
	cmpi.w		#$1100,($744,A5)
	ble		_no_pb_1	
	jsr		$7bedc
	rts
_8b_pb
	cmpi.b		#$7,($4d9,A5)
	bne		_no_pb_1
	cmpi.b		#$3,($786,A5)
	bne		_no_pb_1
	jsr		$7bedc
	rts
_no_pb_1
	addq.b		#1,($7fe0,A5)	
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
	jmp     		$81a9a
_3Bcj
	cmpi.b	#$2,($4d9,A5)
	bne	_nojccj
	jsr	$12cb4
_nojccj
	rts
_3B_stxs
	cmpi.b	#$2,($4d9,A5)
	bne	_3B_huan
	jmp	$49ca
_3B_huan
	move.w	#$8,($20,A6)
	move.w	#$78,($80,A6)	*尸体隐现时间
	jmp	$49ca
_guoguan_chuli
	cmpi.w		#$f4,($20,A6)
	beq		_2guanjc
	cmpi.w		#$7c,($20,A6)
	beq		_3guanjc
	cmpi.w		#$64,($20,A6)
	beq		_4guanjc
	cmpi.w		#$A0,($20,A6)
	beq		_5guanjc	
	cmpi.w		#$150,($20,A6)
	beq		_8guanjc
	jmp		_guoguan		/直接过关	
_2guanjc
	cmpi.b		#$1,($4d9,A5)
	bne		_boss_minus
	cmpi.b		#$2,($786,A5)
	bne		_boss_minus
	bra		_guoguan			;第2关
_3guanjc
	cmpi.b		#$2,($4d9,A5)
	beq		_guoguan	
	rts
_4guanjc
	cmpi.b		#$3,($4d9,A5)
	bne		_no_gg
	cmpi.b		#$2,($786,A5)
	bne		_no_gg
	bra		_guoguan
_5guanjc
	cmpi.b		#$4,($4d9,A5)		;第5关
	bne		_boss_minus
	cmpi.w		#$1100,($744,A5)
	ble		_boss_minus
	bra		_guoguan
_8guanjc
	cmpi.b		#$7,($4d9,A5)
	bne		_dl
	cmpi.b		#$3,($786,A5)
	bne		_dl
	move.b		($7ff9,A5),($4d9,A5)
	clr.w		($7ff8,A5)
	;cmpi.b		#$7,($4d9,A5)
	;beq		_guoguan
	;move.w		#$a0,($20,A6)	
	bra		_guoguan			;第8关
_boss_minus
	subq.b		#$1,($7fe0,A5)		/屠夫、铁头龙,清版-1
	cmpi.w		#$f4,($20,A6)
	bne		_no_gg			/屠夫在这里不换尸体
	rts
_no_gg
	move.w		#$28,($20,A6)
	clr.w		($26,A6)
	rts		
_guoguan
	move.b		#$ff,($7fe2,A5)
	move.b		#$1,($4d4,A5)	
	jmp		$acf4
	
;------------------------------------大龙清版与尸体处理相关-----------------------------------------                
_dl
		subq.b	#$1,($7fe0,A5)		
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
_7c_y_xf
        move.w      (A0)+,($10,A1)
        cmpi.b      #$2,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$3,($4d9,A5)
        beq         _7c_rts
        tst.b       ($786,A5)
        bne         _move_a6
        cmpi.b      #$5,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$1,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$7,($4d9,A5)
        beq         _7c_rts
        cmpi.b      #$6,($4d9,A5)
        bne         _move_a6
        cmpi.w      #$700,($744,A5)
        bge         _7c_rts
_move_a6
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
_qingban_1
	moveq	#$0,D0
	move.b	($4f3,A5),D0
	add.b	($7fe0,A5),D0
	rts

*---------------------过场景清空缓存-------------------------
	org		$18a98
	jsr		_clr1901
;==========================================出场音乐=============================================
	org		$58612                    ;取消2B开场音乐
	jsr		_music_2
	org		$4fe0e                    ;取消3B开场音乐
	jsr		_music_3
	
	org		$a5f4			;4BOSS死亡音乐
	jmp		_4boss_die_music
	org		$517d6                    ;取消5B开场音乐
	jsr		_music_5
	org		$61882                    ;取消8B开场音乐
	jsr		_music_8
*--------------------------------幻影、屠夫尸体消失，马云清版-1-----------------	
	org		$2af94		*前端
	jsr		_die_body

*------------------------取消马云慢动作，震死小兵、变身头像------------------------------------------------
	org		$52d8a		/震死小兵
	jmp		_5boss_kill_0
	org		$52dba		/震死小兵
	jsr		_5boss_kill_1
*------------------------------------BOSS派兵---------------------------------------------
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
	org		$4bf4e
	jmp		_4BOSScoming
;--------------------------178死亡慢动作-----------------------------
		org		$69668
		nop
		nop
		nop
*-------------------4BOSS与幻影修复-----------------------------------
        org             $5cca0		/幻影轨迹修复
        jmp             _guiji7
        org             $4c3b4		/4BOSS轨迹修复
        jmp             _guiji4
        org             $81a92		//幻影死亡飞镖BUG修复
        jmp             _fbbug7
        org             $451e8		;7BOSS与4BOSS飞镖相关
        jmp             _feibiao47
*====================3BOSS任意场景===============================
	org	$4fecc		*7C	jsr	$12cb4
	jsr	_3Bcj
	org	$5102e	
	jsr	_3Bcj
	org         $50810
	jmp         _7c_y_xf
*===================3BOSS尸体消失===================================
	org	$50782		*3BOSS倒下才会一直运行的尸体显示指令
	jmp	_3B_stxs
	

;------------------------------------BOSS死亡过关、尸体消失相关---------------------------------------
	org		$acee
	jmp		_guoguan_chuli
;-------------------------------------BOSS清版相关------------------------
	org 	$7b3c4                  ;监视小兵数量内存的指令
	jsr	_qingban_1

































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
