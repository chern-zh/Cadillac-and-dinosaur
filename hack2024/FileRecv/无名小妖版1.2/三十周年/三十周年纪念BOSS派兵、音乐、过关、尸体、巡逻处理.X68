*----------------2BOSS，音乐、派兵、过关、尸体处理---------------
	org	$59e08		/派兵
	jsr	_pb_2
	org	$59e16		/音乐
	jsr	_music_2
	org	$5bb6e		/过关
	jsr	_pass2
	org	$59f04		/屠夫不掉刀
	jmp	$59f54
*----------------3BOSS，音乐、派兵、过关、尸体处理---------------
	org	$4fe12		/派兵
	jmp	_pb_3
	org	$4fde0		/音乐
	jsr	_music_3
	org	$50336		/过关
	jsr	_pass3
*----------------4BOSS，音乐、派兵、过关、尸体处理---------------
	org	$4bfc6		/派兵
	jsr	_pb_4
	org	$4bfba			/4BOSS出场音乐
	jsr	_4Bccyy
	org	$4bf4c			/4BOSS对话音乐
	jsr	_4Bdhyy	
	org	$7796			/4BOSS死亡音乐
	jmp	_music_4_die
	org	$4c89a		/过关
	jsr	_pass4
*----------------马云，音乐、派兵、震死小兵---------------
	org	$5178a		/派兵
	jsr	_pb_5
	org	$51772		/音乐
	jsr	_music_5
	org	$52d28		/震死小兵，也是慢动作地址
	jmp	$52d36

*----------------5BOSS，音乐、派兵、过关、尸体处理---------------
	org	$53e64		/派兵
	jsr	_pb_5
	org	$5574e		/过关
	jsr	_pass5
*----------------6BOSS，音乐、派兵、过关、清版+1、-1--------------------------
	org	$36ac2		/派兵
	jsr	_pb_6
	org	$36a9e		/音乐
	jsr	_music_6
	org	$38c30		/6BOSS非幼体过关
	jsr	_6b_noyt
	org	$5fc68		/6BOSS幼体过关
	jsr	_6b_noyt	
;取消6B慢动作、震死小兵
	org		$38c12		/慢动作NOP掉
	nop		
	nop
	nop	
	nop		
	nop
	nop

;-----------------------------取消打死178慢动作、变身、清版-1--------------------------------
	org	$6be7a
	jsr	_music_8
	org	$6cd3a			/178慢动作
	nop
	nop
	nop
	org     	$6ce06			/178变身坐标
	nop
	bra	$6ce1e	
	org	$6cef8			/加载大龙,清版-1
	jsr	_minus_178
	org	$64f54			/大龙音乐
	jsr	_music_8
	org	$6501c			/大龙派兵
	jsr	_pb_8
	org	$66b64			/大龙过关、清版-1
	jsr	_pass8
		
;===================================幻影与4B修复================================
;幻影死亡飞镖BUG修复
	org	$8598C
	jmp	_11c_xf
	ORG	$5e4a4
	jmp	_11c_gj			/幻影修复
    	ORG    $4c386
    	jmp    _64_gj		/修复
;飞镖调节
	org	$47730
	jmp	_11c_feibiao

*--------------------------BOSS尸体处理----------------------------------
*-------------------------幻影尸体消失、马云清版-1，变身相关----------------------------------------------
        	ORG	$2aec6		/前端
        	jsr	_change_begin
*----------------------------取消单只BOSS死不动，慢动作--------------------------------
		org		$778c	/正常走此指令，打死单只BOSS后不能动，不无敌	;
		jmp		_7fd4	
		org		$81fea	;仅派兵BOSS触发此指令，不走此指令，打死BOSS后依旧能动					
		jmp		_7fd6
*---------------------------------------------------------------------------------
	org	$acee
	jmp	_no_english
	



*========================================================================================
*==================变身及动作，日版=======================
		org			$52e02		*移动动作
		jsr			_begin_act
		org			$52e34		*终止动作
		jsr			_end_act
		
		org			$18fc00
_begin_act
		cmpi.b		#$9,($3,A6)		*是否猴子2
		beq			_hz_b_a
		cmpi.b		#$14,($3,A6)		*是否刀柄2
		beq			_dbb_b_a
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
_dbb_b_a
		moveq		#$10,D0
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
		cmpi.b		#$14,($3,A6)		*是否刀柄2
		beq			_dbb_e_a
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
_dbb_e_a
		moveq		#$10,D0
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











































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
