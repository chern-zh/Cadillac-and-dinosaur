*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        org         $50810
        jmp         $107000
        org         $107000
        move.w      (A0)+,($10,A1)
        cmpi.b      #$2,($4d9,A5)
        beq         _7c_rts
        tst.b       ($3274,A5)
        beq         _p2_
        move.w      ($3284,A5),($10,A1)
        rts
_p2_
        tst.b       ($33f4,A5)
        beq         _p3_
        move.w      ($3404,A5),($10,A1)
        rts
_p3_
        tst.b       ($3574,A5)
        beq         _7c_rts
        move.w      ($3584,A5),($10,A1)
_7c_rts
        rts 
       
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
