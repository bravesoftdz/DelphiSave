unit unPrincipal;

interface
                      
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, Placemnt, artSeguridad, Login, artDbLogin, ComCtrls,
  StdCtrls, unArtFrame, unFraStaticCodigoDescripcion, ActnList, Db,
  SDEngine, unArt, ToolWin, RXShell, XPMenu,  ExtCtrls, JvAppStorage,
  JvBaseDlg, JvBackgrounds, JvDebugHandler, JvComponent, unCustomPrincipal,
  AdvOfficeHint, JvTrayIcon, JvCaptionButton, unMensajeAlertaAGA,
  JvComponentBase, RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    ActionListPrincipal: TActionList;
    actEnviarRecibir: TAction;
    actSolicitar: TAction;
    actSalir: TAction;
    Tbar_BarraDeHerramientas: TToolBar;                                         
    tbConsultarCarpeta: TToolButton;
    tbEnvioDeLotes: TToolButton;
    tbSolicitarCarpetas: TToolButton;
    actConsultaCarpetas: TAction;
    JvAppStoragePrincipal: TJvAppStorage;
    tbBotonSalir: TToolButton;
    tbAgregarUnSoloPapel: TToolButton;
    splitter: TSplitter;
    mnuCarpetas: TMenuItem;
    mnuConsultaCarpetas: TMenuItem;
    mnuSolicitud: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuManTipoArchivos: TMenuItem;
    mnuManAdministradores: TMenuItem;
    mnuManDocumento: TMenuItem;
    mnuManRAD_ARCHIVODOCUMENTO: TMenuItem;
    MnuParametrosGenerales: TMenuItem;
    Debug: TJvDebugHandler;
    tlColor: TImageList;
    mnuEnviodeRemitos: TMenuItem;
    actEnvioDocumentacion: TAction;
    actArmadoLote: TAction;
    mnuMovimientoCarpetas: TMenuItem;
    tbPrepararLote: TToolButton;
    mnuPreparaLote: TMenuItem;
    mnuManUbicacionArchivos: TMenuItem;
    actStockDocSector: TAction;
    mnuStockDocSector: TMenuItem;
    actAgregarPapel: TAction;
    mnuAgregarPapel: TMenuItem;
    t1: TTimer;
    actMovimCarpetas: TAction;
    tbMoverCarpetas: TToolButton;
    mnuControlStockLotes: TMenuItem;
    actStockLotes: TAction;
    tbControlStockLotes: TToolButton;
    ToolButton2: TToolButton;
    sp1: TMenuItem;
    sp2: TMenuItem;
    sp3: TMenuItem;
    actVerImagenes: TAction;
    mnuVerImagenes: TMenuItem;
    sp4: TMenuItem;
    tbVerImagenes: TToolButton;
    ToolButton1: TToolButton;
    mnuEnvosRecepcionDoc: TMenuItem;
    actEnvioRecepcionDoc: TAction;
    ToolButton3: TToolButton;
    tbEnvioRecepcionDoc: TToolButton;
    sp6: TMenuItem;
    mnuGuardaDigitalizacion: TMenuItem;
    mnuGDRepositorio: TMenuItem;
    mnuGDMigracionBank: TMenuItem;
    mnuGDImportacionRepositorio: TMenuItem;
    mnuGDDocumentacion: TMenuItem;
    actImportarRepositorio: TAction;
    tbImportarRepositorio: TToolButton;
    mnuGDConsultaRepositorio: TMenuItem;
    actConsultarRepositorio: TAction;
    tbConsultarRepositorio: TToolButton;
    mnuGDConsultas: TMenuItem;
    mnuGDConsultaCartasDoc: TMenuItem;
    mnuManErroresUsuarios: TMenuItem;
    mnuGDSeguimiento: TMenuItem;
    mnuGDSeguimientoErroresUsuarios: TMenuItem;
    actErroresUsuarios: TAction;
    tbSegErroresUsuarios: TToolButton;
    tmMigracionBank: TTimer;
    sp7: TMenuItem;
    ToolButton4: TToolButton;
    tbStockDocSector: TToolButton;
    mnuGDMigraciones: TMenuItem;
    mnuGDMigracionRemitoTest: TMenuItem;
    Consulta1: TMenuItem;
    mnuGDConsultaErroresUsuarios: TMenuItem;
    actTiposErroresUsuarios: TAction;
    tbTiposErroresUsuarios: TToolButton;
    mnuManCriticidadSectores: TMenuItem;
    mnuGDAdmin: TMenuItem;
    mnuGDAdminUbicacionCarpetas: TMenuItem;
    mnuGDConsultaErroresUbicCarpetas: TMenuItem;
    mnuControlStockCajas: TMenuItem;
    actControlStockCajas: TAction;
    tbControlStockCajas: TToolButton;
    mnuManCajas: TMenuItem;
    mnuGDConsultaTableroControl: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuManTipoArchivosClick(Sender: TObject);
    procedure mnuManAdministradoresClick(Sender: TObject);
    procedure mnuManDocumentoClick(Sender: TObject);
    procedure mnuManRAD_ARCHIVODOCUMENTOClick(Sender: TObject);
    procedure actSolicitarExecute(Sender: TObject);
    procedure actSalirExecute(Sender: TObject);
    procedure actConsultaCarpetasExecute(Sender: TObject);
    procedure MnuParametrosGeneralesClick(Sender: TObject);
    procedure actEnvioDocumentacionExecute(Sender: TObject);
    procedure actArmadoLoteExecute(Sender: TObject);
    procedure mnuManUbicacionArchivosClick(Sender: TObject);
    procedure actStockDocSectorExecute(Sender: TObject);
    procedure actAgregarPapelExecute(Sender: TObject);
    procedure t1Timer(Sender: TObject);
    procedure actMovimCarpetasExecute(Sender: TObject);
    procedure actStockLotesExecute(Sender: TObject);
    procedure mnuSalirClick(Sender: TObject);
    procedure actVerImagenesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEnvioRecepcionDocExecute(Sender: TObject);
    procedure mnuGDMigracionBankClick(Sender: TObject);
    procedure actImportarRepositorioExecute(Sender: TObject);
    procedure actConsultarRepositorioExecute(Sender: TObject);
    procedure mnuGDConsultaCartasDocClick(Sender: TObject);
    procedure mnuManErroresUsuariosClick(Sender: TObject);
    procedure actErroresUsuariosExecute(Sender: TObject);
    procedure tmMigracionBankTimer(Sender: TObject);
    procedure mnuGDMigracionRemitoTestClick(Sender: TObject);
    procedure actTiposErroresUsuariosExecute(Sender: TObject);
    procedure mnuManCriticidadSectoresClick(Sender: TObject);
    procedure mnuGDAdminUbicacionCarpetasClick(Sender: TObject);
    procedure mnuGDConsultaErroresUbicCarpetasClick(Sender: TObject);
    procedure actControlStockCajasExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuManCajasClick(Sender: TObject);
    procedure mnuGDConsultaTableroControlClick(Sender: TObject);
  private
    piCantChequeosMigracionBank: Integer;
    procedure DoIniciarMigracionBank(InicioAutomatico: Boolean);
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  AnsiSql, unDmPrincipal, unManRTA_TIPOARCHIVO, unManRAU_ARCHIVOUSUARIO, unManRDO_DOCUMENTO,
  unManRAD_ARCHIVODOCUMENTO, unFrmAdministracionParametros,
  unUtilsArchivo, unFrmConsultaCarpetas, unFrmSolicitudCarpeta,  unFrmArmadoLote,
  unFrmArmadoRemito, unFrmCargaDocumentacion, General, unMovimientoCarpetas,
  unManUbicacionArchivos, unDocumentacionPorSector, CustomDlgs, unSolicitudCarpetaUsuario,
  unStockLotes, unVerImagenes, unEnviosRecepcionDoc, unSesion, unMigracionBANK,
  unImportarImagRepositorio, unConsultarRepositorio, unConsultaCartasDoc,
  unManErroresUsuarios, unSeguimientoErroresUsuarios, unConsErroresUsuarios,
  unManCriticidadSectores, unCargaUbicCarpetasAdmin, unErroresUbicCarpetas,
  unControlStockCajas, unManCajas, unTableroControl;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.actEnvioDocumentacionExecute(Sender: TObject);
begin
  if IsPerfilAdministrador_GyD() then
    Abrir(TFrmArmadoRemito, FrmArmadoRemito, tmvMDIChild, mnuEnviodeRemitos);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  sCaption: String;
begin
  sCaption := Caption;
  inherited;

  SetLength(TrueBoolStrs, 1);
  TrueBoolStrs[0] := 'S';

  mnuGuardaDigitalizacion.Enabled := (Seguridad.Activar(mnuGuardaDigitalizacion) and (GetPerfilAdministrador() or GetPerfilGuardaYDigitalizacion()));
  mnuGDMigracionBank.Visible      := (Sesion.Sector = 'COMPUTOS');

  Caption         := sCaption + ' - ' + dbLogin.Usuario;
  JvTrayIcon.Hint := sCaption;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  t1.Enabled := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManTipoArchivosClick(Sender: TObject);
begin
  TfrmManRTA_TIPOARCHIVO.Create(Self);
  mnuManTipoArchivos.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManAdministradoresClick(Sender: TObject);
begin
  TfrmManRAU_ARCHIVOUSUARIO.Create(Self);
  mnuManAdministradores.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManDocumentoClick(Sender: TObject);
begin
  Abrir(TfrmManRDO_DOCUMENTO, frmManRDO_DOCUMENTO, tmvMDIChild, mnuManDocumento);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManRAD_ARCHIVODOCUMENTOClick(Sender: TObject);
begin
  Abrir(TfrmManRAD_ARCHIVODOCUMENTO, frmManRAD_ARCHIVODOCUMENTO, tmvMDIChild, mnuManRAD_ARCHIVODOCUMENTO);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.actSolicitarExecute(Sender: TObject);
begin
  TFrmSolicitudCarpeta.ShowSolicitudes;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.actSalirExecute(Sender: TObject);
begin
  mnuSalirClick(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actConsultaCarpetasExecute(Sender: TObject);
begin
  Abrir(TfrmConsultaCarpetas, frmConsultaCarpetas, tmvMDIChild, mnuConsultaCarpetas);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.MnuParametrosGeneralesClick(Sender: TObject);
begin
  TfrmAdministracionParametros.ShowParametros;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actArmadoLoteExecute(Sender: TObject);
begin
  Abrir(TFrmArmadoLote, FrmArmadoLote, tmvMDIChild, mnuPreparaLote);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManUbicacionArchivosClick(Sender: TObject);
begin
  with TfrmManUbicacionArchivos.Create(Self) do
    begin
      MenuItem  := TMenuItem(Sender);
      FormStyle := fsMDIChild;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actStockDocSectorExecute(Sender: TObject);
begin
  Abrir(TfrmDocumentacionPorSector, frmDocumentacionPorSector, tmvMDIChild, mnuStockDocSector);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actAgregarPapelExecute(Sender: TObject);
begin
  TfrmCargaDocumentacion.ShowCargaDocumento(Self);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;
  if Sesion.Sector <> 'COMPUTOS' then
    begin
      DoVerificarCarpetasPendientesEntregaUsuario;
      DoVerificarReclamoLotesUsuario;
      DoIniciarCarpetasEnTransitoUsu;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actMovimCarpetasExecute(Sender: TObject);
begin
  with TfrmMovimientoCarpetas.Create(nil) do
    try
      ShowModal;
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actStockLotesExecute(Sender: TObject);
begin
  Abrir(TfrmStockLotes, frmStockLotes, tmvMDIChild, mnuControlStockLotes);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actVerImagenesExecute(Sender: TObject);
begin
  Abrir(TfrmVerImagenes, frmVerImagenes, tmvModal, mnuVerImagenes);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MsgBox('¿Está seguro que desea salir de la aplicación?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
    inherited
  else
    Action := caNone;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actEnvioRecepcionDocExecute(Sender: TObject);
begin
  if IsPerfilAdministrador_GyD() then
    Abrir(TfrmEnviosRecepcionDoc, frmEnviosRecepcionDoc, tmvMDIChild, mnuEnvosRecepcionDoc);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.DoIniciarMigracionBank(InicioAutomatico: Boolean);
begin
  with tmMigracionBank do
    begin         // 10000
      Interval := 900000;   // 15 min.
      Enabled  := True;
      try
        if not DoMigracionBank(InicioAutomatico) then
          begin
            DoEmptyWorkingSetCurrentProcess();
            Application.ProcessMessages;
            DoIniciarMigracionBank(True);
          end;
      finally
        Enabled := False;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuGDMigracionBankClick(Sender: TObject);
begin
  piCantChequeosMigracionBank := 0;
  DoIniciarMigracionBank(False);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actImportarRepositorioExecute(Sender: TObject);
begin
  if IsPerfilAdministrador_GyD() then
    Abrir(TfrmImportarImagRepositorio, frmImportarImagRepositorio, tmvMDIChild, mnuGDImportacionRepositorio);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actConsultarRepositorioExecute(Sender: TObject);
begin
  Abrir(TfrmConsultarRepositorio, frmConsultarRepositorio, tmvMDIChild, mnuGDConsultaRepositorio)
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuGDConsultaCartasDocClick(Sender: TObject);
begin
  if IsPerfilAdministrador_GyD() then
    Abrir(TfrmConsultaCartasDoc, frmConsultaCartasDoc, tmvMDIChild, mnuGDConsultaCartasDoc);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManErroresUsuariosClick(Sender: TObject);
begin
  if IsPerfilAdministrador() then
    Abrir(TfrmManErroresUsuarios, frmManErroresUsuarios, tmvMDIChild, mnuManErroresUsuarios);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actErroresUsuariosExecute(Sender: TObject);
begin
  Abrir(TfrmSeguimientoErroresUsuarios, frmSeguimientoErroresUsuarios, tmvMDIChild, mnuGDSeguimientoErroresUsuarios);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.tmMigracionBankTimer(Sender: TObject);
begin
  // el intervalo de chequeo está en 15 minutos. O sea que cada 36 chequeos, es decir,
  // cada 9 hs, se reinicia de todas formas...
  Inc(piCantChequeosMigracionBank);

  with frmMigracionBANK do
    if Assigned(frmMigracionBANK) and (ReiniciarMigracion or (piCantChequeosMigracionBank = 36)) then
      begin
        Delay(120000);   // 2 minutos
        piCantChequeosMigracionBank := 0;

        Close;
        Release;
        FreeAndNil(frmMigracionBANK);
        DoIniciarMigracionBank(True);
      end;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuGDMigracionRemitoTestClick(Sender: TObject);
var
  iRemito: Integer;
  sSql: String;                  
begin
  // opción invisibilizada
  sSql := 'SELECT MAX(RE_ID) ' +
            'FROM RRE_REMITO ' +
           'WHERE RE_FECHABAJA IS NULL';

  iRemito := InputBoxInteger('Migrar Remito a Base de Pruebas', 'Nro. de Remito:', 0, 0, ValorSqlInteger(sSql));

  if iRemito > 0 then
    begin
      sSql := 'ART.ARCHIVO.DOMIGRARREMITOPRUEBAS(:Remito);';
      EjecutarStoreEx(sSql, [iRemito]);

      MsgBox('Datos migrados correctamente.', MB_ICONINFORMATION);
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actTiposErroresUsuariosExecute(Sender: TObject);
begin
  Abrir(TfrmConsErroresUsuarios, frmConsErroresUsuarios, tmvMDIChild, mnuGDConsultaErroresUsuarios);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManCriticidadSectoresClick(Sender: TObject);
begin
  Abrir(TfrmManCriticidadSectores, frmManCriticidadSectores, tmvMDIChild, mnuManCriticidadSectores);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuGDAdminUbicacionCarpetasClick(Sender: TObject);
begin
  if IsPerfilAdministrador_GyD() then
    Abrir(TfrmCargaUbicCarpetasAdmin, frmCargaUbicCarpetasAdmin, tmvModal, mnuGDAdminUbicacionCarpetas);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuGDConsultaErroresUbicCarpetasClick(Sender: TObject);
begin
  if IsPerfilAdministrador() then
    Abrir(TfrmErroresUbicCarpetas, frmErroresUbicCarpetas, tmvMDIChild, mnuGDConsultaErroresUbicCarpetas);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.actControlStockCajasExecute(Sender: TObject);
begin
  if IsPerfilAdministrador_GyD() then
    Abrir(TfrmControlStockCajas, frmControlStockCajas, tmvMDIChild, mnuControlStockCajas);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManCajasClick(Sender: TObject);
begin
  if IsPerfilAdministrador() then
    Abrir(TfrmManCajas, frmManCajas, tmvMDIChild, mnuManCajas);
end;
{------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuGDConsultaTableroControlClick(Sender: TObject);
begin
  if IsPerfilAdministrador() then
    Abrir(TfrmTableroControl, frmTableroControl, tmvMDIChild, mnuGDConsultaTableroControl);
end;
{------------------------------------------------------------------------------}
end.

