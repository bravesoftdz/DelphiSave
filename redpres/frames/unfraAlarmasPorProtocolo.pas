unit unfraAlarmasPorProtocolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodDesc, unPropiedadesFrame, Db, SDEngine, PatternEdit, StdCtrls,
  Mask, ToolEdit, ArtComboBox;

type
  TfraAlarmasPorProtocolo = class(TfraCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraAlarmasPorProtocolo: TfraAlarmasPorProtocolo;

implementation

uses
  unFraCodigoDescripcion;

{$R *.DFM}

{ TfraAlarmasPorProtocolo }

constructor TfraAlarmasPorProtocolo.Create(AOwner: TComponent);
begin
  inherited;
  CodigoType := unFraCodigoDescripcion.TCodigoType(ctString);
  IdType := unFraCodigoDescripcion.TCodigoType(ctString);  
end;

end.
