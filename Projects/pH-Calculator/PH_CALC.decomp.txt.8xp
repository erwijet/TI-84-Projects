"pH / pOH Calculator (decomp) [v1.2]"
"Source Code & Binaries (c) (AGPL-v3) 2019 Tyler Holewinski"
"dist. http://github.com/erwijet/Ti-84-projects"
"Untokenized Source Code intened for TokenIDE.exe"
"Avalible at ticalc.org/pub/win/tokens.zip"
"Special thanks to Ms. Deirdre Reeves"
"Westosha Central High School"
"D: Input Data"
"I: iterator"
"[A]: pH, pOH, [H+], [OH-]"

{4,1→dim([A]
Menu("Given Info","PH",PH,"POH",PO,"[H+]/[H3O+]",CH,"[OH-]",CO

"Calculate based on PH
Lbl PH
Input "PH Level: ",D

If D<0 or D>14
Then
  Disp "PH Domain Error"
  Goto ER
End

D→[A](1,1
abs((D-14))→[A](2,1
₁₀^(0-D)→[A](3,1
₁₀^(0-([A](2,1)→[A](4,1

"Exit
Goto RT

"Calculate based on PHO
Lbl PO
Input "POH Level: ",D
If D<0 or D>14
Then
  Disp "POH Domain Error"
  Goto ER
End

D→[A](2,1
(14-D)→[A](1,1
₁₀^(0-[A](1,1))→[A](3,1
₁₀^(0-D)→[A](4,1

"Exit
Goto RT

"Calculate based on [H+]
Lbl CH
Input "Molar [H+]: ",D
D→[A](3,1
0-log(D→[A](1,1
14-[A](1,1→[A](2,1
₁₀^(0-[A](2,1))→[A](4,1

Goto RT

"Calculate based on [OH-]
Lbl CO
Input "Molar [OH-]: ",D
D→[A](4,1
(0-log(D))→[A](2,1
14-[A](2,1)→[A](1,1
₁₀^(0-[A](1,1→[A](3,1

"Clean Exit
Lbl RT
ClrHome

Disp "----------------
Fix 3
1→I
While I<5
  If I>2
    Sci
  Disp [A](I,1)
  I+1→I
End

Output(2,1,"PH 
Output(3,1,"POH
Output(4,1,"M[H+]
Output(5,1,"M[OH-]

" Quick Exit & Error catch
Lbl ER

"Cleanup

"Reset number modes
Float
Normal

"Clean registries
DelVar [A]
DelVar X
DelVar I
DelVar D
DelVar Str1

"----------------
