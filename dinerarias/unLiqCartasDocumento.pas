unit unLiqCartasDocumento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox, SinEdit, unArtFrame,
  unFraCodigoDescripcion, PatternEdit, IntEdit, CurrEdit,
  unfraFirmantes, Menus, Buttons, unfraDelegacion, unArtDBAwareFrame, unArt,
  unFraDomicilio;

type
  TDatosRemitente = record
    Nombre :String;
    Domicilio :String;
    CPostal :String;
    Localidad :String;
    Provincia :String;
    Telefono :String;
    HorAtencionDesde :String;
    HorAtencionHasta :String;
  end;

  TfrmLiqCartasDoc = class(TfrmCustomGridABM)
    Label5: TLabel;
    gbCriterioBusqueda: TGroupBox;
    rbFechaAprobacion: TRadioButton;
    rbNroSiniestro: TRadioButton;
    Sindde: TSinEdit;
    dcFechaAprob: TDateComboBox;
    gbFormatosCarta: TGroupBox;
    rbTransferencia: TRadioButton;
    rbPorCheque: TRadioButton;
    dcFechaDisp: TDateComboBox;
    Label4: TLabel;
    gbDirDestinatario: TGroupBox;
    edImporteABM: TCurrencyEdit;
    Label7: TLabel;
    Bevel1: TBevel;
    pmImprimir: TPopupMenu;
    mnuImprimir: TMenuItem;
    mnuReimprimir: TMenuItem;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edSiniestroABM: TEdit;
    edNroLiqABM: TEdit;
    edTrabajadorABM: TEdit;
    Label9: TLabel;
    edObservaciones: TEdit;
    Label12: TLabel;
    edChequeNombre: TEdit;
    btnImprimir: TBitBtn;
    fraDelegacion: TfraDelegacion;
    Bevel2: TBevel;
    Label14: TLabel;
    gbCriterios: TGroupBox;
    rbPendientes: TRadioButton;
    rbEnviadas: TRadioButton;
    Label6: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    btnReplicar: TBitBtn;
    btnCartaEnviada: TBitBtn;

    fraFirmanteABM: TfraFirmantes;
    fraDirDestinatario: TfraDomicilio;
    fraFirmanteFijo: TfraFirmantes;
    procedure rbFechaAprobacionClick(Sender: TObject);
    procedure rbNroSiniestroClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnReplicarClick(Sender: TObject);
    procedure btnCartaEnviadaClick(Sender: TObject);
  private
    SiniestroAct, OrdenAct, RecaidaAct, NumLiquiAct :Integer;
    DescrConceptoAct, NroCartaAct, CodFormatoAct, TablaAct :String;
    UsuIngreso, Destinatario, DniTrabajador, CuilAct, SiniestroCompleto, EmpresaAct :String;
    CuitEmpresaAct, PorcAct, CodFormatoEmpAct, NroCartaEmpAct :String;
    bEsEmpresaConfidencial, bEsPagoMensual, bReplicar, bEsAnticipo, bVerEnviada :Boolean;
    FechaAccidenteAct, FechaAprobAct :TDate;
    (*DatosRemitente :TDatosRemitente;*)
    function GetSqlCondiciones :String;
    function ValidarDatos :Boolean;
    function ValidarDireccion :Boolean;
    function ValidarImpresion :Boolean;
    function GetFechaDisposicion(iSiniestro, iOrden, iRecaida, iNumLiqui:Integer; iFechaDesde :TDate) :TDate;
    function GetProximoNroCartaDoc :String;
    function CancelarExisteOtraLiquidacion :Boolean;
    function GetCodigoFormato(bAlTrabajador: Boolean): String;
    procedure CargarDatosPanel(iSiniestro, iOrden, iRecaida, iNumLiqui:Integer; sTabla: String);
    procedure DoGenerarCartaDocPago(bAlTrabajador :Boolean);
    procedure DoModificarDatos(enTransaccion, AlTrabajador: Boolean; var IdDestCarta: TTableId);
    procedure BloquearControlesABM(bHabilitar :Boolean);
    procedure ImprimirCartaDoc(NroCarta: String; VerEnviada: Boolean; bEsSinGobernacion :Boolean);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
  public
  end;

var
  frmLiqCartasDoc: TfrmLiqCartasDoc;

implementation

uses CustomDlgs, unDmPrincipal, AnsiSQL, StrFuncs, General, unCartaDocumento,
     unComunes, unSesion, Printers, unRptCartaDocumento, unRptCartaDocHeader,
     unCustomDataModule;

const MinFechaAprobado = '15/01/2000'; //fecha de inicio del envío de cartas doc. por pago a trabajadores

{$R *.DFM}

procedure TfrmLiqCartasDoc.rbFechaAprobacionClick(Sender: TObject);
begin
  dcFechaAprob.Visible := True;
  Sindde.Visible       := False;
  dcFechaAprob.SetFocus;
end;

procedure TfrmLiqCartasDoc.rbNroSiniestroClick(Sender: TObject);
begin
  dcFechaAprob.Visible := False;
  Sindde.Visible       := True;
  Sindde.SetFocus;
end;

procedure TfrmLiqCartasDoc.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  if ValidarDatos then
  begin
    sSql := GetSqlCondiciones + SortDialog.OrderBy;
    OpenQuery(sdqConsulta, sSql, True);
    inherited;
    mnuReimprimir.Enabled := rbEnviadas.Checked;
    mnuImprimir.Enabled   := rbPendientes.Checked;
  end;
end;

function TfrmLiqCartasDoc.ValidarDatos :Boolean;
begin
  Verificar((rbFechaAprobacion.Checked) and (dcFechaAprob.Date=0),dcFechaAprob,'Debe ingresar la fecha de aprobación.');
  Verificar((rbFechaAprobacion.Checked) and (dcFechaAprob.Date>DBDate),dcFechaAprob,'La fecha de aprobación no puede ser mayor a la fecha actual.');
  Verificar((rbNroSiniestro.Checked) and (Sindde.IsEmpty),Sindde,'Debe ingresar el siniestro.');
  Result := True;
end;

procedure TfrmLiqCartasDoc.FormCreate(Sender: TObject);
begin
  inherited;
  fraFirmanteABM.Area     := AREA_DIN;
  fraFirmanteABM.Modulo   := MODULO_PAGOTRABAJADOR;
  fraFirmanteFijo.Area    := AREA_DIN;
  fraFirmanteFijo.Modulo  := MODULO_PAGOTRABAJADOR;
  dcFechaAprob.Date       := StrToDate(MinFechaAprobado);
  dcFechaAprob.MinDate    := StrToDate(MinFechaAprobado);
  UsuIngreso              := Sesion.LoginName;
  EnableButtons(False);
  ShowActived             := False;
  fraDelegacion.OnLine    := False;
end;

function TfrmLiqCartasDoc.GetSqlCondiciones :String;
var
  vTmp1, vTmp2, pCondicion, cCondicion :String;
begin
//----------------cargo las condiciones según los filtros------------------------
  if rbFechaAprobacion.Checked then //por fecha de aprobación
  begin
    pCondicion := pCondicion + ' AND pr_faprobado >= ' + SqlDate(dcFechaAprob.Date);
    cCondicion := cCondicion + ' AND le_faprobado >= ' + SqlDate(dcFechaAprob.Date);
  end
  else begin //por nro de siniestro
    pCondicion := pCondicion + ' AND pr_siniestro= ' + SqlNumber(Sindde.Siniestro);
    cCondicion := cCondicion + ' AND le_siniestro= ' + SqlNumber(Sindde.Siniestro);
  end;

  if not(fraDelegacion.IsEmpty) then
  begin
    pCondicion := pCondicion + ' AND pr_delegacion= ' + SqlValue(fraDelegacion.Codigo);
    cCondicion := cCondicion + ' AND le_delegacion= ' + SqlValue(fraDelegacion.Codigo);
  end;

  if rbPendientes.Checked then
  begin
    pCondicion := pCondicion + ' AND pr_telegramapago IS NULL';
    cCondicion := cCondicion + ' AND le_telegramapago IS NULL';
  end
  else begin
    pCondicion := pCondicion + ' AND NVL(pr_telegramapago,'''') = ''S'' ';
    cCondicion := cCondicion + ' AND NVL(le_telegramapago,'''') = ''S'' ';
  end;

//-------------------------------------------------------------------------------

  vTmp1 := 'SELECT sle1.le_siniestro, sle1.le_orden, sle1.le_recaida, sle1.le_numliqui, ' +
                 ' TO_CHAR(sle1.le_numliqui, ''FM099'') numliqui, le_porcincapacidad, ' +
                 ' armar_siniestro(sle1.le_siniestro, sle1.le_orden, sle1.le_recaida) siniestro, ' +
                 ' cp_descripcion, sle1.le_faprobado, sle1.le_imporperi, tj_nombre, cp_denpago, ex_fechaaccidente, ' +
                 ' art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) Domicilio, ' +
                 ' art.utiles.armar_localidad(tj_cpostal, tj_cpostala, tj_localidad, tj_provincia) Localidad, ' +
                 ' cp_telegrama, ''SLE'' tabla, lg_nombre, NVL(le_observacionescarta, le_comentario) Comentario, ' +
                 ' le_chequenombre ChequeNombre, le_fdisposicion, le_imporcarta, tj_documento, ' +
                 ' decode(le_base_3mopres, ''S'', le_base_3mopres, cp_adelanto) anticipo, ' +
                 ' liq.Get_CartaDocEnviadaRecibos( ' + SqlValue(AREA_DIN) + ', ' + SqlValue(AREA_CON) + ', ' + SqlValue(MODULO_PAGOTRABAJADOR) + ', tj_cuil) recibospedidos, ' +
                 ' tj_id ' +
            ' FROM sex_expedientes, ctj_trabajador, scp_conpago, ' +
                 ' sle_liquiempsin sle1, dlg_delegaciones ' +
           ' WHERE NVL(sle1.le_estado, '''')=''E'' ' +
             ' AND sle1.le_imporperi > 0 ' +
             ' AND sle1.le_siniestro=ex_siniestro ' +
             ' AND sle1.le_orden=ex_orden ' +
             ' AND sle1.le_recaida=ex_recaida ' +
             ' AND ex_cuil=tj_cuil ' +
             ' AND sle1.le_conpago=cp_conpago ' +
             ' AND cp_tipo IN (''P'', ''I'') ' +  // P=ILP, I=ILT
             ' AND cp_conpago<>''50'' ' +         //IND.INC.LAB.TEMPORARIA-REINTEGRO
             ' AND le_delegacion=lg_codigo ' +
             ' AND NOT EXISTS (SELECT 1 ' +
                               ' FROM sle_liquiempsin sle2, scp_conpago  ' +
                              ' WHERE sle1.le_siniestro=sle2.le_siniestro ' +
                                ' AND sle1.le_orden=sle2.le_orden ' +
                                ' AND sle1.le_recaida=sle2.le_recaida ' +
                                ' AND sle1.le_conpago=sle2.le_conpago ' +
                                ' AND sle1.le_numliqui<>sle2.le_numliqui ' +
                                ' AND sle2.le_imporperi>0 ' +
                                ' AND sle2.le_conpago=cp_conpago ' +
                                ' AND cp_telegrama=''S'' ' +
                                ' AND sle2.le_telegramapago = ''S'' ' +
                                ' AND NVL(sle2.le_estado,'''')=''E'') ' + cCondicion;

  vTmp2 := 'SELECT pr_siniestro, pr_orden, pr_recaida, pr_numpago, ' +
                 ' TO_CHAR(pr_numpago, ''FM099'') numpago, 0, ' +
                 ' armar_siniestro(pr_siniestro, pr_orden, pr_recaida) siniestro, ' +
                 ' cp_descripcion, pr_faprobado, pr_imporpago, tj_nombre, cp_denpago, ex_fechaaccidente, ' +
                 ' art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                 ' art.utiles.armar_localidad(tj_cpostal, tj_cpostala, tj_localidad, tj_provincia) localidad, ' +
                 ' cp_telegrama, ''SPR'' tabla, lg_nombre, NVL(pr_observacionescarta, pr_comentario) Comentario, ' +
                 ' pr_chequenombre ChequeNombre, pr_fdisposicion, pr_imporcarta, ' +
                 ' tj_documento, cp_adelanto anticipo, ' +
                 ' liq.Get_CartaDocEnviadaRecibos( ' + SqlValue(AREA_DIN) + ', ' + SqlValue(AREA_CON) + ', ' + SqlValue(MODULO_PAGOTRABAJADOR) + ', tj_cuil) recibospedidos, ' +
                 ' tj_id ' +
            ' FROM sex_expedientes, ctj_trabajador, scp_conpago, ' +
                 ' dlg_delegaciones, spr_pagoexpesin ' +
           ' WHERE pr_estado = ''E'' ' +
             ' AND pr_imporpago > 0 ' +
             ' AND pr_siniestro=ex_siniestro ' +
             ' AND pr_orden=ex_orden ' +
             ' AND pr_recaida=ex_recaida ' +
             ' AND ex_cuil=tj_cuil ' +
             ' AND pr_conpago=cp_conpago ' +
             ' AND pr_acreedor=''TA'' ' +
             ' AND pr_delegacion=lg_codigo ' + pCondicion;

  Result := vTmp1 + ' UNION ALL ' + vTmp2;
end;

procedure TfrmLiqCartasDoc.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('LE_IMPORPERI') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('LE_IMPORPERI')).Currency := True;

  if sdqConsulta.FieldByName('LE_IMPORCARTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('LE_IMPORCARTA')).Currency := True;

  if sdqConsulta.FieldByName('LE_PORCINCAPACIDAD') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('LE_PORCINCAPACIDAD')).DisplayFormat := '#0.00 %';
end;

procedure TfrmLiqCartasDoc.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmLiqCartasDoc.mnuImprimirClick(Sender: TObject);
begin
  if sdqConsulta.Active and not(sdqConsulta.Eof) and
    (Grid.SelectedRows.Count > 0) then
  begin
    btnAceptar.Enabled := False;
    with sdqConsulta do
    begin
      First;
      DisableControls;
      while not Eof do
      begin
        if Grid.SelectedRows.CurrentRowSelected then
        begin
          LoadControls;
          fpAbm.Tag := 1;
          fpAbm.ShowModal;
        end;
        Next;
      end;
      EnableControls;
      Refresh;
    end;
    btnAceptar.Enabled := True;
  end;
end;

procedure TfrmLiqCartasDoc.CargarDatosPanel(iSiniestro, iOrden, iRecaida, iNumLiqui:Integer; sTabla: String);
var
  sSql :String;
  qryDatosCarta :TSDQuery;
begin
  SiniestroAct       := iSiniestro;
  OrdenAct           := iOrden;
  RecaidaAct         := iRecaida;
  NumLiquiAct        := iNumLiqui;
  TablaAct           := sdqConsulta.FieldByName('TABLA').AsString;
  PorcAct            := sdqConsulta.FieldByName('LE_PORCINCAPACIDAD').AsString;
  DescrConceptoAct   := sdqConsulta.FieldByName('CP_DESCRIPCION').AsString;
  bEsPagoMensual     := (sdqConsulta.FieldByName('CP_TELEGRAMA').AsString = 'S');
  bEsAnticipo        := (sdqConsulta.FieldByName('ANTICIPO').AsString = 'S');
  FechaAccidenteAct  := sdqConsulta.FieldByName('EX_FECHAACCIDENTE').AsDateTime;
  FechaAprobAct      := sdqConsulta.FieldByName('LE_FAPROBADO').AsDateTime;
  Destinatario       := sdqConsulta.FieldByName('TJ_NOMBRE').AsString;
  DniTrabajador      := sdqConsulta.FieldByName('TJ_DOCUMENTO').AsString;
  SiniestroCompleto  := sdqConsulta.FieldByName('SINIESTRO').AsString;

  edSiniestroABM.Text  := sdqConsulta.FieldByName('SINIESTRO').AsString;
  edNroLiqABM.Text     := sdqConsulta.FieldByName('LE_NUMLIQUI').AsString;
  edTrabajadorABM.Text := sdqConsulta.FieldByName('TJ_NOMBRE').AsString;
  edImporteABM.Value   := iif(sdqConsulta.FieldByName('LE_IMPORCARTA').IsNull,
                              sdqConsulta.FieldByName('LE_IMPORPERI').AsCurrency,
                              sdqConsulta.FieldByName('LE_IMPORCARTA').AsCurrency);
  edObservaciones.Text := sdqConsulta.FieldByName('COMENTARIO').AsString;
  edChequeNombre.Text  := sdqConsulta.FieldByName('CHEQUENOMBRE').AsString;
  dcFechaDisp.Date     := GetFechaDisposicion(iSiniestro,iOrden,iRecaida,iNumLiqui,sdqConsulta.FieldByName('LE_FAPROBADO').AsDateTime);
  BloquearControlesABM(rbPendientes.Checked);
  bReplicar := False;

  fraDirDestinatario.Clear;
  sSql := 'SELECT mp_nombre, mp_cuit, tj_cuil, tj_nombre, NVL(dc_calle,tj_calle) calle, ' +
                ' NVL(dc_cpostal,tj_cpostal) cpostal, NVL(dc_cpostala,tj_cpostala) cpostala, ' +
                ' NVL(dc_localidad,tj_localidad) localidad, ' +
                ' NVL(dc_numero,tj_numero) numero, NVL(dc_piso,tj_piso) piso, ' +
                ' NVL(dc_departamento,tj_departamento) depto, NVL(dc_provincia,tj_provincia) provincia, ' +
                ' provtrab.pv_descripcion ProvinciaTrab, ca_nrocartadoc, tc_codigo, fi_id firma, ' +
                ' afiliacion.isempresaconfidencial(ex_cuit) EsEmpresaConfidencial, ' +
                ' mp_calle_post, mp_cpostal_post, mp_cpostala_post, mp_localidad_post, ' +
                ' mp_numero_post, mp_piso_post, mp_departamento_post, mp_provincia_post, ' +
                ' provempr.pv_descripcion ProvinciaEmpr ' +
           ' FROM cat_areatexto, sex_expedientes, ctj_trabajador, cmp_empresas, cdc_destinatariocarta, ' +
                ' cpv_provincias provtrab, cpv_provincias provempr, cfi_firma, ctc_textocarta, cca_carta ' +
          ' WHERE ex_siniestro= ' + SqlInt(iSiniestro) +
            ' AND ex_orden= ' + SqlInt(iOrden) +
            ' AND ex_recaida= ' + SqlInt(iRecaida) +
            ' AND ex_cuil=tj_cuil ' +
            ' AND ex_cuit=mp_cuit ' +
            ' AND tj_provincia=provtrab.pv_codigo(+) ' +
            ' AND mp_provincia_post=provempr.pv_codigo ' +
            ' AND ca_idtextocarta=tc_id(+) ' +
            ' AND ca_idfirma=fi_id(+) ' +
            ' AND ca_idareatexto = at_id(+) ' +
            ' AND '''' || at_area(+)=' + SqlValue(AREA_CON) +
            ' AND at_modulo(+)=' + SqlValue(MODULO_PAGOTRABAJADOR) +
            ' AND ca_idexpediente(+)= ex_id ' +
            ' AND ca_numliqui(+)=' + SqlInt(iNumLiqui) +
            ' AND ca_iddestinatariocarta=dc_id(+) ' +
            ' AND ca_fechabaja IS NULL ' +
         ' UNION ' +
          'SELECT mp_nombre, mp_cuit, tj_cuil, tj_nombre, NVL(dc_calle,tj_calle) calle, ' +
                ' NVL(dc_cpostal,tj_cpostal) cpostal, NVL(dc_cpostala,tj_cpostala) cpostala, ' +
                ' NVL(dc_localidad,tj_localidad) localidad, ' +
                ' NVL(dc_numero,tj_numero) numero, NVL(dc_piso,tj_piso) piso, ' +
                ' NVL(dc_departamento,tj_departamento) depto, NVL(dc_provincia,tj_provincia) provincia, ' +
                ' provtrab.pv_descripcion ProvinciaTrab, ca_nrocartadoc, tc_codigo, fi_id firma, ' +
                ' afiliacion.isempresaconfidencial(ex_cuit) EsEmpresaConfidencial, ' +
                ' mp_calle_post, mp_cpostal_post, mp_cpostala_post, mp_localidad_post, ' +
                ' mp_numero_post, mp_piso_post, mp_departamento_post, mp_provincia_post, ' +
                ' provempr.pv_descripcion ProvinciaEmpr ' +
           ' FROM cat_areatexto, sex_expedientes, ctj_trabajador, cmp_empresas, cdc_destinatariocarta, ' +
                ' cpv_provincias provtrab, cpv_provincias provempr, cfi_firma, ctc_textocarta, cca_carta ' +
          ' WHERE ex_siniestro= ' + SqlInt(iSiniestro) +
            ' AND ex_orden= ' + SqlInt(iOrden) +
            ' AND ex_recaida= ' + SqlInt(iRecaida) +
            ' AND ex_cuil=tj_cuil ' +
            ' AND ex_cuit=mp_cuit ' +
            ' AND tj_provincia=provtrab.pv_codigo(+) ' +
            ' AND mp_provincia_post=provempr.pv_codigo ' +
            ' AND ca_idtextocarta=tc_id(+) ' +
            ' AND ca_idfirma=fi_id(+) ' +
            ' AND ca_idareatexto = at_id(+) ' +
            ' AND '''' || at_area(+)=' + SqlValue(AREA_DIN) +
            ' AND at_modulo(+)=' + SqlValue(MODULO_PAGOTRABAJADOR) +
            ' AND ca_idexpediente(+)= ex_id ' +
            ' AND ca_numliqui(+)=' + SqlInt(iNumLiqui) +
            ' AND ca_iddestinatariocarta=dc_id(+) ' +
            ' AND ca_fechabaja IS NULL ' +
       ' ORDER BY ca_nrocartadoc';
  qryDatosCarta := GetQuery(sSql);
  try
    NroCartaAct    := qryDatosCarta.FieldByName('ca_nrocartadoc').AsString;
    CodFormatoAct  := qryDatosCarta.FieldByName('tc_codigo').AsString;
    CuilAct        := qryDatosCarta.FieldByName('tj_cuil').AsString;
    EmpresaAct     := qryDatosCarta.FieldByName('mp_nombre').AsString;
    CuitEmpresaAct := qryDatosCarta.FieldByName('mp_cuit').AsString;

    if rbPendientes.Checked then
      fraFirmanteABM.Cargar(fraFirmanteFijo.Value)
    else
      fraFirmanteABM.Cargar(qryDatosCarta.FieldByName('firma').AsInteger);

    bEsEmpresaConfidencial := (qryDatosCarta.FieldByName('EsEmpresaConfidencial').AsString = 'S');
    if bEsEmpresaConfidencial then
      fraDirDestinatario.Cargar(qryDatosCarta.FieldByName('mp_calle_post').AsString,
                                qryDatosCarta.FieldByName('mp_cpostal_post').AsString,
                                qryDatosCarta.FieldByName('mp_localidad_post').AsString,
                                qryDatosCarta.FieldByName('mp_numero_post').AsString,
                                qryDatosCarta.FieldByName('mp_piso_post').AsString,
                                qryDatosCarta.FieldByName('mp_departamento_post').AsString,
                                qryDatosCarta.FieldByName('mp_provincia_post').AsString,
                                qryDatosCarta.FieldByName('mp_cpostala_post').AsString)
    else
      fraDirDestinatario.Cargar(qryDatosCarta.FieldByName('calle').AsString,
                                qryDatosCarta.FieldByName('cpostal').AsString,
                                qryDatosCarta.FieldByName('localidad').AsString,
                                qryDatosCarta.FieldByName('numero').AsString,
                                qryDatosCarta.FieldByName('piso').AsString,
                                qryDatosCarta.FieldByName('depto').AsString,
                                qryDatosCarta.FieldByName('provincia').AsString,
                                qryDatosCarta.FieldByName('cpostala').AsString);

    NroCartaEmpAct   := '';
    CodFormatoEmpAct := '';
    if (qryDatosCarta.RecordCount > 1) then //para la carta a la empresa
    begin
      qryDatosCarta.Next;
      NroCartaEmpAct   := qryDatosCarta.FieldByName('ca_nrocartadoc').AsString;
      CodFormatoEmpAct := qryDatosCarta.FieldByName('tc_codigo').AsString;
    end;

  finally
    qryDatosCarta.Free;
  end;
end;

function TfrmLiqCartasDoc.GetFechaDisposicion(iSiniestro, iOrden, iRecaida, iNumLiqui:Integer; iFechaDesde :TDate) :TDate;
var
  sInfo, sSql :String;
  tmpFecha :TDate;
begin
  if TablaAct = 'SLE' then
    sSql := ' SELECT le_fdisposicion ' +
              ' FROM sle_liquiempsin ' +
             ' WHERE le_siniestro = ' + SqlInt(iSiniestro) +
               ' AND le_orden = ' + SqlInt(iOrden) +
               ' AND le_recaida = ' + SqlInt(iRecaida) +
               ' AND le_numliqui = ' + SqlInt(iNumliqui)
  else
    sSql := ' SELECT pr_fdisposicion ' +
              ' FROM spr_pagoexpesin ' +
             ' WHERE pr_siniestro = ' + SqlInt(iSiniestro) +
               ' AND pr_orden = ' + SqlInt(iOrden) +
               ' AND pr_recaida = ' + SqlInt(iRecaida) +
               ' AND pr_numpago = ' + SqlInt(iNumliqui);
  tmpFecha := ValorSqlDateTime(sSql);

  if (tmpFecha = 0) then
  begin
    //si no lo habia cargado antes, calculo 15 dias habiles a partir de
    //la recepcion del dictámen
    sInfo := ValorSql('SELECT liq.get_infoincapacidad(' + SqlInt(iSiniestro) + ',' +
                                                          SqlInt(iOrden) + ',' +
                                                          SqlDate(iFechaDesde) + ',Actualdate) ' +
                      ' FROM dual');

    sSql := ' SELECT art.amebpba.CalcDiasHabiles(NVL(MAX(ev_fecharecepcion),To_Date(''01011900'',''ddmmyyyy'')),15) ' +
              ' FROM sev_eventosdetramite ' +
             ' WHERE ev_siniestro = ' + SqlInt(iSiniestro) +
               ' AND ev_orden = ' + SqlInt(iOrden) +
               ' AND ev_recaida = ' + SqlInt(iRecaida) +
               ' AND ev_evento > 0 ' +
               ' AND ev_codigo = ' + SqlValue(Copy(sInfo, 31, 3)) +
               ' AND ev_porcincapacidad = ' + SqlValue(Trim(Copy(sInfo, 24, 7)));
    tmpFecha := ValorSqlDateTime(sSql);
  end;
  Result := iif(tmpFecha=23,0,tmpFecha);
end;

procedure TfrmLiqCartasDoc.btnImprimirClick(Sender: TObject);
begin
  if ValidarImpresion then
  begin
    MsgBox('Coloque formularios de carta documento en la impresora.', MB_ICONINFORMATION);
    DoGenerarCartaDocPago(True);
    if bEsAnticipo then DoGenerarCartaDocPago(False);
    if (fpAbm.Tag = 0) then sdqConsulta.Refresh;
    fpAbm.ModalResult := MrOk;
  end;
end;

procedure TfrmLiqCartasDoc.ImprimirCartaDoc(NroCarta: String; VerEnviada: Boolean; bEsSinGobernacion :Boolean);
var
  sSql: String;
  IdCarta: TTableId;
  Accion: TSalidaReport;
  iCantidadCopias: Integer;
begin
  sSql := 'SELECT CA_ID ' +
            'FROM CCA_CARTA ' +
           'WHERE CA_NROCARTADOC=:NroCarta';
  IdCarta := ValorSqlIntegerEx(sSql, [NroCarta]);

  if VerEnviada then
  begin
    Accion          := srPreview;
    iCantidadCopias := 1;
  end
  else begin
    PrintDialog.Copies := 3;
    if not PrintDialog.Execute then
      exit;

    Accion          := srPrint;
    iCantidadCopias := PrintDialog.Copies;
  end;

  DoImprimirCarta(IdCarta, taDinerarias, Accion, tmNone, iCantidadCopias,
                  True, True, False, False, True, False, False, True,
                  bEsSinGobernacion, False, True, True, True, 'PAPIE');
end;

procedure TfrmLiqCartasDoc.DoGenerarCartaDocPago(bAlTrabajador :Boolean);
var
  sSql: String;
  bEsReimpresion :Boolean;
  iFormato, iIdExped: Integer;
  IdDestCarta: TTableId;
begin
  if ((rbPendientes.Checked and CancelarExisteOtraLiquidacion) or not(ValidarDireccion)) or
     not(ValidarEmpresaConfidencial(SiniestroAct, OrdenAct, RecaidaAct, AREA_DIN)) then
    Exit;

  try
    bEsReimpresion := ((NroCartaAct <> '') or (NroCartaEmpAct <> '')) and not(bReplicar);
    if not(bEsReimpresion) then
    begin
      CodFormatoAct := GetCodigoFormato(bAlTrabajador);
      NroCartaAct   := GetProximoNroCartaDoc;
    end
    else if not(bAlTrabajador) then //si es a la empresa
    begin
      CodFormatoAct := CodFormatoEmpAct;
      NroCartaAct   := NroCartaEmpAct;
    end;

    if not(bVerEnviada) then
    begin
      BeginTrans;

      DoModificarDatos(True, bAlTrabajador, IdDestCarta);

      if bEsReimpresion then
      begin
        sSql := 'UPDATE cca_carta ' +
                  ' SET ca_usureimpresion = ' + SqlValue(UsuIngreso) + ',' +
                      ' ca_fechareimpresion = Sysdate ' +
                ' WHERE ca_nrocartadoc = ' + SqlValue(NroCartaAct);
        EjecutarSqlST(sSql);
      end
      else begin
        sSql :='SELECT utiles.get_idtextocarta(:CodFormato) FROM DUAL';
        iFormato := ValorSqlIntegerEx(sSql, [CodFormatoAct]);

        DoInsertarCarta(iFormato, SiniestroAct, OrdenAct, RecaidaAct, fraFirmanteABM.Codigo,
                        AREA_DIN, False, IdDestCarta, Iif(bAlTrabajador, tdOtros, tdEmpresa),
                        '', 0, 0, 0, NumLiquiAct, 0, NroCartaAct);

        if bAlTrabajador then  // esto lo hago para saber a que trabajador se le envía la carta
        begin
          sSql := 'UPDATE cca_carta' +
                    ' SET ca_idtrabajador = ' + SqlValue(sdqConsulta.FieldByName('TJ_ID').AsInteger) +
                  ' WHERE ca_nrocartadoc = ' + SqlValue(NroCartaAct);
          EjecutarSqlST(sSql);
        end;
      end;

      if TablaAct = 'SLE' then
        sSql := 'UPDATE sle_liquiempsin ' +
                  ' SET le_telegramapago = ''S'' ' +
                ' WHERE le_siniestro = ' + SqlInt(SiniestroAct) +
                  ' AND le_orden = ' + SqlInt(OrdenAct) +
                  ' AND le_recaida = ' + SqlInt(RecaidaAct) +
                  ' AND le_numliqui = ' + SqlInt(NumLiquiAct) +
                  ' AND le_telegramapago IS NULL'
      else
        sSql := 'UPDATE spr_pagoexpesin ' +
                  ' SET pr_telegramapago = ''S'' ' +
                ' WHERE pr_siniestro = ' + SqlInt(SiniestroAct) +
                  ' AND pr_orden = ' + SqlInt(OrdenAct) +
                  ' AND pr_recaida = ' + SqlInt(RecaidaAct) +
                  ' AND pr_numpago = ' + SqlInt(NumLiquiAct) +
                  ' AND pr_telegramapago IS NULL';
      EjecutarSqlST(sSql);
    end;

    iIdExped := Get_IdExpediente(SiniestroAct, OrdenAct, RecaidaAct);
    ImprimirCartaDoc(NroCartaAct, bVerEnviada, Is_SiniestroDeGobernacion(iIdExped));

    CommitTrans;     // Tk de Delia Almiron (15/12/2009)

    if not(bVerEnviada) then
      NroCartaAct := '';
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al intentar generar la carta');
    end;
  end; //try
end;

function TfrmLiqCartasDoc.ValidarDireccion :Boolean;
begin
  Result := fraDirDestinatario.IsValid;
end;

function TfrmLiqCartasDoc.GetProximoNroCartaDoc :String;
begin
  GetProximoNroCartaDoc := GetNroCartaDocCompleto(GetNroCartaDocReducido(taDinerarias), taDinerarias);
end;

function TfrmLiqCartasDoc.ValidarImpresion :Boolean;
begin
  Verificar(fraFirmanteABM.IsEmpty, fraFirmanteABM, 'Falta seleccionar el firmante.');
  Verificar(dcFechaDisp.Date = 0, dcFechaDisp, 'Debe ingresar la fecha disposición.');
  Verificar(dcFechaDisp.Date < FechaAprobAct, dcFechaDisp,
            'La fecha disposición no puede ser menor que la fecha de aprobación (' +  DateToStr(FechaAprobAct) + ').');
  Verificar(edImporteABM.Value = 0, edImporteABM, 'Debe ingresar el importe.');
  Verificar((rbTransferencia.Checked) and (Trim(edObservaciones.Text)=''),
             edObservaciones, 'Debe ingresar la sucursal de pago');
  Result := True;
end;

procedure TfrmLiqCartasDoc.btnAceptarClick(Sender: TObject);
var
  IdDestCarta: TTableId;
begin
  if Validar then
  begin
    DoModificarDatos(False, True, IdDestCarta);
    sdqConsulta.Refresh;
    fpAbm.ModalResult := MrOk;
  end;
end;

function TfrmLiqCartasDoc.Validar :Boolean;
begin
  Verificar(dcFechaDisp.Date = 0, dcFechaDisp, 'Debe ingresar Fecha Disposición.');
  Verificar(dcFechaDisp.Date < FechaAprobAct, dcFechaDisp,
            'La Fecha Disposición no puede ser menor que la Fecha de Aprobación (' +  DateToStr(FechaAprobAct) + ').');
  Verificar(edImporteABM.Value = 0, edImporteABM, 'Debe ingresar Importe.');
  Result := ValidarDireccion;
end;

procedure TfrmLiqCartasDoc.DoModificarDatos(enTransaccion, AlTrabajador: Boolean; var IdDestCarta: TTableId);
var
  sSql :String;
begin
    if TablaAct = 'SLE' then
      sSql := 'UPDATE sle_liquiempsin ' +
                ' SET le_fdisposicion = ' + SqlDate(dcFechaDisp.Date) + ',' +
                    ' le_imporcarta = ' + SqlNumber(edImporteABM.Value) + ',' +
                    ' le_observacionescarta = ' + SqlValue(Trim(edObservaciones.Text)) + ',' +
                    ' le_chequenombre = ' + SqlValue(Trim(edChequeNombre.Text)) + ',' +
                    ' le_usumodif = ' + SqlValue(UsuIngreso) + ',' +
                    ' le_fmodif = actualdate ' +
              ' WHERE le_siniestro = ' + SqlInt(SiniestroAct) +
                ' AND le_orden = ' + SqlInt(OrdenAct) +
                ' AND le_recaida = ' + SqlInt(RecaidaAct) +
                ' AND le_numliqui = ' + SqlInt(NumLiquiAct)
    else
      sSql := 'UPDATE spr_pagoexpesin ' +
                ' SET pr_fdisposicion = ' + SqlDate(dcFechaDisp.Date) + ',' +
                    ' pr_imporcarta = ' + SqlNumber(edImporteABM.Value) + ',' +
                    ' pr_observacionescarta = ' + SqlValue(Trim(edObservaciones.Text)) + ',' +
                    ' pr_chequenombre = ' + SqlValue(Trim(edChequeNombre.Text)) + ',' +
                    ' pr_usumodif = ' + SqlValue(UsuIngreso) + ',' +
                    ' pr_fmodif = actualdate ' +
              ' WHERE pr_siniestro = ' + SqlInt(SiniestroAct) +
                ' AND pr_orden = ' + SqlInt(OrdenAct) +
                ' AND pr_recaida = ' + SqlInt(RecaidaAct) +
                ' AND pr_numpago = ' + SqlInt(NumLiquiAct);
    if enTransaccion then
      EjecutarSqlST(sSql)
    else
      EjecutarSql(sSql);

  if AlTrabajador then
    begin
      sSql := 'SELECT ca_iddestinatariocarta ' +
                'FROM cca_Carta ' +
               'WHERE ca_nrocartadoc = ' +
                     '(SELECT MIN(ca_nrocartadoc) ' +
                        'FROM cat_areatexto, sex_Expedientes, cca_Carta ' +
                       'WHERE ca_idexpediente = ex_id ' +
                         'AND ca_idareatexto = at_id ' +
                         'AND '''' || at_area in (:Area1, :Area2) ' +
                         'AND at_modulo = :Modulo ' +
                         'AND ex_siniestro = :Siniestro ' +
                         'AND ex_orden = :Orden ' +
                         'AND ex_recaida = :Recaida)';
      IdDestCarta := ValorSqlIntegerEx(ssql, [AREA_DIN, AREA_CON, MODULO_PAGOTRABAJADOR, SiniestroAct, OrdenAct, RecaidaAct], ART_EMPTY_ID);

      IdDestCarta := DoActualizarDestinatarioCarta(False, Destinatario,
                                                   fraDirDestinatario.Calle,
                                                   fraDirDestinatario.Numero,
                                                   fraDirDestinatario.Piso,
                                                   fraDirDestinatario.Departamento,
                                                   fraDirDestinatario.CodigoPostal,
                                                   fraDirDestinatario.CPA,
                                                   fraDirDestinatario.Localidad,
                                                   IntToStr(fraDirDestinatario.Prov),
                                                   IdDestCarta)
    end
  else
    IdDestCarta := ART_EMPTY_ID;
end;

procedure TfrmLiqCartasDoc.ClearControls;
begin
  rbTransferencia.Checked   := True;
  rbFechaAprobacion.Checked := True;
  rbPendientes.Checked      := True;
  fraFirmanteFijo.Limpiar;
  fraDelegacion.Clear;
  dcFechaAprob.Clear;
  dcFechaAprob.SetFocus;
end;

procedure TfrmLiqCartasDoc.LoadControls;
begin
  if sdqConsulta.Active and not(sdqConsulta.Eof) and (Grid.SelectedRows.Count > 0) then
    CargarDatosPanel(sdqConsulta.FieldByName('LE_SINIESTRO').AsInteger,
                     sdqConsulta.FieldByName('LE_ORDEN').AsInteger,
                     sdqConsulta.FieldByName('LE_RECAIDA').AsInteger,
                     sdqConsulta.FieldByName('LE_NUMLIQUI').AsInteger,
                     sdqConsulta.FieldByName('TABLA').AsString);
end;

procedure TfrmLiqCartasDoc.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  ClearControls;
end;

function TfrmLiqCartasDoc.CancelarExisteOtraLiquidacion :Boolean;
var
  sSql :String;
  SumMonto :Double;
  SumCantidad :Integer;
  MsgResult : Integer;
  b :TBookMark;
begin
  SumCantidad := 0;
  SumMonto    := 0;
  Result := False;
  with sdqConsulta do
  begin
    b := GetBookmark;
    First;
    if not Eof then begin
      DisableControls;
      Repeat
        if (FieldByName('SINIESTRO').AsString = SiniestroCompleto) and
           (FieldByName('NUMLIQUI').AsInteger <> NumLiquiAct) then
        begin
          Inc(SumCantidad);
          if FieldByName('LE_IMPORCARTA').IsNull then
            SumMonto := SumMonto + FieldByName('LE_IMPORPERI').AsFloat
          else
            SumMonto := SumMonto + FieldByName('LE_IMPORCARTA').AsFloat;
        end;
        Next ;
      until Eof;
      GotoBookmark(b);
      EnableControls;
      FreeBookmark(b);
    end;
  end;
  if (SumCantidad > 0) then
  begin
    MsgResult := (MsgBox('Existen otras liquidaciones pendientes para el siniestro ' + SiniestroCompleto + #13 +
                 '¿Desea anularlas y enviar una carta por la suma de los importes?', MB_ICONQUESTION + MB_YESNOCANCEL));
    if (MsgResult = IDYES) then
    begin
      //actualizo el importe de la carta
      edImporteABM.Value := edImporteABM.Value + SumMonto;
      //anulo las demás
      if TablaAct = 'SLE' then
        sSql := 'UPDATE sle_liquiempsin ' +
                  ' SET le_telegramapago = ''N'', ' +
                      ' le_usumodif = ' + SqlValue(UsuIngreso) + ',' +
                      ' le_fmodif = actualdate ' +
                ' WHERE le_siniestro = ' + SqlInt(SiniestroAct) +
                  ' AND le_orden = ' + SqlInt(OrdenAct) +
                  ' AND le_recaida = ' + SqlInt(RecaidaAct) +
                  ' AND le_numliqui <> ' + SqlInt(NumLiquiAct) +
                  ' AND le_telegramapago IS NULL ' +
                  ' AND NVL(le_estado, '''')=''E'' ' +
                  ' AND le_imporperi > 0 '
      else
        sSql := 'UPDATE spr_pagoexpesin ' +
                  ' SET pr_telegramapago = ''N'', ' +
                      ' pr_usumodif = ' + SqlValue(UsuIngreso) + ',' +
                      ' pr_fmodif = actualdate ' +
                ' WHERE pr_siniestro = ' + SqlInt(SiniestroAct) +
                  ' AND pr_orden = ' + SqlInt(OrdenAct) +
                  ' AND pr_recaida = ' + SqlInt(RecaidaAct) +
                  ' AND pr_numpago <> ' + SqlInt(NumLiquiAct) +
                  ' AND pr_telegramapago IS NULL ' +
                  ' AND NVL(pr_estado, '''')=''E'' ' +
                  ' AND pr_imporpago > 0 ' +
                  ' AND pr_acreedor=''TA'' ';
      EjecutarSql(sSql);
    end
    else if (MsgResult = IDCANCEL) then Result := True;
  end;
end;

procedure TfrmLiqCartasDoc.tbModificarClick(Sender: TObject);
begin
  fpAbm.Tag := 0;
  inherited;
end;

procedure TfrmLiqCartasDoc.BloquearControlesABM(bHabilitar :Boolean);
begin
  fraFirmanteABM.Enabled    := bHabilitar;
  dcFechaDisp.Enabled       := bHabilitar;
  edImporteABM.Enabled      := bHabilitar;
  gbDirDestinatario.Enabled := bHabilitar;
  edObservaciones.Enabled   := bHabilitar;
  edChequeNombre.Enabled    := bHabilitar;
  btnAceptar.Enabled        := bHabilitar;
  btnReplicar.Enabled       := not bHabilitar;
  btnCartaEnviada.Enabled   := not bHabilitar;
end;

procedure TfrmLiqCartasDoc.btnReplicarClick(Sender: TObject);
begin
  if MsgBox('Se generará una nueva Carta Documento para el siniestro actual, ¿desea continuar?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    BloquearControlesABM(True);
    btnAceptar.Enabled := False;
    bReplicar := True;
  end;
end;

procedure TfrmLiqCartasDoc.btnCartaEnviadaClick(Sender: TObject);
begin
  bVerEnviada := True;
  DoGenerarCartaDocPago(True);
  if bEsAnticipo then DoGenerarCartaDocPago(False);
  bVerEnviada := False;
end;

function TfrmLiqCartasDoc.GetCodigoFormato(bAlTrabajador: Boolean): String;
var
  bTransferencia: Boolean;
  sSql, sAlTr, sTran, sMens: String;
begin
  bTransferencia := rbTransferencia.Checked;

  sAlTr := IIF(bEsAnticipo, IIF(bAlTrabajador, 'S', 'N'), '');
  sTran := IIF(bEsAnticipo, IIF(bAlTrabajador, IIF(bTransferencia, 'S', 'N'), ''),
                            IIF(bTransferencia, 'S', 'N'));
  sMens := IIF(bEsAnticipo, '', IIF(bTransferencia, IIF(bEsPagoMensual, 'S', 'N'),
                                                    IIF(bEsPagoMensual, 'S', 'N')));

  sSql  := 'SELECT fc_codigo ' +
           ' FROM SIN.sfc_formatoscartaspago ' +
          ' WHERE fc_fechabaja IS NULL ' +
            ' AND fc_anticipo = ' + SqlBoolean(bEsAnticipo);
  sSql := sSql + IIF((sAlTr = ''), ' AND fc_altrabajador IS NULL' ,
                                   ' AND fc_altrabajador = ' + SqlValue(sAlTr));
  sSql := sSql + IIF((sTran = ''), ' AND fc_transferencia IS NULL' ,
                                   ' AND fc_transferencia = ' + SqlValue(sTran));
  sSql := sSql + IIF((sMens = ''), ' AND fc_pagomensual IS NULL' ,
                                   ' AND fc_pagomensual = ' + SqlValue(sMens));

  Result := ValorSql(sSql);
end;

end.
