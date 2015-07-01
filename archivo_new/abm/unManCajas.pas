unit unManCajas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, RxToolEdit, DateComboBox, Vcl.Mask, PatternEdit,
  IntEdit, CardinalEdit;

type
  TfrmManCajas = class(TfrmCustomGridABM)
    lblNroLote: TLabel;
    edRemitoAltaModif: TIntEdit;
    lblFechaMovimientoDesde: TLabel;
    edFCompraAltaModif: TDateComboBox;
    Label1: TLabel;
    edCantCajasAltaModif: TIntEdit;
    ShortCutControl1: TShortCutControl;
    gbFechaCompra: TGroupBox;
    Label9: TLabel;
    edFechaCompraDesde: TDateComboBox;
    edFechaCompraHasta: TDateComboBox;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    pnlSeleccionados: TPanel;
    edTotalRegistros: TCardinalEdit;
    chkNoBajas: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
    procedure CalcTotales;
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('CA_CANTIDAD');

var
  frmManCajas: TfrmManCajas;
  TotalConsulta: Array of Extended;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, CustomDlgs, unDmPrincipal, DbFuncs,
  Strfuncs;

{$R *.dfm}

procedure TfrmManCajas.CalcTotales;
var
  PrevCursor: TCursor;
begin
  if tbSumatoria.Down and sdqConsulta.Active and not sdqConsulta.IsEmpty then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Value := 0;

  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmManCajas.ClearControls;
begin
  edFCompraAltaModif.Clear;
  edRemitoAltaModif.Clear;
  edCantCajasAltaModif.Clear;
  VCLExtra.LockControl(edFCompraAltaModif, False);
end;

function TfrmManCajas.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('CA_ID',              sdqConsulta.FieldByName('CA_ID').AsInteger);
           Fields.Add('CA_FECHABAJA',           exDateTime);
           Fields.Add('CA_USUBAJA',             Sesion.UserID);
           SqlType := stUpdate;
        end
      else
      begin
         if ModoABM = maAlta then
           begin
             PrimaryKey.AddInteger('CA_ID',     GetSecNextVal('ARCHIVO.SEQ_RCA_ID'));
             Fields.Add('CA_FECHAALTA',         exDateTime);
             Fields.Add('CA_USUALTA',           Sesion.UserID);
             SqlType := stInsert;
           end
         else if ModoABM = maModificacion then
           begin
             PrimaryKey.Add('CA_ID',            sdqConsulta.FieldByName('CA_ID').AsInteger);
             Fields.Add('CA_FECHAMODIF',        exDateTime);
             Fields.Add('CA_USUMODIF',          Sesion.UserID);
             SqlType := stUpdate;
           end;

         Fields.Add('CA_FECHACOMPRA',           edFCompraAltaModif.Date);
         Fields.Add('CA_REMITO',                edRemitoAltaModif.Value);
         Fields.Add('CA_CANTIDAD',              edCantCajasAltaModif.Value);
      end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmManCajas.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := False;
  Sql.TableName := 'ARCHIVO.RCA_CAJA';
  FieldBaja     := 'FECHABAJA';

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmManCajas.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0)
end;

procedure TfrmManCajas.LoadControls;
begin
  with sdqConsulta do
    begin
      edFCompraAltaModif.Date    := FieldByName('CA_FECHACOMPRA').AsDateTime;
      edRemitoAltaModif.Value    := FieldByName('CA_REMITO').AsInteger;
      edCantCajasAltaModif.Value := FieldByName('CA_CANTIDAD').AsInteger;
    end;

  VCLExtra.LockControl(edFCompraAltaModif);
end;

procedure TfrmManCajas.RefreshData;
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT CA_ID, CA_FECHACOMPRA, CA_REMITO, CA_CANTIDAD, ' +
                 'CA_FECHAALTA, CA_USUALTA, CA_FECHAMODIF, CA_USUMODIF, ' +
                 'TRUNC(CA_FECHABAJA) FECHABAJA, CA_USUBAJA ' +
            'FROM ARCHIVO.RCA_CAJA ' +
           'WHERE 1 = 1';

  sWhere := SqlBetweenDateTime(' AND CA_FECHACOMPRA ', edFechaCompraDesde.Date, edFechaCompraHasta.Date);

  if chkNoBajas.Checked then
    sWhere := sWhere + ' AND CA_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmManCajas.tbLimpiarClick(Sender: TObject);
begin
  edFechaCompraDesde.Clear;
  edFechaCompraHasta.Clear;
  edTotalRegistros.Value := 0;
  chkNoBajas.Checked     := True;

  inherited;
end;

procedure TfrmManCajas.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

function TfrmManCajas.Validar: Boolean;
var
  sWhere, sSql: String;
begin
   Verificar(edFCompraAltaModif.IsEmpty, edFCompraAltaModif, 'Debe ingresar la fecha de compra.');
   Verificar(edFCompraAltaModif.Date > DBDate(), edFCompraAltaModif, 'La fecha de compra no puede ser mayor que la fecha actual.');
   Verificar(edRemitoAltaModif.IsEmpty, edRemitoAltaModif, 'Debe ingresar el nro. de remito.');
   Verificar(edRemitoAltaModif.Value <= 0, edRemitoAltaModif, 'El nro. de remito debe ser mayor a 0.');

   if ModoABM = maAlta then
     sWhere :=  ''
   else
     sWhere := 'AND CA_ID <> ' + SqlValue(sdqConsulta.FieldByName('CA_ID').AsInteger) + ' ';

   sSql := 'SELECT 1 ' +
             'FROM ARCHIVO.RCA_CAJA ' +
            'WHERE CA_FECHABAJA IS NULL ' +
              sWhere +
              'AND CA_REMITO = ' + SqlValue(edRemitoAltaModif.Value);
   Verificar(ExisteSql(sSql), edRemitoAltaModif, 'El nro. de remito ya existe.');

   Verificar(edCantCajasAltaModif.IsEmpty, edCantCajasAltaModif, 'Debe ingresar la cantidad de cajas.');
   Verificar(edCantCajasAltaModif.Value <= 0, edCantCajasAltaModif, 'La cantidad de cajas debe ser mayor a 0.');

  Result := True;
end;

end.
