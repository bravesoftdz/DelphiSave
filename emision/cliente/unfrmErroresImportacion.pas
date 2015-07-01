unit unfrmErroresImportacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ShortCutControl, FieldHider, DB, Placemnt, QueryToFile,
  ExportDialog, QueryPrint, SortDlg, SDEngine, artSeguridad;

type
  TfrmErroresImportacion = class(TForm)
    pcErrores: TPageControl;
    tsErroresProceso: TTabSheet;
    tsErroresRegistro: TTabSheet;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbPropiedades: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbMostrarOcultarColumnas: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbEnviarMail: TToolButton;
    tbMostrarFiltros: TToolButton;
    tbMaxRegistros: TToolButton;
    tbSalir: TToolButton;
    dbgErroresRegistro: TArtDBGrid;
    dbgErroresProceso: TArtDBGrid;
    Seguridad: TSeguridad;
    sdqErroresProceso: TSDQuery;
    SortDialog: TSortDialog;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ExportDialog: TExportDialog;
    FormStorage: TFormStorage;
    dsErroresProceso: TDataSource;
    FieldHider: TFieldHider;
    ShortCutControl: TShortCutControl;
    sdqErroresRegistro: TSDQuery;
    dsErroresRegistro: TDataSource;
    procedure tbSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarErroresProceso(AIdCabecera : Integer);
    class function CheckErrores(AIdCabecera: Integer): boolean;    
  end;

implementation

{$R *.dfm}

uses AnsiSql, SqlFuncs, StrFuncs, unDirUtils, unDmPrincipal,
     unCustomDataModule, unConstEmision;


{ TfrmErroresImportacion }

class function TfrmErroresImportacion.CheckErrores(
  AIdCabecera: Integer) : boolean;
begin
  result := ValorSql('select 1 from emi.TCE_DDJJCABECERAERRORES ' +
                     ' where rownum <= 1 and ce_idddjjcabeceraerrores = ' + SqlValue(AIdCabecera), '0') >= 0 ;
  result := result or (ValorSql('select 1 from emi.tte_ddjjtrabajadoreserror ' +
                               ' where te_idddjjcabeceraimportacion = ' + SqlValue(AIdCabecera), '0') >= 0);
end;

procedure TfrmErroresImportacion.MostrarErroresProceso(
  AIdCabecera: Integer);
begin
  sdqErroresProceso.ParamByName('id').AsInteger := AIdCabecera;
  sdqErroresProceso.Open;

  sdqErroresRegistro.ParamByName('id').AsInteger := AIdCabecera;
  sdqErroresRegistro.Open;

  Showmodal;
end;

procedure TfrmErroresImportacion.tbSalirClick(Sender: TObject);
begin
  close;
end;

end.
