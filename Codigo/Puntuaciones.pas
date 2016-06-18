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
     if not (IOResult=0) then                   {Esto es únicamente para controlar si el}
     Begin                                       {archivo de puntuaciones ya existe, si no}
          Rewrite (Arch);                        {crea uno nuevo con 5 puestos}
          For i:=1 to 5 do
          Begin
               Reg.puesto:= i;
               Reg.nombre:= 'Undefined';
               Reg.puntaje:= 0;
               Write (Arch,Reg);
          end;
          Close (Arch);
          Reset (Arch);                          {aca termina la carga del nuevo archivo depuntuaciones}
     end;

     Write ('Desea cargar nuevas puntuaciones? ( si , no ) : ');   {Esto no va en el juego, lo puse solo}
     Readln (opcion);                                              {para poder correr el codigo y verificar}
     While opcion='si' do                                          {si funciona}
     Begin
          Reset (Arch);
          Writeln ('------Carga de puntuaciones------');
          Write (' Ingrese nombre: ');
          Readln (name);
          Write ('   Ingrese puntos: ');
          Readln (punt);                                            {Acá debería cargarlo de la variable que almacene el puntaje}

          While not Eof (Arch) do
          Begin
               Read (Arch,Reg);
                                                                    {Hace una carga ordenada de mayor puntaje a menor}
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
          Write ('Desea seguir cargando? ( si , no ) : ');                 {Esto tampoco va, es solo par probar el código separado}
          Readln (opcion);
     end;
     Close (Arch);

     Reset (Arch);
     while not Eof (Arch) do                                                {Este ciclo muestra en pantalla todas las puntuaciones}
     Begin
          Read (Arch, Reg);
          Writeln (Reg.puesto,'. ',Reg.nombre,': ',Reg.puntaje);
     end;
     Close (Arch);
     ReadKey;

end.
