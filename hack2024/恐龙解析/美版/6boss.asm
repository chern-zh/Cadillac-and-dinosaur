08A3D0: 102E 0004                  move.b  ($4,A6), D0
08A3D4: 323B 0006                  move.w  ($6,PC,D0.w), D1
08A3D8: 4EFB 1002                  jmp     ($2,PC,D1.w)
08A3DC: 0008                       dc.w    $0008; ILLEGAL
08A3DE: 0014 01A0                  ori.b   #$a0, (A4)
08A3E2: 01A0                       bclr    D0, -(A0)
08A3E4: 1D7C 0002 0004             move.b  #$2, ($4,A6)
08A3EA: 1D7C 0002 0000             move.b  #$2, ($0,A6)
08A3F0: 7000                       moveq   #$0, D0
08A3F2: 102E 0005                  move.b  ($5,A6), D0
08A3F6: 323B 0006                  move.w  ($6,PC,D0.w), D1
08A3FA: 4EFB 1002                  jmp     ($2,PC,D1.w)
08A3FE: 0014 002C                  ori.b   #$2c, (A4)
08A402: 016E 0128                  bchg    D0, ($128,A6)
08A406: 016E 013E                  bchg    D0, ($13e,A6)
08A40A: 016E 0154                  bchg    D0, ($154,A6)
08A40E: 016E 016A                  bchg    D0, ($16a,A6)
08A412: 303C 0021                  move.w  #$21, D0
08A416: 323C 0000                  move.w  #$0, D1
08A41A: 343C 0000                  move.w  #$0, D2
08A41E: 4EB9 0000 A63C             jsr     $a63c.l		；加载6BOSS出场音乐
08A424: 1D7C 0002 0005             move.b  #$2, ($5,A6)
08A42A: 4EB9 0000 483C             jsr     $483c.l
08A430: 652A                       bcs     $8a45c
08A432: 117C 0001 0000             move.b  #$1, ($0,A0)
08A438: 317C 012C 0020             move.w  #$12c, ($20,A0)		/6B幼体骨灰盒
08A43E: 317C 0000 0026             move.w  #$0, ($26,A0)		/小类为0
08A444: 117C 0000 0022             move.b  #$0, ($22,A0)
08A44A: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
08A450: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
08A456: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
08A45C: 4EB9 0000 483C             jsr     $483c.l
08A462: 6530                       bcs     $8a494
08A464: 117C 0001 0000             move.b  #$1, ($0,A0)
08A46A: 317C 012C 0020             move.w  #$12c, ($20,A0)
08A470: 317C 0001 0026             move.w  #$1, ($26,A0)		/小类为1，骨灰盒左侧被附身的马甲
08A476: 117C 0000 0022             move.b  #$0, ($22,A0)
08A47C: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
08A482: 0468 0030 0008             subi.w  #$30, ($8,A0)		/X坐标左移30
08A488: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
08A48E: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
08A494: 4EB9 0000 483C             jsr     $483c.l
08A49A: 6536                       bcs     $8a4d2
08A49C: 117C 0001 0000             move.b  #$1, ($0,A0)
08A4A2: 317C 012C 0020             move.w  #$12c, ($20,A0)
08A4A8: 317C 0004 0026             move.w  #$4, ($26,A0)		/小类为4，会变身马甲，可以使用其进行变身
08A4AE: 117C 0000 0022             move.b  #$0, ($22,A0)
08A4B4: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
08A4BA: 0668 0030 0008             addi.w  #$30, ($8,A0)		/X坐标左移30
08A4C0: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
08A4C6: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
08A4CC: 0468 0020 0010             subi.w  #$20, ($10,A0)		/Y坐标下移20
08A4D2: 4EB9 0000 483C             jsr     $483c.l
08A4D8: 6536                       bcs     $8a510
08A4DA: 117C 0001 0000             move.b  #$1, ($0,A0)
08A4E0: 317C 012C 0020             move.w  #$12c, ($20,A0)
08A4E6: 317C 0004 0026             move.w  #$4, ($26,A0)		/小类为4，会变成马甲
08A4EC: 117C 0000 0022             move.b  #$0, ($22,A0)
08A4F2: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
08A4F8: 0468 0010 0008             subi.w  #$10, ($8,A0)
08A4FE: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
08A504: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
08A50A: 0668 0020 0010             addi.w  #$20, ($10,A0)		/Y坐标上移20
08A510: 7050                       moveq   #$50, D0
08A512: 4EB9 0008 6D2E             jsr     $86d2e.l
08A518: 3D7C 0079 00A0             move.w  #$79, ($a0,A6)
08A51E: 062E 0002 0005             addi.b  #$2, ($5,A6)
08A524: 4E75                       rts
08A526: 062E 0002 0005             addi.b  #$2, ($5,A6)
08A52C: 3D7C 00DD 00A0             move.w  #$dd, ($a0,A6)
08A532: 7051                       moveq   #$51, D0
08A534: 4EB9 0008 6D2E             jsr     $86d2e.l
08A53A: 4E75                       rts
08A53C: 062E 0002 0005             addi.b  #$2, ($5,A6)
08A542: 3D7C 0079 00A0             move.w  #$79, ($a0,A6)
08A548: 7052                       moveq   #$52, D0
08A54A: 4EB9 0008 6D2E             jsr     $86d2e.l
08A550: 4E75                       rts
08A552: 062E 0002 0005             addi.b  #$2, ($5,A6)
08A558: 3D7C 0079 00A0             move.w  #$79, ($a0,A6)
08A55E: 7053                       moveq   #$53, D0
08A560: 4EB9 0008 6D2E             jsr     $86d2e.l
08A566: 4E75                       rts
08A568: 6000 0012                  bra     $8a57c
08A56C: 536E 00A0                  subq.w  #1, ($a0,A6)
08A570: 6600 0008                  bne     $8a57a
08A574: 062E 0002 0005             addi.b  #$2, ($5,A6)
08A57A: 4E75                       rts




*---------------------------12C主程序-----------------------------------
05E702: 102E 0004                  move.b  ($4,A6), D0
05E706: 323B 0006                  move.w  ($6,PC,D0.w), D1
05E70A: 4EFB 1002                  jmp     ($2,PC,D1.w)
05E70E: 0008                       dc.w    $0008; ILLEGAL
05E710: 006A 04F6 0512             ori.w   #$4f6, ($512,A2)
05E716: 1D7C 0002 0000             move.b  #$2, ($0,A6)
05E71C: 1D7C 0000 0005             move.b  #$0, ($5,A6)
05E722: 2D7C 0007 1A4E 0040        move.l  #$71a4e, ($40,A6)
05E72A: 1D7C FFFF 007D             move.b  #$ff, ($7d,A6)
05E730: 1D7C FFFF 0063             move.b  #$ff, ($63,A6)
05E736: 0C6E 0005 0026             cmpi.w  #$5, ($26,A6)		/小类5
05E73C: 6600 0008                  bne     $5e746
05E740: 1D7C 0000 007D             move.b  #$0, ($7d,A6)
05E746: 0C6E 0008 0026             cmpi.w  #$8, ($26,A6)		/小类8
05E74C: 6600 0008                  bne     $5e756
05E750: 1D7C 0000 007D             move.b  #$0, ($7d,A6)
05E756: 1D7C 0010 0025             move.b  #$10, ($25,A6)
05E75C: 426E 00A0                  clr.w   ($a0,A6)
05E760: 3D7C 0010 00A6             move.w  #$10, ($a6,A6)
05E766: 4EB9 0001 2CB4             jsr     $12cb4.l
05E76C: 7000                       moveq   #$0, D0
05E76E: 4EB9 0000 120E             jsr     $120e.l
05E774: 542E 0004                  addq.b  #2, ($4,A6)
05E778: 7000                       moveq   #$0, D0
05E77A: 102E 0005                  move.b  ($5,A6), D0
05E77E: 323B 0012                  move.w  ($12,PC,D0.w), D1
05E782: 4EBB 100E                  jsr     ($e,PC,D1.w)
05E786: 4EB9 0000 173C             jsr     $173c.l
05E78C: 4EF9 0000 49CA             jmp     $49ca.l
;05E792: 0006 01E4                  ori.b   #$e4, D6
;05E796: 0464 062E                  subi.w  #$62e, -(A4)
05E798:	062E 0002 0005 			   addi.b	#$2,($25,A6)
05E79E: 3D7C 0140 00B2             move.w  #$140, ($b2,A6)
05E7A4: 4A6E 0026                  tst.w   ($26,A6)
05E7A8: 6700 0058                  beq     $5e802
05E7AC: 3D7C 0172 00B2             move.w  #$172, ($b2,A6)
05E7B2: 7001                       moveq   #$1, D0
05E7B4: 4EB9 0000 120E             jsr     $120e.l
05E7BA: 0C6E 0002 0026             cmpi.w  #$2, ($26,A6)		/小类2
05E7C0: 6600 0008                  bne     $5e7ca
05E7C4: 3D7C 0320 00B2             move.w  #$320, ($b2,A6)		/小类2延迟时间320
05E7CA: 0C6E 0003 0026             cmpi.w  #$3, ($26,A6)		/小类3
05E7D0: 6600 0018                  bne     $5e7ea
05E7D4: 3D7C 0022 00B2             move.w  #$22, ($b2,A6)		/小类3延迟时间
05E7DA: 7002                       moveq   #$2, D0
05E7DC: 4EB9 0000 120E             jsr     $120e.l
05E7E2: 7003                       moveq   #$3, D0
05E7E4: 4EB9 0000 17A4             jsr     $17a4.l
05E7EA: 0C6E 0004 0026             cmpi.w  #$4, ($26,A6)		/小类4，蹲守马甲兵，可变身
05E7F0: 6600 0010                  bne     $5e802
05E7F4: 3D7C 01F4 00B2             move.w  #$1f4, ($b2,A6)		/小类4延迟时间1F4
05E7FA: 7003                       moveq   #$3, D0				/此处为马甲兵静止形态，0为箱子，破了后变成兵；1为站立马甲；2、6为冒烟，可变兵；3为蹲守马甲；4为马甲躺着；
*-----------5、7为马甲原地踏步；6为冒小烟；8为轮胎隐现；（9为胖子、A为1BOSS）原地踏步，瞬间变为马甲原地踏步；B为胖子躺着
05E7FC: 4EB9 0000 120E             jsr     $120e.l
05E802: 0C6E 0005 0026             cmpi.w  #$5, ($26,A6)		/小类5，躺着的马甲兵，不断隐现
05E808: 6600 0018                  bne     $5e822
05E80C: 7004                       moveq   #$4, D0				/此处改为3，小类5马甲变为蹲守，依然隐现
05E80E: 4EB9 0000 120E             jsr     $120e.l
05E814: 1D7C 0004 0004             move.b  #$4, ($4,A6)
05E81A: 3D7C 0032 00B2             move.w  #$32, ($b2,A6)
05E820: 4E75                       rts
05E822: 0C6E 0006 0026             cmpi.w  #$6, ($26,A6)		/小类6
05E828: 6600 0010                  bne     $5e83a
05E82C: 3D7C 0018 00B2             move.w  #$18, ($b2,A6)
05E832: 7006                       moveq   #$6, D0
05E834: 4EB9 0000 120E             jsr     $120e.l
05E83A: 0C6E 0007 0026             cmpi.w  #$7, ($26,A6)		/小类7
05E840: 6600 0058                  bne     $5e89a
05E844: 7022                       moveq   #$22, D0
05E846: 4EB9 0000 17A4             jsr     $17a4.l
05E84C: 2D7C 0000 0000 00B4        move.l  #$0, ($b4,A6)
05E854: 2D7C 0004 0000 00B8        move.l  #$40000, ($b8,A6)
05E85C: 4EB9 0000 119C             jsr     $119c.l
05E862: 0240 000F                  andi.w  #$f, D0
05E866: 0C40 0006                  cmpi.w  #$6, D0
05E86A: 6C00 001A                  bge     $5e886
05E86E: 2D7C 0002 0000 00B4        move.l  #$20000, ($b4,A6)
05E876: 701E                       moveq   #$1e, D0
05E878: 4EB9 0000 17A4             jsr     $17a4.l
05E87E: 2D7C 0003 0000 00B8        move.l  #$30000, ($b8,A6)
05E886: 3D7C 001D 00B2             move.w  #$1d, ($b2,A6)
05E88C: 1D7C 0000 0022             move.b  #$0, ($22,A6)
05E892: 7002                       moveq   #$2, D0
05E894: 4EB9 0000 120E             jsr     $120e.l
05E89A: 0C6E 0008 0026             cmpi.w  #$8, ($26,A6)		/小类8
05E8A0: 6600 0018                  bne     $5e8ba
05E8A4: 3D7C 003A 00B2             move.w  #$3a, ($b2,A6)
05E8AA: 7007                       moveq   #$7, D0
05E8AC: 4EB9 0000 120E             jsr     $120e.l
05E8B2: 7007                       moveq   #$7, D0
05E8B4: 4EB9 0000 17A4             jsr     $17a4.l
05E8BA: 0C6E 0009 0026             cmpi.w  #$9, ($26,A6)			/小类9
05E8C0: 6600 0016                  bne     $5e8d8
05E8C4: 3D7C 0032 00B2             move.w  #$32, ($b2,A6)
05E8CA: 7008                       moveq   #$8, D0
05E8CC: 4EB9 0000 120E             jsr     $120e.l
05E8D2: 1D7C 008A 0023             move.b  #$8a, ($23,A6)
05E8D8: 0C6E 0010 0026             cmpi.w  #$10, ($26,A6)			/小类10
05E8DE: 6600 001E                  bne     $5e8fe
05E8E2: 3D7C 003A 00B2             move.w  #$3a, ($b2,A6)
05E8E8: 7009                       moveq   #$9, D0
05E8EA: 4EB9 0000 120E             jsr     $120e.l
05E8F0: 7007                       moveq   #$7, D0
05E8F2: 4EB9 0000 17A4             jsr     $17a4.l
05E8F8: 3D7C 0008 0026             move.w  #$8, ($26,A6)
05E8FE: 0C6E 0011 0026             cmpi.w  #$11, ($26,A6)				/小类11
05E904: 6600 0024                  bne     $5e92a
05E908: 3D7C 003A 00B2             move.w  #$3a, ($b2,A6)
05E90E: 700A                       moveq   #$a, D0
05E910: 4EB9 0000 120E             jsr     $120e.l
05E916: 7007                       moveq   #$7, D0
05E918: 4EB9 0000 17A4             jsr     $17a4.l
05E91E: 1D7C 0099 0023             move.b  #$99, ($23,A6)
05E924: 3D7C 0008 0026             move.w  #$8, ($26,A6)
05E92A: 0C6E 0012 0026             cmpi.w  #$12, ($26,A6)		/小类12
05E930: 6600 001E                  bne     $5e950
05E934: 700B                       moveq   #$b, D0
05E936: 4EB9 0000 120E             jsr     $120e.l
05E93C: 1D7C 0004 0004             move.b  #$4, ($4,A6)
05E942: 3D7C 0032 00B2             move.w  #$32, ($b2,A6)
05E948: 3D7C 0005 0026             move.w  #$5, ($26,A6)
05E94E: 4E75                       rts
05E950: 0C6E 0013 0026             cmpi.w  #$13, ($26,A6)		/小类13
05E956: 6600 001E                  bne     $5e976
05E95A: 3D7C 0022 00B2             move.w  #$22, ($b2,A6)
05E960: 7002                       moveq   #$2, D0
05E962: 4EB9 0000 120E             jsr     $120e.l
05E968: 7007                       moveq   #$7, D0
05E96A: 4EB9 0000 17A4             jsr     $17a4.l
05E970: 3D7C 0003 0026             move.w  #$3, ($26,A6)		/改为小类3

05E976: 0C6E 0003 0026             cmpi.w  #$3, ($26,A6)		/小类3
05E97C: 6700 0196                  beq     $5eb14
05E980: 0C6E 0006 0026             cmpi.w  #$6, ($26,A6)		/小类6，冒烟特效，无用
05E986: 6700 01B2                  beq     $5eb3a
05E98A: 0C6E 0007 0026             cmpi.w  #$7, ($26,A6)		/小类7，消失
05E990: 6700 01B8                  beq     $5eb4a
05E994: 0C6E 0008 0026             cmpi.w  #$8, ($26,A6)		/小类8
05E99A: 6700 0204                  beq     $5eba0
05E99E: 0C6E 0009 0026             cmpi.w  #$9, ($26,A6)		/小类9
05E9A4: 6700 01EE                  beq     $5eb94
05E9A8: 4A6E 0026                  tst.w   ($26,A6)				/小类0，归属真体
05E9AC: 6600 0118                  bne     $5eac6
05E9B0: 536E 00B2                  subq.w  #1, ($b2,A6)
05E9B4: 6700 008A                  beq     $5ea40
05E9B8: 0C6E 0064 00B2             cmpi.w  #$64, ($b2,A6)
05E9BE: 6C00 007A                  bge     $5ea3a
05E9C2: 302E 00B2                  move.w  ($b2,A6), D0
05E9C6: 0240 0003                  andi.w  #$3, D0
05E9CA: 6600 0006                  bne     $5e9d2
05E9CE: 6100 00A6                  bsr     $5ea76
05E9D2: 0C6E 0063 00B2             cmpi.w  #$63, ($b2,A6)
05E9D8: 6600 003C                  bne     $5ea16
05E9DC: 4EB9 0000 483C             jsr     $483c.l
05E9E2: 6500 0032                  bcs     $5ea16
05E9E6: 117C 0001 0000             move.b  #$1, ($0,A0)
05E9EC: 317C 012C 0020             move.w  #$12c, ($20,A0)
05E9F2: 317C 0009 0026             move.w  #$9, ($26,A0)		/幼体出箱循环动作
05E9F8: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
05E9FE: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
05EA04: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
05EA0A: 0668 0002 0010             addi.w  #$2, ($10,A0)
05EA10: 0668 0010 000C             addi.w  #$10, ($c,A0)
05EA16: 302E 00B2                  move.w  ($b2,A6), D0
05EA1A: 0240 0007                  andi.w  #$7, D0
05EA1E: 6700 0014                  beq     $5ea34
05EA22: 0C40 0004                  cmpi.w  #$4, D0
05EA26: 6600 0012                  bne     $5ea3a
05EA2A: 046E 0004 0008             subi.w  #$4, ($8,A6)
05EA30: 6000 0008                  bra     $5ea3a
05EA34: 066E 0004 0008             addi.w  #$4, ($8,A6)
05EA3A: 4EF9 0000 121E             jmp     $121e.l
05EA40: 4EB9 0000 483C             jsr     $483c.l
05EA46: 6500 0026                  bcs     $5ea6e
05EA4A: 117C 0001 0000             move.b  #$1, ($0,A0)
05EA50: 317C 0130 0020             move.w  #$130, ($20,A0)		/130为幼体直接附身，120为幼体躺着，再跳起来附身，120有小类，130默认高阶0200
05EA56: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
05EA5C: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
05EA62: 0468 0001 0010             subi.w  #$1, ($10,A0)
05EA68: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
05EA6E: 062E 0002 0005             addi.b  #$2, ($5,A6)
05EA74: 4E75                       rts
05EA76: 4EB9 0000 483C             jsr     $483c.l
05EA7C: 6500 0046                  bcs     $5eac4
05EA80: 117C 0001 0000             move.b  #$1, ($0,A0)
05EA86: 317C 012C 0020             move.w  #$12c, ($20,A0)
05EA8C: 317C 0007 0026             move.w  #$7, ($26,A0)		/幼体出箱循环动作
05EA92: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
05EA98: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
05EA9E: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
05EAA4: 0668 FFFE 0010             addi.w  #-$2, ($10,A0)
05EAAA: 0468 0020 0008             subi.w  #$20, ($8,A0)
05EAB0: 4EB9 0000 119C             jsr     $119c.l
05EAB6: 0240 0030                  andi.w  #$30, D0
05EABA: D168 0008                  add.w   D0, ($8,A0)
05EABE: 0668 001C 000C             addi.w  #$1c, ($c,A0)
05EAC4: 4E75                       rts
05EAC6: 536E 00B2                  subq.w  #1, ($b2,A6)
05EACA: 6700 0008                  beq     $5ead4
05EACE: 4EF9 0000 121E             jmp     $121e.l
05EAD4: 0C6E 0001 0026             cmpi.w  #$1, ($26,A6)
05EADA: 6700 0030                  beq     $5eb0c
05EADE: 4EB9 0000 483C             jsr     $483c.l
05EAE4: 6500 0026                  bcs     $5eb0c
05EAE8: 117C 0001 0000             move.b  #$1, ($0,A0)
05EAEE: 317C 0008 0020             move.w  #$8, ($20,A0)
05EAF4: 317C 0200 0026             move.w  #$200, ($26,A0)
05EAFA: 316E 0008 0008             move.w  ($8,A6), ($8,A0)
05EB00: 316E 0010 0010             move.w  ($10,A6), ($10,A0)
05EB06: 316E 000C 000C             move.w  ($c,A6), ($c,A0)
05EB0C: 1D7C 0006 0004             move.b  #$6, ($4,A6)
05EB12: 4E75                       rts
05EB14: 536E 00B2                  subq.w  #1, ($b2,A6)
05EB18: 67F2                       beq     $5eb0c
05EB1A: 1D7C 0008 0022             move.b  #$8, ($22,A6)
05EB20: 4A2E 0024                  tst.b   ($24,A6)
05EB24: 6600 0008                  bne     $5eb2e
05EB28: 1D7C 0018 0022             move.b  #$18, ($22,A6)
05EB2E: 4EB9 0000 1862             jsr     $1862.l
05EB34: 4EF9 0000 121E             jmp     $121e.l
05EB3A: 536E 00B2                  subq.w  #1, ($b2,A6)
05EB3E: 67CC                       beq     $5eb0c
05EB40: 4EB9 0000 121E             jsr     $121e.l
05EB46: 65C4                       bcs     $5eb0c
05EB48: 4E75                       rts
05EB4A: 536E 00B2                  subq.w  #1, ($b2,A6)
05EB4E: 67BC                       beq     $5eb0c
05EB50: 202E 00B4                  move.l  ($b4,A6), D0
05EB54: D1AE 0008                  add.l   D0, ($8,A6)
05EB58: 302E 0008                  move.w  ($8,A6), D0
05EB5C: 906D 0744                  sub.w   ($744,A5), D0
05EB60: 0C40 0110                  cmpi.w  #$110, D0
05EB64: 6C00 000A                  bge     $5eb70
05EB68: 2D7C 0002 0000 00B4        move.l  #$20000, ($b4,A6)
05EB70: 0C40 0140                  cmpi.w  #$140, D0
05EB74: 6F00 000A                  ble     $5eb80
05EB78: 2D7C FFFE 0000 00B4        move.l  #$fffe0000, ($b4,A6)
05EB80: 202E 00B8                  move.l  ($b8,A6), D0
05EB84: D1AE 000C                  add.l   D0, ($c,A6)
05EB88: 4EB9 0000 121E             jsr     $121e.l
05EB8E: 6500 FF7C                  bcs     $5eb0c
05EB92: 4E75                       rts
05EB94: 4EB9 0000 121E             jsr     $121e.l
05EB9A: 6500 FF70                  bcs     $5eb0c
05EB9E: 4E75                       rts
05EBA0: 536E 00B2                  subq.w  #1, ($b2,A6)
05EBA4: 6600 0010                  bne     $5ebb6
05EBA8: 1D7C 0004 0004             move.b  #$4, ($4,A6)
05EBAE: 3D7C 0001 00B2             move.w  #$1, ($b2,A6)
05EBB4: 4E75                       rts
05EBB6: 206E 00BC                  movea.l ($bc,A6), A0
05EBBA: 3028 0010                  move.w  ($10,A0), D0
05EBBE: B06E 0010                  cmp.w   ($10,A6), D0
05EBC2: 6E00 000E                  bgt     $5ebd2
05EBC6: 04AE 0000 8000 0010        subi.l  #$8000, ($10,A6)
05EBCE: 6000 000A                  bra     $5ebda
05EBD2: 06AE 0000 8000 0010        addi.l  #$8000, ($10,A6)
05EBDA: 0C6E 0014 00B2             cmpi.w  #$14, ($b2,A6)
05EBE0: 6F00 000E                  ble     $5ebf0
05EBE4: 4EB9 0000 1862             jsr     $1862.l
05EBEA: 4EB9 0000 121E             jsr     $121e.l
05EBF0: 4EF9 0000 49CA             jmp     $49ca.l
05EBF6: 062E 0002 0004             addi.b  #$2, ($4,A6)
05EBFC: 3D7C 0078 00B2             move.w  #$78, ($b2,A6)
05EC02: 4E75                       rts
05EC04: 536E 00B2                  subq.w  #1, ($b2,A6)
05EC08: 6700 0016                  beq     $5ec20
05EC0C: 302E 00B2                  move.w  ($b2,A6), D0
05EC10: 0240 0001                  andi.w  #$1, D0
05EC14: 6600 0008                  bne     $5ec1e
05EC18: 4EF9 0000 49CA             jmp     $49ca.l
05EC1E: 4E75                       rts
05EC20: 4EF9 0000 48FC             jmp     $48fc.l
























