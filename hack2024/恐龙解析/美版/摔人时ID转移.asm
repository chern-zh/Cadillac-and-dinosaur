1094A
0128F8: 7400                       moveq   #$0, D2
0128FA: 142A 004A                  move.b  ($4a,A2), D2
0128FE: D442                       add.w   D2, D2
012900: 842B 004A                  or.b    ($4a,A3), D2
012904: D442                       add.w   D2, D2
012906: 343B 2006                  move.w  ($6,PC,D2.w), D2
01290A: 4EFB 2002                  jmp     ($2,PC,D2.w)
01290E: 0008                       dc.w    $0008; ILLEGAL
012910: 009A 014E 0200             ori.l   #$14e0200, (A2)+
012916: C0FC 000C                  mulu.w  #$c, D0
01291A: 286A 0044                  movea.l ($44,A2), A4
01291E: D8C0                       adda.w  D0, A4
012920: 2B4C 8ED0                  move.l  A4, (-$7130,A5)
012924: C2FC 000C                  mulu.w  #$c, D1
012928: 2C6B 0044                  movea.l ($44,A3), A6
01292C: DCC1                       adda.w  D1, A6
01292E: 2B4E 8ED4                  move.l  A6, (-$712c,A5)
012932: 302A 0010                  move.w  ($10,A2), D0		*玩家Y
012936: D05C                       add.w   (A4)+, D0
012938: 322B 0010                  move.w  ($10,A3), D1		*敌兵Y
01293C: D25E                       add.w   (A6)+, D1
01293E: 9041                       sub.w   D1, D0
012940: 321C                       move.w  (A4)+, D1
012942: D041                       add.w   D1, D0
012944: D25E                       add.w   (A6)+, D1
012946: B041                       cmp.w   D1, D0
012948: 6200 005A                  bhi     $129a4
01294C: 302A 0008                  move.w  ($8,A2), D0
012950: 321C                       move.w  (A4)+, D1
012952: 341C                       move.w  (A4)+, D2
012954: 4A2A 0024                  tst.b   ($24,A2)
012958: 6700 0006                  beq     $12960
01295C: 4441                       neg.w   D1
01295E: 9242                       sub.w   D2, D1
012960: D041                       add.w   D1, D0
012962: 322B 0008                  move.w  ($8,A3), D1
012966: 361E                       move.w  (A6)+, D3
012968: 381E                       move.w  (A6)+, D4
01296A: 4A2B 0024                  tst.b   ($24,A3)
01296E: 6700 0006                  beq     $12976
012972: 4443                       neg.w   D3
012974: 9644                       sub.w   D4, D3
012976: D243                       add.w   D3, D1
012978: 9041                       sub.w   D1, D0
01297A: D042                       add.w   D2, D0
01297C: D444                       add.w   D4, D2
01297E: B042                       cmp.w   D2, D0
012980: 6200 0022                  bhi     $129a4
012984: 302A 000C                  move.w  ($c,A2), D0
012988: D05C                       add.w   (A4)+, D0
01298A: 322B 000C                  move.w  ($c,A3), D1
01298E: D25E                       add.w   (A6)+, D1
012990: 9041                       sub.w   D1, D0
012992: 321C                       move.w  (A4)+, D1
012994: D041                       add.w   D1, D0
012996: D25E                       add.w   (A6)+, D1
012998: B041                       cmp.w   D1, D0
01299A: 6200 0008                  bhi     $129a4
01299E: 44FC 0001                  move    #$1, CCR
0129A2: 4E75                       rts
0129A4: 8040                       or.w    D0, D0
0129A6: 4E75                       rts