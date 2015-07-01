unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Menus, XPMenu, 
  artDbLogin, artSeguridad, ImgList, ActnList, Db, SDEngine, ExtDlgs, Buttons, StdCtrls, unCustomPanelABM,
  FormPanel, ExtCtrls, ShellAPI, JvTrayIcon, JvFormPlacement, JvEnterTab, JvAppRegistryStorage, IntEdit,
  ParamFuncs, IniFiles, unCITRIX, JvAppStorage, JvComponent, Login, Mask, PatternEdit, ToolWin, JvExControls,
  JvComponentBase;

const
  CM_RESTORE = WM_USER + 1;
  APP_TITLE  = 'Explorador de Aplicaciones - Provincia ART';

  INI_SECTION     = 'PORTAL';
  INI_VALUE_EXE   = 'EJECUTABLE';
  INI_VALUE_PARAM = 'PARAMETROS';
  INI_VALUE_APLICACION = 'APLICACION';

  CMDLINE_EXE     = 'EJECUTABLE';
  CMDLINE_PARAM   = 'PARAMETROS';
  CMDLINE_APLICACION = 'APLICACION';

type
  TSector = class
    Codigo: String;
  public
    constructor Create(ACodigo: String);
  end;

  TfrmPrincipal = class(TForm)
    mm: TMainMenu;
    mnuArchivo: TMenuItem;
    mnuAbrir: TMenuItem;
    sb: TStatusBar;
    lvExplorer: TListView;
    mnuVer: TMenuItem;
    mnuBarradeEstado: TMenuItem;
    mnuBarradeBotones: TMenuItem;
    N1: TMenuItem;
    mnuDetalle: TMenuItem;
    mnuIconos: TMenuItem;
    mnuLista: TMenuItem;
    mnuIconosPequeos: TMenuItem;
    N2: TMenuItem;
    mnuActualizar: TMenuItem;
    N3: TMenuItem;
    Salir1: TMenuItem;
    mnuAyuda: TMenuItem;
    mnuAcercade: TMenuItem;
    ilColor: TImageList;
    ilIconos: TImageList;
    Seguridad: TSeguridad;
    DBLogin: TDBLogin;
    XPMenu: TXPMenu;
    al: TActionList;
    Abrir: TAction;
    Refrescar: TAction;
    Salir: TAction;
    sdqQuery: TSDQuery;
    fpAplicacion: TFormPanel;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    lbDescripcion: TLabel;
    edtDescripcion: TEdit;
    lblPath: TLabel;
    edtPath: TEdit;
    btnSeleccionarArchivo: TSpeedButton;
    icono: TImage;
    OpenDialog: TOpenDialog;
    lblIcono: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    ilState: TImageList;
    lbSectoresDisponibles: TListBox;
    lbSectoresAsociados: TListBox;
    btnAgregar: TButton;
    btnQuitar: TButton;
    ImageBase: TImage;
    TrayIcon: TJvTrayIcon;
    imTrayIcons: TImageList;
    popTrayIcon: TPopupMenu;
    mnuShowHide: TMenuItem;
    N4: TMenuItem;
    mnuSalir: TMenuItem;
    coolBar: TCoolBar;
    ToolBar: TToolBar;
    tbEjecutarAplicacion: TToolButton;
    tbRefrescarLista: TToolButton;
    ToolButton4: TToolButton;
    tbAgregarAplicacion: TToolButton;
    tbEditarAplicacion: TToolButton;
    tbHabilitarDeshabilitar: TToolButton;
    tbEliminarAplicacion: TToolButton;
    tbCambioDeEjecutables: TToolButton;
    tbSeparadorAdministracion: TToolButton;
    tbLimpiar: TToolButton;
    FormStorage: TJvFormStorage;
    JvEnterAsTab: TJvEnterAsTab;
    bvSeparadorBotones: TBevel;
    ilIconosSmall: TImageList;
    AppRegistryStorage: TJvAppRegistryStorage;
    mnuOpciones: TMenuItem;
    fpOpciones: TFormPanel;
    gbOpciones: TGroupBox;
    chkMinimizar: TCheckBox;
    chkMostrarBarra: TCheckBox;
    chkMostrarIcono: TCheckBox;
    btnAceptarOpcion: TButton;
    btnAgregarTodo: TButton;
    btnQuitarTodo: TButton;
    ImagenesAlarmas: TImageList;
    mnuConsultarEventosPendientes: TMenuItem;
    acEventosPendientes: TAction;
    TimerEventos: TTimer;
    Label1: TLabel;
    edMaxCantAlertas: TIntEdit;
    ImagenAlarma: TImage;
    lblNameProyecto: TLabel;
    edNombreProyecto: TEdit;
    pmnuPropiedades: TPopupMenu;
    mnuPropiedades1: TMenuItem;
    chkOmitir: TCheckBox;
    Label2: TLabel;
    edtPathAlternativo: TEdit;
    btnSeleccionarArchivoAlter: TSpeedButton;
    Label3: TLabel;
    edtPathCitrix: TEdit;
    btnSeleccionarArchivoCitrix: TSpeedButton;
    edMensaje: TMemo;
    Label4: TLabel;
    ilByN: TImageList;
    procedure TipoVista(Sender: TObject);
    procedure AbrirExecute(Sender: TObject);
    procedure RefrescarExecute(Sender: TObject);
    procedure SalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLoginLogin(Sender: TObject);
    procedure btnSeleccionarArchivoClick(Sender: TObject);
    procedure btnAccCancelarClick(Sender: TObject);
    procedure btnAccAceptarClick(Sender: TObject);
    procedure tbAgregarAplicacionClick(Sender: TObject);
    procedure tbEditarAplicacionClick(Sender: TObject);
    procedure tbEliminarAplicacionClick(Sender: TObject);
    procedure lvExplorerDblClick(Sender: TObject);
    procedure iconoDblClick(Sender: TObject);
    procedure tbHabilitarDeshabilitarClick(Sender: TObject);
    procedure mnuAcercadeClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure edtPathChange(Sender: TObject);
    procedure mnuBarradeBotonesClick(Sender: TObject);
    procedure mnuBarradeEstadoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
    procedure mnuShowHideClick(Sender: TObject);
    procedure mnuSalirClick(Sender: TObject);
    procedure tbCambioDeEjecutablesClick(Sender: TObject);
    procedure mnuOpcionesClick(Sender: TObject);
    procedure btnAceptarOpcionClick(Sender: TObject);
    procedure btnAgregarTodoClick(Sender: TObject);
    procedure btnQuitarTodoClick(Sender: TObject);
    procedure TimerEventosTimer(Sender: TObject);
    procedure mnuPropiedades1Click(Sender: TObject);
    procedure btnSeleccionarArchivoAlterClick(Sender: TObject);
    procedure btnSeleccionarArchivoCitrixClick(Sender: TObject);
    procedure mnuConsultarEventosPendientesClick(Sender: TObject);
  private
    ModoABM : TModoABM;
//    FCount: integer;

    function GetMensajeExe(IdEjecutable: Integer): String;
    function GetPathAlternativoExe(IdEjecutable: Integer): String;
    function GetPathCitrixExe(IdEjecutable: Integer): String;

    procedure AgregarAplicacion(ACaption: String; AIcon: Integer; AIndex: Integer; aEnabled: Boolean);
    procedure CargarAplicacion(AplicacionDesc, Parametros: String);
    procedure CargarEjecutable(Ejecutable, Parametros: String);
    procedure CargarSectoresAsignados(IdEjecutable: Integer);
    procedure CargarSectoresDisponibles(IdEjecutable: Integer);
    procedure CerrarConexion;
    procedure CleanAplicaciones;
    procedure CorrerEjecutable;
    procedure CorrerEjecutableByIndex(Sender: TObject);
//    procedure DoAlertClose(Sender: TObject);
//    procedure DoAlertShow(Sender: TObject);
//    procedure DoButtonClick(Sender: TObject);
//    procedure DoMessageClick(Sender: TObject);
    procedure FormSetup;
    procedure IconosBase;
    procedure ProcesarParametros;
    procedure RecargarEjecutables;
    procedure RevisarOpciones;
    procedure SetearBotones(sUsuario: String);
    function  IsActive(IdEjecutable: Integer): Boolean;
  public
    procedure RestoreRequest(var message: TMessage); message CM_RESTORE;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unCustomDataModule, unUtilsPortal, CustomDlgs, EditDialog, AnsiSQL, SqlFuncs,
  unFrmSplash, unFrmCambioEjecutables, unSesion, ArchFuncs, StrUtils, General, unEspera,
  unComunes, StrFuncs;

{$R *.DFM}

procedure TfrmPrincipal.TipoVista(Sender: TObject);
begin
  if (Sender is TMenuItem) then
  begin
    case (Sender as TMenuItem).tag of
      0:  lvExplorer.ViewStyle := vsReport;
      1:  lvExplorer.ViewStyle := vsIcon;
      2:  lvExplorer.ViewStyle := vsList;
      3:  lvExplorer.ViewStyle := vsSmallIcon;
    end;
  end;

  (Sender as TMenuItem).Checked := True;
end;

procedure TfrmPrincipal.AbrirExecute(Sender: TObject);
begin
  CorrerEjecutable;
end;

procedure TfrmPrincipal.RefrescarExecute(Sender: TObject);
begin
  IniciarEspera;
  try
    RecargarEjecutables;
  finally
    DetenerEspera;
  end;
end;

procedure TfrmPrincipal.SalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.RecargarEjecutables;
var
  Icon: TIcon;
  ListItem: TListItem;
  stream: TStream;
begin
  sdqQuery.Close;

  if Sesion.Sector <> 'COMPUTOS' then
  begin
    sdqQuery.SQL.text :=
      'select *' +
       ' from comunes.cej_ejecutable, comunes.cpe_perfilejecutable' +
      ' where ej_id =  pe_idejecutable' +
        ' and pe_idgrupo = :sector' +
        ' and ej_fechabaja is null' +
   ' order by ej_descripcion';
    sdqQuery.ParamByName('sector').AsString := Sesion.Sector;
  end
  else
  begin
    sdqQuery.SQL.Text :=
      'select *' +
       ' from comunes.cej_ejecutable' +
      ' where ej_fechabaja is null' +
   ' order by ej_descripcion';
    lvExplorer.PopupMenu := pmnuPropiedades;
  end;

  Icon := TIcon.Create;
  try
    sdqQuery.Open;

    lvExplorer.Items.Clear;
    ilIconos.Clear;
    ilIconosSmall.Clear;
    popTrayIcon.Items.Clear;

    while not sdqQuery.Eof do
    begin
      ListItem := lvExplorer.Items.Add;
      ListItem.Caption := sdqQuery.FieldByName('ej_descripcion').AsString;
      ListItem.SubItems.Add(sdqQuery.FieldByName('ej_path').AsString);
      ListItem.SubItems.Add(sdqQuery.FieldByName('ej_proyecto').AsString);

      stream := sdqQuery.CreateBlobStream(sdqQuery.FieldByName('ej_icono'), bmRead);
      try
        try
          Icon.LoadFromStream(Stream);
          ListItem.ImageIndex := ilIconos.AddIcon(Icon);
          ilIconosSmall.AddIcon(Icon);
        except
          ListItem.ImageIndex := -1;
        end;

        if sdqQuery.FieldByName('ej_activo').AsString = 'S' then
          ListItem.OverlayIndex := -1
        else
        begin
          ListItem.OverlayIndex := 0;
          ListItem.Cut := true;
        end;

        ListItem.Data := TObject(sdqQuery.FieldByName('ej_id').asinteger);
        AgregarAplicacion(sdqQuery.FieldByName('ej_descripcion').AsString, ListItem.ImageIndex, ListItem.Index,
                          (ListItem.OverlayIndex = -1));

        sdqQuery.Next;
      finally
        stream.Free;
      end;
    end;

    sb.Panels[0].Text := IntToStr(sdqQuery.RecordCount);
    if sdqQuery.RecordCount = 1 then
      sb.Panels[0].Text := sb.Panels[0].Text + ' Objeto'
    else
      sb.Panels[0].Text := sb.Panels[0].Text + ' Objetos';

    IconosBase;
  finally
    sdqQuery.Close;
    icon.Free;

    //Fixme Horrible sacarlo en cuanto se pueda pasar la sesion por parametro
    CerrarConexion;
  end;
end;

procedure TfrmPrincipal.CorrerEjecutable;
var
  sEjecutable, sErrorMsg, sFullPath, sMensaje, sParametros, sParametrosEjecutable: String;
  FileExec: AnsiString;
begin
  if Assigned(lvExplorer.Selected) then
  begin
    if IsActive(Integer(lvExplorer.Selected.Data)) then
    begin
      lvExplorer.Selected.OverlayIndex := -1;
      lvExplorer.Selected.Cut := False;
    end else
    begin
      lvExplorer.Selected.OverlayIndex := 0;
      lvExplorer.Selected.Cut := True;
    end;

    if Assigned(lvExplorer.Selected) and (lvExplorer.Selected.OverlayIndex = -1) then
    begin
      if IsCITRIX then
        sFullPath := GetPathCitrixExe(Integer(Integer(lvExplorer.Selected.Data)))
      else
        sFullPath := GetPathExe(Integer(lvExplorer.Selected.Data));

      sErrorMsg := GetApplicationMessage(sFullPath);
  //      ErrorMsg := GetApplicationMessage(lvExplorer.Selected.SubItems[0]);
      if sErrorMsg = '' then
      begin
        try
          if FileExists(sFullPath) then
            ChDir(ExtractFilePath(PChar(sFullPath)))
          else
          begin
            sFullPath := GetPathAlternativoExe(Integer(lvExplorer.Selected.Data));
            if FileExists(sFullPath) then
              ChDir(ExtractFilePath(PChar(sFullPath)));
          end
        except
          //
        end;
        sMensaje := GetMensajeExe(Integer(Integer(lvExplorer.Selected.Data)));
        sParametrosEjecutable := ' /USERNAME:' + Sesion.UserID + ' /MENSAJE:"' + sMensaje + '"';

        //Fixme Horrible sacarlo en cuanto se pueda pasar la sesion por parametro
        CerrarConexion;
        if Pos('"', sFullPath) > 0 then
        begin
          sParametros := Copy(sFullPath, Pos('"', sFullPath) + 1, Length(sFullPath) - Pos('"', sFullPath) - 1);
          sEjecutable := Trim(Copy(sFullPath, 1, Pos('"', sFullPath) - 1));
          if LowerCase(sEjecutable) = 'iexplore.exe' then
            sParametrosEjecutable := '';
          ShellExecute(Handle, 'Open', PChar(sEjecutable), PChar(sParametros + sParametrosEjecutable), PChar(''), SW_SHOWNORMAL)
        end
        else begin
          if LowerCase(sEjecutable) = 'iexplore.exe' then
            sParametrosEjecutable := '';
          FileExec := sFullPath + sParametrosEjecutable;
          WinExec(PAnsiChar(FileExec), SW_NORMAL);
        end;

        if TrayIcon.Active and chkMinimizar.Checked then
          TrayIcon.HideApplication;
      end
      else
        ShowMessage(sErrorMsg);
    end;
  end;    
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if edMaxCantAlertas.Value = 0 then
    edMaxCantAlertas.Value := 5;

  if not DBLogin.Execute then
    Halt;

  Caption := APP_TITLE;

  RecargarEjecutables;
  if trim(CommandValue(CMDLINE_EXE)) <> '' then
    CargarEjecutable(CommandValue(CMDLINE_EXE), CommandValue(CMDLINE_PARAM))
  else
  begin
    if trim(CommandValue(CMDLINE_APLICACION)) <> '' then
      CargarAplicacion(CommandValue(CMDLINE_APLICACION), CommandValue(CMDLINE_PARAM));
  end;

(*
  sSQL := 'SELECT CE_DESCRIPCION, ME_DESCRIPCION, TO_CHAR(SE_ID) || ''-'' || TO_CHAR(SE_SUBEVENTO) AS EVENTO,' +
                ' SE_FECHA, SE_FECHAREALIZADO, SE_ID, SE_SUBEVENTO, SE_FECHACOMPROMETIDA' +
           ' FROM comunes.CME_MOTIVOEVENTO, comunes.CCE_CODIGOEVENTO, comunes.CSE_SEGUIMIENTOEVENTO' +
          ' WHERE SE_FECHAREALIZADO IS NULL' +
            ' AND SE_USUARIOINTERVINIENTE = :Usuario' +
            ' AND SE_IDCODIGOEVENTO = CE_ID' +
            ' AND SE_IDMOTIVOEVENTO = ME_ID' +
            ' AND ROWNUM < 4' +
          ' ORDER BY SE_FECHACOMPROMETIDA';

  with GetQueryEx(sSQL, [Sesion.UserID]) do
  try
    for nPos := 0 to 2 do
      if not Eof then
      begin
        MostrarAlarma_SGC('Sistema de Gestión de Clientes',
                          FieldByName('CE_DESCRIPCION').AsString + #10#13 +
                          FieldByName('ME_DESCRIPCION').AsString + #10#13 +
                          FieldByName('EVENTO').AsString,
                          FieldByName('SE_ID').AsInteger,
                          FieldByName('SE_SUBEVENTO').AsInteger);
        Next;
        Sleep(250);
      end;
  finally
    Free;
  end;
*)
  if IsWin2008Server or IsWindows7 or IsDelphiRunning then
    XPMenu.FlatMenu := False;
end;

procedure TfrmPrincipal.FormSetup;
var
  sCliente: String;
begin
  SetearBotones(UpperCase(trim(Sesion.LoginName)));
  sCliente := Get_OracleClientVersion();

  sb.Panels[1].Text := ' ' + Sesion.Usuario;
  sb.Panels[2].Text := ' ' + Sesion.Sector;
  sb.Panels[3].Text := Iif(IsEmptyString(sCliente), '', ' Cliente v' + sCliente);

  ToolBar.Visible := mnuBarradeBotones.Checked;
  sb.Visible := mnuBarradeEstado.Checked;

  if mnuIconos.Checked then
    lvExplorer.ViewStyle := vsIcon;
  if mnuIconosPequeos.Checked then
    lvExplorer.ViewStyle := vsSmallIcon;
  if mnuLista.Checked then
    lvExplorer.ViewStyle := vsList;
  if mnuDetalle.Checked then
    lvExplorer.ViewStyle := vsReport;

  RevisarOpciones;
end;

procedure TfrmPrincipal.SetearBotones(sUsuario: String);
var
  mostrar: Boolean;
begin
//  mostrar := (sUsuario = 'JOUBEL') or (sUsuario = 'PAIMAR') or (sUsuario = 'JJKOHLHUBER') or (sUsuario = 'CEGONZALEZ') or (sUsuario = 'PMARRONE') or (sUsuario = 'PTAVASCI');

  mostrar := ExisteSql('select 1' +
                        ' from comunes.cuc_usuariocambioexe' +
                       ' where uc_fechabaja is null' +
                         ' and uc_usuario = ' + SqlValue(UpperCase(sUsuario)));

  tbAgregarAplicacion.Visible       := mostrar;
  tbEditarAplicacion.Visible        := mostrar;
  tbHabilitarDeshabilitar.Visible   := mostrar;
  tbSeparadorAdministracion.Visible := mostrar;
  tbCambioDeEjecutables.Visible     := mostrar;
  tbEliminarAplicacion.Visible      := mostrar;
end;

procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar;
end;

procedure TfrmPrincipal.btnSeleccionarArchivoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    edtPath.Text := OpenDialog.FileName;
    ExtractIconFromFile(Icono.Picture.Icon, edtPath.Text);
  end;
end;

procedure TfrmPrincipal.btnAccCancelarClick(Sender: TObject);
begin
  fpAplicacion.Close;
end;

procedure TfrmPrincipal.btnAccAceptarClick(Sender: TObject);
var
  i: Integer;
  Id: Integer;
  IdSectorEjecutable: Integer;
  ms: TMemoryStream;
  Sql: TSql;
begin
  if not VerificarMultiple(['Agregar Imagen',
                            edtDescripcion, edtDescripcion.text <> '', 'Debe completar una descripción para la aplicación',
                            edNombreProyecto, edNombreProyecto.text <> '', 'Debe completar el nombre del proyecto (Nombre Original del Ejecutable).',
                            edtpath, edtPath.text <> '', 'Debe completar un path válido para la aplicación',
                            edtpath, FileExists(edtPath.Text) or chkOmitir.Checked or (Pos('iexplore', LowerCase(edtPath.Text))>0), 'Debe completar un path válido para la aplicación',
                            edtPathAlternativo, edtPathAlternativo.text <> '', 'Debe completar un path alternativo válido para la aplicación',
                            edtPathAlternativo, FileExists(edtPathAlternativo.Text) or chkOmitir.Checked or (Pos('iexplore', LowerCase(edtPathAlternativo.Text))>0), 'Debe completar un path alternativo válido para la aplicación',
                            edtPathCitrix, edtPathCitrix.text <> '', 'Debe completar un path Citrix válido para la aplicación',
                            edtPathCitrix, FileExists(edtPathCitrix.text) or chkOmitir.Checked or (Pos('iexplore', LowerCase(edtPathCitrix.Text))>0), 'Debe completar un path Citrix válido para la aplicación']) then
    Exit;


  ms := TMemoryStream.Create;

  BeginTrans(true);
  try
    Sql := TSql.Create('comunes.cej_ejecutable');

    try
      if ModoABM = maAlta then
      begin
        Sql.SqlType := stInsert;
        Id := GetSecNextVal('comunes.SEQ_CEJ_ID');
        Sql.Fields.Add('ej_usualta',       Sesion.LoginName);
        Sql.Fields.AddDate('ej_fechaalta', DBDateTime);
      end
      else
      begin
        Sql.SqlType := stUpdate;
        Id := Integer(lvExplorer.Selected.Data);
        Sql.Fields.Add('ej_usumodif',       Sesion.LoginName);
        Sql.Fields.AddDate('ej_fechamodif', DBDateTime);
      end;

      Sql.PrimaryKey.Add('ej_id', Id);
      Sql.Fields.Add('ej_descripcion',     edtDescripcion.Text);
      Sql.Fields.Add('ej_path',            edtPath.Text);
      Sql.Fields.Add('ej_pathalternativo', edtPathAlternativo.Text);
      Sql.Fields.Add('ej_pathcitrix',      edtPathCitrix.Text);
      Sql.Fields.Add('ej_proyecto',        edNombreProyecto.Text);
      Sql.Fields.Add('ej_mensaje',         edMensaje.Text);

      ValorSql('select * from dual'); //chanchada, como la conexion esta cerrada solo ante un Select se activa, y asi no falla la sentencia que sigue

      EjecutarSqlST(Sql.Sql, tmNone);

      icono.Picture.Icon.SaveToStream(ms);

      EjecutarSqlST('DELETE FROM comunes.cpe_perfilejecutable' +
                         ' WHERE pe_idEjecutable = ' + SqlValue(Id), tmNone);

      for i := 0 to lbSectoresAsociados.Items.Count - 1 do
      begin
        IdSectorEjecutable := GetSecNextVal('comunes.SEQ_CPE_ID');
        EjecutarSqlST('insert into comunes.cpe_perfilejecutable (pe_id, pe_idejecutable, pe_idgrupo)' +
                                                       ' values (' + SqlValue(IdSectorEjecutable) + ',' +
                                                                     SqlValue(Id) + ',' +
                                                                     SqlValue(TSector(lbSectoresAsociados.Items.Objects[i]).Codigo) + ')', tmNone);
      end;

      CommitTrans;
      SaveBlob('SELECT ej_icono' +
                ' FROM comunes.cej_ejecutable' +
               ' WHERE ej_id = ' + SqlValue(Id),
               'UPDATE comunes.cej_ejecutable' +
                 ' SET ej_icono = :ej_icono' +
               ' WHERE ej_id = ' + SqlValue(Id), 'ej_icono', ms);

      RecargarEjecutables;
      fpAplicacion.ModalResult := mrOk;
    finally
      Sql.Free;
      ms.Free;
    end;
  except
    Rollback(True);
    raise;
  end;
end;

procedure TfrmPrincipal.tbAgregarAplicacionClick(Sender: TObject);
begin
  ModoABM := maAlta;
  fpAplicacion.Caption := FORM_CAP_INSERT;
  CleanAplicaciones;
  CargarSectoresDisponibles(0);
  fpAplicacion.ShowModal;
end;

procedure TfrmPrincipal.CleanAplicaciones;
begin
  edtDescripcion.Text := '';
  edtPath.text := '';
  edtPathAlternativo.text := '';
  edNombreProyecto.text := '';
  edtPathCitrix.text := '';
  edMensaje.text := '';
  lbSectoresAsociados.Clear;
end;

procedure TfrmPrincipal.CargarSectoresDisponibles(IdEjecutable: Integer);
begin
  with GetQuery('select *' +
                 ' from art.usc_sectores' +
                ' where sc_codigo not in (select sc_codigo' +
                                          ' from comunes.cpe_perfilejecutable, art.usc_sectores' +
                                         ' where sc_codigo = pe_idgrupo' +
                                           ' and sc_fechabaja is null' +
                                           ' and pe_idejecutable = ' + SqlValue(IdEjecutable) + ')' +
                  ' and sc_fechabaja is null' +
             ' order by sc_descripcion') do
  try
    lbSectoresDisponibles.Items.clear;
    while not Eof do
    begin
      lbSectoresDisponibles.Items.AddObject(FieldByName('sc_descripcion').AsString, TObject(TSector.Create(FieldByName('sc_codigo').AsString)));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.CargarSectoresAsignados(IdEjecutable: Integer);
begin
  with GetQuery('select usc.*' +
                 ' from comunes.cpe_perfilejecutable, art.usc_sectores usc' +
                ' where sc_fechabaja is null' +
                  ' and sc_codigo = pe_idgrupo' +
                  ' and pe_idejecutable = ' + SqlValue(IdEjecutable) +
             ' order by sc_descripcion') do
  try
    lbSectoresAsociados.Items.Clear;
    while not Eof do
    begin
      lbSectoresAsociados.Items.AddObject(FieldByName('sc_descripcion').AsString, TObject(TSector.Create(FieldByName('sc_codigo').AsString)));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.tbEditarAplicacionClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    if not Assigned(lvExplorer.Selected) then
      Exit;

    ModoABM := maModificacion;
    fpAplicacion.Caption := FORM_CAP_MODIFY;

    CleanAplicaciones;
    CargarSectoresDisponibles(Integer(lvExplorer.Selected.Data));
    edtDescripcion.Text := lvExplorer.Selected.Caption;
    edNombreProyecto.text := lvExplorer.Selected.SubItems[1];
//    edtPath.Text := lvExplorer.Selected.SubItems[0];
    edtPath.Text := GetPathExe(Integer(lvExplorer.Selected.Data));
    edtPathAlternativo.Text := GetPathAlternativoExe(Integer(lvExplorer.Selected.Data));
    edtPathCitrix.Text := GetPathCitrixExe(Integer(lvExplorer.Selected.Data));
    edMensaje.Text := GetMensajeExe(Integer(lvExplorer.Selected.Data));

    BlobSql('select ej_icono' +
             ' from comunes.cej_ejecutable' +
            ' where ej_id = ' + SqlValue(Integer(lvExplorer.Selected.Data)), Stream);

    Stream.Position := 0;

    try
      icono.Picture.Icon.LoadFromStream(Stream);
    except
      //
    end;

    CargarSectoresAsignados(Integer(lvExplorer.Selected.Data));

    fpAplicacion.ShowModal;
  finally
    Stream.Free;
  end;
end;

procedure TfrmPrincipal.tbEliminarAplicacionClick(Sender: TObject);
begin
  if Assigned(lvExplorer.Selected) then
    if (MessageBox(0, '¿ Desea eliminar el ejecutable seleccionado ?', '', MB_ICONQUESTION or MB_YESNO) = idYes) then
    begin
      ValorSql('select * from dual'); //chanchada, como la conexion esta cerrada solo ante un Select se activa, y asi no falla la sentencia que sigue
      EjecutarSql('update comunes.cej_ejecutable' +
                    ' set ej_fechabaja = sysdate,' +
                        ' ej_usubaja = ' + SqlValue(Sesion.LoginName) +
                  ' where ej_id = ' + SqlValue(Integer(lvExplorer.Selected.Data)));
      RecargarEjecutables;
    end;
end;

procedure TfrmPrincipal.lvExplorerDblClick(Sender: TObject);
begin
  CorrerEjecutable;
end;

procedure TfrmPrincipal.iconoDblClick(Sender: TObject);
var
  Pic: TPicture;
begin
  Pic := TPicture.Create;
  try
    if OpenPictureDialog.Execute then
      Pic.LoadFromFile(OpenPictureDialog.FileName);
    Icono.Picture := Pic;
  finally
    Pic.free;
  end;
end;

procedure TfrmPrincipal.tbHabilitarDeshabilitarClick(Sender: TObject);
var
  Activo: String;
begin
  if Assigned(lvExplorer.Selected) then
  begin
    if MsgBox('¿Desea ' + iif(lvExplorer.Selected.OverlayIndex = -1, 'DESHABILITAR', 'HABILITAR') + ' la aplicación ' + lvExplorer.Selected.Caption + '?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      if lvExplorer.Selected.OverlayIndex = -1 then
        activo := 'N'
      else
        activo := 'S';

      ValorSql('select * from dual'); //chanchada, como la conexion esta cerrada solo ante un Select se activa, y asi no falla la sentencia que sigue
      EjecutarSqlEx('update comunes.cej_ejecutable' +
                      ' set ej_activo = :activo' +
                    ' where ej_id = :id ', [activo, Integer(lvExplorer.Selected.Data)]);
      RecargarEjecutables;
    end;
  end else
    InfoHint(tbHabilitarDeshabilitar, 'Debe seleccionar una aplicación.');
end;

procedure TfrmPrincipal.mnuAcercadeClick(Sender: TObject);
begin
  with TfrmSplash.Create(Self) do
  try
    stConectando.Caption := 'Portal de Aplicaciones - Provincia A.R.T.';
    Progreso.Animate := False;
    Progreso.Visible := False;    
    Show;
    Update;
    Sleep(2000);
  finally
    Free;
  end;
end;

{ TSector }

constructor TSector.Create(ACodigo: String);
begin
  Codigo := ACodigo;
end;

procedure TfrmPrincipal.btnAgregarClick(Sender: TObject);
var
  nIndice: Integer;
begin
  if lbSectoresDisponibles.ItemIndex < 0 then
    Exit;
    
  if lbSectoresAsociados.Items.IndexOf(lbSectoresDisponibles.Items.Strings[lbSectoresDisponibles.ItemIndex]) < 0 then
  begin
    lbSectoresAsociados.Items.AddObject(lbSectoresDisponibles.Items.Strings[lbSectoresDisponibles.ItemIndex],
                                        lbSectoresDisponibles.Items.Objects[lbSectoresDisponibles.ItemIndex]);

    if lbSectoresAsociados.ItemIndex < lbSectoresAsociados.Items.Count then
      lbSectoresAsociados.ItemIndex := lbSectoresAsociados.ItemIndex + 1
    else if lbSectoresAsociados.Items.Count > 0 then
      lbSectoresAsociados.ItemIndex := lbSectoresAsociados.ItemIndex - 1;

    nIndice := lbSectoresDisponibles.ItemIndex;
    lbSectoresDisponibles.Items.Delete(lbSectoresDisponibles.ItemIndex);

    if (lbSectoresDisponibles.Items.Count > 0) and (lbSectoresDisponibles.Items.Count = nIndice) then
      lbSectoresDisponibles.ItemIndex := nIndice - 1
    else if lbSectoresDisponibles.Items.Count > 0 then
      lbSectoresDisponibles.ItemIndex := nIndice;

    if lbSectoresDisponibles.ItemIndex >= 0 then
      lbSectoresDisponibles.Selected[lbSectoresDisponibles.ItemIndex] := True;
      
    if lbSectoresDisponibles.CanFocus then
      lbSectoresDisponibles.SetFocus;
  end;
end;

procedure TfrmPrincipal.edtPathChange(Sender: TObject);
begin
  if not Assigned(Icono.Picture.Icon) then
    ExtractIconFromFile(Icono.Picture.Icon, edtPath.Text);
end;

procedure TfrmPrincipal.mnuBarradeBotonesClick(Sender: TObject);
begin
  mnuBarradeBotones.Checked := not mnuBarradeBotones.Checked;
  ToolBar.Visible := mnuBarradeBotones.Checked;
end;

procedure TfrmPrincipal.mnuBarradeEstadoClick(Sender: TObject);
begin
  mnuBarradeEstado.Checked := not mnuBarradeEstado.Checked;
  sb.Visible := mnuBarradeEstado.Checked;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  FormSetup;
end;

procedure TfrmPrincipal.btnQuitarClick(Sender: TObject);
var
  nIndice: Integer;
begin
  if lbSectoresAsociados.ItemIndex < 0 then
    Exit;

  lbSectoresDisponibles.Items.AddObject(lbSectoresAsociados.Items.Strings[lbSectoresAsociados.ItemIndex],
                                        lbSectoresAsociados.Items.Objects[lbSectoresAsociados.ItemIndex]);

  if lbSectoresDisponibles.ItemIndex < lbSectoresDisponibles.Items.Count then
    lbSectoresDisponibles.ItemIndex := lbSectoresDisponibles.ItemIndex + 1
  else if lbSectoresDisponibles.Items.Count > 0 then
    lbSectoresDisponibles.ItemIndex := lbSectoresDisponibles.ItemIndex - 1;

  nIndice := lbSectoresAsociados.ItemIndex;
  lbSectoresAsociados.Items.Delete(lbSectoresAsociados.ItemIndex);

  if (lbSectoresAsociados.Items.Count > 0) and (lbSectoresAsociados.Items.Count = nIndice) then
    lbSectoresAsociados.ItemIndex := nIndice - 1
  else if lbSectoresAsociados.Items.Count > 0 then
    lbSectoresAsociados.ItemIndex := nIndice;

  if lbSectoresAsociados.ItemIndex >= 0 then
    lbSectoresAsociados.Selected[lbSectoresAsociados.ItemIndex] := True;

  if lbSectoresAsociados.CanFocus then
    lbSectoresAsociados.SetFocus;
end;

procedure TfrmPrincipal.mnuShowHideClick(Sender: TObject);
begin
  if IsWindowVisible(Handle) then
    TrayIcon.HideApplication
  else
    TrayIcon.ShowApplication;
end;

procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.tbCambioDeEjecutablesClick(Sender: TObject);
begin
  with TFormCambioEjecutable.Create(self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuOpcionesClick(Sender: TObject);
begin
  fpOpciones.ShowModal;
end;

procedure TfrmPrincipal.IconosBase;
var
  mnu: TMenuItem;
begin

  mnu := TMenuItem.Create(Self);
  with mnu do
  begin
    Caption := '-';
    popTrayIcon.Items.add(mnu);
  end;


  mnu := TMenuItem.Create(Self);
  with mnu do
  begin
    Caption := 'Mostrar / Ocultar';
    OnClick := mnuShowHideClick;
    popTrayIcon.Items.Add(mnu);
  end;


  mnu := TMenuItem.Create(Self);
  with mnu do
  begin
    Caption := 'Salir';
    OnClick := mnuSalirClick;
    popTrayIcon.Items.Add(mnu);
  end;
end;

procedure TfrmPrincipal.AgregarAplicacion(ACaption: String; AIcon: Integer; AIndex: Integer; aEnabled: Boolean);
var
  mnu: TMenuItem;
begin
  mnu := TMenuItem.Create(Self);
  with mnu do
  begin
    Caption := ACaption;
    ImageIndex := AIcon;
    tag := AIndex;
    OnClick := CorrerEjecutableByIndex;
    popTrayIcon.Items.add(mnu);
    mnu.Enabled := aEnabled;
  end;
end;

procedure TfrmPrincipal.CorrerEjecutableByIndex(Sender: TObject);
var
  ErrorMsg, sFullPath, sMensaje, sEjecutable, sParametros, sParametrosEjecutable: String;
  FileExec: AnsiString;
begin
  if IsActive(Integer(lvExplorer.Items[(Sender as TMenuItem).Tag].Data)) then
  begin
    lvExplorer.Items[(Sender as TMenuItem).Tag].OverlayIndex := -1;
    lvExplorer.Items[(Sender as TMenuItem).Tag].Cut := False;
  end else
  begin
    lvExplorer.Items[(Sender as TMenuItem).Tag].OverlayIndex := 0;
    lvExplorer.Items[(Sender as TMenuItem).Tag].Cut := True;
  end;

  if Assigned(lvExplorer.Items[(Sender as TMenuItem).Tag]) and (lvExplorer.Items[(Sender as TMenuItem).Tag].OverlayIndex = -1) then
  begin
    if sender is TMenuItem then
    begin
      if IsCITRIX then
        sFullPath := GetPathCitrixExe(Integer(lvExplorer.Items[(Sender as TMenuItem).Tag].Data))
      else
        sFullPath := GetPathExe(Integer(lvExplorer.Items[(Sender as TMenuItem).Tag].Data));

      ErrorMsg := GetApplicationMessage(lvExplorer.Items[(Sender as TMenuItem).Tag].SubItems[0]);
      if ErrorMsg = '' then
      begin
        if FileExists(sFullPath) then
          ChDir(ExtractFilePath(PChar(sFullPath)))
        else
        begin
          sFullPath := GetPathAlternativoExe(Integer(lvExplorer.Items[(Sender as TMenuItem).Tag].Data));
          if FileExists(sFullPath) then
            ChDir(ExtractFilePath(PChar(sFullPath)));
        end;

        sMensaje := GetMensajeExe(Integer(lvExplorer.Items[(Sender as TMenuItem).Tag].Data));
        sParametrosEjecutable := ' /USERNAME:' + Sesion.UserID + ' /MENSAJE:"' + sMensaje + '"';
        
        if Pos('iexplore.exe', LowerCase(sFullPath)) > 0 then
          sParametrosEjecutable := '';

        //Fixme Horrible sacarlo en cuanto se pueda pasar la sesion por parametro
        CerrarConexion;
        if Pos('"', sFullPath) > 0 then
        begin
          sParametros := Copy(sFullPath, Pos('"', sFullPath) + 1, Length(sFullPath) - Pos('"', sFullPath) - 1);
          sEjecutable := Trim(Copy(sFullPath, 1, Pos('"', sFullPath) - 1));
          if LowerCase(sEjecutable) = 'iexplore.exe' then
            sParametrosEjecutable := '';
          ShellExecute(Handle, 'Open', PChar(sEjecutable), PChar(sParametros + sParametrosEjecutable), PChar(''), SW_SHOWNORMAL)
        end
        else begin
          if LowerCase(sEjecutable) = 'iexplore.exe' then
            sParametrosEjecutable := '';
          FileExec := sFullPath + sParametrosEjecutable;
          WinExec(PAnsiChar(FileExec), SW_NORMAL);
        end;

        if TrayIcon.Active and chkMinimizar.Checked then
          TrayIcon.HideApplication;
      end
      else
        ShowMessage(ErrorMsg);
    end;
  end;  
end;

procedure TfrmPrincipal.RevisarOpciones;
begin
  TrayIcon.Active := chkMostrarIcono.Checked;
  
  if chkMostrarBarra.Checked then
    TrayIcon.Visibility := [tvVisibleTaskBar,tvVisibleTaskList,tvRestoreClick,tvRestoreDbClick,tvMinimizeClick,tvMinimizeDbClick]
  else
    TrayIcon.Visibility := [tvVisibleTaskList,tvRestoreClick,tvRestoreDbClick,tvMinimizeClick,tvMinimizeDbClick];

  if TrayIcon.Active then
    TrayIcon.ShowApplication;
end;

procedure TfrmPrincipal.btnAceptarOpcionClick(Sender: TObject);
begin
  fpOpciones.Close;
  RevisarOpciones;
end;

procedure TfrmPrincipal.btnAgregarTodoClick(Sender: TObject);
var
  nIndice: Integer;
begin
  for nIndice := lbSectoresDisponibles.Items.Count - 1 downto 0 do
  begin
    lbSectoresAsociados.Items.AddObject(lbSectoresDisponibles.Items.Strings[nIndice], 
                                        lbSectoresDisponibles.Items.Objects[nIndice]);

    lbSectoresDisponibles.Items.Delete(nIndice);
  end;
end;

procedure TfrmPrincipal.btnQuitarTodoClick(Sender: TObject);
var
  nIndice: Integer;
begin
  for nIndice := lbSectoresAsociados.Items.Count - 1 downto 0 do
  begin
    lbSectoresDisponibles.Items.AddObject(lbSectoresAsociados.Items.Strings[nIndice],
                                          lbSectoresAsociados.Items.Objects[nIndice]);

    lbSectoresAsociados.Items.Delete(nIndice);
  end;
end;

{procedure TfrmPrincipal.DoAlertShow(Sender: TObject);
begin
  Inc(FCount);
end;}

{procedure TfrmPrincipal.DoAlertClose(Sender: TObject);
begin
  Dec(FCount);
end;}

{procedure TfrmPrincipal.DoMessageClick(Sender: TObject);
begin
//
end;}
{------------------------------------------------------------------------------}
{procedure TfrmPrincipal.DoButtonClick(Sender: TObject);
var
  sEvento: string;
begin
  sEvento := IntToStr(Trunc(TControl(Sender).Tag/100)) + '-' +
             IntToStr(Trunc(GetDecimales(TControl(Sender).Tag/100)*100));
  CargarEjecutable('SISTEMAGESTIONCLIENTES.EXE', 'EV' + sEvento);
end;}

procedure TfrmPrincipal.TimerEventosTimer(Sender: TObject);
begin
  acEventosPendientes.Execute;
end;

procedure TfrmPrincipal.RestoreRequest(var message: TMessage);
begin
  if message.WParam = 1 then
    ProcesarParametros;
end;

procedure TfrmPrincipal.ProcesarParametros;
var
  IniFile: TIniFile;
  sAplicacion: String;  
  sEjecutable: String;
  sParametros: String;
begin
  IniFile := TIniFile.Create(TempPath + ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
  try
    sEjecutable := Inifile.ReadString(INI_SECTION, INI_VALUE_EXE, '');
    sParametros := Inifile.ReadString(INI_SECTION, INI_VALUE_PARAM, '');
    sAplicacion := Inifile.ReadString(INI_SECTION, INI_VALUE_APLICACION, '');

    if Trim(sEjecutable) <> '' then
      CargarEjecutable(sEjecutable, sParametros)
    else
      if Trim(sAplicacion) <> '' then
        CargarAplicacion(sAplicacion, sParametros)
      else
      begin
        if IsIconic(Application.Handle) = True then
          TrayIcon.ShowApplication
        else
          Application.Restore;
      end;
  finally
    Inifile.WriteString(INI_SECTION, INI_VALUE_EXE, '');
    Inifile.WriteString(INI_SECTION, INI_VALUE_PARAM, '');
    Inifile.WriteString(INI_SECTION, INI_VALUE_APLICACION, '');
    IniFile.Free;
  end;
end;

procedure TfrmPrincipal.CargarEjecutable(Ejecutable, Parametros: String);
var
  ErrorMsg: String;
  i: Integer;
  sEjecutable: String;
  sPathEjecutable: String;
  FileExec: AnsiString;
begin
  sEjecutable := UpperCase(Ejecutable);

  for i := 0 to lvExplorer.Items.Count - 1 do
  begin
    sPathEjecutable := UpperCase(lvExplorer.Items[i].SubItems[0]);

    if PosEx(sEjecutable, sPathEjecutable) > 0 then
    begin
      ErrorMsg := GetApplicationMessage(sPathEjecutable);

      if ErrorMsg = '' then
      begin
        //Fixme Horrible sacarlo en cuanto se pueda pasar la sesion por parametro
        CerrarConexion;
        //WinExec({$IFNDEF VER150}PAnsiChar{$ELSE}PChar{$ENDIF}(sPathEjecutable + ' ' + Parametros), SW_NORMAL);
        FileExec := sPathEjecutable + ' ' + Parametros;
        WinExec(PAnsiChar(FileExec), SW_NORMAL);
        if TrayIcon.Active and chkMinimizar.Checked then
          TrayIcon.HideApplication;
      end
      else
        ShowMessage(ErrorMsg);

      Break
    end;
  end;
end;

function TfrmPrincipal.IsActive(IdEjecutable: Integer): Boolean;
begin
  Result := ExisteSQLEx('select 1 from comunes.cej_ejecutable where ej_id = :id and ej_activo = :activo', [SqlValue(IdEjecutable), 'S']);
end;

procedure TfrmPrincipal.CargarAplicacion(AplicacionDesc, Parametros: String);
var
  ErrorMsg: String;
  i: Integer;
  sAplicacionDesc: String;
  sPathEjecutable: String;
  FileExec: AnsiString;
begin
  sAplicacionDesc := UpperCase(AplicacionDesc);

  for i := 0 to lvExplorer.Items.Count - 1 do
  begin
    if (sAplicacionDesc = UpperCase(lvExplorer.Items[i].Caption)) then
    begin
      sPathEjecutable := GetPathExe(integer(lvExplorer.Items[i].Data));

      ErrorMsg := GetApplicationMessage(sPathEjecutable);

      if ErrorMsg = '' then
      begin
        //Fixme Horrible sacarlo en cuanto se pueda pasar la sesion por parametro
        CerrarConexion;
        FileExec := sPathEjecutable + ' ' + Parametros;
        WinExec(PAnsiChar(FileExec), SW_NORMAL);
        if TrayIcon.Active and chkMinimizar.Checked then
          TrayIcon.HideApplication;
      end
      else
        ShowMessage(ErrorMsg);

      Break
    end;
  end;
end;

(*
procedure TfrmPrincipal.VerificarConexion;
begin
  //Si no esta conectado Reconecta a la base
  //Solución de transicion porque el portal agrega una sesion mas.
  if not dmPrincipal.sdbPrincipal.Connected then dmPrincipal.ReconectarBD;
end;
*)

procedure TfrmPrincipal.CerrarConexion;
begin
  dmPrincipal.sdbPrincipal.Close;
end;

procedure TfrmPrincipal.mnuPropiedades1Click(Sender: TObject);
var
  sFecha, sFile: String;
begin
  if Assigned(lvExplorer.Selected) and (lvExplorer.Selected.OverlayIndex = -1) then
  begin
    sFile := GetPathExe(integer(lvExplorer.Selected.Data));
    sFecha := Get_StrDateTimeFile(sFile);
    if not IsEmptyString(sFecha) then
      MsgBox('La Fecha de Creación es: ' + sFecha, MB_ICONINFORMATION);
  end;
end;

function TfrmPrincipal.GetPathAlternativoExe(IdEjecutable: Integer): String;
begin
  Result := ValorSql('select ej_pathalternativo from comunes.cej_ejecutable where ej_id = ' + SqlValue(IdEjecutable));
end;

procedure TfrmPrincipal.btnSeleccionarArchivoAlterClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edtPathAlternativo.Text := OpenDialog.FileName;
end;

procedure TfrmPrincipal.btnSeleccionarArchivoCitrixClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edtPathCitrix.Text := OpenDialog.FileName;
end;

function TfrmPrincipal.GetPathCitrixExe(IdEjecutable: Integer): String;
begin
  Result := ValorSql('select ej_pathcitrix from comunes.cej_ejecutable where ej_id = ' + SqlValue(IdEjecutable));
end;

function TfrmPrincipal.GetMensajeExe(IdEjecutable: Integer): String;
begin
  Result := ValorSql('select ej_mensaje from comunes.cej_ejecutable where ej_id = ' + SqlValue(IdEjecutable));
end;

procedure TfrmPrincipal.mnuConsultarEventosPendientesClick(Sender: TObject);
begin
//
end;

end.
