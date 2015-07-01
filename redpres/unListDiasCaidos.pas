unit unListDiasCaidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, Placemnt, artSeguridad, StdCtrls, ShortCutControl, Db,
  SDEngine, SortDlg, QueryPrint, QueryToFile, ExportDialog;

type
  TfrmListDiasCaidos = class(TForm)
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    dbgListado: TArtDBGrid;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton1: TToolButton;
    tbOrden: TToolButton;
    Sep1: TToolButton;
    tbImprimir: TToolButton;
    ToolButton4: TToolButton;
    tbSalir: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    cmbTipoListado: TComboBox;
    ShortCutControl: TShortCutControl;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    tbExportar: TToolButton;
    SortDialog: TSortDialog;
    QueryPrint: TQueryPrint;
    ExportDialog: TExportDialog;
    PrintDialog: TPrintDialog;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbExportarClick(Sender: TObject);
    procedure dbgListadoPaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
  private
  public
  end;

var
  frmListDiasCaidos: TfrmListDiasCaidos;

implementation

uses unSesion, Registros, General, unDmPrincipal, AnsiSql, unPrincipal;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.FormCreate(Sender: TObject);
begin
  cmbTipoListado.ItemIndex := StrToInt(GetRegFromValue(Self, 'Tipo de Listado', '0'));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetRegFromValue(Self, 'Tipo de Listado', IntToStr(cmbTipoListado.ItemIndex));
  Action := caFree;
  frmPrincipal.mnuListDiasCados.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.tbRefrescarClick(Sender: TObject);
var Sql  : String;
    iTip : Integer;
Const
  PISO  = 1;
  TECHO = 2;
  PisoTecho : Array [1..5, 1..2] of String = (('7', '14'),
                                              ('15','29'),
                                              ('30','59'),
                                              ('60',''),
                                              ('4','6'));
begin
  iTip := cmbTipoListado.ItemIndex + 1;
  case iTip of
     1..3, 5:
         Sql := 'SELECT ex_siniestro, ex_orden, ex_recaida, nvl(ex_fecharecaida, ex_fechaaccidente) FECHA, ' +
                      ' ex_cuit, mp_nombre, ex_cuil, tj_nombre, ex_bajamedica, ex_diagnosticooms, ' +
                      ' ex_diagnostico, Amebpba.Get_Recaidas(ex_siniestro, ex_orden, ex_recaida) RECAIDAS, ' +
                      ' Amebpba.Get_Maxevo(ex_siniestro, ex_orden, ex_recaida) MAXEVO, ex_fechaalta ' +
                 ' FROM ctj_trabajadores, cmp_empresas, sex_expedientes ' +
                ' WHERE ex_cuit = mp_cuit ' +
                 ' AND ex_cuil = tj_cuil ' +
                 ' AND ex_altamedica is null ' +
                 ' AND ex_estado <> ''03'' ' +
                 ' AND ex_fechaalta > ' + SQL_DATETIME + ' - ' + PisoTecho[iTip, TECHO] +
                 ' AND nvl(ex_causafin,'' '')  NOT IN (''99'',''95'',''02'') ' +
                 ' AND ' + SQL_DATETIME + ' - NVL(ex_bajamedica, nvl(ex_fecharecaida, ex_fechaaccidente)) BETWEEN ' + PisoTecho[iTip, PISO] + ' AND ' + PisoTecho[iTip, TECHO] +
                 IIF(iTip = 5, 'AND NOT EXISTS (SELECT 1 ' +
                                                ' FROM spi_parteingreso ' +
                                               ' WHERE pi_siniestro = ex_siniestro ' +
                                                 ' AND pi_orden = ex_orden ' +
                                                 ' AND pi_recaida = ex_recaida) ' +
                               ' AND NOT EXISTS (SELECT 1 ' +
                                                 ' FROM spv_parteevolutivo ' +
                                                ' WHERE pv_siniestro = ex_siniestro ' +
                                                  ' AND pv_orden = ex_orden ' +
                                                  ' AND pv_recaida = ex_recaida ' +
                                                  ' AND pv_fechabaja IS NULL)', '');
     4:
         Sql := 'SELECT ex_siniestro, ex_orden, ex_recaida, nvl(ex_fecharecaida, ex_fechaaccidente) FECHA, ' +
                      ' ex_cuit, mp_nombre, ex_cuil, tj_nombre, ex_bajamedica, ex_diagnosticooms, ' +
                      ' ex_diagnostico, Amebpba.Get_Recaidas(ex_siniestro, ex_orden, ex_recaida) RECAIDAS, ' +
                      ' Amebpba.Get_Maxevo(ex_siniestro, ex_orden, ex_recaida) MAXEVO, ex_fechaalta ' +
                 ' FROM ctj_trabajadores, cmp_empresas, sex_expedientes ' +
                ' WHERE ex_cuit = mp_cuit ' +
                  ' AND ex_cuil = tj_cuil ' +
                  ' AND ex_altamedica is null ' +
                  ' AND ex_estado <> ''03'' ' +
                  ' AND ex_fechaalta < ' + SQL_DATETIME + ' ' +
                  ' AND nvl(ex_causafin,'' '')  NOT IN (''99'',''95'',''02'') ' +
                  ' AND ' + SQL_DATETIME + ' - NVL(ex_bajamedica, nvl(ex_fecharecaida, ex_fechaaccidente)) > ' + PisoTecho[iTip, PISO];
  end;
  Sql := Sql + SortDialog.OrderBy;
  CopySqlClp(Sql);

  sdqDatos.Close;
  sdqDatos.SQL.Text := Sql;
  sdqDatos.Open;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.tbOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.tbImprimirClick(Sender: TObject);
begin
   if not sdqDatos.Active then tbRefrescarClick(Nil);
   QueryPrint.Title.Text  := cmbTipoListado.Text;
   QueryPrint.Footer.Text := Sesion.Usuario;
   if Trim(cmbTipoListado.Text) <> '' then
   begin
     QueryPrint.SubTitle.Lines.Clear;
     QueryPrint.SubTitle.Lines.Add(' Tipo de Listado ' + cmbTipoListado.Text);
   end;
   if PrintDialog.Execute then QueryPrint.Print;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.tbExportarClick(Sender: TObject);
begin
  if not sdqDatos.Active then tbRefrescarClick(Nil);
  ExportDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListDiasCaidos.dbgListadoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  if Column = 'EX_SINIESTRO' then Value := IntToStr(sdqDatos.RecordCount);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
