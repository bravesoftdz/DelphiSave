unit unHistoricoDocumentacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, unArt;

type
  TfrmHistoricoDocumentacion = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
  private
    FIdDocRecibida: TTableId;
    procedure SetIdDocRecibida(const Value: TTableId);
  protected
    procedure RefreshData; override;
  public
    property IdDocRecibida: TTableId    read FIdDocRecibida    write SetIdDocRecibida;
  end;

var
  frmHistoricoDocumentacion: TfrmHistoricoDocumentacion;

implementation

uses
  General;

{$R *.dfm}

procedure TfrmHistoricoDocumentacion.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT HD_ID, USE_DER.SE_NOMBRE USE_DER, TRUNC(HD_FECHADERIVACION) FECHADERIVACION, ' +
                 'HD_FECHARECEPCION, USE_REC.SE_NOMBRE USE_REC, USE_ALTA.SE_NOMBRE USE_ALTA, ' +
                 'HD_FECHAALTA, HD_USUALTA ' +
            'FROM USE_USUARIOS USE_ALTA, USE_USUARIOS USE_DER, USE_USUARIOS USE_REC, COMUNES.CHD_HISTORICODOCUMENTCRECIBIDA ' +
           'WHERE HD_IDDOCUMENTACIONRECIBIDA = :IdDocRecibida ' +
             'AND HD_DERIVADOA = USE_DER.SE_USUARIO(+) ' +
             'AND HD_USURECEPCION = USE_REC.SE_USUARIO(+) ' +
             'AND HD_USUALTA = USE_ALTA.SE_USUARIO(+) ';

  sdqConsulta.Sql.Text := sSql + NVL(SortDialog.OrderBy, ' ORDER BY HD_ID');
  inherited;
end;

procedure TfrmHistoricoDocumentacion.SetIdDocRecibida(const Value: TTableId);
begin
  if FIdDocRecibida <> Value then
    begin
      FIdDocRecibida := Value;

      sdqConsulta.ParamByName('IdDocRecibida').AsInteger := FIdDocRecibida;
      RefreshData;
    end;
end;

end.

