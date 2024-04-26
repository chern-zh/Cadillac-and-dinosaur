*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*=========================NOP掉不可选相同人物指令================================================
	org	$b23a
	nop
	nop
	nop
	
	org	$728c
	nop
	nop
	nop
	
	org	$72b8
	nop
	nop
	nop
	
	org	$72e4
	nop
	nop
	nop
	nop

*--------------------------------------------------------------------------------------------------------
	org	$18b100
	dc.w	$0002,$0000,$0009,$e508,$0000,$1a00,$50e4,$0000
	dc.w	$0002,$0004,$0009,$F4C4,$0C00,$0100,$5104,$0000
	dc.w	$0002,$0008,$000A,$0744,$1800,$3900,$5124,$0000
	dc.w	$0002,$000c,$000A,$1788,$2400,$0100,$5144,$0000
	
	org     $AAF6
	jsr     _ajbs
	
*===========================开始键，切换模式====================================	
	org	$18b200	
_ajbs
	jsr	$186cc
	movem.l	D0-D7/A0-A6,-(A7)
	moveq	#0,D3
	moveq	#0,D2       
	move.b	($1a,A5),D2
	move.b	($1f,A5),D3
	not.b	D3
	and.b	D3,D2
	btst	#$0,d2           ;1P按了开始
	bne	_1pms
	btst	#$1,d2           ;1P按了开始
	bne	_2pms     
	btst	#$2,d2           ;1P按了开始
	bne	_3pms      
_bsover       
       movem.l  (A7)+,D0-D7/A0-A6         
       rts
_1pms
	cmpi.b	#1,($7f3c,A5)
	bne	_1get_1
	move.b	#$2,($7f3c,A5)
	bra	_1Pxc
_1get_1
	move.b	#$1,($7f3c,A5)	
*1P手雷显存
_1Pxc
	moveq	#$0,D0                          ;清空D0  
	move.b	($7f3c,A5),D0                  ;代入D0                        
	move.w	D0,$90a59C                          ;                          
	move.w	#$181,$90a59e                  ;样式
	bra	_bsover
	
_2pms
	cmpi.b	#1,($7f3d,A5)
	bne	_2get_1
	move.b	#$2,($7f3d,A5)
	bra	_2Pxc
_2get_1
	move.b	#$1,($7f3d,A5)
*2P手雷显存
_2Pxc
	moveq	#$0,D0                        ;清空D0  
	move.b	($7f3d,A5),D0                  ;代入D0                        
	move.w	D0,$90ad9C                          ;                          
	move.w	#$181,$90ad9e                  ;样式
	bra	_bsover
	
_3pms	
	cmpi.b	#1,($7f3e,A5)
	bne	_3get_1
	move.b	#$2,($7f3e,A5)
	bra	_3Pxc
_3get_1
	move.b	#$1,($7f3e,A5)
*3P手雷显存
_3Pxc
	moveq	#$0,D0                        ;清空D0  
	move.b  ($7f3e,A5),D0                  ;代入D0                        
	move.w  D0,$90B59C                          ;                          
	move.w  #$181,$90B59E                  ;样式
	bra	_bsover
		
	;org	$19702		*AB过程才会运行的指令,jsr	$1426
	;jsr	_ABmsqh
*====================================================================
          

	
*====================关卡显存、模式显存、BOSS血量显存、强制过关=====================

	org	$103ea		*时间指令，每秒一次
	jsr	_wx_time
	org	$18b500
_wx_time	
	movem.l	D0-D6/A0-A6,-(A7)
	movem.l	(A7)+,D0-D6/A0-A6
	rts

*--------------------------申请手雷------------------------------------	
_applyssll
	movem.l	D0-D6/A0-A6,-(A7)
	movea.l	#$FFFFB274,A6	*A6为1P玩家
	movea.l	#$FFFFB3F4,A0
	cmpi.b	#$1,($0,A6)
	bne	_2P
*1P手雷显存
	moveq	#$0,D0                          ;清空D0  
	move.b	($7f3c,A5),D0                  ;代入D0                        
	move.w	D0,$90a59C                          ;                          
	move.w	#$181,$90a59e                  ;样式
	tst.w	($b4,A6)
	bne	_2P
	cmpi.b	#$2,($7f3c,A5)	*1P状态是否2
	bne	_2P
	jsr	$4818		*申请新手雷
	bcs	_rts
	move.b	#$1,($0,A0)
	move.w	($2,A6),($2,A0)
	move.w	#$0,($20,A0)
	move.w	#$1A,($26,A0)
	move.w	($8,A6),($8,A0)
	move.w	($c,A6),($c,A0)
	move.w	($10,A6),($10,A0)
	move.w	A6,($70,A0)
	move.w	A0,($b4,A6)
	movea.l	A6,A2
	movea.l	A0,A6
	moveq	#$0,D0
	jsr	$24d44
	move.w	#$258,($a4,A6)
	move.b	#$8,($5,A6)
	movea.l	A6,A0
	movea.l	A2,A6
	move.w	($a0,A0),($b6,A6)
_2P
	movea.l	#$FFFFB3F4,A6	
	cmpi.b	#$1,($0,A6)
	bne	_3P
*2P手雷显存
	moveq	#$0,D0                        ;清空D0  
	move.b  ($7f3d,A5),D0                  ;代入D0                        
	move.w  D0,$90ad9C                          ;                          
	move.w  #$181,$90ad9e                  ;样式
	tst.w	($b4,A6)
	bne	_3P
	cmpi.b	#$2,($7f3d,A5)
	bne	_3P
	jsr	$4818		*申请新手雷
	bcs	_rts
	move.b	#$1,($0,A0)
	move.w  ($2,A6),($2,A0)
	move.w  #$0,($20,A0)
	move.w  #$1A,($26,A0)
	move.w  ($8,A6),($8,A0)
	move.w  ($c,A6),($c,A0)
	move.w  ($10,A6),($10,A0)
	move.w  A6,($70,A0)
	move.w  A0,($b4,A6)
	movea.l	A6,A2
	movea.l	A0,A6
	moveq   #$0,D0
	jsr     $24d44
	move.w  #$258,($a4,A6)
	move.b  #$8,($5,A6)
	movea.l	A6,A0
	movea.l	A2,A6
	move.w  ($a0,A0),($b6,A6)
_3P
	movea.l	#$FFFFB574,A6	
	cmpi.b	#$1,($0,A6)
	bne	_rts
*3P手雷显存
	moveq	#$0,D0                        ;清空D0  
	move.b  ($7f3e,A5),D0                  ;代入D0                        
	move.w  D0,$90B59C                          ;                          
	move.w  #$181,$90B59E                  ;样式
	tst.w	($b4,A6)
	bne	_rts
	cmpi.b	#$2,($7f3e,A5)
	bne	_rts
	jsr	$4818		*申请新手雷
	bcs	_rts
	move.b	#$1,($0,A0)
	move.w  ($2,A6),($2,A0)
	move.w  #$0,($20,A0)
	move.w  #$1A,($26,A0)
	move.w  ($8,A6),($8,A0)
	move.w  ($c,A6),($c,A0)
	move.w  ($10,A6),($10,A0)
	move.w  A6,($70,A0)
	move.w  A0,($b4,A6)
	movea.l	A6,A2
	movea.l	A0,A6
	moveq   #$0,D0
	jsr     $24d44
	move.w  #$258,($a4,A6)
	move.b  #$8,($5,A6)
	movea.l	A6,A0
	movea.l	A2,A6
	move.w  ($a0,A0),($b6,A6)
_rts	
	movem.l	(A7)+,D0-D6/A0-A6
	lea	($5ec,A5),A6
	move.w	($744,A5),D0
	rts
*------------清理手榴弹内存
_clr_grenade
	cmpi.w	#$1a,($26,A6)
	bne	_24642
	tst.b	($3274,A5)
	beq	_2pzf
	cmpi.b	#$2,($7f3c,A5)
	beq	_48d4
_2pzf
	tst.b	($33f4,A5)
	beq	_3pzf
	cmpi.b	#$2,($7f3d,A5)
	beq	_48d4
_3pzf
	tst.b	($3574,A5)
	beq	_24642
	cmpi.b	#$2,($7f3e,A5)
	beq	_48d4
	bra	_24642
_48d4
	jmp	$48d4	*清理并回收内存
_24642
	jsr	$121e
	jmp	$24642
*=============================选关功能=======================================
_xuanguan
	subq.b	#1,($a,A6)
	movem.l	D0-D1/A0,-(A7)
	moveq	#$0,D0
	moveq	#$0,D1
	move.b	($16,A5),D0
	move.b	($1b,A5),D1
	not.b	D1
	and.b	D1,D0
	btst    #$3,D0    ;1P按了上方向键
	bne     _gq_up
	btst	#$2,D0    ;1P按了下方向键
	bne     _gq_down	
_no_xg
	movem.l (A7)+, D0-D1/A0
	jmp	$afa6
_gq_up
	addq.w	#$1,($7f20,A5)
	andi.w	#$7,($7f20,A5)
	bra	_gqxc0
_gq_down
	subq.w	#$1,($7f20,A5)
	andi.w	#$7,($7f20,A5)
_gqxc0
	move.w	($7f20,A5),D0
	move.w	#$0,$90AB1C	*十位
	move.w	#$19f,$90AB1E
	andi.b	#$7,D0
	addq.b	#1,D0
	move.w	D0,$90AB9C	*个位
	move.w	#$19f,$90AB9E		
	movem.l	(A7)+,D0-D1/A0
	movem.l	D0-D2/A0,-(A7)
	move.l	#$32,D0
	moveq	#$0,D1
	moveq	#$0,D2
	jsr	$a63c
	movem.l	(A7)+,D0-D2/A0
	jmp	$afa6

	org	$af7c
	jmp	_xuanguan
	
*=============================选关功能=======================================
*=============================================================================	
*--------------------------------申请手雷----------------------------------
	org	$186e4
	nop
	jsr	_applyssll
*------------------------清楚手雷OBJ，防止刷手雷爆内存，落地即消失----------------
	org	$2463c
	jmp	_clr_grenade













































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
