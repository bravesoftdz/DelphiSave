unit unValAdministracion;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               NELSON KUSTER
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls, IntEdit,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, PatternEdit, CheckCombo,
  DBCheckCombo, Mask, ToolEdit, DateComboBox, unArtFrame, unArtDbFrame, unFraEmpresa, unFraCodigoDescripcion,
  unfraCtbTablas, Menus, FormPanel, DBCtrls, CurrEdit, unArt, ComboEditor, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unfraCuentaBancaria, unfraEmpresaDeudora, unqrImpresionRecibo, unArtDBAwareFrame,
  RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmValAdministracion = class(TfrmCustomConsulta)
    gbNroCheque: TGroupBox;
    edNroChequeDesde: TPatternEdit;
    edNroChequeHasta: TPatternEdit;
    Label2: TLabel;
    gbNroRecibo: TGroupBox;
    edNroReciboDesde: TIntEdit;
    Label3: TLabel;
    edNroReciboHasta: TIntEdit;
    gbNroPreacuerdo: TGroupBox;
    Label4: TLabel;
    edNroPreacuerdoDesde: TIntEdit;
    edNroPreacuerdoHasta: TIntEdit;
    gbFechaCheque: TGroupBox;
    Label5: TLabel;
    edFechaChequeDesde: TDateComboBox;
    edFechaChequeHasta: TDateComboBox;
    gbBanco: TGroupBox;
    dbcBancos: TDBCheckCombo;
    sdqBancos: TSDQuery;
    dsBancos: TDataSource;
    gbEmpresa: TGroupBox;
    Bevel1: TBevel;
    pmnuGrid: TPopupMenu;
    mnuSeleccionarTodo: TMenuItem;
    mnuLimpiarSeleccion: TMenuItem;
    mnuInvertirSeleccion: TMenuItem;
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirRecibo: TMenuItem;
    rbEmpNormal: TRadioButton;
    rbEmpDeudora: TRadioButton;
    tbBoletaDeposito: TToolButton;
    tbPagoTerceros: TToolButton;
    ToolButton7: TToolButton;
    tbSalir2: TToolButton;
    tbRechazo: TToolButton;
    fpRechazo: TFormPanel;
    BevelAbm: TBevel;
    btnRechazoAceptar: TButton;
    btnRechazoCancelar: TButton;
    lbMotivo: TLabel;
    lbFecha: TLabel;
    edFechaRechazo: TDateComboBox;
    fpBoletaDeposito: TFormPanel;
    Bevel2: TBevel;
    btnBoletaDepositoAceptar: TButton;
    btnBoletaDepositoCancelar: TButton;
    lbBancoBoletaDeposito: TLabel;
    lbSerieBoletaDeposito: TLabel;
    edSerieBoletaDeposito: TPatternEdit;
    edNumeroBoletaDeposito: TIntEdit;
    lbNumeroBoletaDeposito: TLabel;
    fpPagoATerceros: TFormPanel;
    Bevel3: TBevel;
    btnPagoATercerosAceptar: TButton;
    btnPagoATercerosCancelar: TButton;
    lbRestantePagoATerceros: TLabel;
    lbTotalValoresPagoATerceros: TLabel;
    lbDiferenciaPagoATerceros: TLabel;
    sdqOrdenesDePago: TSDQuery;
    dsOrdenesDePago: TDataSource;
    lbOrdenDePagoPagoATerceros: TLabel;
    edRestantePagoATerceros: TCurrencyEdit;
    edTotalValoresPagoATerceros: TCurrencyEdit;
    edDiferenciaPagoATerceros: TCurrencyEdit;
    cmbOrdenDePagoPagoATerceros: TArtComboBox;
    edfpMontoBoletaDeposito: TCurrencyEdit;
    Label7: TLabel;
    fraCtbTablasRechazo: TfraStaticCTB_TABLAS;
    tbSumatoria: TToolButton;
    GroupBox1: TGroupBox;
    chkBoleta: TCheckBox;
    fraBancoBoletaDeposito: TfraCuentaBancaria;
    GroupBox2: TGroupBox;
    rbChequeTodos: TRadioButton;
    rbChequeSi: TRadioButton;
    rbChequeNo: TRadioButton;
    gbTipoValor: TGroupBox;
    fraVA_TIPORECHAZO: TfraStaticCTB_TABLAS;
    Label8: TLabel;
    fraEmpresa: TfraEmpresaDeudora;
    gbTipoReciboValor: TGroupBox;
    rbSinRecibo: TRadioButton;
    rbReciboPlanPago: TRadioButton;
    rbReciboComun: TRadioButton;
    rbTodos: TRadioButton;
    tbMostrarRecibosPlanPago: TToolButton;
    ToolButton1: TToolButton;
    fraVA_TIPOVALOR: TfraStaticCodigoDescripcion;
    rbEstudio: TRadioButton;
    fraGestorCuenta: TfraStaticCodigoDescripcion;
    edBD_NUMERO: TIntEdit;
    Label6: TLabel;
    Label9: TLabel;
    edFechaRechExtracto: TDateComboBox;
    GroupBox3: TGroupBox;
    dbcEstadosCheque: TDBCheckCombo;
    sdqEstadosCheque: TSDQuery;
    dsEstadosCheque: TDataSource;
    tbEnvioLegales: TToolButton;
    fpEnvioLegales: TFormPanel;
    Bevel4: TBevel;
    btnEnvioLegalesAceptar: TButton;
    btnEnvioLegalesCancelar: TButton;
    Label10: TLabel;
    edFechaLegales: TDateComboBox;
    edObservLegales: TMemo;
    Label11: TLabel;
    GroupBox4: TGroupBox;
    rbEnvLegalesTodos: TRadioButton;
    rbEnvLegalesSi: TRadioButton;
    rbEnvLegalesNo: TRadioButton;
    gbFechaRecibo: TGroupBox;
    Label1: TLabel;
    edFechaAltaValorDesde: TDateComboBox;
    edFechaAltaValorHasta: TDateComboBox;
    mnuImprimirNotificacionRechazo: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure opTipoEmpresaClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuSeleccionarTodoClick(Sender: TObject);
    procedure mnuLimpiarSeleccionClick(Sender: TObject);
    procedure mnuInvertirSeleccionClick(Sender: TObject);
    procedure tbmIprimirClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirReciboClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure btnRechazoAceptarClick(Sender: TObject);
    procedure tbRechazoClick(Sender: TObject);
    procedure fpRechazoEnter(Sender: TObject);
    procedure tbBoletaDepositoClick(Sender: TObject);
    procedure btnBoletaDepositoAceptarClick(Sender: TObject);
    procedure fpBoletaDepositoEnter(Sender: TObject);
    procedure tbPagoTercerosClick(Sender: TObject);
    procedure btnPagoATercerosAceptarClick(Sender: TObject);
    procedure fpPagoATercerosEnter(Sender: TObject);
    procedure sdqOrdenesDePagoAfterOpen(DataSet: TDataSet);
    procedure cmbOrdenDePagoPagoATercerosCloseUp(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure rbReciboComunClick(Sender: TObject);
    procedure tbMostrarRecibosPlanPagoClick(Sender: TObject);
    procedure edNroPreacuerdoDesdeChange(Sender: TObject);
    procedure tbEnvioLegalesClick(Sender: TObject);
    procedure btnEnvioLegalesAceptarClick(Sender: TObject);
    procedure mnuImprimirNotificacionRechazoClick(Sender: TObject);
  private
    pbEsAltaBoletaDeposito: Boolean;
    pIdBoletaDepositoModificacion: TTableId;

    function GetTipoReciboSinImprimir(TipoReciboValor: String): TTipoRecibo;
    function GetImporteTotalValores: Currency;
    function GetImporteTotalValoresListaId(sListaIdValoresSeleccionados: String; TipoRecibo: TTipoRecibo; Contrato: Integer): Currency;
    function IsDatosValidosBoletaDeposito(bEsAlta: Boolean; IdBoletaDeposito: TTableId): Boolean;
    function IsDatosValidosPagoATerceros: Boolean;
    function IsDatosValidosRechazo: Boolean;
    function IsRegistroModificacionValido: Boolean;
    function IsRegistrosBoletaDepositoValidos(var bEsAlta: Boolean; var IdBoletaDeposito: TTableId;
                                              var sListaIdValoresSeleccionados: String;
                                              var MontoSeleccionado: Extended): Boolean;
    function IsRegistrosPagoATercerosValidos: Boolean;
    function IsRegistrosRechazoValidos: Boolean;
    function IsRegistrosRecibosPlanPagoValidos: Boolean;
    function IsRegistrosReciboValidos(var bEsReimpresion: Boolean; var sListaIdValoresSeleccionados, sTipoReciboValor: String): Boolean;
    function IsValorSinRecibo(TipoReciboValor: String): Boolean;
    function IsDatosValidosEnviosLegales: Boolean;

    procedure CalcTotales;
    procedure DoEliminarBoletaDeposito(IdBoletaDeposito: TTableId; sListaIdValoresSeleccionados: String);
    procedure DoGenerarRecibo(dFechaRecibo: TDateTime; sListaIdValoresSeleccionados: String; TipoRecibo: TTipoRecibo;
                              Contrato: Integer = 0; IdPlanPago: Integer = 0);
    procedure DoImprimirRecibos(var bEsReimpresion: Boolean; var sListaIdValoresSeleccionados, sTipoReciboValor: String);
    procedure DoImprimirNoticiacionRechazo(IdValor: TTableId);
  public
  end;

const
  CAMPOS_SUMA: Array[0..0] of String = ('IMPORTE');
  MAXCOLS = 0;

var
 frmValAdministracion: TfrmValAdministracion;
 TotalConsulta: Array of Extended;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, VclExtra, General, CustomDlgs, sqlFuncs, DBFuncs,
  unValIngreso, unTesoreria,  unDmFinancials, Printers, unAfiliaciones, strFuncs,
  unRecibosValorPlanPago, DBSql, unComunes, unSesion, unRptNotificacionRechazo;

{$R *.DFM}

procedure TfrmValAdministracion.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmValAdministracion.FormCreate(Sender: TObject);
begin
  inherited;

  with fraVA_TIPOVALOR do
  begin
    TableName   := 'OTV_TIPOVALOR';
    FieldId     := 'TV_ID';
    FieldCodigo := 'TV_CODIGO';
    FieldDesc   := 'TV_DESCRIPCION';
    FieldBaja   := 'TV_USUBAJA';
    ShowBajas   := True;
  end;

  fraVA_TIPORECHAZO.Clave := 'TRECH';
  fraEmpresa.ShowBajas := True;

  with fraGestorCuenta do
  begin
    TableName   := 'AGC_GESTORCUENTA';
    FieldID     := 'GC_ID';
    FieldCodigo := 'GC_ID';
    FieldDesc   := 'GC_NOMBRE';
    FieldBaja   := 'GC_FECHABAJA';
    ShowBajas   := True;
  end;

  SetLength( TotalConsulta, MAXCOLS + 1);

  rbReciboComunClick(rbTodos);
  opTipoEmpresaClick(nil);

  OpenQuery(sdqBancos);
  OpenQuery(sdqEstadosCheque);
end;

{ Carga la grilla según las condiciones elegidas }
procedure TfrmValAdministracion.tbRefrescarClick(Sender: TObject);
var
  sCondicion: String;
  sSql: String;
  sSqlWhere: String;
begin
  sSql := '';

  sSqlWhere := SqlBetween(' AND VA_NROCHEQUE', edNroChequeDesde.Text, edNroChequeHasta.Text) +
               SqlBetweenDateTime(' AND VA_VENCIMIENTO', edFechaChequeDesde.Date, edFechaChequeHasta.Date) +
               SqlBetweenDateTime(' AND VA_FECHAALTA', edFechaAltaValorDesde.Date, edFechaAltaValorHasta.Date) +
               SqlBetween(' AND RV_NUMERO', edNroReciboDesde.Value, edNroReciboHasta.Value);

  sCondicion := '';

  if not edNroPreacuerdoDesde.IsEmpty then
    sCondicion := sCondicion + ' AND PC_IDPLANPAGO >= ' + IntToStr(edNroPreacuerdoDesde.Value);
  if not edNroPreacuerdoHasta.IsEmpty then
    sCondicion := sCondicion + ' AND PC_IDPLANPAGO <= ' + IntToStr(edNroPreacuerdoHasta.Value);

  if sCondicion <> '' then
  begin
    sCondicion := Copy(sCondicion, 5, Length(sCondicion));
    sSqlWhere := sSqlWhere + ' AND EXISTS (SELECT 1 ' +
                                            'FROM ZPV_PLANVALOR, ZPC_PLANCUOTA ' +
                                           'WHERE PV_IDPLANCUOTA=PC_ID ' +
                                             'AND PV_IDVALOR=VA_ID ' +
                                             'AND ' + sCondicion + ' ' +
                                           'UNION ALL ' +
                                          'SELECT 1 ' +
                                            'FROM ZRD_REEMPLAZODETALLE ' +
                                           'WHERE RD_TIPO=''E'' ' +
                                             'AND RD_IDVALOR=VA_ID ' +
                                             'AND RD_IDREEMPLAZOVALOR IN ' +
                                                     '(SELECT RD_IDREEMPLAZOVALOR ' +
                                                        'FROM ZRD_REEMPLAZODETALLE, ZPV_PLANVALOR, ZPC_PLANCUOTA ' +
                                                       'WHERE RD_IDVALOR=PV_IDVALOR ' +
                                                         'AND PV_IDPLANCUOTA=PC_ID ' +
                                                         'AND ' + sCondicion + ')) ';
  end;

  if chkBoleta.Checked then
    sSqlWhere := sSqlWhere + ' AND VA_IDBOLETADEP IS NULL';

  if edBD_NUMERO.Value > 0 then
    sSqlWhere := sSqlWhere + ' AND BD_NUMERO = ' + SqlValue(edBD_NUMERO.Value);

  if dbcBancos.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND VA_IDBANCO ' + dbcBancos.InSql;

  if dbcEstadosCheque.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND VA_ESTADO  ' + dbcEstadosCheque.InSql;

  if rbChequeSi.Checked then
    sSqlWhere := sSqlWhere + ' AND VA_FECHARECHAZO IS NOT NULL '
  else if rbChequeNo.Checked then
    sSqlWhere := sSqlWhere + ' AND VA_FECHARECHAZO IS NULL ';

  if rbEnvLegalesSi.Checked then
    sSqlWhere := sSqlWhere + ' AND VA_FECHALEGALES IS NOT NULL '
  else if rbEnvLegalesNo.Checked then
    sSqlWhere := sSqlWhere + ' AND VA_FECHALEGALES IS NULL ';

  if fraVA_TIPOVALOR.IsSelected then
    sSqlWhere := sSqlWhere + ' AND VA_IDTIPOVALOR = ' + SqlValue(fraVA_TIPOVALOR.Value);

  if rbSinRecibo.Checked then
    sSqlWhere := sSqlWhere + ' AND COBRANZA.GETTIPORECIBOVALOR(VA_ID) IN (''01'', ''02'', ''04'', ''08'')';  // Sin Recibo-Plan Pago / Sin Recibo-Común

  if rbReciboPlanPago.Checked then
    sSqlWhere := sSqlWhere + ' AND COBRANZA.GETTIPORECIBOVALOR(VA_ID) IN (''03'')';  // Recibo-Plan Pago

  if rbReciboComun.Checked then
    sSqlWhere := sSqlWhere + ' AND COBRANZA.GETTIPORECIBOVALOR(VA_ID) NOT IN (''01'', ''02'', ''03'', ''04'', ''08'')';  // Sin Recibo-Plan Pago / Sin Recibo-Común / Recibo-Plan Pago

  if (fraEmpresa.IsEmpty and fraGestorCuenta.IsEmpty) or rbEmpNormal.Checked then
    sSql := '/* SQL Cobranzas */ ' +
            'SELECT EM_ID ID, EM_CUIT CUIT, EM_NOMBRE RAZON_SOCIAL, TO_CHAR(CO_CONTRATO) CONTRATO, ' +
                   'VA_NROREEMPLAZO NRO_DE_REEMPLAZO, TO_CHAR(VA_NROCHEQUE) NRO_DE_CHEQUE, BA_NOMBRE BANCO, ' +
                   'VA_VENCIMIENTO VENCIMIENTO, VA_IMPORTE IMPORTE, RV_NUMERO NRO_DE_RECIBO, ' +
                   'VA_NEGOCIABLE NEGOCIABLE, VA_FECHARECHAZO FECHA_DE_RECHAZO, MRECH.TB_DESCRIPCION MOTIVO_RECHAZO, ' +
                   'BD_NUMERO BOLETA_DEPOSITO, TVAL.TV_DESCRIPCION TIPO_VALOR, VA_IDTIPOVALOR CODIGO_TIPO_VALOR, VA_ID IDVALOR, ' +
                   'VA_IDEMPDEUDORA IDEMPDEUDORA, VA_IDRECIBO IDRECIBO, VA_IDBOLETADEP IDBOLETADEPOSITO, ' +
                   'TVAL.TV_MODIFICABLE TBESPECIAL1_VALOR, TVAL.TV_BOLETADEPOSITO TBESPECIAL2_VALOR, VA_IDPAGOATERCERO IDPAGOATERCERO, ' +
                   'VA_FECHAIMPUTACION FECHAIMPUTACION, ''Cuota Plan de Pago'' CONCEPTO, '  +
                   'COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_ID) DESCR_TIPORECIBO, ' +
                   'EST.TB_DESCRIPCION DESCR_ESTADO, VA_ESTADO, VA_FECHARECHAZOEXTRACTO FRECHAZO_EXTRACTO, BD_FECHA FECHA_DEPOSITO, ' +
                   'VA_FECHALEGALES FECHALEGALES, VA_OBSERVACIONES OBSERVACIONESLEGALES, VA_CONCEPTOOBS OBSERVACIONES, TRUNC(VA_FECHAALTA) FECHAALTAVALOR ' +
              'FROM AFI.AEM_EMPRESA, AFI.ACO_CONTRATO, COB.ZBA_BANCO, OTV_TIPOVALOR TVAL, ' +
                   'TESO.RBD_BOLETADEPOSITO, CTB_TABLAS MRECH, COB.ZVA_VALOR, TESO.RRV_RECIBOVALOR, ' +
                   'CTB_TABLAS EST ' +
             'WHERE VA_IDCONTRATO = CO_CONTRATO ' +
               'AND CO_IDEMPRESA = EM_ID ' +
               'AND VA_IDTIPOVALOR = TVAL.TV_ID ' +
               'AND MRECH.TB_CLAVE(+) = ''MRECH'' ' +
               'AND MRECH.TB_CODIGO(+) = VA_MOTIVORECHAZO ' +
               'AND EST.TB_CLAVE = ''ESVAL'' ' +
               'AND EST.TB_CODIGO = VA_ESTADO ' +
               'AND BA_ID(+) = VA_IDBANCO ' +
               'AND BD_ID(+) = VA_IDBOLETADEP ' +
               'AND VA_IDRECIBO = RV_ID(+) ' +
               IIF(fraEmpresa.IsSelected, ' AND CO_IDEMPRESA=' + SqlInt( fraEmpresa.Value ), '') +
               sSqlWhere;

  if (fraEmpresa.IsEmpty and fraGestorCuenta.IsEmpty) then
    sSql := sSql + ' UNION ALL ';

  if (fraEmpresa.IsEmpty and fraGestorCuenta.IsEmpty) or rbEmpDeudora.Checked then
    sSql := sSql +  '/* SQL Tesorería */ ' +
            'SELECT ED_ID ID, ED_CUIT CUIT, ED_NOMBRE RAZON_SOCIAL, NULL CONTRATO, VA_NROREEMPLAZO NRO_DE_REEMPLAZO, ' +
                   'TO_CHAR(VA_NROCHEQUE) NRO_DE_CHEQUE, BA_NOMBRE BANCO, VA_VENCIMIENTO VENCIMIENTO, VA_IMPORTE IMPORTE, ' +
                   'RV_NUMERO NRO_DE_RECIBO, VA_NEGOCIABLE NEGOCIABLE, VA_FECHARECHAZO FECHA_DE_RECHAZO, ' +
                   'MRECH.TB_DESCRIPCION MOTIVO_RECHAZO, BD_NUMERO BOLETA_DEPOSITO, TVAL.TV_DESCRIPCION TIPO_VALOR, VA_IDTIPOVALOR CODIGO_TIPO_VALOR, ' +
                   'VA_ID IDVALOR, VA_IDEMPDEUDORA IDEMPDEUDORA, VA_IDRECIBO IDRECIBO, VA_IDBOLETADEP IDBOLETADEPOSITO, ' +
                   'TVAL.TV_MODIFICABLE TBESPECIAL1_VALOR, TVAL.TV_BOLETADEPOSITO TBESPECIAL2_VALOR, VA_IDPAGOATERCERO IDPAGOATERCERO, ' +
                   'VA_FECHAIMPUTACION FECHAIMPUTACION, CVTES.CV_DESCRIPCION CONCEPTO, ' +
                   'COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_ID) DESCR_TIPORECIBO, ' +
                   'EST.TB_DESCRIPCION DESCR_ESTADO, VA_ESTADO, VA_FECHARECHAZOEXTRACTO FRECHAZO_EXTRACTO, BD_FECHA FECHA_DEPOSITO, ' +
                   'VA_FECHALEGALES FECHALEGALES, VA_OBSERVACIONES OBSERVACIONESLEGALES, VA_CONCEPTOOBS OBSERVACIONES, TRUNC(VA_FECHAALTA) FECHAALTAVALOR ' +
              'FROM TESO.RED_EMPDEUDORA, COB.ZBA_BANCO, OTV_TIPOVALOR TVAL, ' +
                   'TESO.RBD_BOLETADEPOSITO, CTB_TABLAS MRECH, COB.ZVA_VALOR, ' +
                   'TESO.RRV_RECIBOVALOR, OCV_CONCEPTOVALOR CVTES, CTB_TABLAS EST ' +
             'WHERE VA_IDEMPDEUDORA=ED_ID ' +
               'AND VA_IDTIPOVALOR=TVAL.TV_ID ' +
               'AND MRECH.TB_CLAVE(+)=''MRECH'' ' +
               'AND MRECH.TB_CODIGO(+)=VA_MOTIVORECHAZO ' +
               'AND VA_IDCONCEPTOVALOR=CVTES.CV_ID ' +
               'AND EST.TB_CLAVE=''ESVAL'' ' +
               'AND EST.TB_CODIGO=VA_ESTADO ' +
               'AND BA_ID(+)=VA_IDBANCO ' +
               'AND BD_ID(+)=VA_IDBOLETADEP ' +
               'AND VA_IDRECIBO=RV_ID(+) ' +
               IIF(fraEmpresa.IsSelected, ' AND ED_ID=' + SqlInt( fraEmpresa.Value ), '') +
               sSqlWhere;

  if (fraEmpresa.IsEmpty and fraGestorCuenta.IsEmpty) then
    sSql := sSql + ' UNION ALL ';

  if (fraEmpresa.IsEmpty and fraGestorCuenta.IsEmpty) or rbEstudio.Checked then
    sSql := sSql + '/*SQL LEGALES */ ' +
          'SELECT GC_ID ID, GC_CUIT CUIT, GC_NOMBRE RAZON_SOCIAL, NULL CONTRATO, VA_NROREEMPLAZO NRO_DE_REEMPLAZO, ' +
                 'TO_CHAR(VA_NROCHEQUE) NRO_DE_CHEQUE, BA_NOMBRE BANCO, VA_VENCIMIENTO VENCIMIENTO, VA_IMPORTE IMPORTE, ' +
                 'RV_NUMERO NRO_DE_RECIBO, VA_NEGOCIABLE NEGOCIABLE, VA_FECHARECHAZO FECHA_DE_RECHAZO, MRECH.TB_DESCRIPCION ' +
                 'MOTIVO_RECHAZO, BD_NUMERO BOLETA_DEPOSITO, TVAL.TV_DESCRIPCION TIPO_VALOR, VA_IDTIPOVALOR CODIGO_TIPO_VALOR, ' +
                 'VA_ID IDVALOR, VA_IDEMPDEUDORA IDEMPDEUDORA, VA_IDRECIBO IDRECIBO, VA_IDBOLETADEP IDBOLETADEPOSITO, ' +
                 'TVAL.TV_MODIFICABLE TBESPECIAL1_VALOR, TVAL.TV_BOLETADEPOSITO TBESPECIAL2_VALOR, VA_IDPAGOATERCERO ' +
                 'IDPAGOATERCERO, VA_FECHAIMPUTACION FECHAIMPUTACION, CVTES.CV_DESCRIPCION CONCEPTO, ' +
                 'COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_ID) DESCR_TIPORECIBO, EST.TB_DESCRIPCION DESCR_ESTADO, VA_ESTADO, ' +
                 'VA_FECHARECHAZOEXTRACTO FRECHAZO_EXTRACTO, BD_FECHA FECHA_DEPOSITO, ' +
                 'VA_FECHALEGALES FECHALEGALES, VA_OBSERVACIONES OBSERVACIONESLEGALES, VA_CONCEPTOOBS OBSERVACIONES, TRUNC(VA_FECHAALTA) FECHAALTAVALOR ' +
            'FROM AGC_GESTORCUENTA, ZBA_BANCO, OTV_TIPOVALOR TVAL, RBD_BOLETADEPOSITO, CTB_TABLAS MRECH, ZVA_VALOR, ' +
                 'RRV_RECIBOVALOR, OCV_CONCEPTOVALOR CVTES, CTB_TABLAS EST ' +
           'WHERE VA_IDGESTORCUENTA=GC_ID ' +
             'AND VA_IDTIPOVALOR=TVAL.TV_ID ' +
             'AND MRECH.TB_CLAVE(+)=''MRECH'' ' +
             'AND MRECH.TB_CODIGO(+)=VA_MOTIVORECHAZO ' +
             'AND VA_IDCONCEPTOVALOR=CVTES.CV_ID ' +
             'AND EST.TB_CLAVE=''ESVAL'' ' +
             'AND EST.TB_CODIGO=VA_ESTADO ' +
             'AND BA_ID(+)=VA_IDBANCO ' +
             'AND BD_ID(+)=VA_IDBOLETADEP ' +
             'AND VA_IDRECIBO=RV_ID(+) ' +
             IIF(fraGestorCuenta.IsSelected, ' AND GC_ID=' + SqlInt(fraGestorCuenta.Value), '') +
             sSqlWhere;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;

procedure TfrmValAdministracion.opTipoEmpresaClick(Sender: TObject);
var
  bMostrarGestor: Boolean;
begin
  fraEmpresa.IsDeudora := rbEmpDeudora.Checked;

  bMostrarGestor := (Sender = rbEstudio);

  fraGestorCuenta.Visible := bMostrarGestor;
  fraEmpresa.Visible      := not bMostrarGestor;
end;

procedure TfrmValAdministracion.tbLimpiarClick(Sender: TObject);
begin
  edNroChequeDesde.Clear;
  edNroChequeHasta.Clear;
  edFechaChequeDesde.Clear;
  edFechaChequeHasta.Clear;
  edFechaAltaValorDesde.Clear;
  edFechaAltaValorHasta.Clear;
  edNroReciboDesde.Clear;
  edNroReciboHasta.Clear;
  edNroPreacuerdoDesde.Clear;
  edNroPreacuerdoHasta.Clear;
  dbcBancos.Clear;
  dbcEstadosCheque.Clear;
  fraEmpresa.Clear;
  fraGestorCuenta.Clear;
  rbEmpNormal.Checked := True;
  opTipoEmpresaClick(nil);
  rbChequeTodos.Checked     := True;
  rbEnvLegalesTodos.Checked := True;
  chkBoleta.Checked := False;
  edBD_NUMERO.Clear;
  edNroChequeDesde.SetFocus;
  fraVA_TIPOVALOR.Clear;
  rbTodos.Checked := True;
  inherited;
end;

procedure TfrmValAdministracion.mnuSeleccionarTodoClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmValAdministracion.mnuLimpiarSeleccionClick(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmValAdministracion.mnuInvertirSeleccionClick(Sender: TObject);
begin
  Grid.InvertSelection;
end;

procedure TfrmValAdministracion.tbmIprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmValAdministracion.tbImprimirClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmValAdministracion.mnuImprimirReciboClick(Sender: TObject);
var
  bEsReimpresion: Boolean;
  sListaIdValoresSeleccionados: String;
  sTipoReciboValor: String;
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla.')
  else
  begin
    if Grid.SelectedRows.Count = 1 then
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

    if IsRegistrosReciboValidos(bEsReimpresion, sListaIdValoresSeleccionados, sTipoReciboValor) then
      DoImprimirRecibos(bEsReimpresion, sListaIdValoresSeleccionados, sTipoReciboValor);
  end;
end;

{ Formatea los campos que lo requieren de la grilla }
procedure TfrmValAdministracion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  sdqConsulta.FieldByName('CUIT').EditMask := EMSK_CUIT;  // para ponerle los guiones al CUIT

  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

{ Modificación del valor seleccionado }
procedure TfrmValAdministracion.tbModificarClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla.')
  else
  begin
    if Grid.SelectedRows.Count = 1 then
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

    if IsRegistroModificacionValido() then
    begin
      Abrir(TfrmValIngreso, frmValIngreso, tmvHidden, nil);

      with frmValIngreso do
      begin
        if sdqConsulta.FieldByName('CONTRATO').IsNull then
          Cobranzas := False
        else
          Cobranzas := True;

        IdValor := sdqConsulta.FieldByName('IDVALOR').AsInteger;
        if sdqConsulta.FieldByName('IDEMPDEUDORA').IsNull then
          TipoEmpresa := teNormal
        else
          TipoEmpresa := teDeudora;
        EditType := fsModificar;

        ShowModal;
      end;
    end;
  end;
end;

{ Actualiza los valores seleccionados con el motivo de rechazo }
procedure TfrmValAdministracion.btnRechazoAceptarClick(Sender: TObject);
var
  i: Integer;
begin
  if IsDatosValidosRechazo() then
  begin
    BeginTrans;

    try
      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        with TSql.Create('ZVA_VALOR') do
        try
          PrimaryKey.Add('VA_ID',               sdqConsulta.FieldByName('IDVALOR').AsInteger);
          Fields.Add('VA_FECHARECHAZO',         exDate);
          Fields.Add('VA_FECHARECHAZOEXTRACTO', edFechaRechExtracto.Date);
          Fields.Add('VA_ESTADO',               '03');
          Fields.Add('VA_MOTIVORECHAZO',        fraCtbTablasRechazo.edCodigo.Text);
          Fields.Add('VA_TIPORECHAZO',          fraVA_TIPORECHAZO.Value);
          Fields.Add('VA_USUMODIF',             Sesion.UserId);
          Fields.Add('VA_FECHAMODIF',           exDateTime);

          SqlType := stUpdate;

          EjecutarSqlST( Sql );
        finally
          Free;
        end;

        DoImprimirNoticiacionRechazo(sdqConsulta.FieldByName('IDVALOR').AsInteger);
        Application.ProcessMessages;
      end;

      CommitTrans;

      MsgBox('Los valores se rechazaron correctamente.', MB_OK + MB_ICONINFORMATION);

      fpRechazo.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        Rollback;

        raise Exception.Create(E.Message + CRLF + 'Error al rechazar los valores.');
      end;
    end;
  end;
end;

{ Rechazo de los valores seleccionados }
procedure TfrmValAdministracion.tbRechazoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos una fila de la grilla.');
  Verificar(sdqConsulta.FieldByName('IDBOLETADEPOSITO').AsString = '', nil, 'No se puede rechazar un valor que no tiene boleta de depósito.');

  if Grid.SelectedRows.Count = 1 then
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

  if IsRegistrosRechazoValidos() then
    if fpRechazo.ShowModal = mrOk then
      sdqConsulta.Refresh;
end;

procedure TfrmValAdministracion.fpRechazoEnter(Sender: TObject);
begin
  inherited;

  fraCtbTablasRechazo.Clear;

  fraCtbTablasRechazo.Clave := 'MRECH';
  fraCtbTablasRechazo.ShowBajas := False;
  edFechaRechazo.Date := DBDateTime;

  LockControl(edFechaRechazo);
end;

{ Determina si los datos ingresados del rechazo de los valores son o no válidos }
function TfrmValAdministracion.IsDatosValidosRechazo: Boolean;
begin
  Verificar(not fraCtbTablasRechazo.IsSelected, fraCtbTablasRechazo.edCodigo, 'Debe ingresar el motivo de rechazo.');
  Verificar(not fraVA_TIPORECHAZO.IsSelected, fraVA_TIPORECHAZO.edCodigo, 'Debe ingresar el tipo de rechazo.');
  Verificar((fraVA_TIPORECHAZO.Especial1 = 'E') and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '06'), fraVA_TIPORECHAZO.edCodigo, 'No se puede rechazar un valor por extracto si el mismo no se encuentra conciliado.');
  Verificar((edFechaRechExtracto.IsEmpty) and (fraVA_TIPORECHAZO.Especial1 = 'E'), edFechaRechExtracto, 'La fecha de rechazo del extracto es obligatoria');
  Verificar((not edFechaRechExtracto.IsEmpty) and (edFechaRechExtracto.Date > edFechaRechazo.Date), edFechaRechExtracto, 'La fecha de rechazo del extracto debe ser menor o igual a la fecha');

  Result := True;
end;

{ Determina si los valores seleccionados en la grilla para ser rechazados son o no válidos }
function TfrmValAdministracion.IsRegistrosRechazoValidos: Boolean;
var
  bSalir: Boolean;
  i: Integer;
  sMensaje: String;
begin
  bSalir := False;

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

    // debe ser un tipo de valor permitido (cheque, por ej.)
    if sdqConsulta.FieldByName('TBESPECIAL1_VALOR').AsString <> 'S' then
    begin
      sMensaje := 'Alguno de los tipos de valores es incorrecto.';
      bSalir := True;
    end

    // fecha de rechazo debe ser nula
    else if not sdqConsulta.FieldByName('FECHA_DE_RECHAZO').IsNull then
    begin
      sMensaje := 'Alguno de los valores ya ha sido rechazado.';
      bSalir := True
    end;

    if bSalir then
    begin
      InvalidMsg (Grid, sMensaje);
      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

{ Determina si el valor seleccionado en la grilla para ser rechazado es o no válido }
function TfrmValAdministracion.IsRegistroModificacionValido: Boolean;
var
  TipoReciboValor: String;
begin
  Result := False;

  TipoReciboValor := GetTipoReciboValor(sdqConsulta.FieldByName('IDVALOR').AsInteger);

  // debe ser un tipo de valor permitido (cheque, por ej.)
  if sdqConsulta.FieldByName('TBESPECIAL1_VALOR').AsString <> 'S' then
    InvalidMsg(Grid, 'El tipo de valor es incorrecto.')

  // no debe tener un recibo
  else if not IsValorSinRecibo(TipoReciboValor) then
    InvalidMsg(Grid, 'El valor no debe tener un recibo emitido.')

  //No puede tener boleta de depósito
  else if not sdqConsulta.FieldByName('IDBOLETADEPOSITO').IsNull then
    InvalidMsg(Grid, 'El valor no debe tener boleta de depósito.')

  //No puede tener boleta de depósito
  else if not sdqConsulta.FieldByName('FECHA_DE_RECHAZO').IsNull then
    InvalidMsg(Grid, 'El valor no debe estar rechazado.')

  else
    Result := True;
end;

{ Impresión de los recibos de los valores seleccionados }
procedure TfrmValAdministracion.DoImprimirRecibos(var bEsReimpresion: Boolean; var sListaIdValoresSeleccionados,
                                                  sTipoReciboValor: String);
var
  bActualizarGrilla: Boolean;
  dFechaRecibo: TDateTime;
  iContrato: Integer;
  IdPlanPago: TTableId;
  idRecibo: TTableId;
  sSql: String;
  TipoRecibo: TTipoRecibo;
begin
  bActualizarGrilla := False;

  if bEsReimpresion then  // recibos ya impresos (pueden estar mezclados)
  begin
    sSql := 'UPDATE RRV_RECIBOVALOR ' +
               'SET RV_FECHAREIMP=' + SqlValue( DBDateTime ) + ', ' +
                   'RV_CANTREIMP=RV_CANTREIMP + 1 ' +
             'WHERE RV_ID IN (SELECT DISTINCT VA_IDRECIBO ' +
                               'FROM ZVA_VALOR ' +
                              'WHERE VA_ID IN ' + sListaIdValoresSeleccionados + ' ' +
                                'AND VA_IDRECIBO IS NOT NULL ' +
                              'UNION ' +
                             'SELECT DISTINCT PV_IDRECIBO ' +
                               'FROM ZPV_PLANVALOR ' +
                              'WHERE PV_IDVALOR IN ' + sListaIdValoresSeleccionados + ' ' +
                                'AND PV_IDRECIBO IS NOT NULL ' +
                              'UNION ' +
                             'SELECT DISTINCT XV_IDRECIBO ' +
                               'FROM LXV_RECUPEROVALOR ' +
                              'WHERE XV_IDVALOR IN ' + sListaIdValoresSeleccionados + ' ' +
                                'AND XV_IDRECIBO IS NOT NULL)';

    EjecutarSql(sSql);
  end
  else  // recibo nunca impreso, y todos los valores de un mismo CUIT - imprimo un solo recibo por todos los valores (si es un plan, agrupo los valores por contrato en cada recibo)
  begin
    BeginTrans;

    try
      TipoRecibo := GetTipoReciboSinImprimir(sTipoReciboValor);

      { determino fecha del recibo }
      sSql := 'SELECT TESORERIA.GET_FECHACAJAACTIVA(''I'') ' +
                'FROM DUAL';

      dFechaRecibo := ValorSqlDateTime(sSql, 0);
      if dFechaRecibo = 0 then
        raise Exception.Create('La caja de Ingreso no se encuentra activa.');

      case TipoRecibo of
        trComun, trReemplazo:
          DoGenerarRecibo(dFechaRecibo, sListaIdValoresSeleccionados, TipoRecibo);

        trPlanPago:
          begin
            sSql := 'SELECT DISTINCT PP_CONTRATO CONTRATO, PP_ID IDPLAN ' +
                      'FROM ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
                     'WHERE PV_IDPLANCUOTA = PC_ID ' +
                       'AND PC_IDPLANPAGO = PP_ID ' +
                       'AND PV_IDVALOR IN ' + sListaIdValoresSeleccionados;

            with GetQuery(sSql) do
            try
              while not Eof do
              begin
                iContrato  := FieldByName('CONTRATO').AsInteger;
                IdPlanPago := FieldByName('IDPLAN').AsInteger;

                DoGenerarRecibo(dFechaRecibo, sListaIdValoresSeleccionados, TipoRecibo, iContrato, IdPlanPago);

                Next;
              end;
            finally
              Free;
            end;
          end;

        trPlanPagoRecup:
          begin
            sSql := 'SELECT DISTINCT XP_ID IDPLAN ' +
                      'FROM LXV_RECUPEROVALOR, LXC_RECUPEROCUOTA, LXP_RECUPEROPLAN ' +
                     'WHERE XV_IDCUOTA = XC_ID ' +
                       'AND XC_IDPLANPAGO = XP_ID ' +
                       'AND XV_IDVALOR IN ' + sListaIdValoresSeleccionados;

            with GetQuery(sSql) do
            try
              while not Eof do
              begin
                IdPlanPago := FieldByName('IDPLAN').AsInteger;

                DoGenerarRecibo(dFechaRecibo, sListaIdValoresSeleccionados, TipoRecibo, 0, IdPlanPago);

                Next;
              end;
            finally
              Free;
            end;
          end;
      end;

      bActualizarGrilla := True;

      CommitTrans;
    except
      on E: Exception do
      begin
        Rollback;
        raise Exception.Create(E.Message);
      end;
    end;
  end;

  // selección de los id's de los recibos a imprimir
  sSql := 'SELECT DISTINCT VA_IDRECIBO ID_RECIBO ' +
            'FROM ZVA_VALOR ' +
           'WHERE VA_ID IN ' + sListaIdValoresSeleccionados + ' ' +
             'AND VA_IDRECIBO IS NOT NULL ' +
           'UNION ' +
          'SELECT DISTINCT PV_IDRECIBO ID_RECIBO ' +
            'FROM ZPV_PLANVALOR ' +
           'WHERE PV_IDVALOR IN ' + sListaIdValoresSeleccionados + ' ' +
             'AND PV_IDRECIBO IS NOT NULL ' +
           'UNION ' +
          'SELECT DISTINCT XV_IDRECIBO ID_RECIBO ' +
            'FROM LXV_RECUPEROVALOR ' +
           'WHERE XV_IDVALOR IN ' + sListaIdValoresSeleccionados + ' ' +
             'AND XV_IDRECIBO IS NOT NULL';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      IdRecibo := FieldByName('ID_RECIBO').AsInteger;

      with TfrmValImpresionRecibo.Create(Self) do
      try
        ImprimirRecibo(IdRecibo);
      finally
        Free;
      end;

      Next;
    end;
  finally
    Free;
  end;

  if bActualizarGrilla then
    sdqConsulta.Refresh;
end;

{ Boleta de depósito de los valores seleccionados }
procedure TfrmValAdministracion.tbBoletaDepositoClick(Sender: TObject);
var
  bEsAlta: Boolean;
  bMostrarPantallaAltaModif: Boolean;
  IdBoletaDeposito: TTableId;
  Monto: extended;
  sListaIdValoresSeleccionados: String;
  sSql: String;
begin
  inherited;

  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla.')
  else
  begin
    if Grid.SelectedRows.Count = 1 then
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

    if IsRegistrosBoletaDepositoValidos(bEsAlta, IdBoletaDeposito, sListaIdValoresSeleccionados, Monto) then
    begin
      if bEsAlta then
        bMostrarPantallaAltaModif := True
      else
      begin
        bMostrarPantallaAltaModif := False;
        sSql := 'SELECT BD_NUMERO ' +
                  'FROM RBD_BOLETADEPOSITO ' +
                 'WHERE BD_ID=' + SqlInt( IdBoletaDeposito );
        if MsgBox('Los valores poseen una boleta de depósito.' + Chr(13) + Chr(10) + '¿Desea remover los valores seleccionados de la boleta de depósito Nº ' + IntToStr(ValorSql(sSql)) + '?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
          DoEliminarBoletaDeposito(IdBoletaDeposito, sListaIdValoresSeleccionados);
      end;
      
      //Muestra la pantalla
      if bMostrarPantallaAltaModif then
      begin
        pIdBoletaDepositoModificacion := IdBoletaDeposito;
        pbEsAltaBoletaDeposito        := bEsAlta;
        edfpMontoBoletaDeposito.Value := Monto;
        if fpBoletaDeposito.ShowModal = mrOk then
          sdqConsulta.Refresh;
      end
      else
        sdqConsulta.Refresh;
    end;
  end;
end;

{ Determina si los valores seleccionados en la grilla para realizar las boleta de depósito son o no válidos }
function TfrmValAdministracion.IsRegistrosBoletaDepositoValidos(var bEsAlta: Boolean; var IdBoletaDeposito: TTableId;
                                                                var sListaIdValoresSeleccionados: String;
                                                                var MontoSeleccionado: extended): Boolean;
var
  bSalir: Boolean;
  i: Integer;
  sMensaje: String;
  sSql: String;
begin
  IdBoletaDeposito := ART_EMPTY_ID;
  bSalir           := False;
  bEsAlta          := False;
  MontoSeleccionado := 0;
  sListaIdValoresSeleccionados := '(';

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

    if i = 0 then
    begin
      if sdqConsulta.FieldByName('IDBOLETADEPOSITO').IsNull then
        bEsAlta := True
      else
      begin
        IdBoletaDeposito := sdqConsulta.FieldByName('IDBOLETADEPOSITO').AsInteger;
        bEsAlta          := False;
      end;
    end;

    if bEsAlta then  // alta
    begin
      // debe ser un tipo de valor permitido (boleta de depósito, por ej.)
      if sdqConsulta.FieldByName('TBESPECIAL2_VALOR').AsString <> 'S' then
      begin
        sMensaje := 'Alguno de los tipos de valores es incorrecto.';
        bSalir := True;
      end

      // fecha de imputación
      else if not sdqConsulta.FieldByName('FECHAIMPUTACION').IsNull then
      begin
        sMensaje := 'Alguno de los valores ya tiene fecha de imputación.';
        bSalir := True;
      end

      // fecha de rechazo
      else if not sdqConsulta.FieldByName('FECHA_DE_RECHAZO').IsNull then
      begin
        sMensaje := 'Alguno de los valores ya tiene fecha de rechazo.';
        bSalir := True;
      end

      // fecha de los cheques
      else if sdqConsulta.FieldByName('VENCIMIENTO').AsDateTime > DBDate then
      begin
        sMensaje := 'Alguno de los valores seleccionados tiene fecha de vencimiento posterior a hoy.';
        bSalir := True;
      end

      // todos los id de la boleta de depósito deben ser nulos, en el alta
      else if not sdqConsulta.FieldByName('IDBOLETADEPOSITO').IsNull then
      begin
        sMensaje := 'Alguno de los valores ya tiene una boleta de depósito.';
        bSalir := True;
      end

      // el valor debe tener recibo, en el alta
      else if (sdqConsulta.FieldByName('IDRECIBO').IsNull) and
              (ValorSqlInteger('SELECT MAX(IDRECIBO) FROM (' +
                                      'SELECT PV_IDRECIBO IDRECIBO ' +
                                        'FROM ZPV_PLANVALOR ' +
                                       'WHERE PV_IDVALOR = ' + SqlValue(sdqConsulta.FieldByName('IDVALOR').AsInteger) + ' ' +
                                       'UNION ALL ' +
                                      'SELECT XV_IDRECIBO IDRECIBO ' +
                                        'FROM LXV_RECUPEROVALOR ' +
                                       'WHERE XV_IDVALOR = ' + SqlValue(sdqConsulta.FieldByName('IDVALOR').AsInteger) + ')'
                              ) = 0) then
      begin
        sMensaje := 'Alguno de los valores no poseen recibo.';
        bSalir := True;
      end

      // el valor no puede estar en estado Reemplazado
      else if sdqConsulta.FieldByName('VA_ESTADO').AsString = '05' then
      begin
        sMensaje := 'Alguno de los valores se encuentra en estado Reemplazado.';
        bSalir := True;
      end;
    end
    else  // modificación
    begin
      sSql := 'SELECT BD_FECHA ' +
                'FROM RBD_BOLETADEPOSITO ' +
               'WHERE BD_ID = ' + sdqConsulta.FieldByName('IDBOLETADEPOSITO').AsString;

      // todos los id de la boleta de depósito no deben ser nulos, en la modificación
      if sdqConsulta.FieldByName('IDBOLETADEPOSITO').IsNull then
      begin
        sMensaje := 'Alguno de los valores no tiene una boleta de depósito.';
        bSalir := True;
      end

      // DB_FECHA, fecha de deposito debe ser nula para poder modificar algo
      else if ValorSql(sSql) <> '' then
      begin
        sMensaje := 'La boleta ya posee una fecha de depósito y no puede ser modificada.';
        bSalir := True;
      end

      // todos los valores deben corresponder a la misma boleta de depósito
      else if IdBoletaDeposito <> sdqConsulta.FieldByName('IDBOLETADEPOSITO').AsInteger then
      begin
        sMensaje := 'Todos los valores deben tener una misma boleta de depósito.';
        bSalir := True;
      end;
    end;

    if bSalir then
    begin
      InvalidMsg(Grid, sMensaje);

      Result := False;
      Exit;
    end;

    //Se encarga de sumar el monto para obtener el monto total de la boleta de deposito
    MontoSeleccionado := MontoSeleccionado + sdqConsulta.FieldByName('IMPORTE').AsFloat;
    sListaIdValoresSeleccionados := sListaIdValoresSeleccionados +  sdqConsulta.FieldByName('IDVALOR').AsString + ', ';
  end;

  sListaIdValoresSeleccionados := Copy(sListaIdValoresSeleccionados, 1, Length(sListaIdValoresSeleccionados) - 2) + ')';
  Result := True;
end;

{ Genera la boleta de depósito correspondiente y crea la relación/es con la tabla de valores }
procedure TfrmValAdministracion.btnBoletaDepositoAceptarClick(Sender: TObject);
var
  i: Integer;
  IdBoletaDeposito: TTableId;
  sMensaje: String;
begin
  if IsDatosValidosBoletaDeposito(pbEsAltaBoletaDeposito, pIdBoletaDepositoModificacion) then
  begin
    BeginTrans;

    try
      if pbEsAltaBoletaDeposito then
        IdBoletaDeposito := GetSecNextVal('SEQ_RBD_ID')
      else
        IdBoletaDeposito := pIdBoletaDepositoModificacion;

      { Inserto o modifico boleta de depósito }
      with TSql.Create('RBD_BOLETADEPOSITO') do
      try
        PrimaryKey.Add('BD_ID',           IdBoletaDeposito);
        Fields.Add('BD_IDCUENTABANCARIA', fraBancoBoletaDeposito.Value);

        if edSerieBoletaDeposito.Text <> '' then
          Fields.Add('BD_SERIE',          edSerieBoletaDeposito.Text);

        Fields.Add('BD_NUMERO',         edNumeroBoletaDeposito.Value);
        Fields.Add('BD_MONTO',          edfpMontoBoletaDeposito.Value, dtNumber);
        //Fields.Add('BD_FECHA',          edFechaBoletaDeposito.Date);

        if pbEsAltaBoletaDeposito then
        begin
          Fields.Add('BD_USUALTA',        Sesion.UserId);
          Fields.Add('BD_FECHAALTA',      exDateTime);

          SqlType := stInsert;
        end
        else
        begin
          Fields.Add('BD_USUMODIF',       Sesion.UserId);
          Fields.Add('BD_FECHAMODIF',     exDateTime);

          SqlType := stUpdate;
        end;

        EjecutarSqlST(Sql);
      finally
        Free;
      end;


      if pbEsAltaBoletaDeposito then
      begin
        for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

          { Inserto relación entre boleta de depósito y valor }
          with TSql.Create('ZVA_VALOR') do
          try
            PrimaryKey.Add('VA_ID',      sdqConsulta.FieldByName('IDVALOR').AsInteger);
            Fields.Add('VA_IDBOLETADEP', IdBoletaDeposito);

            SqlType := stUpdate;

            EjecutarSqlST(Sql);
          finally
            Free;
          end;
        end;
      end;

      CommitTrans;


      if pbEsAltaBoletaDeposito then
        sMensaje := 'La boleta de depósito se generó correctamente'
      else
        sMensaje := 'La boleta de depósito se modificó correctamente';

      MsgBox(sMensaje, MB_OK + MB_ICONINFORMATION);


      fpBoletaDeposito.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        Rollback;

        raise Exception.Create(E.Message + CRLF + 'Error al generar la boleta de depósito.');
      end;
    end;
  end;
end;

{ Determina si los datos ingresados de la boleta de depósito son o no válidos}
function TfrmValAdministracion.IsDatosValidosBoletaDeposito(bEsAlta: Boolean; IdBoletaDeposito: TTableId): Boolean;
var
  sSql: String;
begin
  Result := False;

  // banco
  if not fraBancoBoletaDeposito.IsSelected then
    InvalidMsg(fraBancoBoletaDeposito.edCodigo, 'Debe ingresar el número de cuenta bancaria.')

  // nro. de boleta de depósito
  else if edNumeroBoletaDeposito.IsEmpty then
    InvalidMsg(edNumeroBoletaDeposito, 'Debe ingresar el número de boleta de depósito.')
  else if edNumeroBoletaDeposito.Value <= 0 then
    InvalidMsg(edNumeroBoletaDeposito, 'El número de boleta de depósito debe ser mayor a 0.')

  // Unique key - banco + serie + número
  else
  begin
    sSql := 'SELECT 1 ' +
              'FROM RBD_BOLETADEPOSITO ' +
             'WHERE BD_IDCUENTABANCARIA = ' + SqlValue(fraBancoBoletaDeposito.Value) + ' ' +
               'AND BD_SERIE = ' + SqlValue(NVL(edSerieBoletaDeposito.Text, '0')) + ' ' +
               'AND BD_NUMERO = ' + SqlValue(edNumeroBoletaDeposito.Value);
    if not bEsAlta then  // modificación
      sSql := sSql + 'AND BD_ID <> ' + SqlInt(IdBoletaDeposito);

    if ExisteSql(sSql) then
      InvalidMsg(fraBancoBoletaDeposito.edCodigo, 'Ya existe la boleta de depósito.')
    else
      Result := True;
  end;
end;

procedure TfrmValAdministracion.fpBoletaDepositoEnter(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  if pbEsAltaBoletaDeposito then
  begin
    fraBancoBoletaDeposito.Clear;
    edSerieBoletaDeposito.Clear;
    edNumeroBoletaDeposito.Clear;
  end
  else
  begin
    sSql := 'SELECT BD_IDCUENTABANCARIA, BD_SERIE, BD_NUMERO' +
             ' FROM RBD_BOLETADEPOSITO' +
            ' WHERE BD_ID = :Id';

    with GetQueryEx(sSql, [pIdBoletaDepositoModificacion]) do
    try
      if not IsEmpty then
      begin
        fraBancoBoletaDeposito.Value := FieldByName('BD_IDCUENTABANCARIA').AsInteger;
        edSerieBoletaDeposito.Text   := FieldByName('BD_SERIE').AsString;
        edNumeroBoletaDeposito.Value := FieldByName('BD_NUMERO').AsInteger;
      end;
    finally
      Free;
    end;
  end;
  fraBancoBoletaDeposito.edCodigo.SetFocus;
end;

{ Pago a terceros de los valores seleccionados }
procedure TfrmValAdministracion.tbPagoTercerosClick(Sender: TObject);
begin
  inherited;

  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla.')
  else
  begin
    if Grid.SelectedRows.Count = 1 then
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

    if IsRegistrosPagoATercerosValidos() then
    begin
      dmFinancials.Conectar;
      try
        if fpPagoATerceros.ShowModal = mrOk then
          sdqConsulta.Refresh;
      finally
        dmFinancials.Desconectar;
      end;
    end;
  end;
end;

{ Determina si los valores seleccionados en la grilla para realizar el pago a terceros son o no válidos }
function TfrmValAdministracion.IsRegistrosPagoATercerosValidos: Boolean;
var
  bSalir: Boolean;
  i: Integer;
  sMensaje: String;
begin
  bSalir := False;

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

    // debe ser un tipo de valor permitido (cheque, por ej.)
    if sdqConsulta.FieldByName('TBESPECIAL1_VALOR').AsString <> 'S' then
    begin
      sMensaje := 'Alguno de los tipos de valores es incorrecto';
      bSalir := True;
    end

    // el id del pago a tercero debe ser nulo
    else if not sdqConsulta.FieldByName('IDPAGOATERCERO').IsNull then
    begin
      sMensaje := 'Alguno de los valores ya ha sido asignado al pago a un tercero';
      bSalir := True;
    end

    // el id de la boleta de depósito debe ser nula
    else if not sdqConsulta.FieldByName('IDBOLETADEPOSITO').IsNull then
    begin
      sMensaje := 'Alguno de los valores ya tiene una boleta de depósito';
      bSalir := True;
    end

    // el valor debe ser negociable
    else if sdqConsulta.FieldByName('NEGOCIABLE').AsString <> 'S' then
    begin
      sMensaje := 'Alguno de los valores no es negociable';
      bSalir := True;
    end;

    if bSalir then
    begin
      InvalidMsg(Grid, sMensaje);

      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

{ Genera el pago a tercero correspondiente y crea la relación/es con la tabla de valores }
{ ESTO NO SE USA ACTUALMENTE, DIOS QUIERA QUE NUNCA LO PIDAN, PTAVASCI 07/10/2005 }
procedure TfrmValAdministracion.btnPagoATercerosAceptarClick(Sender: TObject);
var
  i: Integer;
  IdPagoATercero: TTableId;
begin
  if IsDatosValidosPagoATerceros() then
  begin
    BeginTrans;

    try
      IdPagoATercero := GetSecNextVal('SEQ_RPT_ID');

      { Inserto el pago a terceros }
      with TDBSql.Create('RPT_PAGOATERCERO') do
      try
        PrimaryKey.Add('PT_ID',      IdPagoATercero);
        Fields.Add('PT_IDORDENPAGO', cmbOrdenDePagoPagoATerceros.FieldValue);
        Fields.Add('PT_USUALTA',     Sesion.UserId);
        Fields.Add('PT_FECHAALTA',   exDateTime);

        SqlType := stInsert;

        ExecuteST; //EjecutarSqlST( Sql );
      finally
        Free;
      end;

      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

        { Inserto relación entre pago a terceros y valor }
        with TDBSql.Create('ZVA_VALOR') do
        try
          PrimaryKey.Add('VA_ID',         sdqConsulta.FieldByName('IDVALOR').AsInteger);
          Fields.Add('VA_IDPAGOATERCERO', IdPagoATercero);

          SqlType := stUpdate;

          ExecuteST; //EjecutarSqlST( Sql );
        finally
          Free;
        end;
      end;

      CommitTrans;

      MsgBox('El pago a terceros se generó correctamente.', MB_OK + MB_ICONINFORMATION);

      fpPagoATerceros.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        Rollback;

        raise Exception.Create(E.Message + CRLF + 'Error al generar el pago a terceros.');
      end;
    end;
  end;
end;

procedure TfrmValAdministracion.fpPagoATercerosEnter(Sender: TObject);
begin
  inherited;

  cmbOrdenDePagoPagoATerceros.Clear;
  edRestantePagoATerceros.Clear;
  edDiferenciaPagoATerceros.Clear;

  sdqOrdenesDePago.SQL.Text :='SELECT IDORDENPAGO, BENEFICIARIO, MONTO_RESTANTE ' +
                                'FROM ART_PAGO_TERCERO ' +
                               'ORDER BY BENEFICIARIO, MONTO_RESTANTE';

  dmFinancials.OpenQuery(sdqOrdenesDePago);

  edTotalValoresPagoATerceros.Value := GetImporteTotalValores();

  edDiferenciaPagoATerceros.Font.Color := clWindowText
end;

{ Determina si los datos ingresados del pago a terceros son o no válidos}
function TfrmValAdministracion.IsDatosValidosPagoATerceros: Boolean;
var
  sSql: String;
begin
  Result := False;

  // número de orden de pago
  if cmbOrdenDePagoPagoATerceros.FieldValue = '' then
    InvalidMsg(cmbOrdenDePagoPagoATerceros, 'El nro. de orden de pago es obligatorio.')

  // diferencia
  else if edDiferenciaPagoATerceros.Value < 0 then
    InvalidMsg(edDiferenciaPagoATerceros, 'El total de los valores seleccionados no puede superar al monto restante de la orden de pago.')

  // Unique key - id. orden pago
  else
  begin
    sSql := 'SELECT 1 ' +
              'FROM RPT_PAGOATERCERO ' +
             'WHERE PT_IDORDENPAGO=' + cmbOrdenDePagoPagoATerceros.FieldValue;

    if ExisteSql(sSql) then
      InvalidMsg(fraBancoBoletaDeposito.edCodigo, 'Ya se ha efectuado el pago del nro. de orden ingresado.')
    else
      Result := True;
  end;
end;

{ Calcula el total de los importes de los valores seleccionados }
function TfrmValAdministracion.GetImporteTotalValores: Currency;
var
  i: Integer;
  Total: Currency;
begin
  Total := 0;

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

    Total := Total + sdqConsulta.FieldByName('IMPORTE').AsCurrency;
  end;

  Result := Total;
end;

procedure TfrmValAdministracion.sdqOrdenesDePagoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqOrdenesDePago.FieldByName('MONTO_RESTANTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqOrdenesDePago.FieldByName('MONTO_RESTANTE')).Currency := True;
end;

procedure TfrmValAdministracion.cmbOrdenDePagoPagoATercerosCloseUp(Sender: TObject);
begin
  inherited;

  edRestantePagoATerceros.Value := sdqOrdenesDePago.FieldByName('MONTO_RESTANTE').AsCurrency;

  edDiferenciaPagoATerceros.Value := edRestantePagoATerceros.Value - edTotalValoresPagoATerceros.Value;

  if edDiferenciaPagoATerceros.Value < 0 then
    edDiferenciaPagoATerceros.Font.Color := clRed
  else
    edDiferenciaPagoATerceros.Font.Color := clWindowText;
end;

procedure TfrmValAdministracion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                  Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.FieldByName('CONTRATO').IsNull then
  begin
    if Highlight then
      Background := clTeal
    else
      Background := $00E1FFFF;
  end;
end;

{ Determina si los valores seleccionados en la grilla para realizar la impresión de los recibos son o no válidos }
function TfrmValAdministracion.IsRegistrosReciboValidos(var bEsReimpresion: Boolean; var sListaIdValoresSeleccionados,
                                                        sTipoReciboValor: String): Boolean;
var
  bActualEsReimpresion: Boolean;
  bSalir: Boolean;
  i: Integer;
  sCuit: String;
  sCuitActual: String;  
  sMensaje: String;
  sSql, sTipoReciboValorActual: String;
begin
  bEsReimpresion := False;
  bSalir         := False;
  sListaIdValoresSeleccionados := '(';
  sTipoReciboValor             := '';

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

    sTipoReciboValorActual := GetTipoReciboValor(sdqConsulta.FieldByName('IDVALOR').AsInteger);

    // si el valor no tiene recibo, entonces se va a imprimir por primera vez
    if IsValorSinRecibo(sTipoReciboValorActual) then
    begin
      bActualEsReimpresion := False;
      sCuitActual := sdqConsulta.FieldByName('CUIT').AsString;
    end
    else
    begin
      bActualEsReimpresion := True;
      sCuitActual := '';
    end;
    // si es un nro. de recibo común
    // para mapearlo a un mismo grupo (como en los otros 3 casos), sinó serían los distintos nros. de recibo y no andaría
    if not AreIn(sTipoReciboValorActual, ['01', '02', '03', '04', '07', '08']) then
      sTipoReciboValorActual := '99';

    sListaIdValoresSeleccionados := sListaIdValoresSeleccionados + sdqConsulta.FieldByName('IDVALOR').AsString + ', ';

    // Las validaciones son que todos los valores pertenecen al mismo tipo de recibo (Sin Recibo-Plan Pago,
    // Sin Recibo-Común, Recibo-Plan Pago, o nro. de recibo comun), pero no pueden mezclarse entre sí.
    // Además, si ninguno de los valores tiene un recibo, entonces deben tener todos el mismo CUIT (no se
    // pueden mezclar empresas)
    if i = 0 then
    begin
      bEsReimpresion   := bActualEsReimpresion;
      sCuit            := sCuitActual;
      sTipoReciboValor := sTipoReciboValorActual;
    end
    else
    begin
      if sTipoReciboValor <> sTipoReciboValorActual then
      begin
        sMensaje := 'Todos los valores seleccionados deben pertenecer al mismo Tipo de Recibo del Valor';
        bSalir := True;
      end
      else if sCuitActual <> sCuit then
      begin
        sMensaje := 'Todos los valores seleccionados deben corresponder a la misma empresa';
        bSalir := True;
      end
    end;

    if bSalir then
    begin
      InvalidMsg(Grid, sMensaje);

      Result := False;
      Exit;
    end;
  end;

  sListaIdValoresSeleccionados := Copy(sListaIdValoresSeleccionados, 1, Length(sListaIdValoresSeleccionados) - 2) + ')';

  sSql := 'SELECT COUNT(DISTINCT RD_IDREEMPLAZOVALOR) ' +
            'FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR ' +
           'WHERE VA_ID = RD_IDVALOR ' +
             'AND RD_TIPO = ''E'' ' +
             'AND VA_ID IN ' + sListaIdValoresSeleccionados;

  if ValorSqlInteger(sSql) > 1 then
  begin
    InvalidMsg(Grid, 'Los valores corresponden a distintos reemplazos.');

    Result := False;
    Exit;
  end;

  Result := True;
end;

// elimina las boletas de depósito de los valores seleccionados (relación), y borra la boleta de
// depósito si corresponde
procedure TfrmValAdministracion.DoEliminarBoletaDeposito(IdBoletaDeposito: TTableId; sListaIdValoresSeleccionados: String);
var
  Monto: Extended;
  sSql: String;  
begin
  try
    BeginTrans;

    // elimino relación de boleta de depósito, en tabla de valores
    sSql := 'UPDATE ZVA_VALOR ' +
               'SET VA_IDBOLETADEP=NULL, ' +
                   'VA_USUMODIF='+ SqlValue(Sesion.UserId) + ', ' +
                   'VA_FECHAMODIF='+ SqlValue(DBDateTime) + ' ' +
             'WHERE VA_ID IN ' + sListaIdValoresSeleccionados;
    EjecutarSqlST(sSql);

    sSql := 'SELECT SUM(VA_IMPORTE) ' +
              'FROM ZVA_VALOR ' +
             'WHERE VA_IDBOLETADEP=' + SqlInt(IdBoletaDeposito);
    Monto := ValorSqlExtended(sSql);
    if Monto = 0 then
    begin
      // elimino reg. con la boleta de depósito
      with TDBSql.Create( 'RBD_BOLETADEPOSITO' ) do
      try
        PrimaryKey.Add( 'BD_ID', IdBoletaDeposito);

        SqlType := stDelete;

        ExecuteST; //EjecutarSqlST( Sql );
      finally
        Free;
      end;
    end
    else
    begin
      // elimino reg. con la boleta de depósito
      with TSql.Create('RBD_BOLETADEPOSITO') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('BD_ID', IdBoletaDeposito);
        Fields.Add('BD_MONTO', Monto, dtNumber);
        EjecutarSqlST(Sql);
      finally
        Free;
      end;
    end;
    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;

      raise Exception.Create(E.Message + CRLF + 'Error al eliminar la boleta de depósito.');
    end;
  end;
end;

// Devuelve el total de los importes de los valores seleccionados
function TfrmValAdministracion.GetImporteTotalValoresListaId(sListaIdValoresSeleccionados: String;
                                                             TipoRecibo: TTipoRecibo; Contrato: Integer): Currency;
var
  sSql: String;
begin
  case TipoRecibo of
    trComun, trReemplazo:
      sSql := 'SELECT SUM(VA_IMPORTE) ' +
                'FROM ZVA_VALOR ' +
               'WHERE VA_ID IN ' + sListaIdValoresSeleccionados;

    trPlanPago:
      sSql := 'SELECT SUM(PV_IMPORTE) ' +
                'FROM ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
               'WHERE PV_IDPLANCUOTA=PC_ID ' +
                 'AND PC_IDPLANPAGO=PP_ID ' +
                 'AND PP_CONTRATO=' + SqlValue(Contrato) + ' ' +
                 'AND PV_IDVALOR IN ' + sListaIdValoresSeleccionados;

    trPlanPagoRecup:
      sSql := 'SELECT SUM(XV_IMPORTE) ' +
                'FROM LXV_RECUPEROVALOR, LXC_RECUPEROCUOTA, LXP_RECUPEROPLAN ' +
               'WHERE XV_IDCUOTA=XC_ID ' +
                 'AND XC_IDPLANPAGO=XP_ID ' +
                 'AND XV_IDVALOR IN ' + sListaIdValoresSeleccionados;
  end;

  Result := ValorSqlExtended(sSql);
end;

procedure TfrmValAdministracion.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmValAdministracion.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := '$ ' + FloatToStr(TotalConsulta[iPos]);
end;

procedure TfrmValAdministracion.rbReciboComunClick(Sender: TObject);
var
  bHabilitarNroRecibo: Boolean;
begin
  bHabilitarNroRecibo := (Sender = rbReciboComun);

  edNroReciboDesde.Clear;
  edNroReciboHasta.Clear;

  gbNroRecibo.Enabled := bHabilitarNroRecibo;
end;

function TfrmValAdministracion.IsValorSinRecibo(TipoReciboValor: String): Boolean;
begin
  Result := (AreIn(TipoReciboValor, ['', '01', '02', '04', '08']));  // Sin Recibo-Plan Pago / Sin Recibo-Común
end;

procedure TfrmValAdministracion.tbMostrarRecibosPlanPagoClick(Sender: TObject);
var
  IdValor: TTableId;
begin
  if IsRegistrosRecibosPlanPagoValidos then
    begin
      IdValor := sdqConsulta.FieldByName('IDVALOR').AsInteger;

      with TfrmRecibosValorPlanPago.Create(Self) do
        try
          DoCargarRecibosValorPlanPago(IdValor);
        finally
          Free;
        end;
    end;
end;

function TfrmValAdministracion.IsRegistrosRecibosPlanPagoValidos: Boolean;
begin
  Result := False;

  if Grid.SelectedRows.Count <> 1 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')
  else if not AreIn(GetTipoReciboValor(sdqConsulta.FieldByName('IDVALOR').AsInteger),  ['03', '07']) then   // Recibo-Plan Pago / Recibo-Plan Pago Recupero
    InvalidMsg(Grid, 'El recibo debe ser de un plan de pago.')
  else
    Result := True;
end;

function TfrmValAdministracion.GetTipoReciboSinImprimir(TipoReciboValor: String): TTipoRecibo;
begin
  if TipoReciboValor = '01' then         // 'Sin Recibo-Plan Pago'
    Result := trPlanPago
  else if TipoReciboValor = '02' then    // 'Sin Recibo-Común'
    Result := trComun
  else if TipoReciboValor = '04' then    // 'Sin Recibo-Reemplazo'
    Result := trReemplazo
  else if TipoReciboValor = '08' then    // 'Sin Recibo-Plan Pago Recupero'
    Result := trPlanPagoRecup
  else
    Result := trNone;
end;

procedure TfrmValAdministracion.DoGenerarRecibo(dFechaRecibo: TDateTime; sListaIdValoresSeleccionados: String;
                                                TipoRecibo: TTipoRecibo; Contrato: Integer = 0; IdPlanPago: Integer = 0);
var
  iNroRecibo: Integer;
  IdRecibo: TTableId;
  rImporteTotal: Currency;
  sSql: String;
begin
  { determino nro. del recibo }
  sSql := 'SELECT CT_CONTADOR NRO_RECIBO ' +
            'FROM CCT_CONTADORES ' +
           'WHERE CT_NUMERO=' + SqlValue(cctRecibos) + ' ' +
            ' FOR UPDATE';
  iNroRecibo := ValorSqlInteger(sSql);

  { actualizo tabla con contador del nro. recibo }
  with TDBSql.Create('CCT_CONTADORES') do
  try
    PrimaryKey.Add('CT_NUMERO', cctRecibos);
    Fields.Add('CT_CONTADOR',   'CT_CONTADOR + 1', False);
    SqlType := stUpdate;

    EjecutarSqlST(Sql);

    Clear;

    IdRecibo      := GetSecNextVal('SEQ_RRV_ID');
    rImporteTotal := GetImporteTotalValoresListaId(sListaIdValoresSeleccionados, TipoRecibo, Contrato);

    { inserto en tabla de recibos impresos }
    TableName := 'RRV_RECIBOVALOR';

    Fields.Add('RV_ID',              IdRecibo);
    Fields.Add('RV_NUMERO',          iNroRecibo);
    Fields.Add('RV_SERIE',           2);
    Fields.AddExtended('RV_IMPORTE', rImporteTotal, ALL_DECIMALS, False);
    Fields.Add('RV_FECHA',           Trunc(dFechaRecibo), dmDate);
    Fields.Add('RV_FECHAIMPRESION',  exDateTime);
    Fields.Add('RV_USUIMPRESION',    Sesion.UserId);
    Fields.Add('RV_CANTREIMP',       1);
    Fields.Add('RV_USUALTA',         Sesion.UserId);
    Fields.Add('RV_FECHAALTA',       exDateTime);

    SqlType := stInsert;

    ExecuteST; //EjecutarSqlST( Sql );
  finally
    Free;
  end;

  case TipoRecibo of
    trComun, trReemplazo:
      begin
        { creo relación entre tabla de recibos impresos y valores }
        sSql := 'UPDATE ZVA_VALOR ' +
                   'SET VA_IDRECIBO=' + SqlValue(IdRecibo) + ' ' +
                 'WHERE VA_ID IN ' + sListaIdValoresSeleccionados;
        EjecutarSqlST(sSql);
      end;

    trPlanPago:
      begin
        { creo relación entre tabla de recibos impresos y valores del plan }
        sSql := 'UPDATE ZPV_PLANVALOR A ' +
                   'SET A.PV_IDRECIBO=' + SqlValue(IdRecibo) + ' ' +
                 'WHERE A.PV_ID IN (SELECT B.PV_ID ' +
                                     'FROM ZPV_PLANVALOR B, ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
                                     'WHERE B.PV_IDPLANCUOTA=PC_ID ' +
                                       'AND PC_IDPLANPAGO=PP_ID ' +
                                       'AND PP_ID=' + SqlValue(IdPlanPago) + ' ' +
                                       'AND B.PV_IDVALOR IN ' + sListaIdValoresSeleccionados + ')';
        EjecutarSqlST(sSql);

        sSql := 'UPDATE ZCT_CERTIFICADORETENCION ' +
                   'SET CT_IDRECIBO = :Id ' +
                 'WHERE CT_IDPLANVALOR IN (SELECT PV_ID ' +
                                            'FROM ZPC_PLANCUOTA, ZPV_PLANVALOR ' +
                                           'WHERE PC_ID = PV_IDPLANCUOTA ' +
                                             'AND PC_IDPLANPAGO IN (SELECT PC_IDPLANPAGO FROM ZPC_PLANCUOTA, ZPV_PLANVALOR ' +
                                                                    'WHERE PC_ID = PV_IDPLANCUOTA ' +
                                                                      'AND PV_IDRECIBO = :Id))';
        EjecutarSqlSTEx(sSql, [IdRecibo]);
      end;

    trPlanPagoRecup:
      begin
        { creo relación entre tabla de recibos impresos y valores del plan de recupero}
        sSql := 'UPDATE LXV_RECUPEROVALOR A ' +
                   'SET A.XV_IDRECIBO=' + SqlValue(IdRecibo) + ' ' +
                 'WHERE A.XV_ID IN (SELECT B.XV_ID ' +
                                     'FROM LXV_RECUPEROVALOR B, LXC_RECUPEROCUOTA, LXP_RECUPEROPLAN ' +
                                     'WHERE B.XV_IDCUOTA=XC_ID ' +
                                       'AND XC_IDPLANPAGO=XP_ID ' +
                                       'AND XP_ID=' + SqlValue(IdPlanPago) + ' ' +
                                       'AND B.XV_IDVALOR IN ' + sListaIdValoresSeleccionados + ')';
        EjecutarSqlST(sSql);
      end;
  end;
end;

procedure TfrmValAdministracion.edNroPreacuerdoDesdeChange(Sender: TObject);
begin
  edNroPreacuerdoHasta.Value := edNroPreacuerdoDesde.Value;
end;

procedure TfrmValAdministracion.tbEnvioLegalesClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, nil, 'Debe seleccionar solo una fila de la grilla.');

  if fpEnvioLegales.ShowModal = mrOk then
    sdqConsulta.Refresh;
end;

procedure TfrmValAdministracion.btnEnvioLegalesAceptarClick(Sender: TObject);
begin
  if IsDatosValidosEnviosLegales() then
    begin
      with TSql.Create('ZVA_VALOR') do
        try
          PrimaryKey.Add('VA_ID',           sdqConsulta.FieldByName('IDVALOR').AsInteger);
          Fields.Add('VA_FECHALEGALES',     edFechaLegales.Date);
          Fields.Add('VA_OBSERVACIONES',    Trim(edObservLegales.Lines.Text));
          Fields.Add('VA_USUMODIF',         Sesion.UserId);
          Fields.Add('VA_FECHAMODIF',       exDateTime);

          SqlType := stUpdate;

          EjecutarSql( Sql );
        finally
          Free;
        end;

      MsgBox('Envío a legales efectuado correctamente.', MB_OK + MB_ICONINFORMATION);

      fpEnvioLegales.ModalResult := mrOk;
    end;
end;

function TfrmValAdministracion.IsDatosValidosEnviosLegales: Boolean;
begin
  Verificar(edFechaLegales.IsEmpty, edFechaLegales, 'Debe ingresar la fecha de envío a legales.');

  Result := True;
end;

procedure TfrmValAdministracion.DoImprimirNoticiacionRechazo(IdValor: TTableId);
begin
  with TfrmNotificacionRechazo.Create(Self) do
    try
      ImprimirNoticacionRechazo(IdValor);
    finally
      Free;
    end;
end;

procedure TfrmValAdministracion.mnuImprimirNotificacionRechazoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, nil, 'Debe seleccionar solo una fila de la grilla.');
  Verificar(sdqConsulta.FieldByName('FECHA_DE_RECHAZO').IsNull, nil, 'El cheque no se encuentra rechazado.');

  DoImprimirNoticiacionRechazo(sdqConsulta.FieldByName('IDVALOR').AsInteger)
end;

end.

