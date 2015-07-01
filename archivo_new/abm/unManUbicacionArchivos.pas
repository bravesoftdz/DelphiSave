unit unManUbicacionArchivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unManCtbTablas, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, Mask, PatternEdit, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManUbicacionArchivos = class(TfrmManCtbTablas)
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmManUbicacionArchivos: TfrmManUbicacionArchivos;

implementation

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TfrmManUbicacionArchivos.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'UBIC';
end;
{------------------------------------------------------------------------------}
end.
