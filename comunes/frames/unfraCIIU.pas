unit unfraCIIU;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntEdit, StdCtrls, Mask, ToolEdit,
  ArtComboBox, Db, SDEngine, PatternEdit;

type
  TfraCIIU = class(TFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    cmbDescripcion: TArtComboBox;
    edCodigo: TPatternEdit;
    sdqDatosAV_CODIGO: TStringField;
    sdqDatosAV_DESCRIPCION: TStringField;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FOnChange: TNotifyEvent;
    FSql: String;

    function GetModified: Boolean;
    function GetSql: String;

    procedure SetModified(const Value: Boolean);
    procedure SetSql(const Value: String);
  public
    procedure Cargar(ACodigo: String);
    procedure DoLostFocus;
    procedure Limpiar;
    procedure SetColors(AColor: TColor);
  published
    property Modified: Boolean      read GetModified  write SetModified;
    property OnChange: TNotifyEvent read FOnChange    write FOnChange;
    property Sql     : String       read GetSql       write SetSql;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, General;

const
  OrderBy = ' ORDER BY AV_DESCRIPCION';

{ TfraRiesgo }
procedure TfraCIIU.Cargar(ACodigo: String);
var
  sSql: String;
begin
  sSql := GetSql + ' AND AV_CODIGO = ''' + ACodigo + '''';
  if OpenQuery(sdqDatos, sSql, True) then
    cmbDescripcionCloseUp(nil);
end;

procedure TfraCIIU.DoLostFocus;
begin
  if edCodigo.Focused or cmbDescripcion.Focused then
  begin
    cmbDescripcion.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfraCIIU.GetModified: Boolean;
begin
  Result := edCodigo.Modified or cmbDescripcion.Modified;
end;

procedure TfraCIIU.Limpiar;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
end;

procedure TfraCIIU.SetColors(AColor: TColor);
begin
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;
end;

procedure TfraCIIU.SetModified(const Value: Boolean);
begin
  edCodigo.Modified       := Value;
  cmbDescripcion.Modified := Value;
end;

procedure TfraCIIU.cmbDescripcionCloseUp(Sender: TObject);
begin
  edCodigo.Text       := sdqDatosAV_CODIGO.AsString;
  cmbDescripcion.Text := sdqDatosAV_DESCRIPCION.AsString;

  if Assigned(Sender) then
  begin
    if Assigned(FOnChange) then
      OnChange(Self);

    if (edCodigo.Text <> '') then
      DoLostFocus;
  end;
end;

procedure TfraCIIU.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  sSql: String;
begin
  if Key = #13 then
  begin
    sSql := GetSql + ' AND AV_CODIGO = ''' + edCodigo.Text + '''';
    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp(Sender);
  end;
end;

procedure TfraCIIU.cmbDescripcionDropDown(Sender: TObject);
var
  sSql: String;
begin
  if (not (sdqDatos.Active and (sdqDatosAV_DESCRIPCION.AsString = cmbDescripcion.Text))) or (cmbDescripcion.Text = '') then
  begin
    if (cmbDescripcion.Text = '') then
      sSql := GetSql + OrderBy
    else
      sSql := GetSql + ' AND UPPER(AV_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' + OrderBy;

    OpenQuery(sdqDatos, sSql, True);
  end;
end;

procedure TfraCIIU.FrameExit(Sender: TObject);
begin
  if (edCodigo.Text = '') then
  begin
    Limpiar;

    if Assigned(FOnChange) then
      OnChange(Self);
  end
  else if (edCodigo.Text <> sdqDatosAV_CODIGO.AsString) then
    Cargar(edCodigo.Text);
end;

function TfraCIIU.GetSql: String;
begin
  if FSql = '' then
    Result :=
      'SELECT AV_CODIGO, AV_DESCRIPCION' +
       ' FROM CAV_ACTIVIDAD' +
      ' WHERE LENGTH(AV_CODIGO) = 6 '
  else
    Result := FSql;
end;

procedure TfraCIIU.SetSql(const Value: String);
begin
  if FSql <> Value then
  begin
    FSql := Value;
    sdqDatos.Close;
    //Limpiar ;
  end;
end;

end.
