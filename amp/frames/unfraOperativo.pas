unit unfraOperativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, ArtComboBox,
  PeriodoPicker, Db, SDEngine, unArtFrame;

type
  TfraOperativo = class(TArtFrame)
    edPeriodo: TPeriodoPicker;
    cmbDescripcion: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosPE_PERIODO: TStringField;
    sdqDatosPE_DESCRIPCION: TStringField;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure edPeriodoExit(Sender: TObject);
    procedure edPeriodoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSql: String;
//    FOnChange: TNotifyEvent;

    function GetSql: String;
//    function GetModified: Boolean;
//    procedure SetModified(const Value: Boolean);
  protected
    procedure SetForeColor(const Value: TColor); override;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Cargar(ACodigo: String);
    procedure Clear; override;
    procedure DoLostFocus;
    procedure Limpiar;
    procedure SetColors(AColor: TColor; ABackGround: TColor = -1);
  published
    property Sql: String read GetSql write FSql;
//    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
//    Property  Modified   : Boolean      read GetModified  write SetModified;
  end;

const
  BaseSql = 'SELECT PE_PERIODO, PE_DESCRIPCION FROM AMP_PERIODOS WHERE 1=1 ';
  OrderBy = ' ORDER BY PE_PERIODO';

implementation

{$R *.DFM}

uses
  unDmPrincipal;

{----------------------------------------------------------------------------------------------------------------------}
{ TfraOperativo }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraOperativo.Create(AOwner: TComponent);
begin
  inherited;
  FSql := '';
end;

procedure TfraOperativo.Cargar(ACodigo: String);
var
  sSql: String;
begin
  sSql := GetSql + ' AND PE_PERIODO = ''' + ACodigo + '''' ; // Permite Cargar dados de Baja

  if OpenQuery(sdqDatos, sSql, True) then
    cmbDescripcionCloseUp(nil);
end;

procedure TfraOperativo.DoLostFocus;
begin
//    if edPeriodo.Focused or cmbDescripcion.Focused Then begin
  if cmbDescripcion.CanFocus then
  begin
    cmbDescripcion.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

{
function TfraOperativo.GetModified: Boolean;
begin
    Result := edPeriodo.Modified or cmbDescripcion.Modified;
end;
}

function TfraOperativo.GetSql: String;
begin
  if FSql = '' then
  begin
    Result :=
      'SELECT PE_PERIODO, PE_DESCRIPCION' +
       ' FROM AMP_PERIODOS' +
      ' WHERE 1 = 1 '
  end
  else
    Result := FSql;
end;

procedure TfraOperativo.Limpiar;
begin
    Clear;
end;

procedure TfraOperativo.SetColors(AColor, ABackGround: TColor);
begin
  edPeriodo.Fuente.Color    := AColor;
  cmbDescripcion.Font.Color := AColor;

  if ABackGround <> -1 then
  begin
    edPeriodo.Color := ABackGround;
    cmbDescripcion.Color := ABackGround;
  end;
end;

{
procedure TfraOperativo.SetModified(const Value: Boolean);
begin
    edPeriodo.Modified      := Value ;
    cmbDescripcion.Modified := Value ;
end;
}

procedure TfraOperativo.cmbDescripcionCloseUp(Sender: TObject);
begin
  edPeriodo.Periodo.Valor := sdqDatosPE_PERIODO.AsString;
  cmbDescripcion.Text     := sdqDatosPE_DESCRIPCION.AsString;

  if Assigned(Sender) then
  begin
    if Assigned(FOnChange) then
      OnChange(Self);

    if (edPeriodo.Periodo.Valor <> '') then
      DoLostFocus;
  end;
end;

procedure TfraOperativo.cmbDescripcionDropDown(Sender: TObject);
var
  sSql: String;
begin
  if (sdqDatos.Active and (sdqDatosPE_DESCRIPCION.AsString = cmbDescripcion.Text)) then
    sSql := GetSql + OrderBy
  else if (cmbDescripcion.Text = '') then
    sSql := GetSql + OrderBy
  else
    sSql := GetSql + ' AND UPPER(PE_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' + OrderBy;

  OpenQuery(sdqDatos, sSql);
end;

procedure TfraOperativo.FrameExit(Sender: TObject);
begin
  if (edPeriodo.Periodo.Valor <> '') then
  begin
    if (edPeriodo.Periodo.Valor <> sdqDatosPE_PERIODO.AsString) then
      Cargar(edPeriodo.Periodo.Valor)
    else
      cmbDescripcion.Text := sdqDatosPE_DESCRIPCION.AsString;
  end
  else
    cmbDescripcion.Text := '';
end;

procedure TfraOperativo.edPeriodoExit(Sender: TObject);
var
  sSql: String;
begin
  if edPeriodo.Modified then
  begin
    cmbDescripcion.Modified := True;
    edPeriodo.Modified      := False;

    sSql := GetSql + ' AND PE_PERIODO = ''' + edPeriodo.Periodo.Valor + '''';
    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp(Sender);
  end;
end;

procedure TfraOperativo.edPeriodoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) and (not ReadOnly) then
    cmbDescripcion.DoDropDown(True);
end;

procedure TfraOperativo.Clear;
begin
  edPeriodo.Periodo.Valor := '';
  cmbDescripcion.Text     := '';
end;

procedure TfraOperativo.SetForeColor(const Value: TColor);
begin
  edPeriodo.Color := Value;
  cmbDescripcion.Color := Value;
end;

end.
