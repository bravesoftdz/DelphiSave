unit unfraEmpresaSolicitudAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraEmpresaSolicitud, ExtCtrls, DB, SDEngine, ToolEdit, ArtComboBox,
  PatternEdit, IntEdit, StdCtrls, Mask, unAgenda, unART, unArtFrame,
  unfraInfoEmpresa, FormPanel, unfraInfoEmpresaExt, unFraValidacionDatosEmpresa,
  AdvToolBar, AdvToolBarStylers, AdvGlowButton, unfraContactoLibreAGENDA,
  JvExControls, JvComponent, JvSpeedButton, JvLabel, unFraEmpresa,
  unFraEmpresaAfi, RxToolEdit;

type
  TfraEmpresaSolicitudAGENDA = class(TfraEmpresaSolicitud, IModuloAgenda)
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    btnCerrar: TAdvGlowButton;
    fpInfoEmpresa: TFormPanel;
    fpValidacionDatos: TFormPanel;
    fraInfoEmpresa: TfraInfoEmpresaExt;
    Panel1: TPanel;
    pnlGeneral: TPanel;
    pnlValidacion: TPanel;
    sdqMensajes: TSDQuery;
    tbpTitulo: TAdvToolBarPager;
    tbpValidacionDatos: TAdvToolBarPager;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TJvLabel;
    lbEmpresa: TLabel;
    lbCUIT: TLabel;
    btnValidarDatos: TLabel;
    lbInfoEmpresa: TLabel;
    btnClear: TJvSpeedButton;
    procedure btnClearClick(Sender: TObject);
    procedure btnValidarDatosClick(Sender: TObject);
    procedure lbInfoEmpresaClick(Sender: TObject);
  private
    FfraContacto: TfraContacto;
    FfraContactoLibre: TfraContactoLibreAGENDA;
    FfraEstablecimiento: TfraEstablecimiento;
    FfraSiniestro: TfraSiniestro;
    FfraTrabajador: TfraTrabajador;
    FIsRequired: Boolean;
    fraValidacionDatosEmpresa: TfraValidacionDatosEmpresa;
    FMostrarMensajeInformacion: Boolean;
    FParentWnd: HWND;

    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;
    procedure OnEmpresaChange(Sender: TObject);
    procedure SetIsRequired(const Value: Boolean);
    function GetIdFormulario: Integer;
    procedure SetIdFormulario(const Value: Integer);
    procedure Internal_SetIdFormulario(const Value: Integer; DoChanges: Boolean);
  protected
    function GetSql: String; override;
    function  GetValue: TTableID; override;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure Internal_SetContrato(AContrato: TTableID; DoChanges: Boolean = False); override;
    procedure LoadValues(DoChanges : boolean = False); override;
    procedure SetContrato(const Value: TTableID); override;
    procedure SetValue(const Value: TTableID); override;
  public
    constructor Create(AOwner: TComponent); overload; override; 
    constructor Create(AOwner: TComponent; AParentWnd: HWND); reintroduce; overload;
    procedure Change; override;
    procedure Clear; override;
    function Validate: Boolean;

    property IdFormulario: Integer read GetIdFormulario write SetIdFormulario;

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
  fraEmpresaSolicitudAGENDA: TfraEmpresaSolicitudAGENDA;


const
  FIELD_ID_FORMULARIO = 'FO_ID';

implementation

uses
  CustomDlgs, General, unDmPrincipal, SqlFuncs, AnsiSql, unArtDbFrame, Strfuncs,
  VCLExtra;

{$R *.dfm}

procedure TfraEmpresaSolicitudAGENDA.btnValidarDatosClick(Sender: TObject);
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
      iDias := ObtenerValorEx('ART.AFILIACION.GET_DIASVALIDACIONDATOS(:contrato)', [Contrato]);

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

procedure TfraEmpresaSolicitudAGENDA.lbInfoEmpresaClick(Sender: TObject);
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

function TfraEmpresaSolicitudAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraEmpresaSolicitudAGENDA.GetParamName: String;
begin
  Result := 'IDFORMULARIO';
end;

function TfraEmpresaSolicitudAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraEmpresaSolicitudAGENDA.OnEmpresaChange(Sender: TObject);
begin
  inherited;
end;

procedure TfraEmpresaSolicitudAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbEmpresa.Caption := 'Empresa (*)'
  else
    lbEmpresa.Caption := 'Empresa'; 
end;

procedure TfraEmpresaSolicitudAGENDA.LoadValues(DoChanges: boolean);
begin
  inherited;
//  btnValidarDatos.Font.Color := clBlack;
end;

procedure TfraEmpresaSolicitudAGENDA.SetContrato(const Value: TTableID);
begin
  inherited;
end;

procedure TfraEmpresaSolicitudAGENDA.SetValue(const Value: TTableID);
var
  sSql: string;
begin
  if Value <> ART_EMPTY_ID then
  begin
    sSql := GetSql + GetSqlWhere + ' AND ' + EMP_FIELD_FROMULARIO + ' = ' + SqlInt( Value ) + GetSqlOrderBy;

    if OpenQuery(sdqDatos, sSql, True) then
      LoadValues(True);
  end else
    Clear;
end;

function TfraEmpresaSolicitudAGENDA.GetSql: String;
begin
  Result := inherited GetSql;
  AddField(Result, FIELD_ID_FORMULARIO, FIELD_ID_FORMULARIO);
end;

constructor TfraEmpresaSolicitudAGENDA.Create(AOwner: TComponent);
begin
  FMostrarMensajeInformacion := True;
  inherited;
  OnChange := OnEmpresaChange;
end;

procedure TfraEmpresaSolicitudAGENDA.btnClearClick(Sender: TObject);
begin
  if not Locked then
    Clear;
end;

procedure TfraEmpresaSolicitudAGENDA.Change;
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

  lbInfoEmpresa.Enabled := Contrato > 0;
  btnValidarDatos.Enabled := Contrato > 0;

  if IsSelected and FMostrarMensajeInformacion and (Contrato > 0) and Visible and ((not Assigned(Parent)) or Parent.Visible) then
  begin
    OpenQueryEx(sdqMensajes, [Contrato]);
    if (not sdqMensajes.Fields[0].IsNull) then
      InfoHint(edContrato, sdqMensajes.Fields[0].AsString, False, 'Información', blnInfo, 30, False);
  end;

  btnClear.Enabled := IsSelected and not Locked;
end;

procedure TfraEmpresaSolicitudAGENDA.Clear;
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

function TfraEmpresaSolicitudAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, edContrato, 'Debe seleccionar una empresa.');
  Result := True;
end;

procedure TfraEmpresaSolicitudAGENDA.Internal_SetContrato(AContrato: TTableID; DoChanges: Boolean);
begin
  inherited;
  lbInfoEmpresa.Visible := IsSelected;
  btnValidarDatos.Visible := IsSelected;
  btnClear.Enabled := IsSelected and not Locked;
  Invalidate;
end;

function TfraEmpresaSolicitudAGENDA.GetValue: TTableID;
begin
  if sdqDatos.Active then
    Result := IdFormulario
  else
    Result := ART_EMPTY_ID;
end;

function TfraEmpresaSolicitudAGENDA.GetIdFormulario: Integer;
begin
  if iExitCounter = 0 then
    FrameExit(nil); // Valida que todo este completo

  if sdqDatos.Active then                             
    Result := sdqDatos.FieldByName(FIELD_ID_FORMULARIO).AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfraEmpresaSolicitudAGENDA.SetIdFormulario(const Value: Integer);
begin
  Internal_SetIdFormulario(Value, False);
end;

procedure TfraEmpresaSolicitudAGENDA.Internal_SetIdFormulario(const Value: Integer; DoChanges: Boolean);
var
  sSql: String;
begin
  if Value <> ART_EMPTY_ID then
  begin
    sSql := GetSql + GetSqlWhere + ' AND FO_ID = ' + SqlValue(Value);

    if OpenQuery(sdqDatos, sSql, True) then
    begin
      if sdqDatos.IsEmpty Then
        Clear
      else if sdqDatos.RecordCount = 1 then
        LoadValues(DoChanges)
      else
        cmbRSocial.DoDropDown(False);
    end;
  end else
    Clear;
end;

constructor TfraEmpresaSolicitudAGENDA.Create(AOwner: TComponent; AParentWnd: HWND);
begin
  FParentWnd := AParentWnd;
  Create(AOwner); // Let this call out to the child ctor, if overridden
end;

procedure TfraEmpresaSolicitudAGENDA.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if (Parent = nil) {and IsLibrary} and not (csDestroying in ComponentState) then
    Params.WndParent := FParentWnd;
end;

end.
