unit unFraTrabajadorAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtDbFrame, Db, SDEngine, ToolEdit,
  ArtComboBox, StdCtrls, Mask, unArt, unArtMessages, Cuit{, unFraEmpresa, unFraEstablecimiento};

{$IFNDEF ART2}
ESTE FRAME NO ES COMPATIBLE CON LAS APLICACIONES VIEJAS
{$ENDIF}

type
  TfraTrabajadorAMP = class(TArtDbFrame)
    mskCUIL: TMaskEdit;
    cmbNombre: TArtComboBox;
    procedure FrameExit(Sender: TObject);
    procedure mskCUILKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mskCUILKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNombreCloseUp(Sender: TObject);
    procedure cmbNombreDropDown(Sender: TObject);
  private
    FFieldBaja: String;
    FFieldCUIL: String;
    FFieldId: String;
    FFieldNombre: String;
    FMinLength: Integer;
    FMostrarRelLab: Boolean;

    function GetCUIL: TCuil;
    function GetFilterValue(Index: Integer): TTableId;
    function GetIdRelacionLaboral: TTableId;

    procedure Internal_SetCuil(ACuil: TCuil; DoChanges: Boolean = False);
    procedure SetCUIL(const Value: TCuil);
    procedure SetFilterValue(const Index: Integer; const Value: TTableId);
    function GetCUIT: String;
  protected
    FFilters: Array[0..3] of TTableId;

    function ClearOnExit: Boolean; virtual;
    function CancelExitLoad: Boolean; virtual; {Se usa antes del exists, para si se hereda este frame y se agregan controles, chequee los datos }
    function GetSql: String; override;
    function GetSqlOrderBy: String; override;
    function GetSqlWhere: String; override;
    function GetValue: TTableID; override;
    function IsBaja: Boolean; override;

    procedure LoadValues(DoChanges: Boolean = False); override;
    procedure SetEditorsValues; virtual;
    procedure SetValue(const Value: TTableID); override;
    procedure ShowAndHideColumns;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Clear; override;
  published
    property Contrato           : TTableId index 2 read GetFilterValue  write SetFilterValue  default ART_EMPTY_ID;
    property CUIL               : TCuil            read GetCUIL         write SetCUIL;
    property CUIT               : String           read GetCUIT;
    property FieldBaja          : String           read FFieldBaja      write FFieldBaja;
    property FieldCUIL          : String           read FFieldCUIL      write FFieldCUIL;
    property FieldId            : String           read FFieldId        write FFieldId;
    property FieldNombre        : String           read FFieldNombre    write FFieldNombre;
    property IdEmpresa          : TTableId index 0 read GetFilterValue  write SetFilterValue  default ART_EMPTY_ID;
    property IdEstableci        : TTableId index 1 read GetFilterValue  write SetFilterValue  default ART_EMPTY_ID;
    property IdRelacionLaboral  : TTableId         read GetIdRelacionLaboral;
    property IdRelaLaboral      : TTableId index 3 read GetFilterValue  write SetFilterValue  default ART_EMPTY_ID;
    property MinLength          : Integer          read FMinLength      write FMinLength      default 2;
    property MostrarRelaLaboral : Boolean          read FMostrarRelLab  write FMostrarRelLab  default False;
    property Value;
  end;

implementation

{$R *.DFM}

uses
  SqlFuncs, AnsiSql, CustomDlgs, Numeros, unDmPrincipal;

const
  { Alias de los campos }
  TRAB_ALIAS_ID        : String = 'ID';
  TRAB_ALIAS_CUIL      : String = 'CUIL';
  TRAB_ALIAS_NOMBRE    : String = 'NOMBRE';
  TRAB_ALIAS_BAJA      : String = 'FECHA_BAJA';

{-------------------------------------------------------------------------------}
{ TfraTrabajador }
{-------------------------------------------------------------------------------}
constructor TfraTrabajadorAMP.Create(AOwner: TComponent);
begin
  inherited;
  FMinLength     := 2;
  FFieldId       := 'TJ_ID';
  FFieldCUIL     := 'TJ_CUIL';
  FFieldNombre   := 'TJ_NOMBRE';
  FFieldBaja     := 'NULL';
  FMostrarRelLab := False;
end;

function TfraTrabajadorAMP.GetFilterValue(Index: Integer): TTableId;
begin
  Result := FFilters[Index];
end;

function TfraTrabajadorAMP.GetSql: String;
//var
//  pFiltered: Boolean;
//  sOuter: String;
begin
  if FSql <> '' then
    Result := inherited GetSql
  else
  begin
    Result :=
      'SELECT tj_id AS "ID", tj_cuil AS "CUIL", tj_nombre AS "NOMBRE", fecha_baja, rl_id' +
       ' FROM (SELECT tj_id, tj_cuil, tj_nombre, NULL AS "FECHA_BAJA", rl_id' +
               ' FROM comunes.ctj_trabajador, comunes.crl_relacionlaboral' +
              ' WHERE tj_id = rl_idtrabajador' +
                ' AND rl_contrato = ' + SqlValue(Contrato) +
              ' UNION' +
             ' SELECT tj_id, tj_cuil, tj_nombre, NULL AS "FECHA_BAJA", hl_id rl_id' +
               ' FROM comunes.ctj_trabajador ctj, comunes.chl_historicolaboral' +
              ' WHERE tj_id = hl_idtrabajador' +
                ' AND hl_contrato = ' + SqlValue(Contrato) + ')' +
      ' WHERE (1 = 1)';

//    pFiltered := (IdRelaLaboral <> ART_EMPTY_ID) or (IdEmpresa <> ART_EMPTY_ID) or (Contrato <> ART_EMPTY_ID) or (IdEstableci <> ART_EMPTY_ID);
  end
end;

function TfraTrabajadorAMP.GetSqlOrderBy: String;
begin
  Result := ' ' + SQL_ORDERBY + ' ' + SqlSimpleAlias(TRAB_ALIAS_NOMBRE);
end;

function TfraTrabajadorAMP.GetSqlWhere: String;
begin
  if FShowBajas then
    Result := ''
  else
    Result := ' AND ' + FFieldBaja + ' IS NULL';
end;

function TfraTrabajadorAMP.GetValue: TTableID;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName( TRAB_ALIAS_ID ).AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfraTrabajadorAMP.IsBaja: Boolean;
begin
  Result := not sdqDatos.FieldByName(TRAB_ALIAS_BAJA).IsNull;
end;

procedure TfraTrabajadorAMP.SetFilterValue(const Index: Integer; const Value: TTableId);
var
  Field : TField;

  function GetFieldName: String;
  begin
    case Index of
      0: Result := 'EM_ID';
      1: Result := 'ES_ID';
      2: Result := 'CONTRATO';
    end;
  end;
begin
  if FFilters[Index] <> Value then
  begin
    FFilters[Index] := Value;
    Field := sdqDatos.FindField(GetFieldName);
    if not (Assigned(Field) and (Field.AsInteger = FFilters[Index])) then
      Clear;
  end;
end;

procedure TfraTrabajadorAMP.SetValue(const Value: TTableID);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FFieldID + ' = ' + SqlInt(Value);

  if OpenQuery(sdqDatos, sSql, True) then
    LoadValues(False);
end;

procedure TfraTrabajadorAMP.FrameExit(Sender: TObject);
begin
  if not ReadOnly then
  begin
    if (mskCUIL.Text = '') and ClearOnExit then
      Clear
    else if (mskCUIL.Text <> '') and ((not sdqDatos.Active) or (mskCUIL.Text <> sdqDatos.FieldByName(TRAB_ALIAS_CUIL).AsString)) then
      Internal_SetCuil(mskCUIL.Text, True)
    else if not CancelExitLoad then
      LoadValues(False);
  end;
end;

procedure TfraTrabajadorAMP.Internal_SetCuil(ACuil: TCuil; DoChanges: Boolean);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FFieldCUIL + ' = ' + SqlString(ACuil, True);

  if OpenQuery(sdqDatos, sSql, True) then
    LoadValues(DoChanges);
end;

procedure TfraTrabajadorAMP.mskCUILKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbNombre.DoDropDown;
end;

procedure TfraTrabajadorAMP.mskCUILKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not mskCUIL.ReadOnly) then
    Internal_SetCuil(mskCUIL.Text, True);
end;

procedure TfraTrabajadorAMP.cmbNombreCloseUp(Sender: TObject);
begin
  if cmbNombre.Text = '' then
    Clear
  else
    LoadValues(True);
end;

procedure TfraTrabajadorAMP.cmbNombreDropDown(Sender: TObject);
var
  sSql: String;
begin
  if (Length(Trim(cmbNombre.Text)) < FMinLength) then
  begin
    Clear;
    MsgBoxFmt(SMinLength, [LowerCase(NumLetras( FMinLength ))], MB_ICONEXCLAMATION);

    cmbNombre.SetFocus;
  end
  else
  begin
    sSql := GetSql +
            ' AND ' + FieldNombre + ' LIKE ' + SQL_QUOTE + cmbNombre.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
            GetSqlWhere + GetSqlOrderBy;

    OpenQuery(sdqDatos, sSql, True);

    if mskCUIL.Text <> '' then
      sdqDatos.Locate(TRAB_ALIAS_CUIL, mskCUIL.Text, []);

    ShowAndHideColumns;
  end;
end;

procedure TfraTrabajadorAMP.LoadValues(DoChanges: Boolean);
begin
  SetEditorsValues;
  if IsBaja then
    Font.Color := clRed
  else
    Font.Color := clWindowText;

  if DoChanges then
  begin
    Change;

    if (mskCUIL.Text <> '') then {Se se cargaron los datos}
      DoLostFocus;
  end;
end;

procedure TfraTrabajadorAMP.SetEditorsValues;
begin
  mskCUIL.Text   := sdqDatos.FieldByName(TRAB_ALIAS_CUIL).AsString;
  cmbNombre.Text := sdqDatos.FieldByName(TRAB_ALIAS_NOMBRE).AsString;
end;

procedure TfraTrabajadorAMP.Clear;
begin
  mskCUIL.Text := '';
  cmbNombre.Text := '';
  inherited;
end;

procedure TfraTrabajadorAMP.ShowAndHideColumns; { Solo deja visible aquellas columnas que tienen el campo en el query }
var
  i: Integer;
begin
  for i := 0 to cmbNombre.Columns.Count - 1 do
    cmbNombre.Columns[i].Visible := Assigned(sdqDatos.FindField(cmbNombre.Columns[i].FieldName));
end;

function TfraTrabajadorAMP.CancelExitLoad: Boolean;
begin
  Result := False;
end;

function TfraTrabajadorAMP.ClearOnExit: Boolean;
begin
  Result := True;
end;

function TfraTrabajadorAMP.GetCUIL: TCuil;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(TRAB_ALIAS_CUIL).AsString
  else
    Result := '';
end;

procedure TfraTrabajadorAMP.SetCUIL(const Value: TCuil);
begin
  Internal_SetCuil(Value, True);
end;

function TfraTrabajadorAMP.GetIdRelacionLaboral: TTableId;
begin
  if IsSelected and Assigned(sdqDatos.FindField('RL_ID')) then
    Result := sdqDatos.FindField('RL_ID').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfraTrabajadorAMP.GetCUIT: String;
begin
  if IsSelected then
    Result := ValorSQLEx('SELECT em_cuit ' +
                           'FROM aco_contrato, aem_empresa ' +
                          'WHERE co_idempresa = em_id ' +
                            'AND co_contrato = :contrato', [Contrato])
  else
    Result := '';
end;

end.
