unit unManMotivosRechValores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, PatternEdit, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask;

type
  TfrmManMotivosRechValores = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmManMotivosRechValores: TfrmManMotivosRechValores;

implementation

uses
  unPrincipal;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManMotivosRechValores }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosRechValores.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'MRECH';
  tbModificar.Visible := False;
end;

procedure TfrmManMotivosRechValores.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Fields.Clear;

  inherited;
end;

procedure TfrmManMotivosRechValores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmManMotivosRechValores := nil;
end;

end.
