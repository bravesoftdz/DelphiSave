unit unManMotivosCancelacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosCancelacion = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
  protected
  public
  end;

var
  frmManMotivosCancelacion: TfrmManMotivosCancelacion;

implementation

{$R *.DFM}

procedure TfrmManMotivosCancelacion.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'COTMC';
end;

end.
