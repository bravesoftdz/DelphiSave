unit unRegPagosFFEP;

{-------------------------------------------------------------------------------
   Registro de Siniestros Pagados-FFEP.
   Parámetros: Período
   Nro. de Libro = 11
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  ComCtrls, PeriodoPicker;

type
  TfrmRegPagosFFEP = class(TForm)
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
  NroListado = 11;

implementation

uses
  unDmPrincipal, Printers, unConcBanc, unRptPagosFFEP, General, unPrincipal, Periodo, CustomDlgs;

{$R *.DFM}

procedure TfrmRegPagosFFEP.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El periodo no puede quedar en blanco.');
  PrepararCLI_LIBROS(NroListado, edPERIODO.Periodo.Valor);

  rptPagosFFEP := TrptPagosFFEP.Create(Self);
  try
    sPediodoRPT := rptPagosFFEP.GetPeriodo;
    sNombreQRP  := 'SiniestrosPagadosFFEP';

    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar(iIndex = -1, btnAceptar, 'No se encontro la impresora PDF.');

    rptPagosFFEP.PrinterSettings.PrinterIndex := iIndex;

    rptPagosFFEP.sdqReporte.ParamByName('Periodo').AsString := edPERIODO.Periodo.Valor;

    IniciarEspera;
    rptPagosFFEP.sdqReporte.Open;
    FinalizarEspera;

    if rptPagosFFEP.sdqReporte.IsEmpty then
      InfoHint(btnAceptar, 'No se encontraron datos para la selección actual.')
    else
      rptPagosFFEP.Print;
  finally
    rptPagosFFEP.Free;
  end;
end;

procedure TfrmRegPagosFFEP.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmRegPagosFFEP.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.
