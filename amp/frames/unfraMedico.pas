unit unfraMedico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Mask, ToolEdit, ArtComboBox, StdCtrls,
  PatternEdit, Db, SDEngine, IntEdit;

type
  TfraMedico = class(TFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    cmbDescripcion: TArtComboBox;
    sdqDatosME_MATRICULA: TStringField;
    sdqDatosME_NOMBRE: TStringField;
    sdqDatosME_FECHABAJA: TDateTimeField;
    edCodigo: TPatternEdit;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FOnChange: TNotifyEvent;
    FShowBajas: Boolean;

    function GetModified: Boolean;
    
    procedure SetModified(const Value: Boolean);
  public
    procedure Cargar(ACodigo: String; OnlyValids: Boolean = False);
    procedure DoLostFocus;
    procedure Limpiar;
    procedure SetColors(AColor: TColor; ABackGround: TColor = -1);
  published
    property Modified : Boolean      read GetModified  write SetModified;
    property OnChange : TNotifyEvent read FOnChange    write FOnChange;
    property ShowBajas: Boolean      read FShowBajas;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, General, AnsiSql;

const
  BaseSql =
    'SELECT ME_MATRICULA, ME_NOMBRE, ME_FECHABAJA' +
     ' FROM AME_MEDICO' +
    ' WHERE 1 = 1 ';
  OrderBy = ' ORDER BY ME_NOMBRE';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraPrestadorAMP }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraMedico.Cargar(ACodigo: String; OnlyValids: Boolean = False);
var
  Sql: String;
begin
  Sql := BaseSql + ' AND ME_MATRICULA = ''' + ACodigo + '''' ; // Permite Cargar dados de Baja

  if OnlyValids then
    Sql := Sql + IIF(FShowBajas, '', ' AND ME_FECHABAJA IS NULL');

  if OpenQuery(sdqDatos, Sql, True) then
    cmbDescripcionCloseUp(nil);
end;

procedure TfraMedico.DoLostFocus;
begin
  if edCodigo.Focused or cmbDescripcion.Focused then
  begin // Self.Focused
    cmbDescripcion.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfraMedico.GetModified: Boolean;
begin
  Result := edCodigo.Modified or cmbDescripcion.Modified;
end;

procedure TfraMedico.Limpiar;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
end;

procedure TfraMedico.SetColors(AColor: TColor; ABackGround: TColor = -1);
begin
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;

  if ABackGround <> -1 then
  begin
    edCodigo.Color       := ABackGround;
    cmbDescripcion.Color := ABackGround;
  end;
end;

procedure TfraMedico.SetModified(const Value: Boolean);
begin
  edCodigo.Modified       := Value;
  cmbDescripcion.Modified := Value;
end;

procedure TfraMedico.cmbDescripcionCloseUp(Sender: TObject);
begin
  edCodigo.Text       := sdqDatosME_MATRICULA.AsString;
  cmbDescripcion.Text := sdqDatosME_NOMBRE.AsString;
  if sdqDatosME_FECHABAJA.IsNull then
    SetColors(clWindowText)
  else
    SetColors(clRed);

  if Assigned(Sender) then
  begin
    if Assigned(FOnChange) then
      OnChange(Self);

    if (edCodigo.Text <> '') then
      DoLostFocus;
  end;
end;

procedure TfraMedico.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Sql: String;
begin
  if Key = #13 then
  begin
    Sql := BaseSql + ' AND ME_MATRICULA = ' + SqlValue(edCodigo.Text) + IIF(FShowBajas,'', ' AND ME_FECHABAJA IS NULL');
    if OpenQuery(sdqDatos, Sql, True) then
      cmbDescripcionCloseUp(Sender);
  end;
end;

procedure TfraMedico.cmbDescripcionDropDown(Sender: TObject);
var
  Sql: String;
begin
  if (sdqDatos.Active and (sdqDatosME_NOMBRE.AsString = cmbDescripcion.Text)) then
    Sql := BaseSql + OrderBy
  else
    Sql :=
      BaseSql + ' AND UPPER(ME_NOMBRE) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
      IIF(FShowBajas, '', ' AND ME_FECHABAJA IS NULL') + OrderBy;

  OpenQuery(sdqDatos, Sql, True);

  if (Sql = BaseSql + OrderBy) then
    sdqDatos.Locate('ME_NOMBRE', cmbDescripcion.Text, []);
end;

procedure TfraMedico.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                 Highlight: Boolean);
begin
  if not sdqDatosME_FECHABAJA.IsNull then
    AFont.Color := clRed;
end;

procedure TfraMedico.FrameExit(Sender: TObject);
begin
  if (edCodigo.Text <> '') then
  begin
    if (edCodigo.Text <> sdqDatosME_MATRICULA.AsString) then
      Cargar(edCodigo.Text, True)
    else
      cmbDescripcion.Text := sdqDatosME_NOMBRE.AsString;
  end
  else
    cmbDescripcion.Text := '';
end;

procedure TfraMedico.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) then
    cmbDescripcion.DoDropDown;
end;

end.
