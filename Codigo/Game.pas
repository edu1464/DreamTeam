Program Game;

Uses
    crt, sysutils, dos, dreamTeam;

Var
   sal, resgPos, frase: string;
   aleat, desorden, numIngresado: string;
   j,i, pos, cont: integer;
   flag1, flag2, salir: Boolean;

begin

     Dibujando('Visualice el numero', 0, 1, 14);

     aleat:= GenNum();
     Dibujando(aleat, 0, 30, 30);

     {Desorden del numero}
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
  
     Delay(5000); {Espera de 5 seg para memorizar el numero}

     salir:= True;
     cont:= 3;
     While salir Do
     Begin
          clrscr;
          Dibujando(desorden, 0, 30, 30);
          GoToXY(30, 50);
          Readln(numIngresado);
          If cont > 1 Then
          Begin
               If numIngresado = aleat Then
               Begin
                    salir:= False;
               End
               Else
               Begin
                    ClrScr;
                    cont:= cont - 1;
                    Dibujando('Te queda ' + intToStr(cont) + ' vidas', 0, 1, 20);
                    Delay(2000);
               End;
          End
          Else
          Begin
               ClrScr;
               Dibujando('PERDISTE', 20, 20, 20);
               salir:= False;
          End;
     End;
     ReadKey;

end.