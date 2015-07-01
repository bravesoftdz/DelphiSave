unit unFraMIM_IMPLANTES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraMIM_IMPLANTES = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraMIM_IMPLANTES: TfraMIM_IMPLANTES;

implementation

uses unFraStaticCodigoDescripcion, unFraCodigoDescripcion;

{$R *.dfm}

constructor TfraMIM_IMPLANTES.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'MIM_IMPLANTES';
  FieldID     := 'IM_CODIGO';
  FieldCodigo := 'IM_CODIGO';
  FieldDesc   := 'IM_MARCA';
  FieldBaja   := 'IM_FBAJA';
  ExtraFields := ', IM_EMPRESA ';
  IdType      := ctString;
end;

end.
 