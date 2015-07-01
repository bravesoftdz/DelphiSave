unit unRegDenunciasSiniFFEP;

{-------------------------------------------------------------------------------
   Registro de Denuncias de Siniestro-FFEP.
   Parámetros: Período
   Nro. de Libro = 6
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  ComCtrls, PeriodoPicker;

type
  TfrmRegDenunciasSiniFFEP = class(TForm)
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
  NroListado = 9;

implementation

uses
  unDmPrincipal, Printers, unConcBanc, unRptDenunciasFFEP, General, unPrincipal, Periodo, CustomDlgs;

{$R *.DFM}

procedure TfrmRegDenunciasSiniFFEP.btnAceptarClick(Sender: TObject);
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El periodo no puede quedar en blanco.');
  PrepararCLI_LIBROS(NroListado, edPERIODO.Periodo.Valor);

  frmRptDenunciasFFEP := TfrmRptDenunciasFFEP.Create(Self);
  try
    sPediodoRPT := frmRptDenunciasFFEP.GetPeriodo;
    sNombreQRP  := 'DenunciaSiniestroFFEP';

    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar(iIndex = -1, btnAceptar, 'No se encontro la impresora PDF.');

    frmRptDenunciasFFEP.rptDenunciasFFEP.PrinterSettings.PrinterIndex := iIndex;

    frmRptDenunciasFFEP.sdqReporte.ParamByName('Periodo').AsString := edPERIODO.Periodo.Valor;

    IniciarEspera;
    frmrptDenunciasFFEP.sdqReporte.Open;
    FinalizarEspera;

    if frmRptDenunciasFFEP.sdqReporte.IsEmpty then
      InfoHint(btnAceptar, 'No se encontraron datos para la selección actual.')
    else
      frmRptDenunciasFFEP.rptDenunciasFFEP.Print;
  finally
    frmRptDenunciasFFEP.Free;
  end;
end;

procedure TfrmRegDenunciasSiniFFEP.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmRegDenunciasSiniFFEP.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

end.
