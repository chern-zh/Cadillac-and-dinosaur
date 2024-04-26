     ORG  $20448
     jsr $101490
     
     ORG  $101490
    movem.l d0-d7/a0-a6,-(a7)
    cmpi.b   #$0,($4d9,a5)
    beq     _1_
    cmpi.b   #$1,($4d9,a5)
    beq     _3_
    cmpi.b   #$2,($4d9,a5)
    beq     _1_
    cmpi.b   #$3,($4d9,a5)
    beq     _3_
    cmpi.b   #$4,($4d9,a5)
    beq     _2_
    cmpi.b   #$5,($4d9,a5)
    beq     _3_
    cmpi.b   #$6,($4d9,a5)
    beq     _4_
    cmpi.b   #$7,($4d9,a5)
    beq     _4_
_j_  
    jsr $8a44                   //载入色板？
    jsr $892c                   //设置亮度
    move.b #$c,($4d0,a5)
    jsr $2228a                  //加载场景
    jsr $162ae
    movem.l (a7)+,d0-d7/a0-a6   
    rts      
_3_
    move.b #$2,($786,a5)
    bra    _j_
_2_
    move.b #$1,($786,a5)
    bra    _j_
_4_
    move.b #$3,($786,a5)
    bra    _j_
_1_
    move.b #$0,($786,a5)
    bra    _j_ 
   

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
