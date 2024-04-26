0752EC: 6100 0032                  bsr     $75320		;NOP掉，打破网纱门无法前进
0752F0: 700C                       moveq   #$c, D0
0752F2: 7201                       moveq   #$1, D1
0752F4: 046E 0030 0010             subi.w  #$30, ($10,A6)
0752FA: 4EB9 0009 4640             jsr     $94640.l
075300: 066E 0030 0010             addi.w  #$30, ($10,A6)
075306: 066E 0020 000C             addi.w  #$20, ($c,A6)
07530C: 4EB9 0000 121E             jsr     $121e.l
075312: 1D7C 0002 0005             move.b  #$2, ($5,A6)
075318: 6198                       bsr     $752b2
07531A: 4EF9 0000 49C0             jmp     $49c0.l
075320: 302E 0026                  move.w  ($26,A6), D0
075324: 41F9 0007 5352             lea     $75352.l, A0
07532A: 2070 0000                  movea.l (A0,D0.w), A0
07532E: 43FA 002E                  lea     ($2e,PC), A1; ($7535e)
075332: 303C 03FF                  move.w  #$3ff, D0
075336: 7A0C                       moveq   #$c, D5
075338: 7805                       moveq   #$5, D4
07533A: C150                       and.w   D0, (A0)
07533C: 3219                       move.w  (A1)+, D1
07533E: 8358                       or.w    D1, (A0)+
075340: 5448                       addq.w  #2, A0
075342: 51CC FFF6                  dbra    D4, $7533a
075346: D1FC 0000 0028             adda.l  #$28, A0
07534C: 51CD FFEA                  dbra    D5, $75338
075350: 4E75                       rts

*=================================敌兵循环=====================================
023420: 4DED 48F4                  lea     ($48f4,A5), A6
023424: 3E3C 0017                  move.w  #$17, D7
023428: 4A2E 0000                  tst.b   ($0,A6)
02342C: 6708                       beq     $23436
02342E: 6100 0010                  bsr     $23440
023432: 6100 002A                  bsr     $2345e
023436: 4DEE 00E0                  lea     ($e0,A6), A6
02343A: 51CF FFEC                  dbra    D7, $23428
02343E: 4E75                       rts
023440: 4E75                       rts
023442: 0C2D 0007 04D9             cmpi.b  #$7, ($4d9,A5)
023448: 6600 0012                  bne     $2345c
02344C: 0C2D 0003 0786             cmpi.b  #$3, ($786,A5)
023452: 6600 0008                  bne     $2345c
023456: 4A6E 0020                  tst.w   ($20,A6)
02345A: 67FA                       beq     $23456
02345C: 4E75                       rts
02345E: 7000                       moveq   #$0, D0
023460: 302E 0020                  move.w  ($20,A6), D0
023464: 227B 0806                  movea.l ($6,PC,D0.l), A1
023468: 7000                       moveq   #$0, D0
02346A: 4ED1                       jmp     (A1)
02346C: 0003 3334                  ori.b   #$34, D3		*$0
023470: 0000 0000                  ori.b   #$0, D0		*$4
023474: 0003 383A                  ori.b   #$3a, D3		*$8	马甲
023478: 0003 58B2                  ori.b   #$b2, D3		*$C	链球
02347C: 0003 6A64                  ori.b   #$64, D3		*$10	6BOSS
023480: 0003 8DDE                  ori.b   #$de, D3		*$14	对话屠夫
023484: 0003 9272                  ori.b   #$72, D3		*$18	狮子
023488: 0003 B104                  ori.b   #$4, D3		*$1C	狮子口水毒气
02348C: 0003 B28A                  ori.b   #$8a, D3		*$20	待测试？？？续命下来的流弹
023490: 0003 B7D6                  ori.b   #$d6, D3		*$24	清除每个敌兵内存位血量为0，可能序幕用到吧
023494: 0003 B828                  ori.b   #$28, D3		*$28	胖子
023498: 0003 D960                  ori.b   #$60, D3		*$2C	丛林猎人开枪惊飞鸟小动画
02349C: 0003 DC5C                  ori.b   #$5c, D3		*$30	同上，迅猛龙惊跑
0234A0: 0003 DDEA                  ori.b   #$ea, D3		*$34	猎人
0234A4: 0004 020E                  ori.b   #$e, D4		*$38	刀兵
0234A8: 0004 1F1A                  ori.b   #$1a, D4		*$3C	下水道喷火口打破冒烟动画
0234AC: 0004 20EA                  ori.b   #$ea, D4		*$40	凯迪拉克
0234B0: 0004 23A4                  ori.b   #$a4, D4		*$44	凯迪拉克车轮
0234B4: 0004 2590                  ori.b   #$90, D4		*$48	1BOSS
0234B8: 0004 5082                  ori.b   #$82, D4		*$4C	好像是凯迪拉克从动轮
0234BC: 0004 57B0                  ori.b   #$b0, D4		*$50	猴子
0234C0: 0004 79FE                  ori.b   #$fe, D4		*$54	杰克小画面
0234C4: 0004 7C42                  ori.b   #$42, D4		*$58	巨脚
0234C8: 0004 8266                  ori.b   #$66, D4		*$5c	巨脚影子
0234CC: 0004 838C                  ori.b   #$8c, D4		*$60	霸王龙
0234D0: 0004 BE70                  ori.b   #$70, D4		*$64	4BOSS
0234D4: 0004 D48A                  ori.b   #$8a, D4		*$68	爆炸
0234D8: 0004 D900                  ori.b   #$0, D4		*$6C	4关开头蹲守的假兵
0234DC: 0004 DAB4                  ori.b   #$b4, D4		*$70	隐藏的恐龙，霸王龙儿子，无血量
0234E0: 0004 DCF6                  ori.b   #$f6, D4		*$74	迅猛龙
0234E4: 0004 FB10                  ori.b   #$10, D4		*$78	序幕动画中的霸王龙
0234E8: 0004 FCB4                  ori.b   #$b4, D4		*$7C	3BOSS
0234EC: 0005 0FAC                  ori.b   #$ac, D5		*$80	3BOSS摩托
0234F0: 0005 1158                  ori.b   #$58, D5		*$84	待测试，有主体？？？
0234F4: 0005 129E                  ori.b   #$9e, D5		*$88
0234F8: 0005 13DA                  ori.b   #$da, D5		*$8C
0234FC: 0005 1692                  ori.b   #$92, D5		*$90	马云
023500: 0005 3178                  ori.b   #$78, D5		*$94
023504: 0005 341C                  ori.b   #$1c, D5		*$98
023508: 0005 3CC6                  ori.b   #$c6, D5		*$9c
02350C: 0005 3E08                  ori.b   #$8, D5		*$a0	铁头龙
023510: 0005 5866                  ori.b   #$66, D5
023514: 0005 5B06                  ori.b   #$6, D5
023518: 0005 5F2A                  ori.b   #$2a, D5
02351C: 0005 6190                  ori.b   #$90, D5
023520: 0005 639A                  ori.b   #$9a, D5
023524: 0005 656C                  ori.b   #$6c, D5
023528: 0005 67D0                  ori.b   #$d0, D5
02352C: 0005 6924                  ori.b   #$24, D5
023530: 0005 6A70                  ori.b   #$70, D5
023534: 0005 6C80                  ori.b   #$80, D5
023538: 0005 717E                  ori.b   #$7e, D5
02353C: 0005 7298                  ori.b   #$98, D5
023540: 0005 7630                  ori.b   #$30, D5
023544: 0005 76D2                  ori.b   #$d2, D5
023548: 0005 785C                  ori.b   #$5c, D5
02354C: 0005 7C9C                  ori.b   #$9c, D5
023550: 0005 7D94                  ori.b   #$94, D5
023554: 0005 7E5E                  ori.b   #$5e, D5
023558: 0005 7FB4                  ori.b   #$b4, D5
02355C: 0005 80C6                  ori.b   #$c6, D5
023560: 0005 8498                  ori.b   #$98, D5
023564: 0005 A47C                  ori.b   #$7c, D5
023568: 0005 AA6E                  ori.b   #$6e, D5
02356C: 0005 AFC2                  ori.b   #$c2, D5
023570: 0005 B8B2                  ori.b   #$b2, D5
023574: 0005 BB8A                  ori.b   #$8a, D5
023578: 0005 BE66                  ori.b   #$66, D5
02357C: 0005 C0B6                  ori.b   #$b6, D5
023580: 0005 C2C6                  ori.b   #$c6, D5
023584: 0005 C356                  ori.b   #$56, D5
023588: 0005 C818                  ori.b   #$18, D5
02358C: 0005 DD58                  ori.b   #$58, D5
023590: 0005 E4C8                  ori.b   #$c8, D5
023594: 0005 E4F4                  ori.b   #$f4, D5
023598: 0005 E702                  ori.b   #$2, D5
02359C: 0005 EC26                  ori.b   #$26, D5
0235A0: 0005 EDF4                  ori.b   #$f4, D5
0235A4: 0005 F198                  ori.b   #$98, D5
0235A8: 0005 F5D0                  ori.b   #$d0, D5
0235AC: 0005 FF2E                  ori.b   #$2e, D5
0235B0: 0006 0158                  ori.b   #$58, D6
0235B4: 0006 06D4                  ori.b   #$d4, D6
0235B8: 0006 155C                  ori.b   #$5c, D6
0235BC: 0006 173E                  ori.b   #$3e, D6
0235C0: 0006 3778                  ori.b   #$78, D6
0235C4: 0006 3806                  ori.b   #$6, D6
0235C8: 0006 3BC4                  ori.b   #$c4, D6
0235CC: 0006 3E30                  ori.b   #$30, D6
0235D0: 0006 3E30                  ori.b   #$30, D6
0235D4: 0006 50FA                  ori.b   #$fa, D6
0235D8: 0006 54E2                  ori.b   #$e2, D6
0235DC: 0006 76FE                  ori.b   #$fe, D6
0235E0: 0006 7B32                  ori.b   #$32, D6
0235E4: 0006 7D2C                  ori.b   #$2c, D6
0235E8: 0006 995E                  ori.b   #$5e, D6
0235EC: 0006 9C98                  ori.b   #$98, D6
0235F0: 0006 9EA2                  ori.b   #$a2, D6
0235F4: 0006 A20A                  ori.b   #$a, D6
0235F8: 0006 A408                  ori.b   #$8, D6
0235FC: 0006 A5F4                  ori.b   #$f4, D6
023600: 0006 C01A                  ori.b   #$1a, D6


0233C6: 4DED 0874                  lea     ($874,A5), A6
0233CA: 3E3C 0017                  move.w  #$17, D7
0233CE: 4A2E 0000                  tst.b   ($0,A6)
0233D2: 6704                       beq     $233d8
0233D4: 6100 000C                  bsr     $233e2
0233D8: 4DEE 00C0                  lea     ($c0,A6), A6
0233DC: 51CF FFF0                  dbra    D7, $233ce
0233E0: 4E75                       rts
0233E2: 7000                       moveq   #$0, D0
0233E4: 302E 0020                  move.w  ($20,A6), D0
0233E8: 227B 0806                  movea.l ($6,PC,D0.l), A1
0233EC: 7000                       moveq   #$0, D0
0233EE: 4ED1                       jmp     (A1)
0233F0: 0002 4D44                  ori.b   #$44, D2				*0003，0000，各种武器
0233F4: 0002 7E16                  ori.b   #$16, D2				*0003，0004，各种爆炸
0233F8: 0002 83DE                  ori.b   #$de, D2				*0003，0008，无小类，子弹
0233FC: 0002 860A                  ori.b   #$a, D2				*0003，000C，开枪时枪口火光
023400: 0002 898C                  ori.b   #$8c, D2				*0003，0010，各种补给
023404: 0002 8C76                  ori.b   #$76, D2				*0003，0014，各种箱子
023408: 0002 9B06                  ori.b   #$6, D2				*0003，0018，有主体
02340C: 0002 9D1E                  ori.b   #$1e, D2				*0003，001C，火箭炮行进炮弹
023410: 0002 9EC4                  ori.b   #$c4, D2				*0003，0020，爆炸
023414: 0002 A028                  ori.b   #$28, D2				*0003，0024，各种分
023418: 0002 A39A                  ori.b   #$9a, D2				*0003，0028，霰弹枪子弹
02341C: 0002 A534                  ori.b   #$34, D2				*0003，002c，未知

*=============================0001,0000型主体=====================================
023604: 4DED 36F4                  lea     ($36f4,A5), A6
023608: 3E3C 0017                  move.w  #$17, D7
02360C: 4A2E 0000                  tst.b   ($0,A6)
023610: 6704                       beq     $23616
023612: 6100 000C                  bsr     $23620
023616: 4DEE 00C0                  lea     ($c0,A6), A6
02361A: 51CF FFF0                  dbra    D7, $2360c
02361E: 4E75                       rts
023620: 7000                       moveq   #$0, D0
023622: 302E 0020                  move.w  ($20,A6), D0
023626: 227B 0806                  movea.l ($6,PC,D0.l), A1
02362A: 7000                       moveq   #$0, D0
02362C: 4ED1                       jmp     (A1)
02362E: 0007 4FA2                  ori.b   #$a2, D7
023632: 0007 5238                  ori.b   #$38, D7
023636: 0007 542C                  ori.b   #$2c, D7
02363A: 0007 63F6                  ori.b   #$f6, D7
02363E: 0007 67D8                  ori.b   #$d8, D7
023642: 0007 69E2                  ori.b   #$e2, D7
023646: 0007 6A70                  ori.b   #$70, D7
02364A: 0007 6CD2                  ori.b   #$d2, D7
02364E: 0007 6E0E                  ori.b   #$e, D7
023652: 0007 7E76                  ori.b   #$76, D7
023656: 0007 85F0                  ori.b   #$f0, D7
02365A: 0007 89EE                  ori.b   #$ee, D7
02365E: 0007 8B52                  ori.b   #$52, D7
023662: 0007 9218                  ori.b   #$18, D7
023666: 0007 B0BE                  ori.b   #$be, D7
02366A: 0007 B336                  ori.b   #$36, D7
02366E: 0007 B520                  ori.b   #$20, D7
023672: 0007 B554                  ori.b   #$54, D7
023676: 0007 B65E                  ori.b   #$5e, D7
02367A: 0007 B7C6                  ori.b   #$c6, D7
02367E: 0007 BB68                  ori.b   #$68, D7
023682: 0007 BDC4                  ori.b   #$c4, D7
023686: 0007 BEF6                  ori.b   #$f6, D7
02368A: 0007 C0E4                  ori.b   #$e4, D7
02368E: 0007 E2D0                  ori.b   #$d0, D7
023692: 0007 E7B4                  ori.b   #$b4, D7
023696: 0007 EC48                  ori.b   #$48, D7
02369A: 0007 EEBA                  ori.b   #$ba, D7
02369E: 0007 F72A                  ori.b   #$2a, D7
0236A2: 0008                       dc.w    $0008; ILLEGAL
0236A4: 048A                       dc.w    $048a; ILLEGAL
0236A6: 0008                       dc.w    $0008; ILLEGAL
0236A8: 11DE 0008                  move.b  (A6)+, $8.w
0236AC: 1046                       dc.w    $1046; ILLEGAL
0236AE: 0008                       dc.w    $0008; ILLEGAL
0236B0: 17CE                       dc.w    $17ce; ILLEGAL
0236B2: 0008                       dc.w    $0008; ILLEGAL
0236B4: 18E4                       move.b  -(A4), (A4)+
0236B6: 0008                       dc.w    $0008; ILLEGAL
0236B8: 1B3E                       dc.w    $1b3e; ILLEGAL
0236BA: 0008                       dc.w    $0008; ILLEGAL
0236BC: 1FDE                       dc.w    $1fde; ILLEGAL
0236BE: 0008                       dc.w    $0008; ILLEGAL
0236C0: 217E                       dc.w    $217e; ILLEGAL
0236C2: 0008                       dc.w    $0008; ILLEGAL
0236C4: 2372 0008 279C             move.l  ($8,A2,D0.w), ($279c,A1)
0236CA: 0008                       dc.w    $0008; ILLEGAL
0236CC: 30C6                       move.w  D6, (A0)+
0236CE: 0008                       dc.w    $0008; ILLEGAL
0236D0: 36A4                       move.w  -(A4), (A3)
0236D2: 0008                       dc.w    $0008; ILLEGAL
0236D4: 383A 0008                  move.w  ($8,PC), D4; ($236de)
0236D8: 3A0A                       move.w  A2, D5
0236DA: 0008                       dc.w    $0008; ILLEGAL
0236DC: 3ACA                       move.w  A2, (A5)+
0236DE: 0008                       dc.w    $0008; ILLEGAL
0236E0: 3BB0 0008 3E0C             move.w  ($8,A0,D0.w), INVALID 35
0236E6: 0008                       dc.w    $0008; ILLEGAL
0236E8: 419E                       chk.w   (A6)+, D0
0236EA: 0008                       dc.w    $0008; ILLEGAL
0236EC: 4282                       clr.l   D2
0236EE: 0008                       dc.w    $0008; ILLEGAL
0236F0: 4316                       dc.w    $4316; ILLEGAL
0236F2: 0008                       dc.w    $0008; ILLEGAL
0236F4: 438E                       dc.w    $438e; ILLEGAL
0236F6: 0008                       dc.w    $0008; ILLEGAL
0236F8: 44B4 0008                  neg.l   ($8,A4,D0.w)
0236FC: 5088                       addq.l  #8, A0
0236FE: 0008                       dc.w    $0008; ILLEGAL
023700: 5178 0008                  subq.w  #8, $8.w
023704: 5306                       subq.b  #1, D6
023706: 0008                       dc.w    $0008; ILLEGAL
023708: 55A8 0008                  subq.l  #2, ($8,A0)
02370C: 574C                       subq.w  #3, A4
02370E: 0008                       dc.w    $0008; ILLEGAL
023710: 5916                       subq.b  #4, (A6)
023712: 0008                       dc.w    $0008; ILLEGAL
023714: 5B64                       subq.w  #5, -(A4)
023716: 0008                       dc.w    $0008; ILLEGAL
023718: 5E32 0008                  addq.b  #7, ($8,A2,D0.w)
02371C: 61E8                       bsr     $23706
02371E: 0008                       dc.w    $0008; ILLEGAL
023720: 63AC                       bls     $236ce
023722: 0008                       dc.w    $0008; ILLEGAL
023724: 64DA                       bcc     $23700
023726: 0008                       dc.w    $0008; ILLEGAL
023728: 65F2                       bcs     $2371c
02372A: 0008                       dc.w    $0008; ILLEGAL
02372C: 69E6                       bvs     $23714
02372E: 0008                       dc.w    $0008; ILLEGAL
023730: 6B64                       bmi     $23796
023732: 0008                       dc.w    $0008; ILLEGAL
023734: 6C14                       bge     $2374a
023736: 0008                       dc.w    $0008; ILLEGAL
023738: 6D76                       blt     $237b0
02373A: 0008                       dc.w    $0008; ILLEGAL
02373C: 881A                       or.b    (A2)+, D4
02373E: 0008                       dc.w    $0008; ILLEGAL
023740: 88B2 0008                  or.l    ($8,A2,D0.w), D4
023744: 8A84                       or.l    D4, D5
023746: 0008                       dc.w    $0008; ILLEGAL
023748: 96E6                       suba.w  -(A6), A3
02374A: 0008                       dc.w    $0008; ILLEGAL
02374C: 9746                       subx.w  D6, D3
02374E: 0008                       dc.w    $0008; ILLEGAL
023750: 9984                       subx.l  D4, D4
023752: 0008                       dc.w    $0008; ILLEGAL
023754: 9ABA 0008                  sub.l   ($8,PC), D5; ($2375e)
023758: 9B48                       subx.w  -(A0), -(A5)
02375A: 0008                       dc.w    $0008; ILLEGAL
02375C: 9DA6                       sub.l   D6, -(A6)
02375E: 0008                       dc.w    $0008; ILLEGAL
023760: 9EDE                       suba.w  (A6)+, A7
023762: 0008                       dc.w    $0008; ILLEGAL
023764: A090                       dc.w    $a090; opcode 1010
023766: 0008                       dc.w    $0008; ILLEGAL
023768: A156                       dc.w    $a156; opcode 1010
02376A: 0008                       dc.w    $0008; ILLEGAL
02376C: A3D0                       dc.w    $a3d0; opcode 1010
02376E: 0008                       dc.w    $0008; ILLEGAL
023770: A582                       dc.w    $a582; opcode 1010
023772: 0008                       dc.w    $0008; ILLEGAL
023774: A5FA                       dc.w    $a5fa; opcode 1010
023776: 0008                       dc.w    $0008; ILLEGAL
023778: AA0A                       dc.w    $aa0a; opcode 1010
02377A: 0008                       dc.w    $0008; ILLEGAL
02377C: B212                       cmp.b   (A2), D1
02377E: 0008                       dc.w    $0008; ILLEGAL
023780: B2CA                       cmpa.w  A2, A1
023782: 0008                       dc.w    $0008; ILLEGAL
023784: B34C                       cmpm.w  (A4)+, (A1)+
023786: 0008                       dc.w    $0008; ILLEGAL
023788: B428 0008                  cmp.b   ($8,A0), D2
02378C: B60E                       dc.w    $b60e; ILLEGAL
02378E: 0008                       dc.w    $0008; ILLEGAL
023790: BDDC                       cmpa.l  (A4)+, A6
023792: 0008                       dc.w    $0008; ILLEGAL
023794: C982                       dc.w    $c982; ILLEGAL
023796: 0008                       dc.w    $0008; ILLEGAL
023798: CAE0                       mulu.w  -(A0), D5
02379A: 0009                       dc.w    $0009; ILLEGAL
02379C: 15FA                       dc.w    $15fa; ILLEGAL
02379E: 0009                       dc.w    $0009; ILLEGAL
0237A0: 1CF2 0009                  move.b  ($9,A2,D0.w), (A6)+
0237A4: 1FB4 0009 21DA             move.b  ($9,A4,D0.w), INVALID 37
0237AA: 0009                       dc.w    $0009; ILLEGAL
0237AC: 2220                       move.l  -(A0), D1
0237AE: 0009                       dc.w    $0009; ILLEGAL
0237B0: 2382 0C6D                  move.l  D2, INVALID 31