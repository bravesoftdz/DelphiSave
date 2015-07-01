unit unFraMAU_AUDITORES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraMAU_AUDITORES = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraMAU_AUDITORES: TfraMAU_AUDITORES;

implementation

{$R *.dfm}

{ TfraMAU_AUDITORES }

constructor TfraMAU_AUDITORES.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'MAU_AUDITORES';
  FieldID     := 'LF_ID';
  FieldCodigo := 'AU_AUDITOR';
  FieldDesc   := 'AU_NOMBRE';
  FieldBaja   := 'AU_FBAJA';
  ExtraFields := ',AU_EMAIL ';
end;

end.
