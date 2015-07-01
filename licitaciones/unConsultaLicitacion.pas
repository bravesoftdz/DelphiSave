unit unConsultaLicitacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls, ExtCtrls,
  FormPanel, CardinalEdit, CheckCombo, ToolEdit, DateComboBox, Mask, PatternEdit, ComboEditor, DBCheckCombo, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame, unArtDbFrame, Menus;

type
  TfrmConsultaLicitacion = class(TfrmCustomConsulta)
    ToolButton1: TToolButton;
    tbAgenda: TToolButton;
    tblSALIR: TToolButton;
    ToolButton2: TToolButton;
    GroupBox1: TGroupBox;
    edFechaNotificacionDesde: TDateComboBox;
    Label2: TLabel;
    edFechaNotificacionHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    edFechaAperturaDesde: TDateComboBox;
    Label1: TLabel;
    edFechaAperturaHasta: TDateComboBox;
    Label7: TLabel;
    edNumeroLicitacion: TCardinalEdit;
    lbRSocial: TLabel;
    edRazonSocial: TEdit;
    lbCUIT: TLabel;
    mskCUIT: TMaskEdit;
    popupImprimir: TPopupMenu;
    mnuImprimirListado: TMenuItem;
    mnuImprimirLicitacion: TMenuItem;
    procedure tbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblSALIRClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fraVendedorcmbDescripcionDropDown(Sender: TObject);
    procedure fraEntidadcmbDescripcionDropDown(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mnuImprimirListadoClick(Sender: TObject);
    procedure mnuImprimirLicitacionClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
  private
  public
  end;

var
  frmConsultaLicitacion: TfrmConsultaLicitacion;

implementation

uses
  General, AnsiSQL, SqlFuncs, unDmPrincipal, unPrincipal, unGestion, CustomDlgs, unRptLicitacion, Printers;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.tbSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.tbRefrescarClick(Sender: TObject);
var
  sWhere : String;
  sSql   : String;
begin
  sWhere := '';
  sSql :=
    'SELECT EL_NOMBRE, LI_CAPITAS, UTILES.Armar_CUIT(LI_CUIT) CUIT, LI_FECHAAPERTURA, LI_FECHABAJA, LI_FECHANOTIFICACION, LI_ID, LI_MASA,' +
    '       LI_NROLICITACION, LI_RAZONSOCIAL' +
    '  FROM ALI_LICITACION, DEL_DELEGACION' +
    ' WHERE LI_IDDELEGACION = EL_ID';

	if edNumeroLicitacion.Value <> 0 then
  	sWhere := sWhere + ' AND LI_NROLICITACION = ' + IntToStr(edNumeroLicitacion.Value);

	if edRazonSocial.Text <> '' then
  	sWhere := sWhere + ' AND LI_RAZONSOCIAL LIKE ' + SqlValue(edRazonSocial.Text + '%');

	if mskCUIT.Text <> '' then
  	sWhere := sWhere + ' AND LI_CUIT = ' + SqlValue(mskCUIT.Text);

	if not edFechaNotificacionDesde.IsEmpty then
  begin
  	if not edFechaNotificacionHasta.IsEmpty then
    begin
    	sWhere := sWhere + ' AND LI_FECHANOTIFICACION >= ' + SqlDate(edFechaNotificacionDesde.Date);
      sWhere := sWhere + ' AND LI_FECHANOTIFICACION <= ' + SqlDate(edFechaNotificacionHasta.Date);
    end
    else
    	sWhere := sWhere + ' AND LI_FECHANOTIFICACION >= ' + SqlDate(edFechaNotificacionDesde.Date);
  end
  else
  	if not edFechaNotificacionHasta.IsEmpty then
			sWhere := sWhere + ' AND LI_FECHANOTIFICACION <= ' + SqlDate(edFechaNotificacionHasta.Date);

	if not edFechaAperturaDesde.IsEmpty then
  begin
  	if not edFechaAperturaHasta.IsEmpty then
    begin
    	sWhere := sWhere + ' AND LI_FECHAAPERTURA >= ' + SqlDate(edFechaAperturaDesde.Date);
      sWhere := sWhere + ' AND LI_FECHAAPERTURA <= ' + SqlDate(edFechaAperturaHasta.Date);
    end
    else
    	sWhere := sWhere + ' AND LI_FECHAAPERTURA >= ' + SqlDate(edFechaAperturaDesde.Date);
  end
  else
  	if not edFechaAperturaHasta.IsEmpty then
			sWhere := sWhere + ' AND LI_FECHAAPERTURA <= ' + SqlDate(edFechaAperturaHasta.Date);

	sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  if sdqConsulta.IsEmpty then
  	MsgBox( 'No existen datos para esta selección', MB_ICONEXCLAMATION, 'Atención');

  tbModificar.Visible := not sdqConsulta.IsEmpty;
  tbEliminar.Visible := tbModificar.Visible;
  tbAgenda.Visible := tbModificar.Visible;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.tbLimpiarClick(Sender: TObject);
begin
	edFechaAperturaDesde.Clear;
  edFechaAperturaHasta.Clear;
	edFechaNotificacionDesde.Clear;
  edFechaNotificacionHasta.Clear;
  edNumeroLicitacion.Clear;
  edRazonSocial.Clear;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.FormCreate(Sender: TObject);
begin
  inherited;
  tbLimpiarClick(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.tblSALIRClick(Sender: TObject);
begin
  inherited;
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

	tbModificar.Enabled := sdqConsulta.FieldByName('LI_FECHABAJA').IsNull;
	tbEliminar.Enabled := tbModificar.Enabled;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.fraVendedorcmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.fraEntidadcmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.tbNuevoClick(Sender: TObject);
begin
  inherited;

  if frmGestion <> nil then
  	frmGestion.Close;
  frmGestion := TfrmGestion.Create(nil);
  frmGestion.Agregar;
  frmGestion.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.tbModificarClick(Sender: TObject);
begin
  inherited;

  if frmGestion <> nil then
  	frmGestion.Close;
  frmGestion := TfrmGestion.Create(nil);
  frmGestion.Editar(sdqConsulta.FieldByName('LI_ID').AsInteger);
  frmGestion.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.tbEliminarClick(Sender: TObject);
var
	sSqlTrans: TSql;
begin
	if not MsgAsk('¿ Realmente desea dar de baja esta licitación ?', 'Advertencia') then
  	Exit;

  inherited;

	sSqlTrans := TSQL.Create('ALI_LICITACION');
  try
    sSqlTrans.PrimaryKey.Add('LI_ID', sdqConsulta.FieldByName('LI_ID').AsInteger, False);
    sSqlTrans.Fields.Add('LI_FECHABAJA', SQL_ACTUALDATE, False);
    sSqlTrans.Fields.Add('LI_USUBAJA', frmPrincipal.DBLogin.UserId);
    sSqlTrans.SqlType := stUpdate;
    try
      EjecutarSQL(sSqlTrans.Sql);
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      sdqConsulta.Close;
      OpenQuery(sdqConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
	finally
  	sSqlTrans.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaLicitacion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
	Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('LI_FECHABAJA').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;

procedure TfrmConsultaLicitacion.mnuImprimirListadoClick(Sender: TObject);
begin
	PrintResults;
end;

procedure TfrmConsultaLicitacion.mnuImprimirLicitacionClick(Sender: TObject);
begin
	if not Grid.DataSource.DataSet.Active then
  begin
    MessageDlg('Por favor, seleccione un registro.', mtWarning, [mbOK], 0);
  	Exit;
  end;

  if Grid.DataSource.DataSet.FieldByName('LI_ID').AsInteger < 1 then
  begin
    MessageDlg('Por favor, seleccione un registro.', mtWarning, [mbOK], 0);
  	Exit;
  end;

	with TPrinterSetupDialog.Create(nil) do
  try
    if Execute then
    begin
      Application.CreateForm(TrptLicitacion, rptLicitacion);
      try
        rptLicitacion.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
        rptLicitacion.Mostrar(Grid.DataSource.DataSet.FieldByName('LI_ID').AsInteger);
      finally
        FreeAndNil(rptLicitacion);
      end;
    end;
  finally
  	Free;
  end;
end;

procedure TfrmConsultaLicitacion.tbImprimirClick(Sender: TObject);
begin
	tbImprimir.CheckMenuDropdown;
end;

end.
