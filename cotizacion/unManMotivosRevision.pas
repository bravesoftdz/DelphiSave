unit unManMotivosRevision;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosRevision = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmManMotivosRevision: TfrmManMotivosRevision;

implementation

{$R *.DFM}

procedure TfrmManMotivosRevision.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'COTRE';
end;

end.
