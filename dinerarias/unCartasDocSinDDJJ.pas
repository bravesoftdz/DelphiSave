unit unCartasDocSinDDJJ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, FormPanel, Buttons, unFraCodigoDescripcion, SinEdit,
  unFraEmpresa, PeriodoPicker, unfraFirmantes;

type
  TfrmCartasDocSinDDJJ = class(TfrmCustomConsulta)
    gbFechas: TGroupBox;
    DTPHasta: TDateComboBox;
    Label2: TLabel;
    DTPDesde: TDateComboBox;
    tbGenerarCarta: TToolButton;
    tbRecDocum: TToolButton;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    fpDetalle: TFormPanel;
    dgDetalle: TArtDBGrid;
    Bevel5: TBevel;
    Label3: TLabel;
    edEmpresa: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    btnActualizarRecibos: TBitBtn;
    btnCerrarRecibos: TBitBtn;
    sdqDetalle: TSDQuery;
    dsDetalle: TDataSource;
    Bevel1: TBevel;
    tbDetalle: TToolButton;
    gbFirmante: TGroupBox;
    fpRecepcionDocum: TFormPanel;
    Bevel3: TBevel;
    Label6: TLabel;
    dcFechaRecepcion: TDateComboBox;
    dgDocumentacion: TDBGrid;
    btnActualizarFecha: TBitBtn;
    edEmpresaFecha: TEdit;
    Label5: TLabel;
    Bevel2: TBevel;
    sdqFechaRecep: TSDQuery;
    dsFechaRecep: TDataSource;
    btnCerrarFecha: TBitBtn;
    bgEstado: TGroupBox;
    rbPendiente: TRadioButton;
    rbGenerada: TRadioButton;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    ppDesde: TPeriodoPicker;
    ppHasta: TPeriodoPicker;
    gbGPBA: TGroupBox;
    rbGPBATodos: TRadioButton;
    rbGPBANo: TRadioButton;
    rbGPBASi: TRadioButton;
    btnRefrescarDoc: TSpeedButton;
    Bevel4: TBevel;
    Label8: TLabel;
    rbTodosDoc: TRadioButton;
    rbSiDoc: TRadioButton;
    rbNoDoc: TRadioButton;
    dcHastaDoc: TDateComboBox;
    Label7: TLabel;
    dcDesdeDoc: TDateComboBox;
    btnExportarDoc: TSpeedButton;
    edDocum: TExportDialog;
    fraFirmantes: TfraFirmantes;
    dcDesdeDoc2: TDateComboBox;
    Label9: TLabel;
    dcHastaDoc2: TDateComboBox;
    btnOrdenar: TSpeedButton;
    sdDetalle: TSortDialog;
    gbRecepcion: TGroupBox;
    rbRecepcionTodas: TRadioButton;
    rbRecepcionNo: TRadioButton;
    rbRecepcionSi: TRadioButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbGenerarCartaClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbDetalleClick(Sender: TObject);
    procedure btnActualizarRecibosClick(Sender: TObject);
    procedure sdqDetalleAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbRecDocumClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqFechaRecepAfterScroll(DataSet: TDataSet);
    procedure btnActualizarFechaClick(Sender: TObject);
    procedure rbPendienteClick(Sender: TObject);
    procedure rbGeneradaClick(Sender: TObject);
    procedure fpRecepcionDocumBeforeShow(Sender: TObject);
    procedure rbSiDocClick(Sender: TObject);
    procedure btnRefrescarDocClick(Sender: TObject);
    procedure btnExportarDocClick(Sender: TObject);
    procedure btnOrdenarClick(Sender: TObject);
  private
    dDesde, dHasta: TDate;
    function HayRegistroActivo: Boolean;
    function HayRegistroSeleccionado: Boolean;
    function GetCantCompletos(sCuit :String): Integer;
    procedure DoBorrarTemporal;
    procedure DoHabilitarPanel(bPendientes :Boolean);
    procedure ActualizarGrillaDoc;
  public
    { Public declarations }
  end;

var
  frmCartasDocSinDDJJ: TfrmCartasDocSinDDJJ;

implementation

uses CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal, unSesion, uncomunes, General,
  VCLExtra;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  if rbPendiente.Checked then
    Verificar(DTPDesde.IsEmpty or DTPHasta.IsEmpty, DTPDesde, 'Debe seleccionar un rango de fechas');

  dDesde    := DTPDesde.Date;
  dHasta    := DTPHasta.Date;
  //borro la temporal...
  DoBorrarTemporal;
  //inserto para trabajar sobre esta (la vista tarda mucho para llamarla a cada rato)
  if rbPendiente.Checked then
  begin
    sSql := ' INSERT INTO tmp_siniestrossinddjj ' +
            ' (mp_idexpediente, mp_siniestro, mp_orden, mp_recaida, ' +
            '  mp_cuit, mp_cuil, mp_fecha, mp_usuario) ' +
            ' SELECT idexpediente, siniestro, orden, recaida, cuit, cuil, ' +
                   ' MAX(fechaevento), ' + SqlValue(Sesion.UserID) + 
              ' FROM v_siniestros_sin_ddjj ' +
             ' WHERE fechaevento BETWEEN ' + SqlDate(dDesde) + ' AND ' + SqlDate(dHasta);

    if rbGPBASi.Checked then
      sSql := sSql + ' AND siniestro >= ' + SqlInt(MIN_SINIESTRO_GOB)
    else if rbGPBANo.Checked then
      sSql := sSql + ' AND siniestro < ' + SqlInt(MIN_SINIESTRO_GOB);

    sSql := sSql + ' GROUP BY idexpediente, siniestro, orden, recaida, cuit, cuil ';
  end
  else begin
    sSql := ' INSERT INTO tmp_siniestrossinddjj ' +
            ' (mp_idexpediente, mp_siniestro, mp_orden, mp_recaida, ' +
            '  mp_cuit, mp_cuil, mp_fecha, mp_usuario, mp_nrocartadoc, ' +
            '  mp_fechacartadoc, mp_recepcioncartadoc) ' +
            ' SELECT ex_id, ex_siniestro, ex_orden, ex_recaida, ex_cuit, ex_cuil, ' +
                   ' ex_fechaaccidente fecha, ' + SqlValue(Sesion.UserID) + ',' +
                   ' ca_nrocartadoc, nvl(trunc(ca_fechareimpresion), trunc(ca_fechaimpresion)), ' +
                   ' ca_recepcionok ' +
              ' FROM sex_expedientes, cca_carta, SIN.ssc_siniestrosporcarta ' +
             ' WHERE sc_idexpediente = ex_id ' +
               ' AND ca_id = sc_idcarta ';

    if rbGPBASi.Checked then
      sSql := sSql + ' AND ex_siniestro >= ' + SqlInt(MIN_SINIESTRO_GOB)
    else if rbGPBANo.Checked then
      sSql := sSql + ' AND ex_siniestro < ' + SqlInt(MIN_SINIESTRO_GOB);

    if not edSiniestro.IsEmpty then
      sSql := sSql + ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                     ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                     ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida);

    if rbRecepcionSi.Checked then
      sSql := sSql + ' AND ca_recepcionok = ''S'' '
    else if rbRecepcionNo.Checked then
      sSql := sSql + ' AND ca_recepcionok = ''N'' ';

    if not fraEmpresa.IsEmpty then
      sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);
  end;

  EjecutarSql(sSql);

  sSql := 'SELECT utiles.armar_cuit(mp_cuit) cuitentero, mp_cuit, em_nombre, count(*) cantidad, ' +
                ' mp_nrocartadoc, mp_fechacartadoc, mp_recepcioncartadoc ' +
           ' FROM aem_empresa, tmp_siniestrossinddjj ' +
          ' WHERE mp_cuit = em_cuit ' +
            ' AND mp_usuario = ' + SqlValue(Sesion.UserID);
  if rbPendiente.Checked then
    sSql := sSql + ' AND mp_fecha BETWEEN ' + SqlDate(dDesde) + ' AND ' + SqlDate(dHasta)
  else begin
    if not edSiniestro.IsEmpty then
      sSql := sSql + ' AND mp_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                     ' AND mp_orden = ' + SqlInt(edSiniestro.Orden) +
                     ' AND mp_recaida = ' + SqlInt(edSiniestro.Recaida);
    if not fraEmpresa.IsEmpty then
      sSql := sSql + ' AND mp_cuit = ' + SqlValue(fraEmpresa.CUIT);
  end;

  sSql := sSql + ' GROUP BY mp_cuit, em_nombre, mp_nrocartadoc, mp_fechacartadoc, mp_recepcioncartadoc ';
  sdqConsulta.SQL.Text := sSql;

  tbDetalle.Enabled       := rbPendiente.Checked;
  tbGenerarCarta.Enabled  := rbPendiente.Checked;
  tbRecDocum.Enabled      := rbGenerada.Checked;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.tbLimpiarClick(Sender: TObject);
begin
  DTPDesde.Clear;
  DTPHasta.Clear;
  tbDetalle.Enabled         := False;
  tbGenerarCarta.Enabled    := False;
  tbRecDocum.Enabled        := False;
  rbPendiente.Checked       := True;
  rbGPBATodos.Checked       := True;
  rbRecepcionTodas.Checked  := True;
  dDesde := 0;
  dHasta := 0;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.tbGenerarCartaClick(Sender: TObject);
var
  iCantCompletos, idCarta, iCantidad, i, iCantCartas, iRegistros, iCartasGeneradas :Integer;
  sSql, sCuit :String;
  sdqTmp :TSDQuery;
begin
  Verificar(not HayRegistroSeleccionado, Grid, 'No hay ningún registro seleccionado');
  Verificar(fraFirmantes.IsEmpty, fraFirmantes, 'Debe ingresar el firmante para la Carta');
  iCartasGeneradas := 0;
  for iRegistros := 0 to Grid.SelectedRows.Count - 1 do
  try
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iRegistros]));
    sCuit := sdqConsulta.FieldByName('mp_cuit').AsString;
    if not(ValidarEmpresaConfidencial(sCuit, AREA_DIN)) then
      Next
    else begin
      iCantidad       := sdqConsulta.FieldByName('cantidad').AsInteger;
      iCantCompletos  := GetCantCompletos(sCuit);
      if (iCantCompletos = 0) then
      begin
        MsgBox('La Empresa: ' +  sdqConsulta.FieldByName('em_nombre').AsString +
               ' no tiene ningún período de recibo completo.'+#13+#10+'No se ha generado la Carta Documento correspondiente.', MB_ICONERROR);
        Next;
      end
      else if (iCantCompletos = iCantidad) or
              ((iCantCompletos < iCantidad) and
               (MessageDlg('No están completos todos los pedidos de recibo para la Empresa: ' + sdqConsulta.FieldByName('em_nombre').AsString +#13+#10+
                           '¿Desea generar la carta para los siniestros que están completos?', mtConfirmation, [mbYes, mbNo], 0) = mrYes))
      then begin
        iCantCartas := iCantCompletos div 3; //tengo que generar una carta por cada 3 siniestros debido al espacio en el texto de la misma
        for i := 0 to iCantCartas do
        begin
          BeginTrans;
          //primero inserto la carta ya que necesito el ID
          IdCarta := ValorSqlInteger('SELECT seq_cca_id.nextval FROM dual');
          sSql := 'INSERT INTO cca_carta ' +
                  '(ca_id, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ' +
                  ' ca_idendoso, ca_usualta, ca_fechaalta, ca_idareatexto) ' +
                ' (SELECT ' + SqlInt(IdCarta) + ', tc_id, tb_codigo, ''C'', ' +
                   SqlInt(fraFirmantes.Value) + ',' +
                 ' afiliacion.get_ultidendoso(afiliacion.get_ultcontrato(' + SqlValue(sCuit) + ')), ' +
                   SqlValue(Sesion.UserID) + ', actualdate, ta_idareatexto ' +
            ' FROM ctb_tablas, cta_textoarea, cat_areatexto, ctc_textocarta   ' +
           ' WHERE tb_clave = ''CORRE'' ' +
             ' AND tb_especial1 = ''D'' ' +
             ' AND tb_fechabaja IS NULL ' +
             ' AND ta_fechabaja IS NULL ' +
             ' AND at_fechabaja IS NULL ' +
             ' AND tc_rpt = ''cartasolicitudnosuss'' ' + //feo hardcodeo pero...
             ' AND at_id = ta_idareatexto ' +
             ' AND ta_idtextocarta = tc_id ' +
             ' AND at_area = ' +  SqlValue(AREA_DIN) +
             ' AND at_modulo = ' + SqlValue(MODULO_NOTIFICACIONES) + ') ';
          EjecutarSqlST(sSql);

          sSql := 'SELECT b.mp_idexpediente, b.mp_recibodesde, b.mp_recibohasta ' +
                   ' FROM tmp_siniestrossinddjj a, tmp_pedidosrecibo b ' +
                  ' WHERE a.mp_idexpediente = b.mp_idexpediente ' +
                    ' AND a.mp_fecha BETWEEN ' + SqlDate(dDesde) + ' AND ' + SqlDate(dHasta) +
                    ' AND a.mp_cuit = ' + SqlValue(sCuit) +
                    ' AND NOT EXISTS (SELECT 1 FROM sin.ssc_siniestrosporcarta ' +
                                            ' WHERE sc_idexpediente = b.mp_idexpediente) ' +
                    ' AND rownum <= 3';

          sdqTmp := GetQuery(sSql);
          with sdqTmp do
          try
            while not Eof do
            begin
              //despues inserto el detalle de los siniestros por carta
              sSql := 'INSERT INTO sin.ssc_siniestrosporcarta ' +
                      '(sc_idcarta, sc_idexpediente, sc_fechaalta, sc_usualta, ' +
                      ' sc_recibodesde, sc_recibohasta) VALUES ( ' +
                      SqlInt(idCarta) + ',' + SqlInt(Fields[0].AsInteger) + ', actualdate, ' +
                      SqlValue(Sesion.UserID) + ',' + SqlValue(Fields[1].AsString) + ',' +
                      SqlValue(Fields[2].AsString) + ')';
              EjecutarSqlST(sSql);
              //y por ultimo borro de la temporal
              sSql := 'DELETE FROM tmp_pedidosrecibo ' +
                      ' WHERE mp_idexpediente = ' + SqlInt(Fields[0].AsInteger);
              EjecutarSqlST(sSql);
              Next;
            end;
          finally
            Free;
          end;
          CommitTrans;
          Inc(iCartasGeneradas)
        end; //del for
      end;
    end;
  except
    on E: Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al generar la Carta.');
     end;
  end;
  
  if (iCartasGeneradas > 0) then
  begin
    MsgBox('Se han generado ' + IntToStr(iCartasGeneradas) + ' Cartas Documento.', MB_ICONINFORMATION, 'Información');
    tbRefrescarClick(Nil);
  end
  else
    MsgBox('Atención: no se ha generado ninguna Carta Documento.', MB_ICONINFORMATION, 'Información');
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.GridDblClick(Sender: TObject);
begin
  if tbDetalle.Enabled then tbDetalleClick(Nil);
end;
{-------------------------------------------------------------------------------}
function TfrmCartasDocSinDDJJ.HayRegistroActivo: Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
function TfrmCartasDocSinDDJJ.HayRegistroSeleccionado: Boolean;
begin
  Result := HayRegistroActivo and (Grid.SelectedRows.Count > 0);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.tbDetalleClick(Sender: TObject);
var
  sSql: String;
begin
  if HayRegistroActivo then
  begin
    sSql := 'SELECT utiles.armar_siniestro(a.mp_siniestro, a.mp_orden, a.mp_recaida) siniestro, ' +
                  ' a.mp_idexpediente, b.mp_recibodesde, b.mp_recibohasta, ex_fechaaccidente ' +
             ' FROM tmp_siniestrossinddjj a, tmp_pedidosrecibo b, sex_expedientes ' +
            ' WHERE a.mp_idexpediente = ex_id ' +
              ' AND a.mp_idexpediente = b.mp_idexpediente(+) ' +
              ' AND a.mp_fecha BETWEEN ' + SqlDate(dDesde) +
                                 ' AND ' + SqlDate(dHasta) +
              ' AND a.mp_cuit = ' + SqlValue(sdqConsulta.FieldByName('mp_cuit').AsString) +
              ' AND a.mp_usuario = ' + SqlValue(Sesion.UserID);
    with sdqDetalle do
    begin
      Close;
      SQL.Text := sSql + ' ORDER BY a.mp_idexpediente';
      Open;
    end;
    edEmpresa.Text := sdqConsulta.FieldByName('em_nombre').AsString;
    fpDetalle.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.btnActualizarRecibosClick(Sender: TObject);
var
  sSql :String;
  IdExp :Integer;
  bSinValores, bExiste :Boolean;
begin
  bSinValores := (ppDesde.Periodo.IsNull or ppHasta.Periodo.IsNull);
  Verificar(not(bSinValores) and (ppDesde.Periodo.Valor > ppHasta.Periodo.Valor),
            ppDesde, 'El Período Desde no puede ser mayor que el Período Hasta');
  IdExp         := sdqDetalle.FieldByName('mp_idexpediente').AsInteger;
  sSql          := 'SELECT 1 FROM tmp_pedidosrecibo ' +
                   ' WHERE mp_idexpediente = ' + SqlInt(IdExp);
  bExiste       := ExisteSql(sSql);
  if bExiste and bSinValores then //si ya existia y no pusieron valores, lo elimino
    sSql := 'DELETE FROM tmp_pedidosrecibo ' +
            ' WHERE mp_idexpediente = ' + SqlInt(IdExp)
  else if bExiste and not(bSinValores) then //si ya existia y pusieron valores
    sSql := 'UPDATE tmp_pedidosrecibo ' +
              ' SET mp_recibodesde = ' + SqlValue(IntToStr(ppDesde.Periodo.Mes) + '/' + IntToStr(ppDesde.Periodo.Ano)) + ',' +
                  ' mp_recibohasta = ' + SqlValue(IntToStr(ppHasta.Periodo.Mes) + '/' + IntToStr(ppHasta.Periodo.Ano)) +
            ' WHERE mp_idexpediente = ' + SqlInt(IdExp)
  else //si no existia
    sSql := 'INSERT INTO tmp_pedidosrecibo ' +
            '(mp_idexpediente, mp_recibodesde, mp_recibohasta) VALUES ( ' +
            SqlInt(IdExp) + ',' + SqlValue(IntToStr(ppDesde.Periodo.Mes) + '/' + IntToStr(ppDesde.Periodo.Ano)) + ',' +
            SqlValue(IntToStr(ppHasta.Periodo.Mes) + '/' + IntToStr(ppHasta.Periodo.Ano)) + ')';
  EjecutarSql(sSql);
  sdqDetalle.Refresh;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.sdqDetalleAfterScroll(DataSet: TDataSet);
var
  sMaxD, sMaxH, sDesde, sHasta: String;
begin
  sDesde  := ValorSql('SELECT TO_CHAR(TO_DATE(' + SqlValue(DataSet.FieldByName('mp_recibodesde').AsString) + ', ''MM/YYYY''), ''YYYY/MM'') FROM DUAL');
  sHasta  := ValorSql('SELECT TO_CHAR(TO_DATE(' + SqlValue(DataSet.FieldByName('mp_recibohasta').AsString) + ', ''MM/YYYY''), ''YYYY/MM'') FROM DUAL');
  sMaxD   := ValorSql('SELECT TO_CHAR(' + SqlDate(DataSet.FieldByName('ex_fechaaccidente').AsDateTime-365) + ', ''YYYY/MM'') FROM DUAL');
  sMaxH   := ValorSql('SELECT TO_CHAR(' + SqlDate(DataSet.FieldByName('ex_fechaaccidente').AsDateTime) + ', ''YYYY/MM'') FROM DUAL');

  ppDesde.Periodo.Valor       := IIF(DataSet.FieldByName('mp_recibodesde').IsNull, sMaxD, sDesde);
  ppHasta.Periodo.Valor       := IIF(DataSet.FieldByName('mp_recibohasta').IsNull, sMaxH, sHasta);
  ppDesde.Periodo.MaxPeriodo  := sMaxD;
  ppHasta.Periodo.MaxPeriodo  := sMaxH;

  ppDesde.Periodo.SetPeriodoActual;
  ppHasta.Periodo.SetPeriodoActual;
end;
{-------------------------------------------------------------------------------}
function TfrmCartasDocSinDDJJ.GetCantCompletos(sCuit :String) :Integer;
var
  sSql :String;
begin
  sSql := 'SELECT COUNT(*) ' +
           ' FROM tmp_siniestrossinddjj a, tmp_pedidosrecibo b ' +
          ' WHERE a.mp_idexpediente = b.mp_idexpediente ' +
  	        ' AND a.mp_fecha BETWEEN ' + SqlDate(dDesde) + ' AND ' + SqlDate(dHasta) +
            ' AND a.mp_cuit = ' + SqlValue(sCuit) +
            ' AND a.mp_usuario = ' + SqlValue(Sesion.UserID);
  Result := ValorSqlInteger(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.FormCreate(Sender: TObject);
begin
  inherited;
  fraFirmantes.Area         := AREA_DIN;
  fraFirmantes.Modulo       := MODULO_NOTIFICACIONES;
  fraEmpresa.ShowBajas      := True;
  dcFechaRecepcion.MaxDate  := DBDate;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.tbRecDocumClick(Sender: TObject);
begin
  if HayRegistroActivo then fpRecepcionDocum.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.DoBorrarTemporal;
var
  sSql :String;
begin
  sSql := 'DELETE FROM tmp_siniestrossinddjj ' +
          ' WHERE mp_usuario = ' + SqlValue(Sesion.UserID);
  EjecutarSql(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DoBorrarTemporal;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.sdqFechaRecepAfterScroll(DataSet: TDataSet);
begin
  dcFechaRecepcion.Date := DataSet.FieldByName('sc_fecharecepdocum').AsDateTime;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.btnActualizarFechaClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'UPDATE sin.ssc_siniestrosporcarta ' +
            ' SET sc_fecharecepdocum = ' + SqlDate(dcFechaRecepcion.Date) + ',' +
                ' sc_fechamodif = actualdate, ' +
                ' sc_usumodif = ' + SqlValue(Sesion.UserID) +
          ' WHERE sc_idexpediente = ' + SqlInt(sdqFechaRecep.FieldByName('mp_idexpediente').AsInteger);
  EjecutarSql(sSql);
  sdqFechaRecep.Refresh;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.rbPendienteClick(Sender: TObject);
begin
  DoHabilitarPanel(rbPendiente.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.DoHabilitarPanel(bPendientes :Boolean);
begin
  gbFechas.Enabled      := bPendientes;
  gbFirmante.Enabled    := bPendientes;
  gbSiniestro.Enabled   := not bPendientes;
  gbRecepcion.Enabled   := not bPendientes;
  gbEmpresa.Enabled     := not bPendientes;
  if bPendientes then
  begin
    edSiniestro.Clear;
    fraEmpresa.Clear;
    DTPDesde.SetFocus;
    rbRecepcionTodas.Checked := True;
  end
  else begin
    DTPDesde.Clear;
    DTPHasta.Clear;
    fraFirmantes.Limpiar;
    edSiniestro.SetFocus;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.rbGeneradaClick(Sender: TObject);
begin
  DoHabilitarPanel(not rbGenerada.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.fpRecepcionDocumBeforeShow(Sender: TObject);
begin
  rbTodosDoc.Checked  := True;
  edEmpresaFecha.Text := sdqConsulta.FieldByName('em_nombre').AsString;
  ActualizarGrillaDoc;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.rbSiDocClick(Sender: TObject);
begin
  dcDesdeDoc.Clear;
  dcHastaDoc.Clear;
  dcDesdeDoc2.Clear;
  dcHastaDoc2.Clear;
  LockControls([dcDesdeDoc, dcHastaDoc], not rbSiDoc.Checked);
  LockControls([dcDesdeDoc2, dcHastaDoc2], not rbNoDoc.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.ActualizarGrillaDoc;
var
  sSql: String;
begin
  sSql := 'SELECT utiles.armar_siniestro(mp_siniestro, mp_orden, mp_recaida) siniestro, ' +
                ' mp_idexpediente, tj_nombre, sc_fecharecepdocum, tj_documento, ' +
                ' sc_recibodesde, sc_recibohasta, mp_fechacartadoc, ex_diagnostico, ' +
                ' ex_altamedica, art.inca.get_ultfechadictamen(ex_id) fdictamen, ' +
                ' ex_fechaaccidente, tj_sexo ' +
           ' FROM tmp_siniestrossinddjj, SIN.ssc_siniestrosporcarta, ctj_trabajador, ' +
                ' art.sex_expedientes ' +
          ' WHERE mp_idexpediente = sc_idexpediente ' +
            ' AND sc_idexpediente = ex_id ' + 
            ' AND tj_cuil = mp_cuil ' +
            ' AND mp_usuario = ' + SqlValue(Sesion.UserID) +
            ' AND mp_cuit = ' + SqlValue(sdqConsulta.FieldByName('mp_cuit').AsString);

  if rbSiDoc.Checked then
    sSql := sSql + ' AND sc_fecharecepdocum IS NOT NULL '
  else if rbNoDoc.Checked then
    sSql := sSql + ' AND sc_fecharecepdocum IS NULL ';

  if not dcDesdeDoc.IsEmpty then
    sSql := sSql + ' AND sc_fecharecepdocum >= ' + SqlDate(dcDesdeDoc.Date);

  if not dcHastaDoc.IsEmpty then
    sSql := sSql + ' AND sc_fecharecepdocum <= ' + SqlDate(dcHastaDoc.Date);

  if not dcDesdeDoc2.IsEmpty then
    sSql := sSql + ' AND mp_fechacartadoc >= ' + SqlDate(dcDesdeDoc2.Date);

  if not dcHastaDoc2.IsEmpty then
    sSql := sSql + ' AND mp_fechacartadoc <= ' + SqlDate(dcHastaDoc2.Date);

  with sdqFechaRecep do
  begin
    Close;
    SQL.Text := sSql + sdDetalle.OrderBy;
    Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.btnRefrescarDocClick(Sender: TObject);
begin
  ActualizarGrillaDoc;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.btnExportarDocClick(Sender: TObject);
begin
  edDocum.Title := edEmpresaFecha.Text;
  edDocum.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartasDocSinDDJJ.btnOrdenarClick(Sender: TObject);
begin
  sdDetalle.Execute;
end;
{-------------------------------------------------------------------------------}
end.
