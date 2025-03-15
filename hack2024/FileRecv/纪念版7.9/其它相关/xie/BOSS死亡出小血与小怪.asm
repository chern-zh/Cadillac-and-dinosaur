	org		$2af8c
	nop
	jsr		$18b000
	org		$18b000
	movem.l D0-D7/A0-A6, -(A7)
	cmpi.w  #$48, ($20,A6)
	bne     $102d24
102D0E: 323C 0008                  move.w  #$8, D1
102D12: 343C 0002                  move.w  #$2, D2
102D16: 363C 0000                  move.w  #$0, D3
102D1A: 383C 0000                  move.w  #$0, D4
102D1E: 4EF9 0010 2E26             jmp     $102e26.l
102D24: 0C6E 016C 0020             cmpi.w  #$16c, ($20,A6)
102D2A: 6600 0024                  bne     $102d50
102D2E: 0C39 0001 00FF 84D9        cmpi.b  #$1, $ff84d9.l
102D36: 6700 00F4                  beq     $102e2c
102D3A: 323C 0018                  move.w  #$18, D1
102D3E: 343C 0002                  move.w  #$2, D2
102D42: 363C 0003                  move.w  #$3, D3
102D46: 383C 0000                  move.w  #$0, D4
102D4A: 4EF9 0010 2E26             jmp     $102e26.l
102D50: 0C6E 0090 0020             cmpi.w  #$90, ($20,A6)
102D56: 6600 0014                  bne     $102d6c
102D5A: 1D7C 0003 0096             move.b  #$3, ($96,A6)
102D60: 4EB9 0002 4B36             jsr     $24b36.l
102D66: 4EF9 0010 2E2C             jmp     $102e2c.l
102D6C: 0C6E 00A0 0020             cmpi.w  #$a0, ($20,A6)
102D72: 6600 0014                  bne     $102d88
102D76: 1D7C 0003 0096             move.b  #$3, ($96,A6)
102D7C: 4EB9 0002 4B36             jsr     $24b36.l
102D82: 4EF9 0010 2E2C             jmp     $102e2c.l
102D88: 0C6E 0150 0020             cmpi.w  #$150, ($20,A6)
102D8E: 6600 002A                  bne     $102dba
102D92: 1D7C 0003 0096             move.b  #$3, ($96,A6)
102D98: 4EB9 0002 4B36             jsr     $24b36.l
102D9E: 5639 00FF FFB0             addq.b  #3, $ffffb0.l
102DA4: 323C 00A0                  move.w  #$a0, D1
102DA8: 343C 0002                  move.w  #$2, D2
102DAC: 363C 001A                  move.w  #$1a, D3
102DB0: 383C 0000                  move.w  #$0, D4
102DB4: 4EF9 0010 2E26             jmp     $102e26.l
102DBA: 0C6E 011C 0020             cmpi.w  #$11c, ($20,A6)
102DC0: 6600 0032                  bne     $102df4
102DC4: 0C39 0006 00FF 84D9        cmpi.b  #$6, $ff84d9.l
102DCC: 6600 0014                  bne     $102de2
102DD0: 0C39 0003 00FF 8786        cmpi.b  #$3, $ff8786.l
102DD8: 6600 0008                  bne     $102de2
102DDC: 4EF9 0010 2E2C             jmp     $102e2c.l
102DE2: 1D7C 0003 0096             move.b  #$3, ($96,A6)
102DE8: 4EB9 0002 4B36             jsr     $24b36.l
102DEE: 4EF9 0010 2E2C             jmp     $102e2c.l
102DF4: 0C6E 00F4 0020             cmpi.w  #$f4, ($20,A6)
102DFA: 6600 0030                  bne     $102e2c
102DFE: 1D7C 0003 0096             move.b  #$3, ($96,A6)
102E04: 4EB9 0002 4B36             jsr     $24b36.l
102E0A: 0C39 0005 00FF 84D9        cmpi.b  #$5, $ff84d9.l
102E12: 6700 0018                  beq     $102e2c
102E16: 323C 0028                  move.w  #$28, D1
102E1A: 343C 0002                  move.w  #$2, D2
102E1E: 363C 0000                  move.w  #$0, D3
102E22: 383C 0000                  move.w  #$0, D4
102E26: 4EB9 0010 2300             jsr     $102300.l
102E2C: 4CDF 7FFF                  movem.l (A7)+, D0-D7/A0-A6
102E30: 4E75                       rts

107200: 23CD 00FF FFF4             move.l  A5, $fffff4.l
107206: 0C6E 00F4 0020             cmpi.w  #$f4, ($20,A6)
10720C: 6700 0058                  beq     $107266
107210: 0C6E 011C 0020             cmpi.w  #$11c, ($20,A6)
107216: 6700 0074                  beq     $10728c
10721A: 0C6E 0150 0020             cmpi.w  #$150, ($20,A6)
107220: 6700 008A                  beq     $1072ac
107224: 0C6E 0090 0020             cmpi.w  #$90, ($20,A6)
10722A: 6700 00CC                  beq     $1072f8
10722E: 0C6E 00A0 0020             cmpi.w  #$a0, ($20,A6)
107234: 6700 009C                  beq     $1072d2
107238: 0C6E 0028 0020             cmpi.w  #$28, ($20,A6)
10723E: 6700 00F8                  beq     $107338
107242: 0C6E 0038 0020             cmpi.w  #$38, ($20,A6)
107248: 6700 0114                  beq     $10735e
10724C: 0C6E 0050 0020             cmpi.w  #$50, ($20,A6)
107252: 6700 012A                  beq     $10737e
107256: 0C6E 0018 0020             cmpi.w  #$18, ($20,A6)
10725C: 6700 013C                  beq     $10739a
107260: 4EF9 0010 73C8             jmp     $1073c8.l
107266: 5339 00FF FFC0             subq.b  #1, $ffffc0.l
10726C: 5339 00FF FFB0             subq.b  #1, $ffffb0.l
107272: 0C2D 0001 04D9             cmpi.b  #$1, ($4d9,A5)
107278: 6600 0148                  bne     $1073c2
10727C: 0C2D 0002 0786             cmpi.b  #$2, ($786,A5)
107282: 6600 013E                  bne     $1073c2
107286: 4EF9 0010 73C8             jmp     $1073c8.l
10728C: 5339 00FF FFB0             subq.b  #1, $ffffb0.l
107292: 0C2D 0006 04D9             cmpi.b  #$6, ($4d9,A5)
107298: 6600 0128                  bne     $1073c2
10729C: 0C2D 0003 0786             cmpi.b  #$3, ($786,A5)
1072A2: 6600 011E                  bne     $1073c2
1072A6: 4EF9 0010 73C8             jmp     $1073c8.l
1072AC: 5339 00FF FFC0             subq.b  #1, $ffffc0.l
1072B2: 5339 00FF FFB0             subq.b  #1, $ffffb0.l
1072B8: 0C2D 0007 04D9             cmpi.b  #$7, ($4d9,A5)
1072BE: 6600 00F6                  bne     $1073b6
1072C2: 0C2D 0003 0786             cmpi.b  #$3, ($786,A5)
1072C8: 6600 00EC                  bne     $1073b6
1072CC: 4EF9 0010 73C8             jmp     $1073c8.l
1072D2: 5339 00FF FFC0             subq.b  #1, $ffffc0.l
1072D8: 5339 00FF FFB0             subq.b  #1, $ffffb0.l
1072DE: 0C2D 0004 04D9             cmpi.b  #$4, ($4d9,A5)
1072E4: 6600 00DC                  bne     $1073c2
1072E8: 0C2D 0001 0786             cmpi.b  #$1, ($786,A5)
1072EE: 6600 00D2                  bne     $1073c2
1072F2: 4EF9 0010 73C8             jmp     $1073c8.l
1072F8: 5339 00FF FFC0             subq.b  #1, $ffffc0.l
1072FE: 5339 00FF FFB0             subq.b  #1, $ffffb0.l
107304: 0C2D 0007 04D9             cmpi.b  #$7, ($4d9,A5)
10730A: 6700 001C                  beq     $107328
10730E: 0C2D 0004 04D9             cmpi.b  #$4, ($4d9,A5)
107314: 6600 00AC                  bne     $1073c2
107318: 0C2D 0001 0786             cmpi.b  #$1, ($786,A5)
10731E: 6600 00A2                  bne     $1073c2
107322: 4EF9 0010 73C8             jmp     $1073c8.l
107328: 0C2D 0003 0786             cmpi.b  #$3, ($786,A5)
10732E: 6600 0092                  bne     $1073c2
107332: 4EF9 0010 73C8             jmp     $1073c8.l
107338: 0C2D 0005 04D9             cmpi.b  #$5, ($4d9,A5)
10733E: 6600 0088                  bne     $1073c8
107342: 0C2D 0002 0786             cmpi.b  #$2, ($786,A5)
107348: 6700 007E                  beq     $1073c8
10734C: 4E71                       nop
10734E: 4E71                       nop
107350: 4E71                       nop
107352: 5239 00FF FFB0             addq.b  #1, $ffffb0.l
107358: 4EF9 0010 73AA             jmp     $1073aa.l
10735E: 0C2D 0006 04D9             cmpi.b  #$6, ($4d9,A5)
107364: 6600 0062                  bne     $1073c8
107368: 0C2D 0003 0786             cmpi.b  #$3, ($786,A5)
10736E: 6700 0058                  beq     $1073c8
107372: 5239 00FF FFB0             addq.b  #1, $ffffb0.l
107378: 4EF9 0010 73AA             jmp     $1073aa.l
10737E: 0C2D 0002 04D9             cmpi.b  #$2, ($4d9,A5)
107384: 6600 0042                  bne     $1073c8
107388: 4E71                       nop
10738A: 4E71                       nop
10738C: 4E71                       nop
10738E: 5239 00FF FFB0             addq.b  #1, $ffffb0.l
107394: 4EF9 0010 73AA             jmp     $1073aa.l
10739A: 0C2D 0001 04D9             cmpi.b  #$1, ($4d9,A5)
1073A0: 6600 0026                  bne     $1073c8
1073A4: 4EF9 0010 73AA             jmp     $1073aa.l
1073AA: 3D7C 0090 0020             move.w  #$90, ($20,A6)
1073B0: 4EF9 0010 73C8             jmp     $1073c8.l
1073B6: 3D7C 00A0 0020             move.w  #$a0, ($20,A6)
1073BC: 4EF9 0010 73C8             jmp     $1073c8.l
1073C2: 3D7C 00C8 0020             move.w  #$c8, ($20,A6)
1073C8: 2A79 00FF FFF4             movea.l $fffff4.l, A5
1073CE: 2D7C 0400 0000 0004        move.l  #$4000000, ($4,A6)
1073D6: 4E75                       rts
1073D8: 3D7C 0090 0020             move.w  #$90, ($20,A6)
1073DE: 4EF9 0010 73F0             jmp     $1073f0.l
1073E4: 4EB9 0010 7C50             jsr     $107c50.l
1073EA: 3D7C 0028 0020             move.w  #$28, ($20,A6)
1073F0: 2A79 00FF FFF4             movea.l $fffff4.l, A5
1073F6: 2D7C 0400 0000 0004        move.l  #$4000000, ($4,A6)
1073FE: 4E75                       rts
107400: 0000 0004                  ori.b   #$4, D0
107404: 4E75                       rts
107406: 0000 0004                  ori.b   #$4, D0
10740A: 4E75                       rts
10740C: 4EF9 0010 7418             jmp     $107418.l
107412: 3D7C 0028 0020             move.w  #$28, ($20,A6)
107418: 2A79 00FF FFFC             movea.l $fffffc.l, A5
10741E: 2D7C 0400 0000 0004        move.l  #$4000000, ($4,A6)
107426: 4E75                       rts


102300: 23C0 00FF FFFC             move.l  D0, $fffffc.l
102306: 23C8 00FF FFF8             move.l  A0, $fffff8.l
10230C: 4280                       clr.l   D0
10230E: 5200                       addq.b  #1, D0
102310: B002                       cmp.b   D2, D0
102312: 6700 0040                  beq     $102354
102316: 4EB8 483C                  jsr     $483c.w
10231A: 6500 0038                  bcs     $102354
10231E: 4EB9 0010 7C00             jsr     $107c00.l
102324: 117C 0001 0000             move.b  #$1, ($0,A0)
10232A: 3141 0020                  move.w  D1, ($20,A0)
10232E: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
102334: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
10233A: 3144 0026                  move.w  D4, ($26,A0)
10233E: 317C 0000 005C             move.w  #$0, ($5c,A0)
102344: 117C 0000 005B             move.b  #$0, ($5b,A0)
10234A: 1143 0096                  move.b  D3, ($96,A0)
10234E: 4EF9 0010 230E             jmp     $10230e.l
102354: 2079 00FF FFF8             movea.l $fffff8.l, A0
10235A: 2039 00FF FFFC             move.l  $fffffc.l, D0
102360: 4E75                       rts

107C00: 23C0 00FF FFFC             move.l  D0, $fffffc.l
107C06: 23CB 00FF FFF8             move.l  A3, $fffff8.l
107C0C: 4280                       clr.l   D0
107C0E: 2648                       movea.l A0, A3
107C10: D7FC 0000 00B0             adda.l  #$b0, A3
107C16: 429B                       clr.l   (A3)+
107C18: 5200                       addq.b  #1, D0
107C1A: 0C00 000C                  cmpi.b  #$c, D0
107C1E: 6DF6                       blt     $107c16
107C20: 2679 00FF FFF8             movea.l $fffff8.l, A3
107C26: 2039 00FF FFFC             move.l  $fffffc.l, D0
107C2C: 4E75                       rts
107C2E: 6DF6                       blt     $107c26
107C30: 4E75                       rts	