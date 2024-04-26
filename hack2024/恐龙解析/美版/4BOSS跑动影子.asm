04C04C: 102E 0006                  move.b  ($6,A6), D0			*4BOSS主程序，040C为跑，040A出刀
04C050: 323B 0018                  move.w  ($18,PC,D0.w), D1	*D1为影子种类
04C054: 4EBB 1014                  jsr     ($14,PC,D1.w)		*jsr	$4c40a

04C40A: 102E 0059                  move.b  ($59,A6), D0
04C40E: 6710                       beq     $4c420
04C410: 5300                       subq.b  #1, D0
04C412: 1D40 0059                  move.b  D0, ($59,A6)
04C416: 6702                       beq     $4c41a
04C418: 4E75                       rts

04C41A: 1D7C 0001 002F             move.b  #$1, ($2f,A6)
04C420: 7000                       moveq   #$0, D0
04C422: 102E 0007                  move.b  ($7,A6), D0
04C426: 303B 0006                  move.w  ($6,PC,D0.w), D0
04C42A: 4EFB 0002                  jmp     ($2,PC,D0.w)			*jmp	$4c668

04C668: 536E 00AE                  subq.w  #1, ($ae,A6)
04C66C: 6500 FE36                  bcs     $4c4a4
04C670: 532E 00C0                  subq.b  #1, ($c0,A6)			*加载影子间隔时间？
04C674: 6400 000E                  bcc     $4c684
04C678: 1D7C 0006 00C0             move.b  #$6, ($c0,A6)
04C67E: 4EB9 0009 639E             jsr     $9639e.l				*加载影子
04C684: 532E 00B8                  subq.b  #1, ($b8,A6)
04C688: 640A                       bcc     $4c694
04C68A: 1D7C 0003 00B8             move.b  #$3, ($b8,A6)
04C690: 6100 0DC6                  bsr     $4d458
04C694: 6100 0A62                  bsr     $4d0f8
04C698: 6500 FE86                  bcs     $4c520
04C69C: 6100 0900                  bsr     $4cf9e
04C6A0: 4EB9 0000 1862             jsr     $1862.l
04C6A6: 4EF9 0000 121E             jmp     $121e.l

09639E: 4EB9 0000 4884             jsr     $4884.l
0963A4: 652E                       bcs     $963d4
0963A6: 117C 0001 0000             move.b  #$1, ($0,A0)
0963AC: 317C 006C 0020             move.w  #$6c, ($20,A0)		*影子ID
0963B2: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
0963B8: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
0963BE: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
0963C4: 216E 0028 0028             move.l  ($28,A6), ($28,A0)
0963CA: 116E 0024 0024             move.b  ($24,A6), ($24,A0)
0963D0: 3141 0026                  move.w  D1, ($26,A0)			*小类，4BOSS：3A0
0963D4: 4E75                       rts



006422: 4A6D 04AA                  tst.w   ($4aa,A5)
006426: 6700 000C                  beq     $6434
00642A: 082D 0001 0024             btst    #$1, ($24,A5)
006430: 6600 00C0                  bne     $64f2
006434: 3F0E                       move.w  A6, -(A7)
006436: 302A 0084                  move.w  ($84,A2), D0
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
00649A: 102B 0003                  move.b  ($3,A3), D0
00649E: D040                       add.w   D0, D0
0064A0: 2C7C 0002 C88E             movea.l #$2c88e, A6				*美版，我方防御
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
0064F2: 7200                       moveq   #$0, D1
0064F4: 4E75                       rts