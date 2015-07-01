unit UnTraslados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, ArtComboBox,
  ExtCtrls, unfraDireccion, Buttons, DateComboBox, Db, SDEngine, IntEdit, ShortCutControl, PatternEdit, unfraPrestador,
  unART, CurrEdit, Placemnt, artSeguridad, FormPanel, unFraCodigoDescripcion, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, ToolPanels, unFraNavegadorWEB, unFraDomicilio, unFraDomicilioGIS, AdvGlowButton, unFraCodDesc,
  unFraGIS_APIv3, JvExControls, JvComponent, JvAnimatedImage, JvGIFCtrl,
  RxPlacemnt, RxCurrEdit, RxToolEdit;

const
  KM_TOPE_MESA_TRASLADOS = 150;

type
  TTipoPrestacion = (tpTraslado, tpOtra, tpNinguna);
  TTipoTraslado = (ttNada, ttCombi, ttRemis, ttMixto);
  
  TfrmTraslados = class(TForm)
    fpPlataforma10: TFormPanel;
    GroupBox1: TGroupBox;
    chkAcomp: TCheckBox;
    Label14: TLabel;
    edNombreAcomp: TEdit;
    edDNIAcomp: TEdit;
    Label15: TLabel;
    btnAceptarPlataf: TButton;
    fpAnular: TFormPanel;
    Bevel5: TBevel;
    Label18: TLabel;
    btnAnuAceptar: TButton;
    btnAnuCancelar: TButton;
    fraMotivoAnulacion: TfraCodigoDescripcion;
    AdvToolPanelTabLateral: TAdvToolPanelTab;
    AdvToolPanelGIS: TAdvToolPanel;
    pnlBottom: TPanel;
    btnCancelar: TAdvGlowButton;
    btnAceptar: TAdvGlowButton;
    ImagenGIF: TJvGIFAnimator;
    pnlGIS: TPanel;
    sdqHasta2: TSDQuery;
    dsHasta2: TDataSource;
    pnlFondo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnAgregarTurno: TSpeedButton;
    btnEliminarTurno: TSpeedButton;
    Bevel1: TBevel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel4: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnAnulacionTurno: TSpeedButton;
    lbKMExcedente: TLabel;
    lbKilometraje: TLabel;
    Label21: TLabel;
    cmbTipoTraslado: TArtComboBox;
    cmbSolicitante: TArtComboBox;
    grpDesde: TGroupBox;
    fraDireccionDesde: TfraDomicilioGIS;
    fraPrestadorDesde: TfraPrestador;
    grpHasta: TGroupBox;
    fraPrestadorHasta: TfraPrestador;
    fraDireccionHasta: TfraDomicilioGIS;
    cmbTurnoFecha: TDateComboBox;
    mskTurnoHora: TMaskEdit;
    cmbElContencion1: TArtComboBox;
    cmbElContencion2: TArtComboBox;
    cmbElContencion3: TArtComboBox;
    cmbAcompaniante: TComboBox;
    cmbEspera: TComboBox;
    cmbDesde: TArtComboBox;
    cmbHasta: TArtComboBox;
    edElContencion1: TIntEdit;
    edElContencion2: TIntEdit;
    edElContencion3: TIntEdit;
    edCuil: TEdit;
    edNombre: TEdit;
    edSiniestro: TEdit;
    edOrden: TEdit;
    edRecaida: TEdit;
    edTipoTraslado: TEdit;
    edSolicitante: TEdit;
    edNumAuto: TEdit;
    cmbRetorno: TComboBox;
    edDesde: TEdit;
    edHasta: TEdit;
    gbVuelo: TGroupBox;
    Label12: TLabel;
    lbAproImporte: TLabel;
    Label13: TLabel;
    edTarifaVuelo: TCurrencyEdit;
    edVueloIda: TEdit;
    edVueloVuelta: TEdit;
    sbTurnos: TScrollBox;
    lstTurnos: TListBox;
    fpRetorno: TFormPanel;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label17: TLabel;
    chkRetorno: TCheckBox;
    dcFechaRetorno: TDateComboBox;
    dcFechaTurno: TDateComboBox;
    btnAceptarRetorno: TButton;
    btnTrabajador: TAdvGlowButton;
    edKilometraje: TCurrencyEdit;
    edKMExcedente: TCurrencyEdit;
    chkExtension: TCheckBox;
    fpExtension: TFormPanel;
    GroupBox3: TGroupBox;
    fraPrestadorHasta2: TfraPrestador;
    fraDireccionHasta2: TfraDomicilioGIS;
    edHasta2: TEdit;
    cmbHasta2: TArtComboBox;
    pnlBottomExtension: TPanel;
    btnCancelarExtension: TAdvGlowButton;
    btnAceptarExtension: TAdvGlowButton;
    sbRetornos: TScrollBox;
    lstRetornos: TListBox;
    sdqTipoTraslado: TSDQuery;
    dsTipoTraslado: TDataSource;
    sdqSolicitante: TSDQuery;
    dsSolicitante: TDataSource;
    sdqDesde: TSDQuery;
    dsDesde: TDataSource;
    sdqHasta: TSDQuery;
    dsHasta: TDataSource;
    sdqElContencion1: TSDQuery;
    dsElContencion1: TDataSource;
    sdqElContencion2: TSDQuery;
    dsElContencion2: TDataSource;
    sdqElContencion3: TSDQuery;
    dsElContencion3: TDataSource;
    ShortCutControl: TShortCutControl;
    sdqDomicilios: TSDQuery;
    sdqTrasladosDomicPrest: TSDQuery;
    sdqTrasladosSTR: TSDQuery;
    sdqTrasladosSAU: TSDQuery;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    fraBaseRemiseria: TfraCodDesc;
    pnlGISBaseRemiseria: TFormPanel;
    fraDomicilioBaseRemis: TfraDomicilioGIS;
    btnCerrar: TButton;
    pnlBaseRemiseria: TPanel;
    btnMapaBaseRemiseria: TAdvGlowButton;
    edKMBase: TCurrencyEdit;
    lbKMBase: TLabel;
    pnlViajeCompartido: TPanel;
    Label16: TLabel;
    btnViajeCompartido: TAdvGlowButton;
    sdqZonas: TSDQuery;
    pnlTildesViaje: TPanel;
    chkNocturno: TCheckBox;
    chkFinDeSemana: TCheckBox;
    chkExclusivo: TCheckBox;
    btnSIC: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure cmbHastaCloseUp(Sender: TObject);
    procedure cmbDesdeCloseUp(Sender: TObject);
    procedure cmbElContencion1CloseUp(Sender: TObject);
    procedure cmbElContencion2CloseUp(Sender: TObject);
    procedure cmbElContencion3CloseUp(Sender: TObject);
    procedure edElContencion1Exit(Sender: TObject);
    procedure edElContencion1KeyPress(Sender: TObject; var Key: Char);
    procedure edElContencion2Exit(Sender: TObject);
    procedure edElContencion2KeyPress(Sender: TObject; var Key: Char);
    procedure edElContencion3KeyPress(Sender: TObject; var Key: Char);
    procedure edElContencion3Exit(Sender: TObject);
    procedure btnAgregarTurnoClick(Sender: TObject);
    function TieneRetornos(): boolean;
    procedure btnEliminarTurnoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cmbTipoTrasladoCloseUp(Sender: TObject);
    procedure cmbSolicitanteCloseUp(Sender: TObject);
    procedure edTipoTrasladoExit(Sender: TObject);
    procedure edTipoTrasladoKeyPress(Sender: TObject; var Key: Char);
    procedure edSolicitanteExit(Sender: TObject);
    procedure edSolicitanteKeyPress(Sender: TObject; var Key: Char);
    procedure edDesdeExit(Sender: TObject);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaExit(Sender: TObject);
    procedure edHastaKeyPress(Sender: TObject; var Key: Char);
    procedure btnAnulacionTurnoClick(Sender: TObject);
    procedure lstTurnosDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure chkAcompClick(Sender: TObject);
    procedure btnAceptarPlatafClick(Sender: TObject);
    procedure fpPlataforma10BeforeShow(Sender: TObject);
    procedure chkRetornoClick(Sender: TObject);
    procedure btnAceptarRetornoClick(Sender: TObject);
    procedure fpRetornoBeforeShow(Sender: TObject);
    procedure fpAnularBeforeShow(Sender: TObject);
    procedure btnAnuAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BuscarDomicilios(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure AdvToolPanelTabLateralTabSlideInDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure btnTrabajadorClick(Sender: TObject);
    procedure cmbHasta2CloseUp(Sender: TObject);
    procedure btnAceptarExtensionClick(Sender: TObject);
    procedure edHasta2Exit(Sender: TObject);
    procedure edHasta2KeyPress(Sender: TObject; var Key: Char);
    procedure cmbEsperaChange(Sender: TObject);
    procedure cmbRetornoChange(Sender: TObject);
    procedure lstRetornosDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure btnMapaBaseRemiseriaClick(Sender: TObject);
    procedure fraBaseRemiseriaPropiedadesChange(Sender: TObject);
    procedure lbKilometrajeClick(Sender: TObject);
    procedure lbKMExcedenteClick(Sender: TObject);
    procedure lbKMBaseClick(Sender: TObject);
    procedure btnViajeCompartidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSICClick(Sender: TObject);
  private
    fraGISMapa: TfraGIS_APIv3;
    FKmExcedenteBase: Extended;
    FTipoTraslado: TTipoTraslado;
    FPrestacionAprobada: String;
    FPrestador: TTableID;
    sEstado, sCUIT: String;
    iSiniestro, iOrden, iRecaida, iNumAuto, iIdAuto, iIdExpediente,
    iCantCombi, iCantRemis, iIdTrabajador, iContrato :Integer;
    dFechaSin: TDateTime;
    FHuboCambioPrestacion: Boolean;
    FTipoPrestacion: TTipoPrestacion;
    function Validar: Boolean;
    function ValidarFechayHora: Boolean;
    function ValidarSiniyTurnosRepetidos: Boolean;
    function ValidarFechasRepetidas: Boolean;
    function ValidarPlataforma10: Boolean;
    function DoInsertarAutorizacion(bEsRemis :Boolean) :Integer;
    function ValidarFechaHoraOtras :Boolean;
    function ValidarFechaOtras :Boolean;

    procedure OnDireccionDesdeChange(Sender: TObject);
    procedure OnDireccionHastaChange(Sender: TObject);
    procedure OnDireccionHastaChange2(Sender: TObject);
    procedure OnPrestadorChangeDesde(Sender: TObject);
    procedure OnPrestadorChangeHasta(Sender: TObject);
    procedure OnPrestadorChangeHasta2(Sender: TObject);
    procedure ValidarContencion1;
    procedure ValidarContencion2;
    procedure ValidarContencion3;
    procedure CargarTraslados(bEsPrestacion :Boolean = False);
    procedure DeshabilitarFraPrestador(Tipo: String);
    procedure HabilitarFraPrestador(Tipo: String);
    procedure DomicilioPorEmpresa(TipoDestino: String);
    procedure DomicilioPorTrabajador(TipoDestino: String);
    procedure DomicilioPorPrestador(TipoDestino: String);
    procedure GetCantCombiRemis;
    procedure SetTipoTraslado;
    procedure DoInsertarTraslados(bEsRemis :Boolean; iNumAuto :Integer);
    procedure DoInsertarAutTraslados;
    procedure SetPrestadorPosible(IdTrabajador :Integer);
    procedure DoAnularTrasladoRemis(sFecha, sHora :String);
    procedure CalcularDistanciaGIS(ASaving: Boolean = False);
    procedure DoChequearEspera;            // TK 6615
    procedure DoChequearRetorno;           // TK 6615
    function  DoExtenderAutorizacion(bEsRemis: Boolean): Integer;
    procedure SetPrestador(const Value: TTableID);
    function EsTrasladoRemis: Boolean;
    function EsTrasladoRemisMuyExtenso: Boolean;
    function GetValorRetorno: String;
  public
    bRefrescar: Boolean;
    function CalcularCantidad: Integer;
    function HuboCambioPrestacion: Boolean;
    procedure Cargar(Siniestro, Orden, Recaida, NumAuto :Integer; Cuil, Nombre, CodPres: String);
    procedure CargarPantalla(Siniestro, Orden, Recaida, NumAuto :Integer;
                             Cuil, Nombre, CodPres: String;
                             TipoPrest: TTipoPrestacion = tpNinguna);
    procedure DeshabilitarControles;

    property IDPrestador: TTableID read FPrestador    write SetPrestador;
    property TipoPrestacion: TTipoPrestacion read FTipoPrestacion write FTipoPrestacion;
  end;

var
  frmTraslados: TfrmTraslados;
  CodPrestacion: String;
  bEsTrasladoAvion, bAcompRetorno: Boolean;

const
  MODO_CARGA        = '&Aceptar';
  MODO_APROBACION   = '&Aprobar';
  CAPTION_EXTENSION = 'Esta autorización es extensión de otra';

implementation

uses
  General, StrFuncs, unDmPrincipal, AnsiSql, CustomDlgs, unSesion, Math,
  VCLExtra, CUIT, uncomunes, Variants, unRedPres, DateTimeFuncs, unEsperaSimple,
  Periodo, strutils, unContratoTrabajador, unGIS, unMoldeEnvioMail,
  unAgendaVistaExpediente;

{$R *.DFM}            

procedure TfrmTraslados.FormCreate(Sender: TObject);
begin
  fraGISMapa := TfraGIS_APIv3.CreateWithoutNavigation(Self);
  fraGISMapa.Parent := AdvToolPanelGIS;
  fraGISMapa.Align := alClient;

  if not Seguridad.Claves.IsActive('ManejoCompletoGIS') then
    AdvToolPanelTabLateral.Visible := False;

  VCLExtra.LockControls([edKilometraje, edKMBase, fraPrestadorDesde, fraPrestadorHasta, fraDireccionDesde, fraDireccionHasta, fraDomicilioBaseRemis], True);
//  VCLExtra.LockControls([sbRetornos], True);    // TK 16104
  sdqTipoTraslado.Open;
  sdqSolicitante.Open;
  sdqDesde.Open;
  sdqHasta.Open;
  sdqHasta2.Open;
  sdqElContencion1.Open;
  sdqElContencion2.Open;
  sdqElContencion3.Open;
  fraDireccionDesde.OnChange  := OnDireccionDesdeChange;
  fraDireccionHasta.OnChange  := OnDireccionHastaChange;
  fraDireccionHasta2.OnChange := OnDireccionHastaChange2;
  fraPrestadorDesde.OnChange  := OnPrestadorChangeDesde;
  fraPrestadorHasta.OnChange  := OnPrestadorChangeHasta;
  fraPrestadorHasta2.OnChange := OnPrestadorChangeHasta2;
  with fraMotivoAnulacion do
  begin
    ShowBajas   := False;
    TableName   := 'SMT_MOTANULTRASLADOS';
    FieldID     := 'MT_ID';
    FieldCodigo := 'MT_CODIGO';
    FieldDesc   := 'MT_DESCRIPCION';
    FieldBaja   := 'MT_FECHABAJA';
    ExtraFields := ', MT_PERMITELIQUIDAR, MT_ANULAPASADOS ';
  end;
end;

procedure TfrmTraslados.Cargar(Siniestro, Orden, Recaida, NumAuto :Integer;
                               Cuil, Nombre, CodPres: String);
var
  sSQL: String;
begin
  iSiniestro       := Siniestro;
  iOrden           := Orden;
  iRecaida         := Recaida;
  iNumAuto         := NumAuto;
  iIdExpediente    := Get_IdExpediente(iSiniestro, iOrden, iRecaida);

  sSQL := 'SELECT au_id, ex_cuit, ex_fechaaccidente as fecha, ex_idtrabajador, ex_contrato ' +
           ' FROM sau_autorizaciones, sex_expedientes ' +
          ' WHERE au_siniestro = :Sin ' +
            ' AND au_orden = :Ord ' +
            ' AND au_recaida = :Reca ' +
            ' AND au_numauto = :Auto ' +
            ' AND au_idexpediente = ex_id';

  with GetQueryEx(sSQL,[iSiniestro, iOrden, iRecaida, iNumAuto]) do
  try
    iIdAuto       := FieldByName('au_id').AsInteger;
    sCUIT         := FieldByName('ex_cuit').AsString;
    dFechaSin     := FieldByName('fecha').AsDateTime;
    iIdTrabajador := FieldByName('ex_idtrabajador').AsInteger;
    iContrato     := FieldByName('ex_contrato').AsInteger;
  finally
    Free;
  end;

  edCuil.Text      := Cuil;
  edNombre.Text    := Nombre;
  edSiniestro.Text := IntToStr(Siniestro);
  edOrden.Text     := IntToStr(Orden);
  edRecaida.Text   := IntToStr(Recaida);
  edNumAuto.Text   := IntToStr(NumAuto);
  CodPrestacion    := CodPres;
  bAcompRetorno    := GetAcompRetorno(CodPrestacion);
  bEsTrasladoAvion := GetTrasladoAvion(CodPrestacion);
  gbVuelo.Enabled  := bEsTrasladoAvion;
end;
{--------[Desde]----------------------------------------------------------------}
procedure TfrmTraslados.cmbDesdeCloseUp(Sender: TObject);
begin
  edDesde.Text := cmbDesde.FieldValue;
  if (cmbDesde.FieldValue = cmbHasta.FieldValue) and (cmbDesde.FieldValue <> 'O') and
     (cmbDesde.FieldValue <> '') and (cmbDesde.FieldValue <> 'P') then
  begin
    MsgBox('El Desde no puede ser igual que el Hasta.', MB_ICONEXCLAMATION);
    cmbDesde.FieldValue := '';
    edDesde.Text := '';
    cmbDesde.SetFocus;
  end
  else
  begin
    if cmbDesde.FieldValue = 'E' then       {Por Empresa}
      DomicilioPorEmpresa('DESDE')
    else if cmbDesde.FieldValue = 'T' then  {Por Trabajador}
      DomicilioPorTrabajador('DESDE')
    else if cmbDesde.FieldValue = 'P' then  {Por Prestador}
      DomicilioPorPrestador('DESDE')
    else if cmbDesde.FieldValue = 'O' then  {Otro}
    begin
      sdqDomicilios.Close;
      sdqDomicilios.sql.Text := '';
      fraDireccionDesde.Clear;
      VCLExtra.LockControls([fraDireccionDesde], False);
      DeshabilitarFraPrestador('DESDE');
    end;

    if cmbDesde.FieldValue <> 'P' then
      fraPrestadorDesde.Clear;
  end;
end;
{-------[Hasta]-----------------------------------------------------------------}
procedure TfrmTraslados.cmbHastaCloseUp(Sender: TObject);
begin
  edHasta.Text := cmbHasta.FieldValue;
  if (cmbDesde.FieldValue = cmbHasta.FieldValue) and
     (cmbHasta.FieldValue <> 'O') and (cmbHasta.FieldValue <> '') and
     (cmbHasta.FieldValue <> 'P') then
  begin
    MsgBox('El Hasta no puede ser igual que el Desde.', MB_ICONEXCLAMATION);
    cmbHasta.FieldValue := '';
    edHasta.Text := '';
    cmbHasta.SetFocus;
  end
  else
  begin
    if cmbHasta.FieldValue = 'E' then       {Por Empresa}
      DomicilioPorEmpresa('HASTA')
    else if cmbHasta.FieldValue = 'T' then  {Por Trabajador}
      DomicilioPorTrabajador('HASTA')
    else if cmbHasta.FieldValue = 'P' then  {Por Prestador}
      DomicilioPorPrestador('HASTA')
    else if cmbHasta.FieldValue = 'O' then  {Otro}
    begin
      sdqDomicilios.Close;
      sdqDomicilios.sql.Text := '';
      VCLExtra.LockControls([fraDireccionHasta], False);
      fraDireccionHasta.Clear;
      fraDireccionHasta.SetFocus;
      DeshabilitarFraPrestador('HASTA');
    end;

    if cmbHasta.FieldValue <> 'P' then
      fraPrestadorHasta.Clear;
  end;
end;
{---------[Tipo de Traslado]----------------------------------------------------}
procedure TfrmTraslados.cmbTipoTrasladoCloseUp(Sender: TObject);
begin
  edTipoTraslado.Text := cmbTipoTraslado.FieldValue;
end;

procedure TfrmTraslados.edTipoTrasladoExit(Sender: TObject);
begin
  cmbTipoTraslado.FieldValue := edTipoTraslado.Text;
end;

procedure TfrmTraslados.edTipoTrasladoKeyPress(Sender: TObject; var Key: Char);
begin
  cmbTipoTraslado.FieldValue := edTipoTraslado.Text;
end;
{---------[Solicitante]---------------------------------------------------------}
procedure TfrmTraslados.cmbSolicitanteCloseUp(Sender: TObject);
begin
  edSolicitante.Text := cmbSolicitante.FieldValue;
end;

procedure TfrmTraslados.edSolicitanteExit(Sender: TObject);
begin
  cmbSolicitante.FieldValue := edSolicitante.Text;
end;

procedure TfrmTraslados.edSolicitanteKeyPress(Sender: TObject; var Key: Char);
begin
  cmbSolicitante.FieldValue := edSolicitante.Text;
end;
{-------[Consulta y Asignacion de datos al Domicilio por Empresa]---------------}
procedure TfrmTraslados.DomicilioPorEmpresa(TipoDestino: String);
var
  Tabla: String;
  fraDireccionLocal: TfraDomicilioGIS;
  fraPrestadorLocal: TfraPrestador;
begin
  if TipoDestino = 'DESDE' then
  begin
    fraDireccionLocal := fraDireccionDesde;
    fraPrestadorLocal := fraPrestadorDesde;
  end else
  if TipoDestino = 'HASTA' then
  begin
    fraDireccionLocal := fraDireccionHasta;
    fraPrestadorLocal := fraPrestadorHasta;
  end else
  if TipoDestino = 'HASTA2' then
  begin
    fraDireccionLocal := fraDireccionHasta2;
    fraPrestadorLocal := fraPrestadorHasta2;
  end else
  begin
    fraDireccionLocal := nil;
    fraPrestadorLocal := nil;
  end;

  Tabla := '';
  sdqDomicilios.Close;
  if ExisteSql('SELECT dl_cuil FROM cdl_datoslaborales WHERE dl_cuil = ' + SqlString(edCuil.Text,True)) then
    Tabla := 'CDL'
  else
    Tabla := 'CHL';

  if Tabla = 'CDL' then
    sdqDomicilios.SQL.Text := 'SELECT mp_calle_post, mp_numero_post, mp_piso_post, mp_departamento_post, ' +
                                    ' mp_localidad_post, mp_cpostal_post, pv_descripcion, mp_cpostala_post, mp_provincia_post ' +
                              ' FROM cdl_datoslaborales, cmp_empresas, cpv_provincias ' +
                             ' WHERE dl_cuit = mp_cuit ' +
                               ' AND pv_codigo = mp_provincia_post ' +
                               ' AND dl_cuil = ' + SqlString(edCuil.Text,True)
  else
    sdqDomicilios.SQL.Text := 'SELECT mp_calle_post, mp_numero_post, mp_piso_post, mp_departamento_post, ' +
                                    ' mp_localidad_post, mp_cpostal_post, pv_descripcion, mp_cpostala_post, mp_provincia_post ' +
                               ' FROM chl_histolaboral, cmp_empresas, cpv_provincias ' +
                              ' WHERE hl_cuit = mp_cuit ' +
                                ' AND pv_codigo = mp_provincia_post ' +
                                ' AND hl_cuil = ' + SqlString(edCuil.Text,True);
  sdqDomicilios.Open;

  if sdqDomicilios.RecordCount = 0 then
  begin
    fraDireccionLocal.Clear;
    if btnAceptar.Caption = MODO_CARGA then
      MsgBox('El domicilio de la Empresa no está cargado.', MB_ICONINFORMATION);
  end
  else
    with fraDireccionLocal, sdqDomicilios do
    begin
      Cargar(FieldByName('MP_CALLE_POST').Text, FieldByName('MP_CPOSTAL_POST').Text, FieldByName('MP_LOCALIDAD_POST').Text,
             FieldByName('MP_NUMERO_POST').Text, FieldByName('MP_PISO_POST').Text, FieldByName('MP_DEPARTAMENTO_POST').Text,
             FieldByName('MP_PROVINCIA_POST').Text, FieldByName('MP_CPOSTALA_POST').Text);
    end;

  VCLExtra.LockControls([fraDireccionLocal], True);
  fraPrestadorLocal.Clear;
  DeshabilitarFraPrestador(TipoDestino);
end;
{-------[Consulta y Asignacion de datos al Domicilio por Trabajador]------------}
procedure TfrmTraslados.DomicilioPorTrabajador(TipoDestino: String);
var
  fraDireccionLocal: TfraDomicilioGIS;
  fraPrestadorLocal: TfraPrestador;  
begin
  if TipoDestino = 'DESDE' then
  begin
    fraDireccionLocal := fraDireccionDesde;
    fraPrestadorLocal := fraPrestadorDesde;
  end else
  if TipoDestino = 'HASTA' then
  begin
    fraDireccionLocal := fraDireccionHasta;
    fraPrestadorLocal := fraPrestadorHasta;
  end else
  if TipoDestino = 'HASTA2' then
  begin
    fraDireccionLocal := fraDireccionHasta2;
    fraPrestadorLocal := fraPrestadorHasta2;
  end else
  begin
    fraDireccionLocal := nil;
    fraPrestadorLocal := nil;
  end;
  
  sdqDomicilios.Close;
  sdqDomicilios.SQL.Text := 'SELECT tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                                  ' tj_cpostal, tj_localidad, tj_provincia, ' +
                                  ' tj_cpostala, pv_descripcion, tj_lat, tj_lng ' +
                             ' FROM ctj_trabajador, cpv_provincias ' +
                            ' WHERE pv_codigo = tj_provincia ' +
                              ' AND tj_cuil = ' + SqlString(edCuil.Text,True);
  sdqDomicilios.Open;
  if sdqDomicilios.RecordCount = 0 then
  begin
    fraDireccionLocal.Clear;
    if btnAceptar.Caption = MODO_CARGA then
      MsgBox('El domicilio del Trabajador no esta cargado.', MB_ICONINFORMATION);
  end
  else
    with fraDireccionLocal, sdqDomicilios do
    begin
      Cargar(FieldByName('TJ_CALLE').Text, FieldByName('TJ_CPOSTAL').Text, FieldByName('TJ_LOCALIDAD').Text,
             FieldByName('TJ_NUMERO').Text, FieldByName('TJ_PISO').Text, FieldByName('TJ_DEPARTAMENTO').Text,
             FieldByName('TJ_PROVINCIA').Text, FieldByName('TJ_CPOSTALA').Text,
             FieldByName('TJ_LAT').AsFloat, FieldByName('TJ_LNG').AsFloat);
    end;

  VCLExtra.LockControls([fraDireccionLocal], True);
  fraPrestadorLocal.Clear;
  DeshabilitarFraPrestador(TipoDestino);
end;
{-------[Consulta y Asignacion de datos al Domicilio por Prestador]-------------}
procedure TfrmTraslados.DomicilioPorPrestador(TipoDestino: String);
var
  iIdPrestador: Integer;
  sSQL: String;
  fraDireccionLocal: TfraDomicilioGIS;
  fraPrestadorLocal: TfraPrestador;
begin
  HabilitarFraPrestador(TipoDestino);

  if TipoDestino = 'DESDE' then
  begin
    fraDireccionLocal := fraDireccionDesde;
    fraPrestadorLocal := fraPrestadorDesde;
  end else
  if TipoDestino = 'HASTA' then
  begin
    fraDireccionLocal := fraDireccionHasta;
    fraPrestadorLocal := fraPrestadorHasta;
  end else
  if TipoDestino = 'HASTA2' then
  begin
    fraDireccionLocal := fraDireccionHasta2;
    fraPrestadorLocal := fraPrestadorHasta2;
  end else
  begin
    fraDireccionLocal := nil;
    fraPrestadorLocal := nil;
  end;

  if Assigned(fraPrestadorLocal) and Assigned(fraDireccionLocal) then
  begin
    sSQL := 'SELECT ca_identificador ' +
             ' FROM cpr_prestador, sex_expedientes ' +
            ' WHERE ex_prestador = ca_identificador '  +
              ' AND ex_siniestro = :SIN ' +
              ' AND ex_orden = :ORD ' +
              ' AND ex_recaida = :REC';
    iIdPrestador := ValorSQLIntegerEx(sSQL, [iSiniestro, iOrden, iRecaida], -1);

    if iIdPrestador = -1 then
    begin
      fraDireccionLocal.Clear;
      if btnAceptar.Caption = MODO_CARGA then
        MsgBox('No existe prestador para este Nro. de Siniestro.', MB_ICONEXCLAMATION);
    end
    else
    begin
      fraDireccionLocal.IdPrestador := iIdPrestador;
      fraPrestadorLocal.Cargar(iIdPrestador);
      if fraPrestadorLocal.IsEmpty then
        VCLExtra.LockControls([fraPrestadorLocal], False);

      if fraDireccionLocal.IsEmpty then
        MsgBox('El domicilio del Prestador no existe o está incompleto.', MB_ICONEXCLAMATION);
    end;

    VCLExtra.LockControls([fraDireccionLocal], fraDireccionLocal.IsSelected);
  end;
end;

procedure TfrmTraslados.OnPrestadorChangeDesde(Sender: TObject);
begin
  fraDireccionDesde.IdPrestador := fraPrestadorDesde.IDPrestador;
end;

procedure TfrmTraslados.OnPrestadorChangeHasta(Sender: TObject);
begin
  fraDireccionHasta.IdPrestador := fraPrestadorHasta.IDPrestador;
end;

procedure TfrmTraslados.cmbElContencion1CloseUp(Sender: TObject);
begin
  edElContencion1.Text := cmbElContencion1.FieldValue;
  ValidarContencion1;
end;

procedure TfrmTraslados.cmbElContencion2CloseUp(Sender: TObject);
begin
  edElContencion2.Text := cmbElContencion2.FieldValue;
  ValidarContencion2;
end;

procedure TfrmTraslados.cmbElContencion3CloseUp(Sender: TObject);
begin
  edElContencion3.Text := cmbElContencion3.FieldValue;
  ValidarContencion3;
end;

procedure TfrmTraslados.edElContencion1Exit(Sender: TObject);
begin
  cmbElContencion1.FieldValue := edElContencion1.Text;
  ValidarContencion1;
end;

procedure TfrmTraslados.edElContencion1KeyPress(Sender: TObject; var Key: Char);
begin
  cmbElContencion1.FieldValue := edElContencion1.Text;
  ValidarContencion1;
end;

procedure TfrmTraslados.edElContencion2Exit(Sender: TObject);
begin
  cmbElContencion2.FieldValue := edElContencion2.Text;
  ValidarContencion2;
end;

procedure TfrmTraslados.edElContencion2KeyPress(Sender: TObject; var Key: Char);
begin
  cmbElContencion2.FieldValue := edElContencion2.Text;
  ValidarContencion2;
end;

procedure TfrmTraslados.edElContencion3KeyPress(Sender: TObject; var Key: Char);
begin
  cmbElContencion3.FieldValue := edElContencion3.Text;
  ValidarContencion3;
end;

procedure TfrmTraslados.edElContencion3Exit(Sender: TObject);
begin
  cmbElContencion3.FieldValue := edElContencion3.Text;
  ValidarContencion3;
end;
{-----[Valida Elemento de contencion 1]-----------------------------------------}
procedure TfrmTraslados.ValidarContencion1;
begin
  if (Trim(cmbElContencion1.Text) <> '') and
     ((Trim(cmbElContencion1.Text) = Trim(cmbElContencion2.Text)) or
     (Trim(cmbElContencion1.Text) = Trim(cmbElContencion3.Text))) then
  begin
    MsgBox('No se pueden repetir los elementos de Contención.', MB_ICONEXCLAMATION);
    cmbElContencion1.FieldValue := '';
    edElContencion1.Text        := '';
    cmbElContencion1.SetFocus;
  end;
end;
{-----[Valida Elemento de contencion 2]-----------------------------------------}
procedure TfrmTraslados.ValidarContencion2;
begin
  if (Trim(cmbElContencion2.Text) <> '') and
     ((Trim(cmbElContencion2.Text) = Trim(cmbElContencion1.Text)) or
     (Trim(cmbElContencion2.Text) = Trim(cmbElContencion3.Text))) then
  begin
    MsgBox('No se pueden repetir los elementos de Contención.', MB_ICONEXCLAMATION);
    cmbElContencion2.FieldValue := '';
    edElContencion2.Text        := '';
    cmbElContencion2.SetFocus;
  end
  else if Trim(cmbElContencion1.Text) = '' then
  begin
    MsgBox('Debe ingresar un elemento de Contención en el primer combo antes de ingresar aquí.', MB_ICONEXCLAMATION);
    cmbElContencion2.FieldValue := '';
    edElContencion2.Text        := '';
    cmbElContencion2.SetFocus;
  end;
end;
{-----[Valida Elemento de contencion 3]-----------------------------------------}
procedure TfrmTraslados.ValidarContencion3;
begin
  if (Trim(cmbElContencion3.Text) <> '') and
     ((Trim(cmbElContencion3.Text) = Trim(cmbElContencion1.Text)) or
     (Trim(cmbElContencion3.Text) = Trim(cmbElContencion2.Text))) then
  begin
    MsgBox('No se pueden repetir los elementos de Contención.', MB_ICONEXCLAMATION);
    cmbElContencion3.FieldValue := '';
    edElContencion3.Text        := '';
    cmbElContencion3.SetFocus;
  end
  else if Trim(cmbElContencion2.Text) = '' then
  begin
    MsgBox('Debe ingresar un elemento de Contención en el segundo combo antes de ingresar aquí.', MB_ICONEXCLAMATION);
    cmbElContencion3.FieldValue := '';
    edElContencion3.Text        := '';
    cmbElContencion3.SetFocus;
  end;
end;
{-----[Inserta Fecha y Hora (del turno) en el ListBox]--------------------------}
procedure TfrmTraslados.btnAgregarTurnoClick(Sender: TObject);
var
  ssql: String;
  NumTraslado: Integer;
  FechaRetorno :TDate;
begin
  FechaRetorno := 0;

  if ValidarSiniyTurnosRepetidos then
  begin
    ssql := '';
    NumTraslado := ValorSqlIntegerEx('SELECT nvl(max(tr_numtraslado),0) + 1  ' +
                                      ' FROM str_traslados ' +
                                     ' WHERE tr_idauto = :IdAuto', [iIdAuto]);
    if ValidarFechayHora then
    begin
      if not ValidarFechasRepetidas then
        MsgBox('ATENCION: Ya existe un Turno con la misma fecha para el Siniestro seleccionado.', MB_ICONINFORMATION);

      if btnAceptar.Caption = MODO_APROBACION then
      begin

        //if EsPlataforma10(CodPrestacion, IDPrestador) then
        if bAcompRetorno then                     //Traslados en omnibus - larga distancia
        begin
          dcFechaTurno.Date       := cmbTurnoFecha.Date;
          dcFechaRetorno.MinDate  := dcFechaTurno.Date;
          fpRetorno.ShowModal;
          FechaRetorno := dcFechaRetorno.Date;
          if FechaRetorno > 0 then
            lstRetornos.Items.Add(DateToStr(FechaRetorno));   // TK 16104
        end;

        ssql := ' INSERT INTO str_traslados ' +
                ' (tr_siniestro, tr_orden, tr_recaida, tr_numauto, tr_numtraslado, ' +
                 ' tr_fecha, tr_hora, tr_fecharetorno) VALUES ( ' +
                 SqlInt(iSiniestro) + ',' + SqlInt(iOrden) + ',' +
                 SqlInt(iRecaida) + ',' + SqlInt(iNumAuto) + ',' +
                 SqlInt(NumTraslado) + ',' + cmbTurnoFecha.SqlText + ',' +
                 SqlString(mskTurnoHora.Text,True) + ',' +
                 IIF((FechaRetorno > 0), SqlDate(FechaRetorno), 'Null') + ')';
        if InTransaction then
          EjecutarSqlST(ssql)
        else
          EjecutarSql(ssql);
      end;
      lstTurnos.Items.Add(DateToStr(cmbTurnoFecha.Date) + ' - ' + mskTurnoHora.Text + ' hs.');
    end;
  end
  else
    MsgBox('Ya existe un Turno-Hora igual para dicho Siniestro.', MB_ICONEXCLAMATION);
end;

function TfrmTraslados.TieneRetornos(): boolean;
begin
  TieneRetornos := (lstRetornos.Items.Count > 0) and (lstRetornos.Items[0] <> '');
end;

{-----[Borra Item (Fecha y Hora) en el ListBox]---------------------------------}
procedure TfrmTraslados.btnEliminarTurnoClick(Sender: TObject);
var
  i: Integer;
  ssql, Fecha, Hora: String;
begin
  i:=0;
  ssql := '';
  Fecha := '';
  Hora := '';

  while i <= (lstTurnos.Items.Count - 1) do
  begin
    if lstTurnos.Selected[i] then
    begin
      if btnAceptar.Caption = MODO_APROBACION then    {AUTORIZACIÓN: ademas de lo posterior, hago baja logica en la STR_TRASLADOS}
      try
        Fecha := StrLeft(lstTurnos.Items[i], 10);
        Hora  := StrLeft(StrRight(lstTurnos.Items[i], 9), 5);
        ssql := ' UPDATE str_traslados ' +
                   ' SET tr_fechabaja = Actualdate ' +
                 ' WHERE tr_idauto = ' + SqlInt(iIdAuto) +
                   ' AND tr_fecha = to_date(''' + Fecha + ''', ''dd/mm/yyyy'') ' +
                   ' AND tr_hora = ''' + Hora + '''';
        if InTransaction then
          EjecutarSqlST(ssql)
        else
          EjecutarSql(ssql);
      except
        on E:Exception do
        begin
          MsgBox('No se pudo dar de baja el último Turno debido al siguiente error:' + #13 + #13 + E.Message, MB_ICONEXCLAMATION);
        end;
      end;

      lstTurnos.Items.Delete(i);    {CARGA: solo borro de la pantalla los ítems}
      lstRetornos.Items.Delete(i);  // TK 16104
      Dec(i);
    end;
    Inc(i);
  end;
end;

function TfrmTraslados.ValidarFechayHora: Boolean;
var
  Mensaje, CadenaHora: String;
  i, j: Integer;
begin
  Mensaje :='';
  CadenaHora := mskTurnoHora.Text;
  i := 0;
  Result := True;
  for j := 1 to 5 do
    if (CadenaHora[j] = ' ') then
      CadenaHora[j] := '0';

  mskTurnoHora.Text := CadenaHora;

  if (cmbTurnoFecha.Date = 0) then
    Mensaje := 'Falta completar la Fecha'
  else if (StrLeft(mskTurnoHora.Text, 2) > '23') then
    Mensaje := 'Hora inválida'
  else if (StrRight(mskTurnoHora.Text, 2) > '59') then
    Mensaje := 'Hora inválida'
  else    {este va al final}
  begin
    if lstTurnos.Items.Count > 0 then
      while (i <= (lstTurnos.Items.Count - 1)) and (Mensaje = '') do
      begin
        if (StrLeft(lstTurnos.Items[i], 10) = cmbTurnoFecha.Text) and
           (StrRight(lstTurnos.Items[i], 9) = (mskTurnoHora.Text + ' hs.')) then
          Mensaje := 'No se pueden repetir los turnos';
        Inc(i);
      end;
  end;

  if Mensaje <> '' then
  begin
    Result := False;
    MsgBox('No se puede insertar debido al siguiente error:' + #13 + Mensaje, MB_ICONEXCLAMATION);
  end;
end;
{-------[btn Aceptar ó Aprobar si es que estoy en Aprobacion]-------------------}
procedure TfrmTraslados.btnAceptarClick(Sender: TObject);
var
  NumTraslado, i, idTraslado: Integer;
  sSQL, TurnoFecha, TurnoHora, sCampoImporte, sValorRetorno, sSqlValPrestacion, sExcedenteBase, sTexto, sURL, sObservaciones: String;
  FechaRetorno: TDate;
  bAprobando: Boolean;
  fDistanciaTotal: Extended;
  cValPrestacion: Currency;
begin
  verificar(tieneretornos and (cmbRetorno.ItemIndex <> 0), cmbRetorno, 'Se han detectado retornos cargados; esta opción debe estar marcada como ''Si'''); //WTF??? Todo en minúscula?? Punto y coma en una oración?? Sin prefijo ni nomenclatura??? Hacía falta poner esta validación en el primer renglón??? (ni siquiera detrás de las incializaciones de las variables...)
  bAprobando := btnAceptar.Caption = MODO_APROBACION;
  fraPrestadorDesde.FrameExit(Sender);
  fraPrestadorHasta.FrameExit(Sender);
  //i                := 0;
  TurnoFecha       := '';
  TurnoHora        := '';
  FechaRetorno     := 0;

  if Validar then
  begin
    {Validaciones del GIS}
    if (TipoPrestacion = tpTraslado) and (fraGISMapa.GISInfo.TotalDistance <= 0) then
    try
      FKmExcedenteBase := 0;
      IniciarEspera('Espere por favor...');

      if not fraDireccionDesde.GeoCodificado then
      begin
        IniciarEspera('Dirección de origen...');
        try
          if not fraDireccionDesde.GeoCodificar(True, cmbDesde.FieldValue) and bAprobando then
          begin
            InfoHint(fraDireccionDesde, 'No se pudo geocodificar la dirección de origen, por favor verifíquela.', True);
            AdvToolPanelTabLateral.Visible := True;
          end;
        finally
          DetenerEspera;
        end;
      end;
      Application.ProcessMessages;

      if fraBaseRemiseria.Visible and fraBaseRemiseria.IsSelected then
      begin
        if fraDomicilioBaseRemis.IsSelected and fraDomicilioBaseRemis.GeoCodificado then
          FKmExcedenteBase := fraDomicilioBaseRemis.CalculateDistanceTo(fraDireccionDesde.Address)
        else
          InfoHint(fraBaseRemiseria.edCodigo, 'Verifique el domicilio de la base de la remisería seleccionada.', True);
      end;

      Application.ProcessMessages;
      if not fraDireccionHasta.GeoCodificado then
      begin
        IniciarEspera('Dirección de destino...');
        try
          if not fraDireccionHasta.GeoCodificar(True, cmbHasta.FieldValue) and bAprobando then
          begin
            InfoHint(fraDireccionHasta, 'No se pudo geocodificar la dirección de destino, por favor verifíquela.', True);
            AdvToolPanelTabLateral.Visible := True;
          end;
        finally
          DetenerEspera;
        end;
      end;

      Application.ProcessMessages;
      IniciarEspera('Calculando recorrido...');
      try
        CalcularDistanciaGIS(True);
      finally
        Application.ProcessMessages;
        DetenerEspera;
      end;
    finally
      try
        DetenerEspera;
      except
        Sleep(250);
        DetenerEspera;
      end;
      Application.ProcessMessages;
    end;
    {Fin de las Validaciones del GIS}

    if bAprobando then
    begin
      Verificar((TipoPrestacion = tpTraslado) and (fraGISMapa.GISInfo.TotalDistance = -1), btnAceptar, 'No se pudo calcular la distancia del recorrido, verifique su conexión a Internet (maps.google.com) o consulte con la Mesa de Ayuda de Sistemas (interno 2929 o mesadeayuda@provart.com.ar).');
      //Verificar((TipoPrestacion = tpTraslado) and (fraGISMapa.GISInfo.TotalDistance = 0), btnAceptar, 'No se pudo calcular la distancia del recorrido, verifique las direcciones de origen y destino.');

      if (TipoPrestacion = tpTraslado) and (fraGISMapa.GISInfo.TotalDistance = 0) then
        InfoHint(btnAceptar, 'Tenga en cuenta que si la distancia calculada es nula se sugiere que verifique las direcciones de origen y destino.');

      SetTipoTraslado;
      if (TipoPrestacion = tpOtra) or ((FTipoTraslado <> ttRemis) and (FTipoTraslado <> ttNada)) then
        DoInsertarAutTraslados;

      if FKmExcedenteBase > 0 then
        sExcedenteBase := CRLF + CRLF + 'Tenga en cuenta que ' + FloatToStr(FKmExcedenteBase) + ' kilómetros corresponden a la distancia entre la base de la remisería y domicilio de origen para el traslado.' + CRLF + CRLF
      else
        sExcedenteBase := CRLF + CRLF;

      if fraGISMapa.GISInfo.TotalDistance > 0 then
        sTexto := Format('La distancia calculada es aproximadamente de %f km.' + '%s' + '¿Desea continuar?', [fraGISMapa.GISInfo.TotalDistance, sExcedenteBase])
      else
        sTexto := 'No se pudo calcular el recorrido entre la dirección de origen y la de destino. ¿Desea continuar?';

      if (TipoPrestacion = tpTraslado) and not MsgAsk(sTexto) then
      begin
        AdvToolPanelTabLateral.Visible := True;
        InfoHint(pnlGIS, 'Puede desplegar el mapa y corroborar los puntos de origen y destino para determinar si fueron ubicados correctamente.');
        Abort;
      end;

      if EsTrasladoRemisMuyExtenso and (not Seguridad.Claves.IsActive('MesaDeTraslados')) then
      begin
        if MsgAsk('El traslado supera los ' + IntToStr(KM_TOPE_MESA_TRASLADOS) + 'km, únicamente puede ser aprobado por la Mesa de Traslados.' + CRLF + CRLF + '¿Desea dar aviso ahora a través de un correo electrónico con la información sobre este traslado?' + CRLF + CRLF +
                  'Nota: Tenga en cuenta que si realizó algún cambio de último momento sobre el traslado, éste no se guardará, con lo cual le pedimos que lo informe en las observaciones que se abrirán a continuación.') then
        begin
          {No puedo guardar los cambios que haya hecho el usuario, no tengo forma...}
          RollBack(True);
          {Le pido observaciones}
          sObservaciones := InputBox('Aviso para la Mesa de Traslados', 'Observaciones relacionadas con este traslado', '');
          {Envío el mail a la Mesa de Traslados}
          EnviarMailBD('traslados@provart.com.ar', 'Aprobación de traslado pendiente para el siniestro ' + edSiniestro.Text + '/' + edOrden.Text + '/' + edRecaida.Text,
                       [oAutoFirma], 'El usuario ' + Sesion.Usuario + ' tiene pendiente la aprobación de un traslado correspondiente al siniestro ' + edSiniestro.Text + '/' + edOrden.Text + '/' + edRecaida.Text + ', autorización ' + edNumAuto.Text + '. ' +
                       'El kilometraje total calculado es de ' + FloatToStr(edKilometraje.Value + edKMExcedente.Value + edKMBase.Value) + 'km' +
                       iif(edKMExcedente.Value > 0, ', donde ' + edKMExcedente.Text + 'km corresponden a excedente', '') +
                       iif(edKMBase.Value > 0, ', donde ' + edKMBase.Text + 'km corresponden a excedente desde la base', '') + '.' +
                       iif(IsEmptyString(sObservaciones), '', CRLF + 'Observaciones: ' + sObservaciones));
          btnCancelar.Click;
        end;
        Abort;
      end;
    end;

    try
      if (btnAceptar.Caption = MODO_CARGA) then
        sCampoImporte := 'au_importe'
      else
        sCampoImporte := 'au_impoapro';

      sValorRetorno   := GetValorRetorno;
      fDistanciaTotal := fraGISMapa.GISInfo.TotalDistance;
      sURL            := fraGISMapa.URL;

      FHuboCambioPrestacion := False;

      OpenQueryEx(sdqZonas, [SqlNumber(fDistanciaTotal, False), PORC_DESVIO_GIS, edKMExcedente.Value, sValorRetorno,
                             iIdAuto, IDPrestador,
                             fraDireccionDesde.CodigoPostal, String(iif(StrToIntDef(fraDireccionDesde.CodigoPostal, 0) < MAXCODCAPFED, fraDireccionDesde.Calle, fraDireccionDesde.Localidad)), fraDireccionDesde.Prov,
                             fraDireccionHasta.CodigoPostal, String(iif(StrToIntDef(fraDireccionHasta.CodigoPostal, 0) < MAXCODCAPFED, fraDireccionHasta.Calle, fraDireccionHasta.Localidad)), fraDireccionHasta.Prov]);
      with sdqZonas do
      begin
        if Active and not IsEmpty then
        begin
          if RecordCount > 1 then
            ShowMessage('Se detectó más de una zona para las localidades de origen y destino seleccionadas. Consulte con el sector de Prestadores al respecto.')
          else begin
            if not MsgAsk('El prestador de traslados seleccionado trabaja con ZONAS y se detectó un valor nomenclado ' +
                          'correspondiente a las localidades de origen y destino seleccionadas.' + CRLF + CRLF +
                          'Origen: ' + FieldByName('ORIGEN').AsString + CRLF +
                          'Destino: ' + FieldByName('DESTINO').AsString + CRLF + CRLF +
                          'El módulo detectado es el siguiente:' + CRLF +
                          'Nomenclador: ' + FieldByName('ZV_NOMENCLADOR').AsString + CRLF +
                          'Capítulo: ' + FieldByName('ZV_CAPITULO').AsString + CRLF +
                          'Código: ' + FieldByName('ZV_CODIGO').AsString + CRLF + CRLF +
                          'Importe del viaje individual: $ ' + FieldByName('IMPORTE').AsString + CRLF + CRLF +
                          '¿Desea continuar?') then
              Abort
            else begin
              sSQL := 'UPDATE art.sau_autorizaciones SET au_pres_nomenclador = :nom, au_pres_capitulo = :cap, au_pres_codigo = :cod WHERE au_id = :id ';
              EjecutarSqlSTEx(sSQL, [FieldByName('ZV_NOMENCLADOR').AsString, FieldByName('ZV_CAPITULO').AsString, FieldByName('ZV_CODIGO').AsString, iIdAuto]);
              FHuboCambioPrestacion := True;
            end;
          end;
        end else
          if ExisteSQLEx('SELECT 1 FROM art.szv_zonavalor WHERE zv_idprestador = :idprestador AND zv_fechabaja IS NULL', [IDPrestador]) then
            if not MsgAsk('El prestador seleccionado trabaja con ZONAS y por TRAMOS, pero para el origen y el destino elegidos no hay información al respecto. Se utilizará un valor predeterminado.' + CRLF + '¿Desea continuar?') then
              Abort;
      end;

      // TK 45978
      sSqlValPrestacion := 'SELECT art.amebpba.get_val_prestacion(' + IntToStr(IDPrestador) + ', au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, ' +
                                                                  'au_siniestro, au_orden, au_recaida, au_fechasoli, au_id, null,  ' +
                                                                  '(' + SqlNumber(fDistanciaTotal, False) + ' * ' + StringReplace(FloatToStr(PORC_DESVIO_GIS), ',', '.', []) + ') + NVL(' + SQLValue(edKMExcedente.Value) + ', 0), ' + SqlValue(sValorRetorno) + ' ) '
                          + ' FROM sau_autorizaciones '
                         + ' WHERE au_id = ' + SqlInt(iIdAuto);
      cValPrestacion := ValorSqlExtended(sSqlValPrestacion);

      {SAU_AUTORIZACIONES}
      sSQL := ' UPDATE sau_autorizaciones ' +
                 ' SET au_eltraslado = ' + SqlString(edTipoTraslado.Text,True) + ', ' +
                     ' au_solicitante = ' + SqlString(edSolicitante.Text,True) + ', ' +
                     ' au_tdesde = ' + SqlString(cmbDesde.FieldValue,True)     + ', ' +
                     ' au_thasta = ' + SqlString(cmbHasta.FieldValue,True)     + ', ' +
                     ' au_dcalle = ' + SqlString(fraDireccionDesde.Calle,True)  + ', ' +
                     ' au_dnumero = ' + SqlString(fraDireccionDesde.Numero,True) + ', ' +
                     ' au_dpiso = ' + SqlString(fraDireccionDesde.Piso,True)     + ', ' +
                     ' au_ddepartamento = ' + SqlString(fraDireccionDesde.Departamento,True)+ ', ' +
                     ' au_dcpostal = ' + SqlString(fraDireccionDesde.CodigoPostal,True) + ', '+
                     ' au_dlocalidad = ' + SqlString(fraDireccionDesde.Localidad,True) + ', ' +
                     ' au_dprovincia = ' + SqlInt(fraDireccionDesde.Prov,True) + ', ' +
                     ' au_prestdesde = ' + SqlValue(fraPrestadorDesde.IDPrestador) + ', ' +
                     ' au_hcalle = ' + SqlString(fraDireccionHasta.Calle,True) + ', ' +
                     ' au_hnumero = ' + SqlString(fraDireccionHasta.Numero,True) + ', ' +
                     ' au_hpiso = ' + SqlString(fraDireccionHasta.Piso,True) +', ' +
                     ' au_hdepartamento = ' + SqlString(fraDireccionHasta.Departamento,True)+ ', ' +
                     ' au_hcpostal = ' + SqlString(fraDireccionHasta.CodigoPostal,True) + ', '+
                     ' au_hlocalidad = ' + SqlString(fraDireccionHasta.Localidad,True) + ', ' +
                     ' au_hprovincia = ' + SqlInt(fraDireccionHasta.Prov,True) + ', ' +
                     ' au_presthasta = ' +  SqlValue(fraPrestadorHasta.IDPrestador) + ', ' +
                     ' au_acompanante = IIF_CHAR('+ SqlString(cmbAcompaniante.Text,True) + ', ''No'', ''N'', ''S'' ), ' +
                     ' au_espera = IIF_CHAR('+ SqlString(cmbEspera.Text,True) + ', ''No'', ''N'', ''S'' ), ' +
                    // ' au_retorno = IIF_CHAR('+ SqlString(cmbRetorno.Text,True) + ', ''No'', ''N'', ''S'' ), ' +
                     ' au_retorno = ' + SqlString(sValorRetorno, True) + ', ' +

                     ' au_elcontencion = ' + SqlString(edElContencion1.Text,True) + ', ' +
                     ' au_elcontencion2 = ' + SqlString(edElContencion2.Text,True) + ', ' +
                     ' au_elcontencion3 = ' + SqlString(edElContencion3.Text,True) + ', ' +
                     ' au_nrovueloida = ' + SqlString(edVueloIda.Text,True) + ', ' +
                     ' au_nrovuelovuelta = ' + SqlString(edVueloVuelta.Text,True) + ', ' +

                     ' au_viaje_exclusivo = ' + SqlBoolean(chkExclusivo.Checked, True) + ', ' +
                     ' au_viaje_nocturno = ' + SqlBoolean(chkNocturno.Checked, True) + ', ' +
                     ' au_viaje_findesemana = ' + SqlBoolean(chkFinDeSemana.Checked, True) + ', ' +

                     iif(bEsTrasladoAvion,
                     ' ' + sCampoImporte + ' = ' + SqlNumber(edTarifaVuelo.Value) + ',',
                     ' ' + sCampoImporte + ' = ' + SqlNumber(CalcularCantidad) +
                                               ' * ' + SqlNumber(cValPrestacion)
                        + ',' ) +
                     ' au_nombreacomp = ' + SqlString(edNombreAcomp.Text, True, True) + ',' +
                     iif((TipoPrestacion = tpTraslado),
                     ' au_kmexcedente = ' + SqlNumber(edKMExcedente.Value, True) + ',' +
                     ' au_kmviaje = ' + SqlNumber(Max(0, fDistanciaTotal - FKmExcedenteBase), True) + ',' +
                     ' au_kmbase = ' + SqlNumber(FKmExcedenteBase, True) + ',' +                     
                     ' au_idbaseremis = ' + SqlNumber(fraBaseRemiseria.Codigo, True) + ',' +
                     ' au_dlat = ' + SqlNumber(Min(fraDireccionDesde.Coordenadas.Latitude, fraGISMapa.GISInfo.Origin.Point.Latitude), True) + ',' +
                     ' au_dlng = ' + SqlNumber(Min(fraDireccionDesde.Coordenadas.Longitude, fraGISMapa.GISInfo.Origin.Point.Longitude), True) + ',' +
                     ' au_hlat = ' + SqlNumber(Min(fraDireccionHasta.Coordenadas.Latitude, fraGISMapa.GISInfo.Destination.Point.Latitude), True) + ',' +
                     ' au_hlng = ' + SqlNumber(Min(fraDireccionHasta.Coordenadas.Longitude, fraGISMapa.GISInfo.Destination.Point.Longitude), True) + ','
                     , '') +
                     ' au_dniacomp = ' + SqlString(edDNIAcomp.Text, True, True) ;


      if (btnAceptar.Caption = MODO_CARGA) then
        sSQL := sSQL + ', au_cantidad = ' + SqlInt(CalcularCantidad)  // sino se actualiza en el aprobar del unAutAprob, el campo au_cantapro con la cantidad de items del lstTurnos.
      else
      begin                                                              //DFG 13/10/11
        sSQL := sSQL + ', au_cantidad = ' + SqlInt(CalcularCantidad) +
                       ', au_cantapro = ' + SqlInt(CalcularCantidad);
      end;

      sSQL := sSQL + ' WHERE au_id = :id ';

      EjecutarSqlSTEx(sSQL, [iIdAuto]);

      if (btnAceptar.Caption = MODO_APROBACION) then
      begin
        if not ExisteSQLEx('SELECT 1 FROM amed.mvi_viaje WHERE vi_idauto = :idauto', [iIdAuto]) then
        begin
          {Inserto el viaje en otra tabla para poder distinguir lo realizado con el nuevo GIS}
          sSQL := 'INSERT INTO amed.mvi_viaje (vi_id, vi_idauto, vi_usualta, vi_fechaalta, vi_distanciatotal, vi_url) ' +
                  ' VALUES (amed.seq_mvi_id.nextval, :idauto, :usualta, SYSDATE, :distanciatotal, :url)';
          EjecutarSqlSTEx(sSQL, [iIdAuto, Sesion.UserID, fDistanciaTotal, sURL]);
        end else
        begin
          {Actualizo el viaje}
          sSQL := 'UPDATE amed.mvi_viaje SET vi_usualta = :usualta, vi_fechaalta = SYSDATE, vi_distanciatotal = :distanciatotal, vi_url = :url WHERE vi_idauto = :idauto ';
          EjecutarSqlSTEx(sSQL, [Sesion.UserID, fDistanciaTotal, sURL, iIdAuto]);
        end;
      end;

      if (TipoPrestacion = tpTraslado) then
      begin
        {GIS CTJ_TRABAJADOR}
        sSQL := 'UPDATE CTJ_TRABAJADOR SET TJ_LAT = :LAT, TJ_LNG = :LNG WHERE TJ_CUIL = :CUIL';
        if fraDireccionDesde.GeoCodificado and (cmbDesde.FieldValue = 'T') then
          EjecutarSqlSTEx(sSQL, [fraDireccionDesde.Coordenadas.Latitude, fraDireccionDesde.Coordenadas.Longitude, edCuil.Text]);
        if fraDireccionHasta.GeoCodificado and (cmbHasta.FieldValue = 'T') then
          EjecutarSqlSTEx(sSQL, [fraDireccionHasta.Coordenadas.Latitude, fraDireccionHasta.Coordenadas.Longitude, edCuil.Text]);

        {GIS CPR_PRESTADOR}
        sSQL := 'UPDATE CPR_PRESTADOR SET CA_LAT = :LAT, CA_LNG = :LNG WHERE CA_IDENTIFICADOR = :ID AND (CA_LAT IS NULL OR CA_LNG IS NULL)';
        if fraDireccionDesde.GeoCodificado and (cmbDesde.FieldValue = 'P') then
          EjecutarSqlSTEx(sSQL, [fraDireccionDesde.Coordenadas.Latitude, fraDireccionDesde.Coordenadas.Longitude, fraPrestadorDesde.IDPrestador]);
        if fraDireccionHasta.GeoCodificado and (cmbHasta.FieldValue = 'P') then
          EjecutarSqlSTEx(sSQL, [fraDireccionHasta.Coordenadas.Latitude, fraDireccionHasta.Coordenadas.Longitude, fraPrestadorHasta.IDPrestador]);
      end;

      {STR_TRASLADOS}

      if (btnAceptar.Caption = MODO_APROBACION) and (not TieneRetornos) and (cmbRetorno.ItemIndex = 0) then
      begin
        i := 0;
        while (i <= lstTurnos.Items.Count - 1) do
        begin
          if bAcompRetorno then
          begin
            dcFechaTurno.Date      := StrToDate(StrLeft(lstTurnos.Items[i], 10));
            dcFechaRetorno.MinDate := dcFechaTurno.Date;
            fpRetorno.ShowModal;
            FechaRetorno := dcFechaRetorno.Date;

            ssql := ' select tr_id from str_traslados ' +
                          '  where tr_idauto = :idauto ' +
                           '   and tr_fecha = :fec and tr_hora = :hor ';
            idTraslado := ValorSqlEx(ssql, [iIdAuto, StrLeft(lstTurnos.Items[i], 10), StrLeft(StrRight(lstTurnos.Items[i], 9), 5)]);

            ssql := ' update str_traslados ' +
                     '   set tr_fecharetorno = :ret ' +
                     ' where tr_id = :idtraslado ';

            EjecutarSqlSTEx(sSQL, [datetostr(FechaRetorno), idTraslado]);
          end;
          i := i + 1;
        end;
      end;

      i := 0;
      if (btnAceptar.caption = MODO_CARGA) then   {lo hace si es solo en la carga, en la Aut, se hace en el momento.}
      begin
        while (i <= lstTurnos.Items.Count - 1) do
        begin
          NumTraslado := ValorSqlIntegerEx('SELECT nvl(max(tr_numtraslado),0) + 1  FROM str_traslados '+
                                           ' WHERE tr_idauto = :IdAut', [iIdAuto]);
          TurnoFecha := StrLeft(lstTurnos.Items[i], 10);
          TurnoHora  := StrLeft(StrRight(lstTurnos.Items[i], 9), 5);

          if bAcompRetorno then
          begin
            dcFechaTurno.Date       := StrToDate(TurnoFecha);
            dcFechaRetorno.MinDate  := dcFechaTurno.Date;
            fpRetorno.ShowModal;
            FechaRetorno := dcFechaRetorno.Date
          end;

          sSQL := ' INSERT INTO str_traslados ' +
                   ' (tr_siniestro, tr_orden, tr_recaida, tr_numauto, ' +
                    ' tr_numtraslado, tr_fecha, tr_hora, tr_fecharetorno) ' +
                   ' VALUES ( ' +
                    SqlInt(iSiniestro) + ',' + SqlInt(iOrden) + ',' +
                    SqlInt(iRecaida) + ',' + SqlInt(iNumAuto) + ',' +
                    IntToStr(NumTraslado) + ', TO_DATE(''' + TurnoFecha + ''', ''DD/MM/YYYY''), ' +
                    SqlString(TurnoHora, True) + ',' +
                    IIF((FechaRetorno > 0), SqlDate(FechaRetorno), 'Null') + ')';
          EjecutarSqlST(sSQL);
          Inc(i);
        end;
      end;

      if (btnAceptar.Caption = MODO_CARGA) 
      and chkExtension.Checked
      and MsgAsk('¿Confirma que desea indicar otro destino a modo de extensión del viaje?' + CRLF +
                 '(Se generará una nueva autorización con los datos correspondientes)') then
      begin
        if fpExtension.ShowModal = mrOK then
        begin
          iNumAuto := DoExtenderAutorizacion(True);

          sSQL := 'SELECT au_id ' +
                   ' FROM sau_autorizaciones, sex_expedientes ' +
                  ' WHERE au_siniestro = :Sin ' +
                    ' AND au_orden = :Ord ' +
                    ' AND au_recaida = :Reca ' +
                    ' AND au_numauto = :Auto ' +
                    ' AND au_idexpediente = ex_id';
          iIdAuto := ValorSQLIntegerEx(sSQL,[iSiniestro, iOrden, iRecaida, iNumAuto]);

          {STR_TRASLADOS}
          if btnAceptar.Caption = MODO_CARGA then   {lo hace si es solo en la carga, en la Aut, se hace en el momento.}
          begin
            {SAU_AUTORIZACIONES}
            sSQL := ' UPDATE sau_autorizaciones ' +
                       ' SET au_elcontencion = ' + SqlString(edElContencion1.Text,True) + ', ' +
                           ' au_elcontencion2 = ' + SqlString(edElContencion2.Text,True) + ', ' +
                           ' au_elcontencion3 = ' + SqlString(edElContencion3.Text,True) + ', ' +
                           ' au_nrovueloida = ' + SqlString(edVueloIda.Text,True) + ', ' +
                           ' au_nrovuelovuelta = ' + SqlString(edVueloVuelta.Text,True) + ', ' +

                           ' au_viaje_exclusivo = ' + SqlBoolean(chkExclusivo.Checked, True) + ', ' +
                           ' au_viaje_nocturno = ' + SqlBoolean(chkNocturno.Checked, True) + ', ' +
                           ' au_viaje_findesemana = ' + SqlBoolean(chkFinDeSemana.Checked, True) + ', ' +

                           ' au_nombreacomp = ' + SqlString(edNombreAcomp.Text, True, True) + ',' +
                           ' au_dniacomp = ' + SqlString(edDNIAcomp.Text, True, True);
            if (btnAceptar.Caption = MODO_CARGA) then
              sSQL := sSQL + ', au_cantidad = ' + SqlInt(CalcularCantidad);  // sino se actualiza en el aprobar del unAutAprob, el campo au_cantapro con la cantidad de items del lstTurnos.
            sSQL := sSQL + ' WHERE au_id = ' + SqlInt(iIdAuto);
            EjecutarSqlST(sSQL);

            i := 0;

            while (i <= lstTurnos.Items.Count - 1) do
            begin
              NumTraslado := ValorSqlIntegerEx('SELECT nvl(max(tr_numtraslado),0) + 1  FROM str_traslados '+
                                               ' WHERE tr_idauto = :IdAut', [iIdAuto]);
              TurnoFecha := StrLeft(lstTurnos.Items[i], 10);
              TurnoHora  := StrLeft(StrRight(lstTurnos.Items[i], 9), 5);

              if bAcompRetorno then
              begin
                dcFechaTurno.Date       := StrToDate(TurnoFecha);
                dcFechaRetorno.MinDate  := dcFechaTurno.Date;
                fpRetorno.ShowModal;
                FechaRetorno := dcFechaRetorno.Date
              end;

              sSQL := ' INSERT INTO str_traslados ' +
                       ' (tr_siniestro, tr_orden, tr_recaida, tr_numauto, ' +
                        ' tr_numtraslado, tr_fecha, tr_hora, tr_fecharetorno) ' +
                       ' VALUES ( ' +
                        SqlInt(iSiniestro) + ',' + SqlInt(iOrden) + ',' +
                        SqlInt(iRecaida) + ',' + SqlInt(iNumAuto) + ',' +
                        IntToStr(NumTraslado) + ', TO_DATE(''' + TurnoFecha + ''', ''DD/MM/YYYY''), ' +
                        SqlString(TurnoHora, True) + ',' +
                        IIF((FechaRetorno > 0), SqlDate(FechaRetorno), 'Null') + ')';
              EjecutarSqlST(sSQL);
              Inc(i);
            end;
          end;
        end else
          Rollback(True);
      end;

      if btnAceptar.Caption = MODO_CARGA then
        CommitTrans(True);

      {cierra el formulario:}
      if bAprobando then
        ModalResult := mrOk
      else
        Close;
    except
      on E:Exception do
      begin
        MsgBox('Ha ocurrido el siguiente error al Guardar los datos:' + #13 + E.Message, MB_ICONEXCLAMATION);
        Rollback(True);
      end;
    end;

  end;  //del if validar
end;
{-------[btn Cancelar]----------------------------------------------------------}
procedure TfrmTraslados.btnCancelarClick(Sender: TObject);
begin
  if (btnAceptar.Enabled) and (btnAceptar.Caption = MODO_CARGA) then
    RollBack(True);
  Close;
end;

function TfrmTraslados.Validar: Boolean;
begin
  Result := False;

  if not fraDireccionDesde.IsValid then

  else if not fraDireccionHasta.IsValid then
    
  else if Trim(cmbTipoTraslado.Text) = '' then
    InvalidMsg(cmbTipoTraslado, 'El tipo de Traslado es obligatorio.')

  else if Trim(cmbSolicitante.Text) = '' then
    InvalidMsg(cmbSolicitante, 'El Solicitante es obligatorio.')

  else if Trim(cmbDesde.Text) = '' then
    InvalidMsg(cmbDesde, 'El campo Desde es obligatorio.')

  else if (Trim(cmbDesde.Text) = 'OTRO') and fraDireccionDesde.IsEmpty then
  begin
    InvalidMsg(fraDireccionDesde, 'Falta completar el domicilio Desde.');
    fraDireccionDesde.SetFocus;
  end

  else if ((Trim(cmbDesde.Text) = 'PRESTADOR') and ((fraPrestadorDesde.Cuit = '') or
          (fraPrestadorDesde.Secuencia = 0) or (fraPrestadorDesde.IDPrestador = 0) or
          (fraPrestadorDesde.RazonSocial = ''))) then
  begin
    MsgBox('El Prestador Desde está incompleto.', MB_ICONEXCLAMATION);
  end

  else if Trim(cmbHasta.Text) = '' then
    InvalidMsg(cmbHasta, 'El campo Hasta es obligatorio.')

  else if (Trim(cmbHasta.Text) = 'OTRO') and fraDireccionHasta.IsEmpty then
  begin
    InvalidMsg(fraDireccionHasta, 'Falta completar el domicilio Hasta.');
    fraDireccionHasta.SetFocus;
  end

  else if ((Trim(cmbHasta.Text) = 'PRESTADOR') and ((fraPrestadorHasta.Cuit = '') or
          (fraPrestadorHasta.Secuencia = 0) or (fraPrestadorHasta.IDPrestador = 0) or
          (fraPrestadorHasta.RazonSocial = ''))) then
  begin
    MsgBox('El Prestador Hasta está incompleto.', MB_ICONEXCLAMATION);
  end

  else if (Trim(cmbHasta.Text) = 'PRESTADOR') and (Trim(cmbDesde.Text) = 'PRESTADOR') and
          (fraPrestadorDesde.IDPrestador = fraPrestadorHasta.IDPrestador) then
  begin
    MsgBox('El Prestador Desde no puede ser el mismo que el Prestador Hasta.', MB_ICONEXCLAMATION);
  end

  else if lstTurnos.Items.Count = 0 then
  begin
    InvalidMsg(lstTurnos, 'Falta completar los Turnos.')
  end

  else if ((CodPrestacion = '449200') or (CodPrestacion = '449300') or (CodPrestacion = '449400')) and
          (Trim(edElContencion1.Text) = '') then
  begin
    InvalidMsg(edElContencion1, 'Para prestaciones de Traslados en Ambulancia, ' + #13 +
                                'debe haber al menos un elemento de Contención');
  end

  //camarillo - 13/02/07 - validacion de nuevos campos de nro e importe de vuelo (cuando la prestacion es un vuelo)
  else if bEsTrasladoAvion and (edVueloIda.Text = '') and (edVueloVuelta.Text = '') and (btnAceptar.Caption = MODO_APROBACION) then
  begin
    InvalidMsg(edVueloIda, 'Para prestaciones de Traslados en Avión, ' + #13 +
                           'debe haber al menos un número de vuelo (ida o vuelta)');
  end

  else if bEsTrasladoAvion and (edTarifaVuelo.Value = 0) and (btnAceptar.Caption = MODO_APROBACION) then
  begin
    InvalidMsg(edTarifaVuelo, 'Para prestaciones de Traslados en Avión, ' + #13 +
                              'debe ingresar la Tarifa total');
  end

  else if btnAceptar.Caption = MODO_CARGA then       {porque es Carga}
    Result := ValidarPlataforma10

  else if btnAceptar.Caption = MODO_APROBACION then   {porque es Autorización y sigue validando}
  begin
    if fraDireccionDesde.IsEmpty then
      InvalidMsg(fraDireccionDesde, 'Falta completar el domicilio "Desde".')
    else if ValorSQLEx('SELECT ART.AMEBPBA.IS_AUTOENLIMITE(:Siniestro, :Orden, :Recaida, :NroAuto, :PrestaApro, :Letra)' +
                        ' FROM DUAL',
                       [iSiniestro, iOrden, iRecaida,
                        iNumAuto, IDPrestador, 'T']) = 'N' then
      InvalidMsg(nil, 'La autorización excede el límite diario para el prestador seleccionado.')
    else if fraDireccionHasta.IsEmpty then
      InvalidMsg(fraDireccionHasta, 'Falta completar el domicilio "Hasta".')
    else
      Result := ValidarFechaHoraOtras and ValidarFechaOtras and ValidarPlataforma10;
  end;
end;

function TfrmTraslados.ValidarSiniyTurnosRepetidos: Boolean;
var
  sSQL: String;
begin
  sSQL   := 'SELECT tr_numauto ' +
             ' FROM sau_autorizaciones, str_traslados ' +
            ' WHERE au_id = tr_idauto ' +
              ' AND tr_siniestro = ' + SqlInt(iSiniestro) +
              ' AND tr_orden = ' + SqlInt(iOrden) +
              ' AND tr_recaida = ' + SqlInt(iRecaida) +
              ' AND tr_fecha = ' + SqlDate(StrToDate(cmbTurnoFecha.Text)) +
              ' AND tr_hora = ' + SqlString(mskTurnoHora.Text,True) +
              ' AND au_estado NOT IN (''D'',''R'',''U'',''V'',''N'') ' +
              ' AND tr_fechabaja IS NULL ' +
              ' AND tr_fechaanulacion IS NULL ' +
            ' GROUP BY tr_numauto ';

  Result := not ExisteSql(sSQL);
end;

procedure TfrmTraslados.DeshabilitarFraPrestador(Tipo: String);
begin
  if tipo = 'DESDE' then
    VCLExtra.LockControls([fraPrestadorDesde], True)
  else if tipo = 'HASTA' then
    VCLExtra.LockControls([fraPrestadorHasta], True)
  else
    VCLExtra.LockControls([fraPrestadorHasta2], True)  
end;

procedure TfrmTraslados.HabilitarFraPrestador(Tipo: String);
begin
  if tipo = 'DESDE' then
    VCLExtra.LockControls([fraPrestadorDesde], False)
  else if tipo = 'HASTA' then
    VCLExtra.LockControls([fraPrestadorHasta], False)
  else
    VCLExtra.LockControls([fraPrestadorHasta2], False)  
end;

function TfrmTraslados.HuboCambioPrestacion: Boolean;
begin
  Result := FHuboCambioPrestacion;
end;

procedure TfrmTraslados.CargarPantalla(Siniestro, Orden, Recaida, NumAuto :Integer;
                                       Cuil, Nombre, CodPres: String;
                                       TipoPrest: TTipoPrestacion = tpNinguna);
var
  sSQL :String;
begin
  FTipoPrestacion := TipoPrest;
  Cargar(Siniestro, Orden, Recaida, NumAuto, Cuil, Nombre, CodPres);
  CargarTraslados(TipoPrestacion = tpOtra);
  sdqTrasladosSAU.Close;
  if TipoPrestacion = tpOtra then
    sSQL := ' SELECT ''P'' au_eltraslado, ''P'' au_solicitante, au_estado, au_pressol, ' +
                   ' ''T'' au_tdesde, ''P'' au_thasta, ' + SqlInt(IDPrestador) + ' au_presthasta ' +
              ' FROM sau_autorizaciones ' +
             ' WHERE au_id = ' + SqlInt(iIdAuto)
  else
    sSQL := ' SELECT au_eltraslado, au_solicitante, au_acompanante, au_estado, ' +
                   ' au_espera, au_retorno, au_elcontencion, au_elcontencion2, ' +
                   ' au_elcontencion3, au_tdesde, au_thasta, au_prestdesde, ' +
                   ' au_presthasta, au_dcalle, au_dnumero, au_ddepartamento, ' +
                   ' au_dpiso, au_dcpostal, au_dlocalidad, au_dprovincia, ' +
                   ' au_hcalle, au_hnumero, au_hdepartamento, au_hpiso, ' +
                   ' au_hcpostal, au_hlocalidad, au_hprovincia, ' +
                   ' au_nrovueloida, au_nrovuelovuelta, au_impoapro, ' +
                   ' au_nombreacomp, au_dniacomp, au_kmexcedente, au_kmviaje, au_kmexcedente, ' +
                   ' au_dlat, au_dlng, au_hlat, au_hlng, au_idautorizacionorigen, au_idbaseremis, au_kmbase, ' +
                   ' vc_id, vc_url, au_pressol, au_fechasoli, ' +
                   ' au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, ' +
                   ' au_viaje_exclusivo, au_viaje_nocturno, au_viaje_findesemana ' +
              ' FROM sau_autorizaciones, amed.mvc_viajecompartido, amed.mvd_viajecompartido_detalle ' +
             ' WHERE au_id = ' + SqlInt(iIdAuto) +
               ' AND au_id = vd_idautorizacion(+) ' +
               ' AND vd_idviajecompartido = vc_id(+) ';

  sdqTrasladosSAU.SQL.Text := sSQL;
  sdqTrasladosSAU.Open;

  btnAceptar.Caption := MODO_APROBACION;

  sEstado := sdqTrasladosSAU.FieldByName('AU_ESTADO').Text;

  {Tipo de Traslado y Solicitante}
  edTipoTraslado.Text        := sdqTrasladosSAU.FieldByName('AU_ELTRASLADO').Text;
  cmbTipoTraslado.FieldValue := sdqTrasladosSAU.FieldByName('AU_ELTRASLADO').Text;
  edSolicitante.Text         := sdqTrasladosSAU.FieldByName('AU_SOLICITANTE').Text;
  cmbSolicitante.FieldValue  := sdqTrasladosSAU.FieldByName('AU_SOLICITANTE').Text;

  FPrestacionAprobada := sdqTrasladosSAU.FieldByName('AU_PRESSOL').Text;

  if TipoPrestacion = tpOtra then
  begin
    cmbDesde.FieldValue   := sdqTrasladosSAU.FieldByName('AU_TDESDE').Text;
    edDesde.Text          := cmbDesde.FieldValue;
    cmbHasta.FieldValue   := sdqTrasladosSAU.FieldByName('AU_THASTA').Text;
    edHasta.Text          := cmbHasta.FieldValue;
    fraPrestadorHasta.Cargar(sdqTrasladosSAU.FieldByName('AU_PRESTHASTA').AsInteger);
    OnPrestadorChangeHasta(Self);
    cmbDesdeCloseUp(Self);
    DeshabilitarControles;
  end
  else begin
    pnlViajeCompartido.Visible := not sdqTrasladosSAU.FieldByName('vc_id').IsNull;

    if (sdqTrasladosSAU.FieldByName('AU_TDESDE').Text = 'P') then //si es desde prestador
      fraPrestadorDesde.Cargar(sdqTrasladosSAU.FieldByName('AU_PRESTDESDE').AsInteger);
    if (sdqTrasladosSAU.FieldByName('AU_THASTA').Text = 'P') then //si es hasta prestador
      fraPrestadorHasta.Cargar(sdqTrasladosSAU.FieldByName('AU_PRESTHASTA').AsInteger);

    fraBaseRemiseria.Codigo := sdqTrasladosSAU.FieldByName('AU_IDBASEREMIS').AsString;
    fraBaseRemiseriaPropiedadesChange(nil);
    fraBaseRemiseria.Visible     := fraBaseRemiseria.IsSelected;
    pnlBaseRemiseria.Visible     := fraBaseRemiseria.Visible;
    btnMapaBaseRemiseria.Visible := fraBaseRemiseria.Visible;

    {Domicilio Desde}
    cmbDesde.FieldValue                 := sdqTrasladosSAU.FieldByName('AU_TDESDE').Text;
    edDesde.Text                        := cmbDesde.FieldValue;
    with fraDireccionDesde do
    begin
      Cargar(sdqTrasladosSAU.FieldByName('AU_DCALLE').Text, sdqTrasladosSAU.FieldByName('AU_DCPOSTAL').Text,
             sdqTrasladosSAU.FieldByName('AU_DLOCALIDAD').Text, sdqTrasladosSAU.FieldByName('AU_DNUMERO').Text,
             sdqTrasladosSAU.FieldByName('AU_DPISO').Text, sdqTrasladosSAU.FieldByName('AU_DDEPARTAMENTO').Text,
             sdqTrasladosSAU.FieldByName('AU_DPROVINCIA').Text, '',
             sdqTrasladosSAU.FieldByName('AU_DLAT').AsFloat, sdqTrasladosSAU.FieldByName('AU_DLNG').AsFloat);
    end;
    DeshabilitarFraPrestador('DESDE');

    {Domicilio Hasta}
    cmbHasta.FieldValue                 := sdqTrasladosSAU.FieldByName('AU_THASTA').Text;
    edHasta.Text                        := cmbHasta.FieldValue;
    with fraDireccionHasta do
    begin
      Cargar(sdqTrasladosSAU.FieldByName('AU_HCALLE').Text, sdqTrasladosSAU.FieldByName('AU_HCPOSTAL').Text,
             sdqTrasladosSAU.FieldByName('AU_HLOCALIDAD').Text, sdqTrasladosSAU.FieldByName('AU_HNUMERO').Text,
             sdqTrasladosSAU.FieldByName('AU_HPISO').Text, sdqTrasladosSAU.FieldByName('AU_HDEPARTAMENTO').Text,
             sdqTrasladosSAU.FieldByName('AU_HPROVINCIA').Text, '',
             sdqTrasladosSAU.FieldByName('AU_HLAT').AsFloat, sdqTrasladosSAU.FieldByName('AU_HLNG').AsFloat);
    end;
    DeshabilitarFraPrestador('HASTA');
    {Elementos de Contención}
    edElContencion1.Text        := sdqTrasladosSAU.FieldByName('AU_ELCONTENCION').Text;
    cmbElContencion1.FieldValue := sdqTrasladosSAU.FieldByName('AU_ELCONTENCION').Text;
    edElContencion2.Text        := sdqTrasladosSAU.FieldByName('AU_ELCONTENCION2').Text;
    cmbElContencion2.FieldValue := sdqTrasladosSAU.FieldByName('AU_ELCONTENCION2').Text;
    edElContencion3.Text        := sdqTrasladosSAU.FieldByName('AU_ELCONTENCION3').Text;
    cmbElContencion3.FieldValue := sdqTrasladosSAU.FieldByName('AU_ELCONTENCION3').Text;
    {Acompañante y Espera}
    cmbAcompaniante.ItemIndex   := IIF(sdqTrasladosSAU.FieldByName('AU_ACOMPANANTE').Text = 'S', 0, 1);
    cmbEspera.ItemIndex         := IIF(sdqTrasladosSAU.FieldByName('AU_ESPERA').Text = 'S', 0, 1);
    cmbRetorno.ItemIndex        := IIF(sdqTrasladosSAU.FieldByName('AU_RETORNO').Text = 'S', 0, 1);
    {Datos del vuelo}
    edVueloIda.Text             := sdqTrasladosSAU.FieldByName('AU_NROVUELOIDA').AsString;
    edVueloVuelta.Text          := sdqTrasladosSAU.FieldByName('AU_NROVUELOVUELTA').AsString;
    if bEsTrasladoAvion then
      edTarifaVuelo.Value       := sdqTrasladosSAU.FieldByName('AU_IMPOAPRO').AsFloat;
    {Traslados en remis}
    edKilometraje.Value         := sdqTrasladosSAU.FieldByName('AU_KMVIAJE').AsFloat;
    edKMExcedente.Value         := sdqTrasladosSAU.FieldByName('AU_KMEXCEDENTE').AsFloat;
    edKMBase.Value              := sdqTrasladosSAU.FieldByName('AU_KMBASE').AsFloat;

    edKMBase.Visible            := not sdqTrasladosSAU.FieldByName('AU_KMBASE').IsNull;
    lbKMBase.Visible            := edKMBase.Visible;

    chkExtension.Enabled        := False;
    chkExtension.Checked        := not sdqTrasladosSAU.FieldByName('AU_IDAUTORIZACIONORIGEN').IsNull;

    if chkExtension.Checked then
      chkExtension.Caption      := CAPTION_EXTENSION
    else
      chkExtension.Visible      := False;

    {Opciones del viaje en REMIS}
    chkExclusivo.Checked        := sdqTrasladosSAU.FieldByName('AU_VIAJE_EXCLUSIVO').AsString = 'S';
    chkNocturno.Checked         := sdqTrasladosSAU.FieldByName('AU_VIAJE_NOCTURNO').AsString = 'S';
    chkFinDeSemana.Checked      := sdqTrasladosSAU.FieldByName('AU_VIAJE_FINDESEMANA').AsString = 'S';

    VCLExtra.LockControls([fraDireccionDesde], sdqTrasladosSAU.FieldByName('AU_TDESDE').Text <> 'O');
    VCLExtra.LockControls([fraDireccionHasta], sdqTrasladosSAU.FieldByName('AU_THASTA').Text <> 'O');
    if (lstRetornos.Items.Count > 0) and (lstRetornos.Items[0] <> '') then
    begin
      cmbRetorno.ItemIndex := 0;
      cmbEspera.ItemIndex := 0;
    end;

    {$MESSAGE 'Para implementar: TRASLADOS EXCLUSIVOS, NOCTURNOS y FINES DE SEMANA'}

    {------------- Viaje EXCLUSIVO, NOCTURNO y FIN DE SEMANA ------------------}
    sSQL := 'SELECT vp_viaje_exclusivo, vp_viaje_nocturno, vp_viaje_findesemana ' +
              'FROM art.svp_valorprestador ' +
             'WHERE vp_prestador = :prestador ' +
               'AND vp_nomenclador = :nom ' +
               'AND vp_capitulo = :cap ' +
               'AND vp_codigo = :cod ' +
               'AND NVL(:fecha, SYSDATE) BETWEEN vp_vigenciadesde and NVL(vp_vigenciahasta, SYSDATE)';

    with GetQueryEx(sSQL, [IDPrestador,
                           sdqTrasladosSAU.FieldByName('AU_PRES_NOMENCLADOR').AsString,
                           sdqTrasladosSAU.FieldByName('AU_PRES_CAPITULO').AsString,
                           sdqTrasladosSAU.FieldByName('AU_PRES_CODIGO').AsString,
                           TDateTimeEx.Create(sdqTrasladosSAU.FieldByName('AU_FECHASOLI').AsDateTime)]) do
    try
      if not IsEmpty then
      begin
        chkExclusivo.Visible   := not FieldByName('vp_viaje_exclusivo').IsNull;
        chkNocturno.Visible    := not FieldByName('vp_viaje_nocturno').IsNull;
        chkFinDeSemana.Visible := not FieldByName('vp_viaje_findesemana').IsNull;
      end else
      begin
        chkExclusivo.Visible   := False;
        chkNocturno.Visible    := False;
        chkFinDeSemana.Visible := False;
      end;
    finally
      Free;
    end;

    { Opciones del viaje - EXCLUISIVO / NOCTURNO / FIN DE SEMANA }
    chkExclusivo.Checked   := chkExclusivo.Visible and (sdqTrasladosSAU.FieldByName('AU_VIAJE_EXCLUSIVO').AsString = 'S');
    chkNocturno.Checked    := chkNocturno.Visible and (sdqTrasladosSAU.FieldByName('AU_VIAJE_NOCTURNO').AsString = 'S');
    chkFinDeSemana.Checked := chkFinDeSemana.Visible and (sdqTrasladosSAU.FieldByName('AU_VIAJE_FINDESEMANA').AsString = 'S');

    {------------------------- Kilometraje EXCEDENTE --------------------------}
    if AreIn(sEstado, ['P', 'T']) and sdqTrasladosSAU.FieldByName('AU_KMEXCEDENTE').IsNull then
    begin
      sSQL := 'SELECT DISTINCT previa.au_kmexcedente ' +
                'FROM art.sau_autorizaciones previa, art.sau_autorizaciones actual ' +
               'WHERE previa.au_siniestro = actual.au_siniestro ' +
                 'AND previa.au_orden = actual.au_orden ' +
                 'AND previa.au_recaida = actual.au_recaida ' +
                 'AND previa.au_numauto <> actual.au_numauto ' +
                 'AND previa.au_pressol = actual.au_pressol ' +
                 {Domicilio de partida}
                 'AND previa.au_dcalle = actual.au_dcalle ' +
                 'AND previa.au_dlocalidad = actual.au_dlocalidad ' +
                 'AND previa.au_dprovincia = actual.au_dprovincia ' +
                 {Domicilio de destino}
                 'AND previa.au_hcalle = actual.au_hcalle ' +
                 'AND previa.au_hlocalidad = actual.au_hlocalidad ' +
                 'AND previa.au_hprovincia = actual.au_hprovincia ' +

                 'AND previa.au_kmexcedente IS NOT NULL ' +
                 'AND actual.au_id = :id';

      with GetQueryEx(sSQL, [iIdAuto]) do
      try
        if (not IsEmpty) and (RecordCount = 1) and (Fields[0].AsFloat > 0) then
          if MsgAsk(Format('El sistema ha detectado otra autorización de traslado con el mismo ' +
                           'trayecto que tiene autorizados %s km excedentes.', [Fields[0].AsString]) +
                           CRLF + '¿Desea autorizar este kilometraje excedente?') then
            edKMExcedente.Value := Fields[0].AsFloat;  
      finally
        Free;
      end;
    end;
  end;
end;
{-----[Desde]-------------------------------------------------------------------}
procedure TfrmTraslados.edDesdeExit(Sender: TObject);
begin
  cmbDesde.FieldValue := edDesde.Text;
  cmbDesdeCloseUp(Self);
end;
{-----[Desde]-------------------------------------------------------------------}
procedure TfrmTraslados.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  cmbDesde.FieldValue := edDesde.Text;
  cmbDesdeCloseUp(Self);
end;
{-----[Hasta]-------------------------------------------------------------------}
procedure TfrmTraslados.edHasta2Exit(Sender: TObject);
begin
  cmbHasta2.FieldValue := edHasta2.Text;
  cmbHasta2CloseUp(Self);
end;
{-----[Hasta]-------------------------------------------------------------------}
procedure TfrmTraslados.edHasta2KeyPress(Sender: TObject; var Key: Char);
begin
  cmbHasta2.FieldValue := edHasta2.Text;
  cmbHasta2CloseUp(Self);
end;

procedure TfrmTraslados.DeshabilitarControles;
var
  bHabilitar :Boolean;
  sSQL :String;
begin
  bHabilitar := (TipoPrestacion = tpOtra) and (sEstado = 'P');
  btnAceptar.Enabled        := bHabilitar;
  cmbAcompaniante.Enabled   := bHabilitar;
  cmbRetorno.Enabled        := bHabilitar;
  cmbEspera.Enabled         := bHabilitar;

  sSQL := 'SELECT NVL(au_idautorizacionorigen, 0) ' +
           ' FROM sau_autorizaciones ' +
          ' WHERE au_id = :IdAut ';
  bHabilitar := (sEstado = 'P') and (ValorSqlEx(sSQL, [iIdAuto]) = 0) and not(TipoPrestacion = tpOtra);
  btnAgregarTurno.Enabled   := bHabilitar;
  btnEliminarTurno.Enabled  := bHabilitar;
  cmbTurnoFecha.Enabled     := bHabilitar;
  mskTurnoHora.Enabled      := bHabilitar;
  btnAnulacionTurno.Enabled := (sEstado = 'A') or (sEstado = 'C'); //aprobada ó consumida parcialmente
  edDesde.Enabled           := False;
  edHasta.Enabled           := False;
  cmbDesde.Enabled          := False;
  cmbHasta.Enabled          := False;
  cmbElContencion1.Enabled  := False;
  cmbElContencion2.Enabled  := False;
  cmbElContencion3.Enabled  := False;
  edElContencion1.Enabled   := False;
  edElContencion2.Enabled   := False;
  edElContencion3.Enabled   := False;
  cmbSolicitante.Enabled    := False;
  cmbTipoTraslado.Enabled   := False;
  edSolicitante.Enabled     := False;
  edTipoTraslado.Enabled    := False;
  gbVuelo.Enabled           := False;
  pnlTildesViaje.Enabled    := False;

  VCLExtra.LockControls([edKilometraje, edKMExcedente,
                         fraPrestadorDesde, fraPrestadorHasta,
                         fraDireccionDesde, fraDireccionHasta, fraBaseRemiseria], True);
end;

function TfrmTraslados.ValidarFechasRepetidas: Boolean;
var
  sql: String;
begin
  sql   := 'SELECT tr_numauto ' +
            ' FROM sau_autorizaciones, str_traslados ' +
           ' WHERE au_id = tr_idauto ' +
             ' AND tr_siniestro = ' + SqlInt(iSiniestro) +
             ' AND tr_orden = ' + SqlInt(iOrden) +
             ' AND tr_recaida = ' + SqlInt(iRecaida) +
             ' AND tr_fecha = ' + SqlDate(StrToDate(cmbTurnoFecha.Text)) +
             ' AND au_estado NOT IN (''D'',''R'',''U'',''V'',''N'') ' +
             ' AND tr_fechabaja IS NULL ' +
             ' AND tr_fechaanulacion IS NULL ' +
           ' GROUP BY tr_numauto ';
  Result := Not(ExisteSql(sql));
end;

function TfrmTraslados.GetValorRetorno: String;
begin
  if (cmbRetorno.Text = 'No') then
    Result := 'N'
  else
    Result := 'S';
end;
{CAMARILLO - 17/08/2007 - Anula el/los viajes que no se realizaron y actualiza la au_cantapro}
procedure TfrmTraslados.btnAnulacionTurnoClick(Sender: TObject);
var
  i, iCant, iAnulados: Integer;
  sSQL, sFecha, sHora, sWhere: String;
begin
  Verificar(lstTurnos.SelCount < 1, lstTurnos, 'Debe seleccionar al menos un turno.');
  iAnulados := CantTurnosBaja(iIdAuto, lstTurnos.SelCount, sEstado);
  Verificar((iAnulados = 1), lstTurnos, 'No se pueden anular todos los turnos de una autorización.');
  Verificar((iAnulados = 2) or (iAnulados = 3), lstTurnos,
            'No se pueden anular más turnos que los consumidos parcialmente.');
  if MsgBox('¿Confirma la anulación del/los turno/s?',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    iCant   := 0;
    i       := 0;
    sFecha  := '';
    sHora   := '';
    while i <= (lstTurnos.Items.Count - 1) do
    begin
      if lstTurnos.Selected[i] then
      begin
        sFecha := StrLeft(lstTurnos.Items[i], 10);
        sHora  := Copy(lstTurnos.Items[i], 14, 5);
        sWhere := ' WHERE tr_idauto = ' + SqlInt(iIdAuto) +
                    ' AND tr_fecha = to_date(''' + sFecha + ''', ''dd/mm/yyyy'') ' +
                    ' AND tr_hora = ''' + sHora + '''';
        sSQL := 'SELECT 1 FROM str_traslados ' + sWhere + ' AND tr_fechaanulacion IS NOT NULL ';
        if not ExisteSql(sSQL) and (fpAnular.ShowModal = mrOk)  then  //si no está ya dado de baja
        try
          BeginTrans;
          sSQL    := ' UPDATE str_traslados ' +
                        ' SET tr_fechaanulacion = actualdate, ' +
                            ' tr_usuanulacion = ' + SqlValue(Sesion.UserID) + ',' +
                            ' tr_codanulacion = ' + SqlValue(fraMotivoAnulacion.Codigo) + sWhere;
          EjecutarSqlST(sSQL);
          if (fraMotivoAnulacion.sdqDatos.FieldByName('MT_PERMITELIQUIDAR').AsString = 'N') then
          begin
            sSQL    := ' UPDATE sau_autorizaciones ' +
                          ' SET au_cantapro = au_cantapro - 1, ' +
                              ' au_impoapro = art.amebpba.get_val_prestacion(au_identifapro, au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, ' +
                                                                           ' au_siniestro, au_orden, au_recaida, au_fechasoli, au_id, NULL, ' +
                                                                           ' ((NVL(au_kmviaje, 0) + NVL(au_kmbase, 0)) * ' +
                                                                           StringReplace(FloatToStr(PORC_DESVIO_GIS), ',', '.', []) + ') + NVL(au_kmexcedente, 0), ' + SqlValue(GetValorRetorno) +') * (au_cantapro - 1), ' +
                              ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                              ' au_fechamodif = actualdate ' +
                        ' WHERE au_id = ' + SqlInt(iIdAuto);
            EjecutarSqlST(sSQL);
          end;

          CommitTrans;
          Inc(iCant);
        except
          on E:Exception do
          begin
            MsgBox('No se pudo anular el último turno debido al siguiente error:' + #13 + #13 + E.Message, MB_ICONEXCLAMATION);
            if InTransaction then Rollback;
          end;
        end;
      end;
      Inc(i);
    end;
    if (iCant > 0) then CargarTraslados;
  end;
end;

procedure TfrmTraslados.CargarTraslados(bEsPrestacion :Boolean = False);
var
  sSQL :String;
begin
  lstTurnos.Items.Clear;
  lstRetornos.Items.Clear;    // TK 16104
  sdqTrasladosSTR.Close;
  if bEsPrestacion then
    sSQL := ' SELECT tp_fechaturno, tp_horaturno, tp_fechabaja, mt_descripcion ' +
              ' FROM sin.stp_turnosprestaciones, smt_motanultraslados ' +
             ' WHERE tp_idmotivobaja = mt_id(+) ' +
               ' AND tp_idautorizacion = ' + SqlInt(iIdAuto) +
          ' ORDER BY tp_fechaturno '
  else
    sSQL := ' SELECT tr_fecha, tr_hora, tr_fechaanulacion, mt_descripcion, tr_fecharetorno ' +  // TK 16104
              ' FROM str_traslados, smt_motanultraslados ' +
             ' WHERE tr_codanulacion = mt_codigo(+) ' +
               ' AND tr_idauto = ' + SqlInt(iIdAuto) +
               ' AND tr_fechabaja IS NULL ';
  sdqTrasladosSTR.SQL.Text := sSQL;
  sdqTrasladosSTR.Open;
  while not sdqTrasladosSTR.Eof do
  begin
    lstTurnos.Items.Add(sdqTrasladosSTR.Fields[0].Text + ' - ' +
                        sdqTrasladosSTR.Fields[1].Text + ' hs.' +
                        IIF(sdqTrasladosSTR.Fields[2].IsNull, '', ' - ') +
                        sdqTrasladosSTR.Fields[3].Text);
    if not bEsPrestacion then                                  // TK 16104
      lstRetornos.Items.Add(sdqTrasladosSTR.Fields[4].Text);
    sdqTrasladosSTR.Next;
  end;
end;

procedure TfrmTraslados.lstTurnosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  sTexto :String;
  iLong  :Integer;
begin
  sTexto := lstTurnos.Items[Index];
  iLong  := length(sTexto);

  if (iLong > 23) then //si es una baja
    lstTurnos.Canvas.Font.Color   := clRed
  else
    lstTurnos.Canvas.Font.Color   := clDkGray;

  lstTurnos.Canvas.TextRect(Rect, Rect.Left, Rect.Top, sTexto);
end;

procedure TfrmTraslados.lstRetornosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  sTexto :String;
begin
  sTexto := lstRetornos.Items[Index];
  if (length(lstTurnos.Items[Index]) > 23) then
    lstRetornos.Canvas.Font.Color := clRed
  else
    lstRetornos.Canvas.Font.Color := clDkGray;

  lstRetornos.Canvas.TextRect(Rect, Rect.Left, Rect.Top, sTexto);
end;


procedure TfrmTraslados.chkAcompClick(Sender: TObject);
begin
  LockControls([edNombreAcomp, edDNIAcomp], not chkAcomp.Checked);
  if chkAcomp.Checked then
    edNombreAcomp.SetFocus
  else begin
    edNombreAcomp.Clear;
    edDNIAcomp.Clear;
  end;
end;

function TfrmTraslados.ValidarPlataforma10: Boolean;
begin
  Result := not(EsPlataforma10(CodPrestacion, IDPrestador)) or
           (((cmbAcompaniante.Text = 'Sí') and (fpPlataforma10.ShowModal = mrOk)) or
             (cmbAcompaniante.Text <> 'Sí'));
end;

procedure TfrmTraslados.btnAceptarPlatafClick(Sender: TObject);
begin
  Verificar(chkAcomp.Checked and (Trim(edNombreAcomp.Text) = ''), edNombreAcomp,
            'Debe ingresar el nombre y apellido del acompañante.');
  Verificar(chkAcomp.Checked and (Trim(edDNIAcomp.Text) = ''), edDNIAcomp,
            'Debe ingresar el DNI del acompañante.');
  Verificar(chkAcomp.Checked and not(IsDNI(edDNIAcomp.Text)), edDNIAcomp,
            'El DNI no es válido.');
  fpPlataforma10.ModalResult := mrOk;
end;

procedure TfrmTraslados.fpPlataforma10BeforeShow(Sender: TObject);
begin
  if (btnAceptar.Caption = MODO_CARGA) then
  begin
    edNombreAcomp.Clear;
    edDNIAcomp.Clear;
  end
  else begin
    edNombreAcomp.Text  := sdqTrasladosSAU.FieldByName('AU_NOMBREACOMP').AsString;
    edDNIAcomp.Text     := sdqTrasladosSAU.FieldByName('AU_DNIACOMP').AsString;
  end;
end;

procedure TfrmTraslados.chkRetornoClick(Sender: TObject);
begin
  LockControl(dcFechaRetorno, not chkRetorno.Checked);
  if chkRetorno.Checked then
    dcFechaRetorno.SetFocus
  else
    dcFechaRetorno.Clear;
end;

procedure TfrmTraslados.btnAceptarRetornoClick(Sender: TObject);
begin
  Verificar(chkRetorno.Checked and dcFechaRetorno.IsEmpty, dcFechaRetorno,
            'Debe ingresar la fecha de retorno.');
  fpRetorno.ModalResult := mrOk;
end;

procedure TfrmTraslados.fpRetornoBeforeShow(Sender: TObject);
begin
  dcFechaRetorno.Clear;
end;

procedure TfrmTraslados.fpAnularBeforeShow(Sender: TObject);
begin
  fraMotivoAnulacion.Clear;
end;

procedure TfrmTraslados.btnAnuAceptarClick(Sender: TObject);
begin
  Verificar(fraMotivoAnulacion.IsEmpty, fraMotivoAnulacion, 'Debe seleccionar un motivo.');
  if (fraMotivoAnulacion.sdqDatos.FieldByName('MT_ANULAPASADOS').AsString = 'N') then         //T=traslado
    verificar(STRTODATE(midstr(lstTurnos.Items[lstTurnos.ItemIndex], 1, 10)) < date, fraMotivoAnulacion, 'No se puede anular con motivo ''' + fraMotivoAnulacion.Descripcion + ''' un traslado con fecha de turno ya pasada');

  fpAnular.ModalResult := mrOk;
end;

procedure TfrmTraslados.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sSQL :String;
begin
  //si anule la misma cantidad que quedaba, tengo que cambiar el
  //estado de la autorizacion de "Consumida Parcialmente" a "Liquidada"
  if (sEstado = 'C') and (CantTurnosBaja(iIdAuto, lstTurnos.SelCount, sEstado) = 3) then
  begin
    sSQL := 'UPDATE sau_autorizaciones ' +
              ' SET au_estado = ''L'' ' +
            ' WHERE au_id = ' + SqlInt(iIdAuto);
    if InTransaction then
      EjecutarSqlST(sSQL)
    else
      EjecutarSql(sSQL);
    bRefrescar := True;
  end;
end;

procedure TfrmTraslados.GetCantCombiRemis;
var
  i, iCombi, iRemis :Integer;
  TurnoFecha, TurnoHora, FechaHora :String;
begin
  i       := 0;
  iCombi  := 0;
  iRemis  := 0;
  while (i <= lstTurnos.Items.Count - 1) do
  begin
    TurnoFecha := StrLeft(lstTurnos.Items[i], 10);
    TurnoHora  := StrLeft(StrRight(lstTurnos.Items[i], 9), 5);
    FechaHora  := TurnoFecha + ' ' + TurnoHora;
    if ValorSql('SELECT art.siniestro.is_turnodisponible( ' +
                        SqlInt(fraPrestadorHasta.IDPrestador) + ',' +
                        ' TO_DATE(' + SqlValue(FechaHora) + ', ''DD/MM/YYYY HH24:MI''), ' +
                        ' IIF_CHAR('+ SqlString(cmbAcompaniante.Text,True) + ', ''No'', ''N'', ''S'' )) ' +
                 ' FROM dual' ) = 'S' then
      Inc(iCombi)
    else
      Inc(iRemis);
    Inc(i);
  end;
  iCantCombi := iCombi;
  iCantRemis := iRemis;
end;

procedure TfrmTraslados.SetTipoTraslado;
var
  IdTrabajador :Integer;
  bPosibleCombi :Boolean;
begin
  FTipoTraslado := ttNada;
  IdTrabajador  := ValorSqlIntegerEx('SELECT tj_id FROM ctj_trabajador ' +
                                     ' WHERE tj_cuil = :Cuil', [edCuil.Text]);
  SetPrestadorPosible(IdTrabajador);
  bPosibleCombi := ValorSqlEx('SELECT art.siniestro.is_posiblecombi(:IdPres, :IdTrab) ' +
                               ' FROM dual', [fraPrestadorHasta.IDPrestador, IdTrabajador]) = 'S';
  GetCantCombiRemis;
  if bPosibleCombi then
  begin
    if (iCantCombi = lstTurnos.Items.Count) then
    begin
      if MsgAsk('Es posible realizar todos los traslados mediante combi, ¿Confirma la operación?' + #13 +
                '(Si selecciona ''No'', todos los traslados se realizaran mediante remis)') then
        FTipoTraslado := ttCombi
      else begin
        FTipoTraslado := ttRemis;
        iCantRemis    := iCantRemis + iCantCombi;
        iCantCombi    := 0;
      end;
    end
    else if (iCantCombi > 0) then
    begin
        if MsgAsk('Se pueden realizar ' + IntToStr(iCantCombi) + ' traslados en combi y ' + IntToStr(iCantRemis) + ' en remis ' +
                ', ¿Confirma la operación?' + #13 + '(Si selecciona ''No'', todos los traslados se realizaran mediante remis)') then
        FTipoTraslado := ttMixto
      else begin
        FTipoTraslado := ttRemis;
        iCantRemis    := iCantRemis + iCantCombi;
        iCantCombi    := 0;
      end;
    end
    else if (TipoPrestacion = tpTraslado) or MsgAsk('Atención: ningún traslado se puede realizar mediante combi, ' + #13 +
                                                    '¿Desea realizar todos los traslados mediante remis?') then
      FTipoTraslado := ttRemis;
  end
  else begin
    FTipoTraslado := ttRemis;
    iCantRemis    := iCantRemis + iCantCombi;
    iCantCombi    := 0;
  end;
end;

function TfrmTraslados.DoInsertarAutorizacion(bEsRemis :Boolean) :Integer;
begin
  Result := InsertarAutorizacion(iIdExpediente, iSiniestro, iOrden, iRecaida, iIdAuto, IDPrestador, 0,
                                 fraPrestadorDesde.IDPrestador, fraPrestadorHasta.IDPrestador, '',
                                 '', '', 0, iCantCombi, iCantRemis, 0, edTipoTraslado.Text, edSolicitante.Text,
                                 cmbDesde.FieldValue, cmbHasta.FieldValue, fraDireccionDesde.Calle,
                                 fraDireccionDesde.Numero, fraDireccionDesde.Piso,
                                 fraDireccionDesde.Departamento, fraDireccionDesde.CodigoPostal,
                                 fraDireccionDesde.Localidad, IntToStr(fraDireccionDesde.Prov),
                                 fraDireccionHasta.Calle, fraDireccionHasta.Numero,
                                 fraDireccionHasta.Piso, fraDireccionHasta.Departamento,
                                 fraDireccionHasta.CodigoPostal, fraDireccionHasta.Localidad,
                                 IntToStr(fraDireccionHasta.Prov), bEsRemis, IIF(cmbAcompaniante.Text = 'Sí', True, False),
                                 IIF(cmbEspera.Text = 'Sí', True, False), IIF(cmbRetorno.Text = 'Sí', True, False),
                                 False, False);
end;

function TfrmTraslados.DoExtenderAutorizacion(bEsRemis :Boolean) :Integer;
begin
  Result := InsertarAutorizacion(iIdExpediente, iSiniestro, iOrden, iRecaida, iIdAuto, IDPrestador, IDPrestador,
                                 fraPrestadorHasta.IDPrestador, fraPrestadorHasta2.IDPrestador, CodPrestacion,
                                 '', '', 0, CalcularCantidad, CalcularCantidad, 0, edTipoTraslado.Text, edSolicitante.Text,
                                 cmbHasta.FieldValue, cmbHasta2.FieldValue,

                                 fraDireccionHasta.Calle, fraDireccionHasta.Numero,
                                 fraDireccionHasta.Piso, fraDireccionHasta.Departamento,
                                 fraDireccionHasta.CodigoPostal, fraDireccionHasta.Localidad,
                                 IntToStr(fraDireccionHasta.Prov),

                                 fraDireccionHasta2.Calle, fraDireccionHasta2.Numero,
                                 fraDireccionHasta2.Piso, fraDireccionHasta2.Departamento,
                                 fraDireccionHasta2.CodigoPostal, fraDireccionHasta2.Localidad,
                                 IntToStr(fraDireccionHasta2.Prov),

                                 bEsRemis, IIF(cmbAcompaniante.Text = 'Sí', True, False),
                                 IIF(cmbEspera.Text = 'Sí', True, False), IIF(cmbRetorno.Text = 'Sí', True, False),
                                 False, True);
end;

procedure TfrmTraslados.DoInsertarTraslados(bEsRemis :Boolean; iNumAuto :Integer);
var
  TurnoFecha, TurnoHora, FechaHora :String;
  i, iIdTraslado, iIdPrestacion, iIdCalendario :Integer;
  bDisponible :Boolean;
begin
  i := 0;
  while (i <= lstTurnos.Items.Count - 1) do
  begin
    TurnoFecha  := StrLeft(lstTurnos.Items[i], 10);
    TurnoHora   := StrLeft(StrRight(lstTurnos.Items[i], 9), 5);
    FechaHora   := TurnoFecha + ' ' + TurnoHora;
    bDisponible := ValorSql('SELECT art.siniestro.is_turnodisponible( ' +
                                    SqlInt(fraPrestadorHasta.IDPrestador) + ',' +
                                  ' TO_DATE(' + SqlValue(FechaHora) + ', ''DD/MM/YYYY HH24:MI''), ' +
                                  ' IIF_CHAR('+ SqlString(cmbAcompaniante.Text,True) + ', ''No'', ''N'', ''S'' )) ' +
                             ' FROM dual' ) = 'S';

    if ((FTipoTraslado = ttRemis) and bEsRemis) or
       ((FTipoTraslado = ttMixto) and bEsRemis and not(bDisponible)) or
       ((FTipoTraslado = ttMixto) and not(bEsRemis) and bDisponible) or
       ((FTipoTraslado = ttCombi) and not(bEsRemis)) then
    begin
      iIdTraslado := InsertarTraslado(iSiniestro, iOrden, iRecaida, iNumAuto,
                                      StrToDateTime(FechaHora), False);
      //cuando es combi y el turno está disponible, reservo el lugar
      if not(bEsRemis) and (((FTipoTraslado = ttMixto) and bDisponible) or
                           (FTipoTraslado = ttCombi)) then
      begin
        iIdPrestacion := ValorSqlInteger('SELECT tp_id FROM sin.stp_turnosprestaciones ' +
                                         ' WHERE tp_idautorizacion = ' + SqlInt(iIdAuto) +
                                           ' AND tp_fechaturno = TO_DATE(''' + TurnoFecha + ''', ''DD/MM/YYYY'') ' +
                                           ' AND tp_horaturno = ' +  SqlString(TurnoHora, True));
        iIdCalendario := ValorSqlInteger('SELECT art.siniestro.get_turnodisponible( ' +
                                                 SqlInt(fraPrestadorHasta.IDPrestador) + ',' +
                                               ' TO_DATE(' + SqlValue(FechaHora) + ', ''DD/MM/YYYY HH24:MI'')) ' +
                                          ' FROM dual ');
        AgendarViaje(iIdPrestacion, iIdTraslado, iIdCalendario, Sesion.UserID, False);
        DoAnularTrasladoRemis(TurnoFecha, TurnoHora);
        if (cmbAcompaniante.Text = 'Sí') then
        begin
          iIdCalendario := ValorSqlInteger('SELECT art.siniestro.get_turnodisponible( ' +
                                                   SqlInt(fraPrestadorHasta.IDPrestador) + ',' +
                                                 ' TO_DATE(' + SqlValue(FechaHora) + ', ''DD/MM/YYYY HH24:MI'')) ' +
                                            ' FROM dual ');
          AgendarViaje(iIdPrestacion, iIdTraslado, iIdCalendario, Sesion.UserID, False);
        end;
      end;
    end;
    Inc(i);
  end;
end;

procedure TfrmTraslados.DoInsertarAutTraslados;
var
  iNumAuto :Integer;
begin
  if (FTipoTraslado <> ttNada) then
  try
    if ((FTipoTraslado = ttRemis) or (FTipoTraslado = ttMixto)) and not(TipoPrestacion = tpTraslado) then
    begin
      iNumAuto := DoInsertarAutorizacion(True);
      DoInsertarTraslados(True, iNumAuto);
    end;
    if (FTipoTraslado = ttCombi) or (FTipoTraslado = ttMixto) then
    begin
      iNumAuto := DoInsertarAutorizacion(False);
      DoInsertarTraslados(False, iNumAuto);
    end;

    {cierra el formulario:}
    if btnAceptar.caption = MODO_APROBACION then
      ModalResult := mrOk
    else
      Close;
  except
    on E:Exception do
    begin
      MsgBox('Ha ocurrido el siguiente error al Guardar los datos:' + #13 + E.Message, MB_ICONEXCLAMATION);
      Rollback(True);
    end;
  end;
end;

procedure TfrmTraslados.SetPrestadorPosible(IdTrabajador :Integer);
var
  IdPresPosible :Integer;
  sSQL, sPres :String;
begin
  sSQL  := 'SELECT ca_permitetransporte ' +
            ' FROM cpr_prestador ' +
           ' WHERE ca_identificador = :IdPres ';

  sPres := 'SELECT ca_descripcion ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = :IdPres ';

  if (sEstado  = 'P') and
     (ValorSqlEx(sSQL, [fraPrestadorHasta.IDPrestador]) = 'S') then
  begin
    IdPresPosible := ValorSqlIntegerEx('SELECT art.siniestro.get_prestadorposible(:IdTrab) ' +
                                        ' FROM dual', [IdTrabajador]);
    if (IdPresPosible > 0) and (IdPresPosible <> fraPrestadorHasta.IDPrestador) and
       MsgAsk('Según la dirección del paciente, el prestador que corresponde es ' + #13 +
              ValorSqlEx(sPres, [IdPresPosible]) + ', ¿Desea cambiarlo?') then
    begin
      if (TipoPrestacion = tpOtra) then
        IDPrestador := IdPresPosible;
      fraPrestadorHasta.Cargar(IdPresPosible);
      OnPrestadorChangeHasta(Self);
    end;
  end;
end;

procedure TfrmTraslados.DoAnularTrasladoRemis(sFecha, sHora :String);
var
  sSQL, sWhere :String;
begin
  sWhere := ' WHERE tr_idauto = ' + SqlInt(iIdAuto) +
              ' AND tr_fecha = TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'') ' +
              ' AND tr_hora = ' +  SqlString(sHora, True);
  sSQL := 'SELECT 1 FROM str_traslados ' + sWhere + ' AND tr_fechaanulacion IS NOT NULL ';
  if not ExisteSql(sSQL) then  //si no está ya dado de baja
  begin
    sSQL    := ' UPDATE str_traslados ' +
                  ' SET tr_fechaanulacion = actualdate, ' +
                      ' tr_usuanulacion = ' + SqlValue(Sesion.UserID) + ',' +
                      ' tr_codanulacion = ''12'' ' + sWhere;
    EjecutarSqlST(sSQL);
    sSQL    := ' UPDATE sau_autorizaciones ' +
                  ' SET au_cantapro = au_cantapro - 1, ' +
                      ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                      ' au_fechamodif = actualdate ' +
                ' WHERE au_id = ' + SqlInt(iIdAuto);
    EjecutarSqlST(sSQL);
  end;
end;

function TfrmTraslados.ValidarFechaHoraOtras :Boolean;
var
  iNum :Integer;
begin
  if chkExtension.Checked and (chkExtension.Caption = CAPTION_EXTENSION) then
    Result := True
  else begin
    iNum :=  ValorSqlIntegerEx('SELECT art.siniestro.get_trasladorepetido(:IdAut, :IdExped, ''S'') ' +
                                ' FROM dual', [iIdAuto, iIdExpediente]);
    Verificar((iNum > 0), lstTurnos, 'La autorización Nro. ' + IntToStr(iNum) + ' posee al menos un turno con la misma fecha-hora.');
    Result := True;
  end;
end;

function TfrmTraslados.ValidarFechaOtras :Boolean;
var
  iNum :Integer;
begin
  iNum :=  ValorSqlIntegerEx('SELECT art.siniestro.get_trasladorepetido(:IdAut, :IdExped, ''N'') ' +
                             ' FROM dual', [iIdAuto, iIdExpediente]);
  if (iNum > 0) and not(MsgAsk('La autorización Nro. ' + IntToStr(iNum) + ' posee al menos un ' +
                               ' turno con la misma fecha,' + #13 + '¿Desea continuar?')) then
    Result := False
  else
    Result := True;
end;

procedure TfrmTraslados.BuscarDomicilios(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  if fraDireccionDesde.IsSelected then
  begin
    ImagenGIF.Visible := True;
    ImagenGIF.Animate := True;
    btnCancelar.Enabled := False;
    try
      //fraGISMapa.ShowProgress := False;
      CalcularDistanciaGIS(True);
    finally
      ImagenGIF.Visible := False;
      btnCancelar.Enabled := True;          
    end;
  end;
  pnlBottom.Caption := ' Para cerrar el mapa presione el pinche en la esquina superior derecha de la pantalla y retire el mouse';
end;

procedure TfrmTraslados.AdvToolPanelTabLateralTabSlideInDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  pnlBottom.Caption := '';
end;

procedure TfrmTraslados.OnDireccionDesdeChange(Sender: TObject);
begin
  fraGISMapa.ClearResults;
  AdvToolPanelTabLateral.Visible := fraDireccionDesde.IsSelected or Seguridad.Claves.IsActive('ManejoCompletoGIS');
end;

procedure TfrmTraslados.OnDireccionHastaChange(Sender: TObject);
begin
  fraGISMapa.ClearResults;
end;

procedure TfrmTraslados.CalcularDistanciaGIS(ASaving: Boolean = False);
begin
  fraDireccionDesde.GeoCodificar(ASaving, cmbDesde.FieldValue);
  fraDireccionHasta.GeoCodificar(ASaving, cmbHasta.FieldValue);
  fraDireccionHasta2.GeoCodificar(ASaving, cmbHasta2.FieldValue);

  if fraDireccionDesde.GeoCodificado and fraDireccionHasta.GeoCodificado then
  begin
    if fraBaseRemiseria.IsSelected then
      fraGISMapa.TraceRoute(fraDomicilioBaseRemis.Address, fraDireccionHasta.Address, GetWayPointList(fraDireccionDesde.Address))
    else
      fraGISMapa.TraceRoute(fraDireccionDesde.Address, fraDireccionHasta.Address, nil);
  end;

  Application.ProcessMessages;
  while fraGISMapa.Processing do
  begin
    Sleep(50);
    Application.ProcessMessages;
  end;
end;

procedure TfrmTraslados.btnTrabajadorClick(Sender: TObject);
begin
  with TfrmContratoTrabajador.Create(Self) do
  try
    CargarDatosTrabajador(iIdTrabajador,
                          ValorSQLIntegerEx('SELECT rl_id ' +
                                             ' FROM crl_relacionlaboral ' +
                                            ' WHERE rl_contrato = :CONTRATO ' +
                                              ' AND rl_idtrabajador = :IDTRABAJADOR',
                                                   [iContrato, iIdTrabajador]));
    ShowModal;
  finally
    Free;
  end;

  if cmbDesde.FieldValue = 'T' then  {Por Trabajador}
      DomicilioPorTrabajador('DESDE');
  if cmbHasta.FieldValue = 'T' then  {Por Trabajador}
      DomicilioPorTrabajador('HASTA');
  if cmbHasta2.FieldValue = 'T' then {Por Trabajador}
      DomicilioPorTrabajador('HASTA2');
end;

function TfrmTraslados.CalcularCantidad :Integer;
var
  iCan :Integer;
begin
  iCan := lstTurnos.Items.Count;
  if bAcompRetorno then               //si es traslado en omnibus se tienen en cuenta el
  begin                              //acompañante y el retorno para la cantidad de pasajes
    iCan := iCan * (IIF(cmbAcompaniante.ItemIndex = 0, 2, 1)) *
                   (IIF(cmbRetorno.ItemIndex = 0, 2, 1));
  end;

  Result := iCan;
end;

procedure TfrmTraslados.cmbHasta2CloseUp(Sender: TObject);
begin
  edHasta2.Text := cmbHasta2.FieldValue;
  if((cmbDesde.FieldValue = cmbHasta2.FieldValue) or (cmbHasta.FieldValue = cmbHasta2.FieldValue)) and
     (cmbHasta2.FieldValue <> 'O') and (cmbHasta2.FieldValue <> '') and
     (cmbHasta2.FieldValue <> 'P') then
  begin
    MsgBox('La extensión del viaje no puede ser para volver a elegir alguno de los puntos anteriores.', MB_ICONEXCLAMATION);
    cmbHasta2.FieldValue := '';
    edHasta2.Text := '';
    cmbHasta2.SetFocus;
  end
  else
  begin
    if cmbHasta2.FieldValue = 'E' then       {Por Empresa}
      DomicilioPorEmpresa('HASTA2')
    else if cmbHasta2.FieldValue = 'T' then  {Por Trabajador}
      DomicilioPorTrabajador('HASTA2')
    else if cmbHasta2.FieldValue = 'P' then  {Por Prestador}
      DomicilioPorPrestador('HASTA2')
    else if cmbHasta2.FieldValue = 'O' then  {Otro}
    begin
      sdqDomicilios.Close;
      sdqDomicilios.SQL.Text := '';
      VCLExtra.LockControls([fraDireccionHasta2], False);
      fraDireccionHasta2.Clear;
      fraDireccionHasta2.SetFocus;
      DeshabilitarFraPrestador('HASTA2');
    end;

    if cmbHasta2.FieldValue <> 'P' then
      fraPrestadorHasta2.Clear;
  end;
end;

procedure TfrmTraslados.OnDireccionHastaChange2(Sender: TObject);
begin
  fraGISMapa.ClearResults;
end;

procedure TfrmTraslados.OnPrestadorChangeHasta2(Sender: TObject);
begin
  fraDireccionHasta2.IdPrestador := fraPrestadorHasta2.IDPrestador;
end;

procedure TfrmTraslados.btnAceptarExtensionClick(Sender: TObject);
begin
  Verificar(fraDireccionHasta2.IsEmpty, fraDireccionHasta2, 'Debe seleccionar una dirección.');
  Verificar(not fraDireccionHasta2.IsValid, fraDireccionHasta2, 'La dirección seleccionada no es válida.');
  Verificar((Trim(cmbHasta.Text) = 'PRESTADOR') and (Trim(cmbHasta2.Text) = 'PRESTADOR') and
            (fraPrestadorHasta.IDPrestador = fraPrestadorHasta2.IDPrestador), fraPrestadorHasta2,
            'El prestador final no puede ser el mismo que del punto intermedio.');

  fpExtension.ModalResult := mrOK;
end;

procedure TfrmTraslados.edHastaExit(Sender: TObject);
begin
  cmbHasta.FieldValue := edHasta.Text;
  cmbHastaCloseUp(Self);
end;

procedure TfrmTraslados.edHastaKeyPress(Sender: TObject; var Key: Char);
begin
  cmbHasta.FieldValue := edHasta.Text;
  cmbHastaCloseUp(Self);
end;

procedure TfrmTraslados.cmbEsperaChange(Sender: TObject);
begin
  DoChequearRetorno; // TK 6615
end;

procedure TfrmTraslados.cmbRetornoChange(Sender: TObject);
begin
  DoChequearEspera; // TK 6615
end;

procedure TfrmTraslados.DoChequearEspera;    // TK 6615
begin
  if (cmbRetorno.ItemIndex = 0) then // "Si" en Retorno
    cmbEspera.ItemIndex := 0
  else
    cmbEspera.ItemIndex := 1;
end;

procedure TfrmTraslados.DoChequearRetorno;   // TK 6615
begin
  if (cmbEspera.ItemIndex = 0) then // "Si" en Espera
    cmbRetorno.ItemIndex := 0
  else
    cmbRetorno.ItemIndex := 1;
end;



procedure TfrmTraslados.SetPrestador(const Value: TTableID);
begin
  FPrestador := Value;
  fraBaseRemiseria.Propiedades.ExtraCondition := ' AND br_idprestador = ' + SQLValue(IDPrestador) + ' ';
  fraBaseRemiseria.Visible := fraBaseRemiseria.TieneDatosSeleccionables;
  pnlBaseRemiseria.Visible := fraBaseRemiseria.Visible;
  btnMapaBaseRemiseria.Visible := fraBaseRemiseria.Visible;
end;

procedure TfrmTraslados.btnMapaBaseRemiseriaClick(Sender: TObject);
begin
  pnlGISBaseRemiseria.ShowModal;
end;

procedure TfrmTraslados.btnSICClick(Sender: TObject);
begin
  DoMostrarEventosAgendaExpediente(iIdExpediente);
end;

procedure TfrmTraslados.fraBaseRemiseriaPropiedadesChange(Sender: TObject);
begin
  if fraBaseRemiseria.IsEmpty then
    fraDomicilioBaseRemis.Clear
  else
    with fraBaseRemiseria.sdqDatos do
      fraDomicilioBaseRemis.Cargar(FieldByName('br_calle').AsString,
                                   FieldByName('br_cpostal').AsString,
                                   FieldByName('br_localidad').AsString,
                                   FieldByName('br_numero').AsString,
                                   FieldByName('br_piso').AsString,
                                   FieldByName('br_departamento').AsString,
                                   FieldByName('br_provincia').AsString,
                                   '', //FieldByName('br_cpostala').AsString,
                                   FieldByName('br_lat').AsFloat,
                                   FieldByName('br_lng').AsFloat);

  btnMapaBaseRemiseria.Enabled := fraDomicilioBaseRemis.IsSelected;
  btnMapaBaseRemiseria.Visible := fraBaseRemiseria.Visible;
end;

procedure TfrmTraslados.lbKilometrajeClick(Sender: TObject);
begin
  InfoHint(edKilometraje, edKilometraje.Hint);
end;

procedure TfrmTraslados.lbKMExcedenteClick(Sender: TObject);
begin
  InfoHint(edKMExcedente, edKMExcedente.Hint);
end;

procedure TfrmTraslados.lbKMBaseClick(Sender: TObject);
begin
  InfoHint(edKMBase, edKMBase.Hint);
end;

procedure TfrmTraslados.btnViajeCompartidoClick(Sender: TObject);
begin
  // sdqTrasladosSAU.FieldByName('VC_URL').AsString Falta implementar...
  InfoHint(btnViajeCompartido, 'Esta funcionalidad aún no esta disponible.');
end;

function TfrmTraslados.EsTrasladoRemis: Boolean;
begin
  Result := AreIn(FPrestacionAprobada, ['449100', '449103']);
end;

function TfrmTraslados.EsTrasladoRemisMuyExtenso: Boolean;
begin
  Result := EsTrasladoRemis and btnAceptar.Enabled and ((Max(fraGISMapa.GISInfo.TotalDistance, edKilometraje.Value + edKMBase.Value) + edKMExcedente.Value) >= KM_TOPE_MESA_TRASLADOS);
end;

procedure TfrmTraslados.FormShow(Sender: TObject);
begin
  if EsTrasladoRemisMuyExtenso and (not Seguridad.Claves.IsActive('MesaDeTraslados')) then
    InfoHint(btnAceptar, 'Tenga en cuenta que si el traslado supera los ' + IntToStr(KM_TOPE_MESA_TRASLADOS) + 'km deberá ser aprobado por la Mesa de Traslados.');
end;

end.
