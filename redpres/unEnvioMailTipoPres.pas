unit unEnvioMailTipoPres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  ExtCtrls;

type
  TfrmEnvioMailTipoPres = class(TForm)
    gbTipoPrestador: TGroupBox;
    fraTipoPres: TfraCodigoDescripcion;
    gbAsunto: TGroupBox;
    edAsunto: TEdit;
    odAdjunto: TOpenDialog;
    gbArchivo: TGroupBox;
    btnExaminar: TButton;
    edArchivo: TEdit;
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnExaminarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioMailTipoPres: TfrmEnvioMailTipoPres;

implementation

uses unDmPrincipal, CustomDlgs, unMoldeEnvioMail, DB, unPrincipal,
  StrUtils;

{$R *.dfm}

procedure TfrmEnvioMailTipoPres.FormCreate(Sender: TObject);
begin
  with fraTipoPres do
  begin
    TableName := 'MTP_TIPOPRESTADOR';
    FieldID := 'TP_CODIGO';
    FieldCodigo := 'TP_CODIGO';
    FieldDesc := 'TP_DESCRIPCION';
    FieldBaja := 'TP_FBAJA';
    ShowBajas := false;
  end;
end;

procedure TfrmEnvioMailTipoPres.btnExaminarClick(Sender: TObject);
begin
  if odAdjunto.Execute then
    edArchivo.Text := odAdjunto.FileName
  else
    edArchivo.Clear;
end;

procedure TfrmEnvioMailTipoPres.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmEnvioMailTipoPres.btnAceptarClick(Sender: TObject);
var ssql, sDestinatarios: string;
    Adjuntos: TArrayOfAttach; iLongDestinatarios: integer;
begin
  //enviado := true;
  sDestinatarios := '';
  //iLongDestinatarios := 0;
  Verificar(fraTipoPres.IsEmpty, fraTipoPres, 'Debe seleccionar un tipo de prestador');
  Verificar(edArchivo.Text = '', edArchivo, 'Debe seleccionar un archivo para enviar');

  if (edAsunto.Text <> '') or ((edAsunto.Text = '') and (msgbox('Desea enviar el mail sin asunto?', MB_YESNO + MB_ICONQUESTION) = mrYes)) then
  begin

    ssql := ' SELECT distinct ca_direlectronica ' +
              ' FROM cpr_prestador ' +
             ' WHERE ca_especialidad = :tipopres ' +
               ' AND ca_fechabaja IS NULL AND ca_direlectronica IS NOT NULL ';

    SetLength(Adjuntos, 1);
    Adjuntos[0] := GetAttach(edArchivo.Text, 0);

    with GetQueryEx(ssql, [fraTipoPres.Codigo]) do
    begin
      First;
      try
        BeginTrans;
        while not Eof do
        begin
          sDestinatarios := sDestinatarios + ',' + fieldbyname('ca_direlectronica').AsString;
          Next;
          iLongDestinatarios := length(sDestinatarios);
          if iLongDestinatarios > 470 then    // limitado por el lbDestinatarios.Items.CommaText del unMoldeEnvioMail
          begin
            sDestinatarios := MidStr(sDestinatarios, 2, length(sDestinatarios));
            unMoldeEnvioMail.EnviarMailBD(sDestinatarios, edAsunto.Text,
                             [oShowDialogIfEmpty],
                             'Se adjunta archivo correspondiente.' + #13 + #13 + 'Provincia ART',
                             Adjuntos, 0, tcDefault, False, False, 2500, -1, [], 'Liquidaciones - Provincia ART',
                             false, '', '', -1, 3);

            sDestinatarios := '';
            //iLongDestinatarios := 0;
          end;
        end;

        if sDestinatarios <> '' then
        begin
          sDestinatarios := MidStr(sDestinatarios, 2, length(sDestinatarios));
          unMoldeEnvioMail.EnviarMailBD(sDestinatarios, edAsunto.Text,
                               [oShowDialogIfEmpty],
                               'Se adjunta archivo correspondiente.' + #13 + #13 + 'Provincia ART',
                               Adjuntos, 0, tcDefault, False, False, 2500, -1, [], 'Liquidaciones - Provincia ART',
                               false, '', '', -1, 3);
        end;
        CommitTrans;
        msgbox('Envío correcto');
      except
        on e:exception do
        begin
          Rollback;
          msgbox('Error en el envío: ' + e.Message);
        end;
      end;
    end;

    {with GetQueryEx(ssql, [fraTipoPres.Codigo]) do
    begin
      First;
      try
        BeginTrans;
        while not Eof do
        begin
          unMoldeEnvioMail.EnviarMailBD(fieldbyname('ca_direlectronica').AsString, edAsunto.Text,
                                       [oShowDialogIfEmpty],
                                       'Se adjunta archivo correspondiente.' + #13 + #13 + 'Provincia ART',
                                       Adjuntos, 0, tcDefault, False, False, 2500, -1, [], 'Liquidaciones - Provincia ART',
                                       false, '', '', -1, 3);
          Next;
        end;

        CommitTrans;
        msgbox('Envío correcto');
      except
        on e:exception do
        begin
          Rollback;
          msgbox('Error en el envío: ' + e.Message);
        end;
      end;
    end;}
    close;
  end;

end;

procedure TfrmEnvioMailTipoPres.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.mnuEnvioMailTipoPres.Enabled := True;
  Action := caFree;
end;

end.
