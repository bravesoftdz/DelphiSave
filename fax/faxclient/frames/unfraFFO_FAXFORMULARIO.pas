
{********************************************************}
{                                                        }
{    Frame de Búsqueda de Formularios de Faxes           }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

unit unfraFFO_FAXFORMULARIO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls, Mask,
  PatternEdit;

type
  TfraFFO_FAXFORMULARIO = class(TfraStaticCodigoDescripcion)
  private
    FUsuario: string;
    procedure SetUsuario(const Value: string);
  protected
    function GetSql: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Usuario: string read FUsuario write SetUsuario;
  end;

implementation

uses
  AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraFFO_FAXFORMULARIO }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraFFO_FAXFORMULARIO.Create(AOwner: TComponent);
begin
  inherited;

  TableName   := 'FFO_FAXFORMULARIO';
  FieldID     := 'FO_ID';
  FieldCodigo := 'FO_ID';
  FieldDesc   := 'FO_DESCRIPCION';
  FieldBaja   := 'FO_FECHABAJA';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFFO_FAXFORMULARIO.GetSql: string;
begin
  Result := inherited GetSql;
  if FUsuario <> '' Then
  begin
    AddTable(Result, 'FFU_FORMULARIOUSUARIO');
    AddCondition(Result, 'FO_ID=FU_IDFORMULARIO');
    AddCondition(Result, 'FU_FECHABAJA IS NULL');
    AddCondition(Result, 'FU_USUARIO = ' + SqlValue(FUsuario));
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFFO_FAXFORMULARIO.SetUsuario(const Value: string);
begin
  if FUsuario <> Value Then
  begin
    FUsuario := Value;
    ClearGrid;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
