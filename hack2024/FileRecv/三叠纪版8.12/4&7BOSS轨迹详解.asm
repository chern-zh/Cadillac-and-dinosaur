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





7BOSS

05D7C4: 7200                       moveq   #$0, D1
05D7C6: 122E 007C                  move.b  ($7c,A6), D1
05D7CA: 306E 0076                  movea.w ($76,A6), A0
05D7CE: 102E 00AC                  move.b  ($ac,A6), D0
05D7D2: 0C00 0002                  cmpi.b  #$2, D0
05D7D6: 6E00 0024                  bgt     $5d7fc
05D7DA: D241                       add.w   D1, D1
05D7DC: 323B 101A                  move.w  ($1a,PC,D1.w), D1
05D7E0: D268 0008                  add.w   ($8,A0), D1
05D7E4: 3D41 0088                  move.w  D1, ($88,A6)
05D7E8: 3428 0010                  move.w  ($10,A0), D2
05D7EC: 3D42 008A                  move.w  D2, ($8a,A6)
05D7F0: 6100 00B2                  bsr     $5d8a4
05D7F4: 6000 0138                  bra     $5d92e
05D7F8: FF50                       dc.w    $ff50; opcode 1111
05D7FA: 00B0 D241 D241 43FB        ori.l   #$d241d241, INVALID 30
05D802: 1016                       move.b  (A6), D0
05D804: 3219                       move.w  (A1)+, D1
05D806: 3D41 0088                  move.w  D1, ($88,A6)
05D80A: 3419                       move.w  (A1)+, D2
05D80C: 3D42 008A                  move.w  D2, ($8a,A6)
05D810: 6100 0092                  bsr     $5d8a4
05D814: 6000 0118                  bra     $5d92e


05D818: 0490 0054 04A0             subi.l  #$5404a0, (A0)
05D81E: 0038 04B0 0018             ori.b   #$b0, $18.w
05D824: 0508 0054                  movep.w ($54,A0), D2
05D828: 0518                       btst    D2, (A0)+
05D82A: 0038 0528 0018             ori.b   #$28, $18.w
05D830: 0580                       bclr    D2, D0
05D832: 0054 0590                  ori.w   #$590, (A4)
05D836: 0038 05A0 0018             ori.b   #$a0, $18.w