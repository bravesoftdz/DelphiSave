unit unCiiusSuspendidosAutomaticamente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit,
  CurrEdit, Mask, PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, DateComboBox, DateTimeFuncs,
  unFraActividad, unFraStaticCodigoDescripcion, unfraStaticActividad;

type
  TfrmCiiusSuspendidosAutomaticamente = class(TfrmCustomGridABM)
    lbFactor: TLabel;
    lbValor: TLabel;
    lbFechaVigencia: TLabel;
    edFechaVigenciaDesde: TDateComboBox;
    gbVigenciaFiltro: TGroupBox;
    edFechaVigenciaDesdeFiltro: TDateComboBox;
    gbFactorFiltro: TGroupBox;
    fraCiiu: TfraStaticActividad;
    edCapitas: TIntEdit;
    Label2: TLabel;
    edFechaVigenciaHasta: TDateComboBox;
    memoObservaciones: TMemo;
    Label3: TLabel;
    fraCiiuFiltro: TfraStaticActividad;
    Label1: TLabel;
    edFechaVigenciaHastaFiltro: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    procedure UpdateFechaHastaAnteriores(const aId, aIdCiiu: Integer; const aFechaVigenciaDesde, aFechaVigenciaHasta: TDate);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

const
  FECHA_VIGENCIA_TOPE = '31/12/2099';
  MAXCOLS = 0;

var
  frmCiiusSuspendidosAutomaticamente: TfrmCiiusSuspendidosAutomaticamente;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra;

{$R *.dfm}

function TfrmCiiusSuspendidosAutomaticamente.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'afi.acu_ciiususpendidoauto';

  if ModoABM = maBaja then
  begin
    iId := sdqConsulta.FieldByName('cu_id').AsInteger;
    Sql.Fields.Add('cu_fechabaja', 'SYSDATE', False);
    Sql.Fields.Add('cu_usubaja',   Sesion.UserID);

    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      iId := -1;

      Sql.Fields.Add('cu_capitas',       edCapitas.Value);
      Sql.Fields.Add('cu_fechaalta',     SQL_DATETIME, False);
      Sql.Fields.Add('cu_fechadesde',    edFechaVigenciaDesde.Date);
      Sql.Fields.Add('cu_fechahasta',    edFechaVigenciaHasta.Date);
      Sql.Fields.Add('cu_idactividad',   fraCiiu.Value);
      Sql.Fields.Add('cu_observaciones', memoObservaciones.Lines.Text);
      Sql.Fields.Add('cu_usualta',       Sesion.UserID);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('cu_id').AsInteger;

      Sql.Fields.Add('cu_capitas',       edCapitas.Value);
      Sql.Fields.Add('cu_fechadesde',    edFechaVigenciaDesde.Date);
      Sql.Fields.Add('cu_fechahasta',    edFechaVigenciaHasta.Date);
      Sql.Fields.Add('cu_fechamodif',    SQL_DATETIME, False);
      Sql.Fields.Add('cu_observaciones', memoObservaciones.Lines.Text);
      Sql.Fields.Add('cu_usumodif',      Sesion.UserID);
    end;

    UpdateFechaHastaAnteriores(iId, fraCiiu.Value, edFechaVigenciaDesde.Date, edFechaVigenciaHasta.Date);
  end;

  Sql.PrimaryKey.Add('cu_id', iId, False);

  Result := inherited DoABM;

  if Result then
    RefreshData;
end;

function TfrmCiiusSuspendidosAutomaticamente.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraCiiu.IsEmpty, fraCiiu.edCodigo, 'El CIIU es obligatorio.');
  Verificar(edCapitas.IsEmpty, edCapitas, 'El campo Cápitas es obligatorio.');
  Verificar(edFechaVigenciaDesde.IsEmpty, edFechaVigenciaDesde, 'La Fecha de Vigencia Desde es obligatoria.');
  Verificar(edFechaVigenciaHasta.IsEmpty, edFechaVigenciaHasta, 'La Fecha de Vigencia Hasta es obligatoria.');
  Verificar((edFechaVigenciaDesde.Date > edFechaVigenciaHasta.Date), edFechaVigenciaDesde, 'La Fecha de Vigencia Desde no puede ser mayor a la Fecha de Vigencia Hasta.');

  if (modoABM = maAlta) then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM afi.acu_ciiususpendidoauto' +
      ' WHERE cu_idactividad = :idactividad' +
        ' AND :fechavigenciadesde BETWEEN cu_fechadesde AND cu_fechahasta' +
        ' AND cu_fechabaja IS NULL';
    if ExisteSqlEx(sSql, [fraCiiu.Value, TDateTimeEx.Create(edFechaVigenciaDesde.Date)]) then
      if MsgBox('Ya existe un CIIU cargado para esa Fecha de Vigencia Desde.' + #10#13 +
                'Si continua, las vigencias anteriores que se solapen con la nueva seran dadas de baja.' + #10#13 +
                '¿ Realmente desea continuar ?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      begin
        Result := False;
        Exit;
      end;

    sSql :=
      'SELECT 1' +
       ' FROM afi.acu_ciiususpendidoauto' +
      ' WHERE cu_idactividad = :idactividad' +
        ' AND :fechavigenciahasta BETWEEN cu_fechadesde AND cu_fechahasta' +
        ' AND cu_fechabaja IS NULL';
    if ExisteSqlEx(sSql, [fraCiiu.Value, TDateTimeEx.Create(edFechaVigenciaHasta.Date)]) then
      if MsgBox('Ya existe un CIIU cargado para esa Fecha de Vigencia Hasta.' + #10#13 +
                'Si continua, las vigencias anteriores que se solapen con la nueva seran dadas de baja.' + #10#13 +
                '¿ Realmente desea continuar ?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      begin
        Result := False;
        Exit;
      end;

    sSql :=
      'SELECT 1' +
       ' FROM afi.acu_ciiususpendidoauto' +
      ' WHERE cu_idactividad = :idactividad' +
        ' AND :fechavigenciadesde < cu_fechadesde' +
        ' AND :fechavigenciahasta > cu_fechahasta' +
        ' AND cu_fechabaja IS NULL';
    if ExisteSqlEx(sSql, [fraCiiu.Value, TDateTimeEx.Create(edFechaVigenciaDesde.Date) , TDateTimeEx.Create(edFechaVigenciaHasta.Date)]) then
      if MsgBox('Ya existe un CIIU cargado entre la Fecha de Vigencia Desde y la Fecha de Vigencia Hasta.' + #10#13 +
                'Si continua, las vigencias anteriores que se solapen con la nueva seran dadas de baja.' + #10#13 +
                '¿ Realmente desea continuar ?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      begin
        Result := False;
        Exit;
      end;
  end;

  if (modoABM = maModificacion) then
  begin
    if (edFechaVigenciaDesde.Date <> Trunc(sdqConsulta.FieldByName('cu_fechadesde').AsDateTime)) or
       (edFechaVigenciaHasta.Date <> Trunc(sdqConsulta.FieldByName('cu_fechahasta').AsDateTime)) then
      if MsgBox('Esta cambiando la fecha de vigencia. ¿ Realmente desea continuar ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM afi.acu_ciiususpendidoauto' +
          ' WHERE cu_idactividad = :idactividad' +
            ' AND :fechavigenciadesde BETWEEN cu_fechadesde AND cu_fechahasta' +
            ' AND cu_id <> :id' +
            ' AND cu_fechabaja IS NULL';
        if ExisteSqlEx(sSql, [fraCiiu.Value, TDateTimeEx.Create(edFechaVigenciaDesde.Date), sdqConsulta.FieldByName('cu_id').AsInteger]) then
          if MsgBox('Ya existe un CIIU cargado para esa Fecha de Vigencia Desde.' + #10#13 +
                    'Si continua, las vigencias anteriores que se solapen con la nueva seran dadas de baja.' + #10#13 +
                    '¿ Realmente desea continuar ?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          begin
            Result := False;
            Exit;
          end;

        sSql :=
          'SELECT 1' +
           ' FROM afi.acu_ciiususpendidoauto' +
          ' WHERE cu_idactividad = :idactividad' +
            ' AND :fechavigenciahasta BETWEEN cu_fechadesde AND cu_fechahasta' +
            ' AND cu_id <> :id' +
            ' AND cu_fechabaja IS NULL';
        if ExisteSqlEx(sSql, [fraCiiu.Value, TDateTimeEx.Create(edFechaVigenciaHasta.Date), sdqConsulta.FieldByName('cu_id').AsInteger]) then
          if MsgBox('Ya existe un CIIU cargado para esa Fecha de Vigencia Hasta.' + #10#13 +
                    'Si continua, las vigencias anteriores que se solapen con la nueva seran dadas de baja.' + #10#13 +
                    '¿ Realmente desea continuar ?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          begin
            Result := False;
            Exit;
          end;

        sSql :=
          'SELECT 1' +
           ' FROM afi.acu_ciiususpendidoauto' +
          ' WHERE cu_idactividad = :idactividad' +
            ' AND :fechavigenciadesde < cu_fechadesde' +
            ' AND :fechavigenciahasta > cu_fechahasta' +
            ' AND cu_id <> :id' +
            ' AND cu_fechabaja IS NULL';
        if ExisteSqlEx(sSql, [fraCiiu.Value, TDateTimeEx.Create(edFechaVigenciaDesde.Date) , TDateTimeEx.Create(edFechaVigenciaHasta.Date), sdqConsulta.FieldByName('cu_id').AsInteger]) then
          if MsgBox('Ya existe un CIIU cargado entre la Fecha de Vigencia Desde y la Fecha de Vigencia Hasta.' + #10#13 +
                    'Si continua, las vigencias anteriores que se solapen con la nueva seran dadas de baja.' + #10#13 +
                    '¿ Realmente desea continuar ?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          begin
            Result := False;
            Exit;
          end;
      end
      else
      begin
        Result := False;
        Exit;
      end;
  end;

  Result := True;
end;


procedure TfrmCiiusSuspendidosAutomaticamente.ClearControls;
begin
  fraCiiu.Clear;
  edCapitas.Clear;
  edFechaVigenciaDesde.Clear;
  edFechaVigenciaHasta.Date := StrToDate(FECHA_VIGENCIA_TOPE);
  memoObservaciones.Clear;
end;

procedure TfrmCiiusSuspendidosAutomaticamente.ClearData;
begin
  inherited;

  fraCiiuFiltro.Clear;
  edFechaVigenciaDesdeFiltro.Clear;
  edFechaVigenciaHastaFiltro.Clear;
end;

procedure TfrmCiiusSuspendidosAutomaticamente.LoadControls;
begin
  with sdqConsulta do
  begin
    fraCiiu.Value                := FieldByName('cu_idactividad').AsInteger;
    edCapitas.Value              := FieldByName('cu_capitas').AsInteger;
    edFechaVigenciaDesde.Date    := FieldByName('cu_fechadesde').AsDateTime;
    edFechaVigenciaHasta.Date    := FieldByName('cu_fechahasta').AsDateTime;
    memoObservaciones.Lines.Text := FieldByName('cu_observaciones').AsString;
  end;
end;

procedure TfrmCiiusSuspendidosAutomaticamente.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT acu.*, ac_codigo || '' - '' || ac_descripcion ciiu, NVL(cu_fechamodif, cu_fechaalta) fechamodif, NVL(cu_usumodif, cu_usualta) usumodif' +
     ' FROM afi.acu_ciiususpendidoauto acu, cac_actividad' +
    ' WHERE cu_idactividad = ac_id';

  if not fraCiiuFiltro.IsEmpty then
    sSql := sSql + ' AND cu_idactividad = '+ SqlValue(fraCiiuFiltro.Value);

  if not edFechaVigenciaDesdeFiltro.IsEmpty then
    sSql := sSql + ' AND ' + SqlDate(edFechaVigenciaDesdeFiltro.Date) + 'BETWEEN cu_fechadesde AND cu_fechahasta';

  if not edFechaVigenciaHastaFiltro.IsEmpty then
    sSql := sSql + ' AND ' + SqlDate(edFechaVigenciaHastaFiltro.Date) + 'BETWEEN cu_fechadesde AND cu_fechahasta';

  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;

  inherited;
end;

procedure TfrmCiiusSuspendidosAutomaticamente.UpdateFechaHastaAnteriores(const aId, aIdCiiu: Integer; const aFechaVigenciaDesde, aFechaVigenciaHasta: TDate);
var
  sSql: String;
begin
  if aFechaVigenciaHasta = StrToDate(FECHA_VIGENCIA_TOPE) then    // Si están cargando un registro con vigencia actual, le cambio la vigencia hasta al registro anterior..
  begin
    sSql :=
      'UPDATE afi.acu_ciiususpendidoauto' +
        ' SET cu_fechahasta = :fechahasta,' +
            ' cu_fechamodif = SYSDATE,' +
            ' cu_usumodif = :usumodif' +
      ' WHERE cu_idactividad = :idactividad' +
        ' AND :fechadesde BETWEEN cu_fechadesde AND cu_fechahasta' +
        ' AND cu_fechahasta = TO_DATE(:fechatope, ''dd/mm/yyyy'')' +
        ' AND cu_fechabaja IS NULL';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(aFechaVigenciaDesde - 1), Sesion.UserID, aIdCiiu, TDateTimeEx.Create(aFechaVigenciaDesde), FECHA_VIGENCIA_TOPE]);
  end;

  // Doy de baja los registros que tienen fecha de vigencia solapados..
  sSql :=
    'UPDATE afi.acu_ciiususpendidoauto' +
      ' SET cu_fechabaja = SYSDATE,' +
          ' cu_usubaja = :usumodif' +
    ' WHERE cu_idactividad = :idactividad' +
      ' AND (   :fechadesde BETWEEN cu_fechadesde AND cu_fechahasta' +
           ' OR :fechahasta BETWEEN cu_fechadesde AND cu_fechahasta' +
           ' OR (    :fechadesde < cu_fechadesde' +
               ' AND :fechahasta > cu_fechahasta))' +
      ' AND cu_fechabaja IS NULL' +
      ' AND cu_id <> :id';
  EjecutarSqlSTEx(sSql, [Sesion.UserID, aIdCiiu, TDateTimeEx.Create(aFechaVigenciaDesde), TDateTimeEx.Create(aFechaVigenciaHasta), TDateTimeEx.Create(aFechaVigenciaDesde),
                         TDateTimeEx.Create(aFechaVigenciaHasta), aId]);
end;


procedure TfrmCiiusSuspendidosAutomaticamente.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'cu_fechabaja';
  ShowActived := True;

  edFechaVigenciaDesdeFiltro.Date := DBDate;
end;

procedure TfrmCiiusSuspendidosAutomaticamente.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('cu_fechabaja').IsNull, Grid, 'Este registro ya fue dado de baja.');

  inherited;
end;

procedure TfrmCiiusSuspendidosAutomaticamente.fpAbmShow(Sender: TObject);
begin
  inherited;

  LockControls([fraCiiu], (ModoABM = maModificacion));
end;

end.
