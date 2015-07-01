unit unCustomDlgRichEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxRichEd, unFraToolbarRTF;

type
  TfrmCustomDlgRichEdit = class(TForm)
    edTexto: TRxRichEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraToolbarRTF: TfraToolbarRTF;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

implementation

{$R *.DFM}

procedure TfrmCustomDlgRichEdit.FormCreate(Sender: TObject);
begin
  fraToolBarRTF.Edit := edTexto;

  Width  := Trunc(Screen.Width  * 0.9);
  Height := Trunc(Screen.Height * 0.9);
end;

end.
