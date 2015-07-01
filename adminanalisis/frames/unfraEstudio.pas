unit unFraEstudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox, SDEngine;

type
  TTipoResultado = (trNone, trNumerico, trBoleano);
  TfraEstudio = class(TfraCodigoDescripcion)
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    FFormulario: String;
    FTipoResultado: TTipoResultado;
    procedure SetFormulario(const Value: String);
    procedure SetTipoResultado(const Value: TTipoResultado);
  protected
    function GetSqlWhere: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure NormalizeCode;
  published
    property Formulario    : String         read FFormulario    write SetFormulario;
    property TipoResultado : TTipoResultado read FTipoResultado write SetTipoResultado  default trNone;
  end;

implementation

uses
  StrFuncs, AnsiSql;

const
  FROM_TODOS = '@';

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TfraEstudio.Create(AOwner: TComponent);
begin
  inherited;
  FTableName      := 'AES_ESTUDIOS';
  FFieldID        := 'ES_CODIGO';
  FFieldCodigo    := 'ES_CODIGO';
  FFieldDesc      := 'ES_DESCRIPCION';
  FFieldBaja      := 'ES_FECHABAJA';
  FExtraFields    := ', ES_COSTO, ES_UMEDIDA, ES_MAXIMO, ES_MINIMO, ES_FORMULARIO, ES_ID ';
//  FExtraCondition := '';

  CaseSensitive := False;
  FFormulario    := FROM_TODOS;
  FTipoResultado := trNone;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstudio.GetSqlWhere: string;
begin
  Result := inherited GetSqlWhere;
  if FFormulario <> FROM_TODOS Then
    Result := Result + ' AND ES_FORMULARIO ' + SqlString(FFormulario, True, True);

  if FTipoResultado = trNumerico then
    Result := Result + ' AND (ES_MAXIMO <> 0 OR ES_MINIMO <> 0) '

  else if FTipoResultado = trBoleano then
    Result := Result + ' AND ES_MAXIMO = 0 AND ES_MINIMO = 0 ';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstudio.NormalizeCode;
begin
  if edCodigo.Text <> '' then
    edCodigo.Text := LPad( Trim(edCodigo.Text), '0', 8);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstudio.SetFormulario(const Value: String);
begin
  if FFormulario <> Value Then begin
    FFormulario := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('ES_FORMULARIO').AsString <> Value) Then
      Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstudio.SetTipoResultado(const Value: TTipoResultado);
begin
  if FTipoResultado <> Value Then begin
     FTipoResultado := Value;
{     if (sdqDatos.FieldByName('ES_MAXIMO').AsInteger = 0) and
         (sdqDatos.FieldByName('ES_MINIMO').AsInteger = 0) Then
     begin
       TipoResultado := trBoleano
     end else
     Clear;}
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstudio.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
    NormalizeCode;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
