unit unRptParteEvolutivo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtQReports;

type
  TrptParteEvolutivo = class(TQuickRep)
    sdqDatos: TSDQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText53: TQRDBText;
    QRShape19: TQRShape;
    QRLabel47: TQRLabel;
    QRShape20: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText24: TQRDBText;
    QRShape4: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText29: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    QRShape8: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText62: TQRDBText;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel41: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText51: TQRDBText;
    qrdbA1: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
  private
  public
  end;

{ Crea e imprime el reporte TrptParteEvolutivo }
procedure ImprimirParteEvolutivo(IdTransaccion: Integer);

implementation

uses unDmPrincipal;

{$R *.DFM}

procedure ImprimirParteEvolutivo(IdTransaccion: Integer);
begin
  with TrptParteEvolutivo.Create(Application) do
    try
      sdqDatos.ParamByName('pTransaccion').AsInteger := IdTransaccion;
      OpenQuery(sdqDatos);
      Print;
    finally
      Free;
    end;
end;

end.
