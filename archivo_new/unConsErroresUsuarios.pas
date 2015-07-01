unit unConsErroresUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmConsErroresUsuarios = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
    procedure RefreshData; override;
  end;

var
  frmConsErroresUsuarios: TfrmConsErroresUsuarios;

implementation

uses
  General;
  
{$R *.dfm}

procedure TfrmConsErroresUsuarios.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT TB_CODIGO CODIGO, TB_DESCRIPCION DESCR, TB_ESPECIAL1 MODORESOL ' +
            'FROM CTB_TABLAS ' +
           'WHERE TB_CLAVE = ''EUAGA'' ' +
             'AND TB_CODIGO <> ''0'' ' +
             'AND TB_FECHABAJA IS NULL';

  sdqConsulta.Sql.Text := sSql + nvl(SortDialog.OrderBy, ' ORDER BY CODIGO');
  inherited;
end;

procedure TfrmConsErroresUsuarios.FormCreate(Sender: TObject);
begin
  inherited;

  RefreshData;
end;

end.
 