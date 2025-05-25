04CF02: 7000                       moveq   #$0, D0
04CF04: 222E 00B4                  move.l  ($b4,A6), D1
04CF08: 102E 00B2                  move.b  ($b2,A6), D0
04CF0C: E748                       lsl.w   #3, D0
04CF0E: E0A9                       lsr.l   D0, D1
04CF10: 0281 0000 00FF             andi.l  #$ff, D1
04CF16: 1D41 007C                  move.b  D1, ($7c,A6)
04CF1A: 4E75                       rts

04CF1C: 7200                       moveq   #$0, D1
04CF1E: 122E 007C                  move.b  ($7c,A6), D1				*这是什么标志？
04CF22: 306E 0076                  movea.w ($76,A6), A0
04CF26: 102E 00AC                  move.b  ($ac,A6), D0
04CF2A: 0C00 0002                  cmpi.b  #$2, D0
04CF2E: 6E00 0026                  bgt     $4cf56
04CF32: D241                       add.w   D1, D1
04CF34: 323B 101C                  move.w  ($1c,PC,D1.w), D1
04CF38: D268 0008                  add.w   ($8,A0), D1
04CF3C: 3D41 0088                  move.w  D1, ($88,A6)
04CF40: 3428 0010                  move.w  ($10,A0), D2
04CF44: 5842                       addq.w  #4, D2
04CF46: 3D42 008A                  move.w  D2, ($8a,A6)
04CF4A: 6100 00B0                  bsr     $4cffc
04CF4E: 6000 0136                  bra     $4d086
04CF52: FF60                       dc.w    $ff60; opcode 1111
04CF54: 00A0 

04CF56:								add.w D1,D1
04CF58:								add.w D1,D1
04CF5A: 43FB 1016                  lea     ($16,PC,D1.w), A1
04CF5E: 3219                       move.w  (A1)+, D1
04CF60: 3D41 0088                  move.w  D1, ($88,A6)
04CF64: 3419                       move.w  (A1)+, D2
04CF66: 3D42 008A                  move.w  D2, ($8a,A6)
04CF6A: 6100 0090                  bsr     $4cffc
04CF6E: 6000 0116                  bra     $4d086

04CF72: 4boss围绕这几个坐标转圈
DC.W	04B0 0054 04C0 0038 04D0 0020 0528 0054 0538 0038 0548 0020 05A0 0054 05B0 0038 05C0 0020

04CF96: 1F1F                       move.b  (A7)+, -(A7)
04CF98: 1F1F                       move.b  (A7)+, -(A7)
04CF9A: 1F1F                       move.b  (A7)+, -(A7)
04CF9C: 1F20                       move.b  -(A0), -(A7)