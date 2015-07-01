unit unfraEmpresaAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraEmpresa, ExtCtrls, DB, SDEngine, ToolEdit, ArtComboBox,
  PatternEdit, IntEdit, StdCtrls, Mask, unAgenda, unART, unArtFrame,
  unfraInfoEmpresa, FormPanel, unfraInfoEmpresaExt, unFraValidacionDatosEmpresa,
  AdvToolBar, AdvToolBarStylers, AdvGlowButton, unfraContactoLibreAGENDA,
  JvExControls, JvComponent, JvSpeedButton, JvLabel, RxToolEdit;

type
  TfraEmpresaAGENDA = class(TfraEmpresa, IModuloAgenda)
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    btnCerrar: TAdvGlowButton;
    btnValidarDatos: TLabel;
    fpInfoEmpresa: TFormPanel;
    fpValidacionDatos: TFormPanel;
    fraInfoEmpresa: TfraInfoEmpresaExt;
    lbCUIT: TLabel;
    lbEmpresa: TLabel;
    lbInfoEmpresa: TLabel;
    Panel1: TPanel;
    pnlGeneral: TPanel;
    pnlValidacion: TPanel;
    sdqMensajes: TSDQuery;
    tbpTitulo: TAdvToolBarPager;
    tbpValidacionDatos: TAdvToolBarPager;
    btnClear: TJvSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TJvLabel;
    TimerInformacionAdicional: TTimer;
    procedure btnClearClick(Sender: TObject);
    procedure btnValidarDatosClick(Sender: TObject);
    procedure lbInfoEmpresaClick(Sender: TObject);
    procedure TimerInformacionAdicionalTimer(Sender: TObject);
  private
    FfraContacto: TfraContacto;
    FfraContactoLibre: TfraContactoLibreAGENDA;
    FfraEstablecimiento: TfraEstablecimiento;
    FfraSiniestro: TfraSiniestro;
    FfraTrabajador: TfraTrabajador;
    FIsRequired: Boolean;
    fraValidacionDatosEmpresa: TfraValidacionDatosEmpresa;
    FMostrarMensajeInformacion: Boolean;
    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;
    procedure OnEmpresaChange(Sender: TObject);
    procedure SetIsRequired(const Value: Boolean);
  protected
    procedure Internal_SetContrato(AContrato: TTableID; DoChanges: Boolean = False); override;
    procedure LoadValues(DoChanges : boolean = False); override;
    procedure SetContrato(const Value: TTableID); override;
    procedure SetValue(const Value: TTableID); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Change; override;
    procedure Clear; override;
    function Validate: Boolean;

    {Vínculos con otros frames}
    property FrameContacto: TfraContacto read FfraContacto write FfraContacto;
    property FrameContactoLibre: TfraContactoLibreAGENDA read FfraContactoLibre write FfraContactoLibre;
    property FrameEstablecimiento: TfraEstablecimiento read FfraEstablecimiento write FfraEstablecimiento;
    property FrameSiniestro: TfraSiniestro read FfraSiniestro write FfraSiniestro;
    property FrameTrabajador: TfraTrabajador read FfraTrabajador write FfraTrabajador;

    property MostrarMensajeInformacion: Boolean read FMostrarMensajeInformacion write FMostrarMensajeInformacion;
    property ParamName: String read GetParamName;
  end;

var
  fraEmpresaAGENDA: TfraEmpresaAGENDA;

implementation

uses
  CustomDlgs, General, unDmPrincipal, SqlFuncs, AnsiSql, unArtDbFrame, Strfuncs,
  VCLExtra;

{$R *.dfm}

procedure TfraEmpresaAGENDA.btnValidarDatosClick(Sender: TObject);
var
  sMensaje: String;
  bContinuar: Boolean;
  iDias: Integer;
begin
  fraValidacionDatosEmpresa := TfraValidacionDatosEmpresa.Create(Self);
  try
    fraValidacionDatosEmpresa.Parent := pnlValidacion;
    fraValidacionDatosEmpresa.Align := alClient;
    VCLExtra.LockControls([pnlValidacion], False);
    Application.ProcessMessages;
    if IsSelected then
    begin
      sMensaje := ObtenerValorEx('ART.AFILIACION.GETFORMULARIOVALIDACION(:contrato)', [Contrato]);
      iDias := ObtenerValorEx('NVL(ART.AFILIACION.GET_DIASVALIDACIONDATOS(:contrato),0)', [Contrato]);

      if not IsEmptyString(sMensaje) then
        bContinuar := MsgAsk(sMensaje + CRLF + '¿Desea volver a validarlos?' + CRLF + CRLF + iif(iDias > 0,
                                                                                                 Format('Tenga en cuenta que se validaron por última vez hace %d %s.', [iDias, String(iif(iDias = 1, 'día', 'días'))]),
                                                                                                 ''))
      else begin
        if iDias = 0 then
          bContinuar := True
        else
          bContinuar := MsgAsk(Format('La última validación de datos fue hecha hace %d %s.' + CRLF + '¿Desea volver a validarlos?', [iDias, String(iif(iDias = 1, 'día', 'días'))]));
      end;

      if bContinuar then
      begin
        with fraValidacionDatosEmpresa do
        begin
          fraDomicilioEmpresaLegal.Cuit := CUIT;
          edCorreoElectronico.Text := CorreoElectronico;
          AdvToolPanelValidacionDatos.Caption := RazonSocial;
          SetContrato(Contrato);
          edCorreoElectronicoCorrecto.Clear;
          edTelefonosCorrecto.Clear;
          fraDomicilioCorrecto.Clear;
          rgDomicilio.ItemIndex := -1;
          rgCorreoElectronico.ItemIndex := -1;
        end;
        if fpValidacionDatos.ShowModal = mrOk then
          LoadValues(True);

        Application.ProcessMessages;
      end;
    end else
      InfoHint(btnValidarDatos, 'No hay una empresa seleccionada.');
  finally
    fraValidacionDatosEmpresa.Free;
  end;
end;

procedure TfraEmpresaAGENDA.lbInfoEmpresaClick(Sender: TObject);
begin
  inherited;
  Application.ProcessMessages;
  if IsSelected then
  begin
    fpInfoEmpresa.Caption := RazonSocial;
    tbpTitulo.Caption.Caption := RazonSocial;
    fraInfoEmpresa.CargarContrato(Contrato, CUIT);
    fpInfoEmpresa.ShowModal;
    Application.ProcessMessages;
  end else
    InfoHint(lbInfoEmpresa, 'No hay una empresa seleccionada.');
end;

function TfraEmpresaAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraEmpresaAGENDA.GetParamName: String;
begin
  Result := 'CONTRATO';
end;

function TfraEmpresaAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraEmpresaAGENDA.OnEmpresaChange(Sender: TObject);
begin
  inherited;
end;

procedure TfraEmpresaAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbEmpresa.Caption := 'Empresa (*)'
  else
    lbEmpresa.Caption := 'Empresa';
end;

procedure TfraEmpresaAGENDA.LoadValues(DoChanges: boolean);
begin
  inherited;
//  btnValidarDatos.Font.Color := clBlack;
end;

procedure TfraEmpresaAGENDA.SetContrato(const Value: TTableID);
begin
  inherited;
end;

procedure TfraEmpresaAGENDA.SetValue(const Value: TTableID);
var
  sSql: string;
begin
  if Value <> ART_EMPTY_ID then
  begin
    sSql := GetSql + GetSqlWhere + ' AND ' + FieldID + ' = ' + SqlInt(Value) + GetSqlOrderBy;

    if OpenQuery(sdqDatos, sSql, True) then
      LoadValues(True);
  end else
    Clear;
end;

procedure TfraEmpresaAGENDA.TimerInformacionAdicionalTimer(Sender: TObject);
begin
  TimerInformacionAdicional.Enabled := False;
  if IsSelected and FMostrarMensajeInformacion and Visible and ((not Assigned(Parent)) or Parent.Visible) then
  begin
    OpenQueryEx(sdqMensajes, [Contrato]);
    if (not sdqMensajes.Fields[0].IsNull) then
      InfoHint(edContrato, sdqMensajes.Fields[0].AsString, False, 'Información', blnInfo, 30, False);
  end;
end;

constructor TfraEmpresaAGENDA.Create(AOwner: TComponent);
begin
  FMostrarMensajeInformacion := True;
  inherited;
  OnChange := OnEmpresaChange;
end;

procedure TfraEmpresaAGENDA.btnClearClick(Sender: TObject);
begin
  if not Locked then
    Clear;
end;

procedure TfraEmpresaAGENDA.Change;
begin
  inherited;
  if Assigned(FfraContacto) and IsSelected then
  begin
    if (FfraContacto.IdEmpresa <> Value) and (Value <> ART_EMPTY_ID) then
      FfraContacto.LoadContrato(Contrato);
  end;
  if Assigned(FfraContactoLibre) then
  begin
    if (FfraContactoLibre.Contrato <> Contrato) then
      FfraContactoLibre.Contrato := Contrato;
  end;
  if Assigned(FfraEstablecimiento) and IsSelected then
  begin
    if (FfraEstablecimiento.Contrato <> Contrato) and (Value <> ART_EMPTY_ID) then
      FfraEstablecimiento.Contrato := Contrato;
  end;
  if Assigned(FfraSiniestro) and IsSelected then
  begin
    if (FfraSiniestro.IdEmpresa <> Value) and (Value <> ART_EMPTY_ID) and (not FfraSiniestro.Locked) then
      FfraSiniestro.IdEmpresa := Value;
  end;
  if Assigned(FfraTrabajador) and IsSelected then
  begin
    if (FfraTrabajador.IdEmpresa <> Value) and (FfraTrabajador.Contrato <> Contrato) and (Value <> ART_EMPTY_ID) then
      FfraTrabajador.IdEmpresa := Value;
  end;

  lbInfoEmpresa.Visible := IsSelected;
  btnValidarDatos.Visible := IsSelected;
  TimerInformacionAdicional.Enabled := True;
  btnClear.Enabled := IsSelected and not Locked;
end;

procedure TfraEmpresaAGENDA.Clear;
var
  bBorrarControles: Boolean;
begin
  bBorrarControles := IsSelected;
  lbInfoEmpresa.Visible := False;
  btnValidarDatos.Visible := False;
  btnClear.Enabled := False;
  inherited;
  if bBorrarControles then
  begin
    if Assigned(FfraContacto) then
      FfraContacto.Clear;
    if Assigned(FfraContactoLibre) then
      FfraContacto.Contrato := 0;
    if Assigned(FfraEstablecimiento) then
      FfraEstablecimiento.Clear;
    if Assigned(FfraSiniestro) then
    begin
      FfraSiniestro.Clear;
      FfraSiniestro.IdEmpresa := ART_EMPTY_ID;
    end;
    if Assigned(FfraTrabajador) then
    begin
      FfraTrabajador.Clear;
      FfraTrabajador.IdEmpresa := ART_EMPTY_ID;
    end;
  end;
end;

function TfraEmpresaAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, edContrato, 'Debe seleccionar una empresa.');
  Result := True;
end;

procedure TfraEmpresaAGENDA.Internal_SetContrato(AContrato: TTableID; DoChanges: Boolean);
begin
  inherited;
  lbInfoEmpresa.Visible := IsSelected;
  btnValidarDatos.Visible := IsSelected;
  btnClear.Enabled := IsSelected and not Locked;
  Invalidate;
end;

end.
