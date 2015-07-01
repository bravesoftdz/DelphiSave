unit UnManEmpresasVIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, unFraEmpresa, EditDialog, ToolEdit,
  ArtComboBox, Mask, StdCtrls, ComCtrls, ToolWin, ShortCutControl,
  QueryToFile, ExportDialog, SortDlg, Grids, DBGrids, RXDBCtrl, ArtDBGrid,
  Buttons, ExtCtrls, FormPanel, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unfraUsuarios;

type
  TfrmManEmpresasVIP = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    ToolBar1: TToolBar;
    btnNuevo: TToolButton;
    btnEliminar: TToolButton;
    btnRefrescar: TToolButton;
    btnOrdenar: TToolButton;
    btnExportar: TToolButton;
    btnImprimir: TToolButton;
    btnSalir: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    dbgDatos: TArtDBGrid;
    SortDialog: TSortDialog;
    ExportDialog: TExportDialog;
    ShortCutControl: TShortCutControl;
    fpABM: TFormPanel;
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    Label2: TLabel;
    btnGuardar: TBitBtn;
    btnCancelar: TBitBtn;
    sdqUsuario: TSDQuery;
    dsUsuario: TDataSource;
    btnModificar: TToolButton;
    PrintDialog: TPrintDialog;
    Label3: TLabel;
    Bevel2: TBevel;
    gbTipoEmpresa: TGroupBox;
    rbGrandes: TRadioButton;
    rbVIP: TRadioButton;
    fraUsuario: TfraUsuario;
    procedure FormCreate(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnOrdenarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure btnModificarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure Refrescar;
    Function ValidarInsertar(CUIT:String):boolean;
    procedure OnEmpresaChange(Sender : TObject);
  public
    { Public declarations }
  end;

var
  frmManEmpresasVIP: TfrmManEmpresasVIP;

implementation

uses unPrincipal, unDmPrincipal,CustomDlgs,General, AnsiSql, SqlFuncs, unSesion;

{$R *.DFM}

{ TfrmManEmpresasVIP }
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.FormCreate(Sender: TObject);
begin
  Refrescar;
  sdqUsuario.Open;
  fraEmpresa.OnChange := OnEmpresaChange;
  fraUsuario.UsuariosGenericos := False;
  fraUsuario.ShowBajas         := False;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.Refrescar;
begin
  sdqDatos.Close;
  sdqDatos.Open;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.btnNuevoClick(Sender: TObject);
var
  Sql: String;
begin
  Sql := '';
  fraEmpresa.Enabled      := True;
  fraEmpresa.Clear;
  fraUsuario.Limpiar;
  fpABM.Caption           := 'Alta de Empresa VIP';
  if fpABM.ShowModal = mrOk then
  begin
    if ValidarInsertar(fraEmpresa.CUIT) then
    try
      Sql := 'INSERT INTO mep_empresavip ' +
             '(ep_cuit, ep_usuario, ep_fechalta, ep_usualta, ep_tipo) VALUES ( ' +
             SqlValue(fraEmpresa.CUIT) + ',' + SqlValue(fraUsuario.edCodigo.Text) + ', Actualdate,' +
             SqlValue(Sesion.UserID) + ',' + String(IIF(rbVIP.Checked, '''V''', '''C''')) + ')' ;
      EjecutarSql(Sql);
      Refrescar;
     except
      on E: Exception do ErrorMsg(E);
     end;
  end;
end;
{-----[Valida el Check_cobertura y que no se inserte un registro repetido]-------------------------------------------------------}
function TfrmManEmpresasVIP.ValidarInsertar(CUIT: String): boolean;
begin
  if (ValorSql('SELECT afiliacion.check_cobertura(''' + CUIT + ''') FROM dual' ) <> '1' ) then
  begin
    Result := False;
    MsgBox('No se puede dar de alta:' + #13 + 'La empresa no esta vigente.');
  end else if ExisteSql('SELECT 1 FROM mep_empresavip ' +
                        ' WHERE ep_cuit = ' + SqlValue(CUIT) +
                          ' AND ep_fechabaja IS NULL ' ) then
  begin
    Result := False;
    MsgBox('No se puede dar de alta:' + #13 + 'La Empresa ya existe en la tabla.');
  end else
    Result := True;
end;
{----[ver *]----------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  if sdqDatos.FieldByName('EP_FECHABAJA').IsNull Then
     btnModificar.Enabled := False
  else btnModificar.Enabled := True;
end;
{----[* Modificar: solo sirve para que vuelvan a estar activos los registros dados de baja ]-------------------------------------}
procedure TfrmManEmpresasVIP.btnModificarClick(Sender: TObject);
var
  Sql :string;
begin
  if ExisteSql('SELECT 1 FROM mep_empresavip ' +
               ' WHERE ep_cuit = ' + SqlValue(sdqDatos.FieldByName('EP_CUIT').AsString) +
                 ' AND ep_fechabaja is null') then  // si hay una activa con ese cuit, no se activa.
    MsgBox('No se puede Reactivar la empresa debido a que ya existe en la tabla')

  else if MsgAsk('¿Desea reactivar la empresa: "' + sdqDatos.FieldByName('MP_NOMBRE').Text + '" ?') then
    try
      Sql := 'UPDATE mep_empresavip ' +
               ' SET ep_fechabaja = null ' +
             ' WHERE ep_cuit = ' + SqlValue(sdqDatos.fieldbyname('EP_CUIT').Text) +
               ' AND ep_usuario = ' + SqlValue(sdqDatos.fieldbyname('EP_USUARIO').Text);
      EjecutarSql(Sql);
      Refrescar;
    except
      on E: Exception do ErrorMsg(E);
    end
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.btnEliminarClick(Sender: TObject);
var
  Sql: string;
begin
  if sdqDatos.fieldbyname('EP_FECHABAJA').IsNull and
     MsgAsk('¿Desea eliminar la empresa: "' + sdqDatos.fieldbyname('MP_NOMBRE').Text + '" ?') then
     try
       Sql := 'UPDATE mep_empresavip ' +
               ' SET ep_fechabaja = actualdate, ' +
                   ' ep_usuabaja= ' + SqlValue(Sesion.UserID) +
             ' WHERE ep_cuit = ' + SqlValue(sdqDatos.fieldbyname('EP_CUIT').Text) +
               ' AND ep_usuario = ' + SqlValue(sdqDatos.fieldbyname('EP_USUARIO').Text);
       EjecutarSql(Sql);
       Refrescar;
     except
       on E: Exception do ErrorMsg(E);
     end;
end;
{------[Cambia de color a los registros que estan dados de baja (lógica)]--------------------------------------------------------}
procedure TfrmManEmpresasVIP.dbgDatosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatos.fieldbyname('EP_FECHABAJA').IsNull then AFont.Color := clRed;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.btnRefrescarClick(Sender: TObject);
begin
  Refrescar;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.btnOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.btnExportarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.btnImprimirClick(Sender: TObject);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then QueryPrint.Print;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuMantEmpresasVip.Enabled := True;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEmpresasVIP.OnEmpresaChange(Sender: TObject);
begin
  if fraEmpresa.IsBaja then
  begin
    fraEmpresa.Clear;
    fraEmpresa.edContrato.SetFocus;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
end.
