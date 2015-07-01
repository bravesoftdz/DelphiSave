unit unFrmSeteos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TFrmSeteos = class(TfrmCustomConsulta)
    ShortCutControlSinHerenciaDelOrto: TShortCutControl;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

uses unFrmAdministracionSeteo, DateUtils, unDmEmision, unDmPrincipal;

{$R *.dfm}

procedure TFrmSeteos.tbNuevoClick(Sender: TObject);
begin
  inherited;

  with TFrmAdministracionSeteo.Create(self) do
  try
    AltaSeteo;
    sdqConsulta.Refresh;
  finally
    free;
  end;

end;

procedure TFrmSeteos.tbModificarClick(Sender: TObject);
begin
  inherited;
  if (sdqConsulta.RecordCount > 0) and
     (sdqConsulta.FieldByName('se_fechabaja').IsNull) then
  with TFrmAdministracionSeteo.Create(self) do
  try
    ModificacionSeteo(sdqConsulta.Fields);
    sdqConsulta.Refresh;
  finally
    free;
  end;
  sdqConsulta.Refresh;
end;

procedure TFrmSeteos.FormCreate(Sender: TObject);
begin
  inherited;
  tbRefrescarClick(self);
end;

procedure TFrmSeteos.tbEliminarClick(Sender: TObject);
begin
  inherited;
  sdqConsulta.Refresh;
end;

procedure TFrmSeteos.tbSalirClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmSeteos.tbRefrescarClick(Sender: TObject);
begin
  inherited;
  sdqConsulta.Close;
  sdqConsulta.Open;

end;

procedure TFrmSeteos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
