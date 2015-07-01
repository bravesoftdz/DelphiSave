unit unPreventorAprobo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmPreventorAprobo = class(TfrmCustomGridABM)
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmPreventorAprobo: TfrmPreventorAprobo;

implementation

{$R *.dfm}

{ TfrmPreventorAprobo }

procedure TfrmPreventorAprobo.ClearControls;
begin
  //
end;

function TfrmPreventorAprobo.DoABM: Boolean;
begin
  result := true;
  //
end;

procedure TfrmPreventorAprobo.LoadControls;
begin
  tbRefrescarClick(nil);
end;

function TfrmPreventorAprobo.Validar: Boolean;
begin
  result := true;
  //
end;

end.
