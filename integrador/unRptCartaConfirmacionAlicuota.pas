unit unRptCartaConfirmacionAlicuota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls;

type
  TqrCartaConfirmacionAlicuota = class(TqrMoldeCarta)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlHeader: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    sdqDatosSUMAFIJA: TFloatField;
    sdqDatosPORCMASA: TFloatField;
    sdqDatosTC_VIGENCIATARIFA: TDateTimeField;
    sdqDatosEM_NOMBRE: TStringField;
    sdqDatosCO_CONTRATO: TFloatField;
    sdqDatosDOMICILIO: TStringField;
    sdqDatosLOCALIDAD_CPOSTAL: TStringField;
    sdqDatosPROVINCIA: TStringField;
    qrlUsuario: TQRLabel;
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure qrlUsuarioPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qrCartaConfirmacionAlicuota: TqrCartaConfirmacionAlicuota;

implementation

uses unSesion;

{$R *.dfm}

procedure TqrCartaConfirmacionAlicuota.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qrlHeader.Caption := Format(qrlHeader.Caption, [DataSet.FieldByName('EM_NOMBRE').AsString, DataSet.FieldByName('CO_CONTRATO').AsInteger]);
end;

procedure TqrCartaConfirmacionAlicuota.qrlUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;

end.
