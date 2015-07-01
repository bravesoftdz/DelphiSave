unit unConsultaSolicitud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Mask, CheckCombo, ToolEdit, DateComboBox, StdCtrls,
  DBCheckCombo, unArtFrame, unFraCodigoDescripcion, unfraVendedores, unFraEntidades, unAfiGeneracionCartas, RXSpin,
  unArtDbFrame, unFraEmpresa, unFraEmpresaAfi, unFraEmpresaSolicitud, PatternEdit, CardinalEdit, ComboEditor, FormPanel,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraCanal, Menus, unfraUsuarios, unFraUsuario, rtflabel,
  unFraCodDesc, RxToolEdit, RxPlacemnt;

type
  TfrmConsultaSolicitud = class(TfrmCustomConsulta)
    ToolButton1: TToolButton;
    tbSolicitud: TToolButton;
    tbEstablecimiento: TToolButton;
    tbNomina: TToolButton;
    tbCuadroTarifa: TToolButton;
    tbEstado: TToolButton;
    tbAprobar: TToolButton;
    tbNoAprobar: TToolButton;
    lbEstado: TLabel;
    lbCUIT: TLabel;
    lbMotivoAlta: TLabel;
    lbOrigen: TLabel;
    lbActividad: TLabel;
    lbEntidad: TLabel;
    lbObligatorios: TLabel;
    edSA_ESTADO: TDBCheckCombo;
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    sdqMotivoAlta: TSDQuery;
    dsMotivoAlta: TDataSource;
    dsOrigen: TDataSource;
    sdqOrigen: TSDQuery;
    edOBLIGATORIOS: TDBCheckCombo;
    sdqObligatorio: TSDQuery;
    dsObligatorio: TDataSource;
    fraEntidad: TfraEntidades;
    tbRechazar: TToolButton;
    tbSRT: TToolButton;
    tblSALIR: TToolButton;
    ToolButton2: TToolButton;
    edSA_MOTIVOALTA: TDBCheckCombo;
    edSA_ORIGEN: TDBCheckCombo;
    tbCartas: TToolButton;
    tbRespuestaCliente: TToolButton;
    ToolButton10: TToolButton;
    GroupBox1: TGroupBox;
    edSA_FECHAALTA_DESDE: TDateComboBox;
    Label2: TLabel;
    edSA_FECHAALTA_HASTA: TDateComboBox;
    Empleados: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edEmpEmpresa: TEdit;
    edEmpEstablecimiento: TEdit;
    edEmpNomina: TEdit;
    fraVendedor: TfraVendedores;
    cmbSA_ACTIVIDAD: TComboBox;
    cmbSA_ACTIVIDAD_RESUMEN: TCheckCombo;
    GroupBox2: TGroupBox;
    edSA_FECHAAFILIACION_DESDE: TDateComboBox;
    Label1: TLabel;
    edSA_FECHAAFILIACION_HASTA: TDateComboBox;
    fraEmpresa: TfraEmpresaSolicitud;
    Label7: TLabel;
    edSA_NROINTERNO: TCardinalEdit;
    frmEstado: TFormPanel;
    Bevel1: TBevel;
    btnAceptar: TButton;
    cmbEstado: TComboBox;
    Label8: TLabel;
    fraCanal: TfraCanal;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    dcbFechaRecepAfiDesde: TDateComboBox;
    dcbFechaRecepAfiHasta: TDateComboBox;
    Label11: TLabel;
    edTotal: TCardinalEdit;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    tbCalcularTotal: TToolButton;
    Label12: TLabel;
    edSeleccion: TCardinalEdit;
    lbUsuarioRecepcionAfi: TLabel;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    edVigenciaDesde: TDateComboBox;
    edVigenciaDesde2: TDateComboBox;
    fraEjecutivoEnt: TfraStaticCodigoDescripcion;
    lbVendedor: TLabel;
    lbEjecutivoEnt: TLabel;
    Label13: TLabel;
    fraUsuarioRevision: TfraUsuarios;
    Label14: TLabel;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    edSA_FECHAREVISION_DESDE: TDateComboBox;
    edSA_FECHAREVISION_HASTA: TDateComboBox;
    GroupBox6: TGroupBox;
    cboxRevision: TComboBox;
    tbReferencias: TToolButton;
    pnlRef: TPanel;
    pnlRojo: TPanel;
    Shape1: TShape;
    Panel2: TPanel;
    Shape2: TShape;
    Panel3: TPanel;
    Shape3: TShape;
    Panel5: TPanel;
    Shape5: TShape;
    Panel6: TPanel;
    Shape6: TShape;
    ToolButton12: TToolButton;
    edDocFaltante: TCheckCombo;
    GroupBox7: TGroupBox;
    cboxExpress: TComboBox;
    tbEmailAutorizacion: TToolButton;
    fraUsuarioFiltro: TfraUsuario;
    fraOrganizador: TfraCodDesc;
    Label16: TLabel;
    fraUsuarioAsignadoCarga: TfraUsuarios;
    Label17: TLabel;
    GroupBox8: TGroupBox;
    cboxFiltroPCP: TComboBox;
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbCuadroTarifaClick(Sender: TObject);
    procedure tbEstadoClick(Sender: TObject);
    procedure tbSolicitudClick(Sender: TObject);
    procedure tbEstablecimientoClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbNominaClick(Sender: TObject);
    procedure tbNoAprobarClick(Sender: TObject);
    procedure tbSRTClick(Sender: TObject);
    procedure tbRechazarClick(Sender: TObject);
    procedure tblSALIRClick(Sender: TObject);
    procedure cmbSA_ACTIVIDAD_RESUMENCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure tbCartasClick(Sender: TObject);
    procedure tbRespuestaClienteClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fraVendedorcmbDescripcionDropDown(Sender: TObject);
    procedure cmbSA_ACTIVIDADDropDown(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraEntidadcmbDescripcionDropDown(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure tbReferenciasClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbEmailAutorizacionClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
  private
    function isMismoEstado: Boolean;
    function SetObligatorio: String;
    function ExistenEmailsAsociados(const aId: Integer; const aTipoRegistro: String): boolean;

    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure CalcularFilas;
    procedure CargaActividad;
    procedure CargaActividadResumen;
    procedure CargarEstado;
    procedure DoAprobarNoAprobarRechazar(aAccion: TAccion);
    
  public
  end;

var
  frmConsultaSolicitud: TfrmConsultaSolicitud;

implementation

uses
  General, AnsiSQL, SqlFuncs, unCuadroTarifario, unCambioEstado, unCargaSolicitud, unCargaEstablecimiento, unDmPrincipal,
  Numeros, CustomDlgs, unCargaTrabajador, unCargaSRT, StrFuncs, unFrmConsultaCarta, unRespuestaCliente, unArt, CUIT,
  unComunes, unPrincipal, unFiltros, unElementosEnviados, unRTTI;

{$R *.DFM}

procedure TfrmConsultaSolicitud.tbSalirClick(Sender: TObject);
begin
  inherited;

  Close;
end;

procedure TfrmConsultaSolicitud.tbRefrescarClick(Sender: TObject);
var
  iLoop: Integer;
  sDocFaltante: String;
  sSql: String;
  sWhere: String;
begin
  // Armo el string para filtrar por documentacion faltante
  for iLoop := 0 to edDocFaltante.Items.Count - 1 do
   if edDocFaltante.Checked[iLoop] then
     sDocFaltante := sDocFaltante + '%' + edDocFaltante.Items.Strings[iLoop];
  
  if sDocFaltante <> '' then
    sDocFaltante := sDocFaltante + '%';

  sWhere := '';  
  sSql :=
    'SELECT t1.tb_descripcion origen, sa_nrointerno, sa_cuit, fo_formulario, sa_nombre,' +
          ' sa_estado || ''-'' || t2.tb_descripcion estado, sa_fechaafiliacion, sa_fechaalta,' +
          ' t3.tb_descripcion motivoalta, sa_idactividad, sa_totempleados, sa_masatotal,' +
          ' afiliacion.get_camposfaltantes(sa_id) faltan, sa_id, sa_estado, sa_idformulario, t2.tb_especial1,' +
          ' sa_totempleados empresa, art.afiliacion.get_empleados_establecimiento(sa_id) establecimiento,' +
          ' art.afiliacion.get_empleados_nomina(sa_cuit) nomina, en_codbanco, en_nombre, ve_vendedor, ve_nombre,' +
          ' ca_codigo, ca_descripcion, sa_fecharecepcionsectorafi, sa_hojaslegajos,' +
          ' DECODE(sa_presentorgrl, ''T'', ''SI'', ''NO'') fgrl, sa_motivoalta,' +
          ' DECODE(INSTR(NVL(sa_dnifirmado, '' ''), ''T''), 0, DECODE(INSTR(NVL(sa_dnifirmado, '' ''), ''V''), 0, ''NO'', ''V''), DECODE(INSTR(NVL(sa_dnifirmado, '' ''), ''V''), 0, ''A'', ''C'')) dnipoder,' +
          ' CASE ' +
            ' WHEN(sa_sexo_titular = ''M'') THEN ''Masculino''' +
            ' WHEN(sa_sexo_titular = ''F'') THEN ''Femenino''' +
          ' END sexo, sa_titular, sa_telefono_titular, sa_direlectronica_titular, ' +
          ' sa_fechabaja, sa_usubaja, sa_fechavigenciadesde, sa_fechavigenciahasta, sa_usurecepcionsectorafi, ec_nombre,' +
          ' art.afiliacion.falta_doc_solicitud(sa_id) faltarenglon, sa_usurevision, sa_fecharevision,' +
          ' DECODE(sa_recepcionexpress,''S'', ''Sí'', ''No'') express, '+
          ' DECODE((SELECT 1 FROM agenda.aat_agendatarea WHERE at_idtipoevento = 354 AND at_idformulario = sa_idformulario AND rownum < 2), 1, ''Sí'', ''No'') tareaSic, ' +
          ' sa_usuarioasignadocarga, ' +
          ' (SELECT express.ae_usuario '+
          '    FROM afi.aae_audit_recepcion_express express ' +
            ' WHERE express.ae_id = (SELECT MIN(m_express.ae_id)' +
                                  ' FROM afi.aae_audit_recepcion_express m_express' +
                                  ' JOIN ART.use_usuarios on se_usuario = ae_usuario AND SE_SECTOR IN (''AFI'',''AFINOM'',''ACTCLI'')' +
                                  ' WHERE m_express.ae_idformulario = sa_idformulario)) AS usuario_express_afi,' +
          ' (SELECT express.ae_usuario' +
              ' FROM afi.aae_audit_recepcion_express express' +
             ' WHERE express.ae_id = (SELECT MIN(m_express.ae_id)' +
                                      ' FROM afi.aae_audit_recepcion_express m_express' +
                                     ' WHERE m_express.ae_idformulario = sa_idformulario)) as usuario_express, observacion_express,' +
          ' (SELECT ar_comentario' +
               ' FROM afi.aar_archivosrecepcion ' +
              ' WHERE ar_idsolicitudafiliacion = sa_id' +
               ' AND ar_razonadjunto = ''Cambio Estado''' +
               ' AND rownum < 2) AS ar_comentario, ' +
          ' (SELECT ''Sí''' +
               ' FROM afi.aar_archivosrecepcion ' +
              ' WHERE ar_idsolicitudafiliacion = sa_id' +
               ' AND ar_razonadjunto = ''Cambio Estado''' +
               ' AND rownum < 2) AS cambioestado, ' +
          ' (SELECT     en_nombre' +
          '     FROM xgo_granorganizador, xen_entidad' +
          '    WHERE go_identorganizador = en_id' +
          '      AND go_fechabaja IS NULL' +
          '      AND go_fechaaprobado IS NOT NULL' +
          '      AND LEVEL = 1' +
          '    START WITH go_identidad = ev_identidad' +
          '    CONNECT BY NOCYCLE PRIOR go_identorganizador = go_identidad) organizador,' +
          ' DECODE(sa_solicitud_pcp,''S'', ''Sí'', ''No'') Espcp ' +
     ' FROM xev_entidadvendedor, ctb_tablas t1, ctb_tablas t2, aca_canal, xen_entidad, xve_vendedor, ctb_tablas t3,' +
          ' afo_formulario, asa_solicitudafiliacion, cac_actividad, aec_ejecutivocuenta' +
    ' WHERE ev_id(+) = sa_identidadvendedor' +
      ' AND t1.tb_clave = ''ORSOL''' +
      ' AND t1.tb_codigo = sa_origen' +
      ' AND fo_id = sa_idformulario' +
      ' AND t2.tb_clave = ''ESSOL''' +
      ' AND t2.tb_codigo = sa_estado' +
      ' AND t3.tb_clave(+) = ''MOTIA''' +
      ' AND t3.tb_codigo(+) = sa_motivoalta' +
      ' AND sa_idactividad(+) = ac_id' +
      ' AND ev_identidad = en_id(+)' +
     // ' AND NVL(en_entramite, ''N'') = ''N''' +
      ' AND ev_idvendedor = ve_id(+)' +
      ' AND en_idcanal = ca_id(+)' +
      ' AND en_idejecutivo = ec_id(+)';
                                    //Modificar el ExportDialog si se agrega un campo nuevo.
                                                             //Porque lo usan
  if edSA_NROINTERNO.Value <> 0 then
    sWhere := sWhere + ' AND sa_nrointerno = ' + SqlInt(edSA_NROINTERNO.Value);

  if fraEmpresa.IsSelected then
    sWhere := sWhere + ' AND fo_id = ' + SqlValue(fraEmpresa.Value);

  if edSA_ESTADO.Text <> '' then
    sWhere := sWhere + ' AND sa_estado ' + edSA_ESTADO.InSql;

  if sDocFaltante <> '' then
    sWhere := sWhere + ' AND art.afiliacion.falta_doc_solicitud(sa_id) LIKE ''' + sDocFaltante + '''';

  if not fraUsuarioRevision.IsEmpty then
    sWhere := sWhere + ' AND sa_usurevision = ' + SqlValue(fraUsuarioRevision.Codigo);

  if not fraUsuarioAsignadoCarga.IsEmpty then
    sWhere := sWhere + ' AND sa_usuarioasignadocarga = ' + SqlValue(fraUsuarioAsignadoCarga.Codigo);

  if not edSA_FECHAREVISION_DESDE.IsEmpty then
  begin
    if not edSA_FECHAREVISION_HASTA.IsEmpty then
    begin
      sWhere := sWhere + ' AND sa_fecharevision >= ' + SqlDate(edSA_FECHAREVISION_DESDE.Date);
      sWhere := sWhere + ' AND sa_fecharevision <= ' + SqlDate(edSA_FECHAREVISION_HASTA.Date);
    end
    else
      sWhere := sWhere + ' AND sa_fecharevision >= ' + SqlDate(edSA_FECHAREVISION_DESDE.Date);
  end
  else
    if not edSA_FECHAREVISION_HASTA.IsEmpty then
      sWhere := sWhere + ' AND sa_fecharevision <= ' + SqlDate(edSA_FECHAREVISION_HASTA.Date);


  if (cboxRevision.ItemIndex <> -1) and (cboxRevision.ItemIndex <> 2) then
    if cboxRevision.ItemIndex = 0 then //Si
      sWhere := sWhere + ' AND sa_usurevision IS NOT NULL'
    else                               //NO
      sWhere := sWhere + ' AND sa_usurevision IS NULL';

  if (cboxExpress.ItemIndex <> -1) and (cboxExpress.ItemIndex <> 2) then
    if cboxExpress.ItemIndex = 0 then //Si
      sWhere := sWhere + ' AND sa_recepcionexpress = ''S'''
    else                               //NO
      sWhere := sWhere + ' AND sa_recepcionexpress <> ''S''';

  if not edSA_FECHAAFILIACION_DESDE.IsEmpty then
  begin
    if not edSA_FECHAAFILIACION_HASTA.IsEmpty then
    begin
      sWhere := sWhere + ' AND sa_fechaafiliacion >= ' + SqlDate(edSA_FECHAAFILIACION_DESDE.Date);
      sWhere := sWhere + ' AND sa_fechaafiliacion <= ' + SqlDate(edSA_FECHAAFILIACION_HASTA.Date);
    end
    else
      sWhere := sWhere + ' AND sa_fechaafiliacion >= ' + SqlDate(edSA_FECHAAFILIACION_DESDE.Date);
  end
  else
    if not edSA_FECHAAFILIACION_HASTA.IsEmpty then
      sWhere := sWhere + ' AND sa_fechaafiliacion <= ' + SqlDate(edSA_FECHAAFILIACION_HASTA.Date);

  if not edVigenciaDesde.IsEmpty then
  begin
    if not edVigenciaDesde2.IsEmpty then
    begin
      sWhere := sWhere + ' AND sa_fechavigenciadesde >= ' + SqlDate(edVigenciaDesde.Date);
      sWhere := sWhere + ' AND sa_fechavigenciadesde <= ' + SqlDate(edVigenciaDesde2.Date);
    end
    else
      sWhere := sWhere + ' AND sa_fechavigenciadesde >= ' + SqlDate(edVigenciaDesde.Date);
  end
  else
    if not edVigenciaDesde2.IsEmpty then
      sWhere := sWhere + ' AND sa_fechavigenciadesde <= ' + SqlDate(edVigenciaDesde2.Date);

  if not edSA_FECHAALTA_DESDE.IsEmpty then
  begin
    if not edSA_FECHAALTA_HASTA.IsEmpty then
      sWhere := sWhere + ' AND TRUNC(sa_fechaalta) BETWEEN ' + SqlDate(edSA_FECHAALTA_DESDE.Date) + ' AND ' + SqlDate(edSA_FECHAALTA_HASTA.Date)
    else
      sWhere := sWhere + ' AND sa_fechaalta >= ' + SqlDate(edSA_FECHAALTA_DESDE.Date);
  end
  else
    if not edSA_FECHAALTA_HASTA.IsEmpty then
      sWhere := sWhere + ' AND TRUNC(sa_fechaalta) <= ' + SqlDate(edSA_FECHAALTA_HASTA.Date);

  if not dcbFechaRecepAfiDesde.IsEmpty then
  begin
    if not dcbFechaRecepAfiHasta.IsEmpty then
      sWhere := sWhere + ' AND TRUNC(sa_fecharecepcionsectorafi) BETWEEN ' + SqlDate(dcbFechaRecepAfiDesde.Date) + ' AND ' + SqlDate(dcbFechaRecepAfiHasta.Date)
    else
      sWhere := sWhere + ' AND sa_fecharecepcionsectorafi >= ' + SqlDate(dcbFechaRecepAfiDesde.Date);
  end
  else
    if not dcbFechaRecepAfiHasta.IsEmpty then
      sWhere := sWhere + ' AND sa_fecharecepcionsectorafi <= ' + SqlDate(dcbFechaRecepAfiHasta.Date);

  if edSA_MOTIVOALTA.Text <> '' then
    sWhere := sWhere + ' AND sa_motivoalta ' + edSA_MOTIVOALTA.InSql;

  if edSA_ORIGEN.Text <> '' then
    sWhere := sWhere + ' AND sa_origen ' + edSA_ORIGEN.InSql;
                                
  if cmbSA_ACTIVIDAD_RESUMEN.Text <> '' then
  begin
    sWhere := sWhere + ' AND (';
    for iLoop := 0 to  cmbSA_ACTIVIDAD_RESUMEN.Items.Count - 1 do
      if cmbSA_ACTIVIDAD_RESUMEN.Checked[iLoop] then
        sWhere := sWhere + ' (SUBSTR(ac_relacion, 1, 1) = ' + (cmbSA_ACTIVIDAD_RESUMEN.Items.Objects[iLoop] as TCadena).Cadena + ') OR';
    sWhere := Copy(sWhere, 0, Length(sWhere) - 2);
    sWhere := sWhere + ')';
  end;

  if cmbSA_ACTIVIDAD.Text <> '' then
    sWhere := sWhere + ' AND ac_relacion = ' + (cmbSA_ACTIVIDAD.Items.Objects[cmbSA_ACTIVIDAD.itemIndex] as TCadena).Cadena;

  sWhere := sWhere + DoFiltroComponente(fraCanal, 'CA_ID')
                   + DoFiltroComponente(fraEntidad, 'EN_ID')
                   + DoFiltroComponente(fraVendedor, 'VE_ID');

  if edOBLIGATORIOS.Text <> '' then
    sWhere := sWhere + ' AND ' + SetObligatorio;

  if not fraUsuarioFiltro.IsEmpty then
    sWhere := sWhere + ' AND sa_usurecepcionsectorafi = ' + SqlValue(fraUsuarioFiltro.UserID);

  if not fraEjecutivoEnt.IsEmpty then
    sWhere := sWhere + ' AND ec_id = ' + SqlValue(fraEjecutivoEnt.Codigo);

  if not fraOrganizador.IsEmpty then
    sWhere := sWhere + ' AND ev_identidad IN ( SELECT go_identidad' +
                                              ' FROM xgo_granorganizador' +
                                             ' WHERE go_fechabaja IS NULL' +
                                               ' AND go_fechaaprobado IS NOT NULL' +
                                               ' AND LEVEL = 1' +
                                        ' START WITH go_identorganizador = ' + SqlValue(fraOrganizador.Value) +
                                  ' CONNECT BY NOCYCLE PRIOR go_identidad = go_identorganizador)';

  case cboxFiltroPCP.ItemIndex of
    1: sWhere := sWHere + ' AND sa_solicitud_pcp = ''S'' ';
    2: sWhere := sWhere + ' AND sa_solicitud_pcp = ''N'' ';
  end;


  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  CalcularFilas;

  if sdqConsulta.IsEmpty then
    InfoHint(nil, 'No existen datos para esta selección.');
end;

procedure TfrmConsultaSolicitud.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  edSA_NROINTERNO.Clear;
  edSA_ESTADO.Clear;
  edDocFaltante.Clear;
  fraUsuarioRevision.Clear;
  edSA_FECHAREVISION_DESDE.Clear;
  edSA_FECHAREVISION_HASTA.Clear;
  cboxRevision.ItemIndex := -1;
  cboxExpress.ItemIndex := -1;
  edSA_FECHAAFILIACION_DESDE.Clear;
  edSA_FECHAAFILIACION_HASTA.Clear;
  edVigenciaDesde.Clear;
  edVigenciaDesde2.Clear;
  edSA_FECHAALTA_DESDE.Clear;
  edSA_FECHAALTA_HASTA.Clear;
  edSA_MOTIVOALTA.Clear;
  cmbSA_ACTIVIDAD_RESUMEN.Clear;
  cmbSA_ACTIVIDAD.Clear;
  fraCanal.Clear;
  fraEntidad.Canal := ART_EMPTY_ID;
  fraEntidad.Clear;
  fraVendedor.Entidad := ART_EMPTY_ID;
  fraVendedor.Clear;
  edSA_ORIGEN.Clear;
  edOBLIGATORIOS.Clear;
  edEmpEmpresa.Clear;
  edEmpEstablecimiento.Clear;
  edEmpNomina.Clear;
  dcbFechaRecepAfiDesde.Clear;
  dcbFechaRecepAfiHasta.Clear;
  fraOrganizador.Clear;
  fraUsuarioAsignadoCarga.Clear;
  cboxFiltroPCP.ItemIndex := -1;
  inherited;
end;

procedure TfrmConsultaSolicitud.FormCreate(Sender: TObject);
var
  i: integer;
  Value: TObject;
begin
  inherited;
 // CoolBar.Height := 30;
 // pnlRef.Visible := False;

  fraEntidad.CaseSensitive := False;
 // fraEntidad.ExtraCondition := ' AND en_entramite = ''N'' ';
  fraVendedor.CaseSensitive := False;
  OpenQuery(sdqEstado);
  OpenQuery(sdqMotivoAlta);
  OpenQuery(sdqOrigen);
  OpenQuery(sdqObligatorio);
  CargaActividadResumen;

  //No tengo que mostrar los contratos
  fraEmpresa.IncluirContratos := False;
  //fraEmpresa.ShowBajas := True;

  with fraEjecutivoEnt do
  begin
    TableName      := 'aec_ejecutivocuenta';
    FieldID        := 'ec_id';
    FieldCodigo    := 'ec_id';
    FieldDesc      := 'ec_nombre';
    FieldBaja      := 'ec_fechabaja';
    ShowBajas      := False;
  end;

  {fraUsuarioAsignadoCarga.ExtraCondition := 'AND se_usuario IN (SELECT sr_usuario ' +
                                                           '  FROM afi.usr_usurecepcion' +
                                                           ' WHERE 1 = 1)';  //Segun pedido solo deben aparecer los de la tabla
       }                                                                     // usr_usurecepcion
  fraUsuarioAsignadoCarga.ExtraCondition := 'AND se_usuario IN (''AGONZALEZ'', ''LMAZZEI'', ''FPELLEGRINI'', ''FPINAR'', ''ELSILVA'', ''RBURGOS'')';
  fraUsuarioAsignadoCarga.ShowBajas := False;  //Cambiado segun ticket 62035

  fraUsuarioRevision.ExtraCondition := 'AND se_usuario IN (SELECT se_usuario ' +
                                                                '   FROM use_usuarios ' +
                                                                '  WHERE se_sector IN (''AFI'', ''ATCLI'', ''AFINOM'') ' +
                                                                '  AND se_fechabaja IS NULL) ';
  fraUsuarioRevision.ShowBajas := False;

  for i := 0 to ComponentCount - 1 do
  begin
    if ExistsProperty(Components[i], 'DataSource') then
    begin
      GetPropByName(Components[i], 'DataSource', Value);

      if (not Components[i].InheritsFrom(TFrame)) and not ExistsProperty(Components[i], 'LookupSource') and (Components[i].ClassName <> 'TSDQuery') and not Assigned(Value) then
        try
          raise Exception.Create('Al componente ' + Components[i].Name + ' le falta asignar la propiedad DataSource.');
        except
        end;
    end;
  end;
end;

function TfrmConsultaSolicitud.SetObligatorio: String;
var
  aSDQuery: TSDQuery;
  sSql: String;
begin
  Result := '';
  
  aSDQuery := TSDQuery.Create(Self);
  with aSDQuery do
  try
    DatabaseName := 'dbPrincipal';

    sSql :=
      'SELECT tb_especial1' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''OBLIG''' +
        ' AND tb_codigo = ' + edOBLIGATORIOS.InSql;
    OpenQuery(aSDQuery, sSql, True);

    while not Eof do
    begin
      if Length(Result) = 0 then
        Result := Result + '( ' + FieldByName('tb_especial1').AsString
      else if FieldByName('tb_especial1').AsString <> '' then
        Result := Result + ' OR ' + FieldByName('tb_especial1').AsString;

      Next;
    end;
    Result := Result +' )';
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.tbCuadroTarifaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  with TfrmCuadroTarifario.Create(Self) do
  try
    DoCargaIDSolicitud(sdqConsulta.FieldByName('sa_id').AsInteger, Copy(sdqConsulta.FieldByName('tb_especial1').AsString, 4, 1) = 'S');
    if ShowModal = mrOk then
      tbRefrescar.Click;
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.tbEstadoClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  // Controla es Estado para su cambio.
  if Copy(sdqConsulta.FieldByName('tb_especial1' ).asString, 5, 1) <> 'S' then
  begin
    MsgBox('El estado de la solicitud no es el apropiado para realizar dicha operación.', MB_ICONSTOP);
    Exit;
  end;

  with TfrmCambioEstado.Create(Self) do
  try
    DoCargaIDSolicitud(sdqConsulta.FieldByName('sa_id').asInteger, sdqConsulta.FieldByName('sa_estado').AsString);
    Visible := False;
    if ShowModal = mrOk then
      tbRefrescar.Click;
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.tbSolicitudClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  FreeAndNil(frmCargaSolicitudes);
  frmCargaSolicitudes := TfrmCargaSolicitudes.Create(frmPrincipal);
  frmCargaSolicitudes.Mostrar(False);
  frmCargaSolicitudes.DoCargaDatosSolicitud(sdqConsulta.FieldByName('sa_id').AsInteger);
end;

procedure TfrmConsultaSolicitud.tbEstablecimientoClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  if frmCargaEstablecimiento = nil then
    frmCargaEstablecimiento := TfrmCargaEstablecimiento.Create(frmPrincipal);
  frmCargaEstablecimiento.Show;

  frmCargaEstablecimiento.DoCargaIDSolicitud(sdqConsulta.FieldByName('sa_id').AsInteger);
end;

procedure TfrmConsultaSolicitud.tbAprobarClick(Sender: TObject);
begin
  if (sdqConsulta.IsEmpty) or (Grid.SelectedRows.Count = 0) then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  // Control del estado para ser Aprobado.
  if Copy(sdqConsulta.FieldByName('tb_especial1').AsString, 2, 1) <> 'S' then
  begin
    MsgBox('El estado de la solicitud no es el apropiado para realizar dicha operación.', MB_ICONSTOP);
    Exit;
  end;

  DoAprobarNoAprobarRechazar(taSolicitudesAceptar);
  tbRefrescar.Click;
end;

procedure TfrmConsultaSolicitud.tbNominaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  try
    frmCargaTrabajador.Show
  except
    frmCargaTrabajador := TfrmCargaTrabajador.Create(frmPrincipal);
  end;

  frmCargaTrabajador.DoCargaIDSolicitud(sdqConsulta.FieldByName('sa_id').AsInteger);
end;

procedure TfrmConsultaSolicitud.tbSRTClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  frmCargaSRT.Free;
  frmCargaSRT := TfrmCargaSRT.Create(frmPrincipal);
  frmCargaSRT.DoCargaIDSolicitud(sdqConsulta.FieldByName('sa_id').AsInteger);
end;

procedure TfrmConsultaSolicitud.tbNoAprobarClick(Sender: TObject);
begin
  if (sdqConsulta.IsEmpty) or (Grid.SelectedRows.Count = 0) then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  // Control del Estado.
  if Copy(sdqConsulta.FieldByName('tb_especial1').AsString, 6, 1) <> 'S' then
  begin
    MsgBox('El estado de la solicitud no es el apropiado para realizar dicha operación.', MB_ICONSTOP);
    Exit;
  end;

  DoAprobarNoAprobarRechazar(taSolicitudesNoAceptar);
  tbRefrescar.Click;
end;

procedure TfrmConsultaSolicitud.DoAprobarNoAprobarRechazar(aAccion: TAccion);
var
  aIdsFormulario: Array of Integer;
  bGeneraCarta: Boolean;
  iLoop: Integer;
  sEstadoNew: String;
  sEstadoOld: String;
  sSql: String;
begin
  if not isMismoEstado then
  begin
    MsgBox('Los registros poseen distintos estados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  sEstadoOld   := sdqConsulta.FieldByName('sa_estado').AsString;
  bGeneraCarta := False;

  if aAccion = taSolicitudesAceptar then
  begin
    if (sEstadoOld = '2.1') or (sEstadoOld = '2.5') then
    begin
      if MsgBox('¿ Realmente desea confirmar ?', MB_ICONEXCLAMATION + MB_YESNO, 'Atención') = ID_NO then
        Abort;

      sEstadoNew := '3.1';
      bGeneraCarta := False;
    end
    else if (sEstadoOld = '2.2') or (sEstadoOld = '2.3') or (sEstadoOld = '2.4') then
    begin
      if MsgBox('¿ Realmente desea confirmar ?', MB_ICONEXCLAMATION + MB_YESNO, 'Atención') = ID_NO then
        Abort;

      if MsgBox('¿ Desea enviar una carta al cliente ?', MB_ICONEXCLAMATION + MB_YESNO, 'Atención') = ID_YES then
      begin
        sEstadoNew := '4.1';
        bGeneraCarta := True;
      end
      else
      begin
        sEstadoNew := '3.1';
        bGeneraCarta := False;
      end;
    end
    else if sEstadoOld = '2.6' then
    begin
      if MsgBox('¿ Realmente desea confirmar ?', MB_ICONEXCLAMATION + MB_YESNO, 'Atención') = ID_NO then
        Abort;

      sEstadoNew := '4.2';
      bGeneraCarta := True;
    end;

    //Chequeo que la solicitud no se encuentre en traspaso ingreso
    //Si se encuentra entonces el estado debe pasar a 7.0 = Traspaso en tramite
    if sEstadoNew = '3.1' then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM ati_traspasoingreso' +
        ' WHERE ti_idformulario = :idformulario' +
          ' AND ti_fechabaja IS NULL';
      if ExisteSqlEx(sSql, [sdqConsulta.FieldByName('sa_idformulario').AsString]) then
        sEStadoNew := '7.0';
    end;
  end
  else if aAccion = taSolicitudesNoAceptar then
  begin
    if MsgBox('¿ Realmente no quiere confirmar ?', MB_ICONEXCLAMATION + MB_YESNO, 'Atención') = ID_YES then
    begin
      sEstadoNew := '1.1';
      bGeneraCarta := False;
    end
    else
      Abort;
  end
  else if aAccion = taSolicitudesRechazar then
  begin
    if MsgBox('¿ Realmente desea rechazar la solicitud ?', MB_ICONEXCLAMATION + MB_YESNO, 'Atención') = ID_YES then
    begin
      CargarEstado;
      frmEstado.ShowModal;

      sSql :=
        'SELECT tb_codigo' +
         ' FROM ctb_tablas' +
        ' WHERE tb_clave = ''ESSOL''' +
          ' AND tb_descripcion = :descripcion';
      sEstadoNew := ValorSqlEx(sSql, [cmbEstado.Text]);
      bGeneraCarta := True;
    end
    else
      Abort;
  end;

  BeginTrans;
  try
    if (Grid.SelectedRows.Count > 0) and (sEstadoNew <> sEstadoOld) then
    begin
      with TSql.Create('asa_solicitudafiliacion') do
      try
        for iLoop := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

          Clear;
          SqlType := stUpdate;
          PrimaryKey.Add('sa_id',     sdqConsulta.FieldByName('sa_id').AsInteger);
          Fields.Add('sa_estado',     sEstadoNew);
          Fields.Add('sa_fechamodif', 'Actualdate', False);
          Fields.Add('sa_usumodif',   frmPrincipal.DBLogin.UserId);

          EjecutarSqlST(Sql);
         end;
      finally
        Free;
      end;
    end;

    if bGeneraCarta then
    begin
      if Grid.SelectedRows.Count > 0 then
      begin
        SetLength(aIdsFormulario, Grid.SelectedRows.Count);
        for iLoop := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
          aIdsFormulario[iLoop] := sdqConsulta.FieldByName('sa_idformulario').AsInteger;
        end;

        with TfrmAfiGeneracionCartas.Create(Self) do
        try
          if not Execute(aAccion, aIdsFormulario, sdqConsulta.FieldByName('sa_id').AsInteger, sEstadoOld) then
            raise Exception.Create('Se ha cancelado la emisión de la carta.');
        finally
          Free;
        end;
      end;
    end;
    CommitTrans;
  except
    on E:Exception do
    begin
      RollBack;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmConsultaSolicitud.tbRechazarClick(Sender: TObject);
begin
  if (sdqConsulta.IsEmpty) or (Grid.SelectedRows.Count = 0) then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  // Control del Estado.
  if Copy(sdqConsulta.FieldByName('tb_especial1').AsString, 3, 1) <> 'S' then
  begin
    MsgBox('El estado de la solicitud no es el apropiado para realizar dicha operación.', MB_ICONSTOP);
    Exit;
  end;

  DoAprobarNoAprobarRechazar(taSolicitudesRechazar);
  tbRefrescar.Click;
end;

function TfrmConsultaSolicitud.isMismoEstado: Boolean;
var
  iLoop: Integer;
  sEstado: String;
begin
  Result := True;

  sEstado := '';
  if Grid.SelectedRows.Count > 0 then
    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
      if sEstado = '' then
        sEstado := sdqConsulta.FieldByName('sa_estado').AsString
      else if sEstado <> sdqConsulta.FieldByName('sa_estado').AsString then
      begin
        Result := False;
        Break;
      end;
    end;
end;

procedure TfrmConsultaSolicitud.tblSALIRClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaSolicitud.cmbSA_ACTIVIDAD_RESUMENCloseUp(Sender: TObject; var Cancel: Boolean);
begin
  CargaActividad;
end;

procedure TfrmConsultaSolicitud.tbCartasClick(Sender: TObject);
var
  frmConsultaCarta: TfrmConsultaCarta;
begin
  if (sdqConsulta.IsEmpty) or (Grid.SelectedRows.Count = 0) then
  begin
    MsgBox('No existe una fila seleccionada.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  Application.CreateForm(TfrmConsultaCarta, frmConsultaCarta);
  try
    frmConsultaCarta.DoCargaCartas(sdqConsulta.FieldByName('sa_idformulario').AsInteger);
    frmConsultaCarta.ShowModal;
  finally
    FreeAndNil(frmConsultaCarta);
  end;
end;

procedure TfrmConsultaSolicitud.tbRespuestaClienteClick( Sender: TObject);
begin
  if (sdqConsulta.IsEmpty) or (Grid.SelectedRows.Count = 0) then
  begin
    MsgBox('No existe una fila seleccionada.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  if Copy(sdqConsulta.FieldByName('tb_especial1').AsString, 9, 1) <> 'S' then
  begin
    MsgBox('El estado de la solicitud no es el apropiado para realizar dicha operación.', MB_ICONSTOP);
    Exit;
  end;

  frmRespuestaCliente.Free;
  frmRespuestaCliente := TfrmRespuestaCliente.Create(frmPrincipal);
  frmRespuestaCliente.DoCargaCartas(sdqConsulta.FieldByName('sa_idformulario').AsInteger);
end;

procedure TfrmConsultaSolicitud.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  with sdqConsulta do
  begin
    edEmpEmpresa.Text         := FieldByName('empresa').AsString;
    edEmpEstablecimiento.Text := FieldByName('establecimiento').AsString;
    edEmpNomina.Text          := FieldByName('nomina').AsString;
  end;
end;

procedure TfrmConsultaSolicitud.fraVendedorcmbDescripcionDropDown(Sender: TObject);
begin
  fraVendedor.Entidad := fraEntidad.Value;

  inherited;

  fraVendedor.cmbDescripcionDropDown(Sender);
end;

procedure TfrmConsultaSolicitud.cmbSA_ACTIVIDADDropDown(Sender: TObject);
begin
  CargaActividad;
end;

procedure TfrmConsultaSolicitud.CargaActividad;
var
  aId: TCadena;
  iLoop: Integer;
  aSDQuery: TSDQuery;
  sSql: String;
begin
  aSDQuery := TSDQuery.Create(Self);
  with aSDQuery do
  try
    DatabaseName := 'dbPrincipal';

    cmbSA_ACTIVIDAD.Items.Clear;
    if cmbSA_ACTIVIDAD_RESUMEN.Text <> '' then
    begin
      sSql :=
        'SELECT DISTINCT a.ac_relacion relacion, b.ac_descripcion descripcion' +
                  ' FROM cac_actividad a, cac_actividad b' +
                 ' WHERE LENGTH(a.ac_relacion) = 6';
      if cmbSA_ACTIVIDAD_RESUMEN.Text <> '' then
      begin
        sSql := sSql + ' AND (';
        for iLoop := 0 to cmbSA_ACTIVIDAD_RESUMEN.Items.Count - 1 do
          if cmbSA_ACTIVIDAD_RESUMEN.Checked[iLoop] then
            sSql := sSql + ' (SUBSTR(a.ac_relacion, 1, 1) = ' + (cmbSA_ACTIVIDAD_RESUMEN.Items.Objects[iloop] as TCadena).Cadena + ') OR';
        sSql := Copy(sSql, 0, Length(sSql) - 2);
        sSql := sSql + ')';
      end;
      sSql := sSql + ' AND a.ac_relacion = b.ac_codigo ORDER BY relacion, descripcion';

      OpenQuery(aSDQuery, sSql, True);

      while not Eof do
      begin
        aId := TCadena.Create();
        aId.Cadena := FieldByName('relacion').AsString;
        cmbSA_ACTIVIDAD.Items.AddObject(FieldByName('relacion').AsString + ' - ' + FieldByName('descripcion').AsString, aId);
        Next;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.CargaActividadResumen;
var
  aId: TCadena;
  sSql: String;
  aSDQuery: TSDQuery;
begin
  aSDQuery := TSDQuery.Create(Self);
  with aSDQuery do
  try
    DatabaseName := 'dbPrincipal';
    sSql :=
      'SELECT DISTINCT a.ac_relacion relacion, b.ac_descripcion descripcion' +
                ' FROM cac_actividad a, cac_actividad b' +
               ' WHERE LENGTH(a.ac_relacion) = 1' +
                 ' AND a.ac_relacion = b.ac_codigo' +
            ' ORDER BY relacion, descripcion';
    OpenQuery(aSDQuery, sSql, True);

    cmbSA_ACTIVIDAD_RESUMEN.Items.Clear;
    while not Eof do
    begin
      aId := TCadena.Create();
      aId.Cadena := FieldByName('relacion').AsString;
      cmbSA_ACTIVIDAD_RESUMEN.Items.AddObject(FieldByName('relacion').AsString + ' - ' + FieldByName('descripcion').AsString, aId);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.CargarEstado;
var
  sSql: String;
begin
  sSql :=
    'SELECT tb_descripcion' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''ESSOL''' +
      ' AND (   tb_codigo = ''4.3''' +
           ' OR tb_codigo = ''4.4'')';
  with GetQuery(sSql) do
  try
    cmbEstado.Clear;
    while not Eof do
    begin
      cmbEstado.Items.Add(FieldByName('tb_descripcion').AsString);
      Next;
    end;
    cmbEstado.ItemIndex := 0;
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.btnAceptarClick(Sender: TObject);
begin
  frmEstado.ModalResult := mrOk;
end;

procedure TfrmConsultaSolicitud.fraEntidadcmbDescripcionDropDown(Sender: TObject);
begin
  fraEntidad.Canal := fraCanal.Value;

  inherited;

  fraEntidad.cmbDescripcionDropDown(Sender);
end;

procedure TfrmConsultaSolicitud.CalcularFilas;
begin
  edSeleccion.Value := Grid.SelectedRows.Count;
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotal.Value := sdqConsulta.RecordCount
  else
    edTotal.Value := 0;
end;

procedure TfrmConsultaSolicitud.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;

procedure TfrmConsultaSolicitud.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  aItem: TMenuItem;
  aMenuGrilla: TPopUpMenu;
begin
  // Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'..

  aMenuGrilla := TPopUpMenu.Create(Self);
  aItem := TMenuItem.Create(Self);
  try
    if (sdqConsulta.Active) and (not sdqConsulta.Eof) then
    begin
      aItem.Caption := 'Marcar Todos';
      aItem.OnClick := btnMarcarTodos;
      aMenuGrilla.Items.Add(aItem);

      aItem := TMenuItem.Create(Self);
      aItem.Caption := 'Desmarcar Todos';
      aItem.OnClick := btnDesMarcarTodos;
      aMenuGrilla.Items.Add(aItem);
    end
    else
    begin
      aItem.Caption := '( Consulta sin datos... )';
      aItem.Enabled := False;
      aMenuGrilla.Items.Add(aItem);
    end;
    aMenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    aMenuGrilla.Free;
    aItem.Free;
  end;
end;

procedure TfrmConsultaSolicitud.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
  CalcularFilas;
end;

procedure TfrmConsultaSolicitud.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilas;
end;

procedure TfrmConsultaSolicitud.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;

procedure TfrmConsultaSolicitud.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularFilas;
end;

procedure TfrmConsultaSolicitud.tbReferenciasClick(Sender: TObject);
begin
  if pnlRef.Visible then
  begin
    CoolBar.Height := 30;
    pnlRef.Visible := False;
  end
  else
  begin
    CoolBar.Height := 56;
    pnlRef.Visible := True;
  end;
end;

procedure TfrmConsultaSolicitud.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                   State: TGridDrawState);
begin
  with sdqConsulta do
  begin
    if ((FieldByName('faltarenglon').AsString <> '') and (FieldByName('sa_usurevision').IsNull)) then   //Faltante de carga ROJO
      Grid.Canvas.Font.Color := clRed
    else if FieldByName('faltarenglon').AsString <> '' then   //Solicitud con documentacion faltante VIOLETA
      Grid.Canvas.Font.Color := clPurple
    else if (FieldByName('sa_motivoalta').AsString = '02') and FieldByName('sa_usurevision').IsNull then    //Solicitud sin Revision NARANJA
      Grid.Canvas.Font.Color := $00719FFF
    else if FieldByName('sa_hojaslegajos').AsInteger = 0 then //Sin Cantidad de Hojas AZUL
      Grid.Canvas.Font.Color := clBlue;
  end;

  Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsultaSolicitud.tbEmailAutorizacionClick(Sender: TObject);
{var
  sLista: String;
  sSql: String;   }
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'No hay registros seleccionados');
  Verificar(not ExistenEmailsAsociados(frmConsultaSolicitud.sdqConsulta.FieldByName('sa_idformulario').AsInteger, 'AFO'),
            Grid, 'No existen emails asociados a este formulario');

  with TfrmElementosEnviados.Create(Self) do
  begin
    MenuItem := frmPrincipal.mnuElementosEnviados;
    FormStyle := fsMDIChild;

    IdRegistro := frmConsultaSolicitud.sdqConsulta.FieldByName('sa_idformulario').AsInteger;
    TipoRegistro := 'AFO';
    RefreshData;
  end;



 // sLista := '';

  //select tw_idemailenviado from web.wtw_transaccionweb where tw_id

  {sSql :=
    'SELECT DISTINCT tw_idemailenviado' +
              '  FROM web.wtw_transaccionweb' +
              ' WHERE tw_idemailenviado IS NOT NULL' +
              '  AND tw_id IN (SELECT re_idtransaccionweb' +
              '                   FROM afi.are_autorizarecepcion ' +
              '                  WHERE re_idsolicitud = :idsolicitud)';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('sa_id').AsInteger]) do
    while not eof do
    begin
      sLista := sLista + FieldByName('tw_idemailenviado').AsString + ',';
      Next;
    end;

  if sLista <> '' then
  begin
    SetLength(sLista, Length(sLista)-1);
    with TfrmElementosEnviados.Create(Self) do
    begin
      FormStyle := fsNormal;
      Visible := False;
      fraEE_DIRECCIONORIGEN.Clear;
      cmbEE_FECHAMENSAJEDesde.Clear;
      ExtraCondition := 'ee_id IN (' + sLista +' )';
      RefreshData;
      IdCorreo := StrToInt(sLista);
      ShowModal;
    end;
  end
  else
    InvalidMsg(Grid, 'No se encontraron e-mails.', 'Sin Datos');   }
end;

function TfrmConsultaSolicitud.ExistenEmailsAsociados(const aId: Integer;
  const aTipoRegistro: String): boolean;
var
  sSql : String;
begin
  sSql := 'SELECT 1 FROM comunes.cee_emailaenviar WHERE ee_tiporegistroasociado = :tipo AND ee_idregistroasociado = :id';
  Result := ValorSqlEx(sSql, [aTipoRegistro, aId]) = '1';
end;

procedure TfrmConsultaSolicitud.FSFormShow(Sender: TObject);
begin
  inherited;
  CoolBar.Height := 30;
  pnlRef.Visible := False;
end;

end.
