unit unLibreDeuda;

interface    

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, PatternEdit, CardinalEdit, ToolEdit,
  DateComboBox, Menus;

type
  TfrmLibreDeuda = class(TfrmCustomConsulta)
    gbContrato: TGroupBox;
    fraEmpresa: TfraEmpresa;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbVerReportes: TToolButton;
    ToolButton2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    gbFechaAlta: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    edFAltaDesde: TDateComboBox;
    edFAltaHasta: TDateComboBox;
    mnuVerReportes: TPopupMenu;
    mnuVerEstadoCuenta: TMenuItem;
    mnuVerLibreDeuda: TMenuItem;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure mnuVerEstadoCuentaClick(Sender: TObject);
    procedure mnuVerLibreDeudaClick(Sender: TObject);
  private
    function Is_ExisteArchivoEstCuentaLD(Contrato: Integer; var NombreArchivo: String): Boolean;
    procedure CalcTotales;
  public
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE');

var
  frmLibreDeuda: TfrmLibreDeuda;

implementation

uses
  AnsiSql, CustomDlgs, unDmPrincipal, unEstadoCuenta, unQrLibreDeuda;

{$R *.dfm}

procedure TfrmLibreDeuda.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  edFAltaDesde.Clear;
  edFAltaHasta.Clear;
  edTotalRegistros.Clear;
  
  inherited;
end;

procedure TfrmLibreDeuda.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sSql := 'SELECT LD_CONTRATO CONTRATO, LDEST.TB_DESCRIPCION DESCRESTADO, LD_USUALTA USUALTA, ' +
                 'TRUNC(LD_FECHAALTA) FECHAALTA, LD_OBSERVACIONES OBSERVACIONES, ' +
                 'EM_CUIT CUIT, EM_NOMBRE RSOCIAL, AFEST.TB_DESCRIPCION DESCRESTADOAF, LD_ID ID ' +
            'FROM CTB_TABLAS AFEST, CTB_TABLAS LDEST, AEM_EMPRESA, ACO_CONTRATO, ZLD_LIBREDEUDA ' +
           'WHERE LDEST.TB_CLAVE=''LDEUD'' ' +
             'AND LDEST.TB_CODIGO=LD_ESTADO ' +
             'AND LD_CONTRATO=CO_CONTRATO ' +
             'AND CO_IDEMPRESA=EM_ID ' +
             'AND AFEST.TB_CLAVE = ''AFEST'' ' +
             'AND AFEST.TB_CODIGO = CO_ESTADO ';

  sWhere := SqlBetweenDateTime(' AND LD_FECHAALTA', edFAltaDesde.Date, edFAltaHasta.Date);

  if not fraEmpresa.IsEmpty then
    sWhere := sWhere + ' AND LD_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;

procedure TfrmLibreDeuda.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa.ShowBajas := True;
end;

function TfrmLibreDeuda.Is_ExisteArchivoEstCuentaLD(Contrato: Integer; var NombreArchivo: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT LD_NOMBREARCHIVO ' +
            'FROM ZLD_LIBREDEUDA ' +
           'WHERE LD_CONTRATO=:Contrato';
  NombreArchivo := ValorSqlEx(sSql, [Contrato]);

  Result := (Trim(NombreArchivo) <> '');
end;

procedure TfrmLibreDeuda.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;

procedure TfrmLibreDeuda.CalcTotales;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Clear;
end;

procedure TfrmLibreDeuda.mnuVerEstadoCuentaClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'Debe elegir un registro.');

  if Is_ExisteArchivoEstCuentaLD(sdqConsulta.FieldByName('CONTRATO').AsInteger, sNombreArchivo) then
    Do_ImprimirArchivoEstCuenta(sNombreArchivo)
  else
    MsgBox('No se ha encontrado el estado de cuenta asociado al libre deuda.', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmLibreDeuda.mnuVerLibreDeudaClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'Debe elegir un registro.');

  sNombreArchivo := Get_NombreArchivoLD(sdqConsulta.FieldByName('ID').AsInteger);

  if FileExists(sNombreArchivo) then
    Do_ImprimirArchivoLibreDeuda(sNombreArchivo)
  else
    MsgBox('No se ha encontrado el libre deuda.', MB_OK + MB_ICONINFORMATION);
end;

end.


