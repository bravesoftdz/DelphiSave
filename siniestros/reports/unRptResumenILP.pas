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
    QRLabel28: TQRLabel;
    qrlBaseDiaria: TQRLabel;
    QRLabel29: TQRLabel;
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
    QRShape17: TQRShape;
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
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape2: TQRShape;
    QRShape23: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape24: TQRShape;
    qrsLineaTotRemun: TQRShape;
    qrsLineaTotRemun2: TQRShape;
    qrsLineaRemun: TQRShape;
    qrsLineaRemun2: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRLabel2: TQRLabel;
    function Get_AjusteDecimales2(Value: String): String;
    procedure FormatMonto(Sender: TObject; var Value: String);
    function GetDoubleLabel(lbl: TQRLabel): Double;
    procedure qrdbPeriodoPrint(sender: TObject; var Value: String);
    procedure qrbRemuneracionesDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure DoMostrarCampos(Lockear, ShowTit, ShowPeriodo, ShowGranInv, ShowAsigFam :Boolean);
  private

  public
    constructor Create(AOwner: TComponent); override;
    procedure Preparar(Liquidacion: TILP; CantCopias, CantDigit: Integer;
                       VerError: Boolean; TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs, unLiqIncapacidades,
  unSesion, unArt, Cuit, unSiniestros, Periodo, Printers, VCLExtra,
  DateTimeFuncs, Numeros;

{$R *.DFM}

constructor TqrResumenILP.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TqrResumenILP.Preparar(Liquidacion: TILP; CantCopias, CantDigit: Integer;
                                 VerError: Boolean; TipoSalida: TSalidaReport = srPreview);
var
  bEsSinGobernacion: Boolean;
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

    if IsPeriodica then
    begin
      sSql := 'SELECT epa_ptjubila, epa_ptinssjp, epa_ptanssal, epa_ptosocial, 0 cero ' +
                'FROM secb_cbaseexpsin ' +
               'WHERE cb_siniestro = :Siniestro ' +
                 'AND cb_orden = :Orden';
      OpenQueryEx(sdqConsulta2, [iSiniestro, iOrden], sSql);

      if sdqConsulta2.IsEmpty then
      begin
        Message := 'Falta información referida a Aportes y Contribuciones!!!' + CRLF + 'No podrá imprimir la liquidación.';
        if VerError then raise Exception.Create(Message);
      end;

      sSql := 'SELECT (epa_ptjubila + epa_ptinssjp + epa_ptanssal + epa_ptosocial) totpt ' +
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

    qrlExpediente.Caption  := Expediente.SiniestroCompleto;
    qrlLiquid.Caption      := LPad(IntToStr(NroLiquidacion), '0', 3);
    qrlDelegacion.Caption  := sDelegacion + ' (' + Delegacion + ')';
    qrlEmpresa.Caption     := Expediente.Empresa.RazonSocial;
    qrlCUIT.Caption        := PonerGuiones(Expediente.Empresa.CUIT);
    qrlAccidentado.Caption := Expediente.Trabajador.Nombre;
    qrlHAccidente.Caption  := Expediente.HoraAccidente;
    qrlCUIL.Caption        := PonerGuiones(Expediente.Trabajador.CUIL);
    qrlFNacimiento.Caption := DateToStr(Expediente.Trabajador.FechaNacimiento) + ' (' + IntToStr(TILP(Liquidacion).Edad) + ')';
    qrlFAccidente.Caption  := DateToStr(Expediente.FechaAccidente);
    qrlFEmision.Caption    := DateToStr(NvlDT(FechaEmision, DBDate()));
    qrlReimpresion.Caption := Iif((FechaEmision = 0) or (FechaEmision = DBDate), '', '***REIMPRESION***');

    if DoGenerarTempRemuneracionesDatEcon(iSiniestro, iOrden, Expediente.Empresa.CUIT, Expediente.FechaAccidente) then
      OpenQueryEx(sdqConsulta1, [Sesion.UserID]);

    qrlBaseDiaria.Caption     := Get_AjusteDecimales(FloatToStr(BaseDiaria), '$');
    qrlBaseMensual.Caption    := Get_AjusteDecimales(FloatToStr(BaseMensual), '$');
    qrlIncapacidad.Caption    := DescConcepto +  ' ' + Get_AjusteDecimales(FloatToStr(Incapacidad)) + '%';
    qrlLiqCalculada.Caption   := IIF(LiqCalculada > 0, Get_AjusteDecimales(FloatToStr(LiqCalculada), '$'), '');
    qrlFormula.Caption        := Formula;
    qrlFDesde.Caption         := DateToStr(Desde);
    qrlFHasta.Caption         := DateToStr(Hasta);
    qrlConcepto.Caption       := 'PRESTACION DINERARIA POR ' + Ucase(GetTitulo) + ' (' + DescConcepto + ')';
    qrlRetenciones.Caption    := Get_AjusteDecimales(FloatToStr(Aportes), '$');
    qrlContribuciones.Caption := Get_AjusteDecimales(FloatToStr(Contribuciones), '$');
    qrlAsignaciones.Caption   := Get_AjusteDecimales(FloatToStr(SalarioFamiliar), '$');
    qrlGranInvalidez.Caption  := Get_AjusteDecimales(FloatToStr(PlusAmpo), '$');
    qrlMonto.Caption          := Get_AjusteDecimales(FloatToStr(ImporteLiquidado), '$');
    qrlTotal.Caption          := Get_AjusteDecimales(FloatToStr(TotalAPagar), '$');
    qrlFondos.Caption         := EnvioFondos;
    qrlObservaciones.Caption  := Observaciones;
    qrlRecibos.Caption        := Recibos;
    qrlCheque.Caption         := ChequeANombreDe;
    qrlFormaPago.Caption      := DescMetodoPago + DECODE(Banco, ['N', 'P'], [' Banco Nación', ' Banco Provincia']);
    qrlUsuLiquidacion.Caption := IIF(UsuarioAlta = 'AUTOMATICO', UsuarioAlta,
                                                                 ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                                                            ' WHERE se_usuario = :Usu', [UsuarioAlta]));
    sNroExpediente            := lpad(iSiniestro, '0', 8) + lpad(iOrden, '0', 2) +
                                 lpad(iRecaida, '0', 2) + lpad(iNroLiquidacion, '0', 3);
    qrlNroExpediente.Caption  := sNroExpediente;
    qrlCodigoBarras.Caption   := '*' + sNroExpediente + '*';
    qrlNroDigit.Caption       := IntToStr(CantDigit);

    DoMostrarCampos(not IsPeriodica, Incapacidad < 50, Hasta > 0, PlusAmpo > 0, SalarioFamiliar > 0);

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
  if Value = '0' then
    Result := ''
  else
    Result := Get_AjusteDecimales(Value);
end;

procedure TqrResumenILP.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales2(Value);
end;

procedure TqrResumenILP.qrdbPeriodoPrint(sender: TObject; var Value: String);
begin
  if sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales' then
  begin
    qrsLineaTotRemun.Enabled   := True;
    qrsLineaTotRemun2.Enabled  := True;
    qrdbPeriodo.Font.Style     := qrdbPeriodo.Font.Style + [fsBold];
  end
  else begin
    qrsLineaTotRemun.Enabled   := False;
    qrsLineaTotRemun2.Enabled  := False;
    qrdbPeriodo.Font.Style     := qrdbPeriodo.Font.Style - [fsBold];

    if Value <> '' then
      Value := FormatPeriodo(Value);
  end;
end;

procedure TqrResumenILP.qrbRemuneracionesDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrsLineaRemun.Enabled   := (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales');
  qrsLineaRemun2.Enabled  := (sdqConsulta1.Fieldbyname('PERIODO').AsString = 'Totales');
end;

procedure TqrResumenILP.QRDBText2Print(sender: TObject; var Value: String);
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

procedure TqrResumenILP.DoMostrarCampos(Lockear, ShowTit, ShowPeriodo, ShowGranInv, ShowAsigFam :Boolean);
begin
  LockControls([QRShape5, QRShape7, QRShape8, QRShape9, qrlContrib, QRLabel17,
                qrlPatronReten, QRLabel3, QRLabel20, QRLabel21, QRLabel22, QRLabel23,
                QRLabel24, QRLabel25, qrdbPTJUBILA, qrdbPTINSSJP, qrdbCERO,
                qrdbCERO2, qrdbPTANSSAL, qrdbPTOSOCIAL, qrdbTOTPT, QRDBText4,
                QRDBText7, QRDBText9, QRDBText11, QRDBText13, QRDBText15,
                qrdbTOTPE, qrshPeriodo, QRLabel31, QRLabel32, QRLabel33,
                QRLabel43, QRShape4, QRShape6, QRShape14, qrlRetenciones,
                qrlContribuciones, qrlAsignaciones, qrlTotal, qrlTitOSocial,
                qrlOSocial, qrlTitAFJP, qrlAFJP, qrshOSocial], Lockear);

  LockControls([qrshTit, qrlTit, qrlNroDigit], not ShowTit);
  LockControls([qrlTitGranInvalidez, qrlGranInvalidez], not ShowGranInv);
  LockControls([qrlPerDesde, qrlPerHasta, qrlFDesde, qrlFHasta], not ShowPeriodo);
  LockControls([qrlTitAsigFam, qrlAsignaciones], not ShowAsigFam);

  if Lockear then
  begin
    qrlConcepto.Top     := qrlConcepto.Top + 35;
    qrlTitConcepto.Top  := qrlTitConcepto.Top + 35;
    qrshConcepto.Top    := qrshConcepto.Top + 35;
    qrshConcepto2.Top   := qrshConcepto2.Top + 35;
    qrlMonto.Top        := qrlMonto.Top + 35;
  end;
end;

end.

