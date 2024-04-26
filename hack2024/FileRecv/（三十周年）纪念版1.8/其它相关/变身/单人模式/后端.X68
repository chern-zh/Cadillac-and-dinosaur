                ORG $52ebe              ;马云变身过程的某个指令
                jmp $1a0000
                org $1a0000
                cmpi.w  #$18,$ffff30.l          ;是否狮子密码
                bge     _16c_                   ;大于等于18则跳到16C变身 （有时可能两个狮子变身）
               
                cmpi.w  #$28,$ffff28.l          ;是否胖子密码
                bge     _f4_                   ;大于等于28则跳到F4变身
               
                cmpi.w  #$8,$ffff10.l          ;是否马甲兵密码
                bge     _7c_                   ;大于等于8则跳到7C变身
 
                cmpi.w  #$a0,$ffff1c.l          ;是否铁头龙密码
                bge     _150_                   ;大于等于A0则跳到150变身
 
                cmpi.w  #$38,$ffff2c.l          ;是否刀兵密码
                bge     _11c_                   ;大于等于38则跳到11C变身
 
                cmpi.w  #$90,$ffff18.l          ;是否马云密码
                bge     _a0_                   ;大于等于90则跳到a0变身
                 
                cmpi.w  #$c,$ffff24.l          ;是否链球密码
                bge     _148_                   ;大于等于C则跳到148变身
                
                cmpi.w  #$34,$ffff20.l          ;是否猎人密码
                bge     _c_                   ;大于等于34则跳到C变身
                
                cmpi.w  #$50,$ffff14.l          ;是否猴子密码
                bge     _90_                   ;大于等于50则跳到90变身

_150_                
                move.w  #$150, ($20,A6)  ;
                move.b  #$2, ($26,A6)   ;
                move.b  #$0, ($27,A6)   ;
                subi.w  #$A0,$ffff1c.l          ;清除一个铁头龙密码
                rts
_16c_
                move.l  #$0, ($c4,A6)
                move.w  #$16c, ($20,A6)
                move.w  #$0, ($26,A6)
                subi.w  #$18,$ffff30.l          ;清楚一个狮子密码                
                rts
_148_
                move.l  #$0, ($c4,A6)
                move.w  #$148,($20,A6)
                move.w  #$0, ($26,A6)
                subi.w  #$c,$ffff24.l          ;清楚一个链球密码                
                rts                
_c_
                move.l  #$0, ($c4,A6)
                move.w  #$c, ($20,A6)
                move.w  #$0, ($26,A6)
                subi.w  #$34, $ffff20.l          ;清楚一个猎人密码                
                rts                
                
_90_
                move.l  #$0, ($c4,A6)
                move.w  #$90, ($20,A6)
                move.w  #$0, ($26,A6)
                subi.w  #$50,$ffff14.l          ;清楚一个猴子密码
                rts
_f4_
                move.l  #$0, ($c4,A6)
                move.w  #$f4, ($20,A6)
                move.w  #$0, ($26,A6)
                subi.w  #$28,$ffff28.l          ;清楚一个胖子密码
                rts
_11c_                
                move.l  #$0, ($c4,A6)
                move.w  #$11c, ($20,A6)
                move.w  #$0, ($26,A6)
                subi.w  #$38,$ffff2c.l          ;清除一个刀兵密码
                rts
_7c_                
                move.l  #$0, ($c4,A6)
                move.w  #$7c, ($20,A6)
                move.w  #$0, ($26,A6)
                subi.w  #$8,$ffff10.l          ;清楚一个马甲密码
                rts

_a0_
                move.w  #$a0, ($20,A6)
                subi.w  #$90,$ffff18.l          ;清楚一个马云密码
                rts

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
