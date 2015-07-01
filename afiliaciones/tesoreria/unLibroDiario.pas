unit unLibroDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db, SDEngine, RxLookup, RxGIF,
  ExtCtrls, FormPanel, ComCtrls;

type
  TfrmLibroDiario = class(TForm)
    lbPediodo: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    cmbPeriodo: TRxDBLookupCombo;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmLibroDiario: TfrmLibroDiario;
  iIndex        : Integer;
  sNombreQRP    : String;
  sPediodoRPT   : String;

implementation

uses
  unDmPrincipal, Printers, unConcBanc, unRptLibroDiario, General, Periodo, unDmFinancials, CustomDlgs, unPrincipal;

{$R *.DFM}

procedure TfrmLibroDiario.btnAceptarClick(Sender: TObject);
var
  rptLDiario: TfrmRptLibroDiario;
  sSqlSetLibro: String;
begin
  Verificar(cmbPeriodo.Value = '', cmbPeriodo, 'El período no puede quedar en blanco.');

  sSqlSetLibro := 'ART_CONC.ACT_PERIODO_LIBRO(:Periodo, 3);';
  dmFinancials.EjecutarStoreEx(sSqlSetLibro, [sdqConsulta.FieldByName( 'PERIODO').asString]);

  rptLDiario := TfrmRptLibroDiario.Create(Self);
  try
  //rptLDiario.QRComposite.Preview;
    sPediodoRPT := rptLDiario.GetPeriodo;
    sNombreQRP  := 'LibroDiario';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar(iIndex = -1, btnAceptar, 'No se encontró la impresora PDF.');
    rptLDiario.QRComposite.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    rptLDiario.sdqReporte.ParamByName('PeriodoParam').AsString := cmbPeriodo.Value;
    rptLDiario.sdqReporte.Open;
    if rptLDiario.sdqReporte.IsEmpty  then
      InfoHint(btnAceptar, 'No se encontraron datos para la selección actual.')
    else
    begin
      rptLDiario.sdqPlanCta.Open;
      rptLDiario.QRComposite.Print;

      FinalizarEspera;
    end;
  finally
    rptLDiario.Free;
  end;
end;

procedure TfrmLibroDiario.FormCreate(Sender: TObject);
begin
  sdqConsulta.Open;
end;

end.
