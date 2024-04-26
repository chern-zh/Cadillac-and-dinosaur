*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-------------------大龙----------------------------------------
	ORG	$63900
	jsr	_dalongseban
	
	org	$101500
_dalongseban	
	cmpi.w	#$158,($20,A6)
	bne	_rtsdl
	tst.b	($4d9,A5)
	beq	_dal1g
	cmpi.b	#$4,($4d9,A5)
	bne	_rtsdl
	move.b	#$88,($23,A6)	
_rtsdl
	move.b	($23,A6),($23,A0)
	rts
_dal1g
	move.b	#$91,($23,A6)
	bra	_rtsdl
*-------------屠夫-----------------------------
	ORG	$588ba
	jsr	_tuseban
	org	$38e30
	jsr	_tuseban14
	org	$101580
_tuseban	
	tst.b	($4d9,A5)
	bne	_rtstu
	move.b	#$9a,($23,A6)	
_rtstu
	jsr	$49ca
	rts
_tuseban14
	tst.b	($4d9,A5)
	bne	_rtstu1
	move.b	#$9a,($23,A6)	
_rtstu1
	rts
*-------------幻影、4B-----------------------------
	ORG	$5c94a
	jsr	_hseban
	org	$4c05e	//4B
	jsr	_sb4boss	
	ORG    	$4c3b4		/4BOSS轨迹修复
	jmp    	_guiji4
	org	$4bf3c		//对话时色斑
	jmp	_64duihua
	org	$101600
_hseban	
	cmpi.b	#$2,($4d9,A5)
	beq	_guan311c
	cmpi.b	#$5,($4d9,A5)
	beq	_guan611c
	cmpi.b	#$7,($4d9,A5)
	beq	_guan811c
	tst.b	($4d9,A5)
	bne	_rtsh
	move.b	#$93,($23,A6)
	bra	_rtsh		
_rtsh
	jsr	$49ca
	rts
_guan311c
	move.b	#$96,($23,A6)
	bra	_rtsh
_guan611c
	move.b	#$82,($23,A6)
	bra	_rtsh
_guan811c
	move.b	#$93,($23,A6)
	bra	_rtsh		
_sb4boss
	tst.b	($4d9,A5)
	beq	_14sb
	cmpi.b	#$4,($4d9,A5)
	bne	_rtsh
	move.b	#$91,($23,A6)
	bra	_rtsh
_14sb
	move.b	#$96,($23,A6)
	bra	_rtsh
_guiji4
	cmpi.b 	#$3,($4d9,A5)
	bne    	_4Bxf_
	cmpi.b 	#$2,($786,A5)
	bne    	_4Bxf_
	cmpi.w	#$440,($744,A5)
	ble	_4Bxf_   
	jsr	$1862
	jmp	$4c3ba
_4Bxf_
	jmp	$4c3ae
_64duihua
	tst.b	($4d9,A5)
	beq	_14sb1
	cmpi.b	#$4,($4d9,A5)
	bne	_jmp49ca
	move.b	#$91,($23,A6)
	bra	_jmp49ca
_14sb1
	move.b	#$96,($23,A6)
_jmp49ca
	jmp	$49ca
*==============猴子色版--小恐龙---------------
	org		$5FFAE
	jmp		_xklsb
	org		$45d30
	jsr		$106f00
	org		$45892
	jsr		$106f00
	org		$5b2b2	//100
	jsr		$106f00
	org		$5b15e	//100
	jsr		$106f00
	org		$106f00
	;cmpi.w		#$50,($20,A6)
	;bne		_rts
	move.b		#$80,($23,A6)	
_rts
	jsr	$49ca
	rts
_xklsb
	tst.b	($4d9,A5)
	bne	_49caj
	cmpi.b	#$2,($786,A5)
	bne	_49caj
	move.b	#$91,($23,A6)
_49caj
	jmp	$49ca
*----------------链球-----------------------
	org	$35a5c	    
	jsr	$180200
	org	$180200
	moveq	#$0,D0
	move.b	($5,A6),D0
	cmpi.b	#$7,($4d9,A5)
	beq	_sehao_8c
	rts
_sehao_8c
	move.b	#$85,($23,A6)	
	rts


*=狮子色板    
		org		$3965c	    
    		jsr		$180100
    		org		$180100
        		moveq		#$0,D0
    		move.b		($5,A6),D0
		tst.b		($4d9,A5)
		beq		_1guanjc    		
		cmpi.b		#$1,($4d9,A5)
		beq		_sehao_2
		cmpi.b		#$2,($4d9,A5)
		beq		_sehao_3
		cmpi.b		#$4,($4d9,A5)
		beq		_sehao_5
		cmpi.b		#$5,($4d9,A5)
		beq		_sehao_6
		rts
_sehao_2
		move.b		#$9e,($23,A6)	
		rts
_sehao_3
		move.b		#$9c,($23,A6)	
		rts
_sehao_5
		move.b		#$9e,($23,A6)	
		rts
_sehao_6
		move.b		#$8a,($23,A6)	
		rts		
_sehao_1
		move.b		#$9c,($23,A6)	
		rts
_1guanjc
		tst.b		($786,A5)
		bne		_sehao_1
		rts







	





















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
