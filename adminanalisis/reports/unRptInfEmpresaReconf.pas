unit unRptInfEmpresaReconf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage, ArtQReports;

type
  TrptInfEmpresaReconf = class(TForm)
    qrInformeAEmpresa: TQuickRep;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    empresa: TQRDBText;
    QRImage1: TQRImage;
    qryConsulta: TSDQuery;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage2: TQRImage;
    QRBand1: TQRBand;
    QRImage3: TQRImage;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRMemo1: TQRMemo;
    memTexto: TQRMemo;
    QRBand3: TQRBand;
    ArtQRDBText3: TArtQRDBText;
    ArtQRDBText4: TArtQRDBText;
    QRGroup2: TQRGroup;
    ArtQRLabel3: TArtQRLabel;
    ArtQRLabel4: TArtQRLabel;
    QRDBText4: TQRDBText;
    procedure qrInformeAEmpresaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDLoteRpt: Integer;
    FIDEmpresa: Integer;
    FNroEstableci: Integer;
    FFechaLimite: String;
  end;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptInfEmpresaReconf.FormCreate(Sender: TObject);
begin
  QRImage1.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  QRImage1.AutoSize := False;
  QRImage1.Stretch := True;
  QRImage1.Update;
end;

procedure TrptInfEmpresaReconf.qrInformeAEmpresaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('le_id').Value := FIDLoteRpt;
  qryConsulta.ParamByName('em_id').Value := FIDEmpresa;
  qryConsulta.ParamByName('es_nro').Value := FNroEstableci;
  qryConsulta.Open;
  memTexto.Lines.Text := Format(memTexto.Lines.Text,[qryConsulta.FieldByName('prestador').AsString,
                                                     qryConsulta.FieldByName('telefono').AsString]);
end;

end.





