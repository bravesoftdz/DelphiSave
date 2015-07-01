unit unRptIncapacidadRecibo;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, unQRLabelEx,
  ArtQReports, unComunes;

type
  TqrIncapacidadRecibo = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrbTitle: TQRBand;
    qrbPageFooter: TQRBand;
    qrbDetail: TQRBand;
    sdqConsulta: TSDQuery;
    qrlNota1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabelEx2: TQRLabelEx;
    qrlFirmas: TQRLabel;
    QRLabelEx8: TQRLabelEx;
    QRLabelEx11: TQRLabelEx;
    QRLabelEx16: TQRLabelEx;
    qrlItem0: TQRLabel;
    qrlItem2: TQRLabel;
    qrlItem3: TQRLabel;
    qrlItem4: TQRLabel;
    qrlItem1: TQRLabel;
    qrlItem5: TQRLabel;
    qrdbItem0: TQRDBText;
    qrdbItem1: TQRDBText;
    qrdbItem5: TQRDBText;
    qrdbItem2: TQRDBText;
    qrdbItem3: TQRDBText;
    qrdbItem4: TQRDBText;
    qrexpItem2: TQRDBText;
    qrexpItem3: TQRDBText;
    qrexpItem4: TQRDBText;
    sdqConsultaA: TStringField;
    sdqConsultaB: TStringField;
    sdqConsultaC: TStringField;
    sdqConsultaD: TStringField;
    sdqConsultaE: TStringField;
    sdqConsultaF: TStringField;
    sdqConsultaG: TStringField;
    sdqConsultaH: TStringField;
    sdqConsultaI: TStringField;
    sdqConsultaJ: TDateTimeField;
    sdqConsultaK: TDateTimeField;
    sdqConsultaL: TDateTimeField;
    sdqConsultaM: TFloatField;
    sdqConsultaN: TFloatField;
    sdqConsultaO: TFloatField;
    sdqConsultaP: TFloatField;
    sdqConsultaQ: TFloatField;
    sdqConsultaR: TFloatField;
    sdqConsultaMQRS: TFloatField;
    sdqConsultaMN: TFloatField;
    sdqConsultaMO: TFloatField;
    sdqConsultaMP: TFloatField;
    sdqConsultaMNMOMP: TFloatField;
    sdqConsultaTOTALNETO: TFloatField;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    sdqConsultaPERIODO: TStringField;
    sdqConsultaFDEPOSITO: TDateTimeField;
    qriFirma: TQRImage;
    qrlFirmante: TArtQRLabel;
    qrlCaracter: TArtQRLabel;
    qriLogo: TQRImage;
    qrlTitulo: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabelEx25: TQRLabelEx;
    QRLabelEx36: TQRLabelEx;
    QRLabelEx37: TQRLabelEx;
    QRLabelEx38: TQRLabelEx;
    QRLabel26: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabelEx10: TQRLabelEx;
    QRLabelEx28: TQRLabelEx;
    QRLabelEx39: TQRLabelEx;
    QRLabelEx40: TQRLabelEx;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabelEx41: TQRLabelEx;
    QRLabelEx42: TQRLabelEx;
    QRLabelEx43: TQRLabelEx;
    QRLabelEx44: TQRLabelEx;
    QRLabelEx45: TQRLabelEx;
    QRLabelEx46: TQRLabelEx;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabelEx3: TQRLabelEx;
    QRLabelEx4: TQRLabelEx;
    QRLabelEx6: TQRLabelEx;
    QRLabelEx5: TQRLabelEx;
    qrlRetenciones: TQRLabel;
    qrlNota3: TQRLabel;
    qrlNota2: TQRLabel;
    QRLabelEx31: TQRLabelEx;
    qrlTotalNetoEnLetras: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabelEx13: TQRLabelEx;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabelEx14: TQRLabelEx;
    QRLabelEx17: TQRLabelEx;
    QRLabel24: TQRLabel;
    QRLabelEx1: TQRLabelEx;
    QRLabelEx7: TQRLabelEx;
    sdqConsultaTJ_LOCALIDAD: TStringField;
    qrPorcItem2: TQRLabel;
    qrPorcItem3: TQRLabel;
    qrPorcItem4: TQRLabel;
    sdqConsultaBASEMENSUAL: TFloatField;
    sdqConsultaHIJOS: TFloatField;
    sdqConsultaLE_PORCINCAPACIDAD: TFloatField;
    sdqConsultaCP_TITPAGO: TStringField;
    qrlDeposito: TQRLabel;
    sdqConsultaLE_METODOPAGO: TStringField;
    sdqConsultaLE_ENVIOFONDOS: TStringField;
    sdqConsultaLE_IDBANCO: TFloatField;
    sdqConsultaLE_IMPORPERI: TFloatField;
    sdqConsultaS: TFloatField;
    sdqConsultaRS: TFloatField;
    qrshImpuesto: TQRShape;
    qrlImpuesto: TQRLabel;
    sdqConsultaLE_TIPOLIQUI: TStringField;
    qrshRECPD: TQRShape;
    qrlRECPD: TQRLabel;
    qrlItem6: TQRLabel;
    qrexpItem6: TQRDBText;
    sdqConsultaLE_MONTOCOMPENSADO: TFloatField;
    sdqConsultaRESTA_SALDO: TFloatField;
    qrlCodigoBarras: TQRLabel;
    qrlNroExpediente: TQRLabel;
  private
    procedure SetFirmaVisible(AVisible: Boolean);
    procedure ClearFirma;
    procedure LoadFirma;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Preparar(iSiniestro, iOrden, iRecaida, iNroLiquidacion, CantCopias: Integer;
                       Tipo: string; TipoSalida: TSalidaReport = srPreview; Titulo :String = '');
  end;

implementation

uses
  unPrincipal, Numeros, unVisualizador, AnsiSql, unDmPrincipal, Printers, Strfuncs,
  VCLExtra, General, unDinerarias;

{$R *.DFM}
{------------------------------------------------------------------------------}
constructor TqrIncapacidadRecibo.Create(AOwner: TComponent);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TqrIncapacidadRecibo.Preparar(iSiniestro, iOrden, iRecaida, iNroLiquidacion, CantCopias: Integer;
                                        Tipo: string; TipoSalida: TSalidaReport = srPreview; Titulo: String = '');
var
  LABELS: array [0..3] of string;
  sFirma, sSql, sPorc, sNroExpediente: String;
  MontoINSSJP: Currency;
  bEsSinGobernacion :Boolean;
  iIdExped: integer;
{----------------------------Internal Procedure--------------------------------}
  procedure ReAcomodar(nRenglon: byte);
  const
    ALTURA_RENGLON = 26;
  var
    i, j: byte;
  begin
    for j := Low(LABELS) to High(LABELS) do
    begin
      if Assigned(FindComponent(LABELS[j] + IntToStr(nRenglon))) then
        TQRCustomLabel(FindComponent(LABELS[j] + IntToStr(nRenglon))).Enabled := False;
      for i := (nRenglon + 1) to 4 do
        if Assigned(FindComponent(LABELS[j] + IntToStr(i))) then
          TQRCustomLabel(FindComponent(LABELS[j] + IntToStr(i))).Top := TQRCustomLabel(FindComponent(LABELS[j] + IntToStr(i))).Top - ALTURA_RENGLON;
    end;
  end;
{----------------------------Internal Procedure--------------------------------}
begin

  PrinterSettings.Copies       := CantCopias;
  PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

  sSql := 'SELECT NVL(liq.get_montoinssjp(:Sin, :Ord, :Reca, :Liq), 0) FROM dual';
  MontoINSSJP := ValorSqlExtendedEx(sSql, [iSiniestro, iOrden, iRecaida, iNroLiquidacion]);

  with sdqConsulta do
  begin
    Sql.Text := 'SELECT UTILES.Armar_CUIT(EX_CUIL) A, TJ_NOMBRE B, TJ_DOCUMENTO C, ' +
                       'TJ_LOCALIDAD, LE_IBASEDIARIA * dinerarias.get_diaspormes(ex_fechaaccidente) BASEMENSUAL , ' +
                       'UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, ''-'') D, ' +
                       'EM_NOMBRE E, UTILES.Armar_CUIT(EX_CUIT) F, ' +
                       'DECODE(CP_TIPO, ''I'', ''TEMPORAL'',''P'',''PERMANENTE'') G, ' +
                       'DECODE(CP_GRADO,''P'',''PARCIAL'',''T'',''TOTAL'',NULL) H, ' +
                       'DECODE(CP_CARACTER,''P'',''PROVISORIO'',''D'',''DEFINITIVO'',NULL) I, ' +
                       'EX_FECHAACCIDENTE J, LE_FECHADES K, LE_FECHAHAS L, ' +
                       'NVL(LE_SUBTOTAL, 0) M, NVL(LE_PTJUBILA, 0) N, ' +
                       'NVL(LE_PTINSSJP, 0) O, NVL(LE_PTOSOCIAL, 0) P, ' +
                       'NVL(LE_ASIGFAMILIAR, 0) Q, NVL(LE_PLUSAMPO, 0) R, ' +
                       'NVL(LE_SUBTOTALNOREM, 0) S, ' +
                       'NVL(LE_PLUSAMPO, 0) +  NVL(LE_SUBTOTALNOREM, 0) RS, ' +
                       'NVL(LE_SUBTOTAL, 0) + NVL(LE_ASIGFAMILIAR, 0) + NVL(LE_PLUSAMPO, 0) + NVL(LE_SUBTOTALNOREM, 0) MQRS, ' +
                       'NVL(LE_SUBTOTAL, 0) * NVL(LE_PTJUBILA, 0) / 100 MN, ' +
                       ':MONTOINSSJP  MO, ' +
                     //  'NVL(LE_SUBTOTAL, 0) * NVL(LE_PTOSOCIAL, 0) / 100 MP, ' +     // cambiado por ticket 63054
                       'NVL(LE_ICONTRA, 0) MP, '  +                                    // cambiado por ticket 63054
                       '(NVL(LE_SUBTOTAL, 0) * NVL(LE_PTJUBILA, 0) / 100) + ' +
                       ':MONTOINSSJP + ' +
                       '(NVL(LE_SUBTOTAL, 0) * NVL(LE_PTOSOCIAL, 0) / 100) + ' +
                       '(NVL(LE_MONTOCOMPENSADO, 0))  MNMOMP, ' +                  // por plan
                       'NVL(LE_SUBTOTAL, 0) + NVL(LE_ASIGFAMILIAR, 0) + NVL(LE_PLUSAMPO, 0) + ' +
                       'NVL(LE_SUBTOTALNOREM, 0) - (NVL(LE_SUBTOTAL, 0) * NVL(LE_PTJUBILA, 0) / 100) - ' +
                       ':MONTOINSSJP - (NVL(LE_SUBTOTAL, 0) * NVL(LE_PTOSOCIAL, 0) / 100) TOTALNETO, ' +
                       'UTILES.PERIODO_PONERBARRA(TO_CHAR(LE_FPROCESO, ''YYYYMM'')) PERIODO, ' +
                       'LIQ.GET_FECHAAPORTEJUBILATORIO(TO_CHAR(LE_FPROCESO, ''YYYYMM'')) FDEPOSITO, ' +
                       'CB_CANTHIJOS + CB_CANTHIJOSDISCAP HIJOS, LE_PORCINCAPACIDAD, ' +
                       'CP_TITPAGO, LE_METODOPAGO, LE_ENVIOFONDOS, LE_IDBANCO, ' +
                       'LE_IMPORPERI, LE_TIPOLIQUI, NVL(LE_MONTOCOMPENSADO, 0) LE_MONTOCOMPENSADO, NVL((LE_IMPORPERI - LE_MONTOCOMPENSADO), 0) RESTA_SALDO ' +     // por plan
                  'FROM CTJ_TRABAJADOR, SEX_EXPEDIENTES, AEM_EMPRESA, SCP_CONPAGO, ' +
                      ' SLE_LIQUIEMPSIN, SECB_CBASEEXPSIN ' +
                 'WHERE LE_SINIESTRO = EX_SINIESTRO ' +
                   'AND LE_ORDEN = EX_ORDEN ' +
                   'AND LE_RECAIDA = EX_RECAIDA ' +
                   'AND LE_SINIESTRO = CB_SINIESTRO(+) ' +
                   'AND LE_ORDEN = CB_ORDEN(+) ' +
                   'AND EX_CUIL = TJ_CUIL ' +
                   'AND EM_CUIT = EX_CUIT ' +
                   'AND LE_CONPAGO = CP_CONPAGO ' +
                   'AND LE_SINIESTRO = :SINIESTRO ' +
                   'AND LE_ORDEN = :ORDEN ' +
                   'AND LE_RECAIDA = :RECAIDA ' +
                   'AND LE_NUMLIQUI = :NROLIQUIDACION ';

    ParamByName('MONTOINSSJP').AsFloat      := MontoINSSJP;
    ParamByName('SINIESTRO').AsInteger      := iSiniestro;
    ParamByName('ORDEN').AsInteger          := iOrden;
    ParamByName('RECAIDA').AsInteger        := iRecaida;
    ParamByName('NROLIQUIDACION').AsInteger := iNroLiquidacion;
    Open;

    if IsEmpty then
    begin
      Self.Free;
      Exit;
    end;
  end;

  LABELS[0] := 'qrlItem';
  LABELS[1] := 'qrdbItem';
  LABELS[2] := 'qrexpItem';
  LABELS[3] := 'qrPorcItem';

  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    qrlEmpDep.Caption := 'DEPENDENCIA GPBA';
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    qrlEmpDep.Caption := 'EMPLEADOR';
  end;

  if (sdqConsulta.FieldByName('le_porcincapacidad').AsFloat > 0) then
    sPorc := ' (' + sdqConsulta.FieldByName('le_porcincapacidad').AsString + '%)';

  qrlItem0.Caption              := 'Prestación dineraria remunerativa por ' + sdqConsulta.FieldByName('cp_titpago').AsString + sPorc;
  if (Titulo <> '') then
    qrlTitulo.Caption           := 'RECIBO DE LIQUIDACION DE ' + Ucase(Titulo);
  qrlItem1.Caption              := IIF(sdqConsultaQ.AsFloat > 0, 'Asignaciones familiares (hijos: ' + sdqConsulta.FieldByName('hijos').AsString + ')', '');
  qrlTotalNetoEnLetras.Caption  := NumLetras(sdqConsultaTOTALNETO.AsFloat, 2, True);

  if sdqConsultaN.AsFloat = 0 then
    ReAcomodar(2);

  if sdqConsultaO.AsFloat = 0 then
    ReAcomodar(3);

  if sdqConsultaP.AsFloat = 0 then
    ReAcomodar(4);

  if sdqConsultaQ.AsFloat = 0 then
    ReAcomodar(1);

  if sdqConsultaRS.AsFloat = 0 then
    ReAcomodar(5);

  if sdqConsultaLE_MONTOCOMPENSADO.AsFloat = 0 then
    ReAcomodar(6);

  qrlItem5.Caption := IIF(sdqConsultaS.AsFloat <> 0,
                          'Prestación dineraria no remunerativa por ' + sdqConsulta.FieldByName('cp_titpago').AsString + sPorc,
                          'Gran invalidez');

  if not sdqConsulta.IsEmpty then
  begin
    try
      if Tipo = 'A' then
      begin
        sFirma := 'FIRMA DEL ACCIDENTADO';
        ClearFirma;
      end
      else begin
        if bEsSinGobernacion then
        begin
          sFirma := 'FIRMA ' + ART_NOMBRE2 + #13#10 + ART_ADMIN;
         // qrlFirmas.Top := 23;
         // qrlFirmas.Height := 39;
        end
        else
          sFirma := 'FIRMA ' + ART_NOMBRE2;
        LoadFirma;
      end;
      LockControls([qrlNota1, qrlNota2, qrlNota3], (Tipo <> 'A'));

      qrlFirmas.Caption   := sFirma;

      if (sdqConsultaLE_METODOPAGO.AsString = 'DC') then
        qrlDeposito.Caption := 'El importe de la presente liquidación ha sido depositado en ' + sdqConsultaLE_ENVIOFONDOS.AsString
      else if (sdqConsultaLE_METODOPAGO.AsString = 'TR') and (sdqConsultaLE_IDBANCO.AsInteger = BANCO_PROVINCIA) then
        qrlDeposito.Caption := 'EL IMPORTE DE LA PRESENTE LIQUIDACION ESTARA DISPONIBLE POR LOS PROXIMOS 60 DIAS '  +
                               'EN EL ' + sdqConsultaLE_ENVIOFONDOS.AsString
      else
        qrlDeposito.Caption := '';

      sNroExpediente := lpad(iSiniestro, '0', 8) + lpad(iOrden, '0', 2) +
                        lpad(iRecaida, '0', 2) + lpad(iNroLiquidacion, '0', 3);
      qrlNroExpediente.Caption := sNroExpediente;
      qrlCodigoBarras.Caption := '*' + sNroExpediente + '*';

      case TipoSalida of
        srPreview: Visualizar(Self, GetValores(' - ' + sFirma), [oMailNotAllowed]);
        srPrint:   Print;
      end;

    except
      Free;
    end;
  end
  else
    Free;
end;
{------------------------------------------------------------------------------}
procedure TqrIncapacidadRecibo.SetFirmaVisible(AVisible: Boolean);
begin
  qrlFirmante.Visible := AVisible;
  qrlCaracter.Visible := AVisible;
  qriFirma.Enabled    := AVisible;
end;
{------------------------------------------------------------------------------}
procedure TqrIncapacidadRecibo.ClearFirma;
begin
  qrlFirmante.Caption := ' ';
  qrlCaracter.Caption := ' ';
  SetFirmaVisible( False );
end;
{------------------------------------------------------------------------------}
procedure TqrIncapacidadRecibo.LoadFirma;
var
  sSql: String;
begin
  sSql := 'SELECT fi_firmante, fi_caracter, fi_firma ' +
            'FROM cfi_firma ' +
           'WHERE fi_id = :IdFirma ';
  with GetQueryEx(sSql, [Get_FirmanteResponsablePrestaciones]) do
  try
    if Eof then
      ClearFirma
    else begin
      SetFirmaVisible(True);
      qrlFirmante.Caption := FieldByName('fi_firmante').AsString;
      qrlCaracter.Caption := FieldByName('fi_caracter').AsString;

      if not FieldByName('fi_firma').IsNull then
        qriFirma.Picture.Assign(FieldByName('fi_firma'));
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
end.
