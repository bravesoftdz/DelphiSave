{-----------------------------------------------------------------------------
 Unit Name: unGestionReconfirmacion
 Author:    racastro
 Date:      26-Jun-2008
 Purpose:   Gestión de reconfirmaciones
 History:
-----------------------------------------------------------------------------}

unit unGestionReconfirmacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraEstudio, StdCtrls, Mask, ToolEdit, DateComboBox,
  CustomDlgs, unFraCodigoDescripcion, unFraTrabajador, General, unSesion, unListaEMail, unfraEstablecimiento_OLD,
  unArtFrame, unArtDbFrame, unFraEmpresaAfi, unArtDBAwareFrame, unFraStaticCodigoDescripcion, JvgGroupBox, 
  unfraPrestadorAMP, FormPanel, unfraPrestadorAMPCuit, unFraEmpresa, unFraEstablecimiento, ExComboBox, unExportPDF,
  Strfuncs, DateTimeFuncs, Buttons, JvExExtCtrls, JvNetscapeSplitter, PatternEdit, ComboEditor, CheckCombo,
  unFormEstudios, CUIT, DBCheckCombo, CheckLst, DBMultiCheck,
  unFraDomicilioTrab, unFraDomicilio, unFraDomicilioTrabajador;

type
  TfrmGestionReconfirmacion = class(TfrmCustomConsulta)
    Bevel2: TBevel;
    Bevel3: TBevel;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    fraEmpresa: TfraEmpresa;
    lbEstableci: TLabel;
    lbCPostal: TLabel;
    edCPostalFiltro: TEdit;
    fpMotivoRechazo: TFormPanel;
    btnAceptarMotivo: TButton;
    btnCancelarMotivo: TButton;
    fraMotivo: TfraCodigoDescripcion;
    Label1: TLabel;
    btnMantMotivos: TSpeedButton;
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    tbAprobar: TToolButton;
    tbRechazar: TToolButton;
    tbAsignable: TToolButton;
    tbDesasignar: TToolButton;
    Label5: TLabel;
    gbEstudios: TJvgGroupBox;
    dbgEstudios: TArtDBGrid;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    ToolBar1: TToolBar;
    tbRefrescarEstudios: TToolButton;
    ToolButton2: TToolButton;
    tbNuevoEstudio: TToolButton;
    tbEliminarEstudio: TToolButton;
    sdqEstudios: TSDQuery;
    dsEstudios: TDataSource;
    fpEstudios: TFormPanel;
    Label8: TLabel;
    btnAceptarEstudio: TButton;
    btmCancelarEstudio: TButton;
    fraEstudioAdic: TfraEstudio;
    cmbEstado: TCheckCombo;
    tbSeparador2: TToolButton;
    tbObservacion: TToolButton;
    memObsRechazo: TMemo;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    tbHistReconf: TToolButton;
    tbNotifEsp: TToolButton;
    ToolButton9: TToolButton;
    fpHistReconf: TFormPanel;
    sdqHistConf: TSDQuery;
    dsHistConf: TDataSource;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cmbTipo: TCheckCombo;
    chbBajas: TCheckBox;
    fpObsAprobacion: TFormPanel;
    btnAceptarAprob: TButton;
    Button2: TButton;
    memObsAprobacion: TMemo;
    tbVerEstudio: TToolButton;
    rgEstudiosCargados: TRadioGroup;
    fraEstudios: TfraEstudio;
    Label18: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAutorizacionDesde: TDateComboBox;
    Label19: TLabel;
    Label20: TLabel;
    fraPerfil: TfraCodigoDescripcion;
    Label22: TLabel;
    edFechaAltaHasta: TDateComboBox;
    edFechaAutorizacionHasta: TDateComboBox;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edFechaNotifDesde: TDateComboBox;
    Label25: TLabel;
    edFechaNotifHasta: TDateComboBox;
    fraTrabajadorFiltro: TfraTrabajador;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    tbTerminadoEsp: TToolButton;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    Label29: TLabel;
    Label30: TLabel;
    Label6: TLabel;
    tbCircuito: TToolButton;
    fpEspAdicionales: TFormPanel;
    Button1: TButton;
    Button3: TButton;
    sdqEspecialistas: TSDQuery;
    dsEspecialistas: TDataSource;
    cbEspecialistas: TDBCheckCombo;
    tbVerDomicilioTrabajador: TToolButton;
    fpDomicilioTrabajador: TFormPanel;
    btnCerrarVerDomic: TButton;
    Label31: TLabel;
    fraDomicTrabajador: TfraDomicilioTrabajador;
    fraTrabajadorDomic: TfraTrabajador;
    procedure fraTrabajadorEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarMotivoClick(Sender: TObject);
    procedure btnMantMotivosClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbRechazarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbAsignableClick(Sender: TObject);
    procedure tbDesasignarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbRefrescarEstudiosClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoEstudioClick(Sender: TObject);
    procedure tbEliminarEstudioClick(Sender: TObject);
    procedure dbgEstudiosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarEstudioClick(Sender: TObject);
    procedure fpMotivoRechazoShow(Sender: TObject);
    procedure tbObservacionClick(Sender: TObject);
    procedure tbHistReconfClick(Sender: TObject);
    procedure tbNotifEspClick(Sender: TObject);
    procedure fpObsAprobacionShow(Sender: TObject);
    procedure tbVerEstudioClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbTerminadoEspClick(Sender: TObject);
    procedure tbCircuitoClick(Sender: TObject);
    procedure fpEspAdicionalesShow(Sender: TObject);
    procedure tbVerDomicilioTrabajadorClick(Sender: TObject);
  private
    FFiltros: String;
    procedure OnEmpresaChange(Sender : TObject);
    procedure OnEstablecimientoChange(Sender : TObject);
    procedure OnTrabajadorChange(Sender : TObject);
    procedure CargarValoresHC(AForm: TFormEstudios);
  protected
    FIDLote : Integer;
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses unPrincipal, unDmPrincipal, AnsiSql, unVisualizador,vclExtra,
  unManMotivosRechazo, unObsReconfirmacion, unEstAudiometria,
  unEstRespiratorio, unEstudiosDef, unHistoriaClinica, unFraReconfirmacion,
  unArt, unCircuitoReconf, unMoldeEnvioMail, unComunes;

{$R *.DFM}

var
  modoABMEstudio: TModoABM;

{-----------------------------------------------------------------------------
  Procedure: ClearData
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: None
  Result:    None
  Purpose:   Limpia filtros y datos
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.ClearData;
begin
  fraEmpresa.Clear;
  fraEstablecimiento.Limpiar;
  fraTrabajadorFiltro.Clear;
  sdqConsulta.Close;
  cmbEstado.Clear;
  cmbTipo.Clear;
  rgEstudiosCargados.ItemIndex := 0;
  fraEstudios.Clear;
  fraPerfil.Clear;
  edFechaAltaDesde.Clear;
  edFechaAutorizacionDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaAutorizacionHasta.Clear;

  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: fraTrabajadorEnter
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Actualiza la consulta
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.RefreshData;
var
  i: integer;
  sWhere: String;
begin
  FFiltros := '';
  sWhere   := '';

  if fraEmpresa.IsSelected then
    FFiltros := FFiltros + ' AND em_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text);

  if not IsEmptyString(edCPostalFiltro.Text) then
    FFiltros := FFiltros + ' AND aes.es_cpostal = ' + SqlValue(edCPostalFiltro.Text);

  if fraEstablecimiento.IsSelected then
    FFiltros := FFiltros + ' AND aes.es_nroestableci = ' + fraEstablecimiento.edCodigo.TextSql + ' ';

  if fraTrabajadorFiltro.IsSelected then
    FFiltros := FFiltros + ' AND tj_cuil = ' + SQLValue(fraTrabajadorFiltro.CUIL);

  if not chbBajas.Checked then
    FFiltros := FFiltros + ' AND gr_fechabaja IS NULL ';

  FFiltros := FFiltros + SqlBetweenDateTime(' AND gr_fechaalta ', edFechaAltaDesde.Date, edFechaAltaHasta.Date, True);
  
  FFiltros := FFiltros + SqlBetweenDateTime(' AND gr_fechaautorizacion ', edFechaAutorizacionDesde.Date, edFechaAutorizacionHasta.Date, True);

  FFiltros := FFiltros + SqlBetweenDateTime(' AND gr_fechanotificacionesp ', edFechaNotifDesde.Date, edFechaNotifHasta.Date, True);

  if fraEstudios.IsSelected then
    FFiltros := FFiltros + ' AND es_codigo || '''' = ' + SQLValue(fraEstudios.Codigo);

  if fraPerfil.IsSelected then
    FFiltros := FFiltros + ' AND hpa.pa_id = ' + SQLValue(fraPerfil.Value);

  if cmbTipo.CheckedCount <> 0 then
  begin
    FFiltros := FFiltros + ' AND gr_enfprofesional IN (';

    if cmbTipo.Checked[0] and (cmbTipo.Items[0] = 'Reconfirmación') then
      FFiltros := FFiltros + '''N'',';

    if cmbTipo.Checked[1] and (cmbTipo.Items[1] = 'Enf.Profesional') then
      FFiltros := FFiltros + '''S'',';

    FFiltros := Copy(FFiltros, 1, Length(FFiltros) - 1) + ')';
  end;

  case rgEstudiosCargados.ItemIndex of
    1: FFiltros := FFiltros + ' AND gr_idestrab IS NOT NULL ';
    2: FFiltros := FFiltros + ' AND gr_idestrab IS NULL ';
  end;

  if cmbEstado.CheckedCount <> 0 then
  begin
    FFiltros := FFiltros + ' AND gr_estado IN (';

    for i := 0 to cmbEstado.Items.Count - 1 do
      if cmbEstado.Checked[i] then
      begin
        if cmbEstado.Items[i] = 'Asignable al Prestador' then
        begin
          sWhere := sWhere + ' AND gr_idlote IS NULL ';
          FFiltros := FFiltros + '''AP'',';
        end;
        if cmbEstado.Items[i] = 'Para Especialista' then
          FFiltros := FFiltros + '''PE'',';
        if cmbEstado.Items[i] = 'Pendiente Autorización' then
          FFiltros := FFiltros + '''PA'',';
        if cmbEstado.Items[i] = 'Pendiente Asignación' then
          FFiltros := FFiltros + '''PG'',';
        if cmbEstado.Items[i] = 'Rechazado' then
          FFiltros := FFiltros + '''RZ'',';
        if cmbEstado.Items[i] = 'Notificado Especialista' then
          FFiltros := FFiltros + '''NE'',';
        if cmbEstado.Items[i] = 'Aprobado (E.Prof.)' then
          FFiltros := FFiltros + '''AE'',';
        if cmbEstado.Items[i] = 'Terminado Manualmente' then
          FFiltros := FFiltros + '''TE'',';
        if cmbEstado.Items[i] = 'Asignado (c/lote)' then
        begin
          FFiltros := FFiltros + '''AP'',';
          sWhere := sWhere + ' AND gr_idlote IS NOT NULL '
        end;
      end;

    FFiltros := Copy(FFiltros, 1, Length(FFiltros) - 1) + ')';
  end;

  FFiltros := FFiltros + sWhere;
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('SELECT em_cuit, em_nombre, aes.es_localidad, tj_id, pv_descripcion, aes.es_contrato, ' +
                      '       aes.es_nroestableci, aes.es_nombre, tj_cuil, tj_nombre, est.es_codigo, ' +
                      '       est.es_descripcion, ca_descripcion, le_fechaalta, dl_fecharealizacion, ' +
                      '       mr_descripcion, aes.es_id, hgr.*, aet.*,es_contrato, es_cpostal, ' +
                      '       DECODE (gr_estado, ' +
                      '               ''AE'', ''Aprobado (Enf.Prof.)'', ' +
                      '               ''PA'', ''Pendiente Autorización'', ' +
                      '               ''PG'', ''Pendiente Asignación'', ' +
                      '               ''PE'', ''Para Especialista'', ' +
                      '               ''AP'', ''Asignable al Prestador'', ' +
                      '               ''NE'', ''Notificado Especialista'', ' +
                      '               ''TE'', ''Terminado Manualmente'', ' +
                      '               ''RZ'', ''Rechazado'', ' +
                      '               ''N/A'' ' +
                      '              ) estado, ' +
                      '       DECODE (gr_idestrab, NULL, ''No'', ''Sí'') con_estudio, ' +
                      '       DECODE (gr_enfprofesional, ' +
                      '               ''N'', ''Reconfirmación'', ' +
                      '               ''S'', ''Enf.Profesional'' ' +
                      '              ) tipo, ' +
                      '       NVL2 ((SELECT DISTINCT 1 ' +
                      '                         FROM hys.hre_reconfirmacionestudio ' +
                      '                        WHERE re_idreconfirmacion = gr_id ' +
                      '                          AND re_fechabaja IS NULL), ' +
                      '             ''SI'', ' +
                      '             ''NO'' ' +
                      '            ) estadic, ' +
                      '       es_formulario, ' +
                      '       NVL2 (hpa2.pa_descripcion, ' +
                      '             hpa2.pa_descripcion, ' +
                      '             hpa1.pa_descripcion ' +
                      '            ) pa_descripcion, ' +
                      '       gr_idlote lote, ' +
                      '(SELECT DISTINCT (''Existen Observaciones adicionales. Consultar la Agenda de Observaciones de la reconfirmación'') ' +
                      '            FROM hys.hor_obsreconfirmacion ' +
                      '           WHERE or_idreconf = gr_id) obsadic, ' +
                      ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) domicilio, tj_telefono '+
                      '  FROM art.aet_estrab aet, ' +
                      '       hys.hmr_motivorechazo, ' +
                      '       art.cpv_provincias, ' +
                      '       art.cpr_prestador, ' +
                      '       hys.hle_loteestudio, ' +
                      '       comunes.ctj_trabajador, ' +
                      '       art.aes_estudios est, ' +
                      '       hys.hpa_perfilamp hpa1, ' +
                      '       hys.hpa_perfilamp hpa2, ' +
                      '       afi.aes_establecimiento aes, ' +
                      '       afi.aem_empresa, ' +
                      '       hys.hdl_detallelote hdl, ' +
                      '       hys.hgr_gestionreconfirmacion hgr ' +
                      ' WHERE dl_id = gr_iddetallelote ' +
                      '   AND em_id = dl_idempresa ' +
                      '   AND aes.es_id = dl_idestableci ' +
                      '   AND tj_id = dl_idtrabajador ' +
                      '   AND est.es_id = dl_idestudio ' +
                      '   AND le_id = dl_idlote ' +
                      '   AND ca_identificador = le_idprestador ' +
                      '   AND pv_codigo = aes.es_provincia ' +
                      '   AND mr_id(+) = gr_idmotivorechazo ' +
                      '   AND et_id(+) = gr_idestrab ' +
                      '   AND hpa1.pa_id(+) = es_idperfil ' +
                      '   AND hpa2.pa_id(+) = gr_idperfiladicional ' +
                          FFiltros);
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: fraTrabajadorEnter
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.fraTrabajadorEnter(Sender: TObject);
begin
  if fraTrabajadorFiltro.IdEmpresa = ART_EMPTY_ID then
    fraTrabajadorFiltro.MinLength := 4
  else
    fraTrabajadorFiltro.MinLength := 0;
end;

{-----------------------------------------------------------------------------
  Procedure: FormCreate
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Creación del form
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas      := True;
  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEmpresa.ContratoActivo := True;

  fraEstablecimiento.OnChange := OnEstablecimientoChange;
  fraTrabajadorFiltro.OnChange      := OnTrabajadorChange;

  with fraMotivo do
  begin
    TableName := 'hys.hmr_motivorechazo';
    FieldId := 'mr_id';
    FieldCodigo := 'mr_id';
    FieldDesc := 'mr_descripcion';
    FieldBaja := 'mr_fechabaja';
    ShowBajas := false;
    ExtraCondition := ' AND mr_tiporechazo = ''F'' ';
  end;

  with fraPerfil do
  begin
    TableName := 'hys.hpa_perfilamp';
    FieldId := 'pa_id';
    FieldCodigo := 'pa_id';
    FieldDesc := 'pa_descripcion';
    FieldBaja := 'pa_fechabaja';
    ShowBajas := true;
  end;

  tbSalir.Left := 1000;

  gbEstudios.Collapsed := true;
end;

{-----------------------------------------------------------------------------
  Procedure: OnEmpresaChange
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Define CUIT de Establecimiento y Trabajador por cambio de empresa
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.mskCUIT.Text ;
  fraTrabajadorFiltro.IdEmpresa := fraEmpresa.Value;
  sdqConsulta.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: OnEstablecimientoChange
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Define Establecimiento del Trabajador por cambio de establecimiento
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.OnEstablecimientoChange(Sender: TObject);
begin
  fraTrabajadorFiltro.IdEstableci := fraEstablecimiento.Value;
  sdqConsulta.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: OnTrabajadorChange
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Cierra consulta por cambio de Trabajador
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.OnTrabajadorChange(Sender: TObject);
begin
  sdqConsulta.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: btnAceptarMotivoClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Valida motivo de rechazo
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.btnAceptarMotivoClick(Sender: TObject);
begin
  VerificarMultiple (['Debitar el estudio',
                      fraMotivo,
                      fraMotivo.IsSelected,
                      'Debe indicar el motivo de rechazo']);

  fpMotivoRechazo.ModalResult := mrOk
end;

{-----------------------------------------------------------------------------
  Procedure: btnMantMotivosClick
  Author:    racastro
  Date:      07-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Mantenimiento de Moticos de Rechazo
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.btnMantMotivosClick(Sender: TObject);
var
  frmMotivo: TfrmManMotivosRechazo;
begin
  frmMotivo := TfrmManMotivosRechazo.Create( Self );
  with frmMotivo do
    try
      FormStyle := fsNormal;
      if Visible then
        Hide;
      Caption := 'Motivos de Rechazo de Reconfirmaciones';
      FTipo := 'F';
      tbRefrescarClick(nil);
      ShowModal;
      BringToFront;
    finally
      Free;
    end;
end;                 

{-----------------------------------------------------------------------------
  Procedure: GridGetCellParams
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean
  Result:    None
  Purpose:   Colores según estado
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Highlight then
  begin
    AFont.Color := clWhite;
    Background := clNavy
  end
  else
    if not sdqConsulta.FieldByName('gr_fechabaja').IsNull then
      AFont.Color := clRed
  else
    if not sdqConsulta.FieldByName('lote').IsNull then
      Background := $00FFFF80
  else
    if sdqConsulta.FieldByName('gr_estado').AsString = 'PA' then
      Background := $00A4FFFF
  else
    if sdqConsulta.FieldByName('gr_estado').AsString = 'PG' then
      Background := clInfoBk
  else
    if sdqConsulta.FieldByName('gr_estado').AsString = 'PE' then
      Background := clMoneyGreen
  else
    if sdqConsulta.FieldByName('gr_estado').AsString = 'AP' then
      Background := clSkyBlue
  else
    if sdqConsulta.FieldByName('gr_estado').AsString = 'RZ' then
      Background := $007DA8FF
  else
    if sdqConsulta.FieldByName('gr_estado').AsString = 'NE' then
      Background := $00FFC1C1
  else
    if sdqConsulta.FieldByName('gr_estado').AsString = 'TE' then
      Background := $00408080
end;

{-----------------------------------------------------------------------------
  Procedure: tbRechazarClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Rechazo de reconfirmación
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbRechazarClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty or
     (not sdqConsulta.FieldByName('gr_fechabaja').IsNull) then
    Exit;

  // Verifico estado
  if not AreIn (sdqConsulta.FieldByName('gr_estado').AsString, ['PA', 'NE']) then
  begin
    MsgBox('El estudio debe estar Pendiente de Autorización ' +
           'para poder rechazarlo.', MB_ICONERROR);
    Exit;
  end;

  if fpMotivoRechazo.ShowModal = mrOk then
    EjecutarSQLEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                  '   SET gr_estado = ''RZ'', ' +
                  '       gr_usumodif = :pusuario, ' +
                  '       gr_fechamodif = SYSDATE, ' +
                  '       gr_usuautorizacion = :pusuario, ' +
                  '       gr_fechaautorizacion = SYSDATE, ' +
                  '       gr_idmotivorechazo = :pidmotivo, ' +
                  '       gr_observacion = :pobservacion ' +
                  ' WHERE gr_id = :pid ',
                  [frmPrincipal.DBLogin.UserID,
                   frmPrincipal.DBLogin.UserID,
                   fraMotivo.Value,
                   memObsRechazo.Lines.Text,
                   sdqConsulta.FieldByName('gr_id').AsInteger]);

  sdqConsulta.Refresh
end;

{-----------------------------------------------------------------------------
  Procedure: tbAprobarClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Aprobación de reconfirmanción
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbAprobarClick(Sender: TObject);
const
  LF = chr(13) + chr(10);
var
  estado, Esop: string;
  i: integer;
  FechaRealiz: TDateTime;
  CuerpoMail: string;
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty or
     (not sdqConsulta.FieldByName('gr_fechabaja').IsNull) then
    Exit;

(* Suspendido el 27/08/08
  // Verifico que tenga un estudio asociado
  if sdqConsulta.FieldByName('gr_idestrab').IsNull then
  begin
    MsgBox('No hay estudio cargado en HHCC para poder efectuar la Aprobación', MB_ICONERROR);
    Exit;
  end;
*)

  // Verifico estado
  if not AreIn(sdqConsulta.FieldByName('gr_estado').AsString, ['PA', 'NE']) then
  begin
    MsgBox('El estudio debe estar Pendiente de Autorización ó ' +
           'Notificado a Especialista para poder aprobarlo.', MB_ICONERROR);
    Exit;
  end;

  if fpObsAprobacion.ShowModal = mrOk then
  begin
    BeginTrans;

    try
      if sdqConsulta.FieldByName('gr_enfprofesional').AsString = 'S' then begin
        EjecutarSQLSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                        '   SET gr_estado = ''AE'', ' +
                        '       gr_usumodif = :pusuario, ' +
                        '       gr_fechamodif = SYSDATE,' +
                        '       gr_usuautorizacion = :pusuario, ' +
                        '       gr_fechaautorizacion = SYSDATE, ' +
                        '       gr_observacion = :pobservacion ' +
                        ' WHERE gr_id = :pid ',
                        [frmPrincipal.DBLogin.UserID,
                         frmPrincipal.DBLogin.UserID,
                         memObsAprobacion.Lines.Text,
                         sdqConsulta.FieldByName('gr_id').AsInteger]);

        Esop := ValorSqlEx(
                         'SELECT MAX(rs_esop || '' - '' || rs_descripcion_riesgotrabajo) esop 	'
                        +'  FROM hys.v_trabajadores_con_riesgo, 	'
                        +'       hys.hgr_gestionreconfirmacion, 	'
                        +'       hys.hel_estadolote, 	'
                        +'       hys.hrl_relevamientolote, 	'
                        +'       hys.hdl_detallelote 	'
                        +' WHERE dl_idtrabajador = :tj_id 	'
                        +'   AND gr_iddetallelote = dl_id 	'
                        +'   AND el_idlote = dl_idlote 	'
                        +'   AND rl_id = el_rlid 	'
                        +'   AND rl_idestableci = dl_idestableci 	'
                        +'   AND gr_estado <> ''RZ'' 	'
                        +'   AND gr_fechabaja IS NULL 	'
                        +'   AND gr_fechaautorizacion IS NOT NULL 	'
                        +'   AND rs_cuit = :cuit 	'
                        +'   AND rs_cuil = :cuil 	'
                        +'   AND rs_estableci = :estableci 	'
                        +'   AND rs_fecha = rl_fecha 	'
                        +'   AND rs_idestudio = dl_idestudio 	',
                        [ sdqConsulta.FieldByName('tj_id').AsInteger,
                          sdqConsulta.FieldByName('em_cuit').AsString,
                          sdqConsulta.FieldByName('tj_cuil').AsString,
                          sdqConsulta.FieldByName('es_nroestableci').AsString] );

        FechaRealiz := ValorSqlExtendedEx(
                             'SELECT MAX(dl_fecharealizacion) 	'
                            +'  FROM hys.hgr_gestionreconfirmacion, 	'
                            +'       hys.hdl_detallelote 	'
                            +' WHERE dl_idtrabajador = :tj_id 	'
                            +'   AND gr_iddetallelote = dl_id '
                            +'   AND gr_estado <> ''RZ'' '
                            +'   AND gr_fechabaja IS NULL '
                            +'   AND gr_fechaautorizacion IS NOT NULL ',
                            {+'   AND gr_iddetallelote = dl_id 	'
                            +'   AND gr_fechabaja IS NULL 	'
                            +'   AND dl_idlote IN(SELECT el_idlote '
                            +'                    FROM hys.hel_estadolote '
                            +'                    WHERE el_operativo = ''A'')', }

                            [ sdqConsulta.FieldByName('tj_id').AsInteger]);

 {
        EjecutarStoreSTEx(
             '   art.siniestro.do_generarsiniestro( '
            +'                                     :FechaRealiz, '
            +'                                     ''00:01'', '
            +'                                     :tj_id, '
            +'                                     :em_cuit, '
            +'                                     :es_descripcion, '
            +'                                     NULL, '
            +'                                     NULL, '
            +'                                     NULL, '
            +'                                     NULL, '
            +'                                     NULL, '
            +'                                     20639, '
            +'                                     :usuario, '
            +'                                     ''S'' '
            +'                                    ); ',
            [ TDateTimeEx.Create(FechaRealiz),
              sdqConsulta.FieldByName('tj_id').AsInteger,
              sdqConsulta.FieldByName('em_cuit').AsString,
              sdqConsulta.FieldByName('es_descripcion').AsString + ' // ESOP: ' + ESOP,
              frmPrincipal.DBLogin.UserID
            ]
        );
  }

        CuerpoMail :=
            'CUIT: ' + sdqConsulta.FieldByName('em_cuit').AsString                 + LF +
            'Empresa: ' + sdqConsulta.FieldByName('em_nombre').AsString            + LF +
            'CUIL: ' + sdqConsulta.FieldByName('tj_cuil').AsString                 + LF +
            'Trabajador: ' + sdqConsulta.FieldByName('tj_nombre').AsString         + LF +
            'Domicilio Trabajador: '+sdqConsulta.FieldByName('domicilio').AsString + LF +
            'Telefono Trabajador: '+sdqConsulta.FieldByName('tj_telefono').AsString+ LF +
            'Fecha Siniestro: ' + DateToStr(FechaRealiz)                           + LF +
            'ESOP: ' + ESOP                                                        + LF;

        EjecutarStoreST(
            Format(
                'art.varios.do_insertartablamails(' +
                                  ' ''AvisosAutomaticos'', %s, ' +
                                  ' ''Alta de Siniestro [AMP]'', %s, '+
                                  ' NULL, NULL, NULL); ',
                [ QuotedStr(Get_DireccionesEnvioMail('EST_APROV')),
                  QuotedStr(CuerpoMail)]
            )
        );


      end else
        if sdqConsulta.FieldByName('gr_estado').AsString = 'PA' then
        begin
          // Estado por defecto
          estado := 'PG';

          // Decide el estado en caso que pueda requerir especialista
          // ó si es para especialista adicional
          if ExisteSQLEx ('SELECT 1 ' +
                          '  FROM art.aes_estudios ' +
                          ' WHERE es_codigo = :pestudio ' +
                          '   AND es_idperfil IS NOT NULL ',
                          [sdqConsulta.FieldByName('es_codigo').AsString]) or
             not sdqConsulta.FieldByName('gr_idperfiladicional').IsNull then
          case MsgBox('El estudio requiere especialista. ' + #13 +
                      'Indique [SI] para asignárselo mediante notificación. ' + #13 +
                      '        [NO] para asignárselo a posteriori por medio de un lote).',
                       MB_ICONQUESTION + MB_YESNOCANCEL) of
            mrYes: estado := 'PE';
            mrNo : estado := 'PG';
            else   estado := '';                           
          end;

          if estado <> '' then
            EjecutarSQLSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                            '   SET gr_estado = :pestado, ' +
                            '       gr_usumodif = :pusuario, ' +
                            '       gr_fechamodif = SYSDATE,' +
                            '       gr_usuautorizacion = :pusuario, ' +
                            '       gr_fechaautorizacion = SYSDATE, ' +
                            '       gr_observacion = :pobservacion ' +
                            ' WHERE gr_id = :pid ',
                            [estado,
                             frmPrincipal.DBLogin.UserID,
                             frmPrincipal.DBLogin.UserID,
                             memObsAprobacion.Lines.Text,
                             sdqConsulta.FieldByName('gr_id').AsInteger])
        end
        else begin
          // Aprobación derivada de Notificado a Especialista
          EjecutarSQLSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                          '   SET gr_estado = ''PG'', ' +
                          '       gr_usumodif = :pusuario, ' +
                          '       gr_fechamodif = SYSDATE, ' +
                          '       gr_usuautorizacion = :pusuario, ' +
                          '       gr_fechaautorizacion = SYSDATE, ' +
                          '       gr_observacion = :pobservacion ' +
                          ' WHERE gr_id = :pid ',
                          [frmPrincipal.DBLogin.UserID,
                           frmPrincipal.DBLogin.UserID,
                           memObsAprobacion.Lines.Text,
                           sdqConsulta.FieldByName('gr_id').AsInteger]);

          // De ser necesaria las intervenciones adicionales de otros
          // especialistas para el mismo estudio, se cargan acá
          if (MsgBox('Desea indicar la intervención adicional de otros especialistas? ',
                     MB_ICONQUESTION + MB_YESNO) = mrYes) and
             (fpEspAdicionales.ShowModal = mrOk) then
            for i := 0 to cbEspecialistas.Count-1 do
              if cbEspecialistas.Checked[i] then
                EjecutarSQLSTEx('INSERT INTO hys.hgr_gestionreconfirmacion ' +
                                '            (gr_id, gr_iddetallelote, gr_estado, gr_fechaalta, gr_usualta, ' +
                                '             gr_enfprofesional, gr_idestrab, gr_idperfiladicional) ' +
                                '   SELECT hys.seq_hgr_id.NEXTVAL, gr_iddetallelote, ''PA'', gr_fechaalta, gr_usualta, ' +
                                '          gr_enfprofesional, gr_idestrab, :pidperfiladicional ' +
                                '     FROM hys.hgr_gestionreconfirmacion ' +
                                '    WHERE gr_id = :pid',
                                [cbEspecialistas.ItemValue[i],
                                 sdqConsulta.FieldByName('gr_id').AsInteger])
        end;

      CommitTrans
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg (E, 'Error al aprobar la reconfirmanción');
      end;
    end
  end;

  sdqConsulta.Refresh
end;

{-----------------------------------------------------------------------------
  Procedure: tbAsignableClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Define reconfirmación como Asignable a Prestador
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbAsignableClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty or
     (not sdqConsulta.FieldByName('gr_fechabaja').IsNull) or
     (not sdqEstudios.Active) then
    Exit;

  // Verifico estado
  if sdqConsulta.FieldByName('gr_estado').AsString <> 'PG' then
  begin
    MsgBox('El estudio debe estar Pendiente de Asignación para que sea ' +
           'Asignable al Prestador.', MB_ICONERROR);
    Exit;
  end;

  // Verifico si hay estudios
  if sdqEstudios.IsEmpty or
     (ValorSQLEx ('SELECT COUNT (*) ' +
                  '  FROM hys.hre_reconfirmacionestudio ' +
                  ' WHERE re_fechabaja IS NULL ' +
                  '   AND re_idreconfirmacion = :pidreconfirmacion ',
                  [sdqConsulta.FieldByName('gr_id').AsInteger]) = 0) then
  begin
    MsgBox('No hay estudios adicionales para que sea Asignable al Prestador.',
           MB_ICONERROR);
    Exit;
  end;

  EjecutarSQLEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                '   SET gr_estado = ''AP'', ' +
                '       gr_usumodif = :pusuario, ' +
                '       gr_fechamodif = SYSDATE, ' +
                '       gr_usuautorizacion = :pusuario, ' +
                '       gr_fechaautorizacion = SYSDATE ' +
                ' WHERE gr_id = :pid ',
                [frmPrincipal.DBLogin.UserID,
                 frmPrincipal.DBLogin.UserID,
                 sdqConsulta.FieldByName('gr_id').AsInteger]);

  sdqConsulta.Refresh;
  sdqEstudios.Refresh;

  sdqConsulta.First;
end;

{-----------------------------------------------------------------------------
  Procedure: tbDesasignarClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Anula estado Asignable a Prestador
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbDesasignarClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty or
     (not sdqConsulta.FieldByName('gr_fechabaja').IsNull) then
    Exit;

  // Verifico estado
  if not sdqConsulta.FieldByName('lote').IsNull then
  begin
    MsgBox('El estudio ya fue asignado al prestador en un lote.', MB_ICONERROR);
    Exit;
  end;

  if sdqConsulta.FieldByName('gr_estado').AsString <> 'AP' then
  begin
    MsgBox('El estudio debe estar como Asignable al Prestador para poder ' +
           'redefinirlo a Pendiente de Asignación.', MB_ICONERROR);
    Exit;
  end;

  EjecutarSQLEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                '   SET gr_estado = ''PG'', ' +
                '       gr_usumodif = :pusuario, ' +
                '       gr_fechamodif = SYSDATE, ' +
                '       gr_usuautorizacion = :pusuario, ' +
                '       gr_fechaautorizacion = SYSDATE ' +
                ' WHERE gr_id = :pid ',
                [frmPrincipal.DBLogin.UserID,
                 frmPrincipal.DBLogin.UserID,
                 sdqConsulta.FieldByName('gr_id').AsInteger]);

  sdqConsulta.Refresh;
end;

{-----------------------------------------------------------------------------
  Procedure: sdqConsultaAfterScroll
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: DataSet: TDataSet
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.sdqConsultaAfterScroll(
  DataSet: TDataSet);
begin
  tbRefrescarEstudiosClick(nil);
end;

{-----------------------------------------------------------------------------
  Procedure: tbRefrescarEstudiosClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Actualiza lista de estudios de una reconfirmación
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbRefrescarEstudiosClick(Sender: TObject);
begin
  if not sdqConsulta.Active or sdqConsulta.IsEmpty then
    Exit;

  gbEstudios.Collapsed := false;

  with sdqEstudios do
  begin
    Close;
    ParamByName ('pidreconfirmacion').Value := sdqConsulta.FieldByName('gr_id').AsInteger;
    Open
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbRefrescarClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbRefrescarClick(Sender: TObject);
begin
  gbEstudios.Collapsed := true;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: tbNuevoEstudioClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Agrega un estudio a una reconfirmación
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbNuevoEstudioClick(Sender: TObject);
var
  BM: TBookMark;
begin
  if not sdqEstudios.Active then
    Exit;

  // Verifico estado
  if sdqConsulta.FieldByName('gr_estado').AsString <> 'PG' then
  begin
    MsgBox('El estudio debe estar como Pendiente de Asignación para poder ' +
           'agregar/editar estudios.', MB_ICONERROR);
    Exit;
  end;

  modoABMEstudio := maAdd;
  fraEstudioAdic.Clear;

  if fpEstudios.ShowModal = mrOk then
  begin
    EjecutarSqlEx('INSERT INTO hys.hre_reconfirmacionestudio ' +
                  '            (re_id, re_idreconfirmacion, re_idestudio, ' +
                  '             re_fechaalta, re_usualta) ' +
                  '     VALUES (hys.seq_hre_id.NEXTVAL, :pidreconfirmacion, :pidestudio, ' +
                  '             SYSDATE, :pusuario) ',
                  [sdqConsulta.FieldByName('gr_id').AsInteger,
                   fraEstudioAdic.Codigo,
                   frmPrincipal.DBLogin.UserID]);

    BM := sdqConsulta.GetBookmark;
    try
      tbRefrescarClick(Sender);
      sdqConsulta.GoToBookmark(BM)
    finally
      sdqConsulta.FreeBookmark(BM)
    end;

    tbRefrescarEstudiosClick(Sender);
    gbEstudios.Collapsed := false;
  end
end;

{-----------------------------------------------------------------------------
  Procedure: tbEliminarEstudioClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Elimina un estudio de una reconfirmación
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbEliminarEstudioClick(Sender: TObject);
var
  BM: TBookMark;
begin
  if not sdqEstudios.Active or
     sdqEstudios.IsEmpty or
     not sdqEstudios.FieldByName('re_fechabaja').IsNull or
     gbEstudios.Collapsed then
    Exit;

  // Verifico estado
  if sdqConsulta.FieldByName('gr_estado').AsString <> 'PG' then
  begin
    MsgBox('El estudio debe estar como Pendiente de Asignación para poder ' +
           'agregar/editar estudios.', MB_ICONERROR);
    Exit;
  end;

  if MsgBox('Desea eliminar el estudio?', MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    EjecutarSqlEx('UPDATE hys.hre_reconfirmacionestudio ' +
                  '   SET re_fechabaja = SYSDATE, ' +
                  '       re_usubaja = :pusuario ' +
                  ' WHERE re_id = :pid ',
                  [frmPrincipal.DBLogin.UserID,
                   sdqEstudios.FieldByName('re_id').AsInteger]);
    sdqEstudios.Refresh;

    if not ExisteSqlEx('SELECT 1 ' +
                       '  FROM hys.hre_reconfirmacionestudio ' +
                       ' WHERE re_idreconfirmacion = :pid ' +
                       '   AND re_fechabaja IS NULL ',
                       [sdqConsulta.FieldByName('gr_id').AsInteger]) then
    begin
      BM := sdqConsulta.GetBookmark;
      try
        tbRefrescarClick(Sender);
        sdqConsulta.GoToBookmark(BM)
      finally
        sdqConsulta.FreeBookmark(BM)
      end
    end
  end
end;

{-----------------------------------------------------------------------------
  Procedure: dbgEstudiosGetCellParams
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean
  Result:    None
  Purpose:   Color por baja
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.dbgEstudiosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqEstudios.FieldByName('re_fechabaja').IsNull then
    AFont.Color := clRed
end;

{-----------------------------------------------------------------------------
  Procedure: btnAceptarEstudioClick
  Author:    racastro
  Date:      26-Jun-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Validación de carga de estudio de una reconfirmación
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.btnAceptarEstudioClick(
  Sender: TObject);
begin
//  VerificarMultiple (['Carga de estudio',
//                      fraEstudioAdic,
 //                     fraEstudioAdic.IsSelected,
 //                     'Debe indicar el estudio']);

  Verificar(fraEstudioAdic.cmbDescripcion.Text = '', fraEstudioAdic, 'Debe indicar el estudio' );

  if ExisteSqlEx ('SELECT 1 ' +
                  '  FROM hys.hre_reconfirmacionestudio ' +
                  ' WHERE re_fechabaja IS NULL ' +
                  '   AND re_idreconfirmacion = :pidreconfirmacion ' +
                  '   AND re_idestudio = :pestudio ',
                  [sdqConsulta.FieldByName('gr_id').AsInteger,
                   fraEstudioAdic.Codigo]) and
     (MsgBox('El estudio ya existe en la reconfirmación. Desea cargarlo igualmente?',
             MB_ICONQUESTION + MB_YESNO) <> mrYes) then
    Exit;

  fpEstudios.ModalResult := mrOk
end;

{-----------------------------------------------------------------------------
  Procedure: fpMotivoRechazoShow
  Author:    racastro
  Date:      04-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.fpMotivoRechazoShow(Sender: TObject);
begin
  fraMotivo.Clear;
  memObsRechazo.Clear;
end;

{-----------------------------------------------------------------------------
  Procedure: tbObservacionClick
  Author:    racastro
  Date:      04-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Carga en Agenda de Observaciones de Reconfirmaciones
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbObservacionClick(Sender: TObject);
var
  fObs: TfrmObsReconf;
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty then
    Exit;

  fObs := TfrmObsReconf.Create( Self );
  try
    fObs.FIDReconf := sdqConsulta.FieldByName('gr_id').AsInteger;
    fObs.tbRefrescarClick(Sender);

    Abrir(TfrmObsReconf, fObs, tmvModal, nil);
  finally
    fObs.Free;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbHistReconfClick
  Author:    racastro
  Date:      04-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Visualización de Histórico de Estados de Reconfirmaciones
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbHistReconfClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty then
    Exit;

  sdqHistConf.ParamByName('pidreconf').Value := sdqConsulta.FieldByName('gr_id').AsInteger;
  sdqHistConf.Open;

  fpHistReconf.ShowModal;

  sdqHistConf.Close
end;

{-----------------------------------------------------------------------------
  Procedure: tbNotifEspClick
  Author:    racastro
  Date:      04-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Asigna el estado Para Especialista
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbNotifEspClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty or
     (not sdqConsulta.FieldByName('gr_fechabaja').IsNull) then
    Exit;

  // Verifico estado
  if not AreIn(sdqConsulta.FieldByName('gr_estado').AsString, ['PE']) then
  begin
    MsgBox('El estudio debe estar en el estado Para Especialista ' +
           'a fin de poder notificarlo al mismo.', MB_ICONERROR);
    Exit;
  end;

  EjecutarSQLEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                '   SET gr_estado = ''NE'', ' +
                '       gr_usumodif = :pusuario, ' +
                '       gr_fechamodif = SYSDATE, ' +
                '       gr_usunotificacionesp = :pusuario, ' +
                '       gr_fechanotificacionesp = SYSDATE ' +
                ' WHERE gr_id = :pid ',
                [frmPrincipal.DBLogin.UserID,
                 frmPrincipal.DBLogin.UserID,
                 sdqConsulta.FieldByName('gr_id').AsInteger]);

  sdqConsulta.Refresh;
end;

{-----------------------------------------------------------------------------
  Procedure: fpObsAprobacionShow
  Author:    racastro
  Date:      07-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.fpObsAprobacionShow(Sender: TObject);
begin
  memObsAprobacion.Clear;
end;

{-----------------------------------------------------------------------------
  Procedure: CargarValoresHC
  Author:    racastro
  Date:      10-Jul-2008
  Arguments: AForm: TFormEstudios
  Result:    None
  Purpose:   Carga los valores de la HHCC
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.CargarValoresHC(AForm: TFormEstudios);
begin
  with TfrmHistoriaClinica(AForm) do
  begin
    pnlCUIT.Caption             := PonerGuiones(sdqConsulta.FieldByName('em_cuit').AsString);
    pnlRSocial.Caption          := sdqConsulta.FieldByName('em_nombre').AsString;
    pnlContrato.Caption         := sdqConsulta.FieldByName('es_contrato').AsString;
    pnlEstableciCodigo.Caption  := sdqConsulta.FieldByName('es_nroestableci').AsString;
    pnlEstableciDesc.Caption    := sdqConsulta.FieldByName('es_nombre').AsString;
    pnlFechaText.Caption        := DateFormat(sdqConsulta.FieldByName('et_fecha').AsDateTime, dfLong );
    pnlCUIL.Caption             := PonerGuiones(sdqConsulta.FieldByName('tj_cuil').AsString);
    pnlNombre.Caption           := sdqConsulta.FieldByName('tj_nombre').AsString;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbVerEstudioClick
  Author:    racastro
  Date:      08-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Visualiza el estudio
-----------------------------------------------------------------------------}

procedure TfrmGestionReconfirmacion.tbVerEstudioClick(Sender: TObject);
var
  FormEstudios : TFormEstudios;
  sForm        : String;
begin
(* Suspendido el 27/08/08
  // Verifico que tenga un estudio asociado
  if sdqConsulta.FieldByName('gr_idestrab').IsNull then
  begin
    MsgBox('No hay estudio cargado', MB_ICONERROR);
    Exit;
  end;
*)
  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty then
    Exit;

  sForm := sdqConsulta.FieldByName('es_formulario').AsString ;

  Case ArrayPos(sForm, ['HC', 'AUDIO', 'RESP']) OF
      0: begin
        FormEstudios := TfrmHistoriaClinica.Create(Self);
        CargarValoresHC(FormEstudios);
      end;
      1: FormEstudios := TfrmEstAudiometria.Create(Self);
      2: FormEstudios := TfrmEstRespiratorio.Create(Self);
    else FormEstudios := TfrmEstudioDef.Create(Self);
  end;

  With FormEstudios do
    Try
      with DatosEstudio do
      begin
        if sdqConsulta.FieldByName('et_resultado').IsNull Then
          Resultado := -1
        else
          Try
             Resultado := sdqConsulta.FieldByName('et_resultado').AsCurrency;
          Except
             On E: Exception do ErrorMsg( E, 'Error con el Tipo de dato del Resultado' + #13 + 'Verifique el resultado del estudio, porque seguramente este mal cargado');
          end;

        ResNormal      := sdqConsulta.FieldByName('et_tipores').AsString = 'N';
        Prestador      := sdqConsulta.FieldByName('et_prestador').AsString;
        Periodo        := sdqConsulta.FieldByName('et_periodo').AsString;
        Tipo           := sdqConsulta.FieldByName('et_tipo').AsString;
        Reconfirmacion := unFraReconfirmacion.Reconfirmacion( sdqConsulta.FieldByName('et_rec_fecha').AsDateTime,
                                                              sdqConsulta.FieldByName('et_rec_estudio').AsString,
                                                              sdqConsulta.FieldByName('et_idcarpetaamp').AsInteger );
        FechaRecPrest:= sdqConsulta.FieldByName('et_fecharecprest').AsDateTime;
        FechaRecML:= sdqConsulta.FieldByName('et_fecharecml').AsDateTime;

        IDCarpetaAMP := sdqConsulta.FieldByName('et_idcarpetaamp').AsInteger;
        IDDetalleArchivo := sdqConsulta.FieldByName('et_iddetallearchivo').AsInteger;
      end;

      With ClaveEstudio do begin
        Cuit      := sdqConsulta.FieldByName('em_cuit').AsString;
        Estableci := sdqConsulta.FieldByName('es_nroestableci').AsInteger;
        Cuil      := sdqConsulta.FieldByName('tj_cuil').AsString;
        Fecha     := sdqConsulta.FieldByName('et_fecha').AsDateTime;
        Estudio   := sdqConsulta.FieldByName('es_codigo').AsString;
      end;

      Execute(maConsulta);
    Finally
      Free;
    End;
end;

procedure TfrmGestionReconfirmacion.tbEliminarClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty or
     (not sdqConsulta.FieldByName('gr_fechabaja').IsNull) then
    Exit;

  // Verifico estado
  if not AreIn(sdqConsulta.FieldByName('gr_estado').AsString, ['PA', 'PG']) then
  begin
    MsgBox('El estudio debe estar Pendiente de Autorización ó de Asignación ' +
           'a fin de poder darlo de baja.', MB_ICONERROR);
    Exit;
  end;

  EjecutarSQLEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                '   SET gr_usubaja = :pusuario, ' +
                '       gr_fechabaja = SYSDATE' +
                ' WHERE gr_id = :pid ',
                [frmPrincipal.DBLogin.UserID,
                 sdqConsulta.FieldByName('gr_id').AsInteger]);

  tbRefrescarClick(Sender);
end;

procedure TfrmGestionReconfirmacion.tbTerminadoEspClick(Sender: TObject);
var
  direccionDestino : String;
  asunto : String;
  texto : String;
  cantidadpresupuesto : Integer;
begin
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty or
     (not sdqConsulta.FieldByName('gr_fechabaja').IsNull) or
     (sdqConsulta.FieldByName('gr_estado').AsString = 'TE') or
     not (sdqConsulta.FieldByName('lote').IsNull)
  then
    Exit;

  // Verifico estado
  if AreIn(sdqConsulta.FieldByName('gr_estado').AsString, ['PA', 'RZ', 'AE']) then
  begin
    MsgBox('No puede terminarse un estudio en este estado. ', MB_ICONERROR);
    Exit;
  end;

  // Verifico estado
  if AreIn(sdqConsulta.FieldByName('gr_estado').AsString, ['PG']) then
  begin
    MsgBox('El estudio está como "Pendiente de Asignación". ' +  #13#10 +
           'Si desea terminarlo primero debe hacer click en "Anular como Asignable a Prestador".', MB_ICONERROR);
    Exit;
  end;

  if fpMotivoRechazo.ShowModal = mrOk then
  begin
    // Lo da por terminado manualmente
    cantidadpresupuesto := ValorSqlIntegerEx(
                  ' SELECT COUNT(*) '+
                  '   FROM comunes.csp_solicitudpresupuesto, hys.hgr_gestionreconfirmacion '+
                  '  WHERE sp_id IN (SELECT gr_idpresupuesto '+
                  '                    FROM hys.hgr_gestionreconfirmacion '+
                  '                   WHERE gr_id = :pid) '+
                  '    AND sp_fechabaja IS NULL '+
                  '    AND gr_estado <> ''TE'' '+
                  '    AND gr_idpresupuesto = sp_id ',
                  [sdqConsulta.FieldByName('gr_id').AsInteger]);

    EjecutarSQLEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                  '   SET gr_estado = ''TE'', ' +
                  '       gr_fechaultpresup = NULL, ' +
                  '       gr_idmotivorechazo = :pidmotivo, ' +
                  '       gr_observacion = :pobservacion, ' +
                  '       gr_usumodif = :pusuario, ' +
                  '       gr_fechamodif = SYSDATE ' +
                  ' WHERE gr_id = :pid ',
                  [fraMotivo.Value,
                   memObsRechazo.Lines.Text,
                   frmPrincipal.DBLogin.UserID,
                   sdqConsulta.FieldByName('gr_id').AsInteger]);

    if cantidadpresupuesto = 1 then
    begin

      EjecutarSQLEx(' UPDATE comunes.csp_solicitudpresupuesto ' +
                    ' SET sp_motivobaja = ''Reconfirmación Anulada Manualmente'', sp_fechabaja = sysdate, sp_usubaja = ' + SqlValue(Sesion.LoginName) +
                    ' WHERE sp_id IN (SELECT gr_idpresupuesto ' +
                    '                 FROM hys.hgr_gestionreconfirmacion ' +
                    '                 WHERE gr_id = :pid) ' +
                    ' AND sp_fechabaja IS NULL ',
                    [sdqConsulta.FieldByName('gr_id').AsInteger]);

      direccionDestino := ValorSql(
                    ' SELECT art.varios.get_direccionesenviomail(''AMP_SOLPRE'') '+
                    '   FROM dual ');
      asunto := '  Baja de Solicitud de Presupuesto';
      texto := ' Empresa: ' +sdqConsulta.FieldByName('em_cuit').AsString+
               ' - ' + sdqConsulta.FieldByName('em_nombre').AsString +' ('+
                sdqConsulta.FieldByName('es_contrato').AsString+ ')'+ #13#10+
               ' Establecimiento: '+ sdqConsulta.FieldByName('es_nroestableci').AsString + #13#10 +
               ' Establecimiento: '+ sdqConsulta.FieldByName('es_nombre').AsString+ #13#10 +
               ' Motivo: '+fraMotivo.Descripcion+ #13#10+
               ' Código Postal: '+ sdqConsulta.FieldByName('es_cpostal').AsString + #13#10 +
               ' Localidad: '+ sdqConsulta.FieldByName('es_localidad').AsString;

      EnviarMailBD(direccionDestino, asunto , [oBodyIsRTF], texto);

    end;
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmGestionReconfirmacion.tbCircuitoClick(Sender: TObject);
begin
  Abrir(TfrmCircuitoReconf, frmCircuitoReconf, tmvMDIChild, nil);
end;

procedure TfrmGestionReconfirmacion.fpEspAdicionalesShow(Sender: TObject);
begin
  sdqEspecialistas.Open;
  cbEspecialistas.ClearChecks;
end;

procedure TfrmGestionReconfirmacion.tbVerDomicilioTrabajadorClick(
  Sender: TObject);
begin
  inherited;
  if (not sdqConsulta.Active) or
     sdqConsulta.IsEmpty then
    Exit;
  vclExtra.LockControls([fraTrabajadorDomic,fraDomicTrabajador],True);
  fraTrabajadorDomic.CUIL := sdqConsulta.FieldByName('tj_cuil').AsString;
  fraDomicTrabajador.Cuil := fraTrabajadorDomic.CUIL;
  fpDomicilioTrabajador.ShowModal;
end;

end.

