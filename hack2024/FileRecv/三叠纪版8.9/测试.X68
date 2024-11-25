	org		$185000         ;存放暴击程序的空白地址（可以改成别的）              
_bjxscx1        
                        movem.l	D0-D1/A0-A1,-(A7)                          ;D0入栈
                        moveq       #0,D1
                        move.w      #$101,D1                    
                        movea.l     #$90a71c,A0
                        tst.b	($2,A6)                  ;检测1P
                        beq         _show_begin               ;1P
                        move.w      #$192,D1
                        movea.l     #$90af1c,A0
                        cmpi.b      #$1,($2,A6)                          ;检测2P
                        beq         _show_begin
                        move.w      #$19e,D1
                        movea.l     #$90b71c,A0
                        cmpi.b      #$2,($2,A6)                          ;检测3P
                        beq         _show_begin                 _3p
_return               
                        movem.l     (A7)+,D0-D1/A0-A1                                                                                      
                        rts
_show_begin
		     cmpi.b	#$1,($c6,A6)		*是否锁暴击
		     bne		_zcxsbaoji
		     tst.b	($7fbf,A5)		*是否D++
		     bne		_dplus_bjxs
		     suba.l	#$8,A0
_zcxsbaoji
                        moveq	#$0,D0                                  ;清空D0  
                        move.b      ($11e,A6),D0                  ;暴击值代入D0
                        lsr.b       #4,D0                                  ;取十位
                        move.w      D0,($0,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      D1,($2,A0)                  ;样式                        
                        move.b      ($11e,A6),D0                  ;暴击值再次代入D0   
                        andi.b      #$f,D0                                  ;取个位
                        move.w      D0,($80,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      D1,($82,A0)            ;样式
                        bra         _return           
_dplus_bjxs
			lea	$90a714,A1
			lea	_dplusbj,A0
			jsr	$c0a
			bra	_return	
_dplusbj
			dc.l	$02585840	
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
