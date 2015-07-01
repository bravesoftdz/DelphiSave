unit unFrmDetalleDevengadoGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, StdCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid;

type
  TfrmDetalleDevengadosGrupo = class(TForm)
    dbgContratoPeriodo: TArtDBGrid;
    bvSeparador: TBevel;
    btnSalirProcesos: TButton;
    sdqProgramacion: TSDQuery;
    dsProgramacion: TDataSource;
    procedure btnSalirProcesosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarResumenesDevengadoGrupo(AIdGrupo : integer);
  end;

var
  frmDetalleDevengadosGrupo: TfrmDetalleDevengadosGrupo;

implementation

{$R *.dfm}

procedure TfrmDetalleDevengadosGrupo.btnSalirProcesosClick(
  Sender: TObject);
begin
  sdqProgramacion.close;
  close;
end;

procedure TfrmDetalleDevengadosGrupo.MostrarResumenesDevengadoGrupo(
  AIdGrupo: integer);
begin
  sdqProgramacion.parambyname('id').asinteger := AIdGrupo;
  sdqProgramacion.open;
  self.Showmodal;
end;

end.
