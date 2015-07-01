unit unMigracionBANK;

interface
                     
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, DB, SDEngine,
  unArtFrame, unFraFiltroArchivo, ComCtrls, JvExComCtrls, JvProgressBar,
  Mask, PatternEdit, IntEdit, ExtCtrls, JvExExtCtrls, JvImage;

type
  TfrmMigracionBANK = class(TfrmCustomForm)
    sdqTablasBank: TSDQuery;
    btnMigrar: TButton;
    btnCancelar: TButton;
    fraFiltroArchivoMigrac: TfraFiltroArchivo;
    JvProgressBarMigrac: TJvProgressBar;
    Label1: TLabel;
    edTabla: TEdit;
    Label2: TLabel;
    edTipoArchivo: TEdit;
    edCantReg: TIntEdit;
    Label3: TLabel;
    Label4: TLabel;
    edProcesados: TIntEdit;
    Label5: TLabel;
    edOK: TIntEdit;
    Label6: TLabel;
    edOKClaveInv: TIntEdit;
    Label7: TLabel;
    edNoMigrados: TIntEdit;
    rgMigrar: TRadioGroup;
    edNroPasada: TIntEdit;
    Label8: TLabel;
    tmInicio: TTimer;
    procedure btnMigrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgMigrarClick(Sender: TObject);
    procedure tmInicioTimer(Sender: TObject);
  private
    pbTerminar: Boolean;
    FReiniciarMigracion: Boolean;
    FInicioAutomatico:boolean;
    function Migrar(ExisteClave: Boolean; Carpeta, Imagen: String; var Migrado: String; var OK, OKClaveInv, NoMigrados: Integer): Boolean;
    function DoTransformarClave(TipoArchivo, CantCampos: Integer; Clave: String): String; overload;
    function DoTransformarClave(TipoArchivo, CantCampos: Integer; Clave, SubClave1, SubClave2, SubClave3, SubClave4: String): String; overload;
    procedure Limpiar;
    function IsCartaDocValida(NroCartaDoc, TipoSalida: String): Boolean;
    function DoVerificarMemoriaLibre: Boolean;
  public
  property
    ReiniciarMigracion: Boolean     read FReiniciarMigracion     write FReiniciarMigracion;
  end;                  

function DoMigracionBank(InicioAutomatico: Boolean): Boolean;

var
  frmMigracionBANK: TfrmMigracionBANK;

implementation

uses
  CustomDlgs, StrFuncs, unDmPrincipal, AnsiSql, unDigitalizacion, unArt, 
  ArchFuncs, General, unUtilsArchivo, VCLExtra, unComunesArchivo, unArchivo,
  unConstantArchivo, Imaging, ImagingTypes, unImageFunctions, unSesion;

{$R *.dfm}

function DoMigracionBank(InicioAutomatico: Boolean): Boolean;
begin
  Result := True;

  frmMigracionBANK := TfrmMigracionBANK.Create(nil);
  with frmMigracionBANK do
    try
      FInicioAutomatico := InicioAutomatico;
      if InicioAutomatico then
        tmInicio.Enabled := True;

      if ShowModal = mrRetry then
        begin
          Result := False;
          ReiniciarMigracion := True;
        end;
    finally
      Free;
    end;
end;

procedure TfrmMigracionBANK.btnMigrarClick(Sender: TObject);
var
  sRowId, sTablaBank, sClave, sCodDocumento, sImagen, sCarpeta, sSqlTabla: String;
  sClaveAnt, sSqlUpdateMigrado, sMigrado, sSqlUpdate, sClaveVirtual: String;
  sTipoSalida, sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
  sNroCartaDoc, sSql, sSqlTablasBankAnt, sSqlTablasBank, sObservaciones: String;
  sPathImagen, sChequeGT, sLoteEnvioDoc, sError, sNroOperGT, sBeneficiarioGT: String;
  rarId, rraId, IdTipoDocuLoteEnvioDocum, IdTipoDocumento, TipoArchivo: TTableId;
  iLegajo, iNroHoja, iTipoArchivo, i, iCantCampos, iCD, iLote, iCaja: Integer;
  iOK, iOKClaveInv, iNoMigrados: Integer;
  dFechaOperGT, FechaAlta: TDateTime;
  bTipoCartaComercial, bTipoCartaDocumento, bPorTipoArchivo, bExisteClave: Boolean;
  pbReiniciar, bMigracionMasiva: Boolean;
  a:real;
const
  CANTREGCOMMIT = 100;
  CANTREGSTEP   = CANTREGCOMMIT * 10;
  PROCESO       = 'MIGRACION_BANK';
begin
  Verificar(((rgMigrar.ItemIndex = 0) or (rgMigrar.ItemIndex = 1)) and not fraFiltroArchivoMigrac.IsSelected, fraFiltroArchivoMigrac, 'Indicar un tipo de archivo.');
  Verificar((rgMigrar.ItemIndex = -1) and fraFiltroArchivoMigrac.IsSelected, rgMigrar, 'Indicar qué migrar.');
  Verificar((rgMigrar.ItemIndex = 2) and (edNroPasada.Value <= 1), edNroPasada, 'Indicar nro. de pasada. (mayor o igual a 2)');
  Verificar((rgMigrar.ItemIndex = 2) and fraFiltroArchivoMigrac.IsSelected, fraFiltroArchivoMigrac, 'No debe indicar un tipo de archivo.');

  bMigracionMasiva := (rgMigrar.ItemIndex = -1);

  VCLExtra.LockControls([fraFiltroArchivoMigrac.fraTipoArchivo, fraFiltroArchivoMigrac.btnCargarCodigoBarras, btnMigrar, rgMigrar]);
  sSqlTablasBankAnt := sdqTablasBank.Sql.Text;
  try
    sSql := 'DELETE FROM CTC_TABLACONTROL ' +
             'WHERE TC_PROCESO = :Proceso';
    EjecutarSqlEx(sSql, [PROCESO]);

    sSql :=
      'DECLARE ' +
      '  Dummy   VARCHAR2(50); ' +
      'BEGIN ' +
      '  ART.DEBUG.INIT(:ControlName, Dummy, 1, ' + SqlValue(SECTOR_DOCUMENTACION) + '); ' +
      'END;';
    EjecutarStoreEx(sSql, [PROCESO]);

    pbReiniciar              := False;
    ReiniciarMigracion       := False;
    pbTerminar               := False;
    bPorTipoArchivo          := fraFiltroArchivoMigrac.IsSelected;
    iTipoArchivo             := fraFiltroArchivoMigrac.Tipo;
    IdTipoDocuLoteEnvioDocum := Get_IdTipoDocumentoLoteEnvioDocumentacion();

    sSqlTablasBank := sSqlTablasBankAnt;

    case rgMigrar.ItemIndex of
      0: sSqlTablasBank := sSqlTablasBank + ' AND IDTIPOARCHIVO = ' + SqlValue(iTipoArchivo) + ' AND ORDENPASADA = 1';
      1: sSqlTablasBank := sSqlTablasBank + ' AND ((IDTIPOARCHIVO >= ' + SqlValue(iTipoArchivo) + ' AND ORDENPASADA = 1) OR (ORDENPASADA > 1))';
      2: sSqlTablasBank := sSqlTablasBank + ' AND ORDENPASADA >= ' + SqlValue(edNroPasada.Value);
    end;

    sSqlTablasBank := sSqlTablasBank + ' ORDER BY ORDENPASADA, TO_NUMBER(IDTIPOARCHIVO)';
    OpenQuery(sdqTablasBank, sSqlTablasBank);

    with sdqTablasBank do
      while not Eof do
        begin
          if pbTerminar then
            Break;

          sSqlTabla := 'SELECT * FROM (' +
                        FieldByName('STRSQL').AsString +
//                  ' AND migrado = ''IMAGEN INEXISTENTE'' ' +
//                  ' AND migrado = ''S (CLAVE INEXIST.)'' ' +
                  ' AND migrado = ''N'' ' +
                                     ') ';

          // **** ESTE ORDER BY VOLVER A PONERLO ********** //
          //if UpperCase(sdqTablasBank.FieldByName('TABLABANK').AsString) <> 'BANK.SCANFOLD' then
          //  sSqlTabla := sSqlTabla + ' ORDER BY cd, carpeta, imagen';

          sSql := 'ART.DEBUG.STEP(:Proceso, :Estado);';
          EjecutarStoreEx(sSql, [PROCESO, 'Ejecutando consulta selección de registros']);

          with GetQuery(sSqlTabla) do
            try
              BeginTrans(True);
              try
                if not Eof then
                  begin
                    Limpiar;

                    TipoArchivo     := FieldByName('tipoarchivo').AsInteger;
                    sTablaBank      := FieldByName('tablabank').AsString;
                    edCantReg.Value := ValorSqlInteger('SELECT COUNT(*) FROM (' + sSqlTabla + ')');

                    bTipoCartaDocumento := (TipoCartaDocumento(TipoArchivo) or (TipoArchivo = ID_CARPETA_CD));
                    bTipoCartaComercial := (TipoArchivo = ID_CARPETA_CC_COBR);

                    if bTipoCartaDocumento then
                      sTipoSalida := 'C'
                    else if bTipoCartaComercial then
                      sTipoSalida := 'CC'
                    else
                      sTipoSalida := 'C';

                    fraFiltroArchivoMigrac.Tipo := TipoArchivo;
                    iCantCampos   := GetCantCamposBusquedaTipoArchivo(TipoArchivo);
                    sClaveVirtual := GetClaveArmada(iCantCampos, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL);

                    i   := 0;
                    iOK := 0;
                    iOKClaveInv := 0;
                    iNoMigrados := 0;

                    with JvProgressBarMigrac do
                      begin
                        Min := 1;
                        Max := edCantReg.Value;
                      end;

                    edTabla.Text       := sTablaBank;
                    edTipoArchivo.Text := IntToStr(TipoArchivo);

                    while not Eof do
                      begin
                        if pbTerminar then
                          Break;

                        Inc(i);
                        JvProgressBarMigrac.Position := i;

                        if ((i-1) Mod CANTREGCOMMIT) = 0 then
                          begin
                            CommitTrans(True);

                            if ((i-1) Mod CANTREGSTEP) = 0 then
                              begin
                                sSql := 'ART.DEBUG.STEP(:Proceso, :Estado);';
                                EjecutarStoreEx(sSql, [PROCESO, sTablaBank + ' (' + IntToStr(TipoArchivo) + ') - Reg.: ' + IntToStr(i)]);

                                if not DoVerificarMemoriaLibre() and bMigracionMasiva then
                                  begin
                                    pbTerminar  := True;
                                    pbReiniciar := True;
                                  end;
                              end;

                            BeginTrans(True);

                            DoEmptyWorkingSetCurrentProcess();
                            Application.ProcessMessages;
                          end;

                        sCodDocumento := FieldByName('coddocumento').AsString;
                        iLote         := FieldByName('lote').AsInteger;
                        iCD           := FieldByName('cd').AsInteger;
                        iCaja         := FieldByName('caja').AsInteger;
                        sClave        := FieldByName('clave').AsString;
                        FechaAlta     := FieldByName('fechaalta').AsDateTime;
                        sObservaciones:= FieldByName('observac').AsString;
                        sLoteEnvioDoc := FieldByName('loteenviodoc').AsString;

                        iNroHoja      := FieldByName('nrohoja').AsInteger;
                        if iNroHoja < 0 then
                          iNroHoja := 0;

//if not FInicioAutomatico then
//  a := 5/0;iNroHoja:=iNroHoja+trunc(a);

                        iLegajo       := FieldByName('legajo').AsInteger;
                        if iLegajo < 0 then
                          iLegajo := 0;

                        sRowId          := FieldByName('RID').AsString;
                        sNroOperGT      := FieldByName('nroopergt').AsString;
                        sBeneficiarioGT := FieldByName('beneficiargt').AsString;
                        dFechaOperGT    := FieldByName('fechagt').AsDateTime;
                        sChequeGT       := FieldByName('chequegt').AsString;

                        sNroCartaDoc  := FieldByName('nrocartadoc').AsString;
                        if not IsEmptyString(sNroCartaDoc) then
                          begin
                            if not IsCartaDocValida(sNroCartaDoc, sTipoSalida) then
                              sNroCartaDoc := '';
                          end;

                        sCarpeta      := FieldByName('carpeta').AsString;
                        sCarpeta      := UpperCase(Trim(ExcludeTrailingPathDelimiter(sCarpeta)));
                        sImagen       := FieldByName('imagen').AsString;
                        sImagen       := UpperCase(Trim(sImagen));
                        sPathImagen   := IncludeTrailingPathDelimiter(sCarpeta) + sImagen;

                        sSql := 'SELECT 1 '  +
                                  'FROM ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
                                 'WHERE RA_ARCHIVO = :Archivo ' +
                                   'AND RA_PATHARCHIVO = :Path ' +
                                   'AND RA_FECHABAJA IS NULL ' +
                                   'AND RA_NROMEDIO = :CD';
                        if not ExisteSqlEx(sSql, [sImagen, sCarpeta, iCD]) and FileExists(sPathImagen) then
                          begin
                            IdTipoDocumento := ValorSqlIntegerEx('SELECT ART.ARCHIVO.GET_IDCODDOCUMENTO(:tipoarchivo, :coddocumento) FROM DUAL',
                                                                 [TipoArchivo, sCodDocumento], ART_EMPTY_ID);
                            if IdTipoDocumento <> ART_EMPTY_ID then
                              sCodDocumento := '';

                            GetSubClaves(sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

                            if (sLoteEnvioDoc = '999') and (TipoArchivo <> 25) then  // lote de envío de documentación
                              begin
                                bExisteClave    := False;
                                sClaveAnt       := sClave;
                                sClave          := sClaveVirtual;

                                if IdTipoDocumento <> ART_EMPTY_ID then
                                  sCodDocumento := Get_CodDocumento(IdTipoDocumento);

                                if not IsEmptyString(sCodDocumento) then
                                  sObservaciones  := sObservaciones + Iif(IsEmptyString(sObservaciones), '', ' // ') + 'Cód. Doc.: ' + sCodDocumento;

                                IdTipoDocumento := IdTipoDocuLoteEnvioDocum;
                                sCodDocumento   := ''
                              end
                            else
                              begin
                                sClave := DoTransformarClave(TipoArchivo, iCantCampos, sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

                                if (TipoArchivo = ID_CARPETA_ML_GRAL) or (TipoArchivo = ID_CARPETA_CONSTRUCC) then   // segun PMarrone, se migra todo de med. lab., ya que hay mucha info que no la han cargado en la tablas del sistema de hys...Y para construcciones, PMarrone me dijo tambien de no validar nada...
                                  begin
                                    bExisteClave := True;
                                    sClaveAnt    := '';
                                  end
                                else
                                  begin
                                    bExisteClave := IsExisteClave(fraFiltroArchivoMigrac, TipoArchivo, sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

                                    if bExisteClave then
                                      sClaveAnt := ''
                                    else
                                      begin
                                        sClaveAnt := sClave;
                                        sClave    := sClaveVirtual;
                                      end;
                                  end;
                              end;

                            if Migrar(bExisteClave, sCarpeta, sImagen, sMigrado, iOK, iOKClaveInv, iNoMigrados) then
                              DoInsertRepositorioArchivo(dcMigracionBank, TipoArchivo, sClave,
                                                         IdTipoDocumento, sCarpeta, sImagen, False,
                                                         iCD, iLote, 0, sObservaciones, sCodDocumento, FechaAlta,
                                                         sClaveAnt, iCaja, sNroCartaDoc, iNroHoja, iLegajo, sNroOperGT,
                                                         sBeneficiarioGT, dFechaOperGT, sChequeGT);

                            sSqlUpdate := 'UPDATE ' + sTablaBank + ' ' +
                                             'SET MIGRADO = :Migrado ' +
                                           'WHERE ROWID = :RId';
                            EjecutarSqlSTEx(sSqlUpdate, [sMigrado, sRowId]);

                            edProcesados.Value := i;
                            edOK.Value         := iOK;
                            edOKClaveInv.Value := iOKClaveInv;
                            edNoMigrados.Value := iNoMigrados;
                          end
                        else
                          begin  // todo esto que sigue lo hice el 07/02/12 por el tema de los que figuran como migrado = 'S (CLAVE INEXIST.)', pero en la tabla correspondiente (por ej, sex_expedientes) extrañamente la clave sí existe
                                 // se debe usar solo cuando: ' AND migrado = ''S (CLAVE INEXIST.)'' '...al principio del proceso
                            // sMigrado := 'S (CLAVE INEXIST.)1';  esto es por si quiero marcar los ya procesados y poder retomar el proceso por si se corta
                            if false then  // si voy a utilizar esto, sacar esta linea y dejar la de abajo
                            //if not ((sLoteEnvioDoc = '999') and (TipoArchivo <> 25)) and not ((TipoArchivo = ID_CARPETA_ML_GRAL) or (TipoArchivo = ID_CARPETA_CONSTRUCC)) then  // si no es lote de envío de documentación, ni son los tipos de arch. que no se valida si existe la clave
                              begin
                                GetSubClaves(sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);
                                sClave := DoTransformarClave(TipoArchivo, iCantCampos, sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

                                sSql := 'SELECT RA_ID '  +              // verifico que la imagen esté en la carpeta virtual
                                          'FROM ARCHIVO.RAR_ARCHIVO, ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
                                         'WHERE RA_ARCHIVO = :Archivo ' +
                                           'AND RA_PATHARCHIVO = :Path ' +
                                           'AND RA_FECHABAJA IS NULL ' +
                                           'AND RA_NROMEDIO = :CD ' +
                                           'AND RA_IDARCHIVO = AR_ID ' +
                                           'AND '''' || AR_CLAVE = :Clave';
                                rraId := ValorSqlIntegerEx(sSql, [sImagen, sCarpeta, iCD, sClaveVirtual]);

                                if (rraId > 0) and FileExists(sPathImagen) and
                                   IsExisteClave(fraFiltroArchivoMigrac, TipoArchivo, sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4) then
                                  begin
                                    if Migrar(True, sCarpeta, sImagen, sMigrado, iOK, iOKClaveInv, iNoMigrados) then
                                      begin
                                        if not VerificarClaveExiste(TipoArchivo, sClave, rarId) then
                                          rarId := DoInsertArchivo(TipoArchivo, TIPOUBICACION_GUARDA, '', 0, '', '', sClave, False);

                                        sSql := 'UPDATE ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
                                                   'SET RA_CLAVENOMIGRADA = NULL, ' +
                                                       'RA_IDARCHIVO = :IdArchivo ' +
                                                 'WHERE RA_ID = :Id';
                                        EjecutarSqlSTEx(sSql, [rarId, rraId]);
                                      end;

                                    sSqlUpdate := 'UPDATE ' + sTablaBank + ' ' +
                                                     'SET MIGRADO = :Migrado ' +
                                                   'WHERE ROWID = :RId';
                                    EjecutarSqlSTEx(sSqlUpdate, [sMigrado, sRowId]);

                                    edProcesados.Value := i;
                                    edOK.Value         := iOK;
                                    edOKClaveInv.Value := iOKClaveInv;
                                    edNoMigrados.Value := iNoMigrados;
                                  end;
                              end;

                            (*sSqlUpdate := 'UPDATE ' + sTablaBank + ' ' +  // esto es por si quiero marcar los ya procesados y poder retomar el proceso por si se corta
                                             'SET MIGRADO = :Migrado ' +
                                           'WHERE ROWID = :RId';
                            EjecutarSqlSTEx(sSqlUpdate, [sMigrado, sRowId]);

                            edProcesados.Value := i;
                            edOK.Value         := iOK;
                            edOKClaveInv.Value := iOKClaveInv;
                            edNoMigrados.Value := iNoMigrados;*)
                          end;

                        Next;
                      end;
                  end;

                if not pbTerminar then
                  begin
                    sSqlUpdateMigrado := 'UPDATE NEL.MIGRACIONBANKAGA ' +
                                            'SET IDTIPOARCHIVOMIGRADO = ''S'' '  +
                                          'WHERE ROWID = :RWID';
                    EjecutarSqlSTEx(sSqlUpdateMigrado, [sdqTablasBank.FieldByName('RWID').AsString]);
                  end;

                CommitTrans(True);
                Application.ProcessMessages;
              except
                on E : exception do
                begin
                  Rollback(True);

                  ReiniciarMigracion := bMigracionMasiva;

                  sError := 'Error al migrar tabla: ' + edTabla.Text + CRLF +
                            ' Tipo Arch.: ' + edTipoArchivo.Text + CRLF +
                            ' Clave: ' + sClave + CRLF +
                            ' Imagen: ' + IncludeTrailingPathDelimiter(sCarpeta) + sImagen + CRLF +
                            ' Reg. Procesados: ' + edProcesados.Text + CRLF +
                            E.Message + ' (' + E.ClassName + ')';

                  sSql := 'ART.VARIOS.DO_INSERTARTABLAMAILS(:Usuario, :Usuario, ''[Migración BANK]'', :Error, NULL, NULL, NULL);';
                  EjecutarStoreEx(sSql, [Sesion.Userid, Sesion.Userid, sError]);

                  sSql := 'ART.VARIOS.DO_INSERTARTABLAMAILS(:Usuario1, :Usuario2, ''[Migración BANK]'', :Error, NULL, NULL, NULL);';
                  EjecutarStoreEx(sSql, [Sesion.Userid, 'NELSONKUSTER@YAHOO.COM.AR', sError]);

                  if E.ClassName <> 'EOutOfMemory' then
                    begin
                      sSql := 'ART.VARIOS.DO_INSERTARTABLAMAILS(:Usuario1, :Usuario2, ''[Migración BANK]'', :Error, NULL, NULL, NULL);';
                      EjecutarStoreEx(sSql, [Sesion.Userid, 'PTAVASCI@GMAIL.COM', 'Por favor, si no estoy en la ART enviame un mensaje de texto avisando que hubo un error en la migración del AGA.' + CRLF + 'Gracias,' + CRLF + 'NWK' + CRLF + CRLF + sError]);
                    end;

                  MsgBox(sError);
                  Abort;
                end;
              end;
            finally
              Free;
            end;

          Next;
        end;

    if pbReiniciar then
      ModalResult := mrRetry	
    else
      begin
        if pbTerminar then
          MsgBox('Proceso Cancelado', MB_ICONINFORMATION)
        else
          begin
            sSql := 'ART.DEBUG.DONE(:Proceso);';
            EjecutarStoreEx(sSql, [PROCESO]);

            MsgBox('Proceso Finalizado', MB_ICONINFORMATION);
          end;

        Limpiar;
      end;
  finally
    if not IsEmptyString(frmMigracionBANK.Name) then
      begin
        VCLExtra.LockControls([fraFiltroArchivoMigrac.fraTipoArchivo, fraFiltroArchivoMigrac.btnCargarCodigoBarras, btnMigrar, rgMigrar], False);
        sdqTablasBank.Sql.Text := sSqlTablasBankAnt;
      end;  
  end;
end;

function TfrmMigracionBANK.Migrar(ExisteClave: Boolean; Carpeta, Imagen: String; var Migrado: String; var OK, OKClaveInv, NoMigrados: Integer): Boolean;
var
  sPathImagen: String;
  bImagenOk: Boolean;
//  ImgData: TImageData;
begin
  Result := False;

  sPathImagen := IncludeTrailingPathDelimiter(Carpeta) + Imagen;

  if IsEmptyString(Carpeta) then
    begin
      Migrado := 'PATH CARPETA NULO';
      Inc(NoMigrados);
    end

  else if IsEmptyString(Imagen) then
    begin
      Migrado := 'PATH IMAGEN NULO';
      Inc(NoMigrados);
    end

  else if not FileExists(sPathImagen) then
    begin
      Migrado := 'IMAGEN INEXISTENTE';
      Inc(NoMigrados);
    end

  else if UpperCase(ExtractFileExt(Imagen)) <> '.TIF' then
    begin
      Migrado := 'EXTENSION NO ES TIF';
      Inc(NoMigrados);
    end

  else
    begin
      (*try
        bImagenOk := LoadImageFromFile(sPathImagen, ImgData);
      except
        bImagenOk := False;
      end;

      if not bImagenOk then
        try        // por las dudas, vuelvo a probar pero con esta rutina...
          bImagenOk := IsValidTIFF(sPathImagen);
        except
          bImagenOk := False;
        end;*)
      bImagenOk := True;   // no valido si imagen corrupta porque se termina colgando el sistema

      if not bImagenOk then
        begin
          Migrado := 'IMAGEN CORRUPTA';
          Inc(NoMigrados);
        end
      else
        begin
          Result  := True;

          if not ExisteClave then
            begin
              Migrado := 'S (CLAVE INEXIST.)';
              Inc(OKClaveInv);
            end
          else
            begin
              Migrado := 'S';
              Inc(OK);
            end;
        end;
    end;

//  FreeImage(ImgData);
end;

procedure TfrmMigracionBANK.btnCancelarClick(Sender: TObject);
begin
  pbTerminar := True;

  if btnMigrar.Enabled then
    ModalResult := mrCancel
  else
    ModalResult := mrNone;
end;

procedure TfrmMigracionBANK.FormCreate(Sender: TObject);
begin
  inherited;

  ReiniciarMigracion := False;

  Limpiar;
  fraFiltroArchivoMigrac.fraTipoArchivo.Propiedades.ExtraCondition := fraFiltroArchivoMigrac.fraTipoArchivo.Propiedades.ExtraCondition +
    ' AND EXISTS (SELECT 1 ' +
                   'FROM NEL.MIGRACIONBANKAGA ' +
                  'WHERE IDTIPOARCHIVO = TA_ID)';
end;

function TfrmMigracionBANK.DoTransformarClave(TipoArchivo, CantCampos: Integer; Clave: String): String;
var
  sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
begin
  GetSubClaves(Clave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);
  Result := DoTransformarClave(TipoArchivo, CantCampos, Clave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);
end;

function TfrmMigracionBANK.DoTransformarClave(TipoArchivo, CantCampos: Integer; Clave, SubClave1, SubClave2, SubClave3, SubClave4: String): String;
begin
  case TipoArchivo of
    ID_CARPETA_HYS:    // según Baiardi, los que tienen establ. 0 pasarlo a 1...
      begin
        if (SubClave2 = '') or (SubClave2 = '0') then
          SubClave2 := '1'
      end;

    ID_CARPETA_PRESTDIN, ID_CARPETA_PREVENCION, ID_CARPETA_SINIESTRO, ID_CARPETA_INCAPACID, ID_CARPETA_RADIOGRSIN:
      begin
        if (SubClave2 = '') or (SubClave2 = '0') then
          SubClave2 := '1'
      end;

    ID_CARPETA_EXAMENPREOC:
      SubClave2 := '-1';  // no existe el nro. de CUIL en el repositorio
  end;

  Result := GetClaveArmada(CantCampos, SubClave1, SubClave2, SubClave3, SubClave4);
end;

procedure TfrmMigracionBANK.Limpiar;
begin
  edCantReg.Clear;
  edTabla.Clear;
  edTipoArchivo.Clear;
  edProcesados.Clear;
  edOK.Clear;
  edOKClaveInv.Clear;
  edNoMigrados.Clear;
  rgMigrar.ItemIndex := -1;
  rgMigrarClick(nil);

  JvProgressBarMigrac.Position := 0;
end;

procedure TfrmMigracionBANK.rgMigrarClick(Sender: TObject);
begin
  VCLExtra.LockControl(edNroPasada, (rgMigrar.ItemIndex <= 1) );
end;

function TfrmMigracionBANK.IsCartaDocValida(NroCartaDoc, TipoSalida: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM CCA_CARTA ' +
           'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
             'AND CA_TIPOSALIDA = :TipoSalida ' +
           'UNION ' +
          'SELECT 1 ' +
            'FROM CDO_CARTASDOCUMENTO ' +
           'WHERE DO_NROCARTADOC = :NroCartaDoc ' +
             'AND DO_TIPOSALIDA = :TipoSalida';

  Result := ExisteSqlEx(sSql, [NroCartaDoc, TipoSalida]);
end;

function TfrmMigracionBANK.DoVerificarMemoriaLibre: Boolean;
var
  sMensaje, sSql: String;
begin
  if GetAvailablePhysicalMemory() < 100000000 then  // 100 MB
    begin
      sMensaje := 'Total de memoria física disponible reducida !! Reiniciando...';

      sSql := 'ART.VARIOS.DO_INSERTARTABLAMAILS(:Usuario, :Usuario, ''[Migración BANK]'', :Error, NULL, NULL, NULL);';
      EjecutarStoreEx(sSql, [Sesion.Userid, Sesion.Userid, sMensaje]);

      sSql := 'ART.VARIOS.DO_INSERTARTABLAMAILS(:Usuario1, :Usuario2, ''[Migración BANK]'', :Error, NULL, NULL, NULL);';
      EjecutarStoreEx(sSql, [Sesion.Userid, 'NELSONKUSTER@YAHOO.COM.AR', sMensaje]);

      Result := False;
    end
  else
    Result := True;
end;

procedure TfrmMigracionBANK.tmInicioTimer(Sender: TObject);
begin
  tmInicio.Enabled := False;
  btnMigrarClick(nil);
end;

end.

