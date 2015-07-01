unit unManValorReferenciaCartera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog,
  SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit, PatternEdit, IntEdit, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unfraStaticActividad, DateComboBox, unImpoExpoWizard,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmManValorReferenciaCartera = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    edPA_ESPECIESFRECVALORCARTERA: TCurrencyEdit;
    edPA_ESPECIESESPVALORCARTERA: TCurrencyEdit;
    Label1: TLabel;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    edPA_ILTFRECVALORCARTERA: TCurrencyEdit;
    edPA_ILTPRESTVALORCARTERA: TCurrencyEdit;
    edPA_ILTESPVALORCARTERA: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    GroupBox3: TGroupBox;
    edPA_INCAP050FRECVALORCARTERA: TCurrencyEdit;
    edPA_INCAP050ILTVALORCARTERA: TCurrencyEdit;
    edPA_INCAP050ESPVALORCARTERA: TCurrencyEdit;
    edPA_INCAP050INCAPVALORCARTERA: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edPA_INCAP5066FRECVALORCARTERA: TCurrencyEdit;
    edPA_INCAP5066ILTVALORCARTERA: TCurrencyEdit;
    edPA_INCAP5066ESPVALORCARTERA: TCurrencyEdit;
    edPA_INCAP5066INCAPVALORCARTERA: TCurrencyEdit;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edPA_INCAP66100FRECVALORCARTERA: TCurrencyEdit;
    edPA_INCAP66100ILTVALORCARTERA: TCurrencyEdit;
    edPA_INCAP66100ESPVALORCARTERA: TCurrencyEdit;
    edPA_INCAP66100INCAPVALORCARTERA: TCurrencyEdit;
    GroupBox6: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edPA_MUERTEFRECVALORCARTERA: TCurrencyEdit;
    edPA_MUERTEILTVALORCARTERA: TCurrencyEdit;
    edPA_MUERTEESPVALORCARTERA: TCurrencyEdit;
    edPA_MUERTEINCAPVALORCARTERA: TCurrencyEdit;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    edPA_JUICIOSFRECVALORCARTERA: TCurrencyEdit;
    tbBuscar: TToolButton;
    GroupBox8: TGroupBox;
    edVigenciaDesdeBusqueda: TDateComboBox;
    GroupBox9: TGroupBox;
    Label21: TLabel;
    fraActividad: TfraStaticActividad;
    GroupBox10: TGroupBox;
    Label15: TLabel;
    Label22: TLabel;
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    Label16: TLabel;
    tbImpoExpo: TToolButton;
    tbAyudaImpoExpo: TToolButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImpoExpoClick(Sender: TObject);
    procedure tbAyudaImpoExpoClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;    
  public
  end;

var
  frmManValorReferenciaCartera: TfrmManValorReferenciaCartera;

implementation

uses
  unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, unSesion;

{$R *.DFM}

procedure TfrmManValorReferenciaCartera.ClearControls;
begin
  edPA_ESPECIESFRECVALORCARTERA.Clear;
  edPA_ESPECIESESPVALORCARTERA.Clear;
  edPA_ILTFRECVALORCARTERA.Clear;
  edPA_ILTESPVALORCARTERA.Clear;
  edPA_ILTPRESTVALORCARTERA.Clear;
  edPA_INCAP050FRECVALORCARTERA.Clear;
  edPA_INCAP050ESPVALORCARTERA.Clear;
  edPA_INCAP050ILTVALORCARTERA.Clear;
  edPA_INCAP050INCAPVALORCARTERA.Clear;
  edPA_INCAP5066FRECVALORCARTERA.Clear;
  edPA_INCAP5066ESPVALORCARTERA.Clear;
  edPA_INCAP5066ILTVALORCARTERA.Clear;
  edPA_INCAP5066INCAPVALORCARTERA.Clear;
  edPA_INCAP66100FRECVALORCARTERA.Clear;
  edPA_INCAP66100ESPVALORCARTERA.Clear;
  edPA_INCAP66100ILTVALORCARTERA.Clear;
  edPA_INCAP66100INCAPVALORCARTERA.Clear;
  edPA_MUERTEFRECVALORCARTERA.Clear;
  edPA_MUERTEESPVALORCARTERA.Clear;
  edPA_MUERTEILTVALORCARTERA.Clear;
  edPA_MUERTEINCAPVALORCARTERA.Clear;
  edPA_JUICIOSFRECVALORCARTERA.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
end;

function TfrmManValorReferenciaCartera.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;
  Sql.TableName := 'cpa_parametrosactividad';

  sSql :=
    'SELECT 1' +
     ' FROM cpa_parametrosactividad' +
    ' WHERE pa_id = :id';

  if ModoABM = maBaja then    // Baja..
    Sql.SqlType := stUpdate
  else if not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('ac_id').AsInteger]) then   // Alta..
  begin
    ModoABM := maAlta;
    Sql.SqlType := stInsert;
  end
  else    // Modificación..
  begin
    ModoABM := maModificacion;
    Sql.SqlType := stUpdate;
  end;

  Sql.PrimaryKey.Add('pa_id', sdqConsulta.FieldByName('pa_id').AsInteger, False);

  if ModoABM = maBaja then
  begin
    Sql.Fields.Add('pa_fechabaja', DBDateTime);
    Sql.Fields.Add('pa_usubaja',   Sesion.UserID);
  end
  else
  begin
    Sql.Fields.Add('pa_idactividad',                 sdqConsulta.FieldByName('AC_ID').AsInteger, False);
    Sql.Fields.Add('pa_especiesfrecvalorcartera',    edPA_ESPECIESFRECVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_especiesespvalorcartera',     edPA_ESPECIESESPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_iltfrecvalorcartera',         edPA_ILTFRECVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_iltespvalorcartera',          edPA_ILTESPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_iltprestvalorcartera',        edPA_ILTPRESTVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap050frecvalorcartera',    edPA_INCAP050FRECVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap050espvalorcartera',     edPA_INCAP050ESPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap050iltvalorcartera',     edPA_INCAP050ILTVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap050incapvalorcartera',   edPA_INCAP050INCAPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap5066frecvalorcartera',   edPA_INCAP5066FRECVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap5066espvalorcartera',    edPA_INCAP5066ESPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap5066iltvalorcartera',    edPA_INCAP5066ILTVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap5066incapvalorcartera',  edPA_INCAP5066INCAPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap66100frecvalorcartera',  edPA_INCAP66100FRECVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap66100espvalorcartera',   edPA_INCAP66100ESPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap66100iltvalorcartera',   edPA_INCAP66100ILTVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_incap66100incapvalorcartera', edPA_INCAP66100INCAPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_muertefrecvalorcartera',      edPA_MUERTEFRECVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_muerteespvalorcartera',       edPA_MUERTEESPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_muerteiltvalorcartera',       edPA_MUERTEILTVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_muerteincapvalorcartera',     edPA_MUERTEINCAPVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_juiciosfrecvalorcartera',     edPA_JUICIOSFRECVALORCARTERA.Value, -1, True);
    Sql.Fields.Add('pa_fechadesde',                  edVigenciaDesde.Date);
    Sql.Fields.Add('pa_fechahasta',                  edVigenciaHasta.Date);
  end;

  Result := inherited DoABM;
end;

function TfrmManValorReferenciaCartera.Validar: Boolean;
begin
  Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'El campo Vigencia Desde es obligatorio.');
  Verificar(edVigenciaHasta.IsEmpty, edVigenciaHasta, 'El campo Vigencia Hasta es obligatorio.');
  Verificar((edVigenciaDesde.Date > edVigenciaHasta.Date), edVigenciaDesde, 'La Vigencia Desde no puede ser mayor a la Vigencia Hasta');

  Result := True;
end;

procedure TfrmManValorReferenciaCartera.LoadControls;
begin
  with sdqConsulta do
  begin
    edPA_ESPECIESFRECVALORCARTERA.Value    := FieldByName('pa_especiesfrecvalorcartera').AsFloat;
    edPA_ESPECIESESPVALORCARTERA.Value     := FieldByName('pa_especiesespvalorcartera').AsFloat;
    edPA_ILTFRECVALORCARTERA.Value         := FieldByName('pa_iltfrecvalorcartera').AsFloat;
    edPA_ILTESPVALORCARTERA.Value          := FieldByName('pa_iltespvalorcartera').AsFloat;
    edPA_ILTPRESTVALORCARTERA.Value        := FieldByName('pa_iltprestvalorcartera').AsFloat;
    edPA_INCAP050FRECVALORCARTERA.Value    := FieldByName('pa_incap050frecvalorcartera').AsFloat;
    edPA_INCAP050ESPVALORCARTERA.Value     := FieldByName('pa_incap050espvalorcartera').AsFloat;
    edPA_INCAP050ILTVALORCARTERA.Value     := FieldByName('pa_incap050iltvalorcartera').AsFloat;
    edPA_INCAP050INCAPVALORCARTERA.Value   := FieldByName('pa_incap050incapvalorcartera').AsFloat;
    edPA_INCAP5066FRECVALORCARTERA.Value   := FieldByName('pa_incap5066frecvalorcartera').AsFloat;
    edPA_INCAP5066ESPVALORCARTERA.Value    := FieldByName('pa_incap5066espvalorcartera').AsFloat;
    edPA_INCAP5066ILTVALORCARTERA.Value    := FieldByName('pa_incap5066iltvalorcartera').AsFloat;
    edPA_INCAP5066INCAPVALORCARTERA.Value  := FieldByName('pa_incap5066incapvalorcartera').AsFloat;
    edPA_INCAP66100FRECVALORCARTERA.Value  := FieldByName('pa_incap66100frecvalorcartera').AsFloat;
    edPA_INCAP66100ESPVALORCARTERA.Value   := FieldByName('pa_incap66100espvalorcartera').AsFloat;
    edPA_INCAP66100ILTVALORCARTERA.Value   := FieldByName('pa_incap66100iltvalorcartera').AsFloat;
    edPA_INCAP66100INCAPVALORCARTERA.Value := FieldByName('pa_incap66100incapvalorcartera').AsFloat;
    edPA_MUERTEFRECVALORCARTERA.Value      := FieldByName('pa_muertefrecvalorcartera').AsFloat;
    edPA_MUERTEESPVALORCARTERA.Value       := FieldByName('pa_muerteespvalorcartera').AsFloat;
    edPA_MUERTEILTVALORCARTERA.Value       := FieldByName('pa_muerteiltvalorcartera').AsFloat;
    edPA_MUERTEINCAPVALORCARTERA.Value     := FieldByName('pa_muerteincapvalorcartera').AsFloat;
    edPA_JUICIOSFRECVALORCARTERA.Value     := FieldByName('pa_juiciosfrecvalorcartera').AsFloat;
    edVigenciaDesde.Date                   := FieldByName('pa_fechadesde').AsDateTime;
    edVigenciaHasta.Date                   := FieldByName('pa_fechahasta').AsDateTime;
  end;
end;

procedure TfrmManValorReferenciaCartera.RefreshData;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT ac_id, ac_codigo, ac_descripcion, cpa.*' +
     ' FROM cac_actividad, cpa_parametrosactividad cpa' +
    ' WHERE ac_id = pa_idactividad(+)';

  if fraActividad.IsSelected then
    sWhere := sWhere + ' AND ac_id = ' + SqlValue(fraActividad.Value);

  if not edVigenciaDesdeBusqueda.IsEmpty then
    sWhere := sWhere + ' AND pa_fechadesde >= ' + SqlValue(edVigenciaDesdeBusqueda.Date);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmManValorReferenciaCartera.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(DataSet.FieldByName('pa_especiesfrecvalorcartera')).DisplayFormat    := '0.000%';
  TFloatField(DataSet.FieldByName('pa_iltfrecvalorcartera')).DisplayFormat         := '0.000%';
  TFloatField(DataSet.FieldByName('pa_incap050frecvalorcartera')).DisplayFormat    := '0.000%';
  TFloatField(DataSet.FieldByName('pa_incap050incapvalorcartera')).DisplayFormat   := '0.000%';
  TFloatField(DataSet.FieldByName('pa_incap5066frecvalorcartera')).DisplayFormat   := '0.000%';
  TFloatField(DataSet.FieldByName('pa_incap5066incapvalorcartera')).DisplayFormat  := '0.000%';
  TFloatField(DataSet.FieldByName('pa_incap66100frecvalorcartera')).DisplayFormat  := '0.000%';
  TFloatField(DataSet.FieldByName('pa_incap66100incapvalorcartera')).DisplayFormat := '0.000%';
  TFloatField(DataSet.FieldByName('pa_muertefrecvalorcartera')).DisplayFormat      := '0.000%';
  TFloatField(DataSet.FieldByName('pa_muerteincapvalorcartera')).DisplayFormat     := '0.000%';
  TFloatField(DataSet.FieldByName('pa_juiciosfrecvalorcartera')).DisplayFormat     := '0.000%';

  TFloatField(DataSet.FieldByName('pa_especiesespvalorcartera')).DisplayFormat   := '$ ,0.00';
  TFloatField(DataSet.FieldByName('pa_iltespvalorcartera')).DisplayFormat        := '$ ,0.00';
  TFloatField(DataSet.FieldByName('pa_incap050espvalorcartera')).DisplayFormat   := '$ ,0.00';
  TFloatField(DataSet.FieldByName('pa_incap5066espvalorcartera')).DisplayFormat  := '$ ,0.00';
  TFloatField(DataSet.FieldByName('pa_incap66100espvalorcartera')).DisplayFormat := '$ ,0.00';
  TFloatField(DataSet.FieldByName('pa_muerteespvalorcartera')).DisplayFormat     := '$ ,0.00';
end;

procedure TfrmManValorReferenciaCartera.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'pa_fechabaja';

  tbAyudaImpoExpo.Left := 136;
  tbImpoExpo.Left := 136;
  tbBuscar.Left := 136;
end;

procedure TfrmManValorReferenciaCartera.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraActividad.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
end;

procedure TfrmManValorReferenciaCartera.tbImpoExpoClick(Sender: TObject);
begin
  ImpoExpoWizard('TEC02');
end;

procedure TfrmManValorReferenciaCartera.tbAyudaImpoExpoClick(Sender: TObject);
begin
  MessageDlg(
    'Puntos a tener en cuenta para la importación del archivo con los nuevos valores.' + #13#10 +
    '   -	Archivo con extensión csv.' + #13#10 +
    '   -	Los valores decimales separados por punto (.) y no por  coma(,).' + #13#10 +
    '   -	No tiene que tener los títulos.' + #13#10#13#10 +
    '   - Orden por columna' + #13#10 +
    '       A	CIIU' + #13#10 +
    '       B	Descripción CIIU (ATENCION = Controlar que no exista un punto y coma (;) en la descripción)' + #13#10 +
    '       D	Vigencia Desde' + #13#10 +
    '       D	Vigencia Hasta (preferencia 31/12/2999)' + #13#10 +
    '       E	Especies - Frecuencia' + #13#10 +
    '       F	Especies - Prest. Especie' + #13#10 +
    '       G	ILT - Frecuencia' + #13#10 +
    '       H	ILT - Prest. Especie' + #13#10 +
    '       I	ILT - Prest. ILT' + #13#10 +
    '       J	Incap 0-50 - Frecuencia' + #13#10 +
    '       K	Incap 0-50 - Prest. Especie' + #13#10 +
    '       L	Incap 0-50 - Prest. ILT' + #13#10 +
    '       M	Incap 0-50 - Incapacidad' + #13#10 +
    '       N	Incap 50-66 - Frecuencia' + #13#10 +
    '       O	Incap 50-66 - Prest. Especie' + #13#10 +
    '       P	Incap 50-66 - Prest. ILT' + #13#10 +
    '       Q	Incap 50-66 - Incapacidad' + #13#10 +
    '       R	Incap 66-100 - Frecuencia' + #13#10 +
    '       S	Incap 66-100 - Prest. Especie' + #13#10 +
    '       T	Incap 66-100 - Prest. ILT' + #13#10 +
    '       U	Incap 66-100 - Incapacidad' + #13#10 +
    '       V	Muerte - Frecuencia' + #13#10 +
    '       W	Muerte - Prest. Especie' + #13#10 +
    '       X	Muerte - Prest. ILT' + #13#10 +
    '       Y	Muerte - Incapacidad' + #13#10 +
    '       Z	Juicios - Frecuencia', mtInformation, [mbOK], 0);
end;

end.
