unit unRptReciboRetiraDocum;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TrptReciboRetiraDocum = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogo: TQRImage;
    qrlBeneficiario: TQRLabel;
    qrlSiniestr: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlNombre: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlFAccidente: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRMemo1: TQRMemo;
  private

  public
    procedure Preparar(iIdExped :Integer);
  end;

var
  rptReciboRetiraDocum: TrptReciboRetiraDocum;

implementation

uses unComunes, unVisualizador, unDmPrincipal;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TrptReciboRetiraDocum.Preparar(iIdExped :Integer);
var
  sSql: String;
begin
  if Is_SiniestroDeGobernacion(iIdExped) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART');

  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' tj_nombre, ex_fechaaccidente ' +
           ' FROM art.sex_expedientes, ctj_trabajador ' +
          ' WHERE tj_id = ex_idtrabajador ' +
            ' AND ex_id = :idex ';
  with GetQueryEx(sSql, [iIdExped]) do
  try
    qrlSiniestro.Caption  := FieldByName('siniestro').AsString;
    qrlNombre.Caption     := FieldByName('tj_nombre').AsString;
    qrlFAccidente.Caption := FieldByName('ex_fechaaccidente').AsString;
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
