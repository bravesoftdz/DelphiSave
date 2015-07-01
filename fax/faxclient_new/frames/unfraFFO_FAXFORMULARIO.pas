
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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraStaticCodigoDescripcion, ComboEditor,
  ComboGrid, StdCtrls, Mask, PatternEdit;

type
  TfraFFO_FAXFORMULARIO = class(TfraStaticCodigoDescripcion)
  private
    FUsuario: String;

    procedure SetUsuario(const Value: String);
  protected
    function GetSql: String; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Usuario: String read FUsuario write SetUsuario;
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

function TfraFFO_FAXFORMULARIO.GetSql: String;
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

procedure TfraFFO_FAXFORMULARIO.SetUsuario(const Value: String);
begin
  if FUsuario <> Value then
  begin
    FUsuario := Value;
    ClearGrid;
  end;
end;

end.
