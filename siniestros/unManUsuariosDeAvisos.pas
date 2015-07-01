unit unManUsuariosDeAvisos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, AnsiSql,
  FormPanel, unArtFrame, unfraUsuarios, CustomDlgs, unSesion, unDmPrincipal, VCLExtra;

type
  TAccion = (Alta, Modif, Baja);
  TfrmManUsuariosDeAvisos = class(TfrmCustomConsulta)
    gbVerBajas: TGroupBox;
    rbBajas_Si: TRadioButton;
    rbBajas_No: TRadioButton;
    rbBajas_Todos: TRadioButton;
    fpABM: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarDatosCartasDoc: TButton;
    btnCancelarDatosCartasDoc: TButton;
    Splitter1: TSplitter;
    GridDetail: TArtDBGrid;
    sdqDetailUsuarios: TSDQuery;
    dsDetailUsuarios: TDataSource;
    Label1: TLabel;
    edCodAviso: TEdit;
    edDescAviso: TEdit;
    fraUsuario: TfraUsuario;
    Label2: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure fpABMBeforeShow(Sender: TObject);
    procedure btnAceptarDatosCartasDocClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure GridDetailGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FSFormActivate(Sender: TObject);
    procedure fpABMShow(Sender: TObject);
  private
    { Private declarations }
   procedure DoHabilitarABM(Acc: TAccion);
  public
    { Public declarations }
  end;

var
  frmManUsuariosDeAvisos: TfrmManUsuariosDeAvisos;

implementation

{$R *.dfm}

procedure TfrmManUsuariosDeAvisos.FormCreate(Sender: TObject);
begin
  inherited;
  rbBajas_No.Checked := True;
  fraUsuario.Sector            := 'INCAP';
  fraUsuario.UsuariosGenericos := False;
end;

procedure TfrmManUsuariosDeAvisos.tbLimpiarClick(Sender: TObject);
begin
  rbBajas_No.Checked := true;
  sdqDetailUsuarios.Close;
  inherited;
end;

procedure TfrmManUsuariosDeAvisos.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  sSql := 'SELECT ad_id, ad_codigo CODIGO, ad_descripcion DESCRIPCION, ad_fechabaja FBAJA ' +
           ' FROM SIN.sad_avisosdiarios ' +
          ' WHERE 1=1 ';

  if rbBajas_Si.Checked then
    sSql := sSql + ' AND ad_fechabaja IS NOT NULL '
  else if rbBajas_No.Checked then
    sSql := sSql + ' AND ad_fechabaja IS NULL ';

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  if sdqConsulta.Eof then
    sdqDetailUsuarios.Close;

  inherited;

end;

procedure TfrmManUsuariosDeAvisos.sdqConsultaAfterScroll(DataSet: TDataSet);
var sSql: string;
begin
  if not sdqConsulta.Eof then
  begin
    sdqDetailUsuarios.Close;
    sSql := ' SELECT ui_id, se_usuario CODUSUARIO, se_nombre NOMBREUSUARIO, ui_usualta USUALTA, ' +
                   ' ui_fechaalta FECHAALTA, ui_usubaja USUBAJA, ui_fechabaja FECHABAJA ' +
              ' FROM SIN.sui_usuarioavisoinca, art.use_usuarios, SIN.sad_avisosdiarios '  +
             ' WHERE ui_usuario = se_usuario ' +
               ' AND ad_id = ui_idaviso ' +
               ' AND se_fechabaja IS NULL ' +
               ' AND ad_id = ' + SqlInt(sdqConsulta.FieldByName('AD_ID').AsInteger);

    sdqDetailUsuarios.Sql.Text := sSql;
    sdqDetailUsuarios.Open;
  end
  else
    sdqDetailUsuarios.Close;
end;

procedure TfrmManUsuariosDeAvisos.tbNuevoClick(Sender: TObject);
var sSql: string;
begin
  fpAbm.Caption := 'Alta de Nuevo Usuario';
  DoHabilitarABM(Alta);
  if (fpAbm.ShowModal = mrOk) then
  begin
    BeginTrans;
    Try
      sSql := 'INSERT INTO SIN.sui_usuarioavisoinca ' +
               ' (ui_usuario, ui_idaviso, ui_usualta, ui_fechaalta) ' +
              ' VALUES ' +
              ' (' + SqlValue(fraUsuario.edCodigo.Text) + ', ' +
                     SqlInt(sdqConsulta.FieldByName('AD_ID').AsInteger) + ', ' +
                     SqlValue(Sesion.UserID) + ', art.actualdate )';

      EjecutarSqlST(sSql);
      CommitTrans;
      tbRefrescarClick(nil);
    Except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Ha ocurrido un error al intentar guardar el usuario del Aviso.');
      end;
    End;

  end;
end;

procedure TfrmManUsuariosDeAvisos.tbEliminarClick(Sender: TObject);
var sSql: string;
begin
  fpAbm.Caption := 'Eliminar Usuario';
  DoHabilitarABM(Baja);
  if (fpAbm.ShowModal = mrOk) then
  begin
    BeginTrans;
    Try
      sSql := 'UPDATE SIN.sui_usuarioavisoinca ' +
                ' SET ui_usubaja = ' + SqlValue(Sesion.UserID) + ', ' +
                    ' ui_fechabaja = art.actualdate ' +
              ' WHERE ui_id = ' + SqlInt(sdqDetailUsuarios.FieldByName('UI_ID').AsInteger);
      EjecutarSqlST(sSql);
      CommitTrans;
      tbRefrescarClick(nil);
    Except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Ha ocurrido un error al intentar dar de baja al Usuario del Aviso.');
      end;
    End;

  end;
end;

procedure TfrmManUsuariosDeAvisos.fpABMBeforeShow(Sender: TObject);
begin
  edCodAviso.Text  := ' ' + sdqConsulta.FieldByName('CODIGO').AsString;
  edDescAviso.Text := ' ' + sdqConsulta.FieldByName('DESCRIPCION').AsString;
end;


procedure TfrmManUsuariosDeAvisos.fpABMShow(Sender: TObject);
begin
  if fraUsuario.Enabled and fraUsuario.edCodigo.CanFocus then
    fraUsuario.edCodigo.SetFocus;
end;

procedure TfrmManUsuariosDeAvisos.FSFormActivate(Sender: TObject);
begin
  inherited;
  tbRefrescarClick(nil);
end;

procedure TfrmManUsuariosDeAvisos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('FBAJA').IsNull then
    AFont.Color :=  clRed;
end;

procedure TfrmManUsuariosDeAvisos.GridDetailGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDetailUsuarios.FieldByName('FECHABAJA').IsNull then
    AFont.Color :=  clRed;
end;

procedure TfrmManUsuariosDeAvisos.btnAceptarDatosCartasDocClick(Sender: TObject);
begin
  Verificar((fraUsuario.edCodigo.text = ''), fraUsuario.edCodigo, 'Debe completar el Usuario.');
  fpAbm.ModalResult := mrOk;
end;

procedure TfrmManUsuariosDeAvisos.DoHabilitarABM(Acc: TAccion);
begin
  if (Acc = Alta) then
  begin
    fraUsuario.Clear;
    LockControls([fraUsuario], false);
  end
  else if (Acc = Baja) then
  begin
    fraUsuario.edCodigo.Text       := sdqDetailUsuarios.FieldByName('CODUSUARIO').AsString;
    fraUsuario.cmbDescripcion.Text := sdqDetailUsuarios.FieldByName('NOMBREUSUARIO').AsString;
    LockControls([fraUsuario], True);
  end;
end;

end.
