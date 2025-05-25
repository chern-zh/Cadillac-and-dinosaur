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
*-----------------------随机12C变身----------------------------------
	org		$5fffc
	jsr		_12c_4		/小类4时间、蹲守
	org		$5ffcc
	jsr		_12c_2		/小类2时间、站立
	org		$6030e
	jsr		_12c_12c		//变身
	
	
	
	
	
	
	org	$101c00
_boss_getengry
	move.w	D1,($6a,A6)	/原指令
	cmpi.w	#$120,($20,A6)	/是否6BOSS幼体
	beq	_gdmsjc		/是，直接10行血	
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
_78guanjxjc
	cmpi.b	#$3,($786,A5)	/是否78关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$11c,($20,A6)	/是否11c
	beq	_gdmsjc		/是，跳到关底加血
	cmpi.w	#$178,($20,A6)	/是否178
	beq	_gdmsjc		/是，跳到关底加血	
	cmpi.w	#$150,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addq.b	#1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血	
_1guanjxjc
	cmpi.b	#$2,($786,A5)	/是否1关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$48,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addq.b	#1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_2guanjxjc
	cmpi.b	#$2,($786,A5)	/是否2关底
	bne	_no_gdmsjc	/非关底，加血
	cmpi.w	#$f4,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addq.b	#1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_3guanjxjc
	cmpi.w	#$2ccc,($744,A5)	/是否3关底
	bls	_no_gdmsjc	/非关底，加血
	cmpi.w	#$7c,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addq.b	#1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_4guanjxjc
	cmpi.b	#$2,($786,A5)	/是否4关底
	bne	_no_gdmsjc	/非关底，加血
	;cmpi.w	#$200,($744,A5)	/是否4关底
	;bls	_no_gdmsjc	/非关底，加血	
	cmpi.w	#$64,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addq.b	#1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_5guanjxjc
	cmpi.w	#$D80,($744,A5)	/是否5关底
	bls	_no_gdmsjc	/非关底，加血
	cmpi.w	#$A0,($20,A6)	/是否90
	beq	_gdmsjc		/是，跳到关底加血	
	cmpi.w	#$90,($20,A6)	/是否主BOSS
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	addq.b	#1,($7fd2,A5)	/是，主BOSS个数+1
	bra	_gdmsjc		/主BOSS加血
_6guanjxjc
	cmpi.b	#$2,($786,A5)	/是否6关底
	bne	_no_gdmsjc	/非关底，加血	
	cmpi.w	#$10,($20,A6)	/是否主BOSS非幼体
	bne	_ty_gdmsjc	/否，跳到通用关底加血
	bra	_gdmsjc		/主BOSS加血
	
*-------------------轻量模式加血，走原指令------------------------------
_easy_plus
	move.w	D0,($6c,A6)
	rts
*--------------------非关底BOSS加血---------------------------------------	
_no_gdmsjc
	cmpi.w	#$11c,($20,A6)
	beq	_noplus1
	cmpi.w	#$64,($20,A6)
	beq	_noplus1
	cmpi.w	#$7c,($20,A6)
	beq	_noplus1
	cmpi.w	#$10,($20,A6)
	beq	_noplus1	
	addq.b	#1,($7fe0,A5)		/BOSS清版+1		
_noplus1	
	move.w	#$12c,($6c,A6)
	moveq	#0,D0
	move.b	($7f18,A5),D0
	mulu.w	#$32,D0
	add.w	D0,($6c,A6)
	rts
	
*--------------------通用关底BOSS加血---------------------------------------	
_ty_gdmsjc
	move.w	#$320,($6c,A6)
	moveq	#0,D0
	move.b	($7f18,A5),D0
	mulu.w	#$64,D0
	add.w	D0,($6c,A6)
	rts		
;--------------------主关底BOSS加血-------------------------------------------	
_gdmsjc
	tst.b	($7f88,A5)
	beq	_easy_plus
	move.w	#$320,($6c,A6)
	moveq	#0,D0
	move.b	($7f18,A5),D0
	mulu.w	#$64,D0
	add.w	D0,($6c,A6)
	rts	
	
;-----------------------6BOSS非幼体加血-----------------------------------
_6bossno
	move.w	#$190,($6c,A6)
	moveq	#0,D0
	move.b	($7f18,A5),D0
	mulu.w	#$32,D0
	add.w	D0,($6c,A6)
	rts
*--------------------------------小兵加血-----------------------------------
_xbjx
	move.w	D1,($6a,A6)
	cmpi.w	#$18,($20,A6)
	beq	_jyg18
	cmpi.w	#$48,($20,A6)
	beq	_jyg48_c
	cmpi.w	#$c,($20,A6)
	beq	_jyg48_c
	;cmpi.w	#$50,($20,A6)
	;beq	_50hzjx
	move.w	D0,($6c,A6)
	rts	
_50hzjx
	;move.w	#$64,($6a,A6)
	;move.w	($6a,A6),($6c,A6)
	;rts
_jyg18
	tst.b	($7f18,A5)
	beq	_jyc8
_jyfa
	move.w	#$fa,($6c,A6)
	rts	
_jyc8
	move.w	#$c8,($6c,A6)
	rts
_jyg48_c
	tst.b	($7f18,A5)
	beq	_jyfa
	move.w	#$12c,($6c,A6)
	rts
;====================================随机副BOSS变身==================================================
_12c_4
	cmpi.b		#$5,($4d9,A5)	/是否6关
	beq		_6time4
	cmpi.b		#$7,($4d9,A5)	/是否8关
	beq		_8time4
	cmpi.b		#$1,($4d9,A5)	/是否2关
	beq		_2time4
	cmpi.b		#$3,($4d9,A5)
	beq		_4time4
_time4	
	move.w		#$1f0,($b2,A6)
	rts

_6time4
	move.w		#$1f4,($b2,A6)
	rts
_8time4
	move.w		#$f0,($b2,A6)
	rts
_2time4
	cmpi.b		#$2,($786,A5)
	beq		_time4
	move.w		#$100,($b2,A6)
	rts
_4time4
	move.w		#$f0,($b2,A6)
	rts
;--------------------------------------------------------------------------

_12c_2
	cmpi.b		#$5,($4d9,A5)	/是否6关
	beq		_6time2
	cmpi.b		#$7,($4d9,A5)	/是否8关
	beq		_8time2
	cmpi.b		#$1,($4d9,A5)	/是否2关
	beq		_2time2
	cmpi.b		#$3,($4d9,A5)	/是否4关
	beq		_4time2
_time2	
	move.w		#$280,($b2,A6)
	rts

_6time2
	move.w		#$320,($b2,A6)
	rts
_8time2
	move.w		#$f0,($b2,A6)
	rts
_4time2
	move.w		#$f0,($b2,A6)
	rts
_2time2
	cmpi.b		#$2,($786,A5)
	beq		_time2
	move.w		#$100,($b2,A6)
	rts
;-------------------------------------12C变身随机副BOSS-------------------------------------		
_12c_12c	
	tst.b		($4d9,A5)
	beq		_1fuBOSS
	cmpi.b		#$1,($4d9,A5)
	beq		_2fuBOSS
	cmpi.b		#$3,($4d9,A5)
	beq		_4fuBOSS
	cmpi.b		#$4,($4d9,A5)
	beq		_5fuBOSS
	cmpi.b		#$5,($4d9,A5)
	beq		_6fuBOSS
	cmpi.b		#$7,($4d9,A5)
	beq		_8fuBOSS
_1fuBOSS	
	movem.l		D0,-(A7)
	jsr		$119c
	divu.w		#$7,D0				;取余，限制范围
	swap		D0
	mulu.w		#$2,D0	
	move.w		_FBdata1(PC,D0),($20,A0)		;取下表中随机一个副BOSS	
	move.w		#$0,($26,A0)
	move.b		#$1,($96,A0)			/补给，龙虾
	movem.l		(A7)+,D0
	rts	
_FBdata1
	dc.w		$0150,$0178,$0090,$00f4,$00a0,$0064,$011c

_2fuBOSS	
	cmpi.b		#$2,($786,A5)
	bne		_cycle_change
	movem.l		D0,-(A7)
	jsr		$119c
	andi.w		#$3,D0				;取余，限制范围
	mulu.w		#$2,D0	
	move.w		_FBdata2(PC,D0),($20,A0)		;取下表中随机一个副BOSS	
	move.w		#$0,($26,A0)
	move.b		#$1,($96,A0)			/补给，
	movem.l		(A7)+,D0
	rts	
_FBdata2
	dc.w		$0150,$0178,$0090,$00a0,$0064,$011c
	
_cycle_change				*模式3，2关河畔变身杂兵
	movem.l		D0,-(A7)
_cycle_change1
	moveq		#$0,D0
	jsr		$119c
	andi.w		#$3,D0				;取余，限制范围
	mulu.w		#$4,D0	
	move.w		_Fdata2(PC,D0),($20,A0)		;取下表中随机一个副BOSS
	addq.w		#$2,D0	
	move.w		_Fdata2(PC,D0),($26,A0)
	move.b		#$0,($96,A0)			/补给，
	cmpi.w		#$50,($20,A0)
	bne		_nohz
	addq.b		#$1,($7f40,A5)
	cmpi.b		#$3,($7f40,A5)
	bge		_cycle_change1	
_nohz
	movem.l		(A7)+,D0
	rts	
_Fdata2
	dc.w		$0008,$0402,$0050,$020a,$0018,$0000,$0038,$020a
_4fuBOSS	
	movem.l		D0,-(A7)
	jsr		$119c
	divu.w		#$6,D0				;取余，限制范围
	swap		D0
	mulu.w		#$2,D0	
	move.w		_FBdata4(PC,D0),($20,A0)		;取下表中随机一个副BOSS	
	move.w		#$0,($26,A0)
	move.b		#$1,($96,A0)			/补给，
	movem.l		(A7)+,D0
	rts	
_FBdata4
	dc.w		$0150,$0178,$0090,$00f4,$00a0,$011c
	
_5fuBOSS	
	movem.l		D0,-(A7)
	jsr		$119c
	divu.w		#$5,D0				;取余，限制范围
	swap		D0
	mulu.w		#$2,D0	
	move.w		_FBdata5(PC,D0),($20,A0)		;取下表中随机一个副BOSS	
	move.w		#$0,($26,A0)
	move.b		#$1,($96,A0)			/补给，
	movem.l		(A7)+,D0
	rts	
_FBdata5
	dc.w		$0150,$0178,$00f4,$0064,$011c

_6fuBOSS	
	move.w		#$48,($20,A0)
	move.w		#$200,($26,A0)
	rts

_8fuBOSS	
	movem.l		D0,-(A7)
	jsr		$119c
	divu.w		#$5,D0				;取余，限制范围
	swap		D0
	mulu.w		#$2,D0	
	move.w		_FBdata8(PC,D0),($20,a0)	;取下表中随机一个副BOSS	
	move.w		#$0,($26,A0)
	move.b		#$1,($96,A0)			/补给，
	movem.l		(A7)+,D0
	rts	
_FBdata8
	dc.w		$0090,$00f4,$00a0,$0064,$011c













*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
