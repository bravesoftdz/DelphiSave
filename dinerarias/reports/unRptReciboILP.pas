unit unRptReciboILP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unComunes, unClassLiquidacion;

type
  TqrReciboILP = class(TQuickRep)
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
    QRShape1: TQRShape;
    qrlPeriodoLiquidado: TQRLabel;
    qrmTexto: TQRMemo;
    QRLabel9: TQRLabel;
    qrlImpILP: TQRLabel;
    qrlLeyendaRetencion: TQRLabel;
    qrlRetencion: TQRLabel;
    qrlLeyendaAsignacion: TQRLabel;
    qrlAsigFamiliar: TQRLabel;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    qrlTotal: TQRLabel;
    qrlNoContri: TQRLabel;
    qrlDiasLiquidado: TQRLabel;
    qrlAsignacFamiliares: TQRLabel;
    qrlTituloPlusAmpo: TQRLabel;
    qrlPlusAmpo: TQRLabel;
    qriLogo: TQRImage;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    qrlCUIL: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCUIT: TQRLabel;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    qrlProvinciaPie: TQRLabel;
    qrlDireccionART: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    qrlAnticipo: TQRLabel;
    qrlAnticipo2: TQRLabel;
    qrshAnticipo: TQRShape;
    qrlDeposito: TQRLabel;
    qrshImpuesto: TQRShape;
    qrlImpuesto: TQRLabel;
    qrlRECPD: TQRLabel;
    qrshRECPD: TQRShape;
    qrlLeyendaMontoComp: TQRLabel;
    qrlMontoCompensado: TQRLabel;
    qrlCodigoBarras: TQRLabel;
    qrlNroExpediente: TQRLabel;
    qrlCompensacionDanos: TQRLabel;
    qrlMontoCompDanos: TQRLabel;
    qrlPagoAdic: TQRLabel;
    qrlMontoPagoAdic: TQRLabel;
  private

  public
    procedure Preparar(Liquidacion: TILP; CantCopias: Integer; TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs,
  unSesion, unArt, Printers, DateTimeFuncs, Cuit, Numeros, Periodo;

{$R *.DFM}

procedure TqrReciboILP.Preparar(Liquidacion: TILP; CantCopias: Integer; TipoSalida: TSalidaReport);
var
  bEsSinGobernacion: Boolean;
  sGradoCaracter, sTextoExtra, sConcepto, sCaracter, sNroExpediente: String;
  sHomologado, sConstancia: String;
begin
  with Liquidacion do
  begin
    PrinterSettings.Copies       := CantCopias;
    PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

    bEsSinGobernacion := Expediente.IsSiniestroGobernacion;
    if bEsSinGobernacion then
    begin
      qrlProvinciaPie.Caption := ART_NOMBRE_GOB_L;
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
      sCaracter := ' en su carácter de Administradora del Autoseguro del Gobierno de la Provincia de Buenos Aires,';
    end
    else begin
      qrlProvinciaPie.Caption := ART_NOMBRE2;
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
      sCaracter := '';
    end;

    qrlDireccionART.Caption := TXT_EMP_DOMICILIO2 + ' ' + TXT_EMP_TELEFONO;

    sGradoCaracter := Grado + Caracter;
    if sGradoCaracter = 'PP' then
    begin
      sConcepto   := 'pago mensual por ' + InitCap(GetTitulo);
      sHomologado := '';
    end
    else if sGradoCaracter = 'PD' then
    begin
      if IsPD_Pago_Unico_Porcentaje() then
      begin
        sConcepto   := InitCap(GetTitulo);
        sHomologado := '';
        sConstancia := 'y homologada por la comisión médica interviniente';
      end
      else begin
        sConcepto   := 'pago de anticipo de la renta periódica prevista en el art. 14 pto. 2 inciso b) de la Ley 24.557';
        sHomologado := 'y homologado por las autoridades pertinentes ';
      end;
    end
    else if (sGradoCaracter = 'TP') or (sGradoCaracter = 'GP') then
    begin
      sConcepto   := 'pago mensual por ' + InitCap(GetTitulo);
      sHomologado := 'y homologado por las autoridades pertinentes ';
    end
    else if (sGradoCaracter = 'TD') or (sGradoCaracter = 'GD') then
    begin
      sConcepto   := InitCap(GetTitulo);
      sHomologado := 'y homologado por las autoridades pertinentes ';
    end
    else if sGradoCaracter = 'M ' then
    begin
      if Dias <> 0 then
        sConcepto := 'anticipo de Renta Vitalicia'
      else
        sConcepto := 'capital a integrar, calculado según lo establecido en el art. 8 Res.24.808 de S.S.N.';
    end;

    if Liquidacion.GenerarAnticipo then
    begin
      qrlAnticipo.Caption  := 'ANTICIPO';
      if Expediente.FechaAccidente < StrToDate(FECHA_DECRETO_1694_09) then
        qrlAnticipo2.Caption := 'Le informamos que la presente liquidación será ajustada una vez que se remitan ' +
                                'los recibos de sueldo del año anterior a la fecha de siniestro (periodos: ' +
                                GetPeriodo(Expediente.FechaAccidente - 365) + ' al ' + GetPeriodo(Expediente.FechaAccidente) + ').'
      else
        qrlAnticipo2.Caption := 'Se informa que la presente liquidación fue realizada como anticipo ' +
                                'debiendo remitir los recibos de sueldo del año anterior a la fecha de siniestro (periodos: ' +
                                GetPeriodo(Expediente.FechaAccidente - 365) + ' al ' + GetPeriodo(Expediente.FechaAccidente) +  ') ' +
                                'a los fines de evaluar si corresponde reajustar la misma.';
      qrshAnticipo.Enabled := True;
    end
    else begin
      qrlAnticipo.Caption  := '';
      qrlAnticipo2.Caption := '';
      qrshAnticipo.Enabled := False;
    end;

    qrlTitulo.Caption     := 'RECIBO DE LIQUIDACION DE ' + Ucase(GetTitulo());
    qrlLugarFecha.Caption := 'Buenos Aires, ' + Get_FechaFormatoLargo(FechaEmision);
    qrlExpediente.Caption := Expediente.SiniestroCompleto;
    qrlNumLiqui.Caption   := LPad(IntToStr(NroLiquidacion), '0', 3);
    qrlFAccidente.Caption := DateToStr(Expediente.FechaAccidente);
    qrlTrabajador.Caption := Expediente.Trabajador.Nombre;
    qrlEmpresa.Caption    := Expediente.Empresa.RazonSocial;
    qrlCUIT.Caption       := PonerGuiones(Expediente.Empresa.CUIT);
    qrlCUIL.Caption       := PonerGuiones(Expediente.Trabajador.CUIL);

    qrlPeriodoLiquidado.Caption := Iif(Dias = 0, '', 'PERIODO LIQUIDADO: ' + DateToStr(Desde) + ' al ' + DateToStr(Hasta));
    qrlDiasLiquidado.Caption    := Iif(Dias = 0, '', '(' + MesesTexto + ')');

    qrmTexto.Lines.Text := 'Recibí de PROVINCIA A.R.T.,' + sCaracter + ' en concepto de ' + sConcepto +
                           ' a consecuencia del accidente ocurrido el ' + DateToStr(Expediente.FechaAccidente) + ', ' +
                           'la suma de $' + Get_AjusteDecimales(FloatToStr(TotalAPagar)) + ' (pesos ' + NumLetras(Abs(TotalAPagar), 2, True) + ').';

    if Grado = 'M' then
      sTextoExtra := ''
    else
      sTextoExtra := CRLF + 'Se deja constancia que la incapacidad (' +
                            Get_AjusteDecimales(FloatToStr(Incapacidad), '%', 2, False, False, 'D') +
                            '), fue determinada conforme al BAREMO NACIONAL ' + sHomologado +
                            'de acuerdo al procedimiento previsto en la Ley 24.557' + IIf(sConstancia = '', '', ', ') + sConstancia + '.' +
              CRLF + CRLF + 'Por la presente tomo conocimiento que en caso de existir una resolución posterior emitida ' +
                            'por organismo competente que eleve el porcentaje de incapacidad que motivara el pago efectuado, ' +
                            'la Aseguradora abonará al beneficiario la diferencia de la prestación dineraria correspondiente. ' +
                            'Asimismo, quedo notificada/o que si el grado de incapacidad fijado fuera inferior o se revirtiera ' +
                            'la naturaleza laboral del infortunio me encuentro obligada/o a proceder a la devolución de los importes ' +
                            'respectivos, quedando facultada la Aseguradora, en caso contrario, a reclamar dichas sumas por vía ' +
                            'extrajudicial y/o judicial.';
    qrmTexto.Lines.Text := qrmTexto.Lines.Text + sTextoExtra;

    if (MetodoPago = 'DC') then
      qrlDeposito.Caption         := 'El importe de la presente liquidación ha sido depositado en ' + EnvioFondos
    else if (MetodoPago = 'TR') and (IdBanco = BANCO_PROVINCIA) then
      qrlDeposito.Caption         := 'EL IMPORTE DE LA PRESENTE LIQUIDACION ESTARA DISPONIBLE POR LOS PROXIMOS 60 DIAS ' +
                                     'EN EL ' + EnvioFondos
    else
      qrlDeposito.Caption := '';

    qrlImpILP.Caption             := Get_AjusteDecimales(FloatToStr(ImporteLiquidado), '$');

    qrlMontoCompDanos.Caption := Get_AjusteDecimales(FloatToStr(MontoCompDanos), '$', 2, True);
    qrlCompensacionDanos.Caption  := iif(MontoCompDanos <> 0, 'COMPENSACIÓN POR DAÑOS', '');
    qrlPagoAdic.Caption := iif(MontoPagoAdic <> 0, 'PAGO ADICIONAL', '');
    qrlMontoPagoAdic.Caption := Get_AjusteDecimales(FloatToStr(MontoPagoAdic), '$', 2, True);
    qrlRetencion.Caption          := Iif(Aportes <> 0, Get_AjusteDecimales(FloatToStr(-Aportes), '$'), '');
    qrlLeyendaRetencion.Caption   := Iif(Aportes <> 0, 'RETENCIONES', '');
    qrlAsigFamiliar.Caption       := Iif(SalarioFamiliar <> 0, Get_AjusteDecimales(FloatToStr(SalarioFamiliar), '$'), '');
    qrlLeyendaAsignacion.Caption  := Iif(SalarioFamiliar <> 0, 'ASIGNACIONES FAMILIARES', '');

    qrlMontoCompensado.Caption    := Iif(MontoCompensado <> 0, Get_AjusteDecimales(FloatToStr(MontoCompensado), '$'), '');  // por Plan Registro de Pagos cancelados (arreglo del ImporPeri)
    qrlLeyendaMontoComp.Caption   := Iif(MontoCompensado <> 0, 'MONTO COMPENSADO', '');                                     // por Plan Registro de Pagos cancelados (arreglo del ImporPeri)

    qrlTotal.Caption              := Get_AjusteDecimales(FloatToStr(TotalAPagar - MontoCompensado), '$');                   // por Plan Registro de Pagos cancelados (arreglo del ImporPeri), le resto el MontoCompensado

    if sGradoCaracter = 'GP' then
      qrlTituloPlusAmpo.Caption := 'MOPRE(' + FloatToStr(CantidadAMPO) + ')'
    else if sGradoCaracter = 'GD' then
      qrlTituloPlusAmpo.Caption := 'GRAN INVALIDEZ'
    else
      qrlTituloPlusAmpo.Caption := '';
    qrlPlusAmpo.Caption := Iif(PlusAMPO <> 0, Get_AjusteDecimales(FloatToStr(PlusAMPO), '$'), '');

    if AreIn(Concepto, [CONCEPTO_GRANINVALIDEZPROV, CONCEPTO_PARCIALDEF, CONCEPTO_PARCIALPROV,
                        CONCEPTO_TOTALPROV, CONCEPTO_TOTALDEF, CONCEPTO_GRANINVALIDEZDEF]) and (SalarioFamiliar > 0) then
       qrlAsignacFamiliares.Caption := 'Sr. Trabajador: la presente liquidación incluye asignaciones familiares. ' +
                                       'En caso que Ud. se encuentre realizando tareas bajo relación de dependencia ' +
                                       'deberá denunciarlo en forma inmediata a esta Aseguradora a efectos de cesar ' +
                                       'el pago de tales asignaciones familiares, las cuales son a cargo exclusivo de su ' +
                                       'empleador y serán abonadas a través del mismo. La omisión de denuncia dará lugar a acciones legales en su contra.'
     else
       qrlAsignacFamiliares.Caption := '';

    qrlImpuesto.Enabled  := AreIn(sGradoCaracter, ['GD', 'PD', 'TD']);
    qrshImpuesto.Enabled := AreIn(sGradoCaracter, ['GD', 'PD', 'TD']);

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

