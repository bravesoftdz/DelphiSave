unit unRegDenunciasSini;

{-------------------------------------------------------------------------------
   Registro de Denuncias de Siniestro.
   Parámetros: Período
   Nro. de Libro = 6
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  ComCtrls, PeriodoPicker;

type
  TfrmRegDenunciasSini = class(TForm)
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
  NroListado = 6;

implementation

uses
  unDmPrincipal, Printers, unConcBanc, unRptRegDenunciasSini, General, unPrincipal, Periodo, CustomDlgs;

{$R *.DFM}

procedure TfrmRegDenunciasSini.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El periodo no puede quedar en blanco.');
  PrepararCLI_LIBROS(NroListado, edPERIODO.Periodo.Valor);

  rptRegDenunciasSini := TrptRegDenunciasSini.Create(Self);
  try
    sPediodoRPT := rptRegDenunciasSini.GetPeriodo;
    sNombreQRP  := 'DenunciaSiniestro';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar(iIndex = -1, btnAceptar, 'No se encontro la impresora PDF.');

    rptRegDenunciasSini.PrinterSettings.PrinterIndex := iIndex;

    rptRegDenunciasSini.sdqReporte.ParamByName('Periodo').AsString := edPERIODO.Periodo.Valor;

    IniciarEspera;
    rptRegDenunciasSini.sdqReporte.Open;
    FinalizarEspera;

    if rptRegDenunciasSini.sdqReporte.IsEmpty then
      InfoHint(btnAceptar, 'No se encontraron datos para la selección actual.')
    else
      rptRegDenunciasSini.Print;
  finally
    rptRegDenunciasSini.Free;
  end;
end;

procedure TfrmRegDenunciasSini.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmRegDenunciasSini.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.
