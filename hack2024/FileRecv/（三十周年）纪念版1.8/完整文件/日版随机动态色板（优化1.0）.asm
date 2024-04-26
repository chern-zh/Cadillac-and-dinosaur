*_____________________________________________一直运行的指令，读取基址存在否处（插入动态强制色板）_______________________________________________
		org		$233e0
		jsr		_random_color
		;org		$57bca			*受伤老者
		;jsr		_lt
		;org		$58a3e			*被砍龙	jsr	$1b6c
		;jsr		_bkl
		;org		$60a42			*角龙崽崽
		;jsr		_mnkl
		;org		$617b0			*雷龙崽崽	jsr	$173c
		;jsr		_mnkl		
		;org		$5dcb6			*马甲摩托车		jsr	$173c
		
		
;_lt		
		;moveq	#$0,D0
		;move.b	($5,A6),D0
*_____________________________________________动态0D-1D载色(更改D3显色位,0E1E摩托)___________________________________________________________
	*===========================================【1】求DE\DF，并写入内存=============================================================
		org		$1E0000	
_random_color
		movem.l 	D0-D2/A0-A3,-(A7)		;入栈(目的借用寄存器)
		moveq		#$0,D0						
		moveq		#$0,D1
		
		cmpi.w		#$8,($20,A6)
		beq			_mj
		cmpi.w		#$c,($20,A6)
		beq			_lq
		cmpi.w		#$16C,($20,A6)		;寄生兽 tyrog2
		beq			_tyrog
		cmpi.w		#$14,($20,A6)			;屠夫
		beq			_tf
		cmpi.w		#$F4,($20,A6)			;屠夫
		beq			_tf
		cmpi.w		#$D0,($20,A6)			;屠夫刀x
		beq			_tf
		cmpi.w		#$18,($20,A6)			;狮子
		beq			_sz
		cmpi.w		#$28,($20,A6)			;胖子
		beq			_daobing
		cmpi.w		#$13C,($20,A6)			;打龙胖子
		beq			_daobing
		cmpi.w		#$34,($20,A6)			;步枪兵
		beq			_lr
		cmpi.w		#$38,($20,A6)			;匕首兵
		beq			_daobing
		cmpi.w		#$FC,($20,A6)			;匕首兵
		beq			_daobing
		cmpi.w		#$48,($20,A6)			;大个
		beq			_1B
		cmpi.w		#$50,($20,A6)			;猴子
		beq			_hz
		cmpi.w		#$100,($20,A6)			;扔雷猴子
		beq			_hz
		cmpi.w		#$134,($20,A6)			;扔雷猴子
		beq			_hz
		cmpi.w		#$60,($20,A6)			;暴龙
		beq			_KL
		cmpi.w		#$64,($20,A6)			;4b
		beq			_47b
		cmpi.w		#$11c,($20,A6)			;幻影
		beq			_47b
		cmpi.w		#$90,($20,A6)			;马云
		beq			_5B
		cmpi.w		#$A0,($20,A6)			;马云龙
		beq			_5BB
		cmpi.w		#$148,($20,A6)		;翼龙
		beq			_KL
		cmpi.w		#$150,($20,A6)			;大龙
		beq			_8B
		cmpi.w		#$118,($20,A6)			;大龙
		beq			_mt		
		cmpi.w		#$40,($20,A6)			;车子
		beq			_car
		cmpi.w		#$44,($20,A6)			;车轮
		beq			_car_root
		cmpi.w		#$58,($20,A6)			;巨脚
		beq			_jj
		cmpi.w		#$74,($20,A6)			;迅猛龙
		beq			_KL
		cmpi.w		#$7c,($20,A6)			;3B
		beq			_3b
		cmpi.w		#$80,($20,A6)			;摩托
		beq			_3mt
		cmpi.w		#$8C,($20,A6)			;马云
		beq			_5B
		cmpi.w		#$130,($20,A6)		;寄生兽（幼体）
		beq			_tyrog
		cmpi.w		#$120,($20,A6)		;寄生兽（尸体）
		beq			_tyrog
		cmpi.w		#$10,($20,A6)			;寄生兽（BOSS）
		beq			_tyrog		
		cmpi.w		#$178,($20,A6)			;宋小龙
		beq			_5BB
		cmpi.w		#$98,($20,A6)			;角龙
		beq			_KL
		cmpi.w		#$b4,($20,A6)			*受伤老者
		beq			_lt
		cmpi.w		#$cc,($20,A6)			*被砍龙
		beq			_bkl
		;cmpi.w		#$B0,($20,A6)			;迷你角龙
		;beq			_KL
		;cmpi.w		#$BC,($20,A6)			;迷你雷龙
		;beq			_KL
		cmpi.w		#$138,($20,A6)			;迷你角龙
		beq			_KL
		cmpi.w		#$140,($20,A6)			;迷你雷龙
		beq			_KL
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts




*==============================马甲=========================================				
_mj		
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_mj				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_mj
_apply_color_mj
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$6,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_mj1data(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_mj
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_mj1data
		dc.w		$0d0e,$3d0e,$3d0d			/马甲
		
*==============================刀兵、飞刀手、胖子、打睡龙13C=========================================				
_daobing		
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_db				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_db
_apply_color_db
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$12,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_bsdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_db
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_bsdata
		dc.w		$0100,$0203,$3c3e,$5b12,$1314,$1516,$7593,$9496,$9899		/匕首兵
		
*===========================猴子、扔雷猴=======================================		
_hz	
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_hz				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_hz
_apply_color_hz
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$13,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_hzdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_hz
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts		
_hzdata
		dc.w		$0100,$0203,$183e,$5b12,$1314,$1516,$7593,$9496,$9899,$1993		/猴子		
		
*===========================恐龙=======================================		
_KL		
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_kl				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_kl
_apply_color_kl
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$a,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_KLdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_kl
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts	
_KLdata
		dc.w		$2b2d,$2e2f,$3b9e,$2731,$3572			/恐龙
		
*===========================马云=======================================	
_5B
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_5B				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_5B
_apply_color_5B
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$e,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_5Bdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_5B
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts	
_5Bdata
		dc.w		$1d97,$1724,$2932,$7374,$7677,$4041,$42c0	/马云

*===========================铁头龙、178=======================================	
_5BB
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_5BB				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_5BB
_apply_color_5BB
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$e,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_5BBdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_5BB
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts	
_5BBdata
		dc.w		$1d25,$1724,$3229,$3638,$7374,$7677,$9717		*铁头龙、178

*===========================屠夫=======================================
_tf
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_tf				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_tf
_apply_color_tf
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$a,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_tfdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_tf
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_tfdata
		dc.w		$1d17,$2429,$3273,$7476,$7797			/屠夫
		
*===========================跳跳龙=======================================
_tyrog
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_tyrog				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_tyrog
_apply_color_tyrog
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$10,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_tyrogdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_tyrog
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_tyrogdata
		dc.w		$2a2b,$2d2e,$2f3b,$099e,$2772,$2831,$3571,$0996	/16C

*===========================狮子=======================================
_sz
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_sz				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_sz
_apply_color_sz
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$e,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_szdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_sz
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_szdata
		dc.w		$1d17,$2429,$3273,$7476,$7797,$2536,$3829			/狮子
		
*===========================3BOSS=======================================
_3b
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_3b				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_3b
_apply_color_3b
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$18,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_3bdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_3b
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_3bdata
		dc.w		$0100,$0203,$183e,$5b12,$1314,$1516,$7593,$9496,$9899,$1934,$953a,$3c01		*3BOSS肉身		

*===========================链球=======================================
_lq
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_lq				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_lq
_apply_color_lq
		move.b	#$1a,D1					;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_lq
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts

*===========================猎人=======================================
_lr
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_lr				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_lr
_apply_color_lr
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$16,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_lrdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_lr
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_lrdata
		dc.w		$0100,$0203,$3c3e,$5b12,$1314,$1516,$9593,$9496,$9899,$0f10,$1134		/步枪兵		

*===========================1BOSS=======================================
_1B
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_lB				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_lB
_apply_color_lB
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$a,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_lBdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_lB
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_lBdata
		dc.w		$1b1c,$1f9b,$9c9f,$4041,$429c			/大个子

*===========================大龙=======================================
_8B
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_8B				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_8B
_apply_color_8B
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$12,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_8Bdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_8B
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_8Bdata
		dc.w		$1e2a,$2b2d,$2e2f,$3b08,$099e,$2731,$3571,$7278,$78c0	*大龙

*===========================幻影=======================================
_47b
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_47b				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_47b
_apply_color_47b
		moveq	#$0,D0						;D0.b用来做随机数
		jsr     $119c					;随机程序
		divu.w	#$10,D0					;求余, 即限制范围( )
		swap	D0		    			;余数在高12位，交叉下
		move.b	_47bdata(PC,D0),D1		;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_47b
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
_47bdata
		dc.w		$153a,$3e11,$1213,$1416,$1921,$2293,$99a2,$9496		/幻影

*===========================被砍龙=======================================
_bkl
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_bkl				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_bkl
_apply_color_bkl
		move.b	#$36,D1					;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_bkl
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts

*===========================巨脚=======================================
_jj
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_jj				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_jj
_apply_color_jj
		move.b	#$30,D1					;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_jj
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts

*===========================受伤老者=======================================
_lt
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_lt				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_lt
_apply_color_lt
		move.b	#$27,D1					;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_lt
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts

*===========================凯迪拉克=======================================
_car
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_car				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_car
_apply_color_car
		move.b	#$27,D1					;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_car
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts

*===========================凯迪拉克-车轮=======================================
_car_root
		tst.b	($de,A6)					/是否申请了显色位
		beq		_apply_color_car_root				*没有，则优先申请色板号（）
		move.b	($de,A6),D0
		move.b	($df,A6),D1
		jsr		_write
		bra		_all_over_car_root
_apply_color_car_root
		move.b	#$25,D1					;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		jsr    	_sxgy		
_all_over_car_root
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts

*================================================================================================
_sxgy	
		moveq	#$0,D0
		movea.l	#$FFFFDDF4,A3			*//A3置为DDF4（第0个）
_next
		suba.l	#$E0,A3					;偏移到下一个敌人基址
		cmpa.l	#$FFFFC8f4,A3			;是否小于C8F4
		blt     _apply_cp_db					*'小于C8F4，说明无人共用色板号'开始申请显色位		
		cmpa.l	A3,A6					;是否是此人地址
		beq		_next					//是，下一个敌人		
		move.b	($df,A3),D0				;色板号2给D1
		beq		_next					*D1为0就别检测了，下一个
		cmp.w	D0,D1					;检测是否跟某色板号是否相同
		bne		_next					*不同，下一个
*----------------------------------找到相同-------------------------------------
		move.b	($de,A3),($de,A6)		*找到一致的色板号，与之共用显存位
		move.b	($de,A3),($23,A6)		*找到一致的色板号，与之共用显存位
		move.b	($de,A6),D0				*显存位放在D0，色板号放在D1	
_write
		move.b	D0,($23,A6)
		andi.b		#$1f,D0						;压缩到20内
		mulu.w 		#$20,D0					;转换成显存相关
		moveA.l 	#$914000,A1				;显色存基址
		add.w		D0,A1					;转换成显存相关
		andi.w		#$ff,D1						;去掉低34位
		mulu.w  	#$20,D1						;取得色板号X20
		movea.l  	#$b60bc,A2					;色板数据基址(第一个是白人是色板)
		add.l		D1,A2						;得出此敌人色板数据
		moveq		#$0,D2
		move.b		#$f,D2								;2行（双字节16组）搬运20次
_A1_A2_loop_all
		dbra		D2,_A1_A2_goon_all					;循环20次
		bra			_dtsb_over						;搬运完成收工退出
_A1_A2_goon_all
		move.w		(A2)+,(A1)							;搬运色板数据到显色
		or.w		#$f000,(A1)+						;低4位加上F
		bra			_A1_A2_loop_all						;继续下一组
_dtsb_over
		rts

*------------------------------申请显色位（8f-9f ）-------------------------------------
_apply_cp_db
		move.b	#$8f,D0						;初始显存位，强制色板8f开始
_xsw_jc_ks
		movea.l	#$FFFFDD14,A3				;载入敌人起始基址
_jzjc_next
		cmpa.l	#$FFFFC8f4,A3				;是否小于FFFFC8f4
		bLT		_jcd_ok						;小于FFFFC8f4，说明场上敌人没人用此显色位，同意使用
		cmp.B	($de,A3),D0					;某敌人是否使用D0(某显色位)
		beq		_jcd_j						;此显色位已被使用，得换色位重新检测
		suba.l	#$E0,A3						;基址偏移-E0
		bra		_jzjc_next					;检测下一个敌人基址

_jcd_j
		addq	#1,D0						;已被使用D0+1检测重新检测
_jcd_j_9e
		cmpi.b	#$9e,D0						;是否摩托色位
		beq		_jcd_j						;
_jcd_j_9c
		cmpi.b	#$9c,D0						;是否9c，9c是水里占用
		beq		_jcd_sfSL					;是检测是否水里
_jc_sw_jx
		cmpi.b	#$9f,D0						;超过9f还是退出吧
		bgt		_must_8D
		bra		_xsw_jc_ks					;重新开始检测 DD14~C8f4
_must_8D
		move.b	#$8D,D0						*显色位已满，强制使用通用显色位8D，强制色板33，通用黑色
		move.b	#$33,D1
		move.b	D1,($df,A6)
		move.b	D0,($de,A6)					;写入色板位
		move.b	D0,($23,A6)					;写入强制色板
		bra		_write
	;===========================================================================================
_jcd_sfSL
        cmpi.b  #1,($4d9,A5)            		;检测是否2关
		beq     _jc_cj26
        cmpi.b  #5,($4d9,A5)            		;检测是否6关
		beq     _jc_cj26
		bra		_jc_sw_jx					;继续
		;---------------------------------------------------
_jc_cj26
		cmpi.b  #1,($786,A5)					;是否2场景
		bne     _jc_sw_jx					;否继续
		addq	#1,D0						;都是D0加1，绕过
		bra		_jc_sw_jx					;继续
	*===========================↓↓↓===申请到色位，并写入===↓↓↓===============================
_jcd_ok
		move.b	D0,($de,A6)					;写入色板位
		move.b	D0,($23,A6)					;写入强制色板
		bra		_write

*=========================================3BOSS摩托=================================================================
_3mt
		clr.w	($de,A6)
		clr.b	($23,A6)
		move.l	#$F111F333,$914000+$20*$1E					;摩托1E
		move.l	#$F555F777,$914000+$20*$1E+$4
		move.l	#$F999FBBB,$914000+$20*$1E+$8
		move.l	#$FDDDFFFF,$914000+$20*$1E+$c
		move.l	#$FFEAFFD2,$914000+$20*$1E+$10
		move.l	#$FF93FE22,$914000+$20*$1E+$14
		move.l	#$FC06F908,$914000+$20*$1E+$18
		move.l	#$F607FA80,$914000+$20*$1E+$1c
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts
		
		
*==========================================摩托车===================================================
_mt

		tst.b	($Df,A6)					*色板号
		beq		_mtbqs
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts

		
_mtbqs
		move.l	#$F111F333,$914000+$20*$1E					;摩托1E
		move.l	#$F555F777,$914000+$20*$1E+$4
		move.l	#$F999FBBB,$914000+$20*$1E+$8
		move.l	#$FDDDFFFF,$914000+$20*$1E+$c
		move.l	#$FFEAFFD2,$914000+$20*$1E+$10
		move.l	#$FF93FE22,$914000+$20*$1E+$14
		move.l	#$FC06F908,$914000+$20*$1E+$18
		move.l	#$F607FA80,$914000+$20*$1E+$1c

		moveq	#$0,D2
		jsr     $119c						;随机程序
		divu.w	#$6,D0					;求余, 即限制范围( )
		swap	D0		    				;余数在高12位，交叉下
		move.b	_mjdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($Df,A6)				;色板号也写入敌人内存中
		bra		_bysb
_mjdata
		dc.w		$0d0e,$3d0e,$3d0d			/马甲
_bysb
		movea.l #$9141C0,A1				;显色存基址	E
		andi.w	#$ff,D1						;去掉低34位
		mulu.w  #$20,D1						;取得色板号X20
		movea.l  #$b60bc,A2					;色板数据基址(第一个是白人是色板)
		add.l	D1,A2						;得出此敌人色板数据
		move.b		#$f,D2								;2行（双字节16组）搬运20次
_A1_A2_loop_alll
		dbra		D2,_A1_A2_goon_alll					;循环20次
		bra			_dtsb_o						;搬运完成收工退出
_A1_A2_goon_alll
		move.w		(A2)+,(A1)							;搬运色板数据到显色
		or.w		#$f000,(A1)+						;低4位加上F
		bra			_A1_A2_loop_alll					;继续下一组
_dtsb_o
		movem.l	(A7)+,D0-D2/A0-A3				;收工
		moveq	#$0,D0
		move.w	($20,A6),D0
		rts


*===========================================小兵死后一些内存数据清零===========================================
		org		$1ad0				;小兵死后一些内存数据清零
		nop
		jsr		$1fe000
		org		$1fe000
		move.b  D0, ($87,A6)		;其他的
		move.b  D0, ($96,A6)		;其他的
		clr.w    ($De,A6) 			;色板号位
		rts


*===========================================NOP掉一些自带的强制色板===========================================
		org		$68c8c				;tyrog2
		dc.w		$4e71,$4e71,$4e71
		org		$68c9c				;tyrog2
		dc.w		$4e71,$4e71,$4e71
		org		$68cb2				;tyrog2
		dc.w		$4e71,$4e71,$4e71


		;-----------------------------------0d以下不用强制色板------------------------------------------
		org		$014448
		nop
		jmp		$1fe020
		org		$1fe020
		move.w  (A1)+, D2			;把A1提前，反正都得走这一步
		move.w  (A1)+, D3			;因为要提前判断D3是否小于D
		cmpi.w	#$64,($20,A0)
		beq		_014448JX
		cmpi.b	#$d,D3				;是否小于D
		blt	_014404				;小于D不用强制色板
_014448JX
		move.b  ($23,A0),D0
_014450
		JMP	$014450				;继续
_014404
		JMP		$014404				;跳到非强制
















