04CED4: 7000                       moveq   #$0, D0
04CED6: 222E 00B4                  move.l  ($b4,A6), D1
04CEDA: 102E 00B2                  move.b  ($b2,A6), D0
04CEDE: E748                       lsl.w   #3, D0
04CEE0: E0A9                       lsr.l   D0, D1
04CEE2: 0281 0000 00FF             andi.l  #$ff, D1
04CEE8: 1D41 007C                  move.b  D1, ($7c,A6)
04CEEC: 4E75                       rts
04CEEE: 7200                       moveq   #$0, D1
04CEF0: 122E 007C                  move.b  ($7c,A6), D1
04CEF4: 306E 0076                  movea.w ($76,A6), A0
04CEF8: 102E 00AC                  move.b  ($ac,A6), D0
04CEFC: 0C00 0002                  cmpi.b  #$2, D0
04CF00: 6E00 0026                  bgt     $4cf28
04CF04: D241                       add.w   D1, D1
04CF06: 323B 101C                  move.w  ($1c,PC,D1.w), D1
04CF0A: D268 0008                  add.w   ($8,A0), D1
04CF0E: 3D41 0088                  move.w  D1, ($88,A6)
04CF12: 3428 0010                  move.w  ($10,A0), D2
04CF16: 5842                       addq.w  #4, D2
04CF18: 3D42 008A                  move.w  D2, ($8a,A6)
04CF1C: 6100 00B0                  bsr     $4cfce
04CF20: 6000 0136                  bra     $4d058
04CF24: FF60                       dc.w    $ff60; opcode 1111
04CF26: 00A0 D241 D241             ori.l   #$d241d241, -(A0)
04CF2C: 43FB 1016                  lea     ($16,PC,D1.w), A1
04CF30: 3219                       move.w  (A1)+, D1
04CF32: 3D41 0088                  move.w  D1, ($88,A6)
04CF36: 3419                       move.w  (A1)+, D2
04CF38: 3D42 008A                  move.w  D2, ($8a,A6)
04CF3C: 6100 0090                  bsr     $4cfce
04CF40: 6000 0116                  bra     $4d058

04B0 0054 04C0 0038 04D0 0020 0528 0054 0538 0038 0548 0020 05A0 0054 05B0 0038 05C0 0020

04CF44: 04B0 0054 04C0 0038        subi.l  #$5404c0, ($38,A0,D0.w)
04CF4C: 04D0                       dc.w    $04d0; ILLEGAL
04CF4E: 0020 0528                  ori.b   #$28, -(A0)
04CF52: 0054 0538                  ori.w   #$538, (A4)
04CF56: 0038 0548 0020             ori.b   #$48, $20.w
04CF5C: 05A0                       bclr    D2, -(A0)
04CF5E: 0054 05B0                  ori.w   #$5b0, (A4)
04CF62: 0038 05C0 0020             ori.b   #$c0, $20.w

===========================================================7BOSS===========================================================

05EFC8: 7200                       moveq   #$0, D1
05EFCA: 122E 007C                  move.b  ($7c,A6), D1
05EFCE: 306E 0076                  movea.w ($76,A6), A0
05EFD2: 102E 00AC                  move.b  ($ac,A6), D0
05EFD6: 0C00 0002                  cmpi.b  #$2, D0
05EFDA: 6E00 0024                  bgt     $5f000
05EFDE: D241                       add.w   D1, D1
05EFE0: 323B 101A                  move.w  ($1a,PC,D1.w), D1
05EFE4: D268 0008                  add.w   ($8,A0), D1
05EFE8: 3D41 0088                  move.w  D1, ($88,A6)
05EFEC: 3428 0010                  move.w  ($10,A0), D2
05EFF0: 3D42 008A                  move.w  D2, ($8a,A6)
05EFF4: 6100 00B2                  bsr     $5f0a8
05EFF8: 6000 0138                  bra     $5f132
05EFFC: FF50                       dc.w    $ff50; opcode 1111
05EFFE: 00B0 D241 D241 43FB        ori.l   #$d241d241, INVALID 30
05F006: 1016                       move.b  (A6), D0
05F008: 3219                       move.w  (A1)+, D1
05F00A: 3D41 0088                  move.w  D1, ($88,A6)
05F00E: 3419                       move.w  (A1)+, D2
05F010: 3D42 008A                  move.w  D2, ($8a,A6)
05F014: 6100 0092                  bsr     $5f0a8
05F018: 6000 0118                  bra     $5f132
05F01C: 0490 0054 04A0             subi.l  #$5404a0, (A0)
05F022: 0038 04B0 0018             ori.b   #$b0, $18.w
05F028: 0508 0054                  movep.w ($54,A0), D2
05F02C: 0518                       btst    D2, (A0)+
05F02E: 0038 0528 0018             ori.b   #$28, $18.w
05F034: 0580                       bclr    D2, D0
05F036: 0054 0590                  ori.w   #$590, (A4)
05F03A: 0038 05A0 0018             ori.b   #$a0, $18.w