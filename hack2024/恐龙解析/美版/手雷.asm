*走动仍手雷
019904: 2D7C 0200 0016 0004        move.l  #$2000016, ($4,A6)
01990C: 422E 0025                  clr.b   ($25,A6)
019910: 4EB9 0000 5E5C             jsr     $5e5c.l
019916: 306E 00B4                  movea.w ($b4,A6), A0
01991A: 4228 00A8                  clr.b   ($a8,A0)			*等于1，直接起飞
01991E: 0C6E 0202 00B6             cmpi.w  #$202, ($b6,A6)
019924: 6600 001E                  bne     $19944
019928: 4EB9 0000 6248             jsr     $6248.l
01992E: 6500 0014                  bcs     $19944
019932: 3D7C 0201 00B6             move.w  #$201, ($b6,A6)
019938: 4EB9 0000 5E5C             jsr     $5e5c.l
01993E: 3D7C 0202 00B6             move.w  #$202, ($b6,A6)
019944: 1D7C 0001 00C4             move.b  #$1, ($c4,A6)
01994A: 422E 0059                  clr.b   ($59,A6)
01994E: 1D7C 0010 00C8             move.b  #$10, ($c8,A6)
019954: 4EB9 0000 63AA             jsr     $63aa.l
01995A: 102E 0059                  move.b  ($59,A6), D0
01995E: 6700 0008                  beq     $19968
019962: 532E 0059                  subq.b  #1, ($59,A6)
019966: 4E75                       rts
*跑动扔手雷
01A18C: 2D7C 0200 0202 0004        move.l  #$2000202, ($4,A6)
01A194: 302E 0020                  move.w  ($20,A6), D0
01A198: 2D7B 00CA 0038             move.l  (-$36,PC,D0.w), ($38,A6)
01A19E: 1D7C 0001 0025             move.b  #$1, ($25,A6)
01A1A4: 122E 002D                  move.b  ($2d,A6), D1
01A1A8: 162E 002F                  move.b  ($2f,A6), D3
01A1AC: 700B                       moveq   #$b, D0
01A1AE: 4EB9 0000 1506             jsr     $1506.l
01A1B4: 1D43 0037                  move.b  D3, ($37,A6)
01A1B8: 302E 00B6                  move.w  ($b6,A6), D0
01A1BC: 0C40 0201                  cmpi.w  #$201, D0
01A1C0: 6700 0028                  beq     $1a1ea
01A1C4: 0C40 0202                  cmpi.w  #$202, D0
01A1C8: 6700 0020                  beq     $1a1ea
01A1CC: 0C40 0206                  cmpi.w  #$206, D0
01A1D0: 6700 000A                  beq     $1a1dc
01A1D4: 0C40 0207                  cmpi.w  #$207, D0
01A1D8: 6600 000C                  bne     $1a1e6
01A1DC: 422E 0025                  clr.b   ($25,A6)
01A1E0: 4EB9 0000 5CA6             jsr     $5ca6.l
01A1E6: 6000 F6F4                  bra     $198dc

01A1EA: 7000                       moveq   #$0, D0
01A1EC: 102E 0003                  move.b  ($3,A6), D0
01A1F0: D040                       add.w   D0, D0
01A1F2: 303B 0034                  move.w  ($34,PC,D0.w), D0
01A1F6: 4EB9 0000 13CC             jsr     $13cc.l
01A1FC: 1D7C 0001 00C4             move.b  #$1, ($c4,A6)
01A202: 306E 00B4                  movea.w ($b4,A6), A0
01A206: 117C 0001 00A8             move.b  #$1, ($a8,A0)
01A20C: 7004                       moveq   #$4, D0
01A20E: 4EB9 0000 5036             jsr     $5036.l
01A214: 102E 00A0                  move.b  ($a0,A6), D0
01A218: 0240 000F                  andi.w  #$f, D0
01A21C: 6100 1B76                  bsr     $1bd94
01A220: 1D40 00B2                  move.b  D0, ($b2,A6)
01A224: 6000 00CC                  bra     $1a2f2
01A228: 0015 0016                  ori.b   #$16, (A5)
01A22C: 0013 0018                  ori.b   #$18, (A3)
01A230: 2D7C 0200 0202 0004        move.l  #$2000202, ($4,A6)
01A238: 302E 0020                  move.w  ($20,A6), D0
01A23C: 41FA FF26                  lea     (-$da,PC), A0; ($1a164)
01A240: 2D70 0000 0038             move.l  (A0,D0.w), ($38,A6)
01A246: 1D7C 0001 0025             move.b  #$1, ($25,A6)
01A24C: 122E 002D                  move.b  ($2d,A6), D1
01A250: 162E 002F                  move.b  ($2f,A6), D3
01A254: 700B                       moveq   #$b, D0
01A256: 4EB9 0000 1506             jsr     $1506.l
01A25C: 1D43 0037                  move.b  D3, ($37,A6)
01A260: 302E 00B6                  move.w  ($b6,A6), D0
01A264: 6700 0056                  beq     $1a2bc
01A268: 0C40 0201                  cmpi.w  #$201, D0
01A26C: 6700 0028                  beq     $1a296
01A270: 0C40 0202                  cmpi.w  #$202, D0
01A274: 6700 0020                  beq     $1a296
01A278: 0C40 0206                  cmpi.w  #$206, D0
01A27C: 6700 000A                  beq     $1a288
01A280: 0C40 0207                  cmpi.w  #$207, D0
01A284: 6600 000C                  bne     $1a292
01A288: 422E 0025                  clr.b   ($25,A6)
01A28C: 4EB9 0000 5CA6             jsr     $5ca6.l
01A292: 6000 F648                  bra     $198dc
01A296: 7000                       moveq   #$0, D0
01A298: 102E 0003                  move.b  ($3,A6), D0
01A29C: D040                       add.w   D0, D0
01A29E: 303B 0088                  move.w  (-$78,PC,D0.w), D0
01A2A2: 4EB9 0000 13CC             jsr     $13cc.l
01A2A8: 1D7C 0001 00C4             move.b  #$1, ($c4,A6)
01A2AE: 306E 00B4                  movea.w ($b4,A6), A0
01A2B2: 117C 0001 00A8             move.b  #$1, ($a8,A0)
01A2B8: 6000 000A                  bra     $1a2c4
01A2BC: 7009                       moveq   #$9, D0
01A2BE: 4EB9 0000 13A8             jsr     $13a8.l
01A2C4: 7004                       moveq   #$4, D0
01A2C6: 4EB9 0000 5036             jsr     $5036.l
01A2CC: 102E 00A0                  move.b  ($a0,A6), D0
01A2D0: 0240 000F                  andi.w  #$f, D0
01A2D4: 6100 1ABE                  bsr     $1bd94
01A2D8: 1D7C 0016 0058             move.b  #$16, ($58,A6)
01A2DE: 7000                       moveq   #$0, D0
01A2E0: 1D40 0059                  move.b  D0, ($59,A6)
01A2E4: 1D6D 67BE 005E             move.b  ($67be,A5), ($5e,A6)
01A2EA: 522D 67BE                  addq.b  #1, ($67be,A5)
01A2EE: 1D40 00B2                  move.b  D0, ($b2,A6)
01A2F2: 102E 00A0                  move.b  ($a0,A6), D0
01A2F6: 0240 000F                  andi.w  #$f, D0
01A2FA: 6700 EE26                  beq     $19122
01A2FE: 4EB9 0000 189C             jsr     $189c.l
01A304: 4EB9 0000 1426             jsr     $1426.l
01A30A: 6400 001E                  bcc     $1a32a
01A30E: 422E 0025                  clr.b   ($25,A6)
01A312: 162E 0037                  move.b  ($37,A6), D3
01A316: 122E 0035                  move.b  ($35,A6), D1
01A31A: 7009                       moveq   #$9, D0
01A31C: 4EB9 0000 13EA             jsr     $13ea.l
01A322: 1D43 002F                  move.b  D3, ($2f,A6)
01A326: 6000 FCB6                  bra     $19fde
01A32A: 4EF9 0000 1542             jmp     $1542.l
01A330: 102E 0090                  move.b  ($90,A6), D0
01A334: 303B 0006                  move.w  ($6,PC,D0.w), D0
01A338: 4EFB 0002                  jmp     ($2,PC,D0.w)
01A33C: 0008                       dc.w    $0008; ILLEGAL
01A33E: 001C 0082                  ori.b   #$82, (A4)+
01A342: 020C                       dc.w    $020c; ILLEGAL
01A344: 422E 0025                  clr.b   ($25,A6)
01A348: 3D7C 00B4 00EC             move.w  #$b4, ($ec,A6)
01A34E: 1D7C 0002 0000             move.b  #$2, ($0,A6)
01A354: 542E 0090                  addq.b  #2, ($90,A6)
01A358: 4EB9 0000 6922             jsr     $6922.l
01A35E: 6500 EDC2                  bcs     $19122
01A362: 1228 002D                  move.b  ($2d,A0), D1
01A366: 7017                       moveq   #$17, D0
01A368: 4EB9 0000 13EA             jsr     $13ea.l
01A36E: 306E 0070                  movea.w ($70,A6), A0
01A372: 4A28 002C                  tst.b   ($2c,A0)
01A376: 6600 0004                  bne     $1a37c
01A37A: 4E75                       rts