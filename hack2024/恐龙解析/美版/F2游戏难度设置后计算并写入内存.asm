0AC86E: 41ED 775A                  lea     ($775a,A5), A0	*A0 = FFF75A
0AC872: 1A28 0008                  move.b  ($8,A0), D5
0AC876: 0C05 0007                  cmpi.b  #$7, D5
0AC87A: 6302                       bls     $ac87e
0AC87C: 4245                       clr.w   D5
0AC87E: 1028 000D                  move.b  ($d,A0), D0
0AC882: 0C00 0002                  cmpi.b  #$2, D0
0AC886: 6304                       bls     $ac88c
0AC888: 103C 0001                  move.b  #$1, D0
0AC88C: E708                       lsl.b   #3, D0
0AC88E: 8A00                       or.b    D0, D5
0AC890: 7000                       moveq   #$0, D0
0AC892: 0C28 0008 0008             cmpi.b  #$8, ($8,A0)
0AC898: 6602                       bne     $ac89c
0AC89A: 7001                       moveq   #$1, D0
0AC89C: 0200 0001                  andi.b  #$1, D0
0AC8A0: ED08                       lsl.b   #6, D0
0AC8A2: 8A00                       or.b    D0, D5
0AC8A4: 1028 000C                  move.b  ($c,A0), D0
0AC8A8: 0200 0001                  andi.b  #$1, D0
0AC8AC: EF08                       lsl.b   #7, D0
0AC8AE: 8A00                       or.b    D0, D5
0AC8B0: 1145 0013                  move.b  D5, ($13,A0)

0AC8B4: 1A28 000E                  move.b  ($e,A0), D5		*难度1，0-7，映像地址FFF668
0AC8B8: 0205 0007                  andi.b  #$7, D5
0AC8BC: 1028 0012                  move.b  ($12,A0), D0		*难度2，0-3，映像地址FFF66C
0AC8C0: 0200 0003                  andi.b  #$3, D0
0AC8C4: E748                       lsl.w   #3, D0			*乘8？
0AC8C6: 8A00                       or.b    D0, D5
0AC8C8: 1028 0010                  move.b  ($10,A0), D0		*奖命设置，0-3档,，映像地址FFF66A
0AC8CC: 0200 0003                  andi.b  #$3, D0
0AC8D0: EB48                       lsl.w   #5, D0
0AC8D2: 8A00                       or.b    D0, D5
0AC8D4: 1145 0014                  move.b  D5, ($14,A0)

0AC8D8: 1A28 000F                  move.b  ($f,A0), D5
0AC8DC: 0205 0003                  andi.b  #$3, D5
0AC8E0: 1028 0011                  move.b  ($11,A0), D0
0AC8E4: 0200 0001                  andi.b  #$1, D0
0AC8E8: E508                       lsl.b   #2, D0
0AC8EA: 8A00                       or.b    D0, D5
0AC8EC: 0880 0003                  bclr    #$3, D0
0AC8F0: 0200 0001                  andi.b  #$1, D0
0AC8F4: 8A00                       or.b    D0, D5
0AC8F6: 1028 000B                  move.b  ($b,A0), D0
0AC8FA: 0200 0001                  andi.b  #$1, D0
0AC8FE: E908                       lsl.b   #4, D0
0AC900: 8A00                       or.b    D0, D5
0AC902: 1028 000A                  move.b  ($a,A0), D0
0AC906: 0200 0001                  andi.b  #$1, D0
0AC90A: EB08                       lsl.b   #5, D0
0AC90C: 8A00                       or.b    D0, D5
0AC90E: 1028 0009                  move.b  ($9,A0), D0
0AC912: 0200 0001                  andi.b  #$1, D0
0AC916: ED08                       lsl.b   #6, D0
0AC918: 8A00                       or.b    D0, D5
0AC91A: 1145 0015                  move.b  D5, ($15,A0)
0AC91E: 4E75                       rts