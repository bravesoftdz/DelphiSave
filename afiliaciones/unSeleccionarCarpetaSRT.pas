unit unSeleccionarCarpetaSRT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, FolderDialog;

type
  TfrmSeleccionarCarpetaSRT = class(TForm)
    Label1: TLabel;
    edCarpetaDestino: TEdit;
    chkEnviarSrt: TCheckBox;
    fraCategoria: TfraCodigoDescripcionExt;
    fraTipoComunicacion: TfraCodigoDescripcionExt;
    txtComunicacion: TMemo;
    btnAceptar3: TButton;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSeleccionarCarpeta: TButton;
    folderDialog: TFolderDialog;
    Bevel2: TBevel;
    procedure btnAceptar3Click(Sender: TObject);
    procedure btnSeleccionarCarpetaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraCategoriaExit(Sender: TObject);
  private
    FIdsSector: String;
    function GetCarpetaDestino: String;
    function GetComunicacion: String;
    function GetEnviarSrt: boolean;
    function GetTipoComunicacion: integer;
    procedure SetCarpetaDestino(const Value: String);
    procedure SetIdsSector(const Value: String);
  public
    property CarpetaDestino     : String       read GetCarpetaDestino       write SetCarpetaDestino;
    property EnviarSRT          : boolean      read GetEnviarSrt;
    property TipoComunicacion   : integer      read GetTipoComunicacion;
    property Comunicacion       : String       read GetComunicacion;
    property IdsSector          : String       read FIdsSector              write SetIdsSector;
  end;

var
  frmSeleccionarCarpetaSRT: TfrmSeleccionarCarpetaSRT;

implementation

uses
  CustomDlgs, StrFuncs, unArt;

{$R *.dfm}

procedure TfrmSeleccionarCarpetaSRT.btnAceptar3Click(Sender: TObject);
begin
  if chkEnviarSRT.Checked then
  begin
    Verificar(IsEmptyString(txtComunicacion.Lines.Text), txtComunicacion, 'Es necesario escribir un texto de comunicacion a la SRT.');
    Verificar(fraTipoComunicacion.IsEmpty, fraTipoComunicacion, 'Es necesario seleccionar un tipo de comunicacón.');
    {$IFDEF AFILIACIONES}
    Verificar(edCarpetaDestino.Text = '' , edCarpetaDestino, 'Es necesario elegir una carpeta para el guardado de los archivos PDF');
    {$ENDIF}
  end;

  ModalResult := mrOk;
end;

procedure TfrmSeleccionarCarpetaSRT.btnSeleccionarCarpetaClick(Sender: TObject);
begin
  if folderDialog.Execute then
    edCarpetaDestino.Text := folderDialog.Directory;
end;

procedure TfrmSeleccionarCarpetaSRT.FormCreate(Sender: TObject);
begin
  inherited;
  chkEnviarSrt.Checked := False;
  fraCategoria.Clear;
  fraTipoComunicacion.Clear;
  fraTipoComunicacion.Enabled := False;
  txtComunicacion.Clear;

  with fraCategoria do
  begin
    TableName   := 'SRT.SES_ESERVICIOSSECTOR';
    FieldID     := 'ES_ID';
    FieldCodigo := 'ES_ID';
    FieldDesc   := 'ES_NOMBRE';
    ShowBajas   := False;
  end;

  with fraTipoComunicacion do
  begin
    TableName      := 'SRT.SET_ESERVICIOSTIPOS';
    FieldID        := 'ET_ID';
    FieldCodigo    := 'ET_ID';
    FieldDesc      := 'ET_NOMBRE';
    ShowBajas      := False;
    ExtraCondition := ' AND 1 = 2';;
  end;

  FIdsSector := '';
end;

procedure TfrmSeleccionarCarpetaSRT.fraCategoriaExit(Sender: TObject);
begin
  inherited;

  fraCategoria.FrameExit(Sender);
  fraTipoComunicacion.Clear;

  if fraCategoria.IsEmpty then
    fraTipoComunicacion.Enabled := False
  else
  begin
    with fraTipoComunicacion do
    begin
      ExtraCondition := ' AND ET_IDTIPOACTOR = 2 AND ET_IDCATEGORIA = ' + fraCategoria.Codigo;
      Enabled := True;
    end;
  end;
end;

function TfrmSeleccionarCarpetaSRT.GetCarpetaDestino: String;
begin
  Result := edCarpetaDestino.Text;
end;

function TfrmSeleccionarCarpetaSRT.GetComunicacion: String;
begin
  Result := Trim(txtComunicacion.Text);
end;

function TfrmSeleccionarCarpetaSRT.GetEnviarSrt: boolean;
begin
  Result := chkEnviarSrt.Checked;
end;

function TfrmSeleccionarCarpetaSRT.GetTipoComunicacion: integer;
begin
  {$IFDEF RED_PRES}
  Result := StrToIntDef(fraTipoComunicacion.Codigo, ART_EMPTY_ID);
  {$ELSE}
  Result := fraTipoComunicacion.Value;
  {$ENDIF}
end;

procedure TfrmSeleccionarCarpetaSRT.SetCarpetaDestino(const Value: String);
begin
  edCarpetaDestino.Text := Value;
end;

procedure TfrmSeleccionarCarpetaSRT.SetIdsSector(const Value: String);
begin
  if FIdsSector <> Value then
    begin
      FIdsSector := Value;

      with fraCategoria do
        begin
          ExtraCondition := ' AND ES_ID IN (' + FIdsSector + ') ';

          if InStr(FIdsSector, ',') = 0 then
            begin
              {$IFDEF RED_PRES}
              Codigo := FIdsSector;
              {$ELSE}
              Value := StrToIntDef(FIdsSector, ART_EMPTY_ID);
              {$ENDIF}
              fraCategoriaExit(Nil);
            end;
        end;
    end;
end;

end.

