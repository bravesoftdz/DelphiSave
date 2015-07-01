unit UnListConsPrest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unfraPrestador, StdCtrls, ExtCtrls, Db,
  SDEngine, Mask, ToolEdit, ArtComboBox, Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ShortCutControl, QueryToFile,
  ExportDialog, artSeguridad, SortDlg, Menus, QueryPrint, Placemnt, unArtFrame, unArtDBAwareFrame, unCustomForm,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ArtDBGrid, ImgList, XPMenu, unFraCodigoDescripcion,
  unfraCtbTablas, DateComboBox, unArtDbFrame, RxToolEdit, RxPlacemnt;

type
  TfrmConsPrest = class(TfrmCustomForm)
    dbgDatos: TARTDBGrid;
    CoolBar: TCoolBar;                                                 
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton3: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    ToolButton6: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    ExportDialog: TExportDialog;
    ShortCutControl: TShortCutControl;
    SortDialog: TSortDialog;
    dsGrilla: TDataSource;
    sdqGrilla: TSDQuery;
    tbOcultarMostrar: TToolButton;
    ToolButton2: TToolButton;
    sdqLocalidad: TSDQuery;
    dsLocalidad: TDataSource;
    sdqProvincia: TSDQuery;
    dsProvincia: TDataSource;
    sdqTipoPrestador: TSDQuery;
    dsTipoPrestador: TDataSource;
    sdqEspecialidad: TSDQuery;
    dsEspecialidad: TDataSource;
    pmImprimir: TPopupMenu;
    mnuImprimirDatosPrest: TMenuItem;
    QueryPrint: TQueryPrint;
    mnuImprimirResultados: TMenuItem;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    lblTotales: TLabel;
    ToolButton1: TToolButton;
    PrintDialog: TPrintDialog;
    mnuImprimirCartilla: TMenuItem;
    pmExportar: TPopupMenu;
    mnuExportarResultados: TMenuItem;
    mnuExportarCartilla: TMenuItem;
    ExportDialogCartilla: TExportDialog;
    mnuExportarSecuenciasPrest: TMenuItem;
    sdqSecuencias: TSDQuery;
    ExportDialogSecuencias: TExportDialog;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    tsFiltros1: TTabSheet;
    Label23: TLabel;
    Label1: TLabel;
    Bevel4: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cmbLocalidad: TArtComboBox;
    cmbProvincia: TArtComboBox;
    cmbAuditable: TComboBox;
    chkGBA: TCheckBox;
    gbDatosContratos: TGroupBox;
    chkDocumento: TCheckBox;
    chkRenovAutom: TCheckBox;
    chkContrCargados: TCheckBox;
    chkContrVencidos: TCheckBox;
    chkContratoSocial: TCheckBox;
    chkActaAutoridades: TCheckBox;
    chkCV: TCheckBox;
    chkTitulo: TCheckBox;
    chkMatricula: TCheckBox;
    fraRegionSanitaria: TfraCtbTablas;
    dcbFechaAlta: TDateComboBox;
    fraCartillaWeb: TfraCtbTablas;
    Bevel1: TBevel;
    Label2: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    lbRanking: TLabel;
    CmbRanking: TComboBox;
    chkSinEspecialidad: TCheckBox;
    fraStaticCTBCaracter: TfraStaticCTB_TABLAS;
    chkVisible: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    cmbReqSegMP: TComboBox;
    Bevel2: TBevel;
    GroupBox1: TGroupBox;
    rbPrestActivo: TRadioButton;
    rbPrestNoActivo: TRadioButton;
    rbPrestTodos: TRadioButton;
    Bevel3: TBevel;
    gbDatosMedicos: TGroupBox;
    chkResonancia: TCheckBox;
    chkTAC: TCheckBox;
    chkElectromiograma: TCheckBox;
    chkRX: TCheckBox;
    chkFKT: TCheckBox;
    chkEcografia: TCheckBox;
    fraGestor: TfraCodigoDescripcion;
    lblGestor: TLabel;
    chkReferente: TCheckBox;
    chkCEM: TCheckBox;
    fraTipoPrestador: TfraCodigoDescripcion;
    fraEspecialidad: TfraCodigoDescripcion;
    chkVisadoDocum: TCheckBox;
    chkCartaCompromiso: TCheckBox;
    chkComplejidad: TCheckBox;
    chkRespCivil: TCheckBox;
    chkhabilitado: TCheckBox;
    rgEstLegajo: TRadioGroup;
    tbEstadoLegajos: TToolButton;
    fraEstadoSeguro: TfraCtbTablas;
    procedure FormCreate(Sender: TObject);
    procedure cmbLocalidadCloseUp(Sender: TObject);
    procedure cmbLocalidadExit(Sender: TObject);
    procedure cmbLocalidadDropDown(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbOcultarMostrarClick(Sender: TObject);
    procedure cmbProvinciaExit(Sender: TObject);
    procedure mnuImprimirDatosPrestClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField;AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkGBAClick(Sender: TObject);
    procedure chkSinEspecialidadClick(Sender: TObject);
    procedure mnuExportarResultadosClick(Sender: TObject);
    procedure mnuExportarCartillaClick(Sender: TObject);
    procedure mnuExportarSecuenciasPrestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbReqSegMPCloseUp(Sender: TObject);
  private
    bVerDatosAud: Boolean;
    fraPrestador: TfraPrestador;
    
    function ValidarFiltros: Boolean;
    procedure OnPrestadorChange(Sender: TObject);
  public
  end;

var
  frmConsPrest: TfrmConsPrest;
  sSqlSecuencias: String;

implementation

uses
  unPrincipal, General, UnRepManPrestador, unDmPrincipal, AnsiSql, VCLExtra, CustomDlgs;

{$R *.DFM}

procedure TfrmConsPrest.FormCreate(Sender: TObject);
begin
  inherited;

  sdqLocalidad.Open;
  sdqProvincia.Open;
  sdqTipoPrestador.Open;
  sdqEspecialidad.Open;
  pcFiltros.ActivePage := tsFiltros0;

  fraPrestador := TfraPrestador.Create(Self);
  with fraPrestador do
  begin
    //Parent           := pnlFiltros;
    Parent           := tsFiltros0;
    Top              := 15;
    Left             := 2;
   // Width            := pnlFiltros.Width - 4;
    Width            := tsFiltros0.Width - 4;
    Anchors          := [akLeft, akTop, akRight];
    OnChange         := OnPrestadorChange;
    ShowBajas        := True;
    {$IFDEF RED_PRES}
    ShowNombreFanta  := True;
    {$ENDIF}
    ShowInvisibles   := True;
  end;
  
  cmbAuditable.ItemIndex := 3;   // Todos  

  with fraStaticCTBCaracter do
  begin
    Clave     := 'TATEN';
    ShowBajas := True;
  end;

  with fraRegionSanitaria do
  begin
    Clave     := 'REGSA';
    ShowBajas := True;
  end;

  with fraCartillaWeb do
  begin
    Clave     := 'CAWEB';
    ShowBajas := True;
  end;

  with fraGestor do
  begin
    TableName   := 'SIN.sgp_gruposprestador';
    FieldID     := 'gp_id';
    FieldCodigo := 'gp_codigo';
    FieldDesc   := 'gp_descripcion';
    FieldBaja   := 'gp_fechabaja';
    ShowBajas   := True;
  end;

  with fraTipoPrestador do
  begin
    TableName   := 'MTP_TIPOPRESTADOR';
    FieldID     := 'TP_CODIGO';
    FieldCodigo := 'TP_CODIGO';
    FieldDesc   := 'TP_DESCRIPCION';
    FieldBaja   := 'TP_FBAJA';
    ShowBajas   := false;
    ExtraFields := ', TP_DATOSMEDICOS ';
  end;

  with fraEspecialidad do
  begin
    TableName   := 'mes_especialidades';
    FieldID     := 'es_codigo';
    FieldCodigo := 'es_codigo';
    FieldDesc   := 'es_descripcion';
    FieldBaja   := 'es_fechabaja';
    ShowBajas   := false;
  end;

  fraEstadoSeguro.Clave := 'SEGMP';

  vclextra.LockControls([fraEspecialidad]);

  //camarillo - 07/02/07 - clave mediante la cual se muestran o no los datos personales
  //                       de los prestadores que son auditores en la grilla
  bVerDatosAud := Seguridad.Claves.IsActive('VerDatosAuditores');

  LockControl(chkVisible, not Seguridad.Claves.IsActive('PermisoDesmarcarVisible'));
  tbEstadoLegajos.Enabled := Seguridad.Claves.IsActive('VerEstLegajos');
  rgEstLegajo.Enabled := Seguridad.Claves.IsActive('VerEstLegajos');
  {$IFDEF CEM}
  mnuImprimirDatosPrest.Visible := False;
  {$ENDIF}
end;

procedure TfrmConsPrest.cmbLocalidadCloseUp(Sender: TObject);
begin
  if cmbLocalidad.Text <> '' then
  begin
    cmbProvincia.Text       := sdqLocalidad.FieldByName('PV_DESCRIPCION').AsString;
    cmbProvincia.FieldValue := sdqLocalidad.FieldByName('CP_PROVINCIA').AsString;
    cmbProvincia.Enabled    := False;
  //  cmbTipoPrestador.SetFocus;
  end
  else
  begin
    cmbProvincia.Enabled    := True;
    cmbProvincia.Text       := '';
    cmbProvincia.FieldValue := '';
  end;
end;

procedure TfrmConsPrest.cmbLocalidadExit(Sender: TObject);
begin
  if Trim(cmbLocalidad.Text) = '' then
  begin
    cmbProvincia.Enabled := True;
    cmbProvincia.SetFocus;
  end;
end;

{------[Si cmbProvincia tiene un valor => cmbLocalidad va a traer las localidades de esa provincia.]-----------------------------}
procedure TfrmConsPrest.cmbLocalidadDropDown(Sender: TObject);
var
  Sql: String;
begin
  sdqLocalidad.Close;
  if (Trim(cmbProvincia.Text) = '') then
  begin
    Sql :=
      'SELECT CP_CODIGO, CP_LOCALIDAD, CP_PROVINCIA, PV_DESCRIPCION' +
       ' FROM CCP_CODIGOPOSTAL, CPV_PROVINCIAS' +
      ' WHERE CP_PROVINCIA = PV_CODIGO' +
        ' AND CP_PROVINCIA <> ''1''';

    if (Trim(cmbLocalidad.Text) <> '') then
      Sql := Sql + ' AND CP_LOCALIDAD LIKE ''' + Trim(cmbLocalidad.Text) + '%''';

    // Sql := Sql + ' order by CP_CODIGO ';
  end
  else
  begin
    Sql :=
      'SELECT CP_CODIGO, CP_LOCALIDAD, CP_PROVINCIA, PV_DESCRIPCION' +
       ' FROM CCP_CODIGOPOSTAL, CPV_PROVINCIAS' +
      ' WHERE CP_PROVINCIA = PV_CODIGO' +
        ' AND CP_PROVINCIA = ' + SqlString(cmbProvincia.FieldValue, True) +
        ' AND CP_PROVINCIA <> ''1''';

    if (Trim(cmbLocalidad.Text) <> '') then
      Sql := Sql + ' AND CP_LOCALIDAD LIKE ''' + Trim(cmbLocalidad.Text) + '%''';
  end;

  sdqLocalidad.SQL.Text := Sql;
  sdqLocalidad.Open;
end;

procedure TfrmConsPrest.tbRefrescarClick(Sender: TObject);
var
  bSinEspecialidad: Boolean;
  Sql, sSQLAux: String;
  SqlFrom: String;
begin
  SqlFrom := '';
  Sql     := '';
  if ValidarFiltros then
  begin
    sdqGrilla.Close;
    bSinEspecialidad := chkSinEspecialidad.Checked;

    Sql :=
      'SELECT ca_clave CUIT, ca_secuencia SECUENCIA, ca_identificador IDENTIFICADOR, ca_descripcion RAZONSOCIAL,' +
            ' ca_nombrefanta NOMBREFANTA, TPR.tp_descripcion TIPOPREST,' +
              IIF(bSinEspecialidad, ' NULL ESPECIALIDAD', ' es_descripcion ESPECIALIDAD') + ', ca_ranking RANKING,' +
              ' ca_localidad LOCALIDAD, pv_descripcion DESCPROVINCIA,' +
              IIF(bVerDatosAud, ' ca_domicilio DOMICILIO', ' decode(au_prestador, Null, ca_domicilio, Null) DOMICILIO') + ',' +
              IIF(bVerDatosAud, ' ca_codarea || '' '' || ca_telefono TELEFONO', ' decode(au_prestador, Null, ca_codarea || '' '' || ca_telefono, Null) TELEFONO') + ',' +
              IIF(bVerDatosAud, ' ca_direlectronica EMAIL', ' decode(au_prestador, Null, ca_direlectronica, Null) EMAIL') + ',' +
              ' ca_fax FAX, ca_celular CELULAR, ca_fechabaja FECHABAJA, ca_visible VISIBLE, ca_responsable RESPONSABLE,' +
              ' ca_observaciones OBSERVACIONES, ca_habilitaciones HABILITACIONES, ca_rmn RESONANCIA, ca_tac TAC,' +
              ' ca_emg ELECTROM, ca_ambulancia AMBULANCIA, ca_piso PISO, ca_cti TI, ca_uco UCO, ca_auti AUTI,' +
              ' ca_quirofanos QUIROFANO, ca_guardias GUARDIAS, ca_rayos RAYOS, ca_conex CONEX, ca_Auditable Auditable,' +
              ' ca_recladebitos RECLADEBITOS, ca_contrato CONTRATO, ca_ContratoMutual CONTRATO_MUTUAL_VIG,' +
              ' TCARACTER.tb_descripcion CARACTER, TCOMPROB.tb_descripcion TIPOCOMPROBANTE,' +
              ' TGANANCIAS.tb_descripcion GANANCIAS, TIVA.tb_descripcion IVA, TTCUENTA.tb_descripcion TIPOCUENTA,' +
              ' ib_retencion INGRESOSBRUTOS, ba_nombre BANCO, sm_id, sm_vigenciadesde, sm_vigenciahasta,' +
              ' siniestro.get_seguroproximovencimiento(ca_identificador) as ProximoVencimiento,' +
              ' decode(tp_datosmedicos, ''N'', '''', ctb_segmp.tb_descripcion) as EstadoMalaPraxis, sm_fechabaja, ca_cartillaweb CARTILLAWEB,' +
              ' art.varios.get_regionsanitaria(cp_codigo, decode(cp_provincia, ''1'', ca_calle, cp_localidad)) RegionSanitaria,' +
              ' ca_rx RX, ca_fkt FKT, ca_guardiaact, ca_desdeguardiaact, ca_hastaguardiaact, ca_guardiapas,' +
              ' ca_desdeguardiapas, ca_hastaguardiapas, ca_habilitado, ca_cem, ca_esreferente, ca_visadodocum, ' +
              ' TPO.tp_descripcion TIPOPOLIZA, cs_nombre COMPASEGURADORA, sm_sumaasegurada, sm_prima, CA_ECOGRAFIA, gp_descripcion, ' +   // TK 17094
              IIF(tbEstadoLegajos.Down, ' art.prestadores.get_estadolegajo(CA_IDENTIFICADOR) estadolegajo, ', 'null estadolegajo, ') +
              IIF(bSinEspecialidad,
                ' Null pe_guardiaact, Null pe_desdeguardiaact, Null pe_hastaguardiaact, Null pe_guardiapas,' +
                ' Null pe_desdeguardiapas, Null pe_hastaguardiapas',
                ' pe_guardiaact, pe_desdeguardiaact, pe_hastaguardiaact, pe_guardiapas, pe_desdeguardiapas,' +
                ' pe_hastaguardiapas') +
         ' FROM ccp_codigopostal, msm_seguromalapraxis, cpr_prestador, ctb_tablas TCARACTER, ctb_tablas TCOMPROB,' +
              ' ctb_tablas TGANANCIAS, ctb_tablas TIVA, ctb_tablas TTCUENTA, ctb_tablas CTB_SEGMP, cpv_provincias,' +
              ' mtp_tipoprestador TPR, cib_ingresosbrutos, mau_auditores, zba_bancos, mtp_tipopoliza TPO, mcs_companiaseguro, ' +    // TK 17094
              ' SIN.sgp_gruposprestador ' +
              IIF(bSinEspecialidad, '', ', cpe_prestaespeci, mes_especialidades') +
        ' WHERE ''TATEN'' = TCARACTER.tb_clave(+)' +
          ' AND ca_tipo = TCARACTER.tb_codigo(+)' +
          ' AND ''TCOMP'' = TCOMPROB.tb_clave(+)' +
          ' AND ca_tipocomprobante = TCOMPROB.tb_codigo(+)' +
          ' AND ''RETGA'' = TGANANCIAS.tb_clave(+)' +
          ' AND ca_retganancias = TGANANCIAS.tb_codigo(+)' +
          ' AND ''SIVA'' = TIVA.tb_clave(+)' +
          ' AND ca_iva = TIVA.tb_codigo(+)' +
          ' AND ''BCOCT'' = TTCUENTA.tb_clave(+)' +
          ' AND ca_tipocuenta = TTCUENTA.tb_codigo(+)' +
          ' AND ca_ingresosbrutos = ib_codigo (+)' +
          ' AND ca_banco = ba_codigo (+)' +
          ' AND ca_provincia = pv_codigo(+)' +
          ' AND ca_especialidad = TPR.tp_codigo(+)' +
          ' AND art.siniestro.get_seguromalapraxisactivo(ca_identificador) = sm_id(+)' +
          ' AND ca_identificador = au_prestador(+)' +
          IIF(bSinEspecialidad, '',
            ' AND ca_identificador = pe_prestador(+)' +
            ' AND pe_especialidad = es_codigo(+)' +
            ' AND pe_fechabaja (+)is null') +     // Lu 24/07/2009 arreglo de Paula.
          ' AND ca_provincia = ib_provincia (+)' +
          ' AND ca_codpostal=cp_codigo(+)' +
          ' AND DECODE(ca_provincia, ''1'', ca_calle, ca_localidad) = cp_localidad(+)' +
          ' AND siniestro.get_seguroactivo(ca_identificador) = CTB_SEGMP.tb_codigo (+)' +
          ' AND ''SEGMP'' = CTB_SEGMP.tb_clave (+)' +
          ' AND ca_identificador = sm_prestador(+)' +
          ' AND sm_idtipopoliza = TPO.tp_id(+) ' +  // TK 17094
          ' AND sm_idcompania = cs_id(+) ' +         // TK 17094
          ' AND ca_idgrupousuario = gp_id(+)';

    sSqlSecuencias := Sql;  // TK 14947 Guardo en sSqlSecuencias el Sql del refrescar sin filtros adicionales, para exportar.

    if fraPrestador.IDPrestador <> 0 then
      Sql := Sql + ' AND ca_identificador = ' + SqlValue(fraPrestador.IDPrestador);

    if Trim(cmbLocalidad.Text) <> '' then
      Sql := Sql + ' AND ca_codPostal = ' + SqlString(cmbLocalidad.FieldValue, True);

    if Trim(cmbProvincia.Text) <> '' then
      Sql := Sql + ' AND ca_provincia = ' + SqlString(cmbProvincia.FieldValue, True);

    if not fraTipoPrestador.IsEmpty then
      Sql := Sql + ' AND ca_especialidad = ' + SqlString(fraTipoPrestador.Codigo, True);

    if Trim(CmbRanking.Text) <> '' then
      Sql := Sql + ' AND ca_ranking = ''' + Trim(CmbRanking.Text) + '''';

    if not fraEspecialidad.IsEmpty then
      Sql := Sql + ' AND pe_especialidad = ' + SqlString(fraEspecialidad.Codigo, True);

    {if chkHabilitado.Checked then
      Sql := Sql + ' AND ca_habilitado = ''S'''; }

    if chkReferente.Checked then
      Sql := Sql + ' AND ca_esreferente = ''S''';

    if chkCEM.Checked then
      Sql := Sql + ' AND ca_cem = ''S''';

    if chkVisible.Checked then
      Sql := Sql + ' AND ca_Visible = ''S''';

    if chkVisadoDocum.Checked then
      Sql := Sql + ' AND ca_visadodocum = ''S'' ';

  {  if chkResonancia.Checked then
      Sql := Sql + ' AND ca_Rmn = ''S''';   }   // TK 48500

 {   if chkTAC.Checked then
      Sql := Sql + ' AND ca_TAC = ''S''';   }   // TK 48500

 {   if chkElectromiograma.Checked then
      Sql := Sql + ' AND ca_emg = ''S''';   }   // TK 48500

 {   if chkRX.Checked then
      Sql := Sql + ' AND ca_rx = ''S''';    }   // TK 48500

 {   if chkFKT.Checked then
      Sql := Sql + ' AND ca_fkt = ''S''';   }   // TK 48500

 {   if chkEcografia.Checked then
      Sql := Sql + ' AND ca_ecografia = ''S''';  }   // TK 48500


    sSQLAux := ' AND EXISTS (SELECT 1 ' +
                              'FROM CPC_PRESTADORCONTRATO A ' +
                             'WHERE A.PC_IDPRESTADOR = CA_IDENTIFICADOR ' +
                               'AND A.PC_FECHABAJA IS NULL ' +
                               'AND A.%s = ''S'' ' +
                               'AND A.PC_IDCONTRATO = (SELECT MAX(B.PC_IDCONTRATO) ' +
                                                        'FROM CPC_PRESTADORCONTRATO B ' +
                                                       'WHERE B.PC_IDPRESTADOR = CA_IDENTIFICADOR ' +
                                                         'AND B.PC_FECHABAJA IS NULL))';

    if chkRenovAutom.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_RENOVAUTOMATICA']);

    if chkDocumento.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_DOCUMENTO']);

    if chkContrCargados.Checked then
      Sql := Sql + ' AND EXISTS (SELECT 1 ' +
                                  'FROM CPC_PRESTADORCONTRATO A ' +
                                 'WHERE A.PC_IDPRESTADOR = CA_IDENTIFICADOR ' +
                                   'AND A.PC_FECHABAJA IS NULL)';


    if chkContrVencidos.Checked then
      Sql := Sql + ' AND EXISTS (SELECT 1 ' +
                                  'FROM CPC_PRESTADORCONTRATO A ' +
                                 'WHERE A.PC_IDPRESTADOR = CA_IDENTIFICADOR ' +
                                   'AND A.PC_FECHABAJA IS NULL ' +
                                   'AND NVL(A.PC_RENOVAUTOMATICA, ''N'') = ''N'' ' +
                                   'AND A.PC_VIGENCIAHASTA < TRUNC(SYSDATE) ' +
                                   'AND A.PC_IDCONTRATO = (SELECT MAX(B.PC_IDCONTRATO) ' +
                                                            'FROM CPC_PRESTADORCONTRATO B ' +
                                                           'WHERE B.PC_IDPRESTADOR = CA_IDENTIFICADOR ' +
                                                             'AND B.PC_FECHABAJA IS NULL))';

    if chkContratoSocial.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_CONTRATOSOCIAL']);

    if chkActaAutoridades.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_ACTAAUTORIDADES']);

    if chkCV.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_CV']);

    if chkTitulo.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_TITULO']);

    if chkMatricula.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_MATRICULA']);

    if chkhabilitado.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_HABILITACION']);

    if chkComplejidad.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_COMPLEJIDAD']);

    if chkRespCivil.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_RESPCIVIL']);

    if chkCartaCompromiso.Checked then
      Sql := Sql + Format(sSQLAux, ['PC_CARTACOMP']);

    if chkGBA.Checked then
      Sql := Sql + ' AND ca_Provincia = ''2'' AND cp_gba is not null ';

    if rbPrestActivo.Checked then
      Sql := Sql + ' AND ca_fechabaja is null'
    else if rbPrestNoActivo.Checked then
      Sql := Sql + ' AND ca_fechabaja is not null';

    if not(fraCartillaWeb.IsEmpty) then
      Sql := Sql + ' AND ca_cartillaweb = ' +  SqlValue(fraCartillaWeb.Codigo);

    mnuImprimirCartilla.Enabled := (chkSinEspecialidad.Checked and not(fraCartillaWeb.IsEmpty));
    mnuExportarCartilla.Enabled := (chkSinEspecialidad.Checked and not(fraCartillaWeb.IsEmpty));

    case cmbAuditable.ItemIndex of
      0: Sql := Sql + ' AND ca_Auditable = ''S''';     // Si
      1: Sql := Sql + ' AND ca_Auditable = ''N''';     // No
      2: Sql := Sql + ' AND ca_Auditable IS NULL';   // Sin marcar
    end;

    case cmbReqSegMP.ItemIndex of     // Requiere seguro de mala praxis. (cambio hecho por TK 23172)
      0: Sql := Sql + ' AND Siniestro.Get_EstadoSeguroMalaPraxis(CA_IDENTIFICADOR) <> 5 ';   // Si requiere
      1: Sql := Sql + ' AND Siniestro.Get_EstadoSeguroMalaPraxis(CA_IDENTIFICADOR) = 5 ';    // No requiere
    end;

    {case cmbEstadoSegMP.ItemIndex of
      0: Sql := Sql + ' AND Siniestro.get_seguroactivo(CA_IDENTIFICADOR) = 6 ';
      1: Sql := Sql + ' AND Siniestro.get_seguroactivo(CA_IDENTIFICADOR) = 7 ';
      2: Sql := Sql + ' AND Siniestro.get_seguroactivo(CA_IDENTIFICADOR) = 8 ';
    end;}

    if not fraEstadoSeguro.IsEmpty then
      Sql := Sql + ' AND Siniestro.get_seguroactivo(CA_IDENTIFICADOR) = ' + fraEstadoSeguro.Codigo;

    if fraStaticCTBCaracter.IsSelected then
      Sql := Sql + ' AND CA_TIPO = ' + SqlValue(fraStaticCTBCaracter.Value);

    if fraRegionSanitaria.IsSelected then
      Sql := Sql + ' AND cp_regionsanitaria = ' + SqlValue(fraRegionSanitaria.Codigo);

    if not dcbFechaAlta.IsEmpty then
      Sql := Sql + ' AND ca_fechalta = TO_DATE (' + SqlValue(dcbFechaAlta.Text ) + ', ''DD/MM/YYYY'')';

    if not fraGestor.IsEmpty then
      Sql := Sql + ' AND gp_id = ' + SqlValue(fraGestor.ID);

    case rgEstLegajo.ItemIndex of
      0: Sql := Sql + ' AND art.prestadores.get_estadolegajo(CA_IDENTIFICADOR) = ''Completo'' ';
      1: Sql := Sql + ' AND art.prestadores.get_estadolegajo(CA_IDENTIFICADOR) = ''Incompleto'' ';
    end;

    OpenQuery(sdqGrilla, Sql);

    lblTotales.Caption := 'Registros encontrados: ' + IntToStr(sdqGrilla.RecordCount);
  end; // del validar.
end;

function TfrmConsPrest.ValidarFiltros:boolean;
begin
  Result := True;

  if (fraPrestador.IDPrestador = 0) and
     (Trim(cmbLocalidad.Text) = '') and
     (Trim(cmbProvincia.Text) = '') and
     (fraTipoPrestador.IsEmpty) and
     (Trim(CmbRanking.Text) = '') and
     (fraEspecialidad.IsEmpty) and
     //(not chkHabilitado.Checked) and
     (cmbAuditable.ItemIndex = 3) and
     (fraStaticCTBCaracter.IsEmpty) and
     (not rbPrestActivo.Checked) and
     (not rbPrestNoActivo.Checked) and
     (fraRegionSanitaria.IsEmpty) and
     (dcbFechaAlta.IsEmpty) and
     (not chkRenovAutom.Checked) and
     (not chkDocumento.Checked) and
     (not chkContrCargados.Checked) and
     (not chkContrVencidos.Checked) and
     (not chkContratoSocial.Checked) and
     (not chkActaAutoridades.Checked) and
     (not chkCV.Checked) and
     (not chkTitulo.Checked) and
     (not chkhabilitado.Checked) and
     (not chkComplejidad.Checked) and
     (not chkRespCivil.Checked) and
     (not chkCartaCompromiso.Checked) and

   //  (not chkResonancia.Checked) and      // TK 48500
   //  (not chkTAC.Checked) and
   //  (not chkElectromiograma.Checked) and
   //  (not chkRX.Checked) and
   //  (not chkFKT.Checked) and
   //  (not chkEcografia.Checked) and
     (not chkMatricula.Checked) and
     (fraGestor.IsEmpty) then
  begin
    MsgBox('Debe completar al menos un Filtro mas para refrescar la Grilla.', MB_ICONEXCLAMATION);
    {$IFDEF RED_PRES}
    fraPrestador.CuitFocus;
    {$ENDIF}
    Result := False;
  end;
end;

procedure TfrmConsPrest.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsPrest.tbLimpiarClick(Sender: TObject);
begin
  fraPrestador.Limpiar;
  cmbLocalidad.FieldValue     := '';
  cmbProvincia.FieldValue     := '';
  fraTipoPrestador.Clear;
  CmbRanking.ItemIndex        := -1;
  fraEspecialidad.Clear;
  //chkHabilitado.Checked       := False;
  chkGBA.Checked              := False;
  chkVisible.Checked          := True;
  chkSinEspecialidad.Checked  := False;
  rbPrestActivo.Checked       := True;
  cmbProvincia.Enabled        := True;
  cmbAuditable.ItemIndex      := 3;   // Todos
  cmbReqSegMP.ItemIndex       := 2;
  fraEstadoSeguro.Clear;
  fraStaticCTBCaracter.Clear;
  fraCartillaWeb.Limpiar;
  dcbFechaAlta.Clear;
  chkRenovAutom.Checked       := False;
  chkDocumento.Checked        := False;
  chkContrCargados.Checked    := False;
  chkContrVencidos.Checked    := False;
  chkContratoSocial.Checked   := False;
  chkActaAutoridades.Checked  := False;
  chkCV.Checked               := False;
  chkTitulo.Checked           := False;
  chkMatricula.Checked        := False;
  chkReferente.Checked        := false;
  chkCEM.Checked              := false;
  chkVisadoDocum.Checked      := false;
  chkhabilitado.Checked       := False;
  chkComplejidad.Checked      := False;
  chkRespCivil.Checked        := False;
  chkCartaCompromiso.Checked  := False;
  rgEstLegajo.ItemIndex       := 2;

  fraRegionSanitaria.Limpiar;
  fraGestor.Clear;

  sdqGrilla.Close;
  lblTotales.Caption := ' ';
  {$IFDEF RED_PRES}
  fraPrestador.CuitFocus;
  {$ENDIF}  
end;

procedure TfrmConsPrest.tbExportarClick(Sender: TObject);
begin
  tbExportar.CheckMenuDropdown;
end;

procedure TfrmConsPrest.tbOrdenarClick(Sender: TObject);
begin
  if not sdqGrilla.IsEmpty then
    SortDialog.Execute;
end;

procedure TfrmConsPrest.tbOcultarMostrarClick(Sender: TObject);
begin
  if tbOcultarMostrar.Down then
  begin
    pcFiltros.Visible     := False;
    tbOcultarMostrar.Hint := 'Mostrar Filtros';
    tbOcultarMostrar.ImageIndex := 10;
  end
  else
  begin
    pcFiltros.Visible     := True;
    tbOcultarMostrar.Hint := 'Ocultar Filtros';
    tbOcultarMostrar.ImageIndex := 11;
  end;
end;

procedure TfrmConsPrest.cmbProvinciaExit(Sender: TObject);
begin
  if not (sdqProvincia.FieldByName('PV_DESCRIPCION').AsString = cmbProvincia.Text) then
  begin
    if sdqProvincia.Locate('PV_DESCRIPCION', cmbProvincia.Text, []) then
      cmbProvincia.FieldValue := sdqProvincia.FieldByName('PV_CODIGO').AsString
    else
      cmbProvincia.FieldValue := '';
  end;
end;

procedure TfrmConsPrest.mnuImprimirDatosPrestClick(Sender: TObject);
var
  rptManPrestador: TrptManPrestador;
begin
  if not sdqGrilla.IsEmpty then
  begin
    rptManPrestador := TrptManPrestador.Create(Self);
    try
      rptManPrestador.ShowPreview(sdqGrilla.FieldByName('IDENTIFICADOR').AsInteger,
                                  fraTipoPrestador.Codigo,
                                  sdqGrilla.FieldByName('CARACTER').AsString,
                                  fraTipoPrestador.Descripcion,
                                  sdqGrilla.FieldByName('TIPOCOMPROBANTE').AsString,
                                  sdqGrilla.FieldByName('INGRESOSBRUTOS').AsString,
                                  sdqGrilla.FieldByName('GANANCIAS').AsString,
                                  sdqGrilla.FieldByName('IVA').AsString);
    finally
      rptManPrestador.Free;
    end;
  end;
end;

procedure TfrmConsPrest.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsPrest.mnuImprimirResultadosClick(Sender: TObject);
begin
  if (not sdqGrilla.IsEmpty) and (PrintDialog.Execute) then
  begin
    with QueryPrint.Subtitle.Lines do
    begin  // para agregar Filtros de seleccion en el reporte. by LU.
      Clear;
      Add(' Filtros:');

      if fraPrestador.IDPrestador <> 0 then
        Add('    Prestador ' + fraPrestador.RazonSocial);

      if Trim(cmbLocalidad.Text) <> '' then
        Add('    Localidad ' + cmbLocalidad.Text);

      if Trim(cmbProvincia.FieldValue) <> '' then
        Add('    Provincia ' + cmbProvincia.Text);

      if not fraTipoPrestador.IsEmpty then
        Add('    Tipo de Prestador ' + fraTipoPrestador.Descripcion);

      if not fraEspecialidad.IsEmpty then
        Add('    Especialidad ' + fraEspecialidad.Descripcion);

      {if chkHabilitado.Checked then            // Lu TK 1028
        Add('    Prestador Habilitado ');}

      if chkGBA.Checked then
        Add('    GBA ');

      if chkVisible.Checked then
        Add('    Visible ');

      if chkRenovAutom.Checked then
        Add('    Renov. Automática ');

      if chkDocumento.Checked then
        Add('    Documento ');

      if chkContrCargados.Checked then
        Add('    Contr. Cargados ');

      if chkContrVencidos.Checked then
        Add('    Contr. Vencidos ');

      if chkContratoSocial.Checked then
        Add('    Contrato Social ');

      if chkActaAutoridades.Checked then
        Add('    Acta de designación de autoridades ');

      if chkCV.Checked then
        Add('    Currículum Vitae ');

      if chkTitulo.Checked then
        Add('    Título ');

      if chkMatricula.Checked then
        Add('    Matrícula ');

      if chkhabilitado.Checked then
        Add('    Habilitación ');

      if chkComplejidad.Checked then
        Add('    Complejidad ');

      if chkRespCivil.Checked then
        Add('    Responsabilidad Civil ');

      if chkCartaCompromiso.Checked then
        Add('    Carta Compromiso ');

      if not(fraCartillaWeb.IsEmpty) then
        Add('    Cartilla Web: ' + fraCartillaWeb.Descripcion);

      case rgEstLegajo.ItemIndex of
        0: Add('    Legajo completo ');
        1: Add('    Legajo incompleto ');
      end;


      case cmbAuditable.ItemIndex of
        0:  Add('    Auditable');             // Si
        1:  Add('    No Auditable');          // No
        2:  Add('    Sin Marca Auditable');   // Sin marcar
      end;

      if fraStaticCTBCaracter.IsSelected then
        Add('    Carácter ' + fraStaticCTBCaracter.cmbDescripcion.Text);
    end;

    if (Sender = mnuImprimirCartilla) then
    begin
      QueryPrint.Title.Text := 'Consulta de Cartilla Web';
      QueryPrint.FieldByName['CUIT'].Visible          := False;
      QueryPrint.FieldByName['SECUENCIA'].Visible     := False;
      QueryPrint.FieldByName['IDENTIFICADOR'].Visible := False;
      QueryPrint.FieldByName['ESPECIALIDAD'].Visible  := False;
      QueryPrint.FieldByName['RAZONSOCIAL'].Visible   := False;
      QueryPrint.FieldByName['NOMBREFANTA'].Visible   := True;
    end
    else
    begin
      QueryPrint.Title.Text := 'Consulta de Prestadores';
      QueryPrint.FieldByName['CUIT'].Visible          := True;
      QueryPrint.FieldByName['SECUENCIA'].Visible     := True;
      QueryPrint.FieldByName['IDENTIFICADOR'].Visible := True;
      QueryPrint.FieldByName['ESPECIALIDAD'].Visible  := True;
      QueryPrint.FieldByName['RAZONSOCIAL'].Visible   := True;
      QueryPrint.FieldByName['NOMBREFANTA'].Visible   := False;
    end;

    QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
    QueryPrint.Print;
  end;
end;

procedure TfrmConsPrest.dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                              Highlight: Boolean);
begin
  if not sdqGrilla.FieldByName('FECHABAJA').IsNull then
  begin
    if Highlight then
    begin
      Background := clMaroon;
      AFont.Color := clWhite;
    end
    else
      AFont.Color := clRed;
  end;
end;

procedure TfrmConsPrest.OnPrestadorChange(Sender: TObject);
begin
end;

procedure TfrmConsPrest.chkGBAClick(Sender: TObject);
begin
  LockControls([cmbLocalidad, cmbProvincia], chkGBA.Checked);
  if chkGBA.Checked then
  begin
    cmbLocalidad.Clear;
    cmbProvincia.Clear;
  end;
end;

procedure TfrmConsPrest.chkSinEspecialidadClick(Sender: TObject);
begin
  if chkSinEspecialidad.Checked then
  begin
    fraEspecialidad.Clear;
    VclExtra.LockControl(fraEspecialidad);
  end
  else
    VclExtra.LockControl(fraEspecialidad, False);
end;

procedure TfrmConsPrest.mnuExportarResultadosClick(Sender: TObject);
begin
  if not sdqGrilla.IsEmpty then
    ExportDialog.Execute;
end;

procedure TfrmConsPrest.mnuExportarCartillaClick(Sender: TObject);
begin
  if not sdqGrilla.IsEmpty then
    ExportDialogCartilla.Execute;
end;

procedure TfrmConsPrest.mnuExportarSecuenciasPrestClick(Sender: TObject);  // TK 14947
var sSql: String;
begin
  Verificar(not(sdqGrilla.Active and not sdqGrilla.IsEmpty), nil,
           'Debe seleccionar un registro (Prestador) para exportar el Listado.');
  sSql := sSqlSecuencias;
  sSql := sSql + ' and ca_clave = :cuit ' +
                 ' Order by ca_secuencia';

  OpenQueryEx(sdqSecuencias, [sdqGrilla.FieldByName('CUIT').AsString] ,sSql);
  if not sdqSecuencias.IsEmpty then
    ExportDialogSecuencias.Execute;
end;

procedure TfrmConsPrest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmConsPrest.cmbReqSegMPCloseUp(Sender: TObject);
begin
  if (cmbReqSegMP.ItemIndex = 1) then   // Si no requiere seguro de mala praxis, deshabilito y dejo en opcion "Todos"  el combo de Estado de Seg. mala praxis. // TK 23172
  begin
    fraEstadoSeguro.Clear;
    fraEstadoSeguro.Enabled   := False;
    fraEstadoSeguro.color     := clMenu;
  end
  else begin
    fraEstadoSeguro.Enabled   := True;
    fraEstadoSeguro.color     := clWindow;
  end;
end;

end.
