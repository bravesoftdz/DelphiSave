unit unEnvioSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, StdCtrls, Mask, ImgList, XPMenu, Placemnt;

type
  TfrmEnvioSMS = class(TfrmCustomForm)
    btnCancelar: TButton;
    btnEnviar: TButton;
    mskTelefono: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edNombre: TEdit;
    Label3: TLabel;
    edDato: TEdit;
    Label4: TLabel;
    edMensaje: TMemo;
    lblRestan: TLabel;
    procedure edMensajeChange(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioSMS: TfrmEnvioSMS;

implementation

uses unSMS, unCustomDataModule;

{$R *.dfm}

procedure TfrmEnvioSMS.edMensajeChange(Sender: TObject);
begin
  inherited;
  lblRestan.Caption := 'Restan ' + IntToStr(160 - Length(edMensaje.Text)) + ' caracteres';
end;

procedure TfrmEnvioSMS.btnEnviarClick(Sender: TObject);
begin
  EnviarSMS(mskTelefono.Text, edMensaje.Text, tmBeginEnd); //, edNombre.Text, edDato.Text, '', '');
  ModalResult := mrOk;
end;

procedure TfrmEnvioSMS.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
