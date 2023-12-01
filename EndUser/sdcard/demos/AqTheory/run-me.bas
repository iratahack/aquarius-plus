1 LOAD"data/aqtitle.scr",12288
2 LOAD"data/aquarius.saq",@60,0
4 PLAY SAMPLE @60,0
5 GOTO 60
6 PSG 8,15,9,15,10,15:REM abc vol 15
10 PSG 0,148,1,1:REM Db4 in a
11 PSG 2,224,3,1:REM Bb3 in b
12 PSG 4,129,5,2:REM F3  in c
13 PSG 7,56:REM abc on
14 GOSUB 900:GOSUB 900:REM 2/8
15 PSG 7,63:REM abc off
20 PSG 0,104,1,1:REM Eb4 in a
21 PSG 2,224,3,1:REM Bb3 in b
22 PSG 4,93,5,2:REM  Gb3 in c
23 PSG 7,56:REM abc on
24 GOSUB 900:GOSUB 900
25 GOSUB 900:GOSUB 900
26 PSG 7,63:REM abc off
30 PSG 0,148,1,1:REM Db4 in a
31 PSG 2,27,3,2:REM  Ab3 in b
32 PSG 4,129,5,2:REM F3  in c
33 PSG 7,56:REM abc on
34 GOSUB 900:GOSUB 900:REM 2/8
35 PSG 7,63:REM abc off
40 PSG 0,224,1,1:REM Bb3 in a
41 PSG 2,129,3,2:REM F3  in b
42 PSG 4,39,5,3:REM  Db3 in c
43 PSG 7,56:REM abc on
44 GOSUB 900:GOSUB 900:GOSUB 900
47 GOSUB 1000
50 PSG 7,63:REM abc off
60 REM Main Loop Here
70 GOSUB 2000:REM Wait
80 IF INKEY$="" GOTO 80
100 LOAD"data/aqcol01.scr",12288
110 GOSUB 2000:REM Wait
120 IF INKEY$="" GOTO 110
130 LOAD"data/aqcol02.scr",12288
140 GOSUB 2000:REM Wait
150 IF INKEY$="" GOTO 140
160 LOAD"data/aqgfx01.scr",12288
170 GOSUB 2000:REM Wait
180 IF INKEY$="" GOTO 170
185 GOSUB 3000
190 LOAD"data/aqgfx02.scr",12288
200 GOSUB 2000:REM Wait
210 IF INKEY$="" GOTO 200
220 LOAD"data/aqgfx03.scr",12288
230 GOSUB 2000:REM Wait
240 IF INKEY$="" GOTO 230
250 LOAD"data/aqgfx04.scr",12288
260 GOSUB 2000:REM Wait
270 IF INKEY$="" GOTO 260
280 LOAD"data/aqgfx05.scr",12288
290 GOSUB 2000:REM Wait
300 IF INKEY$="" GOTO 290
310 LOAD"data/aqgfx06.scr",12288
320 GOSUB 2000:REM Wait
330 IF INKEY$="" GOTO 310
340 LOAD"data/aqcred.scr",12288
350 GOSUB 2000:REM Wait
360 IF INKEY$="" GOTO 340
370 CLS
400 END
900 REM Quick Pause
901 FOR I=1 TO 175:NEXT:RETURN
1000 REM Volume Fade Out
1001 FOR Q=0 TO 15
1005 P=15 - Q
1010 PSG 8,P,9,P,10,P:REM abc at p
1020 FOR T=1 TO 150:NEXT
1025 NEXT
1030 RETURN
2000 REM Long pause
2001 FOR I=1TO1000:NEXT:RETURN
3000 REM Animation GFX01
3100 REM 8-frame Animation
3110 LOAD"data/aqgfx01a.scr",12288
3115 GOSUB 3300
3120 LOAD"data/aqgfx01b.scr",12288
3125 GOSUB 3300
3130 LOAD"data/aqgfx01c.scr",12288
3135 GOSUB 3300
3140 LOAD"data/aqgfx01d.scr",12288

3145 GOSUB 3300
3150 LOAD"data/aqgfx01e.scr",12288
3155 GOSUB 3300
3160 LOAD"data/aqgfx01f.scr",12288
3165 GOSUB 3300
3170 LOAD"data/aqgfx01g.scr",12288
3175 GOSUB 3300
3180 LOAD"data/aqgfx01h.scr",12288
3185 GOSUB 3300
3190 IF INKEY$="" GOTO 3100
3200 CLS
3210 RETURN
3300 REM Quick Tick
3310 FOR T=1TO50
3320 NEXT
3330 RETURN