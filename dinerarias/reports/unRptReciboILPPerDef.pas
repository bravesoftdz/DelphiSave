unit unRptReciboILPPerDef;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unComunes, unClassLiquidacion;

type
  TqrReciboILPPerDef = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlLugarFecha: TQRLabel;
    QRLabel2: TQRLabel;
    qrlExpediente: TQRLabel;
    QRLabel4: TQRLabel;
    qrlNumLiqui: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFAccidente: TQRLabel;
    qrlTrabajador: TQRLabel;
    qrlCapital: TQRLabel;
    qrmTexto: TQRMemo;
    qrlDetalleCapital: TQRLabel;
    qrlImpILP: TQRLabel;
    qrlTotal: TQRLabel;
    qriLogo: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlCUIL: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCUIT: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    qrshImpuesto: TQRShape;
    qrlImpuesto: TQRLabel;
    qrlRECPD: TQRLabel;
    qrshRECPD: TQRShape;
    qrlCodigoBarras: TQRLabel;
    qrlNroExpediente: TQRLabel;
    qrlMontoCompDanos: TQRLabel;
    QRShape1: TQRShape;
    qrlPagoAdic: TQRLabel;
    qrlDetallePagoAdic: TQRLabel;
    qrlCompDanos: TQRLabel;
    qrlDetalleCompDanos: TQRLabel;
    QRLabel17: TQRLabel;
    qrlMontoPagoAdic: TQRLabel;
    qrmConformidad: TQRMemo;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    qrlOtrosPagos: TQRLabel;
    qrlDetalleOtrosPagos: TQRLabel;
    qrlMontoOtrosPagos: TQRLabel;
  private

  public
    procedure Preparar(Liquidacion: TILP; CantCopias: Integer; TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs,
  unSesion, unArt, Printers, DateTimeFuncs, Cuit, Numeros, Periodo;

{$R *.DFM}

procedure TqrReciboILPPerDef.Preparar(Liquidacion: TILP; CantCopias: Integer; TipoSalida: TSalidaReport);
var
  bEsSinGobernacion: Boolean;
  sGradoCaracter, sConcepto, sNroExpediente, sMonto: String;
begin
  with Liquidacion do
  begin
    PrinterSettings.Copies       := CantCopias;
    PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

    bEsSinGobernacion := Expediente.IsSiniestroGobernacion;
    if bEsSinGobernacion then
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
    else
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');

    sGradoCaracter := Grado + Caracter;

    qrlLugarFecha.Caption := 'Buenos Aires, ' + Get_FechaFormatoLargo(FechaEmision);
    qrlExpediente.Caption := Expediente.SiniestroCompleto;
    qrlNumLiqui.Caption   := LPad(IntToStr(NroLiquidacion), '0', 3);
    qrlFAccidente.Caption := DateToStr(Expediente.FechaAccidente);
    qrlTrabajador.Caption := Expediente.Trabajador.Nombre;
    qrlEmpresa.Caption    := Expediente.Empresa.RazonSocial;
    qrlCUIT.Caption       := PonerGuiones(Expediente.Empresa.CUIT);
    qrlCUIL.Caption       := PonerGuiones(Expediente.Trabajador.CUIL);
    qrlImpILP.Caption     := Get_AjusteDecimales(FloatToStr(ImporteLiquidado), '$');

    sConcepto := 'INCAPACIDAD PERMANENTE %s DE CARÁCTER DEFINITIVO';
    sMonto := Get_AjusteDecimales(FloatToStr(TotalAPagar), '$') + ' (PESOS ' + NumLetras(Abs(TotalAPagar), 2, True) + ')';
    qrmConformidad.Lines.Text := Format(qrmConformidad.Lines.Text, [DateToStr(Expediente.FechaAccidente)]);

    if sGradoCaracter = 'PD' then
    begin
      sConcepto   := Format(sConcepto, ['PARCIAL']);
      qrlDetalleCapital.Caption := Format(qrlDetalleCapital.Caption, ['14']);
      qrlDetallePagoAdic.Caption := Format(qrlDetallePagoAdic.Caption, ['A']);

    end
    else if (sGradoCaracter = 'TD') then   //or (sGradoCaracter = 'GD') then
    begin
      sConcepto   := Format(sConcepto, ['TOTAL']);
      qrlDetalleCapital.Caption := Format(qrlDetalleCapital.Caption, ['15']);
      qrlDetallePagoAdic.Caption := Format(qrlDetallePagoAdic.Caption, ['B']);
    end;

    sConcepto := sConcepto + ' (' + Get_AjusteDecimales(FloatToStr(Incapacidad)) + '%)';

    qrmTexto.Lines.Text := 'Recibí de Provincia A.R.T., en carácter de beneficiario de la indemnización por %s, ' +
                           'prevista en los apartados 2° y 3° de la Ley 26773, la suma de %s que comprende los conceptos que a continuación se detallan: ';

    qrmTexto.Lines.Text := Format(qrmTexto.Lines.Text, [sConcepto, sMonto]);

    if MontoPagoAdic <> 0 then
    begin
      qrlPagoAdic.Enabled := True;
      qrlDetallePagoAdic.Enabled := True;
      qrlMontoPagoAdic.Enabled := True;
      qrlMontoPagoAdic.Caption := Get_AjusteDecimales(FloatToStr(MontoPagoAdic), '$');
    end;

    if MontoCompDanos <> 0 then
    begin
      qrlCompDanos.Enabled := True;
      qrlDetalleCompDanos.Enabled := True;
      qrlMontoCompDanos.Enabled := True;
      qrlMontoCompDanos.Caption := Get_AjusteDecimales(FloatToStr(MontoCompDanos), '$');
    end;

    if MontoOtrosPagos <> 0 then
    begin
      qrlOtrosPagos.Enabled := True;
      qrlDetalleOtrosPagos.Enabled := True;
      qrlDetalleOtrosPagos.Caption := ValorSqlEx('SELECT cp_descripcioncompleta FROM scp_conpago WHERE cp_conpago = :conpago', [ConceptoOtrosPagos]);
      qrlMontoOtrosPagos.Enabled := True;
      qrlMontoOtrosPagos.Caption := Get_AjusteDecimales(FloatToStr(MontoOtrosPagos), '$');
    end;

    qrlTotal.Caption := Get_AjusteDecimales(FloatToStr(TotalAPagar - MontoCompensado), '$');

    qrlImpuesto.Enabled  := AreIn(sGradoCaracter, ['GD', 'PD', 'TD']);
    //qrshImpuesto.Enabled := AreIn(sGradoCaracter, ['GD', 'PD', 'TD']);

    sNroExpediente := lpad(Expediente.Siniestro, '0', 8) + lpad(Expediente.Orden, '0', 2) +
                      lpad(Expediente.Recaida, '0', 2) + lpad(NroLiquidacion, '0', 3);
    qrlNroExpediente.Caption := sNroExpediente;
    qrlCodigoBarras.Caption := '*' + sNroExpediente + '*';

    try
      case TipoSalida of
        srPreview: Visualizar(Self, GetValores('', ''), [oForceShowModal, oMailNotAllowed]);
        srPrint:   Print;
      end;
    except
      Free;
    end
  end;
end;

end.

