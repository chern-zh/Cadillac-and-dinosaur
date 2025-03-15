00FD30: 302A 0002                  move.w  ($2,A2), D0		
00FD34: 0800 0007                  btst    #$7, D0			；80至FF，第七位都是1
00FD38: 6700 0008                  beq     $fd42
00FD3C: 619A                       bsr     $fcd8			；
00FD3E: 6000 00A2                  bra     $fde2			；
00FD42: 3200                       move.w  D0, D1
00FD44: 0241 0060                  andi.w  #$60, D1
00FD48: 6700 0024                  beq     $fd6e
00FD4C: 0C01 0040                  cmpi.b  #$40, D1
00FD50: 6600 000A                  bne     $fd5c
00FD54: 4A2D 04EF                  tst.b   ($4ef,A5)		；检测当前玩家数量是否1人
00FD58: 6700 0088                  beq     $fde2
00FD5C: 0C01 0060                  cmpi.b  #$60, D1
00FD60: 6600 000C                  bne     $fd6e
00FD64: 0C2D 0002 04EF             cmpi.b  #$2, ($4ef,A5)		；对比当前玩家数量是否3人，是否加载此兵
00FD6A: 6600 0076                  bne     $fde2
00FD6E: 3200                       move.w  D0, D1
00FD70: 0241 0018                  andi.w  #$18, D1
00FD74: 6700 0026                  beq     $fd9c
00FD78: 0241 0010                  andi.w  #$10, D1
00FD7C: 6600 0012                  bne     $fd90
00FD80: 3200                       move.w  D0, D1
00FD82: E049                       lsr.w   #8, D1			；右移两位，1508变成0015
00FD84: B26D 05EE                  cmp.w   ($5ee,A5), D1	/难度相关
00FD88: 6200 0058                  bhi     $fde2
00FD8C: 6000 000E                  bra     $fd9c
00FD90: 3200                       move.w  D0, D1
00FD92: E049                       lsr.w   #8, D1
00FD94: B26D 05EE                  cmp.w   ($5ee,A5), D1	/难度相关
00FD98: 6500 0048                  bcs     $fde2
00FD9C: 0240 0007                  andi.w  #$7, D0
00FDA0: D040                       add.w   D0, D0
00FDA2: D040                       add.w   D0, D0
00FDA4: 41FA FF22                  lea     (-$de,PC), A0; ($fcc8)
00FDA8: 2070 0000                  movea.l (A0,D0.w), A0
00FDAC: 4E90                       jsr     (A0)
00FDAE: 6500 0036                  bcs     $fde6
00FDB2: 117C 0001 0000             move.b  #$1, ($0,A0)
00FDB8: 316A 0004 0020             move.w  ($4,A2), ($20,A0)
00FDBE: 316A 0006 0008             move.w  ($6,A2), ($8,A0)
00FDC4: 316A 0008 0010             move.w  ($8,A2), ($10,A0)
00FDCA: 316A 000A 0026             move.w  ($a,A2), ($26,A0)
00FDD0: 316A 000C 005C             move.w  ($c,A2), ($5c,A0)
00FDD6: 116A 000E 005B             move.b  ($e,A2), ($5b,A0)
00FDDC: 116A 000F 0096             move.b  ($f,A2), ($96,A0)
00FDE2: 8000                       or.b    D0, D0
00FDE4: 4E75                       rts
00FDE6: 44FC 0001                  move    #$1, CCR
00FDEA: 4E75                       rts
00FDEC: 302A 0002                  move.w  ($2,A2), D0
00FDF0: 0800 0007                  btst    #$7, D0
00FDF4: 6700 000A                  beq     $fe00
00FDF8: 6100 FEDE                  bsr     $fcd8
00FDFC: 6000 00A8                  bra     $fea6
00FE00: 3200                       move.w  D0, D1
00FE02: 0241 0060                  andi.w  #$60, D1
00FE06: 6700 0024                  beq     $fe2c
00FE0A: 0C01 0040                  cmpi.b  #$40, D1
00FE0E: 6600 000A                  bne     $fe1a
00FE12: 4A2D 04EF                  tst.b   ($4ef,A5)
00FE16: 6700 008E                  beq     $fea6
00FE1A: 0C01 0060                  cmpi.b  #$60, D1
00FE1E: 6600 000C                  bne     $fe2c
00FE22: 0C2D 0002 04EF             cmpi.b  #$2, ($4ef,A5)
00FE28: 6600 007C                  bne     $fea6
00FE2C: 3200                       move.w  D0, D1
00FE2E: 0241 0018                  andi.w  #$18, D1
