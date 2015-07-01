unit unHistoricoCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArt, unSesion;

type
  TfrmHistoricoCheques = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
  private
    FIdCheque: TTableId;
    procedure SetIdCheque(const Value: TTableId);
  public
    property IdCheque: TTableId     read FIdCheque     write SetIdCheque;
  end;

var
  frmHistoricoCheques: TfrmHistoricoCheques;

implementation
{$R *.dfm}

uses
  AnsiSql;

procedure TfrmHistoricoCheques.SetIdCheque(const Value: TTableId);
begin
  if FIdCheque <> Value then
    begin
      FIdCheque := Value;
      tbRefrescarClick(nil);
    end;
end;

procedure TfrmHistoricoCheques.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT TB_DESCRIPCION SITUACION, HE_FECHASITUACION FECHA_SITUACION, ' +
                 'SE_NOMBRE USUARIO, HE_FECHACARGASITUACION FECHA_CARGASITUACION, ' +
                 'HE_NROLISTADODELEGACION NROLISTADODELEGACION, HE_FECHADEBITADO FECHADEBITADO ' +
            'FROM ART.USE_USUARIOS, ART.CTB_TABLAS, RHE_HISTORICOESTADOCHEQUE ' +
           'WHERE HE_SITUACION = TB_CODIGO ' +
             'AND TB_CLAVE = ''SITCH'' ' +
             'AND HE_USUSITUACION = SE_USUARIO(+) ' +
             'AND HE_IDCHEQUE = ' +  SqlValue(IdCheque) + ' ' +
             'AND (TB_ESPECIAL2 = ''D'' OR TB_ESPECIAL1 = ''D'' OR ' + SqlValue(Sesion.Sector) + ' IN (''TESO'', ''AUDIT''))';     // Tesorería / Auditoría

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy ;
  inherited;
end;

end.


