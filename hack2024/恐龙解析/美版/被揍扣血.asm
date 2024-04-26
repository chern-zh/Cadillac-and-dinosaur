006422: 4A6D 04AA                  tst.w   ($4aa,A5)
006426: 6700 000C                  beq     $6434
00642A: 082D 0001 0024             btst    #$1, ($24,A5)
006430: 6600 00C0                  bne     $64f2
006434: 3F0E                       move.w  A6, -(A7)
006436: 302A 0084                  move.w  ($84,A2), D0		/攻击力？
00643A: E748                       lsl.w   #3, D0
00643C: 2C7C 0002 C3AE             movea.l #$2c3ae, A6
006442: DCC0                       adda.w  D0, A6
006444: 302D 05EE                  move.w  ($5ee,A5), D0
006448: 0240 001F                  andi.w  #$1f, D0
00644C: 1036 0000                  move.b  (A6,D0.w), D0
006450: C2C0                       mulu.w  D0, D1
006452: EA49                       lsr.w   #5, D1
006454: 302B 006C                  move.w  ($6c,A3), D0
006458: 7400                       moveq   #$0, D2
00645A: 0C40 004C                  cmpi.w  #$4c, D0
00645E: 6400 001C                  bcc     $647c
006462: 7440                       moveq   #$40, D2
006464: 0C40 0033                  cmpi.w  #$33, D0
006468: 6400 0012                  bcc     $647c
00646C: 343C 0080                  move.w  #$80, D2
006470: 0C40 001A                  cmpi.w  #$1a, D0
006474: 6400 0006                  bcc     $647c
006478: 343C 00C0                  move.w  #$c0, D2
00647C: 4EB9 0000 119C             jsr     $119c.l
006482: 0240 003E                  andi.w  #$3e, D0
006486: D440                       add.w   D0, D2
006488: 2C7C 0002 C896             movea.l #$2c896, A6
00648E: 9276 2000                  sub.w   (A6,D2.w), D1
006492: 6A00 0004                  bpl     $6498
006496: 7201                       moveq   #$1, D1
006498: 7000                       moveq   #$0, D0
00649A: 102B 0003                  move.b  ($3,A3), D0		/角色ID，决定防御，可以改汉娜防御。
00649E: D040                       add.w   D0, D0
0064A0: 2C7C 0002 C88E             movea.l #$2c88e, A6		/2C88E表格四个数据为四人防御值，越低越强
0064A6: 3036 0000                  move.w  (A6,D0.w), D0
0064AA: C2C0                       mulu.w  D0, D1
0064AC: EA49                       lsr.w   #5, D1
0064AE: 302B 006C                  move.w  ($6c,A3), D0
0064B2: E448                       lsr.w   #2, D0
0064B4: 0240 001E                  andi.w  #$1e, D0
0064B8: 2C7C 0002 C996             movea.l #$2c996, A6
0064BE: 3036 0000                  move.w  (A6,D0.w), D0
0064C2: C2C0                       mulu.w  D0, D1
0064C4: EA49                       lsr.w   #5, D1
0064C6: 6600 0004                  bne     $64cc
0064CA: 7201                       moveq   #$1, D1
0064CC: 302B 006C                  move.w  ($6c,A3), D0		*玩家血量放入D0，D1为应扣血值
0064D0: 0C40 0001                  cmpi.w  #$1, D0			*等于1退出
0064D4: 6700 0018                  beq     $64ee			*等于1退出
0064D8: 9041                       sub.w   D1, D0			*D0减去D1
0064DA: 6200 0012                  bhi     $64ee			*够减，大于零退出去，进行扣血
0064DE: 4440                       neg.w   D0				*取相反数
0064E0: 0C40 0005                  cmpi.w  #$5, D0			*
0064E4: 6400 0008                  bcc     $64ee
0064E8: 322B 006C                  move.w  ($6c,A3), D1
0064EC: 5341                       subq.w  #1, D1
0064EE: 3C5F                       movea.w (A7)+, A6
0064F0: 4E75                       rts


*另类扣血，马云手雷等，
010E4A: 7000                       moveq   #$0, D0
010E4C: 102A 0049                  move.b  ($49,A2), D0
010E50: 6700 0142                  beq     $10f94
010E54: 7200                       moveq   #$0, D1
010E56: 122B 0048                  move.b  ($48,A3), D1
010E5A: 6700 0138                  beq     $10f94
010E5E: 6100 1A98                  bsr     $128f8
010E62: 6400 0130                  bcc     $10f94
010E66: 4A2A 0002                  tst.b   ($2,A2)
010E6A: 6B00 000E                  bmi     $10e7a
010E6E: 302A 0010                  move.w  ($10,A2), D0
010E72: B06B 0010                  cmp.w   ($10,A3), D0
010E76: 6600 011C                  bne     $10f94
010E7A: 0C2A 006E 0058             cmpi.b  #$6e, ($58,A2)
010E80: 6700 0112                  beq     $10f94
010E84: 0C2A 006C 0058             cmpi.b  #$6c, ($58,A2)
010E8A: 6700 0108                  beq     $10f94
010E8E: 177C 0002 0000             move.b  #$2, ($0,A3)
010E94: 277C 0202 0000 0004        move.l  #$2020000, ($4,A3)
010E9C: 7000                       moveq   #$0, D0
010E9E: 1740 007A                  move.b  D0, ($7a,A3)
010EA2: 3740 00B6                  move.w  D0, ($b6,A3)
010EA6: 177C 0001 00C5             move.b  #$1, ($c5,A3)
010EAC: 374A 0068                  move.w  A2, ($68,A3)
010EB0: 177C 003C 00CB             move.b  #$3c, ($cb,A3)
010EB6: 522B 00CA                  addq.b  #1, ($ca,A3)
010EBA: 1740 00CD                  move.b  D0, ($cd,A3)
010EBE: 176A 005E 00E9             move.b  ($5e,A2), ($e9,A3)
010EC4: 7000                       moveq   #$0, D0
010EC6: 4A2A 0002                  tst.b   ($2,A2)
010ECA: 6B00 000A                  bmi     $10ed6
010ECE: 102A 0003                  move.b  ($3,A2), D0
010ED2: D040                       add.w   D0, D0
010ED4: D040                       add.w   D0, D0
010ED6: 287C 000A 26FC             movea.l #$a26fc, A4
010EDC: 2874 0000                  movea.l (A4,D0.w), A4
010EE0: 7000                       moveq   #$0, D0
010EE2: 102A 0058                  move.b  ($58,A2), D0
010EE6: D040                       add.w   D0, D0
010EE8: D040                       add.w   D0, D0
010EEA: D8C0                       adda.w  D0, A4
010EEC: 376B 006C 006E             move.w  ($6c,A3), ($6e,A3)
010EF2: 7200                       moveq   #$0, D1
010EF4: 121C                       move.b  (A4)+, D1
010EF6: 4A2A 0002                  tst.b   ($2,A2)
010EFA: 6B00 0014                  bmi     $10f10
010EFE: 536B 006C                  subq.w  #1, ($6c,A3)
010F02: 6E00 0018                  bgt     $10f1c
010F06: 377C 0001 006C             move.w  #$1, ($6c,A3)
010F0C: 6000 000E                  bra     $10f1c
010F10: 936B 006C                  sub.w   D1, ($6c,A3)
010F14: 6E00 0006                  bgt     $10f1c
010F18: 426B 006C                  clr.w   ($6c,A3)
010F1C: 377C 0078 00F6             move.w  #$78, ($f6,A3)
010F22: 101C                       move.b  (A4)+, D0
010F24: 912B 0078                  sub.b   D0, ($78,A3)
010F28: 6400 0006                  bcc     $10f30
010F2C: 422B 0078                  clr.b   ($78,A3)
010F30: 176A 005A 005A             move.b  ($5a,A2), ($5a,A3)
010F36: 101C                       move.b  (A4)+, D0
010F38: 0C2B 0022 00C8             cmpi.b  #$22, ($c8,A3)
010F3E: 6600 0004                  bne     $10f44
010F42: 7022                       moveq   #$22, D0
010F44: 1740 007B                  move.b  D0, ($7b,A3)
010F48: 1740 0006                  move.b  D0, ($6,A3)
010F4C: 422B 0007                  clr.b   ($7,A3)
010F50: 101C                       move.b  (A4)+, D0
010F52: 1740 0059                  move.b  D0, ($59,A3)
010F56: 1540 0059                  move.b  D0, ($59,A2)
010F5A: 0C6A 0202 00A0             cmpi.w  #$202, ($a0,A2)
010F60: 6700 000C                  beq     $10f6e
010F64: 0C6A 0203 00A0             cmpi.w  #$203, ($a0,A2)
010F6A: 6600 000A                  bne     $10f76
010F6E: 3C6A 0070                  movea.w ($70,A2), A6
010F72: 1D40 0059                  move.b  D0, ($59,A6)
010F76: 101C                       move.b  (A4)+, D0
010F78: 6700 0008                  beq     $10f82
010F7C: 4EB9 0000 962A             jsr     $962a.l
010F82: 101C                       move.b  (A4)+, D0
010F84: 7A00                       moveq   #$0, D5
010F86: 1A1C                       move.b  (A4)+, D5
010F88: 175C 009A                  move.b  (A4)+, ($9a,A3)
010F8C: 6100 1792                  bsr     $12720
010F90: 6000 07A6                  bra     $11738
010F94: 4E75                       rts