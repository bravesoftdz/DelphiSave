unit unRedPresAdministracionCartasLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRedPresAdministracionCartas, SDEngine, Menus, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, ComCtrls, StdCtrls, unFraDomicilioTrab,
  unfraCtbTablas, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, CardinalEdit, ToolWin, SinEdit, ToolEdit,
  DateComboBox, unArtDbFrame, unFraEmpresa, unFraCodigoDescripcion,
  unFraGrupoTrabajo, DBCheckCombo, ComboEditor, CheckCombo,unArt,
  unFraStaticCTB_TABLAS, unArtFrame, unArtDBAwareFrame, unGeneracionCartasAdminLegales,
  unFraStaticCodigoDescripcion, Mask, PatternEdit, IntEdit, unfraPrestador,
  unfraFirmante, unFraSDA_DETALLEARCHIVO;

type
  TfrmRedPresAdministracionCartasLegales = class(TfrmRedPresAdministracionCartas)
    tbVerImagenes: TToolButton;
    ShortCutControlHijo3: TShortCutControl;
    procedure tbVerImagenesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure NuevaCarta(Sender: TObject);override;
  public
  end;

var
  frmRedPresAdministracionCartasLegales: TfrmRedPresAdministracionCartasLegales;

implementation

uses
   unFrmDetalleArchivo, unComunesArchivo, unConstantArchivo, unArchivo, CustomDlgs;

{$R *.dfm}

procedure TfrmRedPresAdministracionCartasLegales.NuevaCarta(Sender: TObject);
begin
  with TfrmGeneracionCartasAdminLegales.Create(Self) do
  try
    if Sender = tbNuevo then
      IdCarta := ART_EMPTY_ID
    else
      IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;

    PermitirSinRechazado := PermitirSinRechazadoGenCartasAdmin;
    CodArea := Self.Area;
    Preparar(IdCarta);

    if Mostrar and sdqConsulta.Active then
      sdqConsulta.Refresh;
  finally
    free;
  end;
end;


procedure TfrmRedPresAdministracionCartasLegales.tbVerImagenesClick(Sender: TObject);
var
  RARId: TTableId;
  sClave: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro.');
  Verificar(sdqconsulta.FieldByName('EX_SINIESTRO').IsNull, Grid, 'Debe haber un siniestro seleccionado.');

  sClave := GetClaveArmada(2, sdqconsulta.FieldByName('EX_SINIESTRO').AsString, sdqconsulta.FieldByName('EX_ORDEN').AsString, '', '');
  Verificar(not VerificarClaveExiste(ID_CARPETA_CD_LEGSIN, sClave, RARId), Grid, 'La carpeta no existe.');

  TFrmDetalleArchivo.MostrarDetalleArchivo(Self, RARId, True);
end;

procedure TfrmRedPresAdministracionCartasLegales.FormCreate(Sender: TObject);
begin
  inherited;
  tbSalir2.Visible := True;
end;

end.
