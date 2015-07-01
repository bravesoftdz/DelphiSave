unit unFraEstablecimiento;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ArtComboBox, unArt, unFraEmpresa, JvAppHotKey, RxToolEdit;

{$IFNDEF ART2}
ESTE FRAME NO ES COMPATIBLE CON LAS APLICACIONES VIEJAS
{$ENDIF}

type
  TfraEstablecimiento = class(TfraCodigoDescripcion)
    procedure HotKeyMethod(Sender: TObject);
  private
    FfraEmpresa: TfraEmpresa;
    function GetFilterValue(Index: Integer): TTableId;
    procedure SetFilterValue(const Index: Integer; const Value: TTableId);
    procedure SetfraEmpresa(const Value: TfraEmpresa);
    function GetNroEstablecimiento: integer;
  protected
    FOnfraEmpresaChange : TNotifyEvent;
    FFilters: array[0..1] of TTableId;
    procedure SetValue(const Value: TValueType); override;
    function GetSql: String; override;
    procedure OnfraEmpresaChange(Sender : TObject);
    function CheckFilterValue(const Index: Integer) : boolean;
    procedure LoadValues(DoChanges: Boolean = False); override;

    {Oculta las Propiedades}
    property TableName;
    property FieldID;
    property FieldCodigo;
    property FieldDesc;
    property FieldBaja;
    property ExtraFields;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function IsBaja : Boolean; override;
  published
    property IdEmpresa   : TTableId index 0 read GetFilterValue  write SetFilterValue default ART_EMPTY_ID;
    property Contrato    : TTableId index 1 read GetFilterValue  write SetFilterValue default ART_EMPTY_ID;
    property fraEmpresa  : TfraEmpresa      read FfraEmpresa     write SetfraEmpresa;
    property NroEstablecimiento : integer read GetNroEstablecimiento;
  end;

implementation

{$R *.DFM}

uses
  SqlFuncs, AnsiSql,
  {$IFDEF ORACLE}
  unUtilsArchivo,
  {$ENDIF}
  CustomDlgs, StrFuncs;

var
  FJvApplicationHotKeyEstabl: TJvApplicationHotKey;
  HKContrato, HKEstablecimiento: Integer;

{-------------------------------------------------------------------------------}
{ TfraEstablecimiento }
{-------------------------------------------------------------------------------}
constructor TfraEstablecimiento.Create(AOwner: TComponent);
begin
  inherited;
  FTableName   := 'AES_ESTABLECIMIENTO' + GetDBLink();
  FFieldID     := 'ES_ID';
  FFieldCodigo := 'ES_NROESTABLECI';
  FFieldDesc   := 'ES_NOMBRE';
  FFieldBaja   := 'ES_FECHABAJA';
  FExtraFields := '';
  cmbDescripcion.DataSource := dsDatos;

  if not Assigned(FJvApplicationHotKeyEstabl) then //Creo el objeto una sola vez en toda la app...
    FJvApplicationHotKeyEstabl := TJvApplicationHotKey.Create(Application.MainForm);

  Hint := 'Presione Ctrl + Shift + F3 para ver la documentación digitalizada';
  ShowHint := True;

  with FJvApplicationHotKeyEstabl do
  begin
    HotKey := 24690; {Ctrl + Shift + F3}
    Active := True;
    OnHotKey := HotKeyMethod;
  end;
end;
{-------------------------------------------------------------------------------}
destructor TfraEstablecimiento.Destroy;
begin
  try
    if Assigned(FfraEmpresa) and Assigned(Self.Parent) and not (csDestroying in Self.Parent.ComponentState) then
      FfraEmpresa.OnChange := FOnfraEmpresaChange;
  except
  end;

  inherited;
end;
{-------------------------------------------------------------------------------}
function TfraEstablecimiento.GetFilterValue(Index: Integer): TTableId;
begin
  Result := FFilters[Index];
  if (Result = ART_EMPTY_ID) and Assigned(FfraEmpresa) then
  begin
    case Index of
      0: Result := FfraEmpresa.Value;
      1: Result := FfraEmpresa.Contrato;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfraEstablecimiento.GetSql: String;
begin
  Result := inherited GetSql;
  AddField( Result, ' ART.UTILES.ARMAR_DOMICILIO(ES_CALLE,ES_NUMERO,ES_PISO,ES_DEPARTAMENTO,NULL) ' +
                    ' ||ART.UTILES.ARMAR_LOCALIDAD (ES_CPOSTAL, NULL,ES_LOCALIDAD, ES_PROVINCIA)', 'DOMICILIO');

  AddField(Result, ' AFI.Get_Telefonos(''ATE_TELEFONOESTABLECIMIENTO'', ES_ID)', 'TELEFONO');

  if Contrato <> ART_EMPTY_ID then
  begin
    AddField( Result, 'ES_CONTRATO', 'CONTRATO' );
    AddCondition( Result, 'ES_CONTRATO = ' + SqlValue(Contrato) );
  end
  else if IdEmpresa <> ART_EMPTY_ID then
  begin
    AddTable( Result, 'ACO_CONTRATO' + GetDBLink());
    AddField( Result, 'ES_CONTRATO', 'CONTRATO' );
    AddField( Result, 'CO_IDEMPRESA', 'IDEMPRESA' );
    AddCondition( Result, 'ES_CONTRATO = CO_CONTRATO' );
    AddCondition( Result, 'CO_IDEMPRESA = ' + SqlValue(IdEmpresa) );
  end else
    InfoHint(edCodigo, 'Debe seleccionar una empresa para poder listar los establecimientos.', True); 
end;
{-------------------------------------------------------------------------------}
procedure TfraEstablecimiento.OnfraEmpresaChange(Sender: TObject);
begin
  if CheckFilterValue(0) then
    CheckFilterValue(1);

  if Assigned(FOnfraEmpresaChange) then
    FOnfraEmpresaChange(Self);
end;
{-------------------------------------------------------------------------------}
function TfraEstablecimiento.CheckFilterValue(const Index: Integer): boolean;
var
  Field : TField;

  function GetFieldName : String;
  begin
    Case Index of
      0: Result := 'IDEMPRESA';
      1: Result := 'CONTRATO';
    end;
  end;
begin
  Field := sdqDatos.FindField( GetFieldName );
  if not (Assigned(Field) and (Field.AsInteger = GetFilterValue(Index))) then
  begin
    Result := False;
    Clear;
  end else
    Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetFilterValue(const Index: Integer; const Value: TTableId);
begin
  if FFilters[Index] <> Value then
  begin
    FFilters[Index] := Value;

    if Index = 1 then
      begin
        HKContrato        := Value;
        HKEstablecimiento := 0;
      end;  

    Change;
    CheckFilterValue( Index );
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetfraEmpresa(const Value: TfraEmpresa);
begin
  if FfraEmpresa <> Value then
  begin
    if Assigned(FfraEmpresa) then
      FfraEmpresa.OnChange := FOnfraEmpresaChange;

    FfraEmpresa := Value;

    if Assigned(FfraEmpresa) then
    begin
      FOnfraEmpresaChange  := FfraEmpresa.OnChange;
      FfraEmpresa.OnChange := OnfraEmpresaChange;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetValue(const Value: TValueType);
begin
  if (IdEmpresa <> ART_EMPTY_ID) or (Contrato <> ART_EMPTY_ID) then
    inherited;
end;
{-------------------------------------------------------------------------------}
function TfraEstablecimiento.IsBaja: Boolean;
begin
  Result := inherited IsBaja;
end;
{-------------------------------------------------------------------------------}
function TfraEstablecimiento.GetNroEstablecimiento: integer;
begin
  Result := StrToIntDef(edCodigo.Text, 0);
end;
{-------------------------------------------------------------------------------}
procedure TfraEstablecimiento.HotKeyMethod(Sender: TObject);
begin
{$IFDEF ORACLE}
  if (HKContrato > 0) and (HKEstablecimiento > 0) then
    DoCargarImagenesDigitalizadasHyS(Self, HKContrato, HKEstablecimiento)
{$ENDIF}
end;
{-------------------------------------------------------------------------------}
procedure TfraEstablecimiento.LoadValues(DoChanges: Boolean);
begin
  inherited;
  HKEstablecimiento := StrToIntDef(edCodigo.Text, 0);
end;
{-------------------------------------------------------------------------------}
end.