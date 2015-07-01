unit unManCtbMotivosAnulacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unManCtbTablas, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  Mask, PatternEdit, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManCtbMotivosAnulacion = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManCtbMotivosAnulacion: TfrmManCtbMotivosAnulacion;

implementation

{$R *.DFM}

procedure TfrmManCtbMotivosAnulacion.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'MOTAN';
end;

end.
