unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ImgList, Placemnt, artSeguridad,
  Login, artDbLogin, ComCtrls, StdCtrls, unArtFrame, unFraStaticCodigoDescripcion, Db, SDEngine, XPMenu, ExtCtrls,
  JvBackgrounds, QuickRpt, QRCtrls, Buttons, ShellCtrls, Mask, ToolEdit, DateComboBox, FormPanel, JvExButtons, JvBitBtn,
  JvExComCtrls, JvProgressBar, Registry, JvCaptionButton, JvBalloonHint, JvComponent, JvTrayIcon, unManReportesWeb,
  unManRotulosReporte, unManConsultasRotulos, unAlertas;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mnuSalir: TMenuItem;
    sbEstado: TStatusBar;
    mnuVentana: TMenuItem;
    mnuMaximizar: TMenuItem;
    mnuRestaurar: TMenuItem;
    mnuMinimizar: TMenuItem;
    sep1: TMenuItem;
    mnuCascada: TMenuItem;
    mnuMosaicoHorizontal: TMenuItem;
    mnuMosaicoVertical: TMenuItem;
    mnuOrganizarIconos: TMenuItem;
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
    ilSingleImages: TImageList;
    ilByN: TImageList;
    ilColor: TImageList;
    XPMenu: TXPMenu;
    mnuGeneral: TMenuItem;
    mnuDomicilios: TMenuItem;
    mnuTesteadorLOG: TMenuItem;
    mnuExplorador: TMenuItem;
    mnuCorreoElectronico: TMenuItem;
    mnuEnviar: TMenuItem;
    mnuOutlook: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuEjecutables: TMenuItem;
    mnuElementosEnviados: TMenuItem;
    JvBackground: TJvBackground;
    mnuLibretaDeDirecciones: TMenuItem;
    mnuReportes: TMenuItem;
    mnuImprimir: TMenuItem;
    mnuExportaraPDF: TMenuItem;
    rptReporte: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    mnuPrevisualizar: TMenuItem;
    mnuBajarAdjuntosAUnDirectorio: TMenuItem;
    fpBajar: TFormPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbDesde: TDateComboBox;
    cmbHasta: TDateComboBox;
    ArbolDirectorios: TShellTreeView;
    N1: TMenuItem;
    N2: TMenuItem;
    btnAceptar: TJvBitBtn;
    Label3: TLabel;
    Progreso: TJvProgressBar;
    Label4: TLabel;
    FormPlacement: TFormStorage;
    lbProgreso: TLabel;
    JvTrayIcon: TJvTrayIcon;
    JvBalloonHint: TJvBalloonHint;
    JvCaptionButton: TJvCaptionButton;
    mnuEspera: TMenuItem;
    mnuIniciar: TMenuItem;
    mnuDetener: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    mnuEditorSQL: TMenuItem;
    N5: TMenuItem;
    mnuVentanas: TMenuItem;
    N6: TMenuItem;
    mnuBuquedaEnJEDI: TMenuItem;
    TimerLapaconico: TTimer;
    btnLapaconico: TMenuItem;
    mnuDireccionesdeCorreo: TMenuItem;
    mnuRelacionEntreUsuariosySectores: TMenuItem;
    mnuPedidosWeb: TMenuItem;
    mnuRotulosReporte: TMenuItem;
    mnuReportesWeb: TMenuItem;
    mnuConsultaRotulo: TMenuItem;
    mnuTestAlertasServer: TMenuItem;
    N7: TMenuItem;
    procedure mnuSalirClick(Sender: TObject);
    procedure mnuMaximizarClick(Sender: TObject);
    procedure mnuRestaurarClick(Sender: TObject);
    procedure mnuMinimizarClick(Sender: TObject);
    procedure mnuCascadaClick(Sender: TObject);
    procedure mnuMosaicoHorizontalClick(Sender: TObject);
    procedure mnuMosaicoVerticalClick(Sender: TObject);
    procedure mnuOrganizarIconosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLoginLogin(Sender: TObject);
    procedure mnuDomiciliosClick(Sender: TObject);
    procedure mnuTesteadorLOGClick(Sender: TObject);
    procedure mnuExploradorClick(Sender: TObject);
    procedure mnuEnviarClick(Sender: TObject);
    procedure mnuOutlookClick(Sender: TObject);
    procedure mnuEjecutablesClick(Sender: TObject);
    procedure mnuElementosEnviadosClick(Sender: TObject);
    procedure mnuLibretaDeDireccionesClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
    procedure mnuExportaraPDFClick(Sender: TObject);
    procedure mnuPrevisualizarClick(Sender: TObject);
    procedure mnuBajarAdjuntosAUnDirectorioClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpBajarBeforeShow(Sender: TObject);
    procedure fpBajarClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvCaptionButtonClick(Sender: TObject);
    procedure mnuIniciarClick(Sender: TObject);
    procedure mnuDetenerClick(Sender: TObject);
    procedure mnuEditorSQLClick(Sender: TObject);
    procedure mnuVentanaClick(Sender: TObject);
    procedure mnuVentaShowClick(Sender: TObject);
    procedure mnuBuquedaEnJEDIClick(Sender: TObject);
    procedure TimerLapaconicoTimer(Sender: TObject);
    procedure btnLapaconicoClick(Sender: TObject);
    procedure mnuDireccionesdeCorreoClick(Sender: TObject);
    procedure fpBajarShow(Sender: TObject);
    procedure mnuRelacionEntreUsuariosySectoresClick(Sender: TObject);
    procedure mnuRotulosReporteClick(Sender: TObject);
    procedure mnuReportesWebClick(Sender: TObject);
    procedure mnuConsultaRotuloClick(Sender: TObject);
    procedure mnuTestAlertasServerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FAlertas: TAlertas;
    RutaArchivos: String;

    procedure RefreshAlertas(Sender: TObject);
  end;

procedure MostrarEstado(const Parrafo: String);

var
  frmPrincipal: TfrmPrincipal;
  RegIniFile: TRegIniFile;

implementation

uses
  unDmPrincipal, unDomicilios, unTesteadorLOG, unExplorador, unEnvioMail, unOutlook, unMoldeEnvioMail,
  unManCEJ_EJECUTABLE, unElementosEnviadosGlobal, unLibretaDeDirecciones, unExportPDF, unVisualizador, CustomDlgs,
  DateTimeFuncs, unCustomConsulta, ShellAPI, WinShell, General, unEspera, unEditorSql, unBusquedaControlVersion, unAlarmas,
  unManCHG_HECHOGENERADORMAIL, unManCUS_USUARIOSECTOR, unDmMonitor, unLogs;

{$R *.DFM}

procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure MostrarEstado(const Parrafo: String);
begin
  frmPrincipal.sbEstado.SimpleText := Parrafo;
end;

procedure TfrmPrincipal.mnuMaximizarClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmPrincipal.mnuRestaurarClick(Sender: TObject);
begin
  WindowState := wsNormal;
end;

procedure TfrmPrincipal.mnuMinimizarClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TfrmPrincipal.mnuCascadaClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmPrincipal.mnuMosaicoHorizontalClick(Sender: TObject);
begin
  TileMode  := tbHorizontal;
  Tile;
end;

procedure TfrmPrincipal.mnuMosaicoVerticalClick(Sender: TObject);
begin
  TileMode  := tbVertical;
  Tile;
end;

procedure TfrmPrincipal.mnuOrganizarIconosClick(Sender: TObject);
begin
  ArrangeIcons ;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  //Setea los Formatos de la Configuración Regional para la Aplicación
  Application.UpdateFormatSettings := False;                                                                                                                                                                                                                                                      Color := clMaroon; //Esto es para que ALapaco no lo vea !! jajajajjaja by PTavasci
  CurrencyString    := '$';
  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  DateSeparator     := '/';
  TimeSeparator     := ':';
  ShortTimeFormat   := 'H:mm:ss';
  LongTimeFormat    := 'H:mm:ss';
  ShortDateFormat   := 'dd/mm/yyyy';

  Caption := Application.Title + ' - ' + DBLogin.Usuario;
  rptReporte.Top := -8000;

  FAlertas := nil;
end;

procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar ;
end;

procedure TfrmPrincipal.mnuDomiciliosClick(Sender: TObject);
begin
  Abrir(TfrmDomicilios, frmDomicilios, tmvNormal, mnuDomicilios);
end;

procedure TfrmPrincipal.mnuTesteadorLOGClick(Sender: TObject);
begin
  Abrir(TfrmTesteadorLOG, frmTesteadorLOG, tmvNormal, mnuTesteadorLOG);
end;

procedure TfrmPrincipal.mnuExploradorClick(Sender: TObject);
begin
  Abrir(TfrmExplorador, frmExplorador, tmvNormal, mnuExplorador);
end;

procedure TfrmPrincipal.mnuEnviarClick(Sender: TObject);
begin
  EnviarMailBD(DBLogin.UserID, 'Asunto predeterminado',
               [TOpcionEnvioMail(oAlwaysShowDialog), TOpcionEnvioMail(oAutoFirma)], 'Texto de prueba');
end;

procedure TfrmPrincipal.mnuOutlookClick(Sender: TObject);
begin
  Abrir(TfrmOutlook, frmOutlook, tmvNormal, mnuOutlook);
end;

procedure TfrmPrincipal.mnuEjecutablesClick(Sender: TObject);
begin
  Abrir(TfrmManCEJ_EJECUTABLE, frmManCEJ_EJECUTABLE, tmvNormal, mnuEjecutables);
end;

procedure TfrmPrincipal.mnuElementosEnviadosClick(Sender: TObject);
begin
  Abrir(TfrmElementosEnviadosGlobal, frmElementosEnviadosGlobal, tmvNormal, mnuElementosEnviados);
end;

procedure TfrmPrincipal.mnuLibretaDeDireccionesClick(Sender: TObject);
begin
//  Abrir(TfrmLibretaDeDirecciones, frmLibretaDeDirecciones, tmvNormal, mnuLibretaDeDirecciones);
end;

procedure TfrmPrincipal.mnuImprimirClick(Sender: TObject);
begin
  rptReporte.Print;
end;

procedure TfrmPrincipal.mnuExportaraPDFClick(Sender: TObject);
begin
  with TSaveDialog.Create(Self) do
  try
    if Execute then
      ExportarPDF(rptReporte, FileName);
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuPrevisualizarClick(Sender: TObject);
begin
  Visualizar(rptReporte, GetValores());
end;

procedure TfrmPrincipal.mnuBajarAdjuntosAUnDirectorioClick(Sender: TObject);
begin
  RegIniFile.OpenKey('\Software\' + ChangeFileExt(ExtractFileName(Application.ExeName), ''), True);
  RutaArchivos := RegIniFile.ReadString('Opciones', 'Carpeta', 'c:\');
  lbProgreso.Caption := '';

  fpBajar.ShowModal;
end;

procedure TfrmPrincipal.btnAceptarClick(Sender: TObject);
var
  sSQL, sFileName: String;
  i: Integer;
begin
  Verificar(cmbDesde.IsEmpty, cmbDesde, 'Debe indicar la fecha inicial.');
  Verificar(cmbHasta.IsEmpty, cmbHasta, 'Debe indicar la fecha final.');
  Verificar(not DirectoryExists(ArbolDirectorios.Path), ArbolDirectorios, 'Debe indicar un directorio válido.');

  if not ForceDirectories(ArbolDirectorios.Path + '\Prueba') then
    InfoHint(ArbolDirectorios, 'Ud. no tiene permiso de escritura sobre la carpeta que ha elegido.', True)
  else
    RemoveDir(ArbolDirectorios.Path + '\Prueba');

  RutaArchivos := ArbolDirectorios.Path;

  for i := 0 to Trunc(cmbHasta.Date - cmbDesde.Date) do
    ForceDirectories(IncludeTrailingPathDelimiter(RutaArchivos) + FormatDateTime('YYYYMMDD', cmbDesde.Date + i) + '\');

  sSQL := 'SELECT EE_FECHAMENSAJE, EA_ID, EA_CUERPOADJUNTO, EA_NOMBREADJUNTO, EA_LINK, EA_PATH ' +
            'FROM COMUNES.CEA_EMAILADJUNTO, COMUNES.CEE_EMAILAENVIAR ' +
           'WHERE EA_IDEMAILAENVIAR = EE_ID ' +
             'AND EE_FECHAMENSAJE BETWEEN :FechaDesde AND :FechaHasta ' +
             'AND EA_CUERPOADJUNTO IS NOT NULL ' +
             'AND EA_LINK = :Link ' +
        'ORDER BY EE_ID DESC';

  with GetQueryEx(sSQL, [TDateTimeEx.Create(cmbDesde.Date), TDateTimeEx.Create(cmbHasta.Date), 'N']) do
  try
    First;
    Progreso.Max := RecordCount;
    Progreso.Position := 0;
    while not Eof do
    begin
      lbProgreso.Caption := IntToStr(Progreso.Position + 1) + ' de ' + IntToStr(Progreso.Max) + ' archivos';
      sFileName := IncludeTrailingPathDelimiter(RutaArchivos) + FormatDateTime('YYYYMMDD', FieldByName('EE_FECHAMENSAJE').AsDateTime) + '\' + FieldByName('EA_ID').AsString;
      sFileName := ChangeFileExt(sFileName, ExtractFileExt(FieldByName('EA_NOMBREADJUNTO').AsString));

      if FieldByName('EA_LINK').AsString = 'N' then
      begin
        if TBlobField(FieldByName('EA_CUERPOADJUNTO')).IsBlob then
          if not FileExists(sFileName) then
            TBlobField(FieldByName('EA_CUERPOADJUNTO')).SaveToFile(sFileName);
      end else
        CreateShellLink(FieldByName('EA_PATH').AsString, ExtractFileDir(sFileName), ExtractFileName(sFileName));

      Progreso.StepBy(1);
      Progreso.Update;
      lbProgreso.Update;
      Next;
    end;

    Close;
    lbProgreso.Caption := 'Actualizando los datos...';
    lbProgreso.Update;

    sSQL := 'UPDATE COMUNES.CEA_EMAILADJUNTO CEA1 ' +
               'SET CEA1.EA_CUERPOADJUNTO = NULL, ' +
                   'CEA1.EA_PATH = :Path || (SELECT TO_CHAR(EE_FECHAMENSAJE, ''YYYYMMDD'') ' +
                                              'FROM COMUNES.CEA_EMAILADJUNTO CEA2, COMUNES.CEE_EMAILAENVIAR ' +
                                             'WHERE CEA2.EA_IDEMAILAENVIAR = EE_ID ' +
                                               'AND CEA2.EA_ID = CEA1.EA_ID) || ''\'' || CEA1.EA_ID || ART.VARIOS.ExtractFileExt(CEA1.EA_NOMBREADJUNTO) ' +
             'WHERE CEA1.EA_ID IN (SELECT EA_ID ' +
                                    'FROM COMUNES.CEA_EMAILADJUNTO CEA3, COMUNES.CEE_EMAILAENVIAR ' +
                                   'WHERE CEA3.EA_IDEMAILAENVIAR = EE_ID ' +
                                     'AND EE_FECHAMENSAJE BETWEEN :FechaDesde AND :FechaHasta ' +
                                     'AND CEA3.EA_CUERPOADJUNTO IS NOT NULL ' +
                                     'AND CEA3.EA_LINK = :Link)';
    EjecutarSQLEx(sSQL, [IncludeTrailingPathDelimiter(RutaArchivos), TDateTimeEx.Create(cmbDesde.Date), TDateTimeEx.Create(cmbHasta.Date), 'N']);
    MsgBox('Proceso finalizado.')
  finally
    Progreso.Position := 0;
    Free;
  end;

  fpBajar.ModalResult := mrOK;
end;

procedure TfrmPrincipal.fpBajarBeforeShow(Sender: TObject);
begin
  if DirectoryExists(RutaArchivos) then
    ArbolDirectorios.Path := RutaArchivos;
end;

procedure TfrmPrincipal.fpBajarClose(Sender: TObject; var Action: TCloseAction);
begin
  RegIniFile.WriteString('Opciones', 'Carpeta', ArbolDirectorios.Path);
end;

procedure TfrmPrincipal.JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  JvTrayIcon.ShowApplication;
  JvTrayIcon.Active := False;
end;

procedure TfrmPrincipal.JvCaptionButtonClick(Sender: TObject);
begin
  JvTrayIcon.Active := True;
  JvTrayIcon.HideApplication;
end;

procedure TfrmPrincipal.mnuIniciarClick(Sender: TObject);
begin
  IniciarEspera;
  with GetQueryEx('SELECT * FROM ZMO_MOVIM WHERE MO_COD = :Codigo', [508]) do
  try
    while (not Eof) and (recno < 200) do
      Next;
  finally
    Free;
  end;
  DetenerEspera;
end;

procedure TfrmPrincipal.mnuDetenerClick(Sender: TObject);
begin
  DetenerEspera;
end;

procedure TfrmPrincipal.mnuEditorSQLClick(Sender: TObject);
begin
  Abrir(TfrmEditorSql, frmEditorSql, tmvNormal, mnuEditorSQL);
end;

procedure TfrmPrincipal.mnuVentanaClick(Sender: TObject);
var
  i: Integer;
  mnuItem: TMenuItem;
begin
  mnuVentanas.Clear;
  for i := 0 to MDIChildCount-1 do
  begin
    mnuItem := TMenuItem.Create(MDIChildren[i]);
    mnuItem.Caption := MDIChildren[i].Caption;
    mnuItem.OnClick := mnuVentaShowClick;
    mnuVentanas.Add(mnuItem);
  end;
end;

procedure TfrmPrincipal.mnuVentaShowClick(Sender: TObject);
begin
  TForm(TComponent(Sender).Owner).Show;
end;

procedure TfrmPrincipal.mnuBuquedaEnJEDIClick(Sender: TObject);
begin
  Abrir(TfrmBusquedaControlVersion, frmBusquedaControlVersion, tmvNormal, mnuBuquedaEnJEDI);
end;

procedure TfrmPrincipal.TimerLapaconicoTimer(Sender: TObject);
var
  sSQL: string;
begin
  try
    BeginTrans;

    sSQL := 'UPDATE USE_USUARIOS SET SE_NOMBRE = :V1 WHERE SE_USUARIO = :V2';
    EjecutarSQLSTEx(sSQL, ['Álvaro Lapacó', 'ALAPACO']);

    sSQL := 'UPDATE USE_USUARIOS SET SE_NOMBRE = :V1 WHERE SE_USUARIO = :V2';
    EjecutarSQLSTEx(sSQL, ['Wilson Nelly Buster NTNEW!', 'NKUSTER']);

    sSQL := 'UPDATE USE_USUARIOS SET SE_NOMBRE = :V1 WHERE SE_USUARIO = :V2';
    EjecutarSQLSTEx(sSQL, ['Pablo Travasci Pozo NTNEW!', 'PTAVASCI']);

    CommitTrans;
  except
//    MostrarAlarma('Error Lapacónico', 'Ha fallado la actualización de datos.', 500);
    RollBack;
    sSQL := 'SELECT OWNER || ''.'' || TRIGGER_NAME ' +
              'FROM DBA_TRIGGERS ' +
             'WHERE TABLE_OWNER = :V1 ' +
               'AND TABLE_NAME = :V2 ' +
               'AND TRIGGER_NAME <> :V3 ' +
               'AND TRIGGER_NAME <> :V4';
    with GetQueryEx(sSQL, ['ART', 'USE_USUARIOS', 'TRG_USE_USUARIOS', 'TRG_USE_SEGURIDAD']) do
    try
      MostrarAlarma('Error Lapacónico', Format('Se encontraron %d triggers malignos en la base.', [RecordCount]), 500);
      sSQL := 'ALTER TRIGGER %s DISABLE';
      while not Eof do
      begin
        EjecutarSQL(Format(sSQL, [Fields[0].AsString]));
        Next;
      end;
    finally
      Free;
    end;


    sSQL := 'SELECT ''ALTER TABLE '' || OWNER || ''.'' || TABLE_NAME || '' DROP CONSTRAINT '' || CONSTRAINT_NAME ' +
              'FROM DBA_CONSTRAINTS ' +
             'WHERE OWNER = :V1 ' +
               'AND TABLE_NAME = :V2 ' +
               'AND LAST_CHANGE > SYSDATE - 1';
    with GetQueryEx(sSQL, ['ART', 'USE_USUARIOS']) do
    try
      MostrarAlarma('Error Lapacónico', Format('Se encontraron %d constraints malignas en la base.', [RecordCount]), 500);
      sSQL := Fields[0].AsString;
      while not Eof do
      begin
        EjecutarSQL(sSQL);
        Next;
      end;
    finally
      Free;
    end;

//    MostrarAlarma('Victoria Grossa', 'Ya no hay mas triggers malignos.', 500);
  end;
end;

procedure TfrmPrincipal.btnLapaconicoClick(Sender: TObject);
begin
  TimerLapaconico.Enabled := not TimerLapaconico.Enabled;

  if TimerLapaconico.Enabled then
    btnLapaconico.Caption := 'Detener'
  else
    btnLapaconico.Caption := 'Iniciar';
end;

procedure TfrmPrincipal.mnuDireccionesdeCorreoClick(Sender: TObject);
begin
  Abrir(TfrmManCHG_HECHOGENERADORMAIL, frmManCHG_HECHOGENERADORMAIL, tmvNormal, mnuDireccionesdeCorreo);
end;

procedure TfrmPrincipal.fpBajarShow(Sender: TObject);
begin
  ArbolDirectorios.Visible := True;
  ArbolDirectorios.Enabled := True;
end;

procedure TfrmPrincipal.mnuRelacionEntreUsuariosySectoresClick(Sender: TObject);
begin
  Abrir(TfrmManCUS_USUARIOSECTOR, frmManCUS_USUARIOSECTOR, tmvNormal, mnuRelacionEntreUsuariosySectores);
end;

procedure TfrmPrincipal.mnuRotulosReporteClick(Sender: TObject);
begin
  Abrir(TfrmManRotulosReporte, frmManRotulosReporte, tmvMDIChild, mnuRotulosReporte);
end;

procedure TfrmPrincipal.mnuReportesWebClick(Sender: TObject);
begin
  Abrir(TfrmManReportesWeb, frmManReportesWeb, tmvMDIChild, mnuReportesWeb);
end;

procedure TfrmPrincipal.mnuConsultaRotuloClick(Sender: TObject);
begin
  Abrir(TfrmManConsultasRotulo, frmManConsultasRotulo, tmvMDIChild, mnuConsultaRotulo);
end;

procedure TfrmPrincipal.mnuTestAlertasServerClick(Sender: TObject);
begin
  Application.CreateForm(TdmMonitor, dmMonitor);

  FAlertas := TAlertas.Create(Self);

  FAlertas.LogEvent.DebugLevel := dlAll;
  FAlertas.LogEvent.ApplicationLogName := Application.Title;
  FAlertas.LogEvent.OnService := true;
  FAlertas.Login.DataBaseName := dmPrincipal.sdbPrincipal;
  FAlertas.OnService := True;
  FAlertas.OnRefresh := RefreshAlertas;
end;

procedure TfrmPrincipal.RefreshAlertas(Sender: TObject);
begin
//  please, implement me..
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FAlertas <> nil then
    FAlertas.Free;
end;

initialization
  RegIniFile := TRegIniFile.Create;
  RegIniFile.RootKey := HKEY_CURRENT_USER;
finalization
  try
    RegIniFile.Free;
  except
  end;
end.
