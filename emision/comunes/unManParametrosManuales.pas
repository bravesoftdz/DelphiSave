unit unManParametrosManuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManParametrosManuales = class(TfrmCustomGridABM)
    Label1: TLabel;
    edNombre: TEdit;
    chkObligatorio: TCheckBox;
    Label2: TLabel;
    edValorDefecto: TEdit;
  private
  protected
  public
  end;

var
  frmManParametrosManuales: TfrmManParametrosManuales;

implementation


{$R *.dfm}

{ TfrmManParametrosManuales }

begin

end.
