unit unSolicitudCarpetaUsuario;

interface
                     
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unFraDetalleArchivo,
  StdCtrls, Buttons, unArt, SDEngine;

type
  TfrmSolicitudCarpetaUsuario = class(TfrmCustomForm)
    GroupBox1: TGroupBox;
    fraDetalleArchivoDetalleCarpeta: TfraDetalleArchivo;
    edMotivo: TMemo;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function Validar: Boolean;
    procedure CargarDatosProxSolicitud(IdArchivo: TTableId);
    procedure DoProcesarSolicitud;
  public
  end;

  procedure DoVerificarCarpetasPendientesEntregaUsuario;

var
  qry: TSDQuery;

implementation

uses
  unDmPrincipal, unConstantArchivo, unComunesMail, unSesion, unUtilsArchivo,
  StrFuncs, CustomDlgs, unEspera, General, unComunes;

{$R *.dfm}

procedure DoVerificarCarpetasPendientesEntregaUsuario;
var
  sSql: String;
begin
  VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
      get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

  sSql := 'SELECT TA_DESCRIPCION TIPOARCHIVO, ' +
                 'ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) CLAVE, SE_MAIL, ' +
                 'AR_ID, SOLICACTUAL.SC_ID SCID_SOLICACTUAL, ' +
                 'DECODE(SOLICPENDIENTE.SC_TIPOSOLICITUD, ''1'', ''2 HORAS'', ''2'', ''4 HORAS'', ''3'', ''24 HORAS'') TIPOSOLICITUD_SOLICPENDIENTE ' +
            'FROM RAR_ARCHIVO, RTA_TIPOARCHIVO, RTC_TIPOCLAVE, USE_USUARIOS, ' +
                 'RSC_SOLICITUDCARPETA SOLICACTUAL, RSC_SOLICITUDCARPETA SOLICPENDIENTE  ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND SOLICACTUAL.SC_ID = (SELECT MAX(RSC1.SC_ID) ' +
                                        'FROM RSC_SOLICITUDCARPETA RSC1 ' +
                                       'WHERE RSC1.SC_IDARCHIVO = AR_ID ' +
                                         'AND RSC1.SC_FECHAIMPRESION IS NOT NULL ' +
                                         'AND RSC1.SC_FECHARECEPCION IS NOT NULL ' +
                                         'AND RSC1.SC_FECHADEVOLUCION IS NULL ' +
                                         'AND RSC1.SC_USUARIOSOLICITUD = AR_UBICACION) ' +
             'AND SOLICPENDIENTE.SC_ID = (SELECT MIN(RSC2.SC_ID) ' +
                                           'FROM RSC_SOLICITUDCARPETA RSC2 ' +
                                          'WHERE RSC2.SC_IDARCHIVO = AR_ID ' +
                                            'AND RSC2.SC_FECHAIMPRESION IS NOT NULL ' +
                                            'AND RSC2.SC_FECHARECEPCION IS NULL ' +
                                            'AND RSC2.SC_FECHASOLICITUD >= TO_DATE(''01/03/2010'', ''DD/MM/YYYY'') ' +
                                            'AND RSC2.SC_USUARIOSOLICITUD <> AR_UBICACION) ' +
             'AND AR_ID = SOLICACTUAL.SC_IDARCHIVO ' +
             'AND AR_ID = SOLICPENDIENTE.SC_IDARCHIVO ' +
             'AND SOLICACTUAL.SC_ID < SOLICPENDIENTE.SC_ID ' +
             'AND (SYSDATE - SOLICACTUAL.SC_FECHARECEPCION) > 1/24 ' +    // luego de tener una hora la carpeta en su poder se la puede reclamar
             'AND NVL(TRUNC(SOLICACTUAL.SC_FECHAMOTIVORETENCION), ACTUALDATE-1) < ACTUALDATE ' +  // si aun no ingresó un motivo por la no devolución o si aun no lo hizo en el dia de la fecha en que se está logueando al sistema
             'AND SOLICPENDIENTE.SC_USUARIOSOLICITUD = SE_USUARIO ' +
             'AND AR_UBICACION = :Ubicacion ' +
             'AND AR_TIPOUBICACION = :TipoUbicacion ' +
           'ORDER BY TA_ID, AR_ID';

  qry := GetQueryEx(sSql, [Sesion.UserId, TIPOUBICACION_USUARIO]);
  with qry do
    try
      if Eof then
        Exit
      else
        with TfrmSolicitudCarpetaUsuario.Create(nil) do
          try
            CargarDatosProxSolicitud(qry.FieldByName('AR_ID').AsInteger);

            ShowModal;
          finally
            Free;
          end;
    finally
      Free;
    end;
end;

function TfrmSolicitudCarpetaUsuario.Validar: Boolean;
begin
  Verificar(IsEmptyString(edMotivo.Lines.Text), edMotivo , 'Debe ingresar el motivo de no entrega de la carpeta.');
  Verificar(not IsTextoValido(edMotivo.Lines.Text, 12, 5, 3), edMotivo, 'Debe explicar con más detalle el motivo de no entrega de la carpeta.');

  Result := True;
end;

procedure TfrmSolicitudCarpetaUsuario.btnOkClick(Sender: TObject);
begin
  if Validar then
    DoProcesarSolicitud;
end;

procedure TfrmSolicitudCarpetaUsuario.CargarDatosProxSolicitud(IdArchivo: TTableId);
begin
  fraDetalleArchivoDetalleCarpeta.CargarDetalleArchivo(IdArchivo);

  edMotivo.Clear;
end;

procedure TfrmSolicitudCarpetaUsuario.DoProcesarSolicitud;
var
  sMotivoRetencion, sSql: String;
  bExcluirMailResponsable: Boolean;
begin
  sMotivoRetencion := Trim(edMotivo.Lines.Text);

  SendByMailServer(qry.FieldByName('se_mail').AsString,
      Sesion.UserId, '[Documentación] Solicitud de Carpetas en poder de otros Usuarios', '',
      'Se me ha solicitado que le entregue la carpeta del archivo de ' +
      qry.FieldByName('TipoArchivo').AsString + CRLF +
      ' Clave: ' + qry.FieldByName('Clave').AsString + CRLF +
      ' Urgencia: ' + qry.FieldByName('tiposolicitud_solicpendiente').AsString + CRLF +
      ' que se encuentra en mi poder.' + CRLF +
      'Motivo de no entrega de la carpeta: ' + sMotivoRetencion + CRLF + UCase(Sesion.Usuario),
      false, false, false, Sesion.UserId, False);

  SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
      Sesion.UserId, '[Documentación] Solicitud de Carpetas en poder de otros Usuarios', '',
      'Se me ha solicitado que le entregue la carpeta del archivo de ' +
      qry.FieldByName('TipoArchivo').AsString + CRLF +
      ' Clave: ' + qry.FieldByName('Clave').AsString + CRLF +
      ' Urgencia: ' + qry.FieldByName('tiposolicitud_solicpendiente').AsString + CRLF +
      ' que se encuentra en mi poder.' + CRLF +
      'Motivo de no entrega de la carpeta: ' + sMotivoRetencion + CRLF + UCase(Sesion.Usuario),
      false, false, false, Sesion.UserId, False);

  bExcluirMailResponsable := AreIn(Get_SectorUsuario(Sesion.RespondeA), ['LEGAL']);  // Legales

  if not bExcluirMailResponsable then
    SendByMailServer(Sesion.MailRespondeA,
        Sesion.UserId, '[Documentación] Solicitud de Carpetas en poder de otros Usuarios', '',
        'Se me ha solicitado que le entregue la carpeta del archivo de ' +
        qry.FieldByName('TipoArchivo').AsString + CRLF +
        ' Clave: ' + qry.FieldByName('Clave').AsString + CRLF +
        ' Urgencia: ' + qry.FieldByName('tiposolicitud_solicpendiente').AsString + CRLF +
        ' que se encuentra en mi poder.' + CRLF +
        'Motivo de no entrega de la carpeta: ' + sMotivoRetencion + CRLF + UCase(Sesion.Usuario),
        false, false, false, Sesion.UserId, False);

  sSql := 'UPDATE RSC_SOLICITUDCARPETA ' +
             'SET SC_MOTIVORETENCION = :Motivo, ' +
                 'SC_FECHAMOTIVORETENCION = ACTUALDATE, ' +
                 'SC_USUARIOMOTIVORETENCION = :Usuario ' +
           'WHERE SC_ID = :Id';
  EjecutarSqlSTEx(sSql, [sMotivoRetencion, Sesion.UserId, qry.FieldByName('scid_solicactual').AsInteger]);

  MsgBox('Se han enviado correctamente los correos electrónicos respecto a la carpeta actual.', MB_ICONINFORMATION);
  edMotivo.SetFocus;

  qry.Next;

  if qry.Eof then
    ModalResult := mrOk
  else
    CargarDatosProxSolicitud(qry.FieldByName('AR_ID').AsInteger);
end;

procedure TfrmSolicitudCarpetaUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  BeginTrans;
end;

procedure TfrmSolicitudCarpetaUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CommitTrans(True);
end;

end.

