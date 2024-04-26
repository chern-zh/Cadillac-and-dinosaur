*摔人是走此段指令
012458: 45D6                       lea     (A6), A2		*A6为玩家
01245A: 366E 0070                  movea.w ($70,A6), A3		*被揍的敌兵移入A3
01245E: 374E 0068                  move.w  A6, ($68,A3)		*玩家放到敌兵$68处
012462: 176E 005E 005E             move.b  ($5e,A6), ($5e,A3)
012468: 176E 0002 0002             move.b  ($2,A6), ($2,A3)
01246E: 302E 0020                  move.w  ($20,A6), D0		*玩家角色
012472: 287C 000A 0EA4             movea.l #$a0ea4, A4
012478: 2874 0000                  movea.l (A4,D0.w), A4	*杰克A0EB4，麦斯A1464
01247C: 7000                       moveq   #$0, D0
01247E: 102E 0058                  move.b  ($58,A6), D0		*（$58,A6）			/摔人时0A
012482: D040                       add.w   D0, D0
012484: D040                       add.w   D0, D0
012486: D8C0                       adda.w  D0, A4			*摔人A4+$28
012488: 376B 006C 006E             move.w  ($6c,A3), ($6e,A3)
01248E: 7200                       moveq   #$0, D1
012490: 121C                       move.b  (A4)+, D1
012492: 3F0E                       move.w  A6, -(A7)
012494: 4EB9 0002 B836             jsr     $2b836.l
01249A: 3C5F                       movea.w (A7)+, A6
01249C: 936B 006C                  sub.w   D1, ($6c,A3)

/日版：
02B834: 0805 426D                  btst    #$6d, D5
02B838: 04F4                       dc.w    $04f4; ILLEGAL
02B83A: 4A6D 04AA                  tst.w   ($4aa,A5)
02B83E: 6700 001C                  beq     $2b85c
02B842: 082D 0001 0024             btst    #$1, ($24,A5)
02B848: 6600 010E                  bne     $2b958
02B84C: 082D 0002 0024             btst    #$2, ($24,A5)
02B852: 6700 0008                  beq     $2b85c
02B856: 323C 0064                  move.w  #$64, D1
02B85A: 4E75                       rts
02B85C: 0C2B 0004 002E             cmpi.b  #$4, ($2e,A3)
02B862: 6600 0020                  bne     $2b884
02B866: 2C7C 000A 19B4             movea.l #$a19b4, A6
02B86C: 7000                       moveq   #$0, D0
02B86E: 102B 0058                  move.b  ($58,A3), D0
02B872: D040                       add.w   D0, D0
02B874: 3036 0000                  move.w  (A6,D0.w), D0
02B878: 6700 000A                  beq     $2b884
02B87C: C2C0                       mulu.w  D0, D1
02B87E: EA49                       lsr.w   #5, D1
02B880: 50ED 04F4                  st      ($4f4,A5)
02B884: 2C7C 000A 1AA2             movea.l #$a1aa2, A6
02B88A: 302B 0084                  move.w  ($84,A3), D0
02B88E: 4DF6 0000                  lea     (A6,D0.w), A6
02B892: 101E                       move.b  (A6)+, D0
02B894: D000                       add.b   D0, D0
02B896: B02A 0058                  cmp.b   ($58,A2), D0
02B89A: 6700 0012                  beq     $2b8ae
02B89E: 4DEE 0001                  lea     ($1,A6), A6
02B8A2: 101E                       move.b  (A6)+, D0
02B8A4: D000                       add.b   D0, D0
02B8A6: B02A 0058                  cmp.b   ($58,A2), D0
02B8AA: 6600 000E                  bne     $2b8ba
02B8AE: 7000                       moveq   #$0, D0
02B8B0: 1016                       move.b  (A6), D0
02B8B2: C2C0                       mulu.w  D0, D1
02B8B4: EA49                       lsr.w   #5, D1
02B8B6: 50ED 04F5                  st      ($4f5,A5)
02B8BA: 7000                       moveq   #$0, D0
02B8BC: 102A 00C6                  move.b  ($c6,A2), D0
02B8C0: C2C0                       mulu.w  D0, D1
02B8C2: 3A2D 05EE                  move.w  ($5ee,A5), D5
02B8C6: 302B 0084                  move.w  ($84,A3), D0
02B8CA: E748                       lsl.w   #3, D0
02B8CC: D045                       add.w   D5, D0
02B8CE: 7400                       moveq   #$0, D2
02B8D0: 4DFA 052E                  lea     ($52e,PC), A6; ($2be00)
02B8D4: 1436 0000                  move.b  (A6,D0.w), D2
02B8D8: C2C2                       mulu.w  D2, D1
02B8DA: 700A                       moveq   #$a, D0
02B8DC: E0A9                       lsr.l   D0, D1
02B8DE: 6600 0004                  bne     $2b8e4
02B8E2: 7201                       moveq   #$1, D1
02B8E4: 362B 006C                  move.w  ($6c,A3), D3
02B8E8: 7400                       moveq   #$0, D2
02B8EA: 0C43 0064                  cmpi.w  #$64, D3
02B8EE: 6300 000C                  bls     $2b8fc
02B8F2: 0642 0040                  addi.w  #$40, D2
02B8F6: 0443 0064                  subi.w  #$64, D3
02B8FA: 64EE                       bcc     $2b8ea
02B8FC: 4EB9 0000 119C             jsr     $119c.l
02B902: 0240 003E                  andi.w  #$3e, D0
02B906: D440                       add.w   D0, D2
02B908: 4DFA 0276                  lea     ($276,PC), A6; ($2bb80)
02B90C: 3436 2000                  move.w  (A6,D2.w), D2
02B910: C2C2                       mulu.w  D2, D1
02B912: 7400                       moveq   #$0, D2
02B914: 0C43 004B                  cmpi.w  #$4b, D3
02B918: 6400 001C                  bcc     $2b936
02B91C: 7440                       moveq   #$40, D2
02B91E: 0C43 0032                  cmpi.w  #$32, D3
02B922: 6400 0012                  bcc     $2b936
02B926: 343C 0080                  move.w  #$80, D2
02B92A: 0C43 0019                  cmpi.w  #$19, D3
02B92E: 6400 0006                  bcc     $2b936
02B932: 343C 00C0                  move.w  #$c0, D2
02B936: 4EB9 0000 119C             jsr     $119c.l
02B93C: 0240 003E                  andi.w  #$3e, D0
02B940: D440                       add.w   D0, D2
02B942: 4DFA 013C                  lea     ($13c,PC), A6; ($2ba80)
02B946: 3436 2000                  move.w  (A6,D2.w), D2
02B94A: C2C2                       mulu.w  D2, D1
02B94C: 700A                       moveq   #$a, D0
02B94E: E069                       lsr.w   D0, D1
02B950: 6600 0004                  bne     $2b956
02B954: 7201                       moveq   #$1, D1
02B956: 4E75                       rts
02B958: 7200                       moveq   #$0, D1
02B95A: 4E75                       rts

















