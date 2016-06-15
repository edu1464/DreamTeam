Program MenuPrincipal;

Uses
    crt, dreamTeam, dos, sysutils;

var
   i, j: integer;
   frase, sal: string;

procedure titulo;   {Despues de configurar el juego, llamamos a este procedimiento para comenzar a jugar}
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
                   Delay(5);
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
      gotoxy(26,1);write(' -----CREDITOS----- ');
       gotoxy(26,8);write(' Made By  ');
       gotoxy(26,9);write(' DREAM TEAM :  ');
      gotoxy(26,12);write(' Eduardo Garcia Berbel  ');
      gotoxy(26,14);write(' Francisco Sabbatella  ');
      gotoxy(26,16);write(' Emanuel Ruidiaz  ');
      gotoxy(26,18);write(' Facundo Uriarte');
      gotoxy(26,20);write(' Gracias por jugar :) ');
      
       gotoxy(26,20);write(' Proximamente disponible en Xbox One) ');
      delay(120);
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


Begin  {El menú del juego}
titulo;
clrscr;
creditos;
End.


