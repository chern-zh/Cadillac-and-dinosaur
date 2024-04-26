07BEDC: 4EB9 0000 4860             jsr     $4860.l
07BEE2: 6510                       bcs     $7bef4
07BEE4: 117C 0001 0000             move.b  #$1, ($0,A0)
07BEEA: 317C 0058 0020             move.w  #$58, ($20,A0)
07BEF0: 214E 00AA                  move.l  A6, ($aa,A0)
07BEF4: 4E75                       rts

07BEF6: 102E 0004                  move.b  ($4,A6), D0
07BEFA: 303B 0006                  move.w  ($6,PC,D0.w), D0
07BEFE: 4EFB 0002                  jmp     ($2,PC,D0.w)
07BF02: 0008                       dc.w    $0008; ILLEGAL
07BF04: 0074 01CC 01DC             ori.w   #$1cc, INVALID 34
07BF0A: 7000                       moveq   #$0, D0
07BF0C: 102D 04D9                  move.b  ($4d9,A5), D0		*关卡
07BF10: D040                       add.w   D0, D0
07BF12: D040                       add.w   D0, D0
07BF14: 207B 0020                  movea.l ($20,PC,D0.w), A0		*两种模式派兵
07BF18: 227B 003C                  movea.l ($3c,PC,D0.w), A1		*两种模式派兵
07BF1C: 2D48 00A0                  move.l  A0, ($a0,A6)
07BF20: 2D49 00A4                  move.l  A1, ($a4,A6)
07BF24: 426E 00A8                  clr.w   ($a8,A6)
07BF28: 422E 00AE                  clr.b   ($ae,A6)
07BF2C: 426E 0080                  clr.w   ($80,A6)
07BF30: 542E 0004                  addq.b  #2, ($4,A6)
07BF34: 4E75                       rts
	$B2144,B24A6,B2AF4,B2FD2,B450A,B4FD2,B596A,B60A6
	$B21A4,B24B6,B2B04,B3272,B451A,B4FE2,B597A,B64C6

07BF76: 206E 00AA                  movea.l ($aa,A6), A0		*BOSS
07BF7A: 0C28 FFFF 007D             cmpi.b  #-$1, ($7d,A0)	*是否过关boss，像马云，前两阶6BOSS都不是FF
07BF80: 6608                       bne     $7bf8a
07BF82: 4A68 006C                  tst.w   ($6c,A0)
07BF86: 6700 0146                  beq     $7c0ce
07BF8A: 6100 0008                  bsr     $7bf94
07BF8E: 6000 0062                  bra     $7bff2
07BF92: 4E75                       rts
07BF94: 4A2D 0518                  tst.b   ($518,A5)		*3关开凯迪拉克时会置1，下车后置零派兵
07BF98: 6652                       bne     $7bfec
07BF9A: 302E 00A8                  move.w  ($a8,A6), D0
07BF9E: 6B00 004C                  bmi     $7bfec			*9FFF走此
07BFA2: 6706                       beq     $7bfaa
07BFA4: 536E 00A8                  subq.w  #1, ($a8,A6)		*按时间派兵队列的小兵头前时间
07BFA8: 4E75                       rts
07BFAA: 246E 00A0                  movea.l ($a0,A6), A2		*按时间派兵队列
07BFAE: 3012                       move.w  (A2), D0
07BFB0: 6B3A                       bmi     $7bfec
07BFB2: 3D40 00A8                  move.w  D0, ($a8,A6)
07BFB6: 7000                       moveq   #$0, D0
07BFB8: 102D 04EF                  move.b  ($4ef,A5), D0	*玩家个数
07BFBC: 103B 0030                  move.b  ($30,PC,D0.w), D0		*$7BFEE，对应4，5，6个
07BFC0: B02D 04F3                  cmp.b   ($4f3,A5), D0
07BFC4: 6F16                       ble     $7bfdc
07BFC6: 0C2D 0002 04D9             cmpi.b  #$2, ($4d9,A5)
07BFCC: 6708                       beq     $7bfd6
07BFCE: 4EB9 0000 FDAE             jsr     $fdae.l
07BFD4: 6006                       bra     $7bfdc
07BFD6: 4EB9 0000 FE6A             jsr     $fe6a.l
07BFDC: 45EA 0010                  lea     ($10,A2), A2
07BFE0: 2D4A 00A0                  move.l  A2, ($a0,A6)
07BFE4: 3012                       move.w  (A2), D0
07BFE6: 3D40 00A8                  move.w  D0, ($a8,A6)
07BFEA: 60A8                       bra     $7bf94
07BFEC: 4E75                       rts
07BFEE: 0405 063C                  subi.b  #$3c, D5

07BFF2: 4A2D 0518                  tst.b   ($518,A5)
07BFF6: 6638                       bne     $7c030
07BFF8: 4A2E 00AE                  tst.b   ($ae,A6)
07BFFC: 6632                       bne     $7c030
07BFFE: 4A2D 0502                  tst.b   ($502,A5)		*等于0，等于1为BOSS召唤小兵，
07C002: 6F00 002C                  ble     $7c030

07C006: 302D 0000                  move.w  ($0,A5), D0
07C00A: 0240 0FFF                  andi.w  #$fff, D0
07C00E: 0C40 0115                  cmpi.w  #$115, D0		*此段指令每1000运行一次，检测游戏开启A5赋值代码是否正确，作用未知
07C012: 660E                       bne     $7c022
07C014: 4EB9 0002 9ADE             jsr     $29ade.l
07C01A: 6406                       bcc     $7c022
07C01C: 066D 0018 6600             addi.w  #$18, ($6600,A5)		*($6600,A5)所有内存地址队列的基址

07C022: 7000                       moveq   #$0, D0
07C024: 102E 0005                  move.b  ($5,A6), D0
07C028: 303B 0008                  move.w  ($8,PC,D0.w), D0
07C02C: 4EFB 0004                  jmp     ($4,PC,D0.w)			*跳到7C036或7C084
07C030: 4E75                       rts
07C032: 0004 0052                  ori.b   #$52, D4
07C036: 302E 0080                  move.w  ($80,A6), D0
07C03A: 6700 0008                  beq     $7c044
07C03E: 536E 0080                  subq.w  #1, ($80,A6)			*按小兵个数派兵的小兵头前时间
07C042: 4E75                       rts

07C044: 7000                       moveq   #$0, D0
07C046: 102D 04F3                  move.b  ($4f3,A5), D0
07C04A: 206E 00A4                  movea.l ($a4,A6), A0
07C04E: 7200                       moveq   #$0, D1
07C050: 122D 04EF                  move.b  ($4ef,A5), D1
07C054: D241                       add.w   D1, D1
07C056: 3230 1000                  move.w  (A0,D1.w), D1
07C05A: B041                       cmp.w   D1, D0
07C05C: 6200 0016                  bhi     $7c074
07C060: 5C48                       addq.w  #6, A0
07C062: 2D48 00A4                  move.l  A0, ($a4,A6)
07C066: 3010                       move.w  (A0), D0
07C068: 6B00 000C                  bmi     $7c076
07C06C: 3D40 0080                  move.w  D0, ($80,A6)
07C070: 542E 0005                  addq.b  #2, ($5,A6)
07C074: 4E75                       rts
07C076: 1B7C FFFF 0502             move.b  #$ff, ($502,A5)
07C07C: 1D7C 0001 00AE             move.b  #$1, ($ae,A6)
07C082: 4E75                       rts
07C084: 536E 0080                  subq.w  #1, ($80,A6)
07C088: 6500 0004                  bcs     $7c08e
07C08C: 4E75                       rts
07C08E: 246E 00A4                  movea.l ($a4,A6), A2
07C092: 0C2D 0002 04D9             cmpi.b  #$2, ($4d9,A5)
07C098: 6708                       beq     $7c0a2
07C09A: 4EB9 0000 FDAE             jsr     $fdae.l
07C0A0: 6006                       bra     $7c0a8
07C0A2: 4EB9 0000 FE6A             jsr     $fe6a.l
07C0A8: 45EA 0010                  lea     ($10,A2), A2
07C0AC: 2D4A 00A4                  move.l  A2, ($a4,A6)
07C0B0: 3D52 0080                  move.w  (A2), ($80,A6)
07C0B4: 6ACE                       bpl     $7c084
07C0B6: 45EA 0010                  lea     ($10,A2), A2
07C0BA: 2D4A 00A4                  move.l  A2, ($a4,A6)
07C0BE: 3D7C 0003 0080             move.w  #$3, ($80,A6)
07C0C4: 422D 0502                  clr.b   ($502,A5)
07C0C8: 422E 0005                  clr.b   ($5,A6)
07C0CC: 4E75                       rts

07C0CE: 1D7C 0006 0004             move.b  #$6, ($4,A6)		*BOSS死亡后不动
07C0D4: 422D 07A9                  clr.b   ($7a9,A5)
07C0D8: 4EF9 0001 D95E             jmp     $1d95e.l
07C0DE: 4EF9 0000 4938             jmp     $4938.l
07C0E4: 102E 0004                  move.b  ($4,A6), D0
07C0E8: 323B 0006                  move.w  ($6,PC,D0.w), D1
07C0EC: 4EFB 1002                  jmp     ($2,PC,D1.w)
07C0F0: 0008                       dc.w    $0008; ILLEGAL
07C0F2: 0020 02FC                  ori.b   #$fc, -(A0)
07C0F6: 02FC                       dc.w    $02fc; ILLEGAL
07C0F8: 4E75                       rts