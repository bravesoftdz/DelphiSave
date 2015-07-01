unit unManCoeficientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit,
  CurrEdit, DateComboBox, unArtFrame, unFraStaticCodigoDescripcion, unfraStaticActividad, unArtDBAwareFrame, PatternEdit, IntEdit, JvExControls, JvComponent,
  JvSpecialProgress, Excel2000, OleServer, Variants;

type
  TfrmManCoeficientes = class(TfrmCustomGridABM)
    GroupBox8: TGroupBox;
    Label12: TLabel;
    edFechaDesdeBusqueda: TDateComboBox;
    edFechaHastaBusqueda: TDateComboBox;
    Label2: TLabel;
    edCoeficiente: TCurrencyEdit;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    Label6: TLabel;
    edFechaHasta: TDateComboBox;
    Label3: TLabel;
    edNombre: TEdit;
    Label4: TLabel;
    memoObservaciones: TMemo;
    GroupBox1: TGroupBox;
    edNombreBusqueda: TEdit;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManCoeficientes: TfrmManCoeficientes;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion, DateTimeFuncs;

{$R *.DFM}

procedure TfrmManCoeficientes.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('ct_coeficiente')).DisplayFormat   := '% 0.00;-% 0.00';
end;

procedure TfrmManCoeficientes.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
end;

procedure TfrmManCoeficientes.ClearControls;
begin
  edNombre.Clear;
  edCoeficiente.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  memoObservaciones.Lines.Clear;
end;


function TfrmManCoeficientes.DoABM: Boolean;
var
  iId: Integer;
begin
  iId := -1;

  Sql.Clear;
  Sql.TableName := 'afi.act_coeficiente';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId := sdqConsulta.FieldByName('ct_id').AsInteger;

    Sql.Fields.Add('ct_usubaja',   Sesion.UserID);
    Sql.Fields.Add('ct_fechabaja', SQL_DATETIME, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      iId := 0;

      Sql.Fields.Add('ct_usualta',   Sesion.UserID);
      Sql.Fields.Add('ct_fechaalta', SQL_DATETIME, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      iId  := sdqConsulta.FieldByName('ct_id').AsInteger;

      Sql.Fields.Add('ct_usumodif',   Sesion.UserID);
      Sql.Fields.Add('ct_fechamodif', SQL_DATETIME, False);
    end;

    Sql.Fields.Add('ct_nombre',      edNombre.Text);
    Sql.Fields.Add('ct_coeficiente', edCoeficiente.Value, 2);
    Sql.Fields.Add('ct_fechadesde',  edFechaDesde.Date);
    Sql.Fields.Add('ct_fechahasta',  edFechaHasta.Date);
    Sql.Fields.Add('ct_observacion', memoObservaciones.Lines.Text);
  end;

  Sql.PrimaryKey.Add('ct_id', iId, True);

  try
    EjecutarSql(Sql.Sql);

    Result := True;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManCoeficientes.LoadControls;
begin
  with sdqConsulta do
  begin
    edNombre.Text                := FieldByName('ct_nombre').AsString;
    edCoeficiente.Value          := FieldByName('ct_coeficiente').AsFloat;
    edFechaDesde.Date            := FieldByName('ct_fechadesde').AsDateTime;
    edFechaHasta.Date            := FieldByName('ct_fechahasta').AsDateTime;
    memoObservaciones.Lines.Text := FieldByName('ct_observacion').AsString;
  end;
end;


function TfrmManCoeficientes.Validar: Boolean;
var
  sSql: string;
begin
  Verificar((edNombre.Text = ''), edNombre, 'Debe ingresar el Nombre.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.act_coeficiente' +
    ' WHERE ct_nombre = :nombre' +
      ' AND ct_fechabaja IS NULL';
  if modoABM <> maAlta then
    sSql := sSql + ' AND ct_id <> ' + SqlValue(sdqConsulta.FieldByName('ct_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [edNombre.Text]), edNombre, 'Ya existe un registro con ese nombre.');


  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe ingresar la Fecha Desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe ingresar la Fecha Hasta.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.act_coeficiente' +
    ' WHERE ct_nombre = :nombre' +
      ' AND (   ct_fechahasta IS NULL' +
           ' OR (    (ct_fechadesde <= :fechadesde)' +
               ' AND (ct_fechahasta >= :fechahasta)))' +
      ' AND ct_fechabaja IS NULL';
  if modoABM <> maAlta then
    sSql := sSql + ' AND ct_id <> ' + SqlValue(sdqConsulta.FieldByName('ct_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [edNombre.Text, TDateTimeEx.Create(edFechaDesde.Date), TDateTimeEx.Create(edFechaDesde.Date)]), edFechaDesde, 'Ya existe un período que comprende la fecha de inicio de vigencia.');

  Result := True;
end;

procedure TfrmManCoeficientes.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edNombreBusqueda.Clear;
  edFechaDesdeBusqueda.Clear;
  edFechaHastaBusqueda.Clear;
end;

procedure TfrmManCoeficientes.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                       var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if not sdqConsulta.FieldByName('ct_fechabaja').IsNull then
    Afont.Color := clRed;
end;

procedure TfrmManCoeficientes.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('ct_fechabaja').IsNull then
    raise Exception.Create('El registro ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmManCoeficientes.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('ct_fechabaja').IsNull then
    raise Exception.Create('El registro ha sido dado de baja.');

  inherited;
end;

procedure TfrmManCoeficientes.RefreshData;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT act.*' +
     ' FROM afi.act_coeficiente act' +
    ' WHERE 1 = 1';

  if edNombreBusqueda.Text <> '' then
    sWhere := sWhere + ' AND ct_nombre LIKE ' + SqlValue(edNombreBusqueda.Text + '%');

  if not edFechaDesdeBusqueda.IsEmpty then
    sWhere := sWhere + ' AND ct_fechadesde >= ' + SqlValue(edFechaDesdeBusqueda.Date);

  if not edFechaHastaBusqueda.IsEmpty then
    sWhere := sWhere + ' AND ct_fechahasta <= ' + SqlValue(edFechaHastaBusqueda.Date);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

end.
