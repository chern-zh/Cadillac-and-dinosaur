05F6CA: 422E 00A0                  clr.b   ($a0,A6)
05F6CE: 41ED 48F4                  lea     ($48f4,A5), A0
05F6D2: 7A17                       moveq   #$17, D5
05F6D4: 4A28 0000                  tst.b   ($0,A0)
05F6D8: 6718                       beq     $5f6f2
05F6DA: 0C68 0060 0020             cmpi.w  #$60, ($20,A0)
05F6E0: 6728                       beq     $5f70a
05F6E2: 0C68 0074 0020             cmpi.w  #$74, ($20,A0)
05F6E8: 6720                       beq     $5f70a
05F6EA: 0C68 0098 0020             cmpi.w  #$98, ($20,A0)
05F6F0: 6718                       beq     $5f70a
05F6F2: D1FC 0000 00E0             adda.l  #$e0, A0
05F6F8: 51CD FFDA                  dbra    D5, $5f6d4
05F6FC: 4A2E 00A0                  tst.b   ($a0,A6)
05F700: 6600 004C                  bne     $5f74e
05F704: 44FC 0001                  move    #$1, CCR
05F708: 4E75                       rts
05F70A: 4A28 00C0                  tst.b   ($c0,A0)			/检测是否欠揍状态？？
05F70E: 6AE2                       bpl     $5f6f2
05F710: 4A2E 00A0                  tst.b   ($a0,A6)
05F714: 6608                       bne     $5f71e
05F716: 2248                       movea.l A0, A1
05F718: 522E 00A0                  addq.b  #1, ($a0,A6)
05F71C: 60D4                       bra     $5f6f2
05F71E: 4A28 00C1                  tst.b   ($c1,A0)
05F722: 66CE                       bne     $5f6f2
05F724: 2448                       movea.l A0, A2
05F726: 3229 0008                  move.w  ($8,A1), D1
05F72A: 926E 0008                  sub.w   ($8,A6), D1
05F72E: 6A02                       bpl     $5f732
05F730: 4441                       neg.w   D1
05F732: 342A 0008                  move.w  ($8,A2), D2
05F736: 946E 0008                  sub.w   ($8,A6), D2
05F73A: 6A02                       bpl     $5f73e
05F73C: 4442                       neg.w   D2
05F73E: B441                       cmp.w   D1, D2
05F740: 6E0C                       bgt     $5f74e
05F742: 3D4A 0076                  move.w  A2, ($76,A6)
05F746: 157C 0001 00C1             move.b  #$1, ($c1,A2)
05F74C: 600A                       bra     $5f758
05F74E: 3D49 0076                  move.w  A1, ($76,A6)
05F752: 137C 0001 00C1             move.b  #$1, ($c1,A1)
05F758: 8040                       or.w    D0, D0
05F75A: 4E75                       rts