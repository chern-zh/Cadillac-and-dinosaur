
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
02B958: 302B 0084                  move.w  ($84,A3), D0			/($84,A3)
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

				*武器伤害，炸药桶伤害
02BA2A: 426D 04F4                  clr.w   ($4f4,A5)
02BA2E: 4A6D 04AA                  tst.w   ($4aa,A5)
02BA32: 6700 000A                  beq     $2ba3e
02BA36: 082D 0001 0024             btst    #$1, ($24,A5)
02BA3C: 66E8                       bne     $2ba26
02BA3E: 0C2B 0004 002E             cmpi.b  #$4, ($2e,A3)
02BA44: 6600 0020                  bne     $2ba66
02BA48: 2C7C 000A 320C             movea.l #$a320c, A6
02BA4E: 7000                       moveq   #$0, D0
02BA50: 102B 0058                  move.b  ($58,A3), D0
02BA54: D040                       add.w   D0, D0
02BA56: 3036 0000                  move.w  (A6,D0.w), D0
02BA5A: 6700 000A                  beq     $2ba66
02BA5E: C2C0                       mulu.w  D0, D1
02BA60: EA89                       lsr.l   #5, D1
02BA62: 50ED 04F4                  st      ($4f4,A5)
02BA66: 142A 0058                  move.b  ($58,A2), D2
02BA6A: 2C7C 000A 32FA             movea.l #$a32fa, A6
02BA70: 302B 0084                  move.w  ($84,A3), D0
02BA74: 4DF6 0000                  lea     (A6,D0.w), A6
02BA78: 101E                       move.b  (A6)+, D0
02BA7A: D000                       add.b   D0, D0
02BA7C: B002                       cmp.b   D2, D0
02BA7E: 6700 0010                  beq     $2ba90
02BA82: 4DEE 0001                  lea     ($1,A6), A6
02BA86: 101E                       move.b  (A6)+, D0
02BA88: D000                       add.b   D0, D0
02BA8A: B002                       cmp.b   D2, D0
02BA8C: 6600 000E                  bne     $2ba9c
02BA90: 7000                       moveq   #$0, D0
02BA92: 1016                       move.b  (A6), D0
02BA94: C2C0                       mulu.w  D0, D1
02BA96: EA49                       lsr.w   #5, D1
02BA98: 50ED 04F5                  st      ($4f5,A5)
02BA9C: 4A2A 0002                  tst.b   ($2,A2)				*检测油桶炸弹是谁打破的，FF为敌兵，马云扔的手榴弹也为FF，0，1，2为玩家
02BAA0: 6B00 0020                  bmi     $2bac2
02BAA4: 7000                       moveq   #$0, D0
02BAA6: 102A 0002                  move.b  ($2,A2), D0
02BAAA: 0240 0003                  andi.w  #$3, D0
02BAAE: D040                       add.w   D0, D0
02BAB0: D040                       add.w   D0, D0
02BAB2: 4DFA F54E                  lea     (-$ab2,PC), A6; ($2b002)
02BAB6: 2C76 0000                  movea.l (A6,D0.w), A6			*武器或油桶归属玩家P数，FFB274等
02BABA: 7000                       moveq   #$0, D0
02BABC: 102E 00C6                  move.b  ($c6,A6), D0
02BAC0: C2C0                       mulu.w  D0, D1
02BAC2: 3A2D 05EE                  move.w  ($5ee,A5), D5
02BAC6: 302B 0084                  move.w  ($84,A3), D0
02BACA: E748                       lsl.w   #3, D0
02BACC: D045                       add.w   D5, D0
02BACE: 7400                       moveq   #$0, D2
02BAD0: 4DFA 03FC                  lea     ($3fc,PC), A6; ($2bece)
02BAD4: 1436 0000                  move.b  (A6,D0.w), D2
02BAD8: C2C2                       mulu.w  D2, D1
02BADA: 700A                       moveq   #$a, D0
02BADC: E0A9                       lsr.l   D0, D1
02BADE: 6600 0004                  bne     $2bae4
02BAE2: 7201                       moveq   #$1, D1
02BAE4: 362B 006C                  move.w  ($6c,A3), D3
02BAE8: 7400                       moveq   #$0, D2
02BAEA: 0C43 0064                  cmpi.w  #$64, D3
02BAEE: 6300 000C                  bls     $2bafc
02BAF2: 0642 0040                  addi.w  #$40, D2
02BAF6: 0443 0064                  subi.w  #$64, D3
02BAFA: 64EE                       bcc     $2baea
02BAFC: 4EB9 0000 119C             jsr     $119c.l
02BB02: 0240 003E                  andi.w  #$3e, D0
02BB06: D440                       add.w   D0, D2
02BB08: 4DFA 0144                  lea     ($144,PC), A6; ($2bc4e)
02BB0C: 3436 2000                  move.w  (A6,D2.w), D2
02BB10: C2C2                       mulu.w  D2, D1
02BB12: 7400                       moveq   #$0, D2
02BB14: 0C43 004B                  cmpi.w  #$4b, D3
02BB18: 6400 001C                  bcc     $2bb36
02BB1C: 7440                       moveq   #$40, D2
02BB1E: 0C43 0032                  cmpi.w  #$32, D3
02BB22: 6400 0012                  bcc     $2bb36
02BB26: 343C 0080                  move.w  #$80, D2
02BB2A: 0C43 0019                  cmpi.w  #$19, D3
02BB2E: 6400 0006                  bcc     $2bb36
02BB32: 343C 00C0                  move.w  #$c0, D2
02BB36: 4EB9 0000 119C             jsr     $119c.l
02BB3C: 0240 003E                  andi.w  #$3e, D0
02BB40: D440                       add.w   D0, D2
02BB42: 343B 200A                  move.w  ($a,PC,D2.w), D2
02BB46: C2C2                       mulu.w  D2, D1
02BB48: 700A                       moveq   #$a, D0
02BB4A: E0A9                       lsr.l   D0, D1
02BB4C: 4E75                       rts



011A0C: 176A 005E 005E             move.b  ($5e,A2), ($5e,A3)
011A12: 176A 0002 0002             move.b  ($2,A2), ($2,A3)			*玩家打油桶，玩家P数移到油桶
011A18: 422B 007A                  clr.b   ($7a,A3)
011A1C: 374A 0068                  move.w  A2, ($68,A3)
011A20: 302A 0020                  move.w  ($20,A2), D0


012098: 177C 0002 0000             move.b  #$2, ($0,A3)
01209E: 177C FFFF 0002             move.b  #$ff, ($2,A3)			*敌兵打油桶，FF移到油桶上
0120A4: 422B 007A                  clr.b   ($7a,A3)
0120A8: 374A 0068                  move.w  A2, ($68,A3)


027DAA: 4EB9 0000 4818             jsr     $4818.l
027DB0: 6500 0024                  bcs     $27dd6
027DB4: 117C 0001 0000             move.b  #$1, ($0,A0)
027DBA: 317C 0004 0020             move.w  #$4, ($20,A0)
027DC0: 3140 0008                  move.w  D0, ($8,A0)
027DC4: 3141 000C                  move.w  D1, ($c,A0)
027DC8: 3142 0010                  move.w  D2, ($10,A0)
027DCC: 317C 0004 0026             move.w  #$4, ($26,A0)
027DD2: 3143 005C                  move.w  D3, ($5c,A0)
027DD6: 4E75                       rts
027DD8: 4EB9 0000 4818             jsr     $4818.l
027DDE: 6500 0034                  bcs     $27e14
027DE2: 117C 0001 0000             move.b  #$1, ($0,A0)
027DE8: 316E 0002 0002             move.w  ($2,A6), ($2,A0)			*油桶爆炸，把油桶上P数移到炸弹上
027DEE: 317C 0004 0020             move.w  #$4, ($20,A0)
027DF4: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
027DFA: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
027E00: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
027E06: 3140 0026                  move.w  D0, ($26,A0)
027E0A: 116E 0051 0051             move.b  ($51,A6), ($51,A0)
027E10: 314E 0070                  move.w  A6, ($70,A0)
027E14: 4E75                       rts