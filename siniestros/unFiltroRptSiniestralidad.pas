unit unFiltroRptSiniestralidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, DB,
  JvExControls, JvComponent, JvDBLookup, SDEngine, Mask, ToolEdit,
  DateComboBox, ExtCtrls;

type
  TfrmFiltroRptSiniestralidad = class(TfrmCustomForm)
    btnImprimir: TButton;
    btnCancelar: TButton;
    sdqGerentes: TSDQuery;
    dsGerentes: TDataSource;
    sdqGerentesGERENTE: TStringField;
    gbGerente: TGroupBox;
    cmbGerente: TJvDBLookupCombo;
    gbFAccidente: TGroupBox;
    edFAcciHasta: TDateComboBox;
    Label9: TLabel;
    edFAcciDesde: TDateComboBox;
    Bevel1: TBevel;
    gbRegion: TGroupBox;
    cmbRegion: TJvDBLookupCombo;
    sdqRegion: TSDQuery;
    dsRegion: TDataSource;
    gbEmpresa: TGroupBox;
    cmbEmpresa: TJvDBLookupCombo;
    sdqEmpresas: TSDQuery;
    dsEmpresas: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  end;

var
  frmFiltroRptSiniestralidad: TfrmFiltroRptSiniestralidad;

implementation

uses
  unVisualizador, unRptSiniestralidad, General, CustomDlgs, Strfuncs, unDmPrincipal, DateTimeFuncs;

{$R *.dfm}

procedure TfrmFiltroRptSiniestralidad.FormCreate(Sender: TObject);
begin
  edFAcciDesde.Date := FirstDayOfYear(DBDate-365);
  edFAcciHasta.Date := FirstDayOfYear(DBDate) - 1;
  inherited;
  {
  sdqGerentes.Open;
  sdqRegion.Open;
  }
  sdqEmpresas.Open;
end;

procedure TfrmFiltroRptSiniestralidad.btnCancelarClick(Sender: TObject);
begin
  Close;
  inherited;
end;

procedure TfrmFiltroRptSiniestralidad.btnImprimirClick(Sender: TObject);
begin
//  Verificar(IsEmptyString(cmbGerente.Value) and IsEmptyString(cmbRegion.Value), btnImprimir, 'Debe seleccionar al menos un filtro.');
  Verificar(IsEmptyString(cmbEmpresa.Value), btnImprimir, 'Debe seleccionar la empresa.');
  qrSiniestralidad := TqrSiniestralidad.Create(nil);
  with qrSiniestralidad do
  try
    Imprimir(cmbEmpresa.KeyValue, {126623, Gerente.Value, cmbRegion.Value, } edFAcciDesde.Date, edFAcciHasta.Date);
  finally
    //Free;
  end;
end;

end.
