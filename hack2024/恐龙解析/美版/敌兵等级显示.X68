*-----------------------------------------------------------
* 名称       :恐龙快打敌人头顶显示数字血值
* 说明       :
* 制作       :
*-----------------------------------------------------------
	ORG	$149B0
	jmp	$1a0000
	nop
	org	$1a0000
	move.w	($67c0,A5),D7   //获取当前场景中的所有对象的数量，作为循环次数
	beq	_14a52
	subq.w	#1,D7
	movea.w	($67c2,A5),A6   //对象基址列表传A6
_return
	movea.w	(A6)+,A0     //基址搬入A0
	movea.w	(A6)+,A0
 *----------------------------------------------------------------------
 *D0=X坐标 D1=Y坐标 D2=砖块号 D3=色号
_ht
	cmpa.l	#$FFFFC8F4,A0  //过滤掉非敌人
	BLT	_nothisid  小于转移
	cmpi.w	#$0,($6c,A0)
	ble	_nothisid    //血值，小于等于0退出
	move.w	($8,A0),D0    //X
	sub.w	($69b6,A5),D0
	subq.w	#8,D0
	move.w	($0c,A0),D1
	add.w	($10,A0),D1    //Y
	sub.w	($69b8,A5),D1
	not.b	D1
	addq.w	#1,D1
	;subq.w	#8,D1     //Y坐标-8，字符位置在脚底
	move.w   #$4e25,D2
	moveq	#$3,D3    //色号，可以改变颜色
	movem.w	D0-D3,(A4)   //写入显存
	addq.l	#8,A4      //+8=下一个字符的显存位置
	addq.w	#$8,D0     //字符间距为8，因为字符的大小就是8X8像素
	move.w	#$4,D2 	
	add.w    #$4e00,D2
	movem.w	D0-D3,(A4)   //写入显
	addq.l	#8,A4      //+8=下一个字符的显存位置
_nothisid
	dbra	D7,_return    //循环
 
*循环结束后，接原版数据。补上并跳回
	tst.b	($4aa,A5)
	beq	_14a52
	jmp	$149B8
_14a52
	jmp	$14A52	   //跳回
	

   
   
   
   












*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
