unit unRptInformeAPrestador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptInformeAPrestador = class(TForm)
    qrInformeAPrestador: TQuickRep;
    Footer1: TQRBand;
    TitleBand1: TQRBand;
    Footer2: TQRBand;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    empresa: TQRDBText;
    qriLogo: TQRImage;
    qryConsulta: TSDQuery;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRImage3: TQRImage;
    QRLabel1: TQRLabel;
    responsable: TQRDBText;
    prestador: TQRDBText;
    QRLabel2: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    memTexto: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    procedure qrInformeAPrestadorBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Footer1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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

procedure TrptInformeAPrestador.qrInformeAPrestadorBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('le_id').Value := FIDLoteRpt;
  qryConsulta.Open;

  memTexto.Lines.Text := Format(memTexto.Lines.Text,[qryConsulta.FieldByName('fecha_limite').AsString, FIDLoteRpt]);
end;

procedure TrptInformeAPrestador.FormCreate(Sender: TObject);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  qriLogo.AutoSize := False;
  qriLogo.Stretch := True;
  qriLogo.Update;
end;

procedure TrptInformeAPrestador.Footer1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  memTexto.Lines.Text := StringReplace(memTexto.Lines.Text, '<LOTE>', IntToStr(FIDLoteRpt), []);
end;

end.



