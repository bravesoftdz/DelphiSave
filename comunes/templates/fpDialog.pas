unit fpDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FormPanel;

type
  TForm1 = class(TForm)
    fpDialog: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnAceptarClick(Sender: TObject);
begin
     if False Then
        InvalidMsg( nil, '' )
     else
        fpDialog.ModalResult := mrOk; 
end;

end.
