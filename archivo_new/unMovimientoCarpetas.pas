unit unMovimientoCarpetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraUsuario, unArtFrame, unFraFiltroArchivo, Provider, DBClient, DB,
  SDEngine, Mask, PatternEdit, IntEdit, Grids, DBGrids, ExtCtrls, unArt,
  artSeguridad, unPrincipal;

type
  TfrmMovimientoCarpetas = class(TForm)
    GroupBox2: TGroupBox;
    gbUsuario: TGroupBox;
    fraUsuariosMovimCarpeta: TfraUsuarios;
    btnAceptarMovim: TBitBtn;
    btnCancelarMovim: TBitBtn;
    sdqMovimCarpeta: TSDQuery;
    sdqMovimCarpetaTA_DESCRIPCION: TStringField;
    sdqMovimCarpetaAR_DESCRIPCIONCLAVE: TStringField;
    dsMovimCarpeta: TDataSource;
    cdsMovimCarpeta: TClientDataSet;
    cdsMovimCarpetaTA_DESCRIPCION: TStringField;
    cdsMovimCarpetaAR_DESCRIPCIONCLAVE: TStringField;
    dspMovimCarpeta: TDataSetProvider;
    GridRecepCarpeta: TDBGrid;
    Label1: TLabel;
    edCantCarpetasMovim: TIntEdit;
    rgUbicacion: TRadioGroup;
    gbObservaciones: TGroupBox;
    edObservaciones: TMemo;
    gbEstudio: TGroupBox;
    fraEstudiosMovimCarpeta: TfraCodigoDescripcion;
    Seguridad: TSeguridad;
    fraFiltroArchivoMovimCarpeta: TfraFiltroArchivo;
    procedure btnCancelarMovimClick(Sender: TObject);
    procedure btnAceptarMovimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraFiltroArchivoMovimCarpetabtnCargarCodigoBarrasClick(Sender: TObject);
    procedure rgUbicacionClick(Sender: TObject);
    procedure fraFiltroArchivoMovimCarpetaChange(Sender: TObject);
  private
    FHuboCambiosCarpetas : boolean;
    function ValidarMovimientoCarpeta: Boolean;
    procedure DoMovimientoCarpeta(Tipo: Integer; Clave, Usuario: String; IdEstudio: TTableId);
    procedure DoInsertarRegMovimCarpeta(Tipo: Integer; Clave: String);
  public
  end;

  procedure DoCargaMovimSiniestroEstudioJuicioParteDemandada(Clave: String; IdEstudioAbog: TTableId = ART_EMPTY_ID);

var
  frmMovimientoCarpetas: TfrmMovimientoCarpetas;

implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, ArchFuncs, unDmPrincipal, unConstantArchivo,
  unSesion, VCLExtra, General, unUtilsArchivo, unComunesArchivo, StrFuncs;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TFrmMovimientoCarpetas.btnAceptarMovimClick(Sender: TObject);
begin
  if ValidarMovimientoCarpeta then
    begin
      DoPerderFoco(GridRecepCarpeta, GridRecepCarpeta);
      if fraFiltroArchivoMovimCarpeta.HuboError then
        Exit;

      DoMovimientoCarpeta(fraFiltroArchivoMovimCarpeta.Tipo, fraFiltroArchivoMovimCarpeta.Clave, fraUsuariosMovimCarpeta.Value, StrToIntDef(fraEstudiosMovimCarpeta.Codigo, 0));

      if not fraFiltroArchivoMovimCarpeta.ReadOnly then
        fraFiltroArchivoMovimCarpeta.ClearArchivo(False);
    end;

  if not fraFiltroArchivoMovimCarpeta.ReadOnly and fraFiltroArchivoMovimCarpeta.CodigoBarrasOk then
    fraFiltroArchivoMovimCarpetabtnCargarCodigoBarrasClick(Sender);
end;
{------------------------------------------------------------------------------}
function TFrmMovimientoCarpetas.ValidarMovimientoCarpeta: Boolean;
var
  sDescrEstado, sEstado, sUsuarioSolicitud, sSql: String;
  bCarpetaUsuario: Boolean;
begin
  Verificar((rgUbicacion.ItemIndex = 0) and not (GetPerfilAdministrador() or GetPerfilGuardaYDigitalizacion()), rgUbicacion, 'Ud. no tiene permiso para mover la carpeta a un usuario.');
  Verificar((rgUbicacion.ItemIndex = 0) and fraUsuariosMovimCarpeta.IsEmpty, fraUsuariosMovimCarpeta.edCodigo, 'Debe ingresar el usuario al que se le asigna la carpeta.');
  Verificar((rgUbicacion.ItemIndex = 3) and fraEstudiosMovimCarpeta.IsEmpty, fraEstudiosMovimCarpeta.edCodigo, 'Debe ingresar el estudio al que se le asigna la sub-administración de la carpeta.');
  Verificar(not fraFiltroArchivoMovimCarpeta.IsCompleted, fraFiltroArchivoMovimCarpeta.fraTipoArchivo.cmbDescripcion, 'Debe completar los datos de la carpeta.');
  Verificar((rgUbicacion.ItemIndex <> 3) and (rgUbicacion.ItemIndex <> 5) and Seguridad.Claves.IsActive('SoloPermisoMoverEstudioLegal'), fraEstudiosMovimCarpeta.edCodigo, 'Solo tiene permiso para mover carpetas desde o hacia un Estudio Legal/Abogado.');

  if (rgUbicacion.ItemIndex <> 1) and not Is_CarpetaExtraviada(fraFiltroArchivoMovimCarpeta.Tipo, fraFiltroArchivoMovimCarpeta.Clave) then    // si no es Carpeta Extraviada ni está actualmente como Extraviada
    begin
      sSql := 'SELECT 1 ' +
                'FROM RSC_SOLICITUDCARPETA, RAR_ARCHIVO ' +
               'WHERE AR_ID = SC_IDARCHIVO ' +
                 'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Tipo) + ' ' +
                 'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Clave);

      Verificar(not ExisteSql(sSql), fraFiltroArchivoMovimCarpeta.fraTipoArchivo.cmbDescripcion, 'La carpeta no ha sido solicitada.');
    end;

  if (rgUbicacion.ItemIndex <> 3) and (rgUbicacion.ItemIndex <> 5)  then   // si no es estudio legal / abogado ni es devol. de carpeta al usuario
    begin
      sSql := 'SELECT SC_USUARIOSOLICITUD ' +
                'FROM RSC_SOLICITUDCARPETA, RAR_ARCHIVO ' +
               'WHERE AR_ID = SC_IDARCHIVO ' +
                 'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Tipo) + ' ' +
                 'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Clave) + ' ' +
                 'AND SC_FECHARECEPCION IS NULL';
      sUsuarioSolicitud := ValorSql(sSql);

      if rgUbicacion.ItemIndex = 0 then   // usuario
        Verificar(not IsEmptyString(sUsuarioSolicitud), fraFiltroArchivoMovimCarpeta.fraTipoArchivo.cmbDescripcion, 'Ya existe una solicitud pendiente para la carpeta por el usuario: ' + sUsuarioSolicitud + '. Debe recepcionarla previamente antes de moverla.')
      else
        Verificar(not IsEmptyString(sUsuarioSolicitud), fraFiltroArchivoMovimCarpeta.fraTipoArchivo.cmbDescripcion, 'Ya existe una solicitud pendiente para la carpeta.');
    end;

  if (rgUbicacion.ItemIndex = 0) or (rgUbicacion.ItemIndex = 2) or (rgUbicacion.ItemIndex = 3) then   // usuario - carpeta entregada a terceros - estudio legal/abogado
    begin
      sEstado := Get_EstadoCarpeta(fraFiltroArchivoMovimCarpeta.IdArchivo, sDescrEstado);

      if sEstado = ESTADOCARPETA_ENTRANSITO_USU then
        begin
          sSql := 'SELECT SC_USUARIOSOLICITUD ' +
                    'FROM RSC_SOLICITUDCARPETA RSC1, RAR_ARCHIVO ' +
                   'WHERE AR_ID = RSC1.SC_IDARCHIVO ' +
                     'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Tipo) + ' ' +
                     'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Clave) + ' ' +
                     'AND RSC1.SC_ID = (SELECT MAX(SC_ID) ' +
                                         'FROM ARCHIVO.RSC_SOLICITUDCARPETA RSC2 ' +
                                        'WHERE RSC2.SC_IDARCHIVO = RSC1.SC_IDARCHIVO)';
          sUsuarioSolicitud := ValorSql(sSql);

          Verificar(True, fraFiltroArchivoMovimCarpeta.fraTipoArchivo.cmbDescripcion, 'El usuario ' + sUsuarioSolicitud + ' debe recepcionar previamente la carpeta desde GyD, antes de moverla.');
        end;
    end;

  if (rgUbicacion.ItemIndex = 3) or (rgUbicacion.ItemIndex = 5) then
    begin
      sSql := 'SELECT 1 ' +
                'FROM RAR_ARCHIVO ' +
               'WHERE AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO) + ' ' +
                 'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Tipo) + ' ' +
                 'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Clave);
      bCarpetaUsuario := ExisteSql(sSql);

      if rgUbicacion.ItemIndex = 3 then     // estudio legal / abogado
        begin
          Verificar(not bCarpetaUsuario, fraEstudiosMovimCarpeta.edCodigo, 'La carpeta debe estar en poder de algún usuario para ser sub-administrada por un estudio.');

          sSql := 'SELECT 1 ' +
                    'FROM RAR_ARCHIVO ' +
                   'WHERE AR_TIPO = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Tipo) + ' ' +
                     'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Clave) + ' ' +
                     'AND AR_IDABOGADO = ' + SqlValue(StrToIntDef(fraEstudiosMovimCarpeta.Codigo, 0));

          Verificar(ExisteSql(sSql), nil, 'La carpeta ya se encuentra en poder del estudio seleccionado.');
        end
      else
        begin  // devol. de carpeta al usuario
          Verificar(not bCarpetaUsuario, nil, 'La carpeta debe estar en poder de algún usuario para ser devuelta al mismo.');

          sSql := 'SELECT 1 ' +
                    'FROM RAR_ARCHIVO ' +
                   'WHERE AR_TIPO = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Tipo) + ' ' +
                     'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Clave) + ' ' +
                     'AND AR_IDABOGADO IS NOT NULL';

          Verificar(not ExisteSql(sSql), nil, 'La carpeta debe estar en poder de algún estudio para ser devuelta al usuario.');
        end;
    end
  else
    begin
      sSql := 'SELECT 1 ' +
                'FROM RAR_ARCHIVO ' +
               'WHERE AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO) + ' ' +
                 'AND AR_UBICACION = ' + SqlValue(fraUsuariosMovimCarpeta.Value) + ' ' +
                 'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Tipo) + ' ' +
                 'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoMovimCarpeta.Clave);
      Verificar(ExisteSql(sSql), fraUsuariosMovimCarpeta.cmbDescripcion, 'La carpeta ya se encuentra cargada para dicho usuario.');
    end;

  if rgUbicacion.ItemIndex = 0 then  // Usuario
    Verificar(ObtenerValorEx('ARCHIVO.IS_PERMISOVERTIPOARCHIVO(:TipoArchivo, :Usuario)', [fraFiltroArchivoMovimCarpeta.Tipo, fraUsuariosMovimCarpeta.Value]) = 'N', fraUsuariosMovimCarpeta.cmbDescripcion, 'El usuario no tiene perfil para trabajar con este tipo de carpetas.');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmMovimientoCarpetas.DoMovimientoCarpeta(Tipo: Integer; Clave, Usuario: String; IdEstudio: TTableId);
var
  sEstudio, sObservac, sReceptor, sSectorUsu, sUbic, sTipoUbic, sSql: String;
  IdArchivo: TTableId;
begin
  try
    case rgUbicacion.ItemIndex of
      0: begin  // Usuario
           sTipoUbic  := TIPOUBICACION_USUARIO;
           sUbic      := Usuario;
           sSectorUsu := 'ARCHIVO.GET_SECTORUSUARIO(' + SqlValue(Usuario) + ', ' + SqlValue(TIPOUBICACION_USUARIO) + ')';
           sReceptor  :=  SqlValue(Usuario);
           sObservac  := 'NULL';
         end;
      1, 2, 4: begin  // Carpeta Extraviada / Carpeta Entregada a Terceros / Carpeta Anulada
                 if rgUbicacion.ItemIndex = 1 then
                   sUbic      := UBIC_EXTRAVIADA  // Carpeta Extraviada
                 else if rgUbicacion.ItemIndex = 2 then
                   sUbic      := UBIC_TERCEROS    // Carpeta Entregada a Terceros
                 else
                   sUbic      := UBIC_ANULADA;    // Carpeta Anulada

                 sTipoUbic  := TIPOUBICACION_LUGAR;
                 sSectorUsu := 'NULL';
                 sReceptor  := 'NULL';
                 sObservac  := SqlValue(edObservaciones.Lines.Text);
               end;
      3, 5: begin // estudio legal/abogado / devol. de carpeta al usuario
              if rgUbicacion.ItemIndex = 3 then
                sEstudio := Trim(IntToStr(IdEstudio))
              else
                sEstudio := 'NULL';
            end;
    end;

    BeginTrans;
    try
      IdArchivo := GetIdArchivo(Tipo, Clave);

      if (rgUbicacion.ItemIndex = 3) or (rgUbicacion.ItemIndex = 5) then  // estudio legal/abogado / devol. de carpeta al usuario
        sSql := 'UPDATE RAR_ARCHIVO ' +
                   'SET AR_IDABOGADO = ' + sEstudio + ', ' +
                       'AR_FECHAMOVIMIENTO = SYSDATE' + ' ' +
                 'WHERE AR_ID = ' + SqlValue(IdArchivo)
      else
        sSql := 'UPDATE RAR_ARCHIVO ' +
                   'SET AR_TIPOUBICACION = ' + SqlValue(sTipoUbic) + ', ' +
                       'AR_UBICACION = ' + SqlValue(sUbic) + ', ' +
                       'AR_FECHAMOVIMIENTO = SYSDATE' + ', ' +
                       'AR_EMISOR =' + SqlValue(Sesion.UserId) + ', ' +
                       'AR_SECTORUSUARIO = ' + sSectorUsu + ', ' +
                       'AR_RECEPTOR = ' + sReceptor + ', ' +
                       'AR_IDABOGADO = NULL, ' +
                       'AR_OBSERVACIONES = ' + sObservac + ', ' +
                       'AR_CAJA = NULL, ' +
                       'AR_IDREMITODEVOL = NULL, ' +
                       'AR_SEQ_REMITODEVOL = NULL ' +
                 'WHERE AR_ID = ' + SqlValue(IdArchivo);
      EjecutarSqlST( sSql );

      if rgUbicacion.ItemIndex = 0 then   // Usuario 
        DoModificarEstadoCarpeta(IdArchivo, ESTADOCARPETA_PODERUSUARIO, False, ART_EMPTY_ID, NVL(Usuario, Sesion.UserId));

      CommitTrans;
    except
      RollBack;
      raise;
    end;

    FHuboCambiosCarpetas := True;

    DoInsertarRegMovimCarpeta(Tipo, Clave);
  except
    on E:Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al trasladar la carpeta' );
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmMovimientoCarpetas.btnCancelarMovimClick(Sender: TObject);
begin
  if FHuboCambiosCarpetas then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;
{------------------------------------------------------------------------------}
procedure TfrmMovimientoCarpetas.FormCreate(Sender: TObject);
begin
  fraFiltroArchivoMovimCarpeta.OnChange := fraFiltroArchivoMovimCarpetaChange;

  with fraEstudiosMovimCarpeta do
    begin
      TableName   := 'LEGALES.LBO_ABOGADO ';
      FieldID     := 'BO_ID';
      FieldCodigo := 'BO_ID';
      FieldDesc   := 'BO_NOMBRE';
      FieldBaja   := 'BO_FECHABAJA';
      ShowBajas   := False;
    end;

  FHuboCambiosCarpetas := False;
  fraUsuariosMovimCarpeta.Clear;
  fraEstudiosMovimCarpeta.Clear;
  fraFiltroArchivoMovimCarpeta.Clear;
  rgUbicacion.ItemIndex := 0;    // Usuario
  rgUbicacionClick(nil);

  cdsMovimCarpeta.Open;
  sdqMovimCarpeta.Close;
  edCantCarpetasMovim.Value := 0;
  VCLExtra.LockControl(edCantCarpetasMovim);
end;
{------------------------------------------------------------------------------}
procedure TfrmMovimientoCarpetas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsMovimCarpeta.Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmMovimientoCarpetas.DoInsertarRegMovimCarpeta(Tipo: Integer; Clave: String);
var
  sSql: String;
  qry: TSDQuery;
begin
  sSql := 'SELECT TA_DESCRIPCION, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) AR_DESCRIPCIONCLAVE ' +
            'FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RAR_ARCHIVO ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND AR_TIPO = ' + SqlValue(Tipo) + ' ' +
             'AND AR_CLAVE = ' + SqlValue(Clave);

  qry := GetQuery(sSql);
  try
    with cdsMovimCarpeta do
      begin
        if not (qry.FieldByName('TA_DESCRIPCION').IsNull or qry.FieldByName('AR_DESCRIPCIONCLAVE').IsNull) then
          begin
            Insert;

            FieldByName('TA_DESCRIPCION').AsString      := qry.FieldByName('TA_DESCRIPCION').AsString;
            FieldByName('AR_DESCRIPCIONCLAVE').AsString := qry.FieldByName('AR_DESCRIPCIONCLAVE').AsString;

            Post;
          end;
      end;
  finally
    qry.Free;
  end;

  edCantCarpetasMovim.Value := cdsMovimCarpeta.RecordCount;
end;
{------------------------------------------------------------------------------}
procedure TfrmMovimientoCarpetas.fraFiltroArchivoMovimCarpetabtnCargarCodigoBarrasClick(Sender: TObject);
begin
  inherited;

  fraFiltroArchivoMovimCarpeta.btnCargarCodigoBarrasClick(Sender);

  if fraFiltroArchivoMovimCarpeta.CodigoBarrasOk then
    btnAceptarMovimClick(Sender);
end;                     
{------------------------------------------------------------------------------}
procedure TfrmMovimientoCarpetas.rgUbicacionClick(Sender: TObject);
var
  bVerUsuario, bVerEstudio: Boolean;
begin
  bVerUsuario := (rgUbicacion.ItemIndex = 0);
  bVerEstudio := (rgUbicacion.ItemIndex = 3);

  gbUsuario.Visible := bVerUsuario;
  gbEstudio.Visible := bVerEstudio;

  VCLExtra.LockControls([gbObservaciones], bVerUsuario);

  fraUsuariosMovimCarpeta.Clear;
  fraEstudiosMovimCarpeta.Clear;
  edObservaciones.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmMovimientoCarpetas.fraFiltroArchivoMovimCarpetaChange(Sender: TObject);
begin
  if fraFiltroArchivoMovimCarpeta.IsCompleted  and Is_CarpetaExtraviada(fraFiltroArchivoMovimCarpeta.Tipo, fraFiltroArchivoMovimCarpeta.Clave) then
    InfoHint(fraFiltroArchivoMovimCarpeta.fraTipoArchivo.cmbDescripcion, 'La carpeta se encuentra extraviada.');
end;
{------------------------------------------------------------------------------}
procedure DoCargaMovimSiniestroEstudioJuicioParteDemandada(Clave: String; IdEstudioAbog: TTableId = ART_EMPTY_ID);
begin
  with TfrmMovimientoCarpetas.Create(nil) do
    try
      with fraFiltroArchivoMovimCarpeta do
        begin
          Visible := False;
          try
            Tipo := ID_CARPETA_SINIESTRO;
            OnArchivoChange(nil);
            ReadOnly := True;
          finally
            Visible := True;
          end;
        end;

      fraFiltroArchivoMovimCarpeta.DoCargarClaveArchivo(ID_CARPETA_SINIESTRO, Clave);

      if IdEstudioAbog = ART_EMPTY_ID then
        rgUbicacion.ItemIndex := 5               // devol. de carpeta al usuario
      else
        begin
          rgUbicacion.ItemIndex          := 3;    // Estudio / Abogado
          fraEstudiosMovimCarpeta.Codigo := IntToStr(IdEstudioAbog);    // lo hago asi por compatibilidad con RedPres
        end;

      VCLExtra.LockControls([fraFiltroArchivoMovimCarpeta, rgUbicacion]);

      ShowModal;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
end.

