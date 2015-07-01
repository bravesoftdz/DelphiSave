unit unConsCheques;
  
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ComCtrls,
  ToolWin, ExtCtrls, Mask, ToolEdit, DateComboBox, StdCtrls, IntEdit, CheckCombo, DBCheckCombo, ArtComboBox,
  ArtDBGrid, RxLookup, FormPanel, CurrEdit, FieldHider, DBTables, MemTable, RxMemDS, ComboEditor, DBComboGrid, DBCtrls,
  PatternEdit, unArtFrame, unFraCodigoDescripcion, unfraDelegacion, CardinalEdit, unfraCtbTablas, Menus,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unfraCPR_PRESTADOR, unfraEntidadCUIT, unfraVendedores,
  unfraVendedoresCUIT, unFraDomicilio, unFraTrabajador, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unFraCodDesc, unFraTrabajadorSiniestro, unFraFiltroArchivo, unArt, RxToolEdit,
  RxCurrEdit, RxPlacemnt;

type
  TfrmConsCheques = class(TfrmCustomConsulta)
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    sdqGrupoPago: TSDQuery;
    dsGrupoPago: TDataSource;
    fpReemplazo: TFormPanel;
    lbChequeRechazado: TLabel;
    Label11: TLabel;
    lbOBSERVACIONES: TLabel;
    Bevel1: TBevel;
    edOBSERVACIONES2: TMemo;
    btnAceptarReemplazo: TButton;
    btnCancelaReemplazo: TButton;
    edCHECK_ID_OLD: TIntEdit;
    edOP: TIntEdit;
    Label10: TLabel;
    edVENDOR_NAME: TEdit;
    Label13: TLabel;
    edMONTO_OLD: TCurrencyEdit;
    Label14: TLabel;
    Bevel2: TBevel;
    Label15: TLabel;
    lbBENEFICIARIO: TLabel;
    Label17: TLabel;
    edBENEFICIARIO2: TEdit;
    Label18: TLabel;
    edMONTO: TCurrencyEdit;
    Label19: TLabel;
    edFECHA_CHEQUE: TDateComboBox;
    sdqReemplazoCheque: TSDQuery;
    edGRUPO_PAGO: TEdit;
    cmbPAYMENT_METHOD_ID: TArtComboBox;
    Bevel3: TBevel;
    GridReemplazo: TDBGrid;
    btnAdd: TButton;
    dsReemplazaCH: TDataSource;
    sduReemplazaCH: TSDUpdateSQL;
    sdqReemplazaCH: TSDQuery;
    btnDel: TButton;
    lbSucursal: TLabel;
    sdqSucursal: TSDQuery;
    dsSucursal: TDataSource;
    cmbSucursal: TDBComboBox;
    sdqBanco: TSDQuery;
    dsBanco: TDataSource;
    sdqCuenta: TSDQuery;
    dsCuenta: TDataSource;
    fpModificar: TFormPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel: TBevel;
    Label16: TLabel;
    edFecha: TDateComboBox;
    edObservaciones: TMemo;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edFechaLarga: TEdit;
    fraDelegac: TfraDelegacion;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    tbCuenta: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton7: TToolButton;
    tbSalir2: TToolButton;
    fpCuentaContable: TFormPanel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel4: TBevel;
    cmbCuentaCont: TRxDBLookupCombo;
    edFechaCuentaCont: TDateComboBox;
    btnAceptarCuentaCont: TButton;
    btnCancelarCuentaCont: TButton;
    edFechaCuentaContLarga: TEdit;
    sdqCuentaCont: TSDQuery;
    dsCuentaCont: TDataSource;
    fraCE_SITUACION: TfraCtbTablas;
    sdqMetodoPagoFiltro: TSDQuery;
    dsMetodoPagoFiltro: TDataSource;
    sdqSituaciones: TSDQuery;
    dsSituaciones: TDataSource;
    mnuSeleccion: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    tbSobre: TToolButton;
    fpSobre: TFormPanel;
    btnAceptarSobres: TButton;
    btnCancelarSobres: TButton;
    rgTipo: TRadioGroup;
    gbAfiliado: TGroupBox;
    fraEmpresaSobre: TfraEmpresa;
    gbPrestador: TGroupBox;
    fraPrestadorSobre: TfraCPR_PRESTADOR;
    gbProductor: TGroupBox;
    gbEntidad: TGroupBox;
    fraEntidadSobre: TfraEntidadCUIT;
    gbVendedor: TGroupBox;
    fraVendedorSobre: TfraVendedoresCUIT;
    gbDomicilioSobre: TGroupBox;
    fpMotivoReemplazo: TFormPanel;
    lblMotReemplazo: TLabel;
    btnAceptarMotReemplazo: TButton;
    btnCancelarMotReemplazo: TButton;
    fractbMotReemplazo: TfraStaticCTB_TABLAS;
    tbExportarGD: TToolButton;
    fraBeneficiario2: TfraCodDesc;
    gbSiniestro: TGroupBox;
    fraTrabSiniestroSobre: TfraTrabajadorSiniestro;
    lbCUIT: TLabel;
    tbHistorico: TToolButton;
    tbEnvioMail: TToolButton;
    ExportDialogMails: TExportDialog;
    tbEliminarDebitado: TToolButton;
    OpenDialog: TOpenDialog;
    tbBuscarCheques: TToolButton;
    edCHEQUE: TPatternEdit;
    pgFiltros: TPageControl;
    tsFiltro1: TTabSheet;
    tsFiltro2: TTabSheet;
    grpNumCheque: TGroupBox;
    Label1: TLabel;
    edChequeDesde: TPatternEdit;
    edChequeHasta: TPatternEdit;
    grpNroOP: TGroupBox;
    Label2: TLabel;
    edOrdPagoDesde: TIntEdit;
    edOrdPagoHasta: TIntEdit;
    grpFechaOP: TGroupBox;
    Label4: TLabel;
    edFechaOrdPagoDesde: TDateComboBox;
    edFechaOrdPagoHasta: TDateComboBox;
    grpFechaCheque: TGroupBox;
    Label3: TLabel;
    edFechaChequeDesde: TDateComboBox;
    edFechaChequeHasta: TDateComboBox;
    grpMetodoPago: TGroupBox;
    cmbMetodoPago: TDBCheckCombo;
    grpEstado: TGroupBox;
    cmbEstados: TDBCheckCombo;
    grpFechaEstado: TGroupBox;
    Label8: TLabel;
    edFechaEstadoDesde: TDateComboBox;
    edFechaEstadoHasta: TDateComboBox;
    GroupBox1: TGroupBox;
    cmbGrupoPago: TDBCheckCombo;
    grpBeneficiario: TGroupBox;
    edBeneficiario: TEdit;
    grpMonto: TGroupBox;
    Label9: TLabel;
    edMontoDesde: TCurrencyEdit;
    edMontoHasta: TCurrencyEdit;
    grpBanco: TGroupBox;
    cmbBanco: TDBCheckCombo;
    grpCuenta: TGroupBox;
    cmbCuenta: TDBCheckCombo;
    grpDelegacion: TGroupBox;
    cmbDelegacion: TDBCheckCombo;
    sdqMetodoPago: TSDQuery;
    dsMetodoPago: TDataSource;
    grpFechaCuentaCont: TGroupBox;
    Label20: TLabel;
    edFechaCuentaContDesde: TDateComboBox;
    edFechaCuentaContHasta: TDateComboBox;
    grpCuentaContable: TGroupBox;
    cmbCuentaContable: TDBCheckCombo;
    rgDebitados: TRadioGroup;
    grpSituacion: TGroupBox;
    cmbSituaciones: TDBCheckCombo;
    grpFechaSituacion: TGroupBox;
    Label23: TLabel;
    edFechaSituacionDesde: TDateComboBox;
    edFechaSituacionHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    dcbFechaDebitoDesde: TDateComboBox;
    dcbFechaDebitoHasta: TDateComboBox;
    grpTrabajador: TGroupBox;
    Label25: TLabel;
    fraTrabajad: TfraTrabajador;
    GroupBox4: TGroupBox;
    edArchivoBAPRO: TIntEdit;
    GroupBox5: TGroupBox;
    edCUIT: TMaskEdit;
    GroupBox3: TGroupBox;
    chkSinExportarGD: TCheckBox;
    fraDomicilioSobre: TfraDomicilio;
    gbDelegacion: TGroupBox;
    fraDelegacionSobre: TfraDelegacion;
    lbRSocial: TLabel;
    GroupBox6: TGroupBox;
    chkTransferencias: TCheckBox;
    pnlTotalRegistros: TPanel;
    Label12: TLabel;
    edTotalRegistros: TCardinalEdit;
    edMontoCheques: TCurrencyEdit;
    tbTransferencias: TToolButton;
    edTransferencia: TIntEdit;
    Label26: TLabel;
    gbEstadoCheque: TGroupBox;
    chkSoloChequesEmitidos: TCheckBox;
    pmnuImprimir: TPopupMenu;
    mnuNotasBanco: TMenuItem;
    mnuImpResultados: TMenuItem;
    gbDerechoHabientes: TGroupBox;
    sdqDerechoHabientes: TSDQuery;
    dsDerechoHabientes: TDataSource;
    cmbDerechoHabientes: TArtComboBox;
    gbModoEnvio: TGroupBox;
    fraModoEnvio: TfraStaticCTB_TABLAS;
    mnuEnviadosDelegacion: TMenuItem;
    tbDetalleCheques: TToolButton;
    mnuChequesSituacion: TMenuItem;
    tbObservaciones: TToolButton;
    tbBuscarCodigoBarras: TToolButton;
    pmnuSobres: TPopupMenu;
    mnuSobresIndividual: TMenuItem;
    mnuSobresMasiva: TMenuItem;
    fpSobreMasivo: TFormPanel;
    btnAceptarSobresMasivo: TButton;
    btnCancelarSobresMasivo: TButton;
    GroupBox16: TGroupBox;
    fraModoEnvioMasivo: TfraStaticCTB_TABLAS;
    fpRecepcionRecibo: TFormPanel;
    btnAceptarRecepcionRecibo: TButton;
    btnCancelarRecepcionRecibo: TButton;
    rgTipoRecibo: TRadioGroup;
    edNroRecibo: TIntEdit;
    lbCalle: TLabel;
    Label27: TLabel;
    edFechaRecibo: TDateComboBox;
    Bevel5: TBevel;
    rgRecibos: TRadioGroup;
    GroupBox7: TGroupBox;
    Label28: TLabel;
    edFechaRecepcionDesde: TDateComboBox;
    edFechaRecepcionHasta: TDateComboBox;
    edNroSerieRecibo: TIntEdit;
    Label29: TLabel;
    mnuOrdenPago: TMenuItem;
    mnuCertRetencion: TMenuItem;
    rgPagoMensual: TRadioGroup;
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure edOrdPagoHastaEnter(Sender: TObject);
    procedure edChequeHastaEnter(Sender: TObject);
    procedure btnAceptarReemplazoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure LimpiaReemplazo(LimpiarBenef: Boolean);
    function IsValidar : boolean;
    function DoGuardar( nOP : Integer) : boolean;
    function DoGuardarReemplazoCH( nOP : Integer) : boolean;
    function DoUpdateSeguimientoCH( ) : boolean;
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelaReemplazoClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqReemplazaCHAfterOpen(DataSet: TDataSet);
    procedure tbCuentaClick(Sender: TObject);
    procedure btnAceptarCuentaContClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure cmbSituacionChange(Sender: TObject);
    procedure edFechaCuentaContExit(Sender: TObject);
    procedure fpModificarEnter(Sender: TObject);
    procedure tbAnulacionClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure fraEntidadSobreExit(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure fpSobreShow(Sender: TObject);
    procedure fraEmpresaSobreChange(Sender: TObject);
    procedure fraPrestadorSobreChange(Sender: TObject);
    procedure fraEntidadSobreChange(Sender: TObject);
    procedure fraVendedorSobreChange(Sender: TObject);
    procedure fraTrabSiniestroSobreChange(Sender: TObject);
    procedure btnAceptarSobresClick(Sender: TObject);
    procedure fpMotivoReemplazoEnter(Sender: TObject);
    procedure btnAceptarMotReemplazoClick(Sender: TObject);
    procedure tbExportarGDClick(Sender: TObject);
    procedure fraBeneficiario2PropiedadesChange(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure tbEnvioMailClick(Sender: TObject);
    procedure tbEliminarDebitadoClick(Sender: TObject);
    procedure tbBuscarChequesClick(Sender: TObject);
    procedure fraDelegacionSobreChange(Sender: TObject);
    procedure tbTransferenciasClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuNotasBancoClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure cmbDerechoHabientesChange(Sender: TObject);
    procedure mnuEnviadosDelegacionClick(Sender: TObject);
    procedure tbDetalleChequesClick(Sender: TObject);
    procedure mnuChequesSituacionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbObservacionesClick(Sender: TObject);
    procedure tbBuscarCodigoBarrasClick(Sender: TObject);
    procedure mnuSobresIndividualClick(Sender: TObject);
    procedure tbSobreClick(Sender: TObject);
    procedure mnuSobresMasivaClick(Sender: TObject);
    procedure fpSobreMasivoEnter(Sender: TObject);
    procedure btnAceptarSobresMasivoClick(Sender: TObject);
    procedure btnAceptarRecepcionReciboClick(Sender: TObject);
    procedure fpRecepcionReciboEnter(Sender: TObject);
    procedure rgTipoReciboClick(Sender: TObject);
    procedure mnuOrdenPagoClick(Sender: TObject);
    procedure mnuCertRetencionClick(Sender: TObject);
    procedure cmbPAYMENT_METHOD_IDChange(Sender: TObject);
  private
    pbEsDerHabientes, pbFaltaRefrescarGrilla: Boolean;
    PermisoModificacion: Boolean;
    psCheques: String;

    function GetBeneficiario(IdCheque: Integer): String;
    function GetDireccionesMailResponsableBenef: String;
    function IsNroChequeExistenteGrilla(NroCheque: String): Boolean;
    function ValidarMotReemplazo: Boolean;
    function ValidarSobres: Boolean;
    procedure CalcTotales;
    procedure DoCargarFrameDomicilioSobre(sdq: TSDQuery);
    procedure DoCargarDomicilioSobre;
    procedure DoGrabarSobre(IdCheque: TTableId; Calle, Numero, Piso, Depto, Localidad, CP: String; Provincia: Integer; IdTrabajador, IdDelegacion: TTableId; ModoEnvio: String);
    procedure DoGrabarSobres;
    procedure DoLimpiarDatosSobre;
    procedure ImprimirOP(OP: Integer);
    procedure DoCargarReemplazosCheque(Beneficiario: String; const aEsCambioBeneficiario: Boolean);
    procedure DoGrabarMotReemplazo;
    function DoReemplazoAdmArchivos(OPVieja, OPNueva: Integer): Boolean;
    function IsRegistroValidoRecepcionRecibo: Boolean;
    procedure DoGrabarRecepcionRecibo(TipoRecibo, NroSerieRecibo, NroRecibo: Integer; FechaRecibo: TDateTime);
    procedure DoGrabarRecepcionReciboOrdenPago;
    function GetProxNroCheque(IdCuentaBancaria: TTableId; var ProxNroCheque, IdTablaStockCheques: Integer): Boolean;
    procedure DoActualizarTablaStockCheques(IdTablaStockCheques: Integer);
  end;

var
  frmConsCheques: TfrmConsCheques;

implementation

uses
  unPrincipal, AnsiSql, CustomDlgs, unDmPrincipal, General, SqlFuncs, dbFuncs, unRPT_OP, unDmFinancials, DBSql,
  VCLExtra, unSesion, unGrids, StrFuncs, unMoldeEnvioMail, unComunesArchivo, unConstantArchivo, unUtilsArchivo,
  unHistoricoCheques, unComunes, unEspera, ArchFuncs, DateTimeFuncs, unTesoreria, unRptNotaPagoBancoPrestDin,
  unqrListadoEnviadosDelegacion, unDetalleCheque, unRptNotaPagoBancoLegales, unAdmInterfaces, unConsultaChequesSituacion,
  unRptCertificadoRetencion, unRptOrdenPago;

{$R *.DFM}

procedure TfrmConsCheques.tbRefrescarClick(Sender: TObject);
var
  sCuentaContable, sSqlPagoMens, sIds, sHint, sSql, sSql2: String;
begin
  sHint := IIF(psCheques = '', '', '/*+ INDEX(RCE_CHEQUEEMITIDO NDX_RCE_NUMERO) */');

  sSql := 'SELECT ' + sHint + ' CE_ID CHECK_ID, CE_BENEFICIARIO BENEFICIARIO, CE_NUMERO CHEQUE, CE_FECHACHEQUE FECHA_CHEQUE, ' +
                 'CE_METODOPAGO DESCRIPTION, CE_ORDENPAGO OP, CE_FECHAOP FECHA_OP, CE_GRUPOPAGO GRUPO_PAGO, ' +
                 'CE_MONTO MONTO, CE_ESTADO ESTADO, CTBEST.TB_DESCRIPCION ESTADO_DESCRIPCION, CTBEST.TB_ESPECIAL1 TIPOESTADO, ' +
                 'CE_FECHAESTADO FECHA_ESTADO, CE_OBSERVACIONES OBSERVACIONES, CE_IDPROVEEDOR IDPROVEEDOR, ' +
                 'CE_SITUACION SITUACION, BA_NOMBRE BANCO, BA_ID IDBANCO, CB_NUMERO CUENTA, BA_CODIGO CODBANCO, CE_DELEGACION DELEGACION, EL_NOMBRE, ' +
                 'CE_CUENTA, CE_FECHACUENTA, CE_DEBITADO, CE_FECHASITUACION FECHA_SITUAC, CTBSIT.TB_ESPECIAL1 SITCH_ESPECIAL1, ' +
                 'CTBSIT.TB_DESCRIPCION SITUAC_DESCRIPCION, CE_IDCHEQUEREEMP, CH_DESCRIPCION, CE_FECHADEBITADO, ' +
                 'TESORERIA.GET_DIRENVIOCHEQUE(CE_ID) DIRENVIOCHEQUE, CE_GIRO, TRUNC(CE_FECHAIMPRESIONNOTA) FECHAIMPRESIONNOTA, ' +
                 'CE_MOTIVOREEMPLAZO MOTIVOREEMPLAZO, CTBMOTREEMPLAZO.TB_ESPECIAL1 CODMOTIVOREEMPLAZOCTB, CE_IDARCHIVOBAPRO IDARCHIVOBAPRO, ' +
                 'CTBMOTREEMPLAZO.TB_DESCRIPCION DESCRMOTIVOREEMPLAZOCTB, SG_SECTOR SECTORGRUPOPAGO, CE_FECHAEXPORTACIONGD FEXPORTACIONGD, ' +
                 'CTBBAPRO.TB_DESCRIPCION RESPUESTABAPRO, CE_FECHARESPUESTABAPRO FECHARESPUESTABAPRO, CE_IDCUENTABANCARIA IDCUENTABANCARIA, ' +
                 'CH_ID IDCUENTACONT, TESORERIA.IS_CHEQUETRANSFERENCIA(CE_ID) ESTRANSFERENCIA, CE_IDTRANSFERENCIA, CE_OBSERVCONTADURIA OBSERVCONTADURIA, ' +
                 'TESORERIA.GET_ENVIOFONDOSCHEQUE(CE_ID) ENVIOFONDOS, CE_FECHACUENTA FECHACUENTA, DECODE(CE_IDTAREA, NULL, ''N'', ''S'') IDTAREA_EJECCUENTA, ' +
                 '(SELECT MIN(DA_LOTE) ' +
                    'FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RAR_ARCHIVO ' +
                   'WHERE AR_TIPO = 8 ' +
                     'AND DA_IDARCHIVO = AR_ID ' +
                     'AND AR_CLAVE = TRIM(TO_CHAR(CE_ORDENPAGO)) ' +
                     'AND DA_LOTE IS NOT NULL) LOTE, ' +
                  'TESORERIA.GET_NROACUSESOBRE(CE_ID) NROACUSESOBRE, DECODE(CE_TIPORECIBO, ''OP'', ''Orden de Pago Firmada'', ''RO'', ''Recibo Oficial'', NULL) TIPORECIBO, ' +
                  'DECODE(CE_NRORECIBO, NULL, NULL, SUBSTR(CE_NRORECIBO, 1, 4) || ''-'' || SUBSTR(CE_NRORECIBO, 5)) NRORECIBO, CE_FECHARECIBO FRECIBO, TRUNC(CE_FECHARECEPCION) FRECEPCION, ' +
                  'CE_ENVIADOXMAIL ENVIADOXMAIL ' +
            'FROM RSG_SECTORGRUPOPAGO, CTB_TABLAS CTBBAPRO, CTB_TABLAS CTBMOTREEMPLAZO, CTB_TABLAS CTBSIT, CTB_TABLAS CTBEST, DEL_DELEGACION, ' +
                 'ZBA_BANCO, ZCB_CUENTABANCARIA, TESO.RCH_CUENTACHEQUES, RCE_CHEQUEEMITIDO ' +
           'WHERE CE_ESTADO = CTBEST.TB_CODIGO ' +
             'AND CTBEST.TB_CLAVE = ''ESTCH'' ' +
             'AND CE_SITUACION = CTBSIT.TB_CODIGO(+) ' +
             'AND CTBSIT.TB_CLAVE(+) = ''SITCH'' ' +
             'AND CE_MOTIVOREEMPLAZO = CTBMOTREEMPLAZO.TB_CODIGO(+) ' +
             'AND CTBMOTREEMPLAZO.TB_CLAVE(+) = ''MOTRC'' ' +
             'AND CE_RESPUESTABAPRO = CTBBAPRO.TB_CODIGO(+) ' +
             'AND CTBBAPRO.TB_CLAVE(+) = ''TRABP'' ' +
             'AND CE_IDCUENTABANCARIA = CB_ID ' +
             'AND CE_DELEGACION = EL_ID(+) ' +
             'AND CB_IDBANCO = BA_ID ' +
             'AND CE_GRUPOPAGO = SG_GRUPOPAGO(+) ' +
             'AND CE_CUENTA = CH_ID(+) ';

   { - - - - - - - - - - - - - - - - - - - - - - - - - - - -}

  if (edChequeDesde.Text <> '') and (edChequeHasta.Text = '') then
     sSql := sSql + ' AND CE_NUMERO >= ' + SqlValue(edChequeDesde.Text)
  else if (edChequeDesde.Text = '') and (edChequeHasta.Text <> '') then
     sSql := sSql + ' AND CE_NUMERO <= ' + SqlValue(edChequeHasta.Text)
  else if (edChequeDesde.Text <> '') and (edChequeHasta.Text <> '') then
     sSql := sSql + ' AND CE_NUMERO BETWEEN ' + SqlValue(edChequeDesde.Text) + ' AND ' + SqlValue(edChequeHasta.Text);

  if edFechaChequeDesde.IsValid and edFechaChequeHasta.IsEmpty then
     sSql := sSql + ' AND CE_FECHACHEQUE >= ' + edFechaChequeDesde.SqlText
  else if edFechaChequeDesde.IsEmpty and edFechaChequeHasta.IsValid then
     sSql := sSql + ' AND CE_FECHACHEQUE <= ' + edFechaChequeHasta.SqlText
  else if edFechaChequeDesde.IsValid and edFechaChequeHasta.IsValid then
     sSql := sSql + ' AND CE_FECHACHEQUE BETWEEN ' + edFechaChequeDesde.SqlText + ' AND ' + edFechaChequeHasta.SqlText;

  if edOrdPagoDesde.IsFilled and edOrdPagoHasta.IsEmpty then
     sSql := sSql + ' AND CE_ORDENPAGO >= ' + edOrdPagoDesde.TextSql
  else if edOrdPagoDesde.IsEmpty and edOrdPagoHasta.IsFilled then
     sSql := sSql + ' AND CE_ORDENPAGO <= ' + edOrdPagoHasta.TextSql
  else if edOrdPagoDesde.IsFilled and edOrdPagoHasta.IsFilled then
     sSql := sSql + ' AND CE_ORDENPAGO BETWEEN ' + edOrdPagoDesde.TextSql + ' AND ' + edOrdPagoHasta.TextSql;

  if edFechaOrdPagoDesde.IsValid and edFechaOrdPagoHasta.IsEmpty then
     sSql := sSql + ' AND CE_FECHAOP >= ' + edFechaOrdPagoDesde.SqlText
  else if edFechaOrdPagoDesde.IsEmpty and edFechaOrdPagoHasta.IsValid then
     sSql := sSql + ' AND CE_FECHAOP <= ' + edFechaOrdPagoHasta.SqlText
  else if edFechaOrdPagoDesde.IsValid and edFechaOrdPagoHasta.IsValid then
     sSql := sSql + ' AND CE_FECHAOP BETWEEN ' + edFechaOrdPagoDesde.SqlText + ' AND ' + edFechaOrdPagoHasta.SqlText;

  if Trim(edBeneficiario.Text) <> '' then
     sSql := sSql + ' AND CE_BENEFICIARIO LIKE ' + SQL_QUOTE + SqlString(Trim(edBeneficiario.Text)) + SQL_WILLCARD + SQL_QUOTE;

  if cmbEstados.Text <> '' then
     sSql := sSql + ' AND CE_ESTADO ' +  cmbEstados.InSql;

  if cmbDelegacion.CheckedCount > 0 then
     sSql := sSql + ' AND CE_DELEGACION ' + cmbDelegacion.InSql;

  sSql := sSql + SqlBetween(' AND CE_FECHAESTADO', edFechaEstadoDesde.Date, edFechaEstadoHasta.Date);

  sSql := sSql + SqlBetween('AND CE_MONTO', edMontoDesde.Value, edMontoHasta.Value);

  if cmbMetodoPago.Text <> '' then
     sSql := sSql + ' AND CE_METODOPAGO ' +  cmbMetodoPago.InSql;

  if cmbGrupoPago.Text <> '' then
     sSql := sSql + ' AND UPPER(CE_GRUPOPAGO) ' +  cmbGrupoPago.InSql;

  if cmbBanco.Text <> '' then
     sSql := sSql + ' AND BA_ID ' +  cmbBanco.InSql;

  if cmbCuenta.Text <> '' then
     sSql := sSql + ' AND CB_ID ' +  cmbCuenta.InSql;

  sSql := sSql + SqlBetween(' AND CE_FECHACUENTA', edFechaCuentaContDesde.Date, edFechaCuentaContHasta.Date) +
                 SqlBetween(' AND CE_FECHASITUACION', edFechaSituacionDesde.Date, edFechaSituacionHasta.Date) +
                 SqlBetween(' AND CE_FECHARECEPCION', edFechaRecepcionDesde.Date, edFechaRecepcionHasta.Date);

  sCuentaContable := cmbCuentaContable.InSql;
  if Pos('-1', sCuentaContable) > 0 then
  begin
    if cmbCuentaContable.CheckedCount = 1 then
    begin
      if Pos('-1', cmbCuentaContable.InSql) > 0 then
        sSql := sSql + ' AND CE_CUENTA IS NULL ';
    end
    else
      if cmbCuentaContable.Text <> '' then
        sSql := sSql + ' AND (CE_CUENTA ' + cmbCuentaContable.InSql + ' OR CE_CUENTA IS NULL) ';
  end
  else
    if cmbCuentaContable.Text <> '' then
      sSql := sSql + ' AND CE_CUENTA ' + cmbCuentaContable.InSql;

  if cmbSituaciones.Text <> '' then
     sSql := sSql + ' AND CE_SITUACION ' +  cmbSituaciones.InSql;

  case rgDebitados.ItemIndex of
    1: sSql := sSql + ' AND CE_DEBITADO = ''S'' ';
    2: sSql := sSql + ' AND CE_DEBITADO = ''N'' ';
  end;

  sSqlPagoMens := '(SELECT 1 ' +
                     'FROM ART.SLE_LIQUIEMPSIN, ART.SCP_CONPAGO ' +
                    'WHERE LE_CONPAGO = CP_CONPAGO ' +
                      'AND CP_ESPAGOMENSUAL = ''S'' ' +
                      'AND CP_TIPO = ''P'' ' +
                      'AND LE_IDCHEQUEEMITIDO = CE_ID)';
  case rgPagoMensual.ItemIndex of
    1: sSql := sSql + ' AND EXISTS ' + sSqlPagoMens;
    2: sSql := sSql + ' AND NOT EXISTS ' + sSqlPagoMens;
  end;

  case rgRecibos.ItemIndex of
    1: sSql := sSql + ' AND CE_FECHARECEPCION IS NULL AND CE_FECHAOP >= TO_DATE(''20/05/2013'', ''DD/MM/YYYY'') AND UPPER(CE_GRUPOPAGO) <> ' + SqlValue(UpperCase(SINIESTROS_LOOKUP)) + ' ';
    2: sSql := sSql + ' AND CE_FECHARECEPCION IS NOT NULL ';
  end;

  if not dcbFechaDebitoDesde.IsEmpty then
    sSql := sSql + ' AND CE_FECHADEBITADO >= ' + SqlValue(dcbFechaDebitoDesde.Date);

  if not dcbFechaDebitoHasta.IsEmpty then
    sSql := sSql + ' AND CE_FECHADEBITADO <= ' + SqlValue(dcbFechaDebitoHasta.Date);

  if fraTrabajad.IsSelected then
   sSql := sSql + ' AND CE_ID IN (SELECT LE_IDCHEQUEEMITIDO ' +
                                   'FROM SLE_LIQUIEMPSIN, SEX_EXPEDIENTES ' +
                                  'WHERE LE_SINIESTRO = EX_SINIESTRO ' +
                                    'AND LE_ORDEN = EX_ORDEN ' +
                                    'AND LE_RECAIDA = EX_RECAIDA ' +
                                    'AND LE_CONPAGO <> ' + SqlValue(CONCEPTO_ILT_REINTEGRO) + ' ' +
                                    'AND EX_CUIL = ' + SqlValue(fraTrabajad.CUIL) + ' ' +
                                  'UNION ALL ' +
                                 'SELECT PR_IDCHEQUEEMITIDO ' +
                                   'FROM SPR_PAGOEXPESIN, SEX_EXPEDIENTES ' +
                                  'WHERE PR_SINIESTRO = EX_SINIESTRO ' +
                                    'AND PR_ORDEN = EX_ORDEN ' +
                                    'AND PR_RECAIDA = EX_RECAIDA ' +
                                    'AND PR_ACREEDOR = ''TA'' ' +
                                    'AND EX_CUIL = ' + SqlValue(fraTrabajad.CUIL) + ')';

  if chkSinExportarGD.Checked then
     sSql := sSql + ' AND CE_FECHAEXPORTACIONGD IS NULL';

  if MaxRegistros > 0 then
     sSql := sSql + 'AND ROWNUM <= ' + SqlInt(MaxRegistros);

  if edArchivoBAPRO.IsFilled then
    sSql := sSql + ' AND CE_IDARCHIVOBAPRO = ' + SqlValue(edArchivoBAPRO.Value);

  if not edTransferencia.IsEmpty then
    sSql := sSql + ' AND CE_IDTRANSFERENCIA = ' + SqlValue(edTransferencia.Value);

  if edCuit.Text <> '' then
    begin
      sIds  := '';
      sSql2 := 'SELECT DISTINCT VENDOR_ID ID ' +
                  'FROM PO_VENDORS ' +
                 'WHERE END_DATE_ACTIVE IS NULL ' +
                   'AND (REPLACE(VAT_REGISTRATION_NUM, ''-'') = :Cuit ' +
                    'OR (GLOBAL_ATTRIBUTE10 = ''ARTID'' ' +
                        'AND SUBSTR(GLOBAL_ATTRIBUTE4, 1, 11) = :Cuit))';

      with dmFinancials.GetQueryEx(sSql2, [edCuit.Text, edCuit.Text]) do
        try
          while not Eof do
            begin
              sIds := sIds + FieldByName('ID').AsString + ', ';

              Next;
            end;
        finally
          Free;
        end;

      if not IsEmptyString(sIds) then
        begin
          sIds := CutRight(sIds, 2);
          sSql := sSql + ' AND CE_IDPROVEEDOR IN (' + sIds + ')';
        end;
    end;

  if chkTransferencias.Checked then
    sSql := sSql + ' AND TESORERIA.IS_CHEQUETRANSFERENCIA(CE_ID) = ''S''';

  if chkSoloChequesEmitidos.Checked then
    sSql := sSql + ' AND CE_ESTADO = ''01'''; 	// EMITIDO

  sSql := sSql + IIF(psCheques = '', '', ' AND CE_NUMERO IN (' + psCheques + ')');

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy ;

  inherited;
  pbFaltaRefrescarGrilla := False;

  if tbSumatoria.Down then
    CalcTotales;

  if sdqConsulta.IsEmpty then
    tbPropiedades.Enabled := False
  else
    tbPropiedades.Enabled := True;
end;

procedure TfrmConsCheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmFinancials.Desconectar;
end;

procedure TfrmConsCheques.FormCreate(Sender: TObject);
begin
  dmFinancials.Conectar;
  PermisoModificacion := Seguridad.Activar(tbModificar);

  inherited;

  IMG_FILTROS_SHOW := 11;
  IMG_FILTROS_HIDE := 10;

  tbPropiedades.Enabled := False;

  psCheques := '';

  OpenQuery(sdqMetodoPago);
  OpenQuery(sdqMetodoPagoFiltro);
  OpenQuery(sdqEstados);
  OpenQuery(sdqGrupoPago);
  OpenQuery(sdqSucursal);
  OpenQuery(sdqReemplazaCH);
  OpenQuery(sdqBanco);
  OpenQuery(sdqCuenta);
  OpenQuery(sdqDelegacion);
  OpenQuery(sdqCuentaCont);
  OpenQuery(sdqSituaciones);

  with fraCE_SITUACION do
  begin
    Clave     := 'SITCH';
    ShowBajas := False;
    OnChange  := cmbSituacionChange;

    if Sesion.Sector = 'BPAGOS' then
      Especial2 := 'B'
    else if Sesion.Sector <> 'TESO' then
      Especial2 := 'D'
    else if not Seguridad.Claves.IsActive('Ver BAPROPAGOS') then
      ExtraCondition := 'AND TB_ESPECIAL2 <> ''B'' ';
  end;

  with fraDelegac.cmbDescripcion do
  begin
    Columns[2].Visible := False;
    Columns[3].Visible := False;
    Columns[4].Visible := False;
  end;
  fraDelegac.OnLine := False;

  with fraEmpresaSobre do
  begin
    Onchange  := fraEmpresaSobreChange;
    ShowBajas := True;
  end;

  with fraDelegacionSobre do
  begin
    Onchange  := fraDelegacionSobreChange;
    OnLine    := False;
    ShowBajas := False;
  end;

  with fraPrestadorSobre do
  begin
    Onchange  := fraPrestadorSobreChange;
    ShowBajas := True;
  end;

  with fraEntidadSobre do
  begin
    Onchange  := fraEntidadSobreChange;
    ShowBajas := True;
  end;

  with fraVendedorSobre do
  begin
    Onchange  := fraVendedorSobreChange;
    ShowBajas := True;
  end;

  with fraTrabSiniestroSobre do
  begin
    Onchange  := fraTrabSiniestroSobreChange;
    ShowBajas := True;
  end;

  with fractbMotReemplazo do
  begin
  	Clave     := 'MOTRC';
    ShowBajas := False;
  end;

  with fraModoEnvio do
  begin
  	Clave     := 'MOENS';
    ShowBajas := False;
  end;

  with fraModoEnvioMasivo do
  begin
  	Clave     := 'MOENS';
    ShowBajas := False;
  end;

  pgFiltros.ActivePage := tsFiltro1;
end;

procedure TfrmConsCheques.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edChequeDesde.Clear;
  edChequeHasta.Clear;
  edFechaChequeDesde.Clear;
  edFechaChequeHasta.Clear;
  edOrdPagoDesde.Clear;
  edOrdPagoHasta.Clear;
  edFechaOrdPagoDesde.Clear;
  edFechaOrdPagoHasta.Clear;
  edMontoDesde.Value := 0;
  edMontoHasta.Value := 0;
  edBeneficiario.Clear;
  cmbEstados.ClearChecks;
  cmbSituaciones.ClearChecks;
  edFechaEstadoDesde.Clear;
  edFechaEstadoHasta.Clear;
  cmbMetodoPago.ClearChecks;
  cmbGrupoPago.Clear;
  cmbBanco.Clear;
  cmbCuenta.Clear;
  cmbDelegacion.Clear;
  edTotalRegistros.Value := 0;
  edMontoCheques.Value   := 0;
  edFechaCuentaContDesde.Clear;
  edFechaCuentaContHasta.Clear;
  edFechaSituacionDesde.Clear;
  edFechaSituacionHasta.Clear;
  cmbCuentaContable.Clear;
  rgDebitados.ItemIndex   := 0;
  rgPagoMensual.ItemIndex := 0;
  dcbFechaDebitoDesde.Clear;
  dcbFechaDebitoHasta.Clear;
  fraTrabajad.Clear;
  chkSinExportarGD.Checked  := False;
  chkTransferencias.Checked := False;
  edArchivoBAPRO.Clear;
  edCUIT.Clear;
  edTransferencia.Clear;
  psCheques := '';
  rgRecibos.ItemIndex := 0;
  edFechaRecepcionDesde.Clear;
  edFechaRecepcionHasta.Clear;

  pgFiltros.ActivePage := tsFiltro1;
  edChequeDesde.SetFocus;
end;

procedure TfrmConsCheques.tbModificarClick(Sender: TObject);
var
  i: Integer;
  sSql2, sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe seleccionado ningún cheque para ser modificado.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  sSql := 'SELECT 1 ' +
            'FROM CTB_TABLAS ' +
           'WHERE (TB_ESPECIAL2 = ''B'' OR TB_ESPECIAL1 = ''B'') ' +
             'AND TB_FECHABAJA IS NULL ' +
             'AND TB_CLAVE = ''SITCH'' ' +
             'AND TB_CODIGO = :Situ';

  sSql2 := 'SELECT 1 ' +
             'FROM CTB_TABLAS ' +
            'WHERE TB_ESPECIAL1 = ''E'' ' +
              'AND TB_FECHABAJA IS NULL ' +
              'AND TB_CLAVE = ''SITCH'' ' +
              'AND TB_CODIGO = :Situ';

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

    Verificar((Sesion.Sector <> 'BPAGOS') and not Seguridad.Claves.IsActive('Ver BAPROPAGOS') and ExisteSqlEx(sSql, [sdqConsulta.FieldByName('SITUACION').AsString]), Grid, 'No tiene permiso para cambiar la situación del cheque: ' + sdqConsulta.FieldByName('CHEQUE').AsString + '.');
    Verificar(not Seguridad.Claves.IsActive('PermitirModificarSituacionEntregado') and ExisteSqlEx(sSql2, [sdqConsulta.FieldByName('SITUACION').AsString]), Grid, 'No tiene permiso para cambiar la situación de entregado del cheque: ' + sdqConsulta.FieldByName('CHEQUE').AsString + '.');
  end;

  edFecha.Date := DBDate;
  if Grid.SelectedRows.Count = 1 then
  begin
    fraCE_SITUACION.Value      := sdqConsulta.FieldByName('SITUACION').AsString;
    edFecha.MinDate            := sdqConsulta.FieldByName('FECHA_CHEQUE').AsDateTime;
    edObservaciones.Lines.Text := sdqConsulta.FieldByName('OBSERVACIONES').AsString;
    fraDelegac.Value           := sdqConsulta.FieldByName('DELEGACION').AsInteger;

    VCLExtra.LockControl(fraDelegac, (fraCE_SITUACION.Especial1 <> 'D') or (Sesion.Delegacion <> 840));
  end
  else
  begin
    fraCE_SITUACION.Clear;
    edObservaciones.Lines.Text := '';
    fraDelegac.Clear;
  end;

  edFechaExit(nil);

  fpModificar.ShowModal;
end;

procedure TfrmConsCheques.btnAceptarClick(Sender: TObject);
var
  Sql: TDBSql;
  i: Integer;
  sSql: String;
  bCargarRecepcionRecibos: Boolean;
begin
  Verificar(fraCE_SITUACION.IsEmpty, fraCE_SITUACION.edCodigo, 'La situación es obligatoria.');
  Verificar((fraCE_SITUACION.Especial1 = 'D') and fraDelegac.IsEmpty, fraDelegac.edCodigo, 'La delegación es obligatoria.');
  Verificar(edFecha.IsEmpty, edFecha, 'La fecha es obligatoria.');
  Verificar(edFecha.Date > DBDate, edFecha, 'La fecha no puede ser mayor a la actual.');

  bCargarRecepcionRecibos := False;
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

    Verificar(not sdqConsulta.FieldByName('CE_FECHADEBITADO').IsNull and (edFecha.Date > sdqConsulta.FieldByName('CE_FECHADEBITADO').AsDateTime), Grid, 'El cheque: ' + sdqConsulta.FieldByName('CHEQUE').AsString + ' ya ha sido debitado - Consulte con Tesorería.');
    Verificar((fraCE_SITUACION.Value = '26') and (sdqConsulta.FieldByName('SITUACION').AsString <> '27'), Grid, 'El cheque: ' + sdqConsulta.FieldByName('CHEQUE').AsString + ' no ha sido aún recibido en BAPROPAGOS.');   // 26: ENTREGADO EN BAPROPAGOS - 27: RECIBIDO EN BAPROPAGOS
    Verificar((fraCE_SITUACION.Value = '27') and (sdqConsulta.FieldByName('SITUACION').AsString <> '28'), Grid, 'El cheque: ' + sdqConsulta.FieldByName('CHEQUE').AsString + ' no ha sido aún enviado a BAPROPAGOS.');     // 27: RECIBIDO EN BAPROPAGOS - 28: ENVIADO A BAPROPAGOS
    Verificar((fraCE_SITUACION.Value = '12') and (sdqConsulta.FieldByName('SITUACION').AsString <> '14'), Grid, 'El cheque: ' + sdqConsulta.FieldByName('CHEQUE').AsString + ' no ha sido aún recibido en la delegación.');   // 12: ENTREGADO EN DELEGACION - 14: RECIBIDO EN DELEGACION

    sSql := 'SELECT 1 ' +
              'FROM RSO_SOBRE ' +
             'WHERE SO_IDCHEQUEEMITIDO = :IdCheque ' +
               'AND SO_FECHABAJA IS NULL';
    Verificar((fraCE_SITUACION.Value = '07') and not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('CHECK_ID').AsInteger]), Grid, 'No se ha enviado el sobre del cheque: ' + sdqConsulta.FieldByName('CHEQUE').AsString + '.');   // 07: ENVIADO POR CORREO

    bCargarRecepcionRecibos := bCargarRecepcionRecibos or IsRegistroValidoRecepcionRecibo();
  end;

  try
    BeginTrans;

    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        Sql := TDBSql.Create('RCE_CHEQUEEMITIDO');
        try
          Sql.SqlType := stUpdate;

          Sql.PrimaryKey.Add('CE_ID',          sdqConsulta.FieldByName('CHECK_ID').AsInteger);
          Sql.Fields.Add('CE_SITUACION',       fraCE_SITUACION.Value);
          Sql.Fields.Add('CE_FECHASITUACION',  edFecha.Date);
          Sql.Fields.Add('CE_USUSITUACION',    Sesion.UserID);
          Sql.Fields.Add('CE_OBSERVACIONES',   edObservaciones.Lines.Text);

          if fraDelegac.IsSelected then
            Sql.Fields.Add('CE_DELEGACION', fraDelegac.Value);

          EjecutarSqlST(Sql.Sql);

          if fraCE_SITUACION.Value = '29' then  // 29: DEPOSITO EN CUENTA BANCARIA
            DoInsertarSobreLiquidacionILTP(sdqConsulta.FieldByName('CHECK_ID').AsInteger);
        finally
          Sql.Free;
        end;
      end;

    CommitTrans;

    if fraCE_SITUACION.Especial1 = 'E' then   // Entregado
      begin
        if bCargarRecepcionRecibos then
          fpRecepcionRecibo.ShowModal;

        DoGrabarRecepcionReciboOrdenPago;
      end;

    sdqConsulta.Refresh;
    fpModificar.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      RollBack;

      raise Exception.Create(E.Message + CRLF + 'Error al grabar la situación.');
    end;
  end;
end;

procedure TfrmConsCheques.edFechaExit(Sender: TObject);
begin
  edFechaLarga.Text := edFecha.LongDate;
end;

procedure TfrmConsCheques.edOrdPagoHastaEnter(Sender: TObject);
begin
  if (edOrdPagoHasta.IsEmpty) and (not edOrdPagoDesde.IsEmpty) then
    edOrdPagoHasta.Text := edOrdPagoDesde.Text;
end;

procedure TfrmConsCheques.edChequeHastaEnter(Sender: TObject);
begin
  if (edChequeHasta.Text = '') and (edChequeDesde.Text <> '') then
    edChequeHasta.Text := edChequeDesde.Text;
end;

procedure TfrmConsCheques.btnAceptarReemplazoClick(Sender: TObject);
var
  nOP: Integer;
  nTotalGrilla: Currency;
begin
  nTotalGrilla := SumField(sdqReemplazaCH, 'MONTO');

  Verificar(edMONTO_OLD.Text <> FloatToStr(nTotalGrilla), btnAceptarReemplazo,
            'El importe del cheque original es distinto a la suma de los reemplazos.');

  if not sdqReemplazaCH.IsEmpty then
    begin
      BeginTrans(True);
      try
        nOP := GetSecNextVal('SEQ_RRC_ID');
        sdqReemplazaCH.First;

        while not sdqReemplazaCH.Eof do
        begin
          DoGuardar(nOP);
          sdqReemplazaCH.Next;
        end;

        DoGuardarReemplazoCH(nOP);
        DoUpdateSeguimientoCH();

        if DoReemplazoAdmArchivos(edOP.Value, nOP) then
          begin
            CommitTrans(True);
            MsgBox('El reemplazo se realizó con éxito.' + Chr(13) + 'Nro. Orden de Pago: ' + IntToStr(nOP), MB_ICONEXCLAMATION, 'Atención');

            // Impresión de la OP.
            ImprimirOP(nOP);

            tbRefrescar.Click;
            btnCancelaReemplazo.Click;
          end
        else
          RollBack(True);
      except
        on E: Exception do
        begin
          RollBack(True);

          raise Exception.Create(E.Message + CRLF + 'Error al realizar el reemplazo.');
        end;
      end;
    end;
end;

procedure TfrmConsCheques.tbEliminarClick(Sender: TObject);
var
  sBeneficiario, Estado: String;
  iCodConc: Integer; 
begin
  pbFaltaRefrescarGrilla := False;

  Verificar(sdqConsulta.IsEmpty, nil, 'No existe seleccionado ningún cheque para ser reemplazado.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');
  Verificar(not ExisteSql('SELECT 1 ' +
                            'FROM RCC_CIERRECAJA ' +
                           'WHERE CC_TIPO = ''E'' ' +
                             'AND CC_ACTIVA = ''S'''), nil, 'No existe una caja de egreso abierta.');

  Estado := ValorSqlEx('SELECT TB_ESPECIAL1 ' +
                         'FROM CTB_TABLAS, RCE_CHEQUEEMITIDO ' +
                        'WHERE TB_CLAVE = :Clave ' +
                          'AND CE_ESTADO = TB_CODIGO ' +
                          'AND CE_ID = :Id', ['ESTCH', sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

  Verificar(Estado = 'R', nil, 'El cheque ya fue reemplazado.');
  Verificar(Estado = 'A', nil, 'No se puede reemplazar un cheque anulado.');
  Verificar((sdqConsulta.FieldByName('CE_DEBITADO').AsString = 'S'), nil, 'No se puede reemplazar un cheque debitado por el banco.');
  Verificar(AreIn(sdqConsulta.FieldByName('IDCUENTACONT').AsString, ['2', '3']), nil, 'No se puede reemplazar un cheque bajo las cuentas contables: Baja por Siniestros o Prescriptos.');

  if AreIn(sdqConsulta.FieldByName('DESCRIPTION').AsString, [MP_DEBITOAUTOMATICO, MP_PAGOELECTRONICO, MP_TRANSFERENCIA]) then
    iCodConc := 5
  else
    iCodConc := 4;

  sSql := 'SELECT COUNT(*) ' +
            'FROM OMB_MOVIMIENTOBANCO ' +
           'WHERE MB_IDCOMP = :id ' +
             'AND MB_IDCUENTABANCARIA = :idcuentabancaria ' +
             'AND MB_IDCODIGOCONC = :codconc ' +
             'AND MB_CONCILIADO = ''N''';
  Verificar(ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('CHECK_ID').AsInteger, sdqConsulta.FieldByName('IDCUENTABANCARIA').AsInteger, iCodConc]) > 1, nil, 'No puede efectuar el reemplazo hasta que se concilien los movimientos pendientes.');

  if sdqConsulta.Active then
  begin
    if sdqConsulta.FieldByName('MOTIVOREEMPLAZO').IsNull then
    begin
      if fpMotivoReemplazo.ShowModal = mrOk then
      begin
        pbFaltaRefrescarGrilla := True;

        if fractbMotReemplazo.Especial1 = 'B' then   // es Beneficiario
        begin
                {
                sDirecciones := GetDireccionesMailResponsableBenef;
                sAsunto      := 'Reemplazo de Cheque';
                sMensaje     := 'Se desea reemplazar el cheque Nro. ' + sdqConsulta.FieldByName('CHEQUE').AsString + ' de $' + FloatToStr(sdqConsulta.FieldByName('MONTO').AsCurrency) + '.' + CRLF + 'Por favor ingrese el nuevo beneficiario.';

                EnviarMailBD(sDirecciones, sAsunto, [oAutoFirma], sMensaje, nil, 0, tcDefault, True);
                }
        end
        else
          DoCargarReemplazosCheque(sdqConsulta.FieldByName('BENEFICIARIO').AsString, False);
      end;
    end
    else if sdqConsulta.FieldByName('CODMOTIVOREEMPLAZOCTB').AsString = 'B' then   // es Beneficiario
    begin
      sBeneficiario := GetBeneficiario(sdqConsulta.FieldByName('CHECK_ID').AsInteger);
      Verificar(sBeneficiario = '', nil, 'Aún no se ha cargado el beneficiario del cheque.');

      DoCargarReemplazosCheque(sBeneficiario, True);
    end
    else
      DoCargarReemplazosCheque(sdqConsulta.FieldByName('BENEFICIARIO').AsString, False);

    if pbFaltaRefrescarGrilla then
      tbRefrescar.Click;
  end;
end;

function TfrmConsCheques.IsValidar: Boolean;
var
  sSql: String;
begin
  Verificar(edCHEQUE.Text = '', edCHEQUE, 'El número de Cheque no puede quedar en blanco.');
  Verificar(IsNroChequeExistenteGrilla( edCHEQUE.Text ), edCHEQUE, 'El número de cheque ya existe en la grilla.');
  Verificar(edFECHA_CHEQUE.IsEmpty, edFECHA_CHEQUE, 'La fecha del Cheque no puede quedar en blanco.');
  Verificar((edBENEFICIARIO2.Text = ''), nil, 'El beneficiario del Cheque no puede quedar en blanco.');
  Verificar(cmbPAYMENT_METHOD_ID.Text = '', cmbPAYMENT_METHOD_ID, 'El método de pago no puede quedar en blanco.');

  sSql := 'SELECT 1 ' +
            'FROM RCE_CHEQUEEMITIDO ' +
           'WHERE CE_NUMERO = :NUMERO ' +
             'AND CE_IDCUENTABANCARIA = :IDCUENTABANCARIA';
  Verificar(ExisteSqlEx(sSql, [edCHEQUE.Text, sdqMetodoPago.FieldByName('ID_CUENTA').AsInteger]), edCHEQUE, 'El número de cheque ya existe.');

  Verificar(edMONTO.Value = 0, edMONTO, 'El monto del Cheque no puede quedar en blanco.');

  Result := True;
end;

function TfrmConsCheques.DoGuardar(nOP: Integer): Boolean;
var
  SqlTrans: TDBSql;
  RCEId, IdCuentaBancaria: TTableId;
  iOPAnterior: Integer;
begin
  // Insert en RCE_CHEQUEEMITIDO el cheque nuevo.
  SqlTrans := TDBSql.Create('RCE_CHEQUEEMITIDO');
  try
    Result := False;

    IdCuentaBancaria := sdqReemplazaCH.FieldByName('ID_CUENTA').AsInteger;
    RCEId            := GetSecNextVal('SEQ_RCE_ID');

    SqlTrans.PrimaryKey.Add('CE_ID', RCEId);
    SqlTrans.Fields.Add('CE_BENEFICIARIO',        sdqReemplazaCH.FieldByName('BENEFICIARIO').AsString);
    SqlTrans.Fields.Add('CE_NUMERO',              sdqReemplazaCH.FieldByName('CHEQUE').AsString);
    SqlTrans.Fields.Add('CE_ORDENPAGO',           nOP);
    SqlTrans.Fields.Add('CE_FECHACHEQUE',         sdqReemplazaCH.FieldByName('FECHA_CHEQUE').AsDateTime);
    SqlTrans.Fields.Add('CE_FECHAOP',             sdqReemplazaCH.FieldByName('FECHA_OP').AsDateTime);
    SqlTrans.Fields.Add('CE_FECHASITUACION',      sdqReemplazaCH.FieldByName('FECHA_SITUACION').AsDateTime);
    SqlTrans.Fields.AddExtended('CE_MONTO',       sdqReemplazaCH.FieldByName('MONTO').asCurrency, ALL_DECIMALS, False);
    SqlTrans.Fields.Add('CE_ESTADO',              '01');
    SqlTrans.Fields.Add('CE_FECHAESTADO',         sdqReemplazaCH.FieldByName('FECHA_ESTADO').AsDateTime);
    SqlTrans.Fields.Add('CE_OBSERVACIONES',       sdqReemplazaCH.FieldByName('OBSERVACIONES').AsString);
    SqlTrans.Fields.Add('CE_METODOPAGO',          sdqReemplazaCH.FieldByName('DESCRIPTION').AsString);
    SqlTrans.Fields.Add('CE_GRUPOPAGO',           sdqReemplazaCH.FieldByName('GRUPO_PAGO').AsString);
    SqlTrans.Fields.Add('CE_IDFINANCIALS',        SQL_NULL, False);
    SqlTrans.Fields.Add('CE_IDCHEQUEREEMP',       sdqConsulta.FieldByName('CHECK_ID').AsInteger);
    SqlTrans.Fields.Add('CE_IDPROVEEDOR',         sdqConsulta.FieldByName('IDPROVEEDOR').AsInteger);
    SqlTrans.Fields.Add('CE_IDCUENTABANCARIA',    IdCuentaBancaria);
    SqlTrans.Fields.Add('CE_USUESTADO',           Sesion.UserID );
    SqlTrans.Fields.Add('CE_DELEGACION',          840, False);
    SqlTrans.Fields.Add('CE_SECUENCIATRAZABIL',   GetIdSecTrazabilidad(ID_CARPETA_TESORERIA), True);

    SqlTrans.SqlType := stInsert;
    SqlTrans.ExecuteST;

    sSql := 'UPDATE ART.SLE_LIQUIEMPSIN ' +
               'SET LE_IDCHEQUEEMITIDO = :ce_id ' +
             'WHERE LE_IDCHEQUEEMITIDO = :ce_idchequereemp';
    EjecutarSqlSTEx(sSql, [RCEId, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

    sSql := 'UPDATE ART.SPR_PAGOEXPESIN ' +
               'SET PR_IDCHEQUEEMITIDO = :ce_id ' +
             'WHERE PR_IDCHEQUEEMITIDO = :ce_idchequereemp';
    EjecutarSqlSTEx(sSql, [RCEId, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

    sSql := 'UPDATE LEGALES.LPL_PAGOLEGAL ' +
               'SET PL_IDCHEQUEEMITIDO = :ce_id ' +
             'WHERE PL_IDCHEQUEEMITIDO = :ce_idchequereemp';
    EjecutarSqlSTEx(sSql, [RCEId, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

    sSql := 'UPDATE COM.XFC_FACTURA ' +
               'SET FC_IDCHEQUEEMITIDO = :ce_id ' +
             'WHERE FC_IDCHEQUEEMITIDO = :ce_idchequereemp';
    EjecutarSqlSTEx(sSql, [RCEId, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

    sSql := 'SELECT CE_ORDENPAGO ' +
              'FROM RCE_CHEQUEEMITIDO ' +
             'WHERE CE_ID = :Id';
    iOPAnterior := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

    sSql := 'UPDATE ART.SVO_VOLANTES ' +
               'SET VO_ORDENPAGO = :op, ' +
                   'VO_CHEQUE = :cheque, ' +
                   'VO_FECHACHEQUE = :fecha_cheque, ' +
                   'VO_FECHAORDENPAGO = :fecha_op ' +
             'WHERE VO_ORDENPAGO = :op_anterior';
    EjecutarSqlSTEx(sSql, [nOP, sdqReemplazaCH.FieldByName('CHEQUE').AsString, TDateTimeEx.Create(sdqReemplazaCH.FieldByName('FECHA_CHEQUE').AsDateTime), TDateTimeEx.Create(sdqReemplazaCH.FieldByName('FECHA_OP').AsDateTime), iOPAnterior]);

    Result := True;
  finally
    SqlTrans.Free;
  end;
end;

procedure TfrmConsCheques.btnAddClick(Sender: TObject);
begin
  if IsValidar then
  begin                                                                       
     sdqReemplazaCH.Insert;
     sdqReemplazaCH.FieldByName('CHECK_ID').AsString        := '1';
     sdqReemplazaCH.FieldByName('BENEFICIARIO').AsString    := edBENEFICIARIO2.Text;
     sdqReemplazaCH.FieldByName('CHEQUE').AsString          := edCHEQUE.Text;
     sdqReemplazaCH.FieldByName('OP').AsString              := '1';
     sdqReemplazaCH.FieldByName('FECHA_CHEQUE').AsString    := edFECHA_CHEQUE.Text;
     sdqReemplazaCH.FieldByName('FECHA_OP').AsString        := edFECHA_CHEQUE.Text;
     sdqReemplazaCH.FieldByName('FECHA_ESTADO').AsString    := edFECHA_CHEQUE.Text;
     sdqReemplazaCH.FieldByName('FECHA_SITUACION').AsString := edFECHA_CHEQUE.Text;
     sdqReemplazaCH.FieldByName('MONTO').AsString           := edMONTO.Text;
     sdqReemplazaCH.FieldByName('OBSERVACIONES').AsString   := edOBSERVACIONES2.Text;
     sdqReemplazaCH.FieldByName('DESCRIPTION').AsString     := sdqMetodoPago.FieldByName('METODO').AsString;
     sdqReemplazaCH.FieldByName('GRUPO_PAGO').AsString      := edGRUPO_PAGO.Text;
     sdqReemplazaCH.FieldByName('CHEQUE_REEMP').AsString    := edCHECK_ID_OLD.Text;
     sdqReemplazaCH.FieldByName('VENDOR_ID').AsInteger      := sdqConsulta.FieldByName('IDPROVEEDOR').AsInteger;
     sdqReemplazaCH.FieldByName('ID_CUENTA').AsInteger      := sdqMetodoPago.FieldByName('ID_CUENTA').AsInteger;
     sdqReemplazaCH.Post;

     LimpiaReemplazo(False);
  end;
end;

function TfrmConsCheques.DoGuardarReemplazoCH(nOP: Integer): Boolean;
var
  SqlTrans: TDBSql;
begin
  // Insert en RRC_REEMPLAZOCHEQUE el cheque nuevo.
  SqlTrans := TDBSql.Create('RRC_REEMPLAZOCHEQUE');
  try
    Result := False;

    // insert en reemplazo de cheque.
    SqlTrans.Fields.Add('RC_ID', nOP);
    SqlTrans.Fields.Add('RC_IDPROVEEDOR', sdqConsulta.FieldByName('IDPROVEEDOR').AsInteger);
    SqlTrans.Fields.Add('RC_IDSUCPROVEEDOR', sdqSucursal.FieldByName('VENDOR_SITE_ID').AsString);
    SqlTrans.Fields.Add('RC_FECHA', 'ACTUALDATE', False);
    SqlTrans.Fields.AddExtended('RC_MONTO', sdqReemplazaCH.FieldByName('MONTO').AsCurrency, ALL_DECIMALS, False);
    SqlTrans.Fields.Add('RC_CONTABILIZADO', 'N');
    SqlTrans.SqlType := stInsert;
    SqlTrans.ExecuteST;

    Result := True;
  finally
    SqlTrans.Free;
  end;
end;

function TfrmConsCheques.DoUpdateSeguimientoCH: Boolean;
var
  SqlTrans: TDBSql;
begin
  SqlTrans := TDBSql.Create('RCE_CHEQUEEMITIDO');
  try
    Result := False;

    SqlTrans.PrimaryKey.Add('CE_ID', sdqConsulta.FieldByName('CHECK_ID').AsInteger);
    SqlTrans.Fields.Add('CE_ESTADO', ValorSQLEx('SELECT TB_CODIGO FROM CTB_TABLAS WHERE TB_CLAVE = :Clave AND TB_ESPECIAL1 = :Tipo', ['ESTCH', 'R']), dtString); //Trae el código del que sea "reemplazado"
    SqlTrans.Fields.Add('CE_FECHAESTADO', 'ACTUALDATE', False);
    SqlTrans.Fields.Add('CE_USUESTADO', Sesion.UserID);
    SqlTrans.SqlType := stUpdate;
    SqlTrans.ExecuteST;

    Result := True;
  finally
    SqlTrans.Free;
  end;
end;

procedure TfrmConsCheques.btnCancelaReemplazoClick(Sender: TObject);
begin
  LimpiaReemplazo(True);
  RollBack(True);

  sdqReemplazaCH.Close;
  sdqReemplazaCH.Open;
end;

procedure TfrmConsCheques.btnDelClick(Sender: TObject);
begin
  if not sdqReemplazaCH.Eof then
    sdqReemplazaCH.Delete;
end;

procedure TfrmConsCheques.tbPropiedadesClick(Sender: TObject);
var
  nOP: Integer;
  sSql: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');

  if (sdqConsulta.FieldbyName('TIPOESTADO').AsString = 'R') and sdqConsulta.FieldbyName('CE_IDCHEQUEREEMP').IsNull then   // cheque reemplado
    begin
      sSql := 'SELECT CE_ORDENPAGO ' +
                'FROM RCE_CHEQUEEMITIDO ' +
               'WHERE CE_IDCHEQUEREEMP = :IdChequeReemp';
      nOP := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldbyName('CHECK_ID').AsInteger]);      
    end
  else
    begin
      nOP := sdqConsulta.FieldbyName('OP').AsInteger;

      if ValorSql('SELECT 1 FROM RRC_REEMPLAZOCHEQUE WHERE RC_ID = '+ SqlValue(nOP)) = '' then
        InfoHint(nil, 'El item seleccionado no es un cheque reemplazado.', True);
    end;

  ImprimirOP(nOP);
end;

procedure TfrmConsCheques.LimpiaReemplazo(LimpiarBenef: Boolean);
begin
  edCHEQUE.Clear;
  cmbPAYMENT_METHOD_ID.Clear;
  OpenQuery(sdqMetodoPago);
  edMONTO.Clear;
  edOBSERVACIONES2.Clear;

  if LimpiarBenef then
  begin
    edBENEFICIARIO2.Clear;
    fraBeneficiario2.Clear;
  end;
end;

procedure TfrmConsCheques.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('MONTO') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('MONTO')).Currency := True;
  sdqConsultaAfterScroll(sdqConsulta);
end;

procedure TfrmConsCheques.sdqReemplazaCHAfterOpen(DataSet: TDataSet);
begin
  if sdqReemplazaCH.FieldByName('MONTO') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqReemplazaCH.FieldByName('MONTO')).Currency := True;
end;

procedure TfrmConsCheques.ImprimirOP(OP: Integer);
var
  iVendorSite: Integer;
begin
  unQrp_OP := TunQrp_OP.Create(Self);
  try
    unQrp_OP.sdqOrdenPago.Close;
    unQrp_OP.sdqOrdenPago.ParamByName('nOP').asInteger := OP;
    unQrp_OP.sdqOrdenPago.Open;

    iVendorSite := ValorSqlInteger('SELECT RC_IDSUCPROVEEDOR FROM RRC_REEMPLAZOCHEQUE WHERE RC_ID=' + SqlValue(OP));

    unQrp_OP.sdqProveedor.Close;
    unQrp_OP.sdqProveedor.ParamByName('nVendorSite').asInteger := iVendorSite;
    unQrp_OP.sdqProveedor.Open;
    
    unQrp_OP.qrpOrdenPago.PreviewModal;
  finally
    unQrp_OP.Free;
  end;
end;

function TfrmConsCheques.IsNroChequeExistenteGrilla(NroCheque: String): Boolean;
begin
  if sdqReemplazaCH.Eof then
    Result := False
  else
  begin
    NroCheque := Trim(NroCheque);

    sdqReemplazaCH.First;

    while not sdqReemplazaCH.Eof do
    begin
      if Trim(sdqReemplazaCH.FieldByName('CHEQUE').AsString) = NroCheque then
      begin
        Result := True;
        Exit;
      end;

      sdqReemplazaCH.Next;
    end;

    sdqReemplazaCH.Last;

    Result := False;
  end;
end;

procedure TfrmConsCheques.tbCuentaClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');
  Verificar((sdqConsulta.FieldByName('CE_DEBITADO').AsString = 'S'), nil, 'No se puede cambiar la cuenta de un cheque debitado por el banco.');

  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    cmbCuentaCont.Value := sdqConsulta.FieldByName('CE_CUENTA').AsString;
    edFechaCuentaCont.Date := sdqConsulta.FieldByName('CE_FECHACUENTA').AsDateTime;

    if edFechaCuentaCont.IsEmpty then
      edFechaCuentaCont.Date := DBDate;

    edFechaCuentaContExit(nil);

    fpCuentaContable.ShowModal;
  end;
end;

procedure TfrmConsCheques.btnAceptarCuentaContClick(Sender: TObject);
var
  Sql: TSql;
begin
  Verificar(cmbCuentaCont.Text='', cmbCuentaCont, 'La cuenta contable es obligatoria.');
  Verificar(edFechaCuentaCont.IsEmpty, edFechaCuentaCont, 'La fecha de la cuenta es obligatoria.');

  Sql := TSql.Create('RCE_CHEQUEEMITIDO');
  Sql.PrimaryKey.Add('CE_ID', sdqConsulta.FieldByName('CHECK_ID').AsInteger);
  Sql.Fields.Add('CE_CUENTA', cmbCuentaCont.Value);
  Sql.Fields.Add('CE_FECHACUENTA', edFechaCuentaCont.Date);

  try
    EjecutarSql(Sql.UpdateSql);
    sdqConsulta.Refresh;
    fpCuentaContable.ModalResult := mrOk;
  except
    on E: Exception do
      ErrorMsg(E);
  end;
end;

procedure TfrmConsCheques.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;

procedure TfrmConsCheques.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  tbModificar.Enabled := PermisoModificacion and ((DataSet.FieldByName('DELEGACION').AsInteger = Sesion.Delegacion) or (Sesion.Delegacion = 840));
end;

procedure TfrmConsCheques.cmbSituacionChange(Sender: TObject);
begin
  VCLExtra.LockControl(fraDelegac, (fraCE_SITUACION.Especial1 <> 'D') or (Sesion.Delegacion <> 840));
end;

procedure TfrmConsCheques.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if tbSumatoria.Down and sdqConsulta.Active then
      begin
        edTotalRegistros.Value := sdqConsulta.RecordCount;
        edMontoCheques.Value   := ObtenerSuma(Grid, 'MONTO');
      end;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmConsCheques.edFechaCuentaContExit(Sender: TObject);
begin
  edFechaCuentaContLarga.Text := edFechaCuentaCont.LongDate;
end;

procedure TfrmConsCheques.fpModificarEnter(Sender: TObject);
begin
  VCLExtra.LockControl(edFecha, not Seguridad.Claves.IsActive('PermitirCargaFechaSituacion'));
end;

procedure TfrmConsCheques.tbAnulacionClick(Sender: TObject);
var
  sClave: String;
  IdTipoDocumentoAnulOP, IdRar: TTableId;
  IdSecuenciaTraz: Integer;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'No existe seleccionado ningún cheque para ser anulado.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');
  Verificar(sdqConsulta.FieldByName('CE_IDCHEQUEREEMP').IsNull, nil, 'No se puede anular un cheque que no sea reemplazante.');
  Verificar((sdqConsulta.FieldByName('CE_DEBITADO').AsString = 'S'), nil, 'No se puede anular un cheque debitado por el banco.');
  Verificar(sdqConsulta.FieldByName('CE_CUENTA').AsInteger = 3, nil, 'No se puede anular un cheque prescripto.');

  with TSql.Create('RCE_CHEQUEEMITIDO') do
  try
    BeginTrans;
    try
      PrimaryKey.Add('CE_ID', sdqConsulta.FieldByName('CHECK_ID').AsInteger);
      Fields.Add('CE_ESTADO', '04', True);
      Fields.Add('CE_FECHAESTADO', exDate);
      Fields.Add('CE_USUESTADO', Sesion.UserID, True);
      EjecutarSqlST(UpdateSql);

      sClave                := Trim(sdqConsulta.FieldByName('OP').AsString);
      IdTipoDocumentoAnulOP := Get_IdTipoDocumentoAnulacionOPTesoreria();

      if not VerificarClaveExiste(ID_CARPETA_TESORERIA, sClave, IdRar) then
        IdRar := DoInsertArchivo(ID_CARPETA_TESORERIA, TIPOUBICACION_GUARDA,
                                 '', 0, '', Sesion.UserID, sClave, False,
                                 sdqConsulta.FieldByName('BENEFICIARIO').AsString);

      DoInsertDetalleArchivo(IdSecuenciaTraz, IdRar, IdTipoDocumentoAnulOP, 0, OPCION_DESTINO_DIGITALIZACION,
                             1, '', '0', '', 0, '', False);

      sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                 'SET CE_FECHAEXPORTACIONGD = SYSDATE ' +
               'WHERE CE_ID = :IdRCE';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

      CommitTrans;

      sdqConsulta.Refresh;
    except
      on E: Exception do
      begin
        RollBack;

        raise Exception.Create(E.Message + CRLF + 'Error al anular orden de cheque.');
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmConsCheques.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmConsCheques.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

procedure TfrmConsCheques.fraEntidadSobreExit(Sender: TObject);
begin
  inherited;

  fraEntidadSobre.FrameExit(Sender);
  fraVendedorSobre.Entidad := fraEntidadSobre.Value;
end;

procedure TfrmConsCheques.rgTipoClick(Sender: TObject);
var
  bLiquidacion, bDelegacion, bEsAfiliado, bEsPrestador, bProductor, bSiniestro: Boolean;
  sSql: String;
  qry: TSDQuery; 
begin
  bEsAfiliado  := (rgTipo.ItemIndex = 0);  // afiliado
  bEsPrestador := (rgTipo.ItemIndex = 1);  // prestador
  bProductor   := (rgTipo.ItemIndex = 2);  // productor
  bSiniestro   := (rgTipo.ItemIndex = 3);  // siniestro
  bDelegacion  := (rgTipo.ItemIndex = 5);  // Delegacion
  bLiquidacion := (rgTipo.ItemIndex = 6);  // Liquidación

  gbAfiliado.Visible         := bEsAfiliado;
  gbPrestador.Visible        := bEsPrestador;
  gbProductor.Visible        := bProductor;
  gbSiniestro.Visible        := bSiniestro;
  gbDelegacion.Visible       := bDelegacion;
  gbDerechoHabientes.Visible := False;

  VclExtra.LockControl(fraDomicilioSobre, (rgTipo.ItemIndex <> 4));  // no es ingreso manual

  DoLimpiarDatosSobre;

  if bLiquidacion then
    begin
      sSql := 'SELECT DISTINCT LE_RCALLE CALLE, LE_RNUMERO NUMERO, LE_RPISO PISO, LE_RDEPARTAMENTO DEPARTAMENTO, LE_RCPOSTAL CPOSTAL, LE_RLOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, LE_RPROVINCIA PROVINCIA ' +
                'FROM CPV_PROVINCIAS, SLE_LIQUIEMPSIN ' +
               'WHERE LE_IDCHEQUEEMITIDO = :IdCheque ' +
                 'AND LE_RPROVINCIA = PV_CODIGO(+) ' +
                 'AND LE_RCALLE IS NOT NULL';
      qry := GetQueryEx(sSql, [sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

      with qry do
        try
          if not Eof then
            begin
              Verificar(RecordCount > 1, nil, 'Hay más de un domicilio en liquidaciones.');
              DoCargarFrameDomicilioSobre(qry);
            end;
        finally
          Free;
        end;

    end;
end;

procedure TfrmConsCheques.fpSobreShow(Sender: TObject);
begin
  DoLimpiarDatosSobre;

  rgTipo.ItemIndex := 0;    // afiliado
  rgTipoClick(nil);
end;

procedure TfrmConsCheques.DoCargarFrameDomicilioSobre(sdq: TSDQuery);
begin
  with fraDomicilioSobre, sdq do
    begin
      Calle      := FieldByName('CALLE').AsString;
      Localidad  := FieldByName('LOCALIDAD').AsString;
      Provincia  := FieldByName('DESCRPROVINCIA').AsString;

      if not Eof and not FieldByName('PROVINCIA').IsNull then
        Prov := FieldByName('PROVINCIA').AsInteger;

      Numero       := iif(FieldByName('NUMERO').IsNull, 'S/N', FieldByName('NUMERO').AsString);
      Piso         := FieldByName('PISO').AsString;
      Departamento := FieldByName('DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName('CPOSTAL').AsString;
      CPA          := '';
    end;
end;

procedure TfrmConsCheques.DoCargarDomicilioSobre;
var
  sSql: String;
  qry: TSDQuery;
begin
  pbEsDerHabientes := False;

  case rgTipo.ItemIndex of
    0:  // afiliado
      sSql := 'SELECT DC_CALLE CALLE, DC_NUMERO NUMERO, DC_PISO PISO, DC_DEPARTAMENTO DEPARTAMENTO, DC_CPOSTAL CPOSTAL, DC_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, DC_PROVINCIA PROVINCIA ' +
                'FROM CPV_PROVINCIAS, ADC_DOMICILIOCONTRATO ' +
               'WHERE DC_TIPO = ''P'' ' +
                 'AND DC_PROVINCIA = PV_CODIGO(+) ' +
                 'AND DC_CONTRATO = ' + SqlValue(fraEmpresaSobre.Contrato);

    1:  // prestador
      sSql := 'SELECT CA_CALLECOMERCIAL CALLE, CA_NUMEROCOMERCIAL NUMERO, CA_PISOCOMERCIAL PISO, CA_DEPARTAMENTOCOMERCIAL DEPARTAMENTO, CA_CODPOSTALCOMERCIAL CPOSTAL, CA_LOCALIDADCOMERCIAL LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, CA_PROVINCIACOMERCIAL PROVINCIA ' +
                'FROM CPV_PROVINCIAS, CPR_PRESTADOR ' +
               'WHERE CA_PROVINCIACOMERCIAL = PV_CODIGO ' +
                 'AND CA_IDENTIFICADOR = ' + SqlValue(fraPrestadorSobre.edCA_IDENTIFICADOR.Value) + ' ' +
               'UNION ' +
              'SELECT CA_CALLE CALLE, CA_NUMERO NUMERO, CA_PISOCALLE PISO, CA_DEPARTAMENTO DEPARTAMENTO, CA_CODPOSTAL CPOSTAL, CA_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, CA_PROVINCIA PROVINCIA ' +
                'FROM CPV_PROVINCIAS, CPR_PRESTADOR ' +
               'WHERE CA_PROVINCIA = PV_CODIGO ' +
                 'AND CA_IDENTIFICADOR = ' + SqlValue(fraPrestadorSobre.edCA_IDENTIFICADOR.Value) + ' ' +
                 'AND CA_PROVINCIACOMERCIAL IS NULL';

    2:  // productor
    begin
      if fraEntidadSobre.IsSelected then
        sSql := 'SELECT EN_CALLE CALLE, EN_NUMERO NUMERO, EN_PISO PISO, EN_DEPARTAMENTO DEPARTAMENTO, EN_CPOSTAL CPOSTAL, EN_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, EN_PROVINCIA PROVINCIA ' +
                  'FROM CPV_PROVINCIAS, XEN_ENTIDAD ' +
                 'WHERE EN_PROVINCIA = PV_CODIGO(+) ' +
                   'AND EN_ID = ' + SqlValue(fraEntidadSobre.Value)
      else if fraVendedorSobre.IsSelected then
        sSql := 'SELECT VE_CALLE CALLE, VE_NUMERO NUMERO, VE_PISO PISO, VE_DEPARTAMENTO DEPARTAMENTO, VE_CPOSTAL CPOSTAL, VE_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, VE_PROVINCIA PROVINCIA ' +
                  'FROM CPV_PROVINCIAS, XVE_VENDEDOR ' +
                 'WHERE VE_PROVINCIA = PV_CODIGO(+) ' +
                   'AND VE_ID =  ' + SqlValue(fraVendedorSobre.Value)
      else
        sSql := 'SELECT VE_CALLE CALLE, VE_NUMERO NUMERO, VE_PISO PISO, VE_DEPARTAMENTO DEPARTAMENTO, VE_CPOSTAL CPOSTAL, VE_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, VE_PROVINCIA PROVINCIA ' +
                  'FROM CPV_PROVINCIAS, XVE_VENDEDOR ' +
                 'WHERE VE_PROVINCIA = PV_CODIGO(+) ' +
                   'AND 1 = 2';
    end;

    3:  // siniestro
    begin
      sSql := 'SELECT EB_NOMBRE BENEFICIARIO, EB_DIRECCION CALLE, NULL NUMERO, NULL PISO, NULL DEPARTAMENTO, EB_CPOSTAL CPOSTAL, EB_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, EB_PROVINCIA PROVINCIA ' +
                'FROM CPV_PROVINCIAS, SEB_BENEFICIARIOS, SEX_EXPEDIENTES ' +
               'WHERE EB_SINIESTRO = EX_SINIESTRO ' +
                 'AND EB_ORDEN = EX_ORDEN ' +
                 'AND EB_RECAIDA = EX_RECAIDA ' +
                 'AND EB_PORCENTAJE > 0 ' +
                 'AND EB_FECHABAJA IS NULL ' +
                 'AND EX_GRAVEDAD = ''5'' ' +
                 'AND NVL(EX_CAUSAFIN, '' '') NOT IN (''95'', ''99'', ''02'') ' +
                 'AND TRIM(EB_DIRECCION) IS NOT NULL ' +
                 'AND TRIM(EB_CPOSTAL) IS NOT NULL ' +
                 'AND TRIM(EB_LOCALIDAD) IS NOT NULL ' +
                 'AND TRIM(EB_PROVINCIA) IS NOT NULL ' +
                 'AND EB_PROVINCIA = PV_CODIGO(+) ' +
                 'AND EX_ID = ' + SqlValue(fraTrabSiniestroSobre.IdExpediente) + ' ' +
               'ORDER BY EB_NOMBRE';
      OpenQuery(sdqDerechoHabientes, sSql);
      pbEsDerHabientes := not sdqDerechoHabientes.IsEmpty;

      gbDerechoHabientes.Visible := pbEsDerHabientes;

      if pbEsDerHabientes then
        cmbDerechoHabientesChange(nil)
      else
        sSql := 'SELECT TJ_CALLE CALLE, TJ_NUMERO NUMERO, TJ_PISO PISO, TJ_DEPARTAMENTO DEPARTAMENTO, TJ_CPOSTAL CPOSTAL, TJ_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, TJ_PROVINCIA PROVINCIA ' +
                  'FROM CPV_PROVINCIAS, CTJ_TRABAJADOR ' +
                 'WHERE TJ_PROVINCIA = PV_CODIGO(+) ' +
                   'AND TJ_CUIL = ' + SqlValue(fraTrabSiniestroSobre.CUIL);
    end;

    5:  // delegación
      sSql := 'SELECT EL_CALLE CALLE, EL_NUMERO NUMERO, EL_PISO PISO, EL_DEPARTAMENTO DEPARTAMENTO, EL_CPOSTAL CPOSTAL, EL_LOCALIDAD LOCALIDAD, PV_DESCRIPCION DESCRPROVINCIA, EL_PROVINCIA PROVINCIA ' +
                'FROM CPV_PROVINCIAS, DEL_DELEGACION ' +
               'WHERE EL_PROVINCIA = PV_CODIGO(+) ' +
                 'AND EL_ID = ' + SqlValue(fraDelegacionSobre.Value);
  end;

  if not pbEsDerHabientes then
    begin
      fraDomicilioSobre.Clear;
      qry := GetQuery(sSql);
      with qry do
        try
          if Active and not IsEmpty then
            DoCargarFrameDomicilioSobre(qry);
        finally
          Free;
        end;
    end;
end;

procedure TfrmConsCheques.DoLimpiarDatosSobre;
begin
  fraEmpresaSobre.Clear;
  fraPrestadorSobre.Clear;
  fraEntidadSobre.Clear;
  fraVendedorSobre.Entidad := ART_EMPTY_ID;
  fraVendedorSobre.Clear;
  fraTrabSiniestroSobre.Clear;
  fraDelegacionSobre.Clear;

  fraDomicilioSobre.Clear;
  fraModoEnvio.Clear;
end;

procedure TfrmConsCheques.fraEmpresaSobreChange(Sender: TObject);
begin
  DoCargarDomicilioSobre;
end;

procedure TfrmConsCheques.fraEntidadSobreChange(Sender: TObject);
begin
  DoCargarDomicilioSobre;
end;

procedure TfrmConsCheques.fraPrestadorSobreChange(Sender: TObject);
begin
  DoCargarDomicilioSobre;
end;

procedure TfrmConsCheques.fraVendedorSobreChange(Sender: TObject);
begin
  DoCargarDomicilioSobre;
end;

procedure TfrmConsCheques.btnAceptarSobresClick(Sender: TObject);
begin
  if ValidarSobres then
    DoGrabarSobres;
end;

function TfrmConsCheques.ValidarSobres: Boolean;
begin
  Verificar(fraModoEnvio.IsEmpty, fraModoEnvio, 'Debe indicar el modo de envío.');

  case rgTipo.ItemIndex of
    0:  // afiliado
      Verificar(fraEmpresaSobre.IsEmpty, fraEmpresaSobre.edContrato, 'Debe ingresar un afiliado.');

    1:  // prestador
      Verificar(fraPrestadorSobre.IsEmpty, fraPrestadorSobre.mskCA_CLAVE, 'Debe ingresar un prestador.');

    2:  // productor
      Verificar(fraEntidadSobre.IsEmpty and fraVendedorSobre.IsEmpty, fraEntidadSobre.mskCuit, 'Debe ingresar un productor.');

    3:  // siniestro
      Verificar(fraTrabSiniestroSobre.IsEmpty, fraTrabSiniestroSobre.edSiniestro, 'Debe ingresar un siniestro.');

    5:  // delegación
      Verificar(fraDelegacionSobre.IsEmpty, fraDelegacionSobre.edCodigo, 'Debe ingresar una delegación.');
  end;

  case rgTipo.ItemIndex of
    3:  // siniestro
    begin
     if pbEsDerHabientes then
       begin
         Verificar(not fraDomicilioSobre.IsSelected, fraDomicilioSobre, 'No ha seleccionado un domicilio.');
         Result := True;
       end
     else
       Result := True;
    end;

    4, 6:  // ingreso manual / liquidación
      Result := fraDomicilioSobre.IsValid

  else
    Result := True;
  end;
end;

procedure TfrmConsCheques.DoGrabarSobre(IdCheque: TTableId; Calle, Numero, Piso, Depto, Localidad, CP: String; Provincia: Integer; IdTrabajador, IdDelegacion: TTableId; ModoEnvio: String);
var
  sSql: String;

begin
  sSql := 'INSERT INTO RSO_SOBRE(SO_ID, SO_IDCHEQUEEMITIDO, SO_CALLE, SO_NUMERO, SO_PISO, ' +
                                'SO_DEPARTAMENTO, SO_LOCALIDAD, SO_CPOSTAL, SO_PROVINCIA, ' +
                                'SO_FECHAALTA, SO_USUALTA, SO_IDTRABAJADOR, SO_IDDELEGACION, ' +
                                'SO_MODOENVIO) ' +
             'VALUES(SEQ_RSO_ID.NEXTVAL, ' +
                     SqlValue(IdCheque) + ', ' +
                     SqlValue(Calle) + ', ' +
                     SqlValue(Numero) + ', ' +
                     SqlValue(Piso) + ', ' +
                     SqlValue(Depto) + ', ' +
                     SqlValue(Localidad) + ', ' +
                     SqlValue(CP) + ', ' +
                     SqlInt(Provincia, True) + ', ' +
                     'SYSDATE, ' +
                     SqlValue(Sesion.UserID) + ', ' +
                     SqlInt(IdTrabajador, True) + ', ' +
                     SqlInt(IdDelegacion, True) + ', ' +
                     SqlValue(ModoEnvio) + ')';
  EjecutarSqlST(sSql);

  sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
             'SET CE_SITUACION = ''07'', ' +
                 'CE_FECHASITUACION = ACTUALDATE, ' +
                 'CE_USUSITUACION = ' + SqlValue(Sesion.UserID) + ' ' +
           'WHERE CE_ID = ' + SqlValue(IdCheque) + ' ' +
             'AND CE_SITUACION NOT IN (''02'', ''16'', ''17'', ''29'', ''31'')';

  EjecutarSqlST(sSql);      
end;

procedure TfrmConsCheques.DoGrabarSobres;
begin
  BeginTrans;
  try
    with fraDomicilioSobre do
      DoGrabarSobre(sdqConsulta.FieldByName('CHECK_ID').AsInteger, Calle, Numero, Piso, Departamento,
                    Localidad, CodigoPostal, Prov, Integer(Iif(pbEsDerHabientes, 0, fraTrabSiniestroSobre.Value)),
                    fraDelegacionSobre.Value, fraModoEnvio.Value);

    CommitTrans;
    MsgBox('Domicilio guardado correctamente.', MB_ICONINFORMATION);

    fpSobre.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el domicilio.');
    end;
  end;
end;

procedure TfrmConsCheques.fpMotivoReemplazoEnter(Sender: TObject);
begin
  fractbMotReemplazo.Clear;
end;

procedure TfrmConsCheques.btnAceptarMotReemplazoClick(Sender: TObject);
begin
  if ValidarMotReemplazo then
    DoGrabarMotReemplazo;
end;

procedure TfrmConsCheques.DoGrabarMotReemplazo;
var
  sSql: String;
  tslObservaciones: TStringList;
begin
  BeginTrans(True);
  try
    sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
               'SET CE_MOTIVOREEMPLAZO = :MotReemplazo ' +
             'WHERE CE_ID = :IdRCE';
    EjecutarSqlSTEx(sSql, [fractbMotReemplazo.Codigo, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

    if fractbMotReemplazo.Especial1 = 'B' then   // es Beneficiario
    begin
      tslObservaciones := TStringList.Create;
      try
        sSql := 'INSERT INTO RRB_REEMPLAZOBENEFICIARIO(RB_ID, RB_IDCHEQUEEMITIDO, RB_FECHAALTA, RB_USUALTA) ' +
                'VALUES(SEQ_RRB_ID.NEXTVAL, :IdRCE, ACTUALDATE, :Usuario)';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('CHECK_ID').AsInteger, Sesion.UserId]);

        if InputMemoBox('Motivo de reemplazo', tslObservaciones) then
        begin
          sSql := 'UPDATE TESO.RCE_CHEQUEEMITIDO ' +
                     'SET CE_OBSERVACIONES = CE_OBSERVACIONES || DECODE(CE_OBSERVACIONES, NULL, '''', '' '') || REPLACE(REPLACE(UPPER(TRIM(:OBSERVACIONES)), CHR(13), '' ''), CHR(10), '''') ' +
                   'WHERE CE_ID = :IdRCE';
          EjecutarSqlSTEx(sSql, [tslObservaciones.Text, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);
        end;
      finally
        tslObservaciones.Free;
      end;
      
      EjecutarStoreSTEx('ART.INTRAWEB.DO_REEMPLAZARCHEQUE(:V1, :V2, :V3);', [Sesion.UserID, 1, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);
    end;

    if fractbMotReemplazo.Especial1 = 'B' then
    begin
      CommitTrans(True);
      MsgBox('Motivo de reemplazo guardado correctamente.', MB_ICONINFORMATION);
    end;

    fpMotivoReemplazo.ModalResult := mrOk;
  except
    on E: Exception do
      begin
        RollBack(True);
        raise Exception.Create(E.Message + CRLF + 'Error al grabar el motivo de reemplazo.');
      end;
  end;
end;

function TfrmConsCheques.ValidarMotReemplazo: Boolean;
begin
  Verificar(fractbMotReemplazo.IsEmpty, fractbMotReemplazo.edCodigo, 'Debe ingresar el motivo de reemplazo.');
  Verificar((fractbMotReemplazo.Especial1 = 'B') and IsEmptyString(Trim(GetDireccionesMailResponsableBenef)), fractbMotReemplazo.edCodigo, 'No está definido el responsable del grupo ' + sdqConsulta.FieldByName('GRUPO_PAGO').AsString + '.');
  Result := True;
end;

function TfrmConsCheques.GetDireccionesMailResponsableBenef: String;
var
  sDirecciones, sSql: String;
begin
  sDirecciones := '';

  sSql := 'SELECT SE_MAIL EMAIL ' +
            'FROM USE_USUARIOS, USC_SECTORES, CES_EMAILSECTOR ' +
           'WHERE ES_FECHABAJA IS NULL ' +
             'AND ES_RESPONSABLE = ''R'' ' +
             'AND ES_SECTOR = :Sector ' +
             'AND ES_SECTOR = SC_CODIGO ' +
             'AND SC_FECHABAJA IS NULL ' +
             'AND ES_DIRELECTRONICA = SE_USUARIO ' +
             'AND SE_FECHABAJA IS NULL ' +
             'AND SE_MAIL IS NOT NULL';

  with GetQueryEx(sSql, [sdqConsulta.FieldByName('SECTORGRUPOPAGO').AsString]) do
  try
    while not Eof do
    begin
      sDirecciones := sDirecciones + FieldByName('EMAIL').AsString + ',' ;
      Next;
    end;
  finally
    Free;
  end;

  Result := sDirecciones;
end;

procedure TfrmConsCheques.DoCargarReemplazosCheque(Beneficiario: String; const aEsCambioBeneficiario: Boolean);
begin
  sdqReemplazoCheque.Close;
  sdqReemplazoCheque.ParamByName('CEIDPROVEEDOR').AsInteger := sdqConsulta.FieldByName('IDPROVEEDOR').AsInteger;
  sdqReemplazoCheque.Open;

  edCHECK_ID_OLD.Value := sdqConsulta.FieldByName('CHEQUE').AsInteger;
  edOP.Value           := sdqConsulta.FieldByName('OP').AsInteger;
  edMONTO_OLD.Value    := sdqConsulta.FieldByName('MONTO').AsCurrency;
  edGRUPO_PAGO.Text    := sdqConsulta.FieldByName( 'GRUPO_PAGO' ).asString;
  edVENDOR_NAME.Text   := sdqReemplazoCheque.FieldByName( 'VENDOR_NAME' ).asString;
  edFECHA_CHEQUE.Date  := ValorSqlDateTime('SELECT CC_FECHACAJA FROM RCC_CIERRECAJA WHERE CC_ACTIVA = ''S'' AND CC_TIPO = ''E''');

  sdqSucursal.Close;
  sdqSucursal.ParamByName('V_VENDOR_ID').AsInteger := sdqConsulta.FieldByName('IDPROVEEDOR').AsInteger;
  sdqSucursal.Open;

//  fraBeneficiario2.Descripcion := Beneficiario;
  edBENEFICIARIO2.Text := Beneficiario;
  fraBeneficiario2.Propiedades.ExtraCondition := ' AND rb_idchequeemitido = ' + SqlValue(sdqConsulta.FieldByName('CHECK_ID').AsInteger);

  edBENEFICIARIO2.Visible := not aEsCambioBeneficiario;
  fraBeneficiario2.Visible := aEsCambioBeneficiario;

  fpReemplazo.ShowModal;
end;

function TfrmConsCheques.GetBeneficiario(IdCheque: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT RB_BENEFICIARIO ' +
            'FROM RRB_REEMPLAZOBENEFICIARIO ' +
           'WHERE RB_IDCHEQUEEMITIDO=:IdCRE';

  Result := ValorSqlEx(sSql, [IdCheque]);
end;

procedure TfrmConsCheques.tbExportarGDClick(Sender: TObject);
var
  IdSecuenciaTraz, i: Integer;
  sClave, sSql: String;
  Lote, IdTipoDocumentoOP, IdRar: TTableId;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ningún registro en la grilla.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

    Verificar(not sdqConsulta.FieldByName('FEXPORTACIONGD').IsNull, Grid, 'El cheque nro. ' + sdqConsulta.FieldByName('CHEQUE').AsString + ' ya ha sido exportado al AGA.');
  end;

  if MsgBox('¿Confirma la generación en el AGA de los documentos Orden de Pago Tesorería por los cheques seleccionados?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    try
      BeginTrans;

      IdTipoDocumentoOP := Get_IdTipoDocumentoOPTesoreria();

      for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
          sClave := Trim(sdqConsulta.FieldByName('OP').AsString);

          if not VerificarClaveExiste(ID_CARPETA_TESORERIA, sClave, IdRar) then
            IdRar := DoInsertArchivo(ID_CARPETA_TESORERIA, TIPOUBICACION_GUARDA,
                                     '', 0, '', Sesion.UserID, sClave, False,
                                     sdqConsulta.FieldByName('BENEFICIARIO').AsString);

          if not Is_ExisteDocumento(ID_CARPETA_TESORERIA, sClave, CODDOC_OPAGOTESO, '', Lote) then
            begin
              sSql := 'UPDATE RAR_ARCHIVO ' +
                         'SET AR_FECHAMOVIMIENTO = SYSDATE' + ', ' +
                             'AR_IDABOGADO = NULL, ' +
                             'AR_RECEPTOR =  ' + SqlValue(Sesion.UserId) + ', ' +
                             'AR_EMISOR =' + SqlValue(Sesion.UserId) + ' ' +
                       'WHERE AR_ID = ' + SqlValue(IdRar);
              EjecutarSqlST(sSql);

              IdSecuenciaTraz := Get_SecuenciaTrazOP(StrToInt(sClave));
              DoInsertDetalleArchivo(IdSecuenciaTraz, IdRar, IdTipoDocumentoOP, 0, OPCION_DESTINO_DIGITALIZACION,
                                     1, sdqConsulta.FieldByName('BENEFICIARIO').AsString, '0',
                                     '', 0, '', False, 0, 0, 0, '', False, 0, False, True);
            end;

          sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                     'SET CE_FECHAEXPORTACIONGD = SYSDATE ' +
                   'WHERE CE_ID = :IdRCE';
          EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('CHECK_ID').AsInteger]);
        end;

      CommitTrans;
      MsgBox('Cheques exportados correctamente.', MB_ICONINFORMATION);

      sdqConsulta.Refresh;
      Grid.UnSelectAll;
    except
      on E: Exception do
        begin
          RollBack;

          raise Exception.Create(E.Message + CRLF + 'Error al exportar a G&D.');
        end;
    end;
end;

procedure TfrmConsCheques.fraBeneficiario2PropiedadesChange(Sender: TObject);
begin
  edBENEFICIARIO2.Text := fraBeneficiario2.Descripcion;
end;

procedure TfrmConsCheques.fraTrabSiniestroSobreChange(Sender: TObject);
begin
  DoCargarDomicilioSobre;
end;

procedure TfrmConsCheques.fraDelegacionSobreChange(Sender: TObject);
begin
  DoCargarDomicilioSobre;
end;

procedure TfrmConsCheques.tbHistoricoClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ningún registro en la grilla.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');

  with TfrmHistoricoCheques.Create(nil) do
    try
      IdCheque := Self.sdqConsulta.FieldByName('CHECK_ID').AsInteger;

      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmConsCheques.tbEnvioMailClick(Sender: TObject);
var
  sAsunto, sMensaje, sDirecciones, sTempFile: string;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');

  sDirecciones := Get_DireccionesEnvioMail('MCHEQUES');
  if sDirecciones <> '' then
    begin
      if MsgBox('¿Confirma el envío de mails con los cheques de la grilla?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
        begin
          IniciarEspera('Preparando Mail...');
          try
            sTempFile := GetTempFromFileName('MailCheques.xls');
            with ExportDialogMails do
              begin
                ExportFileType := etExcelFile;
                OutputFile     := sTempFile;
                SaveToFile;
              end;

            sAsunto  := 'Detalle de pagos';
            sMensaje := 'Por la presente se informa que se autorizó el débito a confirmar por el total de ' + ToStr(SumField(sdqConsulta, 'MONTO'), 2, False, False, '$') +
                        ' a raíz de las operaciones bancarias que se adjuntan.';

            EnviarMailBD(sDirecciones, sAsunto, [oDeleteAttach, oAutoFirma], sMensaje, GetAttachments(sTempFile, 0), 0, tcDefault, True);

            MsgBox('Mails enviados correctamente.', MB_ICONINFORMATION);
          finally
            DetenerEspera;
          end;
        end;
    end;
end;

procedure TfrmConsCheques.tbEliminarDebitadoClick(Sender: TObject);
var
  sSql: String;
  dFechaDebitado: TDateTime;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');

  dFechaDebitado := InputBoxDate('Modificación del Debitado', 'Fecha Debitado', sdqConsulta.FieldByName('CE_FECHADEBITADO').AsDateTime, sdqConsulta.FieldByName('FECHA_CHEQUE').AsDateTime, DBDate());

  if (dFechaDebitado <> -1) and (MsgBox('¿Confirma modificación del debitado del cheque seleccionado?', MB_YESNO + MB_ICONQUESTION) = IDYES) then
    begin
      sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                 'SET CE_DEBITADO = :Debitado, ' +
                     'CE_FECHADEBITADO = :FechaDebitado ' +
               'WHERE CE_ID = :IdRCE';
      EjecutarSqlEx(sSql, [Iif(dFechaDebitado > 0, 'S', 'N'), TDateTimeEx.Create(dFechaDebitado), sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

      MsgBox('Debitado modificado correctamente.', MB_ICONINFORMATION);
      sdqConsulta.Refresh;
    end;
end;

procedure TfrmConsCheques.tbBuscarChequesClick(Sender: TObject);
var
  Archivo: TextFile;
  Cheques: String;
  Temp: String;
begin
  inherited;

  Cheques   := '';
  psCheques := '';

  OpenDialog.Title      := 'Archivo de Cheques';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter     := 'Archivos de Texto(*.txt)|*.txt';

  if OpenDialog.Execute then
  try
    try
      AssignFile(Archivo, OpenDialog.FileName);
      Reset(Archivo);

      while (not Eof(Archivo)) do
      begin
        Readln(Archivo, Temp);

        if StrToInt(Trim(Temp)) <> 0 then //Con esto chequeo que no ingrese cualquier cosa
          Cheques := Cheques + Temp + ',';
      end;

      if Cheques <> '' then
      begin
        psCheques := Copy(Cheques, 1, Length(Cheques) - 1);
        tbRefrescarClick(nil);
      end;
    except
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
  finally
    CloseFile(Archivo);
  end;
end;

function TfrmConsCheques.DoReemplazoAdmArchivos(OPVieja, OPNueva: Integer): Boolean;
var
  sClaveVie, sClaveNue, sCuerpo: String;
begin
  sClaveVie := Trim(IntToStr(OPVieja));
  sClaveNue := Trim(IntToStr(OPNueva));
  sCuerpo   := 'La Orden de Pago ' + sClaveVie + ' ha sido reemplazada por la Orden de Pago ' + sClaveNue + '.';

  Result := DoReemplazoCarpeta(sClaveVie, sClaveNue, '[Documentación] Reemplazo de Orden de Pago', sCuerpo, ID_CARPETA_TESORERIA);
end;

procedure TfrmConsCheques.tbTransferenciasClick(Sender: TObject);
var
  i: Integer;
  sCodBanco, sCodSituacionGT, sSql: String;
  IdBanco, IdCheque, IdRTR: TTableId;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  IdBanco := ART_EMPTY_ID;
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

    if i = 0 then
      IdBanco := sdqConsulta.FieldByName('IDBANCO').AsInteger;

    Verificar(sdqConsulta.FieldByName('ESTRANSFERENCIA').AsString <> 'S', Grid, 'El cheque no corresponde a una transferencia.');
    Verificar(not AreIn(sdqConsulta.FieldByName('SITUACION').AsString, ['01', '30']), Grid, 'La situación debe ser: A la Firma, o En Tesoreria.');  // 01: EN TESORERIA / 30: A LA FIRMA
    Verificar(not sdqConsulta.FieldByName('CE_IDTRANSFERENCIA').IsNull, Grid, 'El cheque ya tiene una transferencia asociada.');
    Verificar(IdBanco <> sdqConsulta.FieldByName('IDBANCO').AsInteger, Grid, 'No puede haber bancos distintos.');
  end;

  sCodBanco := sdqConsulta.FieldByName('CODBANCO').AsString;

  // 011: BANCO DE LA NACION ARGENTINA
  // 337: BANCO PATAGONIA
  Verificar(not AreIn(sCodBanco, [CodBanco_NacionArg, CodBanco_Patagonia]), Grid, 'Este banco no está permitido.');

  try
    BeginTrans;

    IdRTR := GetSecNextVal('SEQ_RTR_ID');

    sSql := 'INSERT INTO TESO.RTR_TRANSFERENCIA(TR_ID, TR_FECHAALTA, TR_USUALTA, TR_IDBANCO) ' +
                 'VALUES(:Id, SYSDATE, :UsuAlta, :IdBanco)';
    EjecutarSqlSTEx(sSql, [IdRTR, Sesion.UserId, IdBanco]);

    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      IdCheque := sdqConsulta.FieldByName('CHECK_ID').AsInteger;

      if sCodBanco = CodBanco_Patagonia then     // 337: BANCO PATAGONIA
        sCodSituacionGT := '31'     // 31: 	GIROS Y TRANSFERENCIAS PATAGONIA
      else
        sCodSituacionGT := '16';    // 16: GIROS Y TRANSFERENCIAS NACION

      DoProcesarGirosYTransferencias(IdCheque, IdRTR, sCodSituacionGT);
    end;

    CommitTrans;
    MsgBox('Transferencias realizadas correctamente.', MB_ICONINFORMATION);

    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      RollBack;

      raise Exception.Create(E.Message + CRLF + 'Error al grabar la transferencia.');
    end;
  end;
end;

procedure TfrmConsCheques.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsCheques.mnuNotasBancoClick(Sender: TObject);
var
  i: Integer;
  IdCheque: TTableId;
  Beneficiario: TBeneficiario;
  sBanco: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      IdCheque := sdqConsulta.FieldByName('CHECK_ID').AsInteger;
      DoImprimirNotaBancoPrestDin(IdCheque);

      sBanco := UCase(sdqConsulta.FieldByName('BENEFICIARIO').AsString);
      if (InStr(sBanco, 'BANCO ') > 0) and AreIn(UpperCase(sdqConsulta.FieldByName('GRUPO_PAGO').AsString), [LEGALES_LOOKUP, GASTOSGRALES_LOOKUP, UpperCase(SINIESTROS_LOOKUP)]) then
        begin
          if sBanco = 'BANCO DE LA CIUDAD DE BUENOS AIRES' then
            Beneficiario := beBancoCiudadBsAs
          else if sBanco = 'BANCO DE LA NACION ARGENTINA' then
            Beneficiario := beBancoNacionArg
          else
            Beneficiario := beOtrosBanco;

          DoImprimirNotaBancoLegales(IdCheque, Beneficiario, sBanco);
        end;
    end;
end;

procedure TfrmConsCheques.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmConsCheques.cmbDerechoHabientesChange(Sender: TObject);
begin
  fraDomicilioSobre.Clear;
  DoCargarFrameDomicilioSobre(sdqDerechoHabientes);
end;

procedure TfrmConsCheques.cmbPAYMENT_METHOD_IDChange(Sender: TObject);
var
  iProxNroCheque, IdTablaStockCheques: Integer;
begin
  inherited;

  if IsEmptyString(edCHEQUE.Text) and not IsEmptyString(cmbPAYMENT_METHOD_ID.Text) and GetProxNroCheque(sdqMetodoPago.FieldByName('ID_CUENTA').AsInteger, iProxNroCheque, IdTablaStockCheques) then
    edCHEQUE.Text := IntToStr(iProxNroCheque);
end;

procedure TfrmConsCheques.mnuEnviadosDelegacionClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
  dFecha := InputBoxDate('Listado de Enviados a Delegaciones', 'Fecha Situación del Cheque', DBDateTime);

  if dFecha > 0 then
    with TqrListadoEnviadosDelegacion.Create(Self) do
      try
        Imprimir(dFecha);
      finally
        Free;
      end;
end;

procedure TfrmConsCheques.tbDetalleChequesClick(Sender: TObject);
var
  sListaIdCheques, sListaNroOrdenenPago: String;
  i: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ningún registro en la grilla.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar una fila de la grilla.');

  sListaIdCheques      := '';
  sListaNroOrdenenPago := '';

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      sListaIdCheques      := sListaIdCheques + sdqConsulta.FieldByName('CHECK_ID').AsString + ', ';
      sListaNroOrdenenPago := sListaNroOrdenenPago + sdqConsulta.FieldByName('OP').AsString + ', ';
    end;

  if not IsEmptyString(sListaIdCheques) then
    TfrmDetalleCheque.DoCargarDetalleCheque(CutRight(sListaIdCheques, 2), CutRight(sListaNroOrdenenPago, 2));
end;

procedure TfrmConsCheques.mnuChequesSituacionClick(Sender: TObject);
begin
  Abrir(TfrmConsultaChequesSituacion, frmConsultaChequesSituacion, tmvModal, mnuChequesSituacion);
end;

procedure TfrmConsCheques.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('IDTAREA_EJECCUENTA').AsString = 'S' then
    begin
      if Highlight then
        Background := clTeal
      else
        Background := $00E1FFFF;
    end;
end;

procedure TfrmConsCheques.tbObservacionesClick(Sender: TObject);
var
  Observac: TStringList;
  bAceptar: Boolean;
  sSql: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');

  Observac := TStringList.Create();
  with Observac do
    try
      Text     := sdqConsulta.FieldByName('OBSERVCONTADURIA').AsString;
      bAceptar := InputMemoBox('Observaciones', Observac, False, 250);

      if bAceptar then
        begin
          sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                     'SET CE_OBSERVCONTADURIA = TRIM(:Observ) ' +
                   'WHERE CE_ID = :IdRCE';
          EjecutarSqlEx(sSql, [Trim(Observac.Text), sdqConsulta.FieldByName('CHECK_ID').AsInteger]);

          MsgBox('Observaciones modificadas correctamente.', MB_ICONINFORMATION);
          sdqConsulta.Refresh;
        end;
    finally
      Free;
    end;
end;

procedure TfrmConsCheques.tbBuscarCodigoBarrasClick(Sender: TObject);
begin
  DoBuscarCampoCodigoBarrasArchivo(Self, ID_CARPETA_TESORERIA, 'OP', '');
end;

procedure TfrmConsCheques.mnuSobresIndividualClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');
  Verificar((sdqConsulta.FieldByName('ESTADO').AsString <> '01'), nil, 'El estado del cheque debe ser EMITIDO.');

  if fpSobre.ShowModal = mrOk then
    tbRefrescarClick(nil);
end;

procedure TfrmConsCheques.tbSobreClick(Sender: TObject);
begin
  tbSobre.CheckMenuDropdown;
end;

procedure TfrmConsCheques.mnuSobresMasivaClick(Sender: TObject);
var
  iCant, IdCheque, OPago, i: Integer;
  sSql: String;
  sdq: TSDQuery;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  if fpSobreMasivo.ShowModal = mrOk then
    begin
      BeginTrans;
      try
        iCant := 0;

        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            sSql := 'SELECT DC_CALLE CALLE, DC_NUMERO NUMERO, DC_PISO PISO, DC_DEPARTAMENTO DEPARTAMENTO, ' +
                           'DC_CPOSTAL CPOSTAL, DC_LOCALIDAD LOCALIDAD, NVL(DC_PROVINCIA, 0) PROVINCIA ' +
                      'FROM ADC_DOMICILIOCONTRATO, ART.SEX_EXPEDIENTES, ART.SLE_LIQUIEMPSIN ' +
                     'WHERE EX_SINIESTRO = LE_SINIESTRO ' +
                       'AND EX_ORDEN = LE_ORDEN ' +
                       'AND EX_RECAIDA = LE_RECAIDA ' +
                       'AND DC_CONTRATO = EX_CONTRATO ' +
                       'AND DC_TIPO = ''P'' ' +
                       'AND LE_CONPAGO = 50 ' +
                       'AND LE_IDCHEQUEEMITIDO = :IdCheque ' +
                    'UNION ' +
                    'SELECT CA_CALLECOMERCIAL, CA_NUMEROCOMERCIAL, CA_PISOCOMERCIAL, CA_DEPARTAMENTOCOMERCIAL, ' +
                           'CA_CODPOSTALCOMERCIAL, CA_LOCALIDADCOMERCIAL, NVL(CA_PROVINCIACOMERCIAL, 0) ' +
                      'FROM ART.CPR_PRESTADOR, ART.SVO_VOLANTES ' +
                     'WHERE VO_PRESTADOR = CA_IDENTIFICADOR ' +
                       'AND CA_PROVINCIACOMERCIAL IS NOT NULL ' +
                       'AND VO_ORDENPAGO = :OrdenPago ' +
                    'UNION ' +
                    'SELECT CA_CALLE, CA_NUMERO, CA_PISOCALLE, CA_DEPARTAMENTO, CA_CODPOSTAL, ' +
                           'CA_LOCALIDAD, NVL(CA_PROVINCIA, 0) ' +
                      'FROM ART.CPR_PRESTADOR, ART.SVO_VOLANTES ' +
                     'WHERE VO_PRESTADOR = CA_IDENTIFICADOR ' +
                       'AND CA_PROVINCIACOMERCIAL IS NULL ' +
                       'AND VO_ORDENPAGO = :OrdenPago ' +
                    'UNION ' +
                    'SELECT EN_CALLE, EN_NUMERO, EN_PISO, EN_DEPARTAMENTO, EN_CPOSTAL, EN_LOCALIDAD, NVL(EN_PROVINCIA, 0) ' +
                      'FROM XEN_ENTIDAD, XFC_FACTURA ' +
                     'WHERE EN_ID = FC_IDENTIDAD ' +
                       'AND FC_FECHABAJA IS NULL ' +
                       'AND FC_IDCHEQUEEMITIDO = :IdCheque ' +
                    'UNION ' +
                    'SELECT PR_RCALLE CALLE, PR_RNUMERO NUMERO, PR_RPISO PISO, PR_RDEPARTAMENTO DEPARTAMENTO, ' +
                           'PR_RCPOSTAL CPOSTAL, PR_RLOCALIDAD LOCALIDAD, NVL(PR_RPROVINCIA, 0) PROVINCIA ' +
                      'FROM ADC_DOMICILIOCONTRATO, ART.SEX_EXPEDIENTES, ART.SPR_PAGOEXPESIN ' +
                     'WHERE EX_SINIESTRO = PR_SINIESTRO ' +
                       'AND EX_ORDEN = PR_ORDEN ' +
                       'AND EX_RECAIDA = PR_RECAIDA ' +
                       'AND DC_CONTRATO = EX_CONTRATO ' +
                       'AND DC_TIPO = ''P'' ' +
                       'AND PR_IDCHEQUEEMITIDO = :IdCheque';

            IdCheque := sdqConsulta.FieldByName('CHECK_ID').AsInteger;
            OPago    := sdqConsulta.FieldByName('OP').AsInteger;

            sdq := GetQueryEx(sSql, [IdCheque, OPago, OPago, IdCheque]);
            with sdq do
              try
                if not Eof then
                  begin
                    DoGrabarSobre(IdCheque, FieldByName('CALLE').AsString, FieldByName('NUMERO').AsString, FieldByName('PISO').AsString,
                                  FieldByName('DEPARTAMENTO').AsString, FieldByName('LOCALIDAD').AsString, FieldByName('CPOSTAL').AsString,
                                  FieldByName('PROVINCIA').AsInteger, 0, 0, fraModoEnvioMasivo.Value);

                    Inc(iCant);
                  end;
              finally
                Free;
              end;
          end;

        CommitTrans;

        if iCant > 0 then
          begin
            MsgBox('Domicilios guardados correctamente.' + CRLF + 'La cantidad de sobres cargados fue de: ' + IntToStr(iCant) + '.', MB_ICONINFORMATION);
            tbRefrescarClick(nil);
          end
        else
          MsgBox('No se ha cargado ningún sobre.', MB_ICONERROR);
      except
        on E: Exception do
        begin
          RollBack;
          raise Exception.Create(E.Message + CRLF + 'Error al grabar los domicilios.');
        end;
      end;
    end;
end;

procedure TfrmConsCheques.fpSobreMasivoEnter(Sender: TObject);
begin
  fraModoEnvioMasivo.Clear;
end;

procedure TfrmConsCheques.btnAceptarSobresMasivoClick(Sender: TObject);
begin
  Verificar(fraModoEnvioMasivo.IsEmpty, fraModoEnvioMasivo, 'Debe indicar el modo de envío.');

  fpSobreMasivo.ModalResult := mrOk;
end;

procedure TfrmConsCheques.btnAceptarRecepcionReciboClick(Sender: TObject);
var
  i: Integer;
begin
  Verificar(rgTipoRecibo.ItemIndex = -1, rgTipoRecibo, 'Debe indicar el tipo de recibo.');

  if rgTipoRecibo.ItemIndex = 0 then
    begin
      Verificar(edNroSerieRecibo.IsEmpty, edNroSerieRecibo, 'Debe ingresar el número de serie del recibo.');
      Verificar(edNroSerieRecibo.Value < 0, edNroSerieRecibo, 'Debe indicar el número de serie del recibo.');
      Verificar(edNroRecibo.Value <= 0, edNroRecibo, 'Debe indicar el número del recibo.');
      Verificar(edFechaRecibo.IsEmpty, edFechaRecibo, 'Debe indicar la fecha del recibo.');
      Verificar(edFechaRecibo.Date > DBDate(), edFechaRecibo, 'La fecha del recibo no puede ser mayor a la fecha actual.');
    end;

  BeginTrans;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        if IsRegistroValidoRecepcionRecibo then
          DoGrabarRecepcionRecibo(rgTipoRecibo.ItemIndex, edNroSerieRecibo.Value, edNroRecibo.Value, edFechaRecibo.Date);
      end;

    CommitTrans;
    MsgBox('Recepciones de los recibos guardadas correctamente.', MB_ICONINFORMATION);
    fpRecepcionRecibo.ModalResult := mrOk;
  except
    on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + CRLF + 'Error al grabar la recepción de los recibos.');
      end;
  end;
end;

procedure TfrmConsCheques.fpRecepcionReciboEnter(Sender: TObject);
begin
  rgTipoRecibo.ItemIndex := -1;
  edNroSerieRecibo.Clear;
  edNroRecibo.Clear;
  edFechaRecibo.Clear;
  rgTipoReciboClick(nil);
  rgTipoRecibo.SetFocus;
end;

procedure TfrmConsCheques.rgTipoReciboClick(Sender: TObject);
var
  bEsRecibo: Boolean;
begin
  bEsRecibo := (rgTipoRecibo.ItemIndex = 0);

  VCLExtra.LockControls([edNroSerieRecibo, edNroRecibo, edFechaRecibo], not bEsRecibo);

  if not bEsRecibo then
    begin
      edNroSerieRecibo.Clear;
      edNroRecibo.Clear;
      edFechaRecibo.Clear;
    end;
end;

function TfrmConsCheques.IsRegistroValidoRecepcionRecibo: Boolean;
begin
  Result := (AreIn(UpperCase(sdqConsulta.FieldByName('DESCRIPTION').AsString), [UpperCase(MP_CHEQUE)]) and sdqConsulta.FieldByName('TIPORECIBO').IsNull);
end;

procedure TfrmConsCheques.DoGrabarRecepcionRecibo(TipoRecibo, NroSerieRecibo, NroRecibo: Integer; FechaRecibo: TDateTime);
var
  sSql: String;
begin
  sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
             'SET CE_TIPORECIBO = :TipoRecibo, ' +
                 'CE_USURECEPCION = :UserId, ' +
                 'CE_FECHARECEPCION = SYSDATE ' +
           String(Iif(TipoRecibo = 0, ', CE_NRORECIBO = ' + SqlValue(LPad(NroSerieRecibo, '0', 4) + LPad(NroRecibo, '0', 8)) + ', CE_FECHARECIBO = ' + SqlValue(FechaRecibo) + ' ', '')) +
           'WHERE CE_ID = :IdRCE ' +
             'AND CE_TIPORECIBO IS NULL';
  EjecutarSqlSTEx(sSql, [Iif(TipoRecibo = 0, 'RO', 'OP'), Sesion.UserId, sdqConsulta.FieldByName('CHECK_ID').AsInteger]);
end;

procedure TfrmConsCheques.DoGrabarRecepcionReciboOrdenPago;
var
  i: Integer;
begin
  BeginTrans;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        if not IsRegistroValidoRecepcionRecibo then
          DoGrabarRecepcionRecibo(1, 0, 0, 0);
      end;

    CommitTrans;
  except
    on E: Exception do
    begin
      RollBack;

      raise Exception.Create(E.Message + CRLF + 'Error al grabar la recepción de los recibos tipo OP.');
    end;
  end;
end;

procedure TfrmConsCheques.mnuOrdenPagoClick(Sender: TObject);
var
  sDummy: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');
  Verificar(not sdqConsulta.FieldByName('CE_IDCHEQUEREEMP').IsNull, Grid, 'No puede imprimir la orden de pago de un cheque reemplazante.');

  DoImprimirOP(sdqConsulta.FieldByName('OP').AsInteger, trPreviewOP, sDummy);
end;

procedure TfrmConsCheques.mnuCertRetencionClick(Sender: TObject);
var
  sDummy: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo una fila de la grilla.');
  Verificar(not sdqConsulta.FieldByName('CE_IDCHEQUEREEMP').IsNull, Grid, 'No puede imprimir la orden de pago de un cheque reemplazante.');

  if DoImprimirCertificadoRetencion(sdqConsulta.FieldByName('OP').AsInteger, trPreviewCR, sDummy) = rrSinDatos then
    MsgBox('No se han encontrado datos.', MB_ICONINFORMATION);
end;

function TfrmConsCheques.GetProxNroCheque(IdCuentaBancaria: TTableId; var ProxNroCheque, IdTablaStockCheques: Integer): Boolean;
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT CS.LAST_DOCUMENT_NUM + 1, CS.CHECK_STOCK_ID ' +
            'FROM AP_CHECK_STOCKS_ALL CS, AP_BANK_ACCOUNTS_ALL BA ' +
           'WHERE CS.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID ' +
             'AND CS.ATTRIBUTE3 = ''R'' ' +
             'AND BA.ATTRIBUTE1 = ' + SqlValue(IdCuentaBancaria);

  SqlResults := dmFinancials.ValoresColSql(sSql);
  try
    ProxNroCheque       := StrToIntDef(SqlResults[0], 0);
    IdTablaStockCheques := StrToIntDef(SqlResults[1], 0);
  finally
    SqlResults.Free;
  end;

  Result := (IdTablaStockCheques <> 0);

  if Result then
    DoActualizarTablaStockCheques(IdTablaStockCheques);
end;

procedure TfrmConsCheques.DoActualizarTablaStockCheques(IdTablaStockCheques: Integer);
var
  sSql: String;
begin
  sSql := 'UPDATE AP_CHECK_STOCKS_ALL ' +
             'SET LAST_DOCUMENT_NUM = LAST_DOCUMENT_NUM + 1 ' +
           'WHERE CHECK_STOCK_ID = :Id';
  dmFinancials.EjecutarSqlEx(sSql, [IdTablaStockCheques]);
end;

end.

