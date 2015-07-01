unit unfraTrabajadorSiniestroAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraTrabajadorSiniestro, ImgList,
  DB, SDEngine, ComCtrls, ToolWin, SinEdit, ToolEdit, ArtComboBox, StdCtrls, Mask, unfraEmpresa, unAgenda, JvExControls,
  JvComponent, JvSpeedButton, RxToolEdit;

type
  TfraTrabajadorSiniestroAGENDA = class(TfraTrabajadorSiniestro, IModuloAgenda)
    lbCUIL: TLabel;
    lbTrabajador: TLabel;
    tbBuscarSiniestro: TToolButton;
    tbManTrab: TToolButton;
    ToolBarTrabajador: TToolBar;
    tbInfo: TToolButton;
    btnClear: TJvSpeedButton;
    procedure btnClearClick(Sender: TObject);
    procedure cmbNombreDropDown(Sender: TObject);
    procedure tbBuscarSiniestroClick(Sender: TObject);
    procedure tbInfoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbManTrabClick(Sender: TObject);
  private
    FfraEmpresa: TfraEmpresa;
    FfraNumAuto: IModuloAgenda;
    FIsRequired: Boolean;

    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;

    procedure SetIsRequired(const Value: Boolean);
  protected
    function GetSql: String; override;

    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;

    function GetIdRelacionLaboral: Integer;
    function Validate: Boolean;

    procedure Change; override;
    procedure Clear; override;

    property FrameEmpresa: TfraEmpresa   read FfraEmpresa write FfraEmpresa;
    property FrameNumAuto: IModuloAgenda read FfraNumAuto write FfraNumAuto;
    property ParamName: String           read GetParamName;
  end;

var
  fraTrabajadorSiniestroAGENDA: TfraTrabajadorSiniestroAGENDA;

implementation

uses
  unContratoTrabajador, General, unArt, CustomDlgs, SqlFuncs, AnsiSql, unDlgBusSiniestro, unDmPrincipal, unArtDbFrame,
  unFraTrabajador, unDatosSiniestro, VCLExtra;

{$R *.dfm}

procedure TfraTrabajadorSiniestroAGENDA.tbBuscarSiniestroClick(Sender: TObject);
var
  iIdEmpresa: Integer;
  iOldIdTrabajador: Integer;
  iNewIdTrabajador: Integer;
begin
  iOldIdTrabajador := IdSiniestro;

  if Assigned(FfraEmpresa) then
    iIdEmpresa := FfraEmpresa.Value
  else
    iIdEmpresa := 0;

  iNewIdTrabajador := unDlgBusSiniestro.GetIdSiniestro(iIdEmpresa, Value, IdSiniestro, ART_MINFECHA, True, False);
  IdSiniestro := iNewIdTrabajador;
  if (IdSiniestro <> ART_EMPTY_ID) and (iOldIdTrabajador <> IdSiniestro) then
    Change;
end;

procedure TfraTrabajadorSiniestroAGENDA.tbManTrabClick(Sender: TObject);
begin
  with TfrmContratoTrabajador.Create(Self) do
  try
    if IsSelected and (IdEmpresa <> ART_EMPTY_ID) then
      CargarDatosTrabajador(Value, GetIdRelacionLaboral)
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

function TfraTrabajadorSiniestroAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraTrabajadorSiniestroAGENDA.GetParamName: String;
begin
  Result := 'IDEXPEDIENTE';
end;

function TfraTrabajadorSiniestroAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraTrabajadorSiniestroAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbTrabajador.Caption := 'Trabajador (*)'
  else
    lbTrabajador.Caption := 'Trabajador';
end;

procedure TfraTrabajadorSiniestroAGENDA.SetLocked(const Value: Boolean);
begin
  inherited;
//  tbManTrab.Enabled := not Value;
  btnClear.Enabled := IsSelected and not Locked;
  tbBuscarSiniestro.Enabled := not Value;
  tbInfo.Enabled := not IsEmpty;
end;

constructor TfraTrabajadorSiniestroAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  SoloSiniestrados := True;
  MostrarRelaLaboral := True;
  SinEstablecimiento := True;
end;

procedure TfraTrabajadorSiniestroAGENDA.btnClearClick(Sender: TObject);
begin
  if not Locked then
    Clear;
end;

procedure TfraTrabajadorSiniestroAGENDA.Change;
var
  nIdEmpresa: Integer;
  nIdSiniestro: Integer;
begin
  nIdSiniestro := IdSiniestro;
  inherited;

  if Assigned(FfraEmpresa) then
  begin
    if (sdqDatos.Active) and (not sdqDatos.IsEmpty and Assigned(sdqDatos.FindField('em_id'))) then
      nIdEmpresa := sdqDatos.FieldByName('em_id').AsInteger
    else
      nIdEmpresa := ART_EMPTY_ID;

    if (FfraEmpresa.Value <> nIdEmpresa) and (nIdEmpresa <> ART_EMPTY_ID) then
      FfraEmpresa.Value := nIdEmpresa;
  end;

  if Assigned(FfraNumAuto) then
    FfraNumAuto.Clear;

  tbInfo.Enabled := not IsEmpty;
  btnClear.Enabled := IsSelected and not Locked;
  IdSiniestro := nIdSiniestro;
end;

function TfraTrabajadorSiniestroAGENDA.GetIdRelacionLaboral: Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT rl_id' +
     ' FROM comunes.crl_relacionlaboral' +
    ' WHERE rl_contrato = :contrato' +
      ' AND rl_idtrabajador = :idtrabajador';
  Result := ValorSQLIntegerEx(sSql, [Contrato, Value]);
end;

procedure TfraTrabajadorSiniestroAGENDA.tbInfoClick(Sender: TObject);
begin
  with TfrmDatosSiniestro.Create(Self) do
  try
    ShowDialog(Sin, Ord, Rec);
  finally
    Free;
  end;
end;

procedure TfraTrabajadorSiniestroAGENDA.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  
  if Assigned(FfraNumAuto) then
    FfraNumAuto.Clear;
end;

function TfraTrabajadorSiniestroAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, mskCUIL, 'Debe seleccionar un trabajador.');
  Result := True;
end;

procedure TfraTrabajadorSiniestroAGENDA.Clear;
begin
  inherited;

  btnClear.Enabled := False;
end;

procedure TfraTrabajadorSiniestroAGENDA.cmbNombreDropDown(Sender: TObject);
begin
  inherited;

  cmbNombre.Columns[2].Visible := False;
  cmbNombre.Columns[3].Visible := False;  
end;

function TfraTrabajadorSiniestroAGENDA.GetSql: String;
begin
  Result := inherited GetSql;

  if FSoloSiniestrados then
  begin
    AddTable(Result, 'sin.sta_tipoaccidente');
    AddCondition(Result, 'ex_tipo = ta_codigo');
    AddField(Result, 'ta_descripcion');
    AddField(Result, 'ex_altamedica');
  end else
  begin
    AddField(Result, 'NULL', 'ta_descripcion');
    AddField(Result, 'NULL', 'ex_altamedica');
  end;
end;

end.
