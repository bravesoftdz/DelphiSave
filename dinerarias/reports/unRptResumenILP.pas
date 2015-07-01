unit unRptResumenILP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
     Forms, Quickrpt, QRCtrls, Db, SDEngine, unComunes, unClassLiquidacion;

type
  TqrResumenILP = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrbTitle: TQRBand;
    qrlTitulo: TQRLabel;
    qrbRemuneracionesHeader: TQRBand;
    qrbRemuneracionesDetail: TQRSubDetail;
    QRLabel8: TQRLabel;
    qrbRemuneracionesFooter: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel7: TQRLabel;
    qrlContratoNro: TQRLabel;
    QRLabel1: TQRLabel;
    qrlContrato: TQRLabel;
    qrlExpediente: TQRLabel;
    qrlLiquid: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCUIT: TQRLabel;
    qrlAccidentado: TQRLabel;
    qrlCUIL: TQRLabel;
    qrlFAccidente: TQRLabel;
    qrlFEmision: TQRLabel;
    qrlReimpresion: TQRLabel;
    PageFooterBand1: TQRBand;
    sdqConsulta1: TSDQuery;
    QRShape5: TQRShape;
    qrlContrib: TQRLabel;
    QRLabel17: TQRLabel;
    qrlPatronReten: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    qrdbPTJUBILA: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText7: TQRDBText;
    qrdbPTINSSJP: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText9: TQRDBText;
    qrdbCERO: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText11: TQRDBText;
    qrdbCERO2: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText13: TQRDBText;
    qrdbPTANSSAL: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText15: TQRDBText;
    qrdbPTOSOCIAL: TQRDBText;
    QRLabel25: TQRLabel;
    qrdbTOTPT: TQRDBText;
    QRShape9: TQRShape;
    qrdbTOTPE: TQRDBText;
    qrlHAccidente: TQRLabel;
    QRShape11: TQRShape;
    qrlTitBDRemun: TQRLabel;
    qrlBaseDiaria: TQRLabel;
    qrlBaseMensual: TQRLabel;
    QRLabel33: TQRLabel;
    qrlLiqCalculada: TQRLabel;
    QRShape12: TQRShape;
    chbFormula: TQRChildBand;
    chbResto: TQRChildBand;
    QRLabel35: TQRLabel;
    qrlFormula: TQRLabel;
    QRShape1: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    qrlRecibos: TQRLabel;
    qrlCheque: TQRLabel;
    qrlUsuLiquidacion: TQRLabel;
    qrlNroExpediente: TQRLabel;
    qrlCodigoBarras: TQRLabel;
    qriLogo: TQRImage;
    qrsHijos: TQRShape;
    QRShape10: TQRShape;
    QRLabel18: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel19: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    qrlFormaPago: TQRLabel;
    QRShape25: TQRShape;
    qrlDelegacion: TQRLabel;
    qrlIncapacidad: TQRLabel;
    QRLabel30: TQRLabel;
    qrlFNacimiento: TQRLabel;
    QRLabel34: TQRLabel;
    qrshConcepto: TQRShape;
    qrlTitConcepto: TQRLabel;
    qrlConcepto: TQRLabel;
    qrlMonto: TQRLabel;
    qrlObservaciones: TQRLabel;
    qrlObservacio: TQRLabel;
    qrlFondos: TQRLabel;
    QRLabel38: TQRLabel;
    sdqConsulta2: TSDQuery;
    sdqConsulta3: TSDQuery;
    qrshPeriodo: TQRShape;
    qrlPerDesde: TQRLabel;
    qrlPerHasta: TQRLabel;
    qrlFDesde: TQRLabel;
    qrlFHasta: TQRLabel;
    QRShape4: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    qrlTitAsigFam: TQRLabel;
    QRLabel43: TQRLabel;
    qrshConcepto2: TQRShape;
    QRShape14: TQRShape;
    QRShape6: TQRShape;
    qrlRetenciones: TQRLabel;
    qrlContribuciones: TQRLabel;
    qrlAsignaciones: TQRLabel;
    qrlTotal: TQRLabel;
    qrlNroDigit: TQRLabel;
    qrlTit: TQRLabel;
    qrshTit: TQRShape;
    QRShape3: TQRShape;
    QRLabel55: TQRLabel;
    qrlTitGranInvalidez: TQRLabel;
    qrlGranInvalidez: TQRLabel;
    qrshOSocial: TQRShape;
    qrlTitOSocial: TQRLabel;
    qrlOSocial: TQRLabel;
    qrlTitAFJP: TQRLabel;
    qrlAFJP: TQRLabel;
    qrdbPeriodo: TQRDBText;
    qrdbDias: TQRDBText;
    qrdbImporte: TQRDBText;
    qrdbImporte2: TQRDBText;
    qrdbDias2: TQRDBText;
    qrdbImporte3: TQRDBText;
    qrdbImporte4: TQRDBText;
    qrdbFechaPres: TQRDBText;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlImporte3: TQRLabel;
    qrlImporte1: TQRLabel;
    qrlImporte4: TQRLabel;
    qrlImporte2: TQRLabel;
    QRShape2: TQRShape;
    QRShape23: TQRShape;
    qrlDGI: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape24: TQRShape;
    qrsLineaRemun: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRLabel2: TQRLabel;
    qrshZonaAFIP: TQRShape;
    qrlTitZonaAFIP: TQRLabel;
    qrlZonaAFIP: TQRLabel;
    sdqRemuPosDecre: TSDQuery;
    qrlVariables: TQRLabel;
    qrsLineaRemun2: TQRShape;
    qrlTitBMRemun: TQRLabel;
    qrlTitBDNoRemun: TQRLabel;
    qrlTitBMNoRemun: TQRLabel;
    qrlBaseDiariaNorem: TQRLabel;
    qrlBaseMensualNoRem: TQRLabel;
    qrlTitNoRemun: TQRLabel;
    qrlNoRemun: TQRLabel;
    qrlFIngreso: TQRLabel;
    QRLabel52: TQRLabel;
    qrlTitMontoCompensado: TQRLabel;
    qrlMontoCompensado: TQRLabel;
    QRLabel11: TQRLabel;
    qrlTipoAccidente: TQRLabel;
    qrlCompensacionDanos: TQRLabel;
    qrlMontoCompDanos: TQRLabel;
    qrlPagoAdic: TQRLabel;
    qrlMontoPagoAdic: TQRLabel;
    qrsLineaTotRemun: TQRShape;
    qrlOtrosPagos: TQRLabel;
    qrlMontoOtrosPagos: TQRLabel;
    {qrlCompensacionDanos: TQRLabel;
    qrlMontoCompDanos: TQRLabel;
    qrlPagoAdic: TQRLabel;
    qrlMontoPagoAdic: TQRLabel; }
    function Get_AjusteDecimales2(Value: String): String;
    procedure FormatMonto(Sender: TObject; var Value: String);
    function GetDoubleLabel(lbl: TQRLabel): Double;
    procedure qrdbPeriodoPrint(sender: TObject; var Value: String);
    procedure qrbRemuneracionesDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrdbDiasPrint(sender: TObject; var Value: String);
    procedure qrdbImportePrint(sender: TObject; var Value: String);
    procedure qrdbDias2Print(sender: TObject; var Value: String);
  private
    procedure DoMostrarCampos(Lockear, ShowTit, ShowPeriodo, ShowGranInv, ShowAsigFam,
                              EsSegundaCopia, ShowNoRem, ShowBaseNoRem, TieneRet, TieneCont,
                              TieneCompDanos, TienePagoAdic, TieneOPagos: Boolean);
    procedure DoArmarGrillaRemu(bEsLiqPost: Boolean; Siniestro, Orden, IdExped, Contrato: Integer;
                                FAccidente, FDesde: TDate; CUIT, CUIL: String; bConTransaccion: boolean = True);
    procedure DoOrdenarLabels;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Preparar(Liquidacion: TILP; CantCopias, CantDigit: Integer;
                       VerError, EsSegundaCopia: Boolean; TipoSalida: TSalidaReport = srPreview; bConTransaccion: boolean = True);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs,
  unLiqIncapacidades, unSesion, unArt, Cuit, unDinerarias, Periodo, Printers,
  VCLExtra, DateTimeFuncs, Numeros, unSiniestros;

{$R *.DFM}

constructor TqrResumenILP.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TqrResumenILP.Preparar(Liquidacion: TILP; CantCopias, CantDigit: Integer;
                                 VerError, EsSegundaCopia: Boolean; TipoSalida: TSalidaReport = srPreview;
                                 bConTransaccion: boolean = True);
var
  bEsSinGobernacion, bEsLiqPost: Boolean;
  iSiniestro, iOrden, iRecaida, iNroLiquidacion: Integer;
  sNroExpediente, sDelegacion, sSql, sObraSocial, sAFJP: String;
begin
  with Liquidacion do
  begin
    PrinterSettings.Copies       := CantCopias;
    PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

    qrlTitulo.Caption := 'INDEMNIZACION POR ' + Ucase(GetTitulo);

    iSiniestro      := Expediente.Siniestro;
    iOrden          := Expediente.Orden;
    iRecaida        := Expediente.Recaida;
    iNroLiquidacion := NroLiquidacion;

    bEsSinGobernacion := Expediente.IsSiniestroGobernacion;
    if bEsSinGobernacion then
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
      qrlEmpDep.Caption      := 'DEPENDENCIA GPBA';
      qrlContratoNro.Caption := '';
      qrlContrato.Caption    := '';
    end
    else begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
      qrlEmpDep.Caption      := 'EMPRESA';
      qrlContratoNro.Caption := 'CONTRATO NRO.';
      qrlContrato.Caption    := IntToStr(Expediente.ContratoVigente);
    end;

    if IsPeriodica or EsSegundaCopia then
    begin
      sSql := 'SELECT epa_ptjubila, epa_ptinssjp, epa_ptanssal, epa_ptosocial, 0 cero, ' +
                    ' epa_pejubila, epa_peinssjp, epa_pefnempleo, epa_pesfamiliar, ' +
                    ' epa_peanssal, epa_peosocial ' +
                'FROM secb_cbaseexpsin ' +
               'WHERE cb_siniestro = :Siniestro ' +
                 'AND cb_orden = :Orden';
      OpenQueryEx(sdqConsulta2, [iSiniestro, iOrden], sSql);

      if sdqConsulta2.IsEmpty then
      begin
        Message := 'Falta información referida a Aportes y Contribuciones!!!' + CRLF + 'No podrá imprimir la liquidación.';
        if VerError then raise Exception.Create(Message);
      end;

      sSql := 'SELECT (epa_ptjubila + epa_ptinssjp + epa_ptanssal + epa_ptosocial) totpt, ' +
                    ' (epa_pejubila + epa_peinssjp + epa_pefnempleo + epa_pesfamiliar + ' +
                     ' epa_peanssal + epa_peosocial) totpe ' +
                'FROM secb_cbaseexpsin ' +
               'WHERE cb_siniestro = :Siniestro ' +
                 'AND cb_orden = :Orden';
      OpenQueryEx(sdqConsulta3, [iSiniestro, iOrden], sSql);

      sSql := 'SELECT NVL(LE_OBRASOCIAL, CB_OBRASOCIAL) OSOCIAL, ' +
                    ' NVL(LE_OBRASOCIAL_SUSS, CB_OBRASOCIAL_SUSS) OSSUSS, ' +
                    ' NVL(LE_AFJP, CB_AFJP) JUBIL,  ' +
                    ' NVL(LE_AFJP_SUSS, CB_AFJP_SUSS) JUSUSS ' +
                'FROM SECB_CBASEEXPSIN, SLE_LIQUIEMPSIN ' +
               'WHERE LE_SINIESTRO = :Siniestro ' +
                 'AND LE_ORDEN = :Orden ' +
                 'AND LE_RECAIDA = :Recaida ' +
                 'AND LE_NUMLIQUI = :Numero ' +
                 'AND LE_SINIESTRO = CB_SINIESTRO(+) ' +
                 'AND LE_ORDEN = CB_ORDEN(+)';
      with GetQueryEx(sSql, [iSiniestro, iOrden, iRecaida, iNroLiquidacion]) do
      try
        sObraSocial := FieldByName('OSOCIAL').AsString;
        sAFJP       := FieldByName('JUBIL').AsString;
        qrlOSocial.Caption := sObraSocial + ' ' + Get_DescripcionOSocial(sObraSocial) +
                              Decode(FieldByName('OSSUSS').AsString, ['S', 'N'], [' (SUSS)', ' (NO SUSS)']);
        qrlAFJP.Caption    := Get_DescripcionJubilacion(sAFJP) +
                              Decode(FieldByName('JUSUSS').AsString, ['S', 'N'], [' (SUSS)', ' (NO SUSS)']);
      finally
        free;
      end;

    end;

    sSql := 'SELECT lg_nombre ' +
            'FROM dlg_delegaciones ' +
           'WHERE lg_codigo = :Codigo';
    sDelegacion := ValorSqlEx(sSql, [Delegacion]);

    sSql :=  ' SELECT rl_fechaingreso ' +
               ' FROM crl_relacionlaboral ' +
              ' WHERE rl_contrato = :Cont ' +
                ' AND rl_idtrabajador = :IdTrab ';
    qrlFIngreso.Caption         := ValorSqlEx(sSql, [Expediente.ContratoVigente,
                                                     Expediente.Trabajador.ID]);

    qrlExpediente.Caption       := Expediente.SiniestroCompleto;
    qrlLiquid.Caption           := LPad(IntToStr(NroLiquidacion), '0', 3);
    qrlDelegacion.Caption       := sDelegacion + ' (' + Delegacion + ')';
    qrlEmpresa.Caption          := Expediente.Empresa.RazonSocial;
    qrlCUIT.Caption             := PonerGuiones(Expediente.Empresa.CUIT);
    qrlAccidentado.Caption      := Expediente.Trabajador.Nombre;
    qrlHAccidente.Caption       := Expediente.HoraAccidente;
    qrlCUIL.Caption             := PonerGuiones(Expediente.Trabajador.CUIL);
    qrlFNacimiento.Caption      := DateToStr(Expediente.Trabajador.FechaNacimiento) + ' (' +
                                   IntToStr(Expediente.Trabajador.Edad) + ')';
    qrlFAccidente.Caption       := DateToStr(Expediente.FechaAccidente);
    qrlFEmision.Caption         := DateToStr(NvlDT(FechaEmision, DBDate()));
    qrlReimpresion.Caption      := Iif((FechaEmision = 0) or (FechaEmision = DBDate), '', '***REIMPRESION***');
    qrlBaseDiaria.Caption       := Get_AjusteDecimales(FloatToStr(BaseDiaria), '$');
    qrlBaseDiariaNorem.Caption  := Get_AjusteDecimales(FloatToStr(BaseDiariaNoRem), '$');
    qrlBaseMensual.Caption      := Get_AjusteDecimales(FloatToStr(BaseMensual), '$');
    qrlBaseMensualNoRem.Caption := Get_AjusteDecimales(FloatToStr(BaseMensualNoRem), '$');
    qrlIncapacidad.Caption      := DescConcepto +  ' ' + Get_AjusteDecimales(FloatToStr(Incapacidad)) + '%';
    qrlLiqCalculada.Caption     := IIF(LiqCalculada > 0, Get_AjusteDecimales(FloatToStr(LiqCalculada), '$'), '');
    qrlFormula.Caption          := Formula;
    qrlFDesde.Caption           := DateToStr(Desde);
    qrlFHasta.Caption           := DateToStr(Hasta);
    qrlConcepto.Caption         := 'PRESTACION DINERARIA REMUNERATIVA POR ' + Ucase(GetTitulo) + ' (' + DescConcepto + ')';
    qrlRetenciones.Caption      := Get_AjusteDecimales(FloatToStr(Aportes), '$');
    qrlContribuciones.Caption   := Get_AjusteDecimales(FloatToStr(Contribuciones), '$');
    qrlAsignaciones.Caption     := Get_AjusteDecimales(FloatToStr(SalarioFamiliar), '$');
    qrlGranInvalidez.Caption    := Get_AjusteDecimales(FloatToStr(PlusAmpo), '$');
    qrlTipoAccidente.Caption    := Expediente.TipoAccidente;    // TK 50129

    if not(IsPeriodica) and (ImporteLiquidado <> TotalAPagar) and
       (ImporteLiquidNoRem = 0) and ((MontoCompDanos = 0) and (MontoPagoAdic = 0) and (MontoOtrosPagos = 0)) then                                                  //esto es una excepcion para tener en cuenta los embargos en los cuales
      qrlMonto.Caption          := Get_AjusteDecimales(FloatToStr(TotalAPagar), '$')  //se pone el total a pagar ya que difiere del liquidado aunque sea pago unico...
    else
      qrlMonto.Caption          := Get_AjusteDecimales(FloatToStr(ImporteLiquidado), '$');

    qrlTitNoRemun.Caption       := 'Prestación dineraria no remunerativa por ' + InitCap(GetTitulo) + ' (' + DescConcepto + ')';
    qrlNoRemun.Caption          := Get_AjusteDecimales(FloatToStr(ImporteLiquidNoRem), '$');

    qrlTotal.Caption            := Get_AjusteDecimales(FloatToStr(TotalAPagar - MontoCompensado), '$');   // por Plan Registro de Pagos cancelados (arreglo del ImporPeri)

    if (MontoCompensado > 0) then
    begin
      qrlMontoCompensado.Caption    := Get_AjusteDecimales(FloatToStr(MontoCompensado), '$');
      qrlTitMontoCompensado.Caption := 'Monto Compensado';
    end
    else begin
      qrlMontoCompensado.Caption    := '';
      qrlTitMontoCompensado.Caption := '';
    end;

    qrlFondos.Caption           := EnvioFondos;
    qrlObservaciones.Caption    := Observaciones;
    qrlRecibos.Caption          := Recibos;
    qrlCheque.Caption           := ChequeANombreDe;
    qrlFormaPago.Caption        := DescMetodoPago + ' ' + GetNombreCortoBanco(IdBanco);
    qrlUsuLiquidacion.Caption   := IIF(UsuarioAlta = 'AUTOMATICO', UsuarioAlta,
                                                                   ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                                                              ' WHERE se_usuario = :Usu', [UsuarioAlta]));
    sNroExpediente              := lpad(iSiniestro, '0', 8) + lpad(iOrden, '0', 2) +
                                   lpad(iRecaida, '0', 2) + lpad(iNroLiquidacion, '0', 3);
    qrlNroExpediente.Caption    := sNroExpediente;
    qrlCodigoBarras.Caption     := '*' + sNroExpediente + '*';
    qrlNroDigit.Caption         := IntToStr(CantDigit);
    qrlZonaAFIP.Caption         := DescZonaAfip;
    qrlContrib.Caption          := IIF(EsSegundaCopia, 'Contribuciones patronales', 'Retenciones');
    bEsLiqPost                  := Is_LiquiPostDecreto1694(Expediente.FechaAccidente,
                                                          FechaProceso, Caracter);

    qrlMontoCompDanos.Caption := Get_AjusteDecimales(FloattoStr(MontoCompDanos), '$');
    qrlMontoPagoAdic.Caption := Get_AjusteDecimales(FloattoStr(MontoPagoAdic), '$');
    qrlMontoOtrosPagos.Caption := Get_AjusteDecimales(FloattoStr(MontoOtrosPagos), '$');
    qrlOtrosPagos.Caption := ValorSqlEx('SELECT cp_descripcioncompleta FROM scp_conpago WHERE cp_conpago = :conpago', [ConceptoOtrosPagos]);

    DoArmarGrillaRemu(bEsLiqPost, iSiniestro, iOrden, Expediente.Id,
                      Expediente.ContratoVigente, Expediente.FechaAccidente, Desde,
                      Expediente.Empresa.Cuit, Expediente.Trabajador.Cuil, false);
    DoMostrarCampos(not IsPeriodica, Incapacidad < 50, Hasta > 0, PlusAmpo <> 0,
                    SalarioFamiliar > 0, EsSegundaCopia, ImporteLiquidNoRem <> 0,
                    not IsPagoUnico, Aportes <> 0, Contribuciones <> 0,
                    MontoCompDanos <> 0, MontoPagoAdic <> 0, MontoOtrosPagos <> 0);
    try
      case TipoSalida of
        srPreview: Visualizar(Self, GetValores('', ''), [oForceShowModal, oMailNotAllowed]);
        srPrint:   Print;
      end;
    except
      Self.Free;
    end
  end;
end;

function TqrResumenILP.Get_AjusteDecimales2(Value: String): String;
begin
  Result := IIF(Value = '0', '', Get_AjusteDecimales(Value))
end;

procedure TqrResumenILP.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales2(Value);
end;

procedure TqrResumenILP.qrdbPeriodoPrint(sender: TObject; var Value: String);
begin
  if (sdqConsulta1.Active and (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales')) or
     (sdqRemuPosDecre.Active and AreIn(sdqRemuPosDecre.Fieldbyname('PERIODO').AsString, ['Totales', 'Tipo rem.', 'Remun.'])) then
  begin
    qrsLineaTotRemun.Enabled   := True;
    //qrsLineaTotRemun2.Enabled  := True;
  end
  else begin
    qrsLineaTotRemun.Enabled   := False;
    //qrsLineaTotRemun2.Enabled  := False;
  end;

  if (sdqConsulta1.Active and IsNumber(Copy(Value, 0, 1))) or
     (sdqRemuPosDecre.Active and IsNumber(Copy(Value, 0, 1))) then
    Value := FormatPeriodo(Value);

  if (sdqConsulta1.Active and (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales')) or
     (sdqRemuPosDecre.Active and AreIn(sdqRemuPosDecre.Fieldbyname('PERIODO').AsString, ['Totales', 'Fijas', 'Tipo rem.'])) then
    qrdbPeriodo.Font.Style     := qrdbPeriodo.Font.Style + [fsBold]
  else
    qrdbPeriodo.Font.Style     := qrdbPeriodo.Font.Style - [fsBold];
end;

procedure TqrResumenILP.qrbRemuneracionesDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrsLineaRemun.Enabled   := (sdqConsulta1.Active and (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales')) or
                             (sdqRemuPosDecre.Active and AreIn(sdqRemuPosDecre.Fieldbyname('PERIODO').AsString, ['Totales', 'Tipo rem.']));
  qrsLineaRemun2.Enabled  := ((sdqConsulta1.Active and (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales')) or
                              (sdqRemuPosDecre.Active and AreIn(sdqRemuPosDecre.Fieldbyname('PERIODO').AsString, ['Totales', 'Tipo rem.'])));

  if sdqRemuPosDecre.Active and (sdqRemuPosDecre.Fieldbyname('PERIODO').AsString = 'Tipo rem.') then
  begin
    qrdbImporte.Font.Style  := qrdbImporte.Font.Style + [fsBold];
    qrdbImporte2.Font.Style := qrdbImporte2.Font.Style + [fsBold];
    qrdbDias.Font.Style     := qrdbDias.Font.Style + [fsBold];
  end
  else begin
    qrdbImporte.Font.Style  := qrdbImporte.Font.Style - [fsBold];
    qrdbImporte2.Font.Style := qrdbImporte2.Font.Style - [fsBold];
    qrdbDias.Font.Style     := qrdbDias.Font.Style - [fsBold];
  end;
end;

procedure TqrResumenILP.qrdbDiasPrint(sender: TObject; var Value: String);
begin
  if Value = '0' then Value := '';
end;

function TqrResumenILP.GetDoubleLabel(lbl: TQRLabel): Double;
var
  dValor: Double;
begin
  if lbl.Enabled and (lbl.Caption <> '') then
    dValor := StrToFloat(lbl.Caption)
  else
    dValor := 0;

  Result := dValor;
end;

procedure TqrResumenILP.DoMostrarCampos(Lockear, ShowTit, ShowPeriodo, ShowGranInv,
                                        ShowAsigFam, EsSegundaCopia, ShowNorem,
                                        ShowBaseNoRem, TieneRet, TieneCont,
                                        TieneCompDanos, TienePagoAdic, TieneOPagos :Boolean);
begin

  LockControls([QRShape5, QRShape7, QRShape8, QRShape9, qrlContrib, QRLabel17,
                qrlPatronReten, QRLabel3, QRLabel20, QRLabel21, QRLabel22, QRLabel23,
                QRLabel24, QRLabel25, qrshPeriodo, {QRLabel31, QRLabel32,} {QRLabel43,}
                {QRShape4,} {QRShape6,} {QRShape14,} {qrlRetenciones, qrlContribuciones,
                qrlAsignaciones,} {qrlTotal,} qrlTitOSocial, qrlOSocial, qrlTitAFJP,
                qrlAFJP, qrshOSocial], Lockear);
  LockControls([qrdbPTJUBILA, qrdbPTINSSJP, qrdbCERO, qrdbCERO2, qrdbPTANSSAL,
                qrdbPTOSOCIAL, qrdbTOTPT], Lockear or EsSegundaCopia);
  LockControls([QRDBText4, QRDBText7, QRDBText9, QRDBText11, QRDBText13,
                QRDBText15, qrdbTOTPE], not(EsSegundaCopia));
  LockControls([qrshTit, qrlTit, qrlNroDigit], not ShowTit);
  LockControls([qrlTitGranInvalidez, qrlGranInvalidez], not ShowGranInv);
  LockControls([qrlPerDesde, qrlPerHasta, qrlFDesde, qrlFHasta, qrshZonaAFIP,
                qrlTitZonaAFIP, qrlZonaAFIP], not ShowPeriodo);
  LockControls([qrlTitAsigFam, qrlAsignaciones], not ShowAsigFam);
  LockControls([qrlTitNoRemun, qrlNoRemun], not ShowNoRem);
  LockControls([qrlTitBDNoRemun, qrlTitBMNoRemun, qrlBaseDiariaNorem, qrlBaseMensualNoRem],
                not ShowBaseNoRem);

  LockControls([QRLabel31, qrlRetenciones], not TieneRet);
  LockControls([QRLabel32, qrlContribuciones], not TieneCont);
  LockControls([qrlCompensacionDanos, qrlMontoCompDanos], not TieneCompDanos);
  LockControls([qrlPagoAdic, qrlMontoPagoAdic], not TienePagoAdic);
  LockControls([qrlOtrosPagos, qrlMontoOtrosPagos], not TieneOPagos);

  DoOrdenarLabels;

  if Lockear then
  begin
  {  qrlConcepto.Top     := qrlConcepto.Top + 35;
    qrlTitConcepto.Top  := qrlTitConcepto.Top + 35;
    qrshConcepto.Top    := qrshConcepto.Top + 35;
    qrshConcepto2.Top   := qrshConcepto2.Top + 35;
    qrlMonto.Top        := qrlMonto.Top + 35;  }
  end;

  if not ShowBaseNoRem then
  begin
  {  qrlTitBDRemun.Top   := qrlTitBDRemun.Top + 16;
    qrlTitBMRemun.Top   := qrlTitBMRemun.Top + 16;
    qrlBaseDiaria.Top   := qrlBaseDiaria.Top + 16;
    qrlBaseMensual.Top  := qrlBaseMensual.Top + 16;    }
  end;
end;


procedure TqrResumenILP.DoArmarGrillaRemu(bEsLiqPost: Boolean; Siniestro, Orden,
                                          IdExped, Contrato: Integer; FAccidente,
                                          FDesde: TDate; CUIT, CUIL: String;
                                          bConTransaccion: boolean = True);
begin
  if bEsLiqPost then
  begin
    DoGenerarTempRemunPostDecre(Siniestro, Orden, FAccidente, FDesde, '<=', bConTransaccion);
    qrdbPeriodo.DataSet   := sdqRemuPosDecre;
    qrdbDias.DataSet      := sdqRemuPosDecre;
    qrdbImporte.DataSet   := sdqRemuPosDecre;
    qrdbImporte2.DataSet  := sdqRemuPosDecre;
    qrdbDias2.DataSet     := sdqRemuPosDecre;
    qrdbImporte3.DataSet  := sdqRemuPosDecre;
    qrdbImporte4.DataSet  := sdqRemuPosDecre;
    qrdbFechaPres.DataSet := sdqRemuPosDecre;

    OpenQueryEx(sdqRemuPosDecre, [Sesion.UserID, CUIL, Contrato]);

    qrbRemuneracionesDetail.DataSet := sdqRemuPosDecre;

    qrlImporte3.Caption   := 'Remun.';
    qrlImporte4.Caption   := 'No remun.';
    qrlDGI.Caption        := 'Declaración jurada';
  end
  else begin
    DoGenerarTempRemunDatEcon(Siniestro, Orden, CUIT, FAccidente, False);
    OpenQueryEx(sdqConsulta1, [Sesion.UserID]);
  end;

  qrlVariables.Enabled  := bEsLiqPost;
  qrlImporte1.Enabled   := not bEsLiqPost;
  qrlImporte2.Enabled   := not bEsLiqPost;
end;

procedure TqrResumenILP.qrdbImportePrint(sender: TObject; var Value: String);
begin
  if IsNumber(Copy(Value, 0, 1)) then
    Value := Get_AjusteDecimales2(Value)
end;

procedure TqrResumenILP.qrdbDias2Print(sender: TObject; var Value: String);
begin
  if Value = '0' then Value := '';

  if sdqRemuPosDecre.Active and (sdqRemuPosDecre.Fieldbyname('DIAS_DGI').AsString = 'Fija') then
    qrdbDias2.Font.Style := qrdbDias2.Font.Style + [fsBold]
  else
    qrdbDias2.Font.Style := qrdbDias2.Font.Style - [fsBold];
end;

procedure TqrResumenILP.DoOrdenarLabels;
var CantDetalle, PRIMER_FILA, SEGUNDA_FILA, TERCERA_FILA, CUARTA_FILA, QUINTA_FILA, SEXTA_FILA: integer;
begin
  PRIMER_FILA := QRLabel31.Top; SEGUNDA_FILA := QRLabel32.Top; TERCERA_FILA := qrlTitAsigFam.Top;
  CUARTA_FILA := qrlTitGranInvalidez.Top; QUINTA_FILA := qrlTitNoRemun.Top; SEXTA_FILA := qrlTitMontoCompensado.Top;
  qrlCompensacionDanos.Left := QRLabel31.Left;
  qrlMontoCompDanos.Left := qrlRetenciones.Left;
  qrlPagoAdic.Left := QRLabel32.Left;
  qrlMontoPagoAdic.Left := qrlContribuciones.Left;
  qrlOtrosPagos.Left := qrlTitAsigFam.Left;
  qrlMontoOtrosPagos.Left := qrlAsignaciones.Left;
  CantDetalle := 1;
  if QRLabel31.Enabled then
  begin
    QRLabel31.Top := PRIMER_FILA;
    qrlRetenciones.Top := PRIMER_FILA;
    CantDetalle := CantDetalle + 1;
  end;
  if qrlPagoAdic.Enabled then
  begin
    qrlPagoAdic.Top := PRIMER_FILA;
    qrlMontoPagoAdic.Top := PRIMER_FILA;
    CantDetalle := CantDetalle + 1;
  end;
  if QRLabel32.Enabled then
  begin
    case CantDetalle of
      1: begin
           QRLabel32.Top := PRIMER_FILA;
           qrlContribuciones.Top := PRIMER_FILA;
         end;
      2: begin
           QRLabel32.Top := SEGUNDA_FILA;
           qrlContribuciones.Top := SEGUNDA_FILA;
         end;
    end;
    CantDetalle := CantDetalle + 1;
  end;
  if qrlCompensacionDanos.Enabled then
  begin
    case CantDetalle of
      1: begin
           qrlCompensacionDanos.Top := PRIMER_FILA;
           qrlMontoCompDanos.Top := PRIMER_FILA;
         end;
      2: begin
           qrlCompensacionDanos.Top := SEGUNDA_FILA;
           qrlMontoCompDanos.Top := SEGUNDA_FILA;
         end;
    end;
    CantDetalle := CantDetalle + 1;
  end;
  if qrlOtrosPagos.Enabled then
  begin
    case CantDetalle of
      1: begin
           qrlOtrosPagos.Top := PRIMER_FILA;
           qrlMontoOtrosPagos.Top := PRIMER_FILA;
         end;
      2: begin
           qrlOtrosPagos.Top := SEGUNDA_FILA;
           qrlMontoOtrosPagos.Top := SEGUNDA_FILA;
         end;
      3: begin
           qrlOtrosPagos.Top := TERCERA_FILA;
           qrlMontoOtrosPagos.Top := TERCERA_FILA;
         end;
    end;
    CantDetalle := CantDetalle + 1;
  end;
  if qrlTitAsigFam.Enabled then
  begin
    case CantDetalle of
      1: begin
           qrlTitAsigFam.Top := PRIMER_FILA;
           qrlAsignaciones.Top := PRIMER_FILA;
         end;
      2: begin
           qrlTitAsigFam.Top := SEGUNDA_FILA;
           qrlAsignaciones.Top := SEGUNDA_FILA;
         end;
      3: begin
           qrlTitAsigFam.Top := TERCERA_FILA;
           qrlAsignaciones.Top := TERCERA_FILA;
         end;
    end;
    CantDetalle := CantDetalle + 1;
  end;
  if qrlTitGranInvalidez.Enabled then
  begin
    case CantDetalle of
      1: begin
           qrlTitGranInvalidez.Top := PRIMER_FILA;
           qrlGranInvalidez.Top := PRIMER_FILA;
         end;
      2: begin
           qrlTitGranInvalidez.Top := SEGUNDA_FILA;
           qrlGranInvalidez.Top := SEGUNDA_FILA;
         end;
      3: begin
           qrlTitGranInvalidez.Top := TERCERA_FILA;
           qrlGranInvalidez.Top := TERCERA_FILA;
         end;
      4: begin
           qrlTitGranInvalidez.Top := CUARTA_FILA;
           qrlGranInvalidez.Top := CUARTA_FILA;
         end;
    end;
    CantDetalle := CantDetalle + 1;
  end;
  if qrlTitNoRemun.Enabled then
  begin
    case CantDetalle of
      1: begin
           qrlTitNoRemun.Top := PRIMER_FILA;
           qrlNoRemun.Top := PRIMER_FILA;
         end;
      2: begin
           qrlTitNoRemun.Top := SEGUNDA_FILA;
           qrlNoRemun.Top := SEGUNDA_FILA;
         end;
      3: begin
           qrlTitNoRemun.Top := TERCERA_FILA;
           qrlNoRemun.Top := TERCERA_FILA;
         end;
      4: begin
           qrlTitNoRemun.Top := CUARTA_FILA;
           qrlNoRemun.Top := CUARTA_FILA;
         end;
      5: begin
           qrlTitNoRemun.Top := QUINTA_FILA;
           qrlNoRemun.Top := QUINTA_FILA;
         end;
    end;
    CantDetalle := CantDetalle + 1;
  end;
  if qrlTitMontoCompensado.Enabled then
  begin
    case CantDetalle of
      1: begin
           qrlTitMontoCompensado.Top := PRIMER_FILA;
           qrlMontoCompensado.Top := PRIMER_FILA;
         end;
      2: begin
           qrlTitMontoCompensado.Top := SEGUNDA_FILA;
           qrlMontoCompensado.Top := SEGUNDA_FILA;
         end;
      3: begin
           qrlTitMontoCompensado.Top := TERCERA_FILA;
           qrlMontoCompensado.Top := TERCERA_FILA;
         end;
      4: begin
           qrlTitMontoCompensado.Top := CUARTA_FILA;
           qrlMontoCompensado.Top := CUARTA_FILA;
         end;
      5: begin
           qrlTitMontoCompensado.Top := QUINTA_FILA;
           qrlMontoCompensado.Top := QUINTA_FILA;
         end;
      6: begin
           qrlTitMontoCompensado.Top := SEXTA_FILA;
           qrlMontoCompensado.Top := SEXTA_FILA;
         end;
    end;
  end;

end;

end.

