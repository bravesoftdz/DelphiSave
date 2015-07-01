unit unManMotivosDebito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unManCtbTablas, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  Mask, PatternEdit, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosDebito = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManMotivosDebito: TfrmManMotivosDebito;

implementation

{$R *.DFM}

procedure TfrmManMotivosDebito.FormCreate(Sender: TObject);
begin
  inherited;
  Clave := 'MODEB';
end;

end.
