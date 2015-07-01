unit unABMAnalisis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unMoldeAbmAnalisis, Menus, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, ShortCutControl, DB, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, unfraPrestadorAMP,
  unfraCtbTablas, unFraTipoEstudio, StdCtrls, Mask, ToolEdit, DateComboBox,
  unFraCodigoDescripcion, unFraEstudio, unArtDBAwareFrame, unArtDbFrame,
  unfraEstablecimiento_OLD, unArtFrame, unfraOperativo, Buttons, ExtCtrls,
  ComCtrls, ToolWin, unFraEmpresa, unFraTrabajador, unFraTrabajadorAMP,
  ImgList;

type
  TfrmAbmAnalisis = class(TfrmMoldeAbmAnalisis)
    fraEmpresaHijo: TfraEmpresa;
    fraTrabajadorHijo: TfraTrabajadorAMP;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbmAnalisis: TfrmAbmAnalisis;

implementation

{$R *.dfm}

procedure TfrmAbmAnalisis.FormCreate(Sender: TObject);
begin
  fraEmpresa := fraEmpresaHijo;
  fraTrabajador := fraTrabajadorHijo;
//  fraEmpresa.ShowMessages := False;
  inherited;
end;

end.
