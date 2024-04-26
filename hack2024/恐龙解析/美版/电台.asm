0214F0: 246E 0042                  movea.l ($42,A6), A2
0214F4: 3600                       move.w  D0, D3
0214F6: 0243 FFE0                  andi.w  #$ffe0, D3
0214FA: 0C2D 0002 04D9             cmpi.b  #$2, ($4d9,A5)
021500: 671E                       beq     $21520
021502: E043                       asr.w   #8, D3
021504: 7400                       moveq   #$0, D2
021506: 142E 0041                  move.b  ($41,A6), D2
02150A: C6C2                       mulu.w  D2, D3
02150C: 3401                       move.w  D1, D2
02150E: 0242 FFE0                  andi.w  #$ffe0, D2
021512: E042                       asr.w   #8, D2
021514: D642                       add.w   D2, D3
021516: D643                       add.w   D3, D3
021518: 45F2 3000                  lea     (A2,D3.w), A2
02151C: 3A12                       move.w  (A2), D5
02151E: 4E75                       rts
021520: 0C43 4D00                  cmpi.w  #$4d00, D3
021524: 65DC                       bcs     $21502
021526: 0443 0F00                  subi.w  #$f00, D3
02152A: 60F4                       bra     $21520
02152C: 7400                       moveq   #$0, D2
02152E: 3405                       move.w  D5, D2
021530: EF4A                       lsl.w   #7, D2
021532: 3600                       move.w  D0, D3
021534: 0243 00E0                  andi.w  #$e0, D3
021538: E24B                       lsr.w   #1, D3
02153A: D443                       add.w   D3, D2
02153C: 3601                       move.w  D1, D3
02153E: 0243 00E0                  andi.w  #$e0, D3
021542: E84B                       lsr.w   #4, D3
021544: 383C 000E                  move.w  #$e, D4
021548: 9843                       sub.w   D3, D4
02154A: D444                       add.w   D4, D2
02154C: 7A00                       moveq   #$0, D5
02154E: 1A2D 04D9                  move.b  ($4d9,A5), D5
021552: E54D                       lsl.w   #2, D5
021554: 227B 5008                  movea.l ($8,PC,D5.w), A1
021558: 43F1 2000                  lea     (A1,D2.w), A1
02155C: 4E75                       rts