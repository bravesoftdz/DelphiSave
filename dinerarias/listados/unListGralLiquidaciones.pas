unit unListGralLiquidaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraTrabajador, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox, SinEdit, QuickRpt,
  QRCtrls, unFraCodigoDescripcion, unfraCtbTablas, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, RxToolEdit, RxPlacemnt;

type
  TfrmListGralLiquidaciones = class(TfrmCustomConsulta)
    gbEmpresaTrabajador: TGroupBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    dcProcesoHasta: TDateComboBox;
    dcProcesoDesde: TDateComboBox;
    fraEmpresa: TfraEmpresa;
    fraTrabajador: TfraTrabajador;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dcAprobHasta: TDateComboBox;
    dcAprobDesde: TDateComboBox;
    gbSiniestro: TGroupBox;
    Label5: TLabel;
    SinDesde: TSinEdit;
    SinHasta: TSinEdit;
    GroupBox4: TGroupBox;
    sdqConsultaSINIESTROCOMPLETO: TStringField;
    sdqConsultaNUMLIQUI: TFloatField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaNOMBRE: TStringField;
    sdqConsultaFECHAACCIDENTE: TDateTimeField;
    sdqConsultaFECHARECAIDA: TDateTimeField;
    sdqConsultaBAJAMEDICA: TDateTimeField;
    sdqConsultaALTAMEDICA: TDateTimeField;
    sdqConsultaFECHADES: TDateTimeField;
    sdqConsultaFECHAHAS: TDateTimeField;
    sdqConsultaDIASAPLICA: TFloatField;
    sdqConsultaIBASEDIARIA: TFloatField;
    sdqConsultaIBASEMENSUAL: TFloatField;
    sdqConsultaSUBTOTAL: TFloatField;
    sdqConsultaICONEMP: TFloatField;
    sdqConsultaIMPORPERI: TFloatField;
    sdqConsultaFEMISION: TDateTimeField;
    sdqConsultaFPROCESO: TDateTimeField;
    sdqConsultaFAPROBADO: TDateTimeField;
    sdqConsultaNROCHEQUE: TStringField;
    sdqConsultaFECHACHEQUE: TDateTimeField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaRAZONSOCIAL: TStringField;
    sdqConsultaASIGFAMILIAR: TFloatField;
    ScrollBox1: TScrollBox;
    qrListGralLiquidaciones: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlSeleccion: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText24: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel23: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel24: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel25: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    Label2: TLabel;
    Label3: TLabel;
    sdqConsultaESTADO: TStringField;
    sdqConsultaIMPORTEART: TFloatField;
    sdqConsultaIMPORTEEMP: TFloatField;
    sdqConsultaIMPORTENOREMEMP: TFloatField;
    sdqConsultaDIFERENCIA: TFloatField;
    QRLabel26: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText27: TQRDBText;
    sdqConsultaFAPROCOB: TDateTimeField;
    QRDBText28: TQRDBText;
    QRLabel30: TQRLabel;
    rgVIP: TRadioGroup;
    rgBloqueoILT: TRadioGroup;
    gbSectorEmpresa: TGroupBox;
    sdqConsultatb_descripcion: TStringField;
    GroupBox6: TGroupBox;
    sdqConcepto: TSDQuery;
    dsConcepto: TDataSource;
    dcConcepto: TDBCheckCombo;
    sdqConsultacp_denpago: TStringField;
    GroupBox2: TGroupBox;
    edNroCheque: TEdit;
    QRLabel31: TQRLabel;
    qrlConceptoPago: TQRLabel;
    cmbSector: TDBCheckCombo;
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    sdqConsultaCARGAS: TFloatField;
    sdqConsultaAPORTES: TFloatField;
    QRLabel32: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText30: TQRDBText;
    sdqConsultaADEUDADDJJ: TStringField;
    QRDBText31: TQRDBText;
    QRLabel34: TQRLabel;
    cmbEstado: TDBCheckCombo;
    dsEstado: TDataSource;
    sdqEstado: TSDQuery;
    sdqConsultaev_fechavencimiento: TDateTimeField;
    QRLabel35: TQRLabel;
    QRDBText32: TQRDBText;
    sdqConsultaMOTIVODIFERENCIA: TStringField;
    QRLabel36: TQRLabel;
    QRDBText33: TQRDBText;
    sdqConsultaEXTENSIONILT: TStringField;
    rgExtensionILT: TRadioGroup;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    dcDerivadoHasta: TDateComboBox;
    dcDerivadoDesde: TDateComboBox;
    sdqConsultafechaderivado: TDateTimeField;
    sdqConsultaformula: TStringField;
    sdqConsultasubtotalnorem: TFloatField;
    sdqConsultaibasediarianorem: TFloatField;
    sdqConsultaPAGOADIC: TFloatField;
    sdqConsultaCOMPDANOS: TFloatField;
    sdqConsultaOTROSPAGOS: TFloatField;
    sdqConsultaCONCEPTOOP: TStringField;
    sdqConsultaCARATULA: TStringField;
    sdqConsultaJUICIO: TStringField;
    QRLabel37: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText35: TQRDBText;
    procedure tbRefrescarClick(Sender: TObject);
    procedure SinDesdeExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure rbAprobadaClick(Sender: TObject);
    procedure rbPendienteClick(Sender: TObject);
    procedure rbCompensableClick(Sender: TObject);
    procedure rbTodosAnterioresClick(Sender: TObject);
    procedure rbRevisadaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbEstadoChange(Sender: TObject);
    //procedure DoInsertarDatosFinancials;
  private
    sSeleccion :String;
    function ValidarFiltros :Boolean;
    function GetSqlCondiciones :String;
    procedure DoBorrarLstLiquidaciones;
    procedure DoInsertarDatosLiquidaciones;
    procedure HabilitarFechasAprob(bHabilitar :Boolean);
  public
    { Public declarations }
  end;

var
  frmListGralLiquidaciones: TfrmListGralLiquidaciones;

implementation

{$R *.DFM}

Uses AnsiSql, unDmPrincipal, unDmFinancials, unSesion, General, unTercerizadoras, unSiniestros;

procedure TfrmListGralLiquidaciones.DoBorrarLstLiquidaciones;
var
  sSql :String;
begin
  sSql := 'DELETE FROM tmp_lstliquidaciones ' +
          ' WHERE mp_usuario = ' + SqlValue(Sesion.UserID);
  EjecutarSql(sSql);

  sSql := 'DELETE FROM tmp_lstliquidcheques ' +
          ' WHERE mp_usuario= ' + SqlValue(Sesion.UserID);
  EjecutarSql(sSql);
end;

function TfrmListGralLiquidaciones.GetSqlCondiciones :String;
var
  sTmp :String;
begin

  sSeleccion  := '';
  sTmp        := '';

  if not(fraTrabajador.IsEmpty) then
  begin
    sSeleccion := sSeleccion + 'Cuil: ' + fraTrabajador.CUIL + ' / ';
    sTmp := sTmp + ' AND ex_cuil = ' + SqlValue(fraTrabajador.CUIL);
  end;

  if not(fraEmpresa.IsEmpty) then
  begin
    sSeleccion := sSeleccion + 'Cuit: ' + fraEmpresa.CUIT + ' / ';
    sTmp := sTmp + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);
  end;

  if not(dcProcesoDesde.IsEmpty) then
  begin
    sSeleccion := sSeleccion + 'F. de proceso: ' + dcProcesoDesde.Text + ' al ' +  dcProcesoHasta.Text  + ' / ';
    sTmp := sTmp + ' AND le_fproceso >= ' + SqlDate(dcProcesoDesde.Date) +
                   ' AND le_fproceso <= ' + SqlDate(dcProcesoHasta.Date);
  end;

  if not(dcAprobDesde.IsEmpty) then
  begin
    sSeleccion := sSeleccion + 'F. de aprobación: ' + dcAprobDesde.Text + ' al ' +  dcAprobHasta.Text  + ' / ';
    sTmp := sTmp + ' AND le_faprobado >= ' + SqlDate(dcAprobDesde.Date) +
                   ' AND le_faprobado <= ' + SqlDate(dcAprobHasta.Date);
  end;

  if not(dcDerivadoDesde.IsEmpty) then
  begin
    sSeleccion := sSeleccion + 'F. derivado GPBA: ' + dcDerivadoDesde.Text + ' al ' +  dcDerivadoHasta.Text  + ' / ';
    sTmp := sTmp + ' AND le_fechaderivado >= ' + SqlDate(dcDerivadoDesde.Date) +
                   ' AND le_fechaderivado <= ' + SqlDate(dcDerivadoHasta.Date);
  end;

  if not(SinDesde.IsEmpty) then
  begin
    sSeleccion := sSeleccion + 'Siniestro: ' + SinDesde.SiniestroS + ' al ' + SinHasta.SiniestroS  + ' / ';
    sTmp := sTmp + ' AND ex_siniestro >= ' + SqlInt(SinDesde.Siniestro) +
                   ' AND ex_siniestro <= ' + SqlInt(SinHasta.Siniestro);
  end;

  if cmbEstado.IsEmpty then
    sSeleccion := sSeleccion + 'Estado: Todos / '
  else begin
    sSeleccion := sSeleccion + 'Estado: ' + Copy(cmbEstado.Text, 0, Length(cmbEstado.Text) - 2) + ' / ';
    sTmp := sTmp + ' AND NVL(le_estado, ''0'') ' + cmbEstado.InSql;
  end;

  case rgVIP.ItemIndex of
    0: begin
         sSeleccion := sSeleccion + 'Solo empresas VIP / ';
         sTmp := sTmp + ' AND art.afiliacion.is_empresavip(ex_contrato) = ''S'' ';
       end;
    1: begin
         sSeleccion := sSeleccion + 'Solo empresas no VIP / ';
         sTmp := sTmp + ' AND art.afiliacion.is_empresavip(ex_contrato) = ''N'' ';
       end;
  end;

  case rgBloqueoILT.ItemIndex of
    0: begin
         sSeleccion := sSeleccion + 'Solo empresas con bloqueo de ILT / ';
         sTmp := sTmp + ' AND art.liq.is_bloqueoiltempresa(ex_cuit, ex_fechaaccidente) = ''S'' ';
       end;
    1: begin
         sSeleccion := sSeleccion + 'Solo empresas sin bloqueo de ILT / ';
         sTmp := sTmp + ' AND art.liq.is_bloqueoiltempresa(ex_cuit, ex_fechaaccidente) = ''N'' ';
       end;
  end;

  if not cmbSector.IsEmpty then
  begin
    sSeleccion := sSeleccion + 'Solo empresas del sector: ' + cmbSector.Text + ' /';
    sTmp := sTmp + ' AND em_sector ' + cmbSector.InSql;
  end;

  if (dcConcepto.InSql <> '') then
  begin
    sSeleccion := sSeleccion + 'Solo los conceptos: ' + dcConcepto.Text + ' /';
    sTmp := sTmp + ' AND le_conpago ' + dcConcepto.InSql;
  end;

  case rgExtensionILT.ItemIndex of      // Plan Extensión de ILT
    0: begin
         sSeleccion := sSeleccion + 'Solo casos de Extensión de ILT / ';
         sTmp := sTmp + ' AND ART.inca.is_extensionilt(ex_id) = ''S'' ';
       end;
    1: begin
         sSeleccion := sSeleccion + 'Solo casos que no posean Extensión de ILT / ';
         sTmp := sTmp + ' AND ART.inca.is_extensionilt(ex_id) = ''N'' ';
       end;
  end;

  if EsUsuarioDeTercerizadora then                                                    // por plan Ioma (Tercerizadoras)
    sTmp := sTmp + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';

  Result := sTmp;
end;

procedure TfrmListGralLiquidaciones.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin

  if not(ValidarFiltros) then Exit;

  DoBorrarLstLiquidaciones;
  DoInsertarDatosLiquidaciones;

  sSql := 'SELECT liq.mp_siniestrocompleto siniestrocompleto, liq.mp_numliqui numliqui, ' +
                ' liq.mp_cuil cuil, liq.mp_nombre nombre, liq.mp_fechaaccidente fechaaccidente, ' +
                ' liq.mp_fecharecaida fecharecaida, liq.mp_bajamedica bajamedica, liq.mp_altamedica altamedica, ' +
                ' liq.mp_fechades fechades, liq.mp_fechahas fechahas, liq.mp_diasaplica diasaplica, ' +
                ' liq.mp_ibasediaria ibasediaria, liq.mp_ibasemensual ibasemensual, liq.mp_subtotal subtotal, ' +
                ' liq.mp_iconemp iconemp, liq.mp_imporperi imporperi, liq.mp_femision femision, ' +
                ' liq.mp_fproceso fproceso, liq.mp_faprobado faprobado, liq.mp_nrocheque nrocheque, ' +
                ' liq.mp_fechacheque fechacheque, liq.mp_cuit cuit, liq.mp_razonsocial razonsocial, ' +
                ' liq.mp_asigfamiliar asigfamiliar, liq.mp_estado estado, liq.mp_importeart importeart, ' +
                ' liq.mp_declaraemp importeemp, liq.mp_noremundeclaraemp importenorememp, ' +
                ' liq.mp_diferencia diferencia, liq.mp_fechaprocobranzas faprocob, tb_descripcion, ' +
                ' a.cp_denpago, liq.mp_cargassociales cargas, liq.mp_icontra aportes, ' +
                ' liq.mp_adeudaddjj adeudaddjj, ' +
                ' CASE WHEN liq.mp_fechaaccidente >= art.liq.get_fechaley26773 THEN art.amebpba.calcdiascorridos(ev_fecharecepcion, 15) ' +
                '      ELSE art.amebpba.calcdiashabiles(ev_fecharecepcion, 15) END ev_fechavencimiento, ' +
                ' md_descripcion motivodiferencia, ' +
                ' liq.mp_extensionILT ExtensionILT, liq.mp_fechaderivado fechaderivado, liq.mp_formula formula, ' +
                ' liq.mp_subtotalnorem subtotalnorem, liq.mp_ibasediarianorem ibasediarianorem, ' +   // por Plan Extensión de ILT
                ' liq.mp_montopagoadic pagoadic, liq.mp_montocompdanios compdanos, liq.mp_montootrospagos otrospagos, b.cp_denpago conceptoop, ' +
                ' art.sin.get_caratulajuicio(mp_siniestro, mp_orden, mp_recaida) caratula, art.SIN.get_listanrosjuicioexp(mp_siniestro, mp_orden, mp_recaida) juicio ' +
           ' FROM tmp_lstliquidaciones liq, aem_empresa, ctb_tablas, art.scp_conpago a, ' +
                ' art.sev_eventosdetramite, sin.smd_motivodiferencia, art.scp_conpago b ' +
          ' WHERE mp_cuit = em_cuit ' +
            ' AND liq.mp_conpago = a.cp_conpago ' +
            ' AND tb_clave = ''SECT'' ' +
            ' AND tb_codigo = em_sector ' +
            ' AND liq.mp_usuario = ' + SqlValue(Sesion.UserID) +
            ' AND liq.mp_ideventoinca = ev_idevento(+) ' +
            ' AND liq.mp_idmotivodiferencia = md_id(+) ' +
            ' AND b.cp_conpago(+) = liq.mp_conceptootrospagos ';


  if Trim(edNroCheque.Text) <> '' then
  begin
    sSeleccion := sSeleccion + 'Nro. de cheque: ' + edNroCheque.Text + ' / ';
    sSql := sSql + ' AND liq.mp_nrocheque = ' + SqlValue(edNroCheque.Text);
  end;

  sSeleccion := Copy(sSeleccion, 0, Length(sSeleccion)-3);
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

{procedure TfrmListGralLiquidaciones.DoInsertarDatosFinancials;
var
  sSql :String;
begin
  sSql := 'SELECT d.mp_usuario userid, d.mp_siniestro siniestro, d.mp_orden orden, ' +
                ' d.mp_recaida recaida, d.mp_numliqui numliqui, min(to_char(a.check_number)) checknumber, ' +
                ' min(a.check_date) paymentdate ' +
           ' FROM ap_checks_all a, ap_invoices_all b, ' +
                ' ap_invoice_payments_all c, tmp_lstliquidaciones@partr d ' +
          ' WHERE b.invoice_id = c.invoice_id ' +
            ' AND a.check_id = c.check_id ' +
            ' AND d.mp_siniestro = b.attribute6 ' +
            ' AND d.mp_orden = b.attribute7 ' +
            ' AND d.mp_recaida = b.attribute8 ' +
            ' AND d.mp_numliqui = b.attribute9 ' +
            ' AND b.attribute11 = ''SLE'' ' +
            ' AND d.mp_usuario = ' + SqlValue(Sesion.UserID) +
          ' GROUP BY d.mp_usuario , d.mp_siniestro , d.mp_orden , d.mp_recaida , d.mp_numliqui ';

  dmFinancials.Active := True;
  try
    with dmFinancials.GetQuery(sSql) do
    try
      while not Eof do
      begin
        sSql := 'INSERT INTO tmp_lstliquidcheques( ' +
               ' mp_usuario, mp_siniestro, mp_orden, mp_recaida, ' +
               ' mp_numliqui, mp_nrocheque, mp_fechacheque) VALUES ( ' +
               SqlValue(Sesion.UserID) + ',' + SqlInt(FieldByName('SINIESTRO').AsInteger) + ',' +
               SqlInt(FieldByName('ORDEN').AsInteger) + ',' + SqlInt(FieldByName('RECAIDA').AsInteger) + ',' +
               SqlInt(FieldByName('NUMLIQUI').AsInteger) + ',' + SqlValue(FieldByName('CHECKNUMBER').AsString) + ',' +
               SqlDate(FieldByName('PAYMENTDATE').AsDateTime) + ')';
        EjecutarSql(sSql);
        Next;
      end;
    finally
      Free;
    end;
  finally
    dmFinancials.Active := False;
  end;
end; }

procedure TfrmListGralLiquidaciones.DoInsertarDatosLiquidaciones;
var
  sSql :String;
begin
  sSql := 'INSERT INTO tmp_lstliquidaciones( ' +
         ' mp_usuario, mp_siniestro, mp_orden, mp_recaida, mp_cuil, mp_nombre, ' +
         ' mp_fechaaccidente, mp_fecharecaida, mp_bajamedica, mp_altamedica, ' +
         ' mp_fechades, mp_fechahas, mp_diasaplica, mp_ibasediaria, mp_ibasemensual, ' +
         ' mp_subtotal, mp_iconemp, mp_imporperi, mp_femision, mp_numliqui, mp_fproceso, ' +
         ' mp_faprobado, mp_siniestrocompleto, mp_cuit, mp_razonsocial, mp_nrocheque, ' +
         ' mp_fechacheque, mp_asigfamiliar, mp_estado, mp_importeart, mp_declaraemp, ' +
         ' mp_noremundeclaraemp, mp_diferencia, mp_fechaprocobranzas, mp_conpago, ' +
         ' mp_cargassociales, mp_icontra, mp_adeudaddjj, mp_ideventoinca, mp_idmotivodiferencia, ' +  // TK 39345
         ' mp_extensionILT, mp_fechaderivado, mp_formula, mp_subtotalnorem, mp_ibasediarianorem, ' +
         ' mp_montopagoadic, mp_montocompdanios, mp_montootrospagos, mp_conceptootrospagos) ' +
         ' SELECT ' + SqlValue(Sesion.UserID) + ', ex_siniestro, ex_orden, ex_recaida, ' +
                  ' ex_cuil, tj_nombre, ex_fechaaccidente, ex_fecharecaida, ex_bajamedica, ' +
                  ' ex_altamedica, le_fechades, le_fechahas, le_diasaplica, le_ibasediaria, ' +
                  ' le_ibasediaria * dinerarias.get_diaspormes(ex_fechaaccidente), ' +
                  ' le_subtotal, le_iconemp, le_imporperi, le_femision, ' +
                  ' le_numliqui, le_fproceso, le_faprobado, ' +
                  ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida), ' +
                  ' ex_cuit, em_nombre, ce_numero, ce_fechacheque, le_asigfamiliar, ' +
                  ' liq.get_estadoliquidacionilt(le_tipoliqui, le_estado) estado, ' +
                  ' le_impiltp, le_declaraemp, le_noremundeclaraemp, le_diferencia, ' +
                  ' le_faprobcobranzas, le_conpago, le_iconemp + le_icontra, ' +
                  ' le_icontra, emi.utiles.is_contratoddjj_adeudadas(ex_contrato), le_ideventoinca, ' +
                  ' le_idmotivodiferencia, art.inca.is_extensionilt(ex_id), le_fechaderivado, le_formula, ' +     // TK 39345
                  ' le_subtotalnorem, le_ibasediarianorem, le_montopagoadic, le_montocompdanios, ' +
                  ' le_montootrospagos, le_conceptootrospagos ' +
             ' FROM aem_empresa, ctj_trabajador, sex_expedientes, ' +
                  ' sle_liquiempsin, secb_cbaseexpsin, rce_chequeemitido ' +
           ' WHERE  ex_cuit=em_cuit ' +
              ' AND ex_idtrabajador = tj_id ' +
              ' AND ex_siniestro = le_siniestro ' +
              ' AND ex_orden = le_orden ' +
              ' AND ex_recaida = le_recaida ' +
              ' AND ex_siniestro = cb_siniestro ' +
              ' AND ex_orden = cb_orden ' +
              ' AND le_idchequeemitido = ce_id(+) ';

  sSql := sSql + GetSqlCondiciones;
  EjecutarSql(sSql);
end;

procedure TfrmListGralLiquidaciones.SinDesdeExit(Sender: TObject);
begin
  inherited;
  if SinHasta.IsEmpty then SinHasta.Siniestro := SinDesde.Siniestro;
end;

procedure TfrmListGralLiquidaciones.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraTrabajador.Clear;
  dcAprobDesde.Clear;
  dcAprobHasta.Clear;
  dcProcesoDesde.Clear;
  dcProcesoHasta.Clear;
  dcDerivadoHasta.Clear;
  dcDerivadoDesde.Clear;
  SinDesde.Clear;
  SinHasta.Clear;
  edNroCheque.Clear;
  rgVIP.ItemIndex         := 2;
  rgBloqueoILT.ItemIndex  := 2;
  rgExtensionILT.ItemIndex := 2;
  dcConcepto.Clear;
  cmbSector.Clear;
  cmbEstado.Clear;
  cmbEstado.DropDown;
  cmbEstado.Checked[0] := True;
  cmbEstado.CloseUp;
  inherited;
end;

procedure TfrmListGralLiquidaciones.tbImprimirClick(Sender: TObject);
begin
  qrlSeleccion.Caption := 'Selección: ' + sSeleccion;
  qrlConceptoPago.Caption := dcConcepto.Text;
  qrListGralLiquidaciones.PreviewModal;
end;

function TfrmListGralLiquidaciones.ValidarFiltros :Boolean;
begin
  Result := False;
  if fraEmpresa.IsEmpty and fraTrabajador.IsEmpty and dcProcesoDesde.IsEmpty and
     dcAprobDesde.IsEmpty and dcDerivadoDesde.IsEmpty and SinDesde.IsEmpty and cmbsector.IsEmpty and dcConcepto.IsEmpty then      // no pongo aca lo del ticket 39345, el filtro de fraMotivoDiferencia porque es muy poco para filtrar por eso
    MessageDlg('Debe indicar algún criterio de selección !', mtWarning, [mbOK], 0)
  else
  if (dcProcesoDesde.IsEmpty and not(dcProcesoHasta.IsEmpty)) or
     (dcProcesoHasta.IsEmpty and not(dcProcesoDesde.IsEmpty)) then
    MessageDlg('Fechas de proceso incompletas !', mtWarning, [mbOK], 0)
  else
  if (dcAprobDesde.IsEmpty and not(dcAprobHasta.IsEmpty)) or
     (dcAprobHasta.IsEmpty and not(dcAprobDesde.IsEmpty)) then
    MessageDlg('Fechas de aprobación incompletas !', mtWarning, [mbOK], 0)
  else
  if (dcDerivadoDesde.IsEmpty and not(dcDerivadoHasta.IsEmpty)) or
     (dcDerivadoHasta.IsEmpty and not(dcDerivadoDesde.IsEmpty)) then
    MessageDlg('Fechas de derivación incompletas !', mtWarning, [mbOK], 0)
  else
  if (SinDesde.IsEmpty and not(SinHasta.IsEmpty)) or
     (SinHasta.IsEmpty and not(SinDesde.IsEmpty)) then
    MessageDlg('Rango de siniestros incompleto !', mtWarning, [mbOK], 0)
  else
  if (not SinDesde.IsEmpty) and (not SinHasta.IsEmpty) and (SinDesde.Siniestro = SinHasta.Siniestro) and
     (not ValidarSiniestroUsuarioTerce(SinDesde.Siniestro, 1, 0)) then
    MessageDlg('Ud. no posee permisos para visualizar este Siniestro', mtWarning, [mbOK], 0)
  else
    Result := True;
end;

procedure TfrmListGralLiquidaciones.rbAprobadaClick(Sender: TObject);
begin
  HabilitarFechasAprob(True);
end;

procedure TfrmListGralLiquidaciones.rbPendienteClick(Sender: TObject);
begin
  HabilitarFechasAprob(False);
end;

procedure TfrmListGralLiquidaciones.rbCompensableClick(Sender: TObject);
begin
  HabilitarFechasAprob(False);
end;

procedure TfrmListGralLiquidaciones.rbTodosAnterioresClick(Sender: TObject);
begin
  HabilitarFechasAprob(False);
end;

procedure TfrmListGralLiquidaciones.HabilitarFechasAprob(bHabilitar :Boolean);
begin
  dcAprobDesde.Clear;
  dcAprobHasta.Clear;
  dcAprobDesde.Enabled := bHabilitar;
  dcAprobHasta.Enabled := bHabilitar;
end;

procedure TfrmListGralLiquidaciones.rbRevisadaClick(Sender: TObject);
begin
  HabilitarFechasAprob(False);
end;

procedure TfrmListGralLiquidaciones.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa.ShowBajas    := True;
  fraTrabajador.ShowBajas := True;
  cmbEstado.DropDown;
  cmbEstado.Checked[0]    := True;
  cmbEstado.CloseUp;
end;

procedure TfrmListGralLiquidaciones.cmbEstadoChange(Sender: TObject);
begin
  if cmbEstado.Checked[1] or cmbEstado.Checked[2] then
    HabilitarFechasAprob(True)
  else
    HabilitarFechasAprob(False);
end;

end.
