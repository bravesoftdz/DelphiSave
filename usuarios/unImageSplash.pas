unit unImageSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomSplash;

type
  TfrmImageSplash = class(TfrmCustomSplash)
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    property Bitmap: Graphics.TBitmap read Background;
  end;

var
  frmImageSplash: TfrmImageSplash;

implementation

{$R *.dfm}

procedure TfrmImageSplash.FormDestroy(Sender: TObject);
begin
  inherited;
  Background.Free;
end;

procedure TfrmImageSplash.FormCreate(Sender: TObject);
begin
  inherited;
  Background := TBitmap.Create;
end;

end.
