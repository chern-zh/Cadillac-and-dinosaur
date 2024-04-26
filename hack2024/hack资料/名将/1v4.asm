             org     $042EC
			 move.b  #$f, D0
			 
	         org     $0711a
			 move.b  #$f, D0
			 
	         org     $51314           ;4人模式下复制人的变量
			 move.b  #$f, D0	
			 
			 org     $05131E		
			 jsr     $6a080.l
			 org     $51866
			 dc.w    $4e71,$4e71,$4e71,$4e71,$4e71,$4e71
			 
			 org     $6a080
			 moveq   #$0, D0
			 cmpa.w  #$a994, A2		*1P地址
			 bne     $6a08c
			 move.b  #$0, D0
			 cmpa.w  #$aa94, A2		*2P地址
			 bne     $6a096
			 move.b  #$1, D0
			 cmpa.w  #$ab94, A2		*3P地址
			 bne     $6a0a0
			 move.b  #$2, D0
			 cmpa.w  #$ac94, A2		*4P地址
			 bne     $6a0aa
			 move.b  #$3, D0
			 rts

			 

  
;-------------------------------血1.5倍------------------------------------------  
  
    org     $5A62                                   ;开始游戏加载血
    move.w  #$66, ($3c,A0)
    org     $61FE                                   ;中途游戏加载血
    move.w  #$66, ($3c,A0)
    org     $6752
    move.w  #$66, ($3c,A0)
    org     $17094                                  ;换命加载？
    move.w  #$66, ($3c,A0)  
  
  
     org  $a95f2                                    ;柠檬不加血
     cmpi.w  #$66,($3c,a6)
  
     org  $a95B6                                    ;巧克力不加血
     cmpi.w  #$66,($3c,a6)
	 
     org  $A957A                                    ; ？不加血
     cmpi.w  #$66,($3c,a6)	 
	 
     org  $A958E                                    ; ？不加血
     cmpi.w  #$66,($3c,a6)	
	 
	 org  $A95a2                                    ; ？不加血
     cmpi.w  #$66,($3c,a6)	
	 
	 org  $A95CA                                    ; ？不加血
     cmpi.w  #$66,($3c,a6)	
	 
     org  $A95de                                   ; ？不加血
     cmpi.w  #$66,($3c,a6)	
	 
	 org  $A9646                                   ; ？不加血
     cmpi.w  #$66,($3c,a6)	
	 
	 
	 
    org     $A965c                                  ;大补还是什么补血最高值
    cmpi.w  #$66, ($3c,A6)
	


	
	ORG    $A9666                                      ;烤肉与天妇罗  满血？？
	move.w  #$66, ($3c,A6)
	ORG    $A9650
	move.w  #$66, ($3c,A6)
	
	
	
	
	
		org		$110000				;org后面跟要写入的地址
		
		dc.w	$1234				;双字节
		dc.l	$12345678			;四字节
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			 