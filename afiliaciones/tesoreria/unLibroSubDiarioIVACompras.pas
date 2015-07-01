unit unLibroSubDiarioIVACompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db, SDEngine, RxLookup, RxGIF,
  ExtCtrls, FormPanel, ComCtrls, PeriodoPicker;

type
  TfrmLibroSubDiarioIVACompras = class(TForm)
    lbPediodo: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edPeriodo: TPeriodoPicker;
    procedure btnAceptarClick(Sender: TObject);
  end;

var
  frmLibroSubDiarioIVACompras: TfrmLibroSubDiarioIVACompras;
  iIndex        : Integer;
  sNombreQRP    : String;
  sPediodoRPT   : String;

implementation

uses
  unDmPrincipal, Printers, unRptSubDiarioIVACompras, General, Periodo, unDmFinancials,
  CustomDlgs, unPrincipal, unConcBanc;

{$R *.DFM}

procedure TfrmLibroSubDiarioIVACompras.btnAceptarClick(Sender: TObject);
var
  rptSubDiarioIVACompras: TrptSubDiarioIVACompras;
  sPediodoRPT, sSqlSetLibro: String;
begin
  sPediodoRPT := edPeriodo.Periodo.Valor;
  Verificar(sPediodoRPT = '', edPeriodo, 'El período no puede quedar en blanco.');

  sSqlSetLibro := 'ART_CONC.ACT_PERIODO_LIBRO(:Periodo, 12);';
  dmFinancials.EjecutarStoreEx(sSqlSetLibro, [sPediodoRPT]);

  rptSubDiarioIVACompras := TrptSubDiarioIVACompras.Create(Self);
  try
    sNombreQRP := 'SubDiarioIVACompras';
    SetNombrePDF(sNombreQRP, DateFormat(FirstDayOfPeriodo(sPediodoRPT),'MMMM yyyy'));
    iIndex := GetPrinterPDF();
    Verificar((iIndex = -1), nil, 'No se encontró la Impresora PDF.');
    rptSubDiarioIVACompras.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    rptSubDiarioIVACompras.sdqReporte.ParamByName('Periodo').AsString := sPediodoRPT;
    rptSubDiarioIVACompras.sdqReporte.Open;
    FinalizarEspera;

    if rptSubDiarioIVACompras.sdqReporte.IsEmpty  then
      MsgBox('No se encontraron datos para la selección actual.')
    else
      rptSubDiarioIVACompras.Print;
  finally
    rptSubDiarioIVACompras.Free;
  end;
end;

end.

