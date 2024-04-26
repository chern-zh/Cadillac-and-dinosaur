*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
		org	$5131e
		jsr	_jia_p



		org     $190000
_jia_p		
		moveq   #$0, D0
		cmpa.w  #$a994, A2		*1P地址
		beq     _prts
		addq.b  #1, D0	 
		cmpa.w  #$aa94, A2		*2P地址
		beq     _prts
		addq.b  #1, D0	 
		cmpa.w  #$ab94, A2		*3P地址
		beq     _prts
		addq.b  #1, D0			 
		;cmpa.w  #$ac94, A2		*4P地址
		;bne     _prts
		;move.b  #$3, D0
_prts			 
		rts



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
