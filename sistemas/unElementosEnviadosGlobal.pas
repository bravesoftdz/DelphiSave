unit unElementosEnviadosGlobal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unElementosEnviados, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, RxRichEd, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox, unArtFrame,
  unfraUsuarios, ExtCtrls, JvExExtCtrls, JvSplitter, unFraCodigoDescripcion,
  unArtDBAwareFrame, ImgList, OleCtrls, SHDocVw, JvNavigationPane,
  PatternEdit, IntEdit, CheckLst, ARTCheckListBox;

type
  TfrmElementosEnviadosGlobal = class(TfrmElementosEnviados)
    fraEE_IDORIGENGENERACION: TfraCodigoDescripcion;
    Label6: TLabel;
    clbEE_TIPOCUERPO: TARTCheckListBox;
    edEE_CUERPO_FULL_LIKE: TEdit;
    Label7: TLabel;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmElementosEnviadosGlobal: TfrmElementosEnviadosGlobal;

implementation

uses
  AnsiSQL, unDmPrincipal, unFiltros, unSesion, CustomDlgs;

{$R *.dfm}

procedure TfrmElementosEnviadosGlobal.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEE_IDORIGENGENERACION.Clear;
  edEE_CUERPO_FULL_LIKE.Clear;
  clbEE_TIPOCUERPO.ClearChecks;
end;

procedure TfrmElementosEnviadosGlobal.FormCreate(Sender: TObject);
begin
  inherited;
  with fraEE_IDORIGENGENERACION do
  begin
    TableName   := 'COMUNES.CEJ_EJECUTABLE';
    FieldID     := 'EJ_ID';
    FieldCodigo := 'EJ_ID';
    FieldDesc   := 'EJ_DESCRIPCION';
    FieldBaja   := 'EJ_FECHABAJA';
    ShowBajas   := True;
  end;
  edEE_MOTIVO_LIKE.Anchors := [akLeft, akTop];
end;

end.
