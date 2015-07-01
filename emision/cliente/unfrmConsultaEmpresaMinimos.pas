unit unfrmConsultaEmpresaMinimos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, AnsiSql;

type
  TfrmConsultaEmpresasMinimos = class(TfrmCustomConsulta)
    fraEmpresaFiltro: TfraEmpresa;
    lblCUIT: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ArmarConsulta;
  public
    { Public declarations }
  end;

var
  frmConsultaEmpresasMinimos: TfrmConsultaEmpresasMinimos;

implementation

{$R *.dfm}

procedure TfrmConsultaEmpresasMinimos.ArmarConsulta;
var
  sql: String;
begin
  sdqConsulta.SQL.Clear;
  
  sql := ' SELECT aem.em_cuit, aem.em_nombre, aco.co_contrato, iem.em_empleadosminimos, iem.em_masaminima, iem.em_usualta, ' +
         '        iem.em_fechaalta, iem.em_usumodif, iem.em_fechamodif ' +
         ' FROM emi.iem_empresaminimo iem, afi.aem_empresa aem, afi.aco_contrato aco ' +
         ' WHERE iem.em_contrato = aco.co_contrato ' +
         ' AND aco.co_idempresa = aem.em_id ';

  if fraEmpresaFiltro.IsSelected then
    sql := sql + ' AND aem.em_id = ' + SqlValue(fraEmpresaFiltro.Value);

  sdqConsulta.SQL.Add(sql);
end;

procedure TfrmConsultaEmpresasMinimos.tbRefrescarClick(Sender: TObject);
begin
  ArmarConsulta;
  inherited;
end;

procedure TfrmConsultaEmpresasMinimos.FormCreate(Sender: TObject);
begin
  fraEmpresaFiltro.ShowBajas:= True;
  inherited;
end;

end.
