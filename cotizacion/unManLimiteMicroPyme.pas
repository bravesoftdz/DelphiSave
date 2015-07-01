unit unManLimiteMicroPyme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog,
  SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit, DateComboBox, unArtFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad, unArtDBAwareFrame, PatternEdit, IntEdit, JvExControls, JvComponent, JvSpecialProgress, Excel2000, OleServer, Variants,
  unFraCodigoDescripcion, unFraActividad, unFraCodDesc, RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmManLimiteMicroPyme = class(TfrmCustomGridABM)
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
  frmManLimiteMicroPyme: TfrmManLimiteMicroPyme;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion, DateTimeFuncs;

{$R *.DFM}

procedure TfrmManLimiteMicroPyme.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('lm_maximo')).DisplayFormat := '0.00 %;-0.00 %';
end;

procedure TfrmManLimiteMicroPyme.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
end;

procedure TfrmManLimiteMicroPyme.ClearControls;
begin
  fraActividad.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
  edLimiteMaximo.Clear;
end;


function TfrmManLimiteMicroPyme.DoABM: Boolean;
var
  iId: Integer;
begin
  iId := -1;

  Sql.Clear;
  Sql.TableName := 'art.alm_limitemicropyme';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId := sdqConsulta.FieldByName('lm_id').AsInteger;

    Sql.Fields.Add('lm_usubaja',   Sesion.UserID);
    Sql.Fields.Add('lm_fechabaja', SQL_DATETIME, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      iId := 0;

      Sql.Fields.Add('lm_usualta',   Sesion.UserID);
      Sql.Fields.Add('lm_fechaalta', SQL_DATETIME, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      iId  := sdqConsulta.FieldByName('lm_id').AsInteger;

      Sql.Fields.Add('lm_usumodif',   Sesion.UserID);
      Sql.Fields.Add('lm_fechamodif', SQL_DATETIME, False);
    end;

    Sql.Fields.Add('lm_fechadesde',  edVigenciaDesde.Date);
    Sql.Fields.Add('lm_fechahasta',  edVigenciaHasta.Date);
    Sql.Fields.Add('lm_idactividad', fraActividad.Value);
    Sql.Fields.Add('lm_maximo', edLimiteMaximo.Value, 2);
  end;

  Sql.PrimaryKey.Add('lm_id', iId, True);

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

procedure TfrmManLimiteMicroPyme.LoadControls;
begin
  with sdqConsulta do
  begin
    fraActividad.Value    := FieldByName('lm_idactividad').AsInteger;
    edVigenciaDesde.Date  := FieldByName('lm_fechadesde').AsDateTime;
    edVigenciaHasta.Date  := FieldByName('lm_fechahasta').AsDateTime;
    edLimiteMaximo.Value  := FieldByName('lm_maximo').AsFloat;
  end;
end;


function TfrmManLimiteMicroPyme.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraActividad.IsEmpty, fraActividad.edCodigo, 'Debe ingresar la Actividad.');
  Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'Debe ingresar la Vigencia Desde.');
  Verificar(edVigenciaHasta.IsEmpty, edVigenciaHasta, 'Debe ingresar la Vigencia Hasta.');
  Verificar((edVigenciaDesde.Date > edVigenciaHasta.Date), edVigenciaDesde, 'La Vigencia Desde no puede ser mayor a la Vigencia Hasta.');

  sSql :=
    'SELECT 1' +
     ' FROM art.alm_limitemicropyme' +
    ' WHERE lm_idactividad = :idactividad' +
      ' AND ((:fechadesde BETWEEN lm_fechadesde AND lm_fechahasta) OR (:fechahasta BETWEEN lm_fechadesde AND lm_fechahasta))' +
      ' AND lm_fechabaja IS NULL';
  if ModoABM <> maAlta then
    sSql := sSql + ' AND lm_id <> ' + SqlValue(sdqConsulta.FieldByName('lm_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [fraActividad.Value, TDateTimeEx.Create(edVigenciaDesde.Date), TDateTimeEx.Create(edVigenciaHasta.Date)]), edVigenciaDesde, 'Ya existe un registro para la actividad dentro del rango fecha desde - hasta que cargó.');

  Result := True;
end;

procedure TfrmManLimiteMicroPyme.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraActividadBusqueda.Clear;
  edVigenciaDesdeBusqueda.Clear;
  edVigenciaHastaBusqueda.Clear;
end;

procedure TfrmManLimiteMicroPyme.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if not sdqConsulta.FieldByName('lm_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManLimiteMicroPyme.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('lm_fechabaja').IsNull then
    raise Exception.Create('El registro ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmManLimiteMicroPyme.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('lm_fechabaja').IsNull then
    raise Exception.Create('El registro ha sido dado de baja.');

  inherited;
end;

procedure TfrmManLimiteMicroPyme.RefreshData;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM art.alm_limitemicropyme als, cac_actividad cac' +
    ' WHERE lm_idactividad = ac_id';

  if not fraActividadBusqueda.IsEmpty then
    sWhere := sWhere + ' AND lm_idactividad = ' + SqlValue(fraActividadBusqueda.Value);

  if not edVigenciaDesdeBusqueda.IsEmpty then
    sWhere := sWhere + ' AND lm_fechadesde >= ' + SqlValue(edVigenciaDesdeBusqueda.Date);

  if not edVigenciaHastaBusqueda.IsEmpty then
    sWhere := sWhere + ' AND lm_fechahasta <= ' + SqlValue(edVigenciaHastaBusqueda.Date);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

end.
