;------------------------------多模式BOSS加血------------------------
        org     $31d7a
        jmp     $1c0000
        nop
        org     $1c0000
        ;cmpi.b   #$0,$ffff18.l         ;检测玩家数量是否1人
        ;beq    _one_player_
     ;cmpi.b   #$1,$ffff18.l         ;检测玩家数量是否2人
     ;beq    _two_player_
;--------------------------以上均不是，则直接进入下列三人模式--------------------- 
    cmpi.b  #$1,$ffff00         ;检测是否关底
    beq     _320_               ;关底BOSS8行血   
     cmpi.w  #$f4, ($20,A6)                    ;检测是否屠夫
     beq     _BOSS_plus
     cmpi.w  #$a0, ($20,A6)                    ;是否铁头龙
     beq     _BOSS_plus
     cmpi.w  #$150, ($20,A6)                   ;是否大龙
     beq     _BOSS_plus
     cmpi.w  #$90, ($20,A6)                    ;是否马云
     beq     _BOSS_plus
     cmpi.w  #$178, ($20,A6)                    ;是否178
     beq     _BOSS_plus     
     ;cmpi.w  #$64, ($20,A6)                    ;是否李寻欢
     ;beq     _jiaxie_4b_
     ;cmpi.w  #$7c, ($20,A6)                    ;是否李寻欢
     ;beq     _jiaxie_3b_     
_jiaxie_suiji
		move.l  D0,$ffff0c								;把D0移到空位置
		clr.l   D0
		jsr		$119c                   ;进入随机程序
         divu.w	#$8,D0							;随机数在D0里，求余,限制范围( )
		swap	D0		    					         ;余数在高12位，交叉下
		mulu.w   #$2,D0                                 ;乘个2，变为偶数
		move.w	_jiaxie_data(PC,D0),($6c,A6)	;取下表中随机一个血量
         move.w  ($6c,A6),($6e,A6)
		move.l  $ffff0c,D0								;把原来D0中的数据移回去
         jmp        $31d82
;-------------------------------BOSS血量静态数据表----------------------------------------
_jiaxie_data
        dc.w    $0190,$012c,$0190,$01f4,$0190,$012c,$01f4,$0190
;-----------------------------------------------------------------------------------------        
_BOSS_plus    
     addq.b  #$1,$ffffe0            ;屠夫，铁头龙，大龙，马云，178,刷兵+1，卡场景
     bra    _jiaxie_suiji
     
   ;-------------------------------------------------------------------------
_320_                                         ;关底BOSS加血   
     move.w  #$320,($6c,A6)
     move.w  #$320,($6e,A6)
     jmp        $31d82     ;rts




;----------------------------6BOSS非幼体加血---------------------------------------------            
    ORG  $36a10
    jsr  $1c3000
    nop
    ORG  $1c3000
     ;cmpi.b   #$0,$ffff18.l         ;检测玩家数量是否1人
     ;beq    _1f4_6_
   ; cmpi.b   #$1,$ffff18.l         ;检测玩家数量是否2人
    ; beq    _28a_
;--------------------------以上均不是，则直接进入下列三人模式
_6boss_320_
     ;move.w  #$320, ($6c,A6)        ;三人模式8行血
     ;move.w  #$320, ($6e,A6)
     ;rts
_1f4_6_
    ; move.w  #$1f4, ($6c,A6)        ;单人模式5行血
     ;move.w  #$1f4, ($6e,A6)
     ;rts     
_28a_
     move.w  #$28a, ($6c,A6)        ;双人模式6.5行血
     move.w  #$28a, ($6e,A6)
     rts

;-------------------------------------BOSS清版相关------------------------
        org $812e2                  ;监视小兵数量内存的指令
        nop
        jsr     $1cc000
        org     $1cc000
        move.b  ($4f3,A5),D0
        add.b   ($7fe0,A5),D0
        movea.l ($a0,A6),A0
        rts


*_____________________________________________BOSS小兵化、非关底打死不过关_______________________________________________
	;======================================过关=====================================
		org		$acee
		jmp		$1de000
		org		$1de000
		tst.b	$ffff00						;是否关底
		beq		_acee_noguandi                  ;非关底，任何BOSS都不能过关，跳到非关底程序
		cmpi.b   #$1,$ffff02                    ;是否1关关底
		beq     _1_acee
		cmpi.b   #$2,$ffff02                    ;是否2关关底
		beq     _2_acee
		cmpi.b   #$5,$ffff02                    ;是否5关关底
		beq     _5_acee		
		cmpi.b   #$8,$ffff02                    ;是否8关关底
		beq     _8_acee
		cmpi.b   #$7,$ffff02                    ;是否7关关底
		beq     _7_acee
_acee_		
		move.b  #$1, ($4d4,A5)
		jmp		$00ACF4
_acee_noguandi
		cmpi.w	#$150,($20,A6)				;是否大龙
		beq		_acee_dl
		cmpi.w	#$a0,($20,A6)				;是否铁头龙
		beq		_BOSS_minus
		cmpi.w	#$f4,($20,A6)				;是否屠夫
		beq		_BOSS_minus		
_acee_noguandi_jx
		move.w	#$48,($20,a6)				;非关底，强制改成马甲ID，这样BOSS死后不会过关，且尸体会消失
		move.b	#$02,($26,a6)				;非关底，强制改成马甲ID，这样BOSS死后不会过关，且尸体会消失
		rts
_BOSS_minus
         subq.b      #$1,$ffffe0             ;铁头龙与屠夫-1
         bra        _acee_noguandi_jx	
_1_acee
         addi.b   #$1,$ffff0e
        cmpi.b      #$2,$ffff0e         ;检测死的是否是第二个BOSS
         beq        _acee_
         rts
_2_acee
        cmpi.w  #$f4,($20,A6)           ;死者是否屠夫
        bne    _acee_noguandi           ;否，去看看是否大龙 
        addi.b   #$1,$ffff0e
        cmpi.b   #$2,$ffff0e                ;检测是否死的是第二个2BOSS
         beq        _acee_                  ;是，则过关
         move.w     #$10,($20,A6)           ;不过关，则把屠夫BOSS马甲换成6BOSS非幼体ID，进行复活
         move.w     #$0100,($26,A6)         ;设置6B非幼体为三阶状态，仅复活一次
         rts
_5_acee
         addi.b   #$1,$ffff0e
        cmpi.b      #$2,$ffff0e             ;检测死的是否是第二个BOSS
         beq        _acee_
         rts                         
_8_acee
        cmpi.w  #$150,($20,A6)              ;检测是否大龙，只有大龙在8关底才能触发过关
         beq        _acee_                  ;是，则过关
        cmpi.w  #$A0,($20,A6)              ;否，检测小龙
         bne    _acee_noguandi                  ;否，则跳到不过关         
         move.w     #$178,($20,A6)           ;是，不过关，则把铁头龙马甲换成178博士龙ID，进化大龙
         rts                 		
_7_acee
        addi.b   #$1,$ffff0e
        cmpi.b      #$3,$ffff0e             ;检测死的是否是第3个BOSS		
		bne		_acee_noguandi
		bra		_acee_
		
		
_acee_dl
        subq.b      #$1,$ffffe0             ;大龙-1
		movem.l	A0-A1/D0-D1,-(A7)
		movea.w	($B0,A6),A1					;大龙前手
		jsr		_CLR_OBJ
		movea.w	($B2,A6),A1					;大龙后手
		jsr		_CLR_OBJ
		movea.w	($B4,A6),A1					;大龙前手
		jsr		_CLR_OBJ
		movea.w	($B6,A6),A1					;大龙前手
		jsr		_CLR_OBJ
		;--------------------------搜索大龙身体154，并清零----------------------------
		movea.l	#$FFFFDD14,A0					;c8f4
_154_zt
		cmpa.w	($b0,a0),a6						;是否大龙基址
		beq		_154_clr						;找到则执行清理，并退出（只有1个）
		suba.w	#$e0,a0							;偏移到下一个OBJ
		cmpa.w	#$c8f4,a0						;搜索完毕，没有退出
		blt		_acee_js						;没有退出
		bra		_154_zt							;循环
_154_clr
		movea.w	A0,A1
		jsr		_CLR_OBJ
_acee_js
		movem.l	(A7)+,A0-A1/D0-D1
		bra	    _acee_noguandi_jx
		;---------------------------清理OBJ数据------------------------------
_CLR_OBJ
		CLR.L	($0,a1)
		CLR.w	($4,a1)
		CLR.L	($6,a1)
		CLR.L	($a,a1)
		CLR.w	($e,a1)
		CLR.L	($10,a1)
		CLR.L	($14,a1)
		CLR.L	($18,a1)
		CLR.L	($1c,a1)
		CLR.L	($20,a1)
		CLR.L	($24,a1)
		CLR.L	($28,a1)
		CLR.L	($2c,a1)
		CLR.L	($30,a1)
		CLR.L	($34,a1)
		CLR.L	($38,a1)
		CLR.L	($3c,a1)
		CLR.L	($40,a1)
		CLR.L	($44,a1)
		CLR.L	($48,a1)
		CLR.L	($4c,a1)
		CLR.L	($50,a1)
		CLR.L	($54,a1)
		CLR.L	($58,a1)
		CLR.L	($5c,a1)
		CLR.L	($60,a1)
		CLR.L	($64,a1)
		CLR.L	($68,a1)
		CLR.L	($6c,a1)
		CLR.L	($70,a1)
		CLR.L	($74,a1)
		CLR.L	($78,a1)
		CLR.L	($7c,a1)
		CLR.L	($80,a1)
		CLR.L	($84,a1)
		CLR.L	($88,a1)
		CLR.L	($8c,a1)
		CLR.L	($90,a1)
		CLR.L	($94,a1)
		CLR.L	($98,a1)
		CLR.w	($9c,a1)
		CLR.L	($9e,a1)
		CLR.L	($a2,a1)
		CLR.L	($a6,a1)
		CLR.L	($aa,a1)
		CLR.w	($ae,a1)
		CLR.L	($b0,a1)
		CLR.L	($b4,a1)
		CLR.L	($b8,a1)
		CLR.w	($bc,a1)	
		CLR.L	($be,a1) 
;---------------------------------------------			
		CLR.L	($b2,a1)        ;傻逼easy68K的BUG
		CLR.L	($b6,a1)        ;傻逼easy68K的BUG
		CLR.L	($ba,a1)        ;傻逼easy68K的BUG
		CLR.w	($be,a1)        ;傻逼easy68K的BUG
;--------------------------------------------		
		CLR.L	($d0,a1)
		CLR.L	($d4,a1)
		CLR.L	($d8,a1)
		CLR.L	($dc,a1)
		rts


		;------------------------幻影这些怪的置8------------------------------
		;org		$01720A					;一直监视BOSS血量的某个指令
		;jmp		$1df000
		;org		$1df000
		;tst.w   ($6c,A3)				;原来的 检测血量是否为0
		;bne     _17216					;原来的	不为0则退出
		;--------------------------------血量为0了---------------------------------
		;cmpa.l	#$FFFFDD14,A3			;过滤掉非敌人基址（己方、箱子、特效等）
		;bGt		_17212					;超过范围不改ID
		;cmpa.l	#$FFFFC8f4,A3			;过滤掉非敌人基址（己方、箱子、特效等）
		;blT		_17212					;超过范围不改ID

		;tst.b	$ffff00						*是否关底(以后要改成是否最后一只关底BOSS)
		;bne		_17212						*非尾1不改ID

		;move.w	#$48,($20,a3)				;非关底，强制改成马甲ID，这样BOSS死后不会过关，且尸体会消失
		;move.b	#$02,($26,a3)				;非关底，强制改成马甲ID，这样BOSS死后不会过关，且尸体会消失
_17212
		;jmp		$017212
		;-----------------------------------------------------------------------
_17216
		;jmp		$017216						;这是原来的，别被骗了，没用


	;======================================派兵跟死后不动的=====================================
		ORG		$81df8
		jmp		$1df100
		org		$1df100
		tst.b	$ffff00						;是否关底
		beq		_81df8_noguandi                 ;非关底所有BOSS都不派兵
		
;---------------------以下为特定BOSS在特定关卡的派兵--------------------------------------		
		cmpi.w  #$f4,($20,A6)
		beq     _2Bpb
		cmpi.w  #$90,($20,A6)
		beq     _5Bpb
		cmpi.w  #$A0,($20,A6)
		beq     _5Bpb
		cmpi.w  #$7c,($20,A6)
		beq     _3Bpb
		cmpi.w  #$64,($20,A6)       ;4BOSS需特殊处理
		beq     _4Bpb
		cmpi.w  #$150,($20,A6)
		beq     _8Bpb
		cmpi.w  #$10,($20,A6)
		beq     _6Bpb
;-------------以上都不是，则1B与7B在任意关底都派兵-------------------------		
_pb
		jsr     $1A02.l
		jmp		$81dfe
_81df8_noguandi
		rts
		
_2Bpb
        cmpi.b  #$2,$ffff02             ;2B非2关底不派兵
        beq     _pb
	    rts 
_3Bpb
        cmpi.b  #$3,$ffff02             ;3B非3关底不派兵
        beq     _pb
	    rts
_4Bpb
        cmpi.b  #$4,$ffff02             ;4B在第4关底正常派兵
        beq     _pb
;----------------------------------------------------------------        
        ;cmpi.b  #$7,$ffff02             ;4B在第7关底仅1倍派兵
        ;addi.b  #$1,$ffff01
        ;cmpi.b  #$3,$ffff01             ;4B在7关底仅1倍派兵
       ; beq     _pb
;----------------------------------------------------------------        
	    rts
_5Bpb
        cmpi.b  #$5,$ffff02             ;5B5关底派兵
        beq     _pb
        cmpi.b  #$8,$ffff02             ;5BOSS在8关底派兵
        beq     _pb        
	    rts
_6Bpb
        cmpi.b  #$6,$ffff02             ;6B非6关底不派兵
        beq     _pb
	    rts
_8Bpb
        cmpi.b  #$8,$ffff02             ;8B
        beq     _pb
        cmpi.b  #$1,$ffff02             ;8B在1关底也派兵
        beq     _pb        
	    rts
      		
		
		
	;==========================================出场音乐=============================================
		org     $059e16                    ;取消2B开场音乐
        jsr     $1df300
        org     $1df300
		tst.b	$ffff00					   ;是否关底
		bne		_2bmusic
        rts
_2bmusic
        cmpi.b  #$2,$FFff02				   ;是否2关关底
        bne     _2bmusic_no
        jsr     $77de
_2bmusic_no
        rts
		;------------------------------------------------------------
		org     $051772                    ;取消5B开场音乐
        jsr     $1df180
        org     $1df180
		tst.b	$ffff00					   ;是否关底
		bne		_5bmusic
        rts
_5bmusic
        cmpi.b  #$5,$FFff02				   ;是否5关关底
        bne     _5bmusic_no
        jsr     $77de
_5bmusic_no
        rts
		;------------------------------------------------------------
		org     $64f54                    ;取消8B开场音乐
        jsr     $1df200
        org     $1df200
		tst.b	$ffff00					   ;是否关底
		beq		_8bmusic_no
        cmpi.b  #$7,$FF84D9				   ;是否8关
        bne     _8bmusic_no
        jsr     $77de
_8bmusic_no
        rts
















		;======================================取消马云打死慢动作、小兵死=======================================
		org		$052D8a                         ;马云震死小兵与慢动作指令
		jmp		$1df500
		org		$1df500
		tst.b	$ffff00					   ;是否关底，关底会变龙
		BNE		_052D8a_Y
		subq.b  #$1,$ffffe0                 ;马云-1
		move.w	#$8,($20,a6)			   ;非关底，强制改成马甲ID，这样BOSS死后不会过关，且尸体会消失
_052D8a_Y
		jmp     $052d9C














;---------------------------------------4BOSS修复、对话调节---------------------------------------------------
        ORG     $4bf20                  ;4BOSS对话调节
        jmp     $102000
        ORG     $102000
        cmpi.b  #$4,$ffff02.l
        beq     _liji4
        cmpi.b  #$7,$ffff02.l
        beq     _liji7
        jmp     $4BF28
              
_liji7
        cmpi.w  #$400,($744,A5)
        jmp     $4BF26
_liji4        
        cmpi.w  #$470,($744,A5)
        jmp     $4bf26        
;------------------------------------------178-1，变身------------------------------------------------
        org     $6ce0a
        subq.b  #$1,$ffffe0
        nop
        nop
        nop
        nop
        nop
        nop
;---------------------------------------------------------------------------------------------------


*_______________________随机关卡不重复______________________过关清空暂存数据_______________________________________________
			org		$ABEC							;过关+1的地方
			jsr		$199000							;
			org		$199000							;
			;andi.b  #$7, ($4d9,A5)					;原来的关卡相关指令，别管
			clr.l		$ffff00						;全部清零
			clr.l		$ffff04
			clr.l		$ffff08
			clr.l		$ffff0c

			clr.l		$ffffD0						;fFd0-fFdF全部清零
			clr.l		$ffffD4
			clr.l		$ffffD8
			clr.l		$ffffDc

			clr.l		$ffffe0						;fFE0-fFF0全部清零
			clr.l		$ffffe4
			clr.l		$ffffe8
			clr.l		$ffffec

			clr.l		$fffff0						;fFE0-fFF0全部清零
			clr.l		$fffff4
			clr.l		$fffff8
			clr.l		$fffffc

    movem.l D0-D5,-(A7)   
    addi.b  #$1,$ffff20    ;表示过关次数，每次加1，放入ffff20，
    cmpi.b  #$7,$ffff20     ;过7次关了，说明是8关
    beq     _7_
    cmpi.b  #$6,$ffff20
    beq     _6_
    cmpi.b  #$5,$ffff20
    beq     _5_
    cmpi.b  #$4,$ffff20
    beq     _4_
    cmpi.b  #$3,$ffff20
    beq     _3_
    cmpi.b  #$2,$ffff20
    beq     _2_
;--------以上都不是，说明是第一次过关-----------------
_1_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0               ;第一次过关不可与1关相同
    beq     _1_
    move.b  D0,$ffff30 
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5  
    jmp     $abf2
_2_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _2_
    move.b  $ffff30,D1
    cmp.b   D0,D1
    beq     _2_
    move.b  D0,$ffff32      ;第2次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5   
    jmp     $abf2  
_3_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _3_
    move.b  $ffff30,D1
    cmp.b  D0,D1
    beq     _3_
    move.b  $ffff32,D2
    cmp.b  D0,D2
    beq     _3_    
    move.b  D0,$ffff34      ;第3次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2
_4_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _4_
    move.b  $ffff30,D1   
    cmp.b  D0,D1
    beq     _4_
    move.b  $ffff32,D2    
    cmp.b  D0,D2
    beq     _4_ 
    move.b  $ffff34,D3
    cmp.b  D0,D3
    beq     _4_   
    move.b  D0,$ffff36      ;第4次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2    
_5_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _5_
    move.b  $ffff30,D1
    cmp.b  D0,D1
    beq     _5_
    move.b  $ffff32,D2
    cmp.b  D0,D2
    beq     _5_
    move.b  $ffff34,D3 
    cmp.b  D0,D3
    beq     _5_
    move.b  $ffff36,D4
    cmp.b  D0,D4
    beq     _5_    
    move.b  D0,$ffff38      ;第5次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2
_6_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _6_
    move.b  $ffff30,D1
    cmp.b  D0,D1
    beq     _6_
    move.b  $ffff32,D2
    cmp.b  D0,D2
    beq     _6_
    move.b  $ffff34,D3
    cmp.b  D0,D3
    beq     _6_
    move.b  $ffff36,D4
    cmp.b  D0,D4
    beq     _6_    
    move.b  $ffff38,D5
    cmp.b  D0,D5
    beq     _6_    
    clr.l   $ffff30
    clr.l   $ffff34
    clr.l   $ffff38
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2
    
_7_
    move.b  #$7,($4d9,A5)   ;直接把7放入，进行第八关
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5 
    clr.b   $ffff20  
    jmp     $abf2    




			
			;rts


*_____________________________________________正式游戏时，会一直读取时间的地址_______________________________________________
		org		$84fb4
		jmp		$1dfe00
		org		$1dfe00
		cmpi.w  #$300, ($4e8,A5)				;原来读取时间地址的地方，不管
		jsr		_gdbq							;插入按卷轴识别关底标签
		jmp		$84fba							;返回
	;=================================按卷轴识别关底标签=======================================
_gdbq
		tst.b	$ffff00							;是否关底
		bne		_gdbq_rts						     ;是不再进行检测（因为有时关底卷轴会往左跑，不好检测）
		cmpi.b  #$0,$FF84D9						;是否1关
        beq     _ckjz_1							;检测卷轴是否到关底了
		cmpi.b  #$1,$FF84D9						;是否2关
        beq     _ckjz_2							;检测卷轴是否到关底了
		cmpi.b  #$2,$FF84D9						;是否3关
        beq     _ckjz_3							;检测卷轴是否到关底了
		cmpi.b  #$3,$FF84D9						;是否4关
        beq     _ckjz_4							;检测卷轴是否到关底了
		cmpi.b  #$4,$FF84D9						;是否5关
        beq     _ckjz_5							;检测卷轴是否到关底了
		cmpi.b  #$5,$FF84D9						;是否6关
        beq     _ckjz_6							;检测卷轴是否到关底了
		cmpi.b  #$6,$FF84D9						;是否7关
        beq     _ckjz_7							;检测卷轴是否到关底了
		cmpi.b  #$7,$FF84D9						;是否8关
        beq     _ckjz_8							;检测卷轴是否到关底了
_gdbq_rts										
		rts
	;-------------------------------------------------------------------------------
_ckjz_1
        cmpi.b  #$2,$FF8786                     ;检测是否第3场景
		bne     _gdbq_rts						;不是退出
		move.b  #$1,$ffff04                     ;作为第1关第3场景密码		
		cmpi.w	#$1a2,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_1_						;ffff00置1，表示关底
		rts
	;-----------------------------------------------------------
_ckjz_2
        cmpi.b  #$2,$FF8786                     ;检测是否第3场景
		bne     _gdbq_rts						;不是退出
		move.b  #$2,$ffff04                     ;作为第2关第3场景密码		
		cmpi.w	#$250,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_2_						;ffff00置1，表示关底
		rts
	;-----------------------------------------------------------
_ckjz_3
		cmpi.w	#$2ccc,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_3_						;ffff00置1，表示关底
		rts
	;-----------------------------------------------------------
_ckjz_4
        cmpi.b  #$2,$FF8786                     ;检测是否第3场景
		bne     _gdbq_rts						;不是退出
		move.b  #$4,$ffff04                     ;作为第4关第3场景密码		
		cmpi.w	#$39E,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_4_						;ffff00置1，表示关底
		rts
	;-----------------------------------------------------------
_ckjz_5
        cmpi.b  #$1,$FF8786                     ;检测是否第2场景
		bne     _gdbq_rts						;不是退出
		move.b  #$5,$ffff04                     ;作为第5关第2场景密码		
		cmpi.w	#$1100,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_5_						;ffff00置1，表示关底
		rts
	;-----------------------------------------------------------
_ckjz_6
        cmpi.b  #$2,$FF8786                     ;检测是否第3场景
		bne     _gdbq_rts						;不是退出
		move.b  #$6,$ffff04                     ;作为第6关第3场景密码		
		cmpi.w	#$FDF,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_6_						;ffff00置1，表示关底
		rts
	;-----------------------------------------------------------
_ckjz_7
        cmpi.b  #$3,$FF8786                     ;检测是否第4场景
		bne     _gdbq_rts						;不是退出
		move.b  #$7,$ffff04                     ;作为第7关第4场景密码
		cmpi.w	#$34A,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_7_						;ffff00置1，表示关底
		rts
	;-----------------------------------------------------------
_ckjz_8
        cmpi.b  #$3,$FF8786                     ;检测是否第4场景
		bne     _gdbq_rts						;不是退出
		move.b  #$8,$ffff04                     ;作为第8关第4场景密码		
		cmpi.w	#$FC5,$ff8864					;卷轴到关底了
		bge		_m1_ffff00_8_						;ffff00置1，表示关底
		rts
	;---------------------------------------------------------

_m1_ffff00_1_
         move.b	#$1,$ffff02						;ffff02置1，表示1关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts
_m1_ffff00_2_
         move.b	#$2,$ffff02						;ffff02置2，表示2关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts
_m1_ffff00_3_
         move.b	#$3,$ffff02						;ffff02置3，表示3关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts
_m1_ffff00_4_
         move.b	#$4,$ffff02						;ffff02置4，表示4关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts
_m1_ffff00_5_
         move.b	#$5,$ffff02						;ffff02置5，表示5关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts
_m1_ffff00_6_
         move.b	#$6,$ffff02						;ffff02置6，表示6关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts
_m1_ffff00_7_
         move.b	#$7,$ffff02						;ffff02置7，表示7关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts
_m1_ffff00_8_
         move.b	#$8,$ffff02						;ffff02置8，表示8关关底密码        	
         move.b	#$1,$ffff00						;ffff00置1，表示通用关底密码
		rts		

;--------------------------------------6B幼体复活屠夫----------------------------------------------
        org     $5f86e
        jsr     $1b1000
        org     $1b1000
        cmpi.b  #$2,$ffff02     ;是否2关底
        beq     _youti_2        ;是，跳到6B幼体复活2B屠夫程序
        move.w  #$10,($20,A6)   ;否，进行正常的6B变身
        rts
        
_youti_2
        move.w  #$f4,($20,A6)       ;狸猫换太子
        rts        
        





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
