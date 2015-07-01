unit unRptResumenIncapacidad;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
     Forms, Quickrpt, QRCtrls, Db, SDEngine, unComunes, unClassLiquidacion;

type
  TqrResumenIncapacidad = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrbTitle: TQRBand;
    qrlTitulo: TQRLabel;
    qrbRemuneracionesHeader: TQRBand;
    qrbRemuneracionesDetail: TQRSubDetail;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    qrdbDias: TQRDBText;
    qrdbPeriodo: TQRDBText;
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
    qrlDeleg: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCUIT: TQRLabel;
    qrlAccidentado: TQRLabel;
    qrlCUIL: TQRLabel;
    qrlFAccidente: TQRLabel;
    qrlFEmision: TQRLabel;
    QRLabel2: TQRLabel;
    qrlTipoLiquid: TQRLabel;
    qrlReimpresion: TQRLabel;
    qrlImporte3: TQRLabel;
    QRLabel37: TQRLabel;
    qrdbImporte3: TQRDBText;
    qrdbImporte: TQRDBText;
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
    sdqConsulta2: TSDQuery;
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
    sdqConsulta3: TSDQuery;
    qrsLineaTotRemun: TQRShape;
    qrlHAccidente: TQRLabel;
    QRShape11: TQRShape;
    QRLabel28: TQRLabel;
    qrlBaseDiaria: TQRLabel;
    QRLabel29: TQRLabel;
    qrlBaseMensual: TQRLabel;
    QRLabel30: TQRLabel;
    qrlFranquicia: TQRLabel;
    QRLabel32: TQRLabel;
    qrlFDesde: TQRLabel;
    QRLabel34: TQRLabel;
    qrlFHasta: TQRLabel;
    QRLabel36: TQRLabel;
    qrlDiasLiq: TQRLabel;
    qlrTitF1: TQRLabel;
    qrlF1: TQRLabel;
    QRLabel33: TQRLabel;
    qrlLiqCalculada: TQRLabel;
    qrlAvisoAnterior: TQRLabel;
    qlrTitF2: TQRLabel;
    qrlF2: TQRLabel;
    qlrTitF3: TQRLabel;
    qrlF3: TQRLabel;
    QRShape12: TQRShape;
    qrsLineaRemun: TQRShape;
    chbFormula: TQRChildBand;
    chbResto: TQRChildBand;
    QRLabel35: TQRLabel;
    qrlFormula: TQRLabel;
    QRShape1: TQRShape;
    QRShape13: TQRShape;
    QRLabel38: TQRLabel;
    qrlReintPD: TQRLabel;
    qrlTitADepos: TQRLabel;
    QRShape15: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    qrlTitAportes: TQRLabel;
    qrlAsigFam: TQRLabel;
    qrlTitPlusAmpo: TQRLabel;
    qrlIBPReint: TQRLabel;
    qrlCPRReint: TQRLabel;
    qrlAFReint: TQRLabel;
    qrlIBPPagoDir: TQRLabel;
    qrlATPagoDir: TQRLabel;
    qrlAFPagoDir: TQRLabel;
    qrlCPRDepos: TQRLabel;
    qrlATDepos: TQRLabel;
    qrlMOPREPagoDir: TQRLabel;
    QRShape18: TQRShape;
    QRLabel46: TQRLabel;
    qrlTotReint: TQRLabel;
    qrlTotPagoDir: TQRLabel;
    qrlTotDepos: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    qrlObservaciones: TQRLabel;
    qrlCheque: TQRLabel;
    qrlUsuLiquidacion: TQRLabel;
    qrlNroExpediente: TQRLabel;
    qrlCodigoBarras: TQRLabel;
    qriLogo: TQRImage;
    QRLabel50: TQRLabel;
    qrlFBajaMedica: TQRLabel;
    QRLabel51: TQRLabel;
    qrlFAltaMedica: TQRLabel;
    QRLabel52: TQRLabel;
    qrlFIngreso: TQRLabel;
    QRLabel54: TQRLabel;
    qrlFEgreso: TQRLabel;
    qrsHijos: TQRShape;
    qrlOSocial: TQRLabel;
    qrlAFJP: TQRLabel;
    qrlTitOSocial: TQRLabel;
    qrlTitAFJP: TQRLabel;
    qrshOSocial: TQRShape;
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
    qrlFondos: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape14: TQRShape;
    qrshTotADep: TQRShape;
    qrshDetADep: TQRShape;
    qrshTitAdep: TQRShape;
    qrshTit: TQRShape;
    qrlTit: TQRLabel;
    qrdbDias2: TQRDBText;
    qrdbImporte4: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape16: TQRShape;
    qrlImporte1: TQRLabel;
    QRShape17: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    qrlNroDigit: TQRLabel;
    qrsLineaRemun2: TQRShape;
    qrsLineaTotRemun2: TQRShape;
    QRShape23: TQRShape;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel53: TQRLabel;
    qrlHijosSinDisc: TQRLabel;
    qrlHijosDisc: TQRLabel;
    qrdbTOTPE2: TQRDBText;
    QRLabel45: TQRLabel;
    QRShape4: TQRShape;
    QRLabel55: TQRLabel;
    qrlImporte2: TQRLabel;
    qrlImporte4: TQRLabel;
    qrdbImporte2: TQRDBText;
    QRShape6: TQRShape;
    QRShape26: TQRShape;
    QRLabel58: TQRLabel;
    qrshZonaAFIP: TQRShape;
    qrlTitZonaAFIP: TQRLabel;
    qrlZonaAFIP: TQRLabel;
    QRLabel59: TQRLabel;
    qrlRecibos: TQRLabel;
    sdqRemuPosDecre: TSDQuery;
    qrlVariables: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel44: TQRLabel;
    qrlBaseDiariaNoRem: TQRLabel;
    qrlBaseMensualNoRem: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    function Get_AjusteDecimales2(Value: String): String;
    procedure FormatMont(Sender: TObject; var Value: String);
    function GetDoubleLabel(lbl: TQRLabel): Double;
    procedure qrdbPeriodoPrint(sender: TObject; var Value: String);
    procedure qrbRemuneracionesDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrdbDiasPrint(sender: TObject; var Value: String);
    procedure DoMostrarCampos(EsInterno, EsPagoDirecto, ShowZonaAfip, EsSegundaCopia, EsLiqPost :Boolean);
    procedure qrdbImportePrint(sender: TObject; var Value: String);
  private
    bEsInterno :Boolean;
    procedure DoArmarGrillaRemu(bEsLiqPost: Boolean; Siniestro, Orden: Integer;
                                FAccidente, FDesde: TDate; CUIT: String);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Preparar(Liquidacion: TLiquidacion; CantCopias, CantDigit: Integer;
                       VerError, EsInterno, EsSegundaCopia: Boolean; TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs,
  unSesion, unArt, Cuit, unDinerarias, Periodo, Printers, VCLExtra, unSiniestros,
  DateTimeFuncs, Numeros;

{$R *.DFM}

constructor TqrResumenIncapacidad.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TqrResumenIncapacidad.Preparar(Liquidacion: TLiquidacion; CantCopias, CantDigit: Integer;
                                         VerError, EsInterno, EsSegundaCopia: Boolean;
                                         TipoSalida: TSalidaReport = srPreview);
var
  bEsPagoDirecto, bEsSinGobernacion, bEsLiqPost, bNoRemun: Boolean;
  iSiniestro, iOrden, iRecaida, iNroLiquidacion: Integer;
  sNroExpediente, sObraSocial, sAFJP, sSuf, sDelegacion, sSql: String;
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

    sSql := 'SELECT lg_nombre ' +
              'FROM dlg_delegaciones ' +
             'WHERE lg_codigo = :Codigo';
    sDelegacion := ValorSqlEx(sSql, [Delegacion]);

    qrlExpediente.Caption  := Expediente.SiniestroCompleto;
    qrlLiquid.Caption      := LPad(IntToStr(NroLiquidacion), '0', 3);
    qrlDeleg.Caption       := sDelegacion + ' (' + Delegacion + ')';
    qrlEmpresa.Caption     := Expediente.Empresa.RazonSocial;
    qrlCUIT.Caption        := PonerGuiones(Expediente.Empresa.CUIT);
    qrlAccidentado.Caption := Expediente.Trabajador.Nombre;
    qrlHAccidente.Caption  := Expediente.HoraAccidente;
    qrlCUIL.Caption        := PonerGuiones(Expediente.Trabajador.CUIL);
    qrlFAccidente.Caption  := DateToStr(Expediente.FechaAccidente);
    qrlFEmision.Caption    := DateToStr(NvlDT(FechaEmision, DBDate()));
    qrlTipoLiquid.Caption  := GetDescrTipoLiqui();
    qrlReimpresion.Caption := Iif((FechaEmision = 0) or (FechaEmision = DBDate), '', '***REIMPRESION***');
    qrlFBajaMedica.Caption := DateToStr(Expediente.FechaBajaMedica);
    qrlFAltaMedica.Caption := IIF(Expediente.FechaAltaMedica > 0, DateToStr(Expediente.FechaAltaMedica), '');
    qrlNroDigit.Caption    := IIF(CantDigit > 0, IntToStr(CantDigit), '');
    qrlZonaAFIP.Caption    := DescZonaAfip;

    sSql :=  ' SELECT hl_fechaegreso, rl_fechaingreso ' +
               ' FROM crl_relacionlaboral, chl_historicolaboral ' +
              ' WHERE rl_contrato = :Cont ' +
                ' AND rl_idtrabajador = :IdTrab ' +
                ' AND rl_idtrabajador = hl_idtrabajador(+) ';
    with GetQueryEx(sSql, [Expediente.ContratoVigente, Expediente.Trabajador.ID]) do
    try
      qrlFIngreso.Caption := FieldByName('rl_fechaingreso').AsString;
      qrlFEgreso.Caption  := FieldByName('hl_fechaegreso').AsString;
    finally
      Free;
    end;

    if qrlFIngreso.Caption = '' then
    begin
      sSql :=  'SELECT MAX(mi_fechaini) ' +
                ' FROM comunes.cmi_miregistro ' +
               ' WHERE mi_cuil = :cuil ' +
                 ' AND mi_cuit = :cuit ' +
                 ' AND mi_fechaini <= :facci ';
      qrlFIngreso.Caption := ValorSqlEx(sSql, [Expediente.Trabajador.Cuil,
                                               Expediente.Empresa.Cuit,
                                               TDateTimeEx.Create(Expediente.FechaAccidente)]);
    end;

    if qrlFEgreso.Caption = '' then
    begin
      sSql :=  'SELECT MAX(mi_fechafin) ' +
                ' FROM comunes.cmi_miregistro ' +
               ' WHERE mi_cuil = :cuil ' +
                 ' AND mi_cuit = :cuit ' +
                 ' AND mi_fechaini <= :facci ';
      qrlFEgreso.Caption := ValorSqlEx(sSql, [Expediente.Trabajador.Cuil,
                                              Expediente.Empresa.Cuit,
                                              TDateTimeEx.Create(Expediente.FechaAccidente)]);
    end;

    bEsPagoDirecto  := (GetTipoLiqui() = tlPagoDirecto);
    bEsInterno      := EsInterno;
    bEsLiqPost      := Is_LiquiPostDecreto1694(Expediente.FechaAccidente, FechaProceso);

    DoArmarGrillaRemu(bEsLiqPost, iSiniestro, iOrden, Expediente.FechaAccidente,
                      Desde, Expediente.Empresa.Cuit);

    if bEsPagoDirecto then
      qrlTit.Caption := 'ILTPD Nº'
    else if (Tipo = 'I') and (TILP(Liquidacion).Incapacidad < 50) then
      qrlTit.Caption := 'DICYDC Nº'
    else
      qrlTit.Caption := 'ILTR Nº';

    DoMostrarCampos(EsInterno, bEsPagoDirecto, (Hasta > 0), EsSegundaCopia, bEsLiqPost);

    sSuf := IIF(bEsPagoDirecto, '_ILTPD', '_ILT');
    sSql := 'SELECT EPA_PEJUBILA' + sSuf + ' PEJUBILA, ' + 'EPA_PTJUBILA' + sSuf + ' PTJUBILA, ' +
                   'EPA_PEINSSJP' + sSuf + ' PEINSSJP, ' + 'EPA_PTINSSJP' + sSuf + ' PTINSSJP, ' +
                   'EPA_PEFNEMPLEO' + sSuf + ' PEFNEMPLEO, ' +
                   'EPA_PESFAMILIAR' + sSuf + ' PESFAMILIAR, ' +
                   'EPA_PEANSSAL' + sSuf + ' PEANSSAL, ' + 'EPA_PTANSSAL' + sSuf + ' PTANSSAL, ' +
                   'EPA_PEOSOCIAL' + sSuf + ' PEOSOCIAL, ' + 'EPA_PTOSOCIAL' + sSuf + ' PTOSOCIAL, ' +
                   '0 CERO, CB_CANTHIJOS CANTHIJOS, CB_CANTHIJOSDISCAP CANTHIJOSDISCAP, ' +
                   'CB_CANTHIJOS + CB_CANTHIJOSDISCAP TOTALHIJOS ' +
              'FROM SECB_CBASEEXPSIN ' +
             'WHERE CB_SINIESTRO = :Siniestro ' +
               'AND CB_ORDEN = :Orden';
    OpenQueryEx(sdqConsulta2, [iSiniestro, iOrden], sSql);

    if sdqConsulta2.IsEmpty then
    begin
      Message := 'Falta información referida a Aportes y Contribuciones!!!' + CRLF + 'No podrá imprimir la liquidación.';
      if VerError then
        raise Exception.Create(Message);
    end;

    qrlHijosSinDisc.Caption := sdqConsulta2.FieldByName('CANTHIJOS').AsString;
    qrlHijosDisc.Caption    := sdqConsulta2.FieldByName('CANTHIJOSDISCAP').AsString;
    qrlAsigFam.Caption      := 'Asignaciones familiares (hijos: ' + sdqConsulta2.FieldByName('TOTALHIJOS').AsString + ')';

    sSql := 'SELECT (EPA_PEJUBILA' + sSuf + ' + ' + 'EPA_PEINSSJP' + sSuf + ' + ' +
                    'EPA_PEFNEMPLEO' + sSuf + ' + ' + 'EPA_PESFAMILIAR' + sSuf + ' + ' +
                    'EPA_PEANSSAL' + sSuf + ' + ' + 'EPA_PEOSOCIAL' + sSuf + ') TOTPE, ' +
                   '(EPA_PTJUBILA' + sSuf + ' + ' + 'EPA_PTINSSJP' + sSuf + ' + ' +
                    'EPA_PTANSSAL' + sSuf + ' + ' + 'EPA_PTOSOCIAL' + sSuf + ') TOTPT ' +
              'FROM SECB_CBASEEXPSIN ' +
             'WHERE CB_SINIESTRO = :Siniestro ' +
               'AND CB_ORDEN = :Orden';
    OpenQueryEx(sdqConsulta3, [iSiniestro, iOrden], sSql);

    if bEsPagoDirecto then
    begin
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

    qrlBaseDiaria.Caption       := FloatToStr(BaseDiaria);
    qrlBaseMensual.Caption      := FloatToStr(BaseMensual);
    qrlBaseDiariaNoRem.Caption  := FloatToStr(BaseDiariaNoRem);
    qrlBaseMensualNoRem.Caption := FloatToStr(BaseMensualNoRem);
    qrlFranquicia.Caption       := IntToStr(Expediente.Franquicia);
    qrlFDesde.Caption           := DateToStr(Desde);
    qrlFHasta.Caption           := DateToStr(Hasta);
    qrlLiqCalculada.Caption     := FloatToStr(LiqCalculada);
    qrlAvisoAnterior.Caption    := Iif(IsAjuste, 'AJUSTE S/LIQ. ANTERIOR', '');

    qrlDiasLiq.Caption := Iif(Dias = 0, '', Get_AjusteDecimales(FloatToStr(Dias), '', 1));

    qlrTitF3.Caption   := 'Empresa no remun.';
    qrlF3.Caption      := Get_AjusteDecimales2(FloatToStr(TILT(Liquidacion).ImporteEmpNoRem));

    qlrTitF2.Caption   := 'Liquidac. empresa';
    qrlF2.Caption      := Get_AjusteDecimales2(FloatToStr(TILT(Liquidacion).ImporteEmpresa));

    qlrTitF1.Caption   := 'Diferencia';
    qrlF1.Caption      := Get_AjusteDecimales2(FloatToStr(TILT(Liquidacion).Diferencia));

    chbFormula.Enabled := False;
    //el importe no remunerativo solamente suma cuando es pago directo (en reintegros está dentro del importe liquidado)
    bNoRemun := (Liquidacion.Tipo = 'D') and (TILT(Liquidacion).ImporteEmpNoRem > 0);
    LockControls([qrlTitPlusAmpo, qrlMOPREPagoDir], not bNoRemun);
    qrlTitPlusAmpo.Caption  := 'Importe no remunerativo';
    qrlMOPREPagoDir.Caption := FloatToStr(TILT(Liquidacion).ImporteEmpNoRem);

    qrlReintPD.Caption  := IIF(bEsPagoDirecto, 'Pago directo', 'Reintegro');
    qrlContrib.Caption  := IIF(bEsPagoDirecto and not(EsSegundaCopia), 'Aportes al trabajador',
                                                                       'Contribuciones patronales');

    if bEsPagoDirecto then
    begin
      qrlIBPPagoDir.Caption := FloatToStr(ImporteLiquidado);
      qrlATPagoDir.Caption  := FloatToStr(-Aportes);
      qrlAFPagoDir.Caption  := FloatToStr(SalarioFamiliar);
      qrlCPRDepos.Caption   := FloatToStr(Contribuciones);
      qrlATDepos.Caption    := FloatToStr(Aportes);
      qrlTotPagoDir.Caption := FloatToStr(TotalAPagar);
      qrlTotDepos.Caption   := FloatToStr(GetDoubleLabel(qrlCPRDepos) +
                                          GetDoubleLabel(qrlATDepos));
    end
    else begin   // reintegro al empleador
      qrlIBPReint.Caption   := FloatToStr(ImporteLiquidado);
      qrlCPRReint.Caption   := FloatToStr(Contribuciones);
      qrlAFReint.Caption    := FloatToStr(SalarioFamiliar);
      qrlTotReint.Caption   := FloatToStr(GetDoubleLabel(qrlIBPReint) +
                                          GetDoubleLabel(qrlCPRReint) +
                                          GetDoubleLabel(qrlAFReint));
      qrlTotPagoDir.Caption := ''
    end;

    qrlObservaciones.Caption  := Observaciones;
    qrlCheque.Caption         := ChequeANombreDe;
    qrlRecibos.Caption        := Recibos;
    qrlFormaPago.Caption      := DescMetodoPago + ' ' + GetNombreCortoBanco(IdBanco);
    qrlFondos.Caption         := EnvioFondos;
    qrlUsuLiquidacion.Caption := IIF(UsuarioAlta = 'AUTOMATICO', UsuarioAlta,
                                                                 ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                                                            ' WHERE se_usuario = :Usu', [UsuarioAlta]));
    sNroExpediente            := lpad(iSiniestro, '0', 8) + lpad(iOrden, '0', 2) +
                                 lpad(iRecaida, '0', 2) + lpad(iNroLiquidacion, '0', 3);
    qrlNroExpediente.Caption := sNroExpediente;
    qrlCodigoBarras.Caption  := '*' + sNroExpediente + '*';

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

function TqrResumenIncapacidad.Get_AjusteDecimales2(Value: String): String;
begin
  Result := IIF(Value = '0', '', Get_AjusteDecimales(Value))
end;

procedure TqrResumenIncapacidad.FormatMont(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales2(Value);
end;

procedure TqrResumenIncapacidad.qrdbPeriodoPrint(sender: TObject; var Value: String);
begin
  if (sdqConsulta1.Active and (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales')) or
     (sdqRemuPosDecre.Active and AreIn(sdqRemuPosDecre.Fieldbyname('PERIODO').AsString, ['Totales', 'Fijas', 'Fijo'])) then
  begin
    qrsLineaTotRemun.Enabled   := True;
    qrsLineaTotRemun2.Enabled  := sdqConsulta1.Active and bEsInterno;
  end
  else begin
    qrsLineaTotRemun.Enabled   := False;
    qrsLineaTotRemun2.Enabled  := False;
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

procedure TqrResumenIncapacidad.qrbRemuneracionesDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrsLineaRemun.Enabled   := (sdqConsulta1.Active and (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales')) or
                             (sdqRemuPosDecre.Active and (sdqRemuPosDecre.Fieldbyname('PERIODO').AsString = 'Totales'));
  qrsLineaRemun2.Enabled  := sdqConsulta1.Active and (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales') and
                             bEsInterno;

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

procedure TqrResumenIncapacidad.qrdbDiasPrint(sender: TObject; var Value: String);
begin
  if Value = '0' then Value := '';
end;

function TqrResumenIncapacidad.GetDoubleLabel(lbl: TQRLabel): Double;
var
  dValor: Double;
begin
  if lbl.Enabled and (lbl.Caption <> '') then
    dValor := StrToFloat(lbl.Caption)
  else
    dValor := 0;

  Result := dValor;
end;

procedure TqrResumenIncapacidad.DoMostrarCampos(EsInterno, EsPagoDirecto, ShowZonaAfip,
                                                EsSegundaCopia, EsLiqPost: Boolean);
begin
  LockControls([QRLabel40, QRLabel39, QRLabel37, QRLabel41, QRLabel6, QRShape23,
                qrdbDias2, qrdbImporte3, qrdbImporte4, QRDBText8, QRShape25],
                not EsInterno or EsLiqPost);

  LockControls([qrlContrib, QRShape5, QRShape7, QRLabel17, qrlPatronReten, QRShape8,
                QRLabel3, QRLabel20, QRLabel21, QRLabel22, QRLabel23, QRLabel24,
                QRLabel25, QRShape9, qrlReimpresion, QRLabel51, qrlFAltaMedica, qrshTit,
                qrlTit, qrlNroDigit], not EsInterno);

  LockControls([qrlCPRDepos, qrlATDepos, qrlTitOSocial, qrlOSocial, qrlTitAFJP,
                qrlAFJP, qrshOSocial, QRShape3, QRLabel11, QRLabel53, qrlHijosSinDisc,
                qrlHijosDisc], not(EsInterno) or not(EsPagoDirecto));

  LockControls([qrdbPTJUBILA, qrdbPTINSSJP, qrdbCERO, qrdbCERO2, qrdbPTANSSAL,
                qrdbPTOSOCIAL, qrdbTOTPT], not(EsInterno) or not(EsPagoDirecto)or EsSegundaCopia);

  LockControls([QRDBText4, QRDBText7, QRDBText9, QRDBText11, QRDBText13, QRDBText15,
                qrdbTOTPE], not(EsInterno) or (EsPagoDirecto and not(EsSegundaCopia)));

  LockControls([qrlIBPPagoDir, qrlAFPagoDir, qrlATPagoDir, qrlMOPREPagoDir, qrlTotPagoDir,
                qrlTitAportes, qrlCPRDepos, qrlATDepos, qrlTotDepos, qrlTitADepos,
                qrshTitAdep, qrshDetADep, qrshTotADep], not EsPagoDirecto);

  LockControls([qrlIBPReint, qrlAFReint, qrlTotReint, qrlCPRReint, qrdbTOTPE2, QRLabel45], EsPagoDirecto);

  LockControls([qrshZonaAFIP, qrlTitZonaAFIP, qrlZonaAFIP], not ShowZonaAfip);
end;

procedure TqrResumenIncapacidad.DoArmarGrillaRemu(bEsLiqPost: Boolean; Siniestro, Orden: Integer;
                                                  FAccidente, FDesde: TDate;
                                                  CUIT: String);
begin
  if bEsLiqPost then
  begin
    DoGenerarTempRemunPostDecre(Siniestro, Orden, FAccidente, FDesde, '<');
    qrdbPeriodo.DataSet   := sdqRemuPosDecre;
    qrdbDias.DataSet      := sdqRemuPosDecre;
    qrdbImporte.DataSet   := sdqRemuPosDecre;
    qrdbImporte2.DataSet  := sdqRemuPosDecre;

    OpenQueryEx(sdqRemuPosDecre, [Sesion.UserID]);

    qrbRemuneracionesDetail.DataSet := sdqRemuPosDecre;

    qrlImporte3.Caption := 'Importe';
    qrlImporte4.Caption := 'Diario';
  end
  else begin
    DoGenerarTempRemunDatEcon(Siniestro, Orden, CUIT, FAccidente);
    OpenQueryEx(sdqConsulta1, [Sesion.UserID]);
  end;

  qrlVariables.Enabled  := bEsLiqPost;
  qrlImporte1.Enabled   := not bEsLiqPost;
  qrlImporte2.Enabled   := not bEsLiqPost;
end;

procedure TqrResumenIncapacidad.qrdbImportePrint(sender: TObject; var Value: String);
begin
  if IsNumber(Copy(Value, 0, 1)) then
    Value := Get_AjusteDecimales2(Value)
end;

end.

