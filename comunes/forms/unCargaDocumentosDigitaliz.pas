unit unCargaDocumentosDigitaliz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unArtFrame,
  unFraFiltroArchivo, StdCtrls, unConstantArchivo, AdvGlowButton,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, ExtCtrls,
  IntEdit, Mask, PatternEdit, unArt, RxPlacemnt;

type
  TfrmCargaDocumentosDigitaliz = class(TfrmCustomForm)
    fraFiltroArchivoDigit: TfraFiltroArchivo;
    odDigit: TOpenDialog;
    advgbGuardar: TAdvGlowButton;
    lblDocumento: TLabel;
    fraTipoDocumentoDigit: TfraCodDesc;
    TimerPermiso: TTimer;
    edObservacionesDigit: TMemo;
    Label1: TLabel;
    lblCodigoDocumento: TLabel;
    edDocumentoDigit: TPatternEdit;
    Label2: TLabel;
    edLegajoDigit: TIntEdit;
    Label3: TLabel;
    edHojaDigit: TIntEdit;
    Label5: TLabel;
    edLoteDigit: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure advgbGuardarClick(Sender: TObject);
    procedure fraTipoArchivoPropiedadesChange(Sender: TObject);
    procedure TimerPermisoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function Validar(PreguntarExisteCarpeta: Boolean; var rarId: TTableId): Boolean;
    function DoGuardarEnRepositorio(Archivo: String; rarId: TTableId; MostrarMensaje, ConTrans: Boolean; var RutaCompletaArchivos: String): boolean;
  public
    class function GetRutaCompletaArchivos: string;
    class function DoCargarDocumentosDigitalizados(TipoArchivo: TTableId; Subclave1, Subclave2, Subclave3, Subclave4, CodDocumento, Archivo: String; NroCartaDocumento: String = ''; MostrarMensaje: Boolean = True; ConTrans: Boolean = False): Boolean;
  end;

var
  frmCargaDocumentosDigitaliz: TfrmCargaDocumentosDigitaliz;

implementation

{$R *.dfm}

uses
  CustomDlgs, StrFuncs, unDmPrincipal, AnsiSql, unDigitalizacion, unExportPDF,
  ArchFuncs, General, unImageFunctions, unUtilsArchivo, VCLExtra, unComunesArchivo,
  unSiniestros, unTesoreria, unArchivo, unMensajeAlertaAGA, unEsperaSimple;

var
  sRutaCompletaArchivos: string;

procedure TfrmCargaDocumentosDigitaliz.FormCreate(Sender: TObject);
begin
  inherited;

  with odDigit do
    begin
      Title  := 'Seleccione el archivo a cargar';
      Filter := 'Archivo Adobe PDF|*.pdf|Archivo de imágenes TIFF|*.tif';
    end;

  {$IFNDEF ADMGRALARCHIVO}
  DoIniciarCarpetasEnTransitoUsu;
  {$ENDIF}
end;

procedure TfrmCargaDocumentosDigitaliz.FormShow(Sender: TObject);
begin
  inherited;

  fraTipoArchivoPropiedadesChange(nil);
end;

function TfrmCargaDocumentosDigitaliz.Validar(PreguntarExisteCarpeta: Boolean; var rarId: TTableId): Boolean;
var
  bConLote: Boolean;
begin
  Verificar(not fraFiltroArchivoDigit.IsCompleted, fraFiltroArchivoDigit, 'Debe completar los datos del tipo de archivo y clave.');
  Verificar(not fraFiltroArchivoDigit.Exists, fraFiltroArchivoDigit, 'La clave indicada no existe.');
  Verificar(not fraTipoDocumentoDigit.IsSelected, fraTipoDocumentoDigit, 'Debe seleccionar un documento.');

  if not VerificarClaveExiste(fraFiltroArchivoDigit.Tipo, fraFiltroArchivoDigit.Clave, rarId) then
    begin
      if not PreguntarExisteCarpeta or (MsgBox('No existe la carpeta indicada ¿Desea crearla?', MB_ICONQUESTION+MB_YESNO) = ID_YES) then
        rarId := DoInsertArchivo(fraFiltroArchivoDigit.Tipo, TIPOUBICACION_GUARDA, '', 0, '', '', fraFiltroArchivoDigit.Clave)
      else
        Abort;
    end;

  Verificar(not IsEmptyString(edDocumentoDigit.Text) and fraFiltroArchivoDigit.IsSelected and not fraFiltroArchivoDigit.IsTipoCartaDocumento, edDocumentoDigit, 'El nro. de documento es solo para las distintas variaciones de Cartas Documento.');
  Verificar(IsEmptyString(edDocumentoDigit.Text) and fraFiltroArchivoDigit.IsSelected and fraFiltroArchivoDigit.IsTipoCartaDocumento, edDocumentoDigit, 'Debe indicar el nro. de documento.');
  if fraFiltroArchivoDigit.IsSelected then
    fraFiltroArchivoDigit.IsCartaDocumentoValida(edDocumentoDigit.Text, edDocumentoDigit);

  Verificar(not edLegajoDigit.IsEmpty and fraFiltroArchivoDigit.IsSelected and not fraFiltroArchivoDigit.IsTipoArchivoCuentasPagarViaticos, edLegajoDigit, 'El nro. de legajo es solo para Cuentas a Pagar (Viáticos).');
  Verificar(not edLegajoDigit.IsEmpty and (edLegajoDigit.Value <= 0), edLegajoDigit, 'El nro. de legajo debe ser mayor a 0.');
  Verificar(not edLegajoDigit.IsEmpty and not Is_ExisteLegajo(edLegajoDigit.Value), edLegajoDigit, 'El nro. de legajo no existe.');
  Verificar(edLegajoDigit.IsEmpty and fraFiltroArchivoDigit.IsSelected and fraFiltroArchivoDigit.IsTipoArchivoCuentasPagarViaticos, edLegajoDigit, 'Debe indicar el nro. de legajo.');

  Verificar(not edHojaDigit.IsEmpty and fraFiltroArchivoDigit.IsSelected and not fraFiltroArchivoDigit.IsTipoArchivoExtractosBancarios, edHojaDigit, 'El nro. de hoja es solo para los Extractos Bancarios.');
  Verificar(not edHojaDigit.IsEmpty and (edHojaDigit.Value <= 0), edHojaDigit, 'El nro. de hoja debe ser mayor a 0.');
  Verificar(edHojaDigit.IsEmpty and fraFiltroArchivoDigit.IsSelected and fraFiltroArchivoDigit.IsTipoArchivoExtractosBancarios, edHojaDigit, 'Debe indicar el nro. de hoja.');

  bConLote := not edLoteDigit.IsEmpty and (edLoteDigit.Value <> 0);
  Verificar(bConLote and not (GetPerfilAdministrador() or GetPerfilGuardaYDigitalizacion()), edLoteDigit, 'Solo la Administradora y GyD pueden ingresar el nro. de lote.');
  Verificar(bConLote and not Is_ExisteLote(edLoteDigit.Value), edLoteDigit, 'El lote no existe.');
  Verificar(bConLote and not Is_ExisteLoteEnTipoArchivo(edLoteDigit.Value, fraFiltroArchivoDigit.Tipo), edLoteDigit, 'El lote seleccionado no corresponde al tipo de archivo.');
  Verificar(bConLote and not Is_ExisteClaveArchivoCodDoc_EnLote(fraFiltroArchivoDigit.IdTipoArchivo, fraFiltroArchivoDigit.Clave, edLoteDigit.Value, fraTipoDocumentoDigit.Codigo), edLoteDigit, 'No existe un detalle de contenido para el tipo de archivo, carpeta, código de documento y lote indicado.');

  Result := True;
end;

function TfrmCargaDocumentosDigitaliz.DoGuardarEnRepositorio(Archivo: String; rarId: TTableId; MostrarMensaje, ConTrans: Boolean; var RutaCompletaArchivos: String): Boolean;
var
  sPathCompletoArchConvertido, sPathDestCompleto, sArchivoDestCompleto, sExt, sArchivoPathCompleto: String;
  sNroCartaDoc, sArchivoPathCompletoConv, sArchConvertido: String;
  bConversionOk, bCopiaOk: Boolean;
  i, iCantArchivos: Integer;
  IdSecuenciaTraz: Integer;
begin
  Result := False;

  RutaCompletaArchivos := '';
  sArchivoPathCompleto := Archivo;
  sExt                 := UpperCase(StrReplace(ExtractFileExt(Archivo), '.', ''));

  try
    IniciarEspera('Convirtiendo archivo al formato indicado...');
    try
      if fraFiltroArchivoDigit.IsCartaDocumento then
        sNroCartaDoc := fraFiltroArchivoDigit.Clave
      else if fraFiltroArchivoDigit.IsTipoCartaDocumento then
        sNroCartaDoc := edDocumentoDigit.Text
      else
        sNroCartaDoc := '';

      sPathCompletoArchConvertido := TempPath;
      sArchConvertido             := '';

      iCantArchivos := GetImageFromPDF(sArchivoPathCompleto, sPathCompletoArchConvertido, sArchConvertido, False);
      bConversionOk := (iCantArchivos > 0);
      sArchivoPathCompletoConv := IncludeTrailingBackslash(sPathCompletoArchConvertido) + ChangeFileExt(ExtractFileName(Archivo), TIF_EXTENSION);
    finally
      DetenerEspera;
    end;

    if bConversionOk then
      begin
        IniciarEspera('Guardando la información...');
        try
          if not ConTrans then
            BeginTrans(True);


          if edLoteDigit.IsEmpty or (edLoteDigit.Value = 0) then
            DoInsertDetalleArchivo(IdSecuenciaTraz, rarId, fraTipoDocumentoDigit.VariantValue, 0, OPCION_DESTINO_DIGITUSUARIO,
                                   iCantArchivos, GetObservacionesDocumentoCarpeta(dcImagen), sNroCartaDoc, '',
                                   0, '', False);

          for i := 1 to iCantArchivos do
            begin
              sArchivoPathCompleto := GetFormatoMultiTIFF(i, sArchivoPathCompletoConv);
              bCopiaOk := DoCopiarArchivoDigitalizacion(fraFiltroArchivoDigit.Tipo, dcImagen, sArchivoPathCompleto, sArchivoDestCompleto, sPathDestCompleto, False, True, True);

              if bCopiaOk then
              begin
                DoInsertRepositorioArchivo(dcImagen, fraFiltroArchivoDigit.Tipo, fraFiltroArchivoDigit.Clave, fraTipoDocumentoDigit.VariantValue, sPathDestCompleto, sArchivoDestCompleto, False, 0, edLoteDigit.Value, 0, Trim(edObservacionesDigit.Lines.Text), '', 0, '', 0, sNroCartaDoc, edHojaDigit.Value, edLegajoDigit.Value, '', '', 0, '', IdSecuenciaTraz);
                RutaCompletaArchivos := RutaCompletaArchivos + sPathDestCompleto + sArchivoDestCompleto + ',';
              end
              else
                Raise Exception.Create('Error al copiar el archivo de digitalización.');
            end;

          if not ConTrans then
            CommitTrans(True);
          Application.ProcessMessages;
        finally
          DetenerEspera;
        end;

        if MostrarMensaje then
          MsgBox('La indexación de imágenes ha finalizado correctamente.', MB_ICONINFORMATION);

        Result := True;
      end
    else
      raise Exception.Create('No se pudo convertir el archivo al formato deseado.');
  except
    on E: Exception do
      begin
        if not ConTrans then
          RollBack(True);
        MsgBox('Ocurrió un error al indexar la imagen.' + CRLF + E.Message);
      end;
  end;
end;

procedure TfrmCargaDocumentosDigitaliz.advgbGuardarClick(Sender: TObject);
var
  rarId: TTableId;
begin
  if Validar(True, rarId) then
    with odDigit do
      if Execute then
        DoGuardarEnRepositorio(FileName, rarId, True, False, sRutaCompletaArchivos);
end;

procedure TfrmCargaDocumentosDigitaliz.fraTipoArchivoPropiedadesChange(Sender: TObject);
begin
  with fraTipoDocumentoDigit.Propiedades do
    begin
      fraTipoDocumentoDigit.Clear;

      if fraFiltroArchivoDigit.IsSelected then
        ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                         'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                        'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(fraFiltroArchivoDigit.Tipo) + ' ' +
                                          'AND AD_FECHABAJA IS NULL ' +
                                          'AND AD_IDTIPODOCUMENTO = TD_ID) ' +
                           'AND TD_CODIGO <> ' + SqlValue(CODDOC_LOTE)
      else
        ExtraCondition := ' AND 1 = 2';

      ShowBajas := False;
    end;

  fraFiltroArchivoDigit.OnArchivoChange(Sender);
end;

procedure TfrmCargaDocumentosDigitaliz.TimerPermisoTimer(Sender: TObject);
begin
  TimerPermiso.Enabled := False;
  if not GetTienePerfil then
    begin
      MsgBox('No posee perfil de usuario de archivo para operar con esta opción.', MB_ICONSTOP);
      Close;
    end;
end;

class function TfrmCargaDocumentosDigitaliz.DoCargarDocumentosDigitalizados(TipoArchivo: TTableId; Subclave1, Subclave2, Subclave3, Subclave4, CodDocumento, Archivo: String; NroCartaDocumento: String = ''; MostrarMensaje: Boolean = True; ConTrans: Boolean = False): Boolean;
var
  rarId: TTableId;
  iCantCampos: Integer;
  sClave: String;
begin
  Result := False;

  iCantCampos := GetCantCamposBusquedaTipoArchivo(TipoArchivo);
  sClave      := GetClaveArmada(iCantCampos, Subclave1, Subclave2, Subclave3, Subclave4);

  with TfrmCargaDocumentosDigitaliz.Create(nil) do
    try
      Show;
      with fraFiltroArchivoDigit do
        begin
          Tipo := TipoArchivo;
          fraTipoArchivoPropiedadesChange(nil);
          DoCargarClaveArchivo(TipoArchivo, sClave);

          fraTipoDocumentoDigit.Codigo := CodDocumento;
          edDocumentoDigit.Text        := NroCartaDocumento;
        end;

        if Validar(False, rarId) then
          Result := DoGuardarEnRepositorio(Archivo, rarId, MostrarMensaje, ConTrans, sRutaCompletaArchivos);
    finally
      Free;
    end;
end;

procedure TfrmCargaDocumentosDigitaliz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$IFNDEF ADMGRALARCHIVO}
  DoSuspenderCarpetasEnTransitoUsu;
  {$ENDIF}
end;

class function TfrmCargaDocumentosDigitaliz.GetRutaCompletaArchivos: string;
begin
  Result := sRutaCompletaArchivos;
end;

end.

