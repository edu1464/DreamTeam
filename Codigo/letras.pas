Program letras;

uses crt, dreamTeam, dos, sysutils;
var
   frase, sal: string;
   i, j: integer;

begin

     frase:= 'ABACA1';
  For j:= 1 to 8 Do  {Bucle de cantidad de filas de la letra}
     Begin
          sal:= '';
          For i:= 1 to length(frase) Do {Bucle cantidad de digitos del numero}
          Begin
               Delay(50);
               sal:= sal + DibujarNum(frase[i], j) + ' ';
          End;
          GoToXY(40,15+j);
          Writeln(sal);
     End;

     readkey;

end.
