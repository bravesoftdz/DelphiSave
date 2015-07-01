unit unManCAT_AREATEXTO_EMI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unManCAT_AREATEXTO, LookupDialog, SDEngine, mwHighlighter,
  mwSqlSyn, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, mwCustomEdit,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, StdCtrls, ComCtrls, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin;

type
  TfrmManCAT_AREATEXTO_EMI = class(TfrmManCAT_AREATEXTO)
    tsParametrosManuales: TTabSheet;
    btnAplicar: TButton;
    procedure btnAplicarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
  protected
  public
  end;

var
  frmManCAT_AREATEXTO_EMI: TfrmManCAT_AREATEXTO_EMI;

implementation

uses
  unCustomGridABM, unCustomConsulta;

{$R *.dfm}


procedure TfrmManCAT_AREATEXTO_EMI.btnAplicarClick(Sender: TObject);
begin
(*
	if Validar and DoABM then
  begin
    ModoABM := maModificacion;
    ModoABMToSqlType;
    LockControl(FfrmManParametrosManualesCarta.ToolBar, false);
    if AutoLock then
    	LockControls(True);
    fpABM.Caption := CAPTION_MODIFIC;
  end;
*)  
end;

procedure TfrmManCAT_AREATEXTO_EMI.fpAbmShow(Sender: TObject);
begin
  inherited;
(*
  if (ModoABM = maAlta) then
    LockControl(FfrmManParametrosManualesCarta.ToolBar, true)
  else
    LockControl(FfrmManParametrosManualesCarta.ToolBar, false);
*)
end;

end.
