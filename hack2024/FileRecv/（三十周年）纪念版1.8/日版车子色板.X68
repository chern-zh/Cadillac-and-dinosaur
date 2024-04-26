*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	ORG	$904ac
	jsr	_cs
	
    	org	$2a0d2		*电台召唤汽车，运行一次的指令
    	jsr	_111
    	
	org	$107000
_cs
	move.b	#$8d,($23,A6)
	move.b	#$8d,($23,A0)
	move.w	#$($8,A0),($8,A6)
_rts
	rts
_111
	jsr	$8fcea
	movem.l 	D0-D6/A0-A3,-(A7)			;入栈(目的借用寄存器)
	moveq	#$0,D0
	moveq	#$0,D1
	jsr	$119c
	divu.w	#$c,D0
	swap	D0
	move.b	_carcolor(PC,D0),D1
	lsl.w   #5,D1
	movea.l #$9141a0,A1			;通用显色位8D
	movea.l #$b60bc,A3
	adda.l  D1,A3
	movem.l (A3),D0-D6/A2
	movem.l D0-D6/A2,(A1)
	or.l	#$f000f000,(A1)+		/设置亮度
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	or.l	#$f000f000,(A1)+
	movem.l	(A7)+,D0-D6/A0-A3			;收工
	rts
_carcolor
	dc.w	$0809,$1e27,$282a,$2d2e,$3b71,$7827



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
