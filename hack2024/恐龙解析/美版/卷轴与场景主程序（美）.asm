0206D4: 4DED 073C                  lea     ($73c,A5), A6
0206D8: 7000                       moveq   #$0, D0
0206DA: 102E 0004                  move.b  ($4,A6), D0
0206DE: 323B 0006                  move.w  ($6,PC,D0.w), D1
0206E2: 4EFB 1002                  jmp     ($2,PC,D1.w)
0206E6: 0004 01B2                  ori.b   #$b2, D4
0206EA: 542E 0004                  addq.b  #2, ($4,A6)
0206EE: 1D7C 0001 0071             move.b  #$1, ($71,A6)
0206F4: 1D7C 0001 0075             move.b  #$1, ($75,A6)
0206FA: 422E 0072                  clr.b   ($72,A6)
0206FE: 1D7C 00FF 0073             move.b  #$ff, ($73,A6)
020704: 4EB9 0000 8A44             jsr     $8a44.l
02070A: 4EB9 0000 8932             jsr     $8932.l
020710: 0C2D 0002 04D9             cmpi.b  #$2, ($4d9,A5)
020716: 6608                       bne     $20720
020718: 006D 0001 0026             ori.w   #$1, ($26,A5)
02071E: 6006                       bra     $20726
020720: 026D FFFE 0026             andi.w  #$fffe, ($26,A5)
020726: 0C2E 000E 0005             cmpi.b  #$e, ($5,A6)
02072C: 6C0C                       bge     $2073a
02072E: 0C2E 000F 0005             cmpi.b  #$f, ($5,A6)
020734: 6C04                       bge     $2073a
020736: 422E 004A                  clr.b   ($4a,A6)
02073A: 422E 006D                  clr.b   ($6d,A6)
02073E: 422E 0078                  clr.b   ($78,A6)
020742: 422E 006C                  clr.b   ($6c,A6)
020746: 0C2E 000E 0005             cmpi.b  #$e, ($5,A6)
02074C: 6700 007C                  beq     $207ca
020750: 0C2E 000F 0005             cmpi.b  #$f, ($5,A6)
020756: 6700 0072                  beq     $207ca
02075A: 6100 023E                  bsr     $2099a
02075E: 06AE 0000 0010 0056        addi.l  #$10, ($56,A6)
020766: 422D 04DC                  clr.b   ($4dc,A5)
02076A: 3B7C 12D6 0028             move.w  #$12d6, ($28,A5)
020770: 0C2D 0006 04D9             cmpi.b  #$6, ($4d9,A5)
020776: 6652                       bne     $207ca
020778: 0C2D 0001 0786             cmpi.b  #$1, ($786,A5)
02077E: 6636                       bne     $207b6
020780: 1B7C 0001 04DC             move.b  #$1, ($4dc,A5)
020786: 422D 07B6                  clr.b   ($7b6,A5)
02078A: 3B7C 06D6 0028             move.w  #$6d6, ($28,A5)
020790: 303C 0000                  move.w  #$0, D0
020794: 323C 0100                  move.w  #$100, D1
020798: 3A3C 0001                  move.w  #$1, D5
02079C: 4EB9 0002 05C6             jsr     $205c6.l
0207A2: 303C 0100                  move.w  #$100, D0
0207A6: 323C 0100                  move.w  #$100, D1
0207AA: 3A3C 0002                  move.w  #$2, D5
0207AE: 4EB9 0002 05C6             jsr     $205c6.l
0207B4: 6014                       bra     $207ca
0207B6: 0C2D 0002 0786             cmpi.b  #$2, ($786,A5)
0207BC: 660C                       bne     $207ca
0207BE: 4EB9 0000 0B52             jsr     $b52.l
0207C4: 4EB9 0001 62AE             jsr     $162ae.l
0207CA: 7000                       moveq   #$0, D0
0207CC: 102D 04D9                  move.b  ($4d9,A5), D0
0207D0: E548                       lsl.w   #2, D0
0207D2: 207C 0002 1580             movea.l #$21580, A0
0207D8: 2070 0000                  movea.l (A0,D0.w), A0
0207DC: 102D 0786                  move.b  ($786,A5), D0
0207E0: 3200                       move.w  D0, D1
0207E2: D040                       add.w   D0, D0
0207E4: E749                       lsl.w   #3, D1
0207E6: D041                       add.w   D1, D0
0207E8: D0C0                       adda.w  D0, A0
0207EA: 2B48 0844                  move.l  A0, ($844,A5)
0207EE: 1D68 0000 0040             move.b  ($0,A0), ($40,A6)
0207F4: 1D68 0001 0041             move.b  ($1,A0), ($41,A6)
0207FA: 2D68 0002 0042             move.l  ($2,A0), ($42,A6)
020800: 3D68 0006 0046             move.w  ($6,A0), ($46,A6)
020806: 3D68 0008 0048             move.w  ($8,A0), ($48,A6)
02080C: 0C2E 000E 0005             cmpi.b  #$e, ($5,A6)
020812: 6D08                       blt     $2081c
020814: 0C2E 0010 0005             cmpi.b  #$10, ($5,A6)
02081A: 4E71                       nop
02081C: 3D6E 0046 0008             move.w  ($46,A6), ($8,A6)
020822: 3D6E 0048 000C             move.w  ($48,A6), ($c,A6)
020828: 600C                       bra     $20836
02082A: 3D6E 0008 0046             move.w  ($8,A6), ($46,A6)
020830: 3D6E 000C 0048             move.w  ($c,A6), ($48,A6)
020836: 4EB9 0000 0B6C             jsr     $b6c.l
02083C: 4EB9 0000 0B88             jsr     $b88.l
020842: 302E 0046                  move.w  ($46,A6), D0
020846: 322E 0048                  move.w  ($48,A6), D1
02084A: 4A40                       tst.w   D0
02084C: 6708                       beq     $20856
02084E: 7E12                       moveq   #$12, D7
020850: 0440 0020                  subi.w  #$20, D0
020854: 601E                       bra     $20874
020856: 48E7 C000                  movem.l D0-D1, -(A7)
02085A: 6100 0C64                  bsr     $214c0
02085E: D1FC 0000 0BC8             adda.l  #$bc8, A0
020864: 6100 0C8A                  bsr     $214f0
020868: 4EB9 0002 0520             jsr     $20520.l
02086E: 4CDF 0003                  movem.l (A7)+, D0-D1
020872: 7E10                       moveq   #$10, D7
020874: 0641 0140                  addi.w  #$140, D1
020878: 6100 0C46                  bsr     $214c0
02087C: 6100 0C72                  bsr     $214f0
020880: 6100 0CAA                  bsr     $2152c
020884: 780D                       moveq   #$d, D4
020886: 6100 0B70                  bsr     $213f8
02088A: 0640 0020                  addi.w  #$20, D0
02088E: 322E 0048                  move.w  ($48,A6), D1
020892: 51CF FFE0                  dbra    D7, $20874
020896: 4E75                       rts
020898: 0C2D 0004 04D9             cmpi.b  #$4, ($4d9,A5)
02089E: 6604                       bne     $208a4
0208A0: 6100 00B4                  bsr     $20956
0208A4: 0C2D 0007 04D9             cmpi.b  #$7, ($4d9,A5)
0208AA: 6604                       bne     $208b0
0208AC: 6100 00CE                  bsr     $2097c
0208B0: 0C2E 000E 0005             cmpi.b  #$e, ($5,A6)
0208B6: 6700 0060                  beq     $20918
0208BA: 0C2E 000F 0005             cmpi.b  #$f, ($5,A6)
0208C0: 6700 0056                  beq     $20918
0208C4: 0C2E 0001 0005             cmpi.b  #$1, ($5,A6)
0208CA: 674C                       beq     $20918
0208CC: 0C2E 0012 0005             cmpi.b  #$12, ($5,A6)
0208D2: 6744                       beq     $20918
0208D4: 0C2E 0009 0005             cmpi.b  #$9, ($5,A6)
0208DA: 673C                       beq     $20918
0208DC: 286E 0056                  movea.l ($56,A6), A4
0208E0: 4A2E 0079                  tst.b   ($79,A6)
0208E4: 661C                       bne     $20902
0208E6: 0C2D 0006 04D9             cmpi.b  #$6, ($4d9,A5)
0208EC: 6608                       bne     $208f6
0208EE: 0C2E 0001 004A             cmpi.b  #$1, ($4a,A6)
0208F4: 670C                       beq     $20902
0208F6: 302C 0000                  move.w  ($0,A4), D0
0208FA: B06E 0008                  cmp.w   ($8,A6), D0
0208FE: 6218                       bhi     $20918
020900: 600A                       bra     $2090c
020902: 302C 0002                  move.w  ($2,A4), D0
020906: B06E 000C                  cmp.w   ($c,A6), D0
02090A: 650C                       bcs     $20918
02090C: 6100 00B2                  bsr     $209c0
020910: 06AE 0000 0010 0056        addi.l  #$10, ($56,A6)
020918: 6100 0172                  bsr     $20a8c
02091C: 7000                       moveq   #$0, D0
02091E: 102E 0005                  move.b  ($5,A6), D0
020922: D040                       add.w   D0, D0
020924: 303B 0008                  move.w  ($8,PC,D0.w), D0
020928: 4EBB 0004                  jsr     ($4,PC,D0.w)
02092C: 4E75                       rts
02092E: 00EA                       dc.w    $00ea; ILLEGAL
020930: 02C6                       dc.w    $02c6; ILLEGAL
020932: 0664 06DE                  addi.w  #$6de, -(A4)
020936: 0758                       bchg    D3, (A0)+
020938: 07B2 0478                  bclr    D3, INVALID 32
02093C: 0880 054A                  bclr    #$4a, D0
020940: 08E0 05CA                  bset    #$ca, -(A0)
020944: 05E4                       bset    D2, -(A4)
020946: 064A                       dc.w    $064a; ILLEGAL
020948: 05A6                       bclr    D2, -(A6)
02094A: 0940                       bchg    D4, D0
02094C: 0940                       bchg    D4, D0
02094E: 04BC                       dc.w    $04bc; ILLEGAL
020950: 0938 03D0                  btst    D4, $3d0.w
020954: 04F2                       dc.w    $04f2; ILLEGAL
020956: 532E 0071                  subq.b  #1, ($71,A6)
02095A: 6618                       bne     $20974
02095C: 1D7C 0008 0071             move.b  #$8, ($71,A6)
020962: 582E 0072                  addq.b  #4, ($72,A6)
020966: 0C2E 0010 0072             cmpi.b  #$10, ($72,A6)
02096C: 6604                       bne     $20972
02096E: 422E 0072                  clr.b   ($72,A6)
020972: 4E75                       rts
020974: 1D6E 0072 0073             move.b  ($72,A6), ($73,A6)
02097A: 4E75                       rts
02097C: 532E 0075                  subq.b  #1, ($75,A6)
020980: 66F2                       bne     $20974
020982: 1D7C 0018 0075             move.b  #$18, ($75,A6)
020988: 582E 0072                  addq.b  #4, ($72,A6)
02098C: 0C2E 0010 0072             cmpi.b  #$10, ($72,A6)
020992: 6604                       bne     $20998
020994: 422E 0072                  clr.b   ($72,A6)
020998: 4E75                       rts
02099A: 7000                       moveq   #$0, D0
02099C: 102D 04D9                  move.b  ($4d9,A5), D0
0209A0: D040                       add.w   D0, D0
0209A2: 287C 0002 1B2A             movea.l #$21b2a, A4
0209A8: 3034 0000                  move.w  (A4,D0.w), D0
0209AC: 49F4 0000                  lea     (A4,D0.w), A4
0209B0: 7000                       moveq   #$0, D0
0209B2: 102E 006C                  move.b  ($6c,A6), D0
0209B6: E948                       lsl.w   #4, D0
0209B8: D8C0                       adda.w  D0, A4
0209BA: 2D4C 0056                  move.l  A4, ($56,A6)
0209BE: 4E71                       nop
0209C0: 3D6C 0000 004C             move.w  ($0,A4), ($4c,A6)	*场景X坐标
0209C6: 3D6C 0002 004E             move.w  ($2,A4), ($4e,A6)	*场景高度
0209CC: 3D6C 0004 0050             move.w  ($4,A4), ($50,A6)
0209D2: 3D6C 0006 0052             move.w  ($6,A4), ($52,A6)
0209D8: 3D6C 0008 0054             move.w  ($8,A4), ($54,A6)
0209DE: 1D6C 000A 004A             move.b  ($a,A4), ($4a,A6)
0209E4: 1D6C 000B 0005             move.b  ($b,A4), ($5,A6)		*04表示小场景，08表示场景过后有自动行走程序，06表示关底,01表示进入下一场景
0209EA: 426E 0006                  clr.w   ($6,A6)
0209EE: 1D6C 000C 004B             move.b  ($c,A4), ($4b,A6)
0209F4: 1D6C 000D 0070             move.b  ($d,A4), ($70,A6)
0209FA: 1D6C 000F 0079             move.b  ($f,A4), ($79,A6)
020A00: 3D6C 0000 005A             move.w  ($0,A4), ($5a,A6)
020A06: 1D6C 000E 007B             move.b  ($e,A4), ($7b,A6)
020A0C: 3D6E 000C 005C             move.w  ($c,A6), ($5c,A6)
020A12: 522E 006C                  addq.b  #1, ($6c,A6)
020A16: 4E75                       rts
020A18: 6108                       bsr     $20a22
020A1A: 6100 014C                  bsr     $20b68
020A1E: 6000 084E                  bra     $2126e
020A22: 6100 0128                  bsr     $20b4c
020A26: 3D6E 0008 0014             move.w  ($8,A6), ($14,A6)
020A2C: 302E 0060                  move.w  ($60,A6), D0
020A30: 906E 0008                  sub.w   ($8,A6), D0
020A34: 0C40 0040                  cmpi.w  #$40, D0
020A38: 6E02                       bgt     $20a3c
020A3A: 602C                       bra     $20a68
020A3C: B06E 0050                  cmp.w   ($50,A6), D0
020A40: 6526                       bcs     $20a68
020A42: 322E 0060                  move.w  ($60,A6), D1
020A46: 926E 0064                  sub.w   ($64,A6), D1
020A4A: 342E 0050                  move.w  ($50,A6), D2
020A4E: 0442 0010                  subi.w  #$10, D2
020A52: B242                       cmp.w   D2, D1
020A54: 6414                       bcc     $20a6a
020A56: 906E 0050                  sub.w   ($50,A6), D0
020A5A: 0C40 0006                  cmpi.w  #$6, D0
020A5E: 6F04                       ble     $20a64
020A60: 303C 0006                  move.w  #$6, D0
020A64: D16E 0008                  add.w   D0, ($8,A6)
020A68: 4E75                       rts
020A6A: 302E 0064                  move.w  ($64,A6), D0
020A6E: 0440 0010                  subi.w  #$10, D0
020A72: 906E 0008                  sub.w   ($8,A6), D0
020A76: 0C40 0006                  cmpi.w  #$6, D0
020A7A: 6F04                       ble     $20a80
020A7C: 303C 0006                  move.w  #$6, D0
020A80: 4A40                       tst.w   D0
020A82: 6A02                       bpl     $20a86
020A84: 4240                       clr.w   D0
020A86: D16E 0008                  add.w   D0, ($8,A6)
020A8A: 4E75                       rts
020A8C: 303C 0000                  move.w  #$0, D0
020A90: 323C FFFF                  move.w  #$ffff, D1
020A94: 343C 0000                  move.w  #$0, D2
020A98: 363C FFFF                  move.w  #$ffff, D3
020A9C: 41F9 00FF B274             lea     $ffb274.l, A0
020AA2: 6100 004E                  bsr     $20af2
020AA6: 41F9 00FF B3F4             lea     $ffb3f4.l, A0
020AAC: 6100 0044                  bsr     $20af2
020AB0: 41F9 00FF B574             lea     $ffb574.l, A0
020AB6: 6100 003A                  bsr     $20af2
020ABA: B26E 0008                  cmp.w   ($8,A6), D1
020ABE: 6C0A                       bge     $20aca
020AC0: 3A2E 0008                  move.w  ($8,A6), D5
020AC4: 0645 0010                  addi.w  #$10, D5
020AC8: 3205                       move.w  D5, D1
020ACA: 182D 3274                  move.b  ($3274,A5), D4
020ACE: 882D 33F4                  or.b    ($33f4,A5), D4
020AD2: 882D 3574                  or.b    ($3574,A5), D4
020AD6: 6718                       beq     $20af0
020AD8: 3D40 0060                  move.w  D0, ($60,A6)
020ADC: 3D42 0062                  move.w  D2, ($62,A6)
020AE0: 3D43 0066                  move.w  D3, ($66,A6)
020AE4: 4A41                       tst.w   D1
020AE6: 6A04                       bpl     $20aec
020AE8: 323C 0010                  move.w  #$10, D1
020AEC: 3D41 0064                  move.w  D1, ($64,A6)
020AF0: 4E75                       rts
020AF2: 4A28 0000                  tst.b   ($0,A0)
020AF6: 672E                       beq     $20b26
020AF8: 4A28 0004                  tst.b   ($4,A0)
020AFC: 6728                       beq     $20b26
020AFE: 3828 0054                  move.w  ($54,A0), D4
020B02: D868 0010                  add.w   ($10,A0), D4
020B06: B444                       cmp.w   D4, D2
020B08: 6402                       bcc     $20b0c
020B0A: 3404                       move.w  D4, D2
020B0C: B644                       cmp.w   D4, D3
020B0E: 6302                       bls     $20b12
020B10: 3604                       move.w  D4, D3
020B12: B068 0008                  cmp.w   ($8,A0), D0
020B16: 6404                       bcc     $20b1c
020B18: 3028 0008                  move.w  ($8,A0), D0
020B1C: B268 0008                  cmp.w   ($8,A0), D1
020B20: 6304                       bls     $20b26
020B22: 3228 0008                  move.w  ($8,A0), D1
020B26: 4E75                       rts
020B28: 422E 005E                  clr.b   ($5e,A6)
020B2C: 4A2D 3274                  tst.b   ($3274,A5)
020B30: 6704                       beq     $20b36
020B32: 522E 005E                  addq.b  #1, ($5e,A6)
020B36: 4A2D 33F4                  tst.b   ($33f4,A5)
020B3A: 6704                       beq     $20b40
020B3C: 522E 005E                  addq.b  #1, ($5e,A6)
020B40: 4A2D 3574                  tst.b   ($3574,A5)
020B44: 6704                       beq     $20b4a
020B46: 522E 005E                  addq.b  #1, ($5e,A6)
020B4A: 4E75                       rts
020B4C: 4A2E 0070                  tst.b   ($70,A6)
020B50: 660E                       bne     $20b60
020B52: 7000                       moveq   #$0, D0
020B54: 102D 04EF                  move.b  ($4ef,A5), D0
020B58: D040                       add.w   D0, D0
020B5A: 3D7B 0006 0050             move.w  ($6,PC,D0.w), ($50,A6)
020B60: 4E75                       rts
020B62: 00C0                       dc.w    $00c0; ILLEGAL
020B64: 00E8                       dc.w    $00e8; ILLEGAL
020B66: 00E8                       dc.w    $00e8; ILLEGAL
020B68: 4A2E 004B                  tst.b   ($4b,A6)
020B6C: 6700 0084                  beq     $20bf2
020B70: 3D6E 000C 0016             move.w  ($c,A6), ($16,A6)
020B76: 302E 0066                  move.w  ($66,A6), D0
020B7A: 906E 000C                  sub.w   ($c,A6), D0
020B7E: B06E 0054                  cmp.w   ($54,A6), D0
020B82: 6232                       bhi     $20bb6
020B84: 322E 0062                  move.w  ($62,A6), D1
020B88: 926E 000C                  sub.w   ($c,A6), D1
020B8C: 0C41 00A0                  cmpi.w  #$a0, D1
020B90: 6C00 0060                  bge     $20bf2
020B94: 906E 0054                  sub.w   ($54,A6), D0
020B98: 3200                       move.w  D0, D1
020B9A: 6100 0752                  bsr     $212ee
020B9E: 0C40 0006                  cmpi.w  #$6, D0
020BA2: 6F06                       ble     $20baa
020BA4: 323C 0006                  move.w  #$6, D1
020BA8: 4441                       neg.w   D1
020BAA: D36E 000C                  add.w   D1, ($c,A6)
020BAE: 6A04                       bpl     $20bb4
020BB0: 426E 000C                  clr.w   ($c,A6)
020BB4: 603C                       bra     $20bf2
020BB6: 302E 0062                  move.w  ($62,A6), D0
020BBA: 906E 000C                  sub.w   ($c,A6), D0
020BBE: B06E 0052                  cmp.w   ($52,A6), D0
020BC2: 6D2E                       blt     $20bf2
020BC4: 322E 0066                  move.w  ($66,A6), D1
020BC8: 926E 000C                  sub.w   ($c,A6), D1
020BCC: 0C41 0010                  cmpi.w  #$10, D1
020BD0: 6F20                       ble     $20bf2
020BD2: 906E 0052                  sub.w   ($52,A6), D0
020BD6: 3200                       move.w  D0, D1
020BD8: 6100 0714                  bsr     $212ee
020BDC: 0C40 0006                  cmpi.w  #$6, D0
020BE0: 6F06                       ble     $20be8
020BE2: 323C 0006                  move.w  #$6, D1
020BE6: 4441                       neg.w   D1
020BE8: D36E 000C                  add.w   D1, ($c,A6)
020BEC: 6A04                       bpl     $20bf2
020BEE: 426E 000C                  clr.w   ($c,A6)
020BF2: 4E75                       rts
020BF4: 7000                       moveq   #$0, D0
020BF6: 102E 0006                  move.b  ($6,A6), D0
020BFA: 303B 0006                  move.w  ($6,PC,D0.w), D0
020BFE: 4EFB 0002                  jmp     ($2,PC,D0.w)
020C02: 000A                       dc.w    $000a; ILLEGAL
020C04: 0030 0068 00BE             ori.b   #$68, (-$42,A0,D0.w)
020C0A: 00E4                       dc.w    $00e4; ILLEGAL
020C0C: 542E 0006                  addq.b  #2, ($6,A6)
020C10: 1D7C 0001 0078             move.b  #$1, ($78,A6)
020C16: 422E 006D                  clr.b   ($6d,A6)
020C1A: 4A2D 04DC                  tst.b   ($4dc,A5)
020C1E: 6712                       beq     $20c32
020C20: 303C 0087                  move.w  #$87, D0
020C24: 223C 0000 0010             move.l  #$10, D1
020C2A: 7400                       moveq   #$0, D2
020C2C: 4EB9 0000 A63C             jsr     $a63c.l
020C32: 6100 FF34                  bsr     $20b68
020C36: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
020C3C: 4A2E 006D                  tst.b   ($6d,A6)
020C40: 6700 0074                  beq     $20cb6
020C44: 542E 0006                  addq.b  #2, ($6,A6)
020C48: 4EB9 0000 A5EA             jsr     $a5ea.l
020C4E: 3B7C 0002 044C             move.w  #$2, ($44c,A5)
020C54: 1B7C 000F 044A             move.b  #$f, ($44a,A5)
020C5A: 41F9 0000 8840             lea     $8840.l, A0
020C60: 303C 0040                  move.w  #$40, D0
020C64: 4EF9 0000 08CE             jmp     $8ce.l
020C6A: 4A2D 044A                  tst.b   ($44a,A5)
020C6E: 6600 0046                  bne     $20cb6
020C72: 422E 0078                  clr.b   ($78,A6)
020C76: 286E 0056                  movea.l ($56,A6), A4
020C7A: 4A6C 0000                  tst.w   ($0,A4)
020C7E: 670E                       beq     $20c8e
020C80: 06AE 0000 0010 0056        addi.l  #$10, ($56,A6)
020C88: 522E 006C                  addq.b  #1, ($6c,A6)
020C8C: 60E8                       bra     $20c76
020C8E: 1D6C 000A 004A             move.b  ($a,A4), ($4a,A6)
020C94: 4EB9 0000 ACD0             jsr     $acd0.l
020C9A: 4DED 073C                  lea     ($73c,A5), A6
020C9E: 4EB9 0000 8A44             jsr     $8a44.l
020CA4: 422D 07E0                  clr.b   ($7e0,A5)
020CA8: 6100 FABC                  bsr     $20766
020CAC: 542E 0006                  addq.b  #2, ($6,A6)
020CB0: 4EB9 0001 2BE4             jsr     $12be4.l
020CB6: 4DED 073C                  lea     ($73c,A5), A6
020CBA: 422E 006D                  clr.b   ($6d,A6)
020CBE: 4E75                       rts
020CC0: 542E 0006                  addq.b  #2, ($6,A6)
020CC4: 4EB9 0001 62AE             jsr     $162ae.l
020CCA: 3B7C 0002 044C             move.w  #$2, ($44c,A5)
020CD0: 1B7C 000F 044A             move.b  #$f, ($44a,A5)
020CD6: 41F9 0000 8824             lea     $8824.l, A0
020CDC: 303C 0040                  move.w  #$40, D0
020CE0: 4EF9 0000 08CE             jmp     $8ce.l
020CE6: 4A2E 006D                  tst.b   ($6d,A6)
020CEA: 6610                       bne     $20cfc
020CEC: 6100 FCAC                  bsr     $2099a
020CF0: 06AE 0000 0010 0056        addi.l  #$10, ($56,A6)
020CF8: 422E 0006                  clr.b   ($6,A6)
020CFC: 4E75                       rts
020CFE: 7000                       moveq   #$0, D0
020D00: 102E 0006                  move.b  ($6,A6), D0
020D04: 303B 0006                  move.w  ($6,PC,D0.w), D0
020D08: 4EFB 0002                  jmp     ($2,PC,D0.w)
020D0C: 0008                       dc.w    $0008; ILLEGAL
020D0E: 0016 002E                  ori.b   #$2e, (A6)
020D12: 007C 542E                  ori     #$542e, SR
020D16: 0006 1D7C                  ori.b   #$7c, D6
020D1A: 0001 0078                  ori.b   #$78, D1
020D1E: 422E 006D                  clr.b   ($6d,A6)
020D22: 6100 FE44                  bsr     $20b68
020D26: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
020D2C: 4A2E 006D                  tst.b   ($6d,A6)
020D30: 6700 004C                  beq     $20d7e
020D34: 542E 0006                  addq.b  #2, ($6,A6)
020D38: 4E75                       rts
020D3A: 422E 0078                  clr.b   ($78,A6)
020D3E: 286E 0056                  movea.l ($56,A6), A4
020D42: 4A6C 0000                  tst.w   ($0,A4)
020D46: 670E                       beq     $20d56
020D48: 06AE 0000 0010 0056        addi.l  #$10, ($56,A6)
020D50: 522E 006C                  addq.b  #1, ($6c,A6)
020D54: 60E8                       bra     $20d3e
020D56: 1D6C 000A 004A             move.b  ($a,A4), ($4a,A6)
020D5C: 4EB9 0000 ACD0             jsr     $acd0.l
020D62: 4DED 073C                  lea     ($73c,A5), A6
020D66: 4EB9 0000 8A44             jsr     $8a44.l
020D6C: 422D 07E0                  clr.b   ($7e0,A5)
020D70: 6100 F9F4                  bsr     $20766
020D74: 542E 0006                  addq.b  #2, ($6,A6)
020D78: 4EB9 0001 2BE4             jsr     $12be4.l
020D7E: 4DED 073C                  lea     ($73c,A5), A6
020D82: 422E 006D                  clr.b   ($6d,A6)
020D86: 4E75                       rts
020D88: 4A2E 006D                  tst.b   ($6d,A6)
020D8C: 6616                       bne     $20da4
020D8E: 6100 FC0A                  bsr     $2099a
020D92: 06AE 0000 0010 0056        addi.l  #$10, ($56,A6)
020D9A: 422E 0006                  clr.b   ($6,A6)
020D9E: 4EF9 0000 892C             jmp     $892c.l
020DA4: 4E75                       rts
020DA6: 7000                       moveq   #$0, D0
020DA8: 102E 0006                  move.b  ($6,A6), D0
020DAC: 303B 0006                  move.w  ($6,PC,D0.w), D0
020DB0: 4EFB 0002                  jmp     ($2,PC,D0.w)
020DB4: 0006 0014                  ori.b   #$14, D6
020DB8: 0034 542E 0006             ori.b   #$2e, ($6,A4,D0.w)
020DBE: 1D7C 0002 0078             move.b  #$2, ($78,A6)
020DC4: 422E 006D                  clr.b   ($6d,A6)
020DC8: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
020DCE: 4A2E 006D                  tst.b   ($6d,A6)
020DD2: 6700 0014                  beq     $20de8
020DD6: 1B7C 0001 04D4             move.b  #$1, ($4d4,A5)
020DDC: 4E75                       rts
020DDE: 542E 0006                  addq.b  #2, ($6,A6)
020DE2: 4EB9 0000 A5EA             jsr     $a5ea.l
020DE8: 4E75                       rts
020DEA: 7000                       moveq   #$0, D0
020DEC: 102E 0006                  move.b  ($6,A6), D0
020DF0: 303B 0006                  move.w  ($6,PC,D0.w), D0
020DF4: 4EFB 0002                  jmp     ($2,PC,D0.w)
020DF8: 0004 000C                  ori.b   #$c, D4
020DFC: 542E 0006                  addq.b  #2, ($6,A6)
020E00: 422E 006D                  clr.b   ($6d,A6)
020E04: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
020E0A: 4A2E 006D                  tst.b   ($6d,A6)
020E0E: 670A                       beq     $20e1a
020E10: 1B7C 0001 04D4             move.b  #$1, ($4d4,A5)
020E16: 422E 0005                  clr.b   ($5,A6)
020E1A: 422E 006D                  clr.b   ($6d,A6)
020E1E: 4E75                       rts
020E20: 7000                       moveq   #$0, D0
020E22: 102E 0006                  move.b  ($6,A6), D0
020E26: 303B 0006                  move.w  ($6,PC,D0.w), D0
020E2A: 4EFB 0002                  jmp     ($2,PC,D0.w)
020E2E: 0006 0014                  ori.b   #$14, D6
020E32: 0048                       dc.w    $0048; ILLEGAL
020E34: 542E 0006                  addq.b  #2, ($6,A6)
020E38: 1D7C 0002 0078             move.b  #$2, ($78,A6)
020E3E: 422E 006D                  clr.b   ($6d,A6)
020E42: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
020E48: 4A2E 006D                  tst.b   ($6d,A6)
020E4C: 6700 0028                  beq     $20e76
020E50: 1B7C 0001 04D4             move.b  #$1, ($4d4,A5)
020E56: 542E 0006                  addq.b  #2, ($6,A6)
020E5A: 3B7C 0002 044C             move.w  #$2, ($44c,A5)
020E60: 1B7C 000D 044A             move.b  #$d, ($44a,A5)
020E66: 41F9 0000 8840             lea     $8840.l, A0
020E6C: 303C 0040                  move.w  #$40, D0
020E70: 4EF9 0000 08CE             jmp     $8ce.l
020E76: 4E75                       rts
020E78: 4A2E 0006                  tst.b   ($6,A6)
020E7C: 6614                       bne     $20e92
020E7E: 542E 0006                  addq.b  #2, ($6,A6)
020E82: 422E 006D                  clr.b   ($6d,A6)
020E86: 1D7C 0001 0078             move.b  #$1, ($78,A6)
020E8C: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
020E92: 4A2E 006D                  tst.b   ($6d,A6)
020E96: 6736                       beq     $20ece
020E98: 422E 0078                  clr.b   ($78,A6)
020E9C: 522E 004A                  addq.b  #1, ($4a,A6)
020EA0: 422E 0005                  clr.b   ($5,A6)
020EA4: 4EB9 0000 8E4C             jsr     $8e4c.l
020EAA: 1B7C 0001 044A             move.b  #$1, ($44a,A5)
020EB0: 4EB9 0000 8932             jsr     $8932.l
020EB6: 4EB9 0000 AAE2             jsr     $aae2.l
020EBC: 4EB9 0001 031A             jsr     $1031a.l
020EC2: 4EB9 0000 ACE0             jsr     $ace0.l
020EC8: 4EB9 0009 236C             jsr     $9236c.l
020ECE: 422E 006D                  clr.b   ($6d,A6)
020ED2: 4E75                       rts
020ED4: 6100 FB4C                  bsr     $20a22
020ED8: 302E 0008                  move.w  ($8,A6), D0
020EDC: 906E 005A                  sub.w   ($5a,A6), D0
020EE0: E248                       lsr.w   #1, D0
020EE2: D06E 005C                  add.w   ($5c,A6), D0
020EE6: B06E 004E                  cmp.w   ($4e,A6), D0
020EEA: 6F04                       ble     $20ef0
020EEC: 302E 004E                  move.w  ($4e,A6), D0
020EF0: 3D40 000C                  move.w  D0, ($c,A6)
020EF4: 6000 0378                  bra     $2126e
020EF8: 6100 FB28                  bsr     $20a22
020EFC: 302E 0008                  move.w  ($8,A6), D0
020F00: 906E 005A                  sub.w   ($5a,A6), D0
020F04: E448                       lsr.w   #2, D0
020F06: D06E 005C                  add.w   ($5c,A6), D0
020F0A: 3D40 000C                  move.w  D0, ($c,A6)
020F0E: 6000 035E                  bra     $2126e
020F12: 6100 FB0E                  bsr     $20a22
020F16: 302E 0008                  move.w  ($8,A6), D0
020F1A: 906E 005A                  sub.w   ($5a,A6), D0
020F1E: 6100 0022                  bsr     $20f42
020F22: 7400                       moveq   #$0, D2
020F24: 142E 0074                  move.b  ($74,A6), D2
020F28: E468                       lsr.w   D2, D0
020F2A: 322E 005C                  move.w  ($5c,A6), D1
020F2E: 9240                       sub.w   D0, D1
020F30: B26E 004E                  cmp.w   ($4e,A6), D1
020F34: 6C04                       bge     $20f3a
020F36: 322E 004E                  move.w  ($4e,A6), D1
020F3A: 3D41 000C                  move.w  D1, ($c,A6)
020F3E: 6000 032E                  bra     $2126e
020F42: 7200                       moveq   #$0, D1
020F44: 122D 04D9                  move.b  ($4d9,A5), D1
020F48: D241                       add.w   D1, D1
020F4A: D241                       add.w   D1, D1
020F4C: D22D 0786                  add.b   ($786,A5), D1
020F50: 1D7B 1006 0074             move.b  ($6,PC,D1.w), ($74,A6)
020F56: 4E75                       rts
020F58: 0100                       btst    D0, D0
020F5A: 0000 0000                  ori.b   #$0, D0
020F5E: 0000 0000                  ori.b   #$0, D0
020F62: 0000 0000                  ori.b   #$0, D0
020F66: 0000 0000                  ori.b   #$0, D0
020F6A: 0000 0000                  ori.b   #$0, D0
020F6E: 0200 0000                  andi.b  #$0, D0
020F72: 0000 0000                  ori.b   #$0, D0
020F76: 0200 6100                  andi.b  #$0, D0
020F7A: FAA8                       dc.w    $faa8; opcode 1111
020F7C: 0C6E 0750 0060             cmpi.w  #$750, ($60,A6)
020F82: 6D0A                       blt     $20f8e
020F84: 536E 000C                  subq.w  #1, ($c,A6)
020F88: 6A04                       bpl     $20f8e
020F8A: 426E 000C                  clr.w   ($c,A6)
020F8E: 6000 02DE                  bra     $2126e
020F92: 6100 FA8E                  bsr     $20a22
020F96: 6100 FBD0                  bsr     $20b68
020F9A: 302E 0062                  move.w  ($62,A6), D0
020F9E: 0440 00A0                  subi.w  #$a0, D0
020FA2: B06E 000C                  cmp.w   ($c,A6), D0
020FA6: 6D0A                       blt     $20fb2
020FA8: 3D40 000C                  move.w  D0, ($c,A6)
020FAC: 3D6E 0014 0008             move.w  ($14,A6), ($8,A6)
020FB2: 302E 0008                  move.w  ($8,A6), D0
020FB6: 906E 005A                  sub.w   ($5a,A6), D0
020FBA: 322E 005C                  move.w  ($5c,A6), D1
020FBE: 926E 000C                  sub.w   ($c,A6), D1
020FC2: B041                       cmp.w   D1, D0
020FC4: 6C02                       bge     $20fc8
020FC6: 3001                       move.w  D1, D0
020FC8: 342E 005A                  move.w  ($5a,A6), D2
020FCC: 362E 005C                  move.w  ($5c,A6), D3
020FD0: D440                       add.w   D0, D2
020FD2: 3D42 0008                  move.w  D2, ($8,A6)
020FD6: 9640                       sub.w   D0, D3
020FD8: 302E 0062                  move.w  ($62,A6), D0
020FDC: 0440 00A0                  subi.w  #$a0, D0
020FE0: B043                       cmp.w   D3, D0
020FE2: 6D12                       blt     $20ff6
020FE4: 3600                       move.w  D0, D3
020FE6: 3203                       move.w  D3, D1
020FE8: 302E 005C                  move.w  ($5c,A6), D0
020FEC: 9041                       sub.w   D1, D0
020FEE: D06E 005A                  add.w   ($5a,A6), D0
020FF2: 3D40 0008                  move.w  D0, ($8,A6)
020FF6: B66E 004E                  cmp.w   ($4e,A6), D3
020FFA: 6C08                       bge     $21004
020FFC: 362E 004E                  move.w  ($4e,A6), D3
021000: 422E 0005                  clr.b   ($5,A6)
021004: 3D43 000C                  move.w  D3, ($c,A6)
021008: 6000 0264                  bra     $2126e
02100C: 6100 FA14                  bsr     $20a22
021010: 6100 FB56                  bsr     $20b68
021014: 302E 0066                  move.w  ($66,A6), D0
021018: 0440 0010                  subi.w  #$10, D0
02101C: B06E 000C                  cmp.w   ($c,A6), D0
021020: 6E0A                       bgt     $2102c
021022: 3D40 000C                  move.w  D0, ($c,A6)
021026: 3D6E 0014 0008             move.w  ($14,A6), ($8,A6)
02102C: 302E 0008                  move.w  ($8,A6), D0
021030: 906E 005A                  sub.w   ($5a,A6), D0
021034: 322E 000C                  move.w  ($c,A6), D1
021038: 926E 005C                  sub.w   ($5c,A6), D1
02103C: B041                       cmp.w   D1, D0
02103E: 6C02                       bge     $21042
021040: 3001                       move.w  D1, D0
021042: 342E 005A                  move.w  ($5a,A6), D2
021046: 362E 005C                  move.w  ($5c,A6), D3
02104A: D440                       add.w   D0, D2
02104C: 3D42 0008                  move.w  D2, ($8,A6)
021050: D640                       add.w   D0, D3
021052: 302E 0066                  move.w  ($66,A6), D0
021056: 0440 0010                  subi.w  #$10, D0
02105A: B043                       cmp.w   D3, D0
02105C: 6C10                       bge     $2106e
02105E: 3600                       move.w  D0, D3
021060: 322E 005C                  move.w  ($5c,A6), D1
021064: 9041                       sub.w   D1, D0
021066: D06E 005A                  add.w   ($5a,A6), D0
02106A: 3D40 0008                  move.w  D0, ($8,A6)
02106E: B66E 004E                  cmp.w   ($4e,A6), D3
021072: 6D08                       blt     $2107c
021074: 362E 004E                  move.w  ($4e,A6), D3
021078: 422E 0005                  clr.b   ($5,A6)
02107C: 3D43 000C                  move.w  D3, ($c,A6)
021080: 6000 01EC                  bra     $2126e
021084: 4E75                       rts
021086: 4A2E 0006                  tst.b   ($6,A6)
02108A: 6626                       bne     $210b2
02108C: 542E 0006                  addq.b  #2, ($6,A6)
021090: 422E 006D                  clr.b   ($6d,A6)
021094: 1D7C 0001 0078             move.b  #$1, ($78,A6)
02109A: 4A2D 04DC                  tst.b   ($4dc,A5)
02109E: 6712                       beq     $210b2
0210A0: 303C 0087                  move.w  #$87, D0
0210A4: 223C 0000 0010             move.l  #$10, D1
0210AA: 7400                       moveq   #$0, D2
0210AC: 4EB9 0000 A63C             jsr     $a63c.l
0210B2: 4A2E 0079                  tst.b   ($79,A6)
0210B6: 6608                       bne     $210c0
0210B8: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
0210BE: 6006                       bra     $210c6
0210C0: 3D6E 004E 000C             move.w  ($4e,A6), ($c,A6)
0210C6: 4A2E 006D                  tst.b   ($6d,A6)
0210CA: 670E                       beq     $210da
0210CC: 1D6E 007B 0005             move.b  ($7b,A6), ($5,A6)
0210D2: 422E 0006                  clr.b   ($6,A6)
0210D6: 422E 0078                  clr.b   ($78,A6)
0210DA: 422E 006D                  clr.b   ($6d,A6)
0210DE: 4E75                       rts
0210E0: 7000                       moveq   #$0, D0
0210E2: 102E 0006                  move.b  ($6,A6), D0
0210E6: 303B 0006                  move.w  ($6,PC,D0.w), D0
0210EA: 4EFB 0002                  jmp     ($2,PC,D0.w)
0210EE: 0008                       dc.w    $0008; ILLEGAL
0210F0: 0040 005C                  ori.w   #$5c, D0
0210F4: 0080 542E 0006             ori.l   #$542e0006, D0
0210FA: 303C 0086                  move.w  #$86, D0
0210FE: 223C 0000 0010             move.l  #$10, D1
021104: 7400                       moveq   #$0, D2
021106: 4EB9 0000 A63C             jsr     $a63c.l
02110C: 426E 0014                  clr.w   ($14,A6)
021110: 426E 001A                  clr.w   ($1a,A6)
021114: 3D7C FFD0 0016             move.w  #$ffd0, ($16,A6)
02111A: 3D7C FFFA 001C             move.w  #$fffa, ($1c,A6)
021120: 426E 0018                  clr.w   ($18,A6)
021124: 426E 001E                  clr.w   ($1e,A6)
021128: 1B7C 0002 755C             move.b  #$2, ($755c,A5)
02112E: 0C6E FA00 0016             cmpi.w  #-$600, ($16,A6)
021134: 6E00 000A                  bgt     $21140
021138: 542E 0006                  addq.b  #2, ($6,A6)
02113C: 6000 000C                  bra     $2114a
021140: 4EB9 0000 189C             jsr     $189c.l
021146: 6000 0022                  bra     $2116a
02114A: 5D6E 000C                  subq.w  #6, ($c,A6)
02114E: 286E 0056                  movea.l ($56,A6), A4
021152: 302C 0002                  move.w  ($2,A4), D0
021156: 0640 0300                  addi.w  #$300, D0
02115A: B06E 000C                  cmp.w   ($c,A6), D0
02115E: 6D00 000A                  blt     $2116a
021162: 446E 001C                  neg.w   ($1c,A6)
021166: 542E 0006                  addq.b  #2, ($6,A6)
02116A: 6000 0102                  bra     $2126e
02116E: 0C6E FFD0 0016             cmpi.w  #-$30, ($16,A6)
021174: 6D04                       blt     $2117a
021176: 426E 001C                  clr.w   ($1c,A6)
02117A: 0C6E FFFC 000C             cmpi.w  #-$4, ($c,A6)
021180: 6322                       bls     $211a4
021182: 426E 000C                  clr.w   ($c,A6)
021186: 1D7C 0001 0005             move.b  #$1, ($5,A6)
02118C: 426E 0006                  clr.w   ($6,A6)
021190: 303C 0087                  move.w  #$87, D0
021194: 223C 0000 0010             move.l  #$10, D1
02119A: 7400                       moveq   #$0, D2
02119C: 4EB9 0000 A63C             jsr     $a63c.l
0211A2: 4E75                       rts
0211A4: 4EB9 0000 189C             jsr     $189c.l
0211AA: 6000 00C2                  bra     $2126e
0211AE: 6100 0028                  bsr     $211d8
0211B2: 0640 0100                  addi.w  #$100, D0
0211B6: 906E 000C                  sub.w   ($c,A6), D0
0211BA: 906E 0054                  sub.w   ($54,A6), D0
0211BE: 6200 0014                  bhi     $211d4
0211C2: D16E 000C                  add.w   D0, ($c,A6)
0211C6: 0C6E 0100 000C             cmpi.w  #$100, ($c,A6)
0211CC: 6206                       bhi     $211d4
0211CE: 3D7C 0100 000C             move.w  #$100, ($c,A6)
0211D4: 6000 0098                  bra     $2126e
0211D8: 303C FFFF                  move.w  #$ffff, D0
0211DC: 4A2D 3274                  tst.b   ($3274,A5)
0211E0: 670A                       beq     $211ec
0211E2: B06D 3280                  cmp.w   ($3280,A5), D0
0211E6: 6504                       bcs     $211ec
0211E8: 302D 3280                  move.w  ($3280,A5), D0
0211EC: 4A2D 33F4                  tst.b   ($33f4,A5)
0211F0: 670A                       beq     $211fc
0211F2: B06D 3400                  cmp.w   ($3400,A5), D0
0211F6: 6504                       bcs     $211fc
0211F8: 302D 3400                  move.w  ($3400,A5), D0
0211FC: 4A2D 3574                  tst.b   ($3574,A5)
021200: 670A                       beq     $2120c
021202: B06D 3580                  cmp.w   ($3580,A5), D0
021206: 6504                       bcs     $2120c
021208: 302D 3580                  move.w  ($3580,A5), D0
02120C: 4E75                       rts
02120E: 0C2E 0004 0006             cmpi.b  #$4, ($6,A6)
021214: 6C10                       bge     $21226
021216: 4A2D 044A                  tst.b   ($44a,A5)
02121A: 670A                       beq     $21226
02121C: 596E 000C                  subq.w  #4, ($c,A6)
021220: 6A04                       bpl     $21226
021222: 426E 000C                  clr.w   ($c,A6)
021226: 7000                       moveq   #$0, D0
021228: 102E 0006                  move.b  ($6,A6), D0
02122C: 303B 000A                  move.w  ($a,PC,D0.w), D0
021230: 4EBB 0006                  jsr     ($6,PC,D0.w)
021234: 6000 0038                  bra     $2126e
021238: 0008                       dc.w    $0008; ILLEGAL
02123A: FA32                       dc.w    $fa32; opcode 1111
02123C: FA88                       dc.w    $fa88; opcode 1111
02123E: FAAE                       dc.w    $faae; opcode 1111
021240: 3D6E 004C 0008             move.w  ($4c,A6), ($8,A6)
021246: 542E 0006                  addq.b  #2, ($6,A6)
02124A: 3B7C 000C 044C             move.w  #$c, ($44c,A5)
021250: 1B7C 000F 044A             move.b  #$f, ($44a,A5)
021256: 41F9 0000 8840             lea     $8840.l, A0
02125C: 303C 0040                  move.w  #$40, D0
021260: 4EF9 0000 08CE             jmp     $8ce.l
021266: 566E 0008                  addq.w  #3, ($8,A6)
02126A: 6000 0002                  bra     $2126e
02126E: 302E 0008                  move.w  ($8,A6), D0
021272: 322E 0046                  move.w  ($46,A6), D1
021276: B240                       cmp.w   D0, D1
021278: 6406                       bcc     $21280
02127A: 6100 007E                  bsr     $212fa
02127E: 6004                       bra     $21284
021280: 6100 00A4                  bsr     $21326
021284: 302E 000C                  move.w  ($c,A6), D0
021288: 322E 0048                  move.w  ($48,A6), D1
02128C: B240                       cmp.w   D0, D1
02128E: 6408                       bcc     $21298
021290: 6100 00C4                  bsr     $21356
021294: 6000 0006                  bra     $2129c
021298: 6100 00EC                  bsr     $21386
02129C: 302E 0008                  move.w  ($8,A6), D0
0212A0: 906E 0046                  sub.w   ($46,A6), D0
0212A4: 6100 0048                  bsr     $212ee
0212A8: 0C40 0020                  cmpi.w  #$20, D0
0212AC: 6B16                       bmi     $212c4
0212AE: 302E 0008                  move.w  ($8,A6), D0
0212B2: 0800 0004                  btst    #$4, D0
0212B6: 6704                       beq     $212bc
0212B8: 0640 0010                  addi.w  #$10, D0
0212BC: 0240 FFE0                  andi.w  #$ffe0, D0
0212C0: 3D40 0046                  move.w  D0, ($46,A6)
0212C4: 302E 000C                  move.w  ($c,A6), D0
0212C8: 906E 0048                  sub.w   ($48,A6), D0
0212CC: 6100 0020                  bsr     $212ee
0212D0: 0C40 0020                  cmpi.w  #$20, D0
0212D4: 6B16                       bmi     $212ec
0212D6: 322E 000C                  move.w  ($c,A6), D1
0212DA: 0801 0004                  btst    #$4, D1
0212DE: 6704                       beq     $212e4
0212E0: 0641 0010                  addi.w  #$10, D1
0212E4: 0241 FFE0                  andi.w  #$ffe0, D1
0212E8: 3D41 0048                  move.w  D1, ($48,A6)
0212EC: 4E75                       rts
0212EE: 0800 000F                  btst    #$f, D0
0212F2: 6700 0004                  beq     $212f8
0212F6: 4440                       neg.w   D0
0212F8: 4E75                       rts
0212FA: 9041                       sub.w   D1, D0
0212FC: 0C40 0020                  cmpi.w  #$20, D0
021300: 6B22                       bmi     $21324
021302: 302E 0046                  move.w  ($46,A6), D0
021306: 0640 0200                  addi.w  #$200, D0
02130A: 322E 0048                  move.w  ($48,A6), D1
02130E: 0641 0180                  addi.w  #$180, D1
021312: 6100 01AC                  bsr     $214c0
021316: 6100 01D8                  bsr     $214f0
02131A: 6100 0210                  bsr     $2152c
02131E: 7811                       moveq   #$11, D4
021320: 6000 00D6                  bra     $213f8
021324: 4E75                       rts
021326: 9240                       sub.w   D0, D1
021328: 0C41 0020                  cmpi.w  #$20, D1
02132C: 6B26                       bmi     $21354
02132E: 302E 0046                  move.w  ($46,A6), D0
021332: 6700 0020                  beq     $21354
021336: 0440 0040                  subi.w  #$40, D0
02133A: 322E 0048                  move.w  ($48,A6), D1
02133E: 0641 0180                  addi.w  #$180, D1
021342: 6100 017C                  bsr     $214c0
021346: 6100 01A8                  bsr     $214f0
02134A: 6100 01E0                  bsr     $2152c
02134E: 7811                       moveq   #$11, D4
021350: 6000 00A6                  bra     $213f8
021354: 4E75                       rts
021356: 9041                       sub.w   D1, D0
021358: 0C40 0020                  cmpi.w  #$20, D0
02135C: 6B26                       bmi     $21384
02135E: 302E 0046                  move.w  ($46,A6), D0
021362: 322E 0048                  move.w  ($48,A6), D1
021366: 0440 0120                  subi.w  #$120, D0
02136A: 6A02                       bpl     $2136e
02136C: 4240                       clr.w   D0
02136E: 0641 0160                  addi.w  #$160, D1
021372: 6100 014C                  bsr     $214c0
021376: 6100 0178                  bsr     $214f0
02137A: 6100 01B0                  bsr     $2152c
02137E: 7819                       moveq   #$19, D4
021380: 6000 0036                  bra     $213b8
021384: 4E75                       rts
021386: 9240                       sub.w   D0, D1
021388: 0C41 0020                  cmpi.w  #$20, D1
02138C: 6B28                       bmi     $213b6
02138E: 302E 0046                  move.w  ($46,A6), D0
021392: 322E 0048                  move.w  ($48,A6), D1
021396: 0440 0120                  subi.w  #$120, D0
02139A: 6A02                       bpl     $2139e
02139C: 4240                       clr.w   D0
02139E: 0441 0080                  subi.w  #$80, D1
0213A2: 6B12                       bmi     $213b6
0213A4: 6100 011A                  bsr     $214c0
0213A8: 6100 0146                  bsr     $214f0
0213AC: 6100 017E                  bsr     $2152c
0213B0: 7819                       moveq   #$19, D4
0213B2: 6000 0004                  bra     $213b8
0213B6: 4E75                       rts
0213B8: 6100 0070                  bsr     $2142a
0213BC: 43E9 0010                  lea     ($10,A1), A1
0213C0: 41E8 0038                  lea     ($38,A0), A0
0213C4: 0640 0020                  addi.w  #$20, D0
0213C8: 3C00                       move.w  D0, D6
0213CA: 0246 03E0                  andi.w  #$3e0, D6
0213CE: 4A46                       tst.w   D6
0213D0: 6708                       beq     $213da
0213D2: 3E04                       move.w  D4, D7
0213D4: 6100 00EA                  bsr     $214c0
0213D8: 3807                       move.w  D7, D4
0213DA: 0246 00E0                  andi.w  #$e0, D6
0213DE: 4A46                       tst.w   D6
0213E0: 6610                       bne     $213f2
0213E2: 3C04                       move.w  D4, D6
0213E4: 6100 00DA                  bsr     $214c0
0213E8: 6100 0106                  bsr     $214f0
0213EC: 6100 013E                  bsr     $2152c
0213F0: 3806                       move.w  D6, D4
0213F2: 51CC FFC4                  dbra    D4, $213b8
0213F6: 4E75                       rts
0213F8: 6100 0030                  bsr     $2142a
0213FC: 5489                       addq.l  #2, A1
0213FE: 41E8 FFC0                  lea     (-$40,A0), A0
021402: 3C01                       move.w  D1, D6
021404: 4A41                       tst.w   D1
021406: 6720                       beq     $21428
021408: 0441 0020                  subi.w  #$20, D1
02140C: 0246 00E0                  andi.w  #$e0, D6
021410: 4A46                       tst.w   D6
021412: 6610                       bne     $21424
021414: 3C04                       move.w  D4, D6
021416: 6100 00A8                  bsr     $214c0
02141A: 6100 00D4                  bsr     $214f0
02141E: 6100 010C                  bsr     $2152c
021422: 3806                       move.w  D6, D4
021424: 51CC FFD2                  dbra    D4, $213f8
021428: 4E75                       rts
02142A: 7C00                       moveq   #$0, D6
02142C: 1C2D 04D9                  move.b  ($4d9,A5), D6
021430: E54E                       lsl.w   #2, D6
021432: 267B 6020                  movea.l ($20,PC,D6.w), A3
021436: 3411                       move.w  (A1), D2
021438: E94A                       lsl.w   #4, D2
02143A: 47F3 2000                  lea     (A3,D2.w), A3
02143E: 0C2E 000E 0005             cmpi.b  #$e, ($5,A6)
021444: 672E                       beq     $21474
021446: 20DB                       move.l  (A3)+, (A0)+
021448: 20DB                       move.l  (A3)+, (A0)+
02144A: 41E8 0038                  lea     ($38,A0), A0
02144E: 20DB                       move.l  (A3)+, (A0)+
021450: 20DB                       move.l  (A3)+, (A0)+
021452: 4E75                       rts
021454: 0016 2068                  ori.b   #$68, (A6)
021458: 0016 4198                  ori.b   #$98, (A6)
02145C: 0016 6758                  ori.b   #$58, (A6)
021460: 0016 6C98                  ori.b   #$98, (A6)
021464: 0016 83E8                  ori.b   #$e8, (A6)
021468: 0016 B3D8                  ori.b   #$d8, (A6)
02146C: 0016 E188                  ori.b   #$88, (A6)
021470: 0017 2158                  ori.b   #$58, (A7)
021474: 343C 000A                  move.w  #$a, D2
021478: 3C2B 0002                  move.w  ($2,A3), D6
02147C: E46E                       lsr.w   D2, D6
02147E: 0646 6F80                  addi.w  #$6f80, D6
021482: 30C6                       move.w  D6, (A0)+
021484: 30FC 0000                  move.w  #$0, (A0)+
021488: 3C2B 0006                  move.w  ($6,A3), D6
02148C: E46E                       lsr.w   D2, D6
02148E: 0646 6F80                  addi.w  #$6f80, D6
021492: 30C6                       move.w  D6, (A0)+
021494: 30FC 0000                  move.w  #$0, (A0)+
021498: 41E8 0038                  lea     ($38,A0), A0
02149C: 508B                       addq.l  #8, A3
02149E: 3C2B 0002                  move.w  ($2,A3), D6
0214A2: E46E                       lsr.w   D2, D6
0214A4: 0646 6F80                  addi.w  #$6f80, D6
0214A8: 30C6                       move.w  D6, (A0)+
0214AA: 30FC 0000                  move.w  #$0, (A0)+
0214AE: 3C2B 0006                  move.w  ($6,A3), D6
0214B2: E46E                       lsr.w   D2, D6
0214B4: 0646 6F80                  addi.w  #$6f80, D6
0214B8: 30C6                       move.w  D6, (A0)+
0214BA: 30FC 0000                  move.w  #$0, (A0)+
0214BE: 4E75                       rts
0214C0: 3600                       move.w  D0, D3
0214C2: 0243 03E0                  andi.w  #$3e0, D3
0214C6: E54B                       lsl.w   #2, D3
0214C8: 3801                       move.w  D1, D4
0214CA: 343C 03E0                  move.w  #$3e0, D2
0214CE: C842                       and.w   D2, D4
0214D0: 9444                       sub.w   D4, D2
0214D2: 3802                       move.w  D2, D4
0214D4: 0244 0300                  andi.w  #$300, D4
0214D8: E94C                       lsl.w   #4, D4
0214DA: 0242 00E0                  andi.w  #$e0, D2
0214DE: E44A                       lsr.w   #2, D2
0214E0: D842                       add.w   D2, D4
0214E2: D644                       add.w   D4, D3
0214E4: 41F9 0090 C000             lea     $90c000.l, A0
0214EA: 41F0 3000                  lea     (A0,D3.w), A0
0214EE: 4E75                       rts
0214F0: 246E 0042                  movea.l ($42,A6), A2
0214F4: 3600                       move.w  D0, D3
0214F6: 0243 FFE0                  andi.w  #$ffe0, D3
0214FA: 0C2D 0002 04D9             cmpi.b  #$2, ($4d9,A5)
021500: 671E                       beq     $21520
021502: E043                       asr.w   #8, D3
021504: 7400                       moveq   #$0, D2
021506: 142E 0041                  move.b  ($41,A6), D2
02150A: C6C2                       mulu.w  D2, D3
02150C: 3401                       move.w  D1, D2
02150E: 0242 FFE0                  andi.w  #$ffe0, D2
021512: E042                       asr.w   #8, D2
021514: D642                       add.w   D2, D3
021516: D643                       add.w   D3, D3
021518: 45F2 3000                  lea     (A2,D3.w), A2
02151C: 3A12                       move.w  (A2), D5
02151E: 4E75                       rts
021520: 0C43 4D00                  cmpi.w  #$4d00, D3
021524: 65DC                       bcs     $21502
021526: 0443 0F00                  subi.w  #$f00, D3
02152A: 60F4                       bra     $21520
02152C: 7400                       moveq   #$0, D2
02152E: 3405                       move.w  D5, D2
021530: EF4A                       lsl.w   #7, D2
021532: 3600                       move.w  D0, D3
021534: 0243 00E0                  andi.w  #$e0, D3
021538: E24B                       lsr.w   #1, D3
02153A: D443                       add.w   D3, D2
02153C: 3601                       move.w  D1, D3
02153E: 0243 00E0                  andi.w  #$e0, D3
021542: E84B                       lsr.w   #4, D3
021544: 383C 000E                  move.w  #$e, D4
021548: 9843                       sub.w   D3, D4
02154A: D444                       add.w   D4, D2
02154C: 7A00                       moveq   #$0, D5
02154E: 1A2D 04D9                  move.b  ($4d9,A5), D5
021552: E54D                       lsl.w   #2, D5
021554: 227B 5008                  movea.l ($8,PC,D5.w), A1
021558: 43F1 2000                  lea     (A1,D2.w), A1
02155C: 4E75                       rts