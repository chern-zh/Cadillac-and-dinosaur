*==============================持物时始终运行的指令=======================================
023858: 6100 00D8                  bsr     $23932
02385C: 6100 0148                  bsr     $239a6


023932: 4A2A 00B6                  tst.b   ($b6,A2)			*等于0是抗箱子吗？
023936: 6700 050A                  beq     $23e42
02393A: 7000                       moveq   #$0, D0
02393C: 302A 00B6                  move.w  ($b6,A2), D0
023940: 0240 00FF                  andi.w  #$ff, D0
023944: 5940                       subq.w  #4, D0
023946: B06D 8F58                  cmp.w   (-$70a8,A5), D0
02394A: 6700 0010                  beq     $2395c
02394E: 3B40 8F58                  move.w  D0, (-$70a8,A5)
023952: 3B7C 0001 8F68             move.w  #$1, (-$7098,A5)
023958: 6000 002C                  bra     $23986
02395C: 48E7 0010                  movem.l A3, -(A7)
023960: 366A 00B4                  movea.w ($b4,A2), A3
023964: 302B 006C                  move.w  ($6c,A3), D0
023968: 4CDF 0800                  movem.l (A7)+, A3
02396C: B06D 8F60                  cmp.w   (-$70a0,A5), D0		*子弹数量是否改变，决定是否重新写入现存
023970: 6700 0024                  beq     $23996
023974: 3B40 8F60                  move.w  D0, (-$70a0,A5)
023978: 4A6D 8F60                  tst.w   (-$70a0,A5)			*子弹数量等于0时进入掉枪标志位！
02397C: 6700 0024                  beq     $239a2
023980: 3B7C 0001 8F68             move.w  #$1, (-$7098,A5)
023986: 302A 00B6                  move.w  ($b6,A2), D0			*枪支类型
02398A: 0240 00FF                  andi.w  #$ff, D0
02398E: 0C40 0009                  cmpi.w  #$9, D0				*9是火箭炮，大于9为非枪支武器
023992: 6200 0004                  bhi     $23998
023996: 4E75                       rts

0239A6: 4A2A 00B6                  tst.b   ($b6,A2)
0239AA: 6700 0064                  beq     $23a10
0239AE: 302A 00B6                  move.w  ($b6,A2), D0
0239B2: 0240 00FF                  andi.w  #$ff, D0
0239B6: 0C40 0009                  cmpi.w  #$9, D0		*9是火箭炮，大于9为非枪支武器
0239BA: 6200 0054                  bhi     $23a10
0239BE: 0C40 0004                  cmpi.w  #$4, D0			*步枪，手枪4，UZI机枪6，M16是7，霰弹枪8，火箭炮9
0239C2: 6D00 0030                  blt     $239f4
0239C6: 4A6D 8F68                  tst.w   (-$7098,A5)
0239CA: 6700 0044                  beq     $23a10
0239CE: 5940                       subq.w  #4, D0
0239D0: 48E7 0080                  movem.l A0, -(A7)
0239D4: 206E 000A                  movea.l ($a,A6), A0
0239D8: 41E8 005C                  lea     ($5c,A0), A0
0239DC: 6100 0034                  bsr     $23a12			*画左下角武器图标
0239E0: 4CDF 0100                  movem.l (A7)+, A0
0239E4: 6100 01C8                  bsr     $23bae			*武器弹药数量与名称显存
0239E8: 6100 0374                  bsr     $23d5e
0239EC: 6100 00F6                  bsr     $23ae4
0239F0: 6000 001E                  bra     $23a10
0239F4: 48E7 0080                  movem.l A0, -(A7)
0239F8: 206E 000A                  movea.l ($a,A6), A0
0239FC: 41E8 005C                  lea     ($5c,A0), A0
023A00: 6100 00A6                  bsr     $23aa8
023A04: 4CDF 0100                  movem.l (A7)+, A0
023A08: 6100 03BA                  bsr     $23dc4
023A0C: 6100 0220                  bsr     $23c2e
023A10: 4E75                       rts


023D5E: 48E7 0080                  movem.l A0, -(A7)
023D62: 206E 000A                  movea.l ($a,A6), A0
023D66: 41E8 0184                  lea     ($184,A0), A0
023D6A: 41E8 005C                  lea     ($5c,A0), A0
023D6E: 7000                       moveq   #$0, D0
023D70: 302D 8F60                  move.w  (-$70a0,A5), D0
023D74: 6100 007A                  bsr     $23df0

023D78: 720B                       moveq   #$b, D1
023D7A: 0C40 0002                  cmpi.w  #$2, D0
023D7E: 6D00 000E                  blt     $23d8e
023D82: 5540                       subq.w  #2, D0				*每两发子弹对应一个子弹图片，（48发共24个）
023D84: 317C 00CF 0000             move.w  #$cf, ($0,A0)		*子弹图片移入显存，两颗子弹
023D8A: 6000 001C                  bra     $23da8
023D8E: 0C40 0001                  cmpi.w  #$1, D0
023D92: 6600 000E                  bne     $23da2
023D96: 5340                       subq.w  #1, D0
023D98: 317C 00DF 0000             move.w  #$df, ($0,A0)
023D9E: 6000 0008                  bra     $23da8
023DA2: 317C 0020 0000             move.w  #$20, ($0,A0)
023DA8: 317C 000B 0002             move.w  #$b, ($2,A0)
023DAE: 41E8 0080                  lea     ($80,A0), A0
023DB2: 51C9 FFC6                  dbra    D1, $23d7a
023DB6: 4CDF 0100                  movem.l (A7)+, A0
023DBA: 4A6D 8F60                  tst.w   (-$70a0,A5)
023DBE: 6700 0082                  beq     $23e42
023DC2: 4E75                       rts
     
023DC4: 48E7 0080                  movem.l A0, -(A7)
023DC8: 206E 000A                  movea.l ($a,A6), A0
023DCC: 41E8 0184                  lea     ($184,A0), A0
023DD0: 41E8 005C                  lea     ($5c,A0), A0
023DD4: 720B                       moveq   #$b, D1
023DD6: 317C 0020 0000             move.w  #$20, ($0,A0)
023DDC: 317C 000B 0002             move.w  #$b, ($2,A0)
023DE2: 41E8 0080                  lea     ($80,A0), A0
023DE6: 51C9 FFEE                  dbra    D1, $23dd6
023DEA: 4CDF 0100                  movem.l (A7)+, A0
023DEE: 4E75                       rts


023DF0: 7400                       moveq   #$0, D2
023DF2: 342D 8F60                  move.w  (-$70a0,A5), D2
023DF6: 5342                       subq.w  #1, D2
023DF8: 6B00 0038                  bmi     $23e32
023DFC: 7200                       moveq   #$0, D1
023DFE: 322D 8F58                  move.w  (-$70a8,A5), D1
023E02: D241                       add.w   D1, D1
023E04: 0C41 0004                  cmpi.w  #$4, D1				*等于4是UZI
023E08: 6700 0018                  beq     $23e22
023E0C: 0C41 0006                  cmpi.w  #$6, D1				*等于6是M16
023E10: 6700 0010                  beq     $23e22
023E14: 323B 1020                  move.w  ($20,PC,D1.w), D1
023E18: 7000                       moveq   #$0, D0
023E1A: D041                       add.w   D1, D0
023E1C: 51CA FFFC                  dbra    D2, $23e1a
023E20: 4E75                       rts

023E22: 323B 1012                  move.w  ($12,PC,D1.w), D1		*取表，$23E3A
023E26: 7001                       moveq   #$1, D0
023E28: D041                       add.w   D1, D0
023E2A: 51CA FFFC                  dbra    D2, $23e28
023E2E: E248                       lsr.w   #1, D0
023E30: 4E75                       rts