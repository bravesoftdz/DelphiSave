unit unManUsuariosMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, JvgGroupBox, JvExExtCtrls,
  JvNavigationPane, unArtFrame, unfraUsuarios, unDmPrincipal,SqlFuncs,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraSectores, unFraCodDesc;

type
  TfrmManUsuariosMantenimiento = class(TfrmCustomGridABM)
    dbJefes: TArtDBGrid;
    dsJefes: TDataSource;
    fraUsuario: TfraCodigoDescripcion;
    gbJefe: TJvgGroupBox;
    JvOutlookSplitter1: TJvOutlookSplitter;
    Label1: TLabel;
    lbUsuario: TLabel;
    sdqJefes: TSDQuery;
    sdqJefesID: TFloatField;
    sdqJefesNombre: TStringField;
    sdqJefesUsuario: TStringField;
    ShortCutControl1: TShortCutControl;
    fraSE_IDSECTOR: TfraCodDesc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FSQL: String;
  public
    procedure ClearControls; override;
    procedure ClearData; override; 
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
    function  Validar: Boolean; override;
  end;

var
  frmManUsuariosMantenimiento: TfrmManUsuariosMantenimiento;

implementation

uses
  unSesion, CustomDlgs, AnsiSql, VclExtra, unCustomConsulta, unFiltros;

{$R *.dfm}
  
procedure TfrmManUsuariosMantenimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if sdqJefes.Active then
    sdqJefes.Close;
end;

procedure TfrmManUsuariosMantenimiento.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
  FieldBaja := 'ex_fechabaja';
  with fraUsuario do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'se_ID';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'se_nombre';
    FieldBaja := 'se_fechabaja';
    Showbajas   := False;
    ExtraCondition := ' AND computos.general.get_usuarioautorizado(se_id, 1) = 0 '+
                      ' AND se_usuariogenerico = ''N'' ';
  end;
  sdqJefes.Open;
end;

procedure TfrmManUsuariosMantenimiento.ClearControls;
begin
  inherited;
  fraUsuario.Clear;
  vclExtra.LockControls([fraUsuario], False);
end;

procedure TfrmManUsuariosMantenimiento.ClearData;
begin
  inherited;
  fraSE_IDSECTOR.Clear;
end;

function TfrmManUsuariosMantenimiento.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'intra.oex_excepcion';

  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('ex_id', sdqConsulta.FieldByName('ex_id').AsInteger, False);
      Sql.Fields.Add('ex_fechabaja', exDateTime);
      Sql.Fields.Add('ex_usubaja', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end else
    begin
      if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Add('EX_ID', GetSecNextVal('INTRA.SEQ_OEX_ID'), False);
          Sql.Fields.Add('EX_USUARIO', fraUsuario.Codigo);
          Sql.Fields.Add('EX_FECHAALTA', exDateTime);
          Sql.Fields.Add('EX_USUALTA', Sesion.UserID);
          Sql.SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.AddInteger('ex_id', sdqConsulta.FieldByName('ex_id').AsInteger,False);
          Sql.Fields.Add('ex_fechamodif', exDateTime);
          Sql.Fields.Add('ex_usumodif', Sesion.UserID);
          Sql.Fields.Add('ex_fechabaja', exNull);
          Sql.Fields.Add('ex_usubaja', exNull);
          Sql.SqlType := stUpdate;
        end;
    end;

    Result := inherited DoABM;
  except
    on E:Exception do
      raise Exception.Create(E.Message + 'Error al grabar el Usuario.');
  end;
end;

procedure TfrmManUsuariosMantenimiento.LoadControls;
begin
  inherited;
  ClearControls;
  fraUsuario.Codigo := sdqConsulta.FieldByName('ex_usuario').AsString;
  VCLExtra.LockControls([fraUsuario], True);
end;

procedure TfrmManUsuariosMantenimiento.RefreshData;
var
  sSQL: string;
begin
  sSQL := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  sdqConsulta.SQL.Text := sSQL;
  inherited;

  if sdqJefes.Active then
    sdqJefes.Refresh
  else
    sdqJefes.Open;
end;

function TfrmManUsuariosMantenimiento.Validar: Boolean;
begin
  if ModoABM = maAlta then
    Verificar(ExisteSqlEx('SELECT 1 FROM intra.oex_excepcion WHERE ex_usuario = :usuario', [fraUsuario.Codigo]),
              fraUsuario, 'Ya existe el usuario en excepciones.');
  Result := True;
end;

end.
