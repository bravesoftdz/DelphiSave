unit unManPRP_RIESGOPOSTAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox, unFraCodigoDescripcion, unFraActividad,
  PatternEdit, IntEdit, unfraLocalidad;

type
  TfrmManPRP_RIESGOPOSTAL = class(TfrmCustomGridABM)
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edVigenciaFiltro: TDateComboBox;
    Vigencia: TLabel;
    edRiesgo: TIntEdit;
    Label5: TLabel;
    edCodigoPostalFiltro: TEdit;
    edCodigoPostal: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function MaxFecha: TDate;

    procedure UpdateFechaHastaAnteriores(const aCodigoPostal: String; const aFechaDesde, aFechaHasta: TDate);
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManPRP_RIESGOPOSTAL: TfrmManPRP_RIESGOPOSTAL;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra, DateTimeFuncs;

{$R *.dfm}

procedure TfrmManPRP_RIESGOPOSTAL.ClearControls;
begin
  inherited;

  edCodigoPostal.Clear;
  edRiesgo.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

function TfrmManPRP_RIESGOPOSTAL.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'pep.prp_riesgopostal';
  BeginTrans;

  if ModoABM = maAlta then
  begin
    UpdateFechaHastaAnteriores(edCodigoPostal.Text, edFechaDesde.Date, edFechaHasta.Date);

    iId := ValorSqlInteger('SELECT pep.seq_prp_id.NEXTVAL FROM DUAL', 0);
    Sql.Fields.Add('rp_usualta',      Sesion.UserID);
    Sql.Fields.Add('rp_fechaalta',    'SYSDATE', False);
    Sql.Fields.Add('rp_fechahasta',   MaxFecha);
    Sql.Fields.Add('rp_fechadesde',   edFechaDesde.Date);
    Sql.Fields.Add('rp_codigopostal', edCodigoPostal.Text);
    Sql.Fields.Add('rp_nivelriesgo',  edRiesgo.Value);
  end
  else
  begin
    iId := sdqConsulta.FieldByName('rp_id').AsInteger;
    Sql.Fields.Add('rp_usubaja',    Sesion.UserID);
    Sql.Fields.Add('rp_fechabaja',  'SYSDATE', False);
    Sql.Fields.Add('rp_fechahasta', edFechaHasta.Date);
  end;

  Sql.PrimaryKey.Add('rp_id', iId, False);

  try
    EjecutarSqlST(Sql.Sql);
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

procedure TfrmManPRP_RIESGOPOSTAL.LoadControls;
begin
  inherited;
end;

procedure TfrmManPRP_RIESGOPOSTAL.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT rp_id, rp_codigopostal, rp_nivelriesgo, rp_fechadesde, rp_fechahasta, rp_usualta, rp_fechaalta, rp_usumodif,' +
          ' rp_fechamodif, rp_fechabaja, rp_nivelriesgo' +
     ' FROM pep.prp_riesgopostal' +
    ' WHERE 1 = 1';

  if not edVigenciaFiltro.IsEmpty then
    sSql := sSql + 'AND ' + SqlDate(edVigenciaFiltro.Date) + ' BETWEEN rp_fechadesde AND rp_fechahasta ';

  if edCodigoPostalFiltro.Text <> '' then
    sSql := sSql + 'AND rp_codigopostal = ' + edCodigoPostalFiltro.Text;

  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;
  
  inherited;
end;

procedure TfrmManPRP_RIESGOPOSTAL.UpdateFechaHastaAnteriores(const aCodigoPostal: String; const aFechaDesde, aFechaHasta: TDate);
var
  sSql: String;
begin
  sSql :=
    'UPDATE pep.prp_riesgopostal' +
      ' SET rp_fechahasta = :fechahasta,' +
          ' rp_fechamodif = SYSDATE,' +
          ' rp_usumodif = :usuario' +
    ' WHERE rp_id = (SELECT rp_id' +
                     ' FROM pep.prp_riesgopostal' +
                    ' WHERE rp_codigopostal = :codigopostal' +
                      ' AND :fechadesde BETWEEN rp_fechadesde AND rp_fechahasta' +
                      ' AND ROWNUM < 2)';
  EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(aFechaDesde - 1), Sesion.UserID, aCodigoPostal, TDateTimeEx.Create(aFechaDesde)]);
end;

function TfrmManPRP_RIESGOPOSTAL.Validar: Boolean;
var
  sSql: String;
begin
  if ModoABM = maAlta then
  begin
    Verificar(edCodigoPostal.Text = '', edCodigoPostal, 'Debe seleccionar un código postal.');
    sSql :=
      'SELECT 1' +
       ' FROM comunes.cub_ubicacion' +
      ' WHERE ub_cpostal = :codpostal';
    Verificar(not ExisteSqlEx(sSql, [edCodigoPostal.Text]), edCodigoPostal, 'El código postal no es válido.');
    Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'La fecha de inicio de vigencia es obligatoria.');
    Verificar(edRiesgo.IsEmpty, edRiesgo, 'El factor de riesgo no puede quedar vacío.');
    Verificar(edFechaDesde.Date > MaxFecha, edFechaDesde, 'La fecha es inválida.');

    sSql :=
      'SELECT 1' +
       ' FROM pep.prp_riesgopostal' +
      ' WHERE rp_codigopostal = :codpostal' +
        ' AND rp_fechabaja IS NULL' +
        ' AND :fechadesde BETWEEN rp_fechadesde AND rp_fechahasta' +
        ' AND rp_fechahasta <> :fechahasta';
    Verificar(ExisteSqlEx(sSql, [edCodigoPostal.Text, TDateTimeEx.Create(edFechaDesde.Date), TDateTimeEx.Create(MaxFecha)]), edCodigoPostal, 'El factor de riesgo para esta actividad y vigencia ya está definido.');
  end;

  if ModoABM = maModificacion then
  begin
    Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'La fecha de fin de vigencia es obligatoria.');
    Verificar(edFechaHasta.Date < edFechaDesde.Date, edFechaHasta, 'La fecha de fin de vigencia no puede superar la fecha desde.');
    Verificar(edRiesgo.IsEmpty, edRiesgo, 'El factor de riesgo no puede quedar vacío.');
  end;
  
  Result := True;
end;

procedure TfrmManPRP_RIESGOPOSTAL.tbNuevoClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := False;
  edCodigoPostal.Enabled := True;
  edRiesgo.Enabled := True;

  inherited;
end;

procedure TfrmManPRP_RIESGOPOSTAL.tbEliminarClick(Sender: TObject);
begin
  fpABM.Caption := 'Baja';

  edFechaDesde.Enabled := False;
  edFechaHasta.Enabled := True;
  edCodigoPostal.Enabled := False;
  edRiesgo.Enabled := False;

  ModoABM := maModificacion;
  ModoABMToSqlType;

  edCodigoPostal.Text := sdqConsulta.FieldByName('rp_codigopostal').AsString;
  edFechaDesde.Date   := sdqConsulta.FieldByName('rp_fechadesde').AsDateTime;
  edFechaHasta.Date   := sdqConsulta.FieldByName('rp_fechahasta').AsDateTime;
  edRiesgo.Value      := sdqConsulta.FieldByName('rp_nivelriesgo').AsInteger;

  Verificar(not sdqConsulta.FieldByName('rp_fechabaja').IsNull, Grid, 'El registro está dado de baja.');

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

procedure TfrmManPRP_RIESGOPOSTAL.tbModificarClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := True;

  inherited;
end;

procedure TfrmManPRP_RIESGOPOSTAL.FormCreate(Sender: TObject);
begin
  edVigenciaFiltro.Date := Now;

  inherited;

  FieldBaja := 'rp_fechabaja';
end;

function TfrmManPRP_RIESGOPOSTAL.MaxFecha: TDate;
begin
  Result := EncodeDate(2999, 12, 31);
end;

end.
