012CAC: 6100 0006                  bsr     $12cb4
012CB0: 6000 096C                  bra     $1361e
012CB4: 7000                       moveq   #$0, D0
012CB6: 1D40 0050                  move.b  D0, ($50,A6)
012CBA: 1B40 06B2                  move.b  D0, ($6b2,A5)
012CBE: 1B7C 0005 06B4             move.b  #$5, ($6b4,A5)
012CC4: 532D 06B4                  subq.b  #1, ($6b4,A5)
012CC8: 6B00 000C                  bmi     $12cd6
012CCC: 6100 0316                  bsr     $12fe4
012CD0: 6100 03CA                  bsr     $1309c
012CD4: 65EE                       bcs     $12cc4
012CD6: 0C2E 000C 0082             cmpi.b  #$c, ($82,A6)
012CDC: 6700 0018                  beq     $12cf6
012CE0: 0C6E 0202 0004             cmpi.w  #$202, ($4,A6)
012CE6: 6700 000E                  beq     $12cf6
012CEA: 4A2D 04D5                  tst.b   ($4d5,A5)
012CEE: 6600 0006                  bne     $12cf6
012CF2: 6100 01A6                  bsr     $12e9a
012CF6: 102D 06B2                  move.b  ($6b2,A5), D0
012CFA: 812E 0050                  or.b    D0, ($50,A6)
012CFE: 4A2E 0051                  tst.b   ($51,A6)
012D02: 6600 002A                  bne     $12d2e
012D06: 302E 0054                  move.w  ($54,A6), D0
012D0A: D06E 0056                  add.w   ($56,A6), D0
012D0E: 322E 000C                  move.w  ($c,A6), D1
012D12: B041                       cmp.w   D1, D0
012D14: 6700 0036                  beq     $12d4c
012D18: 6E00 000A                  bgt     $12d24
012D1C: 1D7C 0001 0051             move.b  #$1, ($51,A6)
012D22: 4E75                       rts
012D24: 3D40 000C                  move.w  D0, ($c,A6)
012D28: 426E 000E                  clr.w   ($e,A6)
012D2C: 4E75                       rts
012D2E: 302E 0054                  move.w  ($54,A6), D0
012D32: D06E 0056                  add.w   ($56,A6), D0
012D36: B06E 000C                  cmp.w   ($c,A6), D0
012D3A: 6F00 0010                  ble     $12d4c
012D3E: 3D40 000C                  move.w  D0, ($c,A6)
012D42: 7200                       moveq   #$0, D1
012D44: 3D41 000E                  move.w  D1, ($e,A6)
012D48: 1D41 0051                  move.b  D1, ($51,A6)
012D4C: 4E75                       rts
012D4E: 7000                       moveq   #$0, D0
012D50: 1D40 0050                  move.b  D0, ($50,A6)
012D54: 1B40 06B2                  move.b  D0, ($6b2,A5)
012D58: 6100 028A                  bsr     $12fe4
012D5C: 4A2E 0051                  tst.b   ($51,A6)
012D60: 6600 002A                  bne     $12d8c
012D64: 302E 0054                  move.w  ($54,A6), D0
012D68: D06E 0056                  add.w   ($56,A6), D0
012D6C: 322E 000C                  move.w  ($c,A6), D1
012D70: B041                       cmp.w   D1, D0
012D72: 6700 0036                  beq     $12daa
012D76: 6E00 000A                  bgt     $12d82
012D7A: 1D7C 0001 0051             move.b  #$1, ($51,A6)
012D80: 4E75                       rts
012D82: 3D40 000C                  move.w  D0, ($c,A6)
012D86: 426E 000E                  clr.w   ($e,A6)
012D8A: 4E75                       rts
012D8C: 302E 0054                  move.w  ($54,A6), D0
012D90: D06E 0056                  add.w   ($56,A6), D0
012D94: B06E 000C                  cmp.w   ($c,A6), D0
012D98: 6F00 0010                  ble     $12daa
012D9C: 3D40 000C                  move.w  D0, ($c,A6)
012DA0: 7200                       moveq   #$0, D1
012DA2: 3D41 000E                  move.w  D1, ($e,A6)
012DA6: 1D41 0051                  move.b  D1, ($51,A6)
012DAA: 4E75                       rts
012DAC: 7000                       moveq   #$0, D0
012DAE: 1D40 0050                  move.b  D0, ($50,A6)
012DB2: 1B40 06B2                  move.b  D0, ($6b2,A5)
012DB6: 1B7C 0005 06B4             move.b  #$5, ($6b4,A5)
012DBC: 532D 06B4                  subq.b  #1, ($6b4,A5)
012DC0: 6B00 0006                  bmi     $12dc8
012DC4: 6100 021E                  bsr     $12fe4
012DC8: 102D 06B2                  move.b  ($6b2,A5), D0
012DCC: 812E 0050                  or.b    D0, ($50,A6)
012DD0: 4A2E 0051                  tst.b   ($51,A6)
012DD4: 6600 002A                  bne     $12e00
012DD8: 302E 0054                  move.w  ($54,A6), D0
012DDC: D06E 0056                  add.w   ($56,A6), D0
012DE0: 322E 000C                  move.w  ($c,A6), D1
012DE4: B041                       cmp.w   D1, D0
012DE6: 6700 0036                  beq     $12e1e
012DEA: 6E00 000A                  bgt     $12df6
012DEE: 1D7C 0001 0051             move.b  #$1, ($51,A6)
012DF4: 4E75                       rts
012DF6: 3D40 000C                  move.w  D0, ($c,A6)
012DFA: 426E 000E                  clr.w   ($e,A6)
012DFE: 4E75                       rts
012E00: 302E 0054                  move.w  ($54,A6), D0
012E04: D06E 0056                  add.w   ($56,A6), D0
012E08: B06E 000C                  cmp.w   ($c,A6), D0
012E0C: 6F00 0010                  ble     $12e1e
012E10: 3D40 000C                  move.w  D0, ($c,A6)
012E14: 7200                       moveq   #$0, D1
012E16: 3D41 000E                  move.w  D1, ($e,A6)
012E1A: 1D41 0051                  move.b  D1, ($51,A6)
012E1E: 4E75                       rts
012E20: 7000                       moveq   #$0, D0
012E22: 1D40 0050                  move.b  D0, ($50,A6)
012E26: 1B40 06B2                  move.b  D0, ($6b2,A5)
012E2A: 1B7C 0005 06B4             move.b  #$5, ($6b4,A5)
012E30: 532D 06B4                  subq.b  #1, ($6b4,A5)
012E34: 6B00 000C                  bmi     $12e42
012E38: 6100 01AA                  bsr     $12fe4
012E3C: 6100 025E                  bsr     $1309c
012E40: 65EE                       bcs     $12e30
012E42: 102D 06B2                  move.b  ($6b2,A5), D0
012E46: 812E 0050                  or.b    D0, ($50,A6)
012E4A: 4A2E 0051                  tst.b   ($51,A6)
012E4E: 6600 002A                  bne     $12e7a
012E52: 302E 0054                  move.w  ($54,A6), D0
012E56: D06E 0056                  add.w   ($56,A6), D0
012E5A: 322E 000C                  move.w  ($c,A6), D1
012E5E: B041                       cmp.w   D1, D0
012E60: 6700 0036                  beq     $12e98
012E64: 6E00 000A                  bgt     $12e70
012E68: 1D7C 0001 0051             move.b  #$1, ($51,A6)
012E6E: 4E75                       rts
012E70: 3D40 000C                  move.w  D0, ($c,A6)
012E74: 426E 000E                  clr.w   ($e,A6)
012E78: 4E75                       rts
012E7A: 302E 0054                  move.w  ($54,A6), D0
012E7E: D06E 0056                  add.w   ($56,A6), D0
012E82: B06E 000C                  cmp.w   ($c,A6), D0
012E86: 6F00 0010                  ble     $12e98
012E8A: 3D40 000C                  move.w  D0, ($c,A6)
012E8E: 7200                       moveq   #$0, D1
012E90: 3D41 000E                  move.w  D1, ($e,A6)
012E94: 1D41 0051                  move.b  D1, ($51,A6)
012E98: 4E75                       rts
012E9A: 3C2D 6A26                  move.w  ($6a26,A5), D6
012E9E: 6700 0116                  beq     $12fb6
012EA2: 5346                       subq.w  #1, D6
012EA4: 306D 6A28                  movea.w ($6a28,A5), A0
012EA8: 3258                       movea.w (A0)+, A1
012EAA: B2CE                       cmpa.w  A6, A1
012EAC: 6700 0104                  beq     $12fb2
012EB0: 7000                       moveq   #$0, D0
012EB2: 1029 0048                  move.b  ($48,A1), D0
012EB6: C0FC 000C                  mulu.w  #$c, D0
012EBA: 2469 0044                  movea.l ($44,A1), A2
012EBE: D4C0                       adda.w  D0, A2
012EC0: 3029 0010                  move.w  ($10,A1), D0
012EC4: D05A                       add.w   (A2)+, D0
012EC6: 906E 0010                  sub.w   ($10,A6), D0
012ECA: 321A                       move.w  (A2)+, D1
012ECC: D041                       add.w   D1, D0
012ECE: B041                       cmp.w   D1, D0
012ED0: 6200 00E0                  bhi     $12fb2
012ED4: 3029 0008                  move.w  ($8,A1), D0
012ED8: 321A                       move.w  (A2)+, D1
012EDA: 341A                       move.w  (A2)+, D2
012EDC: 4A29 0024                  tst.b   ($24,A1)
012EE0: 6700 0006                  beq     $12ee8
012EE4: 4441                       neg.w   D1
012EE6: 9242                       sub.w   D2, D1
012EE8: D041                       add.w   D1, D0
012EEA: D042                       add.w   D2, D0
012EEC: 906E 0008                  sub.w   ($8,A6), D0
012EF0: B042                       cmp.w   D2, D0
012EF2: 6200 00BE                  bhi     $12fb2
012EF6: 3029 000C                  move.w  ($c,A1), D0
012EFA: D05A                       add.w   (A2)+, D0
012EFC: D05A                       add.w   (A2)+, D0
012EFE: B06E 000C                  cmp.w   ($c,A6), D0
012F02: 6F00 00B4                  ble     $12fb8
012F06: 45EA FFF4                  lea     (-$c,A2), A2
012F0A: 3029 0010                  move.w  ($10,A1), D0
012F0E: D05A                       add.w   (A2)+, D0
012F10: 321A                       move.w  (A2)+, D1
012F12: D240                       add.w   D0, D1
012F14: 3801                       move.w  D1, D4
012F16: D240                       add.w   D0, D1
012F18: E249                       lsr.w   #1, D1
012F1A: B26E 0010                  cmp.w   ($10,A6), D1
012F1E: 6400 000C                  bcc     $12f2c
012F22: 986E 0010                  sub.w   ($10,A6), D4
012F26: 3C04                       move.w  D4, D6
012F28: 6000 000C                  bra     $12f36
012F2C: 906E 0010                  sub.w   ($10,A6), D0
012F30: 3800                       move.w  D0, D4
012F32: 4440                       neg.w   D0
012F34: 3C00                       move.w  D0, D6
012F36: 3029 0008                  move.w  ($8,A1), D0
012F3A: 321A                       move.w  (A2)+, D1
012F3C: 341A                       move.w  (A2)+, D2
012F3E: 4A29 0024                  tst.b   ($24,A1)
012F42: 6700 0006                  beq     $12f4a
012F46: 4441                       neg.w   D1
012F48: 9242                       sub.w   D2, D1
012F4A: D041                       add.w   D1, D0
012F4C: D440                       add.w   D0, D2
012F4E: 3A02                       move.w  D2, D5
012F50: D440                       add.w   D0, D2
012F52: E24A                       lsr.w   #1, D2
012F54: B46E 0008                  cmp.w   ($8,A6), D2
012F58: 6400 000C                  bcc     $12f66
012F5C: 9A6E 0008                  sub.w   ($8,A6), D5
012F60: 3005                       move.w  D5, D0
012F62: 6000 000A                  bra     $12f6e
012F66: 906E 0008                  sub.w   ($8,A6), D0
012F6A: 3A00                       move.w  D0, D5
012F6C: 4440                       neg.w   D0
012F6E: 08EE 0007 0050             bset    #$7, ($50,A6)
012F74: 3D49 0094                  move.w  A1, ($94,A6)
012F78: BC40                       cmp.w   D0, D6
012F7A: 6500 001C                  bcs     $12f98
012F7E: 3229 000C                  move.w  ($c,A1), D1
012F82: D25A                       add.w   (A2)+, D1
012F84: D25A                       add.w   (A2)+, D1
012F86: 926E 000C                  sub.w   ($c,A6), D1
012F8A: E449                       lsr.w   #2, D1
012F8C: B240                       cmp.w   D0, D1
012F8E: 6F00 003A                  ble     $12fca
012F92: DB6E 0008                  add.w   D5, ($8,A6)
012F96: 4E75                       rts
012F98: 3229 000C                  move.w  ($c,A1), D1
012F9C: D25A                       add.w   (A2)+, D1
012F9E: D25A                       add.w   (A2)+, D1
012FA0: 926E 000C                  sub.w   ($c,A6), D1
012FA4: E249                       lsr.w   #1, D1
012FA6: B246                       cmp.w   D6, D1
012FA8: 6F00 0020                  ble     $12fca
012FAC: D96E 0010                  add.w   D4, ($10,A6)
012FB0: 4E75                       rts
012FB2: 51CE FEF4                  dbra    D6, $12ea8
012FB6: 4E75                       rts
012FB8: 9069 0054                  sub.w   ($54,A1), D0
012FBC: 5340                       subq.w  #1, D0
012FBE: 3D40 0056                  move.w  D0, ($56,A6)
012FC2: 3D69 0054 0054             move.w  ($54,A1), ($54,A6)
012FC8: 4E75                       rts
012FCA: 137C 0001 00AC             move.b  #$1, ($ac,A1)
012FD0: D26E 000C                  add.w   ($c,A6), D1
012FD4: 9269 0054                  sub.w   ($54,A1), D1
012FD8: 3D41 0056                  move.w  D1, ($56,A6)
012FDC: 3D69 0054 0054             move.w  ($54,A1), ($54,A6)
012FE2: 4E75                       rts
012FE4: 4A2D 04DC                  tst.b   ($4dc,A5)			/检测什么状态
012FE8: 6600 005C                  bne     $13046
012FEC: 206D 06AC                  movea.l ($6ac,A5), A0		/
012FF0: 342E 0008                  move.w  ($8,A6), D2			/X坐标带入D2
012FF4: 3028 0004                  move.w  ($4,A0), D0			/D0好像几乎都是7FFF
012FF8: B042                       cmp.w   D2, D0
012FFA: 6C00 0030                  bge     $1302c
012FFE: 41E8 000C                  lea     ($c,A0), A0
013002: 3028 0004                  move.w  ($4,A0), D0
013006: B042                       cmp.w   D2, D0
013008: 6C00 0022                  bge     $1302c
01300C: 41E8 000C                  lea     ($c,A0), A0
013010: 3028 0004                  move.w  ($4,A0), D0
013014: B042                       cmp.w   D2, D0
013016: 6C00 0014                  bge     $1302c
01301A: 41E8 000C                  lea     ($c,A0), A0
01301E: 3028 0004                  move.w  ($4,A0), D0
013022: B042                       cmp.w   D2, D0
013024: 6C00 0006                  bge     $1302c
013028: 41E8 000C                  lea     ($c,A0), A0
01302C: 1D68 000A 0053             move.b  ($a,A0), ($53,A6)
013032: 4A50                       tst.w   (A0)
013034: 6600 0020                  bne     $13056
013038: 1D68 0007 0052             move.b  ($7,A0), ($52,A6)
01303E: 3D68 0008 0054             move.w  ($8,A0), ($54,A6)
013044: 4E75                       rts
013046: 7000                       moveq   #$0, D0
013048: 1D40 0053                  move.b  D0, ($53,A6)
01304C: 1D40 0052                  move.b  D0, ($52,A6)
013050: 3D40 0054                  move.w  D0, ($54,A6)
013054: 4E75                       rts
013056: 3028 0002                  move.w  ($2,A0), D0
01305A: 906E 0008                  sub.w   ($8,A6), D0
01305E: 4440                       neg.w   D0
013060: E448                       lsr.w   #2, D0
013062: 3228 0006                  move.w  ($6,A0), D1
013066: 4A68 0008                  tst.w   ($8,A0)
01306A: 6600 0008                  bne     $13074
01306E: D041                       add.w   D1, D0
013070: 6000 0008                  bra     $1307a
013074: 5341                       subq.w  #1, D1
013076: 9240                       sub.w   D0, D1
013078: 3001                       move.w  D1, D0
01307A: 6B00 001E                  bmi     $1309a
01307E: 3D40 0054                  move.w  D0, ($54,A6)
013082: 4A2E 0051                  tst.b   ($51,A6)
013086: 6700 000E                  beq     $13096
01308A: B06E 000C                  cmp.w   ($c,A6), D0
01308E: 6300 000A                  bls     $1309a
013092: 422E 0051                  clr.b   ($51,A6)
013096: 3D40 000C                  move.w  D0, ($c,A6)
01309A: 4E75                       rts
01309C: 302E 0008                  move.w  ($8,A6), D0		/X坐标
0130A0: 322E 0010                  move.w  ($10,A6), D1		/Y坐标
0130A4: D26E 0054                  add.w   ($54,A6), D1		/？？？
0130A8: 426E 0056                  clr.w   ($56,A6)
0130AC: 4A2D 04DC                  tst.b   ($4dc,A5)
0130B0: 6700 000E                  beq     $130c0
0130B4: 6100 062E                  bsr     $136e4
0130B8: 6700 007A                  beq     $13134
0130BC: 6000 003A                  bra     $130f8
0130C0: 3400                       move.w  D0, D2		/X坐标加到D2
0130C2: 0242 03F0                  andi.w  #$3f0, D2
0130C6: E54A                       lsl.w   #2, D2
0130C8: 3601                       move.w  D1, D3
0130CA: 383C 03F0                  move.w  #$3f0, D4
0130CE: C644                       and.w   D4, D3
0130D0: 9843                       sub.w   D3, D4
0130D2: 3604                       move.w  D4, D3
0130D4: 0243 0300                  andi.w  #$300, D3
0130D8: E94B                       lsl.w   #4, D3
0130DA: 0244 00F0                  andi.w  #$f0, D4
0130DE: E44C                       lsr.w   #2, D4
0130E0: D644                       add.w   D4, D3
0130E2: D443                       add.w   D3, D2
0130E4: 41F9 0090 C000             lea     $90c000.l, A0
0130EA: 3430 2002                  move.w  ($2,A0,D2.w), D2
0130EE: 0242 FC00                  andi.w  #$fc00, D2
0130F2: 6700 0040                  beq     $13134
0130F6: ED5A                       rol.w   #6, D2
0130F8: 41FA 0A12                  lea     ($a12,PC), A0; ($13b0c)
0130FC: 7600                       moveq   #$0, D3
0130FE: 162D 04D9                  move.b  ($4d9,A5), D3
013102: E74B                       lsl.w   #3, D3
013104: 182D 0786                  move.b  ($786,A5), D4
013108: D844                       add.w   D4, D4
01310A: D644                       add.w   D4, D3
01310C: 3630 3000                  move.w  (A0,D3.w), D3
013110: D0C3                       adda.w  D3, A0
013112: 1B70 2000 06B2             move.b  (A0,D2.w), ($6b2,A5)
013118: E94A                       lsl.w   #4, D2
01311A: 41FA 05F0                  lea     ($5f0,PC), A0; ($1370c)
01311E: D0C2                       adda.w  D2, A0
013120: 3428 0000                  move.w  ($0,A0), D2
013124: 0C42 0020                  cmpi.w  #$20, D2
013128: 6600 0004                  bne     $1312e
01312C: 7414                       moveq   #$14, D2
01312E: 227B 200E                  movea.l ($e,PC,D2.w), A1
013132: 4ED1                       jmp     (A1)
013134: 8040                       or.w    D0, D0
013136: 4E75                       rts
013138: 44FC 0001                  move    #$1, CCR
01313C: 4E75                       rts
01313E: 0001 315E                  ori.b   #$5e, D1
013142: 0001 31E4                  ori.b   #$e4, D1
013146: 0001 32CA                  ori.b   #$ca, D1
01314A: 0001 33BA                  ori.b   #$ba, D1
01314E: 0001 344E                  ori.b   #$4e, D1
013152: 0001 350A                  ori.b   #$a, D1
013156: 0001 350E                  ori.b   #$e, D1
01315A: 0001 35A8                  ori.b   #$a8, D1
01315E: 3428 0002                  move.w  ($2,A0), D2
013162: 227B 2004                  movea.l ($4,PC,D2.w), A1
013166: 4ED1                       jmp     (A1)
013168: 0001 3178                  ori.b   #$78, D1
01316C: 0001 3192                  ori.b   #$92, D1
013170: 0001 31AA                  ori.b   #$aa, D1
013174: 0001 31C6                  ori.b   #$c6, D1
013178: 4641                       not.w   D1
01317A: 0241 000F                  andi.w  #$f, D1
01317E: 5241                       addq.w  #1, D1
013180: D36E 0010                  add.w   D1, ($10,A6)
013184: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
01318A: 4A68 000A                  tst.w   ($a,A0)
01318E: 66A8                       bne     $13138
013190: 60A2                       bra     $13134
013192: 0241 000F                  andi.w  #$f, D1
013196: 5241                       addq.w  #1, D1
013198: 936E 0010                  sub.w   D1, ($10,A6)
01319C: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
0131A2: 4A68 000A                  tst.w   ($a,A0)
0131A6: 6690                       bne     $13138
0131A8: 608A                       bra     $13134
0131AA: 0240 000F                  andi.w  #$f, D0
0131AE: 5240                       addq.w  #1, D0
0131B0: 916E 0008                  sub.w   D0, ($8,A6)
0131B4: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
0131BA: 4A68 000A                  tst.w   ($a,A0)
0131BE: 6600 FF78                  bne     $13138
0131C2: 6000 FF70                  bra     $13134
0131C6: 4440                       neg.w   D0
0131C8: 0240 000F                  andi.w  #$f, D0
0131CC: 5240                       addq.w  #1, D0
0131CE: D16E 0008                  add.w   D0, ($8,A6)
0131D2: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
0131D8: 4A68 000A                  tst.w   ($a,A0)
0131DC: 6600 FF5A                  bne     $13138
0131E0: 6000 FF52                  bra     $13134
0131E4: 3428 0002                  move.w  ($2,A0), D2
0131E8: 227B 2004                  movea.l ($4,PC,D2.w), A1
0131EC: 4ED1                       jmp     (A1)
0131EE: 0001 31FE                  ori.b   #$fe, D1
0131F2: 0001 3230                  ori.b   #$30, D1
0131F6: 0001 3264                  ori.b   #$64, D1
0131FA: 0001 3298                  ori.b   #$98, D1
0131FE: 4A68 0004                  tst.w   ($4,A0)
013202: 6600 0004                  bne     $13208
013206: 4640                       not.w   D0
013208: 0240 000F                  andi.w  #$f, D0
01320C: 3428 0006                  move.w  ($6,A0), D2
013210: E468                       lsr.w   D2, D0
013212: D068 0008                  add.w   ($8,A0), D0
013216: 5240                       addq.w  #1, D0
013218: 0241 000F                  andi.w  #$f, D1
01321C: 9041                       sub.w   D1, D0
01321E: 6500 000C                  bcs     $1322c
013222: D16E 0010                  add.w   D0, ($10,A6)
013226: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
01322C: 6000 FF06                  bra     $13134
013230: 4A68 0004                  tst.w   ($4,A0)
013234: 6700 0004                  beq     $1323a
013238: 4640                       not.w   D0
01323A: 0240 000F                  andi.w  #$f, D0
01323E: 3428 0006                  move.w  ($6,A0), D2
013242: E468                       lsr.w   D2, D0
013244: D068 0008                  add.w   ($8,A0), D0
013248: 5240                       addq.w  #1, D0
01324A: 4641                       not.w   D1
01324C: 0241 000F                  andi.w  #$f, D1
013250: 9041                       sub.w   D1, D0
013252: 6500 000C                  bcs     $13260
013256: 916E 0010                  sub.w   D0, ($10,A6)
01325A: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
013260: 6000 FED2                  bra     $13134
013264: 4A68 0004                  tst.w   ($4,A0)
013268: 6600 0004                  bne     $1326e
01326C: 4641                       not.w   D1
01326E: 0241 000F                  andi.w  #$f, D1
013272: 3428 0006                  move.w  ($6,A0), D2
013276: E469                       lsr.w   D2, D1
013278: D268 0008                  add.w   ($8,A0), D1
01327C: 5241                       addq.w  #1, D1
01327E: 4640                       not.w   D0
013280: 0240 000F                  andi.w  #$f, D0
013284: 9240                       sub.w   D0, D1
013286: 6500 000C                  bcs     $13294
01328A: 936E 0008                  sub.w   D1, ($8,A6)
01328E: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
013294: 6000 FE9E                  bra     $13134
013298: 4A68 0004                  tst.w   ($4,A0)
01329C: 6700 0004                  beq     $132a2
0132A0: 4641                       not.w   D1
0132A2: 0241 000F                  andi.w  #$f, D1
0132A6: 3428 0006                  move.w  ($6,A0), D2
0132AA: E469                       lsr.w   D2, D1
0132AC: D268 0008                  add.w   ($8,A0), D1
0132B0: 5241                       addq.w  #1, D1
0132B2: 0240 000F                  andi.w  #$f, D0
0132B6: 9240                       sub.w   D0, D1
0132B8: 6500 000C                  bcs     $132c6
0132BC: D36E 0008                  add.w   D1, ($8,A6)
0132C0: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
0132C6: 6000 FE6C                  bra     $13134
0132CA: 1D7C 0008 0050             move.b  #$8, ($50,A6)
0132D0: 3428 0002                  move.w  ($2,A0), D2
0132D4: 227B 2004                  movea.l ($4,PC,D2.w), A1
0132D8: 4ED1                       jmp     (A1)
0132DA: 0001 32EA                  ori.b   #$ea, D1
0132DE: 0001 331C                  ori.b   #$1c, D1
0132E2: 0001 3350                  ori.b   #$50, D1
0132E6: 0001 3384                  ori.b   #$84, D1
0132EA: 0240 000F                  andi.w  #$f, D0
0132EE: 0241 000F                  andi.w  #$f, D1
0132F2: B041                       cmp.w   D1, D0
0132F4: 6400 0014                  bcc     $1330a
0132F8: 5240                       addq.w  #1, D0
0132FA: 916E 0008                  sub.w   D0, ($8,A6)
0132FE: 4A68 000A                  tst.w   ($a,A0)
013302: 6600 FE34                  bne     $13138
013306: 6000 FE2C                  bra     $13134
01330A: 5241                       addq.w  #1, D1
01330C: 936E 0010                  sub.w   D1, ($10,A6)
013310: 4A68 000A                  tst.w   ($a,A0)
013314: 6600 FE22                  bne     $13138
013318: 6000 FE1A                  bra     $13134
01331C: 4640                       not.w   D0
01331E: 0240 000F                  andi.w  #$f, D0
013322: 0241 000F                  andi.w  #$f, D1
013326: B041                       cmp.w   D1, D0
013328: 6400 0014                  bcc     $1333e
01332C: 5240                       addq.w  #1, D0
01332E: D16E 0008                  add.w   D0, ($8,A6)
013332: 4A68 000A                  tst.w   ($a,A0)
013336: 6600 FE00                  bne     $13138
01333A: 6000 FDF8                  bra     $13134
01333E: 5241                       addq.w  #1, D1
013340: 936E 0010                  sub.w   D1, ($10,A6)
013344: 4A68 000A                  tst.w   ($a,A0)
013348: 6600 FDEE                  bne     $13138
01334C: 6000 FDE6                  bra     $13134
013350: 4641                       not.w   D1
013352: 0240 000F                  andi.w  #$f, D0
013356: 0241 000F                  andi.w  #$f, D1
01335A: B041                       cmp.w   D1, D0
01335C: 6400 0014                  bcc     $13372
013360: 5240                       addq.w  #1, D0
013362: 916E 0008                  sub.w   D0, ($8,A6)
013366: 4A68 000A                  tst.w   ($a,A0)
01336A: 6600 FDCC                  bne     $13138
01336E: 6000 FDC4                  bra     $13134
013372: 5241                       addq.w  #1, D1
013374: D36E 0010                  add.w   D1, ($10,A6)
013378: 4A68 000A                  tst.w   ($a,A0)
01337C: 6600 FDBA                  bne     $13138
013380: 6000 FDB2                  bra     $13134
013384: 4640                       not.w   D0
013386: 4641                       not.w   D1
013388: 0240 000F                  andi.w  #$f, D0
01338C: 0241 000F                  andi.w  #$f, D1
013390: B041                       cmp.w   D1, D0
013392: 6400 0014                  bcc     $133a8
013396: 5240                       addq.w  #1, D0
013398: D16E 0008                  add.w   D0, ($8,A6)
01339C: 4A68 000A                  tst.w   ($a,A0)
0133A0: 6600 FD96                  bne     $13138
0133A4: 6000 FD8E                  bra     $13134
0133A8: 5241                       addq.w  #1, D1
0133AA: D36E 0010                  add.w   D1, ($10,A6)
0133AE: 4A68 000A                  tst.w   ($a,A0)
0133B2: 6600 FD84                  bne     $13138
0133B6: 6000 FD7C                  bra     $13134
0133BA: 0C68 000C 0002             cmpi.w  #$c, ($2,A0)
0133C0: 6700 0048                  beq     $1340a
0133C4: 0241 000F                  andi.w  #$f, D1
0133C8: 3428 0006                  move.w  ($6,A0), D2
0133CC: E469                       lsr.w   D2, D1
0133CE: D268 0008                  add.w   ($8,A0), D1
0133D2: 5241                       addq.w  #1, D1
0133D4: 4640                       not.w   D0
0133D6: 0240 000F                  andi.w  #$f, D0
0133DA: 9240                       sub.w   D0, D1
0133DC: 6300 0028                  bls     $13406
0133E0: 302D 06B0                  move.w  ($6b0,A5), D0
0133E4: 3400                       move.w  D0, D2
0133E6: D06E 0054                  add.w   ($54,A6), D0
0133EA: 906E 000C                  sub.w   ($c,A6), D0
0133EE: 6F00 0012                  ble     $13402
0133F2: E448                       lsr.w   #2, D0
0133F4: B240                       cmp.w   D0, D1
0133F6: 6400 000A                  bcc     $13402
0133FA: 936E 0008                  sub.w   D1, ($8,A6)
0133FE: 6000 FD34                  bra     $13134
013402: 3D42 0056                  move.w  D2, ($56,A6)
013406: 6000 FD2C                  bra     $13134
01340A: 0241 000F                  andi.w  #$f, D1
01340E: 3428 0006                  move.w  ($6,A0), D2
013412: E469                       lsr.w   D2, D1
013414: D268 0008                  add.w   ($8,A0), D1
013418: 5241                       addq.w  #1, D1
01341A: 0240 000F                  andi.w  #$f, D0
01341E: 9240                       sub.w   D0, D1
013420: 6500 0028                  bcs     $1344a
013424: 302D 06B0                  move.w  ($6b0,A5), D0
013428: 3400                       move.w  D0, D2
01342A: D06E 0054                  add.w   ($54,A6), D0
01342E: 906E 000C                  sub.w   ($c,A6), D0
013432: 6F00 0012                  ble     $13446
013436: E448                       lsr.w   #2, D0
013438: B240                       cmp.w   D0, D1
01343A: 6400 000A                  bcc     $13446
01343E: D36E 0008                  add.w   D1, ($8,A6)
013442: 6000 FCF0                  bra     $13134
013446: 3D42 0056                  move.w  D2, ($56,A6)
01344A: 6000 FCE8                  bra     $13134
01344E: 3428 0002                  move.w  ($2,A0), D2
013452: 227B 2004                  movea.l ($4,PC,D2.w), A1
013456: 4ED1                       jmp     (A1)
013458: 0001 3468                  ori.b   #$68, D1
01345C: 0001 3472                  ori.b   #$72, D1
013460: 0001 34A8                  ori.b   #$a8, D1
013464: 0001 34D8                  ori.b   #$d8, D1
013468: 3D6D 06B0 0056             move.w  ($6b0,A5), ($56,A6)
01346E: 6000 FCC4                  bra     $13134
013472: 342D 06B0                  move.w  ($6b0,A5), D2
013476: 3602                       move.w  D2, D3
013478: D46E 0054                  add.w   ($54,A6), D2
01347C: 946E 000C                  sub.w   ($c,A6), D2
013480: 6F00 001E                  ble     $134a0
013484: 0241 000F                  andi.w  #$f, D1
013488: E44A                       lsr.w   #2, D2
01348A: B441                       cmp.w   D1, D2
01348C: 6300 0012                  bls     $134a0
013490: 5241                       addq.w  #1, D1
013492: 936E 0010                  sub.w   D1, ($10,A6)
013496: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
01349C: 6000 FC96                  bra     $13134
0134A0: 3D43 0056                  move.w  D3, ($56,A6)
0134A4: 6000 FC8E                  bra     $13134
0134A8: 342D 06B0                  move.w  ($6b0,A5), D2
0134AC: 3602                       move.w  D2, D3
0134AE: D46E 0054                  add.w   ($54,A6), D2
0134B2: 946E 000C                  sub.w   ($c,A6), D2
0134B6: 6F00 0018                  ble     $134d0
0134BA: 0240 000F                  andi.w  #$f, D0
0134BE: E44A                       lsr.w   #2, D2
0134C0: B440                       cmp.w   D0, D2
0134C2: 6300 000C                  bls     $134d0
0134C6: 5240                       addq.w  #1, D0
0134C8: 916E 0008                  sub.w   D0, ($8,A6)
0134CC: 6000 FC6A                  bra     $13138
0134D0: 3D43 0056                  move.w  D3, ($56,A6)
0134D4: 6000 FC5E                  bra     $13134
0134D8: 342D 06B0                  move.w  ($6b0,A5), D2
0134DC: 3602                       move.w  D2, D3
0134DE: D46E 0054                  add.w   ($54,A6), D2
0134E2: B46E 000C                  cmp.w   ($c,A6), D2
0134E6: 6F00 001A                  ble     $13502
0134EA: 4440                       neg.w   D0
0134EC: 0240 000F                  andi.w  #$f, D0
0134F0: E44A                       lsr.w   #2, D2
0134F2: B440                       cmp.w   D0, D2
0134F4: 6300 000C                  bls     $13502
0134F8: 5240                       addq.w  #1, D0
0134FA: D16E 0008                  add.w   D0, ($8,A6)
0134FE: 6000 FC38                  bra     $13138
013502: 3D43 0056                  move.w  D3, ($56,A6)
013506: 6000 FC2C                  bra     $13134
01350A: 6000 FC28                  bra     $13134
01350E: 3428 0002                  move.w  ($2,A0), D2
013512: 227B 2004                  movea.l ($4,PC,D2.w), A1
013516: 4ED1                       jmp     (A1)
013518: 0001 3528                  ori.b   #$28, D1
01351C: 0001 3528                  ori.b   #$28, D1
013520: 0001 3528                  ori.b   #$28, D1
013524: 0001 3572                  ori.b   #$72, D1
013528: 4A68 0004                  tst.w   ($4,A0)
01352C: 6600 0004                  bne     $13532
013530: 4641                       not.w   D1
013532: 0241 000F                  andi.w  #$f, D1
013536: 9268 0008                  sub.w   ($8,A0), D1
01353A: 6300 0022                  bls     $1355e
01353E: 3428 0006                  move.w  ($6,A0), D2
013542: E569                       lsl.w   D2, D1
013544: 0240 000F                  andi.w  #$f, D0
013548: 9041                       sub.w   D1, D0
01354A: 6500 FBE8                  bcs     $13134
01354E: 5240                       addq.w  #1, D0
013550: 916E 0008                  sub.w   D0, ($8,A6)
013554: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
01355A: 6000 FBD8                  bra     $13134
01355E: 0240 000F                  andi.w  #$f, D0
013562: 5240                       addq.w  #1, D0
013564: 916E 0008                  sub.w   D0, ($8,A6)
013568: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
01356E: 6000 FBC8                  bra     $13138
013572: 4A68 0004                  tst.w   ($4,A0)
013576: 6600 0004                  bne     $1357c
01357A: 4641                       not.w   D1
01357C: 0241 000F                  andi.w  #$f, D1
013580: 9268 0008                  sub.w   ($8,A0), D1
013584: 6500 FBAE                  bcs     $13134
013588: 3428 0006                  move.w  ($6,A0), D2
01358C: E569                       lsl.w   D2, D1
01358E: 0240 000F                  andi.w  #$f, D0
013592: 9041                       sub.w   D1, D0
013594: 6200 FB9E                  bhi     $13134
013598: 5340                       subq.w  #1, D0
01359A: 916E 0008                  sub.w   D0, ($8,A6)
01359E: 1D68 000F 0050             move.b  ($f,A0), ($50,A6)
0135A4: 6000 FB8E                  bra     $13134
0135A8: 3428 0002                  move.w  ($2,A0), D2
0135AC: 227B 2004                  movea.l ($4,PC,D2.w), A1
0135B0: 4ED1                       jmp     (A1)
0135B2: 0001 35C2                  ori.b   #$c2, D1
0135B6: 0001 35C2                  ori.b   #$c2, D1
0135BA: 0001 35C2                  ori.b   #$c2, D1
0135BE: 0001 35C2                  ori.b   #$c2, D1
0135C2: 342D 06B0                  move.w  ($6b0,A5), D2
0135C6: 3602                       move.w  D2, D3
0135C8: D46E 0054                  add.w   ($54,A6), D2
0135CC: 946E 000C                  sub.w   ($c,A6), D2
0135D0: 6F00 0018                  ble     $135ea
0135D4: 0241 000F                  andi.w  #$f, D1
0135D8: E44A                       lsr.w   #2, D2
0135DA: B242                       cmp.w   D2, D1
0135DC: 6400 000C                  bcc     $135ea
0135E0: 5241                       addq.w  #1, D1
0135E2: 936E 0010                  sub.w   D1, ($10,A6)
0135E6: 6000 FB50                  bra     $13138
0135EA: 3D43 0056                  move.w  D3, ($56,A6)
0135EE: 4A68 0004                  tst.w   ($4,A0)
0135F2: 6600 0004                  bne     $135f8
0135F6: 4641                       not.w   D1
0135F8: 0241 000F                  andi.w  #$f, D1
0135FC: 9268 0008                  sub.w   ($8,A0), D1
013600: 6500 0018                  bcs     $1361a
013604: 3428 0006                  move.w  ($6,A0), D2
013608: E569                       lsl.w   D2, D1
01360A: 0240 000F                  andi.w  #$f, D0
01360E: 9041                       sub.w   D1, D0
013610: 6200 0008                  bhi     $1361a
013614: 5340                       subq.w  #1, D0
013616: 916E 0008                  sub.w   D0, ($8,A6)
01361A: 6000 FB18                  bra     $13134
01361E: 7000                       moveq   #$0, D0
013620: 102E 0003                  move.b  ($3,A6), D0
013624: D040                       add.w   D0, D0
013626: 323B 007E                  move.w  ($7e,PC,D0.w), D1
01362A: D26E 000C                  add.w   ($c,A6), D1
01362E: D26E 0010                  add.w   ($10,A6), D1
013632: 302E 0008                  move.w  ($8,A6), D0
013636: 4A2D 04DC                  tst.b   ($4dc,A5)
01363A: 6700 000A                  beq     $13646
01363E: 6100 00A4                  bsr     $136e4
013642: 6000 0030                  bra     $13674
013646: 3400                       move.w  D0, D2
013648: 0242 03F0                  andi.w  #$3f0, D2
01364C: E54A                       lsl.w   #2, D2
01364E: 3601                       move.w  D1, D3
013650: 383C 03F0                  move.w  #$3f0, D4
013654: C644                       and.w   D4, D3
013656: 9843                       sub.w   D3, D4
013658: 3604                       move.w  D4, D3
01365A: 0243 0300                  andi.w  #$300, D3
01365E: E94B                       lsl.w   #4, D3
013660: 0244 00F0                  andi.w  #$f0, D4
013664: E44C                       lsr.w   #2, D4
013666: D644                       add.w   D4, D3
013668: D443                       add.w   D3, D2
01366A: 41F9 0090 C000             lea     $90c000.l, A0
013670: 3430 2002                  move.w  ($2,A0,D2.w), D2
013674: ED5A                       rol.w   #6, D2
013676: 0242 003F                  andi.w  #$3f, D2
01367A: E94A                       lsl.w   #4, D2
01367C: 41FA 008E                  lea     ($8e,PC), A0; ($1370c)
013680: D0C2                       adda.w  D2, A0
013682: 0C50 0020                  cmpi.w  #$20, (A0)
013686: 6600 001C                  bne     $136a4
01368A: 926E 0010                  sub.w   ($10,A6), D1
01368E: 0241 000F                  andi.w  #$f, D1
013692: 5241                       addq.w  #1, D1
013694: 936E 000C                  sub.w   D1, ($c,A6)
013698: 4A6E 0016                  tst.w   ($16,A6)
01369C: 6B00 0006                  bmi     $136a4
0136A0: 466E 0016                  not.w   ($16,A6)
0136A4: 4E75                       rts
0136A6: 0050 0050                  ori.w   #$50, (A0)
0136AA: 0050 0050                  ori.w   #$50, (A0)
0136AE: 3400                       move.w  D0, D2
0136B0: 0242 03F0                  andi.w  #$3f0, D2
0136B4: E54A                       lsl.w   #2, D2
0136B6: 3601                       move.w  D1, D3
0136B8: 383C 03F0                  move.w  #$3f0, D4
0136BC: C644                       and.w   D4, D3
0136BE: 9843                       sub.w   D3, D4
0136C0: 3604                       move.w  D4, D3
0136C2: 0243 0300                  andi.w  #$300, D3
0136C6: E94B                       lsl.w   #4, D3
0136C8: 0244 00F0                  andi.w  #$f0, D4
0136CC: E44C                       lsr.w   #2, D4
0136CE: D644                       add.w   D4, D3
0136D0: D443                       add.w   D3, D2
0136D2: 41F9 0090 C000             lea     $90c000.l, A0
0136D8: 3430 2002                  move.w  ($2,A0,D2.w), D2
0136DC: ED5A                       rol.w   #6, D2
0136DE: 0242 003F                  andi.w  #$3f, D2
0136E2: 4E75                       rts
0136E4: 3400                       move.w  D0, D2
0136E6: 0242 01F0                  andi.w  #$1f0, D2
0136EA: E54A                       lsl.w   #2, D2
0136EC: 3601                       move.w  D1, D3
0136EE: 383C 00F0                  move.w  #$f0, D4
0136F2: C644                       and.w   D4, D3
0136F4: 9843                       sub.w   D3, D4
0136F6: E44C                       lsr.w   #2, D4
0136F8: D444                       add.w   D4, D2
0136FA: 41F9 0091 C000             lea     $91c000.l, A0
013700: 3430 2002                  move.w  ($2,A0,D2.w), D2
013704: ED5A                       rol.w   #6, D2
013706: 0242 003F                  andi.w  #$3f, D2
01370A: 4E75                       rts