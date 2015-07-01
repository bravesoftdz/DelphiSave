unit unManCtbMotivosRechazo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unManCtbTablas, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  Mask, PatternEdit, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManCtbMotivosRechazo = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManCtbMotivosRechazo: TfrmManCtbMotivosRechazo;

implementation

{$R *.DFM}

procedure TfrmManCtbMotivosRechazo.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'MOTR';
end;

end.
