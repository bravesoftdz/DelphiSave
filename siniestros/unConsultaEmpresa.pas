unit unConsultaEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unfraInfoEmpresa, unfraInfoEmpresaExt;

type
  TfrmConsultaEmpresa = class(TfrmCustomConsulta)
    ShortCutControlChild: TShortCutControl;
    fraInfoEmpresaExt: TfraInfoEmpresaExt;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
    FIdEmpresa: Integer;
  public
    procedure RefreshData; override;

    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;
  end;

var
  frmConsultaEmpresa: TfrmConsultaEmpresa;

implementation

uses
  AnsiSql, VCLExtra;

{$R *.dfm}

procedure TfrmConsultaEmpresa.RefreshData;
begin
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);

  sdqConsulta.SQL.Text :=
    'SELECT em_cuit, co_contrato, co_vigenciadesde, co_vigenciahasta, estado.tb_descripcion "Estado", co_fechabaja,' +
          ' motivo.tb_descripcion "Motivo"' +
     ' FROM ctb_tablas motivo, ctb_tablas estado, aco_contrato, aem_empresa' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_motivobaja = motivo.tb_codigo(+)' +
      ' AND motivo.tb_clave(+) = ''MOTIB''' +
      ' AND co_estado = estado.tb_codigo' +
      ' AND estado.tb_clave = ''AFEST''' +
      ' AND em_id = ' + SqlValue(IdEmpresa);

  sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + SortDialog.OrderBy;
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    DynColWidthsByData(Grid);
  if Grid.CanFocus then
    Grid.SetFocus;
end;

procedure TfrmConsultaEmpresa.tbPropiedadesClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    DynColWidthsByData(Grid);
end;

procedure TfrmConsultaEmpresa.FSFormShow(Sender: TObject);
begin
  inherited;
  if not sdqConsulta.Active then
    RefreshData;
end;

procedure TfrmConsultaEmpresa.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fraInfoEmpresaExt.CargarContrato(sdqConsulta.FieldByName('co_contrato').AsInteger, sdqConsulta.FieldByName('em_cuit').AsString);
end;

end.
