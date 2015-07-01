unit unManTextoEmailGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, unFraStaticCodigoDescripcion, AdvMemo,
  AdvmWS, Menus, unDmPrincipal, AnsiSql, unConstEmision, SqlFuncs, unManParametrosManualesMail;

type
  TfrmManTextoEmailGestion = class(TfrmCustomGridABM)
    Label13: TLabel;
    fraItemGestionFiltro: TfraCodigoDescripcion;
    Label10: TLabel;
    fraGestionable: TfraCodigoDescripcion;
    pmnuVariables: TPopupMenu;
    edTitulo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edAsunto: TEdit;
    pcMail: TPageControl;
    tsTexto: TTabSheet;
    tsParametrosManuales: TTabSheet;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton18: TToolButton;
    tbParametros: TToolButton;
    edMemo: TAdvMemo;
    btnAplicar: TButton;
    AdvWebMemoStyler: TAdvWebMemoStyler;
    fraModoNotificacion: TfraCodigoDescripcion;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure mnuVariableClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure pmnuVariablesPopup(Sender: TObject);
    procedure fraModoNotificacionChange(Sender: TObject);
  private
    FSqlBase: String;
    FfrmManParametrosManualesMail: TfrmManParametrosManualesMail;
    procedure CargarVariables;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    { Public declarations }
  end;

var
  frmManTextoEmailGestion: TfrmManTextoEmailGestion;

implementation

uses
  unFuncionesEmision, unCustomConsulta, CustomDlgs, unSesion;

{$R *.dfm}

procedure TfrmManTextoEmailGestion.FormCreate(Sender: TObject);
begin
  inherited;
  FSqlBase := sdqConsulta.SQL.Text;

  with fraGestionable do
  begin
    TableName := 'emi.ige_gestionable';
    FieldID := 'ge_id';
    FieldCodigo := 'ge_id';
    FieldDesc := 'ge_descripcion';
    FieldBaja := 'ge_fechabaja';
    ExtraCondition := ' AND 1 = 2 ';
    ShowBajas := true;
  end;

  with fraItemGestionFiltro do
  begin
    TableName := 'emi.ige_gestionable';
    FieldID := 'ge_id';
    FieldCodigo := 'ge_id';
    FieldDesc := 'ge_descripcion';
    FieldBaja := 'ge_fechabaja';
    ShowBajas := true;
  end;

  CargarVariables;

  FieldBaja := 'GS_FECHABAJA';
  Sql.TableName := 'EMI.IGS_GESTIONABLESALIDA';

  FfrmManParametrosManualesMail := TfrmManParametrosManualesMail.Create(self);
  with FfrmManParametrosManualesMail do
  begin
    FormStyle := fsNormal;
    tbSalir.Visible := false;
    Parent := tsParametrosManuales;
    Align := alClient;
  end;

  with fraModoNotificacion do
  begin
    TableName := 'comunes.cmn_modonotificacion';
    FieldID := 'mn_id';
    FieldCodigo := 'mn_codigo';
    FieldDesc := 'mn_descripcion';
    ExtraCondition := ' and mn_codigo in (''M'') ';
    OnChange := fraModoNotificacionChange;
  end;

end;

procedure TfrmManTextoEmailGestion.CargarVariables;
var
  MenuItem: TMenuItem;
  idAccionWeb: integer;
begin
  pmnuVariables.Items.Clear;
  idAccionWeb := StrToIntDef(get_parametrobyclave('MAILGESTION'), 0);

  with GetQueryEx('SELECT AP_DESCRIPCION, AP_CLAVE ' +
                  'FROM WEB.WAP_ACCIONPARAMETROS ' +
                  'WHERE AP_IDACCIONWEB = :ID ' +
                  'AND AP_FECHABAJA IS NULL ' +
                  'AND AP_CLAVE <> ''CONTENIDO'' ' +
                  'AND NOT EXISTS (SELECT 1 FROM EMI.IMP_MAILPARAMETRO WHERE MP_NOMBRE = AP_CLAVE) ', [idAccionWeb]) do
  try
    while not Eof do
    begin
      MenuItem := TMenuItem.Create(pmnuVariables);
      MenuItem.Name := FieldByName('AP_CLAVE').AsString;
      MenuItem.Caption := FieldByName('AP_DESCRIPCION').AsString;
      MenuItem.OnClick := mnuVariableClick;
      pmnuVariables.Items.Add(MenuItem);
      Next;
    end;
  finally
    Free;
  end;

  with GetQueryEx('SELECT MP_NOMBRE ' +
                  'FROM EMI.IMP_MAILPARAMETRO ' +
                  'WHERE MP_IDGESTIONABLE = :ID AND MP_FECHABAJA IS NULL ' +
                  ' AND MP_IDMODONOTIFICACION = :IDMN ', [fraGestionable.Value, fraModoNotificacion.Value]) do
  try
    if not IsEmpty then
    begin
      MenuItem := TMenuItem.Create(pmnuVariables);
      MenuItem.Caption := '-';
      pmnuVariables.Items.Add(MenuItem);
    end;

    while not Eof do
    begin
      MenuItem := TMenuItem.Create(pmnuVariables);
      MenuItem.Name := FieldByName('MP_NOMBRE').AsString;
      MenuItem.Caption := FieldByName('MP_NOMBRE').AsString;
      MenuItem.OnClick := mnuVariableClick;
      pmnuVariables.Items.Add(MenuItem);
      Next;
    end;
  finally
    Free;
  end;

end;

procedure TfrmManTextoEmailGestion.ClearControls;
begin
  inherited;
  edAsunto.Clear;
  edTitulo.Clear;
  fraModoNotificacion.Clear;
  fraGestionable.Clear;
  fraModoNotificacion.Locked := false;
  fraGestionable.Locked := false;
  edMemo.Clear;
  FfrmManParametrosManualesMail.IdGestionable := fraGestionable.Value;
  FfrmManParametrosManualesMail.IdModoNotificacion := fraModoNotificacion.Value;
  FfrmManParametrosManualesMail.Cargar;
end;

function TfrmManTextoEmailGestion.DoABM: Boolean;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    Sql.PrimaryKey.Add('gs_idgestionable', fraGestionable.Value);
    Sql.PrimaryKey.Add('gs_idmodonotificacion', fraModoNotificacion.Value);
    if ModoABM = maBaja Then
    begin
      Sql.Fields.Add('gs_usubaja', Sesion.UserID);
      Sql.Fields.Add('gs_fechabaja', exDateTime);
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('gs_titulomail', edTitulo.Text);
      Sql.Fields.Add('gs_asuntomail', edAsunto.Text);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        Sql.Fields.Add('gs_usualta', Sesion.UserID);
        Sql.Fields.Add('gs_fechaalta', exDateTime);
      end else begin
        Sql.SqlType := stUpdate;
        Sql.Fields.Add('gs_usumodif', Sesion.UserID);
        Sql.Fields.Add('gs_fechamodif', exDateTime);
        Sql.Fields.Add('gs_usubaja', exNull);
        Sql.Fields.Add('gs_fechabaja', exNull);
      end;
    end;
    EjecutarSQLST(Sql.Sql);
    SaveBlob(' SELECT gs_cuerpomail ' +
             ' FROM  emi.igs_gestionablesalida ' +
             ' WHERE gs_idgestionable = ' + SqlValue(fraGestionable.Value),
             ' UPDATE emi.igs_gestionablesalida ' +
             ' SET gs_cuerpomail = :gs_cuerpomail'  +
             ' WHERE gs_idgestionable = ' + SqlValue(fraGestionable.Value) +
             '   AND gs_idmodonotificacion = ' +  SqlValue(fraModoNotificacion.Value), 'gs_cuerpomail', edMemo.Lines);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el texto de gestión.');
    end;
  end;
end;

procedure TfrmManTextoEmailGestion.LoadControls;
begin
  inherited;
  edTitulo.Text := sdqConsulta.fieldbyname('gs_titulomail').AsString;
  edAsunto.Text := sdqConsulta.fieldbyname('gs_asuntomail').AsString;
  fraModoNotificacion.Value := sdqConsulta.fieldbyname('gs_idmodonotificacion').AsInteger;
  fraModoNotificacionChange(self);
  fraGestionable.ExtraCondition := ' and not exists (select 1 ' +
                                   '                 from emi.igs_gestionablesalida ' +
                                   '                 where gs_idgestionable = ge_id ' +
                                   '                   and gs_idgestionable <> ' + SqlValue(sdqConsulta.fieldbyname('gs_idgestionable').AsInteger) +
                                   '                   and gs_idmodonotificacion = ' + SqlValue(fraModoNotificacion.Value) + ' )';
  fraGestionable.Value := sdqConsulta.fieldbyname('gs_idgestionable').AsInteger;
  fraModoNotificacion.Locked := true;
  fraGestionable.Locked := true;
  FfrmManParametrosManualesMail.IdModoNotificacion := fraModoNotificacion.Value;
  FfrmManParametrosManualesMail.IdGestionable := fraGestionable.Value;
  FfrmManParametrosManualesMail.Cargar;
  BlobSql('SELECT gs_cuerpomail ' +
          'FROM emi.igs_gestionablesalida ' +
          'WHERE gs_idgestionable = ' + SqlValue(sdqConsulta.fieldbyname('gs_idgestionable').AsInteger) +
          '  AND gs_idmodonotificacion = ' +  SqlValue(fraModoNotificacion.Value), edMemo.Lines);
end;

procedure TfrmManTextoEmailGestion.mnuVariableClick(Sender: TObject);
begin
  edMemo.InsertText('{#' + TMenuItem(Sender).Name  + '#}');
end;

function TfrmManTextoEmailGestion.Validar: Boolean;
begin
  Verificar(fraModoNotificacion.IsSelected and not fraGestionable.IsSelected, fraGestionable, 'Si selecciona un modo de notificación debe seleccionar un item a gestionar.');
  Verificar(not fraGestionable.IsSelected, fraGestionable, 'Debe ingresar un item de gestión.');
  Verificar(trim(edMemo.Lines.Text) = '', edMemo, 'Debe ingresar un texto de gestión.');
  Verificar(trim(edTitulo.Text) = '', edTitulo, 'Debe ingresar el título del mail.');
  Verificar(trim(edAsunto.Text) = '', edAsunto, 'Debe ingresar el asunto del mail.');
  result := true;
end;

procedure TfrmManTextoEmailGestion.FSFormDestroy(Sender: TObject);
begin
  inherited;
  FfrmManParametrosManualesMail.free;
end;

procedure TfrmManTextoEmailGestion.fpAbmShow(Sender: TObject);
begin
  inherited;
  if (ModoABM = maAlta) then
    LockControl(FfrmManParametrosManualesMail.ToolBar, true)
  else
    LockControl(FfrmManParametrosManualesMail.ToolBar, false);
end;

procedure TfrmManTextoEmailGestion.btnAplicarClick(Sender: TObject);
begin
	if Validar and DoABM then
  begin
    ModoABM := maModificacion;
    ModoABMToSqlType;
    LockControl(FfrmManParametrosManualesMail.ToolBar, false);
    if AutoLock then
    	LockControls(True);
    fpABM.Caption := CAPTION_MODIFIC;
  end;
end;

procedure TfrmManTextoEmailGestion.pmnuVariablesPopup(Sender: TObject);
begin
  CargarVariables;
end;

procedure TfrmManTextoEmailGestion.fraModoNotificacionChange(
  Sender: TObject);
begin
  fraGestionable.Clear;
  if fraModoNotificacion.IsSelected then
    fraGestionable.ExtraCondition := ' and not exists (select 1 ' +
                                     '                 from emi.igs_gestionablesalida ' +
                                     '                 where gs_idgestionable = ge_id ' +
                                     '                   and gs_idmodonotificacion = '  +  SqlValue(fraModoNotificacion.Value) +
                                     '                   and gs_fechabaja is null )'
  else
    fraGestionable.ExtraCondition := ' and 1 = 2 ';
end;

end.
