unit unSeguimientoCronicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, PatternEdit, IntEdit, StdCtrls, Mask, ToolEdit,
  DateComboBox, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraGrupoTrabajo, FormPanel, Buttons, SinEdit, unArtDbFrame,
  unfraPrestador;

type
  TfrmSeguimientoCronicos = class(TfrmCustomConsulta)
    fpFechas: TFormPanel;
    Label5: TLabel;
    Label6: TLabel;
    dcPostAlta: TDateComboBox;
    dcEspec: TDateComboBox;
    Bevel7: TBevel;
    btnAceptarFecha: TBitBtn;
    btnCancelarFecha: TBitBtn;
    edSiniestro: TSinEdit;
    Label9: TLabel;
    edObservaciones: TMemo;
    Label4: TLabel;
    rgRegularidadABM: TRadioGroup;
    fraEspecialidadABM: TfraCodigoDescripcion;
    Label7: TLabel;
    Bevel1: TBevel;
    GroupBox3: TGroupBox;
    fraPrestadorABM: TfraPrestador;
    Label10: TLabel;
    edPaciente: TEdit;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edSinHasta: TIntEdit;
    edSinDesde: TIntEdit;
    gbFecha: TGroupBox;
    Label8: TLabel;
    dcAcciDesde: TDateComboBox;
    dcAcciHasta: TDateComboBox;
    gbFechaPostAlta: TGroupBox;
    Label2: TLabel;
    dcPostDesde: TDateComboBox;
    dcPostHasta: TDateComboBox;
    gbFechaOrtesis: TGroupBox;
    Label3: TLabel;
    dcEspDesde: TDateComboBox;
    dcEspHasta: TDateComboBox;
    GroupBox5: TGroupBox;
    SinEdit: TSinEdit;
    GroupBox2: TGroupBox;
    rbEvoNo: TRadioButton;
    rbEvoSi: TRadioButton;
    rbEvoTodos: TRadioButton;
    GroupBox4: TGroupBox;
    rbAltaNo: TRadioButton;
    rbAltaSi: TRadioButton;
    rbAltaTodos: TRadioButton;
    rgRegularidad: TRadioGroup;
    tsFiltros1: TTabSheet;
    gbPrestador: TGroupBox;
    fraPrestadorF: TfraPrestador;
    gbEspecialidad: TGroupBox;
    fraEspecialidadF: TfraCodigoDescripcion;
    gpGrupoTrabajo: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    GroupBox6: TGroupBox;
    rbEquiNo: TRadioButton;
    rbEquiSi: TRadioButton;
    rbEquiTodos: TRadioButton;
    gbEquipadoABM: TGroupBox;
    rbEquiNoABM: TRadioButton;
    rbEquiSiABM: TRadioButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure edSinDesdeExit(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarFechaClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure fpFechasBeforeShow(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
  private
    function HayRegistroActivo :Boolean;
    function OuterJoin :String;
  public
    { Public declarations }
  end;

var
  frmSeguimientoCronicos: TfrmSeguimientoCronicos;

implementation

uses AnsiSql, CustomDlgs, SqlFuncs, unDmPrincipal, unSesion, General, unTercerizadoras, unSiniestros;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(SinEdit.IsEmpty and edSinDesde.IsEmpty and dcAcciDesde.IsEmpty and dcPostDesde.IsEmpty and
            dcEspDesde.IsEmpty, Nil, 'Debe seleccionar rango de siniestro ó de alguna fecha.');

  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' ex_id, ex_fechaaccidente faccidente, art.utiles.armar_cuit(tj_cuil) cuil, ' +
                ' tj_nombre trabajador, utiles.armar_cuit(em_cuit) cuit, em_nombre empresa, ' +
                ' DECODE(ca_identificador, NULL, NULL, ' +
                '  ''('' || ca_identificador || '' ) - '' || ca_nombrefanta) prestador, ' +
                ' sc_fechapostalta, gp_nombre gtrabajo, art.siniestro.get_usuariogestor(ex_id) usugestor, ' +
                ' lg_nombre delegacion, ex_siniestro, ex_orden, ex_recaida, ex_diagnosticooms, ' +
                ' dg_descripcion diagnostico, es_descripcion especialidad, sc_fechaespecial, ' +
                ' sc_observaciones, art.siniestro.is_cronicoevolucionado(sc_id) evolucionado, ' +
                ' DECODE(sc_regularidad, 1, ''30 días'', 2, ''60 días'', 3, ''90 días'', ' +
                                       ' 4, ''120 días'', 5, ''Anual'') regularidad, ' +
                ' sc_codespecialidad, ca_identificador, sc_regularidad, sc_id, ' +
                ' pe_fechaaltamedica, sc_equipado ' +
           ' FROM art.dlg_delegaciones, art.mgp_gtrabajo, art.cpr_prestador, aem_empresa, ' +
                ' ctj_trabajador, art.sex_expedientes, art.cdg_diagnostico, ' +
                ' sin.ssc_seguimientocronicos, art.mes_especialidades, ' +
                ' sin.spe_partedeegreso ' +
          ' WHERE ex_id = sc_idexpediente' + OuterJoin +
            ' AND ex_id = pe_idexpediente(+) ' + 
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND ca_identificador(+) = sc_idprestador ' +
            ' AND es_codigo(+) = sc_codespecialidad ' +
            ' AND ex_gtrabajo = gp_codigo ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND sc_fechabaja' + OuterJoin + ' IS NULL ' +
            ' AND dg_codigo(+) = ex_diagnosticooms ' +
            ' AND NVL(ex_causafin, ''0'') NOT IN(''02'', ''99'', ''95'') ';
  //---------------------------------------------------------------------------
  if not(SinEdit.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro = ' + SqlInt(SinEdit.Siniestro) +
                   ' AND ex_orden = ' + SqlInt(SinEdit.Orden) +
                   ' AND ex_recaida = '+ SqlInt(SinEdit.Recaida);
  //---------------------------------------------------------------------------
  if not(edSinDesde.IsEmpty) and not(edSinHasta.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro BETWEEN ' + edSinDesde.TextSql + ' AND ' + edSinHasta.TextSql
  else if not(edSinDesde.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro >= ' + edSinDesde.TextSql
  else if not(edSinHasta.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro <= ' + edSinHasta.TextSql;
  //---------------------------------------------------------------------------
  if not(dcPostDesde.IsEmpty) and not(dcPostHasta.IsEmpty) then
    sSql := sSql + ' AND sc_fechapostalta BETWEEN ' + dcPostDesde.SqlText + ' AND ' + dcPostHasta.SqlText
  else if not(dcPostDesde.IsEmpty) then
    sSql := sSql + ' AND sc_fechapostalta >= ' + dcPostDesde.SqlText
  else if not(dcPostHasta.IsEmpty) then
    sSql := sSql + ' AND sc_fechapostalta <= ' + dcPostHasta.SqlText;
  //-------------------------------------------------------------------------
  if not(dcEspDesde.IsEmpty) and not(dcEspHasta.IsEmpty) then
    sSql := sSql + ' AND sc_fechaespecial BETWEEN ' + dcEspDesde.SqlText + ' AND ' + dcEspHasta.SqlText
  else if not(dcEspDesde.IsEmpty) then
    sSql := sSql + ' AND sc_fechaespecial >= ' + dcEspDesde.SqlText
  else if not(dcEspHasta.IsEmpty) then
    sSql := sSql + ' AND sc_fechaespecial <= ' + dcEspHasta.SqlText;
  //-------------------------------------------------------------------------
  if not(dcAcciDesde.IsEmpty) and not(dcAcciHasta.IsEmpty) then
    sSql := sSql + ' AND ex_fechaaccidente BETWEEN ' + dcAcciDesde.SqlText + ' AND ' + dcAcciHasta.SqlText
  else if not(dcAcciDesde.IsEmpty) then
    sSql := sSql + ' AND ex_fechaaccidente >= ' + dcAcciDesde.SqlText
  else if not(dcAcciHasta.IsEmpty) then
    sSql := sSql + ' AND ex_fechaaccidente <= ' + dcAcciHasta.SqlText;
  //-------------------------------------------------------------------------
  if not(fraGrupoTrabajo.IsEmpty) then
    sSql := sSql + ' AND NVL(gp_codigo, '' '') = ' + SqlValue(fraGrupoTrabajo.Codigo);
  //-------------------------------------------------------------------------
  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
    sSql := sSql + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
  //-------------------------------------------------------------------------
  if fraPrestadorF.IsSelected then
    sSql := sSql + ' AND sc_idprestador = ' + SqlInt(fraPrestadorF.IDPrestador);
  //-------------------------------------------------------------------------
  if fraEspecialidadF.IsSelected then
    sSql := sSql + ' AND sc_codespecialidad = ' + SqlValue(fraEspecialidadF.Codigo);
  //-------------------------------------------------------------------------
  if rgRegularidad.ItemIndex > 0 then
    sSql := sSql + ' AND sc_regularidad = ' + SqlInt(rgRegularidad.ItemIndex);
  //-------------------------------------------------------------------------
  if not rbEvoTodos.Checked then
    sSql := sSql + ' AND art.siniestro.is_cronicoevolucionado(sc_id) = ' + IIF(rbEvoSi.Checked, '''S''', '''N''');
  //-------------------------------------------------------------------------
  if not rbEquiTodos.Checked then
    sSql := sSql + ' AND sc_equipado = ' + IIF(rbEquiSi.Checked, '''S''', '''N''');
  //-------------------------------------------------------------------------
  if not rbAltaTodos.Checked then
    sSql := sSql + ' AND pe_fechaaltamedica IS ' + IIF(rbAltaSi.Checked, 'NOT', '') + ' NULL ';
  //-------------------------------------------------------------------------
  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';
  //-------------------------------------------------------------------------

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.edSinDesdeExit(Sender: TObject);
begin
  if not(edSinDesde.IsEmpty) and edSinHasta.IsEmpty then
    edSinHasta.Value := edSinDesde.Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.tbModificarClick(Sender: TObject);
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un siniestro.');
  Verificar(sdqConsulta.FieldByName('sc_id').IsNull, Grid,
            'No se puede modificar ya que todavía no se dió de alta el seguimiento.');
  with sdqConsulta do
  begin
    dcPostAlta.Date             := FieldByName('sc_fechapostalta').AsDateTime;
    dcEspec.Date                := FieldByName('sc_fechaespecial').AsDateTime;
    fraEspecialidadABM.Codigo   := FieldByName('sc_codespecialidad').AsString;
    rgRegularidadABM.ItemIndex  := FieldByName('sc_regularidad').AsInteger;
    edObservaciones.Lines.Text  := FieldByName('sc_observaciones').AsString;
    rbEquiSiABM.Checked         := (FieldByName('sc_equipado').AsString = 'S');
    fraPrestadorABM.Cargar(FieldByName('ca_identificador').AsInteger);
  end;
  fpFechas.Caption  := 'Seguimiento de pacientes crónicos - Modificación';
  fpFechas.Tag      := 1;
  fpFechas.ShowModal;
end;
{-------------------------------------------------------------------------------}
function TfrmSeguimientoCronicos.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.btnAceptarFechaClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(dcPostAlta.IsEmpty, dcPostAlta, 'Debe ingresar la fecha de próximo control.');
  Verificar(fraEspecialidadABM.IsEmpty, fraEspecialidadABM, 'Debe seleccionar la especialidad.');
  Verificar(fraPrestadorABM.IsEmpty, fraPrestadorABM, 'Debe seleccionar el prestador.');

  if (fpFechas.Tag = 1) then //modificacion
    sSql := 'UPDATE sin.ssc_seguimientocronicos ' +
              ' SET sc_idprestador = ' + SqlInt(fraPrestadorABM.IDPrestador) + ',' +
                  ' sc_codespecialidad = ' + SqlValue(fraEspecialidadABM.Codigo) + ',' +
                  ' sc_fechapostalta = ' + SqlDate(dcPostAlta.Date) + ',' +
                  ' sc_fechaespecial = ' + SqlDate(dcEspec.Date) + ',' +
                  ' sc_observaciones = ' + SqlValue(edObservaciones.Lines.Text) + ',' +
                  ' sc_regularidad = ' + SqlInt(rgRegularidadABM.ItemIndex) + ',' +
                  ' sc_equipado = ' + IIF(rbEquiSiABM.Checked, '''S''', '''N''') + ',' +
                  ' sc_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' sc_fechamodif = actualdate ' +
            ' WHERE sc_id = ' + SqlInt(sdqConsulta.FieldByName('sc_id').AsInteger)
  else
    sSql := 'INSERT INTO sin.ssc_seguimientocronicos ' +
            '(sc_fechaalta, sc_usualta, sc_idexpediente, sc_idprestador, sc_codespecialidad, ' +
            ' sc_fechapostalta, sc_fechaespecial, sc_observaciones, sc_regularidad, ' +
            ' sc_equipado) VALUES ( ' +
            ' actualdate, ' + SqlValue(Sesion.UserID) + ',' + SqlInt(sdqConsulta.FieldByName('ex_id').AsInteger) + ',' +
            SqlInt(fraPrestadorABM.IDPrestador) + ',' + SqlValue(fraEspecialidadABM.Codigo) + ',' +
            SqlDate(dcPostAlta.Date) + ',' + SqlDate(dcEspec.Date) + ',' +
            SqlValue(edObservaciones.Lines.Text) + ',' + SqlInt(rgRegularidadABM.ItemIndex) + ',' +
            IIF(rbEquiSiABM.Checked, '''S''', '''N''') + ')';
  EjecutarSql(sSql);
  sdqConsulta.Refresh;
  fpFechas.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmSeguimientoCronicos.OuterJoin :String;
begin
  Result := IIF(SinEdit.IsEmpty and edSinDesde.IsEmpty and edSinHasta.IsEmpty and
                dcAcciDesde.IsEmpty and dcAcciHasta.IsEmpty, ' ', '(+)');
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.tbLimpiarClick(Sender: TObject);
begin
  SinEdit.Clear;
  edSinDesde.Clear;
  edSinHasta.Clear;
  dcAcciDesde.Clear;
  dcAcciHasta.Clear;
  dcPostDesde.Clear;
  dcPostHasta.Clear;
  dcEspDesde.Clear;
  dcEspHasta.Clear;
  fraPrestadorF.Clear;
  fraEspecialidadF.Clear;
  rbEquiTodos.Checked     := True;
  rbEvoTodos.Checked      := True;
  rbAltaTodos.Checked     := True;
  rgRegularidad.ItemIndex := 0;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.FormCreate(Sender: TObject);
begin
  inherited;
  with fraEspecialidadF do
  begin
    TableName     := 'MES_ESPECIALIDADES';
    FieldID       := 'ES_CODIGO';
    FieldCodigo   := 'ES_CODIGO';
    FieldDesc     := 'ES_DESCRIPCION';
    FieldBaja     := 'ES_FECHABAJA';
    caseSensitive := False;
    ShowBajas     := False;
  end;
  with fraEspecialidadABM do
  begin
    TableName     := 'MES_ESPECIALIDADES';
    FieldID       := 'ES_CODIGO';
    FieldCodigo   := 'ES_CODIGO';
    FieldDesc     := 'ES_DESCRIPCION';
    FieldBaja     := 'ES_FECHABAJA';
    caseSensitive := False;
    ShowBajas     := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.tbNuevoClick(Sender: TObject);
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un siniestro.');
  dcPostAlta.Clear;
  dcEspec.Clear;
  fraEspecialidadABM.Clear;
  fraPrestadorABM.Clear;
  edObservaciones.Lines.Clear;
  rgRegularidadABM.ItemIndex  := 0;
  rbEquiNoABM.Checked         := True;
  fpFechas.Caption            := 'Seguimiento de pacientes crónicos - Alta';
  fpFechas.Tag                := 0;
  fpFechas.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.fpFechasBeforeShow(Sender: TObject);
begin
  edSiniestro.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsInteger,
                        sdqConsulta.FieldByName('ex_orden').AsInteger,
                        sdqConsulta.FieldByName('ex_recaida').AsInteger);
  edPaciente.Text := sdqConsulta.FieldByName('trabajador').AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un siniestro.');
  Verificar(sdqConsulta.FieldByName('sc_id').IsNull, Grid,
            'No se puede dar de baja ya que todavía no se dió de alta el seguimiento.');
  if MsgAsk('¿Confirma la eliminación del seguimiento seleccionado?') then
  begin
    sSql := 'UPDATE sin.ssc_seguimientocronicos ' +
              ' SET sc_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                  ' sc_fechabaja = actualdate ' +
            ' WHERE sc_id = ' + SqlInt(sdqConsulta.FieldByName('sc_id').AsInteger);
    EjecutarSql(sSql);
    sdqConsulta.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCronicos.SinEditSelect(Sender: TObject);
begin
  if (not ValidarSiniestroUsuarioTerce(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then       // por Plan Ioma - Tercerizadoras
  begin
    MsgBox('Ud. no posee permisos para visualizar este siniestro.', MB_ICONEXCLAMATION);
    tbLimpiarClick(nil);
  end

end;

end.
