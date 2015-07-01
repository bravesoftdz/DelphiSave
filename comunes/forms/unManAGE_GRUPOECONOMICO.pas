unit unManAGE_GRUPOECONOMICO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManAGE_GRUPOECONOMICO = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edDescripcion: TEdit;
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManAGE_GRUPOECONOMICO: TfrmManAGE_GRUPOECONOMICO;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, unSesion;
  
{$R *.DFM}

{ TfrmManAGE_GRUPOECONOMICO }

procedure TfrmManAGE_GRUPOECONOMICO.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
end;

function TfrmManAGE_GRUPOECONOMICO.DoABM: Boolean;
var
  IDCentroReg: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'AGE_GRUPOECONOMICO';

  if ModoABM = maBaja then
  begin
    IDCentroReg := sdqConsulta.FieldByName('GE_ID').AsInteger;
    Sql.Fields.Add('GE_USUBAJA', Sesion.UserID);
    Sql.Fields.Add('GE_FECHABAJA', 'ACTUALDATE', False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      IDCentroReg := ValorSql('SELECT SEQ_AGE_ID.NEXTVAL FROM DUAL');
      Sql.Fields.Add('GE_USUALTA', Sesion.UserID);
      Sql.Fields.Add('GE_FECHAALTA', 'ACTUALDATE', False);
      Sql.Fields.Add('GE_TEMPORAL', 'T');
    end
    else
    begin  //modificacion
      IDCentroReg := sdqConsulta.FieldByName('GE_ID').AsInteger;
      Sql.Fields.Add('GE_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('GE_FECHAMODIF', 'ACTUALDATE', False);
      Sql.Fields.Add('GE_USUBAJA', 'NULL', False);
      Sql.Fields.Add('GE_FECHABAJA', 'NULL', False);
    end;
    Sql.Fields.Add('GE_CODIGO', edCodigo.Text);
    Sql.Fields.Add('GE_DESCRIPCION', edDescripcion.Text);
  end;
  Sql.PrimaryKey.Add('GE_ID', IDCentroReg, False);

  BeginTrans;
  try
    EjecutarSqlSt(Sql.Sql);
    result := True;
    CommitTrans;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManAGE_GRUPOECONOMICO.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('GE_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('GE_DESCRIPCION').AsString;
end;

function TfrmManAGE_GRUPOECONOMICO.Validar: Boolean;
begin
  Result := True;
  if edCodigo.Text = '' then
  begin
    InvalidMsg(edCodigo, 'El código del grupo económico es obligatorio.');
    Abort;
  end;
  if edDescripcion.Text = '' then
  begin
    InvalidMsg(edDescripcion, 'El nombre del grupo económico es obligatorio.');
    Abort;
  end;
end;

end.
