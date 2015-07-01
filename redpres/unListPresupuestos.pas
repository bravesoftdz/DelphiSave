unit unListPresupuestos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unfraPrestador, StdCtrls, Mask, ToolEdit, DateComboBox, SinEdit,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, unArtFrame,
  unFraCodigoDescripcion, unArtDBAwareFrame, unArtDbFrame;

type
  TfrmListPresupuestos = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    fraPrestador: TfraPrestador;
    cmbEstado: TDBCheckCombo;
    dsEstado: TDataSource;
    sdqEstado: TSDQuery;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    dcHasta: TDateComboBox;
    dcDesde: TDateComboBox;
    GroupBox4: TGroupBox;
    edSiniestro: TSinEdit;
    GroupBox5: TGroupBox;
    fraPrestacion: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListPresupuestos: TfrmListPresupuestos;

implementation

uses AnsiSql;

{$R *.DFM}

procedure TfrmListPresupuestos.FormCreate(Sender: TObject);
begin
  inherited;
  sdqEstado.Open;
  with fraPrestacion do
  begin
    TableName       := 'MPR_PRESTACIONES';
    FieldID         := 'PR_CODIGO';
    FieldCodigo     := 'PR_CODIGO';
    FieldDesc       := 'PR_DESCRIPCION';
    FieldBaja       := 'PR_FBAJA';
    ExtraCondition  := ' AND PR_FORMULARIO = ''P''';
    ShowBajas       := False;
  end;
end;

procedure TfrmListPresupuestos.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT au_siniestro Siniestro, au_orden Orden, au_recaida Recaida, au_numauto Auto,' +
                ' estado.tb_descripcion estado, sp_nropedido Nro_Pedido, sp_presupuesto Presu, ' +
                ' ca_descripcion Prestador, NVL(pa_materialcoti,pa_materialsoli) Material, ' +
    	          ' au_fechaalta FCargaAut, pa_fecharecepcion F_Recepcion, pa_cotizacion Cotizacion, ' +
	              ' sp_observaciones Observaciones, sp_adjudicado Adjudicado, anula.tb_descripcion Mot_anul, ' +
                ' pr_descripcion prestacion ' +
           ' FROM sau_autorizaciones, mpr_prestaciones, ctb_tablas estado, ' +
                ' cpr_prestador, mpa_presupuestoautorizacion, msp_siniestropresup, ' +
	              ' ctb_tablas anula ' +
          ' WHERE au_pressol = pr_codigo ' +
            ' AND pr_formulario = ''P'' ' +
            ' AND au_estado NOT IN (''D'',''N'',''X'') ' +
            ' AND estado.tb_clave = ''MUAUT'' ' +
            ' AND estado.tb_codigo = au_estado ' +
            ' AND sp_siniestro = au_siniestro ' +
            ' AND sp_orden = au_orden ' +
            ' AND sp_recaida = au_recaida ' +
            ' AND au_numauto = NVL(sp_autoapro,sp_autooriginal) ' +
            ' AND sp_presupuesto = pa_id ' +
            ' AND sp_fechabaja IS NULL ' +
            ' AND pa_prestador = ca_identificador ' +
            ' AND anula.tb_clave (+) = ''MOTAN'' ' +
            ' AND anula.tb_codigo (+) = au_motivoanulacion ';

  if not(dcDesde.IsEmpty) then
    sSql := sSql + ' AND au_fechaalta >= ' + dcDesde.SqlText;

  if not(dcHasta.IsEmpty) then
    sSql := sSql + ' AND au_fechaalta <= ' + dcHasta.SqlText;

  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND au_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND au_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND au_recaida = ' + SqlInt(edSiniestro.Recaida);

  if (Trim(cmbEstado.Text) <> '') then
    sSql := sSql + ' AND au_estado ' + cmbEstado.InSql;

  if not(fraPrestacion.IsEmpty) then
    sSql := sSql + ' AND au_pressol = ' + SqlValue(fraPrestacion.Codigo);

  if not(fraPrestador.IsEmpty) then
    sSql := sSql + ' AND ca_identificador = ' + SqlInt(fraPrestador.IDPrestador);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmListPresupuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  sdqEstado.Close;
  Action := caFree;
end;

procedure TfrmListPresupuestos.tbLimpiarClick(Sender: TObject);
begin
  dcDesde.Clear;
  dcHasta.Clear;
  edSiniestro.Clear;
  cmbEstado.Clear;
  fraPrestacion.Clear;
  fraPrestador.Clear;
  inherited;
end;

end.
