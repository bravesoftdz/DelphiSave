unit unFraTelefono;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtFrame, StdCtrls, JvExStdCtrls,
  JvListBox, Mask, ArtComboBox, Db, SDEngine, PatternEdit, ComboEditor, ComboGrid, ExtCtrls;

const
  // Posiciones de los campos en la grila..
  PG_AREA = 0;
  PG_INTERNO = 2;
  PG_NUMERO = 1;
  PG_TIPO = 3;

type
  TfraTelefono = class(TArtFrame)
    lbTelefonoTitulo: TLabel;
    btnABMTelefonos: TButton;
    sdqTelefonos: TSDQuery;
    dsTelefonos: TDataSource;
    cmbTelefonos: TComboGrid;
    procedure cmbTelefonosKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTelefonosChange(Sender: TObject);
    procedure cmbTelefonosEnter(Sender: TObject);
    procedure btnABMTelefonosClick(Sender: TObject);
    procedure btnABMTelefonosEnter(Sender: TObject);
  private
    fAutoCommit: Boolean;
    fCampoClave: String;
    fSetTextRow: Boolean;    // Es True cuando se está seteando el texto de una fila del combogrid..
    fExistsCampoHistorico: Boolean;
    fHasChanges: Boolean;
    fId: Integer;
    fListaHistoricos: Array of String;
    fLoaded: Boolean;
    fPrefijo: String;
    fShowCargaRapida: Boolean;
    fTabla: String;
    fTipo: String;
    FUsarValidacionTrabajador: boolean;

    function GetAutoCommit: Boolean;
    function GetCampoClave: String;
    function GetHasChanges: Boolean;
    function GetId: Integer;
    function GetNumbers(const aNumbers: String): String;
    function GetPrefijo: String;
    function GetShowCargaRapida: Boolean;
    function GetTabla: String;
    function GetTipo: String;

    procedure SetHasChanges(const Value: Boolean);
    procedure SetShowCargaRapida(const Value: Boolean);

    procedure DeleteTelefono(const aQuery: TSDQuery);
    procedure InsertTelefono(const aQuery: TSDQuery);
    procedure LoadRow(ADataSet: TDataSet; aPrefijo: String; ARow: Integer);
    procedure MostrarCargaRapida;
    procedure SetearTexto(const aRow: Integer);
    procedure UpdateTelefono(const aQuery: TSDQuery);
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
//    destructor Destroy; override;

    function FormatearNumero(const aNumero: String): String;
    function IsEmpty: Boolean;

    procedure Clear; overload; override;
    procedure Clear(const aClearId: Boolean); reintroduce; overload;
    procedure CopiarLegalAPostal;
    procedure CopiarLegalAPostalNoRepetir;
    procedure CopiarAEndoso(const aIdEndoso: Integer);
    procedure CopiarTelefonosATemp;
    procedure CopiarTempATelefonos(const fPadreId: Integer);
    procedure FillCombo(const aCopiarRegistros: Boolean; const aId: Integer);
    procedure Initialize(const sCampoClave, sPrefijo, sTabla: String); overload;
    procedure Initialize(const aAutoCommit: Boolean; const sCampoClave, sPrefijo, sTabla: String); overload;
    procedure Initialize(const sCampoClave, sPrefijo, sTabla, sTipo: String); overload;
    procedure Initialize(const sCampoClave: String; const sCargaRapida, sHistorico: Boolean; const sPrefijo, sTabla,
                         sTipo: String); overload;
    procedure Initialize(const aAutoCommit: Boolean; const sCampoClave: String; const sCargaRapida, sHistorico: Boolean;
                         const sPrefijo, sTabla, sTipo: String); overload;
    procedure QuitarTelefonosTemporales;

    property AutoCommit: Boolean read GetAutoCommit;
    property CampoClave: String read GetCampoClave;
    property HasChanges: Boolean read GetHasChanges write SetHasChanges;
    property Id: Integer read GetId;
    property Prefijo: String read GetPrefijo;
    property ShowCargaRapida: Boolean read GetShowCargaRapida write SetShowCargaRapida;
    property Tabla: String read GetTabla;
    property Tipo: String read GetTipo;
    property UsarValidacionesTrabajador: boolean read FUsarValidacionTrabajador write FUsarValidacionTrabajador;
  end;

var
  fraTelefono: TfraTelefono;

implementation

uses
  unABMTelefonos, unCustomDataModule, unDmPrincipal, unSesion, unTelefonosCargaRapida, General, AnsiSql, SqlFuncs,
  CustomDlgs, VCLExtra;

{$R *.DFM}

constructor TfraTelefono.Create(AOwner: TComponent);
begin
  inherited;

  fAutoCommit := False;
  fSetTextRow := False;
  HasChanges := False;
  ShowCargaRapida := False;
  DisableControls := True;

  cmbTelefonos.RowCount := 1;
end;

{destructor TfraTelefono.Destroy;
begin
  inherited;
  QuitarTelefonosTemporales;
end;
 }


function TfraTelefono.GetAutoCommit: Boolean;
begin
  Result := fAutoCommit; 
end;

function TfraTelefono.GetCampoClave: String;
begin
  Result := fCampoClave;
end;

function TfraTelefono.GetHasChanges: Boolean;
begin
  Result := fHasChanges;
end;

procedure TfraTelefono.SetHasChanges(const Value: Boolean);
begin
  fHasChanges := Value;
end;

function TfraTelefono.GetId: Integer;
begin
  Result := fId;
end;

function TfraTelefono.GetPrefijo: String;
begin
  Result := fPrefijo;
end;

function TfraTelefono.GetShowCargaRapida: Boolean;
begin
  Result := fShowCargaRapida;
end;

procedure TfraTelefono.SetShowCargaRapida(const Value: Boolean);
begin
  fShowCargaRapida := Value;
end;

function TfraTelefono.GetTabla: String;
begin
  Result := fTabla;
end;

function TfraTelefono.GetTipo: String;
begin
  Result := fTipo;
end;


function TfraTelefono.FormatearNumero(const aNumero: String): String;
begin
// Le da formato al número de teléfono..

  Result := GetNumbers(aNumero);
  if Length(Result) > 4 then
    Insert('-', Result, Length(Result) - 3);

  if Length(Result) > 9 then
    Insert('-', Result, Length(Result) - 8);
end;

function TfraTelefono.GetNumbers(const aNumbers: String): String;
var
  iLoop: Integer;
begin
// Del string pasado como parámetro devuelve solo los números..

  Result := '';

  for iLoop := 1 to Length(aNumbers) do
    if aNumbers[iLoop] in ['0'..'9'] then
      Result := Result + aNumbers[iLoop];
end;

function TfraTelefono.IsEmpty: Boolean;
begin
// Devuelve True si no hay teléfonos cargados..

  Result := (cmbTelefonos.RowCount = 1);
end;


procedure TfraTelefono.Clear;
begin
// Elimina los registros de la tabla temporal y limpia los campos..

  QuitarTelefonosTemporales;

  cmbTelefonos.ColCount := 0;
  cmbTelefonos.Row := 0;
  cmbTelefonos.RowCount := 0;
  cmbTelefonos.Cells[0, 0] := '';
  cmbTelefonos.Clear;

  cmbTelefonos.Text := '';
  cmbTelefonos.EditText := '';

  Font.Color := clWindowText;
  HasChanges := False;
end;

procedure TfraTelefono.Clear(const aClearId: Boolean);
begin
// Elimina los registros de la tabla temporal y limpia los campos..

  if aClearId then
    fId := 0;

  Clear;
end;

procedure TfraTelefono.CopiarLegalAPostal;
var
  sdqTemp: TSDQuery;
  sSql: String;
  sSqlTrans: TSql;
begin
// Duplica los teléfonos Legales como Postales..

  sSql := Format(
    'SELECT *' +
     ' FROM TMP.TMP_TELEFONOS' +
    ' WHERE MP_USUARIOID = %d' +
      ' AND MP_TABLATEL = %s' +
      ' AND MP_TABLAPADREID = %d' +
      ' AND MP_TIPO = ''L''' +
      ' AND MP_ESTADO <> ''B''',
    [Sesion.ID, SqlValue(GetTabla), GetId]);

  sdqTemp := GetQuery(sSql);
  sSqlTrans := TSQL.Create('TMP.TMP_TELEFONOS');
  try
    sSqlTrans.PrimaryKey.Add('MP_ID', 1, False);
    sSqlTrans.SqlType := stInsert;

    while not sdqTemp.Eof do
    begin
      sSqlTrans.Fields.Clear;
      
      sSqlTrans.Fields.Add('MP_USUARIOID',      Sesion.ID);
      sSqlTrans.Fields.Add('MP_TABLATEL',       GetTabla);
      sSqlTrans.Fields.Add('MP_REGISTROTELID',  sdqTemp.FieldByName('MP_REGISTROTELID').AsInteger);
      sSqlTrans.Fields.Add('MP_TABLAPADREID',   GetId);
      sSqlTrans.Fields.Add('MP_TIPO',           'P');
      sSqlTrans.Fields.Add('MP_IDTIPOTELEFONO', sdqTemp.FieldByName('MP_IDTIPOTELEFONO').AsInteger);
      sSqlTrans.Fields.Add('MP_AREA',           sdqTemp.FieldByName('MP_AREA').AsString);
      sSqlTrans.Fields.Add('MP_NUMERO',         sdqTemp.FieldByName('MP_NUMERO').AsString);
      sSqlTrans.Fields.AddInteger('MP_INTERNO', sdqTemp.FieldByName('MP_INTERNO').AsInteger, True);
      sSqlTrans.Fields.Add('MP_PRINCIPAL',      sdqTemp.FieldByName('MP_PRINCIPAL').AsString);
      sSqlTrans.Fields.Add('MP_CONFIRMADO',     sdqTemp.FieldByName('MP_CONFIRMADO').AsString);
      sSqlTrans.Fields.Add('MP_OBSERVACION',    sdqTemp.FieldByName('MP_OBSERVACION').AsString);
      sSqlTrans.Fields.Add('MP_ESTADO',         'A');
      if Self.AutoCommit then
        EjecutarSQL(sSqlTrans.Sql)
      else
        EjecutarSQLST(sSqlTrans.Sql);


      sdqTemp.Next;
    end;
  finally
    sdqTemp.Free;
    sSqlTrans.Free;
  end;
end;

procedure TfraTelefono.CopiarTelefonosATemp;
var
  sdqTelefonos: TSDQuery;
  sHistorico: String;
  sSql: String;
  sSqlTrans: TSql;
  sTipo: String;
begin
// Copia los registros de la tabla asociada a este frame a la tabla temporal de teléfonos..

  sTipo:= GetTipo;
  if Trim(sTipo) <> '' then
    sTipo := Format(' AND (%s_TIPO = ''%s'')', [GetPrefijo, sTipo]);

  sSql := Format(
    'SELECT *' +
     ' FROM %s' +
    ' WHERE (%s = %d) and (%s_FECHABAJA IS NULL) %s',
    [GetTabla, GetCampoClave, GetId, GetPrefijo, sTipo]);

  sdqTelefonos := GetQuery(sSql);
  sSqlTrans := TSQL.Create('TMP.TMP_TELEFONOS');
  with sdqTelefonos do
  try
    try
      if Assigned(FindField(GetPrefijo + '_HISTORICO')) then
        sHistorico := IIF((FieldByName(GetPrefijo + '_HISTORICO') = nil), '', FieldByName(GetPrefijo + '_HISTORICO').AsString);
    except
      sHistorico := 'F';
    end;

    sSqlTrans.PrimaryKey.Add('MP_ID', 1, False);
    sSqlTrans.SqlType := stInsert;

    sSql :=
      'INSERT INTO TMP.TMP_TELEFONOS (MP_ID, MP_USUARIOID, MP_TABLATEL, MP_REGISTROTELID, MP_TABLAPADREID, MP_TIPO,' +
                                    ' MP_IDTIPOTELEFONO, MP_AREA, MP_NUMERO, MP_INTERNO, MP_PRINCIPAL, MP_HISTORICO,' +
                                    ' MP_OBSERVACION, MP_ESTADO)' +
                            ' VALUES (:ID, :USUARIOID, :TABLATEL, :REGISTROTELID, :TABLAPADREID, :TIPO,' +
                                    ' :IDTIPOTELEFONO, :AREA, :NUMERO, :INTERNO, :PRINCIPAL, :HISTORICO, :OBSERVACION,' +
                                    ' :ESTADO)';

    while not Eof do
    begin
      if Trim(GetTipo) = '' then
        sTipo := ' '
      else
        sTipo := FieldByName(GetPrefijo + '_TIPO').AsString;

      sSqlTrans.Fields.Clear;
      sSqlTrans.Fields.Add('MP_USUARIOID',      Sesion.ID);
      sSqlTrans.Fields.Add('MP_TABLATEL',       GetTabla);
      sSqlTrans.Fields.Add('MP_REGISTROTELID',  FieldByName(GetPrefijo + '_ID').AsInteger);
      sSqlTrans.Fields.Add('MP_TABLAPADREID',   FieldByName(GetCampoClave).AsInteger);
      sSqlTrans.Fields.Add('MP_TIPO',           sTipo);
      sSqlTrans.Fields.Add('MP_IDTIPOTELEFONO', FieldByName(GetPrefijo + '_IDTIPOTELEFONO').AsInteger);
      sSqlTrans.Fields.Add('MP_AREA',           FieldByName(GetPrefijo + '_AREA').AsString);
      sSqlTrans.Fields.Add('MP_NUMERO',         FieldByName(GetPrefijo + '_NUMERO').AsString);
      sSqlTrans.Fields.AddInteger('MP_INTERNO', FieldByName(GetPrefijo + '_INTERNO').AsInteger, True);
      sSqlTrans.Fields.Add('MP_PRINCIPAL',      FieldByName(GetPrefijo + '_PRINCIPAL').AsString);
      sSqlTrans.Fields.Add('MP_CONFIRMADO',     FieldByName(GetPrefijo + '_CONFIRMADO').AsString);
      sSqlTrans.Fields.Add('MP_HISTORICO',      sHistorico);
      sSqlTrans.Fields.Add('MP_OBSERVACION',    FieldByName(GetPrefijo + '_OBSERVACION').AsString);
      sSqlTrans.Fields.Add('MP_ESTADO',         'X');
      if Self.AutoCommit then
        EjecutarSQL(sSqlTrans.Sql)
      else
        EjecutarSQLST(sSqlTrans.Sql);

      Next;
      Application.ProcessMessages;
    end;
  finally
    Free;
    sSqlTrans.Free;
  end;
end;

procedure TfraTelefono.CopiarTempATelefonos(const fPadreId: Integer);
var
  sdqTemp: TSDQuery;
  sSql: String;
begin
// Copia los registros de la tabla temporal de teléfonos a la tabla asociada a este frame..

  sSql := Format(
    'SELECT *' +
     ' FROM TMP.TMP_TELEFONOS' +
    ' WHERE MP_USUARIOID = %d' +
      ' AND MP_TABLATEL = %s' +
      ' AND MP_TABLAPADREID = %d' +
      ' AND MP_TIPO = %s',
    [Sesion.ID, SqlValue(GetTabla), GetId, SqlValue(GetTipo)]);

  sdqTemp := GetQuery(sSql);

  if GetId = 0 then
    fId := fPadreId;

  with sdqTemp do
  try
    while not Eof do
    begin
      if FieldByName('MP_ESTADO').AsString = 'A' then
        InsertTelefono(sdqTemp);

      if FieldByName('MP_ESTADO').AsString = 'M' then
        if FieldByName('MP_REGISTROTELID').AsInteger = 0 then
          InsertTelefono(sdqTemp)
        else
          UpdateTelefono(sdqTemp);

      if (FieldByName('MP_ESTADO').AsString = 'B') and (FieldByName('MP_REGISTROTELID').AsInteger > 0) then
        DeleteTelefono(sdqTemp);

      Next;
      Application.ProcessMessages;
    end;
  finally
    Free;
  end;
end;

procedure TfraTelefono.DeleteTelefono(const aQuery: TSDQuery);
var
  sSql: String;
begin
// Elimina los registros marcados como baja de la tabla de teléfono de este frame..

  with aQuery do
    sSql := Format(
      'UPDATE %s' +
        ' SET %s_FECHABAJA = %s, %s_USUBAJA = %s' +
      ' WHERE %s_ID = %d',
      [
        FieldByName('MP_TABLATEL').AsString,
        GetPrefijo,
        SQL_ACTUALDATE,
        GetPrefijo,
        SqlValue(Sesion.UserId),
        GetPrefijo,
        FieldByName('MP_REGISTROTELID').AsInteger
      ]);

  if Self.AutoCommit then
    EjecutarSQL(sSql)
  else
    EjecutarSQLST(sSql);
end;

procedure TfraTelefono.FillCombo(const aCopiarRegistros: Boolean; const aId: Integer);
var
  iRows: Integer;
  sdqData: TSDQuery;
  sSql : String;
begin
// Llena los campos de la grilla del combo..

  fLoaded := False;

  fId := aId;

  if aCopiarRegistros then
  begin
    QuitarTelefonosTemporales;
    CopiarTelefonosATemp;
  end;

  sSql := Format(
    'SELECT MP_AREA, TT_DESCRIPCION, MP_REGISTROTELID, MP_INTERNO, MP_NUMERO, MP_HISTORICO' +
     ' FROM TMP.TMP_TELEFONOS, ATT_TIPOTELEFONO' +
    ' WHERE MP_IDTIPOTELEFONO = TT_ID' +
      ' AND MP_TABLATEL = %s' +
      ' AND MP_TABLAPADREID = %d' +
      ' AND MP_TIPO = %s' +
      ' AND MP_USUARIOID = %d' +
      ' AND MP_ESTADO <> ''B''' +
    ' ORDER BY MP_PRINCIPAL DESC, MP_ID DESC',
    [
      SqlValue(GetTabla),
      aId,
      SqlValue(GetTipo),
      Sesion.ID
    ]);

  sdqData := dmPrincipal.GetQuery(sSql, [qoUniDirectional]);
  try
    cmbTelefonos.ColCount := 4;
    cmbTelefonos.Cells[PG_AREA, 0]    := 'Área';
    cmbTelefonos.Cells[PG_NUMERO, 0]  := 'Número';
    cmbTelefonos.Cells[PG_INTERNO, 0] := 'Interno';
    cmbTelefonos.Cells[PG_TIPO, 0]    := 'Tipo';

    cmbTelefonos.RowCount := 1;
    iRows := 1;
    while not sdqData.Eof do
    begin
      cmbTelefonos.RowCount := iRows + 1;
      LoadRow(sdqData, GetPrefijo, iRows);

      Inc(iRows);
      sdqData.Next;
    end;

    if cmbTelefonos.RowCount = 1 then
    begin
      cmbTelefonos.ColCount := 0;
      cmbTelefonos.RowCount := 0;
      cmbTelefonos.Cells[0, 0] := '';
      cmbTelefonos.Clear;
    end
    else
      SetearTexto(1);
  finally
    sdqData.Free;
  end;

  fLoaded := True;
end;

procedure TfraTelefono.Initialize(const sCampoClave, sPrefijo, sTabla: String);
begin
  Initialize(sCampoClave, sPrefijo, sTabla, ' ');
end;

procedure TfraTelefono.Initialize(const aAutoCommit: Boolean; const sCampoClave, sPrefijo, sTabla: String);
begin
  Initialize(aAutoCommit, sCampoClave, False, False, sPrefijo, sTabla, ' ');
end;

procedure TfraTelefono.Initialize(const sCampoClave, sPrefijo, sTabla, sTipo: String);
begin
  Initialize(sCampoClave, False, False, sPrefijo, sTabla, sTipo);
end;

procedure TfraTelefono.Initialize(const sCampoClave: String; const sCargaRapida, sHistorico: Boolean; const sPrefijo,
  sTabla, sTipo: String);
begin
  Initialize(False, sCampoClave, sCargaRapida, sHistorico, sPrefijo, sTabla, sTipo);
end;

procedure TfraTelefono.Initialize(const aAutoCommit: Boolean; const sCampoClave: String; const sCargaRapida,
  sHistorico: Boolean; const sPrefijo, sTabla, sTipo: String);
begin
// Método que se tiene que invocar al crear el formulario que contiene este componente para inicializarlo..

  fAutoCommit := aAutoCommit;
  fCampoClave := sCampoClave;
  fExistsCampoHistorico := sHistorico;
  fPrefijo := sPrefijo;
  fShowCargaRapida := sCargaRapida;
  fTabla := sTabla;
  fTipo := sTipo;

  QuitarTelefonosTemporales;
end;

procedure TfraTelefono.InsertTelefono(const aQuery: TSDQuery);
var
  sSql: String;
  sTipo: String;
  sTipoValue: String;
begin
// Agrega los registros marcados como Alta a la tabla de teléfonos asociada a este frame..

  sTipo := '';
  sTipoValue := '';
  if Trim(aQuery.FieldByName('MP_TIPO').AsString) <> '' then
  begin
    sTipo := ' ' + GetPrefijo + '_TIPO, ';
    sTipoValue := ' ''' + aQuery.FieldByName('MP_TIPO').AsString + ''', ';
  end;

  with aQuery do
    sSql := Format(
      'INSERT INTO %s (%s_ID, %s, %s %s_IDTIPOTELEFONO, %s_AREA, %s_NUMERO, %s_INTERNO, %s_PRINCIPAL, ' +
                     ' %s_OBSERVACION, %s_FECHAALTA, %s_USUALTA, %s_CONFIRMADO %s)' +
             ' VALUES (%d, %d, %s %d, %s, %s, %s, %s, %s, %s, %s, %s %s)',
      [
        GetTabla,
        GetPrefijo,
        GetCampoClave,
        sTipo,
        GetPrefijo,
        GetPrefijo,
        GetPrefijo,
        GetPrefijo,
        GetPrefijo,
        GetPrefijo,
        GetPrefijo,
        GetPrefijo,
        GetPrefijo,
        IIF(fExistsCampoHistorico, Format(', %s%s', [GetPrefijo, '_HISTORICO']), ''),
        FieldByName('MP_REGISTROTELID').AsInteger,
        GetId,
        sTipoValue,
        FieldByName('MP_IDTIPOTELEFONO').AsInteger,
        SqlValue(FieldByName('MP_AREA').AsString),
        SqlValue(FieldByName('MP_NUMERO').AsString),
        IIF((FieldByName('MP_INTERNO').AsInteger = 0), 'NULL', FieldByName('MP_INTERNO').AsString),
        SqlValue(FieldByName('MP_PRINCIPAL').AsString),
        SqlValue(FieldByName('MP_OBSERVACION').AsString),
        SQL_ACTUALDATE,
        SqlValue(Sesion.UserId),
        SqlValue(FieldByName('MP_CONFIRMADO').AsString),
        IIF(fExistsCampoHistorico, ', ''T''', '')
      ]);

  if Self.AutoCommit then
    EjecutarSQL(sSql)
  else
    EjecutarSQLST(sSql);
end;

procedure TfraTelefono.LoadRow(ADataSet: TDataSet; aPrefijo: String; ARow: Integer);
begin
// Carga los registros en la grilla..

  SetLength(fListaHistoricos, aRow);
  fListaHistoricos[ARow - 1] := ADataSet.FieldByName('MP_HISTORICO').AsString;

  cmbTelefonos.Cells[PG_AREA, ARow] := ADataSet.FieldByName('MP_AREA').AsString;
  cmbTelefonos.Cells[PG_NUMERO, ARow] := ADataSet.FieldByName('MP_NUMERO').AsString;
  if cmbTelefonos.Cells[PG_NUMERO, ARow] = '0' then
    cmbTelefonos.Cells[PG_NUMERO, ARow] := '';

  cmbTelefonos.Cells[PG_INTERNO, ARow] := ADataSet.FieldByName('MP_INTERNO').AsString;
  if cmbTelefonos.Cells[PG_INTERNO, ARow] = '0' then
    cmbTelefonos.Cells[PG_INTERNO, ARow] := '';

  cmbTelefonos.Cells[PG_TIPO, ARow] := ADataSet.FieldByName('TT_DESCRIPCION').AsString;
end;

procedure TfraTelefono.MostrarCargaRapida;
begin
// Carga el formulario de carga rápida..

  frmTelefonosCargaRapida := nil;
  frmTelefonosCargaRapida := TfrmTelefonosCargaRapida.Create(Self);
  frmTelefonosCargaRapida.Mostrar;
end;

procedure TfraTelefono.QuitarTelefonosTemporales;
var
  sSql: String;
begin
// Borra de la tabla temporal de teléfonos los teléfonos asociados al usuario y al frame actuales..

  sSql := 
    'DELETE' +
     ' FROM TMP.TMP_TELEFONOS' +
    ' WHERE MP_USUARIOID = ' + SqlValue(Sesion.ID) +
      ' AND MP_TABLATEL = ' + SqlValue(GetTabla) +
      ' AND MP_TABLAPADREID = ' + SqlValue(GetId) +
      ' AND MP_TIPO = ' + SqlValue(GetTipo);

  if Self.AutoCommit then
    EjecutarSQL(sSql)
  else
    EjecutarSQLST(sSql);
end;

procedure TfraTelefono.SetearTexto(const aRow: Integer);
var
  iArea: String;
  iInterno: String;
  iNumero: String;
begin
// Setea el texto del ComboGrid..

  if fSetTextRow then
    Exit;
  fSetTextRow := True;

  with cmbTelefonos do
  try
    if aRow = 0 then
    begin
      Text := '';
      Exit;
    end;

    if Cells[PG_AREA, aRow] = '' then
      iArea := ''
    else
      iArea := '(' + Cells[PG_AREA, aRow] + ')';

    if Cells[PG_NUMERO, aRow] = '' then
      iNumero := ''
    else
      iNumero := FormatearNumero(Cells[PG_NUMERO, aRow]);

    if Cells[PG_INTERNO, aRow] = '' then
      iInterno := ''
    else
      iInterno := 'Int. ' + Cells[PG_INTERNO, aRow];

    Text := Format('%s %s %s  (%s)', [iArea, iNumero, iInterno, Cells[PG_TIPO, aRow]]);
    if Trim(Text) = '()' then
      Text := '';

    if fListaHistoricos[aRow - 1] = 'T' then
      Text := Cells[PG_NUMERO, aRow];
  finally
    fSetTextRow := False;
  end;
end;

procedure TfraTelefono.SetLocked(const Value: Boolean);
begin
//  inherited;
  btnABMTelefonos.Enabled := not Value;

  if Value Then
    cmbTelefonos.Color:= LOCK_COLOR
  else
    cmbTelefonos.Color:= clWindow;
end;

procedure TfraTelefono.UpdateTelefono(const aQuery: TSDQuery);
var
  sSql: String;
  sTipo: String;
begin
// Actualiza los registros marcados como M a la tabla de teléfonos asociada a este frame..

  sTipo := GetTipo;
  if Trim(sTipo) <> '' then
    sTipo := ' ' + GetPrefijo +'_TIPO = ''' + aQuery.FieldByName('MP_TIPO').AsString + ''', ';

  with aQuery do
    sSql := Format(
      'UPDATE %s' +
        ' SET %s = %d,' +
            ' %s %s_IDTIPOTELEFONO = %d,' +
            ' %s_AREA = %s,' +
            ' %s_NUMERO = %s,' +
            ' %s_INTERNO = %s,' +
            ' %s_PRINCIPAL = %s,' +
            ' %s_OBSERVACION = %s,' +
            ' %s_FECHAMODIF = %s,' +
            ' %s_USUMODIF = %s,' +
            ' %s_CONFIRMADO = %s' +
      ' WHERE %s_ID = %d',
      [
        GetTabla,
        fCampoClave,
        FieldByName('MP_TABLAPADREID').AsInteger,
        sTipo,
        GetPrefijo,
        FieldByName('MP_IDTIPOTELEFONO').AsInteger,
        GetPrefijo,
        SqlValue(FieldByName('MP_AREA').AsString),
        GetPrefijo,
        SqlValue(FieldByName('MP_NUMERO').AsString),
        GetPrefijo,
        IIF((FieldByName('MP_INTERNO').AsInteger = 0), 'NULL', FieldByName('MP_INTERNO').AsString),
        GetPrefijo,
        SqlValue(FieldByName('MP_PRINCIPAL').AsString),
        GetPrefijo,
        SqlValue(FieldByName('MP_OBSERVACION').AsString),
        GetPrefijo,
        SQL_ACTUALDATE,
        GetPrefijo,
        SqlValue(Sesion.UserId),
        GetPrefijo,
        SqlValue(FieldByName('MP_CONFIRMADO').AsString),
        GetPrefijo,
        FieldByName('MP_REGISTROTELID').AsInteger
      ]);

  if Self.AutoCommit then
    EjecutarSQL(sSql)
  else
    EjecutarSQLST(sSql);
end;

procedure TfraTelefono.cmbTelefonosKeyPress(Sender: TObject; var Key: Char);
begin
  // Para que no se pueda modificar el texto..
  Key := #0;
end;

procedure TfraTelefono.cmbTelefonosChange(Sender: TObject);
begin
  if fLoaded then
    SetearTexto(cmbTelefonos.Row);
end;

procedure TfraTelefono.cmbTelefonosEnter(Sender: TObject);
begin
  // La primer fila no puede ser porque es la fila con los títulos de las columnas..
  if (cmbTelefonos.Row = 0) and (cmbTelefonos.RowCount > 1) then
    cmbTelefonos.Row := 1;
end;

procedure TfraTelefono.btnABMTelefonosClick(Sender: TObject);
begin
{  if GetId <= 0 then
  begin
    InfoHint(btnABMTelefonos, 'Antes de cargar un teléfono debe guardar el registro.');
    Exit;
  end;}

  if Self.ShowCargaRapida and not Locked then
    MostrarCargaRapida
  else
    with TfrmTelefonos.Create(Self) do
    try
      DoCargarDatos(GetCampoClave, GetId, GetTabla, GetTipo);
      if UsarValidacionesTrabajador then
      begin
        CodigoDeAreaObligatorio  := True;
        MascaraCelular           := True;
        NumeroLongitudMaxima     := True;
        NumeroEvitarComienzaCero := True;
        CodigoLongitudesMaximas  := True;
        CodigoComienzaConCero    := True;
        CodigoEvitarDobleCero    := True;
      end;
      ShowModal;

      Self.FillCombo(False, GetId);
    finally
      Free;
    end;
end;

procedure TfraTelefono.btnABMTelefonosEnter(Sender: TObject);
begin
  inherited;

  if Self.ShowCargaRapida and not Locked then
    MostrarCargaRapida;
end;

procedure TfraTelefono.CopiarLegalAPostalNoRepetir;
var
  sdqTemp: TSDQuery;
  sSql: String;
  sSqlTrans: TSql;
begin
// Duplica los teléfonos Legales como Postales..
//Borro cualquier cosa que este en temp de telefonos POSTAL(autorizado por tk 61868)
  sSql := Format('DELETE FROM TMP.TMP_TELEFONOS ' +
                 ' WHERE MP_TABLATEL = %s' +
                 ' AND MP_TABLAPADREID = %d' +
                 ' AND MP_TIPO = ''P''',
                 [SqlValue(GetTabla), GetId]);
  if Self.AutoCommit then
    EjecutarSQL(sSql)
  else
    EjecutarSQLST(sSql);

  //Borro cualquier telefono que este guardado del tipo POSTAL
  sSql := Format('DELETE FROM ATO_TELEFONOCONTRATO ' +
                 ' WHERE TO_CONTRATO = %d' +
                 ' AND TO_TIPO = ''P''',
                 [GetId]);
  if Self.AutoCommit then
    EjecutarSQL(sSql)
  else
    EjecutarSQLST(sSql);


  sSql := Format(
    'SELECT *' +
     ' FROM TMP.TMP_TELEFONOS' +
    ' WHERE MP_USUARIOID = %d' +
      ' AND MP_TABLATEL = %s' +
      ' AND MP_TABLAPADREID = %d' +
      ' AND MP_TIPO = ''L''' +
      ' AND MP_ESTADO <> ''B''',
    [Sesion.ID, SqlValue(GetTabla), GetId]);

  sdqTemp := GetQuery(sSql);
  sSqlTrans := TSQL.Create('TMP.TMP_TELEFONOS');
  try
    while not sdqTemp.Eof do
    begin
      sSql := 'SELECT 1 ' +
                ' FROM TMP.TMP_TELEFONOS' +
               ' WHERE MP_TABLATEL = :tabla' +
               ' AND MP_NUMERO = :numero' +
               ' AND MP_PRINCIPAL = :principal' +
               ' AND MP_TIPO = ''P''';
      sSqlTrans.SqlType := stInsert;
      if not ExisteSqlEx(sSql, [GetTabla, sdqTemp.FieldByName('MP_NUMERO').AsString, sdqTemp.FieldByName('MP_PRINCIPAL').AsString]) then
      begin
        sSqlTrans.Fields.Clear;
        sSqlTrans.Fields.Add('MP_USUARIOID',      Sesion.ID);
        sSqlTrans.Fields.Add('MP_TABLATEL',       GetTabla);
        sSqlTrans.Fields.Add('MP_REGISTROTELID',  sdqTemp.FieldByName('MP_REGISTROTELID').AsInteger);
        sSqlTrans.Fields.Add('MP_TABLAPADREID',   GetId);
        sSqlTrans.Fields.Add('MP_TIPO',           'P');
        sSqlTrans.Fields.Add('MP_IDTIPOTELEFONO', sdqTemp.FieldByName('MP_IDTIPOTELEFONO').AsInteger);
        sSqlTrans.Fields.Add('MP_AREA',           sdqTemp.FieldByName('MP_AREA').AsString);
        sSqlTrans.Fields.Add('MP_NUMERO',         sdqTemp.FieldByName('MP_NUMERO').AsString);
        sSqlTrans.Fields.AddInteger('MP_INTERNO', sdqTemp.FieldByName('MP_INTERNO').AsInteger, True);
        sSqlTrans.Fields.Add('MP_PRINCIPAL',      sdqTemp.FieldByName('MP_PRINCIPAL').AsString);
        sSqlTrans.Fields.Add('MP_CONFIRMADO',      sdqTemp.FieldByName('MP_CONFIRMADO').AsString);
        sSqlTrans.Fields.Add('MP_OBSERVACION',    sdqTemp.FieldByName('MP_OBSERVACION').AsString);
        sSqlTrans.Fields.Add('MP_ESTADO',         'A');
        if Self.AutoCommit then
          EjecutarSQL(sSqlTrans.Sql)
        else
          EjecutarSQLST(sSqlTrans.Sql);
      end;

      sdqTemp.Next;
    end;
  finally
    sdqTemp.Free;
    sSqlTrans.Free;
  end;
end;

procedure TfraTelefono.CopiarAEndoso(const aIdEndoso: Integer);
var
  sdqTemp: TSDQuery;
  sSql: String;
  sSqlTrans: TSql;
begin
  sSql := 'DELETE FROM ahl_historicotelefono' +
            ' WHERE hl_idendoso = :endoso';
  if Self.AutoCommit then
    EjecutarSQLEx(sSql, [aIdEndoso])
  else
    EjecutarSQLSTEx(sSql, [aIdEndoso]);

  sSql := Format(
    'SELECT *' +
     ' FROM TMP.TMP_TELEFONOS' +
    ' WHERE MP_USUARIOID = %d' +
      ' AND MP_TABLATEL = %s' +
      ' AND MP_TABLAPADREID = %d' +
      ' AND MP_ESTADO <> ''B''',
    [Sesion.ID, SqlValue(GetTabla), GetId]);

  sdqTemp := GetQuery(sSql);
  sSqlTrans := TSQL.Create('AHL_HISTORICOTELEFONO');
  sSqlTrans.SqlType := stInsert;
  try
    while not sdqTemp.Eof do
    begin
      sSqlTrans.Fields.Clear;
      sSqlTrans.Fields.Add('HL_IDENDOSO',       aIdEndoso);
      //sSqlTrans.Fields.Add('HL_USUARIOID',      Sesion.ID);
      //sSqlTrans.Fields.Add('HL_TABLATEL',       '');
      //sSqlTrans.Fields.Add('HL_REGISTROTELID',  sdqTemp.FieldByName('MP_REGISTROTELID').AsInteger);
      //sSqlTrans.Fields.Add('HL_TABLAPADREID',   GetId);
      sSqlTrans.Fields.Add('HL_TIPO',           sdqTemp.FieldByName('MP_TIPO').AsString);
      sSqlTrans.Fields.Add('HL_IDTIPOTELEFONO', sdqTemp.FieldByName('MP_IDTIPOTELEFONO').AsInteger);
      sSqlTrans.Fields.Add('HL_AREA',           sdqTemp.FieldByName('MP_AREA').AsString);
      sSqlTrans.Fields.Add('HL_NUMERO',         sdqTemp.FieldByName('MP_NUMERO').AsString);
      sSqlTrans.Fields.AddInteger('HL_INTERNO', sdqTemp.FieldByName('MP_INTERNO').AsInteger, True);
      sSqlTrans.Fields.Add('HL_PRINCIPAL',      sdqTemp.FieldByName('MP_PRINCIPAL').AsString);
      sSqlTrans.Fields.Add('HL_CONFIRMADO',     sdqTemp.FieldByName('MP_CONFIRMADO').AsString);
      sSqlTrans.Fields.Add('HL_OBSERVACION',    sdqTemp.FieldByName('MP_OBSERVACION').AsString);
      sSqlTrans.Fields.Add('HL_USUALTA',        Sesion.UserID);
      sSqlTrans.Fields.Add('HL_FECHAALTA',      DBDate);
      if Self.AutoCommit then
        EjecutarSQL(sSqlTrans.Sql)
      else
        EjecutarSQLST(sSqlTrans.Sql);
      sdqTemp.Next;
    end;
  finally
    sdqTemp.Free;
    sSqlTrans.Free;
  end;
end;

end.
