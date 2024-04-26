

	
	
	
	
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













*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
