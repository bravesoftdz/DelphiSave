unit unRegCobranzasFFEP;

{-------------------------------------------------------------------------------
   Registro de Cobranzas-FFEP.
   Parámetros: Período
   Nro. de Libro = 10
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  ComCtrls, PeriodoPicker;

type
  TfrmRegCobranzasFFEP = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    lbFechaDesde: TLabel;
    edPERIODO: TPeriodoPicker;
    edDESC_PERIODO: TEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPERIODOExit(Sender: TObject);
  end;

const
  NroListado = 10;

implementation

uses
  unDmPrincipal, Printers, unConcBanc, unRptCobranzasFFEP, General, unPrincipal, Periodo, CustomDlgs;

{$R *.DFM}

procedure TfrmRegCobranzasFFEP.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El periodo no puede quedar en blanco.');
  PrepararCLI_LIBROS(NroListado, edPERIODO.Periodo.Valor);

  rptCobranzasFFEP := TrptCobranzasFFEP.Create(Self);
  try
    sPediodoRPT := rptCobranzasFFEP.GetPeriodo;
    sNombreQRP  := 'CobranzasFFEP';

    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar(iIndex = -1, btnAceptar, 'No se encontro la impresora PDF.');

    rptCobranzasFFEP.PrinterSettings.PrinterIndex := iIndex;

    rptCobranzasFFEP.sdqReporte.ParamByName('Periodo').AsString := edPERIODO.Periodo.Valor;

    IniciarEspera;
    rptCobranzasFFEP.sdqReporte.Open;
    FinalizarEspera;

    if rptCobranzasFFEP.sdqReporte.IsEmpty then
      InfoHint(btnAceptar, 'No se encontraron datos para la selección actual.')
    else
      rptCobranzasFFEP.Print;
  finally
    rptCobranzasFFEP.Free;
  end;
end;

procedure TfrmRegCobranzasFFEP.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmRegCobranzasFFEP.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.
