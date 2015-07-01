unit unOpcionesImpresion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, PatternEdit, IntEdit, unComunes, Printers;

type
  TfrmOpcionesImpresion = class(TForm)
    rbPreview: TRadioButton;
    rbImprimir: TRadioButton;
    Label7: TLabel;
    edCantCopias: TIntEdit;
    Label8: TLabel;
    cmbImpresoras: TComboBox;
    Bevel2: TBevel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    procedure FormCreate(Sender: TObject);
  private
    procedure CargarImpresoras;
    function GetCopias: integer;
    function GetPrinterIndex: integer;
    function GetSalidaReporte: TSalidaReport;
  public
    property Copias: integer read GetCopias;
    property PrinterIndex: integer read GetPrinterIndex;
    property SalidaReporte: TSalidaReport read GetSalidaReporte;
  end;

var
  frmOpcionesImpresion: TfrmOpcionesImpresion;

implementation

{$R *.dfm}

{ TfmrOpcionesImpresion }

procedure TfrmOpcionesImpresion.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign(Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

function TfrmOpcionesImpresion.GetCopias: integer;
begin
  result := edCantCopias.Value;
end;

function TfrmOpcionesImpresion.GetPrinterIndex: integer;
begin
  result := cmbImpresoras.ItemIndex;
end;

function TfrmOpcionesImpresion.GetSalidaReporte: TSalidaReport;
begin
  if rbPreview.Checked then
    result := srPreview
  else
    result := srPrint;
end;

procedure TfrmOpcionesImpresion.FormCreate(Sender: TObject);
begin
  CargarImpresoras;
end;

end.
