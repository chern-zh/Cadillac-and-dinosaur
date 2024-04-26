*------------BOSS战派兵基址-----------------------------
081E26: 7000                       moveq   #$0, D0
081E28: 102D 04D9                  move.b  ($4d9,A5), D0
081E2C: D040                       add.w   D0, D0
081E2E: D040                       add.w   D0, D0
081E30: 207B 0020                  movea.l ($20,PC,D0.w), A0
081E34: 227B 003C                  movea.l ($3c,PC,D0.w), A1
081E38: 2D48 00A0                  move.l  A0, ($a0,A6)
081E3C: 2D49 00A4                  move.l  A1, ($a4,A6)
081E40: 426E 00A8                  clr.w   ($a8,A6)
081E44: 422E 00AE                  clr.b   ($ae,A6)
081E48: 426E 0080                  clr.w   ($80,A6)
081E4C: 542E 0004                  addq.b  #2, ($4,A6)
081E50: 4E75                       rts



*------------------固定场景战派兵基址---------------------
081268: 102D 04D9                  move.b  ($4d9,A5), D0
08126C: D040                       add.w   D0, D0
08126E: D040                       add.w   D0, D0
081270: 207B 0026                  movea.l ($26,PC,D0.w), A0
081274: 302E 0026                  move.w  ($26,A6), D0			/A6为0001 003C，($26,A6)为场景序号
081278: D040                       add.w   D0, D0
08127A: 3030 0000                  move.w  (A0,D0.w), D0
08127E: D0C0                       adda.w  D0, A0
081280: 2D48 00A0                  move.l  A0, ($a0,A6)
081284: 3B7C 1C20 050C             move.w  #$1c20, ($50c,A5)
08128A: 426E 00A6                  clr.w   ($a6,A6)
08128E: 426E 0080                  clr.w   ($80,A6)
081292: 542E 0004                  addq.b  #2, ($4,A6)
081296: 4E75                       rts



0812E0: 7000                       moveq   #$0, D0
0812E2: 102D 04F3                  move.b  ($4f3,A5), D0		小兵数量
0812E6: 206E 00A0                  movea.l ($a0,A6), A0
0812EA: 7200                       moveq   #$0, D1
0812EC: 122D 04EF                  move.b  ($4ef,A5), D1		/玩家数量
0812F0: D241                       add.w   D1, D1
0812F2: 3230 1000                  move.w  (A0,D1.w), D1		/读表，对应三种敌兵数量
0812F6: 536D 050C                  subq.w  #1, ($50c,A5)
0812FA: 6500 0008                  bcs     $81304
0812FE: B041                       cmp.w   D1, D0			/对比剩余小兵数量，决定是否出兵
081300: 6200 0036                  bhi     $81338
081304: 5C48                       addq.w  #6, A0
081306: 2D48 00A0                  move.l  A0, ($a0,A6)
08130A: 3010                       move.w  (A0), D0
08130C: 6A00 0022                  bpl     $81330
081310: 2D48 00A0                  move.l  A0, ($a0,A6)
081314: 1D7C 001E 0080             move.b  #$1e, ($80,A6)
08131A: 1D7C 0004 0005             move.b  #$4, ($5,A6)
081320: 4A6D 050C                  tst.w   ($50c,A5)
081324: 6A00 0008                  bpl     $8132e
081328: 1B7C 0002 050E             move.b  #$2, ($50e,A5)
08132E: 4E75                       rts
081330: 3D40 0080                  move.w  D0, ($80,A6)
081334: 542E 0005                  addq.b  #2, ($5,A6)
081338: 4E75                       rts
08133A: 536E 0080                  subq.w  #1, ($80,A6)
08133E: 6500 0004                  bcs     $81344
081342: 4E75                       rts
081344: 246E 00A0                  movea.l ($a0,A6), A2
081348: 4EB9 0000 FD30             jsr     $fd30.l
08134E: 6500 0006                  bcs     $81356
081352: 526E 00A6                  addq.w  #1, ($a6,A6)
081356: 45EA 0010                  lea     ($10,A2), A2
08135A: 2D4A 00A0                  move.l  A2, ($a0,A6)
08135E: 3D52 0080                  move.w  (A2), ($80,A6)
081362: 6AD6                       bpl     $8133a
081364: 45EA 0010                  lea     ($10,A2), A2
081368: 2D4A 00A0                  move.l  A2, ($a0,A6)
08136C: 3D7C 0003 0080             move.w  #$3, ($80,A6)
081372: 3B7C 1C20 050C             move.w  #$1c20, ($50c,A5)		/1C20为时间，强制清兵过场景
081378: 3D7C 0200 0004             move.w  #$200, ($4,A6)
08137E: 4E75                       rts


