unit unFraRTD_TIPODOCUMENTO;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCodDesc, unPropiedadesFrame, DB, SDEngine, PatternEdit,
  StdCtrls, Mask, ArtComboBox;

type
  TfraRTD_TIPODOCUMENTO = class(TfraCodDesc)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fraRTD_TIPODOCUMENTO: TfraRTD_TIPODOCUMENTO;

implementation

{$R *.dfm}

end.
