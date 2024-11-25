
00B9D4: 7000                       moveq   #$0, D0
00B9D6: 102E 0000                  move.b  ($0,A6), D0
00B9DA: 303B 0012                  move.w  ($12,PC,D0.w), D0
00B9DE: 4EBB 000E                  jsr     ($e,PC,D0.w)			*C526(D0=0),c588(D0=2),cbaa(D0=4),
00B9E2: 4EB9 0000 0A76             jsr     $a76.l
00B9E8: 4DED 735E                  lea     ($735e,A5), A6
00B9EC: 60E6                       bra     $b9d4


*第一阶段，处理关卡开始的一些内容
00C526: 4EB9 0000 0A76             jsr     $a76.l
00C52C: 542E 0000                  addq.b  #2, ($0,A6)
00C530: 4A2D 04D9                  tst.b   ($4d9,A5)
00C534: 6606                       bne     $c53c
00C536: 426D 06C8                  clr.w   ($6c8,A5)
00C53A: 4E75                       rts
00C53C: 3D7C 0078 0004             move.w  #$78, ($4,A6)
00C542: 1D7C 0014 0002             move.b  #$14, ($2,A6)
00C548: 2D7C 0090 A028 000A        move.l  #$90a028, ($a,A6)
00C550: 2D7C 0090 9808 000E        move.l  #$909808, ($e,A6)
00C558: 426E 0006                  clr.w   ($6,A6)
00C55C: 3D7C 000C 0008             move.w  #$c, ($8,A6)
00C562: 6100 07B6                  bsr     $cd1a
00C566: 207C 0090 A030             movea.l #$90a030, A0
00C56C: 6100 08EE                  bsr     $ce5c
00C570: 264C                       movea.l A4, A3
00C572: 6000 11EA                  bra     $d75e

*第二阶段，处理关卡图形闪烁，及地点标识，然后撤销地图与英文
00C588: 7000                       moveq   #$0, D0
00C58A: 102E 0001                  move.b  ($1,A6), D0
00C58E: 303B 0006                  move.w  ($6,PC,D0.w), D0
00C592: 4EFB 0002                  jmp     ($2,PC,D0.w)		*jmp $
00C596: 00AC 048A 302E 0008        

*第三阶段，好像是处理自动行走等一些内容。
00CBAA: 7000                       moveq   #$0, D0
00CBAC: 102E 0001                  move.b  ($1,A6), D0
00CBB0: 303B 0006                  move.w  ($6,PC,D0.w), D0
00CBB4: 4EFB 0002                  jmp     ($2,PC,D0.w)