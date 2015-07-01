unit unRptReciboILT;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unComunes, unClassLiquidacion;

type
  TqrReciboILT = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlProvinciaPie: TQRLabel;
    qrlDireccionART: TQRLabel;
    qrlLugarFecha: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlExpediente: TQRLabel;
    QRLabel4: TQRLabel;
    qrlNumLiqui: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFAccidente: TQRLabel;
    QRLabel6: TQRLabel;
    qrlContrato: TQRLabel;
    qrlCuit: TQRLabel;
    qrlEmpresa: TQRLabel;
    QRLabel7: TQRLabel;
    qrlTrabajador: TQRLabel;
    QRShape1: TQRShape;
    qrlPeriodoLiquidado: TQRLabel;
    qrmTexto: TQRMemo;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    qrlLeyenda: TQRLabel;
    QRLabel9: TQRLabel;
    qrlImpILT: TQRLabel;
    qrlLeyendaRetencion: TQRLabel;
    qrlRetencion: TQRLabel;
    qrlTitAsigFam: TQRLabel;
    qrlAsigFamiliar: TQRLabel;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    qrlTotal: TQRLabel;
    qrlNoContri: TQRLabel;
    qrlDiasLiquidado: TQRLabel;
    qrlAsignacFamiliares: TQRLabel;
    qriLogo: TQRImage;
    qrshTit: TQRShape;
    qrlTit: TQRLabel;
    QRLabel11: TQRLabel;
    qrlCuil: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlDeposito: TQRLabel;
  private

  public
    procedure Preparar(Liquidacion: TILT; CantCopias: Integer; TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs,
  unSesion, unArt, Printers, DateTimeFuncs, Cuit, Numeros;

{$R *.DFM}

procedure TqrReciboILT.Preparar(Liquidacion: TILT; CantCopias: Integer; TipoSalida: TSalidaReport);
var
  bHabilitar, bEsSinGobernacion: Boolean;
  sLeyendaRetencion, sRetencion, sTextoExtra, sConcepto, sCaracter: String;
begin
  with Liquidacion do
  begin
    PrinterSettings.Copies       := CantCopias;
    PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

    bEsSinGobernacion := Expediente.IsSiniestroGobernacion;
    if bEsSinGobernacion then
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
      qrlProvinciaPie.Caption := ART_NOMBRE_GOB_L;
      sCaracter := ' en su carácter de Administradora del Autoseguro del Gobierno de la Provincia de Buenos Aires,';
    end
    else begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
      qrlProvinciaPie.Caption := ART_NOMBRE2;
      sCaracter := '';
    end;

    qrlDireccionART.Caption := TXT_EMP_DOMICILIO2 + ' ' + TXT_EMP_TELEFONO;

    if Tipo = 'D' then
      sConcepto := 'pago de las prestaciones abonadas por Incapacidad Laboral Temporaria'
    else
      sConcepto := 'reintegro de las prestaciones abonadas por Incapacidad Laboral Temporaria al accidentado de referencia';

    qrlLugarFecha.Caption := 'Buenos Aires, ' + Get_FechaFormatoLargo(FechaEmision);
    qrlExpediente.Caption := Expediente.SiniestroCompleto;
    qrlNumLiqui.Caption   := LPad(IntToStr(NroLiquidacion), '0', 3);
    qrlFAccidente.Caption := DateToStr(Expediente.FechaAccidente);
    qrlContrato.Caption   := '(' + IntToStr(Expediente.ContratoVigente) + ')';
    qrlCuit.Caption       := PonerGuiones(Expediente.Empresa.CUIT);
    qrlEmpresa.Caption    := Expediente.Empresa.RazonSocial;
    qrlTrabajador.Caption := Expediente.Trabajador.Nombre;
    qrlCuil.Caption       := PonerGuiones(Expediente.Trabajador.Cuil);

    qrlPeriodoLiquidado.Caption := Iif(Dias = 0, '', DateToStr(Desde) + ' al ' + DateToStr(Hasta));
    qrlDiasLiquidado.Caption    := Iif(Dias = 0, '', '(' + FloatToStr(Dias) + ' días)');

    qrmTexto.Lines.Text := 'Recibí de PROVINCIA ART,' + sCaracter + ' en concepto de ' + sConcepto +
                           ' en los términos de los artículos 12 y 13 de la ley 24.557, a consecuencia del infortunio ocurrido el ' + DateToStr(Expediente.FechaAccidente) + ', ' +
                           'la suma de $' + Get_AjusteDecimales(FloatToStr(TotalAPagar)) + ' (pesos ' + NumLetras(Abs(TotalAPagar), 2, True) + ').';

    if (Tipo <> 'D') and (Contribuciones <> 0) then
      sTextoExtra := CRLF + CRLF + 'Declaro que efectúo las retenciones de aportes y el depósito conjuntamente con las contribuciones patronales en tiempo y forma.'
    else
      sTextoExtra := '';
    qrmTexto.Lines.Text := qrmTexto.Lines.Text + sTextoExtra;

    qrlImpILT.Caption := Get_AjusteDecimales(FloatToStr(ImporteLiquidado), '$');

    if Tipo <> 'D' then
    begin
      sRetencion        := Get_AjusteDecimales(FloatToStr(Contribuciones), '$');
      sLeyendaRetencion := 'Contribuciones Patronales';
    end
    else begin
      sRetencion        := Get_AjusteDecimales(FloatToStr(-Aportes), '$');
      sLeyendaRetencion := 'Retenciones';
    end;
    qrlRetencion.Caption        := sRetencion;
    qrlLeyendaRetencion.Caption := sLeyendaRetencion;

    qrlDeposito.Caption     := IIF(MetodoPago = 'DC', 'El importe de la liquidación ha sido depositado en ' + EnvioFondos, '');
    qrlAsigFamiliar.Caption := Iif(SalarioFamiliar <> 0, Get_AjusteDecimales(FloatToStr(SalarioFamiliar), '$'), '');
    qrlTitAsigFam.Caption   := Iif(SalarioFamiliar <> 0, 'Asignaciones Familiares', '');
    qrlTotal.Caption        := Get_AjusteDecimales(FloatToStr(TotalAPagar), '$');

    if (Tipo <> 'D') and (Contribuciones = 0) then
    begin
      qrlNoContri.Caption := 'Las contribuciones patronales se reintegrarán una vez que nos sean enviadas las fotocopias de los pagos y los porcentajes correspondientes a este trabajador.';
      bHabilitar          := True;
    end
    else begin
      qrlNoContri.Caption := '';
      bHabilitar          := False;
    end;

    qrlNoContri.Enabled          := bHabilitar;
    qrlAsignacFamiliares.Enabled := not bHabilitar;

    if (Tipo <> 'D') and (Diferencia >= 10) then
      qrlLeyenda.Caption := 'Asimismo les informamos que de la liquidación practicada surge una diferencia de $' + Get_AjusteDecimales(FloatToStr(Diferencia)) + ' a favor del accidentado, la cual deberán liquidar aplicándole las retenciones de Ley y enviarnos copia de la misma para su reintegro.'
    else
      qrlLeyenda.Caption := '';

    if (Tipo = 'D') and (SalarioFamiliar > 0) then
       qrlAsignacFamiliares.Caption := 'Sr. Trabajador: la presente liquidación incluye asignaciones familiares. En caso que Ud. se encuentre realizando tareas bajo relación de dependencia deberá denunciarlo en forma inmediata a esta Aseguradora a efectos de cesar ' +
                                       'el pago de tales asignaciones familiares, las cuales son a cargo exclusivo de su empleador y será, abonadas a través del mismo. La omisión de denuncia dará lugar a acciones legales en su contra.'
     else
       qrlAsignacFamiliares.Caption := '';

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

