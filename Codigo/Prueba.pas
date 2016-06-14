Program Prueba;
Uses
    crt, sysutils, windows, dreamTeam;
Var
   sal, aleatStr, input: string;
   i, j, cont, Punt: integer;
   flag: boolean;

Procedure GuardarNum;
type
    jugador = record
        Apellido: string[30];
        Nombre: string[30];
        Puntaje: integer;
    end;

var
Arch:file of jugador;
Reg:jugador;

begin
Assign(Arch,'C:\Users\USER\Desktop\Dream Team\DreamTeam\Codigo\Puntuacion.txt');
Rewrite(Arch);
Write('Ingrese Nombre: '); readln(Reg.Nombre);
Write('Ingrese Apellido: '); readln(Reg.Apellido);
Reg.Puntaje:= Punt;
writeln ('Nombre: ',Reg.Nombre,' Apellido: ',Reg.Apellido,' Puntaje: ',Reg.Puntaje, ' Pts');
write(Arch,Reg);
delay(500);
close(Arch);
end;


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
     Delay(4000);
     cont:= 3;
     Punt:= 0;
     flag:= true;
     While (cont > 0) and (flag) Do
     Begin
          ClrScr;
          Writeln('Cual era el numero???');
          Readln(input);
          If (aleatStr = input) Then
          Begin
               Writeln('CORRECTO!!');
               case cont of
                   3: Punt:= Punt + 10;
                   2: Punt:= Punt + 5;
                   1: Punt:= Punt + 2;
               end;
               flag:= false;
          End
          Else
          Begin
              cont:= cont - 1;
              Writeln('LO SIENTO, FALLASTE! TE QUEDAN ', cont, ' INTENTOS');
              Delay(1000);
          End;
     End;
     ClrScr;
     If cont = 0 Then
     Begin
          Writeln('HAS PERDIDO!');
          GuardarNum;
          Punt:=0;
     End;
     Delay(1000);
End.

