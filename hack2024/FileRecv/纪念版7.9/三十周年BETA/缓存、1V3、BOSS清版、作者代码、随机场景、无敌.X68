*--------------------电梯场景前景处理---------------------------
	org		$20702		/加载电梯场景时
	jsr		$182c00
	org		$182c00
	cmpi.b		#$1,($7f88,A5)	/是否模式1
	bne		_zcxh		/非模式1走原指令	
	move.b		#$2,($7f6a,A5)
_zcxh
	move.b		#$1,($4dc,A5)
	rts

;-----------------1V3相关--------------------------
	org	$3740
	jmp	$182c60
	org	$182c60
	move.b	#$2,($4ef,A5)       ;强制1V3模式
	move.b	D0,($7f18,A5)          ;将实际玩家数量放入ffff18
	rts
;------------------------------------开局、过场景、清空缓存---------------------------------
	org	$ad66		/开局清空缓存
	jsr	$182d00
	org	$182d00
	clr.l	($7fe0,A5)	/BOSS清版，E2大龙场景个数
	clr.l	($7f30,A5)	/随机关卡
	clr.l	($7f34,A5)	/随机关卡
	clr.l	($7f38,A5)	/随机关卡
	clr.l	($7f3c,A5)	/随机关卡
	clr.l	($7f20,A5)	/随机关卡，过关次数
	clr.l	($7f60,A5)	/随机场景
	clr.l	($7f64,A5)	/随机场景
	clr.l	($7f68,A5)	/随机场景
	clr.b	($7f99,A5)	/随机场景，次数
	clr.l	($7fd0,A5)	/D2，主BOSS个数
	clr.l	($7fd4,A5)	/单只BOSS死后不动标志位	
	clr.l	($7f40,A5)	/变身密码
	clr.l	($7f44,A5)	/变身密码
	clr.l	($7f48,A5)	/变身密码
	clr.l	($7f3c,A5)
	jsr	$5b88	
	rts

	org	$18a1a		/过场景
	jsr	$182e00
	org	$182e00
	cmpi.b	#$6,($4d9,A5)
	bne	_zczl	
	cmpi.b	#$3,($786,A5)
	bne	_zczl
	cmpi.b	#$2,($7f88,A5)
	beq	_no_guy
	cmpi.b	#$4,($7f88,A5)
	bne	_zczl
	tst.b	($7f18,A5)
	bne	_zczl		
_no_guy
	clr.l	$ffb328
	clr.l	$ffb4a8
	clr.l	$ffb628
_zczl
	clr.l	($7fe0,A5)	/BOSS清版，大龙个数
	clr.l	($7f40,A5)	/变身密码
	clr.l	($7f44,A5)	/变身密码
	clr.l	($7f48,A5)	/变身密码
	cmpi.b	#$4,($7f88,A5)	/模式4
	beq	_4nowudi	
	cmpi.b	#$3,($7f88,A5)	/模式3
	beq	_wudi	
	cmpi.b	#$2,($7f88,A5)	/模式2
	beq	_wudi
    	movem.l 		D0-D7/A0-A6,-(A7)	
    	jsr 		$5ace                   ;设置亮度   	
    	movem.l 		(A7)+,D0-D7/A0-A6
	bra		_wudi	
_4nowudi
	cmpi.b	#$7,($4d9,A5)
	bne	_nowudi
	cmpi.b	#$2,($786,A5)
	bne	_nowudi
_wudi
	move.b	#$2, ($0,A6)	/8.3场景加无敌
	move.w	#$198, ($ec,A6)
	rts	
_nowudi	
	move.b	#$1,($0,A6)	/原指令
_cjrts	
	rts

;-------------------------------------BOSS清版------------------------
        org 	$812e2                  ;监视小兵数量内存的指令
        jsr	$182400
        nop
        org	$182400
        move.b	($4f3,A5),D0
        add.b 	($7fe0,A5),D0
        movea.l	($a0,A6),A0
        cmpi.b	#$1,D0
        bge	_qbrts
	movem.l	D0-D3/A0-A3,-(A7)	
	lea	$90a8ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea	$1824c0,A0
	jsr	$c0a
	movem.l	(A7)+,D0-D3/A0-A3 
_qbrts
	rts
	org	$1824c0
	dc.w	$0148,$4143,$4B45,$4420,$4259,$2047,$6559,$7540
*----------------------------------------------------------------------


*----------------设置7关底为最终场景-------------------
	org	$ac00
	jmp	$182500
	org	$182500
	clr.w	($4d2,A5)
	cmpi.b	#$7,($4d9,A5)
	beq	_ggms	
	rts			/不是第8关，正常指令	
_ggms
	cmpi.b	#$1,($7f88,A5)	/是否模式1
	beq	_zj7tg		/是
	cmpi.b	#$4,($7f88,A5)	/是否模式4
	beq	_baoji39
	rts			/不是模式1、4，正常指令	
		
_zj7tg
	move.w	#$0c06,($4d0,A5)	/直接通关
	rts
	
_baoji39
	move.b		#$39,($333a,A5)	/模式4，过7关后恢复暴击
	move.b		#$39,($34ba,A5)
	move.b		#$39,($363a,A5)
	rts
*-----------------------------------------
	org		$ace8
	jmp		$182600
	org		$182600
	cmpi.b		#$1,($4d9,A5)		/排除2关过水场景
	bne		_ms1sjcjjc		/检测是否模式一，随机场景
	cmpi.b		#$1,($786,A5)		/排除2关过水场景
	bne		_ms1sjcjjc
	jmp		$18498	
_ms1sjcjjc	
	cmpi.b		#$1,($7f88,A5)	/是否模式1
	beq		_sjcj		/是，进入随机场景
	jmp		$18498		/否，走原指令
	
_sjcj
    	movem.l 		D0-D7/A0-A6,-(A7)
	clr.l		($7fe0,A5)
	addq.b		#$1,($7f99,A5)
	cmpi.b		#$b,($7f99,A5)	/是否全部场景随机完成
	bne		_suijicj		/否，继续随机	
	move.b		#$6,($4d9,A5)	/是，进入第7关第4场景，通关
	move.b		#$3,($786,A5)
	bra		_jzyuansu
	
_suijicj				
	cmpi.b		#$1,($7f99,A5)
	beq		_cj1
	cmpi.b		#$2,($7f99,A5)
	beq		_cj2
	cmpi.b		#$3,($7f99,A5)
	beq		_cj3
	cmpi.b		#$4,($7f99,A5)
	beq		_cj4
	cmpi.b		#$5,($7f99,A5)
	beq		_cj5
	cmpi.b		#$6,($7f99,A5)
	beq		_cj6
	cmpi.b		#$7,($7f99,A5)
	beq		_cj7
	cmpi.b		#$8,($7f99,A5)
	beq		_cj8
	cmpi.b		#$9,($7f99,A5)
	beq		_cj9
	cmpi.b		#$a,($7f99,A5)
	beq		_cja

_cj1
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj1
	move.b		D0,$ffff60	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl1(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl1(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl1
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701	
_cj2
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj2
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj2
	move.b		D0,$ffff61	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl2(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl2(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl2
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701
_cj3
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj3	
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj3
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cj3	
	move.b		D0,$ffff62	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl3(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl3(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl3
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701
_cj4
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj4	
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj4
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cj4
	move.b		$ffff62,D1
	cmp.b		D1,D0
	beq		_cj4	
	move.b		D0,$ffff63	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl4(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl4(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl4
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701
_cj5
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj5	
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj5
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cj5
	move.b		$ffff62,D1
	cmp.b		D1,D0
	beq		_cj5
	move.b		$ffff63,D1
	cmp.b		D1,D0
	beq		_cj5	
	move.b		D0,$ffff64	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl5(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl5(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl5
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701

_cj6
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj6	
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj6
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cj6
	move.b		$ffff62,D1
	cmp.b		D1,D0
	beq		_cj6
	move.b		$ffff63,D1
	cmp.b		D1,D0
	beq		_cj6
	move.b		$ffff64,D1
	cmp.b		D1,D0
	beq		_cj6	
	move.b		D0,$ffff65	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl6(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl6(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl6
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701
_cj7
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj7	
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj7
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cj7
	move.b		$ffff62,D1
	cmp.b		D1,D0
	beq		_cj7
	move.b		$ffff63,D1
	cmp.b		D1,D0
	beq		_cj7
	move.b		$ffff64,D1
	cmp.b		D1,D0
	beq		_cj7
	move.b		$ffff65,D1
	cmp.b		D1,D0
	beq		_cj7	
	move.b		D0,$ffff66	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl7(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl7(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl7
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701
_cj8
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj8	
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj8
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cj8
	move.b		$ffff62,D1
	cmp.b		D1,D0
	beq		_cj8
	move.b		$ffff63,D1
	cmp.b		D1,D0
	beq		_cj8
	move.b		$ffff64,D1
	cmp.b		D1,D0
	beq		_cj8
	move.b		$ffff65,D1
	cmp.b		D1,D0
	beq		_cj8
	move.b		$ffff66,D1
	cmp.b		D1,D0
	beq		_cj8	
	move.b		D0,$ffff67	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl8(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl8(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl8
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701
_cj9
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cj9	
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cj9
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cj9
	move.b		$ffff62,D1
	cmp.b		D1,D0
	beq		_cj9
	move.b		$ffff63,D1
	cmp.b		D1,D0
	beq		_cj9
	move.b		$ffff64,D1
	cmp.b		D1,D0
	beq		_cj9
	move.b		$ffff65,D1
	cmp.b		D1,D0
	beq		_cj9
	move.b		$ffff66,D1
	cmp.b		D1,D0
	beq		_cj9
	move.b		$ffff67,D1
	cmp.b		D1,D0
	beq		_cj9	
	move.b		D0,$ffff68	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdl9(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdl9(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdl9
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701
_cja
	clr.l		D0
	jsr		$119c                   	;进入随机程序	
         divu.w		#$a,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	cmpi.w		#$a,D0		/检测除法指令是否有效运行
	bcc		_cja
	move.b		$ffff60,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff61,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff62,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff63,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff64,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff65,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff66,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff67,D1
	cmp.b		D1,D0
	beq		_cja
	move.b		$ffff68,D1
	cmp.b		D1,D0
	beq		_cja	
	move.b		D0,$ffff69	
	mulu.w		#$2,D0                      ;乘个2，变为2的倍数
	move.b		_gqcjdla(PC,D0),($4d9,A5)	;取下表中随机1关
	addq.b		#$1,D0
	move.b		_gqcjdla(PC,D0),($786,A5)	;取下表中紧随的场景
	bra		_jzyuansu			

_gqcjdla
	dc.w	$0001,$0100,$0300,$0301,$0500,$0600,$0601,$0602,$0700,$0701	

	
_jzyuansu
	         
    	jsr 		$5be6                   ;搬运色板
    	jsr 		$5ace                   ;设置亮度
    	move.b 		#$c,($4d0,A5)
    	jsr 		$2220c                  ;读场景
    	cmpi.b		#$2,($7f6a,A5)	/是否刚刚结束电梯场景
    	bne		_buqqj		
	clr.b		($7f6a,A5)	/是，标志位清零
	jsr		$b52		/清楚电梯前景
_buqqj    	
    	jsr 		$161e0
    	movem.l 		(A7)+,D0-D7/A0-A6   
	jmp		$18498				

	


























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
