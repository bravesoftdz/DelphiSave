unit unFraSFD_FORMADIAGNOSTICO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSFD_FORMADIAGNOSTICO = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSFD_FORMADIAGNOSTICO: TfraSFD_FORMADIAGNOSTICO;

implementation

{$R *.dfm}

{ TfraSFD_FORMADIAGNOSTICO }

constructor TfraSFD_FORMADIAGNOSTICO.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.SFD_FORMADIAGNOSTICO';
  FieldID     := 'FD_ID';
  FieldCodigo := 'FD_CODIGO';
  FieldDesc   := 'FD_DESCRIPCION';
  FieldBaja   := 'NULL';
end;

end.
