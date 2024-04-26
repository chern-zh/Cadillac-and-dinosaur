042590: 102E 0004                  move.b  ($4,A6), D0
042594: 323B 0006                  move.w  ($6,PC,D0.w), D1
042598: 4EFB 1002                  jmp     ($2,PC,D1.w)
04259C: 0008                       dc.w    $0008; ILLEGAL
04259E: 02E8                       dc.w    $02e8; ILLEGAL
0425A0: 12F6 1350                  move.b  INVALID 36, (A1)+
0425A4: 7000                       moveq   #$0, D0
0425A6: 102E 0005                  move.b  ($5,A6), D0
0425AA: 303B 0006                  move.w  ($6,PC,D0.w), D0
0425AE: 4EFB 0002                  jmp     ($2,PC,D0.w)
0425B2: 0004 00DE                  ori.b   #$de, D4
0425B6: 4EB9 0009 39B6             jsr     $939b6.l
0425BC: 4A2E 0026                  tst.b   ($26,A6)
0425C0: 6636                       bne     $425f8
0425C2: 4EB9 0004 DCC6             jsr     $4dcc6.l
0425C8: 1D7C 000C 0003             move.b  #$c, ($3,A6)
0425CE: 3D7C 0030 0084             move.w  #$30, ($84,A6)
0425D4: 1D7C 003C 0072             move.b  #$3c, ($72,A6)
0425DA: 1D7C 0002 0063             move.b  #$2, ($63,A6)
0425E0: 2D7C 0004 38F2 0040        move.l  #$438f2, ($40,A6)
0425E8: 7000                       moveq   #$0, D0
0425EA: 4EB9 0003 1E14             jsr     $31e14.l
0425F0: 3D6E 006C 00C0             move.w  ($6c,A6), ($c0,A6)
0425F6: 6026                       bra     $4261e
0425F8: 1D7C 000D 0003             move.b  #$d, ($3,A6)
0425FE: 3D7C 0034 0084             move.w  #$34, ($84,A6)
042604: 1D7C 003C 0072             move.b  #$3c, ($72,A6)
04260A: 422E 0063                  clr.b   ($63,A6)
04260E: 2D7C 0004 3E54 0040        move.l  #$43e54, ($40,A6)
042616: 7000                       moveq   #$0, D0
042618: 4EB9 0003 1424             jsr     $31424.l
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
042690: 4A2E 0026                  tst.b   ($26,A6)
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
0426C2: 01D0                       bset    D0, (A0)
0426C4: 0744                       bchg    D3, D4
0426C6: 6D2A                       blt     $426f2
0426C8: 542E 0006                  addq.b  #2, ($6,A6)
0426CC: 4EB9 0000 4860             jsr     $4860.l
0426D2: 651E                       bcs     $426f2
0426D4: 3D48 00AC                  move.w  A0, ($ac,A6)
0426D8: 117C 0001 0000             move.b  #$1, ($0,A0)
0426DE: 317C 00C8 0020             move.w  #$c8, ($20,A0)
0426E4: 317C 0000 0026             move.w  #$0, ($26,A0)
0426EA: 7020                       moveq   #$20, D0
0426EC: 4EB9 0000 A63C             jsr     $a63c.l
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
042864: 4A2E 0026                  tst.b   ($26,A6)
042868: 660A                       bne     $42874
04286A: 4EB9 0007 BEDC             jsr     $7bedc.l
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
0428B8: 4EF9 0000 193E             jmp     $193e.l
0428BE: 0004 28CE                  ori.b   #$ce, D4
0428C2: 0004 385C                  ori.b   #$5c, D4
0428C6: 0004 3890                  ori.b   #$90, D4
0428CA: 0002 B35A                  ori.b   #$5a, D2
0428CE: 536E 00AA                  subq.w  #1, ($aa,A6)
0428D2: 6404                       bcc     $428d8
0428D4: 426E 00AA                  clr.w   ($aa,A6)
0428D8: 122E 0079                  move.b  ($79,A6), D1
0428DC: 670C                       beq     $428ea
0428DE: 532E 0079                  subq.b  #1, ($79,A6)
0428E2: 6606                       bne     $428ea
0428E4: 1D7C 000B 0078             move.b  #$b, ($78,A6)
0428EA: 7000                       moveq   #$0, D0
0428EC: 102E 0006                  move.b  ($6,A6), D0
0428F0: 323B 0030                  move.w  ($30,PC,D0.w), D1
0428F4: 4EBB 102C                  jsr     ($2c,PC,D1.w)
0428F8: 4EB9 0001 2CB4             jsr     $12cb4.l
0428FE: 532E 00C3                  subq.b  #1, ($c3,A6)
042902: 6612                       bne     $42916
042904: 1D7C 00C8 00C3             move.b  #$c8, ($c3,A6)
04290A: 082E 0007 0050             btst    #$7, ($50,A6)
042910: 6704                       beq     $42916
042912: 6100 001A                  bsr     $4292e
042916: 4EB9 0000 49CA             jsr     $49ca.l
04291C: 4EF9 0000 4BEA             jmp     $4bea.l
042922: 0218 0274                  andi.b  #$74, (A0)+
042926: 0626 0DD2                  addi.b  #-$2e, -(A6)
04292A: 0E20                       dc.w    $0e20; ILLEGAL
04292C: 0E8C                       dc.w    $0e8c; ILLEGAL
04292E: 2D7C 0200 0402 0004        move.l  #$2000402, ($4,A6)
042936: 1D7C 0007 00B6             move.b  #$7, ($b6,A6)
04293C: 3D7C 0038 00B8             move.w  #$38, ($b8,A6)
042942: 306E 0094                  movea.w ($94,A6), A0
042946: 7200                       moveq   #$0, D1
042948: 3028 0008                  move.w  ($8,A0), D0
04294C: 906E 0008                  sub.w   ($8,A6), D0
042950: 6F02                       ble     $42954
042952: 7201                       moveq   #$1, D1
042954: 1D41 0024                  move.b  D1, ($24,A6)
042958: 4E75                       rts
04295A: 0C2E 0004 007B             cmpi.b  #$4, ($7b,A6)
042960: 6648                       bne     $429aa
042962: 322E 00C0                  move.w  ($c0,A6), D1
042966: 3401                       move.w  D1, D2
042968: E44A                       lsr.w   #2, D2
04296A: B042                       cmp.w   D2, D0
04296C: 6E04                       bgt     $42972
04296E: 7600                       moveq   #$0, D3
042970: 600E                       bra     $42980
042972: 3401                       move.w  D1, D2
042974: E24A                       lsr.w   #1, D2
042976: B042                       cmp.w   D2, D0
042978: 6E04                       bgt     $4297e
04297A: 7602                       moveq   #$2, D3
04297C: 6002                       bra     $42980
04297E: 7604                       moveq   #$4, D3
042980: 41FA 002C                  lea     ($2c,PC), A0; ($429ae)
042984: 7000                       moveq   #$0, D0
042986: 102E 0026                  move.b  ($26,A6), D0
04298A: 3200                       move.w  D0, D1
04298C: D241                       add.w   D1, D1
04298E: D041                       add.w   D1, D0
042990: D043                       add.w   D3, D0
042992: D0C0                       adda.w  D0, A0
042994: 3210                       move.w  (A0), D1
042996: 4EB9 0000 119C             jsr     $119c.l
04299C: 0240 001F                  andi.w  #$1f, D0
0429A0: B041                       cmp.w   D1, D0
0429A2: 6C06                       bge     $429aa
0429A4: 44FC 0001                  move    #$1, CCR
0429A8: 4E75                       rts
0429AA: 8040                       or.w    D0, D0
0429AC: 4E75                       rts
0429AE: 0007 0011                  ori.b   #$11, D7
0429B2: 001E 0006                  ori.b   #$6, (A6)+
0429B6: 000E                       dc.w    $000e; ILLEGAL
0429B8: 0018 6100                  ori.b   #$0, (A0)+
0429BC: 255C 6406                  move.l  (A4)+, ($6406,A2)
0429C0: 43FA 0062                  lea     ($62,PC), A1; ($42a24)
0429C4: 6004                       bra     $429ca
0429C6: 43FA 00BC                  lea     ($bc,PC), A1; ($42a84)
0429CA: 2649                       movea.l A1, A3
0429CC: 6100 1F3A                  bsr     $44908
0429D0: 224B                       movea.l A3, A1
0429D2: 3028 0008                  move.w  ($8,A0), D0
0429D6: 906E 0008                  sub.w   ($8,A6), D0
0429DA: 6A02                       bpl     $429de
0429DC: 4440                       neg.w   D0
0429DE: 0C40 0060                  cmpi.w  #$60, D0
0429E2: 6D04                       blt     $429e8
0429E4: 303C 0040                  move.w  #$40, D0
0429E8: 0240 0060                  andi.w  #$60, D0
0429EC: D2C0                       adda.w  D0, A1
0429EE: 4EB9 0000 119C             jsr     $119c.l
0429F4: 0240 001F                  andi.w  #$1f, D0
0429F8: 7200                       moveq   #$0, D1
0429FA: 1231 0000                  move.b  (A1,D0.w), D1				*取表，决定是否起飞
0429FE: 6618                       bne     $42a18
042A00: 2D7C 0200 0402 0004        move.l  #$2000402, ($4,A6)			*起飞
042A08: 3D7C 000C 00B6             move.w  #$c, ($b6,A6)
042A0E: 3D7C 0048 00B8             move.w  #$48, ($b8,A6)
042A14: 6000 0598                  bra     $42fae
042A18: 5301                       subq.b  #1, D1
042A1A: 6604                       bne     $42a20
042A1C: 6000 045A                  bra     $42e78
042A20: 6000 04AE                  bra     $42ed0
042A24: 0000 0000                  ori.b   #$0, D0
042A28: 0101                       btst    D0, D1
042A2A: 0101                       btst    D0, D1
042A2C: 0101                       btst    D0, D1
042A2E: 0101                       btst    D0, D1
042A30: 0101                       btst    D0, D1
042A32: 0101                       btst    D0, D1
042A34: 0101                       btst    D0, D1
042A36: 0101                       btst    D0, D1
042A38: 0101                       btst    D0, D1
042A3A: 0101                       btst    D0, D1
042A3C: 0101                       btst    D0, D1
042A3E: 0101                       btst    D0, D1
042A40: 0101                       btst    D0, D1
042A42: 0101                       btst    D0, D1
042A44: 0000 0000                  ori.b   #$0, D0
042A48: 0000 0000                  ori.b   #$0, D0
042A4C: 0101                       btst    D0, D1
042A4E: 0101                       btst    D0, D1
042A50: 0101                       btst    D0, D1
042A52: 0101                       btst    D0, D1
042A54: 0101                       btst    D0, D1
042A56: 0101                       btst    D0, D1
042A58: 0101                       btst    D0, D1
042A5A: 0101                       btst    D0, D1
042A5C: 0101                       btst    D0, D1
042A5E: 0101                       btst    D0, D1
042A60: 0101                       btst    D0, D1
042A62: 0101                       btst    D0, D1
042A64: 0000 0000                  ori.b   #$0, D0
042A68: 0000 0000                  ori.b   #$0, D0
042A6C: 0000 0000                  ori.b   #$0, D0
042A70: 0101                       btst    D0, D1
042A72: 0101                       btst    D0, D1
042A74: 0101                       btst    D0, D1
042A76: 0101                       btst    D0, D1
042A78: 0101                       btst    D0, D1
042A7A: 0101                       btst    D0, D1
042A7C: 0101                       btst    D0, D1
042A7E: 0101                       btst    D0, D1
042A80: 0101                       btst    D0, D1
042A82: 0101                       btst    D0, D1
042A84: 0001 0101                  ori.b   #$1, D1
042A88: 0101                       btst    D0, D1
042A8A: 0101                       btst    D0, D1
042A8C: 0101                       btst    D0, D1
042A8E: 0101                       btst    D0, D1
042A90: 0101                       btst    D0, D1
042A92: 0101                       btst    D0, D1
042A94: 0101                       btst    D0, D1
042A96: 0101                       btst    D0, D1
042A98: 0101                       btst    D0, D1
042A9A: 0101                       btst    D0, D1
042A9C: 0101                       btst    D0, D1
042A9E: 0101                       btst    D0, D1
042AA0: 0101                       btst    D0, D1
042AA2: 0101                       btst    D0, D1
042AA4: 0000 0101                  ori.b   #$1, D0
042AA8: 0101                       btst    D0, D1
042AAA: 0101                       btst    D0, D1
042AAC: 0101                       btst    D0, D1
042AAE: 0101                       btst    D0, D1
042AB0: 0101                       btst    D0, D1
042AB2: 0101                       btst    D0, D1
042AB4: 0101                       btst    D0, D1
042AB6: 0101                       btst    D0, D1
042AB8: 0101                       btst    D0, D1
042ABA: 0101                       btst    D0, D1
042ABC: 0101                       btst    D0, D1
042ABE: 0101                       btst    D0, D1
042AC0: 0101                       btst    D0, D1
042AC2: 0101                       btst    D0, D1
042AC4: 0000 0001                  ori.b   #$1, D0
042AC8: 0101                       btst    D0, D1
042ACA: 0101                       btst    D0, D1
042ACC: 0101                       btst    D0, D1
042ACE: 0101                       btst    D0, D1
042AD0: 0101                       btst    D0, D1
042AD2: 0101                       btst    D0, D1
042AD4: 0101                       btst    D0, D1
042AD6: 0101                       btst    D0, D1
042AD8: 0101                       btst    D0, D1
042ADA: 0101                       btst    D0, D1
042ADC: 0101                       btst    D0, D1
042ADE: 0101                       btst    D0, D1
042AE0: 0101                       btst    D0, D1
042AE2: 0101                       btst    D0, D1
042AE4: 2D7C 0200 0000 0004        move.l  #$2000000, ($4,A6)
042AEC: 7000                       moveq   #$0, D0
042AEE: 4EB9 0000 120E             jsr     $120e.l
042AF4: 4A2E 007A                  tst.b   ($7a,A6)
042AF8: 6606                       bne     $42b00
042AFA: 1D7C 0002 007A             move.b  #$2, ($7a,A6)
042B00: 6100 23EA                  bsr     $44eec
042B04: 3D7C 0258 00B2             move.w  #$258, ($b2,A6)
042B0A: 1D7C 003C 00B4             move.b  #$3c, ($b4,A6)
042B10: 422E 00B1                  clr.b   ($b1,A6)
042B14: 4A2E 0026                  tst.b   ($26,A6)
042B18: 6608                       bne     $42b22
042B1A: 6100 239E                  bsr     $44eba
042B1E: 6500 0C88                  bcs     $437a8
042B22: 6100 FE36                  bsr     $4295a
042B26: 6500 FE92                  bcs     $429ba
042B2A: 4A2E 00BD                  tst.b   ($bd,A6)
042B2E: 6606                       bne     $42b36
042B30: 6100 0020                  bsr     $42b52
042B34: 4E75                       rts
042B36: 6000 0050                  bra     $42b88
042B3A: 4A2E 0051                  tst.b   ($51,A6)
042B3E: 6600 0BF8                  bne     $43738
042B42: 4A2E 007A                  tst.b   ($7a,A6)
042B46: 674E                       beq     $42b96
042B48: 532E 007A                  subq.b  #1, ($7a,A6)
042B4C: 6700 0048                  beq     $42b96
042B50: 4E75                       rts
042B52: 4A2E 00A8                  tst.b   ($a8,A6)
042B56: 672E                       beq     $42b86
042B58: 302E 006A                  move.w  ($6a,A6), D0
042B5C: E448                       lsr.w   #2, D0
042B5E: B06E 006C                  cmp.w   ($6c,A6), D0
042B62: 6C12                       bge     $42b76
042B64: 0C2E 0002 00A8             cmpi.b  #$2, ($a8,A6)
042B6A: 661A                       bne     $42b86
042B6C: E348                       lsl.w   #1, D0
042B6E: B06E 006C                  cmp.w   ($6c,A6), D0
042B72: 6C02                       bge     $42b76
042B74: 4E75                       rts
042B76: 532E 00A8                  subq.b  #1, ($a8,A6)
042B7A: 1D7C 0002 00BD             move.b  #$2, ($bd,A6)
042B80: 3D7C 0708 00AA             move.w  #$708, ($aa,A6)
042B86: 4E75                       rts
042B88: 4A6E 00AA                  tst.w   ($aa,A6)
042B8C: 6606                       bne     $42b94
042B8E: 422E 00BD                  clr.b   ($bd,A6)
042B92: 4E71                       nop
042B94: 4E75                       rts
042B96: 4A2E 0051                  tst.b   ($51,A6)
042B9A: 6610                       bne     $42bac
042B9C: 6100 224E                  bsr     $44dec
042BA0: 6500 039C                  bcs     $42f3e
042BA4: 6100 22AC                  bsr     $44e52
042BA8: 6500 0A5A                  bcs     $43604
042BAC: 4A2E 00BD                  tst.b   ($bd,A6)
042BB0: 6600 0B42                  bne     $436f4
042BB4: 306E 0076                  movea.w ($76,A6), A0
042BB8: 4A28 0000                  tst.b   ($0,A0)
042BBC: 6706                       beq     $42bc4
042BBE: 536E 00B2                  subq.w  #1, ($b2,A6)
042BC2: 640E                       bcc     $42bd2
042BC4: 3D7C 0258 00B2             move.w  #$258, ($b2,A6)
042BCA: 6100 174A                  bsr     $44316
042BCE: 6100 1DA4                  bsr     $44974
042BD2: 0C2E 0004 00B1             cmpi.b  #$4, ($b1,A6)
042BD8: 6C26                       bge     $42c00
042BDA: 532E 00B4                  subq.b  #1, ($b4,A6)
042BDE: 6420                       bcc     $42c00
042BE0: 4A2E 0051                  tst.b   ($51,A6)
042BE4: 6706                       beq     $42bec
042BE6: 422E 00B4                  clr.b   ($b4,A6)
042BEA: 6014                       bra     $42c00
042BEC: 1D7C 003C 00B4             move.b  #$3c, ($b4,A6)
042BF2: 6100 1F66                  bsr     $44b5a
042BF6: 6408                       bcc     $42c00
042BF8: 3D7C 0400 0006             move.w  #$400, ($6,A6)
042BFE: 4E75                       rts
042C00: 4A2E 0007                  tst.b   ($7,A6)
042C04: 6600 0030                  bne     $42c36
042C08: 2D7C 0200 0202 0004        move.l  #$2000202, ($4,A6)
042C10: 7000                       moveq   #$0, D0
042C12: 1D40 00B5                  move.b  D0, ($b5,A6)
042C16: 6100 18D0                  bsr     $444e8
042C1A: 6100 1EB0                  bsr     $44acc
042C1E: 102E 00B1                  move.b  ($b1,A6), D0
042C22: 303B 0006                  move.w  ($6,PC,D0.w), D0
042C26: 4EFB 0002                  jmp     ($2,PC,D0.w)
042C2A: 0026 008A                  ori.b   #$8a, -(A6)
042C2E: 015A                       bchg    D0, (A2)+
042C30: 022A 02A6 024E             andi.b  #$a6, ($24e,A2)
042C36: 7000                       moveq   #$0, D0
042C38: 102E 00B1                  move.b  ($b1,A6), D0
042C3C: 303B 0006                  move.w  ($6,PC,D0.w), D0
042C40: 4EFB 0002                  jmp     ($2,PC,D0.w)
042C44: 0026 00AE                  ori.b   #$ae, -(A6)
042C48: 0166                       bchg    D0, -(A6)
042C4A: 021C 02B8                  andi.b  #$b8, (A4)+
042C4E: 026A 7001 4EB9             andi.w  #$7001, ($4eb9,A2)
042C54: 0000 120E                  ori.b   #$e, D0
042C58: 6100 22D4                  bsr     $44f2e
042C5C: 6100 228E                  bsr     $44eec
042C60: 426E 00AE                  clr.w   ($ae,A6)
042C64: 1D7C 0078 00B0             move.b  #$78, ($b0,A6)
042C6A: 4A2E 0051                  tst.b   ($51,A6)
042C6E: 6600 0AC8                  bne     $43738
042C72: 536E 00AE                  subq.w  #1, ($ae,A6)
042C76: 640A                       bcc     $42c82
042C78: 3D7C 0002 00AE             move.w  #$2, ($ae,A6)
042C7E: 6100 1B4E                  bsr     $447ce
042C82: 4EB9 0003 24EE             jsr     $324ee.l
042C88: 650C                       bcs     $42c96
042C8A: 532E 00B0                  subq.b  #1, ($b0,A6)
042C8E: 6506                       bcs     $42c96
042C90: 6100 1D9C                  bsr     $44a2e
042C94: 6412                       bcc     $42ca8
042C96: 1D7C 0078 00B0             move.b  #$78, ($b0,A6)
042C9C: 6100 184A                  bsr     $444e8
042CA0: 3D7C 0200 0006             move.w  #$200, ($6,A6)
042CA6: 4E75                       rts
042CA8: 4EB9 0000 1862             jsr     $1862.l
042CAE: 4EF9 0000 121E             jmp     $121e.l
042CB4: 6100 1E38                  bsr     $44aee
042CB8: 640A                       bcc     $42cc4
042CBA: 422E 0090                  clr.b   ($90,A6)
042CBE: 422E 00B1                  clr.b   ($b1,A6)
042CC2: 608C                       bra     $42c50
042CC4: 1D7C 0001 00B5             move.b  #$1, ($b5,A6)
042CCA: 3D7C 0258 00C4             move.w  #$258, ($c4,A6)
042CD0: 7004                       moveq   #$4, D0
042CD2: 4EB9 0000 120E             jsr     $120e.l
042CD8: 700D                       moveq   #$d, D0
042CDA: 4EB9 0000 17A4             jsr     $17a4.l
042CE0: 6100 220A                  bsr     $44eec
042CE4: 426E 00AE                  clr.w   ($ae,A6)
042CE8: 1D7C 0078 00B0             move.b  #$78, ($b0,A6)
042CEE: 422E 0090                  clr.b   ($90,A6)
042CF2: 4A2E 0090                  tst.b   ($90,A6)
042CF6: 6644                       bne     $42d3c
042CF8: 536E 00AE                  subq.w  #1, ($ae,A6)
042CFC: 640A                       bcc     $42d08
042CFE: 3D7C 0001 00AE             move.w  #$1, ($ae,A6)
042D04: 6100 1AC8                  bsr     $447ce
042D08: 4EB9 0003 24EE             jsr     $324ee.l
042D0E: 650C                       bcs     $42d1c
042D10: 532E 00B0                  subq.b  #1, ($b0,A6)
042D14: 6506                       bcs     $42d1c
042D16: 6100 1D16                  bsr     $44a2e
042D1A: 6414                       bcc     $42d30
042D1C: 1D7C 0002 0090             move.b  #$2, ($90,A6)
042D22: 6100 003E                  bsr     $42d62
042D26: 7003                       moveq   #$3, D0
042D28: 4EB9 0000 120E             jsr     $120e.l
042D2E: 600C                       bra     $42d3c
042D30: 4EB9 0000 1862             jsr     $1862.l
042D36: 4EF9 0000 121E             jmp     $121e.l
042D3C: 302E 0014                  move.w  ($14,A6), D0
042D40: 0640 0030                  addi.w  #$30, D0
042D44: 0C40 0060                  cmpi.w  #$60, D0
042D48: 650C                       bcs     $42d56
042D4A: 4EB9 0000 189C             jsr     $189c.l
042D50: 4EF9 0000 121E             jmp     $121e.l
042D56: 422E 0090                  clr.b   ($90,A6)
042D5A: 422E 00B5                  clr.b   ($b5,A6)
042D5E: 6000 00F4                  bra     $42e54
042D62: 302E 0014                  move.w  ($14,A6), D0
042D66: 4440                       neg.w   D0
042D68: EA40                       asr.w   #5, D0
042D6A: 3D40 001A                  move.w  D0, ($1a,A6)
042D6E: 302E 0018                  move.w  ($18,A6), D0
042D72: 4440                       neg.w   D0
042D74: EA40                       asr.w   #5, D0
042D76: 3D40 001E                  move.w  D0, ($1e,A6)
042D7A: 426E 0016                  clr.w   ($16,A6)
042D7E: 426E 001C                  clr.w   ($1c,A6)
042D82: 4E75                       rts
042D84: 6100 1A48                  bsr     $447ce
042D88: 6100 0044                  bsr     $42dce
042D8C: 7002                       moveq   #$2, D0
042D8E: 4EB9 0000 120E             jsr     $120e.l
042D94: 306E 0076                  movea.w ($76,A6), A0
042D98: 7200                       moveq   #$0, D1
042D9A: 302E 0008                  move.w  ($8,A6), D0
042D9E: 9068 0008                  sub.w   ($8,A0), D0
042DA2: 6402                       bcc     $42da6
042DA4: 7201                       moveq   #$1, D1
042DA6: 1D41 0024                  move.b  D1, ($24,A6)
042DAA: 4A2E 0051                  tst.b   ($51,A6)
042DAE: 6712                       beq     $42dc2
042DB0: 4A2E 002D                  tst.b   ($2d,A6)
042DB4: 6606                       bne     $42dbc
042DB6: 4EB9 0000 189C             jsr     $189c.l
042DBC: 4EF9 0000 121E             jmp     $121e.l
042DC2: 7003                       moveq   #$3, D0
042DC4: 4EB9 0000 120E             jsr     $120e.l
042DCA: 6000 0088                  bra     $42e54
042DCE: 1D7C 0001 0051             move.b  #$1, ($51,A6)
042DD4: 3D7C 0700 0016             move.w  #$700, ($16,A6)
042DDA: 3D7C FFC0 001C             move.w  #$ffc0, ($1c,A6)
042DE0: 7400                       moveq   #$0, D2
042DE2: 342E 0008                  move.w  ($8,A6), D2
042DE6: 946E 0088                  sub.w   ($88,A6), D2
042DEA: 7638                       moveq   #$38, D3
042DEC: 6100 05A2                  bsr     $43390
042DF0: 342E 0008                  move.w  ($8,A6), D2
042DF4: 946E 0088                  sub.w   ($88,A6), D2
042DF8: 6504                       bcs     $42dfe
042DFA: 4440                       neg.w   D0
042DFC: 4441                       neg.w   D1
042DFE: 3D41 0014                  move.w  D1, ($14,A6)
042E02: D12E 0014                  add.b   D0, ($14,A6)
042E06: 0640 0500                  addi.w  #$500, D0
042E0A: 0C40 0A00                  cmpi.w  #$a00, D0
042E0E: 6508                       bcs     $42e18
042E10: 303C 0500                  move.w  #$500, D0
042E14: 3D40 0014                  move.w  D0, ($14,A6)
042E18: 426E 001A                  clr.w   ($1a,A6)
042E1C: 7400                       moveq   #$0, D2
042E1E: 342E 0010                  move.w  ($10,A6), D2
042E22: 946E 008A                  sub.w   ($8a,A6), D2
042E26: 7638                       moveq   #$38, D3
042E28: 6100 0566                  bsr     $43390
042E2C: 342E 0010                  move.w  ($10,A6), D2
042E30: 946E 008A                  sub.w   ($8a,A6), D2
042E34: 650E                       bcs     $42e44
042E36: 4440                       neg.w   D0
042E38: 6608                       bne     $42e42
042E3A: 4A41                       tst.w   D1
042E3C: 6A04                       bpl     $42e42
042E3E: 303C FFFF                  move.w  #$ffff, D0
042E42: 4441                       neg.w   D1
042E44: E549                       lsl.w   #2, D1
042E46: 3D41 0018                  move.w  D1, ($18,A6)
042E4A: D12E 0018                  add.b   D0, ($18,A6)
042E4E: 426E 001E                  clr.w   ($1e,A6)
042E52: 4E75                       rts
042E54: 1D7C 0006 00B1             move.b  #$6, ($b1,A6)
042E5A: 1D7C 000A 0080             move.b  #$a, ($80,A6)
042E60: 532E 0080                  subq.b  #1, ($80,A6)
042E64: 6410                       bcc     $42e76
042E66: 1D7C 0078 00B0             move.b  #$78, ($b0,A6)
042E6C: 6100 167A                  bsr     $444e8
042E70: 3D7C 0200 0006             move.w  #$200, ($6,A6)
042E76: 4E75                       rts
042E78: 3D7C 0202 0006             move.w  #$202, ($6,A6)
042E7E: 1D7C 000A 00B1             move.b  #$a, ($b1,A6)
042E84: 6100 1A06                  bsr     $4488c
042E88: 6100 1944                  bsr     $447ce
042E8C: 6100 FF40                  bsr     $42dce
042E90: 701A                       moveq   #$1a, D0
042E92: 4EB9 0000 120E             jsr     $120e.l
042E98: 306E 0076                  movea.w ($76,A6), A0
042E9C: 7200                       moveq   #$0, D1
042E9E: 302E 0008                  move.w  ($8,A6), D0
042EA2: 9068 0008                  sub.w   ($8,A0), D0
042EA6: 6402                       bcc     $42eaa
042EA8: 7201                       moveq   #$1, D1
042EAA: 1D41 0024                  move.b  D1, ($24,A6)
042EAE: 4A2E 0051                  tst.b   ($51,A6)
042EB2: 6712                       beq     $42ec6
042EB4: 4A2E 002D                  tst.b   ($2d,A6)
042EB8: 6606                       bne     $42ec0
042EBA: 4EB9 0000 189C             jsr     $189c.l
042EC0: 4EF9 0000 121E             jmp     $121e.l
042EC6: 7003                       moveq   #$3, D0
042EC8: 4EB9 0000 120E             jsr     $120e.l
042ECE: 6084                       bra     $42e54
042ED0: 3D7C 0202 0006             move.w  #$202, ($6,A6)
042ED6: 1D7C 0008 00B1             move.b  #$8, ($b1,A6)
042EDC: 7019                       moveq   #$19, D0
042EDE: 4EB9 0000 120E             jsr     $120e.l
042EE4: 6100 2048                  bsr     $44f2e
042EE8: 6100 2002                  bsr     $44eec
042EEC: 426E 00AE                  clr.w   ($ae,A6)
042EF0: 1D7C 00C8 00B0             move.b  #$c8, ($b0,A6)
042EF6: 6100 1A10                  bsr     $44908
042EFA: 4E75                       rts
042EFC: 4A2E 0051                  tst.b   ($51,A6)
042F00: 6600 0836                  bne     $43738
042F04: 6100 19E6                  bsr     $448ec
042F08: 4EB9 0003 24EE             jsr     $324ee.l
042F0E: 650C                       bcs     $42f1c
042F10: 532E 00B0                  subq.b  #1, ($b0,A6)
042F14: 6506                       bcs     $42f1c
042F16: 6100 1B70                  bsr     $44a88
042F1A: 6416                       bcc     $42f32
042F1C: 1D7C 0078 00B0             move.b  #$78, ($b0,A6)
042F22: 6100 15C4                  bsr     $444e8
042F26: 3D7C 0200 0006             move.w  #$200, ($6,A6)
042F2C: 422E 00B1                  clr.b   ($b1,A6)
042F30: 4E75                       rts
042F32: 4EB9 0000 1862             jsr     $1862.l
042F38: 4EF9 0000 121E             jmp     $121e.l
042F3E: 2D7C 0200 0400 0004        move.l  #$2000400, ($4,A6)
042F46: 4E75                       rts
042F48: 102E 0059                  move.b  ($59,A6), D0
042F4C: 6710                       beq     $42f5e
042F4E: 5300                       subq.b  #1, D0
042F50: 1D40 0059                  move.b  D0, ($59,A6)
042F54: 6702                       beq     $42f58
042F56: 4E75                       rts
042F58: 1D7C 0001 002F             move.b  #$1, ($2f,A6)
042F5E: 7000                       moveq   #$0, D0
042F60: 102E 0007                  move.b  ($7,A6), D0
042F64: 303B 0006                  move.w  ($6,PC,D0.w), D0
042F68: 4EFB 0002                  jmp     ($2,PC,D0.w)
042F6C: 0022 0042                  ori.b   #$42, -(A2)
042F70: 0146                       bchg    D0, D6
042F72: 01BC                       dc.w    $01bc; ILLEGAL
042F74: 0232 027C 0288             andi.b  #$7c, INVALID 32
042F7A: 047C                       dc.w    $047c; ILLEGAL
042F7C: 04FE                       dc.w    $04fe; ILLEGAL
042F7E: 0524                       btst    D2, -(A4)
042F80: 057A                       dc.w    $057a; ILLEGAL
042F82: 05D6                       bset    D2, (A6)
042F84: 061E 066E                  addi.b  #$6e, (A6)+
042F88: 06C0                       dc.w    $06c0; ILLEGAL
042F8A: 06CC                       dc.w    $06cc; ILLEGAL
042F8C: 073E                       dc.w    $073e; ILLEGAL
042F8E: 082E 0007 0050             btst    #$7, ($50,A6)
042F94: 6600 0064                  bne     $42ffa
042F98: 1D7C 0002 0007             move.b  #$2, ($7,A6)
042F9E: 6100 1CBA                  bsr     $44c5a
042FA2: 302E 00B6                  move.w  ($b6,A6), D0
042FA6: E748                       lsl.w   #3, D0
042FA8: 3D40 00B8                  move.w  D0, ($b8,A6)
042FAC: 4E75                       rts
042FAE: 306E 0076                  movea.w ($76,A6), A0
042FB2: 4A28 0000                  tst.b   ($0,A0)
042FB6: 6700 0042                  beq     $42ffa
042FBA: 0C28 0023 00C8             cmpi.b  #$23, ($c8,A0)			*人物倒地
042FC0: 6700 0038                  beq     $42ffa
042FC4: 0C28 0022 00C8             cmpi.b  #$22, ($c8,A0)
042FCA: 6700 002E                  beq     $42ffa
042FCE: 422E 00A9                  clr.b   ($a9,A6)
042FD2: 7200                       moveq   #$0, D1
042FD4: 302E 00B8                  move.w  ($b8,A6), D0
042FD8: 6B16                       bmi     $42ff0
042FDA: 123B 0028                  move.b  ($28,PC,D0.w), D1
042FDE: 6B10                       bmi     $42ff0
042FE0: 526E 00B8                  addq.w  #1, ($b8,A6)
042FE4: 41FA 0086                  lea     ($86,PC), A0; ($4306c)
042FE8: 3030 1000                  move.w  (A0,D1.w), D0
042FEC: 4EFB 007E                  jmp     ($7e,PC,D0.w)
042FF0: 2D7C 0200 0400 0004        move.l  #$2000400, ($4,A6)
042FF8: 4E75                       rts
042FFA: 2D7C 0200 0000 0004        move.l  #$2000000, ($4,A6)		*无攻击状态
043002: 4E75                       rts
043004: 0004 0406                  ori.b   #$6, D4
043008: FF00                       dc.w    $ff00; opcode 1111
04300A: 0000 0006                  ori.b   #$6, D0
04300E: FF00                       dc.w    $ff00; opcode 1111
043010: 0000 0000                  ori.b   #$0, D0
043014: 000C                       dc.w    $000c; ILLEGAL
043016: 0A02 0A02                  eori.b  #$2, D2
04301A: 0AFF                       dc.w    $0aff; ILLEGAL
04301C: 000C                       dc.w    $000c; ILLEGAL
04301E: 0E0C                       dc.w    $0e0c; ILLEGAL
043020: FF00                       dc.w    $ff00; opcode 1111
043022: 0000 08FF                  ori.b   #$ff, D0
043026: 0000 0000                  ori.b   #$0, D0
04302A: 0000 1004                  ori.b   #$4, D0
04302E: 0404 FF00                  subi.b  #$0, D4
043032: 0000 1006                  ori.b   #$6, D0
043036: FF00                       dc.w    $ff00; opcode 1111
043038: 0000 0000                  ori.b   #$0, D0
04303C: 0806 FF00                  btst    #$0, D6
043040: 0000 0000                  ori.b   #$0, D0
043044: 0404 FF00                  subi.b  #$0, D4
043048: 0000 0000                  ori.b   #$0, D0
04304C: 18FF                       dc.w    $18ff; ILLEGAL
04304E: 0000 0000                  ori.b   #$0, D0
043052: 0000 000C                  ori.b   #$c, D0
043056: 0A02 0A00                  eori.b  #$0, D2
04305A: 06FF                       dc.w    $06ff; ILLEGAL
04305C: 0004 0404                  ori.b   #$4, D4
043060: 0404 04FF                  subi.b  #-$1, D4
043064: 0004 08FF                  ori.b   #$ff, D4
043068: 0000 0000                  ori.b   #$0, D0
04306C: 001C 0080                  ori.b   #$80, (A4)+
043070: 00F4                       dc.w    $00f4; ILLEGAL
043072: 013E                       dc.w    $013e; ILLEGAL
043074: 0188 0352                  movep.w D0, ($352,A0)
043078: 03E0                       bset    D1, -(A0)
04307A: 040A                       dc.w    $040a; ILLEGAL
04307C: 043E                       dc.w    $043e; ILLEGAL
04307E: 04C8                       dc.w    $04c8; ILLEGAL
043080: 04F8                       dc.w    $04f8; ILLEGAL
043082: 0548 05CC                  movep.l ($5cc,A0), D2
043086: 0612 1D7C                  addi.b  #$7c, (A2)
04308A: 0004 0007                  ori.b   #$7, D4
04308E: 4A2E 00BD                  tst.b   ($bd,A6)
043092: 6604                       bne     $43098
043094: 7001                       moveq   #$1, D0
043096: 6002                       bra     $4309a
043098: 7006                       moveq   #$6, D0
04309A: 4EB9 0000 120E             jsr     $120e.l
0430A0: 6100 1E8C                  bsr     $44f2e
0430A4: 6100 1C26                  bsr     $44ccc
0430A8: 6100 1B1A                  bsr     $44bc4
0430AC: 1D7C 0078 00B0             move.b  #$78, ($b0,A6)
0430B2: 4A2E 0051                  tst.b   ($51,A6)
0430B6: 6600 0680                  bne     $43738
0430BA: 6100 1D96                  bsr     $44e52
0430BE: 6500 0544                  bcs     $43604
0430C2: 4EB9 0003 24EE             jsr     $324ee.l
0430C8: 6500 FF30                  bcs     $42ffa
0430CC: 532E 00B0                  subq.b  #1, ($b0,A6)
0430D0: 6500 FF28                  bcs     $42ffa
0430D4: 6100 1984                  bsr     $44a5a
0430D8: 6500 FED4                  bcs     $42fae
0430DC: 6100 1AE6                  bsr     $44bc4
0430E0: 4EB9 0000 1862             jsr     $1862.l
0430E6: 4EF9 0000 121E             jmp     $121e.l
0430EC: 1D7C 0006 0007             move.b  #$6, ($7,A6)
0430F2: 700F                       moveq   #$f, D0
0430F4: 4EB9 0000 120E             jsr     $120e.l
0430FA: 7016                       moveq   #$16, D0
0430FC: 4EB9 0000 17A4             jsr     $17a4.l
043102: 1D7C 001E 0080             move.b  #$1e, ($80,A6)
043108: 422E 00BA                  clr.b   ($ba,A6)
04310C: 306E 0076                  movea.w ($76,A6), A0
043110: 7208                       moveq   #$8, D1
043112: 302E 0008                  move.w  ($8,A6), D0
043116: 9068 0008                  sub.w   ($8,A0), D0
04311A: 6402                       bcc     $4311e
04311C: 7218                       moveq   #$18, D1
04311E: 1D41 0022                  move.b  D1, ($22,A6)
043122: 1D7C 0078 00B0             move.b  #$78, ($b0,A6)
043128: 6100 1BA2                  bsr     $44ccc
04312C: 532E 0080                  subq.b  #1, ($80,A6)
043130: 6500 FE7C                  bcs     $42fae
043134: 4A2E 00BA                  tst.b   ($ba,A6)
043138: 6624                       bne     $4315e
04313A: 6100 1BBA                  bsr     $44cf6
04313E: 651E                       bcs     $4315e
043140: 4EB9 0003 24EE             jsr     $324ee.l
043146: 6500 FEB2                  bcs     $42ffa
04314A: 532E 00B0                  subq.b  #1, ($b0,A6)
04314E: 6500 FEAA                  bcs     $42ffa
043152: 4EB9 0000 1862             jsr     $1862.l
043158: 4EF9 0000 121E             jmp     $121e.l
04315E: 4E75                       rts
043160: 1D7C 0008 0007             move.b  #$8, ($7,A6)
043166: 6100 1B64                  bsr     $44ccc
04316A: 7007                       moveq   #$7, D0
04316C: 4EB9 0000 120E             jsr     $120e.l
043172: 1D7C 0012 0058             move.b  #$12, ($58,A6)
043178: 422E 005A                  clr.b   ($5a,A6)
04317C: 422E 0059                  clr.b   ($59,A6)
043180: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
043186: 522D 67BE                  addq.b  #1, ($67be,A5)
04318A: 302E 00B8                  move.w  ($b8,A6), D0
04318E: 41FA FE74                  lea     (-$18c,PC), A0; ($43004)
043192: 1030 0000                  move.b  (A0,D0.w), D0
043196: 6A06                       bpl     $4319e
043198: 1D7C 0001 005A             move.b  #$1, ($5a,A6)
04319E: 4EB9 0000 121E             jsr     $121e.l
0431A4: 6500 04D8                  bcs     $4367e
0431A8: 4E75                       rts
0431AA: 1D7C 000A 0007             move.b  #$a, ($7,A6)
0431B0: 6100 1B1A                  bsr     $44ccc
0431B4: 7009                       moveq   #$9, D0
0431B6: 4EB9 0000 120E             jsr     $120e.l
0431BC: 1D7C 0013 0058             move.b  #$13, ($58,A6)
0431C2: 422E 005A                  clr.b   ($5a,A6)
0431C6: 422E 0059                  clr.b   ($59,A6)
0431CA: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
0431D0: 522D 67BE                  addq.b  #1, ($67be,A5)
0431D4: 302E 00B8                  move.w  ($b8,A6), D0
0431D8: 41FA FE2A                  lea     (-$1d6,PC), A0; ($43004)
0431DC: 1030 0000                  move.b  (A0,D0.w), D0
0431E0: 6A06                       bpl     $431e8
0431E2: 1D7C 0001 005A             move.b  #$1, ($5a,A6)
0431E8: 4EB9 0000 121E             jsr     $121e.l
0431EE: 6500 048E                  bcs     $4367e
0431F2: 4E75                       rts
0431F4: 7000                       moveq   #$0, D0
0431F6: 102E 00A9                  move.b  ($a9,A6), D0
0431FA: 303B 0006                  move.w  ($6,PC,D0.w), D0
0431FE: 4EFB 0002                  jmp     ($2,PC,D0.w)
043202: 0006 015E                  ori.b   #$5e, D6
043206: 0182                       bclr    D0, D2
043208: 1D7C 000C 0007             move.b  #$c, ($7,A6)
04320E: 542E 00A9                  addq.b  #2, ($a9,A6)
043212: 700B                       moveq   #$b, D0
043214: 4EB9 0000 120E             jsr     $120e.l
04321A: 1D7C 0014 0058             move.b  #$14, ($58,A6)
043220: 422E 005A                  clr.b   ($5a,A6)
043224: 422E 0059                  clr.b   ($59,A6)
043228: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
04322E: 522D 67BE                  addq.b  #1, ($67be,A5)
043232: 6100 1A98                  bsr     $44ccc
043236: 4EB9 0000 119C             jsr     $119c.l
04323C: 0240 000F                  andi.w  #$f, D0
043240: 0C40 0003                  cmpi.w  #$3, D0
043244: 6D00 0090                  blt     $432d6
043248: 6000 0002                  bra     $4324c
04324C: 1D7C 0001 0051             move.b  #$1, ($51,A6)
043252: 3D7C 0700 0016             move.w  #$700, ($16,A6)
043258: 3D7C FFC0 001C             move.w  #$ffc0, ($1c,A6)
04325E: 306E 0076                  movea.w ($76,A6), A0
043262: 7400                       moveq   #$0, D2
043264: 342E 0008                  move.w  ($8,A6), D2
043268: 9468 0008                  sub.w   ($8,A0), D2
04326C: 7638                       moveq   #$38, D3
04326E: 6100 0120                  bsr     $43390
043272: 342E 0008                  move.w  ($8,A6), D2
043276: 9468 0008                  sub.w   ($8,A0), D2
04327A: 6504                       bcs     $43280
04327C: 4440                       neg.w   D0
04327E: 4441                       neg.w   D1
043280: 3D41 0014                  move.w  D1, ($14,A6)
043284: D12E 0014                  add.b   D0, ($14,A6)
043288: 0640 0500                  addi.w  #$500, D0
04328C: 0C40 0A00                  cmpi.w  #$a00, D0
043290: 6508                       bcs     $4329a
043292: 303C 0500                  move.w  #$500, D0
043296: 3D40 0014                  move.w  D0, ($14,A6)
04329A: 426E 001A                  clr.w   ($1a,A6)
04329E: 7400                       moveq   #$0, D2
0432A0: 342E 0010                  move.w  ($10,A6), D2
0432A4: 9468 0010                  sub.w   ($10,A0), D2
0432A8: 7638                       moveq   #$38, D3
0432AA: 6100 00E4                  bsr     $43390
0432AE: 342E 0010                  move.w  ($10,A6), D2
0432B2: 9468 0010                  sub.w   ($10,A0), D2
0432B6: 650E                       bcs     $432c6
0432B8: 4440                       neg.w   D0
0432BA: 6608                       bne     $432c4
0432BC: 4A41                       tst.w   D1
0432BE: 6A04                       bpl     $432c4
0432C0: 303C FFFF                  move.w  #$ffff, D0
0432C4: 4441                       neg.w   D1
0432C6: E549                       lsl.w   #2, D1
0432C8: 3D41 0018                  move.w  D1, ($18,A6)
0432CC: D12E 0018                  add.b   D0, ($18,A6)
0432D0: 426E 001E                  clr.w   ($1e,A6)
0432D4: 4E75                       rts
0432D6: 1D7C 0001 0051             move.b  #$1, ($51,A6)
0432DC: 3D7C 0580 0016             move.w  #$580, ($16,A6)
0432E2: 3D7C FFC0 001C             move.w  #$ffc0, ($1c,A6)
0432E8: 306E 0076                  movea.w ($76,A6), A0
0432EC: 7400                       moveq   #$0, D2
0432EE: 342E 0008                  move.w  ($8,A6), D2
0432F2: 9468 0008                  sub.w   ($8,A0), D2
0432F6: 762C                       moveq   #$2c, D3
0432F8: 6100 0096                  bsr     $43390
0432FC: 342E 0008                  move.w  ($8,A6), D2
043300: 9468 0008                  sub.w   ($8,A0), D2
043304: 6504                       bcs     $4330a
043306: 4440                       neg.w   D0
043308: 4441                       neg.w   D1
04330A: 3D41 0014                  move.w  D1, ($14,A6)
04330E: D12E 0014                  add.b   D0, ($14,A6)
043312: 0640 0500                  addi.w  #$500, D0
043316: 0C40 0A00                  cmpi.w  #$a00, D0
04331A: 6508                       bcs     $43324
04331C: 303C 0500                  move.w  #$500, D0
043320: 3D40 0014                  move.w  D0, ($14,A6)
043324: 426E 001A                  clr.w   ($1a,A6)
043328: 7400                       moveq   #$0, D2
04332A: 342E 0010                  move.w  ($10,A6), D2
04332E: 9468 0010                  sub.w   ($10,A0), D2
043332: 762C                       moveq   #$2c, D3
043334: 6100 005A                  bsr     $43390
043338: 342E 0010                  move.w  ($10,A6), D2
04333C: 9468 0010                  sub.w   ($10,A0), D2
043340: 650E                       bcs     $43350
043342: 4440                       neg.w   D0
043344: 6608                       bne     $4334e
043346: 4A41                       tst.w   D1
043348: 6A04                       bpl     $4334e
04334A: 303C FFFF                  move.w  #$ffff, D0
04334E: 4441                       neg.w   D1
043350: E549                       lsl.w   #2, D1
043352: 3D41 0018                  move.w  D1, ($18,A6)
043356: D12E 0018                  add.b   D0, ($18,A6)
04335A: 426E 001E                  clr.w   ($1e,A6)
04335E: 4E75                       rts
043360: 4A2E 0051                  tst.b   ($51,A6)
043364: 6712                       beq     $43378
043366: 4A2E 002D                  tst.b   ($2d,A6)
04336A: 6606                       bne     $43372
04336C: 4EB9 0000 189C             jsr     $189c.l
043372: 4EF9 0000 121E             jmp     $121e.l
043378: 542E 00A9                  addq.b  #2, ($a9,A6)
04337C: 7003                       moveq   #$3, D0
04337E: 4EB9 0000 120E             jsr     $120e.l
043384: 4EB9 0000 121E             jsr     $121e.l
04338A: 6500 02F2                  bcs     $4367e
04338E: 4E75                       rts
043390: 4A42                       tst.w   D2
043392: 6A02                       bpl     $43396
043394: 4442                       neg.w   D2
043396: 6102                       bsr     $4339a
043398: 4E75                       rts
04339A: 4A83                       tst.l   D3
04339C: 671A                       beq     $433b8
04339E: 7000                       moveq   #$0, D0
0433A0: 7200                       moveq   #$0, D1
0433A2: 7820                       moveq   #$20, D4
0433A4: D080                       add.l   D0, D0
0433A6: D482                       add.l   D2, D2
0433A8: D381                       addx.l  D1, D1
0433AA: B283                       cmp.l   D3, D1
0433AC: 6D04                       blt     $433b2
0433AE: 9283                       sub.l   D3, D1
0433B0: 5280                       addq.l  #1, D0
0433B2: 5344                       subq.w  #1, D4
0433B4: 66EE                       bne     $433a4
0433B6: 4E75                       rts
0433B8: 7000                       moveq   #$0, D0
0433BA: 7200                       moveq   #$0, D1
0433BC: 4E75                       rts
0433BE: 1D7C 000E 0007             move.b  #$e, ($7,A6)
0433C4: 6100 197C                  bsr     $44d42
0433C8: 6536                       bcs     $43400
0433CA: 700E                       moveq   #$e, D0
0433CC: 4EB9 0000 120E             jsr     $120e.l
0433D2: 306E 0076                  movea.w ($76,A6), A0
0433D6: 7200                       moveq   #$0, D1
0433D8: 302E 0008                  move.w  ($8,A6), D0
0433DC: 9068 0008                  sub.w   ($8,A0), D0
0433E0: 6402                       bcc     $433e4
0433E2: 7201                       moveq   #$1, D1
0433E4: 1D41 0024                  move.b  D1, ($24,A6)
0433E8: 4A2E 002D                  tst.b   ($2d,A6)
0433EC: 6706                       beq     $433f4
0433EE: 422E 002D                  clr.b   ($2d,A6)
0433F2: 6116                       bsr     $4340a
0433F4: 4EB9 0000 121E             jsr     $121e.l
0433FA: 6500 0282                  bcs     $4367e
0433FE: 4E75                       rts
043400: 3D7C FFFF 00B8             move.w  #$ffff, ($b8,A6)
043406: 6000 0276                  bra     $4367e
04340A: 4EB9 0000 9CD8             jsr     $9cd8.l
043410: 7002                       moveq   #$2, D0
043412: 323C 0033                  move.w  #$33, D1
043416: 343C 0046                  move.w  #$46, D2
04341A: 4EB9 0005 7F62             jsr     $57f62.l
043420: 702B                       moveq   #$2b, D0
043422: 4A2E 0024                  tst.b   ($24,A6)
043426: 6602                       bne     $4342a
043428: 4440                       neg.w   D0
04342A: D06E 0008                  add.w   ($8,A6), D0
04342E: 7245                       moveq   #$45, D1
043430: D26E 000C                  add.w   ($c,A6), D1
043434: 342E 0010                  move.w  ($10,A6), D2
043438: 760F                       moveq   #$f, D3
04343A: 4EB9 0009 2422             jsr     $92422.l
043440: 5041                       addq.w  #8, D1
043442: 7606                       moveq   #$6, D3
043444: 4EB9 0009 2450             jsr     $92450.l
04344A: 4E75                       rts
04344C: 6100 1AB4                  bsr     $44f02
043450: 650A                       bcs     $4345c
043452: 3D7C FFFF 00B8             move.w  #$ffff, ($b8,A6)
043458: 6000 FB54                  bra     $42fae
04345C: 1D7C 0010 0007             move.b  #$10, ($7,A6)
043462: 700C                       moveq   #$c, D0
043464: 4EB9 0000 120E             jsr     $120e.l
04346A: 4EB9 0000 121E             jsr     $121e.l
043470: 6500 020C                  bcs     $4367e
043474: 4E75                       rts
043476: 1D7C 0012 0007             move.b  #$12, ($7,A6)
04347C: 6100 184E                  bsr     $44ccc
043480: 7010                       moveq   #$10, D0
043482: 4EB9 0000 120E             jsr     $120e.l
043488: 0000 0000                  ori.b   #$0, D0
04348C: 0000 0000                  ori.b   #$0, D0
043490: 4A2E 002D                  tst.b   ($2d,A6)
043494: 6708                       beq     $4349e
043496: 422E 002D                  clr.b   ($2d,A6)
04349A: 6100 FF6E                  bsr     $4340a
04349E: 4EB9 0000 121E             jsr     $121e.l
0434A4: 6500 01D8                  bcs     $4367e
0434A8: 4E75                       rts
0434AA: 1D7C 0014 0007             move.b  #$14, ($7,A6)
0434B0: 6100 190A                  bsr     $44dbc
0434B4: 6500 FAF8                  bcs     $42fae
0434B8: 6100 1812                  bsr     $44ccc
0434BC: 1D7C 0001 00B5             move.b  #$1, ($b5,A6)
0434C2: 1D7C 0014 00BC             move.b  #$14, ($bc,A6)
0434C8: 7004                       moveq   #$4, D0
0434CA: 4EB9 0000 120E             jsr     $120e.l
0434D0: 7019                       moveq   #$19, D0
0434D2: 4EB9 0000 17A4             jsr     $17a4.l
0434D8: 6100 149A                  bsr     $44974
0434DC: 6100 1742                  bsr     $44c20
0434E0: 4EB9 0000 1862             jsr     $1862.l
0434E6: 532E 00BC                  subq.b  #1, ($bc,A6)
0434EA: 6404                       bcc     $434f0
0434EC: 422E 00BC                  clr.b   ($bc,A6)
0434F0: 6100 186E                  bsr     $44d60
0434F4: 6414                       bcc     $4350a
0434F6: 6100 0022                  bsr     $4351a
0434FA: 6100 1892                  bsr     $44d8e
0434FE: 6434                       bcc     $43534
043500: 4A2E 00BC                  tst.b   ($bc,A6)
043504: 662E                       bne     $43534
043506: 6000 0176                  bra     $4367e
04350A: 6100 1714                  bsr     $44c20
04350E: 4EB9 0000 1862             jsr     $1862.l
043514: 4EF9 0000 121E             jmp     $121e.l
04351A: 302E 0014                  move.w  ($14,A6), D0
04351E: 4440                       neg.w   D0
043520: EA40                       asr.w   #5, D0
043522: 3D40 001A                  move.w  D0, ($1a,A6)
043526: 302E 0018                  move.w  ($18,A6), D0
04352A: 4440                       neg.w   D0
04352C: EA40                       asr.w   #5, D0
04352E: 3D40 001E                  move.w  D0, ($1e,A6)
043532: 4E75                       rts
043534: 1D7C 0016 0007             move.b  #$16, ($7,A6)
04353A: 7003                       moveq   #$3, D0
04353C: 4EB9 0000 120E             jsr     $120e.l
043542: 302E 0014                  move.w  ($14,A6), D0
043546: 0640 0030                  addi.w  #$30, D0
04354A: 0C40 0060                  cmpi.w  #$60, D0
04354E: 6506                       bcs     $43556
043550: 4EF9 0000 189C             jmp     $189c.l
043556: 422E 00B5                  clr.b   ($b5,A6)
04355A: 3D7C FFFF 00B8             move.w  #$ffff, ($b8,A6)
043560: 6000 011C                  bra     $4367e
043564: 1D7C 0018 0007             move.b  #$18, ($7,A6)
04356A: 7011                       moveq   #$11, D0
04356C: 4EB9 0000 120E             jsr     $120e.l
043572: 1D7C 0015 0058             move.b  #$15, ($58,A6)
043578: 422E 005A                  clr.b   ($5a,A6)
04357C: 422E 0059                  clr.b   ($59,A6)
043580: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
043586: 522D 67BE                  addq.b  #1, ($67be,A5)
04358A: 302E 0014                  move.w  ($14,A6), D0
04358E: 0640 0030                  addi.w  #$30, D0
043592: 0C40 0060                  cmpi.w  #$60, D0
043596: 650C                       bcs     $435a4
043598: 4EB9 0000 189C             jsr     $189c.l
04359E: 4EF9 0000 121E             jmp     $121e.l
0435A4: 422E 00B5                  clr.b   ($b5,A6)
0435A8: 3D7C FFFF 00B8             move.w  #$ffff, ($b8,A6)
0435AE: 6000 00CE                  bra     $4367e
0435B2: 4E75                       rts
0435B4: 1D7C 001A 0007             move.b  #$1a, ($7,A6)
0435BA: 7012                       moveq   #$12, D0
0435BC: 4EB9 0000 120E             jsr     $120e.l
0435C2: 1D7C 0016 0058             move.b  #$16, ($58,A6)
0435C8: 422E 005A                  clr.b   ($5a,A6)
0435CC: 422E 0059                  clr.b   ($59,A6)
0435D0: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
0435D6: 522D 67BE                  addq.b  #1, ($67be,A5)
0435DA: 302E 0014                  move.w  ($14,A6), D0
0435DE: 0640 0030                  addi.w  #$30, D0
0435E2: 0C40 0060                  cmpi.w  #$60, D0
0435E6: 650C                       bcs     $435f4
0435E8: 4EB9 0000 189C             jsr     $189c.l
0435EE: 4EF9 0000 121E             jmp     $121e.l
0435F4: 422E 00B5                  clr.b   ($b5,A6)
0435F8: 3D7C FFFF 00B8             move.w  #$ffff, ($b8,A6)
0435FE: 6000 007E                  bra     $4367e
043602: 4E75                       rts
043604: 2D7C 0200 041C 0004        move.l  #$200041c, ($4,A6)
04360C: 700A                       moveq   #$a, D0
04360E: 4EB9 0000 120E             jsr     $120e.l
043614: 1D7C 0035 0058             move.b  #$35, ($58,A6)
04361A: 422E 005A                  clr.b   ($5a,A6)
04361E: 422E 0059                  clr.b   ($59,A6)
043622: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
043628: 522D 67BE                  addq.b  #1, ($67be,A5)
04362C: 4EB9 0000 121E             jsr     $121e.l
043632: 6500 F9C6                  bcs     $42ffa
043636: 4E75                       rts
043638: 7000                       moveq   #$0, D0
04363A: 102E 00A9                  move.b  ($a9,A6), D0
04363E: 303B 0006                  move.w  ($6,PC,D0.w), D0
043642: 4EFB 0002                  jmp     ($2,PC,D0.w)
043646: 0006 FD1A                  ori.b   #$1a, D6
04364A: FD3E                       dc.w    $fd3e; opcode 1111
04364C: 1D7C 001E 0007             move.b  #$1e, ($7,A6)
043652: 542E 00A9                  addq.b  #2, ($a9,A6)
043656: 7018                       moveq   #$18, D0
043658: 4EB9 0000 120E             jsr     $120e.l
04365E: 1D7C 0014 0058             move.b  #$14, ($58,A6)
043664: 422E 005A                  clr.b   ($5a,A6)
043668: 422E 0059                  clr.b   ($59,A6)
04366C: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
043672: 522D 67BE                  addq.b  #1, ($67be,A5)
043676: 6100 1654                  bsr     $44ccc
04367A: 6000 FBD0                  bra     $4324c
04367E: 1D7C 0020 0007             move.b  #$20, ($7,A6)
043684: 4EB9 0000 119C             jsr     $119c.l
04368A: 0240 001F                  andi.w  #$1f, D0
04368E: 103B 0024                  move.b  ($24,PC,D0.w), D0
043692: 322D 05EE                  move.w  ($5ee,A5), D1
043696: 0241 0018                  andi.w  #$18, D1
04369A: D041                       add.w   D1, D0
04369C: 1D7B 0036 0080             move.b  ($36,PC,D0.w), ($80,A6)
0436A2: 7000                       moveq   #$0, D0
0436A4: 4EB9 0000 120E             jsr     $120e.l
0436AA: 532E 0080                  subq.b  #1, ($80,A6)
0436AE: 6500 F8FE                  bcs     $42fae
0436B2: 4E75                       rts
0436B4: 0001 0202                  ori.b   #$2, D1
0436B8: 0203 0303                  andi.b  #$3, D3
0436BC: 0303                       btst    D1, D3
0436BE: 0303                       btst    D1, D3
0436C0: 0303                       btst    D1, D3
0436C2: 0303                       btst    D1, D3
0436C4: 0404 0404                  subi.b  #$4, D4
0436C8: 0404 0404                  subi.b  #$4, D4
0436CC: 0404 0405                  subi.b  #$5, D4
0436D0: 0505                       btst    D2, D5
0436D2: 0607 0305                  addi.b  #$5, D7
0436D6: 0709 0B0F                  movep.w ($b0f,A1), D3
0436DA: 111E                       move.b  (A6)+, -(A0)
0436DC: 0203 0507                  andi.b  #$7, D3
0436E0: 090C 0E10                  movep.w ($e10,A4), D4
0436E4: 0102                       btst    D0, D2
0436E6: 0303                       btst    D1, D3
0436E8: 0405 0608                  subi.b  #$8, D5
0436EC: 0101                       btst    D0, D1
0436EE: 0102                       btst    D0, D2
0436F0: 0202 0303                  andi.b  #$3, D2
0436F4: 306E 0076                  movea.w ($76,A6), A0
0436F8: 4A28 0000                  tst.b   ($0,A0)
0436FC: 6700 F4B6                  beq     $42bb4
043700: 0C28 0023 00C8             cmpi.b  #$23, ($c8,A0)
043706: 6700 F4AC                  beq     $42bb4
04370A: 0C28 0022 00C8             cmpi.b  #$22, ($c8,A0)
043710: 6700 F4A2                  beq     $42bb4
043714: 536E 00B2                  subq.w  #1, ($b2,A6)
043718: 640E                       bcc     $43728
04371A: 3D7C 0258 00B2             move.w  #$258, ($b2,A6)
043720: 6100 0BF4                  bsr     $44316
043724: 6100 0DC2                  bsr     $444e8
043728: 4A2E 0051                  tst.b   ($51,A6)
04372C: 6600 F486                  bne     $42bb4
043730: 3D7C 0400 0006             move.w  #$400, ($6,A6)
043736: 4E75                       rts
043738: 2D7C 0200 0800 0004        move.l  #$2000800, ($4,A6)
043740: 4E75                       rts
043742: 7000                       moveq   #$0, D0
043744: 102E 0007                  move.b  ($7,A6), D0
043748: 303B 0006                  move.w  ($6,PC,D0.w), D0
04374C: 4EFB 0002                  jmp     ($2,PC,D0.w)
043750: 0006 002E                  ori.b   #$2e, D6
043754: 004C                       dc.w    $004c; ILLEGAL
043756: 542E 0007                  addq.b  #2, ($7,A6)
04375A: 7016                       moveq   #$16, D0
04375C: 4EB9 0000 120E             jsr     $120e.l
043762: 426E 0014                  clr.w   ($14,A6)
043766: 426E 001A                  clr.w   ($1a,A6)
04376A: 426E 0016                  clr.w   ($16,A6)
04376E: 3D7C FFE0 001C             move.w  #$ffe0, ($1c,A6)
043774: 426E 0018                  clr.w   ($18,A6)
043778: 426E 001E                  clr.w   ($1e,A6)
04377C: 4E75                       rts
04377E: 4A2E 0051                  tst.b   ($51,A6)
043782: 670C                       beq     $43790
043784: 4EB9 0000 189C             jsr     $189c.l
04378A: 4EF9 0000 121E             jmp     $121e.l
043790: 542E 0007                  addq.b  #2, ($7,A6)
043794: 7003                       moveq   #$3, D0
043796: 4EB9 0000 120E             jsr     $120e.l
04379C: 4EB9 0000 121E             jsr     $121e.l
0437A2: 6500 F340                  bcs     $42ae4
0437A6: 4E75                       rts
0437A8: 3D7C 0A00 0006             move.w  #$a00, ($6,A6)
0437AE: 7000                       moveq   #$0, D0
0437B0: 102E 0007                  move.b  ($7,A6), D0
0437B4: 303B 0006                  move.w  ($6,PC,D0.w), D0
0437B8: 4EFB 0002                  jmp     ($2,PC,D0.w)
0437BC: 0006 0024                  ori.b   #$24, D6
0437C0: 0052 542E                  ori.w   #$542e, (A2)
0437C4: 0007 1D7C                  ori.b   #$7c, D7
0437C8: 0003 007C                  ori.b   #$7c, D3
0437CC: 6100 1000                  bsr     $447ce
0437D0: 6100 F5FC                  bsr     $42dce
0437D4: 7017                       moveq   #$17, D0
0437D6: 4EB9 0000 120E             jsr     $120e.l
0437DC: 6000 14EE                  bra     $44ccc
0437E0: 4A2E 0051                  tst.b   ($51,A6)
0437E4: 6712                       beq     $437f8
0437E6: 4A2E 002D                  tst.b   ($2d,A6)
0437EA: 6606                       bne     $437f2
0437EC: 4EB9 0000 189C             jsr     $189c.l
0437F2: 4EF9 0000 121E             jmp     $121e.l
0437F8: 542E 0007                  addq.b  #2, ($7,A6)
0437FC: 422E 0024                  clr.b   ($24,A6)
043800: 700D                       moveq   #$d, D0
043802: 4EB9 0000 120E             jsr     $120e.l
043808: 1B7C 0001 0502             move.b  #$1, ($502,A5)
04380E: 4A2E 002D                  tst.b   ($2d,A6)
043812: 6708                       beq     $4381c
043814: 422E 002D                  clr.b   ($2d,A6)
043818: 6100 0010                  bsr     $4382a
04381C: 4EB9 0000 121E             jsr     $121e.l
043822: 6502                       bcs     $43826
043824: 4E75                       rts
043826: 6000 F7D2                  bra     $42ffa
04382A: 4EB9 0000 9CD8             jsr     $9cd8.l
043830: 7029                       moveq   #$29, D0
043832: 4A2E 0024                  tst.b   ($24,A6)
043836: 6702                       beq     $4383a
043838: 4440                       neg.w   D0
04383A: D06E 0008                  add.w   ($8,A6), D0
04383E: 726D                       moveq   #$6d, D1
043840: D26E 000C                  add.w   ($c,A6), D1
043844: 342E 0010                  move.w  ($10,A6), D2
043848: 7617                       moveq   #$17, D3
04384A: 4EB9 0009 2422             jsr     $92422.l
043850: 5041                       addq.w  #8, D1
043852: 7606                       moveq   #$6, D3
043854: 4EB9 0009 2450             jsr     $92450.l
04385A: 4E75                       rts
04385C: 4A2E 0026                  tst.b   ($26,A6)
043860: 6628                       bne     $4388a
043862: 4EB9 0003 262A             jsr     $3262a.l
043868: 302E 006C                  move.w  ($6c,A6), D0
04386C: 661C                       bne     $4388a
04386E: 4EB9 0003 2740             jsr     $32740.l
043874: 322E 006E                  move.w  ($6e,A6), D1
043878: 6710                       beq     $4388a
04387A: 4EB9 0000 ACEE             jsr     $acee.l
043880: 426E 006E                  clr.w   ($6e,A6)
043884: 4EB9 0000 A5EA             jsr     $a5ea.l
04388A: 4EF9 0002 A606             jmp     $2a606.l
043890: 4E75                       rts
043892: 7000                       moveq   #$0, D0
043894: 102E 0005                  move.b  ($5,A6), D0
043898: 323B 0006                  move.w  ($6,PC,D0.w), D1
04389C: 4EFB 1002                  jmp     ($2,PC,D1.w)
0438A0: 0004 0020                  ori.b   #$20, D4
0438A4: 4EB9 0003 25E6             jsr     $325e6.l
0438AA: 542E 0005                  addq.b  #2, ($5,A6)
0438AE: 1D7C 0078 0080             move.b  #$78, ($80,A6)
0438B4: 4A2E 0026                  tst.b   ($26,A6)
0438B8: 6606                       bne     $438c0
0438BA: 4EB9 0000 6148             jsr     $6148.l
0438C0: 4A2E 0026                  tst.b   ($26,A6)
0438C4: 6600 0008                  bne     $438ce
0438C8: 4EF9 0000 49CA             jmp     $49ca.l
0438CE: 102E 0080                  move.b  ($80,A6), D0
0438D2: 5300                       subq.b  #1, D0
0438D4: 6510                       bcs     $438e6
0438D6: 1D40 0080                  move.b  D0, ($80,A6)
0438DA: 0200 0001                  andi.b  #$1, D0
0438DE: 670A                       beq     $438ea
0438E0: 4EF9 0000 49CA             jmp     $49ca.l
0438E6: 542E 0004                  addq.b  #2, ($4,A6)
0438EA: 4E75                       rts
0438EC: 4EF9 0000 48FC             jmp     $48fc.l
0438F2: 0038 0044 0082             ori.b   #$44, $82.w
0438F8: 00A2 00AE 00D8             ori.l   #$ae00d8, -(A2)
0438FE: 00F8                       dc.w    $00f8; ILLEGAL
043900: 0136 0156                  btst    D0, INVALID 36
043904: 0176 01A0                  bchg    D0, INVALID 36
043908: 01B6 01E0                  bclr    D0, INVALID 36
04390C: 01EC 0234                  bset    D0, ($234,A4)
043910: 0272 02B0 0370             andi.w  #$2b0, INVALID 32
043916: 0386                       bclr    D1, D6
043918: 03A6                       bclr    D1, -(A6)
04391A: 03D0                       bset    D1, (A0)
04391C: 0404 0096                  subi.b  #-$6a, D4
043920: 046A 0480 04AA             subi.w  #$480, ($4aa,A2)
043926: 0542                       bchg    D2, D2
043928: 0000 1250                  ori.b   #$50, D0
04392C: 8000                       or.b    D0, D0
04392E: 0000 0081                  ori.b   #$81, D0
043932: 6D00 FFF6                  blt     $4392a
043936: 1250                       dc.w    $1250; ILLEGAL
043938: 8000                       or.b    D0, D0
04393A: 0000 0004                  ori.b   #$4, D0
04393E: 6D00 1254                  blt     $44b94
043942: 8000                       or.b    D0, D0
043944: 0000 0004                  ori.b   #$4, D0
043948: 6D00 1258                  blt     $44ba2
04394C: 8000                       or.b    D0, D0
04394E: 0000 0004                  ori.b   #$4, D0
043952: 6D00 125C                  blt     $44bb0
043956: 8000                       or.b    D0, D0
043958: 0000 0004                  ori.b   #$4, D0
04395C: 6D00 1260                  blt     $44bbe
043960: 8000                       or.b    D0, D0
043962: 0000 0004                  ori.b   #$4, D0
043966: 6D00 1264                  blt     $44bcc
04396A: 8000                       or.b    D0, D0
04396C: 0000 0084                  ori.b   #$84, D0
043970: 6D00 FFC4                  blt     $43936
043974: 1268                       dc.w    $1268; ILLEGAL
043976: 8000                       or.b    D0, D0
043978: 0001 0001                  ori.b   #$1, D1
04397C: 6E00 126C                  bgt     $44bea
043980: 8000                       or.b    D0, D0
043982: 0000 0004                  ori.b   #$4, D0
043986: 6F00 126C                  ble     $44bf4
04398A: 8000                       or.b    D0, D0
04398C: 0000 00D0                  ori.b   #$d0, D0
043990: 6F00 FFF6                  ble     $43988
043994: 1268                       dc.w    $1268; ILLEGAL
043996: 8000                       or.b    D0, D0
043998: 0000 0087                  ori.b   #$87, D0
04399C: 6E00 FFF6                  bgt     $43994
0439A0: 1270                       dc.w    $1270; ILLEGAL
0439A2: 8000                       or.b    D0, D0
0439A4: 0000 0006                  ori.b   #$6, D0
0439A8: 7100                       dc.w    $7100; ILLEGAL
0439AA: 1274                       dc.w    $1274; ILLEGAL
0439AC: 8000                       or.b    D0, D0
0439AE: 0000 0006                  ori.b   #$6, D0
0439B2: 7100                       dc.w    $7100; ILLEGAL
0439B4: 1278                       dc.w    $1278; ILLEGAL
0439B6: 8000                       or.b    D0, D0
0439B8: 0000 0006                  ori.b   #$6, D0
0439BC: 7100                       dc.w    $7100; ILLEGAL
0439BE: 127C                       dc.w    $127c; ILLEGAL
0439C0: 8000                       or.b    D0, D0
0439C2: 0000 0086                  ori.b   #$86, D0
0439C6: 7100                       dc.w    $7100; ILLEGAL
0439C8: FFD8                       dc.w    $ffd8; opcode 1111
0439CA: 1280                       move.b  D0, (A1)
0439CC: 8000                       or.b    D0, D0
0439CE: 0000 0007                  ori.b   #$7, D0
0439D2: 6D00 1284                  blt     $44c58
0439D6: 8000                       or.b    D0, D0
0439D8: 0000 0007                  ori.b   #$7, D0
0439DC: 6D00 1280                  blt     $44c5e
0439E0: 8000                       or.b    D0, D0
0439E2: 0000 009E                  ori.b   #$9e, D0
0439E6: 6D00 FFF6                  blt     $439de
0439EA: 1288                       dc.w    $1288; ILLEGAL
0439EC: 8000                       or.b    D0, D0
0439EE: 0000 0004                  ori.b   #$4, D0
0439F2: 7200                       moveq   #$0, D1
0439F4: 128C                       dc.w    $128c; ILLEGAL
0439F6: 8000                       or.b    D0, D0
0439F8: 0000 0004                  ori.b   #$4, D0
0439FC: 7200                       moveq   #$0, D1
0439FE: 1290                       move.b  (A0), (A1)
043A00: 8000                       or.b    D0, D0
043A02: 0000 0004                  ori.b   #$4, D0
043A06: 7200                       moveq   #$0, D1
043A08: 1294                       move.b  (A4), (A1)
043A0A: 8000                       or.b    D0, D0
043A0C: 0000 0004                  ori.b   #$4, D0
043A10: 7200                       moveq   #$0, D1
043A12: 1298                       move.b  (A0)+, (A1)
043A14: 8000                       or.b    D0, D0
043A16: 0000 0004                  ori.b   #$4, D0
043A1A: 7200                       moveq   #$0, D1
043A1C: 129C                       move.b  (A4)+, (A1)
043A1E: 8000                       or.b    D0, D0
043A20: 0000 0084                  ori.b   #$84, D0
043A24: 7200                       moveq   #$0, D1
043A26: FFC4                       dc.w    $ffc4; opcode 1111
043A28: 12A0                       move.b  -(A0), (A1)
043A2A: 8000                       or.b    D0, D0
043A2C: 0000 0001                  ori.b   #$1, D0
043A30: 7300                       dc.w    $7300; ILLEGAL
043A32: 12A4                       move.b  -(A4), (A1)
043A34: 8000                       or.b    D0, D0
043A36: 0000 040E                  ori.b   #$e, D0
043A3A: 747A                       moveq   #$7a, D2
043A3C: 12A0                       move.b  -(A0), (A1)
043A3E: 8000                       or.b    D0, D0
043A40: 0000 0081                  ori.b   #$81, D0
043A44: 7300                       dc.w    $7300; ILLEGAL
043A46: FFF6                       dc.w    $fff6; opcode 1111
043A48: 12A8 8000                  move.b  (-$8000,A0), (A1)
043A4C: 0000 0004                  ori.b   #$4, D0
043A50: 6D00 12AC                  blt     $44cfe
043A54: 8000                       or.b    D0, D0
043A56: 0000 0002                  ori.b   #$2, D0
043A5A: 6D00 12A8                  blt     $44d04
043A5E: 8000                       or.b    D0, D0
043A60: 0000 009E                  ori.b   #$9e, D0
043A64: 6D00 FFF6                  blt     $43a5c
043A68: 12B0 8000                  move.b  (A0,A0.w), (A1)
043A6C: 0000 0004                  ori.b   #$4, D0
043A70: 7500                       dc.w    $7500; ILLEGAL
043A72: 12B4 8000                  move.b  (A4,A0.w), (A1)
043A76: 0000 040A                  ori.b   #$a, D0
043A7A: 767C                       moveq   #$7c, D3
043A7C: 12B8 8000                  move.b  $8000.w, (A1)
043A80: 0000 0014                  ori.b   #$14, D0
043A84: 7700                       dc.w    $7700; ILLEGAL
043A86: 12BC 8000                  move.b  #$0, (A1)
043A8A: 0000 0083                  ori.b   #$83, D0
043A8E: 7500                       dc.w    $7500; ILLEGAL
043A90: FFF6                       dc.w    $fff6; opcode 1111
043A92: 12C0                       move.b  D0, (A1)+
043A94: 8000                       or.b    D0, D0
043A96: 0000 0008                  ori.b   #$8, D0
043A9A: 7E00                       moveq   #$0, D7
043A9C: 12C4                       move.b  D4, (A1)+
043A9E: 8000                       or.b    D0, D0
043AA0: 0000 048A                  ori.b   #$8a, D0
043AA4: 6D80                       blt     $43a26
043AA6: FFF6                       dc.w    $fff6; opcode 1111
043AA8: 1268                       dc.w    $1268; ILLEGAL
043AAA: 8000                       or.b    D0, D0
043AAC: 0001 0001                  ori.b   #$1, D1
043AB0: 6E00 126C                  bgt     $44d1e
043AB4: 8000                       or.b    D0, D0
043AB6: 0000 0004                  ori.b   #$4, D0
043ABA: 6F00 126C                  ble     $44d28
043ABE: 8000                       or.b    D0, D0
043AC0: 0000 0015                  ori.b   #$15, D0
043AC4: 6F00 12C8                  ble     $44d8e
043AC8: 8000                       or.b    D0, D0
043ACA: 0000 04D0                  ori.b   #$d0, D0
043ACE: 7079                       moveq   #$79, D0
043AD0: FFF6                       dc.w    $fff6; opcode 1111
043AD2: 12CC                       dc.w    $12cc; ILLEGAL
043AD4: 8000                       or.b    D0, D0
043AD6: 0000 0099                  ori.b   #$99, D0
043ADA: 7800                       moveq   #$0, D4
043ADC: FFF6                       dc.w    $fff6; opcode 1111
043ADE: 12D0                       move.b  (A0), (A1)+
043AE0: 8000                       or.b    D0, D0
043AE2: 0000 0001                  ori.b   #$1, D0
043AE6: 0000 12D0                  ori.b   #$d0, D0
043AEA: 8000                       or.b    D0, D0
043AEC: 0000 0004                  ori.b   #$4, D0
043AF0: 7800                       moveq   #$0, D4
043AF2: 12D4                       move.b  (A4), (A1)+
043AF4: 8000                       or.b    D0, D0
043AF6: 0001 0004                  ori.b   #$4, D1
043AFA: 7800                       moveq   #$0, D4
043AFC: 12D0                       move.b  (A0), (A1)+
043AFE: 8000                       or.b    D0, D0
043B00: 0000 0005                  ori.b   #$5, D0
043B04: 7800                       moveq   #$0, D4
043B06: 12D4                       move.b  (A4), (A1)+
043B08: 8000                       or.b    D0, D0
043B0A: 0001 0004                  ori.b   #$4, D1
043B0E: 7800                       moveq   #$0, D4
043B10: 12D0                       move.b  (A0), (A1)+
043B12: 8000                       or.b    D0, D0
043B14: 0000 0005                  ori.b   #$5, D0
043B18: 7800                       moveq   #$0, D4
043B1A: 12D4                       move.b  (A4), (A1)+
043B1C: 8000                       or.b    D0, D0
043B1E: 0001 009E                  ori.b   #$9e, D1
043B22: 7800                       moveq   #$0, D4
043B24: FFF6                       dc.w    $fff6; opcode 1111
043B26: 12D8                       move.b  (A0)+, (A1)+
043B28: 8000                       or.b    D0, D0
043B2A: 0000 0011                  ori.b   #$11, D0
043B2E: 7800                       moveq   #$0, D4
043B30: 12DC                       move.b  (A4)+, (A1)+
043B32: 8000                       or.b    D0, D0
043B34: 0001 0007                  ori.b   #$7, D1
043B38: 7800                       moveq   #$0, D4
043B3A: 12D8                       move.b  (A0)+, (A1)+
043B3C: 8000                       or.b    D0, D0
043B3E: 0000 0011                  ori.b   #$11, D0
043B42: 7800                       moveq   #$0, D4
043B44: 12D8                       move.b  (A0)+, (A1)+
043B46: 8000                       or.b    D0, D0
043B48: 0000 0007                  ori.b   #$7, D0
043B4C: 7800                       moveq   #$0, D4
043B4E: 12DC                       move.b  (A4)+, (A1)+
043B50: 8000                       or.b    D0, D0
043B52: 0001 0007                  ori.b   #$7, D1
043B56: 7800                       moveq   #$0, D4
043B58: 12D8                       move.b  (A0)+, (A1)+
043B5A: 8000                       or.b    D0, D0
043B5C: 0000 0091                  ori.b   #$91, D0
043B60: 7800                       moveq   #$0, D4
043B62: FFF6                       dc.w    $fff6; opcode 1111
043B64: 12D0                       move.b  (A0), (A1)+
043B66: 8000                       or.b    D0, D0
043B68: 0000 0005                  ori.b   #$5, D0
043B6C: 7800                       moveq   #$0, D4
043B6E: 3338 8000                  move.w  $8000.w, -(A1)
043B72: 0000 0005                  ori.b   #$5, D0
043B76: 7800                       moveq   #$0, D4
043B78: 333C 8000                  move.w  #$8000, -(A1)
043B7C: 0000 0005                  ori.b   #$5, D0
043B80: 7800                       moveq   #$0, D4
043B82: 3340 8000                  move.w  D0, (-$8000,A1)
043B86: 0000 0005                  ori.b   #$5, D0
043B8A: 7800                       moveq   #$0, D4
043B8C: 3344 8000                  move.w  D4, (-$8000,A1)
043B90: 0000 0005                  ori.b   #$5, D0
043B94: 7800                       moveq   #$0, D4
043B96: 3348 8000                  move.w  A0, (-$8000,A1)
043B9A: 0000 0085                  ori.b   #$85, D0
043B9E: 7800                       moveq   #$0, D4
043BA0: FFC4                       dc.w    $ffc4; opcode 1111
043BA2: 12D8                       move.b  (A0)+, (A1)+
043BA4: 8000                       or.b    D0, D0
043BA6: 0000 000A                  ori.b   #$a, D0
043BAA: 7800                       moveq   #$0, D4
043BAC: 12D8                       move.b  (A0)+, (A1)+
043BAE: 8000                       or.b    D0, D0
043BB0: 0000 0007                  ori.b   #$7, D0
043BB4: 7800                       moveq   #$0, D4
043BB6: 12DC                       move.b  (A4)+, (A1)+
043BB8: 8000                       or.b    D0, D0
043BBA: 0001 0007                  ori.b   #$7, D1
043BBE: 7800                       moveq   #$0, D4
043BC0: 12D8                       move.b  (A0)+, (A1)+
043BC2: 8000                       or.b    D0, D0
043BC4: 0000 0005                  ori.b   #$5, D0
043BC8: 7800                       moveq   #$0, D4
043BCA: 12D8                       move.b  (A0)+, (A1)+
043BCC: 8000                       or.b    D0, D0
043BCE: 0000 0002                  ori.b   #$2, D0
043BD2: 7800                       moveq   #$0, D4
043BD4: 12DC                       move.b  (A4)+, (A1)+
043BD6: 8000                       or.b    D0, D0
043BD8: 0001 0007                  ori.b   #$7, D1
043BDC: 7800                       moveq   #$0, D4
043BDE: 12D8                       move.b  (A0)+, (A1)+
043BE0: 8000                       or.b    D0, D0
043BE2: 0000 0005                  ori.b   #$5, D0
043BE6: 7800                       moveq   #$0, D4
043BE8: 12D8                       move.b  (A0)+, (A1)+
043BEA: 8000                       or.b    D0, D0
043BEC: 0000 0002                  ori.b   #$2, D0
043BF0: 7800                       moveq   #$0, D4
043BF2: 12DC                       move.b  (A4)+, (A1)+
043BF4: 8000                       or.b    D0, D0
043BF6: 0001 0007                  ori.b   #$7, D1
043BFA: 7800                       moveq   #$0, D4
043BFC: 12D8                       move.b  (A0)+, (A1)+
043BFE: 8000                       or.b    D0, D0
043C00: 0000 000F                  ori.b   #$f, D0
043C04: 7800                       moveq   #$0, D4
043C06: 12D8                       move.b  (A0)+, (A1)+
043C08: 8000                       or.b    D0, D0
043C0A: 0000 0009                  ori.b   #$9, D0
043C0E: 7800                       moveq   #$0, D4
043C10: 12DC                       move.b  (A4)+, (A1)+
043C12: 8000                       or.b    D0, D0
043C14: 0001 0007                  ori.b   #$7, D1
043C18: 7800                       moveq   #$0, D4
043C1A: 12D8                       move.b  (A0)+, (A1)+
043C1C: 8000                       or.b    D0, D0
043C1E: 0000 0005                  ori.b   #$5, D0
043C22: 7800                       moveq   #$0, D4
043C24: 12D8                       move.b  (A0)+, (A1)+
043C26: 8000                       or.b    D0, D0
043C28: 0000 0002                  ori.b   #$2, D0
043C2C: 7800                       moveq   #$0, D4
043C2E: 12DC                       move.b  (A4)+, (A1)+
043C30: 8000                       or.b    D0, D0
043C32: 0001 0007                  ori.b   #$7, D1
043C36: 7800                       moveq   #$0, D4
043C38: 12D8                       move.b  (A0)+, (A1)+
043C3A: 8000                       or.b    D0, D0
043C3C: 0000 0005                  ori.b   #$5, D0
043C40: 7800                       moveq   #$0, D4
043C42: 12D8                       move.b  (A0)+, (A1)+
043C44: 8000                       or.b    D0, D0
043C46: 0000 0002                  ori.b   #$2, D0
043C4A: 7800                       moveq   #$0, D4
043C4C: 12DC                       move.b  (A4)+, (A1)+
043C4E: 8000                       or.b    D0, D0
043C50: 0001 0007                  ori.b   #$7, D1
043C54: 7800                       moveq   #$0, D4
043C56: 12D8                       move.b  (A0)+, (A1)+
043C58: 8000                       or.b    D0, D0
043C5A: 0000 008D                  ori.b   #$8d, D0
043C5E: 7800                       moveq   #$0, D4
043C60: FFF6                       dc.w    $fff6; opcode 1111
043C62: 12A0                       move.b  -(A0), (A1)
043C64: 8000                       or.b    D0, D0
043C66: 0000 0009                  ori.b   #$9, D0
043C6A: 7300                       dc.w    $7300; ILLEGAL
043C6C: 12A4                       move.b  -(A4), (A1)
043C6E: 8000                       or.b    D0, D0
043C70: 0000 048F                  ori.b   #$8f, D0
043C74: 7481                       moveq   #-$7f, D2
043C76: FFF6                       dc.w    $fff6; opcode 1111
043C78: 12B0 8000                  move.b  (A0,A0.w), (A1)
043C7C: 0000 000F                  ori.b   #$f, D0
043C80: 7500                       dc.w    $7500; ILLEGAL
043C82: 12B4 8000                  move.b  (A4,A0.w), (A1)
043C86: 0000 040F                  ori.b   #$f, D0
043C8A: 7682                       moveq   #-$7e, D3
043C8C: 12B8 8000                  move.b  $8000.w, (A1)
043C90: 0000 008C                  ori.b   #$8c, D0
043C94: 7700                       dc.w    $7700; ILLEGAL
043C96: FFF6                       dc.w    $fff6; opcode 1111
043C98: 1350 8000                  move.b  (A0), (-$8000,A1)
043C9C: 0000 0005                  ori.b   #$5, D0
043CA0: 7100                       dc.w    $7100; ILLEGAL
043CA2: 1354 8000                  move.b  (A4), (-$8000,A1)
043CA6: 0000 0005                  ori.b   #$5, D0
043CAA: 7100                       dc.w    $7100; ILLEGAL
043CAC: 1358 8000                  move.b  (A0)+, (-$8000,A1)
043CB0: 0000 0005                  ori.b   #$5, D0
043CB4: 7100                       dc.w    $7100; ILLEGAL
043CB6: 135C 8000                  move.b  (A4)+, (-$8000,A1)
043CBA: 0000 0085                  ori.b   #$85, D0
043CBE: 7100                       dc.w    $7100; ILLEGAL
043CC0: FCE0                       dc.w    $fce0; opcode 1111
043CC2: 1280                       move.b  D0, (A1)
043CC4: 8000                       or.b    D0, D0
043CC6: 0000 0005                  ori.b   #$5, D0
043CCA: 0000 1284                  ori.b   #$84, D0
043CCE: 8000                       or.b    D0, D0
043CD0: 0000 0007                  ori.b   #$7, D0
043CD4: 0000 1288                  ori.b   #$88, D0
043CD8: 8000                       or.b    D0, D0
043CDA: 0000 0009                  ori.b   #$9, D0
043CDE: 0000 12A0                  ori.b   #$a0, D0
043CE2: 8000                       or.b    D0, D0
043CE4: 0000 0005                  ori.b   #$5, D0
043CE8: 0000 12A4                  ori.b   #$a4, D0
043CEC: 8000                       or.b    D0, D0
043CEE: 0000 0087                  ori.b   #$87, D0
043CF2: 0000 FFF6                  ori.b   #$f6, D0
043CF6: 1250                       dc.w    $1250; ILLEGAL
043CF8: 8000                       or.b    D0, D0
043CFA: 0000 003C                  ori.b   #$3c, D0
043CFE: 0000 12A0                  ori.b   #$a0, D0
043D02: 8000                       or.b    D0, D0
043D04: 0000 0009                  ori.b   #$9, D0
043D08: 0000 12A4                  ori.b   #$a4, D0
043D0C: 8000                       or.b    D0, D0
043D0E: 0101                       btst    D0, D1
043D10: 000F                       dc.w    $000f; ILLEGAL
043D12: 0000 1250                  ori.b   #$50, D0
043D16: 8000                       or.b    D0, D0
043D18: 0000 000A                  ori.b   #$a, D0
043D1C: 0000 12A0                  ori.b   #$a0, D0
043D20: 8000                       or.b    D0, D0
043D22: 0000 0009                  ori.b   #$9, D0
043D26: 0000 12A4                  ori.b   #$a4, D0
043D2A: 8000                       or.b    D0, D0
043D2C: 0101                       btst    D0, D1
043D2E: 000F                       dc.w    $000f; ILLEGAL
043D30: 0000 1250                  ori.b   #$50, D0
043D34: 8000                       or.b    D0, D0
043D36: 0000 000A                  ori.b   #$a, D0
043D3A: 0000 12A0                  ori.b   #$a0, D0
043D3E: 8000                       or.b    D0, D0
043D40: 0000 0009                  ori.b   #$9, D0
043D44: 0000 12A4                  ori.b   #$a4, D0
043D48: 8000                       or.b    D0, D0
043D4A: 0101                       btst    D0, D1
043D4C: 000F                       dc.w    $000f; ILLEGAL
043D4E: 0000 1250                  ori.b   #$50, D0
043D52: 8000                       or.b    D0, D0
043D54: 0000 0087                  ori.b   #$87, D0
043D58: 0000 FFF6                  ori.b   #$f6, D0
043D5C: 1268                       dc.w    $1268; ILLEGAL
043D5E: 8000                       or.b    D0, D0
043D60: 0001 0001                  ori.b   #$1, D1
043D64: 0000 126C                  ori.b   #$6c, D0
043D68: 8000                       or.b    D0, D0
043D6A: 0000 00D0                  ori.b   #$d0, D0
043D6E: 0000 FFF6                  ori.b   #$f6, D0
043D72: 1268                       dc.w    $1268; ILLEGAL
043D74: 8000                       or.b    D0, D0
043D76: 0001 0001                  ori.b   #$1, D1
043D7A: 0000 126C                  ori.b   #$6c, D0
043D7E: 8000                       or.b    D0, D0
043D80: 0000 000A                  ori.b   #$a, D0
043D84: 0000 126C                  ori.b   #$6c, D0
043D88: 8000                       or.b    D0, D0
043D8A: 0000 0010                  ori.b   #$10, D0
043D8E: 6F00 12C8                  ble     $45058
043D92: 8000                       or.b    D0, D0
043D94: 0000 04D0                  ori.b   #$d0, D0
043D98: 7079                       moveq   #$79, D0
043D9A: FFF6                       dc.w    $fff6; opcode 1111
043D9C: 1250                       dc.w    $1250; ILLEGAL
043D9E: 8000                       or.b    D0, D0
043DA0: 0000 0004                  ori.b   #$4, D0
043DA4: 0000 1254                  ori.b   #$54, D0
043DA8: 8000                       or.b    D0, D0
043DAA: 0000 0004                  ori.b   #$4, D0
043DAE: 0000 1258                  ori.b   #$58, D0
043DB2: 8000                       or.b    D0, D0
043DB4: 0000 0004                  ori.b   #$4, D0
043DB8: 0000 125C                  ori.b   #$5c, D0
043DBC: 8000                       or.b    D0, D0
043DBE: 0000 0004                  ori.b   #$4, D0
043DC2: 0000 1260                  ori.b   #$60, D0
043DC6: 8000                       or.b    D0, D0
043DC8: 0000 0004                  ori.b   #$4, D0
043DCC: 0000 1264                  ori.b   #$64, D0
043DD0: 8000                       or.b    D0, D0
043DD2: 0000 0004                  ori.b   #$4, D0
043DD6: 0000 1250                  ori.b   #$50, D0
043DDA: 8000                       or.b    D0, D0
043DDC: 0000 0004                  ori.b   #$4, D0
043DE0: 0000 1254                  ori.b   #$54, D0
043DE4: 8000                       or.b    D0, D0
043DE6: 0000 0004                  ori.b   #$4, D0
043DEA: 0000 1258                  ori.b   #$58, D0
043DEE: 8000                       or.b    D0, D0
043DF0: 0000 0084                  ori.b   #$84, D0
043DF4: 0000 125C                  ori.b   #$5c, D0
043DF8: 8000                       or.b    D0, D0
043DFA: 0000 0004                  ori.b   #$4, D0
043DFE: 6D00 1260                  blt     $45060
043E02: 8000                       or.b    D0, D0
043E04: 0000 0004                  ori.b   #$4, D0
043E08: 6D00 1264                  blt     $4506e
043E0C: 8000                       or.b    D0, D0
043E0E: 0000 0004                  ori.b   #$4, D0
043E12: 6D00 1250                  blt     $45064
043E16: 8000                       or.b    D0, D0
043E18: 0000 0004                  ori.b   #$4, D0
043E1C: 6D00 1254                  blt     $45072
043E20: 8000                       or.b    D0, D0
043E22: 0000 0004                  ori.b   #$4, D0
043E26: 6D00 1258                  blt     $45080
043E2A: 8000                       or.b    D0, D0
043E2C: 0000 0084                  ori.b   #$84, D0
043E30: 6D00 FFC4                  blt     $43df6
043E34: 1268                       dc.w    $1268; ILLEGAL
043E36: 8000                       or.b    D0, D0
043E38: 0001 0001                  ori.b   #$1, D1
043E3C: 0000 126C                  ori.b   #$6c, D0
043E40: 8000                       or.b    D0, D0
043E42: 0000 0010                  ori.b   #$10, D0
043E46: 0000 126C                  ori.b   #$6c, D0
043E4A: 8000                       or.b    D0, D0
043E4C: 0000 00C6                  ori.b   #$c6, D0
043E50: 6F00 FFF6                  ble     $43e48
043E54: 0038 0044 0082             ori.b   #$44, $82.w
043E5A: 00A2 00AE 00D8             ori.l   #$ae00d8, -(A2)
043E60: 00F8                       dc.w    $00f8; ILLEGAL
043E62: 0136 0156                  btst    D0, INVALID 36
043E66: 0176 01A0                  bchg    D0, INVALID 36
043E6A: 01B6 01E0                  bclr    D0, INVALID 36
043E6E: 01EC 0202                  bset    D0, ($202,A4)
043E72: 0240 027E                  andi.w  #$27e, D0
043E76: 033E                       dc.w    $033e; ILLEGAL
043E78: 0354                       bchg    D1, (A4)
043E7A: 0374 0374                  bchg    D1, INVALID 34
043E7E: 0374 0096                  bchg    D1, (-$6a,A4,D0.w)
043E82: 039E                       bclr    D1, (A6)+
043E84: 039E                       bclr    D1, (A6)+
043E86: 03C8 0424                  movep.l D1, ($424,A0)
043E8A: 0000 1330                  ori.b   #$30, D0
043E8E: 8000                       or.b    D0, D0
043E90: 0000 0081                  ori.b   #$81, D0
043E94: 6D00 FFF6                  blt     $43e8c
043E98: 1330 8000                  move.b  (A0,A0.w), -(A1)
043E9C: 0000 0004                  ori.b   #$4, D0
043EA0: 6D00 1334                  blt     $451d6
043EA4: 8000                       or.b    D0, D0
043EA6: 0000 0004                  ori.b   #$4, D0
043EAA: 6D00 1338                  blt     $451e4
043EAE: 8000                       or.b    D0, D0
043EB0: 0000 0004                  ori.b   #$4, D0
043EB4: 6D00 133C                  blt     $451f2
043EB8: 8000                       or.b    D0, D0
043EBA: 0000 0004                  ori.b   #$4, D0
043EBE: 6D00 1340                  blt     $45200
043EC2: 8000                       or.b    D0, D0
043EC4: 0000 0004                  ori.b   #$4, D0
043EC8: 6D00 1344                  blt     $4520e
043ECC: 8000                       or.b    D0, D0
043ECE: 0000 0084                  ori.b   #$84, D0
043ED2: 6D00 FFC4                  blt     $43e98
043ED6: 1348                       dc.w    $1348; ILLEGAL
043ED8: 8000                       or.b    D0, D0
043EDA: 0001 0001                  ori.b   #$1, D1
043EDE: 0000 134C                  ori.b   #$4c, D0
043EE2: 8000                       or.b    D0, D0
043EE4: 0000 0004                  ori.b   #$4, D0
043EE8: 0000 134C                  ori.b   #$4c, D0
043EEC: 8000                       or.b    D0, D0
043EEE: 0000 00D0                  ori.b   #$d0, D0
043EF2: 6F00 FFF6                  ble     $43eea
043EF6: 1348                       dc.w    $1348; ILLEGAL
043EF8: 8000                       or.b    D0, D0
043EFA: 0000 0087                  ori.b   #$87, D0
043EFE: 6E00 FFF6                  bgt     $43ef6
043F02: 1350 8000                  move.b  (A0), (-$8000,A1)
043F06: 0000 0006                  ori.b   #$6, D0
043F0A: 7100                       dc.w    $7100; ILLEGAL
043F0C: 1354 8000                  move.b  (A4), (-$8000,A1)
043F10: 0000 0006                  ori.b   #$6, D0
043F14: 7100                       dc.w    $7100; ILLEGAL
043F16: 1358 8000                  move.b  (A0)+, (-$8000,A1)
043F1A: 0000 0006                  ori.b   #$6, D0
043F1E: 7100                       dc.w    $7100; ILLEGAL
043F20: 135C 8000                  move.b  (A4)+, (-$8000,A1)
043F24: 0000 0086                  ori.b   #$86, D0
043F28: 7100                       dc.w    $7100; ILLEGAL
043F2A: FFD8                       dc.w    $ffd8; opcode 1111
043F2C: 1360 8000                  move.b  -(A0), (-$8000,A1)
043F30: 0000 0007                  ori.b   #$7, D0
043F34: 6D00 1364                  blt     $4529a
043F38: 8000                       or.b    D0, D0
043F3A: 0000 0407                  ori.b   #$7, D0
043F3E: 6D00 1360                  blt     $452a0
043F42: 8000                       or.b    D0, D0
043F44: 0000 009E                  ori.b   #$9e, D0
043F48: 6D00 FFF6                  blt     $43f40
043F4C: 1368 8000 0000             move.b  (-$8000,A0), ($0,A1)
043F52: 0004 7200                  ori.b   #$0, D4
043F56: 136C 8000 0000             move.b  (-$8000,A4), ($0,A1)
043F5C: 0004 7200                  ori.b   #$0, D4
043F60: 1370 8000 0000             move.b  (A0,A0.w), ($0,A1)
043F66: 0004 7200                  ori.b   #$0, D4
043F6A: 1374 8000 0000             move.b  (A4,A0.w), ($0,A1)
043F70: 0004 7200                  ori.b   #$0, D4
043F74: 1378 8000 0000             move.b  $8000.w, ($0,A1)
043F7A: 0004 7200                  ori.b   #$0, D4
043F7E: 137C 8000 0000             move.b  #$0, ($0,A1)
043F84: 0084 7200 FFC4             ori.l   #$7200ffc4, D4
043F8A: 1380 8000                  move.b  D0, (A1,A0.w)
043F8E: 0000 0001                  ori.b   #$1, D0
043F92: 7300                       dc.w    $7300; ILLEGAL
043F94: 1384 8000                  move.b  D4, (A1,A0.w)
043F98: 0000 040E                  ori.b   #$e, D0
043F9C: 747A                       moveq   #$7a, D2
043F9E: 1380 8000                  move.b  D0, (A1,A0.w)
043FA2: 0000 0083                  ori.b   #$83, D0
043FA6: 7300                       dc.w    $7300; ILLEGAL
043FA8: FFF6                       dc.w    $fff6; opcode 1111
043FAA: 1388                       dc.w    $1388; ILLEGAL
043FAC: 8000                       or.b    D0, D0
043FAE: 0000 0007                  ori.b   #$7, D0
043FB2: 6D00 138C                  blt     $45340
043FB6: 8000                       or.b    D0, D0
043FB8: 0000 0007                  ori.b   #$7, D0
043FBC: 6D00 1388                  blt     $45346
043FC0: 8000                       or.b    D0, D0
043FC2: 0000 009E                  ori.b   #$9e, D0
043FC6: 6D00 FFF6                  blt     $43fbe
043FCA: 1390 8000                  move.b  (A0), (A1,A0.w)
043FCE: 0000 0007                  ori.b   #$7, D0
043FD2: 7500                       dc.w    $7500; ILLEGAL
043FD4: 1394 8000                  move.b  (A4), (A1,A0.w)
043FD8: 0000 040A                  ori.b   #$a, D0
043FDC: 767C                       moveq   #$7c, D3
043FDE: 1398 8000                  move.b  (A0)+, (A1,A0.w)
043FE2: 0000 0014                  ori.b   #$14, D0
043FE6: 7700                       dc.w    $7700; ILLEGAL
043FE8: 139C 8000                  move.b  (A4)+, (A1,A0.w)
043FEC: 0000 0084                  ori.b   #$84, D0
043FF0: 7500                       dc.w    $7500; ILLEGAL
043FF2: FFF6                       dc.w    $fff6; opcode 1111
043FF4: 13A0 8000                  move.b  -(A0), (A1,A0.w)
043FF8: 0000 0007                  ori.b   #$7, D0
043FFC: 7E00                       moveq   #$0, D7
043FFE: 13A4 8000                  move.b  -(A4), (A1,A0.w)
044002: 0000 048A                  ori.b   #$8a, D0
044006: 7F80                       dc.w    $7f80; ILLEGAL
044008: FFF6                       dc.w    $fff6; opcode 1111
04400A: 1348                       dc.w    $1348; ILLEGAL
04400C: 8000                       or.b    D0, D0
04400E: 0001 0001                  ori.b   #$1, D1
044012: 0000 134C                  ori.b   #$4c, D0
044016: 8000                       or.b    D0, D0
044018: 0000 0004                  ori.b   #$4, D0
04401C: 6F00 134C                  ble     $4536a
044020: 8000                       or.b    D0, D0
044022: 0000 0014                  ori.b   #$14, D0
044026: 6F00 13A8                  ble     $453d0
04402A: 8000                       or.b    D0, D0
04402C: 0000 04D0                  ori.b   #$d0, D0
044030: 7079                       moveq   #$79, D0
044032: FFF6                       dc.w    $fff6; opcode 1111
044034: 13AC 8000 0000             move.b  (-$8000,A4), (A1,D0.w)
04403A: 0099 7800 FFF6             ori.l   #$7800fff6, (A1)+
044040: 13B0 8000 0000             move.b  (A0,A0.w), (A1,D0.w)
044046: 0007 7800                  ori.b   #$0, D7
04404A: 13B4 8000 0000             move.b  (A4,A0.w), (A1,D0.w)
044050: 009E 7800 FFF6             ori.l   #$7800fff6, (A6)+
044056: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04405C: 0011 7800                  ori.b   #$0, (A1)
044060: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
044066: 0007 7800                  ori.b   #$0, D7
04406A: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
044070: 0011 7800                  ori.b   #$0, (A1)
044074: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04407A: 0007 7800                  ori.b   #$0, D7
04407E: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
044084: 0007 7800                  ori.b   #$0, D7
044088: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04408E: 0091 7800 FFF6             ori.l   #$7800fff6, (A1)
044094: 13B0 8000 0000             move.b  (A0,A0.w), (A1,D0.w)
04409A: 0005 7800                  ori.b   #$0, D5
04409E: 3324                       move.w  -(A4), -(A1)
0440A0: 8000                       or.b    D0, D0
0440A2: 0000 0005                  ori.b   #$5, D0
0440A6: 7800                       moveq   #$0, D4
0440A8: 3328 8000                  move.w  (-$8000,A0), -(A1)
0440AC: 0000 0005                  ori.b   #$5, D0
0440B0: 7800                       moveq   #$0, D4
0440B2: 332C 8000                  move.w  (-$8000,A4), -(A1)
0440B6: 0000 0005                  ori.b   #$5, D0
0440BA: 7800                       moveq   #$0, D4
0440BC: 3330 8000                  move.w  (A0,A0.w), -(A1)
0440C0: 0000 0005                  ori.b   #$5, D0
0440C4: 7800                       moveq   #$0, D4
0440C6: 3334 8000                  move.w  (A4,A0.w), -(A1)
0440CA: 0000 0085                  ori.b   #$85, D0
0440CE: 7800                       moveq   #$0, D4
0440D0: FFC4                       dc.w    $ffc4; opcode 1111
0440D2: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
0440D8: 000A                       dc.w    $000a; ILLEGAL
0440DA: 7800                       moveq   #$0, D4
0440DC: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
0440E2: 0007 7800                  ori.b   #$0, D7
0440E6: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
0440EC: 0007 7800                  ori.b   #$0, D7
0440F0: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
0440F6: 0005 7800                  ori.b   #$0, D5
0440FA: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
044100: 0002 7800                  ori.b   #$0, D2
044104: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
04410A: 0007 7800                  ori.b   #$0, D7
04410E: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
044114: 0005 7800                  ori.b   #$0, D5
044118: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04411E: 0002 7800                  ori.b   #$0, D2
044122: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
044128: 0007 7800                  ori.b   #$0, D7
04412C: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
044132: 000F                       dc.w    $000f; ILLEGAL
044134: 7800                       moveq   #$0, D4
044136: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04413C: 0009                       dc.w    $0009; ILLEGAL
04413E: 7800                       moveq   #$0, D4
044140: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
044146: 0007 7800                  ori.b   #$0, D7
04414A: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
044150: 0005 7800                  ori.b   #$0, D5
044154: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04415A: 0002 7800                  ori.b   #$0, D2
04415E: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
044164: 0007 7800                  ori.b   #$0, D7
044168: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04416E: 0005 7800                  ori.b   #$0, D5
044172: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
044178: 0002 7800                  ori.b   #$0, D2
04417C: 13BC 8000 0001             move.b  #$0, ($1,A1,D0.w)
044182: 0007 7800                  ori.b   #$0, D7
044186: 13B8 8000 0000             move.b  $8000.w, (A1,D0.w)
04418C: 008D                       dc.w    $008d; ILLEGAL
04418E: 7800                       moveq   #$0, D4
044190: FFF6                       dc.w    $fff6; opcode 1111
044192: 1380 8000                  move.b  D0, (A1,A0.w)
044196: 0000 0009                  ori.b   #$9, D0
04419A: 7300                       dc.w    $7300; ILLEGAL
04419C: 1384 8000                  move.b  D4, (A1,A0.w)
0441A0: 0000 048F                  ori.b   #$8f, D0
0441A4: 7481                       moveq   #-$7f, D2
0441A6: FFF6                       dc.w    $fff6; opcode 1111
0441A8: 1390 8000                  move.b  (A0), (A1,A0.w)
0441AC: 0000 000F                  ori.b   #$f, D0
0441B0: 7500                       dc.w    $7500; ILLEGAL
0441B2: 1394 8000                  move.b  (A4), (A1,A0.w)
0441B6: 0000 040F                  ori.b   #$f, D0
0441BA: 7682                       moveq   #-$7e, D3
0441BC: 1398 8000                  move.b  (A0)+, (A1,A0.w)
0441C0: 0000 008C                  ori.b   #$8c, D0
0441C4: 7700                       dc.w    $7700; ILLEGAL
0441C6: FFF6                       dc.w    $fff6; opcode 1111
0441C8: 1350 8000                  move.b  (A0), (-$8000,A1)
0441CC: 0000 0006                  ori.b   #$6, D0
0441D0: 7100                       dc.w    $7100; ILLEGAL
0441D2: 1354 8000                  move.b  (A4), (-$8000,A1)
0441D6: 0000 0006                  ori.b   #$6, D0
0441DA: 7100                       dc.w    $7100; ILLEGAL
0441DC: 1358 8000                  move.b  (A0)+, (-$8000,A1)
0441E0: 0000 0006                  ori.b   #$6, D0
0441E4: 7100                       dc.w    $7100; ILLEGAL
0441E6: 135C 8000                  move.b  (A4)+, (-$8000,A1)
0441EA: 0000 0086                  ori.b   #$86, D0
0441EE: 7100                       dc.w    $7100; ILLEGAL
0441F0: FD12                       dc.w    $fd12; opcode 1111
0441F2: 1348                       dc.w    $1348; ILLEGAL
0441F4: 8000                       or.b    D0, D0
0441F6: 0001 0001                  ori.b   #$1, D1
0441FA: 0000 134C                  ori.b   #$4c, D0
0441FE: 8000                       or.b    D0, D0
044200: 0000 000A                  ori.b   #$a, D0
044204: 0000 134C                  ori.b   #$4c, D0
044208: 8000                       or.b    D0, D0
04420A: 0000 0010                  ori.b   #$10, D0
04420E: 6F00 13A8                  ble     $455b8
044212: 8000                       or.b    D0, D0
044214: 0000 04D0                  ori.b   #$d0, D0
044218: 7079                       moveq   #$79, D0
04421A: FFF6                       dc.w    $fff6; opcode 1111
04421C: 1330 8000                  move.b  (A0,A0.w), -(A1)
044220: 0000 0004                  ori.b   #$4, D0
044224: 0000 1334                  ori.b   #$34, D0
044228: 8000                       or.b    D0, D0
04422A: 0000 0004                  ori.b   #$4, D0
04422E: 0000 1338                  ori.b   #$38, D0
044232: 8000                       or.b    D0, D0
044234: 0000 0004                  ori.b   #$4, D0
044238: 0000 133C                  ori.b   #$3c, D0
04423C: 8000                       or.b    D0, D0
04423E: 0000 0004                  ori.b   #$4, D0
044242: 6D00 1340                  blt     $45584
044246: 8000                       or.b    D0, D0
044248: 0000 0004                  ori.b   #$4, D0
04424C: 6D00 1344                  blt     $45592
044250: 8000                       or.b    D0, D0
044252: 0000 0004                  ori.b   #$4, D0
044256: 6D00 1330                  blt     $45588
04425A: 8000                       or.b    D0, D0
04425C: 0000 0004                  ori.b   #$4, D0
044260: 6D00 1334                  blt     $45596
044264: 8000                       or.b    D0, D0
044266: 0000 0004                  ori.b   #$4, D0
04426A: 6D00 1338                  blt     $455a4
04426E: 8000                       or.b    D0, D0
044270: 0000 0084                  ori.b   #$84, D0
044274: 6D00 FFC4                  blt     $4423a
044278: 1348                       dc.w    $1348; ILLEGAL
04427A: 8000                       or.b    D0, D0
04427C: 0001 0001                  ori.b   #$1, D1
044280: 0000 134C                  ori.b   #$4c, D0
044284: 8000                       or.b    D0, D0
044286: 0000 0010                  ori.b   #$10, D0
04428A: 0000 134C                  ori.b   #$4c, D0
04428E: 8000                       or.b    D0, D0
044290: 0000 00C6                  ori.b   #$c6, D0
044294: 6F00 FFF6                  ble     $4428c
044298: 41EE 00A2                  lea     ($a2,A6), A0
04429C: 4258                       clr.w   (A0)+
04429E: 4258                       clr.w   (A0)+
0442A0: 4258                       clr.w   (A0)+
0442A2: 422E 00A0                  clr.b   ($a0,A6)
0442A6: 4EB9 0000 119C             jsr     $119c.l
0442AC: 0240 000F                  andi.w  #$f, D0
0442B0: 6100 0164                  bsr     $44416
0442B4: D241                       add.w   D1, D1
0442B6: 323B 1028                  move.w  ($28,PC,D1.w), D1
0442BA: D041                       add.w   D1, D0
0442BC: 103B 0022                  move.b  ($22,PC,D0.w), D0
0442C0: D02E 00A0                  add.b   ($a0,A6), D0
0442C4: 0C00 0002                  cmpi.b  #$2, D0
0442C8: 6F02                       ble     $442cc
0442CA: 4200                       clr.b   D0
0442CC: 1D40 00A0                  move.b  D0, ($a0,A6)
0442D0: D040                       add.w   D0, D0
0442D2: 41EE 00A2                  lea     ($a2,A6), A0
0442D6: 3070 0000                  movea.w (A0,D0.w), A0
0442DA: 3D48 0076                  move.w  A0, ($76,A6)
0442DE: 4E75                       rts
0442E0: 0006 0016                  ori.b   #$16, D6
0442E4: 0026 0000                  ori.b   #$0, -(A6)
0442E8: 0000 0000                  ori.b   #$0, D0
0442EC: 0000 0000                  ori.b   #$0, D0
0442F0: 0000 0000                  ori.b   #$0, D0
0442F4: 0000 0100                  ori.b   #$0, D0
0442F8: 0001 0001                  ori.b   #$1, D1
0442FC: 0001 0000                  ori.b   #$0, D1
044300: 0101                       btst    D0, D1
044302: 0100                       btst    D0, D0
044304: 0100                       btst    D0, D0
044306: 0001 0100                  ori.b   #$0, D1
04430A: 0200 0202                  andi.b  #$2, D0
04430E: 0100                       btst    D0, D0
044310: 0001 0202                  ori.b   #$2, D1
044314: 0100                       btst    D0, D0
044316: 306E 0076                  movea.w ($76,A6), A0
04431A: 0C28 0023 00C8             cmpi.b  #$23, ($c8,A0)
044320: 6700 0084                  beq     $443a6
044324: 4EB9 0000 119C             jsr     $119c.l
04432A: 0240 000F                  andi.w  #$f, D0
04432E: 6100 00E6                  bsr     $44416
044332: 3801                       move.w  D1, D4
044334: D241                       add.w   D1, D1
044336: 323B 1038                  move.w  ($38,PC,D1.w), D1
04433A: D041                       add.w   D1, D0
04433C: 103B 0032                  move.b  ($32,PC,D0.w), D0
044340: D02E 00A0                  add.b   ($a0,A6), D0
044344: B044                       cmp.w   D4, D0
044346: 6F04                       ble     $4434c
044348: 5244                       addq.w  #1, D4
04434A: 9044                       sub.w   D4, D0
04434C: 1D40 00A0                  move.b  D0, ($a0,A6)
044350: D040                       add.w   D0, D0
044352: 0C40 0004                  cmpi.w  #$4, D0
044356: 6F02                       ble     $4435a
044358: 4240                       clr.w   D0
04435A: 41EE 00A2                  lea     ($a2,A6), A0
04435E: 3070 0000                  movea.w (A0,D0.w), A0
044362: 3208                       move.w  A0, D1
044364: 6604                       bne     $4436a
044366: 5440                       addq.w  #2, D0
044368: 60E8                       bra     $44352
04436A: 3D48 0076                  move.w  A0, ($76,A6)
04436E: 4E75                       rts
044370: 0006 0016                  ori.b   #$16, D6
044374: 0026 0000                  ori.b   #$0, -(A6)
044378: 0000 0000                  ori.b   #$0, D0
04437C: 0000 0000                  ori.b   #$0, D0
044380: 0000 0000                  ori.b   #$0, D0
044384: 0000 0000                  ori.b   #$0, D0
044388: 0101                       btst    D0, D1
04438A: 0000 0001                  ori.b   #$1, D0
04438E: 0000 0100                  ori.b   #$0, D0
044392: 0101                       btst    D0, D1
044394: 0000 0002                  ori.b   #$2, D0
044398: 0201 0102                  andi.b  #$2, D1
04439C: 0001 0201                  ori.b   #$1, D1
0443A0: 0002 0201                  ori.b   #$1, D2
0443A4: 0001 6100                  ori.b   #$0, D1
0443A8: 006E 4A41 660C             ori.w   #$4a41, ($660c,A6)
0443AE: 3D6E 00A2 0076             move.w  ($a2,A6), ($76,A6)
0443B4: 422E 00A0                  clr.b   ($a0,A6)
0443B8: 4E75                       rts
0443BA: 0C41 0001                  cmpi.w  #$1, D1
0443BE: 6620                       bne     $443e0
0443C0: 7000                       moveq   #$0, D0
0443C2: 102E 00A0                  move.b  ($a0,A6), D0
0443C6: 5200                       addq.b  #1, D0
0443C8: 0200 0001                  andi.b  #$1, D0
0443CC: 1400                       move.b  D0, D2
0443CE: D000                       add.b   D0, D0
0443D0: 41EE 00A2                  lea     ($a2,A6), A0
0443D4: 3D70 0000 0076             move.w  (A0,D0.w), ($76,A6)
0443DA: 1D42 00A0                  move.b  D2, ($a0,A6)
0443DE: 4E75                       rts
0443E0: 4EB9 0000 119C             jsr     $119c.l
0443E6: 0240 000F                  andi.w  #$f, D0
0443EA: 7400                       moveq   #$0, D2
0443EC: 142E 00A0                  move.b  ($a0,A6), D2
0443F0: 0800 0003                  btst    #$3, D0
0443F4: 6604                       bne     $443fa
0443F6: 5202                       addq.b  #1, D2
0443F8: 6002                       bra     $443fc
0443FA: 5402                       addq.b  #2, D2
0443FC: 0C02 0002                  cmpi.b  #$2, D2
044400: 6F02                       ble     $44404
044402: 5702                       subq.b  #3, D2
044404: 1D42 00A0                  move.b  D2, ($a0,A6)
044408: D402                       add.b   D2, D2
04440A: 41EE 00A2                  lea     ($a2,A6), A0
04440E: 3D70 2000 0076             move.w  (A0,D2.w), ($76,A6)
044414: 4E75                       rts
044416: 7200                       moveq   #$0, D1
044418: 7400                       moveq   #$0, D2
04441A: 43EE 00A2                  lea     ($a2,A6), A1
04441E: 45EE 00A6                  lea     ($a6,A6), A2
044422: 41ED 3274                  lea     ($3274,A5), A0
044426: 4A28 0000                  tst.b   ($0,A0)
04442A: 6708                       beq     $44434
04442C: 5241                       addq.w  #1, D1
04442E: 08C2 0000                  bset    #$0, D2
044432: 32C8                       move.w  A0, (A1)+
044434: 41ED 33F4                  lea     ($33f4,A5), A0
044438: 4A28 0000                  tst.b   ($0,A0)
04443C: 6708                       beq     $44446
04443E: 5241                       addq.w  #1, D1
044440: 08C2 0001                  bset    #$1, D2
044444: 32C8                       move.w  A0, (A1)+
044446: 41ED 3574                  lea     ($3574,A5), A0
04444A: 4A28 0000                  tst.b   ($0,A0)
04444E: 6708                       beq     $44458
044450: 5241                       addq.w  #1, D1
044452: 08C2 0002                  bset    #$2, D2
044456: 32C8                       move.w  A0, (A1)+
044458: 5341                       subq.w  #1, D1
04445A: 6A04                       bpl     $44460
04445C: 7200                       moveq   #$0, D1
04445E: 5449                       addq.w  #2, A1
044460: B2CA                       cmpa.w  A2, A1
044462: 6E04                       bgt     $44468
044464: 4259                       clr.w   (A1)+
044466: 60F8                       bra     $44460
044468: 4A6E 00A2                  tst.w   ($a2,A6)
04446C: 6608                       bne     $44476
04446E: 41ED 3274                  lea     ($3274,A5), A0
044472: 3D48 00A2                  move.w  A0, ($a2,A6)
044476: 4E75                       rts
044478: 306E 0076                  movea.w ($76,A6), A0
04447C: 4A2E 0026                  tst.b   ($26,A6)
044480: 6700 005E                  beq     $444e0
044484: 7200                       moveq   #$0, D1
044486: 302E 0008                  move.w  ($8,A6), D0
04448A: 9068 0008                  sub.w   ($8,A0), D0
04448E: 6502                       bcs     $44492
044490: 7208                       moveq   #$8, D1
044492: 4EB9 0000 119C             jsr     $119c.l
044498: 0240 000F                  andi.w  #$f, D0
04449C: 0C40 000B                  cmpi.w  #$b, D0
0444A0: 6D06                       blt     $444a8
0444A2: 5041                       addq.w  #8, D1
0444A4: 0241 000F                  andi.w  #$f, D1
0444A8: 4EB9 0000 119C             jsr     $119c.l
0444AE: 0240 001F                  andi.w  #$1f, D0
0444B2: 103B 000C                  move.b  ($c,PC,D0.w), D0
0444B6: D240                       add.w   D0, D1
0444B8: 1D41 007C                  move.b  D1, ($7c,A6)
0444BC: 6000 02D4                  bra     $44792
0444C0: 0500                       btst    D2, D0
0444C2: 0705                       btst    D3, D5
0444C4: 0003 0203                  ori.b   #$3, D3
0444C8: 0704                       btst    D3, D4
0444CA: 0106                       btst    D0, D6
0444CC: 0401 0504                  subi.b  #$4, D1
0444D0: 0605 0700                  addi.b  #$0, D5
0444D4: 0306                       btst    D1, D6
0444D6: 0201 0001                  andi.b  #$1, D1
0444DA: 0302                       btst    D1, D2
0444DC: 0402 0706                  subi.b  #$6, D2
0444E0: 1D7C 0004 007C             move.b  #$4, ($7c,A6)
0444E6: 4E75                       rts
0444E8: 306E 0076                  movea.w ($76,A6), A0
0444EC: 7200                       moveq   #$0, D1
0444EE: 4A2E 0026                  tst.b   ($26,A6)
0444F2: 6700 0058                  beq     $4454c
0444F6: 302E 0008                  move.w  ($8,A6), D0
0444FA: 9068 0008                  sub.w   ($8,A0), D0
0444FE: 6502                       bcs     $44502
044500: 7208                       moveq   #$8, D1
044502: 4EB9 0000 119C             jsr     $119c.l
044508: 0240 000F                  andi.w  #$f, D0
04450C: 0C40 000B                  cmpi.w  #$b, D0
044510: 6D06                       blt     $44518
044512: 5041                       addq.w  #8, D1
044514: 0241 000F                  andi.w  #$f, D1
044518: 4EB9 0000 119C             jsr     $119c.l
04451E: 0240 001F                  andi.w  #$1f, D0
044522: 7400                       moveq   #$0, D2
044524: 142E 007C                  move.b  ($7c,A6), D2
044528: 0242 0007                  andi.w  #$7, D2
04452C: EB4A                       lsl.w   #5, D2
04452E: 4EB9 0000 119C             jsr     $119c.l
044534: 0240 001F                  andi.w  #$1f, D0
044538: D440                       add.w   D0, D2
04453A: 103B 2036                  move.b  ($36,PC,D2.w), D0
04453E: D001                       add.b   D1, D0
044540: 0200 000F                  andi.b  #$f, D0
044544: 1D40 007C                  move.b  D0, ($7c,A6)
044548: 6000 0248                  bra     $44792
04454C: 7200                       moveq   #$0, D1
04454E: 122E 007C                  move.b  ($7c,A6), D1
044552: 3401                       move.w  D1, D2
044554: EB49                       lsl.w   #5, D1
044556: 4EB9 0000 119C             jsr     $119c.l
04455C: 0240 001F                  andi.w  #$1f, D0
044560: D240                       add.w   D0, D1
044562: 43FA 010E                  lea     ($10e,PC), A1; ($44672)
044566: 1031 1000                  move.b  (A1,D1.w), D0
04456A: D002                       add.b   D2, D0
04456C: 1D40 007C                  move.b  D0, ($7c,A6)
044570: 4E75                       rts
044572: 0101                       btst    D0, D1
044574: 0101                       btst    D0, D1
044576: 0101                       btst    D0, D1
044578: 0101                       btst    D0, D1
04457A: 0202 0202                  andi.b  #$2, D2
04457E: 0202 0202                  andi.b  #$2, D2
044582: 0303                       btst    D1, D3
044584: 0303                       btst    D1, D3
044586: 0404 0404                  subi.b  #$4, D4
04458A: 0505                       btst    D2, D5
04458C: 0505                       btst    D2, D5
04458E: 0606 0707                  addi.b  #$7, D6
044592: 0000 0000                  ori.b   #$0, D0
044596: 0000 0202                  ori.b   #$2, D0
04459A: 0202 0202                  andi.b  #$2, D2
04459E: 0303                       btst    D1, D3
0445A0: 0303                       btst    D1, D3
0445A2: 0303                       btst    D1, D3
0445A4: 0404 0404                  subi.b  #$4, D4
0445A8: 0404 0505                  subi.b  #$5, D4
0445AC: 0505                       btst    D2, D5
0445AE: 0707                       btst    D3, D7
0445B0: 0707                       btst    D3, D7
0445B2: 0000 0000                  ori.b   #$0, D0
0445B6: 0000 0101                  ori.b   #$1, D0
0445BA: 0101                       btst    D0, D1
0445BC: 0101                       btst    D0, D1
0445BE: 0404 0404                  subi.b  #$4, D4
0445C2: 0404 0505                  subi.b  #$5, D4
0445C6: 0505                       btst    D2, D5
0445C8: 0505                       btst    D2, D5
0445CA: 0303                       btst    D1, D3
0445CC: 0303                       btst    D1, D3
0445CE: 0707                       btst    D3, D7
0445D0: 0707                       btst    D3, D7
0445D2: 0000 0000                  ori.b   #$0, D0
0445D6: 0000 0000                  ori.b   #$0, D0
0445DA: 0101                       btst    D0, D1
0445DC: 0101                       btst    D0, D1
0445DE: 0101                       btst    D0, D1
0445E0: 0101                       btst    D0, D1
0445E2: 0202 0202                  andi.b  #$2, D2
0445E6: 0202 0202                  andi.b  #$2, D2
0445EA: 0404 0404                  subi.b  #$4, D4
0445EE: 0505                       btst    D2, D5
0445F0: 0505                       btst    D2, D5
0445F2: 0606 0606                  addi.b  #$6, D6
0445F6: 0606 0606                  addi.b  #$6, D6
0445FA: 0606 0606                  addi.b  #$6, D6
0445FE: 0606 0606                  addi.b  #$6, D6
044602: 0707                       btst    D3, D7
044604: 0707                       btst    D3, D7
044606: 0707                       btst    D3, D7
044608: 0707                       btst    D3, D7
04460A: 0707                       btst    D3, D7
04460C: 0707                       btst    D3, D7
04460E: 0707                       btst    D3, D7
044610: 0707                       btst    D3, D7
044612: 0000 0000                  ori.b   #$0, D0
044616: 0000 0000                  ori.b   #$0, D0
04461A: 0101                       btst    D0, D1
04461C: 0101                       btst    D0, D1
04461E: 0101                       btst    D0, D1
044620: 0101                       btst    D0, D1
044622: 0202 0202                  andi.b  #$2, D2
044626: 0202 0202                  andi.b  #$2, D2
04462A: 0303                       btst    D1, D3
04462C: 0303                       btst    D1, D3
04462E: 0404 0404                  subi.b  #$4, D4
044632: 0000 0000                  ori.b   #$0, D0
044636: 0101                       btst    D0, D1
044638: 0101                       btst    D0, D1
04463A: 0202 0202                  andi.b  #$2, D2
04463E: 0303                       btst    D1, D3
044640: 0303                       btst    D1, D3
044642: 0404 0404                  subi.b  #$4, D4
044646: 0505                       btst    D2, D5
044648: 0505                       btst    D2, D5
04464A: 0707                       btst    D3, D7
04464C: 0707                       btst    D3, D7
04464E: 0707                       btst    D3, D7
044650: 0707                       btst    D3, D7
044652: 0000 0000                  ori.b   #$0, D0
044656: 0101                       btst    D0, D1
044658: 0101                       btst    D0, D1
04465A: 0202 0202                  andi.b  #$2, D2
04465E: 0303                       btst    D1, D3
044660: 0303                       btst    D1, D3
044662: 0404 0404                  subi.b  #$4, D4
044666: 0505                       btst    D2, D5
044668: 0505                       btst    D2, D5
04466A: 0606 0606                  addi.b  #$6, D6
04466E: 0606 0606                  addi.b  #$6, D6
044672: 0707                       btst    D3, D7
044674: 0707                       btst    D3, D7
044676: 0707                       btst    D3, D7
044678: 0707                       btst    D3, D7
04467A: 0505                       btst    D2, D5
04467C: 0505                       btst    D2, D5
04467E: 0505                       btst    D2, D5
044680: 0505                       btst    D2, D5
044682: 0606 0606                  addi.b  #$6, D6
044686: 0606 0606                  addi.b  #$6, D6
04468A: 0707                       btst    D3, D7
04468C: 0707                       btst    D3, D7
04468E: 0707                       btst    D3, D7
044690: 0707                       btst    D3, D7
044692: 0303                       btst    D1, D3
044694: 0303                       btst    D1, D3
044696: 0303                       btst    D1, D3
044698: 0303                       btst    D1, D3
04469A: 0404 0404                  subi.b  #$4, D4
04469E: 0404 0404                  subi.b  #$4, D4
0446A2: 0505                       btst    D2, D5
0446A4: 0505                       btst    D2, D5
0446A6: 0505                       btst    D2, D5
0446A8: 0505                       btst    D2, D5
0446AA: 0707                       btst    D3, D7
0446AC: 0707                       btst    D3, D7
0446AE: 0707                       btst    D3, D7
0446B0: 0707                       btst    D3, D7
0446B2: 0101                       btst    D0, D1
0446B4: 0101                       btst    D0, D1
0446B6: 0101                       btst    D0, D1
0446B8: 0101                       btst    D0, D1
0446BA: 0202 0202                  andi.b  #$2, D2
0446BE: 0202 0202                  andi.b  #$2, D2
0446C2: 0303                       btst    D1, D3
0446C4: 0303                       btst    D1, D3
0446C6: 0303                       btst    D1, D3
0446C8: 0303                       btst    D1, D3
0446CA: 0101                       btst    D0, D1
0446CC: 0101                       btst    D0, D1
0446CE: 0101                       btst    D0, D1
0446D0: 0101                       btst    D0, D1
0446D2: FEFE                       dc.w    $fefe; opcode 1111
0446D4: FEFE                       dc.w    $fefe; opcode 1111
0446D6: FEFE                       dc.w    $fefe; opcode 1111
0446D8: FEFE                       dc.w    $fefe; opcode 1111
0446DA: FFFF                       dc.w    $ffff; opcode 1111
0446DC: FFFF                       dc.w    $ffff; opcode 1111
0446DE: FFFF                       dc.w    $ffff; opcode 1111
0446E0: FFFF                       dc.w    $ffff; opcode 1111
0446E2: 0101                       btst    D0, D1
0446E4: 0101                       btst    D0, D1
0446E6: 0101                       btst    D0, D1
0446E8: 0101                       btst    D0, D1
0446EA: 0202 0202                  andi.b  #$2, D2
0446EE: 0202 0202                  andi.b  #$2, D2
0446F2: FEFE                       dc.w    $fefe; opcode 1111
0446F4: FEFE                       dc.w    $fefe; opcode 1111
0446F6: FEFE                       dc.w    $fefe; opcode 1111
0446F8: FEFE                       dc.w    $fefe; opcode 1111
0446FA: FDFD                       dc.w    $fdfd; opcode 1111
0446FC: FDFD                       dc.w    $fdfd; opcode 1111
0446FE: FDFD                       dc.w    $fdfd; opcode 1111
044700: FDFD                       dc.w    $fdfd; opcode 1111
044702: FEFE                       dc.w    $fefe; opcode 1111
044704: FEFE                       dc.w    $fefe; opcode 1111
044706: FEFE                       dc.w    $fefe; opcode 1111
044708: FEFE                       dc.w    $fefe; opcode 1111
04470A: FFFF                       dc.w    $ffff; opcode 1111
04470C: FFFF                       dc.w    $ffff; opcode 1111
04470E: FFFF                       dc.w    $ffff; opcode 1111
044710: FFFF                       dc.w    $ffff; opcode 1111
044712: FBFB                       dc.w    $fbfb; opcode 1111
044714: FBFB                       dc.w    $fbfb; opcode 1111
044716: FBFB                       dc.w    $fbfb; opcode 1111
044718: FBFB                       dc.w    $fbfb; opcode 1111
04471A: FCFC                       dc.w    $fcfc; opcode 1111
04471C: FCFC                       dc.w    $fcfc; opcode 1111
04471E: FCFC                       dc.w    $fcfc; opcode 1111
044720: FCFC                       dc.w    $fcfc; opcode 1111
044722: FDFD                       dc.w    $fdfd; opcode 1111
044724: FDFD                       dc.w    $fdfd; opcode 1111
044726: FDFD                       dc.w    $fdfd; opcode 1111
044728: FDFD                       dc.w    $fdfd; opcode 1111
04472A: 0303                       btst    D1, D3
04472C: 0303                       btst    D1, D3
04472E: 0303                       btst    D1, D3
044730: 0303                       btst    D1, D3
044732: FAFA                       dc.w    $fafa; opcode 1111
044734: FAFA                       dc.w    $fafa; opcode 1111
044736: FAFA                       dc.w    $fafa; opcode 1111
044738: FAFA                       dc.w    $fafa; opcode 1111
04473A: FBFB                       dc.w    $fbfb; opcode 1111
04473C: FBFB                       dc.w    $fbfb; opcode 1111
04473E: FBFB                       dc.w    $fbfb; opcode 1111
044740: FBFB                       dc.w    $fbfb; opcode 1111
044742: FAFA                       dc.w    $fafa; opcode 1111
044744: FAFA                       dc.w    $fafa; opcode 1111
044746: FAFA                       dc.w    $fafa; opcode 1111
044748: FAFA                       dc.w    $fafa; opcode 1111
04474A: 0101                       btst    D0, D1
04474C: 0101                       btst    D0, D1
04474E: 0101                       btst    D0, D1
044750: 0101                       btst    D0, D1
044752: F9F9                       dc.w    $f9f9; opcode 1111
044754: F9F9                       dc.w    $f9f9; opcode 1111
044756: F9F9                       dc.w    $f9f9; opcode 1111
044758: F9F9                       dc.w    $f9f9; opcode 1111
04475A: FAFA                       dc.w    $fafa; opcode 1111
04475C: FAFA                       dc.w    $fafa; opcode 1111
04475E: FAFA                       dc.w    $fafa; opcode 1111
044760: FAFA                       dc.w    $fafa; opcode 1111
044762: FEFE                       dc.w    $fefe; opcode 1111
044764: FEFE                       dc.w    $fefe; opcode 1111
044766: FEFE                       dc.w    $fefe; opcode 1111
044768: FEFE                       dc.w    $fefe; opcode 1111
04476A: FFFF                       dc.w    $ffff; opcode 1111
04476C: FFFF                       dc.w    $ffff; opcode 1111
04476E: FFFF                       dc.w    $ffff; opcode 1111
044770: FFFF                       dc.w    $ffff; opcode 1111
044772: FDFD                       dc.w    $fdfd; opcode 1111
044774: FDFD                       dc.w    $fdfd; opcode 1111
044776: FEFE                       dc.w    $fefe; opcode 1111
044778: FEFE                       dc.w    $fefe; opcode 1111
04477A: FDFD                       dc.w    $fdfd; opcode 1111
04477C: FDFD                       dc.w    $fdfd; opcode 1111
04477E: FCFC                       dc.w    $fcfc; opcode 1111
044780: FCFC                       dc.w    $fcfc; opcode 1111
044782: F9F9                       dc.w    $f9f9; opcode 1111
044784: F9F9                       dc.w    $f9f9; opcode 1111
044786: FAFA                       dc.w    $fafa; opcode 1111
044788: FAFA                       dc.w    $fafa; opcode 1111
04478A: F9F9                       dc.w    $f9f9; opcode 1111
04478C: F9F9                       dc.w    $f9f9; opcode 1111
04478E: F8F8                       dc.w    $f8f8; opcode 1111
044790: F8F8                       dc.w    $f8f8; opcode 1111
044792: 7200                       moveq   #$0, D1
044794: 122E 007C                  move.b  ($7c,A6), D1
044798: D241                       add.w   D1, D1
04479A: 41FA 0076                  lea     ($76,PC), A0; ($44812)
04479E: 3230 1000                  move.w  (A0,D1.w), D1
0447A2: 306E 0076                  movea.w ($76,A6), A0
0447A6: D268 0008                  add.w   ($8,A0), D1
0447AA: 302D 0744                  move.w  ($744,A5), D0
0447AE: 0640 00C0                  addi.w  #$c0, D0
0447B2: 9041                       sub.w   D1, D0
0447B4: 0640 00A0                  addi.w  #$a0, D0
0447B8: 0C40 0140                  cmpi.w  #$140, D0
0447BC: 650E                       bcs     $447cc
0447BE: 102E 007C                  move.b  ($7c,A6), D0
0447C2: 5000                       addq.b  #8, D0
0447C4: 0200 000F                  andi.b  #$f, D0
0447C8: 1D40 007C                  move.b  D0, ($7c,A6)
0447CC: 4E75                       rts
0447CE: 7200                       moveq   #$0, D1
0447D0: 122E 007C                  move.b  ($7c,A6), D1
0447D4: 306E 0076                  movea.w ($76,A6), A0
0447D8: 4A2E 0026                  tst.b   ($26,A6)
0447DC: 6700 0074                  beq     $44852
0447E0: D241                       add.w   D1, D1
0447E2: D241                       add.w   D1, D1
0447E4: 43FB 102C                  lea     ($2c,PC,D1.w), A1
0447E8: 3219                       move.w  (A1)+, D1
0447EA: 3419                       move.w  (A1)+, D2
0447EC: D268 0008                  add.w   ($8,A0), D1
0447F0: 3D41 0088                  move.w  D1, ($88,A6)
0447F4: D468 0010                  add.w   ($10,A0), D2
0447F8: 3D42 008A                  move.w  D2, ($8a,A6)
0447FC: 4A2E 00B5                  tst.b   ($b5,A6)
044800: 6608                       bne     $4480a
044802: 6100 0190                  bsr     $44994
044806: 6000 04C4                  bra     $44ccc
04480A: 6100 01BA                  bsr     $449c6
04480E: 6000 04D4                  bra     $44ce4
044812: FF50                       dc.w    $ff50; opcode 1111
044814: 0000 FF60                  ori.b   #$60, D0
044818: 0018 FF60                  ori.b   #$60, (A0)+
04481C: FFE8                       dc.w    $ffe8; opcode 1111
04481E: FF70                       dc.w    $ff70; opcode 1111
044820: 0024 FF70                  ori.b   #$70, -(A4)
044824: 0000 FF70                  ori.b   #$70, D0
044828: FFDC                       dc.w    $ffdc; opcode 1111
04482A: FF80                       dc.w    $ff80; opcode 1111
04482C: 0018 FF80                  ori.b   #$80, (A0)+
044830: FFE8                       dc.w    $ffe8; opcode 1111
044832: 00B0 0000 00A0 0018        ori.l   #$a0, ($18,A0,D0.w)
04483A: 00A0 FFE8 0090             ori.l   #$ffe80090, -(A0)
044840: 0024 0090                  ori.b   #$90, -(A4)
044844: 0000 0090                  ori.b   #$90, D0
044848: FFDC                       dc.w    $ffdc; opcode 1111
04484A: 0080 0018 0080             ori.l   #$180080, D0
044850: FFE8                       dc.w    $ffe8; opcode 1111
044852: D241                       add.w   D1, D1
044854: D241                       add.w   D1, D1
044856: 43FB 1010                  lea     ($10,PC,D1.w), A1
04485A: 3219                       move.w  (A1)+, D1
04485C: 3419                       move.w  (A1)+, D2
04485E: 3D41 0088                  move.w  D1, ($88,A6)
044862: 3D42 008A                  move.w  D2, ($8a,A6)
044866: 6094                       bra     $447fc
044868: 0202 0138                  andi.b  #$38, D2
04486C: 028A                       dc.w    $028a; ILLEGAL
04486E: 0138 0322                  btst    D0, $322.w
044872: 0138 0320                  btst    D0, $320.w
044876: 0128 031E                  btst    D0, ($31e,A0)
04487A: 0118                       btst    D0, (A0)+
04487C: 0286 0118 01FE             andi.l  #$11801fe, D6
044882: 0118                       btst    D0, (A0)+
044884: 0200 0128                  andi.b  #$28, D0
044888: 0288                       dc.w    $0288; ILLEGAL
04488A: 0128 4A2E                  btst    D0, ($4a2e,A0)
04488E: 0026 6600                  ori.b   #$0, -(A6)
044892: 002E 7600 7A08             ori.b   #$0, ($7a08,A6)
044898: 3805                       move.w  D5, D4
04489A: D844                       add.w   D4, D4
04489C: D844                       add.w   D4, D4
04489E: 41FA FFC8                  lea     (-$38,PC), A0; ($44868)
0448A2: D0C4                       adda.w  D4, A0
0448A4: 3018                       move.w  (A0)+, D0
0448A6: 3218                       move.w  (A0)+, D1
0448A8: 4EB9 0000 1926             jsr     $1926.l
0448AE: B043                       cmp.w   D3, D0
0448B0: 6F04                       ble     $448b6
0448B2: 3600                       move.w  D0, D3
0448B4: 3405                       move.w  D5, D2
0448B6: 51CD FFE0                  dbra    D5, $44898
0448BA: 1D42 007C                  move.b  D2, ($7c,A6)
0448BE: 4E75                       rts
0448C0: 7600                       moveq   #$0, D3
0448C2: 7A0F                       moveq   #$f, D5
0448C4: 3805                       move.w  D5, D4
0448C6: D844                       add.w   D4, D4
0448C8: D844                       add.w   D4, D4
0448CA: 41FA FF46                  lea     (-$ba,PC), A0; ($44812)
0448CE: D0C4                       adda.w  D4, A0
0448D0: 3018                       move.w  (A0)+, D0
0448D2: 3218                       move.w  (A0)+, D1
0448D4: 4EB9 0000 1926             jsr     $1926.l
0448DA: B043                       cmp.w   D3, D0
0448DC: 6F04                       ble     $448e2
0448DE: 3600                       move.w  D0, D3
0448E0: 3405                       move.w  D5, D2
0448E2: 51CD FFE0                  dbra    D5, $448c4
0448E6: 1D42 007C                  move.b  D2, ($7c,A6)
0448EA: 4E75                       rts
0448EC: 306E 0076                  movea.w ($76,A6), A0
0448F0: 3228 0008                  move.w  ($8,A0), D1
0448F4: 3D41 0088                  move.w  D1, ($88,A6)
0448F8: 3428 0010                  move.w  ($10,A0), D2
0448FC: 3D42 008A                  move.w  D2, ($8a,A6)
044900: 6100 00F6                  bsr     $449f8
044904: 6000 03C6                  bra     $44ccc
044908: 303C 7FFF                  move.w  #$7fff, D0
04490C: 323C 7FFF                  move.w  #$7fff, D1
044910: 343C 7FFF                  move.w  #$7fff, D2
044914: 41ED 3274                  lea     ($3274,A5), A0
044918: 4A28 0000                  tst.b   ($0,A0)
04491C: 6708                       beq     $44926
04491E: 3028 0008                  move.w  ($8,A0), D0
044922: 906E 0008                  sub.w   ($8,A6), D0
044926: 43ED 33F4                  lea     ($33f4,A5), A1
04492A: 4A29 0000                  tst.b   ($0,A1)
04492E: 6708                       beq     $44938
044930: 3229 0008                  move.w  ($8,A1), D1
044934: 926E 0008                  sub.w   ($8,A6), D1
044938: 45ED 3574                  lea     ($3574,A5), A2
04493C: 4A2A 0000                  tst.b   ($0,A2)
044940: 6708                       beq     $4494a
044942: 342A 0008                  move.w  ($8,A2), D2
044946: 946E 0008                  sub.w   ($8,A6), D2
04494A: B041                       cmp.w   D1, D0
04494C: 6C0E                       bge     $4495c
04494E: B042                       cmp.w   D2, D0
044950: 6C18                       bge     $4496a
044952: 41ED 3274                  lea     ($3274,A5), A0
044956: 3D48 0076                  move.w  A0, ($76,A6)
04495A: 4E75                       rts
04495C: B242                       cmp.w   D2, D1
04495E: 6C0A                       bge     $4496a
044960: 41ED 33F4                  lea     ($33f4,A5), A0
044964: 3D48 0076                  move.w  A0, ($76,A6)
044968: 4E75                       rts
04496A: 41ED 3574                  lea     ($3574,A5), A0
04496E: 3D48 0076                  move.w  A0, ($76,A6)
044972: 4E75                       rts
044974: 306E 0076                  movea.w ($76,A6), A0
044978: 3228 0008                  move.w  ($8,A0), D1
04497C: 3428 0010                  move.w  ($10,A0), D2
044980: 3D41 0088                  move.w  D1, ($88,A6)
044984: 3D42 008A                  move.w  D2, ($8a,A6)
044988: 4EB9 0000 103A             jsr     $103a.l
04498E: 1D40 0022                  move.b  D0, ($22,A6)
044992: 4E75                       rts
044994: 4EB9 0000 103A             jsr     $103a.l
04499A: 122E 0022                  move.b  ($22,A6), D1
04499E: 9200                       sub.b   D0, D1
0449A0: 5801                       addq.b  #4, D1
0449A2: 0241 001F                  andi.w  #$1f, D1
0449A6: 0C01 0008                  cmpi.b  #$8, D1
0449AA: 6310                       bls     $449bc
0449AC: 7404                       moveq   #$4, D2
0449AE: 0C01 0014                  cmpi.b  #$14, D1
0449B2: 6402                       bcc     $449b6
0449B4: 74FC                       moveq   #-$4, D2
0449B6: D42E 0022                  add.b   ($22,A6), D2
0449BA: 3002                       move.w  D2, D0
0449BC: 0240 001F                  andi.w  #$1f, D0
0449C0: 1D40 0022                  move.b  D0, ($22,A6)
0449C4: 4E75                       rts
0449C6: 4EB9 0000 103A             jsr     $103a.l
0449CC: 122E 0022                  move.b  ($22,A6), D1
0449D0: 9200                       sub.b   D0, D1
0449D2: 5401                       addq.b  #2, D1
0449D4: 0241 001F                  andi.w  #$1f, D1
0449D8: 0C01 0004                  cmpi.b  #$4, D1
0449DC: 6310                       bls     $449ee
0449DE: 7402                       moveq   #$2, D2
0449E0: 0C01 0012                  cmpi.b  #$12, D1
0449E4: 6402                       bcc     $449e8
0449E6: 74FE                       moveq   #-$2, D2
0449E8: D42E 0022                  add.b   ($22,A6), D2
0449EC: 3002                       move.w  D2, D0
0449EE: 0240 001F                  andi.w  #$1f, D0
0449F2: 1D40 0022                  move.b  D0, ($22,A6)
0449F6: 4E75                       rts
0449F8: 4EB9 0000 103A             jsr     $103a.l
0449FE: 0840 0004                  bchg    #$4, D0
044A02: 122E 0022                  move.b  ($22,A6), D1
044A06: 9200                       sub.b   D0, D1
044A08: 5601                       addq.b  #3, D1
044A0A: 0241 001F                  andi.w  #$1f, D1
044A0E: 0C01 0006                  cmpi.b  #$6, D1
044A12: 63A8                       bls     $449bc
044A14: 7403                       moveq   #$3, D2
044A16: 0C01 0013                  cmpi.b  #$13, D1
044A1A: 649A                       bcc     $449b6
044A1C: 74FD                       moveq   #-$3, D2
044A1E: D42E 0022                  add.b   ($22,A6), D2
044A22: 3002                       move.w  D2, D0
044A24: 0240 001F                  andi.w  #$1f, D0
044A28: 1D40 0022                  move.b  D0, ($22,A6)
044A2C: 4E75                       rts
044A2E: 302E 0008                  move.w  ($8,A6), D0
044A32: 906E 0088                  sub.w   ($88,A6), D0
044A36: 0640 0018                  addi.w  #$18, D0
044A3A: 0C40 0030                  cmpi.w  #$30, D0
044A3E: 6416                       bcc     $44a56
044A40: 302E 0010                  move.w  ($10,A6), D0
044A44: 906E 008A                  sub.w   ($8a,A6), D0
044A48: 5040                       addq.w  #8, D0
044A4A: 0C40 0010                  cmpi.w  #$10, D0
044A4E: 6406                       bcc     $44a56
044A50: 44FC 0001                  move    #$1, CCR
044A54: 4E75                       rts
044A56: 8040                       or.w    D0, D0
044A58: 4E75                       rts
044A5A: 302E 0008                  move.w  ($8,A6), D0
044A5E: 906E 0088                  sub.w   ($88,A6), D0
044A62: 0640 0004                  addi.w  #$4, D0
044A66: 0C40 0008                  cmpi.w  #$8, D0
044A6A: 6418                       bcc     $44a84
044A6C: 302E 0010                  move.w  ($10,A6), D0
044A70: 906E 008A                  sub.w   ($8a,A6), D0
044A74: 0640 0007                  addi.w  #$7, D0
044A78: 0C40 000E                  cmpi.w  #$e, D0
044A7C: 6406                       bcc     $44a84
044A7E: 44FC 0001                  move    #$1, CCR
044A82: 4E75                       rts
044A84: 8040                       or.w    D0, D0
044A86: 4E75                       rts
044A88: 306E 0076                  movea.w ($76,A6), A0
044A8C: 4EB9 0000 191E             jsr     $191e.l
044A92: 0C40 0050                  cmpi.w  #$50, D0
044A96: 6D06                       blt     $44a9e
044A98: 44FC 0001                  move    #$1, CCR
044A9C: 4E75                       rts
044A9E: 8040                       or.w    D0, D0
044AA0: 4E75                       rts
044AA2: 302E 0008                  move.w  ($8,A6), D0
044AA6: 906E 0088                  sub.w   ($88,A6), D0
044AAA: 5040                       addq.w  #8, D0
044AAC: 0C40 0010                  cmpi.w  #$10, D0
044AB0: 6416                       bcc     $44ac8
044AB2: 302E 0010                  move.w  ($10,A6), D0
044AB6: 906E 008A                  sub.w   ($8a,A6), D0
044ABA: 5840                       addq.w  #4, D0
044ABC: 0C40 0008                  cmpi.w  #$8, D0
044AC0: 6406                       bcc     $44ac8
044AC2: 44FC 0001                  move    #$1, CCR
044AC6: 4E75                       rts
044AC8: 8040                       or.w    D0, D0
044ACA: 4E75                       rts
044ACC: 4EB9 0000 119C             jsr     $119c.l
044AD2: 0240 000F                  andi.w  #$f, D0
044AD6: 1D7B 0006 00B1             move.b  ($6,PC,D0.w), ($b1,A6)
044ADC: 4E75                       rts
044ADE: 0000 0000                  ori.b   #$0, D0
044AE2: 0000 0000                  ori.b   #$0, D0
044AE6: 0004 0400                  ori.b   #$0, D4
044AEA: 0000 0004                  ori.b   #$4, D0
044AEE: 306E 0076                  movea.w ($76,A6), A0
044AF2: 3228 0008                  move.w  ($8,A0), D1
044AF6: 3428 0010                  move.w  ($10,A0), D2
044AFA: 4EB9 0000 103A             jsr     $103a.l
044B00: 3A00                       move.w  D0, D5
044B02: 4A2E 0026                  tst.b   ($26,A6)
044B06: 6720                       beq     $44b28
044B08: 7200                       moveq   #$0, D1
044B0A: 122E 007C                  move.b  ($7c,A6), D1
044B0E: D241                       add.w   D1, D1
044B10: 43FA FD00                  lea     (-$300,PC), A1; ($44812)
044B14: 3231 1000                  move.w  (A1,D1.w), D1
044B18: D268 0008                  add.w   ($8,A0), D1
044B1C: 3428 0010                  move.w  ($10,A0), D2
044B20: 4EB9 0000 103A             jsr     $103a.l
044B26: 601C                       bra     $44b44
044B28: 7200                       moveq   #$0, D1
044B2A: 122E 007C                  move.b  ($7c,A6), D1
044B2E: D241                       add.w   D1, D1
044B30: D241                       add.w   D1, D1
044B32: 43FA FD34                  lea     (-$2cc,PC), A1; ($44868)
044B36: 43F1 1000                  lea     (A1,D1.w), A1
044B3A: 3219                       move.w  (A1)+, D1
044B3C: 3419                       move.w  (A1)+, D2
044B3E: 4EB9 0000 103A             jsr     $103a.l
044B44: 0240 0010                  andi.w  #$10, D0
044B48: 0245 0010                  andi.w  #$10, D5
044B4C: B045                       cmp.w   D5, D0
044B4E: 6604                       bne     $44b54
044B50: 8040                       or.w    D0, D0
044B52: 4E75                       rts
044B54: 44FC 0001                  move    #$1, CCR
044B58: 4E75                       rts
044B5A: 7000                       moveq   #$0, D0
044B5C: 7200                       moveq   #$0, D1
044B5E: 102E 0026                  move.b  ($26,A6), D0
044B62: E948                       lsl.w   #4, D0
044B64: D06D 05EE                  add.w   ($5ee,A5), D0
044B68: 123B 001A                  move.b  ($1a,PC,D0.w), D1
044B6C: 4EB9 0000 119C             jsr     $119c.l
044B72: 0240 001F                  andi.w  #$1f, D0
044B76: B001                       cmp.b   D1, D0
044B78: 6C06                       bge     $44b80
044B7A: 44FC 0001                  move    #$1, CCR
044B7E: 4E75                       rts
044B80: 8040                       or.w    D0, D0
044B82: 4E75                       rts
044B84: 0607 0809                  addi.b  #$9, D7
044B88: 0909 0A0A                  movep.w ($a0a,A1), D4
044B8C: 0B0C 0D0E                  movep.w ($d0e,A4), D5
044B90: 0F10                       btst    D7, (A0)
044B92: 1112                       move.b  (A2), -(A0)
044B94: 1415                       move.b  (A5), D2
044B96: 1617                       move.b  (A7), D3
044B98: 1819                       move.b  (A1)+, D4
044B9A: 191A                       move.b  (A2)+, -(A4)
044B9C: 1A1B                       move.b  (A3)+, D5
044B9E: 1B1C                       move.b  (A4)+, -(A5)
044BA0: 1C1D                       move.b  (A5)+, D6
044BA2: 1D1F                       move.b  (A7)+, -(A6)
044BA4: 0102                       btst    D0, D2
044BA6: 0406 0809                  subi.b  #$9, D6
044BAA: 090A 0A0B                  movep.w ($a0b,A2), D4
044BAE: 0C0D                       dc.w    $0c0d; ILLEGAL
044BB0: 0E0F                       dc.w    $0e0f; ILLEGAL
044BB2: 1010                       move.b  (A0), D0
044BB4: 1112                       move.b  (A2), -(A0)
044BB6: 1314                       move.b  (A4), -(A1)
044BB8: 1516                       move.b  (A6), -(A2)
044BBA: 1718                       move.b  (A0)+, -(A3)
044BBC: 1818                       move.b  (A0)+, D4
044BBE: 1919                       move.b  (A1)+, -(A4)
044BC0: 1A1A                       move.b  (A2)+, D5
044BC2: 1C1F                       move.b  (A7)+, D6
044BC4: 7000                       moveq   #$0, D0
044BC6: 306E 0076                  movea.w ($76,A6), A0
044BCA: 302E 00B6                  move.w  ($b6,A6), D0
044BCE: D040                       add.w   D0, D0
044BD0: 323B 0034                  move.w  ($34,PC,D0.w), D1
044BD4: 302E 0008                  move.w  ($8,A6), D0
044BD8: 9068 0008                  sub.w   ($8,A0), D0
044BDC: 6402                       bcc     $44be0
044BDE: 4441                       neg.w   D1
044BE0: D268 0008                  add.w   ($8,A0), D1
044BE4: 3428 0010                  move.w  ($10,A0), D2
044BE8: 3D41 0088                  move.w  D1, ($88,A6)
044BEC: 3D42 008A                  move.w  D2, ($8a,A6)
044BF0: 4A2E 00B5                  tst.b   ($b5,A6)
044BF4: 6608                       bne     $44bfe
044BF6: 6100 FD9C                  bsr     $44994
044BFA: 6000 00D0                  bra     $44ccc
044BFE: 6100 FDC6                  bsr     $449c6
044C02: 6000 00C8                  bra     $44ccc
044C06: 0057 0083                  ori.w   #$83, (A7)
044C0A: 0080 0078 0078             ori.l   #$780078, D0
044C10: 0078 0068 0068             ori.w   #$68, $68.w
044C16: 0068 0068 0078             ori.w   #$68, ($78,A0)
044C1C: 0048                       dc.w    $0048; ILLEGAL
044C1E: 0052 7000                  ori.w   #$7000, (A2)
044C22: 306E 0076                  movea.w ($76,A6), A0
044C26: 3228 0008                  move.w  ($8,A0), D1
044C2A: 3428 0010                  move.w  ($10,A0), D2
044C2E: 3D41 0088                  move.w  D1, ($88,A6)
044C32: 3D42 008A                  move.w  D2, ($8a,A6)
044C36: 4A2E 00BD                  tst.b   ($bd,A6)
044C3A: 6604                       bne     $44c40
044C3C: 6000 FD56                  bra     $44994
044C40: 6000 FD84                  bra     $449c6
044C44: 7200                       moveq   #$0, D1
044C46: 3028 0008                  move.w  ($8,A0), D0
044C4A: 906E 0008                  sub.w   ($8,A6), D0
044C4E: 6504                       bcs     $44c54
044C50: 123C 0001                  move.b  #$1, D1
044C54: 1D41 0024                  move.b  D1, ($24,A6)
044C58: 4E75                       rts
044C5A: 7200                       moveq   #$0, D1
044C5C: 4EB9 0000 119C             jsr     $119c.l
044C62: 0240 001F                  andi.w  #$1f, D0
044C66: 4A2E 00B5                  tst.b   ($b5,A6)
044C6A: 670C                       beq     $44c78
044C6C: E848                       lsr.w   #4, D0
044C6E: 0640 0005                  addi.w  #$5, D0
044C72: 3D40 00B6                  move.w  D0, ($b6,A6)
044C76: 4E75                       rts
044C78: 4A2E 0026                  tst.b   ($26,A6)
044C7C: 6704                       beq     $44c82
044C7E: 0640 0020                  addi.w  #$20, D0
044C82: 123B 0008                  move.b  ($8,PC,D0.w), D1
044C86: 3D41 00B6                  move.w  D1, ($b6,A6)
044C8A: 4E75                       rts
044C8C: 0000 0000                  ori.b   #$0, D0
044C90: 0000 0001                  ori.b   #$1, D0
044C94: 0101                       btst    D0, D1
044C96: 0101                       btst    D0, D1
044C98: 0102                       btst    D0, D2
044C9A: 0202 0203                  andi.b  #$3, D2
044C9E: 0407 080A                  subi.b  #$a, D7
044CA2: 0B0B 0B0B                  movep.w ($b0b,A3), D5
044CA6: 0B0B 0B0C                  movep.w ($b0c,A3), D5
044CAA: 0C0C                       dc.w    $0c0c; ILLEGAL
044CAC: 0000 0000                  ori.b   #$0, D0
044CB0: 0000 0000                  ori.b   #$0, D0
044CB4: 0101                       btst    D0, D1
044CB6: 0101                       btst    D0, D1
044CB8: 0102                       btst    D0, D2
044CBA: 0203 0404                  andi.b  #$4, D3
044CBE: 0708 0A0B                  movep.w ($a0b,A0), D3
044CC2: 0B0B 0B0B                  movep.w ($b0b,A3), D5
044CC6: 0B0B 0B0C                  movep.w ($b0c,A3), D5
044CCA: 0C0C                       dc.w    $0c0c; ILLEGAL
044CCC: 306E 0076                  movea.w ($76,A6), A0
044CD0: 7200                       moveq   #$0, D1
044CD2: 302E 0008                  move.w  ($8,A6), D0
044CD6: 9068 0008                  sub.w   ($8,A0), D0
044CDA: 6402                       bcc     $44cde
044CDC: 7201                       moveq   #$1, D1
044CDE: 1D41 0024                  move.b  D1, ($24,A6)
044CE2: 4E75                       rts
044CE4: 102E 0022                  move.b  ($22,A6), D0
044CE8: E808                       lsr.b   #4, D0
044CEA: 5200                       addq.b  #1, D0
044CEC: 0200 0001                  andi.b  #$1, D0
044CF0: 1D40 0024                  move.b  D0, ($24,A6)
044CF4: 4E75                       rts
044CF6: 306E 0076                  movea.w ($76,A6), A0
044CFA: 302D 0744                  move.w  ($744,A5), D0
044CFE: 0640 00C0                  addi.w  #$c0, D0
044D02: 906E 0008                  sub.w   ($8,A6), D0
044D06: 0640 00A0                  addi.w  #$a0, D0
044D0A: 0C40 0140                  cmpi.w  #$140, D0
044D0E: 6426                       bcc     $44d36
044D10: 7260                       moveq   #$60, D1
044D12: 3028 0008                  move.w  ($8,A0), D0
044D16: 906E 0008                  sub.w   ($8,A6), D0
044D1A: 6502                       bcs     $44d1e
044D1C: 4441                       neg.w   D1
044D1E: 3028 0008                  move.w  ($8,A0), D0
044D22: D041                       add.w   D1, D0
044D24: 906E 0008                  sub.w   ($8,A6), D0
044D28: 0640 0060                  addi.w  #$60, D0
044D2C: 0C40 00C0                  cmpi.w  #$c0, D0
044D30: 6404                       bcc     $44d36
044D32: 8040                       or.w    D0, D0
044D34: 4E75                       rts
044D36: 1D7C 0001 00BA             move.b  #$1, ($ba,A6)
044D3C: 44FC 0001                  move    #$1, CCR
044D40: 4E75                       rts
044D42: 306E 0076                  movea.w ($76,A6), A0
044D46: 3028 0010                  move.w  ($10,A0), D0
044D4A: 906E 0010                  sub.w   ($10,A6), D0
044D4E: 5C40                       addq.w  #6, D0
044D50: 0C40 000C                  cmpi.w  #$c, D0
044D54: 6404                       bcc     $44d5a
044D56: 8040                       or.w    D0, D0
044D58: 4E75                       rts
044D5A: 44FC 0001                  move    #$1, CCR
044D5E: 4E75                       rts
044D60: 306E 0076                  movea.w ($76,A6), A0
044D64: 302E 00B6                  move.w  ($b6,A6), D0
044D68: 5B40                       subq.w  #5, D0
044D6A: D040                       add.w   D0, D0
044D6C: 323B 001C                  move.w  ($1c,PC,D0.w), D1
044D70: 3028 0008                  move.w  ($8,A0), D0
044D74: 906E 0008                  sub.w   ($8,A6), D0
044D78: D041                       add.w   D1, D0
044D7A: D241                       add.w   D1, D1
044D7C: B041                       cmp.w   D1, D0
044D7E: 6406                       bcc     $44d86
044D80: 44FC 0001                  move    #$1, CCR
044D84: 4E75                       rts
044D86: 8040                       or.w    D0, D0
044D88: 4E75                       rts
044D8A: 0060 0080                  ori.w   #$80, -(A0)
044D8E: 306E 0076                  movea.w ($76,A6), A0
044D92: 302E 00B6                  move.w  ($b6,A6), D0
044D96: 5B40                       subq.w  #5, D0
044D98: D040                       add.w   D0, D0
044D9A: 323B 001C                  move.w  ($1c,PC,D0.w), D1
044D9E: 3028 0008                  move.w  ($8,A0), D0
044DA2: 906E 0008                  sub.w   ($8,A6), D0
044DA6: D041                       add.w   D1, D0
044DA8: D241                       add.w   D1, D1
044DAA: B041                       cmp.w   D1, D0
044DAC: 643A                       bcc     $44de8
044DAE: 44FC 0001                  move    #$1, CCR
044DB2: 4E75                       rts
044DB4: 8040                       or.w    D0, D0
044DB6: 4E75                       rts
044DB8: 0050 0070                  ori.w   #$70, (A0)
044DBC: 306E 0076                  movea.w ($76,A6), A0
044DC0: 3028 0008                  move.w  ($8,A0), D0
044DC4: 906E 0008                  sub.w   ($8,A6), D0
044DC8: 0640 0070                  addi.w  #$70, D0
044DCC: 0C40 00E0                  cmpi.w  #$e0, D0
044DD0: 6416                       bcc     $44de8
044DD2: 046E 0005 00B6             subi.w  #$5, ($b6,A6)
044DD8: 302E 00B6                  move.w  ($b6,A6), D0
044DDC: E748                       lsl.w   #3, D0
044DDE: 3D40 00B8                  move.w  D0, ($b8,A6)
044DE2: 44FC 0001                  move    #$1, CCR
044DE6: 4E75                       rts
044DE8: 8040                       or.w    D0, D0
044DEA: 4E75                       rts
044DEC: 7A02                       moveq   #$2, D5
044DEE: 3005                       move.w  D5, D0
044DF0: D040                       add.w   D0, D0
044DF2: D040                       add.w   D0, D0
044DF4: 207B 0010                  movea.l ($10,PC,D0.w), A0
044DF8: 6100 0018                  bsr     $44e12
044DFC: 6506                       bcs     $44e04
044DFE: 51CD FFEE                  dbra    D5, $44dee
044E02: 8000                       or.b    D0, D0
044E04: 4E75                       rts
044E06: 00FF                       dc.w    $00ff; ILLEGAL
044E08: B574 00FF                  eor.w   D2, (-$1,A4,D0.w)
044E0C: B3F4 00FF                  cmpa.l  (-$1,A4,D0.w), A1
044E10: B274 4A28                  cmp.w   INVALID 34, D1
044E14: 0000 6736                  ori.b   #$36, D0
044E18: 0C28 0000 0005             cmpi.b  #$0, ($5,A0)
044E1E: 662E                       bne     $44e4e
044E20: 3228 0008                  move.w  ($8,A0), D1
044E24: 926E 0008                  sub.w   ($8,A6), D1
044E28: 0641 0030                  addi.w  #$30, D1
044E2C: 0C41 0060                  cmpi.w  #$60, D1
044E30: 641C                       bcc     $44e4e
044E32: 3228 0010                  move.w  ($10,A0), D1
044E36: 926E 0010                  sub.w   ($10,A6), D1
044E3A: 0641 0008                  addi.w  #$8, D1
044E3E: 0C41 0010                  cmpi.w  #$10, D1
044E42: 640A                       bcc     $44e4e
044E44: 3D48 0076                  move.w  A0, ($76,A6)
044E48: 44FC 0001                  move    #$1, CCR
044E4C: 4E75                       rts
044E4E: 8040                       or.w    D0, D0
044E50: 4E75                       rts
044E52: 7A02                       moveq   #$2, D5
044E54: 3005                       move.w  D5, D0
044E56: D040                       add.w   D0, D0
044E58: D040                       add.w   D0, D0
044E5A: 207B 00AA                  movea.l (-$56,PC,D0.w), A0
044E5E: 6100 000C                  bsr     $44e6c
044E62: 6506                       bcs     $44e6a
044E64: 51CD FFEE                  dbra    D5, $44e54
044E68: 8000                       or.b    D0, D0
044E6A: 4E75                       rts
044E6C: 4A28 0000                  tst.b   ($0,A0)
044E70: 6744                       beq     $44eb6
044E72: 0C28 0000 0005             cmpi.b  #$0, ($5,A0)
044E78: 663C                       bne     $44eb6
044E7A: 303C 003C                  move.w  #$3c, D0
044E7E: 4A2E 0024                  tst.b   ($24,A6)
044E82: 6702                       beq     $44e86
044E84: 4440                       neg.w   D0
044E86: 322E 0008                  move.w  ($8,A6), D1
044E8A: D240                       add.w   D0, D1
044E8C: 9268 0008                  sub.w   ($8,A0), D1
044E90: 0641 0018                  addi.w  #$18, D1
044E94: 0C41 0030                  cmpi.w  #$30, D1
044E98: 641C                       bcc     $44eb6
044E9A: 3228 0010                  move.w  ($10,A0), D1
044E9E: 926E 0010                  sub.w   ($10,A6), D1
044EA2: 0641 0005                  addi.w  #$5, D1
044EA6: 0C41 000A                  cmpi.w  #$a, D1
044EAA: 640A                       bcc     $44eb6
044EAC: 3D48 0076                  move.w  A0, ($76,A6)
044EB0: 44FC 0001                  move    #$1, CCR
044EB4: 4E75                       rts
044EB6: 8040                       or.w    D0, D0
044EB8: 4E75                       rts
044EBA: 0C2E 0004 007B             cmpi.b  #$4, ($7b,A6)
044EC0: 6626                       bne     $44ee8
044EC2: 7400                       moveq   #$0, D2
044EC4: 7600                       moveq   #$0, D3
044EC6: 342E 00C0                  move.w  ($c0,A6), D2
044ECA: 162E 00C2                  move.b  ($c2,A6), D3
044ECE: 0C03 0005                  cmpi.b  #$5, D3
044ED2: 6C14                       bge     $44ee8
044ED4: 6100 E4BA                  bsr     $43390
044ED8: B06E 006C                  cmp.w   ($6c,A6), D0
044EDC: 6D0A                       blt     $44ee8
044EDE: 522E 00C2                  addq.b  #1, ($c2,A6)
044EE2: 44FC 0001                  move    #$1, CCR
044EE6: 4E75                       rts
044EE8: 8040                       or.w    D0, D0
044EEA: 4E75                       rts
044EEC: 4A2E 0026                  tst.b   ($26,A6)
044EF0: 6608                       bne     $44efa
044EF2: 1D7C FFFF 007D             move.b  #$ff, ($7d,A6)
044EF8: 4E75                       rts
044EFA: 1D7C 0000 007D             move.b  #$0, ($7d,A6)
044F00: 4E75                       rts
044F02: 302D 0744                  move.w  ($744,A5), D0
044F06: 0640 00C0                  addi.w  #$c0, D0
044F0A: 906E 0008                  sub.w   ($8,A6), D0
044F0E: 0640 00E0                  addi.w  #$e0, D0
044F12: 0C40 01C0                  cmpi.w  #$1c0, D0
044F16: 4E75                       rts
044F18: 302D 0744                  move.w  ($744,A5), D0
044F1C: 0640 00C0                  addi.w  #$c0, D0
044F20: 906E 0008                  sub.w   ($8,A6), D0
044F24: 0640 00C0                  addi.w  #$c0, D0
044F28: 0C40 0180                  cmpi.w  #$180, D0
044F2C: 4E75                       rts
044F2E: 7000                       moveq   #$0, D0
044F30: 102E 0026                  move.b  ($26,A6), D0
044F34: ED48                       lsl.w   #6, D0
044F36: 41FB 0016                  lea     ($16,PC,D0.w), A0
044F3A: 302D 05EE                  move.w  ($5ee,A5), D0
044F3E: 0240 001F                  andi.w  #$1f, D0
044F42: D040                       add.w   D0, D0
044F44: 3030 0000                  move.w  (A0,D0.w), D0
044F48: 4EF9 0000 17A4             jmp     $17a4.l
044F4E: 001A 001A                  ori.b   #$1a, (A2)+
044F52: 001A 001A                  ori.b   #$1a, (A2)+
044F56: 001B 001B                  ori.b   #$1b, (A3)+
044F5A: 001B 001B                  ori.b   #$1b, (A3)+
044F5E: 001C 001C                  ori.b   #$1c, (A4)+
044F62: 001C 001C                  ori.b   #$1c, (A4)+
044F66: 001D 001D                  ori.b   #$1d, (A5)+
044F6A: 001D 001D                  ori.b   #$1d, (A5)+
044F6E: 000B                       dc.w    $000b; ILLEGAL
044F70: 000B                       dc.w    $000b; ILLEGAL
044F72: 000B                       dc.w    $000b; ILLEGAL
044F74: 000B                       dc.w    $000b; ILLEGAL
044F76: 000B                       dc.w    $000b; ILLEGAL
044F78: 000B                       dc.w    $000b; ILLEGAL
044F7A: 000B                       dc.w    $000b; ILLEGAL
044F7C: 000B                       dc.w    $000b; ILLEGAL
044F7E: 000C                       dc.w    $000c; ILLEGAL
044F80: 000C                       dc.w    $000c; ILLEGAL
044F82: 000C                       dc.w    $000c; ILLEGAL
044F84: 000C                       dc.w    $000c; ILLEGAL
044F86: 000D                       dc.w    $000d; ILLEGAL
044F88: 000D                       dc.w    $000d; ILLEGAL
044F8A: 000D                       dc.w    $000d; ILLEGAL
044F8C: 000D                       dc.w    $000d; ILLEGAL
044F8E: 001D 001D                  ori.b   #$1d, (A5)+
044F92: 001D 001D                  ori.b   #$1d, (A5)+
044F96: 000B                       dc.w    $000b; ILLEGAL
044F98: 000B                       dc.w    $000b; ILLEGAL
044F9A: 000B                       dc.w    $000b; ILLEGAL
044F9C: 000B                       dc.w    $000b; ILLEGAL
044F9E: 000B                       dc.w    $000b; ILLEGAL
044FA0: 000B                       dc.w    $000b; ILLEGAL
044FA2: 000B                       dc.w    $000b; ILLEGAL
044FA4: 000B                       dc.w    $000b; ILLEGAL
044FA6: 000B                       dc.w    $000b; ILLEGAL
044FA8: 000B                       dc.w    $000b; ILLEGAL
044FAA: 000B                       dc.w    $000b; ILLEGAL
044FAC: 000B                       dc.w    $000b; ILLEGAL
044FAE: 000C                       dc.w    $000c; ILLEGAL
044FB0: 000C                       dc.w    $000c; ILLEGAL
044FB2: 000C                       dc.w    $000c; ILLEGAL
044FB4: 000C                       dc.w    $000c; ILLEGAL
044FB6: 000C                       dc.w    $000c; ILLEGAL
044FB8: 000C                       dc.w    $000c; ILLEGAL
044FBA: 000C                       dc.w    $000c; ILLEGAL
044FBC: 000C                       dc.w    $000c; ILLEGAL
044FBE: 000D                       dc.w    $000d; ILLEGAL
044FC0: 000D                       dc.w    $000d; ILLEGAL
044FC2: 000D                       dc.w    $000d; ILLEGAL
044FC4: 000D                       dc.w    $000d; ILLEGAL
044FC6: 000D                       dc.w    $000d; ILLEGAL
044FC8: 000D                       dc.w    $000d; ILLEGAL
044FCA: 000D                       dc.w    $000d; ILLEGAL
044FCC: 000D                       dc.w    $000d; ILLEGAL
044FCE: 0018 0018                  ori.b   #$18, (A0)+
044FD2: 0018 0018                  ori.b   #$18, (A0)+
044FD6: 0019 0019                  ori.b   #$19, (A1)+
044FDA: 0019 0019                  ori.b   #$19, (A1)+
044FDE: 0009                       dc.w    $0009; ILLEGAL
044FE0: 0009                       dc.w    $0009; ILLEGAL
044FE2: 0009                       dc.w    $0009; ILLEGAL
044FE4: 0009                       dc.w    $0009; ILLEGAL
044FE6: 001A 001A                  ori.b   #$1a, (A2)+
044FEA: 001A 001A                  ori.b   #$1a, (A2)+
044FEE: 001B 001B                  ori.b   #$1b, (A3)+
044FF2: 001B 001B                  ori.b   #$1b, (A3)+
044FF6: 001C 001C                  ori.b   #$1c, (A4)+
044FFA: 001C 001C                  ori.b   #$1c, (A4)+
044FFE: 001D 001D                  ori.b   #$1d, (A5)+
045002: 001D 001D                  ori.b   #$1d, (A5)+
045006: 000B                       dc.w    $000b; ILLEGAL
045008: 000B                       dc.w    $000b; ILLEGAL
04500A: 000B                       dc.w    $000b; ILLEGAL
04500C: 000B                       dc.w    $000b; ILLEGAL
04500E: 001A 001A                  ori.b   #$1a, (A2)+
045012: 001A 001A                  ori.b   #$1a, (A2)+
045016: 001B 001B                  ori.b   #$1b, (A3)+
04501A: 001B 001B                  ori.b   #$1b, (A3)+
04501E: 001C 001C                  ori.b   #$1c, (A4)+
045022: 001C 001C                  ori.b   #$1c, (A4)+
045026: 001D 001D                  ori.b   #$1d, (A5)+
04502A: 001D 001D                  ori.b   #$1d, (A5)+
04502E: 000B                       dc.w    $000b; ILLEGAL
045030: 000B                       dc.w    $000b; ILLEGAL
045032: 000B                       dc.w    $000b; ILLEGAL
045034: 000B                       dc.w    $000b; ILLEGAL
045036: 000B                       dc.w    $000b; ILLEGAL
045038: 000B                       dc.w    $000b; ILLEGAL
04503A: 000B                       dc.w    $000b; ILLEGAL
04503C: 000B                       dc.w    $000b; ILLEGAL
04503E: 000C                       dc.w    $000c; ILLEGAL
045040: 000C                       dc.w    $000c; ILLEGAL
045042: 000C                       dc.w    $000c; ILLEGAL
045044: 000C                       dc.w    $000c; ILLEGAL
045046: 000C                       dc.w    $000c; ILLEGAL
045048: 000C                       dc.w    $000c; ILLEGAL
04504A: 000C                       dc.w    $000c; ILLEGAL
04504C: 000C                       dc.w    $000c; ILLEGAL
04504E: 4EB9 0000 483C             jsr     $483c.l
045054: 652A                       bcs     $45080
045056: 117C 0001 0000             move.b  #$1, ($0,A0)
04505C: 317C 004C 0020             move.w  #$4c, ($20,A0)
045062: 314E 00A0                  move.w  A6, ($a0,A0)
045066: 316E 0008 00A4             move.w  ($8,A6), ($a4,A0)
04506C: 316E 0010 00A6             move.w  ($10,A6), ($a6,A0)
045072: 316E 0076 0076             move.w  ($76,A6), ($76,A0)
045078: 1141 0026                  move.b  D1, ($26,A0)
04507C: 1142 00A9                  move.b  D2, ($a9,A0)
045080: 4E75                       rts