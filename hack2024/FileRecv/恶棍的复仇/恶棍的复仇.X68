*---------------------过场景清空缓存-------------------------
	org 		 $18a98
	jsr		_clr_cj
	
*=========================大个子晕==================================
	org		$2b20a
	cmpi.b		#$C,($3,A6)		*1BOSS,D为大个子
	beq		$2b54e

;-------------------------------------BOSS清版相关------------------------
        org 	$7b3c4                  ;监视小兵数量内存的指令
        jsr	_author
*-------------------暴击调整、七八关底清除锁暴击，动态暴击，8隐藏关过关初始化图标处理-------------------------------------
	org		$1175c
	jmp		_bj_check
*===========================选人===========================================
	org		$b1d0
	jsr		_select_player	
*============================大龙持续召唤兵==============================
	org	$619ae
	jsr	_continus_dl
*===========杰克AB打晕敌兵===============================
	;org	$a275a
	;dc.w	$0001
	
*-----------------------------1V3---8关底清版(走1boss分支代码，8关底存在1boss才会生效)------------------------------------------
	org		$659e
	jmp		_1v3
;---------------------------随机出兵---------------------------------------
	org		$fe5a
	jsr		_random_enemy
*----------------------------3BOSS随机派兵相关---------------------------------------		
	org		$ff1e
	jsr		_3boss_enemy	
	
*===============================begain=========================================	
	org		$106400	
_1v3
	tst.b		($7f66,A5)
	beq		_no_v3
	move.b		#$2,($4ef,A5)
	;move.b		D0,($7f67,A5)
	rts
_no_v3
	move.b		D0,($4ef,A5)
	rts
	
_bj_check
	cmpi.b		#$3,($786,A5)
	bne		_no_74
	cmpi.b		#$6,($4d9,A5)
	bne		_no_74
	jsr		$119c
	jmp		$11762
_no_74
	move.b		#$40,($11e,A3)
	rts
_author	
	moveq		#$0,D0
	move.b		($4f3,A5),D0
	beq		_show_author
	rts
_show_author
	movem.l		D0-D3/A0-A3,-(A7)	
	lea		$90a6ec,A1		/90a6ec，6表示左右位置，ec表示上下位置
	lea		_author_script,A0
	jsr		$c0a
	movem.l		(A7)+,D0-D3/A0-A3
	rts	
_author_script
	dc.w		$0120,$2020,$2052,$4542,$5549,$4c44,$2042,$5920,$4765,$5975,$2020,$2040,$4020,$2020
	
_clr_cj
	move.b		#$2,($0,A6)
	move.w		#$160,($ec,A6)
	cmpi.l		#$4ef90010,$1175c
	bne		_clr_cj
	cmpi.l		#$00030786,$106418
	bne		_clr_cj
	cmpi.l		#$0040011e,$106436
	bne		_clr_cj
	cmpi.l		#$45425549,$106468
	bne		_clr_cj
	cmpi.l		#$20425920,$10646e
	bne		_clr_cj
	cmpi.l		#$47655975,$106472
	bne		_clr_cj
	cmpi.w		#$11e,$2b98c
	bne		_clr_cj
	cmpi.w		#$11e,$2babe
	bne		_clr_cj
	rts
_select_player
	add.w		D0,D0
	move.w		D0,($20,A0)
	btst		#$2,($16,A5)	*1P下方向键
	bne		_1p_down
	clr.b		($7f66,A5)
	rts
_1p_down
	move.b		#$1,($7f66,A5)
	rts
_continus_dl
	move.b		#$1,($502,A5)
	moveq		#0,D0
	move.b		($5,A6),D0
	rts	
_3boss_enemy
	move.w		#$48,($20,A0)
	move.w		#$200,($26,A0)
	move.b		($f,A2),($96,A0)
	rts
_random_enemy
	movem.l  		D0-D1,-(A7)		;入栈
	cmpi.b		#$6,($4d9,A5)
	bne		_no_7_4
	cmpi.b		#$3,($786,A5)
	beq		_nosuiji
_no_7_4
	moveq		#0,D0		
	move.b		($3,A2),d0		;检测是否箱子或破门等
	andi.b		#$f,D0			;取个位
	cmpi.b		#$1,D0			;是否特效，包装敌兵等
	beq 		_nosuiji
	cmpi.b		#$3,D0			;是否道具，箱子等
	beq 		_nosuiji
	
	cmpi.w  		#$28,($20,A0)       ;是否胖子
	beq     		_sj
	cmpi.w 		#$8,($20,A0)        ;是否马甲
	beq     		_sj     
	cmpi.w  		#$38,($20,A0)       ;是否刀手
	beq     		_sj
	cmpi.w  		#$34,($20,A0)       ;是否猎人
	beq     		_sj
	cmpi.w  		#$50,($20,A0)       ;猴子
	beq     		_sj
	cmpi.w  		#$c,($20,A0)       ;是否链球
	beq     		_sj
	cmpi.w  		#$18,($20,A0)       ;狮子
	beq     		_sj	
_nosuiji
	move.b		($f,A2),($96,A0)
	movem.l  		(A7)+,D0-D1			;把原来D0中的数据移回去	
	rts
	;cmpi.b		#$6,($741,A5)		*是否严格关底
	;bne		_nosuiji
_sj
	move.w		#$48,($20,A0)
	move.w		#$200,($26,A0)
	tst.b		($f,A2)
	bne		_nosuiji
	addq.b		#1,($7f68,A5)
	clr.l		D1
	move.b		($7f68,A5),D1
	andi.b		#$f,D1
	cmpi.b		#$7,D1
	beq		_buji
	cmpi.b		#$e,D1
	bne		_nosuiji
	move.b		#$25,($96,A0)		*手榴弹
	movem.l  		(A7)+,D0-D1			;把原来D0中的数据移回去	
	rts
_buji
	move.b		#$1f,($96,A0)
	movem.l  		(A7)+,D0-D1			;把原来D0中的数据移回去	
	rts




















































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
