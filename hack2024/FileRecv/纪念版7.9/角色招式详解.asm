1A00C跳转
01A00C: 082E 0004 00A8             btst    #$4, ($a8,A6)	/测试是否1X
01A012: 6600 00E2                  bne     $1a0f6
01A016: 082E 0005 00A8             btst    #$5, ($a8,A6)	/测试是否2X
01A01C: 6600 086A                  bne     $1a888


104CC0: 0C2E 0002 0003             cmpi.b  #$2,($3,A6)		/检测是否汉娜
104CC6: 6600 0034                  bne     $104cfc			/非汉娜，跳
104CCA: 0C2E 0030 00A0             cmpi.b  #$30, ($a0,A6)	/检测玩家按键是否为AB键，10拳，20跳，01右，02左，04下，08上，方向组合键相加即可
104CD0: 6D00 002A                  blt     $104cfc
104CD4: 0C2E 003A 00A0             cmpi.b  #$3a, ($a0,A6)	/3A为AB+右上，
104CDA: 6E00 0020                  bgt     $104cfc
104CDE: BDFC FFFF B274             cmpa.l  #$ffffb274, A6
104CE4: 6700 0026                  beq     $104d0c
104CE8: BDFC FFFF B3F4             cmpa.l  #$ffffb3f4, A6
104CEE: 6700 001C                  beq     $104d0c
104CF2: BDFC FFFF B574             cmpa.l  #$ffffb574, A6
104CF8: 6700 0012                  beq     $104d0c
104CFC: 082E 0004 00A8             btst    #$4, ($a8,A6)
104D02: 6600 0008                  bne     $104d0c
104D06: 4EF9 0001 A016             jmp     $1a016.l			/汉娜，且AB键才会走此
104D0C: 4EF9 0001 A0F6             jmp     $1a0f6.l

143e
104B30: FAE8                       cmpa.l	#$9fae8,A0
104B36: 6700 000A                  beq     $104b42
104B3A: 2D48 0028                  move.l  A0, ($28,A6)
104B3E: 3018                       move.w  (A0)+, D0
104B40: 4E75                       rts
104B42: 0C2E 0002 0003             cmpi.b  #$2, ($3,A6)
104B48: 66F0                       bne     $104b3a
104B4A: 0C2E 0030 00A0             cmpi.b  #$30, ($a0,A6)
104B50: 6DE8                       blt     $104b3a
104B52: 0C2E 003A 00A0             cmpi.b  #$3a, ($a0,A6)
104B58: 6EE0                       bgt     $104b3a
104B5A: 207C 0010 4C00             movea.l #$104c00, A0		/更换A0地址
104B60: 60D8                       bra     $104b3a

DC.W	/这里为动作
104C00: 17B0 8000 0000 0405 0028 5000 17B0 8000   		/17A8为胳膊肘66A
104C10: 0100 040F 0028 5000 17C0 8000 0200 04C6 
104C20: 0028 5000 FFF4

1B66E  下上A


1AB88
表格：
01BEB4: 0600 FFE8                  addi.b  #-$18, D0
01BEB8: 03C0                       bset    D1, D0
01BEBA: FFC8                       dc.w    $ffc8; opcode 1111
01BEBC: 0400 0000                  subi.b  #$0, D0