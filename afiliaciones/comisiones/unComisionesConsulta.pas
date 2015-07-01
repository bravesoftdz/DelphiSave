unit unComisionesConsulta;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   31-01-2003
}

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, IntEdit, StdCtrls, Mask, ToolEdit, DateComboBox, unfraEntidadCUIT,
  unArtFrame, unFraCodigoDescripcion, unfraVendedores, unfraVendedoresCUIT, unArtDbFrame, unFraEmpresa, unfraCtbTablas,
  Menus, FormPanel, unDmFinancials, PatternEdit, unArtDBAwareFrame, unArt, 
  unFraCodDesc, unFraStaticCodigoDescripcion, QuickRpt, PeriodoPicker,
  ComboEditor, CheckCombo, DBCheckCombo;

type
  TfrmComisionesConsulta = class(TfrmCustomConsulta)
    pgCtrlComisiones: TPageControl;
    tbLiquidacion: TTabSheet;
    tbAfiliacion: TTabSheet;
    GridAfiliacion: TArtDBGrid;
    GBVendedor: TGroupBox;
    GBEntidad: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    cmbCP_FECHACIERREDesde: TDateComboBox;
    Label3: TLabel;
    cmbCP_FECHACIERREHasta: TDateComboBox;
    Label6: TLabel;
    edLC_IDDesde: TIntEdit;
    Label9: TLabel;
    edLC_IDHasta: TIntEdit;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    fraEM_ID: TfraEmpresa;
    Label18: TLabel;
    Label19: TLabel;
    sdqAfiliacion: TSDQuery;
    dsAfiliacion: TDataSource;
    PopMenuImpresion: TPopupMenu;
    mnuReimprimirLiquidacion: TMenuItem;
    mnuResultados: TMenuItem;
    mnuCertificadosdeRetenciones: TMenuItem;
    mnuComisionesPorVendedor: TMenuItem;
    mnuPagosPorVendedorComis: TMenuItem;
    sdqFinancial: TSDQuery;
    tbFinancials: TToolButton;
    tbCancelar: TToolButton;
    tbSumatoria: TToolButton;
    mnuEnviarLiquidacionPorMail: TMenuItem;
    tbSalir2: TToolButton;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    SDUpdateSQLConsulta: TSDUpdateSQL;
    SortDialogAfiliacion: TSortDialog;
    tbEntidades: TTabSheet;
    dbgEntidades: TArtDBGrid;
    dsEntidades: TDataSource;
    sdqEntidades: TSDQuery;
    SortDialogEntidades: TSortDialog;
    fpImpresion: TFormPanel;
    Bevel1: TBevel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    rgOrden: TRadioGroup;
    rgReporte: TRadioGroup;
    N1: TMenuItem;
    N2: TMenuItem;
    fraEntidadDesde: TfraEntidadCUIT;
    fraEntidadHasta: TfraEntidadCUIT;
    fraVendedorDesde: TfraVendedoresCUIT;
    fraVendedorHasta: TfraVendedoresCUIT;
    tbFacturas: TToolButton;
    pnlFactura: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    cmbFC_FECHAAPROBADODesde: TDateComboBox;
    cmbFC_FECHAAPROBADOHasta: TDateComboBox;
    Label15: TLabel;
    Label17: TLabel;
    cmbFC_FECHARECEPFACTDesde: TDateComboBox;
    cmbFC_FECHARECEPFACTHasta: TDateComboBox;
    chkSaltoPagina: TCheckBox;
    chkVistaPrevia: TCheckBox;
    lbReporte: TPanel;
    gbFechas: TGroupBox;
    cmbFechaDesde: TDateComboBox;
    cmbFechaHasta: TDateComboBox;
    Label24: TLabel;
    mnuPagosPorVendedorMant: TMenuItem;
    btnEnviarMail: TButton;
    fraEM_HOLDING: TfraCodDesc;
    tbCancelarAprobadas: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    fraPC_IDCONCEPTO: TfraStaticCodigoDescripcion;
    Label2: TLabel;
    Label4: TLabel;
    cmbLC_FECHAAPROBADODesde: TDateComboBox;
    Label8: TLabel;
    cmbLC_FECHAAPROBADOHasta: TDateComboBox;
    chkLiquidacionesEnCero: TCheckBox;
    tbRevision: TToolButton;
    chkSinFactura: TCheckBox;
    edPC_PERIODODesde: TPeriodoPicker;
    Label11: TLabel;
    cmbLC_ESTADO: TDBCheckCombo;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    Label12: TLabel;
    edPC_PERIODOHasta: TPeriodoPicker;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure mnuReimprimirLiquidacionClick(Sender: TObject);
    procedure mnuResultadosClick(Sender: TObject);
    procedure mnuCertificadosdeRetencionesClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbFinancialsClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridAfiliacionPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure mnuEnviarLiquidacionPorMailClick(Sender: TObject);
    procedure sdqAfiliacionFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tbExportarClick(Sender: TObject);
    procedure pgCtrlComisionesChange(Sender: TObject);
    procedure pgCtrlComisionesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbOrdenarClick(Sender: TObject);
    procedure sdqEntidadesAfterScroll(DataSet: TDataSet);
    procedure dbgEntidadesPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqAfiliacionAfterOpen(DataSet: TDataSet);
    procedure btnAceptar2Click(Sender: TObject);
    procedure mnuComisionesPorVendedorClick(Sender: TObject);
    procedure mnuPagosPorVendedorComisClick(Sender: TObject);
    procedure fpImpresionBeforeShow(Sender: TObject);
    procedure tbFacturasClick(Sender: TObject);
    procedure CompletarFactura(Sender: TObject);
    procedure rgReporteClick(Sender: TObject);
    procedure tbCancelarAprobadasClick(Sender: TObject);
    procedure tbRevisionClick(Sender: TObject);
  private
    bFinished: Boolean;
    FPaginaAnterior  : Integer;
    TotalEntidades   : Array of Extended;
    TotalAfiliacion  : Array of Extended;
    TotalLiquidacion : Array of Extended;

    function Get_NroFactura(EntVend: String; IdLiq: Integer): String;
    procedure ImprimirConsulta(Query: TSDQuery; Grilla: TArtDBGrid; Titulo: String);
    procedure ExportarConsulta(Query: TSDQuery; Grilla: TArtDBGrid);
    procedure CargarFinancials;
    procedure CalcTotales;
    procedure ImprimirReporte(rep: TQuickRep; PorMail, VistaPrevia: Boolean; Archivo, Destinatario: String);  protected
    function GuardaDatos(Modo: String; Aprobada: Boolean; var IdLiquidacion: TTableId): Boolean;
    procedure CheckButtons; override;
    function GetIdLiquidacion(var EntVendLiq: String): TTableId;
    function ImpresionPorRangoFechas: Boolean;
    procedure DoEnviarMailLiquidacionCancelada(IdNuevaLiq: TTableId);
  public
    function Revisar(iEntidadVendedor: integer; var iLiquidacion: integer; var EntVendLiq: String): Boolean;
    property Finished: boolean read bFinished write bFinished;
  end;

var
  frmComisionesConsulta: TfrmComisionesConsulta;

implementation
{$R *.DFM}

uses
  unPrincipal, unDmPrincipal, CustomDlgs, unFiltros, VCLExtra, AnsiSQL, SqlFuncs, unfirmantes, strFuncs, unSesion,
  unRPTComisionesConsulta, unRPTLiquidacionComisiones, DBFuncs, General, QRExport, unConsultaFacturas,
  unExportPDF, ArchFuncs, Cuit, unComunes, unRptRetencionGanancias_IVA, unComisiones,
  unAdmInterfaces, unMoldeEnvioMail, unEspera;

const
  {
  PEQUEÑO SALTAMONTES:
  LA VENTAJA DE USAR LAS CONSTANTES Y PONERLAS AL INICIO
  ES QUE SE ENCUENTRA RAPIDAMENTE EL SQL DE LA GRILLA, SIN QUE HAYA NECESIDAD
  DE NAVEGAR POR TODO EL CODIGO, HACIENDO QUE SEA MAS SENCILLO DE LEER
  }

  CONSULTA_ENTIDAD_1 : string = 'SELECT MAX(CP_FECHACIERRE) FECHALIQUIDACION, EN_ID CODENTIDAD, ' +
                                       'EN_NOMBRE NOMBREENTIDAD, EN_CUIT CUITENTIDAD, ' +
                                       'EN_CODBANCO CODSUCURSAL, SUM(LC_COBRADO) TOTALCOBRADO, ' +
                                       'SUM(LC_COBRADONETO) COBRADONETODEIMPUESTOS, SUM(LC_COMISION) COMISION, ' +
                                       'SUM(LC_IVA) IVA, SUM(LC_OBRASOCIAL) RETOS, SUM(LC_INGBRUTOS) RETIB, ' +
                                       'SUM(LC_GANANCIAS) RETGCIAS, SUM(LC_COMISIONNETA) NETO ' +
                                  'FROM XEN_ENTIDAD, XCP_CIERREPAGO, XLC_LIQCOMISION ' +
                                 'WHERE LC_IDENTIDAD = EN_ID ' +
                                   'AND LC_IDCIERREPAGO = CP_ID ' +
                                   'AND LC_ESTADO <> ''C''';

  CONSULTA_ENTIDAD_1_GB : string = 'GROUP BY EN_ID, EN_NOMBRE, EN_CUIT, EN_CODBANCO ';

  CONSULTA_ENTIDAD_2 : string = 'SELECT MAX(CP_FECHACIERRE) FECHALIQUIDACION, EN_ID CODENTIDAD, ' +
                                       'EN_NOMBRE NOMBREENTIDAD, EN_CUIT CUITENTIDAD, ' +
                                       'EN_CODBANCO CODSUCURSAL, SUM(LC_COBRADO) TOTALCOBRADO, ' +
                                       'SUM(LC_COBRADONETO) COBRADONETODEIMPUESTOS, SUM(LC_COMISION) COMISION, ' +
                                       'SUM(LC_IVA) IVA, SUM(LC_OBRASOCIAL) RETOS, SUM(LC_INGBRUTOS) RETIB, ' +
                                       'SUM(LC_GANANCIAS) RETGCIAS, SUM(LC_COMISIONNETA) NETO ' +
                                  'FROM XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XCP_CIERREPAGO, XLC_LIQCOMISION ' +
                                 'WHERE LC_IDENTIDADVENDEDOR = EV_ID ' +
                                   'AND EN_ID = EV_IDENTIDAD ' +
                                   'AND LC_IDCIERREPAGO = CP_ID ' +
                                   'AND LC_ESTADO <> ''C''';

  CONSULTA_ENTIDAD_2_GB : string = 'GROUP BY EN_ID, EN_NOMBRE, EN_CUIT, EN_CODBANCO ';

  CONSULTA_LIQUIDACION_1 : string = 'SELECT DISTINCT LC_ID, CP_FECHACIERRE "Fecha Liquidación", en_id "Cod. Entidad", en_nombre "Nombre Entidad", ' +
                                           'en_cuit "CUIT Entidad", en_codbanco "Cod. Sucursal", null "Cod. Vendedor", null "Nombre Vendedor", null ' +
                                           '"CUIT Vendedor", EN_DIRELECTRONICA "Mail", lc_cobrado "Total Cobrado", lc_cobradoneto "Cobrado Neto de Impuestos", lc_comision "Monto Liquidado", ' +
                                           'lc_iva "IVA", lc_obrasocial "Ret. OS", lc_ingbrutos "Ret. IB", lc_comisionneta "Neto", lc_estado ' +
                                           '"Estado", tb_descripcion "Estado Liq.", lc_fechaaprobado "Fecha Aprobado", lc_beneficiario "Beneficiario", lc_facturatipo ' +
                                           '"Tipo de Factura", lc_facturanro "Factura", lc_fechafactura "Fecha Factura", lc_fecharecepfact ' +
                                           '"Fecha Recepción Factura", LC_IDENTIDAD, LC_IDENTIDADVENDEDOR, ' +
                                           'LC_ESTADO, TO_NUMBER(NULL) "Orden de Pago", TO_DATE(NULL) "Fecha OP", lc_beneficiario "Método de Pago", lc_beneficiario "Cheque", lc_beneficiario ' +
                                           '"Beneficiario Cheque", lc_beneficiario "Estado del Cheque", lc_ganancias "Ret. Gcias", EN_MODOLIQ, ' +
                                           'LC_RETIVA RETIVA, TRUNC(LC_FECHAREVISION) "F. Revisión" ' +
                                     ' FROM CTB_TABLAS, XEN_ENTIDAD, XLC_LIQCOMISION, XPC_PAGOCOMISION, XCP_CIERREPAGO, AVC_VENDEDORCONTRATO ' +
                                    ' WHERE LC_IDENTIDAD = EN_ID' +
                                      ' AND TB_CLAVE = ''CELIQ''' +
                                      ' AND TB_CODIGO = LC_ESTADO' +
                                      ' AND PC_IDLIQCOMISION(+) = LC_ID' +
                                      ' AND LC_IDCIERREPAGO = CP_ID' +
                                      ' AND PC_IDVENDCONTRATO = VC_ID(+) ';

  CONSULTA_LIQUIDACION_2 : string = 'SELECT DISTINCT LC_ID, CP_FECHACIERRE "Fecha Liquidación", en_id "Cod. Entidad", en_nombre "Nombre Entidad", en_cuit ' +
                                           '"CUIT Entidad", en_codbanco "Cod. Sucursal", ve_vendedor "Cod. Vendedor", ve_nombre "Nombre Vendedor", ve_cuit ' +
                                           '"CUIT Vendedor", VE_DIRELECTRONICA "Mail", lc_cobrado "Total Cobrado", lc_cobradoneto "Cobrado Neto de Impuestos", lc_comision "Monto Liquidado", ' +
                                           'lc_iva "IVA", lc_obrasocial "Ret. OS", lc_ingbrutos "Ret. IB", lc_comisionneta "Neto", lc_estado ' +
                                           '"Estado", tb_descripcion "Estado Liq.", lc_fechaaprobado "Fecha Aprobado", lc_beneficiario "Beneficiario", lc_facturatipo ' +
                                           '"Tipo de Factura", lc_facturanro "Factura", lc_fechafactura "Fecha Factura", lc_fecharecepfact ' +
                                           '"Fecha Recepción Factura" , LC_IDENTIDAD, LC_IDENTIDADVENDEDOR, LC_ESTADO,' +
                                           'TO_NUMBER(NULL) "Orden de Pago", TO_DATE(NULL) "Fecha OP", lc_beneficiario "Método de Pago", lc_beneficiario "Cheque", lc_beneficiario "Beneficiario Cheque", lc_beneficiario ' +
                                           '"Estado del Cheque", lc_ganancias "Ret. Gcias", EN_MODOLIQ, LC_RETIVA RETIVA, TRUNC(LC_FECHAREVISION) "F. Revisión" ' +
                                     ' FROM XEN_ENTIDAD, CTB_TABLAS, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XCP_CIERREPAGO, XLC_LIQCOMISION, AVC_VENDEDORCONTRATO ' +
                                    ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                      ' AND TB_CLAVE = ''CELIQ''' +
                                      ' AND TB_CODIGO = LC_ESTADO' +
                                      ' AND EV_IDVENDEDOR = VE_ID' +
                                      ' AND LC_IDCIERREPAGO = CP_ID' +
                                      ' AND VC_IDENTIDADVEND(+) = EV_ID' +
                                      ' AND EN_ID = EV_IDENTIDAD ';

  CONSULTA_MOVINCLUIDOS_1: String =
    'SELECT lc_id, lc_identidad "Cod. Entidad", en_nombre "Nombre Entidad", en_codbanco "Cod. Sucursal", ve_vendedor "Cod. Vendedor", ' +
           've_nombre "Nombre Vendedor", pc_periodo "Periodo", pc_cobrado "Total Cobrado", ' +
           'pc_cobradoneto "Cobrado Neto de Impuestos", pc_comision "Monto Liquidado", em_id, ge_codigo em_holding, lc_identidad, ' +
           'lc_identidadvendedor, em_cuit "CUIT", co_contrato "Contrato", em_nombre "Razón Social", co_descripcion "Concepto", ' +
           'pc_descaumento "Desc. Aumento", cp_fechacierre "Fecha Liquidación" ' +
      'FROM XEN_ENTIDAD, AEM_EMPRESA, ACO_CONTRATO, AVC_VENDEDORCONTRATO, XCP_CIERREPAGO, XPC_PAGOCOMISION, AGE_GRUPOECONOMICO, ' +
           'XLC_LIQCOMISION, XCO_CONCEPTO, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR ' +
     'WHERE LC_IDCIERREPAGO = CP_ID ' +
       'AND LC_IDENTIDAD = EN_ID ' +
       'AND PC_IDLIQCOMISION = LC_ID ' +
       'AND PC_IDVENDCONTRATO = VC_ID(+) ' +
       'AND VC_CONTRATO = CO_CONTRATO(+) ' +
       'AND CO_IDEMPRESA = EM_ID(+) ' +
       'AND EM_IDGRUPOECONOMICO = GE_ID(+) ' +
       'AND VC_IDENTIDADVEND = EV_ID(+) ' +
       'AND EV_IDVENDEDOR = VE_ID(+) ' +
       'AND CO_ID = PC_IDCONCEPTO ';

  CONSULTA_MOVINCLUIDOS_2: String =
    'SELECT lc_id, en_id "Cod. Entidad", en_nombre "Nombre Entidad", en_codbanco "Cod. Sucursal", ve_vendedor "Cod. Vendedor", ' +
           've_nombre "Nombre Vendedor", pc_periodo "Periodo", pc_cobrado "Total Cobrado", ' +
           'pc_cobradoneto "Cobrado Neto de Impuestos", pc_comision "Monto Liquidado", em_id, ge_codigo em_holding, lc_identidad, ' +
           'lc_identidadvendedor, em_cuit "CUIT", co_contrato "Contrato", em_nombre "Razón Social", co_descripcion "Concepto", ' +
           'pc_descaumento "Desc. Aumento", cp_fechacierre "Fecha Liquidación" ' +
      'FROM xve_vendedor, aem_empresa, aco_contrato, avc_vendedorcontrato, xcp_cierrepago, xen_entidad, xev_entidadvendedor, ' +
           'xpc_pagocomision, xlc_liqcomision, age_grupoeconomico, xco_concepto ' +
     'WHERE LC_IDENTIDADVENDEDOR = EV_ID ' +
       'AND EV_IDVENDEDOR = VE_ID ' +
       'AND EV_IDENTIDAD = EN_ID ' +
       'AND (LC_IDENTIDADVENDEDOR IS NOT NULL ' +
            'OR EN_MODOLIQ = ''03'') ' +
       'AND PC_IDLIQCOMISION = LC_ID ' +
       'AND PC_IDVENDCONTRATO = VC_ID(+) ' +
       'AND CO_IDEMPRESA = EM_ID(+) ' +
       'AND LC_IDCIERREPAGO = CP_ID ' +
       'AND EM_IDGRUPOECONOMICO = GE_ID(+) ' +
       'AND VC_CONTRATO = CO_CONTRATO(+) ' +
       'AND CO_ID = PC_IDCONCEPTO ';

  CONSULTA_FINANCIALS1 : string = 'SELECT po.payment_order_id "Orden de Pago", Trunc(po.payment_date) "Fecha OP", ' +
                                         'pmt.description "Método de Pago", ch.check_number "Cheque", ' +
                                         'sc.beneficiario "Beneficiario Cheque", ec.descripcion "Estado" ' +
                                    'FROM SCOTT.ESTADO_CHEQUES EC, SCOTT.SEGUIMIENTO_CHEQUES SC, JL_AR_B_CHECKS CH, ' +
                                         'JL_AR_B_PAYMENT_METHOD_TYPES PMT, JL_AR_B_PAYMENT_METHODS PM, ' +
                                         'JL_AR_B_PAYMENT_ORDERS PO, AP_INVOICE_PAYMENTS_ALL AIP, ' +
                                         'AP_INVOICES_ALL AI, PO_VENDORS PV ' +
                                   'WHERE AI.INVOICE_ID = AIP.INVOICE_ID ' +
                                     'AND PV.VENDOR_ID = AI.VENDOR_ID ' +
                                     'AND PO.PAYMENT_ORDER_ID = AIP.JLAR_PAYMENT_ORDER_ID ' +
                                     'AND PO.PAYMENT_ORDER_ID = PM.PAYMENT_ORDER_ID ' +
                                     'AND CH.PAYMENT_ORDER_ID(+) = PM.PAYMENT_ORDER_ID ' +
                                     'AND CH.PAYMENT_METHOD_ID(+) = PM.PAYMENT_METHOD_ID ' +
                                     'AND CH.CHECK_ID = SC.ID_FINANCIALS(+) ' +
                                     'AND SC.ESTADO = EC.CODIGO(+) ' +
                                     'AND PM.PAYMENT_METHOD_TYPE_ID = PMT.PAYMENT_METHOD_TYPE_ID ' +
                                     'AND PM.PAYMENT_METHOD_TYPE_ID NOT IN (142, 462) ' +
                                     'AND PO.CURRENT_STATUS IN (''CONFIRMED'', ''POSTED'') ';

  CONSULTA_FINANCIALS2 : string = 'SELECT ch.check_id "Orden de Pago", Trunc(ch.check_date) "Fecha OP", ' +
                                         'cs.NAME "Método de Pago", ch.check_number "Cheque", ' +
                                         'ch.attribute1 "Beneficiario Cheque", ec.descripcion "Estado" ' +
                                    'FROM SCOTT.ESTADO_CHEQUES EC, SCOTT.SEGUIMIENTO_CHEQUES SC, AP_CHECKS_ALL CH, ' +
                                         'AP_CHECK_STOCKS_ALL CS, AP_INVOICE_PAYMENTS_ALL AIP, ' +
                                         'AP_INVOICES_ALL AI, PO_VENDORS PV ' +
                                   'WHERE AI.INVOICE_ID = AIP.INVOICE_ID ' +
                                     'AND PV.VENDOR_ID = AI.VENDOR_ID ' +
                                     'AND AIP.CHECK_ID = CH.CHECK_ID ' +
                                     'AND CH.CHECK_STOCK_ID = CS.CHECK_STOCK_ID ' +
                                     'AND CH.CHECK_ID = SC.ID_FINANCIALS(+) ' +
                                     'AND CH.CHECK_NUMBER = SC.CHEQUE(+) ' +
                                     'AND SC.ESTADO = EC.CODIGO(+) ' +
                                     'AND CH.STATUS_LOOKUP_CODE = ''NEGOTIABLE'' ';

  PAGINA_ENTIDADES    = 0;
  PAGINA_LIQUIDACION  = 1;
  PAGINA_MOVINCLUIDOS = 2;

  CAMPOS_SUMA_ENT: Array [0..7] of String = ('TOTALCOBRADO', 'COBRADONETODEIMPUESTOS', 'COMISION', 'IVA', 'RETOS', 'RETIB', 'RETGCIAS', 'NETO');
  CAMPOS_SUMA_AFI: Array [0..2] of String = ('Total Cobrado', 'Cobrado Neto de Impuestos', 'Monto Liquidado');
  CAMPOS_SUMA    : Array [0..8] of String = ('Total Cobrado', 'Cobrado Neto de Impuestos', 'Monto Liquidado', 'IVA', 'Ret. OS', 'Ret. IB', 'Neto', 'Ret. Gcias', 'RETIVA');


procedure TfrmComisionesConsulta.FormCreate(Sender: TObject);
begin
  inherited;
  Grid.Parent := tbLiquidacion;

  fraEntidadDesde.ShowBajas := True;
  fraEntidadHasta.ShowBajas := True;

  fraVendedorDesde.ShowBajas := True;
  fraVendedorHasta.ShowBajas := True;

  with fraPC_IDCONCEPTO do
    begin
      TableName      := 'XCO_CONCEPTO';
      FieldID        := 'CO_ID';
      FieldCodigo    := 'CO_ID';
      FieldDesc      := 'CO_DESCRIPCION';
      FieldBaja      := 'CO_FECHABAJA';
      ExtraCondition := 'AND CO_ASIGNABLEVENDEDOR = ''S''';
      ShowBajas      := True;
    end;

  fraEM_ID.ShowBajas := True;

  CheckButtons;
  //Opciones para la impresora
  QueryPrint.PageOrientation := pxLandscape;

  SetLength(TotalEntidades, 8);
  SetLength(TotalAfiliacion, 3);
  SetLength(TotalLiquidacion, 9);

  LoadDynamicSortFields(SortDialogEntidades.SortFields,  dbgEntidades.Columns);
  LoadDynamicSortFields(SortDialog.SortFields,           Grid.Columns);
  LoadDynamicSortFields(SortDialogAfiliacion.SortFields, GridAfiliacion.Columns);
end;

procedure TfrmComisionesConsulta.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere, sWhereVendedor, sFiltroLiquidacion : String;
  sWhereEntidades, sFiltroEntidad : String;
  PrevCursor : TCursor;
  bOptimizarFFactura: Boolean;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      //Genero el where...
      bOptimizarFFactura := False;

      if not fraEM_ID.IsEmpty then
        sWhere := sWhere + ' and VC_CONTRATO = ' + fraEM_ID.edContrato.Text;

      //sWhere := sWhere + DoFiltro(pnlFactura);

      if (cmbFC_FECHARECEPFACTDesde.Date > 0) or (cmbFC_FECHARECEPFACTHasta.Date > 0)
      or (cmbFC_FECHAAPROBADODesde.Date > 0) or (cmbFC_FECHAAPROBADOHasta.Date > 0)
      then
        begin
          sWhere := sWhere + ' AND LC_ID IN (SELECT LF_IDLIQCOMISION' +
                                           ' FROM XFC_FACTURA, XLF_LIQFACTURA' +
                                          ' WHERE LF_IDFACTURA = FC_ID' +
                                            ' AND LF_FECHABAJA IS NULL' +
                                            SqlBetweenDateTime(' AND FC_FECHAAPROBADO ', cmbFC_FECHAAPROBADODesde.Date, cmbFC_FECHAAPROBADOHasta.Date) +
                                            SqlBetweenDateTime(' AND FC_FECHARECEPFACT ', cmbFC_FECHARECEPFACTDesde.Date, cmbFC_FECHARECEPFACTHasta.Date) + ')';
          if pgCtrlComisiones.ActivePageIndex = PAGINA_LIQUIDACION then
            bOptimizarFFactura := True;
        end;

      if chkSinFactura.Checked then
        sWhere := sWhere + ' AND NOT EXISTS (SELECT 1 ' +
                                              'FROM XLF_LIQFACTURA ' +
                                             'WHERE LC_ID = LF_IDLIQCOMISION ' +
                                               'AND LF_FECHABAJA IS NULL)';

      sFiltroLiquidacion := SqlBetweenDateTime(' AND CP_FECHACIERRE ', cmbCP_FECHACIERREDesde.Date, cmbCP_FECHACIERREHasta.Date) +
                            SqlBetweenDateTime(' AND LC_FECHAAPROBADO ', cmbLC_FECHAAPROBADODesde.Date, cmbLC_FECHAAPROBADOHasta.Date) +
                            SqlBetween(' AND LC_ID ', edLC_IDDesde.Value, edLC_IDHasta.Value);

      if not IsEmptyString(cmbLC_ESTADO.Text) then
        sFiltroLiquidacion := sFiltroLiquidacion + ' AND LC_ESTADO ' + cmbLC_ESTADO.InSql;

      if not chkLiquidacionesEnCero.Checked then
        sFiltroLiquidacion := sFiltroLiquidacion + ' AND LC_COMISION <> 0' ;

      sWhere := sWhere + sFiltroLiquidacion;

      //Filtros frame Entidad
      sFiltroEntidad := '';
      if fraEntidadDesde.IsSelected and (fraEntidadDesde.Value = fraEntidadHasta.Value) then
        sFiltroEntidad := sFiltroEntidad + ' AND EN_ID = ' + fraEntidadDesde.ID
      else if fraEntidadDesde.IsSelected and (fraEntidadDesde.CUIT = fraEntidadHasta.CUIT) and (fraEntidadDesde.CUIT > '') then
        sFiltroEntidad := sFiltroEntidad + ' AND EN_CUIT = ' + SQLValue(fraEntidadDesde.CUIT)
      else begin
        if Trim( fraEntidadDesde.edCodigo.Text ) > '' then
          sFiltroEntidad := sFiltroEntidad + ' AND TO_NUMBER(EN_CODBANCO) >= ' + SqlInteger(fraEntidadDesde.CodBanco);
        if Trim( fraEntidadHasta.edCodigo.Text ) > '' then
          sFiltroEntidad := sFiltroEntidad + ' AND TO_NUMBER(EN_CODBANCO) <= ' + SqlInteger(fraEntidadHasta.CodBanco);
      end;
      sWhere := sWhere + sFiltroEntidad;

      //Filtros frame Vendedor
      sWhereVendedor := '';

      if fraVendedorDesde.IsSelected and (fraVendedorDesde.Value = fraVendedorHasta.Value) then
        sWhereVendedor := sWhereVendedor + ' AND VE_ID = ' + fraVendedorDesde.ID
      else if fraVendedorDesde.IsSelected and (fraVendedorDesde.CUIT = fraVendedorHasta.CUIT) then
        sWhereVendedor := sWhereVendedor + ' AND VE_CUIT = ' + SQLValue(fraVendedorDesde.CUIT)
      else begin
        if Trim( fraVendedorDesde.edCodigo.Text ) > '' then
          sWhereVendedor := sWhereVendedor + ' AND VE_VENDEDOR >= ' + SqlValue(fraVendedorDesde.edCodigo.Text);
        if Trim( fraVendedorHasta.edCodigo.Text ) > '' then
          sWhereVendedor := sWhereVendedor + ' AND VE_VENDEDOR <= ' + SqlValue(fraVendedorHasta.edCodigo.Text);
      end;

      //Ahora escribe la consulta
      case pgCtrlComisiones.ActivePageIndex of
        PAGINA_ENTIDADES:
        begin
          //Habilita el filtrado de registros
          sdqConsulta.Filtered := False;
          // Al quebrar el codigo en dos, permite que las condiciones where y order by
          // Se cumplan para las dos partes del union all
          sWhereEntidades := sFiltroLiquidacion + sFiltroEntidad;
          sSql := CONSULTA_ENTIDAD_1 + sWhereEntidades + ' ' + CONSULTA_ENTIDAD_1_GB +
                  ' UNION ALL ' +
                  CONSULTA_ENTIDAD_2 + sWhereEntidades + ' ' + CONSULTA_ENTIDAD_2_GB;
          //Realiza la consulta
          sdqEntidades.SQL.Text := sSql + ' ' + SortNumerico(SortDialogEntidades);
          OpenQuery( sdqEntidades );
        end;

        PAGINA_LIQUIDACION:
        begin
          //Habilita el filtrado de registros
          sdqConsulta.Filtered := False;
          // Al quebrar el codigo de sql en dos, permite que las condiciones where y order by
          // se cumplan para las dos partes del union all
          sSql := '';
          if sWhereVendedor = '' then
            sSql := CONSULTA_LIQUIDACION_1 + sWhere + ' UNION ALL ';
          sSql := sSql + CONSULTA_LIQUIDACION_2 + sWhere + ' ' + sWhereVendedor;

          if bOptimizarFFactura then
            sSql := StringReplace(sSql, 'SELECT ', 'SELECT /*+ INDEX (XLC_LIQCOMISION PK_XLC_LIQCOMISION) */ ', [rfIgnoreCase]);  // para optimizar la consulta

          //Realiza la consulta
          sdqConsulta.SQL.Text := sSql + ' ' + SortNumerico(SortDialog);
          OpenQuery( sdqConsulta );
        end;

        PAGINA_MOVINCLUIDOS:
        begin
          //Habilita el filtrado de registros
          sdqConsulta.Filtered := False;

          if fraEM_HOLDING.IsSelected then
            sWhere := sWhere + DoFiltroComponente(fraEM_HOLDING, 'GE_CODIGO');

          if fraPC_IDCONCEPTO.IsSelected then
            sWhere := sWhere + ' AND PC_IDCONCEPTO = ' + SqlValue(fraPC_IDCONCEPTO.Value);

          sWhere := sWhere + SqlBetween(' AND PC_PERIODO ', edPC_PERIODODesde.Periodo.Valor, edPC_PERIODOHasta.Periodo.Valor);

          // Al quebrar el codigo en dos, permite que las condiciones where y order by
          // Se cumplan para las dos partes del union all
          sSql := '';
          if sWhereVendedor = '' then
            sSql := CONSULTA_MOVINCLUIDOS_1 + sWhere + ' UNION ALL ';
          sSql := sSql + CONSULTA_MOVINCLUIDOS_2 + sWhere + ' ' + sWhereVendedor;
          //Realiza la consulta
          sdqAfiliacion.SQL.Text := sSql + ' ' + SortNumerico(SortDialogAfiliacion);
          OpenQuery( sdqAfiliacion );
        end;
      end; //Del case
      tbFinancialsClick (nil);
      CalcTotales;
    except
      On E: Exception do ErrorMsg( E, 'Error al ejecutar la consulta de selección' );
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
  CheckButtons;
end;

function TfrmComisionesConsulta.GuardaDatos(Modo: string; Aprobada: Boolean; var IdLiquidacion: TTableId): boolean;
var
  Sql: TSql;
  sSql, sTipoLiq: String;
  Id: TTableId;
begin
  Sql := TSql.Create( 'XLC_LIQCOMISION' );
  Try
    if Modo = 'cancelar' then
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add( 'LC_ID', sdqConsulta.FieldbyName('LC_ID').AsString);
      //Agrego los campos
      Sql.Fields.Add( 'LC_FECHAMODIF', exDateTime );
      Sql.Fields.Add( 'LC_USUMODIF',   Sesion.UserID );
      Sql.Fields.Add( 'LC_ESTADO',     'C');
    end;

    BeginTrans;
    if Aprobada then
      begin
        dmFinancials.Conectar;
        dmFinancials.BeginTrans;
      end;
    Try
     EjecutarSqlST( Sql.Sql );

     if Aprobada then
       begin
         if not sdqConsulta.FieldByName('LC_IDENTIDAD').IsNull then
           begin
             Id := sdqConsulta.FieldByName('LC_IDENTIDAD').AsInteger;
             sTipoLiq := 'E';
           end
         else
           begin
             Id := sdqConsulta.FieldByName('LC_IDENTIDADVENDEDOR').AsInteger;
             sTipoLiq := 'V';
           end;

         sSql := 'INSERT INTO xcc_cuentacorriente (cc_id, cc_identvend, cc_idconcepto, cc_importe, ' +
                                                  'cc_detalle, cc_usualta, cc_fechaalta, cc_idliquidacion, ' +
                                                  'cc_identidad, cc_fecha, cc_idvendedor) ' +
                 '(SELECT seq_xcc_id.NEXTVAL, cc_identvend, cc_idconcepto, ' +
                         '-cc_importe, ''Liquidación Cancelada'' CC_DETALLE, ' +
                         ':usuario cc_usualta, SYSDATE cc_fechaalta, ' +
                         'cc_idliquidacion, cc_identidad, cc_fecha, cc_idvendedor ' +
                    'FROM xcc_cuentacorriente ' +
                   'WHERE cc_idliquidacion = :idliq)';
         EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldbyName('LC_ID').AsInteger]);

         Do_GenerarAsiento_Comisiones(0, 0, sdqConsulta.FieldbyName('LC_ID').AsInteger, True);

         sSql := 'SELECT NVL(MAX(LC_ID), 0) + 1 ' +
                   'FROM XLC_LIQCOMISION';
         IdLiquidacion := ValorSqlInteger(sSql);

         if DoLiquidar(Id, sTipoLiq, False) then
           Do_GenerarAsiento_Comisiones(0, 0, IdLiquidacion, False);

         dmFinancials.CommitTrans;
       end;

     CommitTrans;

     result := True;
    Except on E: Exception do
      begin
        result := False;
        Rollback;
        if Aprobada then
          dmFinancials.RollBack;
        ErrorMsg( E );
      end;
    end;
  finally
    Sql.Free;
    if Aprobada then
      dmFinancials.DesConectar;
  end;
end;

procedure TfrmComisionesConsulta.mnuReimprimirLiquidacionClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Eof or sdqConsulta.IsEmpty, nil, 'Debe seleccionar algún registro de la solapa de Liquidaciones.');

  fpImpresion.Tag := 4; // Tag especial que indica que viene del Formulario de Liquidación
  lbReporte.Caption := TMenuItem(Sender).Caption;
  fpImpresion.ShowModal;
end;

procedure TfrmComisionesConsulta.mnuResultadosClick(Sender: TObject);
begin
  //Imprime la grilla
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_ENTIDADES:
      ImprimirConsulta(sdqEntidades, dbgEntidades, 'Consulta de Comisiones - Entidades');

    PAGINA_LIQUIDACION:
      ImprimirConsulta(sdqConsulta, Grid, 'Consulta de Comisiones - Liquidación');

    PAGINA_MOVINCLUIDOS:
      ImprimirConsulta(sdqAfiliacion, GridAfiliacion, 'Consulta de Comisiones - Movimientos Incluidos');
  end;
end;

procedure TfrmComisionesConsulta.mnuCertificadosdeRetencionesClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Eof or sdqConsulta.IsEmpty, nil, 'Debe seleccionar algún registro de la solapa de Liquidaciones.');

  Verificar(sdqConsulta.FieldByName('LC_ESTADO').AsString <> 'A', nil, 'La liquidación no está aprobada.');
  fpImpresion.Tag := 3; // Tag especial que indica que viene del Certificados de Retenciones
  lbReporte.Caption := TMenuItem(Sender).Caption;
  fpImpresion.ShowModal;
end;

procedure TfrmComisionesConsulta.tbImprimirClick(Sender: TObject);
begin
  if (sdqConsulta.Active = True) And (not sdqConsulta.Eof) then
    tbImprimir.CheckMenuDropdown
  else
    MessageDlg('Debe elegir al menos un registro', mtWarning, [mbOK], 0);
end;

procedure TfrmComisionesConsulta.tbFinancialsClick(Sender: TObject);
begin
  if tbFinancials.Down then CargarFinancials;
  Grid.ColumnByField['Orden de Pago'].Visible             := tbFinancials.Down;
  Grid.ColumnByField['Fecha OP'].Visible                  := tbFinancials.Down;
  Grid.ColumnByField['Método de Pago'].Visible            := tbFinancials.Down;
  Grid.ColumnByField['Cheque'].Visible                    := tbFinancials.Down;
  Grid.ColumnByField['Beneficiario Cheque'].Visible       := tbFinancials.Down;
  Grid.ColumnByField['Estado del Cheque'].Visible         := tbFinancials.Down;
end;

procedure TfrmComisionesConsulta.tbCancelarClick(Sender: TObject);
var
  Cancelar: boolean;
  Respuesta: integer;
  IdNuevaLiq: TTableId;
begin
  Cancelar := False;
  if sdqConsulta.Active then
  begin
    Verificar((sdqConsulta.FieldByName ('LC_ESTADO').AsString = 'C') or (sdqConsulta.FieldByName ('LC_ESTADO').AsString = 'A') , nil, 'No se puede cancelar esta liquidación.');
    Cancelar := True;
  end;

  if Cancelar then
  begin
    Respuesta := MsgBox ('¿Está seguro de querer Cancelar la liquidación?',MB_YESNO + MB_ICONQUESTION );
    if Respuesta = mrYes then
    begin
      GuardaDatos('cancelar', False, IdNuevaLiq);
      tbRefrescarClick( Nil );
    end;
  end;
end;

procedure TfrmComisionesConsulta.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  tbFinancials.Enabled := True;
  with DataSet do
  begin
    FieldByName('CUIT Entidad').EditMask              := EMSK_CUIT;
    FieldByName('CUIT Vendedor').EditMask             := EMSK_CUIT;
    FieldByName('Total Cobrado').EditMask             := '$ #,##0.00';
    FieldByName('Cobrado Neto de Impuestos').EditMask := '$ #,##0.00';
    FieldByName('Monto Liquidado').EditMask           := '$ #,##0.00';
    FieldByName('IVA').EditMask                       := '$ #,##0.00';
    FieldByName('Ret. OS').EditMask                   := '$ #,##0.00';
    FieldByName('Ret. IB').EditMask                   := '$ #,##0.00';
    FieldByName('Neto').EditMask                      := '$ #,##0.00';
    FieldByName('Ret. Gcias').EditMask                := '$ #,##0.00';

    TFloatField(FieldByName('Total Cobrado')).Currency             := True;
    TFloatField(FieldByName('Cobrado Neto de Impuestos')).Currency := True;
    TFloatField(FieldByName('Monto Liquidado')).Currency           := True;
    TFloatField(FieldByName('IVA')).Currency                       := True;
    TFloatField(FieldByName('Ret. OS')).Currency                   := True;
    TFloatField(FieldByName('Ret. IB')).Currency                   := True;
    TFloatField(FieldByName('Neto')).Currency                      := True;
    TFloatField(FieldByName('Ret. Gcias')).Currency                := True;
    TFloatField(FieldByName('RETIVA')).Currency                    := True;
  end;
end;

procedure TfrmComisionesConsulta.CargarFinancials;
var
  bFnlActive   : Boolean;
  sdqFnclDatos : TSDQuery;
  Bookmark     : {$IFDEF VER150}TBookmarkStr{$ELSE}TBookmark{$ENDIF};
  sSql, sCUIT, sFiltro, sEntVend : string;
begin

  bFnlActive := dmFinancials.Active;
  dmFinancials.Active := True;

  try
    sdqConsulta.DisableControls;

    try
      Bookmark := sdqConsulta.Bookmark;
      try
        sdqFnclDatos := TSDQuery.Create( Self );

        try
          dmFinancials.SetDatabaseToQuery( sdqFnclDatos );
          sdqConsulta.First;

          while not sdqConsulta.EOF do
            begin
              if sdqConsulta.FieldByName('CUIT Entidad').AsString <> '' then
                sCUIT := sdqConsulta.FieldByName('CUIT Entidad').AsString
              else
                sCUIT := sdqConsulta.FieldByName('CUIT Vendedor').AsString;

              sCUIT := PonerGuiones(sCUIT);
              sEntVend := iif(sdqConsulta.FieldByName('Cod. Vendedor').IsNull, sdqConsulta.FieldByName('Cod. Sucursal').AsString, sdqConsulta.FieldByName('Cod. Vendedor').AsString);

              sFiltro := ' AND ai.invoice_num = ''' + Get_NroFactura(sEntVend, sdqConsulta.FieldByName('LC_ID').AsInteger) + '''' +
                         ' AND pv.global_attribute4 = ''' + sCUIT  + ''' ';
              sSql := CONSULTA_FINANCIALS1 + sFiltro +
                      ' UNION ALL ' +
                      CONSULTA_FINANCIALS2 + sFiltro;

              dmFinancials.OpenQuery(sdqFnclDatos, sSql);
              {------------------------------------}
              sdqConsulta.Edit;
              sdqConsulta.FieldByName('Orden de Pago').Value       :=  sdqFnclDatos.FieldByName('Orden de Pago').Value;
              sdqConsulta.FieldByName('Fecha OP').Value            :=  sdqFnclDatos.FieldByName('Fecha OP').Value;
              sdqConsulta.FieldByName('Método de Pago').Value      :=  sdqFnclDatos.FieldByName('Método de Pago').Value;
              sdqConsulta.FieldByName('Cheque').Value              :=  sdqFnclDatos.FieldByName('Cheque').Value;
              sdqConsulta.FieldByName('Beneficiario Cheque').Value :=  sdqFnclDatos.FieldByName('Beneficiario Cheque').Value;
              sdqConsulta.FieldByName('Estado del Cheque').Value   :=  sdqFnclDatos.FieldByName('Estado').Value;
              sdqConsulta.Post;
              {------------------------------------}
               sdqFnclDatos.Close;

              sdqConsulta.Next;
            end;
        finally
          sdqFnclDatos.Free;
        end;
      finally
        sdqConsulta.Bookmark := Bookmark;
      end;
    finally
      sdqConsulta.EnableControls;
    end;
  finally
    dmFinancials.Active := bFnlActive;
  end;
end;

procedure TfrmComisionesConsulta.CheckButtons;
var
  bHabilitarCancelar, bHabilitar, bHabilitarListados: boolean;
begin
  bHabilitar := False;

  if pgCtrlComisiones.ActivePageIndex = PAGINA_ENTIDADES then
    begin
      bHabilitarListados := False;
      bHabilitar := sdqEntidades.Active and (not sdqEntidades.IsEmpty);

      tbFinancials.Enabled        := False;
      tbCancelar.Enabled          := False;
      tbCancelarAprobadas.Enabled := False;
      tbModificar.Enabled         := False;
      tbEliminar.Enabled          := False;
    end
  else
    begin
      bHabilitarListados := True;
      bHabilitarCancelar := False;
      
      case pgCtrlComisiones.ActivePageIndex of
        PAGINA_LIQUIDACION:
          begin
            bHabilitar := sdqConsulta.Active and (not sdqConsulta.IsEmpty);
            bHabilitarCancelar := bHabilitar;
          end;

        PAGINA_MOVINCLUIDOS:
          begin
            bHabilitar := sdqAfiliacion.Active and (not sdqAfiliacion.IsEmpty);
            bHabilitarCancelar := False;
          end;
      end;

      tbFinancials.Enabled        := bHabilitar;
      tbCancelar.Enabled          := bHabilitarCancelar;
      tbCancelarAprobadas.Enabled := bHabilitarCancelar;
      tbModificar.Enabled         := bHabilitar;
      tbEliminar.Enabled          := bHabilitar;
  end;

  tbImprimir.Enabled   := bHabilitar;
  tbExportar.Enabled   := bHabilitar;

  mnuReimprimirLiquidacion.Enabled     := bHabilitarListados;
  mnuEnviarLiquidacionpormail.Enabled  := bHabilitarListados;
  mnuCertificadosdeRetenciones.Enabled := bHabilitarListados;
  mnuComisionesPorVendedor.Enabled     := bHabilitarListados;
  mnuPagosPorVendedorComis.Enabled     := bHabilitarListados;
  mnuPagosPorVendedorMant.Enabled      := bHabilitarListados;
end;

procedure TfrmComisionesConsulta.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  sdqEntidades.Close;
  sdqConsulta.Close;
  sdqAfiliacion.Close;
  fraEntidadDesde.Clear;
  fraEntidadHasta.Clear;
  fraVendedorDesde.Clear;
  fraVendedorHasta.Clear;
  edLC_IDDesde.Clear;
  edLC_IDHasta.Clear;
  cmbCP_FECHACIERREDesde.Clear;
  cmbCP_FECHACIERREHasta.Clear;
  cmbLC_FECHAAPROBADODesde.Clear;
  cmbLC_FECHAAPROBADOHasta.Clear;
  cmbLC_ESTADO.Clear;
  cmbFC_FECHAAPROBADODesde.Clear;
  cmbFC_FECHAAPROBADOHasta.Clear;
  cmbFC_FECHARECEPFACTDesde.Clear;
  cmbFC_FECHARECEPFACTHasta.Clear;
  fraEM_HOLDING.Clear;
  fraEM_ID.Clear;
  fraPC_IDCONCEPTO.Clear;
  edPC_PERIODODesde.Clear;
  edPC_PERIODOHasta.Clear;
  chkLiquidacionesEnCero.Checked := False;
  chkSinFactura.Checked          := False;

  CheckButtons;
end;

procedure TfrmComisionesConsulta.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.Active And Not sdqConsulta.Eof then
    if sdqConsulta.FieldByName ('LC_ESTADO').AsString = 'C' then
      AFont.Color := clRed;
end;

procedure TfrmComisionesConsulta.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmComisionesConsulta.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      //Entidades
      dbgEntidades.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqEntidades.Active then
        SumFields(sdqEntidades, CAMPOS_SUMA_ENT, TotalEntidades);

      //Liquidacion
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalLiquidacion);

      //Afiliacion
      GridAfiliacion.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqAfiliacion.Active then
        SumFields(sdqAfiliacion, CAMPOS_SUMA_AFI, TotalAfiliacion);

    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmComisionesConsulta.GridAfiliacionPaintFooter(Sender: TObject; Column: String; var Value: String;
  var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos : integer;
  Buffer: array[0..63] of Char;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA_AFI);
  if (iPos > -1) and (iPos <= 2) Then
    SetString(Value, Buffer, FloatToText(Buffer, TotalAfiliacion[iPos], fvExtended, ffCurrency, 15, 2));
end;

procedure TfrmComisionesConsulta.mnuEnviarLiquidacionPorMailClick(Sender: TObject);
var
  Reporte : TfrmRPTLiquidacionComision;
  Destinatario,Archivo : string;
begin
  Verificar(sdqConsulta.Eof or sdqConsulta.IsEmpty, nil, 'Debe seleccionar algún registro de la solapa de Liquidaciones.');

  Reporte := TfrmRPTLiquidacionComision.Create ( self );
  try
    Reporte.IdLiq := sdqConsulta.fieldByName ('LC_ID').AsString;
    Destinatario := sdqConsulta.FieldByName('Mail').AsString;

    Archivo := TempPath + 'LIQUIDACION_NRO' + Reporte.IdLiq + '_' + FormatDateTime('yyyymmdd', Now) + '.pdf';
    try
      if sdqConsulta.fieldByName ('LC_IDENTIDAD').AsString <> '' then
      begin
        Reporte.Prepare('ComisionParticularEntidad');
        Reporte.qrsCuadroGrande1.Enabled := False;
        Reporte.qrsCuadroChico1.Enabled  := False;
        Reporte.qrlCodigoBarras1.Enabled := False;
        ExportarPDF(Reporte.rptLiquidacionComisionParticularEntidad, Archivo)
      end else
      begin
        Reporte.Prepare('ComisionParticularVendedor');
        Reporte.qrsCuadroGrande2.Enabled := False;
        Reporte.qrsCuadroChico2.Enabled  := False;
        Reporte.qrlCodigoBarras2.Enabled := False;
        ExportarPDF(Reporte.rptLiquidacionComisionParticularVendedor, Archivo)
      end;

      EnviarMailBD(Destinatario, 'Provincia ART - Liquidación de comisiones', [oAlwaysShowDialog], 'Provincia ART', GetAttachments(Archivo, 0), 0, tcDefault);
    finally
      if FileExists(Archivo) then
        DeleteFile(Archivo);
    end;
  finally
    Reporte.Free;
  end;
end;

procedure TfrmComisionesConsulta.sdqAfiliacionFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TfrmComisionesConsulta.tbExportarClick(Sender: TObject);
begin
  //Exporta la grilla
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_ENTIDADES:
      ExportarConsulta( sdqEntidades, dbgEntidades);

    PAGINA_LIQUIDACION:
      ExportarConsulta( sdqConsulta, Grid);

    PAGINA_MOVINCLUIDOS:
      ExportarConsulta( sdqAfiliacion, GridAfiliacion);
  end;
end;

procedure TfrmComisionesConsulta.ExportarConsulta(Query: TSDQuery; Grilla: TArtDBGrid);
var
  AutoCols: Boolean;
begin
  if (Query.Active) and (not Query.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      AutoCols := (ExportDialog.Fields.Count = 0);
      try
        ExportDialog.DataSet := Grilla.DataSource.DataSet;
        if AutoCols then
          ExportDialog.Fields.Assign(Grilla.Columns);

        ExportDialog.Execute;
      finally
        if AutoCols then
          ExportDialog.Fields.Clear ;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmComisionesConsulta.ImprimirConsulta(Query: TSDQuery; Grilla : TArtDBGrid; Titulo : string);
var
  AutoCols: Boolean;
  nPos: integer;
begin
  tbImprimir.Enabled := False;
  Try
     if Query.Active and (not Query.IsEmpty) and PrintDialog.Execute Then begin
        QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
        AutoCols := QueryPrint.Fields.Count = 0;
        try
          QueryPrint.DataSource := Grilla.DataSource;
          if AutoCols Then
             QueryPrint.SetGridColumns( Grilla, True, [baDetail, baHeader, baTotal, baSubTotal] );

          if tbSumatoria.Down then
            for nPos := 0 to QueryPrint.Fields.Count - 1 do
              if ((pgCtrlComisiones.ActivePage = tbLiquidacion) and AreIn(QueryPrint.Fields[nPos].Title, CAMPOS_SUMA)) or
                 ((pgCtrlComisiones.ActivePage = tbEntidades) and AreIn(QueryPrint.Fields[nPos].Title, CAMPOS_SUMA_ENT)) or
                 ((pgCtrlComisiones.ActivePage = tbAfiliacion) and AreIn(QueryPrint.Fields[nPos].Title, CAMPOS_SUMA_AFI)) then
              begin
                QueryPrint.Fields[nPos].TotalType := ttAutoSum;
                QueryPrint.Fields[nPos].FormatFloat := '$ #,##0.00';
              end;

          if Titulo = '' Then
             QueryPrint.Title.Text := Caption
          else
             QueryPrint.Title.Text := Titulo;

          QueryPrint.Print ;
        finally
          if AutoCols Then
             QueryPrint.Fields.Clear ;
        end;
     end;
  finally
     tbImprimir.Enabled := True; 
  end;
end;

procedure TfrmComisionesConsulta.pgCtrlComisionesChange(Sender: TObject);
var
  sSql, sWhere, sWhereVendedor : string;
  bOptimizarFFactura: Boolean;
begin
  //De acuerdo a la pagina de donde viene tiene que ser la consulta que se ejecute
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_LIQUIDACION:
    begin
      if ((FPaginaAnterior = PAGINA_ENTIDADES) AND (sdqEntidades.Active = True) and (not sdqEntidades.eof)) then
      begin
        sWhere := ' AND EN_ID=' + sdqEntidades.FieldByName('CODENTIDAD').AsString;

        //Genero el where...

        if not fraEM_ID.IsEmpty then
          sWhere := sWhere + ' AND VC_CONTRATO = ' + fraEM_ID.edContrato.Text;

        sWhere := sWhere + DoFiltro(pnlFactura);

        if (cmbFC_FECHARECEPFACTDesde.Date > 0) or (cmbFC_FECHARECEPFACTHasta.Date > 0) then
          begin
            sWhere := sWhere + ' AND LC_ID IN (SELECT LF_IDLIQCOMISION' +
                                             ' FROM XFC_FACTURA, XLF_LIQFACTURA' +
                                            ' WHERE LF_IDFACTURA = FC_ID' +
                                              ' AND LF_FECHABAJA IS NULL' +
                                              SqlBetweenDateTime(' AND FC_FECHARECEPFACT ', cmbFC_FECHARECEPFACTDesde.Date, cmbFC_FECHARECEPFACTHasta.Date) + ')';
            bOptimizarFFactura := True;
          end
        else
          bOptimizarFFactura := False;

        if chkSinFactura.Checked then
          sWhere := sWhere + ' AND NOT EXISTS (SELECT 1 ' +
                                                'FROM XLF_LIQFACTURA ' +
                                               'WHERE LC_ID = LF_IDLIQCOMISION ' +
                                                 'AND LF_FECHABAJA IS NULL)';

        sWhere := sWhere + SqlBetweenDateTime(' AND CP_FECHACIERRE ', cmbCP_FECHACIERREDesde.Date, cmbCP_FECHACIERREHasta.Date) +
                           SqlBetweenDateTime(' AND LC_FECHAAPROBADO ', cmbLC_FECHAAPROBADODesde.Date, cmbLC_FECHAAPROBADOHasta.Date) +
                           SqlBetween(' AND LC_ID ', edLC_IDDesde.Value, edLC_IDHasta.Value);

        if not IsEmptyString(cmbLC_ESTADO.Text) then
          sWhere := sWhere + ' AND LC_ESTADO ' + cmbLC_ESTADO.InSql;

        if not chkLiquidacionesEnCero.Checked then
          sWhere := sWhere + ' AND LC_COMISION <> 0' ;

        //Filtros frame Entidad
        if fraEntidadDesde.IsSelected and (fraEntidadDesde.Value = fraEntidadHasta.Value) then
          sWhere := sWhere + ' AND EN_ID = ' + fraEntidadDesde.ID
        else if fraEntidadDesde.IsSelected and (fraEntidadDesde.CUIT = fraEntidadHasta.CUIT) and (fraEntidadDesde.CUIT > '') then
          sWhere := sWhere + ' AND EN_CUIT = ' + SQLValue(fraEntidadDesde.CUIT)
        else begin
          if Trim( fraEntidadDesde.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) >= ' + SqlInteger(fraEntidadDesde.CodBanco);
          if Trim( fraEntidadHasta.edCodigo.Text ) > '' then
            sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) <= ' + SqlInteger(fraEntidadHasta.CodBanco);
        end;

        //Filtros frame Vendedor
        if fraVendedorDesde.IsSelected and (fraVendedorDesde.Value = fraVendedorHasta.Value) then
          sWhereVendedor := sWhereVendedor + ' AND VE_ID = ' + fraVendedorDesde.ID
        else if fraVendedorDesde.IsSelected and (fraVendedorDesde.CUIT = fraVendedorHasta.CUIT) then
          sWhereVendedor := sWhereVendedor + ' AND VE_CUIT = ' + SQLValue(fraVendedorDesde.CUIT)
        else begin
          if Trim( fraVendedorDesde.edCodigo.Text ) > '' then
            sWhereVendedor := sWhereVendedor + ' AND VE_VENDEDOR >= ' + SqlValue(fraVendedorDesde.edCodigo.Text);
          if Trim( fraVendedorHasta.edCodigo.Text ) > '' then
            sWhereVendedor := sWhereVendedor + ' AND VE_VENDEDOR <= ' + SqlValue(fraVendedorHasta.edCodigo.Text);
        end;

        sSql := CONSULTA_LIQUIDACION_1 + ' ' + sWhere + ' UNION ALL ' + CONSULTA_LIQUIDACION_2 + ' ' + sWhere + sWhereVendedor;
        if bOptimizarFFactura then
          sSql := StringReplace(sSql, 'SELECT ', 'SELECT /*+ INDEX (XLC_LIQCOMISION PK_XLC_LIQCOMISION) */ ', [rfIgnoreCase]);  // para optimizar la consulta

        OpenQuery ( sdqConsulta, sSql, True );
      end;
    end;
    PAGINA_MOVINCLUIDOS:
    begin
      if ((FPaginaAnterior = PAGINA_LIQUIDACION) AND (sdqConsulta.Active = True) and (not sdqConsulta.eof)) then
      begin
        sWhere := ' AND LC_ID=' + sdqConsulta.FieldByName('LC_ID').AsString;

        if fraEM_HOLDING.IsSelected then
            sWhere := sWhere + DoFiltroComponente(fraEM_HOLDING, 'GE_CODIGO');

        if fraPC_IDCONCEPTO.IsSelected then
          sWhere := sWhere + ' AND PC_IDCONCEPTO = ' + SqlValue(fraPC_IDCONCEPTO.Value);

        sWhere := sWhere + SqlBetween(' AND PC_PERIODO ', edPC_PERIODODesde.Periodo.Valor, edPC_PERIODOHasta.Periodo.Valor);

        sSql := CONSULTA_MOVINCLUIDOS_1 + ' ' + sWhere + ' UNION ALL ' + CONSULTA_MOVINCLUIDOS_2 + ' ' + sWhere ;
        OpenQuery(sdqAfiliacion, sSql, True);
      end;
    end;
  end;
  tbSumatoria.Down := False;
  CheckButtons;
  CalcTotales;
end;

procedure TfrmComisionesConsulta.pgCtrlComisionesChanging(Sender: TObject; var AllowChange: Boolean);
begin
  FPaginaAnterior := pgCtrlComisiones.ActivePageIndex;
end;

procedure TfrmComisionesConsulta.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos : integer;
  Buffer: array[0..63] of Char;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= 8) Then
    SetString(Value, Buffer, FloatToText(Buffer, TotalLiquidacion[iPos], fvExtended, ffCurrency, 15, 2));
end;

procedure TfrmComisionesConsulta.tbOrdenarClick(Sender: TObject);
begin
  case pgCtrlComisiones.ActivePageIndex of
    PAGINA_ENTIDADES:
    begin
      DBGrid     := dbgEntidades;
      DataSource := dsEntidades;
      SortDialogEntidades.Execute;
    end;

    PAGINA_LIQUIDACION:
    begin
      DBGrid     := Grid;
      DataSource := dsConsulta;
      SortDialog.Execute;
    end;

    PAGINA_MOVINCLUIDOS:
    begin
      DBGrid     := GridAfiliacion;
      DataSource := dsAfiliacion;
      SortDialogAfiliacion.Execute;
    end;
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmComisionesConsulta.sdqEntidadesAfterScroll(DataSet: TDataSet);
begin
  if sdqEntidades.FieldByName( 'TOTALCOBRADO' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
     TFloatField( sdqEntidades.FieldByName( 'TOTALCOBRADO' ) ).Currency := True;

  if sdqEntidades.FieldByName( 'COBRADONETODEIMPUESTOS' ) is TFloatField Then
     TFloatField( sdqEntidades.FieldByName( 'COBRADONETODEIMPUESTOS' ) ).Currency := True;

  if sdqEntidades.FieldByName( 'COMISION' ) is TFloatField Then
     TFloatField( sdqEntidades.FieldByName( 'COMISION' ) ).Currency := True;

  if sdqEntidades.FieldByName( 'IVA' ) is TFloatField Then
     TFloatField( sdqEntidades.FieldByName( 'IVA' ) ).Currency := True;

  if sdqEntidades.FieldByName( 'RETOS' ) is TFloatField Then
     TFloatField( sdqEntidades.FieldByName( 'RETOS' ) ).Currency := True;

  if sdqEntidades.FieldByName( 'RETIB' ) is TFloatField Then
     TFloatField( sdqEntidades.FieldByName( 'RETIB' ) ).Currency := True;

  if sdqEntidades.FieldByName( 'RETGCIAS' ) is TFloatField Then
     TFloatField( sdqEntidades.FieldByName( 'RETGCIAS' ) ).Currency := True;

  if sdqEntidades.FieldByName( 'NETO' ) is TFloatField Then
     TFloatField( sdqEntidades.FieldByName( 'NETO' ) ).Currency := True;
end;

procedure TfrmComisionesConsulta.dbgEntidadesPaintFooter(Sender: TObject; Column: String; var Value: String;
  var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos : integer;
  Buffer: array[0..63] of Char;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA_ENT);
  if (iPos > -1) and (iPos <= 7) Then
    SetString(Value, Buffer, FloatToText(Buffer, TotalEntidades[iPos], fvExtended, ffCurrency, 15, 2));
end;

procedure TfrmComisionesConsulta.sdqAfiliacionAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('CUIT').EditMask                      := EMSK_CUIT;
    FieldByName('Total Cobrado').EditMask             := '$ #,##0.00';
    FieldByName('Cobrado Neto de Impuestos').EditMask := '$ #,##0.00';
    FieldByName('Monto Liquidado').EditMask           := '$ #,##0.00';

    TFloatField(FieldByName('Total Cobrado')).Currency             := True;
    TFloatField(FieldByName('Cobrado Neto de Impuestos')).Currency := True;
    TFloatField(FieldByName('Monto Liquidado')).Currency           := True;
  end;
end;

procedure TfrmComisionesConsulta.btnAceptar2Click(Sender: TObject);
var
  sTipoRango, sDestinatario, sArchivo, sNombreReporte, sTipoReporte, sSQL: String;
  sFirma, sEntVendLiq: String;
  bPorMail, bFirstTime, bEsMasivo: Boolean;
  iLiquidacion: integer;
  rep: TQuickRep;
  rep2: TqrRetencionGanancias_IVA;
begin
  Finished    := False;
  bFirstTime  := True;
  bPorMail    := (Sender = btnEnviarMail);
  sEntVendLiq := '';

  Verificar((rgReporte.ItemIndex = 0) and (sdqConsulta.FieldByName('Monto Liquidado').AsFloat = 0), nil, 'El monto liquidado es cero ($ 0.00).');

  if ImpresionPorRangoFechas() then
    begin
      case rgReporte.ItemIndex of
        2: sTipoRango := 'liquidaciones';
        3: sTipoRango := 'recepción de facturas';
        4: sTipoRango := 'aprobación de facturas';
      end;

      Verificar((cmbFechaDesde.IsEmpty or cmbFechaHasta.IsEmpty), nil, 'Debe indicar las fechas de ' + sTipoRango + ' entre las cuales quiere imprimir los datos.');
    end;

  bEsMasivo := (rgReporte.ItemIndex = 1);

  try
    if bPorMail then
      begin
        sArchivo      := TempPath + 'Reporte_' + FormatDateTime('yyyymmdd', Now) + '.pdf';
        sDestinatario := sdqConsulta.FieldByName('Mail').AsString;
      end;

    if fpImpresion.Tag = 4 then  // Formulario de liquidación
    begin                        // separado, para no seguir recargando TfrmRPTComisionesConsulta con más y más reportes...
      with TfrmRPTLiquidacionComision.Create ( self ) do
        try
          if not cmbFechaDesde.ReadOnly then
            IdLiq := IntToStr(GetIdLiquidacion(sEntVendLiq))
          else
            IdLiq := Self.sdqConsulta.fieldByName ('LC_ID').AsString;

          case rgOrden.ItemIndex of
            0: OrdenReport := toCodigo2;
            1: OrdenReport := toDescripcion2;
          end;

          Masivo := bEsMasivo;

          if rgReporte.ItemIndex <> 3 then  // si no es por rango de f. de recepción de factura
            begin                           // en estos casos está en función del registro donde se encuentra actualmente posicionado
              if Self.sdqConsulta.fieldByName ('LC_IDENTIDAD').AsString <> '' then
                begin
                  sNombreReporte := 'RPTLiquidacionComisionParticularEntidad';
                  sTipoReporte   := 'ComisionParticularEntidad';
                end
              else
                begin
                  sNombreReporte := 'RPTLiquidacionComisionParticularVendedor';
                  sTipoReporte   := 'ComisionParticularVendedor';
                end;
            end;

          repeat
            if rgReporte.ItemIndex = 3 then  // por rango de f. de recepción de factura
              begin
                sSQL := 'SELECT LC_IDENTIDAD ' +
                          'FROM XLC_LIQCOMISION ' +
                         'WHERE LC_ID=:Id';
                if ValorSQLEx(sSQL, [StrToInt(IDLiq)]) <> '' then
                  begin
                    sNombreReporte := 'RPTLiquidacionComisionParticularEntidad';
                    sTipoReporte   := 'ComisionParticularEntidad';
                  end
                else
                  begin
                    sNombreReporte := 'RPTLiquidacionComisionParticularVendedor';
                    sTipoReporte   := 'ComisionParticularVendedor';
                  end;
              end;

            if Prepare(sTipoReporte) then
              begin
                rep := TQuickRep(FindComponent(sNombreReporte));

                ImprimirReporte(rep, bPorMail, chkVistaPrevia.Checked, sArchivo, sDestinatario);

                fpImpresion.ModalResult := mrOk;
              end
            else
              if not ImpresionPorRangoFechas() then
                InvalidMsg(btnAceptar2, 'No se encuentran registros.');

            iLiquidacion := StrToInt(IDLiq);
            Revisar(Self.sdqConsulta.FieldByName('LC_IDENTIDADVENDEDOR').AsInteger, iLiquidacion, sEntVendLiq);
            IDLiq := IntToStr(iLiquidacion);
          until Finished;
        finally
          Free;
        end;
    end else
    begin
      with TfrmRPTComisionesConsulta.Create (Self) do
      begin
        try
          if not cmbFechaDesde.ReadOnly then
            Liquidacion := IntToStr(GetIdLiquidacion(sEntVendLiq))
          else
            Liquidacion := Self.sdqConsulta.fieldByName ('LC_ID').AsString;

          repeat
            case rgReporte.ItemIndex of
              0, 2, 3,
              4: case fpImpresion.Tag of
                   1: NombreReport := 'qrComisionesPorVendedor';
                   2, 5 : begin
                            NombreReport := 'qrPagosPorVendedor';
                           // MantCuenta   := (fpImpresion.Tag = 5);
                          end;
                   3: NombreReport := 'qrCertificadoIngresosBrutos';
                 end;
              1: case fpImpresion.Tag of
                   1: NombreReport := 'qrComisionesPorEntidad';
                   2, 5 : begin
                            NombreReport := 'qrPagosPorEntidad';
                            MantCuenta   := (fpImpresion.Tag = 5);
                          end;
                   3: NombreReport := 'qrCertificadoIngresosBrutosEntidad';
                 end;
            end;

            case rgOrden.ItemIndex of
              0: OrdenReport := toCodigo;
              1: OrdenReport := toDescripcion;
            end;

            SaltoPagina := chkSaltoPagina.Checked and chkSaltoPagina.Enabled;

            if fpImpresion.Tag = 3 then
            begin
              if bFirstTime then
                with TfrmFirmantes.Create(Self) do
                try
                  sdqFirmas.Active := True;

                  if ShowModal = mrOk then
                  begin
                    sFirma     := edFirmante.Text;
                    IdFirma    := sFirma;
                    bFirstTime := False;
                  end else
                    MessageDlg('Debe elegir un firmante para imprimir este certificado', mtError, [mbOK], 0);
                finally
                  Free;
                end;

              if not Prepare then
              begin
                if not ImpresionPorRangoFechas() then
                  MessageDlg('No registra Ingresos Brutos', mtError, [mbOK], 0);
              end else
                PreviewRetencionIB(chkVistaPrevia.Checked);

              Masivo := bEsMasivo;
              NombreReport := 'qrCertificadoObraSocial';
            end;

            if Prepare then
            begin
              rep := TQuickRep(FindComponent(NombreReport));

              ImprimirReporte(rep, bPorMail, chkVistaPrevia.Checked, sArchivo, sDestinatario);

              fpImpresion.ModalResult := mrOk;
            end
            else
              if not ImpresionPorRangoFechas() then
                InvalidMsg(btnAceptar2, 'No se encuentran registros.');

            iLiquidacion := StrToInt(Liquidacion);

            if fpImpresion.Tag = 3 then
              begin
                rep2 := TqrRetencionGanancias_IVA.Create(nil);
                with rep2 do
                  try
                    if IsEmptyString(sFirma) then
                      MessageDlg('Debe elegir un firmante para imprimir este certificado', mtError, [mbOK], 0)
                    else
                      IdFirma := sFirma;

                    if Preparar(iLiquidacion) then
                      begin
                        ImprimirReporte(rep2, bPorMail, chkVistaPrevia.Checked, sArchivo, sDestinatario);
                        fpImpresion.ModalResult := mrOk;
                      end
                    else
                      InvalidMsg(btnAceptar2, 'No se encuentran registros en retención de Ganancias/IVA.');
                  finally
                    rep2.Free;
                  end;
              end;

            Revisar(Self.sdqConsulta.FieldByName('LC_IDENTIDADVENDEDOR').AsInteger, iLiquidacion, sEntVendLiq);
            Liquidacion := IntToStr(iLiquidacion);
          until Finished;
        finally
          Free;
        end;
      end;
    end;
  finally
    if bPorMail and FileExists(sArchivo) then
      DeleteFile(sArchivo);
  end;
end;

procedure TfrmComisionesConsulta.mnuComisionesPorVendedorClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Eof or sdqConsulta.IsEmpty, nil, 'Debe seleccionar algún registro de la solapa de Liquidaciones.');

  fpImpresion.Tag := 1; // Tag especial que indica que viene de la Liquidacion
  lbReporte.Caption := TMenuItem(Sender).Caption;
  fpImpresion.ShowModal;
end;

procedure TfrmComisionesConsulta.mnuPagosPorVendedorComisClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Eof or sdqConsulta.IsEmpty, nil, 'Debe seleccionar algún registro de la solapa de Liquidaciones.');

  if sender = mnuPagosPorVendedorComis then
    fpImpresion.Tag := 2  // Tag especial que indica que viene del Detalle de Pagos Comisión
  else if sender = mnuPagosPorVendedorMant then
    fpImpresion.Tag := 5; // Tag especial que indica que viene del Detalle de Pagos Mantenimiento

  lbReporte.Caption := TMenuItem(Sender).Caption;
  fpImpresion.ShowModal;
end;

procedure TfrmComisionesConsulta.fpImpresionBeforeShow(Sender: TObject);
var
  cLetra: string;
begin
  inherited;

  rgOrden.ItemIndex   := 0;
  chkSaltoPagina.Checked := False;
  chkVistaPrevia.Checked := True;

  cLetra := ValorSQLEx('SELECT TB_ESPECIAL1 FROM CTB_TABLAS WHERE TB_CLAVE = :CLAVE AND TB_CODIGO = :CODIGO', ['MOLIQ', sdqConsulta.FieldByName('EN_MODOLIQ').AsInteger]);

  if cLetra = 'E' then
    rgReporte.ItemIndex := 0
  else if cLetra = 'V' then
    rgReporte.ItemIndex := 1
  else
    rgReporte.ItemIndex := -1;

  rgReporteClick(rgReporte);

  if (fpImpresion.Tag = 2) or (fpImpresion.Tag = 5) then
    chkSaltoPagina.Font.Style := chkSaltoPagina.Font.Style - [fsStrikeOut]
  else
    chkSaltoPagina.Font.Style := chkSaltoPagina.Font.Style + [fsStrikeOut];
end;

procedure TfrmComisionesConsulta.tbFacturasClick(Sender: TObject);
begin
  Verificar(pgCtrlComisiones.ActivePageIndex <> PAGINA_LIQUIDACION, pgCtrlComisiones.ActivePage, 'Debe estar posicionado el la solapa de liquidaciones para ver las facturas asociadas a una liquidación.');
  Verificar(sdqConsulta.IsEmpty, pgCtrlComisiones.ActivePage, 'Debe seleccionar una liquidación para ver las facturas correspondientes.');

  with TfrmConsultaFacturas.Create(Self) do
  begin
    IDLiquidacion := Self.sdqConsulta.FieldByName('LC_ID').AsInteger;
    ModoConsulta := True;
    ShowModal;
  end;
end;

procedure TfrmComisionesConsulta.CompletarFactura(Sender: TObject);
begin
  TMaskEdit(Sender).Text := Get_NroFacturaCompleto(TMaskEdit(Sender).Text);
end;

procedure TfrmComisionesConsulta.rgReporteClick(Sender: TObject);
begin
  rgOrden.Enabled := (rgReporte.ItemIndex = 1);
  chkSaltoPagina.Enabled := (rgReporte.ItemIndex = 1) and ((fpImpresion.Tag = 2) or (fpImpresion.Tag = 5)) {Detalle de pagos};
  if not chkSaltoPagina.Enabled then
    chkSaltoPagina.Checked := False;

  VCLExtra.LockControls([cmbFechaDesde, cmbFechaHasta], not ImpresionPorRangoFechas());
  VCLExtra.LockControl(btnEnviarMail, (rgReporte.ItemIndex <> 0) or (fpImpresion.Tag = 3) or (fpImpresion.Tag = 4));
end;

function TfrmComisionesConsulta.Get_NroFactura(EntVend: string; IdLiq: Integer): string;
begin
  Result := StrRight( '0000' + EntVend, 4 ) + '-' + LPad( IntToStr(IdLiq), '0', 8 );
end;

function TfrmComisionesConsulta.Revisar(iEntidadVendedor: integer; var iLiquidacion: integer; var EntVendLiq: String): boolean;
var
  sSQL: string;
begin
  Result := True;

  if cmbFechaDesde.ReadOnly then
    Finished := True
  else begin
    case rgReporte.ItemIndex of
      2: begin  // por rango de f. de liquidación
           sSQL := 'SELECT MIN(TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000''))' +
                   '  FROM XFC_FACTURA, XLF_LIQFACTURA, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR, XEN_ENTIDAD, XLC_LIQCOMISION' +
                   ' WHERE LC_FECHALIQ BETWEEN ' + cmbFechaDesde.SqlText + ' AND ' + cmbFechaHasta.SqlText +
                   '   AND LC_IDENTIDADVENDEDOR = :ID_ENTIDADVENDEDOR' +
                   '   AND TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000'') > :EntVendLiq' +
                   '   AND LC_ID = LF_IDLIQCOMISION' +
                   '   AND LF_IDFACTURA = FC_ID' +
                   '   AND EN_ID = EV_IDENTIDAD' +
                   '   AND VE_ID = EV_IDVENDEDOR' +
                   '   AND EV_ID = FC_IDENTIDADVEND' +
                   '   AND LF_FECHABAJA IS NULL';
           EntVendLiq := ValorSQLEx(sSQL, [iEntidadVendedor, EntVendLiq]);
         end;

      3: begin  // por rango de f. de recepción de factura
           sSQL := 'SELECT MIN(TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000''))' +
                   '  FROM XFC_FACTURA, XLF_LIQFACTURA, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR, XEN_ENTIDAD, XLC_LIQCOMISION' +
                   ' WHERE LC_ID IN (SELECT LF_IDLIQCOMISION' +
                                     ' FROM XFC_FACTURA, XLF_LIQFACTURA' +
                                    ' WHERE LF_IDFACTURA = FC_ID' +
                                      ' AND LF_FECHABAJA IS NULL' +
                                      ' AND FC_FECHARECEPFACT BETWEEN ' + cmbFechaDesde.SqlText + ' AND ' + cmbFechaHasta.SqlText + ') ' +
                   '   AND TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000'') > :EntVendLiq' +
                   '   AND LC_ID = LF_IDLIQCOMISION' +
                   '   AND LF_IDFACTURA = FC_ID' +
                   '   AND EN_ID = EV_IDENTIDAD' +
                   '   AND VE_ID = EV_IDVENDEDOR' +
                   '   AND EV_ID = FC_IDENTIDADVEND' +
                   '   AND LF_FECHABAJA IS NULL';
           EntVendLiq := ValorSQLEx(sSQL, [EntVendLiq]);
         end;

      4: begin  // por rango de f. de aprobación de factura
           sSQL := 'SELECT MIN(TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000''))' +
                   '  FROM XFC_FACTURA, XLF_LIQFACTURA, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR, XEN_ENTIDAD, XLC_LIQCOMISION' +
                   ' WHERE LC_ID IN (SELECT LF_IDLIQCOMISION' +
                                     ' FROM XFC_FACTURA, XLF_LIQFACTURA' +
                                    ' WHERE LF_IDFACTURA = FC_ID' +
                                      ' AND LF_FECHABAJA IS NULL' +
                                      ' AND FC_FECHAAPROBADO BETWEEN ' + cmbFechaDesde.SqlText + ' AND ' + cmbFechaHasta.SqlText + ') ' +
                   '   AND TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000'') > :EntVendLiq' +
                   '   AND LC_ID = LF_IDLIQCOMISION' +
                   '   AND LF_IDFACTURA = FC_ID' +
                   '   AND EN_ID = EV_IDENTIDAD' +
                   '   AND VE_ID = EV_IDVENDEDOR' +
                   '   AND EV_ID = FC_IDENTIDADVEND' +
                   '   AND LF_FECHABAJA IS NULL';
           EntVendLiq := ValorSQLEx(sSQL, [EntVendLiq]);
         end;
    end;

    if EntVendLiq = '' then
      iLiquidacion := 0
    else
      iLiquidacion := StrToInt(StrRight(EntVendLiq, 8));

    Finished := (iLiquidacion = 0);
  end;
end;

procedure TfrmComisionesConsulta.ImprimirReporte(rep: TQuickRep; PorMail, VistaPrevia: Boolean; Archivo, Destinatario: String);
begin
  if PorMail then
    begin
      ExportarPDF(rep, Archivo);

      EnviarMailBD(Destinatario, 'Provincia ART - Liquidación de comisiones', [oAlwaysShowDialog], 'Provincia ART', GetAttachments(Archivo, 0), 0, tcDefault);
    end
  else
    begin
      if VistaPrevia then
        rep.PreviewModal
      else
        begin
          rep.Print;
          Sleep(1000);
        end;
    end;
end;

procedure TfrmComisionesConsulta.tbCancelarAprobadasClick(Sender: TObject);
var
  Cancelar: boolean;
  Respuesta: integer;
  IdNuevaLiq : TTableId;
begin
  Cancelar := False;
  if sdqConsulta.Active then
    begin
      Verificar(sdqConsulta.FieldByName ('LC_ESTADO').AsString <> 'A', nil, 'No se puede cancelar esta liquidación.');
      Cancelar := True;
    end;

  if Cancelar then
    begin
      Respuesta := MsgBox('¿Está seguro de querer Cancelar la liquidación?', MB_YESNO + MB_ICONQUESTION);
      if Respuesta = mrYes then
        begin
          IdNuevaLiq := ART_EMPTY_ID;
          GuardaDatos('cancelar', True, IdNuevaLiq);
          DoEnviarMailLiquidacionCancelada(IdNuevaLiq);
          
          tbRefrescarClick(Nil);
        end;
    end;
end;

function TfrmComisionesConsulta.GetIdLiquidacion(var EntVendLiq: String): TTableId;
var
  sSql: String;
  IdLiquid: TTableId;
begin
  IdLiquid   := ART_EMPTY_ID;
  EntVendLiq := '';

  case rgReporte.ItemIndex of
    2: begin  // por rango de f. de liquidación
         sSql := 'SELECT MIN(TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000'')) ' +
                 '  FROM XFC_FACTURA, XLF_LIQFACTURA, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR, XEN_ENTIDAD, XLC_LIQCOMISION' +
                 ' WHERE LC_FECHALIQ BETWEEN ' + cmbFechaDesde.SqlText + ' AND ' + cmbFechaHasta.SqlText +
                 '   AND LC_IDENTIDADVENDEDOR = :ID_ENTIDADVENDEDOR' +
                 '   AND LC_ID = LF_IDLIQCOMISION' +
                 '   AND LF_IDFACTURA = FC_ID' +
                 '   AND EN_ID = EV_IDENTIDAD' +
                 '   AND VE_ID = EV_IDVENDEDOR' +
                 '   AND EV_ID = FC_IDENTIDADVEND' +
                 '   AND LF_FECHABAJA IS NULL';
         EntVendLiq := ValorSQLEx(sSql, [Self.sdqConsulta.FieldByName('LC_IDENTIDADVENDEDOR').AsInteger]);
       end;

    3: begin  // por rango de f. de recepción de factura
         sSql := 'SELECT MIN(TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000''))' +
                 '  FROM XFC_FACTURA, XLF_LIQFACTURA, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR, XEN_ENTIDAD, XLC_LIQCOMISION' +
                 ' WHERE LC_ID IN (SELECT LF_IDLIQCOMISION' +
                                   ' FROM XFC_FACTURA, XLF_LIQFACTURA' +
                                  ' WHERE LF_IDFACTURA = FC_ID' +
                                    ' AND LF_FECHABAJA IS NULL' +
                                    ' AND FC_FECHARECEPFACT BETWEEN ' + cmbFechaDesde.SqlText + ' AND ' + cmbFechaHasta.SqlText + ')' +
                 '   AND LC_ID = LF_IDLIQCOMISION' +
                 '   AND LF_IDFACTURA = FC_ID' +
                 '   AND EN_ID = EV_IDENTIDAD' +
                 '   AND VE_ID = EV_IDVENDEDOR' +
                 '   AND EV_ID = FC_IDENTIDADVEND' +
                 '   AND LF_FECHABAJA IS NULL';
         EntVendLiq := ValorSQL(sSql);
       end;

    4: begin  // por rango de f. de aprobación de factura
         sSql := 'SELECT MIN(TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'') || TO_CHAR(LC_ID, ''FM00000000''))' +
                 '  FROM XFC_FACTURA, XLF_LIQFACTURA, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR, XEN_ENTIDAD, XLC_LIQCOMISION' +
                 ' WHERE LC_ID IN (SELECT LF_IDLIQCOMISION' +
                                   ' FROM XFC_FACTURA, XLF_LIQFACTURA' +
                                  ' WHERE LF_IDFACTURA = FC_ID' +
                                    ' AND LF_FECHABAJA IS NULL' +
                                    ' AND FC_FECHAAPROBADO BETWEEN ' + cmbFechaDesde.SqlText + ' AND ' + cmbFechaHasta.SqlText + ')' +
                 '   AND LC_ID = LF_IDLIQCOMISION' +
                 '   AND LF_IDFACTURA = FC_ID' +
                 '   AND EN_ID = EV_IDENTIDAD' +
                 '   AND VE_ID = EV_IDVENDEDOR' +
                 '   AND EV_ID = FC_IDENTIDADVEND' +
                 '   AND LF_FECHABAJA IS NULL';
         EntVendLiq := ValorSQL(sSql);
       end;
  end;

  if EntVendLiq <> '' then
    IdLiquid := StrToInt(StrRight(EntVendLiq, 8));

  Result := IdLiquid;
end;

function TfrmComisionesConsulta.ImpresionPorRangoFechas: Boolean;
begin
  Result := ((rgReporte.ItemIndex = 2) or (rgReporte.ItemIndex = 3) or (rgReporte.ItemIndex = 4));
end;

procedure TfrmComisionesConsulta.DoEnviarMailLiquidacionCancelada(IdNuevaLiq: TTableId);
var
  sSql, sAsunto, sMensaje, sDirecciones: string;
begin
  sDirecciones := Get_DireccionesEnvioMail('COM_RELIQ');
  if sDirecciones <> '' then
    with sdqConsulta do
      begin
        sAsunto  := 'Provincia ART - Reliquidación de comisiones';
        sMensaje := 'Liquidación Cancelada: ' + FieldByName('LC_ID').AsString + CRLF +
                    'Monto Liquidado: ' + Get_AjusteDecimales(FieldByName('Monto Liquidado').AsString, '$') + CRLF +
                    'IVA: ' + Get_AjusteDecimales(FieldByName('IVA').AsString, '$') + CRLF +
                    'Ret. OS: ' + Get_AjusteDecimales(FieldByName('Ret. OS').AsString, '$') + CRLF +
                    'Ret. IB: ' + Get_AjusteDecimales(FieldByName('Ret. IB').AsString, '$') + CRLF +
                    'Ret. Gcias: ' + Get_AjusteDecimales(FieldByName('Ret. Gcias').AsString, '$') + CRLF +
                    'Ret. IVA: ' + Get_AjusteDecimales(FieldByName('RETIVA').AsString, '$') + CRLF +
                    'Neto: ' + Get_AjusteDecimales(FieldByName('Neto').AsString, '$');

        if IdNuevaLiq <> ART_EMPTY_ID then
          begin;
            sSql := 'SELECT LC_ID LCID, LC_COMISION LCCOMIS, LC_IVA LCIVA, LC_OBRASOCIAL LCOS, ' +
                           'LC_INGBRUTOS LCIB, LC_GANANCIAS LCGCIAS, LC_RETIVA LCRETIVA, ' +
                           'LC_COMISIONNETA LCNETO ' +
                       'FROM XLC_LIQCOMISION ' +
                      'WHERE LC_ID = :IdLiq';
             with GetQueryEx(ssql, [IdNuevaLiq]) do
               try
                 if not Eof then
                   begin
                     sMensaje := sMensaje + CRLF + CRLF +
                                 'Nueva Liquidación: ' + FieldByName('LCID').AsString + CRLF +
                                 'Monto Liquidado: ' + Get_AjusteDecimales(FieldByName('LCCOMIS').AsString, '$') + CRLF +
                                 'IVA: ' + Get_AjusteDecimales(FieldByName('LCIVA').AsString, '$') + CRLF +
                                 'Ret. OS: ' + Get_AjusteDecimales(FieldByName('LCOS').AsString, '$') + CRLF +
                                 'Ret. IB: ' + Get_AjusteDecimales(FieldByName('LCIB').AsString, '$') + CRLF +
                                 'Ret. Gcias: ' + Get_AjusteDecimales(FieldByName('LCGCIAS').AsString, '$') + CRLF +
                                 'Ret. IVA: ' + Get_AjusteDecimales(FieldByName('LCRETIVA').AsString, '$') + CRLF +
                                 'Neto: ' + Get_AjusteDecimales(FieldByName('LCNETO').AsString, '$');
                   end;
               finally
                 Free;
               end;
          end;

        EnviarMailBD(sDirecciones, sAsunto, [oAutoFirma], sMensaje, nil, 0, tcDefault, True);
      end;
end;

procedure TfrmComisionesConsulta.tbRevisionClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');
  Verificar(sdqConsulta.FieldByName('LC_ESTADO').AsString <> 'P', nil, 'La liquidación debe estar pendiente.');

  if MsgBox('¿Confirma la revisión del registro seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      sSql := 'UPDATE XLC_LIQCOMISION ' +
                 'SET LC_FECHAREVISION = SYSDATE, ' +
                     'LC_USUREVISION = :Usuario ' +
               'WHERE LC_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('LC_ID').AsInteger]);

      MsgBox('Revisión guardada correctamente.', MB_ICONINFORMATION);
      tbRefrescar.Click;
    end;
end;

end.

