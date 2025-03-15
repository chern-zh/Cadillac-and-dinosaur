
                ORG $52ebe              ;马云变身过程的某个指令
                jmp $1a0000
                org $1a0000
                cmpi.b  #$0,($4ef,A5)           ;检测当前玩家数量是否一人          
                beq     _1_player_            ;是，则跳到单人模式
                cmpi.b  #$1,($4ef,A5)           ;检测当前玩家数量是否两人        
                beq     _2_player_            ;是，则跳到两人模式;否，则进入下列三人模式

;------------------------------------三人模式----------------------------------------                
_3_player_
                cmpi.b  #$0, ($4d9,A5)  ;
                beq     _1_guan_
                cmpi.b  #$1, ($4d9,A5)  ;
                beq     _2_guan_           ;
                cmpi.b  #$2, ($4d9,A5)  ;
                beq     _3_guan_            ;
                cmpi.b  #$3, ($4d9,A5)  ;
                beq     _4_guan_           
                cmpi.b  #$4, ($4d9,A5)  ;
                beq     _5_guan_            ;
                cmpi.b  #$5, ($4d9,A5)  ;
                beq     _6_guan_            ;
                cmpi.b  #$6, ($4d9,A5)  ;
                beq     _7_guan_           ;
                cmpi.b  #$7, ($4d9,A5)  ;
                beq     _8_guan_      
                
                move.w  #$a0, ($20,A6)  ;
                move.b  #$2, ($26,A6)   ;
                move.b  #$0, ($27,A6)   ;
                rts
_16c_
                move.l  #$0, ($c4,A6)
                move.w  #$16c, ($20,A6)
                move.w  #$0, ($26,A6)
                rts
_90_
                move.l  #$0, ($c4,A6)
                move.w  #$90, ($20,A6)
                move.w  #$0, ($26,A6)
                rts
_f4_
                move.l  #$0, ($c4,A6)
                move.w  #$f4, ($20,A6)
                move.w  #$0, ($26,A6)
                rts
_11c_                
                move.l  #$0, ($c4,A6)
                move.w  #$11c, ($20,A6)
                move.w  #$0, ($26,A6)
                rts
_a0_
                move.w  #$a0, ($20,A6)
                rts

;-------------------------单人模式-----------------------------
_1_player_
                ;cmpi.b  #$0, ($4d9,A5)   ;是否第一 
                ;beq     _1_guan_
                ;cmpi.b  #$1, ($4d9,A5)  ;2关
                ;beq     _2_guan_           ;
                ;cmpi.b  #$2, ($4d9,A5)  ;3关
                ;beq     _3_guan_            ;
                ;cmpi.b  #$3, ($4d9,A5)  ;4关
                ;beq     _4_guan_           
                ;cmpi.b  #$4, ($4d9,A5)  ;5关
                ;beq     _5_guan_            ;
                ;cmpi.b  #$5, ($4d9,A5)  ;6关
                ;beq     _6_guan_            ;
                ;cmpi.b  #$6, ($4d9,A5)  ;7关
                ;beq     _7_guan_           ;
                ;cmpi.b  #$7, ($4d9,A5)  ;8关
                ;beq     _8_guan_  
;---------------------------------------------------------------------------
;马甲兵10，猴子14，马云18，铁头龙1C，猎人20，链球24，胖子28，刀兵2C，狮子30
;---------------------------------------------------------------------------
    
_1_guan_
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
                subi.w  #$18,$ffff30.l          ;清楚一个狮子密码
                rts
              
                
;-------------------------双人模式-----------------------------
_2_player_                




*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~8~
