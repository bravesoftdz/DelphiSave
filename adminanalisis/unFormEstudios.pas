{-----------------------------------------------------------------------------
 Unit Name: unFormEstudios
 Author:
 Date:
 Purpose:   Registro de datos de estudios
 History:   16-Jul-2008
            Manejo de carpetas
-----------------------------------------------------------------------------}

unit unFormEstudios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  comctrls, FSForm, PeriodoPicker, unArt, unfraReconfirmacion, unUtilsArchivo,
  Strfuncs;

type
  TDatosEstudio = record
    Periodo,
    PerAnterior     : TPeriod;
    Prestador       : String;
    Reconfirmacion  : TReconfirmacion;
    ResNormal       : Boolean;
    Resultado       : Extended;
    Tipo            : TCtbClave;
    FechaRecPrest   : TDate;
    FechaRecML      : TDate;
    IDCarpetaAMP    : Integer;
    IDDetalleArchivo: TTableId;
    Observaciones   : String;
    AdicEst         : String;
    CarpetaPendiente: boolean;
    EstudioUnico    : String;
  end;

  TClaveEstudio = record
    CUIL     : String;
    CUIT     : String;
    Estableci: Integer;
    Estudio  : String;
    Fecha    : TDate;
    IdEstab  : integer;
  end;

  TModoABM = (maAdd, maUpdate, maDelete, maConsulta);
  TTipoRes = (trNone, trNormal, trAnormal);

  TFormEstudios = class(TFSForm)
  private
    FAETID: integer;
    TipoDeArchivo: String;
    procedure AsignarCarpeta(    pCUIT: String;
                                 pEstableci: Integer;
                                 pCuil: String;
                                 pPeriodo:TPeriod;
                             var pIDCarpeta: TTableId;
                             var pCarpetaPendiente: Boolean);
    procedure RegistrarEstudioEnRepositorio (    pMotivo: String;
                                                 pTipodoc: String;
                                                 ATipoArchivo: String;
                                                 AClave: Integer;
                                             var pIDDetalle: TTableId; EstudioUnico : Boolean);
    procedure RegistrarCambioCarpeta (pIDDetalle: Integer;
                                      pMotivo: String;
                                      ATipoArchivo: String;
                                      AClave: Integer);
    function GetTipoDocEstudio(TipoExamen, Estudio: String): String;
    function GrabarDocumentoCarpeta(var AHojas: Integer; var ADestino: String): Boolean;
    function DoAltaCarpetaArchivo (ATipoArchivo: String; AClave: Integer): TTableId;
  protected
    ModoABM: TModoABM;
  public
    ClaveEstudio: TClaveEstudio;
    DatosEstudio: TDatosEstudio;
    function Execute(AModoABM: TModoABM = maAdd): Boolean; virtual;
    function SaveResult(AResultado: Currency; ATipoRes: TTipoRes;
                        APrestador: String; APeriodo, APerAnterior: TPeriod;
                        AIDCarpetaAMP, AIDDetalleArchivo: integer;
                        ACarpetaPendiente: boolean;
                        ATipo: TCtbClave; AReconfirmacion: TReconfirmacion;
                        AFechaRPrest: TDate = 0; AFechaRML: TDate = 0;
                        AObservaciones: String = ''; AAdicEst: String = '';AEstudioUnico : String = ''): Boolean;
    function TipoResultado(pNormal: Boolean): TTipoRes;
  published
    property AutoTabs;
    property StatusBar;
    property CurrAETID: integer read FAETID;
  end;

implementation

uses
  AnsiSql, SqlFuncs, unDmPrincipal, CustomDlgs, General, unFraTipoEstudio, unPrincipal,
  DateTimeFuncs, unComunesArchivo, unConstantArchivo, unGrabarDocumentoCarpeta;

{ TFormEstudios }
{-----------------------------------------------------------------------------
  Procedure: Execute
  Author:    racastro
  Date:      16-Jul-2008
  Arguments: AModoABM: TModoABM
  Result:    Boolean
  Purpose:
-----------------------------------------------------------------------------}

function TFormEstudios.Execute(AModoABM: TModoABM): Boolean;
begin
  ModoABM := AModoABM;
  Result  := ShowModal = mrOk;
end;

{----------------------------------------------------------------------------}

function TFormEstudios.GetTipoDocEstudio(TipoExamen, Estudio: String): String;
  function GetTipoDocEstudioExamenPer(Estudio: String): String;
  var
    sTipoDoc: String;
  begin
    if Estudio = '00000037' then
      sTipoDoc := CODDOC_ESTMEDRX
    else begin
      if Estudio = '00000172' then
        sTipoDoc := CODDOC_ESTMEDRX_LFP
      else
        sTipoDoc := CODDOC_EXMEDAMP;
    end;

    Result := sTipoDoc;
  end;
begin
  if TipoExamen = TE_EXAMEN_PERIODICO then
    Result := GetTipoDocEstudioExamenPer(Estudio)
  else if TipoExamen = TE_EXAMEN_EGRESO then
    Result := CODDOC_EXEGRML
  else if TipoExamen = TE_EXAMEN_RECONFIRMACION then
    Result := CODDOC_EXMEDAMP
  else
    Result := '';
end;

{-----------------------------------------------------------------------------
  Procedure: SaveResult
  Author:
  Date:
  Arguments:
  Result:    Boolean
  Purpose:   Registro de datos de estudio

  History
  Author:    racastro
  Date:      16-Jul-2008
  Purpose:   Manejo de Carpetas
-----------------------------------------------------------------------------}

function TFormEstudios.SaveResult(AResultado: Currency; ATipoRes: TTipoRes;
                                  APrestador: String; APeriodo, APerAnterior: TPeriod;
                                  AIDCarpetaAMP, AIDDetalleArchivo: integer;
                                  ACarpetaPendiente: boolean;
                                  ATipo: TCtbClave; AReconfirmacion: TReconfirmacion;
                                  AFechaRPrest: TDate = 0; AFechaRML: TDate = 0;
                                  AObservaciones: String = ''; AAdicEst: String = ''; AEstudioUnico : String = ''): Boolean;
var
  Sql: TSql;
  sMsg,
  sTipoRes, sTipoDoc: String;
  ID, IDCarpeta, IDDetalleArchivo, idtrab: TTableId;
  CarpetaPendiente: boolean;
begin
  Result := False;

  if (ModoABM = maAdd) and
     (ATipo = TE_EXAMEN_PERIODICO) and
     (not ExisteSQLEx ('SELECT 1 ' +
                       '  FROM hys.hce_carpetaestamp ' +
                       ' WHERE ce_cuit = :pcuit ' +
                       '   AND ce_estableci = :pestableci ' +
                       '   AND ce_cuil = :pcuil ' +
                       '   AND ce_operativo = :poperativo ',
                        [ClaveEstudio.CUIT, ClaveEstudio.Estableci, ClaveEstudio.CUIL, APeriodo])) then
  begin
    if MsgBox ('No existe una carpeta asociada a los datos de CUIT-CUIL-ESTAB-PERIODO ingresados. ' +
               'Desea generar y asignar una nueva carpeta?', MB_ICONQUESTION + MB_YESNO) <> mrYes then
      raise Exception.Create('Corrija/modifique los datos a fin de poder asignar una carpeta.');
  end;

  if (ATipo = TE_EXAMEN_PERIODICO) and
     (Copy(APeriodo, 1, 4) >= '2008') and
     not ExisteSqlEx('SELECT 1 ' +
                     '  FROM comunes.ctj_trabajador, ' +
                     '       afi.aem_empresa, ' +
                     '       hys.hle_loteestudio, ' +
                     '       hys.hrl_relevamientolote, ' +
                     '       hys.hel_estadolote, ' +
                     '       hys.hdl_detallelote ' +
                     ' WHERE tj_id = dl_idtrabajador ' +
                     '   AND em_id = dl_idempresa ' +
                     '   AND le_id = el_idlote ' +
                     '   AND rl_id = el_rlid ' +
                     '   AND rl_idestableci = dl_idestableci ' +
                     '   AND el_idlote = dl_idlote ' +
                     '   AND em_cuit = :pcuit ' +
                     '   AND rl_nroestableci = :pestableci ' +
                     '   AND tj_cuil = :pcuil ' +
                     '   AND dl_idestudio = :pestudio ' +
                     '   AND    EXTRACT (YEAR FROM le_fechaalta) ' +
                     '       || DECODE (el_operativo, ''A'', ''01'', ''S'', ''06'', '''') = :poperativo ',
                     [ClaveEstudio.CUIT, ClaveEstudio.Estableci, ClaveEstudio.CUIL, ClaveEstudio.Estudio, APeriodo]) and
// sacar cuando se cargue todo lo resudual
      (MsgBox('No existe un lote que contenga al estudio para este CUIT-CUIL-ESTAB-OPERATIVO.' + #13 +
              'Desea cargarlo igualmente?', MB_ICONWARNING + MB_YESNO) <> mrYes) then
    Exception.Create('No existe un lote que contenga al estudio para este CUIT-CUIL-ESTAB-OPERATIVO.');

  IDCarpeta        := AIDCarpetaAMP;
  IDDetalleArchivo := AIDDetalleArchivo;
  CarpetaPendiente := ACarpetaPendiente;
  sMsg := '';

  if (ATipo = TE_EXAMEN_RECONFIRMACION) and ((AReconfirmacion.Fecha = 0) or (AReconfirmacion.Estudio = '')) then
    raise Exception.Create('Debe seleccionar el estudio a reconfirmar.');

  with ClaveEstudio do
  begin
    // Determino el tipo de archivo para el estudio
    if (ATipo = TE_EXAMEN_EGRESO) then
      TipoDeArchivo := Trim(IntToStr(ID_CARPETA_ML_EGRESOS))
    else
      TipoDeArchivo := ValorSqlEx('SELECT es_tipoarchivo ' +
                                  '  FROM art.aes_estudios ' +
                                  ' WHERE es_codigo = :pestudio ',
                                  [Estudio]);

    case ATipoRes of
      trNone:
      begin
        if (AResultado = 0) or ((AResultado <> 0) and
                                (ValorSql('SELECT art.amp.isnormal('+ SqlValue(Cuit) + ', ' +
                                                                      SqlDate(Fecha) + ', ' +
                                                                      SqlValue(Estudio) + ', NULL, ' +
                                                                      SqlNumber(AResultado) + ') ' +
                                          '  FROM DUAL') = 'S')) then
          sTipoRes := 'N'
        else
          sTipoRes := 'A';
      end;
      trNormal:  sTipoRes := 'N';
      trAnormal: sTipoRes := 'A';
    end;

    Sql := TSql.Create('AET_ESTRAB');
    try
      Sql.PrimaryKey.Add('ET_CUIT',      CUIT);
      Sql.PrimaryKey.Add('ET_ESTABLECI', Estableci);
      Sql.PrimaryKey.Add('ET_CUIL',      Cuil);
      Sql.PrimaryKey.Add('ET_FECHA',     Fecha);
      Sql.PrimaryKey.Add('ET_ESTUDIO',   Estudio);

      Sql.Fields.AddExtended('ET_RESULTADO', AResultado, ALL_DECIMALS, False);
      Sql.Fields.Add('ET_TIPORES',           sTipoRes);
      Sql.Fields.Add('ET_PRESTADOR',         APrestador);
      Sql.Fields.Add('ET_PERIODO',           APeriodo);
      Sql.Fields.Add('ET_TIPO',              ATipo);
      Sql.Fields.Add('ET_REC_FECHA',         AReconfirmacion.Fecha);
      Sql.Fields.Add('ET_REC_ESTUDIO',       AReconfirmacion.Estudio);
      Sql.Fields.Add('ET_USUBAJA',           SQL_NULL, False);
      Sql.Fields.Add('ET_FECHABAJA',         SQL_NULL, False);

      Sql.Fields.AddDateTime('ET_FECHARECPREST', AFechaRPrest, True);
      Sql.Fields.AddDateTime('ET_FECHARECML', AFechaRML, True);

      Sql.Fields.Add('ET_OBSERVACIONES', AObservaciones);
      Sql.Fields.Add('ET_DATOSADICESTUDIO', AAdicEst);
      if AEstudioUnico <> '' then
      begin
        Sql.Fields.Add('ET_UNICOESTUDIO', AEstudioUnico);
      end;

      if ModoABM = maUpdate then
      begin // Actualización
        sTipoDoc := '';

        if ATipo = TE_EXAMEN_PERIODICO then
        begin // Cambio de carpeta por cambio en el Operativo
          sTipoDoc := GetTipoDocEstudio(ATipo, Estudio);

          if APeriodo <> APerAnterior then
          begin
            AsignarCarpeta(CUIT, Estableci, CUIL, APeriodo, IDCarpeta, CarpetaPendiente);

            RegistrarCambioCarpeta(IDDetalleArchivo, 'Cambio de Período', TipoDeArchivo, IDCarpeta);

            Sql.Fields.Add('ET_IDCARPETAAMP', IDCarpeta);

            sMsg := 'El estudio ha sido movido a la Carpeta %d' +
                    iif(CarpetaPendiente, ', la cual está pendiente de verificación', '');
          end;
        end

        else if (ATipo = TE_EXAMEN_RECONFIRMACION) and (IDCarpeta <> AReconfirmacion.Carpeta) then
          begin // Cambio de carpeta por cambio en el estudio a reconfirmar
            sTipoDoc := GetTipoDocEstudio(ATipo, '');

            if AReconfirmacion.Carpeta = 0 then
              // Estudio sin carpeta
              sMsg := 'La reconfirmación no puede asignarse a una nueva Carpeta, se mantiene la actual'
            else begin // Estudio con carpeta
              RegistrarCambioCarpeta(IDDetalleArchivo, 'Cambio de estudio', TipoDeArchivo, AReconfirmacion.Carpeta);

              IDCarpeta := AReconfirmacion.Carpeta;
              Sql.Fields.Add('ET_IDCARPETAAMP', IDCarpeta);
              sMsg := 'La reconfirmación ha sido movida a la Carpeta %d';
            end
          end;

        if (IDCarpeta <> 0) and
           (IDDetalleArchivo = 0)
           and
           (MsgBox('No existe un documento asociado al estudio para Adm. Gral. de Archivos.' + #13 +
                   'Desea generarlo?', MB_ICONWARNING + MB_YESNO) = mrYes) then
        begin
          RegistrarEstudioEnRepositorio('Modificación de estudio', sTipoDoc, TipoDeArchivo, IDCarpeta, IDDetalleArchivo, AEstudioUnico = 'S');
          if IDDetalleArchivo <> ART_EMPTY_ID then
            Sql.Fields.Add('ET_IDDETALLEARCHIVO', IDDetalleArchivo);
        end;

        // Obtengo el ID del estudio del trabajador
        ID := ValorSQLEx ('SELECT et_id ' +
                          '  FROM aet_estrab ' +
                          ' WHERE et_cuit = :pcuit ' +
                          '   AND et_estableci = :pestableci ' +
                          '   AND et_cuil = :pcuil ' +
                          '   AND et_fecha = ' + SqlDate(Fecha) +
                          '   AND et_estudio = :pestudio ',
                          [CUIT, Estableci, Cuil, Estudio]);
        FAETID := ID;
        Sql.Fields.Add('ET_USUMODIF',   frmPrincipal.dbLogin.UserID);
        Sql.Fields.Add('ET_FECHAMODIF', SQL_ACTUALDATE, False);

        Sql.SqlType := stUpdate;
      end
      else begin // Alta

        if ATipo = TE_EXAMEN_EGRESO then
        begin
          sTipoDoc := GetTipoDocEstudio(ATipo, '');

          AsignarCarpeta(CUIT, Estableci, CUIL, 'EGRESO', IDCarpeta, CarpetaPendiente);
          Sql.Fields.Add('ET_IDCARPETAAMP', IDCarpeta);

          RegistrarEstudioEnRepositorio('Alta del estudio', sTipoDoc, TipoDeArchivo, IDCarpeta, IDDetalleArchivo, AEstudioUnico = 'S');
          if IDDetalleArchivo <> ART_EMPTY_ID then
            Sql.Fields.Add('ET_IDDETALLEARCHIVO', IDDetalleArchivo);

          sMsg := 'El estudio ha sido asignado a la Carpeta %d' +
                  iif(CarpetaPendiente, ', la cual está pendiente de verificación', '');
        end

        else if ATipo = TE_EXAMEN_PERIODICO then
        begin
          sTipoDoc := GetTipoDocEstudio(ATipo, Estudio);

          AsignarCarpeta(CUIT, Estableci, CUIL, APeriodo, IDCarpeta, CarpetaPendiente);
          Sql.Fields.Add('ET_IDCARPETAAMP', IDCarpeta);

          RegistrarEstudioEnRepositorio('Alta del estudio', sTipoDoc, TipoDeArchivo, IDCarpeta, IDDetalleArchivo, AEstudioUnico = 'S');
          if IDDetalleArchivo <> ART_EMPTY_ID then
            Sql.Fields.Add('ET_IDDETALLEARCHIVO', IDDetalleArchivo);

          sMsg := 'El estudio ha sido asignado a la Carpeta %d' +
                  iif(CarpetaPendiente, ', la cual está pendiente de verificación', '');
        end

        else if (ATipo = TE_EXAMEN_RECONFIRMACION) and (AReconfirmacion.Carpeta <> 0) then
          begin
            sTipoDoc  := GetTipoDocEstudio(ATipo, '');
            IDCarpeta := AReconfirmacion.Carpeta;

            Sql.Fields.Add('ET_IDCARPETAAMP', IDCarpeta);

            RegistrarEstudioEnRepositorio('Alta de reconfirmación', sTipoDoc, TipoDeArchivo, IDCarpeta, IDDetalleArchivo, AEstudioUnico = 'S');
            if IDDetalleArchivo <> ART_EMPTY_ID then
              Sql.Fields.Add('ET_IDDETALLEARCHIVO', IDDetalleArchivo);

            sMsg := 'La reconfirmación ha sido asignada a la Carpeta %d';
          end;

        // Obtengo el ID del estudio del trabajador
        ID := GetSecNextVal('art.seq_aeb_id');
        FAETID := ID;

        Sql.Fields.Add('ET_USUALTA',  frmPrincipal.dbLogin.UserID);
        Sql.Fields.Add('ET_FECHALTA', SQL_ACTUALDATE, False);
        Sql.Fields.Add('ET_ID', ID);

        Sql.SqlType := stInsert;
      end;

      try
        EjecutarSqlST(Sql.Sql);

        // Elimina toda referencia al ID en hys.hgr_gestionreconfirmacion
        EjecutarSqlSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                        '   SET gr_idestrab = NULL ' +
                        ' WHERE gr_idestrab = :pidestudio ' +
                        '   AND gr_estado = ''PA'' ',
                        [ID]);

        idtrab := ValorSqlIntegerEx('SELECT tj_id FROM comunes.ctj_trabajador WHERE tj_cuil = :cuil', [Cuil]);

        // Crea nueva referencia al ID en hys.hgr_gestionreconfirmacion
        EjecutarSqlSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                        '   SET gr_idestrab = :pidestudio ' +
                        ' WHERE gr_iddetallelote IN (SELECT dl_id ' +
                                    '                FROM hys.hle_loteestudio, ' +
                                    '                     hys.hel_estadolote, hys.hrl_relevamientolote, ' +
                                    '                     hys.hdl_detallelote hdl ' +
                                    '               WHERE el_idlote = dl_idlote ' +
                                    '                 AND rl_id = el_rlid ' +
                                    '                 AND rl_idestableci = dl_idestableci ' +
                                    '                 AND dl_idtrabajador = :pidtrab ' +
                                    '                 AND dl_idestudio = TO_NUMBER(:pestudio) '+
                                    '                 AND le_id = dl_idlote ' +
                                    '                 AND rl_idestableci = :pidestab ' +
                                    '                 AND rl_nroestableci = :pestableci ' +
                                    '                 AND le_idprestador = :pprestador ' +
                                    '                 AND el_operativo = :poperativo) ' +
                                    '   AND gr_estado = ''PA'' ',
                                    [ID, idtrab, Estudio, IdEstab, Estableci,
                                    strtoint(APrestador), iif(Copy(APeriodo, 5, 2) = '06', 'S', 'A')]);

        if not IsEmptyString(sMsg) then
          ShowMessage (Format (sMsg, [IDCarpeta]));

        Result := True;
      except
        on E: Exception do
          raise Exception.Create('Error al Guardar los datos del Estudio - ' + E.Message);
      end;
    finally
      Sql.Free;
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TipoResultado
  Author:    racastro
  Date:      16-Jul-2008
  Arguments: pNormal: Boolean
  Result:    TTipoRes
  Purpose:   Define tipo de resultado
-----------------------------------------------------------------------------}

function TFormEstudios.TipoResultado(pNormal: Boolean): TTipoRes;
begin
  if pNormal then
    Result := trNormal
  else
    Result := trAnormal;
end;

{-----------------------------------------------------------------------------
  Procedure: AsignarCarpeta
  Author:    racastro
  Date:      16-Jul-2008
  Arguments: pCUIT: String; pEstableci: Integer; pCuil: String; pPeriodo:TPeriod; var pIDCarpeta, pIDArchivo: Integer; var pCarpetaPendiente: Boolean
  Result:    None
  Purpose:   Obtiene el ID de una carpeta y el ID del archivo asociado a la misma
-----------------------------------------------------------------------------}

procedure TFormEstudios.AsignarCarpeta(    pCUIT: String;
                                           pEstableci: Integer;
                                           pCuil: String;
                                           pPeriodo:TPeriod;
                                       var pIDCarpeta: TTableId;
                                       var pCarpetaPendiente: Boolean);
begin
  // Si no existe Carpeta, la creo; sino obtengo su ID
  if not ExisteSQLEx ('SELECT 1 ' +
                      '  FROM hys.hce_carpetaestamp ' +
                      ' WHERE ce_cuit = :pcuit ' +
                      '   AND ce_estableci = :pestableci ' +
                      '   AND ce_cuil = :pcuil ' +
                      '   AND ce_operativo = :poperativo ',
                      [pCUIT, pEstableci, pCuil, pPeriodo]) then
  begin
    // Determino si la carpeta estará pendiente de verificación
    pCarpetaPendiente := ExisteSqlEx('SELECT 1 ' +
                                     '  FROM rcastro.hhcc ' +
                                     ' WHERE cuit = :cuit ' +
                                     '   AND estableci = :estableci ' +
                                     '   AND cuil = :cuil ' +
                                     '   AND periodo = :periodo ' +
                                     '   AND carpeta IS NULL ' +
                                     '   AND pendiente = ''S'' ',
                                     [pCUIT, pEstableci, pCuil, pPeriodo]);

    pIDCarpeta := GetSecNextVal('hys.seq_hce_id');

    EjecutarSqlSTEx('INSERT INTO hys.hce_carpetaestamp ' +
                    '            (ce_id, ce_cuit, ce_estableci, ce_cuil, ce_operativo, ' +
                    '             ce_fechaalta, ce_usualta, ce_pendiente) ' +
                    '     VALUES (:ce_id, :ce_cuit, :ce_estableci, :ce_cuil, :ce_operativo, ' +
                    '             SYSDATE, :ce_usualta, :ce_pendiente) ',
                    [pIDCarpeta, pCUIT, pEstableci, pCuil, pPeriodo,
                     frmPrincipal.dbLogin.UserID, iif(pCarpetaPendiente, 'S', 'N')]);
  end
  else begin
    pIDCarpeta := ValorSqlIntegerEx('SELECT ce_id ' +
                                    '  FROM hys.hce_carpetaestamp ' +
                                    ' WHERE ce_cuit = :pcuit ' +
                                    '   AND ce_estableci = :pestableci ' +
                                    '   AND ce_cuil = :pcuil ' +
                                    '   AND ce_operativo = :poperativo ',
                                    [pCUIT, pEstableci, pCuil, pPeriodo]);

    // Determino si la carpeta está pendiente de verificación
    pCarpetaPendiente := ExisteSqlEx('SELECT 1 ' +
                                     '  FROM hys.hce_carpetaestamp ' +
                                     ' WHERE ce_pendiente = ''S'' ' +
                                     '   AND ce_id = :idcarpeta ',
                                     [pIDCarpeta]);
  end;

  // Crea reg. archivos si no existe para la Clave (Nro de Carpeta)
  DoAltaCarpetaArchivo(TipoDeArchivo, pIDCarpeta);
end;

{-----------------------------------------------------------------------------
  Procedure: RegistrarEstudioEnRepositorio
  Author:    racastro
  Date:      16-Jul-2008
  Arguments: pIDArchivo: Integer; pMotivo: String; var pIDDetalle: Integer
  Result:    None
  Purpose:   Obtiene el ID en detalle para asociar al estudio en particular
             Esto permite hacer un tracking para el eventual cambio de carpeta
             del estudio
-----------------------------------------------------------------------------}

procedure TFormEstudios.RegistrarEstudioEnRepositorio (    pMotivo: String;
                                                           pTipodoc: String;
                                                           ATipoArchivo: String;
                                                           AClave: Integer;
                                                       var pIDDetalle: TTableId; EstudioUnico : Boolean);
var
  RarId, IdTipoDoc: TTableId;
  IdSecuenciaTraz, iCantHojas: Integer;
  sDestino: String;
  bMedLabRX: Boolean;
begin
  bMedLabRX := (ATipoArchivo = Trim(IntToStr(ID_CARPETA_ML_RX)));

  RarId := DoAltaCarpetaArchivo(ATipoArchivo, AClave);

  pIDDetalle := ART_EMPTY_ID;
  IdTipoDoc  := Get_IdTipoDocumentoSector(pTipodoc, 'MEDLAB');

  if bMedLabRX then
    sDestino := OPCION_DESTINO_GUARDA
  else
    sDestino := OPCION_DESTINO_DIGITALIZACION;

  if (IdTipoDoc <> ART_EMPTY_ID) and (RarId <> ART_EMPTY_ID) then
    begin
      pIDDetalle := Get_UltIdDetalleArchivo(RarId, pTipodoc);
      iCantHojas := 0;

      if EstudioUnico or GrabarDocumentoCarpeta(iCantHojas, sDestino) then
        pIDDetalle := DoInsertDetalleArchivo(IdSecuenciaTraz, RarId, IdTipoDoc, 0, sDestino, iCantHojas,
                                             pMotivo, '0', '', 0, '', False, 0, 0, 0, '',
                                             ExistePrinterEtiquetas(), 1);  // solo van a imprimir una sola etiqueta por doc. (hablado con MBaiardi, 17/02/11)
    end;

  if EstudioUnico and bMedLabRX then
    RegistrarEstudioEnRepositorio(pMotivo, pTipodoc, Trim(IntToStr(ID_CARPETA_ML_GRAL)), AClave, pIDDetalle, False);
end;

{-----------------------------------------------------------------------------
  Procedure:
  Author:    racastro
  Date:      16-Jul-2008
  Arguments: Not available
  Result:    Not available
  Purpose:   Registra el cambio de carpeta de un estudio
-----------------------------------------------------------------------------}

procedure TFormEstudios.RegistrarCambioCarpeta (pIDDetalle: Integer;
                                                pMotivo: String;
                                                ATipoArchivo: String;
                                                AClave: Integer);
var
  RarId: TTableId;
begin
  if VerificarClaveExiste(StrToInt(ATipoArchivo), IntToStr(AClave), RarId) then
    DoCambiarCarpetaDetalleArchivo(pIDDetalle, RarId, pMotivo, False);
end;

{----------------------------------------------------------------------------}

function TFormEstudios.GrabarDocumentoCarpeta(var AHojas: Integer; var ADestino: String): Boolean;
begin
  Result := False;

  with TfrmGrabarDocumentoCarpeta.Create(nil) do
    try
      LockDestino := True;
      Destino     := ADestino;
      Aclaracion  := 'Si el estudio corresponde a un nuevo papel debe generar un nuevo documento en el Adm. Gral. de Archivos, indicando la cantidad de hojas del mismo.';

      if ShowModal = mrOk then
        begin
          AHojas   := CantHojas;
          ADestino := Destino;

          Result   := True;
        end;
    finally
      Free;
    end;
end;

{----------------------------------------------------------------------------}

function TFormEstudios.DoAltaCarpetaArchivo(ATipoArchivo: String; AClave: Integer): TTableId;
var
  RarId: TTableId;
begin
  if not VerificarClaveExiste(StrToInt(ATipoArchivo), IntToStr(AClave), RarId) then
    RarId := DoInsertArchivo(StrToInt(ATipoArchivo), TIPOUBICACION_GUARDA, '', 0, '', '', IntToStr(AClave), False);

  Result := RarId;
end;

{----------------------------------------------------------------------------}
end.

