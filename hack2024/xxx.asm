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
	move.b	#$1,($4d4,A5)
	jmp	$acf4
	
*--------------------通用关底检测BOSS-1---屠夫、4B、铁头、大龙、马云、178------------------------------------------

_jc_minus1
	cmpi.b	#$6,($741,A5)		;是否关底
	beq	_no_minus		
	subq.b	#$1,($7fe0,A5)	/BOSS清版-1
_no_minus	
	rts





	
	