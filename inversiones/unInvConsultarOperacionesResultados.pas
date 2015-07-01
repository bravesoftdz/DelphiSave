unit unInvConsultarOperacionesResultados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  StdCtrls, Mask, ToolEdit, DateComboBox, RxToolEdit, RxPlacemnt;

type
  TfrmInvConsultarOperacionesResultados = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbDenominacion: TGroupBox;
    fraDenominacion: TfraCodigoDescripcion;
    gbVencimiento: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    pgGrillas: TPageControl;
    tsOperaciones: TTabSheet;
    tsResultados: TTabSheet;
    GridResultados: TArtDBGrid;
    sdqResultados: TSDQuery;
    dsResultados: TDataSource;
    SortDialogResultados: TSortDialog;
    gbCodCajaValores: TGroupBox;
    edCodCajaVal: TEdit;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbMarcarContabilizados: TToolButton;
    rgContabilizados: TRadioGroup;
    tsTenencia: TTabSheet;
    SortDialogTenencia: TSortDialog;
    sdqTenencia: TSDQuery;
    dsTenencia: TDataSource;
    GridTenencia: TArtDBGrid;
    tbSumatoria: TToolButton;
    ToolButton7: TToolButton;
    chkDecimales: TCheckBox;
    tbConfirmar: TToolButton;
    rgConfirmados: TRadioGroup;
    tsPlazosFijos: TTabSheet;
    GridPlazosFijos: TArtDBGrid;
    sdqPlazosFijos: TSDQuery;
    dsPlazosFijos: TDataSource;
    SortDialogPlazosFijos: TSortDialog;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqResultadosAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure pgGrillasChange(Sender: TObject);
    procedure fraTipoInstrumentoChange(Sender: TObject);
    procedure fraTipoInstrumentoedCodigoChange(Sender: TObject);
    procedure tbMarcarContabilizadosClick(Sender: TObject);
    procedure sdqTenenciaAfterOpen(DataSet: TDataSet);
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridResultadosPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridTenenciaPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridPlazosFijosPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure chkDecimalesClick(Sender: TObject);
    procedure tbConfirmarClick(Sender: TObject);
    procedure sdqPlazosFijosAfterOpen(DataSet: TDataSet);
  private
    pbRefrescado, pbDecimalesOper, pbDecimalesRes, pbDecimalesTen, pbDecimalesPlFijo: Boolean;
    procedure DoSetearGrillaActual;
    function ValidarContabilizados(Grilla: TArtDBGrid): Boolean;
    function ValidarConfirmados(Grilla: TArtDBGrid): Boolean;
    procedure CalcTotales;
  public
  protected
    procedure RefreshData; override;
    procedure ClearData; override;
  end;

var
  frmInvConsultarOperacionesResultados: TfrmInvConsultarOperacionesResultados;
  TotalConsulta: Array of Extended;
  TotalConsultaRes: Array of Extended;
  TotalConsultaTen: Array of Extended;
  TotalConsultaPlFijo: Array of Extended;

const
  PAGEOPERACIONES = 0;    // tsOperaciones
  PAGERESULTADOS  = 1;    // tsResultados
  PAGETENENCIA    = 2;    // tsTenencia
  PAGEPLAZOSFIJOS = 3;    // tsPlazosFijos

  MAXCOLS = 6;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('PRECIO', 'MONTO', 'NOMINAL', 'RESIDUAL', 'ARANCEL', 'IMPORTE_CONTABLE', 'RESULTADO');

  MAXCOLSRES = 8;
  CAMPOS_SUMARES: Array[0..MAXCOLSRES] of String = ('ARANCEL', 'NETO', 'AMORTIZACION', 'INTERES', 'IMPORTE', 'IMPORTE_CONTABLE', 'RESULTADO', 'RESIDUAL_COBRADO', 'RETGANANCIAS');

  MAXCOLSTEN = 9;
  CAMPOS_SUMATEN: Array[0..MAXCOLSTEN] of String = ('NOMINAL', 'COTIZACION', 'VALUACION_PEPS', 'VALUACION_CIERRE', 'RXT', 'INTERES_DEVENGADO', 'REGULARIZADORA', 'VALUACION_CONTABLE', 'MONEDA', 'RESIDUAL');

  MAXCOLSTPLFIJO = 3;
  CAMPOS_SUMAPLFIJO: Array[0..MAXCOLSTPLFIJO] of String = ('CAPITAL', 'INTERES', 'IMPUESTO', 'MONTO');

implementation

uses
  unDmPrincipal, AnsiSql, unSesion, unArt, CustomDlgs, StrFuncs, General, DbFuncs, DateTimeFuncs,
  unInvRptAsientosContabilizar, unTesoreria, unInversiones;

{$R *.dfm}

procedure TfrmInvConsultarOperacionesResultados.chkDecimalesClick(Sender: TObject);
begin
  pbDecimalesOper   := True;
  pbDecimalesRes    := True;
  pbDecimalesTen    := True;
  pbDecimalesPlFijo := True;

  if pbRefrescado then
    begin
      sdqConsulta.AfterOpen(nil);
      sdqResultados.AfterOpen(nil);
      sdqTenencia.AfterOpen(nil);
      sdqPlazosFijos.AfterOpen(nil);
    end;
end;

procedure TfrmInvConsultarOperacionesResultados.ClearData;
begin
  fraTipoInstrumento.Clear;
  fraDenominacion.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  edCodCajaVal.Clear;
  rgContabilizados.ItemIndex := 2;  // todos
  rgConfirmados.ItemIndex    := 2;  // todos
  chkDecimales.Checked       := False;

  sdqConsulta.SQL.Text   := '';
  sdqResultados.SQL.Text := '';
  sdqResultados.Close;

  pgGrillas.ActivePageIndex := PAGEOPERACIONES;

  DoSetearGrillaActual;

  inherited;
end;

procedure TfrmInvConsultarOperacionesResultados.RefreshData;
var
  sCampoContabiliz, sCampoFContable, sConsulta, sSql, sWhere: String;
  SortDialogAct: TSortDialog;
  bSolapaPlazosFijos, bSolapaResultados, bSolapaOperaciones: Boolean;
begin
  pbRefrescado := True;

  DoSetearGrillaActual;
  SortDialogAct      := nil;
  bSolapaOperaciones := (pgGrillas.ActivePageIndex = PAGEOPERACIONES);
  bSolapaResultados  := (pgGrillas.ActivePageIndex = PAGERESULTADOS);
  bSolapaPlazosFijos := (pgGrillas.ActivePageIndex = PAGEPLAZOSFIJOS);

  case pgGrillas.ActivePageIndex of
    PAGEOPERACIONES:
      begin
        SortDialogAct := SortDialog;

        sSql := 'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_DESCRIPCION INSTRUMENTO, TO_DESCRIPCION OPERACION, OI_FECHA FECHA, ' +
                       'OI_IMPORTENOMINAL NOMINAL, OI_IMPORTERESIDUAL RESIDUAL, OI_PRECIO PRECIO, OI_ARANCEL ARANCEL, OI_MONTO MONTO, ' +
                       'BA_NOMBRE BANCO, ZCB.CB_NUMERO CUENTA, RCB.CB_DESCRIPCION PLAZO_LIQUIDACION, OI_FECHACUSTODIA FECHA_CUSTODIA, ' +
                       'IN_CODCAJAVALORES CODCAJAVALORES, OI_FECHACONTABLE FECHA_CONTABLE, OI_ID ID, ' +
                       'ART.INVERSION.GET_COSTOOPERACION(OI_ID) IMPORTE_CONTABLE, TI_ID, IN_CODIGOSSN CODIGO_SSN, ' +
                       'CASE WHEN TO_SIGNO = -1 THEN NVL(OI_MONTO, 0)-ART.INVERSION.GET_COSTOOPERACION(OI_ID) END RESULTADO, ' +
                       'DECODE(OI_CONTABILIZADO, NULL, ''N'', ''S'') CONTABILIZADO, OI_CONTABILIZADO CONTABILIZ ' +
                  'FROM RCB_CLEARINGBANCARIO RCB, ZBA_BANCO, ZCB_CUENTABANCARIA ZCB, NTO_TIPOOPERACION, NOI_OPERACIONINSTRUMENTO, ' +
                       'NIN_INSTRUMENTO, NTI_TIPOINSTRUMENTO ' +
                 'WHERE TO_ID = OI_IDTIPOOPERACION ' +
                   'AND BA_ID(+) = CB_IDBANCO ' +
                   'AND ZCB.CB_ID(+) = OI_IDCUENTABANCARIA ' +
                   'AND RCB.CB_ID(+) = OI_PLAZOLIQUIDACION ' +
                   'AND IN_ID = OI_IDINSTRUMENTO ' +
                   'AND TI_ID = IN_IDTIPOINSTRUMENTO ' +
                   'AND TI_PLAZOFIJO = ''N'' ' +
                   'AND OI_FECHABAJA IS NULL ' +
                   'AND IN_FECHABAJA IS NULL';

        sWhere := SqlBetweenDateTime(' AND OI_FECHA', edFechaDesde.Date, edFechaHasta.Date);
      end;

    PAGERESULTADOS:
      begin
        SortDialogAct := SortDialogResultados;

        sSql := 'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_DESCRIPCION INSTRUMENTO, ''COBRO CUPON'' TIPO, CU_FECHACOBRADO FECHA, CU_NUMERO CUPON, ' +
                       'CU_VENCIMIENTO VENCIMIENTO, CU_INTERESCOBRADO INTERES, CU_AMORTIZACIONCOBRADA AMORTIZACION, ' +
                       'CU_AMORTIZACIONCOBRADA + CU_INTERESCOBRADO IMPORTE, CU_ARANCEL ARANCEL, ' +
                       'CU_AMORTIZACIONCOBRADA + CU_INTERESCOBRADO - CU_ARANCEL - NVL(CU_RETGANANCIAS, 0) NETO, BA_NOMBRE BANCO, CB_NUMERO CUENTA, ' +
                       'IN_CODCAJAVALORES CODCAJAVALORES, CU_FECHACONTABLE FECHA_CONTABLE, IN_CODIGOSSN CODIGO_SSN, ' +
                       'ART.INVERSION.GET_COSTOCOBROCUPON(CU_ID) * NVL(ART.INVERSION.GET_COTIZACIONMONEDA(IN_IDMONEDA, LAST_DAY(ADD_MONTHS(CU_FECHACOBRADO, -1))), 1) IMPORTE_CONTABLE, ' +
                       'CU_AMORTIZACIONCOBRADA-(ART.INVERSION.GET_COSTOCOBROCUPON(CU_ID) * NVL(ART.INVERSION.GET_COTIZACIONMONEDA(IN_IDMONEDA, LAST_DAY(ADD_MONTHS(CU_FECHACOBRADO, -1))), 1)) RESULTADO, ' +
                       'CU_RESIDUAL RESIDUAL_COBRADO, CU_ID ID, NVL(CU_RETGANANCIAS, 0) RETGANANCIAS, TI_ID, CU_CONTABILIZADO CONTABILIZ ' +
                  'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, NIN_INSTRUMENTO, NCU_CUPON, NTI_TIPOINSTRUMENTO ' +
                 'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
                   'AND IN_ID = CU_IDINSTRUMENTO ' +
                   'AND BA_ID(+) = CB_IDBANCO ' +
                   'AND CB_ID(+) = CU_IDCUENTABANCARIA ' +
                   'AND CU_FECHABAJA IS NULL ' +
                   'AND IN_FECHABAJA IS NULL ' +
                   'AND CU_FECHACOBRADO IS NOT NULL';

        sWhere := SqlBetweenDateTime(' AND CU_FECHACOBRADO', edFechaDesde.Date, edFechaHasta.Date);
      end;

    PAGETENENCIA:
      begin
        SortDialogAct := SortDialogTenencia;

        sSql := 'SELECT CODIGO, TIPO_INSTRUMENTO, DENOMINACION, CODCAJAVALORES, VENCIMIENTO, NOMINAL, RESIDUAL, COTIZACION, ' +
                       'VALUACION_PEPS, RESIDUAL * COTIZACION * MONEDA VALUACION_CIERRE, (RESIDUAL * COTIZACION * MONEDA) - VALUACION_PEPS RXT, ' +
                       'INTERES_DEVENGADO, 0 REGULARIZADORA, (RESIDUAL * COTIZACION * MONEDA) + INTERES_DEVENGADO VALUACION_CONTABLE, ' +
                       'TI_ID, IN_ID, IN_CODCAJAVALORES, MONEDA, CODIGO_SSN ' +
                  'FROM (SELECT IN_ID CODIGO, TI_DESCRIPCION TIPO_INSTRUMENTO, IN_DESCRIPCION DENOMINACION, ' +
                               'IN_CODCAJAVALORES CODCAJAVALORES, IN_VENCIMIENTO VENCIMIENTO, ' +
                               'ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID, NVL(' + SqlValue(edFechaHasta.Date) + ', TRUNC(SYSDATE))) NOMINAL, ' +
                               'ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID, NVL(' + SqlValue(edFechaHasta.Date) + ', TRUNC(SYSDATE))) RESIDUAL, ' +
                               'NVL(ART.INVERSION.GET_COTIZACIONINSTRUMENTO(IN_ID, NVL(' + SqlValue(edFechaHasta.Date) + ', TRUNC(SYSDATE))), 1) COTIZACION, ' +
                               'NVL(ART.INVERSION.GET_COTIZACIONMONEDA(IN_IDMONEDA, NVL(' + SqlValue(edFechaHasta.Date) + ', TRUNC(SYSDATE))), 1) MONEDA, ' +
                               'ART.INVERSION.GET_RDOXTENENCIA(IN_ID, NVL(' + SqlValue(edFechaHasta.Date) + ', TRUNC(SYSDATE)), ''V'') VALUACION_PEPS, ' +
                               'NVL(ART.INVERSION.GET_INTERESDEVENGADO(IN_ID, NVL(' + SqlValue(edFechaHasta.Date) + ', TRUNC(SYSDATE))), 0) INTERES_DEVENGADO, ' +
                               'TI_ID, IN_ID, IN_CODCAJAVALORES, IN_CODIGOSSN CODIGO_SSN ' +
                          'FROM NTI_TIPOINSTRUMENTO, NIN_INSTRUMENTO ' +
                         'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
                           'AND TI_PLAZOFIJO = ''N'' ' +
                           'AND IN_FECHABAJA IS NULL) ' +
                 'WHERE 1 = 1';

        if not edFechaHasta.IsEmpty then
          sWhere := sWhere + ' AND ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID, ' + SqlValue(edFechaHasta.Date) + ') > 0';
      end;

    PAGEPLAZOSFIJOS:
      begin
        SortDialogAct := SortDialogPlazosFijos;

        sSql := 'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_CODCAJAVALORES CERTIFICADO, NS_NOMBRE INSTITUCION, IN_CONSTITUCION CONSTITUCION, ' +
                       'ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) CAPITAL, IN_TASA TASA, IN_PLAZO PLAZO, IN_VENCIMIENTO VENCIMIENTO, ' +
                       'ROUND(ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) * IN_TASA / 100 * IN_PLAZO / 365, 2) INTERES, 0 IMPUESTO, ' +
                       'ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) + ROUND(ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) * IN_TASA / 100 * IN_PLAZO / 365, 2) MONTO, ' +
                       'TO_DESCRIPCION OPERACION, OI_FECHA FECHA, DECODE(OI_CONTABILIZADO, NULL, ''N'', ''S'') CONTABILIZADO, ' +
                       'OI_CONTABILIZADO CONTABILIZ, OI_FECHACONTABLE FECHA_CONTABLE, OI_ID ID, TI_ID ' +
                  'FROM RCB_CLEARINGBANCARIO RCB, ZBA_BANCO, ZCB_CUENTABANCARIA ZCB, NTO_TIPOOPERACION, NOI_OPERACIONINSTRUMENTO, ' +
                       'NIN_INSTRUMENTO, NTI_TIPOINSTRUMENTO, NNS_INSTITUCION ' +
                'WHERE TO_ID = OI_IDTIPOOPERACION ' +
                   'AND BA_ID(+) = CB_IDBANCO ' +
                   'AND ZCB.CB_ID(+) = OI_IDCUENTABANCARIA ' +
                   'AND RCB.CB_ID(+) = OI_PLAZOLIQUIDACION ' +
                   'AND IN_ID = OI_IDINSTRUMENTO ' +
                   'AND TI_ID = IN_IDTIPOINSTRUMENTO ' +
                   'AND NS_ID = IN_IDINSTITUCION ' +
                   'AND OI_FECHABAJA IS NULL ' +
                   'AND IN_FECHABAJA IS NULL ' +
                   'AND TI_PLAZOFIJO = ''S''';

        sWhere := SqlBetweenDateTime(' AND OI_FECHA', edFechaDesde.Date, edFechaHasta.Date);
      end;
  end;

  if fraTipoInstrumento.IsSelected then
    sWhere := sWhere + ' AND TI_ID = ' + SqlValue(fraTipoInstrumento.Value);

  if fraDenominacion.IsSelected then
    sWhere := sWhere + ' AND IN_ID = ' + SqlValue(fraDenominacion.Value);

  if not IsEmptyString(edCodCajaVal.Text) then
    sWhere := sWhere + ' AND IN_CODCAJAVALORES = ' + SqlValue(Trim(edCodCajaVal.Text));

  if bSolapaOperaciones or bSolapaResultados or bSolapaPlazosFijos then
    begin
      if bSolapaOperaciones or bSolapaPlazosFijos then
        sCampoFContable := 'OI_FECHACONTABLE'
      else
        sCampoFContable := 'CU_FECHACONTABLE';

      case rgContabilizados.ItemIndex of
        0: sWhere := sWhere + ' AND ' + sCampoFContable + ' IS NOT NULL';
        1: sWhere := sWhere + ' AND ' + sCampoFContable + ' IS NULL';
      end;
    end;

  if bSolapaOperaciones or bSolapaResultados or bSolapaPlazosFijos then
    begin
      if bSolapaOperaciones or bSolapaPlazosFijos then
        sCampoContabiliz := 'OI_CONTABILIZADO'
      else
        sCampoContabiliz := 'CU_CONTABILIZADO';

      case rgConfirmados.ItemIndex of
        0: sWhere := sWhere + ' AND ' + sCampoContabiliz + ' IS NOT NULL';
        1: sWhere := sWhere + ' AND ' + sCampoContabiliz + ' IS NULL';
      end;
    end;

  sConsulta := sSql + sWhere + SortDialogAct.OrderBy;
  if (Trim(sConsulta) <> Trim(ReplaceEnter(TSDQuery(DataSource.Dataset).Sql.Text))) or pbDecimalesOper or pbDecimalesRes or pbDecimalesTen or pbDecimalesPlFijo then
    begin
      case pgGrillas.ActivePageIndex of
        PAGEOPERACIONES:
          pbDecimalesOper := False;

        PAGERESULTADOS:
          pbDecimalesRes := False;

        PAGETENENCIA:
          pbDecimalesTen := False;

        PAGEPLAZOSFIJOS:
          pbDecimalesPlFijo := False;
      end;

      TSDQuery(DataSource.Dataset).Sql.Text := sConsulta;
      inherited;
      CalcTotales;
    end;
end;

procedure TfrmInvConsultarOperacionesResultados.FormCreate(Sender: TObject);
begin
  pbRefrescado      := False;
  pbDecimalesOper   := False;
  pbDecimalesRes    := False;
  pbDecimalesTen    := False;
  pbDecimalesPlFijo := False;

  SetLength(TotalConsulta, MAXCOLS + 1);
  SetLength(TotalConsultaRes, MAXCOLSRES + 1);
  SetLength(TotalConsultaTen, MAXCOLSTEN + 1);
  SetLength(TotalConsultaPlFijo, MAXCOLSTPLFIJO + 1);

  with fraTipoInstrumento do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ShowBajas   := True;
      OnChange    := fraTipoInstrumentoChange;
    end;

  with fraDenominacion do
    begin
      TableName   := 'NIN_INSTRUMENTO';
      FieldID     := 'IN_ID';
      FieldCodigo := 'IN_ID';
      FieldDesc   := 'IN_DESCRIPCION';
      FieldBaja   := 'IN_FECHABAJA';
      ShowBajas   := True;
    end;

  Grid.Parent          := tsOperaciones;
  pgGrillas.ActivePage := tsOperaciones;

  SortDialog.UseFieldIndex           := False;
  SortDialogResultados.UseFieldIndex := False;

  SortDialogResultados.DataSet := sdqResultados;

  inherited;

  unArt.LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
  unArt.LoadDynamicSortFields(SortDialogResultados.SortFields, GridResultados.Columns);
  unArt.LoadDynamicSortFields(SortDialogTenencia.SortFields, GridTenencia.Columns);
  unArt.LoadDynamicSortFields(SortDialogPlazosFijos.SortFields, GridPlazosFijos.Columns);
end;

procedure TfrmInvConsultarOperacionesResultados.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.Active then
    begin
      if sdqConsulta.FieldByName('PRECIO') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqConsulta.FieldByName('PRECIO')).Currency := True
        else
          TFloatField(sdqConsulta.FieldByName('PRECIO')).DisplayFormat := '$ #,##0.0000000000;-$ #,##0.0000000000';

      if sdqConsulta.FieldByName('MONTO') is TFloatField then
        TFloatField(sdqConsulta.FieldByName('MONTO')).Currency := True;

      if sdqConsulta.FieldByName('NOMINAL') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqConsulta.FieldByName('NOMINAL')).Currency := True
        else
          TFloatField(sdqConsulta.FieldByName('NOMINAL')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqConsulta.FieldByName('RESIDUAL') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqConsulta.FieldByName('RESIDUAL')).Currency := True
        else
          TFloatField(sdqConsulta.FieldByName('RESIDUAL')).DisplayFormat := '$ #,##0.0000000000;-$ #,##0.0000000000';

      if sdqConsulta.FieldByName('ARANCEL') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqConsulta.FieldByName('ARANCEL')).Currency := True
        else
          TFloatField(sdqConsulta.FieldByName('ARANCEL')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqConsulta.FieldByName('IMPORTE_CONTABLE') is TFloatField then
        TFloatField(sdqConsulta.FieldByName('IMPORTE_CONTABLE')).Currency := True;

      if sdqConsulta.FieldByName('RESULTADO') is TFloatField then
        TFloatField(sdqConsulta.FieldByName('RESULTADO')).Currency := True;
    end;

  inherited;
end;

procedure TfrmInvConsultarOperacionesResultados.sdqPlazosFijosAfterOpen(DataSet: TDataSet);
begin
  if sdqPlazosFijos.Active then
    begin
      if sdqPlazosFijos.FieldByName('CAPITAL') is TFloatField then
        TFloatField(sdqPlazosFijos.FieldByName('CAPITAL')).Currency := True;

      if sdqPlazosFijos.FieldByName('INTERES') is TFloatField then
        TFloatField(sdqPlazosFijos.FieldByName('INTERES')).Currency := True;

      if sdqPlazosFijos.FieldByName('IMPUESTO') is TFloatField then
        TFloatField(sdqPlazosFijos.FieldByName('IMPUESTO')).Currency := True;

      if sdqPlazosFijos.FieldByName('MONTO') is TFloatField then
        TFloatField(sdqPlazosFijos.FieldByName('MONTO')).Currency := True;

      if sdqPlazosFijos.FieldByName('TASA') is TFloatField then
        TFloatField(sdqPlazosFijos.FieldByName('TASA')).DisplayFormat := '% 0.000;-% 0.000';
    end;

  inherited;
end;

procedure TfrmInvConsultarOperacionesResultados.sdqResultadosAfterOpen(DataSet: TDataSet);
begin
  if sdqResultados.Active then
    begin
      if sdqResultados.FieldByName('ARANCEL') is TFloatField then
        TFloatField(sdqResultados.FieldByName('ARANCEL')).Currency := True;

      if sdqResultados.FieldByName('NETO') is TFloatField then
        TFloatField(sdqResultados.FieldByName('NETO')).Currency := True;

      if sdqResultados.FieldByName('AMORTIZACION') is TFloatField then
        TFloatField(sdqResultados.FieldByName('AMORTIZACION')).Currency := True;

      if sdqResultados.FieldByName('INTERES') is TFloatField then
        TFloatField(sdqResultados.FieldByName('INTERES')).Currency := True;

      if sdqResultados.FieldByName('IMPORTE') is TFloatField then
        TFloatField(sdqResultados.FieldByName('IMPORTE')).Currency := True;

      if sdqResultados.FieldByName('IMPORTE_CONTABLE') is TFloatField then
        TFloatField(sdqResultados.FieldByName('IMPORTE_CONTABLE')).Currency := True;

      if sdqResultados.FieldByName('RESULTADO') is TFloatField then
        TFloatField(sdqResultados.FieldByName('RESULTADO')).Currency := True;;

      if sdqResultados.FieldByName('RESIDUAL_COBRADO') is TFloatField then
        TFloatField(sdqResultados.FieldByName('RESIDUAL_COBRADO')).Currency := True;;

      if sdqResultados.FieldByName('RETGANANCIAS') is TFloatField then
        TFloatField(sdqResultados.FieldByName('RETGANANCIAS')).Currency := True;
    end;

  inherited;
end;

procedure TfrmInvConsultarOperacionesResultados.sdqTenenciaAfterOpen(DataSet: TDataSet);
begin
  if sdqTenencia.Active then
    begin
      if sdqTenencia.FieldByName('NOMINAL') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqTenencia.FieldByName('NOMINAL')).Currency := True
        else
          TFloatField(sdqTenencia.FieldByName('NOMINAL')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqTenencia.FieldByName('COTIZACION') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqTenencia.FieldByName('COTIZACION')).Currency := True
        else
          TFloatField(sdqTenencia.FieldByName('COTIZACION')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqTenencia.FieldByName('VALUACION_PEPS') is TFloatField then
        TFloatField(sdqTenencia.FieldByName('VALUACION_PEPS')).Currency := True;

      if sdqTenencia.FieldByName('VALUACION_CIERRE') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqTenencia.FieldByName('VALUACION_CIERRE')).Currency := True
        else
          TFloatField(sdqTenencia.FieldByName('VALUACION_CIERRE')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqTenencia.FieldByName('RXT') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqTenencia.FieldByName('RXT')).Currency := True
        else
          TFloatField(sdqTenencia.FieldByName('RXT')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqTenencia.FieldByName('INTERES_DEVENGADO') is TFloatField then
        TFloatField(sdqTenencia.FieldByName('INTERES_DEVENGADO')).Currency := True;

      if sdqTenencia.FieldByName('REGULARIZADORA') is TFloatField then
        TFloatField(sdqTenencia.FieldByName('REGULARIZADORA')).Currency := True;

      if sdqTenencia.FieldByName('VALUACION_CONTABLE') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqTenencia.FieldByName('VALUACION_CONTABLE')).Currency := True
        else
          TFloatField(sdqTenencia.FieldByName('VALUACION_CONTABLE')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqTenencia.FieldByName('MONEDA') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqTenencia.FieldByName('MONEDA')).Currency := True
        else
          TFloatField(sdqTenencia.FieldByName('MONEDA')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

      if sdqTenencia.FieldByName('RESIDUAL') is TFloatField then
        if chkDecimales.Checked then
          TFloatField(sdqTenencia.FieldByName('RESIDUAL')).Currency := True
        else
          TFloatField(sdqTenencia.FieldByName('RESIDUAL')).DisplayFormat := '$ #,##0.000;-$ #,##0.000';
    end;

  inherited;
end;

procedure TfrmInvConsultarOperacionesResultados.tbOrdenarClick(Sender: TObject);
begin
  case pgGrillas.ActivePageIndex of
    PAGEOPERACIONES:
      SortDialog.Execute;

    PAGERESULTADOS:
      SortDialogResultados.Execute;

    PAGETENENCIA:
      SortDialogTenencia.Execute;

    PAGEPLAZOSFIJOS:
      SortDialogPlazosFijos.Execute;
  end;

  RefreshData;
end;

procedure TfrmInvConsultarOperacionesResultados.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

function TfrmInvConsultarOperacionesResultados.ValidarConfirmados(Grilla: TArtDBGrid): Boolean;
var
  i: Integer;
begin
  Verificar((pgGrillas.ActivePageIndex <> PAGEOPERACIONES) and (pgGrillas.ActivePageIndex <> PAGERESULTADOS) and (pgGrillas.ActivePageIndex <> PAGEPLAZOSFIJOS), nil, 'Debe estar posicionado en la grilla de Operaciones, de Resultados o de Plazos Fijos.');
  Verificar(Grilla.SelectedRows.Count = 0, Grilla, 'No existen registros seleccionados en la grilla.');

  with Grilla.DataSource.DataSet do
    begin
      DisableControls;
      try
        for i := 0 to Grilla.SelectedRows.Count - 1 do
          begin
            GotoBookmark(pointer(Grilla.SelectedRows.Items[i]));

            Verificar(not sdqConsulta.FieldByName('CONTABILIZ').IsNull, nil, 'Alguno de los registros seleccionados ya se encuentra confirmado.');
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;

procedure TfrmInvConsultarOperacionesResultados.tbConfirmarClick(Sender: TObject);
var
  sTipo: String;
  i: Integer;
begin
  if ValidarConfirmados(TArtDbGrid(DBGrid)) then
    begin
      if MsgBox('¿Confirma los registros seleccionados?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
        with DataSource.DataSet do
          begin
            case pgGrillas.ActivePageIndex of
              PAGEOPERACIONES:
                sTipo := 'O';
              PAGERESULTADOS:
                sTipo := 'R';
              PAGEPLAZOSFIJOS:
                sTipo := 'P';
            end;

            DisableControls;
            try
              BeginTrans;
              try
                for i := 0 to DBGrid.SelectedRows.Count - 1 do
                  begin
                    GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));

                    Do_ConfirmarOperacion(FieldByName('ID').AsInteger, sTipo);
                  end;

                CommitTrans;

                MsgBox('Registros confirmados correctamente.', MB_ICONINFORMATION);
                TArtDBGrid(DBGrid).UnselectAll;

                TSDQuery(Self.DataSource.Dataset).Close;
                TSDQuery(Self.DataSource.Dataset).Sql.Clear;
                RefreshData;
              except
                on E: Exception do
                  begin
                    RollBack;
                    MessageDlg('Se produjo un error al marcar los registros como confirmados. ' + E.Message, mtError, [mbOK], 0);
                  end;
              end;
            finally
              EnableControls;
            end;
          end;
    end;
end;

procedure TfrmInvConsultarOperacionesResultados.tbImprimirClick(Sender: TObject);
var
  sTitulo: String;
begin
  case pgGrillas.ActivePageIndex of
    PAGEOPERACIONES:
      sTitulo := 'Operaciones';

    PAGERESULTADOS:
      sTitulo := 'Resultados';

    PAGETENENCIA:
      sTitulo := 'Tenencia';

    PAGEPLAZOSFIJOS:
      sTitulo := 'Plazos Fijos';
  end;

  DBPrint.Title.Text := sTitulo;
  inherited;
end;

procedure TfrmInvConsultarOperacionesResultados.DoSetearGrillaActual;
begin
  case pgGrillas.ActivePageIndex of
    PAGEOPERACIONES:
      begin
        DBGrid     := Grid;
        DataSource := dsConsulta;

        if Assigned(sdqConsulta.AfterOpen) then
          sdqConsulta.AfterOpen := sdqConsultaAfterOpen;
      end;

    PAGERESULTADOS:
      begin
        DBGrid     := GridResultados;
        DataSource := dsResultados;
      end;

    PAGETENENCIA:
      begin
        DBGrid     := GridTenencia;
        DataSource := dsTenencia;
      end;

    PAGEPLAZOSFIJOS:
      begin
        DBGrid     := GridPlazosFijos;
        DataSource := dsPlazosFijos;
      end;
  end;
end;

procedure TfrmInvConsultarOperacionesResultados.pgGrillasChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmInvConsultarOperacionesResultados.fraTipoInstrumentoChange(Sender: TObject);
var
  sExtraCond: String;
begin
  with fraDenominacion do
    if fraTipoInstrumento.IsSelected then
      begin
        sExtraCond := ' AND IN_IDTIPOINSTRUMENTO = ' + SqlValue(fraTipoInstrumento.Value);
        if sExtraCond <> ExtraCondition then
          begin
            ExtraCondition := sExtraCond;
            Clear;
          end;
      end
    else
      begin
        Clear;
        ExtraCondition := '';
      end;
end;

procedure TfrmInvConsultarOperacionesResultados.fraTipoInstrumentoedCodigoChange(Sender: TObject);
begin
  if fraTipoInstrumento.edCodigo.Text = '' then
    fraTipoInstrumentoChange(Sender);
end;

procedure TfrmInvConsultarOperacionesResultados.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    begin
      if chkDecimales.Checked then
        iCantDec := 2
      else if AreIn(CAMPOS_SUMA[iPos], ['PRECIO', 'RESIDUAL']) then
        iCantDec := 10
      else if AreIn(CAMPOS_SUMA[iPos], ['NOMINAL', 'ARANCEL']) then
        iCantDec := 6
      else
        iCantDec := 2;

      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$', iCantDec, False, False, 'I', True);
    end;
end;

procedure TfrmInvConsultarOperacionesResultados.GridPlazosFijosPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMAPLFIJO);
  if (iPos > -1) and (iPos <= MAXCOLSTPLFIJO) then
    begin
      iCantDec := 2;
      Value    := Get_AjusteDecimales(FloatToStr(TotalConsultaPlFijo[iPos]), '$', iCantDec, False, False, 'I', True);
    end;
end;

procedure TfrmInvConsultarOperacionesResultados.GridResultadosPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMARES);
  if (iPos > -1) and (iPos <= MAXCOLSRES) then
    begin
     iCantDec := 2;
     Value    := Get_AjusteDecimales(FloatToStr(TotalConsultaRes[iPos]), '$', iCantDec, False, False, 'I', True);
    end;
end;

procedure TfrmInvConsultarOperacionesResultados.GridTenenciaPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMATEN);
  if (iPos > -1) and (iPos <= MAXCOLSTEN) then
    begin
      if chkDecimales.Checked then
        iCantDec := 2
      else if AreIn(CAMPOS_SUMATEN[iPos], ['NOMINAL', 'COTIZACION', 'VALUACION_CIERRE', 'RXT', 'VALUACION_CONTABLE', 'MONEDA']) then
        iCantDec := 6
      else if AreIn(CAMPOS_SUMATEN[iPos], ['RESIDUAL']) then
        iCantDec := 3
      else
        iCantDec := 2;

      Value := Get_AjusteDecimales(FloatToStr(TotalConsultaTen[iPos]), '$', iCantDec, False, False, 'I', True);
    end;
end;

function TfrmInvConsultarOperacionesResultados.ValidarContabilizados(Grilla: TArtDBGrid): Boolean;
var
  i: Integer;
begin
  Verificar((pgGrillas.ActivePageIndex <> PAGEOPERACIONES) and (pgGrillas.ActivePageIndex <> PAGERESULTADOS) and (pgGrillas.ActivePageIndex <> PAGEPLAZOSFIJOS), nil, 'Debe estar posicionado en la grilla de Operaciones, de Resultados o de Plazos Fijos.');
  Verificar(Grilla.SelectedRows.Count = 0, Grilla, 'No existen registros seleccionados en la grilla.');

  with Grilla.DataSource.DataSet do
    begin
      DisableControls;
      try
        for i := 0 to Grilla.SelectedRows.Count - 1 do
          begin
            GotoBookmark(pointer(Grilla.SelectedRows.Items[i]));

            Verificar(not FieldByName('FECHA_CONTABLE').IsNull, nil, 'Alguno de los registros seleccionados ya tiene fecha contable.');
            Verificar(FieldByName('CONTABILIZ').IsNull, nil, 'Alguno de los registros seleccionados no se encuentra confirmado.');
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;

procedure TfrmInvConsultarOperacionesResultados.tbMarcarContabilizadosClick(Sender: TObject);
var
  i: Integer;
  sSqlFecha, sSql: String;
  Id: TTableId;
  Fecha: TDateTime;
begin
  if ValidarContabilizados(TArtDbGrid(DBGrid)) then
    begin
      Fecha := InputBoxDate('Marcar Contabilizados', 'Fecha:', 0);

      if Fecha > 0 then
        begin
          if MsgBox('¿Confirma marcar como contabilizados los registros seleccionados?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
            with DataSource.DataSet do
              begin
                case pgGrillas.ActivePageIndex of
                  PAGEOPERACIONES, PAGEPLAZOSFIJOS:
                    sSql := 'UPDATE NOI_OPERACIONINSTRUMENTO ' +
                               'SET OI_FECHACONTABLE = :Fecha, ' +
                                   'OI_CONTABILIZADO = ''P'', ' +
                                   'OI_FECHACONTABILIZADO = SYSDATE, ' +
                                   'OI_USUCONTABILIZADO = :Usuario ' +
                             'WHERE OI_ID = :Id';

                  PAGERESULTADOS:
                    sSql := 'UPDATE NCU_CUPON ' +
                               'SET CU_FECHACONTABLE = :Fecha, ' +
                                   'CU_CONTABILIZADO = ''P'', ' +
                                   'CU_FECHACONTABILIZADO = SYSDATE, ' +
                                   'CU_USUCONTABILIZADO = :Usuario ' +
                             'WHERE CU_ID = :Id';
                end;

                DisableControls;
                try
                  BeginTrans;
                  try
                    sSqlFecha := 'INVERSION.IS_FECHACONTABLEVALIDA(:Fecha, :IdTipoInstrumento)';

                    for i := 0 to DBGrid.SelectedRows.Count - 1 do
                      begin
                        GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
                        Verificar(ObtenerValorEx(sSqlFecha, [TDateTimeEx.Create(Fecha), FieldByName('TI_ID').AsInteger]) = 'N', nil, 'La fecha elegida para el tipo de instrumento es inválida.');

                        Id := FieldByName('ID').AsInteger;
                        EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(Fecha), Sesion.UserId, Id]);
                      end;

                    CommitTrans;

                    MsgBox('Registros marcados como contabilizados correctamente.', MB_ICONINFORMATION);
                    TArtDBGrid(DBGrid).UnselectAll;

                    TSDQuery(Self.DataSource.Dataset).Close;
                    TSDQuery(Self.DataSource.Dataset).Sql.Clear;
                    RefreshData;

                    case pgGrillas.ActivePageIndex of
                      PAGEOPERACIONES, PAGEPLAZOSFIJOS:
                        DoImprimirAsientoAContabilizar('O', Sesion.UserId, 0, ART_EMPTY_ID);
                      PAGERESULTADOS:
                        DoImprimirAsientoAContabilizar('R', Sesion.UserId, 0, ART_EMPTY_ID);
                    end;
                  except
                    on E: exception do
                      begin
                        Rollback;
                        MessageDlg('Se produjo un error al marcar los registros como contabilizados. ' + E.Message, mtError, [mbOK], 0);
                      end;
                  end;

                  try
                    DoEjecutarInterfaceAsientos('ID', Fecha);
                  except
                    on E: exception do
                      MessageDlg('Se produjo un error al ejecutar la interfase de asientos. ' + E.Message, mtError, [mbOK], 0);
                  end;
                finally
                  EnableControls;
                end;
              end;
        end;
    end;
end;

procedure TfrmInvConsultarOperacionesResultados.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand            := tbSumatoria.Down;
      GridResultados.FooterBand  := tbSumatoria.Down;
      GridTenencia.FooterBand    := tbSumatoria.Down;
      GridPlazosFijos.FooterBand := tbSumatoria.Down;

      if tbSumatoria.Down then
        case pgGrillas.ActivePageIndex of
          PAGEOPERACIONES:
            if sdqConsulta.Active then
              SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);

          PAGERESULTADOS:
            if sdqResultados.Active then
              SumFields(sdqResultados, CAMPOS_SUMARES, TotalConsultaRes);

          PAGETENENCIA:
            if sdqTenencia.Active then
              SumFields(sdqTenencia, CAMPOS_SUMATEN, TotalConsultaTen);

          PAGEPLAZOSFIJOS:
            if sdqPlazosFijos.Active then
              SumFields(sdqPlazosFijos, CAMPOS_SUMAPLFIJO, TotalConsultaPlFijo);
        end;
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

end.

