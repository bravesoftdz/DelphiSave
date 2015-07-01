unit unManCtbUbicGeograficas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unManCtbTablasAMP, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  PatternEdit, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManCtbUbicGeograficas = class(TfrmManCtbTablasAMP)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCtbUbicGeograficas.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'UBICG';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
