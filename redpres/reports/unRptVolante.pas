unit unRptVolante;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, General,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptVolante = class(TQuickRep)
    sdqConsulta: TSDQuery;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    qrdbNroVolante: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    qrdbMonto: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel17: TQRLabel;
    qrlUsuario: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    qrdbTipoComprobante: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel20: TQRLabel;
    qrlUsuCarga: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText16: TQRDBText;
    qrlLetraVolante: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText19: TQRDBText;
    qrlPrestReferente: TQRLabel;
    procedure qrdbMontoPrint(sender: TObject; var Value: String);
    procedure qrlUsuarioPrint(sender: TObject; var Value: String);
    procedure qrlUsuCargaPrint(sender: TObject; var Value: String);
    procedure rint(sender: TObject; var Value: String);
    procedure qrlPrestReferentePrint(sender: TObject; var Value: String);
  private
    FEsTemporal :Boolean;
  public
    property  EsTemporal   : Boolean    read FEsTemporal    write FEsTemporal   default False;
  end;

var
  rptVolante: TrptVolante;

implementation

uses unDmPrincipal, unSesion;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TrptVolante.qrdbMontoPrint(sender: TObject; var Value: String);
begin
  try
    Value := FormatFloat( '#,##.00', StrToFloat(Value));
  except
    Value := '#Error#';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TrptVolante.qrlUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;
{-------------------------------------------------------------------------------}
procedure TrptVolante.qrlUsuCargaPrint(sender: TObject; var Value: String);
begin
  try
    Value := ValorSql('SELECT se_nombre FROM use_usuarios ' +
                      ' WHERE se_usuario = ''' + sdqConsulta.FieldByName('VO_USUALTA').AsString + '''');
  except
    Value := '#Error#';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TrptVolante.rint(sender: TObject; var Value: String);
var
  sEstado, sEstadoPend: String;
begin
  sEstado     := sdqConsulta.FieldByName('VO_ESTADO').AsString;
  sEstadoPend := sdqConsulta.FieldByName('VO_ESTADOPEND').AsString;

  if FEsTemporal then
    Value := 'T'
  else if (sEstado = 'P') and (sEstadoPend = 'PO') then   // TK 21282
    Value := 'O'
  else if sEstado = 'PA' then
    Value := 'A'
  else if AreIn(sEstado, ['PM', 'AAM', 'LAM', 'EAM', 'D16']) then  // por TK 63507 agrego el 'D16' (que es de AMP)
    Value := 'M'
  else
    Value := 'L';
end;
{-------------------------------------------------------------------------------}
procedure TrptVolante.qrlPrestReferentePrint(sender: TObject;
  var Value: String);
begin
  if sdqConsulta.FieldByName('ca_esreferente').AsString = 'S' then
    Value := 'C'
  else
    Value := '';
    
end;

end.
