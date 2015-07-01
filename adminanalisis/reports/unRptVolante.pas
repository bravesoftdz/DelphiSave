unit unRptVolante;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,
  unArt;

type
  TrptVolante = class(TQuickRep)
    sdqConsulta: TSDQuery;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    qrdbNroVolante: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText14: TQRDBText;
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
    QRLabel3: TQRLabel;
    procedure qrdbMontoPrint(sender: TObject; var Value: String);
    procedure qrlUsuarioPrint(sender: TObject; var Value: String);
    procedure qrlUsuCargaPrint(sender: TObject; var Value: String);
  private
    function GetFacturaId: TTableId;
    procedure SetFacturaId(const Value: TTableId);
  public
    property FacturaId: TTableId read GetFacturaId write SetFacturaId;
  end;

var
  rptVolante: TrptVolante;

implementation

uses unDmPrincipal, unPrincipal;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
function TrptVolante.GetFacturaId: TTableId;
begin
  Result := sdqConsulta.ParamByName('FM_FACTURAID').AsInteger;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptVolante.qrdbMontoPrint(sender: TObject; var Value: String);
begin
  Try
     Value := FormatFloat( '#,##.00', StrToFloat( Value ) );
  except
     Value := '#Error#';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptVolante.qrlUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := frmPrincipal.DBLogin.Usuario ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptVolante.qrlUsuCargaPrint(sender: TObject; var Value: String);
begin
  Try
     Value := ValorSql('Select se_nombre From Use_usuarios Where se_usuario = ''' + sdqConsulta.FieldByName('FM_USUALTA').AsString + '''');
  except
     Value := '#Error#';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptVolante.SetFacturaId(const Value: TTableId);
begin
  if Value <> GetFacturaId Then
  begin
    sdqConsulta.Close;
    sdqConsulta.ParamByName('FM_FACTURAID').AsInteger := Value;
    OpenQuery(sdqConsulta);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
