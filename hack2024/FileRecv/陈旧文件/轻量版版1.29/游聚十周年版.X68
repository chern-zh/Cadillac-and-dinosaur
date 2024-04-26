*-------------------开场---------------------------
	org	$b1d0
	jsr	$101c00
	org	$89ba2	*加载天台假1BOSS指令
	jsr	_beginbj
	org	$101c00
	add.w	D0,D0
	move.w	D0,($20,A0)
	movem.l	D0,-(A7)
	moveq	#$0,D0
	move.b	($636,A5),D0
	add.b	D0,($15,A5)
	movem.l	(A7)+,D0		
	rts
_beginbj
	move.w	#$D8,($20,A0)	
	cmpi.b	#$2,($4ef,A5)
	bne	_2a
	move.b	#$30,($333a,A5)	
	move.b	#$30,($34ba,A5)
	move.b	#$30,($363a,A5)		
	rts
_2a
	move.b	#$2a,($333a,A5)	
	move.b	#$2a,($34ba,A5)
	move.b	#$2a,($363a,A5)
	rts
*-----------------------------随机出兵--------------------------------------------
	org		$fe5a
	jsr		$101d00
	org		$101d00
	cmpa.l		#$ADFA6,A2
	beq		_no_random
	cmpa.l		#$ADE62,A2
	beq		_no_random
	cmpi.b		#$6,($4d9,A5)
	bne		_random
	cmpi.b		#$3,($786,A5)
	beq		_no_random	
_random
	movem.l  		D0,-(A7)		;入栈
	clr.l		D0		
	cmpi.w  		#$28,($20,A0)       ;是否胖子
	beq     		_sj1_
	cmpi.w 		#$8,($20,A0)        ;是否马甲
	beq     		_sj1_        
	cmpi.w  		#$34,($20,A0)       ;是否猎人
	beq     		_sj1_
	cmpi.w  		#$50,($20,A0)       ;猴子
	beq     		_sj1_
	cmpi.w  		#$18,($20,A0)       ;狮子
	beq     		_sj1_
	cmpi.w  		#$38,($20,A0)       ;链球
	beq     		_sj1_
	cmpi.w  		#$c,($20,A0)       ;链球
	beq     		_sj1_
	cmpi.w  		#$48,($20,A0)       ;链球
	beq     		_sj1_	
_no_random
	movem.l		(A7)+,D0
	move.b		($f,A2),($96,A0)
	rts

_sj1_
	clr.l		D0	
	jsr		$119c                   	;进入随机程序	
         divu.w		#$20,D0			;随机数在D0里，求余,限制范围( )
	swap		D0		    	;余数在高12位，交叉下
	mulu.w		#$4,D0                      ;乘个4，变为4的倍数
	move.w		_xbbg(PC,D0),($20,A0)	;取下表中随机一个敌兵
	addi.b		#$2,D0
	move.w		_xbbg(PC,D0),($26,A0)	;取下表中紧随的出场方式	
	cmpi.w		#$c,($20,A0)
	beq		_lq
_out
	movem.l		(A7)+,D0
	move.b		($f,A2),($96,A0)
	rts
_lq
	cmpi.b		#$7,($4d9,A5)
	bne		_out
	cmpi.b		#$1,($786,A5)
	bne		_out
	bra		_sj1_            
_xbbg
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0008,$0002,$0008,$0200,$0008,$0402,$0008,$0202
        dc.w    $0038,$020a,$0038,$020c,$0038,$000c,$0038,$0008
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000
        dc.w    $0034,$040c,$0034,$0208,$0034,$000c,$0034,$020c
        dc.w    $0028,$0400,$0028,$0204,$0028,$0006,$0028,$0204
        dc.w    $0050,$0006,$0050,$0206,$0050,$0006,$0050,$0206
        dc.w    $0048,$0200,$016c,$0000,$000c,$0000,$0018,$0000

*===============================大个子、16C额外爆小血=================================
	org	$2a758		/大个子
	jsr	$102e00
	org	$2a8e2		/16C
	jsr	$102e00
	org	$2abde		/链球
	jsr	$102e00
	org	$2ac64
	jsr	$102e00
	
	
	org	$102e00
	jsr	$24b36
	cmpi.b	#$d,($3,A6)	
	beq	_ex
	cmpi.w	#$16c,($20,A6)	
	beq	_ex18c
	cmpi.w	#$18,($20,A6)	
	beq	_ex18c
	cmpi.w	#$c,($20,A6)	
	beq	_ex18c
	rts
_ex
	move.b	#$36,($96,A6)	/16%补给血
	jsr	$24b36
	rts
_ex18c
	move.b	#$39,($96,A6)	/16%补给血，手榴弹，炸药，大分，空
	jsr	$24b36
	rts	

*----------------------------------------------------------------------------------
*----------------------------- 暴击显示 挪到奇怪的位置 ----------------------------------
	org                $18D88		;一直会运行的某个血条相关程序
	jmp                _bjxscx		;插入“暴击程序”


	org                $102000         ;存放暴击程序的空白地址（可以改成别的）
_bjxscx                        
	bsr		_bjxscx1        ;跳到暴击显示子程序
	tst.w		($6c,A6)        *原来的不管
	bgt		_18d48          *原来的不管
	jmp		$18d90          *原来的不管
_18d48                        
	jmp     		$18dC6                *原来的不管


        ;/////////////////////////////////////////////////////////////////////////////////                
_bjxscx1        
	movem.l  		D0,-(A7)                       ;D0入栈                   
	clr.l   		D0                            ;清空D0  
	cmpi.b  		#$0, ($2,A6)                  ;检测1P
	bne     		_2pjc                        ;不是1P检测2P 
	move.b  		($c6,A6),D0                  ;暴击值代入D0                        
                        lsr.b   #4, D0                     ;取十位
                        move.w  D0, $90a71C                ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w  #$100, $90a71e             ;样式                        
                        move.b  ($c6,A6),D0                  ;暴击值再次代入D0   
                        andi.b  #$f, D0                    ;取个位 
                        move.w  D0, $90a79c                ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w  #$100, $90a79e            ;样式           

_2pjc                        
                        cmpi.b  #$1, ($2,A6)                ;检测2P
                        bne     _3pjc
                        move.b  ($c6,A6),D0
                        lsr.b   #4, D0
                        move.w  D0, $90af1C
                        move.w  #$19E, $90af1e
                        move.b  ($c6,A6),D0
                        andi.b  #$f, D0
                        move.w  D0, $90af9c
                        move.w  #$19E, $90af9e        
_3pjc                       
                        cmpi.b  #$2, ($2,A6)                  ;检测3P
                        bne     _chuzhan
                        move.b  ($c6,A6),D0
                        lsr.b   #4, D0
                        move.w  D0, $90b71C
                        move.w  #$19f, $90b71e
                        move.b  ($c6,A6),D0
                        andi.b  #$f, D0
                        move.w  D0, $90b79C
                        move.w  #$19f, $90b79E  
_chuzhan               
                        movem.l  (A7)+,D0                                                                                     
                        rts

*---------------------过场景无敌-------------------------
	ORG 		 $18a98
	jsr		$101c80
	org		$101c80
	move.b		#$2,($0,A6)
	move.w 		#$178,($ec,A6)
	rts
*=============================色板=================================================    
		org		$3965c		/狮子    
    		jsr		_shizi
		org		$45d30		/猴子
		jsr		_houzi
		org		$45892		/猴子
		jsr		_houzi    		
		org		$35a5c		/链球    
    		jsr		_lianqiu
		org		$33eee		/majia 
		jsr		_majia4
    		org		$3bbf2
    		jsr		_pz
    		
    		
    		
    		org		$102100
_shizi
        		moveq		#$0,D0
    		move.b		($5,A6),D0
		tst.b		($4d9,A5)
		beq		_sz_1    		
		cmpi.b		#$1,($4d9,A5)
		beq		_sz_2
		cmpi.b		#$2,($4d9,A5)
		beq		_sz_3
		cmpi.b		#$3,($4d9,A5)
		beq		_sz_4
		cmpi.b		#$4,($4d9,A5)
		beq		_sz_5
		cmpi.b		#$5,($4d9,A5)
		beq		_sz_6
		cmpi.b		#$6,($4d9,A5)
		beq		_sz_7
		cmpi.b		#$7,($4d9,A5)
		beq		_sz_8
_srts
		rts
_sz_1
		move.b		#$9C,($23,A6)	
		rts
_sz_2
		tst.b		($786,A5)
		beq		_sz_1
		cmpi.b		#$2,($786,A5)
		bne		_srts		
_9E
		move.b		#$9E,($23,A6)	
		rts
_sz_3
		move.b		#$9c,($23,A6)	
		rts
_sz_4
		tst.b		($786,A5)
		beq		_sz_1
_8A
		move.b		#$8A,($23,A6)	
		rts
_sz_5
		tst.b		($786,A5)
		beq		_srts
		move.b		#$9E,($23,A6)	
		rts
_sz_6
		tst.b		($786,A5)
		beq		_9E
		cmpi.b		#$2,($786,A5)
		bne		_srts
		move.b		#$9c,($23,A6)	
		rts		
_sz_7
		tst.b		($786,A5)
		beq		_8A
		cmpi.b		#$1,($786,A5)
		bne		_srts
		move.b		#$9E,($23,A6)	
		rts
_sz_8
		cmpi.b		#$1,($786,A5)
		bne		_srts
		move.b		#$9e,($23,A6)	
		rts
;--------------------------------------------------------
_houzi
		cmpi.w		#$50,($20,A6)
		bne		_hrts
		tst.b		($26,A6)
		beq		_0000
		move.b		#$83,($23,A6)
		bra		_hrts
_0000
		move.b		#$80,($23,A6)	
_hrts
		jsr		$49ca
		rts
;=================================================================
_lianqiu
        		moveq		#$0,D0
    		move.b		($5,A6),D0    		
		cmpi.b		#$1,($4d9,A5)
		beq		_l_2
		cmpi.b		#$3,($4d9,A5)
		beq		_l_4
		cmpi.b		#$4,($4d9,A5)
		beq		_l_5
		cmpi.b		#$7,($4d9,A5)
		beq		_l_8
_lrts
		rts
_l_2
		tst.b		($786,A5)
		bne		_lrts
		move.b		#$85,($23,A6)	
		rts
_l_4
		cmpi.b		#$2,($786,A5)
		bne		_lrts
		move.b		#$85,($23,A6)	
		rts
_l_5
		tst.b		($786,A5)
		bne		_lrts
		move.b		#$85,($23,A6)	
		rts
_l_8
		cmpi.b		#$3,($786,A5)
		bne		_lrts
		move.b		#$85,($23,A6)	
		rts

;=========================================================================
_majia4
		cmpi.b		#$4,($26,A6)
		bne		_mrts
		cmpi.b		#$1,($4d9,A5)
		beq		_m_2
		cmpi.b		#$3,($4d9,A5)
		beq		_m_4
		cmpi.b		#$4,($4d9,A5)
		beq		_m_5
		cmpi.b		#$5,($4d9,A5)
		beq		_m_6
		cmpi.b		#$6,($4d9,A5)
		beq		_m_7
_mrts
		jsr		$49ca
		rts

_m_2
		cmpi.b		#$2,($786,A5)
		beq		_mrts
		move.b		#$8E,($23,A6)
		jsr		$49ca	
		rts
_m_4
		cmpi.b		#$2,($786,A5)
		bne		_mrts
		move.b		#$8E,($23,A6)
		jsr		$49ca	
		rts
_m_5
		tst.b		($786,A5)
		bne		_mrts
		move.b		#$8E,($23,A6)
		jsr		$49ca	
		rts
_m_6
		cmpi.b		#$1,($786,A5)
		bne		_mrts
		move.b		#$8E,($23,A6)
		jsr		$49ca	
		rts
_m_7
		cmpi.b		#$2,($786,A5)
		bne		_mrts
		move.b		#$8E,($23,A6)
		jsr		$49ca	
		rts
_pz
		cmpi.b		#$b,($3,A6)
		beq		_pz4
		cmpi.b		#$a,($3,A6)
		beq		_pz2
		cmpi.b		#$3,($3,A6)
		bne		_pz_no
		tst.b		($4d9,A5)
		bne		_pz_no
		cmpi.b		#$2,($786,A5)
		bne		_pz_no
		move.b		#$93,($23,A6)
_pz_no
		jsr		$49ca
		rts
_pz4
		cmpi.b		#$1,($4d9,A5)
		bne		_pz_no
		tst.b		($786,A5)
		bne		_pz_no
		move.b		#$92,($23,A6)
		jsr		$49ca
		rts
_pz2
		cmpi.b		#$2,($4d9,A5)
		bne		_pz_no
		move.b		#$98,($23,A6)
		jsr		$49ca
		rts


*=============================无限模式===============================================
		org		$2855a		*子弹+猎枪
		dc.w		$0014
		
		org		$28562		*子弹+手枪
		dc.w		$0014
		
		org		$28572		*子弹+手枪
		dc.w		$0014
		
		org		$2858a		*子弹+炮弹
		dc.w		$0014
		

		org		$24eac		/炮弹初始弹药
		nop
		jsr		_infinite
		org		$24de0		/手枪初始弹药
		nop
		jsr		_infinite
		org		$24da0		/猎枪初始弹药
		nop
		jsr		_infinite
		org		$106500
_infinite
		tst.b		($7fc0,A5)
		beq		_finite
		moveq		#$14,D0
_finite
		move.w		D0,($6c,A6)
		move.w		D0,($6e,A6)
		rts





*===================================开枪减子弹==================================================
		org		$25212		/猎枪
		org		$252f8		/手枪
		org		$25902		/火箭炮












*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
