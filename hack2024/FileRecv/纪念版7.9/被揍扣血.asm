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
0064CC: 302B 006C                  move.w  ($6c,A3), D0
0064D0: 0C40 0001                  cmpi.w  #$1, D0
0064D4: 6700 0018                  beq     $64ee
0064D8: 9041                       sub.w   D1, D0
0064DA: 6200 0012                  bhi     $64ee
0064DE: 4440                       neg.w   D0
0064E0: 0C40 0005                  cmpi.w  #$5, D0
0064E4: 6400 0008                  bcc     $64ee
0064E8: 322B 006C                  move.w  ($6c,A3), D1
0064EC: 5341                       subq.w  #1, D1
0064EE: 3C5F                       movea.w (A7)+, A6
0064F0: 4E75                       rts