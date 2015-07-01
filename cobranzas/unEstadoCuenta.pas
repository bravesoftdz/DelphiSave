unit unEstadoCuenta;

interface

uses
  unArt;

function Get_MaxFechaConcQuiebra(Cuit: String): TDateTime;
function Get_MaxPeriodoConcQuiebra(Cuit: String): String;
function Get_SqlInteresDeuda(InteresesSaldroAcreedor: Boolean; SqlInteresPositivo, CampoDeuda: String): String;
function Is_ExisteArchivoEstCuenta(IdSeleccion, IdAccion: TTableId; Contrato: Integer; var NombreArchivo: String): Boolean;

procedure Do_ImprimirArchivoEstCuenta(NombreArchivo: String);
procedure Generar_SQLIntereses(Cuit: String; Contrato: Integer; FechaInteresHasta: TDateTime;
                               InteresPerConcQuiebra: Boolean; var SqlTasaInteresFinal, sSqlInteresPositivo,
                               SqlVencimientoCuota: String);
function Get_PendienteAcreditarDescr(Contrato: Integer): String;
function Get_ValoresRechazadosDescr(Contrato: Integer): String;
function Get_ValoresPendienteEntregaDescr(Contrato: Integer): String;

procedure DoImprimirLibreDeuda(Contrato: Integer);
procedure DoImprimirEstadoCuentaLD(Contrato: Integer; Id: TTableId);

function Get_NombreEntidadComercial(Contrato: Integer): String;
procedure Get_NombreEntidadVendedor(Contrato: Integer; var NomEntidad, NomVendedor: String);

function Get_JuicioParteActoraDescr(Contrato: Integer): String;

implementation

uses
  unDmPrincipal, AnsiSql, SysUtils, DateTimeFuncs, General, ShellAPI, ArchFuncs, Forms, Windows,
  StrFuncs, SqlFuncs, unSesion, Classes, CustomDlgs, unCobranzas, unQrLibreDeuda, Controls,
  unImpresionEstadoDeCuenta, unComunes, unMoldeEnvioMail;

function Get_MaxFechaConcQuiebra(Cuit: String): TDateTime;
var
  sSql: String;
  MaxFecha: String;
begin
  sSql := 'COBRANZA.GET_MAXFECHACONCQUIEBRA(:sCuit)';
  MaxFecha := ObtenerValorEx(sSql, [Cuit]);

  if MaxFecha = '' then
    Result := 0
  else
    Result := StrToDate(MaxFecha);
end;

function Get_MaxPeriodoConcQuiebra(Cuit: String): String;
var
  sSql: String;
begin
  sSql := 'LEGALES.GET_PERIODOCONCOQUIEBRA(:sCuit)';

  Result := ObtenerValorEx(sSql, [Cuit]);
end;

procedure Generar_SQLIntereses(Cuit: String; Contrato: Integer; FechaInteresHasta: TDateTime;
                               InteresPerConcQuiebra: Boolean; var SqlTasaInteresFinal, sSqlInteresPositivo,
                               SqlVencimientoCuota: String);
var
  sPerConcQuiebra, SqlTasaInteresHasta, SqlTasaInteresCQ: String;
  FechaQuiebra, FechaInteresHastaCQ: TDateTime;
begin
  FechaQuiebra    := Get_MaxFechaConcQuiebra(Cuit);
  sPerConcQuiebra := Get_MaxPeriodoConcQuiebra(Cuit);

  // Obtengo la fecha de vencimiento de la cuota a la que pertenece el periodo
  SqlVencimientoCuota := 'DEUDA.GET_VENCIMIENTOCUOTACONTRATO(RC_CONTRATO, RC_PERIODO)';

  if (FechaInteresHasta = 0) or ((FechaInteresHasta <= FechaQuiebra) and (not InteresPerConcQuiebra)) then
    SqlTasaInteresFinal := '0 TASAINTERES, '
  else
  begin
    // Obtengo la tasa de interes hasta la fecha de interés hasta
    SqlTasaInteresHasta := 'DEUDA.GET_TASAACUMULADA(' + SqlVencimientoCuota + ' + 1, ' + SqlValue(FechaInteresHasta) + ')';

    if FechaQuiebra = 0 then
      SqlTasaInteresFinal := SqlTasaInteresHasta + ' TASAINTERES, '
    else
    begin   // en concurso/quiebra
      if InteresPerConcQuiebra then
      begin
        FechaInteresHastaCQ := MinDate(FechaQuiebra, FechaInteresHasta);
        SqlTasaInteresCQ    := 'DEUDA.GET_TASAACUMULADA(' + SqlVencimientoCuota + ' + 1, ' + SqlValue(FechaInteresHastaCQ) + ')';
      end
      else
        // La tasa de interes se aplica si el periodo no esta en concurso o quiebra
        SqlTasaInteresCQ := '0';

      SqlTasaInteresFinal := 'TO_NUMBER(UTILES.IIF_COMPARA(''>'', ' + SqlValue( sPerConcQuiebra ) + ', RC_PERIODO, ' + SqlTasaInteresCQ + ', ' + SqlTasaInteresHasta + ' )) TASAINTERES, ';
    end;
  end;

  //Si el importe reclamado es <> 0 entonces la tasa de interes es cero
  sSqlInteresPositivo := 'DECODE(IMPORTERECLAMOAFIP, 0, TASAINTERES, GREATEST(TASAINTERES, 0))';
end;

function Get_SqlInteresDeuda(InteresesSaldroAcreedor: Boolean; SqlInteresPositivo, CampoDeuda: String): String;
var
  sSql, sDeudaInteres: String;
begin
  sDeudaInteres := 'ROUND(' + CampoDeuda + '*(' + SqlInteresPositivo + '/100), 2)';

  sSql := IIF(InteresesSaldroAcreedor, sDeudaInteres,
              'TO_NUMBER(UTILES.IIF_COMPARA(''<='', ' + CampoDeuda + ', 0, 0, ' + sDeudaInteres + '))' );

  Result := sSql;
end;

function Is_ExisteArchivoEstCuenta(IdSeleccion, IdAccion: TTableId; Contrato: Integer; var NombreArchivo: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT SC_NOMBREARCHIVO ' +
            'FROM ZSC_SELECCIONCONTRACCIONPLAN ' +
           'WHERE SC_IDSELECCIONPLAN=:IdSeleccion ' +
             'AND SC_IDACCIONPLAN=:IdAccion ' +
             'AND SC_CONTRATO=:Contrato';
  NombreArchivo := Trim(ValorSqlEx(sSql, [IdSeleccion, IdAccion, Contrato]));

  Result := ((NombreArchivo <> '') and FileExists(NombreArchivo));
end;

procedure Do_ImprimirArchivoEstCuenta(NombreArchivo: String);
begin
  Do_ImprimirArchivoServidorCobranzas(NombreArchivo, 'EstCta');
end;

function Get_PendienteAcreditarDescr(Contrato: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT DECODE(DEUDA, 0, NULL, ''Valores pendientes de acreditar por $ '' || REPLACE(TO_CHAR(DEUDA, ''FM9999999999.00''), ''.'', '','')) ' +
            'FROM (SELECT NVL(SUM(VA_IMPORTE), 0) DEUDA ' +
            'FROM ART.CTB_TABLAS, ZVA_VALOR ' +
           'WHERE VA_IDCONTRATO = :Contrato ' +
             'AND VA_FECHABAJA IS NULL ' +
             'AND TB_CLAVE = ''ESVAL'' ' +
             'AND TB_CODIGO = VA_ESTADO ' +
             'AND TB_ESPECIAL1 = ''N'' ' +
             'AND VA_FECHARECHAZO IS NULL)';

  Result := ValorSqlEx( sSql, [Contrato] );
end;

function Get_ValoresRechazadosDescr(Contrato: Integer): String;
var
  sSql: String;
begin
  sSql :=  'SELECT DECODE(MONTO, NULL, NULL, ''Valores rechazados por $ '' || REPLACE(TO_CHAR(MONTO, ''FM9999999999.00''), ''.'', '','')) ' +
             'FROM (SELECT SUM(VA_IMPORTE) MONTO ' +
                     'FROM ZVA_VALOR ' +
                    'WHERE VA_ESTADO = ''03'' ' +
                      'AND VA_IDCONTRATO = :Contrato)';

  Result := ValorSqlEx( sSql, [Contrato] );
end;

function Get_ValoresPendienteEntregaDescr(Contrato: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT DECODE(MONTO, 0, NULL, ''Valores pendientes de entrega por $ '' || REPLACE(TO_CHAR(MONTO, ''FM9999999999.00''), ''.'', '','')) ' +
            'FROM (SELECT NVL(SUM(PC_AMORTIZACION+PC_INTERESFINANC) - ART.DEUDA.GET_VALORESPLAN(PP_ID), 0) MONTO ' +
                    'FROM ART.CTB_TABLAS, ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
                   'WHERE PC_IDPLANPAGO = PP_ID ' +
                     'AND PP_ESTADO = TB_CODIGO ' +
                     'AND TB_CLAVE = ''ESPLA'' ' +
                     'AND TB_ESPECIAL1 = ''S'' ' +
                     'AND TB_ESPECIAL2 <> ''A'' ' +
                     'AND PP_CONTRATO = :Contrato ' +
                     'AND PP_FECHABAJA IS NULL ' +
                   'GROUP BY PP_ID)';

  Result := ValorSqlEx( sSql, [Contrato] );
end;

function DoGrabarLibreDeuda(Contrato: Integer; CodEstado, Observaciones: String): TTableId;
var
  Id: TTableId;
begin
  with TSql.Create('ZLD_LIBREDEUDA') do
    try
      SqlType := stInsert;

      Id := GetSecNextVal('SEQ_ZLD_ID');

      PrimaryKey.Add('LD_ID',          Id, dtNumber);
      Fields.Add('LD_CONTRATO',        Contrato, dtNumber);
      Fields.Add('LD_ESTADO',          CodEstado);
      Fields.Add('LD_OBSERVACIONES',   Observaciones);
      Fields.Add('LD_USUALTA',         Sesion.UserID);
      Fields.Add('LD_FECHAALTA',       exDateTime);

      EjecutarSqlST(Sql);
    finally
      Free;
    end;

  Result := Id;
end;

function ValidarLibreDeuda(Contrato: Integer; var CodEstado, Observaciones: String): Boolean;
var
  sDir, sMensaje, sAsunto, sDirecciones, sTexto, sSql: String;
  bReclamosAfip, bImprimir: Boolean;
  sObservaciones: TStrings;
  Deuda: Currency;
begin
  bImprimir := False;             

  sSql := 'SELECT CO_ESTADO, CO_MOTIVOBAJA, CO_FECHABAJA, EM_NOMBRE, EM_CUIT, ' +
                 'LEGALES.GET_FECHACONCURSO(EM_CUIT)CONCURSO, ' +
                 'LEGALES.GET_FECHAQUIEBRA(EM_CUIT) QUIEBRA ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO ' +
           'WHERE CO_CONTRATO = :Contrato ' +
             'AND EM_ID	= CO_IDEMPRESA';

  with GetQueryEx(sSql, [Contrato]) do
    try
      Verificar(not AreIn(FieldByName('CO_ESTADO').AsString, ['1', '6', '9']), nil, 'El contrato debe estar activo o rescindido.');

      Verificar((FieldByName('CO_ESTADO').AsString = '6') and
                ((FieldByName('CO_MOTIVOBAJA').AsString = '07') or (FieldByName('CO_MOTIVOBAJA').AsString = '08')) and
                (Get_UltimaFechaPago(Contrato) < FieldByName('CO_FECHABAJA').AsDateTime),
                nil, 'La última fecha de pago debe ser mayor o igual a la fecha de baja.');

      if ValorSqlEx('SELECT AFILIACION.Is_TarifaPendiente(:Contrato) FROM DUAL', [Contrato]) = 'S' then
        begin
          sDirecciones := Get_DireccionesEnvioMail('COBLD');

          // ejecutivo de cuenta del contrato
          sSql := 'SELECT SE_MAIL ' +
                    'FROM USE_USUARIOS, AEC_EJECUTIVOCUENTA, ACO_CONTRATO ' +
                   'WHERE CO_CONTRATO = :Contrato ' +
                     'AND CO_IDEJECUTIVO = EC_ID ' +
                     'AND EC_USUARIO = SE_USUARIO';
          sDir := ValorSqlEx(sSql, [Contrato]);
          if sDir <> '' then
            sDirecciones := sDirecciones + Iif(sDirecciones = '', '', ',') + sDir;

         // gerente comercial
         sSql := 'SELECT SE_MAIL ' +
                   'FROM ART.USE_USUARIOS ' +
                  'WHERE SE_FECHABAJA IS NULL ' +
                    'AND SE_CARGO = ''GE'' ' +
                    'AND ROWNUM = 1 ' +
             'START WITH SE_USUARIO = ''ADMCOM'' ' +
             'CONNECT BY PRIOR SE_RESPONDEA = SE_USUARIO ' +
                    'AND SE_USUARIO <> SE_RESPONDEA';
          sDir := ValorSql(sSql);
          if sDir <> '' then
            sDirecciones := sDirecciones + Iif(sDirecciones = '', '', ',') + sDir;

          sAsunto      := 'Libre Deuda con Tarifa Sin Aplicar';
          sMensaje     := 'La empresa ' + Trim(FieldByName('EM_NOMBRE').AsString) + ' (CUIT: ' + FieldByName('EM_CUIT').AsString + ' - Contrato: ' + Trim(IntToStr(Contrato)) + ') ha solicitado ' +
                          'la emisión de Libre Deuda y posee una tarifa sin aplicar.';
          if sDirecciones <> '' then
            EnviarMailBD(sDirecciones, sAsunto, [oAutoFirma], sMensaje, nil, 0, tcDefault, True);

          Verificar(True, nil, 'Por el momento no se puede dar curso al pedido por encontrarse una tarifa informada no aplicada.');
        end;

      sSql := 'SELECT 1 ' +
                'FROM CTB_TABLAS, ZRA_RECLAMOAFIP ' +
               'WHERE RA_CONTRATOPRINCIPAL=:Contrato ' +
                 'AND RA_FECHABAJA IS NULL ' +
                 'AND TB_CODIGO=NVL(RA_RESPUESTAAFIP, ''0'') ' +
                 'AND TB_CLAVE=''RAFIP'' ' +
                 'AND NVL(TB_ESPECIAL1, ''S'')=''S''';

      bReclamosAfip := ExisteSqlEx(sSql, [Contrato]);
      if bReclamosAfip then
        sTexto := 'El contrato tiene reclamos AFIP. '
      else
        begin
          sSql := 'SELECT DEUDA.GET_DEUDA(:Contrato, Null, ''N'', ''N'', ''S'') ' +
                    'FROM DUAL';
          Deuda := ValorSqlExtendedEx(sSql, [Contrato]);

          if Deuda = 0 then
            begin
              CodEstado := '001';  // Emitido
              bImprimir := True;
            end
          else if not FieldByName('CONCURSO').IsNull or not FieldByName('QUIEBRA').IsNull then
            begin
              MsgBox('La empresa tiene deuda concursal.', MB_ICONEXCLAMATION + MB_OK);
              CodEstado := '002';  // Deuda concursal
              bImprimir := False;
            end
          else
            begin
              sSql := 'SELECT 1 ' +
                        'FROM ZRC_RESUMENCOBRANZA ' +
                       'WHERE RC_CONTRATO=:Contrato ' +
                         'AND COBRANZA.IS_PERIODOCHEQUESRECHAZADOS(RC_CONTRATO, RC_PERIODO)=''S''';

              if ExisteSqlEx(sSql, [Contrato]) then
                begin
                  MsgBox('El contrato tiene cheques rechazados.', MB_ICONEXCLAMATION + MB_OK);
                  CodEstado := '003';  // Cheques rechazados
                  bImprimir := False;
                end
              else
                begin
                  if not IsEmptyString(Get_PendienteAcreditarDescr(Contrato)) then
                    begin
                      MsgBox('El contrato tiene valores pendientes de acreditar.', MB_ICONEXCLAMATION + MB_OK);
                      CodEstado := '006';  //Valores pendientes de acreditar
                      bImprimir := False;
                    end
                  else
                    sTexto := 'El contrato tiene una deuda de $ ' + CurrToStr(Deuda) + '. ';
                  end;
            end;
        end;

      if sTexto <> '' then
        begin
          bImprimir := (MsgBox(sTexto + '¿Desea emitir el libre deuda?', MB_ICONQUESTION + MB_YESNO) = mrYes);

          sObservaciones := TStringList.Create;
          try
            InputMemoBox('Observaciones', sObservaciones, False, 250);
            Observaciones := sObservaciones.Text;
            if StrRight(Observaciones, 2) = #13#10 then
              Observaciones := StrLeft(Observaciones, Length(Observaciones)-2);
          finally
            sObservaciones.Free;
          end;

          if bImprimir then
            CodEstado := '001'   // Emitido
          else if bReclamosAfip then
            CodEstado := '004'   // Reclamo AFIP
          else
            CodEstado := '005';  // Deuda
        end;
    finally
      Free;
    end;

  Result := bImprimir;
end;

function ValidarContratoLibreDeuda(Contrato: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ACO_CONTRATO ' +
           'WHERE CO_CONTRATO = :Contrato ' +
             'AND (CO_ESTADO = ''1'' ' +
                  'OR (CO_ESTADO = ''6'' AND CO_MOTIVOBAJA IN (''07'', ''08'')))';
  Verificar(not ExisteSqlEx(sSql, [Contrato]), nil, 'El contrato no se encuentra en el estado apropiado para realizar esta operación.');

  Result := True;
end;

procedure DoImprimirLibreDeuda(Contrato: Integer);
var
  sObservaciones, sCodEstado: String;
  Id: TTableId;
begin
  if ValidarContratoLibreDeuda(Contrato) then
    if MsgBox('¿Confirma la impresión del libre deuda?', MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
        sCodEstado     := '';
        sObservaciones := '';

        if ValidarLibreDeuda(Contrato, sCodEstado, sObservaciones) then
          begin
            BeginTrans;
            try
              Id := DoGrabarLibreDeuda(Contrato, sCodEstado, sObservaciones);

              if not PrepararLibreDeuda(Contrato, Id) then
                begin
                  RollBack;
                  MsgBox('No se ha podido generar el libre deuda pues faltan datos para generar correctamente el reporte', MB_ICONEXCLAMATION + MB_OK);
                end
              else
                begin
                  DoImprimirEstadoCuentaLD(Contrato, Id);
                  CommitTrans;
                end;
            except
              on E: Exception do
                begin
                  ErrorMsg( E, 'Error al grabar el libre deuda' );
                  RollBack;
                end;
            end;
          end;
      end;
end;

procedure DoImprimirEstadoCuentaLD(Contrato: Integer; Id: TTableId);
var
  sParametros, sTipoEstCta, sTipoResumen: String;
  bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra: Boolean;
  bConPreview: Boolean;
begin
  sParametros := Get_Parametros_EstadoCuentaCC;   // se imprimi el mismo estado de cuenta que el de la carta comercial
  Get_Parametros_EstadoCuentaCartaComercial(sParametros, sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview);

  Generar_EstadoCuenta(sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview, Contrato, False, True, Id, taLibreDeuda);
end;

function Get_NombreEntidadComercial(Contrato: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT EN_NOMBRE ATENCIONCOMERCIAL ' +
            'FROM XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, AVC_VENDEDORCONTRATO ' +
           'WHERE EN_ID = EV_IDENTIDAD ' +
             'AND EV_ID = VC_IDENTIDADVEND ' +
             'AND VC_VIGENCIAHASTA IS NULL ' +
             'AND VC_CONTRATO = ' + SqlValue(Contrato) + ' ' +
             'AND VC_ID = ART.COMISION.GET_ULTIDENTIDADVENDCONTRATO(VC_CONTRATO, NULL, ''S'', TO_CHAR(SYSDATE, ''YYYYMM''))';

  Result := ValorSql( sSql );
end;

procedure Get_NombreEntidadVendedor(Contrato: Integer; var NomEntidad, NomVendedor: String);
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT DECODE(EN_CODBANCO, ''172'', EN_CODBANCO, EN_NOMBRE) EN_NOMBRE, ' +  // 20/05/07, por pedido de MClerici
                 'DECODE(EN_CODBANCO, ''172'', VE_VENDEDOR, VE_NOMBRE) VE_NOMBRE ' +
            'FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, AVC_VENDEDORCONTRATO ' +
           'WHERE EV_IDENTIDAD = EN_ID ' +
             'AND VC_IDENTIDADVEND = EV_ID ' +
             'AND EV_IDVENDEDOR = VE_ID ' +
             'AND VC_CONTRATO = ' + SqlValue(Contrato) + ' ' +
             'AND VC_ID = ART.COMISION.GET_ULTIDENTIDADVENDCONTRATO(VC_CONTRATO, NULL, ''N'', TO_CHAR(SYSDATE, ''YYYYMM''))';

  SqlResults := ValoresColSql( sSql );
  try
    NomEntidad  := SqlResults[0];
    NomVendedor := SqlResults[1];
  finally
    SqlResults.Free;
  end;
end;

function Get_JuicioParteActoraDescr(Contrato: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT ''JA Nº '' || jt_numerocarpeta || '' - '' || ej_descripcion || '' - '' || jt_demandante || '' C/ '' || jt_demandado ' +
       '|| '' - JUZGADO: '' || jz_descripcion ' +
  'FROM aco_contrato, legales.ljt_juicioentramite, legales.lej_estadojuicio, legales.ljz_juzgado, legales.lod_origendemanda ' +
 'WHERE jt_estadomediacion LIKE ''%A%'' ' +
   'AND jt_idestado = ej_id ' +
   'AND jt_idjuzgado = jz_id ' +
   'AND jt_id = od_idjuicioentramite ' +
   'AND od_fechabaja IS NULL ' +
   'AND od_contrato = co_contrato ' +
   'AND co_motivobaja = ''08'' ' +
   'AND od_contrato = :Contrato ' +
 'ORDER BY jt_id DESC';

  Result := ValorSqlEx( sSql, [Contrato] );
end;

end.

