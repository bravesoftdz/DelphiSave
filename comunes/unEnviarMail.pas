unit unEnviarMail;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   19-12-2003
 ULTIMA MODIFICACION: 13-01-2004
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmEnviarMail = class(TForm)
    lbDestinatarios: TListBox;
    lbAdjuntos: TListBox;
    Label3: TLabel;
    edAsunto: TEdit;
    btEnviar: TButton;
    btCancelar: TButton;
    btPara: TButton;
    btAgregarAdjunto: TButton;
    edDestinatario: TEdit;
    btAgregarDestinatario: TButton;
    btQuitarDestinatario: TButton;
    btQuitarAdjunto: TButton;
    Label1: TLabel;
    reTextoCuerpo: TRichEdit;
    OpenDialog: TOpenDialog;
    Bevel1: TBevel;
    Label2: TLabel;
    procedure btEnviarClick(Sender: TObject);
    procedure btAgregarDestinatarioClick(Sender: TObject);
    procedure btQuitarDestinatarioClick(Sender: TObject);
    procedure btQuitarAdjuntoClick(Sender: TObject);
    procedure btAgregarAdjuntoClick(Sender: TObject);
    procedure btParaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
  private
    fAttachs: string;
    fContrato: string;
    function GetBody: string;
    function GetSubject: string;
    procedure SetAttachs(const Value: string);
    procedure SetBody(const Value: string);
    procedure SetSubject(const Value: string);

  public
    property Contrato: string read fContrato  write fContrato;
    property Subject:  string read GetSubject write SetSubject;
    property Attachs:  string read fAttachs   write SetAttachs;
    property Body:     string read GetBody    write SetBody;
  end;

var
  frmEnviarMail: TfrmEnviarMail;
implementation

{$R *.DFM}

uses CustomDlgs, unPrincipal, unSeleccionDestinatarios, ArtMail;

procedure Verificar(Condicion: boolean; AControl: TWinControl; AText: string);
begin
  if Condicion then
  begin
    InvalidMsg(AControl, AText);
    Abort;
  end;
end;

{ TfrmEnviarMailEndoso }

procedure TfrmEnviarMail.btEnviarClick(Sender: TObject);
var
  I: integer;
  Mail: TArtMail;
begin
  Verificar(lbDestinatarios.Items.Count = 0, lbDestinatarios, 'No hay destinatarios para el correo');
  Verificar(edAsunto.Text = '', edAsunto, 'Falta el asunto del correo');
  for I := 0 to lbDestinatarios.Items.Count - 1 do
  begin
    lbDestinatarios.ItemIndex := I;
//    Verificar(not IsEMail(lbDestinatarios.Items[I]), lbDestinatarios, 'El destinatario seleccionado no es una dirección de correo válida');
  end;
  
  Mail := TArtMail.Create;
  try
    for I := 0 to lbAdjuntos.Items.Count - 1 do
      Mail.Attachments.Add(lbAdjuntos.Items[I]);
    Mail.Body.Text := reTextoCuerpo.Text;
    Mail.Subject := edAsunto.Text;
    for I := 0 to lbDestinatarios.Items.Count - 1 do
      Mail.ToAddress.Add(lbDestinatarios.Items[I]);
    try
      Mail.Send;
      MessageDlg('El mail ha sido enviado con éxito.', mtInformation, [mbOK], 0);
      Close;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al envíar e-mail');
    end;
  finally
    Mail.Free;
  end;
end;

procedure TfrmEnviarMail.btAgregarDestinatarioClick(Sender: TObject);
begin
  Verificar(edDestinatario.Text = '', edDestinatario, 'No hay destinatario para agregar a la lista de destinatarios');
//  Verificar(not IsEMail(edDestinatario.Text), edDestinatario, 'El destinatario ingresado no es una dirección de correo válida');
  lbDestinatarios.Items.Add(edDestinatario.Text);
  edDestinatario.Text := '';
end;

procedure TfrmEnviarMail.btQuitarDestinatarioClick(Sender: TObject);
begin
  Verificar(lbDestinatarios.ItemIndex = -1, lbDestinatarios, 'No hay destinatario seleccionado');
  lbDestinatarios.Items.Delete(lbDestinatarios.ItemIndex);
end;

procedure TfrmEnviarMail.btQuitarAdjuntoClick(Sender: TObject);
begin
  Verificar(lbAdjuntos.ItemIndex = -1, lbAdjuntos, 'No hay adjunto seleccionado');
  lbAdjuntos.Items.Delete(lbAdjuntos.ItemIndex);
end;

procedure TfrmEnviarMail.btAgregarAdjuntoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    lbAdjuntos.Items.Add(OpenDialog.FileName);
end;

procedure TfrmEnviarMail.btParaClick(Sender: TObject);
var
  I: integer;
begin
  if FContrato <> '' then
  begin
    with TfrmSeleccionDestinatarios.Create(Self) do
    try
      Contrato := StrToInt(Self.FContrato);
      if ShowModal <> mrOk then
        Abort;

      for I := 0 to ListaDestinatarios.Count - 1 do
        lbDestinatarios.Items.Add(ListaDestinatarios[I]);
    finally
      //Free;
    end;
  end;  
end;

function TfrmEnviarMail.GetBody: string;
begin
  result := reTextoCuerpo.Text;
end;

function TfrmEnviarMail.GetSubject: string;
begin
  result := edAsunto.Text;
end;

procedure TfrmEnviarMail.SetAttachs(const Value: string);
begin
  fAttachs := Value;
  lbAdjuntos.Items.CommaText := Value;
//  lbAdjuntos.Items.Add(Attachs[I]);
end;

procedure TfrmEnviarMail.SetBody(const Value: string);
begin
  reTextoCuerpo.Text := Value;
end;

procedure TfrmEnviarMail.SetSubject(const Value: string);
begin
  edAsunto.Text := Value;
end;

procedure TfrmEnviarMail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmEnviarMail := nil;
  inherited;
end;

procedure TfrmEnviarMail.btCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
