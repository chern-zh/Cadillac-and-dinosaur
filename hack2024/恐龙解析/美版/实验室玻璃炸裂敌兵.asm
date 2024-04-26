083BC8: 0240 00FF                  andi.w  #$ff, D0
083BCC: 6712                       beq     $83be0
083BCE: 4EB9 0000 119C             jsr     $119c.l
083BD4: 0240 001F                  andi.w  #$1f, D0
083BD8: 0C40 0016                  cmpi.w  #$16, D0
083BDC: 6D00 0228                  blt     $83e06
083BE0: 542E 0004                  addq.b  #2, ($4,A6)
083BE4: 3D7C 0018 000C             move.w  #$18, ($c,A6)
083BEA: 542E 0004                  addq.b  #2, ($4,A6)
083BEE: 7024                       moveq   #$24, D0
083BF0: 7200                       moveq   #$0, D1
083BF2: 4EB9 0009 4640             jsr     $94640.l
083BF8: 4EB9 0000 483C             jsr     $483c.l
083BFE: 6500 0206                  bcs     $83e06
083C02: 117C 0001 0000             move.b  #$1, ($0,A0)
083C08: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
083C0E: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
083C14: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
083C1A: 302E 0026                  move.w  ($26,A6), D0
083C1E: E048                       lsr.w   #8, D0
083C20: D040                       add.w   D0, D0
083C22: 43FB 0012                  lea     ($12,PC,D0.w), A1
083C26: 3159 0020                  move.w  (A1)+, ($20,A0)			实验室玻璃炸裂敌兵
083C2A: 3159 0026                  move.w  (A1)+, ($26,A0)
083C2E: 116E 0096 0096             move.b  ($96,A6), ($96,A0)
083C34: 4E75                       rts

迅猛龙直接愤怒坐标
04DE28: 7000                       moveq   #$0, D0
04DE2A: 102E 0006                  move.b  ($6,A6), D0
04DE2E: 303B 0012                  move.w  ($12,PC,D0.w), D0
04DE32: 4EBB 000E                  jsr     ($e,PC,D0.w)
04DE36: 4EB9 0000 49CA             jsr     $49ca.l
04DE3C: 4EF9 0000 4C0A             jmp     $4c0a.l
04DE42: 0006 005C                  ori.b   #$5c, D6
04DE46: 0096 542E 0006             ori.l   #$542e0006, (A6)
04DE4C: 701D                       moveq   #$1d, D0
04DE4E: 4EB9 0000 120E             jsr     $120e.l
04DE54: 323C 0180                  move.w  #$180, D1
04DE58: 302D 0744                  move.w  ($744,A5), D0
04DE5C: 0640 00C0                  addi.w  #$c0, D0
04DE60: 906E 0008                  sub.w   ($8,A6), D0
04DE64: 6B02                       bmi     $4de68
04DE66: 4441                       neg.w   D1
04DE68: 3D41 0014                  move.w  D1, ($14,A6)
04DE6C: 426E 001A                  clr.w   ($1a,A6)
04DE70: 3D7C 0400 0016             move.w  #$400, ($16,A6)
04DE76: 3D7C FFB8 001C             move.w  #$ffb8, ($1c,A6)
04DE7C: 3D7C FF00 0018             move.w  #$ff00, ($18,A6)
04DE82: 426E 001E                  clr.w   ($1e,A6)
04DE86: 3D7C 0018 000C             move.w  #$18, ($c,A6)
04DE8C: 3D7C 0078 0010             move.w  #$78, ($10,A6)
04DE92: 1D7C 0001 0051             move.b  #$1, ($51,A6)
04DE98: 1D7C 0014 0080             move.b  #$14, ($80,A6)
04DE9E: 4A2E 0051                  tst.b   ($51,A6)
04DEA2: 6728                       beq     $4decc
04DEA4: 4A2E 002D                  tst.b   ($2d,A6)
04DEA8: 660A                       bne     $4deb4
04DEAA: 422E 002D                  clr.b   ($2d,A6)
04DEAE: 4EB9 0000 189C             jsr     $189c.l
04DEB4: 4EB9 0000 121E             jsr     $121e.l
04DEBA: 532E 0080                  subq.b  #1, ($80,A6)
04DEBE: 6502                       bcs     $4dec2
04DEC0: 4E75                       rts