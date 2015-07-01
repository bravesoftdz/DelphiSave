unit unDevolucionesSinAsignar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, FormPanel, StdCtrls, Mask, ToolEdit, CurrEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Buttons, unArt;

type
  TfrmDevolucionesSinAsignar = class(TfrmCustomConsulta)
    fpAsignar: TFormPanel;
    ToolBar1: TToolBar;
    tbRefrescarAplicacion: TToolButton;
    ToolButton2: TToolButton;
    tbAltaAplicacion: TToolButton;
    tbBajaAplicacion: TToolButton;
    ToolButton12: TToolButton;
    tbOrdenarAplicacion: TToolButton;
    ToolButton25: TToolButton;
    tbSalirAplicacion: TToolButton;
    gridAplicaciones: TArtDBGrid;
    fpAsignarABM: TFormPanel;
    Label1: TLabel;
    Label2: TLabel;
    fraTipoAplicacion: TfraCodDesc;
    edImporte: TCurrencyEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    sdqAplicaciones: TSDQuery;
    dsAplicaciones: TDataSource;
    pnBusqueda: TPanel;
    sortDialogAplicaciones: TSortDialog;
    Panel1: TPanel;
    edTotal: TCurrencyEdit;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    procedure FSFormShow(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbSalirAplicacionClick(Sender: TObject);
    procedure tbBajaAplicacionClick(Sender: TObject);
    procedure tbRefrescarAplicacionClick(Sender: TObject);
    procedure tbAltaAplicacionClick(Sender: TObject);
    procedure fpAsignarShow(Sender: TObject);
    procedure sdqAplicacionesAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarAplicacionClick(Sender: TObject);
    procedure gridAplicacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fpAsignarClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    pEmbargo: TTableId;
  	procedure Clear;
    procedure RefrescarGrillaAplicacion(const aDevolucionId: TTableId);
    function BuscarEmbargo: TTableId;
    procedure CalcTotales;
  protected
    procedure RefreshData; override;
  public
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: array [0..MAXCOLS] of string = ('IMPORTE');

var
  frmDevolucionesSinAsignar: TfrmDevolucionesSinAsignar;
  TotalConsulta: array of extended;

implementation

uses
	unSesion, CustomDlgs, AnsiSql, unDmPrincipal, unBuscarEmbargo, Numeros, DbFuncs,
  General, StrFuncs;

{$R *.dfm}

procedure TfrmDevolucionesSinAsignar.Clear;
begin
	fraTipoAplicacion.Clear;
  edImporte.Clear;
end;

procedure TfrmDevolucionesSinAsignar.RefrescarGrillaAplicacion(const aDevolucionId: TTableId);
var
	sSql: String;
begin
	with sdqAplicaciones do
  begin
  	Close;
    ParamByName('iddevolucion').AsInteger := aDevolucionId;
    Open;
  end;

	sSql :=
    'SELECT SUM(ae_importe * ta_operacion) total' +
     ' FROM lta_tipoaplicacionembargo, lae_aplicacionembargo' +
    ' WHERE ta_id = ae_idtipoaplicacion' +
      ' AND ae_fechabaja IS NULL' +
      ' AND ae_iddevolucion = :iddevolucion';
  edTotal.Value := ValorSqlExtendedEx(sSql, [aDevolucionId]);
end;

procedure TfrmDevolucionesSinAsignar.FSFormShow(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmDevolucionesSinAsignar.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
	TFloatField(sdqConsulta.FieldByName('Importe')).Currency := True;
end;

procedure TfrmDevolucionesSinAsignar.tbNuevoClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay ningún registro seleccionado');

	fpAsignar.ShowModal;
end;

procedure TfrmDevolucionesSinAsignar.btnAceptarClick(Sender: TObject);
var
	eImporte1: Extended;
  eImporte2: Extended;
	sSql: String;
begin
	Verificar(fraTipoAplicacion.IsEmpty, fraTipoAplicacion.edCodigo, 'El campo Tipo de Aplicación es obligatorio.');
	Verificar(edImporte.Value = 0, edImporte, 'El campo Importe es obligatorio.');

  if fraTipoAplicacion.sdqDatos.FieldByName('TA_REINTEGROEMBARGO').AsString = 'S' then
  begin
  	sSql :=
      'SELECT - NVL(SUM(ae_importe * ta_operacion), 0) total' +
       ' FROM lta_tipoaplicacionembargo, lae_aplicacionembargo' +
      ' WHERE ta_id = ae_idtipoaplicacion' +
        ' AND ae_fechabaja IS NULL' +
        ' AND (   ta_generapago = ''S''' +
             ' OR ta_reintegroembargo = ''S'')' +
        ' AND ae_idembargo = :embargoid';
		eImporte1 := ValorSqlExtendedEx(sSql, [pEmbargo]);

    sSql :=
      'SELECT em_importe' +
       ' FROM lem_embargo' +
      ' WHERE em_id = :embargoid';
    eImporte2 := ValorSqlExtendedEx(sSql, [pEmbargo]);

    Verificar(ToleranceCompare2(edImporte.Value + eImporte1, eImporte2) > 0, edImporte, 'El importe total aplicado ($ ' + FloatToStr(edImporte.Value + eImporte1) + ') no puede ser mayor al monto del embargo ($ ' + FloatToStr(eImporte2) + ').');
  end;

  sSql :=
    'INSERT INTO lae_aplicacionembargo' +
               ' (ae_id, ae_idembargo, ae_idtipoaplicacion, ae_iddevolucion, ae_importe, ae_usualta, ae_fechaalta)' +
        ' VALUES (' + SqlValue(GetSecNextVal('LEGALES.SEQ_LAE_ID')) + ', ' +
        							SqlValue(pEmbargo) + ', ' +
                      SqlValue(fraTipoAplicacion.Value) + ', ' +
                      SqlValue(sdqConsulta.FieldByName('ve_id').AsInteger) + ', ' +
                      SqlValue(edImporte.Value) + ', ' +
                      SqlValue(Sesion.UserID) +
                      ', SYSDATE)';
  EjecutarSql(sSql);
	fpAsignarABM.Close;
  RefrescarGrillaAplicacion(sdqConsulta.FieldByName('ve_id').AsInteger);
end;

procedure TfrmDevolucionesSinAsignar.btnCancelarClick(Sender: TObject);
begin
	fpAsignarABM.Close;
end;

function TfrmDevolucionesSinAsignar.BuscarEmbargo: TTableId;
begin
	Application.CreateForm(TfrmBuscarEmbargo, frmBuscarEmbargo);
  with frmBuscarEmbargo do
  begin
	  if Buscar then
    	Result := EmbargoId
    else
      Result := ART_EMPTY_ID;
  end;
end;

procedure TfrmDevolucionesSinAsignar.tbSalirAplicacionClick(Sender: TObject);
begin
	fpAsignar.Close;
end;

procedure TfrmDevolucionesSinAsignar.tbBajaAplicacionClick(Sender: TObject);
var
	sSql: String;
begin
	if (not sdqAplicaciones.Active) or (sdqAplicaciones.IsEmpty) then
  	Exit;

	if MsgAsk('¿ Realmente desea dar de baja este registro ?') then
  begin
  	sSql :=
    	'UPDATE lae_aplicacionembargo' +
	      ' SET ae_usubaja = ' + SqlValue(Sesion.UserID) +
		       ', ae_fechabaja = SYSDATE' +
      ' WHERE ae_id = ' + SqlValue(sdqAplicaciones.FieldByName('ae_id').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarAplicacionClick(nil);
	end;
end;

procedure TfrmDevolucionesSinAsignar.tbRefrescarAplicacionClick(Sender: TObject);
begin
  RefrescarGrillaAplicacion(sdqConsulta.FieldByName('ve_id').AsInteger);
end;

procedure TfrmDevolucionesSinAsignar.tbAltaAplicacionClick(Sender: TObject);
begin
  pEmbargo := BuscarEmbargo();
	Verificar(pEmbargo = ART_EMPTY_ID, tbAltaAplicacion, 'Debe seleccionar un embargo.');

	Clear;
	fpAsignarABM.ShowModal;
end;

procedure TfrmDevolucionesSinAsignar.fpAsignarShow(Sender: TObject);
begin
  RefrescarGrillaAplicacion(sdqConsulta.FieldByName('ve_id').AsInteger);
end;

procedure TfrmDevolucionesSinAsignar.sdqAplicacionesAfterOpen(DataSet: TDataSet);
begin
	TFloatField(sdqAplicaciones.FieldByName('Importe')).Currency := True;
	TFloatField(sdqAplicaciones.FieldByName('Importe_Emb')).Currency := True;
end;

procedure TfrmDevolucionesSinAsignar.tbOrdenarAplicacionClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, gridAplicaciones.Columns);
  sortDialogAplicaciones.Execute;
end;

procedure TfrmDevolucionesSinAsignar.gridAplicacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqAplicaciones.FieldByName('baja').IsNull then
		AFont.Color := clRed;
end;

procedure TfrmDevolucionesSinAsignar.fpAsignarClose(Sender: TObject; var Action: TCloseAction);
var
  sSql: String;
  dTotal: Currency;
begin
  sSql := 'SELECT - NVL(SUM(AE_IMPORTE * TA_OPERACION), 0) ' +
            'FROM LTA_TIPOAPLICACIONEMBARGO, LAE_APLICACIONEMBARGO ' +
           'WHERE TA_ID = AE_IDTIPOAPLICACION ' +
             'AND AE_FECHABAJA IS NULL ' +
             'AND AE_IDDEVOLUCION = :Iddevolucion';
  dTotal := ValorSqlExtendedEx(sSql, [sdqConsulta.FieldByName('ve_id').AsInteger]);
                 
  if ToleranceCompare2(dTotal, sdqConsulta.FieldByName('importe').AsCurrency) = 0 then
    begin
      sSql := 'UPDATE LVE_DEVOLUCIONEMBARGO ' +
                 'SET VE_ASIGNADO = ''S'' ' +
               'WHERE VE_ID = :Id';
      EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('ve_id').AsInteger]);

      RefreshData;
    end;

  inherited;
end;

procedure TfrmDevolucionesSinAsignar.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active Then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmDevolucionesSinAsignar.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS+1);
end;

procedure TfrmDevolucionesSinAsignar.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmDevolucionesSinAsignar.RefreshData;
begin
  inherited;
  CalcTotales;
end;

procedure TfrmDevolucionesSinAsignar.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

end.


