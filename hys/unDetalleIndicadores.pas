unit unDetalleIndicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, PeriodoPicker;

type
  TfrmDetalleIndicadores = class(TfrmCustomConsulta)
    fraPreventorFiltro: TfraCodigoDescripcion;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    Label1: TLabel;
    cbTercerizado: TCheckBox;
    cbNoTercerizado: TCheckBox;
    chkSinPreventor: TCheckBox;
    Label2: TLabel;
    edMesHasta: TPeriodoPicker;
    Label3: TLabel;
    edMes: TPeriodoPicker;
    Label4: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure edMesChange(Sender: TObject);
  private
    { Private declarations }
    FTipo : Integer;
    function ArmarWhere: String;
  public
    { Public declarations }
    procedure CargarDatos(iTipo : Integer);
    procedure CargarFiltros(vPreventor, vCoordinador: Integer; bIncluirSinPreventor, bPropio, bTerceros : Boolean;
                            sMes, sMesHasta : String);
  end;

var
  frmDetalleIndicadores: TfrmDetalleIndicadores;

implementation

{$R *.dfm}
uses AnsiSql, CustomDlgs, General, unDmPrincipal;

procedure TfrmDetalleIndicadores.CargarDatos(iTipo : Integer);
begin
  FTipo := iTipo;                           
  tbRefrescarClick(nil);
end;

procedure TfrmDetalleIndicadores.CargarFiltros(vPreventor, vCoordinador: Integer; bIncluirSinPreventor, bPropio, bTerceros : Boolean;
                                               sMes, sMesHasta : String);
begin
  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraCoordinadorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraCondition := ' AND IT_IDROLPREVENTOR >= 5 '; 
  end;
  fraPreventorFiltro.Value   := vPreventor;
  fraCoordinadorFiltro.Value := vCoordinador;
  chkSinPreventor.Checked    := bIncluirSinPreventor;
  cbNoTercerizado.Checked    := bPropio;
  cbTercerizado.Checked      := bTerceros;
  edMes.Text                 := sMes;
  edMesHasta.Text            := sMesHasta;
end;

Function TfrmDetalleIndicadores.ArmarWhere : String;
var
  sWhere : String;
  sWhereInterno : String;
begin
  sWhere := '';
  sWhereInterno := '';
  case FTipo of
    0:
    begin
      if chkSinPreventor.Checked then
      begin
        sWhere := sWhere + ' AND it_id(+) = ps_idpreventor ';
//                       ' AND it_fechabaja(+) IS NULL ';
      end
      else begin
        sWhere := sWhere + '  AND it_id = ps_idpreventor ' +
                       '  AND it_fechabaja IS NULL ';
      end;
      if (edMes.Text <> '') and (edMes.Text = edMesHasta.Text) then
        sWhere := sWhere + ' AND pv_mes = ' + SqlValue(edMes.Text)
      else
      begin
        if edMes.Text <> '' then
          sWhere := sWhere + ' AND pv_mes >= ' + SqlValue(edMes.Text);
        if edMesHasta.Text <> '' then
          sWhere := sWhere + ' AND pv_mes <= ' + SqlValue(edMesHasta.Text);
      end;

      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = ' + SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);
      Result := sWhere;

    end;
    1:
    begin
      if chkSinPreventor.Checked then
      begin
        sWhere := sWhere + ' AND prev.it_id(+) = ps_idpreventor ';
//                       ' AND prev.it_fechabaja(+) IS NULL ';
      end
      else begin
        sWhere := sWhere + '  AND prev.it_id = ps_idpreventor   ' +
                       '  AND prev.it_fechabaja IS NULL ';
      end;
      if (edMes.Text <> '') and (edMes.Text = edMesHasta.Text) then
        sWhere := sWhere + ' AND pv_mes = ' + SqlValue(edMes.Text)
      else
      begin
        if edMes.Text <> '' then
          sWhere := sWhere + ' AND pv_mes >= ' + SqlValue(edMes.Text);
        if edMesHasta.Text <> '' then
          sWhere := sWhere + ' AND pv_mes <= ' + SqlValue(edMesHasta.Text);
      end;

      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND prev.it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND prev.it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND prev.it_id = ' + SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);
      Result := sWhere;
    end;
    2:
    begin
      if (edMes.Text <> '') and (edMes.Text = edMesHasta.Text) then
        sWhere := sWhere + ' AND pv_mes = ' + SqlValue(edMes.Text)
      else
      begin
        if edMes.Text <> '' then
          sWhere := sWhere + ' AND pv_mes >= ' + SqlValue(edMes.Text);
        if edMesHasta.Text <> '' then
          sWhere := sWhere + ' AND pv_mes <= ' + SqlValue(edMesHasta.Text);
      end;
      Result := sWhere;
    end;
    3:
    begin
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);

      Result := sWhere + sWhereInterno;
    end;
    4:
    begin
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes Desde.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');

      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_ID = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);

     Result := sWhere + sWhereInterno;
    end;
    5:
    begin
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes Desde.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_ID = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);
      Result := sWhere + sWhereInterno;
    end;
    6:
    begin
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes Desde.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);

      Result := sWhere + sWhereInterno;
    end;
    7:
    begin
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);

      Result := sWhere + sWhereInterno;
    end;
  end;
end;


procedure TfrmDetalleIndicadores.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql, sSelect, sFrom : String;
begin
  sWhere := ArmarWhere;
  case FTipo of
     0:
    begin
      sSql :=
         ' SELECT it_nombre AS "Preventor", em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato", '+
         '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
         '        CASE '+
         '          WHEN(ts_fechahasta < art.actualdate) '+
         '          AND (ts_cumplimiento IS NULL) THEN ''No Realizadas Vencidas'' '+
         '          WHEN ts_cumplimiento IN(''VA'', ''VN'') THEN ''Fuera de Término'' '+
         '          WHEN(ts_fechahasta >= art.actualdate) '+
         '          AND (ts_cumplimiento IS NULL) THEN ''Próximas a vencer'' '+
         '          ELSE ''En Término'' '+
         '        END AS "Resolución", '+
         '        ts_tarea AS "Tarea", ts_fechadesde AS "Fecha Desde", ts_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", '+
         '        tv_descripcion AS "Prioridad", TRUNC(vp_fechavisita) AS "Fecha Visita", '+
         '        TRUNC((SELECT MIN(rv_fecha) '+
         '                 FROM art.prv_resvisitas '+
         '                WHERE rv_fechabaja IS NULL '+
         '                  AND rv_idvisitaasociada IS NULL '+
         '                  AND em_cuit = rv_cuit '+
         '                  AND es_nroestableci = rv_estableci '+
         '                  AND rv_fecha BETWEEN ts_fechadesde AND ts_fechahasta)) AS "F.Visita en Período", '+
         '        ts_fechaalta AS "F. Alta Tarea" '+
         '   FROM art.pit_firmantes, afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, hys.hpv_procesovisita, hys.hts_tareahys, '+
         '        hys.hps_planhys, hys.hvp_visitapreventor, hys.htv_tipovisita '+
         '  WHERE ts_fechabaja IS NULL '+
         '    AND ps_fechabaja IS NULL '+
         '    AND ps_tipovisita IN(1) '+
         '    AND ps_visitaotroperiodo = ''N'' ' +
         '    AND ps_tipovisita = tv_id '+
         '    AND ts_idplan = ps_id '+
         '    AND pv_id = ps_idproceso '+
         '    AND ts_idvisitapreventor = vp_id(+) '+
         '    AND pv_tipoproceso = ''M'' '+
         '    AND ts_idtarea NOT IN(SELECT ta_id '+
         '                            FROM hys.hta_tarea '+
         '                           WHERE ta_complementaria = ''S'' '+
         '                             AND ta_fechabaja IS NULL) '+
         '    AND ps_idempresa = em_id '+
         '    AND ps_estableci = es_nroestableci '+
         '    AND em_id = co_idempresa '+
         '    AND co_contrato = es_contrato '+
         '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
         sWhere;
    end;
    1:
    begin
      sSql :=
        ' SELECT prev.it_nombre AS "Preventor", cor.it_nombre AS "Coordinador", em_cuit AS "CUIT", em_nombre AS "Razón Social", '+
        '        co_contrato AS "Contrato", es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        CASE '+
        '          WHEN(ts_fechahasta < art.actualdate) '+
        '          AND (ts_cumplimiento IS NULL) THEN ''No Realizadas Vencidas'' '+
        '          WHEN ts_cumplimiento IN(''VA'', ''VN'') THEN ''Fuera de Término'' '+
        '          WHEN(ts_fechahasta >= art.actualdate) '+
        '          AND (ts_cumplimiento IS NULL) THEN ''Próximas a vencer'' '+
        '          ELSE ''En Término'' '+
        '        END AS "Resolución", '+
        '        ts_tarea AS "Tarea", ts_fechadesde AS "Fecha Desde", ts_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", '+
        '        tv_descripcion AS "Prioridad", TRUNC(vp_fechavisita) AS "Fecha Visita", '+
        '        TRUNC((SELECT MIN(rv_fecha) '+
        '                 FROM art.prv_resvisitas '+
        '                WHERE rv_fechabaja IS NULL '+
        '                  AND rv_idvisitaasociada IS NULL '+
        '                  AND em_cuit = rv_cuit '+
        '                  AND es_nroestableci = rv_estableci '+
        '                  AND rv_fecha BETWEEN ts_fechadesde AND ts_fechahasta)) AS "F.Visita en Período", '+
        '        ts_fechaalta AS "F. Alta Tarea" '+
        '   FROM art.pit_firmantes prev, art.pit_firmantes cor, afi.aem_empresa, afi.aes_establecimiento, hys.hvp_visitapreventor, '+
        '        afi.aco_contrato, hys.hpv_procesovisita, hys.hts_tareahys, hys.hps_planhys, hys.htv_tipovisita '+
        '  WHERE prev.it_idsupervisor = cor.it_id(+) '+
        '    AND ps_idpreventor = prev.it_id(+) '+
        '    AND ts_idempresa = em_id '+
        '    AND ts_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND ts_idvisitapreventor = vp_id(+) '+
        '    AND ts_fechabaja IS NULL '+
        '    AND ps_fechabaja IS NULL '+
        '    AND ps_tipovisita IN(1) '+
        '    AND ps_visitaotroperiodo = ''N'' ' +
        '    AND ps_tipovisita = tv_id '+
        '    AND ts_idplan = ps_id '+
        '    AND pv_id = ps_idproceso '+
        '    AND pv_tipoproceso = ''M'' '+
        '    AND prev.it_idsupervisor = cor.it_id(+) '+
        '    AND ts_idtarea NOT IN(SELECT ta_id '+
        '                            FROM hys.hta_tarea '+
        '                           WHERE ta_complementaria = ''S'' '+
        '                             AND ta_fechabaja IS NULL) '+
        sWhere;
    end;
    2:
    begin
      sSql :=
       ' SELECT it_nombre AS "Preventor", em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato", '+
       '        ts_estableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
       '        CASE '+
       '          WHEN(ts_fechahasta < art.actualdate) '+
       '          AND (ts_cumplimiento IS NULL) THEN ''No Realizadas Vencidas'' '+
       '          WHEN ts_cumplimiento IN(''VA'', ''VN'') THEN ''Fuera de Término'' '+
       '          WHEN(ts_fechahasta >= art.actualdate) '+
       '          AND (ts_cumplimiento IS NULL) THEN ''Próximas a vencer'' '+
       '          ELSE ''En Término'' '+
       '        END AS "Resolución", '+
       '        ts_tarea AS "Tarea", ts_fechadesde AS "Fecha Desde", ts_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", '+
       '        tv_descripcion AS "Prioridad", TRUNC(vp_fechavisita) AS "Fecha Visita", '+
       '        TRUNC((SELECT MIN(rv_fecha) '+
       '                 FROM art.prv_resvisitas '+
       '                WHERE rv_fechabaja IS NULL '+
       '                  AND rv_idvisitaasociada IS NULL '+
       '                  AND em_cuit = rv_cuit '+
       '                  AND ts_estableci = rv_estableci '+
       '                  AND rv_fecha BETWEEN ts_fechadesde AND ts_fechahasta)) AS "F.Visita en Período", '+
       '        ts_fechaalta AS "F. Alta Tarea" '+
       '   FROM art.pit_firmantes, afi.aem_empresa, afi.aes_establecimiento, hys.hvp_visitapreventor, afi.aco_contrato, '+
       '        hys.hpv_procesovisita, hys.hts_tareahys, hys.hps_planhys, hys.htv_tipovisita '+
       '  WHERE ps_idpreventor = it_id '+
       '    AND ts_idempresa = em_id '+
       '    AND ts_estableci = es_nroestableci '+
       '    AND em_id = co_idempresa '+
       '    AND co_contrato = es_contrato '+
       '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
       '    AND ts_idvisitapreventor = vp_id(+) '+
       '    AND ts_fechabaja IS NULL '+
       '    AND ps_fechabaja IS NULL '+
       '    AND ps_tipovisita IN(1) '+
       '    AND ps_visitaotroperiodo = ''N'' ' +
       '    AND ts_idplan = ps_id '+
       '    AND pv_id = ps_idproceso '+
       '    AND pv_tipoproceso = ''M'' '+
       '    AND ts_idtarea NOT IN(SELECT ta_id '+
       '                            FROM hys.hta_tarea '+
       '                           WHERE ta_complementaria = ''S'' '+
       '                             AND ta_fechabaja IS NULL) '+sWhere;
    end;
    3, 7:
    begin
      sSelect := ', it_nombre AS "Preventor", art.hys.get_nombre_preventor_coord(it_codigo) "Coordinador" ';
      sfrom := ', art.pit_firmantes ';


      sSql :=
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        ''PRS'' AS "Tipo Medición", rv_fecha AS "Fecha Visita",'+
        '        rv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(rv_fecha),'+
        '        TRUNC(rv_fechaalta)) AS "Diferencia Días Habiles", ' +
        '        art.hys.get_tipo_estab_prev(em_cuit, es_nroestableci) "Tipo Estab. Prev.", art.hys.get_operativovigente_empresa(em_cuit) "Operativo" ' + sSelect +
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.prv_recvisitas'+ sFrom +
        '  WHERE rv_fechabaja IS NULL'+
        '    AND rv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'')'+
        '    AND rv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1 '+
        '    AND rv_cuit = em_cuit '+
        '    AND rv_estableci = es_nroestableci '+
        '    AND rv_tipo = ''ET'' ' +
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        iif(chkSinPreventor.Checked,' AND it_codigo(+) = art.hys.get_preventor_estab(rv_cuit, rv_estableci, rv_fechaalta) ',
            ' AND it_codigo = art.hys.get_preventor_estab(rv_cuit, rv_estableci, rv_fechaalta) AND it_fechabaja IS NULL ')+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        ''PAPE'' AS "Tipo", rv_fecha AS "Fecha Visita",'+
        '        rv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(rv_fecha),'+
        '        TRUNC(rv_fechaalta)) AS "Diferencia Días Habiles", ' +
        '        art.hys.get_tipo_estab_prev(em_cuit, es_nroestableci) "Tipo Estab. Prev.", art.hys.get_operativovigente_empresa(em_cuit) "Operativo" ' + sSelect +
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.prv_recvisitas' + sFrom +
        '  WHERE rv_fechabaja IS NULL'+
        '    AND rv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'')'+
        '    AND rv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1 '+
        '    AND rv_cuit = em_cuit '+
        '    AND rv_estableci = es_nroestableci '+
        '    AND rv_tipo = ''EP'' ' +
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        iif(chkSinPreventor.Checked,' AND it_codigo(+) = art.hys.get_preventor_estab(rv_cuit, rv_estableci, rv_fechaalta) ',
            ' AND it_codigo = art.hys.get_preventor_estab(rv_cuit, rv_estableci, rv_fechaalta) AND it_fechabaja IS NULL ')+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        ''PAL'' AS "Tipo",ps_fechavisita AS "Fecha Visita", '+
        '        ps_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(ps_fechavisita),'+
        '        TRUNC(ps_fechaalta)) AS "Diferencia Días Habiles", ' +
        '        art.hys.get_tipo_estab_prev(em_cuit, es_nroestableci) "Tipo Estab. Prev.", art.hys.get_operativovigente_empresa(em_cuit) "Operativo" ' + sSelect +
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, hys.hpa_pal, '+
        '        hys.hps_palseguimiento ' + sFrom +
        '  WHERE ps_fechabaja IS NULL '+
        '    AND ps_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') '+
        '    AND ps_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1 '+
        '    AND pa_id = ps_idpal '+
        '    AND pa_cuit = em_cuit '+
        '    AND pa_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        iif(chkSinPreventor.Checked,' AND it_codigo(+) = art.hys.get_preventor_estab(pa_cuit, pa_estableci, ps_fechaalta) ',
            ' AND it_codigo = art.hys.get_preventor_estab(pa_cuit, pa_estableci, ps_fechaalta) AND it_fechabaja IS NULL ')+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        ''Accidentes'' AS "Tipo Medición", sv_fecha AS "Fecha Visita", '+
        '        sv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(sv_fecha),'+
        '        TRUNC(sv_fechaalta)) AS "Diferencia Días Habiles", '  +
        '        art.hys.get_tipo_estab_prev(em_cuit, es_nroestableci) "Tipo Estab. Prev.", art.hys.get_operativovigente_empresa(em_cuit) "Operativo" ' + sSelect +
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.sex_expedientes, '+
        '        hys.hga_gestionaccidente, hys.pae_accidenteestablecimiento, hys.pmc_medidacorrectiva, hys.psv_seguimientovisita ' + sFrom +
        '  WHERE sv_fechabaja IS NULL '+
        '    AND sv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') '+
        '    AND sv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1'+
        '    AND mc_idaccidenteestablecimiento = ae_id '+
        '    AND sv_idmedidacorrectiva = mc_id '+
        '    AND ae_idexpediente = ex_id '+
        '    AND ex_cuit = em_cuit '+
        '    AND ae_nroestablecimiento = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) ' +
        '    AND ga_idexpediente = ae_idexpediente ' +
        '    AND ga_tipogestion = ''A'' ' +
        '    AND ga_fechabaja IS NULL ' +
        iif(chkSinPreventor.Checked,' AND it_id(+) = ga_idpreventor ',
            ' AND it_id = ga_idpreventor AND it_fechabaja IS NULL ')+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        ''Enfermedades'' AS "Tipo", sv_fecha AS "Fecha Visita", '+
        '        sv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(sv_fecha),'+
        '        TRUNC(sv_fechaalta)) AS "Diferencia Días Habiles", '  +
        '        art.hys.get_tipo_estab_prev(em_cuit, es_nroestableci) "Tipo Estab. Prev.", art.hys.get_operativovigente_empresa(em_cuit) "Operativo" ' + sSelect +
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.sex_expedientes, '+
        '        hys.hga_gestionaccidente, hys.pee_enfermedadestablecimiento, hys.pmc_medidacorrectivaenf, '+
        '        hys.psv_seguimientovisitaenf ' + sFrom +
        '  WHERE sv_fechabaja IS NULL '+
        '    AND sv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') '+
        '    AND sv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1'+
        '    AND mc_idenfermedadestablecimiento = ee_id '+
        '    AND sv_idmedidacorrectiva = mc_id '+
        '    AND ee_idexpediente = ex_id '+
        '    AND ex_cuit = em_cuit '+
        '    AND ee_nroestablecimiento = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND ga_idexpediente = ee_idexpediente ' +
        '    AND ga_tipogestion = ''E'' ' +
        '    AND ga_fechabaja IS NULL ' +
        iif(chkSinPreventor.Checked,' AND it_id(+) = ga_idpreventor ',
            ' AND it_id = ga_idpreventor AND it_fechabaja IS NULL ')+
        sWhere;
    end;
    4,5:
    begin
      sSql :=
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        it_nombre AS "Preventor", ps_tarea AS "Tarea", ps_fechadesde AS "Fecha Desde", '+
        '        ps_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", tv_descripcion AS "Prioridad", '+
        '        ps_estado AS "Estado" '+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.pit_firmantes, '+
        '        hys.htv_tipovisita, hys.hpv_procesovisita, hys.hps_planhys '+
        '  WHERE ps_fechabaja IS NULL '+
        '    AND pv_mes >= '+SqlValue(edMes.Text)+
        '    AND pv_mes <= '+SqlValue(edMesHasta.Text)+
        '    AND ps_idpreventor IS NOT NULL '+
        '    AND ps_estado <> ''N'' '+
        '    AND pv_id = ps_idproceso ' +
        '    AND tv_id = ps_tipovisita ' +
        '    AND ps_tipovisita = 1 '+
        '    AND pv_tipoproceso = ''M'' ' +
        '    AND ps_idempresa = em_id '+
        '    AND ps_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit)'+
        iif(chkSinPreventor.Checked,' AND it_id(+) = ps_idpreventor ', '  AND it_id = ps_idpreventor AND it_fechabaja IS NULL ')+
        //'    AND it_id ='+SqlValue(fraPreventorFiltro.Value)+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        it_nombre AS "Preventor", ps_tarea AS "Tarea", ps_fechadesde AS "Fecha Desde", '+
        '        ps_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", tv_descripcion AS "Prioridad", '+
        '        ps_estado AS "Estado" '+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.pit_firmantes, '+
        '        hys.htv_tipovisita, hys.hpv_procesovisita, hys.hps_planhys '+
        '  WHERE ps_fechabaja IS NULL '+
        '    AND pv_mes >= '+SqlValue(edMes.Text)+
        '    AND pv_mes <= '+SqlValue(edMesHasta.Text)+
        '    AND ps_idpreventor IS NOT NULL '+
        '    AND ps_estado <> ''N''  '+
        '    AND pv_id = ps_idproceso ' +
        '    AND tv_id = ps_tipovisita ' +
        '    AND ps_tipovisita = 2 '+
        '    AND pv_tipoproceso = ''M'' ' +
        '    AND ps_idempresa = em_id '+
        '    AND ps_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        iif(chkSinPreventor.Checked,' AND it_id(+) = ps_idpreventor ', '  AND it_id = ps_idpreventor AND it_fechabaja IS NULL ')+
        //'    AND it_id ='+SqlValue(fraPreventorFiltro.Value)+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        it_nombre AS "Preventor", ps_tarea AS "Tarea", ps_fechadesde AS "Fecha Desde", '+
        '        ps_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", tv_descripcion AS "Prioridad", '+
        '        ps_estado AS "Estado" '+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.pit_firmantes, '+
        '        hys.htv_tipovisita, hys.hpv_procesovisita, hys.hps_planhys '+
        '  WHERE ps_fechabaja IS NULL '+
        '    AND pv_mes >= '+SqlValue(edMes.Text)+
        '    AND pv_mes <= '+SqlValue(edMesHasta.Text)+
        '    AND ps_idpreventor IS NOT NULL '+
        '    AND ps_estado <> ''N'' '+
        '    AND pv_id = ps_idproceso ' +
        '    AND tv_id = ps_tipovisita ' +
        '    AND ps_tipovisita = 3 '+
        '    AND pv_tipoproceso = ''M'' ' +
        '    AND ps_idempresa = em_id '+
        '    AND ps_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        iif(chkSinPreventor.Checked,' AND it_id(+) = ps_idpreventor ', '  AND it_id = ps_idpreventor AND it_fechabaja IS NULL ')+
        //'    AND it_id ='+SqlValue(fraPreventorFiltro.Value)+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        it_nombre AS "Preventor", ps_tarea AS "Tarea", ps_fechadesde AS "Fecha Desde", '+
        '        ps_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", tv_descripcion AS "Prioridad", '+
        '        ps_estado AS "Estado" '+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.pit_firmantes, '+
        '        hys.htv_tipovisita, hys.hpv_procesovisita, hys.hps_planhys '+
        '  WHERE ps_fechabaja IS NULL '+
        '    AND pv_mes >= '+SqlValue(edMes.Text)+
        '    AND pv_mes <= '+SqlValue(edMesHasta.Text)+
        '    AND ps_idpreventor IS NOT NULL '+
        '    AND ps_estado <> ''N'' '+
        '    AND pv_id = ps_idproceso ' +
        '    AND tv_id = ps_tipovisita ' +
        '    AND ps_tipovisita = 4 '+
        '    AND pv_tipoproceso = ''M'' ' +
        '    AND ps_idempresa = em_id '+
        '    AND ps_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        iif(chkSinPreventor.Checked,' AND it_id(+) = ps_idpreventor ', '  AND it_id = ps_idpreventor AND it_fechabaja IS NULL ')+
        //'    AND it_id ='+SqlValue(fraPreventorFiltro.Value)+
        sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        it_nombre AS "Preventor", ps_tarea AS "Tarea", ps_fechadesde AS "Fecha Desde", '+
        '        ps_fechahasta AS "Fecha Hasta", pv_mes AS "Mes", tv_descripcion AS "Prioridad", '+
        '        ps_estado AS "Estado" '+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.pit_firmantes,  '+
        '        hys.htv_tipovisita, hys.hpv_procesovisita, hys.hps_planhys '+
        '  WHERE ps_fechabaja IS NULL '+
        '    AND pv_mes >= '+SqlValue(edMes.Text)+
        '    AND pv_mes <= '+SqlValue(edMesHasta.Text)+
        '    AND ps_idpreventor IS NOT NULL '+
        '    AND ps_estado <> ''N'' '+
        '    AND pv_id = ps_idproceso ' +
        '    AND tv_id = ps_tipovisita ' +
        '    AND ps_tipovisita = 5 '+
        '    AND pv_tipoproceso = ''M'' ' +
        '    AND ps_idempresa = em_id '+
        '    AND ps_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        iif(chkSinPreventor.Checked,' AND it_id(+) = ps_idpreventor ', '  AND it_id = ps_idpreventor AND it_fechabaja IS NULL ')+
        //'    AND it_id ='+SqlValue(fraPreventorFiltro.Value)+
        sWhere;
    end;
    6:
    begin
      if edMes.Tag = 1 then
      begin
        //EjecutarStore('art.hys.do_procesargradocumplimiento(TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') , LAST_DAY(TO_DATE('+ SqlValue(edMesHasta.Text)+', ''YYYYMM'')));');
        EjecutarStore('art.hys.do_procesargradoincumplimiento(TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') , LAST_DAY(TO_DATE('+ SqlValue(edMesHasta.Text)+', ''YYYYMM'')));');
      end;
      sSql :=
        ' SELECT tb_descripcion "Sector", it_nombre "Preventor", art.hys.get_nombre_preventor_coord(ip_itcodigo) "Coordinador Actual", ' +
        '        ip_cuit "Cuit", em_nombre "Empresa", ip_estableci "Nro.Estab.", ip_medicion "Medición", ip_recomendacion "Recomendación", ' +
        '        ip_fechadesde "Fecha Desde", ip_fechahasta "Fecha Hasta", ip_visitafallida "Visita Fallida", ip_siniestro "Siniestro", ' +
        '        ip_denunciastr "Desnuncia SRT" ' +
        '  FROM hys.hip_incumplimientosplan hip, afi.aem_empresa, art.ctb_tablas, art.pit_firmantes ' +
        ' WHERE em_cuit = ip_cuit ' +
        '   AND tb_clave = ''SECT'' ' +
        '   AND tb_codigo = em_sector ' +
        iif(chkSinPreventor.Checked,' AND it_codigo(+) = ip_itcodigo ', '  AND it_codigo = ip_itcodigo AND it_fechabaja IS NULL ')+
        sWhere;
    end;
(*
    7:
    begin
      sSql :=
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        rv_usualta AS "Usuario", ''PRS'' AS "Tipo Medición", rv_fecha AS "Fecha Visita",'+
        '        rv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(rv_fecha),'+
        '        TRUNC(rv_fechaalta)) AS "Diferencia Días Habiles"'+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.prv_recvisitas'+
        '  WHERE rv_fechabaja IS NULL'+
        '    AND rv_tipo = ''ET'' ' +
        '    AND rv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'')'+
        '    AND rv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1 '+
        '    AND rv_cuit = em_cuit '+
        '    AND rv_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND rv_usualta ='+SqlValue(sdqConsulta.FieldByName('se_usuario').AsString)+sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        rv_usualta AS "Usuario", ''PAPE'' AS "Tipo Medición", rv_fecha AS "Fecha Visita",'+
        '        rv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(rv_fecha),'+
        '        TRUNC(rv_fechaalta)) AS "Diferencia Días Habiles"'+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.prv_recvisitas'+
        '  WHERE rv_fechabaja IS NULL'+
        '    AND rv_tipo = ''EP'' ' +
        '    AND rv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'')'+
        '    AND rv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1 '+
        '    AND rv_cuit = em_cuit '+
        '    AND rv_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND rv_usualta ='+SqlValue(sdqConsulta.FieldByName('se_usuario').AsString)+sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        ps_usualta AS "Usuario", ''PAL'' AS "Tipo",ps_fechavisita AS "Fecha Visita", '+
        '        ps_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(ps_fechavisita),'+
        '        TRUNC(ps_fechaalta)) AS "Diferencia Días Habiles"'+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, hys.hpa_pal, '+
        '        hys.hps_palseguimiento '+
        '  WHERE ps_fechabaja IS NULL '+
        '    AND ps_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') '+
        '    AND ps_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1 '+
        '    AND pa_id = ps_idpal '+
        '    AND pa_cuit = em_cuit '+
        '    AND pa_estableci = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND ps_usualta ='+SqlValue(sdqConsulta.FieldByName('se_usuario').AsString)+sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        sv_usualta AS "Usuario", ''Accidentes'' AS "Tipo", sv_fecha AS "Fecha Visita", '+
        '        sv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(sv_fecha),'+
        '        TRUNC(sv_fechaalta)) AS "Diferencia Días Habiles"'+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.sex_expedientes, '+
        '        hys.pae_accidenteestablecimiento, hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
        '  WHERE sv_fechabaja IS NULL '+
        '    AND sv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') '+
        '    AND sv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1'+
        '    AND mc_idaccidenteestablecimiento = ae_id '+
        '    AND sv_idmedidacorrectiva = mc_id '+
        '    AND ae_idexpediente = ex_id '+
        '    AND ex_cuit = em_cuit '+
        '    AND ae_nroestablecimiento = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND sv_usualta ='+SqlValue(sdqConsulta.FieldByName('se_usuario').AsString)+sWhere+
        ' UNION ALL '+
        ' SELECT em_cuit AS "CUIT", em_nombre AS "Razón Social", co_contrato AS "Contrato",'+
        '        es_nroestableci AS "Establecimiento", es_nombre AS "Nombre Estab.", '+
        '        sv_usualta AS "Usuario", ''Enfermedades'' AS "Tipo", sv_fecha AS "Fecha Visita", '+
        '        sv_fechaalta AS "Fecha Alta", art.utiles.get_diferenciaentrefechas(TRUNC(sv_fecha),'+
        '        TRUNC(sv_fechaalta)) AS "Diferencia Días Habiles"'+
        '   FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco_contrato, art.sex_expedientes, '+
        '        hys.pee_enfermedadestablecimiento, hys.pmc_medidacorrectivaenf, '+
        '        hys.psv_seguimientovisitaenf '+
        '  WHERE sv_fechabaja IS NULL '+
        '    AND sv_fechaalta > TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') '+
        '    AND sv_fechaalta < LAST_DAY(TO_DATE('+SqlValue(edMesHasta.Text)+', ''YYYYMM'')) + 1'+
        '    AND mc_idenfermedadestablecimiento = ee_id '+
        '    AND sv_idmedidacorrectiva = mc_id '+
        '    AND ee_idexpediente = ex_id '+
        '    AND ex_cuit = em_cuit '+
        '    AND ee_nroestablecimiento = es_nroestableci '+
        '    AND em_id = co_idempresa '+
        '    AND co_contrato = es_contrato '+
        '    AND es_contrato = art.get_vultcontrato(em_cuit) '+
        '    AND sv_usualta ='+SqlValue(sdqConsulta.FieldByName('se_usuario').AsString)+sWhere;
    end;
*)
  end;
  sdqConsulta.SQL.Text := sSql;
  edMes.Tag := 0;
  inherited;
end;

procedure TfrmDetalleIndicadores.edMesChange(Sender: TObject);
begin
  edMes.Tag := 1;
  inherited;
end;

end.
