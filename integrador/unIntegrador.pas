unit unIntegrador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu,
  Placemnt, StdCtrls, JvgGroupBox, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresaHolding,
  unFraCodigoDescripcion, unFraCodDesc, unfraInfoEmpresa, unFraDomicilio, unFraDomicilioExtendido, ExtCtrls, ToolPanels,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, DB, SDEngine, AdvEdit, DBAdvEd, DBCtrls, unFraABMFrame, unFraABM_ACT_CONTACTO,
  JvExExtCtrls, JvShape, unfraInfoEmpresaExt, artSeguridad, PeriodoPicker, AdvGlowButton, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, AdvAppStyler, AdvMemo, DBAdvMemo, FormPanel, JvComponent, JvCaptionPanel, JvExControls, JvgButton,
  JvNetscapeSplitter, ShortCutControl, AdvToolBar, AdvToolBarStylers, Menus, unFraEmpresa, AdvMenus, AdvMenuStylers,
  Mask, ComCtrls, ToolWin, QueryPrint, QueryToFile, ExportDialog,
  AdvOfficeButtons, RxPlacemnt, DBAdvOfficeButtons;
                                 
type
  TfrmIntegrador = class(TfrmCustomForm)
    gbAfiliaciones: TJvgGroupBox;
    fraEmpresaCRM: TfraEmpresaHolding;
    Label1: TLabel;
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    lblEstado: TLabel;
    edEstado: TDBText;
    txtGRUPO: TDBText;
    lblSector: TLabel;
    txtSECTOR: TDBText;
    gbVigencia: TJvgGroupBox;
    txtCO_VIGENCIADESDE: TDBText;
    lblDesde: TLabel;
    txtCO_VIGENCIAHASTA: TDBText;
    lblHasta: TLabel;
    fraInfoEmpresa: TfraInfoEmpresaExt;
    gbCobranzas: TJvgGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    sdqCobranzas: TSDQuery;
    dsCobranzas: TDataSource;
    dsCobranzasUltimoPeriodo: TDataSource;
    sdqCobranzasUltimoPeriodo: TSDQuery;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label26: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    Label27: TLabel;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    gbTarifa: TJvgGroupBox;
    DBText18: TDBText;
    Label30: TLabel;
    DBText19: TDBText;
    Label31: TLabel;
    lblPreventor: TLabel;
    txtPREVENTOR: TDBText;
    lblActividad: TLabel;
    dbtxtACTIVIDAD_DESCRIPCION: TDBText;
    DBText16: TDBText;
    Label28: TLabel;
    sdqEstablecimientos: TSDQuery;
    dsEstablecimientos: TDataSource;
    sdqEstablecimientosES_ID: TFloatField;
    sdqEstablecimientosES_NROESTABLECI: TFloatField;
    sdqEstablecimientosES_NOMBRE: TStringField;
    sdqEstablecimientosES_CALLE: TStringField;
    sdqEstablecimientosES_CPOSTAL: TStringField;
    sdqEstablecimientosES_LOCALIDAD: TStringField;
    sdqEstablecimientosES_PROVINCIA: TStringField;
    sdqEstablecimientosDOMICILIO: TStringField;
    sdqEstablecimientosES_NUMERO: TStringField;
    sdqEstablecimientosES_PISO: TStringField;
    sdqEstablecimientosES_DEPARTAMENTO: TStringField;
    sdqEstablecimientosES_CPOSTALA: TStringField;
    sdqEstablecimientosES_CODAREATELEFONOS: TStringField;
    sdqEstablecimientosES_TELEFONOS: TStringField;
    sdqEstablecimientosES_CODAREAFAX: TStringField;
    sdqEstablecimientosES_FAX: TStringField;
    sdqEstablecimientosES_EMPLEADOS: TFloatField;
    sdqEstablecimientosES_MASA: TFloatField;
    sdqEstablecimientosES_IDACTIVIDAD: TFloatField;
    sdqEstablecimientosAC_DESCRIPCION: TStringField;
    sdqEstablecimientosES_NIVEL: TStringField;
    sdqEstablecimientosES_FEINICACTIV: TDateTimeField;
    sdqEstablecimientosES_FECHAINICEST: TDateTimeField;
    sdqEstablecimientosES_OBSERVACIONES: TStringField;
    sdqEstablecimientosES_EVENTUAL: TStringField;
    sdqEstablecimientosES_FECHABAJA: TDateTimeField;
    sdqEstablecimientosES_USUBAJA: TStringField;
    sdqEstablecimientosES_DOMICILIO: TStringField;
    sdqEstablecimientosPV_DESCRIPCION: TStringField;
    sdqEstablecimientosES_FECHARECEPCIONBAJA: TDateTimeField;
    sdqEstablecimientosES_CONTRATO: TFloatField;
    sdqEstablecimientosEM_CUIT: TStringField;
    sdqEstablecimientosEM_NOMBRE: TStringField;
    sdqEndosos: TSDQuery;
    dsEndosos: TDataSource;
    sdqEndososHC_VIGENCIADESDE: TDateTimeField;
    sdqEndososHC_VIGENCIAHASTA: TDateTimeField;
    sdqEndososEN_ENDOSO: TFloatField;
    sdqEndososEN_MOVIMIENTO: TFloatField;
    sdqEndososEN_VIGENCIAENDOSO: TDateTimeField;
    sdqEndososEN_USUALTA: TStringField;
    sdqEndososEN_FECHAALTA: TDateTimeField;
    sdqEndososHC_ESTADO: TStringField;
    sdqEndososHC_FECHAAFILIACION: TDateTimeField;
    sdqEndososHC_FECHABAJA: TDateTimeField;
    sdqEndososMOTIVO_ENDOSO: TStringField;
    sdqEndososESTADO_ENDOSO: TStringField;
    sdqEndososTIPOENDOSO: TStringField;
    sdqEndososOBSERVACIONSRT: TStringField;
    sdqEndososRECHAZOSRT: TStringField;
    sdqEndososACTIVIDAD: TStringField;
    sdqEndososHT_ALICUOTAPESOS: TFloatField;
    sdqEndososHT_PORCMASA: TFloatField;
    AdvFormStyler: TAdvFormStyler;
    AdvAppStyler: TAdvAppStyler;
    lbDDJJSinPresentar: TLabel;
    Seguridad: TSeguridad;
    sdqSiniestros: TSDQuery;
    dsSiniestros: TDataSource;
    sdqConsultaCO_IDACTIVIDAD: TStringField;
    sdqConsultaCO_IDACTIVIDAD2: TStringField;
    sdqConsultaCO_IDACTIVIDAD3: TStringField;
    sdqConsultaACTIVIDAD_DESCRIPCION: TStringField;
    sdqConsultaACTIVIDAD: TStringField;
    sdqConsultaACTIVIDAD2: TStringField;
    sdqConsultaACTIVIDAD3: TStringField;
    sdqConsultaGRUPO: TStringField;
    sdqConsultaCO_VIGENCIADESDE: TDateTimeField;
    sdqConsultaCO_VIGENCIAHASTA: TDateTimeField;
    sdqConsultaESTADO: TStringField;
    sdqConsultaSECTOR: TStringField;
    sdqConsultaPREVENTOR: TStringField;
    sdqConsultaSUMAFIJA: TFloatField;
    sdqConsultaPORCMASA: TFloatField;
    sdqConsultaTC_VIGENCIATARIFA: TDateTimeField;
    fpSiniestros: TFormPanel;
    fpCheques: TFormPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edTOTAL: TDBAdvEdit;
    edACTIVOS: TDBAdvEdit;
    edILT_PENDIENTE: TDBAdvEdit;
    edILT_PAGADA: TDBAdvEdit;
    edINCAPACIDADES: TDBAdvEdit;
    edMORTALES: TDBAdvEdit;
    dsCheques: TDataSource;
    sdqCheques: TSDQuery;
    GridCheques: TArtDBGrid;
    ImageList: TImageList;
    Timer: TTimer;
    sdqDetalleCheques: TSDQuery;
    dsDetalleCheques: TDataSource;
    GridDetalleCheques: TArtDBGrid;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    sdqDetalleChequesMotivo: TStringField;
    sdqDetalleChequesMonto: TCurrencyField;
    Scroll: TScrollBox;
    AdvToolPanelTab: TAdvToolPanelTab;
    AdvToolPanelActividades: TAdvToolPanel;
    AdvToolPanelDomicilios: TAdvToolPanel;
    AdvToolPanelEndosos: TAdvToolPanel;
    GridEndosos: TArtDBGrid;
    AdvToolPanelEstablecimientos: TAdvToolPanel;
    GridEstablecimientos: TArtDBGrid;
    AdvToolPanelContactos: TAdvToolPanel;
    pnlActividades: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    edCO_IDACTIVIDAD: TDBAdvEdit;
    edACTIVIDAD: TDBAdvEdit;
    edACTIVIDAD2: TDBAdvEdit;
    edCO_IDACTIVIDAD2: TDBAdvEdit;
    edACTIVIDAD3: TDBAdvEdit;
    edCO_IDACTIVIDAD3: TDBAdvEdit;
    pnlDomicilioTelefono: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    fraDomicilioExtendidoPOSTAL: TfraDomicilioExtendido;
    fraDomicilioExtendidoLEGAL: TfraDomicilioExtendido;
    ShortCutControl: TShortCutControl;
    AdvToolBar: TAdvToolBar;
    btnCertificadosDeCobertura: TAdvGlowButton;
    btnEstadoDeCuenta: TAdvGlowMenuButton;
    btnCartaAlicuota: TAdvGlowButton;
    btnLimpiar: TAdvGlowButton;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    btnCheques: TAdvGlowButton;
    btnSiniestros: TAdvGlowButton;
    JvShape2: TJvShape;
    btnSemaforo: TJvgButton;
    Label29: TLabel;
    pmnuImprimirEstadoCuenta: TAdvPopupMenu;
    mnuImprEstadoCuenta: TMenuItem;
    mnuImprF817: TMenuItem;
    mnuImprF801C: TMenuItem;
    Label2: TLabel;
    Label34: TLabel;
    AdvMenuOfficeStyler: TAdvMenuOfficeStyler;
    btnCerrarSiniestros: TAdvGlowButton;
    pnlBottom: TPanel;
    btnCerrarCheques: TAdvGlowButton;
    edTEL_POSTAL: TDBEdit;
    Label35: TLabel;
    sdqConsultaTEL_LEGAL: TStringField;
    sdqConsultaFAX_LEGAL: TStringField;
    sdqConsultaTEL_POSTAL: TStringField;
    sdqConsultaFAX_POSTAL: TStringField;
    edFAX_POSTAL: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    edTEL_LEGAL: TDBEdit;
    Label38: TLabel;
    edFAX_LEGAL: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    DBAdvMemo1: TDBMemo;
    ToolBar1: TToolBar;
    tbImprimirEndosos: TToolButton;
    tbExportarEndosos: TToolButton;
    ExportDialogEndosos: TExportDialog;
    QueryPrintEndosos: TQueryPrint;
    PrintDialogEndosos: TPrintDialog;
    PrintDialogEstablecimientos: TPrintDialog;
    QueryPrintEstablecimientos: TQueryPrint;
    ExportDialogEstablecimientos: TExportDialog;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    tbImprimirEstablecimientos: TToolButton;
    tbExportarEstablecimientos: TToolButton;
    Panel5: TPanel;
    DBMemo2: TDBMemo;
    DBMemo1: TDBMemo;
    sdqConsultaMOTIVO_BAJA: TStringField;
    sdqConsultaCO_FECHABAJA: TDateTimeField;
    Panel1: TPanel;
    pnlCorreo: TPanel;
    Label11: TLabel;
    edCorreoElectronico: TEdit;
    tbCorreo: TToolBar;
    tbGuardar: TToolButton;
    tbEditar: TToolButton;
    sdqConsultaCO_DIRELECTRONICA: TStringField;
    chkSinCorreoElectronicoCorporativo: TCheckBox;
    Label12: TLabel;
    edILP_PAGADA: TDBAdvEdit;
    Label13: TLabel;
    edPRESTACION_PAGADA: TDBAdvEdit;
    mnuImprF801CTotal: TMenuItem;
    mnuImprF801CPorPeriodo: TMenuItem;
    lblPoseeSolicitudTraspaso: TLabel;
    sdqEndososHT_USUARIOAUTORIZA: TStringField;
    dbtxtACTIVIDAD2: TDBText;
    dbtxtACTIVIDAD3: TDBText;
    btnImprimirRenovacion: TAdvGlowMenuButton;
    pmnuImprimirRenovacion: TAdvPopupMenu;
    mnuImprimirRenovacion: TMenuItem;
    mnuMailRenovacion: TMenuItem;
    sdqConsultaCO_ADDENDA: TStringField;
    sdqConsultaCO_ADDENDA_DDJJ: TStringField;
    sdqConsultaCO_PAGODIRECTO: TStringField;
    checkPagoDirecto: TDBAdvOfficeCheckBox;
    cbCO_ADDENDA: TDBAdvOfficeCheckBox;
    cbCO_ADDENDA_DDJJ: TDBAdvOfficeCheckBox;
    DBAdvOfficeCheckBox1: TDBAdvOfficeCheckBox;
    sdqConsultaCO_ADDENDAESPECIAL: TStringField;
    Label14: TLabel;
    lbCategoriaCliente: TLabel;
    lbCategoriaAtencion: TLabel;
    btnContratoAnterior: TAdvGlowMenuButton;
    pmContratos: TAdvPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure lbNominaClick(Sender: TObject);
    procedure btnCartaAlicuotaClick(Sender: TObject);
    procedure btnEstadoDeCuentaClick(Sender: TObject);
    procedure lbDDJJSinPresentarClick(Sender: TObject);
    procedure sdqCobranzasAfterOpen(DataSet: TDataSet);
    procedure btnChequesClick(Sender: TObject);
    procedure btnSiniestrosClick(Sender: TObject);
    procedure sdqChequesAfterScroll(DataSet: TDataSet);
    procedure ScrollResize(Sender: TObject);
    procedure AdvToolPanelTabTabSlideIn(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure AdvToolPanelTabTabSlideOut(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure AdvToolPanelTabTabSlideOutDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure AdvToolPanelTabTabSlideInDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure btnCertificadosDeCoberturaClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure mnuImprEstadoCuentaClick(Sender: TObject);
    procedure mnuImprF817Click(Sender: TObject);
    procedure mnuImprF801CClick(Sender: TObject);
    procedure btnCerrarSiniestrosClick(Sender: TObject);
    procedure btnCerrarChequesClick(Sender: TObject);
    procedure tbImprimirEndososClick(Sender: TObject);
    procedure tbExportarEndososClick(Sender: TObject);
    procedure tbImprimirEstablecimientosClick(Sender: TObject);
    procedure tbExportarEstablecimientosClick(Sender: TObject);
    procedure gbTarifaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEditarClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure edCorreoElectronicoExit(Sender: TObject);
    procedure chkSinCorreoElectronicoCorporativoClick(Sender: TObject);
    procedure btnImprimirRenovacionClick(Sender: TObject);
    procedure mnuImprimirRenovacionClick(Sender: TObject);
    procedure mnuMailRenovacionClick(Sender: TObject);
    procedure lbCategoriaClienteClick(Sender: TObject);
    procedure lbCategoriaAtencionClick(Sender: TObject);
    procedure btnContratoAnteriorClick(Sender: TObject);
    procedure mnuContratoClick(Sender: TObject);
  private
    procedure BloquearCorreo(AValue: Boolean);
    procedure CargarLabel(Lbl: TLabel; Texto: String; Reemplazo: String; Default: String = ''; Evento: TNotifyEvent = nil);
    procedure OnEmpresaChange(Sender: TObject);
    procedure CargarCategoriaCliente(AContrato: Integer);
  end;

var
  frmIntegrador: TfrmIntegrador;

implementation

uses
  unDmPrincipal, VCLExtra, unContratoContacto, unNominaPeriodos, Math, CustomDlgs, unImpresionEstadoDeCuenta,
  unRptCartaConfirmacionAlicuota, unVisualizador, unRptDDJJSinPresentar, unEsperaSimple, unDmFinancials, unGrids,
  unEmisionCertificados, unQRF801C, unQRF817, General, unART, unComunes, unCuadroTarifarioContrato, unSesion, Internet,
  unAfiliaciones, Strfuncs, unConsultasAdicionales, AnsiSql, SqlFuncs;

var
  frmContratoContacto: TfrmContratoContacto;

{$R *.dfm}

procedure TfrmIntegrador.FormCreate(Sender: TObject);
begin
  inherited;
  fraDomicilioExtendidoLEGAL.Tipo := tdLegal;
  fraEmpresaCRM.OnChange := OnEmpresaChange;
  fraEmpresaCRM.ShowBajas := True;
  BloquearCorreo(True);
  VCLExtra.LockControls([fraDomicilioExtendidoPOSTAL, fraDomicilioExtendidoLEGAL,
                         edTEL_POSTAL, edFAX_POSTAL, edTEL_LEGAL, edFAX_LEGAL], True);
  frmContratoContacto := TfrmContratoContacto.Create(Self);
  with frmContratoContacto do
  begin
    ArtDBGrid.IniStorage := Self.FormStorage;
    tlbSalir.Visible := False;
    tbSeparador20.Visible := False;
    Parent := AdvToolPanelContactos;
    AgregarShortCuts;
    BorderStyle := Forms.bsNone;
    Align := alClient;
    Visible := True;
    gbDatosContrato.Visible := False;
    Constraints.MinHeight := 200;
  end;
  fraInfoEmpresa.VerHoldingTemporal := False;  // Pidio julia y grossi ge_temporal = T no ver el holding tk43559
  fraInfoEmpresa.lblAdic_9.Enabled  := Seguridad.Claves.IsActive('Ver Siniestros compensados');
  fraInfoEmpresa.lblAdic_12.Enabled := Seguridad.Claves.IsActive('Ver Litigios');

  lbCategoriaAtencion.Visible := AreIn(Sesion.Sector, ['COME', 'COMPUTOS']);
end;

procedure TfrmIntegrador.CargarLabel(Lbl: TLabel; Texto: String; Reemplazo: String; Default: String = ''; Evento: TNotifyEvent = nil);
begin
  if (Texto <> Default) then
  begin
    Lbl.Caption    := Texto;
    Lbl.Font.Color := clBlue;
    Lbl.Font.Style := [fsUnderline];
    Lbl.Cursor     := crHandPoint;
    Lbl.OnClick    := Evento;
  end
  else
  begin
    Lbl.Caption    := Reemplazo;
    Lbl.Font.Color := clMaroon;
    Lbl.Font.Style := [];
    Lbl.Cursor     := crArrow;
    Lbl.OnClick    := nil;
  end;
end;
procedure TfrmIntegrador.CargarCategoriaCliente(AContrato: Integer);
var
  sSQL: String;
begin
  sSQL := 'SELECT XX_categoria FROM afi.aXX_categoriaTABLA WHERE SYSDATE between XX_fechadesde and XX_fechahasta AND XX_contrato = :contrato';

  lbCategoriaCliente.Caption := ValorSQLEx(StringReplace(StringReplace(sSQL, 'XX_', 'cc_', [rfReplaceAll]), 'TABLA', 'cliente', [rfReplaceAll]), [AContrato], 'Sin definir');
  lbCategoriaAtencion.Caption := ValorSQLEx(StringReplace(StringReplace(sSQL, 'XX_', 'ca_', [rfReplaceAll]), 'TABLA', 'atencion', [rfReplaceAll]), [AContrato]);
  lbCategoriaAtencion.Visible := not IsEmptyString(lbCategoriaAtencion.Caption);
end;

procedure TfrmIntegrador.OnEmpresaChange(Sender: TObject);
var
  sNombreArtFutura: String;
  mnuAux: TMenuItem;
begin
  BloquearCorreo(True);
  inherited;

  if fraEmpresaCRM.IsSelected then
  begin
    IniciarEspera;
    try
      IniciarEspera('Domicilio');
      fraDomicilioExtendidoPOSTAL.CUIT := fraEmpresaCRM.CUIT;
      fraDomicilioExtendidoLEGAL.CUIT := fraEmpresaCRM.CUIT;
      DetenerEspera;
      IniciarEspera('Datos generales');
      fraInfoEmpresa.CargarContrato(fraEmpresaCRM.Contrato, fraEmpresaCRM.CUIT);
      CargarCategoriaCliente(fraEmpresaCRM.Contrato);
      OpenQueryEx(sdqConsulta, [fraEmpresaCRM.Contrato]);
      DetenerEspera;
      IniciarEspera('Cobranzas');
      OpenQueryEx(sdqCobranzas, [fraEmpresaCRM.Contrato, fraEmpresaCRM.Contrato]);
      OpenQueryEx(sdqCobranzasUltimoPeriodo, [fraEmpresaCRM.Contrato]);
      DetenerEspera;
      edCorreoElectronico.Text := sdqConsulta.FieldByName('CO_DIRELECTRONICA').AsString;
      edCorreoElectronico.Hint := sdqConsulta.FieldByName('CO_DIRELECTRONICA').AsString;

      dbtxtACTIVIDAD_DESCRIPCION.Hint := sdqConsulta.FieldByName('ACTIVIDAD_DESCRIPCION').AsString;
      dbtxtACTIVIDAD2.Hint := sdqConsulta.FieldByName('ACTIVIDAD2').AsString;
      dbtxtACTIVIDAD3.Hint := sdqConsulta.FieldByName('ACTIVIDAD3').AsString;

      chkSinCorreoElectronicoCorporativo.Checked := (sdqConsulta.FieldByName('CO_SINDIRELECTRONICA').AsInteger > 0);
      chkSinCorreoElectronicoCorporativoClick(nil);

      if AdvToolPanelEstablecimientos.Locked then
      begin
        IniciarEspera('Establecimientos');
        OpenQueryEx(sdqEstablecimientos, [fraEmpresaCRM.Contrato]);
        DetenerEspera;
      end;

      if AdvToolPanelEndosos.Locked then
      begin
        IniciarEspera('Endosos');
        OpenQueryEx(sdqEndosos, [fraEmpresaCRM.Contrato]);
        DetenerEspera;
      end;

      if AdvToolPanelContactos.Locked then
      begin
        IniciarEspera('Contactos');
        frmContratoContacto.DoCargarDatos(fraEmpresaCRM.Contrato, fraEmpresaCRM.Value);
        DetenerEspera;
      end;

      sNombreArtFutura := Get_NombreARTFutura(fraEmpresaCRM.Contrato);
      lblPoseeSolicitudTraspaso.Visible := not IsEmptyString(sNombreArtFutura);
      lblPoseeSolicitudTraspaso.Hint := 'La empresa solicitó traspaso a la ART: ' + sNombreArtFutura;
    finally
      DetenerEspera(True);
      mnuAux := TMenuItem(pmContratos.FindComponent('mnuContrato' + IntToStr(fraEmpresaCRM.Contrato)));
      if Assigned(mnuAux) then
        FreeAndNil(mnuAux);

      mnuAux := TMenuItem.Create(pmContratos);
      with mnuAux do
      begin
        Caption := fraEmpresaCRM.RazonSocial + ' (' + IntToStr(fraEmpresaCRM.Contrato) + ')';
        Name := 'mnuContrato' + IntToStr(fraEmpresaCRM.Contrato);
        Tag := fraEmpresaCRM.Contrato;
        OnClick := mnuContratoClick;
      end;
      pmContratos.Items.Insert(0, mnuAux)
    end;
  end
  else
  begin
    fraDomicilioExtendidoPOSTAL.Clear;
    fraDomicilioExtendidoLEGAL.Clear;
    fraInfoEmpresa.Clear;
    sdqConsulta.Close;
    sdqCobranzas.Close;
    sdqCobranzasUltimoPeriodo.Close;
    sdqEndosos.Close;
    sdqEstablecimientos.Close;
    frmContratoContacto.Clear;
    edCorreoElectronico.Clear;
    chkSinCorreoElectronicoCorporativo.Checked := False;
    CargarLabel(lbDDJJSinPresentar, '', '', '', nil);
    lblPoseeSolicitudTraspaso.Visible := False;
    lblPoseeSolicitudTraspaso.Hint := '';
  end;
end;

procedure TfrmIntegrador.lbNominaClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');

  with TfrmNominaPeriodos.Create(Self) do
  begin
    CUIT    := fraEmpresaCRM.CUIT;
    Periodo := Get_PeriodoBusqueda(fraEmpresaCRM.CUIT, Self.sdqCobranzasUltimoPeriodo.FieldByName('periodo').AsString, 'A');;
    ShowModal;
  end;
end;

procedure TfrmIntegrador.btnCartaAlicuotaClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  Verificar(ValorSqlEx('SELECT AFILIACION.Is_TarifaPendiente(:Contrato) FROM DUAL', [fraEmpresaCRM.Contrato]) = 'S', btnCartaAlicuota, 'Este contrato tiene tarifa pendiente de aplicación.'); 
  qrCartaConfirmacionAlicuota := TqrCartaConfirmacionAlicuota.Create(Self);
  with qrCartaConfirmacionAlicuota do
  try
    OpenQueryEx(sdqDatos, [fraEmpresaCRM.Contrato]);
    Visualizar(qrCartaConfirmacionAlicuota, GetValores(' - Contrato ' + IntToStr(fraEmpresaCRM.Contrato), fraEmpresaCRM.CorreoElectronico, fraEmpresaCRM.Contrato), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal])
  finally
    qrCartaConfirmacionAlicuota.Free;
  end;
end;

procedure TfrmIntegrador.btnEstadoDeCuentaClick(Sender: TObject);
begin
  btnEstadoDeCuenta.DoDropDown;
end;

procedure TfrmIntegrador.lbDDJJSinPresentarClick(Sender: TObject);
begin
  Verificar(True, nil, 'Informe en construcción solicitado por el sector Emisión.');
  Verificar(fraEmpresaCRM.IsEmpty, lbDDJJSinPresentar, 'Debe seleccionar una empresa.');
  Verificar(fraEmpresaCRM.IsBaja, lbDDJJSinPresentar, 'La empresa seleccionada carece de cobertura actualmente.');
  Verificar(fraEmpresaCRM.SUSS <> 2, lbDDJJSinPresentar, 'La empresa seleccionada no es NO SUSS.');
  qrDDJJSinPresentar := TqrDDJJSinPresentar.Create(Self);
  with qrDDJJSinPresentar do
  try
    OpenQueryEx(sdqDatos, [fraEmpresaCRM.Contrato]);
    OpenQueryEx(sdqDetalle, [fraEmpresaCRM.Contrato]);
    Visualizar(qrDDJJSinPresentar,
               GetValores(' - Contrato ' + IntToStr(fraEmpresaCRM.Contrato),
                          fraEmpresaCRM.CorreoElectronico,
                          fraEmpresaCRM.Contrato,
                          0,
                          qrlTitulo.Caption + CRLF + CRLF + qrlInstrucciones.Lines.Text),
               [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal]);
  finally
    qrDDJJSinPresentar.Free;
  end;
end;

procedure TfrmIntegrador.sdqCobranzasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CargarLabel(lbDDJJSinPresentar, DataSet.FieldByName('PRESENTO_DDJJ').AsString, DataSet.FieldByName('PRESENTO_DDJJ').AsString, 'NO', lbDDJJSinPresentarClick); 
end;

procedure TfrmIntegrador.btnChequesClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  inherited;
//  IniciarEspera('Cheques');
  try
    dmFinancials.Conectar;
    OpenQueryEx(sdqCheques, [fraEmpresaCRM.CUIT]);
    DynColWidthsByData(GridCheques);
    sdqCheques.FieldByName('ID').Visible := False;
    fpCheques.Width := Min(Screen.Width, GetColumnWidths(GridCheques, True));
  finally
//    DetenerEspera;
    fpCheques.ShowModal;
    dmFinancials.Desconectar;
  end;
end;

procedure TfrmIntegrador.btnContratoAnteriorClick(Sender: TObject);
begin
  inherited;
  if pmContratos.Items.Count > 1 then
  begin
    fraEmpresaCRM.Contrato := pmContratos.Items[1].Tag;
    OnEmpresaChange(fraEmpresaCRM);
  end;
end;

procedure TfrmIntegrador.btnSiniestrosClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
//  IniciarEspera('Siniestros');
  try
    OpenQueryEx(sdqSiniestros, [fraEmpresaCRM.Contrato]);
  finally
//    DetenerEspera;
    fpSiniestros.ShowModal;
  end;
end;

procedure TfrmIntegrador.sdqChequesAfterScroll(DataSet: TDataSet);
begin
  if sdqCheques.Active and not sdqCheques.IsEmpty then
  begin
    dmFinancials.OpenQueryEx(sdqDetalleCheques, [sdqCheques.FieldByName('ID').AsInteger]);
    DynColWidthsByData(GridDetalleCheques);
  end;
end;

procedure TfrmIntegrador.ScrollResize(Sender: TObject);
{
var
  i: integer;
}  
begin
  inherited;
{
  for i := 0 to AdvToolPanelTab.Panels.Count - 1 do
    AdvToolPanelTab.Panels[i].OpenWidth := Round(Scroll.Height / 2) - 12;

  AdvToolPanelActividades.OpenWidth := Round(Scroll.Height / 2) - 12;
  AdvToolPanelDomicilios.OpenWidth := Round(Scroll.Height / 2) - 12;
  AdvToolPanelEndosos.OpenWidth := Round(Scroll.Height / 2) - 12;
  AdvToolPanelEstablecimientos.OpenWidth := Round(Scroll.Height / 2) - 12;
  AdvToolPanelContactos.OpenWidth := Scroll.Height - 24;
}
end;

procedure TfrmIntegrador.AdvToolPanelTabTabSlideIn(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  inherited;
//showmessage('slide in')
end;

procedure TfrmIntegrador.AdvToolPanelTabTabSlideOut(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  inherited;    {
  case Index of
    0, 1, 2, 3: 
      APanel.OpenWidth := Round(Scroll.Height / 2) - 12;
    4:
      APanel.OpenWidth := Scroll.Height - 24;
  end;
                       }
  APanel.Align := alTop;

  AdvToolPanelActividades.OpenWidth := Round((Scroll.Height - 1) / 2) - 13;
  AdvToolPanelDomicilios.OpenWidth := Round((Scroll.Height - 1) / 1.6) - 13;
  AdvToolPanelEndosos.OpenWidth := Round((Scroll.Height - 1) / 2) - 13;
  AdvToolPanelEstablecimientos.OpenWidth := Round((Scroll.Height - 1) / 2) - 13;
  AdvToolPanelContactos.OpenWidth := Scroll.Height - 28;
end;

procedure TfrmIntegrador.AdvToolPanelTabTabSlideOutDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  inherited;
  case Index of
    2: begin
         IniciarEspera('Endosos');
         try
           OpenQueryEx(sdqEndosos, [fraEmpresaCRM.Contrato]);
         finally
           DetenerEspera;
           DynColWidthsByData(GridEndosos);
         end;
       end;
    3: begin
         IniciarEspera('Establecimientos');
         try
           OpenQueryEx(sdqEstablecimientos, [fraEmpresaCRM.Contrato]);
         finally
           DetenerEspera;
           DynColWidthsByData(GridEstablecimientos);
         end;
       end;
    4: begin
         IniciarEspera('Contactos');
         try
           frmContratoContacto.DoCargarDatos(fraEmpresaCRM.Contrato, fraEmpresaCRM.Value);
         finally
           DetenerEspera;
         end;
       end;
  end;
end;

procedure TfrmIntegrador.AdvToolPanelTabTabSlideInDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  inherited;
  case Index of
    2: sdqEndosos.Close;
    3: sdqEstablecimientos.Close;
    4: frmContratoContacto.Clear;
  end;
end;

procedure TfrmIntegrador.btnCertificadosDeCoberturaClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  frmEmisionCertificados := TfrmEmisionCertificados.Create(Self);
  with frmEmisionCertificados do
  try
    FormStyle := fsNormal;
    Hide;
    Contrato := Self.fraEmpresaCRM.Contrato;
    VCLExtra.LockControls([fraCO_CONTRATO], True);
    ShowModal;
  finally
    FreeAndNil(frmEmisionCertificados);
  end;
end;

procedure TfrmIntegrador.btnLimpiarClick(Sender: TObject);
begin
  fraEmpresaCRM.Clear;
  lbCategoriaCliente.Caption := '';
  lbCategoriaAtencion.Caption := '';
  edCorreoElectronico.Clear;
  chkSinCorreoElectronicoCorporativo.Checked := False;
  OnEmpresaChange(nil);
end;

procedure TfrmIntegrador.mnuContratoClick(Sender: TObject);
begin
  fraEmpresaCRM.Contrato := (Sender as TMenuItem).Tag;
  OnEmpresaChange(fraEmpresaCRM);
end;

procedure TfrmIntegrador.mnuImprEstadoCuentaClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');

  with TfrmImpresionEstadodeCuenta.Create(Self) do
  begin
    Contratos.Add(IntToStr(fraEmpresaCRM.Contrato));
    cbIntereses.Checked  := True;
    edVencimiento.Date   := DBDate;

    ShowModal;
  end;
end;

procedure TfrmIntegrador.mnuImprF817Click(Sender: TObject);
begin
  if not Do_ImprimirF817(ART_EMPTY_ID, fraEmpresaCRM.Contrato, srPreview, 1) then
    InfoHint(nil, 'No se han encontrado periodos con deuda');
end;

procedure TfrmIntegrador.mnuImprF801CClick(Sender: TObject);
begin
//  Verificar(cmbINTERES_AL.Date = 0, cmbINTERES_AL, 'Debe indicar la fecha hasta la que se calculan los intereses.');

  if not Do_ImprimirF801C(fraEmpresaCRM.Contrato, DBDate{cmbINTERES_AL.Date}, (Sender = mnuImprF801CTotal)) then
    InfoHint(nil, 'No se han encontrado periodos con intereses');
end;

procedure TfrmIntegrador.btnCerrarSiniestrosClick(Sender: TObject);
begin
  inherited;
  fpSiniestros.Close;
end;

procedure TfrmIntegrador.btnCerrarChequesClick(Sender: TObject);
begin
  inherited;
  fpCheques.Close;
end;

procedure TfrmIntegrador.tbImprimirEndososClick(Sender: TObject);
begin
  tbImprimirEndosos.Enabled := False;
  try
     if PrintDialogEndosos.Execute then
     try
       QueryPrintEndosos.SetGridColumns(GridEndosos, True, [baDetail, baHeader, baTotal, baSubTotal]);
       QueryPrintEndosos.Print;
     finally
       QueryPrintEndosos.Fields.Clear;
     end;
  finally
    tbImprimirEndosos.Enabled := True;
  end;
end;

procedure TfrmIntegrador.tbExportarEndososClick(Sender: TObject);
begin
  tbExportarEndosos.Enabled := False;
  try
    ExportDialogEndosos.Fields.Assign(GridEndosos.Columns);
    ExportDialogEndosos.Execute;
  finally
    tbExportarEndosos.Enabled := True;
  end;
end;

procedure TfrmIntegrador.tbImprimirEstablecimientosClick(Sender: TObject);
begin
  tbImprimirEstablecimientos.Enabled := False;
  try
     if PrintDialogEstablecimientos.Execute then
     try
       QueryPrintEstablecimientos.SetGridColumns(GridEstablecimientos, True, [baDetail, baHeader, baTotal, baSubTotal]);
       QueryPrintEstablecimientos.Print;
     finally
       QueryPrintEstablecimientos.Fields.Clear;
     end;
  finally
    tbImprimirEstablecimientos.Enabled := True;
  end;
end;

procedure TfrmIntegrador.tbExportarEstablecimientosClick(Sender: TObject);
begin
  tbExportarEstablecimientos.Enabled := False;
  try
    ExportDialogEstablecimientos.Fields.Assign(GridEstablecimientos.Columns);
    ExportDialogEstablecimientos.Execute;
  finally
    tbExportarEstablecimientos.Enabled := True;
  end;
end;

procedure TfrmIntegrador.gbTarifaClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  OldCursor     := Screen.Cursor;
  Screen.cursor := crHourGlass;
  with TfrmContratoTarifa.Create(Self) do
  try
    DoCargarDatos(Self.fraEmpresaCRM.Contrato);
    tbNuevo.Enabled := False;
    tbCartaDoc.Enabled := False;    
    ShowModal;
  finally
    Free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmIntegrador.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
  begin
    edCorreoElectronico.Text := sdqConsulta.FieldByName('CO_DIRELECTRONICA').AsString;
    edCorreoElectronico.Hint := sdqConsulta.FieldByName('CO_DIRELECTRONICA').AsString;
    chkSinCorreoElectronicoCorporativo.Checked := (sdqConsulta.FieldByName('CO_SINDIRELECTRONICA').AsInteger > 0);
    chkSinCorreoElectronicoCorporativoClick(nil);

    if not sdqConsulta.FieldByName('CO_FECHABAJA').IsNull then
    begin
      edEstado.Hint := sdqConsulta.FieldByName('MOTIVO_BAJA').AsString + ' (' + sdqConsulta.FieldByName('CO_FECHABAJA').AsString + ')';
      edEstado.ShowHint := True;
      edEstado.Cursor := crHandPoint;
    end else
    begin
      edEstado.ShowHint := False;
      edEstado.Cursor := crDefault;
    end;
  end else
  begin
    edEstado.ShowHint := False;
    edEstado.Cursor := crDefault;
    edCorreoElectronico.Clear;
    chkSinCorreoElectronicoCorporativo.Checked := False;
  end;
end;

procedure TfrmIntegrador.tbEditarClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  BloquearCorreo(False);
  edCorreoElectronico.Tag := 0;
end;

procedure TfrmIntegrador.tbGuardarClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  Verificar((edCorreoElectronico.Text <> '') and (not IsEMail(edCorreoElectronico.Text)), edCorreoElectronico, 'La dirección de correo indicada no es válida.');
  Verificar(Trim(UpperCase(edCorreoElectronico.Text)) = Trim(UpperCase(edCorreoElectronico.Hint)), edCorreoElectronico, 'La dirección de correo indicada es exactamente igual a la anterior.');

  try
    try
      BeginTrans(True);
      EjecutarSQLSTEx('UPDATE ACO_CONTRATO' +
                         ' SET CO_DIRELECTRONICA = :MAIL,' +
                             ' CO_SINDIRELECTRONICA = :SINDIR,' +
                             ' CO_USUMODIF = :USUARIO,' +
                             ' CO_FECHAMODIF = ART.ACTUALDATE' +
                       ' WHERE CO_CONTRATO = :CONTRATO',
        [edCorreoElectronico.Text, IIF(chkSinCorreoElectronicoCorporativo.Checked, 2, 0), Sesion.UserID,
         fraEmpresaCRM.Contrato]);
      EjecutarStoreSTEx('ART.AFILIACION.DOGENERARALTAENDOSO(:CONTRATO, ART.ACTUALDATE, ''13.4'', ''N'', ''N'', ''S'', :USUARIO);', [fraEmpresaCRM.Contrato, Sesion.UserID]);
      CommitTrans(True);
      edCorreoElectronico.Tag := 1;
      edCorreoElectronico.Hint := edCorreoElectronico.Text;
      InfoHint(edCorreoElectronico, 'Se ha generado un movimiento sobre el último endoso correctamente.');
    except
      on E: Exception do
      begin
        Rollback(True);
        InvalidHint(edCorreoElectronico, 'Ocurrió un error al generar un movimiento sobre el último endoso del contrato seleccionado.' + CRLF + E.Message);
      end;
    end;
  finally
    BloquearCorreo(True);
  end;
end;

procedure TfrmIntegrador.edCorreoElectronicoExit(Sender: TObject);
begin
  if edCorreoElectronico.Tag = 0 then
    edCorreoElectronico.Text := edCorreoElectronico.Hint;
  BloquearCorreo(True);
end;

procedure TfrmIntegrador.BloquearCorreo(AValue: Boolean);
begin
  VCLExtra.LockControls([edCorreoElectronico, chkSinCorreoElectronicoCorporativo], AValue);
  chkSinCorreoElectronicoCorporativoClick(nil);
  tbGuardar.Enabled := not AValue;
  tbEditar.Enabled := AValue;
end;

procedure TfrmIntegrador.chkSinCorreoElectronicoCorporativoClick(Sender: TObject);
begin
  edCorreoElectronico.Enabled := not chkSinCorreoElectronicoCorporativo.Checked;
  if chkSinCorreoElectronicoCorporativo.Checked then
    edCorreoElectronico.Clear;
end;

procedure TfrmIntegrador.btnImprimirRenovacionClick(Sender: TObject);
begin
  btnImprimirRenovacion.DoDropDown;
end;

procedure TfrmIntegrador.mnuImprimirRenovacionClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  ImprimirUltimaRenovacionAutomatica(fraEmpresaCRM.Contrato);
end;

procedure TfrmIntegrador.mnuMailRenovacionClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  ImprimirUltimaRenovacionAutomatica(fraEmpresaCRM.Contrato, True);
end;

procedure TfrmIntegrador.lbCategoriaClienteClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  with TfrmConsultasAdicionales.Create(Self) do
    try
      Caption := 'Categoría del Cliente';
      SetLength(NombreCampos, 7);
      NombreCampos[0]  := 'Categoría';
      NombreCampos[1]  := 'Fecha Desde';
      NombreCampos[2]  := 'Fecha Hasta';
      NombreCampos[3]  := 'Usuario de Alta';
      NombreCampos[4]  := 'Fecha de Alta';
      NombreCampos[5]  := 'Usuario de Baja';
      NombreCampos[6]  := 'Fecha de Baja';
      CAMPOBAJA        := 'cc_fechabaja';

      Sql := 'SELECT cc_categoria, cc_fechadesde, cc_fechahasta, cc_usualta, cc_fechaalta, cc_usubaja, cc_fechabaja ' +
               'FROM afi.acc_categoriacliente ' +
              'WHERE cc_contrato = ' + SqlValue(fraEmpresaCRM.Contrato) + ' ' +
           'ORDER BY cc_fechadesde DESC';

      Tipo     := 10; {??}
      Contrato := fraEmpresaCRM.Contrato;
      MostrarConsulta;
    finally
      Free;
    end;
end;

procedure TfrmIntegrador.lbCategoriaAtencionClick(Sender: TObject);
begin
  Verificar(fraEmpresaCRM.IsEmpty, nil, 'Debe seleccionar una empresa.');
  with TfrmConsultasAdicionales.Create(Self) do
    try
      Caption := 'Categoría de Atención';
      SetLength(NombreCampos, 9);
      NombreCampos[0]  := 'Categoría';
      NombreCampos[1]  := 'Fecha Desde';
      NombreCampos[2]  := 'Fecha Hasta';
      NombreCampos[3]  := 'Usuario de Alta';
      NombreCampos[4]  := 'Fecha de Alta';
      NombreCampos[5]  := 'Usuario de Modificación';
      NombreCampos[6]  := 'Fecha de Modificación';
      NombreCampos[7]  := 'Usuario de Baja';
      NombreCampos[8]  := 'Fecha de Baja';
      CAMPOBAJA        := 'ca_fechabaja';

      Sql := 'SELECT ca_categoria, ca_fechadesde, ca_fechahasta, ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif, ca_usubaja, ca_fechabaja ' +
               'FROM afi.aca_categoriaatencion ' +
              'WHERE ca_contrato = ' + SqlValue(fraEmpresaCRM.Contrato) + ' ' +
           'ORDER BY ca_fechadesde DESC';

      Tipo     := 11; {??}
      Contrato := fraEmpresaCRM.Contrato;
      MostrarConsulta;
    finally
      Free;
    end;
end;

end.
