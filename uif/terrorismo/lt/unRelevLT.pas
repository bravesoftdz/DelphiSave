{
  esta unit procesa los archivos XML buscando sin tener en cuenta ALIAS de los individuos ó
  sucursales de las ENTIDADES... al menos por ahora kuac!
}
unit unRelevLT;

interface

uses
  SysUtils, Classes, Dialogs, XMLIntf, Variants, XMLDoc, Forms, SvcMgr;

type

  TRelevamiento = class(TComponent)
  private
      FArchivo: string;
      FArcTXT: TextFile;
      FArcXmlIN, FArcXmlOUT: TXMLDocument;
      FPath: WideString;
      procedure LoadTXT;
      procedure LoadXML;
      procedure SetPathArchivo(Value: WideString);
  public
      destructor Destroy; override;
      procedure GenerarArchivo; virtual;
      property PathArchivo: WideString write SetPathArchivo;
  end;

  {XMLs}
  TRelevSDN = class(TRelevamiento)
    public
      procedure GenerarArchivo; override;
  end;

  TRelevGLOBAL = class(TRelevamiento)
    public
      procedure GenerarArchivo; override;
  end;

  TRelevCONS = class(TRelevamiento)
    public
      procedure GenerarArchivo; override;
      procedure GenerarIndEnt(const IndsEnts, IndEnt: string; const aNombre, aDireccion: array of
          string; aExtData: array of string);
  end;

  {TXTs}
  TTipoArc = (tarNone, tarEntidad, tarIndividuo, tarSanctList);

  TRelevTXTs = class(TRelevamiento)
  private
      FTipoArc: TTipoArc;
      function ExtraerDato(buffer: string; Separador: char; CampoNro: Word): string;
  public
      constructor Create(AOwner: TComponent); override;
      procedure GenerarArchivo; override;
      property TipoArchivoEI: TTipoArc read FTipoArc write FTipoArc;
  end;

implementation

uses
  unStringsLT, unComunesLT, Math, unLogsLT, unDebug;


destructor TRelevamiento.Destroy;
begin
  inherited;
  if Assigned(FArcXmlOUT) then FreeAndNil(FArcXmlOUT);
  if Assigned(FArcXmlIN) then FreeAndNil(FArcXmlIN);
end;

procedure TRelevamiento.GenerarArchivo;
begin
  {XML de salida}
  FArcXmlOUT := TXMLDocument.Create(Self);
  FArcXmlOUT.Active := True;

  {por ahora sólo XML y TXT}
  if ExtractFileExt(FArchivo) = XML then
    LoadXML
  else
    LoadTXT;

end;

procedure TRelevamiento.LoadTXT;
begin
  AssignFile(FArcTXT, FPath + FArchivo);
  Reset(FArcTXT);
end;

procedure TRelevamiento.LoadXML;
begin
  FArcXmlIN := TXMLDocument.Create(Self);
  FArcXmlIN.LoadFromFile(FPath + FArchivo);
  FArcXmlIN.Active := True;
end;

{----------------------------------------------------------------------------------------------}
{ TRelevSDN }

procedure TRelevSDN.GenerarArchivo;
var
  ndoEntry, ndoWholeName, ndoAddressList, ndoAddress: IXMLNode;
  ndoRaiz, ndoEntidad, ndoNombre, ndoDire: IXMLNode;
  i: Word;
  sNombre, sDireccion, sNombreAnt: string;
  aNombre, aDireccion: array of string;
begin
  inherited;
  try
    ndoEntry := FArcXmlIN.DocumentElement.ChildNodes.FindNode(SDN_NOD_ENTRY);
    ndoRaiz := FArcXmlOUT.AddChild(NOD_RAIZ);

    SetLength(aNombre, 2);
    aNombre[0] := SDN_NOD_LASTNAME;
    aNombre[1] := SDN_NOD_FIRSTNAME;

    SetLength(aDireccion, 2);
    aDireccion[0] := SDN_NOD_CITY;
    aDireccion[1] := SDN_NOD_COUNTRY;

    while Assigned(ndoEntry) do begin
      try
        {captura data nombres nodos archivo leído}
        for i := low(aNombre) to high(aNombre) do begin
          ndoWholeName := ndoEntry.ChildNodes.FindNode(aNombre[i]);
          if not (ndoWholeName = nil) then
            sNombre := sNombre + ndoWholeName.Text + ' ';

        end;

        if (not (sNombre = EmptyStr)) and ((sNombreAnt <> sNombre)) then begin
          ndoAddressList := ndoEntry.ChildNodes.FindNode(SDN_NOD_ADDR_LIST);
          if not (ndoAddressList = nil) then
            ndoAddress := ndoAddressList.ChildNodes.FindNode(SDN_NOD_ADDRESS);

          {captura data dire nodos archivo leído}
          if not (ndoAddress = nil) then
            for i := low(aDireccion) to high(aDireccion) do begin
              ndoDire := ndoAddress.ChildNodes.FindNode(aDireccion[i]);
              if not (ndoDire = nil) then begin
                sDireccion := sDireccion + ndoDire.Text + ' ';
              end;
            end;

          {nodos para el archivo a generar}
          ndoEntidad := ndoRaiz.AddChild(NOD_ENTIDAD);
          ndoNombre := ndoEntidad.AddChild(FIELD_NOMBRE);
          ndoDire := ndoEntidad.AddChild(FIELD_DIRECCION);
          {data para los nodos del archivo a generar}
          ndoNombre.Text := LimpiarDato(sNombre);
          ndoDire.Text := sDireccion;
          sNombreAnt := sNombre;
        end;

        {siguiente entidad}
        ndoEntry := ndoEntry.NextSibling;
        sNombre := EmptyStr;
        sDireccion := EmptyStr;
      except
        on e: Exception do begin
          TLog.LogMsg(e.Message, (Application.ClassParent = TService), ltError);
          ndoEntry := ndoEntry.NextSibling;
        end;
      end;
    end;
  finally
    FArcXmlOUT.SaveToFile(FPath + PROCESADO + FArchivo);
    FArcXmlIN.Active := False;
    FArcXmlOUT.Active := False;
    FreeAndNil(FArcXmlIN);
    FreeAndNil(FArcXmlOUT);
  end;
end;


{----------------------------------------------------------------------------------------------}
{ TRelevGLOBAL }

procedure TRelevGLOBAL.GenerarArchivo;
var
  ndoEntity, ndoName, ndoWholeName, ndoAddress: IXMLNode;
  ndoRaiz, ndoEntidad, ndoNombre, ndoDire: IXMLNode;
  aNombre, aDireccion: array of string;
  i: Word;
  sNombre, sDireccion, sNombreAnt: string;
begin
  inherited;
  try
    ndoEntity := FArcXmlIN.DocumentElement.ChildNodes.FindNode(GLOBAL_NOD_ENTITY);
    ndoRaiz := FArcXmlOUT.AddChild(NOD_RAIZ);

    SetLength(aNombre, 3);
    aNombre[0] := GLOBAL_NOD_LASTNAME;
    aNombre[1] := GLOBAL_NOD_FIRSTNAME;
    aNombre[2] := GLOBAL_NOD_MIDLENAME;

    SetLength(aDireccion, 2);
    aDireccion[0] := GLOBAL_NOD_COUNTRY;
    aDireccion[1] := GLOBAL_NOD_CITY;

    while Assigned(ndoEntity) do begin
      try
        {captura data nodos archivo leído}
        ndoName := ndoEntity.ChildNodes.FindNode(GLOBAL_NOD_NAME);

        ndoWholeName := ndoName.ChildNodes.FindNode(GLOBAL_NOD_WHOLENAME);
        {whole name o nombres 1, 2 y 3}
        if not (Trim(ndoWholeName.Text) = EmptyStr) then
          sNombre := ndoWholeName.Text
        else
          for i := Low(aNombre) to  High(aNombre) do begin
            ndoWholeName := ndoName.ChildNodes.FindNode(aNombre[i]);
            if not (ndoWholeName = nil) then
              sNombre := sNombre + ndoWholeName.Text + ' ';

          end;

        if (not (sNombre = EmptyStr)) and ((sNombreAnt <> sNombre)) then begin
          ndoAddress := ndoEntity.ChildNodes.FindNode(GLOBAL_NOD_ADDRESS);
          {construye la dire con país y city}
          if not (ndoAddress = nil) then
            for i := Low(aDireccion) to  High(aDireccion) do begin
              ndoDire := ndoAddress.ChildNodes.FindNode(aDireccion[i]);
              if not (ndoDire = nil) then begin
                sDireccion := sDireccion + ' ' + ndoDire.Text;
              end;
            end;

          {nodos para el archivo a generar}
          ndoEntidad := ndoRaiz.AddChild(NOD_ENTIDAD);
          ndoNombre := ndoEntidad.AddChild(FIELD_NOMBRE);
          ndoDire := ndoEntidad.AddChild(FIELD_DIRECCION);
          {data para los nodos del archivo a generar}
          ndoNombre.Text := LimpiarDato(sNombre);
          ndoDire.Text := Trim(iif(sDireccion = EmptyStr, NOD_ND, sDireccion));
          sNombreAnt := sNombre;
        end;

        {siguiente entidad}
        ndoEntity := ndoEntity.NextSibling;
        sNombre := EmptyStr;
        sDireccion := EmptyStr;
      except
        on e: Exception do begin
          TLog.LogMsg(e.Message, (Application.ClassParent = TService), ltError);
          ndoEntity := ndoEntity.NextSibling;
        end;
      end;
    end;
  finally
    FArcXmlOUT.SaveToFile(FPath + PROCESADO + FArchivo);
    FArcXmlIN.Active := False;
    FArcXmlOUT.Active := False;
    FreeAndNil(FArcXmlIN);
    FreeAndNil(FArcXmlOUT);
  end;

end;

{----------------------------------------------------------------------------------------------}
{ TRelevCONS }

procedure TRelevCONS.GenerarArchivo;
begin
  inherited;

  try
    {para los individuos}
    GenerarIndEnt(
        CONS_NOD_INDIVIDUALS,
        CONS_NOD_INDIVIDUAL,
        [CONS_NOD_FIRSTNAME, CONS_NOD_SECONDNAME, CONS_NOD_THIRDNAME, CONS_NOD_FOURTHNAME],
        [CONS_NOD_IND_ADDRESS, CONS_NOD_COUNTRY, CONS_NOD_CITY, CONS_NOD_NOTE],
        [CONS_NOD_COMENTS1, CONS_NOD_DATAID]
    );

    {para los entities}
    GenerarIndEnt(
        CONS_NOD_ENTITIES,
        CONS_NOD_ENTITY,
        [CONS_NOD_FIRSTNAME], {nombre de la empresa}
        [CONS_NOD_ENT_ADDRESS, CONS_NOD_COUNTRY, CONS_NOD_CITY, CONS_NOD_NOTE],
        [CONS_NOD_COMENTS1, CONS_NOD_DATAID]
    );
  finally
    FArcXmlOUT.SaveToFile(FPath + PROCESADO + FArchivo);
    FArcXmlIN.Active := False;
    FArcXmlOUT.Active := False;
    FreeAndNil(FArcXmlIN);
    FreeAndNil(FArcXmlOUT);
  end;

end;

{procedimiento para procesar los dos nodos "raiz" de datos
que tiene este XML (Individuals y Entities) }
procedure TRelevCONS.GenerarIndEnt(const IndsEnts, IndEnt: string; const aNombre, aDireccion:
    array of string; aExtData: array of string);
var
  ndoIndsEnts, ndoIndEnt, ndoName, ndoAddress: IXMLNode;
  ndoRaiz, ndoEntidad, ndoNombre, ndoDire: IXMLNode;
  i: Word;
  sNombre, sDireccion, sNombreAnt: string;
begin
  ndoIndsEnts := FArcXmlIN.DocumentElement.ChildNodes.FindNode(IndsEnts);
  ndoIndEnt := ndoIndsEnts.ChildNodes.FindNode(IndEnt);
  ndoRaiz := FArcXmlOUT.ChildNodes.FindNode(nod_raiz);
  {por si es el primer llamado ó no}
  if ndoRaiz = nil then
    ndoRaiz := FArcXmlOUT.AddChild(NOD_RAIZ);

  while Assigned(ndoIndEnt) do begin
    try
      {itera nombres del individuo}
      for i := Low(aNombre) to High(aNombre) do begin
        ndoName := ndoIndEnt.ChildNodes.FindNode(aNombre[i]);
        if not (ndoName = nil) then
          sNombre := ndoName.Text + ' ' + sNombre; {primero el apellido}

      end;

      if (not (sNombre = EmptyStr)) and ((sNombreAnt <> sNombre)) then begin
        ndoAddress := ndoIndEnt.ChildNodes.FindNode(aDireccion[0]);
        if not (ndoAddress = nil) then
          for i := Low(aDireccion) to High(aDireccion) do begin
            ndoDire := ndoAddress.ChildNodes.FindNode(aDireccion[i]);
            if not (ndoDire = nil) then begin
              sDireccion := sDireccion + ' - ' + ndoDire.Text;
            end;
          end;

        {nodos para el archivo a generar}
        ndoEntidad := ndoRaiz.AddChild(NOD_ENTIDAD);
        ndoNombre := ndoEntidad.AddChild(FIELD_NOMBRE);
        ndoDire := ndoEntidad.AddChild(FIELD_DIRECCION);
        {data para los nodos del archivo a generar}
        ndoNombre.Text := LimpiarDato(sNombre);
        ndoDire.Text := sDireccion;
        sNombreAnt := sNombre;
      end;

      {siguiente entidad}
      ndoIndEnt := ndoIndEnt.NextSibling;
      sNombre := EmptyStr;
      sDireccion := EmptyStr;
    except
      on e: Exception do begin
        TLog.LogMsg(e.Message, (Application.ClassParent = TService), ltError);
        ndoIndsEnts := ndoIndsEnts.NextSibling;
      end;
    end;
  end;

end;

{----------------------------------------------------------------------------------------------}
{ TRelevTXTs }

constructor TRelevTXTs.Create(AOwner: TComponent);
begin
  inherited;
  FTipoArc := tarNone;
end;

{extrae el dato interesa del buffer según parámetros
Separador: caracter que separa los campos
CampoNro: es la posición índice del campo}
function TRelevTXTs.ExtraerDato(buffer: string; Separador: char; CampoNro: Word): string;
var
  i, x, Campo: integer;
  dato: string;
begin
  Result := NOD_ND;
  dato := EmptyStr;
  Campo := 1;

  {bloque extractor}
  for i := 0 to Length(buffer) -1 do begin
    if (buffer[i] = Separador) or (CampoNro = 1) then begin
      Campo := Campo +1;
      if (Campo = CampoNro) or (CampoNro = 1) then begin
        for x := i to Length(buffer) do begin
          dato := dato + buffer[x+1];
          if (buffer[x+1] = Separador) then
            break;
        end;
      end;
    end;

    {si hay algo, limpia y sale}
    if not (dato = EmptyStr) then begin
      dato := StringReplace(dato, Separador, EmptyStr, [rfReplaceAll]);
      Break;
    end;
  end;

  Result := dato;
end;

procedure TRelevTXTs.GenerarArchivo;
var
  buffer: string;
  dummy: single;
  ndoRaiz, ndoEntidad, ndoNombre, ndoDire: IXMLNode;
begin
  inherited;
  {se asume que en este archivo la línea de info del sujeto comienza con un ID numnérico (ej: 2.01)}
  if (FTipoArc = tarNone) then begin
    TLog.LogMsg(
        Format(ERROR_TIPO_ARC, [Self.Name]), (Application.ClassParent = TService), ltError);
    Exit;
  end;

  DecimalSeparator := '.';
  {saltea texto encabezado de los archivos}
  if FTipoArc in [tarEntidad, tarIndividuo] then begin
    while not Eof(FArcTXT) do begin
      Readln(FArcTXT, buffer);
      if TryStrToFloat(copy(buffer, 0, pos(#9, buffer) -1), dummy) then
        Break;
    end;
  end else
  begin
    {las 2 primeras líneas}
    Readln(FArcTXT, buffer);
    Readln(FArcTXT, buffer);
  end;

  ndoRaiz := FArcXmlOUT.AddChild(NOD_RAIZ);
  while not Eof(FArcTXT) do begin
    ndoEntidad := ndoRaiz.AddChild(NOD_ENTIDAD);
    ndoNombre := ndoEntidad.AddChild(FIELD_NOMBRE);
    ndoDire := ndoEntidad.AddChild(FIELD_DIRECCION);

    ndoDire.NodeValue := NOD_ND; {sin datos por ahora para tarEntidad y tarIndividuo}
    case FTipoArc of
      tarEntidad:
      begin
          ndoNombre.Text := LimpiarDato(ExtraerDato(buffer, #9, 2));
      end;
      tarIndividuo:
      begin
          ndoNombre.Text :=
              LimpiarDato(
                  ExtraerDato(buffer, #9, 2) + ' ' +
                  ExtraerDato(buffer, #9, 3) + ' ' +
                  ExtraerDato(buffer, #9, 4) + ' ' +
                  ExtraerDato(buffer, #9, 5)
              );

      end;
      tarSanctList:
      begin
          Readln(FArcTXT, buffer);
          ndoNombre.Text :=
              LimpiarDato(ExtraerDato(buffer, ';', 1) + ' ' + ExtraerDato(buffer, ';', 2));
          ndoDire.Text := ExtraerDato(buffer, ';', 22);
      end;
    end;

    Readln(FArcTXT, buffer);
    {se detectó línea vacía, se interpreta como fin del bloque de datos}
    if Trim(buffer) = EmptyStr then
      Break;
  end;

  FArchivo := StringReplace(FArchivo, TXT, XML, [rfReplaceAll]);
  FArcXmlOUT.SaveToFile(FPath + PROCESADO + FArchivo);
  FArcXmlOUT.Active := False;
  FreeAndNil(FArcXmlOUT);
  Close(FArcTXT);
end;


procedure TRelevamiento.SetPathArchivo(Value: WideString);
begin
  FPath := ExtractFilePath(Value);
  FArchivo := ExtractFileName(Value);
end;

end.
