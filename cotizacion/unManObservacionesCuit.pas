unit unManObservacionesCuit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog,
  SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unfraStaticActividad, unfraEntidades, unFraCodigoDescripcion, RxPlacemnt, Vcl.Mask,
  RxToolEdit, DateComboBox;

type
  TfrmManObservacionesCuit = class(TfrmCustomGridABM)
    lbEntidad: TLabel;
    GroupBox1: TGroupBox;
    lbDesde: TLabel;
    lbHasta: TLabel;
    Label1: TLabel;
    memoObservaciones: TMemo;
    edCuit: TMaskEdit;
    edHasta: TDateComboBox;
    edDesde: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
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
  frmManObservacionesCuit: TfrmManObservacionesCuit;

implementation

uses
  SqlFuncs, CustomDlgs, unSesion, AnsiSql, unDmPrincipal, DateTimeFuncs, CUIT;

{$R *.DFM}

procedure TfrmManObservacionesCuit.ClearControls;
begin
  edCuit.Clear;
  edDesde.Clear;
  edHasta.Clear;
  memoObservaciones.Clear;
end;

function TfrmManObservacionesCuit.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aoc_observacioncuit';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('oc_id',    sdqConsulta.FieldByName('oc_id').AsInteger, False);
    Sql.Fields.Add('oc_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('oc_usubaja',   Sesion.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.Fields.Add('oc_cuit',     edCuit.Text);
      Sql.Fields.Add('oc_usualta',  Sesion.UserID);
      Sql.Fields.Add('oc_fechalta', SQL_DATETIME, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('oc_id',     sdqConsulta.FieldByName('oc_id').AsInteger, False);
      Sql.Fields.Add('oc_usumodif',   Sesion.UserID);
      Sql.Fields.Add('oc_fechamodif', SQL_DATETIME, False);
    end;

    Sql.Fields.Add('oc_observacion', memoObservaciones.Lines.Text);
    Sql.Fields.Add('oc_fechadesde',  edDesde.Date, dmDate);
    Sql.Fields.Add('oc_fechahasta',  edHasta.Date, dmDate);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManObservacionesCuit.LoadControls;
begin
  with sdqConsulta do
  begin
    edCuit.Text                  := FieldByName('oc_cuit').AsString;
    edDesde.Date                 := FieldByName('oc_fechadesde').AsDateTime;
    edHasta.Date                 := FieldByName('oc_fechahasta').AsDateTime;
    memoObservaciones.Lines.Text := FieldByName('oc_observacion').AsString;
  end;
end;

procedure TfrmManObservacionesCuit.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT aoc.*, art.utiles.armar_cuit(oc_cuit) cuit, NVL(oc_fechamodif, oc_fechalta) fechamodif, NVL(oc_usumodif, oc_usualta) usumodif' +
     ' FROM afi.aoc_observacioncuit aoc' +
     ' WHERE 1 = 1';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManObservacionesCuit.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('oc_fechabaja').IsNull, tbModificar, 'El registro ya está dado de baja.');
  inherited;
end;

procedure TfrmManObservacionesCuit.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('oc_fechabaja').IsNull, tbModificar, 'No se puede modificar un registro dado de baja.');
  inherited;
end;

function TfrmManObservacionesCuit.Validar: Boolean;
begin
  Verificar((edCuit.Text = ''), edCuit, 'Debe ingresar la C.U.I.T.');
  Verificar(not IsCuit(edCuit.Text), edCuit, 'La C.U.I.T. ingresada es inválida.');
  Verificar(edDesde.IsEmpty, edDesde, 'Debe ingresar la Vigencia Desde.');
  Verificar(edHasta.IsEmpty, edHasta, 'Debe ingresar la Vigencia Hasta.');
  Verificar((edDesde.Date > edHasta.Date), edDesde, 'La Vigencia Desde debe ser menor a la Vigencia Hasta.');
  Verificar((memoObservaciones.Text = ''), memoObservaciones, 'Debe ingresar las Observaciones.');

  Result := True;
end;

procedure TfrmManObservacionesCuit.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'oc_fechabaja';
end;

procedure TfrmManObservacionesCuit.fpAbmShow(Sender: TObject);
begin
  inherited;

  edCuit.ReadOnly := (ModoABM <> maAlta);
  if edCuit.ReadOnly then
    edCuit.Color := clBtnFace
  else
    edCuit.Color := clWindow;
end;

end.
