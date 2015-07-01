{-----------------------------------------------------------------------------
 Unit Name: unGenLotesAMP
 Author:    racastro
 Date:      08/2007
 Purpose:   Generación de Lotes AMP
 History:
-----------------------------------------------------------------------------}

unit unGenLotesAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraEstudio, StdCtrls, Mask, ToolEdit, DateComboBox, CustomDlgs,
  unFraCodigoDescripcion, General, unSesion, unListaEMail, JvNetscapeSplitter,
  unfraEstablecimiento_OLD, unArtFrame, unArtDbFrame, unFraEmpresaAfi,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, JvgGroupBox, 
  unfraPrestadorAMP, FormPanel, unfraPrestadorAMPCuit, unFraEmpresa,
  unFraEstablecimiento, ExComboBox, unExportPDF, Strfuncs, DateTimeFuncs,
  JvExExtCtrls, Menus, DateUtils, CheckLst, JvExCheckLst, JvCheckListBox,
  ARTCheckListBox, unComunesAMP, unFraCodDesc, PatternEdit, ComboEditor,
  CheckCombo, RxToolEdit, RxPlacemnt;

type
  TfrmGenLotesAMP = class(TfrmCustomConsulta)
    Bevel2: TBevel;
    Bevel3: TBevel;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    gbTrabajadores: TJvgGroupBox;
    ArtDBGrid1: TArtDBGrid;
    sdqTrabajadores: TSDQuery;
    dsTrabajadores: TDataSource;
    sdqRiesgos: TSDQuery;
    dsRiesgos: TDataSource;
    gbRiesgos: TJvgGroupBox;
    ArtDBGrid2: TArtDBGrid;
    ordTrabajadores: TSortDialog;
    ordRiesgos: TSortDialog;
    fpDatosLote: TFormPanel;
    Label6: TLabel;
    Label7: TLabel;
    chkNotificacionPrestador: TCheckBox;
    memObservaciones: TMemo;
    Bevel7: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraPrestador: TfraPrestadorAMPCuit;
    sdqDatosPQ: TSDQuery;
    fraEmpresa: TfraEmpresa;
    lbEstableci: TLabel;
    ToolBar1: TToolBar;
    tbOrdTrabajadores: TToolButton;
    tbOrdRiesgos: TToolButton;
    tbGenerarLote: TToolButton;
    cbAsigLote_obsoleto: TExComboBox;
    Label8: TLabel;
    tbSeparador: TToolButton;
    tbSeleccionar: TToolButton;
    sdqConsolidado: TSDQuery;
    dsConsolidado: TDataSource;
    lbCPostal: TLabel;
    edCPostalFiltro: TEdit;
    tbVerEstabCUIT: TToolButton;
    tbRefrescarTrabajadores: TToolButton;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    tbSolicitarPresupuesto: TToolButton;
    btnPresupuesto: TButton;
    edMAX_FECHA_SOLICITUD_AMPDesde: TDateComboBox;
    Label9: TLabel;
    edMAX_FECHA_SOLICITUD_AMPHasta: TDateComboBox;
    Label10: TLabel;
    chkSinPresupuesto: TCheckBox;
    fpTipoOperativo: TFormPanel;
    rgOperativo: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    lblOperativo: TLabel;
    sdqListado: TSDQuery;
    dsListado: TDataSource;
    dbgListado: TDBGrid;
    mnuExportar: TPopupMenu;
    mnuExpMaestroDetalle: TMenuItem;
    mnuExpConsolidado: TMenuItem;
    mnuExpListadeEstablecimientos: TMenuItem;
    chbIncluirAsigFuturas: TCheckBox;
    mnuImprimir: TPopupMenu;
    mnuRptListadeEstablecimientos: TMenuItem;
    mnuRptMaestroDetalle: TMenuItem;
    tbAgendaObsAsig: TToolButton;
    tbSimular: TToolButton;
    lblSimulacion: TLabel;
    chbIncluirDerivados: TCheckBox;
    chbIncluirGBA: TCheckBox;
    chbProcesarVencidos: TCheckBox;
    lblFechaRelev: TLabel;
    edFechaRelevDesde: TDateComboBox;
    lblRelevHasta: TLabel;
    edFechaRelevHasta: TDateComboBox;
    ToolButton1: TToolButton;
    fpRelevamientoActivacion: TFormPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    btnCopRecepAceptar: TButton;
    btnCopRecepCancelar: TButton;
    clbRelevamiento: TJvCheckListBox;
    tbActivacionRelev: TToolButton;
    btnSelEstudios: TButton;
    fpSelectEstudios: TFormPanel;
    btnAceptarSeleccion: TButton;
    Button4: TButton;
    lstSelectEstudios: TARTCheckListBox;
    chkActualizarAsig: TCheckBox;
    chkNotificacionEmpresa: TCheckBox;
    fpNotificacionEmpresa: TFormPanel;
    Button3: TButton;
    Button5: TButton;
    rgTipoEnvio: TRadioGroup;
    fraDepart: TfraCodDesc;
    Label38: TLabel;
    spdoinsertarestudiotrab: TSDStoredProc;
    sdqInsercionEstudios: TSDQuery;
    cbEmpresasVIP: TCheckBox;
    cbEmpresasNoVip: TCheckBox;
    lbObservacionSolPres: TLabel;
    edObservacionSolPres: TMemo;
    FormPanel1: TFormPanel;
    Label11: TLabel;
    edObservacionSolPresMult: TMemo;
    Button6: TButton;
    Button7: TButton;
    Label15: TLabel;
    cmbTipoPrev: TCheckCombo;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure EjecutarPreConsulta(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbGenerarLoteClick(Sender: TObject);
    procedure tbOrdTrabajadoresClick(Sender: TObject);
    procedure tbOrdRiesgosClick(Sender: TObject);
    procedure fpDatosLoteShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure GenerarPqDatosPrestador(pLote: Integer; pPrestador, pListaEMail: String);
    procedure tbSeleccionarClick(Sender: TObject);
    procedure ArtDBGrid2GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbVerEstabCUITClick(Sender: TObject);
    procedure tbRefrescarTrabajadoresClick(Sender: TObject);
    procedure tbSolicitarPresupuestoClick(Sender: TObject);
    procedure btnPresupuestoClick(Sender: TObject);
    procedure chkSinPresupuestoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuExpMaestroDetalleClick(Sender: TObject);
    procedure mnuExpConsolidadoClick(Sender: TObject);
    procedure mnuExpListadeEstablecimientosClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure mnuRptListadeEstablecimientosClick(Sender: TObject);
    procedure mnuRptMaestroDetalleClick(Sender: TObject);
    procedure tbAgendaObsAsigClick(Sender: TObject);
    procedure tbSimularClick(Sender: TObject);
    procedure RotuloSimulacion(Simular: boolean; OpActual, OpSimulado: String);
    procedure tbActivacionRelevClick(Sender: TObject);
    procedure btnCopRecepAceptarClick(Sender: TObject);
    procedure btnSelEstudiosClick(Sender: TObject);
    procedure btnAceptarSeleccionClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure rgTipoEnvioClick(Sender: TObject);
    procedure chkNotificacionEmpresaClick(Sender: TObject);
    procedure fpNotificacionEmpresaShow(Sender: TObject);
  private
    FEstudios: String;
    FSqlSiniestrado: String;
    FFiltros: String;
    FFiltroCP : String;
    FGenerarLoteSinFechaCarga: Boolean;
    function GetComponenteSeguridad: TSeguridad;
    procedure OnEmpresaChange(Sender : TObject);
    procedure OnEstablecimientoChange(Sender : TObject);
    procedure AbrirTrabajadores(Operativo: String);
//    procedure NotificarAsignacionPresupuesto(aIdLote: integer);       // TK 54516
    function ArmarFiltrosConsulta(Periodicidad : Integer; sEstudios: String): String;
    function ObtenerPeriodicidad(TipoOperativo: String): Integer;
    function ObtenerEstudios: String;
//    function Get_TextoMailAprobarPresup(NroPresupuesto:integer; sNomPrestador, sCuitPrestador: string): String;   // comentado por TK 54516
  protected
    FIDLote : Integer;
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses unPrincipal, unDmPrincipal, AnsiSql, unRptInformeAPrestador,
  unMoldeEnvioMail, unVisualizador, unConsExpConsolidada, unConsEstabCUIT, unArt, VCLExtra,
  unRptInformeGenAMP, unFraRiesgo, unRptInformeGenAMPDet, unObsAsigLote;

const

  FromConsultaBase = '  FROM hys.v_trabajadores_con_riesgo vr, tmp.tgl_genlotes, hys.hur_ultimorelevamiento ';
  WhereConsultaBase = ' WHERE vr.rs_cuit = :rs_cuit ' +
            '       AND vr.rs_estableci = :rs_estableci ' +
            '       AND ur_cuit = rs_cuit ' +
            '       AND ur_estableci = rs_estableci ' +
            '       AND ur_fecharelev = rs_fecha ' +
            '       AND gl_idestableci = rs_idestableci ' +
            '       AND gl_fecha = rs_fecha ';

{$R *.DFM}


function TfrmGenLotesAMP.GetComponenteSeguridad: TSeguridad;
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

procedure TfrmGenLotesAMP.ClearData;
begin
  fraEmpresa.Clear;
  fraEstablecimiento.Limpiar;
  cmbTipoPrev.Clear;
  sdqConsulta.Close;
//  cbAsigLote.ItemIndex := -1;
  edMAX_FECHA_SOLICITUD_AMPDesde.Clear;
  edMAX_FECHA_SOLICITUD_AMPHasta.Clear;
  chkSinPresupuesto.Checked := False;
  chbIncluirAsigFuturas.Checked := false;
  chbIncluirDerivados.Checked := false;
  chbIncluirGBA.Checked := false;
  inherited;
end;

procedure TfrmGenLotesAMP.EjecutarPreConsulta(Sender: TObject);
var
  sIn,
  sSql,
  FFiltros2 : String;
  i: integer;
begin
  FSqlSiniestrado:= 'NVL2 ((SELECT DISTINCT 1 ' +
                    '         FROM art.sex_expedientes ' +
                    '        WHERE ex_altamedica IS NULL ' +
                    '          AND NVL (ex_tipo, ''1'') <> ''3'' ' +
                    '          AND NVL (ex_causafin, '' '') NOT IN (''02'', ''95'', ''99'') ' +
                    '          AND ex_cuit = vr.rs_cuit ' +
                    '          AND ex_cuil = vr.rs_cuil ' +
                    '          AND ex_contrato = vr.rs_contrato), ''SI'', ''NO'') ';

  sdqTrabajadores.Close;
  sdqRiesgos.Close;

  FFiltros := '';
  FFiltroCP := '';
  FFiltros2 := '';

  if fraEmpresa.IsSelected then
    FFiltros := FFiltros + ' AND ur_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text);

  if fraEstablecimiento.IsSelected then
    FFiltros := FFiltros + ' AND ur_estableci = ' + fraEstablecimiento.edCodigo.TextSql + ' ';

  if chkSinPresupuesto.Checked then
    FFiltros2 := FFiltros2 + ' AND ur_fechaultsolpresup IS NULL ';

  if cbEmpresasVIP.Checked then
      FFiltros := FFiltros +
        ' AND EXISTS(SELECT DISTINCT 1 '+
        '        FROM comunes.cev_empresavip,afi.aem_empresa '+
        '       WHERE ev_idempresa = em_id '+
        '         AND em_cuit = ur_cuit '+
        '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';

  if cbEmpresasNoVip.Checked then
      FFiltros := FFiltros +
        ' AND NOT EXISTS(SELECT DISTINCT 1 '+
        '        FROM comunes.cev_empresavip,afi.aem_empresa '+
        '       WHERE ev_idempresa = em_id '+
        '         AND em_cuit = ur_cuit '+
        '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';
  

  if (cmbTipoPrev.Text <> '') then
  begin
    sIn := '';
    for i:=0 to cmbTipoPrev.Items.Count-1 do
      if cmbTipoPrev.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(integer(cmbTipoPrev.Items.Objects[i]));
      end;
    FFiltros := FFiltros + ' AND art.hys.get_tipo_empresa_prevencion(al_idempresa) IN (' + sIn + ')';
  end;

  FFiltros2 := FFiltros2 + SqlBetweenDateTime(' AND ur_fechaultsolpresup ', edMAX_FECHA_SOLICITUD_AMPDesde.Date, edMAX_FECHA_SOLICITUD_AMPHasta.Date, True);

  // Elimino del temporal
  EjecutarSqlEx('DELETE FROM tmp.tgl_genlotes ' +
                '      WHERE gl_usuario = :usuario ', [Sesion.UserID]);

  sSql := 'INSERT INTO tmp.tgl_genlotes ' +
          '  SELECT idestableci, :usuario, 0, fecha, operativo, tmp.seq_tgl_id.NEXTVAL, NULL, NULL ' +
          '    FROM(SELECT /*+ RULE */ ' +
          '                es_id idestableci, cn_fecharelevamiento fecha, ' +
          '                al_tipoproxoperacion operativo, es_nroestableci, al_fechaproxoperacion ' +
          '           FROM afi.age_grupoeconomico, ' +
          '                afi.aes_establecimiento, ' +
          '                afi.aco_contrato, ' +
          '                afi.aem_empresa, ' +
          '                hys.hur_ultimorelevamiento, ' +
          '                hys.hcn_cabeceranomina, ' +
          '                hys.hal_asignacionlote ' +
          '          WHERE ge_id(+) = em_idgrupoeconomico ' +
          '            AND es_contrato = co_contrato ' +
          '            AND es_nroestableci = al_nroestableci ' +
          '            AND NVL(co_totempleadosactual, co_totempleados) > 0 ' +
          '            AND co_contrato = art.get_vultcontrato (em_cuit) ' +
          '            AND co_idempresa = em_id ' +
          '            AND em_id = al_idempresa ' +
          '            AND ur_cuit = cn_cuit ' +
          '            AND ur_estableci = cn_estableci ' +
          '            AND cn_id = al_idcabrelevamientoactivo ' +

          '            AND al_idultsubloteasignado IS NULL ' +

          '            AND al_tipoproxoperacion <> ''R'' ' +


                       iif (edFechaRelevDesde.Date <> 0,
                            ' AND NVL(cn_fecharelevamiento, '''') >= ' + SqlValue(edFechaRelevDesde.Date), '') +

                       iif (edFechaRelevHasta.Date <> 0,
                            ' AND NVL(cn_fecharelevamiento, '''') <= ' + SqlValue(edFechaRelevHasta.Date), '') +


                       iif (chbProcesarVencidos.Checked,
                            ' AND ( (1=1) ',
                            ' AND ( NVL(cn_fecharelevamiento, '''') >= ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -12) ') +

                       iif (chbIncluirDerivados.Checked,
                            'OR (    NVL(al_fechaproxoperacion, '''') < ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -12) ' +
                            '    AND ur_fechaultsolpresup IS NOT NULL))',
                            ') ') +
          '            AND (' +
                            iif (chbIncluirAsigFuturas.Checked,
                                 '(1=1)',
          '                       al_fechaproxoperacion <= art.actualdate '
                                ) +
          '                 OR al_fechaproxoperacion IS NULL) ' +
                       iif(chbIncluirGBA.Checked, ' AND ge_codigo = ''GBA'' ', ' AND NVL(ge_codigo, '' '') <> ''GBA'' ') +
                       FFiltros +
                       FFiltros2 +
                       iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND es_cpostal = ' + SqlValue(edCPostalFiltro.Text)) +
          ')';

  EjecutarSqlEx(sSql, [Sesion.UserID]);

  // Si el operativo es SEMESTRAL, borro del temporal los regs. para
  // los Establecimientos cuya mínima periodicidad sea > 6
  // Es decir, dejo sólo los estudios semestrales
  if chbIncluirAsigFuturas.Checked then
  begin
    sSql := 'DELETE FROM tmp.tgl_genlotes tgl1 ' +
            '      WHERE tgl1.gl_usuario = :usuario ' +
            '        AND tgl1.gl_operativo = ''S'' ' +
            '        AND (SELECT MIN(rs_periodicidad) ' +
            '               FROM hys.v_trabajadores_con_riesgo, tmp.tgl_genlotes tgl2 ' +
            '              WHERE tgl2.gl_idestableci = rs_idestableci ' +
            '                AND tgl2.gl_fecha = rs_fecha ' +
            '                AND tgl1.gl_usuario = tgl2.gl_usuario ' +
            '                AND tgl1.gl_operativo = tgl2.gl_operativo ' +
            '                AND tgl2.gl_idestableci = tgl1.gl_idestableci ' +
            '                AND tgl2.gl_fecha = tgl1.gl_fecha) > 6';

    EjecutarSqlEx(sSql, [Sesion.UserID]);
  end;

  // Sumarizo Personal y Estudios
  sSql := 'UPDATE tmp.tgl_genlotes ' +
          '   SET (gl_personal, gl_estudios) = ' +
          '         (SELECT   /*+ RULE*/ ' +
          '                   COUNT(DISTINCT rs_idtrabajador) rs_personal, ' +
          '                   COUNT(DISTINCT rs_idtrabajador || rs_idestudio) rs_examenes ' +
          '              FROM hys.hal_asignacionlote, ' +
          '                   hys.v_trabajadores_con_riesgo vr, ' +
          '                   hys.hur_ultimorelevamiento ' +
          '             WHERE al_idempresa = rs_idempresa ' +
          '               AND al_nroestableci = ur_estableci ' +
          '               AND rs_idestableci = gl_idestableci ' +
          '               AND rs_fecha = gl_fecha ' +
          '               AND ur_cuit = rs_cuit ' +
          '               AND ur_estableci = rs_estableci ' +
          '               AND rs_periodicidad <= DECODE(al_tipoproxoperacion, ' +
          '                                             ''S'', 6, ' +
          '                                             ''A'', 24, ' +
          '                                             24) ' +
                          FFiltros +
                          iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND rs_cpostal = ' + SqlValue(edCPostalFiltro.Text)) +
          '          GROUP BY rs_idestableci, rs_idempresa) ' +
          ' WHERE gl_usuario = :usuario ';

  EjecutarSqlEx(sSql, [Sesion.UserID]);

  // Defino los filtros adicionales
  FFiltros := FFiltros +
              FFiltros2 +
              iif(chkSinPresupuesto.Checked, ' AND ur_fechaultsolpresup IS NULL ', '') +
              SqlBetweenDateTime(' AND ur_fechaultsolpresup ', edMAX_FECHA_SOLICITUD_AMPDesde.Date, edMAX_FECHA_SOLICITUD_AMPHasta.Date, True) +
              iif (tbMaxRegistros.Down, ' AND ROWNUM <= ' + IntToStr(MaxRegistros), '');

  FFiltroCP := iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND es_cpostal = ' + SqlValue(edCPostalFiltro.Text));

  // Defino la consulta del Listado Detallado
  sdqListado.Sql.Clear;
  sdqListado.Sql.Text:= 'SELECT /*+ RULE*/ ' +
                        '       rs_cuit "CUIT", rs_estableci "ESTAB", rs_cuil "CUIL", ' +
                        '       rs_nombre_empresa "RAZON SOCIAL", rs_ciiu "CIIU", ' +
                        '       rs_domicilio "DOMICILIO", rs_nombre_estableci "ESTABLECIMIENTO", ' +
                        '       rs_provincia "PROVINCIA", rs_contrato "CONTRATO", ' +
                        '       rs_fecha "F.RELEV.", rs_cpostal "C.POSTAL", ' +
                        '       art.amp.get_infolote(rs_idestableci) "LOTE", ' +
                        '       DECODE(ur_operultlote, ' +
                        '              ''S'', ''SEMESTRAL'', ' +
                        '              ''A'', ''ANUAL'', ' +
                        '              '''') "ULT.OPERATIVO", ' +
                        '       DECODE(al_tipoproxoperacion, ' +
                        '              ''S'', ''SEMESTRAL'', ' +
                        '              ''A'', ''ANUAL'', ' +
                        '              ''ANUAL'') "PROX.OPERATIVO", ' +
                        '       al_fechaproxoperacion "F.PROX.OPER.", ' +
                        '       TRUNC(ur_fechaultsolpresup) "F.ULT.SOL.PRES.AMP", ' +
                        '       rs_nombre_trabajador "NOMBRE TRABAJADOR", rs_fechaingreso "F.INGRESO", ' +
                        '       rs_fechaalta "F.ALTA", rs_fechainiexpo "F.INICIO EXP.", ' +
                        '       rs_descripcion_riesgotrabajo "RIESGO", rs_codigo_estudio "COD.ESTUDIO", ' +
                        '       rs_descripcion_estudio "DESCR.ESTUDIO", rs_periodicidad "PERIOD.", ' +
                        '       rs_sector "SECTOR", rs_tarea "TAREA", rs_esop "ESOP", personal, ' +
                        '       estudios, TRUNC(ur_fechaaltarelev) "F.CARGA REL.", ' +
                                FSqlSiniestrado + ' siniestrado ' +
                        '  FROM (SELECT   rs_idempresa idempresa, rs_cuit cuit, rs_estableci estableci, ' +
                        '                 COUNT(DISTINCT rs_cuil) personal, ' +
                        '                 COUNT(DISTINCT rs_cuil || rs_codigo_estudio) estudios ' +
                        '            FROM hys.v_trabajadores_con_riesgo vr, hys.hal_asignacionlote hal2, ' +
                        '                 hys.hur_ultimorelevamiento hur2, tmp.tgl_genlotes tgl2 ' +
                        '           WHERE tgl2.gl_idestableci = vr.rs_idestableci ' +
                        '             AND tgl2.gl_fecha = vr.rs_fecha ' +
                        '             AND tgl2.gl_usuario = ' + SqlValue(Sesion.UserID) +
                        '             AND vr.rs_periodicidad <= DECODE(hal2.al_tipoproxoperacion, ' +
                        '                                              ''S'', 6, ' +
                        '                                              ''A'', 24, ' +
                        '                                              24) ' +
//                        '             AND ((hal2.al_tipoproxoperacion = ''S'') AND (rs_idestudio <> 0) OR (hal2.al_tipoproxoperacion = ''S'')) ' +
                        '             AND al_idempresa = rs_idempresa ' +
                        '             AND al_nroestableci = hur2.ur_estableci ' +

                        '             AND vr.rs_cuit = hur2.ur_cuit ' +
                        '             AND vr.rs_estableci = hur2.ur_estableci ' +
                        '             AND NVL(hur2.ur_fecharelev, '''') >= ' +
                        '                                          ADD_MONTHS(TRUNC(SYSDATE, ''MM''), ' +
                        '                                                     -12) ' +
                        '             AND art.afiliacion.check_cobertura(vr.rs_contrato) = 1 ' +
                                      FFiltros + FFiltroCP +
                                      iif(chbIncluirGBA.Checked, ' AND ge_codigo = ''GBA'' ', ' AND NVL(ge_codigo, '' '') <> ''GBA'' ') +
                                      iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND rs_cpostal = ' + SqlValue(edCPostalFiltro.Text)) +
                        '        GROUP BY rs_idempresa, rs_cuit, rs_estableci), ' +


                        '       hys.hal_asignacionlote, ' +
                        '       hys.v_trabajadores_con_riesgo, ' +
                        '       hys.hur_ultimorelevamiento, ' +
                        '       tmp.tgl_genlotes ' +
                        ' WHERE gl_idestableci = rs_idestableci ' +
                        '   AND gl_fecha = rs_fecha ' +
                        '   AND gl_usuario = ' + SqlValue(Sesion.UserID) +
                        '   AND gl_personal IS NOT NULL ' +
                        '   AND rs_cuit = ur_cuit ' +
                        '   AND rs_estableci = ur_estableci ' +
                        '   AND rs_periodicidad <= DECODE(al_tipoproxoperacion, ''S'', 6, ''A'', 24, 24) ' +
//                        '   AND ((al_tipoproxoperacion = ''S'') AND (rs_idestudio <> 0) OR (al_tipoproxoperacion = ''S'')) ' +
                        '   AND al_idempresa = idempresa ' +
                        '   AND al_nroestableci = estableci ' +
                        '   AND ur_cuit = cuit ' +
                        '   AND ur_estableci = estableci ' +
                        '   AND NVL(ur_fecharelev, '''') >= ADD_MONTHS(TRUNC(SYSDATE, ''MM''), -12) ' +
                        '   AND art.afiliacion.check_cobertura(rs_contrato) = 1 ' +
                            FFiltros + FFiltroCP +
                            iif(chbIncluirGBA.Checked, ' AND ge_codigo = ''GBA'' ', ' AND NVL(ge_codigo, '' '') <> ''GBA'' ') +
                            iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND rs_cpostal = ' + SqlValue(edCPostalFiltro.Text));
end;

procedure TfrmGenLotesAMP.RefreshData;
var
  sWhereDepart: string;
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;

  if fraDepart.IsSelected then
    sWhereDepart :=
        'AND art.utiles.get_partido(aes.es_cpostal, aes.es_provincia) = ' +
            SqlValue(fraDepart.cmbDescripcion.Text);

  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text :=
        'SELECT                                                                                                    /*+ RULE*/ '
      + '      co_vigenciahasta, '
      + '      es_localidad, '
      + '        iif_null ( '
      + '                  es_departamento, '
      + '                  art.utiles.get_partido ( '
      + '                                          aes.es_cpostal, '
      + '                                          aes.es_provincia '
      + '                                         ), '
      + '                  es_departamento '
      + '                 ) '
      + '           "Partido/Depart.", '
      + '        em_cuit rs_cuit, '
      + '        co_contrato rs_contrato, '
      + '        ur_fecharelev rs_fecha, '
      + '        TRUNC (ur_fechaaltarelev) rs_fechaalta, '
      + '        em_nombre rs_nombre_empresa, '
      + '        es_nroestableci rs_estableci, '
      + '        es_id rs_idestableci, '
      + '        em_id rs_idempresa, '
      + '        es_nombre rs_nombreestableci, '
      + '        ac_relacion rs_ciiu, '
      + '        es_cpostal rs_cpostal, '
      + '        al_idcabrelevamientoactivo, '
      + '        art.utiles.armar_domicilio ( '
      + '                                    es_calle, '
      + '                                    es_numero, '
      + '                                    es_piso, '
      + '                                    es_departamento, '
      + '                                    es_localidad '
      + '                                   ) '
      + '           rs_domicilio, '
      + '        pv_descripcion rs_provincia, '
      + '        gl_personal rs_personal, '
      + '        gl_estudios rs_examenes, '
      + '        art.amp.get_infolote (es_id) lote, '
      + '        gl_operativo, '
      + '        al_fechaproxoperacion f_prox_oper, '
      + '        DECODE (ur_operultlote, ''S'', ''SEMESTRAL'', ''A'', ''ANUAL'', '''') ult_operativo, '
      + '        ur_operultlote, '
      + '        DECODE (al_tipoproxoperacion, ''S'', ''SEMESTRAL'', ''A'', ''ANUAL'', ''ANUAL'') prox_operativo, '
      + '        al_tipoproxoperacion, '
      + '        ur_fechaultsolpresup AS max_fecha_solicitud_amp, '
      + '        ur_estadoultlote, '
      + '        (SELECT  ''S'' '
      + '           FROM  hys.hro_relevoperativo, '
      + '                 hys.hcn_cabeceranomina '
      + '          WHERE  cn_id = ro_idcabeceranomina '
      + '             AND cn_cuit = em_cuit '
      + '             AND cn_estableci = es_nroestableci '
      + '             AND ro_tipooperativo = ''S'' '
      + '             AND ro_idsublote = '
      + '                    (SELECT  MAX (ro_idsublote) '
      + '                       FROM  hys.hro_relevoperativo, '
      + '                             hys.hcn_cabeceranomina '
      + '                      WHERE  cn_id = ro_idcabeceranomina AND cn_cuit = em_cuit AND cn_estableci = es_nroestableci) '
      + '             AND NOT EXISTS (SELECT  1 '
      + '                               FROM  hys.hro_relevoperativo '
      + '                              WHERE  cn_id = ro_idcabeceranomina AND ro_tipooperativo = ''A'')) '
      + '           iniciado_con_semestral, '
      + '           (select te_codigo from hys.hte_tipoempresaprev where te_id = art.hys.get_tipo_empresa_prevencion(em_id)) tipoprev '
      + '  FROM  cpv_provincias, '
      + '        cac_actividad, '
      + '        hys.hur_ultimorelevamiento, '
      + '        hys.hal_asignacionlote, '
      + '        aem_empresa, '
      + '        aco_contrato, '
      + '        afi.aes_establecimiento aes, '
      + '        tmp.tgl_genlotes '
      + ' WHERE  pv_codigo = es_provincia '
      + '    AND ac_id = co_idactividad '
      + '    AND ur_cuit = em_cuit '
      + '    AND ur_estableci = es_nroestableci '
      + '    AND al_idempresa = em_id '
      + '    AND al_nroestableci = es_nroestableci '
      + '    AND es_fechabaja IS NULL '
      + '    AND em_id = co_idempresa '
      + '    AND co_estado = 1 '
      + '    AND co_contrato = es_contrato '
      + '    AND es_id = gl_idestableci '
      + '    AND gl_personal IS NOT NULL '
      + '    AND gl_usuario = ' + SqlValue(Sesion.UserID)
      +     FFiltros + FFiltroCP
      +     iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND es_cpostal = ' + SqlValue(edCPostalFiltro.Text))
      +     sWhereDepart
      ;

  inherited;
end;

procedure TfrmGenLotesAMP.AbrirTrabajadores(Operativo: String);
var
  Periodicidad: integer;
  sEstudios: String;
begin
  Periodicidad := ObtenerPeriodicidad(Operativo);

  sEstudios := ObtenerEstudios;

  with sdqTrabajadores do
  begin
    SQL.Clear;
    SQL.Add('SELECT rs_cuit,rs_estableci, rs_cuil, rs_idtrabajador, rs_nombre_trabajador rs_nombretrabajador, '+
            '       rs_fechaingreso, TO_DATE(rs_fechaalta, ''dd/mm/yyyy'') rs_fechaalta, ' +
            '       COUNT(DISTINCT rs_codigo_estudio) rs_estudios ,' +
                    'MAX(' + FSqlSiniestrado + ') siniestrado' +
            FromConsultaBase +
            WhereConsultaBase+
            ArmarFiltrosConsulta(Periodicidad, sEstudios)+
            'GROUP BY rs_cuit,rs_estableci, rs_cuil, rs_idtrabajador, rs_nombre_trabajador, ' +
            '         rs_fechaingreso, TO_DATE(rs_fechaalta, ''dd/mm/yyyy'')');
    Open
  end;

  with sdqRiesgos do
  begin
    SQL.Clear;
    SQL.Add('SELECT rs_fechainiexpo, ' +
            '       rs_fechaalta, ' +
            '       rs_fecha, rs_riesgo, ' +
            '       rs_descripcion_riesgotrabajo rs_descripcionriesgo, ' +
            '       rs_codigo_estudio rs_codigoestudio, ' +
            '       rs_descripcion_estudio rs_descripcionestudio, rs_periodicidad, ' +
            '       rs_sector, rs_tarea, rs_esop ' +
            FromConsultaBase +
            WhereConsultaBase+
            ArmarFiltrosConsulta(Periodicidad, sEstudios)+
            '   AND rs_idtrabajador = :rs_idtrabajador '
           );
    Open
  end;
end;

function TfrmGenLotesAMP.ArmarFiltrosConsulta(Periodicidad : Integer; sEstudios: String) : String;
var
  sSql : String;
begin
  sSql :=
    '   AND gl_usuario = ' + SqlValue(Sesion.UserID) +
    '   AND rs_periodicidad <= ' + SqlInt(Periodicidad) +
    iif(sEstudios <> '', ' AND rs_codigo_estudio IN(' + sEstudios + ') ', '') +
    // iif(Periodicidad=6, ' AND RS_IDESTUDIO <> 0 ', '') +
    FFiltros +
    iif(chbIncluirGBA.Checked, ' AND ge_codigo = ''GBA'' ', ' AND NVL(ge_codigo, '' '') <> ''GBA'' ') +
    iif(IsEmptyString(edCPostalFiltro.Text), '', ' AND rs_cpostal = ' + SqlValue(edCPostalFiltro.Text));
  Result := sSql;
end;

function TfrmGenLotesAMP.ObtenerPeriodicidad(TipoOperativo : String) : Integer;
begin
  if TipoOperativo = 'S' then
    Result := 6
  else
    Result := 24;
end;

function TfrmGenLotesAMP.ObtenerEstudios : String;
var
  sEstudios : String;
  i : Integer;
begin
  sEstudios := '';
   if lstSelectEstudios.CheckCount <> 0 then
  begin
    for i := 0 to lstSelectEstudios.Count - 1 do
      if lstSelectEstudios.Checked[i] then
        sEstudios := sEstudios + QuotedStr(copy(lstSelectEstudios.Items[i], 1, 8)) + ',';
    sEstudios := Copy(sEstudios, 0, Length(sEstudios) - 1);
  end;
  Result := sEstudios;
end;



procedure TfrmGenLotesAMP.FormCreate(Sender: TObject);
var
  aSeguridad: TSeguridad;
begin
  FGenerarLoteSinFechaCarga := false;
  aSeguridad := GetComponenteSeguridad;

  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL) depto WHERE 1=1'
            ;

  end;

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

  with GetQuery('SELECT * FROM HYS.HTE_TIPOEMPRESAPREV WHERE TE_APLICA like ''%C%'' AND TE_FECHABAJA IS NULL ') do
  try
    while not Eof do
    begin
      cmbTipoPrev.Items.AddObject(fieldbyname('TE_CODIGO').AsString, TObject(fieldbyname('TE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  inherited;

  gbTrabajadores.Collapsed := true;
  gbRiesgos.Collapsed := true;

  fraEmpresa.ShowBajas      := True;
  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEmpresa.ContratoActivo := True;

  fraEstablecimiento.OnChange := OnEstablecimientoChange;
  edFechaRelevDesde.Date := AddYears(FirstDayOfYear(DBDate), -3);
end;

procedure TfrmGenLotesAMP.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.mskCUIT.Text ;
  sdqConsulta.Close;
  sdqTrabajadores.Close;
  sdqRiesgos.Close;
end;

procedure TfrmGenLotesAMP.OnEstablecimientoChange(Sender: TObject);
begin
  sdqConsulta.Close;
end;

procedure TfrmGenLotesAMP.tbRefrescarClick(Sender: TObject);
begin
  gbTrabajadores.Collapsed := true;
  gbRiesgos.Collapsed := true;

  EjecutarPreConsulta(Sender);

  inherited;
end;

procedure TfrmGenLotesAMP.tbLimpiarClick(Sender: TObject);
begin
  sdqTrabajadores.Close;
  sdqRiesgos.Close;
  edFechaRelevDesde.Date := AddYears(FirstDayOfYear(DBDate), -3);
  fraDepart.Clear;
  inherited;
end;

procedure TfrmGenLotesAMP.tbGenerarLoteClick(Sender: TObject);

  function HayLotesPendientes: Boolean;
  var
    i: Integer;
    Ok: boolean;
  begin
    i := 0;
    Ok := true;

    while (i < Grid.SelCount) and Ok do
    begin
      Grid.GotoSelection (i);
      Ok := AreIn(sdqConsulta.FieldByName ('ur_estadoultlote').AsString, ['', 'T', 'R', 'N', 'B', 'L', 'J', 'E', 'O', 'Z']);
      inc (i)
    end;

    Result := not Ok
  end;

var
  Periodicidad: integer;
begin
  lstSelectEstudios.Clear;

  gbTrabajadores.Collapsed := True;

  if Grid.SelCount < 1 then
    Exit;

  if HayLotesPendientes then
  begin
    MsgBox('Existen lotes en estado Pendiente ó sólo Aprobado. ' + #13 +
           'No es posible generar un nuevo lote.', MB_ICONERROR);
    Exit
  end;

  if Grid.SelCount = 1 then
  begin
    Periodicidad := iif(sdqConsulta.FieldByName ('Prox_Operativo').AsString[1] = 'S', 24, 6);

    // Verifico si hay estudios a realizarse para el operativo opuesto al próximo
    if ExisteSQLEx ('SELECT /*+ RULE*/ 1 ' +
                    '  FROM hys.v_trabajadores_con_riesgo vr, hys.hcn_cabeceranomina, hys.hal_asignacionlote ' +
                    ' WHERE rs_cuit = cn_cuit ' +
                    '   AND rs_estableci = cn_estableci ' +
                    '   AND rs_fecha = cn_fecharelevamiento ' +
                    '   AND rs_periodicidad <= :PERIODICIDAD' +
                    '   AND cn_cuit = :CUIT ' +
                    '   AND cn_id = al_idcabrelevamientoactivo ' +
                    '   AND al_nroestableci = :ESTABLECIMIENTO ',
//                    iif(Periodicidad=6, ' AND RS_IDESTUDIO <> 0 ', ''),
                    [Periodicidad,
                     sdqConsulta.FieldByName ('rs_cuit').AsString,
                     sdqConsulta.FieldByName ('rs_estableci').AsInteger]) then
    begin
      lblOperativo.Caption := 'El lote a generarse corresponde a un operativo ' +
                              sdqConsulta.FieldByName ('Prox_Operativo').AsString  +
                              '. Si desea, puede cambiarlo. ';
      rgOperativo.ItemIndex := iif(sdqConsulta.FieldByName ('Prox_Operativo').AsString[1] = 'S', 0, 1);

      fpTipoOperativo.Caption := 'Operativo a realizar';
      if fpTipoOperativo.ShowModal <> mrOk then
        Exit
    end
    else
      rgOperativo.ItemIndex := -1;
  end
  else
    rgOperativo.ItemIndex := -1;

  fpDatosLote.ShowModal
end;

procedure TfrmGenLotesAMP.tbOrdTrabajadoresClick(Sender: TObject);
begin
  ordTrabajadores.Execute
end;

procedure TfrmGenLotesAMP.tbOrdRiesgosClick(Sender: TObject);
begin
  ordRiesgos.Execute
end;

procedure TfrmGenLotesAMP.fpDatosLoteShow(Sender: TObject);
var
  S,
  sSubConsulta,
  sEstudios: String;
  Periodicidad,
  i,j: integer;
  tslEstudios,
  tslEstudiosSinDuplicados: TStringList;
  msgPreventFijo: string;
  sPrestadoresFijo: string;
  prestadorExtracondition : String;
begin
  // Creo la lista de TODOS los estudios a realizarse
  Periodicidad := 0;
  tslEstudiosSinDuplicados := TStringList.Create;
  tslEstudiosSinDuplicados.Sorted := true;
  tslEstudiosSinDuplicados.Duplicates := dupIgnore;
  sPrestadoresFijo := '';

  for i := 0 to Grid.SelCount - 1 do
  begin
    Grid.GotoSelection (i);

    // Determino la periodicidad de los estudios para el CUIT/Estab. actual
    case rgOperativo.ItemIndex of
       0 : Periodicidad := 6;
       1 : Periodicidad := 24;
      else Periodicidad := iif(sdqConsulta.FieldByName('al_tipoproxoperacion').AsString = 'S', 6, 24);
//      else Periodicidad := iif(ValorSqlEx('SELECT art.amp.get_operativoproxlote(:pidestableci) ' +
//                                          '  FROM dual',
//                                         [sdqConsulta.FieldByName('rs_idestableci').AsInteger]) = 'S', 6, 24);
    end;

    sSubConsulta := 'SELECT /*+ RULE*/ DISTINCT rs_codigo_estudio ' +
                    '  FROM hys.v_trabajadores_con_riesgo vr, hys.hcn_cabeceranomina, hys.hal_asignacionlote ' +
                    ' WHERE rs_cuit = cn_cuit ' +
                    '   AND rs_estableci = cn_estableci ' +
                    '   AND rs_fecha = cn_fecharelevamiento ' +
                    '   AND rs_periodicidad <= ' + SqlInt(Periodicidad) +
//                     iif(Periodicidad=6, ' AND RS_IDESTUDIO <> 0 ', '') +
                    '   AND es_sincosto = ''N'' ' +
                    '   AND cn_cuit = :CUIT ' +
                    '   AND cn_id = al_idcabrelevamientoactivo ' +
                    '   AND al_nroestableci = :ESTABLECIMIENTO ';


    tslEstudios := ValoresSqlEx(sSubConsulta, [sdqConsulta.FieldByName ('rs_cuit').AsString,
                                               sdqConsulta.FieldByName ('rs_estableci').AsInteger]);
    try
      tslEstudiosSinDuplicados.CommaText := tslEstudiosSinDuplicados.CommaText +
                                            #13 + tslEstudios.CommaText;
    finally
      tslEstudios.Free;
    end;
  end;

  memObservaciones.Lines.Clear;

  try

    if lstSelectEstudios.Count = 0 then
    begin
      for i:= 0 to tslEstudiosSinDuplicados.Count - 1 do
        lstSelectEstudios.Items.Add(tslEstudiosSinDuplicados.Strings[i] + ' - ' + ValorSqlEx('SELECT es_descripcion FROM art.aes_estudios WHERE es_codigo = :codigo', [tslEstudiosSinDuplicados.Strings[i]]));
    end;

    sEstudios := '';
    if lstSelectEstudios.CheckCount = 0 then
      for i := 0 to tslEstudiosSinDuplicados.Count - 1 do
        sEstudios := sEstudios + QuotedStr(tslEstudiosSinDuplicados[i]) + ','
    else
      for i := 0 to lstSelectEstudios.Count - 1 do
        if lstSelectEstudios.Checked[i] then
          sEstudios := sEstudios + QuotedStr(copy(lstSelectEstudios.Items[i], 1, 8)) + ',';

    sEstudios := Copy(sEstudios, 0, Length(sEstudios) - 1);
    FEstudios := sEstudios;

    fraPrestador.Enabled := true;

    if Trim(sEstudios) = '' then
    begin
      ShowMessage('Se encontraron estudios a realizarse sin cotización. ' + #13 +
                  'El lote de AMP no podrá generarse. ' + #13 +
                  'Por favor, verifique los costos de los estudios asociados ' +
                  'a los riesgos de los trabajadores.');
      sEstudios := 'NULL';

      fraPrestador.Clear;
      fraPrestador.Enabled := false
    end
    else begin
      with GetQueryEx(' SELECT hap.ap_idprestador ' +
                      ' FROM hys.hae_asigestablecimiento hae, hys.hap_asigprestadores hap, art.cpr_prestador cpr ' +
                      ' WHERE hap.ap_idasignacionestab = hae.ae_id ' +
                      '   AND cpr.ca_identificador = hap.ap_idprestador ' +
                      '   AND ae_contrato = :contrato ' +
                      '   AND (   ae_nroestableci = :estab ' +
                      '        OR hae.ae_todoslosestab = ''S'') ' +
                      '   AND SYSDATE BETWEEN hap.ap_vigenciadesde AND NVL(hap.ap_vigenciahasta, SYSDATE) ' +
                      '   AND hap.ap_fechabaja IS NULL ', [sdqConsulta.FieldByName('rs_contrato').AsInteger, sdqConsulta.FieldByName ('rs_estableci').AsInteger]) do
      try
        While not Eof do
        begin
          if sPrestadoresFijo <> '' then
            sPrestadoresFijo := sPrestadoresFijo + ', ';
          sPrestadoresFijo := sPrestadoresFijo + fieldbyname('ap_idprestador').AsString;
          next;
        end;
      finally
        free;
      end;

      with GetQuery(' SELECT /*+ RULE */ DISTINCT ca_identificador ' +
               '      FROM ( ' +
               '        SELECT /*+ RULE */ ca_identificador, pd_idestudio ' +
               '          FROM comunes.cpd_prestadorestudio, comunes.cpp_presupuestoprestador, ' +
               '               art.cpr_prestador, art.aes_estudios ' +
               '         WHERE pp_fechabaja IS NULL ' +
               '           AND es_codigo = pd_idestudio ' +
               '           AND es_sincosto = ''N'' ' +
               '           AND pp_vigenciadesde <= art.actualdate ' +
               '           AND ((art.actualdate <= pp_vigenciahasta) OR (pp_vigenciahasta IS NULL)) ' +
               '           AND pp_idestablecimiento = ' + SqlInteger(sdqConsulta.FieldByName ('rs_idestableci').AsInteger) +
               '           AND ca_identificador = pp_idprestador ' +
               '           AND ca_fechabaja IS NULL ' +
               '           AND pd_idpresupuesto = pp_id ' +
               '           AND pd_idtipovalor = 1 ' +
               '           AND pd_idestudio IN(SELECT DISTINCT er_estudio ' +
               '                                          FROM art.aer_estriesg ' +
               '                                         WHERE er_fechabaja IS NULL ' +
               '                                           AND er_estudio IN(' + sEstudios + ')) ' +
               '        UNION ALL ' +
               '        SELECT /*+ RULE */ ca_identificador, pd_idestudio ' +
               '          FROM comunes.cpd_prestadorestudio, art.cpr_prestador, art.aes_estudios ' +
               '         WHERE ca_identificador = pd_idprestador ' +
               '           AND ca_fechabaja IS NULL ' +
               '           AND es_codigo = pd_idestudio ' +
               '           AND es_sincosto = ''N'' ' +
               '           AND pd_idpresupuesto IS NULL ' +
               '           AND pd_vigenciadesde <= art.actualdate ' +
               '           AND ((art.actualdate <= pd_vigenciahasta) OR (pd_vigenciahasta IS NULL)) ' +
               '           AND pd_idtipovalor = 1 ' +
               '           AND EXISTS(SELECT 1 ' +
               '                        FROM art.aer_estriesg ' +
               '                       WHERE er_fechabaja IS NULL ' +
               '                         AND pd_idestudio = er_estudio ' +
               '                         AND er_estudio IN(' + sEstudios + ')) ' +
               '           AND ca_identificador IN ( SELECT ca_identificador ' +
               '                                      FROM comunes.cpd_prestadorestudio, comunes.cpp_presupuestoprestador, art.cpr_prestador ' +
               '                                     WHERE pp_fechabaja IS NULL ' +
               '                                       AND pd_vigenciadesde <= art.actualdate ' +
               '                                       AND ((art.actualdate <= pd_vigenciahasta) OR (pd_vigenciahasta IS NULL)) ' +
               '                                       AND pp_idestablecimiento = ' + SqlInteger(sdqConsulta.FieldByName ('rs_idestableci').AsInteger) +
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
               '                                        AND pp_idestablecimiento = ' + SqlInteger(sdqConsulta.FieldByName ('rs_idestableci').AsInteger) +
               '                                        AND ca_identificador = pp_idprestador ' +
               '                                        AND ca_fechabaja IS NULL ' +
               '                                        AND pp_viaticosbonif = ''S'')) ' +
               '        HAVING COUNT(DISTINCT pd_idestudio) = (SELECT COUNT(DISTINCT er_estudio) ' +
               '                                                 FROM art.aer_estriesg ' +
               '                                                WHERE er_fechabaja IS NULL ' +
               '                                                  AND er_estudio IN(' + sEstudios + ')) ' +
               '      GROUP BY ca_identificador ' +
               '      UNION ALL ' +
               '        SELECT /*+ RULE */ ca_identificador ' +
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
               '                                    AND cp_codigo = ' + SqlValue (sdqConsulta.FieldByName ('rs_cpostal').AsString) + ') ' +
               '           AND pd_idpresupuesto IS NULL ' +
               '           AND pd_vigenciadesde <= art.actualdate ' +
               '           AND ((art.actualdate <= pd_vigenciahasta) OR (pd_vigenciahasta IS NULL)) ' +
               '           AND pd_idtipovalor = 1 ' +
               '           AND EXISTS (SELECT 1 ' +
               '                         FROM art.aer_estriesg ' +
               '                        WHERE er_fechabaja IS NULL ' +
               '                          AND pd_idestudio = er_estudio ' +
               '                          AND er_estudio IN(' + sEstudios + ') ' +
               '                              ) ' +
               '      HAVING COUNT(DISTINCT pd_idestudio) = (SELECT COUNT(DISTINCT er_estudio) ' +
               '                                               FROM art.aer_estriesg ' +
               '                                              WHERE er_fechabaja IS NULL ' +
               '                                                AND er_estudio IN(' + sEstudios + '))' +
               '      GROUP BY ca_identificador'+
               '      UNION '+
               '      SELECT pc_idprestador ca_identificador '+
               '        FROM hys.hpc_prestadorcontrato, afi.aes_establecimiento '+
               '       WHERE pc_contrato = es_contrato '+
               '         AND pc_fechabaja IS NULL '+
               '         AND es_id = '+SqlInteger(sdqConsulta.FieldByName ('rs_idestableci').AsInteger)
               ) do
      try
        j := 0;
        prestadorExtracondition := '';
        while not Eof do
        begin
          if j = 0 then
          begin
            prestadorExtracondition := FieldByName('ca_identificador').AsString;
            j := 1;
          end
          else
            prestadorExtracondition := prestadorExtracondition + ','+ FieldByName('ca_identificador').AsString;
        Next;
        end;
        if prestadorExtracondition = '' then
          prestadorExtracondition := ' 0 ';
      finally
        Free;
      end;

      with fraPrestador do
      begin
        OrderBy := ' art.amp.get_amp_prestador(ca_identificador) DESC, costo, ca_descripcion ';
        ExtraCondition := ' AND ca_identificador IN( ' +prestadorExtracondition+' ) ' +
                          iif(sPrestadoresFijo <> '', ' AND ca_identificador IN(' + sPrestadoresFijo + ') ', '');

        S := '0';
        for i := 0 to Grid.SelCount - 1 do
        begin
          Grid.GotoSelection (i);

          S := S + ' + art.amp.get_costo_estudios (ca_identificador, ' +
                       SqlValue(sdqConsulta.FieldByName ('rs_cuit').AsString) + ', ' +
                       SqlValue(sdqConsulta.FieldByName ('rs_estableci').AsString) + ', ' +
                       SqlValue(String(iif (Periodicidad = 6, 'S', 'A'))) + ') ';
        end;

        ExtraFields := ', ca_direlectronica email ' +
                       ', TO_CHAR(' + S + ', ''99G999G999D99'') costo, ca_nombrefanta ';

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
    msgPreventFijo :=
        ValorSqlEx(
            'SELECT  ae_descripcionasig '
          + '  FROM  hys.hae_asigestablecimiento '
          + ' WHERE  ( (ae_idestab = :idestab) '
          + '      OR  (ae_contrato = :contrato AND ae_todoslosestab = ''S'')) '
          + '    AND ae_descripcionasig IS NOT NULL ',
          [ sdqConsulta.FieldByName('rs_idestableci').AsInteger,
            sdqConsulta.FieldByName('rs_contrato').AsInteger]);

    if msgPreventFijo <> EmptyStr then
      MessageBox(0, PChar(msgPreventFijo), PChar(Self.Caption), MB_ICONINFORMATION or MB_OK);

    chkNotificacionPrestador.Checked := false;
    chkNotificacionEmpresa.Checked := false;
    rgTipoEnvio.ItemIndex := -1;
  finally
    tslEstudiosSinDuplicados.Free;
  end;

  inherited;
end;

procedure TfrmGenLotesAMP.btnAceptarClick(Sender: TObject);
var
  i, Periodicidad,
  FIDRelevLote,
  fIDSublote: Integer;
  OpForzado, sEstudios,
  TipoOperativo: String;
begin
  VerificarMultiple (['Datos del Lote',
                      fraPrestador,
                      fraPrestador.IsSelected,
                      'Debe indicarse el prestador'
                     ]);

  Verificar((Grid.SelCount = 0), Grid, 'Debe seleccionar un registro.');
  Verificar((Grid.SelCount > 1), Grid, 'Solo se puede generar un lote por establecimiento.');

  fpDatosLote.Enabled := false;
  BeginTrans;
  try
    // Obtener ID del lote
    FIDLote := ValorSqlInteger ('SELECT MAX(le_id) FROM hys.hle_loteestudio') + 1;

    // Insertar nuevo lote
    EjecutarSqlST('INSERT INTO hys.hle_loteestudio ( ' +
                  '  le_id, ' +
                  '  le_idprestador, ' +
                  '  le_fechaalta, ' +
                  '  le_usualta, ' +

                  iif (chkNotificacionPrestador.Checked, '  le_fechanotificacion, ', '') +
                  iif (chkNotificacionPrestador.Checked, '  le_usunotificacion, ', '') +

                  '  le_observaciones, ' +
                  '  le_monto, ' +
                  '  le_estado) ' +
                  'VALUES ( ' +
                     SqlValue (FIDLote) + ', ' +
                     SqlValue (fraPrestador.Value) + ',' +
                  '  SYSDATE, ' +
                     SqlValue (Sesion.UserID) + ', ' +

                  iif (chkNotificacionPrestador.Checked, ' ART.ACTUALDATE, ', '') +
                  iif (chkNotificacionPrestador.Checked, SqlValue (Sesion.UserID) + ', ', '') +

                  SqlValue (Trim(memObservaciones.Lines.Text)) +
                  ', 0, ''P'')');

    for i := 0 to Grid.SelCount - 1 do
    begin
      Grid.GotoSelection (i);

      case rgOperativo.ItemIndex of
          0: TipoOperativo := 'S';
          1: TipoOperativo := 'A';
        else TipoOperativo := sdqConsulta.FieldByName ('gl_operativo').AsString;
      end;

      // Defino el operativo como forzado si no es el predeterminado
      OpForzado := iif(TipoOperativo <> sdqConsulta.FieldByName ('gl_operativo').AsString, 'S', 'N');

      //AbrirTrabajadores (TipoOperativo);
      Periodicidad := ObtenerPeriodicidad(TipoOperativo);
      sEstudios := ObtenerEstudios;

      with sdqInsercionEstudios do
      begin
        SQL.Clear;
        SQL.Add(
            'SELECT rs_estableci, rs_cuil, rs_idtrabajador, rs_codigo_estudio rs_codigoestudio,  '+
            '       rs_idestableci,rs_idempresa '+
                FromConsultaBase +
                WhereConsultaBase+
                ArmarFiltrosConsulta(Periodicidad, sEstudios));
        ParamByName('rs_cuit').AsString := sdqConsulta.FieldByName ('rs_cuit').AsString;
        ParamByName('rs_estableci').AsInteger := sdqConsulta.FieldByName ('rs_estableci').AsInteger;
        Open;
      end;

//      spdoinsertarestudiotrab.Prepare;

      with sdqInsercionEstudios do
      begin
        First;
        while not EoF do
        begin
          if not ExisteSqlEx (
            'SELECT 1 ' +
            '  FROM hys.hdl_detallelote ' +
            ' WHERE dl_idlote = :idlote ' +
            '   AND dl_idestableci = :idestableci ' +
            '   AND dl_idtrabajador = :idtrabajador ' +
            '   AND dl_idestudio = :idestudio ' +
            '   AND dl_fechabaja IS NULL',
            [FIDLote,
            FieldByName ('rs_idestableci').AsInteger,
            FieldByName ('rs_idtrabajador').AsInteger,
            FieldByName ('rs_codigoestudio').AsInteger]) then

              EjecutarSqlSTEx('INSERT INTO HYS.hdl_detallelote ( ' +
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
                              '  :idlote, ' +
                              '  :idestableci, ' +
                              '  :idtrabajador, ' +
                              '  :codigoestadio, ' +
                              '   art.amp.get_costo_estudio(:pidprestador, :pidestableci, :pestudio, trunc(sysdate), ''N''), ' +
                              '   SYSDATE, ' +
                              '  :Usuario, ' +
                              '  :idempresa)',
                                 [FIDLote,
                                 FieldByName ('rs_idestableci').AsInteger,
                                 FieldByName ('rs_idtrabajador').AsInteger,
                                 FieldByName ('rs_codigoestudio').AsInteger,
                                 fraPrestador.Value,
                                 FieldByName ('rs_idestableci').AsInteger,
                                 FieldByName ('rs_codigoestudio').AsString,
                                 Sesion.UserID,
                                 FieldByName ('rs_idempresa').AsInteger
                                 ]);

          Next
        end
      end;

      if not ExisteSQL ('SELECT 1 ' +
                        '  FROM hys.hrl_relevamientolote ' +
                        ' WHERE rl_idestableci = ' + SqlValue(sdqConsulta.FieldByName ('rs_idestableci').AsInteger) +
                        '   AND rl_fecha = ' + SqlDate(sdqConsulta.FieldByName ('rs_fecha').AsDateTime)) then
      begin
        // Obtener ID de hys.hrl_relevamientolote
        FIDRelevLote := GetSecNextVal ('hys.seq_hrl_id');

        // Insertar en tabla hys.hrl_relevamientolote
        EjecutarSqlST('INSERT INTO hys.hrl_relevamientolote ' +
                      '     VALUES (' + SqlValue(FIDRelevLote) + ', ' +
                                        SqlValue(sdqConsulta.FieldByName ('rs_idestableci').AsString) + ', ' +
                                        SqlDate(sdqConsulta.FieldByName ('rs_fecha').AsDateTime) + ', ' +
                                        SqlInteger(sdqConsulta.FieldByName ('rs_estableci').AsInteger) + ')');
      end
      else FIDRelevLote := ValorSql('SELECT rl_id ' +
                                    '  FROM hys.hrl_relevamientolote ' +
                                    ' WHERE rl_idestableci = ' + SqlValue(sdqConsulta.FieldByName ('rs_idestableci').AsInteger) +
                                    '   AND rl_fecha = ' + SqlDate(sdqConsulta.FieldByName ('rs_fecha').AsDateTime));
(*
      EjecutarSqlST('INSERT INTO hys.hel_estadolote (el_rlid, el_idlote, el_estado, el_operativo, el_fecharelevamiento, el_operativoforzado)' +
                    '     VALUES (' + SqlValue(FIDRelevLote) + ', ' +
                                      SqlValue(FIDLote) + ', ' +
                                      SqlValue('P') + ', ' +
                                      SqlValue(TipoOperativo) + ', ' +
                                      SqlDate(sdqConsulta.FieldByName ('rs_fecha').AsDateTime) + ', ' +
                                      SqlValue(OpForzado) + ')');
*)
{- NUEVA LÓGICA DE ASIGNACIONES !!!! -----------------------------------------}
      fIDSublote := GetSecNextVal ('hys.seq_hel_id');

      EjecutarSqlST('INSERT INTO hys.hel_estadolote (el_rlid, el_idlote, el_estado, el_operativo, el_fecharelevamiento, el_operativoforzado, el_id)' +
                    '     VALUES (' + SqlValue(FIDRelevLote) + ', ' +
                                      SqlValue(FIDLote) + ', ' +
                                      SqlValue('P') + ', ' +
                                      SqlValue(TipoOperativo) + ', ' +
                                      SqlDate(sdqConsulta.FieldByName ('rs_fecha').AsDateTime) + ', ' +
                                      SqlValue(OpForzado) + ', ' +
                                      SqlValue(fIDSublote) + ')');

      if (lstSelectEstudios.CheckCount = 0) or ((lstSelectEstudios.CheckCount > 0) and (chkActualizarAsig.Checked)) then
      begin
        EjecutarSqlSTEx('UPDATE hys.hal_asignacionlote ' +
                        '   SET al_idultsubloteasignado = :pidsublote, ' +
                        '       al_idultsubloteauditado = NULL, ' +
//                        '       al_secuencia = al_secuencia + 1, ' +
                        '       al_usumodif = :pusuario, ' +
                        '       al_fechamodif = SYSDATE ' +
                        ' WHERE al_idempresa = :pidempresa ' +
                        '   AND al_nroestableci = :pnroestableci ',
                        [fIDSublote,
                         Sesion.UserID,
                         sdqConsulta.FieldByName ('rs_idempresa').AsInteger,
                         sdqConsulta.FieldByName ('rs_estableci').AsInteger]);

        EjecutarSqlSTEx('INSERT INTO hys.hro_relevoperativo ' +
                        '            (ro_idcabeceranomina, ro_fechaasiglote, ro_tipooperativo, ' +
                        '             ro_fechaprevasig, ro_usualta, ro_fechaalta, ro_idsublote ' +
                        '            ) ' +
                        '     VALUES (:ro_idcabeceranomina, SYSDATE, :ro_tipooperativo, ' +
                        '             ' + SqlDate(sdqConsulta.FieldByName ('F_Prox_Oper').AsDateTime) + ', :ro_usualta, SYSDATE, :ro_idsublote ' +
                        '            ) ',
                        [sdqConsulta.FieldByName ('al_idcabrelevamientoactivo').AsInteger,
                         TipoOperativo,
                         Sesion.UserID,
                         fIDSublote]);

  {-----------------------------------------------------------------------------}

        EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                        '   SET ur_estadoultlote = art.amp.get_estadoultlote(:pidestableci), ' +
                        '       ur_fechaultsolpresup = NULL ' +
                        ' WHERE ur_cuit = :pcuit ' +
                        '   AND ur_estableci = :pnroestableci ',
                        [sdqConsulta.FieldByName ('rs_idestableci').AsInteger,
                         sdqConsulta.FieldByName ('rs_cuit').AsString,
                         sdqConsulta.FieldByName ('rs_estableci').AsInteger]);
      end;
    end { for };

    if (ValorSqlInteger ('SELECT NVL(SUM(dl_monto), 0) ' +
                        '  FROM hys.hdl_detallelote ' +
                        ' WHERE dl_idlote = ' + SqlValue (FIDLote)) > 0) or
       ((ValorSqlInteger ('SELECT NVL(SUM(dl_monto), 0) ' +
                        '  FROM hys.hdl_detallelote ' +
                        ' WHERE dl_idlote = ' + SqlValue (FIDLote)) = 0) and
        (ExisteSql(     ' SELECT pc_idprestador ca_identificador '+
                        '   FROM hys.hpc_prestadorcontrato, afi.aes_establecimiento '+
                        '  WHERE pc_contrato = es_contrato '+
                        '    AND pc_idprestador = '+ SqlValue(fraPrestador.Value)+
                        '    AND es_id = '+SqlValue(sdqConsulta.FieldByName ('rs_idestableci').AsInteger)+
                        '    AND pc_fechabaja IS NULL '))
        ) then
    begin
      // Calculo el costo total de los estudios
      EjecutarSqlST('UPDATE HYS.HLE_LOTEESTUDIO ' +
                    '   SET le_monto = (SELECT NVL(SUM(dl_monto), 0) ' +
                    '                     FROM hys.hdl_detallelote ' +
                    '                    WHERE dl_idlote = le_id ' +
                    '                      AND dl_fechabaja IS NULL) ' +
                    ' WHERE le_id = ' + SqlValue (FIDLote));

      CommitTrans;

      if chkNotificacionPrestador.Checked then
        GenerarPqDatosPrestador(FIDLote,
                                fraPrestador.Descripcion,
                                Trim(fraPrestador.sdqDatos.FieldByName('email').AsString));

      if chkNotificacionEmpresa.Checked then
        NotificarEmpresaPeriodicos(FIDLote, sdqConsulta.FieldByName('rs_contrato').AsInteger, sdqConsulta.FieldByName ('rs_idestableci').AsInteger, rgTipoEnvio.ItemIndex);

   //   NotificarAsignacionPresupuesto(FIDLote);     // TK 54516 - Ticket de NStabile (le envio un mail a camarillo con el aviso que habia que eliminar de esta aplicación, fecha 29/11/2013)

      Application.ProcessMessages;

      MsgBox(Format('Se ha generado el lote %d para el prestador %s.',
                    [FIDLote,
                     fraPrestador.Descripcion]) + #13 +
             iif (chkNotificacionPrestador.Checked, 'Se remitirá al mismo un e-mail con la notificación y ' + #13 +
                                           'la lista de estudios a realizar.', '') + #13 +
             iif (chkNotificacionEmpresa.Checked, 'Se remitirá a la empresa la notificación de la asignación', ''),
             MB_ICONINFORMATION);
    end
    else Rollback;

    fpDatosLote.Enabled := true;
    fpDatosLote.ModalResult := mrOk;
    Grid.UnselectAll;

    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback;
      fpDatosLote.Enabled := true;
      ErrorMsg (E, 'Error al generar el lote de estudios');
    end;
  end;
end;

procedure TfrmGenLotesAMP.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  lblSimulacion.Caption := '';
  tbSimular.Hint := '';
  tbSimular.Tag := 0;

  sdqTrabajadores.Close;
  sdqRiesgos.Close;

  inherited
end;

procedure TfrmGenLotesAMP.GenerarPqDatosPrestador(pLote: Integer; pPrestador, pListaEMail: String);
var
  NroPedido,
  IDPedidoWEB: Integer;
  rptInformeAPrestador: TrptInformeAPrestador;
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

    FDirectorioEMail := IncludeTrailingPathDelimiter(ValorSql ('SELECT tb_especial1 ' +
                                                               '  FROM art.ctb_tablas ' +
                                                               ' WHERE tb_clave = ''PATHS'' ' +
                                                               '   AND tb_codigo = ''005'' '));

    rptInformeAPrestador := TrptInformeAPrestador.Create( Self );
    try
      rptInformeAPrestador.FIDLoteRpt := pLote;
      ExportarPDF(rptInformeAPrestador.qrInformeAPrestador, FDirectorioEMail + Format('LOTE %d.pdf',[pLote]));
    finally
      rptInformeAPrestador.Free;
    end;

    // Obtengo el nro. de Pedido
    NroPedido := ValorSqlInteger ('SELECT hys.seq_hpr_id.nextval FROM dual');

    // Inserto el nuevo pedido
    EjecutarSql(
      'INSERT INTO hys.hpr_pedidosreporte(PR_ID, PR_EMAILRESPUESTA, PR_FECHAALTA, PR_USUALTA, PR_ASUNTO, PR_ORIGENPEDIDO, PR_FIRMA) ' +
      'VALUES (' + SqlValue(NroPedido) + ', ' + SqlValue(FListaMail) +
      ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ' + SqlValue('Estudios Periódicos - ' + FieldByName('em_nombre').AsString + ' Estab. ' +
      FieldByName('es_nroestableci').AsString) + ', ''A'',' +
      SqlValue('Sres. ' + pPrestador + #13#10 + #13#10 +
      'Se adjunta nota con la asignación del lote ' + IntToStr(pLote) + ' para la realización de los exámenes periódicos. ' + #13#10  + #13#10 +
      'Por favor confirmar la recepción de este mail.' + #13#10 + #13#10 +  #13#10 + #13#10 +  #13#10 +  #13#10 +  #13#10 +
      'Medicina Laboral' + #13#10 +
      'Provincia ART' + #13#10 +
      'medicinalaboral@provart.com.ar' + #13#10 +
      'Tel.: (011)4335-5100 int. 5207/ 5211/ 5193/ 5202 ') + ')'
              );

    while not EoF do
    begin
      // AMP
      IDPedidoWEB := GetSecNextVal ('hys.seq_hpw_id');
      EjecutarSql(
        'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
        'VALUES (' + SqlValue (IDPedidoWEB) + ', ' + SqlValue (101) + ', sysdate, ' +
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

procedure TfrmGenLotesAMP.tbSeleccionarClick(Sender: TObject);
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

procedure TfrmGenLotesAMP.ArtDBGrid2GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqRiesgos.FieldByName ('RS_PERIODICIDAD').AsInteger = 6 then
    AFont.Color := clBlue
end;

procedure TfrmGenLotesAMP.tbVerEstabCUITClick(Sender: TObject);
var
  Contrato: String;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  Contrato := sdqConsulta.FieldByName('rs_contrato').AsString;

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

procedure TfrmGenLotesAMP.tbRefrescarTrabajadoresClick(
  Sender: TObject);
begin
  if not sdqConsulta.Active then
    Exit;

  RotuloSimulacion(False, sdqConsulta.FieldByName('al_tipoproxoperacion').AsString, '')

//                   ValorSqlEx('SELECT art.amp.get_operativoproxlote(:pidestableci) ' +
//                              '  FROM dual',
//                              [sdqConsulta.FieldByName('rs_idestableci').AsInteger]), '');
end;

procedure TfrmGenLotesAMP.tbSolicitarPresupuestoClick(Sender: TObject);
var
  i: Integer;
  bContinuar: Boolean;
  Operativo,
  sSQL, strFechaPresupuesto, observacionSolPres : String;
  FechaPresupuesto: TDateTime;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una empresa/establecimiento.');

  if Grid.SelectedRows.Count = 1 then
  begin
    lblOperativo.Caption := 'El presupuesto será asociado a estudios ' +
                            sdqConsulta.FieldByName ('Prox_Operativo').AsString  +
                            'ES. Si desea, puede cambiarlo. ';
    rgOperativo.ItemIndex := iif(sdqConsulta.FieldByName ('Prox_Operativo').AsString[1] = 'S', 0, 1);

    fpTipoOperativo.Caption := 'Solicitud de presupuesto';
    try
      edObservacionSolPres.Visible := True;
      edObservacionSolPres.Clear;
      lbObservacionSolPres.Visible := True;
      fpTipoOperativo.Height := 252;
      if fpTipoOperativo.ShowModal <> mrOk then
        exit
    finally
      edObservacionSolPres.Visible := False;
      lbObservacionSolPres.Visible := False;
      fpTipoOperativo.Height := 124;
    end;
    observacionSolPres := edObservacionSolPres.Text;
  end
  else
  begin
    rgOperativo.ItemIndex := -1;
    observacionSolPres := edObservacionSolPresMult.Text;
  end;


  strFechaPresupuesto := '';
  FechaPresupuesto := ValorSqlDateTime(' SELECT MAX(PP_FECHAALTA) ' +
                                       ' FROM COMUNES.CSP_SOLICITUDPRESUPUESTO, COMUNES.CPP_PRESUPUESTOPRESTADOR ' +
                                       ' WHERE PP_IDESTABLECIMIENTO = SP_IDESTABLECIMIENTO ' +
                                       ' AND PP_FECHABAJA IS NULL ' +
                                       ' AND SP_ID = PP_IDSOLICITUD ' +
                                       ' AND PP_IDESTABLECIMIENTO = ' + SqlValue(sdqConsulta.FieldByName('RS_IDESTABLECI').AsInteger) +
                                       ' AND (SYSDATE - PP_FECHAALTA) < 31 ' +
                                       ' AND NVL(SP_OPERATIVO, ''A'') <> ''R''', 0);


  if (FechaPresupuesto <> 0) then
    strFechaPresupuesto := ' Existe un presupuesto con fecha: '+ FormatDateTime('dd/mm/yyyy', FechaPresupuesto) +  CRLF;


  if MsgAsk('Esta a punto de solicitar un pedido de presupuesto para ' + IntToStr(Grid.SelectedRows.Count) + ' empresas/establecimientos seleccionados.' + CRLF + strFechaPresupuesto + '¿Desea continuar?') then
  begin
    BeginTrans(True);
    try
      bContinuar := True;
      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        case rgOperativo.ItemIndex of
         -1: Operativo := sdqConsulta.FieldByName ('Prox_Operativo').AsString[1];
          0: Operativo := 'S';
          1: Operativo := 'A'
        end;

        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
        sSQL := 'SELECT 1 ' +
                '  FROM COMUNES.CSP_SOLICITUDPRESUPUESTO ' +
                ' WHERE SP_CONTRATO = :CONTRATO ' +
                '   AND SP_IDESTABLECIMIENTO = :IDESTABLECIMIENTO ' +
                '   AND SP_FECHASOLICITUD > ART.ACTUALDATE - 15 ' +
                '   AND SP_OPERATIVO = :operativo ';
        if ExisteSQLEx(sSQL, [sdqConsulta.FieldByName('RS_CONTRATO').AsInteger, sdqConsulta.FieldByName('RS_IDESTABLECI').AsInteger, Operativo]) then
          if not MsgAsk('Ya se ha solicitado un presupuesto para la empresa ' + sdqConsulta.FieldByName('RS_NOMBRE_EMPRESA').AsString + ', establecimiento ' + sdqConsulta.FieldByName('RS_NOMBREESTABLECI').AsString + '.' + CRLF + '¿Desea volver a solicitarlo?') then
            bContinuar := False;

        if bContinuar then
        begin


          EjecutarSqlST(
            ' UPDATE comunes.csp_solicitudpresupuesto '+
            '    SET sp_fechabaja = SYSDATE, '+
            '        sp_usubaja = '+SqlValue(Sesion.UserID) + ', ' +
            '        sp_motivobaja = ''Nueva solicitud de presupuesto''' +
            '  WHERE sp_fechabaja IS NULL '+
            '    AND NVL(sp_operativo, ''A'') <> ''R'' '+
            '    AND sp_contrato = ' + SqlValue(sdqConsulta.FieldByName('RS_CONTRATO').AsInteger) +
            '    AND sp_idestablecimiento =  ' + SqlValue(sdqConsulta.FieldByName('RS_IDESTABLECI').AsInteger) +
            '      AND NOT EXISTS (SELECT 1 ' +
            '                        FROM COMUNES.CPP_PRESUPUESTOPRESTADOR ' +
            '                       WHERE PP_IDESTABLECIMIENTO = SP_IDESTABLECIMIENTO ' +
            '                         AND SP_FECHASOLICITUD <= PP_FECHAALTA)');

          sSQL := 'INSERT INTO COMUNES.CSP_SOLICITUDPRESUPUESTO ' +
                  '(SP_ID, SP_CONTRATO, SP_IDESTABLECIMIENTO, SP_FECHASOLICITUD, SP_USUARIO, SP_OPERATIVO, SP_OBSERVACION) ' +
                  'VALUES ' +
                  '(:ID, :CONTRATO, :IDESTABLECIMIENTO, SYSDATE, :USUARIO, :OPERATIVO, :OBSERVACION) ';
          EjecutarSQLSTEx(sSQL,
                          [ValorSQLInteger('SELECT MAX(SP_ID) + 1 FROM COMUNES.CSP_SOLICITUDPRESUPUESTO', 1),
                           sdqConsulta.FieldByName('RS_CONTRATO').AsInteger,
                           sdqConsulta.FieldByName('RS_IDESTABLECI').AsInteger,
                           Sesion.UserID, Operativo, observacionSolPres]);

          EjecutarSQLSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                          '   SET ur_fechaultsolpresup = SYSDATE ' +
                          ' WHERE ur_cuit = :pcuit ' +
                          '   AND ur_estableci = :pnroestableci ',
                          [sdqConsulta.FieldByName('RS_CUIT').AsString,
                           sdqConsulta.FieldByName('RS_ESTABLECI').AsInteger]);
        end;
      end;
      CommitTrans(True);
      InfoHint(Grid, 'El pedido ha sido realizado con éxito.');
    except
      on E: Exception do
      begin
        RollBack(True);
        InvalidMsg(Grid, 'Ocurrió un error al realizar el pedido.' + CRLF + E.Message);
      end;
    end;
  end;
end;

procedure TfrmGenLotesAMP.btnPresupuestoClick(Sender: TObject);
begin
  inherited;
  tbSolicitarPresupuestoClick(nil);
  btnCancelar.Click;
end;

procedure TfrmGenLotesAMP.chkSinPresupuestoClick(Sender: TObject);
begin
  VCLExtra.LockControls([edMAX_FECHA_SOLICITUD_AMPDesde, edMAX_FECHA_SOLICITUD_AMPHasta], chkSinPresupuesto.Checked);
  if chkSinPresupuesto.Checked then
  begin
    edMAX_FECHA_SOLICITUD_AMPDesde.Clear;
    edMAX_FECHA_SOLICITUD_AMPHasta.Clear;
  end;
end;

procedure TfrmGenLotesAMP.Button1Click(Sender: TObject);
begin
  if (rgOperativo.ItemIndex = 0)
     and not ExisteSql( ' SELECT 1 ' +
                        ' FROM hys.hcn_cabeceranomina '+
                        ' WHERE cn_cuit = ' + SqlValue(sdqConsulta.FieldByName('rs_cuit').AsString) +
                        ' AND cn_estableci = ' + SqlValue(sdqConsulta.FieldByName('rs_estableci').AsInteger) +
                        ' AND cn_fecharelevamiento = + ' + SqlDate(sdqConsulta.FieldByName('rs_fecha').AsDateTime) +
                        ' AND cn_consemestral = ''S''') then
    Verificar(true, Button1, 'El relevamiento no tiene estudios semestrales.');

  fpTipoOperativo.ModalResult := mrOk
end;

procedure TfrmGenLotesAMP.tbImprimirClick(Sender: TObject);
begin
  mnuRptListadeEstablecimientosClick(Sender)
end;

procedure TfrmGenLotesAMP.mnuExpMaestroDetalleClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  OpenQuery(sdqListado);

  if sdqListado.Active and (not sdqListado.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      ExportDialog.DataSet := sdqListado;
      ExportDialog.Fields.Assign(dbgListado.Columns);
      ExportDialog.Execute;
    finally
      ExportDialog.DataSet := sdqConsulta;
      ExportDialog.Fields.Assign(Grid.Columns);
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmGenLotesAMP.mnuExpConsolidadoClick(Sender: TObject);
var
  CUIT: String;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  CUIT := sdqConsulta.FieldByName('rs_cuit').AsString;

  Abrir(TfrmConsExpConsolidada, frmConsExpConsolidada, tmvMDIChild, nil);
  with frmConsExpConsolidada do
  begin
    sdqConsulta.SQL.Clear;
    sdqConsulta.SQL.Add('SELECT DISTINCT rs_cuit, rs_nombre_empresa, rs_ciiu, rs_estableci, ' +
                        '                rs_nombre_estableci, rs_domicilio, rs_provincia, rs_contrato, ' +
                        '                rs_fechaalta, rs_fecha, rs_cpostal, rs_cuil, ' +
                        '                rs_nombre_trabajador, rs_fechaingreso, rs_codigo_estudio, ' +
                        '                rs_descripcion_estudio, rs_sector, rs_tarea, rs_fechainiexpo, ' +
                        '                rs_descripcion_riesgotrabajo, rs_periodicidad, rs_esop ' +
                        '           FROM hys.v_trabajadores_con_riesgo vr ' +
                        '          WHERE rs_cuit = ' + SqlValue(CUIT));

    tbRefrescarClick(Sender);
  end;
end;

procedure TfrmGenLotesAMP.mnuExpListadeEstablecimientosClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  tbExportar.Enabled := False;
  try
    ExportDialog.DataSet := sdqConsulta;
    ExportDialog.Fields.Assign(Grid.Columns);
    ExportDialog.Execute;
  finally
    tbExportar.Enabled := True;
  end;
end;

procedure TfrmGenLotesAMP.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty then
    Exit;

  if sdqConsulta.FieldByName ('iniciado_con_semestral').AsString = 'S' then
  begin
    Background := $000080FF;
    AFont.Color := clBlack;

    if Highlight then
      AFont.Color := clWhite
  end
  else
  if sdqConsulta.FieldByName ('ur_estadoultlote').AsString = 'P' then
  begin
    Background := clMoneyGreen;
    AFont.Color := clBlack;

    if Highlight then
      AFont.Color := clBlue
  end
  else
    if (not sdqConsulta.FieldByName ('max_fecha_solicitud_amp').IsNull) and
       (YearsBetween(Today, sdqConsulta.FieldByName ('rs_fecha').AsDateTime) > 0) then
    begin
      Background := $005854F5;
      AFont.Color := clBlack;

      if Highlight then
        AFont.Color := clWhite
    end
  else
    if (not sdqConsulta.FieldByName ('F_Prox_Oper').IsNull) and
       (sdqConsulta.FieldByName ('F_Prox_Oper').AsDateTime > Today) then
    begin
      Background := clSkyBlue;
      AFont.Color := clBlack;

      if Highlight then
        AFont.Color := clBlue
    end
  else
    // Relevamiento > 1 año
    if (YearsBetween(Today, sdqConsulta.FieldByName ('rs_fecha').AsDateTime) > 0) then
    begin
      Background := $00E6FFFF;
      AFont.Color := clBlack;

      if Highlight then
        AFont.Color := clBlue
    end
end;

procedure TfrmGenLotesAMP.FSFormDestroy(Sender: TObject);
begin
  // Elimino del temporal
  EjecutarSqlEx('DELETE ' +
                '  FROM tmp.tgl_genlotes ' +
                ' WHERE gl_usuario = :usuario ', [Sesion.UserID]);

  inherited;
end;

procedure TfrmGenLotesAMP.tbExportarClick(Sender: TObject);
begin
  mnuExpListadeEstablecimientosClick(Sender);
end;

procedure TfrmGenLotesAMP.mnuRptListadeEstablecimientosClick(Sender: TObject);
begin
  with TrptInformeGenAMP.Create(nil) do
    try
      qryConsulta.SQL.Text := sdqConsulta.SQL.Text;
      qryConsulta.Open;

      Visualizar(qrInformeGenAMP, GetValores(), [oForceShowModal])
    finally
      qryConsulta.Close;
      free;
    end;
end;

procedure TfrmGenLotesAMP.mnuRptMaestroDetalleClick(Sender: TObject);
begin
  with TrptInformeGenAMPDet.Create(nil) do
    try
      qryConsulta.SQL.Text := sdqListado.SQL.Text;
      qryConsulta.Open;

      Visualizar(qrInformeGenAMP, GetValores(), [oForceShowModal])
    finally
      qryConsulta.Close;
      free;
    end;
end;

procedure TfrmGenLotesAMP.tbAgendaObsAsigClick(Sender: TObject);
var
  fObsAsigLote: TfrmObsAsigLote;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  fObsAsigLote := TfrmObsAsigLote.Create( Self );
  try
    fObsAsigLote.Caption    := 'Obs. en Asignaciones para el CUIT ' + sdqConsulta.FieldByName('rs_cuit').AsString +
                               ' - Estab. ' + sdqConsulta.FieldByName('rs_estableci').AsString;
    fObsAsigLote.FCUIT      := sdqConsulta.FieldByName('rs_cuit').AsString;
    fObsAsigLote.FEstableci := sdqConsulta.FieldByName('rs_estableci').AsInteger;
    fObsAsigLote.tbRefrescarClick(Sender);

    Abrir(TfrmObsAsigLote, fObsAsigLote, tmvModal, nil);
  finally
    fObsAsigLote.Free;
  end;
end;

procedure TfrmGenLotesAMP.tbSimularClick(Sender: TObject);
var
  OpActual,
  OpSimulado : String;
begin
  if not sdqConsulta.Active then
    Exit;

//  OpActual := ValorSqlEx('SELECT art.amp.get_operativoproxlote(:pidestableci) ' +
//                         '  FROM dual',
//                         [sdqConsulta.FieldByName('rs_idestableci').AsInteger]);
  OpActual := sdqConsulta.FieldByName('al_tipoproxoperacion').AsString;
  if OpActual = 'S' then
    OpSimulado := 'A'
  else
    OpSimulado := 'S';

  RotuloSimulacion (tbSimular.Tag = 0, OpActual, OpSimulado);
end;

procedure TfrmGenLotesAMP.RotuloSimulacion(Simular: boolean; OpActual, OpSimulado: String);
begin
  if Simular then
  begin
    lblSimulacion.Caption := '  * Modo Simulación: Operativo ' +
                             iif(OpSimulado = 'S', 'SEMESTRAL', 'ANUAL');
    lblSimulacion.Font.Color := clRed;
    tbSimular.Hint := 'Cancelar Simulación';
    tbSimular.Tag := 1;

    AbrirTrabajadores(OpSimulado)
  end
  else begin
    lblSimulacion.Caption := '  * Modo Generación: Operativo ' +
                             iif(OpActual = 'S', 'SEMESTRAL', 'ANUAL');
    lblSimulacion.Font.Color := clBlue;
    tbSimular.Hint := 'Simular Operativo ' +
                      iif(OpSimulado = 'S', 'SEMESTRAL', 'ANUAL');
    tbSimular.Tag := 0;

    AbrirTrabajadores(OpActual)
  end
end;

procedure TfrmGenLotesAMP.tbActivacionRelevClick(Sender: TObject);
var
  sSQL : String;
begin
  Verificar(fraEmpresa.CUIT = '', fraEmpresa, 'Debe Seleccionar empresa.');
  Verificar(fraEstablecimiento.edCodigo.Text = '', fraEstablecimiento, 'Debe Seleccionar un establecimiento.');
//  Verificar(sdqConsulta.IsEmpty, Grid, 'Debe seleccionar un registro.');
  sSQL := ' SELECT DISTINCT cn_fecharelevamiento, '' - '' || er_descripcion'+
          '            FROM hys.her_estadorelevamiento, hys.hcn_cabeceranomina '+
          '           WHERE er_id(+) = cn_idestado '+
          '             AND cn_cuit = ' + SqlValue(fraEmpresa.CUIT)+
          '             AND cn_estableci = ' + SqlValue(fraEstablecimiento.edCodigo.Text)+
          ' UNION ALL '+
          ' SELECT DISTINCT sr_fecha, '' - SIN EXPUESTOS'' '+
          '            FROM psr_sinriesgo '+
          '           WHERE sr_cuit = '+ SqlValue(fraEmpresa.CUIT)+
          '             AND sr_estableci = '+ SqlValue(fraEstablecimiento.edCodigo.Text)+
          ' ORDER BY 1 DESC';
  clbRelevamiento.Items.Clear;
  with GetQuery(sSQL) do
  try
    while not Eof do
    begin
      clbRelevamiento.Items.Add(Fields[0].AsString + Fields[1].AsString);
      Next;
    end;
  finally
    Free;
  end;
  fpRelevamientoActivacion.ShowModal;
end;

procedure TfrmGenLotesAMP.btnCopRecepAceptarClick(Sender: TObject);
var
  relev:string;
  bForzarRelev: Boolean;
begin
  Verificar(clbRelevamiento.GetChecked.Count > 1, clbRelevamiento, 'Debe seleccionar un solo relevamiento');
  Verificar(Copy(clbrelevamiento.GetChecked.Strings[0],14,12)= 'SIN EXPUESTO', clbRelevamiento, 'No puede Activar un SIN EXPUESTO');
  relev := Copy(clbrelevamiento.GetChecked.Strings[0],0,10);

  bForzarRelev := false;

  if (ValorSqlEx('SELECT al_tipoproxoperacion FROM hys.hal_asignacionlote where al_idempresa = :idempresa AND al_nroestableci = :nroestab ', [fraEmpresa.Value, fraEstablecimiento.edCodigo.Text]) = 'S')
     and not ExisteSql( ' SELECT 1 ' +
                        ' FROM hys.hcn_cabeceranomina '+
                        ' WHERE cn_cuit = ' + SqlValue(fraEmpresa.CUIT) +
                        ' AND cn_estableci = ' + SqlValue(fraEstablecimiento.edCodigo.Text) +
                        ' AND cn_fecharelevamiento = + ' + SqlDate(StrToDate(relev)) +
                        ' AND cn_consemestral = ''S''') then
  begin
    if not MsgAsk('El próximo operativo que corresponde es semestral y el nuevo relevamiento no tiene estudios semestrales. ' + #13#10 +
                'Esto implica el corrimiento de la fecha de asignación. ¿Desea continuar de todas formas?') then
      Abort
    else
      bForzarRelev := true;
  end;

  EjecutarSql(
      ' BEGIN art.hys.do_activarrelevamiento ( '+ SqlValue(fraEmpresa.Contrato)+','+
          SqlValue(fraEstablecimiento.edCodigo.Text)+','+
          SqlValue(relev)+ ', ' +
          SqlValue(Sesion.UserID)+ ', ' +
          SqlValue(bForzarRelev)+ '); END;');
  fpRelevamientoActivacion.Close;
end;

procedure TfrmGenLotesAMP.btnSelEstudiosClick(Sender: TObject);
begin
  fpSelectEstudios.ShowModal;
end;

procedure TfrmGenLotesAMP.btnAceptarSeleccionClick(Sender: TObject);
begin
  fpDatosLoteShow(Sender);
  fpSelectEstudios.ModalResult := mrOk;
end;

procedure TfrmGenLotesAMP.Button4Click(Sender: TObject);
begin
  lstSelectEstudios.Clear;
  fpDatosLoteShow(Sender);
  fpSelectEstudios.ModalResult := mrCancel;
end;

procedure TfrmGenLotesAMP.rgTipoEnvioClick(Sender: TObject);
begin
  if (rgTipoEnvio.ItemIndex = 0)
      and not ExisteSqlEx('SELECT 1 ' +
                          'FROM afi.aco_contrato ' +
                          'WHERE co_direlectronica IS NOT NULL ' +
                          'AND co_contrato = :contrato ', [sdqConsulta.FieldByName('rs_contrato').AsInteger]) then
  begin
    rgTipoEnvio.ItemIndex := -1;
    Verificar(true, rgTipoEnvio, 'La empresa seleccionado no tiene Email cargado.');
  end;
end;

procedure TfrmGenLotesAMP.chkNotificacionEmpresaClick(Sender: TObject);
begin
  if chkNotificacionEmpresa.Checked then
  begin
    fpNotificacionEmpresa.ShowModal;
    if (rgTipoEnvio.ItemIndex = 4) or (rgTipoEnvio.ItemIndex = -1) then
      chkNotificacionEmpresa.Checked := false;
  end;
end;

procedure TfrmGenLotesAMP.fpNotificacionEmpresaShow(Sender: TObject);
begin
  rgTipoEnvio.Items[0] := 'Email - ' +
                            ValorSqlEx('SELECT nvl(co_direlectronica, ''Sin Email'')' +
                           'FROM afi.aco_contrato ' +
                           'WHERE co_contrato = :contrato ', [sdqConsulta.FieldByName('rs_contrato').AsInteger], '');
end;

(*function TfrmGenLotesAMP.Get_TextoMailAprobarPresup(NroPresupuesto:integer; sNomPrestador, sCuitPrestador:string): String;
var
  sValores, sSql:string;
begin
  sSql :=  '        SELECT /*+ RULE */ DISTINCT es_codigo, es_descripcion, pd_valor ' +
           '          FROM comunes.cpd_prestadorestudio, comunes.cpp_presupuestoprestador, ' +
           '               art.cpr_prestador, art.aes_estudios ' +
           '         WHERE pp_fechabaja IS NULL ' +
           '           AND es_codigo = pd_idestudio ' +
           '           AND es_sincosto = ''N'' ' +
           '           AND pp_vigenciadesde <= art.actualdate ' +
           '           AND ((art.actualdate <= pp_vigenciahasta) OR (pp_vigenciahasta IS NULL)) ' +
           '           AND ca_identificador = pp_idprestador ' +
           '           AND ca_fechabaja IS NULL ' +
           '           AND pd_idpresupuesto = pp_id ' +
           '           AND pd_idtipovalor = 1 ' +
           '           AND pp_id = ' + SqlValue(NroPresupuesto);

  sValores := '';
  with GetQuery(sSql) do
  try
    First;
    while not Eof do
    begin
      sValores := sValores + ' - Cód: ' + FieldByName('ES_CODIGO').AsString + ' - ' +
                  FieldByName('ES_DESCRIPCION').AsString + ' - $ ' +
                  FieldByName('PD_VALOR').AsString + '.-' + #13;
      Next;
    end;
  finally
    free;
  end;

  Result := '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Tahoma;}{\f1\fswiss\fcharset0 Arial;}}{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\b\f0\fs20 Provincia ART\b0\f1\par}' + #13 +  // TK 26176
            '                                                                                 Buenos Aires, ' + DateFormat(DBDate, 'd ''de'' MMMM ''de'' yyyy') + #13 + #13 +  #13 +
            'Señores:' + #13 +
            sNomPrestador + #13 +
            'C.U.I.T. ' + sCuitPrestador      + #13 + #13 +
            'Ref: Aprobación de Presupuesto'  + #13 + #13 +
            'De nuestra mayor consideración:' + #13 + #13 +
            'Comunicamos la aceptación del presupuesto cotizado para la empresa ' +
             sdqConsulta.FieldByName('RS_NOMBRE_EMPRESA').AsString + ', ' +
            'Nro de C.U.I.T. ' + sdqConsulta.FieldByName('RS_CUIT').AsString + ', ' + #13 +
            'establecimiento N° ' + sdqConsulta.FieldByName('RS_ESTABLECI').AsString +
            ' con los siguientes estudios: ' + #13 + #13 +
            sValores + #13 + #13 +
            'Dentro de las 72 hs. posteriores al envío de esta aprobación el sector ' +
            'de Medicina Laboral de nuestra ART remitirá ' + #13 +
            'vía mail un archivo con:' + #13 + #13 +
            ' - Datos de la empresa: número telefónico y dirección.' + #13 +
            ' - Nómina de empleados.' + #13 +
            ' - Detalle de estudios para cada expuesto en cuestión.' + #13 + #13 +
            ' Datos del Prestador: ' + fraPrestador.sdqDatos.fieldbyname('ca_nombrefanta').AsString + #13 + #13 +
            'Sin otro particular, saludamos a Uds. muy atentamente.' + #13 + #13 + #13 +
            'Departamento de Prestadores'    + #13 +
            'Provincia ART '  + #13 +
            'E-Mail: examenes@provart.com.ar'  + #13 +
            'Tel: (011) 4819-2800 Int. ' + Sesion.Interno;
end;      *)

{procedure TfrmGenLotesAMP.NotificarAsignacionPresupuesto(aIdLote: integer);          // TK 54516
var sTextoMail, sSql: string;
    ResultadoEnvio: TResultadoEnvio;
    nroPresupuesto: integer;
begin
  sSql :=  '        SELECT /*+ RULE */ ' +
           '               pp_id ' +
           '          FROM comunes.cpd_prestadorestudio, comunes.cpp_presupuestoprestador, art.cpr_prestador ' +
           '         WHERE pp_idestablecimiento = ' + SqlInteger(sdqConsulta.FieldByName ('rs_idestableci').AsInteger) +
           '           AND pd_idtipovalor = 1 ' +
           '           AND pd_idpresupuesto = pp_id ' +
           '           AND pd_idprestador = ca_identificador ' +
           '           AND pp_fechabaja IS NULL ' +
           '           AND pp_vigenciadesde <= art.actualdate ' +
           '           AND (   (art.actualdate <= pp_vigenciahasta) ' +
           '                OR (pp_vigenciahasta IS NULL)) ' +
           '           AND pd_vigenciadesde <= art.actualdate ' +
           '           AND (   (art.actualdate <= pd_vigenciahasta) ' +
           '                OR (pd_vigenciahasta IS NULL)) ' +
           '           AND pp_idprestador = ca_identificador ' +
           '           AND ca_identificador = ' + SqlValue(fraPrestador.Value) +
           '           AND ca_fechabaja IS NULL ' +
           '           AND EXISTS(SELECT 1 ' +
           '                        FROM art.aes_estudios est ' +
           '                       WHERE est.es_id = pd_idestudio ' +
           '                         AND est.es_sincosto = ''N'') ' +
           '           AND pd_idestudio IN(SELECT DISTINCT er_estudio ' +
           '                                          FROM art.aer_estriesg ' +
           '                                         WHERE er_fechabaja IS NULL ' +
           '                                           AND er_estudio IN(' + FEstudios +  ')) ';

  nroPresupuesto := ValorSqlInteger(sSql);
  if (nroPresupuesto <> 0) then
  begin
    sTextoMail     := Get_TextoMailAprobarPresup(nroPresupuesto, fraPrestador.Descripcion, fraPrestador.mskCUIT.Text);
    ResultadoEnvio := unMoldeEnvioMail.EnviarMailBDWithResults(Trim(fraPrestador.sdqDatos.FieldByName('email').AsString),
                                                               '[Provincia ART] - Aprobación de Presupuesto Nro ' + IntToStr(nroPresupuesto), [], sTextoMail);

    if ResultadoEnvio.EnvioOk then
    begin
      sSql := 'UPDATE comunes.cpp_presupuestoprestador ' +
                ' SET pp_fechaaprobacion = trunc(sysdate), ' +
                    ' pp_usuaprobacion = ' + SqlValue(Sesion.UserID) +
              ' WHERE pp_id = ' + SqlValue(nroPresupuesto);
      EjecutarSql(sSql);
    end;
  end;
end;  }

end.


