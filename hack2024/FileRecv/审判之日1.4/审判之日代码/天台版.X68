*-------------------————开局游戏清空缓存——————————————————--—
	ORG		$ad66                       ;开始游戏清理数据   
	jsr		$104900
	ORG		$104900
	jsr		$89e6
	clr.l		($7f70,A5)	
	clr.l		($7ff0,A5)
	clr.l		($7ff4,A5)
	clr.l		($7ff8,A5)
	clr.l		($7ffc,A5)
	clr.l		($7fe0,A5)
	clr.l		($7fcc,A5)
	move.b		#$7,($7668,A5)
	move.b		#$3,($766c,A5)	
	rts
_6B_music
	cmpi.b		#$3,($26,A6)
	bne		_gorts6
	jsr		$a63c
	move.b		#$88,($23,A6)
	move.b		#$fe,($7d,A6)
_gorts6
	rts
_6B_color
	move.b		#$9f,($23,A6)
	cmpi.b		#$3,($26,A6)
	bne		_gorts6
	move.b		#$88,($23,A6)
	rts	
*-----------------------------1V3----无限时间-----------------------------------------
        org     $659e
        jmp     _set_1v3
        org	$103ea
        jsr	_infinite_time
        
        
        org     $101c00
_set_1v3
        move.b  #$2,($4ef,A5)       ;强制1V3模式
        move.b  D0,($7fee,A5)          ;将实际玩家数量放入ffffee
        rts
_infinite_time
	movem.l	D0-D3/A0-A3,-(A7)
	;lea      $90b19c,A1		*游戏难度
	;moveq    #0,D0
	;move.b   ($7668,A5),D0		*游戏难度
	;move.w   D0,($0,A1)
	;move.w   #$2,($2,A1)
	;move.b   ($766c,A5),D0		*游戏难度
	;move.w   D0,($100,A1)
	;move.w   #$2,($102,A1)
	lea	$90a59c,A1
	moveq	#0,D0
	move.w   ($5ee,A5),D0		*游戏难度
	lsr.b    #4,D0
	move.w   D0,($0,A1)
	move.w   #$2,($2,A1)
	move.w   ($5ee,A5),D0		*游戏难度
	andi.w    #$f,D0
	move.w   D0,($80,A1)
	move.w   #$2,($82,A1)
	movem.l	(A7)+,D0-D3/A0-A3
	rts
*--------------------7关底4幻影强制暴击（废弃）---------------------------------------------
	;org	$11738       
*-------------------————过关时更换场景——————————————————--—  
	ORG		$abec
	jsr		$104800
	ORG		$104800
	clr.l		($7ff0,A5)
	clr.l		($7ff4,A5)
	clr.l		($7ff8,A5)
	clr.b		($7fe0,A5)
	andi.b		#$7,($4d9,a5)
	cmpi.b		#$1,($4d9,a5)		;第2关,回天台
	beq		_tiantai
	cmpi.b		#$3,($4d9,a5)		;第4关,回天台
	beq		_tiantai	
	cmpi.b		#$5,($4d9,a5)		;第6关,回天台
	beq		_tiantai	
	cmpi.b		#$6,($4d9,a5)		;第7关,回天台
	beq		_tiantai	
	cmpi.b		#$7,($4d9,a5)		;第8关,回天台
	beq		_zj7jc	
	rts   
_tiantai
	clr.b		($4d9,A5)
	rts    
_zj7jc
	cmpi.b		#$1,($7fcc,A5)		/是否刚过去真7关
	bne		_jr5g		/否，去5关
	clr.b		($7fcc,A5)
	clr.b		($4d9,A5)
	rts 	
_jr5g	
	move.b		#$4,($4d9,a5)		/放入第5关
	rts					/第5关不回天台，直接返回


;----------------------------------过天台后加载场景--------------------------------     
     	ORG  		$20ca4
     	jsr 		$107000
	nop   
     	ORG  		$107000
     	clr.b   		($7e0,A5)		/原指令
     	clr.b   		($7fe0,A5)	/清空清版缓存     	
     	tst.b		($4d9,A5)
     	bne		_zccj
     	cmpi.b		#$2,($786,A5)
     	bne		_zccj
     	addq.b		#1,($7ffe,A5)
     	cmpi.b		#$1,($7ffe,A5)
	beq		_zccj			/第1次下天台，去第1关关底
     	cmpi.b		#$2,($7ffe,A5)
	beq		_guandi2			/第2次下天台，去第2关关底
     	cmpi.b		#$3,($7ffe,A5)
	beq		_guandi4			/第3次下天台，去第4关关底
     	cmpi.b		#$4,($7ffe,A5)
	beq		_guandi6			/第4次下天台，去第6关关底
     	cmpi.b		#$5,($7ffe,A5)
	beq		_guandi7			/第5次下天台，去第7关关底
     	cmpi.b		#$6,($7ffe,A5)
	beq		_guandi8			/第6次下天台，去第8关关底		

_guandi2
	move.b		#$1,($4d9,A5)
	move.b		#$2,($786,A5)
	bra		_seban
_guandi4

	move.b		#$6,($4d9,A5)		/假7关
	move.b		#$3,($786,A5)
	bra		_seban
_guandi6
	move.b		#$5,($4d9,A5)
	move.b		#$1,($786,A5)
	bra		_seban
_guandi7
	addi.b		#$1,($7fcc,A5)		/真7关标志位
	move.b		#$6,($4d9,A5)
	move.b		#$3,($786,A5)		
	bra		_seban
_guandi8
	move.b		#$7,($4d9,A5)
	move.b		#$2,($786,A5)	
_seban    	
    	movem.l 		d0-d7/a0-a6,-(a7)	         
    	jsr 		$8a44                   ;载入色板
    	jsr 		$892c                   ;设置亮度
    	move.b 		#$c,$ff84d0
    	jsr 		$2228a                  ;加载场景
    	jsr 		$162ae
    	movem.l 		(a7)+,d0-d7/a0-a6   
	rts    
_zccj
    	jsr 		$20766
	rts

*=======================天台与7关兵队伍表格基址================================
	org		$fc22
	jsr		$180f00
	org		$180f00
     	tst.b		($4d9,A5)
     	bne		_jia7
     	tst.b		($786,A5)
     	bne		_yzl
     	tst.b		($7ffe,A5)	/开局天台			
     	beq		_yzl
     	cmpi.b		#$1,($7ffe,A5)	/第2次到天台
     	beq		_bjz2
     	cmpi.b		#$2,($7ffe,A5)	/第3次到天台
     	beq		_bjz3
     	cmpi.b		#$3,($7ffe,A5)	/第4次到天台
     	beq		_bjz4
     	cmpi.b		#$4,($7ffe,A5)	/第5次到天台
     	beq		_bjz5
     	cmpi.b		#$5,($7ffe,A5)	/第6次到天台
     	beq		_bjz6

_yzl
	move.l		(A1,D0.w),($c,A4)
	rts
_bjz2
	move.l		#$181050,($c,A4)
	rts
_bjz3
	move.l		#$181250,($c,A4)
	rts
_bjz4
	move.l		#$181450,($c,A4)
	rts
_bjz5
	move.l		#$181650,($c,A4)
	rts
_bjz6
	move.l		#$181800,($c,A4)
	rts	
_jia7
     	cmpi.b		#$6,($4d9,A5)
     	bne		_yzl
     	cmpi.b		#$3,($786,A5)
     	bne		_yzl     	
	cmpi.b		#$1,($7fcc,A5)	/是否真7
	bne		_yzl
	move.l		#$102d10,($c,A4)
	rts			 


 	
;------------------------------------BOSS死亡过关相关---------------------------------------
	org		$acee
	jmp		$104a00
	org		$104a00
	cmpi.b		#$1,($7fcc,A5)		/是否真7
	beq		_guoguan			/真7直接过关
	tst.b		($4d9,A5)
	beq		_jc1_3			;第1关打死2个BOSS
	cmpi.b		#$1,($4d9,A5)
	beq		_jc_tufu			;第2关屠夫特殊处理
	cmpi.b		#$2,($4d9,A5)
	beq		_jc_2			;第3关打死2个BOSS
	cmpi.b		#$3,($4d9,A5)
	beq		_guoguan			;第4关打死一个直接过关
	cmpi.b		#$7,($4d9,A5)		;第8关打死1个大龙
	beq		_jcdl
	cmpi.b		#$5,($4d9,A5)
	beq		_guoguan			;第6关打死1个BOSS
	cmpi.b		#$6,($4d9,A5)
	beq		_jc7_3			;第7关打死3个4B
;-------------第5关仅铁头龙能过关--------------------------------------------	
	cmpi.w		#$A0,($20,A6)		;第5关死者是否铁头龙
	beq		_guoguan			;是，跳到过关程序
	cmpi.w		#$64,($20,A6)		/大龙清理尸体
	bne		_rts
	move.w		#$28,($20,A6)
	rts					;否，不过关，直接返回
_jcdl
	cmpi.w		#$150,($20,A6)		;死者是否大龙
	bne		_rts			;是，过关
	bra                 _jc_2	
_jc1_3
	cmpi.w		#$48,($20,A6)
	beq		_jc_2
	subq.b		#1,($7fe0,A5)		;非1BOSS，BOSS清版-1
	cmpi.w		#$150,($20,A6)		/天台大龙清理尸体
	beq		_acee_dl
	rts
	
_jc7_3
	addq.b		#1,($7ff2,A5)
	cmpi.b		#$3,($7ff2,A5)
	bge		_guoguan
	rts	
_jc_2
	addq.b		#1,($7ff2,A5)
	cmpi.b		#$2,($7ff2,A5)
	bge		_guoguan
	cmpi.w		#$150,($20,A6)
	beq		_acee_dl
	rts	
_jc_tufu
	cmpi.w		#$f4,($20,A6)		;检测死者是否屠夫
	bne		_rts
	addq.b		#1,($7ff2,A5)		;屠夫死亡次数
	cmpi.b		#$3,($7ff2,A5)
	bge		_guoguan			
_rts
	rts	
		
_guoguan
	move.b		#$1,($4d4,A5)
	addq.b		#1,($7ff4,A5)
	addq.b		#1,($7ff6,A5)	
	jmp		$acf4	
_acee_dl
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
		move.w	#$28,($20,A6)
		rts
		
*----------------------------取消单只BOSS死不动，慢动作--------------------------------
		org		$a5ea		;打死BOSS后不能动
		jmp		$101e00
		org		$101e00
		cmpi.b		#$1,($7ff4,A5)
		bge		_clr1
		rts
_clr1
		clr.b		($7ff4,A5)
		move.w		#$ff07, D0
		move.l		#$4440000, D1
		jmp		$a5f4

;-----------------------------------------------BOSS死慢动作----------------------------------------------		
		org		$7c0ce						
		jmp		$101f00
		org		$101f00
		move.b		#$6,($4,A6)
		cmpi.b		#$1, ($7ff6,A5)
		bge		_clr2
		rts
_clr2
		clr.b		($7ff6,A5)
		jmp		$7c0d4	

*----------------------------变身相关---前端------------------------------------
	org		$2af94
	jsr		$104e00
	org		$104e00
	cmpi.w		#$90,($20,A6)
	beq		_5guanjc_90			;马云非5关不变身
	cmpi.w		#$f4,($20,A6)
	beq		_2guanjc			;屠夫在2关底复活
	cmpi.w		#$A0,($20,A6)
	beq		_8guanjc_A0			;马云非5关不变身
	cmpi.w		#$11c,($20,A6)
	beq		_7guanjcc	
	cmpi.w		#$64,($20,A6)
	beq		_7guanjcc		
	bra		_buhuanmj	
_7guanjcc	
	cmpi.b		#$6,($4d9,A5)
	beq		_buhuanmj
	bra		_huanid
_8guanjc_A0
	cmpi.b		#$4,($4d9,A5)
	beq		_buhuanmj	
	bra		_huanid		
	;cmpi.b		#$7,($4d9,A5)		
	;bne		_huanid			/非第8关铁头龙不换马甲
	;move.w		#$178,($20,A6)		;将铁头龙尸体换成博士龙，进化大龙
	;move.w		#$0,($26,A6)	
	;bra		_buhuanmj				
	
_5guanjc_90
	cmpi.b		#$4,($4d9,A5)		
	beq		_buhuanmj		/第5关马云正常变身
	;cmpi.b		#$7,($4d9,A5)		
	;beq		_buhuanmj			/第8关马云正常变身
	move.w		#$28,($20,A6)
	clr.w		($26,A6)
	subq.b		#1,($7fe0,A5)		/马云清版-1
	bra		_buhuanmj
_2guanjc
	cmpi.b		#$1,($4d9,A5)
	bne		_huanid
	cmpi.b		#$3,($7ff2,A5)	
	bge		_buhuanmj			
	move.w		#$90,($20,A6)		;尸体换成马云
	move.w		#$0,($26,A6)	
_buhuanmj	
	move.b		#$1,($0,A6)
	rts
_huanid
	move.w		#$28,($20,A6)
	clr.w		($26,A6)
	bra		_buhuanmj	
*--------------------------------马云后端--------------------------------------------
	org		$52ebe
	jsr		$104f00
	org		$104f00
	cmpi.b		#$1,($4d9,A5)  ;
	beq		_f4_
	move.w		#$A0,($20,A6)
	bra		_jcjx
_f4_
	move.w		#$f4,($20,A6)
	sub.w		#$100,($26,A6)
_jcjx
	tst.b		($7fee,A5)
	bne		_noxue
	;move.b		#$1,($96,A6)	/单人模式下，屠夫给个中血48%
_noxue
	rts
;--------------------------------------6BOSS相关-----------------------------------------------
	org		$5edc8
	move.w		#$300,($26,A0)		;设置6BOSS出箱为3阶

	org		$36B86
	cmpi.b		#$3,($26,A6)		;设置3阶状态开始派兵

	
	org		$38ce0			;慢动作
	nop
	nop
	nop
	
	org		$38CE6			;move.b	#$2,($50e,A5)取消震死小兵
	nop
	nop
	nop

	org		$36b6c		;颜色与音乐处理
	jsr		_6B_music
	
	org		$36b9a
	jsr		_6B_color

;-------------------------------------复活屠夫----------------------------------------------

	org		$5e076				;2阶与3阶6BOSS变身地址
	jmp		$105000 
	org		$105000
	;cmpi.b		#$1,($4d9,A5)			;检测是否2关
	;bne		_6Byouti
	;cmpi.b		#$2,($786,A5)			;检测是否第3场景
	;beq		_tufu_fuhuo			;2关底复活屠夫              
_6Byouti
	move.w		#$10,($20,A6)			;非2关底进化为6BOSS非幼体
	move.w		($26,A6),($26,A6)
	jmp		$5e082
_tufu_fuhuo
	;move.w		#$f4,($20,A6)			;复活屠夫
	;move.w		#$0,($26,A6)
	;jmp		$5e082
;-----------------------------------6B非幼体加血---------------------------------------------	
	org		$36ade
	nop
	jsr		$101d00
	org		$101d00
	tst.b		($7fee,A5)
	beq		_1player_6B
	move.w		#$258,($6c,A6)
	move.w		#$258,($6e,A6)
	rts
_1player_6B
	move.w		#$1f4,($6c,A6)
	move.w		#$1f4,($6e,A6)
	rts
	
*-------------------------------------------4BOSS对话-----------------------------------------	
        ORG     $4bf4e
        jmp     $105100
        ORG     $105100
        tst.b	($4d9,A5)
        beq	_4BOSSgo
        cmpi.b  #$3,($4d9,A5)
        bne     _7_duihua
_470        
        cmpi.w  #$470,($744,A5)
        jmp     $4BF54
_7_duihua
        cmpi.b  #$6,($4d9,A5)
        bne     _470 
        cmpi.b  #$3,($786,A5)
        bne     _470
        cmpi.w  #$440,($744,A5)
        jmp     $4BF54
_4BOSSgo
        cmpi.w  #$1,($744,A5)
        jmp     $4BF54
*------------------------------------BOSS派兵---------------------------------------------
	org	$7bedc
	jmp	$107fa0
	org	$107fa0
	cmpi.w	#$64,($20,A6)
	beq	_cj4jc
	tst.b	($4d9,A5)
	bne	_pb
	tst.b	($786,A5)
	bne	_pb
	rts
_cj4jc
	cmpi.b	#$3,($786,A5)
	beq	_pb
	rts	
	
_pb
	jsr	$4860
	jmp	$7bee2		

;-------------------------------------BOSS清版相关------------------------
        org 	$7b3c4                  ;监视小兵数量内存的指令
        jsr	$183000
        org	$183000
        moveq	#$0,D0
        move.b	($4f3,A5),D0
        add.b	($7fe0,A5),D0
        cmpi.b	#$1,D0
        bge	_rtszz
        movem.l	D0-D3/A0-A3,-(A7)	
        lea	$90a7ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
        lea	$183300,A0
        jsr	$c0a
        movem.l	(A7)+,D0-D3/A0-A3
_rtszz
        rts
        
	;cmpi.b	#$7,($4d9,A5)
	;bne	_rtszz
	;cmpi.b	#$2,($786,A5)
	;bne	_rtszz
_ttjs
	;movem.l	D0-D3/A0-A3,-(A7)	
	;lea	$90a3a4,A1		/90a6ec，6表示左右位置，ec表示上下位置
	;lea	$183200,A0
	;jsr	$c0a
	;movem.l	(A7)+,D0-D3/A0-A3
	;rts


*-------------------------精英怪加血---------------------------------------------
	org		$31446
	jsr		_xb_plus
	move.w		($6c,A6),($6e,A6)
		
	org		$107e00
_xb_plus
	move.w		D1,($6a,A6)
	cmpi.w		#$48,($20,A6)
	beq		_48_c
	cmpi.w		#$c,($20,A6)
	beq		_48_c
	cmpi.w		#$18,($20,A6)
	beq		_18_16c
	cmpi.w		#$16c,($20,A6)
	beq		_18_16c	
_zjjx	
	move.w		D0,($6c,A6)
	rts
_18_16c
	tst.b		($4d9,A5)
	bne		_zjjx
	tst.b		($786,A5)
	beq		_zjjx
	bra		_gdongjx	
_48_c
	tst.b		($4d9,A5)
	bne		_fa_plus
	tst.b		($786,A5)
	beq		_fa_plus
_gdongjx
	moveq		#0,D0
	move.b		($7fee,A5),D0
	mulu.w		#$32,D0
	add.w		#$258,D0
	move.w		D0,($6c,A6)
	rts

_fa_plus
	moveq		#0,D0
	move.b		($7fee,A5),D0
	mulu.w		#$19,D0
	add.w		#$fa,D0
	move.w		D0,($6c,A6)
	rts	
*------------------------取消马云慢动作，震死小兵------------------------------------------------
	org		$52d8a		/震死小兵
	jmp		$107d00
	org		$107d00
	cmpi.b		#$4,($4d9,A5)
	bne		_52d98
	move.b		#$2,($50e,A5)		
	beq		_52d9c
_52d98
	jmp		$52d98
_52d9c
	jmp		$52d9c

	org		$52dba		/震死小兵，第5关才会运行的指令
	jsr		$107d80
	org		$107d80
	cmpi.b		#$4,($4d9,A5)
	bne		_90rts
	cmpi.w		#$1100,($744,A5)
	ble		_90rts
	move.b		#$2,($50e,A5)	
_90rts
	rts


	             
*---------------------------------------7BOSS飞镖调节-----------------------------------------
	org		$451e8
	jmp		$102f00
	org		$102f00
	cmpi.b		#$1,($7fcc,A5)	/是否真7关，真7关互相接收飞镖
	beq		_451fa
	jmp		$451f0
_451fa
	jmp		$451fa	
;--------------------------178死亡慢动作-----------------------------
		org		$69668
		nop
		nop
		nop
				
;------------------------178变身坐标调节------------------
		org		$69748
		jmp		$69760
;----------------------178生双大龙===================================
		org	$6991c
		jsr	$107700
		nop
		nop
		org	$107700
		move.w	($10,A6),($10,A0)
		move.w	A0,(-$70bc,A5)
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

    ORG    $5cca0		/幻影轨迹修复
    jmp    $1023a0
    ORG    $1023a0
    cmpi.b #$6,($4d9,A5)
    bne    _7xf_
    cmpi.b #$3,($786,A5)
    bne    _7xf_    
    jsr    $1862
    jmp    $5cca6
_7xf_
    jmp    $5cc9a				
*----------------------------3BOSS随机派兵相关---------------------------------------		
	org		$ff1e
	jmp		$104d00
	org		$104d00
	movem.l		D0,-(A7)			;把D0移到空位置
	clr.l		D0
	jsr		$119c
         divu.w		#$8,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	mulu.w		#$4,D0                                 ;乘个4，变为4的倍数
	move.w		_3b_xiaobing_data(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addi.b		#$2,D0
	move.w		_3b_xiaobing_data(PC,D0),($26,A0)	;取下表中紧随的出场方式
	move.b		($f,A2),($96,A0)	   ;补给
	movem.l		(A7)+,D0			;把原来D0中的数据移回去
	jmp		$ff24
;-------------------------------3B静态数据表----------------------------------------
_3b_xiaobing_data
        dc.w    $0048,$0200,$0018,$0000,$000c,$0000,$016c,$0000
        dc.w    $000c,$0000,$016c,$0000,$0048,$0200,$0018,$0000                 
;---------------------------BOSS加血程序---------------------------------------
	org		$31e44
	jsr		_boss_plus
	move.w		($6c,A6),($6e,A6)
	org		$105200
_boss_plus
	move.w		D1,($6a,A6)
	tst.b		($4d9,A5)
	beq		_tiantaijiaxie
_boss_gdjx
	moveq		#0,D0
	move.b		($7fee,A5),D0
	mulu.w		#$64,D0
	add.w		#$320,D0
	move.w		D0,($6c,A6)
	rts
_tiantaijiaxie	
	tst.b		($786,A5)			/是否天台
	bne		_boss_gdjx
	cmpi.w		#$11c,($20,A6)		;是否11C
	beq		_jcsl
	addq.b		#1,($7fe0,A5)		/BOSS清版+1、大龙、马云、铁头龙、屠夫
_jcsl		
	moveq		#0,D0
	move.b		($7fee,A5),D0
	mulu.w		#$32,D0
	add.w		#$12c,D0
	move.w		D0,($6c,A6)
	rts	


;---------------------------随机出兵---------------------------------------
	org		$fe5a
	jsr		_random_1
	org		$102000
_random_1	
	cmpi.b		#$1,($4d9,A5)		;2关
	bne		_jc5
	cmpi.b		#$2,($786,A5)
	bne		_jc5	
	cmpi.w		#$240,($744,A5)
	bge		_suiji
	bra		_nosuiji	
_jc5
	cmpi.b		#$4,($4d9,A5)		;5关
	bne		_jc6
	cmpi.w		#$64,($4,A2)
	beq		_nosuiji
	cmpi.w		#$1140,($744,A5)
	bge		_suiji
	bra		_nosuiji
	
_jc6
	cmpi.b		#$5,($4d9,A5)		;6关
	bne		_jc8
	cmpi.w		#$f90,($744,A5)
	ble		_nosuiji
	cmpi.w		#$11c,($20,A0)
	bne		_suiji
	tst.b		($7fee,A5)
	beq		_suiji
	move.b		#$b,($96,A0)
	rts	
_jc8
	cmpi.b		#$7,($4d9,A5)		;8关
	bne		_nosuiji			;非8关，1、3、7关不随机
	cmpi.w		#$1100,($744,A5)
	ble		_nosuiji
	cmpa.l		#$B60B6,A2
	bne		_8suiji
	cmpi.b		#$2,($7fee,A5)
	bne		_8suiji
	move.w		#$11c,($20,A0)
	move.b		#$b,($96,A0)
	rts
_nosuiji
	move.b		($f,A2),($96,A0)
	rts			
*----------------------------8关随机----------------------------------------------
_8suiji
	movem.l		D0,-(A7)			;把D0移到空位置
	moveq		#0,D0	
	jsr		$119c                   	;进入随机程序	
         andi.w		#$f,D0			;随机数在D0里，求余,限制范围( )
	add.w		D0,D0
	add.w		D0,D0                     ;乘个4，变为4的倍数
	move.w		_xbdata(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addq.b		#2,D0
	move.w		_xbdata(PC,D0),($26,A0)	;取下表中紧随的出场方式	
	addq.w		#1,($7f70,A5)
	move.w		($7f70,A5),D0
	andi.w		#$f,D0
	move.b		_8bj(PC,D0),($96,A0)	        ;
	movem.l  		(A7)+,D0			;把原来D0中的数据移回去
	rts		                  
_xbdata
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0002
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0002
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0002
        dc.w    $0048,$0200,$016c,$0000,$0048,$0200,$016c,$0000
_8bj
	dc.l	$37100037,$00370010,$0e250037,$100e0000
;----------------------------关底随即队列-----------------------------------------
_suiji
	movem.l		D0/A6,-(A7)
	moveq		#0,D0
	jsr		$119c
	andi.w		#$3f,D0			;随机数在D0里，求余,
	add.w		D0,D0
	add.w		D0,D0                     ;乘个4，变为4的倍数
	lea		$105f00,A6
	move.w		(A6,D0.w),($20,A0)	;取下表中随机一个敌兵
	addq.w  		#2,D0
	move.w		(A6,D0.w),($26,A0)	;取下表中紧随的出场方式		
	move.b		($f,A2),($96,A0)
	movem.l  		(A7)+,D0/A6		;把原来D0中的数据移回去
	rts
;-------------------------------静态数据表----------------------------------------                  
	org	$105f00
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0008,$0402,$0008,$0002,$0008,$0202,$00fc,$0000
        dc.w    $0028,$0006,$0028,$0204,$0028,$0400,$0100,$0000
        dc.w    $0038,$0000,$0038,$000c,$0038,$000a,$0048,$0200
        
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0050,$0006,$0050,$0006,$0050,$0006,$0100,$0200
        dc.w    $0034,$040c,$0034,$020c,$0034,$000c,$016c,$0000
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        
        dc.w    $0008,$0402,$0008,$0002,$0008,$0202,$0118,$0100
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0028,$0004,$0028,$0204,$0028,$0406,$000c,$0000
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        
        dc.w    $0038,$0200,$0038,$020c,$0038,$020a,$00fc,$0200
        dc.w    $0050,$0206,$0050,$0206,$0050,$0206,$0018,$0000
        dc.w    $0034,$0400,$0034,$0200,$0034,$0000,$0118,$0000
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000

*-----------------------------电台-------------------------------------------------
	org		$2a12c		;3、5、6、8关开车
	jmp		$105400
	org		$105400
	cmpi.b		#$2,($4d9,A5)
	beq		_2a136
	cmpi.b		#$4,($4d9,A5)
	beq		_2a136
	cmpi.b		#$5,($4d9,A5)
	beq		_2a136
	cmpi.b		#$7,($4d9,A5)
	beq		_2a136	
	jmp		$2a148		;不开车
_2a136
	jmp		$2a136

	org		$8c158		;强制下车
	jmp		$105300
	org		$105300
	cmpi.b  		#$2, ($4d9,A5)			；检测是否第3关
	beq		_dt_3guan
	cmpi.b  		#$4, ($4d9,A5)			；检测是否第5关
	beq		_dt_5guan
	cmpi.b  		#$7, ($4d9,A5)			；检测是否第5关
	beq		_dt_8guan	
_dt_6guan		
	cmpi.w  		#$D50, ($744,A5)		；检测卷轴是否大于D50
	bge		_8c16c
	jmp		$8c162
_dt_3guan	
	cmpi.w		#-$6000, ($744,A5)		；检测卷轴是否大于A000
	bcc     		_8c16c
	jmp		$8c162
_dt_5guan	
	cmpi.w		#$f00, ($744,A5)		；检测卷轴是否大于e70
	bcc     		_8c16c
	jmp		$8c162
_dt_8guan	
	cmpi.w		#$BD0, ($744,A5)		；检测卷轴是否大于BD0
	bcc     		_8c16c
	jmp		$8c162	
_8c16c
	jmp		$8c16c


*------------------------屠夫不掉刀-----------------
	ORG		$58700		/*---------屠夫不掉dao
	jmp		$58750
	;org		$5bfa0		/马云不掉

*------------------------刀兵不掉刀-------------------------------
        org             $4040a
        nop
        nop

	;org		$63492
	;jsr		_dalongguoguan

	;org		$107c00
_dalongguoguan	
	;cmpi.b		#$7,($4d9,A5)
	;bne		_noguoguan
	;jsr		$acee
_dlnogg
	;rts	
	
	org		$53eda
	jsr		_A0PB

	org		$18e000	
_A0PB
	cmpi.b		#$4,($4d9,A5)
	bne		_53ee0
	jsr		$7bedc
_53ee0
	rts	
	
*===============7BOSS派兵==============
	org		$7c062
	jsr		_7bosspb
		
	org		$186800
_7bosspb
	move.l		A0,($a4,A6)
	cmpa.l		#$B5980,A0		/是否7BOSS首兵
	bne		_pbrts
	cmpi.b		#$1,($7fcc,A5)		/是否假7
	bne		_pbrts	
	;tst.b		($7fee,A5)
	;bne		_pbrts
	move.w		#$e0,D0
	rts
_pbrts
	move.w		(A0),D0
	rts	
;---------------------------幻影个数与出场坐标-----------------------------------
;----------------------第一只11C出场坐标--------------------------------------
	org			$81928
	move.w		#$5a0,($8,A0)		;X坐标
	move.w		#$30,($10,A0)		;Y坐标	

;----------------------第二只11C出场坐标---------------------------------------
	org			$81952
	move.w		#$5a0,($8,A0)		;X坐标
	move.w		#$50,($10,A0)		;Y坐标
	
;----------------------第三只11C出场坐标---------------------------------------
	org			$8198c
	move.w		#$5a0,($8,A0)		;X坐标
	move.w		#$10,($10,A0)		;Y坐标	

;---------------------------加载4只以上11C--------------------------------------
	org			$81968		;检测玩家数量，是否加载第三个11C的判断地址
	jmp			$186000		;
	org			$186000		
	tst.b			($7fee,A5)		;单人加载3只，结束加载
	beq			_8196e
	bra			_4zhi		/两、三人模式加载4只11C	
*-------------------------三人模式加载第4只11C--------------------------------------------------
	jsr			$483c		;调内存
	bcs			_81a72		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b0,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$560,($8,A0)		;X坐标
	move.w		#$40,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体		
*-------------------------三人模式加载第5只11C----------------------------------------------------------
	jsr			$483c		;调内存
	bcs			_81a72		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b2,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$560,($8,A0)		;X坐标
	move.w		#$20,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体
	bra			_8196e	
_81a72
	jmp			$81a72
*-------------------------两人模式加载第4只11C-----------------------------------	
_4zhi	
	jsr			$483c		;调内存
	bcs			_81a72		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b0,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$560,($8,A0)		;X坐标
	move.w		#$30,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体		
_8196e
	jmp			$8196e


*-----------------------------判断11C存在，过关----------------------------------
	org			$819e6
	jmp			$186200
	org			$186200
	or.w		($a4,A6),D0	
	or.w		($b0,A6),D0
	or.w		($b2,A6),D0		
	bne			_81a04		；是否全部11C阵亡
	jmp			$819ec		；全部阵亡，进入过关程序
_81a04
	jmp			$81a04	

*-----------------------------全部11C血量加到主体0084上----------------------------------
	org			$81a42
	jmp			$186300
	org			$186300
	tst.w		($b0,A6)
	beq			_B2jc
	movea.w		($b0,A6),A0
	move.w		($6c,A0),D0
	add.w		D0,($6c,A6)
	move.w		($6e,A0),D0
	add.w		D0,($6e,A6)	
_B2jc	
	tst.w		($b2,A6)
	beq			_A4jc
	movea.w		($b2,A6),A0
	move.w		($6c,A0),D0
	add.w		D0,($6c,A6)
	move.w		($6e,A0),D0
	add.w		D0,($6e,A6)
_A4jc
	tst.w		($a4,A6)
	beq			_81a5c
	jmp			$81a48
_81a5c
	jmp			$81a5c	

*-----------------------------11C阵亡减1、死亡幻影放入($a8,A0)，用于过关慢动作----------------------------------
	org			$81ad2
	jmp			$186400
	org			$186400
	tst.w		($b0,A0)
	beq			_B2tst
	move.w		($b0,A0),D0
	cmpa.w		D0,A6
	bne			_B2tst
	subq.b		#1,($aa,A0)
	bne			_nob0a8		；是否是最后一只幻影	
	move.w		D0,($a8,A0)	；是，放入($a8,A0)，过关用到
_nob0a8
	clr.w		($b0,A0)		；从0084主体中清除当前幻影地址


_B2tst
	tst.w		($b2,A0)
	beq			_a4tst
	move.w		($b2,A0),D0
	cmpa.w		D0,A6
	bne			_a4tst
	subq.b		#1,($aa,A0)
	bne			_nob2a8		；是否最后一只幻影	
	move.w		D0,($a8,A0)	；是，放入($a8,A0)，过关用到
_nob2a8
	clr.w		($b2,A0)		；从0084主体中清除当前幻影地址

_a4tst
	tst.w		($a4,A0)
	beq			_81aee	
	jmp			$81ad8
_81aee
	jmp			$81aee


;-------------------------------11C免疫队友飞轮散花-----------------------------------------
	org			$81b14
	jmp			$186500
	org			$186500
	tst.w		($b0,A6)
	beq			_jcb2
	movea.w		($b0,A6),A0
	move.w		A0,(-$70bc,A5)	
	jmp			$81b22
_jcb2
	tst.w		($b2,A6)
	beq			_jca4
	movea.w		($b2,A6),A0
	move.w		A0,(-$70bc,A5)
_81b22	
	jmp			$81b22
_jca4
	tst.w		($a4,A6)
	beq			_81b22
	jmp			$81b1a

;------------------------------11C互相接收飞镖------------------------------------------
	org			$455c8
	nop
	jmp			$186600
	org			$186600	
	movea.w		($b0,A6),A0
	movea.w		($b0,A0),A0		；4号11C地址移到A0
	tst.b		($0,A0)			；检测4号11C
	beq			_5hao11C
	jsr			$455ec
	bcs			_455e2		
_5hao11C
	movea.w		($b0,A6),A0
	movea.w		($b2,A0),A0		；5号11C地址移到A0
	tst.b		($0,A0)
	beq			_3hao11C
	jsr			$455ec
	bcs			_455e2
_3hao11C
	movea.w		($b0,A6),A0		；跳转破坏的两个指令
	movea.w		($a4,A0),A0		；3号11C地址移到A0
	jmp			$455d0
_455e2
	jmp			$455e2



	


































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
