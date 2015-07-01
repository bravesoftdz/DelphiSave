{Selección del Firmante de la tabla CFI_FIRMA para migrar de la CDF}
unit unfraFirmantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit, IntEdit,
  RxToolEdit;

type
  TfraFirmantes = class(TFrame)
    cmbDescripcion: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    edCodigo: TIntEdit;
    sdqDatosFI_ID: TFloatField;
    sdqDatosFI_FIRMANTE: TStringField;
    sdqDatosFI_CARACTER: TStringField;
    sdqDatosFI_FECHABAJA: TDateTimeField;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                          var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoExit(Sender: TObject);
  private
    FShowBajas: Boolean;
    FOnChange : TNotifyEvent;
    FArea :String;
    FModulo :String;
    FOrderBy: String;
    function  SqlWhere : String;
    function  GetModified: Boolean;
    function  GetIsEmpty: boolean;
    function  GetValue: Integer;
    function  GetCodigo: String;
    function  GetOrderBy: String;
    procedure SetModified(const Value: Boolean);
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar(ACodigo :Integer; OnlyValids :Boolean = False);
    procedure SetColors(AColor :TColor);
  published
    property  ShowBajas  : Boolean      read FShowBajas;
    property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    property  Modified   : Boolean      read GetModified  write SetModified;
    property  Area       : String       read FArea        write FArea;
    property  Modulo     : String       read FModulo      write FModulo;
    property  IsEmpty    : Boolean      read GetIsEmpty;
    property  Value      : Integer      read GetValue;
    property  Codigo     : string       read GetCodigo;
    property  OrderBy    : String       read GetOrderBy   write FOrderBy;
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General, AnsiSql;

Const
    BaseSql = 'SELECT fi_id, fi_firmante, fi_caracter, fi_fechabaja ' +
               ' FROM cfi_firma, cfa_firmantearea, cat_areatexto ' +
              ' WHERE fi_id = fa_idfirmante ' +
                ' AND fa_idareatexto = at_id ' +
                ' AND fa_fechabaja IS NULL ' +
                ' AND at_fechabaja IS NULL ';
{-------------------------------------------------------------------------------}
{ TfraFirmantes }
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.Cargar(ACodigo :Integer; OnlyValids :Boolean);
var
  sSql : String;
begin
  sSql := BaseSql + ' AND fi_id = ' + SqlInt(ACodigo) + IIF(OnlyValids, SqlWhere, '');
  if OpenQuery(sdqDatos, sSql, True) then
    cmbDescripcionCloseUp(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.DoLostFocus;
begin
  if edCodigo.Focused or cmbDescripcion.Focused then
  begin
    cmbDescripcion.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;
{-------------------------------------------------------------------------------}
function TfraFirmantes.GetModified: Boolean;
begin
  Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.Limpiar;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.SetColors(AColor: TColor);
begin
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.SetModified(const Value: Boolean);
begin
  edCodigo.Modified       := Value;
  cmbDescripcion.Modified := Value;
end;
{-------------------------------------------------------------------------------}
function TfraFirmantes.SqlWhere: String;
begin
  Result := IIF(Area = '', '', ' AND at_area = ' + SqlValue(Area)) +
            IIF(Modulo = '', '', ' AND at_modulo = ' + SqlValue(Modulo)) +
            IIF(FShowBajas   , '', ' AND fi_fechabaja IS NULL');
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.cmbDescripcionDropDown(Sender: TObject);
var
  sSql :String;
begin
  if (sdqDatos.Active and (sdqDatosFI_FIRMANTE.AsString = cmbDescripcion.Text)) then
    sSql := BaseSql + SqlWhere + GetOrderBy
  else
    sSql := BaseSql +
           ' AND UPPER(fi_firmante) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
             SqlWhere + GetOrderBy;
  OpenQuery(sdqDatos, sSql, True);
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.cmbDescripcionCloseUp(Sender: TObject);
begin
  edCodigo.Value      := sdqDatosFI_ID.AsInteger;
  cmbDescripcion.Text := sdqDatosFI_FIRMANTE.AsString;
  if sdqDatosFI_FECHABAJA.IsNull then
    SetColors(clWindowText)
  else
    SetColors(clRed);

  if Assigned(Sender) then
  begin
    if Assigned(FOnChange) then OnChange(Self);
    if (edCodigo.Text <> '') then DoLostFocus;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  sSql :String;
begin
  if Key = #13 then
  begin
    sSql := BaseSql +
           ' AND fi_id = ' + SqlInt(edCodigo.Value) + SqlWhere;
    if OpenQuery(sdqDatos, sSql, True) then
       cmbDescripcionCloseUp(Sender);
 end;
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                    var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatosFI_FECHABAJA.IsNull then
    AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.FrameExit(Sender: TObject);
begin
  if (edCodigo.Value > 0) then
  begin
    if (edCodigo.Value <> sdqDatosFI_ID.AsInteger) then
      Cargar(edCodigo.Value, True)
    else
      cmbDescripcion.Text := sdqDatosFI_FIRMANTE.AsString;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DoDropDown;
end;
{-------------------------------------------------------------------------------}
function TfraFirmantes.GetIsEmpty: Boolean;
begin
  Result := GetValue = 0;
end;
{-------------------------------------------------------------------------------}
function TfraFirmantes.GetValue: Integer;
begin
  FrameExit(nil);
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName('fi_id').AsInteger
  else
    Result := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfraFirmantes.edCodigoExit(Sender: TObject);
begin
  FrameExit(nil);
end;
{-------------------------------------------------------------------------------}
function TfraFirmantes.GetCodigo: String;
begin
  Result := IntToStr(GetValue);
end;
{-------------------------------------------------------------------------------}
function  TfraFirmantes.GetOrderBy: String;
begin
  Result := ' ORDER BY ' + IIF(FOrderBy = '', 'fi_firmante', FOrderBy);
end;
{-------------------------------------------------------------------------------}
end.
