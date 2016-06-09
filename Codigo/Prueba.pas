Program Prueba;
Uses
    crt, sysutils, windows, dreamTeam;
Var
   sal, aleatStr, input: string;
   i, j, cont: integer;
   flag: boolean;


Begin
     textColor(green);
     aleatStr := GenNum;
     For j:= 1 to 7 Do  {Bucle de cantidad de filas de la letra}
     Begin
          sal:= '';
          For i:= 1 to 6 Do {Bucle cantidad de digitos del numero}
          Begin
               sal:= sal + DibujarNum(aleatStr[i], j) + '     ';
          End;
          GoToXY(40,15+j);
          Writeln(sal);
     End;
     Delay(5000);
     cont:= 3;
     flag:= true;
     While (cont > 0) and (flag) Do
     Begin
          ClrScr;
          Writeln('Cual era el numero???');
          Readln(input);
          If (aleatStr = input) Then
          Begin
               Writeln('CORRECTO!!');
               flag:= false;
          End
          Else
          Begin
              cont:= cont - 1;
              Writeln('LO SIENTO, FALLASTE! TE QUEDAN ', cont, ' INTENTOS');
              Delay(1800);
          End;
     End;
     ClrScr;
     If cont = 0 Then
     Begin
          Writeln('PERDISTE PERDEDOR!');
     End;
     Delay(3000);
End.

