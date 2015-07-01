unit unRecExtrDevolucionesSinAsignar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, FormPanel, StdCtrls, Mask, ToolEdit, CurrEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Buttons;

type
  TfrmRecExtrDevolucionesSinAsignar = class(TfrmCustomConsulta)
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
    gbJuicioBuscar: TGroupBox;
    edJuicioBuscar: TEdit;
    btnBuscarJuicio: TBitBtn;
    sortDialogAplicaciones: TSortDialog;
    Panel1: TPanel;
    edTotal: TCurrencyEdit;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    Panel2: TPanel;
    checkSoloSinAsignar: TCheckBox;
    ToolButton1: TToolButton;
    procedure FSFormShow(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscarJuicioClick(Sender: TObject);
    procedure tbSalirAplicacionClick(Sender: TObject);
    procedure tbBajaAplicacionClick(Sender: TObject);
    procedure tbRefrescarAplicacionClick(Sender: TObject);
    procedure tbAltaAplicacionClick(Sender: TObject);
    procedure fpAsignarShow(Sender: TObject);
    procedure sdqAplicacionesAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarAplicacionClick(Sender: TObject);
    procedure gridAplicacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPermitirAsignar: Boolean;
  	procedure Clear;
    procedure RefrescarGrillaAplicacion(const aJuicioId: Integer);
    procedure SetPermitirAsignar(const Value: Boolean);
  public
    property PermitirAsignar: Boolean        read FPermitirAsignar         write SetPermitirAsignar;
  end;

var
  frmRecExtrDevolucionesSinAsignar: TfrmRecExtrDevolucionesSinAsignar;

implementation

uses
	unSesion, CustomDlgs, AnsiSql, unDmPrincipal, unBuscarJuicio, VCLExtra, Numeros;

{$R *.dfm}

procedure TfrmRecExtrDevolucionesSinAsignar.Clear;
begin
	fraTipoAplicacion.Clear;
  edImporte.Clear;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.RefrescarGrillaAplicacion(const aJuicioId: Integer);
var
	sSql: String;
begin
	with sdqAplicaciones do
  begin
  	Close;
    ParamByName('IdJuicio').AsInteger := edJuicioBuscar.Tag;
    Open;
  end;

	sSql :=
    'SELECT SUM(ar_importe * tr_operacion) total' +
     ' FROM ltr_tipoaplicacionrecext, lar_aplicacionrecursoext' +
    ' WHERE tr_id = ar_idtipoaplicacion' +
      ' AND ar_fechabaja IS NULL' +
      ' AND ar_idjuicio = :idjuicio';
  edTotal.Value := ValorSqlExtendedEx(sSql, [edJuicioBuscar.Tag]);
end;


procedure TfrmRecExtrDevolucionesSinAsignar.FSFormShow(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  
	TFloatField(sdqConsulta.FieldByName('Importe')).Currency := True;
	TFloatField(sdqConsulta.FieldByName('Saldo')).Currency := True;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbNuevoClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay ningún registro seleccionado');

	fpAsignar.ShowModal;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.btnAceptarClick(Sender: TObject);
var
	eImporte1: Extended;
  eImporte2: Extended;
	sSql: String;
begin
	Verificar(fraTipoAplicacion.IsEmpty, fraTipoAplicacion.edCodigo, 'El campo Tipo de Aplicación es obligatorio.');
	Verificar(edImporte.Value = 0, edImporte, 'El campo Importe es obligatorio.');

  if fraTipoAplicacion.sdqDatos.FieldByName('TR_REINTEGRO').AsString = 'S' then
  begin
  	sSql :=
      'SELECT - NVL(SUM(ar_importe * tr_operacion), 0) total' +
       ' FROM ltr_tipoaplicacionrecext, lar_aplicacionrecursoext' +
      ' WHERE tr_id = ar_idtipoaplicacion' +
        ' AND ar_fechabaja IS NULL' +
        ' AND (   tr_generapago = ''S''' +
             ' OR tr_reintegro = ''S'')' +
        ' AND ar_idjuicio = :idjuicio';
		eImporte1 := ValorSqlExtendedEx(sSql, [edJuicioBuscar.Tag]);

    sSql :=
      'SELECT legales.get_monto_recextraordinario(:Id, ''05'') ' +
       ' FROM Dual';
    eImporte2 := ValorSqlExtendedEx(sSql, [edJuicioBuscar.Tag]);

    Verificar(ToleranceCompare2(edImporte.Value + eImporte1, eImporte2) > 0, edImporte, 'El importe aplicado no puede ser mayor al monto del juicio.');
  end;


  sSql :=
    'INSERT INTO lar_aplicacionrecursoext' +
               ' (ar_id, ar_idjuicio, ar_idtipoaplicacion, ar_iddevolucion, ar_importe, ar_usualta, ar_fechaalta)' +
        ' VALUES (' + SqlValue(GetSecNextVal('LEGALES.SEQ_LAR_ID')) + ', ' +
        							SqlValue(edJuicioBuscar.Tag) + ', ' +
                      SqlValue(fraTipoAplicacion.Value) + ', ' +
                      SqlValue(sdqConsulta.FieldByName('dr_id').AsInteger) + ', ' +
                      SqlValue(edImporte.Value) + ', ' +
                      SqlValue(Sesion.UserID) +
                      ', SYSDATE)';
  EjecutarSql(sSql);
	fpAsignarABM.Close;
  RefrescarGrillaAplicacion(edJuicioBuscar.Tag);
end;

procedure TfrmRecExtrDevolucionesSinAsignar.btnCancelarClick(Sender: TObject);
begin
	fpAsignarABM.Close;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.btnBuscarJuicioClick(Sender: TObject);
begin
	Application.CreateForm(TfrmBuscarJuicio, frmBuscarJuicio);
  with frmBuscarJuicio do
  begin
	  if Buscar then
    begin
    	edJuicioBuscar.Tag  := JuicioId;
///  		edJuicioBuscar.Text := Format('%s', [FormatFloat('$ #,##0.00', Importe)]);
    	edJuicioBuscar.Text := Format('%s', [FormatFloat('$ #,##0.00', sdqConsulta.FieldByName('Importe').AsCurrency)]);
    end;
  end;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbSalirAplicacionClick(Sender: TObject);
begin
	fpAsignar.Close;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbBajaAplicacionClick(Sender: TObject);
var
	sSql: String;
begin
	if (not sdqAplicaciones.Active) or (sdqAplicaciones.IsEmpty) then
  	Exit;

	if MsgAsk('¿ Realmente desea dar de baja este registro ?') then
  begin
  	sSql :=
    	'UPDATE lar_aplicacionrecursoext' +
	      ' SET ar_usubaja = ' + SqlValue(Sesion.UserID) +
		       ', ar_fechabaja = SYSDATE' +
      ' WHERE ar_id = ' + SqlValue(sdqAplicaciones.FieldByName('ar_id').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarAplicacionClick(nil);
	end;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbRefrescarAplicacionClick(Sender: TObject);
begin
	Verificar(edJuicioBuscar.Tag < 1, edJuicioBuscar, 'Debe seleccionar un juicio.');

  RefrescarGrillaAplicacion(edJuicioBuscar.Tag);
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbAltaAplicacionClick(Sender: TObject);
begin
	Verificar(edJuicioBuscar.Tag < 1, edJuicioBuscar, 'Debe seleccionar un juicio.');

	Clear;
	fpAsignarABM.ShowModal;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.fpAsignarShow(Sender: TObject);
var
  sSql: String;
  bHabilitarBuscar: Boolean;
begin
  bHabilitarBuscar := sdqConsulta.FieldByName('IDJUICIO').IsNull;

  if not bHabilitarBuscar then
    begin
    	edJuicioBuscar.Text := Format('%s', [FormatFloat('$ #,##0.00', sdqConsulta.FieldByName('Importe').AsCurrency)]);
      edJuicioBuscar.Tag  := sdqConsulta.FieldByName('IDJUICIO').AsInteger;
    end
  else
    edJuicioBuscar.Clear;

  VCLExtra.LockControls([gbJuicioBuscar], not bHabilitarBuscar);

   if bHabilitarBuscar then
     begin
       sSql :=
         'SELECT DISTINCT ar_idjuicio, jt_importerecursoextraord, null jt_fecha' +
                   ' FROM lar_aplicacionrecursoext lar' +
              ' LEFT JOIN legales.ljt_juicioentramite ljt ON (ljt.jt_id = lar.ar_idjuicio)' +
                  ' WHERE ar_iddevolucion = :iddevolucion' +
                    ' AND ar_fechabaja IS NULL';

       with GetQueryEx(sSql, [sdqConsulta.FieldByName('dr_id').AsInteger]) do
       try
         btnBuscarJuicio.Enabled := IsEmpty;
         if IsEmpty then
           begin
             edJuicioBuscar.Tag := 0;
             edJuicioBuscar.Clear;
           end
         else
           begin
             edJuicioBuscar.Tag  := FieldByName('ar_idjuicio').AsInteger;
////             edJuicioBuscar.Text := Format('%s', [FormatFloat('$ #,##0.00', FieldByName('jt_importerecursoextraord').AsFloat)]);
             edJuicioBuscar.Text := Format('%s', [FormatFloat('$ #,##0.00', sdqConsulta.FieldByName('Importe').AsCurrency)]);
           end;
       finally
         Free;
       end;
     end;

  RefrescarGrillaAplicacion(edJuicioBuscar.Tag);
end;

procedure TfrmRecExtrDevolucionesSinAsignar.sdqAplicacionesAfterOpen(DataSet: TDataSet);
begin
	TFloatField(sdqAplicaciones.FieldByName('Importe')).Currency := True;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbOrdenarAplicacionClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, gridAplicaciones.Columns);
  sortDialogAplicaciones.Execute;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.gridAplicacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqAplicaciones.FieldByName('baja').IsNull then
		AFont.Color := clRed;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.SetPermitirAsignar(const Value: Boolean);
begin
  if FPermitirAsignar <> Value then
    FPermitirAsignar := Value;

  tbNuevo.Enabled  := Value;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT DR_CARATULA CARATULA, DR_ID, JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, ' +
                 'JZ_DESCRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRETARIA, ' +
                 'BA_NOMBRE BANCO, CB_NUMERO CUENTA, DR_IMPORTE IMPORTE, DR_FECHA FECHA, ' +
                 'DR_OFICIO OFICIO, DR_OBSERVACIONES OBSERVACIONES, DR_IDJUICIO IDJUICIO, ' +
                 'LEGALES.GET_SALDODEVOLRECEXTR(DR_ID) SALDO, JT_NUMEROCARPETA CARPETA ' +
            'FROM LEGALES.LJT_JUICIOENTRAMITE, ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJU_JURISDICCION, ' +
                 'LEGALES.LFU_FUERO, LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGALES.LSC_SECRETARIA, ' +
                 'LDR_DEVOLUCIONRECURSOEXT ' +
           'WHERE CB_ID = DR_IDCUENTABANCARIA ' +
             'AND BA_ID = CB_IDBANCO ' +
             'AND IN_ID = JZ_IDINSTANCIA ' +
             'AND JU_ID = DR_IDJURISDICCION ' +
             'AND FU_ID = DR_IDFUERO ' +
             'AND JZ_ID = DR_IDJUZGADO ' +
             'AND SC_ID = DR_IDSECRETARIA ' +
             'AND DR_IDJUICIO = JT_ID(+)';

  if checkSoloSinAsignar.Checked then
		sWhere := sWhere + ' AND LEGALES.GET_SALDODEVOLRECEXTR(DR_ID) > 0';

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  checkSoloSinAsignar.Checked := True;
end;

procedure TfrmRecExtrDevolucionesSinAsignar.FormCreate(Sender: TObject);
begin
  inherited;

  tbRefrescarClick(nil);
end;

end.

