		org     $018D0A                        ;һֱ�����е�ĳ��Ѫ����س���
        jmp     _bjxscx                        ;���롰��������


        org     $102d00         ;��ű�������Ŀհ׵�ַ�����Ըĳɱ�ģ�
_bjxscx                        
        bsr     _bjxscx1        ;����������ʾ�ӳ���
		bsr		_msxs
        tst.w   ($6c,A6)        ;ԭ���Ĳ���
        bgt     _18d48          ;ԭ���Ĳ���
        jmp     $18d12          ;ԭ���Ĳ���
_18d48                        
        jmp     $18d48                ;ԭ���Ĳ���
_msxs
	movem.l		D0-D3/A0-A3,-(A7)	
	lea			$90a41c,A1		/90a41c��6��ʾ����λ�ã�ec��ʾ����λ��	
	lea			$182ee0,A0
		cmpi.b	#$1,($7f88,A5)
		beq		_c0a
		adda.l	#$8,A0
		cmpi.b	#$2,($7f88,A5)
		beq		_c0a
		adda.l	#$8,A0
		cmpi.b	#$3,($7f88,A5)
		beq		_c0a
		adda.l	#$8,A0	
_c0a	
	jsr			$c0a
	movem.l		(A7)+,D0-D3/A0-A3 
_qbrts
	rts
	org			$182ee0
	dc.w		$1a6d,$6f64,$6523,$3140		
	org			$182ee8
	dc.w		$1a6d,$6f64,$6523,$3240
	org			$182ef0
	dc.w		$1a6d,$6f64,$6523,$3340
	org			$182ef8
	dc.w		$1a6d,$6f64,$6523,$3440		
        ;/////////////////////////////////////////////////////////////////////////////////               
_bjxscx1        
        movem.l  D0,-(A7)                          ;D0��ջ                  
        clr.l   D0                                  ;���D0  		
        cmpi.b  #$0, ($2,A6)                  ;���1P
        bne     _2p                      	  ;����1P���2P
        move.b  ($c6,A6),D0                  ;����ֵ����D0                        
        lsr.b   #4, D0                        ;ȡʮλ
        move.w  D0, $90a71C                   ;ʮλ��Ҫ��ʾ��λ��(90a71C���˻��ƶ���ʾλ��)                          
        move.w  #$19E, $90a71e                ;��ʽ                        
        move.b  ($c6,A6),D0                  ;����ֵ�ٴδ���D0   
        andi.b  #$f, D0                       ;ȡ��λ
        move.w  D0, $90a79c                   ;��λ��Ҫ��ʾ��λ��(90a79c���˻��ƶ���ʾλ��)  
        move.w  #$19E, $90a79e           	  ;��ʽ           

_2p                        
                        cmpi.b  #$1, ($2,A6)                          ;���2P
                        bne     _3p
                        move.b  ($c6,A6),D0
                        lsr.b   #4, D0
                        move.w  D0, $90af1C
                        move.w  #$19E, $90af1e
                        move.b  ($c6,A6),D0
                        andi.b  #$f, D0
                        move.w  D0, $90af9c
                        move.w  #$19E, $90af9e        
_3p                        
                        cmpi.b  #$2, ($2,A6)                          ;���3P
                        bne     _rts
                        move.b  ($c6,A6),D0
                        lsr.b   #4, D0
                        move.w  D0, $90b71C
                        move.w  #$19E, $90b71e
                        move.b  ($c6,A6),D0
                        andi.b  #$f, D0
                        move.w  D0, $90b79C
                        move.w  #$19E, $90b79E  
_rts               
                        movem.l  (A7)+, D0   		;D0��ջ                                                                                   
                        rts
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
