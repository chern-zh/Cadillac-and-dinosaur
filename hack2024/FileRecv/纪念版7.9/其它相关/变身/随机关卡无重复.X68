    ORG $abec
    jmp $199000
    ORG $199000
    movem.l D0-D5,-(A7)   
    addi.b  #$1,$ffff20    ;表示过关次数，每次加1，放入ffff20，
    cmpi.b  #$7,$ffff20     ;过7次关了，说明是8关
    beq     _7_
    cmpi.b  #$6,$ffff20
    beq     _6_
    cmpi.b  #$5,$ffff20
    beq     _5_
    cmpi.b  #$4,$ffff20
    beq     _4_
    cmpi.b  #$3,$ffff20
    beq     _3_
    cmpi.b  #$2,$ffff20
    beq     _2_
;--------以上都不是，说明是第一次过关-----------------
_1_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0               ;第一次过关不可与1关相同
    beq     _1_
    move.b  D0,$ffff30 
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5  
    jmp     $abf2
_2_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _2_
    move.b  $ffff30,D1
    cmp.b   D0,D1
    beq     _2_
    move.b  D0,$ffff32      ;第2次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5   
    jmp     $abf2  
_3_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _3_
    move.b  $ffff30,D1
    cmp.b  D0,D1
    beq     _3_
    move.b  $ffff32,D2
    cmp.b  D0,D2
    beq     _3_    
    move.b  D0,$ffff34      ;第3次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2
_4_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _4_
    move.b  $ffff30,D1   
    cmp.b  D0,D1
    beq     _4_
    move.b  $ffff32,D2    
    cmp.b  D0,D2
    beq     _4_ 
    move.b  $ffff34,D3
    cmp.b  D0,D3
    beq     _4_   
    move.b  D0,$ffff36      ;第4次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2    
_5_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _5_
    move.b  $ffff30,D1
    cmp.b  D0,D1
    beq     _5_
    move.b  $ffff32,D2
    cmp.b  D0,D2
    beq     _5_
    move.b  $ffff34,D3 
    cmp.b  D0,D3
    beq     _5_
    move.b  $ffff36,D4
    cmp.b  D0,D4
    beq     _5_    
    move.b  D0,$ffff38      ;第5次过关
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2
_6_
    clr.l   D0
    jsr $119c           ;进入随机程序
    divu.w  #$7,D0      ；限制范围
    swap    D0          ；此时D0低位为【0,6】        
    tst.w   D0
    beq     _6_
    move.b  $ffff30,D1
    cmp.b  D0,D1
    beq     _6_
    move.b  $ffff32,D2
    cmp.b  D0,D2
    beq     _6_
    move.b  $ffff34,D3
    cmp.b  D0,D3
    beq     _6_
    move.b  $ffff36,D4
    cmp.b  D0,D4
    beq     _6_    
    move.b  $ffff38,D5
    cmp.b  D0,D5
    beq     _6_    
    clr.l   $ffff30
    clr.l   $ffff34
    clr.l   $ffff38
    move.b  D0,($4d9,A5)
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5    
    jmp     $abf2
    
_7_
    move.b  #$7,($4d9,A5)   ;直接把7放入，进行第八关
    andi.b  #$7,($4d9,A5)
    movem.l (A7)+,D0-D5 
    clr.b   $ffff20  
    jmp     $abf2    




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
