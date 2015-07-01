unit unPermisosControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Placemnt, artSeguridad, ImgList, ComCtrls;

type
  TfrmPermisosControl = class(TForm)
    tvPermisos: TTreeView;
    ImageList: TImageList;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
  private
  public
  end;

var
  frmPermisosControl: TfrmPermisosControl;

implementation

{$R *.DFM}

end.
