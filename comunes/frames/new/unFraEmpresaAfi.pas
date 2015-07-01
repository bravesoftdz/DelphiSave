unit unFraEmpresaAfi;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF} Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs,  unFraEmpresa, Db, SDEngine, ArtComboBox, IntEdit, StdCtrls, Mask, PatternEdit, unART, ExtCtrls;

type
  TfraEmpresaAfi = class(TfraEmpresa)
    lbFormulario: TLabel;
    edFormulario: TPatternEdit;
    procedure edFormularioKeyPress(Sender: TObject; var Key: Char);
  private
    FFieldFormulario: String;
  protected
    function CancelExitLoad: Boolean; override;
    function ClearOnExit: Boolean; override;
    function GetSql: String; override;

    procedure Internal_SetFormulario(aFormulario: String; aDoChanges: Boolean = False);
    procedure SetEditorsValues; override;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Clear; override;
  published
    property FieldFormulario: String read FFieldFormulario write FFieldFormulario;
  end;

Const
  { Nombres por default de los campos }
  EMP_FIELD_FROMULARIO = 'FO_FORMULARIO';

  { Alias de los campos }
  EMP_ALIAS_FORMULARIO = 'FORMULARIO';

implementation

{$R *.DFM}

uses
  AnsiSql, SqlFuncs, unDmPrincipal;

function TfraEmpresaAfi.GetSql: String;
begin
  Result := inherited GetSql + ' AND fo_id = co_idformulario';

  AddField(Result, EMP_FIELD_FROMULARIO, EMP_ALIAS_FORMULARIO);
  AddTable(Result, 'AFO_FORMULARIO');
end;

procedure TfraEmpresaAfi.SetEditorsValues;
begin
  inherited;
  edFormulario.Text := sdqDatos.FieldByName(EMP_ALIAS_FORMULARIO).AsString;
end;

procedure TfraEmpresaAfi.edFormularioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Internal_SetFormulario(edFormulario.Text, True);
end;

procedure TfraEmpresaAfi.Internal_SetFormulario(aFormulario: String; aDoChanges: Boolean);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FieldFormulario + ' = ' + SqlValue(AFormulario);

  if OpenQuery(sdqDatos, sSql, True) then
  begin
    if sdqDatos.IsEmpty Then
      Clear
    else if sdqDatos.RecordCount = 1 then
      LoadValues(aDoChanges)
    else
      cmbRSocial.DoDropDown(False);
  end;
end;

constructor TfraEmpresaAfi.Create(AOwner: TComponent);
begin
  inherited;
  FieldFormulario := EMP_FIELD_FROMULARIO;
end;

procedure TfraEmpresaAfi.Clear;
begin
  inherited;
  edFormulario.Clear;
end;

function TfraEmpresaAfi.CancelExitLoad: Boolean;
begin
  if (edFormulario.Text <> '') and ((not sdqDatos.Active) or (edFormulario.Text <> sdqDatos.FieldByName(EMP_ALIAS_FORMULARIO).AsString)) then
  begin
    Internal_SetFormulario(edFormulario.Text, True);

    Result := True;
  end
  else
    Result := inherited CancelExitLoad;
end;

function TfraEmpresaAfi.ClearOnExit: boolean;
begin
  Result := (inherited ClearOnExit) and (edFormulario.Text = '');
end;

end.
