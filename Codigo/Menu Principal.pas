Program MenuPrincipal;

Uses
    crt, dreamTeam, dos  ;

var

   i,j,x,y: integer;  {x y son variables para controlar la posición del cursor con gotoXY(). i y j son para ciclos For.}
   tecla: char;          {tecla es para guardar el codigo de la tecla presionada, para saber que tecla se presionó.}
   control: boolean;       {control se usa como bandera, para asegurarme de que se cambia de menu o no, si no se cambia vuelve a escribirse el menu principal}

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
Begin
    // gotoXY (55,38);
     ClrScr;
     Exec('D:\Eduardo\UTN FRRe\Algoritmos\2016\Repo TPI Pascal 2\Codigo\Game.exe', '');
   //  Write ('Listo? JUGUEMOS ENTONCES!');
    // delay (2000);
    // clrScr;
end;

Procedure comoJugar;
Begin
end;

Procedure puntuaciones;
Begin
end;

Procedure creditos;
Begin
end;

Procedure salir;         {cuando se elije 'Salir' de las opciones}
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
                26: comoJugar;
                28: puntuaciones;
                30: creditos;
                32: salir;
           end;

end;


Begin  {El menú del juego}

       titulo;
       delay (1000);
       Repeat
              menu;
       until (control=true);


End.
