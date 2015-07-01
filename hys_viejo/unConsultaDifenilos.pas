unit unConsultaDifenilos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unfraEstablecimientoDomic, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, PatternEdit, IntEdit;

type
  TfrmConsultaDifenilos = class(TfrmCustomConsulta)
    fraEmpresaFiltro: TfraEmpresa;
    CUIT: TLabel;
    fraEstablecimiento: TfraEstablecimientoDomic;
    Label1: TLabel;
    ShortCutControl1: TShortCutControl;
    edNroInformeFiltro: TIntEdit;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraEmpresaFiltroOnChange(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmConsultaDifenilos: TfrmConsultaDifenilos;

implementation

uses unInfDifenilos, DateUtils,AnsiSql;

{$R *.dfm}

procedure TfrmConsultaDifenilos.tbLimpiarClick(Sender: TObject);
begin
  edNroInformeFiltro.Clear;
  fraEstablecimiento.Clear;
  fraEmpresaFiltro.Clear;
  inherited;
end;

procedure TfrmConsultaDifenilos.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.OnChange := fraEmpresaFiltroOnChange;
  fraEmpresaFiltro.ShowBajas := True;
  fraEstablecimiento.ShowBajas := True;
end;

procedure TfrmConsultaDifenilos.fraEmpresaFiltroOnChange(Sender: TObject);
begin
  inherited;
  if fraEmpresaFiltro.IsSelected then
    fraEstablecimiento.CUIT := fraEmpresaFiltro.CUIT
  else
    fraEstablecimiento.Clear;


end;

procedure TfrmConsultaDifenilos.tbNuevoClick(Sender: TObject);
begin
  with TfrmInfDifenilos.Create(Self) do
  try
    nuevoInforme;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmConsultaDifenilos.tbModificarClick(Sender: TObject);
begin
  with TfrmInfDifenilos.Create(Self) do
  try
    Cargar(sdqConsulta.fieldbyname('in_id').AsInteger);
    ShowModal;
  finally
    Free;
  end;

end;

procedure TfrmConsultaDifenilos.RefreshData;
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';
  if not edNroInformeFiltro.IsEmpty then
    sWhere := sWhere + ' AND in_nroinforme = ' + SqlValue(edNroInformeFiltro.Value);

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND co_contrato = ' + SqlValue(fraEmpresaFiltro.Contrato);

  if fraEstablecimiento.IsSelected then
    sWhere := sWhere + ' AND es_id = ' + SqlValue(fraEstablecimiento.IdEstablecimiento);

  sSql := ' SELECT hin.*, aes.es_nombre, em_nombre, co_contrato, es_nroestableci ' +
          '  FROM afi.aem_empresa aem, afi.aes_establecimiento aes, afi.aco_contrato aco, hys.hin_informe hin ' +
          ' WHERE in_tipoinforme = ''D'' ' +
          '   AND in_idestableci = es_id ' +
          '   AND co_contrato = es_contrato ' +
          '   AND em_id = co_idempresa ' + sWhere;

  sdqConsulta.SQL.Text := sSql;

  inherited;
end;

end.
