*------------------------动态分配123P---------------------------------------		
	org		$145c6	
	jsr		_qfsh				
	org		$14786
	jsr		_qfsh
	org		$146ca
	jsr		_qfsh
	org		$1450a
	jsr		_qfsh
	org		$14488
	jsr		_qfsh
	org		$14436
	jsr		_qfsh			
	org		$14390			
	jsr		_qfsh			
	org		$1433e
	jsr		_qfsh	

	org		$106800
_qfsh
	cmpa.l		#$FffFB274,A0							;是否1P
	beq		_zd1p
	cmpa.l		#$FffFB3f4,A0							;是否2P
	beq		_zd2p
	cmpa.l		#$FffFB574,A0							;是否3P
	beq		_zd3p
_flover
	movem.w		D0-D3, (A4)							*原来被jsr跳转破坏的指令，补回
	addq.l		#8,A4								*原来被jsr跳转破坏的指令，补回
	rts				
_zd3p		
	andi.b		#$F0,D3								;12位清零	
	addq.b		#3,D3								;加2，就是2P指定用914020
	bra		_flover
_zd1p		
	andi.b		#$F0,D3								;12位清零			
	addq.b		#1,D3								;加1，就是1P指定用914060
	bra		_flover
_zd2p		
	andi.b		#$F0,D3								;12位清零			
	addq.b		#2,D3								;加2，就是2P指定用914040
	bra		_flover



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
