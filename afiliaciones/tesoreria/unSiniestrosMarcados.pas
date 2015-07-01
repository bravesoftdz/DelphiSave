unit unSiniestrosMarcados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, Mask, ToolEdit, DateComboBox, PatternEdit, IntEdit, sqlfuncs, ansisql,
  SinEdit;

type
  TfrmSiniestrosMarcados = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    fraEmpresa1: TfraEmpresa;
    gbFechaMarca: TGroupBox;
    cbFechaMarcaDesde: TDateComboBox;
    gbFechaDesmarca: TGroupBox;
    cbFechaDesmarcaDesde: TDateComboBox;
    rgActMarcado: TRadioGroup;
    gbSiniestro: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbFechaMarcaHasta: TDateComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cbFechaDesmarcaHasta: TDateComboBox;
    edSiniestro: TSinEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmSiniestrosMarcados: TfrmSiniestrosMarcados;

implementation

{$R *.dfm}

procedure TfrmSiniestrosMarcados.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  sSql := 'SELECT ex_siniestro siniestro, ex_orden orden, ex_recaida recaida, ' +
                 'ex_fechaaccidente fecha_accidente, ex_contrato contrato, ex_cuit cuit, ' +
                 'em_nombre empresa, nl_marcado marcado, nl_enfnolistada enf_no_listada, ' +
                 'nl_hipoacusia hipoacusia, nl_fechamarca fecha_marca, ' +
                 'nl_obsmarca obs_marca, nl_fechadesmarca fecha_desmarca, ' +
                 'nl_obsdesmarca obs_desmarca, nl_tarea tarea, nl_enfermedad enfermedad, ' +
                 'nl_agente agente, tj_nombre, tj_cuil ' +
            'FROM aem_empresa, art.sex_expedientes, SIN.snl_enfermedadnolistada a, comunes.ctj_trabajador ' +
           'WHERE ex_id = nl_idexpediente AND ex_cuit = em_cuit AND EX_CUIL = TJ_CUIL';

  if not fraEmpresa1.IsEmpty then
    addcondition(sSql, 'ex_contrato = ' + sqlint(fraEmpresa1.Contrato));

  if not cbFechaMarcaDesde.IsEmpty then
    addcondition(sSql, 'nl_fechamarca >= ' + sqlvalue(cbFechaMarcaDesde.Date));

  if not cbFechaMarcaHasta.IsEmpty then
    addcondition(sSql, 'nl_fechamarca <= ' + sqlvalue(cbFechaMarcaHasta.Date));

  if not cbFechaDesmarcaDesde.IsEmpty then
    addcondition(sSql, 'nl_fechadesmarca >= ' + sqlvalue(cbFechaDesmarcaDesde.Date));

  if not cbFechaDesmarcaHasta.IsEmpty then
    addcondition(sSql, 'nl_fechadesmarca <= ' + sqlvalue(cbFechaDesmarcaHasta.Date));

  case rgActMarcado.ItemIndex of
    0: addcondition(sSql, 'nl_marcado = ''S''');
    1: addcondition(sSql, 'nl_marcado = ''N''');
  end;

  if not edSiniestro.IsEmpty then
  begin
    addcondition(sSql, 'ex_siniestro = ' + sqlint(edSiniestro.Siniestro));
    addcondition(sSql, 'ex_orden = ' + sqlint(edSiniestro.Orden));
    addcondition(sSql, 'ex_recaida = ' + sqlint(edSiniestro.Recaida));
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

  grid.columns.items[6].width := 350;
  grid.columns.items[11].width := 192;
  grid.columns.items[13].width := 192;
  grid.columns.items[14].width := 192;
  grid.columns.items[15].width := 192;
  grid.columns.items[16].width := 192;
end;

procedure TfrmSiniestrosMarcados.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa1.clear;
  cbFechaMarcaDesde.Clear;
  cbFechaDesmarcaDesde.Clear;
  cbFechaMarcaHasta.clear;
  cbFechaDesmarcaHasta.Clear;
  rgActMarcado.ItemIndex := 2;
  edSiniestro.Clear;
end;

procedure TfrmSiniestrosMarcados.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa1.ShowBajas := true;
end;

end.
