0818E4: 102E 0004                  move.b  ($4,A6), D0
0818E8: 323B 0006                  move.w  ($6,PC,D0.w), D1
0818EC: 4EFB 1002                  jmp     ($2,PC,D1.w)			；跳819BE
0818F0: 0008                       dc.w    $0008; ILLEGAL
0818F2: 00CE                       dc.w    $00ce; ILLEGAL
0818F4: 016E 0182                  bchg    D0, ($182,A6)
0818F8: 7000                       moveq   #$0, D0
0818FA: 102E 0005                  move.b  ($5,A6), D0
0818FE: 303B 0006                  move.w  ($6,PC,D0.w), D0
081902: 4EFB 0002                  jmp     ($2,PC,D0.w)		；跳9199E、
081906: 0004 0098                  ori.b   #$98, D4
08190A: 542E 0005                  addq.b  #2, ($5,A6)
08190E: 4EB9 0000 483C             jsr     $483c.l
081914: 6500 015C                  bcs     $81a72
081918: 117C 0001 0000             move.b  #$1, ($0,A0)
08191E: 317C 011C 0020             move.w  #$11c, ($20,A0)
081924: 3D48 00A0                  move.w  A0, ($a0,A6)
081928: 317C 0580 0008             move.w  #$580, ($8,A0)
08192E: 317C 0030 0010             move.w  #$30, ($10,A0)
081934: 314E 00C6                  move.w  A6, ($c6,A0)
081938: 4EB9 0000 483C             jsr     $483c.l
08193E: 6500 0132                  bcs     $81a72
081942: 117C 0001 0000             move.b  #$1, ($0,A0)
081948: 317C 011C 0020             move.w  #$11c, ($20,A0)
08194E: 3D48 00A2                  move.w  A0, ($a2,A6)
081952: 317C 0580 0008             move.w  #$580, ($8,A0)
081958: 317C 0040 0010             move.w  #$40, ($10,A0)
08195E: 314E 00C6                  move.w  A6, ($c6,A0)
081962: 1D7C 0002 00AA             move.b  #$2, ($aa,A6)
081968: 4A2D 04EF                  tst.b   ($4ef,A5)
08196C: 672E                       beq     $8199c
08196E: 4EB9 0000 483C             jsr     $483c.l
081974: 6500 00FC                  bcs     $81a72
081978: 522E 00AA                  addq.b  #1, ($aa,A6)
08197C: 117C 0001 0000             move.b  #$1, ($0,A0)
081982: 317C 011C 0020             move.w  #$11c, ($20,A0)
081988: 3D48 00A4                  move.w  A0, ($a4,A6)
08198C: 317C 0580 0008             move.w  #$580, ($8,A0)
081992: 317C 0020 0010             move.w  #$20, ($10,A0)
081998: 314E 00C6                  move.w  A6, ($c6,A0)
08199C: 4E75                       rts
08199E: 4A2D 04FC                  tst.b   ($4fc,A5)		；是否解除锁定
0819A2: 6618                       bne     $819bc
0819A4: 4EB9 0007 BEDC             jsr     $7bedc.l			；派兵
0819AA: 1D7C FFFF 007D             move.b  #$ff, ($7d,A6)	；11C色板？
0819B0: 7011                       moveq   #$11, D0			；第11号音乐？
0819B2: 4EB9 0000 A63C             jsr     $a63c.l			；加载音乐
0819B8: 542E 0004                  addq.b  #2, ($4,A6)
0819BC: 4E75                       rts
0819BE: 1B7C 0002 07B4             move.b  #$2, ($7b4,A5)
0819C4: 6100 0040                  bsr     $81a06
0819C8: 536E 00A6                  subq.w  #1, ($a6,A6)
0819CC: 640C                       bcc     $819da
0819CE: 3D7C 012C 00A6             move.w  #$12c, ($a6,A6)	；($a6,A6)为了每12秒运行下条指令
0819D4: 1B7C 0001 0502             move.b  #$1, ($502,A5)	；等于0不出小兵，等于1持续派兵	
0819DA: 6100 0118                  bsr     $81af4			；跳到检测幻影是否存活？
0819DE: 302E 00A0                  move.w  ($a0,A6), D0
0819E2: 806E 00A2                  or.w    ($a2,A6), D0
0819E6: 806E 00A4                  or.w    ($a4,A6), D0
0819EA: 6618                       bne     $81a04
0819EC: 542E 0004                  addq.b  #2, ($4,A6)
0819F0: 2F0E                       move.l  A6, -(A7)
0819F2: 3C6E 00A8                  movea.w ($a8,A6), A6
0819F6: 4EB9 0000 ACEE             jsr     $acee.l
0819FC: 4EB9 0000 A5EA             jsr     $a5ea.l
081A02: 2C5F                       movea.l (A7)+, A6
081A04: 4E75                       rts
*--------11C血量全部加到主体0084的血量上---------------------
081A06: 426E 006C                  clr.w   ($6c,A6)			；不停地运行
081A0A: 426E 006E                  clr.w   ($6e,A6)
081A0E: 4A6E 00A0                  tst.w   ($a0,A6)
081A12: 6714                       beq     $81a28
081A14: 306E 00A0                  movea.w ($a0,A6), A0
081A18: 3028 006C                  move.w  ($6c,A0), D0
081A1C: D16E 006C                  add.w   D0, ($6c,A6)
081A20: 3028 006E                  move.w  ($6e,A0), D0
081A24: D16E 006E                  add.w   D0, ($6e,A6)
081A28: 4A6E 00A2                  tst.w   ($a2,A6)
081A2C: 6714                       beq     $81a42
081A2E: 306E 00A2                  movea.w ($a2,A6), A0
081A32: 3028 006C                  move.w  ($6c,A0), D0
081A36: D16E 006C                  add.w   D0, ($6c,A6)
081A3A: 3028 006E                  move.w  ($6e,A0), D0
081A3E: D16E 006E                  add.w   D0, ($6e,A6)
081A42: 4A6E 00A4                  tst.w   ($a4,A6)
081A46: 6714                       beq     $81a5c
081A48: 306E 00A4                  movea.w ($a4,A6), A0
081A4C: 3028 006C                  move.w  ($6c,A0), D0
081A50: D16E 006C                  add.w   D0, ($6c,A6)
081A54: 3028 006E                  move.w  ($6e,A0), D0
081A58: D16E 006E                  add.w   D0, ($6e,A6)
081A5C: 4E75                       rts

081A5E: 542E 0004                  addq.b  #2, ($4,A6)
081A62: 2F0E                       move.l  A6, -(A7)
081A64: 3C6E 00A8                  movea.w ($a8,A6), A6
081A68: 4EB9 0000 6148             jsr     $6148.l
081A6E: 2C5F                       movea.l (A7)+, A6
081A70: 4E75                       rts

081A72: 4E75                       rts

081A74: 4EF9 0000 4938             jmp     $4938.l
081A7A: 4EB9 0003 262A             jsr     $3262a.l		；被揍的幻影跳转到此
081A80: 302E 006C                  move.w  ($6c,A6), D0
081A84: 6668                       bne     $81aee
081A86: 4EB9 0003 2740             jsr     $32740.l
081A8C: 322E 006E                  move.w  ($6e,A6), D1
081A90: 675C                       beq     $81aee
081A92: 306E 00C6                  movea.w ($c6,A6), A0
081A96: 426E 006E                  clr.w   ($6e,A6)
081A9A: 4A68 00A0                  tst.w   ($a0,A0)
081A9E: 6716                       beq     $81ab6
081AA0: 3028 00A0                  move.w  ($a0,A0), D0
081AA4: BCC0                       cmpa.w  D0, A6
081AA6: 660E                       bne     $81ab6
081AA8: 5328 00AA                  subq.b  #1, ($aa,A0)
081AAC: 6604                       bne     $81ab2
081AAE: 3140 00A8                  move.w  D0, ($a8,A0)	 ；最后一个死亡幻影放入 ($a8,A0)，过关慢动作等用到
081AB2: 4268 00A0                  clr.w   ($a0,A0)
081AB6: 4A68 00A2                  tst.w   ($a2,A0)
081ABA: 6716                       beq     $81ad2
081ABC: 3028 00A2                  move.w  ($a2,A0), D0
081AC0: BCC0                       cmpa.w  D0, A6
081AC2: 660E                       bne     $81ad2
081AC4: 5328 00AA                  subq.b  #1, ($aa,A0)
081AC8: 6604                       bne     $81ace
081ACA: 3140 00A8                  move.w  D0, ($a8,A0)	 ；最后一个死亡幻影放入 ($a8,A0)，过关慢动作等用到
081ACE: 4268 00A2                  clr.w   ($a2,A0)

081AD2: 4A68 00A4                  tst.w   ($a4,A0)
081AD6: 6716                       beq     $81aee
081AD8: 3028 00A4                  move.w  ($a4,A0), D0
081ADC: BCC0                       cmpa.w  D0, A6
081ADE: 660E                       bne     $81aee
081AE0: 5328 00AA                  subq.b  #1, ($aa,A0)
081AE4: 6604                       bne     $81aea
081AE6: 3140 00A8                  move.w  D0, ($a8,A0)	 ；最后一个死亡幻影放入 ($a8,A0)，过关慢动作等用到
081AEA: 4268 00A4                  clr.w   ($a4,A0)
081AEE: 4EF9 0002 A606             jmp     $2a606.l

081AF4: 4A6E 00A0                  tst.w   ($a0,A6)
081AF8: 670A                       beq     $81b04
081AFA: 306E 00A0                  movea.w ($a0,A6), A0
081AFE: 3B48 8F44                  move.w  A0, (-$70bc,A5)
081B02: 601E                       bra     $81b22
081B04: 4A6E 00A2                  tst.w   ($a2,A6)
081B08: 670A                       beq     $81b14
081B0A: 306E 00A2                  movea.w ($a2,A6), A0
081B0E: 3B48 8F44                  move.w  A0, (-$70bc,A5)
081B12: 600E                       bra     $81b22



081B14: 4A6E 00A4                  tst.w   ($a4,A6)
081B18: 6708                       beq     $81b22
081B1A: 306E 00A4                  movea.w ($a4,A6), A0
081B1E: 3B48 8F44                  move.w  A0, (-$70bc,A5)
081B22: 4E75                       rts
081B24: 4EB9 0000 4860             jsr     $4860.l
081B2A: 6510                       bcs     $81b3c
081B2C: 117C 0001 0000             move.b  #$1, ($0,A0)
081B32: 317C 0088 0020             move.w  #$88, ($20,A0)
081B38: 3140 0026                  move.w  D0, ($26,A0)
081B3C: 4E75                       rts




*---------------飞镖----------------------
0451E8: 0C2D 0006 04D9             cmpi.b  #$6, ($4d9,A5)		；检测是否7关，否，11C之间互不接收飞镖
0451EE: 670A                       beq     $451fa
0451F0: 6100 03F6                  bsr     $455e8
0451F4: 6500 0166                  bcs     $4535c
0451F8: 6008                       bra     $45202
0451FA: 6100 0390                  bsr     $4558c
0451FE: 6500 015C                  bcs     $4535c
045202: 4EB9 0000 49CA             jsr     $49ca.l
045208: 4EB9 0000 4C0A             jsr     $4c0a.l
04520E: 6100 04B4                  bsr     $456c4
045212: 4EF9 0000 173C             jmp     $173c.l
045218: 0008                       dc.w    $0008; ILLEGAL
04521A: 0008                       dc.w    $0008; ILLEGAL
04521C: 0076 00DC 4A2E             ori.w   #$dc, INVALID 36
045222: 00A2 661A 6100             ori.l   #$661a6100, -(A2)
045228: 0266 6414                  andi.w  #$6414, -(A6)
04522C: 303C 0400                  move.w  #$400, D0
045230: 4A2E 0024                  tst.b   ($24,A6)
045234: 6702                       beq     $45238
045236: 4440                       neg.w   D0
045238: 3D40 001A                  move.w  D0, ($1a,A6)
04523C: 446E 0016                  neg.w   ($16,A6)
045240: 4EB9 0000 189C             jsr     $189c.l
045246: 302E 0014                  move.w  ($14,A6), D0
04524A: 6A02                       bpl     $4524e
04524C: 4440                       neg.w   D0
04524E: 0C40 0500                  cmpi.w  #$500, D0
045252: 6F10                       ble     $45264
045254: 303C 0500                  move.w  #$500, D0
045258: 4A6E 0014                  tst.w   ($14,A6)
04525C: 6A02                       bpl     $45260
04525E: 4440                       neg.w   D0
045260: 3D40 0014                  move.w  D0, ($14,A6)
045264: 302E 000C                  move.w  ($c,A6), D0
045268: 4A2E 00A2                  tst.b   ($a2,A6)
04526C: 660E                       bne     $4527c
04526E: 0C40 0010                  cmpi.w  #$10, D0
045272: 6C14                       bge     $45288
045274: 3D7C 0010 000C             move.w  #$10, ($c,A6)
04527A: 600C                       bra     $45288
04527C: 0C40 0048                  cmpi.w  #$48, D0
045280: 6F06                       ble     $45288
045282: 3D7C 0048 000C             move.w  #$48, ($c,A6)
045288: 4EF9 0000 121E             jmp     $121e.l
04528E: 4A2E 00A2                  tst.b   ($a2,A6)
045292: 6616                       bne     $452aa
045294: 6100 01F8                  bsr     $4548e
045298: 6410                       bcc     $452aa
04529A: 303C 0400                  move.w  #$400, D0
04529E: 4A2E 0024                  tst.b   ($24,A6)
0452A2: 6702                       beq     $452a6
0452A4: 4440                       neg.w   D0
0452A6: 3D40 001A                  move.w  D0, ($1a,A6)
0452AA: 4EB9 0000 189C             jsr     $189c.l
0452B0: 302E 0014                  move.w  ($14,A6), D0
0452B4: 6A02                       bpl     $452b8
0452B6: 4440                       neg.w   D0
0452B8: 0C40 0500                  cmpi.w  #$500, D0
0452BC: 6F10                       ble     $452ce
0452BE: 303C 0500                  move.w  #$500, D0
0452C2: 4A6E 0014                  tst.w   ($14,A6)
0452C6: 6A02                       bpl     $452ca
0452C8: 4440                       neg.w   D0
0452CA: 3D40 0014                  move.w  D0, ($14,A6)
0452CE: 4A2E 00A2                  tst.b   ($a2,A6)
0452D2: 6612                       bne     $452e6
0452D4: 302E 00A4                  move.w  ($a4,A6), D0
0452D8: 906E 0008                  sub.w   ($8,A6), D0
0452DC: 6A02                       bpl     $452e0
0452DE: 4440                       neg.w   D0
0452E0: 0C40 0040                  cmpi.w  #$40, D0
0452E4: 6D08                       blt     $452ee
0452E6: 6100 01FC                  bsr     $454e4
0452EA: 6100 021A                  bsr     $45506
0452EE: 4EF9 0000 121E             jmp     $121e.l
0452F4: 6100 022E                  bsr     $45524
0452F8: 6100 025E                  bsr     $45558
0452FC: 4EB9 0000 189C             jsr     $189c.l
045302: 4EF9 0000 121E             jmp     $121e.l
045308: 7000                       moveq   #$0, D0
04530A: 102E 0007                  move.b  ($7,A6), D0
04530E: 303B 000C                  move.w  ($c,PC,D0.w), D0
045312: 4EBB 0008                  jsr     ($8,PC,D0.w)
045316: 4EF9 0000 49CA             jmp     $49ca.l
04531C: 0004 002E                  ori.b   #$2e, D4
045320: 542E 0007                  addq.b  #2, ($7,A6)
045324: 306E 0068                  movea.w ($68,A6), A0
045328: 3D7C 0100 0014             move.w  #$100, ($14,A6)
04532E: 426E 001A                  clr.w   ($1a,A6)
045332: 426E 0016                  clr.w   ($16,A6)
045336: 3D7C FFC0 001C             move.w  #$ffc0, ($1c,A6)
04533C: 426E 0018                  clr.w   ($18,A6)
045340: 426E 001E                  clr.w   ($1e,A6)
045344: 1D7C 0001 0051             move.b  #$1, ($51,A6)
04534A: 4A2E 0051                  tst.b   ($51,A6)
04534E: 670C                       beq     $4535c
045350: 4EB9 0000 189C             jsr     $189c.l
045356: 4EF9 0001 2CB4             jmp     $12cb4.l
04535C: 4EF9 0000 48FC             jmp     $48fc.l
045362: 0C2E 0006 0026             cmpi.b  #$6, ($26,A6)
045368: 673E                       beq     $453a8
04536A: 303C 0A00                  move.w  #$a00, D0
04536E: 323C 0080                  move.w  #$80, D1
045372: 4A2E 0024                  tst.b   ($24,A6)
045376: 6604                       bne     $4537c
045378: 4440                       neg.w   D0
04537A: 4441                       neg.w   D1
04537C: 3D40 0014                  move.w  D0, ($14,A6)
045380: 3D41 001A                  move.w  D1, ($1a,A6)
045384: 426E 0018                  clr.w   ($18,A6)
045388: 426E 001E                  clr.w   ($1e,A6)
04538C: 4A2E 0026                  tst.b   ($26,A6)
045390: 670A                       beq     $4539c
045392: 426E 0016                  clr.w   ($16,A6)
045396: 426E 001C                  clr.w   ($1c,A6)
04539A: 4E75                       rts
04539C: 3D7C FE00 0016             move.w  #$fe00, ($16,A6)
0453A2: 426E 001C                  clr.w   ($1c,A6)
0453A6: 4E75                       rts
0453A8: 7000                       moveq   #$0, D0
0453AA: 102E 00A9                  move.b  ($a9,A6), D0
0453AE: D040                       add.w   D0, D0
0453B0: D040                       add.w   D0, D0
0453B2: 3200                       move.w  D0, D1
0453B4: D241                       add.w   D1, D1
0453B6: D041                       add.w   D1, D0
0453B8: 43FB 0044                  lea     ($44,PC,D0.w), A1
0453BC: 3019                       move.w  (A1)+, D0
0453BE: 3219                       move.w  (A1)+, D1
0453C0: 3D59 00AA                  move.w  (A1)+, ($aa,A6)
0453C4: 7401                       moveq   #$1, D2
0453C6: 4A2E 0024                  tst.b   ($24,A6)
0453CA: 6606                       bne     $453d2
0453CC: 4440                       neg.w   D0
0453CE: 4441                       neg.w   D1
0453D0: 7400                       moveq   #$0, D2
0453D2: 3D40 0014                  move.w  D0, ($14,A6)
0453D6: 3D41 001A                  move.w  D1, ($1a,A6)
0453DA: 1D42 00A3                  move.b  D2, ($a3,A6)
0453DE: 3D7C 00C0 0016             move.w  #$c0, ($16,A6)
0453E4: 3D7C 0000 001C             move.w  #$0, ($1c,A6)
0453EA: 3D59 0018                  move.w  (A1)+, ($18,A6)
0453EE: 3D59 001E                  move.w  (A1)+, ($1e,A6)
0453F2: 3D59 00AC                  move.w  (A1)+, ($ac,A6)
0453F6: 1D7C 0001 00A8             move.b  #$1, ($a8,A6)
0453FC: 4E75                       rts
0453FE: 0400 FFC0                  subi.b  #-$40, D0
045402: 0003 0200                  ori.b   #$0, D3
045406: FFF2                       dc.w    $fff2; opcode 1111
045408: 0001 0480                  ori.b   #$80, D1
04540C: FFC8                       dc.w    $ffc8; opcode 1111
04540E: 0003 0280                  ori.b   #$80, D3
045412: FFEF                       dc.w    $ffef; opcode 1111
045414: 0001 0500                  ori.b   #$0, D1
045418: FFCE                       dc.w    $ffce; opcode 1111
04541A: 0003 0300                  ori.b   #$0, D3
04541E: FFEC                       dc.w    $ffec; opcode 1111
045420: 0001 0400                  ori.b   #$0, D1
045424: FFC0                       dc.w    $ffc0; opcode 1111
045426: 0003 0300                  ori.b   #$0, D3
04542A: FFEC                       dc.w    $ffec; opcode 1111
04542C: 0001 0480                  ori.b   #$80, D1
045430: FFC8                       dc.w    $ffc8; opcode 1111
045432: 0003 0280                  ori.b   #$80, D3
045436: FFEF                       dc.w    $ffef; opcode 1111
045438: 0001 0500                  ori.b   #$0, D1
04543C: FFCE                       dc.w    $ffce; opcode 1111
04543E: 0003 0200                  ori.b   #$0, D3
045442: FFF2                       dc.w    $fff2; opcode 1111
045444: 0001 0400                  ori.b   #$0, D1
045448: FFC0                       dc.w    $ffc0; opcode 1111
04544A: 0003 FE00                  ori.b   #$0, D3
04544E: 000E                       dc.w    $000e; ILLEGAL
045450: 0001 0480                  ori.b   #$80, D1
045454: FFC8                       dc.w    $ffc8; opcode 1111
045456: 0003 FD80                  ori.b   #$80, D3
04545A: 0011 0001                  ori.b   #$1, (A1)
04545E: 0200 FFC0                  andi.b  #$c0, D0
045462: 0005 0000                  ori.b   #$0, D5
045466: 0000 0000                  ori.b   #$0, D0
04546A: 0400 FFC0                  subi.b  #-$40, D0
04546E: 0003 FD00                  ori.b   #$0, D3
045472: 0014 0001                  ori.b   #$1, (A4)
045476: 0480 FFC8 0003             subi.l  #-$37fffd, D0
04547C: FD80                       dc.w    $fd80; opcode 1111
04547E: 0011 0001                  ori.b   #$1, (A1)
045482: 0600 FFD6                  addi.b  #-$2a, D0
045486: 0003 0000                  ori.b   #$0, D3
04548A: 0000 0000                  ori.b   #$0, D0
04548E: 306E 0076                  movea.w ($76,A6), A0
045492: 323C 00C8                  move.w  #$c8, D1
045496: 4A2E 0024                  tst.b   ($24,A6)
04549A: 6612                       bne     $454ae
04549C: 4441                       neg.w   D1
04549E: 3028 0008                  move.w  ($8,A0), D0
0454A2: D041                       add.w   D1, D0
0454A4: 322E 0008                  move.w  ($8,A6), D1
0454A8: 9041                       sub.w   D1, D0
0454AA: 6F34                       ble     $454e0
0454AC: 600E                       bra     $454bc
0454AE: 3028 0008                  move.w  ($8,A0), D0
0454B2: D041                       add.w   D1, D0
0454B4: 322E 0008                  move.w  ($8,A6), D1
0454B8: 9041                       sub.w   D1, D0
0454BA: 6C24                       bge     $454e0
0454BC: 1D7C 0001 00A2             move.b  #$1, ($a2,A6)
0454C2: 1D7C 003C 0058             move.b  #$3c, ($58,A6)
0454C8: 422E 005A                  clr.b   ($5a,A6)
0454CC: 422E 0059                  clr.b   ($59,A6)
0454D0: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
0454D6: 522D 67BE                  addq.b  #1, ($67be,A5)
0454DA: 44FC 0001                  move    #$1, CCR
0454DE: 4E75                       rts
0454E0: 8040                       or.w    D0, D0
0454E2: 4E75                       rts
0454E4: 306E 0076                  movea.w ($76,A6), A0
0454E8: 323C 0100                  move.w  #$100, D1
0454EC: 3028 000C                  move.w  ($c,A0), D0
0454F0: 0640 0030                  addi.w  #$30, D0
0454F4: 906E 000C                  sub.w   ($c,A6), D0
0454F8: 6402                       bcc     $454fc
0454FA: 4441                       neg.w   D1
0454FC: 3D41 0016                  move.w  D1, ($16,A6)
045500: 426E 001C                  clr.w   ($1c,A6)
045504: 4E75                       rts
045506: 306E 0076                  movea.w ($76,A6), A0
04550A: 323C 0100                  move.w  #$100, D1
04550E: 3028 0010                  move.w  ($10,A0), D0
045512: 906E 0010                  sub.w   ($10,A6), D0
045516: 6402                       bcc     $4551a
045518: 4441                       neg.w   D1
04551A: 3D41 0018                  move.w  D1, ($18,A6)
04551E: 426E 001E                  clr.w   ($1e,A6)
045522: 4E75                       rts
045524: 4A2E 00A3                  tst.b   ($a3,A6)
045528: 660A                       bne     $45534
04552A: 302E 00A4                  move.w  ($a4,A6), D0
04552E: 322E 0008                  move.w  ($8,A6), D1
045532: 6008                       bra     $4553c
045534: 302E 0008                  move.w  ($8,A6), D0
045538: 322E 00A4                  move.w  ($a4,A6), D1
04553C: 9041                       sub.w   D1, D0
04553E: 6416                       bcc     $45556
045540: 302E 00AA                  move.w  ($aa,A6), D0
045544: 0A2E 0001 00A3             eori.b  #$1, ($a3,A6)
04554A: 446E 001A                  neg.w   ($1a,A6)
04554E: 6A02                       bpl     $45552
045550: 4440                       neg.w   D0
045552: 916E 001A                  sub.w   D0, ($1a,A6)
045556: 4E75                       rts
045558: 4A2E 00A8                  tst.b   ($a8,A6)
04555C: 660A                       bne     $45568
04555E: 302E 00A6                  move.w  ($a6,A6), D0
045562: 322E 0010                  move.w  ($10,A6), D1
045566: 6008                       bra     $45570
045568: 302E 0010                  move.w  ($10,A6), D0
04556C: 322E 00A6                  move.w  ($a6,A6), D1
045570: 9041                       sub.w   D1, D0
045572: 6416                       bcc     $4558a
045574: 302E 00AC                  move.w  ($ac,A6), D0
045578: 0A2E 0001 00A8             eori.b  #$1, ($a8,A6)
04557E: 446E 001E                  neg.w   ($1e,A6)
045582: 6A02                       bpl     $45586
045584: 4440                       neg.w   D0
045586: 916E 001E                  sub.w   D0, ($1e,A6)
04558A: 4E75                       rts
04558C: 306E 00A0                  movea.w ($a0,A6), A0				；A6为飞镖，($a0,A6)为发镖11C地址		
045590: 3D68 00C6 00B0             move.w  ($c6,A0), ($b0,A6)		；把0084地址移到飞镖$b0地址上
045596: 306E 00B0                  movea.w ($b0,A6), A0				；A0为0084
04559A: 4A28 00AA                  tst.b   ($aa,A0)					；0084是否团灭
04559E: 673E                       beq     $455de
0455A0: 3068 00A0                  movea.w ($a0,A0), A0	
0455A4: 4A28 0000                  tst.b   ($0,A0)					；检测1号11C是否存活
0455A8: 6708                       beq     $455b2					；阵亡，则跳到2号11C检测
0455AA: 6100 0040                  bsr     $455ec
0455AE: 6500 0032                  bcs     $455e2
0455B2: 306E 00B0                  movea.w ($b0,A6), A0
0455B6: 3068 00A2                  movea.w ($a2,A0), A0
0455BA: 4A28 0000                  tst.b   ($0,A0)
0455BE: 6708                       beq     $455c8
0455C0: 6100 002A                  bsr     $455ec
0455C4: 6500 001C                  bcs     $455e2

0455C8: 306E 00B0                  movea.w ($b0,A6), A0
0455CC: 3068 00A4                  movea.w ($a4,A0), A0
0455D0: 4A28 0000                  tst.b   ($0,A0)
0455D4: 6708                       beq     $455de

0455D6: 6100 0014                  bsr     $455ec
0455DA: 6500 0006                  bcs     $455e2
0455DE: 8040                       or.w    D0, D0
0455E0: 4E75                       rts
0455E2: 44FC 0001                  move    #$1, CCR
0455E6: 4E75                       rts
0455E8: 306E 00A0                  movea.w ($a0,A6), A0
0455EC: 7000                       moveq   #$0, D0
0455EE: 7200                       moveq   #$0, D1
0455F0: 7400                       moveq   #$0, D2
0455F2: 7600                       moveq   #$0, D3
0455F4: 224E                       movea.l A6, A1
0455F6: 2468 0044                  movea.l ($44,A0), A2
0455FA: 1028 0048                  move.b  ($48,A0), D0
0455FE: D040                       add.w   D0, D0
045600: D040                       add.w   D0, D0
045602: 3200                       move.w  D0, D1
045604: D241                       add.w   D1, D1
045606: D041                       add.w   D1, D0
045608: D4C0                       adda.w  D0, A2
04560A: 47FA 007C                  lea     ($7c,PC), A3; ($45688)
04560E: D6FC 000C                  adda.w  #$c, A3
045612: 3028 0010                  move.w  ($10,A0), D0
045616: D05A                       add.w   (A2)+, D0
045618: 3229 0010                  move.w  ($10,A1), D1
04561C: D25B                       add.w   (A3)+, D1
04561E: 9041                       sub.w   D1, D0
045620: 321A                       move.w  (A2)+, D1
045622: D041                       add.w   D1, D0
045624: D25B                       add.w   (A3)+, D1
045626: B041                       cmp.w   D1, D0
045628: 6200 005A                  bhi     $45684
04562C: 3028 0008                  move.w  ($8,A0), D0
045630: 321A                       move.w  (A2)+, D1
045632: 341A                       move.w  (A2)+, D2
045634: 4A28 0024                  tst.b   ($24,A0)
045638: 6700 0006                  beq     $45640
04563C: 4441                       neg.w   D1
04563E: 9242                       sub.w   D2, D1
045640: D041                       add.w   D1, D0
045642: 3229 0008                  move.w  ($8,A1), D1
045646: 361B                       move.w  (A3)+, D3
045648: 381B                       move.w  (A3)+, D4
04564A: 4A29 0024                  tst.b   ($24,A1)
04564E: 6700 0006                  beq     $45656
045652: 4443                       neg.w   D3
045654: 9644                       sub.w   D4, D3
045656: D243                       add.w   D3, D1
045658: 9041                       sub.w   D1, D0
04565A: D042                       add.w   D2, D0
04565C: D444                       add.w   D4, D2
04565E: B042                       cmp.w   D2, D0
045660: 6200 0022                  bhi     $45684
045664: 3028 000C                  move.w  ($c,A0), D0
045668: D05A                       add.w   (A2)+, D0
04566A: 3229 000C                  move.w  ($c,A1), D1
04566E: D25B                       add.w   (A3)+, D1
045670: 9041                       sub.w   D1, D0
045672: 321A                       move.w  (A2)+, D1
045674: D041                       add.w   D1, D0
045676: D25B                       add.w   (A3)+, D1
045678: B041                       cmp.w   D1, D0
04567A: 6200 0008                  bhi     $45684
04567E: 44FC 0001                  move    #$1, CCR
045682: 4E75                       rts
045684: 8040                       or.w    D0, D0
045686: 4E75                       rts
045688: 0000 0000                  ori.b   #$0, D0
04568C: 0000 0000                  ori.b   #$0, D0
045690: 0000 0000                  ori.b   #$0, D0
045694: FFF0                       dc.w    $fff0; opcode 1111
045696: 0028 FFE0 0040             ori.b   #$e0, ($40,A0)
04569C: FFEE                       dc.w    $ffee; opcode 1111
04569E: 0024 306C                  ori.b   #$6c, -(A4)
0456A2: 0076 0C28 0001             ori.w   #$c28, ($1,A6,D0.w)
0456A8: 0000 6612                  ori.b   #$12, D0
0456AC: 0C68 0200 0004             cmpi.w  #$200, ($4,A0)
0456B2: 660A                       bne     $456be
0456B4: 4A28 0051                  tst.b   ($51,A0)
0456B8: 6604                       bne     $456be
0456BA: 8040                       or.w    D0, D0
0456BC: 4E75                       rts
0456BE: 44FC 0001                  move    #$1, CCR
0456C2: 4E75                       rts






















