01070E: 7000                       moveq   #$0, D0
010710: 102D 04F3                  move.b  ($4f3,A5), D0
010714: 0C00 0003                  cmpi.b  #$3, D0
010718: 6400 00DA                  bcc     $107f4
01071C: D040                       add.w   D0, D0
01071E: D040                       add.w   D0, D0