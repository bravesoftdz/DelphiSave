unit unManLimiteSSN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit,
  CurrEdit, DateComboBox, unArtFrame, unFraStaticCodigoDescripcion, unfraStaticActividad, unArtDBAwareFrame, PatternEdit, IntEdit, JvExControls, JvComponent,
  JvSpecialProgress, Excel2000, OleServer, Variants, unFraCodigoDescripcion, unFraActividad, unFraCodDesc;

type
  TfrmManLimiteSSN = class(TfrmCustomGridABM)
    GroupBox8: TGroupBox;
    Label12: TLabel;
    edVigenciaDesdeBusqueda: TDateComboBox;
    edVigenciaHastaBusqueda: TDateComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    edLimiteMinimo: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    edLimiteMaximo: TCurrencyEdit;
    fraActividad: TfraCodDesc;
    fraActividadBusqueda: TfraCodDesc;
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
  frmManLimiteSSN: TfrmManLimiteSSN;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion, DateTimeFuncs;

{$R *.DFM}

procedure TfrmManLimiteSSN.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('ls_maximo')).DisplayFormat := '0.00 %;-0.00 %';
  TFloatField(sdqConsulta.FieldByName('ls_minimo')).DisplayFormat := '0.00 %;-0.00 %';
end;

procedure TfrmManLimiteSSN.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
end;

procedure TfrmManLimiteSSN.ClearControls;
begin
  fraActividad.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
  edLimiteMinimo.Clear;
  edLimiteMaximo.Clear;
end;


function TfrmManLimiteSSN.DoABM: Boolean;
var
  iId: Integer;
begin
  iId := -1;

  Sql.Clear;
  Sql.TableName := 'art.als_limitessn';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId := sdqConsulta.FieldByName('ls_id').AsInteger;

    Sql.Fields.Add('ls_usubaja',   Sesion.UserID);
    Sql.Fields.Add('ls_fechabaja', SQL_DATETIME, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      iId := 0;

      Sql.Fields.Add('ls_usualta',   Sesion.UserID);
      Sql.Fields.Add('ls_fechaalta', SQL_DATETIME, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      iId  := sdqConsulta.FieldByName('ls_id').AsInteger;

      Sql.Fields.Add('ls_usumodif',   Sesion.UserID);
      Sql.Fields.Add('ls_fechamodif', SQL_DATETIME, False);
    end;

    Sql.Fields.Add('ls_fechadesde',  edVigenciaDesde.Date);
    Sql.Fields.Add('ls_fechahasta',  edVigenciaHasta.Date);
    Sql.Fields.Add('ls_idactividad', fraActividad.Value);
    Sql.Fields.Add('ls_maximo', edLimiteMaximo.Value, 2);
    Sql.Fields.Add('ls_minimo', edLimiteMinimo.Value, 2);
  end;

  Sql.PrimaryKey.Add('ls_id', iId, True);

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

procedure TfrmManLimiteSSN.LoadControls;
begin
  with sdqConsulta do
  begin
    fraActividad.Value    := FieldByName('ls_idactividad').AsInteger;
    edVigenciaDesde.Date  := FieldByName('ls_fechadesde').AsDateTime;
    edVigenciaHasta.Date  := FieldByName('ls_fechahasta').AsDateTime;
    edLimiteMinimo.Value  := FieldByName('ls_minimo').AsFloat;
    edLimiteMaximo.Value  := FieldByName('ls_maximo').AsFloat;
  end;
end;


function TfrmManLimiteSSN.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraActividad.IsEmpty, fraActividad.edCodigo, 'Debe ingresar la Actividad.');
  Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'Debe ingresar la Vigencia Desde.');
  Verificar(edVigenciaHasta.IsEmpty, edVigenciaHasta, 'Debe ingresar la Vigencia Hasta.');
  Verificar((edVigenciaDesde.Date > edVigenciaHasta.Date), edVigenciaDesde, 'La Vigencia Desde no puede ser mayor a la Vigencia Hasta.');

  sSql :=
    'SELECT 1' +
     ' FROM art.als_limitessn' +
    ' WHERE ls_idactividad = :idactividad' +
      ' AND ((:fechadesde BETWEEN ls_fechadesde AND ls_fechahasta) OR (:fechahasta BETWEEN ls_fechadesde AND ls_fechahasta))' +
      ' AND ls_fechabaja IS NULL';
  if ModoABM <> maAlta then
    sSql := sSql + ' AND ls_id <> ' + SqlValue(sdqConsulta.FieldByName('ls_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [fraActividad.Value, TDateTimeEx.Create(edVigenciaDesde.Date), TDateTimeEx.Create(edVigenciaHasta.Date)]), edVigenciaDesde, 'Ya existe un registro para la actividad dentro del rango fecha desde - hasta que cargó.');

  Result := True;
end;

procedure TfrmManLimiteSSN.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraActividadBusqueda.Clear;
  edVigenciaDesdeBusqueda.Clear;
  edVigenciaHastaBusqueda.Clear;
end;

procedure TfrmManLimiteSSN.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if not sdqConsulta.FieldByName('ls_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManLimiteSSN.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('ls_fechabaja').IsNull then
    raise Exception.Create('El registro ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmManLimiteSSN.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('ls_fechabaja').IsNull then
    raise Exception.Create('El registro ha sido dado de baja.');

  inherited;
end;

procedure TfrmManLimiteSSN.RefreshData;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM art.als_limitessn als, cac_actividad cac' +
    ' WHERE ls_idactividad = ac_id';

  if not fraActividadBusqueda.IsEmpty then
    sWhere := sWhere + ' AND ls_idactividad = ' + SqlValue(fraActividadBusqueda.Value);

  if not edVigenciaDesdeBusqueda.IsEmpty then
    sWhere := sWhere + ' AND ls_fechadesde >= ' + SqlValue(edVigenciaDesdeBusqueda.Date);

  if not edVigenciaHastaBusqueda.IsEmpty then
    sWhere := sWhere + ' AND ls_fechahasta <= ' + SqlValue(edVigenciaHastaBusqueda.Date);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

end.
