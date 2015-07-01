unit unManCTB_CUBIC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unManCtbTablas, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, Mask, PatternEdit, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraDelegacion;

type
  TfrmManCTB_CUBIC = class(TfrmManCtbTablas)
    Label1: TLabel;
    fraDelegacion: TfraDelegacion;
    procedure FormCreate(Sender: TObject);
 protected
    function DoABM: Boolean; override;
    function GetSql: String; override;
    procedure LoadControls; override;
    procedure DoABMAddFields; override;
  end;



var
  frmManCTB_CUBIC: TfrmManCTB_CUBIC;

implementation

{$R *.dfm}

function TfrmManCTB_CUBIC.DoABM: Boolean;
begin
  Result := inherited DoABM;
end;

procedure TfrmManCTB_CUBIC.DoABMAddFields;
begin
  inherited;
  if not fraDelegacion.IsEmpty then
    Sql.Fields.Add('TB_ESPECIAL1', fraDelegacion.edCodigo.Text)
  else
    Sql.Fields.Add('TB_ESPECIAL1', '');
end;

procedure TfrmManCTB_CUBIC.FormCreate(Sender: TObject);
begin
  inherited;
  Clave := 'CUBIC';
end;

function TfrmManCTB_CUBIC.GetSql: String;
var
  sSql: String;
begin
//  Result := inherited GetSQL;
//  sSql := sdqConsulta.SQL.Text;
  sSql := ' SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, TB_ESPECIAL1, TB_ESPECIAL2, TB_BAJA, EL_NOMBRE DELEGACION ' +
            ' FROM CTB_TABLAS, DEL_DELEGACION ' +
           ' WHERE TB_CLAVE = :pClave ' +
            ' AND (TB_MODULO = :pModulo OR :pModulo IS NULL) ' +
            ' AND TB_CODIGO <> ''0'' ' +
            ' AND EL_ID(+) = TB_ESPECIAL1 ';
  Result := sSql;
end;


procedure TfrmManCTB_CUBIC.LoadControls;
begin
  inherited;
  fraDelegacion.Value := sdqConsulta.FieldByName('TB_ESPECIAL1').AsString;
end;

end.
