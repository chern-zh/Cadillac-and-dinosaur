005AA2: 3D7C 8000 00BA             move.w  #$8000, ($ba,A6)
005AA8: 426E 00B8                  clr.w   ($b8,A6)
005AAC: 4A2D 0506                  tst.b   ($506,A5)
005AB0: 6600 0128                  bne     $5bda
005AB4: 4A2E 0051                  tst.b   ($51,A6)
005AB8: 6600 0120                  bne     $5bda
005ABC: 3C2D 69EE                  move.w  ($69ee,A5), D6
005AC0: 6700 0118                  beq     $5bda
005AC4: 5346                       subq.w  #1, D6
005AC6: 306D 69F0                  movea.w ($69f0,A5), A0
005ACA: 3258                       movea.w (A0)+, A1
005ACC: 0C29 0001 0000             cmpi.b  #$1, ($0,A1)
005AD2: 6600 0102                  bne     $5bd6
005AD6: 0C29 0002 0004             cmpi.b  #$2, ($4,A1)
005ADC: 6600 00F8                  bne     $5bd6
005AE0: 0C29 0000 0005             cmpi.b  #$0, ($5,A1)
005AE6: 6600 00EE                  bne     $5bd6
005AEA: 7000                       moveq   #$0, D0
005AEC: 1029 0049                  move.b  ($49,A1), D0
005AF0: C0FC 000C                  mulu.w  #$c, D0
005AF4: 2469 0044                  movea.l ($44,A1), A2
005AF8: D4C0                       adda.w  D0, A2
005AFA: 3029 0010                  move.w  ($10,A1), D0
005AFE: D05A                       add.w   (A2)+, D0
005B00: 906E 0010                  sub.w   ($10,A6), D0
005B04: 321A                       move.w  (A2)+, D1
005B06: D041                       add.w   D1, D0
005B08: B041                       cmp.w   D1, D0
005B0A: 6200 00CA                  bhi     $5bd6
005B0E: 3029 0008                  move.w  ($8,A1), D0
005B12: 321A                       move.w  (A2)+, D1
005B14: 341A                       move.w  (A2)+, D2
005B16: 4A29 0024                  tst.b   ($24,A1)
005B1A: 6700 0006                  beq     $5b22
005B1E: 4441                       neg.w   D1
005B20: 9242                       sub.w   D2, D1
005B22: D041                       add.w   D1, D0
005B24: D042                       add.w   D2, D0
005B26: 906E 0008                  sub.w   ($8,A6), D0
005B2A: B042                       cmp.w   D2, D0
005B2C: 6200 00A8                  bhi     $5bd6
005B30: 3029 000C                  move.w  ($c,A1), D0
005B34: 5140                       subq.w  #8, D0
005B36: 906E 000C                  sub.w   ($c,A6), D0
005B3A: 7210                       moveq   #$10, D1
005B3C: D041                       add.w   D1, D0
005B3E: B041                       cmp.w   D1, D0
005B40: 6200 0094                  bhi     $5bd6
005B44: 3029 00A0                  move.w  ($a0,A1), D0
005B48: 6700 008C                  beq     $5bd6
005B4C: 0C40 020A                  cmpi.w  #$20a, D0
005B50: 6600 0062                  bne     $5bb4
005B54: 0C69 0006 0026             cmpi.w  #$6, ($26,A1)
005B5A: 6700 0058                  beq     $5bb4
005B5E: 0C69 0008 0026             cmpi.w  #$8, ($26,A1)
005B64: 6700 004E                  beq     $5bb4
005B68: 122E 00A0                  move.b  ($a0,A6), D1
005B6C: 0201 000F                  andi.b  #$f, D1
005B70: 6700 0064                  beq     $5bd6
005B74: 342E 0008                  move.w  ($8,A6), D2
005B78: 9469 0008                  sub.w   ($8,A1), D2
005B7C: 6400 000E                  bcc     $5b8c
005B80: 0801 0000                  btst    #$0, D1
005B84: 6600 002E                  bne     $5bb4
005B88: 6000 000A                  bra     $5b94
005B8C: 0801 0001                  btst    #$1, D1
005B90: 6600 0022                  bne     $5bb4
005B94: 342E 0010                  move.w  ($10,A6), D2
005B98: 9469 0010                  sub.w   ($10,A1), D2
005B9C: 6400 000E                  bcc     $5bac
005BA0: 0801 0003                  btst    #$3, D1
005BA4: 6600 000E                  bne     $5bb4
005BA8: 6000 002C                  bra     $5bd6
005BAC: 0801 0002                  btst    #$2, D1
005BB0: 6700 0024                  beq     $5bd6
005BB4: B06E 00BA                  cmp.w   ($ba,A6), D0
005BB8: 6200 001C                  bhi     $5bd6
005BBC: 4A2E 00F8                  tst.b   ($f8,A6)
005BC0: 6700 000C                  beq     $5bce
005BC4: 0C29 0002 00A0             cmpi.b  #$2, ($a0,A1)
005BCA: 6700 000A                  beq     $5bd6
005BCE: 3D40 00BA                  move.w  D0, ($ba,A6)
005BD2: 3D49 00B8                  move.w  A1, ($b8,A6)
005BD6: 51CE FEF2                  dbra    D6, $5aca
005BDA: 4E75                       rts