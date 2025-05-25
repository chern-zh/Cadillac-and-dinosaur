*===========================================凯迪拉克160===========================================================
	org		$8c4e6
	jsr		_cs
	
	org		$2a150		*电台召唤汽车，运行一次的指令
	jsr		_111



	org		$182000
;==================================================================================		
_cs
	move.w		($8,A0),($8,A6)
	cmpi.b		#$2,($4d9,A5)
	bne		_000
	rts
_000
	move.b		#$9c,($23,A6)
	move.b		#$9c,($23,A0)
	cmpi.w		#$f8de,$914390
	bne		_222
	rts
	
	
	
	
_111
	jsr		$8bd24
	cmpi.b		#$2,($4d9,A5)
	bne		_222
	rts
_222
	movem.l		D0-D6/A0-A3,-(A7)			;入栈(目的借用寄存器)
	moveq		#$0,D1
	move.b		#$27,D1
	lsl.w		#5,D1
	movea.l		#$914380,A1			;通用显色位8D
	movea.l		#$b8172,A3
	adda.l		D1,A3
	movem.l		(A3),D0-D6/A2
	movem.l		D0-D6/A2,(A1)
	or.l		#$f000f000,(A1)+		/设置亮度
	or.l		#$f000f000,(A1)+
	or.l		#$f000f000,(A1)+
	or.l		#$f000f000,(A1)+
	or.l		#$f000f000,(A1)+
	or.l		#$f000f000,(A1)+
	or.l		#$f000f000,(A1)+
	or.l		#$f000f000,(A1)+
	movem.l		(A7)+,D0-D6/A0-A3			;收工
	rts





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
