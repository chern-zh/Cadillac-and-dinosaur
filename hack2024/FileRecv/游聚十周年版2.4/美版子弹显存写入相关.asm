023B62: 48E7 00C0                  movem.l A0-A1, -(A7)
023B66: 226E 000A                  movea.l ($a,A6), A1
023B6A: 43E9 0200                  lea     ($200,A1), A1
023B6E: 43E9 005C                  lea     ($5c,A1), A1
023B72: 7200                       moveq   #$0, D1
023B74: 322D 8F58                  move.w  (-$70a8,A5), D1
023B78: D241                       add.w   D1, D1
023B7A: 323B 1054                  move.w  ($54,PC,D1.w), D1
023B7E: 7400                       moveq   #$0, D2
023B80: 362D 8F60                  move.w  (-$70a0,A5), D3	*存放子弹数量的内存$FF0F60
023B84: B641                       cmp.w   D1, D3
023B86: 6E00 0004                  bgt     $23b8c
023B8A: 7402                       moveq   #$2, D2
023B8C: 7000                       moveq   #$0, D0
023B8E: 322D 8F60                  move.w  (-$70a0,A5), D1
023B92: 103B 1048                  move.b  ($48,PC,D1.w), D0	*读表，十六进制换成十进制30变成48
023B96: 7201                       moveq   #$1, D1
023B98: E148                       lsl.w   #8, D0	*00000048变成00004800
023B9A: E988                       lsl.l   #4, D0	*00004800变成00048000
023B9C: 4840                       swap    D0		*80000004
023B9E: 0240 000F                  andi.w  #$f, D0
023BA2: 4A41                       tst.w   D1
023BA4: 6700 0014                  beq     $23bba
023BA8: 4A40                       tst.w   D0
023BAA: 6600 000E                  bne     $23bba
023BAE: 32BC 0020                  move.w  #$20, (A1)
023BB2: 3342 0002                  move.w  D2, ($2,A1)
023BB6: 6000 0008                  bra     $23bc0
023BBA: 3280                       move.w  D0, (A1)		*1P十位的显存地址90A270
023BBC: 3342 0002                  move.w  D2, ($2,A1)	*字体颜色
023BC0: 4840                       swap    D0
023BC2: 43E9 0080                  lea     ($80,A1), A1	*个位显存地址
023BC6: 51C9 FFD2                  dbra    D1, $23b9a	*回去处理个位
023BCA: 4CDF 0300                  movem.l (A7)+, A0-A1
023BCE: 4E75                       rts

*======================死命下来后给枪===========================================
	org		$18bc0	*检测是否续币
	nop
	nop
	nop
	nop
	jsr		$1046A0
	
	org		$1046A0
	jsr		$4818
	bcs		_nowq
	move.b	#$1,($0,A0)
	move.w  ($2,A6),($2,A0)
	move.w  #$0,($20,A0)
	move.w  D0,-(A7)
	moveq	#$0,D0
	jsr     $119c
	andi.w  #$3,D0
	add.w   D0,D0
	move.w  _wq(PC,D0.w),D0
	move.w  D0,($26,A0)
	move.w  (A7)+,D0
	move.w  ($8,A6),($8,A0)
	move.w  ($c,A6),($c,A0)
	move.w  ($10,A6),($10,A0)
	move.w  A6,($70,A0)
	move.w  A0,($b4,A6)
	move.w  A6,-(A7)
	move.w  A0,-(A7)
	lea     (A0),A6
	moveq   #$0,D0
	jsr     $24d44
	move.w  #$258,($a4,A6)
	move.b  #$8,($5,A6)
	movea.w (A7)+,A0
	movea.w (A7)+,A6
	move.w  ($a0,A0),($b6,A6)
_nowq
	rts
_wq
	dc.w	$0006,$0008,$000a,$000c
	
	
	
*7F30\7F32\7F34:非关底BOSS血量行数、关底BOSS血量行数、玩家回血上限
*7F20：关卡数，7F22：关卡数百位
*7F3C，3D，3E：1P、2P、3P手雷状态开关。7F3F：模式标志位
