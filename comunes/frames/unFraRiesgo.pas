unit unFraRiesgo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox;

type
  TfraRiesgo = class(TfraCodigoDescripcion)
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraRiesgo: TfraRiesgo;

implementation

{$R *.DFM}


constructor TfraRiesgo.Create(AOwner: TComponent);
begin
  inherited;
  FTableName   := 'PRG_RIESGOS';
  FFieldID     := 'RG_ID';
  FFieldCodigo := 'RG_CODIGO';
  FFieldDesc   := 'RG_DESCRIPCION';
  FFieldBaja   := 'RG_FECHABAJA';
end;

end.
