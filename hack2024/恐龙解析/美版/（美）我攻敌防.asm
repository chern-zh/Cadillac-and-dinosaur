
（$58,A6）			/摔人时0A





011092: 102A 0003                  move.b  ($3,A2), D0		/A2为人物下来落的炸弹基址
011096: D040                       add.w   D0, D0
011098: D040                       add.w   D0, D0
01109A: 287C 000A 26FC             movea.l #$a26fc, A4
0110A0: 2874 0000                  movea.l (A4,D0.w), A4
0110A4: 7000                       moveq   #$0, D0
0110A6: 102A 0058                  move.b  ($58,A2), D0		/基址+58为6E
0110AA: 0C00 006E                  cmpi.b  #$6e, D0
0110AE: 6700 0116                  beq     $111c6
0110B2: 0C00 006C                  cmpi.b  #$6c, D0
0110B6: 6700 010E                  beq     $111c6
0110BA: D040                       add.w   D0, D0
0110BC: D040                       add.w   D0, D0
0110BE: D8C0                       adda.w  D0, A4
0110C0: 376B 006C 006E             move.w  ($6c,A3), ($6e,A3)
0110C6: 7200                       moveq   #$0, D1
0110C8: 121C                       move.b  (A4)+, D1
0110CA: 0C6A 0203 00A0             cmpi.w  #$203, ($a0,A2)
0110D0: 6600 0006                  bne     $110d8
0110D4: 6100 018C                  bsr     $11262
0110D8: 4EB9 0002 BA2A             jsr     $2ba2a.l
0110DE: 936B 006C                  sub.w   D1, ($6c,A3)


02B904: 426D 04F4                  clr.w	($4f4,A5)
02B908: 4A6D 04AA                  tst.w   ($4aa,A5)			/什么标志位？
02B90C: 6700 001C                  beq     $2b92a
02B910: 082D 0001 0024             btst    #$1, ($24,A5)		/
02B916: 6600 010E                  bne     $2ba26				/不扣血
02B91A: 082D 0002 0024             btst    #$2, ($24,A5)		/什么标志位？
02B920: 6700 0008                  beq     $2b92a
02B924: 323C 0064                  move.w  #$64, D1				/什么情况下直接扣一行血？？？
02B928: 4E75                       rts
02B92A: 0C2B 0004 002E             cmpi.b  #$4, ($2e,A3)		/($2e,A3)敌兵什么属性？
02B930: 6600 0020                  bne     $2b952
02B934: 2C7C 000A 320C             movea.l #$a320c, A6
02B93A: 7000                       moveq   #$0, D0
02B93C: 102B 0058                  move.b  ($58,A3), D0
02B940: D040                       add.w   D0, D0
02B942: 3036 0000                  move.w  (A6,D0.w), D0
02B946: 6700 000A                  beq     $2b952
02B94A: C2C0                       mulu.w  D0, D1
02B94C: EA49                       lsr.w   #5, D1
02B94E: 50ED 04F4                  st      ($4f4,A5)			/st就是set
02B952: 2C7C 000A 32FA             movea.l #$a32fa, A6
02B958: 302B 0084                  move.w  ($84,A3), D0			/($84,A3)敌兵什么属性？
02B95C: 4DF6 0000                  lea     (A6,D0.w), A6
02B960: 101E                       move.b  (A6)+, D0
02B962: D000                       add.b   D0, D0
02B964: B02A 0058                  cmp.b   ($58,A2), D0
02B968: 6700 0012                  beq     $2b97c
02B96C: 4DEE 0001                  lea     ($1,A6), A6
02B970: 101E                       move.b  (A6)+, D0
02B972: D000                       add.b   D0, D0
02B974: B02A 0058                  cmp.b   ($58,A2), D0
02B978: 6600 000E                  bne     $2b988
02B97C: 7000                       moveq   #$0, D0
02B97E: 1016                       move.b  (A6), D0
02B980: C2C0                       mulu.w  D0, D1
02B982: EA49                       lsr.w   #5, D1
02B984: 50ED 04F5                  st      ($4f5,A5)
02B988: 7000                       moveq   #$0, D0
02B98A: 102A 00C6                  move.b  ($c6,A2), D0			/角色暴击
02B98E: C2C0                       mulu.w  D0, D1				/暴击作用
02B990: 3A2D 05EE                  move.w  ($5ee,A5), D5		/难度
02B994: 302B 0084                  move.w  ($84,A3), D0			/敌兵防御力
02B998: E748                       lsl.w   #3, D0
02B99A: D045                       add.w   D5, D0
02B99C: 7400                       moveq   #$0, D2
02B99E: 4DFA 052E                  lea     ($52e,PC), A6; ($2bece)
02B9A2: 1436 0000                  move.b  (A6,D0.w), D2
02B9A6: C2C2                       mulu.w  D2, D1
02B9A8: 700A                       moveq   #$a, D0
02B9AA: E0A9                       lsr.l   D0, D1
02B9AC: 6600 0004                  bne     $2b9b2
02B9B0: 7201                       moveq   #$1, D1
02B9B2: 362B 006C                  move.w  ($6c,A3), D3			/敌兵血量带入
02B9B6: 7400                       moveq   #$0, D2
02B9B8: 0C43 0064                  cmpi.w  #$64, D3
02B9BC: 6300 000C                  bls     $2b9ca
02B9C0: 0642 0040                  addi.w  #$40, D2				/血量行数影响D2值
02B9C4: 0443 0064                  subi.w  #$64, D3				/血量高于64的敌兵循环减到64内
02B9C8: 64EE                       bcc     $2b9b8
02B9CA: 4EB9 0000 119C             jsr     $119c.l
02B9D0: 0240 003E                  andi.w  #$3e, D0
02B9D4: D440                       add.w   D0, D2
02B9D6: 4DFA 0276                  lea     ($276,PC), A6; ($2bc4e)
02B9DA: 3436 2000                  move.w  (A6,D2.w), D2
02B9DE: C2C2                       mulu.w  D2, D1
02B9E0: 7400                       moveq   #$0, D2
02B9E2: 0C43 004B                  cmpi.w  #$4b, D3
02B9E6: 6400 001C                  bcc     $2ba04
02B9EA: 7440                       moveq   #$40, D2
02B9EC: 0C43 0032                  cmpi.w  #$32, D3
02B9F0: 6400 0012                  bcc     $2ba04
02B9F4: 343C 0080                  move.w  #$80, D2
02B9F8: 0C43 0019                  cmpi.w  #$19, D3
02B9FC: 6400 0006                  bcc     $2ba04
02BA00: 343C 00C0                  move.w  #$c0, D2
02BA04: 4EB9 0000 119C             jsr     $119c.l
02BA0A: 0240 003E                  andi.w  #$3e, D0
02BA0E: D440                       add.w   D0, D2
02BA10: 4DFA 013C                  lea     ($13c,PC), A6; ($2bb4e)
02BA14: 3436 2000                  move.w  (A6,D2.w), D2
02BA18: C2C2                       mulu.w  D2, D1
02BA1A: 700A                       moveq   #$a, D0
02BA1C: E069                       lsr.w   D0, D1
02BA1E: 6600 0004                  bne     $2ba24
02BA22: 7201                       moveq   #$1, D1
02BA24: 4E75                       rts
02BA26: 7200                       moveq   #$0, D1
02BA28: 4E75                       rts









