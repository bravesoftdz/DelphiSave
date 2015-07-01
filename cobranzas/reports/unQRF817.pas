unit unQRF817;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, unArt,
  unComunes, Db, SDEngine;

type
  TQRF817 = class(TQuickRep)
    sdqPeriodos: TSDQuery;
    sdqDestinatario: TSDQuery;
    QRBandDatos: TQRBand;
    qrdbCuit: TQRDBText;
    qrdbDestinatario: TQRDBText;
    qrdbDomicDestinatario: TQRDBText;
    qrdbPeriodo: TQRDBText;
    qrdbTotal: TQRDBText;
    QRLabel1: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape2: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRMemo2: TQRMemo;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    QRShape13: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape17: TQRShape;
    QRLabel14: TQRLabel;
    QRShape22: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape27: TQRShape;
    QRShape18: TQRShape;
    qrbHeader: TQRBand;
    qrlTitulo: TQRLabel;
    procedure qrdbTotalPrint(Sender: TObject; var Value: String);
    procedure QRBandDatosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBandDatosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
  public
  end;

  function Do_ImprimirF817(const aIdCarta: TTableId; aContrato: Integer; const aAction: TSalidaReport = srPrint;
                           const aCantidadCopias: Integer = -1; const aArchivo: String = '';
                           const aIdEventoTraspasoIngreso: Integer = 0; const aIdCompensacion: TTableId = ART_EMPTY_ID): Boolean;

implementation

uses
  unDmPrincipal, AnsiSql, StrFuncs, unVisualizador, unExportPDF;

var
  pbMasivoIdCompensacion: Boolean;
  psUltCuit: String;

{$R *.DFM}

function Do_ImprimirF817(const aIdCarta: TTableId; aContrato: Integer; const aAction: TSalidaReport = srPrint;
                         const aCantidadCopias: Integer = -1; const aArchivo: String = '';
                         const aIdEventoTraspasoIngreso: Integer = 0; const aIdCompensacion: TTableId = ART_EMPTY_ID): Boolean;
var
  rpt: TQRF817;
  sSql: String;
  sSqlPer: String;
begin
  Result    := False;
  psUltCuit := '';
  pbMasivoIdCompensacion := False;

  rpt := TQRF817.Create(Application);
  with rpt do
  try
    if aIdEventoTraspasoIngreso > 0 then    // Si se manda algo en el parámetro aIdEventoTraspasoIngreso es porque se quiere
    begin                                   // imprimir una boleta para un evento de traspaso ingreso desde Afiliaciones..
      sSqlPer :=
        'SELECT SUBSTR(ART.UTILES.PERIODO_ANTERIOR(TI_PERIODO, 2), 5, 2) PER_MES,' +
              ' SUBSTR(ART.UTILES.PERIODO_ANTERIOR(TI_PERIODO, 2), 1, 4) PER_ANIO,' +
              ' TI_DEUDA TOTAL' +
         ' FROM ATI_TRASPASOINGRESO' +
        ' WHERE TI_ID = ' + SqlValue(aIdEventoTraspasoIngreso);

      sdqDestinatario.SQL.Text :=
        'SELECT UTILES.ARMAR_CUIT(SA_CUIT) CUIT, SA_NOMBRE DESTINATARIO,' +
              ' UTILES.ARMAR_DOMICILIO(SA_CALLE, SA_NUMERO, SA_PISO, SA_DEPARTAMENTO) || '' - ''' +
              ' || UTILES.ARMAR_LOCALIDAD(SA_CPOSTAL, SA_CPOSTALA, SA_LOCALIDAD) || '' - '' || PV_DESCRIPCION DOMICDESTINATARIO' +
         ' FROM ATI_TRASPASOINGRESO, ASA_SOLICITUDAFILIACION, CPV_PROVINCIAS' +
        ' WHERE TI_IDFORMULARIO = SA_IDFORMULARIO' +
          ' AND SA_PROVINCIA = PV_CODIGO(+)' +
          ' AND TI_ID = :id';
      aContrato := aIdEventoTraspasoIngreso;
    end
    else if aIdCarta <> ART_EMPTY_ID then   // por id de Carta
    begin
      sSql :=
        'SELECT EN_CONTRATO' +
         ' FROM AEN_ENDOSO, CCA_CARTA' +
        ' WHERE CA_IDENDOSO = EN_ID' +
          ' AND CA_ID = :idcarta';
      aContrato := ValorSqlIntegerEx(sSql, [aIdCarta]);

      sSqlPer :=
        'SELECT   SUBSTR(IN_PERIODO, 5, 2) PER_MES, SUBSTR(IN_PERIODO, 1, 4) PER_ANIO, IN_TOTAL TOTAL' +
           ' FROM ZIN_INTIMACIONPLAN, ZSC_SELECCIONCONTRACCIONPLAN, ZCS_CONTRATOSELECCIONADOPLAN' +
          ' WHERE IN_IDSELCONTRACCIONPLAN = SC_ID' +
            ' AND SC_CONTRATO = CS_CONTRATO' +
            ' AND SC_IDSELECCIONPLAN = CS_IDSELECCIONPLAN' +
            ' AND CS_IDCARTAINTIMACION = ' + SqlValue(aIdCarta) +
       ' ORDER BY IN_PERIODO';
    end
    else if aIdCompensacion <> ART_EMPTY_ID then   // por id de Compensación
      begin
        sSqlPer :=
          'SELECT  SUBSTR(CD_PERIODO, 5, 2) PER_MES, SUBSTR(CD_PERIODO, 1, 4) PER_ANIO, CD_CUOTAAPLICAR + CD_FONDOAPLICAR TOTAL, ' +
                   'UTILES.ARMAR_CUIT(EM_CUIT) CUIT, EM_NOMBRE DESTINATARIO, ' +
                   'UTILES.ARMAR_DOMICILIO(DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO) || '' - '' || UTILES.ARMAR_LOCALIDAD(DC_CPOSTAL, DC_CPOSTALA, DC_LOCALIDAD) || '' - '' || PV_DESCRIPCION DOMICDESTINATARIO ' +
             'FROM CPV_PROVINCIAS, ADC_DOMICILIOCONTRATO, AEM_EMPRESA, ACO_CONTRATO, ZCD_COMPENSACIONDEUDA, ZCC_COMPENSACIONCONTRATO ' +
            'WHERE CC_ID = CD_IDCOMPENSACIONCONTRATO ' +
              'AND CC_IDCOMPENSACION = ' + SqlValue(aIdCompensacion) + ' ' +
              'AND CO_CONTRATO = CC_CONTRATO ' +
              'AND CO_IDEMPRESA = EM_ID ' +
              'AND CO_CONTRATO = DC_CONTRATO ' +
              'AND DC_TIPO = ''L'' ' +
              'AND DC_PROVINCIA = PV_CODIGO ' +
              'AND CD_CUOTAAPLICAR + CD_FONDOAPLICAR > 0 ' +
         'ORDER BY EM_CUIT, CD_PERIODO';

        aContrato              := aIdCompensacion;
        pbMasivoIdCompensacion := True;
      end
    else
    begin
      sSqlPer :=
        'SELECT   SUBSTR(PERIOD, 5, 2) PER_MES, SUBSTR(PERIOD, 1, 4) PER_ANIO, DEUDA TOTAL' +
           ' FROM (SELECT RC_CONTRATOPRINCIPAL CONTRATO, RC_PERIODO PERIOD, RC_IMPORTERECLAMADO IMPORTERECLAMADO,' +
                        ' (RC_DEVENGADOCUOTA + RC_DEVENGADOFONDO + RC_DEVENGADOOTROS)' +
                        ' -(RC_PAGOCUOTA + RC_PAGOFONDO + RC_PAGOOTROS + RC_RECUPEROCUOTA + RC_RECUPEROFONDO)' +
                        ' - RC_MONTOREFINANCIADO - RC_IMPORTERECLAMADO DEUDA' +
                   ' FROM ZRC_RESUMENCOBRANZA_EXT' +
                  ' WHERE RC_CONTRATOPRINCIPAL = ' + SqlValue(aContrato) +
                    ' AND RC_CODTIPOREGIMEN = ''RG'' ' +
                    ' AND RC_PRESCRIPTO = ''N'')' +
          ' WHERE DEUDA > 0' +
            ' AND PERIOD >= ART.DEUDA.GET_PRIMERPERIODOCONSIDDEUDA(CONTRATO)' +
            ' AND COBRANZA.IS_PERIODOCHEQUESRECHAZADOS(CONTRATO, PERIOD) = ''N''' +
       ' ORDER BY PERIOD';
    end;

    // cargo datos de la empresa (destinatario)
    if pbMasivoIdCompensacion then
      begin
        qrdbCuit.DataSet              := sdqPeriodos;
        qrdbDestinatario.DataSet      := sdqPeriodos;
        qrdbDomicDestinatario.DataSet := sdqPeriodos;

        qrlTitulo.Caption := 'Compensación Nº ' + IntToStr(aIdCompensacion);
      end
    else
      begin
        sdqDestinatario.Params[0].Value := aContrato;
        OpenQuery(sdqDestinatario);
      end;

    qrbHeader.Enabled := pbMasivoIdCompensacion;

    // cargo periodos
    sdqPeriodos.Sql.Text := sSqlPer;
    OpenQuery(sdqPeriodos);

    if sdqPeriodos.RecordCount > 0 then
    begin
      if aCantidadCopias <> -1 then
        PrinterSettings.Copies := aCantidadCopias;

      case aAction of
        srPrint:  Print;
        srPreview:
          if aArchivo = '' then
            Visualizar(rpt, GetValores('', '', aContrato), [oForceDB, oForceShowModal, oAlwaysShowDialog], True, '', '', True)
          else
            FileToPDFSvr( rpt, ExtractFileDir(aArchivo), aArchivo );
      end;

      Result := True;
    end;
  finally
    Free;
  end;
end;

procedure TQRF817.QRBandDatosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if pbMasivoIdCompensacion then
    psUltCuit := sdqPeriodos.FieldByName('CUIT').AsString;
end;

procedure TQRF817.QRBandDatosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRBandDatos.ForceNewPage := (pbMasivoIdCompensacion and (psUltCuit <> '') and (psUltCuit <> sdqPeriodos.FieldByName('CUIT').AsString));
end;

procedure TQRF817.qrdbTotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.
