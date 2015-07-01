unit unManCIIUTipoRiesgo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad, unFraCodigoDescripcion, unFraCodDesc, Mask, PatternEdit, IntEdit;

type
  TfrmManCIIUTipoRiesgo = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    fraTipoRiesgo: TfraCodDesc;
    fraCiiu: TfraStaticActividad;
    tbImportarTiposRiesgo: TToolButton;
    Label3: TLabel;
    edAutocotizables: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbImportarTiposRiesgoClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManCIIUTipoRiesgo: TfrmManCIIUTipoRiesgo;

implementation

uses
  SqlFuncs, CustomDlgs, unImpoExpoWizard;

{$R *.DFM}

procedure TfrmManCIIUTipoRiesgo.ClearControls;
begin
  fraCiiu.Clear;
  fraTipoRiesgo.Clear;
  edAutocotizables.Clear;
end;

function TfrmManCIIUTipoRiesgo.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'cac_actividad';
  Sql.SqlType := stUpdate;
  Sql.Fields.Add('ac_idtiporiesgo', fraTipoRiesgo.Value);
  Sql.Fields.Add('ac_autocotiza',   edAutocotizables.Value);
  Sql.PrimaryKey.Add('ac_id',       sdqConsulta.FieldByName('ac_id').AsInteger, False);

  Result := inherited DoABM;
end;

procedure TfrmManCIIUTipoRiesgo.LoadControls;
begin
  with sdqConsulta do
  begin
    fraCiiu.Value          := FieldByName('ac_id').AsInteger;
    fraTipoRiesgo.Value    := FieldByName('ac_idtiporiesgo').AsInteger;
    edAutocotizables.Value := FieldByName('ac_autocotiza').AsInteger;
  end;
end;

procedure TfrmManCIIUTipoRiesgo.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_id, ac_codigo, ac_descripcion, ac_idtiporiesgo, tr_detalle, ac_autocotiza' +
     ' FROM cac_actividad, afi.atr_tiporiesgociiu' +
    ' WHERE ac_idtiporiesgo = tr_id(+)';

  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text := sSQL + SortDialog.OrderBy;
  inherited;
end;

function TfrmManCIIUTipoRiesgo.Validar: Boolean;
begin
  Verificar(fraTipoRiesgo.IsEmpty, fraTipoRiesgo.edCodigo, 'Debe especificar el Tipo de Riesgo.');
  Result := True;
end;

procedure TfrmManCIIUTipoRiesgo.FormCreate(Sender: TObject);
begin
  inherited;

  LockControl(fraCiiu, True);

  tbImportarTiposRiesgo.Left := tbExportar.Left + 4;
end;

procedure TfrmManCIIUTipoRiesgo.tbImportarTiposRiesgoClick(Sender: TObject);
begin
  ImpoExpoWizard('SUS01');
end;

end.
