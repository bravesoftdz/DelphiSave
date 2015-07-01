unit unRptNotasBanco_Comprobante;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine, unArt;

type
  TRptNotasBanco_Comprobante = class(TQuickRep)
    sdqDatos: TSDQuery;
    TitleBand1: TQRBand;
    qrlFecha: TQRLabel;
    QRLabel1: TQRLabel;
    qrlBanco: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCtaCte: TQRLabel;
    qrTexto: TQRMemo;
    qrTexto2: TQRMemo;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    qrdbFExtracto: TQRDBText;
    qrdbDescripcion: TQRDBText;
    qrdbImporte: TQRDBText;
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
  public
  end;

  procedure DoImprimirNotasBanco_Comprobante(IdExtractoBco: TTableId);

var
  RptNotasBanco_Comprobante: TRptNotasBanco_Comprobante;

implementation

uses
  unVisualizador, Periodo, unDmPrincipal, StrFuncs;

{$R *.DFM}

procedure DoImprimirNotasBanco_Comprobante(IdExtractoBco: TTableId);
var
  rpt: TRptNotasBanco_Comprobante;
  sCad: String;
begin
  rpt := TRptNotasBanco_Comprobante.Create( nil );

  with rpt do
    try
      sdqDatos.ParamByName( 'IdExtractoBanco' ).AsInteger := IdExtractoBco;
      OpenQuery( sdqDatos );

      qrlFecha.Caption  := 'Buenos Aires, ' + sdqDatos.FieldByName('FECHAACTUAL').AsString;

      qrlBanco.Caption  := sdqDatos.FieldByName('BANCO').AsString;
      qrlCtaCte.Caption := 'Ref.: Cta. Cte. ' + sdqDatos.FieldByName('CB_NUMERO').AsString;

      sCad := 'De nuestra consideración:' + CRLF + CRLF +
             Replicate(20) + 'Por la presente nos dirigimos a Ustedes a los efectos de solicitarles nos informen el concepto ' +
                             'y tengan a bien entregarnos el comprobante del siguiente movimiento en extracto, producido en nuestra ' +
                             'cta. cte. según el siguiente detalle:';

      qrTexto.Lines.Text := sCad;

      sCad := 'Adjuntamos con la presente la copia del movimiento en extracto.' + CRLF + CRLF +
              'Asimismo autorizamos a ustedes a debitar de nuestra cuenta las comisiones correspondientes.' + CRLF + CRLF + CRLF +
              'Agradeciendo su atención, quedamos al aguardo de vuestra respuesta.';

      qrTexto2.Lines.Text := sCad;

      Visualizar( rpt, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal] );
    finally
      free;
    end;
end;

procedure TRptNotasBanco_Comprobante.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  if sdqDatos.FieldByName('EB_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqDatos.FieldByName('EB_IMPORTE')).Currency := True;
end;

end.
