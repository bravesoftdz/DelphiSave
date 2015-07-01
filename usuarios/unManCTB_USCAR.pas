unit unManCTB_USCAR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unManCtbTablas, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, Mask, PatternEdit, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManCTB_USCAR = class(TfrmManCtbTablas)
   procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManCTB_USCAR: TfrmManCTB_USCAR;

implementation

{$R *.dfm}

procedure TfrmManCTB_USCAR.FormCreate(Sender: TObject);
begin
  inherited;
  Clave := 'USCAR';
end;

end.
