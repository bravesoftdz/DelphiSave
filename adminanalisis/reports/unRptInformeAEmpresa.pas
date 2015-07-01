unit unRptInformeAEmpresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptInformeAEmpresa = class(TForm)
    qrInformeAEmpresa: TQuickRep;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    empresa: TQRDBText;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    qriLogo: TQRImage;
    qryConsulta: TSDQuery;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand1: TQRBand;
    QRImage3: TQRImage;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    memTexto: TQRMemo;
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

procedure TrptInformeAEmpresa.qrInformeAEmpresaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('le_id').Value := FIDLoteRpt;
  qryConsulta.ParamByName('em_id').Value := FIDEmpresa;
  qryConsulta.ParamByName('es_nro').Value := FNroEstableci;
  qryConsulta.Open;
  memTexto.Lines.Text := Format(memTexto.Lines.Text,[qryConsulta.FieldByName('prestador').AsString,
                                                     FFechaLimite,
                                                     qryConsulta.FieldByName('prestador').AsString + ' al ' + qryConsulta.FieldByName('telefono').AsString]);
end;

procedure TrptInformeAEmpresa.FormCreate(Sender: TObject);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  qriLogo.AutoSize := False;
  qriLogo.Stretch := True;
  qriLogo.Update;
end;

end.



