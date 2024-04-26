*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
   	 ORG 	 	$AF84
   	 jmp		$107d60
   	 org		$107d60
   	 move.b		#$3c,($a,A6)
	clr.l		$ffff00		
	clr.l		$ffff04
	clr.l		$ffff08
	clr.l		$ffff0c
	clr.l		$ffffe0				
	clr.l		$ffffe4
	clr.l		$ffffe8
	clr.l		$ffffec
	clr.l		$fffff0
	clr.l		$fffff4
	clr.l		$fffff8
	clr.l		$fffffc
	clr.l		$ffff20
	clr.l		$ffff24
	clr.l		$ffff28
	clr.l		$ffff2c
	clr.l		$ffff10
	clr.l		$ffff14
	clr.l		$ffff18
	clr.l		$ffff1c	
	jmp		$af8a    

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
