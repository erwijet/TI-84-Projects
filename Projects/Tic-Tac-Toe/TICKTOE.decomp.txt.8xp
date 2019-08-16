"Tic Tac Toe for TI-84 (decomp) [v1.0]"
"Source Code & Binaries (c) (AGPL-v3) 2019 Tyler Holewinski"
"dist. http://github.com/erwijet/Ti-84-projects"
"Untokenized Source Code intened for TokenIDE.exe"
"Avalible at ticalc.org/pub/win/tokens.zip"

1→C
1→D
20→U

0→M
1→K
2→L

320→E
240→F

(E/3)→O
(E/6)→P
(F/3)→R
(F/6)→S

{3,3}→dim([A])
Fill(M,[A])
K→B

AxesOff
0→Xmin
0→Ymin
E→Xmax
F→Ymax

K→B

Goto Z

Lbl Y

ClrDraw
If B=K
Then
Text(⁻1,28,17,"Player 2 wins!")
Text(38,22,"Press a key to exit")
Repeat getKey
End
Goto AA
End

Text(⁻1,28,17,"Player 1 wins!")
Text(38,22,"Press a key to exit")
Repeat getKey
End
Goto AA

Lbl Z

While 1=1
ClrDraw

Line(O,0,O,F)
Line(O*2,0,O*2,F)
Line(0,R,E,R)
Line(0,R*2,E,R*2)

3→I
3→J
While I>0
3→J
While J>0
((J*O)-P)→V
F-((I*R)-S)→W
If [A](I,J)=K
Then
Line(V-U,W+U,V+U,W-U)
Line(V-U,W-U,V+U,W+U)
End
If [A](I,J)=L
Then
Circle(V,W,U)
End
J-1→J
End
I-1→I
End

((C*O)-P)→V
F-((D*R)-S)→W
Line(V,W+U,V,W-U)
Line(V-U,W,V+U,W)
Repeat T
getKey→T
End

If T=24
Then
C-1→C
If C<1
3→C
End
If T=26
Then
C+1→C
If C>3
1→C
End
If T=25
Then
D-1→D
If D<1
3→D
End
If T=34
Then
D+1→D
If D>3
1→D
End
If T=105
Then
If [A](D,C)=M
Then
B→[A](D,C)

If B=K
Then
L→B
Else
K→B
End

If [A](D,1)≠M and [A](D,1)=[A](D,2) and [A](D,1)=[A](D,3)
Then
Goto Y
End

If [A](1,C)≠M and [A](1,C)=[A](2,C) and [A](1,C)=[A](3,C)
Then
Goto Y
End

If [A](1,1)≠M and [A](1,1)=[A](2,2) and [A](1,1)=[A](3,3)
Then
Goto Y
End

If [A](2,2)≠M and [A](1,3)=[A](2,2) and [A](1,3)=[A](3,1)
Then
Goto Y
End
End
End

0→X
3→I
3→J
While I>0
3→J
While J>0
If [A](I,J)=M
1→X
J-1→J
End
I-1→I
End

If X=0
Then
ClrDraw
Text(⁻1,28,17,"Cat's Game!")
Text(38,22,"Press a key to exit")
Repeat getKey
End
Goto AA
End
End

Lbl AA

ClrHome
ClrDraw
AxesOn

DelVar [A]
DelVar B
DelVar C
DelVar D
DelVar E
DelVar F
DelVar K
DelVar L
DelVar M
DelVar O
DelVar P
DelVar R
DelVar S
DelVar T
DelVar U
DelVar V
DelVar W
DelVar X

""
