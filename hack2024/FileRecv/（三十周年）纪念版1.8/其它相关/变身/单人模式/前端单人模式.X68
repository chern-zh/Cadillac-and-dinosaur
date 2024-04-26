                org    $2AF8E                   ;敌兵隔屁后会运行的某个指令
                jsr    $180100
                org    $180100
                move.l  A5, $fffff4.l


;--------------------------------单人模式-------------------------------------------------------- 
_one_player_
                cmpi.w  #$f4, ($20,A6)          ;是否屠夫
                beq     _2B_                    ;是，跳到屠夫尸体处理程序
                cmpi.w  #$11c, ($20,A6)         ;是否幻影
                beq     _7B_                    ;
                cmpi.w  #$150, ($20,A6)         ;是否大龙
                beq     _8B_
                cmpi.w  #$90, ($20,A6)          ；是否马云          
                beq     _90_
                cmpi.w  #$a0, ($20,A6)          ；是否铁头龙
                beq     _5B_
                cmpi.w  #$28, ($20,A6)          ；是否胖子
                beq     _pangzi_
                cmpi.w  #$38, ($20,A6)          ；是否刀兵
                beq     _daobing_
                cmpi.w  #$50, ($20,A6)          ；是否猴子
                beq     _houzi_
                cmpi.w  #$18, ($20,A6)          ；是否狮子
                beq     _shizi_
                cmpi.w  #$8, ($20,A6)          ；是否马甲
                beq     _majia_ 
                ;cmpi.w  #$48, ($20,A6)          ；是否大个子
                ;beq     _dagezi_
                cmpi.w  #$c, ($20,A6)           ；是否链球
                beq     _lianqiu_
                cmpi.w  #$34, ($20,A6)          ；是否猎人
                beq     _lieren_              
                jmp     _bu_huanmajia_          ；以上选手都未参赛，直接穿衣服回家

;---------------------------------屠夫---------------------------------------------                
                
_2B_
                subq.b  #1, $ffffc0.l
                subq.b  #1, $ffffb0.l
                cmpi.b  #$1,($4d9,A5)          ;是否第二关
                bne     _huanmajia_             ;否，直接换马甲，BOSS尸体消失
                cmpi.b  #$2,($786,A5)          ;是否二关关底
                bne     _huanmajia_             ;否，直接换马甲
                jmp     _bu_huanmajia_          ;是关底，跳到不换马甲
                
;----------------------------------幻影---------------------------------------------                
                
_7B_
                subq.b  #1, $ffffb0.l
                cmpi.b  #$6,($4d9,A5)
                bne     _huanmajia_
                cmpi.b  #$3,($786,A5)
                bne     _huanmajia_
                jmp     _bu_huanmajia_
                
;-----------------------------------大龙--------------------------------------------
                
_8B_
                subq.b  #1, $ffffc0.l
                subq.b  #1, $ffffb0.l
                cmpi.b  #$7,($4d9,A5)
                bne     _huanmajia_
                cmpi.b  #$3, ($786,A5)
                bne     _huanmajia_
                jmp     _bu_huanmajia_
                
;---------------------------------------铁头龙（1、2、3、6、ffff1c）------------------------------------------                
_5B_
                subq.b  #1, $ffffc0.l           ;铁头龙死了，BOSS清兵内存减一          
                subq.b  #1, $ffffb0.l           ;铁头龙死了，BOSS清兵内存减一
                cmpi.b  #$0, ($4d9,A5)          ;检测是否第1关
                beq     _5B_1_cj_               ;是，跳到第1关场景检测
                cmpi.b  #$1, ($4d9,A5)          ;检测是否第2关
                beq     _5B_2_cj_               ;是，跳到第2关场景检测
                cmpi.b  #$2, ($4d9,A5)          ;检测是否第3关
                beq     _5B_3_cj_               ;是，跳到第3关卷轴检测
                cmpi.b  #$5, ($4d9,A5)          ;检测是否第6关
                beq     _5B_6_cj_               ;是，跳到第6关场景检测
_5B_5_cj_                
                cmpi.b  #$4,($4d9,A5)           ;检测是否第5关
                bne     _huanmajia_             ;否，跳到换马甲，尸体消失
                cmpi.b  #$1,($786,A5)           ;检测是否第二场景
                bne     _huanmajia_             ;否
                jmp     _bu_huanmajia_
                
                
_5B_1_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第1关第3场景
                beq     _huanmajia_             ;是关底，跳到换成小兵马甲，尸体消失
                addq.b  #1, $ffffc0.l           ;不是关底，则要变身大龙，BOSS清兵内存加一
                addq.b  #1, $ffffb0.l           ;BOSS清兵内存加一
                add.w  #$A0,$ffff1c.l           ;将A0标签移到内存ffff1c，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序
_5B_2_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第2关第3场景
                beq     _huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$A0,$ffff1c.l          ;将A0标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_5B_3_cj_
                cmpi.w  #$2ccc,($864,A5)      ;第3关卷轴检测
                beq     _huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$A0,$ffff1c.l          ;将A0标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_5B_6_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第6关第3场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$A0,$ffff1c.l          ;将A0标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_          ;跳到变身程序                                
                
;----------------------------------------------马云（1、2、3、5、6、ffff18）-------------------------                
                
_90_
                subq.b  #1, $ffffc0.l           ;马云死了，BOSS清兵内存减一
                subq.b  #1, $ffffb0.l           ;马云死了，BOSS清兵内存减一
                cmpi.b  #$0, ($4d9,A5)          ;检测是否第1关
                beq     _90_1_cj_               ;是，跳到第1关场景检测
                cmpi.b  #$1, ($4d9,A5)          ;检测是否第2关
                beq     _90_2_cj_               ;是，跳到第2关场景检测
                cmpi.b  #$2, ($4d9,A5)          ;检测是否第3关
                beq     _90_3_cj_               ;是，跳到第3关卷轴检测
                cmpi.b  #$5, ($4d9,A5)          ;检测是否第6关
                beq     _90_6_cj_               ;是，跳到第6关场景检测
                cmpi.b  #$4,($4d9,A5)           ;检测是否第5关
                bne     _huanmajia_             ;否，跳到换马甲，尸体消失
                cmpi.b  #$1,($786,A5)           ;检测是否第二场景
                bne     _huanmajia_             ;否
                jmp     _bu_huanmajia_

_90_1_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第1关第3场景
                beq     _huanmajia_             ;是关底，跳到换成小兵马甲，尸体消失
                addq.b  #1, $ffffc0.l           ;不是关底，则变身铁头龙，BOSS清兵内存加一
                addq.b  #1, $ffffb0.l           ;BOSS清兵内存加一
                add.w  #$90,$ffff18.l           ;将马云标签移到内存ffff18，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_90_2_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第2关第3场景
                beq     _huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$90,$ffff18.l          ;将马云标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_90_3_cj_
                cmpi.w	#$2ccc,($864,A5)      ;第3关卷轴检测
                beq     _huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$90,$ffff18.l          ;将马云标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_90_6_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第6关第3场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$90,$ffff18.l          ;将马云标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序


                
;-----------------------------------------链球（2、4、6、7、8、ffff24）--------------------------------------------                
_lianqiu_
                cmpi.b  #$1, ($4d9,A5)          ;检测是否第2关
                beq     _lianqiu_2_cj_           ;
                cmpi.b  #$3, ($4d9,A5)          ;检测是否第4关
                beq     _lianqiu_4_cj_           ;
                cmpi.b  #$5, ($4d9,A5)          ;检测是否第6关
                beq     _lianqiu_6_cj_           ;
                cmpi.b  #$6, ($4d9,A5)          ;检测是否第7关
                beq     _lianqiu_7_cj_           ;
                cmpi.b  #$7, ($4d9,A5)          ;检测是否第8关
                beq     _lianqiu_8_cj_           ;                
                jmp     _bu_huanmajia_          ;以上关卡都不是，则不换马甲
                
_lianqiu_2_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第二关第三场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w  #$c,$ffff24.l           ;否，则把链球标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lianqiu_4_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第4关第三场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w  #$c,$ffff24.l           ;否，则把链球标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lianqiu_6_cj_                
                cmpi.b  #$2, ($786,A5)          ;是否第6关第3场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w  #$c,$ffff24.l           ;否，则把链球标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lianqiu_7_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第7关第4场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$c,$ffff24.l           ;否，则把链球标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lianqiu_8_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第8关第4场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$c,$ffff24.l           ;否，则把链球标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

              

;----------------------------------------胖子（1、3、5、8、ffff28）------------------------------------------------                
_pangzi_
                cmpi.b  #$0, ($4d9,A5)          ;检测是否第1关
                beq     _pangzi_1_cj_            ;是，跳到第1关场景检测
                cmpi.b  #$2, ($4d9,A5)          ;检测是否第3关
                beq     _pangzi_3_cj_            ;是，跳到第3关场景检测
                cmpi.b  #$4, ($4d9,A5)          ;检测是否第5关
                beq     _pangzi_5_cj_            ;是，跳到第5关卷轴检测
                cmpi.b  #$7, ($4d9,A5)          ;检测是否第8关
                beq     _pangzi_8_cj_            ;是，跳到第8关场景检测                
                jmp     _bu_huanmajia_          ;以上关卡都不是，则不对胖子尸体进行操作

_pangzi_1_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第1关第3场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$28,$ffff28.l          ;将胖子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_pangzi_5_cj_
                cmpi.b  #$1, ($786,A5)          ;是否第5关第2场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$28,$ffff28.l          ;将胖子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_pangzi_3_cj_
                cmpi.w	#$2ccc,($864,A5)      ;第3关卷轴检测
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$28,$ffff28.l          ;将胖子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_pangzi_8_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第8关第4场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$28,$ffff28.l          ;将胖子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序
                
                
;-----------------------------------------刀兵（1、3、4、5、7、ffff2c）------------------------------------------------------                
_daobing_
                cmpi.b  #$0, ($4d9,A5)          ;检测是否第1关
                beq     _daobing_1_cj_          ;是，跳到第1关场景检测
                cmpi.b  #$2, ($4d9,A5)          ;检测是否第3关
                beq     _daobing_3_cj_            ;是，跳到第3关场景检测
                cmpi.b  #$3, ($4d9,A5)          ;检测是否第4关
                beq     _daobing_4_cj_            ;是，跳到第4关场景检测
                cmpi.b  #$4, ($4d9,A5)          ;检测是否第5关
                beq     _daobing_5_cj_            ;是，跳到第5关场景检测
                cmpi.b  #$6, ($4d9,A5)          ;检测是否第7关
                beq     _daobing_7_cj_            ;是，跳到第7关场景检测                
                jmp     _bu_huanmajia_

_daobing_1_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第1关第三场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$38,$ffff2c.l           ;将马甲标签移到内存，作为变身参照标签
                jmp     _bianshen_mj_           ;跳到变身程序
                
_daobing_4_cj_                
                cmpi.b  #$2, ($786,A5)          ;是否第四关第三场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$38,$ffff10.l           ;将马甲标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_daobing_5_cj_
                cmpi.b  #$1, ($786,A5)          ;是否第5关第2场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$38,$ffff10.l           ;将马甲标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_daobing_3_cj_
                cmpi.w	#$2ccc,($864,A5)      ;第3关卷轴检测
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$38,$ffff10.l           ;将马甲标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序
                
_daobing_7_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第7关第4场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$38,$ffff10.l           ;将马甲标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序
                
                            
                
                
;------------------------------------猴子（1、2、3、6、ffff14）---------------------------------------                
_houzi_
                cmpi.b  #$0, ($4d9,A5)          ;检测是否第1关
                beq     _houzi_1_cj_            ;是，跳到第1关场景检测
                cmpi.b  #$1, ($4d9,A5)          ;检测是否第2关
                beq     _houzi_2_cj_            ;是，跳到第2关场景检测
                cmpi.b  #$2, ($4d9,A5)          ;检测是否第3关
                beq     _houzi_3_cj_            ;是，跳到第3关卷轴检测
                cmpi.b  #$5, ($4d9,A5)          ;检测是否第6关
                beq     _houzi_6_cj_            ;是，跳到第6关场景检测                
                jmp     _bu_huanmajia_          ;以上关卡都不是，则不对猴子尸体进行操作

_houzi_1_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第1关第3场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$50,$ffff14.l          ;将猴子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_houzi_2_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第2关第3场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$50,$ffff14.l          ;将猴子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_houzi_3_cj_
                cmpi.w	#$2ccc,($864,A5)      ;第3关卷轴检测
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$50,$ffff14.l          ;将猴子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_houzi_6_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第6关第3场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffc0.l
                addq.b  #1, $ffffb0.l
                add.w  #$50,$ffff14.l          ;将猴子标签移到内存，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序
 
            
                                
                
;-------------------------------------狮子（1、4、5、6、7、8、ffff30）-------------------------------------------------                 
_shizi_
                cmpi.b  #$0, ($4d9,A5)          ;检测是否第1关
                beq     _shizi_1_cj_           ;
                cmpi.b  #$3, ($4d9,A5)          ;检测是否第4关
                beq     _shizi_4_cj_           ;
                cmpi.b  #$4, ($4d9,A5)          ;检测是否第5关
                beq     _shizi_5_cj_ 
                cmpi.b  #$5, ($4d9,A5)          ;检测是否第6关
                beq     _shizi_6_cj_           ;
                cmpi.b  #$6, ($4d9,A5)          ;检测是否第7关
                beq     _shizi_7_cj_           ;
                cmpi.b  #$7, ($4d9,A5)          ;检测是否第8关
                beq     _shizi_8_cj_           ;                
                jmp     _bu_huanmajia_          ;以上关卡都不是，则不换马甲
                
_shizi_1_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第1关第三场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w  #$18,$ffff30.l           ;否，则把狮子标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_shizi_4_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第4关第三场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$18,$ffff30.l           ;否，则把狮子标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_shizi_5_cj_
                cmpi.b  #$1, ($786,A5)          ;是否第5关第2场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$18,$ffff30.l           ;否，则把狮子标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序
                
_shizi_6_cj_                
                cmpi.b  #$2, ($786,A5)          ;是否第6关第3场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$18,$ffff30.l           ;否，则把狮子标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_shizi_7_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第7关第4场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$18,$ffff30.l           ;否，则把狮子标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_shizi_8_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第8关第4场景   （第八关关底要不要变身呢？？？）
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$18,$ffff30.l           ;否，则把狮子标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

                cmpi.b  #$1, ($4d9,A5)
                bne     _bu_huanmajia_
                jmp     _bianshen_mj_
                
                
;-----------------------------马甲兵（2、4、5、6、8、ffff10）---------------------------------------                
_majia_
                cmpi.b  #$1, ($4d9,A5)          ;检测是否第2关
                beq     _majia_2_cj_            ;是，跳到第2关场景检测
                cmpi.b  #$3, ($4d9,A5)          ;检测是否第4关
                beq     _majia_4_cj_            ;是，跳到第4关场景检测
                cmpi.b  #$4, ($4d9,A5)          ;检测是否第5关
                beq     _majia_5_cj_            ;是，跳到第5关场景检测
                cmpi.b  #$5, ($4d9,A5)          ;检测是否第6关
                beq     _majia_6_cj_            ;是，跳到第6关场景检测
                cmpi.b  #$7, ($4d9,A5)          ;检测是否第8关
                beq     _majia_8_cj_            ;是，跳到第8关场景检测                
                jmp     _bu_huanmajia_

_majia_2_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第二关第三场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$8,$ffff10.l           ;将马甲标签移到内存ffff10，作为变身参照标签
                jmp     _bianshen_mj_           ;跳到变身程序
                
_majia_4_cj_                
                cmpi.b  #$2, ($786,A5)          ;是否第四关第三场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$8,$ffff10.l           ;将马甲标签移到内存ffff10，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_majia_5_cj_
                cmpi.b  #$1, ($786,A5)          ;是否第5关第2场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$8,$ffff10.l           ;将马甲标签移到内存ffff10，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_majia_6_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第6关第3场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$8,$ffff10.l           ;将马甲标签移到内存ffff10，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序
                
_majia_8_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第8关第4场景
                beq     _bu_huanmajia_
                addq.b  #1, $ffffb0.l
                add.w  #$8,$ffff10.l           ;将马甲标签移到内存ffff10，作为变身参照标签                
                jmp     _bianshen_mj_           ;跳到变身程序                
                

;---------------------------猎人(2、4、6、7、8、ffff20)---------------------------------------------------------                 
_lieren_
                cmpi.b  #$1, ($4d9,A5)          ;检测是否第2关
                beq     _lieren_2_cj_           ;
                cmpi.b  #$3, ($4d9,A5)          ;检测是否第4关
                beq     _lieren_4_cj_           ;
                cmpi.b  #$5, ($4d9,A5)          ;检测是否第6关
                beq     _lieren_6_cj_           ;
                cmpi.b  #$6, ($4d9,A5)          ;检测是否第7关
                beq     _lieren_7_cj_           ;
                cmpi.b  #$7, ($4d9,A5)          ;检测是否第8关
                beq     _lieren_8_cj_           ;                
                jmp     _bu_huanmajia_          ;以上关卡都不是，则不换马甲
                
_lieren_2_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第二关第三场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w  #$34,$ffff20.l           ;否，则把猎人标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lieren_4_cj_
                cmpi.b  #$2, ($786,A5)          ;是否第4关第三场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$34,$ffff20.l           ;否，则把猎人标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lieren_6_cj_                
                cmpi.b  #$2, ($786,A5)          ;是否第6关第3场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$34,$ffff20.l           ;否，则把猎人标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lieren_7_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第7关第4场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$34,$ffff20.l           ;否，则把猎人标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序

_lieren_8_cj_
                cmpi.b  #$3, ($786,A5)          ;是否第8关第4场景
                beq     _bu_huanmajia_          ;是，则跳到不换马甲
                add.w   #$34,$ffff20.l           ;否，则把猎人标签移到内存，作为变身标签                
                jmp     _bianshen_mj_           ;跳到变身程序
                

;---------------------------------------------------------------------------------------- 


_bianshen_mj_
                move.w  #$90, ($20,A6)          ;把小兵马甲换成马云，启动变身
                jmp     _bu_huanmajia_
_huanmajia_
                move.w  #$28, ($20,A6)          ;换成胖子马甲，尸体会消失
_bu_huanmajia_                
                movea.l $fffff4.l, A5
                move.l  #$4000000, ($4,A6)
                rts

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
