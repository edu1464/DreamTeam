Program MenuPrincipal;

Uses
    crt, dreamTeam, sysutils, dos;

var

   i,j,x,y: integer;  {x y son variables para controlar la posición del cursor con gotoXY(). i y j son para ciclos For.}
   tecla: char;          {tecla es para guardar el codigo de la tecla presionada, para saber que tecla se presionó.}
   control: boolean;       {control se usa como bandera, para asegurarme de que se cambia de menu o no, si no se cambia vuelve a escribirse el menu principal}
   sal, resgPos, frase: string;
   aleat, desorden, numIngresado: string;
   pos, vida, cont, puntaje, resgPuntaje: integer;
   flag1, flag2, salir, fin: Boolean;
   tiempo: integer;
   nombre, TemporVisual: string;
   Dir,Vstr: string;
   ComoJugar: Text;



procedure titulo;     {Despues de configurar el juego, llamamos a este procedimiento para comenzar a jugar}
var
   frase, sal: string;

Begin
      frase:= 'MEMORY NUMBER';
      For j:= 1 to 8 Do  {Bucle de cantidad de filas de la letra}
      Begin
          sal:= '';
          For i:= 1 to length(frase) Do {Bucle cantidad de digitos del numero}
          Begin
               Delay(20);
               sal:= sal + DibujarNum(frase[i], j) + ' ';
          End;
          GoToXY(5,5+j);
          Writeln(sal);
     End;
end;


Procedure jugar;          {cuando se elije 'Jugar' de las opciones}
begin
     ClrScr;
     fin:= True;
     cont:= 1;
     puntaje:= 0;
     tiempo:= 5000;
     While fin Do
     Begin

     DibujarPal('Nro ' + intToStr(cont),1,1,0,'AsciiArtFont03');
     DibujarPal('Visualice el numero',1,12,0,'AsciiArtFont03');
     TemporVisual:='##################################################';
     GotoXY (22,23);
     Write ('          __________________________________________________');
     GotoXY (22,24);
     Write ('         /                                                  \');
     GotoXY (22,25);
     Write ('TIEMPO: ( ',TemporVisual);
     GotoXY (22,26);
     Write ('         \__________________________________________________/');


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
  
      {Espera de 5 seg para memorizar el numero}

     Repeat
     Begin
           Delay (tiempo DIV 50);
           GotoXY (22,25);
           Delete (TemporVisual, length(TemporVisual),1);
           clrEol;
           Write ('TIEMPO: ( ',TemporVisual);
     end
     until length(TemporVisual) = 0;

     salir:= True;
     vida:= 3;
     While salir Do
     Begin
          clrscr;
          GotoXY (10,12);
          Write ('Intentos:');
          For i:=1 to vida do
                    Begin
                         GotoXY (22+ (15*i) ,10);
                         Write ('  oo   oo  ');
                         GotoXY (22+ (15*i) ,11);
                         Write ('ooooooooooo');
                         GotoXY (22+ (15*i) ,12);
                         Write (' ooooooooo ');
                         GotoXY (22+ (15*i) ,13);
                         Write ('   ooooo  ');
                         GotoXY (22+ (15*i) ,14);
                         Write ('     o  ');
                    end;
          DibujarPal('Adivina',33,17,1,'AsciiArtFont03');
          GotoXY (10,33);
          Write ('Numero desordenado:');
          Dibujando(desorden, 0, 30, 30);
          GotoXY (10,40);
          Write ('Ingresa el numero original:');
          GoToXY(40, 40);
          Readln(numIngresado);
          If vida > 1 Then
          Begin
               If numIngresado = aleat Then
               Begin
                    salir:= False;
                    cont:= cont + 1;
                    GotoXY (55,50);
                    Write ('Acertaste!');
                    Case vida of
                         3: puntaje:= puntaje + 100;
                         2: puntaje:= puntaje + 50;
                         1: puntaje:= puntaje + 25;
                    End;
               End
               Else
               Begin
                    ClrScr;
                    vida:= vida - 1;
                    DibujarPal('Te queda ' + intToStr(vida) + ' vidas',1,20,0,'AsciiArtFont01');
                    For i:=1 to vida do
                    Begin
                         GotoXY (30+ (15*i) ,30);
                         Write ('  oo   oo  ');
                         GotoXY (30+ (15*i) ,31);
                         Write ('ooooooooooo');
                         GotoXY (30+ (15*i) ,32);
                         Write (' ooooooooo ');
                         GotoXY (30+ (15*i) ,33);
                         Write ('   ooooo  ');
                         GotoXY (30+ (15*i) ,34);
                         Write ('     o  ');
                    end;

                    Delay(2000);
               End;
          End
          Else
          Begin
               ClrScr;
               Dibujando('PERDISTE', 20, 20, 20);
               salir:= False;
               fin:= False;
          End;
          if (cont mod 3) = 0 Then
             Begin
                  tiempo:= tiempo - 500;
          End;
     End;
     delay (1500);
     ClrScr;

     End;
     GotoXY (20,5);
     Writeln('Ingrese nombre');
     GotoXY (22,7);
     Readln (nombre);
     GotoXY (20,15);
     Writeln('Tu puntaje');
     Delay (1000);
     DibujarPal(intToStr(puntaje),22,17,0,'AsciiArtFont04');
     Delay (1000);
     GotoXY (20,25);
     Write ('Multiplicador por nivel:');
     Delay (1000);
     DibujarPal('x'+intToStr(cont-1),22,27,0,'AsciiArtFont04');
     GotoXY (20,35);
     Delay (1000);
     Write ('TOTAL:');
     Delay (1000);
     resgPuntaje:= puntaje;
     puntaje:=0;
     if cont>1 then
     Begin
          For i:=1 to (resgPuntaje*(cont-1)) do
          Begin
               GotoXY (22,37);
               clrEol;
               GotoXY (22,38);
               clrEol;
               GotoXY (22,39);
               clrEol;
               GotoXY (22,40);
               clrEol;
               GotoXY (22,41);
               clrEol;
               puntaje:= puntaje + 1;
               DibujarPal(intToStr(puntaje),22,37,0,'AsciiArtFont04');
               Delay (10);
          end;
     end
     else
     DibujarPal(intToStr(puntaje),22,37,0,'AsciiArtFont04');




     GuardarPuntaje(puntaje,nombre);



     ReadKey;
     control:= false;
     ClrScr;

end;

Procedure ComoSeJuega;
Begin
     ClrScr;
     x:= 55;
     y:= 10;
     GetDir(0,Dir);
     Assign (ComoJugar, Dir + '\Como Jugar.txt');
     Reset (ComoJugar);

     While not Eof(ComoJugar) do
     Begin
          Readln (ComoJugar,Vstr);
          GotoXY (x,y);
          Write (Vstr);
          y:= y+1;

     end;
     GotoXY (58,y+3);
     Write ('Presione cualquier tecla para volver');
     ReadKey;
     control:=false;
     ClrScr;
end;

Procedure puntuaciones;
type
    Puntaje = Record
              puesto: integer;
              nombre: string;
              puntaje: integer;
    end;
var
   Puntajes: File of Puntaje;
   Punt: Puntaje;
Begin
     ClrScr;
     y:= 10;
     GetDir(0,Dir);
     Assign(Puntajes, Dir + '\Puntajes.txt');
     Reset (Puntajes);
     DibujarPal('PUNTUACIONES',4,1,0,'AsciiArtFont01');
     While not EoF(Puntajes) do
     Begin
          Read (Puntajes,Punt);
          DibujarPal(intToStr(Punt.puesto),2,y,0,'AsciiArtFont03');
          DibujarPal(Punt.nombre,12,y,0,'AsciiArtFont03');
          DibujarPal(intToStr(Punt.puntaje),122,y,0,'AsciiArtFont03');
          y:= y + 8;
     end;
     GotoXY (30, y);
     Write ('Presione cualquier tecla para volver');
     ReadKey;
     ClrScr;
     control:= false;
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
            gotoxy(60,11);write(' -----CREDITOS----- ');
            gotoxy(60,18);write(' Desarrollado por  ');
            gotoxy(60,19);write(' DREAM TEAM :  ');
            gotoxy(60,22);write(' Eduardo Garcia  ');
            gotoxy(60,24);write(' Francisco Sabbatella  ');
            gotoxy(60,26);write(' Emanuel Ruidiaz  ');
            gotoxy(60,28);write(' Facundo Uriarte');
            gotoxy(60,32);write(' Gracias por jugar :) ');
      
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
      control:= false;
      
end;

Procedure cerrar;         {cuando se elije 'Salir' de las opciones}
Begin
     gotoXY (55,25);
     clrEol;

     Writeln (' ____________________________ ');
     gotoXY (55,26);
     Writeln ('/                            \');
     gotoXY (55,27);
     Writeln ('| .Seguro que quieres salir? |');
     gotoXY (55,28);
     Writeln ('|                            |');
     gotoXY (55,29);
     Writeln ('|     .NO           .SI      |');
     gotoXY (55,30);
     Writeln ('\____________________________/');
     x:= 60;
     Repeat
           gotoXY (x,29);                                                        {Este es el codigo que hace que el cursor se mueva hacia arriba o abajo}
           tecla:= ReadKey;                                                      {presionando las flechitas, la var tecla guarda el valor ASCII de la tecla}
           case tecla of
                #77:  x:= x+14;                                                   {#72 es la flecha hacia arriba}
                #75:  x:= x-14;                                                   {#80 es la flecha hacia abajo}
           end;
           if (x < 60) then x:=60;                                               {para no subir o bajar mas del limite de las opciones}
           if (x > 74) then x:=74;
     until (tecla = #13);

     case x of
          60: control:= false;
          73: control:= true;
     end;
     ClrScr;
end;





procedure menu;          {escribe las opciones del menú principal}
Begin
     control:= true;
     y:=24;                                                                      {Escribe las opciones del menu principal}
     gotoXY (55,24);                                                             {uso gotoXY (x,y) para posicionar el cursor donde quiera}
     write ('      .[Jugar]');
     gotoXY (55,25); clrEol;                                                     {clrEol borra esa linea entera}
     gotoXY (55,26); clrEol;                                                     {me aseguro de borrar todo lo que haya ahi para poner las opciones}
     write ('      .[Como se juega]');                                           {las opciones las separo con un renglon cada una}
     gotoXY (55,27); clrEol;
     gotoXY (55,28); clrEol;
     write ('      .[Puntuaciones maximas]');
     gotoXY (55,29); clrEol;
     gotoXY (55,30); clrEol;
     write ('      .[Creditos]');
     gotoXY (55,31); clrEol;
     gotoXY (55,32);
     write ('      .[SALIR]');

     Repeat
           gotoXY (58,y);                                                        {Este es el codigo que hace que el cursor se mueva hacia arriba o abajo}
           tecla:= ReadKey;                                                      {presionando las flechitas, la var tecla guarda el valor ASCII de la tecla}
           case tecla of
                #72:  y:= y-2;                                                   {#72 es la flecha hacia arriba}
                #80:  y:= y+2;                                                   {#80 es la flecha hacia abajo}
           end;
           if (y < 24) then y:=24;                                               {para no subir o bajar mas del limite de las opciones}
           if (y > 32) then y:=32;
     until (tecla = #13);                                                        {#13 es Enter}

           case y of
                24: jugar;
                26: comoSeJuega;
                28: puntuaciones;
                30: creditos;
                32: cerrar;
           end;

end;


Begin  {El menú del juego}

       Repeat
             titulo;
             delay (1000);
             menu;
       until (control=true);


End.
