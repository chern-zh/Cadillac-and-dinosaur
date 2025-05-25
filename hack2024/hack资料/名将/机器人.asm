

01059E: 5468 0008                  addq.w  #2, ($8,A0)
0105A2: 316D 69A2 0012             move.w  ($69a2,A5), ($12,A0)
0105A8: 317C 0000 000E             move.w  #$0, ($e,A0)
0105AE: 7000                       moveq   #$0, D0
0105B0: 102D 7873                  move.b  ($7873,A5), D0
0105B4: D040                       add.w   D0, D0
0105B6: D040                       add.w   D0, D0
0105B8: 522D 7873                  addq.b  #1, ($7873,A5)
0105BC: 45FA 0AF8                  lea     ($af8,PC), A2; ($110b6)
0105C0: 3232 0000                  move.w  (A2,D0.w), D1
0105C4: D26D 699E                  add.w   ($699e,A5), D1
0105C8: 3141 0092                  move.w  D1, ($92,A0)
0105CC: 0441 00B8                  subi.w  #$b8, D1
0105D0: 3141 000A                  move.w  D1, ($a,A0)
0105D4: 3032 0002                  move.w  ($2,A2,D0.w), D0
0105D8: D168 0012                  add.w   D0, ($12,A0)
0105DC: 5229 0000                  addq.b  #1, ($0,A1)
0105E0: 137C 0013 0016             move.b  #$13, ($16,A1)
0105E6: 237C 0009 AD88 0034        move.l  #$9ad88, ($34,A1)
0105EE: 337C 0002 0002             move.w  #$2, ($2,A1)
0105F4: 7000                       moveq   #$0, D0
0105F6: 3340 0004                  move.w  D0, ($4,A1)
0105FA: 2340 0006                  move.l  D0, ($6,A1)
0105FE: 3368 000A 000A             move.w  ($a,A0), ($a,A1)
010604: 3368 000E 000E             move.w  ($e,A0), ($e,A1)
01060A: 3368 0012 0012             move.w  ($12,A0), ($12,A1)
010610: 337C 0002 0038             move.w  #$2, ($38,A1)
010616: 3348 0068                  move.w  A0, ($68,A1)
01061A: 7200                       moveq   #$0, D1
01061C: 1228 0016                  move.b  ($16,A0), D1
010620: D241                       add.w   D1, D1
010622: D241                       add.w   D1, D1
010624: 45ED 127C                  lea     ($127c,A5), A2
010628: 45F2 1000                  lea     (A2,D1.w), A2
01062C: 301A                       move.w  (A2)+, D0
01062E: 3340 003C                  move.w  D0, ($3c,A1)
010632: 3340 003E                  move.w  D0, ($3e,A1)
010636: 337C 0048 0096             move.w  #$48, ($96,A1)
01063C: 3352 003A                  move.w  (A2), ($3a,A1)
010640: 3149 0068                  move.w  A1, ($68,A0)
010644: 3149 0072                  move.w  A1, ($72,A0)
010648: 117C 0001 0084             move.b  #$1, ($84,A0)
01064E: 3C49                       movea.w A1, A6
010650: 4EB9 0001 8D4E             jsr     $18d4e.l
010656: 117C 0020 005A             move.b  #$20, ($5a,A0)
01065C: 117C 0014 005B             move.b  #$14, ($5b,A0)
010662: 6100 0A8A                  bsr     $110ee
010666: 1028 00A0                  move.b  ($a0,A0), D0
01066A: 287C 000B A082             movea.l #$ba082, A4
010670: 4EB8 2FF8                  jsr     $2ff8.w
010674: 4EF8 394E                  jmp     $394e.w
010678: 5468 000A                  addq.w  #2, ($a,A0)
01067C: 3028 000A                  move.w  ($a,A0), D0
010680: B068 0092                  cmp.w   ($92,A0), D0
010684: 6D00 001E                  blt     $106a4
010688: 317C 0004 005C             move.w  #$4, ($5c,A0)
01068E: 5468 0008                  addq.w  #2, ($8,A0)
010692: 1028 00A0                  move.b  ($a0,A0), D0
010696: 287C 000B 9DCE             movea.l #$b9dce, A4



05A91C: 3168 000A 0062             move.w  ($a,A0), ($62,A0)
05A922: 3168 0012 0066             move.w  ($12,A0), ($66,A0)
05A928: 3028 0002                  move.w  ($2,A0), D0
05A92C: 303B 0006                  move.w  ($6,PC,D0.w), D0
05A930: 4EFB 0002                  jmp     ($2,PC,D0.w)
05A934: 0008                       dc.w    $0008; ILLEGAL
05A936: 0366                       bchg    D1, -(A6)
05A938: 2780 3088                  move.l  D0, (-$78,A3,D3.w)
05A93C: 4A68 0038                  tst.w   ($38,A0)
05A940: 6600 0214                  bne     $5ab56
05A944: 5468 0002                  addq.w  #2, ($2,A0)
05A948: 117C 0008 005B             move.b  #$8, ($5b,A0)
05A94E: 6100 0304                  bsr     $5ac54
05A952: 7000                       moveq   #$0, D0
05A954: 3140 0086                  move.w  D0, ($86,A0)
05A958: 3140 0088                  move.w  D0, ($88,A0)
05A95C: 1140 0077                  move.b  D0, ($77,A0)
05A960: 1140 0080                  move.b  D0, ($80,A0)
05A964: 117C 0008 00B0             move.b  #$8, ($b0,A0)
05A96A: 117C 0002 00A1             move.b  #$2, ($a1,A0)
05A970: 117C 00B4 00B1             move.b  #$b4, ($b1,A0)
05A976: 117C 0028 00A3             move.b  #$28, ($a3,A0)
05A97C: 117C 000A 0076             move.b  #$a, ($76,A0)
05A982: 4EB8 3238                  jsr     $3238.w
05A986: 3028 003A                  move.w  ($3a,A0), D0
05A98A: 303B 0006                  move.w  ($6,PC,D0.w), D0
05A98E: 4EFB 0002                  jmp     ($2,PC,D0.w)
05A992: 0018 0026                  ori.b   #$26, (A0)+
05A996: 0062 0076                  ori.w   #$76, -(A2)
05A99A: 0090 00A4 00BA             ori.l   #$a400ba, (A0)
05A9A0: 00D6                       dc.w    $00d6; ILLEGAL
05A9A2: 00F2                       dc.w    $00f2; ILLEGAL
05A9A4: 0106                       btst    D0, D6
05A9A6: 011A                       btst    D0, (A2)+
05A9A8: 0156                       bchg    D0, (A6)
05A9AA: 317C 0012 0006             move.w  #$12, ($6,A0)
05A9B0: 49FA 42F6                  lea     ($42f6,PC), A4; ($5eca8)
05A9B4: 4EF8 2FEC                  jmp     $2fec.w
05A9B8: 117C 0002 0000             move.b  #$2, ($0,A0)
05A9BE: 317C 0020 0006             move.w  #$20, ($6,A0)
05A9C4: 3168 0012 0050             move.w  ($12,A0), ($50,A0)
05A9CA: 3168 0012 0054             move.w  ($12,A0), ($54,A0)
05A9D0: 5D68 0050                  subq.w  #6, ($50,A0)
05A9D4: 0468 0016 0054             subi.w  #$16, ($54,A0)
05A9DA: 317C 0000 005C             move.w  #$0, ($5c,A0)
05A9E0: 217C FFFF 8000 0048        move.l  #$ffff8000, ($48,A0)
05A9E8: 6100 0BF8                  bsr     $5b5e2
05A9EC: 49FA 568E                  lea     ($568e,PC), A4; ($6007c)
05A9F0: 4EF8 2FEC                  jmp     $2fec.w
05A9F4: 117C 0002 0000             move.b  #$2, ($0,A0)
05A9FA: 317C 000A 0006             move.w  #$a, ($6,A0)
05AA00: 49FA 5494                  lea     ($5494,PC), A4; ($5fe96)
05AA04: 4EF8 2FEC                  jmp     $2fec.w
05AA08: 117C 0002 0000             move.b  #$2, ($0,A0)
05AA0E: 317C 000C 0006             move.w  #$c, ($6,A0)
05AA14: 117C 0000 005B             move.b  #$0, ($5b,A0)
05AA1A: 49FA 593A                  lea     ($593a,PC), A4; ($60356)
05AA1E: 4EF8 2FEC                  jmp     $2fec.w
05AA22: 117C 0002 0000             move.b  #$2, ($0,A0)
05AA28: 317C 000E 0006             move.w  #$e, ($6,A0)
05AA2E: 49FA 5884                  lea     ($5884,PC), A4; ($602b4)
05AA32: 4EF8 2FEC                  jmp     $2fec.w
05AA36: 317C 0010 0006             move.w  #$10, ($6,A0)
05AA3C: 217C 0010 1D66 0030        move.l  #$101d66, ($30,A0)
05AA44: 49FA 4262                  lea     ($4262,PC), A4; ($5eca8)
05AA48: 4EF8 2FEC                  jmp     $2fec.w
05AA4C: 117C 0002 0000             move.b  #$2, ($0,A0)
05AA52: 317C 0016 0006             move.w  #$16, ($6,A0)
05AA58: 217C 0003 0000 0040        move.l  #$30000, ($40,A0)
05AA60: 49FA 4246                  lea     ($4246,PC), A4; ($5eca8)
05AA64: 4EF8 2FEC                  jmp     $2fec.w
05AA68: 117C 0002 0000             move.b  #$2, ($0,A0)
05AA6E: 317C 0018 0006             move.w  #$18, ($6,A0)
05AA74: 217C 0003 0000 0040        move.l  #$30000, ($40,A0)
05AA7C: 49FA 417E                  lea     ($417e,PC), A4; ($5ebfc)
05AA80: 4EF8 2FEC                  jmp     $2fec.w
05AA84: 117C 0002 0000             move.b  #$2, ($0,A0)
05AA8A: 317C 001A 0006             move.w  #$1a, ($6,A0)
05AA90: 49FA 5404                  lea     ($5404,PC), A4; ($5fe96)
05AA94: 4EF8 2FEC                  jmp     $2fec.w
05AA98: 117C 0002 0000             move.b  #$2, ($0,A0)
05AA9E: 317C 001C 0006             move.w  #$1c, ($6,A0)
05AAA4: 49FA 54A0                  lea     ($54a0,PC), A4; ($5ff46)
05AAA8: 4EF8 2FEC                  jmp     $2fec.w
05AAAC: 117C 0002 0000             move.b  #$2, ($0,A0)
05AAB2: 317C 0022 0006             move.w  #$22, ($6,A0)
05AAB8: 4228 005A                  clr.b   ($5a,A0)
05AABC: 3168 000A 004C             move.w  ($a,A0), ($4c,A0)
05AAC2: 0468 0030 004C             subi.w  #$30, ($4c,A0)
05AAC8: 217C 0001 C000 0040        move.l  #$1c000, ($40,A0)
05AAD0: 317C 0000 005C             move.w  #$0, ($5c,A0)
05AAD6: 317C 0007 005E             move.w  #$7, ($5e,A0)
05AADC: 6100 0B04                  bsr     $5b5e2
05AAE0: 49FA 565A                  lea     ($565a,PC), A4; ($6013c)
05AAE4: 4EF8 2FEC                  jmp     $2fec.w
05AAE8: 317C 0024 0006             move.w  #$24, ($6,A0)
05AAEE: 317C 0018 005C             move.w  #$18, ($5c,A0)
05AAF4: 217C 0010 1D66 0030        move.l  #$101d66, ($30,A0)
05AAFC: 4EB8 3238                  jsr     $3238.w
05AB00: 302E 000A                  move.w  ($a,A6), D0
05AB04: 322E 0012                  move.w  ($12,A6), D1
05AB08: 4EB8 307A                  jsr     $307a.w
05AB0C: 5806                       addq.b  #4, D6
05AB0E: E60E                       lsr.b   #3, D6
05AB10: 1146 0017                  move.b  D6, ($17,A0)
05AB14: 4886                       ext.w   D6
05AB16: 103B 601E                  move.b  ($1e,PC,D6.w), D0
05AB1A: 6B00 0006                  bmi     $5ab22
05AB1E: 1140 005A                  move.b  D0, ($5a,A0)
05AB22: 7A00                       moveq   #$0, D5
05AB24: 7C0A                       moveq   #$a, D6
05AB26: 4EB8 73F8                  jsr     $73f8.w
05AB2A: 49FA 4B86                  lea     ($4b86,PC), A4; ($5f6b2)
05AB2E: 4EB8 2FEC                  jsr     $2fec.w
05AB32: 4EF8 394E                  jmp     $394e.w
05AB36: FF20                       dc.w    $ff20; opcode 1111
05AB38: 2020                       move.l  -(A0), D0
05AB3A: 2020                       move.l  -(A0), D0
05AB3C: 2020                       move.l  -(A0), D0
05AB3E: 2020                       move.l  -(A0), D0
05AB40: 2020                       move.l  -(A0), D0
05AB42: 2020                       move.l  -(A0), D0
05AB44: 2020                       move.l  -(A0), D0
05AB46: FF00                       dc.w    $ff00; opcode 1111
05AB48: 0000 0000                  ori.b   #$0, D0
05AB4C: 0000 0000                  ori.b   #$0, D0
05AB50: 0000 0000                  ori.b   #$0, D0
05AB54: 0000 4EB8                  ori.b   #$b8, D0
05AB58: 3648                       movea.w A0, A3
05AB5A: 6700 00B4                  beq     $5ac10
05AB5E: 5468 0002                  addq.w  #2, ($2,A0)
05AB62: 117C 0002 0000             move.b  #$2, ($0,A0)
05AB68: 117C 0001 0084             move.b  #$1, ($84,A0)
05AB6E: 3149 0072                  move.w  A1, ($72,A0)
05AB72: 6100 00E0                  bsr     $5ac54
05AB76: 7000                       moveq   #$0, D0
05AB78: 3140 0086                  move.w  D0, ($86,A0)
05AB7C: 3140 0088                  move.w  D0, ($88,A0)
05AB80: 1140 0077                  move.b  D0, ($77,A0)
05AB84: 1140 0081                  move.b  D0, ($81,A0)
05AB88: 117C 0008 00B0             move.b  #$8, ($b0,A0)
05AB8E: 117C 005A 00A0             move.b  #$5a, ($a0,A0)
05AB94: 117C 0002 00A1             move.b  #$2, ($a1,A0)
05AB9A: 117C 00B4 00B1             move.b  #$b4, ($b1,A0)
05ABA0: 117C 0028 00A3             move.b  #$28, ($a3,A0)
05ABA6: 117C 000A 0076             move.b  #$a, ($76,A0)
05ABAC: 117C 0028 00B5             move.b  #$28, ($b5,A0)
05ABB2: 217C 0010 18E6 0030        move.l  #$1018e6, ($30,A0)
05ABBA: 117C 000A 00BA             move.b  #$a, ($ba,A0)
05ABC0: 117C 0007 00BB             move.b  #$7, ($bb,A0)
05ABC6: 117C 0014 005B             move.b  #$14, ($5b,A0)
05ABCC: 137C 0001 0000             move.b  #$1, ($0,A1)
05ABD2: 137C 0013 0016             move.b  #$13, ($16,A1)
05ABD8: 237C 0009 AD88 0034        move.l  #$9ad88, ($34,A1)
05ABE0: 1368 005A 005A             move.b  ($5a,A0), ($5a,A1)
05ABE6: 337C 0000 0038             move.w  #$0, ($38,A1)
05ABEC: 3368 003A 003A             move.w  ($3a,A0), ($3a,A1)
05ABF2: 3348 0068                  move.w  A0, ($68,A1)
05ABF6: 4EB8 3238                  jsr     $3238.w
05ABFA: 6100 3C18                  bsr     $5e814
05ABFE: 6100 3C68                  bsr     $5e868
05AC02: 3028 0038                  move.w  ($38,A0), D0
05AC06: 5540                       subq.w  #2, D0
05AC08: 303B 0008                  move.w  ($8,PC,D0.w), D0
05AC0C: 4EFB 0004                  jmp     ($4,PC,D0.w)
05AC10: 4E75                       rts