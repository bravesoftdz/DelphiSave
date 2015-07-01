unit unRptInfPrestadorReconf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptInfPrestadorReconf = class(TForm)
    qrInformeAPrestador: TQuickRep;
    Footer2: TQRBand;
    TitleBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    empresa: TQRDBText;
    QRImage1: TQRImage;
    qryConsulta: TSDQuery;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    memTexto: TQRMemo;
    QRLabel1: TQRLabel;
    responsable: TQRDBText;
    prestador: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage3: TQRImage;
    QRMemo1: TQRMemo;
    procedure qrInformeAPrestadorBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDLoteRpt: Integer;
    FFechaLimite: String;
  end;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptInfPrestadorReconf.qrInformeAPrestadorBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('le_id').Value := FIDLoteRpt;
  qryConsulta.Open;

  memTexto.Lines.Text := Format(memTexto.Lines.Text,[qryConsulta.FieldByName('fecha_limite').AsString, FIDLoteRpt]);
end;

end.



