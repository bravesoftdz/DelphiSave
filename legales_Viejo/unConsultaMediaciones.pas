unit unConsultaMediaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unABMSeguimientoMediacion, unDmPrincipal, unConstLegales,
  unfraCodigoDescripcionExt, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, PatternEdit, IntEdit, unArtDbFrame,
  unFraTrabajador, unFraTrabajadorSiniestro, unfraAbogadosLegales,
  ToolEdit, DateComboBox;

type
  TfrmConsultaMediaciones = class(TfrmCustomConsulta)
    sdqModificacionRegistro: TSDQuery;
    sdqConsultaRegistro: TSDQuery;
    pcFiltrosBusqueda: TPageControl;
    tsGeneral: TTabSheet;
    gbJuicio: TGroupBox;
    lbNroJuicio: TLabel;
    lblTipoJuicio: TLabel;
    lblCaratula: TLabel;
    lblEstado: TLabel;
    lblContra: TLabel;
    edNroFolio: TIntEdit;
    fraEstado: TfraCodigoDescripcion;
    chkGPBA: TCheckBox;
    edDemandante: TEdit;
    edDemandado: TEdit;
    fraTipoMediacion: TfraCodigoDescripcion;
    fraTrabajador: TfraTrabajadorSiniestro;
    CUIL: TLabel;
    edExpediente: TPatternEdit;
    lblExpediente: TLabel;
    fraAbogadosPropios: TfraAbogadosLegales;
    fraUsuarioLegal: TfraCodigoDescripcion;
    lbAbogado: TLabel;
    Label1: TLabel;
    ShortCutControl1: TShortCutControl;
    fraTipoEvento: TfraCodigoDescripcion;
    Label2: TLabel;
    edFechaAudiencia: TDateComboBox;
    Label3: TLabel;
    Panel1: TPanel;
    lbCantidad: TLabel;
    edFechaAltaDesde: TDateComboBox;
    lblFechaAsignacion: TLabel;
    Label4: TLabel;
    edFechaAltaHasta: TDateComboBox;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaMediaciones: TfrmConsultaMediaciones;

implementation

{$R *.dfm}
uses AnsiSql, SDCommon;

procedure TfrmConsultaMediaciones.tbNuevoClick(Sender: TObject);
begin
  with TfrmABMSeguimientoMediacion.Create(Self) do
  try
    AltaMediacion;
  finally
    Free;
  end;
  if sdqConsulta.Active then
    sdqConsulta.Refresh;
end;

procedure TfrmConsultaMediaciones.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    with TfrmABMSeguimientoMediacion.Create(Self) do
    try
      sdqModificacionRegistro.ParamByName('me_id').AsInteger := sdqConsulta.FieldByName('me_id').AsInteger;
      try
        sdqModificacionRegistro.Open;
        Modificacion(sdqModificacionRegistro);
      except
        on E : ESDEngineError do
        begin
          if E.NativeError = 54 then
          begin
            Rollback(true);
            MessageDlg('El registro está siendo utilizado por el usuario ' + GetInfoBloqueo(sdqConsulta.FieldByName('me_id').AsInteger, 'J') + '.' + #13#10 + 'Por esa razón no podrá guardar ningún cambio.', mtWarning, [mbOK], 0);
            sdqConsultaRegistro.ParamByName('me_id').AsInteger := sdqConsulta.FieldByName('jt_id').AsInteger;
            sdqConsultaRegistro.Open;
            ConsultarMediacion(sdqConsultaRegistro);
          end;
        end;
      end;
    finally
      sdqModificacionRegistro.Close;
      sdqConsultaRegistro.Close;
      if sdqConsulta.Active then
        sdqConsulta.Refresh;
      Free;
    end;
  end;
end;

procedure TfrmConsultaMediaciones.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edNroFolio.Clear;
  fraTipoMediacion.Clear;
  edDemandante.Clear;
  edDemandado.Clear;
  fraEstado.Clear;
  edExpediente.Clear;
  fraTrabajador.Clear;
end;

procedure TfrmConsultaMediaciones.FormCreate(Sender: TObject);
begin
  inherited;
  with fraTipoMediacion do
  begin
    TableName   := 'legales.ltm_tipomediacion';
    FieldID     := 'tm_id';
    FieldCodigo := 'tm_id';
    FieldDesc   := 'TM_DESCRIPCION';
    FieldBaja   := 'tm_fechabaja';
    Showbajas   := True;
  end;
  with fraTipoEvento do
  begin
    TableName   := 'legales.lte_tipoevento';
    FieldID     := 'te_id';
    FieldCodigo := 'te_id';
    FieldDesc   := 'te_descripcion';
    FieldBaja   := 'te_fechabaja';
    ExtraCondition := ' AND te_etapa LIKE ''%M%''';
    Showbajas   := False;
  end;
  with fraEstado do
  begin
    TableName   := 'legales.LEJ_ESTADOJUICIO';
    FieldID     := 'EJ_ID';
    FieldCodigo := 'EJ_ID';
    FieldDesc   := 'EJ_DESCRIPCION';
    FieldBaja   := 'EJ_FECHABAJA';
    Showbajas   := True;
    ExtraCondition := ' AND ej_etapa LIKE ''%M%''';
  end;

  with fraUsuarioLegal do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'SE_ID';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'se_fechabaja';
    ExtraCondition := ' AND se_sector = ''LEGAL'' AND SE_USUARIOGENERICO = ''N'' ';
    Showbajas   := True;
  end;
  fraAbogadosPropios.FieldBaja := 'bo_fechabaja';
  fraAbogadosPropios.ShowBajas := True;
  fraAbogadosPropios.CaseSensitive := False;
  fraUsuarioLegal.CaseSensitive := False;
end;

procedure TfrmConsultaMediaciones.tbRefrescarClick(Sender: TObject);
var
  sWhere : String;
begin
  sWhere := '';

  if edNroFolio.Text <> '' then
    sWhere := sWhere + ' AND me_numerofolio = '+ SqlValue(edNroFolio.Text);
  if chkGPBA.Checked then
    sWhere := sWhere + ' AND me_gpba = ''S''';
  if fraTipoMediacion.IsSelected then
    sWhere := sWhere + ' AND me_idtipo = '+ SqlValue(fraTipoMediacion.Codigo);
  if edDemandante.Text <> '' then
    sWhere := sWhere + ' AND me_demandante like ''%'+ edDemandante.Text + '%''';
  if edDemandado.Text <> '' then
    sWhere := sWhere + ' AND me_demandado like ''%'+ edDemandado.Text + '%''';
  if fraEstado.IsSelected then
    sWhere := sWhere + ' AND me_idestado = '+ SqlValue(fraEstado.Codigo);
  if fraTrabajador.IsSelected then
    sWhere := sWhere + ' AND ex_id = '+ SqlValue(fraTrabajador.IdSiniestro);
  if edExpediente.Text <> '' then
    sWhere := sWhere + ' AND me_expediente = '+ SqlValue(edExpediente.Text);
  if fraUsuarioLegal.IsSelected then
    sWhere := sWhere + ' AND me_idusuariolegal = '+ SqlValue(fraUsuarioLegal.Value);
  if fraAbogadosPropios.IsSelected then
    sWhere := sWhere + ' AND me_idabogado = '+ SqlValue(fraAbogadosPropios.Value);
  if fraTipoEvento.IsSelected then
    sWhere := sWhere + ' AND EXISTS ( SELECT 1 FROM legales.lem_eventomediacion '+
                       ' WHERE em_idmediacion = me_id AND em_fechabaja IS NULL '+
                       ' AND em_idtipoevento = '+SqlValue(fraTipoEvento.Codigo)+')';
  if edFechaAudiencia.Date <> 0 then
    sWhere := sWhere + ' AND EXISTS ( SELECT 1 FROM legales.lem_eventomediacion '+
                       ' WHERE em_idmediacion = me_id AND em_fechabaja IS NULL '+
                       ' AND trunc(em_fecha) = '+SqlValue(edFechaAudiencia.Date)+')';
  if (edFechaAltaDesde.Date <> 0) and (edFechaAltaDesde.Date = edFechaAltaHasta.Date) then
  begin
    sWhere := sWhere + ' AND TRUNC(me_fechaalta) = '+SqlValue(edFechaAltaDesde.Date);
  end
  else
  begin
    if edFechaAltaDesde.Date <> 0 then
      sWhere := sWhere + ' AND TRUNC(me_fechaalta) >= '+SqlValue(edFechaAltaDesde.Date);
    if edFechaAltaHasta.Date <> 0 then
      sWhere := sWhere + ' AND TRUNC(me_fechaalta) <= '+SqlValue(edFechaAltaHasta.Date);
  end;

  sdqConsulta.SQL.Text :=
  	'  SELECT me_id, me_numerofolio, me_expediente, me_demandante, me_demandado, '+
    '         me_idexpediente, me_fechaingreso, me_fechaegreso, '+
    '         me_salario, me_tarea, me_fechanacimiento, me_demandaempleador, '+
    '         me_aseguradoart, me_idmotivoreclamo, me_iddiagnostico, me_hecho, '+
    '         me_idreclamo, me_incapacidad, me_incapindeterminada, '+
    '         me_idabogadoactora, me_idabogado, me_idabogadoempresa, '+
    '         me_aceptarevisacionmed, me_fecharevisacionmed, me_idmediador, '+
    '         me_incaprevisacionmed, me_idestado, me_fechainicio, me_fechafin, '+
    '         me_idtipo, me_gpba, me_numerocaja, me_semestre, me_fechaalta, '+
    '         me_usualta, me_fechamodif, me_usumodif, me_fechabaja, me_usubaja, '+
    '         me_fechaasignacion, me_montoofrecido, me_fechaofrecimiento, '+
    '         NVL (lbo.bo_nombre, UPPER (se_nombre)) bo_nombre, ltm.tm_descripcion, lej.ej_descripcion, '+
    '         lmd.md_nombre, '+
    '         art.utiles.armar_domicilio (lmd.md_calle, '+
    '                                     lmd.md_numero, '+
    '                                     lmd.md_piso, '+
    '                                     lmd.md_departamento, '+
    '                                     lmd.md_localidad '+
    '                                    ) domiciliomediador, '+
    '         lmr.mr_descripcion, cdg.dg_descripcion, lrc.rc_descripcion, '+
    '         (SELECT MIN (em_fecha) '+
    '            FROM legales.lem_eventomediacion '+
    '           WHERE em_idmediacion = me_id '+
    '             AND em_idtipoevento = 601) primera_audiencia, '+
    '         (SELECT MIN (em_fecha) '+
    '            FROM legales.lem_eventomediacion '+
    '           WHERE em_idmediacion = me_id '+
    '             AND em_idtipoevento = 602) segunda_audiencia, '+
    '         (SELECT MIN (em_fecha) '+
    '            FROM legales.lem_eventomediacion '+
    '           WHERE em_idmediacion = me_id '+
    '             AND em_idtipoevento = 603) tercera_audiencia '+
    '    FROM legales.lme_mediacion lme, '+
    '         art.sex_expedientes sex, '+
    '         legales.lrc_reclamo lrc, '+
    '         legales.lbo_abogado lbo, '+
    '         legales.lbo_abogado lbe, '+
    '         legales.lbo_abogado lba, '+
    '         art.use_usuarios, '+
    '         legales.ltm_tipomediacion ltm, '+
    '         legales.lej_estadojuicio lej, '+
    '         legales.lmd_mediador lmd, '+
    '         art.cdg_diagnostico cdg, '+
    '         legales.lmr_motivoreclamo lmr '+
    '   WHERE lme.me_idexpediente = sex.ex_id(+) '+
    '     AND lme.me_idmotivoreclamo = lmr.mr_id(+) '+
    '     AND lme.me_iddiagnostico = cdg.dg_id(+) '+
    '     AND lme.me_idreclamo = lrc.rc_id(+) '+
    '     AND lme.me_idusuariolegal = se_id(+) '+
    '     AND lme.me_idabogado = lbo.bo_id(+) '+
    '     AND lme.me_idabogadoactora = lba.bo_id(+) '+
    '     AND lme.me_idabogadoempresa = lbe.bo_id(+) '+
    '     AND lme.me_idmediador = lmd.md_id(+) '+
    '     AND lme.me_idestado = lej.ej_id '+
    '     AND lme.me_idtipo = ltm.tm_id(+) ' + sWhere;

	sdqConsulta.SQL.Add(SortDialog.OrderBy);
  inherited;
  lbCantidad.Caption := 'Cantidad: '+IntToStr(sdqConsulta.RecordCount);
end;

end.
