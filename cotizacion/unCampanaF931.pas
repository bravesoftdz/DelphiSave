unit unCampanaF931;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit,
  DateComboBox, Mask, CurrEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraEntidades, unFraStaticCodigoDescripcion, unFraCanal;

type
  TfrmCampanaF931 = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fraEntidad: TfraEntidades;
    edDescuento: TCurrencyEdit;
    edFechaHasta: TDateComboBox;
    fraCanal: TfraCanal;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    fraCanalBusqueda: TfraCanal;
    GroupBox2: TGroupBox;
    fraEntidadBusqueda: TfraEntidades;
    GroupBox3: TGroupBox;
    chkCuitSolAfiProvArt: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure CambiaCanal(Sender: TObject);
    procedure CambiaCanal2(Sender: TObject);
  private
    procedure FormatearTexto(Sender: TField; var aText: String; aDisplayText: Boolean);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmCampanaF931: TfrmCampanaF931;

implementation

uses
  unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, AnsiSql, General, Strfuncs;

{$R *.dfm}

function TfrmCampanaF931.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aca_campania931';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ca_id',    sdqConsulta.FieldByName('ca_id').AsInteger, False);
    Sql.Fields.Add('ca_usubaja',   Sesion.UserID);
    Sql.Fields.Add('ca_fechabaja', 'SYSDATE', False);

    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else if ModoABM = maAlta then
  begin
    Sql.PrimaryKey.Add('ca_id', exNull);
    Sql.Fields.Add('ca_descuento',  edDescuento.Value);
    Sql.Fields.Add('ca_fechaalta',  'SYSDATE', False);
    Sql.Fields.Add('ca_fechahasta', edFechaHasta.Date);
    Sql.Fields.Add('ca_identidad',  fraEntidad.Value);
    Sql.Fields.Add('ca_usualta',    Sesion.UserID);
  end;

  Result := inherited DoABM;

  if Result then
    RefreshData;
end;

function TfrmCampanaF931.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraCanal.IsEmpty, fraCanal, 'El Canal es obligatorio.');
  Verificar(fraEntidad.IsEmpty, fraEntidad, 'La Entidad es obligatoria.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.aca_campania931' +
    ' WHERE ca_identidad = :identidad' +
      ' AND ca_fechabaja IS NULL';
  Verificar(ExisteSqlEx(sSql, [fraEntidad.Value]), fraEntidad, 'Esa Entidad ya está dada de alta.');

  Verificar((edDescuento.Value = 0), edDescuento, 'El Descuento es obligatoria.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'La Fecha Hasta es obligatoria.');
  Verificar(edFechaHasta.Date < DBDate, edFechaHasta, 'La Fecha Hasta debe ser mayor al día de hoy.');

  Result := True;
end;


procedure TfrmCampanaF931.ClearControls;
begin
  fraCanalBusqueda.Clear;
  fraEntidadBusqueda.Clear;
  chkCuitSolAfiProvArt.Checked := False;
end;

procedure TfrmCampanaF931.FormatearTexto(Sender: TField; var aText: String; aDisplayText: Boolean);
begin
  try
    if AreIn(LowerCase(Sender.FieldName), ['ca_descuento']) then
      aText := Get_AjusteDecimales(Sender.AsString, '% ', 3, True)
    else
      aText := Sender.AsString;
  except
    aText := Sender.AsString;
  end;
end;

procedure TfrmCampanaF931.LoadControls;
begin
  with sdqConsulta do
  begin
    fraCanal.Value    := FieldByName('en_idcanal').AsInteger;
    fraEntidad.Value  := FieldByName('ca_identidad').AsInteger;
    edDescuento.Value := FieldByName('ca_descuento').AsFloat;
    edFechaHasta.Date := FieldByName('ca_fechahasta').AsDateTime;
  end;
end;

procedure TfrmCampanaF931.RefreshData;
var
  sFrom1: String;
  sFrom2: String;
  sSelect1: String;
  sSelect2: String;
  sWhere1: String;
  sWhere2: String;
begin
  sSelect1 := 'SELECT aca.*, xen1.en_codbanco codigoentidad, xen2.en_codbanco codigoorganizador, xen1.en_idcanal, xen1.en_nombre nombreentidad, xen2.en_nombre nombreorganizador';
  sFrom1 := ' FROM afi.aca_campania931 aca JOIN xen_entidad xen1 ON ca_identidad = xen1.en_id' +
       ' LEFT JOIN xgo_granorganizador ON go_identidad = xen1.en_id' +
       ' LEFT JOIN xen_entidad xen2 ON xen2.en_id = go_identorganizador' +
             ' AND go_fechabaja IS NULL' +
             ' AND go_fechaaprobado IS NOT NULL';
  sWhere1 := ' WHERE 1 = 1';

  sSelect2 := 'SELECT aca.*, xen1.en_codbanco codigoentidad, NULL codigoorganizador, xen1.en_idcanal, xen1.en_nombre nombreentidad, NULL nombreorganizador';
  sFrom2 := ' FROM afi.aca_campania931 aca JOIN xen_entidad xen1 ON ca_identidad = xen1.en_id';
  sWhere2 := ' WHERE NOT EXISTS(SELECT 1' +
              ' FROM xgo_granorganizador' +
             ' WHERE go_identidad = xen1.en_id' +
               ' AND go_fechabaja IS NULL' +
               ' AND go_fechaaprobado IS NOT NULL)';

  if not fraCanalBusqueda.IsEmpty then
  begin
    sWhere1 := sWhere1 + ' AND xen1.en_idcanal = ' + SqlValue(fraCanalBusqueda.Value);
    sWhere2 := sWhere2 + ' AND xen1.en_idcanal = ' + SqlValue(fraCanalBusqueda.Value);
  end;

  if not fraEntidadBusqueda.IsEmpty then
  begin
    sWhere1 := sWhere1 + ' AND ca_identidad = ' + SqlValue(fraEntidadBusqueda.Value);
    sWhere2 := sWhere2 + ' AND ca_identidad = ' + SqlValue(fraEntidadBusqueda.Value);
  end;

  if chkCuitSolAfiProvArt.Checked then
  begin
    sFrom1 := sFrom1 + ' JOIN xev_entidadvendedor ON ev_identidad = ca_identidad JOIN asa_solicitudafiliacion ON sa_identidadvendedor = ev_id';
    sFrom2 := sFrom2 + ' JOIN xev_entidadvendedor ON ev_identidad = ca_identidad JOIN asa_solicitudafiliacion ON sa_identidadvendedor = ev_id';

    sWhere1 := sWhere1 + ' AND (sa_fecharecepcionsectorafi IS NOT NULL or sa_fecharecepcionfaxemail IS NOT NULL)';
    sWhere2 := sWhere2 + ' AND (sa_fecharecepcionsectorafi IS NOT NULL or sa_fecharecepcionfaxemail IS NOT NULL)';
  end;

  sdqConsulta.Sql.Text := sSelect1 + sFrom1 + sWhere1 + ' UNION ALL ' + sSelect2 + sFrom2 + sWhere2;
  SortDialog.OrderBy;

  inherited;
end;

procedure TfrmCampanaF931.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ca_fechabaja';

  fraCanal.OnChange := CambiaCanal;
  fraCanalBusqueda.OnChange := CambiaCanal2;
end;

procedure TfrmCampanaF931.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('ca_fechabaja').IsNull, Grid, 'Este registro ya fue dado de baja.');

  inherited;
end;

procedure TfrmCampanaF931.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  ClearControls;
end;

procedure TfrmCampanaF931.tbNuevoClick(Sender: TObject);
begin
  fraCanal.Clear;
  fraEntidad.Clear;
  edDescuento.Clear;
  edFechaHasta.Clear;

  inherited;
end;

procedure TfrmCampanaF931.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  sdqConsulta.FieldByName('ca_descuento').OnGetText := FormatearTexto;
end;

procedure TfrmCampanaF931.CambiaCanal(Sender: TObject);
begin
  if fraCanal.IsSelected then
    fraEntidad.Canal := fraCanal.Value
  else
    fraEntidad.Clear;
end;

procedure TfrmCampanaF931.CambiaCanal2(Sender: TObject);
begin
  if fraCanalBusqueda.IsSelected then
    fraEntidadBusqueda.Canal := fraCanalBusqueda.Value
  else
    fraEntidadBusqueda.Clear;
end;

end.
