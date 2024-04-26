*==================每关自动行走程序========================
01DA10: 7000                       moveq   #$0, D0
01DA12: 1B40 3344                  move.b  D0, ($3344,A5)
01DA16: 1B40 34C4                  move.b  D0, ($34c4,A5)
01DA1A: 1B40 3644                  move.b  D0, ($3644,A5)
01DA1E: 1B40 04DD                  move.b  D0, ($4dd,A5)
01DA22: 1B40 04DE                  move.b  D0, ($4de,A5)
01DA26: 7000                       moveq   #$0, D0
01DA28: 102D 04D9                  move.b  ($4d9,A5), D0
01DA2C: E548                       lsl.w   #2, D0
01DA2E: 207B 0034                  movea.l ($34,PC,D0.w), A0
01DA32: 7000                       moveq   #$0, D0
01DA34: 102D 0786                  move.b  ($786,A5), D0
01DA38: D040                       add.w   D0, D0
01DA3A: D0C0                       adda.w  D0, A0
01DA3C: 1B58 04DE                  move.b  (A0)+, ($4de,A5)
01DA40: 1B6D 04E4 04DD             move.b  ($4e4,A5), ($4dd,A5)
01DA46: 4A2D 04D9                  tst.b   ($4d9,A5)
01DA4A: 660A                       bne     $1da56
01DA4C: 0C2D 0002 0786             cmpi.b  #$2, ($786,A5)
01DA52: 6602                       bne     $1da56
01DA54: 4E75                       rts

*==========================2、4关开局开车动作===================================
018AAE: 4A2D 0786                  tst.b   ($786,A5)
018AB2: 6600 0082                  bne     $18b36
018AB6: 0C2D 0001 04D9             cmpi.b  #$1, ($4d9,A5)
018ABC: 6700 000C                  beq     $18aca
018AC0: 0C2D 0003 04D9             cmpi.b  #$3, ($4d9,A5)
018AC6: 6600 006E                  bne     $18b36
018ACA: 7000                       moveq   #$0, D0
018ACC: 122E 0002                  move.b  ($2,A6), D1
018AD0: 6700 003C                  beq     $18b0e
018AD4: 0C01 0001                  cmpi.b  #$1, D1
018AD8: 6600 0010                  bne     $18aea
018ADC: 7204                       moveq   #$4, D1
018ADE: 4A2D 3274                  tst.b   ($3274,A5)
018AE2: 6700 002A                  beq     $18b0e
018AE6: 6000 0014                  bra     $18afc
018AEA: 7208                       moveq   #$8, D1
018AEC: 4A2D 3274                  tst.b   ($3274,A5)
018AF0: 6600 000A                  bne     $18afc
018AF4: 4A2D 33F4                  tst.b   ($33f4,A5)
018AF8: 6700 0014                  beq     $18b0e
018AFC: 7006                       moveq   #$6, D0
018AFE: 4EB9 0000 13A0             jsr     $13a0.l
018B04: 1D7C 0001 0024             move.b  #$1, ($24,A6)
018B0A: 6000 0012                  bra     $18b1e
018B0E: 1B40 0504                  move.b  D0, ($504,A5)
018B12: 701D                       moveq   #$1d, D0
018B14: 4EB9 0000 13A0             jsr     $13a0.l
018B1A: 422E 0024                  clr.b   ($24,A6)
018B1E: 1D7C 0001 0051             move.b  #$1, ($51,A6)
018B24: 422E 011B                  clr.b   ($11b,A6)
018B28: 1D7C 0010 0025             move.b  #$10, ($25,A6)
018B2E: 2D7C 0200 0432 0004        move.l  #$2000432, ($4,A6)
018B36: 4E75                       rts



*===============================场景换色================================
		org		$8ad2
		nop
		jsr		_rbjt	
		
		org		$8c44
		nop
		jsr		_rbjt	

		org		$190000	
_rbjt		
		movem.l   D0-D6/A2,(A1)				;
		cmpa.l	#$914800,A1					;小于914800的不要交换，可能是人物色板跟其他
		blt		_8ad2_tui		
		movem.l	D0-D7,-(A7)					;再次改变写入显存数据的R跟G色(交换)		
		move.w	#$f,D4						;循环计数		
_bhjhgoon
		andi.w	#$ff00,(A1)+
		dbra	D4,_bhjhgoon				;循环20次(f)后退出
		movem.l	(A7)+,D0-D7		
		suba.l  #$20,A1						;显存地址回到开始处
_8ad2_tui
		lea   	($20,A1),A1					;下一组色板
		rts
		
		
		
01E11E: 4A2E 00D3                  tst.b   ($d3,A6)
01E122: 6612                       bne     $1e136
01E124: 6100 0014                  bsr     $1e13a
01E128: 7000                       moveq   #$0, D0
01E12A: 1D40 00DB                  move.b  D0, ($db,A6)
01E12E: 1B40 04DF                  move.b  D0, ($4df,A5)
01E132: 542E 00D3                  addq.b  #2, ($d3,A6)
01E136: 6000 FDD8                  bra     $1df10
01E13A: 41FA 0FCE                  lea     ($fce,PC), A0; ($1f10a)
01E13E: 7000                       moveq   #$0, D0
01E140: 102D 04D9                  move.b  ($4d9,A5), D0
01E144: E948                       lsl.w   #4, D0
01E146: 41F0 0000                  lea     (A0,D0.w), A0
01E14A: 6100 0024                  bsr     $1e170
01E14E: 3358 00DC                  move.w  (A0)+, ($dc,A1)		*自动行走时的目标XY坐标，1P
01E152: 3358 00DE                  move.w  (A0)+, ($de,A1)
01E156: 4A82                       tst.l   D2
01E158: 6714                       beq     $1e16e
01E15A: 3558 00DC                  move.w  (A0)+, ($dc,A2)		*2P
01E15E: 3558 00DE                  move.w  (A0)+, ($de,A2)
01E162: 4A83                       tst.l   D3
01E164: 6708                       beq     $1e16e
01E166: 3758 00DC                  move.w  (A0)+, ($dc,A3)
01E16A: 3758 00DE                  move.w  (A0)+, ($de,A3)
01E16E: 4E75                       rts
01E170: 7000                       moveq   #$0, D0
01E172: 43ED 3274                  lea     ($3274,A5), A1
01E176: 4A29 0000                  tst.b   ($0,A1)
01E17A: 6602                       bne     $1e17e
01E17C: 2240                       movea.l D0, A1
01E17E: 45ED 33F4                  lea     ($33f4,A5), A2
01E182: 4A2A 0000                  tst.b   ($0,A2)
01E186: 6602                       bne     $1e18a
01E188: 2440                       movea.l D0, A2
01E18A: 47ED 3574                  lea     ($3574,A5), A3
01E18E: 4A2B 0000                  tst.b   ($0,A3)
01E192: 6602                       bne     $1e196
01E194: 2640                       movea.l D0, A3
01E196: 2209                       move.l  A1, D1
01E198: 240A                       move.l  A2, D2
01E19A: 260B                       move.l  A3, D3
01E19C: 4A81                       tst.l   D1
01E19E: 660A                       bne     $1e1aa
01E1A0: 2001                       move.l  D1, D0
01E1A2: 2202                       move.l  D2, D1
01E1A4: 2403                       move.l  D3, D2
01E1A6: 2600                       move.l  D0, D3
01E1A8: 60F2                       bra     $1e19c
01E1AA: 4A82                       tst.l   D2
01E1AC: 660A                       bne     $1e1b8
01E1AE: 4A83                       tst.l   D3
01E1B0: 6706                       beq     $1e1b8
01E1B2: 2002                       move.l  D2, D0
01E1B4: 2403                       move.l  D3, D2
01E1B6: 2600                       move.l  D0, D3
01E1B8: 2241                       movea.l D1, A1
01E1BA: 2442                       movea.l D2, A2
01E1BC: 2643                       movea.l D3, A3
01E1BE: 4A82                       tst.l   D2
01E1C0: 6736                       beq     $1e1f8
01E1C2: 3029 0008                  move.w  ($8,A1), D0
01E1C6: B06A 0008                  cmp.w   ($8,A2), D0
01E1CA: 6C08                       bge     $1e1d4
01E1CC: 2009                       move.l  A1, D0
01E1CE: 224A                       movea.l A2, A1
01E1D0: 2440                       movea.l D0, A2
01E1D2: 60EE                       bra     $1e1c2
01E1D4: 4A83                       tst.l   D3
01E1D6: 6720                       beq     $1e1f8
01E1D8: 302A 0008                  move.w  ($8,A2), D0
01E1DC: B06B 0008                  cmp.w   ($8,A3), D0
01E1E0: 6C16                       bge     $1e1f8
01E1E2: 200A                       move.l  A2, D0
01E1E4: 244B                       movea.l A3, A2
01E1E6: 2640                       movea.l D0, A3
01E1E8: 3029 0008                  move.w  ($8,A1), D0
01E1EC: B06A 0008                  cmp.w   ($8,A2), D0
01E1F0: 6C06                       bge     $1e1f8
01E1F2: 2009                       move.l  A1, D0
01E1F4: 224A                       movea.l A2, A1
01E1F6: 2440                       movea.l D0, A2
01E1F8: 2209                       move.l  A1, D1
01E1FA: 240A                       move.l  A2, D2
01E1FC: 260B                       move.l  A3, D3
01E1FE: 4E75                       rts
		
		
		
		
		
		
		









