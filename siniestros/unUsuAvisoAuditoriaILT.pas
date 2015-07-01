unit unUsuAvisoAuditoriaILT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, Vcl.StdCtrls,
  unArtDBAwareFrame, unFraCodigoDescripcion, unArtFrame, unfraUsuarios,
  FieldHider, ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, customdlgs, undmprincipal, unSesion, sqlfuncs;

type
  TfrmUsuAvisoAuditoriaILT = class(TfrmCustomGridABM)
    fraUsuario: TfraUsuario;
    fraMotivo: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    gbUsuario: TGroupBox;
    fraUsuarioFiltro: TfraUsuario;
    gbMotivo: TGroupBox;
    fraMotivoFiltro: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    sdqConsultaUA_ID: TFloatField;
    sdqConsultaUA_USUARIO: TStringField;
    sdqConsultaMA_CODIGO: TStringField;
    sdqConsultaMA_DESCRIPCION: TStringField;
    sdqConsultaUA_FECHABAJA: TDateTimeField;
    procedure ClearControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuAvisoAuditoriaILT: TfrmUsuAvisoAuditoriaILT;

implementation

{$R *.dfm}

uses VCLExtra;

procedure TfrmUsuAvisoAuditoriaILT.FormCreate(Sender: TObject);
begin
  inherited;

  with fraMotivo do
  begin
    TableName := 'din.dma_motivoauditoria';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_CODIGO';
    FieldDesc := 'MA_DESCRIPCION';
    FieldBaja := 'MA_FECHABAJA';
  end;

  fraUsuario.UsuariosGenericos := false;
  fraUsuarioFiltro.UsuariosGenericos := false;

  with fraMotivoFiltro do
  begin
    TableName := 'din.dma_motivoauditoria';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_CODIGO';
    FieldDesc := 'MA_DESCRIPCION';
    FieldBaja := 'MA_FECHABAJA';
  end;

  FieldBaja := 'ua_fechabaja';

end;

procedure TfrmUsuAvisoAuditoriaILT.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql := 'SELECT ua_id, ua_usuario, ma_codigo, ma_descripcion, ' +
          '       ua_fechabaja' +
          '  FROM din.dua_usuavisoauditoria, din.dma_motivoauditoria' +
          ' WHERE ua_idmotivoaudit = ma_id ';

  if not fraMotivoFiltro.IsEmpty then
    ssql := ssql + ' and ma_id = ' + fraMotivoFiltro.ID;

  if not fraUsuarioFiltro.IsEmpty then
    ssql := ssql + ' and ua_usuario = ' + QuotedStr(fraUsuarioFiltro.UserID);

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

function TfrmUsuAvisoAuditoriaILT.Validar : Boolean;
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario, 'Debe completar este campo');
  Verificar(fraMotivo.IsEmpty, fraMotivo, 'Debe completar este campo');
  Verificar((ModoABM = maAlta) and (ExisteSqlEx('SELECT 1 FROM din.dua_usuavisoauditoria' +
                                                ' WHERE ua_usuario = :usu ' +
                                                '   AND ua_idmotivoaudit = :mot ' +
                                                '   AND ua_fechabaja IS NULL', [fraUsuario.UserID, fraMotivo.Codigo{, fraTipoSin.Codigo}])),
                                    fpAbm, 'Ya existe este registro');

  Validar := True;
end;

procedure TfrmUsuAvisoAuditoriaILT.ClearControls;
begin
  fraUsuario.Clear;
  fraMotivo.Clear;
end;


function TfrmUsuAvisoAuditoriaILT.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'DIN.DUA_USUAVISOAUDITORIA';
    case ModoABM of
      maAlta:
      begin
        SqlType := stInsert;
        PrimaryKey.Add('UA_ID', 'DIN.SEQ_DUA_ID.NEXTVAL', False);
        Fields.Add('UA_USUALTA', Sesion.UserID);
        Fields.Add('UA_FECHAALTA', exDate);
        Fields.Add('UA_USUARIO', fraUsuario.UserID);
        Fields.Add('UA_IDMOTIVOAUDIT', fraMotivo.ID);
      end;
      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('UA_ID', sdqConsulta.FieldByName('UA_ID').AsInteger, False);
        Fields.Add('UA_USUMODIF', Sesion.UserID);
        Fields.Add('UA_FECHAMODIF', exDate);
        Fields.Add('UA_IDMOTIVOAUDIT', fraMotivo.ID);
        Fields.Add('UA_USUBAJA', '');
        Fields.Add('UA_FECHABAJA', '');
      end;
      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('UA_ID', sdqConsulta.FieldByName('UA_ID').AsInteger, False);
        Fields.Add('UA_USUBAJA', Sesion.UserID);
        Fields.Add('UA_FECHABAJA', exDate);
      end;
    end;

    Result := inherited DoABM;

  end;
end;

end.
