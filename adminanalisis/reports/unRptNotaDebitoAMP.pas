unit unRptNotaDebitoAMP;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,
  unArt;

type
  TrptNotaDebito = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    sdqConsulta: TSDQuery;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrbDetail: TQRBand;
    qrbPgFooter: TQRBand;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand3: TQRBand;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel21: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    procedure QRExpr1Print(sender: TObject; var Value: String);
  private
    FFacturaID: TTableID;
    procedure SetFacturaID(const Value: TTableID);
  public
    property FacturaID: TTableID read FFacturaID write SetFacturaID;
  end;

implementation

uses unDmPrincipal;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.QRExpr1Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat( '#,##.00', StrToFloat( Value ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.SetFacturaID(const Value: TTableID);
begin
  if FFacturaID <> Value then
  begin
    FFacturaID := Value;
    sdqConsulta.Close;
    sdqConsulta.ParamByName('FM_FACTURAID').AsInteger := Value;
    OpenQuery(sdqConsulta);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
