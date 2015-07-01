unit unRptFacturasAprobadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, DB, SDEngine, ExtCtrls, unArt;

type
  TfrmRptFacturasAprobadas = class(TForm)
    qrLiquidaciones: TQuickRep;
    qrbDetalleLiquidaciones: TQRBand;
    sdqConsulta: TSDQuery;
    qrFacturasAprobadasVend: TQuickRep;
    qrgVendedorHeader: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel24: TQRLabel;
    lblEntidad: TQRDBText;
    lblCodEntidad: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    qrbHeader: TQRBand;
    qrlTitulo: TQRLabel;
    qrbDetalleFacturas: TQRBand;
    CompositeReport: TQRCompositeReport;
    qrcbFacturas: TQRChildBand;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrgFacturasFooter: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    sdqLiquidaciones: TSDQuery;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrlSubTitulo: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    sdqEntVend: TSDQuery;
    QRGroup1: TQRGroup;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr2: TQRExpr;
    qrlUsuario: TQRLabel;
    qrbTotDetalleLiquidaciones: TQRChildBand;
    QRLabel18: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    procedure CompositeReportAddReports(Sender: TObject);
    procedure FormatMonto(sender: TObject; var Value: String);
    procedure qrFacturasAprobadasVendBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure CompositeReportFinished(Sender: TObject);
    procedure qrbTotDetalleLiquidacionesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    pCantEntVend: Integer;
  public
  end;

  function DoGenerarReporteFacturasAprobadas(Fecha: TDateTime; IdFact: TTableId): Boolean;

implementation

{$R *.dfm}

uses
  unVisualizador, unDmPrincipal, unSesion, Strfuncs, General, DateTimeFuncs, AnsiSql;

function DoGenerarReporteFacturasAprobadas(Fecha: TDateTime; IdFact: TTableId): Boolean;
var
  bPorIdLiq, bHayReg: Boolean;
  sWhere: String;
begin
  with TfrmRptFacturasAprobadas.Create(nil) do
    try
      if IdFact <> ART_EMPTY_ID then
        bPorIdLiq := True
      else
        bPorIdLiq := False;

      qrlTitulo.Caption   := 'FACTURAS APROBADAS';
      qrlUsuario.Caption  := Sesion.Usuario;

      if bPorIdLiq then
        begin
          sWhere               := 'AND FC_ID = ' + SqlValue(IdFact);
          qrlSubTitulo.Caption := '';
        end
      else
        begin
          sWhere               := 'AND FC_FECHAAPROBADO = ' + SqlValue(Fecha);
          qrlSubTitulo.Caption := DateToStr(Fecha);
        end;
      sWhere := sWhere + ' ';

      sdqConsulta.SQL.Text :=
        'SELECT EV_ID IDENTVEND, EN_CODBANCO COD_ENT, EN_CUIT CUIT_ENT, EN_NOMBRE NOM_ENT, ' +
               'VE_VENDEDOR COD_VEND, VE_CUIT CUIT_VEND, VE_NOMBRE NOM_VEND, ' +
               'FC_FACTURATIPO || ''-'' || FC_FACTURANRO NUMERO, FC_FECHAFACTURA FECHA, FC_IMPORTE IMPORTE, ' +
              '(SELECT CP_CBU1 || ''-'' || CP_CBU2 ' +
                 'FROM CCP_CUENTAPAGO ' +
                'WHERE CP_IDACREEDOR = VE_ID ' +
                  'AND CP_TIPOACREEDOR = ''PR'' ' +
                  'AND CP_FECHABAJA IS NULL ' +
                  'AND CP_FECHAALTAMCARGA IS NOT NULL) CBU_VEND ' +
          'FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA ' +
         'WHERE EV_ID = FC_IDENTIDADVEND ' +
           'AND EN_ID = EV_IDENTIDAD ' +
           'AND VE_ID = EV_IDVENDEDOR ' +
           sWhere +
           'AND FC_IDENTIDADVEND = :IdEntVend ' +
         'ORDER BY EN_CODBANCO, VE_VENDEDOR, FC_ID';

      sdqLiquidaciones.SQL.Text :=
        'SELECT NUMERO, FECHA, ' +
               'COBRADO, ROUND(COMISION * FACTOR, 2) COMISION, ' +
               'ROUND(IVA * FACTOR, 2) IVA, ROUND(FACTURA * FACTOR, 2) FACTURA, ' +
               'ROUND(RETENCION * FACTOR, 2) RETENCION, ROUND(NETO * FACTOR, 2) NETO ' +
          'FROM (SELECT LC_ID NUMERO, LC_FECHALIQ FECHA, ' +
                       'LC_COBRADONETO COBRADO, LC_COMISION COMISION, ' +
                       'LC_IVA IVA, LC_COMISION + LC_IVA FACTURA, ' +
                       'LC_OBRASOCIAL + LC_INGBRUTOS + LC_GANANCIAS + LC_RETIVA RETENCION, ' +
                       'LC_COMISIONNETA NETO, LF_MONTO / (LC_COMISION + LC_IVA) FACTOR ' +
                  'FROM XLC_LIQCOMISION, XLF_LIQFACTURA, XFC_FACTURA ' +
                 'WHERE LC_ID = LF_IDLIQCOMISION ' +
                   'AND FC_ID = LF_IDFACTURA ' +
                   'AND LF_FECHABAJA IS NULL ' +
                   sWhere +
                   'AND FC_IDENTIDADVEND = :IdEntVend) ' +
         'ORDER BY NUMERO';

      sdqEntVend.SQL.Text :=
        'SELECT DISTINCT FC_IDENTIDADVEND IDENTVEND, EN_CODBANCO, VE_VENDEDOR ' +
          'FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA ' +
         'WHERE EV_ID = FC_IDENTIDADVEND ' +
           'AND EN_ID = EV_IDENTIDAD ' +
           'AND VE_ID = EV_IDVENDEDOR ' +
           sWhere +
         'ORDER BY TO_CHAR(EN_CODBANCO, ''FM00000000'') || TO_CHAR(VE_VENDEDOR, ''FM00000000'')';

      OpenQuery(sdqEntVend);

      pCantEntVend := sdqEntVend.RecordCount;
      bHayReg      := (pCantEntVend > 0);

      if bHayReg then
        CompositeReport.Preview;

      Result := bHayReg;
    finally
      Free;
    end;
end;

procedure TfrmRptFacturasAprobadas.CompositeReportAddReports(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to pCantEntVend do
    begin
      CompositeReport.Reports.Add(qrFacturasAprobadasVend);
      CompositeReport.Reports.Add(qrLiquidaciones);
    end;
end;

procedure TfrmRptFacturasAprobadas.FormatMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TfrmRptFacturasAprobadas.qrFacturasAprobadasVendBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  pIdEntVend: TTableId;
begin
  pIdEntVend := sdqEntVend.FieldByName('IDENTVEND').AsInteger;

  sdqConsulta.ParamByName('IdEntVend').AsInteger := pIdEntVend;
  OpenQuery(sdqConsulta);

  sdqLiquidaciones.ParamByName('IdEntVend').AsInteger := pIdEntVend;
  OpenQuery(sdqLiquidaciones);

  sdqEntVend.Next;
end;

procedure TfrmRptFacturasAprobadas.CompositeReportFinished(Sender: TObject);
begin
  if sdqEntVend.Eof then
    sdqEntVend.First
end;

procedure TfrmRptFacturasAprobadas.qrbTotDetalleLiquidacionesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (sdqLiquidaciones.RecordCount = sdqLiquidaciones.RecNo {$IFDEF VER150}+ 1{$ENDIF});
end;

end.
