unit unManMotivosAnulacionRecibos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, PatternEdit, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask;

type
  TfrmManMotivosAnulacionRecibos = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;
var
  frmManMotivosAnulacionRecibos: TfrmManMotivosAnulacionRecibos;

implementation

uses
  unPrincipal;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManCtbTablas1 }
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmManMotivosAnulacionRecibos.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'RBAJA';

  tbModificar.Visible := False;
end;

procedure TfrmManMotivosAnulacionRecibos.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Fields.Clear;

  inherited;
end;

procedure TfrmManMotivosAnulacionRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmManMotivosAnulacionRecibos := nil;
end;

end.
