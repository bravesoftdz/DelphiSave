unit unManUsuariosCasosMortales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmUsuariosCasosMortales = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraUsuarios: TfraCodigoDescripcion;
    Label2: TLabel;
    fraSector: TfraCodigoDescripcion;
    GroupBox1: TGroupBox;
    fraUsuariosFiltro: TfraCodigoDescripcion;
    GroupBox2: TGroupBox;
    fraSectorFiltro: TfraCodigoDescripcion;
    rgVerBajas: TRadioGroup;
    sdqConsultaUM_ID: TFloatField;
    sdqConsultaUM_USUARIO: TStringField;
    sdqConsultaSM_DESCRIPCION: TStringField;
    sdqConsultaUM_USUBAJA: TStringField;
    sdqConsultaUM_FECHABAJA: TDateTimeField;
    ShortCutControl1: TShortCutControl;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuariosCasosMortales: TfrmUsuariosCasosMortales;

implementation

{$R *.dfm}

uses unDmPrincipal, SqlFuncs, unSesion, CustomDlgs;

procedure TfrmUsuariosCasosMortales.FormCreate(Sender: TObject);
begin
  inherited;

  with fraUsuarios do
  begin
    TableName := 'art.use_usuarios';
    FieldID := 'SE_ID';
    FieldCodigo := 'se_usuario';
    FieldDesc := 'se_nombre';
    FieldBaja := 'Se_FECHABAJA';
    ShowBajas := false;
    ExtraCondition := ' AND se_usuariogenerico = ''N''';
  end;

  with fraSector do
  begin
    TableName := 'din.dsm_sectoresmortales';
    FieldID := 'SM_ID';
    FieldCodigo := 'SM_CODIGO';
    FieldDesc := 'SM_DESCRIPCION';
    FieldBaja := 'SM_FECHABAJA';
    ShowBajas := false;
  end;

  with fraUsuariosFiltro do
  begin
    TableName := 'art.use_usuarios';
    FieldID := 'SE_ID';
    FieldCodigo := 'se_usuario';
    FieldDesc := 'se_nombre';
    FieldBaja := 'se_FECHABAJA';
    ShowBajas := false;
    ExtraCondition := ' AND se_usuariogenerico = ''N''';
  end;

  with fraSectorFiltro do
  begin
    TableName := 'din.dsm_sectoresmortales';
    FieldID := 'SM_ID';
    FieldCodigo := 'SM_CODIGO';
    FieldDesc := 'SM_DESCRIPCION';
    FieldBaja := 'SM_FECHABAJA';
    ShowBajas := false;
  end;

  FieldBaja := 'um_fechabaja';
end;

procedure TfrmUsuariosCasosMortales.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraUsuariosFiltro.Clear;
  fraSectorFiltro.Clear;
  rgVerBajas.ItemIndex := 1;
end;

procedure TfrmUsuariosCasosMortales.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql := 'SELECT um_id, um_usuario, sm_descripcion, um_usubaja, um_fechabaja ' +
          '  FROM din.dum_usuariosmortales, din.dsm_sectoresmortales' +
          ' WHERE um_idsector = sm_id';

  if not fraUsuariosFiltro.IsEmpty then
    ssql := ssql + ' AND um_usuario = ' + QuotedStr(fraUsuariosFiltro.Codigo);

  if not fraSectorFiltro.IsEmpty then
    ssql := ssql + ' AND um_idsector = ' + fraSectorFiltro.Id;

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND um_fechabaja IS NOT NULL ';
    1: ssql := ssql + ' AND um_fechabaja IS NULL ';
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

function TfrmUsuariosCasosMortales.Validar : Boolean;
begin
  Verificar(fraUsuarios.IsEmpty, fraUsuarios, 'Debe completar este campo');
  Verificar(fraSector.IsEmpty, fraSector, 'Debe completar este campo');
  Verificar((ModoABM = maAlta) and (ExisteSqlEx('SELECT 1 FROM din.dum_usuariosmortales' +
                                                ' WHERE um_usuario = :cod ' +
                                                '   AND um_idsector = :idtipo ' +
                                                '   AND um_fechabaja IS NULL', [fraUsuarios.Codigo, fraSector.ID])),
                                    fraSector, 'El código ingresado ya existe');

  Validar := True;
end;

procedure TfrmUsuariosCasosMortales.ClearControls;
begin
  fraUsuarios.Clear;
  fraSector.Clear;
end;


function TfrmUsuariosCasosMortales.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'din.dum_usuariosmortales';
    case ModoABM of
      maAlta:
      begin
        SqlType := stInsert;
        // PrimaryKey.Add('ML_ID', 'SEQ_ML_ID.NEXTVAL', False);
        Fields.Add('UM_USUALTA', Sesion.UserID);
        Fields.Add('UM_FECHAALTA', exDate);
        Fields.Add('UM_USUARIO', FraUsuarios.Codigo);
        Fields.Add('UM_IDSECTOR', fraSector.ID);
      end;
      {maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('ML_ID', sdqConsulta.FieldByName('ML_ID').AsInteger, False);
        Fields.Add('ML_USUMODIF', Sesion.UserID);
        Fields.Add('ML_FECHAMODIF', exDate);
        Fields.Add('ML_DESCRIPCION', edDescripcion.Text);
        Fields.Add('ML_IDTIPOCASO', fraTipoLiquidacionABM.ID);
        Fields.Add('ML_USUBAJA', '');
        Fields.Add('ML_FECHABAJA', '');
      end; }
      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('UM_ID', sdqConsulta.FieldByName('UM_ID').AsInteger, False);
        Fields.Add('UM_USUBAJA', Sesion.UserID);
        Fields.Add('UM_FECHABAJA', exDate);
      end;
    end;

    Result := inherited DoABM;

  end;
end;

procedure TfrmUsuariosCasosMortales.LoadControls;
begin
  {edCodigo.Text := sdqConsulta.FieldByName('codigo').AsString;
  fraTipoLiquidacionABM.Value := sdqConsulta.FieldByName('ml_idtipocaso').AsInteger;
  edDescripcion.Text := sdqConsulta.FieldByName('motivo').AsString;}
end;

end.
