*_____________________________________________一直运行的指令，读取基址存在否处（插入动态强制色板）_______________________________________________
		org		$23428
		jmp		$1e0000
		org		$1e0000
		jsr		_dtsb_q_x					*插入的"动态强制色板程序"
		tst.b    ($0,A6)					;读取敌人是否存在什么鬼的，别管
		BEQ		 _23436						;读取敌人是否存在什么鬼的，别管
		JMP		$2342E						;读取敌人是否存在什么鬼的，别管

_23436
		JMP		$23436						;读取敌人是否存在什么鬼的，别管

*_____________________________________________动态0D-1D载色(更改D3显色位,0E1E摩托)___________________________________________________________
	*===========================================【1】求D6\D7，并写入内存=============================================================
		org		$1e0100
_dtsb_q_x
		movem.l D0-d2/d4-D7/A0-A6,-(A7)		;入栈(目的借用寄存器)
		clr.l	D0							;使用前清除原值
		clr.l	D1							;使用前清除原值
		clr.l	D2							;使用前清除原值
		clr.l	D6							;使用前清除原值
		clr.l	D4							;使用前清除原值
		clr.l	D5			 				;使用前清除原值
		clr.l	D7			 				;使用前清除原值

		movea.l	A6,A0					;A0A6共用
		tst.b	$ff84e4					;没人玩则不用动态色板
		beq		_no_dr
_feishuili
		cmpa.l	#$FFFFDD14,A6			;过滤掉非敌人基址（己方、箱子、特效等）
		bGt		_no_dr					;超过范围跳出动态色板程序
		cmpa.l	#$FFFFC8f4,A6			;过滤掉非敌人基址（己方、箱子、特效等）
		blT		_no_dr					;超过范围跳出动态色板程序
		cmpi.w	#8,($20,A6)				;过滤非敌人ID
		blt		_no_dr					;小于8(马甲)则退出
	;---------------------------------过滤非敌人ID(不过滤会很卡)--------------------------------------
		cmpi.w	#$1C,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$20,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$24,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$3C,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$40,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$44,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$4C,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$5C,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$68,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$78,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$84,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$D4,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$E4,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$a8,($20,A6)			;3B的炸弹
		beq		_no_dr					;
		cmpi.w	#$ec,($20,A6)			;马云枪子弹
		beq		_no_dr					;
		cmpi.w	#$f0,($20,A6)			;匕首兵的匕首
		beq		_no_dr					;
		cmpi.w	#$104,($20,A6)			;滚桶
		beq		_no_dr					;
		cmpi.w	#$108,($20,A6)			;落石
		beq		_no_dr					;
		cmpi.w	#$10C,($20,A6)			;机枪
		beq		_no_dr_CLR_23			;
		cmpi.w	#$110,($20,A6)			;手雷
		beq		_no_dr					;
		cmpi.w	#$114,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$124,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$128,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$12c,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$154,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$158,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$15c,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$160,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$164,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$168,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$17c,($20,A6)			;大龙火球
		beq		_no_dr					;
		cmpi.w	#$180,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$184,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$188,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$18c,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$190,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$194,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$198,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$b8,($20,A6)			;2关开头飞鸟
		beq		_no_dr					;
		cmpi.w	#$194,($20,A6)			;
		beq		_no_dr					;
		cmpi.w	#$198,($20,A6)			;
		beq		_no_dr					;




		cmpi.w	#$118,($20,A6)			;蓝马甲骑兵
		beq		_jc_lmjmt				;查出使用8E\9E色板的OBJ并清除，再写入914000+$20*$E;914000+$20*$1E
		;cmpi.w	#$7C,($20,A6)			;3Boss
		;beq		_jc_l3BS				;查出使用97\9f色板的OBJ并清除，写入914000+$20*$17;914000+$20*$1f


*---------------------------------------显色位分配------------------------------------------------
	;---------------------------重刷色板---------------------------------
		move.b	($D6,A0),D1				;强制色板给D1
		beq		_jc_xsw					;0则申请显色位
		move.b	($D6,A0),($23,a0)		;锁定强制色板

		andi.b	#$1f,D1
		mulu.w	#$20,D1					;色板一组32个，所以乘20（16进制）
		moveA.l	#$914000,A1				;显色存基址
		add.w	D1,A1					;转换成显色地址相关
		bra		_xieru2					;跳到搬运色板的地方

		bra		_no_dr
	;=======================================蓝马甲摩托(清理被占用色位)=============================================
_jc_lmjmt
		move.b	#$8e,D0						;蓝马甲骑兵显色位
		move.b	#$9e,D1						;蓝马甲摩托显色位
_jc_lmjmt_ks
		movea.l	#$FFFFDD14,A3				;载入敌人起始基址
_jc_lmjmt_next
		cmpa.l	#$FFFFC8f4,A3				;是否小于FFFFC8f4
		bLT		_mjmt_xr_8e_9e				;结束，写入色板到8E9E【必走】
		cmp.B	($d6,A3),D0					;某敌人是否使用D0(某显色位)
		beq		_jc_lmjmt_qld6				;被占用清除
_jc_lmjmt_d1
		cmp.B	($d6,A3),D1					;某敌人是否使用D0(某显色位)
		beq		_jc_lmjmt_qld61				;被占用清除
_jc_lmjmt_nw
		suba.l	#$E0,A3						;基址偏移-E0
		bra		_jc_lmjmt_next				;检测下一个敌人基址
	;---------------------------------------清理被占用d6值--------------------------------------------
_jc_lmjmt_qld6
		clr.b	($d6,A3)					;清理掉
		bra		_jc_lmjmt_d1
_jc_lmjmt_qld61
		clr.b	($d6,A3)					;清理掉
		bra		_jc_lmjmt_nw

	;=======================================3BOSS摩托(清理被占用色位)=============================================
_jc_l3BS
		move.b	#$9e,D1						;3BOSS摩托佬显色位
_jc_l3BS_ks
		movea.l	#$FFFFDD14,A3				;载入敌人起始基址
_jc_l3BS_next
		cmpa.l	#$FFFFC8f4,A3				;是否小于FFFFC8f4
		bLT		_3boss_xr_97_9F				;结束，写入色板到979F【必走】
_jc_l3BS_d1
		cmp.B	($d6,A3),D1					;某敌人是否使用D0(某显色位)
		beq		_jc_l3BS_qld61				;被占用清除
_jc_l3BS_nw
		suba.l	#$E0,A3						;基址偏移-E0
		bra		_jc_l3BS_next				;检测下一个敌人基址
	;---------------------------------------清理被占用d6值--------------------------------------------
_jc_l3BS_qld61
		clr.b	($d6,A3)					;清理掉
		bra		_jc_l3BS_nw


	;---------------------------不符合条件/退出---------------------------------;
_no_dr_CLR_23
		CLR.B	($23,a0)
_no_dr
		movem.l (A7)+,D0-d2/d4-D7/A0-A6		;出栈(程序结束，返还寄存器原值)
		RTS

	*------------------------------申请显色位（8d-9f ）-------------------------------------
_jc_xsw
		move.b	#$8d,D0						;初始显存位，强制色板8d开始

_xsw_jc_ks
		movea.l	#$FFFFDD14,A3				;载入敌人起始基址
_jzjc_next
		cmpa.l	#$FFFFC8f4,A3				;是否小于FFFFC8f4
		bLT		_jcd_ok						;小于FFFFC8f4，说明场上敌人没人用此显色位，同意使用
		cmp.b	($d6,A3),D0					;某敌人是否使用D0(某显色位)
		beq		_jcd_j						;此显色位已被使用，得换色位重新检测
		suba.l	#$E0,A3						;基址偏移-E0
		bra		_jzjc_next					;检测下一个敌人基址

	*==========================================================
_jcd_j
		addq		#1,D0						;已被使用D0+1检测重新检测
		cmpi.b	#$8e,D0						;是否摩托骑兵色位
		bEQ		_jcl_mtqb					;
_jcd_j_9e
		cmpi.b	#$9e,D0						;是否摩托骑兵的摩托色位
		bEQ		_jcl_mtqbb					;
_jcd_j_9f
		cmpi.b	#$9f,D0						;是否摩托骑兵的摩托色位
		bEQ		_jcl_mtqbbb					;
_jcd_j_9c
		cmpi.b	#$9c,D0						;是否9c，9c是水里占用
		bEQ		_jcd_sfSL					;是检测是否水里
_jc_sw_jx
		cmpi.b	#$9f,D0						;超过9f还是退出吧
		bgt		_no_dr
		bra		_xsw_jc_ks					;重新开始检测 DD14~C8f4
	;==========================检测场上有118骑兵否================================
_jcl_mtqb
		movea.l	#$FFFFDD14,A4				;载入敌人起始基址
_jcl_mtqb1
		cmpa.l	#$FFFFC8f4,A4				;是否小于FFFFC8f4
		bLT		_jcd_j_9e					;小于FFFFC8f4，说明场上敌人没有骑兵
		cmp.w	#$118,($20,A4)				;某敌人是骑兵
		beq		_jcd_j						;色位+1
		suba.l	#$E0,A4						;基址偏移-E0
		bra		_jcl_mtqb1					;检测下一个敌人基址
	;==========================检测场上有118骑兵否2================================
_jcl_mtqbb
		movea.l	#$FFFFDD14,A4				;载入敌人起始基址
_jcl_mtqbb1
		cmpa.l	#$FFFFC8f4,A4				;是否小于FFFFC8f4
		bLT		_jcd_j_9f					;小于FFFFC8f4，说明场上敌人没人用此显色位，同意使用
		cmp.w	#$118,($20,A4)				;某敌人是骑兵
		beq		_jcd_j						;此显色位已被使用，得换色位重新检测
		suba.l	#$E0,A4						;基址偏移-E0
		bra		_jcl_mtqbb1					;检测下一个敌人基址
	;==========================检测场上有7C骑兵否3================================
_jcl_mtqbbb
		movea.l	#$FFFFDD14,A4				;载入敌人起始基址
_jcl_mtqbbb1
		cmpa.l	#$FFFFC8f4,A4				;是否小于FFFFC8f4
		bLT		_jcd_j_9c					;小于FFFFC8f4，说明场上敌人没人用此显色位，同意使用
		cmp.w	#$7C,($20,A4)				;某敌人是骑兵
		beq		_jcd_j						;此显色位已被使用，得换色位重新检测
		suba.l	#$E0,A4						;基址偏移-E0
		bra		_jcl_mtqbbb1				;检测下一个敌人基址


	;===========================================================================================
_jcd_sfSL
        cmpi.b  	#1,$FF84D9            		;检测是否2关
		beq     	_jc_cj26
        cmpi.b  	#5,$FF84D9            		;检测是否6关
		beq     	_jc_cj26
		bra		_jc_sw_jx					;继续
		;---------------------------------------------------
_jc_cj26
		cmpi.b  #1,$FF8786					;是否2场景
		bne     _jc_sw_jx					;否继续
		addq		#1,D0						;都是D0加1，绕过
		bra		_jc_sw_jx					;继续
	*===========================↓↓↓===申请到色位，并写入===↓↓↓===============================
_jcd_ok
		move.b	D0,($d6,A0)					;写入色板位
		move.b	D0,($23,A0)					;写入强制色板
		andi.b	#$1f,D0						;压缩到20内

*---------------------------------------写入色板数据------------------------------------------------
_xieru
		mulu.w 		#$20,D0					;转换成显存相关
		moveA.l 		#$914000,A1				;显色存基址
		add.w		D0,A1					;转换成显存相关
		clr.l		D1						;D1被用来干其他事情了
		bra			_id_qusebanhao			;根据ID取得色板号，写入显色
_sbgl
		bra			_xsgy					;场上是否有相同色板号，有则共用，不新增
	*--------------------------正式搬运色板数据-----------------------------
_xieru2
		move.b	($d7,a6),D1					;色板号在D1
		andi.w	#$ff,D1						;去掉低34位
		mulu.w  	#$20,D1						;取得色板号X20
		movea.l  #$b8172,A2					;色板数据基址(第一个是白人是色板)
		add.l	D1,A2						;得出此敌人色板数据


	*--------------------------正式搬运色板数据-----------------------------
		clr.l		D2
		move.b		#$f,D2								;2行（双字节16组）搬运20次
_A1_A2_loop_all
		dbra			D2,_A1_A2_goon_all					;循环20次
		bra			_A2A0Js_lb_all						;搬运完成收工退出
_A1_A2_goon_all
		move.w		(A2)+,(A1)							;搬运色板数据到显色
		or.w			#$f000,(A1)+						;低4位加上F
		bra			_A1_A2_loop_all						;继续下一组
_A2A0Js_lb_all
		; cmpi.w		#$150,($20,A0)						;是否大龙主体
		; beq			_D6_D3								;是则D3的值不变（大龙插入动态色板不在砖块搬运处）
_dtsb_over
		movem.l		(A7)+,D0-d2/d4-D7/A0-A6				;全部16组搬完，出栈收工
		rts



	*--------------------------根据ID分配色板-----------------------------------
_id_qusebanhao
		cmpi.w		#$8,($20,A0)			;马甲
		beq			_sehao_mj
		cmpi.w		#$6c,($20,A0)	    		;马甲
		beq			_sehao_mj_6c
		cmpi.w		#$dc,($20,A0)			;马甲
		beq			_sehao_mj
		cmpi.w		#$c4,($20,A0)			;1关天台翼龙
		beq			_sehao_KL
		cmpi.w		#$c8,($20,A0)			;1关天台翼龙
		beq			_sehao_KL


		cmpi.w		#$c,($20,A0)			;链锤
		beq			_sehao_lc
		cmpi.w		#$130,($20,A0)		;寄生兽（幼体）
		beq			_sehao_tyrog		
		cmpi.w		#$120,($20,A0)		;寄生兽（尸体）
		beq			_sehao_tyrog
		cmpi.w		#$10,($20,A0)			;寄生兽（BOSS）
		beq			_sehao_tyrog
		cmpi.w		#$16C,($20,A0)		;寄生兽（小兵）
		beq			_sehao_tyrog

		cmpi.w		#$14,($20,A0)			;屠夫
		beq			_sehao_tf
		cmpi.w		#$F4,($20,A0)			;屠夫
		beq			_sehao_tf
		cmpi.w		#$D0,($20,A0)			;屠夫刀x
		beq			_sehao_tf

		cmpi.w		#$18,($20,A0)			;狮子
		beq			_sehao_sz

		cmpi.w		#$28,($20,A0)			;胖子
		beq			_sehao_pz
		cmpi.L		#$6c008D,($20,A0)		;4关滴汗胖子
		beq			_sehao_pz
		cmpi.w		#$13C,($20,A0)		;打龙胖子
		beq			_sehao_pz

		cmpi.w		#$2c,($20,A0)			;开场动画步枪兵（可无视）
		beq			_sehao_bq
		cmpi.w		#$34,($20,A0)			;步枪兵
		beq			_sehao_bq

		cmpi.w		#$38,($20,A0)			;匕首兵
		beq			_sehao_bs
		cmpi.w		#$FC,($20,A0)			;匕首兵
		beq			_sehao_bs

		cmpi.w		#$40,($20,A0)			;车子
		beq			_sehao_cz

		cmpi.w		#$44,($20,A0)			;车轮
		beq			_sehao_cl



		cmpi.w		#$48,($20,A0)			;大个
		beq			_sehao_dg
		cmpi.w		#$D8,($20,A0)			;大个(1关开场)
		beq			_sehao_dg

		cmpi.w		#$50,($20,A0)			;猴子
		beq			_sehao_hz
		cmpi.w		#$100,($20,A0)			;扔雷猴子
		beq			_sehao_hz
		cmpi.w		#$134,($20,A0)			;扔雷猴子
		beq			_sehao_hz

		cmpi.w		#$58,($20,A0)			;巨脚
		beq			_sehao_jj

		cmpi.w		#$60,($20,A0)			;暴龙
		beq			_sehao_KL

		cmpi.w		#$64,($20,A0)			;4b
		beq			_sehao_4b
		cmpi.w		#$ac,($20,A0)			;4b
		beq			_sehao_4b
		cmpi.w		#$11c,($20,A0)			;幻影
		beq			_sehao_4b

		cmpi.w		#$74,($20,A0)			;异龙锁
		beq			_sehao_KL

		cmpi.w		#$7c,($20,A0)			;3B
		beq			_sehao_3b
		cmpi.w		#$80,($20,A0)			;摩托
		beq			_sehao_mt

		cmpi.w		#$8C,($20,A0)			;马云+老头
		beq			_sehao_my
		cmpi.w		#$90,($20,A0)			;马云
		beq			_sehao_my

		cmpi.w		#$A0,($20,A0)			;马云龙
		beq			_sehao_MYL
		cmpi.w		#$178,($20,A0)			;宋小龙
		beq			_sehao_MYL

		cmpi.w		#$94,($20,A0)			;飞龙
		beq			_sehao_KL
		cmpi.w		#$148,($20,A0)			;飞龙（会打人）
		beq			_sehao_KL

		cmpi.w		#$98,($20,A0)			;角龙
		beq			_sehao_KL
		cmpi.w		#$B0,($20,A0)			;迷你角龙
		beq			_sehao_KL
		cmpi.w		#$BC,($20,A0)			;迷你雷龙
		beq			_sehao_KL
		cmpi.w		#$138,($20,A0)			;迷你角龙
		beq			_sehao_KL
		cmpi.w		#$140,($20,A0)			;迷你雷龙
		beq			_sehao_KL

		cmpi.w		#$9c,($20,A0)			;宋小宝
		beq			_sehao_sxb

		cmpi.w		#$b4,($20,A0)			;老头
		beq			_sehao_lt

		cmpi.w		#$cc,($20,A0)			;被砍龙
		beq			_sehao_bkl

		cmpi.w		#$150,($20,A0)			;大龙
		beq			_sehao_dl
_nossid
		clr.w		($d6,A0)				;清除d6,A0
		bra			_no_dr					;都不是跳出()
		;----------------------------------------------------
_sehao_mj_6c
		cmpi.b		#$04,($26,a0)
		beq			_sehao_pz				;ID 6C，子类为4是胖子，非4是马甲
		bra			_sehao_mj


		;-----------------------------------按ID分配色板号---------------------------------------------
;-----------------------------------按ID分配色板号---------------------------------------------
_sehao_mj
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$6,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_mjdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_mjdata
		dc.w		$0d0e,$3d0e,$3d0d

_sehao_KL
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$a,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_KLdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_KLdata
		dc.w		$2b2d,$2e2f,$3b9e,$2731,$3572


_sehao_lc

		move.b	#$1a,D1		                    ;取色
		move.b	D1,($D7,A0)						;色板号也写入敌人内存中
		bra    _sbgl


_sehao_tyrog
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$20,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_tyrogdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_tyrogdata
		dc.w		$0102,$2a2b,$2d2e,$2f03,$3b05,$099b,$9e22,$2327
		dc.w		$2831,$3571,$7279,$9394,$9698,$999e,$7209,$359e

_sehao_tf
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$a,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_tfdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_tfdata
		dc.w		$1d17,$2429,$3273,$7476,$7797

_sehao_sz
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$e,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_szdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_szdata
		dc.w		$1d17,$2429,$3273,$7476,$7797,$2536,$3829



_sehao_pz
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$20,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_pzdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_pzdata
		dc.w		$0100,$0203,$3c3e,$5b12,$1314,$1516,$7593,$9496
		dc.w		$9899,$0102,$7500,$1416,$9993,$9896,$943e,$0315

_sehao_bq
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$20,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_bqdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_bqdata
		dc.w		$0100,$0203,$3c3e,$5b12,$1314,$1516,$9593,$9496
		dc.w		$9899,$0f10,$1134,$9498,$0102,$3c00,$9303,$1213

_sehao_bs
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$20,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_bsdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_bsdata
		dc.w		$0100,$0203,$3c3e,$5b12,$1314,$1516,$7593,$9496
		dc.w		$9899,$0100,$9394,$9698,$9902,$0375,$1213,$143c


_sehao_cz
		
         move.b  #$27,D1                      ;选择色板，蓝
		move.b	D1,($d7,A0)					;色板号也写入敌人内存中
		bra    _sbgl


_sehao_cl

		move.b	#$25,D1	                ;取色
		move.b	D1,($d7,A0)					;色板号也写入敌人内存中
		bra    _sbgl


_sehao_dg
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$a,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_dgdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_dgdata
		dc.w		$1b1c,$1f9b,$9c9f,$4041,$429c





_sehao_hz
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$20,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_hzdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_hzdata
		dc.w		$0100,$0203,$183e,$5b12,$1314,$1516,$7593,$9496
		dc.w		$9899,$1901,$1612,$7593,$9496,$9899,$3e00,$0203

_sehao_jj

		move.b	#$30,D1	                        ;取色
		move.b	D1,($d7,A0)					;色板号也写入敌人内存中
		bra    _sbgl


_sehao_4b	
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$10,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_4Bdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_4Bdata
		dc.w		$2c3a,$3e11,$1213,$1416,$1921,$2293,$99a2,$9496


_sehao_3b		;3BOSS
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$18,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_3bdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_3bdata
		dc.w		$0100,$0203,$183e,$5b12,$1314,$1516,$7593,$9496
		dc.w		$9899,$1934,$953a,$3c01


_sehao_mt		;摩托
		clr.l	D0						;D0.b用来做随机数
		jsr     	$119c						;随机程序
		divu.w	#$8,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_mtdata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    	_sbgl		
		
_mtdata
		dc.w		$3572,$0828,$2a2d,$2e35


_sehao_my		;马云
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$20,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_mydata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_mydata
		dc.w		$1d1b,$1c1e,$1f2a,$2e2f,$9b9c,$9d9f,$1724,$2829
		dc.w		$3240,$4142,$7374,$7677,$7997,$c041,$1f40,$2474

_sehao_myl		;马云龙
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$10,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_myldata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_myldata
		dc.w		$1d25,$1724,$3229,$1f36,$3840,$7374,$7677,$97c0


_sehao_sxb		;宋小宝

		move.b	#$34,D1		;取色
		move.b	D1,($d7,A0)						;色板号也写入敌人内存中
		bra    _sbgl

;

_sehao_lt		;老头
		move.b	#$27,D1		            ;取色
		move.b	D1,($d7,A0)			;色板号也写入敌人内存中
		bra    _sbgl

;

_sehao_bkl		;被砍龙

		move.b	#$36,D1		                        ;取下表中随机一色
		move.b	D1,($d7,A0)						;色板号也写入敌人内存中
		bra    _sbgl

;


_sehao_dl		;大龙
		clr.l	D0						;D0.b用来做随机数
		jsr     $119c						;随机程序
		divu.w	#$12,D0					;求余, 即限制范围( )
		swap		D0		    				;余数在高12位，交叉下
		move.b	_dldata(PC,D0),D1			;取下表中随机一色板
		move.b	D1,($D7,A0)				;色板号也写入敌人内存中
		bra    _sbgl		
		
_dldata
		dc.w		$1e2a,$2b2d,$2e2f,$3b08,$099e,$2731,$3571,$7278,$79c0



	*--------------------------同色共用（如矛兵跟大赵都是蓝色，可以共用1显色位）----------------------------------
_xsgy
		move.b	($d7,A0),D0				;色板号1给D0
		movea.l	A0,A3					;复制一份此敌人基址
		clr.l	D2

_idbl_e0	;检测场上敌人是否色板号一致
		suba.l	#$E0,A3					;偏移到下一个敌人基址
		cmpa.l	#$FFFFC8f4,A3			;是否小于DD14
		Bge     _sbh_0_xyg				;大于C8F4，证明属于敌人基址，继续检测
		movea.l	#$FFFFDD14,A3			;A3置为DD14（第一个）
_sbh_0_xyg
		cmpa.l	A3,A0					;是否绕了一圈基址
		beq		_xieru2					//绕了一圈没发现一样的，可以写入
		;--------------------------------------------------
_id_dy_fc0b
		move.b	($d7,A3),D1				;色板号2给D1
		beq		_idbl_e0				;D1为0就别检测了，下一个
		cmp.w	D0,D1					;检测是否跟某色板号是否相同
		beq		_idyiyang				;相同则把复制它给D0
		bra		_idbl_e0				;不一样或者0，这跳到下个敌人基址
		;----------------------------------找到相同-------------------------------------
_idyiyang
		move.b	($d6,A3),($d6,A0)		;找到一致的色板号，与之共用
		move.b	($d6,A3),($23,A0)		;找到一致的色板号，与之共用
_idbuyiyang
		bra		_xieru2					;重复写入色板数据


	;---------------------------摩托车数据写入---------------------------------
_mjmt_xr_8e_9e
		move.l	#$F111F343,$914000+$20*$E					;蓝马甲E
		move.l	#$F565F898,$914000+$20*$E+$4
		move.l	#$FABAF146,$914000+$20*$E+$8
		move.l	#$F169F0AC,$914000+$20*$E+$c
		move.l	#$F0EFFD00,$914000+$20*$E+$10
		move.l	#$FFC9FC86,$914000+$20*$E+$14
		move.l	#$F964F742,$914000+$20*$E+$18
		move.l	#$FFFFFA80,$914000+$20*$E+$1c

		move.l	#$F111F333,$914000+$20*$1E					;摩托1E
		move.l	#$F555F777,$914000+$20*$1E+$4
		move.l	#$F999FBBB,$914000+$20*$1E+$8
		move.l	#$FDDDFFFF,$914000+$20*$1E+$c
		move.l	#$FFEAFFD2,$914000+$20*$1E+$10
		move.l	#$FF93FE22,$914000+$20*$1E+$14
		move.l	#$FC06F908,$914000+$20*$1E+$18
		move.l	#$F607FA80,$914000+$20*$1E+$1c
		bra		_no_dr
		;--------------------------------------------------------------------
_3boss_xr_97_9F
		move.l	#$F111FFCA,$914000+$20*$1F					;3B 1F
		move.l	#$FD96FA64,$914000+$20*$1F+$4
		move.l	#$F730F334,$914000+$20*$1F+$8
		move.l	#$F556F667,$914000+$20*$1F+$c
		move.l	#$F889FBBC,$914000+$20*$1F+$10
		move.l	#$FEC0FC90,$914000+$20*$1F+$14
		move.l	#$F860FD00,$914000+$20*$1F+$18
		move.l	#$FFFFFA80,$914000+$20*$1F+$1c
		bra		_no_dr

*===========================================小兵死后一些内存数据清零===========================================
		org		$492e				;小兵死后一些内存数据清零
		nop
		jsr		$1fe000
		org		$1fe000
		move.b  D0, ($87,A6)		;其他的
		move.b  D0, ($96,A6)		;其他的
		clr.w    ($D6,A6) 			;色板号位
		rts


*===========================================NOP掉一些自带的强制色板===========================================
		org		$655ba				;tyrog2
		dc.w		$4e71,$4e71,$4e71
		org		$655ca				;tyrog2
		dc.w		$4e71,$4e71,$4e71
		org		$655e0				;tyrog2
		dc.w		$4e71,$4e71,$4e71


		;-----------------------------------0d以下不用强制色板------------------------------------------
		org		$014516
		nop
		jmp		$1fe020
		org		$1fe020

		move.w  (A1)+, D2			;把A1提前，反正都得走这一步
		move.w  (A1)+, D3			;因为要提前判断D5是否小于D
		cmpi.b	#$d,D3				;是否小于D
		blt		_0144D2				;小于D不用强制色板
_014516JX
		move.b  ($23,A0),D0
_01451e
		JMP		$01451e				;继续
_0144D2
		JMP		$0144D2				;跳到非强制
	




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
