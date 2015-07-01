unit unFondoGarantia;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, PeriodoPicker, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Menus,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, ToolEdit, DateComboBox, CurrEdit,
  RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmFondoGarantia = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    fraFG_CONTRATO: TfraEmpresa;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    edFG_PERIODODesde: TPeriodoPicker;
    edFG_PERIODOHasta: TPeriodoPicker;
    GroupBox1: TGroupBox;
    chkFG_ESTADO: TCheckBox;
    chkFG_PAGOSAFIP: TCheckBox;
    mnuSeleccion: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    chkFG_PAGOSFONDOGTIA: TCheckBox;
    chkFG_AJUSTES: TCheckBox;
    gbMotivoBaja: TGroupBox;
    cmbMotivosBaja: TDBCheckCombo;
    sdqMotBaja: TSDQuery;
    dsMotBaja: TDataSource;
    tbAgregarContratos: TToolButton;
    ToolButton2: TToolButton;
    GroupBox2: TGroupBox;
    cmbSectores: TDBCheckCombo;
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    GroupBox3: TGroupBox;
    edPerFechaContable: TPeriodoPicker;
    chkFG_DEBITOS: TCheckBox;
    GroupBox4: TGroupBox;
    edIMPORTE_A_PAGARDesde: TCurrencyEdit;
    edIMPORTE_A_PAGARHasta: TCurrencyEdit;
    Label2: TLabel;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbAgregarContratosClick(Sender: TObject);
  private
    psContratos: String;
    procedure CalcTotales;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;    
  public
  end;

const
  MAXCOLS = 12;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('DEVENGADO', 'SALDO', 'PAGOS_AFIP', 'PAGOS_MANUALES', 'PAGOS_FONDO', 'PAGOS_FONDO_GARANTIA', 'DEBITOS', 'CHEQUE_RECHAZADO', 'AJUSTES', 'ANULA_DEVENGADO_MANUAL', 'IMPORTE_A_PAGAR', 'IMPORTERECLAMADO', 'AJSALDOACREEDOR');

var
  frmFondoGarantia: TfrmFondoGarantia;
  TotalConsulta: Array of Extended;

implementation

uses
  CustomDlgs, General, AnsiSQL, unDmPrincipal, unArt, SqlFuncs, unSesion, DbFuncs,
  Strfuncs, unComunes, unCobranzas;

{$R *.dfm}

procedure TfrmFondoGarantia.ClearData;
begin
  fraFG_CONTRATO.Clear;
  edFG_PERIODODesde.Clear;
  edFG_PERIODOHasta.Clear;
  cmbMotivosBaja.Clear;
  cmbSectores.Clear;
  edPerFechaContable.Clear;
  chkFG_ESTADO.Checked         := True;
  chkFG_PAGOSAFIP.Checked      := True;
  chkFG_PAGOSFONDOGTIA.Checked := False;
  chkFG_AJUSTES.Checked        := False;
  chkFG_DEBITOS.Checked        := False;
  edIMPORTE_A_PAGARDesde.Value := 0;
  edIMPORTE_A_PAGARHasta.Value := 0;

  psContratos := '';
  inherited;
end;

procedure TfrmFondoGarantia.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT FG_CONTRATO CONTRATO, FG_NOMBRE NOMBRE, FG_CUIT CUIT, SECT.TB_DESCRIPCION SECTOR, ' +
                 'FG_VIGENCIADESDE VIGENCIA_DESDE, EST.TB_DESCRIPCION ESTADO, FG_FECHABAJA FECHA_BAJA, ' +
                 'FG_PERIODO PERIODO, FG_PERIODOCOBERTURASRT PERIODO_COBERTURA_SRT, FG_EMPLEADOS EMPLEADOS, ' +
                 'FG_DEVENGADO DEVENGADO, FG_SALDO SALDO, FG_PAGOSAFIP PAGOS_AFIP, FG_PAGOSMANUALES PAGOS_MANUALES, ' +
                 'FG_RECAUDACION RECAUDACION, FG_PAGOSFONDO PAGOS_FONDO, FG_PAGOSFONDOGTIA PAGOS_FONDO_GARANTIA, ' +
                 'FG_DEBITOS DEBITOS, FG_CHEQUERECHAZADO CHEQUE_RECHAZADO, FG_AJUSTES AJUSTES, ' +
                 'FG_ANULADEVENGADOMANUAL ANULA_DEVENGADO_MANUAL, FG_DIAS DIAS, FG_IMPORTEAPAGAR + NVL(FG_PAGOSFONDOGTIA, 0) IMPORTE_A_PAGAR, ' +
                 'MBAJA.TB_DESCRIPCION MBAJADESCR, FG_IMPORTERECLAMADO IMPORTERECLAMADO, ' +
                 'ART.COBRANZA.GET_IMPORTECODIGOMOVIM(FG_CONTRATO, FG_PERIODO, ''799'') + ART.COBRANZA.GET_IMPORTECODIGOMOVIM(FG_CONTRATO, FG_PERIODO, ''792'') AJSALDOACREEDOR, ' +
                 'FG_TIENENOMINA TIENENOMINA, FG_FCONTABLE FCONTABLE, FG_CODTIPOREGIMEN CODREG, FG_CONTRATOEXT CONTRATOEXT ' +
            'FROM CTB_TABLAS MBAJA, CTB_TABLAS EST, CTB_TABLAS SECT, ACO_CONTRATO, V_ZFG_FONDOGARANTIA ' +
           'WHERE SECT.TB_CODIGO = FG_SECTOR ' +
             'AND SECT.TB_CLAVE = ''SECT'' ' +
             'AND EST.TB_CODIGO = FG_ESTADO ' +
             'AND EST.TB_CLAVE = ''AFEST'' ' +
             'AND FG_CONTRATO = CO_CONTRATO ' +
             'AND MBAJA.TB_CODIGO(+) = CO_MOTIVOBAJA ' +
             'AND MBAJA.TB_CLAVE(+) = ''MOTIB'' ';

  sWhere := SqlBetween(' AND FG_IMPORTEAPAGAR + NVL(FG_PAGOSFONDOGTIA, 0)', edIMPORTE_A_PAGARDesde.Value, edIMPORTE_A_PAGARHasta.Value);

  if fraFG_CONTRATO.IsSelected then
    sWhere := sWhere + ' AND FG_CUIT = ' + SqlValue(fraFG_CONTRATO.CUIT);

  if not edFG_PERIODODesde.Periodo.IsNull then
    sWhere := sWhere + ' AND FG_PERIODO >= ' + SqlValue(edFG_PERIODODesde.Periodo.Valor);

  if not edFG_PERIODOHasta.Periodo.IsNull then
    sWhere := sWhere + ' AND FG_PERIODO <= ' + SqlValue(edFG_PERIODOHasta.Periodo.Valor);

  if chkFG_ESTADO.Checked then
    sWhere := sWhere + ' AND FG_ESTADO = ''1''';

  if chkFG_PAGOSAFIP.Checked then
    sWhere := sWhere + ' AND FG_PAGOSAFIP > 3';

  if chkFG_PAGOSFONDOGTIA.Checked then
    sWhere := sWhere + ' AND FG_PAGOSFONDOGTIA = 0';

  if chkFG_AJUSTES.Checked then
    sWhere := sWhere + ' AND FG_AJUSTES = 0';

  if chkFG_DEBITOS.Checked then
    sWhere := sWhere + ' AND FG_DEBITOS = 0';

  if cmbMotivosBaja.Text <> '' then
    sWhere := sWhere + ' AND CO_MOTIVOBAJA ' + cmbMotivosBaja.InSql;

  if cmbSectores.Text <> '' then
    sWhere := sWhere + ' AND FG_SECTOR ' + cmbSectores.InSql;

  if not edPerFechaContable.Periodo.IsNull then
    sWhere := sWhere + ' AND EXISTS (SELECT 1 ' +
                                      'FROM ZCM_CODIGOMOVIMIENTO, ZMO_MOVIMIENTO ' +
                                     'WHERE CM_ID = MO_IDCODIGOMOVIMIENTO ' +
                                       'AND MO_CONTRATOPRINCIPAL = FG_CONTRATO ' +
                                       'AND MO_PERIODO = FG_PERIODO ' +
                                       'AND MO_CODIGORECEPCION = ' + SqlValue(ZMO_RECEPCION_DGI) + ' ' +
                                       'AND CM_CODIGO IN (''100'', ''300'', ''400'') ' +
                                       'AND MO_PERFECHADIST = ' + SqlValue(edPerFechaContable.Periodo.Valor) + ')';

  sWhere := sWhere + IIF(psContratos = '', '', ' AND CO_CONTRATO IN (' + psContratos + ')');

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmFondoGarantia.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('DEVENGADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEVENGADO')).Currency := True;

  if sdqConsulta.FieldByName('SALDO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDO')).Currency := True;

  if sdqConsulta.FieldByName('PAGOS_AFIP') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PAGOS_AFIP')).Currency := True;

  if sdqConsulta.FieldByName('PAGOS_MANUALES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PAGOS_MANUALES')).Currency := True;

  if sdqConsulta.FieldByName('PAGOS_FONDO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PAGOS_FONDO')).Currency := True;

  if sdqConsulta.FieldByName('PAGOS_FONDO_GARANTIA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PAGOS_FONDO_GARANTIA')).Currency := True;

  if sdqConsulta.FieldByName('DEBITOS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEBITOS')).Currency := True;

  if sdqConsulta.FieldByName('CHEQUE_RECHAZADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('CHEQUE_RECHAZADO')).Currency := True;

  if sdqConsulta.FieldByName('AJUSTES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('AJUSTES')).Currency := True;

  if sdqConsulta.FieldByName('ANULA_DEVENGADO_MANUAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ANULA_DEVENGADO_MANUAL')).Currency := True;

  if sdqConsulta.FieldByName('IMPORTE_A_PAGAR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE_A_PAGAR')).Currency := True;

  if sdqConsulta.FieldByName('IMPORTERECLAMADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTERECLAMADO')).Currency := True;

  if sdqConsulta.FieldByName('AJSALDOACREEDOR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('AJSALDOACREEDOR')).Currency := True;
end;

procedure TfrmFondoGarantia.FormCreate(Sender: TObject);
begin
  fraFG_CONTRATO.ShowBajas := True;
  SetLength(TotalConsulta, MAXCOLS + 1);
  OpenQuery(sdqMotBaja);

  psContratos := '';
  inherited;
end;

procedure TfrmFondoGarantia.tbNuevoClick(Sender: TObject);
var
  IdZPF: TTableId;
  Sql: TSql;
  i: Integer;
  dTotales: Array[0..0] of Extended;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  if MsgBox('¿Está seguro de generar el pago? ', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        Sql := TSql.Create();
        try
          with Sql do
            begin
              Clear;
              TableName := 'ZPF_PAGOFONDOGARANTIA';

              IdZPF := GetSecNextVal('SEQ_ZPF_ID');
              SumBookmarkFields(sdqConsulta, Grid.SelectedRows, ['IMPORTE_A_PAGAR'], dTotales);

              PrimaryKey.Add('PF_ID',             IdZPF);
              Fields.Add('PF_IMPORTE',            dTotales[0]);
              Fields.Add('PF_FECHAALTA',          exDateTime);
              Fields.Add('PF_USUALTA',            Sesion.UserID);

              SqlType := stInsert;
              EjecutarSqlST(Sql);

              for i := 0 to Grid.SelectedRows.Count - 1 do
                begin
                  sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

                  Clear;
                  TableName := 'ZDP_DETALLEPAGOFONDOGTIA';

                  PrimaryKey.Add('DP_ID',             GetSecNextVal('SEQ_ZDP_ID'));
                  Fields.Add('DP_IDPAGO',             IdZPF);
                  Fields.Add('DP_CONTRATO',           sdqConsulta.FieldByName('CONTRATOEXT').AsInteger);
                  Fields.Add('DP_PERIODO',            sdqConsulta.FieldByName('PERIODO').AsString);
                  Fields.Add('DP_IMPORTE',            sdqConsulta.FieldByName('IMPORTE_A_PAGAR').AsCurrency, dtNumber);
                  Fields.Add('DP_DIAS',               sdqConsulta.FieldByName('DIAS').AsInteger);
                  Fields.Add('DP_FECHAALTA',          exDateTime);
                  Fields.Add('DP_USUALTA',            Sesion.UserID);

                  SqlType := stInsert;
                  EjecutarSqlST(Sql);
                end;
            end;

          CommitTrans;
          MsgBox('El pago se generó correctamente.', MB_OK);

          tbRefrescarClick(nil);
        finally
          Sql.Free;
        end;
      except
        on E: Exception do
        begin
          RollBack;
          raise Exception.Create(E.Message + CRLF + 'Error al generar el pago.');
        end;
      end;
    end;
end;

procedure TfrmFondoGarantia.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmFondoGarantia.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

procedure TfrmFondoGarantia.CalcTotales;
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
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmFondoGarantia.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmFondoGarantia.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmFondoGarantia.tbAgregarContratosClick(Sender: TObject);
begin
  psContratos := GetListaContratosArchivo();
  if psContratos <> '' then
    tbRefrescarClick(nil);
end;

end.

