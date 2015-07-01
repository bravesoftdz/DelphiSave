unit unRptRGRL;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, ArtQReports,
  DB, SDEngine;

type
  TProcedureParameter = procedure of object;

  TqrRGRL = class(TQuickRep)
    bPrincipal: TQRBand;
    imgLogo: TQRImage;
    lbDireccion: TQRLabel;
    lbCiudad: TQRLabel;
    lbTelefono: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    lbNumeroRecepcion: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    lbFecha: TQRLabel;
    lbRazonSocial: TQRLabel;
    lbCuit: TQRLabel;
    lbCantidadRgrl: TQRLabel;
    sdqDatos: TSDQuery;
  private
    FOrigen: Integer;
  public
    procedure Preparar(const aId: Integer; const aEmail: String);
  end;

var
  qrRGRL: TqrRGRL;

implementation

uses
  unVisualizador, unSesion, CUIT, unDmPrincipal, AnsiSql, General;

{$R *.DFM}

procedure TqrRGRL.Preparar(const aId: Integer; const aEmail: String);
begin
  FOrigen := 1;

  try
    imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  except
    // Si no existe no muestro nada..
  end;

  with sdqDatos do
  begin
    Close;
    ParamByName('id').AsInteger := aId;
    Open;

    lbNumeroRecepcion.Caption := FieldByName('rf_nro_constancia').AsString;
    lbRazonSocial.Caption     := FieldByName('em_nombre').AsString;
    lbCuit.Caption            := PonerGuiones(FieldByName('em_cuit').AsString);
    lbCantidadRgrl.Caption    := FieldByName('rf_cant_anexo').AsString;

    lbFecha.Caption := Format('Buenos Aires, %s %s de %s de %s.', [FormatDateTime('dddd', DBDateTime),
                                                                   FormatDateTime('d', DBDateTime),
                                                                   FormatDateTime('mmmm', DBDateTime),
                                                                   FormatDateTime('yyyy', DBDateTime)]);

    Visualizar(Self, GetValores('Contrato ' + IntToStr(FieldByName('co_contrato').AsInteger), aEmail,
               FieldByName('co_contrato').AsInteger), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
  end;
end;

end.
