Program Game;

Uses
    crt, sysutils, dos, dreamTeam;

Var
   sal, resgPos, frase: string;
   aleat, desorden: string;
   j,i, pos: integer;
   flag1, flag2: Boolean;

begin

     Dibujando('Visualice el numero', 0, 1, 14);

     aleat:= GenNum();
     Dibujando(aleat, 0, 30, 30);

     Randomize;
     desorden:= '';
     resgPos:='000000';
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
                    desorden:= desorden + aleat[pos];
                    j:= j+1;
                    If (j > 6) and (desorden <> aleat) Then
                    Begin
                         flag1:= False;
                    End
                    Else
                    Begin
                         If (j > 6) and (desorden = aleat) Then
                            j:= 1;
                    End;
               End;
          End;
     End;
  
     Delay(5000);

     clrscr;
     For j:= 1 to 8 Do  {Bucle de cantidad de filas de la letra}
     Begin
          sal:= '';
          For i:= 1 to length(desorden) Do {Bucle cantidad de digitos del numero}
          Begin
               Delay(50);
               sal:= sal + DibujarNum(desorden[i], j) + ' ';
          End;
          GoToXY(20,15+j);
          Writeln(sal);
     End;


     ReadKey;

end.
