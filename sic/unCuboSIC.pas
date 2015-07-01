unit unCuboSIC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, cxClasses, cxGraphics, cxCustomData, cxStyles,
  cxEdit, cxControls, cxCustomPivotGrid, cxDBPivotGrid, ImgList, XPMenu,
  Placemnt, DB, SDEngine, unFraTitulo, cxProgressBar;

type
  TfrmCuboSIC = class(TfrmCustomForm)
    cxDBPivotGrid: TcxDBPivotGrid;
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    sdqConsultaESTADO: TStringField;
    sdqConsultaCANTIDAD: TFloatField;
    sdqConsultaMOTIVO: TStringField;
    sdqConsultaTAREAS: TStringField;
    sdqConsultaUSUARIO: TStringField;
    Cantidad: TcxDBPivotGridField;
    Estado: TcxDBPivotGridField;
    Motivo: TcxDBPivotGridField;
    Usuario: TcxDBPivotGridField;
    fraTituloCubo: TfraTitulo;
    sdqConsultaMOTIVO_INGRESO: TStringField;
    MotivoIngreso: TcxDBPivotGridField;
    UsuarioGenerico: TcxDBPivotGridField;
    sdqConsultaRESPUESTA: TStringField;
    sdqConsultaUSUARIOGENERICO: TStringField;
    Respuesta: TcxDBPivotGridField;
    Prestador: TcxDBPivotGridField;
    sdqConsultaPRESTADOR: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCuboSIC: TfrmCuboSIC;

implementation

{$R *.dfm}

procedure TfrmCuboSIC.FormCreate(Sender: TObject);
begin
  HideTitlebar;
  inherited;
  sdqConsulta.Open;
end;

end.
