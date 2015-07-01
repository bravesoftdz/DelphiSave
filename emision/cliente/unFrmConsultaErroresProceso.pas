unit unFrmConsultaErroresProceso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, ExtCtrls, JvExExtCtrls, JvNetscapeSplitter,
  StdCtrls, DBCtrls, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TFrmConsultaErroresProceso = class(TfrmCustomConsulta)
    DBMemo1: TDBMemo;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    FIdProceso : Integer;
  public
    { Public declarations }
    procedure ConsultaProceso(AIdProceso : Integer);
  end;

var
  FrmConsultaErroresProceso: TFrmConsultaErroresProceso;



implementation

uses unDmEmision, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs , General, StrFuncs;

{$R *.dfm}

{ TFrmConsultaErroresProceso }

procedure TFrmConsultaErroresProceso.ConsultaProceso(AIdProceso: Integer);
begin
  FIdProceso := AIdProceso;
  tbRefrescarClick(self);
  Show;
end;

procedure TFrmConsultaErroresProceso.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text := 'select * from emi.tce_ddjjcabeceraerrores ' +
                          'where ce_idddjjcabeceraerrores = ' + SqlValue(FIdProceso);
  inherited;
end;

end.
