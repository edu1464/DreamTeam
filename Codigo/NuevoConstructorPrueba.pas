Program ProbandoConstructorNuevo;
uses crt;

var
frase:string;

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
     For i:=1 to length(palabra) do
     Begin
          Reset(Sec);
          Readln(Sec,Vsec);

          Vpal:= Copy (palabra,i,1);
          While not Eof(Sec) and ( Copy(Vsec,1,1)<>Vpal ) do
          Begin
               Readln(Sec,Vsec);

          end;

          xLong:=length(Vsec)-1;
          yLong:=0;
          While not Eof(Sec) and ( Copy(Vsec,1,1)= Vpal ) do
          Begin
               GotoXY ( x + ((xLong+espaciado)*(i-1) ), y + yLong );
               Writeln ( Copy(Vsec,2,xLong) );
               yLong:= yLong + 1;
               Readln (Sec,Vsec);
          end;
          Close (Sec);
     end;
End;


Begin
     writeln ('en mayúsculas, minúsculas hay que agregar en el texto, faltan');
     read (frase);
     DibujarPal (frase,5,5,3,'AsciiArtNumeroCopia');  {probá con Art y con AsciiArtNumeroCopia como Fuente}
     readkey;
End.

