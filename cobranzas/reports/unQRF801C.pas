unit unQRF801C;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, jpeg, Db, SDEngine,
     unComunes;
             
type
  TQRF801C = class(TQuickRep)
    sdqDestinatario: TSDQuery;
    sdqPeriodos: TSDQuery;
    QRBandDatos: TQRBand;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    qrdbPeriodo: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRMemo3: TQRMemo;
    QRLabel2: TQRLabel;
    qrdbCuit: TQRDBText;
    QRLabel3: TQRLabel;
    qrdbDestinatario: TQRDBText;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    qrdbDomicDestinatario: TQRDBText;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel5: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape11: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape13: TQRShape;
    QRLabel9: TQRLabel;
    QRShape14: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape15: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape16: TQRShape;
    QRLabel14: TQRLabel;
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape20: TQRShape;
    QRLabel19: TQRLabel;
    QRShape22: TQRShape;
    QRLabel21: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape21: TQRShape;
    QRShape29: TQRShape;
    QRLabel29: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel32: TQRLabel;
    QRShape32: TQRShape;
    QRLabel34: TQRLabel;
    QRShape33: TQRShape;
    QRLabel30: TQRLabel;
    QRShape34: TQRShape;
    QRLabel31: TQRLabel;
    QRShape35: TQRShape;
    QRLabel33: TQRLabel;
    QRShape36: TQRShape;
    QRLabel35: TQRLabel;
    QRShape37: TQRShape;
    QRLabel36: TQRLabel;
    QRShape38: TQRShape;
    QRLabel37: TQRLabel;
    QRShape39: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape40: TQRShape;
    QRLabel40: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel41: TQRLabel;
    QRShape43: TQRShape;
    QRLabel42: TQRLabel;
    QRShape44: TQRShape;
    QRLabel43: TQRLabel;
    QRShape45: TQRShape;
    QRLabel44: TQRLabel;
    QRShape46: TQRShape;
    QRLabel45: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape56: TQRShape;
    qrdbTotal: TQRDBText;
    QRLabel54: TQRLabel;
    qrlPesos: TQRLabel;
    procedure qrdbTotalPrint(sender: TObject; var Value: String);
  private
  public
  end;

  function Do_ImprimirF801C(Contrato: Integer; FechaInteres: TDateTime; TotalPeriodos: Boolean; Archivo: String = ''): Boolean;

implementation

uses
  unDmPrincipal, AnsiSql, StrFuncs, Numeros, unVisualizador, unExportPDF, General;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
function Do_ImprimirF801C(Contrato: Integer; FechaInteres: TDateTime; TotalPeriodos: Boolean; Archivo: String = ''): Boolean;
var
  sSqlSelBase, sSqlWhereBase, sUltPeriodo, sSqlPer: String;
  rpt: TQRF801C;
begin
  Result := False;

  rpt := TQRF801C.Create( Application );
  with rpt do
    try
      sSqlSelBase := 'SELECT RC_CONTRATOPRINCIPAL CONTRATO, RC_PERIODO PERIOD, ' +
                            'RC_IMPORTERECLAMADO IMPORTERECLAMADO, ' +
                            'DEUDA.GET_TASAACUMULADA(DEUDA.GET_VENCIMIENTOCUOTACONTRATO(RC_CONTRATO, RC_PERIODO)+1,' + SqlValue( FechaInteres ) + ') TASAINTERES, ' +
                            '(RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOOTROS)-' +
                            '(RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO)-RC_IMPORTERECLAMADO-RC_MONTOREFINANCIADO DEUDA, ' +
                            'COBRANZA.GETSALDOINTERESES(RC_CONTRATO, RC_PERIODO) SALDOINTERESES ' +
                       'FROM AEM_EMPRESA, ACO_CONTRATO, ZRC_RESUMENCOBRANZA_EXT ' +
                      'WHERE RC_CONTRATO=CO_CONTRATO ' +
                        'AND RC_PRESCRIPTO = ''N'' ' +
                        'AND CO_IDEMPRESA=EM_ID ' +
                        'AND RC_PERIODO>=DEUDA.GET_PRIMERPERIODOCONSIDDEUDA(RC_CONTRATO) ' +
                        'AND RC_CODTIPOREGIMEN = ''RG'' ' +
                        'AND RC_CONTRATOPRINCIPAL=' + SqlValue( Contrato );

      sSqlWhereBase := 'WHERE ROUND(DEUDA*TASAINTERES/100, 2)+SALDOINTERESES>0 ' +
                         'AND TASAINTERES>0 ';

      sSqlPer := 'SELECT PERIOD ' +
                   'FROM ( ' + sSqlSelBase + ') ' +
                  sSqlWhereBase +
                  'ORDER BY PERIOD DESC';

      // wf 3197/3336: se pide calcular los intereses hasta el penúltimo periodo con deuda
      sUltPeriodo := '';
      with GetQuery( sSqlPer ) do
        try
          if not Eof then
            begin
              Next;

              if Eof then
                Prior;

              sUltPeriodo := FieldByName( 'PERIOD' ).AsString;
            end;
        finally
          Free;
        end;

      if sUltPeriodo <> '' then
        begin
          if TotalPeriodos then
            sSqlPer := 'SELECT SUBSTR(' + SqlValue(sUltPeriodo) + ', 5, 2) PER_MES, ' +
                              'SUBSTR(' + SqlValue(sUltPeriodo) + ', 1, 4) PER_ANIO, ' +
                              'SUM(ROUND(DEUDA*TASAINTERES/100, 2)+SALDOINTERESES) TOTAL ' +
                         'FROM (' + sSqlSelBase + ') ' +
                        sSqlWhereBase +
                        'ORDER BY PERIOD'
          else
            sSqlPer := 'SELECT SUBSTR(PERIOD, 5, 2) PER_MES, ' +
                              'SUBSTR(PERIOD, 1, 4) PER_ANIO, ' +
                              'ROUND(DEUDA*TASAINTERES/100, 2)+SALDOINTERESES TOTAL ' +
                         'FROM (' + sSqlSelBase + ') ' +
                        sSqlWhereBase +
                        'ORDER BY PERIOD';

          // cargo datos de la empresa (destinatario)
          sdqDestinatario.Params[0].Value := Contrato;
          OpenQuery( sdqDestinatario );

          // cargo periodos
          sdqPeriodos.Sql.Text := sSqlPer;
          OpenQuery( sdqPeriodos );

          if sdqPeriodos.RecordCount > 0 then
            begin
              if Archivo = '' then
                Visualizar( rpt, GetValores( '', '', Contrato ), [oForceDB, oForceShowModal, oAlwaysShowDialog], True, '', '', True )
              else
                FileToPDFSvr( rpt, ExtractFileDir(Archivo), Archivo );

              Result := True;
            end;
        end;
    finally
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQRF801C.qrdbTotalPrint(sender: TObject; var Value: String);
var
  sImporte: String;
begin
  sImporte := NumLetras( StrToFloat( Nvl(Value, '0') ), 2, True );
  qrlPesos.Caption := sImporte;

  Value := Get_AjusteDecimales( Value, '$' );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

