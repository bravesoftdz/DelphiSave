unit unWSEstablecimientos;

interface

uses unImportCryptoSrt, XMLIntf, XMLDoc, unArt, SDEngine, AnsiSql, SqlFuncs, unSesion, StrUtils, unCustomDataModule,
     IdTCPClient, SysUtils, CodeSiteLogging;

type
  TOperacion = (opNuevo, opRectificacion, opEliminar);

  TCodigos = Array of Integer;

  TEstablecimiento = record
                      Altura : Real;
                      Calle : String;
                      Codigo : Integer;
                      CP : String;
                      CPA : String;
                      Cuit : String;
                      Descripcion : String;
                      Dpto : String;
                      Interseccion : String;
                      Latitud : Real;
                      Localidad : String;
                      LocalidadId : Integer;
                      Longitud : Real;
                      MotivoBaja : Integer;
                      NumeroEstablecimiento : Integer;
                      Organismo : Integer;
                      Piso : String;
                      ProvinciaId : Integer;
                      Temporal : Boolean;
                      TipoEstablecimiento : Integer;
                      TipoOrganismo : Integer;
                      Principal : boolean;
                      CodigosArt : TCodigos;
                    end;

  TEstablecimientoEmpresa = record
                      Ciiu : Integer;
                      Codigo : Integer;
                      Cuit : String;
                      Establecimiento : TEstablecimiento;
                      FechaAlta : TDate;  //Este es un campo nuestro
                      FinActividad : TDate;
                      InicioActividad : TDate;
                      MotivoBaja : integer;
                      Organismo : Integer;
                      Propio : Boolean;
                      TipoOrganismo : Integer;
                    end;

  TArrayOfEstablecimientoEmpresa = Array of TEstablecimientoEmpresa;

procedure GuardarEstablecimientoEmpresa(EstablecimientoEmpresa : TEstablecimientoEmpresa; const aIdEstablecimientoEmpresa: TTableId);
procedure GuardarEstablecimiento(Establecimiento: TEstablecimiento; const aIdEstablecimientoEmpresa: TTableId);
procedure BorrarDatosEstablecimiento(const aCodigoEstablecimiento, aCodigoEstablecimientoEmpresa : Integer);
procedure CrearXMLEstablecimientoEmpresa(const aEstEmp : TEstablecimientoEmpresa;var LDocument: IXMLDocument;const Operacion : TOperacion);
procedure CargarCodigosArt(var Codigos: TCodigos; aIdEstablecimiento: Integer);

function GetEstablecimientosPorCuit(const aCuit:String): TArrayOfEstablecimientoEmpresa;
function GetEstablecimientosFromDB(const aCuit: String): TArrayOfEstablecimientoEmpresa;
function EnviarNuevoEstablecimientoEmpresa(const Esta : TEstablecimientoEmpresa): TEstablecimientoEmpresa;
function RectificarEstablecimientoEmpresa(const Esta: TEstablecimientoEmpresa): Boolean;
function RectificarEstablecimiento(const Esta: TEstablecimientoEmpresa): Boolean;
function EliminarEstablecimientoEmpresa(const Esta: TEstablecimientoEmpresa): Boolean;
function EliminarEstablecimiento(const Esta: TEstablecimientoEmpresa): Boolean;
function CargarEstablecimientoFromXMLNodes(const aNode: IXMLNode): TEstablecimientoEmpresa;
function IsNotConsultaEstablecimientoNueva(const aCuil: String): boolean;
function GetEstablecimientoEmpresaFromDB(const aIdEstEmp: TTableId): TEstablecimientoEmpresa;

implementation

uses unComunes, StrFuncs {$IFNDEF VER150},idGlobal{$ENDIF}, XSBuiltIns, unDmPrincipal;

procedure GuardarEstablecimientoEmpresa(EstablecimientoEmpresa : TEstablecimientoEmpresa; const aIdEstablecimientoEmpresa: TTableId);
var
  aSql: TSql;
begin
  aSql := TSql.Create('SRT.SEE_ESTABLECIMIENTOEMPRESA');
  try
    aSql.SqlType := stInsert;
    aSql.Fields.Add('EE_ID',                          aIdEstablecimientoEmpresa);
    aSql.Fields.Add('EE_CIIU',                        EstablecimientoEmpresa.Ciiu);
    aSql.Fields.Add('EE_CODIGO',                      EstablecimientoEmpresa.Codigo);
    aSql.Fields.Add('EE_CUIT',                        EstablecimientoEmpresa.Cuit);
    if EstablecimientoEmpresa.FechaAlta <> 0 then
      aSql.Fields.Add('EE_FECHAALTASRT',              EstablecimientoEmpresa.FechaAlta);
    if EstablecimientoEmpresa.FinActividad <> 0 then
      aSql.Fields.Add('EE_FINACTIVIDAD',              EstablecimientoEmpresa.FinActividad);
    if EstablecimientoEmpresa.InicioActividad <> 0 then
      aSql.Fields.Add('EE_INICIOACTIVIDAD',           EstablecimientoEmpresa.InicioActividad);
    aSql.Fields.Add('EE_MOTIVOBAJA',                  EstablecimientoEmpresa.MotivoBaja);
    aSql.Fields.Add('EE_ORGANISMO',                   EstablecimientoEmpresa.Organismo);
    aSql.Fields.Add('EE_PROPIO',                      IIF(EstablecimientoEmpresa.Propio,'S','N'));
    aSql.Fields.Add('EE_TIPOORGANISMO',               EstablecimientoEmpresa.TipoOrganismo);
    EjecutarSqlST(aSql.Sql);
  finally
    aSql.Free;
  end;
end;

procedure GuardarEstablecimiento(Establecimiento: TEstablecimiento; const aIdEstablecimientoEmpresa: TTableId);
var
  aSql: TSql;
  sSql : String;
  I, IdEstablecimiento : Integer;
begin
  {$region 'Insertar Establecimiento SRT.SES_ESTABLECIMIENTO'}
  aSql := TSql.Create('SRT.SES_ESTABLECIMIENTO');
  try
    aSql.SqlType := stInsert;
    IdEstablecimiento := GetSecNextVal('SRT.SEQ_ESTABLECIMIENTO_ID');
    aSql.Fields.AddInteger('ES_ID',                   IdEstablecimiento, False);
    aSql.Fields.Add('ES_IDESTABLECIMIENTOEMPRESA',    aIdEstablecimientoEmpresa);
    aSql.Fields.Add('ES_CODIGO',                      Establecimiento.Codigo);
    aSql.Fields.Add('ES_CALLE',                       Establecimiento.Calle);
    aSql.Fields.Add('ES_ALTURA',                      Establecimiento.Altura, dtNumber );
    aSql.Fields.Add('ES_CP',                          Establecimiento.CP);
    aSql.Fields.Add('ES_CPA',                         Establecimiento.CPA);
    aSql.Fields.Add('ES_CUIT',                        Establecimiento.Cuit);
    aSql.Fields.Add('ES_DESCRIPCION',                 Establecimiento.Descripcion);
    aSql.Fields.Add('ES_DPTO',                        Establecimiento.Dpto);
    aSql.Fields.Add('ES_INTERSECCION',                Establecimiento.Interseccion);
    aSql.Fields.Add('ES_LATITUD',                     Establecimiento.Latitud, dtNumber);
    aSql.Fields.Add('ES_LOCALIDAD',                   Establecimiento.Localidad);
    aSql.Fields.Add('ES_IDLOCALIDAD',                 Establecimiento.LocalidadId);
    aSql.Fields.Add('ES_PRINCIPAL',                   IIF(Establecimiento.Principal ,'S','N'));
    aSql.Fields.Add('ES_LONGITUD',                    Establecimiento.Longitud, dtNumber);
    aSql.Fields.Add('ES_MOTIVOBAJA',                  Establecimiento.MotivoBaja);    //0 null?
    aSql.Fields.Add('ES_NUMEROESTABLECIMIENTO',       Establecimiento.NumeroEstablecimiento);
    aSql.Fields.Add('ES_ORGANISMO',                   Establecimiento.Organismo);
    aSql.Fields.Add('ES_PISO',                        Establecimiento.Piso);
    aSql.Fields.Add('ES_IDPROVINCIA',                 Establecimiento.ProvinciaId);
    aSql.Fields.Add('ES_TEMPORAL',                    IIF(Establecimiento.Temporal, 'S', 'N'));
    aSql.Fields.Add('ES_TIPOESTABLECIMIENTO',         Establecimiento.TipoEstablecimiento);
    aSql.Fields.Add('ES_TIPOORGANISMO',               Establecimiento.TipoOrganismo);
    aSql.Fields.Add('ES_FECHAALTA',                   SQL_DATETIME, False);
    aSql.Fields.Add('ES_USUALTA',                     Sesion.UserId);
    //aSql.Fields.Add('ES_CODIGOART',                 Establecimiento.CodigosArt);
    EjecutarSqlST(aSql.Sql);
  finally
    aSql.Free;
  end;
  {$endregion}
  {$region 'Insertar Codigos ART SRT.SCA_CODIGOSART'}
  sSql := 'SELECT ca_idestablecimiento ' +     //Hago este select para no repetir los codigos ART
          ' FROM srt.sca_codigosart ' +
          ' WHERE 1 = 1 ' +
          ' AND ca_idestablecimiento = :idest ' +
          ' AND ca_codigoart = :cod ';

  for I := 0 to Length(Establecimiento.CodigosArt) - 1 do
  begin
    if not ExisteSqlEx(sSql, [IdEstablecimiento, Establecimiento.CodigosArt[I]]) then //no repetir codigos art
    begin
      aSql := TSql.Create('SRT.SCA_CODIGOSART');
      try
        aSql.SqlType := stInsert;
        aSql.Fields.AddInteger('CA_IDESTABLECIMIENTO', IdEstablecimiento, False);
        aSql.Fields.AddInteger('CA_CODIGOART',         Establecimiento.CodigosArt[I], False);
        EjecutarSqlST(aSql.Sql);
      finally
        aSql.Free;
      end;
    end;
  end;
  {$endregion}
end;

procedure BorrarDatosEstablecimiento(const aCodigoEstablecimiento, aCodigoEstablecimientoEmpresa : Integer);
var
  sSql : String;
begin
  sSql := 'DELETE ' +
        '  FROM SRT.SCA_CODIGOSART' +
        ' WHERE CA_IDESTABLECIMIENTO = (SELECT ES_ID FROM SRT.SES_ESTABLECIMIENTO WHERE ES_CODIGO = :codigo)';
  EjecutarSqlSTEx(sSql, [aCodigoEstablecimiento]);

  sSql := 'DELETE ' +
        '  FROM SRT.SES_ESTABLECIMIENTO' +
        ' WHERE ES_CODIGO = :codigo';
  EjecutarSqlSTEx(sSql, [aCodigoEstablecimiento]);

  sSql := 'DELETE ' +
        '  FROM SRT.SEE_ESTABLECIMIENTOEMPRESA' +
        ' WHERE EE_CODIGO = :codigo';
  EjecutarSqlSTEx(sSql, [aCodigoEstablecimientoEmpresa]);
end;

procedure CrearXMLEstablecimientoEmpresa(const aEstEmp : TEstablecimientoEmpresa;var LDocument: IXMLDocument;const Operacion : TOperacion);
var
  LNodeElement, NodeEmpresaData, NodeEstablecimiento, NodeText, NodeCodigos: IXMLNode;
  I : Integer;
begin
  LDocument := TXMLDocument.Create(nil); //creo la interface (se libera cuando queda fuera de scope)
  LDocument.Active := True;
  LDocument.Version:='1.0';
  LDocument.Encoding:='utf-8';
  LDocument.DocumentElement := LDocument.CreateNode('EstablecimientoEmpresa', ntElement, '');
  LNodeElement := LDocument.DocumentElement;
  LNodeElement.DeclareNamespace('xsi', 'http://www.w3.org/2001/XMLSchema-instance');
  LNodeElement.DeclareNamespace('xsd', 'http://www.w3.org/2001/XMLSchema');
  if Operacion <> opNuevo then
    AgregarNodo(LNodeElement, NodeEmpresaData, 'Codigo', IntToStr(aEstEmp.Codigo), false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeEmpresaData, 'Cuit', aEstEmp.Cuit, false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeEmpresaData, 'CIIU', IntToStr(aEstEmp.Ciiu), false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeEmpresaData, 'Propio', IIF(aEstEmp.Propio,'true','false'), false, 'http://tempuri.org/', false);
  if aEstEmp.InicioActividad <> 0 then
    AgregarNodo(LNodeElement, NodeEmpresaData, 'FechaInicioActividad', aEstEmp.InicioActividad , true, 'http://tempuri.org/', false);
  if aEstEmp.FinActividad <> 0 then
    AgregarNodo(LNodeElement, NodeEmpresaData, 'FechaFinActividad', aEstEmp.FinActividad, true, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeEmpresaData, 'TipoOrganismo', IntToStr(aEstEmp.TipoOrganismo), false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeEmpresaData, 'Organismo', IntToStr(aEstEmp.Organismo), false, 'http://tempuri.org/', false);
  if Operacion = opEliminar then
    AgregarNodo(LNodeElement, NodeEmpresaData, 'MotivoBaja', IntToStr(aEstEmp.MotivoBaja), false,'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeEmpresaData, 'Establecimiento', '', false,'http://tempuri.org/', false);
  NodeEstablecimiento := NodeEmpresaData;
  if Operacion <> opNuevo then
    AgregarNodo(NodeEstablecimiento, NodeText, 'Codigo', IntToStr(aEstEmp.Establecimiento.Codigo));
  AgregarNodo(NodeEstablecimiento, NodeText, 'Cuit', aEstEmp.Establecimiento.Cuit);
  AgregarNodo(NodeEstablecimiento, NodeText, 'NumeroEstablecimiento', IntToStr(aEstEmp.Establecimiento.NumeroEstablecimiento));
  AgregarNodo(NodeEstablecimiento, NodeText, 'TipoEstablecimiento', IntToStr(aEstEmp.Establecimiento.TipoEstablecimiento));
  AgregarNodo(NodeEstablecimiento, NodeText, 'Descripcion', aEstEmp.Establecimiento.Descripcion);
  AgregarNodo(NodeEstablecimiento, NodeText, 'Calle', aEstEmp.Establecimiento.Calle);
  AgregarNodo(NodeEstablecimiento, NodeText, 'Interseccion', aEstEmp.Establecimiento.Interseccion);

  AgregarNodo(NodeEstablecimiento, NodeText, 'Altura', aEstEmp.Establecimiento.Altura, false, 'http://tempuri.org/', false);

  AgregarNodo(NodeEstablecimiento, NodeText, 'Piso', aEstEmp.Establecimiento.Piso);
  AgregarNodo(NodeEstablecimiento, NodeText, 'Dpto', aEstEmp.Establecimiento.Dpto);
  AgregarNodo(NodeEstablecimiento, NodeText, 'LocalidadId', IntToStr(aEstEmp.Establecimiento.LocalidadId));
  AgregarNodo(NodeEstablecimiento, NodeText, 'Localidad', aEstEmp.Establecimiento.Localidad);
  AgregarNodo(NodeEstablecimiento, NodeText, 'ProvinciaId', IntToStr(aEstEmp.Establecimiento.ProvinciaId));
  AgregarNodo(NodeEstablecimiento, NodeText, 'CPA', aEstEmp.Establecimiento.CPA);
  if (aEstEmp.Establecimiento.CP <> '0') then
    AgregarNodo(NodeEstablecimiento, NodeText, 'CP', aEstEmp.Establecimiento.CP);
  AgregarNodo(NodeEstablecimiento, NodeText, 'Principal', IIF(aEstEmp.Establecimiento.Principal,'true', 'false'));
  AgregarNodo(NodeEstablecimiento, NodeText, 'Latitud', FloatToStr(aEstEmp.Establecimiento.Latitud));
  AgregarNodo(NodeEstablecimiento, NodeText, 'Longitud', FloatToStr(aEstEmp.Establecimiento.Longitud));
  AgregarNodo(NodeEstablecimiento, NodeText, 'TipoOrganismo', IntToStr(aEstEmp.Establecimiento.TipoOrganismo));
  AgregarNodo(NodeEstablecimiento, NodeText, 'Organismo', IntToStr(aEstEmp.Establecimiento.Organismo));
  AgregarNodo(NodeEstablecimiento, NodeText, 'Temporal', IIF(aEstEmp.Establecimiento.Temporal, 'true', 'false'));
  if Operacion = opEliminar then
    AgregarNodo(NodeEstablecimiento, NodeText, 'MotivoBaja', IntToStr(aEstEmp.Establecimiento.MotivoBaja));
  AgregarNodo(NodeEstablecimiento, NodeText, 'CodigosART', '');
  NodeCodigos := NodeText;
  for I := 0 to Length(aEstEmp.Establecimiento.CodigosArt) - 1 do
    AgregarNodo(NodeText, NodeCodigos, 'string', IntToStr(aEstEmp.Establecimiento.CodigosArt[I]));
end;

procedure CargarCodigosArt(var Codigos: TCodigos; aIdEstablecimiento: Integer);
var
  sSql : String;
  i : Integer;
begin
  sSql := 'SELECT ca_codigoart FROM srt.sca_codigosart WHERE ca_idestablecimiento = :id ';
  with GetQueryEx(sSql, [aIdEstablecimiento]) do
  try
    SetLength(Codigos, RecordCount);
    i := 0;
    while not Eof do
    begin
      Codigos[i]  := FieldByName('ca_codigoart').AsInteger;
      Next;
      Inc(i);
    end;
  finally
    Free;
  end;
end;

function GetEstablecimientosPorCuit(const aCuit:String): TArrayOfEstablecimientoEmpresa;
var
  aTcpClient : TIdTcpClient;
  I, aIdEstablecimientoEmpresa, iSize: Integer;
  S : String;
  LDocument: IXMLDocument;
  LNodeElement, LNode: IXMLNode;
  ArrayOfEstablecimientoEmpresa : TArrayOfEstablecimientoEmpresa;
begin
  if {IsNotConsultaEstablecimientoNueva(aCuit)}false then  //creo que no deberia verificar si se consulto en el dia.
    Result := GetEstablecimientosFromDB(aCuit)
  else
  begin
    ConectarServicio(aTcpClient, true);
    try
      if aTCPClient.Connected then
      begin
        InsertarLog(aCuit,'','SRT','GETESTABLECIMIENTOSPORCUIT');
        {$region 'Consultar Establecimiento a Servicio SRT'}
        aTcpClient.Socket.WriteLn('GetEstablecimientosPorCuit:' + aCuit); //consulta
        Sleep(10);
        aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
        S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta (size)
        aTCPClient.IOHandler.CheckForDataOnSource(150000); //mientras espero otra respuesta (stream)
        iSize := StrToInt(S); //asigno el tamaño del stream a iSize
        S := aTCPClient.IOHandler.ReadString(iSize ,TidTextEncoding.UTF8); //Obtengo el resto del stream
        aTCPClient.Disconnect; //me desconecto

        S := StrReplace(S, 'Fin de Datos', ''); //Quito el bottom tail que indica que ya se recibio todo
        if Pos('!Error!', S) > 0 then  //veo que no este este string que indica que hubo algun "lio"
          S := 'Error';
        Trim(S);
        {$endregion}
        {$region 'XML a Array'}
        LDocument := TXMLDocument.Create(nil); //creo la interface (se libera cuando queda fuera de scope)
        LDocument.LoadFromXML(S); //cargo el stream que me vino desde el servicio
        LNodeElement := LDocument.ChildNodes.FindNode('ArrayOfEstablecimientoEmpresa'); //busco el primer Nodo
        SetLength(ArrayOfEstablecimientoEmpresa, LNodeElement.ChildNodes.Count); //lo almaceno en una estructura
        for I := 0 to LNodeElement.ChildNodes.Count - 1 do
        begin
          LNode := LNodeElement.ChildNodes.Get(I);
          if LNode.NodeType = ntElement then
          begin
            ArrayOfEstablecimientoEmpresa[I] := CargarEstablecimientoFromXMLNodes(LNode);
          end;
        end;
        {$endregion}
        //Guardo los datos en la tabla
        BeginTrans;
        try
          {$region 'Guardar datos '}
          for i := 0 to Length(ArrayOfEstablecimientoEmpresa) -1 do
          begin
            BorrarDatosEstablecimiento(ArrayOfEstablecimientoEmpresa[i].Establecimiento.Codigo, ArrayOfEstablecimientoEmpresa[i].Codigo);
            aIdEstablecimientoEmpresa := GetSecNextVal('SRT.SEQ_ESTABLECIMIENTOEMPRESA');
            GuardarEstablecimientoEmpresa(ArrayOfEstablecimientoEmpresa[i], aIdEstablecimientoEmpresa);
            GuardarEstablecimiento(ArrayOfEstablecimientoEmpresa[i].Establecimiento, aIdEstablecimientoEmpresa);
          end;
          MatchearEstablecimientos(aCuit);   //Insert pedido por vila
          {$endregion}
          CommitTrans;
        except
          Rollback;
        end;
        Result := ArrayOfEstablecimientoEmpresa;
      end;
    finally
      aTCPClient.Free;
    end;
  end;
end;

function GetEstablecimientosFromDB(const aCuit: String): TArrayOfEstablecimientoEmpresa;
var
  aQuery: TSDQuery;
  sSql: String;
  iLoop : Integer;
begin
  sSql :=
    'SELECT ee_ciiu, ee_codigo, ee_cuit, ee_fechaaltasrt, ee_finactividad, ee_inicioactividad, '+
    '       ee_motivobaja, ee_organismo, ee_propio, ee_tipoorganismo, es_id, es_codigo,' +
    '       es_calle, es_altura, es_cp, es_cpa, es_cuit, es_descripcion, es_dpto, ' +
    '       es_interseccion, es_latitud, es_localidad, es_idlocalidad, es_longitud, ' +
    '       es_motivobaja, es_numeroestablecimiento, es_organismo, es_piso, es_idprovincia, ' +
    '       es_temporal, es_tipoestablecimiento, es_tipoorganismo, es_fechaalta, es_usualta' +
     ' FROM srt.see_establecimientoempresa' +
     '  LEFT JOIN srt.ses_establecimiento ON ee_id = es_idestablecimientoempresa' +
    ' WHERE ee_cuit = :cuit';
  aQuery := GetQueryEx(sSql, [aCuit]);
  with aQuery do
  begin
    iLoop := 0;
    SetLength(Result, aQuery.RecordCount);
    try
      while not Eof do
      begin
        {$region 'Carga EstablecimientoEmpresa'}
        Result[iLoop].FechaAlta                             := 0;
        Result[iLoop].FinActividad                          := 0;
        Result[iLoop].InicioActividad                       := 0;

        Result[iLoop].Ciiu                                  := FieldByName('ee_ciiu').AsInteger;
        Result[iLoop].Codigo                                := FieldByName('ee_codigo').AsInteger;
        Result[iLoop].Cuit                                  := FieldByName('ee_cuit').AsString;
        if not FieldByName('ee_fechaaltasrt').IsNull then
          Result[iLoop].FechaAlta   := FieldByName('ee_fechaaltasrt').AsDateTime;
        if not FieldByName('ee_finactividad').IsNull then
          Result[iLoop].FinActividad   := FieldByName('ee_finactividad').AsDateTime;
        if not FieldByName('ee_inicioactividad').IsNull then
          Result[iLoop].InicioActividad := FieldByName('ee_inicioactividad').AsDateTime;
        Result[iLoop].MotivoBaja                            := FieldByName('ee_motivobaja').AsInteger;
        Result[iLoop].Organismo                             := FieldByName('ee_organismo').AsInteger;
        Result[iLoop].Propio                                := IIF(FieldByName('ee_propio').AsString = 'S', True, False);
        Result[iLoop].TipoOrganismo                         := FieldByName('ee_tipoorganismo').AsInteger;
        {$endregion}
        {$region 'Carga Establecimiento'}
        //Establecimiento
        Result[iLoop].Establecimiento.Altura                := FieldByName('es_altura').AsFloat;
        Result[iLoop].Establecimiento.Calle                 := FieldByName('es_calle').AsString;
        Result[iLoop].Establecimiento.Codigo                := FieldByName('es_codigo').AsInteger;
       // ArrayOfEstablecimientoEmpresa[i].Establecimiento.CodigosART := StrToFloat(LNodeEmpresa.ChildNodes['Cuit'].Text);
        Result[iLoop].Establecimiento.CP                    := FieldByName('es_cp').AsString;
        Result[iLoop].Establecimiento.CPA                   := FieldByName('es_cpa').AsString;
        Result[iLoop].Establecimiento.Cuit                  := FieldByName('es_cuit').AsString;
        Result[iLoop].Establecimiento.Descripcion           := FieldByName('es_descripcion').AsString;
        Result[iLoop].Establecimiento.Dpto                  := FieldByName('es_dpto').AsString;
        Result[iLoop].Establecimiento.Interseccion          := FieldByName('es_interseccion').AsString;
        Result[iLoop].Establecimiento.Latitud               := FieldByName('es_latitud').AsFloat;
        Result[iLoop].Establecimiento.Localidad             := FieldByName('es_localidad').AsString;
        Result[iLoop].Establecimiento.LocalidadId           := FieldByName('es_idlocalidad').AsInteger;
        Result[iLoop].Establecimiento.Longitud              := FieldByName('es_longitud').AsFloat;
        Result[iLoop].Establecimiento.MotivoBaja            := FieldByName('es_motivobaja').AsInteger;
        Result[iLoop].Establecimiento.NumeroEstablecimiento := FieldByName('es_numeroestablecimiento').AsInteger;
        Result[iLoop].Establecimiento.Organismo             := FieldByName('es_organismo').AsInteger;
        Result[iLoop].Establecimiento.Piso                  := FieldByName('es_piso').AsString;
        Result[iLoop].Establecimiento.ProvinciaId           := FieldByName('es_idprovincia').AsInteger;
        Result[iLoop].Establecimiento.Temporal              := IIF(FieldByName('es_temporal').AsString = 'S', True, False);
        Result[iLoop].Establecimiento.TipoEstablecimiento   := FieldByName('es_tipoestablecimiento').AsInteger;
        Result[iLoop].Establecimiento.TipoOrganismo         := FieldByName('es_tipoorganismo').AsInteger;

        //Carga de Codigos ART
        CargarCodigosArt(Result[iLoop].Establecimiento.CodigosArt, FieldByName('es_id').AsInteger);
        {$endregion}
        Inc(iLoop);
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function EnviarNuevoEstablecimientoEmpresa(const Esta : TEstablecimientoEmpresa): TEstablecimientoEmpresa;
var
  aTcpClient : TIdTcpClient;
  LDocument: IXMLDocument;
  EstablecimientoEmpresa : TEstablecimientoEmpresa;
  LNodeElement: IXMLNode;
  XML, S : String;
  iSize : Integer;
  aIdEstablecimientoEmpresa : Integer;
begin
  CrearXMLEstablecimientoEmpresa(Esta, LDocument, opNuevo);
  LDocument.XML.Text := xmlDoc.FormatXMLData(LDocument.XML.Text);
  LDocument.Active := true;
  LDocument.SaveToXML(XML);
  Sleep(50);
  LDocument := nil; //nileo para usar de nuevo
  ConectarServicio(aTcpClient, true);
  InsertarLog(Esta.Cuit,'','ART','ALTAESTABLECIMIENTOEMPRESA');  //LOG
  {$region 'Consultar Establecimiento a Servicio SRT'}
  aTcpClient.Socket.WriteLn('AltaEstablecimientoEmpresa:' + Esta.Cuit);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  aTCPClient.IOHandler.WriteLn(IntToStr(Length(XML)),TidTextEncoding.UTF8);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
   S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  if S <> '' then
    aTCPClient.IOHandler.Write(XML);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := '';
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta (size)
  aTCPClient.IOHandler.CheckForDataOnSource(150000); //mientras espero otra respuesta (stream)
  iSize := StrToInt(S); //asigno el tamaño del stream a iSize
  S := aTCPClient.IOHandler.ReadString(iSize ,TidTextEncoding.UTF8); //Obtengo el resto del stream }
  S := StrReplace(S, 'Fin de Datos', '');
  aTCPClient.Disconnect;
  aTCPClient.Free;
  {$endregion}
  {$region 'Cargar XML Recibido desde SRT'}
  LDocument := TXMLDocument.Create(nil); //creo la interface (se libera cuando queda fuera de scope)
  LDocument.LoadFromXML(S); //cargo el stream que me vino desde el servicio
  LNodeElement := LDocument.ChildNodes.FindNode('EstablecimientoEmpresa'); //busco el primer Nodo
  EstablecimientoEmpresa := CargarEstablecimientoFromXMLNodes(LNodeElement);
  {$endregion}
  BeginTrans;
  try
    {$region 'Guardar en la Base el establecimiento Nuevo'}
    BorrarDatosEstablecimiento(EstablecimientoEmpresa.Establecimiento.Codigo, EstablecimientoEmpresa.Codigo);
    aIdEstablecimientoEmpresa := GetSecNextVal('SRT.SEQ_ESTABLECIMIENTOEMPRESA');
    GuardarEstablecimientoEmpresa(EstablecimientoEmpresa, aIdEstablecimientoEmpresa);
    GuardarEstablecimiento(EstablecimientoEmpresa.Establecimiento, aIdEstablecimientoEmpresa);
    CommitTrans;
    {$endregion}
  except
    RollBack;
  end;
  result := EstablecimientoEmpresa;
end;

function RectificarEstablecimientoEmpresa(const Esta: TEstablecimientoEmpresa): Boolean;
var
  aTcpClient : TIdTcpClient;
  LDocument: IXMLDocument;
  XML, S : String;
  aIdEstablecimientoEmpresa : Integer;
begin
  CrearXMLEstablecimientoEmpresa(Esta, LDocument, opRectificacion);
  LDocument.XML.Text := xmlDoc.FormatXMLData(LDocument.XML.Text);
  LDocument.Active := true;
  LDocument.SaveToXML(XML);
  Sleep(50);
  LDocument := nil; //nileo para usar de nuevo
  ConectarServicio(aTcpClient, true);
  InsertarLog(Esta.Cuit,'','ART','RECTIFICARESTABLECIMIENTOEMPRESA');  //LOG
  {$region 'Consultar Establecimiento a Servicio SRT'}
  aTcpClient.Socket.WriteLn('RectificarEstablecimientoEmpresa:' + Esta.Cuit);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  aTCPClient.IOHandler.WriteLn(IntToStr(Length(XML)),TidTextEncoding.UTF8);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
   S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  if S <> '' then
    aTCPClient.IOHandler.Write(XML);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := '';
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta (size)
  aTCPClient.Disconnect;
  aTCPClient.Free;
  {$endregion}
  BeginTrans;
  try
    {$region 'Guardar en la Base el establecimiento Nuevo'}
    if S ='Rectificacion Correcta' then
    begin
      Result := true;
      BorrarDatosEstablecimiento(Esta.Establecimiento.Codigo, Esta.Codigo);
      aIdEstablecimientoEmpresa := GetSecNextVal('SRT.SEQ_ESTABLECIMIENTOEMPRESA');
      GuardarEstablecimientoEmpresa(Esta, aIdEstablecimientoEmpresa);
      GuardarEstablecimiento(Esta.Establecimiento, aIdEstablecimientoEmpresa);
    end
    else
    Result := false;
    CommitTrans;
    {$endregion}
  except
    RollBack;
    Result := False;
  end;
end;

function RectificarEstablecimiento(const Esta: TEstablecimientoEmpresa): Boolean;
var
  aTcpClient : TIdTcpClient;
  LDocument: IXMLDocument;
  XML, S : String;
  aIdEstablecimientoEmpresa : Integer;
begin
  CrearXMLEstablecimientoEmpresa(Esta, LDocument, opRectificacion);
  LDocument.XML.Text := xmlDoc.FormatXMLData(LDocument.XML.Text);
  LDocument.Active := true;
  LDocument.SaveToXML(XML);
  Sleep(50);
  LDocument := nil; //nileo para usar de nuevo
  ConectarServicio(aTcpClient, true);
  InsertarLog(Esta.Cuit,'','ART','RECTIFICARESTABLECIMIENTO');  //LOG
  {$region 'Consultar Establecimiento a Servicio SRT'}
  aTcpClient.Socket.WriteLn('RectificarEstablecimiento:' + Esta.Cuit);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  aTCPClient.IOHandler.WriteLn(IntToStr(Length(XML)),TidTextEncoding.UTF8);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
   S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  if S <> '' then
    aTCPClient.IOHandler.Write(XML);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := '';
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta (size)
  aTCPClient.Disconnect;
  aTCPClient.Free;
  {$endregion}
  BeginTrans;
  try
    {$region 'Guardar en la Base el establecimiento Nuevo'}
    if S ='Rectificacion Correcta' then
    begin
      Result := true;
      BorrarDatosEstablecimiento(Esta.Establecimiento.Codigo, Esta.Codigo);
      aIdEstablecimientoEmpresa := GetSecNextVal('SRT.SEQ_ESTABLECIMIENTOEMPRESA');
      GuardarEstablecimientoEmpresa(Esta, aIdEstablecimientoEmpresa);
      GuardarEstablecimiento(Esta.Establecimiento, aIdEstablecimientoEmpresa);
    end
    else
    Result := false;
    CommitTrans;
    {$endregion}
  except
    RollBack;
    Result := False;
  end;
end;

function EliminarEstablecimientoEmpresa(const Esta: TEstablecimientoEmpresa): Boolean;
var
  aTcpClient : TIdTcpClient;
  LDocument: IXMLDocument;
  XML, S : String;
begin
  CrearXMLEstablecimientoEmpresa(Esta, LDocument, opEliminar);
  LDocument.XML.Text := xmlDoc.FormatXMLData(LDocument.XML.Text);
  LDocument.Active := true;
  LDocument.SaveToXML(XML);
  Sleep(50);
  LDocument := nil; //nileo para usar de nuevo
  ConectarServicio(aTcpClient, true);
  InsertarLog(Esta.Cuit,'','ART','ELIMINARESTABLECIMIENTOEMPRESA');  //LOG
  {$region 'Consultar Establecimiento a Servicio SRT'}
  aTcpClient.Socket.WriteLn('EliminarEstablecimientoEmpresa:' + Esta.Cuit);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  aTCPClient.IOHandler.WriteLn(IntToStr(Length(XML)),TidTextEncoding.UTF8);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
   S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  if S <> '' then
    aTCPClient.IOHandler.Write(XML);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := '';
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta (size)
  aTCPClient.Disconnect;
  aTCPClient.Free;
  {$endregion}
  BeginTrans;
  try
    {$region 'Guardar en la Base el establecimiento Nuevo'}
    if S = 'Eliminacion Correcta' then
    begin
      Result := true;
      BorrarDatosEstablecimiento(Esta.Establecimiento.Codigo, Esta.Codigo);
    end
    else
      Result := false;
    CommitTrans;
    {$endregion}
  except
    RollBack;
    Result := False;
  end;
end;

function EliminarEstablecimiento(const Esta: TEstablecimientoEmpresa): Boolean;
var
  aTcpClient : TIdTcpClient;
  LDocument: IXMLDocument;
  XML, S : String;
begin
  CrearXMLEstablecimientoEmpresa(Esta, LDocument, opEliminar);
  LDocument.XML.Text := xmlDoc.FormatXMLData(LDocument.XML.Text);
  LDocument.Active := true;
  LDocument.SaveToXML(XML);
  Sleep(50);
  LDocument := nil; //nileo para usar de nuevo
  ConectarServicio(aTcpClient, true);
  InsertarLog(Esta.Cuit,'','ART','ELIMINARESTABLECIMIENTO');  //LOG
  {$region 'Consultar Establecimiento a Servicio SRT'}
  aTcpClient.Socket.WriteLn('EliminarEstablecimiento:' + Esta.Cuit);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  aTCPClient.IOHandler.WriteLn(IntToStr(Length(XML)),TidTextEncoding.UTF8);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
   S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
  if S <> '' then
    aTCPClient.IOHandler.Write(XML);
  aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
  S := '';
  S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta (size)
  aTCPClient.Disconnect;
  aTCPClient.Free;
  {$endregion}
  BeginTrans;
  try
    {$region 'Guardar en la Base el establecimiento Nuevo'}
    if S = 'Eliminacion Correcta' then
    begin
      Result := true;
      BorrarDatosEstablecimiento(Esta.Establecimiento.Codigo, Esta.Codigo);
    end
    else
      Result := false;
    CommitTrans;
    {$endregion}
  except
    RollBack;
    Result := False;
  end;
end;

function CargarEstablecimientoFromXMLNodes(const aNode: IXMLNode): TEstablecimientoEmpresa;
var
  aNodeEmpresa, aNodeCodigos : IXMLNode;
  Y : Integer;
begin
  Result.FechaAlta := 0;
  Result.FinActividad := 0;
  Result.InicioActividad := 0;
  Result.Ciiu   := StrToInt(aNode.ChildNodes['CIIU'].Text);
  Result.Codigo := StrToInt(aNode.ChildNodes['Codigo'].Text);
  Result.Cuit   := aNode.ChildNodes['Cuit'].Text;

  if aNode.ChildNodes['FechaFinActividad'].Text <> '' then
  begin
    with TXSDate.Create() do
    try
      XSToNative(aNode.ChildNodes['FechaFinActividad'].Text);
      Result.FinActividad := AsDate;
    finally
      Free;
    end;
  end;

  if aNode.ChildNodes['FechaInicioActividad'].Text <> '' then
  begin
    with TXSDate.Create() do
    try
      XSToNative(aNode.ChildNodes['FechaInicioActividad'].Text);
      Result.InicioActividad := AsDate;
    finally
      Free;
    end;
  end;

  Result.MotivoBaja           := StrToInt(aNode.ChildNodes['MotivoBaja'].Text);
  Result.Organismo := StrToInt(aNode.ChildNodes['Organismo'].Text);
  if aNode.ChildNodes['Propio'].Text <> '' then
    Result.Propio := StrToBool(aNode.ChildNodes['Propio'].Text);
  Result.TipoOrganismo := StrToInt(aNode.ChildNodes['TipoOrganismo'].Text);
  aNodeEmpresa := aNode.ChildNodes['Establecimiento'];
//  StringReplace(LNodeEmpresa.ChildNodes['Altura'].Text, '.', ',', [])
  Result.Establecimiento.Altura := StrToFloat(StringReplace(aNodeEmpresa.ChildNodes['Altura'].Text, '.', ',', []));
  //ArrayOfEstablecimientoEmpresa[i].Establecimiento.Altura := StrToFloat(LNodeEmpresa.ChildNodes['Altura'].Text);
  Result.Establecimiento.Calle := aNodeEmpresa.ChildNodes['Calle'].Text;
  Result.Establecimiento.Codigo := StrToInt(aNodeEmpresa.ChildNodes['Codigo'].Text);
  // ArrayOfEstablecimientoEmpresa[i].Establecimiento.CodigosART := StrToFloat(LNodeEmpresa.ChildNodes['Cuit'].Text);
  Result.Establecimiento.CP := aNodeEmpresa.ChildNodes['CP'].Text;
  Result.Establecimiento.CPA := aNodeEmpresa.ChildNodes['CPA'].Text;
  Result.Establecimiento.Cuit := aNodeEmpresa.ChildNodes['Cuit'].Text;
  Result.Establecimiento.Descripcion := aNodeEmpresa.ChildNodes['Descripcion'].Text;
  Result.Establecimiento.Dpto := aNodeEmpresa.ChildNodes['Dpto'].Text;
  Result.Establecimiento.Interseccion := aNodeEmpresa.ChildNodes['Interseccion'].Text;
  Result.Establecimiento.Principal :=  StrToBool(aNodeEmpresa.ChildNodes['Principal'].Text);
  Result.Establecimiento.Latitud := StrToFloat(aNodeEmpresa.ChildNodes['Latitud'].Text);
  Result.Establecimiento.Localidad := aNodeEmpresa.ChildNodes['Localidad'].Text;
  Result.Establecimiento.LocalidadId := StrToInt(aNodeEmpresa.ChildNodes['LocalidadId'].Text);
  Result.Establecimiento.Longitud := StrToFloat(aNodeEmpresa.ChildNodes['Longitud'].Text);
  Result.Establecimiento.MotivoBaja := StrToInt(aNodeEmpresa.ChildNodes['MotivoBaja'].Text);
  Result.Establecimiento.NumeroEstablecimiento := StrToInt(aNodeEmpresa.ChildNodes['NumeroEstablecimiento'].Text);
  Result.Establecimiento.Organismo := StrToInt(aNodeEmpresa.ChildNodes['Organismo'].Text);
  Result.Establecimiento.Piso := aNodeEmpresa.ChildNodes['Piso'].Text;
  Result.Establecimiento.ProvinciaId := StrToInt(aNodeEmpresa.ChildNodes['ProvinciaId'].Text);
  Result.Establecimiento.Temporal := StrToBool(aNodeEmpresa.ChildNodes['Temporal'].Text);
  Result.Establecimiento.TipoEstablecimiento := StrToInt(aNodeEmpresa.ChildNodes['TipoEstablecimiento'].Text);
  Result.Establecimiento.TipoOrganismo := StrToInt(aNodeEmpresa.ChildNodes['TipoOrganismo'].Text);
  aNodeCodigos := aNodeEmpresa.ChildNodes.FindNode('CodigosART');
  if aNodeCodigos.ChildNodes.Count > 0 then
  begin
    SetLength(Result.Establecimiento.CodigosArt, aNodeCodigos.ChildNodes.Count);
    for Y := 0 to aNodeCodigos.ChildNodes.Count -1 do
    begin
      Result.Establecimiento.CodigosArt[Y] := StrToInt(aNodeCodigos.ChildNodes.Get(Y).Text);
    end;
  end;
end;

function IsNotConsultaEstablecimientoNueva(const aCuil: String): boolean;
var
  sSql : String;
begin
  sSql := 'SELECT 1' +
          '  FROM srt.scr_consultassrt' +
          ' WHERE cr_tipoconsulta = ''GETESTABLECIMIENTOSPORCUIT'' ' +
          '  AND cr_cuit = :cuil ' +
          '  AND cr_fecha > SYSDATE - 1' +
          '  AND cr_origen = ''SRT'' ';
  Result := ExisteSqlEx(sSql, [aCuil]);
end;

function GetEstablecimientoEmpresaFromDB(const aIdEstEmp: TTableId): TEstablecimientoEmpresa;
var
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT ee_ciiu, ee_codigo, ee_cuit, ee_fechaaltasrt, ee_finactividad, ee_inicioactividad, '+
    '       ee_motivobaja, ee_organismo, ee_propio, ee_tipoorganismo, es_id, es_codigo,' +
    '       es_calle, es_altura, es_cp, es_cpa, es_cuit, es_descripcion, es_dpto, ' +
    '       es_interseccion, es_latitud, es_localidad, es_idlocalidad, es_longitud, ' +
    '       es_motivobaja, es_numeroestablecimiento, es_organismo, es_piso, es_idprovincia, ' +
    '       es_temporal, es_tipoestablecimiento, es_tipoorganismo, es_fechaalta, es_usualta' +
     ' FROM srt.see_establecimientoempresa' +
     '  LEFT JOIN srt.ses_establecimiento ON ee_id = es_idestablecimientoempresa' +
    ' WHERE ee_id = :id';
  aQuery := GetQueryEx(sSql, [aIdEstEmp]);
  with aQuery do
  begin
    try
      if not Eof then
      begin
        {$region 'Carga EstablecimientoEmpresa'}
        Result.FechaAlta                             := 0;
        Result.FinActividad                          := 0;
        Result.InicioActividad                       := 0;

        Result.Ciiu                                  := FieldByName('ee_ciiu').AsInteger;
        Result.Codigo                                := FieldByName('ee_codigo').AsInteger;
        Result.Cuit                                  := FieldByName('ee_cuit').AsString;
        if not FieldByName('ee_fechaaltasrt').IsNull then
          Result.FechaAlta   := FieldByName('ee_fechaaltasrt').AsDateTime;
        if not FieldByName('ee_finactividad').IsNull then
          Result.FinActividad   := FieldByName('ee_finactividad').AsDateTime;
        if not FieldByName('ee_inicioactividad').IsNull then
          Result.InicioActividad := FieldByName('ee_inicioactividad').AsDateTime;
        Result.MotivoBaja                            := FieldByName('ee_motivobaja').AsInteger;
        Result.Organismo                             := FieldByName('ee_organismo').AsInteger;
        Result.Propio                                := IIF(FieldByName('ee_propio').AsString = 'S', True, False);
        Result.TipoOrganismo                         := FieldByName('ee_tipoorganismo').AsInteger;
        {$endregion}
        {$region 'Carga Establecimiento'}
        //Establecimiento
        Result.Establecimiento.Altura                := FieldByName('es_altura').AsFloat;
        Result.Establecimiento.Calle                 := FieldByName('es_calle').AsString;
        Result.Establecimiento.Codigo                := FieldByName('es_codigo').AsInteger;
       // ArrayOfEstablecimientoEmpresa[i].Establecimiento.CodigosART := StrToFloat(LNodeEmpresa.ChildNodes['Cuit'].Text);
        Result.Establecimiento.CP                    := FieldByName('es_cp').AsString;
        Result.Establecimiento.CPA                   := FieldByName('es_cpa').AsString;
        Result.Establecimiento.Cuit                  := FieldByName('es_cuit').AsString;
        Result.Establecimiento.Descripcion           := FieldByName('es_descripcion').AsString;
        Result.Establecimiento.Dpto                  := FieldByName('es_dpto').AsString;
        Result.Establecimiento.Interseccion          := FieldByName('es_interseccion').AsString;
        Result.Establecimiento.Latitud               := FieldByName('es_latitud').AsFloat;
        Result.Establecimiento.Localidad             := FieldByName('es_localidad').AsString;
        Result.Establecimiento.LocalidadId           := FieldByName('es_idlocalidad').AsInteger;
        Result.Establecimiento.Longitud              := FieldByName('es_longitud').AsFloat;
        Result.Establecimiento.MotivoBaja            := FieldByName('es_motivobaja').AsInteger;
        Result.Establecimiento.NumeroEstablecimiento := FieldByName('es_numeroestablecimiento').AsInteger;
        Result.Establecimiento.Organismo             := FieldByName('es_organismo').AsInteger;
        Result.Establecimiento.Piso                  := FieldByName('es_piso').AsString;
        Result.Establecimiento.ProvinciaId           := FieldByName('es_idprovincia').AsInteger;
        Result.Establecimiento.Temporal              := IIF(FieldByName('es_temporal').AsString = 'S', True, False);
        Result.Establecimiento.TipoEstablecimiento   := FieldByName('es_tipoestablecimiento').AsInteger;
        Result.Establecimiento.TipoOrganismo         := FieldByName('es_tipoorganismo').AsInteger;

        //Carga de Codigos ART
        CargarCodigosArt(Result.Establecimiento.CodigosArt, FieldByName('es_id').AsInteger);
        {$endregion}
      end;
    finally
      Free;
    end;
  end;
end;

end.
