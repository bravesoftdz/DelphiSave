unit unfraPrestadorAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Mask, ToolEdit, ArtComboBox, StdCtrls,
  PatternEdit, Db, SDEngine, IntEdit;

type
  TfraPrestadorAMP = class(TFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    cmbDescripcion: TArtComboBox;
    sdqDatosPR_CODIGO: TFloatField;
    sdqDatosPR_NOMBRE: TStringField;
    sdqDatosDOMICILIO: TStringField;
    sdqDatosPR_LOCALIDAD: TStringField;
    sdqDatosPROVINCIA: TStringField;
    sdqDatosPR_CPOSTAL: TStringField;
    sdqDatosPR_FECHABAJA: TDateTimeField;
    edCodigo: TIntEdit;
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
    function IsSelected: Boolean;

    procedure Cargar(ACodigo: String; OnlyValids: Boolean = False);
    procedure DoLostFocus;
    procedure Limpiar;
    procedure SetColors(AColor: TColor; ABackGround: TColor = -1);
  published
    property Modified : Boolean      read GetModified write SetModified;
    property OnChange : TNotifyEvent read FOnChange   write FOnChange;
    property ShowBajas: Boolean      read FShowBajas  write FShowBajas;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, General;

const
  BaseSql =
    'SELECT ca_identificador pr_codigo, ca_descripcion pr_nombre,' +
          ' INITCAP(utiles.armar_domicilio(ca_calle, ca_numero, ca_pisocalle, ca_departamento)) domicilio,' +
          ' INITCAP(ca_localidad) pr_localidad, INITCAP(pv_descripcion) provincia, ca_codpostal pr_cpostal,' +
          ' ca_fechabaja pr_fechabaja ' +
     ' FROM cpv_provincias, cpr_prestador' +
    ' WHERE ca_provincia = pv_codigo(+)';

  OrderBy = ' ORDER BY ca_descripcion';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraPrestadorAMP }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMP.Cargar(ACodigo: String; OnlyValids: Boolean = False);
var
  Sql: String;
begin
  Sql := BaseSql + ' AND ca_identificador = ''' + ACodigo + '''' ; // Permite Cargar dados de Baja

  if OnlyValids then
    Sql := Sql + IIF(FShowBajas, '', ' AND ca_fechabaja IS NULL');

  if OpenQuery(sdqDatos, Sql, True) then
    cmbDescripcionCloseUp(nil);
end;

procedure TfraPrestadorAMP.DoLostFocus;
begin
  if edCodigo.Focused or cmbDescripcion.Focused then
  begin // Self.Focused
    cmbDescripcion.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfraPrestadorAMP.GetModified: Boolean;
begin
  Result := edCodigo.Modified or cmbDescripcion.Modified;
end;

procedure TfraPrestadorAMP.Limpiar;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
end;

procedure TfraPrestadorAMP.SetColors(AColor: TColor; ABackGround: TColor = -1);
begin
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;

  if ABackGround <> -1 then
  begin
    edCodigo.Color       := ABackGround;
    cmbDescripcion.Color := ABackGround;
  end;
end;

procedure TfraPrestadorAMP.SetModified(const Value: Boolean);
begin
  edCodigo.Modified       := Value;
  cmbDescripcion.Modified := Value;
end;

procedure TfraPrestadorAMP.cmbDescripcionCloseUp(Sender: TObject);
begin
  edCodigo.Text       := sdqDatosPR_CODIGO.AsString;
  cmbDescripcion.Text := sdqDatosPR_NOMBRE.AsString;
  if sdqDatosPR_FECHABAJA.IsNull then
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

procedure TfraPrestadorAMP.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Sql: String;
begin
  if Key = #13 then
  begin
    Sql := BaseSql + ' AND ca_identificador = ''' + edCodigo.Text + '''' + IIF(FShowBajas,'', ' AND ca_fechabaja IS NULL');
    if OpenQuery(sdqDatos, Sql, True) then
      cmbDescripcionCloseUp(Sender);
  end;
end;

procedure TfraPrestadorAMP.cmbDescripcionDropDown(Sender: TObject);
var
  Sql: String;
begin
  if (sdqDatos.Active and (sdqDatosPR_NOMBRE.AsString = cmbDescripcion.Text)) then
    Sql := BaseSql + OrderBy
  else
    Sql := BaseSql + ' AND UPPER(ca_descripcion) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
           IIF(FShowBajas, '', ' AND ca_fechabaja IS NULL') + OrderBy;

  OpenQuery(sdqDatos, Sql, True);
end;

procedure TfraPrestadorAMP.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                       var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatosPR_FECHABAJA.IsNull then
    AFont.Color := clRed;
end;

procedure TfraPrestadorAMP.FrameExit(Sender: TObject);
begin
  if (edCodigo.Text <> '') then
  begin
    if (edCodigo.Text <> sdqDatosPR_CODIGO.AsString) then
      Cargar(edCodigo.Text, True)
    else
      cmbDescripcion.Text := sdqDatosPR_NOMBRE.AsString;
  end
  else
    cmbDescripcion.Text := '';
end;

procedure TfraPrestadorAMP.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) then
    cmbDescripcion.DoDropDown;
end;

function TfraPrestadorAMP.IsSelected: Boolean;
begin
  Result := (edCodigo.Text <> '');
end;

end.
