
{********************************************************}
{                                                        }
{    Consulta de Ingresos y Depósitos                    }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

unit unConsIngresosDepositos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls, ExtCtrls,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox;

type
  TfrmConsIngresosDepositos = class(TfrmCustomConsulta)
    cmbTipoConsulta: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edFecha: TDateComboBox;
    pnlBottom: TPanel;
    Label3: TLabel;
    lblRecordCount: TLabel;
    lbImporteTitulo: TLabel;
    lblImporte: TLabel;
    lblCantidadTotal: TLabel;
    lblNroCantidadTotal: TLabel;
    Label4: TLabel;
    edFechaHasta: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure QueryPrintReportBegin(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure tbLimpiarClick(Sender: TObject);
  private
    iLastTipoReporte: Integer;
  protected
    procedure RefreshData; override;
    procedure PrintResults; override;
  public
  end;

var
  frmConsIngresosDepositos: TfrmConsIngresosDepositos;

implementation

uses
  unPrincipal, unDmPrincipal, unGrids, CustomDlgs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmConsIngresosDepositos }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsIngresosDepositos.RefreshData;
var
  sSql: string;
  iIndice: Integer;
  bCheqRech: Boolean;
begin
  iIndice   := cmbTipoConsulta.ItemIndex + 1;
  bCheqRech := (iIndice = 11);  // Alta de Cheques Rechazados

  Verificar(bCheqRech and edFecha.IsEmpty, edFecha, 'Debe indicar la fecha de referencia.');
  Verificar(bCheqRech and edFechaHasta.IsEmpty, edFechaHasta, 'Debe indicar la fecha de referencia hasta.');

  case iIndice of
    {-----[ Efectivo - Valores a Fecha ]-----------------------------------------------------------}
    1: sSql := 'SELECT TRUNC(VA_FECHAALTA) "Fecha", EM_NOMBRE "Entidad", COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "Recibo",' +
               '       VA_IMPORTE "Importe", CV_DESCRIPCION "Tipo", VA_NROCHEQUE "Cheque",' +
               '       ''PESOS'' "Cargo", TV_DESCRIPCION "Tipo Valor" ' +
               '  FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, AEM_EMPRESA, ACO_CONTRATO, ZVA_VALOR' +
               ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND CO_IDEMPRESA = EM_ID' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) = :PFECHA' +
               '   AND NVL (VA_VENCIMIENTO, :PFECHA) <= :PFECHA' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO IN (''EFE'', ''CHQ'', ''TRF'')' +

               ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA), ED_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE, CV_DESCRIPCION, ' +
               '       VA_NROCHEQUE, ''PESOS'', TV_DESCRIPCION' +
               '  FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZVA_VALOR' +
               ' WHERE VA_IDEMPDEUDORA = ED_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) = :PFECHA' +
               '   AND NVL (VA_VENCIMIENTO, :PFECHA) <= :PFECHA' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO IN (''EFE'', ''CHQ'', ''TRF'')' +

               ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA), GC_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID),' +
               '       VA_IMPORTE, CV_DESCRIPCION, VA_NROCHEQUE, ''PESOS'', TV_DESCRIPCION ' +
               '  FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, AGC_GESTORCUENTA, ZVA_VALOR' +
               ' WHERE VA_IDGESTORCUENTA = GC_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) = :PFECHA' +
               '   AND NVL (VA_VENCIMIENTO, :PFECHA) <= :PFECHA' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO IN (''EFE'', ''CHQ'', ''TRF'')';

    {-----[ Efectivo - Depósitos ]-----------------------------------------------------------------}
    2: sSql := 'SELECT BD_FECHA "Fecha", BA_NOMBRE "Banco", ZCB.CB_NUMERO "Cuenta", ' +
                      'BD_MONTO "Importe", RCB.CB_DESCRIPCION "Clearing" ' +
                 'FROM ZBA_BANCO, ZCB_CUENTABANCARIA ZCB, RCB_CLEARINGBANCARIO RCB, ' +
                      'RBD_BOLETADEPOSITO ' +
                'WHERE ZCB.CB_ID = BD_IDCUENTABANCARIA ' +
                  'AND BA_ID = ZCB.CB_IDBANCO ' +
                  'AND BD_IDCLEARING = RCB.CB_ID(+) ' +
                  'AND BD_FECHA = :pFecha';

    {-----[ Valores sin Depositar ]----------------------------------------------------------------}
(*    3: sSql := 'SELECT NVL (VA_VENCIMIENTO, TRUNC(VA_FECHAALTA)) "FECHA", EM_NOMBRE "ENTIDAD",' +
               '       ART.COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO", VA_IMPORTE "IMPORTE", ''CONVENIO'' "TIPO", VA_NROCHEQUE' +
               '       "CHEQUE", NVL (BA_NOMBRE, ''EFECTIVO'') "BANCO", NVL (VA_VENCIMIENTO + 30, TRUNC(VA_FECHAALTA)) "VENCE"' +
               '  FROM ZBA_BANCO, RBD_BOLETADEPOSITO, AEM_EMPRESA, ACO_CONTRATO, ZVA_VALOR' +
               ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
               '   AND CO_IDEMPRESA = EM_ID' +
               '   AND BA_ID(+) = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_IDTIPOVALOR IN (1, 3)' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA) - 1) <= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) > TO_DATE (:PFECHA)' +

               ' UNION ALL ' +

               'SELECT NVL (VA_VENCIMIENTO, TRUNC(VA_FECHAALTA)) "FECHA", ED_NOMBRE "ENTIDAD",' +
               '       ART.COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO", VA_IMPORTE "IMPORTE", ''CONVENIO'' "TIPO", VA_NROCHEQUE' +
               '       "CHEQUE", NVL (BA_NOMBRE, ''EFECTIVO'') "BANCO", NVL (VA_VENCIMIENTO + 30, TRUNC(VA_FECHAALTA)) "VENCE"' +
               '  FROM ZBA_BANCO, RBD_BOLETADEPOSITO, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZVA_VALOR' +
               ' WHERE VA_IDEMPDEUDORA = ED_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BA_ID(+) = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_IDTIPOVALOR IN (1, 3)' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA) - 1) <= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) > TO_DATE (:PFECHA) ' +

               ' UNION ALL ' +

               'SELECT NVL (VA_VENCIMIENTO, TRUNC(VA_FECHAALTA)) "FECHA", GC_NOMBRE "ENTIDAD",' +
               '       ART.COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", ''CONVENIO'' "TIPO", VA_NROCHEQUE "CHEQUE",' +
               '       NVL (BA_NOMBRE, ''EFECTIVO'') "BANCO",' +
               '       NVL (VA_VENCIMIENTO + 30, TRUNC(VA_FECHAALTA)) "VENCE"' +
               '  FROM ZBA_BANCO,' +
               '       RBD_BOLETADEPOSITO,' +
               '       OCV_CONCEPTOVALOR,' +
               '       AGC_GESTORCUENTA,' +
               '       ZVA_VALOR' +
               ' WHERE VA_IDGESTORCUENTA = GC_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BA_ID(+) = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_IDTIPOVALOR IN (1, 3)' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA) - 1) <= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) > TO_DATE (:PFECHA)';
*)
    3: sSql := 'SELECT NVL (VA_VENCIMIENTO, TRUNC(VA_FECHAALTA)) "FECHA", EM_NOMBRE "ENTIDAD",' +
               '       ART.COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", CV_DESCRIPCION "TIPO", VA_NROCHEQUE "CHEQUE",' +
               '       NVL (BA_NOMBRE, ''EFECTIVO'') "BANCO",' +
               '       NVL (VA_VENCIMIENTO + 30, TRUNC(VA_FECHAALTA)) "VENCE", TV_DESCRIPCION "TIPO VALOR"' +
               '  FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, ZBA_BANCO, RBD_BOLETADEPOSITO,' +
               '       AEM_EMPRESA, ACO_CONTRATO, ZVA_VALOR' +
               ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
               '   AND CO_IDEMPRESA = EM_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BA_ID(+) = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA) - 1) <= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) > TO_DATE (:PFECHA)' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO IN (''EFE'', ''CHQ'', ''TRF'')' +
               '   AND :PFECHA < ( SELECT NVL(MIN(RV_FECHA), SYSDATE+1) ' +
                                    'FROM ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE ' +
                                   'WHERE RV_ID = RD_IDREEMPLAZOVALOR ' +
                                     'AND RD_TIPO = ''R'' ' +
                                     'AND RD_IDVALOR = VA_ID ) ' +

               ' UNION ALL ' +

               'SELECT NVL (VA_VENCIMIENTO, TRUNC(VA_FECHAALTA)) "FECHA", ED_NOMBRE "ENTIDAD",' +
               '       ART.COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", CV_DESCRIPCION "TIPO", VA_NROCHEQUE "CHEQUE",' +
               '       NVL (BA_NOMBRE, ''EFECTIVO'') "BANCO",' +
               '       NVL (VA_VENCIMIENTO + 30, TRUNC(VA_FECHAALTA)) "VENCE", TV_DESCRIPCION "TIPO VALOR"' +
               '  FROM OTV_TIPOVALOR, ZBA_BANCO, RBD_BOLETADEPOSITO, OCV_CONCEPTOVALOR,' +
               '       RED_EMPDEUDORA, ZVA_VALOR' +
               ' WHERE VA_IDEMPDEUDORA = ED_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BA_ID(+) = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA) - 1) <= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) > TO_DATE (:PFECHA)' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO IN (''EFE'', ''CHQ'', ''TRF'')' +
               '   AND :PFECHA < ( SELECT NVL(MIN(RV_FECHA), SYSDATE+1) ' +
                                    'FROM ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE ' +
                                   'WHERE RV_ID = RD_IDREEMPLAZOVALOR ' +
                                     'AND RD_TIPO = ''R'' ' +
                                     'AND RD_IDVALOR = VA_ID ) ' +

               ' UNION ALL ' +

               'SELECT NVL (VA_VENCIMIENTO, TRUNC(VA_FECHAALTA)) "FECHA", GC_NOMBRE "ENTIDAD",' +
               '       ART.COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", CV_DESCRIPCION "TIPO", VA_NROCHEQUE "CHEQUE",' +
               '       NVL (BA_NOMBRE, ''EFECTIVO'') "BANCO",' +
               '       NVL (VA_VENCIMIENTO + 30, TRUNC(VA_FECHAALTA)) "VENCE", TV_DESCRIPCION "TIPO VALOR"' +
               '  FROM OTV_TIPOVALOR, ZBA_BANCO, RBD_BOLETADEPOSITO, OCV_CONCEPTOVALOR,' +
               '       AGC_GESTORCUENTA, ZVA_VALOR' +
               ' WHERE VA_IDGESTORCUENTA = GC_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BA_ID(+) = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA) - 1) <= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) > TO_DATE (:PFECHA)' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO IN (''EFE'', ''CHQ'', ''TRF'') ' + 
               '   AND :PFECHA < ( SELECT NVL(MIN(RV_FECHA), SYSDATE+1) ' +
                                    'FROM ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE ' +
                                   'WHERE RV_ID = RD_IDREEMPLAZOVALOR ' +
                                     'AND RD_TIPO = ''R'' ' +
                                     'AND RD_IDVALOR = VA_ID )';

    {-----[ Valores a Depositar ]------------------------------------------------------------------}
    4: sSql := 'SELECT TRUNC(VA_FECHAALTA) "Fecha", EM_NOMBRE "Entidad", COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "Recibo",' +
               '       VA_IMPORTE "Importe", CV_DESCRIPCION "Tipo", VA_VENCIMIENTO "Depósito", VA_NROCHEQUE "Cheque", BA_NOMBRE "Banco",' +
               '       VA_NEGOCIABLE "Negociable", TV_DESCRIPCION "Tipo Valor"' +
               '  FROM OTV_TIPOVALOR, ZBA_BANCO, AEM_EMPRESA, OCV_CONCEPTOVALOR, ACO_CONTRATO, ZVA_VALOR' +
               ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND CO_IDEMPRESA = EM_ID' +
               '   AND VA_IDBANCO = BA_ID' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) = :PFECHA' +
               '   AND VA_VENCIMIENTO > :PFECHA' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO = ''CHQ''' +

               ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA), ED_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE, CV_DESCRIPCION,' +
               '       VA_VENCIMIENTO, VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, TV_DESCRIPCION ' +
               '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZVA_VALOR' +
               ' WHERE VA_IDEMPDEUDORA = ED_ID' +
               '   AND VA_IDBANCO = BA_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) = :PFECHA' +
               '   AND VA_VENCIMIENTO > :PFECHA' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO = ''CHQ''' +

               ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA), GC_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE, CV_DESCRIPCION,' +
               '       VA_VENCIMIENTO, VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, TV_DESCRIPCION ' +
               '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, AGC_GESTORCUENTA, ZVA_VALOR' +
               ' WHERE VA_IDGESTORCUENTA = GC_ID' +
               '   AND VA_IDBANCO = BA_ID' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) = :PFECHA' +
               '   AND VA_VENCIMIENTO > :PFECHA' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO = ''CHQ''';

    {-----[ Egresos de Valores a Depositar ]-------------------------------------------------------}
    5: sSql := 'SELECT TRUNC(VA_FECHAALTA) "Fecha", NVL(NVL(EM_NOMBRE,ED_NOMBRE),GC_NOMBRE) "Entidad", ' +
                      'ART.COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_ID) "Recibo", ' +
                      'VA_IMPORTE "Importe", CV_DESCRIPCION "Tipo", VA_VENCIMIENTO "Depósito", VA_NROCHEQUE "Cheque", ' +
                      'BA_NOMBRE "Banco", VA_NEGOCIABLE "Negociable" ' +
                 'FROM RED_EMPDEUDORA, AGC_GESTORCUENTA, AEM_EMPRESA, ACO_CONTRATO, ' +
                      'OCV_CONCEPTOVALOR, OTV_TIPOVALOR, ZBA_BANCO, ZVA_VALOR ' +
                'WHERE VA_IDCONTRATO = CO_CONTRATO(+) ' +
                  'AND CO_IDEMPRESA = EM_ID(+) ' +
                  'AND VA_IDEMPDEUDORA = ED_ID(+) ' +
                  'AND VA_IDGESTORCUENTA = GC_ID(+) ' +
                  'AND CV_ID = VA_IDCONCEPTOVALOR ' +
                  'AND VA_IDBANCO = BA_ID ' +
                  'AND VA_FECHABAJA IS NULL ' +
                  'AND VA_VENCIMIENTO = :PFECHA ' +
                  'AND TRUNC(VA_FECHAALTA) < :PFECHA ' +
                  'AND VA_IDTIPOVALOR = TV_ID ' +
                  'AND TV_CODIGO = ''CHQ'' ' +
                  'AND NOT EXISTS ( SELECT 1 ' +
                                     'FROM ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE ' +
                                    'WHERE RV_ID = RD_IDREEMPLAZOVALOR ' +
                                      'AND RD_TIPO = ''R'' ' +
                                      'AND RD_IDVALOR = VA_ID ' +
                                      'AND RV_FECHA <= :PFECHA )';

    {-----[ Egresos de Valores a Depositar Pendientes ]---ahora Valores a Depositar a vencer--}
(*    6: sSql := 'SELECT TRUNC(VA_FECHAALTA) "FECHA", EM_NOMBRE "ENTIDAD", COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", ''CONVENIO'' "TIPO", VA_VENCIMIENTO "DEPÓSITO", VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO",' +
               '       VA_NEGOCIABLE "NEGOCIABLE"' +
               '  FROM ZBA_BANCO, RBD_BOLETADEPOSITO, AEM_EMPRESA, ACO_CONTRATO, ZVA_VALOR' +
               ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
               '   AND CO_IDEMPRESA = EM_ID' +
               '   AND BA_ID = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_IDTIPOVALOR = 3' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) < TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA)) >= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) >= TO_DATE (:PFECHA)' +
               '   AND VA_IDBANCO <> 110' +

               ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA) "FECHA", ED_NOMBRE "ENTIDAD", COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", ''CONVENIO'' "TIPO", VA_VENCIMIENTO "DEPÓSITO", VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO",' +
               '       VA_NEGOCIABLE "NEGOCIABLE"' +
               '  FROM ZBA_BANCO, RBD_BOLETADEPOSITO, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZVA_VALOR' +
               ' WHERE VA_IDEMPDEUDORA = ED_ID' +
               '   AND BA_ID = VA_IDBANCO' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_IDTIPOVALOR = 3' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) < TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA)) >= TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) >= TO_DATE (:PFECHA)';
*)
    6: sSql := 'SELECT TRUNC(VA_FECHAALTA) "FECHA", EM_NOMBRE "ENTIDAD",' +
               '       COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", CV_DESCRIPCION "TIPO", VA_VENCIMIENTO "DEPÓSITO",' +
               '       VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO", VA_NEGOCIABLE "NEGOCIABLE"' +
               '  FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, ZBA_BANCO, RBD_BOLETADEPOSITO, AEM_EMPRESA,' +
               '       ACO_CONTRATO, ZVA_VALOR' +
               ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND CO_IDEMPRESA = EM_ID' +
               '   AND BA_ID = VA_IDBANCO' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA)) > TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) >= TO_DATE (:PFECHA)' +
               '   AND VA_IDBANCO <> 110' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO = ''CHQ''' +
               '   AND :PFECHA < ( SELECT NVL(MIN(RV_FECHA), SYSDATE+1) ' +
                                    'FROM ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE ' +
                                   'WHERE RV_ID = RD_IDREEMPLAZOVALOR ' +
                                     'AND RD_TIPO = ''R'' ' +
                                     'AND RD_IDVALOR = VA_ID ) ' +

               ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA) "FECHA", ED_NOMBRE "ENTIDAD",' +
               '       COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", CV_DESCRIPCION "TIPO", VA_VENCIMIENTO "DEPÓSITO",' +
               '       VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO", VA_NEGOCIABLE "NEGOCIABLE"' +
               '  FROM OTV_TIPOVALOR, ZBA_BANCO, RBD_BOLETADEPOSITO, OCV_CONCEPTOVALOR,' +
               '       RED_EMPDEUDORA, ZVA_VALOR' +
               ' WHERE VA_IDEMPDEUDORA = ED_ID' +
               '   AND BA_ID = VA_IDBANCO' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA)) > TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) >= TO_DATE (:PFECHA)' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO = ''CHQ''' +
               '   AND :PFECHA < ( SELECT NVL(MIN(RV_FECHA), SYSDATE+1) ' +
                                    'FROM ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE ' +
                                   'WHERE RV_ID = RD_IDREEMPLAZOVALOR ' +
                                     'AND RD_TIPO = ''R'' ' +
                                     'AND RD_IDVALOR = VA_ID ) ' +

               ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA) "FECHA", GC_NOMBRE "ENTIDAD",' +
               '       COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO",' +
               '       VA_IMPORTE "IMPORTE", CV_DESCRIPCION "TIPO", VA_VENCIMIENTO "DEPÓSITO",' +
               '       VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO", VA_NEGOCIABLE "NEGOCIABLE"' +
               '  FROM OTV_TIPOVALOR, ZBA_BANCO, RBD_BOLETADEPOSITO, OCV_CONCEPTOVALOR,' +
               '       AGC_GESTORCUENTA, ZVA_VALOR' +
               ' WHERE VA_IDGESTORCUENTA = GC_ID' +
               '   AND BA_ID = VA_IDBANCO' +
               '   AND CV_ID = VA_IDCONCEPTOVALOR' +
               '   AND BD_ID(+) = VA_IDBOLETADEP' +
               '   AND VA_FECHABAJA IS NULL' +
               '   AND TRUNC(VA_FECHAALTA) <= TO_DATE (:PFECHA)' +
               '   AND NVL (VA_VENCIMIENTO, TO_DATE (:PFECHA)) > TO_DATE (:PFECHA)' +
               '   AND NVL (BD_FECHA, TO_DATE (:PFECHA) + 1) >= TO_DATE (:PFECHA)' +
               '   AND VA_IDTIPOVALOR = TV_ID' +
               '   AND TV_CODIGO = ''CHQ'' ' +
               '   AND :PFECHA < ( SELECT NVL(MIN(RV_FECHA), SYSDATE+1) ' +
                                    'FROM ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE ' +
                                   'WHERE RV_ID = RD_IDREEMPLAZOVALOR ' +
                                     'AND RD_TIPO = ''R'' ' +
                                     'AND RD_IDVALOR = VA_ID )';

    {-----[ Documentos Ingresados ]----------------------------------------------------------------}
    7: sSql := 'SELECT TRUNC(VA_FECHAALTA) "Fecha", EM_NOMBRE "Entidad", VA_IDRECIBO "Recibo", VA_IMPORTE "Importe", ' +
                      'CV_DESCRIPCION "Tipo", VA_VENCIMIENTO "Vencimiento", NULL "Cobro" ' +
                 'FROM OTV_TIPOVALOR, AEM_EMPRESA, OCV_CONCEPTOVALOR, ACO_CONTRATO, ZVA_VALOR ' +
                'WHERE VA_IDCONTRATO = CO_CONTRATO ' +
                 ' AND CV_ID = VA_IDCONCEPTOVALOR ' +
                  'AND CO_IDEMPRESA = EM_ID ' +
                  'AND VA_FECHABAJA IS NULL ' +
                  'AND TRUNC(VA_FECHAALTA) = :pFecha ' +
                  'AND VA_IDTIPOVALOR = TV_ID ' +
                  'AND TV_CODIGO = ''PAG'' ' +

                ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA), ED_NOMBRE, VA_IDRECIBO, VA_IMPORTE, CV_DESCRIPCION, ' +
                      'VA_VENCIMIENTO, NULL ' +
                 'FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZVA_VALOR ' +
                'WHERE VA_IDEMPDEUDORA = ED_ID ' +
                  'AND CV_ID = VA_IDCONCEPTOVALOR ' +
                  'AND VA_FECHABAJA IS NULL ' +
                  'AND TRUNC(VA_FECHAALTA) = :pFecha ' +
                  'AND VA_IDTIPOVALOR = TV_ID ' +
                  'AND TV_CODIGO = ''PAG''';

    {-----[ Documentos Cobrados ]------------------------------------------------------------------}
    8: sSql := 'SELECT TRUNC(VA_FECHAALTA) "Fecha", EM_NOMBRE "Entidad", VA_IDRECIBO "Recibo", VA_IMPORTE "Importe", ' +
                      'CV_DESCRIPCION "Tipo", VA_VENCIMIENTO "Vencimiento", RD_FECHAALTA "Cobro" ' +
                 'FROM OTV_TIPOVALOR, AEM_EMPRESA, OCV_CONCEPTOVALOR, ACO_CONTRATO, ZRD_REEMPLAZODETALLE, ZVA_VALOR ' +
                'WHERE VA_IDCONTRATO = CO_CONTRATO ' +
                  'AND CV_ID = VA_IDCONCEPTOVALOR ' +
                  'AND CO_IDEMPRESA = EM_ID ' +
                  'AND RD_IDVALOR = VA_ID ' +
                  'AND RD_TIPO = ''R'' ' +
                  'AND VA_FECHABAJA IS NULL ' +
                  'AND RD_FECHAALTA = :pFecha ' +
                  'AND VA_IDTIPOVALOR = TV_ID ' +
                  'AND TV_CODIGO = ''PAG'' ' +

                ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA), ED_NOMBRE, VA_IDRECIBO, VA_IMPORTE, CV_DESCRIPCION, ' +
                      'VA_VENCIMIENTO, RD_FECHAALTA ' +
                 'FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZRD_REEMPLAZODETALLE, ZVA_VALOR ' +
                'WHERE VA_IDEMPDEUDORA = ED_ID ' +
                  'AND RD_IDVALOR = VA_ID ' +
                  'AND CV_ID = VA_IDCONCEPTOVALOR ' +
                  'AND RD_TIPO = ''R'' ' +
                  'AND VA_FECHABAJA IS NULL ' +
                  'AND RD_FECHAALTA = :pFecha ' +
                  'AND VA_IDTIPOVALOR = TV_ID ' +
                  'AND TV_CODIGO = ''PAG''';

    {-----[ Deudores por Premios Documentados ]----------------------------------------------------}
    9: sSql := 'SELECT TRUNC(VA_FECHAALTA) "Fecha", EM_NOMBRE "Entidad", VA_IDRECIBO "Recibo", VA_IMPORTE "Importe", ' +
                      'CV_DESCRIPCION "Tipo", VA_VENCIMIENTO "Vencimiento", NULL "Cobro" ' +
                 'FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, AEM_EMPRESA, ACO_CONTRATO, ZVA_VALOR ' +
                'WHERE VA_IDCONTRATO = CO_CONTRATO ' +
                  'AND CV_ID = VA_IDCONCEPTOVALOR ' +
                  'AND CO_IDEMPRESA = EM_ID ' +
                  'AND VA_FECHABAJA IS NULL ' +
                  'AND VA_IDTIPOVALOR = TV_ID ' +
                  'AND TV_CODIGO = ''PAG''' +
                  'AND VA_ESTADO NOT IN (''06'', ''08'') ' +
                  'AND NOT EXISTS ( SELECT 1 ' +
                                    'FROM ZRD_REEMPLAZODETALLE ' +
                                   'WHERE RD_IDVALOR = VA_ID ' +
                                     'AND RD_TIPO = ''R'' ) ' +

                ' UNION ALL ' +

               'SELECT TRUNC(VA_FECHAALTA), ED_NOMBRE, VA_IDRECIBO, VA_IMPORTE, CV_DESCRIPCION, ' +
                      'VA_VENCIMIENTO, NULL ' +
                 'FROM OTV_TIPOVALOR, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZVA_VALOR ' +
                'WHERE VA_IDEMPDEUDORA = ED_ID ' +
                  'AND CV_ID = VA_IDCONCEPTOVALOR ' +
                  'AND VA_FECHABAJA IS NULL ' +
                  'AND VA_IDTIPOVALOR = TV_ID ' +
                  'AND TV_CODIGO = ''PAG''' +
                  'AND VA_ESTADO NOT IN (''06'', ''08'') ' +
                  'AND NOT EXISTS ( SELECT 1 ' +
                                     'FROM ZRD_REEMPLAZODETALLE ' +
                                    'WHERE RD_IDVALOR = VA_ID ' +
                                      'AND RD_TIPO = ''R'' ) ';

    {-----[ Valores a depositar ingresados RESUMEN ]---------------------------}
    10: sSql := '  SELECT FECHA "Fecha", COUNT (*) "Cantidad", SUM (IMPORTE) "Importe" ' +
                    'FROM (SELECT TRUNC(VA_FECHAALTA) FECHA, VA_IMPORTE IMPORTE ' +
                            'FROM OTV_TIPOVALOR, ZBA_BANCO, AEM_EMPRESA, ACO_CONTRATO, ZVA_VALOR ' +
                           'WHERE VA_IDCONTRATO = CO_CONTRATO ' +
                             'AND CO_IDEMPRESA = EM_ID ' +
                             'AND VA_IDBANCO = BA_ID ' +
                             'AND VA_FECHABAJA IS NULL ' +
                             'AND VA_IDTIPOVALOR = TV_ID ' +
                             'AND TV_CODIGO = ''CHQ''' +

                          ' UNION ALL ' +

                          'SELECT TRUNC(VA_FECHAALTA), VA_IMPORTE ' +
                           'FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, RED_EMPDEUDORA, ZVA_VALOR ' +
                           'WHERE VA_IDEMPDEUDORA = ED_ID ' +
                             'AND VA_IDBANCO = BA_ID ' +
                             'AND CV_ID = VA_IDCONCEPTOVALOR ' +
                             'AND VA_IDTIPOVALOR = TV_ID ' +
                             'AND TV_CODIGO = ''CHQ''' +
                             'AND VA_FECHABAJA IS NULL)' +
                'GROUP BY FECHA';

    {-----[ Alta de Cheques Rechazados ]---------------------------}
    11: sSql :=
          'SELECT EM_NOMBRE "ENTIDAD", COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO", VA_IMPORTE "IMPORTE",' +
          '       CV_DESCRIPCION "TIPO", VA_VENCIMIENTO "VENCIMIENTO", VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO", VA_NEGOCIABLE' +
          '       "NEGOCIABLE", BD_NUMERO "BOLETA", BD_FECHA "FECHA BOLETA", TB_DESCRIPCION "MOTIVO"' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, AEM_EMPRESA, OCV_CONCEPTOVALOR, RBD_BOLETADEPOSITO, ACO_CONTRATO, CTB_TABLAS,' +
          '       ZVA_VALOR' +
          ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND CO_IDEMPRESA = EM_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE = ''MRECH''' +
          '   AND TB_CODIGO = VA_MOTIVORECHAZO' +
          '   AND VA_FECHARECHAZO BETWEEN :FECHA AND :FECHAHASTA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''' +
          ' UNION ALL ' +
          'SELECT ED_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE, CV_DESCRIPCION, VA_VENCIMIENTO,' +
          '       VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, BD_NUMERO, BD_FECHA, TB_DESCRIPCION' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, RBD_BOLETADEPOSITO, RED_EMPDEUDORA, CTB_TABLAS, ZVA_VALOR' +
          ' WHERE VA_IDEMPDEUDORA = ED_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE = ''MRECH''' +
          '   AND TB_CODIGO = VA_MOTIVORECHAZO' +
          '   AND VA_FECHARECHAZO BETWEEN :FECHA AND :FECHAHASTA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''' +
          ' UNION ALL ' +
          'SELECT GC_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE, CV_DESCRIPCION, VA_VENCIMIENTO,' +
          '       VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, BD_NUMERO, BD_FECHA, TB_DESCRIPCION' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, RBD_BOLETADEPOSITO, AGC_GESTORCUENTA, CTB_TABLAS, ZVA_VALOR' +
          '       ' +
          ' WHERE VA_IDGESTORCUENTA = GC_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE = ''MRECH''' +
          '   AND TB_CODIGO = VA_MOTIVORECHAZO' +
          '   AND VA_FECHARECHAZO BETWEEN :FECHA AND :FECHAHASTA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''';

    {-----[ Reemplazo de Cheques Rechazados ]---------------------------}
    12: sSql :=
          'SELECT EM_NOMBRE "ENTIDAD", COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO", VA_IMPORTE "IMPORTE",' +
          '       CV_DESCRIPCION "TIPO", VA_VENCIMIENTO "VENCIMIENTO", VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO", VA_NEGOCIABLE' +
          '       "NEGOCIABLE", BD_NUMERO "BOLETA", BD_FECHA "FECHA BOLETA", TB_DESCRIPCION "MOTIVO", VA_FECHARECHAZO' +
          '       "FECHA RECHAZO"' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, AEM_EMPRESA, OCV_CONCEPTOVALOR, ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE,' +
          '       RBD_BOLETADEPOSITO, ACO_CONTRATO, CTB_TABLAS, ZVA_VALOR' +
          ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND CO_IDEMPRESA = EM_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE = ''MRECH''' +
          '   AND TB_CODIGO = VA_MOTIVORECHAZO' +
          '   AND RD_IDREEMPLAZOVALOR = RV_ID' +
          '   AND RD_TIPO = ''R''' +
          '   AND RD_IDVALOR = VA_ID' +
          '   AND RV_FECHA = :FECHA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''' +
          ' UNION ALL ' +
          'SELECT ED_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE, CV_DESCRIPCION, VA_VENCIMIENTO,' +
          '       VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, BD_NUMERO, BD_FECHA, TB_DESCRIPCION, VA_FECHARECHAZO' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, ZRV_REEMPLAZOVALOR, ZRD_REEMPLAZODETALLE,' +
          '       RBD_BOLETADEPOSITO, RED_EMPDEUDORA, CTB_TABLAS, ZVA_VALOR' +
          ' WHERE VA_IDEMPDEUDORA = ED_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE = ''MRECH''' +
          '   AND TB_CODIGO = VA_MOTIVORECHAZO' +
          '   AND RD_IDREEMPLAZOVALOR = RV_ID' +
          '   AND RD_TIPO = ''R''' +
          '   AND RD_IDVALOR = VA_ID' +
          '   AND RV_FECHA = :FECHA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''' +
          ' UNION ALL ' +
          'SELECT GC_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE, CV_DESCRIPCION, VA_VENCIMIENTO,' +
          '       VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, BD_NUMERO, BD_FECHA, TB_DESCRIPCION, VA_FECHARECHAZO' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, RBD_BOLETADEPOSITO, ZRV_REEMPLAZOVALOR,' +
          '       ZRD_REEMPLAZODETALLE, AGC_GESTORCUENTA, CTB_TABLAS, ZVA_VALOR' +
          ' WHERE VA_IDGESTORCUENTA = GC_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE = ''MRECH''' +
          '   AND TB_CODIGO = VA_MOTIVORECHAZO' +
          '   AND RD_IDREEMPLAZOVALOR = RV_ID' +
          '   AND RD_TIPO = ''R''' +
          '   AND RD_IDVALOR = VA_ID' +
          '   AND RV_FECHA = :FECHA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''';

    {-----[ Saldo Final de Cheques Rechazados ]---------------------------}
    13: sSql :=
          'SELECT EM_NOMBRE "ENTIDAD", COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "RECIBO", VA_IMPORTE "IMPORTE",' +
          '       Cobranza.Get_SaldoChequeRechazado(va_id, :FECHA) Saldo,' +
          '       CV_DESCRIPCION "TIPO", VA_VENCIMIENTO "VENCIMIENTO", VA_NROCHEQUE "CHEQUE", BA_NOMBRE "BANCO", VA_NEGOCIABLE' +
          '       "NEGOCIABLE", BD_NUMERO "BOLETA", BD_FECHA "FECHA BOLETA", TB_DESCRIPCION "MOTIVO", VA_FECHARECHAZO' +
          '       "FECHA RECHAZO"' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, AEM_EMPRESA, OCV_CONCEPTOVALOR, RBD_BOLETADEPOSITO, ACO_CONTRATO, CTB_TABLAS,' +
          '       ZVA_VALOR' +
          ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND CO_IDEMPRESA = EM_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE(+) = ''MRECH''' +
          '   AND TB_CODIGO(+) = VA_MOTIVORECHAZO' +
          '   AND VA_FECHARECHAZO <= :FECHA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''' +
          '   AND Cobranza.Get_SaldoChequeRechazado(va_id, :FECHA) <> 0' +
          ' UNION ALL ' +
          'SELECT ED_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE,' +
          '       Cobranza.Get_SaldoChequeRechazado(va_id, :FECHA) Saldo, CV_DESCRIPCION, VA_VENCIMIENTO,' +
          '       VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, BD_NUMERO, BD_FECHA, TB_DESCRIPCION, VA_FECHARECHAZO' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, RBD_BOLETADEPOSITO, RED_EMPDEUDORA, CTB_TABLAS, ZVA_VALOR' +
          ' WHERE VA_IDEMPDEUDORA = ED_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE(+) = ''MRECH''' +
          '   AND TB_CODIGO(+) = VA_MOTIVORECHAZO' +
          '   AND VA_FECHARECHAZO <= :FECHA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''' +
          '   AND Cobranza.Get_SaldoChequeRechazado(va_id, :FECHA) <> 0' +
          ' UNION ALL ' +
          'SELECT GC_NOMBRE, COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID), VA_IMPORTE,' +
          '       Cobranza.Get_SaldoChequeRechazado(va_id, :FECHA) Saldo, CV_DESCRIPCION, VA_VENCIMIENTO,' +
          '       VA_NROCHEQUE, BA_NOMBRE, VA_NEGOCIABLE, BD_NUMERO, BD_FECHA, TB_DESCRIPCION, VA_FECHARECHAZO' +
          '  FROM OTV_TIPOVALOR, ZBA_BANCO, OCV_CONCEPTOVALOR, RBD_BOLETADEPOSITO, AGC_GESTORCUENTA, CTB_TABLAS, ZVA_VALOR' +
          '       ' +
          ' WHERE VA_IDGESTORCUENTA = GC_ID' +
          '   AND VA_IDBANCO = BA_ID' +
          '   AND CV_ID = VA_IDCONCEPTOVALOR' +
          '   AND BD_ID(+) = VA_IDBOLETADEP' +
          '   AND VA_FECHABAJA IS NULL' +
          '   AND TB_CLAVE(+) = ''MRECH''' +
          '   AND TB_CODIGO(+) = VA_MOTIVORECHAZO' +
          '   AND VA_FECHARECHAZO <= :FECHA' +
          '   AND VA_IDTIPOVALOR = TV_ID' +
          '   AND TV_CODIGO = ''CHQ''' +
          '   AND Cobranza.Get_SaldoChequeRechazado(va_id, :FECHA) <> 0';
  else
    SortDialog.SortFields.Clear;
    raise Exception.Create('Debe seleccionar un tipo de consulta');
  end;

  sdqConsulta.Sql.Text := sSql;
  if sdqConsulta.Params.Count > 0 Then
    begin
      sdqConsulta.Params[0].AsDateTime := edFecha.Date;

      if bCheqRech then
        sdqConsulta.Params[1].AsDateTime := edFechaHasta.Date;
    end;

  inherited;

  if iLastTipoReporte <> cmbTipoConsulta.ItemIndex Then
  begin
    iLastTipoReporte := cmbTipoConsulta.ItemIndex;
    SortDialog.SortFields.Clear;
    LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsIngresosDepositos.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  AField: TField;
begin
  AField := DataSet.FindField('Importe');
  if Assigned(AField) and (AField is TFloatField)Then
    TFloatField(AField).Currency := True;

  AField := DataSet.FindField('Saldo');
  if Assigned(AField) and (AField is TFloatField)Then
    TFloatField(AField).Currency := True; {Antes del Inherited}

  inherited;

  AField := DataSet.FindField('Cantidad');
  if Assigned(AField) then
  begin
    lblNroCantidadTotal.Caption := FloatToStr(ObtenerSuma(Grid, 'Cantidad'));
    lblNroCantidadTotal.Visible := True;
    lblCantidadTotal.Visible := True;
  end else
  begin
    lblNroCantidadTotal.Visible := False;
    lblCantidadTotal.Visible := False;
  end;

  lbImporteTitulo.Visible := (DataSet.FindField('Saldo') <> nil);
  lblImporte.Visible := (DataSet.FindField('Saldo') <> nil);
  if lblImporte.Visible then
    lblImporte.Caption := CurrToStrF(ObtenerSuma(Grid, 'Saldo'), ffNumber, 2);
  lblRecordCount.Caption := IntToStr(DataSet.RecordCount);
  pnlBottom.Visible := not DataSet.IsEmpty;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsIngresosDepositos.QueryPrintReportBegin(Sender: TObject);
var
  AField: TPrintField;
begin
  AField := QueryPrint.FieldByName['Importe'];
  if Assigned(AField) Then
  begin
    QueryPrint.Fields[0].TotalType := ttCustom;
    AField.TotalType := ttAutoSum;
  end;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsIngresosDepositos.PrintResults;
begin
  QueryPrint.Title.Text := cmbTipoConsulta.Text;

  if edFecha.Date = 0 Then
    QueryPrint.SubTitle.Lines.Clear
  else
    begin
      QueryPrint.SubTitle.Text := 'Fecha de Ref.: ' + edFecha.Text;

      if not edFechaHasta.IsEmpty then
        QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + ' - Fecha de Ref. hasta: ' + edFechaHasta.Text;
    end;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsIngresosDepositos.FormCreate(Sender: TObject);
begin
  inherited;
  iLastTipoReporte := -1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsIngresosDepositos.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.Index = 0 Then
    Value := 'Total:';

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsIngresosDepositos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  pnlBottom.Visible := False; 
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
