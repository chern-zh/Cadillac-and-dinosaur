*-----------M16多倍子弹-------------------
	org		$25722
	jsr		$18a000
	org		$18a000	
	movem.l D0-D7/A0-A6, -(A7)
	jsr     $26414.l
	jsr     $26414.l
	addq.w  #5, ($c,A0)
	jsr     $26414.l
	subq.w  #5, ($c,A0)
	movem.l (A7)+, D0-D7/A0-A6
	moveq   #$12, D3
	rts
*-----------UZI机枪多倍子弹-------------------
	org		$255bc
	jsr		$18a100
	org		$18a100
	movem.l D0-D7/A0-A6, -(A7)
	jsr     $26414.l
	jsr     $26414.l
	addq.w  #5, ($c,A0)
	jsr     $26414.l
	subq.w  #5, ($c,A0)
	movem.l (A7)+, D0-D7/A0-A6
	moveq   #$12, D3
	rts

*---------------手枪-------------------------	
	org		$2533e
	jsr		$18a200
	org		$18a200
	movem.l D0-D7/A0-A6, -(A7)
	jsr     $26414.l
	jsr     $26414.l
	addi.w  #$10, ($c,A0)
	jsr     $26454.l
	subi.w  #$10, ($c,A0)
	movem.l (A7)+, D0-D7/A0-A6
	moveq   #$f, D3
	rts
	
*-----------火箭炮-----------------------------
	org		$25930
	jsr		$18a300
	org		$18a300
	movem.l D0-D7/A0-A6, -(A7)
	jsr     $26454.l
	jsr     $26454.l
	addi.w  #$10, ($c,A0)
	jsr     $26454.l
	subi.w  #$10, ($c,A0)
	movem.l (A7)+, D0-D7/A0-A6
	subq.w  #1, D2
	rts	



*-----------猎枪-----------------------------
	org		$25258
	jsr		$18a400
	org		$18a400
	movem.l D0-D7/A0-A6, -(A7)
	jsr     $26414.l
	jsr     $26414.l
	addi.w  #$10, ($c,A0)
	jsr     $26454.l
	subi.w  #$10, ($c,A0)
	movem.l (A7)+, D0-D7/A0-A6
	moveq   #$10, D3
	rts



*---------------霰弹枪--------------------------
	org		$2581c
	;bsr		$2648a
	;moveq	#$11,D3


*------------废弃的？什么的？-------------------------------
	
	movem.l D0-D7/A0-A6, -(A7)
	jsr     $2648a.l
	jsr     $26414.l
	addi.w  #$10, ($c,A0)
	jsr     $26454.l
	subi.w  #$10, ($c,A0)
	movem.l (A7)+, D0-D7/A0-A6
	moveq   #$11, D3
	rts
	