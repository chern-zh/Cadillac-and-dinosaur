;-----------------1V3相关--------------------------
        org     $3740
        jmp     $19b000
        org     $19b000
        move.b  #$2,($4ef,A5)       ;强制1V3模式
        move.b  D0,$ffff18          ;将实际玩家数量放入ffff18
        rts
;---------------------------------------------------------------------        

        ORG     $Fdd6
        jmp     $18c000
        ORG     $18c000
		movem.l  D0,-(A7)								;把D0移到空位置
		clr.l	D0		
		move.b	($3,A2),d0			;检测是否箱子或破门等
		andi.b	#$f,D0			;取个位
		cmpi.	#$1,D0			;是否特效，包装敌兵等
		beq 	_nosuiji
		cmpi.b	#$3,D0			;是否道具，箱子等
		beq 	_nosuiji
;---------------------检测是否关底，优先进入关底模式----------------------------
		cmpa.l	#$AD91A,A2			;检测是否加载主场4BOSS
		beq 	_baoji				;4BOSS场景强制暴击
        cmpi.b  #$7,$ffff04     ;检测是否7关第4场景
        beq     _nosuiji        ;7关底不随机   
        cmpi.b  #$1,$ffff06         ;是否其它关最终场景
        beq     _guandi_moshi         
               
;---------------------检测玩家数量，进入多模式---------------------------------
        cmpi.b  #$2,$ffff18     ;是否3人
        beq     _3player_
        cmpi.b  #$1,$ffff18     ;是否2人
        beq     _2player_       
;------------------------以上均不是，直接进入单人模式--------------------------
        cmpi.w  #$28,($20,A0)       ;是否胖子
        beq     _sj1_
        cmpi.w  #$8,($20,A0)        ;是否马甲
        beq     _sj1_        
        cmpi.w  #$38,($20,A0)       ;是否刀手
        beq     _sj1_
        cmpi.w  #$100,($20,A0)      ;是否扔雷猴
        beq     _sj1_
        cmpi.w  #$fc,($20,A0)       ;是否飞刀手
        beq     _sj1_
        cmpi.w  #$34,($20,A0)       ;是否猎人
        beq     _sj1_
        cmpi.w  #$50,($20,A0)       ;猴子
        beq     _sj1_
        cmpi.w  #$118,($20,A0)       ;摩托车
        beq     _sj1_
;---------------------以上均不是，则直接返回-----------------------------------
_nosuiji
        move.b  ($e,A2),($5b,A0)
		movem.l  (A7)+,D0								;把原来D0中的数据移回去		
        jmp     $fddc
;----------------------4BOSS场景锁暴击------------------------------------
_baoji
        cmpi.b  #$2,$ffff18     ;是否3人
        beq     _3baoji
        cmpi.b  #$1,$ffff18     ;是否2人
        beq     _2baoji
	;----------------------单人模式锁2C暴击----------------------------------------		
_1baoji
        move.b  #$2c,$ffb33a.l
        move.b  #$2c,$ffb4ba.l 
        move.b  #$2c,$ffb63a.l		
		bra		_nosuiji
	;----------------------双人模式锁24暴击----------------------------------------		
_2baoji
        move.b  #$24,$ffb33a.l
        move.b  #$24,$ffb4ba.l 
        move.b  #$24,$ffb63a.l		
		bra		_nosuiji
	;----------------------三人模式锁24暴击（禁AB）---------------------------------	
_3baoji
        move.b  #$24,$ffb33a.l
        move.b  #$24,$ffb4ba.l 
        move.b  #$24,$ffb63a.l		
		bra		_nosuiji		
;-----------------------------------------------------------------------------------
;-------------------------单人模式随机出小兵-----------------------------------
_sj1_
		clr.l   D0
		jsr		$119c                   ;进入随机程序
         divu.w	#$30,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		mulu.w   #$4,D0                                 ;乘个4，变为4的倍数
		move.w	_1_xiaobing_data(PC,D0),($20,A0)	;取下表中随机一个敌兵
        addi.b   #$2,D0
		move.w	_1_xiaobing_data(PC,D0),($26,A0)	;取下表中紧随的出场方式		

;--------------------------------单人随机补给程序------------------------------------        
_sjbuji1
		clr.l   D0
		jsr		$119c                   ;进入随机程序
         divu.w	#$40,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		move.b	_1_buji_data(PC,D0),($96,A0)	                        ;取下表中随机一个补给
		movem.l  (A7)+,D0								;把原来D0中的数据移回去
		move.b  #$0,($5b,A0)
         jmp     $fde2
;-------------------------------单人静态数据表----------------------------------------
_1_buji_data
        dc.w    $6A03,$0000,$0018,$0003,$1100,$011c,$0024,$0600
        dc.w    $0011,$0021,$0000,$000e,$000d,$0000,$0003,$0007
        dc.w    $000a,$0000,$000c,$0000,$0003,$0042,$0013,$0000
        dc.w    $0020,$0014,$4200,$0005,$001a,$0016,$0021,$0012

                   
_1_xiaobing_data
        dc.w    $0008,$0402,$0008,$040a,$0008,$0202,$0008,$0002
        dc.w    $000c,$0000,$000c,$0000,$000c,$0000,$000c,$0000
        dc.w    $0018,$0006,$0018,$0202,$0018,$0206,$0018,$0002
        dc.w    $0028,$0406,$0028,$0402,$0028,$0206,$0028,$0004
        dc.w    $0038,$0208,$0038,$020c,$0038,$0008,$0038,$000c
        dc.w    $0048,$0200,$0048,$0200,$0048,$0200,$0048,$0200
        dc.w    $0050,$0206,$0050,$0006,$0050,$000a,$0050,$0006
        dc.w    $00fc,$0200,$00fc,$0000,$0118,$0000,$0118,$0100
        dc.w    $0100,$0000,$0100,$0200,$016c,$0000,$016c,$0000
        dc.w    $016c,$0000,$016c,$0000,$0048,$0200,$0048,$0200
        dc.w    $0034,$0408,$0034,$040a,$0034,$0212,$0034,$000a
        dc.w    $0018,$0206,$0048,$0200,$000c,$0000,$016c,$0000
         

;------------------------------------------------------------------------------------
;--------------------------------------三人模式--------------------------------------
;------------------------------------------------------------------------------------

_3player_        
        cmpi.w  #$28,($20,A0)       ;是否胖子
        beq     _sj3_
        cmpi.w  #$8,($20,A0)        ;是否马甲
        beq     _sj3_        
        cmpi.w  #$38,($20,A0)       ;是否刀手
        beq     _sj3_
        cmpi.w  #$100,($20,A0)      ;是否扔雷猴
        beq     _sj3_
        cmpi.w  #$fc,($20,A0)       ;是否飞刀手
        beq     _sj3_
        cmpi.w  #$34,($20,A0)       ;是否猎人
        beq     _sj3_
        cmpi.w  #$50,($20,A0)       ;猴子
        beq     _sj3_
        cmpi.w  #$118,($20,A0)       ;摩托车
        beq     _sj3_        
;---------------------以上均不是，则直接返回-----------------------------------
		movem.l  (A7)+,D0								;把原来D0中的数据移回去
        move.b  ($e,A2),($5b,A0)
        jmp     $fddc
;-----------------------------------------------------------------------------------
;-------------------------三人模式随机出BOSS-----------------------------------
_sj3_
		clr.l   D0
		jsr		$119c                   ;进入随机程序
        divu.w	#$18,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		mulu.w   #$2,D0                                 ;乘个2，变为偶数
		move.w	_suiji_3_data(PC,D0),($20,A0)	;取下表中随机一个BOSS
		move.w  #$0,($26,A0)                        ;默认BOSS出场方式0000
         cmpi.w  #$48,($20,A0)       ;检测是否大个子
         bne     _sjbuji3                ;否，则跳到随机补给程序        
         move.w  #$0200,($26,A0)     ;大个子需要和1boss做区别
;--------------------------------随机补给程序------------------------------------        
_sjbuji3
		clr.l   D0
		jsr		$119c                   ;进入随机程序
        divu.w	#$20,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		move.b  _3_buji_data(PC,D0),($96,A0)	         ;取下表中随机一个补给
		movem.l  (A7)+,D0								;把原来D0中的数据移回去
		move.b  #$0,($5b,A0)
        jmp     $fde2                   
_suiji_3_data
        dc.w    $0150,$00a0,$0048,$0014,$0090,$011c,$0064,$016c
        dc.w    $0048,$0018,$000c,$0178,$016c,$016c,$00f4,$0090
        dc.w    $0018,$0064,$016c,$0048,$000c,$00a0,$00f4,$007c
; 大龙，小龙，屠夫，屠夫，马云，7幻影，4幻影，跳跳龙，大个子，狮子，链球，博士，寄生兽

_3_buji_data
        dc.w    $6A03,$001a,$2318,$1d0d,$0016,$011c,$4224,$0603
        dc.w    $0a11,$1121,$2212,$200e,$140d,$050c,$030b,$0907
		
		
;-----------------------------------------------------------------------------------------------
;--------------------------------------双人模式------------------------------------------------
;----------------------------------------------------------------------------------------------------		
_2player_
	   cmpi.w  #$28,($20,A0)       ;是否胖子
        beq     _sj2_
        cmpi.w  #$8,($20,A0)        ;是否马甲
        beq     _sj2_        
        cmpi.w  #$38,($20,A0)       ;是否刀手
        beq     _sj2_
        cmpi.w  #$100,($20,A0)      ;是否扔雷猴
        beq     _sj2_
        cmpi.w  #$fc,($20,A0)       ;是否飞刀手
        beq     _sj2_
        cmpi.w  #$34,($20,A0)       ;是否猎人
        beq     _sj2_
        cmpi.w  #$50,($20,A0)       ;猴子
        beq     _sj2_
        cmpi.w  #$118,($20,A0)       ;摩托车
        beq     _sj2_        
;---------------------以上均不是，则直接返回-----------------------------------
		movem.l  (A7)+,D0								;把原来D0中的数据移回去
        move.b  ($e,A2),($5b,A0)
        jmp     $fddc
;-----------------------------------------------------------------------------------
;-------------------------双人模式随机出BOSS+小兵-----------------------------------
_sj2_
		clr.l   D0
		jsr		$119c                   ;进入随机程序
        divu.w	#$30,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		mulu.w   #$4,D0                                 ;乘个4，变为4的倍数
		move.w	_2_data(PC,D0),($20,A0)			;取下表中随机一个敌兵
        addi.b   #$2,D0
		move.w	_2_data(PC,D0),($26,A0)			;取下表中紧随的出场方式		

;--------------------------------双人随机补给程序------------------------------------        
_sjbuji2
		clr.l   D0
		jsr		$119c                   ;进入随机程序
        divu.w	#$30,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		move.b	_2_buji_data(PC,D0),($96,A0)	         ;取下表中随机一个补给
		movem.l  (A7)+,D0								;把原来D0中的数据移回去
		move.b  #$0,($5b,A0)
        jmp     $fde2
;-------------------------------双人静态数据表----------------------------------------
_2_buji_data
        dc.w    $6A03,$001a,$0018,$0303,$1100,$011c,$0024,$0603
        dc.w    $0011,$0021,$0042,$000e,$000d,$0012,$0003,$1607
        dc.w    $000a,$2000,$000c,$0005,$0003,$0042,$0013,$0003
                  
_2_data
        dc.w    $0008,$0402,$0008,$040a,$0008,$0002,$0150,$0000
        dc.w    $011c,$0000,$000c,$0000,$000c,$0000,$00f4,$0000
        dc.w    $0018,$0006,$00a0,$0000,$0018,$0206,$0018,$0002
        dc.w    $0028,$0406,$0028,$0402,$0028,$0206,$0064,$0000
        dc.w    $0038,$0208,$0038,$020c,$0038,$0008,$011c,$0000
        dc.w    $0150,$0000,$0048,$0200,$00f4,$0000,$0048,$0200
        dc.w    $0050,$0206,$0050,$000a,$00f4,$0000,$0064,$0000
        dc.w    $00fc,$0200,$00fc,$0000,$0178,$0000,$0118,$0100
        dc.w    $0100,$0000,$0100,$0200,$016c,$0000,$0090,$0000
        dc.w    $016c,$0000,$016c,$0000,$0048,$0200,$0048,$0200
        dc.w    $0034,$0408,$0034,$000a,$0034,$0212,$0090,$0000
        dc.w    $0018,$0206,$0048,$0200,$000c,$0000,$00a0,$0000



;------------------------------------------------------------------------------------------------
_guandi_moshi
		clr.l   D0
		jsr		$119c                   ;进入随机程序
        divu.w	#$14,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		mulu.w   #$4,D0                                 ;乘个4，变为4的倍数
		move.w	_guandi_data(PC,D0),($20,A0)	;取下表中随机一个敌兵
        addi.b   #$2,D0
		move.w	_guandi_data(PC,D0),($26,A0)	;取下表中紧随的出场方式		
		movem.l  (A7)+,D0								;把原来D0中的数据移回去
        move.b  ($e,A2),($5b,A0)
        jmp     $fddc

;-------------------------------关底出兵数据表----------------------------------------
                   
_guandi_data
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0006
        dc.w    $0048,$0200,$0028,$0406,$0034,$0408,$0038,$0208
        dc.w    $0050,$0206,$0018,$0206,$016c,$0000,$000c,$0000
        dc.w    $0008,$0402,$0028,$0206,$0100,$0200,$0118,$0100      
        dc.w    $016c,$0000,$0018,$0000,$000c,$0000,$0048,$0200







