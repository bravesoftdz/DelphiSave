unit unCuitsNoAutomaticos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit,
  CurrEdit, Mask, PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, DateComboBox, DateTimeFuncs;

type
  TfrmCuitsNoAutomaticos = class(TfrmCustomGridABM)
    lbFactor: TLabel;
    lbValor: TLabel;
    lbFechaVigencia: TLabel;
    edFechaDesde: TDateComboBox;
    gbFactorFiltro: TGroupBox;
    Factor: TLabel;
    Label2: TLabel;
    edFechaHasta: TDateComboBox;
    memoObservaciones: TMemo;
    edCuit: TMaskEdit;
    edCuitBusqueda: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure edCuitBusquedaExit(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

const
  MAXCOLS = 0;

var
  frmCuitsNoAutomaticos: TfrmCuitsNoAutomaticos;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra, CUIT, SqlFuncs;

{$R *.dfm}

function TfrmCuitsNoAutomaticos.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'art.acn_cuitnoautomatico';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('cn_id', sdqConsulta.FieldByName('cn_id').AsInteger, False);
    Sql.Fields.Add('cn_usubaja',   Sesion.UserID);
    Sql.Fields.Add('cn_fechabaja', 'SYSDATE', False);

    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else
  begin
    if edFechaHasta.IsEmpty then
      edFechaHasta.Date := StrToDate('31/12/2999');

    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('cn_id', exNull);
      Sql.Fields.Add('cn_cuit',          edCuit.Text);
      Sql.Fields.Add('cn_fechaalta',     'SYSDATE', False);
      Sql.Fields.Add('cn_fechadesde',    edFechaDesde.Date);
      Sql.Fields.Add('cn_fechahasta',    edFechaHasta.Date);
      Sql.Fields.Add('cn_observaciones', memoObservaciones.Lines.Text);
      Sql.Fields.Add('cn_usualta',       Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('cn_id', sdqConsulta.FieldByName('cn_id').AsInteger, False);
      Sql.Fields.Add('cn_cuit',          edCuit.Text);
      Sql.Fields.Add('cn_fechadesde',    edFechaDesde.Date);
      Sql.Fields.Add('cn_fechahasta',    edFechaHasta.Date);
      Sql.Fields.Add('cn_fechamodif',    'SYSDATE', False);
      Sql.Fields.Add('cn_observaciones', memoObservaciones.Lines.Text);
      Sql.Fields.Add('cn_usumodif',      Sesion.UserID);
    end;
  end;

  Result := inherited DoABM;

  if Result then
    RefreshData;
end;

function TfrmCuitsNoAutomaticos.Validar: Boolean;
var
//  iId: Integer;
  sSql: String;
begin
  Verificar(not IsCuit(edCuit.Text), edCuit, 'La C.U.I.T. es inválida.');

  if ModoABM = maAlta then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM art.acn_cuitnoautomatico' +
      ' WHERE cn_cuit = :cuit' +
        ' AND cn_fechabaja IS NULL';
    Verificar(ExisteSqlEx(sSql, [edCuit.Text]), edCuit, 'La C.U.I.T. ya está cargada como "No Autocotiza".');
  end;

  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'El campo Fecha Desde es obligatorios.');
{
  if ModoABM = maAlta then
    iId := 0
  else
    iId := sdqConsulta.FieldByName('cn_id').AsInteger;
  sSql :=
    'SELECT 1' +
     ' FROM art.acn_cuitnoautomatico' +
    ' WHERE cn_cuit = :cuit' +
      ' AND cn_id <> :id' +
      ' AND cn_fechabaja IS NULL' +
      ' AND :fechadesde BETWEEN cn_fechadesde AND cn_fechahasta';
  Verificar(ExisteSqlEx(sSql, [edCuit.Text, iId, TDateTimeEx.Create(edFechaDesde.Date)]), edCuit, 'La C.U.I.T. ya está cargada como "No Autocotiza".');
}
  Verificar((memoObservaciones.Lines.Text = ''), memoObservaciones, 'El campo Observaciones es obligatorio.');

  Result := True;
end;


procedure TfrmCuitsNoAutomaticos.ClearControls;
begin
  edCuitBusqueda.Clear;
end;

procedure TfrmCuitsNoAutomaticos.LoadControls;
begin
  with sdqConsulta do
  begin
    edCuit.Text                  := FieldByName('cn_cuit').AsString;
    edFechaDesde.Date            := FieldByName('cn_fechadesde').AsDateTime;
    edFechaHasta.Date            := FieldByName('cn_fechahasta').AsDateTime;
    memoObservaciones.Lines.Text := FieldByName('cn_observaciones').AsString;
  end;
end;

procedure TfrmCuitsNoAutomaticos.RefreshData;
var
  sSql : String;
begin
  sSql :=
    'SELECT acn.*, art.utiles.armar_cuit(cn_cuit) cuitarmado, NVL(cn_fechamodif, cn_fechaalta) fechamodif' +
     ' FROM art.acn_cuitnoautomatico acn' +
    ' WHERE 1 = 1';

  if edCuitBusqueda.Text <> '' then
    sSql := sSql + ' AND cn_cuit = ' + SqlValue(edCuitBusqueda.Text);

  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;

  inherited;
end;

procedure TfrmCuitsNoAutomaticos.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'cn_fechabaja';
  ShowActived := True;
end;

procedure TfrmCuitsNoAutomaticos.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('cn_fechabaja').IsNull, Grid, 'Este registro fue dado de baja.');

  inherited;
end;

procedure TfrmCuitsNoAutomaticos.fpAbmShow(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControls([edCuit], (ModoABM = maModificacion));
end;

procedure TfrmCuitsNoAutomaticos.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('cn_fechabaja').IsNull, Grid, 'Este registro ya fue dado de baja.');

  inherited;
end;

procedure TfrmCuitsNoAutomaticos.edCuitBusquedaExit(Sender: TObject);
begin
  Verificar((edCuitBusqueda.Text <> '') and (not IsCuit(edCuitBusqueda.Text)), edCuitBusqueda, 'La C.U.I.T. es inválida.');
end;

procedure TfrmCuitsNoAutomaticos.tbNuevoClick(Sender: TObject);
begin
  edCuit.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  memoObservaciones.Clear;

  inherited;
end;

procedure TfrmCuitsNoAutomaticos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  ClearControls;
end;

end.
