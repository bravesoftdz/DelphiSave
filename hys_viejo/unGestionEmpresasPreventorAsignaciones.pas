unit unGestionEmpresasPreventorAsignaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unGestionEmpresasPreventor, ShortCutControl, FieldHider,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, StdCtrls, unfraEstablecimientoDomic, Buttons, ComCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ToolWin, ExComboBox, ToolEdit, DateComboBox, unfraCtbTablas,
  unfraLocalidad, unfraLocalidadEx, IntEdit, ComboEditor, CheckCombo,
  unArtDbFrame, unFraEmpresa, Mask, PatternEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unDmPrincipal,
  AnsiSql, General, CustomDlgs, StrUtils, ADODB, unFraCodDesc, unGrids;

type
  TfrmGestionEmpPrevAsig = class(TfrmGestionEmpresasPreventor)
    sdqConsultaPD_NOMBREFIRMANTE: TStringField;
    stsBar: TStatusBar;
    sdqConsultaPD_ID: TFloatField;
    sdqConsultaPD_TIPOASIGNACION: TStringField;
    sdqConsultaPD_IDEXCLUSIVO: TStringField;
    sdqConsultaNOMBREREFERENTE: TStringField;
    tbDetalleCUIT: TToolButton;
    Label450: TLabel;
    Panel10: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarCambioPreventorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fpCambiarPreventorEnter(Sender: TObject);
    procedure FSFormKeyPress(Sender: TObject; var Key: Char);
    procedure FSFormShow(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
        Integer; Column: TColumn; State: TGridDrawState);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var
        Background: TColor; Highlight: Boolean);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbCPClick(Sender: TObject);
    procedure tbDetalleCUITClick(Sender: TObject);
  private
    FEspacioCut: byte;
    FCodigoSinPreventor: string;
    FCoordinadores: string;
    FSelectedListCuitEstab, FSelectedListID: TBookMarkLst;
    FContrato: integer;
    FCaption: string;
    FCodPreventor: string;
    FSectores, FTiposPreven, FCatsRiesgo: array of string;
    FRgoMax, FRgoMin: integer;
    FSinPreventor, FAsig, FAsigPosibles: Boolean;
    FModificado: Boolean;
    function GetContrato: integer;
    procedure SetContrato(const Value: integer);
    function GetCatRiesgo(index: integer): string;
    function GetSector(index: integer): string;
    function GetTipoPreven(index: integer): string;
    procedure SetCatRiesgo(index: integer; const Value: string);
    procedure SetRangoCapitaMax(const Value: integer);
    procedure SetSector(index: integer; Value: string);
    procedure SetTipoPreven(index: integer; const Value: string);
    procedure ArmarQuery;
    procedure CargaListas(Columna: TColumn);
    procedure SetRangoCapitaMin(const Value: integer);
    function GetCodPreventor: string;
    procedure SetCodPreventor(const Value: string);
    function GetSinPreventor: Boolean;
    procedure SetSinPreventor(const Value: Boolean);
    function GetAsignados: Boolean;
    function GetPosiblesAsignados: Boolean;
    function IsPosibleAsig: Boolean;
    procedure SetAsignados(const Value: Boolean);
    procedure SetPosiblesAsignados(const Value: Boolean);
  public
    procedure VerificarPosiblesAlActual(
        ListaPDID, IDPrevSugerido, NombrePrevSugerido: string);
    property Titulo: string read FCaption write FCaption;
    property CodPreventor: string read GetCodPreventor write SetCodPreventor;
    property Contrato: integer read GetContrato write SetContrato;
    property Sector[index: integer]: string read GetSector write SetSector;
    property TipoPreven[index: integer]: string read GetTipoPreven write SetTipoPreven;
    property CatRiesgo[index: integer]: string read GetCatRiesgo write SetCatRiesgo;
    property RangoCapitaMin: integer write SetRangoCapitaMin;
    property RangoCapitaMax: integer write SetRangoCapitaMax;
    property SinPreventor: Boolean read GetSinPreventor write SetSinPreventor;
    property Asignados: Boolean read GetAsignados write SetAsignados;
    property PosiblesAsignados: Boolean read GetPosiblesAsignados write SetPosiblesAsignados;
    property Modificado: Boolean read FModificado;
    property Coordinadores: string read FCoordinadores write FCoordinadores;
    property CodigoSinPreventor: string read FCodigoSinPreventor write FCodigoSinPreventor;
    property EspacioCut: byte read FEspacioCut write FEspacioCut;
  end;

var
  frmGestionEmpPrevAsig: TfrmGestionEmpPrevAsig;

implementation

uses unCustomConsulta, unAsignacionesDetalle, unReasignacionCP,
  unPrincipal;

{$R *.dfm}

procedure TfrmGestionEmpPrevAsig.FormCreate(Sender: TObject);
begin
  inherited;
  FSelectedListCuitEstab := TBookMarkLst.Create;
  FSelectedListID := TBookMarkLst.Create;
  cmbTipoEmpresaPrev.Items.Clear;

  with GetQuery('SELECT * FROM HYS.HTE_TIPOEMPRESAPREV') do
  try
    while not Eof do
    begin
      cmbTipoEmpresaPrev.Items.AddObject(
          fieldbyname('TE_CODIGO').AsString,
          TObject(fieldbyname('TE_ID').AsInteger)
      );
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmGestionEmpPrevAsig.ArmarQuery;
  function HayDependencia (Actual, Buscado: LongInt): Boolean;
  begin
    Result := False;

    if Actual <> 0 then
      Result := (Actual = Buscado) or
                HayDependencia (ValorSqlInteger('SELECT it_idsupervisor ' +
                                '  FROM art.pit_firmantes ' +
                                ' WHERE it_id = ' + SqlInteger(Actual)), Buscado)
  end;

var
  Indice: String;
  Lista: String;
  sIn: String;

  sWhere: String;
  sFrom: String;
  sSelect: String;

  i: integer;
  sSelectSug, sFromSug, sWhereSug: String;
  sAsignaciones, sCoordinadores, sLstPrevent, sEstabTipoEventual, sWhereDepart: string;
  sWhereFechasVisita: String;

begin
    Indice := '';

    // Cancelo filtro por Referente si está seleccionado pero no hay Referente indicado
    cbPreventorReferente.Checked := cbPreventorReferente.Checked and
                                    (Trim(fraPreventorFiltro.cmbDescripcion.Text) <> '');

    sdqDatosEmpresa.Close;
    sdqConsulta.SQL.Clear;
    sWhere := '';
    sFrom := '';
    sSelect := '';
    sSelectSug := '';
    sFromSug := '';
    sWhereSug := '';

    if fraEmpresaFiltro.IsSelected then
      sWhere := sWhere + ' and hep.ep_idempresa = ' +  SqlValue(fraEmpresaFiltro.Value);

    if fraPreventorFiltro.IsSelected and cmbVerPreventorExclusivo.Checked then
      sWhere := ' AND PD_IDEXCLUSIVO = ' + SqlValue(fraPreventorFiltro.ID);

    if cmbEmpresaPreventorExclusivo.Checked and cmbEmpresaSinPreventorExclusivo.Checked then
      sWhere := sWhere + ' AND ((pd_idexclusivo IS NOT NULL) OR (pd_idexclusivo IS NULL))'
    else begin
      if cmbEmpresaPreventorExclusivo.Checked then
        sWhere := sWhere + ' AND pd_idexclusivo IS NOT NULL';

      if cmbEmpresaSinPreventorExclusivo.Checked then
        sWhere := sWhere + ' AND pd_idexclusivo IS NULL';
    end;

    if fraPreventorFiltro.IsSelected then
    begin
      if (cbListarCoordinados.Checked) then
      begin
        Lista := SqlValue(fraPreventorFiltro.Codigo);
        with sdqConSupervisor do
        begin
          Sql.Clear;
          Sql.Add ( 'SELECT it_id, it_codigo ' +
                    '  FROM art.pit_firmantes ' +
                    ' WHERE it_id <> ' + SqlNumber(fraPreventorFiltro.Value) +
                    '   AND NOT (it_idsupervisor IS NULL)' );
          Open;
          while not EoF do
          begin
            if HayDependencia (FieldByName('it_id').AsInteger, fraPreventorFiltro.Value) then
               Lista := Lista + ', ''' + FieldByName('it_codigo').AsString+'''';
            Next;
          end;
          Close
        end;
        Indice := '';  // HASTA QUE NO DE ERROR!!!!  '/*+ FULL(PIT) */';
        sWhere := sWhere + 'AND hep.ep_itcodigo IN ( ' + Lista + ')'
      end
      else if (cmbPreventorUltVisita.Checked) then
      begin
        sWhere := sWhere + ' AND ep_preventorultvisita = '+ SqlValue(fraPreventorFiltro.ID);
      end else
      begin
        // agrego filtro por Preventor referente
        if (cbPreventorReferente.Checked) then
          sWhere := sWhere + ' and PD_ITREFERENTE IS NOT NULL';//= ' + sqlvalue(fraPreventorFiltro.Codigo);

      end;

      {tiene asignados y posibles asignaciones}
      if FAsig and FAsigPosibles then
      begin
        sAsignaciones :=
              ' AND (pd_tipo_asignacion = ''A'' OR pd_tipo_asignacion = ''P'' )'
            + ' AND (hpd.pd_idprevsugerido = ' + SqlValue(fraPreventorFiltro.Value) + ' OR '
            + '      hpd.pd_idfirmante = ' + SqlValue(fraPreventorFiltro.Value) + ')'
            + ' AND (hpd.pd_idfirmante = pit.it_id OR hpd.pd_idprevsugerido = pit.it_id) ';
      end;

      {sólo asignados}
      if FAsig and (not FAsigPosibles) then
      begin
        sAsignaciones :=
              ' AND pd_tipo_asignacion = ''A'' '
            + ' AND pd_idfirmante = ' + SqlValue(fraPreventorFiltro.Value)
            + ' AND pd_idfirmante = pit.it_id(+) ';
      end;

      {sólo posibles}
      if FAsigPosibles and (not Fasig) then
      begin
        sAsignaciones :=
              ' AND pd_tipo_asignacion = ''P'' '
            + ' AND pd_idprevsugerido = ' + SqlValue(fraPreventorFiltro.Value)
            + ' AND pd_idprevsugerido = pit.it_id ';
      end;
    end else
    begin

    end;

    if cbSinPreventor.Checked then
        sWhere := sWhere +
            ' AND pd_itcodigo  = ' + SqlValue(CodigoSinPreventor)
           +' AND pd_idfirmante IS NULL '
           +' AND pd_idfirmante = pit.it_id(+) '
           +' AND pd_tipo_asignacion = ''A'' ';

    if cbSinReferente.Checked then
      sWhere := sWhere + ' AND pd_itreferente IS NULL';

    if (cmbResolucion.Text <> '') then
    begin
      sIn := '';
      for i:=0 to cmbResolucion.Items.Count-1 do
        if cmbResolucion.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbResolucion.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and nvl(hep.EP_NRORESOLUCION,0) in (' + sIn  + ')';

    sIn := '';

    if (not fraLocalidad.IsEmpty) then
        sWhere := sWhere + fraLocalidad.GetWhere;

    if not edActividad.IsEmpty then
        sWhere := sWhere + ' and  substr(cac.ac_relacion,1,' + inttostr(length(edActividad.Text)) + ') = ' + SqlValue(edActividad.Text);

    if ((not edCantTrabajadoresMin.IsEmpty) or (not edCantTrabajadoresMax.IsEmpty)) then
    begin
        sWhere := sWhere + iif((not edCantTrabajadoresMin.IsEmpty), ' and NVL (co_totempleadosactual, co_totempleados) >= ' + SqlValue(edCantTrabajadoresMin.Value), '');
        sWhere := sWhere + iif((not edCantTrabajadoresMax.IsEmpty), ' and NVL (co_totempleadosactual, co_totempleados) <= ' + SqlValue(edCantTrabajadoresMax.Value), '');
    end;

    if chkGBA.Checked then
      sWhere := sWhere + ' and exists (select 1 from art.ccp_codigopostal where aes.es_cpostal = cp_codigo and cp_gba = ''S''' + ')';

    if chkCancerigenos.Checked then
      sWhere := sWhere + ' and  EP_CANCERIGENOS = ''S'' ';

    if chkDifenilos.Checked then
      sWhere := sWhere + ' and  EP_DIFENILOS = ''S'' ';

    if chkAccMayores.Checked then
      sWhere := sWhere + ' and  EP_ACCMAYORES = ''S'' ';

    if edEstablecimiento.Text <> '' then
        sWhere := sWhere + ' and aes.es_nroestableci in (' + ArmarFiltroEstab(edEstablecimiento.Text)  + ')';

    if (fraSubTipoFiltro.IsSelected) then
      sWhere := sWhere + '   AND co_idsubtipo = ' + SqlValue(fraSubTipoFiltro.Value);

    if (fraMotivoAsignacionFiltro.IsSelected) then
      sWhere := sWhere + '   AND ep_motivoasignacion = ' + SqlValue(fraMotivoAsignacionFiltro.Codigo);

    if (edVigenciaAsigFiltro.Date>0) and (edVigenciaAsigFiltro2.Date >0) then
      sWhere := sWhere + '   AND ep_fechavencimientoasig between ' + SqlDate(edVigenciaAsigFiltro.Date)+ ' AND '+SqlDate(edVigenciaAsigFiltro2.Date);

    if (fraPerfil.IsSelected) then
      sWhere := sWhere + '   AND pit.it_idperfil = ' + SqlValue(fraPerfil.Value);

    if fraTipoFiltroSRT.IsSelected then
      sWhere := sWhere + ' and hep.ep_tipo = ' + SqlValue(fraTipoFiltroSRT.Codigo);

    if (cmbTipoEmpresaPrev.Text <> '') then
    begin
      sIn := '';
      for i:=0 to cmbTipoEmpresaPrev.Items.Count-1 do
        if cmbTipoEmpresaPrev.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbTipoEmpresaPrev.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and hep.ep_idtipoestabprev in (' + sIn  + ')';

    sIn := '';
    if cmbEstadoEstab.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbEstadoEstab.Items.Count-1 do
        if cmbEstadoEstab.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbEstadoEstab.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and hep.ep_idestado + 0 in (' + sIn  + ')';

    sIn := '';
    if cmbHolding.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbHolding.Items.Count-1 do
        if cmbHolding.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbHolding.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and aem.em_idgrupoeconomico + 0 in (' + sIn  + ')';

    sIn := '';
    if cmbSector.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbSector.Items.Count-1 do
        if cmbSector.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbSector.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + '   AND em_sector + 0 in (' + sIn  + ')';

    sIn := '';
    if cmbCategoriaRiesgo.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbCategoriaRiesgo.Items.Count-1 do
        if cmbCategoriaRiesgo.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbCategoriaRiesgo.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' AND PD_IDCATEGORIARIESGO + 0 in (' + sIn  + ')';

    if cbAnexoI.Checked then
      sWhere := sWhere + ' and EP_ANEXO1 = ' + SqlValue(cmbAnexoI.Value);

    if cbAnexoII.Checked then
      sWhere := sWhere + ' and EP_ANEXO2 = ' + SqlValue(cmbAnexoII.Value);

    if cbPrs.Checked then
      sWhere := sWhere + ' and EP_TIENEPRS = ' + SqlValue(cmbPrs.Value);

    if cbDenunciasGrales.Checked then
      sWhere := sWhere + ' and EP_TIENEDENUNCIAGRAL = ' + SqlValue(cmbDenunciasGrales.Value);

    if cbOtrasDenuncias.Checked then
      sWhere := sWhere + ' and EP_TIENEDENUNCIA = ' + SqlValue(cmbOtrasDenuncias.Value);

    if cbUltimoOperativo.Checked then
      sWhere := sWhere + ' and CO_OPERATIVO = art.hys.get_operativovigente_empresa (ep_cuit, SYSDATE)' ;

    if cbAvisoObra.Checked then
      sWhere := sWhere + ' and EP_FECHAINICIOOBRA is not null ';

    if (cbExcluirBajas.Checked) then
        sWhere := sWhere + ' and aes.es_fechabaja is null ';

    if (cbEventual.Checked) then
        sWhere := sWhere + ' and aes.es_eventual = ''S'' ';

    if fraRanking.IsSelected then
    begin
      sWhere := sWhere + ' and (exists (SELECT 1 ' +
                         '                FROM hys.hre_rankingempresa ' +
                         '               WHERE re_idranking =  ' + sqlInteger(fraRanking.Codigo) +
                         '                 AND re_idempresa = em_id))'
    end;

    // agrego filtro por Preventor tercerizado
    if (cbTercerizado.Checked) then
      sWhere := sWhere + ' AND pit.it_tercerizado = 1 ';

    if cbCtosActivos.Checked then
      sWhere := sWhere + ' and co_estado = ''1'' ';

    if FCoordinadores <> '' then
      sCoordinadores := 'AND pd_idcoordinador IN (' + FCoordinadores + ')';

    if lstPrev.Count > 0  then
    begin
      for i := 0 to lstPrev.Count -1 do
        sLstPrevent := sLstPrevent + IntToStr(integer(lstPrev.items.Objects[i])) + ',';

      sLstPrevent := 'AND pit.it_id in (' + LeftStr(sLstPrevent, Length(sLstPrevent) -1) + ')';
    end;

    if (not cbSinPreventor.Checked) and (fraPreventorFiltro.IsEmpty) then
      sWhere := sWhere
           +' AND pd_idfirmante = pit.it_id(+) '
           +' AND pd_tipo_asignacion = ''A'' ';

    sIN := '';
    if cmbEstabTiposEventual.CheckedCount > 0 then
    begin
      for i := 0 to cmbEstabTiposEventual.Items.Count -1 do
      begin
        if cmbEstabTiposEventual.Checked[i] then
          sIN := sIN + SqlValue(integer(cmbEstabTiposEventual.Items.Objects[i])) + ',';
      end;
      sIN := LeftStr(sIN, Length(sIN)-1);
      sEstabTipoEventual :=
          ' AND nvl(ES_IDESTABEVENTUAL, 1) in (' + sIN + ')';
    end;

    sIN := '';
    if fraDepart.IsSelected then
    begin
      sWhereDepart :=
          ' AND art.utiles.get_partido(aes.es_cpostal, aes.es_provincia) = ' +
              SqlValue(fraDepart.cmbDescripcion.Text);
    end;

    sWhereFechasVisita := '';
    if (not edVisitaDesde.IsEmpty) and (not edVisitaHasta.IsEmpty) then
      sWhereFechasVisita :=
          sWhereFechasVisita
          + ' AND (ep_fechaultvisita BETWEEN ' + QuotedStr(DateToStr(edVisitaDesde.Date))
          + '      AND ' + QuotedStr(DateToStr(edVisitaHasta.Date)) + ')'
    else if not edVisitaDesde.IsEmpty then
      sWhereFechasVisita :=
          sWhereFechasVisita + ' AND ep_fechaultvisita >= ' + QuotedStr(DateToStr(edVisitaDesde.Date))
    else if not edVisitaHasta.IsEmpty then
      sWhereFechasVisita :=
          sWhereFechasVisita + ' AND ep_fechaultvisita <= ' + QuotedStr(DateToStr(edVisitaHasta.Date));

    sdqConsulta.SQL.Add(
              'SELECT                                                                                             /*+ first_rows */ '
            + '        (SELECT  it_nombre '
            + '           FROM  pit_firmantes pit '
            + '          WHERE  pd_itreferente = pit.it_codigo) pd_nombrereferente,'
            + '        pd_idexclusivo, '
            + '        pd_id, '
            + '        ep_id, '
            + '        ep_cuit, '
            + '        ep_idempresa, '
            + '        aem.em_nombre, '
            + '        ep_estableci, '
            + '        aes.es_nombre, '
            + '        ep_tipo tiposrt, '
            + '        pd_tipo_asignacion, '
            + '        te_codigo tipoprevencion, '
            + '        art.hys.get_preventor_referente (hco.co_cuit) idreferente, '
            + '        ep_actividad, '
            + '        ep_idfirmante, '
            + '        ep_itcodigo, '
            + '        pit.it_nombre, '
            + '        NVL (es_eventual, ''N'') es_eventual, '
            + '        art.hys.get_nombre_preventor_coord (hpd.pd_itcodigo) it_coordinador, '
            + '        NVL (co_totempleadosactual, co_totempleados) AS rc_empleados, '
            + '        dc_telefonos, '
            + '        art.afi.armar_domicilio ( '
            + '                                 es_calle, '
            + '                                 es_numero, '
            + '                                 es_piso, '
            + '                                 es_departamento, '
            + '                                 es_localidad '
            + '                                ) || '
            + '        NVL2 ( '
            + '              es_telefonos, '
            + '              '' Tel.'' || (NVL (es_codareatelefonos, '''') || es_telefonos), '
            + '              '''' '
            + '             ) '
            + '           AS domicilio, '
            + '        es_localidad, '
            + '        ep_tienepal, '
            + '        es_cpostal, '
            + '        cac.ac_relacion, '
            + '        es_cpostala, '
            + '        co_contrato, '
            + '        ge_descripcion, '
            + '        ca_id, '
            + '        ca_descripcion, '
            + '        ac_idcategoriariesgo, '
            + '        art.getdescripcionprovincia (es_provincia) AS prov, '
            + '        es_provincia, '
            + '        ep_motivoasignacion, '
            + '        ep_fechavencimientoasig, '
            + '        ep_observacion, '
            + '        hma.ma_descripcion, '
            + '        ep_fechabaja, '
            + '        ep_usubaja, '
            + '        es_fechabaja, '
            + '        ep_anexo1, '
            + '        ep_anexo2, '
            + '        ep_anexo1ficticio, '
            + '        ep_tienedenunciagral, '
            + '        ep_tienedenuncia, '
            + '        ep_tieneprs, '
            + '        ep_fechaultvisita, '
            + '        ep_fechaultrelev, '
            + '        ep_fechaultcap, '
            + '        pit2.it_nombre prevultvisita, '
            + '        ee_descripcion, '
            + '        co_estab_evento, '
            + '        ep_fechainicioobra, '
            + '        ep_fechaextensionobra, '
            + '        ep_fechafinobra, '
            + '        ep_pramet, '
            + '        ep_cantvisitas, '
            + '        ep_cantcapacit, '
            + '        ep_cantrelev, '
            + '        pit.it_id, '
            + '        ep_nroresolucion, '
            + '        (SELECT  pe_preventorid '
            + '           FROM  hys.hpe_preventorexclusivo '
            + '          WHERE  pe_idempresa = em_id AND pe_fechabaja IS NULL) '
            + '           pe_preventorid, '
            + '        ep_cancerigenos, '
            + '        ep_difenilos, '
            + '        ep_accmayores,ep_tiporelev, '
            + '        pd_idprevsugerido as idprevsugerido, '
            + '        '''' as prevsugerido, '
            + '        CASE pd_tipo_asignacion '
            + '             WHEN ''A'' '
            + '             THEN '
            + '                (SELECT  pit.it_nombre '
            + '                   FROM  pit_firmantes pit '
            + '                  WHERE  pit.it_id = pd_idfirmante) '
            + '             WHEN ''P'' '
            + '             THEN '
            + '                (SELECT  pit.it_nombre '
            + '                   FROM  pit_firmantes pit '
            + '                  WHERE  pit.it_id = ep_idfirmante) '
            + '          END '
            + '             AS nombrefirmante, '
            + '         NULL AS ZC_DESCRIPCION, '
            + '         co_vigenciahasta, te_cargamanual, '
            + '        art.utiles.get_partido(aes.es_cpostal, aes.es_provincia) departamento '
            + '  FROM  afi.adc_domiciliocontrato ahdl, '
            + '        hys.hep_estabporpreventor hep, '
            + '        afi.aem_empresa aem, '
            + '        afi.aco_contrato aco, '
            + '        afi.aes_establecimiento aes, '
            + '        comunes.cac_actividad cac, '
            + '        afi.age_grupoeconomico age, '
            + '        hys.hte_tipoempresaprev, '
            + '        hys.hco_cuitoperativo hco, '
            + '        hys.hee_estadoestab, '
            + '        hys.hca_categoriariesgo hca, '
            + '        art.pit_firmantes pit, '
            + '        art.pit_firmantes pit2, '
            + '        hys.hma_motivoasigprev hma, '
            + '        hpd_preventores_data hpd '
            +          sFrom
            +  ' WHERE co_contrato              = art.get_vultcontrato(em_cuit) '
            +  '    AND ahdl.dc_contrato(+)     = aco.co_contrato '
            +  '    AND ahdl.dc_tipo(+)         = ''L'' '
            +  '    AND cac.ac_idcategoriariesgo= hca.ca_id(+) '
            +  '    AND aem.em_idgrupoeconomico = ge_id(+) '
            +  '    AND hep.ep_idempresa        = aem.em_id '
            +  '    AND aem.em_id               = aco.co_idempresa '
            +  '    AND aes.es_nroestableci     = hep.ep_estableci '
            +  '    AND aco.co_contrato         = aes.es_contrato '
            +  '    AND cac.ac_id               = aes.es_idactividad '
            +  '    AND co_idtipoempresaprev    = te_id(+) '
            +  '    AND hco.co_id(+)            = ep_idcooperativo '
            +  '    AND hep.ep_idestado         = ee_id '
            +  '    AND hma.ma_id(+)            = hep.ep_motivoasignacion '
            +  '    AND pit2.it_id(+)           = hep.ep_preventorultvisita '
            +  '    AND hpd.pd_idhep            = ep_id '
            +       sAsignaciones
            +       sCoordinadores
            +       sLstPrevent
            +       sEstabTipoEventual
            +       sWhere
            +       sWhereDepart
            +       sWhereFechasVisita
            +  ' ORDER BY '
            +  '    ep_cuit, ep_estableci');
end;

procedure TfrmGestionEmpPrevAsig.btnAceptarCambioPreventorClick(Sender: TObject);
var
  sIDCoordinador, sIDFirmante, sCodigoFirmante, sNombreFirmante: string;
  bExisteTipoP: Boolean;
  CargaMax: Word;
begin

  sIDCoordinador :=
      ValorSqlEx(
          'SELECT it_idsupervisor FROM pit_firmantes WHERE it_id = :id_preventor',
          [fraPreventorNuevo.ID]);


  bExisteTipoP := ExisteSql(
            'SELECT  1 '
          + '  FROM  hpd_preventores_data '
          + ' WHERE  pd_tipo_asignacion = ''P'' AND pd_id IN ('+ FSelectedListID.CommaText +')'
  );

  if (fraPreventorNuevo.IsEmpty) and (bExisteTipoP) then
  begin
      MessageDlg('Existen registros de tipo Posible Asignación en el detalle (Tipo P). '
          + ' Sólo se permite desasignar registros asignados (Tipo A).', mtError, [mbOK], 0);
      Exit;
  end;

  if fraPreventorNuevo.IsEmpty then
  begin
    if MessageBox(0, '¿Desasignar los establecimientos seleccionados?', 'Atención',
        MB_ICONWARNING or MB_YESNO) = IDYES then
    begin
      sIDFirmante := 'NULL';
      sCodigoFirmante := SqlValue(FCodigoSinPreventor);
      sNombreFirmante := SqlValue(FCodigoSinPreventor);
      CargaMax := 0;
    end else
      Exit;
  end else
  begin
    sIDFirmante := SqlValue(fraPreventorNuevo.ID);
    sCodigoFirmante := SqlValue(fraPreventorNuevo.Codigo);
    sNombreFirmante := SqlValue(fraPreventorNuevo.Descripcion);
    CargaMax :=
        ValorSqlEx('select IT_CARGAMAX from art.pit_firmantes where it_id = :itid',
            [fraPreventorNuevo.ID]
        );
  end;

  if FAsigPosibles then
  begin
    EjecutarSql(
          'DELETE hpd_preventores_data '
        +'  WHERE pd_id in (' + FSelectedListID.CommaText + ')'
        +'        AND pd_tipo_asignacion = ''P'' '
    );
  end;

  VerificarPosiblesAlActual(
      FSelectedListID.CommaText,
      fraPreventorFiltro.iD,
      SqlValue(fraPreventorFiltro.cmbDescripcion.Text)
  );

  EjecutarSql(
      ' UPDATE  hpd_preventores_data '
      +'   SET  pd_idfirmante       = ' + sIDFirmante          + ', '
      +'        pd_itcodigo         = ' + sCodigoFirmante      + ', '
      +'        pd_nombrefirmante   = ' + sNombreFirmante      + ', '
      +'        pd_idcoordinador    = ' + iif(sIDCoordinador = '', 'NULL', sIDCoordinador) + ', '
      +'        pd_vigencia_asig    = ' + SqlValue(edVigenciaAsig.Date)           + ', '
      +'        pd_motivoasignacion = ' + SqlValue(fraMotivoAsignacion.Codigo)    + ', '
      +'        pd_observacion      = ' + SqlValue(edMotivoCambio.Text)           + ', '
      +'        pd_cargamax         = ' + iif(CargaMax > 0, IntToStr(CargaMax), 'NULL') + ', '
      +'        pd_idreferente      = ' +
                  iif(cbReferenteCambio.Checked, SqlValue(fraPreventorNuevo.ID), 'NULL')      + ', '
      +'        pd_itreferente      = ' +
                  iif(cbReferenteCambio.Checked, SqlValue(fraPreventorNuevo.Codigo), 'NULL')  + ', '
      +'        pd_idexclusivo      = ' +
                  iif(cbExclusivoCambio.Checked, SqlValue(fraPreventorNuevo.ID), 'NULL')  + ', '
      +'        pd_modificado       = ''S'' '
      +' WHERE  pd_cuit || pd_estableci in (' + FSelectedListCuitEstab.CommaText + ')'
      +'    AND pd_tipo_asignacion = ''A'' '
  );

  FModificado := True;
  fpCambiarPreventor.Close;
  tbRefrescarClick(Sender);
end;

procedure TfrmGestionEmpPrevAsig.CargaListas(Columna: TColumn);
var
  i: integer;
begin
  if (Columna.Field.FieldName = 'SELECTED') then
  begin
    i := FSelectedListID.IndexOf(sdqConsulta.fieldbyname('PD_ID').Value);

    if (i = -1) then
      FSelectedListID.AddObject(
          sdqConsulta.fieldbyname('PD_ID').Value,
          sdqConsulta.GetBookmark
      )
    else begin
      {$IFDEF VER150}
      sdqConsulta.FreeBookmark(FSelectedListID.Objects[i]);
      {$ENDIF}
      FSelectedListID.Delete(i);
    end;

    i := FSelectedListCuitEstab.IndexOf(
        sdqConsulta.fieldbyname('EP_CUIT').AsString +
        sdqConsulta.fieldbyname('EP_ESTABLECI').AsString
    );

    if (i = -1) then
      FSelectedListCuitEstab.AddObject(
          sdqConsulta.fieldbyname('EP_CUIT').AsString +
          sdqConsulta.fieldbyname('EP_ESTABLECI').AsString,
          sdqConsulta.GetBookmark
      )
    else begin
      {$IFDEF VER150}
      sdqConsulta.FreeBookmark(TBookmark(FSelectedListCuitEstab.Objects[i]));
      {$ENDIF}
      FSelectedListCuitEstab.Delete(i);
    end;
    Columna.Grid.Refresh;
  end;

end;


procedure TfrmGestionEmpPrevAsig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FSelectedListCuitEstab) then
    FreeAndNil(FSelectedListCuitEstab);

  if Assigned(FSelectedListID) then
    FreeAndNil(FSelectedListID);
end;

procedure TfrmGestionEmpPrevAsig.fpCambiarPreventorEnter(Sender: TObject);
var
  ExistePosible: byte;
  sSQL, sWHERE: string;
begin
  sSQL := 'SELECT  it_id as ID, it_codigo AS codigo, it_nombre AS descripcion FROM  art.pit_firmantes ';
  sWHERE := ' WHERE 1=1 ';

  ExistePosible :=
      ValorSqlInteger(
            'SELECT 1 FROM hpd_preventores_data '
          + ' WHERE pd_tipo_asignacion = ''P'' '
          + '   AND pd_id IN ('+ FSelectedListID.CommaText + ')'
      );

  if ExistePosible = 1 then
  begin
    fraPreventorNuevo.Locked := True;
    fraPreventorNuevo.Clear;
    fraPreventorNuevo.Sql :=
        sSQL + sWHERE + ' AND it_codigo = '+ SqlValue(fraPreventorFiltro.Codigo);
    fraPreventorNuevo.Reload;
    fraPreventorNuevo.Codigo := fraPreventorFiltro.Codigo;
  end else
  begin
    fraPreventorNuevo.Locked := False;
    fraPreventorNuevo.Sql := sSQL + sWHERE;
  end;

end;

procedure TfrmGestionEmpPrevAsig.FSFormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Self.Close;
end;

procedure TfrmGestionEmpPrevAsig.FSFormShow(Sender: TObject);
var
  i: integer;
  sError: string;
begin
   inherited;
  Self.Caption := FCaption;
  FCodPreventor := CodPreventor;
  fraPreventorFiltro.Codigo := FCodPreventor;
  edCantTrabajadoresMin.Value := FRgoMin;
  sError := '';

  if FRgoMax > 0 then
    edCantTrabajadoresMax.Value := FRgoMax
  else
    edCantTrabajadoresMax.Text := '';

  cmbSector.ClearChecks;
  cmbTipoEmpresaPrev.ClearChecks;
  cmbCategoriaRiesgo.ClearChecks;

  try
    sError := 'SECTOR';
    for i := 0 to high(FSectores) do
      cmbSector.Checked[
          cmbSector.Items.IndexOf(RightStr(FSectores[i], Length(FSectores[i]) - FEspacioCut) )
      ] := True;

    if not FSinPreventor then
      cbSinPreventor.Checked := False
    else
      cbSinPreventor.Checked := True;

    sError := 'TIPO EMPRESA';
    for i := 0 to high(FTiposPreven) do
      cmbTipoEmpresaPrev.Checked[
          cmbTipoEmpresaPrev.Items.IndexOf(RightStr(FTiposPreven[i], Length(FTiposPreven[i]) - FEspacioCut))
      ] := True;
  
    sError := 'CATEGORIA RIESGO';
    for i := 0 to high(FCatsRiesgo) do
      cmbCategoriaRiesgo.Checked[
          cmbCategoriaRiesgo.Items.IndexOf(RightStr(FCatsRiesgo[i], Length(FCatsRiesgo[i]) - FEspacioCut))
      ] := True;
  except
    on e: Exception do
      ShowMessage('EXISTE UN ERROR DE DATOS EN: ' + sError
         +chr(13) + 'CONSULTE CON DEPARTAMENTO DE SISTEMAS'
         +chr(13)
         +chr(13) + 'Procedimiento: TfrmGestionEmpPrevAsig.FSFormShow'
         +chr(13) + e.Message);
  end;
  tbRefrescarClick(nil);
end;

{ TfrmGestionEmpPrevAsig }

function TfrmGestionEmpPrevAsig.GetCatRiesgo(index: integer): string;
begin
  Result := FCatsRiesgo[index];
end;

function TfrmGestionEmpPrevAsig.GetCodPreventor: string;
begin
  Result := FCodPreventor;
end;

function TfrmGestionEmpPrevAsig.GetContrato: integer;
begin
  Result := FContrato;
end;

function TfrmGestionEmpPrevAsig.GetSector(index: integer): string;
begin
  Result := FSectores[index];
end;

function TfrmGestionEmpPrevAsig.GetTipoPreven(index: integer): string;
begin
  Result := FTiposPreven[index];
end;

procedure TfrmGestionEmpPrevAsig.SetCodPreventor(const Value: string);
begin
  FCodPreventor := Value;
end;

procedure TfrmGestionEmpPrevAsig.SetContrato(const Value: integer);
begin
  FContrato := Value;
end;

procedure TfrmGestionEmpPrevAsig.SetRangoCapitaMax(const Value: integer);
begin
  FRgoMax := Value;
end;

procedure TfrmGestionEmpPrevAsig.SetRangoCapitaMin(const Value: integer);
begin
  FRgoMin := Value;
end;

procedure TfrmGestionEmpPrevAsig.SetSector(index: integer; Value: string);
begin
  SetLength(FSectores, Length(FSectores) + 1);
  FSectores[index] := Value;
end;

procedure TfrmGestionEmpPrevAsig.SetTipoPreven(index: integer; const Value: string);
begin
  SetLength(FTiposPreven, Length(FTiposPreven) + 1);
  FTiposPreven[index] := Value;
end;

procedure TfrmGestionEmpPrevAsig.SetCatRiesgo(index: integer; const Value: string);
begin
  SetLength(FCatsRiesgo, Length(FCatsRiesgo) + 1);
  FCatsRiesgo[index] := Value;
end;

procedure TfrmGestionEmpPrevAsig.tbRefrescarClick(Sender: TObject);
begin
  VerificarMultiple(['Aplicar Consulta',
                     fraTipoFiltroSrt,
                     (not fraSubTipoFiltro.IsSelected) or
                     (fraSubTipoFiltro.IsSelected and fraTipoFiltroSrt.IsSelected),
                     'Debe especificar también el tipo de empresa']);

  SelectedList.Clear;
  FSelectedListCuitEstab.Clear;
  FSelectedListID.Clear;
  Armarquery;
  RefreshData;
end;

function TfrmGestionEmpPrevAsig.GetSinPreventor: Boolean;
begin
  Result := FSinPreventor;
end;

procedure TfrmGestionEmpPrevAsig.GridCellClick(Column: TColumn);
begin
  inherited;
  CargaListas(Column);
end;

procedure TfrmGestionEmpPrevAsig.SetSinPreventor(const Value: Boolean);
begin
  FSinPreventor := Value;
end;

function TfrmGestionEmpPrevAsig.GetAsignados: Boolean;
begin
  Result := FAsig;
end;

function TfrmGestionEmpPrevAsig.GetPosiblesAsignados: Boolean;
begin
  Result := FAsigPosibles;
end;

procedure TfrmGestionEmpPrevAsig.GridDrawColumnCell(Sender: TObject; const
    Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (gdSelected in State) then
  begin
    Grid.Canvas.Brush.Color := clHighlight;
    Grid.Canvas.Font.Color := clAqua;
    Grid.Canvas.Font.Style := Font.Style + [fsBold];
    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State) ;
  end;
  inherited;
end;

procedure TfrmGestionEmpPrevAsig.GridGetCellParams(Sender: TObject; Field:
    TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if IsPosibleAsig then
    AFont.Color := clPurple;

  if not sdqConsulta.FieldByName('PD_IDEXCLUSIVO').IsNull then
    Background := clMoneyGreen;

end;

procedure TfrmGestionEmpPrevAsig.GridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #32 then
    CargaListas(Grid.ColumnByField['SELECTED']);
end;

function TfrmGestionEmpPrevAsig.IsPosibleAsig: Boolean;
begin
  Result := sdqConsulta.FieldByName('PD_TIPO_ASIGNACION').AsString = 'P';
end;

procedure TfrmGestionEmpPrevAsig.SetAsignados(const Value: Boolean);
begin
  FAsig := Value;
end;

procedure TfrmGestionEmpPrevAsig.SetPosiblesAsignados(const Value: Boolean);
begin
  FAsigPosibles := Value;
end;

procedure TfrmGestionEmpPrevAsig.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  stsBar.Panels[0].Text := 'Registros: ' + IntToStr(sdqConsulta.RecordCount);
end;

procedure TfrmGestionEmpPrevAsig.tbCPClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmReasignacionCP, frmReasignacionCP, tmvModal, frmPrincipal.mnuReasigCP);
end;

procedure TfrmGestionEmpPrevAsig.tbDetalleCUITClick(Sender: TObject);
var
  frmAsignacionesDetalle: TfrmAsignacionesDetalle;
begin
  frmAsignacionesDetalle := TfrmAsignacionesDetalle.Create(Self);
  try
    sdqConsulta.DisableControls;
    frmAsignacionesDetalle.Contrato   := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
    frmAsignacionesDetalle.FormStyle  := fsNormal;
    frmAsignacionesDetalle.Visible    := False;
    frmAsignacionesDetalle.ShowModal;
    sdqConsulta.EnableControls;
  finally
    FreeAndNil(frmAsignacionesDetalle);
  end;


end;


{actualiza que la desasignación de los registros actuales deban quedar como posibles asignaciones
al preventor alctual al que se le estan desaasignando, si es que correponde}
procedure TfrmGestionEmpPrevAsig.VerificarPosiblesAlActual(
    ListaPDID, IDPrevSugerido, NombrePrevSugerido: string);
var
  sSQL: string;
begin
  {replica el registro, si se cimple el criterio}
  sSQL :=
    'INSERT INTO hpd_preventores_data'
      + '   SELECT  NULL, '   
      + '           pd_cuit, '
      + '           pd_idempresa, '
      + '           pd_nombre_empre, '
      + '           pd_estableci, '
      + '           pd_nombre_estab, '
      + '           pd_tiposrt, '
      + '           pd_tipoprevencion, '
      + '           pd_idreferente, '
      + '           pd_actividad, '
      + '           pd_idfirmante, '
      + '           pd_itcodigo, '
      + '           pd_nombrefirmante, '
      + '           pd_eventual, '
      + '           pd_coordinador, '
      + '           pd_empleados, '
      + '           pd_telefonos, '
      + '           pd_domicilio, '
      + '           pd_localidad, '
      + '           pd_cpostal, '
      + '           pd_relacion, '
      + '           pd_cpostala, '
      + '           pd_contrato, '
      + '           pd_descripcion_grpeco, '
      + '           pd_descripcion_cat_riesgo, '
      + '           pd_idcategoriariesgo, '
      + '           pd_provincia, '
      + '           pd_provincia_codigo, '
      + '           pd_idprevsugerido, '
      + '           pd_idtipoestabprev, '
      + '           pd_idhep, '
      + '           pd_rango_capita, '
      + '           pd_sector, '
      + '           ''X'', ' {asignación bandera para el update siguiente en el código}
      + '           pd_modificado, '
      + '           pd_cargamax, '
      + '           pd_cargaactual, '
      + '           pd_idexclusivo, '
      + '           pd_vigencia_asig, '
      + '           pd_motivoasignacion, '
      + '           pd_observacion, '
      + '           pd_itreferente, '
      + '           pd_idcoordinador, '
      + '           pd_nombreprevsugerido '
      +'  FROM  hpd_preventores_data hpd '
      +' WHERE  hpd.pd_idfirmante IN '
      +'              (SELECT  pc_idpreventor '
      +'                 FROM  hys.hpc_preventorcpostal '
      +'                WHERE  pc_codigo = hpd.pd_cpostal '
      +'                   AND pc_provincia = hpd.pd_provincia_codigo '
      +'                   AND pc_idpreventor = hpd.pd_idfirmante '
      +'                   AND pc_fechabaja IS NULL) '
      +'    AND hpd.pd_id IN (' + ListaPDID + ') '
      +'    AND hpd.pd_tipo_asignacion = ''A'' '
      ;

  EjecutarSql(sSQL);
  EjecutarSql(
            'UPDATE  hpd_preventores_data '
          + '   SET  pd_idfirmante      = NULL,  '
          + '        pd_nombrefirmante  = NULL,  '
          + '        pd_coordinador     = NULL,  '
          + '        pd_tipo_asignacion = ''P'', '
          + '        pd_idprevsugerido      = ' + IDPrevSugerido + ', '
          + '        pd_nombreprevsugerido  = ' + NombrePrevSugerido
          + ' WHERE  pd_tipo_asignacion = ''X'' '
  );

end;

end.



