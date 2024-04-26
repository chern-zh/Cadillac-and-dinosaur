*------------------------动态分配123P---------------------------------------		
	
	;-------------------------搬砖程序，加入"识别ID指定显存"子程序------------------------------
			org		$145c6			;不动的时的搬砖程序
			jsr		$1d0000	
			org		$1450a
			jsr		$1d0000			
						
			org		$14390			;动时的搬砖程序
			jsr		$1d0000			
			org		$1433e
			jsr		$1d0000	
			
			; org		$14560		;不知道什么鬼，应该没用
			; jsr		$1d0000		

	;----------------------------识别ID指定显存-----------------------------------------------		
	
			org		$1d0000	
	        bsr		_dtfp123p						;进入该识别指定程序
			
_buyaofp			
			movem.w D0-D3, (A4)							;原来被jsr跳转破坏的指令，补回
			addq.l  #8, A4								;原来被jsr跳转破坏的指令，补回
			rts

_dtfp123p	
		cmpa.l	#$FffFB274,A0							;是否1P
		BEQ		_zd1p
		cmpa.l	#$FffFB3f4,A0							;是否2P
		BEQ		_zd2p
		cmpa.l	#$FffFB574,A0							;是否3P
		BEQ		_zd3p
		rts		
		
_zd1p		
		andi.b	#$F0,D3								;12位清零	
		rts
_zd2p		
		andi.b	#$F0,D3								;12位清零			
		ADDQ.b	#1,D3								;加1，就是2P指定用914020
		rts
_zd3p		
		andi.b	#$F0,D3								;12位清零			
		ADDQ.b	#2,D3								;加2，就是3P指定用914040
		rts		
		

		
; *------------------------变身后角色颜色分配  场景开始处---------------------------------------			
			
			ORG		$192ce						;按方向键就会运行的某指令

			jsr		$1d3000						;加载123P颜色
			org		$1d3000
		
			moveq   #$0, D0						;原来破坏的
			move.b  D0, ($80,A6)				;原来破坏的




			movem.l	D0-D2/A0-A6,-(a7)			;入栈d0-a6
			
			clr.l	D0
			clr.l	D1
			clr.l	D2	
			
			movea.l	#0,A1
			movea.l	#0,A2
			movea.l	#0,A3						
			; clr.l	D3
			; clr.l	D4
			; clr.l	D5		

			jsr		_xyscx						;加载123P颜色	的子程序		
			
			movem.l	(a7)+,D0-D2/A0-A6			;出栈d0-a6
			
			
			rts


			
		
		
		
*------------------------同人物后角色颜色分配---------------------------------------			

			
			org		$71DA				;选中人物后跟续币载入一次而已
			jsr		$1d1000
			org		$1d1000
		
			;move.b  #$1, ($0,A6)			
			;move.b  #$20,($C6,A6)		;死命或者开始暴击恢复20？		
			

			
			movem.l	D0-D2/A0-A6,-(a7)			;入栈d0-a6
			
			clr.l	D0
			clr.l	D1
			clr.l	D2	
			
			movea.l	#0,A1
			movea.l	#0,A2
			movea.l	#0,A3						
			; clr.l	D3
			; clr.l	D4
			; clr.l	D5		

			bsr		_xyscx				
			
			movem.l	(a7)+,D0-D2/A0-A6			;出栈d0-a6
			
			
			rts
   ;------------------------------新颜色判断程序--------------------------------------	
   
_xyscx
			tst.b	$FFB274				;1p是否在玩	
			BEQ		_D000
			move.w	#$100,d0			;加个有人玩的标志
_D000					
			move.b	$FFB277,d0			;1P的人物ID代入寄存器

			
			tst.b	$FFB3f4
			BEQ		_D111
			move.w	#$100,d1			;加个有人玩的标志
_D111
			move.b	$FFB3f7,d1		
			
			
			tst.b	$FFB574
			BEQ		_D222
			move.w	#$100,d2			;加个有人玩的标志
_D222		
			move.b	$FFB577,d2		
			
		;----------------------- 检测几P -----------------------
		

		cmpa.l	#$fffFB274,A6							;是否1P
		BEQ		_Bd1p0
		cmpa.l	#$fffFB3f4,A6							;是否2P
		BEQ		_Bd2p0
		cmpa.l	#$fffFB574,A6							;是否3P
		BEQ		_Bd3p0
		
		rts	


_Bd1p0
		movea.l	#_1tao,A1							;1P/原色 用色板 号码（1套）		
	    movea.l	#$914000,A2							;1P专用显色
		
		BRA		_Pxinse	
				
_Bd2p0	
		movea.l	#_2tao,A1							;2P 用色板 号码（2套）			
		movea.l	#$914020,A2							;2P专用显色
		
		cmp.w	D1,D2								;检测跟1P、3P是否同一人物
		beq		_Pxinse
		cmp.w	D1,D0
		beq		_Pxinse	
		
		movea.l	#_1tao,A1							;都不是清零，即用回“1套”色板
		BRA		_Pxinse	
		
_Bd3p0	
		movea.l	#_3tao,A1							;3P 用色板 号码（3套）		
		movea.l	#$914040,A2							;3P专用显色
		
		cmp.w	D2,D0								;检测跟2P、1P是否同一人物
		beq		_Pxinse
		cmp.w	D2,D1
		beq		_Pxinse	
		
		movea.l	#_1tao,A1							;都不是清零，即用回“1套”色板
		BRA		_Pxinse	

	;------------------------------角色分配-------------------------------------	
_Pxinse	
		cmpi.b		#0,($3,A6)			;是否白人
		beq			_fprdz
		cmpi.b		#2,($3,A6)			;是否汉娜
		beq			_fprdz1		
		cmpi.b		#1,($3,A6)			;是否黄帽
		beq			_fprdz2
		cmpi.b		#3,($3,A6)			;是否麦斯
		beq			_fprdz3	
		rts				
_fprdz									;白人用第1种
		BRA			_A1_A2
_fprdz1
		adda.l		#$20,A1				;汉娜用第2种
		BRA			_A1_A2		
_fprdz2
		adda.l		#$40,A1		
		BRA			_A1_A2		
_fprdz3
		adda.l		#$60,A1		
		BRA			_A1_A2


		
	;------------------色板正式搬运----------------------	
_A1_A2
		clr.l		D0
		move.b		#$f,D0
_A1_A2_loop		
		dbra		D0,_A1_A2_goon		;循环20次
		rts
_A1_A2_goon		
		move.w		(A1)+,(A2)			;搬运色板到显存
		or.w		#$f000,(A2)+		;低4位加个F	
		cmpi.b		#0,$FF84D9			;是否2关
		beq			_jffff
		cmpi.b		#1,$FF84D9			;是否2关
		beq			_jffff
		cmpi.b		#3,$FF84D9			;是否6关
		beq			_jffff
		cmpi.b		#6,$FF84D9			;是否6关
		beq			_jffff		
		
_jffff_OK
		bra			_A1_A2_loop			;继续循环					
_jffff			
		clr.l		D1
		move.w		#$1fF,D1	
		movea.l		#$914000,A3		
_jffff_1E0	
		or.w		#$f000,(A3)+
		dbra		D1,_jffff_1E0		;循环20次
		bra			_jffff_OK
		
		
		
_1tao	
	   dc.w       $0111,$0FCA,$0D96,$0A64,$0730,$0007,$023B,$047E
       dc.w       $08BE,$0CEF,$0EB0,$0B70,$0850,$0540,$0FFF,$00A9
_1tao1	   
       dc.w       $0111,$0FCB,$0EA8,$0B75,$0843,$0500,$0800,$0B00
       dc.w       $0F40,$0F80,$0CFF,$0ADF,$089E,$065C,$0FFF,$00A9
	   
	      
_1tao2	   
       dc.w       $0111,$0E87,$0A54,$0643,$0430,$0050,$0380,$06C5
       dc.w       $09F8,$0DFB,$0FFC,$0FE0,$0FA0,$0B60,$0FFF,$00A9
_1tao3	  	   
       dc.w       $0111,$0FCA,$0C96,$0A64,$0742,$0510,$0720,$0930
       dc.w       $0C60,$0F80,$0EFC,$0AC9,$0695,$0363,$0FFF,$00A9

	   
_2tao	
       dc.w       $0111,$0E87,$0A54,$0643,$0430,$0050,$0380,$06C5			;黄帽的	
       dc.w       $09F8,$0DFB,$0FFC,$0FE0,$0FA0,$0B60,$0FFF,$00A9
_2tao1	   
       dc.w       $0111,$0FCA,$0C86,$0853,$0630,$0058,$007C,$06BE
       dc.w       $09EF,$0FEF,$0ECF,$0B9D,$097A,$0657,$0FFF,$00A9
_2tao2	   
       dc.w       $0111,$0E87,$0A54,$0643,$0430,$0500,$0800,$0B00
       dc.w       $0F40,$0F80,$0AFC,$0DF0,$05A0,$0270,$0FFF,$00A9
_2tao3	  	   
       dc.w       $0111,$0E87,$0A54,$0643,$0430,$0050,$0380,$06C5			;大汉2套用黄帽原来的
       dc.w       $09F8,$0DFB,$0FFC,$0FE0,$0FA0,$0B60,$0FFF,$00A9
		
		
_3tao	
	   dc.w       $0111,$0FCA,$0D98,$0963,$0750,$0800,$0B00,$0F60			;黄胖的？	
       dc.w       $0F90,$0FE0,$0FB0,$0E80,$0B50,$0730,$0FFF,$00A9
_3tao1	   
       dc.w       $0111,$0FA8,$0B75,$0740,$0430,$0070,$0890,$0DC3
       dc.w       $0FF8,$0EFC,$0FEB,$0DB8,$0A96,$0860,$0FFF,$00A9
_3tao2	   
       dc.w       $0111,$0E87,$0A54,$0643,$0430,$0007,$023B,$047E
       dc.w       $08BE,$0CEF,$0CFF,$0ADF,$089E,$065C,$0FFF,$00A9
_3tao3	  	   
       dc.w       $0111,$0FFF,$0CCD,$099A,$0778,$0556,$0830,$0C60
       dc.w       $0F90,$0FC6,$0DBA,$0B98,$0976,$0754,$0532,$00A9		
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
