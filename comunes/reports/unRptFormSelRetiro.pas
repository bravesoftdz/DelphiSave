unit unRptFormSelRetiro;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TrptFormSelRetiro = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel55: TQRLabel;
    qrlAseguradora: TQRLabel;
    QRShape6: TQRShape;
    QRLabel57: TQRLabel;
    QRShape7: TQRShape;
    QRLabel58: TQRLabel;
    QRShape8: TQRShape;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlApellido: TQRLabel;
    qrlDNI: TQRLabel;
    qrlDomicilio: TQRLabel;
  private

  public
    procedure Preparar(iIdExpediente: Integer);
  end;

var
  rptFormSelRetiro: TrptFormSelRetiro;

implementation

uses unComunes, unVisualizador, unDmPrincipal;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TrptFormSelRetiro.Preparar(iIdExpediente: Integer);
var
  sSql: String;
begin
  if Is_SiniestroDeGobernacion(iIdExpediente) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART');

  sSql := 'SELECT tj_nombre, tj_documento, ' +
                ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) dom ' +
           ' FROM sex_expedientes, ctj_trabajador ' +
          ' WHERE tj_id = ex_idtrabajador ' +
            ' AND ex_id = :idexped';
  with GetQueryEx(sSql, [iIdExpediente]) do
  try
    qrlApellido.Caption   := FieldByName('tj_nombre').AsString;
    qrlDNI.Caption        := FieldByName('tj_documento').AsString;
    qrlDomicilio.Caption  := FieldByName('dom').AsString;
  finally
    Free;
  end;

  try
    Visualizar(Self, GetValores('', ''), [oMailNotAllowed, oForceShowModal, oAlwaysShowDialog]);
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
end.
