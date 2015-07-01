unit unFiltroEncuestaEstadistica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ImgList, XPMenu, RxPlacemnt, Vcl.StdCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, Vcl.Mask, RxToolEdit, DateComboBox, Vcl.ExtCtrls;

type
  TfrmFiltroEncuestaEstadistica = class(TfrmCustomForm)
    btnVisualizar: TButton;
    gbFecha: TGroupBox;
    edEI_FECHATERMINADODesde: TDateComboBox;
    edEI_FECHATERMINADOHasta: TDateComboBox;
    Label9: TLabel;
    btnCerrar: TButton;
    Bevel1: TBevel;
    gbEncuesta: TGroupBox;
    fraEI_IDENCUESTA: TfraCodDesc;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  end;

var
  frmFiltroEncuestaEstadistica: TfrmFiltroEncuestaEstadistica;

implementation

{$R *.dfm}

uses unRptEncuestaEstadistica, CustomDlgs;

procedure TfrmFiltroEncuestaEstadistica.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiltroEncuestaEstadistica.btnVisualizarClick(Sender: TObject);
begin
  Verificar(fraEI_IDENCUESTA.IsEmpty, fraEI_IDENCUESTA, 'Debe seleccionar una encuesta.');
  Verificar(edEI_FECHATERMINADODesde.IsEmpty, edEI_FECHATERMINADODesde, 'Debe seleccionar una fecha de finalizada desde.');
  Verificar(edEI_FECHATERMINADOHasta.IsEmpty, edEI_FECHATERMINADOHasta, 'Debe seleccionar una fecha de finalizada hasta.');
  Verificar(edEI_FECHATERMINADOHasta.Date < edEI_FECHATERMINADODesde.Date, edEI_FECHATERMINADOHasta, 'La fecha hasta debe ser igual o posterior a la fecha desde.');
  Application.CreateForm(TqrEncuestaEstadistica, qrEncuestaEstadistica);
  try
    qrEncuestaEstadistica.VisualizarEstadistica(fraEI_IDENCUESTA.Value, edEI_FECHATERMINADODesde.Date, edEI_FECHATERMINADOHasta.Date, fraEI_IDENCUESTA.Descripcion);
  finally
    FreeAndNil(qrEncuestaEstadistica);
  end;
end;

end.
