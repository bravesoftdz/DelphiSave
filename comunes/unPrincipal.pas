unit unPrincipal;

interface

uses
  {$IFDEF VER150} Placemnt, {$ELSE} rxPlacemnt, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, artSeguridad, Login, artDbLogin, ImgList, XPMenu;

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
