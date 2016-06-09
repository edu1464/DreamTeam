 Program NumerosAleatorios;

 Uses
     crt, sysutils, dos, dreamTeam;

 Var
    aleatStr, ordenNum: string;
    i: integer;

 Begin
      aleatStr := GenNum;
      ordenNum := OrdenarNum(aleatStr);
      Writeln(aleatStr);
      Writeln(ordenNum);

      For i:= 1 to 6 Do
      Begin
           Case ordenNum[i] of

                '0': Write('0');
           else
               Writeln('False');
           End;
       End;
      ReadKey;
 End.
