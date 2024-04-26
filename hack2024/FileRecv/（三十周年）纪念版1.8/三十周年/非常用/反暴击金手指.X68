*-----------------------------------------------------------
* 名称       :
* 说明       :
* 制作       :
*-----------------------------------------------------------
	org	$116a2		*挨打刷爆击，写
	move.b	(A6,D1.w),($11e,A3)
	
	org	$2b8bc		*读
	move.b	($11e,A2),D0
	
	org	$2b9ee		*读
	move.b	($11e,A6),D0
	
	;org	$4ac1a美
	;move.b	($11e,A2),D0
	
	;org	$4ad4c美
	;move.b	($11e,A6),D0

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
