{-----------------------------------------------------------------------------
 Unit Name: unFrmSolicitudCarpeta
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Interfaz que permite solicitar una o mas carpeta de uno o mas tipo
            de archivos diferentes.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unFrmSolicitudCarpeta;
           
interface

uses
  FSForm, Variants, Windows, unFraEmpresa, unFraFiltroArchivo,
  JvExControls, JvComponent, ShortCutControl, Placemnt,
  QueryPrint, unArtDBAwareFrame, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, unArtDbFrame, DB, SDEngine,
  StdCtrls, unArtFrame, Dialogs, Forms, Controls, Classes, unFraTrabajador,
  unFraTrabajadorSiniestro;

type
  TFrmSolicitudCarpeta = class(TFSForm)
    sdqDatos: TSDQuery;
    dsEnvio: TDataSource;
    qpEnvio: TQueryPrint;
    PrintDialog: TPrintDialog;
    FormStorage: TFormStorage;
    ShortCuts: TShortCutControl;
    pnGrilla: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbEliminar: TToolButton;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    pnColores: TPanel;
    lblReferenciaPeriodoEstimado: TLabel;
    pnColorSolicitudCursada: TPanel;
    dbgEnvio: TArtDBGrid;
    pnSeleccion: TPanel;
    gbCarpeta: TGroupBox;
    btnAgregarSolicitud: TButton;
    gbObservaciones: TGroupBox;
    mObservaciones: TMemo;
    rgTipoSolicitud: TRadioGroup;
    GroupBox1: TGroupBox;
    chkTodosContratosCUIT: TCheckBox;
    gbBusquedaGeneral2: TGroupBox;
    CUIL: TLabel;
    lbCUIT: TLabel;
    fraEmpresaCD: TfraEmpresa;
    fraTrabajadorSiniestroCD: TfraTrabajadorSiniestro;
    fraCarpeta: TfraFiltroArchivo;
    lblUbicacion: TLabel;
    edTipoUbicacion: TEdit;
    edUbicacion: TEdit;
    GroupBox2: TGroupBox;
    chkTodosEstablContrato: TCheckBox;
    edAbogado: TEdit;
    Label1: TLabel;
    procedure FSFormDestroy(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnAgregarSolicitudClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure FSFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure fraCarpetaOnArchivoChange(Sender: TObject);
    procedure fraTrabajadorSiniestroCDtbLimpiarClick(Sender: TObject);
    procedure fraCarpetaChange(Sender: TObject);
    procedure fraTipoArchivoPropiedadesChange(Sender: TObject);
  private
    FOneShot, FbHuboCambios: boolean;
    FListaIdEnvio: String;
    procedure GuardarSolicitud(IdArchivo: Integer);
    procedure GuardarSolicitudes(Tipo: Integer; Sql: String);
    procedure Validar;
    function GetVerificarExisteSolicitud(AIdTipoArchivo: Integer; AClave: String): Boolean;
    procedure Clear;
    procedure DoCargarDatos;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowSolicitudes;
    class procedure AltaSolicitudArchivo(AIdArchivo : Integer);
  end;


implementation

uses
  unDmPrincipal, unPrincipal, StrFuncs, CustomDlgs, VCLExtra, DBFuncs, AnsiSql,
  unArt, unArchivo, unConstantArchivo, unFrmConsultaCarpetas, unSesion, SysUtils,
  General, unComunesArchivo, unUtilsArchivo;

{$R *.DFM}

{------------------------------------------------------------------------------}
class procedure TFrmSolicitudCarpeta.AltaSolicitudArchivo(AIdArchivo: Integer);
begin
  with TFrmSolicitudCarpeta.Create(nil) do
  try
    Visible := True;
    Clear;
    FOneShot := True;
    fraCarpeta.IdArchivo := AIdArchivo;
    fraCarpeta.ReadOnly  := True;
    Visible := False;
    Showmodal;
  finally
    free;
  end;                  
end;
{------------------------------------------------------------------------------}
class procedure TFrmSolicitudCarpeta.ShowSolicitudes;
begin
  with TFrmSolicitudCarpeta.Create(nil) do
  try
    hide;
    FOneShot := False;
    fraCarpeta.ReadOnly := False;
    DoCargarDatos;
    Showmodal;
  finally
    free;
  end;
end;
{------------------------------------------------------------------------------}
constructor TFrmSolicitudCarpeta.Create(AOwner: TComponent);
begin
  inherited;
  gbBusquedaGeneral2.Visible := False;

  fraEmpresaCD.ShowBajas             := True;
  fraTrabajadorSiniestroCD.ShowBajas := True;

  fraCarpeta.OnChange := fraCarpetaChange;

  Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.FSFormDestroy(Sender: TObject);
begin
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqDatos.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqDatos.FieldByName('FECHAIMPRESION').IsNull, nil, 'La carpeta ya ha sido solicitada.');

  if MsgAsk('¿Desea quitar la carpeta seleccionada?') then
    begin
      EjecutarSqlSTEx('DELETE FROM archivo.rsc_solicitudcarpeta ' +
                      'WHERE sc_id=:id ',
                      [sdqDatos.FieldByName('IDSOLICITUDCARPETA').AsInteger]);

      sdqDatos.Delete;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.tbImprimirClick(Sender: TObject);
begin
  Verificar(sdqDatos.IsEmpty, nil, 'No hay registros en la grilla.');

  if PrintDialog.Execute then
  begin
    qpEnvio.Footer.Text := sesion.LoginName;
    qpEnvio.SetGridColumns(dbgEnvio, True, [baDetail, baHeader, baTotal, baSubTotal]);
    qpEnvio.Print;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.Validar;
var
  bEsCartaDoc: Boolean;
  sSql: String;
begin
  bEsCartaDoc := fraCarpeta.IsTipoArchivoCartaDocumento() and (fraCarpeta.Tipo <> ID_CARPETA_CD_SIN);

  Verificar(bEsCartaDoc, fraCarpeta, 'No se permite la solicitud de este tipo de carpetas.');
  Verificar(fraCarpeta.IsTipoArchivoIncapacidades(), fraCarpeta, 'No se permite la solicitud de este tipo de carpetas - Solicítela como archivo de Siniestros.');
  Verificar(fraCarpeta.IsTipoArchivoMedLaboralRX(), fraCarpeta, 'No se permite la solicitud de este tipo de carpetas - Solicítela como archivo de Medicina Laboral (General).');
  Verificar(fraCarpeta.IsTipoArchivoExamenesPreocupacionalesRX(), fraCarpeta, 'No se permite la solicitud de este tipo de carpetas - Solicítela como archivo de Exámenes Preocupacionales.');
  Verificar((not bEsCartaDoc and not chkTodosEstablContrato.Checked) and not fraCarpeta.IsCompleted, fraCarpeta, 'Debe completar el archivo a incluir.');
  Verificar((not bEsCartaDoc and not chkTodosEstablContrato.Checked) and (fraCarpeta.IdArchivo = -1), fraCarpeta, 'La carpeta no existe.');
  Verificar(chkTodosEstablContrato.Checked and fraCarpeta.fraEmpresaEmpresa.IsEmpty, fraCarpeta.fraEmpresaEmpresa, 'Debe indicar el contrato.');
  Verificar(bEsCartaDoc and fraEmpresaCD.IsSelected and fraTrabajadorSiniestroCD.IsSelected, fraEmpresaCD, 'No puede elegir un contrato y un siniestro a la vez.');
  Verificar(bEsCartaDoc and not fraEmpresaCD.IsSelected and not fraTrabajadorSiniestroCD.IsSelected and (fraCarpeta.IdArchivo = -1), fraEmpresaCD, 'La carpeta no existe.');
  Verificar(bEsCartaDoc and (fraEmpresaCD.IsSelected or fraTrabajadorSiniestroCD.IsSelected) and (fraCarpeta.IsCompleted), fraEmpresaCD, 'Si eligió una carpeta, no puede elegir un contrato o un siniestro.');

  if fraCarpeta.Tipo = ID_CARPETA_ML_GRAL then
    Verificar(Is_CarpetaSinDocumentos(fraCarpeta.Tipo, fraCarpeta.Clave) and Is_CarpetaSinDocumentos(ID_CARPETA_ML_RX, fraCarpeta.Clave), fraCarpeta, 'La carpeta no tiene documentación cargada.')
  else
    Verificar(Is_CarpetaSinDocumentos(fraCarpeta.Tipo, fraCarpeta.Clave) and not fraCarpeta.IsTipoArchivoCaja() and (fraCarpeta.Tipo <> ID_CARPETA_RADIOGRSIN) and not ((fraCarpeta.Formulario = ftSiniestro) and (fraCarpeta.edSiniestro.Value < 800000)), fraCarpeta, 'La carpeta no tiene documentación cargada.');  // permito pedir carpetas sin doc. de siniestros < 800.000. Se permite pedir siempre cajas y carpetas de RX de siniestros

  Verificar(IsCarpetaAnulada(fraCarpeta.Tipo, fraCarpeta.Clave), fraCarpeta, 'La carpeta se encuentra anulada.');

  if fraCarpeta.Tipo = ID_CARPETA_SINIESTRO then
    begin
      sSql := 'SELECT 1 ' +
                'FROM SEX_EXPEDIENTES ' +
               'WHERE EX_SINIESTRO = :Siniestro ' +
                 'AND EX_ORDEN = :Orden ' +
                 'AND NVL(EX_CAUSAFIN, ''0'') NOT IN (''95'', ''99'')';

      if not ExisteSqlEx(sSql, [fraCarpeta.edSiniestro.Value, fraCarpeta.edOrden.Value]) then
        begin
          MsgBox('No se puede solicitar la carpeta, ya que el siniestro se encuentra cerrado por error de carga.', MB_ICONERROR);
          DoMostrarMensajesAdvertenciaCarpeta(fraCarpeta.Tipo, fraCarpeta.Clave);
          Abort;
        end;
    end;

  if not GetVerificarExisteSolicitud(fraCarpeta.Tipo, fraCarpeta.Clave) then
    Abort;

  sSql := 'SELECT 1 ' +
            'FROM RAR_ARCHIVO ' +
           'WHERE AR_CLAVE = :Clave ' +
             'AND AR_TIPO = :Tipo ' +
             'AND AR_TIPOUBICACION = :TipoUbic ' +
             'AND AR_UBICACION = :Usuario';
  Verificar(ExisteSqlEx(sSql, [fraCarpeta.Clave, fraCarpeta.Tipo, TIPOUBICACION_USUARIO, Sesion.UserId]), fraCarpeta, 'La carpeta ya se encuentra en su poder!');
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.GuardarSolicitud(IdArchivo: Integer);
var
  IdEnvio, IdRSC: TTableId;
  sSql: String;
begin
  FbHuboCambios := True;

  IdRSC := GetSecNextVal('seq_rsc_id');

  sSql := 'INSERT INTO ARCHIVO.RSC_SOLICITUDCARPETA ' +
                  '(SC_ID, SC_IDARCHIVO, SC_FECHASOLICITUD, ' +
                   'SC_USUARIOSOLICITUD, SC_TIPOSOLICITUD, ' +
                   'SC_OBSERVACIONES, SC_OBSERVACPENDIENTE) ' +
            'SELECT :id, :sc_idarchivo, SYSDATE, ' +
                   ':sc_usuariosolicitud, :sc_tiposolicitud, ' +
                   ':sc_observaciones, (SELECT SC_OBSERVACPENDIENTE ' +
                                         'FROM ARCHIVO.RSC_SOLICITUDCARPETA ' +
                                        'WHERE SC_ID = (SELECT MAX(SC_ID) ' +
                                                         'FROM ARCHIVO.RSC_SOLICITUDCARPETA ' +
                                                        'WHERE SC_IDARCHIVO = :IdArchivo)) ' +
              'FROM DUAL';

  EjecutarSqlSTEx(sSql, [IdRSC, IdArchivo, Sesion.LoginName, rgTipoSolicitud.ItemIndex + 1,
                         mObservaciones.Text, IdArchivo]);

  DoModificarEstadoCarpeta(IdArchivo, ESTADOCARPETA_SOLICITADA, False, 0, '', True);

  IdEnvio := GetSecNextVal('seq_ren_id');
  EnviarSolicitud(IdEnvio, IdRSC);

  FListaIdEnvio := FListaIdEnvio + IntToStr(IdEnvio) + ',';
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.btnAgregarSolicitudClick(Sender: TObject);
var
  sSql: String;
begin
  Validar;

  DoPerderFoco(dbgEnvio, dbgEnvio);
  if fraCarpeta.HuboError then
    Exit;

  if chkTodosContratosCUIT.Checked then
    begin
       sSql := 'SELECT co_contrato clave ' +
                 'FROM aco_contrato ' +
                'WHERE co_idempresa IN (SELECT co_idempresa ' +
                                         'FROM aco_contrato ' +
                                        'WHERE co_contrato = ' + SqlValue(fraCarpeta.Clave) + ') ' +
                  'AND NOT EXISTS (SELECT 1 ' +
                                    'FROM rar_archivo rar, rsc_solicitudcarpeta rsc ' +
                                   'WHERE rar.ar_id = rsc.sc_idarchivo ' +
                                     'AND rsc.sc_fecharecepcion IS NULL ' +
                                     'AND rar.ar_tipo = ' + SqlValue(fraCarpeta.Tipo) + ' AND rar.ar_clave = TRIM(TO_CHAR(co_contrato)))';
       GuardarSolicitudes(fraCarpeta.Tipo, sSql);
    end
  else if chkTodosEstablContrato.Checked then
    begin
       sSql := 'SELECT TRIM(TO_CHAR(es_contrato)) || ' + '''|''' + ' || TRIM(TO_CHAR(es_nroestableci)) clave ' +
                 'FROM aes_establecimiento ' +
                'WHERE es_contrato = ' + SqlValue(fraCarpeta.fraEmpresaEmpresa.Contrato) + ' ' +
                  'AND es_fechabaja IS NULL ' +
                  'AND NOT EXISTS (SELECT 1 ' +
                                    'FROM rar_archivo rar, rsc_solicitudcarpeta rsc ' +
                                   'WHERE rar.ar_id = rsc.sc_idarchivo ' +
                                     'AND rsc.sc_fecharecepcion IS NULL ' +
                                     'AND rar.ar_tipo = ' + SqlValue(fraCarpeta.Tipo) + ' ' +
                                     'AND rar.ar_clave = TRIM(TO_CHAR(es_contrato)) || ' + '''|''' + ' || TRIM(TO_CHAR(es_nroestableci)))';
       GuardarSolicitudes(fraCarpeta.Tipo, sSql);
    end
  else if fraEmpresaCD.IsSelected or fraTrabajadorSiniestroCD.IsSelected then
    begin
      if fraEmpresaCD.IsSelected then
        begin
          sSql := 'SELECT ca_nrocartadoc clave ' +
                    'FROM cca_carta, aen_endoso ' +
                   'WHERE en_id = ca_idendoso ' +
                     'AND ca_fechabaja is null ' +
                     'AND ca_nrocartadoc is not null ' +
                     'AND en_contrato = ' + SqlValue(fraEmpresaCD.Contrato) + ' ' +
                     'AND NOT EXISTS (SELECT 1 ' +
                                       'FROM rar_archivo rar, rsc_solicitudcarpeta rsc ' +
                                      'WHERE rar.ar_id = rsc.sc_idarchivo ' +
                                        'AND rsc.sc_fecharecepcion IS NULL ' +
                                        'AND rar.ar_tipo = ' + SqlValue(fraCarpeta.Tipo) + ' ' +
                                        'AND rar.ar_clave = ca_nrocartadoc)';
          GuardarSolicitudes(fraCarpeta.Tipo, sSql);
        end;

      if fraTrabajadorSiniestroCD.IsSelected then
        begin
          sSql := 'SELECT ca_nrocartadoc clave ' +
                    'FROM cca_carta ' +
                   'WHERE ca_fechabaja is null ' +
                     'AND ca_nrocartadoc is not null ' +
                     'AND ca_idexpediente = ' + SqlValue(fraTrabajadorSiniestroCD.IdSiniestro) + ' ' +
                     'AND NOT EXISTS (SELECT 1 ' +
                                       'FROM rar_archivo rar, rsc_solicitudcarpeta rsc ' +
                                      'WHERE rar.ar_id = rsc.sc_idarchivo ' +
                                        'AND rsc.sc_fecharecepcion IS NULL ' +
                                        'AND rar.ar_tipo = ' + SqlValue(fraCarpeta.Tipo) + ' ' +
                                        'AND rar.ar_clave = ca_nrocartadoc) ' +
                   'UNION ' +
                  'SELECT do_nrocartadoc clave ' +
                    'FROM cdo_cartasdocumento ' +
                   'WHERE do_nrocartadoc is not null ' +
                     'AND do_siniestro = ' + SqlValue(fraTrabajadorSiniestroCD.edSiniestro.Siniestro) + ' ' +
                     'AND do_orden = ' + SqlValue(fraTrabajadorSiniestroCD.edSiniestro.Orden) + ' ' +
                     'AND do_recaida = ' + SqlValue(fraTrabajadorSiniestroCD.edSiniestro.Recaida) + ' ' +
                     'AND NOT EXISTS (SELECT 1 ' +
                                       'FROM rar_archivo rar, rsc_solicitudcarpeta rsc ' +
                                      'WHERE rar.ar_id = rsc.sc_idarchivo ' +
                                        'AND rsc.sc_fecharecepcion IS NULL ' +
                                        'AND rar.ar_tipo = ' + SqlValue(fraCarpeta.Tipo) + ' ' +
                                        'AND rar.ar_clave = do_nrocartadoc) ' +
                   'UNION ' +
                  'SELECT ca_nrocartadoc clave ' +
                    'FROM sin.ssc_siniestrosporcarta, cca_carta ' +
                   'WHERE ca_fechabaja is null ' +
                     'AND ca_nrocartadoc is not null ' +
                     'AND sc_idexpediente = ' + SqlValue(fraTrabajadorSiniestroCD.IdSiniestro) + ' ' +
                     'AND sc_idcarta = ca_id ' +
                     'AND NOT EXISTS (SELECT 1 ' +
                                       'FROM rar_archivo rar, rsc_solicitudcarpeta rsc ' +
                                      'WHERE rar.ar_id = rsc.sc_idarchivo ' +
                                        'AND rsc.sc_fecharecepcion IS NULL ' +
                                        'AND rar.ar_tipo = ' + SqlValue(fraCarpeta.Tipo) + ' ' +
                                        'AND rar.ar_clave = ca_nrocartadoc)';
          GuardarSolicitudes(fraCarpeta.Tipo, sSql);
        end;
    end
  else
    GuardarSolicitud(fraCarpeta.IdArchivo);

  DoMostrarMensajesAdvertenciaCarpeta(fraCarpeta.Tipo, fraCarpeta.Clave);

  if FOneShot then close else sdqDatos.Refresh;
end;
{------------------------------------------------------------------------------}
function TFrmSolicitudCarpeta.GetVerificarExisteSolicitud(AIdTipoArchivo: Integer; AClave: String): Boolean;
var
 sMensaje, sSql : string;
 Q : TSDQuery;
 bContinuar: Boolean;
begin
  bContinuar := True;

  sSql := 'SELECT * ' +
          '  FROM rar_archivo rar, rsc_solicitudcarpeta rsc' +
          ' WHERE rar.ar_id = rsc.sc_idarchivo' +
          '   AND rsc.sc_fecharecepcion IS NULL' +
          '   AND rar.ar_tipo = :tipo AND rar.ar_clave = :clave';

  Q := GetQueryEx(sSql, [AIdTipoArchivo, AClave]);
  try
    if Q.RecordCount > 0 then
    begin
      if Q.FieldByName('SC_USUARIOSOLICITUD').AsString <> sesion.LoginName then
        begin
          sMensaje   := 'El expediente ya se encuentra solicitado por el usuario ' + Q.FieldByName('SC_USUARIOSOLICITUD').AsString + '. ¿Confirma la solicitud?';
          bContinuar := (MessageDlg(sMensaje, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
        end
      else
        begin
          sMensaje := 'El expediente ya se encuentra solicitado por usted.';
          MessageDlg(sMensaje, mtInformation, [mbOK], 0);
          bContinuar := False;
        end;
    end;

    Result := bContinuar;
  finally
    FreeAndNil(Q);
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.FSFormShow(Sender: TObject);
begin
  FbHuboCambios := False;
  FListaIdEnvio := '';

  if dmPrincipal.sdbPrincipal.InTransaction then
    dmPrincipal.sdbPrincipal.Commit;

  BeginTrans(True);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.FSFormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FbHuboCambios then
    begin
      if MsgBox('¿Confirma las modificaciones realizadas?', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1,
                'Solicitud de Carpetas') = IDYES then
        begin
          EnviarSolicitudPorMail(CutRight(FListaIdEnvio, 1), False);
          CommitTrans(True);
        end
      else
        Rollback(True);
    end
  else
    Rollback(True);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.Clear;
begin
  rgTipoSolicitud.ItemIndex := 2;
  fraCarpeta.Clear;
  fraEmpresaCD.Clear;
  fraTrabajadorSiniestroCD.Clear;
  mObservaciones.Clear;
  edTipoUbicacion.Clear;
  edUbicacion.Clear;
  edAbogado.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.DoCargarDatos;
var
  sSql: String;
begin
  sSql := 'SELECT AR_ID IDARCHIVO, AR_TIPO IDTIPOARCHIVO, TA_DESCRIPCION TIPOARCHIVO, TA_FECHABAJA FECHABAJA, ' +
                 'DECODE (AR_TIPOUBICACION, ' +
                          '''D'', ''Delegación'', ' +
                          '''L'', ''Lugar'', ' +
                          '''S'', ''Sector'', ' +
                          '''U'', ''Usuario'', ' +
                          '''G'', ''Administradora'') TIPOUBICACION, ' +
                 'ART.ARCHIVO.GETUBICACIONNOMBRE (AR_TIPOUBICACION, AR_UBICACION) UBICACION, ' +
                 'AR_FECHAMOVIMIENTO FECHAMOVIMIENTO, AR_CAJA CAJA, SC_ID IDSOLICITUDCARPETA, ' +
                 'ARCHIVO.GETDESCRIPCIONCLAVE (TC_ID, AR_CLAVE) DESCRIPCIONCLAVE, ' +
                 'SC_FECHASOLICITUD FECHASOLICITUD, SC_HORASOLICITUD HORASOLICITUD, SC_USUARIOSOLICITUD USUARIOSOLICITUD, ' +
                 'DECODE (SC_TIPOSOLICITUD, ' +
                          '''1'', ''2 HORAS'', ' +
                          '''2'', ''4 HORAS'', ' +
                          '''3'', ''24 HORAS'') TIPOSOLICITUD, ' +
                 'SC_FECHAIMPRESION FECHAIMPRESION, SC_FECHARECEPCION FECHARECEPCION, SC_OBSERVACIONES OBSERVACION, ' +
                 'SC_USUARIOIMPRESION USUARIOIMPRESION, TC_ID IDTIPOCLAVE, AR_CLAVE CLAVE, ' +
                 'ART.ARCHIVO.GET_CONTRATOCD(TA_ID, AR_CLAVE) CONTRATOCD, ' +
                 'ART.ARCHIVO.GET_NROEXPEDIENTECD(TA_ID, AR_CLAVE) NROEXPEDIENTECD ' +
            'FROM RAR_ARCHIVO R, RTA_TIPOARCHIVO T, RTC_TIPOCLAVE C, RSC_SOLICITUDCARPETA S ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND SC_IDARCHIVO = AR_ID ' +
             'AND SC_FECHARECEPCION IS NULL ' +
             'AND SC_USUARIOSOLICITUD = ' + SqlValue(Sesion.UserID) + ' ' +
        'ORDER BY SC_ID DESC';

  sdqDatos.Sql.Text := sSql;
  OpenQuery(sdqDatos);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.fraCarpetaOnArchivoChange(Sender: TObject);
begin
  inherited;

  chkTodosContratosCUIT.Enabled := (fraCarpeta.Formulario = ftCuit);
  if not chkTodosContratosCUIT.Enabled then
    chkTodosContratosCUIT.Checked := False;

  chkTodosEstablContrato.Enabled := (fraCarpeta.Formulario = ftCuitEstableci);
  if not chkTodosEstablContrato.Enabled then
    chkTodosEstablContrato.Checked := False;

  gbBusquedaGeneral2.Visible := (fraCarpeta.IsCartaDocumento());
  fraEmpresaCD.Clear;
  fraTrabajadorSiniestroCDtbLimpiarClick(nil);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.fraTrabajadorSiniestroCDtbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTrabajadorSiniestroCD.tbLimpiarClick(Sender);
  fraTrabajadorSiniestroCD.mskCUIL.Clear;
  fraTrabajadorSiniestroCD.cmbNombre.Clear;
  fraTrabajadorSiniestroCD.Contrato := ART_EMPTY_ID;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.GuardarSolicitudes(Tipo: Integer; Sql: String);
var
  IdRAR: Integer;
begin
  with GetQuery(Sql) do
    try
      while not Eof do
        begin
          IdRAR := GetIdArchivo(Tipo, FieldByName('clave').AsString);

          if IdRAR <> ART_EMPTY_ID then
            GuardarSolicitud(IdRAR);

          Next;
        end;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.fraCarpetaChange(Sender: TObject);
var
  sSql: String;
  SqlResults: TStringList;
begin
  if fraCarpeta.IsCompleted then
    begin
      sSql := 'SELECT DECODE(AR_TIPOUBICACION, ''D'', ''Delegación'', ' +
                                               '''L'', ''Lugar'', ' +
                                               '''S'', ''Sector'', ' +
                                               '''U'', ''Usuario'' , ' +
                                               '''G'', ''Administradora'') TIPOUBICACION, ' +
                     'ART.ARCHIVO.GETUBICACIONNOMBRE(AR_TIPOUBICACION, AR_UBICACION) UBICACION, ' +
                     'BO_NOMBRE ESTUDIOLEG ' +  
                'FROM LEGALES.LBO_ABOGADO, RAR_ARCHIVO ' +
               'WHERE AR_TIPO = ' + SqlValue(fraCarpeta.Tipo) + ' ' +
                 'AND AR_CLAVE = ' + SqlValue(fraCarpeta.Clave) + ' ' +
                 'AND AR_IDABOGADO = BO_ID(+)';

      SqlResults := ValoresColSql(sSql);
      try
        edTipoUbicacion.Text := SqlResults[0];
        edUbicacion.Text     := SqlResults[1];
        edAbogado.Text       := SqlResults[2];
      finally
        SqlResults.Free;
      end;
    end
  else
    begin
      edTipoUbicacion.Clear;
      edUbicacion.Clear;
      edAbogado.Clear;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudCarpeta.fraTipoArchivoPropiedadesChange(Sender: TObject);
begin
  fraCarpeta.OnArchivoChange(Sender);
  fraCarpetaOnArchivoChange(nil);
end;
{------------------------------------------------------------------------------}
end.

