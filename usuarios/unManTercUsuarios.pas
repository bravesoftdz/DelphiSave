unit unManTercUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArtDBAwareFrame, unFraCodigoDescripcion,
  unArtFrame, unfraUsuarios;

type
  TfrmManTercUsuarios = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraUsuario: TfraUsuario;
    GroupBox2: TGroupBox;
    fraTercerizadora: TfraCodigoDescripcion;
    GroupBox4: TGroupBox;
    fraTercerizadoraFiltro: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    function ExisteRelacionUsuarioTerce: Boolean;
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmManTercUsuarios: TfrmManTercUsuarios;

implementation

uses SqlFuncs, unSesion, unDmPrincipal, unART, CustomDlgs, VCLExtra, AnsiSql;
{$R *.dfm}

procedure TfrmManTercUsuarios.ClearControls;
begin
  inherited;
  fraUsuario.Clear;
  fraTercerizadora.Clear;
end;

function TfrmManTercUsuarios.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'AMED.mut_usuario_tercerizadora';

  try
    if ModoABM = maBaja then
    begin
     Sql.PrimaryKey.Add('UT_ID', sdqConsulta.FieldByName('UT_ID').AsInteger);
     Sql.Fields.Add('UT_FECHABAJA', exDate);
     Sql.Fields.Add('UT_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
    end
    else if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('UT_ID', ValorSQLInteger('SELECT MAX(UT_ID) + 1 FROM AMED.mut_usuario_tercerizadora'), False);
      Sql.Fields.Add('UT_FECHAALTA', exDateTime);
      Sql.Fields.Add('UT_USUALTA', Sesion.UserID);
      Sql.Fields.Add('UT_IDTERCERIZADORA', fraTercerizadora.Codigo);
      Sql.Fields.Add('UT_USUARIO', fraUsuario.edCodigo.Text);
      Sql.SqlType := stInsert;
    end;

    Result := inherited DoABM;

  except
    on E:Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al guardar los datos.');
  end;
end;

procedure TfrmManTercUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  with fraTercerizadora do
  begin
    TableName      := 'amed.mtm_tercerizadora_medica';
    FieldID        := 'tm_id';
    FieldCodigo    := 'tm_id';
    FieldDesc      := 'tm_nombre';
    ExtraCondition := ' and ((tm_vigenciahasta is null) or (tm_vigenciahasta >= art.actualdate)) ';
  end;
  with fraTercerizadoraFiltro do
  begin
    TableName      := 'amed.mtm_tercerizadora_medica';
    FieldID        := 'tm_id';
    FieldCodigo    := 'tm_id';
    FieldDesc      := 'tm_nombre';
    ExtraCondition := ' and ((tm_vigenciahasta is null) or (tm_vigenciahasta >= art.actualdate)) ';
  end;

  tbModificar.Visible := False;
end;

procedure TfrmManTercUsuarios.LoadControls;
begin
  inherited;
  fraUsuario.edCodigo.Text := sdqConsulta.FieldByName('UT_USUARIO').AsString;
  fraTercerizadora.Codigo  := sdqConsulta.FieldByName('UT_IDTERCERIZADORA').AsString;
end;

procedure TfrmManTercUsuarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTercerizadoraFiltro.Clear;
end;

procedure TfrmManTercUsuarios.tbRefrescarClick(Sender: TObject);
var
  sSql : string;
begin
  sdqConsulta.SQL.Clear;
  sSql := 'SELECT ut_id, ut_idtercerizadora, tm_nombre, ut_usuario, se_nombre, ut_fechabaja, ut_usubaja, ' +
                ' ut_fechaalta, ut_usualta ' +
           ' FROM amed.mut_usuario_tercerizadora, AMED.mtm_tercerizadora_medica, art.use_usuarios ' +
          ' WHERE ut_idtercerizadora = tm_id ' +
            ' AND se_usuario(+) = ut_usuario ' +
            ' AND ut_fechabaja is null ';

  if not fraTercerizadoraFiltro.IsEmpty then
    sSql := sSql + ' AND ut_idtercerizadora = ' + SqlInt(fraTercerizadoraFiltro.Codigo);

  sdqConsulta.SQL.Add(sSql);
  inherited;
end;

function TfrmManTercUsuarios.Validar: Boolean;
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario, 'Debe completar el Usuario.');
  Verificar(fraTercerizadora.IsEmpty, fraTercerizadora, 'Debe completar la Empresa Tercerizadora.');
  Verificar(ExisteRelacionUsuarioTerce, fraUsuario, 'Este usuario ya existe para esta empresa Tercerizadora');
  Result := True;
end;

function TfrmManTercUsuarios.ExisteRelacionUsuarioTerce: Boolean;
var sSql: string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM amed.mut_usuario_tercerizadora ' +
          ' WHERE ut_usuario = ' + SqlValue(fraUsuario.edCodigo.Text) +
            ' AND ut_idtercerizadora = ' + SqlInt(fraTercerizadora.Codigo) +
            ' AND ut_fechabaja is null ';
  Result := ExisteSql(sSql);
end;

end.
