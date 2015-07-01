unit unAdministracionEfectivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, ToolEdit, DateComboBox, Menus, PatternEdit, IntEdit,
  CurrEdit;

type
  TfrmAdministracionEfectivo = class(TfrmCustomGridABM)
    gbTipo: TGroupBox;
    fraTipo: TfraStaticCTB_TABLAS;
    gbFecha: TGroupBox;
    Label2: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    gbVer: TGroupBox;
    chkSoloActivos: TCheckBox;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    pmnuImprimir: TPopupMenu;
    mnuImpMovDiarios: TMenuItem;
    mnuImpResultados: TMenuItem;
    fpImprimirMovDiarios: TFormPanel;
    Bevel1: TBevel;
    btnAceptarMovDiarios: TButton;
    btnCancelarMovDiarios: TButton;
    fraTipoImpr: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    edFechaImpr: TDateComboBox;
    Label3: TLabel;
    Label4: TLabel;
    fraTipoAlta: TfraStaticCTB_TABLAS;
    Label5: TLabel;
    edFechaAlta: TDateComboBox;
    edObservacionesAlta: TMemo;
    Label6: TLabel;
    rgTipoMovimientoAlta: TRadioGroup;
    gbIngreso: TGroupBox;
    Label7: TLabel;
    edMontoIngresoAlta: TCurrencyEdit;
    lbNumeroBoletaDeposito: TLabel;
    edOrdenPagoAlta: TIntEdit;
    gbEgreso: TGroupBox;
    Label8: TLabel;
    edMontoEgresoAlta: TCurrencyEdit;
    fraMotivoEgresoAlta: TfraStaticCTB_TABLAS;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String;  var Value: String; var CellColor, FontColor: TColor;
    													var AlignFooter: TAlingFooter);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpMovDiariosClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure rgTipoMovimientoAltaClick(Sender: TObject);
    procedure btnAceptarMovDiariosClick(Sender: TObject);
  private
    function Get_FechaCajaEfectivo: TDateTime;
      
    procedure CalcTotales;
  public
  protected
    function DoABM: boolean; override;
    function Validar: boolean; override;
    
    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

const
  MAXCOLS = 1;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('MONTO_INGRESO', 'MONTO_EGRESO');

var
  frmAdministracionEfectivo: TfrmAdministracionEfectivo;
  TotalConsulta: Array of Extended;

implementation

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, unSesion, SqlFuncs, unrptMovimientosDiarios, VCLExtra, StrFuncs;

{$R *.DFM}

function TfrmAdministracionEfectivo.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maAlta then
  begin
  	Sql.PrimaryKey.Add( 'EF_ID',       'SEQ_REF_ID.NEXTVAL', False);

    Sql.Fields.Add('EF_TIPO',          fraTipoAlta.Value);
    Sql.Fields.Add('EF_FECHA',         Get_FechaCajaEfectivo);
    Sql.Fields.Add('EF_OBSERVACIONES', edObservacionesAlta.Lines.Text);

    if rgTipoMovimientoAlta.ItemIndex = 0 then  // Ingreso
    begin
    	Sql.Fields.Add('EF_MONTOINGRESO', edMontoIngresoAlta.Value);
      Sql.Fields.Add('EF_ORDENPAGO',    edOrdenPagoAlta.Value);
    end
    else
    begin
    	Sql.Fields.Add('EF_MONTOEGRESO',  edMontoEgresoAlta.Value);
      Sql.Fields.Add('EF_MOTIVOEGRESO', fraMotivoEgresoAlta.Value);
    end;

    Sql.Fields.Add('EF_USUALTA',   Sesion.UserId);
    Sql.Fields.Add('EF_FECHAALTA', exDateTime);
  end
  else if ModoABM = maBaja then
  begin
  	Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('EF_ID',    sdqConsulta.FieldByName('ID').AsInteger);
    Sql.Fields.Add('EF_USUBAJA',   Sesion.UserId);
    Sql.Fields.Add('EF_FECHABAJA', exDateTime);
  end;

  Result := inherited DoABM;
end;

procedure TfrmAdministracionEfectivo.LoadControls;
begin
  inherited;
end;

procedure TfrmAdministracionEfectivo.ClearControls;
begin
  fraTipoAlta.Clear;
  edFechaAlta.Date := Get_FechaCajaEfectivo();
  edObservacionesAlta.Clear;
  edMontoIngresoAlta.Clear;
  edOrdenPagoAlta.Clear;
  edMontoEgresoAlta.Clear;
  fraMotivoEgresoAlta.Clear;

  rgTipoMovimientoAlta.ItemIndex := -1;
  rgTipoMovimientoAltaClick(nil);
  
  VCLExtra.LockControl(edFechaAlta);
end;

function TfrmAdministracionEfectivo.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraTipoAlta.IsEmpty, fraTipoAlta.edCodigo, 'El tipo de fondo fijo es obligatorio.');
  Verificar(rgTipoMovimientoAlta.ItemIndex = -1, rgTipoMovimientoAlta, 'El tipo de movimiento es obligatorio.');

  if rgTipoMovimientoAlta.ItemIndex = 0 then  // Ingreso
  begin
  	Verificar(edMontoIngresoAlta.Value = 0, edMontoIngresoAlta, 'El monto ingresado es obligatorio.');
//    Verificar(edOrdenPagoAlta.Value = 0, edOrdenPagoAlta, 'La orden de pago es obligatoria.');

		sSql :=
    	'SELECT 1' +
       ' FROM RCE_CHEQUEEMITIDO' +
      ' WHERE CE_ORDENPAGO = :OP';
    Verificar(not ExisteSqlEx(sSql, [edOrdenPagoAlta.Value]), edOrdenPagoAlta, 'No existe la orden de pago.');
	end
  else
  begin
  	Verificar(edMontoEgresoAlta.Value = 0, edMontoEgresoAlta, 'El monto egresado es obligatorio.');
    Verificar(fraMotivoEgresoAlta.IsEmpty, fraMotivoEgresoAlta.edCodigo, 'El motivo de egreso es obligatorio.');
  end;

  Result := True;
end;

procedure TfrmAdministracionEfectivo.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipo do
  begin
  	Clave     := 'TFFEF';
    ShowBajas := True;
  end;

  with fraTipoImpr do
  begin
    Clave     := fraTipo.Clave;
    ShowBajas := True;
  end;

  fraTipoAlta.Clave := fraTipo.Clave;

  fraMotivoEgresoAlta.Clave := 'MEEFV';

  Sql.TableName := 'REF_EFECTIVO';
  FieldBaja     := 'EF_FECHABAJA';

  SetLength(TotalConsulta, MAXCOLS + 1);

  ShowActived := False;
end;

procedure TfrmAdministracionEfectivo.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraTipo.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  chkSoloActivos.Checked := True;

  fraTipo.edCodigo.SetFocus;
end;

procedure TfrmAdministracionEfectivo.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('MONTO_INGRESO') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('MONTO_INGRESO')).Currency := True;

  if sdqConsulta.FieldByName('MONTO_EGRESO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO_EGRESO')).Currency := True;
end;

procedure TfrmAdministracionEfectivo.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sSqlWhere: String;  
begin
  sSql :=
  	'SELECT T.TB_DESCRIPCION TIPO, EF_FECHA FECHA, EF_MONTOINGRESO MONTO_INGRESO, EF_MONTOEGRESO MONTO_EGRESO,' +
    			' EF_ORDENPAGO ORDEN_PAGO, M.TB_DESCRIPCION MOTIVO_EGRESO, EF_OBSERVACIONES OBSERVACIONES,' +
    			' TRUNC(EF_FECHABAJA) FECHABAJA, EF_FECHABAJA, EF_ID ID' +
     ' FROM CTB_TABLAS M, CTB_TABLAS T, REF_EFECTIVO' +
    ' WHERE T.TB_CLAVE = ''TFFEF''' +
    	' AND T.TB_CODIGO = EF_TIPO' +
      ' AND M.TB_CLAVE(+) = ''MEEFV''' +
      ' AND M.TB_CODIGO(+) = EF_MOTIVOEGRESO';

  sSqlWhere := SqlBetweenDateTime(' AND EF_FECHA ', edFechaDesde.Date, edFechaHasta.Date);

  if not fraTipo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND EF_TIPO = ' + SqlValue(fraTipo.Value);

  if chkSoloActivos.Checked then
    sSqlWhere := sSqlWhere + ' AND EF_FECHABAJA IS NULL';

  sdqConsulta.Sql.Text := sSql + sSqlWhere + SortDialog.OrderBy;
  inherited;

  CalcTotales;
end;

procedure TfrmAdministracionEfectivo.CalcTotales;
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
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmAdministracionEfectivo.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmAdministracionEfectivo.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
																										 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmAdministracionEfectivo.mnuImpResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmAdministracionEfectivo.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmAdministracionEfectivo.mnuImpMovDiariosClick(Sender: TObject);
begin
  fpImprimirMovDiarios.ShowModal;
end;

procedure TfrmAdministracionEfectivo.tbNuevoClick(Sender: TObject);
begin
  Verificar(Get_FechaCajaEfectivo() = 0, nil, 'No existe una caja de efectivo abierta.');

  inherited;
end;

procedure TfrmAdministracionEfectivo.rgTipoMovimientoAltaClick(Sender: TObject);
var
  bHabilitarEgreso: Boolean;
  bHabilitarIngreso: Boolean;
begin
  bHabilitarIngreso := (rgTipoMovimientoAlta.ItemIndex = 0);  // Ingreso
  bHabilitarEgreso  := (rgTipoMovimientoAlta.ItemIndex = 1);  // Egreso

  VclExtra.LockControls(gbIngreso, not bHabilitarIngreso);
  VclExtra.LockControls(gbEgreso, not bHabilitarEgreso);

  if bHabilitarIngreso then
  begin
    edMontoEgresoAlta.Clear;
    fraMotivoEgresoAlta.Clear;
  end;

  if bHabilitarEgreso then
  begin
    edMontoIngresoAlta.Clear;
    edOrdenPagoAlta.Clear;
  end;
end;

function TfrmAdministracionEfectivo.Get_FechaCajaEfectivo: TDateTime;
var
  sSql: String;
begin
  sSql :=
  	'SELECT CC_FECHACAJA' +
     ' FROM RCC_CIERRECAJA' +
    ' WHERE CC_TIPO = ''V''' +
    	' AND CC_ACTIVA = ''S''';

  Result := ValorSqlDateTime(sSql);
end;

procedure TfrmAdministracionEfectivo.btnAceptarMovDiariosClick(Sender: TObject);
begin
  Verificar(fraTipoImpr.IsEmpty, fraTipoImpr.edCodigo, 'Debe indicar el tipo.');
  Verificar(edFechaImpr.IsEmpty, edFechaImpr, 'Debe indicar la fecha.');

  ImprimirMovDiarios(fraTipoImpr.Codigo, fraTipoImpr.cmbDescripcion.Text, edFechaImpr.Date);
end;

end.
