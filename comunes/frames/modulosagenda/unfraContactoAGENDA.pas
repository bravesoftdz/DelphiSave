unit unfraContactoAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unfraContacto, unFraTelefono,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, PatternEdit, StdCtrls,
  ComCtrls, ToolWin, DB, SDEngine, unART, unAgenda, ExtCtrls;

type
  TfraContactoAGENDA = class(TfraContacto, IModuloAgenda)
    lbFraContacto: TLabel;
    tbBuscarResponsableExistente: TToolButton;
    tbContacto: TToolButton;
    tbResposablesHys: TToolButton;
    ToolBarContacto: TToolBar;
    TiempoHint: TTimer;
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure tbBuscarResponsableExistenteClick(Sender: TObject);
    procedure tbContactoClick(Sender: TObject);
    procedure tbResposablesHysClick(Sender: TObject);
    procedure TiempoHintTimer(Sender: TObject);
 private
    FIsRequired: Boolean;

    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;

    procedure SetIsRequired(const Value: Boolean);
 protected
    function GetValue: TTableId; override;

    procedure SetValue(const Value: TTableId); override;
 public
    function Validate: Boolean;

    procedure Clear; override;
    procedure ClearContacto;

    property  ParamName: String read GetParamName;
  end;

{
var
  fraContactoAGENDA: TfraContactoAGENDA;
}
implementation

uses
  CustomDlgs,unContratoContacto, unDmPrincipal, AnsiSql, unRtti, unSeleccionResponsableHYS;

{$R *.dfm}

procedure TfraContactoAGENDA.tbBuscarResponsableExistenteClick(Sender: TObject);
var
  iIdContacto: Integer;
  sSql: String;
begin
  TiempoHint.Enabled := False;
  Verificar(Empresa <= 0, Self, 'Debe seleccionar una empresa.');
  sSql :=
    'SELECT ct_id' +
     ' FROM act_contacto, aco_contrato' +
    ' WHERE ct_cargo = :cargo' +
      ' AND co_contrato = :contrato' +
      ' AND ct_idempresa = co_idempresa' +
      ' AND ct_fechabaja IS NULL';
  iIdContacto := ValorSqlIntegerEx(sSql, ['01090', Contrato]);

  if iIdContacto = 0 then
    ClearContacto
  else
    ContactoID := iIdContacto;

  Modified := True;
end;

procedure TfraContactoAGENDA.tbContactoClick(Sender: TObject);
begin
  TiempoHint.Enabled := False;
  
  Verificar(Empresa <= 0, Self, 'Debe seleccionar una empresa.');

  with TfrmContratoContacto.Create(Self) do
  try
    AutoCommit := False;
    DoCargarDatos(Contrato, Empresa);
    VerSeleccion;
    if ShowModal = mrOk then
      Self.ContactoID := IdContacto;
  finally
    Free;
  end;

  if ContactoID = 0 then
    Self.ClearContacto
  else
    Value := ContactoID;
end;

procedure TfraContactoAGENDA.tbResposablesHysClick(Sender: TObject);
begin
  TiempoHint.Enabled := False;
  Verificar(Empresa <= 0, Self, 'Debe seleccionar una empresa.');

  with TfrmSeleccionResponsableHYS.Create(Self) do
  begin
    FContrato := IntToStr(Contrato);
    Visible := False;
    if ShowModal = mrOk then
      if FCodigo <> '' then
        ContactoID := StrToInt(FCodigo);
  end;
end;

function TfraContactoAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraContactoAGENDA.GetParamName: String;
begin
  Result := 'IDCONTACTO';
end;

function TfraContactoAGENDA.GetVisible: Boolean;
begin
  Result := Self.Visible;
end;

procedure TfraContactoAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbFraContacto.Caption := 'Contacto de la empresa (*)'
  else
    lbFraContacto.Caption := 'Contacto de la empresa';
end;

function TfraContactoAGENDA.GetValue: TTableId;
begin
  Result := ContactoID;
end;

procedure TfraContactoAGENDA.SetValue(const Value: TTableId);
begin
  ContactoID := Value;
end;

procedure TfraContactoAGENDA.Clear;
begin
  inherited;
end;

procedure TfraContactoAGENDA.ClearContacto;
begin
  {No llamo al Clear para no perder los datos del filtro...}
  edContacto.Clear;
  fraCargo.Clear;
  fraArea.Clear;
  fraTelefonos.Clear(True);
  edAreaFax.Clear;
  edFax.Clear;
  edeMail.Clear;
  ContactoID := ART_EMPTY_ID;
end;

procedure TfraContactoAGENDA.FrameEnter(Sender: TObject);
begin
  inherited;
  if tbContacto.Enabled then
    TiempoHint.Enabled := True;
end;

procedure TfraContactoAGENDA.FrameExit(Sender: TObject);
begin
  inherited;
  TiempoHint.Enabled := False;
end;

procedure TfraContactoAGENDA.TiempoHintTimer(Sender: TObject);
begin
  TiempoHint.Enabled := False;
  if tbContacto.Enabled and IsEmpty then
    InfoHint(tbContacto, 'Utilice este botón para seleccionar un contacto de la empresa.');
end;

function TfraContactoAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, tbContacto, 'Debe seleccionar un contacto de la empresa.');
  Result := True;
end;

end.
