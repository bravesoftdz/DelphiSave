unit unRptInformeMovilSanitario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptInformeMovilSanitario = class(TForm)
    qrInformeAEmpresa: TQuickRep;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRImage1: TQRImage;
    qryConsulta: TSDQuery;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage2: TQRImage;
    QRBand1: TQRBand;
    QRImage3: TQRImage;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    empresa: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    memTexto: TQRMemo;
    procedure qrInformeAEmpresaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDLoteRpt: Integer;
    FIDEmpresa: Integer;
    FFechaLimite: String;
  end;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptInformeMovilSanitario.qrInformeAEmpresaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('le_id').Value := FIDLoteRpt;
  qryConsulta.ParamByName('em_id').Value := FIDEmpresa;
  qryConsulta.Open;
  memTexto.Lines.Text := Format(memTexto.Lines.Text,[qryConsulta.FieldByName('prestador').AsString,
                                                     qryConsulta.FieldByName('telefono').AsString,
                                                     FFechaLimite]);
end;

end.



