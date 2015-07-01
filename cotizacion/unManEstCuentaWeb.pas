unit unManEstCuentaWeb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion,
  unFraEntidades, Mask, ToolEdit, DateComboBox, Provider, DBClient, unArtDBAwareFrame, PatternEdit, IntEdit;

type
  TfrmManEstCuentaWeb = class(TfrmCustomGridABM)
    fraEntidadesWeb: TfraEntidades;
    Label1: TLabel;
    Label2: TLabel;
    edFProximoProceso: TDateComboBox;
    spConsulta: TSDStoredProc;
    sdqConsulta1: TClientDataSet;
    dspConsulta: TDataSetProvider;
    Label3: TLabel;
    edPeriodicidad: TIntEdit;
    procedure FormCreate(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure LoadControls; override;
  public
  end;

var
  frmManEstCuentaWeb: TfrmManEstCuentaWeb;

implementation

{$R *.DFM}

uses
  VCLExtra, unDmPrincipal, SqlFuncs;

function TfrmManEstCuentaWeb.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'xen_entidad';

  if ModoABM = maModificacion then
  begin
    Sql.SqlType := stUpdate;

    Sql.PrimaryKey.Add('en_id',              sdqConsulta.Fields.FieldByName('en_id').AsInteger, False);
    Sql.Fields.Add('en_fproxproceso',        edFProximoProceso.SqlText, False);
    Sql.Fields.Add('en_periodicidadproceso', edPeriodicidad.Value);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManEstCuentaWeb.FormCreate(Sender: TObject);
begin
  inherited;

  sdqConsulta.Free;

  with sdqConsulta1 do
    Name := 'sdqConsulta';
  dsConsulta.DataSet := TDataSet(FindComponent('sdqConsulta'));

  fraEntidadesWeb.ShowBajas := True;

  VCLExtra.LockControl(fraEntidadesWeb);
end;

procedure TfrmManEstCuentaWeb.LoadControls;
begin
  with sdqConsulta do
  begin
    fraEntidadesWeb.Value  := Fields.FieldByName('en_id').AsInteger;
    edFProximoProceso.Date := Fields.FieldByName('en_fproxproceso').AsDateTime;
    edPeriodicidad.Value   := Fields.FieldByName('en_periodicidadproceso').AsInteger;
  end;
end;

function TfrmManEstCuentaWeb.Validar: Boolean;
begin
  Result := True;
end;

end.
