unit unRptEstudiosVolante;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Dialogs, ArtQReports, DB,
  SDEngine;

type
  TrptEstudiosVolante = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    qrlTitulo: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    qrbFooter: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRBand2: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel15: TQRLabel;
    sdqEstudios: TSDQuery;
    dsEstudios: TDataSource;
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
  private
  public
  end;

var
  rptEstudiosVolante: TrptEstudiosVolante;

implementation

uses unConsVol;

{$R *.DFM}

procedure TrptEstudiosVolante.QRExpr2Print(sender: TObject; var Value: String);
begin
   Value := FormatFloat('#,#0.00', StrToFloat(Value));
end;

procedure TrptEstudiosVolante.QRExpr1Print(sender: TObject;var Value: String);
begin
   Value := FormatFloat('#,#0.00', StrToFloat(Value));
end;

procedure TrptEstudiosVolante.QRDBText9Print(sender: TObject;var Value: String);
begin
  Value := FormatFloat('#,#0.00', StrToFloat(Value));
end;

procedure TrptEstudiosVolante.QRDBText11Print(sender: TObject;var Value: String);
begin
  Value := FormatFloat('#,#0.00', StrToFloat(Value));
end;

procedure TrptEstudiosVolante.QRExpr3Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,#0.00', StrToFloat(Value));
end;

procedure TrptEstudiosVolante.QRExpr4Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,#0.00', StrToFloat(Value));
end;

end.


