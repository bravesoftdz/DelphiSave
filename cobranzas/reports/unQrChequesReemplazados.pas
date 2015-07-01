unit unQrChequesReemplazados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnRptMoldeCarta, Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unQRLabelEx;

type
  TqrChequesReemplazados = class(TqrMoldeCarta)
    qrbDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrlTitulo: TQRSysData;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrbEncabezados: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel10: TQRLabel;
    qrlContrato: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    procedure QRLabel10Print(sender: TObject; var Value: String);
  end;

  procedure PrepararListado (ID: integer);

var
  qrChequesReemplazados: TqrChequesReemplazados;

implementation

uses unDmPrincipal, unVisualizador;

{$R *.DFM}

procedure PrepararListado(ID: integer);
var
  sSql, sContrato: String;
begin
  qrChequesReemplazados := TqrChequesReemplazados.Create(Application.MainForm);

  with qrChequesReemplazados do
  begin
    sSql := 'SELECT MAX(VA_IDCONTRATO) ' +
              'FROM ZVA_VALOR ' +
             'WHERE VA_ID=:ID';
    sContrato           := ValorSqlEx(sSql, [ID]);
    qrlContrato.Caption := 'Contrato: ' + sContrato;

    sdqDatos.ParamByName('ID').AsInteger := ID;
    OpenQuery(sdqDatos);
    ShowLogoGBP  := False;
    ShowDatosART := False;
  end;

  Visualizar(qrChequesReemplazados, GetValores(), [oForceDB]);
end;

procedure TqrChequesReemplazados.QRLabel10Print(sender: TObject; var Value: String);
begin
  inherited;
  if sdqDatos.FieldByName('TIPO').AsInteger = 1 then
    Value := 'VALORES REEMPLAZADOS'
  else
    Value := 'VALORES REEMPLAZANTES';
end;

end.

