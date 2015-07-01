unit unManMotivosExcepcion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosExcepcion = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmManMotivosExcepcion: TfrmManMotivosExcepcion;

implementation

{$R *.DFM}

procedure TfrmManMotivosExcepcion.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'COTEX';
end;

end.
