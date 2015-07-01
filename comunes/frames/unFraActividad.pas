unit unFraActividad;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF} Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Db, SDEngine, PatternEdit, StdCtrls, Mask, ArtComboBox, unFraCodigoDescripcion,
  RxToolEdit;

type
  TfraActividad = class(TfraCodigoDescripcion)
  private
  protected
    {Oculta las Propiedades}
    property TableName;
    property FieldID;
    property FieldCodigo;
    property FieldDesc;
    property FieldBaja;
    property ExtraFields;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses AnsiSQL;

{$R *.DFM}

{ TfraActividad }

constructor TfraActividad.Create(AOwner: TComponent);
begin
  inherited;
  FTableName      := 'cac_actividad';
  FFieldID        := 'ac_id';
  FFieldCodigo    := 'ac_codigo';
  FFieldDesc      := 'UPPER(ac_descripcion)';
  ExtraCondition  := ' AND LENGTH(ac_codigo) = 6';
  FFieldBaja      := 'ac_fechabaja';
  ShowBajas       := True;
end;

end.
