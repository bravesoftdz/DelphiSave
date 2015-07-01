unit unRetencionesIIBB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unfraVendedores, StdCtrls, Mask, ToolEdit, DateComboBox, ansisql, dbfuncs,
  customdlgs, general, strfuncs, sqlfuncs, PatternEdit, IntEdit,
  unfraVendedoresCUIT;

type
  TfrmRetencionesIIBB = class(TfrmCustomConsulta)
    gbFecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    tbSumatoria: TToolButton;
    gbProvincia: TGroupBox;
    fraProvincias: TfraCodigoDescripcion;
    gbLiquidacion: TGroupBox;
    ieLiquidacion: TIntEdit;
    gbVendedor: TGroupBox;
    fraVendedores1: TfraVendedoresCUIT;
    procedure tbRefrescarClick(Sender: TObject);
    procedure CalcTotales;
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  COLS = 2;
  CAMPOS_SUMA : array [0..COLS] of string = ('COMISION', 'IMPORTE_NETO', 'RETENCION');

var
  frmRetencionesIIBB: TfrmRetencionesIIBB;
  TotalConsulta: array of extended;

implementation

{$R *.dfm}

procedure TfrmRetencionesIIBB.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := 'SELECT VE_VENDEDOR VENDEDOR, VE_CUIT CUIT, VE_NOMBRE NOMBRE, IL_FECHA FECHA, IL_IDLIQUIDACION LIQUIDACION, ' +
                 'PV_DESCRIPCION PROVINCIA, IL_COMISION COMISION, IL_NETO IMPORTE_NETO, IL_RETENCION RETENCION, ' +
	               'IL_COMPROBANTE COMPROBANTE ' +
            'FROM XIL_IBLIQUIDACION, XLC_LIQCOMISION, ART.CPV_PROVINCIAS, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR ' +
           'WHERE LC_ID = IL_IDLIQUIDACION ' +
             'AND PV_CODIGO = IL_PROVINCIA ' +
             'AND EV_ID = LC_IDENTIDADVENDEDOR ' +
             'AND VE_ID = EV_IDVENDEDOR ' +
             'AND LC_ESTADO <> ''C'' ' +
         'UNION ALL ' +
          'SELECT VE_VENDEDOR VENDEDOR, VE_CUIT CUIT, VE_NOMBRE NOMBRE, IL_FECHA FECHA, IL_IDLIQUIDACION LIQUIDACION, ' +
                 'PV_DESCRIPCION PROVINCIA, IL_COMISION COMISION, IL_NETO IMPORTE_NETO, IL_RETENCION RETENCION, ' +
	               'IL_COMPROBANTE COMPROBANTE ' +
            'FROM XIL_IBLIQUIDACION, XLC_LIQCOMISION, ART.CPV_PROVINCIAS, XEV_ENTIDADVENDEDOR, XVE_VENDEDOR ' +
           'WHERE LC_ID = IL_IDLIQUIDACION ' +
             'AND PV_CODIGO = IL_PROVINCIA ' +
             'AND EV_IDENTIDAD = LC_IDENTIDAD ' +
             'AND VE_ID = EV_IDVENDEDOR ' +
             'AND EV_FECHABAJA IS NULL ' +
             'AND VE_VENDEDOR = ''0'' ' +
             'AND LC_ESTADO <> ''C'' ';

  if (not edFechaDesde.IsEmpty) then
    AddCondition_UNION( sSql, 'il_fecha > ' + sqlvalue(edFechaDesde.Date));
  if (not edFechaHasta.IsEmpty) then
    AddCondition_UNION( sSql, 'il_fecha < ' + sqlvalue(edFechaHasta.Date));
  if (not fraVendedores1.IsEmpty) then
    AddCondition_UNION( sSql, 've_id = ' + sqlint(fraVendedores1.ID));
  if (not fraProvincias.IsEmpty) then
    AddCondition_UNION( sSql, 'pv_codigo = ' + sqlvalue(fraProvincias.Codigo));
  if (not ieLiquidacion.IsEmpty) then
    AddCondition_UNION( sSql, 'il_idliquidacion = ' + sqlint(ieLiquidacion.Value));

  sdqConsulta.SQL.Text := ssql;

  inherited;
  
  if tbSumatoria.Down = true then
    CalcTotales;

end;


procedure TfrmRetencionesIIBB.CalcTotales;
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

procedure TfrmRetencionesIIBB.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmRetencionesIIBB.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= COLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
    
end;


procedure TfrmRetencionesIIBB.FormCreate(Sender: TObject);
begin
  inherited;
  with fraProvincias do
  begin
    TableName := 'art.CPV_PROVINCIAS';
    fieldid := 'pv_codigo';
    fieldcodigo := 'pv_codigo';
    fielddesc := 'pv_descripcion';
    FieldBaja := 'pv_fechabaja';
    ShowBajas := true;
  end;
  fraVendedores1.ShowBajas := true;
  fraVendedores1.ExtraCondition := ' AND ev_fechabaja is null ';
  SetLength(TotalConsulta, COLS  + 1);
  tbSumatoria.Left := 290;
end;

procedure TfrmRetencionesIIBB.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  ieLiquidacion.Clear;
  fraVendedores1.Clear;
  fraProvincias.Clear;
  tbSumatoria.Down := false;
  Grid.FooterBand := false;
end;

end.
