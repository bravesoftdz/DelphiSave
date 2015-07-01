unit unManCIIUDescuentoPrimeraCuota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad, unfraEntidades, unFraCodigoDescripcion;

type
  TfrmCIIUDescuentoPrimeraCuota = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraCAC_ACTIVIDAD: TfraStaticActividad;
    fraXEN_ENTIDAD: TfraEntidades;
    lbEntidad: TLabel;
    GroupBox1: TGroupBox;
    dDesde: TDateTimePicker;
    dHasta: TDateTimePicker;
    lbDesde: TLabel;
    lbHasta: TLabel;
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dDesdeChange(Sender: TObject);
    procedure dHastaChange(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmCIIUDescuentoPrimeraCuota: TfrmCIIUDescuentoPrimeraCuota;

implementation

uses
  SqlFuncs, CustomDlgs, unSesion, AnsiSql, unDmPrincipal, DateTimeFuncs;

{$R *.DFM}

procedure TfrmCIIUDescuentoPrimeraCuota.ClearControls;
begin
  fraCAC_ACTIVIDAD.Clear;
end;

function TfrmCIIUDescuentoPrimeraCuota.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'aab_actividadbonificacion';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('ab_fechabaja',     SQL_DATETIME, False);
    Sql.Fields.AddString('ab_usubaja', Sesion.UserID);
    Sql.PrimaryKey.Add('ab_id',        sdqConsulta.FieldByName('ab_id').AsInteger, False);
  end
  else if ModoABM = maAlta then
  begin
    Sql.SqlType := stInsert;
    Sql.Fields.AddInteger('ab_idactividad', fraCAC_ACTIVIDAD.Value);
    Sql.Fields.AddInteger('ab_identidad',   fraXEN_ENTIDAD.Value);

    dDesde.Time := StrToTime('00:00:00');
    dHasta.Time := StrToTime('00:00:00');
    Sql.Fields.Add('ab_fechadesde',    dDesde.Date);
    Sql.Fields.Add('ab_fechahasra',    dHasta.Date);
    Sql.Fields.AddString('ab_usualta', Sesion.UserID);
    Sql.Fields.Add('ab_fechaalta',     SQL_DATETIME, False);
    //Sql.PrimaryKey.Add('cd_id', fraCAC_ACTIVIDAD., False);
  end
  else if ModoABM = maModificacion then
  begin
    Sql.SqlType := stUpdate;
    Sql.Fields.AddInteger('ab_idactividad', fraCAC_ACTIVIDAD.Value);
    Sql.Fields.AddInteger('ab_identidad',   fraXEN_ENTIDAD.Value);

    dDesde.Time := StrToTime('00:00:00');
    dHasta.Time := StrToTime('00:00:00');
    Sql.Fields.Add('ab_fechadesde',     dDesde.Date);
    Sql.Fields.Add('ab_fechahasta',     dHasta.Date);
    Sql.Fields.AddString('ab_usumodif', Sesion.UserID);
    Sql.Fields.Add('ab_fechamodif',     SQL_DATETIME, False);
    Sql.PrimaryKey.Add('ab_id',         sdqConsulta.FieldByName('ab_id').AsInteger, False);
  end;

  Result := inherited DoABM;
end;

procedure TfrmCIIUDescuentoPrimeraCuota.LoadControls;
begin
  fraCAC_ACTIVIDAD.Value := sdqConsulta.FieldByName('ac_id').AsInteger;
  fraXEN_ENTIDAD.Value := sdqConsulta.FieldByName('en_id').AsInteger;
end;

procedure TfrmCIIUDescuentoPrimeraCuota.RefreshData;
var
  sSql: String;
begin                       {Si llamamos EN_ID da error por alguna razon extraña, solucionado con el AS IDENT}
  sSql :=
    'SELECT aab.ab_id, aab.ab_idactividad, xen.en_id AS ident, aab.ab_identidad, xen.en_nombre, cac.ac_descripcion,' +
          ' aab.ab_fechabaja, aab.ab_fechamodif, aab.ab_fechaalta, aab.ab_usualta, xen.en_id, cac.ac_id,' +
          ' aab.ab_fechadesde, aab.ab_fechahasta, xen.en_cuit, cac.ac_codigo, aab.ab_usumodif, aab.ab_usubaja' +
     ' FROM aab_actividadbonificacion aab LEFT JOIN xen_entidad xen ON aab.ab_identidad = xen.en_id' +
          ' LEFT JOIN cac_actividad cac ON aab.ab_idactividad = cac.ac_id';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

function TfrmCIIUDescuentoPrimeraCuota.Validar: Boolean;
var
  sSql: String;
begin
  //verificar que pasa si quieren dar de alta un registro que ya fue dado de baja, en este caso no se puede
  sSql :=
    'SELECT 1' +
     ' FROM aab_actividadbonificacion' +
    ' WHERE ab_idactividad = ' + IntToStr(fraCAC_ACTIVIDAD.Value) +
      ' AND ab_identidad = ' + IntToStr(fraXEN_ENTIDAD.Value) +
      ' AND (( ' + SqlValue(dDesde.Date) + ' BETWEEN ab_fechadesde AND ab_fechahasta)' +
       ' OR ( ' + SqlValue(dHasta.Date) + ' BETWEEN ab_fechadesde AND ab_fechahasta)' +
       ' OR ( ' + SqlValue(dDesde.Date) + ' < ab_fechadesde AND ' + SqlValue(dHasta.Date) + ' > ab_fechahasta)' +
       ' OR ( ' + SqlValue(dDesde.Date) + ' > ab_fechadesde AND ' + SqlValue(dHasta.Date) + ' < ab_fechahasta))' +
      ' AND ( ' + sdqConsulta.FieldByName('ab_id').AsString + ' <> ab_id)'; // Que no sea el mismo registro que hay q editar


  if Verificar(fraXEN_ENTIDAD.IsEmpty, fraXEN_ENTIDAD, 'Debe especificar la entidad.') then
    if Verificar(fraCAC_ACTIVIDAD.IsEmpty, fraCAC_ACTIVIDAD, 'Debe especificar la actividad.') then
      Verificar(ExisteSql(sSql), dHasta, 'Rango de vigencia ya asignado.');

  Result := True;
end;

procedure TfrmCIIUDescuentoPrimeraCuota.fpAbmBeforeShow(Sender: TObject);
const
  MAXDATE: Double = 2958465.99999; // 12/31/9999 11:59:59.999 PM
  MINDATE: TDateTime = -657434.0;  // 01-01-0100 00:00:00.000 AM
begin
  inherited;

  dDesde.MinDate := MINDATE;
  dDesde.MaxDate := MAXDATE;
  dHasta.MinDate := MINDATE;
  dHasta.MaxDate := MAXDATE;

  if ModoABM = maAlta then
  begin
    dDesde.Date := Now;
    dHasta.Date := LastDayOfYear(Now);
    fraCAC_ACTIVIDAD.ClearGrid;
    fraXEN_ENTIDAD.Clear;
  end
  else if ModoABM = maModificacion then
  begin
    fraCAC_ACTIVIDAD.Value := sdqConsulta.FieldByName('ac_id').AsInteger;
    fraXEN_ENTIDAD.Value   := sdqConsulta.FieldByName('en_id').AsInteger;
    dDesde.Date            := sdqConsulta.FieldByName('ab_fechadesde').AsDateTime;
    dHasta.Date            := sdqConsulta.FieldByName('ab_fechahasta').AsDateTime;
  end;
end;

procedure TfrmCIIUDescuentoPrimeraCuota.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ab_fechabaja';
end;

procedure TfrmCIIUDescuentoPrimeraCuota.dDesdeChange(Sender: TObject);
begin
  dHasta.MinDate := dDesde.Date + 1;
  dHasta.Date := LastDayOfYear(dDesde.Date + 1);
end;

procedure TfrmCIIUDescuentoPrimeraCuota.dHastaChange(Sender: TObject);
begin
  dDesde.MaxDate := dHasta.Date - 1;
end;

procedure TfrmCIIUDescuentoPrimeraCuota.fpAbmShow(Sender: TObject);
begin
  fraXEN_ENTIDAD.edCodigo.SetFocus;
end;

end.
