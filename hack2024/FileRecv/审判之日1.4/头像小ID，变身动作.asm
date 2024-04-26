*敌兵小ID（血条上的头像）

*马甲：0，1，1A
*猎人：2，12，13
*胖子：3，A，B
*迅猛龙：4
*4BOSS：5
*刀手：6，14
*霸王龙：7
*猴子：8，9
*1BOSS：C
*大个子：D
*链球：E
*2BOSS：F
*狮子：10
*三角龙：11
*马云：15
*铁头龙：16
*幻影：18
*6BOSS非幼体（活：10）：19
*6BOSS幼体（活、死：120）：1B
*飞刀手：1C，1C
*扔雷猴：1D，24
*打龙胖13C：1E
*翼龙：21
*大龙150：22
*16C：23
*178：25
*3BOSS：26

*===============匕首兵不掉匕首（美版）===================
		org			$4042c
		
*================3BOSS任意场景(日版)====================
		org			$51000		*摩托车检测障碍物*原指令jsr	$12be6
		nop
		nop						
		nop
		org			$4fe9e		*3BOSS检测障碍物*原指令jsr	$12be6
		nop
		nop
		nop

*==================变身及动作，日版=======================
		org			$52e02		*移动动作
		jsr			_begin_act
		org			$52e34		*终止动作
		jsr			_end_act
		
		org			$107000
_begin_act
		cmpi.b		#$9,($3,A6)		*是否猴子2
		beq			_hz_b_a
		cmpi.b		#$d,($3,A6)		*大个子
		beq			_dg_b_a	
		cmpi.b		#$5,($3,A6)		*对比变身4B密码
		beq			_4B_b_a
		cmpi.b		#$18,($3,A6)		*幻影
		beq			_4B_b_a
		cmpi.b		#$1A,($3,A6)		*马甲
		beq			_mj_b_a
		cmpi.b		#$23,($3,A6)		*16C
		beq			_16C_b_a
		cmpi.b		#$10,($3,A6)		*狮子
		beq			_sz_b_a
		jsr			$120e
		rts
_hz_b_a
		moveq		#$8,D0
		jsr			$120e
		rts
_dg_b_a
		moveq		#$6,D0
		jsr			$120e
		rts
_4B_b_a
		moveq		#$c,D0
		jsr			$120e
		rts
_mj_b_a
		moveq		#$c,D0
		jsr			$120e
		rts
_16C_b_a
		moveq		#$a,D0
		jsr			$120e
		rts
_sz_b_a
		moveq		#$b,D0
		jsr			$120e
		rts
*===================================		
_end_act
		cmpi.b		#$9,($3,A6)		*是否猴子2
		beq			_hz_e_a
		cmpi.b		#$d,($3,A6)		*对比变身大个子密码
		beq			_dg_e_a		
		cmpi.b		#$5,($3,A6)		*对比变身4B密码
		beq			_4B_e_a
		cmpi.b		#$18,($3,A6)		*幻影
		beq			_4B_e_a
		cmpi.b		#$1A,($3,A6)		*马甲
		beq			_mj_e_a
		cmpi.b		#$23,($3,A6)		*16C
		beq			_16C_e_a
		cmpi.b		#$10,($3,A6)		*狮子
		beq			_sz_e_a
		jsr			$120e
		rts
_hz_e_a
		moveq		#$8,D0
		jsr			$120e
		rts		
_dg_e_a
		moveq		#$5,D0
		jsr			$120e
		rts
_4B_e_a
		moveq		#$9,D0
		jsr			$120e
		rts
_mj_e_a
		moveq		#$c,D0
		jsr			$120e
		rts		
_16C_e_a
		moveq		#$11,D0
		jsr			$120e
		rts		
_sz_e_a
		moveq		#$b,D0
		jsr			$120e
		rts		
		
		