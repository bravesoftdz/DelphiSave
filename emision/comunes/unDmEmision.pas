unit unDmEmision;

interface

uses
  SysUtils, Classes, ImgList, Controls, DB, SDEngine, Dialogs, Login,
  artDbLogin;

type
  TDmEmision = class(TDataModule)
    ilSingleImages: TImageList;
    ilColor: TImageList;
    ilByN: TImageList;
    sdqPresentaciones: TSDQuery;
    DBLogin: TDBLogin;
  private
    { Private declarations }
  public
    { Public declarations }
  end;




var
  DmEmision: TDmEmision;



implementation

{$R *.dfm}


{ TDmEmision }



end.
