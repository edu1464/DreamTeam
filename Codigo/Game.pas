Program Game;

Uses
    crt, sysutils, dos, dreamTeam;

Var
   sal, resgPos, frase: string;
   aleat, desorden, numIngresado: string;
   j,i, pos, vida, cont, puntaje, resgPuntaje: integer;
   flag1, flag2, salir, fin: Boolean;
   tiempo: integer;
   nombre, TemporVisual: string;

begin
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
          GotoXY (10,50);
          Write ('Ingresa el numero original:');
          GoToXY(40, 50);
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
     GotoXY (20,10);
     Writeln('Ingrese nombre');
     GotoXY (22,12);
     Readln (nombre);
     GotoXY (20,20);
     Writeln('Tu puntaje');
     Delay (1000);
     DibujarPal(intToStr(puntaje),22,22,0,'AsciiArtFont04');
     Delay (1000);
     GotoXY (20,30);
     Write ('Multiplicador por nivel:');
     Delay (1000);
     DibujarPal('x'+intToStr(cont-1),22,32,0,'AsciiArtFont04');
     GotoXY (20,40);
     Delay (1000);
     Write ('TOTAL:');
     Delay (1000);
     resgPuntaje:= puntaje;
     puntaje:=0;
     if cont>1 then
     Begin
          For i:=1 to (resgPuntaje*(cont-1)) do
          Begin
               GotoXY (22,42);
               clrEol;
               GotoXY (22,43);
               clrEol;
               GotoXY (22,44);
               clrEol;
               GotoXY (22,45);
               clrEol;
               GotoXY (22,46);
               clrEol;
               puntaje:= puntaje + 1;
               DibujarPal(intToStr(puntaje),22,42,0,'AsciiArtFont04');
               Delay (10);
          end;
     end
     else
     DibujarPal(intToStr(puntaje),22,42,0,'AsciiArtFont04');




     GuardarPuntaje(puntaje,nombre);



     ReadKey;

end.
