
{********************************************************}
{                                                        }
{    Pantalla de Bienvenida                              }
{    Sistema de Fax                                      }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

unit unWelcomeSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomSplash, StdCtrls, ExtCtrls;

type
  TfrmWelcomeSplash = class(TfrmCustomSplash)
    lbAppTitle: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
  end;

implementation

{$R *.DFM}

uses
  General;

procedure TfrmWelcomeSplash.FormCreate(Sender: TObject);
begin
  inherited;
  Background := TBitmap.Create;
  Background.LoadFromResourceName(hInstance, 'SPLASH');

  lbAppTitle.Caption := Application.Title + #13#10 + GetAppVersion;
end;

procedure TfrmWelcomeSplash.FormDestroy(Sender: TObject);
begin
  Background.Free;
  inherited;
end;

end.
