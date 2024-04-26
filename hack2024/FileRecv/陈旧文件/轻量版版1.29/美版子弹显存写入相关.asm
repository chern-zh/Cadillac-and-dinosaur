023B62: 48E7 00C0                  movem.l A0-A1, -(A7)
023B66: 226E 000A                  movea.l ($a,A6), A1
023B6A: 43E9 0200                  lea     ($200,A1), A1
023B6E: 43E9 005C                  lea     ($5c,A1), A1
023B72: 7200                       moveq   #$0, D1
023B74: 322D 8F58                  move.w  (-$70a8,A5), D1
023B78: D241                       add.w   D1, D1
023B7A: 323B 1054                  move.w  ($54,PC,D1.w), D1
023B7E: 7400                       moveq   #$0, D2
023B80: 362D 8F60                  move.w  (-$70a0,A5), D3	*存放子弹数量的内存$FF0F60
023B84: B641                       cmp.w   D1, D3
023B86: 6E00 0004                  bgt     $23b8c
023B8A: 7402                       moveq   #$2, D2
023B8C: 7000                       moveq   #$0, D0
023B8E: 322D 8F60                  move.w  (-$70a0,A5), D1
023B92: 103B 1048                  move.b  ($48,PC,D1.w), D0	*读表，十六进制换成十进制30变成48
023B96: 7201                       moveq   #$1, D1
023B98: E148                       lsl.w   #8, D0	*00000048变成00004800
023B9A: E988                       lsl.l   #4, D0	*00004800变成00048000
023B9C: 4840                       swap    D0		*80000004
023B9E: 0240 000F                  andi.w  #$f, D0
023BA2: 4A41                       tst.w   D1
023BA4: 6700 0014                  beq     $23bba
023BA8: 4A40                       tst.w   D0
023BAA: 6600 000E                  bne     $23bba
023BAE: 32BC 0020                  move.w  #$20, (A1)
023BB2: 3342 0002                  move.w  D2, ($2,A1)
023BB6: 6000 0008                  bra     $23bc0
023BBA: 3280                       move.w  D0, (A1)		*1P十位的显存地址90A270
023BBC: 3342 0002                  move.w  D2, ($2,A1)	*字体颜色
023BC0: 4840                       swap    D0
023BC2: 43E9 0080                  lea     ($80,A1), A1	*个位显存地址
023BC6: 51C9 FFD2                  dbra    D1, $23b9a	*回去处理个位
023BCA: 4CDF 0300                  movem.l (A7)+, A0-A1
023BCE: 4E75                       rts