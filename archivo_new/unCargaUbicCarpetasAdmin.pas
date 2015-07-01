unit unCargaUbicCarpetasAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Buttons,
  ComCtrls, JvExComCtrls, JvProgressBar, SDEngine, Mask, PatternEdit,
  IntEdit, unArt, ExtCtrls;

type
  TfrmCargaUbicCarpetasAdmin = class(TfrmCustomForm)
    jvpgProgreso: TJvProgressBar;
    gbResumen: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    lbImportar: TLabel;
    edCantReg: TIntEdit;
    edCantErrores: TIntEdit;
    Panel1: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    lblStatus: TLabel;
    procedure btnAceptarClick(Sender: TObject);
  private
    function ValidarArchivo: Boolean;
    procedure DoValidarRegistro(qry: TSDQuery; var Errores: Integer);
    procedure DoCargarError(Id: TTableId; DescrError: String; var Errores: Integer);
    function DoGuardarUbicaciones(Original: Boolean): Boolean;
    procedure DoLimpiarDatos;
    procedure DoLimpiarUbicaciones;
    procedure DoEnviarMailAviso(ArchivoValido: Boolean; CantReg, CantErrores: Integer);
    function DoVerificarRepetidos: Boolean;
  public
  end;

const
  CANTREGACT = 100;

var
  frmCargaUbicCarpetasAdmin: TfrmCargaUbicCarpetasAdmin;

implementation

uses
  unImpoExpoWizard, unSesion, unDmPrincipal, unUtilsArchivo, unComunesArchivo,
  StrFuncs, unConstantArchivo, CustomDlgs, unEspera, unComunesMail, General;

{$R *.dfm}

procedure TfrmCargaUbicCarpetasAdmin.btnAceptarClick(Sender: TObject);
var
  bOriginal: Boolean;
begin
  if ImpoExpoWizard('UBAGA') then
    begin
      if DoVerificarRepetidos then
        MsgBox('Se han encontrado registros duplicados. Debe eliminarlos antes de procesar el archivo.', MB_ICONERROR)
      else
        begin
          if ValidarArchivo then
            begin
              bOriginal := (MsgBox('¿El archivo que va a procesar es orignal?' + CRLF + 'En caso afirmativo elija SI y se borrarán todas las ubicaciones previamente cargadas.' + CRLF + 'Si es un archivo adicional, elija NO y permanecerán intactas las ubicacioens existentes.', MB_ICONQUESTION+MB_YESNO) = IDYES);
              if bOriginal then
                DoLimpiarUbicaciones;

              if DoGuardarUbicaciones(bOriginal) then
                begin
                  DoEnviarMailAviso(True, edCantReg.Value, 0);
                  MsgBox('Ubicaciones de carpetas procesadas correctamente.');
                end;
            end
          else
            begin
              DoEnviarMailAviso(False, edCantReg.Value, edCantErrores.Value);

              MsgBox('Se han encontrado errores en el archivo.' + CRLF + 'Se generará un archivo de texto llamado ''ErroresUbicCarpetas.txt'' con los errores correspondientes (en caso de existir un archivo con el mismo nombre, se sobreescribirá).', MB_ICONERROR);
              ImpoExpoWizard('UEAGA');

              MsgBox('Se generará además un archivo de texto llamado ''OKUbicCarpetas.txt'' que es el archivo originalmente cargado sin los errores encontrados (en caso de existir un archivo con el mismo nombre, se sobreescribirá).', MB_ICONERROR);
              ImpoExpoWizard('OKAGA');
            end;

          DoLimpiarDatos;
        end;  
    end;
end;

function TfrmCargaUbicCarpetasAdmin.ValidarArchivo: Boolean;
var
  iErrores, i: Integer;
  sSql: String;
  qry: TSDQuery;
begin
  Result := False;

  sSql := 'SELECT UC_ID ID, UC_CODARCHIVO CODARCHIVO, UC_CLAVE CLAVE, UC_CODUBICACION_ADMIN CODUBICACION_ADMIN ' +
            'FROM TUC_UBICACIONCARPETAS ' +
           'WHERE UC_USUARIO = :Usuario';
  qry := GetQueryEx(sSql, [Sesion.UserId]);

  with qry do
    begin
      lblStatus.Caption := 'Validando Archivo...';
      try
        if not Eof then
          begin
            i        := 0;
            iErrores := 0;

            with jvpgProgreso do
              begin
                Min := 1;
                Max := RecordCount;
              end;

            while not Eof do
              begin
                Inc(i);
                jvpgProgreso.Position := i;

                DoValidarRegistro(qry, iErrores);

                edCantReg.Value     := i;
                edCantErrores.Value := iErrores;

                if ((i-1) Mod CANTREGACT) = 0 then
                  Application.ProcessMessages;

                Next;
              end;

            jvpgProgreso.Position := 0;
            Application.ProcessMessages;

            Result := (iErrores = 0);
          end;
      finally
        Free;
        lblStatus.Caption := '';
        Application.ProcessMessages;
      end;
    end;
end;

procedure TfrmCargaUbicCarpetasAdmin.DoValidarRegistro(qry: TSDQuery; var Errores: Integer);
var
  sErrores, sClave, sCodArchivo, sUbicCarpeta: String;
  Id, IdArchivo, IdTipoArchivo: TTableId;
begin
  sErrores := '';

  with qry do
    begin
      Id           := FieldByName('ID').AsInteger;
      sCodArchivo  := FieldByName('CODARCHIVO').AsString;
      sClave       := FieldByName('CLAVE').AsString;
      sUbicCarpeta := FieldByName('CODUBICACION_ADMIN').AsString;
    end;

  IdTipoArchivo := Get_IdTipoArchivoCodigo(sCodArchivo);

  if IdTipoArchivo = ART_EMPTY_ID then
    sErrores := sErrores + 'Código de tipo de archivo inexistente.' + ' // '
  else
    begin
      IdArchivo := GetIdArchivo(IdTipoArchivo, sClave);

      if IdArchivo = ART_EMPTY_ID then
        sErrores := sErrores + 'La clave no existe.' + ' // '
      else if Get_TipoUbicacionArchivo(IdArchivo) <> TIPOUBICACION_GUARDA then
        sErrores := sErrores + 'La carpeta no se encuentra en la administradora.' + ' // ';
    end;

  if IsEmptyString(sUbicCarpeta) then
    sErrores := sErrores + 'Código de ubicación de carpeta vacío.' + ' // ';

  if not IsEmptyString(sErrores) then
    begin
      sErrores := CutRight(sErrores, 4);

      DoCargarError(Id, sErrores, Errores);
    end;
end;

procedure TfrmCargaUbicCarpetasAdmin.DoCargarError(Id: TTableId; DescrError: String; var Errores: Integer);
var
  sSql: String;
begin
  sSql := 'UPDATE TUC_UBICACIONCARPETAS ' +
             'SET UC_ERRORES = :Errores ' +
           'WHERE UC_ID = :Id';
  EjecutarSqlEx(sSql, [DescrError, Id]);

  Inc(Errores);
end;

function TfrmCargaUbicCarpetasAdmin.DoGuardarUbicaciones(Original: Boolean): Boolean;
var
  sSql: String;
begin
  lblStatus.Caption := 'Actualizando Base de Datos...';
  Application.ProcessMessages;
  try
    sSql := 'INSERT INTO RUB_ARCHIVOUBICACION(UB_ID, UB_IDARCHIVO, UB_CODUBICACION_ADMIN, UB_USUALTA, UB_FECHAALTA) ' +
                 'SELECT SEQ_RUB_ID.NEXTVAL, AR_ID, TRIM(UC_CODUBICACION_ADMIN), UC_USUARIO, SYSDATE ' +
                   'FROM RTA_TIPOARCHIVO, RAR_ARCHIVO, TUC_UBICACIONCARPETAS ' +
                  'WHERE UC_USUARIO = :Usuario ' +
                    'AND UC_CODARCHIVO = TA_CODIGO ' +
                    'AND TA_ID = AR_TIPO ' +
                    'AND UC_CLAVE = AR_CLAVE ' +
                    'AND NOT EXISTS (SELECT 1 ' +
                                      'FROM RUB_ARCHIVOUBICACION ' +
                                     'WHERE UB_IDARCHIVO = AR_ID ' +
                                       'AND UB_CODUBICACION_ADMIN = TRIM(UC_CODUBICACION_ADMIN))';
    EjecutarSqlEx(sSql, [Sesion.UserId]);

    if Original then
      begin
        sSql := 'DELETE FROM TUC_UBICACIONCARPETAS';
        EjecutarSql(sSql);
      end;  

    Result := True;
  finally
    lblStatus.Caption := '';
    Application.ProcessMessages;
  end;
end;

procedure TfrmCargaUbicCarpetasAdmin.DoLimpiarDatos;
begin
  edCantReg.Value       := 0;
  edCantErrores.Value   := 0;
  jvpgProgreso.Position := 0;
end;

procedure TfrmCargaUbicCarpetasAdmin.DoLimpiarUbicaciones;
var
  sSql: String;
begin
  sSql := 'DELETE FROM ARCHIVO.RUB_ARCHIVOUBICACION';
  EjecutarSql(sSql);
end;

procedure TfrmCargaUbicCarpetasAdmin.DoEnviarMailAviso(ArchivoValido: Boolean; CantReg, CantErrores: Integer);
var
  sCuerpo: String;
begin
  if GetPerfilGuardaYDigitalizacion then
    begin
      sCuerpo := 'Informamos que la administradora ha utilizado la opción: Carga de Ubicación de Carpetas en Administradora.' + CRLF +
                 Iif(ArchivoValido, 'No se han encontrado errores, de modo que los registros procesados fueron asociados a las carpetas correspondientes.',
                                    'Se han encontrado errores, de modo que solo se han guardado en el sistema los registros erróneos para su consulta.')  + CRLF +
                 '  Cant. Registros Procesados: ' + Trim(IntToStr(CantReg)) + CRLF +
                 Iif(ArchivoValido, '',
                                    '  Cant. Registros sin Errores: ' + Trim(IntToStr(CantReg-CantErrores)) + CRLF +
                                    '  Cant. Registros con Errores: ' + Trim(IntToStr(CantErrores)) + CRLF +
                                    'Verifique por favor el resultado del proceso desde la pantalla de Consultas: Errores de Carga de Ubicación de Carpetas. Tenga en cuenta que ' +
                                    'desde esta pantalla solo se mostrarán los errores encontrados en el último archivo procesado.' + CRLF) + CRLF +
                 'Muchas Gracias.' + CRLF;

      VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
          get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

      SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
         Sesion.UserId, '[Procesos Administradora] Carga de Ubicación de Carpetas', '',
         sCuerpo, False, False, False, Sesion.UserId, True);
    end;
end;

function TfrmCargaUbicCarpetasAdmin.DoVerificarRepetidos: Boolean;
var
  sSql: String;
begin
  lblStatus.Caption := 'Verificando Duplicados...';
  Application.ProcessMessages;
  try
    sSql := 'SELECT 1 ' +
              'FROM TUC_UBICACIONCARPETAS ' +
             'WHERE UC_USUARIO = :Usuario ' +
             'GROUP BY UC_CODARCHIVO, UC_CLAVE, UC_CODUBICACION_ADMIN ' +
            'HAVING COUNT(*) > 1';

    Result := ExisteSqlEx(sSql, [Sesion.UserID]);
  finally
    lblStatus.Caption := '';
    Application.ProcessMessages;
  end;
end;

end.

