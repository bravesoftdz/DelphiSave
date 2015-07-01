unit unLibroAfiliaciones;

{-------------------------------------------------------------------------------
   Registro de Denuncias de Siniestro.
   Parámetros: Período
   Nro. de Libro = 8
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db, SDEngine, RxLookup, RxGIF,
  ExtCtrls, ComCtrls, PeriodoPicker;

type
  TfrmLibroAfiliaciones = class(TForm)
    lbFechaDesde: TLabel;
    edPERIODO: TPeriodoPicker;
    edDESC_PERIODO: TEdit;
    btnCancelar: TButton;
    btnAceptar: TButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPERIODOExit(Sender: TObject);
  end;

const
  NroListado = 8;

implementation

uses
  unDmPrincipal, Printers, unConcBanc, General, unRptAfiliaciones, unPrincipal, CustomDlgs, Periodo;

{$R *.DFM}

procedure TfrmLibroAfiliaciones.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El período no puede quedar en blanco.');
  PrepararCLI_LIBROS(NroListado, edPERIODO.Periodo.Valor);

  with TfrmRptLibroAfiliaciones.Create(Self) do
  try
    sPediodoRPT := GetPeriodo();
    sNombreQRP  := 'LibroAfiliaciones';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar(iIndex = -1, btnAceptar, 'No se encontro la impresora PDF.');
    rptLibroAfiliaciones.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    sdqReporte.ParamByName('PERIODO').AsString := edPERIODO.Periodo.Valor;
    OpenQuery(sdqReporte);
    if sdqReporte.IsEmpty then
      InfoHint(btnAceptar, 'No se encontraron datos para la selección actual.')
    else
      rptLibroAfiliaciones.Print;
  finally
    Free;
    FinalizarEspera;
  end;
end;

procedure TfrmLibroAfiliaciones.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmLibroAfiliaciones.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.
