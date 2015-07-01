unit unfraArchJuicio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox, unArt, RxToolEdit;

type
  TfraArchJuicio = class(TfraCodigoDescripcion)
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;
                           
implementation

{$R *.DFM}

{ TfraArchJuicio }

constructor TfraArchJuicio.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'LEGALES.LJT_JUICIOENTRAMITE' + GetDBLink();
  FieldID     := 'JT_ID';
  FieldCodigo := 'JT_NUMEROCARPETA';
  FieldDesc   := 'JT_CARATULA';
end;

end.
 