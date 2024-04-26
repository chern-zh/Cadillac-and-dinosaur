*日版幻影巡逻
05E20C: 306E 0076                  movea.w ($76,A6), A0
05E210: 4A28 0000                  tst.b   ($0,A0)
05E214: 670E                       beq     $5e224
05E216: 0C28 0023 00C8             cmpi.b  #$23, ($c8,A0)		*检测是否摔倒
05E21C: 6706                       beq     $5e224
05E21E: 536E 00AA                  subq.w  #1, ($aa,A6)
05E222: 640A                       bcc     $5e22e
05E224: 3D7C 0258 00AA             move.w  #$258, ($aa,A6)
05E22A: 6100 0A7C                  bsr     $5eca8

05ECA8: 306E 0076                  movea.w ($76,A6), A0
05ECAC: 0C28 0023 00C8             cmpi.b  #$23, ($c8,A0)	*再次检测是否摔倒
05ECB2: 6700 0084                  beq     $5ed38
05ECB6: 4EB9 0000 119C             jsr     $119c.l
05ECBC: 0240 000F                  andi.w  #$f, D0
05ECC0: 6100 00E6                  bsr     $5eda8
05ECC4: 3801                       move.w  D1, D4
05ECC6: D241                       add.w   D1, D1
05ECC8: 323B 1038                  move.w  ($38,PC,D1.w), D1
05ECCC: D041                       add.w   D1, D0
05ECCE: 103B 0032                  move.b  ($32,PC,D0.w), D0
05ECD2: D02E 00A8                  add.b   ($a8,A6), D0
05ECD6: B044                       cmp.w   D4, D0
05ECD8: 6F04                       ble     $5ecde
05ECDA: 5244                       addq.w  #1, D4
05ECDC: 9044                       sub.w   D4, D0
05ECDE: 1D40 00A8                  move.b  D0, ($a8,A6)
05ECE2: D040                       add.w   D0, D0
05ECE4: 0C40 0004                  cmpi.w  #$4, D0
05ECE8: 6F02                       ble     $5ecec
05ECEA: 4240                       clr.w   D0
05ECEC: 41EE 00A2                  lea     ($a2,A6), A0
05ECF0: 3070 0000                  movea.w (A0,D0.w), A0
05ECF4: 3208                       move.w  A0, D1
05ECF6: 6604                       bne     $5ecfc
05ECF8: 5440                       addq.w  #2, D0
05ECFA: 60E8                       bra     $5ece4
05ECFC: 3D48 0076                  move.w  A0, ($76,A6)
05ED00: 4E75                       rts