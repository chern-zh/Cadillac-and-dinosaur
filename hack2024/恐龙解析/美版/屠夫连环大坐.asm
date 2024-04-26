*屠夫大坐次数
059B1E: 1D7C 0001 00AB             move.b  #$1, ($ab,A6)	*改为0，屠夫无限大坐

059B46: 4EB9 0000 120E             jsr     $120e.l
059B4C: 6000 001C                  bra     $59b6a
059B50: 7016                       moveq   #$16, D0
059B52: 4EB9 0000 120E             jsr     $120e.l
059B58: 3D7C 0000 00AE             move.w  #$0, ($ae,A6)
059B5E: 6000 0010                  bra     $59b70
059B62: 7015                       moveq   #$15, D0
059B64: 4EB9 0000 120E             jsr     $120e.l
059B6A: 3D7C 000A 00AE             move.w  #$a, ($ae,A6)
059B70: 1D7C 0001 00A0             move.b  #$1, ($a0,A6)
059B76: 1D7C 001A 0006             move.b  #$1a, ($6,A6)
059B7C: 1D7C 0001 0051             move.b  #$1, ($51,A6)
059B82: 4A2E 00BF                  tst.b   ($bf,A6)
059B86: 6600 002C                  bne     $59bb4
059B8A: 4EB9 0003 2B68             jsr     $32b68.l
059B90: 4EB9 0000 119C             jsr     $119c.l
059B96: 0240 000F                  andi.w  #$f, D0
059B9A: 7200                       moveq   #$0, D1
059B9C: 41FA 015E                  lea     ($15e,PC), A0; ($59cfc)		*表格，只有0，1，2
059BA0: 1D70 0000 00BF             move.b  (A0,D0.w), ($bf,A6)
059BA6: 4A2E 00AB                  tst.b   ($ab,A6)
059BAA: 6700 0008                  beq     $59bb4
059BAE: 1D7C 0000 00BF             move.b  #$0, ($bf,A6)
059BB4: 4EB9 0003 2A70             jsr     $32a70.l
059BBA: 1D7C 0000 00CC             move.b  #$0, ($cc,A6)
059BC0: 306E 0076                  movea.w ($76,A6), A0
059BC4: 202E 0008                  move.l  ($8,A6), D0
059BC8: 90A8 0008                  sub.l   ($8,A0), D0
059BCC: 2200                       move.l  D0, D1