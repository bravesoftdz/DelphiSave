unit unManCIIUNoAutoCotizables;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad;

type
  TfrmManCIIUNoAutoCotizables = class(TfrmCustomGridABM)
    fraCAC_ACTIVIDAD: TfraStaticActividad;
    Label1: TLabel;
    procedure fpAbmBeforeShow(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManCIIUNoAutoCotizables: TfrmManCIIUNoAutoCotizables;

implementation

uses
  SqlFuncs, CustomDlgs;

{$R *.DFM}

procedure TfrmManCIIUNoAutoCotizables.ClearControls;
begin
  fraCAC_ACTIVIDAD.Clear;
end;

function TfrmManCIIUNoAutoCotizables.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'cac_actividad';
  Sql.SqlType := stUpdate;

  if ModoABM = maBaja then
  begin
    Sql.Fields.AddString('ac_cotizable', 'S');
    Sql.PrimaryKey.Add('ac_id', sdqConsulta.FieldByName('ac_id').AsInteger, False);
  end
  else if ModoABM = maAlta then
  begin
    Sql.Fields.AddString('ac_cotizable', 'N');
    Sql.PrimaryKey.Add('ac_id', fraCAC_ACTIVIDAD.Value, False);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCIIUNoAutoCotizables.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;

  fraCAC_ACTIVIDAD.ClearGrid;
end;

procedure TfrmManCIIUNoAutoCotizables.LoadControls;
begin
  fraCAC_ACTIVIDAD.Value := sdqConsulta.FieldByName('ac_id').AsInteger;
end;

procedure TfrmManCIIUNoAutoCotizables.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_id, ac_codigo, ac_descripcion, ac_cotizable' +
     ' FROM cac_actividad' +
    ' WHERE ac_cotizable = ''N''';
  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  
  inherited;
end;

function TfrmManCIIUNoAutoCotizables.Validar: Boolean;
begin
  Verificar(fraCAC_ACTIVIDAD.IsEmpty, fraCAC_ACTIVIDAD, 'Debe especificar la actividad.');
  Verificar(fraCAC_ACTIVIDAD.IsNoAutoCotizable, fraCAC_ACTIVIDAD, 'La actividad seleccionada ya ha sido identificada como no auto-cotizable.');
  Result := True;
end;

end.
