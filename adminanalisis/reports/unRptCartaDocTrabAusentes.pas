unit unRptCartaDocTrabAusentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptCartaDocTrabAusentes = class(TForm)
    qrCartaDocTrabAusentes: TQuickRep;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRBand1: TQRBand;
    memTexto2: TQRMemo;
    QRGroup1: TQRGroup;
    memTexto1: TQRMemo;
    QRBand2: TQRBand;
    QRImage1: TQRImage;
    qryConsulta: TSDQuery;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    empresa: TQRLabel;
    QRImage3: TQRImage;
    procedure qrCartaDocTrabAusentesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDLoteRpt: Integer;
    FIDEstableciRpt: Integer;
    FPrestador: String;
    FTelPrestador: String;
    FFechaNotif: String;
    FFechaOperativo: String;
end;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptCartaDocTrabAusentes.qrCartaDocTrabAusentesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('pidlote').Value := FIDLoteRpt;
  qryConsulta.ParamByName('pidestableci').Value := FIDEstableciRpt;
  qryConsulta.Open;

  memTexto1.Lines.Text := Format(memTexto1.Lines.Text,
                                 [FPrestador, FTelPrestador, FFechaNotif]);
  memTexto2.Lines.Text := Format(memTexto2.Lines.Text,
                                 [FFechaOperativo]);
end;

end.



