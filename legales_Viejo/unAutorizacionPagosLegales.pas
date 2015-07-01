{-----------------------------------------------------------------------------
 Unit Name: unAutorizacionPagosLegales
 Author:    RACastro
 Date:      23-May-2006
 Purpose:   Permite autorizar las liquidaciones de pago y genera el lote de
            datos necesario para el módulo de Finacials
 History:
-----------------------------------------------------------------------------}
unit unAutorizacionPagosLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShortCutControl, Placemnt, artSeguridad, General, Cuit,
  CurrEdit, unfraUsuarios, StdCtrls, ToolEdit, DateComboBox, unEspera,
  unArtDBAwareFrame, unArtDbFrame, unArtFrame, DB, SDEngine, ImgList,
  RXSpin, ComCtrls, ToolWin, JvExControls, JvComponent, unSesion, JvEnterTab,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, SortDlg, QueryToFile, ExportDialog,
  FormPanel;

type
  TModoEjecucion = (meAutorizacion, meConsultaAprobados, meConsultaPagados);
  TTipoPago = (tpJuicio, tpMediacion);

  TfrmAutorizacionPagosLegales = class(TForm)
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    ShortCutControl: TShortCutControl;
    iStates: TImageList;
    sdqPagoLegal: TSDQuery;
    dsPagoLegal: TDataSource;
    pnDetalle: TPanel;
    EnterAsTab: TJvEnterAsTab;
    imCustom: TImageList;
    dbgPagos: TRxDBGrid;
    sdqPagoLegalAprobado: TSDQuery;
    dsPagoLegalAprobado: TDataSource;
    pnlAprobados: TPanel;
    Label1: TLabel;
    dbgPagosEfectuados: TRxDBGrid;
    tbAcciones: TToolBar;
    tbImprimirPagos: TToolButton;
    tbAprobacionPagos: TToolButton;
    tbSep1: TToolButton;
    tbGrabar: TToolButton;
    tbCancelar: TToolButton;
    tbSalir: TToolButton;
    pnlFiltros: TPanel;
    lblFechaAprobacion: TLabel;
    dtpFechaAprobacionDesde: TDateTimePicker;
    dtpFechaAprobacionHasta: TDateTimePicker;
    Label2: TLabel;
    spnCopias: TRxSpinEdit;
    Label3: TLabel;
    sduPagoLegal: TSDUpdateSQL;
    tbRefrescar: TToolButton;
    tbOrdenar: TToolButton;
    SortDialog1: TSortDialog;
    tbExportar: TToolButton;
    ExportDialog: TExportDialog;
    tbSep2: TToolButton;
    ToolButton1: TToolButton;
    pnlVerPagosBloqueados: TPanel;
    chkPagosBloqueados: TCheckBox;
    pnlColoresGrilla: TPanel;
    pnlColor0: TPanel;
    pnlColor1: TPanel;
    procedure MostrarLiquidacionesPendientesDeAprobar;
    procedure MostrarLiquidacionesAprobadas;
    procedure MostrarLiquidacionesPagadas;
    procedure Actualizar(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbImprimirPagosClick(Sender: TObject);
    procedure AprobarPago(Sender: TObject);
    procedure tbAprobacionPagosClick(Sender: TObject);
    procedure sdqPagoLegalAfterScroll(DataSet: TDataSet);
    procedure tbGrabarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tbCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFechaAprobacionDesdeChange(Sender: TObject);
    procedure SetearControles;
    procedure DefinirConsulta;
    procedure CargarFechasModo;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure sdqPagoLegalAfterOpen(DataSet: TDataSet);
    procedure tbExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPagosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FIdLiquidacion: Integer;
    FModoEjecucion : TModoEjecucion;
    sBarCode: String;
    FTipoPago: TTipoPago;
    procedure SetTipoPago(const Value: TTipoPago);
    function GetDescrTipoPago: String;
    function IsBloqueada: Boolean;
    function IsExclusiva: Boolean;
  public
    property TipoPago: TTipoPago          read FTipoPago             write SetTipoPago;
  end;

implementation

uses
  unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs,
  unPrincipal, DateUtils, unABMOrigenDemanda, unInstanciasJuicio, unConstLegales,
  UnRptLiquidacionAprobadasOtrosConceptos, unArchivosAsociados,
  unFrmFormulasCalculoReservaJuicios, unLegales,
  unManAbogados, unDmFinancials, unImpresionConceptoPago, StrFuncs,
  unReasignacionAbogado, UnFrmHistoricoReservas, UnFrmHistoricoEstados,
  unFijarImportesSentencia, unFrmPagoConceptosLegalesRegulados,
  UnRptLiquidacionAprobadas, UnRptLiquidacionesPagadas, unComunes, unDebug;

{$R *.dfm}

resourcestring
  LIQ_APROBADAS  = 'Liquidaciones de Pago Aprobadas';
  LIQ_POR_APROBAR= 'Liquidaciones de Pago Pendientes de Aprobación';
  LIQ_PAGADAS    = 'Liquidaciones de Pago Efectivizadas';

procedure TfrmAutorizacionPagosLegales.Actualizar(Sender: TObject);
begin
  sdqPagoLegal.Refresh;
  if sdqPagoLegalAprobado.Active then
  begin
    sdqPagoLegalAprobado.Refresh;
    pnlAprobados.Visible := not sdqPagoLegalAprobado.IsEmpty
  end;

  sdqPagoLegalAfterScroll(sdqPagoLegal);
end;

{-----------------------------------------------------------------------------
  Procedure: tbImprimirPagosClick
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Imprime una liquidación (modo autorización) o el listado de
              liquidaciones aprobadas o el listado de liquidaciones pagadas
              (modo consulta)
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.tbImprimirPagosClick(Sender: TObject);
var
  TipoListAprobOC: TTipoListadoAprobOC;
  sSql : String;
begin
  if sdqPagoLegal.IsEmpty then
    Exit;

  if (TipoPago = tpJuicio) then
    sSql := ' SELECT 1 '+
            '   FROM legales.lpl_pagolegal '+
            '  WHERE pl_id = '+SqlValue(sdqPagoLegal.FieldByName('id').AsInteger)+
            '    AND pl_duplicado = ''S'' '+
            '    AND pl_estadoduplicidad IS NULL '
  else if (TipoPago = tpMediacion) then
    sSql := ' SELECT 1 '+
            '   FROM legales.lpm_pagomediacion '+
            '  WHERE pm_id = '+SqlValue(sdqPagoLegal.FieldByName('id').AsInteger)+
            '    AND pm_duplicado = ''S'' '+
            '    AND pm_estadoduplicidad IS NULL ';
  Verificar(ExisteSql(sSql),tbImprimirPagos,'No se puede Imprimir tiene pendientes pagos duplicados');


  case FModoEjecucion of
    meAutorizacion: begin
      if (not dmPrincipal.sdbPrincipal.InTransaction) and
         (IsEmptyString (sdqPagoLegal.FieldByName('cuitcuil').AsString)) then
      begin
        BeginTrans(True);
        tbGrabar.Enabled := True;
        tbCancelar.Enabled := True;
      end;

      with TfrmImpresionConceptoPago.Create(self) do
      try
        case TipoPago of
          tpJuicio:
            Tipo := tJuicio;
          tpMediacion:
            Tipo := tMediacion;
        end;
        IdPago := sdqPagoLegal.FieldByName('id').AsInteger;

        Imprimir;
      finally
        free;
      end;

      Actualizar(Sender);
    end;

    meConsultaAprobados: begin
      (* este listado no lo utilizan
      with TRptLiquidacionAprobadas.Create(self) do
      try
        VistaPrevia(sdqPagoLegal, dtpFechaAprobacionDesde.Date,
                                  dtpFechaAprobacionHasta.Date,
                                  Trunc(spnCopias.Value));
      finally
        free;
      end;*)
      with TRptLiquidacionAprobadasOtrosConceptos.Create(self) do
      try
        case TipoPago of
          tpJuicio:
            TipoListAprobOC := tlAprobOC_Juicio;
          tpMediacion:
            TipoListAprobOC := tlAprobOC_Mediacion;
        else
          TipoListAprobOC := tlAprobOC_Mediacion;  // por un warning que daba...
        end;

        VistaPrevia(dtpFechaAprobacionDesde.Date,
                    dtpFechaAprobacionHasta.Date,
                    Trunc(spnCopias.Value), TipoListAprobOC);
      finally
        free;
      end;
    end;

    meConsultaPagados: begin
      if TipoPago = tpJuicio then
        begin
          with TRptLiquidacionesPagadas.Create(self) do
          try
            VistaPrevia(sdqPagoLegal, dtpFechaAprobacionDesde.Date,
                                      dtpFechaAprobacionHasta.Date,
                                      Trunc(spnCopias.Value));
          finally
            free;
          end;
        end;
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: AprobarPago
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.AprobarPago(Sender: TObject);
begin
  if not dmPrincipal.sdbPrincipal.InTransaction then
  begin
    BeginTrans(True);
    tbGrabar.Enabled := True;
    tbCancelar.Enabled := True;
  end;

  case TipoPago of
    tpJuicio:
      begin
        EjecutarSqlST('update legales.lpl_pagolegal ' +
                      '   set pl_usuarioaprobado = ' + SqlValue(Sesion.LoginName) + ', ' +
                      '       pl_fechaaprobado   = SYSDATE, ' +
                      '       pl_estado = ''E'' ' +
                      ' where pl_id = ' + SqlValue(FIdLiquidacion) +
                      '   and pl_estado <> ''E'''
                      , tmNone);

        // Desasigno el pago en legales.lir_importesreguladosjuicio si es un pago
        // previamente autorizado y anulado
        if (sdqPagoLegal.FieldByName('importeconretencion').AsCurrency < 0) or
           (sdqPagoLegal.FieldByName('importepago').AsCurrency < 0) then
        begin
          EjecutarSqlST('update legales.lir_importesreguladosjuicio ' +
                        '   set ir_nropago = null' +
                        ' where ir_nropago = ' + SqlValue(sdqPagoLegal.FieldByName('id').AsInteger)
                        , tmNone);
        end;

        if sdqPagoLegal.FieldByName('conpago').AsInteger = CONPAGO_EMBARGO then
          // Inserto en la lae_aplicacionembargo
          DoInsertarAplicacionEmbargo(sdqPagoLegal.FieldByName('importepago').AsFloat, sdqPagoLegal.FieldByName('idembargo').AsInteger);

        if sdqPagoLegal.FieldByName('conpago').AsInteger = CONPAGO_RECEXTR then
          // Inserto en la lar_aplicacionrecursoext..
          DoInsertarAplicacionRecExtraordinario(sdqPagoLegal.FieldByName('importepago').AsFloat, sdqPagoLegal.FieldByName('idjuiciomed').AsInteger);
      end;

    tpMediacion:
      begin
        EjecutarSqlST('update legales.lpm_pagomediacion ' +
                      '   set pm_usuarioaprobado = ' + SqlValue(Sesion.LoginName) + ', ' +
                      '       pm_fechaaprobado   = SYSDATE, ' +
                      '       pm_estado = ''E'' ' +
                      ' where pm_id = ' + SqlValue(FIdLiquidacion) +
                      '   and pm_estado <> ''E'''
                      , tmNone);

        // Desasigno el pago en legales.lir_importesreguladosjuicio si es un pago
        // previamente autorizado y anulado
        if (sdqPagoLegal.FieldByName('importeconretencion').AsCurrency < 0) or
           (sdqPagoLegal.FieldByName('importepago').AsCurrency < 0) then
        begin
          EjecutarSqlST('update legales.lim_importemediacion ' +
                        '   set im_nropago = null' +
                        ' where im_nropago = ' + SqlValue(sdqPagoLegal.FieldByName('id').AsInteger)
                        , tmNone);
        end;
      end;
  end;

  Actualizar(Sender);
end;

{-----------------------------------------------------------------------------
  Procedure: tbAprobacionPagosClick
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Registra la aprobación de una liquidación de pago
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.tbAprobacionPagosClick(Sender: TObject);
begin
  if sdqPagoLegal.IsEmpty then
    Exit;

  VerificarMultiple(['Aprobando Liquidación de Pago',
                     dbgPagos, IsCUIT(sdqPagoLegal.FieldByName('cuitcuil').AsString) or
                               IsCUIL(sdqPagoLegal.FieldByName('cuitcuil').AsString),
                               'No puede autorizarse el pago pués no hay un CUIT/CUIL válido.',
                     dbgPagos, not IsBloqueada(), 'Este pago tiene bloqueada su liquidación.'
                    ]);

  case TipoPago of
    tpJuicio:
      begin
        Verificar(not ExisteSql(
                    '  SELECT 1 '+
                    '    FROM legales.ljt_juicioentramite '+
                    '   WHERE jt_estadomediacion = ''J'' '+
                    '     AND jt_numerocarpeta = '+SqlValue(sdqPagoLegal.FieldByName('carpeta').AsString)+
                    '     AND EXISTS (SELECT 1 '+
                    '                   FROM legales.lod_origendemanda '+
                    '                  WHERE od_fechabaja IS NULL AND od_idjuicioentramite = jt_id)'), dbgPagos,
                    'No puede autorizarse el pago ya que no tiene Origen de Demanda.');

        Verificar(not ExisteSql(
                    '  SELECT 1 '+
                    '    FROM legales.ljt_juicioentramite '+
                    '   WHERE jt_estadomediacion = ''J'' '+
                    '     AND jt_numerocarpeta = '+SqlValue(sdqPagoLegal.FieldByName('carpeta').AsString)+
                    '     AND EXISTS (SELECT 1 '+
                    '                   FROM legales.lrt_reclamojuicioentramite '+
                    '                  WHERE rt_idjuicioentramite = jt_id AND rt_fechabaja IS NULL)'), dbgPagos,
                    'No puede autorizarse el pago ya que no tiene Motivo de Reclamo.');
      end;
  end;

  FIdLiquidacion := sdqPagoLegal.FieldByName('id').AsInteger;

  AprobarPago(Sender);
end;

procedure TfrmAutorizacionPagosLegales.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAutorizacionPagosLegales.sdqPagoLegalAfterScroll(DataSet: TDataSet);
begin
  tbAprobacionPagos.Enabled := (FModoEjecucion = meAutorizacion) and
                               (sdqPagoLegal.FieldByName('usuarioemision').AsString <> '')
end;

procedure TfrmAutorizacionPagosLegales.tbGrabarClick(Sender: TObject);
begin
  if not dmPrincipal.sdbPrincipal.InTransaction then
    Exit;

  if MessageDlg('¿Confirma todas las Liquidaciones/Autorizaciones de Pago realizadas?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    CommitTrans(true);

    tbGrabar.Enabled := False;
    tbCancelar.Enabled := False;

    sdqPagoLegalAprobado.Close;
    sdqPagoLegalAprobado.Params.ParamByName('fecharef').AsDateTime := DBDateTime;
    sdqPagoLegalAprobado.Open;
  except
    on E : Exception do begin
       raise Exception.Create('Error al registrar Aprobaciones de Pago: ' + E.Message);
    end;
  end;

  Actualizar(Sender)
end;

{-----------------------------------------------------------------------------
  Procedure: FormClose
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject; var Action: TCloseAction
  Result:    None
  Purpose:   Cierra la transacción de aprobación de pagos
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqPagoLegal.Close;
  Action := caFree;
end;

{-----------------------------------------------------------------------------
  Procedure: tbCancelarClick
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Cierra el form, cancelando la transacción activa si asi se indica
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dmPrincipal.sdbPrincipal.InTransaction then
  begin
    if MessageDlg('Se descartarán todas las Liquidaciones/Autorizaciones de Pago realizadas. ¿Continúa?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      Rollback(true)
    else
      CanClose := false
  end
end;

{-----------------------------------------------------------------------------
  Procedure: FormKeyPress
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject; var Key: Char
  Result:    None
  Purpose:   Cancela la transacción activa si así se indica
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.tbCancelarClick(Sender: TObject);
begin
  if dmPrincipal.sdbPrincipal.InTransaction and
    (MessageDlg('Se descartarán todas las Liquidaciones/Autorizaciones de Pago realizadas. ¿Continúa?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
  begin
    Rollback(true);
    tbGrabar.Enabled := False;
    tbCancelar.Enabled := False;
  end;

  Actualizar(Sender);
end;

{-----------------------------------------------------------------------------
  Procedure: MostrarLiquidacionesPendientesDeAprobar
  Author:    RACastro
  Date:      23-May-2006
  Arguments: None
  Result:    None
  Purpose:   Captura los caracteres para la lectura del código de barras
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.FormKeyPress(Sender: TObject; var Key: Char);
const
  BARCODE_LENGTH = 14;
begin
  Verificar(sdqPagoLegal.IsEmpty, dbgPagos, 'La grilla se encuentra vacía.');

  if (Key in ['0'..'9']) and (not dtpFechaAprobacionDesde.Focused) and (not dtpFechaAprobacionHasta.Focused) then
  begin
    if Length (sBarCode) < BARCODE_LENGTH then
      sBarCode := sBarCode + Key;

    if (FModoEjecucion = meAutorizacion) and (Length (sBarCode) >= BARCODE_LENGTH) then
    begin
      FIdLiquidacion := StrToInt(Copy(sBarCode, BARCODE_LENGTH-4, 5));

      if sdqPagoLegal.Locate('id', FIdLiquidacion, []) then
        tbAprobacionPagosClick(nil)
      else
        Verificar(True, dbgPagos, 'No se ha encontrado el pago.');

      sBarCode := '';
    end;

    Key := #0
  end
end;

{-----------------------------------------------------------------------------
  Procedure: MostrarLiquidacionesPendientesDeAprobar
  Author:    RACastro
  Date:      23-May-2006
  Arguments: None
  Result:    None
  Purpose:   Inicaliza el form en modo aprobación de pagos
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.MostrarLiquidacionesPendientesDeAprobar;
begin
  self.Caption := LIQ_POR_APROBAR + ' - ' + GetDescrTipoPago();
  FModoEjecucion := meAutorizacion;
  sBarCode := '';

  CargarFechasModo;
  DefinirConsulta;
  SetearControles;

  ShowModal;
end;

{-----------------------------------------------------------------------------
  Procedure: MostrarLiquidacionesAprobadas
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Inicaliza el form en modo consulta
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.MostrarLiquidacionesAprobadas;
begin
  self.Caption := LIQ_APROBADAS + ' - ' + GetDescrTipoPago();
  FModoEjecucion := meConsultaAprobados;

  CargarFechasModo;
  DefinirConsulta;
  SetearControles;

  ShowModal;
end;

{-----------------------------------------------------------------------------
  Procedure: MostrarLiquidacionesPagadas
  Author:    RACastro
  Date:      16-Jun-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Inicaliza el form en modo consulta de pagos efectivizados
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.MostrarLiquidacionesPagadas;
begin
  self.Caption := LIQ_PAGADAS + ' - ' + GetDescrTipoPago();
  FModoEjecucion := meConsultaPagados;
  CargarFechasModo;
  DefinirConsulta;
  SetearControles;
  tbImprimirPagos.Enabled := False;
  ShowModal;
end;

{-----------------------------------------------------------------------------
  Procedure: dtpFechaAprobacionDesdeChange
  Author:    RACastro
  Date:      23-May-2006
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Inicializa el toolbar en base al modo de ejecución del form
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.dtpFechaAprobacionDesdeChange(Sender: TObject);
begin
  sdqPagoLegal.Close
end;
{-----------------------------------------------------------------------------
  Procedure: SetearControles
  Author:    RACastro
  Date:      23-May-2006
  Arguments: None
  Result:    None
  Purpose:   Consulta los pagos dentro de un rango de fechas
-----------------------------------------------------------------------------}

procedure TfrmAutorizacionPagosLegales.SetearControles;
begin
  pnlFiltros.Visible := FModoEjecucion <> meAutorizacion;
  if pnlFiltros.Visible then
    dtpFechaAprobacionDesde.SetFocus
  else
    dbgPagos.SetFocus;

  if TipoPago = tpJuicio then
    pnlVerPagosBloqueados.Visible := True
  else
    pnlVerPagosBloqueados.Width := 0;

  case FModoEjecucion of
    meAutorizacion: begin
      sdqPagoLegalAprobado.Params.ParamByName('fecharef').AsDateTime := DBDateTime;
      sdqPagoLegalAprobado.Open;
      pnlAprobados.Visible := not sdqPagoLegalAprobado.IsEmpty;
      tbImprimirPagos.hint := 'Emitir Liquidación';
    end;

    meConsultaAprobados: begin
      pnlAprobados.Visible := false;
      tbImprimirPagos.hint := 'Imprimir Liquidaciones Aprobadas';
      lblFechaAprobacion.Caption := 'Fecha Aprobación: del';
    end;

    meConsultaPagados: begin
      pnlAprobados.Visible := false;
      tbImprimirPagos.hint := 'Imprimir Liquidaciones Efectivizadas';
      lblFechaAprobacion.Caption := 'Fecha de O.Pago: del';
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: DefinirConsulta
  Author:    RACastro
  Date:      16-Jun-2006
  Arguments: None
  Result:    None
  Purpose:   Definición de SQL según el modo de ejecución del form
-----------------------------------------------------------------------------}
procedure TfrmAutorizacionPagosLegales.DefinirConsulta;
var
  sWhere: String;
begin
  if not chkPagosBloqueados.Checked then
    sWhere := ' AND (ljg.jg_faltademanda IS NULL OR ' +
              '      (ljg.jg_faltademanda = ''N'' ' +
              '       AND (ljg.jg_enviosin = ''N'' OR ljg.jg_devolviosin = ''S''))) '
  else
    sWhere := '';

  sdqPagoLegal.Close;

  case FModoEjecucion of
    meAutorizacion:
      begin
        case TipoPago of
          tpJuicio:
            sdqPagoLegal.SQL.Text :=
              'SELECT lpl.pl_fechavencimientopago fechavencimientopago, lpl.pl_id id, lpl.pl_idjuicioentramite idjuiciomed, ' +
              '       jt.jt_numerocarpeta carpeta, lpl.pl_conpago conpago, lpl.pl_idbeneficiariopago idbeneficiariopago, ' +
              '       scp.cp_denpago || '': '' || irj.ir_detalle concepto, ' +
              '       lpl.pl_detallebeneficiario detallebeneficiario, lpl.pl_importeconretencion importeconretencion, ' +
              '       lpl.pl_importepago importepago, lpl.pl_letrafactura letrafactura, lpl.pl_comentario comentario,' +
              '       lpl.pl_situacionfactura situacionfactura, lpl.pl_numerofactura numerofactura, lpl.pl_cuitcuil cuitcuil, ' +
              '       lpl.pl_letrafactura ' +
              '       || ''-'' ' +
              '       || lpl.pl_situacionfactura ' +
              '       || ''-'' ' +
              '       || lpl.pl_numerofactura nrofactura, jt.jt_caratula caratula, ' +
              '       lpl.pl_fechafactura fechafactura, lpl.pl_usuarioemision usuarioemision, lpl.pl_chequenombre chequenombre, ' +
              '       lpl.pl_fechaemision fechaemision, lpl.pl_fechavencimiento fechavencimiento, lpl.pl_paguesea paguesea, null estadopago, ' +
              '       ljg.jg_faltademanda faltademanda, ljg.jg_enviosin enviosin, ljg.jg_devolviosin devolviosin, lpl.pl_idembargo idembargo, ' +
              '       lpl.pl_pagoexclusivo pagoexclusivo, ' +
              '       TRUNC(lpl.pl_fechaaprobado) fechaaprobado ' +
              '  FROM ljg_juiciogestion ljg, ' +
              '       legales.lpl_pagolegal lpl, ' +
              '       legales.lbp_beneficiariopago lbp, ' +
              '       art.scp_conpago scp, ' +
              '       legales.lir_importesreguladosjuicio irj, ' +
              '       legales.ljt_juicioentramite jt, ' +
              '       rce_chequeemitido ' +
              ' WHERE lpl.pl_idbeneficiariopago = lbp.bp_id(+) ' +
              '   AND lpl.pl_conpago = scp.cp_conpago ' +
              '   AND lpl.pl_estado = ''C'' ' +
              '   AND irj.ir_nropago(+) = lpl.pl_id ' +
              '   AND jt.jt_id = lpl.pl_idjuicioentramite ' +
              '   AND jt.jt_id = ljg.jg_idjuicioentramite(+) ' +
              '   AND ce_id(+) = pl_idchequeemitido ' +              
              sWhere +
              Iif(SortDialog1.OrderBy = '', ' ORDER BY lpl.pl_fechavencimientopago, lpl.pl_id, lpl.pl_idjuicioentramite', SortDialog1.OrderBy);

          tpMediacion:
            sdqPagoLegal.SQL.Text :=
              'SELECT lpm.pm_fechavencimientopago fechavencimientopago, lpm.pm_id id, lpm.pm_idmediacion idjuiciomed, ' +
              '       me.me_numerofolio carpeta, lpm.pm_conpago conpago, lpm.pm_idbeneficiariopago idbeneficiariopago, ' +
              '       scp.cp_denpago || '': '' || lim.im_detalle concepto, ' +
              '       lpm.pm_detallebeneficiario detallebeneficiario, lpm.pm_importeconretencion importeconretencion, ' +
              '       lpm.pm_importepago importepago, lpm.pm_letrafactura letrafactura, lpm.pm_comentario comentario,' +
              '       lpm.pm_situacionfactura situacionfactura, lpm.pm_numerofactura numerofactura, lpm.pm_cuitcuil cuitcuil, ' +
              '       lpm.pm_letrafactura ' +
              '       || ''-'' ' +
              '       || lpm.pm_situacionfactura ' +
              '       || ''-'' ' +
              '       || lpm.pm_numerofactura nrofactura, TRUNC(lpm.pm_fechaaprobado) fechaaprobado, lmr.mr_descripcion caratula, ' +
              '       lpm.pm_fechafactura fechafactura, lpm.pm_usuarioemision usuarioemision, lpm.pm_chequenombre chequenombre, ' +
              '       lpm.pm_fechaemision fechaemision, lpm.pm_fechavencimiento fechavencimiento, lpm.pm_paguesea paguesea, null estadopago, ' +
              '       lpm.pm_pagoexclusivo pagoexclusivo ' +
              '  FROM legales.lmr_motivoreclamo lmr, ' +
              '       legales.lpm_pagomediacion lpm, ' +
              '       legales.lbp_beneficiariopago lbp, ' +
              '       art.scp_conpago scp, ' +
              '       legales.lim_importemediacion lim, ' +
              '       legales.lme_mediacion me ' +
              ' WHERE lpm.pm_idbeneficiariopago = lbp.bp_id(+) ' +
              '   AND lpm.pm_conpago = scp.cp_conpago ' +
              '   AND lpm.pm_estado = ''C'' ' +
              '   AND lim.im_nropago(+) = lpm.pm_id ' +
              '   AND me.me_id = lpm.pm_idmediacion ' +
              '   AND me.me_idmotivoreclamo = lmr.mr_id(+) ' +
              Iif(SortDialog1.OrderBy = '', ' ORDER BY lpm.pm_fechavencimientopago, lpm.pm_id, lpm.pm_idmediacion', SortDialog1.OrderBy);
        end;

        sdqPagoLegal.Open
      end;

    meConsultaAprobados,
    meConsultaPagados:
      begin
        case TipoPago of
          tpJuicio:
            sdqPagoLegal.SQL.Text :=
              'SELECT lpl.pl_fechavencimientopago fechavencimientopago, lpl.pl_id id, lpl.pl_idjuicioentramite idjuiciomed, ' +
              '       jt.jt_numerocarpeta carpeta, lpl.pl_conpago conpago, lpl.pl_idbeneficiariopago idbeneficiariopago, ' +
              '       scp.cp_denpago || '': '' || irj.ir_detalle concepto, ' +
              '       lpl.pl_detallebeneficiario detallebeneficiario, lpl.pl_importeconretencion importeconretencion, ' +
              '       lpl.pl_importepago importepago, lpl.pl_letrafactura letrafactura, lpl.pl_comentario comentario,' +
              '       lpl.pl_situacionfactura situacionfactura, lpl.pl_numerofactura numerofactura, lpl.pl_cuitcuil cuitcuil, ' +
              '       lpl.pl_letrafactura ' +
              '       || ''-'' ' +
              '       || lpl.pl_situacionfactura ' +
              '       || ''-'' ' +
              '       || lpl.pl_numerofactura nrofactura, ' +
              '       lpl.pl_fechafactura fechafactura, lpl.pl_fechaemision fechaemision, lpl.pl_fechavencimiento fechavencimiento, ' +
              '       lpl.pl_paguesea paguesea, lpl.pl_chequenombre chequenombre, ' +
              '       TO_NUMBER (NULL) ordennro, TO_DATE (NULL) ordenfecha, ' +
              '       TO_NUMBER (NULL) chequenro, TO_DATE (NULL) chequefecha, ' +
              '       lpl.pl_numpago numpago, jt.jt_caratula caratula, null estadopago, ' +
              '       ljg.jg_faltademanda faltademanda, ljg.jg_enviosin enviosin, ljg.jg_devolviosin devolviosin, lpl.pl_idembargo idembargo, ' +
              '       lpl.pl_pagoexclusivo pagoexclusivo, ' +
              '       TRUNC(lpl.pl_fechaaprobado) fechaaprobado ' +
              '  FROM ljg_juiciogestion ljg, ' +
              '       legales.lpl_pagolegal lpl, ' +
              '       legales.lbp_beneficiariopago lbp, ' +
              '       art.scp_conpago scp, ' +
              '       legales.lir_importesreguladosjuicio irj, ' +
              '       legales.ljt_juicioentramite jt, ' +
              '       rce_chequeemitido ' +
              ' WHERE lpl.pl_idbeneficiariopago = lbp.bp_id(+) ' +
              '   AND lpl.pl_conpago = scp.cp_conpago ' +
              '   AND lpl.pl_estado = ''E'' ' +
              '   AND lpl.pl_fechaaprobado >= :fechadesde ' +
              '   AND lpl.pl_fechaaprobado < CAST(:fechahasta AS DATE)+1 ' +
              '   AND irj.ir_nropago(+) = lpl.pl_id ' +
              '   AND jt.jt_id = lpl.pl_idjuicioentramite ' +
              '   AND jt.jt_id = ljg.jg_idjuicioentramite(+) ' +
              '   AND ce_id(+) = pl_idchequeemitido ' +
              sWhere +
              Iif(SortDialog1.OrderBy = '', ' ORDER BY lpl.pl_fechavencimientopago, lpl.pl_id, lpl.pl_idjuicioentramite', SortDialog1.OrderBy);

          tpMediacion:
            sdqPagoLegal.SQL.Text :=
              'SELECT lpm.pm_fechavencimientopago fechavencimientopago, lpm.pm_id id, lpm.pm_idmediacion idjuiciomed, ' +
              '       me.me_numerofolio carpeta, lpm.pm_conpago conpago, lpm.pm_idbeneficiariopago idbeneficiariopago, ' +
              '       scp.cp_denpago || '': '' || lim.im_detalle concepto, ' +
              '       lpm.pm_detallebeneficiario detallebeneficiario, lpm.pm_importeconretencion importeconretencion, ' +
              '       lpm.pm_importepago importepago, lpm.pm_letrafactura letrafactura, lpm.pm_comentario comentario,' +
              '       lpm.pm_situacionfactura situacionfactura, lpm.pm_numerofactura numerofactura, lpm.pm_cuitcuil cuitcuil, ' +
              '       lpm.pm_letrafactura ' +
              '       || ''-'' ' +
              '       || lpm.pm_situacionfactura ' +
              '       || ''-'' ' +
              '       || lpm.pm_numerofactura nrofactura, TRUNC(lpm.pm_fechaaprobado) fechaaprobado, lmr.mr_descripcion caratula, ' +
              '       lpm.pm_fechafactura fechafactura, lpm.pm_usuarioemision usuarioemision, lpm.pm_chequenombre chequenombre, ' +
              '       lpm.pm_fechaemision fechaemision, lpm.pm_fechavencimiento fechavencimiento, lpm.pm_paguesea paguesea, null estadopago, ' +
              '       lpm.pm_pagoexclusivo pagoexclusivo ' +
              '  FROM legales.lmr_motivoreclamo lmr, ' +
              '       legales.lpm_pagomediacion lpm, ' +
              '       legales.lbp_beneficiariopago lbp, ' +
              '       art.scp_conpago scp, ' +
              '       legales.lim_importemediacion lim, ' +
              '       legales.lme_mediacion me ' +
              ' WHERE lpm.pm_idbeneficiariopago = lbp.bp_id(+) ' +
              '   AND lpm.pm_conpago = scp.cp_conpago ' +
              '   AND lpm.pm_estado = ''E'' ' +
              '   AND lpm.pm_fechaaprobado >= :fechadesde ' +
              '   AND lpm.pm_fechaaprobado < CAST(:fechahasta AS DATE)+1 ' +
              '   AND lim.im_nropago(+) = lpm.pm_id ' +
              '   AND me.me_id = lpm.pm_idmediacion ' +
              '   AND me.me_idmotivoreclamo = lmr.mr_id(+) ' +
              Iif(SortDialog1.OrderBy = '', ' ORDER BY lpm.pm_fechavencimientopago, lpm.pm_id, lpm.pm_idmediacion', SortDialog1.OrderBy);
        end;
      end;
  end;
end;

procedure TfrmAutorizacionPagosLegales.tbRefrescarClick(Sender: TObject);
begin
  IniciarEspera;
  DefinirConsulta;
  if FModoEjecucion <> meAutorizacion then
  begin
    sdqPagoLegal.ParamByName('fechadesde').AsDate := dtpFechaAprobacionDesde.Date;
    sdqPagoLegal.ParamByName('fechahasta').AsDate := dtpFechaAprobacionHasta.Date;
    sdqPagoLegal.Open;
  end;
  DetenerEspera;
end;

procedure TfrmAutorizacionPagosLegales.tbOrdenarClick(Sender: TObject);
begin
  SortDialog1.Execute
end;

procedure TfrmAutorizacionPagosLegales.sdqPagoLegalAfterOpen(DataSet: TDataSet);
begin
  tbExportar.Enabled := not sdqPagoLegal.IsEmpty;
end;

procedure TfrmAutorizacionPagosLegales.tbExportarClick(Sender: TObject);
begin
  tbExportar.Enabled := False;
  try
    ExportDialog.DataSet := sdqPagoLegal;
    ExportDialog.Fields.Assign(dbgPagos.Columns);
    ExportDialog.Execute;
  finally
    tbExportar.Enabled := True;
  end;
end;

procedure TfrmAutorizacionPagosLegales.SetTipoPago(const Value: TTipoPago);
var
  sSql: String;
begin
  FTipoPago := Value;

  case FTipoPago of
    tpJuicio:
      sSql := 'SELECT lpl.pl_fechavencimientopago fechavencimientopago, lpl.pl_id id,  ' +
                     'jt.jt_numerocarpeta carpeta, ' +
                     'scp.cp_denpago || '': '' || irj.ir_detalle concepto, ' +
                     'lpl.pl_detallebeneficiario detallebeneficiario, lpl.pl_importeconretencion importeconretencion, ' +
                     'lpl.pl_importepago importepago, ' +
                     'lpl.pl_letrafactura ' + '|| ''-'' ' + '|| lpl.pl_situacionfactura ' +  '|| ''-'' ' + '|| lpl.pl_numerofactura nrofactura, ' +
                     'lpl.pl_fechafactura fechafactura, ' +
                     'TRUNC(lpl.pl_fechaaprobado) fechaaprobado ' +
                'FROM legales.lpl_pagolegal lpl, ' +
                     'legales.lbp_beneficiariopago lbp, ' +
                     'art.scp_conpago scp, ' +
                     'legales.lir_importesreguladosjuicio irj, ' +
              '       legales.ljt_juicioentramite jt, ' +
              '       rce_chequeemitido ' +
               'WHERE lpl.pl_idbeneficiariopago = lbp.bp_id(+) ' +
                 'AND lpl.pl_conpago = scp.cp_conpago ' +
                 'AND lpl.pl_estado = ''E'' ' +
                 'AND lpl.pl_fechaaprobado >= :fecharef ' +
                 'AND lpl.pl_fechaaprobado < CAST (:fecharef AS DATE) + 1 ' +
                 'AND irj.ir_nropago(+) = lpl.pl_id ' +
                 'AND jt.jt_id = lpl.pl_idjuicioentramite ' +
                 'AND ce_id(+) = pl_idchequeemitido ' +
            'ORDER BY lpl.pl_fechavencimientopago DESC, lpl.pl_id, lpl.pl_idjuicioentramite';

    tpMediacion:
      sSql := 'SELECT lpm.pm_fechavencimientopago fechavencimientopago, lpm.pm_id id, ' +
                     'me.me_numerofolio carpeta, ' +
                     'scp.cp_denpago || '': '' || lim.im_detalle concepto, ' +
                     'lpm.pm_detallebeneficiario detallebeneficiario, lpm.pm_importeconretencion importeconretencion, ' +
                     'lpm.pm_importepago importepago, ' +
                     'lpm.pm_letrafactura ' + '|| ''-'' ' + '|| lpm.pm_situacionfactura ' +  '|| ''-'' ' + '|| lpm.pm_numerofactura nrofactura, ' +
                     'lpm.pm_fechafactura fechafactura ' +
                'FROM legales.lpm_pagomediacion lpm, ' +
                     'legales.lbp_beneficiariopago lbp, ' +
                     'art.scp_conpago scp, ' +
                     'legales.lim_importemediacion lim, ' +
                     'legales.lme_mediacion me ' +
               'WHERE lpm.pm_idbeneficiariopago = lbp.bp_id(+) ' +
                 'AND lpm.pm_conpago = scp.cp_conpago ' +
                 'AND lpm.pm_estado = ''E'' ' +
                 'AND lpm.pm_fechaaprobado >= :fecharef ' +
                 'AND lpm.pm_fechaaprobado < CAST (:fecharef AS DATE) + 1 ' +
                 'AND lim.im_nropago(+) = lpm.pm_id ' +
                 'AND me.me_id = lpm.pm_idmediacion ' +
            'ORDER BY lpm.pm_fechavencimientopago DESC, lpm.pm_id, lpm.pm_idmediacion';
  end;

  sdqPagoLegalAprobado.SQL.Text := sSql;
end;

function TfrmAutorizacionPagosLegales.GetDescrTipoPago: String;
var
  sDescr: String;
begin
  case TipoPago of
    tpJuicio:
      sDescr := 'Juicios';
    tpMediacion:
      sDescr := 'Mediaciones';
  end;

  Result := sDescr;
end;

procedure TfrmAutorizacionPagosLegales.FormCreate(Sender: TObject);
begin
  chkPagosBloqueados.Checked := False;
end;

procedure TfrmAutorizacionPagosLegales.dbgPagosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBloqueada() then
    AFont.Color := pnlColor0.Font.Color
  else if IsExclusiva() then
    AFont.Color := pnlColor1.Font.Color;
end;

function TfrmAutorizacionPagosLegales.IsBloqueada: Boolean;
begin
  Result := (TipoPago = tpJuicio)
             and ((sdqPagoLegal.FieldByName('faltademanda').AsString = 'S')
             or  ((sdqPagoLegal.FieldByName('enviosin').AsString = 'S') and
                  (sdqPagoLegal.FieldByName('devolviosin').AsString = 'N')));
end;

function TfrmAutorizacionPagosLegales.IsExclusiva: Boolean;
begin
  Result := (sdqPagoLegal.FieldByName('pagoexclusivo').AsString = 'S');
end;

procedure TfrmAutorizacionPagosLegales.CargarFechasModo;
begin
  if (FModoEjecucion = meConsultaAprobados) or (FModoEjecucion = meConsultaPagados) then
  begin
    dtpFechaAprobacionDesde.Date := DBDate;
    dtpFechaAprobacionHasta.Date := DBDate;
  end;
end;

end.

