{-----------------------------------------------------------------------------
 Unit Name: unSeguimientoEstudios
 Author:    racastro
 Date:      02-Jul-2008
 Purpose:   Seguimientos (Auditoría) de Estudios
 History:   Versión 3 - Uso de checkboxes en la grilla de estudios
 History:   Versión 3.1 - Uso de checkboxes en la grilla de lotes
-----------------------------------------------------------------------------}

unit unSeguimientoEstudios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraEstudio, StdCtrls, Mask, ToolEdit, DateComboBox,
  CustomDlgs, unFraCodigoDescripcion, General, unfraEstablecimiento_OLD, unArtFrame, unArtDbFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, JvgGroupBox, FormPanel, unfraPrestadorAMPCuit, ExComboBox, PatternEdit,
  IntEdit, FSPageControl, Menus, unFraEmpresa, Buttons, unFraRiesgo, JvExMask, JvToolEdit, JvDBLookup, JvExControls,
  JvComponent, unFraCodDesc, GroupCheckBox, CheckLst, unArt, ARTCheckListBox, JvExExtCtrls, JvNetscapeSplitter,
  JvSplitter, DateTimeFuncs, JvSyncSplitter, RXCtrls, JvxCheckListBox, unExportPDF, unComunes, JvButton,
  JvTransparentButton, JvExButtons, JvButtons, sqlFuncs, unSesion;

type
  TfrmSeguimientoEstudios = class(TfrmCustomConsulta)
    ordTrabajadores: TSortDialog;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    fraPrestador: TfraPrestadorAMPCuit;
    Label6: TLabel;
    Label1: TLabel;
    edLoteDesde: TIntEdit;
    gbTrabajadores: TJvgGroupBox;
    dbgTrabajadores: TArtDBGrid;
    tbTrabajadores: TToolBar;
    fraEmpresa: TfraEmpresa;
    lbEstableci: TLabel;
    sdqTrabajadoresLote: TSDQuery;
    dsTrabajadoresLote: TDataSource;
    sdqEstudiosTrabajador: TSDQuery;
    dsEstudiosTrabajador: TDataSource;
    tbOrdenarTrabLote: TToolButton;
    dbgEstudiosTrabajador: TArtDBGrid;
    ToolButton1: TToolButton;
    fraTrabajador: TfraCodDesc;
    tbRefrescarTrab: TToolButton;
    ToolButton2: TToolButton;
    fpDatosEstudio: TFormPanel;
    Bevel1: TBevel;
    btnSalir: TButton;
    sdqListaEstudios: TSDQuery;
    exdListaEstudios: TExportDialog;
    sdqListaEstudiosExport: TSDQuery;
    dsListaEstudiosExport: TDataSource;
    chkVerCerrados: TCheckBox;
    tbModifEst: TToolButton;
    ToolButton9: TToolButton;
    fpModificarEstudio: TFormPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    sbMantMotivosDebitoModifEst: TSpeedButton;
    btnAceptarModifEst: TButton;
    edFechaRealizacionModifEst: TDateComboBox;
    rgAccionModifEst: TRadioGroup;
    fraMotivosDebitoModifEst: TfraCodigoDescripcion;
    btnCancelar: TButton;
    ToolButton7: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    btnReiniciarEstudio: TButton;
    tbReiniciarEstTrab: TToolButton;
    edLoteHasta: TIntEdit;
    Label10: TLabel;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    chbReconfirmarModifEst: TCheckBox;
    sdqEstudios: TSDQuery;
    dsEstudios: TDataSource;
    fpMotivoDebito: TFormPanel;
    Bevel3: TBevel;
    sbMantMotivosDebito: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    fraMotivosDebito: TfraCodigoDescripcion;
    dbgListaEstudiosExport: TDBGrid;
    Panel1: TPanel;
    Label5: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label3: TLabel;
    edFechaRealizacion: TDateComboBox;
    ToolBar1: TToolBar;
    tbAprobarTodos: TToolButton;
    tbAnularAprobarTodo: TToolButton;
    ToolButton34: TToolButton;
    tbDebitarTodos: TToolButton;
    tbAnularDebitarTodos: TToolButton;
    ToolButton35: TToolButton;
    tbExportarEstudios: TToolButton;
    tbNotificarML: TToolButton;
    ToolButton32: TToolButton;
    tbGrabarEstudios: TToolButton;
    grdEstudios: TArtDBGrid;
    fraMotivoDebitado: TfraCodigoDescripcion;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    chbEnfProfModifEst: TCheckBox;
    sdqConsultaUnificada: TSDQuery;
    dsConsultaUnificada: TDataSource;
    Label18: TLabel;
    edDesdeFFEA: TDateComboBox;
    edHastaFFEA: TDateComboBox;
    Label19: TLabel;
    Label20: TLabel;
    edDesdeFCDA: TDateComboBox;
    Label21: TLabel;
    edHastaFCDA: TDateComboBox;
    tbNotifAusentes: TToolButton;
    ToolButton14: TToolButton;
    chkSinGestionar: TCheckBox;
    chbAuditPend: TCheckBox;
    tnNoGestionarAusentes: TToolButton;
    tbOrdenarAuditar: TToolButton;
    SortDialogAuditar: TSortDialog;
    cbEmpresasVIP: TCheckBox;
    cbEmpresasNoVip: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarTrabLoteClick(Sender: TObject);
    procedure tbRefrescarTrabClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
    procedure sbMantMotivosDebitoClick(Sender: TObject);
    procedure dbgEstudiosTrabajadorGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GenCartaDocTrabAusentes;
    procedure btnSalirClick(Sender: TObject);
    procedure CargarListaEstudios(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure ExtenderEstudios(estudio, cuil: string);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rgAccionModifEstClick(Sender: TObject);
    procedure RecuperarFechaUltPresupuesto (Estado: String;
                                            Contrato,
                                            IDEstableci: Integer;
                                            Operativo,
                                            CUIT: String;
                                            NroEstableci: Integer);
    procedure btnAceptarModifEstClick(Sender: TObject);
    procedure tbModifEstClick(Sender: TObject);
    procedure dbgEstudiosTrabajadorDblClick(Sender: TObject);
    procedure btnReiniciarEstudioClick(Sender: TObject);
    procedure tbReiniciarEstTrabClick(Sender: TObject);
    procedure fpMotivoDebitoShow(Sender: TObject);
    procedure dbgTrabajadoresGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fpResultadoEstudioShow(Sender: TObject);
    procedure tbAprobarTodosClick(Sender: TObject);
    procedure tbAnularAprobarTodoClick(Sender: TObject);
    procedure tbDebitarTodosClick(Sender: TObject);
    procedure tbAnularDebitarTodosClick(Sender: TObject);
    procedure grdEstudiosCellClick(Column: TColumn);
    procedure grdEstudiosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbGrabarEstudiosClick(Sender: TObject);
    procedure tbExportarEstudiosClick(Sender: TObject);
    procedure tbNotificarMLClick(Sender: TObject);
    procedure fpDatosEstudioShow(Sender: TObject);
    procedure sdqEstudiosAfterScroll(DataSet: TDataSet);
    procedure chbReconfirmarModifEstClick(Sender: TObject);
    procedure chbEnfProfModifEstClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure fpDatosEstudioEnter(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridCellClick(Column: TColumn);
    procedure tbNotifAusentesClick(Sender: TObject);
    procedure tbSinGestionarClick(Sender: TObject);
    procedure tnNoGestionarAusentesClick(Sender: TObject);
    procedure grdEstudiosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbOrdenarAuditarClick(Sender: TObject);
  private
    FFiltros: String;
    FReiniciar: Boolean;
    NotificarList: TStringList;
    AprobadoList: TStringList;
    DebitoList: TStringList;
    ReconfirmaList: TStringList;
    EnfProfesionalList: TStringList;
    procedure OnEmpresaChange(Sender : TObject);
    procedure OnEstablecimientoChange(Sender : TObject);
    procedure ActualizarAsignaciones (IDEstudio, IDSublote: Integer; Fecha: TDate);
    procedure RegistrarSiniestro (CUIT, CUIL: String; Contrato, Lote: Integer);
    procedure RegistrarEstudio(aId: integer; aUsuario: String);
  protected
    procedure RefreshData; override;
  public
  end;

const
  ERR_FECHAS = 'La Fecha de Realización no puede se menor que la Fecha de Asignación (Notificación)';
var
  frmSeguimientoEstudios : TfrmSeguimientoEstudios;

implementation

uses unPrincipal, unDmPrincipal, AnsiSql, unRptInformeAPrestador,
  unVisualizador, unContratoTrabajador, unManMotivosRechazo,
  unRptReclamoEstudios, unListaEMail, unRptInformeAEmpresa, ArchFuncs,
  unGeneracionCartasAdmin, unMoldeEnvioMail, unRptNotifAusentesPrest,
  unObsSubLote;

{$R *.DFM}

{-----------------------------------------------------------------------------
  Procedure: RefreshData
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.RefreshData;
begin

  FFiltros := '';

  if not chkVerCerrados.Checked then
  begin
    FFiltros := '  AND el_fechaaprobado IS NOT NULL ' ;
    FFiltros := FFiltros + '  AND el_estado = ''B'' ';
  end
  else
    FFiltros := FFiltros + '  AND el_estado IN(SELECT de_codigo ' +
                           '                     FROM hys.hde_descripcionestadolote ' +
                           '                    WHERE de_versegestudio = ''S'') ';

  if fraEmpresa.IsSelected then
    FFiltros := FFiltros + '  AND em_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text);

  if fraEstablecimiento.IsSelected then
    FFiltros := FFiltros + '  AND es_nroestableci = ' + fraEstablecimiento.edCodigo.TextSql + ' ';

    FFiltros := FFiltros + SqlBetween('  AND le_id ', edLoteDesde.Text, edLoteHasta.Text);

  if fraPrestador.IsSelected then
    FFiltros := FFiltros + '  AND ca_identificador = ' + SqlValue(fraPrestador.Value) + ' ';

  if cbEmpresasVIP.Checked then
    FFiltros := FFiltros +
       ' AND art.afiliacion.is_empresavip(art.afiliacion.get_contratovigente(em_cuit)) = ''S'' ';

  if cbEmpresasNoVIP.Checked then
    FFiltros := FFiltros +
       ' AND art.afiliacion.is_empresavip(art.afiliacion.get_contratovigente(em_cuit)) = ''N'' ';

  if chkSinGestionar.Checked then
    FFiltros := FFiltros + '  AND el_ffea IS NOT NULL ' +
                           '  AND el_fechanogestionaus IS NULL ' +
                           '  AND el_fcda IS NULL ' +
                           '  AND EXISTS (SELECT 1 FROM afi.aco_contrato WHERE co_contrato = es_contrato and co_estado in (1,9)) ';

  if chbAuditPend.Checked then
    FFiltros := FFiltros + '  AND el_ffea IS NULL ' +
                           '  AND EXISTS (SELECT 1 ' +
                           '                FROM hys.hdl_detallelote h1' +
                           '               WHERE (   (h1.dl_fechabaja IS NULL) ' +
                           '                      OR (    (h1.dl_fechabaja IS NOT NULL) ' +
                           '                          AND EXISTS ( ' +
                           '                                 SELECT 1 ' +
                           '                                   FROM hys.hel_estadolote h1, hys.hrl_relevamientolote r1 ' +
                           '                                  WHERE h1.el_estado IN (SELECT de_codigo ' +
                           '                                                           FROM hys.hde_descripcionestadolote ' +
                           '                                                          WHERE de_versegestudio = ''S'') ' +
                           '                                    AND r1.rl_id = h1.el_rlid ' +
                           '                                    AND r1.rl_idestableci = h1.dl_idestableci ' +
                           '                                    AND h1.el_idlote = h1.dl_idlote)' +
                           '                         ) ' +
                           '                     ) ' +
                           '                 AND h1.dl_fecharealizacion IS NULL ' +
                           '                 AND h1.dl_idlote = le_id ' +
                           '                 AND h1.dl_idempresa = em_id ' +
                           '                 AND h1.dl_idestableci = es_id) ';

  FFiltros := FFiltros + SqlBetweenDateTime(' AND el_ffea ', edDesdeFFEA.Date, edHastaFFEA.Date, True);
  FFiltros := FFiltros + SqlBetweenDateTime(' AND el_fcda ', edDesdeFCDA.Date, edHastaFCDA.Date, True);

  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text := 'SELECT DISTINCT le_id, el_estado, le_fechanotifiempresa, ' +
                          '                ca_identificador, ca_descripcion, ca_telefono, ' +
                          '                le_fechanotificacion, TRUNC(el_fechaaprobado) el_fechaaprobado, ' +
                          '                em_id, em_cuit, em_nombre, el_operativo, ' +
                          '                es_id, es_nroestableci, es_nombre, ' +
                          '                art.afiliacion.get_contratovigente(em_cuit) as contrato, ' +
                          '                DECODE (el_operativo, ''R'', ''RECONF'', ''AMP'') origen, ' +
//                          '                el_fechabaja, el_operativo ' +
{- NUEVA LÓGICA DE ASIGNACIONES !!!! -----------------------------------------}
                          '                el_fechabaja, el_operativo, el_id, el_ffea, el_fcda, el_fechanogestionaus ' +
{-----------------------------------------------------------------------------}
                          '           FROM hys.hle_loteestudio, hys.hdl_detallelote, hys.hrl_relevamientolote, ' +
                          '                hys.hel_estadolote, art.cpr_prestador, afi.aem_empresa, ' +
                          '                afi.aes_establecimiento ' +
                          '          WHERE dl_idlote = le_id ' +
                          '            AND rl_idestableci = dl_idestableci ' +
                          '            AND el_rlid = rl_id ' +
                          '            AND el_idlote = le_id ' +
                          '            AND ca_identificador = le_idprestador ' +
                          '            AND em_id = dl_idempresa ' +
                          '            AND es_id = dl_idestableci ' +
                                           FFiltros +
                          SortDialog.OrderBy;

  inherited;

  sdqConsultaUnificada.Sql.Clear;
  sdqConsultaUnificada.Sql.Text :=
    'SELECT DISTINCT le_id "LOTE", ca_identificador "PRESTADOR", ' +
    '                ca_descripcion "NOMBRE PRESTADOR", ' +
    '                le_fechanotificacion "F.NOTIF.PREST", ' +
    '                TRUNC(el_fechaaprobado) "F.APROB.PREST.", em_cuit "CUIT", ' +
    '                em_nombre "RAZON SOCIAL", es_nroestableci "ESTAB.", ' +
    '                es_nombre "NOMBRE ESTABLECIMIENTO", ' +
    '                le_fechanotifiempresa "F.NOTIF.EMPRESA", ' +
    '                art.afiliacion.get_contratovigente(em_cuit) "CONTRATO", ' +
    '                tj_cuil "CUIL", tj_nombre "NOMBRE TRABAJADOR", ' +
    '                es_codigo "ESTUDIO", es_descripcion "DESCRIPCION ESTUDIO", ' +
    '                dl_fecharealizacion "F.REALIZACION", ' +
    '                NVL2(dl_fecharealizacion, ' +
    '                     NVL2(dl_motivodebito, ''DEBITADO'', ''APROBADO''), ' +
    '                     '''') "ESTADO", ' +
    '                dl_fechaaprobacion "F.APROBACION", ' +
    '                NVL2(vo_facturatipo, ' +
    '                     vo_facturatipo || ''-'' || vo_facturaestable ' +
    '                     || ''-'' || vo_facturanro, ' +
    '                     NULL) "FACTURA", ' +
    '                vo_fechafactura "F.FACTURA", dl_debito "DEBITO", ' +
    '                dl_fechadebito "F.DEBITO", mr_descripcion "MOTIVO DEBITO", ' +
    '                NVL2(dl_motivodebito, vo_notadebito, NULL) "NOTA DEBITO", ' +
    '                DECODE (el_operativo, ''R'', ''RECONF'', ''AMP'') origen, ' +
    '                el_ffea "F.Fin Est.Audit.", el_fcda "F.Carta Doc.Aus.", el_fechanogestionaus "F.No Gestión Aus." ' +
    '           FROM hys.hle_loteestudio, hys.hdl_detallelote, ' +
    '                hys.hrl_relevamientolote, hys.hel_estadolote, ' +
    '                art.cpr_prestador, afi.aem_empresa, ' +
    '                afi.aes_establecimiento aes, comunes.ctj_trabajador, ' +
    '                art.aes_estudios est, hys.hmr_motivorechazo, ' +
    '                art.sif_itemfacturaamp, art.svo_volantes ' +
    '          WHERE dl_idlote = le_id ' +
    '            AND rl_idestableci = dl_idestableci ' +
    '            AND el_rlid = rl_id ' +
    '            AND el_idlote = le_id ' +
    '            AND ca_identificador = le_idprestador ' +
    '            AND em_id = dl_idempresa ' +
    '            AND aes.es_id = dl_idestableci ' +
    '            AND tj_id = dl_idtrabajador ' +
    '            AND TO_NUMBER(es_codigo) = dl_idestudio ' +
    '            AND mr_id(+) = dl_motivodebito ' +
    '            AND if_id(+) = dl_iddetvolante ' +
    '            AND vo_volante(+) = if_idvolante ' +
    '            AND (   (dl_fechabaja IS NULL) ' +
    '                 OR (    (dl_fechabaja IS NOT NULL) ' +
    '                     AND el_estado IN(SELECT de_codigo ' +
    '                                        FROM hys.hde_descripcionestadolote ' +
    '                                       WHERE de_versegestudio = ''S''))) ' +
//    '            AND el_fechaaprobado IS NOT NULL ' +
                 FFiltros;

  fraTrabajador.Enabled := not sdqConsulta.IsEmpty;
end;

{-----------------------------------------------------------------------------
  Procedure: FormCreate
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.FormCreate(Sender: TObject);
begin
  inherited;

  tbSalir.Left := tbSalir.Left + 100;
  
  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEmpresa.ContratoActivo := True;
  fraEmpresa.ShowBajas      := True;

  fraEstablecimiento.OnChange := OnEstablecimientoChange;
  gbTrabajadores.Collapsed := true;
  fraTrabajador.Enabled    := false;

  with fraMotivosDebito do
  begin
    TableName := 'hys.hmr_motivorechazo';
    FieldId := 'mr_id';
    FieldCodigo := 'mr_id';
    FieldDesc := 'mr_descripcion';
    FieldBaja := 'mr_fechabaja';
    ShowBajas := false;
    ExtraCondition := ' AND mr_tiporechazo = ''D'' ';
  end;

  with fraMotivosDebitoModifEst do
  begin
    TableName := 'hys.hmr_motivorechazo';
    FieldId := 'mr_id';
    FieldCodigo := 'mr_id';
    FieldDesc := 'mr_descripcion';
    FieldBaja := 'mr_fechabaja';
    ShowBajas := false;
    ExtraCondition := ' AND mr_tiporechazo = ''D'' ';
  end;

  with fraMotivoDebitado do
  begin
    TableName := 'hys.hmr_motivorechazo';
    FieldId := 'mr_id';
    FieldCodigo := 'mr_id';
    FieldDesc := 'mr_descripcion';
    FieldBaja := 'mr_fechabaja';
    ShowBajas := false;
    ExtraCondition := ' AND mr_tiporechazo = ''D'' ';
  end;

  NotificarList := TStringList.Create;
  AprobadoList := TStringList.Create;
  DebitoList:= TStringList.Create;
  ReconfirmaList:= TStringList.Create;
  EnfProfesionalList:= TStringList.Create;
end;

{-----------------------------------------------------------------------------
  Procedure: FSFormDestroy
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.FSFormDestroy(Sender: TObject);
begin
  NotificarList.Free;
  AprobadoList.Free;
  DebitoList.Free;
  ReconfirmaList.Free;
  EnfProfesionalList.Free;

  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: OnEmpresaChange
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.mskCUIT.Text ;
  sdqConsulta.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: OnEstablecimientoChange
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.OnEstablecimientoChange(Sender: TObject);
begin
  sdqConsulta.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: tbLimpiarClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraEstablecimiento.Clear;
  fraPrestador.Clear;
  edLoteDesde.Clear;
  edLoteHasta.Clear;
  sdqTrabajadoresLote.Close;
  sdqEstudiosTrabajador.Close;
  chkVerCerrados.Checked := false;
  edDesdeFFEA.Clear;
  edHastaFFEA.Clear;
  edDesdeFCDA.Clear;
  edHastaFCDA.Clear;
  chkSinGestionar.Checked := false;

  inherited;
end;

procedure TfrmSeguimientoEstudios.tbOrdenarTrabLoteClick(Sender: TObject);
begin
  ordTrabajadores.Execute
end;

{-----------------------------------------------------------------------------
  Procedure: tbRefrescarTrabClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbRefrescarTrabClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  sdqEstudiosTrabajador.Close;

  with sdqTrabajadoresLote do
  begin
    Close;

    SQL.Clear;
    SQL.Add('SELECT DISTINCT dl_idlote, dl_idempresa, dl_idestableci, tj_id, ' +
            '                tj_cuil, tj_nombre, dl_idtrabajador, dl_fechabaja ' +
            '           FROM hys.hdl_detallelote, comunes.ctj_trabajador ' +
            '          WHERE (   (dl_fechabaja IS NULL) ' +
            '                 OR (    (dl_fechabaja IS NOT NULL) ' +
            '                     AND EXISTS(SELECT 1 ' +
            '                                  FROM hys.hel_estadolote, hys.hrl_relevamientolote ' +
            '                                 WHERE el_estado IN(SELECT de_codigo ' +
            '                                                      FROM hys.hde_descripcionestadolote ' +
            '                                                     WHERE de_versegestudio = ''S'') ' +
            '                                   AND rl_id = el_rlid ' +
            '                                   AND rl_idestableci = dl_idestableci ' +
            '                                   AND el_idlote = dl_idlote))) ' +
            '            AND tj_id = dl_idtrabajador ' +
            '            AND dl_idlote = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger) +
            '            AND dl_idempresa = ' + SqlValue(sdqConsulta.FieldByName('em_id').AsInteger) +
            '            AND dl_idestableci = ' + SqlValue(sdqConsulta.FieldByName('es_id').AsInteger) +
            iif (fraTrabajador.IsEmpty, '', '            AND tj_cuil = ' + SqlValue(fraTrabajador.Codigo)) +
            '       ORDER BY dl_idlote, dl_idempresa, dl_idestableci, tj_nombre');

    Open
  end;

  sdqEstudiosTrabajador.Open
end;

{-----------------------------------------------------------------------------
  Procedure: sdqConsultaAfterScroll
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: DataSet: TDataSet
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.sdqConsultaAfterScroll(
  DataSet: TDataSet);
begin
  with fraTrabajador do
  begin
    ShowBajas := true;
    Clear;
    Propiedades.SQL := 'SELECT DISTINCT tj_id as id, tj_cuil as codigo, ' +
                       '                tj_nombre as descripcion, null as baja, ' +
                       '                dl_idlote, dl_idempresa, dl_idestableci ' +
                       '           FROM hys.hdl_detallelote, comunes.ctj_trabajador ' +
                       '          WHERE dl_fechabaja IS NULL ' +
                       '            AND tj_id = dl_idtrabajador ' +
                       '            AND dl_idlote = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger) +
                       '            AND dl_idempresa = ' + SqlValue(sdqConsulta.FieldByName('em_id').AsInteger) +
                       '            AND dl_idestableci = ' + SqlValue(sdqConsulta.FieldByName('es_id').AsInteger);
  end;

  sdqTrabajadoresLote.Close;
  sdqEstudiosTrabajador.Close;
end;

{-----------------------------------------------------------------------------
  Procedure: ToolButton2Click
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.ToolButton2Click(Sender: TObject);
begin
  fraTrabajador.Clear
end;

{-----------------------------------------------------------------------------
  Procedure: sbMantMotivosDebitoClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.sbMantMotivosDebitoClick(Sender: TObject);
var
  frmMotivo: TfrmManMotivosRechazo;
begin
  frmMotivo := TfrmManMotivosRechazo.Create( Self );
  with frmMotivo do
    try
      FormStyle := fsNormal;
      if Visible then
        Hide;
      Caption := 'Motivos de Débito de Estudios';
      FTipo := 'D';
      tbRefrescarClick(nil);
      ShowModal;
      BringToFront;
    finally
      Free;
    end;
end;

{-----------------------------------------------------------------------------
  Procedure: dbgEstudiosTrabajadorGetCellParams
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.dbgEstudiosTrabajadorGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqEstudiosTrabajador.FieldByName ('dl_fecharealizacion').IsNull then
  begin
    if sdqEstudiosTrabajador.FieldByName ('dl_debito').AsString <> 'S' then
      AFont.Color := clBlue
    else
      AFont.Color := clTeal;

    if Highlight then
    begin
      AFont.Color := clLime;
      Background := clNavy
    end;

    if sdqEstudiosTrabajador.FieldByName ('factura').IsNull then
      AFont.Style := []
    else
      AFont.Style := [fsBold];
  end
end;

{-----------------------------------------------------------------------------
  Procedure: GenCartaDocTrabAusentes
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.GenCartaDocTrabAusentes;
begin
  with TfrmGeneracionCartasAdmin.Create(Self) do
  try
    fraEmpresa.Value := sdqConsulta.FieldByName('em_id').AsInteger;
    IDEstableci := sdqConsulta.FieldByName('es_id').AsInteger;
    IDLote := sdqConsulta.FieldByName('le_id').AsInteger;
    IdCarta := ART_EMPTY_ID;

    CodArea := AREA_MLB;
    Preparar(IdCarta);

    Mostrar
  finally
    free;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: btnSalirClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.btnSalirClick(Sender: TObject);
begin
  fpDatosEstudio.ModalResult := mrOk;
  tbRefrescarClick(Sender);
end;

{-----------------------------------------------------------------------------
  Procedure: CargarListaEstudios
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.CargarListaEstudios(Sender: TObject);
begin
  AprobadoList.Clear;
  DebitoList.Clear;
  ReconfirmaList.Clear;
  EnfProfesionalList.Clear;

  with sdqEstudios do
  begin
    Active := false;
    ParamByName('pidlote').Value     := sdqConsulta.FieldByName('le_id').AsInteger;
    ParamByName('pidempresa').Value  := sdqConsulta.FieldByName('em_id').AsInteger;
    ParamByName('pidestableci').Value:= sdqConsulta.FieldByName('es_id').AsInteger;

    Active := true;
  end;

  AprobadoList.Clear;
  DebitoList.Clear;
  ReconfirmaList.Clear;
  EnfProfesionalList.Clear;
end;

{-----------------------------------------------------------------------------
  Procedure: tbModificarClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbModificarClick(Sender: TObject);
begin

  if sdqConsulta.FieldByName ('el_estado').AsString = 'T' then
  begin
    if MsgBox ('El lote está terminado. ¿Desea auditarlo de todas formas? ', MB_ICONINFORMATION + MB_YESNO) = IDNO then
    Exit
  end;

  tbRefrescarTrabClick(Sender);
  fpDatosEstudio.ShowModal
end;

{-----------------------------------------------------------------------------
  Procedure: ExtenderEstudios
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: estudio, cuil: string
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.ExtenderEstudios(estudio, cuil: string);
var
  BM : TBookmark;
begin
  if ExisteSqlEx ('SELECT 1 ' +
                  '  FROM hys.hea_estudioasociado, art.aes_estudios aes1 ' +
                  ' WHERE ea_estudiobase = aes1.es_id ' +
                  '   AND aes1.es_codigo = :pbase ',
                  [estudio]) then
  begin
    BM := sdqEstudios.GetBookmark;
    try
      with sdqEstudios do
      begin
        DisableControls;

        First;
        while not Eof do
        begin
          if (FieldByName('tj_cuil').AsString = cuil) and
             ExisteSqlEx ('SELECT 1 ' +
                          '  FROM hys.hea_estudioasociado, art.aes_estudios aes1, art.aes_estudios aes2 ' +
                          ' WHERE ea_estudiobase = aes1.es_id ' +
                          '   AND ea_estudioasociado = aes2.es_id ' +
                          '   AND aes1.es_codigo = :pbase ' +
                          '   AND aes2.es_codigo = :pidasociado ',
                          [estudio,
                           FieldByName('es_codigo').AsString]) and
             (AprobadoList.IndexOf(FieldByName('dl_id').AsString) = -1) then
            AprobadoList.Add(FieldByName('dl_id').AsString);

          Next
        end;

        GotoBookmark(BM);
        EnableControls
      end
    finally
      sdqEstudios.FreeBookmark(BM);
    end
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: GridGetCellParams
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName ('el_estado').AsString = 'T' then
  begin
    AFont.Color := clBlue;
    if Highlight then
    begin
      AFont.Color := clWhite;
      Background := clBlue
    end
  end
  else begin
    if AreIn (sdqConsulta.FieldByName ('el_estado').AsString, ['O', 'Z', 'J']) then
    begin
      AFont.Color := clRed;
      if Highlight then
        Background := clNavy
    end
  end
end;

{-----------------------------------------------------------------------------
  Procedure: rgAccionModifEstClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.rgAccionModifEstClick(Sender: TObject);
begin
  fraMotivosDebitoModifEst.Visible := rgAccionModifEst.ItemIndex = 1;
  sbMantMotivosDebitoModifEst.Visible := rgAccionModifEst.ItemIndex = 1;

  if rgAccionModifEst.ItemIndex = 1 then
  begin
    chbReconfirmarModifEst.Checked := false;
    chbEnfProfModifEst.Checked := false;
  end;

  chbReconfirmarModifEst.Enabled := rgAccionModifEst.ItemIndex = 0;
  chbEnfProfModifEst.Enabled := rgAccionModifEst.ItemIndex = 0;
end;


{-----------------------------------------------------------------------------
  Procedure: RecuperarFechaUltPresupuesto
  Author:    racastro
  Date:      22-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Recupera fecha del último presupuesto en caso que corresponda
             según el nuevo estado
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.RecuperarFechaUltPresupuesto (Estado: String;
                                                                Contrato,
                                                                IDEstableci: Integer;
                                                                Operativo,
                                                                CUIT: String;
                                                                NroEstableci: Integer);
var
  FechaPresup: TDateTime;
begin
  if  sdqConsulta.FieldByName ('el_operativo').AsString = 'R' then
    Exit;

  if (ValorSqlEx('SELECT NVL(de_recuperaultpresup, ''N'') ' +
                 '  FROM hys.hde_descripcionestadolote ' +
                 ' WHERE de_codigo = :pcodigo ',
                 [Estado]) = 'S') then
  begin
    if ExisteSQLEx ('SELECT 1 ' +
                    '  FROM comunes.csp_solicitudpresupuesto ' +
                    ' WHERE sp_contrato = :pcontrato ' +
                    '   AND sp_idestablecimiento = :pidestableci ' +
                    '   AND sp_operativo = :poperativo ',
                    [Contrato, IDEstableci, Operativo]) then
      FechaPresup := ValorSqlDateTimeEx('SELECT MAX(sp_fechasolicitud) ' +
                                        '  FROM comunes.csp_solicitudpresupuesto ' +
                                        ' WHERE sp_contrato = :pcontrato ' +
                                        '   AND sp_idestablecimiento = :pidestableci ' +
                                        '   AND sp_operativo = :poperativo ',
                                        [Contrato, IDEstableci, Operativo])
    else
      FechaPresup := ValorSqlDateTimeEx('SELECT MAX(sp_fechasolicitud) ' +
                                        '  FROM comunes.csp_solicitudpresupuesto ' +
                                        ' WHERE sp_contrato = :pcontrato ' +
                                        '   AND sp_idestablecimiento = :pidestableci ',
                                        [Contrato, IDEstableci]);

    EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                    '   SET ur_fechaultsolpresup = ' + SqlDateTime(FechaPresup) +
                    ' WHERE ur_cuit = :pcuit ' +
                    '   AND ur_estableci = :pnroestableci ',
                    [CUIT, NroEstableci])
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: btnAceptarModifEstClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.btnAceptarModifEstClick(Sender: TObject);
var
  BM: TBookMark;
  Estado: String;
begin
  if not FReiniciar then
    VerificarMultiple (['Modificar Estudio',
                        edFechaRealizacionModifEst,
                        not edFechaRealizacionModifEst.IsEmpty,
                        'Debe indicar la fecha de realización',

                        edFechaRealizacionModifEst,
                        edFechaRealizacionModifEst.Date <= Date,
                        'La fecha de realización no puede ser posterior a la actual',

                        edFechaRealizacionModifEst,
                        (not AreIn(sdqConsulta.FieldByName('el_estado').AsString, ['O', 'Z', 'J'])) or
                        ((AreIn(sdqConsulta.FieldByName('el_estado').AsString,['O', 'Z', 'J'])) and
                         (edFechaRealizacionModifEst.Date <= sdqConsulta.FieldByName('el_fechabaja').AsDateTime)),
                        'La fecha de realización no puede ser posterior a la de baja del contrato',

                        rgAccionModifEst,
                        rgAccionModifEst.ItemIndex <> -1,
                        'Debe indicar una acción',

                        fraMotivosDebitoModifEst,
                        (rgAccionModifEst.ItemIndex = 0) or
                        ((rgAccionModifEst.ItemIndex = 1) and fraMotivosDebitoModifEst.IsSelected),
                        'Debe indicar el motivo de débito',

                        edFechaRealizacionModifEst,
                        (edFechaRealizacionModifEst.Date >
                        sdqConsulta.FieldByName('le_fechanotificacion').AsDateTime),
                        ERR_FECHAS]
                     );

  BM := sdqTrabajadoresLote.GetBookmark;
  try
    BeginTrans;
    try
      if FReiniciar then
      begin
        // Reinicia el estudio
        EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                      '   SET dl_fecharealizacion = NULL ' +
                      '      ,dl_fechamodif = SYSDATE ' +
                      '      ,dl_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                      '      ,dl_fechaaprobacion = NULL ' +
                      '      ,dl_fechadebito = NULL ' +
                      '      ,dl_debito = NULL ' +
                      '      ,dl_motivodebito = NULL ' +
                      ' WHERE dl_id = ' + SqlInteger(sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger));

        // Anula la reconfirmación
        EjecutarSqlSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                        '   SET gr_fechabaja = SYSDATE, ' +
                        '       gr_usubaja = :pusuario ' +
                        ' WHERE gr_fechabaja IS NULL ' +
                        '   AND gr_estado = ''PA'' ' +
                        '   AND gr_iddetallelote = :piddetallelote ',
                        [frmPrincipal.DBLogin.LoginName,
                         sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger])
      end
      else begin
        EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                      '   SET dl_fecharealizacion = ' + edFechaRealizacionModifEst.SqlText +
                      '      ,dl_fechamodif = SYSDATE ' +
                      '      ,dl_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                      '      ,dl_fechaaprobacion = ' + iif(rgAccionModifEst.ItemIndex = 0, 'art.actualdate', 'NULL') +
                      '      ,dl_fechadebito = ' + iif(rgAccionModifEst.ItemIndex = 1, 'art.actualdate', 'NULL') +
                      '      ,dl_debito = ' + iif(rgAccionModifEst.ItemIndex = 1, SqlValue('S'), SqlValue('N')) +
                      '      ,dl_motivodebito = ' +  iif(rgAccionModifEst.ItemIndex = 1, SqlValue(fraMotivosDebitoModifEst.Value), 'NULL') +
                      ' WHERE dl_id = ' + SqlInteger(sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger));

        RegistrarSiniestro (sdqConsulta.FieldByName('em_cuit').AsString,
                            sdqTrabajadoresLote.FieldByName('tj_cuil').AsString,
                            sdqConsulta.FieldByName('contrato').AsInteger,
                            sdqConsulta.FieldByName('le_id').AsInteger);

        // Procesa reconfirmación
        if chbReconfirmarModifEst.Checked then
        begin
          if not ExisteSqlEx ('SELECT 1 ' +
                              '  FROM hys.hgr_gestionreconfirmacion ' +
                              ' WHERE gr_fechabaja IS NULL ' +
                              '   AND gr_enfprofesional = ''N'' ' +
                              '   AND gr_iddetallelote = :piddetallelote ',
                              [sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger]) then
            EjecutarSqlSTEx('INSERT INTO hys.hgr_gestionreconfirmacion ' +
                            '            (gr_id, gr_iddetallelote, ' +
                            '             gr_estado, gr_fechaalta, gr_usualta, ' +
                            '             gr_enfprofesional) ' +
                            '     VALUES (hys.seq_hgr_id.NEXTVAL, :piddetallelote, ' +
                            '             ''PA'', SYSDATE, :pusuario, ''N'') ',
                            [sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger,
                             frmPrincipal.DBLogin.LoginName])
        end
        else
          // Anula la reconfirmación
          EjecutarSqlSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                          '   SET gr_fechabaja = SYSDATE, ' +
                          '       gr_usubaja = :pusuario ' +
                          ' WHERE gr_fechabaja IS NULL ' +
                          '   AND gr_enfprofesional = ''N'' ' +
                          '   AND gr_estado = ''PA'' ' +
                          '   AND gr_iddetallelote = :piddetallelote ',
                          [frmPrincipal.DBLogin.LoginName,
                           sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger]);

        // Procesa enfermedad profesional
        if chbEnfProfModifEst.Checked then
        begin
          if not ExisteSqlEx ('SELECT 1 ' +
                              '  FROM hys.hgr_gestionreconfirmacion ' +
                              ' WHERE gr_fechabaja IS NULL ' +
                              '   AND gr_enfprofesional = ''S'' ' +
                              '   AND gr_iddetallelote = :piddetallelote ',
                              [sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger]) then
            EjecutarSqlSTEx('INSERT INTO hys.hgr_gestionreconfirmacion ' +
                            '            (gr_id, gr_iddetallelote, ' +
                            '             gr_estado, gr_fechaalta, gr_usualta, ' +
                            '             gr_enfprofesional) ' +
                            '     VALUES (hys.seq_hgr_id.NEXTVAL, :piddetallelote, ' +
                            '             ''PA'', SYSDATE, :pusuario, ''S'') ',
                            [sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger,
                             frmPrincipal.DBLogin.LoginName])
        end
        else
          // Anula enfermedad profesional
          EjecutarSqlSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                          '   SET gr_fechabaja = SYSDATE, ' +
                          '       gr_usubaja = :pusuario ' +
                          ' WHERE gr_fechabaja IS NULL ' +
                          '   AND gr_estado = ''PA'' ' +
                          '   AND gr_enfprofesional = ''S'' ' +
                          '   AND gr_iddetallelote = :piddetallelote ',
                          [frmPrincipal.DBLogin.LoginName,
                           sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger]);
      end;

{- NUEVA LÓGICA DE ASIGNACIONES !!!! -----------------------------------------}
      ActualizarAsignaciones (sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger,
                              sdqConsulta.FieldByName('el_id').AsInteger,
                              edFechaRealizacionModifEst.Date);
{-----------------------------------------------------------------------------}

      Estado := sdqConsulta.FieldByName('el_estado').AsString;

      // Actualizo el estado si no es ['O', 'Z', 'J']
      if not AreIn(Estado, ['O', 'Z', 'J']) then
      begin
        EjecutarSqlST('UPDATE hys.hel_estadolote ' +
                      '   SET el_estado = DECODE((SELECT COUNT(*) ' +
                      '                             FROM hys.hdl_detallelote, ' +
                      '                                  hys.hrl_relevamientolote ' +
                      '                            WHERE dl_fechabaja IS NULL ' +
                      '                              AND dl_idlote = el_idlote ' +
                      '                              AND dl_idestableci = rl_idestableci ' +
                      '                              AND rl_id = el_rlid) ' +
                      '                          - (SELECT COUNT(*) ' +
                      '                               FROM hys.hdl_detallelote, ' +
                      '                                    hys.hrl_relevamientolote ' +
                      '                              WHERE dl_fechabaja IS NULL ' +
                      '                                AND dl_idlote = el_idlote ' +
                      '                                AND dl_fecharealizacion IS NOT NULL ' +
                      '                                AND dl_idestableci = rl_idestableci ' +
                      '                                AND rl_id = el_rlid), ' +
                      '                          NULL, el_estado, ' +
                      '                          0, ''T'', ' +
                      '                          el_estado) ' +
                      ' WHERE el_fechabaja IS NULL ' +
                      '   AND el_idlote = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger));

        // Actualizo fecha y usuario si el estado es Terminado
        EjecutarSqlST('UPDATE hys.hel_estadolote ' +
                      '   SET EL_FECHATERMINADO = SYSDATE, ' +
                      '       EL_USUTERMINADO = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                      ' WHERE el_estado = ''T'' ' +
                      '   AND el_idlote = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger));

        // Actualizo estado del lote
        Estado := ValorSQL ('SELECT art.amp.get_estado_lote (' + SqlInteger (sdqConsulta.FieldByName ('le_id').AsInteger) + ') FROM dual');
        EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                      '   SET le_fechamodif = SYSDATE, ' +
                      '       le_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
                      '       le_estado = ' + SqlValue (Estado) +
                      ' WHERE le_id = ' + SqlInteger(sdqConsulta.FieldByName('le_id').AsInteger));

        if sdqConsulta.FieldByName ('el_operativo').AsString <> 'R' then
          EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                          '   SET ur_operultlote = art.amp.get_operativoultlote(:pidestableci), ' +
                          '       ur_estadoultlote = art.amp.get_estadoultlote(:pidestableci), ' +
                          '       ur_operproxlote = art.amp.get_operativoproxlote(:pidestableci), ' +
                          '       ur_fechaproxlote = art.amp.get_fechaproxlote(:pidestableci) ' +
                          ' WHERE ur_cuit = :pcuit ' +
                          '   AND ur_estableci = :pnroestableci ',
                          [sdqConsulta.FieldByName ('es_id').AsInteger,
                           sdqConsulta.FieldByName ('es_id').AsInteger,
                           sdqConsulta.FieldByName ('es_id').AsInteger,
                           sdqConsulta.FieldByName ('es_id').AsInteger,
                           sdqConsulta.FieldByName ('em_cuit').AsString,
                           sdqConsulta.FieldByName ('es_nroestableci').AsInteger]);
      end;

      RecuperarFechaUltPresupuesto (Estado,
                                    sdqConsulta.FieldByName ('contrato').AsInteger,
                                    sdqConsulta.FieldByName ('es_id').AsInteger,
                                    sdqConsulta.FieldByName ('el_operativo').AsString,
                                    sdqConsulta.FieldByName ('em_cuit').AsString,
                                    sdqConsulta.FieldByName ('es_nroestableci').AsInteger);
      CommitTrans;

      if (ValorSqlEx('SELECT COUNT(DISTINCT hdl.dl_idtrabajador) ' +
                    '  FROM hys.hdl_detallelote hdl, hys.hmr_motivorechazo hmr, hys.hel_estadolote, ' +
                    '       hys.hrl_relevamientolote ' +
                    ' WHERE hdl.dl_fechadebito IS NOT NULL ' +
                    '   AND hdl.dl_fechabaja IS NULL ' +
                    '   AND hmr.mr_id = hdl.dl_motivodebito ' +
                    '   AND hmr.mr_cartadocumento = ''S'' ' +
                    '   AND rl_id = el_rlid ' +
                    '   AND rl_idestableci = hdl.dl_idestableci ' +
                    '   AND el_idlote = hdl.dl_idlote ' +
                    '   AND el_estado = ''T'' ' +
                    '   AND hdl.dl_idlote = :pidlote ' +
                    '   AND hdl.dl_idestableci = :pidestableci ',
                    [sdqConsulta.FieldByName('le_id').AsInteger,
                     sdqConsulta.FieldByName('es_id').AsInteger]) > 0)
         and
         (MsgBox('El lote se ha terminado con trabajadores ausentes. ' + #13 +
                 'Desea enviar Carta Documento a la Empresa?', MB_ICONQUESTION + MB_YESNO) = mrYes) then
        GenCartaDocTrabAusentes;

      fpModificarEstudio.ModalResult := mrOk;
      tbRefrescarTrabClick(Sender);
      sdqTrabajadoresLote.GotoBookmark(BM);
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg (E, 'Error al registrar los datos');
      end
    end
  finally
    sdqTrabajadoresLote.FreeBookmark(BM);
  end
end;

{-----------------------------------------------------------------------------
  Procedure: tbModifEstClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbModifEstClick(Sender: TObject);
begin
  if (not sdqEstudiosTrabajador.Active) or sdqEstudiosTrabajador.FieldByName('dl_fecharealizacion').IsNull then
    Exit;

  edFechaRealizacionModifEst.Date := sdqEstudiosTrabajador.FieldByName('dl_fecharealizacion').AsDateTime;
  rgAccionModifEst.ItemIndex      := iif (sdqEstudiosTrabajador.FieldByName('dl_motivodebito').IsNull, 0, 1);
  fraMotivosDebitoModifEst.Value  := sdqEstudiosTrabajador.FieldByName('dl_motivodebito').AsInteger;

  if rgAccionModifEst.ItemIndex = 0 then
  begin
    chbReconfirmarModifEst.Checked  := ExisteSqlEx ('SELECT 1 ' +
                                                    '  FROM hys.hgr_gestionreconfirmacion ' +
                                                    ' WHERE gr_fechabaja IS NULL ' +
                                                    '   AND gr_enfprofesional = ''N'' ' +
                                                    '   AND gr_iddetallelote = :piddetallelote ',
                                                    [sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger]);

    chbEnfProfModifEst.Checked  := ExisteSqlEx ('SELECT 1 ' +
                                                '  FROM hys.hgr_gestionreconfirmacion ' +
                                                ' WHERE gr_fechabaja IS NULL ' +
                                                '   AND gr_enfprofesional = ''S'' ' +
                                                '   AND gr_iddetallelote = :piddetallelote ',
                                                [sdqEstudiosTrabajador.FieldByName('dl_id').AsInteger])
  end
  else begin
    chbReconfirmarModifEst.Checked  := false;
    chbEnfProfModifEst.Checked  := false
  end;

  chbReconfirmarModifEst.Enabled := rgAccionModifEst.ItemIndex = 0;
  chbEnfProfModifEst.Enabled := rgAccionModifEst.ItemIndex = 0;

  edFechaRealizacionModifEst.Enabled:= True;
  rgAccionModifEst.Enabled          := edFechaRealizacionModifEst.Enabled;
  fraMotivosDebitoModifEst.Enabled  := edFechaRealizacionModifEst.Enabled;
  btnReiniciarEstudio.Enabled       := edFechaRealizacionModifEst.Enabled;

  fpModificarEstudio.ShowModal
end;

{-----------------------------------------------------------------------------
  Procedure: dbgEstudiosTrabajadorDblClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.dbgEstudiosTrabajadorDblClick(
  Sender: TObject);
begin
  tbModifEstClick(Sender)
end;

{-----------------------------------------------------------------------------
  Procedure: btnReiniciarEstudioClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.btnReiniciarEstudioClick(Sender: TObject);
begin
  FReiniciar := true;
  btnAceptarModifEstClick(Sender);
end;

{-----------------------------------------------------------------------------
  Procedure: tbReiniciarEstTrabClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbReiniciarEstTrabClick(Sender: TObject);
var
  Estado: String;
  BM: TBookmark;
begin
  if ExisteSQLEx ('SELECT 1 ' +
                  '  FROM hys.hdl_detallelote ' +
                  ' WHERE dl_fechabaja IS NULL ' +
                  '   AND dl_iddetvolante IS NOT NULL ' +
                  '   AND dl_idlote = :pidlote ',
                  [sdqConsulta.FieldByName('le_id').AsInteger]) then
  begin
    MsgBox('Existen estudios procesados para su pago/debitación. Esta acción sólo puede hacerse individualmente.', MB_ICONERROR + MB_OK);
    Exit
  end;

  BM := sdqTrabajadoresLote.GetBookmark;
  try
    BeginTrans;
    try
      // Reinicio todos los estudios de un trabajador en un lote
      EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                    '   SET dl_fecharealizacion = NULL, ' +
                    '       dl_enfprofesional = NULL, ' +
                    '       dl_fechamodif = SYSDATE, ' +
                    '       dl_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
                    '       dl_fechaaprobacion = NULL, ' +
                    '       dl_fechadebito = NULL, ' +
                    '       dl_debito = NULL, ' +
                    '       dl_motivodebito = NULL ' +
                    ' WHERE dl_idlote = ' + SqlInteger(sdqConsulta.FieldByName('le_id').AsInteger) +
                    '   AND dl_idtrabajador = ' + SqlInteger(sdqTrabajadoresLote.FieldByName('dl_idtrabajador').AsInteger));

      // Anula las reconfirmaciones
      EjecutarSqlSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                      '   SET gr_fechabaja = SYSDATE, ' +
                      '       gr_usubaja = :pusuario ' +
                      ' WHERE gr_fechabaja IS NULL ' +
                      '   AND gr_estado = ''PA'' ' +
                      '   AND gr_iddetallelote IN(SELECT dl_id ' +
                      '                             FROM hys.hdl_detallelote ' +
                      '                            WHERE dl_idlote = :pidlote ' +
                      '                              AND dl_idtrabajador = :pidtrabajador) ',
                      [frmPrincipal.DBLogin.LoginName,
                       sdqConsulta.FieldByName('le_id').AsInteger,
                       sdqTrabajadoresLote.FieldByName('dl_idtrabajador').AsInteger]);

      Estado := sdqConsulta.FieldByName('el_estado').AsString;

      // Actualizo el estado del sublote a 'B' (recibido) si no es ['O', 'Z', 'J'] (contrato dado de baja)
      if not AreIn(Estado, ['O', 'Z', 'J']) then
      begin
        EjecutarSqlST('UPDATE hys.hel_estadolote ' +
                      '   SET el_estado = ''B'', ' +
                      '       el_fechaterminado = NULL, ' +
                      '       el_usuterminado = NULL ' +
                      ' WHERE el_fechabaja IS NULL ' +
                      '   AND el_idlote = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger));

        // Actualizo estado del lote
        Estado := ValorSQL ('SELECT art.amp.get_estado_lote (' + SqlInteger (sdqConsulta.FieldByName ('le_id').AsInteger) + ') FROM dual');
        EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                      '   SET le_fechamodif = SYSDATE, ' +
                      '       le_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
                      '       le_estado = ' + SqlValue (Estado) +
                      ' WHERE le_id = ' + SqlInteger(sdqConsulta.FieldByName('le_id').AsInteger));
      end;

      RecuperarFechaUltPresupuesto (Estado,
                                    sdqConsulta.FieldByName ('contrato').AsInteger,
                                    sdqConsulta.FieldByName ('es_id').AsInteger,
                                    sdqConsulta.FieldByName ('el_operativo').AsString,
                                    sdqConsulta.FieldByName ('em_cuit').AsString,
                                    sdqConsulta.FieldByName ('es_nroestableci').AsInteger);
      CommitTrans;

      tbRefrescarTrabClick(Sender);
      sdqTrabajadoresLote.GotoBookmark(BM);
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg (E, 'Error al registrar los datos');
      end
    end
  finally
    sdqTrabajadoresLote.FreeBookmark(BM)
  end
end;

{-----------------------------------------------------------------------------
  Procedure: fpMotivoDebitoShow
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.fpMotivoDebitoShow(Sender: TObject);
begin
  fraMotivosDebito.Clear
end;

{-----------------------------------------------------------------------------
  Procedure: dbgTrabajadoresGetCellParams
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.dbgTrabajadoresGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqTrabajadoresLote.FieldByName ('dl_fechabaja').IsNull then
  begin
    AFont.Color := clRed;
    if Highlight then
      Background := clNavy
  end
end;

{-----------------------------------------------------------------------------
  Procedure: tbAprobarTodosClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.fpResultadoEstudioShow(Sender: TObject);
begin
end;

{-----------------------------------------------------------------------------
  Procedure: tbAnularAprobarTodoClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbAprobarTodosClick(Sender: TObject);

  procedure Aprobar;
  var
    ID: String;
  begin
    ID := sdqEstudios.fieldbyname('dl_id').AsString;

    if AprobadoList.IndexOf(ID) = -1 then
      AprobadoList.Add(ID);

    if DebitoList.IndexOf(ID) <> -1 then
      DebitoList.Delete(DebitoList.IndexOf(ID));
  end;

var
  i: integer;
begin
  sdqEstudios.DisableControls;
  try
    if grdEstudios.SelCount > 1 then
    begin
      for i := 0 to grdEstudios.SelCount - 1 do
      begin
        grdEstudios.GotoSelection (i);
        Aprobar;
      end;

      grdEstudios.UnselectAll
    end
    else begin
      sdqEstudios.First;
      while not sdqEstudios.Eof do
      begin
        Aprobar;
        sdqEstudios.Next;
      end
    end
  finally
    sdqEstudios.First;
    sdqEstudios.EnableControls;
    grdEstudios.Refresh;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbDebitarTodosClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbAnularAprobarTodoClick(
  Sender: TObject);
begin
  AprobadoList.Clear;
  ReconfirmaList.Clear;
  EnfProfesionalList.Clear;

  grdEstudios.Refresh;
end;

{-----------------------------------------------------------------------------
  Procedure: tbAnularDebitarTodosClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbDebitarTodosClick(Sender: TObject);

  procedure Debitar;
  var
    ID: String;
  begin
    ID := sdqEstudios.fieldbyname('dl_id').AsString;

    if DebitoList.IndexOf(ID) = -1 then
      DebitoList.AddObject(ID, TObject(fraMotivosDebito.Value));

    if AprobadoList.IndexOf(ID) <> -1 then
      AprobadoList.Delete(AprobadoList.IndexOf(ID));

    if ReconfirmaList.IndexOf(ID) <> -1 then
      ReconfirmaList.Delete(ReconfirmaList.IndexOf(ID));

    if EnfProfesionalList.IndexOf(ID) <> -1 then
      EnfProfesionalList.Delete(EnfProfesionalList.IndexOf(ID));
  end;

var
  i: integer;
begin
  if fpMotivoDebito.ShowModal = mrOk then
  begin
    VerificarMultiple (['Debitar el estudio',
                        grdEstudios,
                        fraMotivosDebito.IsSelected,
                        'Debe indicar el motivo de débito']);

    sdqEstudios.DisableControls;
    try
      if grdEstudios.SelCount > 1 then
      begin
        for i := 0 to grdEstudios.SelCount - 1 do
        begin
          grdEstudios.GotoSelection (i);
          Debitar
        end;

        grdEstudios.UnselectAll
      end
      else begin
        sdqEstudios.First;
        while not sdqEstudios.Eof do
        begin
          Debitar;
          sdqEstudios.Next;
        end
      end;

      AprobadoList.Clear;
      ReconfirmaList.Clear;
      EnfProfesionalList.Clear;
    finally
      sdqEstudios.First;
      sdqEstudios.EnableControls;
      grdEstudios.Refresh;
    end
  end
end;

{-----------------------------------------------------------------------------
  Procedure: grdEstudiosCellClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Column: TColumn
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbAnularDebitarTodosClick(
  Sender: TObject);
begin
  DebitoList.Clear;
  sdqEstudios.First;
  grdEstudios.Refresh;
end;

{-----------------------------------------------------------------------------
  Procedure: grdEstudiosDrawColumnCell
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.grdEstudiosCellClick(Column: TColumn);
var
  ID: String;
begin
  ID := sdqEstudios.FieldByName('dl_id').AsString;

  // Aprobar
  if sdqEstudios.Active and (not sdqEstudios.IsEmpty) and
     (Column.FieldName = 'APROBAR') then
  begin
    if AprobadoList.IndexOf(ID) = -1 then
    begin
      AprobadoList.Add(ID);
      ExtenderEstudios (sdqEstudios.FieldByName('es_codigo').AsString,
                        sdqEstudios.FieldByName('tj_cuil').AsString);

      if DebitoList.IndexOf(ID) <> -1 then
        DebitoList.Delete(DebitoList.IndexOf(ID));
    end
    else begin
      AprobadoList.Delete(AprobadoList.IndexOf(ID));

      if ReconfirmaList.IndexOf(ID) <> -1 then
        ReconfirmaList.Delete(ReconfirmaList.IndexOf(ID));

      if EnfProfesionalList.IndexOf(ID) <> -1 then
        EnfProfesionalList.Delete(EnfProfesionalList.IndexOf(ID));
    end;

    Column.Grid.Refresh;
  end;

  // Debitar
  if sdqEstudios.Active and (not sdqEstudios.IsEmpty) and
     (Column.FieldName = 'DEBITAR') then
  begin
    if DebitoList.IndexOf(ID) = -1 then
    begin
      if fpMotivoDebito.ShowModal = mrOk then
      begin
        VerificarMultiple (['Debitar el estudio',
                            grdEstudios,
                            fraMotivosDebito.IsSelected,
                            'Debe indicar el motivo de débito']);

        DebitoList.AddObject(ID, TObject(fraMotivosDebito.Value));
        sdqEstudiosAfterScroll(sdqEstudios);

        if AprobadoList.IndexOf(ID) <> -1 then
          AprobadoList.Delete(AprobadoList.IndexOf(ID));

        if ReconfirmaList.IndexOf(ID) <> -1 then
          ReconfirmaList.Delete(ReconfirmaList.IndexOf(ID));

        if EnfProfesionalList.IndexOf(ID) <> -1 then
          EnfProfesionalList.Delete(EnfProfesionalList.IndexOf(ID));
      end
    end
    else
      DebitoList.Delete(DebitoList.IndexOf(ID));
    Column.Grid.Refresh;
  end;

  // Reconfirmar
  if sdqEstudios.Active and not sdqEstudios.IsEmpty and
     (Column.FieldName = 'RECONFIRMAR') and (*tkt5737*) ((AprobadoList.IndexOf(ID) <> -1) or (DebitoList.IndexOf(ID) <> -1)) then
  begin
    if ReconfirmaList.IndexOf(ID) = -1 then
    begin
      ReconfirmaList.Add(ID);

      if EnfProfesionalList.IndexOf(ID) <> -1 then
        EnfProfesionalList.Delete(EnfProfesionalList.IndexOf(ID));
    end
    else
      ReconfirmaList.Delete(ReconfirmaList.IndexOf(ID));
    Column.Grid.Refresh;
  end;

  // Enfermedad profesional
  if sdqEstudios.Active and (not sdqEstudios.IsEmpty) and
     (Column.FieldName = 'ENFPROF') and (*tkt5737*) ((AprobadoList.IndexOf(ID) <> -1) or (DebitoList.IndexOf(ID) <> -1)) then
  begin
    if EnfProfesionalList.IndexOf(ID) = -1 then
    begin
      EnfProfesionalList.Add(ID);

      if ReconfirmaList.IndexOf(ID) <> -1 then
        ReconfirmaList.Delete(ReconfirmaList.IndexOf(ID));
    end
    else
      EnfProfesionalList.Delete(EnfProfesionalList.IndexOf(ID));
    Column.Grid.Refresh;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbGrabarEstudiosClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.grdEstudiosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  ID : String;
begin
  ID := sdqEstudios.FieldByName('dl_id').AsString;

  if Column.FieldName = 'APROBAR' then
  begin
    grdEstudios.Canvas.FillRect(Rect);
    Check := 0;
    if AprobadoList.IndexOf(ID) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(grdEstudios.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if Column.FieldName = 'DEBITAR' then
  begin
    grdEstudios.Canvas.FillRect(Rect);
    Check := 0;
    if DebitoList.IndexOf(ID) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(grdEstudios.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if Column.FieldName = 'RECONFIRMAR' then
  begin
    grdEstudios.Canvas.FillRect(Rect);
    Check := 0;
    if ReconfirmaList.IndexOf(ID) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(grdEstudios.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if Column.FieldName = 'ENFPROF' then
  begin
    grdEstudios.Canvas.FillRect(Rect);
    Check := 0;
    if EnfProfesionalList.IndexOf(ID) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(grdEstudios.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbExportarEstudiosClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbGrabarEstudiosClick(Sender: TObject);
var
  ID: String;
  Estado: String;
begin
  VerificarMultiple (['Grabar datos',
                      edFechaRealizacion,
                      not edFechaRealizacion.IsEmpty,
                      'Debe indicar la fecha de realización',

                      edFechaRealizacion,
                      edFechaRealizacion.Date <= Date,
                      'La fecha de realización no puede ser posterior a la actual',

                      edFechaRealizacion,
                      (not AreIn(sdqConsulta.FieldByName('el_estado').AsString, ['O', 'Z', 'J'])) or
                      ((AreIn(sdqConsulta.FieldByName('el_estado').AsString, ['O', 'Z', 'J'])) and
                       (edFechaRealizacion.Date <= sdqConsulta.FieldByName('el_fechabaja').AsDateTime)),
                      'La fecha de realización no puede ser posterior a la de baja del contrato/Establecimiento (' +
                      sdqConsulta.FieldByName('el_fechabaja').AsString + ')',

                      grdEstudios,
                      (AprobadoList.Count > 0) or (DebitoList.Count > 0),
                      'No hay estudios seleccionados',

                      edFechaRealizacion,
                      (edFechaRealizacion.Date >
                      sdqConsulta.FieldByName('le_fechanotificacion').AsDateTime),
                      ERR_FECHAS]
                     );

  BeginTrans;
  try
    sdqEstudios.DisableControls;

    sdqEstudios.First;
    while not sdqEstudios.Eof do
    begin
      ID := sdqEstudios.FieldByName('dl_id').AsString;

      // Procesa Aprobado
      if AprobadoList.IndexOf(ID) <> -1 then
      begin
        EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                      '   SET dl_fecharealizacion = ' + edFechaRealizacion.SqlText +
                      '      ,dl_fechamodif = SYSDATE ' +
                      '      ,dl_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                      '      ,dl_fechaaprobacion = art.actualdate ' +
                      ' WHERE dl_id = ' + SqlValue(ID));
        RegistrarEstudio(sdqEstudios.FieldByName('dl_id').AsInteger, frmPrincipal.DBLogin.LoginName);
      end;


      // Procesa Debitado
      if DebitoList.IndexOf(ID) <> -1 then
        EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                      '   SET dl_fecharealizacion = ' + edFechaRealizacion.SqlText +
                      '      ,dl_fechamodif = SYSDATE ' +
                      '      ,dl_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                      '      ,dl_fechadebito = art.actualdate ' +
                      '      ,dl_debito = ''S'' ' +
                      '      ,dl_motivodebito = ' + SqlValue(Integer(DebitoList.Objects[DebitoList.IndexOf(ID)])) +
                      ' WHERE dl_id = ' + SqlValue(ID));

      RegistrarSiniestro (sdqConsulta.FieldByName('em_cuit').AsString,
                          sdqEstudios.FieldByName('tj_cuil').AsString,
                          sdqConsulta.FieldByName('contrato').AsInteger,
                          sdqConsulta.FieldByName('le_id').AsInteger);

      // Procesa Reconfirmación
      if ReconfirmaList.IndexOf(ID) <> -1 then
        EjecutarSqlSTEx('INSERT INTO hys.hgr_gestionreconfirmacion ' +
                        '            (gr_id, gr_iddetallelote, gr_estado, ' +
                        '             gr_fechaalta, gr_usualta, gr_enfprofesional) ' +
                        '     VALUES (hys.seq_hgr_id.NEXTVAL, :piddetallelote, ''PA'', ' +
                        '             SYSDATE, :pusuario, ''N'') ',
                        [ID, frmPrincipal.DBLogin.LoginName]);

      // Procesa Enfermedad Profesional
      if EnfProfesionalList.IndexOf(ID) <> -1 then
        EjecutarSqlSTEx('INSERT INTO hys.hgr_gestionreconfirmacion ' +
                        '            (gr_id, gr_iddetallelote, gr_estado, ' +
                        '             gr_fechaalta, gr_usualta, gr_enfprofesional) ' +
                        '     VALUES (hys.seq_hgr_id.NEXTVAL, :piddetallelote, ''PA'', ' +
                        '             SYSDATE, :pusuario, ''S'') ',
                        [ID, frmPrincipal.DBLogin.LoginName]);

{- NUEVA LÓGICA DE ASIGNACIONES !!!! -----------------------------------------}
      ActualizarAsignaciones (sdqEstudios.FieldByName('dl_id').AsInteger,
                              sdqConsulta.FieldByName('el_id').AsInteger,
                              edFechaRealizacion.Date);
{-----------------------------------------------------------------------------}

      sdqEstudios.Next
    end;

    sdqEstudios.EnableControls;

    Estado := sdqConsulta.FieldByName('el_estado').AsString;

    // Actualizo el estado si no es ['O', 'Z', 'J']
    if not AreIn (Estado, ['O', 'Z', 'J']) then
    begin
      EjecutarSqlST('UPDATE hys.hel_estadolote ' +
                    '   SET el_estado = DECODE((SELECT COUNT(*) ' +
                    '                             FROM hys.hdl_detallelote, ' +
                    '                                  hys.hrl_relevamientolote ' +
                    '                            WHERE dl_fechabaja IS NULL ' +
                    '                              AND dl_idlote = el_idlote ' +
                    '                              AND dl_idestableci = rl_idestableci ' +
                    '                              AND rl_id = el_rlid) ' +
                    '                          - (SELECT COUNT(*) ' +
                    '                               FROM hys.hdl_detallelote, ' +
                    '                                    hys.hrl_relevamientolote ' +
                    '                              WHERE dl_fechabaja IS NULL ' +
                    '                                AND dl_idlote = el_idlote ' +
                    '                                AND dl_fecharealizacion IS NOT NULL ' +
                    '                                AND dl_idestableci = rl_idestableci ' +
                    '                                AND rl_id = el_rlid), ' +
                    '                          NULL, el_estado, ' +
                    '                          0, ''T'', ' +
                    '                          el_estado) ' +
                    ' WHERE el_fechabaja IS NULL ' +
                    '   AND el_idlote = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger));

      // Actualizo fecha y usuario si el estado es Terminado
      EjecutarSqlST('UPDATE hys.hel_estadolote ' +
                    '   SET EL_FECHATERMINADO = SYSDATE, ' +
                    '       EL_USUTERMINADO = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                    ' WHERE el_estado = ''T'' ' +
                    '   AND el_idlote = ' + SqlInteger(sdqConsulta.FieldByName('le_id').AsInteger));

      if sdqConsulta.FieldByName ('el_operativo').AsString = 'R' then
        EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                        '   SET ur_operultlote = art.amp.get_operativoultlote(:pidestableci), ' +
                        '       ur_estadoultlote = art.amp.get_estadoultlote(:pidestableci), ' +
                        '       ur_operproxlote = art.amp.get_operativoproxlote(:pidestableci), ' +
                        '       ur_fechaproxlote = art.amp.get_fechaproxlote(:pidestableci) ' +
                        ' WHERE ur_cuit = :pcuit ' +
                        '   AND ur_estableci = :pnroestableci ',
                        [sdqConsulta.FieldByName ('es_id').AsInteger,
                         sdqConsulta.FieldByName ('es_id').AsInteger,
                         sdqConsulta.FieldByName ('es_id').AsInteger,
                         sdqConsulta.FieldByName ('es_id').AsInteger,
                         sdqConsulta.FieldByName ('em_cuit').AsString,
                         sdqConsulta.FieldByName ('es_nroestableci').AsInteger]);
    end;
    CommitTrans;

    BeginTrans;
    try
      // Actualizo estado del lote
      Estado := ValorSQL ('SELECT art.amp.get_estado_lote (' + SqlInteger (sdqConsulta.FieldByName ('le_id').AsInteger) + ') FROM dual');
      EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                    '   SET le_fechamodif = SYSDATE, ' +
                    '       le_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
                    '       le_estado = ' + SqlValue(Estado) +
                    ' WHERE le_id = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger));

      RecuperarFechaUltPresupuesto (Estado,
                                    sdqConsulta.FieldByName ('contrato').AsInteger,
                                    sdqConsulta.FieldByName ('es_id').AsInteger,
                                    sdqConsulta.FieldByName ('el_operativo').AsString,
                                    sdqConsulta.FieldByName ('em_cuit').AsString,
                                    sdqConsulta.FieldByName ('es_nroestableci').AsInteger);
      CommitTrans;

      if (ValorSqlEx('SELECT COUNT(DISTINCT hdl.dl_idtrabajador) ' +
                     '  FROM hys.hdl_detallelote hdl, hys.hmr_motivorechazo hmr, hys.hel_estadolote, ' +
                     '       hys.hrl_relevamientolote ' +
                     ' WHERE hdl.dl_fechadebito IS NOT NULL ' +
                     '   AND hdl.dl_fechabaja IS NULL ' +
                     '   AND hmr.mr_id = hdl.dl_motivodebito ' +
                     '   AND hmr.mr_cartadocumento = ''S'' ' +
                     '   AND rl_id = el_rlid ' +
                     '   AND rl_idestableci = hdl.dl_idestableci ' +
                     '   AND el_idlote = hdl.dl_idlote ' +
                     '   AND el_estado = ''T'' ' +
                     '   AND hdl.dl_idlote = :pidlote ' +
                     '   AND hdl.dl_idestableci = :pidestableci ',
                     [sdqConsulta.FieldByName('le_id').AsInteger,
                      sdqConsulta.FieldByName('es_id').AsInteger]) > 0)
         and
         (MsgBox('El lote se ha terminado con trabajadores ausentes. ' + #13 +
                 'Desea enviar Carta Documento a la Empresa?', MB_ICONQUESTION + MB_YESNO) = mrYes) then
        GenCartaDocTrabAusentes;

      tbRefrescarTrabClick(Sender);
      CargarListaEstudios(Sender)
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg (E, 'Error al registrar los datos');
      end
    end
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg (E, 'Error al registrar los datos');
    end
  end
end;

{-----------------------------------------------------------------------------
  Procedure: tbEnviarMailEstudiosClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbExportarEstudiosClick(Sender: TObject);
begin
  if (not sdqEstudios.Active) or sdqEstudios.IsEmpty then
    Exit;

  dbgListaEstudiosExport.DataSource := dsListaEstudiosExport;
  with sdqListaEstudiosExport do
  begin
    ParamByName('pidlote').Value     := sdqConsulta.FieldByName('le_id').AsInteger;
    ParamByName('pidempresa').Value  := sdqConsulta.FieldByName('em_id').AsInteger;
    ParamByName('pidestableci').Value:= sdqConsulta.FieldByName('es_id').AsInteger;

    Active := true;
  end;

  if not sdqListaEstudiosExport.IsEmpty then begin
    try
      ExportDialog.Fields.Assign(dbgListaEstudiosExport.Columns);
      exdListaEstudios.Execute;
    finally
      exdListaEstudios.Fields.Clear;
    end;
  end;

  sdqListaEstudiosExport.Active := false
end;

{-----------------------------------------------------------------------------
  Procedure: tbNotificarMLClick
  Author:    racastro
  Date:      02-Jul-2008
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.tbNotificarMLClick(
  Sender: TObject);
begin
  if sdqEstudios.IsEmpty then
    Exit;

  if ExisteSqlEx('SELECT 1 ' +
                 '  FROM hys.hel_estadolote ' +
                 ' WHERE el_id = :pid ' +
                 '   AND el_ffea IS NOT NULL ',
                 [sdqConsulta.FieldByName('el_id').AsInteger]) then
  begin
    MsgBox('Ya fue notificado a Medicina Laboral el ' +
           sdqConsulta.FieldByName('el_ffea').AsString , MB_ICONINFORMATION + MB_OK);
    Exit
  end;

  EjecutarSqlEx ('UPDATE hys.hel_estadolote ' +
                 '   SET el_ffea = art.actualdate ' +
                 ' WHERE el_id = :pid ',
                 [sdqConsulta.FieldByName('el_id').AsInteger]);

  MsgBox('Se ha notificado a Medicina Laboral sobre los ausentes', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmSeguimientoEstudios.fpDatosEstudioShow(Sender: TObject);
begin
  edFechaRealizacion.Clear;
  FReiniciar := false;

  CargarListaEstudios(Sender);

  tbAnularAprobarTodoClick(Sender);
  tbAnularDebitarTodosClick(Sender)
end;

{-----------------------------------------------------------------------------
  Procedure: sdqEstudiosAfterScroll
  Author:    racastro
  Date:      29-Jul-2008
  Arguments: DataSet: TDataSet
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.sdqEstudiosAfterScroll(
  DataSet: TDataSet);
var
  ID: String;
begin
  ID := DataSet.FieldByName('dl_id').AsString;

  if DebitoList.IndexOf(ID) = -1 then
    fraMotivoDebitado.Clear
  else
    fraMotivoDebitado.Value := Integer(DebitoList.Objects[DebitoList.IndexOf(ID)])
end;

{-----------------------------------------------------------------------------
  Procedure: chbReconfirmarModifEstClick
  Author:    racastro
  Date:      29-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.chbReconfirmarModifEstClick(
  Sender: TObject);
begin
  if chbReconfirmarModifEst.Checked then
    chbEnfProfModifEst.Checked := false
end;

{-----------------------------------------------------------------------------
  Procedure: chbEnfProfModifEstClick
  Author:    racastro
  Date:      29-Jul-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.chbEnfProfModifEstClick(Sender: TObject);
begin
  if chbEnfProfModifEst.Checked then
    chbReconfirmarModifEst.Checked := false
end;

procedure TfrmSeguimientoEstudios.tbExportarClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty then
    Exit;

  dbgListaEstudiosExport.DataSource := dsConsultaUnificada;
  sdqConsultaUnificada.Active := true;

  if not sdqConsultaUnificada.IsEmpty then begin
    try
      ExportDialog.Fields.Assign(dbgListaEstudiosExport.Columns);
      ExportDialog.Execute;
    finally
      ExportDialog.Fields.Clear;
    end;
  end;

  sdqConsultaUnificada.Active := false
end;

procedure TfrmSeguimientoEstudios.GridDblClick(Sender: TObject);
begin
  VerificarMultiple (['Auditar Estudios',
                      tbModificar,
                      false,
                      'Para auditar estudios pulsar el botón "Resultado Estudio" ó Ctrl+M']);
end;

{-----------------------------------------------------------------------------
  Procedure: ActualizarAsignaciones
  Author:    racastro
  Date:      03-Sep-2008
  Arguments: None
  Result:    None
  Purpose:   Actualiza la tabla de Lógica de Asignaciones
-----------------------------------------------------------------------------}

procedure TfrmSeguimientoEstudios.ActualizarAsignaciones (IDEstudio, IDSublote: integer; Fecha: TDate);
begin
(* --Se elimina por nueva resolucion
  // Si se audita una HHCC, se modifica la tabla de asignaciones
  if ExisteSqlEx ('SELECT 1 ' +
                  '  FROM hys.hdl_detallelote ' +
                  ' WHERE dl_idestudio = 0 ' +
                  '   AND dl_id = :ID ', [IDEstudio]) then
  begin
*)
(*
  if ValorSqlIntegerEx ('SELECT al_secuencia ' +
                        '  FROM hys.hal_asignacionlote ' +
                        ' WHERE al_idempresa = :pidempresa ' +
                        '   AND al_nroestableci = :pnroestableci ' +
                        '   AND al_tipoproxoperacion <> ''A'' ' +
                        '   AND al_idultsubloteasignado = :id ',
                        [sdqConsulta.FieldByName ('em_id').AsString,
                         sdqConsulta.FieldByName ('es_nroestableci').AsString, IDSublote]) = 2 then
    EjecutarSqlSTEx('UPDATE hys.hal_asignacionlote ' +
                    '   SET al_tipoproxoperacion = ''R'', ' +
                    '       al_fechaproxoperacion = ADD_MONTHS(' + SqlDate(Fecha) + ', 5), ' +
                    '       al_usumodif = :pusuario, ' +
                    '       al_fechamodif = SYSDATE ' +
                     ' WHERE al_idempresa = :pidempresa ' +
                    '   AND al_nroestableci = :pnroestableci ' +
                    '   AND al_idultsubloteasignado = :id ',
                    [frmPrincipal.DBLogin.LoginName,
                     sdqConsulta.FieldByName ('em_id').AsString,
                     sdqConsulta.FieldByName ('es_nroestableci').AsString, IDSublote])
  else
*)
  EjecutarSqlSTEx('UPDATE hys.hal_asignacionlote ' +
                  '   SET al_tipoproxoperacion = DECODE((SELECT el_operativo ' +
                  '                                        FROM hys.hel_estadolote ' +
                  '                                       WHERE el_id = al_idultsubloteasignado), ' +
                  '                                     ''A'', ''S'', ' +
                  '                                     ''S'', ''A'', ' +
                  '                                     al_tipoproxoperacion), ' +
                  '       al_usumodif = :pusuario, ' +
                  '       al_fechamodif = SYSDATE ' +
                  ' WHERE al_idempresa = :pidempresa ' +
                  '   AND al_nroestableci = :pnroestableci ' +
                  '   AND al_idultsubloteasignado = :id ',
                  [frmPrincipal.DBLogin.LoginName,
                   sdqConsulta.FieldByName ('em_id').AsString,
                   sdqConsulta.FieldByName ('es_nroestableci').AsString, IDSublote]);

  EjecutarSqlSTEx('UPDATE hys.hal_asignacionlote ' +
                  '   SET al_idultsubloteauditado = al_idultsubloteasignado, ' +
                  '       al_idultsubloteasignado = NULL, ' +
                  '       al_fechaproxoperacion = ADD_MONTHS(' + SqlDate(Fecha) + ', 5) ' +
                  ' WHERE al_idultsubloteasignado IS NOT NULL ' +
                  '   AND al_idempresa = :pidempresa ' +
                  '   AND al_nroestableci = :pnroestableci ' +
                  '   AND al_idultsubloteasignado = :id ',
                  [sdqConsulta.FieldByName ('em_id').AsString,
                   sdqConsulta.FieldByName ('es_nroestableci').AsString, IDSublote]);

  EjecutarSqlSTEx('UPDATE hys.hal_asignacionlote ' +
                  '   SET al_fechaproxoperacion = ADD_MONTHS(' + SqlDate(Fecha) + ', 5) ' +
                  ' WHERE ADD_MONTHS(al_fechaproxoperacion, -5) > ' + SqlDate(Fecha) +
                  '   AND al_tipoproxoperacion <> ''R'' ' +
                  '   AND NVL(al_idultsubloteauditado, al_idultsubloteasignado) = :ID ',
                  [IDSublote]);

//  end
end;


{-----------------------------------------------------------------------------
  Procedure: fpDatosEstudioEnter
  Author:    racastro
  Date:      06-Nov-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Limpia ambos checklists
-----------------------------------------------------------------------------}
procedure TfrmSeguimientoEstudios.fpDatosEstudioEnter(Sender: TObject);
begin
  grdEstudios.UnselectAll;
  tbAnularAprobarTodoClick(Sender);
  tbAnularDebitarTodosClick(Sender)
end;

{-----------------------------------------------------------------------------
  Procedure: RegistrarSiniestro
  Author:    racastro
  Date:      06-Nov-2008
  Arguments: CUIT, CUIL: String; Contrato, Lote: Integer
  Result:    None
  Purpose:   Genera registro para notificar la auditoría de estudio de un
             trabajador accidentado que aún no tiene alta.
             Se complementa con una alerta diaria, en base al campo "Notificado"
-----------------------------------------------------------------------------}
procedure TfrmSeguimientoEstudios.RegistrarSiniestro (CUIT, CUIL: String; Contrato, Lote: Integer);
begin
  if ExisteSqlEx('SELECT 1 ' +
                 '  FROM art.sex_expedientes ' +
                 ' WHERE ex_altamedica IS NULL ' +
                 '   AND NVL (ex_tipo, ''1'') <> ''3'' ' +
                 '   AND NVL (ex_causafin, '' '') NOT IN (''02'', ''95'', ''99'') ' +
                 '   AND ex_cuit = :pcuit ' +
                 '   AND ex_cuil = :pcuil ' +
                 '   AND ex_contrato = :pcontrato ',
                 [CUIT, CUIL, Contrato]) then
    EjecutarSqlStEx('INSERT INTO hys.hts_trabsiniestrolote ' +
                    'SELECT art.utiles.get_seqnextval (''hys.seq_hts_id'') ts_id, ex_siniestro, ' +
                    '       ex_orden, ex_recaida, ex_fechaaccidente, ex_cuit, ex_cuil, ex_contrato, ' +
                    '       ''N'', :pidlote idlote ' +
                    '  FROM art.sex_expedientes ' +
                    ' WHERE ex_altamedica IS NULL ' +
                    '   AND NVL (ex_tipo, ''1'') <> ''3'' ' +
                    '   AND NVL (ex_causafin, '' '') NOT IN (''02'', ''95'', ''99'') ' +
                    '   AND ex_cuit = :pcuit ' +
                    '   AND ex_cuil = :pcuil ' +
                    '   AND ex_contrato = :pcontrato ' +
                    '   AND NOT EXISTS ( ' +
                    '          SELECT 1 ' +
                    '            FROM hys.hts_trabsiniestrolote ' +
                    '           WHERE ts_siniestro = ex_siniestro ' +
                    '             AND ts_orden = ex_orden ' +
                    '             AND ts_recaida = ex_recaida ' +
                    '             AND ts_fechaaccidente = ex_fechaaccidente ' +
                    '             AND ts_cuit = ex_cuit ' +
                    '             AND ts_cuil = ex_cuil ' +
                    '             AND ts_contrato = ex_contrato ' +
                    '             AND ts_idlote = :pidlote) ',
                    [Lote, CUIT, CUIL, Contrato, Lote])
end;

procedure TfrmSeguimientoEstudios.GridKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0
end;

{-----------------------------------------------------------------------------
  Procedure: GridCellClick
  Author:    racastro
  Date:      02-Ene-2009
  Arguments: Column: TColumn
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}
procedure TfrmSeguimientoEstudios.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  ID : String;
begin
  ID := sdqConsulta.FieldByName('el_id').AsString;

  if Column.FieldName = 'PROCESAR' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;
    if NotificarList.IndexOf(ID) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: GridCellClick
  Author:    racastro
  Date:      02-Ene-2009
  Arguments: Column: TColumn
  Result:    None
  Purpose:   Checklist en grilla de Consulta Principal
-----------------------------------------------------------------------------}
procedure TfrmSeguimientoEstudios.GridCellClick(Column: TColumn);
var
  ID: String;
begin
  if not (sdqConsulta.Active and (not sdqConsulta.IsEmpty))
    then Exit;

  ID := sdqConsulta.FieldByName('el_id').AsString;

  if (Column.FieldName = 'PROCESAR') then
  begin
    if NotificarList.IndexOf(ID) = -1 then
      NotificarList.Add(ID)
    else
      NotificarList.Delete(NotificarList.IndexOf(ID));

    Column.Grid.Refresh;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: tbNotifAusentesClick
  Author:    racastro
  Date:      07-Ene-2009
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Proceso de Notif. de Ausentes por CD a Empresa, e-mail al Prestador
             y registro de la fecha de la notif. (FCDA) en el sublote
-----------------------------------------------------------------------------}
procedure TfrmSeguimientoEstudios.tbNotifAusentesClick(Sender: TObject);
  function EmitirCDEmpresa: boolean;
  begin
    with TfrmGeneracionCartasAdmin.Create(Self) do
    begin
      try
        IDEmpresa := sdqConsulta.FieldByName('em_id').AsInteger;
        IDEstableci := sdqConsulta.FieldByName('es_id').AsInteger;
        IDLote := sdqConsulta.FieldByName('le_id').AsInteger;
        IdCarta := ART_EMPTY_ID;

        CodArea := AREA_MLB;

        Preparar(IdCarta);

        fraCodigoModulo.Value := 58;
        fraCodigoModulo.OnChange(Sender);

        fraCodigoCodTexto.Value := 611;
        fraCodigoCodTexto.OnChange(Sender);

        fraCodigoCodFirmante.Value := 550;
        fraCtbTablasTipoSalida.Codigo := 'C';

        Result := Mostrar;
      finally
        free;
      end;

      Result :=  Result and FCartaGenerada
    end
  end;

  procedure NotificarAPrestador;
  var
    rptNotifAusentesPrest: TrptNotifAusentesPrest;
    FDirectorioEMail,
    FAsunto,
    FBody,
    FArchivo,
    FListaMail: String;
  begin

//    FListaMail := Get_DireccionesEnvioMail('AUSAMP_1') + #13 +
    FListaMail := Sesion.UserMail + ';' +
                  ValorSqlEx('SELECT ca_direlectronica ' +
                             '  FROM art.cpr_prestador ' +
                             ' WHERE ca_identificador = :idprestador ',
                             [sdqConsulta.FieldByName('ca_identificador').AsInteger]);
    if FListaMail = '' then
      Exit;

    FDirectorioEMail := IncludeTrailingPathDelimiter(TempPath);

    rptNotifAusentesPrest := TrptNotifAusentesPrest.Create( Self );
    try
      rptNotifAusentesPrest.FIDLoteRpt     := sdqConsulta.FieldByName('le_id').AsInteger;
      rptNotifAusentesPrest.FIDEmpresaRpt  := sdqConsulta.FieldByName('em_id').AsInteger;
      rptNotifAusentesPrest.FIDEstableciRpt:= sdqConsulta.FieldByName('es_id').AsInteger;

      FAsunto := 'Trabajadores Ausentes a Estudios ' +
                 iif(sdqConsulta.FieldByName('el_operativo').AsString = 'R' ,
                     'Reconfirmaciones ',
                     'AMP ') +
                 sdqConsulta.FieldByName('le_id').AsString + '-' +
                 sdqConsulta.FieldByName('em_cuit').AsString + '-' +
                 sdqConsulta.FieldByName('es_nroestableci').AsString;
      FArchivo := FDirectorioEMail + FAsunto + '.pdf';
      FBody := 'Por favor, ante cualquier consulta o duda diríjase a ' +
               'los referentes indicados en el adjunto.';

      ExportarPDF(rptNotifAusentesPrest.qrAusentes, FArchivo);
      EnviarMailBD(FListaMail, sdqConsulta.FieldByName('ca_descripcion').AsString + ' - ' + FAsunto, [oAutoFirma, oDeleteAttach], FBody,
                   GetAttachments(FArchivo, 0), 0, tcDefault, false);


    finally
      rptNotifAusentesPrest.Free;
    end
  end;

var
  ID: String;
  HayAusentes: Boolean;
begin
  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty then
    Exit;

  sdqConsulta.First;
  sdqConsulta.DisableControls;
  while not sdqConsulta.Eof do
  begin
    ID := sdqConsulta.FieldByName('el_id').AsString;

    if NotificarList.IndexOf(ID) <> -1 then
    begin
      HayAusentes := ExisteSqlEx('SELECT 1 ' +
                                 '  FROM hys.hdl_detallelote hdl ' +
                                 ' WHERE (   (dl_fechabaja IS NULL) ' +
                                 '        OR ((dl_fechabaja IS NOT NULL) AND (dl_motivobaja = 3)) ' +
                                 '       ) ' +
                                 iif (sdqConsulta.FieldByName('origen').AsString = 'AMP',
                                 ' AND NOT EXISTS (SELECT 1 ' +
                                 '                FROM hys.hdl_detallelote hdl2 ' +
                                 '                WHERE hdl2.dl_idestableci = hdl.dl_idestableci ' +
                                 '                AND hdl2.dl_idlote = hdl.dl_idlote ' +
                                 '                AND hdl2.dl_fecharealizacion IS NOT NULL ' +
                                 '                AND hdl2.dl_idtrabajador = hdl.dl_idtrabajador ' +
                                 '                ) ', '') +

                                 // Condiciono análisis de HHCC si el lote es AMP
//                                      '   AND dl_idestudio = 0 ', '') +

                                 '   AND dl_fecharealizacion IS NULL ' +
                                 '   AND dl_idestableci = :pidestableci ' +
                                 '   AND dl_idlote = :idlote ',
                                 [sdqConsulta.FieldByName('es_id').AsInteger,
                                  sdqConsulta.FieldByName('le_id').AsInteger]);

      // Si existen ausentes y no haya sido ya notificado
      if HayAusentes and
         not ExisteSqlEx('SELECT 1 ' +
                         '  FROM hys.hel_estadolote ' +
                         ' WHERE el_id = :pid ' +
                         '   AND el_fcda IS NOT NULL ',
                         [sdqConsulta.FieldByName('el_id').AsInteger]) then
      begin
        // Notifica por CD a la Empresa de los ausentes
        if EmitirCDEmpresa then
        begin
          BeginTrans;
          try
            // Notifica por e-mail al prestador de los ausentes
            NotificarAPrestador;

            // Registra la FCDA
            EjecutarSqlSTEx ('UPDATE hys.hel_estadolote ' +
                             '   SET el_fcda = art.actualdate ' +
                             ' WHERE el_id = :pid ',
                             [sdqConsulta.FieldByName('el_id').AsInteger]);

            CommitTrans;
          except
            on E: Exception do
            begin
              Rollback;
              ErrorMsg (E, 'Error al registrar datos');
            end
          end
        end
      end
    end;

    sdqConsulta.Next
  end;
  sdqConsulta.EnableControls;

  NotificarList.Clear;
  RefreshData;
end;

procedure TfrmSeguimientoEstudios.tbSinGestionarClick(Sender: TObject);
begin
end;

(*
  Obsoleto - Eliminar una vez implementado la notif. a ML

procedure TfrmSeguimientoEstudios.tbNotificarMLClick(
  Sender: TObject);
var
  rptReclamoEstudios: TrptReclamoEstudios;
  FDirectorioEMail,
  FAsunto,
  FBody,
  FArchivo,
  FListaMail: String;
begin
  if (not sdqEstudios.Active) or sdqEstudios.IsEmpty then
    Exit;

  FListaMail := Get_DireccionesEnvioMail('AUSAMP_1') + #13 +
                ValorSqlEx('SELECT ca_direlectronica ' +
                           '  FROM art.cpr_prestador ' +
                           ' WHERE ca_identificador = :idprestador ',
                           [sdqConsulta.FieldByName('ca_identificador').AsInteger]);
  GenerarListaEMail (FListaMail);

  if FListaMail = '' then
    Exit;

  FDirectorioEMail := TempPath;

  rptReclamoEstudios := TrptReclamoEstudios.Create( Self );
  try
    rptReclamoEstudios.FIDLoteRpt     := sdqConsulta.FieldByName('le_id').AsInteger;
    rptReclamoEstudios.FIDEmpresaRpt  := sdqConsulta.FieldByName('em_id').AsInteger;
    rptReclamoEstudios.FIDEstableciRpt:= sdqConsulta.FieldByName('es_id').AsInteger;

    rptReclamoEstudios.qrReclamoEstudios.Preview;

    FAsunto := sdqConsulta.FieldByName('ca_descripcion').AsString + ' - ' +
               'Estudios pendientes de realización Lote ' +
               iif(sdqConsulta.FieldByName('el_operativo').AsString = 'R' ,'Reconfirmaciones ', 'AMP ') +
               sdqConsulta.FieldByName('le_id').AsString + '-' +
               sdqConsulta.FieldByName('em_cuit').AsString + '-' +
               sdqConsulta.FieldByName('es_nroestableci').AsString;
    FArchivo := FDirectorioEMail + FAsunto + '.pdf';
    FBody := 'Por favor, ante cualquier consulta o duda diríjase a ' +
             Get_DireccionesEnvioMail('AUSAMP_2');

    ExportarPDF(rptReclamoEstudios.qrReclamoEstudios, FArchivo);
    EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody,
                 GetAttachments(FArchivo, 0));

    EjecutarSqlEx('UPDATE hys.hel_estadolote ' +
                  '   SET el_fechareclamoestudios = art.actualdate, ' +
                  '       el_usureclamoestudios = :pusuario ' +
                  ' WHERE el_rlid = (SELECT hel.el_rlid ' +
                  '                    FROM hys.hel_estadolote hel, hys.hrl_relevamientolote ' +
                  '                   WHERE rl_id = hel.el_rlid ' +
                  '                     AND rl_idestableci = :pidestableci ' +
                  '                     AND hel.el_idlote = :pidlote) ',
                  [frmPrincipal.DBLogin.LoginName,
                   sdqConsulta.FieldByName('es_id').AsInteger,
                   sdqConsulta.FieldByName('le_id').AsInteger]);
  finally
    rptReclamoEstudios.Free;
  end;
end;
*)

procedure TfrmSeguimientoEstudios.tnNoGestionarAusentesClick(
  Sender: TObject);
var
  fObsSubLote: TfrmObsSubLote;
  ID: String;
//  HayAusentes,
  NoActualizaNoGestion: Boolean;
begin
  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty or (NotificarList.Count = 0) then
    Exit;

  if (MsgBox('Realmente NO desea hacer la gestión?', MB_ICONQUESTION + MB_YESNO) = mrYes) then
  begin
    sdqConsulta.DisableControls;
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      ID := sdqConsulta.FieldByName('el_id').AsString;

      if NotificarList.IndexOf(ID) <> -1 then
      begin


(*
        HayAusentes := ExisteSqlEx('SELECT 1 ' +
                                   '  FROM hys.hdl_detallelote ' +
                                   ' WHERE (   (dl_fechabaja IS NULL) ' +
                                   '        OR ((dl_fechabaja IS NOT NULL) AND (dl_motivobaja = 3)) ' +
                                   '       ) ' +
                                   // Condiciono análisis de HHCC si el lote es AMP
                                   iif (sdqConsulta.FieldByName('origen').AsString = 'AMP',
                                        '   AND dl_idestudio = 0 ', '') +
                                   '   AND dl_fecharealizacion IS NULL ' +
                                   '   AND dl_idestableci = :pidestableci ' +
                                   '   AND dl_idlote = :idlote ',
                                   [sdqConsulta.FieldByName('es_id').AsInteger,
                                    sdqConsulta.FieldByName('le_id').AsInteger]);
*)

//        if HayAusentes then
//        begin
          fObsSubLote := TfrmObsSubLote.Create( Self );
          try
            fObsSubLote.Caption := 'Obs. Lote Nº ' + sdqConsulta.FieldByName('le_id').AsString +
                                   ' - CUIT ' + sdqConsulta.FieldByName('em_cuit').AsString +  ' - ' + sdqConsulta.FieldByName('em_nombre').AsString +
                                   ' - Est. ' + sdqConsulta.FieldByName('es_nroestableci').AsString;
            fObsSubLote.FIDLote := sdqConsulta.FieldByName('le_id').AsInteger;
            fObsSubLote.FIDEstableci := sdqConsulta.FieldByName('es_id').AsInteger;
            fObsSubLote.tbRefrescarClick(Sender);
            Abrir(TfrmObsSubLote, fObsSubLote, tmvNormal, nil);
            fObsSubLote.Cabecera := ' - No Gestión de Ausentes - ' + #13#10; 
            fObsSubLote.tbNuevoClick(Sender);
            NoActualizaNoGestion := not fObsSubLote.CargoObs;
          finally
            fObsSubLote.Free;
          end;

          if NoActualizaNoGestion then
            MsgBox('El lote no se marcará para no gestión porque no se cargó la observación.', MB_ICONINFORMATION + MB_OK)
          else
            EjecutarSqlEx ('UPDATE hys.hel_estadolote ' +
                           ' SET el_fechanogestionaus = art.actualdate ' +
                           ' WHERE el_id = :pid ',
                           [sdqConsulta.FieldByName('el_id').AsInteger]);
//        end;
      end;
      sdqConsulta.Next
    end;
    sdqConsulta.EnableControls;

    NotificarList.Clear;
    RefreshData;
  end;
end;

procedure TfrmSeguimientoEstudios.grdEstudiosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqEstudios.FieldByName ('dl_fechabaja').IsNull then
  begin
    AFont.Color := clRed;
    if Highlight then
      Background := clNavy
  end
end;

procedure TfrmSeguimientoEstudios.RegistrarEstudio(aId: integer;
  aUsuario: String);
begin
  EjecutarSqlSTEx(' INSERT INTO hys.her_estudiorealizado ' +
                  '             (er_idestudio, er_idtrabajador, er_fechaalta, er_usualta, er_idestab) ' +
                  '   SELECT DISTINCT dl_idestudio, dl_idtrabajador, ' + SqlValue(DBDateTime) + ', :usuario, dl_idestableci ' +
                  '     FROM art.aer_estriesg, art.aes_estudios, hys.hdl_detallelote ' +
                  '    WHERE dl_id = :ID ' +
                  '      AND es_id = dl_idestudio ' +
                  '      AND es_codigo = er_estudio ' +
                  '      AND er_periodicidad = 0 ' +
                  '      AND NOT EXISTS(SELECT 1 ' +
                  '                       FROM hys.her_estudiorealizado ' +
                  '                      WHERE er_idtrabajador = dl_idtrabajador ' +
                  '                        AND er_idestab = dl_idestableci ' + 
                  '                        AND er_idestudio = dl_idestudio) ', [aUsuario, aId]
                 );
end;

procedure TfrmSeguimientoEstudios.tbOrdenarAuditarClick(Sender: TObject);
begin
  SortDialogAuditar.Execute;
end;

end.

