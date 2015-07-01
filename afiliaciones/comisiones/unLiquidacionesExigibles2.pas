unit unLiquidacionesExigibles2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraVendedores, Mask, ToolEdit, DateComboBox,
  ansisql, sqlfuncs, dbfuncs, customdlgs, general, strfuncs, StrUtils,
  unfraVendedoresCUIT;

type
  TfrmLiquidacionesExigibles2 = class(TfrmCustomConsulta)
    tbSumatoria: TToolButton;
    gbFecha: TGroupBox;
    Label2: TLabel;
    edFechaHasta: TDateComboBox;
    gbVendedor: TGroupBox;
    rgSaldo: TRadioGroup;
    fraVendedores1: TfraVendedoresCUIT;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure CalcTotales;
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
  public
  end;

const
  COLS = 1;
  CAMPOS_SUMA : array [1..COLS] of string = ('SALDO');

var
  frmLiquidacionesExigibles2: TfrmLiquidacionesExigibles2;
  TotalConsulta: array of extended;

implementation

{$R *.dfm}

procedure TfrmLiquidacionesExigibles2.tbRefrescarClick(Sender: TObject);
var
  sWhere, ssql: string;
begin
  ssql :=   'SELECT ve_vendedor vendedor, ve_nombre nombre, ve_cuit cuit, ' +
                   'SUM (cc_debito - cc_credito) saldo ' +
              'FROM xve_vendedor, ' +
                   '(SELECT cc_id cc_id, cc_identidad cc_identidad, ' +
                           'cc_idvendedor cc_idvendedor, cc_identvend cc_identvend, ' +
                           'cc_fecha fecha, co_descripcion cc_concepto, ' +
                           'cc_idconcepto, ''Liquidación'' cc_tipocomprobante, ' +
                           'cc_idliquidacion cc_nrocomprobante, ' +
                           'DECODE (co_signo, -1, cc_importe, 0) cc_debito, ' +
                           'DECODE (co_signo, 1, cc_importe, 0) cc_credito, ' +
                           'cc_detalle cc_detalle, cc_fechaalta, cc_fechabaja ' +
                     'FROM xlc_liqcomision, xco_concepto, xcc_cuentacorriente ' +
                    'WHERE co_id = cc_idconcepto AND lc_id = cc_idliquidacion ' +
                   'UNION ALL ' +
                    'SELECT cc_id cc_id, cc_identidad cc_identidad, ' +
                           'cc_idvendedor cc_idvendedor, cc_identvend cc_identvend, ' +
                           'ce_fechacheque fecha, co_descripcion cc_concepto, ' +
                           'cc_idconcepto, ce_metodopago cc_tipocomprobante, ' +
                           'ce_numero cc_nrocomprobante, ' +
                           'DECODE (co_signo, -1, cc_importe, 0) cc_debito, ' +
                           'DECODE (co_signo, 1, cc_importe, 0) cc_credito, ' +
                           'cc_detalle cc_detalle, cc_fechaalta, cc_fechabaja ' +
                     'FROM rce_chequeemitido, xco_concepto, xcc_cuentacorriente ' +
                    'WHERE co_id = cc_idconcepto AND ce_id = cc_idchequeemitido) ' +
            'WHERE ve_id = cc_idvendedor AND cc_fechabaja IS NULL ';

  sWhere := SqlBetweenDateTime(' AND cc_fechaalta ', 0, edFechaHasta.Date);

  if not fraVendedores1.IsEmpty then
    sWhere := sWhere + ' AND ve_id = ' + SqlInt(fraVendedores1.ID);

  if rgSaldo.ItemIndex <> 3 then
    case rgSaldo.ItemIndex of
      0: sWhere := sWhere + ' HAVING SUM (cc_debito - cc_credito) > 0';
      1: sWhere := sWhere + ' HAVING SUM (cc_debito - cc_credito) < 0';
      2: sWhere := sWhere + ' HAVING SUM (cc_debito - cc_credito) = 0';
    end;

  sWhere := sWhere + ' GROUP BY ve_vendedor, ve_nombre, ve_cuit ';
  
  sdqConsulta.SQL.Text := ssql + sWhere;
  inherited;

  if tbSumatoria.Down = true then
    CalcTotales;
end;

procedure TfrmLiquidacionesExigibles2.CalcTotales;
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

procedure TfrmLiquidacionesExigibles2.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= COLS) then
  begin
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
  end;
end;

procedure TfrmLiquidacionesExigibles2.FormCreate(Sender: TObject);
begin
  inherited;
  fraVendedores1.ShowBajas := true;
  fraVendedores1.ExtraCondition := ' AND ev_fechabaja is null ';
  SetLength(TotalConsulta, COLS);
  tbSumatoria.Left := 290;
end;

procedure TfrmLiquidacionesExigibles2.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFechaHasta.Clear;
  fraVendedores1.Clear;
  rgSaldo.ItemIndex := 3;
  tbSumatoria.Down := false;
  Grid.FooterBand := false;
end;

procedure TfrmLiquidacionesExigibles2.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;


end.
