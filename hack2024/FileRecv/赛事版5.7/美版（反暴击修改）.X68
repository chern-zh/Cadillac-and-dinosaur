*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org	$11770		*挨打刷爆击，写
	move.b	(A6,D1.w),($11f,A3)
	
	org	$2b98a		*读
	move.b	($11f,A2),D0
	
	org	$2babc		*读
	move.b	($11f,A6),D0
	
	;org	$4ac1a
	;move.b	($11e,A2),D0
	
	;org	$4ad4c
	;move.b	($11e,A6),D0



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
