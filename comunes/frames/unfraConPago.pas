unit unfraConPago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox;

type
  TfraConPago = class(TfraCodigoDescripcion)
  private
    function GetEsTraslado: Boolean;
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
    property    EsTraslado: Boolean read GetEsTraslado;
  end;

implementation

uses AnsiSQL;

{$R *.DFM}


{ TfraConcPago }

constructor TfraConPago.Create(AOwner: TComponent);
begin
  inherited;
  FTableName      := 'SCP_CONPAGO';
  FFieldID        := 'CP_CONPAGO';
  FFieldCodigo    := 'CP_CONPAGO';
  FFieldDesc      := 'CP_DENPAGO';
  ExtraCondition  := ' AND CP_TIPO = ''E''';
  ExtraFields     := ', CP_AUTORIZACION, CP_NOMENCLADO, CP_TRASLADO ';
  FFieldBaja      := 'CP_FBAJA';
end;

function TfraConPago.GetEsTraslado: Boolean;
begin
  Result := IsSelected and sdqDatos.Active and (not sdqDatos.IsEmpty) and (sdqDatos.FieldByName('CP_TRASLADO').AsString = 'S');
end;

end.
