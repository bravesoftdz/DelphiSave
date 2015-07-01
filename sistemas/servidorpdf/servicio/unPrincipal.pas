unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, artSeguridad, Login, artDbLogin, ImgList, XPMenu,
  Placemnt;

type
  TfrmPrincipal = class(TfrmCustomForm)
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses unDmPrincipal;

{$R *.dfm}

end.
