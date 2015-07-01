unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unImpresionEstadoDeCuenta, StdCtrls, Mask, ToolEdit, DateComboBox,
  PeriodoPicker, Login, artDbLogin, ImgList, ExtCtrls, artSeguridad;

type
  TfrmPrincipal = class(TfrmImpresionEstadodeCuenta)
    DBLogin: TDBLogin;
    ilColor: TImageList;
    ilByN: TImageList;
    pnlAbajo: TPanel;
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses unDmPrincipal;

{$R *.DFM}

end.

