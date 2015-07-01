unit unConciliacionBancaria;
                
{********************************************************}
{                                                        }
{    Conciliación Bancaria                               }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FSForm, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, StdCtrls, unArtFrame, unFraStaticCodigoDescripcion, Db, SDEngine,
  LookupDialog, Mask, ToolEdit, DateComboBox, ShortCutControl, Placemnt, artSeguridad, FormPanel, unArt, SortDlg,
  QueryPrint, unArtDBAwareFrame, IntEdit, PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, Menus,
  unFraCodigoDescripcion, unFraCodDesc, QueryToFile, ExportDialog, unCustomForm, ImgList, XPMenu, CurrEdit,
  Buttons, RxToolEdit, RxPlacemnt;

type
  TfrmConciliacionBancaria = class(TfrmCustomForm)
    pnlFiltros: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton5: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton6: TToolButton;
    tbImprimir: TToolButton;
    ToolButton11: TToolButton;
    tbSalir: TToolButton;
    splBottom: TSplitter;
    ToolButton1: TToolButton;
    tbConciliar: TToolButton;
    tbRemesa: TToolButton;
    tbAprobar: TToolButton;
    fraBanco: TfraStaticCodigoDescripcion;
    fraCuentaBancaria: TfraStaticCodigoDescripcion;
    lbBanco: TLabel;
    lbCuenta: TLabel;
    lbEstado: TLabel;
    cmbEstado: TComboBox;
    sdqSaldo: TSDQuery;
    sdqExtracto: TSDQuery;
    dsSaldo: TDataSource;
    dsExtracto: TDataSource;
    ldlgCuentas: TLookupDialog;
    sdqCuentas: TSDQuery;
    dsCuentas: TDataSource;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    Label2: TLabel;
    Seguridad: TSeguridad;
    ShortCutControl: TShortCutControl;
    dbgSaldo: TArtDBGrid;
    pnlSaldoContableTitulo: TPanel;
    pnlExtactoBancario: TPanel;
    dbgExtracto: TArtDBGrid;
    pnlExtactoBancarioTitulo: TPanel;
    pnlSaldoContable: TPanel;
    tbMarcar: TToolButton;
    tbDesmarcar: TToolButton;
    ToolButton4: TToolButton;
    fpCuentas: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    dbgCuentas: TDBGrid;
    tbConcSinContrapartida: TToolButton;
    tbOrdenar: TToolButton;
    sdSaldo: TSortDialog;
    sdExtracto: TSortDialog;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    fpObservaciones: TFormPanel;
    Bevel2: TBevel;
    Label39: TLabel;
    btnAceptar1: TButton;
    btnCancelar1: TButton;
    edEB_DESCUSUARIO: TMemo;
    tbObservaciones: TToolButton;
    ToolButton2: TToolButton;
    gbComprobante: TGroupBox;
    cmbSC_IDTIPOCOMP: TDBCheckCombo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edSC_ORDENDesde: TIntEdit;
    edSC_ORDENHasta: TIntEdit;
    Label7: TLabel;
    edSC_BENEFICIARIO: TEdit;
    sdqTipo: TSDQuery;
    dsTipo: TDataSource;
    edSC_NROCOMP: TIntEdit;
    mnuImprimir: TPopupMenu;
    ItemGrilla: TMenuItem;
    ItemReportesConciliacion: TMenuItem;
    pnlTotales: TPanel;
    lbBalanceTotales: TLabel;
    edBalanceSaldo: TLabel;
    edBalanceExtracto: TLabel;
    fpConceptos: TFormPanel;
    Bevel1: TBevel;
    btnAceptarConceptos: TButton;
    btnCancelar2: TButton;
    Label8: TLabel;
    fraConceptos: TfraCodDesc;
    Label9: TLabel;
    edFechaContableDesde: TDateComboBox;
    Label10: TLabel;
    edFechaContableHasta: TDateComboBox;
    tbExportar: TToolButton;
    mnuExportar: TPopupMenu;
    mnuSaldoContable: TMenuItem;
    mnuExtractoBancario: TMenuItem;
    ExportDialogSaldoContable: TExportDialog;
    ExportDialogExtractoBancario: TExportDialog;
    tbEventoPosterior: TToolButton;
    fpNumeroCheque: TFormPanel;
    btnAceptar2: TButton;
    Label11: TLabel;
    tbReclasificacionCheques: TToolButton;
    ItemCuadradadeBancos: TMenuItem;
    tbEmbargos: TToolButton;
    mnuNotasBanco: TMenuItem;
    mnuNotas_Carta: TMenuItem;
    mnuNotas_Comprobante: TMenuItem;
    Label12: TLabel;
    edFecha: TDateComboBox;
    tbRecursosExtraordinarios: TToolButton;
    btnUpSaldoContable: TBitBtn;
    btnDownSaldoContable: TBitBtn;
    btnUpExtractoBanc: TBitBtn;
    btnDownExtractoBanc: TBitBtn;
    tbConcTransfBAPRO: TToolButton;
    mnuCuadradaBancos: TMenuItem;
    ExportDialogCuadradaBancos: TExportDialog;
    sdqCuadradaBancos: TSDQuery;
    tbAnularRemesa: TToolButton;
    edNumeroOP: TIntEdit;
    mnuAnexosReportedeConciliacion: TMenuItem;
    ExportDialogAnexosReporteConc: TExportDialog;
    sdqAnexosReporteConc: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbConciliarClick(Sender: TObject);
    procedure tbRemesaClick(Sender: TObject);
    procedure dbgSaldoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgSaldoMouseUp(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure dbgExtractoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgExtractoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbMarcarClick(Sender: TObject);
    procedure tbConcSinContrapartidaClick(Sender: TObject);
    procedure tbDesmarcarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure btnAceptar1Click(Sender: TObject);
    procedure tbObservacionesClick(Sender: TObject);
    procedure fpObservacionesEnter(Sender: TObject);
    procedure dbgExtractoDblClick(Sender: TObject);
    procedure FSFormResize(Sender: TObject);
    procedure ItemGrillaClick(Sender: TObject);
    procedure ItemReportesConciliacionClick(Sender: TObject);
    procedure sdqSaldoAfterOpen(DataSet: TDataSet);
    procedure sdqExtractoAfterOpen(DataSet: TDataSet);
    procedure lbBalanceTotalesChange(Sender: TObject);
    procedure btnAceptarConceptosClick(Sender: TObject);
    procedure mnuSaldoContableClick(Sender: TObject);
    procedure mnuExtractoBancarioClick(Sender: TObject);
    procedure tbEventoPosteriorClick(Sender: TObject);
    procedure sdqExtractoAfterScroll(DataSet: TDataSet);
    procedure fpNumeroChequeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbReclasificacionChequesClick(Sender: TObject);
    procedure ItemCuadradadeBancosClick(Sender: TObject);
    procedure tbEmbargosClick(Sender: TObject);
    procedure mnuNotas_CartaClick(Sender: TObject);
    procedure mnuNotas_ComprobanteClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure tbRecursosExtraordinariosClick(Sender: TObject);
    procedure btnUpSaldoContableClick(Sender: TObject);
    procedure btnUpExtractoBancClick(Sender: TObject);
    procedure tbConcTransfBAPROClick(Sender: TObject);
    procedure mnuCuadradaBancosClick(Sender: TObject);
    procedure tbAnularRemesaClick(Sender: TObject);
  private
    dFecha: TDateTime;
    bWorking: Boolean;
    IdLastSeleccion: TTableId;
    MontoBalance, MontoSaldo, MontoExtracto: Extended;
    piPosSaldoCont, piPosExtractoBanc: Integer;
    pbExportarAnexosReporteConciliacion: Boolean;
    procedure CheckSelection(Sender: TObject; ACondition: String);
    procedure PrintResults;
    procedure OnfraBancoChange(Sender: TObject);
    procedure OnfraCuentaBancariaChange(Sender: TObject);
    procedure btPresFormalAceptarClick(Sender: TObject);
    procedure IsRegistroSeleccionadoExtracto;
    procedure DoLimpiarPosMover;
    procedure DoMoverProxReg(sdq: TSDQuery; dbg:TArtDBGrid; ProxReg: Boolean; var Pos: Integer);
    function GetSqlCuadradaBancos(): String;
  end;

var
  frmConciliacionBancaria: TfrmConciliacionBancaria;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, CustomDlgs, unConcAsociacionCodigos, unGrids, DBFuncs, Numeros, unSesion,
  DateTimeFuncs, unRptPresFormal, StrFuncs, VCLExtra, General, Periodo, unImpoExpoWizard, unRptCuadradaBancos,
  SqlFuncs, unAltaEmbargos, unRptNotasBanco_Carta, unRptNotasBanco_Comprobante, unAltaDevolucionEmbargos,
  unAltaRecursosExtraordinarios, unVisualizador, unComunesMail, unComunes, unTesoreria;

{$R *.DFM}

procedure TfrmConciliacionBancaria.FormCreate(Sender: TObject);
begin
  Application.OnException   := nil;
  lbBalanceTotales.Caption  := '';
  edBalanceSaldo.Caption    := '';
  edBalanceExtracto.Caption := '';

  with fraBanco do
  begin
    ShowBajas   := True;
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
    OnChange    := OnfraBancoChange;

    ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
  end;

  with fraCuentaBancaria do
  begin
    ShowBajas   := True;
    TableName   := 'ZCB_CUENTABANCARIA';
    FieldID     := 'CB_ID';
    FieldCodigo := 'CB_ID';
    FieldDesc   := 'CB_NUMERO';
    FieldBaja   := 'CB_FECHABAJA';
    DynamicCols := True;
    ExtraFields := ', CB_IDBANCO "ID Banco"';
    VisibleExtraFields[0] := False;
    ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
    OnChange    := OnfraCuentaBancariaChange;
  end;

  tbLimpiarClick(nil);
end;

procedure TfrmConciliacionBancaria.tbLimpiarClick(Sender: TObject);
begin
  fraBanco.Clear;
  fraCuentaBancaria.Clear;
  cmbEstado.ItemIndex := 3;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  cmbSC_IDTIPOCOMP.Clear;
  edSC_NROCOMP.Clear;
  edSC_BENEFICIARIO.Clear;
  edSC_ORDENDesde.Clear;
  edSC_ORDENHasta.Clear;

  lbBalanceTotales.Caption  := '';
  edBalanceSaldo.Caption    := '';
  edBalanceExtracto.Caption := '';

  DoLimpiarPosMover;
  IdLastSeleccion := ART_EMPTY_ID;

  sdqSaldo.Close;
  sdqExtracto.Close;
  sdqTipo.Close;
  sdqTipo.Open;
end;

procedure TfrmConciliacionBancaria.tbRefrescarClick(Sender: TObject);
var
  sSql,
  sSqlWhereOMB,
  sSqlWhereOEB: String;
begin
  DoLimpiarPosMover;
  IdLastSeleccion   := ART_EMPTY_ID;

  sSqlWhereOMB := '';
  sSqlWhereOEB := '';

  if fraBanco.IsSelected then
  begin
    sSqlWhereOMB := 'AND SC_IDBANCO = ' + SqlValue(fraBanco.Value) + ' ';
    sSqlWhereOEB := 'AND BA_ID = ' + SqlValue(fraBanco.Value) + ' ';
  end;

  if fraCuentaBancaria.IsSelected then
  begin
    sSqlWhereOMB := sSqlWhereOMB + 'AND SC_IDCUENTABANCARIA = ' + SqlValue(fraCuentaBancaria.Value) + ' ';
    sSqlWhereOEB := sSqlWhereOEB + 'AND EB_IDCUENTABANCARIA = ' + SqlValue(fraCuentaBancaria.Value) + ' ';
  end;

  if cmbEstado.ItemIndex <> 0 then
  begin
    sSqlWhereOMB := sSqlWhereOMB + 'AND SC_CONCILIADO = ' + SqlSwitch(cmbEstado.ItemIndex, ['', 'S', 'P', 'N'], True);
    sSqlWhereOEB := sSqlWhereOEB + 'AND '''' || EB_CONCILIADO = ' + SqlSwitch(cmbEstado.ItemIndex, ['', 'S', 'P', 'N'], True);
  end;

  if cmbSC_IDTIPOCOMP.CheckedCount > 0 then
    sSqlWhereOMB := sSqlWhereOMB + 'AND SC_IDTIPOCOMP ' + cmbSC_IDTIPOCOMP.InSql;

  if edSC_NROCOMP.Value > 0 then
  begin
    sSqlWhereOMB := sSqlWhereOMB + 'AND SC_NROCOMP = ' + SQLValue(edSC_NROCOMP.Value);
    sSqlWhereOEB := sSqlWhereOEB + 'AND EB_NROCOMP = ''' + IntToStr(edSC_NROCOMP.Value) + ''' ';
  end;

  if edSC_BENEFICIARIO.Text > '' then
    sSqlWhereOMB := sSqlWhereOMB + ' AND SC_BENEFICIARIO LIKE ' + SqlValue(edSC_BENEFICIARIO.Text + '%');

  if Is_FechaValida(edFechaDesde.Text) or Is_FechaValida(edFechaHasta.Text) then
  begin
    sSqlWhereOEB := sSqlWhereOEB + SqlBetweenDateTime(' AND EB_FECHAMOVIMIENTO ', edFechaDesde.Date, edFechaHasta.Date);
    sSqlWhereOMB := sSqlWhereOMB + SqlBetweenDateTime(' AND SC_FECHA ', edFechaDesde.Date, edFechaHasta.Date);
  end;

  if Is_FechaValida(edFechaContableDesde.Text) or Is_FechaValida(edFechaContableHasta.Text) then
  begin
    sSqlWhereOEB := sSqlWhereOEB + SqlBetweenDateTime(' AND EB_FECHAMOVIMIENTO ', edFechaDesde.Date, edFechaHasta.Date);
    sSqlWhereOMB := sSqlWhereOMB + SqlBetweenDateTime(' AND SC_FECHA ', edFechaDesde.Date, edFechaHasta.Date);
  end;

  if (edSC_ORDENDesde.Value <> 0) or (edSC_ORDENHasta.Value <> 0) then
    sSqlWhereOMB := sSqlWhereOMB + ' AND ' + SqlBetween('SC_ORDENPAGO', edSC_ORDENDesde.Value, edSC_ORDENHasta.Value);

  sSql :=
  	'SELECT SC_ID, SC_NOMBREBANCO, SC_NUMEROCUENTA, SC_TIPOCOMP, SC_NROCOMP, SC_FECHA, SC_BENEFICIARIO, SC_ORDENPAGO,' +
    			' SC_DEBITO, SC_CREDITO, SC_CONCILIADO CONCILIADO, SC_IDCUENTABANCARIA IDCUENTABANCARIA, SC_MONTO MONTO,' +
          ' SC_CODIGOCOMP' +
     ' FROM V_OSC_SALDOCONTABLEBANCO' +
    ' WHERE 1 = 1 ' + sSqlWhereOMB;

  OpenQuery(sdqSaldo, sSql);

  sSql :=
  	'SELECT EB_ID, BA_NOMBRE, CB_NUMERO, CE_DESCRIPCION OPERACION, CO_DESCRIPCION TIPO, EB_NROCOMP,' +
    			' EB_FECHAMOVIMIENTO FECHA_MOV, EB_FECHAVALOR FECHA_VALOR, CB_FECHAALTA,' +
          ' DECODE(EB_DEBITOCREDITO, ''D'', EB_IMPORTE, NULL) DEBITO,' +
          ' DECODE(EB_DEBITOCREDITO, ''C'', EB_IMPORTE, NULL) CREDITO, EB_CONCILIADO CONCILIADO, EB_CODOPERACION,' +
          ' EB_IDCUENTABANCARIA IDCUENTABANCARIA,' +
          ' DECODE(EB_DEBITOCREDITO, ''C'', EB_IMPORTE, 0) - DECODE(EB_DEBITOCREDITO, ''D'', EB_IMPORTE, 0) MONTO,' +
          ' EB_DESCUSUARIO, EB_DESCRIPCION, CE_IDCODIGOCONC, CB_ID, BA_ID' +
     ' FROM OCO_CODIGOCONCILIACION, ZBA_BANCO, ZCB_CUENTABANCARIA ZCB, OCE_CODIGOEXTRACTO, OEB_EXTRACTOBANCO' +
    ' WHERE EB_CODOPERACION = CE_CODIGO' +
    	' AND EB_IDCUENTABANCARIA = ZCB.CB_ID' +
      ' AND CB_IDBANCO = BA_ID' +
      ' AND CE_IDCODIGOCONC = CO_ID' +
      ' AND EB_FECHABAJA IS NULL ' + sSqlWhereOEB;

  OpenQuery(sdqExtracto, sSql);
end;

procedure TfrmConciliacionBancaria.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConciliacionBancaria.tbConciliarClick(Sender: TObject);
begin
  OpenQuery(sdqCuentas);
  if ldlgCuentas.Execute then
    with TfrmConcAsociacionCodigos.Create(Self) do
    try
      RefreshData;
      if not sdqConsulta.IsEmpty then
        ShowModal;

      EjecutarStore('CONT.DO_CONCILIACION(' + sdqCuentas.FieldByName('CB_ID').AsString + ', ' +
                                              SqlValue(Sesion.UserId) + ');' );

      sdqSaldo.Refresh;
      sdqExtracto.Refresh;
    finally
      Free;
    end;
end;

procedure TfrmConciliacionBancaria.tbRemesaClick(Sender: TObject);
var
  i: Integer;
  sBoleta: String;
  OldCursor: TCursor;
  AFechaServer: TDateTime;
begin
  Verificar(dbgExtracto.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un registro de la grilla "Extracto Bancario".');
	Verificar((sdqExtracto.FieldByName('CONCILIADO').AsString <> 'N'), dbgExtracto, 'El movimiento no debe estar conciliado.');

  if MsgAsk('Se dispone a generar una remesa'#13#10'¿ Está usted seguro ?') then
  begin
    OldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      {--[Valida todos los registros, para que si se produce un error no cree ninguna nueva secuencia]-------}
      AFechaServer := DBDateTime;
      for i:=0 to dbgExtracto.SelectedRows.Count - 1 do
      begin
        sdqExtracto.GotoBookmark(Pointer(dbgExtracto.SelectedRows.Items[i]));

        { Se debe haber realizado la Conciliación con anterioridad }
        Verificar(sdqExtracto.FieldByName('CB_FECHAALTA').AsDateTime > AFechaServer, nil,
                  'Se debe realizar la Conciliación antes de generar las Remesas.');

        sBoleta := ValorSql('SELECT BD_NUMERO ' +
                              'FROM RBD_BOLETADEPOSITO, OMB_MOVIMIENTOBANCO ' +
                             'WHERE MB_CONCILIADO = ''N'' ' +
                               'AND MB_TIPOCOMP = ''02'' ' +
                               'AND MB_IDCOMP = BD_ID ' +
                               'AND MB_DEBITO = ' + SqlNumber(sdqExtracto.FieldByName('CREDITO').AsCurrency) + ' ' +
                               'AND BD_FECHA <= ' + SqlDate(sdqExtracto.FieldByName('FECHA_MOV').AsDateTime));

        if (sBoleta <> '') and (not MsgAskFmt('La Boleta de Depósito %s se corresponde con el crédito seleccionado y no está conciliada.'#13#10'¿ Está seguro de querer generar la remesa ?', [sBoleta])) then
          Abort;
      end;

      {--[Procesa todos los registros]-----------------------------------------------------------------------}
      BeginTrans;
      try
        for i:=0 to dbgExtracto.SelectedRows.Count - 1 do
        begin
          sdqExtracto.GotoBookmark(Pointer(dbgExtracto.SelectedRows.Items[i]));
          EjecutarStoreST('CONT.DO_GENERAREMESA(' + sdqExtracto.FieldByName('EB_ID').AsString + ', ' + SqlValue(Sesion.UserId) + ');' );
        end;
        CommitTrans;
      except
        RollBack;
        raise;                                    
      end;

      {--[Refresca los Resultados]---------------------------------------------------------------------------}
      sdqSaldo.Refresh;
      sdqExtracto.Refresh;
    finally
      Screen.Cursor := OldCursor;
    end;
  end;
end;

procedure TfrmConciliacionBancaria.dbgSaldoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not sdqSaldo.IsEmpty then
    CheckSelection(Sender, 'CB_IDMOVIMIENTO = ' + SqlValue(sdqSaldo.Fields[0].AsInteger));
end;

procedure TfrmConciliacionBancaria.dbgSaldoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not sdqSaldo.IsEmpty then
    CheckSelection(Sender, 'CB_IDMOVIMIENTO = ' + SqlValue(sdqSaldo.Fields[0].AsInteger));
end;

procedure TfrmConciliacionBancaria.dbgExtractoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not sdqExtracto.IsEmpty then
    CheckSelection(Sender, 'CB_IDEXTRACTO = ' + SqlValue(sdqExtracto.Fields[0].AsInteger));
end;

procedure TfrmConciliacionBancaria.dbgExtractoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not sdqExtracto.IsEmpty then
    CheckSelection(Sender, 'CB_IDEXTRACTO = ' + SqlValue(sdqExtracto.Fields[0].AsInteger));
end;

procedure TfrmConciliacionBancaria.CheckSelection(Sender: TObject; ACondition: String);
var
  OldCursor: TCursor;

  procedure MarcarRegistros(ADBGrid: TDBGrid; AFieldName: String);
  var
    sdqTemp: TSDQuery;
    ADataSet: TDataSet;
  begin
    sdqTemp := GetQuery('SELECT DISTINCT CB_ID' + AFieldName + ' ID ' +
                          'FROM OCB_CONCILIACIONBANCARIA ' +
                         'WHERE CB_IDSELECCION = ' + SqlValue(IdLastSeleccion) +
                        ' ORDER BY CB_ID' + AFieldName);
    try
      ADataSet := ADBGrid.DataSource.DataSet;
      with TDataCycler.Create(ADataSet) do
      try
        repeat
          ADBGrid.SelectedRows.CurrentRowSelected := sdqTemp.Locate('ID', ADataSet.Fields[0].AsInteger, []);
        until not Cycle;
      finally
        Free;
      end;
    finally
      sdqTemp.Free;
    end;
  end;

begin
  if not bWorking then
  begin
    bWorking := True;
    try
      if (TDBGrid(Sender).SelectedRows.Count > 1) then
        begin
          DoLimpiarPosMover;
          IdLastSeleccion := ART_EMPTY_ID;
        end
      else
      begin
        OldCursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        try
          DoLimpiarPosMover;
          IdLastSeleccion := ValorSqlInteger('SELECT CB_IDSELECCION FROM OCB_CONCILIACIONBANCARIA WHERE ' + ACondition, ART_EMPTY_ID);
          if IdLastSeleccion <> ART_EMPTY_ID then
          begin
            MarcarRegistros(dbgSaldo, 'MOVIMIENTO');
            MarcarRegistros(dbgExtracto, 'EXTRACTO');
          end;
        finally
          Screen.Cursor := OldCursor;
        end;
      end;
    finally
      bWorking := False;
    end;
  end;

  MontoSaldo    := ObtenerSuma(dbgSaldo, 'MONTO', True);
  MontoExtracto := ObtenerSuma(dbgExtracto, 'MONTO', True);
  MontoBalance  := MontoSaldo - MontoExtracto;

  edBalanceSaldo.Caption    := ToStr(MontoSaldo, 2, False, False, '$');
  edBalanceExtracto.Caption := ToStr(MontoExtracto, 2, False, False, '$');
  lbBalanceTotales.Caption  := ToStr(MontoBalance, 2, False, False, '$');
  lbBalanceTotalesChange(nil);
end;

procedure TfrmConciliacionBancaria.btnAceptarClick(Sender: TObject);
var
  sSQL: String;
begin
  Verificar(dbgCuentas.SelectedRows.Count = 0, dbgCuentas, 'Debe seleccionar al menos una fila.');

  sSQL := 'SELECT PC_ESTADO ' +
          '  FROM TESO.RPC_PERIODOCONCILIACION ' +
          ' WHERE PC_CUENTA = ' + SqlValue(sdqCuentas.FieldByName('CB_ID').AsInteger) +
          '   AND PC_PERIODO = ' + SqlValue(GetPeriodo(dFecha, fpAnioMes));

  if ValorSql(sSQL) <> 'A' then
    InfoHint(dbgCuentas, 'No puede conciliar valores dentro de un período cerrado.', True);

  fpCuentas.ModalResult := mrOk;
end;

procedure TfrmConciliacionBancaria.tbAprobarClick(Sender: TObject);
var
  i: Integer;
begin
  dFecha := InputBoxDate('Fecha Contable', 'Fecha', DBDateTime);

  if dFecha <> -1 then
    begin
      if dFecha = 0 then
        InfoHint(nil, 'Debe elegir una fecha contable para poder aprobar.', True);

      OpenQuery(sdqCuentas);
      if fpCuentas.ShowModal = mrOk then
      begin
        BeginTrans;
        try
          for i:=0 to dbgCuentas.SelectedRows.Count - 1 do
          begin
            sdqCuentas.GotoBookmark(pointer(dbgCuentas.SelectedRows.Items[i]));
            EjecutarStoreST('CONT.DO_APRUEBACONCILIACION(' + SqlValue(sdqCuentas.FieldByName('CB_ID').AsInteger) + ', ' +
                            SqlValue(Sesion.UserId) + ',' + SqlValue(dFecha) + ');' );
          end;

          CommitTrans;
        except
          RollBack;
          raise;
        end;

        if sdqSaldo.Active then
          sdqSaldo.Refresh;

        if sdqExtracto.Active then
          sdqExtracto.Refresh;
      end;
    end;
end;

procedure TfrmConciliacionBancaria.tbConcSinContrapartidaClick(Sender: TObject);
var
  i, iOperacion: Integer;
  OldCursor: TCursor;
begin
  iOperacion := 0;
  Verificar(dbgExtracto.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un registro de la grilla "Extracto Bancario".');

  if MsgAsk('Desea seleccionar el concepto del movimiento ?') then
  begin
    if fpConceptos.ShowModal = mrOk then
      iOperacion := fraConceptos.Value
    else
      Abort;
  end
  else
    iOperacion := sdqExtracto.FieldByName('CE_IDCODIGOCONC').AsInteger;

  if MsgAsk('Se dispone a conciliar los movimientos seleccionados'#13#10'¿ Está usted seguro ?') then
  begin
    OldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      {--[Valida todos los registros, para que si se produce un error no cree ninguna nueva secuencia]-------}
      for i:=0 to dbgExtracto.SelectedRows.Count - 1 do
      begin
        sdqExtracto.GotoBookmark(Pointer(dbgExtracto.SelectedRows.Items[i]));
        Verificar(sdqExtracto.FieldByName('CONCILIADO').AsString <> 'N', nil, 'El movimiento no debe estar conciliado.');
      end;

      {--[Si es necesario, muestra la pantala de asociación de códigos]--------------------------------------}
      with TfrmConcAsociacionCodigos.Create(Self) do
      try
        RefreshData;
        if not sdqConsulta.IsEmpty then
          ShowModal;

      finally
        Free;
      end;

      {--[Procesa todos los registros]-----------------------------------------------------------------------}
      BeginTrans;
      try
        for i:=0 to dbgExtracto.SelectedRows.Count - 1 do
        begin
          sdqExtracto.GotoBookmark(Pointer(dbgExtracto.SelectedRows.Items[i]));
          EjecutarStoreST('CONT.DO_CONCILIASINCONTRAPARTIDA(' + SqlValue(sdqExtracto.FieldByName('EB_ID').AsInteger) + ', ' +
                                                                SqlValue(iOperacion) + ', ' +
                                                                SqlValue(Sesion.UserId) + ');' );
        end;
        CommitTrans;
      except
        RollBack;
        raise;
      end;

      {--[Refresca los Resultados]---------------------------------------------------------------------------}
      sdqSaldo.Refresh;
      sdqExtracto.Refresh;
    finally
      Screen.Cursor := OldCursor;
    end;
  end;
end;

procedure TfrmConciliacionBancaria.tbMarcarClick(Sender: TObject);
var
  OldCursor: TCursor;
  IdTolerancia,
  IdCuentaBancaria,
  IdSeleccion: TTableId; { Id de la Cuenta Bancaria de los registros Marcados }
  rSaldo,
  rExtracto: Currency;

  procedure Validar(ADBGrid: TDBGrid; var ASum: Currency);
  var
    iBookMark: Integer;
    ADataSet: TDataSet;
  begin
    ASum := 0;
    ADataSet := ADBGrid.DataSource.DataSet;
    for iBookMark := 0 to ADBGrid.SelectedRows.Count - 1 do
    begin
      ADataSet.GotoBookmark(pointer(ADBGrid.SelectedRows.Items[iBookMark]));
      Verificar(ADataSet.FieldByName('CONCILIADO').AsString <> 'N', ADBGrid,
                'El movimiento no debe estar conciliado');

      if IdCuentaBancaria = ART_EMPTY_ID then
        IdCuentaBancaria := ADataSet.FieldByName('IDCUENTABANCARIA').AsInteger

      else
        Verificar(ADataSet.FieldByName('IDCUENTABANCARIA').AsInteger <> IdCuentaBancaria, ADBGrid,
                  'No se pueden conciliar movimientos de distintas cuentas bancarias.');

      ASum := ASum + ADataSet.FieldByName('MONTO').AsCurrency;
    end;
  end;

  procedure CheckTolerancia;
  var
    rTolMonto,           { Monto de Tolerancia }
    rTolPorc: Currency;  { Porcentaje de Tolerancia }
  begin
    with GetQuery('SELECT TC_MONTO, TC_PORCENTAJE FROM OTC_TOLERANCIACONCILIACION WHERE TC_FECHABAJA IS NULL') do
      try
        rTolMonto := FieldByName('TC_MONTO').AsCurrency;
        rTolPorc := FieldByName('TC_PORCENTAJE').AsCurrency;
      finally
        Free;
      end;

    if (ToleranceCompare(rSaldo, rExtracto, rTolMonto) <> 0) and
       (TolerancePorcCompare(rSaldo, rExtracto, rTolPorc) <> 0) and
       (TolerancePorcCompare(rExtracto, rSaldo, rTolPorc) <> 0) then
      raise Exception.CreateFmt('La suma de los importes de los movimientos seleccionados debe ser igual (Saldo: %f.- Extracto: %f.-)', [rSaldo, rExtracto]);
  end;

  procedure MarcarRegistros(ADBGrid: TDBGrid; AField: String);
  var
    iBookMark: Integer;
    ADataSet: TDataSet;
  begin
    ADataSet := ADBGrid.DataSource.DataSet;
    for iBookMark := 0 to ADBGrid.SelectedRows.Count - 1 do
    begin
      ADataSet.GotoBookmark(pointer(ADBGrid.SelectedRows.Items[iBookMark]));
      EjecutarSqlST('INSERT INTO OCB_CONCILIACIONBANCARIA ' +
                    '(CB_ID, CB_IDSELECCION, CB_ID' + AField + ', CB_USUALTA, CB_FECHAALTA) ' +
                    'VALUES (SEQ_OCB_ID.NEXTVAL, ' +
                             SqlValue(IdSeleccion) + ', ' +
                             SqlValue(ADataSet.Fields[0].AsInteger) + ', ' +
                             SqlValue(Sesion.UserId) + ' , SYSDATE)');
    end;
  end;
begin
  if not (sdqSaldo.Active and sdqExtracto.Active) then
    Exit;

  Verificar(IdLastSeleccion <> ART_EMPTY_ID, nil, 'Los registros marcados ya pertenecen a una selección.');

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    IdCuentaBancaria := ART_EMPTY_ID;
    Validar(dbgSaldo, rSaldo);
    Validar(dbgExtracto, rExtracto);
    CheckTolerancia;

    BeginTrans;
    try
      IdSeleccion := GetSecNextVal('SEQ_OCB_IDSELECCION');

      {-------------------- COMPENSACION DE TOLERANCIA ------------------------}
      if (rSaldo - rExtracto) <> 0 then
      begin
        IdTolerancia := GetSecNextVal('SEQ_OMB_ID');

        if (rSaldo - rExtracto) < 0 then
          EjecutarSQLSTEx('INSERT INTO OMB_MOVIMIENTOBANCO ' +
                          '(MB_ID, MB_IDCUENTABANCARIA, MB_TIPOCOMP, MB_IDCOMP, ' +
                          'MB_DEBITO, MB_CREDITO, MB_USUALTA, MB_FECHAALTA, MB_CONCILIADO, MB_IDCODIGOCONC) ' +
                          'VALUES (:Id, :IDCUENTA, ''6'', NULL, ' + SQLValue(Abs(rSaldo - rExtracto)) + ', NULL, ' +
                          ':USER, SYSDATE, ''P'', 15)', [IdTolerancia, IdCuentaBancaria, Sesion.UserID])
        else if (rSaldo - rExtracto) > 0 then
          EjecutarSQLSTEx('INSERT INTO OMB_MOVIMIENTOBANCO ' +
                          '(MB_ID, MB_IDCUENTABANCARIA, MB_TIPOCOMP, MB_IDCOMP, ' +
                          'MB_DEBITO, MB_CREDITO, MB_USUALTA, MB_FECHAALTA, MB_CONCILIADO, MB_IDCODIGOCONC) ' +
                          'VALUES (:Id, :IDCUENTA, ''6'', NULL, NULL, ' + SQLValue(Abs(rSaldo - rExtracto)) + ', ' +
                          ':USER, SYSDATE, ''P'', 15)', [IdTolerancia, IdCuentaBancaria, Sesion.UserID]);

        EjecutarSqlST('INSERT INTO OCB_CONCILIACIONBANCARIA ' +
                      '(CB_ID, CB_IDSELECCION, CB_IDMOVIMIENTO, CB_USUALTA, CB_FECHAALTA) ' +
                      'VALUES (SEQ_OCB_ID.NEXTVAL, ' +
                               SqlValue(IdSeleccion) + ', ' +
                               SqlValue(IdTolerancia) + ', ' +
                               SqlValue(Sesion.UserId) + ' , SYSDATE)');
      end;
      {-------------------- COMPENSACION DE TOLERANCIA ------------------------}

      MarcarRegistros(dbgSaldo, 'MOVIMIENTO');
      MarcarRegistros(dbgExtracto, 'EXTRACTO');

      IdLastSeleccion := IdSeleccion;
      CommitTrans;
      sdqSaldo.Refresh;
      sdqExtracto.Refresh;
    except
      RollBack;
      raise;
    end;
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmConciliacionBancaria.tbDesmarcarClick(Sender: TObject);
  procedure ValidarRegistros;
  var
    iBookMark: Integer;
    ADataSet: TDataSet;
  begin
    ADataSet := dbgSaldo.DataSource.DataSet;
    for iBookMark := 0 to dbgSaldo.SelectedRows.Count - 1 do
    begin
      ADataSet.GotoBookmark(pointer(dbgSaldo.SelectedRows.Items[iBookMark]));

      if ADataSet.FieldByName('CONCILIADO').AsString = 'S' then
        raise Exception.Create('El movimiento no debe estar conciliado.');
    end;
  end;
begin
  Verificar(IdLastSeleccion = ART_EMPTY_ID, nil, 'No ha ubicado ninguna selección para desmarcarla.');
  ValidarRegistros;

  if MsgAsk('Se dispone a generar desconciliar los registros seleccionados.'#13#10'¿ Está usted seguro ?') then
  begin
    EjecutarSql('DELETE FROM OCB_CONCILIACIONBANCARIA ' +
                'WHERE CB_IDSELECCION = ' + SqlValue(IdLastSeleccion));
    sdqSaldo.Refresh;
    sdqExtracto.Refresh;
  end;
end;

procedure TfrmConciliacionBancaria.tbOrdenarClick(Sender: TObject);
begin
  if ActiveControl = dbgSaldo then
    sdSaldo.Execute

  else if ActiveControl = dbgExtracto then
    sdExtracto.Execute

  else
    InvalidHint(nil, 'Debe ubicar el foco sobre la grilla que desea ordenar.');
end;

procedure TfrmConciliacionBancaria.PrintResults;
begin
  tbImprimir.Enabled := False;
  try
    if PrintDialog.Execute then
    begin
      QueryPrint.Footer.Text := Sesion.Usuario;
      QueryPrint.SetGridColumns(TDBGrid(ActiveControl), True, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Print;
      QueryPrint.Fields.Clear;
    end;
  finally
    tbImprimir.Enabled := True;
  end;
end;

procedure TfrmConciliacionBancaria.OnfraBancoChange(Sender: TObject);
begin
  fraCuentaBancaria.ExtraCondition := ' AND CB_CONCILIACION = ''S''';

  if fraBanco.IsSelected then
    fraCuentaBancaria.ExtraCondition := fraCuentaBancaria.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBanco.Value)
end;

procedure TfrmConciliacionBancaria.btnAceptar1Click(Sender: TObject);
var
  SQL: String;
begin
  SQL := 'UPDATE OEB_EXTRACTOBANCO' +
           ' SET EB_DESCUSUARIO = :OBSERVACIONES' +
         ' WHERE EB_ID = :ID';
  EjecutarSqlEx(SQL, [edEB_DESCUSUARIO.Text, sdqExtracto.FieldByName('EB_ID').AsInteger]);
  fpObservaciones.Close;
  sdqExtracto.Refresh;
end;

procedure TfrmConciliacionBancaria.tbObservacionesClick(Sender: TObject);
begin
  Verificar(dbgExtracto.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un registro de la grilla "Extracto Bancario".');
  fpObservaciones.ShowModal;
end;

procedure TfrmConciliacionBancaria.fpObservacionesEnter(Sender: TObject);
begin
  edEB_DESCUSUARIO.Text := sdqExtracto.FieldByName('EB_DESCUSUARIO').AsString;
end;

procedure TfrmConciliacionBancaria.dbgExtractoDblClick(Sender: TObject);
begin
  tbObservaciones.Click;
end;

procedure TfrmConciliacionBancaria.FSFormResize(Sender: TObject);
begin
  pnlExtactoBancario.Height := Round(Self.Height / 2) - 50;
  pnlTotales.Top := 1000;
end;

procedure TfrmConciliacionBancaria.btPresFormalAceptarClick(Sender: TObject);
var
  rptPresFormal    : TfrmRptPresFormal;
  i                : cardinal;
  dtFechaConciliado: TDateTime;
  sSql             : String;
  nSaldoContable   : currency;
  nAnexo_I         : currency;
  nAnexo_II        : currency;
  nAnexo_III       : currency;
  nAnexo_IV        : currency;
  nSaldoCierre     : currency;
  nControl         : currency;
  objFecha         : TDateTimeEx;
  dImpTotalEmiNoEmTeso, dImpTotalEmiNoEmNoTeso: Extended;
begin
  dtFechaConciliado := CustomDlgs.InputBoxDate('Conciliación', 'Conciliado al:', 0);
  if dtFechaConciliado = 0 then
    Exit;

  objFecha := TDateTimeEx.Create(dtFechaConciliado, False);
  try
    if dbgCuentas.SelectedRows.Count > 0 then
    begin
      rptPresFormal := TfrmRptPresFormal.Create(Self);
      try
        //rptPresFormal.QRComposite.PrinterSetup ;
        for i := 0 to dbgCuentas.SelectedRows.Count - 1 do
        begin
          if not pbExportarAnexosReporteConciliacion then
            begin
              sdqCuentas.GotoBookmark(Pointer(dbgCuentas.SelectedRows.Items[i]));
              rptPresFormal.sdqANEXOS.Close;

              // Toma el nombre de la Grilla y Concatena el Nro de cuenta.
              rptPresFormal.QRLNroCuenta.Caption := sdqCuentas.FieldByName('BA_NOMBRE').AsString + ' (' + sdqCuentas.FieldByName('CB_NUMERO').AsString + ')';
              rptPresFormal.QRLFechaConciliacion.Caption := DateToStr(dtFechaConciliado);

              // ANEXOS...
              rptPresFormal.QRLNroCuentaANEXO.Caption := sdqCuentas.FieldByName('BA_NOMBRE').AsString + ' (' + sdqCuentas.FieldByName('CB_NUMERO').AsString + ')';
              rptPresFormal.QRLFechaConciliacionANEXO.Caption := DateToStr(dtFechaConciliado);

              // SALDO CONTABLE AL CIERRE.
              sSql := 'SELECT SUM(SC_MONTO)' +
                      '  FROM V_OSC_SALDOCONTABLEBANCO' +
                      ' WHERE SC_IDCUENTABANCARIA = :CUENTA' +
                      '   AND SC_FECHA <= :FECHA';

              nSaldoContable := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').AsInteger, objFecha]);
              rptPresFormal.QRLImpSaldoContable.Caption := CurrToStr(nSaldoContable);

              // ANEXO I
              sSql := 'SELECT SUM(EB_IMPORTE) ' +
                        'FROM OCO_CODIGOCONCILIACION, OCE_CODIGOEXTRACTO, ' +
                             'OEB_EXTRACTOBANCO, OCB_CONCILIACIONBANCARIA ' +
                       'WHERE EB_DEBITOCREDITO = ''D'' ' +
                         'AND EB_CODOPERACION = CE_CODIGO (+) ' +
                         'AND CE_IDCODIGOCONC = CO_ID (+) ' +
                         'AND EB_IDCUENTABANCARIA = :CUENTA ' +
                         'AND EB_ID = CB_IDEXTRACTO (+) ' +
                         'AND EB_FECHABAJA IS NULL ' +
                         'AND EB_FECHAMOVIMIENTO <= :FECHA ' +
                         'AND NVL(TRUNC(CB_FECHACONTABLE), SYSDATE) > :FECHA';

              nAnexo_I := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').AsInteger, objFecha]);
              rptPresFormal.QRLImpANEXO_I.Caption := CurrToStr(nAnexo_I);


              // ANEXO II
              sSql := 'SELECT SUM(EB_IMPORTE) ' +
                        'FROM OCO_CODIGOCONCILIACION, OCE_CODIGOEXTRACTO, ' +
                             'OEB_EXTRACTOBANCO, OCB_CONCILIACIONBANCARIA ' +
                       'WHERE EB_DEBITOCREDITO = ''C'' ' +
                         'AND EB_CODOPERACION = CE_CODIGO (+) ' +
                         'AND CE_IDCODIGOCONC = CO_ID (+) ' +
                         'AND EB_IDCUENTABANCARIA = :CUENTA ' +
                         'AND EB_ID = CB_IDEXTRACTO (+) ' +
                         'AND EB_FECHABAJA IS NULL ' +
                         'AND EB_FECHAMOVIMIENTO <= :FECHA ' +
                         'AND NVL(TRUNC(CB_FECHACONTABLE), SYSDATE) > :FECHA';

              nAnexo_II := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').AsInteger, objFecha]);
              rptPresFormal.QRLImpANEXO_II.Caption := CurrToStr(nAnexo_II);

              // ANEXO III
              sSql := 'SELECT SUM(IMPORTE)' +
                      '  FROM (SELECT SC_DEBITO IMPORTE' +
                      '          FROM ART.V_OSC_SALDOCONTABLEBANCO, OCB_CONCILIACIONBANCARIA' +
                      '         WHERE SC_DEBITO IS NOT NULL' +
                      '           AND SC_TIPOCOMP <> ''01''' +
                      '           AND SC_IDCUENTABANCARIA = :CUENTA' +
                      '           AND SC_FECHA <= :FECHA' +
                      '           AND SC_ID = CB_IDMOVIMIENTO(+)' +
                      '           AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :FECHA)';

              nAnexo_III := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').AsInteger, objFecha]);
              rptPresFormal.QRLImpANEXO_III.Caption := CurrToStr(nAnexo_III);

              // ANEXO IV
              sSql := 'SELECT SUM(IMPORTE) ' +
                        'FROM (SELECT SC_CREDITO IMPORTE ' +
                                'FROM ART.V_OSC_SALDOCONTABLEBANCO, OCB_CONCILIACIONBANCARIA ' +
                               'WHERE SC_CREDITO IS NOT NULL ' +
                                 'AND SC_TIPOCOMP <> ''01'' ' +
                                 'AND SC_IDCUENTABANCARIA = :CUENTA ' +
                                 'AND SC_FECHA <= :FECHA ' +
                                 'AND SC_ID = CB_IDMOVIMIENTO(+) ' +
                                 'AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :FECHA)';

              nAnexo_IV := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').AsInteger, objFecha]);
              rptPresFormal.QRLImpANEXO_IV.Caption  := CurrToStr(nAnexo_IV);

              // Saldo de Extracto al Cierre.
              sSql := 'SELECT SUM(DECODE(EB_DEBITOCREDITO, ''C'', 1, ''D'', -1)*EB_IMPORTE) ' +
                        'FROM OEB_EXTRACTOBANCO ' +
                       'WHERE EB_IDCUENTABANCARIA = :CUENTA ' +
                         'AND EB_FECHAMOVIMIENTO <= :FECHA';

              nSaldoCierre := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').AsInteger, objFecha]);
              rptPresFormal.QRLImpSaldoCierre.Caption  := CurrToStr(nSaldoCierre);


              // Control de Sumas.
              nControl := nSaldoContable - nAnexo_I + nAnexo_II - nAnexo_III + nAnexo_IV - nSaldoCierre;
              rptPresFormal.QRLImpControl.Caption  := CurrToStr(nControl);


              // Total cheques Emitidos y no Entregados No Teso..
              sSQL := 'SELECT NVL(SUM(CE_MONTO), 0) ' +
                        'FROM CTB_TABLAS, OMB_MOVIMIENTOBANCO, OCB_CONCILIACIONBANCARIA, RCE_CHEQUEEMITIDO ' +
                       'WHERE CE_IDCUENTABANCARIA = :CUENTA ' +
                         'AND MB_IDCOMP = CE_ID ' +
                         'AND MB_ID = CB_IDMOVIMIENTO(+) ' +
                         'AND CE_SITUACION = TB_CODIGO ' +
                         'AND TB_CLAVE = ''SITCH'' ' +
                         'AND UPPER(CE_METODOPAGO) = ' + SqlValue(UpperCase(MP_CHEQUE)) + ' ' +
                         'AND MB_CREDITO IS NOT NULL ' +
                         'AND NVL(TRUNC(CB_FECHACONTABLE), ACTUALDATE+1) > :FECHA ' +
                         'AND CE_FECHACHEQUE <= :FECHA ' +
                         'AND MB_FECHA <= :FECHA ' +
                         'AND DECODE(CE_ESTADO, ''01'', SYSDATE, CE_FECHAESTADO) > :FECHA ' +
                         'AND CONT.GET_HISTORICOCHEQUE(CE_ID, ''S'', :FECHA) IN (''C'', ''D'', ''B'') ' +
                         'AND '''' || MB_TIPOCOMP = ''3''';

              dImpTotalEmiNoEmNoTeso := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').asInteger, objFecha, objFecha, objFecha]);
              rptPresFormal.QRLImpTotalEmiNoEmNoTeso.Caption := FloatToStr(dImpTotalEmiNoEmNoTeso);

              // Total cheques Emitidos y no Entregados Teso..
              sSQL := 'SELECT NVL (SUM (CE_MONTO), 0) ' +
                        'FROM CTB_TABLAS, OMB_MOVIMIENTOBANCO, OCB_CONCILIACIONBANCARIA, RCE_CHEQUEEMITIDO ' +
                       'WHERE CE_IDCUENTABANCARIA = :CUENTA ' +
                         'AND MB_IDCOMP = CE_ID ' +
                         'AND MB_ID = CB_IDMOVIMIENTO(+) ' +
                         'AND CE_SITUACION = TB_CODIGO ' +
                         'AND TB_CLAVE = ''SITCH'' ' +
                         'AND UPPER(CE_METODOPAGO) = ' + SqlValue(UpperCase(MP_CHEQUE)) + ' ' +
                         'AND MB_CREDITO IS NOT NULL ' +
                         'AND NVL(TRUNC(CB_FECHACONTABLE), ACTUALDATE+1) > :FECHA ' +
                         'AND CE_FECHACHEQUE <= :FECHA ' +
                         'AND MB_FECHA <= :FECHA ' +
                         'AND DECODE(CE_ESTADO, ''01'', SYSDATE, CE_FECHAESTADO) > :FECHA ' +
                         'AND CONT.GET_HISTORICOCHEQUE(CE_ID, ''S'', :FECHA) = ''P'' ' +
                         'AND '''' || MB_TIPOCOMP = ''3''';

              dImpTotalEmiNoEmTeso := ValorSqlExtendedEx(sSql, [sdqCuentas.FieldByName('CB_ID').asInteger, objFecha, objFecha, objFecha]);
              rptPresFormal.QRLImpTotalEmiNoEmTeso.Caption := FloatToStr(dImpTotalEmiNoEmTeso);

              rptPresFormal.QRLImpTotalEmiNoEmi.Caption := FloatToStr(dImpTotalEmiNoEmNoTeso + dImpTotalEmiNoEmTeso);

              rptPresFormal.sdqANEXOS.ParamByName('pFecha').AsDateTime := dtFechaConciliado;
              rptPresFormal.sdqANEXOS.ParamByName('pCUENTA').AsInteger := sdqCuentas.FieldByName('CB_ID').AsInteger;
              rptPresFormal.sdqANEXOS.Open;

              rptPresFormal.QRComposite.Preview;
            end
          else    // se exportan los anexos
            begin
              with sdqAnexosReporteConc do
                begin
                  SQL.Text := rptPresFormal.sdqANEXOS.SQL.Text;
                  ParamByName('pFecha').AsDateTime := dtFechaConciliado;
                  ParamByName('pCUENTA').AsInteger := sdqCuentas.FieldByName('CB_ID').AsInteger;
                end;
              OpenQuery(sdqAnexosReporteConc);

              ExportDialogAnexosReporteConc.Title := 'ANEXOS / ' + sdqCuentas.FieldByName('BA_NOMBRE').AsString + ' (' + sdqCuentas.FieldByName('CB_NUMERO').AsString + ') - CONCILIACION AL: ' + DateToStr(dtFechaConciliado);

              mnuAnexosReportedeConciliacion.Enabled := False;
              try
                try
                  ExportDialogAnexosReporteConc.Execute;
                finally
                  ExportDialogAnexosReporteConc.Fields.Clear;
                end;
              finally
                mnuAnexosReportedeConciliacion.Enabled := True;
              end;
            end;
        end;
      finally
        rptPresFormal.Free;
        fpCuentas.ModalResult := mrOk; // Cierra el Dialogo
      end;
    end else
      InvalidMsg(dbgCuentas, 'Debe seleccionar al menos una fila.')
  finally
    objFecha.Free;
  end;
end;

procedure TfrmConciliacionBancaria.ItemGrillaClick(Sender: TObject);
begin
  if ActiveControl = dbgSaldo then
  begin
    QueryPrint.DataSource := dsSaldo;
    QueryPrint.Title.Text := Caption + ' - ' + pnlSaldoContableTitulo.Caption;
    PrintResults;
  end
  else if ActiveControl = dbgExtracto then
  begin
    QueryPrint.DataSource := dsExtracto;
    QueryPrint.Title.Text := Caption + ' - ' + pnlExtactoBancarioTitulo.Caption;
    PrintResults;
  end
  else
    InvalidHint(nil, 'Debe ubicar el foco sobre la grilla que desea imprimir.');
end;

procedure TfrmConciliacionBancaria.ItemReportesConciliacionClick(Sender: TObject);
begin
  pbExportarAnexosReporteConciliacion := (Sender = mnuAnexosReportedeConciliacion);

  btnAceptar.OnClick := btPresFormalAceptarClick;
  sdqCuentas.Open;
  if fpCuentas.ShowModal = mrOk then
    tbRefrescarClick(nil);
  btnAceptar.OnClick := btnAceptarClick;
end;

procedure TfrmConciliacionBancaria.OnfraCuentaBancariaChange(Sender: TObject);
begin
  if not fraBanco.IsSelected and fraCuentaBancaria.IsSelected then
    fraBanco.Value := StrToInt(fraCuentaBancaria.cmbDescripcion.Cells[4, fraCuentaBancaria.cmbDescripcion.Row]);
end;

procedure TfrmConciliacionBancaria.sdqSaldoAfterOpen(DataSet: TDataSet);
begin
  with Dataset do
  begin
    TFloatField(FieldByName('SC_DEBITO')).Currency  := True;
    TFloatField(FieldByName('SC_CREDITO')).Currency := True;
  end;
end;

procedure TfrmConciliacionBancaria.sdqExtractoAfterOpen(DataSet: TDataSet);
begin
  with Dataset do
  begin
    TFloatField(FieldByName('DEBITO')).Currency  := True;
    TFloatField(FieldByName('CREDITO')).Currency := True;
  end;
end;

procedure TfrmConciliacionBancaria.lbBalanceTotalesChange(Sender: TObject);
begin
  if MontoBalance > 0 then
    lbBalanceTotales.Font.Color := clGreen
  else if MontoBalance < 0 then
    lbBalanceTotales.Font.Color := clRed
  else
    lbBalanceTotales.Font.Color := clGray;
end;

procedure TfrmConciliacionBancaria.btnAceptarConceptosClick(Sender: TObject);
begin
  Verificar(fraConceptos.IsEmpty, fraConceptos.edCodigo, 'Debe seleccionar una opción para continuar.');
  fpConceptos.ModalResult := mrOk;
end;

procedure TfrmConciliacionBancaria.mnuSaldoContableClick(Sender: TObject);
begin
  ExportDialogSaldoContable.Fields.Assign(dbgSaldo.Columns);

  if sdqSaldo.Active and (not sdqSaldo.IsEmpty) then
  begin
     tbExportar.Enabled := False;
     try
       ExportDialogSaldoContable.Execute;
     finally
       tbExportar.Enabled := True;
     end;
  end;
end;

procedure TfrmConciliacionBancaria.mnuExtractoBancarioClick(Sender: TObject);
begin
  ExportDialogExtractoBancario.Fields.Assign(dbgExtracto.Columns);

  if sdqExtracto.Active and (not sdqExtracto.IsEmpty) then
  begin
     tbExportar.Enabled := False;
     try
       ExportDialogExtractoBancario.Execute;
     finally
       tbExportar.Enabled := True;
     end;
  end;
end;

procedure TfrmConciliacionBancaria.tbEventoPosteriorClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqExtracto.Active or sdqExtracto.Eof, nil, 'Debe seleccionar algún extracto');
  if not MsgAsk('¿ Realmente desea agregar un evento posterior ?') then
    Exit;

  edNumeroOP.Clear;
  edFecha.Clear;
  fpNumeroCheque.ModalResult := mrCancel;
  if fpNumeroCheque.ShowModal = mrCancel then
    Exit;

  // Actualizo el Nº de cheque..
  sSql := 'UPDATE OEB_EXTRACTOBANCO ' +
          '   SET EB_NROCOMP = :NroComp ' +
          ' WHERE EB_ID = :Id';
  EjecutarSqlEx(sSql, [edNumeroOP.Text, sdqExtracto.FieldByName('EB_ID').AsInteger]);

  // Valido..
  sSql := 'SELECT COUNT(*)' +
          '  FROM RCE_CHEQUEEMITIDO, OMB_MOVIMIENTOBANCO' +
          ' WHERE MB_TIPOCOMP = ''3''' +
          '   AND MB_IDCOMP = CE_ID' +
          '   AND MB_CONCILIADO <> ''S''' +
          '   AND CE_ORDENPAGO = :OrdenPago';

  if ValorSqlIntegerEx(sSql, [edNumeroOP.Value]) > 0 then
  begin
    MessageDlg('Existen otros movimientos NO conciliados para este cheque.', mtWarning, [mbOK], 0);
    Exit;
  end;

  sSql := 'SELECT MB_ID' +
          '  FROM RCE_CHEQUEEMITIDO, OMB_MOVIMIENTOBANCO' +
          ' WHERE MB_TIPOCOMP = ''3''' +
          '   AND MB_IDCOMP = CE_ID' +
          '   AND MB_CONCILIADO = ''S''' +
          '   AND CE_ORDENPAGO = :OrdenPago';

  with GetQueryEx(sSql, [edNumeroOP.Value]) do
  try
    if Eof then
    begin
      MessageDlg('El cheque original tiene que estar conciliado.', mtWarning, [mbOK], 0);
      Exit;
    end;

    sSql := 'INSERT INTO OMB_MOVIMIENTOBANCO (MB_ID, MB_IDCUENTABANCARIA, MB_IDCOMP, MB_CREDITO, MB_USUALTA, MB_FECHAALTA,' +
            '       MB_FECHA, MB_IDCODIGOCONC, MB_TIPOCOMP)' +
            'SELECT SEQ_OMB_ID.NEXTVAL, MB_IDCUENTABANCARIA, MB_IDCOMP, MB_CREDITO, :UsuAlta, SYSDATE, :Fecha, ' +
            '       MB_IDCODIGOCONC, MB_TIPOCOMP' +
            '  FROM OMB_MOVIMIENTOBANCO' +
            ' WHERE MB_ID = :Id';
    EjecutarSqlEx(sSql, [Sesion.UserID, TDateTimeEx.Create(edFecha.Date), FieldByName('MB_ID').AsInteger]);

    sSql := 'INSERT INTO OMB_MOVIMIENTOBANCO (MB_ID, MB_IDCUENTABANCARIA, MB_IDCOMP, MB_DEBITO, MB_USUALTA, MB_FECHAALTA,' +
            '       MB_FECHA, MB_IDCODIGOCONC, MB_TIPOCOMP)' +
            'SELECT SEQ_OMB_ID.NEXTVAL, MB_IDCUENTABANCARIA, MB_IDCOMP, MB_CREDITO, :UsuAlta, SYSDATE, :Fecha, ' +
            '       MB_IDCODIGOCONC, MB_TIPOCOMP' +
            '  FROM OMB_MOVIMIENTOBANCO' +
            ' WHERE MB_ID = :Id';
    EjecutarSqlEx(sSql, [Sesion.UserID, TDateTimeEx.Create(edFecha.Date), FieldByName('MB_ID').AsInteger]);

    sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
            '   SET CE_DEBITADO = ''N'', ' +
            '       CE_FECHADEBITADO = NULL, ' +
            '       CE_SITUACION = ''34'', ' +
            '       CE_FECHASITUACION = TRUNC(SYSDATE), ' +
            '       CE_USUSITUACION = :USER ' +
            ' WHERE CE_ORDENPAGO = :NroComp';
    EjecutarSqlEx(sSql, [Sesion.UserId, edNumeroOP.Value]);

    MessageDlg('El evento ha sido agregado con éxito.', mtWarning, [mbOK], 0);
  finally
    Free;
  end;
end;

procedure TfrmConciliacionBancaria.sdqExtractoAfterScroll(DataSet: TDataSet);
begin
//  with sdqExtracto do
//    tbEventoPosterior.Enabled := not FieldByName('EB_NROCOMP').IsNull;
end;

procedure TfrmConciliacionBancaria.fpNumeroChequeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    fpNumeroCheque.ModalResult := mrCancel;
end;

procedure TfrmConciliacionBancaria.tbReclasificacionChequesClick(Sender: TObject);
begin
  ImpoExpoWizard('CRCHP');
end;

function TfrmConciliacionBancaria.GetSqlCuadradaBancos(): String;
begin
  Result :=
      'SELECT   BANCO, CUENTA, CUENTACONTABLE, SALDO_CONTABLE, DEBITO_EXTRACTO, ' +
      '         CREDITO_EXTRACTO, DEBITO_CONTABLE, CREDITO_CONTABLE, SALDO_EXTRACTO, ' +
      '         CHEQUES_NO_ENTREGADOS, ' +
      '         DECODE (SIGN (SALDO_CONTABLE + CHEQUES_NO_ENTREGADOS), ' +
      '                 1, SALDO_CONTABLE + CHEQUES_NO_ENTREGADOS, ' +
      '                 0) NUEVO_SALDO_CONTABLE, ' +
      '         DECODE (SLAP, ''S'', CHEQUES_NO_ENTREGADOS, 0) SLAP, ' +
      '         DECODE (ACREEDORES, ' +
      '                 ''S'', CHEQUES_NO_ENTREGADOS, ' +
      '                 0) ACREEDORES_EXIGIBLES, ' +
      '         DECODE (SIGN (SALDO_CONTABLE + CHEQUES_NO_ENTREGADOS), ' +
      '                 1, 0, ' +
      '                 SALDO_CONTABLE + CHEQUES_NO_ENTREGADOS ' +
      '                ) ACREEDORES_BANCARIOS ' +
      '    FROM (SELECT BA_NOMBRE BANCO, ZCB.CB_NUMERO CUENTA, ' +
      '                 SUBSTR (ZCB.CB_CUENTACONTABLE, 3, 6) CUENTACONTABLE, ' +
      '                 ZCB.CB_SLAP SLAP, ZCB.CB_ACREEDORES ACREEDORES, ' +
      '                 (SELECT NVL (SUM (SC_MONTO), 0) ' +
      '                    FROM ART.V_OSC_SALDOCONTABLEBANCO ' +
      '                   WHERE SC_IDCUENTABANCARIA = ZCB.CB_ID ' +
      '                     AND SC_FECHA <= :Fecha) SALDO_CONTABLE, ' +
      '                 (SELECT NVL (SUM (EB_IMPORTE), 0) ' +
      '                    FROM OCO_CODIGOCONCILIACION, ' +
      '                         OCE_CODIGOEXTRACTO, ' +
      '                         OEB_EXTRACTOBANCO, ' +
      '                         OCB_CONCILIACIONBANCARIA ' +
      '                   WHERE EB_DEBITOCREDITO = ''D'' ' +
      '                     AND EB_CODOPERACION = CE_CODIGO(+) ' +
      '                     AND CE_IDCODIGOCONC = CO_ID(+) ' +
      '                     AND EB_IDCUENTABANCARIA = ZCB.CB_ID ' +
      '                     AND EB_ID = CB_IDEXTRACTO(+) ' +
      '                     AND EB_FECHABAJA IS NULL ' +
      '                     AND EB_FECHAMOVIMIENTO <= :Fecha ' +
      '                     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :Fecha) DEBITO_EXTRACTO, ' +
      '                 (SELECT NVL (SUM (EB_IMPORTE), 0) ' +
      '                    FROM OCO_CODIGOCONCILIACION, ' +
      '                         OCE_CODIGOEXTRACTO, ' +
      '                         OEB_EXTRACTOBANCO, ' +
      '                         OCB_CONCILIACIONBANCARIA ' +
      '                   WHERE EB_DEBITOCREDITO = ''C'' ' +
      '                     AND EB_CODOPERACION = CE_CODIGO(+) ' +
      '                     AND CE_IDCODIGOCONC = CO_ID(+) ' +
      '                     AND EB_IDCUENTABANCARIA = ZCB.CB_ID ' +
      '                     AND EB_ID = CB_IDEXTRACTO(+) ' +
      '                     AND EB_FECHABAJA IS NULL ' +
      '                     AND EB_FECHAMOVIMIENTO <= :Fecha ' +
      '                     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :Fecha) CREDITO_EXTRACTO, ' +
      '                 (SELECT NVL (SUM (SC_DEBITO), 0) ' +
      '                    FROM ART.V_OSC_SALDOCONTABLEBANCO, ' +
      '                         OCB_CONCILIACIONBANCARIA ' +
      '                   WHERE SC_DEBITO IS NOT NULL ' +
      '                     AND SC_TIPOCOMP <> ''01'' ' +
      '                     AND SC_IDCUENTABANCARIA = ZCB.CB_ID ' +
      '                     AND SC_FECHA <= :Fecha ' +
      '                     AND SC_ID = CB_IDMOVIMIENTO(+) ' +
      '                     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :Fecha) DEBITO_CONTABLE, ' +
      '                 (SELECT NVL (SUM (SC_CREDITO), 0) IMPORTE ' +
      '                    FROM ART.V_OSC_SALDOCONTABLEBANCO, ' +
      '                         OCB_CONCILIACIONBANCARIA ' +
      '                   WHERE SC_CREDITO IS NOT NULL ' +
      '                     AND SC_TIPOCOMP <> ''01'' ' +
      '                     AND SC_IDCUENTABANCARIA = ZCB.CB_ID ' +
      '                     AND SC_FECHA <= :Fecha ' +
      '                     AND SC_ID = CB_IDMOVIMIENTO(+) ' +
      '                     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :Fecha) CREDITO_CONTABLE, ' +
      '                 (SELECT NVL (SUM (  DECODE (EB_DEBITOCREDITO, ' +
      '                                             ''C'', 1, ' +
      '                                             ''D'', -1 ' +
      '                                            ) ' +
      '                                   * EB_IMPORTE ' +
      '                                  ), ' +
      '                              0 ' +
      '                             ) ' +
      '                    FROM OEB_EXTRACTOBANCO ' +
      '                   WHERE EB_IDCUENTABANCARIA = ZCB.CB_ID ' +
      '                     AND EB_FECHAMOVIMIENTO <= :Fecha) SALDO_EXTRACTO, ' +
      '                 (SELECT NVL (SUM (CE_MONTO), 0) ' +
      '                    FROM ART.CTB_TABLAS, ' +
      '                         OMB_MOVIMIENTOBANCO, ' +
      '                         OCB_CONCILIACIONBANCARIA, ' +
      '                         RCE_CHEQUEEMITIDO ' +
      '                   WHERE CE_IDCUENTABANCARIA = ZCB.CB_ID ' +
      '                     AND MB_IDCOMP = CE_ID ' +
      '                     AND MB_ID = CB_IDMOVIMIENTO(+) ' +
      '                     AND CE_SITUACION = TB_CODIGO ' +
      '                     AND TB_CLAVE = ''SITCH'' ' +
      '                     AND UPPER (CE_METODOPAGO) = ' + SQLVALUE(UPPERCASE(MP_CHEQUE)) + ' ' +
      '                     AND MB_CREDITO IS NOT NULL ' +
      '                     AND NVL (TRUNC (CB_FECHACONTABLE), ART.ACTUALDATE + 1) > :Fecha ' +
      '                     AND CE_FECHACHEQUE <= :Fecha ' +
      '                     AND MB_FECHA <= :Fecha ' +
      '                     AND '''' || MB_TIPOCOMP = ''3'' ' +
      '                     AND DECODE (CE_ESTADO, ''01'', SYSDATE, CE_FECHAESTADO) > :Fecha ' +
      '                     AND ART.CONT.GET_HISTORICOCHEQUE(CE_ID, ''S'', :Fecha) In (''C'', ''D'', ''P'', ''B'')) CHEQUES_NO_ENTREGADOS ' +
      '            FROM ZBA_BANCO ZBA, ZCB_CUENTABANCARIA ZCB ' +
      '           WHERE ZBA.BA_ID = ZCB.CB_IDBANCO AND ZCB.CB_FECHABAJA IS NULL AND ZCB.CB_CONCILIACION = ''S'') ' +
      'ORDER BY 1, 2 ';
end;

procedure TfrmConciliacionBancaria.ItemCuadradadeBancosClick(Sender: TObject);
var
  rptCuadrada: TfrmRptCuadrada;
  dtFechaRef: TDateTime;
begin
  dtFechaRef := CustomDlgs.InputBoxDate('Cuadrada de Bancos', 'Con fecha de referencia:', 0);
  if dtFechaRef = 0 then
    Exit;

  rptCuadrada := TfrmRptCuadrada.Create(Self);
  try
    rptCuadrada.lblTitulo.Caption := 'SITUACION FINANCIERA AL ' + DateToStr (dtFechaRef);
    rptCuadrada.sdqConsulta.Close;
    rptCuadrada.sdqConsulta.Sql.Clear;
    rptCuadrada.sdqConsulta.Sql.Add (GetSqlCuadradaBancos());
    rptCuadrada.sdqConsulta.ParamByName('Fecha').asDateTime := dtFechaRef;
    rptCuadrada.sdqConsulta.Open;

    rptCuadrada.qrpCuadrada.Preview;
  finally
    rptCuadrada.Free;
  end;
end;

procedure TfrmConciliacionBancaria.tbEmbargosClick(Sender: TObject);
var
  sSql: String;
begin
  IsRegistroSeleccionadoExtracto;
//  Verificar(sdqExtracto.FieldByName('DEBITO').IsNull, nil, 'Debe seleccionar un débito de la grilla "Extracto Bancario".');

	if not sdqExtracto.FieldByName('DEBITO').IsNull then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM LEM_EMBARGO ' +
      ' WHERE EM_IDEXTRACTO = :IdExtracto ' +
        ' AND EM_FECHABAJA IS NULL';

    Verificar(ExisteSqlEx(sSql, [sdqExtracto.FieldByName('EB_ID').AsInteger]), nil, 'El extracto bancario ya posee un embargo.');

    with TfrmAltaEmbargos.Create(Self) do
    try
      IdExtracto       := sdqExtracto.FieldByName('EB_ID').AsInteger;
      IdBanco          := sdqExtracto.FieldByName('BA_ID').AsInteger;
      IdCuentaBancaria := sdqExtracto.FieldByName('CB_ID').AsInteger;
      Importe          := sdqExtracto.FieldByName('DEBITO').AsFloat;
      Fecha            := sdqExtracto.FieldByName('FECHA_MOV').AsDateTime;
      EsConcilBancaria := True;

      ShowModal;
    finally
      Free;
    end;
  end;

  if not sdqExtracto.FieldByName('CREDITO').IsNull then
  begin
    with TfrmAltaDevolucionEmbargos.Create(Self) do
    try
      IdExtracto       := sdqExtracto.FieldByName('EB_ID').AsInteger;
      IdBanco          := sdqExtracto.FieldByName('BA_ID').AsInteger;
      IdCuentaBancaria := sdqExtracto.FieldByName('CB_ID').AsInteger;
      Importe          := sdqExtracto.FieldByName('CREDITO').AsFloat;
      Fecha            := sdqExtracto.FieldByName('FECHA_MOV').AsDateTime;
      EsConcilBancaria := True;

      ShowModal;
    finally
      Free;
    end;
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmConciliacionBancaria.IsRegistroSeleccionadoExtracto;
begin
  Verificar(dbgExtracto.SelectedRows.Count = 0, nil, 'Debe seleccionar un registro de la grilla "Extracto Bancario".');
  Verificar(dbgExtracto.SelectedRows.Count <> 1, nil, 'Debe seleccionar solo un registro de la grilla "Extracto Bancario".');
end;

procedure TfrmConciliacionBancaria.mnuNotas_CartaClick(Sender: TObject);
begin
  IsRegistroSeleccionadoExtracto;

  DoImprimirNotasBanco_Carta(sdqExtracto.FieldByName('EB_ID').AsInteger);
end;

procedure TfrmConciliacionBancaria.mnuNotas_ComprobanteClick(Sender: TObject);
begin
  IsRegistroSeleccionadoExtracto;

  DoImprimirNotasBanco_Comprobante(sdqExtracto.FieldByName('EB_ID').AsInteger);
end;

procedure TfrmConciliacionBancaria.btnAceptar2Click(Sender: TObject);
begin
  Verificar(edNumeroOP.IsEmpty, edNumeroOP, 'Debe ingresar el nro. de orden de pago');
  Verificar(edFecha.Date = 0, edFecha, 'Debe ingresar la fecha');
  Verificar(edFecha.Date>DBDate, edFecha, 'La fecha debe ser menor o igual a la fecha actual');

  fpNumeroCheque.ModalResult := mrOk;
end;

procedure TfrmConciliacionBancaria.tbRecursosExtraordinariosClick(Sender: TObject);
begin
  IsRegistroSeleccionadoExtracto;
  Verificar(sdqExtracto.FieldByName('CREDITO').IsNull, nil, 'Debe seleccionar un crédito de la grilla "Extracto Bancario".');

  with TfrmAltaRecursosExtraordinarios.Create(Self) do
    try
      IdExtracto       := sdqExtracto.FieldByName('EB_ID').AsInteger;
      IdBanco          := sdqExtracto.FieldByName('BA_ID').AsInteger;
      IdCuentaBancaria := sdqExtracto.FieldByName('CB_ID').AsInteger;
      Importe          := sdqExtracto.FieldByName('CREDITO').AsFloat;
      Fecha            := sdqExtracto.FieldByName('FECHA_MOV').AsDateTime;
      EsConcilBancaria := True;
               
      ShowModal;
    finally
      Free;
    end;

  tbRefrescarClick(nil);
end;

procedure TfrmConciliacionBancaria.DoMoverProxReg(sdq: TSDQuery; dbg:TArtDBGrid; ProxReg: Boolean; var Pos: Integer);
var
  iCant: Integer;
begin
  iCant := dbg.SelectedRows.Count;

  if iCant >= 1 then
    begin
      if ProxReg then
        inc(pos)
      else
        dec(pos);

      if (pos >= 0) and (pos <= iCant-1) then
        sdq.GotoBookmark(pointer(dbg.SelectedRows.Items[pos]))
      else if pos < 0 then
        pos := 0
      else if pos > iCant-1 then
        pos := iCant-1;
    end;
end;

procedure TfrmConciliacionBancaria.btnUpSaldoContableClick(Sender: TObject);
var
  bProxReg: Boolean;
begin
  bProxReg := (Sender = btnDownSaldoContable);
  DoMoverProxReg(sdqSaldo, dbgSaldo, bProxReg, piPosSaldoCont);
end;

procedure TfrmConciliacionBancaria.btnUpExtractoBancClick(Sender: TObject);
var
  bProxReg: Boolean;
begin
  bProxReg := (Sender = btnDownExtractoBanc);
  DoMoverProxReg(sdqExtracto, dbgExtracto, bProxReg, piPosExtractoBanc);
end;

procedure TfrmConciliacionBancaria.DoLimpiarPosMover;
begin
  piPosSaldoCont    := -1;
  piPosExtractoBanc := -1;
end;

procedure TfrmConciliacionBancaria.tbConcTransfBAPROClick(Sender: TObject);
var
  sSql: String;
  Id: TTableId;
  iArchivo: Integer;
begin
  Verificar(dbgExtracto.SelectedRows.Count = 0, nil, 'Debe seleccionar un registro de la grilla "Extracto Bancario".');
  Verificar(dbgExtracto.SelectedRows.Count > 1, nil, 'Debe seleccionar solo un registro de la grilla "Extracto Bancario".');
	Verificar((sdqExtracto.FieldByName('CONCILIADO').AsString <> 'N'), dbgExtracto, 'El movimiento no debe estar conciliado.');

  iArchivo := InputBoxInteger('Archivo de Transferencias BAPRO', 'Ingrese el nro. de archivo', 0);
  if iArchivo >= 1 then
    begin
      sSql := 'SELECT NVL(SUM(MB_CREDITO), 0) ' +
                'FROM OMB_MOVIMIENTOBANCO ' +
               'WHERE ''''||MB_CONCILIADO = ''N'' ' +
                 'AND MB_TIPOCOMP = 3 ' +
                 'AND MB_IDCOMP IN (SELECT CE_ID ' +
                                     'FROM RCE_CHEQUEEMITIDO ' +
                                    'WHERE CE_IDARCHIVOBAPRO = :IDARCHIVO)';
      Verificar(CompareFloat2(ValorSqlExtendedEx(sSql, [iArchivo]), sdqExtracto.FieldByName('DEBITO').AsFloat) <> 0, nil, 'Los importes no coinciden.');

      BeginTrans;
      try
        Id := GetSecNextVal('SEQ_OCB_IDSELECCION');

        sSql := 'INSERT INTO OCB_CONCILIACIONBANCARIA(CB_ID, CB_IDEXTRACTO, CB_USUALTA, CB_FECHAALTA, CB_IDSELECCION, CB_FECHACONTABLE) ' +
                       'VALUES(SEQ_OCB_ID.NEXTVAL, :IdExtracto, :User, SYSDATE, :IdSeleccion, ACTUALDATE)';
        EjecutarSqlSTEx(sSql, [sdqExtracto.FieldByName('EB_ID').AsInteger, Sesion.UserId, Id]);

        sSql := 'INSERT INTO OCB_CONCILIACIONBANCARIA(CB_ID, CB_IDMOVIMIENTO, CB_USUALTA, CB_FECHAALTA, CB_IDSELECCION, CB_FECHACONTABLE) ' +
                       'SELECT SEQ_OCB_ID.NEXTVAL, MB_ID, :User, SYSDATE, :IdSeleccion, ACTUALDATE ' +
                         'FROM OMB_MOVIMIENTOBANCO ' +
                        'WHERE ''''||MB_CONCILIADO = ''N'' ' +
                          'AND MB_TIPOCOMP = 3 ' +
                          'AND MB_IDCOMP IN (SELECT CE_ID ' +
                                              'FROM RCE_CHEQUEEMITIDO ' +
                                             'WHERE CE_IDARCHIVOBAPRO = :idarchivo)';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, Id, iArchivo]);

        CommitTrans;
      except
        RollBack;
        raise;
      end;
    end;
end;

procedure TfrmConciliacionBancaria.mnuCuadradaBancosClick(Sender: TObject);
var
  dtFechaRef: TDateTime;
begin
  dtFechaRef := CustomDlgs.InputBoxDate('Cuadrada de Bancos', 'Con fecha de referencia:', 0);
  if dtFechaRef = 0 then
    Exit;

  sdqCuadradaBancos.SQL.Text := GetSqlCuadradaBancos();
  sdqCuadradaBancos.ParamByName('Fecha').asDateTime := dtFechaRef;
  OpenQuery(sdqCuadradaBancos);

  ExportDialogCuadradaBancos.Title := 'CUADRADA DE BANCOS - SITUACION FINANCIERA AL ' + DateToStr (dtFechaRef);

  mnuCuadradaBancos.Enabled := False;
  try
    try
      ExportDialogCuadradaBancos.Execute;
    finally
      ExportDialogCuadradaBancos.Fields.Clear;
    end;
  finally
    mnuCuadradaBancos.Enabled := True;
  end;
end;

procedure TfrmConciliacionBancaria.tbAnularRemesaClick(Sender: TObject);
var
  sCuerpo, sSql: String;
  IdMovBanco: TTableId;
begin
  Verificar(dbgSaldo.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un registro de la grilla "Saldo Contable".');
  Verificar(dbgSaldo.SelectedRows.Count > 1, nil, 'Debe seleccionar solo un registro de la grilla "Saldo Contable".');
  Verificar(sdqSaldo.FieldByName('SC_CODIGOCOMP').AsString <> '1', nil, 'El registro debe corresponder a una Remesa.');

  if MsgBox('¿Confirma la anulación de la remesa?', MB_YESNO+MB_ICONQUESTION ) = IDYES then
    begin
      IdMovBanco := sdqSaldo.FieldByName('SC_ID').AsInteger;

      sSql := 'SELECT 1 ' +
               'FROM RRM_REMESA ' +
              'WHERE RM_IDMOVBANCO = :IdMovBanco ' +
                'AND RM_MONTO > RM_MONTOSINIMPUTAR';

      if ExisteSqlEx(sSql, [IdMovBanco]) then
        begin
          BeginTrans;
          try
            sSql := 'UPDATE RRM_REMESA ' +
                       'SET RM_ANULAR = ''S'' ' +
                     'WHERE RM_IDMOVBANCO = :IdMovBanco';
            EjecutarSqlSTEx(sSql, [IdMovBanco]);

            sCuerpo := 'Se ha solicitado su autorización para anular una remesa ya imputada.' + CRLF +
                       'Por favor ingrese al sistema de Cobranzas.';

            SendByMailServer(Get_DireccionesEnvioMail('COBANULREM'),
               Sesion.UserId, 'Autorización de Anulación de Remesas', '',
               sCuerpo, False, False, False, Sesion.UserId, False);

            CommitTrans;
            MsgBox('Se ha solicitado la autorización para anular una remesa.', MB_OK + MB_ICONINFORMATION);
          except
            on E: Exception do
             begin
               RollBack;
               raise Exception.Create(E.Message + CRLF + 'Error al anular la remesa.');
             end;
          end;
        end
      else
        begin
          sSql := 'CONT.DO_ANULAREMESA(:IdMovBanco, :User);';
          EjecutarStoreEx(sSql, [IdMovBanco, Sesion.UserId]);

          MsgBox('Se ha anulado la remesa.', MB_OK + MB_ICONINFORMATION);
        end;

      sdqSaldo.Refresh;
      sdqExtracto.Refresh;
    end;
end;

end.


