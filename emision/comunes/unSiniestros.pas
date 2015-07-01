unit unSiniestros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmSiniestros = class(TfrmCustomConsulta)
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FContrato: Integer;
    FPeriodo: String;
  public
    property Contrato: Integer     read FContrato       write FContrato;
    property Periodo: String       read FPeriodo        write FPeriodo;
  end;

var
  frmSiniestros: TfrmSiniestros;

implementation

uses unArt, AnsiSql, SqlFuncs, General;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmSiniestros.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT * ' +
            'FROM CNS_SINIESTROS ' +
           'WHERE 1=1 ';

  if FContrato <> ART_EMPTY_ID then
    begin
      sWhere := sWhere + ' AND AFILIACION.GET_CONTRATOVIGENTE(SS_CUIT, SS_FACCIDENTE)=' + SqlValue(FContrato);
      sWhere := sWhere + ' AND SS_CUIT=AFILIACION.GET_CUITEMPRESA(' + SqlValue(FContrato) + ') ';
    end;

  if FPeriodo <> '' then
    sWhere := sWhere + ' AND SS_FACCIDENTE BETWEEN UTILES.PERIODO_PRIMERDIA(' + SqlValue(FPeriodo) + ') AND UTILES.PERIODO_ULTIMODIA(' + SqlValue(FPeriodo) + ')';

  sdqConsulta.SQL.Text := sSql + sWhere + NVL(SortDialog.OrderBy, 'ORDER BY SS_SINIESTRO, SS_ORDEN, SS_RECAIDA');

  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSiniestros.FormCreate(Sender: TObject);
begin
  FContrato := ART_EMPTY_ID;
  FPeriodo  := '';

  inherited;
end;
{-------------------------------------------------------------------------------}
end.
