unit unSolicitudAuditoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, SinEdit, Mask, PatternEdit, DateTimeEditors, StdCtrls, Buttons,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ToolEdit, DateComboBox,
  unFraCodigoDescripcion, Menus, FormPanel, unRedPres, unComunes;

type
  TfrmSolicitudAuditoria = class(TfrmCustomConsulta)
    grpSiniestro: TGroupBox;
    blSinFecha: TLabel;
    edSinDiagnostico: TEdit;
    edCausaFin: TEdit;
    pnlSiniestro: TPanel;
    SinEdit: TSinEdit;
    edSinFecha: TDateEditor;
    GroupBox1: TGroupBox;
    fraEstado: TfraStaticCTB_TABLAS;
    sdqBusqueda: TSDQuery;
    GroupBox2: TGroupBox;
    lblFSolicitud: TLabel;
    dcbFechaSolicitudDesde: TDateComboBox;
    dcbFechaSolicitudHasta: TDateComboBox;
    GroupBox3: TGroupBox;
    fraAuditor: TfraStaticCodigoDescripcion;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    dcbFechaEnvioDesde: TDateComboBox;
    dcbFechaEnvioHasta: TDateComboBox;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    dcbFechaAuditoriaDesde: TDateComboBox;
    dcbFechaAuditoriaHasta: TDateComboBox;
    GroupBox6: TGroupBox;
    fraDelegacion: TfraStaticCodigoDescripcion;
    tbEnviarSolicitud: TToolButton;
    tbHistoricoReclamos: TToolButton;
    ToolButton2: TToolButton;
    GroupBox7: TGroupBox;
    fraDestinatario: TfraCodigoDescripcion;
    tbFinalizarSeguimiento: TToolButton;
    chkInfectologia: TCheckBox;
    chkListado: TCheckBox;
    sdqAux: TSDQuery;
    tbModificarAudit: TToolButton;
    ToolButton1: TToolButton;
    fpAnular: TFormPanel;
    Bevel3: TBevel;
    Label12: TLabel;
    Label16: TLabel;
    btnAnuAceptar: TButton;
    btnAnuCancelar: TButton;
    edObservacionesAnu: TMemo;
    fraMotivoAnulacion: TfraCodigoDescripcion;
    tbVerDemora: TToolButton;
    tbSalir3: TToolButton;
    fpHistoricoReclamos: TFormPanel;
    sdqHistoricoReclamos: TSDQuery;
    dsHistoricoReclamos: TDataSource;
    ToolBar1: TToolBar;
    tbVerFiltros: TToolButton;
    tbExportar_reclamos: TToolButton;
    btnSalir: TToolButton;
    ToolButton12: TToolButton;
    MemoFiltros: TMemo;
    dbgHistoricoReclamos: TDBGrid;
    ExportDialogHistRecl: TExportDialog;
    tbOrdenar_reclamos: TToolButton;
    SortDialog_reclamos: TSortDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SinEditSelect(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbHistoricoReclamosClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbEnviarSolicitudClick(Sender: TObject);
    procedure tbFinalizarSeguimientoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridCellClick(Column: TColumn);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbModificarAuditClick(Sender: TObject);
    procedure btnAnuAceptarClick(Sender: TObject);
    procedure tbVerDemoraClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure tbSalir3Click(Sender: TObject);
    procedure btnCerrarHistReclClick(Sender: TObject);
    procedure fpHistoricoReclamosBeforeShow(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure tbVerFiltrosClick(Sender: TObject);
    procedure tbExportar_reclamosClick(Sender: TObject);
    procedure tbOrdenar_reclamosClick(Sender: TObject);
  private
    FRegistrosSeleccionados: TStringList;

    procedure ModificarRegistro(const aEstado: String);
    procedure EnviarMail_AuditCumplidas;

    // Lu WF 7742
    procedure AnularParteEvolutivo(iSiniestro, iOrden, iRecaida, iNroParteElim: Integer); // Le paso el nro de Parte que se anula.
    procedure Do_HabilitarBotones;      // por TK 22492
    procedure Do_ActualizarFecEnvioReclamo(iIdSSU:integer); // TK 22492
    procedure Do_GenerarParte_EnvioReclamo(sEstado:string; iSiniestro, iOrden, iRecaida: Integer); // TK 22492
    function ValidarFiltros_HistoricoReclamos:boolean; // TK 25240
  public

  end;

const
   cENVIO_AUDIT = 'E'; // Lu (wf 7535) - Envio comun, en donde se genera autorizacion, se asigna medico auditor y se envia mail.
   cENVIO_MODIF = 'M'; // Lu (wf 7535) - Modifica el medico auditor sin generar autorizacion y envia mail.
   cRECLAMO_ESTPENDIENTE = 'Se solicita desde Casa Central enviar la Solicitud de Auditoría Médica al médico auditor correspondiente.';    // TK 22492
   cRECLAMO_ESTENVIADO =   'Se solicita desde Casa Central reclamar informe de Auditoría Médica solicitada';
var
  frmSolicitudAuditoria: TfrmSolicitudAuditoria;


implementation

uses
  unSesion, unDmPrincipal, General, AnsiSql, unEnviarSolicitudAuditoria, CustomDlgs,
  Strfuncs, VCLExtra, unMoldeEnvioMail, unSiniestros, unTercerizadoras;

{$R *.DFM}

procedure TfrmSolicitudAuditoria.ModificarRegistro(const aEstado: String);
var
  aBookMark: TBookmark;
  sSql, sSqlAut: String;
  sqlResults :TStringList;
begin
  inherited;
  BeginTrans;
  Try
     sSql :=
       'UPDATE SIN.ssu_seguimientoauditoria' +
         ' SET su_estado = ' + SqlValue(aEstado);

     if (aEstado = '003') or (aEstado = '005') then // cod 003 = finalizado y cod 005 = Parcialmente cumplido Lu 07/05/2008  WF 7333
         sSql := sSql +
             ' ,su_usuauditoria = ' + SqlValue(Sesion.UserID) +
             ' ,su_fechaauditoria = actualdate' +
             ', su_cantAudit = ' + IntToStr(sdqConsulta.FieldByName('su_cantAudit').AsInteger - 1) +  // Aca si es '003', el su_cantAudit es = 1, entonces menos uno da cero.
             ', SU_CANTAUDITCUMPLIDAS = ' + IntToStr(sdqConsulta.FieldByName('SU_CANTAUDITCUMPLIDAS').AsInteger + 1);

     if aEstado = '004' then  // Eliminar
     begin
       sSql := sSql +
             ' ,su_usubaja = ' + SqlValue(Sesion.UserID) +
             ' ,su_fechabaja = actualdate ' +
             ' ,su_idmotanulacion = ' + SqlInt(fraMotivoAnulacion.ID) +
             ' ,su_observac_anul = su_observac_anul || ' + SqlValue(edObservacionesAnu.Text);

       // Lu 15/05/2008 - wf 7333 - Si el valor de au_solicitud es <> nulo, entonces tambien se deben eliminar (anular) las autorizaciones generadas en la sau_autorizaciones.
       if ( Trim(ValorSql('SELECT au_solicitud from sau_autorizaciones ' +
                          ' WHERE au_idexpediente = ' + sdqConsulta.FieldByName('su_idexpediente').AsString +
                            ' AND au_solicitud = '    + sdqConsulta.FieldByName('su_id').AsString)) <> '' ) then
       begin
         sSqlAut := ' UPDATE ART.SAU_AUTORIZACIONES ' +
                    ' SET au_estado = ''U'', ' + // Se le coloca au_estado = 'U' => 'Aprobacion Anulada' (tb_clave='MUAUT' en la ctb_tablas)
                        ' au_fechamodif = SYSDATE, ' +
                        ' au_usumodif = ' + SqlValue(Sesion.UserID) +
                    ' WHERE au_idexpediente = ' + sdqConsulta.FieldByName('su_idexpediente').AsString +
                      ' AND au_solicitud = ' + sdqConsulta.FieldByName('su_id').AsString;
       end;
     end;

     sSql := sSql +
       ' WHERE su_id = ' + SqlValue(sdqConsulta.FieldByName('su_id').AsInteger);

     EjecutarSqlST(sSql);

     if (Trim(sSqlAut) <> '') then
        EjecutarSqlST(sSqlAut);

     aBookMark := sdqConsulta.GetBookmark;
   //  tbRefrescarClick(nil);   // Lu 26/08: Saco el refrescar de aca y lo coloco por fuera porque se complicaba con el agregarParte, luego de refrescar se posicionaba en otro lado, colocando mal los datos.

     try            // Lu 14/07/2008 : por si no se encuentra la marca de bookmark.
       sdqConsulta.GotoBookmark(aBookMark);
     except
       on e:exception do
       begin
       end;
     end;

     sdqConsulta.FreeBookMark(aBookMark);

     CommitTrans;

  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar guardar los datos.');
      Close;
    end;
  end;

  // En este caso se manda un mail al medico responsable del grupo de trabajo. Lu 12/05/2008
  sqlResults := ValoresColSql('SELECT su_estado, su_cantauditcumplidas, su_cantaudit '+
                               ' FROM SIN.ssu_seguimientoauditoria ' +
                              ' WHERE su_id = ' + SqlInt(sdqConsulta.FieldByName('su_id').AsInteger) );
  try
    if ( sqlResults.Count > 0 ) and
       ( not(IsEmptyString(sqlResults[1])) and (StrToInt(sqlResults[1]) > 1) ) and
       ( not(IsEmptyString(sqlResults[2])) and (StrToInt(sqlResults[2]) = 0) ) and
       (sqlResults[0] = '003') then
     EnviarMail_AuditCumplidas;
  finally
    sqlResults.Free;
  end;
end;

// Lu 12/05/2008
procedure TfrmSolicitudAuditoria.EnviarMail_AuditCumplidas;
var sEmails, sbody: string;
    sGrupoTrabajo:string;
    sIdEjecutable: integer;
begin
   // Obtengo el Grupo de trabajo del numero de parte maximo.
  sGrupoTrabajo := ValorSqlEx('SELECT ex_gtrabajo ' +
                               ' FROM sex_expedientes ' +
                              ' WHERE ex_id = :IdExp ', [sdqConsulta.FieldByName('su_idexpediente').AsInteger]);
   // obtengo el mail del medico responsable de ese grupo
   if (sGrupoTrabajo <> '') then
   begin
      sdqAux.SQL.Text := ' SELECT ug_usuario, se_mail ' +
                           ' FROM mug_usuariogrupotrabajo, use_usuarios ' +
                          ' WHERE ug_usuario = se_usuario ' +
                            ' AND se_fechabaja IS NULL ' +
                            ' AND ug_fechabaja IS null ' +
                            ' AND ug_grupo = ' + sGrupoTrabajo +
                            ' AND ug_tipousuario = ''03'' '; // médico
      sdqAux.Close;
      sdqAux.Open;

      while not sdqAux.Eof do   // pueden haber varios medicos responsables por cada grupo de trabajo
      begin
         if (sEmails <> '') then
            sEmails := sEmails + ',';
         sEmails := sEmails + sdqAux.FieldByName('se_mail').AsString;
         sdqAux.Next;
      end;

      if (sEmails <> '') then
      begin
        BeginTrans;
        Try
          sIdEjecutable := ValorSql('SELECT ej_id FROM comunes.cej_ejecutable ' +
                                     'WHERE UPPER(ej_proyecto) = ''REDPRES'' ' +
                                      ' AND ej_fechabaja IS NULL');

          sBody := 'Se han completado las ' + sdqConsulta.FieldByName('su_cantauditcumplidas').AsString + ' Auditorías correspondientes al Siniestro: ' +
                    sdqConsulta.FieldbyName('pv_siniestro').AsString + ' - ' +
                    sdqConsulta.FieldByName('pv_orden').AsString + ' - ' +
                    sdqConsulta.FieldByName('pv_recaida').AsString +
                    '.  Con Nro de parte: ' + sdqConsulta.FieldByName('pv_nroparte').AsString + '.';

          EjecutarStoreST(' art.varios.do_insertartablamails(''AvisosAutomaticos'', ' + sqlValue(sEmails) + ', ' +
                          ' ''Aviso de Finalización de Auditorías'', ' + sqlValue(sBody) + ', NULL, NULL, ' +
                           SqlInt(sIdEjecutable) + ' ); ');
          CommitTrans;

         except
            on E: Exception do
            begin
              Rollback;
              MsgBox('Ha ocurrido un error al intentar insertar en la tabla de Mails: ' + E.Message );
            end;
          end;
        end;
      end;
end;


procedure TfrmSolicitudAuditoria.FormCreate(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados := TStringList.Create;

  fraEstado.Clave := 'ESTSU';

  with fraAuditor do
  begin
    TableName      := 'MAU_AUDITORES';
    FieldID        := 'AU_AUDITOR';
    FieldCodigo    := 'AU_AUDITOR';
    FieldDesc      := 'AU_NOMBRE';
    ExtraCondition := ' AND AU_FBAJA IS NULL ';
  end;

  fraDestinatario.TableName      := 'USE_USUARIOS';
  fraDestinatario.FieldID        := 'SE_USUARIO';
  fraDestinatario.FieldCodigo    := 'SE_USUARIO';
  fraDestinatario.FieldDesc      := 'SE_NOMBRE';

  with fraDelegacion do
  begin
    TableName      := 'DLG_DELEGACIONES';
    FieldID        := 'LG_CODIGO';
    FieldCodigo    := 'LG_CODIGO';
    FieldDesc      := 'LG_NOMBRE';
  end;
  with fraMotivoAnulacion do
  begin
    TableName      := 'SMC_MOTANULCITACIONES';
    FieldID        := 'MC_ID';
    FieldCodigo    := 'MC_CODIGO';
    FieldDesc      := 'MC_DESCRIPCION';
    FieldBaja      := 'MC_FECHABAJA';
    ShowBajas      := False;
  end;

  tbHistoricoReclamos.Enabled := Seguridad.Activar(tbHistoricoReclamos);  // TK 24172
  tbEnviarMail.Enabled        := Seguridad.Activar(tbEnviarMail);

  tbLimpiarClick(nil);
end;

procedure TfrmSolicitudAuditoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSolicitudAuditoria.SinEditSelect(Sender: TObject);
var
  sSql: String;
begin
  edSinFecha.Clear;
  edCausaFin.Clear;
  edSinDiagnostico.Clear;

  sSql :=
    'SELECT 1' +
     ' FROM SEX_EXPEDIENTES' +
    ' WHERE EX_SINIESTRO = ' + SinEdit.SiniestroSql +
      ' AND EX_ORDEN = ' + SinEdit.OrdenSql +
      ' AND EX_RECAIDA = ' + SinEdit.RecaidaSql;

  if not ExisteSql(sSql) or
     (not ValidarSiniestroUsuarioTerce(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then       // por Plan Ioma - Tercerizadoras
  begin
    MsgBox('No existe el siniestro seleccionado o bien Ud. no posee permisos para visualizarlo.', MB_ICONEXCLAMATION);
    tbLimpiarClick(nil);
  end
  else
  begin
    with sdqBusqueda do
    try
      if Active then
        Close;
      ParamByName('pSiniestro').AsInteger := SinEdit.Siniestro;
      ParamByName('pOrden').AsInteger     := SinEdit.Orden;
      ParamByName('pRecaida').AsInteger   := SinEdit.Recaida;
      Open;

      edSinFecha.Date       := FieldByName('EX_FECHAACCIDENTE').AsDateTime;
      edCausaFin.Text       := FieldByName('EX_CAUSAFIN').AsString;
      edSinDiagnostico.Text := FieldByName('EX_DIAGNOSTICO').AsString;
    finally
      Close;
    end;
  end;
end;

procedure TfrmSolicitudAuditoria.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin                                            
  FRegistrosSeleccionados.Clear;

  sSql :=
    'SELECT null checkbox,su_id, pv_siniestro, pv_orden, pv_recaida, pv_nroparte, TRUNC(su_fechaalta) fechasolicitud,' +
          ' TRUNC(su_fechaenvio) fechaenvio, TRUNC(su_fechaauditoria) fechaauditoria, TRUNC(su_fechabaja) fechabaja, ' +
          ' est.es_descripcion estado, se_nombre usuario, au_nombre auditor, tc_descripcion gravedad, ' +
          ' ee_direccionesdestino, DECODE(su_altamedica, ''T'', ''SI'', '' '') altamedica, tj_nombre paciente, ' +
          ' pv_infectologia, pv_desdelistado, sue.ue_seguimientoid, pv_turno, ' +
          ' DECODE(ca_identificador, NULL, NULL, ''('' || ca_identificador || '') - '' ||ca_descripcion) prestador, ' +
          ' pv_cantaudit, su_cantaudit, su_cantauditcumplidas,  su_idexpediente, su_estado, ' +
          ' su_idmotanulacion CodMot, mc_descripcion MotAnulacion, su_observac_anul, ' + // Lu 24/06
          ' pv_fechacontrol, pv_auditor, pv_diagnostico, pv_medico, pv_sitiointernacion, ca_identificador IdPrestador, ' +    // Lu WF 7742
          ' art.varios.get_cantdiashabiles(TRUNC(su_fechaalta),TRUNC(su_fechaenvio)) demoraenvio, ' +
          ' art.varios.get_cantdiashabiles(TRUNC(su_fechaenvio),TRUNC(su_fechaauditoria)) demorarecepcion, ' +
          ' art.varios.get_cantdiashabiles(TRUNC(pv_turno),TRUNC(su_fechaauditoria)) demoraturno, su_fecEnvioReclamo ' +
     ' FROM usc_sectores, use_usuarios, sue_auditoriasenviadas sue, mau_auditores, SIN.stc_tipogravedad_cie10, ' +
          ' cee_emailaenviar, ctj_trabajador, sex_expedientes, spv_parteevolutivo, ssu_seguimientoauditoria, ' +
          ' SIN.ses_estadoseguimiento est, cpr_prestador, SMC_MOTANULCITACIONES ' +
    ' WHERE su_usualta = se_usuario ' +
      ' AND su_id = sue.ue_seguimientoid(+) ' +
      ' AND sue.ue_auditorid = au_auditor(+) ' +
      ' AND (SELECT NVL(MAX(sue2.ue_id), -1) ' +
             ' FROM sue_auditoriasenviadas sue2, mau_auditores au2 ' +
            ' WHERE sue.ue_seguimientoid = sue2.ue_seguimientoid ' +
              ' AND sue2.ue_auditorid = au2.au_auditor) IN (sue.ue_id, -1) ' +
      ' AND tc_codigo(+) = pv_gravedadcie10 ' +
      ' AND su_emailaenviarid = ee_id(+) ' +
      ' AND ex_cuil = tj_cuil ' +
      ' AND pv_siniestro = ex_siniestro ' +
      ' AND pv_orden = ex_orden ' +
      ' AND pv_recaida = ex_recaida ' +
      ' AND ex_sector = sc_codigo(+) ' +
      ' AND su_siniestro = pv_siniestro ' +
      ' AND su_orden = pv_orden ' +
      ' AND su_recaida = pv_recaida ' +
      ' AND su_nroparte = pv_nroparte ' +
      ' AND est.es_codigo = su_estado ' +
      ' AND pv_identifprestador = ca_identificador(+) ' +
      ' AND su_idmotanulacion = mc_codigo(+) '; // Lu 24/06

  if not(SinEdit.IsEmpty) then
    sSql := sSql +
      ' AND PV_SINIESTRO = ' + SqlInt(SinEdit.Siniestro) +
      ' AND PV_ORDEN = ' + SqlInt(SinEdit.Orden) +
      ' AND PV_RECAIDA = ' + SqlInt(SinEdit.Recaida);

  if not fraEstado.IsEmpty then
    sSql := sSql + ' AND EST.ES_CODIGO = ' + SqlValue(fraEstado.Value);

  if not fraDelegacion.IsEmpty then
    sSql := sSql + ' AND SC_DELEGACION = ' + SqlValue(fraDelegacion.Codigo);

  if not fraAuditor.IsEmpty then
    sSql := sSql + ' AND AU_AUDITOR = ' + SqlValue(fraAuditor.Value);

  if not fraDestinatario.IsEmpty then
    sSql := sSql + ' AND EE_DIRECCIONESDESTINO = ' + SqlValue(fraDestinatario.edCodigo.Text);

  if not dcbFechaSolicitudDesde.IsEmpty then
    sSql := sSql + ' AND SU_FECHAALTA >= ' + SqlValue(dcbFechaSolicitudDesde.Date);

  if not dcbFechaSolicitudHasta.IsEmpty then
    sSql := sSql + ' AND SU_FECHAALTA <= ' + SqlValue(dcbFechaSolicitudHasta.Date);

  if not dcbFechaEnvioDesde.IsEmpty then
    sSql := sSql + ' AND SU_FECHAENVIO >= ' + SqlValue(dcbFechaEnvioDesde.Date);

  if not dcbFechaEnvioHasta.IsEmpty then
    sSql := sSql + ' AND SU_FECHAENVIO <= ' + SqlValue(dcbFechaEnvioHasta.Date);

  if not dcbFechaAuditoriaDesde.IsEmpty then
    sSql := sSql + ' AND SU_FECHAAUDITORIA >= ' + SqlValue(dcbFechaAuditoriaDesde.Date);

  if not dcbFechaAuditoriaHasta.IsEmpty then
    sSql := sSql + ' AND SU_FECHAAUDITORIA <= ' + SqlValue(dcbFechaAuditoriaHasta.Date);

  if chkInfectologia.Checked then
    sSql := sSql + ' AND PV_INFECTOLOGIA = ''S'' ';

  if chkListado.Checked then
    sSql := sSql + ' AND PV_DESDELISTADO = ''S'' ';

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  with sdqConsulta do
  begin
    if Active then
      Close;
    SQL.Text := sSql;
    CopySqlClp(sSql);
    Open;

    inherited;
  end;

  Do_HabilitarBotones;

end;

procedure TfrmSolicitudAuditoria.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados.Clear;

  SinEdit.Clear;
  edSinFecha.Clear;
  edCausaFin.Clear;
  edSinDiagnostico.Clear;
  fraEstado.Clear;
  dcbFechaSolicitudDesde.Clear;
  dcbFechaSolicitudHasta.Clear;
  dcbFechaEnvioDesde.Clear;
  dcbFechaEnvioHasta.Clear;
  dcbFechaAuditoriaDesde.Clear;
  dcbFechaAuditoriaHasta.Clear;
  fraAuditor.Clear;
  fraDelegacion.Clear;
  fraDestinatario.Clear;
  chkInfectologia.Checked := False;
  chkListado.Checked      := False;
  tbEnviarMail.Enabled := False;  // TK 22492
end;

procedure TfrmSolicitudAuditoria.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    tbEliminar.Enabled             := FieldByName('FECHABAJA').IsNull;
    tbEnviarSolicitud.Enabled      := ((Seguridad.Activar(tbEnviarSolicitud)) and (FieldByName('FechaAuditoria').IsNull)) or
                                        Seguridad.Claves.IsActive('EnviarSolicitudFinalizada');
    // Lu WF 7535 - coloco los mismos permisos para el modificar audit que el Enviar Solicitud, mas que haya sido enviado.
    tbModificarAudit.Enabled       := ( ( (Seguridad.Activar(tbEnviarSolicitud)) and (FieldByName('FechaAuditoria').IsNull) ) or
                                        Seguridad.Claves.IsActive('EnviarSolicitudFinalizada') )
                                        and (not FieldByName('FECHAENVIO').IsNull) ;

    // Lu WF 7333 cambie la segunda condicion:                                         // cantidad de auditorias que tiene para hacer            // TK 10787 - el estado no puede ser finalizado
    tbFinalizarSeguimiento.Enabled := (Seguridad.Activar(tbFinalizarSeguimiento)) and (FieldByName('su_cantAudit').AsInteger > 0) and (FieldByName('su_estado').AsString <> '003') // and (FieldByName('FechaAuditoria').IsNull);
  end;
end;

// Envio comun, en donde se genera autorizacion, se asigna medico auditor y se envia mail.
procedure TfrmSolicitudAuditoria.tbEnviarSolicitudClick(Sender: TObject);
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');
  Verificar((sdqConsulta.FieldByName('su_estado').AsString = '004'), tbEnviarSolicitud,
             'No se puede Enviar: El registro esta dado de baja.');
  Application.CreateForm(TfrmEnviarSolicitudAuditoria, frmEnviarSolicitudAuditoria);
  try
    with sdqConsulta do
      if frmEnviarSolicitudAuditoria.Mostrar(FRegistrosSeleccionados.CommaText, 'L', cENVIO_AUDIT,
                                             sdqConsulta.FieldByName('ue_seguimientoid').AsInteger, true) then
        tbRefrescarClick(nil);
  finally
    FreeAndNil(frmEnviarSolicitudAuditoria);
  end;
end;

// Modifica el medico auditor sin generar autorizacion y envia mail.
procedure TfrmSolicitudAuditoria.tbModificarAuditClick(Sender: TObject);
begin
  inherited;
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');
  Verificar((sdqConsulta.FieldByName('su_estado').AsString = '004'), tbEnviarSolicitud,
             'No se puede Enviar: El registro esta dado de baja.');
  Application.CreateForm(TfrmEnviarSolicitudAuditoria, frmEnviarSolicitudAuditoria);
  try
    with sdqConsulta do
      if frmEnviarSolicitudAuditoria.Mostrar(FRegistrosSeleccionados.CommaText, 'L', cENVIO_MODIF,
                                             sdqConsulta.FieldByName('ue_seguimientoid').AsInteger) then
        tbRefrescarClick(nil);
  finally
    FreeAndNil(frmEnviarSolicitudAuditoria);
  end;
end;

procedure TfrmSolicitudAuditoria.tbFinalizarSeguimientoClick(Sender: TObject);
var sCantAudit : integer;
begin
  Verificar((sdqConsulta.FieldByName('su_estado').AsString = '004'), tbFinalizarSeguimiento, 'No se puede Finalizar: El registro esta dado de baja.');

  sCantAudit := sdqConsulta.FieldByName('su_cantAudit').AsInteger;  // Lu 07/05/2008 modifique este click por WF 7333

  if sCantAudit = 1 then
    ModificarRegistro('003')   // Finaliza todo
  else if sCantAudit > 1 then
    ModificarRegistro('005');  // Finaliza una auditoria, y quedara con estado "parcialmente cumplido" Lu 07/05/2008

  tbRefrescarClick(nil);

end;

procedure TfrmSolicitudAuditoria.tbEliminarClick(Sender: TObject);
var iNuevoParte: Integer;
begin
  Verificar((sdqConsulta.FieldByName('su_estado').AsString = '004'), tbEliminar, 'El registro ya esta dado de baja');
  Verificar((sdqConsulta.FieldByName('su_estado').AsString = '003'), tbEliminar, 'No se puede Eliminar un registro Finalizado');  // TK 10787

  fraMotivoAnulacion.Clear;
  edObservacionesAnu.Clear;

  if fpAnular.ShowModal = mrOk then
  begin
    ModificarRegistro('004');

    // Lu WF 7742
    AnularParteEvolutivo(sdqConsulta.FieldByName('PV_SINIESTRO').AsInteger,
                         sdqConsulta.FieldByName('PV_ORDEN').AsInteger,
                         sdqConsulta.FieldByName('PV_RECAIDA').AsInteger,
                         sdqConsulta.FieldByName('PV_NROPARTE').AsInteger);

    // Lu TK 7673 pedido por Mario Guevara: genera parte Administrativo
    iNuevoParte := ValorSqlEx('SELECT MAX(pv_nroparte)+1 ' +
                               ' FROM art.spv_parteevolutivo ' +
                              ' WHERE pv_siniestro = :Sin ' +
                                ' AND pv_orden = :Orden ' +
                                ' AND pv_recaida = :Reca', [sdqConsulta.FieldByName('PV_SINIESTRO').AsInteger,
                                                            sdqConsulta.FieldByName('PV_ORDEN').AsInteger,
                                                            sdqConsulta.FieldByName('PV_RECAIDA').AsInteger]);

    InsertarParteEvolutivo(True,                                                    // TK 7673
                           sdqConsulta.FieldByName('PV_SINIESTRO').AsInteger,
                           sdqConsulta.FieldByName('PV_ORDEN').AsInteger,
                           sdqConsulta.FieldByName('PV_RECAIDA').AsInteger,
                           sdqConsulta.FieldByName('IDPRESTADOR').AsInteger,
                           iNuevoParte, 'A', DBDate,
                           0, 0, 0, '', 0, DBDate,        // por TK 10785, pongo la fecha actual al pv_fecharecepcion
                           '[Generado del parte anulado Nº ' + sdqConsulta.FieldByName('PV_NROPARTE').AsString +
                           '] - Motivo: ' + fraMotivoAnulacion.Descripcion + ' - Obs: ' + edObservacionesAnu.Text);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmSolicitudAuditoria.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                   Highlight: Boolean);
begin
  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('su_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);

  inherited;

  if not sdqConsulta.FieldByName('FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmSolicitudAuditoria.GridCellClick(Column: TColumn);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('su_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('su_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('su_id').AsString);
    Grid.Repaint;
  end;
end;

procedure TfrmSolicitudAuditoria.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Item: TMenuItem;
  MenuGrilla: TPopUpMenu;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if (sdqConsulta.Active) and (not sdqConsulta.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmSolicitudAuditoria.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                    Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('su_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmSolicitudAuditoria.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;

procedure TfrmSolicitudAuditoria.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;

procedure TfrmSolicitudAuditoria.btnMarcarTodos(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  APointer := sdqConsulta.GetBookmark;

  FRegistrosSeleccionados.Clear;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(FieldByName('su_id').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
  end;
end;

procedure TfrmSolicitudAuditoria.FSFormDestroy(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados.Free;
end;

procedure TfrmSolicitudAuditoria.btnAnuAceptarClick(Sender: TObject);
begin
  Verificar(fraMotivoAnulacion.IsEmpty, fraMotivoAnulacion, 'Debe seleccionar un motivo de anulación.');
  Verificar((Trim(edObservacionesAnu.Lines.Text) = '') or (Length(Trim(edObservacionesAnu.Lines.Text)) < 5) ,
     edObservacionesAnu, 'Debe ingresar las Observaciones para continuar y las mismas deben contener al menos 5 caracteres');    // TK 43265
  fpAnular.ModalResult := mrOk;
end;

// Lu WF 7742
procedure TfrmSolicitudAuditoria.AnularParteEvolutivo(iSiniestro, iOrden, iRecaida, iNroParteElim: Integer);
var iNroAutorizacion: String;
begin
 // Observ := '[Parte Anulado desde Solicitud de Auditoría] Motivo Anulación: ' +          // lo saco por pedido de Guevara en su mail del 22/06/2009
 //            fraMotivoAnulacion.ID + ' - ' + fraMotivoAnulacion.Descripcion + '. ';
 // if (edObservacionesAnu.text <> '') then
 //    Observ := Observ + ' Observaciones: ' + edObservacionesAnu.Text;


  iNroAutorizacion := ValorSqlEx('Select pv_autorizacion from art.spv_parteevolutivo ' +
                                 ' Where pv_siniestro = :Sini ' +
                                   ' and pv_orden = :Ord ' +
                                   ' and pv_recaida = :Reca ' +
                                   ' and pv_nroparte = :Parte ', [iSiniestro, iOrden, iRecaida, iNroParteElim]);

  If iNroAutorizacion <> '' then
    EliminarParteEvolutivo(iSiniestro, iOrden, iRecaida, iNroParteElim, fraMotivoAnulacion.Descripcion, StrToInt(iNroAutorizacion))
  else
    EliminarParteEvolutivo(iSiniestro, iOrden, iRecaida, iNroParteElim, fraMotivoAnulacion.Descripcion);

end;

procedure TfrmSolicitudAuditoria.tbVerDemoraClick(Sender: TObject);
begin
  Grid.ColumnByField['DemoraEnvio'].Visible      := tbVerDemora.Down;
  Grid.ColumnByField['DemoraRecepcion'].Visible  := tbVerDemora.Down;
  Grid.ColumnByField['DemoraTurno'].Visible      := tbVerDemora.Down;

  if tbVerDemora.Down then
  begin
    Grid.ColumnByField['DemoraEnvio'].Width     := 70;
    Grid.ColumnByField['DemoraRecepcion'].Width := 70;
    Grid.ColumnByField['DemoraTurno'].Width     := 70;
  end;

  if sdqConsulta.Active then sdqConsulta.Refresh;
end;

procedure TfrmSolicitudAuditoria.Do_HabilitarBotones;
begin
  tbEnviarMail.Enabled := Seguridad.Activar(tbEnviarMail)
                          and  ((fraEstado.Codigo = '001') or (fraEstado.Codigo = '002'))
                           and ((fraDelegacion.Codigo = DELEG_TUCUMAN)     or
                                (fraDelegacion.Codigo = DELEG_NEUQUEN)     or
                                (fraDelegacion.Codigo = DELEG_MARDELPLATA) or
                                (fraDelegacion.Codigo = DELEG_LAPLATA)     or
                                (fraDelegacion.Codigo = DELEG_MENDOZA)     or
                                (fraDelegacion.Codigo = DELEG_ROSARIO)     or
                                (fraDelegacion.Codigo = DELEG_CORDOBA)     or
                                (fraDelegacion.Codigo = DELEG_BAHIABLANCA) or
                                (fraDelegacion.Codigo = DELEG_USHUAIA)     or
                                (fraDelegacion.Codigo = DELEG_RIOGRANDE));     // TK 22492
end;

procedure TfrmSolicitudAuditoria.tbEnviarMailClick(Sender: TObject);   // TK 22492
var smails, sTextoMail, sTextoComun: string;
    iLoop:integer;
    SqlResults: TStringList;
    bEnvio: boolean;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), tbEnviarMail, 'Debe seleccionar al menos un registro para enviar por mail');

  SqlResults := TStringList.Create;
  Try

    if (MessageDlg('¿Esta seguro que desea enviar el/los E-mails correspondientes?', mtConfirmation, [mbYes,mbNo], 0) = mryes) then
    begin
      for iLoop := 0 to (FRegistrosSeleccionados.count - 1) do
      begin  // sacar ejemplo de unComunes -> DoGenerarAvisoPluriempleo
        case StrToInt(fraDelegacion.Codigo) of    // obtengo la delegación de aquí ya que la unica forma de entrar a este procedimiento es filtrando por delegacion y al refrescar. Sino habría que usar la función sql: "art.siniestro.get_delegacion"
          DEL_TUCUMAN:     smails := Get_DireccionesEnvioMail('D_TUC');
          DEL_NEUQUEN:     smails := Get_DireccionesEnvioMail('D_NEU');
          DEL_MARDELPLATA: smails := Get_DireccionesEnvioMail('D_MAR');
          DEL_LAPLATA:     smails := Get_DireccionesEnvioMail('D_LAP');
          DEL_MENDOZA:     smails := Get_DireccionesEnvioMail('D_MEN');
          DEL_ROSARIO:     smails := Get_DireccionesEnvioMail('D_ROS');
          DEL_CORDOBA:     smails := Get_DireccionesEnvioMail('D_COR');
          DEL_BAHIABLANCA: smails := Get_DireccionesEnvioMail('D_BAH');
          DEL_USHUAIA:     smails := Get_DireccionesEnvioMail('D_USH');
          DEL_RIOGRANDE:   smails := Get_DireccionesEnvioMail('D_RIO');
        end;
       // showmessage('id: ' + FRegistrosSeleccionados[iLoop] + ' - smails: ' + smails);
        SqlResults := ValoresColSql('SELECT art.utiles.armar_siniestro(su_siniestro, su_orden, su_recaida) siniestro, ' +
                                          ' su_nroparte, su_estado, ' +
                                          ' DECODE(su_estado, ''001'', ''Pendiente'', ''002'', ''Enviado'') estado, ' +
                                          ' su_siniestro, su_orden, su_recaida ' +
                                     ' FROM ssu_seguimientoauditoria ' +
                                    ' WHERE su_id = ' + SqlInt(FRegistrosSeleccionados[iLoop]));
        if (SqlResults[2] = '001') then   // Pendiente
          sTextoMail := cRECLAMO_ESTPENDIENTE
        else                              // Enviado
          sTextoMail := cRECLAMO_ESTENVIADO;

        sTextoComun := #13#10 + #13#10 + 'Datos de la solicitud: ' + #13#10 +
                      'Nro. Siniestro: ' + SqlResults[0] + #13#10 +
                      'Nro. Parte: ' + SqlResults[1] + #13#10 + 'Estado: ' + SqlResults[3];

        bEnvio := unMoldeEnvioMail.EnviarMailBD(smails, 'Solicitud de auditoría médica',
                                                [oShowDialogIfEmpty, oAutoFirma],
                                                sTextoMail + sTextoComun);
        if bEnvio then
        begin
          Do_ActualizarFecEnvioReclamo(StrToInt(FRegistrosSeleccionados[iLoop]));
          Do_GenerarParte_EnvioReclamo(SqlResults[2], StrToInt(SqlResults[4]), StrToInt(SqlResults[5]), StrToInt(SqlResults[6]));
        end;

      end; // del for
    end;

  finally
    SqlResults.Free;
  end;

end;

procedure TfrmSolicitudAuditoria.Do_ActualizarFecEnvioReclamo(iIdSSU:integer);    // TK 22492
var sSql:string;
   // dFechaReclamoAnterior: Tdatetime;
begin
  // Tomo la fecha de reclamo anterior (si la hubiese)  TK 24172
//  dFechaReclamoAnterior := ValorSqlDateTimeEx('SELECT su_fecEnvioReclamo ' +
//                                               ' FROM sin.ssu_seguimientoauditoria ' +
//                                              ' WHERE su_id = :idssu ', [iIdSSU]);

  // cambio por ticket 25240: Guardo la fecha actual de reclamo y se va acumulando.
  sSql := 'UPDATE sin.ssu_seguimientoauditoria ' +
            ' SET su_fecEnvioReclamo = trunc(sysdate) ' +
          ' WHERE su_id = :idssu ';
  EjecutarSqlEx(sSql, [iIdSSU]);

  sSql := 'INSERT INTO sin.shr_historicoreclamosauditoria ' +
           '( hr_idsegaud, hr_fechareclamo, hr_fechacarga, hr_usucarga) VALUES ' +
          // '( ' + SqlInt(sdqConsulta.FieldByName('SU_ID').AsInteger) + ', trunc(sysdate), sysdate, ' +
           '( ' + SqlInt(iIdSSU) + ', trunc(sysdate), sysdate, ' +
                  SqlValue(Sesion.UserID) + ') ';
  EjecutarSql(sSql);
end;

procedure TfrmSolicitudAuditoria.Do_GenerarParte_EnvioReclamo(sEstado:string; iSiniestro, iOrden, iRecaida: Integer);    // TK 22492
var iNuevoParte: integer;
    sObserv: string;
begin
  iNuevoParte := ValorSqlEx('SELECT MAX(pv_nroparte)+1 ' +
                             ' FROM art.spv_parteevolutivo ' +
                            ' WHERE pv_siniestro = :Sin ' +
                              ' AND pv_orden = :Orden ' +
                              ' AND pv_recaida = :Reca', [iSiniestro, iOrden, iRecaida]);

  if (sEstado = '001') then
    sObserv := cRECLAMO_ESTPENDIENTE
  else
    sObserv := cRECLAMO_ESTENVIADO;

  InsertarParteEvolutivo(True, iSiniestro, iOrden, iRecaida, ART_IDENTIF_PREST_AUDIT,
                         iNuevoParte, 'A', DBDate, 0, 0, 0, '', 0, DBDate, sObserv);
end;

procedure TfrmSolicitudAuditoria.tbHistoricoReclamosClick(Sender: TObject);  // TK 24172
begin
  if ValidarFiltros_HistoricoReclamos then
    fpHistoricoReclamos.showmodal;
end;

procedure TfrmSolicitudAuditoria.tbSalir3Click(Sender: TObject);
begin
  tbSalirClick(Nil);
end;

procedure TfrmSolicitudAuditoria.btnCerrarHistReclClick(Sender: TObject);
begin
  fpHistoricoReclamos.ModalResult := mrOk;
end;

procedure TfrmSolicitudAuditoria.fpHistoricoReclamosBeforeShow(Sender: TObject);
var sSql: string;
begin
  // para este listado se tienen en cuenta todos los filtros de la pantalla, MENOS el Destinatario, y los dos checks de Infectología y Listado.
  sdqHistoricoReclamos.Close;
  sSql := 'SELECT su_siniestro, su_orden, su_recaida, su_nroparte, es_descripcion Estado, ' +
                ' el_nombre Delegacion, hr_fechacarga FechaYHoraRecl, au_nombre, su_fechabaja, trunc(su_fechaenvio) su_fechaenvio ' +
           ' FROM SIN.shr_historicoreclamosauditoria, ssu_seguimientoauditoria, art.sex_expedientes, ' +
                ' sue_auditoriasenviadas, art.mau_auditores, art.del_delegacion, SIN.ses_estadoseguimiento ' +
          ' WHERE hr_idsegaud = su_id ' +
            ' AND su_idexpediente = ex_id ' +
            ' AND su_id = ue_seguimientoid(+) ' +
            ' AND ue_auditorid = au_auditor(+) ' +
            ' AND el_id = ex_delegacion ' +
            ' AND es_codigo = su_estado ' +
            ' AND su_fechaalta between ' + SqlValue(dcbFechaSolicitudDesde.Date) + ' and ' +
                                           SqlValue(dcbFechaSolicitudHasta.Date);
  MemoFiltros.Clear;
  MemoFiltros.Lines.Add('Fecha de Solicitud: ' + dcbFechaSolicitudDesde.Text + ' >> ' + dcbFechaSolicitudHasta.Text);

  if not(SinEdit.IsEmpty) then
  begin
    sSql     := sSql + ' AND su_siniestro = ' + SqlInt(SinEdit.Siniestro) +
                       ' AND su_orden = ' + SqlInt(SinEdit.Orden) +
                       ' AND su_recaida = ' + SqlInt(SinEdit.Recaida);
    MemoFiltros.Lines.Add('Siniestro: ' + SinEdit.SinOrdRec);
  end;

  if not fraEstado.IsEmpty then
  begin
    sSql     := sSql + ' AND es_codigo = ' + SqlValue(fraEstado.Value);
    MemoFiltros.Lines.Add('Estado: ' + FraEstado.Descripcion);
  end;

  if not fraDelegacion.IsEmpty then
  begin
    sSql     := sSql + ' AND ex_delegacion = ' + SqlValue(fraDelegacion.Codigo);
    MemoFiltros.Lines.Add('Delegación: ' + fraDelegacion.Descripcion);
  end;

  if not fraAuditor.IsEmpty then
  begin
    sSql     := sSql + ' AND ue_auditorid = ' + SqlValue(fraAuditor.Value);
    MemoFiltros.Lines.Add('Auditor: ' + fraAuditor.Descripcion);
  end;

  if not dcbFechaEnvioDesde.IsEmpty then
    sSql     := sSql + ' AND SU_FECHAENVIO >= ' + SqlValue(dcbFechaEnvioDesde.Date);

  if not dcbFechaEnvioHasta.IsEmpty then
    sSql := sSql + ' AND SU_FECHAENVIO <= ' + SqlValue(dcbFechaEnvioHasta.Date);

  if (not dcbFechaEnvioDesde.IsEmpty) or (not dcbFechaEnvioHasta.IsEmpty) then
    MemoFiltros.Lines.Add('Fecha Envio: ' + dcbFechaEnvioDesde.Text + ' >> ' + dcbFechaEnvioHasta.Text);

  if not dcbFechaAuditoriaDesde.IsEmpty then
    sSql := sSql + ' AND SU_FECHAAUDITORIA >= ' + SqlValue(dcbFechaAuditoriaDesde.Date);

  if not dcbFechaAuditoriaHasta.IsEmpty then
    sSql := sSql + ' AND SU_FECHAAUDITORIA <= ' + SqlValue(dcbFechaAuditoriaHasta.Date);

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if (not dcbFechaAuditoriaDesde.IsEmpty) or (not dcbFechaAuditoriaHasta.IsEmpty) then
    MemoFiltros.Lines.Add('Fecha Auditoría: ' + dcbFechaAuditoriaDesde.Text + ' >> ' + dcbFechaAuditoriaHasta.Text);

  sdqHistoricoReclamos.sql.text := sSql;
  sdqHistoricoReclamos.Open;
end;

function TfrmSolicitudAuditoria.ValidarFiltros_HistoricoReclamos: boolean;   // TK 25240
begin
  Verificar(dcbFechaSolicitudDesde.IsEmpty or dcbFechaSolicitudHasta.IsEmpty, lblFSolicitud,
            'Debe filtrar como mínimo, por Fecha de Solicitud para visualizar los Históricos de Reclamos.');
  Result := True;
end;

procedure TfrmSolicitudAuditoria.btnSalirClick(Sender: TObject);
begin
  fpHistoricoReclamos.ModalResult := mrOk;
  fpHistoricoReclamos.Close;
end;

procedure TfrmSolicitudAuditoria.tbVerFiltrosClick(Sender: TObject);
begin
  if tbVerFiltros.Down then
  begin
    dbgHistoricoReclamos.Height := 217;
    dbgHistoricoReclamos.Top    := 113;
    tbVerFiltros.ImageIndex     := 17;
  end
  else begin
    dbgHistoricoReclamos.Height := 304;
    dbgHistoricoReclamos.Top    := 27;
    tbVerFiltros.ImageIndex     := 18;
  end;
end;

procedure TfrmSolicitudAuditoria.tbExportar_reclamosClick(Sender: TObject);
begin
  ExportDialogHistRecl.Execute;
end;

procedure TfrmSolicitudAuditoria.tbOrdenar_reclamosClick(Sender: TObject);
begin
  inherited;
  SortDialog_reclamos.Execute;
end;

end.
