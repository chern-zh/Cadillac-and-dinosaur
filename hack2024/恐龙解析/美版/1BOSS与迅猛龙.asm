0425B6: 4EB9 0009 39B6             jsr     $939b6.l
0425BC: 4A2E 0026                  tst.b   ($26,A6)
0425C0: 6636                       bne     $425f8			/大个子跳到425F8


0425C2: 4EB9 0004 DCC6             jsr     $4dcc6.l			/加载被锁迅猛龙；1BOSS走此指令，大个子不走
*-----------------------------------------------------------------
04DCC6: 4EB9 0000 483C             jsr     $483c.l
04DCCC: 6526                       bcs     $4dcf4
04DCCE: 117C 0001 0000             move.b  #$1, ($0,A0)
04DCD4: 317C 0074 0020             move.w  #$74, ($20,A0)
04DCDA: 214E 00A0                  move.l  A6, ($a0,A0)
04DCDE: 317C 02D0 0008             move.w  #$2d0, ($8,A0)
04DCE4: 316E 000C 000C             move.w  ($c,A6), ($c,A0)			/？？？
04DCEA: 317C 0148 0010             move.w  #$148, ($10,A0)
04DCF0: 4268 0026                  clr.w   ($26,A0)
04DCF4: 4E75                       rts
*--------------------------------------------------------------------

	
0425C8: 1D7C 000C 0003             move.b  #$c, ($3,A6)
0425CE: 3D7C 0030 0084             move.w  #$30, ($84,A6)
0425D4: 1D7C 003C 0072             move.b  #$3c, ($72,A6)
0425DA: 1D7C 0002 0063             move.b  #$2, ($63,A6)
0425E0: 2D7C 0004 38F2 0040        move.l  #$438f2, ($40,A6)	/出场动作，1BOSS出拳打迅猛龙，换成大个子动作后，迅猛龙依然激活
0425E8: 7000                       moveq   #$0, D0
0425EA: 4EB9 0003 1E14             jsr     $31e14.l			/1BOSS加血
0425F0: 3D6E 006C 00C0             move.w  ($6c,A6), ($c0,A6)
0425F6: 6026                       bra     $4261e
*------------1BOSS---------------



*------------大个子---------------
0425F8: 1D7C 000D 0003             move.b  #$d, ($3,A6)
0425FE: 3D7C 0034 0084             move.w  #$34, ($84,A6)
042604: 1D7C 003C 0072             move.b  #$3c, ($72,A6)
04260A: 422E 0063                  clr.b   ($63,A6)
04260E: 2D7C 0004 3E54 0040        move.l  #$43e54, ($40,A6)	/大个子冲锋刹车出场
042616: 7000                       moveq   #$0, D0
042618: 4EB9 0003 1424             jsr     $31424.l			/大个子加血
*------------大个子---------------

04261E: 7000                       moveq   #$0, D0
042620: 4EB9 0000 120E             jsr     $120e.l
042626: 2D7C 0010 3000 0044        move.l  #$103000, ($44,A6)
04262E: 422E 004A                  clr.b   ($4a,A6)
042632: 1D7C 000B 0078             move.b  #$b, ($78,A6)
042638: 7000                       moveq   #$0, D0
04263A: 1D40 0079                  move.b  D0, ($79,A6)
04263E: 1D40 007A                  move.b  D0, ($7a,A6)
042642: 1D40 007B                  move.b  D0, ($7b,A6)
042646: 1D40 007D                  move.b  D0, ($7d,A6)
04264A: 1D40 00B1                  move.b  D0, ($b1,A6)
04264E: 1D7C 0002 00A8             move.b  #$2, ($a8,A6)
042654: 1D40 00BD                  move.b  D0, ($bd,A6)
042658: 3D40 00AA                  move.w  D0, ($aa,A6)
04265C: 1D40 0087                  move.b  D0, ($87,A6)
042660: 3D7C 0384 00BE             move.w  #$384, ($be,A6)
042666: 1D7C 0002 00C2             move.b  #$2, ($c2,A6)
04266C: 1D40 00C3                  move.b  D0, ($c3,A6)
042670: 4EB9 0003 2032             jsr     $32032.l
042676: 3D48 0076                  move.w  A0, ($76,A6)
04267A: 4EB9 0003 140C             jsr     $3140c.l
042680: 6100 286A                  bsr     $44eec
042684: 6100 1C12                  bsr     $44298
042688: 6100 1DEE                  bsr     $44478
04268C: 542E 0005                  addq.b  #2, ($5,A6)
042690: 4A2E 0026                  tst.b   ($26,A6)				/区别点
042694: 6600 01CE                  bne     $42864
042698: 7000                       moveq   #$0, D0
04269A: 102E 0006                  move.b  ($6,A6), D0
04269E: 303B 000C                  move.w  ($c,PC,D0.w), D0
0426A2: 4EBB 0008                  jsr     ($8,PC,D0.w)
0426A6: 4EF9 0000 49CA             jmp     $49ca.l
0426AC: 0014 0048                  ori.b   #$48, (A4)
0426B0: 005E 008A                  ori.w   #$8a, (A6)+
0426B4: 009E 00D6 0100             ori.l   #$d60100, (A6)+
0426BA: 014C 01A0                  movep.l ($1a0,A4), D0
0426BE: 01B8 0C6D                  bclr    D0, $c6d.w


0426C0: 0C6D 01D0 0744             cmpi.w  #$1d0, ($744,A5)			/对比卷轴激活1BOSS
0426C6: 6D2A                       blt     $426f2
0426C8: 542E 0006                  addq.b  #2, ($6,A6)
0426CC: 4EB9 0000 4860             jsr     $4860.l
0426D2: 651E                       bcs     $426f2
0426D4: 3D48 00AC                  move.w  A0, ($ac,A6)
0426D8: 117C 0001 0000             move.b  #$1, ($0,A0)
0426DE: 317C 00C8 0020             move.w  #$c8, ($20,A0)
0426E4: 317C 0000 0026             move.w  #$0, ($26,A0)
0426EA: 7020                       moveq   #$20, D0
0426EC: 4EB9 0000 A63C             jsr     $a63c.l						/音乐
0426F2: 4E75                       rts
0426F4: 306E 00AC                  movea.w ($ac,A6), A0
0426F8: 4A28 0000                  tst.b   ($0,A0)
0426FC: 660A                       bne     $42708
0426FE: 1D7C 0028 0080             move.b  #$28, ($80,A6)
042704: 542E 0006                  addq.b  #2, ($6,A6)
042708: 4E75                       rts
04270A: 532E 0080                  subq.b  #1, ($80,A6)
04270E: 6600 0038                  bne     $42748
042712: 4EB9 0000 4860             jsr     $4860.l
042718: 6510                       bcs     $4272a
04271A: 117C 0001 0000             move.b  #$1, ($0,A0)
042720: 317C 0130 0020             move.w  #$130, ($20,A0)
042726: 4268 0026                  clr.w   ($26,A0)
04272A: 7014                       moveq   #$14, D0
04272C: 4EB9 0000 120E             jsr     $120e.l
042732: 542E 0006                  addq.b  #2, ($6,A6)
042736: 4EB9 0000 121E             jsr     $121e.l
04273C: 640A                       bcc     $42748
04273E: 542E 0006                  addq.b  #2, ($6,A6)
042742: 1D7C 003C 0080             move.b  #$3c, ($80,A6)
042748: 4E75                       rts
04274A: 532E 0080                  subq.b  #1, ($80,A6)
04274E: 6456                       bcc     $427a6
042750: 542E 0006                  addq.b  #2, ($6,A6)
042754: 422E 0080                  clr.b   ($80,A6)
042758: 7001                       moveq   #$1, D0
04275A: 4EB9 0000 120E             jsr     $120e.l
042760: 7007                       moveq   #$7, D0
042762: 4EB9 0000 17A4             jsr     $17a4.l
042768: 323C 0317                  move.w  #$317, D1
04276C: 343C 0136                  move.w  #$136, D2
042770: 3D41 0088                  move.w  D1, ($88,A6)
042774: 3D42 008A                  move.w  D2, ($8a,A6)
042778: 4EB9 0000 103A             jsr     $103a.l
04277E: 1D40 0022                  move.b  D0, ($22,A6)
042782: 6100 231E                  bsr     $44aa2
042786: 6520                       bcs     $427a8
042788: 322E 0088                  move.w  ($88,A6), D1
04278C: 342E 008A                  move.w  ($8a,A6), D2
042790: 4EB9 0000 103A             jsr     $103a.l
042796: 1D40 0022                  move.b  D0, ($22,A6)
04279A: 4EB9 0000 1862             jsr     $1862.l
0427A0: 4EF9 0000 121E             jmp     $121e.l
0427A6: 4E75                       rts
0427A8: 542E 0006                  addq.b  #2, ($6,A6)
0427AC: 1D7C 0014 0080             move.b  #$14, ($80,A6)
0427B2: 4EB9 0000 4860             jsr     $4860.l
0427B8: 6532                       bcs     $427ec
0427BA: 117C 0001 0000             move.b  #$1, ($0,A0)
0427C0: 317C 0108 0020             move.w  #$108, ($20,A0)
0427C6: 317C 000B 0026             move.w  #$b, ($26,A0)
0427CC: 4A6D 0032                  tst.w   ($32,A5)
0427D0: 671A                       beq     $427ec
0427D2: 4EB9 0000 4860             jsr     $4860.l
0427D8: 6512                       bcs     $427ec
0427DA: 117C 0001 0000             move.b  #$1, ($0,A0)
0427E0: 317C 0108 0020             move.w  #$108, ($20,A0)
0427E6: 317C 0055 0026             move.w  #$55, ($26,A0)
0427EC: 7015                       moveq   #$15, D0
0427EE: 4EB9 0000 120E             jsr     $120e.l
0427F4: 542E 0006                  addq.b  #2, ($6,A6)
0427F8: 532E 0080                  subq.b  #1, ($80,A6)
0427FC: 6416                       bcc     $42814
0427FE: 422E 0080                  clr.b   ($80,A6)
042802: 4EB9 0000 121E             jsr     $121e.l
042808: 640A                       bcc     $42814
04280A: 542E 0006                  addq.b  #2, ($6,A6)
04280E: 1D7C 003C 0080             move.b  #$3c, ($80,A6)
042814: 4A2E 002C                  tst.b   ($2c,A6)
042818: 6708                       beq     $42822
04281A: 422E 002C                  clr.b   ($2c,A6)
04281E: 6100 0004                  bsr     $42824
042822: 4E75                       rts
042824: 302E 0008                  move.w  ($8,A6), D0
042828: 0440 0050                  subi.w  #$50, D0
04282C: 322E 000C                  move.w  ($c,A6), D1
042830: 0641 0040                  addi.w  #$40, D1
042834: 342E 0010                  move.w  ($10,A6), D2
042838: 7600                       moveq   #$0, D3
04283A: 4EB9 0009 2422             jsr     $92422.l
042840: 703B                       moveq   #$3b, D0
042842: 7218                       moveq   #$18, D1
042844: 7400                       moveq   #$0, D2
042846: 4EF9 0000 A63C             jmp     $a63c.l
04284C: 532E 0080                  subq.b  #1, ($80,A6)
042850: 6410                       bcc     $42862
042852: 542E 0006                  addq.b  #2, ($6,A6)
042856: 422D 04FC                  clr.b   ($4fc,A5)
04285A: 700E                       moveq   #$e, D0
04285C: 4EB9 0000 A63C             jsr     $a63c.l
042862: 4E75                       rts
042864: 4A2E 0026                  tst.b   ($26,A6)				/区别点
042868: 660A                       bne     $42874
04286A: 4EB9 0007 BEDC             jsr     $7bedc.l				/派兵		
042870: 3B4E 8F44                  move.w  A6, (-$70bc,A5)
042874: 542E 0004                  addq.b  #2, ($4,A6)
042878: 422E 0005                  clr.b   ($5,A6)
04287C: 426E 0006                  clr.w   ($6,A6)
042880: 6000 0314                  bra     $42b96
042884: 4A6E 0026                  tst.w   ($26,A6)
042888: 6706                       beq     $42890
04288A: 4EB9 0003 26F8             jsr     $326f8.l
042890: 536E 00BE                  subq.w  #1, ($be,A6)
042894: 6404                       bcc     $4289a
042896: 426E 00BE                  clr.w   ($be,A6)
04289A: 536E 00C4                  subq.w  #1, ($c4,A6)
04289E: 6404                       bcc     $428a4
0428A0: 426E 00C4                  clr.w   ($c4,A6)
0428A4: 102E 0005                  move.b  ($5,A6), D0
0428A8: D040                       add.w   D0, D0
0428AA: 207B 0012                  movea.l ($12,PC,D0.w), A0
0428AE: 4E90                       jsr     (A0)
0428B0: 4A2E 0026                  tst.b   ($26,A6)
0428B4: 6602                       bne     $428b8
0428B6: 4E75                       rts

*------------------迅猛龙主程序---------------------------------
04DEE4: 286E 00A0                  movea.l ($a0,A6), A4		/归属体地址移到A4
04DEE8: 7000                       moveq   #$0, D0
04DEEA: 102E 0006                  move.b  ($6,A6), D0
04DEEE: 303B 000C                  move.w  ($c,PC,D0.w), D0
04DEF2: 4EBB 0008                  jsr     ($8,PC,D0.w)			/断点查找
04DEF6: 4EF9 0000 49CA             jmp     $49ca.l
04DEFC: 0010 003C                  ori.b   #$3c, (A0)
04DF00: 0052 0068                  ori.w   #$68, (A2)
04DF04: 0084 00B0 00CA             ori.l   #$b000ca, D4
04DF0A: 00E2                       dc.w    $00e2; ILLEGAL
04DF0C: 4A2E 0007                  tst.b   ($7,A6)
04DF10: 6610                       bne     $4df22
04DF12: 542E 0007                  addq.b  #2, ($7,A6)
04DF16: 7000                       moveq   #$0, D0
04DF18: 4EB9 0000 120E             jsr     $120e.l
04DF1E: 422E 0024                  clr.b   ($24,A6)
04DF22: 0C2C 0002 0006             cmpi.b  #$2, ($6,A4)			/对比归属体动作
04DF28: 6706                       beq     $4df30
04DF2A: 4EF9 0000 121E             jmp     $121e.l
04DF30: 542E 0006                  addq.b  #2, ($6,A6)
04DF34: 422E 0007                  clr.b   ($7,A6)
04DF38: 0C2C 0004 0006             cmpi.b  #$4, ($6,A4)		/对比归属体动作
04DF3E: 6702                       beq     $4df42
04DF40: 4E75                       rts
04DF42: 542E 0006                  addq.b  #2, ($6,A6)
04DF46: 7001                       moveq   #$1, D0
04DF48: 4EB9 0000 120E             jsr     $120e.l
04DF4E: 4EB9 0000 121E             jsr     $121e.l
04DF54: 6502                       bcs     $4df58
04DF56: 4E75                       rts
04DF58: 542E 0006                  addq.b  #2, ($6,A6)
04DF5C: 7002                       moveq   #$2, D0
04DF5E: 4EB9 0000 120E             jsr     $120e.l
04DF64: 0C2C 000E 0006             cmpi.b  #$e, ($6,A4)			/检测归属体是否揍他？？
04DF6A: 6708                       beq     $4df74
04DF6C: 4EB9 0000 121E             jsr     $121e.l
04DF72: 4E75                       rts
04DF74: 542E 0006                  addq.b  #2, ($6,A6)
04DF78: 7003                       moveq   #$3, D0
04DF7A: 4EB9 0000 120E             jsr     $120e.l
04DF80: 4A2C 002D                  tst.b   ($2d,A4)
04DF84: 670A                       beq     $4df90
04DF86: 422C 002D                  clr.b   ($2d,A4)
04DF8A: 1D7C 0001 002F             move.b  #$1, ($2f,A6)
04DF90: 4EB9 0000 121E             jsr     $121e.l
04DF96: 6502                       bcs     $4df9a
04DF98: 4E75                       rts
04DF9A: 542E 0006                  addq.b  #2, ($6,A6)
04DF9E: 1D7C 0001 00A4             move.b  #$1, ($a4,A6)
04DFA4: 7004                       moveq   #$4, D0
04DFA6: 4EB9 0000 120E             jsr     $120e.l
04DFAC: 4A2E 002D                  tst.b   ($2d,A6)
04DFB0: 6606                       bne     $4dfb8
04DFB2: 4EF9 0000 121E             jmp     $121e.l
04DFB8: 542E 0006                  addq.b  #2, ($6,A6)
04DFBC: 4EB9 0000 A09E             jsr     $a09e.l
04DFC2: 6100 148C                  bsr     $4f450
04DFC6: 6100 14A0                  bsr     $4f468
04DFCA: 6506                       bcs     $4dfd2
04DFCC: 4EF9 0000 121E             jmp     $121e.l
04DFD2: 542E 0006                  addq.b  #2, ($6,A6)			/挣脱绳索
04DFD6: 7005                       moveq   #$5, D0
04DFD8: 4EB9 0000 120E             jsr     $120e.l
04DFDE: 4EB9 0000 121E             jsr     $121e.l
04DFE4: 6502                       bcs     $4dfe8
04DFE6: 4E75                       rts
04DFE8: 542E 0005                  addq.b  #2, ($5,A6)
04DFEC: 4E75                       rts