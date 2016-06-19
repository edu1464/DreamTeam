Unit dreamTeam;

Interface

Function OrdenarNum(str: string): string;
Function GenNum():string;
Function isNumber(num:Char):Boolean;
Function DibujarNum(digit: char; fila: integer):string;
Function NumeroDesordenado(num: string):string;
Procedure titulo;
procedure creditos;
Procedure Dibujando(frase: string; d: integer; x: integer; y: integer);
Procedure DibujarPal(palabra: string; x,y,espaciado: integer; fuente: string);
Procedure GuardarPuntaje (puntos: integer; nombre: string);

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
   Dir: string;

Begin
     GetDir(0,Dir);
     Assign(SecNum, Dir + '\AsciiArtNumero.txt');
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

procedure titulo;   {Despues de configurar el juego, llamamos a este procedimiento para comenzar a jugar}

var
   sal, frase: string;

Begin
     frase:= 'MEMORY NUMBER';
   For i:= 1 to 2 Do
   Begin
   clrScr;

   If i = 1 Then
   Begin
         For j:= 1 to 8 Do  {Bucle de cantidad de filas de la letra}
         Begin
              sal:= '';
              For i:= 1 to length(frase) Do {Bucle cantidad de digitos del numero}
              Begin
                   Delay(15);
                   sal:= sal + DibujarNum(frase[i], j);
              End;
              GoToXY(10,15+j);
              Writeln(sal);
         End;
     End
     Else
     Begin
          Delay(600);
          ClrScr;
          For j:= 1 to 8 Do  {Bucle de cantidad de filas de la letra}
         Begin
              sal:= '';
              For i:= 1 to length(frase) Do {Bucle cantidad de digitos del numero}
              Begin
                   Delay(200);
                   sal:= sal + DibujarNum(frase[i], j);
              End;
              GoToXY(10,15+j);
              Writeln(sal);
         End;
     End;
     End;
     Delay(5000);
end;

procedure creditos;
  var
     fondo, letra : integer;
  begin
      textcolor(15);
      textbackground(11);
      clrscr;
      fondo := 15;
      letra := 1;
      textcolor(letra);
      textbackground(fondo);
      repeat
            gotoxy(55,11);write(' -----CREDITOS----- ');
            gotoxy(55,18);write(' Desarrollado por  ');
            gotoxy(55,19);write(' DREAM TEAM :  ');
            gotoxy(55,22);write(' Eduardo Garcia  ');
            gotoxy(55,24);write(' Francisco Sabbatella  ');
            gotoxy(55,26);write(' Emanuel Ruidiaz  ');
            gotoxy(55,28);write(' Facundo Uriarte');
            gotoxy(55,32);write(' Gracias por jugar :) ');
      
      delay(500);
      fondo := fondo - 1;
      if fondo = -1 then
      fondo := 15;
      letra := letra + 1;
      if letra > 15 then
      letra := 1;
      textcolor(letra);
      textbackground(fondo);
      until keypressed;
      textcolor(15);
      textbackground(0);
      clrscr;
      
end;

Procedure Dibujando(frase:string; d: integer; x: integer; y: integer);  {frase: palabra a dibujar, d: valor de delay, x: posicion x en la pantalla, y: posicion y en la pantalla}
Var
   sal: string;
Begin
     For j:= 1 to 9 Do  {Bucle de cantidad de filas de la letra}
         Begin
              sal:= '';
              For i:= 1 to length(frase) Do {Bucle cantidad de digitos del numero}
              Begin
                   Delay(d);
                   sal:= sal + DibujarNum(frase[i], j);
              End;
              GoToXY(x,y+j);
              Writeln(sal);
         End;
End;

Procedure DibujarPal(palabra: string; x,y,espaciado: integer; fuente: string);
Var
   Sec: Text;
   Vsec: String;
   Vpal: ShortString;
   DirLocal: String;
   i,xLong,yLong: Integer;
   a: integer;
Begin
     getDir(0,DirLocal);
     Assign(Sec, (DirLocal + '\' + fuente + '.txt'));
     xLong:=0;
     For i:=1 to length(palabra) do
     Begin
          Reset(Sec);
          Readln(Sec,Vsec);

          Vpal:= Copy (palabra,i,1);
          While not Eof(Sec) and ( Copy(Vsec,1,1)<>Vpal ) do
          Begin
               Readln(Sec,Vsec);

          end;
          xLong:= length(Vsec)-1;
          yLong:= 0;
          While not Eof(Sec) and ( Copy(Vsec,1,1)= Vpal ) do
          Begin
               GotoXY ( x , y + yLong );
               Writeln ( Copy(Vsec,2,xLong) );
               yLong:= yLong + 1;
               Readln (Sec,Vsec);
          end;
          Close (Sec);
          x:= x + xLong + espaciado;
     end;
End;

Procedure GuardarPuntaje (puntos: integer; nombre: string);
type
    Puntaje = Record
              puesto: integer;
              nombre: string;
              puntaje: integer;
    end;
var
   Puntajes: File of Puntaje;
   Punt,PuntS: Puntaje;
   Dir, resguardoNombre: string;
   i, resguardoPuntos, resguardoPuesto: Integer;
Begin
     GetDir(0,Dir);
     Assign (Puntajes,Dir+'\Puntajes.txt');
     Reset (Puntajes);
     While not Eof(Puntajes) do
     Begin
          Read (Puntajes,Punt);
          if (puntos >= Punt.puntaje) then
          Begin
               resguardoPuntos:= Punt.puntaje;
               resguardoNombre:= Punt.nombre;
               resguardoPuesto:= Punt.puesto;
               Reset (Puntajes);
               if (resguardoPuesto > 1) then
               For i:=2 to resguardoPuesto do Read(Puntajes,Punt);
               PuntS.puntaje:= puntos;
               PuntS.nombre:= nombre;
               PuntS.puesto:= resguardoPuesto;
               Write (Puntajes,PuntS);
               puntos:= resguardoPuntos;
               nombre:= resguardoNombre;
          end;
     end;
     Close(Puntajes);
end;



End.

