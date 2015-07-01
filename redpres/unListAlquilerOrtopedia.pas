unit unListAlquilerOrtopedia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  SinEdit, StdCtrls, Mask, ToolEdit, DateComboBox, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, unfraPrestador, FormPanel,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraCodigoDescripcion,
  unFraGrupoTrabajo;

type
  TfrmListAlquilerOrtopedia = class(TfrmCustomConsulta)
    GroupBox3: TGroupBox;
    Label4: TLabel;
    dcHastaVencim: TDateComboBox;
    dcDesdeVencim: TDateComboBox;
    GroupBox4: TGroupBox;
    edSiniestro: TSinEdit;
    dsDelegacion: TDataSource;
    sdqDelegacion: TSDQuery;
    gbDelegacion: TGroupBox;
    cmbDelegacion: TDBCheckCombo;
    grpPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    gbEstado: TGroupBox;
    cmbEstado: TComboBox;
    gbGrupoTrabajo: TGroupBox;
    cmbGtrabajo: TDBCheckCombo;
    gbGestor: TGroupBox;
    cmbGestor: TArtComboBox;
    sdqGtrabajo: TSDQuery;
    dsGtrabajo: TDataSource;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DoMarcarAlquiler(sMarca :String);
    function HayRegistroActivo :Boolean;
  public
    { Public declarations }
  end;

var
  frmListAlquilerOrtopedia: TfrmListAlquilerOrtopedia;

implementation

uses AnsiSql, unSesion, CustomDlgs, unDmPrincipal, General;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT sp_siniestro, sp_orden, sp_recaida, oa_id, oa_idautorizacion, ' +
                ' utiles.armar_siniestro(sp_siniestro, sp_orden, sp_recaida) siniestro, ' +
                ' oa_fechavencimiento, oa_renueva, ca_nombrefanta prestador, ca_codarea || '' '' || ca_telefono telprestador, ' +
                ' utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_departamento, ca_localidad) domprestador, ' +
                ' tj_nombre trabajador, art.trabajador.get_telefono(tj_id, 4) teltrabajador, ' +
                ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) domtrabajador, ' +
                ' pa_materialcoti matcotizado, pa_materialsoli matsolicitado, ' +
                ' nvl(sp_autoapro, sp_autooriginal) autorizacion, sp_valor_adju valadjudicado, ' +
                ' lg_nombre delegacion, gp_nombre gtrabajo, ex_id, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
           ' FROM amed.moa_ortopedia_alquiler, cpr_prestador, ctj_trabajador, ' +
                ' sex_expedientes, msp_siniestropresup, mpa_presupuestoautorizacion, ' +
                ' dlg_delegaciones, mgp_gtrabajo ' +
          ' WHERE oa_fechabaja IS NULL ' +
            ' AND pa_prestador = ca_identificador ' +
            ' AND siniestro.get_idexpediente(sp_siniestro, sp_orden, sp_recaida) = ex_id ' +
            ' AND tj_cuil = ex_cuil ' +
            ' AND oa_idpresupuesto = sp_nropedido ' +
            ' AND pa_id = sp_presupuesto ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND ex_gtrabajo = gp_codigo ';

  if not(dcDesdeVencim.IsEmpty) then
    sSql := sSql + ' AND oa_fechavencimiento >= ' + dcDesdeVencim.SqlText;

  if not(dcHastaVencim.IsEmpty) then
    sSql := sSql + ' AND oa_fechavencimiento <= ' + dcHastaVencim.SqlText;

  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND sp_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND sp_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND sp_recaida = ' + SqlInt(edSiniestro.Recaida);

  if (cmbDelegacion.Text <> '') then
    sSql := sSql + ' AND ex_delegacion ' + cmbDelegacion.InSql;

  if (cmbGtrabajo.Text <> '') then
    sSql := sSql + ' AND ex_gtrabajo ' + cmbGtrabajo.InSql;

  if (cmbGestor.Text <> '') then
     sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text);

  if not(fraPrestador.IsEmpty) then
    sSql := sSql + ' AND pa_prestador = ' + SqlInt(fraPrestador.IDPrestador);

  case cmbEstado.ItemIndex of
    1: sSql := sSql + ' AND oa_renueva IS NULL ';
    2: sSql := sSql + ' AND oa_renueva IS NOT NULL ';
    3: sSql := sSql + ' AND oa_renueva = ''S'' ';
    4: sSql := sSql + ' AND oa_renueva = ''N'' ';
  end;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  tbNuevo.Enabled := HayRegistroActivo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.tbLimpiarClick(Sender: TObject);
begin
  dcDesdeVencim.Clear;
  dcHastaVencim.Clear;
  edSiniestro.Clear;
  cmbDelegacion.Clear;
  cmbGtrabajo.Clear;
  cmbGestor.Clear;
  fraPrestador.Clear;
  tbNuevo.Enabled     := False;
  cmbEstado.ItemIndex := 0;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.FormCreate(Sender: TObject);
begin
  inherited;
  sdqDelegacion.Open;
  sdqGTrabajo.Open;
  tbNuevo.Enabled         := False;
  tbNuevo.ImageIndex      := 44;
  tbModificar.ImageIndex  := 45;
  cmbEstado.ItemIndex     := 0;
  cmbGtrabajo.DataSource  := dsGtrabajo; // Lu 04/04/08 lo agregue por si se borran los Datasources.
  cmbGestor.DataSource    := dsGestor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.FieldByName('VALADJUDICADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VALADJUDICADO')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  if HayRegistroActivo and
     (MsgBox('Se dispone a dar de baja el registro.' + #13 + '¿Esta usted seguro?',
              MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    sSql := 'UPDATE amed.moa_ortopedia_alquiler ' +
              ' SET oa_fechabaja = actualdate, ' +
                  ' oa_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE oa_id = ' + SqlInt(sdqConsulta.FieldByName('OA_ID').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmListAlquilerOrtopedia.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.tbNuevoClick(Sender: TObject);
begin
  if HayRegistroActivo and sdqConsulta.FieldByName('OA_RENUEVA').IsNull  and
     (MsgBox('¿Confirma la renovación del alquiler seleccionado?',
              MB_ICONQUESTION + MB_YESNO) = IDYES) then
    DoMarcarAlquiler('S');
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.tbModificarClick(Sender: TObject);
begin
  if HayRegistroActivo and sdqConsulta.FieldByName('OA_RENUEVA').IsNull  and
     (MsgBox('¿Confirma la NO renovación del alquiler seleccionado?',
              MB_ICONQUESTION + MB_YESNO) = IDYES) then
    DoMarcarAlquiler('N');
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.DoMarcarAlquiler(sMarca :String);
var
  sSql :String;
begin
  sSql := 'UPDATE amed.moa_ortopedia_alquiler ' +
            ' SET oa_renueva = ' + SqlValue(sMarca) + ',' +
                ' oa_fechamodif = actualdate, ' +
                ' oa_usumodif = ' + SqlValue(Sesion.UserID) +
         ' WHERE oa_id = ' + SqlInt(sdqConsulta.FieldByName('OA_ID').AsInteger);
  EjecutarSql(sSql);
  tbRefrescarClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.GridDblClick(Sender: TObject);
begin
//  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAlquilerOrtopedia.cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
var
  sSql :String;
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

procedure TfrmListAlquilerOrtopedia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
