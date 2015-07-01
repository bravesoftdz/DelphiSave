unit unErroresUbicCarpetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unFraFiltroArchivo, StdCtrls, Mask,
  PatternEdit, CardinalEdit, ToolEdit, DateComboBox;

type
  TfrmErroresUbicCarpetas = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    pnlSeleccionados: TPanel;
    edTotalRegistros: TCardinalEdit;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    edCantUbic: TCardinalEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edFechaUbic: TDateComboBox;
    Label3: TLabel;
    edFechaError: TDateComboBox;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CalcTotales;
    procedure DoLimpiarTotales;
  public
  protected
    procedure RefreshData; override;
  end;

var
  frmErroresUbicCarpetas: TfrmErroresUbicCarpetas;

implementation

uses
  unDmPrincipal, AnsiSql, VCLExtra;

{$R *.dfm}

procedure TfrmErroresUbicCarpetas.RefreshData;
var
  sUltUsuario, sSql: String;
begin
  sSql := 'SELECT UC_USUARIO ' +
            'FROM TUC_UBICACIONCARPETAS ' +
           'WHERE UC_ID = (SELECT MAX(UC_ID) ' +
                            'FROM TUC_UBICACIONCARPETAS)';
  sUltUsuario := ValorSql(sSql);

  sSql := 'SELECT UC_CODARCHIVO, UC_CLAVE, UC_CODUBICACION_ADMIN, UC_ERRORES ' +
            'FROM TUC_UBICACIONCARPETAS ' +
           'WHERE UC_USUARIO = ' + SqlValue(sUltUsuario) + ' ' +
             'AND UC_ERRORES IS NOT NULL';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmErroresUbicCarpetas.CalcTotales;
var
  sSql: String;
begin
  if tbSumatoria.Down and sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      edTotalRegistros.Value := sdqConsulta.RecordCount;

      sSql := 'SELECT COUNT(*) ' +
                'FROM RUB_ARCHIVOUBICACION';
      edCantUbic.Value := ValorSqlInteger(sSql);
    end
  else
    DoLimpiarTotales;
end;

procedure TfrmErroresUbicCarpetas.doLimpiarTotales;
begin
  edTotalRegistros.Value := 0;
  edCantUbic.Value       := 0;
end;

procedure TfrmErroresUbicCarpetas.tbLimpiarClick(Sender: TObject);
begin
  doLimpiarTotales;
  inherited;
end;

procedure TfrmErroresUbicCarpetas.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmErroresUbicCarpetas.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  VCLExtra.LockControls([edFechaUbic, edFechaError]);

  sSql := 'SELECT TRUNC(MAX(UB_FECHAALTA)) ' +
            'FROM RUB_ARCHIVOUBICACION';
  edFechaUbic.Date := ValorSqlDateTime(sSql);

  sSql := 'SELECT TRUNC(MAX(UC_FECHAALTA)) ' +
            'FROM TUC_UBICACIONCARPETAS';
  edFechaError.Date := ValorSqlDateTime(sSql);
end;

end.
