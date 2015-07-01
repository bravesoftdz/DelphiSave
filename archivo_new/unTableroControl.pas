unit unTableroControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, RxToolEdit, DateComboBox, PeriodoPicker, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo;

type
  TfrmTableroControl = class(TfrmCustomConsulta)
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    edPeriodoDesde: TPeriodoPicker;
    edPeriodoHasta: TPeriodoPicker;
    GroupBox1: TGroupBox;
    cmbUsuarios: TDBCheckCombo;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    ShortCutControl1: TShortCutControl;
    rgTipo: TRadioGroup;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
    procedure DoSetearPeriodosPorDefecto;
    procedure CalcTotales;
  public
  protected
    procedure RefreshData; override;
  end;

const
  MAXCOLS = 12;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('ENTREGALEGAJOS', 'DEVOLUCLEGAJOS', 'CANCELACSOLICITUDES', 'ENVIOLOTESADMIN', 'IMAGENESDIGITALIZ',
                                               'CANTCAJASENTERMINO', 'CANTCAJASFUERATERMINO', 'CANTCAJASTOTALES', 'CAJASCOMPRADAS',
                                               'IMAGDIGMESANT', 'IMAGDIGMESANTTERMINO', 'IMAGDIGMES', 'CANTBULTOS');

var
  frmTableroControl: TfrmTableroControl;
  TotalConsulta: Array of Extended;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, CustomDlgs, unDmPrincipal,
  StrFuncs, Periodo, DbFuncs;

{$R *.dfm}

procedure TfrmTableroControl.FormCreate(Sender: TObject);
begin
  inherited;

  DoSetearPeriodosPorDefecto;
  OpenQuery(sdqUsuarios);
  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmTableroControl.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0)
end;

procedure TfrmTableroControl.RefreshData;
var
  sSql: String;
  bGeneral: Boolean;
begin
  Verificar(IsEmptyString(edPeriodoDesde.Periodo.Valor) and IsEmptyString(edPeriodoHasta.Periodo.Valor), edPeriodoDesde, 'Debe indicar algún periodo.');
  Verificar(not IsEmptyString(edPeriodoDesde.Periodo.Valor) and not IsEmptyString(edPeriodoHasta.Periodo.Valor) and (edPeriodoDesde.Periodo.Valor > edPeriodoHasta.Periodo.Valor), edPeriodoDesde, 'El periodo desde no puede ser mayor que el hasta.');

  bGeneral := (rgTipo.ItemIndex = 1);

  Verificar(not bGeneral and IsEmptyString(cmbUsuarios.Text), cmbUsuarios, 'Si eligió estadística Por Usuario entonces debe seleccionar al menos uno.');

  sSql := 'SELECT CO_PERIODO PERIODO, SE_NOMBRE USUARIO, CO_ENTREGALEGAJOS ENTREGALEGAJOS, CO_DEVOLUCLEGAJOS DEVOLUCLEGAJOS, ' +
                 'CO_CANCELACSOLICITUDES CANCELACSOLICITUDES, CO_ENVIOLOTESADMIN ENVIOLOTESADMIN, ' +
                 'CO_IMAGENESDIGITALIZ IMAGENESDIGITALIZ, CO_CANTCAJASENTERMINO CANTCAJASENTERMINO, ' +
                 'CO_CANTCAJASFUERATERMINO CANTCAJASFUERATERMINO, CO_CANTCAJASTOTALES CANTCAJASTOTALES, ' +
                 'CO_CAJASCOMPRADAS CAJASCOMPRADAS, CO_IMAGDIGMESANT IMAGDIGMESANT, ' +
                 'CO_IMAGDIGMESANTTERMINO IMAGDIGMESANTTERMINO, CO_IMAGDIGMES IMAGDIGMES, ' +
                 'CO_CANTBULTOS CANTBULTOS ' +
            'FROM ARCHIVO.RCO_TABLEROCONTROL, ART.USE_USUARIOS ' +
           'WHERE CO_USUARIO = SE_USUARIO';

  sSql := sSql + SqlBetween(' AND CO_PERIODO ', edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor);

  if not IsEmptyString(cmbUsuarios.Text) then
   sSql := sSql + ' AND CO_USUARIO ' + cmbUsuarios.InSql;

  if bGeneral then
    sSql := 'SELECT PERIODO, NULL USUARIO, SUM(ENTREGALEGAJOS) ENTREGALEGAJOS, SUM(DEVOLUCLEGAJOS) DEVOLUCLEGAJOS, ' +
                   'SUM(CANCELACSOLICITUDES) CANCELACSOLICITUDES, SUM(ENVIOLOTESADMIN) ENVIOLOTESADMIN, ' +
                   'SUM(IMAGENESDIGITALIZ) IMAGENESDIGITALIZ, SUM(CANTCAJASENTERMINO) CANTCAJASENTERMINO, ' +
                   'SUM(CANTCAJASFUERATERMINO) CANTCAJASFUERATERMINO, SUM(CANTCAJASTOTALES) CANTCAJASTOTALES, ' +
                   'SUM(CAJASCOMPRADAS) CAJASCOMPRADAS, SUM(IMAGDIGMESANT) IMAGDIGMESANT, ' +
                   'SUM(IMAGDIGMESANTTERMINO) IMAGDIGMESANTTERMINO, SUM(IMAGDIGMES) IMAGDIGMES, ' +
                   'SUM(CANTBULTOS) CANTBULTOS ' +
              'FROM (' + sSql + ') ' +
             'GROUP BY PERIODO';

  sdqConsulta.SQL.Text := sSql + NVL(SortDialog.OrderBy, ' ORDER BY PERIODO, USUARIO');

  Grid.ColumnByField['USUARIO'].Visible := not bGeneral;
  inherited;
  CalcTotales;
end;

procedure TfrmTableroControl.rgTipoClick(Sender: TObject);
var
  bGeneral: Boolean;
begin
  bGeneral := (rgTipo.ItemIndex = 1);

  VCLExtra.LockControl(cmbUsuarios, bGeneral);
  if bGeneral then
    cmbUsuarios.Clear;
end;

procedure TfrmTableroControl.tbLimpiarClick(Sender: TObject);
begin
  rgTipo.ItemIndex := 0;    // Por Usuario
  rgTipo.OnClick(nil);

  DoSetearPeriodosPorDefecto;
  cmbUsuarios.Clear;

  inherited;
end;

procedure TfrmTableroControl.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmTableroControl.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmTableroControl.DoSetearPeriodosPorDefecto;
begin
  edPeriodoDesde.Periodo.Valor := AddPeriodo(GetPeriodo(DBDate(), fpAnioMes), -1);
  edPeriodoHasta.Periodo.Valor := edPeriodoDesde.Periodo.Valor;
end;

end.

