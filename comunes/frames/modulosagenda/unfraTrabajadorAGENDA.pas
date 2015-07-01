unit unfraTrabajadorAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraTrabajador, StdCtrls, DB,
  SDEngine, ToolEdit, ArtComboBox, Mask, unAgenda, ComCtrls, ToolWin, ImgList, JvExControls, JvComponent, JvSpeedButton;

type
  TfraTrabajadorAGENDA = class(TfraTrabajador, IModuloAgenda)
    imgIconos: TImageList;
    lbCUIL: TLabel;
    lbNombre: TLabel;
    lbTrabajador: TLabel;
    tbManTrab: TToolButton;
    ToolBarTrabajador: TToolBar;
    btnClear: TJvSpeedButton;
    procedure btnClearClick(Sender: TObject);
    procedure cmbNombreDropDown(Sender: TObject);
    procedure tbManTrabClick(Sender: TObject);
  private
    FfraEmpresa: TfraEmpresa;
    FIsRequired: Boolean;

    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;

    procedure SetIsRequired(const Value: Boolean);
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;

    function Validate: Boolean;

    procedure Change; override;
    procedure Clear; override;
    procedure OnTrabajadorChange(Sender: TObject);

    property FrameEmpresa: TfraEmpresa read FfraEmpresa write FfraEmpresa;
    property ParamName: String         read GetParamName;
  end;

var
  fraTrabajadorAGENDA: TfraTrabajadorAGENDA;

implementation

uses
  unContratoTrabajador, CustomDlgs, unArt, SqlFuncs, AnsiSql;

{$R *.dfm}

procedure TfraTrabajadorAGENDA.cmbNombreDropDown(Sender: TObject);
var
  sNombre: String;
  sCuil: String;
begin
  sNombre := cmbNombre.Text;
  sCuil := mskCUIL.Text;

  if (Assigned(FfraEmpresa)) and (FfraEmpresa.IsEmpty) and (IdEmpresa <> ART_EMPTY_ID) then
    IdEmpresa := ART_EMPTY_ID;

  cmbNombre.Text := sNombre;
  mskCUIL.Text := sCuil;

  inherited;
end;

procedure TfraTrabajadorAGENDA.tbManTrabClick(Sender: TObject);
begin
  with TfrmContratoTrabajador.Create(Self) do
  try
    if IsSelected and (IdEmpresa <> ART_EMPTY_ID) then
      CargarDatosTrabajador(Value, sdqDatos.FieldByName('rl_id').AsInteger)
    else if IsSelected then
      BuscarTrabajadores(' tj_cuil = ' + SqlValue(CUIL), 0)
    else if Assigned(FfraEmpresa) then
      DoCargarDatos(FfraEmpresa.Contrato);

    ShowModal;
    Reload;
  finally
    Free;
  end;
end;

function TfraTrabajadorAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraTrabajadorAGENDA.GetParamName: String;
begin
  Result := 'IDTRABAJADOR';
end;

function TfraTrabajadorAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraTrabajadorAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbTrabajador.Caption := 'Trabajador (*)'
  else
    lbTrabajador.Caption := 'Trabajador';
end;

procedure TfraTrabajadorAGENDA.SetLocked(const Value: Boolean);
begin
  inherited;
  btnClear.Enabled := IsSelected and not Locked;
//  tbManTrab.Enabled := not Value;
end;

constructor TfraTrabajadorAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  OnChange := OnTrabajadorChange;
end;

procedure TfraTrabajadorAGENDA.btnClearClick(Sender: TObject);
begin
  if not Locked then
    Clear;
end;

procedure TfraTrabajadorAGENDA.OnTrabajadorChange(Sender: TObject);
var
  nID: Integer;
begin
  if Assigned(FfraEmpresa) and IsSelected then
  begin
    nID := Value;
    if (FfraEmpresa.Value <> IdEmpresa) and (IdEmpresa <> ART_EMPTY_ID) then
      FfraEmpresa.Value := IdEmpresa;
    Value := nID;
  end;
end;

function TfraTrabajadorAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, mskCUIL, 'Debe seleccionar un trabajador.');
  Result := True;
end;

procedure TfraTrabajadorAGENDA.Change;
begin
  inherited;
  btnClear.Enabled := IsSelected and not Locked;
end;

procedure TfraTrabajadorAGENDA.Clear;
begin
  inherited;
  btnClear.Enabled := False;
end;

end.
