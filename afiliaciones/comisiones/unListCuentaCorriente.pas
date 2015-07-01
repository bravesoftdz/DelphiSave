unit unListCuentaCorriente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, StdCtrls, Mask, ToolEdit, DateComboBox,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unfraVendedores,
  ansisql, sqlfuncs, StrUtils, unfraVendedoresCUIT;

type
  TfrmListCuentaCorriente = class(TfrmCustomConsulta)
    gbFecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    gbConcepto: TGroupBox;
    fraConcepto: TfraCodigoDescripcion;
    gbVendedor: TGroupBox;
    fraVendedores1: TfraVendedoresCUIT;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListCuentaCorriente: TfrmListCuentaCorriente;

implementation

{$R *.dfm}

procedure TfrmListCuentaCorriente.tbRefrescarClick(Sender: TObject);
var
  sWhere, ssql: string;
begin
  ssql := 'SELECT CC_ID IDCC, TRUNC(CC_FECHAALTA) FECHA_ALTA, CC_FECHABAJA FECHA_BAJA, ' +
                 'FECHA, VE_VENDEDOR VENDEDOR, VE_NOMBRE NOMBRE, VE_CUIT CUIT, ' +
                 'CC_CONCEPTO CONCEPTO, CC_TIPOCOMPROBANTE TIPO_COMPROBANTE, ' +
                 'CC_NROCOMPROBANTE NRO_COMPROBANTE, CC_DEBITO DEBITO, ' +
                 'CC_CREDITO CREDITO, CC_IDCONCEPTO ' +
            'FROM XVE_VENDEDOR, ' +
                 '(SELECT CC_ID CC_ID, CC_IDENTIDAD CC_IDENTIDAD, ' +
                         'CC_IDVENDEDOR CC_IDVENDEDOR, CC_IDENTVEND CC_IDENTVEND, ' +
                         'LC_FECHALIQ FECHA, CO_DESCRIPCION CC_CONCEPTO, ' +
                         'CC_IDCONCEPTO, ''Liquidación'' CC_TIPOCOMPROBANTE, ' +
                         'CC_IDLIQUIDACION CC_NROCOMPROBANTE, ' +
                         'DECODE (CO_SIGNO, -1, CC_IMPORTE, 0) CC_DEBITO, ' +
                         'DECODE (CO_SIGNO, 1, CC_IMPORTE, 0) CC_CREDITO, ' +
                         'CC_DETALLE CC_DETALLE, CC_FECHAALTA, CC_FECHABAJA ' +
                    'FROM XLC_LIQCOMISION, XCO_CONCEPTO, XCC_CUENTACORRIENTE ' +
                   'WHERE CO_ID = CC_IDCONCEPTO AND LC_ID = CC_IDLIQUIDACION ' +
                   'UNION ALL ' +
                  'SELECT CC_ID CC_ID, CC_IDENTIDAD CC_IDENTIDAD, CC_IDVENDEDOR CC_IDVENDEDOR, CC_IDENTVEND CC_IDENTVEND, ' +
                         'TRUNC(CC_FECHABAJA) FECHA, CO_DESCRIPCION CC_CONCEPTO, CC_IDCONCEPTO, ''Liquidación Cancelada'' CC_TIPOCOMPROBANTE, ' +
                         'CC_IDLIQUIDACION CC_NROCOMPROBANTE, DECODE(CO_SIGNO, 1, CC_IMPORTE, 0) CC_DEBITO, ' +
                         'DECODE(CO_SIGNO, -1, CC_IMPORTE, 0) CC_CREDITO, CC_DETALLE CC_DETALLE, CC_FECHAALTA, CC_FECHABAJA ' +
                    'FROM XLC_LIQCOMISION, XCO_CONCEPTO, XCC_CUENTACORRIENTE ' +
                   'WHERE CO_ID = CC_IDCONCEPTO ' +
                     'AND LC_ID = CC_IDLIQUIDACION ' +
                     'AND CC_FECHABAJA IS NOT NULL ' +
                   'UNION ALL ' +
                  'SELECT CC_ID CC_ID, CC_IDENTIDAD CC_IDENTIDAD, ' +
                         'CC_IDVENDEDOR CC_IDVENDEDOR, CC_IDENTVEND CC_IDENTVEND, ' +
                         'CE_FECHACHEQUE FECHA, CO_DESCRIPCION CC_CONCEPTO, ' +
                         'CC_IDCONCEPTO, CE_METODOPAGO CC_TIPOCOMPROBANTE, ' +
                         'CE_NUMERO CC_NROCOMPROBANTE, ' +
                         'DECODE (CO_SIGNO, -1, CC_IMPORTE, 0) CC_DEBITO, ' +
                         'DECODE (CO_SIGNO, 1, CC_IMPORTE, 0) CC_CREDITO, ' +
                         'CC_DETALLE CC_DETALLE, CC_FECHAALTA, CC_FECHABAJA ' +
                    'FROM RCE_CHEQUEEMITIDO, XCO_CONCEPTO, XCC_CUENTACORRIENTE ' +
                   'WHERE CO_ID = CC_IDCONCEPTO AND CE_ID = CC_IDCHEQUEEMITIDO) ' +
           'WHERE VE_ID = CC_IDVENDEDOR ';

  sWhere := SqlBetweenDateTime(' AND CC_FECHAALTA ', edFechaDesde.Date, edFechaHasta.Date);

  if not fraVendedores1.IsEmpty then
    sWhere := sWhere + ' AND VE_ID = ' + SqlInt(fraVendedores1.ID);

  if not fraConcepto.IsEmpty then
    sWhere := sWhere + ' AND CC_IDCONCEPTO = ' + SqlInt(fraConcepto.Codigo);

  sdqConsulta.SQL.Text := ssql + sWhere;
  inherited;
end;

procedure TfrmListCuentaCorriente.FormCreate(Sender: TObject);
begin
  inherited;
    fraConcepto.TableName := 'COM.XCO_CONCEPTO';
    fraConcepto.FieldCodigo := 'CO_ID';
    fraConcepto.FieldID := 'CO_ID';
    fraConcepto.FieldDesc := 'CO_DESCRIPCION';
    fraConcepto.FieldBaja := 'CO_FECHABAJA';
    fraConcepto.ShowBajas := false;
    fraVendedores1.ShowBajas := true;
    fraVendedores1.ExtraCondition := ' AND EV_FECHABAJA IS NULL ';
end;

procedure TfrmListCuentaCorriente.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraConcepto.Clear;
  fraVendedores1.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

end.
