unit unListSiniestrosConInternacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, unfraPrestador, Mask, PatternEdit, ComboEditor, CheckCombo,
  DBCheckCombo, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  ToolEdit, DateComboBox, SinEdit, FormPanel, unArtDbFrame;

type
  TfrmListSiniestrosConInternacion = class(TfrmCustomConsulta)
    GroupBox2: TGroupBox;
    fraPrestador: TfraPrestador;
    GroupBox6: TGroupBox;
    fraDelegacion: TfraStaticCodigoDescripcion;
    gbInternados: TGroupBox;
    rbIntActualmente: TRadioButton;
    rbIntHistorico: TRadioButton;
    dcIntHasta: TDateComboBox;
    Label2: TLabel;
    dcIntDesde: TDateComboBox;
    rbIntMultiples: TRadioButton;
    fpABM: TFormPanel;
    Label7: TLabel;
    lblDatSin: TLabel;
    edSiniestroABM: TSinEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    dcIntHastaABM: TDateComboBox;
    dcIntDesdeABM: TDateComboBox;
    Label3: TLabel;
    Label1: TLabel;
    Bevel3: TBevel;
    gbGestor: TGroupBox;
    cmbGestor: TArtComboBox;
    gbGrupoTrabajo: TGroupBox;
    cmbGtrabajo: TDBCheckCombo;
    sdqGtrabajo: TSDQuery;
    dsGtrabajo: TDataSource;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
    GroupBox1: TGroupBox;
    edSiniestro: TSinEdit;
    GroupBox3: TGroupBox;
    chkCronicos: TCheckBox;
    chkSRT: TCheckBox;
    chkComisionMedica: TCheckBox;
    GroupBox4: TGroupBox;
    rbTodosInfoSoc: TRadioButton;
    rbConInfoSoc: TRadioButton;
    rbSinInfoSoc: TRadioButton;
    procedure rbIntHistoricoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbIntActualmenteClick(Sender: TObject);
    procedure rbIntMultiplesClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaCalcFields(DataSet: TDataSet);
    procedure cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DoHabilitarFechas(bHabilitar :Boolean);
  public
    { Public declarations }
  end;

var
  frmListSiniestrosConInternacion: TfrmListSiniestrosConInternacion;
  bUsuarioTerce: Boolean;

implementation

uses AnsiSql, unSesion, unDmPrincipal, unPrincipal, VCLExtra, CustomDlgs,
     unTercerizadoras;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.rbIntHistoricoClick(Sender: TObject);
begin
  DoHabilitarFechas(True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT si_siniestro || ''-'' || si_orden || ''-'' || si_recaida Siniestro,' +
                ' si_siniestro, si_orden, si_recaida, ' +
                ' ex_cuil Cuil, tj_nombre Paciente, ex_cuit Cuit, em_nombre Empresa, ' +
                ' nvl(ex_fecharecaida,ex_fechaaccidente) F_Sini, ex_diagnostico Diagnostico, ' +
                ' ex_diagnosticooms CIE10, si_internadodesde Inter_Desde, ' +
                ' ca_descripcion Prestador, si_operprog Oper_Prog, lg_nombre Delegacion, ' +
                ' grupo_actual.gp_nombre Grupo_Actual, grupo_anterior.gp_nombre Grupo_Anterior, siniestro.get_usuariogestor(ex_id) USUGESTOR, ' +
                ' si_internadohasta Inter_Hasta, si_altaegreso Alta_PME, si_id, ' +
                ' si_internadohasta-si_internadodesde DiasIntern, ' +
                ' si_gastofarmacia, si_gastoortopedia, si_gastotraslado, si_gastomedico, si_gastototal ' +
                ', art.siniestro.get_fechainformesocial(si_idexpediente) FecParte ' +    // TK 4539
                ', art.siniestro.get_usuarioinformesocial(si_idexpediente) UsuParte, ' +
                ' tj_sexo, tj_fnacimiento ' +  // TK 18934
           ' FROM sex_expedientes, aem_empresa, ctj_trabajador, dlg_delegaciones, ' +
                ' mgp_gtrabajo grupo_actual, mgp_gtrabajo grupo_anterior, ' +
                ' cpr_prestador, msi_siniestro_internado a ' +
          ' WHERE ex_siniestro = si_siniestro ' +
            ' AND ex_orden = si_orden ' +
            ' AND ex_recaida = si_recaida ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND si_idprestador = ca_identificador ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND ex_gtrabajo = grupo_actual.gp_codigo ' +
            ' AND si_gtrabajo = grupo_anterior.gp_codigo ' +
            ' AND si_fechabaja IS NULL ';

  if rbConInfoSoc.Checked then        // TK 4539
    sSql := sSql + ' AND art.siniestro.get_fechaInformesocial(si_idexpediente) is not null ';

  if rbSinInfoSoc.Checked then       // TK 4539
    sSql := sSql + ' AND art.siniestro.get_fechainformesocial(si_idexpediente) is null ';

  if not(fraPrestador.IsEmpty) then
    sSql := sSql + ' AND si_idprestador = ' + SqlInt(fraPrestador.IDPrestador);

  if not(fraDelegacion.IsEmpty) then
    sSql := sSql + ' AND nvl(ex_delegacion, '''') = ' + SqlValue(fraDelegacion.Codigo);

  if (Trim(cmbGtrabajo.Text) <> '') then
    sSql := sSql + ' AND nvl(ex_gtrabajo,'''') ' + cmbGtrabajo.InSql;

  if (Trim(cmbGestor.Text) <> '') then
    sSql := sSql + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text);

  if chkComisionMedica.Checked then
    sSql := sSql+  ' AND art.inca.is_dictamencommed(si_siniestro, si_orden) = ''S'' ';

  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND si_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND si_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND si_recaida = ' + SqlInt(edSiniestro.Recaida);

  if chkSRT.Checked then
    sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                                 ' FROM sdg_denunciasgraves ' +
                                ' WHERE dg_siniestro = si_siniestro ' +
                                  ' AND dg_orden = si_orden) ';

  if chkCronicos.Checked then
    sSql := sSql + ' AND si_gtrabajo = ''51'' '
  else
    sSql := sSql + ' AND si_gtrabajo <> ''51'' ';

{  if rbIntActualmente.Checked then                             // se saca por Ticket 59444
    sSql := sSql + ' AND si_internadohasta IS NULL ';      }

  if rbIntHistorico.Checked then
    sSql := sSql + ' AND (si_internadodesde BETWEEN ' + SqlDate(dcIntDesde.Date) +
                                              ' AND ' + SqlDate(dcIntHasta.Date) +
                     ' OR si_internadohasta BETWEEN ' + SqlDate(dcIntDesde.Date) +
                                              ' AND ' + SqlDate(dcIntHasta.Date) + ')';

  if rbIntMultiples.Checked then
    sSql := sSql + ' AND si_internadohasta IS NULL ' +
                   ' AND si_fechabaja IS NULL ' +
                   ' AND EXISTS (SELECT 1 ' +
                                 ' FROM msi_siniestro_internado b ' +
                                ' WHERE a.si_siniestro = b.si_siniestro ' +
                                  ' AND a.si_orden = b.si_orden ' +
                                  ' AND a.si_recaida = b.si_recaida ' +
                                  ' AND b.si_internadohasta IS NULL ' +
                                  ' AND a.si_id <> b.si_id) ';

 if bUsuarioTerce then
   sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';


  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  Grid.Columns[10].Visible := rbIntHistorico.Checked;
  inherited;
  MostrarEstado('Cantidad de siniestros: ' + IntToStr(sdqConsulta.RecordCount));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.FormCreate(Sender: TObject);
begin
  // Lu. por si se borran los datasources.
  cmbGTrabajo.DataSource := dsGTrabajo;
  cmbGestor.DataSource   := dsGestor;
  LockControls([dcIntDesde, dcIntHasta], True);
  sdqGTrabajo.Open;
  bUsuarioTerce := EsUsuarioDeTercerizadora;

  with fraDelegacion do
  begin
    TableName     := 'DLG_DELEGACIONES';
    FieldID       := 'LG_CODIGO';
    FieldCodigo   := 'LG_CODIGO';
    FieldDesc     := 'LG_NOMBRE';
    FieldBaja     := 'LG_FECHABAJA';
    ShowBajas     := True;
  end;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.rbIntActualmenteClick(Sender: TObject);
begin
 // DoHabilitarFechas(False);                  // se saca por ticket 59444 (en donde se pide sacar este check)
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.rbIntMultiplesClick(Sender: TObject);
begin
  DoHabilitarFechas(False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.DoHabilitarFechas(bHabilitar :boolean);
begin
  LockControls([dcIntDesde, dcIntHasta], not bHabilitar);
  if not bHabilitar then
  begin
    dcIntDesde.Clear;
    dcIntHasta.Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.tbLimpiarClick(Sender: TObject);
begin
  fraPrestador.Limpiar;
  fraDelegacion.Clear;
  cmbGtrabajo.Clear;
  cmbGestor.Clear;
  edSiniestro.Clear;
  chkComisionMedica.Checked := False;
  chkSRT.Checked            := False;
//  rbIntActualmente.Checked  := True;
  rbTodosInfoSoc.Checked    := True;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  if (MessageDlg('¿Confirma la baja del registro seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    sSql := 'UPDATE msi_siniestro_internado ' +
              ' SET si_fechabaja = ActualDate, ' +
                  ' si_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE si_id = ' + SqlInt(sdqConsulta.FieldByName('SI_ID').AsInteger);
    EjecutarSql(sSql);
    sdqConsulta.Refresh;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.tbModificarClick(Sender: TObject);
begin
  edSiniestroABM.SetValues(sdqConsulta.FieldByName('SI_SINIESTRO').AsInteger,
                           sdqConsulta.FieldByName('SI_ORDEN').AsInteger,
                           sdqConsulta.FieldByName('SI_RECAIDA').AsInteger);
  dcIntDesdeABM.Date := sdqConsulta.FieldByName('Inter_Desde').AsDateTime;
  dcIntHastaABM.Date := sdqConsulta.FieldByName('Inter_Hasta').AsDateTime;
  fpABM.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.btnAceptarClick(Sender: TObject);
var
  sSql :String;
begin
  verificar(dcIntDesdeABM.IsEmpty, dcIntDesdeABM, 'La fecha ''Desde'' no puede estar vacía');
  sSql := 'UPDATE msi_siniestro_internado ' +
            ' SET si_internadodesde = ' + SqlDate(dcIntDesdeABM.Date) + ',' +
                ' si_internadohasta = ' + SqlDate(dcIntHastaABM.Date) + ',' +
                ' si_fechamodif = ActualDate, ' +
                ' si_usumodif = ' + SqlValue(Sesion.UserID) +
          ' WHERE si_id = ' + SqlInt(sdqConsulta.FieldByName('SI_ID').AsInteger);
  EjecutarSql(sSql);
  sdqConsulta.Refresh;
  fpABM.ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.sdqConsultaCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('IMPPRESMED').AsCurrency := DataSet.FieldByName('IMPPRESTMED').AsCurrency -
                                                  DataSet.FieldByName('IMPTRASLADOS').AsCurrency -
                                                  DataSet.FieldByName('IMPORTOPEDIA').AsCurrency -
                                                  DataSet.FieldByName('IMPFARMACIA').AsCurrency;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConInternacion.cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
var sSql :String;
begin
  If Trim(cmbGTrabajo.Text) <> '' then   // Lu 04/04/2008 pongo este if para que ejecute lo siguiente solo si se ingreso algo en el combo.
  begin
      cmbGestor.Clear;
      sSql := 'SELECT ug_id, ug_usuario ' +
              ' FROM mgp_gtrabajo, mug_usuariogrupotrabajo, ctb_tablas ' +
             ' WHERE ug_fechabaja IS NULL ' +
               ' AND ug_tipousuario = tb_codigo ' +
               ' AND tb_clave = ''TUSU'' ' +
               ' AND tb_especial1 = ''S'' ' +
               ' AND gp_codigo = ug_grupo ' +
               ' AND gp_gestionado = ''S'' ' +
               ' AND gp_codigo ' + cmbGtrabajo.InSql;
      sdqGestor.Close;
      sdqGestor.SQL.Text := sSql;
      sdqGestor.Open;
  end;
end;


procedure TfrmListSiniestrosConInternacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
