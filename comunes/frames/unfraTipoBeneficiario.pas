unit unfraTipoBeneficiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCodigoDescripcion, DB, SDEngine, PatternEdit, StdCtrls,
  Mask, ToolEdit, ArtComboBox;

type
  TfraTipoBeneficiario = class(TfraCodigoDescripcion)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fraTipoBeneficiario: TfraTipoBeneficiario;

implementation

{$R *.dfm}

end.
