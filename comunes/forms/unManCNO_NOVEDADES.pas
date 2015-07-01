unit unManCNO_NOVEDADES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, CheckLst, ARTCheckListBox,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc,
  Menus;

type
  TfrmManCNO_NOVEDADES = class(TfrmCustomGridABM)
    edNO_DESCRIPCION: TMemo;
    Label1: TLabel;
    clbEjecutables: TARTCheckListBox;
    sdqConsultaEJ_ACTIVO: TStringField;
    sdqConsultaEJ_DESCRIPCION: TStringField;
    sdqConsultaNO_FECHA: TDateTimeField;
    sdqConsultaNO_DESCRIPCION: TStringField;
    sdqConsultaNO_ID: TFloatField;
    sdqConsultaNO_IDEJECUTABLE: TFloatField;
    Label2: TLabel;
    fraNO_IDEJECUTABLE: TfraCodDesc;
    pmuPopUp: TPopupMenu;
    mnuSeleccionarTodos: TMenuItem;
    mnuNoSeleccionarNinguno: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure mnuSeleccionarTodosClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunoClick(Sender: TObject);
    procedure clbEjecutablesClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  public
    procedure RefreshData; override;
    procedure ClearData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    function  DoABM: Boolean; override;
  end;

var
  frmManCNO_NOVEDADES: TfrmManCNO_NOVEDADES;

implementation

uses unPrincipal, Math, CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal,
  General, unArt, VCLExtra;

{$R *.dfm}

procedure TfrmManCNO_NOVEDADES.ClearControls;
begin
  fraNO_IDEJECUTABLE.Clear;
  edNO_DESCRIPCION.Clear;
end;

function TfrmManCNO_NOVEDADES.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'COMUNES.CNO_NOVEDADES';

  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('NO_ID', sdqConsulta.FieldByName('NO_ID').AsInteger, False);
      Sql.SqlType := stDelete;
    end else
    begin
      if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Add('NO_ID', ValorSQLInteger('SELECT MAX(NO_ID) + 1 FROM COMUNES.CNO_NOVEDADES'), False);
{
          Sql.Fields.Add('NO_FECHAALTA', exDateTime);
          Sql.Fields.Add('NO_USUALTA', Sesion.UserID);
}
          Sql.SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.Add('NO_ID', sdqConsulta.FieldByName('NO_ID').AsInteger, False);
{
          Sql.Fields.Add('NO_FECHAMODIF', exDateTime);
          Sql.Fields.Add('NO_USUMODIF', Sesion.UserID);
}
          Sql.SqlType := stUpdate;
        end;


      Sql.Fields.AddExpression('NO_FECHA', exDateTime);
      Sql.Fields.Add('NO_DESCRIPCION', edNO_DESCRIPCION.Lines.Text);
      Sql.Fields.Add('NO_IDEJECUTABLE', fraNO_IDEJECUTABLE.VariantValue, dtNumber);      
    end;

    Result := inherited DoABM;
  except
    on E:Exception do
      Raise Exception.Create( E.Message + CRLF + 'Error al grabar la novedad.' );
  end;
end;

procedure TfrmManCNO_NOVEDADES.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  inherited;
  clbEjecutables.UncheckAll;
end;

procedure TfrmManCNO_NOVEDADES.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsultaEJ_ACTIVO.AsString = 'N' then
    AFont.Color := clPurple;
end;

procedure TfrmManCNO_NOVEDADES.LoadControls;
begin
  fraNO_IDEJECUTABLE.Codigo := sdqConsultaNO_IDEJECUTABLE.AsString;
  edNO_DESCRIPCION.Text := sdqConsultaNO_DESCRIPCION.AsString;
end;

procedure TfrmManCNO_NOVEDADES.RefreshData;
var
  sSQL: String;
begin
  sSQL := FSQL;

  if clbEjecutables.CheckCount > 0 then
    sSQL := sSQL + clbEjecutables.InSQL_IntegerValues('EJ_ID');

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
end;

function TfrmManCNO_NOVEDADES.Validar: Boolean;
begin
  Verificar(fraNO_IDEJECUTABLE.IsEmpty, fraNO_IDEJECUTABLE.edCodigo, 'Debe indicar el ejecutable.');
  Verificar(Trim(edNO_DESCRIPCION.Text) = '', edNO_DESCRIPCION, 'Debe indicar el texto de la novedad.');
  Result := True;
end;

procedure TfrmManCNO_NOVEDADES.btnAceptarClick(Sender: TObject);
begin
  if (ModoABM = maModificacion) then
  begin
    if not MsgAsk('Se mostrará esta novedad a todos los usuarios de la empresa, sin importar si ya la vieron previamente.' + CRLF + '¿Está seguro que desea continuar?') then
      Abort;
  end;

  inherited;
end;

procedure TfrmManCNO_NOVEDADES.mnuSeleccionarTodosClick(Sender: TObject);
begin
  clbEjecutables.CheckAll;
  RefreshData;
end;

procedure TfrmManCNO_NOVEDADES.mnuNoSeleccionarNingunoClick(Sender: TObject);
begin
  clbEjecutables.UncheckAll;
  RefreshData;
end;

procedure TfrmManCNO_NOVEDADES.ClearData;
begin
  clbEjecutables.UncheckAll;
end;

procedure TfrmManCNO_NOVEDADES.clbEjecutablesClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmManCNO_NOVEDADES.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  try
    DynColWidthsByData(DBGrid);
  except
  end;
end;

end.
