unit unfraInfoEmpresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, unArt, unArtFrame;

type
  TfraInfoEmpresa = class(TArtFrame)
    lbl_0: TLabel;
    lbl_2: TLabel;
    lbl_1: TLabel;
    lbl_4: TLabel;
    lbl_7: TLabel;
    lbl_5: TLabel;
    lblAdic_1: TLabel;
    lblAdic_2: TLabel;
    lblAdic_4: TLabel;
    lblAdic_5: TLabel;
    lblAdic_6: TLabel;
    lblAdic_8: TLabel;
    lbl_8: TLabel;
    lbl_6: TLabel;
    lblAdic_7: TLabel;
    lblAdic_3: TLabel;
    lbl_3: TLabel;
    lblAdic_0: TLabel;
    lbl_9: TLabel;
    lblAdic_9: TLabel;
    lbl_10: TLabel;
    lblAdic_10: TLabel;
    lbl_11: TLabel;
    lblAdic_11: TLabel;
    procedure CargarAdicionales(Sender: TObject); virtual;
    procedure ManEjecutivo(Sender: TObject);
    procedure ManGestorEstudio(Sender: TObject);
    procedure lblAdic_10Click(Sender: TObject);
  private
    FVerSinCompensados: Boolean;
    FVerCartasImpresas: Boolean;
    FDescrTipoRegimenAfi: String;
    procedure SetVerSinCompensados(const Value: Boolean);
    procedure SetVerCartasImpresas(const Value: Boolean);
  protected
    FContrato: Integer;
    fCuit      : string;
    FVerHoldingTemporal: Boolean;
    procedure CargarLabel( Lbl: TLabel; Texto: string; Reemplazo: string; Default: string = '');
    procedure ClearControls; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CargarContrato(const aContrato: Integer; const aCuit: String); virtual;
    procedure Clear; override;
    property VerSinCompensados:   Boolean      read FVerSinCompensados      write SetVerSinCompensados Default True;
    property VerCartasImpresas:   Boolean      read FVerCartasImpresas      write SetVerCartasImpresas Default True;
    property VerHoldingTemporal:  Boolean      read FVerHoldingTemporal     write FVerHoldingTemporal  Default True;
    property DescrTipoRegimenAfi: String       read FDescrTipoRegimenAfi;
  end;

implementation

uses
  unDmPrincipal, unConsultasAdicionales, AnsiSql, unEjecutivoCuenta, unGestorCuenta, sdEngine, unComunes,
  CustomDlgs, Numeros, unAgendaVistaEmpresa, General, unAfiliaciones;

{$R *.DFM}

procedure TfraInfoEmpresa.CargarAdicionales(Sender: TObject);
var
  Nombre: String;
  Nrolbl: Integer;
begin
  //Sale si no hay ninguna empresa seleccionada
  Verificar((FContrato < 1), nil, 'Debe elegir una empresa.');

  // Obtengo el identificador
  Nombre := (Sender as TLabel).Name;
  Nrolbl := StrToInt(Copy(Nombre, Length(Nombre), 1));

  with TfrmConsultasAdicionales.Create(Self) do
    try
      case Nrolbl of
        0:
        begin
          Caption := 'Vendedores y conceptos relacionados con la Empresa';
          SetLength(NombreCampos, 16);
          NombreCampos[0]  := 'Contrato';
          NombreCampos[1]  := 'Cód. Ent.';
          NombreCampos[2]  := 'Nombre Entidad';
          NombreCampos[3]  := 'Cód. Vend.';
          NombreCampos[4]  := 'Nombre Vendedor';
          NombreCampos[5]  := 'Sucursal';
          NombreCampos[6]  := 'Concepto';
          NombreCampos[7]  := 'Vig. Desde';
          NombreCampos[8]  := 'Vig. Hasta';
          NombreCampos[9]  := 'Porc.';
          NombreCampos[10] := 'Principal';
          NombreCampos[11] := 'Visible';
          NombreCampos[12] := 'Ejecutivo';
          NombreCampos[13] := 'Carta Nombramiento';
          NombreCampos[14] := 'ID';               // no se muestra en la grilla
          NombreCampos[15] := 'FECHA BAJA';       // no se muestra en la grilla
          CAMPOBAJA        := '';

          Sql := 'SELECT VC_CONTRATO, EN_CODBANCO, EN_NOMBRE, ' +
                        'VE_VENDEDOR VENDEDOR, VE_NOMBRE NOM_VENDEDOR, ' +
                        'SU_DESCRIPCION SUCURSAL, CO_DESCRIPCION CONCEPTO, ' +
                        'VC_VIGENCIADESDE, VC_VIGENCIAHASTA, VC_PORCCOMISION, ' +
                        'VC_PRINCIPAL, VC_VISIBLE, EC_NOMBRE, VC_NOMBRAMIENTO, VC_ID, ' +
                        'VC_FECHABAJA ' +
                   'FROM ASU_SUCURSAL, AEC_EJECUTIVOCUENTA, XCO_CONCEPTO, XEN_ENTIDAD, XVE_VENDEDOR, ' +
                        'XEV_ENTIDADVENDEDOR, AVC_VENDEDORCONTRATO ' +
                  'WHERE EV_IDENTIDAD = EN_ID ' +
                    'AND EV_IDVENDEDOR = VE_ID ' +
                    'AND VC_IDENTIDADVEND = EV_ID ' +
                    'AND VC_FECHABAJA IS NULL ' +
                    'AND EN_IDEJECUTIVO = EC_ID(+) ' +
                    'AND SU_ID(+) = VC_IDSUCURSAL ' +
                    'AND CO_ID = VC_IDCONCEPTO ' +
                    'AND VC_CONTRATO = ' + SqlValue(FContrato) + ' ' +
                  'ORDER BY 8 DESC';
        end;

        4:
        begin
          Caption := 'Empresas pertenecientes al Holding';
          SetLength(NombreCampos, 6);
          NombreCampos[0] := 'Contrato';
          NombreCampos[1] := 'Cuit';
          NombreCampos[2] := 'Razón Social';
          NombreCampos[3] := 'Vig. Desde';
          NombreCampos[4] := 'Vig. Hasta';
          NombreCampos[5] := 'Estado';
          CAMPOBAJA       := '';

          Sql :=
          	'SELECT CO_CONTRATO, EM_CUIT, EM_NOMBRE, CO_VIGENCIADESDE, CO_VIGENCIAHASTA,' +
            			' AFILIACION.MSG_COBERTURAACTIVO(CO_CONTRATO) AS ESTADO' +
             ' FROM ACO_CONTRATO, AEM_EMPRESA' +
            ' WHERE CO_IDEMPRESA = EM_ID' +
            	' AND EM_IDGRUPOECONOMICO = (SELECT EM_IDGRUPOECONOMICO' +
              										' FROM AEM_EMPRESA' +
                                 ' WHERE EM_CUIT = ' + SqlValue(fCuit) + ')';
        end;

        5,6:
        begin
          if Nrolbl = 5 then
            Caption := 'Datos Referentes a Concursos'
          else
            Caption := 'Datos Referentes a Quiebras';
          SetLength(NombreCampos, 28);
          NombreCampos[0]  := 'Nro. Orden';
          NombreCampos[1]  := 'Cuit';
          NombreCampos[2]  := 'Razón Social';
          NombreCampos[3]  := 'Deuda Nominal';
          NombreCampos[4]  := 'Deuda Total';
          NombreCampos[5]  := 'Deuda Verificada';
          NombreCampos[6]  := 'F. Concurso';
          NombreCampos[7]  := 'F. Quiebra';
          NombreCampos[8]  := 'F. Asignación';
          NombreCampos[9]  := 'F. Vto. Art.32';
          NombreCampos[10] := 'F. Vto. Art.200';
          NombreCampos[11] := 'Síndico';
          NombreCampos[12] := 'Dirección';
          NombreCampos[13] := 'Localidad';
          NombreCampos[14] := 'Teléfono';
          NombreCampos[15] := 'Juzgado';
          NombreCampos[16] := 'Secretaría';
          NombreCampos[17] := 'Fuero';
          NombreCampos[18] := 'Jurisdicción';
          NombreCampos[19] := 'Desc. Jurisdicción';
          NombreCampos[20] := 'Abogado';
          NombreCampos[21] := 'Monto Homologado';
          NombreCampos[22] := 'Estado';
          NombreCampos[23] := 'Autorización';
          NombreCampos[24] := 'Ult. Período Concursado';
          NombreCampos[25] := 'Ult. Período Quiebra';
          NombreCampos[26] := 'Legajo';
          NombreCampos[27] := 'Ult. Evento';
          CAMPOBAJA        := '';

          Sql := 'SELECT CQ_NROORDEN, CQ_CUIT, EM_NOMBRE, CQ_DEUDANOMINAL, CQ_DEUDATOTAL, CQ_DEUDAVERIFICADA, CQ_FECHACONCURSO,' +
                  '       CQ_FECHAQUIEBRA, CQ_FECHAASIGN, CQ_FECHAVTOART32, CQ_FECHAVTOART200, CQ_SINDICO, CQ_DIRECCIONSIND,' +
                  '       CQ_LOCALIDADSIND, CQ_TELEFONOSIND, CQ_JUZGADO, CQ_SECRETARIA, FUE.TB_DESCRIPCION FUE_DESCRIPCION,' +
                  '       CQ_JURISDICCION, JUR.TB_DESCRIPCION JUR_DESCRIPCION, BO_NOMBRE, CQ_MONTOHOMOLOG, ' +
                  '       EST.TB_DESCRIPCION EST_ESTADO, CQ_AUTORIZACION, CQ_ULTPERCONCURSO, CQ_ULTPERQUIEBRA, CQ_LEGAJO,' +
                  '       EVE.TB_DESCRIPCION ULTIMO_EVENTO' +
                  '  FROM CTB_TABLAS EVE, CTB_TABLAS FUE, CTB_TABLAS EST, CTB_TABLAS JUR, AEM_EMPRESA, LBO_ABOGADOS,' +
                  '       LCQ_CONCYQUIEBRA' +
                  ' WHERE CQ_FUERO = FUE.TB_CODIGO (+)' +
                  '   AND CQ_JURISDICCION = JUR.TB_CODIGO (+)' +
                  '   AND CQ_CUIT = EM_CUIT (+)' +
                  '   AND CQ_ABOGADO = BO_CODIGO (+)' +
                  '   AND CQ_ESTADO = EST.TB_CODIGO' +
                  '   AND LEGALES.GET_MAXEVENTOCQ( CQ_NROORDEN ) = EVE.TB_CODIGO (+)' +
                  '   AND EST.TB_CLAVE(+) = ''ESTCQ''' +
                  '   AND FUE.TB_CLAVE(+) = ''FUERO''' +
                  '   AND JUR.TB_CLAVE(+) = ''JURIS''' +
                  '   AND EVE.TB_CLAVE(+) = ''EVCYQ''' +
                  '   AND CQ_CUIT = ' + SqlValue(fCuit) +
                  '   AND CQ_ESTADO <> ''06''' +
                  '       ORDER BY EM_NOMBRE DESC ';
        end;

        7:
        begin
          Caption := 'Contratos anteriores correspondientes al mismo Cuit';
          SetLength(NombreCampos, 7);
          NombreCampos[0] := 'Contrato';
          NombreCampos[1] := 'Cuit';
          NombreCampos[2] := 'Razón Social';
          NombreCampos[3] := 'Vig. Desde';
          NombreCampos[4] := 'Vig. Hasta';
          NombreCampos[5] := 'Estado';
          NombreCampos[6] := 'Deuda';
          CAMPOBAJA       := '';

          Sql := 'SELECT CO_CONTRATO, EM_CUIT, EM_NOMBRE, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
                  '       AFILIACION.MSG_COBERTURAACTIVO( CO_CONTRATO ) AS ESTADO, DEUDA.GET_DEUDATOTALCONSOLIDADA( CO_CONTRATO ) ' +
                  '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                  ' WHERE CO_IDEMPRESA = EM_ID ' +
                  '   AND EM_CUIT = ' + SqlValue(fCuit) +
                  '   AND CO_CONTRATO < ' + SqlValue(FContrato);
        end;

        8:
        begin
          Caption := 'Cartas Emitidas correspondientes al área de Cobranzas' {$IFDEF COMERCIAL} + ' y Afiliaciones' {$ENDIF};
          tbImprimirCarta.Visible := True;
          SetLength(NombreCampos, 19);
          NombreCampos[0]  := 'Nº. Carta Doc.';
          NombreCampos[1]  := 'Nombre';
          NombreCampos[2]  := 'Correo';
          NombreCampos[3]  := 'Observaciones';
          NombreCampos[4]  := 'Usu. Imp.';
          NombreCampos[5]  := 'Fecha Imp.';
          NombreCampos[6]  := 'Usu. ReImp.';
          NombreCampos[7]  := 'Fecha ReImp.';
          NombreCampos[8]  := 'Recepción';
          NombreCampos[9]  := 'Fecha Recep.';
          NombreCampos[10] := 'Tipo Recepción';
          NombreCampos[11] := 'Fecha Baja';
          NombreCampos[12] := 'Usu. Baja';
          NombreCampos[13] := 'ID de la carta';
          NombreCampos[14] := 'Ventanilla';
          NombreCampos[15] := 'Descr. Ventanilla';
          NombreCampos[16] := 'Ult. Estado Envío Ventanilla';
          NombreCampos[17] := 'Ult. F. Estado Envío Ventanilla';
          NombreCampos[18] := 'Tipo Salida';
          CAMPOBAJA        := 'CA_FECHABAJA';

          Sql := 'SELECT CA_NROCARTADOC, TC_NOMBRE, ' +
                         'CORREO.TB_DESCRIPCION CORREO, CA_OBSERVACIONES, ' +
                         'CA_USUIMPRESION UIMPRESION, TRUNC(CA_FECHAIMPRESION) FIMPRESION, ' +
                         'CA_USUREIMPRESION UREIMPRESION, TRUNC(CA_FECHAREIMPRESION) FREIMPRESION, ' +
                         'CA_RECEPCIONOK, CA_FECHARECEPCION, CODRE.TB_DESCRIPCION, ' +
                         'CA_FECHABAJA, CA_USUBAJA, CA_ID, NVL(CA_VENTANILLA, ''N'') CA_VENTANILLA, ' +
                         'DECODE(NVL(CA_VENTANILLA, ''N''), ''S'', ''Sí'', ''N'', ''No'', ''P'', ''Pendiente Envío'', ''E'', ''Enviada'') DESCR_VENTANILLA, ' +
                         'SRT.UTILES.GET_ULTESTADOCARTAVENTANILLA(CA_ID) ULTESTADOCARTAVENTANILLA, ' +
                         'SRT.UTILES.GET_ULTFESTADOCARTAVENTANILLA(CA_ID) ULTFESTADOCARTAVENTANILLA, ' +
                         'SALIDA.TB_DESCRIPCION DESCR_TIPOSALIDA ' +
                    'FROM CTB_TABLAS SALIDA, CTB_TABLAS CODRE, CTB_TABLAS CORREO, CTC_TEXTOCARTA, AEN_ENDOSO, ' +
                         'CAT_AREATEXTO, CCA_CARTA ' +
                   'WHERE CA_IDENDOSO = EN_ID ' +
                     'AND CA_IDAREATEXTO = AT_ID ' +
                     'AND CA_FECHAIMPRESION IS NOT NULL ' +
                     'AND CA_FECHABAJA IS NULL ' +
                     'AND CA_IDTEXTOCARTA = TC_ID ' +
                     'AND CORREO.TB_CLAVE(+) = ''CORRE'' ' +
                     'AND NVL(CA_CORREOREIMPRESION, CA_CORREO) = CORREO.TB_CODIGO(+) ' +
                     'AND CODRE.TB_CLAVE(+) = ''CODRE'' ' +
                     'AND CA_CODRECEPCION = CODRE.TB_CODIGO(+) ' +
                     'AND SALIDA.TB_CLAVE = ''TSCDO'' ' +
                     'AND SALIDA.TB_CODIGO = CA_TIPOSALIDA ' +
                     'AND EN_CONTRATO = ' + SqlValue(FContrato) + ' ' +
                     'AND '''' || AT_AREA IN (' + SqlValue(AREA_COB) {$IFDEF COMERCIAL} + ', ' + SqlValue(AREA_AFI) {$ENDIF} + ') ' +
                   'ORDER BY NVL(CA_FECHAIMPRESION, CA_FECHAALTA) DESC, CA_NROCARTADOC';
        end;

        9:
        begin
          Caption := 'Siniestros Compensados';
          SetLength(NombreCampos, 5);
          NombreCampos[0] := 'Expediente';
          NombreCampos[1] := 'Nro. Liq.';
          NombreCampos[2] := 'CUIL';
          NombreCampos[3] := 'Trabajador';
          NombreCampos[4] := 'Importe';
          CAMPOBAJA       := '';

          Sql := 'SELECT SUBSTR(UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA), 1, 17), '+
                        'LE_NUMLIQUI, EX_CUIL, TJ_NOMBRE, LE_IMPORPERI ' +
                   'FROM CTJ_TRABAJADOR, SLE_LIQUIEMPSIN, SEX_EXPEDIENTES ' +
                  'WHERE EX_SINIESTRO=LE_SINIESTRO ' +
                    'AND EX_ORDEN=LE_ORDEN ' +
                    'AND EX_RECAIDA=LE_RECAIDA ' +
                    'AND EX_CUIL=TJ_CUIL ' +
                    'AND ''''||LE_ESTADO=''P'' ' +
                    'AND LE_IMPORPERI>0 ' +
                    'AND LE_FAPROBADO IS NOT NULL ' + 
                    'AND AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE)=' + SqlValue(FContrato) + ' ' +
                    'AND EX_CUIT=' + SqlValue( fCuit );
        end;

        else
          Exit;
      end;

      Tipo     := Nrolbl;
      Contrato := FContrato;

      MostrarConsulta;
    finally
      Free;
    end;
end;

constructor TfraInfoEmpresa.Create(AOwner: TComponent);
begin
  inherited;

  FVerSinCompensados := True;
  FVerCartasImpresas := True;
end;

procedure TfraInfoEmpresa.ManEjecutivo(Sender: TObject);
begin
  //Sale si no hay ninguna empresa seleccionada
  Verificar((FContrato < 1), nil, 'Debe elegir una empresa.');

  //Muestra la pantalla del ejecutivo
  with TfrmEjecutivoCuenta.Create(Self) do
    try
      DoCargarDatos(FContrato);
      ShowModal;
    finally
      Free;
    end;
  CargarContrato(FContrato, fCuit);
end;

procedure TfraInfoEmpresa.ManGestorEstudio(Sender: TObject);
var
  EsEstudio: boolean;
begin
  Verificar((FContrato < 1), nil, 'Debe elegir una empresa.');

  //Muestra la pantalla del gestor
  EsEstudio := ((Sender as TLabel).Name = 'lblAdic_3');
  with TfrmGestorCuenta.Create(Self) do
    try
      DoCargarDatos(FContrato, EsEstudio);
      ShowModal;
    finally
      Free;
    end;
  CargarContrato(FContrato, fCuit);
end;

procedure TfraInfoEmpresa.CargarContrato(const aContrato: Integer; const aCuit: String);
var
  CartasImpresas: String;
  ContratosAnteriores: String;
  Query: TSDquery;
  SiniestrosCompensados: string;
  sSql: String;
begin
  FContrato := aContrato;
  fCuit     := aCuit;

  if (FContrato < 1) or (fCuit = '') then
  begin
    ClearControls;
    raise Exception.Create('Los datos son incorrectos.');
  end;

  sSql :=
  	'SELECT NVL(GES.GC_NOMBRE, ''-'') GESTOR, NVL(EST.GC_NOMBRE, ''SIN ESTUDIO'') ESTUDIO, CO_IDFORMULARIO,' +
    			' NVL(EC_NOMBRE, ''-'') EC_NOMBRE, GE_DESCRIPCION AS HOLDING,' +
          ' AS_NOMBRE || '' (int. '' || AS_INTERNO || '')'' ASESOR, LEGALES.GET_FECHACONCURSO(EM_CUIT) AS CONCURSO,' +
          ' UTILES.PERIODO_PONERBARRA(LEGALES.GET_PERIODOCONCURSO(EM_CUIT)) AS PERCONCURSO,' +
          ' LEGALES.GET_FECHAQUIEBRA(EM_CUIT) AS QUIEBRA,' +
          ' UTILES.PERIODO_PONERBARRA(LEGALES.GET_PERIODOQUIEBRA(EM_CUIT)) AS PERQUIEBRA, ' +
          ' GE_TEMPORAL ' +
     ' FROM IAS_ASESOREMISION, AEM_EMPRESA, ACO_CONTRATO, AGC_GESTORCUENTA GES, AGC_GESTORCUENTA EST,' +
     			' AEC_EJECUTIVOCUENTA, AGE_GRUPOECONOMICO' +
    ' WHERE EM_ID	          	 	= CO_IDEMPRESA' +
    	' AND CO_IDGESTOR     	 	= GES.GC_ID(+)' +
      ' AND CO_IDESTUDIO    	 	= EST.GC_ID(+)' +
      ' AND CO_IDEJECUTIVO  	 	= EC_ID(+)' +
      ' AND EM_IDGRUPOECONOMICO = GE_ID(+)' +
      ' AND CO_IDASESOREMISION 	= AS_ID(+)' +
      ' AND CO_CONTRATO     	 	= ' + SqlValue(FContrato);
  Query := GetQuery(sSql);
  try
    if not Query.Eof then
    begin
      //////////
      //Contratos Anteriores
      //////////
      sSql := 'SELECT COUNT(*) ' +
                'FROM ACO_CONTRATO AC ' +
               'WHERE AC.CO_CONTRATO < ' + SqlValue(FContrato) + ' ' +
                 'AND AC.CO_IDEMPRESA = (SELECT ACO.CO_IDEMPRESA ' +
                                          'FROM ACO_CONTRATO ACO ' +
                                         'WHERE ACO.CO_CONTRATO = ' + SqlValue(FContrato) + ')';
      ContratosAnteriores := ValorSql( sSql );

      ///////////
      //Cantidad de Cartas
      ///////////
      if FVerCartasImpresas then
        begin
          sSql := 'SELECT COUNT(*) ' +
                    'FROM AEN_ENDOSO, CAT_AREATEXTO, CCA_CARTA ' +
                   'WHERE CA_IDENDOSO = EN_ID ' +
                     'AND CA_IDAREATEXTO = AT_ID ' +
                     'AND CA_FECHAIMPRESION IS NOT NULL ' +
                     'AND CA_FECHABAJA IS NULL ' +
                     'AND EN_CONTRATO = ' + SqlValue(FContrato) + ' ' +
                     'AND '''' || AT_AREA IN (' + SqlValue(AREA_COB) + {$IFDEF COMERCIAL} ', ' + SqlValue(AREA_AFI) + {$ENDIF} ') ';
          CartasImpresas := ValorSql(sSql);
        end
      else
        CartasImpresas := '---';

      ///////////
      //Cantidad de Siniestros Compensados
      ///////////
      { by NWK, 31/01/2006, por pedido de JBalestrini, como tarda mucho, no se muestra la cant. de sin. compensados
      sSql := 'SELECT COUNT(*) '+
                'FROM SLE_LIQUIEMPSIN, SEX_EXPEDIENTES ' +
               'WHERE EX_SINIESTRO=LE_SINIESTRO ' +
                 'AND EX_ORDEN=LE_ORDEN ' +
                 'AND EX_RECAIDA=LE_RECAIDA ' +
                 'AND ''''||LE_ESTADO=''P'' ' +
                 'AND LE_IMPORPERI>0 ' +
                 'AND LE_FAPROBADO IS NOT NULL ' +
                 'AND AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE)=' + SqlValue(FContrato) + ' ' +
                 'AND EX_CUIT=' + SqlValue( fCuit );
      SiniestrosCompensados := ValorSql( sSql );
      }
     {sSql := 'SELECT NVL(dato, ''Sin datos'') /*+ first_rows*/ ' +
                'FROM (SELECT ''Ver...'' AS dato ' +
                        'FROM sex_expedientes, sle_liquiempsin ' +
                       'WHERE ex_siniestro = le_siniestro ' +
                         'AND ex_orden = le_orden ' +
                         'AND ex_recaida = le_recaida ' +
                         'AND ''''||le_estado = ''P'' ' +
                         'AND le_imporperi > 0 ' +
                         'AND le_faprobado is not null ' +
                         'AND ex_cuit = :CUIT) ' +
               'WHERE ROWNUM = 1';}
      if FVerSinCompensados then
        begin
          sSql := 'SELECT NVL((SELECT ''Ver...'' ' +
                              'FROM DUAL ' +
                             'WHERE EXISTS(SELECT 1 ' +
                                            'FROM (SELECT '''' || le_estado a ' +
                                                    'FROM art.sex_expedientes, art.sle_liquiempsin ' +
                                                   'WHERE ex_siniestro = le_siniestro ' +
                                                     'AND ex_orden = le_orden ' +
                                                     'AND ex_recaida = le_recaida ' +
                                                     'AND le_imporperi > 0 ' +
                                                     'AND le_faprobado IS NOT NULL ' +
                                                     'AND ex_cuit = :CUIT) ' +
                                           'WHERE a = ''P'')), ' +
                           '''Sin datos'') ' +
                  'FROM DUAL';
          SiniestrosCompensados := ValorSqlEx(sSql, [fCuit], 'Sin datos');
        end
      else
        SiniestrosCompensados := '---';

      //Cargo los labels con la informacion
      lblAdic_1.Caption  := Query.FieldByName('EC_NOMBRE').AsString;
      lblAdic_2.Caption  := Query.FieldByName('GESTOR').AsString;
      lblAdic_3.Caption  := Query.FieldByName('ESTUDIO').AsString;
      //lblAdic_11.Caption := Query.FieldByName('ASESOR').AsString;

      // Pidio julia y grossi ge_temporal = T no ver el holding tk43559
      if FVerHoldingTemporal then
        CargarLabel(lblAdic_4, Query.FieldByName('HOLDING').AsString, '-')
      else
        if Query.FieldByName('GE_TEMPORAL').AsString <> 'T' then
          CargarLabel(lblAdic_4, Query.FieldByName('HOLDING').AsString, '-')
        else
          CargarLabel(lblAdic_4, '', '-');

      CargarLabel(lblAdic_5, Query.FieldByName('CONCURSO').AsString + ' (' + Query.FieldByName('PERCONCURSO').AsString + ')', '-', ' ()');
      CargarLabel(lblAdic_6, Query.FieldByName('QUIEBRA').AsString + ' (' + Query.FieldByName('PERQUIEBRA').AsString + ')', '-', ' ()');
      CargarLabel(lblAdic_7, ContratosAnteriores, '0', '0');
      CargarLabel(lblAdic_8, CartasImpresas, '0', '0');
      CargarLabel(lblAdic_9, SiniestrosCompensados, SiniestrosCompensados, 'Sin datos');
      CargarLabel(lblAdic_11, Query.FieldByName('ASESOR').AsString, Query.FieldByName('ASESOR').AsString, Query.FieldByName('ASESOR').AsString);

      FDescrTipoRegimenAfi := Get_DescrRegimenContratoAfi(FContrato);
    end
    else
      ClearControls;
  finally
    Query.Free;
  end;
end;

procedure TfraInfoEmpresa.CargarLabel( Lbl: TLabel; Texto: string; Reemplazo: string; Default: string = '');
begin
  if (Texto <> Default) then
  begin
    Lbl.Caption    := Texto;
    Lbl.Font.Color := clBlue;
    Lbl.Font.Style := [fsUnderline];
    Lbl.Cursor     := crHandPoint;
    Lbl.OnClick    := CargarAdicionales;
  end
  else
  begin
    Lbl.Caption    := Reemplazo;
    Lbl.Font.Color := clBlack;
    Lbl.Font.Style := [];
    Lbl.Cursor     := crArrow;
    Lbl.OnClick    := nil;
  end;

  if (Texto <> Default) and (Texto <> 'Ver...') then
  begin
    Lbl.ShowHint := True;
    Lbl.Hint     := Texto;
  end else
  begin
    Lbl.ShowHint := False;
    Lbl.Hint     := '';
  end;
end;

procedure TfraInfoEmpresa.ClearControls;
begin
  FContrato            := 0;
  fCuit                := '';
  FDescrTipoRegimenAfi := '';

  lblAdic_1.Caption := 'Ver...';
  lblAdic_2.Caption := 'Ver...';
  lblAdic_3.Caption := 'Ver...';

  CargarLabel( lblAdic_4, 'Ver...', '');
  CargarLabel( lblAdic_5, 'Ver...', '');
  CargarLabel( lblAdic_6, 'Ver...', '');
  CargarLabel( lblAdic_7, 'Ver...', '');
  CargarLabel( lblAdic_8, 'Ver...', '');
  CargarLabel( lblAdic_9, 'Ver...', '');
  CargarLabel( lblAdic_11, 'Ver...', '');
end;

procedure TfraInfoEmpresa.Clear;
begin
  ClearControls;
end;

procedure TfraInfoEmpresa.lblAdic_10Click(Sender: TObject);
begin
  Verificar((FContrato < 1), nil, 'Debe elegir una empresa.');
  DoMostrarEventosAgenda(Self.FContrato);
end;

procedure TfraInfoEmpresa.SetVerSinCompensados(const Value: Boolean);
begin
  FVerSinCompensados := Value;
end;

procedure TfraInfoEmpresa.SetVerCartasImpresas(const Value: Boolean);
begin
  FVerCartasImpresas := Value;
end;

end.

