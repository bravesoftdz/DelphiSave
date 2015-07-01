unit unGastosEstructura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit,
  CurrEdit, Mask, PatternEdit, IntEdit;

type
  TfrmGastosEstructura = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edSector: TIntEdit;
    edRangoCIIU: TIntEdit;
    edPorcentaje: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmGastosEstructura: TfrmGastosEstructura;

implementation

uses
  CustomDlgs, unDmPrincipal, AnsiSql, unSesion, SqlFuncs;

{$R *.DFM}

function TfrmGastosEstructura.DoABM: Boolean;
var
  iGastoId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'ags_gastoestructura';

  iGastoId := sdqConsulta.FieldByName('gs_id').AsInteger;

  if ModoABM = maBaja then
  begin
    ModoABM := maModificacion;
    ModoABMToSqlType;

    Sql.PrimaryKey.Add('gs_id',    iGastoId, False);
    Sql.Fields.Add('gs_usubaja',   Sesion.UserID);
    Sql.Fields.Add('gs_fechabaja', SQL_DATETIME, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      iGastoId := ValorSqlInteger('SELECT seq_ags_id.NEXTVAL FROM DUAL', 0);

      Sql.Fields.Add('gs_usualta',   Sesion.UserID);
      Sql.Fields.Add('gs_fechaalta', SQL_DATETIME, False);
    end;
    if ModoABM = maModificacion then
    begin
      Sql.Fields.Add('gs_usumodif',   Sesion.UserID);
      Sql.Fields.Add('gs_fechamodif', SQL_DATETIME, False);
    end;

    Sql.PrimaryKey.Add('gs_id',     iGastoId, False);
    Sql.Fields.Add('gs_sector',     edSector.Value, dtNumber);
    Sql.Fields.Add('gs_rangociiu',  edRangoCIIU.Value, dtNumber);
    Sql.Fields.Add('gs_porcentaje', edPorcentaje.Value, dtNumber);
  end;

  Result := inherited DoABM;
end;

function TfrmGastosEstructura.Validar: Boolean;
var
  iId: Integer;
  sSql: String;
begin
  Verificar(edSector.IsEmpty, edSector, 'Campo sector es obligatorio.');
  Verificar(edRangoCIIU.IsEmpty, edRangoCIIU, 'Campo combinación rango - CIIU es obligatorio.');
  Verificar((edPorcentaje.Value > 100), edPorcentaje, 'El porcentaje no puede ser superior 100.');

  iId := -1;
  if ModoABM = maModificacion then
    iId := sdqConsulta.FieldByName('gs_id').AsInteger;

  sSql :=
    'SELECT 1' +
     ' FROM ags_gastoestructura' +
    ' WHERE gs_sector = :sector' +
      ' AND gs_rangociiu = :rangociiu' +
      ' AND gs_id <> :id';
  Verificar(ExisteSqlEx(sSql, [edSector.Value, edRangoCIIU.Value, iId]), edRangoCIIU, Format('Esa combinación rango - CIIU ya existe para el sector %d', [edSector.Value]));

  Result := True;
end;


procedure TfrmGastosEstructura.ClearControls;
begin
  edSector.Clear;
  edRangoCIIU.Clear;
  edPorcentaje.Clear;

  // Esto queda fijo, por ahora solo se pueden cargar registros con sector = 4..
  edSector.Value := 4;
end;

procedure TfrmGastosEstructura.LoadControls;
begin
  with sdqConsulta do
  begin
    edSector.Value     := FieldByName('gs_sector').AsInteger;
    edRangoCIIU.Value  := FieldByName('gs_rangociiu').AsInteger;
    edPorcentaje.Value := FieldByName('gs_porcentaje').AsFloat;
  end;
end;

procedure TfrmGastosEstructura.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'gs_fechabaja';
end;

procedure TfrmGastosEstructura.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('gs_fechabaja').IsNull, Grid, 'Ese registro está dado de baja.');

  inherited;
end;

end.
