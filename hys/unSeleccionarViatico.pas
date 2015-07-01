unit unSeleccionarViatico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, Vcl.StdCtrls,
  Vcl.Mask, RxToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, FieldHider, ShortCutControl, RxPlacemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids,
  Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls;

type
  TfrmSeleccionarViatico = class(TfrmCustomConsulta)
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label5: TLabel;
    edViaticoDesde: TDateComboBox;
    Label44: TLabel;
    edViaticoHasta: TDateComboBox;
    Label46: TLabel;
    Panel1: TPanel;
    btnAceptarViatico: TButton;
    btnCancelarViatico: TButton;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarViaticoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIdviatico : Integer;
  end;

var
  frmSeleccionarViatico: TfrmSeleccionarViatico;

implementation

{$R *.dfm}
uses
  AnsiSql;

procedure TfrmSeleccionarViatico.btnAceptarViaticoClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active then
    FIdviatico := sdqConsulta.FieldByName('vt_id').AsInteger;
  ModalResult := mrOk;
end;

procedure TfrmSeleccionarViatico.FormCreate(Sender: TObject);
begin
  inherited;
  FIdviatico := 0;

  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_ID';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
end;

procedure TfrmSeleccionarViatico.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  edViaticoDesde.Clear;
  edViaticoHasta.Clear;
end;

procedure TfrmSeleccionarViatico.tbRefrescarClick(Sender: TObject);
var
  sSql : String;
begin
  sSql := 'SELECT vt_id, vt_idpreventor, it_nombre, vt_fechadesde, vt_fechahasta, ' +
          '       vt_kmtotal, vt_montototal, vt_observaciones, vt_usualta, vt_fechaalta, ' +
          '       vt_usumodif, vt_fechamodif, vt_usubaja, vt_fechabaja,vt_otrosgastos, ' +
          '       vt_peajes, vt_hoteles, vt_estacionamiento ' +
          '  FROM hys.hvt_viaticotareas, art.pit_firmantes ' +
          ' WHERE vt_idpreventor = it_id ' ;

  if fraPreventorFiltro.IsSelected then
    sSql := sSql + ' AND vt_idpreventor = '+SqlValue(fraPreventorFiltro.Value);

  if fraCoordinadorFiltro.IsSelected then
    sSql := sSql + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);

  if edViaticoDesde.Date <> 0 then
    sSql := sSql + ' AND vt_fechadesde >= '+SqlValue(edViaticoDesde.Date);

  if edViaticoHasta.Date <> 0 then
    sSql := sSql + ' AND vt_fechahasta >= '+SqlValue(edViaticoHasta.Date);

  if SortDialog.OrderBy <> '' then
    sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy
  else
    sdqConsulta.Sql.Text := sSql + ' ORDER BY vt_fechadesde, vt_fechahasta ';
  inherited;

end;

end.
