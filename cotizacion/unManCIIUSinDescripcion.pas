unit unManCIIUSinDescripcion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad;

type
  TfrmCIIUSinDescripcion = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraCAC_ACTIVIDAD: TfraStaticActividad;
    procedure fpAbmBeforeShow(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmCIIUSinDescripcion: TfrmCIIUSinDescripcion;

implementation

uses
  SqlFuncs, CustomDlgs;

{$R *.DFM}

procedure TfrmCIIUSinDescripcion.ClearControls;
begin
  fraCAC_ACTIVIDAD.Clear;
end;

function TfrmCIIUSinDescripcion.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'cac_actividad';
  Sql.SqlType := stUpdate;

  if ModoABM = maBaja then
  begin
    Sql.Fields.AddString('ac_descripcionok', 'S');
    Sql.PrimaryKey.Add('ac_id', sdqConsulta.FieldByName('ac_id').AsInteger, False);
  end
  else if ModoABM = maAlta then
  begin
    Sql.Fields.AddString('ac_descripcionok', 'N');
    Sql.PrimaryKey.Add('ac_id', fraCAC_ACTIVIDAD.Value, False);
  end;

  Result := inherited DoABM;
end;

procedure TfrmCIIUSinDescripcion.LoadControls;
begin
  fraCAC_ACTIVIDAD.Value := sdqConsulta.FieldByName('ac_id').AsInteger;
end;

procedure TfrmCIIUSinDescripcion.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_id, ac_codigo, ac_descripcion, ac_descripcionok' +
     ' FROM cac_actividad' +
    ' WHERE ac_descripcionok = ''N''';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

function TfrmCIIUSinDescripcion.Validar: Boolean;
begin
  Verificar(fraCAC_ACTIVIDAD.IsEmpty, fraCAC_ACTIVIDAD, 'Debe especificar la actividad.');
  Result := True;
end;

procedure TfrmCIIUSinDescripcion.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  fraCAC_ACTIVIDAD.ClearGrid;
end;

end.
