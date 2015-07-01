unit unRptNotifAusentesPrest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage, Vcl.Imaging.jpeg;

type
  TrptNotifAusentesPrest = class(TForm)
    qrAusentes: TQuickRep;
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
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    procedure qrAusentesBeforePrint(Sender: TCustomQuickRep;
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

procedure TrptNotifAusentesPrest.qrAusentesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  strEmpresa: String;
  srtEstab: String;
  dFechaAMP2 : TDate;
begin
  qryConsulta.ParamByName('pidlote').Value     := FIDLoteRpt;
  qryConsulta.ParamByName('pidempresa').Value  := FIDEmpresaRpt;
  qryConsulta.ParamByName('pidestableci').Value:= FIDEstableciRpt;

  qryConsulta.Open;
  QRImage1.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
//  QRImage1.AutoSize := False;
//  QRImage1.Stretch := True;
  //QRImage1.Update;

  dfechaamp2 := ValorSqlDateTime(' SELECT CASE WHEN ((art.actualdate - le_fechanotificacion) >= 70) '+
                                 '   THEN art.actualdate + 20 ELSE (le_fechanotificacion + 90) END fechalimite ' +
                                 '   FROM hys.hle_loteestudio '+
                                 '  WHERE le_fechabaja IS NULL '+
                                 '    AND le_id = '+SqlValue(FIDLoteRpt));
  strEmpresa := ValorSqlEx('SELECT EM_CUIT || '' - '' || EM_NOMBRE FROM AFI.AEM_EMPRESA WHERE EM_ID = :id', [FIDEmpresaRpt]);
  srtEstab := ValorSqlEx('SELECT TO_CHAR(ES_NROESTABLECI) || '' - '' || ES_NOMBRE  FROM AFI.AES_ESTABLECIMIENTO WHERE ES_ID = :id', [FIDEstableciRpt]);

  memTexto.Lines.Text := Format(memTexto.Lines.Text, [FIDLoteRpt, strEmpresa, srtEstab, DateToStr(dfechaamp2)]);
end;

end.



