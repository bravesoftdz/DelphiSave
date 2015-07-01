unit unAutorizacionPagosSumarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShortCutControl, Placemnt, artSeguridad, General, Cuit,
  CurrEdit, unfraUsuarios, StdCtrls, ToolEdit, DateComboBox, unEspera,
  unArtDBAwareFrame, unArtDbFrame, unArtFrame, DB, SDEngine, ImgList,
  RXSpin, ComCtrls, ToolWin, JvExControls, JvComponent, unSesion, JvEnterTab,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, SortDlg, FormPanel;
type
  TModoEjecucion = (meAutorizacion, meConsultaAprobados, meConsultaPagados);

  TfrmAutorizacionPagosSumarios = class(TForm)
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    ShortCutControl: TShortCutControl;
    iStates: TImageList;
    sdqPagoSumario: TSDQuery;
    dsPagoSumario: TDataSource;
    pnDetalle: TPanel;
    EnterAsTab: TJvEnterAsTab;
    imCustom: TImageList;
    dbgPagos: TRxDBGrid;
    sdqPagoSumarioAprobado: TSDQuery;
    dsPagoAprobado: TDataSource;
    pnlAprobados: TPanel;
    Label1: TLabel;
    dbgPagosEfectuados: TRxDBGrid;
    tbAcciones: TToolBar;
    tbImprimirPagos: TToolButton;
    tbAprobacionPagos: TToolButton;
    ToolButton4: TToolButton;
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
    sduPagoSumario: TSDUpdateSQL;
    ToolButton1: TToolButton;
    tbOrdenar: TToolButton;
    SortDialog1: TSortDialog;
    ToolButton2: TToolButton;
    pnlColoresGrilla: TPanel;
    pnlColor1: TPanel;
    procedure tbSalirClick(Sender: TObject);
    procedure tbImprimirPagosClick(Sender: TObject);
    procedure tbAprobacionPagosClick(Sender: TObject);
    procedure sdqPagoSumarioAfterScroll(DataSet: TDataSet);
    procedure tbGrabarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tbCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFechaAprobacionDesdeChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure dbgPagosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MostrarLiquidacionesPendientesDeAprobar;
    procedure MostrarLiquidacionesAprobadas;
    procedure MostrarLiquidacionesPagadas;
  private
    FIdLiquidacion: Integer;
    FModoEjecucion : TModoEjecucion;
    sBarCode: String;
    FbtnAprobacionPagosEnable: boolean;
    function IsExclusiva: Boolean;
    procedure Actualizar(Sender: TObject);
    procedure AprobarPago(Sender: TObject);
    procedure SetearControles;
    procedure DefinirConsulta;
  public
  end;

implementation

uses
  unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs,
  unPrincipal, DateUtils, UnRptLiqSumariosAprobadasOtrosConceptos, StrFuncs,
  unDmFinancials, UnRptLiqSumariosAprobadas, UnRptLiqSumariosPagadas,
  unLiquidacionPagoSumarios, unComunes;

{$R *.dfm}

resourcestring
  LIQ_APROBADAS  = 'Sumarios: Liquidaciones de Pago Aprobadas';
  LIQ_POR_APROBAR= 'Sumarios: Liquidaciones de Pago Pendientes de Aprobación';
  LIQ_PAGADAS    = 'Sumarios: Liquidaciones de Pago Efectivizadas';

procedure TfrmAutorizacionPagosSumarios.Actualizar(Sender: TObject);
begin
  sdqPagoSumario.Refresh;
  if sdqPagoSumarioAprobado.Active then
  begin
    sdqPagoSumarioAprobado.Refresh;
    pnlAprobados.Visible := not sdqPagoSumarioAprobado.IsEmpty
  end;

  sdqPagoSumarioAfterScroll(sdqPagoSumario);
end;

procedure TfrmAutorizacionPagosSumarios.tbImprimirPagosClick(Sender: TObject);
begin
  if sdqPagoSumario.IsEmpty then
    Exit;

  case FModoEjecucion of
    meAutorizacion: begin
      if (not dmPrincipal.sdbPrincipal.InTransaction) and
         (IsEmptyString (sdqPagoSumario.FieldByName('ps_cuitcuil').AsString)) then
      begin
        BeginTrans(True);
        tbGrabar.Enabled := True;
        tbCancelar.Enabled := True;
      end;

      with TfrmLiquidacionPagoSumarios.Create(self) do
      try
        Imprimir(sdqPagoSumario.Fields);
      finally
        free;
      end;

      Actualizar(Sender);
    end;

    meConsultaAprobados: begin
      with TRptLiqSumariosAprobadas.Create(self) do
      try
        VistaPrevia(sdqPagoSumario, dtpFechaAprobacionDesde.Date,
                                    dtpFechaAprobacionHasta.Date,
                                    Trunc(spnCopias.Value));
      finally
        free;
      end;

      with TRptLiqSumariosAprobadasOtrosConceptos.Create(self) do
      try
        VistaPrevia(dtpFechaAprobacionDesde.Date,
                    dtpFechaAprobacionHasta.Date,
                    Trunc(spnCopias.Value));
      finally
        free;
      end;
    end;

    meConsultaPagados: begin
      with TRptLiqSumariosPagadas.Create(self) do
      try
        VistaPrevia(sdqPagoSumario, dtpFechaAprobacionDesde.Date,
                                    dtpFechaAprobacionHasta.Date,
                                    Trunc(spnCopias.Value));
      finally
        free;
      end;
    end;
  end;
end;

procedure TfrmAutorizacionPagosSumarios.AprobarPago(Sender: TObject);
begin
  if not dmPrincipal.sdbPrincipal.InTransaction then
  begin
    BeginTrans(True);
    tbGrabar.Enabled := True;
    tbCancelar.Enabled := True;
  end;

  EjecutarSqlST('update legales.lps_pagosumario ' +
                '   set ps_usuarioaprobado = ' + SqlValue(Sesion.LoginName) + ', ' +
                '       ps_fechaaprobado   = SYSDATE, ' +
                '       ps_estado = ''E'' ' +
                ' where ps_id = ' + SqlValue(FIdLiquidacion) +
                '   and ps_estado <> ''E'''
                , tmNone);

  if (sdqPagoSumario.FieldByName('ps_importeconretencion').AsCurrency < 0) or
     (sdqPagoSumario.FieldByName('ps_importepago').AsCurrency < 0) then
  begin
    EjecutarSqlST('update legales.lis_importesentenciasumario ' +
                  '   set is_nropago = null' +
                  ' where is_nropago = ' + SqlValue(sdqPagoSumario.FieldByName('PS_ID').AsInteger)
                  , tmNone);
  end;

  Actualizar(Sender);
end;

procedure TfrmAutorizacionPagosSumarios.tbAprobacionPagosClick(Sender: TObject);
begin
  if sdqPagoSumario.IsEmpty then
    Exit;

  VerificarMultiple(['Aprobando Liquidación de Pago',
                     dbgPagos, IsCUIT(sdqPagoSumario.FieldByName('ps_cuitcuil').AsString) or
                               IsCUIL(sdqPagoSumario.FieldByName('ps_cuitcuil').AsString),
                               'No puede autorizarse el pago pués no hay un CUIT/CUIL válido.'
                    ]);

  FIdLiquidacion := sdqPagoSumario.FieldByName('PS_ID').AsInteger;

  AprobarPago(Sender);
end;

procedure TfrmAutorizacionPagosSumarios.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAutorizacionPagosSumarios.sdqPagoSumarioAfterScroll(DataSet: TDataSet);
begin
  tbAprobacionPagos.Enabled := FbtnAprobacionPagosEnable and (FModoEjecucion = meAutorizacion) and
                               (sdqPagoSumario.FieldByName('ps_usuarioemision').AsString <> '')
end;

procedure TfrmAutorizacionPagosSumarios.tbGrabarClick(Sender: TObject);
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

    sdqPagoSumarioAprobado.Close;
    sdqPagoSumarioAprobado.Params.ParamByName('fecharef').AsDateTime := DBDateTime;
    sdqPagoSumarioAprobado.Open;
  except
    on E : Exception do begin
       raise Exception.Create('Error al registrar Aprobaciones de Pago: ' + E.Message);
    end;
  end;

  Actualizar(Sender)
end;

procedure TfrmAutorizacionPagosSumarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sdqPagoSumario.Close;
  Action := caFree;
end;

procedure TfrmAutorizacionPagosSumarios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmPrincipal.sdbPrincipal.InTransaction then
  begin
    if MessageDlg('Hay Liquidaciones y Autorizaciones de Pago realizadas sin guardar. ¿Desea hacerlo ahora?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      CommitTrans(true)
    else
      Rollback(true)
  end
end;

procedure TfrmAutorizacionPagosSumarios.tbCancelarClick(Sender: TObject);
begin
  if dmPrincipal.sdbPrincipal.InTransaction and
    (MessageDlg('Se descartarán todas las Liquidaciones y Autorizaciones de Pago realizadas. ¿Continúa?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
  begin
    Rollback(true);
    tbGrabar.Enabled := False;
    tbCancelar.Enabled := False;
  end;

  Actualizar(Sender);
end;

procedure TfrmAutorizacionPagosSumarios.FormKeyPress(Sender: TObject; var Key: Char);
const
  BARCODE_LENGTH = 14;
begin
  Verificar(sdqPagoSumario.IsEmpty, dbgPagos, 'La grilla se encuentra vacía.');

  if (Key in ['0'..'9']) and (not dtpFechaAprobacionDesde.Focused) and (not dtpFechaAprobacionHasta.Focused) then
  begin
    if Length (sBarCode) < BARCODE_LENGTH then
      sBarCode := sBarCode + Key;

    if (FModoEjecucion = meAutorizacion) and (Length (sBarCode) >= BARCODE_LENGTH) then
    begin
      FIdLiquidacion := StrToInt (Copy (sBarCode, BARCODE_LENGTH-4, 5));

      if sdqPagoSumario.Locate('PS_ID', FIdLiquidacion, []) then
        tbAprobacionPagosClick(nil)
      else
        Verificar(True, dbgPagos, 'No se ha encontrado el pago.');

      sBarCode := '';
    end;

    Key := #0
  end
end;

procedure TfrmAutorizacionPagosSumarios.MostrarLiquidacionesPendientesDeAprobar;
begin
  self.Caption := LIQ_POR_APROBAR;
  FModoEjecucion := meAutorizacion;
  sBarCode := '';

  DefinirConsulta;
  SetearControles;

  Show;
end;

procedure TfrmAutorizacionPagosSumarios.MostrarLiquidacionesAprobadas;
begin
  self.Caption := LIQ_APROBADAS;
  FModoEjecucion := meConsultaAprobados;

  DefinirConsulta;
  SetearControles;

  Show;
end;

procedure TfrmAutorizacionPagosSumarios.MostrarLiquidacionesPagadas;
begin
  self.Caption := LIQ_PAGADAS;
  FModoEjecucion := meConsultaPagados;

  DefinirConsulta;
  SetearControles;

  Show;
end;

procedure TfrmAutorizacionPagosSumarios.dtpFechaAprobacionDesdeChange(Sender: TObject);
begin
  sdqPagoSumario.Close
end;

procedure TfrmAutorizacionPagosSumarios.SetearControles;
begin
  pnlFiltros.Visible := FModoEjecucion <> meAutorizacion;
  if pnlFiltros.Visible then
    dtpFechaAprobacionDesde.SetFocus
  else
    dbgPagos.SetFocus;

  case FModoEjecucion of
    meAutorizacion: begin
      sdqPagoSumarioAprobado.Params.ParamByName('fecharef').AsDateTime := DBDateTime;
      sdqPagoSumarioAprobado.Open;
      pnlAprobados.Visible := not sdqPagoSumarioAprobado.IsEmpty;
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

procedure TfrmAutorizacionPagosSumarios.DefinirConsulta;
begin
  sdqPagoSumario.Close;

  case FModoEjecucion of
    meAutorizacion: begin
      sdqPagoSumario.SQL.Text :=
        'SELECT   ps_fechavencimientopago, ps_id, ps_idsumario, su_numerosumario, ' +
        '         ar_nombre art, ps_conpago, ps_idbeneficiariopago, ps_idsector,' +
        '         cp_denpago || '': '' || is_detalle concepto, ' +
        '         ps_detallebeneficiario, ps_importeconretencion, ps_importepago, ' +
        '         ps_letrafactura, ps_comentario, ps_situacionfactura, ' +
        '         ps_numerofactura, ps_cuitcuil, ' +
        '            ps_letrafactura ' +
        '         || ''-'' ' +
        '         || ps_situacionfactura ' +
        '         || ''-'' ' +
        '         || ps_numerofactura AS nrofactura, ' +
        '         ps_fechaaprobado, ps_fechafactura, ps_usuarioemision, ' +
        '         ps_chequenombre, ps_fechaemision, ps_fechavencimiento, ps_paguesea, ' +
        '         ps_pagoexclusivo pagoexclusivo ' +
        '    FROM legales.lps_pagosumario, ' +
        '         legales.lbp_beneficiariopago, ' +
        '         art.scp_conpago, ' +
        '         legales.lis_importesentenciasumario, ' +
        '         legales.lsu_sumario, ' +
        '         afi.aar_art ' +
        '   WHERE (ps_idbeneficiariopago = bp_id(+)) ' +
        '     AND (ps_conpago = cp_conpago) ' +
        '     AND (ps_estado = ''C'') ' +
        '     AND (is_nropago(+) = ps_id) ' +
        '     AND (su_id = ps_idsumario) ' +
        '     AND (ar_id = su_idart) ' +
        'ORDER BY ps_fechavencimientopago, ps_id, ps_idsumario ';

      sdqPagoSumario.Open
    end;

    meConsultaAprobados,
    meConsultaPagados: begin
      sdqPagoSumario.SQL.Text :=
        'SELECT ps_fechavencimientopago, ps_id, ps_idsumario, ps_idsector,' +
        '       su_numerosumario, ar_nombre art, ps_conpago, ps_idbeneficiariopago, ' +
        '       cp_denpago || '': '' || is_detalle concepto, ' +
        '       ps_detallebeneficiario, ps_importeconretencion, ' +
        '       ps_importepago, ps_letrafactura, ps_comentario,' +
        '       ps_situacionfactura, ps_numerofactura, ps_cuitcuil, ' +
        '          ps_letrafactura ' +
        '       || ''-'' ' +
        '       || ps_situacionfactura ' +
        '       || ''-'' ' +
        '       || ps_numerofactura AS nrofactura, ' +
        '       ps_fechafactura, ps_fechaemision, ps_fechavencimiento, ' +
        '       ps_paguesea, ps_chequenombre, ' +
        '       TO_NUMBER (NULL) ordennro, TO_DATE (NULL) ordenfecha, ' +
        '       TO_NUMBER (NULL) chequenro, TO_DATE (NULL) chequefecha, ' +
        '       ps_numpago, ps_fechaaprobado, ps_pagoexclusivo pagoexclusivo ' +
        '    FROM legales.lps_pagosumario, ' +
        '         legales.lbp_beneficiariopago, ' +
        '         art.scp_conpago, ' +
        '         legales.lis_importesentenciasumario, ' +
        '         legales.lsu_sumario, ' +
        '         afi.aar_art ' +
        ' WHERE ps_idbeneficiariopago = bp_id(+) ' +
        '   AND ps_conpago = cp_conpago ' +
        '   AND ps_estado = ''E'' ' +
        '   AND ps_fechaaprobado >= :fechadesde ' +
        '   AND ps_fechaaprobado < CAST(:fechahasta AS DATE)+1 ' +
        '   AND is_nropago(+) = ps_id ' +
        '   AND su_id = ps_idsumario ' +
        '   AND ar_id = su_idart ' +
        ' ORDER BY ps_fechavencimientopago, ps_id, ps_idsumario ';

      dtpFechaAprobacionDesde.Date := DBDate;
      dtpFechaAprobacionHasta.Date := DBDate;
    end;
  end;
end;

procedure TfrmAutorizacionPagosSumarios.ToolButton1Click(Sender: TObject);
var
  bFnlActive: Boolean;
  sdqFnclDatos: TSDQuery;
  sSql: String;
begin
  IniciarEspera;
  bFnlActive := dmFinancials.Active;

  try
    sdqPagoSumario.Close;
    if FModoEjecucion <> meAutorizacion then
    begin
      sdqPagoSumario.ParamByName('fechadesde').AsDate := dtpFechaAprobacionDesde.Date;

      if FModoEjecucion = meConsultaPagados then
        sdqPagoSumario.ParamByName('fechahasta').AsDate := dtpFechaAprobacionHasta.Date + 30
      else
        sdqPagoSumario.ParamByName('fechahasta').AsDate := dtpFechaAprobacionHasta.Date;
    end;
    sdqPagoSumario.Open;

    if FModoEjecucion = meConsultaPagados then
    begin
      sdqPagoSumario.DisableControls;

      try
        dmFinancials.Active := True;

        if dmFinancials.Active then
        begin
          sdqFnclDatos := TSDQuery.Create( Self );

          try
            sSql := 'SELECT ac.check_id ordennro, TRUNC (ac.check_date) ordenfecha, ' +
                    '       ac.check_number chequenro, TRUNC (ac.check_date) chequefecha, ai.*, aip.*, ac.*' +
                    '  FROM ap.ap_invoices_all ai, ' +
                    '       ap.ap_invoice_payments_all aip, ' +
                    '       ap.ap_checks_all ac ' +
                    ' WHERE ai.invoice_id = aip.invoice_id ' +
                    '   AND aip.check_id = ac.check_id ' +
                    '   AND ai.pay_group_lookup_code = ''LEGALES_SIART'' ' +
                    '   AND ac.status_lookup_code <> ''VOID'' ' +
                    '   AND ROWNUM = 1 ' +
                    '   AND ai.invoice_num = :pletrafactura || ''-'' || :psituacionfactura || ''-'' || :pnumerofactura ' +
                    '   AND ai.vendor_id = :vendor_id';

            dmFinancials.SetDatabaseToQuery( sdqFnclDatos );
            sdqFnclDatos.SQL.Text := sSql;

            sdqPagoSumario.First;
            while not sdqPagoSumario.EOF do
            begin
              sdqFnclDatos.ParamByName( 'pletrafactura' ).AsString    := 'A';
              sdqFnclDatos.ParamByName( 'psituacionfactura' ).AsString:= lPad(sdqPagoSumario.FieldByName('ps_idbeneficiariopago').AsString, '0', 4);
              sdqFnclDatos.ParamByName( 'pnumerofactura' ).AsString   := lPad(sdqPagoSumario.FieldByName('ps_idsumario').AsString ,'0', 6) +
                                                                         lPad(sdqPagoSumario.FieldByName('ps_numpago').AsString, '0', 2);
              sdqFnclDatos.ParamByName( 'vendor_id' ).AsInteger       := Get_VendorID (PonerGuiones (sdqPagoSumario.FieldByName ('ps_cuitcuil').AsString), 'CUIT');

              sdqFnclDatos.Close;
              dmFinancials.OpenQuery( sdqFnclDatos );

              if (sdqFnclDatos.FieldByName( 'OrdenNro' ).Value > 0) and
                 ((dtpFechaAprobacionDesde.Date < sdqFnclDatos.FieldByName( 'OrdenFecha' ).Value) or
                  (dtpFechaAprobacionHasta.Date > sdqFnclDatos.FieldByName( 'OrdenFecha' ).Value)) then
              begin
                sdqPagoSumario.Edit;
                sdqPagoSumario.FieldByName( 'OrdenNro' ).Value    :=  sdqFnclDatos.FieldByName( 'OrdenNro' ).Value;
                sdqPagoSumario.FieldByName( 'OrdenFecha' ).Value  :=  sdqFnclDatos.FieldByName( 'OrdenFecha' ).Value;
                sdqPagoSumario.FieldByName( 'ChequeNro' ).Value   :=  sdqFnclDatos.FieldByName( 'ChequeNro' ).Value;
                sdqPagoSumario.FieldByName( 'ChequeFecha' ).Value :=  sdqFnclDatos.FieldByName( 'ChequeFecha' ).Value;
                sdqPagoSumario.Post;

                sdqPagoSumario.Next
              end
              else
                sdqPagoSumario.Delete;

              sdqFnclDatos.Close;
            end;
          finally
            sdqFnclDatos.Free;
          end
        end;
      except
        on E : Exception do;
      end;
    end

  finally
    dmFinancials.Active := bFnlActive;
    sdqPagoSumario.EnableControls;
    DetenerEspera;
  end;
end;

procedure TfrmAutorizacionPagosSumarios.tbOrdenarClick(Sender: TObject);
begin
  SortDialog1.Execute
end;

procedure TfrmAutorizacionPagosSumarios.SeguridadAfterExecute(Sender: TObject);
begin
  FbtnAprobacionPagosEnable := tbAprobacionPagos.Enabled;
end;

procedure TfrmAutorizacionPagosSumarios.dbgPagosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsExclusiva() then
    AFont.Color := pnlColor1.Font.Color;
end;

function TfrmAutorizacionPagosSumarios.IsExclusiva: Boolean;
begin
  Result := (sdqPagoSumario.FieldByName('pagoexclusivo').AsString = 'S');
end;

end.

