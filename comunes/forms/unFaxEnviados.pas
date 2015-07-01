unit unFaxEnviados;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, {$ELSE} Placemnt, ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, Mask, DateComboBox, unArtFrame, unfraUsuarios,
  unFraVistaTIFF, JvgGroupBox, DBCtrls, JvExExtCtrls, JvNetscapeSplitter;

type
  TfrmFaxEnviados = class(TfrmCustomConsulta)
    Label1: TLabel;
    fraUsuario: TfraUsuario;
    gbFecha: TGroupBox;
    Label4: TLabel;
    cmbFechaDesde: TDateComboBox;
    cmbFechaHasta: TDateComboBox;
    fraVistaTIFF: TfraVistaTIFF;
    cmbEstados: TComboBox;
    Label2: TLabel;
    sdqConsultaESTADO: TStringField;
    sdqConsultaFS_ID: TFloatField;
    sdqConsultaFS_TIPO: TStringField;
    sdqConsultaFS_ESTADO: TStringField;
    sdqConsultaFS_FECHA: TDateTimeField;
    sdqConsultaFS_ORIGDEST: TStringField;
    sdqConsultaFS_ARCHASOC: TStringField;
    sdqConsultaFS_CASILLA: TFloatField;
    sdqConsultaFS_FECHAPROXENV: TDateTimeField;
    sdqConsultaFS_REINTENTO: TFloatField;
    sdqConsultaFS_CANTPAG: TFloatField;
    sdqConsultaFS_TIEMPO: TFloatField;
    sdqConsultaFS_CANAL: TFloatField;
    sdqConsultaFS_DESCRIPCION: TStringField;
    sdqConsultaFS_USUARIO: TStringField;
    sdqConsultaFS_TIPODEDOCUMENTO: TStringField;
    sdqConsultaFS_TIPODEDESTINATARIO: TStringField;
    sdqConsultaFS_IDDESTINATARIO: TFloatField;
    sdqConsultaFS_SECTOR: TStringField;
    sdqConsultaFS_CLAVE: TStringField;
    gbDatosExtra: TJvgGroupBox;
    pnlBottom: TPanel;
    pnlVisualizando: TPanel;
    pnlSeleccionados: TPanel;
    sdqConsultaIMAGEN: TStringField;
    edFS_USUARIO: TDBEdit;
    Label3: TLabel;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    pnlStatus4: TPanel;
    pnlStatus3: TPanel;
    pnlStatus2: TPanel;
    pnlStatus1: TPanel;
    pnlStatus0: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
  private
    SqlBase: string;
    procedure AjusteGrilla;
  protected
    procedure RefreshData; override;
  public
  end;

var
  frmFaxEnviados: TfrmFaxEnviados;

implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, unGrids, General, VCLExtra, unDmPrincipal,
  unSesion;

{$R *.DFM}

{ TfrmFaxEnviados }

procedure TfrmFaxEnviados.RefreshData;
var
  sSQL: string;
begin
  sSQL := SQLBase;

  case cmbEstados.ItemIndex of
    0: AddCondition(sSQL, 'FS_ESTADO = ' + IntToStr(1)); 
    1: AddCondition(sSQL, 'FS_ESTADO = ' + IntToStr(2));
    2: AddCondition(sSQL, 'FS_ESTADO = ' + IntToStr(3));
    3: AddCondition(sSQL, 'FS_ESTADO = ' + IntToStr(4));
    4: AddCondition(sSQL, 'FS_ESTADO = ' + IntToStr(8));
  end;

  if fraUsuario.IsSelected then
    sSQL := sSQL + ' AND FS_USUARIO = ' + SQLValue(fraUsuario.UserID);

  sSQL := sSQL + SqlBetweenDateTime(' AND FS_FECHA', cmbFechaDesde.Date, cmbFechaHasta.Date, True);

  Verificar(sSQL = SQLBase, nil, 'Debe seleccionar al menos un filtro.');

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmFaxEnviados.FormCreate(Sender: TObject);
begin
  inherited;
  AutoColWidths := True;
  SqlBase := sdqConsulta.SQL.Text;
  fraVistaTIFF.cmbAjuste.ItemIndex := 0;
  pnlBottom.Caption := '';
  fraUsuario.Cargar(Sesion.UserID);
  cmbFechaDesde.Date := DBDate - 7;
  fraUsuario.OnChange := tbRefrescarClick;
end;

procedure TfrmFaxEnviados.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with sdqConsulta do
  begin
    FetchAll;
//    Grid.ColumnByField['FILA'].Width := 34;
//    Grid.ColumnByField['CHECKBOX'].Width := 24;
    AjusteGrilla;
    if Active and not IsEmpty then
      pnlBottom.Caption := Format('Se encontraron %d fax enviados', [RecordCount]) + iif(tbMaxRegistros.Down and (RecordCount >= MaxRegistros), ' (Tenga en cuenta que esta búsqueda fue acotada por la cantidad máxima de registros)', '');
  end;
end;

procedure TfrmFaxEnviados.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if DataSet.Active and not DataSet.IsEmpty then
  try
    fraVistaTIFF.Mensaje := '';
    fraVistaTIFF.Image := DataSet.FieldByName('IMAGEN').AsString;
  except
    fraVistaTIFF.Mensaje := 'Error al leer la imagen.';
  end;
end;

procedure TfrmFaxEnviados.AjusteGrilla;
begin
  Grid.Width := GetColumnWidths(Grid) + 25;
end;

procedure TfrmFaxEnviados.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  fraVistaTIFF.Image := '';
end;

procedure TfrmFaxEnviados.tbLimpiarClick(Sender: TObject);
begin
  pnlBottom.Caption := '';
  fraVistaTIFF.Image := '';
  pnlSeleccionados.Caption := '';
  VclExtra.LockControl(pnlFiltros, False);
  fraUsuario.Cargar(Sesion.UserID);
  cmbEstados.Clear;
  cmbFechaDesde.Date := DBDate - 7;
  cmbFechaHasta.Clear;
  inherited;
end;

procedure TfrmFaxEnviados.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (Field.FullName = 'ESTADO') then
  begin
    case sdqConsulta.FindField('FS_ESTADO').AsInteger of
      1: BackGround := pnlStatus0.Color;
      2: BackGround := pnlStatus1.Color;
      3: BackGround := pnlStatus2.Color;
      4: BackGround := pnlStatus3.Color;
      8: BackGround := pnlStatus4.Color;
    end;
  end else
    BackGround := clWhite;
end;

end.
