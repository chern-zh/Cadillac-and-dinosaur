04BE70: 102E 0004                  move.b  ($4,A6), D0
04BE74: 323B 0006                  move.w  ($6,PC,D0.w), D1
04BE78: 4EFB 1002                  jmp     ($2,PC,D1.w)
04BE7C: 0008                       dc.w    $0008; ILLEGAL
04BE7E: 0182                       bclr    D0, D2
04BE80: 0A64 0A8C                  eori.w  #$a8c, -(A4)

04BE84: 7000                       moveq   #$0, D0
04BE86: 102E 0005                  move.b  ($5,A6), D0
04BE8A: 303B 0006                  move.w  ($6,PC,D0.w), D0
04BE8E: 4EFB 0002                  jmp     ($2,PC,D0.w)
04BE92: 0004 009C                  ori.b   #$9c, D4
04BE96: 4EB9 0009 39B6             jsr     $939b6.l
04BE9C: 1D7C 0005 0003             move.b  #$5, ($3,A6)
04BEA2: 3D7C 0014 0084             move.w  #$14, ($84,A6)
04BEA8: 2D7C 0004 C90E 0040        move.l  #$4c90e, ($40,A6)
04BEB0: 7000                       moveq   #$0, D0
04BEB2: 4EB9 0000 120E             jsr     $120e.l
04BEB8: 2D7C 0010 3000 0044        move.l  #$103000, ($44,A6)
04BEC0: 422E 004A                  clr.b   ($4a,A6)
04BEC4: 6100 156E                  bsr     $4d434
04BEC8: 7000                       moveq   #$0, D0
04BECA: 4EB9 0003 1E14             jsr     $31e14.l
04BED0: 3D6E 006C 00BE             move.w  ($6c,A6), ($be,A6)
04BED6: 1D7C 000B 0078             move.b  #$b, ($78,A6)
04BEDC: 7000                       moveq   #$0, D0
04BEDE: 1D40 0079                  move.b  D0, ($79,A6)
04BEE2: 1D40 007A                  move.b  D0, ($7a,A6)
04BEE6: 1D40 007B                  move.b  D0, ($7b,A6)
04BEEA: 1D7C FFFF 007D             move.b  #$ff, ($7d,A6)
04BEF0: 1D40 0087                  move.b  D0, ($87,A6)
04BEF4: 1D7C 0002 0063             move.b  #$2, ($63,A6)
04BEFA: 1D7C 0014 0072             move.b  #$14, ($72,A6)
04BF00: 1D40 00AC                  move.b  D0, ($ac,A6)
04BF04: 1D40 00AD                  move.b  D0, ($ad,A6)
04BF08: 1D40 00B0                  move.b  D0, ($b0,A6)
04BF0C: 1D40 00B8                  move.b  D0, ($b8,A6)
04BF10: 1D40 00B9                  move.b  D0, ($b9,A6)
04BF14: 4EB9 0003 2032             jsr     $32032.l
04BF1A: 3D48 0076                  move.w  A0, ($76,A6)
04BF1E: 4EB9 0003 140C             jsr     $3140c.l
04BF24: 6100 0C58                  bsr     $4cb7e
04BF28: 542E 0005                  addq.b  #2, ($5,A6)
04BF2C: 4E75                       rts

04BF2E: 7000                       moveq   #$0, D0
04BF30: 102E 0006                  move.b  ($6,A6), D0
04BF34: 303B 000C                  move.w  ($c,PC,D0.w), D0
04BF38: 4EBB 0008                  jsr     ($8,PC,D0.w)
04BF3C: 4EF9 0000 49CA             jmp     $49ca.l
04BF42: 000C                       dc.w    $000c; ILLEGAL
04BF44: 0040 0056                  ori.w   #$56, D0
04BF48: 0082 0096 00AE             ori.l   #$9600ae, D2
04BF4E: 0C6D 0470 0744             cmpi.w  #$470, ($744,A5)
04BF54: 6D2A                       blt     $4bf80
04BF56: 542E 0006                  addq.b  #2, ($6,A6)							*+2

04BF5A: 4EB9 0000 4860             jsr     $4860.l		*载入对话
04BF60: 651E                       bcs     $4bf80
04BF62: 3D48 00C2                  move.w  A0, ($c2,A6)
04BF66: 117C 0001 0000             move.b  #$1, ($0,A0)
04BF6C: 317C 00C8 0020             move.w  #$c8, ($20,A0)		*载入对话
04BF72: 317C 0002 0026             move.w  #$2, ($26,A0)		*载入对话
04BF78: 7023                       moveq   #$23, D0
04BF7A: 4EB9 0000 A63C             jsr     $a63c.l		*载入音乐
04BF80: 4E75                       rts

04BF82: 306E 00C2                  movea.w ($c2,A6), A0
04BF86: 4A28 0000                  tst.b   ($0,A0)
04BF8A: 660A                       bne     $4bf96
04BF8C: 1D7C 0028 0080             move.b  #$28, ($80,A6)
04BF92: 542E 0006                  addq.b  #2, ($6,A6)							*+2
04BF96: 4E75                       rts

04BF98: 532E 0080                  subq.b  #1, ($80,A6)
04BF9C: 6600 0038                  bne     $4bfd6
04BFA0: 4EB9 0000 4860             jsr     $4860.l
04BFA6: 6510                       bcs     $4bfb8
04BFA8: 117C 0001 0000             move.b  #$1, ($0,A0)
04BFAE: 317C 0130 0020             move.w  #$130, ($20,A0)
04BFB4: 4268 0026                  clr.w   ($26,A0)
04BFB8: 7009                       moveq   #$9, D0
04BFBA: 4EB9 0000 120E             jsr     $120e.l
04BFC0: 542E 0006                  addq.b  #2, ($6,A6)							*+2
04BFC4: 4EB9 0000 121E             jsr     $121e.l
04BFCA: 640A                       bcc     $4bfd6
04BFCC: 542E 0006                  addq.b  #2, ($6,A6)							*+2
04BFD0: 1D7C 003C 0080             move.b  #$3c, ($80,A6)
04BFD6: 4E75                       rts

04BFD8: 532E 0080                  subq.b  #1, ($80,A6)
04BFDC: 6410                       bcc     $4bfee
04BFDE: 542E 0006                  addq.b  #2, ($6,A6)							*+2
04BFE2: 422D 04FC                  clr.b   ($4fc,A5)
04BFE6: 7011                       moveq   #$11, D0
04BFE8: 4EB9 0000 A63C             jsr     $a63c.l
04BFEE: 4E75                       rts

04BFF0: 3B4E 8F44                  move.w  A6, (-$70bc,A5)
04BFF4: 4EB9 0007 BEDC             jsr     $7bedc.l
04BFFA: 6000 0076                  bra     $4c072
04BFFE: 532E 00B3                  subq.b  #1, ($b3,A6)
04C002: 6404                       bcc     $4c008
04C004: 422E 00B3                  clr.b   ($b3,A6)
04C008: 536E 00C4                  subq.w  #1, ($c4,A6)
04C00C: 640C                       bcc     $4c01a
04C00E: 3D7C 012C 00C4             move.w  #$12c, ($c4,A6)
04C014: 1B7C 0001 0502             move.b  #$1, ($502,A5)
04C01A: 7000                       moveq   #$0, D0
04C01C: 102E 0005                  move.b  ($5,A6), D0
04C020: D040                       add.w   D0, D0
04C022: 207B 0004                  movea.l ($4,PC,D0.w), A0
04C026: 4ED0                       jmp     (A0)
04C028: 0004 C038                  ori.b   #$38, D4
04C02C: 0004 C8B0                  ori.b   #$b0, D4
04C030: 0004 C8DE                  ori.b   #$de, D4
04C034: 0002 B35A                  ori.b   #$5a, D2
04C038: 122E 0079                  move.b  ($79,A6), D1
04C03C: 670C                       beq     $4c04a
04C03E: 532E 0079                  subq.b  #1, ($79,A6)
04C042: 6606                       bne     $4c04a
04C044: 1D7C 000B 0078             move.b  #$b, ($78,A6)
04C04A: 7000                       moveq   #$0, D0
04C04C: 102E 0006                  move.b  ($6,A6), D0
04C050: 323B 0018                  move.w  ($18,PC,D0.w), D1
04C054: 4EBB 1014                  jsr     ($14,PC,D1.w)
04C058: 4EB9 0001 2CB4             jsr     $12cb4.l
04C05E: 4EB9 0000 49CA             jsr     $49ca.l
04C064: 4EF9 0000 4BEA             jmp     $4bea.l
04C06A: 003C 00B2                  ori     #$b2, CCR
04C06E: 03A0                       bclr    D1, -(A0)
04C070: 0380                       bclr    D1, D0
04C072: 2D7C 0200 0000 0004        move.l  #$2000000, ($4,A6)
04C07A: 7000                       moveq   #$0, D0
04C07C: 4EB9 0000 120E             jsr     $120e.l
04C082: 4A2E 007A                  tst.b   ($7a,A6)
04C086: 6606                       bne     $4c08e
04C088: 1D7C 0002 007A             move.b  #$2, ($7a,A6)
04C08E: 3D7C 0258 00AA             move.w  #$258, ($aa,A6)
04C094: 1D7C FFFF 00AC             move.b  #$ff, ($ac,A6)
04C09A: 422E 00A9                  clr.b   ($a9,A6)
04C09E: 6100 0016                  bsr     $4c0b6
04C0A2: 655E                       bcs     $4c102
04C0A4: 60B2                       bra     $4c058
04C0A6: 4A2E 007A                  tst.b   ($7a,A6)
04C0AA: 6770                       beq     $4c11c
04C0AC: 532E 007A                  subq.b  #1, ($7a,A6)
04C0B0: 6700 006A                  beq     $4c11c
04C0B4: 4E75                       rts