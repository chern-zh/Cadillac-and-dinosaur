;------------------------------多模式BOSS加血------------------------

	org	$31d76
	jsr	$101c00
	org	$101c00
	move.w	D1,($6a,A6)	/原指令
	cmpi.w	#$120,($20,A6)	/是否6BOSS幼体
	beq	_boss3e8		/是，直接10行血	
	tst.b	($4d9,A5)		/是否1关
	beq	_1guanjxjc	
	cmpi.b	#$1,($4d9,A5)      
	beq	_2guanjxjc
	cmpi.b	#$2,($4d9,A5)      
	beq	_3guanjxjc
	cmpi.b	#$3,($4d9,A5)      
	beq	_4guanjxjc
	cmpi.b	#$4,($4d9,A5)      
	beq	_5guanjxjc
	cmpi.b	#$5,($4d9,A5)      
	beq	_6guanjxjc
	cmpi.b	#$6,($4d9,A5)      
	beq	_7guanjxjc	
_8guanjxjc
	cmpi.b	#$3,($786,A5)	/是否8关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$178,($20,A6)	/是否178
	beq	_gdmsjc		/是，跳到关底加血	
	cmpi.w	#$150,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addi.b	#$1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血	
_1guanjxjc
	cmpi.b	#$2,($786,A5)	/是否1关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$48,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addi.b	#$1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_2guanjxjc
	cmpi.b	#$2,($786,A5)	/是否2关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$f4,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addi.b	#$1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_3guanjxjc
	cmpi.w	#$2ccc,($744,A5)	/是否3关底
	bls	_no_gdmsjc	/非关底，加血
	cmpi.w	#$7c,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addi.b	#$1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_4guanjxjc
	cmpi.b	#$2,($786,A5)	/是否4关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$200,($744,A5)	/是否4关底
	bls	_no_gdmsjc	/非关底，加血	
	cmpi.w	#$64,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addi.b	#$1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_5guanjxjc
	cmpi.w	#$1100,($744,A5)	/是否5关底
	bls	_no_gdmsjc	/非关底，加血
	cmpi.w	#$90,($20,A6)	/是否90
	beq	_gdmsjc		/是，跳到关底加血	
	cmpi.w	#$A0,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addi.b	#$1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_6guanjxjc
	cmpi.b	#$2,($786,A5)	/是否6关底
	bne	_no_gdmsjc	/非关底，加血	
	cmpi.w	#$10,($20,A6)	/是否主BOSS非幼体
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	bra	_gdmsjc		/主BOSS加血
_7guanjxjc
	cmpi.b	#$3,($786,A5)	/是否7关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$11c,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	bra	_gdmsjc		/主BOSS加血
	
*--------------------非关底BOSS加血---------------------------------------	
_no_gdmsjc
	cmpi.w	#$11c,($20,A6)
	beq	_noplus1
	cmpi.w	#$7c,($20,A6)
	beq	_noplus1
	cmpi.w	#$10,($20,A6)
	beq	_noplus1	
	addq.b	#$1,$ffffe0		/BOSS清版+1		
_noplus1
	cmpi.b	#$1,($7f88,A5)
	beq	_ms1_nogdjx
	cmpi.b	#$2,($7f88,A5)
	beq	_ms2_nogdjx
	cmpi.b	#$3,($7f88,A5)
	beq	_ms3_nogdjx
_ms4_nogdjx	
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_boss12c
	cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	beq	_boss15e
	bra	_boss190	
_ms1_nogdjx	
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_boss12c
	cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	beq	_boss15e
	bra	_boss190	
_ms2_nogdjx
	bra	_ms1_nogdjx	/模式2和模式1相同
_ms3_nogdjx	
	movem.l	D0,-(A7)
	clr.l   D0
	jsr	$119c                   ;进入随机程序
        	andi.w	#$3,D0			;随机数在D0里，求余,限制范围( )
	mulu.w  	#$2,D0                       ;乘个2，变为偶数
	move.w	_ms3nogdxldata(PC,D0),($6c,A6)	;取下表中随机一个血量
        	move.w  ($6c,A6),($6e,A6)        		
	movem.l (A7)+,D0			
        	rts
_ms3nogdxldata
        dc.w    $015e,$0190,$01c2,$015e	*350,350,400,450

_bossc8
	move.w	#$c8,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
_boss118
	move.w	#$118,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts	
_boss12c	
	move.w	#$12c,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
_boss15e
	move.w	#$15e,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
	       
_boss190	
	move.w	#$190,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
_boss1f4	
	move.w	#$1f4,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
		
*--------------------通用关底BOSS加血---------------------------------------	
_ty_gdmsjc
	cmpi.b	#$2,($7f88,A5)
	beq	_ms2_tygdjx
	cmpi.b	#$3,($7f88,A5)
	beq	_ms3_tygdjx
_ms4_tygdjx
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_boss190
	bra	_boss1f4

_ms2_tygdjx		;1.5行、2行、2.5行
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_boss96
	cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	beq	_bossc8
	bra	_bossfa

_ms3_tygdjx		;非8关底随机1.5、2、2.5，8关底8行
	;cmpi.b	#$7,($4d9,A5)
	;bne	_ms3sjjx
	;cmpi.b	#$3,($786,A5)
	;bne	_ms3sjjx
	move.w	#$320,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts	
_ms3sjjx	
	movem.l	D0,-(A7)
	clr.l   D0
	jsr	$119c                   ;进入随机程序
        	divu.w	#$6,D0			;随机数在D0里，求余,限制范围( )
	swap	D0		    	;余数在高12位，交叉下
	mulu.w  #$2,D0                       ;乘个2，变为偶数
	move.w	_ms3tygdxldata(PC,D0),($6c,A6)	;取下表中随机一个血量
        	move.w  ($6c,A6),($6e,A6)        		
	movem.l (A7)+,D0			
        	rts
_ms3tygdxldata
        dc.w    $0096,$00c8,$00fa,$0096,$00c8,$00fa

_boss96	
	move.w	#$96,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts	
_bossfa	
	move.w	#$fa,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
_boss258	
	move.w	#$258,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts		
   ;------------------------------主关底BOSS加血-------------------------------------------	
_gdmsjc
	cmpi.b	#$1,($7f88,A5)
	beq	_ms1_gdjx
	cmpi.b	#$2,($7f88,A5)
	beq	_ms2_gdjx
	cmpi.b	#$3,($7f88,A5)
	beq	_ms3_gdjx
_ms4_gdjx
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_boss320
	cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	beq	_boss320
	bra	_boss384
_ms1_gdjx
	move.w	#$320,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts	
_ms2_gdjx
	cmpi.b	#$2,($7f18,A5)         ;检测玩家数量是否3人
	bne	_boss320
	bra	_boss3e8
_ms3_gdjx
	movem.l	D0,-(A7)
	clr.l	D0
	jsr	$119c                   ;进入随机程序
        	divu.w	#$6,D0			;随机数在D0里，求余,限制范围( )
	swap	D0		    	;余数在高12位，交叉下
	mulu.w  #$2,D0                       ;乘个2，变为偶数
	move.w	_ms3gdxldata(PC,D0),($6c,A6)	;取下表中随机一个血量
        	move.w  ($6c,A6),($6e,A6)        		
	movem.l (A7)+,D0			
        	rts
_ms3gdxldata
        dc.w    $0320,$03e8,$0384,$0320,$03e8,$0384
_boss320
	move.w	#$320,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
	
_boss3e8                                         ;关底3人   
	move.w  #$3e8,($6c,A6)	
	move.w  ($6c,A6),($6e,A6)
	rts     

_boss384                                        ;关底双人  
	move.w  #$384,($6c,A6)	
	move.w  ($6c,A6),($6e,A6)
	rts 
_boss2bc
	move.w  #$2bc,($6c,A6)	
	move.w  ($6c,A6),($6e,A6)
	rts	
	
*===================特殊场景、BOSS加血处理=====================================	
	org	$31d7c
	jsr	$183a00
	org	$183a00	
	cmpi.w	#$11c,($20,A6)
	beq	_11cts		/幻影特殊处理
	cmpi.w	#$150,($20,A6)
	beq	_150ts		/大龙特殊处理
	cmpi.w	#$64,($20,A6)
	beq	_64ts		/4BOSS特殊处理
	rts	
_64ts
	cmpi.b	#$2,($7f88,A5)
	bne	_jxrts	
	cmpi.b	#$6,($4d9,A5)
	bne	_jxrts		
	cmpi.b	#$3,($786,A5)
	bne	_jxrts	
	addi.b	#$1,($7fd2,A5)	/模式2，7关底4B个数+1
	move.w	#$320,($6c,A6)
	move.w  ($6c,A6),($6e,A6)
_jxrts
	rts	
_11cts		
	cmpi.b	#$6,($4d9,A5)
	bne	_jxrts
	cmpi.b	#$3,($786,A5)
	bne	_jxrts	
	cmpi.b	#$3,($7f88,A5)
	beq	_ms311cjx	
_ts320	
	move.w	#$320,($6c,A6)	
	move.w  ($6c,A6),($6e,A6)
	rts	
_ms311cjx	
	tst.b	($7f18,A5)
	beq	_ts320
	cmpi.b	#$1,($7f18,A5)
	beq	_ts384
_ts3e8	
	move.w	#$3e8,($6c,A6)	
	move.w  ($6c,A6),($6e,A6)
	rts			
_ts384	
	move.w	#$384,($6c,A6)	
	move.w  ($6c,A6),($6e,A6)
	rts		
_150ts		
	cmpi.b	#$7,($4d9,A5)
	bne	_jxrts		
	cmpi.b	#$3,($786,A5)
	bne	_jxrts
	cmpi.b	#$2,($7f88,A5)
	bne	_dl5dc	
	move.w	#$7d0,($6c,A6)		/20行血
	move.w  ($6c,A6),($6e,A6)
	rts	
_dl5dc	
	cmpi.b	#$3,($7f88,A5)
	beq	_ts3e8
	tst.b	($7f18,A5)
	beq	_ts3e8
	cmpi.b	#$1,($7f18,A5)
	beq	_4b0
	move.w	#$578,($6c,A6)		/14行血
	move.w  ($6c,A6),($6e,A6)
	rts	
_4b0	
	move.w	#$4b0,($6c,A6)		/12行血
	move.w  ($6c,A6),($6e,A6)
	rts	
	
;----------------------------6BOSS非幼体加血-------------------------------           
	ORG	$36a10
	jsr	$102000
	nop
	ORG	$102000
	cmpi.b	#$5,($4d9,A5)
	bne	_6bnogd
	cmpi.b	#$2,($786,A5)
	bne	_6bnogd
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_6boss190
	;cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	;beq	_6boss1f4
_6boss1f4
	move.w  #$1f4, ($6c,A6)        ;单人模式5行血
	move.w  ($6c,A6),($6e,A6)
	rts
			
_6bnogd	
	cmpi.b	#$1,($7f88,A5)
	beq	_ms1_6Bjx
	cmpi.b	#$2,($7f88,A5)
	beq	_ms2_6Bjx
	cmpi.b	#$3,($7f88,A5)
	beq	_ms3_6Bjx		
_ms4_6Bjx
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_6boss12c
	cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	beq	_6boss12c
	bra	_6boss12c
_ms1_6Bjx
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_6bossc8
	cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	beq	_6bossc8
	bra	_6boss12c
_ms2_6Bjx
	tst.b	($7f18,A5)         ;检测玩家数量是否1人
	beq	_6bossc8
	cmpi.b	#$1,($7f18,A5)         ;检测玩家数量是否2人
	beq	_6boss12c
	bra	_6boss12c
_ms3_6Bjx	
	cmpi.b	#$2,($7f18,A5)         ;检测玩家数量是否2人
	beq	_6boss1f4
_6boss190
	move.w  #$190,($6c,A6)        ;
	move.w  ($6c,A6),($6e,A6)
	rts

_6boss12c
	move.w  #$12c,($6c,A6)        ;
	move.w  ($6c,A6),($6e,A6)
	rts
_6bossc8
	move.w  #$c8,($6c,A6)        ;
	move.w  ($6c,A6),($6e,A6)
	rts
*--------------------------------小兵加血-----------------------------------
	org	$3137c
	nop
	jsr	$102180
	org	$102180
	cmpi.w	#$48,($20,A6)
	beq	_jyg
	cmpi.w	#$18,($20,A6)
	beq	_jyg18
	cmpi.w	#$c,($20,A6)
	beq	_jyg000
	cmpi.w	#$50,($20,A6)
	beq	_50hzjx
	cmpi.w	#$148,($20,A6)
	beq	_148yljx	
	move.w	D0,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts	
_50hzjx
	move.w	#$64,($6a,A6)
	move.w	($6a,A6),($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
_jyg18
	tst.b	($7f18,A5)
	beq	_jyc8
	bra	_jyfa
_jyg
	cmpi.b	#$4,($7f88,A5)
	bne	_jyg000
	tst.b	($4d9,A5)
	bne	_jyg000
	cmpi.b	#$2,($786,A5)
	bne	_jyg000
	move.w	#$64,($6a,A6)
	move.w	#$320,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts	
_jyg000	
	cmpi.b	#$2,($7f18,A5)
	bne	_jyfa
	;cmpi.b	#$1,($7f18,A5)
	;beq	_jy12c
_jy12c
	move.w	#$64,($6a,A6)
	move.w	#$12c,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
_jyfa
	move.w	#$64,($6a,A6)
	move.w	#$fa,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts	
_jyc8
	move.w	#$64,($6a,A6)
	move.w	#$c8,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts
_148yljx
	move.w	#$32,($6a,A6)
	move.w	#$32,($6c,A6)
	move.w	($6c,A6),($6e,A6)
	rts





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
