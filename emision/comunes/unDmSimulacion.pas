unit unDmSimulacion;

interface

uses
  SysUtils, Classes, DB, SDEngine, unFuncionesEmision;

type
  TdmSimulacion = class(TDataModule)
    sdqDevengadosActuales: TSDQuery;
    dsDevengadosActuales: TDataSource;
    procedure InicializarResumenSimulacion(ACUIT: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSimulacion: TdmSimulacion;

implementation

uses unDmEmision, unDmPrincipal;

{$R *.dfm}

procedure TdmSimulacion.InicializarResumenSimulacion(ACUIT : String);
begin
  Do_InicializarSimulacion;
end;

end.
