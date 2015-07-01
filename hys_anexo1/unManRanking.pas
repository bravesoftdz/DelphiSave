unit unManRanking;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql;

type
  TfrmManRanking = class(TfrmCustomGridABM)
    Label2: TLabel;
    edDescripcion: TEdit;
    procedure FormCreate(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManRanking: TfrmManRanking;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRanking.ClearControls;
begin
  edDescripcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRanking.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('RK_ID', sdqConsulta.FieldByName('RK_ID').AsInteger);
    Sql.Fields.Add('RK_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('RK_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('RK_DESCRIPCION', edDescripcion.Text);
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('RK_ID', GetSecNextVal('HYS.SEQ_HRK_ID') );
      Sql.Fields.Add('RK_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('RK_FECHALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('RK_ID', sdqConsulta.FieldByName('RK_ID').AsInteger );
      Sql.Fields.Add('RK_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('RK_FECHAMODIF', exDateTime );
      Sql.Fields.Add('RK_USUBAJA', exNull );
      Sql.Fields.Add('RK_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRanking.LoadControls;
begin
  edDescripcion.Text:= sdqConsulta.FieldByName('rk_descripcion').AsString
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRanking.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Tipo de Ranking',
                      edDescripcion, Trim(edDescripcion.Text) <> '', 'Debe ingresar la descripción']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRanking.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'RK_FECHABAJA';
  Sql.TableName := 'hys.hrk_ranking';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}

end.


