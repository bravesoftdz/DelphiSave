unit unManErroresUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unManCtbTablas, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, Mask, PatternEdit, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManErroresUsuarios = class(TfrmManCtbTablas)
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
  end;

var
  frmManErroresUsuarios: TfrmManErroresUsuarios;

implementation

{$R *.dfm}

procedure TfrmManErroresUsuarios.FormCreate(Sender: TObject);
begin
  inherited;

  EspecialVisible := True;
  EspecialCaption := 'Modo de Resolución';
  Clave           := 'EUAGA';
end;

procedure TfrmManErroresUsuarios.FSFormShow(Sender: TObject);
begin
  inherited;
  Grid.ColumnByField['tb_especial1'].Visible := True;
end;

end.
 