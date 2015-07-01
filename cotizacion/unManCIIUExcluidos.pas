unit unManCIIUExcluidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad;

type
  TfrmManCIIUExcluidos = class(TfrmCustomGridABM)
    fraCAC_ACTIVIDAD: TfraStaticActividad;
    Label1: TLabel;
    procedure fpAbmBeforeShow(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManCIIUExcluidos: TfrmManCIIUExcluidos;

implementation

uses
  SqlFuncs, CustomDlgs;

{$R *.DFM}

procedure TfrmManCIIUExcluidos.ClearControls;
begin
  fraCAC_ACTIVIDAD.Clear;
end;

function TfrmManCIIUExcluidos.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'cac_actividad';
  Sql.SqlType := stUpdate;

  if ModoABM = maBaja then
  begin
    Sql.Fields.AddString('ac_excluido', 'N');
    Sql.PrimaryKey.Add('ac_id', sdqConsulta.FieldByName('ac_id').AsInteger, False);
  end
  else if ModoABM = maAlta then
  begin
    Sql.Fields.AddString('ac_excluido', 'S');
    Sql.PrimaryKey.Add('ac_id', fraCAC_ACTIVIDAD.Value, False);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCIIUExcluidos.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  fraCAC_ACTIVIDAD.ClearGrid;
end;

procedure TfrmManCIIUExcluidos.LoadControls;
begin
  fraCAC_ACTIVIDAD.Value := sdqConsulta.FieldByName('ac_id').AsInteger;
end;

procedure TfrmManCIIUExcluidos.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_id, ac_codigo, ac_descripcion, ac_excluido' +
     ' FROM cac_actividad' +
    ' WHERE ac_excluido = ''S''';
  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

function TfrmManCIIUExcluidos.Validar: Boolean;
begin
  Verificar(fraCAC_ACTIVIDAD.IsEmpty, fraCAC_ACTIVIDAD, 'Debe especificar la actividad.');
  Result := True;
end;

end.
