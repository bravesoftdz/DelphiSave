unit UnTDbNodo;

interface

type
  TDbNodo = class(TObject)
    Owner: string; // Owner al que Pertenece el Objeto
    Nombre: string; // Nombre del Objeto
    Tipo: string;
 // Tipo de Objeto de la Base de Datos (TABLE, VIEW, SEQUENCE...)
    ImagenIndice: integer; // Número de Imagen del ImageList Relacionado
    Pariente: string;
 // Pariente Más Cercano (Para un Indice la Tabla) o (Para una Tabla el Owner)
    ParienteTipo: string; // Tipo del Pariente
  end;

implementation

end.
