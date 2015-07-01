unit unManPRC_RIESGOCIIU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox, unFraCodigoDescripcion, unFraActividad,
  PatternEdit, IntEdit;

type
  TfrmManPRC_RIESGOCIIU = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edVigenciaFiltro: TDateComboBox;
    Vigencia: TLabel;
    fraActividadFiltro: TfraActividad;
    Label1: TLabel;
    fraActividad: TfraActividad;
    Label4: TLabel;
    edRiesgo: TIntEdit;
    Label5: TLabel;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function MaxFecha: TDate;

    procedure UpdateFechaHastaAnteriores(const aActividad: Integer; const aFechaDesde, aFechaHasta: TDate);
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManPRC_RIESGOCIIU: TfrmManPRC_RIESGOCIIU;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra, DateTimeFuncs;

{$R *.dfm}

procedure TfrmManPRC_RIESGOCIIU.ClearControls;
begin
  inherited;
  fraActividad.Clear;
  edRiesgo.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

function TfrmManPRC_RIESGOCIIU.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'pep.prc_riesgociiu';
  BeginTrans;

  if ModoABM = maAlta then
  begin
    UpdateFechaHastaAnteriores(fraActividad.Value, edFechaDesde.Date, edFechaHasta.Date);

    iId := ValorSql('SELECT pep.seq_prc_id.NEXTVAL FROM DUAL', '0');
    Sql.Fields.Add('rc_usualta',     Sesion.UserID);
    Sql.Fields.Add('rc_fechaalta',   'SYSDATE', False);
    Sql.Fields.Add('rc_fechahasta',  MaxFecha);
    Sql.Fields.Add('rc_fechadesde',  edFechaDesde.Date);
    Sql.Fields.Add('rc_idactividad', fraActividad.Value);
    Sql.Fields.Add('rc_nivelriesgo', edRiesgo.Value);
  end
  else
  begin
    iId := sdqConsulta.FieldByName('rc_id').AsInteger;
    Sql.Fields.Add('rc_usubaja',    Sesion.UserID);
    Sql.Fields.Add('rc_fechabaja',  'SYSDATE', False);
    Sql.Fields.Add('rc_fechahasta', edFechaHasta.Date);
  end;

  Sql.PrimaryKey.Add('rc_id', iId, False);

  try
    EjecutarSqlSt(Sql.Sql);
    CommitTrans;

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

procedure TfrmManPRC_RIESGOCIIU.LoadControls;
begin
  inherited;
end;

procedure TfrmManPRC_RIESGOCIIU.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT rc_id, rc_idactividad, ac_descripcion, ac_codigo, rc_fechadesde, rc_fechahasta, rc_usualta, rc_fechaalta,' +
          ' rc_usumodif, rc_fechamodif, rc_fechabaja, rc_nivelriesgo' +
     ' FROM pep.prc_riesgociiu LEFT JOIN comunes.cac_actividad ON rc_idactividad = ac_id' +
    ' WHERE 1 = 1';

  if not edVigenciaFiltro.IsEmpty then
    sSql := sSql + 'AND ' + SqlDate(edVigenciaFiltro.Date) + ' BETWEEN rc_fechadesde AND rc_fechahasta ';

  if not fraActividadFiltro.IsEmpty then
    sSql := sSql + 'AND rc_idactividad = ' + IntToStr(fraActividad.Value);

  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;

  inherited;
end;

procedure TfrmManPRC_RIESGOCIIU.UpdateFechaHastaAnteriores(const aActividad: Integer; const aFechaDesde, aFechaHasta: TDate);
var
  sSql: String;
begin
  sSql :=
    'UPDATE pep.prc_riesgociiu' +
      ' SET rc_fechahasta = :fechahasta,' +
          ' rc_fechamodif = SYSDATE,' +
          ' rc_usumodif = :usuario' +
    ' WHERE rc_id = (SELECT rc_id' +
                     ' FROM pep.prc_riesgociiu' +
                    ' WHERE rc_idactividad = :actividad' +
                      ' AND :fechadesde BETWEEN rc_fechadesde AND rc_fechahasta' +
                      ' AND ROWNUM < 2)';
  EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(aFechaDesde - 1), Sesion.UserID, aActividad, TDateTimeEx.Create(aFechaDesde)]);
end;

function TfrmManPRC_RIESGOCIIU.Validar: Boolean;
var
  sSql: String;
begin
  if ModoABM = maAlta then
  begin
    Verificar(fraActividad.IsEmpty, fraActividad, 'Debe seleccionar una actividad.');
    Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'La fecha de inicio de vigencia es obligatoria.');
    Verificar(edRiesgo.IsEmpty, edRiesgo, 'El factor de riesgo no puede quedar vacío.');
    Verificar(edFechaDesde.Date > MaxFecha, edFechaDesde, 'La fecha es invalida.');

    sSql :=
      'SELECT 1' +
       ' FROM pep.prc_riesgociiu' +
      ' WHERE rc_idactividad = :idactividad' +
        ' AND rc_fechabaja IS NULL' +
        ' AND :fechadesde BETWEEN rc_fechadesde AND rc_fechahasta' +
        ' AND rc_fechahasta <> :fechahasta';
    Verificar(ExisteSqlEx(sSql, [fraActividad.Value, TDateTimeEx.Create(edFechaDesde.Date), TDateTimeEx.Create(MaxFecha)]), fraActividad, 'El factor de riesgo para esta actividad y vigencia ya está definido.');
  end;

  if ModoABM = maModificacion then
  begin
    Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'La fecha de fin de vigencia es obligatoria.');
    Verificar(edFechaHasta.Date < edFechaDesde.Date, edFechaHasta, 'La fecha de fin de vigencia no puede superar la fecha desde.');
    Verificar(edRiesgo.IsEmpty, edRiesgo, 'El factor de riesgo no puede quedar vacío.');
  end;

  Result := True;
end;

procedure TfrmManPRC_RIESGOCIIU.tbNuevoClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := False;
  fraActividad.Enabled := True;
  edRiesgo.Enabled := True;
  inherited;
end;

procedure TfrmManPRC_RIESGOCIIU.tbEliminarClick(Sender: TObject);
begin
  fpABM.Caption := 'Baja';

  edFechaDesde.Enabled := False;
  edFechaHasta.Enabled := True;
  fraActividad.Enabled := False;
  edRiesgo.Enabled := False;

  ModoABM := maModificacion;
  ModoABMToSqlType;

  fraActividad.Value := sdqConsulta.FieldByName('rc_idactividad').AsInteger;
  edFechaDesde.Date  := sdqConsulta.FieldByName('rc_fechadesde').AsDateTime;
  edFechaHasta.Date  := sdqConsulta.FieldByName('rc_fechahasta').AsDateTime;
  edRiesgo.Value     := sdqConsulta.FieldByName('rc_nivelriesgo').AsInteger;

  Verificar(not sdqConsulta.FieldByName('rc_fechabaja').IsNull, Grid, 'El registro está dado de baja.');
  
  if fpABM.ShowModal = mrOk then
  begin
    if sdqConsulta.Active then
    begin
      sdqConsulta.Refresh;
      CheckButtons;
    end
  else
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmManPRC_RIESGOCIIU.tbModificarClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := True;

  inherited;
end;

procedure TfrmManPRC_RIESGOCIIU.FormCreate(Sender: TObject);
begin
  edVigenciaFiltro.Date := DBDate;

  inherited;

  FieldBaja := 'rc_fechabaja';
end;

function TfrmManPRC_RIESGOCIIU.MaxFecha: TDate;
begin
  Result := EncodeDate(2999, 12, 31);
end;

end.
