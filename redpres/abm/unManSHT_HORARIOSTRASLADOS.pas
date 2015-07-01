unit unManSHT_HORARIOSTRASLADOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraPrestador, unFraCodigoDescripcion, unFraCodDesc, Spin,
  JvExComCtrls, JvDateTimePicker;

type
  TfrmManSHT_HORARIOSTRASLADOS = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraPrestadorPrestacion: TfraPrestador;
    Label2: TLabel;
    fraPrestadorTransportista: TfraPrestador;
    fraDT_ID: TfraCodDesc;
    Label3: TLabel;
    sdqConsultaHT_ID: TFloatField;
    sdqConsultaHT_VIGENCIADESDE: TDateTimeField;
    sdqConsultaHT_VIGENCIAHASTA: TDateTimeField;
    sdqConsultaHT_HORADESDE: TDateTimeField;
    sdqConsultaHT_HORAHASTA: TDateTimeField;
    sdqConsultaHT_IDPRESTADOR: TFloatField;
    sdqConsultaPRESTADOR_PRESTACION: TStringField;
    sdqConsultaHT_IDMEDIOTRANSPORTE: TFloatField;
    sdqConsultaTRANSPORTISTA: TStringField;
    sdqConsultaHT_DIA: TFloatField;
    sdqConsultaDIA: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fraHT_IDPRESTADOR: TfraPrestador;
    fraTransportista: TfraPrestador;
    fraHT_IDMEDIOTRANSPORTE: TfraCodDesc;
    btnAgregarOtroDia: TButton;
    Label7: TLabel;
    edHT_FRECUENCIA: TSpinEdit;
    edHT_HORAHASTA: TJvDateTimePicker;
    edHT_HORADESDE: TJvDateTimePicker;
    Label9: TLabel;
    sdqConsultaHT_FRECUENCIA: TFloatField;
    sdqConsultaHT_USUALTA: TStringField;
    sdqConsultaHT_FECHAALTA: TDateTimeField;
    sdqConsultaHT_USUMODIF: TStringField;
    sdqConsultaHT_FECHAMODIF: TDateTimeField;
    sdqConsultaHT_USUBAJA: TStringField;
    sdqConsultaHT_FECHABAJA: TDateTimeField;
    edHT_VIGENCIADESDE: TJvDateTimePicker;
    edHT_VIGENCIAHASTA: TJvDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    cmbHT_DIA: TComboBox;
    sdqConsultaDT_DESCRIPCION: TStringField;
    Label13: TLabel;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraDT_IDcmbDescripcionDropDown(Sender: TObject);
    procedure fraHT_IDMEDIOTRANSPORTEcmbDescripcionDropDown(
      Sender: TObject);
    procedure btnAgregarOtroDiaClick(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearData; override;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    procedure RefreshData; override;
  end;

var
  frmManSHT_HORARIOSTRASLADOS: TfrmManSHT_HORARIOSTRASLADOS;

implementation

uses
  SqlFuncs, AnsiSql, CustomDlgs, DateTimeFuncs, General, unSesion,
  unDmPrincipal, unFiltros, VCLExtra;

{$R *.dfm}

procedure TfrmManSHT_HORARIOSTRASLADOS.ClearControls;
begin
  VCLExtra.LockControls([fraHT_IDPRESTADOR, fraTransportista, fraHT_IDMEDIOTRANSPORTE,
                         edHT_VIGENCIADESDE, edHT_VIGENCIAHASTA, cmbHT_DIA,
                         edHT_HORADESDE, edHT_HORAHASTA, edHT_FRECUENCIA], False);
  fraHT_IDPRESTADOR.Clear;
  fraTransportista.Clear;
  fraHT_IDMEDIOTRANSPORTE.Clear;
  edHT_HORADESDE.DateTime := 0;
  edHT_HORAHASTA.DateTime := 0;
  edHT_VIGENCIADESDE.Date := DBDate;
  edHT_VIGENCIAHASTA.Date := DBDate;
  edHT_VIGENCIADESDE.MinDate := DBDate;
  edHT_VIGENCIAHASTA.MinDate := DBDate;
  edHT_FRECUENCIA.Value := 0;
  cmbHT_DIA.ItemIndex := -1;
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.ClearData;
begin
  fraPrestadorPrestacion.Clear;
  fraPrestadorTransportista.Clear;
  fraDT_ID.Clear;
  inherited;
end;

function TfrmManSHT_HORARIOSTRASLADOS.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('HT_ID', sdqConsulta.FieldByName('HT_ID').AsInteger);
     Sql.Fields.Add('HT_FECHABAJA', exDate);
     Sql.Fields.Add('HT_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.Add('HT_ID', ValorSQLInteger('SELECT MAX(HT_ID) FROM SIN.SHT_HORARIOSTRASLADOS') + 1);
       Sql.Fields.Add('HT_FECHAALTA', exDate);
       Sql.Fields.Add('HT_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('HT_ID', sdqConsulta.FieldByName('HT_ID').AsInteger);
       Sql.Fields.Add('HT_FECHAMODIF', exDate);
       Sql.Fields.Add('HT_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('HT_IDPRESTADOR', fraHT_IDPRESTADOR.IDPrestador);
     Sql.Fields.Add('HT_IDMEDIOTRANSPORTE', fraHT_IDMEDIOTRANSPORTE.Value);
     Sql.Fields.Add('HT_FRECUENCIA', edHT_FRECUENCIA.Value);

     Sql.Fields.Add('HT_DIA', cmbHT_DIA.ItemIndex + 1, dtNumber);
     Sql.Fields.Add('HT_HORADESDE', edHT_HORADESDE.DateTime, dtDateTime);
     Sql.Fields.Add('HT_HORAHASTA', edHT_HORAHASTA.DateTime, dtDateTime);

     Sql.Fields.Add('HT_VIGENCIADESDE', edHT_VIGENCIADESDE.DateTime, dtDateTime);
     Sql.Fields.Add('HT_VIGENCIAHASTA', edHT_VIGENCIAHASTA.DateTime, dtDateTime);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.LoadControls;
begin
  fraHT_IDPRESTADOR.Cargar(sdqConsulta.FieldByName('HT_IDPRESTADOR').AsInteger, True);
  fraHT_IDMEDIOTRANSPORTE.Value := sdqConsulta.FieldByName('HT_IDMEDIOTRANSPORTE').AsString;
  cmbHT_DIA.ItemIndex := sdqConsulta.FieldByName('HT_DIA').AsInteger - 1;
  edHT_HORADESDE.DateTime := sdqConsulta.FieldByName('HT_HORADESDE').AsDateTime;
  edHT_HORAHASTA.DateTime := sdqConsulta.FieldByName('HT_HORAHASTA').AsDateTime;
  edHT_FRECUENCIA.Value := sdqConsulta.FieldByName('HT_FRECUENCIA').AsInteger;
  edHT_VIGENCIADESDE.DateTime := sdqConsulta.FieldByName('HT_VIGENCIADESDE').AsDateTime;
  edHT_VIGENCIAHASTA.DateTime := sdqConsulta.FieldByName('HT_VIGENCIAHASTA').AsDateTime;
  edHT_VIGENCIAHASTA.MinDate  := sdqConsulta.FieldByName('HT_VIGENCIAHASTA').AsDateTime;
  VCLExtra.LockControls([fraHT_IDPRESTADOR, fraTransportista, fraHT_IDMEDIOTRANSPORTE, edHT_VIGENCIADESDE,
                         cmbHT_DIA, edHT_HORADESDE, edHT_HORAHASTA, edHT_FRECUENCIA], True);
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.RefreshData;
var
  sSQL, sWhere: String;
begin
  if fraPrestadorPrestacion.IsSelected then
    sWhere := sWhere + ' AND CPR_PRESTACION.CA_IDENTIFICADOR = ' + SQLValue(fraPrestadorPrestacion.IdPrestador);

  if fraPrestadorTransportista.IsSelected then
    sWhere := sWhere + ' AND CPR_TRANSPORTISTA.CA_IDENTIFICADOR = ' + SQLValue(fraPrestadorTransportista.IdPrestador);

  sSQL := FSQL + sWhere + DoFiltroComponente(fraDT_ID, 'DT_ID');

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

function TfrmManSHT_HORARIOSTRASLADOS.Validar: Boolean;
begin
  Verificar(fraHT_IDPRESTADOR.IsEmpty, fraHT_IDPRESTADOR, 'Debe completar el prestador que realiza las prácticas.');
  Verificar(fraHT_IDMEDIOTRANSPORTE.IsEmpty, fraHT_IDMEDIOTRANSPORTE.edCodigo, 'Debe completar el medio de transporte del prestador que realiza el traslado.');
  Verificar(edHT_VIGENCIADESDE.DateTime = 0, edHT_VIGENCIADESDE, 'Debe completar la fecha de inicio de la vigencia para este calendario.');
  Verificar(edHT_VIGENCIAHASTA.DateTime = 0, edHT_VIGENCIAHASTA, 'Debe completar la fecha de finalización de la vigencia para este calendario.');
  Verificar(cmbHT_DIA.ItemIndex = -1, cmbHT_DIA, 'Debe completar el día de la semana para este calendario.');
  Verificar(edHT_HORADESDE.DateTime = 0, edHT_HORADESDE, 'Debe completar el horario de inicio para el turno.');
  Verificar(edHT_HORAHASTA.DateTime = 0, edHT_HORAHASTA, 'Debe completar el horario de finalización para el turno.');
  Verificar(edHT_FRECUENCIA.Value = 0, edHT_FRECUENCIA, 'Debe completar la frecuencia (en minutos) con que se dan los turnos.');
  Result := True;
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  fraPrestadorPrestacion.ExtraCondition := 'and ca_permitetransporte = ''S'' ';
  fraHT_IDPRESTADOR.ExtraCondition := 'and ca_permitetransporte = ''S'' ';
  fraPrestadorTransportista.ExtraCondition := 'and ca_especialidad = ''063''';
  fraTransportista.ExtraCondition := 'and ca_especialidad = ''063''';
  inherited;
  Sql.TableName := 'SIN.SHT_HORARIOSTRASLADOS';
  FieldBaja     := 'HT_FECHABAJA';
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.fraDT_IDcmbDescripcionDropDown(Sender: TObject);
begin
  Verificar(fraPrestadorTransportista.IsEmpty, fraPrestadorTransportista, 'Debe seleccionar un prestador para ver sus medios de transporte.');
  fraDT_ID.Propiedades.ExtraCondition := ' AND DT_IDPRESTADOR = ' + SQLValue(fraPrestadorTransportista.IDPrestador);
  fraDT_ID.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.fraHT_IDMEDIOTRANSPORTEcmbDescripcionDropDown(Sender: TObject);
begin
  Verificar(fraTransportista.IsEmpty, fraTransportista, 'Debe seleccionar un prestador para ver sus medios de transporte.');
  fraHT_IDMEDIOTRANSPORTE.Propiedades.ExtraCondition := ' AND DT_IDPRESTADOR = ' + SQLValue(fraTransportista.IDPrestador);
  fraHT_IDMEDIOTRANSPORTE.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManSHT_HORARIOSTRASLADOS.btnAgregarOtroDiaClick(Sender: TObject);
begin
  if Validar and DoABM then
  begin
    edHT_HORADESDE.DateTime := 0;
    edHT_HORAHASTA.DateTime := 0;
    cmbHT_DIA.ItemIndex := -1;
    ModoABM := maAlta;
    ModoABMToSqlType;
    fpABM.Caption := CAPTION_ALTA;
    VCLExtra.LockControls([fraHT_IDPRESTADOR, fraTransportista, fraHT_IDMEDIOTRANSPORTE,
                           edHT_VIGENCIADESDE, edHT_VIGENCIAHASTA], True);
    VCLExtra.LockControls([cmbHT_DIA, edHT_HORADESDE, edHT_HORAHASTA, edHT_FRECUENCIA], False);
  end;
end;

end.
