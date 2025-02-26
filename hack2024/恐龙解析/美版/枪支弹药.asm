弹夹
028508: 3029 0026                  move.w  ($26,A1), D0
02850C: 0240 001E                  andi.w  #$1e, D0
028510: D040                       add.w   D0, D0
028512: D040                       add.w   D0, D0
028514: 45FB 0044                  lea     ($44,PC,D0.w), A2		*吃弹夹
028518: 301A                       move.w  (A2)+, D0
02851A: 6700 0038                  beq     $28554
02851E: B069 006C                  cmp.w   ($6c,A1), D0
028522: 6600 0012                  bne     $28536
028526: 48E7 80E0                  movem.l D0/A0-A2, -(A7)
02852A: 7038                       moveq   #$38, D0
02852C: 4EB9 0001 0036             jsr     $10036.l
028532: 4CDF 0701                  movem.l (A7)+, D0/A0-A2
028536: 3340 006C                  move.w  D0, ($6c,A1)
02853A: 301A                       move.w  (A2)+, D0
02853C: 3340 00A0                  move.w  D0, ($a0,A1)
028540: 3140 00B6                  move.w  D0, ($b6,A0)
028544: 3352 00A2                  move.w  (A2), ($a2,A1)
028548: 4228 010F                  clr.b   ($10f,A0)
02854C: 4229 00A6                  clr.b   ($a6,A1)
028550: 8040                       or.w    D0, D0
028552: 4E75                       rts
028554: 44FC 0001                  move    #$1, CCR
028558: 4E75                       rts

02855A: 0006 0205 0004 0000 	*步枪
028562: 0006 0204 0000 0000		*手枪
02856A: 0000 0202 000C 0000 
028572:	0030 0206 0010 0000		*UZI
02857a:	0030 0207 0014 0000		*M16
028582: 0006 0208 001C 0000		*霰弹枪            
02858A: 0004 0209 0020 0000		*火箭炮                  

024DDE: 7006                       moveq   #$6, D0				*手枪弹药
024DE0: 3D40 006C                  move.w  D0, ($6c,A6)
024DE4: 3D40 006E                  move.w  D0, ($6e,A6)
024DE8: 3D40 006A                  move.w  D0, ($6a,A6)
024DEC: 6000 0272                  bra     $25060

024DF0: 2D7C 0002 6A3C 0040        move.l  #$26a3c, ($40,A6)
024DF8: 3D7C 0202 00A0             move.w  #$202, ($a0,A6)
024DFE: 3D7C 000C 00A2             move.w  #$c, ($a2,A6)
024E04: 7006                       moveq   #$6, D0				*匕首
024E06: 3D40 006C                  move.w  D0, ($6c,A6)
024E0A: 3D40 006E                  move.w  D0, ($6e,A6)
024E0E: 3D40 006A                  move.w  D0, ($6a,A6)
024E12: 1D7C 0005 0080             move.b  #$5, ($80,A6)
024E18: 6000 0246                  bra     $25060

024E1C: 2D7C 0002 6BBC 0040        move.l  #$26bbc, ($40,A6)
024E24: 3D7C 0206 00A0             move.w  #$206, ($a0,A6)
024E2A: 3D7C 0010 00A2             move.w  #$10, ($a2,A6)
024E30: 422E 0080                  clr.b   ($80,A6)
024E34: 7030                       moveq   #$30, D0			*机枪弹药
024E36: 3D40 006C                  move.w  D0, ($6c,A6)
024E3A: 3D40 006E                  move.w  D0, ($6e,A6)
024E3E: 3D40 006A                  move.w  D0, ($6a,A6)
024E42: 6000 021C                  bra     $25060

024E46: 2D7C 0002 6D3C 0040        move.l  #$26d3c, ($40,A6)
024E4E: 3D7C 0207 00A0             move.w  #$207, ($a0,A6)
024E54: 3D7C 0014 00A2             move.w  #$14, ($a2,A6)
024E5A: 422E 0080                  clr.b   ($80,A6)
024E5E: 7030                       moveq   #$30, D0			*M16
024E60: 3D40 006C                  move.w  D0, ($6c,A6)
024E64: 3D40 006E                  move.w  D0, ($6e,A6)
024E68: 3D40 006A                  move.w  D0, ($6a,A6)
024E6C: 6000 01F2                  bra     $25060

024E70: 2D7C 0002 6F7E 0040        move.l  #$26f7e, ($40,A6)
024E78: 3D7C 0208 00A0             move.w  #$208, ($a0,A6)
024E7E: 3D7C 001C 00A2             move.w  #$1c, ($a2,A6)
024E84: 7006                       moveq   #$6, D0			*霰弹枪
024E86: 3D40 006C                  move.w  D0, ($6c,A6)
024E8A: 3D40 006E                  move.w  D0, ($6e,A6)
024E8E: 3D40 006A                  move.w  D0, ($6a,A6)
024E92: 6000 01CC                  bra     $25060

024E96: 2D7C 0002 70FE 0040        move.l  #$270fe, ($40,A6)
024E9E: 3D7C 0209 00A0             move.w  #$209, ($a0,A6)
024EA4: 3D7C 0020 00A2             move.w  #$20, ($a2,A6)
024EAA: 7004                       moveq   #$4, D0			*火箭炮
024EAC: 3D40 006C                  move.w  D0, ($6c,A6)
024EB0: 3D40 006E                  move.w  D0, ($6e,A6)
024EB4: 3D40 006A                  move.w  D0, ($6a,A6)
024EB8: 6000 01A6                  bra     $25060

024EBC: 2D7C 0002 727E 0040        move.l  #$2727e, ($40,A6)
024EC4: 3D7C 0203 00A0             move.w  #$203, ($a0,A6)
024ECA: 3D7C 0024 00A2             move.w  #$24, ($a2,A6)
024ED0: 3D7C 000A 006C             move.w  #$a, ($6c,A6)
024ED6: 6000 0188                  bra     $25060

024EDA: 2D7C 0002 73FE 0040        move.l  #$273fe, ($40,A6)
024EE2: 3D7C 0202 00A0             move.w  #$202, ($a0,A6)
024EE8: 3D7C 0028 00A2             move.w  #$28, ($a2,A6)
024EEE: 7006                       moveq   #$6, D0
024EF0: 3D40 006C                  move.w  D0, ($6c,A6)
024EF4: 3D40 006E                  move.w  D0, ($6e,A6)
024EF8: 3D40 006A                  move.w  D0, ($6a,A6)
024EFC: 6000 0162                  bra     $25060

024F00: 2D7C 0002 757E 0040        move.l  #$2757e, ($40,A6)
024F08: 3D7C 0203 00A0             move.w  #$203, ($a0,A6)
024F0E: 3D7C 002C 00A2             move.w  #$2c, ($a2,A6)
024F14: 7006                       moveq   #$6, D0
024F16: 3D40 006C                  move.w  D0, ($6c,A6)
024F1A: 3D40 006E                  move.w  D0, ($6e,A6)
024F1E: 3D40 006A                  move.w  D0, ($6a,A6)
024F22: 6000 013C                  bra     $25060

024F26: 2D7C 0002 76FE 0040        move.l  #$276fe, ($40,A6)
024F2E: 3D7C 0203 00A0             move.w  #$203, ($a0,A6)
024F34: 3D7C 0030 00A2             move.w  #$30, ($a2,A6)
024F3A: 700A                       moveq   #$a, D0
024F3C: 3D40 006C                  move.w  D0, ($6c,A6)
024F40: 3D40 006E                  move.w  D0, ($6e,A6)
024F44: 3D40 006A                  move.w  D0, ($6a,A6)
024F48: 6000 0116                  bra     $25060

024F4C: 2D7C 0002 76FE 0040        move.l  #$276fe, ($40,A6)
024F54: 3D7C 0203 00A0             move.w  #$203, ($a0,A6)
024F5A: 3D7C 0030 00A2             move.w  #$30, ($a2,A6)
024F60: 700A                       moveq   #$a, D0
024F62: 3D40 006C                  move.w  D0, ($6c,A6)
024F66: 3D40 006E                  move.w  D0, ($6e,A6)
024F6A: 3D40 006A                  move.w  D0, ($6a,A6)
024F6E: 4EB9 0000 4818             jsr     $4818.l
024F74: 6500 0030                  bcs     $24fa6
024F78: 117C 0001 0000             move.b  #$1, ($0,A0)
024F7E: 316E 0002 0002             move.w  ($2,A6), ($2,A0)
024F84: 317C 0018 0020             move.w  #$18, ($20,A0)
024F8A: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
024F90: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
024F96: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
024F9C: 316E 00A0 0058             move.w  ($a0,A6), ($58,A0)
024FA2: 314E 005A                  move.w  A6, ($5a,A0)
024FA6: 6000 00B8                  bra     $25060
024FAA: 2D7C 0002 787E 0040        move.l  #$2787e, ($40,A6)
024FB2: 3D7C 0201 00A0             move.w  #$201, ($a0,A6)
024FB8: 3D7C 0034 00A2             move.w  #$34, ($a2,A6)
024FBE: 3D7C 000A 006C             move.w  #$a, ($6c,A6)
024FC4: 7000                       moveq   #$0, D0
024FC6: 3D40 00B0                  move.w  D0, ($b0,A6)
024FCA: 3D7C 0003 00B2             move.w  #$3, ($b2,A6)
024FD0: 3D40 00B4                  move.w  D0, ($b4,A6)
024FD4: 4A2E 0007                  tst.b   ($7,A6)
024FD8: 6700 0024                  beq     $24ffe
024FDC: 6100 0082                  bsr     $25060
024FE0: 4EB9 0002 4766             jsr     $24766.l
024FE6: 1D7C FFFF 0002             move.b  #$ff, ($2,A6)
024FEC: 3D7C 0001 00B0             move.w  #$1, ($b0,A6)
024FF2: 3D7C 0001 00B2             move.w  #$1, ($b2,A6)
024FF8: 422E 0007                  clr.b   ($7,A6)
024FFC: 4E75                       rts