unit unSeleccionMultiple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, StdCtrls, ExtCtrls, listlink, AdvGlowButton,
  AdvToolBar, AdvToolBarStylers;

type
  TUserData = class
    Id: Integer;
    Mail: String;
  public
    constructor Create(AId: Integer; AMail: String); reintroduce;
  end;

  TfrmSeleccionUsuarios = class(TArtFrame)
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvToolBarPager: TAdvToolBarPager;
    btnAceptar: TAdvGlowButton;
    btnAgregar: TAdvGlowButton;
    btnAgregarTodo: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    btnPasarSel: TButton;
    btnPasarTodos: TButton;
    btnQuitar: TAdvGlowButton;
    btnQuitarTodo: TAdvGlowButton;
    btnSacarSel: TButton;
    btnSacarTodos: TButton;
    fraSector: TfraCodigoDescripcionExt;
    lblSector: TLabel;
    lblUsuarios: TLabel;
    lblUsuariosAAsignar: TLabel;
    ListLinkUsuarios: TListLink;
    lsUsuarios: TListBox;
    lsUsuariosAsignar: TListBox;
    pnlFondo: TPanel;
    procedure btnAgregarClick(Sender: TObject);
    procedure btnAgregarTodoClick(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
    procedure btnQuitarTodoClick(Sender: TObject);
    procedure lsUsuariosAsignarDblClick(Sender: TObject);
    procedure lsUsuariosDblClick(Sender: TObject);
  private
    FMostrarTodos: Boolean;
    FSQL: String;
    FIncluirGenericos: Boolean;
    function GetUsuariosAsignados: TStrings;
    procedure Init;
    procedure LoadQuery(ASQL: String; ADependencias: Boolean = False);
    procedure OnChangeSector(Sender: TObject);
    procedure SetUsuariosAsignados(const Value: TStrings);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AsociarUsuario(AIdUsuario: Integer; AUsuario: String = ''; AMail: String = '');
    procedure Clear; override;
    function GetUserIdByIndex(AIndex: Integer): Integer;
    function GetUserMailByIndex(AIndex: Integer): String;
    procedure Load;
    property IncluirGenericos: Boolean read FIncluirGenericos write FIncluirGenericos;
    property MostrarTodos: Boolean read FMostrarTodos write FMostrarTodos;
    property UsuariosAsignados: TStrings read GetUsuariosAsignados write SetUsuariosAsignados;
  end;

var
  frmSeleccionUsuarios: TfrmSeleccionUsuarios;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, AnsiSql, CustomDlgs, JvTFMonths, JvTFGlance, unSesion, DB, General;

procedure TfrmSeleccionUsuarios.btnAgregarClick(Sender: TObject);
begin
  btnPasarSel.Click;
end;

procedure TfrmSeleccionUsuarios.btnAgregarTodoClick(Sender: TObject);
begin
  btnPasarTodos.Click;
end;

procedure TfrmSeleccionUsuarios.btnQuitarClick(Sender: TObject);
begin
  btnSacarSel.Click;
end;

procedure TfrmSeleccionUsuarios.btnQuitarTodoClick(Sender: TObject);
begin
  btnSacarTodos.Click;
end;

procedure TfrmSeleccionUsuarios.lsUsuariosAsignarDblClick(Sender: TObject);
begin
  btnSacarSel.Click;
end;

procedure TfrmSeleccionUsuarios.lsUsuariosDblClick(Sender: TObject);
begin
  btnPasarSel.Click;
end;

function TfrmSeleccionUsuarios.GetUsuariosAsignados: TStrings;
begin
  Result := lsUsuariosAsignar.Items;
end;

procedure TfrmSeleccionUsuarios.Init;
begin
  MostrarTodos := False;
end;

procedure TfrmSeleccionUsuarios.LoadQuery(ASQL: String; ADependencias: Boolean = False);
begin
  if ADependencias then
    EjecutarStoreSTEx('art.agenda_pkg.do_usudependientesconperfil(:id);', [Sesion.ID]);

  with GetQuery(ASQL) do
  try
    while not Eof do
    begin
      if (lsUsuariosAsignar.Items.IndexOf(FieldByName('DESCRIPCION').AsString) = -1) and
         (lsUsuarios.Items.IndexOf(FieldByName('DESCRIPCION').AsString) = -1) then
      lsUsuarios.Items.AddObject(FieldByName('DESCRIPCION').AsString, TUserData.Create(FieldByName('ID').AsInteger, FieldByName('MAIL').AsString));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmSeleccionUsuarios.OnChangeSector(Sender: TObject);
begin
  lsUsuarios.Items.Clear;
  if MostrarTodos then
    FSQL := 'SELECT se_id as ID, se_nombre as DESCRIPCION, se_mail as MAIL ' +
              'FROM art.use_usuarios ' +
             'WHERE se_fechabaja IS NULL ' +
                    iif(fraSector.IsSelected, 'AND se_sector = ' + SqlValue(fraSector.Codigo) + ' ', '') +
                    iif(IncluirGenericos, '', 'AND se_usuariogenerico = ''N'' ') +
          'ORDER BY 2'
  else
    FSQL := 'SELECT mp_id as ID, mp_nombre as DESCRIPCION, se_mail as MAIL ' +
              'FROM art.use_usuarios, agenda.tmp_usuarios_dependientes ' +
             'WHERE se_usuario = mp_usuario ' +
                    iif(fraSector.IsSelected, 'AND mp_sector = ' + SqlValue(fraSector.Codigo) + ' ', '') +
          'ORDER BY 2';

  LoadQuery(FSQL, not MostrarTodos);  
end;

procedure TfrmSeleccionUsuarios.SetUsuariosAsignados(const Value: TStrings);
begin
  lsUsuariosAsignar.Items := Value;
end;

constructor TfrmSeleccionUsuarios.Create(AOwner: TComponent);
begin
  inherited;
  Init;
  FIncluirGenericos := False;
  AdvToolBarOfficeStyler.Style := bsOffice2007Obsidian;
  AdvToolBarOfficeStyler.PagerCaption.Font.Color := $008B4215;
  with fraSector do
  begin
    TableName := 'art.usc_sectores';
    FieldDesc := 'sc_descripcion';
    FieldID := 'sc_id';
    FieldCodigo := 'sc_codigo';
    FieldBaja := 'sc_fechabaja';
    CaseSensitive := false;
    OnChange := OnChangeSector;
    ShowBajas := True;
  end;
end;

destructor TfrmSeleccionUsuarios.Destroy;
begin
  inherited;
end;

procedure TfrmSeleccionUsuarios.AsociarUsuario(AIdUsuario: Integer; AUsuario: String = ''; AMail: String = '');
begin
  if (lsUsuarios.Items.IndexOf(AUsuario) <> -1) then
  begin
    lsUsuarios.Selected[lsUsuarios.Items.IndexOf(AUsuario)] := True;
    if Assigned(lsUsuarios.Items.Objects[lsUsuarios.Items.IndexOf(AUsuario)]) then
      lsUsuarios.Items.Objects[lsUsuarios.Items.IndexOf(AUsuario)].Free;
    lsUsuarios.DeleteSelected;
  end;

  if (lsUsuariosAsignar.Items.IndexOf(AUsuario) = -1) then
    lsUsuariosAsignar.Items.AddObject(AUsuario, TUserData.Create(AIdUsuario, AMail));
end;

procedure TfrmSeleccionUsuarios.Clear;
begin
  inherited;
  lsUsuarios.Items.Clear;
  lsUsuariosAsignar.Items.Clear;  
end;

function TfrmSeleccionUsuarios.GetUserIdByIndex(AIndex: Integer): Integer;
begin
  if (UsuariosAsignados.Count > AIndex) and Assigned(UsuariosAsignados.Objects[AIndex]) then
    Result := TUserData(UsuariosAsignados.Objects[AIndex]).Id
  else
    Result := 0;
end;

function TfrmSeleccionUsuarios.GetUserMailByIndex(AIndex: Integer): String;
begin
  if (UsuariosAsignados.Count > AIndex) and Assigned(UsuariosAsignados.Objects[AIndex]) then
    Result := TUserData(UsuariosAsignados.Objects[AIndex]).Mail
  else
    Result := '';
end;

procedure TfrmSeleccionUsuarios.Load;
begin
  lsUsuarios.Items.Clear;
  fraSector.Clear;
  if MostrarTodos then
    FSQL := 'SELECT se_id as ID, se_nombre as DESCRIPCION, se_mail as MAIL ' +
              'FROM art.use_usuarios ' +
             'WHERE se_fechabaja IS NULL ' +
                    iif(IncluirGenericos, '', 'AND se_usuariogenerico = ''N'' ') +
          'ORDER BY 2'
  else
    FSQL := 'SELECT mp_id as ID, mp_nombre as DESCRIPCION, se_mail as MAIL ' +
              'FROM art.use_usuarios, agenda.tmp_usuarios_dependientes ' +
             'WHERE mp_usuario = se_usuario ' +
          'ORDER BY 2';

  LoadQuery(FSQL, not MostrarTodos);
end;

constructor TUserData.Create(AId: Integer; AMail: String);
begin
  Id := AId;
  Mail := AMail;
end;

end.
