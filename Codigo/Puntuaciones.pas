Program DirectorioLocalPrueba;

uses crt;
type
puntos = Record
       puesto: integer;
       nombre: string[30];
       puntaje: integer;
end;

var
Arch: file of puntos;
Reg,RegS: puntos;
i: integer;
name, resguardoName : string[30];
punt, resguardoPunt, resguardoPuesto: integer;
opcion: string[2];

Begin
 { $I+ }
     Assign (Arch, 'MemoryNumber_Puntos.txt');

     Reset (Arch);
     if not (IOResult=0) then
     Begin
          Rewrite (Arch);
          For i:=1 to 5 do
          Begin
               Reg.puesto:= i;
               Reg.nombre:= 'Undefined';
               Reg.puntaje:= 0;
               Write (Arch,Reg);
          end;
          Close (Arch);
          Reset (Arch);
     end;

     Write ('Desea cargar nuevas puntuaciones? ( si , no ) : ');
     Readln (opcion);
     While opcion='si' do
     Begin
          Reset (Arch);
          Writeln ('------Carga de puntuaciones------');
          Write (' Ingrese nombre: ');
          Readln (name);
          Write ('   Ingrese puntos: ');
          Readln (punt);

          While not Eof (Arch) do
          Begin
               Read (Arch,Reg);

               if (punt > Reg.puntaje) then
               Begin
                    resguardoPunt:= Reg.puntaje;
                    resguardoName:= Reg.nombre;
                    resguardoPuesto:= Reg.puesto;
                    Reset (Arch);
                    if (resguardoPuesto > 1) then
                    For i:=2 to resguardoPuesto do Read (Arch,Reg);
                    RegS.puntaje:= punt;
                    RegS.nombre:= name;
                    RegS.puesto:= resguardoPuesto;
                    Write (Arch,RegS);
                    punt:= resguardoPunt;
                    name:= resguardoName;
               end;

          end;
          Write ('Desea seguir cargando? ( si , no ) : ');
          Readln (opcion);
     end;
     Close (Arch);

     Reset (Arch);
     while not Eof (Arch) do
     Begin
          Read (Arch, Reg);
          Writeln (Reg.puesto,'. ',Reg.nombre,': ',Reg.puntaje);
     end;
     Close (Arch);
     ReadKey;

end.
