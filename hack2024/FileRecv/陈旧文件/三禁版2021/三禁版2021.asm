*======================禁AB============================
	org		$354c		*按AB键时检测剩余血量
	bra		$357e
	org		$3588		*按AB键时检测剩余血量
	bra		$35ba
	
*===================续币后加载火箭炮=====================
	org		$18b4a		//jsr	$3746
	jmp		$18be0
	
*========================屠夫不掉刀======================
	org		$59f04
	jmp		$59f54
*======================禁道具=========================
	org		$245be		*武器，jsr	$121e
	jmp		_zhayao		*清空并回收内存
	
	
	org		$24976		*补给，分数在一起，jsr	$121e
	jmp		_buji
	
	org		$2d70		*道具拾取优先顺序，无法捡起炸药
	nop
	jsr		_no_zhayao

	org		$b1d0			//1V1,1V2,1V3多模式选择
	jsr		_select
	
	org		$3740			//1V2V3
	jmp		_mstz
	
	org		$18e02			//暴击显示
	jsr		_bjxs
	
	org		$3d6e			*奖命调整
	addq.b	#1,($a3,A6)
	bra		$3d84
*-------------------------------------------------------	
	org		$107000
_zhayao
	cmpi.w	#$18,($26,A6)		*炸药特殊处理
	bne		_1a76
	tst.w	($b0,A6)		*等于0不炸
	beq		_1a76
	jsr		$121e
	jmp		$245c4
_1a76
	jmp		$1a76

_buji
	cmpi.w	#$10,($20,A6)		///检测是否补给
	beq		_1a76
	jsr		$121e
	jmp		$2497a
_no_zhayao
	tst.w	($20,A1)		*检测是否武器
	beq		_no_yiru
	cmpi.w	#$14,($20,A1)		*不允许扛箱子
	beq		_no_yiru
	move.w		D0,($ba,A6)
	move.w		A1,($b8,A6)
_no_yiru
	rts	
	
_select				
	add.w	D0,D0
	move.w	D0,($20,A0)
	btst	#$2,($16,A5)	;1P按了下方向键
	bne		_ms2
	btst	#$2,($17,A5)	;2P按了下方向键
	bne		_ms2
	btst	#$2,($18,A5)	;3P按了下方向键
	bne		_ms2
	btst	#$3,($16,A5)	;1P按了上方向键
	bne		_ms3
	btst	#$3,($17,A5)	;2P按了上方向键
	bne		_ms3
	btst	#$3,($18,A5)	;3P按了上方向键
	bne		_ms3
_ms1
	move.b	#$20,($333a,A5)		/开局锁20暴击出场
	move.b	#$20,($34ba,A5)
	move.b	#$20,($363a,A5)
	clr.b	($7f70,A5)
	rts
_ms3
	move.b	#$30,($333a,A5)		/开局锁30暴击出场
	move.b	#$30,($34ba,A5)
	move.b	#$30,($363a,A5)
	move.b	#$2,($7f70,A5)
	rts
_ms2
	move.b	#$2a,($333a,A5)		/开局锁2A暴击出场
	move.b	#$2a,($34ba,A5)
	move.b	#$2a,($363a,A5)
	move.b	#$1,($7f70,A5)
	rts
	
_mstz
	tst.b	($7f70,A5)
	beq		_v1
_v23
	move.b	($7f70,A5),($4ef,A5)          
	rts
_v1
	move.b	D0,($4ef,A5)
	rts
_bjxs
	jsr		$12bde
	movem.l  D0,-(A7)                          ;D0入栈                  
	clr.l   D0                                  ;清空D0  		
	tst.b  ($2,A6)                  ;检测1P
	bne     _2p                      	  ;不是1P检测2P
	move.b  ($c6,A6),D0                  ;暴击值代入D0                        
	lsr.b   #4,D0                        ;取十位
	move.w  D0,$90a71C                   ;十位数要显示的位置(90a71C改了会移动显示位置)                          
	move.w  #$101,$90a71e                ;样式                        
	move.b  ($c6,A6),D0                  ;暴击值再次代入D0   
	andi.b  #$f,D0                       ;取个位
	move.w  D0,$90a79c                   ;个位数要显示的位置(90a79c改了会移动显示位置)  
	move.w  #$101,$90a79e           	  ;样式
	movem.l  (A7)+,D0   		;D0出栈
	rts
_2p                        
	cmpi.b  #$1,($2,A6)                          ;检测2P
	bne     _3p
	move.b  ($c6,A6),D0
	lsr.b   #4,D0
	move.w  D0,$90af1C
	move.w  #$101,$90af1e
	move.b  ($c6,A6),D0
	andi.b  #$f,D0
	move.w  D0,$90af9c
	move.w  #$101,$90af9e
	movem.l  (A7)+,D0   		;D0出栈
	rts	
_3p                        
	move.b  ($c6,A6),D0
	lsr.b   #4,D0
	move.w  D0,$90b71C
	move.w  #$101,$90b71e
	move.b  ($c6,A6),D0
	andi.b  #$f,D0
	move.w  D0,$90b79C
	move.w  #$101,$90b79E               
	movem.l  (A7)+,D0   		;D0出栈                                                                                   
	rts

_jmtz
	

