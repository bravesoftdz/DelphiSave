unit unfraPerfiles;
{
ALTER TABLE UPF_PERFILES ADD
(
   PF_FECHAALTA               DATE,
   PF_USUALTA                 VARCHAR2(20),
   PF_FECHABAJA               DATE,
   PF_USUBAJA                 VARCHAR2(20)
)
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Mask, ToolEdit, ArtComboBox,
  StdCtrls, PatternEdit, RxToolEdit;

type
  TfraPerfiles = class(TFrame)
    edCodigo: TPatternEdit;
    cmbDescripcion: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosPF_PERFIL: TStringField;
    sdqDatosPF_DESCRIPCION: TStringField;
    sdqDatosPF_FECHABAJA: TDateTimeField;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                          Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
  private
    FOnChange: TNotifyEvent;
    FShowBajas: Boolean;

    function GetModified: Boolean;

    procedure SetModified(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;

    procedure Cargar(ACodigo: String; OnlyValids: Boolean = False);
    procedure DoLostFocus;
    procedure Limpiar;
    procedure SetColors(AColor: TColor);
  published
    property Modified : Boolean      read GetModified  write SetModified;
    property ShowBajas: Boolean      read FShowBajas   write FShowBajas  default False;
    property OnChange : TNotifyEvent read FOnChange    write FOnChange;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, General;

const
  BaseSql = 'SELECT PF_PERFIL, PF_DESCRIPCION, PF_FECHABAJA FROM UPF_PERFILES ';
  OrderBy = ' ORDER BY PF_DESCRIPCION';

{ TfraPerfiles }
procedure TfraPerfiles.Cargar(ACodigo: String; OnlyValids: Boolean = False);
var
  Sql: String;
begin
  Sql := BaseSql + ' WHERE PF_PERFIL = ''' + ACodigo + '''';

  if OnlyValids then
    Sql := Sql + IIF(FShowBajas, '', ' AND PF_FECHABAJA IS NULL');

  if OpenQuery(sdqDatos, Sql, True) then
    cmbDescripcionCloseUp(nil);
end;

procedure TfraPerfiles.DoLostFocus;
begin
  if edCodigo.Focused or cmbDescripcion.Focused then
  begin // Self.Focused
    cmbDescripcion.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfraPerfiles.GetModified: Boolean;
begin
  Result := edCodigo.Modified or cmbDescripcion.Modified;
end;

procedure TfraPerfiles.Limpiar;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
end;

procedure TfraPerfiles.SetColors(AColor: TColor);
begin
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;
end;

procedure TfraPerfiles.SetModified(const Value: Boolean);
begin
  edCodigo.Modified       := Value ;
  cmbDescripcion.Modified := Value ;
end;

procedure TfraPerfiles.cmbDescripcionCloseUp(Sender: TObject);
begin
  edCodigo.Text       := sdqDatosPF_PERFIL.AsString;
  cmbDescripcion.Text := sdqDatosPF_DESCRIPCION.AsString;
  if sdqDatosPF_FECHABAJA.IsNull then
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

procedure TfraPerfiles.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Sql: String;
begin
  if Key = #13 then
  begin
    Sql := BaseSql + ' WHERE PF_PERFIL = ''' + edCodigo.Text + '''' + IIF(FShowBajas, '', ' AND PF_FECHABAJA IS NULL');
    if OpenQuery(sdqDatos, Sql, True) then
      cmbDescripcionCloseUp(Sender);
  end;
end;

procedure TfraPerfiles.cmbDescripcionDropDown(Sender: TObject);
var
    Sql: String;
begin
  if (sdqDatos.Active and (sdqDatosPF_DESCRIPCION.AsString = cmbDescripcion.Text)) then
    Sql := BaseSql + OrderBy
  else
    Sql := BaseSql + ' WHERE UPPER(PF_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
           IIF(FShowBajas,'', ' AND PF_FECHABAJA IS NULL') + OrderBy;

  OpenQuery(sdqDatos, Sql, True);
end;

procedure TfraPerfiles.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                   Highlight: Boolean);
begin
  if not sdqDatosPF_FECHABAJA.IsNull then
    AFont.Color := clRed;
end;

procedure TfraPerfiles.FrameExit(Sender: TObject);
begin
  if (edCodigo.Text <> '') then
  begin
    if (edCodigo.Text <> sdqDatosPF_PERFIL.AsString) then
      Cargar(edCodigo.Text, True)
    else
      cmbDescripcion.Text := sdqDatosPF_DESCRIPCION.AsString;
  end
  else
    cmbDescripcion.Text := '';
end;

constructor TfraPerfiles.Create(AOwner: TComponent);
begin
  inherited;
  FShowBajas := False;
end;

end.
