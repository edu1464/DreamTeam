Unit dreamTeam;

Interface

Function OrdenarNum(str: string): string;
Function GenNum():string;
Function isNumber(num:Char):Boolean;
Function DibujarNum(digit: char; fila: integer):string;
Function NumeroDesordenado(num: string):string;

Implementation

Uses
    sysutils, crt, dos, math;

Var
   i, j: integer;

Function OrdenarNum(str: string): string;


Var
   num: char;

Begin
     For i := 2 to 6 Do
     Begin
          num:=str[i];
          j:=i-1;
          While (j > 0) and ( num < str[j] ) Do
          Begin
               str[j+1]:= str[j];
               j:= j - 1;
          End;
          str[j+1]:= num;
     End;
     OrdenarNum:= str;
End;

Function GenNum:string;

Var
   aleat: integer;
   aleatStr: string;
Begin
     Randomize;
      aleat := Random(999999);
      aleatStr:= intToStr(aleat);
      For i:= 1 to (6 - length(aleatStr)) Do
      Begin
           aleatStr:= '0' + aleatStr;
      End;
      GenNum:= aleatStr;
End;

Function isNumber(num:Char):Boolean;
Begin
     If num in ['0'..'9'] Then
     Begin
          isNumber:= True;
     End
     Else
     Begin
          isNumber:= False;
     End;
End;

Function DibujarNum(digit: char; fila: integer):string;

Var
   sal1: string;
   row: string;
   SecNum: Text;
   flag: Boolean;

Begin
     Assign(SecNum, 'D:\Eduardo\UTN FRRe\Algoritmos\2016\Repo TPI Pascal 2\Codigo\AsciiArtNumero.txt');
     Reset(SecNum);
     sal1:= '';
     flag:= true;
     Readln(SecNum, row);
     While not eof(SecNum) and flag Do
     Begin
     If (row[1] = digit) Then
     Begin
        If row[2] = intToStr(fila) Then
          Begin
               {For i:= 2 to length(row) Do
               Begin
                    sal1:= sal1 + row[i];
                    i:= i + 1;

               End;}
               sal1:= Copy(row, 3, length(row) - 2);
               flag:= false;
          End;
     End;
     Readln(SecNum, row);
     End;
     Close(SecNum);
     DibujarNum:= sal1;
End;

Function NumeroDesordenado(num: string): string;
var
   flag1, flag2: boolean;
   pos: integer;
   desorden, resgPos: string;
   i, j: integer;
begin
     writeln(num);
     desorden:= '';
     resgPos:='000000';
     Randomize;
     flag1:= True;
     j:= 1;
     While flag1 Do
     Begin
          flag2:= True;
          pos:= Random(7);
          If pos > 0 Then
          Begin
               For i:= 1 to 6 Do
               Begin
                    If (resgPos[i] = intToStr(pos)[1]) and (flag2) Then
                       flag2:= False;
               End;

               If flag2 Then
               Begin
                    resgPos[j]:=(intToStr(pos)[1]);
                    desorden:= desorden + num[pos];
                    j:= j+1;
                    If j > 6 Then
                    Begin
                         flag1:= False;
                    End;
               End;
          End;
     End;
     NumeroDesordenado:= num;

End;



End.

