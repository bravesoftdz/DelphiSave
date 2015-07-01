unit unDetalleCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArt, unDmFinancials;

type
  TfrmDetalleCheque = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    psListaNroOrdenesPago, psListaIdCheques: String;
  public
    class procedure DoCargarDetalleCheque(ListaIdCheques, ListaNroOrdenesPago: String);
  end;

const
  MAXCOLS = 1;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE', 'DEBITOS');

var
  frmDetalleCheque: TfrmDetalleCheque;
  TotalConsulta: Array of Extended;

implementation

uses
  AnsiSql, General, StrFuncs, DbFuncs, CustomDlgs, unDmPrincipal;
  
{$R *.dfm}

class procedure TfrmDetalleCheque.DoCargarDetalleCheque(ListaIdCheques, ListaNroOrdenesPago: String);
begin
  with TfrmDetalleCheque.Create(nil) do
    try
      psListaIdCheques      := ListaIdCheques;
      psListaNroOrdenesPago := ListaNroOrdenesPago;
      tbRefrescarClick(nil);

      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmDetalleCheque.tbRefrescarClick(Sender: TObject);
var
  sListaNroOrdenesPago, sSql: String;
  bListaNroOrdenesPago: Boolean;
begin
  sListaNroOrdenesPago := '';
  sSql := 'SELECT CE_IDFINANCIALS OP ' +
            'FROM RCE_CHEQUEEMITIDO ' +
           'WHERE CE_ID IN (SELECT CE_IDCHEQUEREEMP ' +
                             'FROM RCE_CHEQUEEMITIDO ' +
                            'WHERE CE_ORDENPAGO IN (' + psListaNroOrdenesPago + ') ' +
                            'UNION ALL ' +
                           'SELECT CE_ID ' +
                             'FROM RCE_CHEQUEEMITIDO ' +
                            'WHERE CE_ORDENPAGO IN (' + psListaNroOrdenesPago + ') ' +
                              'AND CE_IDCHEQUEREEMP IS NULL) ' +
             'AND CE_IDFINANCIALS IS NOT NULL';
             
  with GetQuery(sSql) do
    try
      while not Eof do
        begin
          sListaNroOrdenesPago := sListaNroOrdenesPago + FieldByName('OP').AsString + ', ';

          Next;
        end;
    finally
      Free
    end;

  bListaNroOrdenesPago := not IsEmptyString(sListaNroOrdenesPago);
  if bListaNroOrdenesPago then
    sListaNroOrdenesPago := CutRight(sListaNroOrdenesPago, 2);

  with sdqConsulta do
    begin
      sSql := 'SELECT ''Siniestro'' TIPO, ART.UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, ''/'') NUMERO, ' +
                     '''Trabajador: '' || TJ_NOMBRE || '' Empresa: '' || EM_NOMBRE DETALLE, LE_NUMLIQUI LIQUIDACION, CP_CONPAGO COD_CONCEPTO_PAGO, ' +
                     'CP_DENPAGO CONCEPTO_PAGO, LE_IMPORPERI IMPORTE, LE_FAPROBADO FECHA_APROBADO, DECODE(GE_CODIGO, ''GBA'', ''SI'', ''NO'') GBA, ' +
                     'CE_NUMERO NROCHEQUE, CE_ORDENPAGO OP, 0 DEBITOS ' +
                'FROM RCE_CHEQUEEMITIDO, AGE_GRUPOECONOMICO, CTJ_TRABAJADOR, AEM_EMPRESA, ART.SEX_EXPEDIENTES, ART.SCP_CONPAGO, ART.SLE_LIQUIEMPSIN ' +
               'WHERE CP_CONPAGO = LE_CONPAGO ' +
                 'AND EX_SINIESTRO = LE_SINIESTRO ' +
                 'AND EX_ORDEN = LE_ORDEN ' +
                 'AND EX_RECAIDA = LE_RECAIDA ' +
                 'AND EM_CUIT = EX_CUIT ' +
                 'AND TJ_ID = EX_IDTRABAJADOR ' +
                 'AND GE_ID(+) = EM_IDGRUPOECONOMICO ' +
                 'AND LE_IDCHEQUEEMITIDO = CE_ID ' +
                 'AND CE_ID IN (' + psListaIdCheques + ') ' +
               'UNION ALL ' +
              'SELECT ''Siniestro'' TIPO, ART.UTILES.ARMAR_SINIESTRO(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, ''/'') NUMERO, ' +
                     '''Trabajador: '' || TJ_NOMBRE || '' Empresa: '' || EM_NOMBRE DETALLE, PR_NUMPAGO LIQUIDACION, CP_CONPAGO COD_CONCEPTO_PAGO, ' +
                     'CP_DENPAGO CONCEPTO_PAGO, PR_IMPORPAGO IMPORTE, PR_FAPROBADO FECHA_APROBADO, DECODE(GE_CODIGO, ''GBA'', ''SI'', ''NO'') GBA, ' +
                     'CE_NUMERO NROCHEQUE, CE_ORDENPAGO OP, 0 DEBITOS ' +
                'FROM RCE_CHEQUEEMITIDO, AGE_GRUPOECONOMICO, CTJ_TRABAJADOR, AEM_EMPRESA, ART.SEX_EXPEDIENTES, ART.SCP_CONPAGO, ART.SPR_PAGOEXPESIN ' +
               'WHERE CP_CONPAGO = PR_CONPAGO ' +
                 'AND EX_SINIESTRO = PR_SINIESTRO ' +
                 'AND EX_ORDEN = PR_ORDEN ' +
                 'AND EX_RECAIDA = PR_RECAIDA ' +
                 'AND EM_CUIT = EX_CUIT ' +
                 'AND TJ_ID = EX_IDTRABAJADOR ' +
                 'AND GE_ID(+) = EM_IDGRUPOECONOMICO ' +
                 'AND PR_IDCHEQUEEMITIDO = CE_ID ' +
                 'AND CE_ID IN (' + psListaIdCheques + ') ' +
               'UNION ALL ' +
              'SELECT ''Factura'' TIPO, FC_FACTURATIPO || ''-'' || FC_FACTURANRO NUMERO, VE_NOMBRE DETALLE, NULL LIQUIDACION, NULL COD_CONCEPTO_PAGO, ' +
                     '''COMISIONES'' CONCEPTO_PAGO, FC_IMPORTE IMPORTE, FC_FECHAAPROBADO FECHA_APROBADO, NULL GBA, ' +
                     'CE_NUMERO NROCHEQUE, CE_ORDENPAGO OP, 0 DEBITOS ' +
                'FROM RCE_CHEQUEEMITIDO, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA ' +
               'WHERE EV_ID = FC_IDENTIDADVEND ' +
                 'AND VE_ID = EV_IDVENDEDOR ' +
                 'AND FC_IDCHEQUEEMITIDO = CE_ID ' +
                 'AND CE_ID IN (' + psListaIdCheques + ') ' +
               'UNION ALL ' +
              'SELECT ''Juicio'' tipo, TO_CHAR(JT_NUMEROCARPETA) NUMERO, ' +
                     'JT_DEMANDANTE || '' c/ '' || JT_DEMANDADO || '' s/ '' || JT_CARATULA DETALLE, PL_NUMPAGO LIQUIDACION, CP_CONPAGO COD_CONCEPTO_PAGO, ' +
                     'CP_DENPAGO CONCEPTO_PAGO, NVL(PL_IMPORTEPAGO, 0) + NVL(PL_IMPORTECONRETENCION, 0) IMPORTE, ' +
                     'TRUNC(PL_FECHAAPROBADO) FECHA_APROBADO, DECODE(JT_GPBA, ''1'', ''SI'', ''NO'') GBA, ' +
                     'CE_NUMERO NROCHEQUE, CE_ORDENPAGO OP, 0 DEBITOS ' +
                'FROM RCE_CHEQUEEMITIDO, ART.SCP_CONPAGO, LEGALES.LJT_JUICIOENTRAMITE, LEGALES.LPL_PAGOLEGAL ' +
               'WHERE JT_ID = PL_IDJUICIOENTRAMITE ' +
                 'AND CP_CONPAGO = PL_CONPAGO ' +
                 'AND PL_IDCHEQUEEMITIDO = CE_ID ' +
                 'AND CE_ID IN (' + psListaIdCheques + ') ' +
               'UNION ALL ' +
              'SELECT ''Mediación'' TIPO, TO_CHAR(ME_NUMEROFOLIO) NUMERO, ME_DEMANDANTE || '' c/ '' || ME_DEMANDADO DETALLE, ' +
                     'PM_NUMPAGO LIQUIDACION, CP_CONPAGO COD_CONCEPTO_PAGO, CP_DENPAGO CONCEPTO_PAGO, NVL(PM_IMPORTEPAGO, 0) + NVL(PM_IMPORTECONRETENCION, 0) IMPORTE, ' +
                     'TRUNC(PM_FECHAAPROBADO) FECHA_APROBADO, DECODE(ME_GPBA, ''S'', ''SI'', ''NO'') GBA, ' +
                     'CE_NUMERO NROCHEQUE, CE_ORDENPAGO OP, 0 DEBITOS ' +
                'FROM RCE_CHEQUEEMITIDO, ART.SCP_CONPAGO, LEGALES.LME_MEDIACION, LEGALES.LPM_PAGOMEDIACION ' +
               'WHERE ME_ID = PM_IDMEDIACION ' +
                 'AND CP_CONPAGO = PM_CONPAGO ' +
                 'AND PM_IDCHEQUEEMITIDO = CE_ID ' +
                 'AND CE_ID IN (' + psListaIdCheques + ') ' +
               'UNION ALL ' +
              'SELECT ''Sumario'' TIPO, TO_CHAR(SU_NUMEROSUMARIO) NUMERO, NULL DETALLE, PS_NUMPAGO LIQUIDACION, CP_CONPAGO COD_CONCEPTO_PAGO, CP_DENPAGO CONCEPTO_PAGO, ' +
                     'NVL(PS_IMPORTEPAGO, 0) + NVL(PS_IMPORTECONRETENCION, 0) IMPORTE, TRUNC(PS_FECHAAPROBADO) FECHA_APROBADO, NULL GBA, ' +
                     'CE_NUMERO NROCHEQUE, CE_ORDENPAGO OP, 0 DEBITOS ' +
                'FROM RCE_CHEQUEEMITIDO, ART.SCP_CONPAGO, LEGALES.LSU_SUMARIO, LEGALES.LPS_PAGOSUMARIO ' +
               'WHERE SU_ID = PS_IDSUMARIO ' +
                 'AND CP_CONPAGO = PS_CONPAGO ' +
                 'AND PS_IDCHEQUEEMITIDO = CE_ID ' +
                 'AND CE_ID IN (' + psListaIdCheques + ') ' +
               'UNION ALL ' +
             'SELECT ''Volante'' TIPO, TO_CHAR(VO_VOLANTE) NUMERO, CA_DESCRIPCION DETALLE, NULL LIQUIDACION, CP_CONPAGO COD_CONCEPTO_PAGO, ' +
                     'CP_DENPAGO CONCEPTO_PAGO, NVL(SUM(IV_IMPFACTURADO), MAX(VO_MONTO)) IMPORTE, VO_FECHAPAGO FECHA_APROBADO, ' +
                     'DECODE(GE_CODIGO, ''GBA'', ''SI'', ''NO'') GBA, CE_NUMERO NROCHEQUE, CE_ORDENPAGO OP, ' +
                     'ART.AMEBPBA.GET_TOTALDEBITO(VO_VOLANTE) DEBITOS ' +
                'FROM RCE_CHEQUEEMITIDO, AGE_GRUPOECONOMICO, AEM_EMPRESA, ART.SEX_EXPEDIENTES, ART.CPR_PRESTADOR, ART.SCP_CONPAGO, ' +
                     'ART.SIV_ITEMVOLANTE, ART.SVO_VOLANTES ' +
               'WHERE CA_IDENTIFICADOR = VO_PRESTADOR ' +
                 'AND IV_VOLANTE(+) = VO_VOLANTE ' +
                 'AND CP_CONPAGO(+) = IV_CONPAGO ' +
                 'AND EX_SINIESTRO(+) = IV_SINIESTRO ' +
                 'AND EX_ORDEN(+) = IV_ORDEN ' +
                 'AND EX_RECAIDA(+) = IV_RECAIDA ' +
                 'AND EM_CUIT(+) = EX_CUIT ' +
                 'AND GE_ID(+) = EM_IDGRUPOECONOMICO ' +
                 'AND IV_ESTADO(+) NOT IN(''X'', ''Z'') ' +
                 'AND VO_ORDENPAGO = CE_ORDENPAGO ' +
                 'AND VO_ORDENPAGO IN (' + psListaNroOrdenesPago + ') ' +
            'GROUP BY CE_NUMERO, CE_ORDENPAGO, TO_CHAR(VO_VOLANTE), CA_DESCRIPCION, CP_CONPAGO, CP_DENPAGO, VO_FECHAPAGO, ' +
                     'DECODE(GE_CODIGO, ''GBA'', ''SI'', ''NO''), ART.AMEBPBA.GET_TOTALDEBITO(VO_VOLANTE)';

      if bListaNroOrdenesPago then
        sSql := sSql +
                'UNION ALL ' +
               'SELECT ''Factura'' TIPO, AI.INVOICE_NUM NUMERO, PV.VENDOR_NAME DETALLE, NULL LIQUIDACION, NULL COD_CONCEPTO_PAGO, AI.DESCRIPTION CONCEPTO_PAGO, ' +
                        'AI.INVOICE_AMOUNT IMPORTE, AI.INVOICE_DATE FECHA_APROBADO, NULL GBA, ' +
                        'AC.CHECK_NUMBER NROCHEQUE, AIP.CHECK_ID OP, 0 DEBITOS ' +
                  'FROM AP_CHECKS_ALL@REALFCL AC, PO_VENDORS@REALFCL PV, AP_INVOICES_ALL@REALFCL AI, AP_INVOICE_PAYMENTS_ALL@REALFCL AIP ' +
                 'WHERE PV.VENDOR_ID = AI.VENDOR_ID ' +
                   'AND AI.INVOICE_ID = AIP.INVOICE_ID ' +
                   'AND AI.SOURCE = ''Manual Invoice Entry'' ' +
                   'AND AIP.CHECK_ID = AC.CHECK_ID ' +
                   'AND AIP.CHECK_ID IN (' + sListaNroOrdenesPago + ')';

      SQL.Text := sSql + SortDialog.OrderBy;
      inherited;
    end;
end;

procedure TfrmDetalleCheque.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;

  if sdqConsulta.FieldByName('DEBITOS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEBITOS')).Currency := True;
end;

procedure TfrmDetalleCheque.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmDetalleCheque.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmDetalleCheque.tbSumatoriaClick(Sender: TObject);
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

end.
