unit unRptBonificacionesCuota;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrBonificacionesCuota = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qriLogo: TQRImage;
    sdqDatos: TSDQuery;
    qrlTitulo: TQRLabel;
    qrlDocumento: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qrdbContr: TQRDBText;
    qrdbCuit: TQRDBText;
    qrdbDen: TQRDBText;
    qrdbEst: TQRDBText;
    qrdbCuotaEmit: TQRDBText;
    qrdbBonifAct: TQRDBText;
    qrdbCuotaProm: TQRDBText;
    qrdbPorcBonif: TQRDBText;
    qrdbAutoriza: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    SummaryBand1: TQRBand;
    qrmNotas: TQRMemo;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel9: TQRLabel;
    qrdbBonif: TQRDBText;
    qreCuotaEmit: TQRExpr;
    qreBonifAct: TQRExpr;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    PageFooterBand1: TQRBand;
    qrNroPagina: TQRExpr;
    QRShape18: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape22: TQRShape;
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure FormatMontoPorc(Sender: TObject; var Value: String);
    procedure qrNroPaginaPrint(sender: TObject; var Value: String);
  private
  public
  end;

  procedure Do_ImprimirBonificacionesCuota(FechaDesde, FechaHasta: TDateTime; Acumulado: Extended);

var
  qrBonificacionesCuota: TqrBonificacionesCuota;

implementation

uses
  unDmPrincipal, unVisualizador, unArt, StrFuncs;

{$R *.DFM}

procedure Do_ImprimirBonificacionesCuota(FechaDesde, FechaHasta: TDateTime; Acumulado: Extended);
var
  rpt: TqrBonificacionesCuota;
begin
  rpt := TqrBonificacionesCuota.Create(nil);
  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
      qrlTitulo.Caption := 'Bonificaciones de Cuota - ' + DateToStr(FechaDesde) + ' al ' + DateToStr(FechaHasta);

      qrmNotas.Lines.Text := 'NOTAS:' + CRLF +
                             '  El Porc. Bonificado se obtiene de aplicar la división entre la Bonificación Acumulada y la Cuota Promedio Anual.' + CRLF +
                             '  Por aplicación del punto c) del ANEXO VII - LIMITES DE BONIFICACION DE CAPITAL, aquellos casos cuyo monto a bonificar supere los $ 30.000.-, ' +
                             'deberán ser elevados al Directorio para su aprobación.';
                             
      with sdqDatos do
        begin
          ParamByName('FDesde').AsDateTime := FechaDesde;
          ParamByName('FHasta').AsDateTime := FechaHasta;
          ParamByName('Acumulado').AsFloat := Acumulado;
        end;

      OpenQuery(sdqDatos);

      Visualizar(rpt, GetValores(), [oForceShowModal]);
    finally
      Free;
    end;
end;

procedure TqrBonificacionesCuota.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TqrBonificacionesCuota.FormatMontoPorc(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%', 0);
end;

procedure TqrBonificacionesCuota.qrNroPaginaPrint(sender: TObject; var Value: String);
begin
  Value := 'Pág.: ' + Value;
end;

end.

