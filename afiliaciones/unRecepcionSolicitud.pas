unit unRecepcionSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomPanelABM, DB, SDEngine, Placemnt, artSeguridad,
  ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls,
  unFraCodigoDescripcion, unFraUsuario, Mask, ToolEdit, DateComboBox,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unFraEmpresaAfi,
  unFraEmpresaSolicitud, Buttons, VCLExtra, unImportCryptoSrt, DateUtils,
  RxToolEdit, RxPlacemnt;

type
  TStatusSrt = record
    ArtAnterior: Integer;
    CodigoProvincia: String;
    Error: Boolean;
    Status: String;
    end;

type
  TfrmRecepcionSolicitud = class(TfrmCustomPanelABM)
    tbGuardar: TToolButton;
    fraEmpresa: TfraEmpresaSolicitud;
    fraSA_ORIGEN: TfraStaticCTB_TABLAS;
    lbOrigen: TLabel;
    lbCUIT: TLabel;
    fraSA_MOTIVOALTA: TfraStaticCTB_TABLAS;
    lbMotivoAlta: TLabel;
    Label1: TLabel;
    dcbFechaRecepcionAfiliaciones: TDateComboBox;
    lbFechaAfiliacion: TLabel;
    edFechaSuscripcion: TDateComboBox;
    lbFRecepcion: TLabel;
    edVigencia: TDateComboBox;
    edSA_OBSERVACIONES: TMemo;
    lbSA_OBSERVACIONES: TLabel;
    fraUsuarioAsignado: TfraUsuarios;
    Label2: TLabel;
    gbFormulariosAnexos: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnRefreshDoc: TBitBtn;
    btnAdministracionArchivos: TBitBtn;
    Label6: TLabel;
    fraEstado: TfraStaticCTB_TABLAS;
    fraSA_ARTANTERIOR: TfraStaticCodigoDescripcion;
    lbARTAnterior: TLabel;
    tbHistorialSRT: TToolButton;
    lbSrt: TLabel;
    procedure FSFormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure fraEmpresaExit(Sender: TObject);
    procedure ClickFirmaPresento(Sender: TObject);
    procedure ClickFirmaTitular(Sender: TObject);
    procedure btnRefreshDocClick(Sender: TObject);
    procedure btnAdministracionArchivosClick(Sender: TObject);
    procedure CambiaOrigen(Sender: TObject);
    procedure fraSA_ORIGENEnter(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure ClearAll;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbHistorialSRTClick(Sender: TObject);
    procedure fraSA_MOTIVOALTAExit(Sender: TObject);
    procedure fraEmpresamskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure fraEmpresaedFormularioKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    procedure CambiaEmpresa(Sender: TObject);
    procedure ConfigurarFrames;
    procedure CrearComponentesDocumentacion;
    procedure CrearCheckBox(const aChecked: Boolean; const aCaption, aName: String; const aLeft, aTag, aTop,
                          aWidth: Integer; const aParent: TGroupBox; const aOnClick: TNotifyEvent);
    procedure VerificarDocumentacionFaltanteFila(const aTag: Integer);
    procedure ActualizarDocumentacionFaltante;
    procedure CargarDatosDocumentacion(const aIdSolicitud : Integer);
    procedure LiberarComponentesDocumentacion;
    procedure ProcesarSolicitud(const aEstadoSolicitud: String);
    //procedure InsertarEventoTraspasoIngreso(const aEvento: String);
    procedure GuardarSolicitud;
    procedure EnviarEmail;
    procedure CalcularArchivos;
    procedure GuardarDatosDocumentacion(const aIdSolicitud: Integer; const aCommit: Boolean);
    procedure LockRecepcion(const aLock: boolean);
    procedure SumarRecepcionST(const aUser : String);
    procedure ObtenerArtAnteriorDesdeSRT;
    procedure InsertarInformacionSrt(const aIdFormulario: Integer; const aVig: TCuilSRT);

    function VerificarDocumentacionFaltante(const aFormaJuridica: String; const aCaracterFirma, aIdDocumentoAfi: Integer;
                                            const aPresento, aFirmaTitular, aFirmaVendedor: String): String;
    function AsignarUsuario: String;
    function TieneRGRL: Boolean;
    function ObtenerStatusSrt(const aCuit: String; const aIdSolicitud: Integer): TStatusSrt;
    function VerificarRecepcion: Boolean;
    function IsContratoActivo(const aCuit, aFormulario: String): Boolean;

  public
    { Public declarations }
    FSA_ID: Integer;
    FEstado: String;
    FCambiaEmpresa: Boolean; //a veces no se ejecuta el "CambioEmpresa" cuando cambian la empresa, por algun extraño bug del frame
    FSA_IDFORMULARIO: Integer;
    FSA_FormaJ: String;
    FSA_Firmante: String;
    FOrigen : String;
    FOrigenEnter: String;
    FFormConfigurado: Boolean;
    FEsPCP : Boolean;
  end;

var
  frmRecepcionSolicitud: TfrmRecepcionSolicitud;

implementation

uses CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal, unArt, General, unSesion, unAfiliaciones, unAdministracionArchivosRecepcion,
  unCargaSRT, unPrincipal, CUIT, unComunes, unEsperaSimple;

{$R *.dfm}

// Test cuit 30709285862

procedure TfrmRecepcionSolicitud.FSFormCreate(Sender: TObject);
begin
  inherited;
  LockControls(False);
  tbSalir.Left := 28;
  tbGuardar.Left := 28;
  tbLimpiar.Left := 28;
  tbHistorialSrt.Left := 28;
  ToolButton4.Left := 28;
  tbNuevo.Left := 28;
  ConfigurarFrames;
  FSA_ID := ART_EMPTY_ID;
  FEstado := '';
  FSA_IDFORMULARIO := ART_EMPTY_ID;
  CrearComponentesDocumentacion;
  fraEmpresa.OnChange := CambiaEmpresa;
  fraEmpresa.IncluirContratos := False;
  lbSrt.Caption := '';
  //fraEmpresa.ShowBajas := True;
end;

procedure TfrmRecepcionSolicitud.FSFormShow(Sender: TObject);
begin
  inherited;
  LockControls(False);//desbloqueo el panel
  LockRecepcion(True); //bloqueo todo menos la empresa
  fraEstado.Locked := True;
end;

procedure TfrmRecepcionSolicitud.fraEmpresaExit(Sender: TObject);
begin
  inherited;
  fraEmpresa.FrameExit(Sender);
  if not FCambiaEmpresa then
    CambiaEmpresa(nil);
end;

procedure TfrmRecepcionSolicitud.CambiaEmpresa(Sender: TObject);
var
  sdqControlDatos: TSDQuery;
  sSql: String;
  {iStatus,} iDiasSolicitud: Integer;
begin
  ClearAll;
  FCambiaEmpresa := True;
  if fraEmpresa.IsEmpty then
    Abort;
  LockRecepcion(false);
  sdqControlDatos := TSDQuery.Create(Self);
  try
    sdqControlDatos.DataBaseName := 'dbPrincipal';
    sSql :=
          'SELECT sa_id, sa_estado, sa_origen, sa_motivoalta, sa_fechaafiliacion, sa_fechavigenciadesde, observacion_express,' +
                ' sa_idcaracterfirma, sa_formaj, sa_idformulario, sa_usuarioasignadocarga, sa_idartanterior, sa_fecharecepcionsectorafi,' +
                ' sa_cuit, fo_formulario, sa_solicitud_pcp' +
               ' FROM asa_solicitudafiliacion, afo_formulario' +
                ' WHERE sa_idformulario = fo_id' +
               ' AND sa_idformulario = :id';
    OpenQueryEx(sdqControlDatos, [fraEmpresa.ID], sSql, True);
    if not sdqControlDatos.IsEmpty then
    begin
      FSA_ID                     := sdqControlDatos.FieldByName('sa_id').AsInteger;
      FSA_IDFORMULARIO           := sdqControlDatos.FieldByName('sa_idformulario').AsInteger;
      FSA_FormaJ                 := sdqControlDatos.FieldByName('sa_formaj').AsString;
      FSA_Firmante               := sdqControlDatos.FieldByName('sa_idcaracterfirma').AsString;
      FEsPCP                     := sdqControlDatos.FieldByName('sa_solicitud_pcp').AsString = 'S';
      fraSA_ORIGEN.Value         := sdqControlDatos.FieldByName('sa_origen').AsString;
      FOrigen                    := sdqControlDatos.FieldByName('sa_origen').AsString;
      fraSA_MOTIVOALTA.Value     := sdqControlDatos.FieldByName('sa_motivoalta').AsString;

      if (sdqControlDatos.FieldByName('sa_idartanterior').AsString <> '') or (sdqControlDatos.FieldByName('sa_idartanterior').AsInteger <> -1) then
        fraSA_ARTANTERIOR.Value := sdqControlDatos.FieldByName('sa_idartanterior').AsInteger
      else
        fraSA_ARTANTERIOR.Clear;

      IniciarEspera('Descargando de la SRT');
      Application.ProcessMessages;
      try
        ObtenerArtAnteriorDesdeSRT; //obtengo estado
      finally
        DetenerEspera;
      end;

      edFechaSuscripcion.Date            := sdqControlDatos.FieldByName('sa_fechaafiliacion').AsDateTime;
      edVigencia.Date                    := sdqControlDatos.FieldByName('sa_fechavigenciadesde').AsDateTime;
      edSA_OBSERVACIONES.Text            := sdqControlDatos.FieldByName('observacion_express').AsString;
      fraEstado.Value                    := sdqControlDatos.FieldByName('sa_estado').AsString;
      FEstado                            := sdqControlDatos.FieldByName('sa_estado').AsString;
      //fraUsuarioAsignado.Value           := sdqControlDatos.FieldByName('sa_usurecepcionsectorafi').AsString; //reemplazado por la de abajo
      fraUsuarioAsignado.Value           := sdqControlDatos.FieldByName('sa_usuarioasignadocarga').AsString;
      //dcbFechaRecepcionAfiliaciones.Date := Now;
      dcbFechaRecepcionAfiliaciones.Date :=  sdqControlDatos.FieldByName('sa_fecharecepcionsectorafi').AsDateTime;
      CargarDatosDocumentacion(sdqControlDatos.FieldByName('sa_id').AsInteger);
      CalcularArchivos;

      //Mensajes de advertencias (No erroes) Tk 52916
      iDiasSolicitud := Trunc(DBDate - edVigencia.Date);
      if (iDiasSolicitud >= 30) and (iDiasSolicitud < 40) then
        ShowMessage(Format('Faltan %d días para el vencimiento del plazo de presentación del contrato en la SRT.', [40 - iDiasSolicitud]))
      else if iDiasSolicitud = 40 then
        ShowMessage('Hoy vence el plazo para presentar el alta del contrato en la SRT.')
      else if iDiasSolicitud > 40 then
        ShowMessage(Format('La solicitud tiene %d días. Se encuentra vencido el plazo para presentar el alta del contrato en la SRT.', [iDiasSolicitud]));
      //******


      if IsContratoActivo(sdqControlDatos.FieldByName('sa_cuit').AsString, sdqControlDatos.FieldByName('fo_formulario').AsString) then
      begin
        LockRecepcion(True);
        Abort;
      end;
    end;
    ProcesarSolicitud(sdqControlDatos.FieldByName('sa_origen').AsString);
    sdqControlDatos.Close;
  finally
    sdqControlDatos.Free;
  end;
end;

procedure TfrmRecepcionSolicitud.ConfigurarFrames;
begin
  fraSA_ORIGEN.Clave          := 'ORSOL';
  fraSA_ORIGEN.ExtraCondition := ' AND tb_codigo NOT IN (''3'', ''4'')';
  fraSA_ORIGEN.OnChange       := CambiaOrigen;

  fraSA_MOTIVOALTA.Clave    := 'MOTIA';
  //fraSA_MOTIVOALTA.OnChange := CambiaMotivoAlta;
  //CambiaMotivoAlta(nil);

  fraEstado.Clave := 'ESSOL';
  LockControl(fraEstado, True);

  fraUsuarioAsignado.ExtraCondition := 'AND se_usuario IN (SELECT sr_usuario ' +
                                                           '  FROM afi.usr_usurecepcion' +
                                                           ' WHERE 1 = 1)';  //Segun pedido solo deben aparecer los de la tabla
                                                                            // usr_usurecepcion

  fraSA_ARTANTERIOR.TableName   := 'aar_art';
  fraSA_ARTANTERIOR.FieldID     := 'ar_id';
  fraSA_ARTANTERIOR.FieldCodigo := 'ar_id';
  fraSA_ARTANTERIOR.FieldDesc   := 'ar_nombre';
  fraSA_ARTANTERIOR.FieldBaja   := 'ar_fechabaja';
  fraSA_ARTANTERIOR.ShowBajas   := {$IFDEF AFILIACIONES}False{$ELSE}True{$ENDIF};  //tk 56234 no mostrar art de baja en art anterior en afiliaciones
end;

procedure TfrmRecepcionSolicitud.CrearComponentesDocumentacion; //creo todos los checkboxes
var
  iTop : Integer;
  sSql : String;
begin
  sSql :=
    'SELECT   df_default, df_descripcion, df_id, df_firmatitular, df_firmavendedor, df_ctrl_faltante' +
       ' FROM adf_documentoafi' +
      ' WHERE df_tipodocumento = ''F''' +
        ' AND df_fechabaja IS NULL' +
        ' AND df_id IN (7,8,9,11,21)' +
   ' ORDER BY df_orden';
  with GetQuery(sSql) do
  try
    iTop := 32;
    while not Eof do
    begin
      CrearCheckBox((FieldByName('df_default').AsString = 'S'),
                    FieldByName('df_descripcion').AsString, '_check_' + FieldByName('df_id').AsString, 24,
                    FieldByName('df_id').AsInteger, iTop, 220, gbFormulariosAnexos, ClickFirmaPresento);

      if (FieldByName('df_firmatitular').AsString = 'S')  then
        CrearCheckBox((FieldByName('df_default').AsString = 'S'), '',
                      'check_firmatitular_' + FieldByName('df_id').AsString, 280, FieldByName('df_id').AsInteger, iTop,
                      16, gbFormulariosAnexos, ClickFirmaTitular);

      if (FieldByName('df_firmavendedor').AsString = 'S') then
        CrearCheckBox((FieldByName('df_default').AsString = 'S'), '',
                      'check_firmavendedor_' + FieldByName('df_id').AsString, 460, FieldByName('df_id').AsInteger, iTop,
                      16, gbFormulariosAnexos, nil);

      if FieldByName('df_ctrl_faltante').AsString = 'S' then
        CrearCheckBox(False , '',
                      'check_faltante_'+ FieldByName('df_id').AsString, 615, FieldByName('df_id').AsInteger, iTop,
                      16, gbFormulariosAnexos, nil {ClickFirmaFaltante});

      Inc(iTop, 20);
      Next;
    end;

    if not FFormConfigurado then
    begin
      gbFormulariosAnexos.Height := iTop + 8 + btnRefreshDoc.Height;
      btnRefreshDoc.Top := iTop - 2;
      btnRefreshDoc.Left := 610;

      Self.Height := Self.Height + pnlDatos.Height;
      Self.Constraints.MinHeight := (pnlDatos.Height - gbFormulariosAnexos.Top); //gbFormulariosAnexos.Height + gbFormulariosAnexos.Top + 90;
      Self.Constraints.MinWidth := 729;
      FFormConfigurado := True;
    end;
  finally
    Free;
  end;
end;

procedure TfrmRecepcionSolicitud.CrearCheckBox(const aChecked: Boolean;
  const aCaption, aName: String; const aLeft, aTag, aTop, aWidth: Integer;
  const aParent: TGroupBox; const aOnClick: TNotifyEvent);
begin
  with TCheckBox.Create(Self) do
    begin
      Caption := aCaption;
      Checked := aChecked;
      Left    := aLeft;
      Name    := aName;
      Parent  := aParent;
      Tag     := aTag;
      Top     := aTop;
      Width   := aWidth;
      OnClick := aOnClick; 
    end;
end;

procedure TfrmRecepcionSolicitud.ClickFirmaPresento(Sender: TObject);
var
  aCheck : TCheckBox;
begin
  if not TCheckBox(Sender).Checked then
  begin
    aCheck := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(TCheckBox(Sender).Tag)));
    if aCheck <> nil then
      aCheck.Checked := False;
  end;
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag);
end;

procedure TfrmRecepcionSolicitud.ClickFirmaTitular(Sender: TObject);
var
  aCheck : TCheckBox;
begin
  if TCheckBox(Sender).Checked then
  begin
    aCheck := TCheckBox(FindComponent('_check_' + IntToStr(TCheckBox(Sender).Tag)));
    if not aCheck.Checked then
    begin
      TCheckBox(Sender).Checked := False;
      InfoHint(aCheck, 'Antes de tildar si el documento fue firmado por el titular/apoderado debe indicar la existencia del documento.');
    end;
  end;
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag);
end;

procedure TfrmRecepcionSolicitud.VerificarDocumentacionFaltanteFila(
  const aTag: Integer);
var
  aCheckFaltante: TCheckBox;
  aCheckPresento: TCheckBox;
  aCheckTitular: TCheckBox;
  aCheckVendedor: TCheckBox;
  iCaracter: Integer;
  iIdDocumentacion: Integer;
  sFirmaTitular: String;
  sFirmaVendedor: String;
  sFormaJ: String;
  sPresento: String;
begin
  aCheckPresento := TCheckBox(FindComponent('_check_' + IntToStr(aTag)));
  aCheckTitular  := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(aTag)));
  aCheckVendedor := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(aTag)));
  aCheckFaltante := TCheckBox(FindComponent('check_faltante_' + IntToStr(aTag)));

  if (aCheckPresento <> nil) and (aCheckTitular <> nil) and (aCheckVendedor <> nil) and (aCheckFaltante <> nil) then
  begin
    sPresento      := IIF(aCheckPresento.Checked, 'S', 'N');
    sFirmaTitular  := IIF(aCheckTitular.Checked, 'S', 'N');
    sFirmaVendedor := IIF(aCheckVendedor.Checked, 'S', 'N');

    if not ((FSA_FORMAJ = '') or (FSA_Firmante = '')) then
    begin
      iIdDocumentacion := aTag;
      sFormaJ          := FSA_FORMAJ;
      iCaracter        := StrToInt(FSA_Firmante);
      aCheckFaltante.Checked:= (VerificarDocumentacionFaltante(sFormaJ, iCaracter, iIdDocumentacion, sPresento,
                                                               sFirmaTitular, sFirmaVendedor) = 'S');
      end;
    end;
end;

function TfrmRecepcionSolicitud.VerificarDocumentacionFaltante(
  const aFormaJuridica: String; const aCaracterFirma,
  aIdDocumentoAfi: Integer; const aPresento, aFirmaTitular,
  aFirmaVendedor: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT afiliacion.documentofaltante(:formaj, :idcaracterfirma, :id, :presente, :firmatitular, :firmavendedor, :espcp)' +
     ' FROM DUAL';
  Result := ValorSqlEx(sSql, [aFormaJuridica, aCaracterFirma, aIdDocumentoAfi, aPresento, aFirmaTitular, aFirmaVendedor, IIF(FEsPCP, 'S', 'N')]);
end;

procedure TfrmRecepcionSolicitud.ActualizarDocumentacionFaltante;
var
  aCheck: TCheckBox;
  iCaracter: Integer;
  iIdDocumentacion: Integer;
  iLoop: Integer;
  sFirmaTitular: String;
  sFirmaVendedor: String;
  sFormaJ: String;
  sPresento: String;
begin
  for iLoop := 0 to ComponentCount - 1 do
  begin
    sPresento := '';
    sFirmaTitular := '';
    sFirmaVendedor := '';

    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 7) = '_check_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      if aCheck <> nil then
        sPresento := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        sFirmaTitular := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        sFirmaVendedor := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent('check_faltante_'+ IntToStr(Components[iLoop].Tag)));
      if (aCheck <> nil) and not((FSA_FORMAJ = '') or (FSA_Firmante = '')) then
      begin
        iIdDocumentacion := Components[iLoop].Tag;
        sFormaJ          := FSA_FORMAJ;
        iCaracter        := StrToInt(FSA_Firmante);

        aCheck.Checked := (VerificarDocumentacionFaltante(sFormaJ, iCaracter, iIdDocumentacion, sPresento, sFirmaTitular,
                                                          sFirmaVendedor) = 'S');
      end;
    end;
  end;
end;

procedure TfrmRecepcionSolicitud.btnRefreshDocClick(Sender: TObject);
begin
  ActualizarDocumentacionFaltante;
end;

procedure TfrmRecepcionSolicitud.btnAdministracionArchivosClick(
  Sender: TObject);
  procedure ShowFormAdmArchivos(const aIdSolicitud: Integer);
  begin      //creo el form TfrmAdministracionArchivosRecepcion
    Application.CreateForm(TfrmAdministracionArchivosRecepcion, frmAdministracionArchivosRecepcion);
    try
      frmAdministracionArchivosRecepcion.Mostrar(aIdSolicitud); //muestro
      CalcularArchivos; //veo files cuantos tiene
    finally
      FreeAndNil(frmAdministracionArchivosRecepcion); //libero el formulario
    end;
  end;

begin
  ShowFormAdmArchivos(FSA_ID); //arranco el procedimiento de arriba
end;

procedure TfrmRecepcionSolicitud.ProcesarSolicitud(const aEstadoSolicitud: String);
begin
  //Si la solicitud ingresa por primera vez (estado "Solicitud en tramite") entonces
  //Identificar al usuario a que sector pertenece
  //Originalmente solo se hacia con el estado 20, por pedido en el ticket 52916 se agrego el 20.1
  if (fraEstado.Value <> '20') and (fraEstado.Value <> '20.1') then
  begin  //Si el el estado No es 20 "Solicitud en Tramite"
    if (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'ATCLI') and (Sesion.Sector <> 'AFINOM') then
    begin
      LockRecepcion(True);
      ShowMessage('La Solicitud esta en otro estado que no permite su Recepción. ');
    end
    else
    begin
      if fraSA_ORIGEN.Value <> '2' then
      begin
        LockRecepcion(True);
        ShowMessage('La Solicitud esta en otro estado que no permite su Recepción.');
      end
      else
      begin //dice gaston que en este caso pueden venir sin el usuario asignado, ver si esta asignado y sino cargar uno nuevo
        if fraUsuarioAsignado.IsEmpty then
          fraUsuarioAsignado.Value := AsignarUsuario;
      end;
    end;
  end
  else
  begin //Si el el estado es 20 "Solicitud en Tramite"
    if (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'ATCLI') and (Sesion.Sector <> 'AFINOM')  then   //Si el el estado es 20 "Solicitud en Tramite y el sector de usuario es AFI
    begin  //Origen FAX + Recep Hoy Solo Lectura
      LockRecepcion(False);
      VCLExtra.LockControls([dcbFechaRecepcionAfiliaciones, edFechaSuscripcion, edVigencia], True);
      //pedido de vila bloquear motivo de alta y art anterior si es comercial y esta verificado Srt
      VCLExtra.LockControls([fraSA_MOTIVOALTA, fraSA_ARTANTERIOR], lbSrt.Caption = 'Verificado SRT');
      fraSA_ORIGEN.Value := '2';
      LockControl(fraSA_ORIGEN, True);

      VCLExtra.LockControls([fraUsuarioAsignado], True);
      fraUsuarioAsignado.Clear;
    end
    else //Si el estado es "Solicitud en Tramite" y el sector de usuario es AFI
    begin
      LockRecepcion(False);
      fraUsuarioAsignado.Value := AsignarUsuario;
      fraSA_ORIGEN.Clear;
    end;
    dcbFechaRecepcionAfiliaciones.Date := Now;
  end;

end;
procedure TfrmRecepcionSolicitud.CambiaOrigen(Sender: TObject);
begin                                                  //2 fax 5web
  //Si el Origen es Web en la ASA y lo cambia a web no debe poner en blanco la F Recepcion. Solo de FAX a WEB.
  if (FOrigen = '2') and (fraSA_ORIGEN.Value = '5') then
    dcbFechaRecepcionAfiliaciones.Clear;

  if (fraSA_ORIGEN.Value = '5') and (FOrigenEnter = '2') then  //Si se cambia de estado Fax a Web reasignar usuario
  begin
    fraUsuarioAsignado.Value := AsignarUsuario;
  end;
end;

procedure TfrmRecepcionSolicitud.fraSA_ORIGENEnter(Sender: TObject);
begin
  FOrigenEnter := fraSA_ORIGEN.Value;  //me guardo el estado del frame antes de que lo cambien, para poder ver si pasa de fax a web
end;

function TfrmRecepcionSolicitud.AsignarUsuario: String;
var
  sSql : String;
  aUsuario : String;
begin
  BeginTrans;      //Veo si alguno volvio del alta
  try
    sSql := 'UPDATE afi.usr_usurecepcion SET sr_cantidad = (SELECT max(sr_cantidad) - 2 FROM afi.usr_usurecepcion)' +
          ' WHERE sr_prioridad = 2' +
          ' AND SYSDATE < sr_periodoalta';
    EjecutarSQLSTEx(sSql, []);
    CommitTrans;
  except
    Rollback
  end;


  aUsuario := '';
 //Me fijo si hay alguno que tiene prioridad, si es asi lo selecciono.
  sSql := 'SELECT sr_usuario FROM afi.usr_usurecepcion WHERE' +
            ' rownum < 2 ' +
            ' AND sr_prioridad = 1';
  aUsuario := ValorSqlEx(sSql, []);

  if aUsuario = '' then //si no encontre ninguno con prioridad
  begin //busco alguno que este en estado normal y no este de licencia seleccionando el minimo en cantidad
    sSql := 'SELECT sr_usuario FROM afi.usr_usurecepcion WHERE rownum < 2' +
              ' AND ((sr_periodobaja IS NULL and sr_periodoalta IS NULL) ' +
              ' OR NOT(SYSDATE BETWEEN sr_periodobaja AND sr_periodoalta)) ' +
              ' AND sr_prioridad = 0 ' +
              ' AND sr_cantidad = (SELECT MIN(sr_cantidad) FROM afi.usr_usurecepcion WHERE '+
                                  '((sr_periodobaja IS NULL and sr_periodoalta IS NULL)' +
                                  'OR NOT(SYSDATE BETWEEN sr_periodobaja AND sr_periodoalta)) and sr_prioridad = 0)' +
              ' AND rownum < 2';

    aUsuario := ValorSqlEx(sSql,[]);
  end;

  Result := aUsuario;

end;

procedure TfrmRecepcionSolicitud.CargarDatosDocumentacion(
  const aIdSolicitud: Integer);
var
  aCheck: TCheckBox;
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT do_firmatitular, do_firmavendedor, do_iddocumentoafi, do_presente, do_faltante' +
     ' FROM ado_documentacion, asa_solicitudafiliacion' +
    ' WHERE do_idformulario = sa_idformulario' +
      ' AND sa_id = :id';
  aQuery := GetQueryEx(sSql, [aIdSolicitud]);
  try
    while not aQuery.Eof do
    begin
      aCheck := TCheckBox(FindComponent('_check_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_presente').AsString = 'S');

      aCheck := TCheckBox(FindComponent('check_firmatitular_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmatitular').AsString = 'S');

      aCheck := TCheckBox(FindComponent('check_firmavendedor_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmavendedor').AsString = 'S');

      aCheck := TCheckBox(FindComponent('check_faltante_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_faltante').AsString = 'S');


        {VerificarDocumentacionFaltante(fraSA_FORMAJ.Value,
                                                         fraFirmante.Value,
                                                         aQuery.FieldByName('do_iddocumentoafi').AsInteger,
                                                         aQuery.FieldByName('do_presente').AsString,
                                                         aQuery.FieldByName('do_firmatitular').AsString,
                                                         aQuery.FieldByName('do_firmavendedor').AsString)
                                                         = 'S';}


      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmRecepcionSolicitud.tbGuardarClick(Sender: TObject);
var
 // bInsertarEvento001: Boolean;
  bEnviarEmail: Boolean;
begin
inherited;
  if VerificarRecepcion  then
  begin
  //bInsertarEvento001 := False;
    bEnviarEmail := False;
  //Verificaciones;

    if fraSA_MOTIVOALTA.Value <> '02' then //Si el motivo alta NO es Traspaso
    begin
      if (fraEstado.Value = '20') or (fraEstado.Value = '20.1') then //Si el motivo de alta No es Traspaso y el estado es Solicitud en tramite
        fraEstado.Value := '3.0';     //Cambiar el estado a 3.0 "Solicitud Recepcionada"  (Sino no hacer nada)
    end
    else
    begin
      if (fraEstado.Value = '20') or (fraEstado.Value = '20.1') then //Si el motivo de alta es Traspaso y el estado es Solicitud en tramite
        if (TieneRGRL) or (FEsPCP)  then  //Si tiene RGRL cambiar el estado a 7.0 traspaso en tramite y generar evento 001 en traspasos
        begin //tk 66771 Buenos días Necesitamos pedir que cuando se realicen cargas express (administración de solicitudes/recepción express) de solicitudes del régimen especial (casas particulares) y estas tengan el dato ART anterior, el sistema no envíe a comercial la autorización por no tener FGRL. Esto ya se había pedido y solucionado pero volvió a ocurrir.
         fraEstado.Value := '7.0';
        // bInsertarEvento001 := True; Esto se quito ya que se hace con un trigger
        end
        else  //Si NO tiene RGRL enviar email pidiendo autorizacion y cambiar el estado a ??? //Si es autorizado estado = 0.30
        begin //agregada verificacion por ticket 52916. Cuando el usuario de recepción sea de Comercial y no tilde el FGRL, las observaciones deben ser de carga obligatoria y con un mínimo de 10 caracteres.
          Verificar((Sesion.Sector = 'COME') and (Length(edSA_OBSERVACIONES.Text) < 10), edSA_OBSERVACIONES, 'Es necesaria una descripción de al menos 10 caracteres.');
          bEnviarEmail := True;
          fraEstado.Value := '31';
        // ShowMessage('No es posible recepcionar, se encuentra en etapa de desarrollo');
        end;
    end;

  //if not bEnviarEmail then+
    BeginTrans;
    try
      GuardarSolicitud;

      if bEnviarEmail then
        EnviarEmail;
      CommitTrans;
      ShowMessage('Datos Guardados Correctamente');
    except
      Rollback;
      ShowMessage('Error al guardar los datos');
    end;
  ClearAll;
  end;
 { if bInsertarEvento001 then               //quitado porque se hace con un trigger
    InsertarEventoTraspasoIngreso('001'); }

  //CambiaEmpresa(nil);
end;

function TfrmRecepcionSolicitud.TieneRGRL: Boolean;
var
  aCheck : TCheckBox;
begin
  aCheck := TCheckBox(FindComponent('_check_' + '11'));
  Result := aCheck.Checked;

end;

{procedure TfrmRecepcionSolicitud.InsertarEventoTraspasoIngreso(
  const aEvento: String);
var
  sSqlTrans: TSql;
begin
  sSqlTrans := TSQL.Create('ati_traspasoingreso');
  sSqlTrans.PrimaryKey.Add('ti_id',                  'SEQ_ATI_ID.NEXTVAL', False);
  sSqlTrans.Fields.Add('ti_idformulario',            FSA_IDFORMULARIO);
  sSqlTrans.Fields.Add('ti_codigo',                  aEvento);
  sSqlTrans.Fields.Add('ti_fecha',                   exDate);
  sSqlTrans.Fields.Add('ti_deuda',                   0, dtNumber);
  sSqlTrans.Fields.Add('ti_usualta',                 Sesion.Usuario);
  sSqlTrans.Fields.Add('ti_fechaalta',               exDate);

  sSqlTrans.SqlType := stInsert;
  try
    try
      BeginTrans;
      EjecutarSQLST(sSqlTrans.Sql);
      CommitTrans;
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos del evento.');
      end;
    end;
  finally
    sSqlTrans.Free;
  end;
end; }

procedure TfrmRecepcionSolicitud.GuardarSolicitud;
var
  sSqlTrans: TSql;
begin
  sSqlTrans := TSQL.Create('asa_solicitudafiliacion');

  sSqlTrans.PrimaryKey.Add('sa_id',                  FSA_ID, False);
  sSqlTrans.Fields.Add('sa_origen',                  fraSA_ORIGEN.edCodigo.Text);
  sSqlTrans.Fields.Add('sa_fechaafiliacion',         edFechaSuscripcion.Date);
  sSqlTrans.Fields.Add('sa_fechavigenciadesde',      edVigencia.Date);
  sSqlTrans.Fields.Add('sa_fechavigenciahasta',      GetFechaVigenciaHasta(FSA_ID, edVigencia.Date));

  //(16/07/2013 17:20) ggrossi: Fax ---> Recepcion FaxMail            Web ---> Recep Afi
  //segun que origen de recepcion es guardar una fecha o la otra. 

  if fraSA_ORIGEN.Value = '5' then
    sSqlTrans.Fields.Add('sa_fecharecepcionsectorafi', dcbFechaRecepcionAfiliaciones.Date)
  else
    sSqlTrans.Fields.Add('sa_fecharecepcionfaxemail',  dcbFechaRecepcionAfiliaciones.Date);


  sSqlTrans.Fields.Add('sa_motivoalta',              fraSA_MOTIVOALTA.edCodigo.Text);

  if not fraSA_ARTANTERIOR.IsEmpty then
    sSqlTrans.Fields.Add('sa_idartanterior',           fraSA_ARTANTERIOR.Value)
  else
    sSqlTrans.Fields.Add('sa_idartanterior',           exNull);

  sSqlTrans.Fields.Add('OBSERVACION_EXPRESS',        edSA_OBSERVACIONES.Text);
  sSqlTrans.Fields.Add('sa_estado',                  fraEstado.Codigo);

  //sUsuarioAfi := IIF(fraUsuarioAsignado.IsEmpty, Sesion.UserID, fraUsuarioAsignado.Value);
  //sSqlTrans.Fields.Add('sa_usurecepcionsectorafi',   sUsuarioAfi);  //Indica EVILA que este campo no se debe actualizar
  if not fraUsuarioAsignado.IsEmpty then                              //Y lo cambio por este (email 09/09/2013)
    sSqlTrans.Fields.Add('sa_usuarioasignadocarga',    fraUsuarioAsignado.Value);    

  sSqlTrans.Fields.Add('sa_recepcionexpress', 'S');
  sSqlTrans.Fields.Add('sa_usumodif',                Sesion.UserID);
  sSqlTrans.Fields.Add('sa_fechamodif',              exDateTime);
  sSqlTrans.SqlType := stUpdate;
  try
    EjecutarSQLST(sSqlTrans.Sql);
    GuardarDatosDocumentacion(FSA_ID, False);

    if not fraUsuarioAsignado.IsEmpty then  //Sumo 1 a la cantidad de recepciones
      SumarRecepcionST(fraUsuarioAsignado.Value); //esto en teoria solo va a poder sumar 1 porque una vez recepcionada no vuelve por
    fraEmpresa.Clear;                             //por el mismo camino
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmRecepcionSolicitud.EnviarEmail;
var
  sSql : String;
begin
  sSql :=
        'BEGIN' +                       //usuario solicitud   //sa_id
         ' intraweb.do_autoriza_recepcion(:usuario, :idsolicitud);' +
       ' END;';
  EjecutarSqlSTEx(sSql, [Sesion.UserID, FSA_ID]);

  ShowMessage('Email de autorización enviado');
end;

procedure TfrmRecepcionSolicitud.CalcularArchivos;
var
  sSql: String;
begin
  sSql :=
      'SELECT COUNT(*)' +
       ' FROM afi.aar_archivosrecepcion' +
      ' WHERE ar_fechabaja IS NULL ' +
        ' AND ar_idsolicitudafiliacion = :idsolicitudafiliacion';

  btnAdministracionArchivos.Caption := 'Administración de Archivos (' + ValorSqlEx(sSql, [FSA_ID]) + ')';
end;

procedure TfrmRecepcionSolicitud.GuardarDatosDocumentacion(
  const aIdSolicitud: Integer; const aCommit: Boolean);
var
  aCheck: TCheckBox;
  aSql: TSQL;
  iIdDocumentacion: Integer;
  iIdFormulario: Integer;
  iLoop: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT sa_idformulario' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = :id';
  iIdFormulario := ValorSqlIntegerEx(sSql, [aIdSolicitud]);

  for iLoop := 0 to ComponentCount - 1 do
  begin
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 7) = '_check_') then
    begin
      sSql :=
        'SELECT do_id' +
         ' FROM ado_documentacion' +
        ' WHERE do_idformulario = :idformulario' +
          ' AND do_iddocumentoafi = :iddocumentoafi';
      iIdDocumentacion := ValorSqlIntegerEx(sSql, [iIdFormulario, Components[iLoop].Tag]);

      aSql := TSQL.Create('ado_documentacion');
      try
        if iIdDocumentacion = 0 then
        begin
          aSql.SqlType := stInsert;
          aSql.Fields.Add('do_fechaalta', SQL_DATETIME, False);
          aSql.Fields.Add('do_usualta',   Sesion.UserID);
        end
        else
        begin
          aSql.SqlType := stUpdate;
          aSql.Fields.Add('do_fechamodif', SQL_DATETIME, False);
          aSql.Fields.Add('do_usumodif',   Sesion.UserID);
        end;

        aSql.PrimaryKey.Add('do_id',         iIdDocumentacion);
        aSql.Fields.Add('do_idformulario',   iIdFormulario);
        aSql.Fields.Add('do_iddocumentoafi', Components[iLoop].Tag);

        aCheck := TCheckBox(Components[iLoop]);
        aSql.Fields.Add('do_presente', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmatitular', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmavendedor', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_faltante_'+ IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_faltante', String(IIF(aCheck.Checked, 'S', 'N')));

        if aCommit then
          EjecutarSql(aSql.Sql)
        else
          EjecutarSqlST(aSql.Sql);
      finally
        aSql.Free;
      end;
    end;
  end;
end;

procedure TfrmRecepcionSolicitud.LockRecepcion(const aLock: boolean);
begin
  VCLExtra.LockControls([fraSA_ORIGEN, dcbFechaRecepcionAfiliaciones, edFechaSuscripcion, edVigencia,
  fraSA_MOTIVOALTA, edSA_OBSERVACIONES, fraUsuarioAsignado, gbFormulariosAnexos, btnAdministracionArchivos,
  fraSA_ARTANTERIOR], aLock);
  tbGuardar.Enabled := Not(aLock);

  if not aLock then //hacer esto solo si esta desbloqueada la solicitud
    VCLExtra.LockControls([fraSA_ARTANTERIOR],(fraSA_MOTIVOALTA.Value = '03') or (fraSA_MOTIVOALTA.Value = '04') or (fraSA_MOTIVOALTA.Value = '05'));  //No desblokear si es Nueva al Regimen

  {VLCExtra.LockControls(dcbFechaRecepcionAfiliaciones, aLock);
  LockControls(edFechaSuscripcion, aLock);
  LockControls(edVigencia, aLock);}
end;

procedure TfrmRecepcionSolicitud.ClearAll;
begin
  fraSA_ORIGEN.Clear;
  dcbFechaRecepcionAfiliaciones.Clear;
  edFechaSuscripcion.Clear;
  edVigencia.Clear;
  fraSA_MOTIVOALTA.Clear;
  edSA_OBSERVACIONES.Clear;
  fraSA_ARTANTERIOR.Clear;
  fraUsuarioAsignado.Clear;
  fraEstado.Clear;
  FSA_ID := -1; //pongo el SA_ID en -1 por las dudas
  FEstado := '';
  FSA_IDFORMULARIO := -1;
  FSA_FormaJ := '';
  FSA_Firmante := '';
  FOrigen := '';
  FOrigenEnter := '';
  btnAdministracionArchivos.Caption := 'Administración de Archivos';
  LiberarComponentesDocumentacion; //Hacer free y creer de nuevo para simular un clear
  CrearComponentesDocumentacion;
  FCambiaEmpresa := False;
  lbSrt.Caption := '';
end;

procedure TfrmRecepcionSolicitud.SumarRecepcionST(const aUser: String);
var
  sSql: String;
begin
  //if fraEstado.Value <> '3.0' then //para que no siga sumando si ya recepciono

                                                          //no uso el sa_estado porque en este punto transaccional ya se guardo con 7.0
  if ((FOrigen = '2') and (fraSA_ORIGEN.Value = '5')) or ((FEstado = '20') or (FEstado = '20.1')) then
  begin
    sSql := 'UPDATE afi.usr_usurecepcion SET sr_cantidad = sr_cantidad + 1' +
          ' WHERE sr_usuario = :usuario';
    EjecutarSQLSTEx(sSql, [aUser]);
  end;
end;

procedure TfrmRecepcionSolicitud.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
  ClearAll;
end;

procedure TfrmRecepcionSolicitud.tbHistorialSRTClick(Sender: TObject);
begin
  if fraEmpresa.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  frmCargaSRT.Free;
  frmCargaSRT := TfrmCargaSRT.Create(frmPrincipal);
  frmCargaSRT.DoCargaIDSolicitud(FSA_ID);
  frmCargaSRT.tbSrtClick(nil);
end;

procedure TfrmRecepcionSolicitud.ObtenerArtAnteriorDesdeSRT;
var
  aStatusSrt: TStatusSrt;
begin
  aStatusSrt := ObtenerStatusSrt(fraEmpresa.CUIT, FSA_ID);
  if not aStatusSrt.Error then
  begin
    if aStatusSrt.Status = '1' then
    begin
      fraSA_MOTIVOALTA.Value := '03'; //Nuevo al regimen
      fraSA_ARTANTERIOR.Clear;
      VCLExtra.LockControls([fraSA_ARTANTERIOR], True);
    end;
       //afiliacion vigente           Ceseactiv.                    Sintrabaj.
    if (aStatusSrt.Status = '2') or (aStatusSrt.Status = '3') or (aStatusSrt.Status = '4') then
    begin
      if aStatusSrt.ArtAnterior <> 51 then //provart
      begin
        fraSA_MOTIVOALTA.Value := '02'; //Traspaso ingreso
        fraSA_ARTANTERIOR.Value := aStatusSrt.ArtAnterior;
        VCLExtra.LockControls([fraSA_ARTANTERIOR], False);
      end
      else
      begin
        fraSA_MOTIVOALTA.Value := '04'; //Reafiliacion
        fraSA_ARTANTERIOR.Clear;
        VCLExtra.LockControls([fraSA_ARTANTERIOR], True);
      end;
    end;

    if StrToInt(aStatusSrt.Status) >= 5 then
    begin
      if aStatusSrt.ArtAnterior <> 51 then //provart
        fraSA_MOTIVOALTA.Value := '05' //Rescindida
      else
        fraSA_MOTIVOALTA.Value := '04'; //Reafiliacion
      //fraSA_ARTANTERIOR.Value := aStatusSrt.ArtAnterior;
        fraSA_ARTANTERIOR.Clear;
        VCLExtra.LockControls([fraSA_ARTANTERIOR], True);
    end;
  end
  else
    fraSA_ARTANTERIOR.Clear;
end;

function TfrmRecepcionSolicitud.ObtenerStatusSrt(const aCuit: String;
  const aIdSolicitud: Integer): TStatusSrt;
var
  aVig: TCuilSRT;
  dFecha: TDate;
  dFechaReg: TDate;
  iLoop: Integer;
  sOperacion: String;
  sSql: String;
begin
  Result.ArtAnterior := -1;
  Result.CodigoProvincia := '';
  Result.Error := False;
  Result.Status := '-1';
  //tratamos de obtener los datos desde la srt
  try
    aVig := ConsultarVigencia(aCuit);
    dFecha := StrToDate('01/01/1950');
    InsertarInformacionSrt(FSA_IDFORMULARIO, aVig);
    if (aVig.Error = '') or (aVig.ErrorCodigo = 'CC01') then
    begin
      lbSrt.Caption := 'Verificado SRT';
      lbSrt.Font.Color := clGreen;

      Result.CodigoProvincia := aVig.DataCuil.ProvinciaID;

      if Length(aVig.Historial) = 0 then
        Result.Status := '1'    // Nueva al régimen..
      else
      begin
        for iLoop := 0 to Length(aVig.Historial) - 1 do    //loopeo todo el historial buscando la mayor fecha de vigencia
        begin                                              //me quedo con la mas grande y veo su tipo de operacion
          dFechaReg := StrToDate(Copy(aVig.Historial[iLoop].FechaOperacionDesde, 1, 10));

          if dFechaReg > dFecha then
          begin
            sOperacion := aVig.Historial[iLoop].OperacionHasta;
            if sOperacion = '' then    // Si no viene nada
              Result.Status := '2';   // Afiliación vigente..
            if sOperacion = 'Ceseactiv.' then
              Result.Status := '3';
            if sOperacion = 'Sintrabaj.' then
              Result.Status := '4';
            if (sOperacion = 'Rescisión') or (sOperacion = 'Rescision')  then
            begin
              if aVig.Historial[iLoop].Regularizacion = 'PAGO DE LA DEUDA' then
                Result.Status := '5';
              if aVig.Historial[iLoop].Regularizacion = 'POR EL TRANSCURSO DE UN AÑO' then
                Result.Status := '7';
              if aVig.Historial[iLoop].Regularizacion = 'CONTRATO EXTINGUIDO' then
                Result.Status := '6';
              if aVig.Historial[iLoop].Regularizacion = '' then
                Result.Status := '6';
            end;
            dFecha := StrToDateTime(aVig.Historial[iLoop].FechaOperacionDesde);

            sSql :=
              'SELECT ar_id' +
              ' FROM afi.aar_art' +
              ' WHERE ar_codigosrt = :codigosrt';
            Result.ArtAnterior := ValorSqlIntegerEx(sSql, [aVig.Historial[iLoop].Aseguradora], -1);


          end;
        end;
      end;
    end
    else
    begin
      Result.ArtAnterior := -1;
      Result.Error := True;
      Result.Status := '1';
      lbSrt.Caption := 'No Verificado SRT';
      lbSrt.Font.Color := clRed;
      ShowMessage(aVig.Error);
    end;
  except
    on E: Exception do
    begin
      Result.ArtAnterior := -1;
      Result.CodigoProvincia := '';
      Result.Error := True;
      Result.Status := '-1';
      lbSrt.Caption := 'No Verificado SRT';
      lbSrt.Font.Color := clRed;
      ShowMessage('Tiempo de espera de datos de SRT agotado, Intente más tarde');
    end;
  end;
end;

procedure TfrmRecepcionSolicitud.LiberarComponentesDocumentacion;
var
  aCheck: TCheckBox;
  iLoop: Integer;
begin     //busco todos los componentes que tengan nombre check y los libero
  iLoop := 0;
  while iLoop < ComponentCount do
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 7) = '_check_') or
       (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 6) = 'check_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      FreeAndNil(aCheck);
    end
    else
      Inc(iLoop);
end;

procedure TfrmRecepcionSolicitud.fraSA_MOTIVOALTAExit(Sender: TObject);
begin
  fraSA_MOTIVOALTA.FrameExit(Sender);  //Pedido por grossi como un extra al tk 49178
  if fraSA_MOTIVOALTA.Value <> '02' then
    fraSA_ARTANTERIOR.Clear;

  VCLExtra.LockControls([fraSA_ARTANTERIOR], (fraSA_MOTIVOALTA.Value = '03') or (fraSA_MOTIVOALTA.Value = '04') or (fraSA_MOTIVOALTA.Value = '05'));
end;

function TfrmRecepcionSolicitud.VerificarRecepcion: Boolean;
begin
  Verificar(fraSA_ORIGEN.IsEmpty, fraSA_ORIGEN, 'El origen no puede quedar vacío');

  //esta validacion primero era "recepcion no puede superar el dia de hoy" luego "recepcion no puede superar fecha de suscripcion", y ahora "no puede superar 6 meses el dia de hoy"  //Cambios de Vila y Grossi
  //Verificar(dcbFechaRecepcionAfiliaciones.Date > AddMonths(Date, 6), dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede superar la fecha actual más 6 meses.');
  //Pedido de grossi 28/01/2014 La fecha de afiliaciones no puede superar el dia de hoy.. tk 54211  //Este tk es consecuencia de una Auditoria. No cambiar aunque lo pida Mileo

  dcbFechaRecepcionAfiliaciones.Date := RecodeTime(dcbFechaRecepcionAfiliaciones.Date, 0, 0, 0, 0);

  if fraSA_ORIGEN.Codigo <> '2' then
    Verificar(dcbFechaRecepcionAfiliaciones.Date > Date , dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede ser posterior a hoy.');

  //definido por GGROSSI viernes 21/03/2014
  if (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'ATCLI') and (Sesion.Sector <> 'AFINOM') then //si es delegacion
    Verificar(dcbFechaRecepcionAfiliaciones.Date < CalcDiasHabiles(Date,-5) , dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede ser anterior a 5 hábiles.');

  Verificar(dcbFechaRecepcionAfiliaciones.IsEmpty, dcbFechaRecepcionAfiliaciones, 'La fecha de recepción no puede quedar vacía');
  Verificar(fraSA_MOTIVOALTA.IsEmpty, fraSA_MOTIVOALTA, 'El motivo de alta no puede quedar vacío.');
  Verificar((fraSA_ARTANTERIOR.IsSelected) and (fraSA_MOTIVOALTA.Value <> '02'), fraSA_MOTIVOALTA.edCodigo, 'El motivo de Alta no es Traspaso Ingreso, el campo ART Anterior debe estar en blanco, Verificar Extranet.');
  Verificar((fraSA_MOTIVOALTA.Value = '02') and fraSA_ARTANTERIOR.IsEmpty, fraSA_ARTANTERIOR.edCodigo, 'Si ingresa el motivo de alta "02" entonces el campo ART anterior es obligatorio.');
  //supuestamente a veces queda en -1 el frame (incomprobable), lo verificamos por las dudas.
  Verificar((fraSA_MOTIVOALTA.Value = '02') and (fraSA_ARTANTERIOR.Value = -1), fraSA_ARTANTERIOR.edCodigo, 'Si ingresa el motivo de alta "02" entonces el campo ART anterior no puede quedar vacío');

  Result := True;
end;

procedure TfrmRecepcionSolicitud.fraEmpresamskCUITKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    if isCuit(fraEmpresa.mskCUIT.Text) then
      if IsContratoActivo(fraEmpresa.mskCUIT.Text, fraEmpresa.edFormulario.Text) then
      begin
        Abort;
      end;
    fraEmpresa.mskCUITKeyPress(Sender, Key);
    fraSA_ORIGEN.SetFocus;
  end;
end;

function TfrmRecepcionSolicitud.IsContratoActivo(
  const aCuit, aFormulario: String): Boolean;
var
  sSql : String;
  sdqControlDatos: TSDQuery;
begin
  Result := False;
  sSql :=
         'SELECT   co_contrato, co_vigenciadesde, NVL(co_fechabaja, actualdate + 1) fechabaja, co_fechabaja, co_estado, tb_especial1' +
         '  FROM aem_empresa, aco_contrato, afo_formulario, ctb_tablas' +
         ' WHERE co_idempresa = em_id' +
         ' AND tb_clave = ''AFEST''' +
         ' AND tb_codigo = co_estado' +
         ' AND ( fo_formulario = :formulario' +
         ' OR em_cuit = :cuit)' +
         ' AND co_idformulario = fo_id' +
         ' ORDER BY co_vigenciadesde DESC';
  sdqControlDatos := TSDQuery.Create(Self);
  try
    sdqControlDatos.DataBaseName := 'dbPrincipal';
    OpenQueryEx(sdqControlDatos, [aFormulario, aCuit], sSql, True);

    if not sdqControlDatos.IsEmpty then
    begin
    //Aca hay dos posibilidades: que la empresa siga activa o quiera reafiliarse y que no este en estado 5 (Rechazado por la SRT)
      if (sdqControlDatos.FieldByName('fechabaja').AsDateTime > Date) and
        (sdqControlDatos.FieldByName('tb_especial1').AsString <> '4') and
        (sdqControlDatos.FieldByName('co_estado').AsString <> '5') then
      begin
        //La empresa esta activa
        InvalidMsg(fraEmpresa, 'La empresa está activa con contrato Nº ' + sdqControlDatos.FieldByName('CO_CONTRATO').AsString + ', con vigencia ' + DateToStr(sdqControlDatos.FieldByName('CO_VIGENCIADESDE').AsDateTime) +
                                   CRLF + 'Si desea modificarlo debe ir a Administración de Contrato.');
        Result := True;
      end;
    end;
  finally
    sdqControlDatos.Free;
  end;
end;

procedure TfrmRecepcionSolicitud.InsertarInformacionSrt(const aIdFormulario: Integer; const aVig: TCuilSRT);
var
  sSql: String;
  aSql: TSql;
  i : Integer;
  sRegularizacion : String;
  iOperacion, iIdArt, iCiiu : Integer;
begin
  if aVig.Error = '' then
  begin
    // Doy de baja los registros anteriores para esa cotizacion..
    sSql :=
    'UPDATE ais_informacionsrt' +
      ' SET is_usubaja = :usubaja,' +
          ' is_fechabaja = SYSDATE' +
    ' WHERE is_idformulario = :idformulario';
    EjecutarSqlSTEx(sSql, [Sesion.UserID, aIdFormulario]);

    // Inserto los registros recuperados de la SRT..
    BeginTrans(True);
    try
      for i := 0 to Length(aVig.Historial) -1  do
      begin
        sSql :=
            'SELECT tb_codigo' +
            ' FROM ctb_tablas' +
            ' WHERE tb_clave = ''COPER''' +
            ' AND UPPER(TRIM(art.utiles.reemplazar_acentos(tb_descripcion))) = UPPER(TRIM(art.utiles.reemplazar_acentos(:p1)))';
        with GetQueryEx(sSql, [aVig.Historial[i].OperacionHasta]) do
        try
          if not FieldByName('TB_CODIGO').IsNull then
            iOperacion  := FieldByName('TB_CODIGO').AsInteger
          else
            iOperacion := 1;
        finally
          Free;
        end;

        if aVig.Historial[i].Regularizacion = 'PAGO DE LA DEUDA' then
          sRegularizacion :=  '03' else
        if aVig.Historial[i].Regularizacion = 'POR EL TRANSCURSO DE UN AÑO' then
          sRegularizacion :=  '02' else
        if aVig.Historial[i].Regularizacion = 'CONTRATO EXTINGUIDO' then
          sRegularizacion :=  '01' else
        if aVig.Historial[i].Regularizacion = '' then
          sRegularizacion :=  '01';

        iIdArt := ValorSqlEx('SELECT ar_id FROM aar_art WHERE ar_codigosrt =:cod',[aVig.Historial[i].Aseguradora]);

        if Length(aVig.Historial[i].Ciiu) = 5 then                   //SRT no me manda los 0s no significativos.
          aVig.Historial[i].Ciiu := '0' + aVig.Historial[i].Ciiu;
        iCiiu  := ValorSqlEx('SELECT ac_id FROM cac_actividad WHERE ac_codigo =:ciiu AND ROWNUM < 2', [aVig.Historial[i].Ciiu]);
        aSql := TSql.Create('AIS_INFORMACIONSRT');
        try
          aSql.SqlType := stInsert;
          aSql.PrimaryKey.Add('IS_ID',           'afi.seq_ais_id.NEXTVAL', False);
          aSql.Fields.Add('IS_IDFORMULARIO',          aIdFormulario);
          aSql.Fields.Add('IS_CONTRATO',          aVig.Historial[i].Contrato);
          aSql.Fields.Add('IS_IDART',          iIdArt);
          aSql.Fields.Add('IS_VIGENCIADESDE', StrToDateDef(Copy(aVig.Historial[i].FechaOperacionDesde,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_VIGENCIAHASTA', StrToDateDef(Copy(aVig.Historial[i].FechaOperacionHasta,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_OPERACION',  iOperacion);
          aSql.Fields.Add('IS_NIVEL', aVig.Historial[i].Nivel);
          aSql.Fields.Add('IS_USUALTA', Sesion.UserID);
          aSql.Fields.Add('IS_FECHAALTA', SQL_DATETIME, False);
          aSql.Fields.Add('IS_IDACTIVIDAD1', iCiiu);
          aSql.Fields.Add('IS_FECHAEXTINCION', StrToDateDef(Copy(aVig.Historial[i].FechaExtincion,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_FECHAREGULARIZACION', StrToDateDef(Copy(aVig.Historial[i].FechaRegularizacion,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_RESCISION', sRegularizacion);

          EjecutarSqlSt(aSql.Sql);
        finally
          aSql.Free;
        end;
      end;
      CommitTrans(True);
    except
      Rollback;
    end;
  end;
end;

procedure TfrmRecepcionSolicitud.fraEmpresaedFormularioKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    if IsContratoActivo(fraEmpresa.mskCUIT.Text, fraEmpresa.edFormulario.Text) then
    begin
      //Abort;
    end;
    fraSA_ORIGEN.SetFocus;
  end;
end;

end.
