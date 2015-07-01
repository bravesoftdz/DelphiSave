unit unManACR_CENTROREGIONAL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, StdCtrls, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManACR_CENTROREGIONAL = class(TfrmCustomGridABM)
    edCodigo: TEdit;
    Label1: TLabel;
    edDescripcion: TEdit;
    Label2: TLabel;
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManACR_CENTROREGIONAL: TfrmManACR_CENTROREGIONAL;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, unSesion;
  
{$R *.DFM}

{ TfrmCustomGridABM1 }

procedure TfrmManACR_CENTROREGIONAL.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
end;

function TfrmManACR_CENTROREGIONAL.DoABM: Boolean;
var
  IDCentroReg: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'ACR_CENTROREGIONAL';

  if ModoABM = maBaja then
  begin
    IDCentroReg := sdqConsulta.FieldByName('CR_ID').AsInteger;
    Sql.Fields.Add('CR_USUBAJA', Sesion.UserID);
    Sql.Fields.Add('CR_FECHABAJA', 'ACTUALDATE', False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      IDCentroReg := ValorSql('SELECT SEQ_ACR_ID.NEXTVAL FROM DUAL');
      Sql.Fields.Add('CR_USUALTA', Sesion.UserID);
      Sql.Fields.Add('CR_FECHAALTA', 'ACTUALDATE', False);
    end
    else
    begin  //modificacion
      IDCentroReg := sdqConsulta.FieldByName('CR_ID').AsInteger;
      Sql.Fields.Add('CR_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('CR_FECHAMODIF', 'ACTUALDATE', False);
      Sql.Fields.Add('CR_USUBAJA', 'NULL', False);
      Sql.Fields.Add('CR_FECHABAJA', 'NULL', False);
    end;
    Sql.Fields.Add('CR_CODIGO', edCodigo.Text);
    Sql.Fields.Add('CR_DESCRIPCION', edDescripcion.Text);
  end;
  Sql.PrimaryKey.Add('CR_ID', IDCentroReg, False);

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

procedure TfrmManACR_CENTROREGIONAL.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('CR_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('CR_DESCRIPCION').AsString;
end;

function TfrmManACR_CENTROREGIONAL.Validar: Boolean;
begin
  Verificar(edCodigo.Text = '', edCodigo, 'El código del centro regional es obligatorio.');
  Verificar(edDescripcion.Text = '', edDescripcion, 'El nombre del centro regional es obligatorio.');
  
  Result := True;
end;

end.
