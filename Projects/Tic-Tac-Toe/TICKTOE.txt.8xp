﻿"Tic Tac Toe for TI-84 [v1.0]"
"Source Code & Binaries (c) (AGPL-v3) 2019 Tyler Holewinski"
"dist. http://github.com/erwijet/Ti-84-projects"
"Untokenized Source Code intened for TokenIDE.exe"
"Avalible at ticalc.org/pub/win/tokens.zip"

#define board [A]
#define currentPlayer B
#define sx C
#define sy D
#define width E
#define height F
#define player1 K
#define player2 L
#define empty M
#define thirdW O
#define sixthW P
#define thirdH R
#define sixthH S
#define code T
#define SIZE U
#define centerX V
#define centerY W
#define spacesLeft X
#define _win Y
#define _start Z
#define _end AA

// Key codes
#define LEFT_ARROW 24
#define RIGHT_ARROW 26
#define UP_ARROW 25
#define DOWN_ARROW 34
#define ENTER_KEY 105

1→sx
1→sy
20→SIZE

0→empty
1→player1
2→player2

320→width
240→height

(width/3)→thirdW
(width/6)→sixthW
(height/3)→thirdH
(height/6)→sixthH

{3,3}→dim(board)
Fill(empty,board)
player1→currentPlayer

AxesOff
0→Xmin
0→Ymin
width→Xmax
height→Ymax

// x's go first
player1→currentPlayer

Goto _start

Lbl _win

ClrDraw
If currentPlayer=player1
Then
  Text(⁻1,28,17,"Player 2 wins!")
  Text(38,22,"Press a key to exit")
  Repeat getKey
  End
  Goto _end
End

Text(⁻1,28,17,"Player 1 wins!")
Text(38,22,"Press a key to exit")
Repeat getKey
End
Goto _end

Lbl _start

While 1=1
  ClrDraw
  
  // Draw board
  Line(thirdW,0,thirdW,height)
  Line(thirdW*2,0,thirdW*2,height)
  Line(0,thirdH,width,thirdH)
  Line(0,thirdH*2,width,thirdH*2)
  
  // Draw board selections
  3→I
  3→J
  While I>0
    3→J
    While J>0
      ((J*thirdW)-sixthW)→centerX
      height-((I*thirdH)-sixthH)→centerY
      If board(I,J)=player1
      Then
        Line(centerX-SIZE,centerY+SIZE,centerX+SIZE,centerY-SIZE)
        Line(centerX-SIZE,centerY-SIZE,centerX+SIZE,centerY+SIZE)
      End
      If board(I,J)=player2
      Then
        Circle(centerX,centerY,SIZE)
      End
      J-1→J
    End
    I-1→I
  End
  
  // Draw current selection cursor
  ((sx*thirdW)-sixthW)→centerX
  height-((sy*thirdH)-sixthH)→centerY
  Line(centerX,centerY+SIZE,centerX,centerY-SIZE)
  Line(centerX-SIZE,centerY,centerX+SIZE,centerY)
  // Wait until key input
  Repeat code
    getKey→code
  End
  
  // Handle input
  If code=LEFT_ARROW
  Then
    sx-1→sx
    If sx<1
      3→sx
  End
  If code=RIGHT_ARROW
  Then
    sx+1→sx
    If sx>3
      1→sx
  End
  If code=UP_ARROW
  Then
    sy-1→sy
    If sy<1
      3→sy
  End
  If code=DOWN_ARROW
  Then
    sy+1→sy
    If sy>3
      1→sy
  End
  If code=ENTER_KEY
  Then
    If board(sy,sx)=empty
    Then
      currentPlayer→board(sy,sx)
      
      // Pass the turn
      If currentPlayer=player1
      Then
        player2→currentPlayer
      Else
        player1→currentPlayer
      End
        
      // Check horizontal win condition
      If board(sy,1)≠empty and board(sy,1)=board(sy,2) and board(sy,1)=board(sy,3)
      Then
        Goto _win
      End
      
      // Check vertical win condition
      If board(1,sx)≠empty and board(1,sx)=board(2,sx) and board(1,sx)=board(3,sx)
      Then
        Goto _win
      End
      
      // Check diagnal win condition (left to right)
      If board(1,1)≠empty and board(1,1)=board(2,2) and board(1,1)=board(3,3)
      Then
        Goto _win
      End
      
      // Check diagnal win condition (right to left)
      If board(2,2)≠empty and board(1,3)=board(2,2) and board(1,3)=board(3,1)
      Then
        Goto _win
      End
    End
  End
  
  0→spacesLeft
  3→I
  3→J
  While I>0
    3→J
    While J>0
      If board(I,J)=empty
        1→spacesLeft
      J-1→J
    End
    I-1→I
  End
  
  If spacesLeft=0
  Then
    // Cat's game
    ClrDraw
    Text(⁻1,28,17,"Cat's Game!")
    Text(38,22,"Press a key to exit")
    Repeat getKey
    End
    Goto _end
  End
End

Lbl _end
// Cleanup

ClrHome
ClrDraw
AxesOn

DelVar board
DelVar currentPlayer
DelVar sx
DelVar sy
DelVar width
DelVar height
DelVar player1
DelVar player2
DelVar empty
DelVar thirdW
DelVar sixthW
DelVar thirdH
DelVar sixthH
DelVar code
DelVar SIZE
DelVar centerX
DelVar centerY
DelVar spacesLeft

""
