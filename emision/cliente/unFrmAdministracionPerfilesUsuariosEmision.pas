unit unFrmAdministracionPerfilesUsuariosEmision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmCustomGridABM1 = class(TfrmCustomGridABM)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustomGridABM1: TfrmCustomGridABM1;

implementation

uses unDmEmision;

{$R *.dfm}

end.
