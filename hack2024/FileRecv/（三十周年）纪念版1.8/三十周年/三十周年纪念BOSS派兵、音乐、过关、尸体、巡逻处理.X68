*-------------BOSS处理程序------------------------
*----------------1BOSS过关个数处理-----------------------
	org	$45dc2
	jsr	$18d000
	org	$18d000
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg1
	jsr	$acee
_nogg1	
	rts
*----------------2BOSS，音乐、派兵、过关、尸体处理---------------
	org	$59e08		/派兵
	jsr	$18d100
	org	$18d100
	cmpi.b	#$1,($4d9,A5)
	bne	_nopb2
	cmpi.b	#$2,($786,A5)
	bne	_nopb2
	jsr	$81df8
_nopb2
	rts

	org	$59e16		/音乐
	jsr	$18d130
	org	$18d130
	cmpi.b	#$1,($4d9,A5)
	bne	_nomusic2	
	cmpi.b	#$2,($786,A5)
	bne	_nomusic2	
	jsr	$77de
_nomusic2
	rts

	org	$5bb6e		/过关
	jsr	$18d160
	org	$18d160
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
	
	
	org	$59f04		/屠夫不掉刀
	jmp	$59f54


*----------------3BOSS，音乐、派兵、过关、尸体处理---------------
	org	$4fe12		/派兵
	jmp	$18d200		/3BOSS派兵为jmp
	org	$18d200
	cmpi.b	#$2,($4d9,A5)
	bne	_nopb3
	;cmpi.w	#$2ccc,($744,A5)
	;bls	_nopb3
	jmp	$81df8
_nopb3
	rts

	org	$4fde0		/音乐
	jsr	$18d230
	org	$18d230
	cmpi.b	#$2,($4d9,A5)
	bne	_nomusic3
	;cmpi.w	#$2ccc,($744,A5)
	;bls	_nomusic3
	jsr	$77de
_nomusic3
	rts

	org	$50336		/过关
	jsr	$18d260
	org	$18d260
	cmpi.b	#$2,($4d9,A5)
	bne	_nogg3	
	;cmpi.w	#$2ccc,($744,A5)
	;bls	_nogg3
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg3	
	jsr	$acee
_nogg3
	rts
*----------------4BOSS，音乐、派兵、过关、尸体处理---------------
	org	$4bfc6		/派兵
	jsr	$18d300
	org	$18d300	
	cmpi.b	#$3,($4d9,A5)
	bne	_nopb4
	cmpi.b	#$2,($786,A5)
	bne	_nopb4	
	jsr	$81df8
	rts
_nopb4
	rts


	org	$4bfba			/4BOSS出场音乐
	jsr	_4Bccyy

	org	$4bf4c			/4BOSS对话音乐
	jsr	_4Bdhyy	
		
	org	$18d400
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

	org	$7796			/4BOSS死亡音乐
	jmp	$18d500
	org	$18d500
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


	org	$4c89a		/过关
	jsr	$18d600
	org	$18d600
	cmpi.b	#$3,($4d9,A5)
	bne	_nogg4	
	cmpi.b	#$2,($786,A5)
	bne	_nogg4
	subq.b	#1,($7fd2,A5)	/清除一个主BOSS
	bne	_nogg4	
	jsr	$acee
	rts
_nogg4
	;jsr	_jc_minus1
	;move.w	#$28,($20,A6)	/尸体消失
	;move.w	#$0,($26,A6)	
	rts

*----------------马云，音乐、派兵、震死小兵---------------
	org	$5178a		/派兵
	jsr	$18d700
	org	$18d700
	cmpi.b	#$4,($4d9,A5)
	bne	_nopb5
	cmpi.w	#$1100,($744,A5)
	bls	_nopb5
	jsr	$81df8
_nopb5
	rts

	org	$51772		/音乐
	jsr	$18d730
	org	$18d730
	cmpi.b	#$4,($4d9,A5)
	bne	_nomusic5
	cmpi.w	#$1100,($744,A5)
	bls	_nomusic5
	jsr	$77de
_nomusic5
	rts

	org	$52d28		/震死小兵
	jmp	$18d760
	org	$18d760
	cmpi.b	#$4,($4d9,A5)
	bne	_52d36	
	cmpi.w	#$1100,($744,A5)
	bls	_52d36
	move.b	#$2,($50e,A5)
	beq	_52d3a
_52d36
	jmp	$52d36
_52d3a
	jmp	$52d3a
*----------------5BOSS，音乐、派兵、过关、尸体处理---------------
	org	$53e64		/派兵
	jsr	$18d800
	org	$18d800
	cmpi.b	#$4,($4d9,A5)
	bne	_nopb55
	cmpi.w	#$1100,($744,A5)
	bls	_nopb55
	jsr	$81df8
_nopb55
	rts

	org	$5574e		/过关
	jsr	$18d860
	org	$18d860
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

*----------------6BOSS，音乐、派兵、过关、清版+1、-1--------------------------
	org	$36ac2		/派兵
	jsr	$18d900
	org	$18d900
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

	org	$36a9e		/音乐
	jsr	$18d930
	org	$18d930
	cmpi.b	#$5,($4d9,A5)
	bne	_nomusic6
	cmpi.b	#$2,($786,A5)
	bne	_nomusic6
	jsr	$77de
_nomusic6
	rts

	org	$38c30		/6BOSS非幼体过关
	jsr	_6b_noyt
	org	$5fc68		/6BOSS幼体过关
	jsr	_6b_noyt
	
	org	$18d950
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
	
;取消6B慢动作、震死小兵
	org		$38c12		/慢动作NOP掉
	jsr		$18da00	
	nop		
	nop
	nop
	org		$18da00
	cmpi.b		#$5,($4d9,A5)
	bne		_nozs6	
	cmpi.b		#$2,($786,A5)
	bne		_nozs6
	tst.b		($7f88,A5)
	bne		_nozs6
	move.b		#$2,($50e,A5)		
_nozs6
	rts	
	

;-----------------------------取消打死178慢动作、变身、清版-1--------------------------------
	org	$6be7a
	jsr	$18db00
	org	$18db00
	cmpi.b	#$3,($786,A5)
	bne	_nomusic178
	jsr	$77de
_nomusic178
	rts		

	org	$6cd3a			/178慢动作
	nop
	nop
	nop
	
	org     	$6ce06			/178变身坐标
	nop
	bra	$6ce1e
		
	org	$6cef8			/加载大龙
	jsr	$18db30
	org	$18db30		
	clr.w	($26,A0)
	jsr	_jc_minus1
	rts
	
	org	$64f54			/大龙音乐
	jsr	$18db60
	org	$18db60
	cmpi.b	#$3,($786,A5)
	bne	_nomusic8
	jsr	$77de
_nomusic8
	rts	

	org	$6501c			/大龙派兵
	jsr	$18db90
	org	$18db90
	cmpi.b	#$3,($786,A5)
	bne	_nopb8
	jsr	$81df8
_nopb8
	rts

	org	$66b64			/大龙过关、清版-1
	jsr	$18dbc0
	org	$18dbc0
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

		
;===================================幻影与4B修复================================
;幻影死亡飞镖BUG修复
	org	$8598C
	jmp	$18de00
	org	$18de00
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

	ORG	$5e4a4
	jmp	$18de40			/幻影修复
	ORG	$18de40
	cmpi.b	#$6,($4d9,A5)
	bne	_7xf_
	cmpi.b	#$3,($786,A5)
	bne	_7xf_    
	jsr	$1862
	jmp	$5e4aa
_7xf_
	jmp	$5e49e

		

    	ORG    $4c386
    	jmp    $18de70		/修复
    	ORG    $18de70
    	cmpi.b #$3,($4d9,A5)
    	bne    _4Bxf_
    	cmpi.b #$2,($786,A5)
    	bne    _4Bxf_   
    	jsr    $1862
    	jmp    $4c38c
_4Bxf_
    	jmp    $4c380

;飞镖调节
	org	$47730
	jmp	$18deb0
	org	$18deb0
	cmpi.b	#$6,($4d9,A5)
	bne	_47738
	cmpi.b	#$3,($786,A5)
	bne	_47738
	jmp	$47742
_47738
	jmp	$47738
*--------------------------BOSS尸体处理----------------------------------
*-------------------------幻影尸体消失、马云清版-1，变身相关----------------------------------------------
        	ORG	$2aec6		/前端
        	jsr	_change_begin
	org	$52e64			
	jsr	_change_end	/后端        	
        	
        	org    $18f600
_change_begin
        	move.b  #$1, ($0,A6)		;原来跳转破环的指令
	cmpi.w  #$11c, ($20,A6)          ;优先处理幻影
	beq     _11csht
	cmpi.w  #$90, ($20,A6)          ;优先处理马云
	beq     _90sht
	cmpi.w  #$64, ($20,A6)          ;是否4B
	beq     _64sht
	cmpi.w  #$f4, ($20,A6)          ;是否屠夫
	beq     _f4sht
	cmpi.w  #$A0, ($20,A6)          ;是否铁龙
	beq     _A0sht
	cmpi.w  #$16C, ($20,A6)          ;16C
	beq     _bsjc
	cmpi.w  #$18, ($20,A6)          ;狮子
	beq     _bsjc	
	cmpi.b  #$9, ($3,A6)          ;是否猴子2
	beq     _bsjc
	cmpi.b	#$1A,($3,A6)	/马甲3
	beq	_bsjc
	cmpi.b	#$D,($3,A6)	/大个子
	beq	_bsjc	
	cmpi.b	#$14,($3,A6)	/刀柄
	beq	_bsjc
	rts
_64sht
	cmpi.b	#$3,($4d9,A5)
	bne	_bsjc	
	cmpi.b	#$2,($786,A5)
	bne	_huan_ID
	cmpi.w	#$300,($744,A5)
	ble	_huan_ID
	rts		
_11csht
	cmpi.b	#$6,($4d9,A5)
	bne	_bsjc	
	cmpi.b	#$3,($786,A5)
	bne	_huan_ID
	rts	
_f4sht
	cmpi.b	#$1,($4d9,A5)
	bne	_huan_ID
	cmpi.b	#$2,($786,A5)
	bne	_huan_ID
	rts		
_A0sht
	cmpi.b	#$4,($4d9,A5)
	bne	_bsjc
	cmpi.w	#$1100,($744,A5)
	ble	_huan_ID
_shtrts	
	rts		
_90sht
	cmpi.b	#$4,($4d9,A5)
	bne	_90_minus
	cmpi.w	#$1100,($744,A5)
	ble	_90_minus
	rts
_90_minus
	jsr	_jc_minus1
_bsjc
	tst.b	($7f88,A5)	/是否模式三
	beq	_huan_ID
	cmpi.b	#$1,($4d9,A5)	/2关
	bne	_huan_ID
	cmpi.w	#$b00,($744,A5)	/检测卷轴是否岸边
	bls	_huan_ID
	cmpi.w	#$16c,($20,A6)
	bne	_changeid
	addq.b	#1,($7fe0,A5)
_changeid
	move.w  #$90, ($20,A6)          ;将尸体换成马云的ID，进行变身
	rts		
_huan_ID
	cmpi.w	#$18,($20,A6)		*排除狮子
	beq	_clr18
	move.w	#$28,($20,A6)			;把敌兵尸体换ID，尸体消失
	move.w  	#$0, ($26,A6)
_clr18
	rts	
;------------------------------后端------------------------------------------------------- 
_change_end
	clr.w		($de,A6)			;清楚色板缓存
	cmpi.b		#$4,($4d9,A5)			;优先检测是否5关关底
	bne		_bsmmjc				;
	cmpi.w		#$1100,($744,A5)
	bls		_bsmmjc
_5ga0	
	move.w		#$A0,($20,A6)		/5关底，变身铁头龙
	move.w		#$0,($26,A6)
	rts		
_bsmmjc
	cmpi.b		#$9,($3,A6)		/猴子2
	beq		_change_hz
	cmpi.b		#$1a,($3,A6)		/马甲3
	beq		_change_mj
	cmpi.b		#$10,($3,A6)		/狮子
	beq		_change_sz
	cmpi.b		#$23,($3,A6)		/16C
	beq		_change_16C
	cmpi.b		#$5,($3,A6)		/4BOSS
	beq		_change_4B
	cmpi.b		#$18,($3,A6)		/幻影
	beq		_change_11C
	cmpi.b		#$d,($3,A6)		/大个子
	beq		_change_dgz
	cmpi.b		#$15,($3,A6)		/马云
	beq		_change_my
	cmpi.b		#$16,($3,A6)		/铁头龙
	beq		_change_A0
	cmpi.b		#$14,($3,A6)		/刀手
	beq		_change_dbing	
	bra		_5ga0	
_change_hz
	move.w		#$90,($20,A6)		/猴子变身马云
	move.w		#$0,($26,A6)
	move.b		#$36,($96,A6)		/补给16%血
	rts
_change_dbing
	move.w		#$64,($20,A6)		/刀兵变身4BOSS64
	move.w		#$0,($26,A6)
	move.b		#$36,($96,A6)		/补给16%血
	rts
_change_mj
	move.w		#$48,($20,A6)		/马甲变身大个子
	move.w		#$200,($26,A6)
	move.b		#$3a,($96,A6)		/补给32血
	rts
_change_sz
	move.w		#$16c,($20,A6)		/狮子变身16C
	move.w		#$0,($26,A6)
	move.b		#$e,($96,A6)		/补给16%血
	rts
_change_16C
	move.w		#$10,($20,A6)		/16C变身3阶6BOSS
	move.w		#$0,($26,A6)
	;addi.b		#$1,($7fe0,A5)		*3阶6BOSS需要这里手动清版+1		/加在了变身前端，防止过场
	rts
_change_4B
	move.w		#$11c,($20,A6)		/4B变身11C
	move.w		#$0,($26,A6)
	move.b		#$37,($96,A6)		/补给16%血
	rts
_change_11C
	move.w		#$148,($20,A6)		/11C变身翼龙
	move.w		#$0,($26,A6)
	rts
_change_dgz
	move.w		#$7c,($20,A6)		/大个子变身3BOSS
	move.w		#$0,($26,A6)
	rts
_change_my
	move.w		#$A0,($20,A6)		/马云变身铁头龙
	move.w		#$0,($26,A6)
	move.b		#$37,($96,A6)		/补给32%血
	rts	
_change_A0
	move.w		#$150,($20,A6)		/A0变身150
	move.w		#$0,($26,A6)
	rts



*----------------------------取消单只BOSS死不动，慢动作--------------------------------
		org		$778c	/正常走此指令，打死单只BOSS后不能动，不无敌	;
		jmp		$18f900
		org		$18f900
		cmpi.b		#$1,($7fd4,A5)
		bge		_clrg1
		rts
_clrg1
		clr.b		($7fd4,A5)
		move.w		#$ff07, D0
		move.l		#$4440000,D1
		jmp		$7796

		
		org		$81fea	;仅派兵BOSS触发此指令，不走此指令，打死BOSS后依旧能动					
		jmp		$18f980
		org		$18f980
		move.b		#$6,($4,A6)
		cmpi.b		#$1,($7fd6,A5)
		bge		_clrg2
		rts
_clrg2
		clr.b		($7fd6,A5)
		jmp		$81ff0	


*---------------------------------------------------------------------------------
	org	$acee
	jmp	$18fa00
	org	$18fa00
	;cmpi.b	#$6,($4d9,A5)
	;bne	_no_english
	;movem.l	D0-D3/A0-A3,-(A7)	
	;lea	$90a0a4,A1		/90a6ec，6表示左右位置，ec表示上下位置
	;lea	$183f00,A0
	;jsr	$c0a
	;movem.l	(A7)+,D0-D3/A0-A3	
_no_english
	addq.b	#1,($7fd4,A5)
	addq.b	#1,($7fd6,A5)
	move.b	#$1,($4d4,A5)
	jmp	$acf4


*--------------------通用关底检测BOSS-1---屠夫、4B、铁头、大龙、马云、178------------------------------------------
	org	$18fb00
_jc_minus1
	cmpi.b	#$3,($786,A5)	/仅7、8两关有第4场景
	beq	_no_minus		
_6_minus1
	cmpi.b	#$5,($4d9,A5)
	bne	_5_minus1
	cmpi.b	#$2,($786,A5)
	bne	_minus
	cmpi.w	#$f20,($744,A5)
	bls	_minus	
	bra	_no_minus
_5_minus1
	cmpi.b	#$4,($4d9,A5)
	bne	_4_minus1
	cmpi.w	#$1000,($744,A5)	
	bge	_no_minus	
	bra	_minus	
_4_minus1
	cmpi.b	#$3,($4d9,A5)
	bne	_2_minus1
	cmpi.b	#$2,($786,A5)	
	bne	_minus
	cmpi.w	#$200,($744,A5)
	bls	_minus
	bra	_no_minus		
_2_minus1
	cmpi.b	#$1,($4d9,A5)
	bne	_minus
	cmpi.b	#$2,($786,A5)	
	beq	_no_minus
_minus
	subq.b	#$1,($7fe0,A5)	/BOSS清版-1
_no_minus	
	rts


*========================================================================================
*==================变身及动作，日版=======================
		org			$52e02		*移动动作
		jsr			_begin_act
		org			$52e34		*终止动作
		jsr			_end_act
		
		org			$18fc00
_begin_act
		cmpi.b		#$9,($3,A6)		*是否猴子2
		beq			_hz_b_a
		cmpi.b		#$14,($3,A6)		*是否刀柄2
		beq			_dbb_b_a
		cmpi.b		#$d,($3,A6)		*大个子
		beq			_dg_b_a	
		cmpi.b		#$5,($3,A6)		*对比变身4B密码
		beq			_4B_b_a
		cmpi.b		#$18,($3,A6)		*幻影
		beq			_4B_b_a
		cmpi.b		#$1A,($3,A6)		*马甲
		beq			_mj_b_a
		cmpi.b		#$23,($3,A6)		*16C
		beq			_16C_b_a
		cmpi.b		#$10,($3,A6)		*狮子
		beq			_sz_b_a
		jsr			$120e
		rts
_hz_b_a
		moveq		#$8,D0
		jsr			$120e
		rts
_dbb_b_a
		moveq		#$10,D0
		jsr			$120e
		rts
_dg_b_a
		moveq		#$6,D0
		jsr			$120e
		rts
_4B_b_a
		moveq		#$c,D0
		jsr			$120e
		rts
_mj_b_a
		moveq		#$c,D0
		jsr			$120e
		rts
_16C_b_a
		moveq		#$a,D0
		jsr			$120e
		rts
_sz_b_a
		moveq		#$b,D0
		jsr			$120e
		rts
*===================================		
_end_act
		cmpi.b		#$9,($3,A6)		*是否猴子2
		beq			_hz_e_a
		cmpi.b		#$14,($3,A6)		*是否刀柄2
		beq			_dbb_e_a
		cmpi.b		#$d,($3,A6)		*对比变身大个子密码
		beq			_dg_e_a		
		cmpi.b		#$5,($3,A6)		*对比变身4B密码
		beq			_4B_e_a
		cmpi.b		#$18,($3,A6)		*幻影
		beq			_4B_e_a
		cmpi.b		#$1A,($3,A6)		*马甲
		beq			_mj_e_a
		cmpi.b		#$23,($3,A6)		*16C
		beq			_16C_e_a
		cmpi.b		#$10,($3,A6)		*狮子
		beq			_sz_e_a
		jsr			$120e
		rts
_hz_e_a
		moveq		#$8,D0
		jsr			$120e
		rts
_dbb_e_a
		moveq		#$10,D0
		jsr			$120e
		rts		
_dg_e_a
		moveq		#$5,D0
		jsr			$120e
		rts
_4B_e_a
		moveq		#$9,D0
		jsr			$120e
		rts
_mj_e_a
		moveq		#$c,D0
		jsr			$120e
		rts		
_16C_e_a
		moveq		#$11,D0
		jsr			$120e
		rts		
_sz_e_a
		moveq		#$b,D0
		jsr			$120e
		rts	










































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
