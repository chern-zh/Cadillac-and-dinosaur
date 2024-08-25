*---------------------------------暴击显示----------------------------------------------------------------

                        org		    $185000         ;存放暴击程序的空白地址（可以改成别的）                      
                        movem.l		D0/A0,-(A7)                          ;D0入栈                    
                        movea.l     #$90a69c,A0
                        tst.b		($2,A6)                  ;检测1P
                        beq         _show_begin               ;1P
                        movea.l     #$90ae9c,A0
                        cmpi.b      #$1, ($2,A6)                          ;检测2P
                        beq         _show_begin
                        movea.l     #$90b69c,A0
                        cmpi.b      #$2, ($2,A6)                          ;检测3P
                        beq         _show_begin                 _3p
_return               
                        movem.l     (A7)+,D0/A0                                                                                      
                        rts
_show_begin
                        moveq		#$0,D0                                  ;清空D0  
                        move.b      ($11e,A6),D0                  ;暴击值代入D0
                        cmpi.b      #$a0,D0
                        beq         _a0_show
                        move.w      #$20,($0,A0)
                        lsr.b       #4, D0                                  ;取十位
                        move.w      D0, ($80,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      #$102,($82,A0)                  ;样式                        
                        move.b      ($11e,A6),D0                  ;暴击值再次代入D0   
                        andi.b      #$f, D0                                  ;取个位
                        move.w      D0,($100,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      #$102,($102,A0)            ;样式
                        bra         _return           
_a0_show
                        move.w      #$1,($0,A0)
                        move.w      #$102,($2,A0)
                        move.w      #$0, ($80,A0)                          ;十位数要显示的位置(90a71C改了会移动显示位置)                          
                        move.w      #$102,($82,A0)                  ;样式                           
                        move.w      #$0,($100,A0)                          ;个位数要显示的位置(90a79c改了会移动显示位置)  
                        move.w      #$102,($102,A0)            ;样式
                        bra         _return

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
