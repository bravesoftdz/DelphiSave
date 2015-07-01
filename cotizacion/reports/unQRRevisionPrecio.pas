unit unQRRevisionPrecio;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, Math;

type
  TqrRevisionPrecio = class(TQuickRep)
    bPrincipal: TQRBand;
    sdqConsulta: TSDQuery;
    lbTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape2: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRShape9: TQRShape;
    QRLabel41: TQRLabel;
    QRDBText53: TQRDBText;
    bTarifarios: TQRChildBand;
    bMasDatos: TQRChildBand;
    shObservacionesDelAreaComercial: TQRShape;
    QRShape4: TQRShape;
    QRLabel37: TQRLabel;
    QRShape3: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    memoObservacionesDelAreaComercial: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText54: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText57: TQRDBText;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText51: TQRDBText;
    QRShape11: TQRShape;
    QRLabel40: TQRLabel;
    QRShape12: TQRShape;
    QRLabel58: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel59: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText60: TQRDBText;
    QRShape13: TQRShape;
    QRLabel61: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText65: TQRDBText;
    bAutorizacionCobranzasOLegales: TQRStringsBand;
    bAutorizacionComercial: TQRStringsBand;
    QRShape14: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape6: TQRShape;
    lbTituloObservacionesCobranzaOLegales: TQRLabel;
    QRLabel71: TQRLabel;
    txtAutorizo: TQRLabel;
    txtUsuarioAutorizo: TQRLabel;
    memoObservacionesCobranza: TQRMemo;
    txtAutorizoComercial: TQRLabel;
    txtUsuarioAutorizoComercial: TQRLabel;
    memoObservacionesComercial: TQRMemo;
    bValoresCotizados: TQRStringsBand;
    QRShape7: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    shObservacionesDelAreaTecnica: TQRShape;
    memoObservacionesDelAreaTecnica: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText66: TQRDBText;
    QRLabel67: TQRLabel;
    QRShape15: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    txtFechaAutorizacionComercial: TQRLabel;
    txtFechaAutorizacion: TQRLabel;
    bTarifaPendiente: TQRChildBand;
    QRLabel76: TQRLabel;
    QRShape16: TQRShape;
    QRLabel77: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel78: TQRLabel;
    QRDBText69: TQRDBText;
    QRLabel79: TQRLabel;
    QRDBText70: TQRDBText;
    QRLabel80: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel81: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText75: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText76: TQRDBText;
    lbTarifa: TQRLabel;
    lbCuotaAnualEstimada: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape17: TQRShape;
    QRLabel62: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText62: TQRDBText;
    QRShape18: TQRShape;
    QRLabel86: TQRLabel;
    QRShape19: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    lbVigencia1: TQRLabel;
    lbSumaFija1: TQRLabel;
    lbPorcentajeVariable1: TQRLabel;
    lbPrimaTrabajador1: TQRLabel;
    lbPrimaAnual1: TQRLabel;
    lbVigencia2: TQRLabel;
    lbSumaFija2: TQRLabel;
    lbPorcentajeVariable2: TQRLabel;
    lbPrimaTrabajador2: TQRLabel;
    lbPrimaAnual2: TQRLabel;
    lbVigencia3: TQRLabel;
    lbSumaFija3: TQRLabel;
    lbPorcentajeVariable3: TQRLabel;
    lbPrimaTrabajador3: TQRLabel;
    lbPrimaAnual3: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel18: TQRLabel;
    lbCantidadPeriodosConDeuda: TQRLabel;
    lbCantidadPeriodosSinDDJJ: TQRLabel;
    label2: TQRLabel;
    lbTituloPorcentajeRebaja: TQRLabel;
    lbTituloRebajaRespectoPrimaAnualActual: TQRLabel;
    lbPorcentajeRebaja: TQRLabel;
    lbRebajaRespectoPrimaAnualActual: TQRLabel;
    lbParaMedirAncho: TQRLabel;
    QRLabel85: TQRLabel;
    QRDBText13: TQRDBText;
    bInformacionComplementaria: TQRStringsBand;
    shInformacionComplementaria: TQRShape;
    memoInformacionComplementaria: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText23: TQRDBText;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure QRDBText25Print(Sender: TObject; var Value: String);
    procedure QRDBText7Print(Sender: TObject; var Value: String);
    procedure QRDBText31Print(Sender: TObject; var Value: String);
    procedure bTarifariosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText46Print(Sender: TObject; var Value: String);
    procedure QRDBText64Print(Sender: TObject; var Value: String);
    procedure QRDBText65Print(Sender: TObject; var Value: String);
    procedure bAutorizacionComercialBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bAutorizacionCobranzasOLegalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText66Print(Sender: TObject; var Value: String);
    procedure bTarifaPendienteBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText61Print(Sender: TObject; var Value: String);
    procedure lbTarifaPrint(Sender: TObject; var Value: String);
    procedure lbCuotaAnualEstimadaPrint(Sender: TObject; var Value: String);
    procedure QRLabel64Print(Sender: TObject; var Value: String);
    procedure QRDBText19Print(Sender: TObject; var Value: String);
    procedure bPrincipalBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bMasDatosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bValoresCotizadosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText13Print(Sender: TObject; var Value: String);
    procedure bInformacionComplementariaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FMasaSalarial: Extended;
    FSector: Integer;
    FTrabajadores: Integer;
  public
    procedure Imprimir(const aRevisionId, aSector: Integer);
  end;

const
  COEFICIENTE_ANCHO: Extended = 2.646;

var
  qrRevisionPrecio: TqrRevisionPrecio;

implementation

uses
  unVisualizador, CUIT, unCotizacion, Strfuncs, AnsiSql, unDmPrincipal, General;

{$R *.DFM}

procedure TqrRevisionPrecio.Imprimir(const aRevisionId, aSector: Integer);
begin
  FSector := aSector;

  with sdqConsulta do
  begin
    ParamByName('id').AsInteger := aRevisionId;
    Open;

    FMasaSalarial := FieldByName('hc_masatotalmayorcero').AsFloat;
    FTrabajadores := FieldByName('hc_totempleadosmayorcero').AsInteger;

    if Pos('SOLICITUD', UpperCase(FieldByName('motivosolicitud').AsString)) > 0 then
      lbTitulo.Caption := UCase(FieldByName('motivosolicitud').AsString)
    else
      lbTitulo.Caption := 'SOLICITUD DE ' + UCase(FieldByName('motivosolicitud').AsString);
  end;

  Visualizar(Self, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;

procedure TqrRevisionPrecio.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    TFloatField(FieldByName('costofijo')).DisplayFormat                     := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('hc_masatotalmayorcero')).DisplayFormat         := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('limitessnmaximo')).DisplayFormat               := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('limitessnminimo')).DisplayFormat               := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('primapersona')).DisplayFormat                  := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('primapersonanueva')).DisplayFormat             := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_autocostofinal')).DisplayFormat             := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_autoporcvariable')).DisplayFormat           := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('sr_autosumafija')).DisplayFormat               := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_comision')).DisplayFormat                   := ',0.00 %;-,0.00 %';
    TFloatField(FieldByName('sr_costofijo')).DisplayFormat                  := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_costofijocompetencia')).DisplayFormat       := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_costofijocotizado')).DisplayFormat          := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_costofinalcompetencia')).DisplayFormat      := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_costofinalcotizado')).DisplayFormat         := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_costofinaltarifariossn')).DisplayFormat     := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_costovariablecompetencia')).DisplayFormat   := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('sr_cptma')).DisplayFormat                      := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_deuda')).DisplayFormat                      := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_masasalarial')).DisplayFormat               := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_masasalarial1')).DisplayFormat              := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_masasalarial2')).DisplayFormat              := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_masasalarial3')).DisplayFormat              := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_porcentajevariable')).DisplayFormat         := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('sr_porcentajevariablecotizado')).DisplayFormat := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('sr_porcvariablependiente')).DisplayFormat      := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('sr_porcvariabletarifariossn')).DisplayFormat   := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('sr_sumafijapendiente')).DisplayFormat          := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_sumafijatarifariossn')).DisplayFormat       := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_totalfijocompetencia')).DisplayFormat       := '$ ,0.00;-$ ,0.00';
    TFloatField(FieldByName('sr_totalvariablecompetencia')).DisplayFormat   := ',0.000 %;-,0.000 %';
    TFloatField(FieldByName('sueldopromedio')).DisplayFormat                := '$ ,0.00;-$ ,0.00';
  end;
end;

procedure TqrRevisionPrecio.QRDBText25Print(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TqrRevisionPrecio.QRDBText7Print(Sender: TObject; var Value: String);
begin
  if Trim(Value) = '' then
    Value := '-';
end;

procedure TqrRevisionPrecio.QRDBText31Print(Sender: TObject; var Value: String);
begin
  if sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_CERRADA_BIEN then
    Value := 'Cerrada - Revisión ingresada';
  if sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_PEND_COTIZ then
    Value := 'Pendiente de Revisión';
end;

procedure TqrRevisionPrecio.bTarifariosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (FSector = 2);   // Imprimo esta bando solo si el sector es técnica..
end;

procedure TqrRevisionPrecio.QRDBText46Print(Sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := Copy(Value, 1, 4) + '/' + Copy(Value, 5, 2);
end;

procedure TqrRevisionPrecio.QRDBText64Print(Sender: TObject; var Value: String);
begin
  if Value = '()' then
    Value := '-';
end;

procedure TqrRevisionPrecio.QRDBText65Print(Sender: TObject; var Value: String);
begin
  if Value = '()' then
    Value := '-';
end;

procedure TqrRevisionPrecio.bAutorizacionComercialBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (Trim(sdqConsulta.FieldByName('autorizocomercial').AsString) <> '');

  if PrintBand then
    with sdqConsulta do
    begin
      txtAutorizoComercial.Caption          := FieldByName('autorizocomercial').AsString;
      txtFechaAutorizacionComercial.Caption := FieldByName('au_fechaautorizacion').AsString;
      txtUsuarioAutorizoComercial.Caption   := FieldByName('usuarioautorizocomercial').AsString;
      memoObservacionesComercial.Lines.Text := FieldByName('observacioncomercial').AsString;
    end;
end;

procedure TqrRevisionPrecio.bInformacionComplementariaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbParaMedirAncho.Caption := sdqConsulta.FieldByName('sr_infocomplementaria').AsString;

  memoInformacionComplementaria.Height := Ceil(lbParaMedirAncho.Size.Width / COEFICIENTE_ANCHO / 712) * 17;

  shInformacionComplementaria.Height := memoInformacionComplementaria.Height + 20;
  bInformacionComplementaria.Height := memoInformacionComplementaria.Height + 112;
end;

procedure TqrRevisionPrecio.bAutorizacionCobranzasOLegalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sSql: String;
begin
  PrintBand := (Trim(sdqConsulta.FieldByName('autorizo').AsString) <> '');

  if PrintBand then
    with sdqConsulta do
    begin
      sSql :=
        'SELECT 1' +
         ' FROM aco_contrato' +
        ' WHERE co_contrato = :contrato' +
          ' AND co_idestudio IS NOT NULL';
      if ExisteSqlEx(sSql, [FieldByName('sr_contrato').AsInteger]) then
        lbTituloObservacionesCobranzaOLegales.Caption := 'Observaciones Legales'
      else
        lbTituloObservacionesCobranzaOLegales.Caption := 'Observaciones Cobranzas';

      txtAutorizo.Caption                  := IIF((FieldByName('deudafinal').AsFloat > 0), 'Sin', 'Con') + ' Pago de Deuda';
      txtFechaAutorizacion.Caption         := FieldByName('rd_fechaautorizacion').AsString;
      txtUsuarioAutorizo.Caption           := FieldByName('usuarioautorizocobranzas').AsString;
      memoObservacionesCobranza.Lines.Text := FieldByName('rd_observacioncobranza').AsString;
    end;
end;

procedure TqrRevisionPrecio.QRDBText66Print(Sender: TObject; var Value: String);
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM aco_contrato, aem_empresa' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_estado = 6' +
      ' AND co_motivobaja = ''08''' +
      ' AND em_cuit = :cuit';
  Value := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sr_cuit').AsString]);
end;

procedure TqrRevisionPrecio.bTarifaPendienteBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (sdqConsulta.FieldByName('sr_motivotarifapendiente').AsString <> '');
end;

procedure TqrRevisionPrecio.QRDBText61Print(Sender: TObject; var Value: String);
begin
  Value := 'Deuda al ' + Value;
end;

procedure TqrRevisionPrecio.lbTarifaPrint(Sender: TObject; var Value: String);
begin
  with sdqConsulta do
    Value := Format('$ %s + %s ($%s por trabajador)', [FormatFloat('#,##0.00', FieldByName('sr_costofijo').AsFloat),
                                                       FormatFloat('#,##0.000%', FieldByName('sr_porcentajevariable').AsFloat),
                                                       FormatFloat('#,##0.00', FieldByName('primapersona').AsFloat)]);
end;

procedure TqrRevisionPrecio.lbCuotaAnualEstimadaPrint(Sender: TObject; var Value: String);
begin
  with sdqConsulta do
    Value := Format('($%s cuota anual estimada)', [FormatFloat('#,##0.00', FieldByName('cuotaanualestimada').AsFloat)]);
end;

procedure TqrRevisionPrecio.QRLabel64Print(Sender: TObject; var Value: String);
begin
  Value := Value + ' ' + sdqConsulta.FieldByName('sr_vigenciatarifa').AsString;
end;

procedure TqrRevisionPrecio.QRDBText19Print(Sender: TObject; var Value: String);
begin
  Value := Value + Format(' (valores pendientes de acreditar $%s)', [FormatFloat('#,##0.00', sdqConsulta.FieldByName('sr_valorespendientesacredit').AsFloat)]);
end;

procedure TqrRevisionPrecio.bPrincipalBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  procedure ClearTarifa(const aNumeroTarifa: Integer);
  begin
    TQRLabel(FindComponent('lbVigencia' + IntToStr(aNumeroTarifa))).Caption           := ' - ';
    TQRLabel(FindComponent('lbSumaFija' + IntToStr(aNumeroTarifa))).Caption           := ' - ';
    TQRLabel(FindComponent('lbPorcentajeVariable' + IntToStr(aNumeroTarifa))).Caption := ' - ';
    TQRLabel(FindComponent('lbPrimaTrabajador' + IntToStr(aNumeroTarifa))).Caption    := ' - ';
    TQRLabel(FindComponent('lbPrimaAnual' + IntToStr(aNumeroTarifa))).Caption         := ' - ';
  end;

  procedure SetTarifa(const aNumeroTarifa: Integer; aFields: TFields);
  begin
    with aFields do
    begin
      TQRLabel(FindComponent('lbVigencia' + IntToStr(aNumeroTarifa))).Caption           := FieldByName('vigenciatarifa').AsString;
      TQRLabel(FindComponent('lbSumaFija' + IntToStr(aNumeroTarifa))).Caption           := FormatFloat('$ #,##0.00', FieldByName('costofijo').AsFloat);
      TQRLabel(FindComponent('lbPorcentajeVariable' + IntToStr(aNumeroTarifa))).Caption := FormatFloat('##0.000%', FieldByName('porcentajevariable').AsFloat);
      TQRLabel(FindComponent('lbPrimaTrabajador' + IntToStr(aNumeroTarifa))).Caption    := FormatFloat('$ #,##0.00', FieldByName('primapersona').AsFloat);
      TQRLabel(FindComponent('lbPrimaAnual' + IntToStr(aNumeroTarifa))).Caption         := FormatFloat('$ #,##0.00', FieldByName('cuotaanualestimada').AsFloat);
    end;
  end;

var
  eTmp: Extended;
  sSql: String;
begin
  // Traigo los datos de las 3 última tarifas según ticket 57198..

//El cálculo previo de la cuota anual estimada era (el actual se pone en marcha por el ticket 59671):             ' (ht_alicuotapesos - 0.6) * :empleados * 12 + (:masa / :empleados /(CASE WHEN rc_periodonomina IN(6, 12) THEN 1.5 ELSE 1 END)) * ht_porcmasa / 100 * :empleados * 13 cuotaanualestimada,' +
  sSql :=
    'SELECT   ht_alicuotapesos costofijo,' +
            ' ((:masa * ht_porcmasa / 100) * 13) + ((:empleados * ht_alicuotapesos) * 12) cuotaanualestimada,' +
            ' ht_porcmasa porcentajevariable,' +
            ' ((:masa / :empleados * ht_porcmasa / 100) + ht_alicuotapesos) primapersona,' +
            ' ht_vigenciatarifa vigenciatarifa' +
       ' FROM aen_endoso, aht_historicotarifario, ahc_historicocontrato, ctb_tablas' +
      ' WHERE en_idhistoricotarifa = ht_id' +
        ' AND en_idhistoricocontrato = hc_id' +
        ' AND en_motivo = tb_codigo' +
        ' AND tb_clave = ''MOTEN''' +
        ' AND (   (    en_endoso = 0' +
                 ' AND en_movimiento = 0)' +
             ' OR (tb_especial1 = ''1''))' +
        ' AND en_contrato = :contrato' +
        ' AND hc_id <= :id' +
   ' ORDER BY en_endoso DESC, en_movimiento DESC';
  with GetQueryEx(sSql, [FMasaSalarial,
                         FTrabajadores,
                         FMasaSalarial,
                         IIF((FTrabajadores=0), 1, FTrabajadores),
                         sdqConsulta.FieldByName('sr_contrato').AsInteger,
                         sdqConsulta.FieldByName('sr_idhistoricocontrato').AsInteger]) do
  try
    // Tarifa 1..
    if not Eof then
    begin
      SetTarifa(1, Fields);
      Next;
    end
    else
      ClearTarifa(1);

    // Tarifa 2..
    if not Eof then
    begin
      SetTarifa(2, Fields);
      Next;
    end
    else
      ClearTarifa(2);

    // Tarifa 3..
    if not Eof then
    begin
      SetTarifa(3, Fields);
      Next;
    end
    else
      ClearTarifa(3);
  finally
    Free;
  end;


  // Traigo la cantidad de periodos con deuda..
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM zrc_resumencobranza' +
    ' WHERE rc_contrato = :contrato' +
      ' AND (rc_devengadocuota + rc_devengadofondo) - (rc_pagocuota + rc_pagofondo + rc_recuperocuota + rc_recuperofondo) > 0';
  lbCantidadPeriodosConDeuda.Caption := IntToStr(ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sr_contrato').AsInteger]));

  // Traigo la cantidad de periodos sin DDJJ..
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM zrc_resumencobranza' +
    ' WHERE rc_contrato = :contrato' +
      ' AND rc_gestionable <> ''N''';
  lbCantidadPeriodosSinDDJJ.Caption := IntToStr(ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sr_contrato').AsInteger]));


  // Mostrar porcentaje rebaja..
  lbTituloPorcentajeRebaja.Enabled := (sdqConsulta.FieldByName('sr_idmotivosolicitud').AsInteger in [1, 2, 3]);
  lbPorcentajeRebaja.Enabled := lbTituloPorcentajeRebaja.Enabled;
  lbTituloRebajaRespectoPrimaAnualActual.Enabled := lbTituloPorcentajeRebaja.Enabled;
  lbRebajaRespectoPrimaAnualActual.Enabled := lbTituloPorcentajeRebaja.Enabled;
  
  if sdqConsulta.FieldByName('sr_idmotivosolicitud').AsInteger in [1, 2, 3] then
  begin
    eTmp := (((sdqConsulta.FieldByName('sr_costofinalcompetencia').AsFloat - 0.6) / (sdqConsulta.FieldByName('primapersonanueva').AsFloat - 0.6)) - 1) * 100;
    lbPorcentajeRebaja.Caption := FormatFloat('##0.000%', eTmp);

    lbRebajaRespectoPrimaAnualActual.Caption := FormatFloat('$ #,##0.00', Abs(sdqConsulta.FieldByName('cuotaanualestimada').AsFloat * eTmp / 100));
  end;
end;

procedure TqrRevisionPrecio.bMasDatosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbParaMedirAncho.Caption := sdqConsulta.FieldByName('sr_observaciones').AsString;

  memoObservacionesDelAreaComercial.Height := Ceil(lbParaMedirAncho.Size.Width / COEFICIENTE_ANCHO / 712) * 17;

  shObservacionesDelAreaComercial.Height := memoObservacionesDelAreaComercial.Height + 20;
  bMasDatos.Height := memoObservacionesDelAreaComercial.Height + 316;
end;

procedure TqrRevisionPrecio.bValoresCotizadosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbParaMedirAncho.Caption := sdqConsulta.FieldByName('observacionestecnica').AsString;

  memoObservacionesDelAreaTecnica.Height := Ceil(lbParaMedirAncho.Size.Width / COEFICIENTE_ANCHO / 712) * 17;

  shObservacionesDelAreaTecnica.Height := memoObservacionesDelAreaTecnica.Height + 20;
  bValoresCotizados.Height := memoObservacionesDelAreaTecnica.Height + 112;
end;

procedure TqrRevisionPrecio.QRDBText13Print(Sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := Copy(Value, 1, 4) + '/' + Copy(Value, 5, 2);
end;

end.
