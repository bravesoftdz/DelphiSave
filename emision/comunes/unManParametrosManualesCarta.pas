unit unManParametrosManualesCarta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unManParametrosManuales, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unDmprincipal;

type
  TfrmManParametrosManualesCarta = class(TfrmManParametrosManuales)
    procedure FormCreate(Sender: TObject);
  private
    FIdTextoCarta: integer;
    procedure SetIdTextoCarta(const Value: integer);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property IdTextoCarta: integer read FIdTextoCarta write SetIdTextoCarta;
  end;

var
  frmManParametrosManualesCarta: TfrmManParametrosManualesCarta;

implementation

uses
  unCustomConsulta, CustomDlgs, unSesion, SqlFuncs;

{$R *.dfm}

{ TfrmManParametrosManualesCarta }

procedure TfrmManParametrosManualesCarta.ClearControls;
begin
  inherited;
  edNombre.Clear;
  edValorDefecto.Clear;
  chkObligatorio.Checked := false;
end;

function TfrmManParametrosManualesCarta.DoABM: Boolean;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('cp_id', sdqConsulta.FieldByName('cp_id').AsInteger);
      Sql.Fields.Add('cp_usubaja', Sesion.UserID );
      Sql.Fields.Add('cp_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('cp_idtextocarta', FIdTextoCarta);
      Sql.Fields.Add('cp_nombre', edNombre.Text);
      Sql.Fields.Add('cp_valordefecto', edValorDefecto.Text);
      if chkObligatorio.Checked then
        Sql.Fields.Add('cp_obligatorio', 'S')
      else
        Sql.Fields.Add('cp_obligatorio', 'N');

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.AddExpression('cp_id', 'COMUNES.SEQ_CCP_CARTAPARAMETRO.NEXTVAL' );
        Sql.Fields.Add('cp_usualta', Sesion.UserID );
        Sql.Fields.Add('cp_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('cp_id', sdqConsulta.FieldByName('cp_id').AsInteger);
        Sql.Fields.Add('cp_usumodif', Sesion.UserID);
        Sql.Fields.Add('cp_fechamodif', exDateTime );
        Sql.Fields.Add('cp_usubaja', exNull );
        Sql.Fields.Add('cp_fechabaja', exNull );
      end;
    end;
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el parámetro.');
    end;
  end;
end;

procedure TfrmManParametrosManualesCarta.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'COMUNES.CCP_CARTAPARAMETRO';
  FieldBaja     := 'CP_FECHABAJA';
end;

procedure TfrmManParametrosManualesCarta.LoadControls;
begin
  inherited;
  edNombre.Text := sdqConsulta.FieldByName('CP_NOMBRE').AsString;
  edValorDefecto.Text := sdqConsulta.FieldByName('CP_VALORDEFECTO').AsString;
  chkObligatorio.Checked := sdqConsulta.FieldByName('CP_OBLIGATORIO').AsString = 'S';
end;

procedure TfrmManParametrosManualesCarta.SetIdTextoCarta(
  const Value: integer);
begin
  FIdTextoCarta := Value;
  sdqConsulta.ParamByName('idtextocarta').AsInteger := FIdTextoCarta;
  RefreshData;
end;

function TfrmManParametrosManualesCarta.Validar: Boolean;
begin
  Verificar(trim(edNombre.Text)= '', edNombre, 'Debe ingresar un nombre.');
  Verificar(Pos(' ', edNombre.Text) > 0, edNombre, 'El nombre no puede tener espacios.');
  Result := true;
end;

end.
