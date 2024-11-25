00D8B4: 7002                       moveq   #$2, D0
00D8B6: 4EB9 0000 89E6             jsr     $89e6.l		*颜色
00D8BC: 4EB9 0000 892C             jsr     $892c.l		*亮度
00D8C2: 7000                       moveq   #$0, D0
00D8C4: 102D 04D9                  move.b  ($4d9,A5), D0
00D8C8: 6700 000C                  beq     $d8d6
00D8CC: D000                       add.b   D0, D0
00D8CE: 323B 0008                  move.w  ($8,PC,D0.w), D1
00D8D2: 4EFB 1004                  jmp     ($4,PC,D1.w)
00D8D6: 4E75                       rts


*2关
00D8E8: 7013                  	   moveq   #$13, D0
00D8EA: 4EB9 0000 A63C             jsr     $a63c.l
00D8F0: 3B7C 0000 07E8             move.w  #$0, ($7e8,A5)
00D8F6: 3B7C 0000 07E4             move.w  #$0, ($7e4,A5)
00D8FC: 41F9 0091 3884             lea     $913884.l, A0
00D902: 43F9 0000 D94E             lea     $d94e.l, A1
00D908: 45F9 0000 D966             lea     $d966.l, A2
00D90E: 7203                       moveq   #$3, D1
00D910: 7402                       moveq   #$2, D2
00D912: 4EB9 0009 8BAE             jsr     $98bae.l			*图像
00D918: 41F9 0000 E42A             lea     $e42a.l, A0
00D91E: 4EB9 0008 4F72             jsr     $84f72.l			*文字
00D924: 3B7C 012C 8E66             move.w  #$12c, (-$719a,A5)
00D92A: 6100 06A0                  bsr     $dfcc			*染色
00D92E: 4EB9 0000 119C             jsr     $119c.l
00D934: 0240 000F                  andi.w  #$f, D0
00D938: 6600 0012                  bne     $d94c
00D93C: 4EB9 0001 F18A             jsr     $1f18a.l			*指令拖延时间
00D942: 6400 0008                  bcc     $d94c
00D946: 4EB9 0009 7D78             jsr     $97d78.l
00D94C: 4E75                       rts

		org		$2b98a
		jsr		_dynamic_attack
		
_dynamic_attack
		tst.b	($7fbf,A5)			*是否D++
		beq		_no_dynamic_attack
		tst.b	($2,A2)				*是否1P
		bne		_no_dynamic_attack
		tst.b	($c6,A2)			*是否锁暴击
		beq		_no_dynamic_attack
		cmpi.w	#$16c,($20,A3)
		beq		_dynamic		
		cmpi.w	#$c,($20,A3)
		beq		_dynamic
		cmpi.w	#$8,($20,A3)
		beq		_dynamic
		cmpi.w	#$28,($20,A3)
		beq		_dynamic
		cmpi.w	#$34,($20,A3)
		beq		_dynamic
		cmpi.w	#$38,($20,A3)
		beq		_dynamic
		cmpi.w	#$50,($20,A3)
		beq		_dynamic
		cmpi.w	#$18,($20,A3)
		beq		_dynamic
		cmpi.w	#$60,($20,A3)
		beq		_dynamic
_no_dynamic_attack
		move.b  ($c6,A2),D0
		mulu.w  D0,D1
		rts
_dynamic
		move.b		#$40,D0
		mulu.w		D0,D1
		rts