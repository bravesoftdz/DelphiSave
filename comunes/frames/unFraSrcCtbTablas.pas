unit unFraSrcCtbTablas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox;

type
  TfraSrcCtbTablas = class(TfraCodigoDescripcion)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fraSrcCtbTablas: TfraSrcCtbTablas;

implementation

{$R *.DFM}

end.
