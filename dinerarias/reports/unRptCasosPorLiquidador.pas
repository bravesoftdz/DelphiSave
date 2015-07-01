unit unRptCasosPorLiquidador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls, unDMPrincipal,
  Data.DB, SDEngine, unVisualizador;

type
  TfrmRptCasosPorLiquidador = class(TForm)
    qrCasosPorLiq: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    lFecha: TQRLabel;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    sdqCasosPorLiq: TSDQuery;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    procedure Imprimir(iIdTipocaso: integer);
    procedure qrCasosPorLiqBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptCasosPorLiquidador: TfrmRptCasosPorLiquidador;

implementation

{$R *.dfm}

procedure TfrmRptCasosPorLiquidador.Imprimir(iIdTipoCaso: integer);
begin
  sdqCasosPorLiq.Close;
  sdqCasosPorLiq.ParamByName('idtipocaso').AsInteger := iIdTipoCaso;
  sdqCasosPorLiq.Open;

  lFecha.Caption := 'Fecha generación: ' + DateToStr(DBDate);
  Visualizar(qrCasosPorLiq, GetValores(), [oForceShowModal, oAlwaysShowDialog]);

end;

procedure TfrmRptCasosPorLiquidador.qrCasosPorLiqBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqCasosPorLiq.ParamByName('idtipocaso').AsInteger = 1 then
  begin
    QRLabel5.Enabled := False;
    QRDBText4.Enabled := False;
    QRLabel4.Left := QRLabel4.Left + 70;
    QRDBText3.Left := QRDBText3.Left + 70;
  end;

end;

end.
