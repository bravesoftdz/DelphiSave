unit unFraTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, AdvToolBar, AdvToolBarStylers;

type
  TfraTitulo = class(TFrame)
    AdvToolBarPager: TAdvToolBarPager;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
