；---------------------------幻影个数与出场坐标-----------------------------------
；----------------------第一只11C出场坐标--------------------------------------
	org			$81928
	move.w		#$5a0,($8,A0)		;X坐标
	move.w		#$30,($10,A0)		;Y坐标	

；----------------------第二只11C出场坐标---------------------------------------
	org			$81952
	move.w		#$5a0,($8,A0)		;X坐标
	move.w		#$50,($10,A0)		;Y坐标
	
；----------------------第三只11C出场坐标---------------------------------------
	org			$8198c
	move.w		#$5a0,($8,A0)		;X坐标
	move.w		#$10,($10,A0)		;Y坐标	

;---------------------------加载4只以上11C--------------------------------------
	org			$81968		;检测玩家数量，是否加载第三个11C的判断地址
	jmp			$186000		;
	org			$186000
	;tst.b		($4ef,A5)		;跳转破坏的原指令，没用了，检测当前玩家数量是否一人
	;beq		_8199c			;终止加载幻影
	cmpi.b		#$2,$ffffee		;检测当前玩家数量是否3人
	bne			_4zhi	
*-------------------------三人模式加载第4只11C--------------------------------------------------
	jsr			$483c		;调内存
	bcs			_81a72		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b0,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$560,($8,A0)		;X坐标
	move.w		#$40,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体		
*-------------------------三人模式加载第5只11C----------------------------------------------------------
	jsr			$483c		;调内存
	bcs			_81a72		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b2,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$560,($8,A0)		;X坐标
	move.w		#$20,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体
	bra			_8196e	
_81a72
	jmp			$81a72
*-------------------------单、两人模式加载第4只11C-----------------------------------	
_4zhi	
	jsr			$483c		;调内存
	bcs			_81a72		;内存占满
	addq.b		#1,($aa,A6)	;幻影个数+1
	move.b		#$1,($0,A0)
	move.w		#$11c,($20,A0)
	move.w		A0,($b0,A6)		;单体幻影11C地址加到主体0084，过关要用
	move.w		#$560,($8,A0)		;X坐标
	move.w		#$30,($10,A0)		;Y坐标
	move.w		A6,($c6,A0)		;加归属体，多位一体		
_8196e
	jmp			$8196e

*----------------------------------7BOSS派兵------------------------------------------
	;org		$819a4
	;jsr		$1b0200
	;org		$1b0200
	;cmpi.b		#$1,($4ef,A5)		;仅双人模式下派兵
	;bne		_pbrts
	;jsr		$7bedc
_pbrts
	;rts	


*-----------------------------判断11C存在，过关----------------------------------
	org			$819e6
	jmp			$186200
	org			$186200
	or.w		($a4,A6),D0	
	or.w		($b0,A6),D0
	or.w		($b2,A6),D0		
	bne			_81a04		；是否全部11C阵亡
	jmp			$819ec		；全部阵亡，进入过关程序
_81a04
	jmp			$81a04	

*-----------------------------全部11C血量加到主体0084上----------------------------------
	org			$81a42
	jmp			$186300
	org			$186300
	tst.w		($b0,A6)
	beq			_B2jc
	movea.w		($b0,A6),A0
	move.w		($6c,A0),D0
	add.w		D0,($6c,A6)
	move.w		($6e,A0),D0
	add.w		D0,($6e,A6)	
_B2jc	
	tst.w		($b2,A6)
	beq			_A4jc
	movea.w		($b2,A6),A0
	move.w		($6c,A0),D0
	add.w		D0,($6c,A6)
	move.w		($6e,A0),D0
	add.w		D0,($6e,A6)
_A4jc
	tst.w		($a4,A6)
	beq			_81a5c
	jmp			$81a48
_81a5c
	jmp			$81a5c	

*-----------------------------11C阵亡减1、死亡幻影放入($a8,A0)，用于过关慢动作----------------------------------
	org			$81ad2
	jmp			$186400
	org			$186400
	tst.w		($b0,A0)
	beq			_B2tst
	move.w		($b0,A0),D0
	cmpa.w		D0,A6
	bne			_B2tst
	subq.b		#1,($aa,A0)
	bne			_nob0a8		；是否是最后一只幻影	
	move.w		D0,($a8,A0)	；是，放入($a8,A0)，过关用到
_nob0a8
	clr.w		($b0,A0)		；从0084主体中清除当前幻影地址


_B2tst
	tst.w		($b2,A0)
	beq			_a4tst
	move.w		($b2,A0),D0
	cmpa.w		D0,A6
	bne			_a4tst
	subq.b		#1,($aa,A0)
	bne			_nob2a8		；是否最后一只幻影	
	move.w		D0,($a8,A0)	；是，放入($a8,A0)，过关用到
_nob2a8
	clr.w		($b2,A0)		；从0084主体中清除当前幻影地址

_a4tst
	tst.w		($a4,A0)
	beq			_81aee	
	jmp			$81ad8
_81aee
	jmp			$81aee


;-------------------------------11C免疫队友飞轮散花-----------------------------------------
	org			$81b14
	jmp			$186500
	org			$186500
	tst.w		($b0,A6)
	beq			_jcb2
	movea.w		($b0,A6),A0
	move.w		A0,(-$70bc,A5)	
	jmp			$81b22
_jcb2
	tst.w		($b2,A6)
	beq			_jca4
	movea.w		($b2,A6),A0
	move.w		A0,(-$70bc,A5)
_81b22	
	jmp			$81b22
_jca4
	tst.w		($a4,A6)
	beq			_81b22
	jmp			$81b1a

;------------------------------11C互相接收飞镖------------------------------------------
	org			$455c8
	nop
	jmp			$186600
	org			$186600	
	movea.w		($b0,A6),A0
	movea.w		($b0,A0),A0		；4号11C地址移到A0
	tst.b		($0,A0)			；检测4号11C
	beq			_5hao11C
	jsr			$455ec
	bcs			_455e2		
_5hao11C
	movea.w		($b0,A6),A0
	movea.w		($b2,A0),A0		；5号11C地址移到A0
	tst.b		($0,A0)
	beq			_3hao11C
	jsr			$455ec
	bcs			_455e2
_3hao11C
	movea.w		($b0,A6),A0		；跳转破坏的两个指令
	movea.w		($a4,A0),A0		；3号11C地址移到A0
	jmp			$455d0
_455e2
	jmp			$455e2



