unit unSeguimientoCasosILP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, DateComboBox, SinEdit, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, FieldHider, ShortCutControl, RxPlacemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Data.DB,
  SDEngine, Vcl.ExtCtrls, FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, unFraTrabajador,
  unFraCodigoDescripcion, PatternEdit, ComboEditor, CheckCombo, DBCheckCombo,
  unFraTrabajadorSiniestro, customdlgs, undmprincipal, unSesion, unfraFirmantes,
  unComunes, unrptcartadocheader, unfraFirmante, vclextra, unART, unLiqIncapacidades,
  Vcl.Menus, unEstrategiaTIFF, ShellApi;

type
  TfrmSeguimCasosILP = class(TfrmCustomGridABM)
    GroupBox6: TGroupBox;
    Label7: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    GroupBox4: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    dcDesdeCaso: TDateComboBox;
    dcHastaCaso: TDateComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dcDesdeLiquid: TDateComboBox;
    dcHastaLiquid: TDateComboBox;
    GroupBox5: TGroupBox;
    rgLiquidado: TRadioGroup;
    rgSUSS: TRadioGroup;
    GroupBox7: TGroupBox;
    Label3: TLabel;
    dcDesdeInactivo: TDateComboBox;
    dcHastaInactivo: TDateComboBox;
    GroupBox8: TGroupBox;
    Label4: TLabel;
    dcDesdeBajaTrab: TDateComboBox;
    dcHastaBajaTrab: TDateComboBox;
    GroupBox9: TGroupBox;
    Label5: TLabel;
    dcDesdeAccidente: TDateComboBox;
    dcHastaAccidente: TDateComboBox;
    gbMotivoIngreso: TGroupBox;
    fraMotivoIngreso: TfraCodigoDescripcion;
    GroupBox10: TGroupBox;
    fraMotBajaTrab: TfraCodigoDescripcion;
    GroupBox11: TGroupBox;
    fraLiquidador: TfraCodigoDescripcion;
    rgActivos: TRadioGroup;
    rgDocPendiente: TRadioGroup;
    rgConAltaMed: TRadioGroup;
    rgExtensionILT: TRadioGroup;
    rgBloqueoILT: TRadioGroup;
    GroupBox13: TGroupBox;
    fraEstadoSiniestro: TfraCodigoDescripcion;
    GroupBox15: TGroupBox;
    cmbEstLiq: TDBCheckCombo;
    cmbEstCaso: TDBCheckCombo;
    fraTrabajadorSiniestro: TfraTrabajadorSiniestro;
    sdqEstadoLiq: TSDQuery;
    dsEstadoLiq: TDataSource;
    sdqEstadoCaso: TSDQuery;
    dsEstadoCaso: TDataSource;
    SinEditABM: TSinEdit;
    Label6: TLabel;
    Label8: TLabel;
    edTrabajadorABM: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    fraMotivoIngresoABM: TfraCodigoDescripcion;
    fraLiquidadorABM: TfraCodigoDescripcion;
    rgDocVencida: TRadioGroup;
    tbAceptar: TToolButton;
    fpModificar: TFormPanel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    btnAceptarModif: TButton;
    btnCancelarModif: TButton;
    SinEditModif: TSinEdit;
    edTrabajadorModif: TEdit;
    fraLiquidadorModif: TfraCodigoDescripcion;
    chkSolAudit: TCheckBox;
    chkPedidoDoc: TCheckBox;
    Label13: TLabel;
    mObservacionModif: TMemo;
    tbSolicDocum: TToolButton;
    fpBaja: TFormPanel;
    Bevel2: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    btnAceptarBaja: TButton;
    btnCancelarBaja: TButton;
    fraMotivoBaja: TfraCodigoDescripcion;
    fpPedidoDoc: TFormPanel;
    Bevel3: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    btnAceptarPedidoDoc: TButton;
    btnCancelarPedidoDoc: TButton;
    SinEditPedidoDoc: TSinEdit;
    edTrabajadorPedidoDoc: TEdit;
    fraCDPedidoDoc: TfraCodigoDescripcion;
    mObservacionPedidoDoc: TMemo;
    Label21: TLabel;
    tbCasosPorLiq: TToolButton;
    fraFirmantePedidoDoc: TfraFirmantes;
    ShortCutControl1: TShortCutControl;
    cbCasosARelacionar: TArtComboBox;
    sdqCasosARelacionar: TSDQuery;
    dsCasosARelacionar: TDataSource;
    sdqConsultaIDCASO: TFloatField;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaNROLIQ: TFloatField;
    sdqConsultaFACCIDENTE: TDateTimeField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaEMPRESA: TStringField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaTRABAJADOR: TStringField;
    sdqConsultaESTADOSIN: TStringField;
    sdqConsultaFBAJAMEDICA: TDateTimeField;
    sdqConsultaFALTAMEDICA: TDateTimeField;
    sdqConsultaFRECAIDA: TDateTimeField;
    sdqConsultaFINGRESOCASO: TDateTimeField;
    sdqConsultaFEGRESOTRAB: TDateTimeField;
    sdqConsultaESTADOCASO: TStringField;
    sdqConsultaESTADOLIQ: TStringField;
    sdqConsultaLIQUIDADO: TStringField;
    sdqConsultaSUSS: TStringField;
    sdqConsultaMOTIVOCASO: TStringField;
    sdqConsultaMBAJATRAB: TStringField;
    sdqConsultaFINACTIVO: TDateTimeField;
    sdqConsultaMOTBAJACASO: TStringField;
    sdqConsultaLIQUIDADOR: TStringField;
    sdqConsultaCL_DOCPENDIENTE: TStringField;
    sdqConsultaBLOQUEOILT: TStringField;
    sdqConsultaEXTENSIONILT: TStringField;
    sdqConsultaOBSERVACION: TStringField;
    sdqConsultaSOLAUDIT: TStringField;
    sdqConsultaCONCHEQUE: TStringField;
    sdqConsultaNROCHEQUE: TFloatField;
    sdqConsultaESTCHEQUE: TStringField;
    sdqConsultaDIASENESTADO: TStringField;
    sdqConsultaCL_ALTAMANUAL: TStringField;
    sdqConsultaFDICTAMEN: TDateTimeField;
    sdqConsultaFCARGADICTAMEN: TDateTimeField;
    sdqConsultaCOMISIONMEDICA: TStringField;
    sdqConsultaEXPEDINCAPACIDAD: TStringField;
    sdqConsultaFRECEPDICTAMEN: TDateTimeField;
    sdqConsultaDOCVENCIDA: TStringField;
    sdqConsultaSITUACIONDDJJ: TStringField;
    sdqConsultaSITUACIONREVISTA: TStringField;
    sdqConsultaDIASASIGNADO: TStringField;
    sdqConsultaCL_ID: TFloatField;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaTJ_NOMBRE: TStringField;
    sdqConsultaLC_ID: TFloatField;
    sdqConsultaEL_CODIGO: TStringField;
    sdqConsultaEX_ID: TFloatField;
    tbVerListPedidosDoc: TToolButton;
    fpListPedidosDoc: TFormPanel;
    Bevel4: TBevel;
    Button2: TButton;
    GridListPedidosDoc: TArtDBGrid;
    sdqPedidosDoc: TSDQuery;
    dsPedidosDoc: TDataSource;
    sdqPedidosDocFPEDIDO: TDateTimeField;
    sdqPedidosDocOBSERVACION: TStringField;
    sdqPedidosDocCODCARTA: TStringField;
    sdqPedidosDocCARTAIMPRESA: TStringField;
    fpCasosRelacionados: TFormPanel;
    Bevel5: TBevel;
    Button1: TButton;
    GridCasosRelacionados: TArtDBGrid;
    dsCasosRelacionados: TDataSource;
    sdqCasosRelacionados: TSDQuery;
    sdqCasosRelacionadosIDCASO: TFloatField;
    sdqCasosRelacionadosFCASO: TDateTimeField;
    sdqCasosRelacionadosMOTIVO: TStringField;
    sdqCasosRelacionadosESTADOCASO: TStringField;
    sdqCasosRelacionadosLIQUIDADOR: TStringField;
    sdqCasosRelacionadosMOTIVOBAJA: TStringField;
    tbVerCasosRelacionados: TToolButton;
    fpHistoricoEstados: TFormPanel;
    Bevel6: TBevel;
    Button3: TButton;
    GridHistoricoEstados: TArtDBGrid;
    sdqHistoricoEstados: TSDQuery;
    dsHistoricoEstados: TDataSource;
    sdqHistoricoEstadosHL_ID: TFloatField;
    sdqHistoricoEstadosSINIESTRO: TStringField;
    sdqHistoricoEstadosTRABAJADOR: TStringField;
    sdqHistoricoEstadosFESTADO: TDateTimeField;
    sdqHistoricoEstadosESTADO: TStringField;
    sdqHistoricoEstadosLIQUIDADOR: TStringField;
    tbHistoricoEstados: TToolButton;
    fpReasignarCaso: TFormPanel;
    Bevel7: TBevel;
    Label22: TLabel;
    btnAceptarReasigCaso: TButton;
    Button5: TButton;
    fraLiquidadorReasignarCaso: TfraCodigoDescripcion;
    tbReasignarCaso: TToolButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    rgCasosPendientes: TRadioGroup;
    sdqConsultaTJ_ID: TFloatField;
    sdqConsultaLC_USUARIO: TStringField;
    sdqConsultaCL_IDLIQUIDADOR: TFloatField;
    sdqConsultaEL_PENDIENTELIQ: TStringField;
    rgSolAuditoria: TRadioGroup;
    lTotal: TLabel;
    sdqConsultaSE_ID: TFloatField;
    tbViajar: TToolButton;
    rgConCheque: TRadioGroup;
    rgAnticipo: TRadioGroup;
    sdqConsultaANTICIPO: TStringField;
    sdqConsultaPORCINA: TFloatField;
    sdqConsultaGRADOINC: TStringField;
    sdqConsultaCARACTERINC: TStringField;
    sdqConsultaGRANINV: TStringField;
    sdqConsultaDIASSINAPROB: TFloatField;
    chkEnSuspenso: TCheckBox;
    pmViajar: TPopupMenu;
    mnuViajarLiqIncap: TMenuItem;
    mnuViajarAdmCD: TMenuItem;
    Label26: TLabel;
    Panel3: TPanel;
    tbVerDigitalizaciones: TToolButton;
    sdqConsultaEV_IDEVENTO: TFloatField;
    rgConJuicio: TRadioGroup;
    rgGPBA: TRadioGroup;
    sdqConsultaJUICIO: TStringField;
    sdqConsultaESGPBA: TStringField;
    sdqConsultaIDTAREASIC: TFloatField;
    sdqConsultaTEXTORECLAMO: TStringField;
    tbLinks: TToolButton;
    tbSalir2: TToolButton;
    ToolButton7: TToolButton;
    mnuLinks: TPopupMenu;
    mnuAnses: TMenuItem;
    mnuAfip: TMenuItem;
    mnuSSS: TMenuItem;
    mnuARTs: TMenuItem;
    mnuSRT: TMenuItem;
    mnuBNA: TMenuItem;
    mnuCorreo: TMenuItem;
    mnuBcoPatag: TMenuItem;
    mnuSSN: TMenuItem;
    mnuUART: TMenuItem;
    mnuInfoleg: TMenuItem;
    sdqConsultaEV_INTEGRAL: TStringField;
    sdqConsultaEV_PORCINTEGRAL: TFloatField;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraMotivoIngresoABMEnter(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbAceptarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarBajaClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbSolicDocumClick(Sender: TObject);
    procedure btnAceptarPedidoDocClick(Sender: TObject);
    function ValidarPedidoDoc: boolean;
    procedure fraCDPedidoDocChange(Sender: TObject);
    procedure tbCasosPorLiqClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure SinEditABMExit(Sender: TObject);
    procedure btnAceptarModifClick(Sender: TObject);
    procedure tbVerListPedidosDocClick(Sender: TObject);
    procedure tbVerCasosRelacionadosClick(Sender: TObject);
    procedure tbHistoricoEstadosClick(Sender: TObject);
    procedure btnAceptarReasigCasoClick(Sender: TObject);
    procedure tbReasignarCasoClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure fpBajaShow(Sender: TObject);
    procedure mnuViajarLiqIncapClick(Sender: TObject);
    procedure mnuViajarAdmCDClick(Sender: TObject);
    procedure tbVerDigitalizacionesClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure mnuAnsesClick(Sender: TObject);
    procedure mnuAfipClick(Sender: TObject);
    procedure mnuSSSClick(Sender: TObject);
    procedure mnuARTsClick(Sender: TObject);
    procedure mnuSRTClick(Sender: TObject);
    procedure mnuBNAClick(Sender: TObject);
    procedure mnuCorreoClick(Sender: TObject);
    procedure mnuBcoPatagClick(Sender: TObject);
    procedure mnuSSNClick(Sender: TObject);
    procedure mnuUARTClick(Sender: TObject);
    procedure mnuInfolegClick(Sender: TObject);


  private
    { Private declarations }

  protected
    procedure ClearControls; override;
    //procedure LoadControls; override;
    function Validar : Boolean; override;
		//function DoABM: Boolean; override;

  public
    eEstrategiaTiff : TEstrategiaTiff;
    { Public declarations }
  end;

var
  frmSeguimCasosILP: TfrmSeguimCasosILP; iIdLiquidadorLogueado: integer;
  frmLiqIncapacidades: TfrmLiqIncapacidades;

const IDTIPOCASO = '3';

implementation

{$R *.dfm}

uses unRptCasosPorLiquidador, General, unPrincipal, unRTTI,
  unDinerariasAdministracionCartas, unUtilsArchivo, unFraVistaTIFF,
  unConsultaTIFF;

procedure TfrmSeguimCasosILP.FormCreate(Sender: TObject);
var ssql: string;
begin
  inherited;
  with fraEstadoSiniestro do
  begin
    TableName := 'ctb_tablas';
    FieldID := 'TB_CODIGO';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc := 'TB_DESCRIPCION';
    FieldBaja := 'TB_FECHABAJA';
    Sql := ' SELECT   tb_codigo id, tb_codigo codigo, ' +
           '          tb_descripcion descripcion, tb_fechabaja baja ' +
           '   FROM   ctb_tablas ' +
            ' WHERE   tb_clave = ''SIEST'' AND tb_codigo <> ''0'' ';
  end;

  with fraMotivoIngreso do
  begin
    TableName := 'DIN.DMI_MOTIVOINGRESOLIQ';
    FieldID := 'MI_ID';
    FieldCodigo := 'MI_CODIGO';
    FieldDesc := 'MI_DESCRIPCION';
    FieldBaja := 'MI_FECHABAJA';
    ExtraCondition := ' AND MI_IDTIPOCASO = ' + IDTIPOCASO;
  end;

  with fraMotivoIngresoABM do
  begin
    TableName := 'DIN.DMI_MOTIVOINGRESOLIQ';
    FieldID := 'MI_ID';
    FieldCodigo := 'MI_CODIGO';
    FieldDesc := 'MI_DESCRIPCION';
    FieldBaja := 'MI_FECHABAJA';
    ExtraCondition := ' AND MI_IDTIPOCASO = ' + IDTIPOCASO;
  end;

  with fraMotBajaTrab do
  begin
    TableName := 'ctb_tablas';
    FieldID := 'TB_CODIGO';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc := 'TB_DESCRIPCION';
    FieldBaja := 'TB_FECHABAJA';
    Sql := ' SELECT   tb_codigo id, tb_codigo codigo, tb_descripcion descripcion, tb_fechabaja baja ' +
           '   FROM   ctb_tablas ' +
            ' WHERE   tb_clave = ''MOTIB'' AND tb_codigo <> ''0'' ';
  end;

  with fraLiquidador do
  begin
    TableName := 'USE_USUARIOS';
    FieldID := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc := 'se_nombre';
    FieldBaja := 'se_fechabaja';
    ExtraFields := ' ,lc_id ';

    Sql := 'SELECT se_id id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja, lc_id ' +
           '  FROM din.dlc_liquidadorescasos, use_usuarios' +
           ' WHERE lc_fechabaja IS NULL' +
           '   AND se_usuario = lc_usuario' +
           '   AND se_fechabaja IS NULL' +
           '   AND lc_idtipocaso = ' + IDTIPOCASO;

    ssql := '  SELECT   se_id ' +
               ' FROM   din.dlc_liquidadorescasos, use_usuarios ' +
              ' WHERE   lc_fechabaja IS NULL AND lc_usuario = :usu ' +
                ' AND   lc_idtipocaso = ' + IDTIPOCASO + ' AND se_usuario = lc_usuario ';
    if ExisteSqlEx(ssql, [Sesion.UserID]) then
    begin
      iIdLiquidadorLogueado := ValorSqlEx(ssql, [Sesion.UserID]);
      Value := iIdLiquidadorLogueado;
    end;

  end;

  with fraLiquidadorABM do
  begin
    TableName := 'USE_USUARIOS';
    FieldID := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc := 'se_nombre';
    FieldBaja := 'se_fechabaja';
    ExtraFields := ' ,lc_id ';

    Sql := 'SELECT se_id id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja, lc_id ' +
           '  FROM din.dlc_liquidadorescasos, use_usuarios' +
           ' WHERE lc_fechabaja IS NULL' +
           '   AND se_usuario = lc_usuario' +
           '   AND se_fechabaja IS NULL' +
           '   AND lc_idtipocaso = ' + IDTIPOCASO;
  end;

  with fraLiquidadorModif do
  begin
    TableName := 'USE_USUARIOS';
    FieldID := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc := 'se_nombre';
    FieldBaja := 'se_fechabaja';
    ExtraFields := ' ,lc_id ';

    Sql := 'SELECT se_id id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja, lc_id ' +
           '  FROM din.dlc_liquidadorescasos, use_usuarios' +
           ' WHERE lc_fechabaja IS NULL' +
           '   AND se_usuario = lc_usuario' +
           '   AND se_fechabaja IS NULL' +
           '   AND lc_idtipocaso = ' + IDTIPOCASO;
  end;

  with fraLiquidadorReasignarCaso do
  begin
    TableName := 'USE_USUARIOS';
    FieldID := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc := 'se_nombre';
    FieldBaja := 'se_fechabaja';
    ExtraFields := ' ,lc_id ';

    Sql := 'SELECT se_id id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja, lc_id ' +
           '  FROM din.dlc_liquidadorescasos, use_usuarios' +
           ' WHERE lc_fechabaja IS NULL' +
           '   AND se_usuario = lc_usuario' +
           '   AND se_fechabaja IS NULL' +
           '   AND lc_idtipocaso = ' + IDTIPOCASO;
  end;

  with fraMotivoBaja do
  begin
    TableName := 'din.dml_motivobajaliq';
    FieldID := 'ML_ID';
    FieldCodigo := 'ML_CODIGO';
    FieldDesc := 'ML_DESCRIPCION';
    FieldBaja := 'ML_FECHABAJA';
    ExtraCondition := ' AND ML_IDTIPOCASO = ' + IDTIPOCASO;
  end;

  with fraCDPedidoDoc do
  begin
    TableName := 'ctc_textocarta';
    FieldID := 'TC_ID';
    FieldCodigo := 'TC_CODIGO';
    FieldDesc := 'TC_NOMBRE';
    FieldBaja := 'TC_FECHABAJA';
    ExtraFields := ', TC_DESTINATARIO ';

    Sql := 'SELECT tc_id id, tc_codigo codigo, tc_nombre descripcion, tc_fechabaja baja, tc_destinatario ' +
           '  FROM ctc_textocarta, cta_textoarea, cat_areatexto' +
           ' WHERE tc_id = ta_idtextocarta' +
           '   AND ta_idareatexto = at_id' +
           '   AND tc_fechabaja IS NULL' +
           '   AND ta_fechabaja IS NULL' +
           '   AND at_fechabaja IS NULL' +
           '   AND at_modulo = ''84'' ';
  end;

  fraCDPedidoDoc.OnChange := fraCDPedidoDocChange;

  fraFirmantePedidoDoc.Modulo := '84';
  fraFirmantePedidoDoc.Area := '80';

  ToolButton4.Left := 105;
  tbAceptar.Left := 110;
  tbSolicDocum.Left := 111;
  tbCasosPorLiq.Left := 115;
  tbVerListPedidosDoc.Left := 150;
  tbVerCasosRelacionados.Left := 165;
  tbHistoricoEstados.Left := 200;
  tbReasignarCaso.Left := 210;
  tbViajar.Left := 330;
  tbVerDigitalizaciones.Left := 350;

  mnuViajarLiqIncap.Enabled := frmPrincipal.mnuLiqIncapacidades.Enabled;
  mnuViajarAdmCD.Enabled := frmPrincipal.mnuAdmCartas.Enabled;

  ShowActived := false;
  vclextra.LockControls([fraLiquidadorModif]);
  lTotal.Visible  := False;

  sdqEstadoCaso.ParamByName('idtipocaso').AsString := IDTIPOCASO;

  frmLiqIncapacidades := TfrmLiqIncapacidades.Create(frmprincipal);
  frmLiqIncapacidades.MenuItem := frmPrincipal.mnuLiqIncapacidades;
  //frmLiqIncapacidades := nil;

end;

procedure TfrmSeguimCasosILP.fraMotivoIngresoABMEnter(Sender: TObject);
begin
  if (not SinEditABM.IsEmpty) then
    fraLiquidadorABM.Value := ValorSqlEx('SELECT se_id FROM art.use_usuarios, din.dlc_liquidadorescasos ' +
                                         ' WHERE se_usuario = lc_usuario ' +
                                         '   AND lc_id = art.dinerarias.get_idliquidador(art.siniestro.get_idexpediente(:sin, :ord, :rec), :idmotivo) ',
                                                 [SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida, IDTIPOCASO]);

end;

procedure TfrmSeguimCasosILP.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin

  if (not sdqConsulta.FieldByName('finactivo').IsNull) then
    AFont.Color := clRed;

  if (sdqConsulta.FieldByName('el_codigo').AsString = 'SV') or
     (sdqConsulta.FieldByName('el_codigo').AsString = 'AV') or
     (sdqConsulta.FieldByName('el_codigo').AsString = 'LV') then
    BackGround := TColor(clWebSalmon);         //$7280FA

  if (sdqConsulta.FieldByName('docvencida').AsString = 'S') then
    BackGround := TColor(clWebOrange);         //$00A5FF

  if (sdqConsulta.FieldByName('diassinaprob').AsInteger > 7) then
    BackGround := TColor(clWebGold);           //$00D7FF


end;


procedure TfrmSeguimCasosILP.mnuViajarAdmCDClick(Sender: TObject);
begin

  if (sdqConsulta.FieldByName('ex_id').AsString <> '') then
  begin
    if frmPrincipal.mnuAdmCartas.Enabled then
    begin
      frmDinerariasAdministracionCartas := TfrmDinerariasAdministracionCartas.Create(frmprincipal);
      with frmDinerariasAdministracionCartas do
      begin
        MenuItem := frmPrincipal.mnuAdmCartas;
        Area      := AREA_DIN;
        FormStyle := fsMDIChild;
        MenuItem.Enabled := False;
      end;
    end;

    with frmDinerariasAdministracionCartas do
    begin
      edSiniestro.SetValues(self.sdqConsulta.FieldByName('ex_siniestro').AsString, self.sdqConsulta.FieldByName('ex_orden').AsString,
                            self.sdqConsulta.FieldByName('ex_recaida').AsString);

      tbRefrescarClick(Nil);
      Show;
    end;

  end;

end;

procedure TfrmSeguimCasosILP.mnuViajarLiqIncapClick(Sender: TObject);
begin

  if (sdqConsulta.FieldByName('ex_id').AsString <> '') then
  begin
    if frmPrincipal.mnuLiqIncapacidades.Enabled then
    begin
      frmLiqIncapacidades := TfrmLiqIncapacidades.Create(frmprincipal);
      frmLiqIncapacidades.MenuItem := frmPrincipal.mnuLiqIncapacidades;
    end;
    with frmLiqIncapacidades do
    begin
      fraTrabajadorSIN.IdExpediente := sdqConsulta.FieldByName('ex_id').AsInteger;
      tbRefrescarClick(Nil);
      Show;
    end;
  end;

end;

procedure TfrmSeguimCasosILP.SinEditABMExit(Sender: TObject);
var ssql: string;
begin
  ssql := 'SELECT tj_nombre' +
          '  FROM comunes.ctj_trabajador, art.sex_expedientes ' +
          ' WHERE ex_idtrabajador = tj_id' +
          '   AND ex_siniestro = :sin' +
          '   AND ex_orden = :ord' +
          '   AND ex_recaida = :rec ';

   edTrabajadorABM.Text := ValorSqlEx(ssql, [SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida]);
end;

procedure TfrmSeguimCasosILP.tbAceptarClick(Sender: TObject);
var ssql: String;
begin
  Verificar((sdqConsulta.FieldByName('lc_usuario').AsString <> Sesion.UserID) and
            (not Seguridad.Claves.IsActive('Supervisor')), nil, 'No posee perfil para realizar esta acción');
  Verificar((sdqConsulta.FieldByName('el_codigo').AsString <> 'AS') and (sdqConsulta.FieldByName('el_codigo').AsString <> 'SV'),
            nil, 'Los casos a aceptar deben estar en estado ''Asignado'' o ''Asignado vencido''');

  if MsgBox('Confirma la aceptación del caso?', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    ssql := 'UPDATE din.dcl_casosparaliquidar SET cl_idestado = :idestado ' +
            ' WHERE cl_id = :idcaso';

    EjecutarSqlEx(ssql, [ValorSqlEx('select art.dinerarias.get_idestadoaliquidar(:idcaso) from dual', [sdqConsulta.FieldByName('cl_id').AsString]), sdqConsulta.FieldByName('cl_id').AsString]);
  end;

  tbRefrescarClick(nil);

end;

procedure TfrmSeguimCasosILP.tbCasosPorLiqClick(Sender: TObject);
var Reporte: TfrmRptCasosPorLiquidador;
begin
  Reporte := TfrmRptCasosPorLiquidador.Create(nil);
  try
    Reporte.Imprimir(StrToInt(IDTIPOCASO));
  finally
    Reporte.Free;
  end;

end;

procedure TfrmSeguimCasosILP.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('finactivo').AsString <> '', tbEliminar, 'El caso ya ha sido dado de baja');
  Verificar((sdqConsulta.FieldByName('lc_usuario').AsString <> Sesion.UserID) and
            (not Seguridad.Claves.IsActive('Supervisor')), tbEliminar, 'No posee perfil para realizar esta acción');
  with sdqCasosARelacionar do
  begin
    Close;
    ParamByName('idtipocaso').AsInteger := StrToInt(IDTIPOCASO);
    ParamByName('idexped').AsInteger := sdqConsulta.FieldByName('ex_id').AsInteger;
    ParamByName('idcaso').AsInteger := sdqConsulta.FieldByName('cl_id').AsInteger;
    Open;
  end;
  fraMotivoBaja.Clear;
  cbCasosARelacionar.Clear;
  fpBaja.ShowModal;

end;

procedure TfrmSeguimCasosILP.tbHistoricoEstadosClick(Sender: TObject);
begin
  with sdqHistoricoEstados do
  begin
    Close;
    ParamByName('idcaso').AsInteger := sdqConsulta.FieldByName('cl_id').AsInteger;
    Open;
  end;

  fpHistoricoEstados.ShowModal;

end;

procedure TfrmSeguimCasosILP.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  dcDesdeCaso.Clear;
  dcHastaCaso.Clear;
  dcDesdeLiquid.Clear;
  dcHastaLiquid.Clear;
  dcDesdeInactivo.Clear;
  dcHastaInactivo.Clear;
  dcDesdeBajaTrab.Clear;
  dcHastaBajaTrab.Clear;
  dcDesdeAccidente.Clear;
  dcHastaAccidente.Clear;
  fraEmpresaFiltro.Clear;
  fraTrabajadorSiniestro.Clear;
  fraEstadoSiniestro.Clear;
  fraMotivoIngreso.Clear;
  fraMotBajaTrab.Clear;
  fraLiquidador.Clear;
  rgSUSS.ItemIndex := 2;
  rgLiquidado.ItemIndex := 2;
  rgActivos.ItemIndex := 0;
  rgDocPendiente.ItemIndex := 2;
  rgConAltaMed.ItemIndex := 2;
  rgExtensionILT.ItemIndex := 2;
  rgBloqueoILT.ItemIndex := 2;
  rgDocVencida.ItemIndex := 2;
  rgSolAuditoria.ItemIndex := 2;
  rgCasosPendientes.ItemIndex := 2;
  rgConJuicio.ItemIndex := 2;
  rgGPBA.ItemIndex := 2;
  cmbEstCaso.Clear;
  cmbEstLiq.Clear;
  fraLiquidador.Value := iIdLiquidadorLogueado;

end;

procedure TfrmSeguimCasosILP.tbModificarClick(Sender: TObject);
begin
  SinEditModif.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsString, sdqConsulta.FieldByName('ex_orden').AsString,
                         sdqConsulta.FieldByName('ex_recaida').AsString);

  edTrabajadorModif.Text := sdqConsulta.FieldByName('tj_nombre').AsString;
  fraLiquidadorModif.Value := sdqConsulta.FieldByName('se_id').AsInteger;
  chkSolAudit.Checked := sdqConsulta.FieldByName('solaudit').AsString = 'S';
  chkPedidoDoc.Checked := sdqConsulta.FieldByName('cl_docpendiente').AsString = 'S';
  mObservacionModif.Text := sdqConsulta.FieldByName('observacion').AsString;

  fpModificar.ShowModal;

end;

procedure TfrmSeguimCasosILP.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  if sdqConsulta.Active and tbMostrarOcultarColumnas.Down then
  begin
    lTotal.Caption := '     Cantidad de casos: ' + IntToStr(sdqConsulta.RecordCount);
    lTotal.Visible := True;
  end
  else begin
    lTotal.Caption := '';
    lTotal.Visible := False;
  end;

end;

procedure TfrmSeguimCasosILP.tbReasignarCasoClick(Sender: TObject);
begin
  fraLiquidadorReasignarCaso.Value := sdqConsulta.FieldByName('se_id').AsInteger;
  fpReasignarCaso.ShowModal;
end;

procedure TfrmSeguimCasosILP.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql :=
          'SELECT cl_id idcaso, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, le_numliqui' +
          '       nroliq, ex_fechaaccidente faccidente, art.utiles.armar_cuit(em_cuit) cuit, em_nombre empresa,' +
          '       art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, est.tb_descripcion estadosin, ex_bajamedica' +
          '       fbajamedica, ex_altamedica faltamedica, ex_fecharecaida frecaida, TRUNC( cl_fechaalta) fingresocaso,' +
          '       hl_fechaegreso fegresotrab, el_descripcion estadocaso, li_descripcion estadoliq, DECODE(cl_idliquidacion,' +
          '       NULL, ''N'', ''S'') liquidado, DECODE(em_suss, 1, ''S'', 2, ''N'', 3, ''M'') suss, mi_descripcion motivocaso,' +
          '       mot.tb_descripcion mbajatrab, cl_fechabaja finactivo, ml_descripcion motbajacaso, lc_usuario liquidador,' +
          '       cl_docpendiente, art.liq.is_bloqueoiltempresa(em_cuit, art.actualdate) bloqueoilt,' +
          '       art.inca.is_extensionilt(ex_id) extensionilt, cl_observacion observacion, cl_solauditoria solaudit,' +
          '       DECODE(le_idchequeemitido, NULL, ''N'', ''S'') concheque, ce_numero nrocheque, che.tb_descripcion estcheque,' +
          '       art.dinerarias.get_diasenestado(cl_id) diasenestado, cl_altamanual, ev_fecha fdictamen, ev_fechaalta' +
          '       fcargadictamen, comi.tb_descripcion comisionmedica, ev_expedincapacidad expedincapacidad, ev_fecharecepcion' +
          '       frecepdictamen, art.dinerarias.get_docuvencida(cl_id) docvencida, tm_descripcion situacionddjj,' +
          '       art.dinerarias.get_situacionrevista(ex_cuil) situacionrevista, art.dinerarias.get_diasenestado(cl_id, 2)' +
          '       diasasignado, cl_id, ex_siniestro, ex_orden, ex_recaida, tj_nombre, lc_id, el_codigo, ex_id, tj_id, lc_usuario, ' +
          '       cl_idliquidador, el_pendienteliq, se_id, cl_anticipo anticipo, ev_porcincapacidad porcina, ev_grado gradoinc, ' +
          '       ev_caracter caracterinc, ev_graninc graninv, art.dinerarias.get_diassinaprob(cl_id) diassinaprob, ev_idevento, ' +
          '       art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio, siniestro.is_siniestrogobernacion(ex_id) esgpba, ' +
          '       at_id idtareasic, at_descripcion textoreclamo, ev_integral, ev_porcintegral ' +
          '  FROM din.dcl_casosparaliquidar, din.dml_motivobajaliq, din.del_estadoliq, din.dmi_motivoingresoliq,' +
          '       din.dlc_liquidadorescasos, art.sex_expedientes, aem_empresa, ctj_trabajador, art.sle_liquiempsin,' +
          '       art.ctb_tablas est, comunes.chl_historicolaboral, art.sli_estadosliquidacion, art.ctb_tablas mot,' +
          '       teso.rce_chequeemitido, art.ctb_tablas che, art.ctb_tablas comi, art.sev_eventosdetramite,  ' +
          '       emi.itm_topemasas, use_usuarios, agenda.aat_agendatarea ' +
          ' WHERE cl_idexpediente = ex_id' +
          '   AND ex_cuit = em_cuit' +
          '   AND ex_idtrabajador = tj_id' +
          '   AND ex_estado = est.tb_codigo' +
          '   AND est.tb_clave = ''SIEST''' +
          '   AND hl_motivobaja = mot.tb_codigo(+)' +
          '   AND mot.tb_clave(+) = ''MOTIB''' +
          '   AND le_idchequeemitido = ce_id(+)' +
          '   AND ce_estado = che.tb_codigo(+)' +
          '   AND che.tb_clave(+) = ''ESTCH''' +
          '   AND comi.tb_codigo(+) = ev_comision' +
          '   AND comi.tb_clave(+) = ''COMED''' +
          '   AND cl_idliquidacion = le_id(+)' +
          '   AND cl_idmotivobaja = ml_id(+)' +
          '   AND cl_idestado = el_id' +
          '   AND cl_idmotivoingreso = mi_id' +
          '   AND cl_idliquidador = lc_id(+)' +
          '   AND cl_idhistoricolaboral = hl_id(+)' +
          '   AND le_estado = li_codigo(+)' +
          '   AND cl_ideventoinca = ev_idevento(+)' +
          '   AND cl_idsituacion = tm_id(+)' +
          '   AND cl_idtareasic = at_id(+)' +
          '   AND cl_idtipocaso = ' + IDTIPOCASO + '  /*casos de ILP*/ ' +
          '   AND se_usuario = lc_usuario ' +
          '   AND se_fechabaja IS NULL ';
          //'   AND cl_fechabaja IS NULL /*filtro activos, inactivos, todos*/';

  if not dcDesdeCaso.IsEmpty then
    ssql := ssql + ' AND TRUNC(CL_FECHAALTA) >= ' + dcDesdeCaso.SqlText;

  if not dcHastaCaso.IsEmpty then
    ssql := ssql + ' AND TRUNC(CL_FECHAALTA) <= ' + dcHastaCaso.SqlText;

  if not dcDesdeLiquid.IsEmpty then
    ssql := ssql + ' AND TRUNC(LE_FPROCESO) >= ' + dcDesdeLiquid.SqlText;

  if not dcHastaLiquid.IsEmpty then
    ssql := ssql + ' AND TRUNC(LE_FPROCESO) <= ' + dcHastaLiquid.SqlText;

  if not dcDesdeInactivo.IsEmpty then
    ssql := ssql + ' AND TRUNC(CL_FECHABAJA) >= ' + dcDesdeInactivo.SqlText;

  if not dcHastaInactivo.IsEmpty then
    ssql := ssql + ' AND TRUNC(CL_FECHABAJA) <= ' + dcHastaInactivo.SqlText;

  if not dcDesdeBajaTrab.IsEmpty then
    ssql := ssql + ' AND TRUNC(CL_FECHABAJA) >= ' + dcDesdeBajaTrab.SqlText;

  if not dcHastaBajaTrab.IsEmpty then
    ssql := ssql + ' AND TRUNC(CL_FECHABAJA) <= ' + dcHastaBajaTrab.SqlText;

  if not dcDesdeAccidente.IsEmpty then
    ssql := ssql + ' AND TRUNC(EX_FECHAACCIDENTE) >= ' + dcDesdeAccidente.SqlText;

  if not dcHastaAccidente.IsEmpty then
    ssql := ssql + ' AND TRUNC(EX_FECHAACCIDENTE) <= ' + dcHastaAccidente.SqlText;

  if not fraEmpresaFiltro.IsEmpty then
    ssql := ssql + ' AND EM_ID = ' + IntToStr(fraEmpresaFiltro.ID);

  if not fraTrabajadorSiniestro.IsEmpty then
    ssql := ssql + ' AND TJ_ID = ' + IntToStr(fraTrabajadorSiniestro.IdTrabajador);

  if not fraEstadoSiniestro.IsEmpty then
    ssql := ssql + ' AND EX_ESTADO = ' + fraEstadoSiniestro.Codigo;

  if not fraMotivoIngreso.IsEmpty then
    ssql := ssql + ' AND MI_ID = ' + fraMotivoIngreso.ID;

  if not fraMotBajaTrab.IsEmpty then
    ssql := ssql + ' AND HL_MOTIVOBAJA = ' + fraMotBajaTrab.Codigo;

  if not fraLiquidador.IsEmpty then
    ssql := ssql + ' AND LC_ID = ' + fraLiquidador.sdqDatos.FieldByName('lc_id').AsString;

  case rgSUSS.ItemIndex of
    0: ssql := ssql + ' AND EM_SUSS = 1 ';
    1: ssql := ssql + ' AND EM_SUSS = 2 ';
  end;

  case rgLiquidado.ItemIndex of
    0: ssql := ssql + ' AND CL_IDLIQUIDACION IS NOT NULL ';
    1: ssql := ssql + ' AND CL_IDLIQUIDACION IS NULL ';
  end;

  case rgActivos.ItemIndex of
    0: ssql := ssql + ' AND CL_FECHABAJA IS NULL ';
    1: ssql := ssql + ' AND CL_FECHABAJA IS NOT NULL ';
  end;

  case rgDocPendiente.ItemIndex of
    0: ssql := ssql + ' AND CL_DOCPENDIENTE = ''S'' ';
    1: ssql := ssql + ' AND CL_DOCPENDIENTE = ''N'' ';
  end;

  case rgConAltaMed.ItemIndex of
    0: ssql := ssql + ' AND EX_ALTAMEDICA IS NOT NULL ';
    1: ssql := ssql + ' AND EX_ALTAMEDICA IS NULL ';
  end;

  case rgExtensionILT.ItemIndex of
    0: ssql := ssql + ' AND ART.INCA.IS_EXTENSIONILT(EX_ID) = ''S'' ';
    1: ssql := ssql + ' AND ART.INCA.IS_EXTENSIONILT(EX_ID) = ''N'' ';
  end;

  case rgBloqueoILT.ItemIndex of
    0: ssql := ssql + ' AND ART.LIQ.IS_BLOQUEOILTEMPRESA(EM_CUIT, ART.ACTUALDATE) = ''S'' ';
    1: ssql := ssql + ' AND ART.LIQ.IS_BLOQUEOILTEMPRESA(EM_CUIT, ART.ACTUALDATE) = ''N'' ';
  end;

  case rgDocVencida.ItemIndex of
    0: ssql := ssql + ' AND art.dinerarias.get_docuvencida(cl_id) = ''S'' ';
    1: ssql := ssql + ' AND art.dinerarias.get_docuvencida(cl_id) = ''N'' ';
  end;

  case rgCasosPendientes.ItemIndex of
    0: ssql := ssql + ' AND el_pendienteliq = ''S'' ';
    1: ssql := ssql + ' AND el_pendienteliq = ''N'' ';
  end;

  case rgSolAuditoria.ItemIndex of
    0: ssql := ssql + ' AND cl_solauditoria = ''S'' ';
    1: ssql := ssql + ' AND cl_solauditoria = ''N'' ';
  end;

  case rgConCheque.ItemIndex of
    0: ssql := ssql + ' AND le_idchequeemitido IS NOT NULL ';
    1: ssql := ssql + ' AND le_idchequeemitido IS NULL ';
  end;

  case rgAnticipo.ItemIndex of
    0: ssql := ssql + ' AND cl_anticipo = ''S'' ';
    1: ssql := ssql + ' AND cl_anticipo = ''N'' ';
  end;

  case rgConJuicio.ItemIndex of
    0: ssql := ssql + ' AND art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) IS NOT NULL ';
    1: ssql := ssql + ' AND art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) IS NULL ';
  end;

  case rgGPBA.ItemIndex of
    0: ssql := ssql + ' AND siniestro.is_siniestrogobernacion(EX_ID) = ''S'' ';
    1: ssql := ssql + ' AND siniestro.is_siniestrogobernacion(EX_ID) = ''N'' ';
  end;

  if cmbEstCaso.Text <> '' then
    ssql := ssql + ' AND CL_IDESTADO ' + cmbEstCaso.InSql;

  if cmbEstLiq.Text <> '' then
    ssql := ssql + ' AND LI_ID ' + cmbEstLiq.InSql;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;

  lTotal.Caption := '     Cantidad de casos: ' + IntToStr(sdqConsulta.RecordCount);
  if tbMostrarOcultarColumnas.Down then
    lTotal.Visible := True
  else
    lTotal.Visible := False;  

end;

procedure TfrmSeguimCasosILP.tbSalir2Click(Sender: TObject);
begin
  Close;

end;

procedure TfrmSeguimCasosILP.tbSalirClick(Sender: TObject);
begin
 //  Close;

end;

procedure TfrmSeguimCasosILP.tbSolicDocumClick(Sender: TObject);
begin
  SinEditPedidoDoc.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsString, sdqConsulta.FieldByName('ex_orden').AsString,
                             sdqConsulta.FieldByName('ex_recaida').AsString);

  edTrabajadorPedidoDoc.Text := sdqConsulta.FieldByName('tj_nombre').AsString;
  fraCDPedidoDoc.Clear;
  fraFirmantePedidoDoc.Limpiar;
  mObservacionPedidoDoc.Clear;
  fpPedidoDoc.ShowModal;
end;

procedure TfrmSeguimCasosILP.tbVerCasosRelacionadosClick(Sender: TObject);
begin
  with sdqCasosRelacionados do
  begin
    Close;
    ParamByName('idtipocaso').AsInteger := StrToInt(IDTIPOCASO);
    ParamByName('idexped').AsInteger := sdqConsulta.FieldByName('ex_id').AsInteger;
    ParamByName('idcaso').AsInteger := sdqConsulta.FieldByName('cl_id').AsInteger;
    Open;
  end;
  fpCasosRelacionados.ShowModal;

end;

procedure TfrmSeguimCasosILP.tbVerDigitalizacionesClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ev_idevento').AsString <> '' then
  begin
    with TfrmConsultaTIFF.Create(nil) do
    begin
      Consulta := ' SELECT rownum || ''- '' || ei_codigo || '' - '' || ei_descripcion CODIGO, ae_archivo DETALLE ' +
                  '   FROM art.sev_eventosdetramite, sae_archivoeventoinca, SIN.sei_eventoincapacidad ' +
                  '  WHERE ev_idevento = ae_idevento AND ev_codigo = ei_codigo ' +
                  '    AND ev_idevento = ' + self.sdqConsulta.FieldByName('ev_idevento').AsString;

      CampoImagen := 'DETALLE';
      ShowModal;
      Free;
    end;
  end;

end;

procedure TfrmSeguimCasosILP.tbVerListPedidosDocClick(Sender: TObject);
begin
  with sdqPedidosDoc do
  begin
    Close;
    ParamByName('idcaso').AsInteger := sdqConsulta.FieldByName('cl_id').AsInteger;
    Open;
  end;
  fpListPedidosDoc.ShowModal;
end;

procedure TfrmSeguimCasosILP.tbViajarClick(Sender: TObject);
begin
  {if (sdqConsulta.FieldByName('ex_id').AsString <> '') then
  begin
    if frmPrincipal.mnuLiqIncapacidades.Enabled then
    begin
      frmLiqIncapacidades := TfrmLiqIncapacidades.Create(frmprincipal);
      frmLiqIncapacidades.MenuItem := frmPrincipal.mnuLiqIncapacidades;
    end;
    with frmLiqIncapacidades do
    begin
      fraTrabajadorSIN.IdExpediente := sdqConsulta.FieldByName('ex_id').AsInteger;
      tbRefrescarClick(Nil);
      Show;
    end;
  end; }
end;

function TfrmSeguimCasosILP.Validar : Boolean;
begin
  //Validar := False;
  verificar(SinEditABM.IsEmpty, SinEditABM, 'Debe ingresar un siniestro');
  verificar(fraMotivoIngresoABM.IsEmpty, fraMotivoIngresoABM, 'Debe ingresar un motivo');
  verificar(fraLiquidadorABM.IsEmpty, fraLiquidadorABM, 'Debe ingresar un liquidador');
  Validar := True;
end;

procedure TfrmSeguimCasosILP.btnAceptarBajaClick(Sender: TObject);
var ssql: String;
begin
  Verificar(fraMotivoBaja.IsEmpty, fraMotivoBaja, 'Debe ingresar un motivo');
  if MsgBox('Confirma la baja del caso?', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    BeginTrans;
    try
      ssql := 'UPDATE din.dcl_casosparaliquidar SET cl_idestado = :idestado, /*estado inactivo definitivo o en suspenso*/ ' +
                    ' cl_idmotivobaja = :idmotivo, cl_usubaja = :usuario, cl_fechabaja = SYSDATE ' +
              ' WHERE cl_id = :idcaso';

      EjecutarSqlSTEx(ssql, [IIF(chkEnSuspenso.Checked, 21, 20), fraMotivoBaja.ID, Sesion.UserID,sdqConsulta.FieldByName('cl_id').AsString]);

      if cbCasosARelacionar.Text <> '' then
      begin
        ssql := ' INSERT INTO din.dcr_casosrelacion (cr_idcasomandat, cr_idcasorel, cr_fechaalta, cr_usualta)' +
                      'VALUES (:idcasosel, :idcaso, SYSDATE, :usuario)';

        EjecutarSqlSTEx(ssql, [cbCasosARelacionar.FieldValue, sdqConsulta.FieldByName('cl_id').AsString, Sesion.UserID]);
      end;

      CommitTrans;
    except
      on e: exception do
      begin
        Rollback;
        MsgBox('Error: ' + e.Message);
      end;
    end;
  end;
  fpBaja.ModalResult := mrOk;
  tbRefrescarClick(nil);
end;

procedure TfrmSeguimCasosILP.btnAceptarClick(Sender: TObject);
var ssql: String;
begin
  if Validar then
  begin
    BeginTrans;
    try
      ssql := 'INSERT INTO din.dcl_casosparaliquidar (cl_idtipocaso, cl_idexpediente, cl_idestado, cl_idmotivoingreso, ' +
                   '       cl_idliquidador, cl_usualta, cl_fechaalta, cl_altamanual) ' +
                   'VALUES (:idtipocaso, art.siniestro.get_idexpediente(:sin, :ord, :rec), 12, :idmotivo, :idliquidador, :usuario, SYSDATE, ''S'') ';

      EjecutarSqlSTEx(ssql, [IDTIPOCASO, SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida, fraMotivoIngresoABM.ID,
                             fraLiquidadorABM.sdqDatos.FieldByName('lc_id').AsInteger, Sesion.UserID]);

      ssql := 'UPDATE din.dlc_liquidadorescasos SET lc_contadorcasos = lc_contadorcasos + 1 ' +
              ' WHERE lc_id = :idliquidador';

      EjecutarSqlSTEx(ssql, [fraLiquidadorABM.sdqDatos.FieldByName('lc_id').AsInteger]);

      CommitTrans;
    except
      on e: exception do
      begin
        Rollback;
        Msgbox('Error: ' + e.Message)
      end;
    end;

    fpABM.ModalResult := mrOk;
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmSeguimCasosILP.btnAceptarModifClick(Sender: TObject);
var ssql: String;
begin

  Verificar((sdqConsulta.FieldByName('cl_docpendiente').AsString <> 'S') and (chkPedidoDoc.Checked),
                           chkPedidoDoc, 'Este campo sólo puede desmarcarse cuando no corresponda');
  BeginTrans;
  try
    ssql := 'UPDATE din.dcl_casosparaliquidar ' +
            '   SET cl_idliquidador = :idliquidadornuevo, cl_solauditoria = :solaud,' +
            '       cl_docpendiente = :docpend, cl_observacion = :observ, cl_usumodif = :usuario, cl_fechamodif = SYSDATE' +
            ' WHERE cl_id = :idcaso';
    EjecutarSqlSTEx(ssql, [fraLiquidadorModif.sdqDatos.FieldByName('lc_id').AsInteger, iif(chkSolAudit.Checked, 'S', 'N'), iif(chkPedidoDoc.Checked, 'S', 'N'),
                           mObservacionModif.Text, Sesion.UserID, sdqConsulta.FieldByName('cl_id').AsInteger]);

    CommitTrans;
  except
    on e: exception do
    begin
      Rollback;
      MsgBox('Error:' + e.Message);
    end;

  end;
  fpModificar.ModalResult := mrOk;
  tbRefrescarClick(nil);

end;

procedure TfrmSeguimCasosILP.btnAceptarPedidoDocClick(Sender: TObject);
var idCarta, ssql: String; Destinatario: TTipoDestinatario;
begin

  if ValidarPedidoDoc then
  begin
    idCarta := '';
    BeginTrans;
    try
      if not fraCDPedidoDoc.IsEmpty then
      begin

        case fraCDPedidoDoc.sdqDatos.FieldByName('tc_destinatario').AsInteger of
          1: Destinatario := tdEmpresa;
          else
             Destinatario := tdTrabajador;
          //else
             //Destinatario := tdOtros;
        end;

        idCarta := IntToStr(DoInsertarCarta(StrToInt(fraCDPedidoDoc.ID), SinEditPedidoDoc.Siniestro, SinEditPedidoDoc.Orden,
                                   SinEditPedidoDoc.Recaida, fraFirmantePedidoDoc.Codigo,
                                   AREA_DIN, False, ART_EMPTY_ID, Destinatario, '',
                                   0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, '', 0,
                                   ValorSql('SELECT at_id FROM cat_areatexto' +
                                              ' WHERE at_area = ''80'' AND at_modulo = ''84''' +
                                              '   AND at_fechabaja IS NULL')));

        ssql := ' SELECT 1 ' +
                '   FROM din.ddv_diasvencimientocd ' +
                '  WHERE dv_fechabaja IS NULL ' +
                '    AND dv_idtextocarta = :idtexto ';

        if ExisteSqlEx(ssql, [fraCDPedidoDoc.ID]) then
        begin
          ssql := 'UPDATE din.dcl_casosparaliquidar ' +
                  '   SET cl_docpendiente = ''S'', ' +
                  '       cl_usumodif = :usuario, ' +
                  '       cl_fechamodif = SYSDATE ' +
                  ' WHERE cl_id = :idcaso ';

          EjecutarSqlSTEx(ssql, [Sesion.UserID, sdqConsulta.FieldByName('cl_id').AsString]);
        end;
      end;

      ssql := 'INSERT INTO din.dpd_pedidosdocum (pd_idcaso, pd_idcarta, pd_observacion, pd_fechaalta, pd_usualta) ' +
                  ' VALUES (:idcaso, :idcarta, :observacion, SYSDATE, :usuario)';

      EjecutarSqlSTEx(ssql, [sdqConsulta.FieldByName('cl_id').AsString, idCarta, mObservacionPedidoDoc.Text, Sesion.UserID]);

      CommitTrans;
    except
      on e: exception do
      begin
        Rollback;
        MsgBox('Error: ' + e.Message);
      end;
    end;

    fpPedidoDoc.ModalResult := mrOk;
  end;

end;

procedure TfrmSeguimCasosILP.btnAceptarReasigCasoClick(Sender: TObject);
var ssql: string;
begin
  Verificar(fraLiquidadorReasignarCaso.IsEmpty, fraLiquidadorReasignarCaso, 'Debe completar este campo');
  BeginTrans;
  try
    ssql := ' UPDATE din.dcl_casosparaliquidar ' +
            '    SET cl_idliquidador = :idliq, ' +
            '        cl_usumodif = :usu, ' +
            '        cl_fechamodif = SYSDATE ' +
            '  WHERE cl_id = :idcaso ';

    EjecutarSqlSTEx(ssql, [fraLiquidadorReasignarCaso.sdqDatos.FieldByName('lc_id').AsInteger, Sesion.UserID,
                           sdqConsulta.FieldByName('cl_id').AsInteger]);

    if (fraLiquidadorReasignarCaso.sdqDatos.FieldByName('lc_id').AsInteger <> sdqConsulta.FieldByName('lc_id').AsInteger) then
    begin
      ssql := 'UPDATE din.dlc_liquidadorescasos SET lc_contadorcasos = lc_contadorcasos + 1' +
              ' WHERE lc_id = :idliquidadornuevo';
      EjecutarSqlSTEx(ssql, [fraLiquidadorReasignarCaso.sdqDatos.FieldByName('lc_id').AsInteger]);

      ssql := 'UPDATE din.dlc_liquidadorescasos SET lc_contadorcasos = GREATEST(lc_contadorcasos - 1, 1)' +
              ' WHERE lc_id = :idliquidadoranterior';
      EjecutarSqlSTEx(ssql, [sdqConsulta.FieldByName('lc_id').AsInteger]);
    end;

    CommitTrans;
  except
    on e: Exception do
    begin
      Rollback;
      MsgBox('Error:' + e.Message)
    end;
  end;

  fpReasignarCaso.ModalResult := mrOk;
  tbRefrescarClick(nil);
end;

function TfrmSeguimCasosILP.ValidarPedidoDoc: boolean;
begin

  Verificar((not fraCDPedidoDoc.IsEmpty) and (fraFirmantePedidoDoc.IsEmpty), fraFirmantePedidoDoc, 'Debe ingresar el firmante');
  Verificar((fraCDPedidoDoc.IsEmpty) and (mObservacionPedidoDoc.Text = ''), mObservacionPedidoDoc, 'Debe ingresar una observación');

  ValidarPedidoDoc := True;
end;


procedure TfrmSeguimCasosILP.fpBajaShow(Sender: TObject);
begin
  chkEnSuspenso.Checked := False;
end;

procedure TfrmSeguimCasosILP.fraCDPedidoDocChange(Sender: TObject);
var ssql: String;
begin
  if fraCDPedidoDoc.IsEmpty then
    fraFirmantePedidoDoc.Limpiar
  else
  begin

    ssql := 'SELECT fi_id' +
            '  FROM cfi_firma, cfa_firmantearea, cat_areatexto' +
            ' WHERE fi_id = fa_idfirmante AND fa_idareatexto = at_id' +
            '   AND fa_fechabaja IS NULL AND at_fechabaja IS NULL' +
            '   AND at_area = ''80'' AND at_modulo = ''84''' +
            '   AND fi_fechabaja IS NULL AND fi_codusuario = :usu';

    if ExisteSqlEx(ssql, [Sesion.UserID]) then
      fraFirmantePedidoDoc.Cargar(ValorSqlEx(ssql, [Sesion.UserID]));

  end;

end;

procedure TfrmSeguimCasosILP.ClearControls;
begin
  SinEditABM.Clear;
  edTrabajadorABM.Clear;
  fraMotivoIngresoABM.Clear;
  fraLiquidadorABM.Clear;
end;


procedure TfrmSeguimCasosILP.mnuAfipClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.afip.gob.ar/home/index.html'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuAnsesClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.anses.gob.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuSSSClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.sssalud.gov.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuARTsClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.arts.gob.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuSRTClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.srt.gob.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuBNAClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.bna.com.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuCorreoClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.correo-argentino.com'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuBcoPatagClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.bancopatagonia.com/personas/personas.shtml'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuSSNClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www2.ssn.gob.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuUARTClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.uart.org.ar/~uart'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmSeguimCasosILP.mnuInfolegClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.infoleg.gov.ar'), '', '', SW_SHOWNORMAL);
end;


end.
