unit unfraAbogados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox;

type
  TfraAbogados = class(TfraCodigoDescripcion)
  private
    {$HINTS OFF}
    property  TableName;
    property  FieldID;
    property  FieldCodigo;
    property  FieldDesc;
    property  FieldBaja;
    {$HINTS ON}
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraAbogados: TfraAbogados;

implementation

Uses AnsiSql;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraAbogados }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraAbogados.Create(AOwner: TComponent);
begin
  inherited;
  FFieldCodigo := 'BO_CODIGO';
  FFieldID     := 'BO_CODIGO';
  FFieldBaja   := SQL_NULL;
  FTableName   := 'LBO_ABOGADOS';
  FFieldDesc   := 'BO_NOMBRE';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
