unit unPreviewCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomDlgRichEdit, ExtCtrls, StdCtrls,
  RxRichEd, unFraToolbarRTF, SDEngine, Db;

type
  TfrmPreviewCarta = class(TfrmCustomDlgRichEdit)
    btnImprimir: TButton;
    Bevel1: TBevel;
    sdqDatos: TSDQuery;
    sduDatos: TSDUpdateSQL;
    procedure btnAceptarClick(Sender: TObject);
  private
  public
  end;


implementation

uses
	unPrincipal;

{$R *.DFM}

procedure TfrmPreviewCarta.btnAceptarClick(Sender: TObject);
begin
  try
//    edTexto.Modified := False;
  except
  end;
end;

end.
