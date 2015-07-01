unit unfraContactoAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unfraContacto, unFraTelefono, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, PatternEdit,
  StdCtrls, ComCtrls, ToolWin, DB, SDEngine, unART;

type
  TfraContactoAgenda = class(TfraContacto)
    ToolBarContacto: TToolBar;
    tbContacto: TToolButton;
    lbFraContacto: TLabel;
    tbBuscarResponsableExistente: TToolButton;
    tbResposablesHys: TToolButton;
    procedure tbContactoClick(Sender: TObject);
    procedure tbBuscarResponsableExistenteClick(Sender: TObject);
    procedure tbResposablesHysClick(Sender: TObject);
  protected
    procedure SetValue(const Value: TTableId); override;
    function GetValue: TTableId; override;
  public
    procedure Clear; override;
    procedure ClearContacto;    
  end;

var
  fraContactoAgenda: TfraContactoAgenda;

implementation

uses
  CustomDlgs,unContratoContacto, unDmPrincipal, AnsiSql, unRtti,
  unSeleccionResponsableHYS;

{$R *.dfm}

procedure TfraContactoAgenda.tbContactoClick(Sender: TObject);
begin
  Verificar(Empresa <= 0, Self, 'Debe seleccionar una empresa.');
  with TfrmContratoContacto.Create(Self) do
  try
    AutoCommit := false;
    DoCargarDatos(Contrato, empresa);
    VerSeleccion;
    ShowModal;
    ContactoID := IdContacto;
  finally
    Free;
  end;

  if ContactoID = 0 then
    Self.ClearContacto
  else
    Value := ContactoID;
end;

procedure TfraContactoAgenda.Clear;
begin
  inherited;
end;

procedure TfraContactoAgenda.SetValue(const Value: TTableId);
begin
  ContactoID := Value;
end;

function TfraContactoAgenda.GetValue: TTableId;
begin
  Result := ContactoID;
end;

procedure TfraContactoAgenda.tbBuscarResponsableExistenteClick(Sender: TObject);
var
  idContacto: Integer;
  sSQL: String;
begin
  Verificar(Empresa <= 0, Self, 'Debe seleccionar una empresa.');
  sSQL := 'SELECT ct_id ' +
            'FROM act_contacto, aco_contrato ' +
           'WHERE ct_cargo = :cargo ' +
             'AND co_contrato = :contrato ' +
             'AND ct_idempresa = co_idempresa ' +
             'AND ct_fechabaja IS NULL';

  idContacto := ValorSqlIntegerEx(sSQL, ['01090', Contrato]);

  if idContacto = 0 then
    ClearContacto
  else
    ContactoID := idContacto;

  Modified := True;
end;

procedure TfraContactoAgenda.tbResposablesHysClick(Sender: TObject);
begin
  Verificar(Empresa <= 0, Self, 'Debe seleccionar una empresa.');
  with TfrmSeleccionResponsableHYS.Create(Self) do
  begin
    FContrato := IntToStr(Contrato);
    Visible := False;
    ShowModal;
    if FCodigo <> '' then
      ContactoID := StrToInt(FCodigo);
  end;
end;

procedure TfraContactoAgenda.ClearContacto;
begin
  inherited Clear;
end;

end.
