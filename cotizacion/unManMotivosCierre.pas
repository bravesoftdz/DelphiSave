unit unManMotivosCierre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosCierre = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
  protected
  public
  end;

var
  frmManMotivosCierre: TfrmManMotivosCierre;

implementation

{$R *.DFM}

procedure TfrmManMotivosCierre.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'COTBA';
end;

end.
