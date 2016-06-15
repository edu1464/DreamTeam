Program pruebaaaa;
uses sysutils, crt, dos, math, dreamTeam;

var
   a, b: string;
      flag1, flag2: boolean;
   pos: integer;
   desorden, resgPos: string;
   i, j: integer;
   num:string;
begin
     num:= GenNum();
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
                    If (j > 6) and (desorden <> num) Then
                    Begin
                         flag1:= False;
                    End
                    Else
                    Begin
                         If (j > 6) and (desorden = num) Then
                            j:= 1;
                    End;
               End;
          End;
     End;
  
     Writeln(num);
     writeln(desorden);
     writeln(NumeroDesordenado(num));
     readkey;
end.
