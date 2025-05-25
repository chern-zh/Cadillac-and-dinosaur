*-------------------————开局游戏清空缓存——————————————————--—
	ORG		$ad66                       ;开始游戏清理数据   
	jsr		$104900

	ORG		$104900
	jsr		$89e6
	clr.l		$fffff0
	rts

*-------------------————过关时更换场景——————————————————--—  
	ORG		$abec
	jmp		$104800
	ORG		$104800
	clr.l		$fffff0
	andi.b		#$7,($4d9,a5)
	cmpi.b		#$1,($4d9,a5)		;第2关,直接到第3场景
	beq		_3cj
	cmpi.b		#$3,($4d9,a5)		;第4关,直接到第3场景
	beq		_3cj	
	cmpi.b		#$5,($4d9,a5)		;第6关,直接到第2场景
	beq		_2cj	
	cmpi.b		#$6,($4d9,a5)		;第7关,直接到第4场景
	beq		_4cj	
	cmpi.b		#$7,($4d9,a5)		;第8关,直接到第3场景
	beq		_3cj	
	jmp		$abf2			;非以上关卡场景清零    
_3cj
	move.b		#$2,($786,A5)
	jmp		$abf6     
_2cj
	move.b		#$1,($786,A5)
	jmp		$abf6
_4cj
	move.b		#$3,($786,A5)
	jmp		$abf6     

;----------------------------------重新加载场景--------------------------------     
     	ORG  		$20448
     	jmp 		$107000
    
     	ORG  		$107000
     	cmpi.b		#$1,$fffff0
	beq		_zccj		
     	cmpi.b		#$0,($4d9,A5)		;第1\3\5关走正常场景进度
     	beq 		_zccj
	cmpi.b		#$2,$ff84d9
	beq		_zccj
	cmpi.b		#$4,$ff84d9
	beq		_zccj    	
    	movem.l 		d0-d7/a0-a6,-(a7)
	cmpi.b		#$1,$ff84d9		;第2关
	beq		_2
	cmpi.b		#$3,$ff84d9		;第4关
	beq		_2
	cmpi.b		#$5,$ff84d9		;第6关
	beq		_6
	cmpi.b		#$6,$ff84d9		;第7关
	beq		_7
	cmpi.b		#$7,$ff84d9		;第8关
	beq		_2
_2	
    	move.b 		#$2,$ff8786		;第2、4、、8关直接进入第3场景
	bra		_seban
_6	
    	move.b 		#$1,$ff8786		;第6关直接进入第2场景
	bra		_seban	
_7	
    	move.b 		#$3,$ff8786		;第7关直接进入第4场景	
_seban          
	move.b		#$1,$fffff0
    	jsr 		$8a44                   ;载入色板
    	jsr 		$892c                   ;设置亮度
    	move.b 		#$c,$ff84d0
    	jsr 		$2228a                  ;加载场景
    	jsr 		$162ae
    	movem.l 		(a7)+,d0-d7/a0-a6   
    	jmp		$2044e     
_zccj
    	jsr 		$206d4
    	jmp		$2044e


;------------------------------------BOSS死亡过关相关---------------------------------------
	org		$acee
	jmp		$104a00
	org		$104a00
	cmpi.b		#$0,($4d9,A5)
	beq		_jc_3			;第1关打死3个BOSS
	cmpi.b		#$1,($4d9,A5)
	beq		_jc_tufu			;第2关屠夫特殊处理
	cmpi.b		#$2,($4d9,A5)
	beq		_jc_2			;第3关打死2个BOSS
	cmpi.b		#$3,($4d9,A5)
	beq		_guoguan			;第4关打死一个直接过关
	cmpi.b		#$4,($4d9,A5)
	beq		_150jc
	cmpi.b		#$5,($4d9,A5)
	beq		_jc_2			;第6关打死2个BOSS
	cmpi.b		#$6,($4d9,A5)
	beq		_jc_3			;第7关打死3个4B
;-------------第8关仅大龙能过关--------------------------------------------	
	cmpi.w		#$150,($20,A6)		;死者是否大龙
	beq		_guoguan			;是，跳到过关程序
	rts					;否，不过关，直接返回
	
_jc_3
	addi.b		#$1,$fffff2
	cmpi.b		#$3,$fffff2
	bge		_guoguan
	rts	
_jc_3
	addi.b		#$1,$fffff2
	cmpi.b		#$2,$fffff2
	bge		_guoguan
	rts	
_jc_tufu
	cmpi.b		#$f4,($20,A6)		;检测死者是否屠夫
	bne		_rts
	addi.b		#$1,$fffff2		;屠夫死亡次数
	cmpi.b		#$1,$fffff2		;屠夫第1次死，用6B复活
	beq		_6Bfuhuo
	cmpi.b		#$2,$fffff2		;屠夫第2次死，用马云复活
	beq		_rts			;不过关	
	bra		_guoguan			;死的屠夫大于2，则过关
_6Bfuhuo
	move.w		#$10, ($20,A6)          	;将尸体换成6B的ID，进行复活
	move.w		#$100, ($26,A6)        	;设置6B为2阶状态		
_rts
	rts	
		
_guoguan
	move.b		#$1,($4d4,A5)	
	jmp		$acf4	
	

*----------------------------变身相关---前端------------------------------------
	org		$2af8e
	jsr		$104e00
	org		$104e00
	cmpi.w		#$f4,($20,A6)
	beq		_2guanjc			;屠夫在2关底复活
	cmpi.w		#$A0,($20,A6)
	beq		_8guanjc			;铁头龙在8关变大龙	
	bra		_buhuanmj	
_8guanjc
	cmpi.b		#$7,($4d9,A5)		
	bne		_buhuanmj
	move.w		#$178,($20,A6)		;将铁头龙尸体换成博士龙，进化大龙
	move.w		#$0,($26,A6)	
	bra		_buhuanmj	

_2guanjc
	cmpi.b		#$1,($4d9,A5)
	bne		_buhuanmj
	cmpi.b		#$2,$fffff2		;屠夫第2次死，用马云复活	
	bne		_buhuanmj
	move.w		#$90,($20,A6)		;尸体换成马云
	move.w		#$0,($26,A6)	
_buhuanmj	
	move.l		#$4000000,($4,A6)
	rts
*--------------------------------马云后端--------------------------------------------
	org		$52ebe
	jmp		$104f00
	org		$104f00
	cmpi.b		#$1, ($4d9,A5)  ;
	beq		_f4_
_a0_
	move.w		#$a0, ($20,A6)
	rts

_f4_
	move.l		#$0,($c4,A6)
	move.w		#$f4,($20,A6)
	move.w		#$0,($26,A6)
	rts
*---------------------------------178后端-------------------------------------------


*---------------------------------6BOSS后端-------------------------------------------

	
*----------------------------3BOSS随机派兵相关---------------------------------------		
	org		$ff1e
	jmp		$104c00
	org		$104c00
	movem.l		D0,-(A7)			;把D0移到空位置
	clr.l		D0
	jsr		$119c
         divu.w		#$8,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	mulu.w		#$4,D0                                 ;乘个4，变为4的倍数
	move.w		_3b_xiaobing_data(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addi.b		#$2,D0
	move.w		_3b_xiaobing_data(PC,D0),($26,A0)	;取下表中紧随的出场方式		

;--------------------------------3B随机补给程序------------------------------------        
_sjbuji1
	clr.l		D0
	jsr		$119c                   ;进入随机程序
	divu.w		#$f,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    					         ;余数在高12位，交叉下
	move.b		_3b_buji_data(PC,D0),($96,A0)	   ;取下表中随机一个补给
	movem.l		(A7)+,D0								;把原来D0中的数据移回去
	move.b		#$0,($5b,A0)
	jmp		$ff24
;-------------------------------3B静态数据表----------------------------------------
_3b_xiaobing_data
        dc.w    $0048,$0200,$0018,$0006,$000c,$0000,$016c,$0000
        dc.w    $000c,$0000,$016c,$0000,$0048,$0200,$0018,$0006
_3b_buji_data
        dc.w    $0003,$0020,$0300,$0005,$0300,$2000,$0300,$0021
                   























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
