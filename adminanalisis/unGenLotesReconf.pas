{-----------------------------------------------------------------------------
 Unit Name: unGenLotesReconf
 Author:    racastro
 Date:      22-Jul-2008
 Purpose:   Generación de lotes de estudios por Reconfirmación
 History:
-----------------------------------------------------------------------------}

unit unGenLotesReconf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraEstudio, StdCtrls, Mask, ToolEdit, DateComboBox,
  CustomDlgs, unFraCodigoDescripcion, General, unSesion, unListaEMail, unfraEstablecimiento_OLD, unArtFrame,
  unArtDbFrame, unFraEmpresaAfi, unArtDBAwareFrame, unFraStaticCodigoDescripcion, JvgGroupBox, 
  unfraPrestadorAMP, FormPanel, unfraPrestadorAMPCuit, unFraEmpresa, unFraEstablecimiento, ExComboBox, unExportPDF,
  Strfuncs, DateTimeFuncs, JvExExtCtrls, JvNetscapeSplitter, Menus, DateUtils;

type
  TfrmGenLotesReconf = class(TfrmCustomConsulta)
    Bevel2: TBevel;
    Bevel3: TBevel;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    gbTrabajadores: TJvgGroupBox;
    ArtDBGrid1: TArtDBGrid;
    sdqTrabajadores: TSDQuery;
    dsTrabajadores: TDataSource;
    ordTrabajadores: TSortDialog;
    fpDatosLote: TFormPanel;
    Label6: TLabel;
    Label7: TLabel;
    chkNotificacion: TCheckBox;
    memObservaciones: TMemo;
    Bevel7: TBevel;
    btnAceptarLote: TButton;
    btnCancelarLote: TButton;
    fraPrestador: TfraPrestadorAMPCuit;
    sdqDatosPQ: TSDQuery;
    fraEmpresa: TfraEmpresa;
    lbEstableci: TLabel;
    ToolBar1: TToolBar;
    tbOrdTrabajadores: TToolButton;
    tbGenerarLote: TToolButton;
    tbSeparador: TToolButton;
    tbSeleccionar: TToolButton;
    lbCPostal: TLabel;
    edCPostalFiltro: TEdit;
    tbVerEstabCUIT: TToolButton;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    tbSolicitarPresupuesto: TToolButton;
    btnPresupuesto: TButton;
    edMAX_FECHA_SOLICITUD_AMPDesde: TDateComboBox;
    Label9: TLabel;
    edMAX_FECHA_SOLICITUD_AMPHasta: TDateComboBox;
    Label10: TLabel;
    chkSinPresupuesto: TCheckBox;
    dbgListado: TDBGrid;
    tbAgendaObsAsig: TToolButton;
    dsListado: TDataSource;
    sdqListado: TSDQuery;
    procedure FormCreate(Sender: TObject);
    function HayMultiplesEstablecimientos: Boolean;
    procedure tbGenerarLoteClick(Sender: TObject);
    procedure tbOrdTrabajadoresClick(Sender: TObject);
    procedure fpDatosLoteShow(Sender: TObject);
    procedure btnAceptarLoteClick(Sender: TObject);
    procedure GenerarPqDatosPrestador(pLote: Integer; pPrestador, pListaEMail: String);
    procedure tbSeleccionarClick(Sender: TObject);
    procedure tbVerEstabCUITClick(Sender: TObject);
    procedure tbSolicitarPresupuestoClick(Sender: TObject);
    procedure btnPresupuestoClick(Sender: TObject);
    procedure chkSinPresupuestoClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbAgendaObsAsigClick(Sender: TObject);
    procedure sdqConsultaBeforeClose(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
  private
    FFiltros: String;
    FGenerarLoteSinFechaCarga: Boolean;
    function GetComponenteSeguridad: TSeguridad;
    procedure OnEmpresaChange(Sender : TObject);
    procedure OnEstablecimientoChange(Sender : TObject);
  protected
    FIDLote : Integer;
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, unVisualizador, unConsEstabCUIT, unArt, VCLExtra,
  unObsAsigLote, unRptInformeGenReconfDet, unRptInfPrestadorReconf;

{$R *.DFM}


function TfrmGenLotesReconf.GetComponenteSeguridad: TSeguridad;
var
  iLoop: Integer;
begin
  Result := nil;

  if Application.MainForm = nil then
    Exit;

  for iLoop := 0 to Application.MainForm.ComponentCount - 1 do
    if Application.MainForm.Components[iLoop] is TSeguridad then
    begin
      Result := TSeguridad(Application.MainForm.Components[iLoop]);
      Break;
    end;
end;

{-----------------------------------------------------------------------------
  Procedure: ClearData
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: None
  Result:    None
  Purpose:   Limpia los filtros
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.ClearData;
begin
  fraEmpresa.Clear;
  fraEstablecimiento.Limpiar;
  sdqConsulta.Close;
  edMAX_FECHA_SOLICITUD_AMPDesde.Clear;
  edMAX_FECHA_SOLICITUD_AMPHasta.Clear;
  chkSinPresupuesto.Checked := False;

  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: RefreshData
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: None
  Result:    None
  Purpose:   Actualiza consulta principal
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.RefreshData;
begin
  FFiltros := '';

  if fraEmpresa.IsSelected then
    FFiltros := FFiltros + ' AND em_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text);

  if fraEstablecimiento.IsSelected then
    FFiltros := FFiltros + ' AND es_nroestableci = ' + fraEstablecimiento.edCodigo.TextSql + ' ';

  if chkSinPresupuesto.Checked then
    FFiltros := FFiltros + ' AND gr_fechaultpresup IS NULL ';

  FFiltros := FFiltros +
              SqlBetweenDateTime(' AND gr_fechaultpresup ', edMAX_FECHA_SOLICITUD_AMPDesde.Date, edMAX_FECHA_SOLICITUD_AMPHasta.Date, True) +
              iif (tbMaxRegistros.Down, ' AND ROWNUM <= ' + IntToStr(MaxRegistros), '');
              iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND es_cpostal = ' + SqlValue(edCPostalFiltro.Text));

  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text := 'SELECT em_id, aes.es_id, em_cuit, em_nombre, aes.es_contrato, ' +
                          '       aes.es_nroestableci, aes.es_nombre, aes.es_cpostal, ' +
                          '       art.utiles.armar_domicilio(aes.es_calle, aes.es_numero, ' +
                          '                                  aes.es_piso, aes.es_departamento, ' +
                          '                                  aes.es_localidad) domicilio, ' +
                          '       pv_descripcion, ''R'' operativo, ' +
                          '       (SELECT COUNT(re_idestudio) ' +
                          '          FROM hys.hre_reconfirmacionestudio hre ' +
                          '         WHERE re_fechabaja IS NULL ' +
                          '           AND re_idreconfirmacion = gr_id) examenes, el_rlid, ' +
                          '       el_fecharelevamiento, ca_descripcion, hgr.*' +
                          '  FROM art.cpr_prestador, hys.hle_loteestudio, hys.hrl_relevamientolote, ' +
                          '       hys.hel_estadolote, art.cpv_provincias, afi.aes_establecimiento aes, ' +
                          '       afi.aem_empresa, hys.hdl_detallelote hdl, ' +
                          '       hys.hgr_gestionreconfirmacion hgr ' +
                          ' WHERE ca_identificador = le_idprestador ' +
                          '   AND le_id = el_idlote ' +
                          '   AND rl_idestableci = dl_idestableci ' +
                          '   AND rl_id = el_rlid ' +
                          '   AND el_idlote = dl_idlote ' +
                          '   AND dl_id = gr_iddetallelote ' +
                          '   AND em_id = dl_idempresa ' +
                          '   AND aes.es_id = dl_idestableci ' +
                          '   AND pv_codigo = aes.es_provincia ' +
                          '   AND gr_estado = ''AP'' ' +
                          '   AND gr_enfprofesional = ''N'' ' +
                          '   AND gr_fechabaja IS NULL ' +
                          '   AND gr_idlote IS NULL ' +
                              FFiltros + ' ' +
                          'ORDER BY em_cuit, es_nroestableci';

  sdqListado.Sql.Clear;
  sdqListado.Sql.Text:= 'SELECT /*+ RULE*/ ' +
                        '       gr_fechaautorizacion "F.Autorización", em_cuit "CUIT", ' +
                        '       em_nombre "Razón Social", aes.es_contrato "Contrato", ' +
                        '       aes.es_nroestableci "Estab", aes.es_nombre "Nombre Establecimiento", ' +
                        '       aes.es_cpostal "C.Postal", ' +
                        '       art.utiles.armar_domicilio(aes.es_calle, aes.es_numero, ' +
                        '                                  aes.es_piso, ' +
                        '                                  aes.es_departamento, ' +
                        '                                  aes.es_localidad) "Domicilio", ' +
                        '       pv_descripcion "Provincia", ca_descripcion "Prestador anterior"' +
                        '       (SELECT COUNT(re_idestudio) ' +
                        '          FROM hys.hre_reconfirmacionestudio hre ' +
                        '         WHERE re_fechabaja IS NULL ' +
                        '           AND re_idreconfirmacion = gr_id) "Exámenes", ' +
                        '       gr_fechaultpresup "F.Solic.Ult.Presup.", tj_cuil "CUIL", ' +
                        '       tj_nombre "Nombre trabajador", es_codigo "Estudio", ' +
                        '       es_descripcion "Descripción estudio", gr_observacion "Observaciones" ' +
                        '  FROM art.cpr_prestador, hys.hle_loteestudio, art.cpv_provincias, ' +
                        '       afi.aes_establecimiento aes, afi.aem_empresa, hys.hdl_detallelote hdl, ' +
                        '       comunes.ctj_trabajador, art.aes_estudios, ' +
                        '       hys.hre_reconfirmacionestudio hre, hys.hgr_gestionreconfirmacion hgr ' +
                        ' WHERE ca_identificador = le_idprestador ' +
                        '   AND le_id = dl_idlote ' +
                        '   AND dl_id = gr_iddetallelote ' +
                        '   AND em_id = dl_idempresa ' +
                        '   AND aes.es_id = dl_idestableci ' +
                        '   AND pv_codigo = aes.es_provincia ' +
                        '   AND gr_estado = ''AP'' ' +
                        '   AND gr_enfprofesional = ''N'' ' +
                        '   AND gr_fechabaja IS NULL ' +
                        '   AND gr_idlote IS NULL ' +
                        '   AND dl_id = gr_iddetallelote ' +
                        '   AND tj_id = dl_idtrabajador ' +
                        '   AND es_codigo = re_idestudio ' +
                        '   AND re_fechabaja IS NULL ' +
                        '   AND re_idreconfirmacion = gr_id ' +
                            FFiltros + ' ' +
                        'ORDER BY em_cuit, es_nroestableci';

  inherited;

  sdqTrabajadores.Open;

  tbNuevo.Enabled := false;
  tbModificar.Enabled := false;
  tbEliminar.Enabled := false;
  tbPropiedades.Enabled := false;
  tbEnviarMail.Enabled := false;
end;

{-----------------------------------------------------------------------------
  Procedure: FormCreate
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Incialización del form
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.FormCreate(Sender: TObject);
var
  aSeguridad: TSeguridad;
begin
  FGenerarLoteSinFechaCarga := false;
  aSeguridad := GetComponenteSeguridad;

  if aSeguridad <> nil then
  begin
    if aSeguridad.Claves.ItemsByName['Permiso para Generar Lotes'] <> nil then
      FGenerarLoteSinFechaCarga := aSeguridad.Claves.ItemsByName['Permiso para Generar Lotes'].Value;
  end;

  tbSeparador.Left := tbSalir.Left - 1;
  tbGenerarLote.Left := tbSalir.Left - 1;
  tbSeleccionar.Left := tbSalir.Left - 1;
  tbVerEstabCUIT.Left := tbSalir.Left - 1;
  tbSolicitarPresupuesto.Left := tbSalir.Left - 1;
  tbAgendaObsAsig.Left := tbSalir.Left - 1;
  tbSeleccionar.Hint := 'Seleccionar Todo';

  inherited;

  gbTrabajadores.Collapsed := true;

  fraEmpresa.ShowBajas      := True;
  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEmpresa.ContratoActivo := True;

  fraEstablecimiento.OnChange := OnEstablecimientoChange;
end;

{-----------------------------------------------------------------------------
  Procedure: OnEmpresaChange
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Cambio de empresa
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.mskCUIT.Text ;
  sdqConsulta.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: OnEstablecimientoChange
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Cambio de Establecimiento
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.OnEstablecimientoChange(Sender: TObject);
begin
  sdqConsulta.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: chkSinPresupuestoClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Deshabilita/Habilita fechas de presupuestos
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.chkSinPresupuestoClick(Sender: TObject);
begin
  VCLExtra.LockControls([edMAX_FECHA_SOLICITUD_AMPDesde, edMAX_FECHA_SOLICITUD_AMPHasta], chkSinPresupuesto.Checked);
  if chkSinPresupuesto.Checked then
  begin
    edMAX_FECHA_SOLICITUD_AMPDesde.Clear;
    edMAX_FECHA_SOLICITUD_AMPHasta.Clear;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbAgendaObsAsigClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Observaciones de asignación
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbAgendaObsAsigClick(Sender: TObject);
var
  fObsAsigLote: TfrmObsAsigLote;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  fObsAsigLote := TfrmObsAsigLote.Create( Self );
  try
    fObsAsigLote.Caption    := 'Obs. en Asignaciones para el CUIT ' + sdqConsulta.FieldByName('em_cuit').AsString +
                               ' - Estab. ' + sdqConsulta.FieldByName('es_nroestableci').AsString;
    fObsAsigLote.FCUIT      := sdqConsulta.FieldByName('em_cuit').AsString;
    fObsAsigLote.FEstableci := sdqConsulta.FieldByName('es_nroestableci').AsInteger;
    fObsAsigLote.FTipoObs   := 'R';
    fObsAsigLote.tbRefrescarClick(Sender);

    Abrir(TfrmObsAsigLote, fObsAsigLote, tmvModal, nil);
  finally
    fObsAsigLote.Free;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: sdqConsultaBeforeClose
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: DataSet: TDataSet
  Result:    None
  Purpose:   Cierra consulta y colapsa grilla para trabajadores/estudios
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.sdqConsultaBeforeClose(DataSet: TDataSet);
begin
  gbTrabajadores.Collapsed := true;
  sdqTrabajadores.Close;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: tbSeleccionarClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Selecciona/deselecciona todos los registros de la grilla ppal.
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbSeleccionarClick(Sender: TObject);
begin
  if Grid.SelCount = 0 then
  begin
    Grid.SelectAll;
    tbSeleccionar.Hint := 'Deseleccionar Todo'
  end
  else begin
    Grid.UnselectAll;
    tbSeleccionar.Hint := 'Seleccionar Todo'
  end
end;

{-----------------------------------------------------------------------------
  Procedure: tbVerEstabCUITClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Visualiza los establecimientos asociados al CUIT/Contrato
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbVerEstabCUITClick(Sender: TObject);
var
  Contrato: String;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  Contrato := sdqConsulta.FieldByName('es_contrato').AsString;

  Abrir(TfrmConsEstabCUIT, frmConsEstabCUIT, tmvMDIChild, nil);
  with frmConsEstabCUIT do
  begin
    sdqConsulta.SQL.Clear;
    sdqConsulta.SQL.Add('  SELECT es_nroestableci, es_nombre, TO_DATE(le_fechaalta, ''DD/MM/YYYY'') fecha, ' +
                        '         es_cpostal, es_localidad, le_id, ' +
                        '         le_idprestador, ca_descripcion ' +
                        '    FROM afi.aes_establecimiento, hys.hle_loteestudio, art.cpr_prestador ' +
                        '   WHERE es_fechabaja IS NULL ' +
                        '     AND es_contrato = ' + SqlValue(Contrato) +
                        '     AND ca_identificador(+) = le_idprestador ' +
                        '     AND le_id(+) = art.amp.get_ultimolote(es_id) ' +
                        'ORDER BY 1 ');

    tbRefrescarClick(Sender);
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbOrdTrabajadoresClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Sort en grilla de trabajadores/estudios
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbOrdTrabajadoresClick(Sender: TObject);
begin
  ordTrabajadores.Execute
end;

{-----------------------------------------------------------------------------
  Procedure: tbImprimirClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Imprime datos de ambas grillas
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbImprimirClick(Sender: TObject);
begin
  with TrptInformeGenReconfDet.Create(nil) do
    try
      qryConsulta.SQL.Text := sdqListado.SQL.Text;
      qryConsulta.Open;

      Visualizar(qrInformeGenReconf, GetValores(), [oForceShowModal])
    finally
      qryConsulta.Close;
      free;
    end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbExportarClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Exporta datos de ambas grillas
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbExportarClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  OpenQuery(sdqListado);

  if sdqListado.Active and (not sdqListado.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    ExportDialog.Execute;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: GenerarPqDatosPrestador
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: pLote: Integer; pPrestador, pListaEMail: String
  Result:    None
  Purpose:   Genera pedido de PQ de datos con los estudios
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.GenerarPqDatosPrestador(pLote: Integer; pPrestador, pListaEMail: String);
var
  NroPedido,
  IDPedidoWEB: Integer;
  rptInfPrestadorReconf: TrptInfPrestadorReconf;
  FDirectorioEMail,
  FListaMail: String;
begin
  FListaMail := pListaEMail;

  GenerarListaEMail (FListaMail);
  if FListaMail = '' then
    Exit;

  with sdqDatosPQ do
  begin
    sdqDatosPQ.Close;
    ParamByName('le_id').Value := pLote;
    Open;

    FDirectorioEMail := IncludeTrailingPathDelimiter(ValorSql('SELECT tb_especial1 ' +
                                                              '  FROM art.ctb_tablas ' +
                                                              ' WHERE tb_clave = ''PATHS'' ' +
                                                              '   AND tb_codigo = ''005'' '));

    rptInfPrestadorReconf := TrptInfPrestadorReconf.Create( Self );
    try
      rptInfPrestadorReconf.FIDLoteRpt := pLote;
      ExportarPDF(rptInfPrestadorReconf.qrInformeAPrestador, FDirectorioEMail + Format('LOTE %d.pdf',[pLote]));
    finally
      rptInfPrestadorReconf.Free;
    end;

    // Obtengo el nro. de Pedido
    NroPedido := ValorSqlInteger ('SELECT hys.seq_hpr_id.nextval FROM dual');

    // Inserto el nuevo pedido
    EjecutarSql(
      'INSERT INTO hys.hpr_pedidosreporte(PR_ID, PR_EMAILRESPUESTA, PR_FECHAALTA, PR_USUALTA, PR_ORIGENPEDIDO, PR_ASUNTO) ' +
      'VALUES (' + SqlValue(NroPedido) + ', ' + SqlValue(FListaMail) +
      ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ''A'', ''Reconfirmación de estudios - ' + FieldByName('em_nombre').AsString + ''')'
    );

    while not EoF do
    begin
      // AMP
      IDPedidoWEB := GetSecNextVal ('hys.seq_hpw_id');
      EjecutarSql(
        'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
        'VALUES (' + SqlValue (IDPedidoWEB) + ', ' + SqlValue (179) + ', sysdate, ' +
        SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
      );

      // Inserto parámetro Lote
      EjecutarSql(
        'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE, PP_IDPEDIDOWEB) ' +
        'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('LOTEFILTRO') + ', ' +
        SqlValue (pLote) + ', ' + SqlValue(NroPedido) + ', ' + SqlValue (IDPedidoWEB) + ')'
      );

      // Inserto parámetro IDEmpresa
      EjecutarSql(
        'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE, PP_IDPEDIDOWEB) ' +
        'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('IDEMPRESAFILTRO') + ', ' +
        SqlValue (FieldByName('dl_idempresa').AsInteger) + ', ' + SqlValue(NroPedido) + ', ' + SqlValue (IDPedidoWEB) + ')'
      );

      // Inserto parámetro e-Mail
      EjecutarSql(
        'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE, PP_IDPEDIDOWEB) ' +
        'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('EMAILFILTRO') + ', ' +
        SqlValue (FListaMail) + ', ' + SqlValue(NroPedido) + ', ' + SqlValue (IDPedidoWEB) + ')'
      );

      Next
    end;

    sdqDatosPQ.Close
  end
end;

{-----------------------------------------------------------------------------
  Procedure: HayMultiplesEstablecimientos
  Author:    racastro
  Date:      19-Nov-2008
  Arguments: None
  Result:    Boolean
  Purpose:   Analiza si en el multiselect hay múltiples empresa/establecimiento
-----------------------------------------------------------------------------}
function TfrmGenLotesReconf.HayMultiplesEstablecimientos: Boolean;
var
  i,
  idestableci,
  cant: integer;
begin
  cant := 1;

  sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));
  idestableci := sdqConsulta.FieldByName('es_id').AsInteger;

  i := 1;
  while (i < Grid.SelectedRows.Count) and (cant = 1) do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
    if sdqConsulta.FieldByName('es_id').AsInteger <> idestableci then
      inc(cant);

    inc(i)
  end;

  result := cant > 1
end;

{-----------------------------------------------------------------------------
  Procedure: tbGenerarLoteClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Genera el lote
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbGenerarLoteClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una empresa/establecimiento.');
  Verificar(HayMultiplesEstablecimientos, Grid, 'La selección contiene múltiples empresa/establecimiento.');

  gbTrabajadores.Collapsed := True;
  fpDatosLote.ShowModal
end;

{-----------------------------------------------------------------------------
  Procedure: fpDatosLoteShow
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Analiza los prestadores posibles para el lote en base a los
             estudios a realizarse
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.fpDatosLoteShow(Sender: TObject);
var
  S,
  sSubConsulta,
  sEstudios: String;
  i: integer;
  tslEstudios,
  tslEstudiosSinDuplicados: TStringList;
begin
  // Creo la lista de TODOS los estudios a realizarse
  tslEstudiosSinDuplicados := TStringList.Create;
  tslEstudiosSinDuplicados.Sorted := true;
  tslEstudiosSinDuplicados.Duplicates := dupIgnore;

  for i := 0 to Grid.SelCount - 1 do
  begin
    Grid.GotoSelection (i);

    sSubConsulta := 'SELECT DISTINCT (es_codigo) ' +
                    '           FROM comunes.ctj_trabajador, hys.hdl_detallelote hdl, ' +
                    '                hys.hgr_gestionreconfirmacion hgr, art.aes_estudios, ' +
                    '                hys.hre_reconfirmacionestudio hre ' +
                    '          WHERE dl_id = gr_iddetallelote ' +
                    '            AND tj_id = dl_idtrabajador ' +
                    '            AND es_codigo = re_idestudio ' +
                    '            AND es_sincosto = ''N'' ' +
                    '            AND re_fechabaja IS NULL ' +
                    '            AND gr_id = re_idreconfirmacion ' +
                    '            AND re_idreconfirmacion = :gr_id ';

    tslEstudios := ValoresSqlEx(sSubConsulta, [sdqConsulta.FieldByName ('gr_id').AsInteger]);
    try
      tslEstudiosSinDuplicados.CommaText := tslEstudiosSinDuplicados.CommaText +
                                            #13 + tslEstudios.CommaText;
    finally
      tslEstudios.Free;
    end;
  end;

  memObservaciones.Lines.Clear;

  try
    sEstudios := '';
    for i := 0 to tslEstudiosSinDuplicados.Count - 1 do
      sEstudios := sEstudios + QuotedStr(tslEstudiosSinDuplicados[i]) + ',';

    sEstudios := Copy(sEstudios, 0, Length(sEstudios) - 1);

    fraPrestador.Enabled := true;

    if Trim(sEstudios) = '' then
    begin
      ShowMessage('Se encontraron estudios a realizarse sin cotización. ' + #13 +
                  'El lote de estudios por Reconfirmación no podrá generarse. ' + #13 +
                  'Por favor, verifique los costos de los estudios asociados ' +
                  'a los riesgos de los trabajadores.');
      sEstudios := 'NULL';

      fraPrestador.Clear;
      fraPrestador.Enabled := false
    end
    else begin
      with fraPrestador do
      begin
        OrderBy := ' art.amp.get_amp_prestador(ca_identificador) DESC, costo, ca_descripcion ';
        ExtraCondition := ' AND ca_identificador IN( ' +
                          '    SELECT DISTINCT ca_identificador ' +
                          '      FROM ( ' +
                          '        SELECT DISTINCT ca_identificador, pd_idestudio ' +
                          '          FROM comunes.cpd_prestadorestudio, comunes.cpp_presupuestoprestador, ' +
                          '               art.cpr_prestador, art.aes_estudios ' +
                          '         WHERE pp_fechabaja IS NULL ' +
                          '           AND es_codigo = pd_idestudio ' +
                          '           AND es_sincosto = ''N'' ' +
                          '           AND pp_vigenciadesde <= art.actualdate ' +
                          '           AND ((art.actualdate <= pp_vigenciahasta) OR (pp_vigenciahasta IS NULL)) ' +
                          '           AND pp_idestablecimiento = ' + SqlInteger(sdqConsulta.FieldByName ('es_id').AsInteger) +
                          '           AND ca_identificador = pp_idprestador ' +
                          '           AND ca_fechabaja IS NULL ' +
                          '           AND pd_idpresupuesto = pp_id ' +
                          '           AND pd_idtipovalor = 1 ' +
                          '           AND pd_idestudio IN(' + sEstudios + ') ' +
                          '        UNION ' +
                          '        SELECT DISTINCT ca_identificador, pd_idestudio ' +
                          '          FROM comunes.cpd_prestadorestudio, art.cpr_prestador, art.aes_estudios ' +
                          '         WHERE ca_identificador = pd_idprestador ' +
                          '           AND ca_fechabaja IS NULL ' +
                          '           AND es_codigo = pd_idestudio ' +
                          '           AND es_sincosto = ''N'' ' +
                          '           AND pd_idpresupuesto IS NULL ' +
                          '           AND pd_vigenciadesde <= art.actualdate ' +
                          '           AND ((art.actualdate <= pd_vigenciahasta) OR (pd_vigenciahasta IS NULL)) ' +
                          '           AND pd_idtipovalor = 1 ' +
                          '           AND pd_idestudio IN(' + sEstudios + ') ' +
                          '           AND ca_identificador IN (SELECT ca_identificador ' +
                          '                                      FROM comunes.cpd_prestadorestudio, comunes.cpp_presupuestoprestador, art.cpr_prestador ' +
                          '                                     WHERE pp_fechabaja IS NULL ' +
                          '                                       AND pd_vigenciadesde <= art.actualdate ' +
                          '                                       AND ((art.actualdate <= pd_vigenciahasta) OR (pd_vigenciahasta IS NULL)) ' +
                          '                                       AND pp_idestablecimiento = ' + SqlInteger(sdqConsulta.FieldByName ('es_id').AsInteger) +
                          '                                       AND ca_identificador = pp_idprestador ' +
                          '                                       AND ca_fechabaja IS NULL ' +
                          '                                       AND pd_idpresupuesto = pp_id ' +
                          '                                    UNION ALL ' +
                          '                                     SELECT ca_identificador ' +
                          '                                       FROM comunes.cpp_presupuestoprestador, art.cpr_prestador ' +
                          '                                      WHERE pp_fechabaja IS NULL ' +
                          '                                        AND pp_vigenciadesde <= art.actualdate ' +
                          '                                        AND (   (art.actualdate <= pp_vigenciahasta) ' +
                          '                                             OR (pp_vigenciahasta IS NULL)) ' +
                          '                                        AND pp_idestablecimiento = ' + SqlInteger(sdqConsulta.FieldByName ('es_id').AsInteger) +
                          '                                        AND ca_identificador = pp_idprestador ' +
                          '                                        AND ca_fechabaja IS NULL ' +
                          '                                        AND pp_viaticosbonif = ''S'')) ' +
                          '        HAVING COUNT(DISTINCT pd_idestudio) = ' + SqlInteger (tslEstudiosSinDuplicados.Count) +
                          '      GROUP BY ca_identificador ' +
                          '      UNION ALL ' +
                          '        SELECT DISTINCT ca_identificador ' +
                          '          FROM comunes.cpd_prestadorestudio, art.cpr_prestador, art.aes_estudios ' +
                          '         WHERE ca_identificador = pd_idprestador ' +
                          '           AND ca_fechabaja IS NULL ' +
                          '           AND es_codigo = pd_idestudio ' +
                          '           AND es_sincosto = ''N'' ' +
                          '           AND pd_idprestador IN(SELECT pc_idprestador ' +
                          '                                   FROM art.apc_prestadorcpostal, ' +
                          '                                        art.ccp_codigopostal ' +
                          '                                  WHERE pc_fechabaja IS NULL ' +
                          '                                    AND pc_id >= 1 ' +
                          '                                    AND cp_id = pc_idcpostal ' +
                          '                                    AND cp_codigo = ' + SqlValue (sdqConsulta.FieldByName ('es_cpostal').AsString) + ') ' +
                          '           AND pd_idpresupuesto IS NULL ' +
                          '           AND pd_vigenciadesde <= art.actualdate ' +
                          '           AND ((art.actualdate <= pd_vigenciahasta) OR (pd_vigenciahasta IS NULL)) ' +
                          '           AND pd_idtipovalor = 1 ' +
                          '           AND pd_idestudio IN(' + sEstudios + ') ' +
                          '      HAVING COUNT(DISTINCT pd_idestudio) = ' + SqlInteger(tslEstudiosSinDuplicados.Count) +
                          '      GROUP BY ca_identificador) ';

        S := ' + art.amp.get_costo_estudios (ca_identificador, ' +
             SqlValue(sdqConsulta.FieldByName ('em_cuit').AsString) + ', ' +
             SqlValue(sdqConsulta.FieldByName ('es_nroestableci').AsString) +
             ', ''R'', ''S'') ';

        ExtraFields := ', ca_direlectronica email ' +
                       ', TO_CHAR(' + S + ', ''99G999G999D99'') costo ';

        ShowBajas := false;
      end;

      fraPrestador.Clear;
      fraPrestador.cmbDescripcionDropDown(nil);
      if fraPrestador.sdqDatos.IsEmpty then
      begin
        ShowMessage('No se encontraron prestadores que realicen todos los ' +
                    'estudios requeridos. ' + #13 +
                    'El lote de estudios no podrá generarse. ');
        fraPrestador.Enabled := false
      end;
    end;

    chkNotificacion.Checked := false;
  finally
    tslEstudiosSinDuplicados.Free;
  end;

  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: btnPresupuestoClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Solicita presupuesto para estudios
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.btnPresupuestoClick(Sender: TObject);
begin
  inherited;
  tbSolicitarPresupuestoClick(nil);
  btnCancelarLote.Click;
end;

{-----------------------------------------------------------------------------
  Procedure: btnAceptarLoteClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Genera el lote
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.btnAceptarLoteClick(Sender: TObject);
var
  fIDSublote,
  i: Integer;
  ValorEstudio : Extended;
begin
  VerificarMultiple (['Datos del Lote',
                      fraPrestador,
                      fraPrestador.IsSelected,
                      'Debe indicarse el prestador'
                     ]);
  BeginTrans;
  try
    // Obtener ID del lote
    FIDLote := ValorSqlInteger ('SELECT MAX(le_id) FROM hys.hle_loteestudio') + 1;

    // Insertar nuevo lote
    EjecutarSqlST('INSERT INTO HYS.HLE_LOTEESTUDIO ( ' +
                  '  le_id, ' +
                  '  le_idprestador, ' +
                  '  le_fechaalta, ' +
                  '  le_usualta, ' +
                  iif (chkNotificacion.Checked, '  le_fechanotificacion, ', '') +
                  iif (chkNotificacion.Checked, '  le_usunotificacion, ', '') +
                  '  le_observaciones, ' +
                  '  le_monto, ' +
                  '  le_estado, ' +
                  '  le_reconfirmacion) ' +
                  'VALUES ( ' +
                     SqlValue (FIDLote) + ', ' +
                     SqlValue (fraPrestador.Value) + ',' +
                  '  SYSDATE, ' +
                     SqlValue (Sesion.UserID) + ', ' +
                  iif (chkNotificacion.Checked, ' ART.ACTUALDATE, ', '') +
                  iif (chkNotificacion.Checked, SqlValue (Sesion.UserID) + ', ', '') +
                     SqlValue (Trim(memObservaciones.Lines.Text)) +
                  ', 0, ''P'', ''S'')');

    sdqTrabajadores.Open;

    // Para cada reconfirmación
    for i := 0 to Grid.SelCount - 1 do
    begin
      Grid.GotoSelection (i);

      // Carga los estudios en hys.hdl_detallelote
      with sdqTrabajadores do
      begin
        First;
        while not Eof do
        begin
            ValorEstudio := ValorSqlExtendedEx('SELECT art.amp.get_costo_estudio(:pidprestador, :pidestableci, :pestudio, art.actualdate, ''S'') ' +
                                               '  FROM DUAL',
                                               [fraPrestador.Value,
                                               sdqConsulta.FieldByName ('es_id').AsInteger,
                                               sdqTrabajadores.FieldByName ('es_codigo').AsString]);
            if ValorEstudio = 0 then
              ValorEstudio := ValorSqlExtendedEx('SELECT art.amp.get_costo_estudio(:pidprestador, :pidestableci, :pestudio, art.actualdate, ''N'') ' +
                                                 '  FROM DUAL',
                                                 [fraPrestador.Value,
                                                  sdqConsulta.FieldByName ('es_id').AsInteger,
                                                 sdqTrabajadores.FieldByName ('es_codigo').AsString]);

            EjecutarSqlST('INSERT INTO HYS.hdl_detallelote ( ' +
                          '  dl_id, ' +
                          '  dl_idlote, ' +
                          '  dl_idestableci, ' +
                          '  dl_idtrabajador, ' +
                          '  dl_idestudio, ' +
                          '  dl_monto, ' +
                          '  dl_fechaalta, ' +
                          '  dl_usualta, ' +
                          '  dl_idempresa) ' +
                          'VALUES ( ' +
                          '  hys.seq_hdl_id.NEXTVAL, ' +
                             SqlValue (FIDLote) + ', ' +
                             SqlValue (sdqConsulta.FieldByName ('es_id').AsString) + ', ' +
                             SqlValue (sdqTrabajadores.FieldByName ('tj_id').AsString) + ', ' +
                             SqlValue (sdqTrabajadores.FieldByName ('es_codigo').AsString) + ', ' +
                             SqlValue (ValorEstudio) + ', ' +
                             'SYSDATE , ' +
                             SqlValue (Sesion.UserID) + ', ' +
                             SqlValue (sdqConsulta.FieldByName ('em_id').AsString) + ')');

          Next
        end
      end;

      // Genero un sublote en hys.hel_estadolote si no existe (agrupamiento)
      if not ExisteSqlEx ('SELECT 1 ' +
                          '  FROM hys.hel_estadolote ' +
//                          ' WHERE el_rlid = :prlid ' +
                          ' WHERE el_idlote = :pidlote ',
//                          [sdqConsulta.FieldByName ('el_rlid').AsInteger, FIDLote]) then
                          [FIDLote]) then
      begin
        fIDSublote := GetSecNextVal ('hys.seq_hel_id');

        EjecutarSqlST('INSERT INTO hys.hel_estadolote (el_rlid, el_idlote, el_estado, ' +
                      '                                el_operativo, el_fecharelevamiento, ' +
                      '                                el_operativoforzado, el_id)' +
                      '     VALUES (' + SqlValue(sdqConsulta.FieldByName ('el_rlid').AsInteger) + ', ' +
                                        SqlValue(FIDLote) + ', ' +
                                        SqlValue('P') + ', ' +
                                        SqlValue('R') + ', ' +
                                        SqlDate(sdqConsulta.FieldByName ('el_fecharelevamiento').AsDateTime) + ', ' +
                                        SqlValue('N') + ', ' +
                                        SqlValue(fIDSublote) + ')')
      end;


      // Actualiza la reconfirmación con el ID del lote asignado
      EjecutarSqlSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                      '   SET gr_idlote = :pidlote ' +
                      ' WHERE gr_id = :pid ',
                      [FIDLote, sdqConsulta.FieldByName ('gr_id').AsInteger]);
    end { for };

(*
    if ValorSqlInteger ('SELECT NVL(SUM(dl_monto), 0) ' +
                        '  FROM hys.hdl_detallelote ' +
                        ' WHERE dl_idlote = ' + SqlValue (FIDLote)) > 0 then
    begin
*)
    // Calculo el costo total de los estudios
    EjecutarSqlST('UPDATE HYS.HLE_LOTEESTUDIO ' +
                  '   SET le_monto = (SELECT NVL(SUM(dl_monto), 0) ' +
                  '                     FROM hys.hdl_detallelote ' +
                  '                    WHERE dl_idlote = le_id ' +
                  '                      AND dl_fechabaja IS NULL) ' +
                  ' WHERE le_id = ' + SqlValue (FIDLote));

    CommitTrans;

    // Si se indicó, notifica al prestador mediante PQ de datos
    if chkNotificacion.Checked then
      GenerarPqDatosPrestador(FIDLote,
                              fraPrestador.Descripcion,
                              Trim(fraPrestador.sdqDatos.FieldByName('email').AsString));

    MsgBox(Format('Se ha generado el lote %d para el prestador %s.',
                  [FIDLote,
                   fraPrestador.Descripcion]) + #13 +
           iif (chkNotificacion.Checked, 'Se remitirá al mismo un e-mail con la notificación y ' + #13 +
                                         'la lista de estudios a realizar.', ''),
           MB_ICONINFORMATION);
//    end
//    else Rollback;

    fpDatosLote.ModalResult := mrOk;
    Grid.UnselectAll;

    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg (E, 'Error al generar el lote de estudios');
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbSolicitarPresupuestoClick
  Author:    racastro
  Date:      23-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Solicitud de Presupuesto
-----------------------------------------------------------------------------}

procedure TfrmGenLotesReconf.tbSolicitarPresupuestoClick(Sender: TObject);
var
  IDPresupuesto: Integer;
  bContinuar: Boolean;
  Operativo,
  sSQL: String;

begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una empresa/establecimiento.');
  Verificar(HayMultiplesEstablecimientos, Grid, 'La selección contiene múltiples empresa/establecimiento.');

  if MsgAsk('Esta a punto de solicitar un pedido de presupuesto para ' + IntToStr(Grid.SelectedRows.Count) + ' reconfirmaciones.' + CRLF + '¿Desea continuar?') then
  begin
    BeginTrans(True);
    try
      bContinuar := True;

      // El tipo de Operativo es RECONFIRMACION
      Operativo := 'R';

      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));
      sSQL := 'SELECT 1 ' +
              '  FROM COMUNES.CSP_SOLICITUDPRESUPUESTO ' +
              ' WHERE SP_CONTRATO = :CONTRATO ' +
              '   AND SP_IDESTABLECIMIENTO = :IDESTABLECIMIENTO ' +
              '   AND SP_FECHASOLICITUD > ART.ACTUALDATE - 15 ' +
              '   AND SP_OPERATIVO = :operativo ';

      // Notifica y pide confirmación en caso que ya se haya pedido un presupuesto
      // dentro de los 15 días previos
      if ExisteSQLEx(sSQL, [sdqConsulta.FieldByName('es_contrato').AsInteger, sdqConsulta.FieldByName('es_id').AsInteger, Operativo]) then
        if not MsgAsk('Ya se ha solicitado un presupuesto para la empresa ' + sdqConsulta.FieldByName('em_nombre').AsString +
                      ', establecimiento ' + sdqConsulta.FieldByName('es_nombre').AsString + ' durante los 15 días previos.' + CRLF +
                      '¿Desea volver a solicitarlo?') then
          bContinuar := False;

      // Confirma la solicitud
      if bContinuar then
      begin
        sSQL := 'INSERT INTO COMUNES.CSP_SOLICITUDPRESUPUESTO ' +
                '(SP_ID, SP_CONTRATO, SP_IDESTABLECIMIENTO, SP_FECHASOLICITUD, SP_USUARIO, SP_OPERATIVO) ' +
                'VALUES ' +
                '(:ID, :CONTRATO, :IDESTABLECIMIENTO, SYSDATE, :USUARIO, :OPERATIVO) ';

        // Nuevo Presupuesto
        IDPresupuesto := ValorSQLInteger('SELECT MAX(SP_ID) + 1 FROM COMUNES.CSP_SOLICITUDPRESUPUESTO', 1);
        EjecutarSQLSTEx(sSQL,
                        [IDPresupuesto,
                         sdqConsulta.FieldByName('es_contrato').AsInteger,
                         sdqConsulta.FieldByName('es_id').AsInteger,
                         Sesion.UserID, Operativo]);

        // Acualiza datos de reconf. con el nuevo pedido de presupuesto
        EjecutarSQLSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                        '   SET gr_fechaultpresup = SYSDATE, ' +
                        '       gr_idpresupuesto = :pidpresupuesto ' +
                        ' WHERE gr_estado = ''AP'' ' +
                        '   AND gr_enfprofesional = ''N'' ' +
                        '   AND gr_fechabaja IS NULL ' +
                        '   AND gr_idlote IS NULL ' +
                        '   AND EXISTS (SELECT 1 ' +
                        '                 FROM hys.hdl_detallelote ' +
                        '                WHERE dl_id = gr_iddetallelote ' +
                        '                      AND dl_idestableci = :pidestableci) ',
                        [IDPresupuesto,
                         sdqConsulta.FieldByName('es_id').AsInteger]);

        CommitTrans(True);
        InfoHint(Grid, 'El pedido ha sido realizado con éxito.');

        sdqConsulta.Refresh
      end
      else
        RollBack(True);
    except
      on E: Exception do
      begin
        RollBack(True);
        InvalidMsg(Grid, 'Ocurrió un error al realizar el pedido.' + CRLF + E.Message);
      end;
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbOrdenarClick
  Author:    racastro
  Date:      09-Dic-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Sorting
-----------------------------------------------------------------------------}
procedure TfrmGenLotesReconf.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  sdqTrabajadores.Open;
end;

end.
