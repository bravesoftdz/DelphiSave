unit unProcesoArchivoLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unProcesoArchivo, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, StdCtrls,
  ExtCtrls, Mask, PatternEdit, SinEdit, FormPanel, unGrids, RxPlacemnt;

type
  TfrmProcesoArchivoLegales = class(TfrmProcesoArchivo)
    Legales: TTabSheet;
    lbExpedienteSrtFiltro: TLabel;
    lbNroCarpetaFiltro: TLabel;
    lbNroSiniestroFiltro: TLabel;
    fraNroCarpetaFiltro: TfraCodigoDescripcion;
    edNroExpediente: TPatternEdit;
    Label1: TLabel;
    edAnioExpediente: TPatternEdit;
    edSiniestro: TSinEdit;
    ShortCutControl1: TShortCutControl;
    tbMarcarResuelto: TToolButton;
    pnMarcarComoResuelto: TFormPanel;
    lbObservacion: TLabel;
    btnAceptarMarcarComoResuelto: TButton;
    btnCancelarMarcarComoResuelto: TButton;
    edObservacion: TMemo;
    Label2: TLabel;
    fraMotivoResolucionSRT: TfraCodigoDescripcion;
    sdqModificacionRegistro: TSDQuery;
    sdqConsultaRegistro: TSDQuery;
    Panel1: TPanel;
    pnlBottom: TPanel;
    lbCantidad: TLabel;
    cbExportado: TCheckBox;
    Label3: TLabel;
    fraCodigoErrorNoExpFiltro: TfraCodigoDescripcion;
    cbNoExportado: TCheckBox;
    edExpedienteExportFiltro: TPatternEdit;
    Label4: TLabel;
    cbAceptados: TCheckBox;
    tbSeleccionarTodos: TToolButton;
    cbAltaFiltro: TCheckBox;
    Label5: TLabel;
    cbModificacionFiltro: TCheckBox;
    cbBajaFiltro: TCheckBox;
    Label6: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbMarcarResueltoClick(Sender: TObject);
    procedure btnAceptarMarcarComoResueltoClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbSeleccionarTodosClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    SelectedList: TBookMarkLst;

  public
    { Public declarations }
  end;

var
  frmProcesoArchivoLegales: TfrmProcesoArchivoLegales;

implementation

uses Math, AnsiSql, unCustomConsulta, VCLExtra, CustomDlgs, unDmPrincipal, unSesion, unABMSeguimientoJuiciosParteDemandada, SDCommon,
     unConstLegales;

{$R *.dfm}

procedure TfrmProcesoArchivoLegales.tbRefrescarClick(Sender: TObject);
var
  sTipoOperacion, sWhere : String;
  sWhereInt, sWhereExt, sWhereAux : String;
begin
  Verificar(not fraTipoArchivoFiltro.isselected,fraTipoArchivoFiltro,'Debe seleccionar un tipo de archivo.');
  SelectedList.Clear;
  sTipoOperacion := '';
  If fraTipoArchivoFiltro.value = 1 then
  begin
    if edNroExpediente.Text <> '' then
      sWhere := sWhere + ' AND JT_NROEXPEDIENTE = '+SqlValue(edNroExpediente.Text);

    if edAnioExpediente.Text <> '' then
      sWhere := sWhere + ' AND JT_ANIOEXPEDIENTE = '+SqlValue(edAnioExpediente.Text);

    if fraProcesoFiltro.IsSelected then
      sWhere := sWhere + ' AND ej_idprocesoexport = '+SqlValue(fraProcesoFiltro.Value);

    if edExpedienteExportFiltro.Text <> '' then
      sWhere := sWhere + ' AND ej_nroexpedientejudicial = '+SqlValue(edExpedienteExportFiltro.Text);

    if fraCodigoErrorFiltro.IsSelected then
    begin
      sWhereExt := sWhereExt + ' AND ej_motivorechazo = '+SqlValue(fraCodigoErrorFiltro.Codigo);
    end;

    if fraCodigoErrorNoExpFiltro.IsSelected then
    begin
      sWhereInt := sWhereInt + ' AND EJ_IDMOTIVORECHAZOINT = '+SqlValue(fraCodigoErrorNoExpFiltro.Codigo);
    end;

    if fraNroCarpetaFiltro.IsSelected then
      sWhere := sWhere + ' AND ej_idjuicioentramite = '+SqlValue(fraNroCarpetaFiltro.Value);

    if edSiniestro.Text <> '' then
      sWhere := sWhere + ' AND ej_idjuicioentramite in (SELECT od_idjuicioentramite '+
                         '                                FROM legales.lsj_siniestrosjuicioentramite, legales.lod_origendemanda '+
                         '                               WHERE sj_idorigendemanda = od_id '+
                         '                                 AND sj_siniestro = '+SqlValue(edSiniestro.Siniestro)+
                         '                                 AND sj_orden = '+SqlValue(edSiniestro.Orden)+
                         '                                 AND sj_recaida = '+SqlValue(edSiniestro.Recaida)+')';

    sWhereAux := '';
    If cbResueltoFiltro.Checked then
    begin
      if sWhereAux = '' then
        sWhereAux := sWhereAux + ' ((ej_motivorechazo IS NOT NULL OR ej_motivodescint IS NOT NULL) AND  EJ_FECHARESOLUCION IS NOT NULL)'
      else
        sWhereAux := sWhereAux + ' OR ((ej_motivorechazo IS NOT NULL OR ej_motivodescint IS NOT NULL) AND  EJ_FECHARESOLUCION IS NOT NULL)';
    end;
    If cbSinResolverFiltro.Checked then
    begin
      if sWhereAux = '' then
        sWhereAux := sWhereAux + ' ((ej_motivorechazo IS NOT NULL OR ej_motivodescint IS NOT NULL) AND EJ_FECHARESOLUCION IS NULL)'
      else
        sWhereAux := sWhereAux + ' OR ((ej_motivorechazo IS NOT NULL OR ej_motivodescint IS NOT NULL) AND EJ_FECHARESOLUCION IS NULL)';
    end;
    If cbAceptados.Checked then
    begin
      if sWhereAux = '' then
        sWhereAux := sWhereAux + ' ((ej_motivorechazo IS NULL AND ej_motivodescint IS NULL))'
      else
        sWhereAux := sWhereAux + ' OR ((ej_motivorechazo IS NULL AND ej_motivodescint IS NULL))';
    end;
    if sWhereAux <> '' then
    begin
      sWhere := sWhere + ' AND ('+sWhereAux+')';
    end;

    if cbExportado.Checked and not cbNoExportado.Checked then
      sWhere := sWhere + ' AND ej_idmotivorechazoint is null ';

    if not cbExportado.Checked and cbNoExportado.Checked then
      sWhere := sWhere + ' AND ej_idmotivorechazoint is not null ';

        if cbAltaFiltro.Checked then
    begin
      if sTipoOperacion <> '' then
        sTipoOperacion := sTipoOperacion+ ', ''A'' '
      else
        sTipoOperacion := ' ''A'' ';
    end;

    if cbModificacionFiltro.Checked then
    begin
      if sTipoOperacion <> '' then
        sTipoOperacion := sTipoOperacion+ ', ''M'' '
      else
        sTipoOperacion := ' ''M'' ';
    end;

    If cbBajaFiltro.Checked then
    begin
      if sTipoOperacion <> '' then
        sTipoOperacion :=sTipoOperacion+  ', ''B'' '
      else
        sTipoOperacion := ' ''B'' ';
    end;

    if sTipoOperacion <> '' then
      sWhere := sWhere + ' AND ej_tipooperacion IN ('+sTipoOperacion+') ';



    sdqConsulta.SQL.Text :=
      ' SELECT NULL "¿?", ej_nroexpedientejudicial "Nro Expediente Judicial", '+
      '        jt_numerocarpeta AS "Nro. Carpeta", ej_caratula "Carátula", '+
      '        CASE '+
      '           WHEN (ej_motivorechazo IS NOT NULL '+
      '                 AND ej_fecharesolucion IS NOT NULL '+
      '                ) '+
      '              THEN ''RESUELTO'' '+
      '           WHEN (ej_motivorechazo IS NOT NULL AND ej_fecharesolucion IS NULL) '+
      '              THEN ''SIN RESOLVER'' '+
      '           WHEN (ej_motivorechazo IS NULL)  '+
      '              THEN ''ACEPTADO'' '+
      '        END "Estado", '+
      '        ej_tipooperacion "Tipo Operación", pa_fechaexport "Fecha Export", '+
      '        ej_fecharespuesta "Fecha Respuesta", '+
      '        ej_motivorechazo "Código Motivo Rechazo", '+
      '        tb_descripcion "Motivo Rechazo", ej_fecharesolucion "Fecha Resolución", '+
      '        ej_observacionresolucion "Observación Resolución", '+
      '        mr_descripcion "Motivo Resolución", '+
      '        ej_cantabogparteactora "Cant. Abogados Parte Actora", '+
      '        ej_cantperitosoficial "Cant. Peritos Oficial", '+
      '        ej_siniestro "Siniestro", ej_fechaaccidente "Fecha Accidente", '+
      '        ej_fechanotificacion "Fecha Notificación", '+
      '        ej_montoreclamado "Monto Reclamado", pa_usualta "Usuario Export", '+
      '        ej_usurespuesta "Usuario Respuesta", '+
      '        ej_usuarioresolucion "Usuario Resolución", ej_cuit "CUIT", '+
      '        ej_cuil "CUIL", ej_presestudiosmed "Presentó Estudios Médicos", '+
      '        ej_prescertificadosmed "Presentó Certificados Médicos", '+
      '        ej_cantmedicparteactora "Cant. Médicos Parte Actora", '+
      '        ej_incapacidad "Incapacidad", '+
      '        ej_porcincapperito "Porcentaje Incapacidad Perito", '+
      '        ej_porcincapart "Porcentaje Incapacidad ART", '+
      '        ej_revisosiniestrado "Revisó Siniestrado", '+
      '        ej_actuacionart "Actuación ART", ej_vinculolaboral "Vínculo Laboral", '+
      '        ej_contigenciareclamada1 "Contingencia Reclamada 1", '+
      '        ej_contigenciareclamada2 "Contingencia Reclamada 2", '+
      '        ej_contigenciareclamada3 "Contingencia Reclamada 3", '+
      '        ej_enfermedadreclamada1 "Enfermedad Reclamada 1", '+
      '        ej_enfermedadreclamada2 "Enfermedad Reclamada 2", '+
      '        ej_enfermedadreclamada3 "Enfermedad Reclamada 3", '+
      '        ej_enfermedadreclamada4 "Enfermedad Reclamada 4", '+
      '        ej_objetoreclamo1 "Objeto de Reclamo 1", '+
      '        ej_objetoreclamo2 "Objeto de Reclamo 2", '+
      '        ej_objetoreclamo3 "Objeto de Reclamo 3", '+
      '        ej_objetoreclamo4 "Objeto de Reclamo 4", '+
      '        ej_objetoreclamo5 "Objeto de Reclamo 5", '+
      '        (SELECT    ex_siniestro '+
      '                || '' / '' '+
      '                || ex_orden '+
      '                || '' / '' '+
      '                || ex_recaida '+
      '           FROM art.sex_expedientes '+
      '          WHERE ex_id = ej_idsiniestro) "Nro. Siniestro", '+
      '        ej_idprocesoexport "ID proceso Export", ej_aseguradora "Aseguradora", '+
      '        ej_caracterart "Caracter ART", '+
      '        ej_departamentojudicial "Departamento Judicial", '+
      '        ej_juzgadootribunal "Juzgado Tribunal", '+
      '        ej_nroexpedientecm "Nro. Expediente", '+
      '        ej_estadomediacion "Estado Mediación", '+
      '        ej_sentcorteprovincial "Sentencia Corte Provincial", '+
      '        ej_sentcortesuprema "Sentencia Corte Suprema", '+
      '        ej_sentpriminstancia "Sentencia Primera Instancia", '+
      '        ej_montopriminstancia "Monto Primera Instancia", '+
      '        ej_porcincappriminstancia "% Inc. Primera Instancia", '+
      '        ej_sentseginstancia "Sentencia Segunda Instancia", '+
      '        ej_montoseginstancia "Monto Segunda Instancia", '+
      '        ej_porcincapseginstancia "% Inc. Segunda Instancia", '+
      '        ej_idjuicioentramite "ID Juicio", ej_id ID, ej_idmotivorechazoint '+
      '   FROM legales.lej_exportacionjuicios, legales.lmr_motivoresolucionsrt, art.ctb_tablas, legales.ljt_juicioentramite, comunes.cpa_procesosarchivos '+
      '  WHERE ej_idmotivoresolucion = mr_id(+) '+
      '    AND ej_motivorechazo = tb_codigo(+) '+
      '    AND tb_clave(+) = ''SRT'' '+
      '    AND ej_idjuicioentramite = jt_id(+) '+
      '    AND pa_id = ej_idprocesoexport '+
      '    AND ej_idmotivorechazoint IS NULL '+sWhere+sWhereExt+
      ' UNION ALL '+
      ' SELECT NULL "¿?", ej_nroexpedientejudicial "Nro Expediente Judicial", '+
      '        jt_numerocarpeta AS "Nro. Carpeta", ej_caratula "Carátula", '+
      '        CASE '+
      '           WHEN (ej_motivorechazo IS NOT NULL '+
      '                 AND ej_fecharesolucion IS NOT NULL '+
      '                ) '+
      '              THEN ''RESUELTO''  '+
      '           WHEN (ej_motivorechazo IS NOT NULL AND ej_fecharesolucion IS NULL) '+
      '              THEN ''SIN RESOLVER'' '+
      '           WHEN (ej_motivorechazo IS NULL) '+
      '              THEN ''ACEPTADO'' '+
      '        END "Estado", '+
      '        ej_tipooperacion "Tipo Operación", pa_fechaexport "Fecha Export", '+
      '        ej_fecharespuesta "Fecha Respuesta", '+
      '        ej_motivorechazo "Codigo Motivo Rechazo", '+
      '        ej_motivodescint "Motivo Rechazo", '+
      '        ej_fecharesolucion "Fecha Resolución", '+
      '        ej_observacionresolucion "Observación Resolución", '+
      '        mr_descripcion "Motivo Resolución", '+
      '        ej_cantabogparteactora "Cant. Abogados Parte Actora", '+
      '        ej_cantperitosoficial "Cant. Peritos Oficial", '+
      '        ej_siniestro "Siniestro", ej_fechaaccidente "Fecha Accidente", '+
      '        ej_fechanotificacion "Fecha Notificación", '+
      '        ej_montoreclamado "Monto Reclamado", pa_usualta "Usuario Export", '+
      '        ej_usurespuesta "Usuario Respuesta", '+
      '        ej_usuarioresolucion "Usuario Resolución", ej_cuit "CUIT", '+
      '        ej_cuil "CUIL", ej_presestudiosmed "Presentó Estudios Médicos", '+
      '        ej_prescertificadosmed "Presentó Certificados Médicos", '+
      '        ej_cantmedicparteactora "Cant. Médicos Parte Actora", '+
      '        ej_incapacidad "Incapacidad", '+
      '        ej_porcincapperito "Porcentaje Incapacidad Perito", '+
      '        ej_porcincapart "Porcentaje Incapacidad ART", '+
      '        ej_revisosiniestrado "Revisó Siniestrado", '+
      '        ej_actuacionart "Actuación ART", ej_vinculolaboral "Vínculo Laboral", '+
      '        ej_contigenciareclamada1 "Contingencia Reclamada 1", '+
      '        ej_contigenciareclamada2 "Contingencia Reclamada 2", '+
      '        ej_contigenciareclamada3 "Contingencia Reclamada 3", '+
      '        ej_enfermedadreclamada1 "Enfermedad Reclamada 1", '+
      '        ej_enfermedadreclamada2 "Enfermedad Reclamada 2", '+
      '        ej_enfermedadreclamada3 "Enfermedad Reclamada 3", '+
      '        ej_enfermedadreclamada4 "Enfermedad Reclamada 4", '+
      '        ej_objetoreclamo1 "Objeto de Reclamo 1", '+
      '        ej_objetoreclamo2 "Objeto de Reclamo 2", '+
      '        ej_objetoreclamo3 "Objeto de Reclamo 3", '+
      '        ej_objetoreclamo4 "Objeto de Reclamo 4", '+
      '        ej_objetoreclamo5 "Objeto de Reclamo 5", '+
      '        (SELECT    ex_siniestro '+
      '                || '' / '' '+
      '                || ex_orden '+
      '                || '' / '' '+
      '                || ex_recaida '+
      '           FROM art.sex_expedientes '+
      '          WHERE ex_id = ej_idsiniestro) "Nro. Siniestro", '+
      '        ej_idprocesoexport "ID proceso Export", ej_aseguradora "Aseguradora", '+
      '        ej_caracterart "Caracter ART", '+
      '        ej_departamentojudicial "Departamento Judicial", '+
      '        ej_juzgadootribunal "Juzgado Tribunal", '+
      '        ej_nroexpedientecm "Nro. Expediente", '+
      '        ej_estadomediacion "Estado Mediación", '+
      '        ej_sentcorteprovincial "Sentencia Corte Provincial", '+
      '        ej_sentcortesuprema "Sentencia Corte Suprema", '+
      '        ej_sentpriminstancia "Sentencia Primera Instancia", '+
      '        ej_montopriminstancia "Monto Primera Instancia", '+
      '        ej_porcincappriminstancia "% Inc. Primera Instancia", '+
      '        ej_sentseginstancia "Sentencia Segunda Instancia", '+
      '        ej_montoseginstancia "Monto Segunda Instancia", '+
      '        ej_porcincapseginstancia "% Inc. Segunda Instancia", '+
      '        ej_idjuicioentramite "ID Juicio", ej_id ID, ej_idmotivorechazoint '+
      '   FROM legales.lej_exportacionjuicios, legales.lmr_motivoresolucionsrt, legales.ljt_juicioentramite, comunes.cpa_procesosarchivos '+
      '  WHERE ej_idmotivoresolucion = mr_id(+) '+
      '    AND ej_idjuicioentramite = jt_id(+) '+
      '    AND pa_id = ej_idprocesoexport '+
      '    AND ej_idmotivorechazoint IS NOT NULL '+sWhere+sWhereInt;

  end;
  If fraTipoArchivoFiltro.value = 2 then
  begin
    if edNroExpediente.Text <> '' then
      sWhere := sWhere + ' AND JT_NROEXPEDIENTE = '+SqlValue(edNroExpediente.Text);

    if edAnioExpediente.Text <> '' then
      sWhere := sWhere + ' AND JT_ANIOEXPEDIENTE = '+SqlValue(edAnioExpediente.Text);

    if fraProcesoFiltro.IsSelected then
      sWhere := sWhere + ' AND ep_idproceso = '+SqlValue(fraProcesoFiltro.Value);

    if edExpedienteExportFiltro.Text <> '' then
      sWhere := sWhere + ' AND ep_nroexpedientejudicial = '+SqlValue(edExpedienteExportFiltro.Text);

    if fraCodigoErrorFiltro.IsSelected then
    begin
      sWhere := sWhere + ' AND ep_motivorechazo = '+SqlValue(fraCodigoErrorFiltro.Codigo);
    end;

    if fraNroCarpetaFiltro.IsSelected then
      sWhere := sWhere + ' AND ep_idjuicioentramite = '+SqlValue(fraNroCarpetaFiltro.Value);

    if edSiniestro.Text <> '' then
      sWhere := sWhere + ' AND ep_idjuicioentramite in (SELECT od_idjuicioentramite '+
                         '                                FROM legales.lsj_siniestrosjuicioentramite, legales.lod_origendemanda '+
                         '                               WHERE sj_idorigendemanda = od_id '+
                         '                                 AND sj_siniestro = '+SqlValue(edSiniestro.Siniestro)+
                         '                                 AND sj_orden = '+SqlValue(edSiniestro.Orden)+
                         '                                 AND sj_recaida = '+SqlValue(edSiniestro.Recaida)+')';
    sWhereAux := '';
    If cbResueltoFiltro.Checked then
    begin
      if sWhereAux = '' then
        sWhereAux := sWhereAux + ' (ep_motivorechazo IS NOT NULL AND ep_fecharesolucion IS NOT NULL)'
      else
        sWhereAux := sWhereAux + ' OR (ep_motivorechazo IS NOT NULL AND ep_fecharesolucion IS NOT NULL)';
    end;
    If cbSinResolverFiltro.Checked then
    begin
      if sWhereAux = '' then
        sWhereAux := sWhereAux + ' (ep_motivorechazo IS NOT NULL AND ep_fecharesolucion IS NULL)'
      else
        sWhereAux := sWhereAux + ' OR (ep_motivorechazo IS NOT NULL AND ep_fecharesolucion IS NULL)';
    end;
    If cbAceptados.Checked then
    begin
      if sWhereAux = '' then
        sWhereAux := sWhereAux + ' (ep_motivorechazo IS NULL)'
      else
        sWhereAux := sWhereAux + ' OR (ep_motivorechazo IS NULL)';
    end;
    if sWhereAux <> '' then
    begin
      sWhere := sWhere + ' AND ('+sWhereAux+')';
    end;


    if cbAltaFiltro.Checked then
    begin
      if sTipoOperacion <> '' then
        sTipoOperacion := sTipoOperacion+ ', ''A'' '
      else
        sTipoOperacion := ' ''A'' ';
    end;

    if cbModificacionFiltro.Checked then
    begin
      if sTipoOperacion <> '' then
        sTipoOperacion := sTipoOperacion+  ', ''M'' '
      else
        sTipoOperacion := ' ''M'' ';
    end;

    If cbBajaFiltro.Checked then
    begin
      if sTipoOperacion <> '' then
        sTipoOperacion := sTipoOperacion+ ', ''B'' '
      else
        sTipoOperacion := ' ''B'' ';
    end;

    if sTipoOperacion <> '' then
      sWhere := sWhere + ' AND ep_tipooperacion IN ('+sTipoOperacion+') ';

    sdqConsulta.SQL.Text :=
      ' SELECT null "¿?", ep_aseguradora "Aseguradora", ep_nroexpedientejudicial "Nro Expediente Judicial", '+
      '        CASE WHEN(    ep_motivorechazo IS NOT NULL AND ep_fecharesolucion IS NOT NULL) THEN ''RESUELTO'' '+
      '             WHEN(    ep_motivorechazo IS NOT NULL AND ep_fecharesolucion IS NULL) THEN ''SIN RESOLVER'' '+
      '             WHEN(ep_motivorechazo IS NULL) THEN ''ACEPTADO'' END "Estado" , '+
      '        ep_nroprofesional "Nro. Profesional", ep_tipoprofesional "Tipo Profesional", ep_apellido "Apellido", '+
      '        ep_nombre "Nombre", ep_domicilio "Domicilio", ep_tipooperacion "Tipo Operación", '+
      '        jt_numerocarpeta AS "Nro. Carpeta" , '+
      '        ep_idtablamaestro "ID Tabla Maestro", ep_motivorechazo "Codigo Motivo Rechazo", tb_descripcion "Motivo Rechazo", '+
      '        pa_fechaexport "Fecha Export", pa_usualta "Usuario Export", '+
      '        ep_fecharespuesta "Fecha Respuesta", ep_usurespuesta "Usuario Respuesta", ep_usuarioresolucion "Usuario Resolución", '+
      '        ep_fecharesolucion "Fecha Resolución" , ep_observacionresolucion "Observación Resolución", '+
      '        ep_idmotivoresolucion "ID Motivo Resolución", mr_descripcion "Motivo Resolución" ,ep_idproceso "ID proceso Export", ep_idjuicioentramite "ID Juicio", EP_ID ID '+
      '   FROM legales.lep_exportprofesionales, legales.lmr_motivoresolucionsrt, art.ctb_tablas, legales.ljt_juicioentramite, comunes.cpa_procesosarchivos '+
      '  WHERE ep_idmotivoresolucion = mr_id(+) '+
      '    AND ep_motivorechazo = tb_codigo(+) '+
      '    AND ep_idjuicioentramite = jt_id(+) '+
      '    AND pa_id = ep_idproceso '+
      '    AND tb_clave(+) = ''SRT'' '+sWhere;
  end;

  //sdqConsulta.SQL.Add(SortDialog.OrderBy);
  inherited;
  if fraTipoArchivoFiltro.IsSelected then
  begin
    sdqConsulta.FieldByName('ID Juicio').Visible := False;
    sdqConsulta.FieldByName('ID').Visible := False;
  end;
  if fraTipoArchivoFiltro.Value = 1 then
    sdqConsulta.FieldByName('ej_idmotivorechazoint').Visible := False;


  lbCantidad.Caption := 'Cantidad: '+ IntToStr(sdqConsulta.RecordCount);
  DynColWidthsByData(Grid);
end;



procedure TfrmProcesoArchivoLegales.FormCreate(Sender: TObject);
begin
  inherited;
  pcFiltrosBusqueda.TabIndex := 0;

  with fraNroCarpetaFiltro do
  begin
    TableName   := 'LEGALES.LJT_JUICIOENTRAMITE';
    FieldID     := 'JT_ID';
    FieldCodigo := 'JT_NUMEROCARPETA';
    FieldDesc   := 'jt_demandante || '' C/ '' || jt_demandado || '' '' || jt_caratula';
    FieldBaja   := 'JT_FECHABAJA';
    ExtraCondition := ' AND JT_ESTADOMEDIACION = ''J'' ';
    Showbajas   := True;
  end;

  with fraMotivoResolucionSRT do
  begin
    TableName   := 'LEGALES.LMR_MOTIVORESOLUCIONSRT';
    FieldID     := 'MR_ID';
    FieldCodigo := 'MR_ID';
    FieldDesc   := 'MR_DESCRIPCION';
    FieldBaja   := 'MR_FECHABAJA';
    Showbajas   := False;
  end;

  fraCodigoErrorFiltro.ExtraCondition := fraCodigoErrorFiltro.ExtraCondition + ' AND LENGTH (tb_codigo) > 1 ';


  with fraCodigoErrorNoExpFiltro do
  begin
    TableName   := 'legales.lmi_motivointernorechazo';
    FieldID     := 'MI_ID';
    FieldCodigo := 'MI_ID';
    FieldDesc   := 'MI_DESCRIPCION';
    FieldBaja   := 'MI_FECHABAJA';
    Showbajas   := False;
  end;
  tbSeleccionarTodos.Left := tbSalir.Left -5;
  tbMarcarResuelto.Left := tbSalir.Left -5;
  SelectedList := TBookMarkLst.Create;
end;

procedure TfrmProcesoArchivoLegales.tbLimpiarClick(Sender: TObject);
var
 i : integer;
begin
  inherited;
  edNroExpediente.Clear;
  edAnioExpediente.Clear;
  fraNroCarpetaFiltro.Clear;
  edSiniestro.Clear;
  fraCodigoErrorNoExpFiltro.Clear;
  cbExportado.Checked := False;
  cbNoExportado.Checked := False;
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
  SelectedList.Clear;
  Grid.Refresh;
end;

procedure TfrmProcesoArchivoLegales.tbMarcarResueltoClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    Verificar(SelectedList.Count = 0, Grid, 'Debe seleccionar algun registro.');
    fraMotivoResolucionSRT.Clear;
    edObservacion.Clear;
    pnMarcarComoResuelto.ShowModal;
  end;
end;

procedure TfrmProcesoArchivoLegales.btnAceptarMarcarComoResueltoClick(
  Sender: TObject);
var
  i : integer;
begin
  inherited;
  try
    Verificar(not fraMotivoResolucionSRT.IsSelected, fraMotivoResolucionSRT, 'Debe seleccionar motivo de resolución SRT.');

    if fraTipoArchivoFiltro.Codigo = 'JJ' then
    begin
      for i:=0 to SelectedList.Count-1 do
      begin
        Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);

        if sdqConsulta.FieldByName('Tipo Operación').AsString = 'A' then
        begin
          EjecutarSql(
            'UPDATE legales.ljt_juicioentramite' +
            '   SET jt_fechaexport = NULL ,'+
            '       jt_expedienteexport = NULL,'+
            '       jt_usuexport = NULL '+
            ' WHERE JT_ID = (SELECT ej_idjuicioentramite FROM LEGALES.LEJ_EXPORTACIONJUICIOS WHERE ej_motivorechazo IS NOT NULL AND EJ_FECHARESOLUCION IS NULL AND EJ_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

           EjecutarSql(
            'UPDATE legales.lod_origendemanda' +
            '   SET od_fechaexport2 = NULL ,'+
            '       od_usuexport2 = NULL,'+
            '       od_idprofesional2 = NULL '+
            ' WHERE od_idjuicioentramite = (SELECT ej_idjuicioentramite FROM LEGALES.LEJ_EXPORTACIONJUICIOS WHERE ej_motivorechazo IS NOT NULL AND EJ_FECHARESOLUCION IS NULL AND EJ_ID= '+ SqlValue(SelectedList.Strings[i])+' )');
             EjecutarSql(
            'UPDATE legales.lod_origendemanda' +
            '   SET od_fechaexport = NULL ,'+
            '       od_usuexport = NULL,'+
            '       od_idprofesional = NULL '+
            ' WHERE od_idjuicioentramite = (SELECT ej_idjuicioentramite FROM LEGALES.LEJ_EXPORTACIONJUICIOS WHERE ej_motivorechazo IS NOT NULL AND EJ_FECHARESOLUCION IS NULL AND EJ_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

             EjecutarSql(
            'UPDATE legales.lpj_peritajejuicio' +
            '   SET pj_fechaexport = NULL ,'+
            '       pj_usuexport = NULL,'+
            '       pj_idprofesional = NULL '+
            ' WHERE PJ_IDJUICIOENTRAMITE = (SELECT ej_idjuicioentramite FROM LEGALES.LEJ_EXPORTACIONJUICIOS WHERE ej_motivorechazo IS NOT NULL AND EJ_FECHARESOLUCION IS NULL AND EJ_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

            EjecutarSql(
              'UPDATE LEGALES.LEP_EXPORTPROFESIONALES' +
              '   SET EP_FECHARESOLUCION = SYSDATE ,'+
              '       EP_USUARIORESOLUCION = '+SqlValue(Sesion.LoginName)+','+
              '       EP_OBSERVACIONRESOLUCION = '+SqlValue(edObservacion.Text)+','+
              '       EP_IDMOTIVORESOLUCION = '+SqlValue(fraMotivoResolucionSRT.Value)+
              ' WHERE ep_motivorechazo IS NOT NULL '+
              '   AND ep_idjuicioentramite = (SELECT ej_idjuicioentramite FROM LEGALES.LEJ_EXPORTACIONJUICIOS WHERE ej_motivorechazo IS NOT NULL AND EJ_FECHARESOLUCION IS NULL AND EJ_ID= '+ SqlValue(SelectedList.Strings[i])+' )');
        end
        else if sdqConsulta.FieldByName('Tipo Operación').AsString = 'M' then
        begin
          EjecutarSql(
          'UPDATE legales.ljt_juicioentramite' +
          '   SET jt_fechamodif = sysdate ,'+
          '       jt_usumodif = '+SqlValue(Sesion.LoginName)+
          ' WHERE JT_ID = (SELECT ej_idjuicioentramite FROM LEGALES.LEJ_EXPORTACIONJUICIOS WHERE ej_motivorechazo IS NOT NULL AND EJ_FECHARESOLUCION IS NULL AND EJ_ID= '+ SqlValue(SelectedList.Strings[i])+' )');
        end;
        EjecutarSql(
            'UPDATE LEGALES.LEJ_EXPORTACIONJUICIOS' +
            '   SET EJ_FECHARESOLUCION = SYSDATE ,'+
            '       EJ_USUARIORESOLUCION = '+SqlValue(Sesion.LoginName)+','+
            '       EJ_OBSERVACIONRESOLUCION = '+SqlValue(edObservacion.Text)+','+
            '       EJ_IDMOTIVORESOLUCION = '+SqlValue(fraMotivoResolucionSRT.Value)+
            ' WHERE EJ_ID = ' + SqlValue(SelectedList.Strings[i])+
            '   AND ej_motivorechazo IS NOT NULL '+
            '   AND EJ_FECHARESOLUCION IS NULL' );
      end;
    end
    else if fraTipoArchivoFiltro.Codigo = 'JP' then
    begin
      for i:=0 to SelectedList.Count-1 do
      begin
        if sdqConsulta.FieldByName('Tipo Operación').AsString = 'A' then
        begin
          if sdqConsulta.FieldByName('Tipo Profesional').AsString = 'A' then
          begin
            EjecutarSql(
            'UPDATE legales.lod_origendemanda' +
            '   SET od_fechaexport2 = NULL ,'+
            '       od_usuexport2 = NULL,'+
            '       od_idprofesional2 = NULL '+
            ' WHERE od_id = (SELECT ep_idtablamaestro FROM LEGALES.LEP_EXPORTPROFESIONALES WHERE ep_motivorechazo IS NOT NULL AND EP_FECHARESOLUCION IS NULL and EP_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

          end;
          if sdqConsulta.FieldByName('Tipo Profesional').AsString = 'M' then
          begin
            EjecutarSql(
            'UPDATE legales.lod_origendemanda' +
            '   SET od_fechaexport = NULL ,'+
            '       od_usuexport = NULL,'+
            '       od_idprofesional = NULL '+
            ' WHERE od_id = (SELECT ep_idtablamaestro FROM LEGALES.LEP_EXPORTPROFESIONALES WHERE ep_motivorechazo IS NOT NULL AND EP_FECHARESOLUCION IS NULL AND EP_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

          end;
          if sdqConsulta.FieldByName('Tipo Profesional').AsString = 'P' then
          begin
            EjecutarSql(
            'UPDATE legales.lpj_peritajejuicio' +
            '   SET pj_fechaexport = NULL ,'+
            '       pj_usuexport = NULL,'+
            '       pj_idprofesional = NULL '+
            ' WHERE pj_id = (SELECT ep_idtablamaestro FROM LEGALES.LEP_EXPORTPROFESIONALES WHERE ep_motivorechazo IS NOT NULL AND EP_FECHARESOLUCION IS NULL AND EP_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

          end;
        end
        else if sdqConsulta.FieldByName('Tipo Operación').AsString = 'M' then
        begin
          if sdqConsulta.FieldByName('Tipo Profesional').AsString = 'A' then
          begin
            EjecutarSql(
            'UPDATE legales.lod_origendemanda' +
            '   SET od_fechamodif = sysdate ,'+
            '       od_usumodif = '+SqlValue(Sesion.LoginName)+
            ' WHERE od_id = (SELECT ep_idtablamaestro FROM LEGALES.LEP_EXPORTPROFESIONALES WHERE ep_motivorechazo IS NOT NULL AND EP_FECHARESOLUCION IS NULL AND EP_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

          end;
          if sdqConsulta.FieldByName('Tipo Profesional').AsString = 'M' then
          begin
            EjecutarSql(
            'UPDATE legales.lod_origendemanda' +
            '   SET od_fechamodif = sysdate ,'+
            '       od_usumodif = '+SqlValue(Sesion.LoginName)+
            ' WHERE od_id = (SELECT ep_idtablamaestro FROM LEGALES.LEP_EXPORTPROFESIONALES WHERE ep_motivorechazo IS NOT NULL AND EP_FECHARESOLUCION IS NULL AND EP_ID= '+ SqlValue(SelectedList.Strings[i])+' )');

          end;
          if sdqConsulta.FieldByName('Tipo Profesional').AsString = 'P' then
          begin
            EjecutarSql(
            'UPDATE legales.lpj_peritajejuicio' +
            '   SET pj_fechamodif = sysdate,'+
            '       pj_usumodif = '+SqlValue(Sesion.LoginName)+
            ' WHERE pj_id = (SELECT ep_idtablamaestro FROM LEGALES.LEP_EXPORTPROFESIONALES WHERE ep_motivorechazo IS NOT NULL AND EP_FECHARESOLUCION IS NULL AND EP_ID= '+ SqlValue(SelectedList.Strings[i])+' )');
          end;
        end;
        EjecutarSql(
              'UPDATE LEGALES.LEP_EXPORTPROFESIONALES' +
              '   SET EP_FECHARESOLUCION = SYSDATE ,'+
              '       EP_USUARIORESOLUCION = '+SqlValue(Sesion.LoginName)+','+
              '       EP_OBSERVACIONRESOLUCION = '+SqlValue(edObservacion.Text)+','+
              '       EP_IDMOTIVORESOLUCION = '+SqlValue(fraMotivoResolucionSRT.Value)+
              ' WHERE ep_motivorechazo IS NOT NULL '+
              '   AND EP_FECHARESOLUCION IS NULL '+
              '   AND EP_ID = ' + SqlValue(SelectedList.Strings[i]));
      end;
    end;
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al aplicar resolución');
    end;
  end;
  SelectedList.Clear;
  pnMarcarComoResuelto.ModalResult := mrOk;
  tbRefrescarClick(nil);
end;

procedure TfrmProcesoArchivoLegales.GridDblClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    with TfrmAdminstracionJuicioParteDemandanda.Create(Self) do
    try
      sdqModificacionRegistro.ParamByName('jt_id').AsInteger := sdqConsulta.FieldByName('ID Juicio').AsInteger;
      try
        sdqModificacionRegistro.Open;
        Modificacion(sdqModificacionRegistro);
        except
        on E : ESDEngineError do
        begin
          if E.NativeError = 54 then
          begin
            Rollback(true);
            MessageDlg('El registro está siendo utilizado por el usuario ' + GetInfoBloqueo(sdqConsulta.FieldByName('ID Juicio').AsInteger, 'J') + '.' + #13#10 + 'Por esa razón no podrá guardar ningún cambio.', mtWarning, [mbOK], 0);
            sdqConsultaRegistro.ParamByName('jt_id').AsInteger := sdqConsulta.FieldByName('ID Juicio').AsInteger;
            sdqConsultaRegistro.Open;
            ConsultarJuicio(sdqConsultaRegistro);
          end;
        end;
      end;
    finally
      sdqModificacionRegistro.Close;
      sdqConsultaRegistro.Close;
      sdqConsulta.Refresh;
      Free;
    end;
  end;
end;

procedure TfrmProcesoArchivoLegales.FSFormDestroy(Sender: TObject);
begin
  inherited;
  SelectedList.Free;
end;

procedure TfrmProcesoArchivoLegales.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = '¿?') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('ID').AsString) = -1 then
    begin
      SelectedList.AddObject(sdqConsulta.FieldByName('ID').AsString, sdqConsulta.GetBookmark);
    end
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('ID').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmProcesoArchivoLegales.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = '¿?' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('ID').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmProcesoArchivoLegales.tbSeleccionarTodosClick(
  Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('ID').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    Grid.Refresh;
  end;
end;

procedure TfrmProcesoArchivoLegales.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['¿?']);
end;

procedure TfrmProcesoArchivoLegales.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (fraTipoArchivoFiltro.Value = 1) and(sdqConsulta.FieldByName('ej_idmotivorechazoint').AsString <> '' )then
    Background := clMoneyGreen;
end;

end.
