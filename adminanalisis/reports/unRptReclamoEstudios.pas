unit unRptReclamoEstudios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptReclamoEstudios = class(TForm)
    qrReclamoEstudios: TQuickRep;
    TitleBand1: TQRBand;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    responsable: TQRDBText;
    prestador: TQRDBText;
    QRLabel2: TQRLabel;
    memTexto: TQRMemo;
    QRBand2: TQRBand;
    QRImage1: TQRImage;
    qryConsulta: TSDQuery;
    QRLabel4: TQRLabel;
    QRImage3: TQRImage;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    procedure qrReclamoEstudiosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDLoteRpt: Integer;
    FIDEmpresaRpt: Integer;
    FIDEstableciRpt: Integer;
  end;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptReclamoEstudios.qrReclamoEstudiosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('pidlote').Value     := FIDLoteRpt;
  qryConsulta.ParamByName('pidempresa').Value  := FIDEmpresaRpt;
  qryConsulta.ParamByName('pidestableci').Value:= FIDEstableciRpt;

  qryConsulta.Open;

  memTexto.Lines.Text := Format(memTexto.Lines.Text, [qryConsulta.FieldByName('referencia').AsString, FIDLoteRpt]);
end;

end.



