unit unLiquidaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, PatternEdit, IntEdit, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ToolEdit, DateComboBox,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Menus;

type
  TfrmLiquidaciones = class(TfrmCustomConsulta)
    pgCtrlHonorarios: TPageControl;
    tbLiquidacion: TTabSheet;
    tbPagos: TTabSheet;
    GridPagos: TArtDBGrid;
    sdqPagos: TSDQuery;
    dsPagos: TDataSource;
    gbLiquid: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edLH_IDDesde: TIntEdit;
    edLH_IDHasta: TIntEdit;
    SortDialogPagos: TSortDialog;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Label19: TLabel;
    gbFechaLiq: TGroupBox;
    Label7: TLabel;
    edLH_FECHADesde: TDateComboBox;
    Label5: TLabel;
    edLH_FECHAHasta: TDateComboBox;
    gbEstado: TGroupBox;
    fraEstado: TfraStaticCTB_TABLAS;
    gbEstudio: TGroupBox;
    fraEstudio: TfraStaticCodigoDescripcion;
    tbCancelar: TToolButton;
    ToolButton7: TToolButton;
    ToolButton2: TToolButton;
    ShortCutControl1: TShortCutControl;
    mnuImprimir: TPopupMenu;
    mnuImprimirLiq: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    sdqDatosArchivo: TSDQuery;
    ExportDialogDatosArchivo: TExportDialog;
    tsExportarArchivo: TToolButton;
    ToolButton9: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure pgCtrlHonorariosChange(Sender: TObject);
    procedure GridPagosPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbExportarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqAfterScroll(DataSet: TDataSet);
    procedure FSFormShow(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure pgCtrlHonorariosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirLiqClick(Sender: TObject);
    procedure tsExportarArchivoClick(Sender: TObject);
  protected
    procedure CheckButtons; override;
  private
    FPaginaAnterior: Integer;
    procedure ImprimirConsulta(Query: TSDQuery; Grilla: TArtDBGrid; Titulo: string);
    procedure ExportarConsulta(Query: TSDQuery; Grilla: TArtDBGrid);
    procedure CalcTotales;
    function ObtenerSqlConsulta: String;
    procedure GuardaDatosCancelacion;
    procedure DoImprimirConsulta;
  public
  end;

var
  frmLiquidaciones: TfrmLiquidaciones;

implementation

uses
  unDmPrincipal, AnsiSql, General, CustomDlgs, Strfuncs, DbFuncs, unFraCodigoDescripcion,
  unArt, unPrincipal, unSesion, SqlFuncs, unListLiquidacionHonorarios;

var
  TotalLiquidacion :array of extended;
  TotalPagos: array of extended;

const
  PAGINA_LIQUIDACION  = 0;
  PAGINA_PAGOS = 1;

  MAXCOLS_LIQ = 3;
  MAXCOLS_PAGOS = 1;

  CAMPOS_SUMA_LIQ  : Array[0..MAXCOLS_LIQ] of String = ('COBRADO', 'HONORARIO', 'IVA', 'TOTAL');
  CAMPOS_SUMA_PAGOS: Array[0..MAXCOLS_PAGOS] of String = ('IMPORTE', 'HONORARIO');

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      sSql := ObtenerSqlConsulta;

      case pgCtrlHonorarios.ActivePageIndex of
        PAGINA_LIQUIDACION:
          begin
            //Realiza la consulta
            sdqConsulta.SQL.Text := sSql + SortNumerico(SortDialog);
            OpenQuery(sdqConsulta);
          end;

        PAGINA_PAGOS:
          begin
            //Realiza la consulta
            sdqPagos.SQL.Text := sSql + SortNumerico(SortDialogPagos);
            OpenQuery(sdqPagos);
          end;
      end;

      CalcTotales;
      CheckButtons
    except
      On E: Exception do
        ErrorMsg( E, 'Error al ejecutar la consulta de selección' );
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  with fraEstudio do
    begin
      sSql :=
        'SELECT GC_ID ' + CD_ALIAS_ID + ',' +
              ' GC_ID ' + CD_ALIAS_CODIGO + ',' +
              ' GC_NOMBRE ' + CD_ALIAS_DESC + ',' +
              ' GC_FECHABAJA ' + CD_ALIAS_BAJA +
         ' FROM AGC_GESTORCUENTA' +
        ' WHERE GC_USUARIO IS NULL' +
          ' AND GC_ESTUDIO = ''S''';
      Sql := sSql;
      ShowBajas := True;
    end;

  with fraEstado do
    begin
      Clave := 'LELIQ';
      ShowBajas := True;
    end;

  fraEmpresa.ShowBajas := True;
  
  SetLength(TotalLiquidacion, MAXCOLS_LIQ + 1);
  SetLength(TotalPagos, MAXCOLS_PAGOS + 1);

  unArt.LoadDynamicSortFields(SortDialogPagos.SortFields, GridPagos.Columns);

  Grid.Parent := tbLiquidacion;
  CheckButtons;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  sdqPagos.Close;

  edLH_IDDesde.Clear;
  edLH_IDHasta.Clear;
  fraEmpresa.Clear;
  fraEstado.Clear;
  fraEstudio.Clear;
  edLH_FECHADesde.Clear;
  edLH_FECHAHasta.Clear;

  pgCtrlHonorarios.ActivePage := tbLiquidacion;
  fraEmpresa.mskCUIT.SetFocus;

  CheckButtons;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.CheckButtons;
var
  bHabilitar: boolean;
begin
  inherited;

  bHabilitar := False;

  case pgCtrlHonorarios.ActivePageIndex of
    PAGINA_LIQUIDACION:
      bHabilitar := sdqConsulta.Active and (not sdqConsulta.IsEmpty);

    PAGINA_PAGOS:
      bHabilitar := sdqPagos.Active and (not sdqPagos.IsEmpty);
  end;

  tbImprimir.Enabled  := bHabilitar;
  tbExportar.Enabled  := bHabilitar;
  tbCancelar.Enabled  := bHabilitar;

  tbNuevo.Enabled     := False;
  tbModificar.Enabled := False;
  tbEliminar.Enabled  := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tbOrdenarClick(Sender: TObject);
begin
  case pgCtrlHonorarios.ActivePageIndex of
    PAGINA_LIQUIDACION:
      begin
        DBGrid     := Grid;
        DataSource := dsConsulta;
        SortDialog.Execute;
      end;

    PAGINA_PAGOS:
      begin
        DBGrid     := GridPagos;
        DataSource := dsPagos;
        SortDialogPagos.Execute;
      end;
  end;

  tbRefrescarClick(nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      // Liquidacion
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA_LIQ, TotalLiquidacion);

      // Pagos
      GridPagos.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqPagos.Active then
        SumFields(sdqPagos, CAMPOS_SUMA_PAGOS, TotalPagos);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.pgCtrlHonorariosChange(Sender: TObject);
var
  sSql: String;
begin
  if pgCtrlHonorarios.ActivePageIndex = PAGINA_PAGOS then
    if ((FPaginaAnterior = PAGINA_LIQUIDACION) and (sdqConsulta.Active = True) and (not sdqConsulta.eof)) then
      begin
        sSql   := 'SELECT * FROM (' +
                            ObtenerSqlConsulta + ')' +
                          'WHERE IDLIQ=' + SqlValue(sdqConsulta.FieldByName('IDLIQ').AsInteger);

        OpenQuery(sdqPagos, sSql + SortNumerico(SortDialogPagos), True);
      end;

  tbSumatoria.Down := False;
  CalcTotales;

  CheckButtons;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.GridPagosPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA_PAGOS);
  if (iPos > -1) and (iPos <= MAXCOLS_PAGOS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalPagos[iPos]), '$');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA_LIQ);
  if (iPos > -1) and (iPos <= MAXCOLS_LIQ) then
    Value := Get_AjusteDecimales(FloatToStr(TotalLiquidacion[iPos]), '$');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.Active and not sdqConsulta.Eof then
    if sdqConsulta.FieldByName('ESTADO').AsString = 'C' then
      AFont.Color := clRed;
end;  
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tbExportarClick(Sender: TObject);
begin
  // Exporta la grilla
  case pgCtrlHonorarios.ActivePageIndex of
    PAGINA_LIQUIDACION:
      ExportarConsulta(sdqConsulta, Grid);

    PAGINA_PAGOS:
      ExportarConsulta(sdqPagos, GridPagos);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.ExportarConsulta(Query: TSDQuery; Grilla: TArtDBGrid);
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
            ExportDialog.Fields.Clear;
        end;
      finally
        tbExportar.Enabled := True;
      end;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('COBRADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('COBRADO')).Currency := True;

  if sdqConsulta.FieldByName('HONORARIO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('HONORARIO')).Currency := True;

  if sdqConsulta.FieldByName('IVA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IVA')).Currency := True;

  if sdqConsulta.FieldByName('TOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTAL')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.sdqAfterScroll(DataSet: TDataSet);
begin
  if sdqPagos.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqPagos.FieldByName('IMPORTE')).Currency := True;

  if sdqPagos.FieldByName('HONORARIO') is TFloatField then
    TFloatField(sdqPagos.FieldByName('HONORARIO')).Currency := True;

  if sdqPagos.FieldByName('PORCHONORARIO') is TFloatField then
    TFloatField(sdqPagos.FieldByName('PORCHONORARIO')).DisplayFormat := '% 0.00;-% 0.00';
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.FSFormShow(Sender: TObject);
begin
  tbLimpiarClick(nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.ImprimirConsulta(Query: TSDQuery; Grilla: TArtDBGrid; Titulo: string);
var
  AutoCols: Boolean;
  iZoom, nPos: integer;
begin
  tbImprimir.Enabled := False;
  try
    if Query.Active and (not Query.IsEmpty) and PrintDialog.Execute then
      begin
        if pgCtrlHonorarios.ActivePage = tbLiquidacion then
          iZoom := 100
        else if pgCtrlHonorarios.ActivePage = tbPagos then
          iZoom := 80
        else
          iZoom := 100;
          
        QueryPrint.Zoom := iZoom;

        QueryPrint.Footer.Text := Sesion.Usuario;
        AutoCols := QueryPrint.Fields.Count = 0;
        try
          QueryPrint.DataSource := Grilla.DataSource;
          if AutoCols Then
             QueryPrint.SetGridColumns( Grilla, True, [baDetail, baHeader, baTotal, baSubTotal] );

          if tbSumatoria.Down then
            for nPos := 0 to QueryPrint.Fields.Count - 1 do
              if ((pgCtrlHonorarios.ActivePage = tbLiquidacion) and AreIn(QueryPrint.Fields[nPos].Title, CAMPOS_SUMA_LIQ)) or
                 ((pgCtrlHonorarios.ActivePage = tbPagos) and AreIn(QueryPrint.Fields[nPos].Title, CAMPOS_SUMA_PAGOS)) then
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
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tbCancelarClick(Sender: TObject);
begin
  if sdqConsulta.Active then
    begin
      Verificar(sdqConsulta.FieldByName('ESTADO').AsString <> 'P', nil, 'La liquidación debe estar en estado Pendiente');

      if MsgBox('¿Está seguro de querer Cancelar la liquidación?', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          GuardaDatosCancelacion;
          tbRefrescarClick( Nil );
        end;
    end;    
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.pgCtrlHonorariosChanging(Sender: TObject; var AllowChange: Boolean);
begin
  FPaginaAnterior := pgCtrlHonorarios.ActivePageIndex;
end;
{-------------------------------------------------------------------------------}
function TfrmLiquidaciones.ObtenerSqlConsulta: String;
var
  sSql, sWhere: String;
begin
  sWhere := SqlBetween(' AND LH_ID', edLH_IDDesde.Value, edLH_IDHasta.Value) +
            SqlBetweenDateTime(' AND LH_FECHA', edLH_FECHADesde.Date, edLH_FECHAHasta.Date);

  if fraEstado.IsSelected then
    sWhere := sWhere + ' AND LH_ESTADO = ' + SqlValue(fraEstado.Codigo);

  if fraEstudio.IsSelected then
    sWhere := sWhere + ' AND GC_ID = ' + SqlValue(fraEstudio.Value);

  //Ahora escribe la consulta
  case pgCtrlHonorarios.ActivePageIndex of
    PAGINA_LIQUIDACION:
      begin
        if fraEmpresa.IsSelected then
          sWhere := sWhere +
                    ' AND EXISTS (SELECT 1 ' +
                                   'FROM AEM_EMPRESA, ACO_CONTRATO, ZVA_VALOR, LDH_DETALLEHONORARIO ' +
                                  'WHERE LH_ID = DH_IDLIQUIDACION ' +
                                    'AND VA_ID(+) = DH_IDVALOR ' +
                                    'AND EM_ID(+) = CO_IDEMPRESA ' +
                                    'AND CO_CONTRATO = NVL(DH_CONTRATO,VA_IDCONTRATO) ' +
                                    'AND CO_CONTRATO = ' + SqlValue(fraEmpresa.Contrato) + ')';

        sSql := 'SELECT LH_ID IDLIQ, GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, LH_FECHA FECHA, LH_COBRADO COBRADO, ' +
                       'LH_HONORARIO HONORARIO, LH_IVA IVA, LH_TOTAL TOTAL, TB_DESCRIPCION DESCESTADO, LH_ESTADO ESTADO ' +
                  'FROM CTB_TABLAS, AGC_GESTORCUENTA, LLH_LIQUIDACIONHONORARIO ' +
                 'WHERE GC_ID = LH_IDGESTOR ' +
                   'AND TB_CODIGO = LH_ESTADO ' +
                   'AND TB_CLAVE = ''LELIQ'' ' +
                 sWhere;
      end;

    PAGINA_PAGOS:
      begin
        if fraEmpresa.IsSelected then
          sWhere := sWhere + ' AND CO_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);

        sSql := 'SELECT DH_IDLIQUIDACION IDLIQ, GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, TV_DESCRIPCION TIPO_VALOR, BA_NOMBRE BANCO, ' +
                       'VA_NROCHEQUE NROCHEQUE, VA_VENCIMIENTO VENCIMIENTO, ' +
                       'DECODE(SIGN(DH_IMPORTE), -1, VA_FECHARECHAZO, NULL) FECHARECHAZO, ' +
                       'DECODE(SIGN(DH_IMPORTE), -1, VA_MOTIVORECHAZO, NULL) MOTIVORECHAZO, CO_CONTRATO CONTRATO, EM_NOMBRE EMPRESA, ' +
                       'EM_CUIT CUIT, NULL PERIODO, PP_ID PLAN_PAGO, PC_NROCUOTA NRO_CUOTA, PC_VENCIMIENTO VENCIMIENTO_CUOTA, ' +
                       'SUM(ROUND(DH_IMPORTE * PV_IMPORTE / VA_IMPORTE, 2)) IMPORTE, MAX(DH_PORCHONORARIO) PORCHONORARIO, ' +
                       'SUM(ROUND(DH_HONORARIO * PV_IMPORTE / VA_IMPORTE, 2)) HONORARIO ' +
                  'FROM AEM_EMPRESA, ACO_CONTRATO, OTV_TIPOVALOR, ZBA_BANCO, ZPP_PLANPAGO, ZPV_PLANVALOR, ZPC_PLANCUOTA, ZVA_VALOR, ' +
                       'AGC_GESTORCUENTA, LHG_HONORARIOGESTOR, LDH_DETALLEHONORARIO, LLH_LIQUIDACIONHONORARIO ' +
                 'WHERE HG_ID = DH_IDHONORARIOGESTOR ' +
                   'AND GC_ID = HG_IDGESTOR ' +
                   'AND LH_ID = DH_IDLIQUIDACION ' +
                   'AND VA_ID = PV_IDVALOR ' +
                   'AND PC_ID = PV_IDPLANCUOTA ' +
                   'AND PP_ID = PC_IDPLANPAGO ' +
                   'AND PP_CONTRATO = CO_CONTRATO ' +
                   'AND VA_ID = DH_IDVALOR ' +
                   'AND BA_ID(+) = VA_IDBANCO ' +
                   'AND TV_ID = VA_IDTIPOVALOR ' +
                   'AND EM_ID = CO_IDEMPRESA ' +
                   'AND CO_CONTRATO = NVL(DH_CONTRATO, VA_IDCONTRATO) ' +
                   'AND PV_FECHABAJA IS NULL ' +
                   'AND GC_ID = PP_IDESTUDIO ' +
                 sWhere + ' ' +
              'GROUP BY DH_IDLIQUIDACION, GC_ID, GC_NOMBRE, TV_DESCRIPCION, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMIENTO, ' +
                       'DECODE(SIGN(DH_IMPORTE), -1, VA_FECHARECHAZO, NULL), DECODE(SIGN(DH_IMPORTE), -1, VA_MOTIVORECHAZO, NULL), ' +
                       'CO_CONTRATO, EM_NOMBRE, EM_CUIT, PP_ID, PC_NROCUOTA, PC_VENCIMIENTO ' +
                 'UNION ALL ' +
                'SELECT DH_IDLIQUIDACION IDLIQ, GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, ''Depósito'' TIPO_VALOR, BA_NOMBRE BANCO, ' +
                       'NULL NROCHEQUE, NULL VENCIMIENTO, NULL FECHARECHAZO, NULL MOTIVORECHAZO, CO_CONTRATO CONTRATO, ' +
                       'EM_NOMBRE EMPRESA, EM_CUIT CUIT, NULL PERIODO, PP_ID PLAN_PAGO, PC_NROCUOTA NRO_CUOTA, ' +
                       'PC_VENCIMIENTO VENCIMIENTO_CUOTA, ROUND(SUM(DH_IMPORTE) * PV_IMPORTE / RM_MONTO, 2) IMPORTE, MAX(DH_PORCHONORARIO) PORCHONORARIO, ' +
                       'ROUND(SUM(DH_HONORARIO) * PV_IMPORTE / RM_MONTO, 2) HONORARIO ' +
                  'FROM AEM_EMPRESA, ACO_CONTRATO, ZBA_BANCO, ZPP_PLANPAGO, ZPV_PLANVALOR, ZPC_PLANCUOTA, RRM_REMESA, ' +
                       'ZCB_CUENTABANCARIA, AGC_GESTORCUENTA, LHG_HONORARIOGESTOR, LDH_DETALLEHONORARIO, LLH_LIQUIDACIONHONORARIO ' +
                 'WHERE HG_ID = DH_IDHONORARIOGESTOR ' +
                   'AND GC_ID = HG_IDGESTOR ' +
                   'AND LH_ID = DH_IDLIQUIDACION ' +
                   'AND RM_ID = PV_IDREMESA ' +
                   'AND PC_ID = PV_IDPLANCUOTA ' +
                   'AND PP_ID = PC_IDPLANPAGO ' +
                   'AND PP_CONTRATO = CO_CONTRATO ' +
                   'AND RM_ID = DH_IDREMESA ' +
                   'AND BA_ID = CB_IDBANCO ' +
                   'AND CB_ID = RM_IDCUENTABANCARIA ' +
                   'AND EM_ID = CO_IDEMPRESA ' +
                   'AND CO_CONTRATO = DH_CONTRATO ' +
                   'AND PV_FECHABAJA IS NULL ' +
                   'AND GC_ID = PP_IDESTUDIO ' +
                 sWhere + ' ' +
              'GROUP BY DH_IDLIQUIDACION, GC_ID, GC_NOMBRE, BA_NOMBRE, CO_CONTRATO, EM_NOMBRE, EM_CUIT, PP_ID, PC_NROCUOTA, ' +
                       'PC_VENCIMIENTO, PV_IMPORTE, RM_MONTO ' +
                 'UNION ALL ' +
                'SELECT DH_IDLIQUIDACION IDLIQ, GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, ''Depósito AFIP'' TIPO_VALOR, NULL BANCO, ' +
                       'NULL NROCHEQUE, NULL VENCIMIENTO, NULL FECHARECHAZO, NULL MOTIVORECHAZO, CO_CONTRATO CONTRATO, EM_NOMBRE EMPRESA, ' +
                       'EM_CUIT CUIT, DH_PERIODO PERIODO, NULL PLAN_PAGO, NULL NRO_CUOTA, NULL VENCIMIENTO_CUOTA, DH_IMPORTE IMPORTE, ' +
                       'DH_PORCHONORARIO PORCHONORARIO, DH_HONORARIO HONORARIO ' +
                  'FROM AEM_EMPRESA, ACO_CONTRATO, AGC_GESTORCUENTA, LHG_HONORARIOGESTOR, LDH_DETALLEHONORARIO, LLH_LIQUIDACIONHONORARIO ' +
                 'WHERE HG_ID = DH_IDHONORARIOGESTOR ' +
                   'AND GC_ID = HG_IDGESTOR ' +
                   'AND LH_ID = DH_IDLIQUIDACION ' +
                   'AND EM_ID = CO_IDEMPRESA ' +
                   'AND CO_CONTRATO = DH_CONTRATO ' +
                   'AND DH_IDVALOR IS NULL ' +
                   'AND NOT EXISTS (SELECT 1 ' +
                                     'FROM ZPV_PLANVALOR ' +
                                    'WHERE PV_IDREMESA = DH_IDREMESA) ' +
                 sWhere + ' ' +
                 'UNION ALL ' +
                 ' SELECT   DH_IDLIQUIDACION IDLIQ, GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, TV_DESCRIPCION || '' - Reemplazo'' TIPO_VALOR, '+
                          ' BA_NOMBRE BANCO, VA_NROCHEQUE NROCHEQUE, VA_VENCIMIENTO VENCIMIENTO, '+
                          ' DECODE(SIGN(DH_IMPORTE), -1, VA_FECHARECHAZO, NULL) FECHARECHAZO, '+
                          ' DECODE(SIGN(DH_IMPORTE), -1, VA_MOTIVORECHAZO, NULL) MOTIVORECHAZO, CO_CONTRATO CONTRATO, EM_NOMBRE EMPRESA, '+
                          ' EM_CUIT CUIT, NULL PERIODO, NULL PLAN_PAGO, NULL NRO_CUOTA, NULL VENCIMIENTO_CUOTA, SUM(DH_IMPORTE) IMPORTE, '+
                          ' MAX(DH_PORCHONORARIO) PORCHONORARIO, SUM(DH_HONORARIO) HONORARIO '+
                     ' FROM AEM_EMPRESA, ACO_CONTRATO, OTV_TIPOVALOR, ZBA_BANCO, ZVA_VALOR, AGC_GESTORCUENTA, LHG_HONORARIOGESTOR, '+
                          ' LDH_DETALLEHONORARIO, LLH_LIQUIDACIONHONORARIO, ZRD_REEMPLAZODETALLE '+
                    ' WHERE HG_ID = DH_IDHONORARIOGESTOR '+
                      ' AND GC_ID = HG_IDGESTOR '+
                      ' AND LH_ID = DH_IDLIQUIDACION '+
                      ' AND VA_ID = DH_IDVALOR '+
                      ' AND BA_ID(+) = VA_IDBANCO '+
                      ' AND TV_ID = VA_IDTIPOVALOR '+
                      ' AND EM_ID = CO_IDEMPRESA '+
                      ' AND CO_CONTRATO = NVL(DH_CONTRATO, VA_IDCONTRATO) '+
                      ' AND VA_ID = RD_IDVALOR '+
                      ' AND RD_TIPO = ''E'' '+
                      sWhere + ' ' +
                 ' GROUP BY DH_IDLIQUIDACION, GC_ID, GC_NOMBRE, TV_DESCRIPCION, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMIENTO, '+
                          ' DECODE(SIGN(DH_IMPORTE), -1, VA_FECHARECHAZO, NULL), DECODE(SIGN(DH_IMPORTE), -1, VA_MOTIVORECHAZO, NULL), CO_CONTRATO, '+
                          ' EM_NOMBRE, EM_CUIT ';
      end;
  end;

  Result := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.GuardaDatosCancelacion;
var
  Sql: TSql;
begin
  Sql := TSql.Create('LLH_LIQUIDACIONHONORARIO');
  try
    with Sql do
      begin
        SqlType := stUpdate;

        PrimaryKey.Add('LH_ID',     sdqConsulta.FieldbyName('IDLIQ').AsInteger);
        Fields.Add('LH_FECHAMODIF', exDateTime);
        Fields.Add('LH_USUMODIF',   Sesion.UserID);
        Fields.Add('LH_ESTADO',     'C');

       EjecutarSql(Sql);
      end;
  finally
    Sql.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.DoImprimirConsulta;
begin
  // Imprime la grilla
  case pgCtrlHonorarios.ActivePageIndex of
    PAGINA_LIQUIDACION:
      ImprimirConsulta(sdqConsulta, Grid, 'Liquidación de Honorarios');

    PAGINA_PAGOS:
      ImprimirConsulta(sdqPagos, GridPagos, 'Pagos de Honorarios');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.mnuImprimirResultadosClick(Sender: TObject);
begin
  DoImprimirConsulta;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.mnuImprimirLiqClick(Sender: TObject);
begin
  with TfrmListLiquidacionHonorarios.Create(nil) do
    try
      if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
        IdLiq := sdqConsulta.FieldByName('IDLIQ').AsInteger
      else
        IdLiq := ART_EMPTY_ID;  

      ShowModal;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidaciones.tsExportarArchivoClick(Sender: TObject);
begin
  if pgCtrlHonorarios.ActivePageIndex = PAGINA_LIQUIDACION then
    begin
      if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
        begin
          OpenQueryEx(sdqDatosArchivo, [sdqConsulta.FieldByName('IDLIQ').AsInteger]);

          ExportDialogDatosArchivo.Execute;
        end;
    end;
end;
{-------------------------------------------------------------------------------}
end.

