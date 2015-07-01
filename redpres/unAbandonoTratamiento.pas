unit unAbandonoTratamiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, SinEdit, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraDelegacion, unFraGrupoTrabajo, Mask,
  ToolEdit, DateComboBox, Buttons, FormPanel, unArtDbFrame, unfraPrestador,
  unfraMedico, unfraCtbTablas, CheckPanel, unfraFirmantes, unFraDomicilio,
  RxToolEdit, RxPlacemnt;
                                                    
type
  TTipoImpresion = ( tiNone,          // No Imprime la CD pero hace un insert en la CDO
                     tiPrintUpdate,   // Imprime (Cuando anteriormente se cargo el evento pero no se imprimio la carta)
                     tiPrintInsert,   // Imprime (Cuando se procesa en el momento de la carga del evento)
                     tiRePrint );     // Reimpresion de la Carta Documento
  TTipoLugarCitacion = (tlPrestador, tlConsultorio, tlOtro);   // TK 33946

  TfrmAbandonoTratamiento = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    fraEvento: TfraCodigoDescripcion;
    edSiniestro: TSinEdit;
    GroupBox3: TGroupBox;
    fraDelegacion: TfraDelegacion;
    GroupBox4: TGroupBox;
    chkImpresos: TCheckBox;
    chkAbandonoMixto: TCheckBox;
    GroupBox5: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    gbFAltaMed: TGroupBox;
    dtAltaMedDesde: TDateComboBox;
    dtAltaMedHasta: TDateComboBox;
    Label1: TLabel;
    fpEventos: TFormPanel;
    Bevel2: TBevel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edFechaBaja: TEdit;
    edFechaAlta: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnTrabajador: TSpeedButton;
    sdqConsultaAT_EVENTO: TFloatField;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaTIPOACC: TStringField;
    sdqConsultaDELEGACION: TStringField;
    sdqConsultaGTRABAJO: TStringField;
    sdqConsultaFECHAACCIDENTE: TDateTimeField;
    sdqConsultaAT_FECHA: TDateTimeField;
    sdqConsultaAT_HORA: TStringField;
    sdqConsultaAT_SEGUNDAFECHA: TDateTimeField;
    sdqConsultaAT_SEGUNDAHORA: TStringField;
    sdqConsultaPRESTADORCONSULTORIO: TStringField;
    sdqConsultaEX_BAJAMEDICA: TDateTimeField;
    sdqConsultaEX_ALTAMEDICA: TDateTimeField;
    sdqConsultaGRAVEDAD: TStringField;
    sdqConsultaCIE10: TStringField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaNOMEMPRESA: TStringField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaNOMTRABAJADOR: TStringField;
    sdqConsultaFSRT: TDateTimeField;
    sdqConsultaF1CIT: TDateTimeField;
    sdqConsultaF2CIT: TDateTimeField;
    sdqConsultaFCARGA: TDateTimeField;
    sdqConsultaUSUGESTOR: TStringField;
    edSiniestroABM: TSinEdit;
    Label4: TLabel;
    btnSiniMasDatos: TSpeedButton;
    btnBuscarSini: TSpeedButton;
    fraEventoABM: TfraCodigoDescripcion;
    Label5: TLabel;
    pnlPrestador: TPanel;
    rbPrestador: TRadioButton;
    pnlConsultorio: TPanel;
    rbConsultorio: TRadioButton;
    fraPrestador: TfraPrestador;
    fraConsultorio: TfraCtbTablas;
    Label6: TLabel;
    fraMedico: TfraCodigoDescripcion;
    Label7: TLabel;
    fraSector: TfraCtbTablas;
    Label8: TLabel;
    edFecha: TDateComboBox;
    edFecha2: TDateComboBox;
    Label9: TLabel;
    Label11: TLabel;
    btnGetTurno: TSpeedButton;
    btnGetTurno2: TSpeedButton;
    edHora: TMaskEdit;
    edHora2: TMaskEdit;
    edFechaTXT: TEdit;
    edFecha2TXT: TEdit;
    edObservaciones: TMemo;
    Label10: TLabel;
    dbgEventos: TRxDBGrid;
    Bevel1: TBevel;
    sdqEvSini: TSDQuery;
    dsEvSini: TDataSource;
    sdqConsultaEX_CUIL: TStringField;
    sdqConsultaEX_CUIT: TStringField;
    fraFirmantes: TfraFirmantes;
    pnlOtro: TPanel;
    rbOtro: TRadioButton;
    fraDomicilioOtro: TfraDomicilio;
    sdqConsultaEX_CONTRATO: TFloatField;
    sdqConsultaTJ_ID: TFloatField;
    chkSerolOdont: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure rbPrestadorClick(Sender: TObject);
    procedure rbConsultorioClick(Sender: TObject);
    procedure btnSiniMasDatosClick(Sender: TObject);
    procedure btnBuscarSiniClick(Sender: TObject);
    procedure edSiniestroABMSelect(Sender: TObject);
    procedure btnGetTurnoClick(Sender: TObject);
    procedure pnlConsultorioExit(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure btnTrabajadorClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure rbOtroClick(Sender: TObject);
    procedure pnlPrestadorExit(Sender: TObject);
    procedure btnGetTurno2Click(Sender: TObject);
    procedure edFecha2Exit(Sender: TObject);
    procedure DoHabilitarSegundaFecha(bHabilitado: boolean);
  private
    iDelegacionCitacion :Integer; 
    { Private declarations }
    function EsEventoSel_EEPP: boolean;
    function ValidarRefrescar: boolean;
    function ValidarNuevo: boolean;
    function GetDelegacionCitacion: Integer;
    function ExigirSegundaFechaCitacion(sCodEv: String): Boolean;
    procedure OnFraEventoChange(Sender: TObject);
    procedure Do_LimpiarABM;
    procedure DoObtenerTurno(dFecha :TDate; sMedico :String; iTurno :integer);
    procedure DoHabilitarFechaHora(bHabilitar :boolean);
    procedure Do_HabilitacionPrestConsOtro(bNuevo:boolean; tLugarCitacion: TTipoLugarCitacion);
    procedure Do_RefrescarGrillaABM;
    procedure GuardarNuevo;
    function GenerarObservacionesAbandono: string;
    procedure Do_InsertarCartaCCA_CARTA(iSiniestro, iOrden, iRecaida, iNroEvento: Integer; sFormatoEmpresa, sFirmante: string);
    procedure ProcesarCartaDoc(tImprimir: TTipoImpresion; sFirmante,
      sCodEvento: String; iNroEvento, iSiniestro, iOrden,
      iRecaida: integer);
    procedure Do_NuevoEvento;
    procedure Do_LimpiarChecks(tLimpia: TTipoLugarCitacion);
    procedure Do_LimpiarTurno;
    procedure OnEventoChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmAbandonoTratamiento: TfrmAbandonoTratamiento;

implementation

uses unDmPrincipal, General, AnsiSql, CustomDlgs, VCLExtra, unDatosSiniestro, unBusqSini,
     ValFuncs, unSesion, unComunes, unArt, unRptCartaDocHeader, Strfuncs, Periodo,
     unContratoTrabajador, unredpres, DateTimeFuncs;

const EVENTO_DEFAULT = '001';

{$R *.dfm}

procedure TfrmAbandonoTratamiento.FormCreate(Sender: TObject);
begin
  inherited;
  with fraEvento do
  begin
    FieldID     := 'AE_ID';
    FieldCodigo := 'AE_CODIGO';
    FieldDesc   := 'AE_DESCRIPCION';
    TableName   := 'SAE_ABANDONOEVENTOS';
    FieldBaja   := 'AE_FECHABAJA';
    ShowBajas   := False;
    OrderBy     := 'AE_CODIGO';
  end;
  fraEvento.Codigo    := EVENTO_DEFAULT;
  fraEvento.OnChange  := OnfraEventoChange;

  with fraEventoABM do
  begin
    FieldID     := 'AE_ID';
    FieldCodigo := 'AE_CODIGO';
    FieldDesc   := 'AE_DESCRIPCION';    
    TableName   := 'SAE_ABANDONOEVENTOS';
    FieldBaja   := 'AE_FECHABAJA';
    ExtraCondition := ' AND AE_AUTOMATICO <> ''S'' ';
    ShowBajas   := False;
    OrderBy     := 'AE_CODIGO';
    ExtraFields := ', AE_GENERAEVOLUTIVO ';
  end;

  fraFirmantes.Area   := AREA_MED;
  fraFirmantes.Modulo := MODULO_ABANDONO;

  fraConsultorio.Clave  := 'CUBIC';
  fraSector.Clave       := 'SUBSE';

  fraMedico.TableName   := 'MAU_AUDITORES';
  fraMedico.FieldCodigo := 'AU_AUDITOR';
  fraMedico.FieldDesc   := 'AU_NOMBRE';
  fraMedico.FieldID     := 'AU_AUDITOR';
  fraMedico.FieldBaja   := 'AU_FBAJA';
  fraMedico.ShowBajas   := False;

  fraEventoABM.OnChange := OnEventoChange;
end;

function TfrmAbandonoTratamiento.EsEventoSel_EEPP: boolean;  // Se fija si el evento seleccionado es uno de EEPP (por ahora solo el "035")
begin
  Result := (ValorSqlEx('SELECT AE_EVENTO_EEPP FROM ART.SAE_ABANDONOEVENTOS ' +
                        ' WHERE AE_CODIGO = :codEv', [fraEvento.Codigo]) = 'S');
end;

procedure TfrmAbandonoTratamiento.tbRefrescarClick(Sender: TObject);
var sSql :String;
    bEvEEPP: boolean;
begin
  if ValidarRefrescar then
  begin
    bEvEEPP := EsEventoSel_EEPP;

    sSql := ' SELECT at_evento, ex_siniestro, ex_orden, ex_recaida, ta_descripcion TipoAcc, ' +
                    ' el_nombre Delegacion, art.AMEBPBA.get_nombregtrabajo(ex_gtrabajo) GTRABAJO, ' +
                    ' NVL(ex_fecharecaida,ex_fechaaccidente) FECHAACCIDENTE, ' +
                    ' at_fecha, at_hora, at_segundafecha, at_segundahora, '    +
                    ' NVL(CUBIC.tb_descripcion,ca_descripcion) prestadorconsultorio, ' +
                    ' ex_bajamedica, ex_altamedica, SGRAV.tb_descripcion Gravedad, ex_diagnosticooms CIE10, ' +
                    ' art.utiles.armar_cuit(ex_cuit) CUIT, em_nombre NomEmpresa, '     +
                    ' art.utiles.armar_cuit(ex_cuil) CUIL, tj_nombre NomTrabajador, '  +
                    ' art.AMEBPBA.get_datosabandono(EX_SINIESTRO, EX_ORDEN, NULL,''1'') FSRT, ' +
                    ' art.AMEBPBA.get_datosabandono(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA,''2'') F1Cit, ' +
                    ' art.AMEBPBA.get_datosabandono(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA,''3'') F2Cit, ' +
                    IIF(bEvEEPP, 'ex_fechaposibleeepp', 'pe_fechaalta')  + ' FCarga, ' +
                    ' art.siniestro.get_usuariogestor(ex_id) UsuGestor, ex_cuil, ex_cuit, ' +
                    ' ex_contrato, tj_id ' + 
               ' FROM art.sex_expedientes, sin.sta_tipoaccidente, art.del_delegacion, ' +
                    ' art.cpr_prestador, art.ctb_tablas CUBIC, art.ctb_tablas SGRAV, aem_empresa, ctj_trabajador, ' +
                    IIF(bEvEEPP, '', ' sin.spe_partedeegreso, ') +
                    ' ( SELECT at_siniestro, at_orden, at_recaida, at_firmante, at_codigo, at_evento, ' +
                             ' at_fecha, at_hora, at_consultorio, at_segundafecha, at_segundahora, at_prestador ' +
                        ' FROM art.sat_abandonotratamiento t1 ' +
                       ' WHERE at_codigo = ' + SqlValue(fraEvento.Codigo) +  // Nro de Evento: Dato fijo
                         ' AND t1.at_evento = (SELECT max(t2.at_evento) ' +
                                               ' FROM art.sat_abandonotratamiento t2 '    +
                                              ' WHERE t1.at_siniestro = t2.at_siniestro ' +
                                                ' AND t1.at_orden = t2.at_orden '         +
                                                ' AND t1.at_recaida = t2.at_recaida) ) '  +
              ' WHERE ex_tipo = ta_codigo(+) '       +
                ' AND ex_delegacion = el_id(+) ' +
                ' AND CUBIC.tb_clave  (+) = ''CUBIC'' '      +
                ' AND CUBIC.tb_codigo (+) = at_consultorio ' +
                ' AND SGRAV.tb_clave  (+) = ''SGRAV'' '      +
                ' AND SGRAV.tb_codigo (+) = ex_gravedad '    +
                ' AND at_prestador = ca_identificador(+) '   +
                ' AND NVL(ex_causafin,'' '') NOT IN (''99'',''95'') ' +
                ' AND at_siniestro = ex_siniestro ' +
                ' AND at_orden = ex_orden '         +
                ' AND at_recaida = ex_recaida '     +
                ' AND em_cuit = ex_cuit ' +
                ' AND tj_cuil = ex_cuil ' +
                IIF(bEvEEPP, ' AND ex_posibleeepp = ''S''',
                             ' AND ex_id = pe_idexpediente AND ( (pe_idtipodeegreso IN (3, 8)) ' + IIF(chkAbandonoMixto.Checked,
                             ' OR (pe_abandonomixto = ''S'') ) ', ' )' ) );

    if not edSiniestro.IsEmpty then
      sSql := sSql + ' AND at_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                     ' AND at_orden = ' + SqlInt(edSiniestro.Orden) +
                     ' AND at_recaida = ' + SqlInt(edSiniestro.Recaida);

    if (fraGrupoTrabajo.ID <> '') then
      sSql := sSql + ' AND ex_gtrabajo = ' + SqlInt(fraGrupoTrabajo.ID);

    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
      sSql := sSql + ' AND art.siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

    if (not fraDelegacion.IsEmpty) then
      sSql := sSql + ' AND ex_delegacion = ' + SqlValue(fraDelegacion.Codigo);

    if (dtAltaMedDesde.Date > 0) then
      sSql := sSql + ' AND ex_altamedica between ' + SqlDate(dtAltaMedDesde.Date) + ' and '
                                                   + SqlDate(dtAltaMedHasta.Date);

    if chkImpresos.Enabled then
      sSql := sSql + ' AND EXISTS (SELECT 1 FROM CCA_CARTA ' +
                                  ' WHERE CA_IDEXPEDIENTE = ART.SINIESTRO.GET_IDEXPEDIENTE(at_siniestro, at_orden, at_recaida) ' +
                                    ' AND CA_EVENTOABANDONO = AT_EVENTO ' +
                                    ' AND CA_NROCARTADOC is ' + IIF(chkImpresos.Checked, 'NOT', '') + ' NULL)';

    sdqconsulta.SQL.Text := sSql + SortDialog.OrderBy;
    inherited;
  end;
end;

procedure TfrmAbandonoTratamiento.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edSiniestro.Clear;
  chkAbandonoMixto.Checked := False;
  fraEvento.Codigo         := EVENTO_DEFAULT;
  fraDelegacion.Clear;
  dtAltaMedDesde.Clear;
  dtAltaMedHasta.Clear;
  fraGrupoTrabajo.Clear;
end;

procedure TfrmAbandonoTratamiento.OnFraEventoChange(Sender: TObject);
var sSql: string;
begin
  if not fraEvento.IsEmpty then
  begin
    sSql := 'SELECT AE_CODCARTADOC_EMP FROM ART.SAE_ABANDONOEVENTOS ' +
            ' WHERE AE_CODIGO = :codEv ';
    chkImpresos.Enabled := (ValorSqlEx(sSql, [fraEvento.Codigo]) <> '');
  end;
end;

procedure TfrmAbandonoTratamiento.tbNuevoClick(Sender: TObject);
begin
  Do_NuevoEvento;
end;

procedure TfrmAbandonoTratamiento.GridDblClick(Sender: TObject);
begin
  inherited;
  Do_NuevoEvento;
end;

procedure TfrmAbandonoTratamiento.Do_NuevoEvento;
begin
  edFechaAlta.Text := sdqConsultaEX_ALTAMEDICA.AsString;
  edFechaBaja.Text := sdqConsultaEX_BAJAMEDICA.AsString;
  edSiniestroABM.SetValues(sdqConsultaEX_SINIESTRO.AsString, sdqConsultaEX_ORDEN.AsString, sdqConsultaEX_RECAIDA.AsString);
  rbPrestador.Checked := True;
  Do_RefrescarGrillaABM;
  Do_HabilitacionPrestConsOtro(True, tlConsultorio);
  Do_LimpiarABM;
  rbPrestador.Checked   := False;
  rbConsultorio.Checked := False;
  rbOtro.Checked        := False;
  if fpEventos.ShowModal = mrOk then
  begin
    //
  end;
end;

procedure TfrmAbandonoTratamiento.Do_RefrescarGrillaABM;
begin
  sdqEvSini.Close;
  sdqEvSini.ParamByName('pSiniestro').AsInteger := edSiniestroABM.Siniestro;
  sdqEvSini.ParamByName('pOrden').AsInteger     := edSiniestroABM.Orden;
  sdqEvSini.ParamByName('pRecaida').AsInteger   := edSiniestroABM.Recaida;
  sdqEvSini.Open;
end;

procedure TfrmAbandonoTratamiento.btnAceptarClick(Sender: TObject);
begin
  if ValidarNuevo then
  begin
    GuardarNuevo;
    fpEventos.ModalResult := mrOk;
  end;
end;

function TfrmAbandonoTratamiento.ValidarNuevo: boolean;
var sSql, sCodCartaDocEmp, sSqlCartas: string;
    bExige2daFecCit: boolean;
begin
  sSql := 'SELECT AE_CODCARTADOC_EMP ' +
           ' FROM ART.SAE_ABANDONOEVENTOS ' +
          ' WHERE AE_CODIGO = :codEv ';
  sCodCartaDocEmp := ValorSqlEx(sSql, [fraEventoABM.Codigo]);
  bExige2daFecCit := ExigirSegundaFechaCitacion(fraEventoABM.Codigo);

  sSqlCartas := 'SELECT 1 FROM cca_carta ' +
                ' WHERE ca_idexpediente = art.siniestro.get_idexpediente(:sini, :orden, :recaida) ' +
                  ' AND ca_idareatexto = :areaaband ' +
                  ' AND ca_fechaimpresion IS NULL ' +
                  ' AND ca_fechabaja IS NULL ';

             // Si existe una carta sin imprimir      
  Verificar(ExisteSqlEx(sSqlCartas,[edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida, AREAT_ABANDONOTRATAMIENTO]) and (sCodCartaDocEmp <> ''),
            nil, 'No se puede agregar el evento ya que existe una carta pendiente de impresión.');
  Verificar(edSiniestroABM.IsEmpty, edSiniestroABM, 'Debe seleccionar un Siniestro');
  Verificar(fraEventoABM.IsEmpty, fraEventoABM, 'Debe seleccionar un Evento');
  Verificar((sCodCartaDocEmp <> '') and (fraFirmantes.edCodigo.Text = ''), fraFirmantes, 'Debe seleccionar el Firmante para este tipo de Evento');
  Verificar((sCodCartaDocEmp <> '') and (fraSector.edCodigo.Text = ''), fraSector, 'Debe seleccionar el Sector para este tipo de Evento');
  verificar(chkSerolOdont.Checked and (not esSiniestroMixto(edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida)),
              chkSerolOdont, 'El siniestro no está marcado como mixto serológico u odontológico');
  Verificar((sCodCartaDocEmp <> '') and fraConsultorio.IsEmpty and fraPrestador.IsEmpty and fraDomicilioOtro.IsEmpty, nil, 'Debe seleccionar el Prestador/Consultorio/Otro Lugar de Citación para este tipo de Evento');
  Verificar((sCodCartaDocEmp <> '') and rbConsultorio.Checked and fraMedico.IsEmpty, fraMedico, 'Si cita en Consultorio, debe seleccionar el Médico de Citación');
  Verificar(edFecha.IsEmpty, edFecha, 'Debe ingresar la Fecha del Evento');
  Verificar((sCodCartaDocEmp <> '') and (edHora.Text = '  :  '), edHora, 'Debe ingresar la Hora del Evento');
  Verificar((edHora.Text <> '  :  ') and not(IsTime(edHora.Text)), edHora, 'La Hora ingresada es inválida');
  Verificar((sCodCartaDocEmp <> '') and bExige2daFecCit and (edFecha2.Date = 0), edFecha2, 'Debe ingresar la 2º Fecha para este tipo de Evento');
  Verificar((sCodCartaDocEmp <> '') and bExige2daFecCit and (edHora2.Text = '  :  '), edHora2, 'Debe ingresar la 2° Hora para este tipo de Evento');
  Verificar((edHora2.Text <> '  :  ') and not(IsTime(edHora2.Text)), edHora2, 'La 2º Hora ingresada es inválida');
  Verificar((edFecha.Date <> 0) and (edFecha2.Date <> 0) and (edFecha2.Date <= edFecha.Date), edFecha2, 'La 2º Fecha del Evento debe ser mayor a la 1º Fecha del Evento');

  Result := True;
end;

procedure TfrmAbandonoTratamiento.GuardarNuevo;
var sSql, sCodCartaDocEmp, sqlAb, medico: string;
    iNroEvento, prestador: integer;
begin
  sSql := 'SELECT AE_CODCARTADOC_EMP ' +
           ' FROM ART.SAE_ABANDONOEVENTOS ' +
          ' WHERE AE_CODIGO = :codEv ';
  sCodCartaDocEmp := ValorSqlEx(sSql, [fraEventoABM.Codigo]);

  sSql := 'SELECT NVL(MAX(at_evento), 0)  ' +
           ' FROM sat_abandonotratamiento ' +
          ' WHERE at_siniestro = ' + SqlInt(edSiniestroABM.Siniestro) +
            ' AND at_orden = '     + SqlInt(edSiniestroABM.Orden)     +
            ' AND at_recaida = '   + SqlInt(edSiniestroABM.Recaida);
  iNroEvento := ValorSqlInteger(sSql) + 1;

  Try
    BeginTrans;

    // Inserta en la SAT_
    sSql := 'INSERT INTO sat_abandonotratamiento '  +
            '(at_siniestro, at_orden, at_recaida, ' +
            ' at_codigo, at_evento, at_fecha, at_hora, '     +
            ' at_observaciones, at_firmante, at_fechaalta, ' +
            ' at_usualta, at_consultorio, at_prestador, ' +
            ' at_otro_lugarcita, at_otro_calle, at_otro_piso, ' +
            ' at_otro_dept, at_otro_codpostal, at_otro_localidad, ' +
            ' at_otro_provincia, at_otro_numero, at_segundafecha, at_segundahora  ' +
            ' ) VALUES ('  +
            SqlInt(edSiniestroABM.Siniestro) + ', ' + SqlInt(edSiniestroABM.Orden) + ', ' + SqlInt(edSiniestroABM.Recaida) + ', ' +
            SqlValue(fraEventoABM.Codigo) + ', ' + SqlInt(iNroEvento) + ', ' + SqlDate(edFecha.Date) +  ', ''' + IIF(edHora.Text='  :  ','',edHora.Text) + ''', ' +
            SqlString(edObservaciones.Text, True) + ', ' + SqlValue(fraFirmantes.edCodigo.Text) + ', art.ACTUALDATE, ' +
            SqlValue(Sesion.LoginName) + ', ' + SqlValue(fraConsultorio.Codigo) + ',' +
            IIF(SqlValue(fraPrestador.IDPrestador) = '0', 'NULL', SqlValue(fraPrestador.IDPrestador)) + ',' +
            IIF(rbOtro.Checked, '''S''', 'NULL') + ',' +
            IIF(rbOtro.Checked, SqlValue(fraDomicilioOtro.Calle), 'NULL')        + ',' +
            IIF(rbOtro.Checked, SqlValue(fraDomicilioOtro.Piso), 'NULL')         + ',' +
            IIF(rbOtro.Checked, SqlValue(fraDomicilioOtro.Departamento), 'NULL') + ',' +
            IIF(rbOtro.Checked, SqlValue(fraDomicilioOtro.CodigoPostal), 'NULL') + ',' +
            IIF(rbOtro.Checked, SqlValue(fraDomicilioOtro.Localidad), 'NULL')    + ',' +
            IIF(rbOtro.Checked, SqlValue(fraDomicilioOtro.Prov), 'NULL')         + ',' +
            IIF(rbOtro.Checked, SqlValue(fraDomicilioOtro.Numero), 'NULL')       + ',' +
            IIF(not edfecha2.IsEmpty, edfecha2.SqlText, 'NULL')                  + ',' +
            IIF(edHora2.Text <> '  :  ', SqlValue(edHora2.Text), 'NULL')         + ')';

    EjecutarSqlST(sSql);

    if fraEventoABM.sdqDatos.FieldByName('AE_GENERAEVOLUTIVO').AsString = 'S' then
    begin
      ssql :=
      ' DECLARE ' +
        ' idprestador number; ' +
      ' BEGIN' +
        ' idprestador := :prestador; ' +                    //+ SqlInt(fraPrestador.IDPrestador) + ';' +
        ' art.siniestro.do_generarevolutivo(:pparte, :idexpediente, idprestador, NULL, NULL, NULL, ACTUALDATE,' +
                                                ' ACTUALDATE, NULL,' +
                                               ' :observ, NULL, NULL,' +
                                                ' NULL, NULL, NULL, NULL, NULL, NULL, NULL, :med, NULL, ''A'', :usuario,' +
                                              ' ''REDPRES'', ''S'', NULL, :fturno, :hturno); ' +
      ' END; ';

      sqlAb := ' select ex_prestador, ex_id, ex_diagnostico, ex_gravedadcie10, ex_diagnosticooms, ex_iddiagnostico ' +
               '   from art.sex_expedientes ' +
                ' where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec ';
      with GetQueryEx(sqlAb, [edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida]) do
      begin
        if fraPrestador.IsEmpty then
          prestador := FieldByName('ex_prestador').AsInteger
        else
          prestador := fraPrestador.IDPrestador;

        EjecutarSqlSTEx(sSql, [prestador, 'AB', FieldByName('ex_id').AsInteger, GenerarObservacionesAbandono,
                               iif(not fraMedico.IsEmpty, fraMedico.Codigo, ''), Sesion.UserID,
                               TDateTimeEx.Create(edFecha.Date), edHora.Text]);
      end;

    end;

    // Inserto en la MCC_  "Manejo de Consultorio"
    if iDelegacionCitacion > 0 then
    begin
      if (sCodCartaDocEmp <> '') then
        if (rbPrestador.Checked) and (fraEventoABM.sdqDatos.FieldByName('AE_GENERAEVOLUTIVO').AsString = 'S') then
          medico := ValorSqlEx(' select au_auditor ' +
                               '   from mau_auditores ' +
                               '  where au_prestador = :prest and au_fbaja is null', [fraPrestador.IDPrestador])
        else
          medico := fraMedico.Codigo;

        ActualizarTurno(edSiniestroABM.Siniestro,                            //se exige la primera fecha y hora
                        edSiniestroABM.Orden, edSiniestroABM.Recaida,        //de citacion por lo tanto es el primer turno
                        iDelegacionCitacion, edFecha.Date, edHora.Text,
                        medico, fraSector.Codigo,
                        fraConsultorio.Codigo);

      if (sCodCartaDocEmp <> '') and (not edFecha2.IsEmpty) then  // TK 29344  //si se exige la segunda fecha
        ActualizarTurno(edSiniestroABM.Siniestro,
                        edSiniestroABM.Orden, edSiniestroABM.Recaida,
                        iDelegacionCitacion, edFecha2.Date, edHora2.Text,
                        fraMedico.Codigo, fraSector.Codigo,
                        fraConsultorio.Codigo);     
    end;

    // Cartas Documento
    if (sCodCartaDocEmp <> '') then
        ProcesarCartaDoc(tiNone, fraFirmantes.edCodigo.Text, fraEventoABM.Codigo, iNroEvento,
                         edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida) ;

    CommitTrans;
  except
    on E: Exception do
    begin
      ErrorMsg(E);
      if InTransaction then Rollback;
    end;
  end; //TRY
end;


function TfrmAbandonoTratamiento.GenerarObservacionesAbandono: string;
var obs: string;
begin
  if rbPrestador.Checked then
    obs := 'A prestador ' + fraPrestador.RazonSocial
  else
    if rbConsultorio.Checked then
      obs := 'A consultorio de ' + fraMedico.Descripcion + ': ' + fraConsultorio.Descripcion + '  '
    else
      if rbOtro.Checked then
        obs := 'A dirección ' + fraDomicilioOtro.Calle + ' ' + fraDomicilioOtro.Numero + iif(fraDomicilioOtro.Piso <> '', ' ' + fraDomicilioOtro.Piso, '') +
                                iif(fraDomicilioOtro.Departamento <> '', ' ' + fraDomicilioOtro.Departamento, '') +
                               ' (' + fraDomicilioOtro.CodigoPostal  + ') ' + fraDomicilioOtro.Localidad + ' - ' + fraDomicilioOtro.Provincia;

  GenerarObservacionesAbandono := obs;
end;

function TfrmAbandonoTratamiento.ValidarRefrescar: boolean;
begin
  Verificar(((not dtAltaMedDesde.IsEmpty) and dtAltaMedHasta.IsEmpty) or (dtAltaMedDesde.IsEmpty and (not dtAltaMedHasta.IsEmpty)),
              gbFAltaMed, 'Se deben completar las dos fechas si desea filtrar por este campo.');
  Result := true;
end;

procedure TfrmAbandonoTratamiento.rbPrestadorClick(Sender: TObject);
begin
  Do_HabilitacionPrestConsOtro(false, tlPrestador);
end;

procedure TfrmAbandonoTratamiento.rbConsultorioClick(Sender: TObject);
begin
  Do_HabilitacionPrestConsOtro(false, tlConsultorio);
end;

procedure TfrmAbandonoTratamiento.rbOtroClick(Sender: TObject);
begin
  Do_HabilitacionPrestConsOtro(false, tlOtro);
end;

procedure TfrmAbandonoTratamiento.Do_HabilitacionPrestConsOtro(bNuevo:boolean; tLugarCitacion: TTipoLugarCitacion);
begin
  LockControls([fraPrestador, fraConsultorio, fraDomicilioOtro, fraMedico], true);
  if not bNuevo then
  begin
    case tLugarCitacion of
      tlPrestador:   begin
                       LockControl(fraPrestador, False);
                       Do_LimpiarChecks(tlPrestador);
                     end;
      tlConsultorio: begin
                       LockControls([fraConsultorio, fraMedico], false);
                       fraConsultorio.Enabled := true;
                       fraMedico.Enabled      := true;
                       Do_LimpiarChecks(tlConsultorio);
                     end;

      tlOtro:        begin
                       LockControl(fraDomicilioOtro, False);
                       Do_LimpiarChecks(tlOtro);
                     end;
    end;
    Do_LimpiarTurno;
  end;
end;

procedure TfrmAbandonoTratamiento.Do_LimpiarABM;
begin
  fraPrestador.Clear;
  fraConsultorio.Limpiar;
  fraMedico.Clear;
  fraEventoABM.Clear;
  fraFirmantes.Limpiar;
  fraSector.Limpiar;
  fraDomicilioOtro.Clear;
  edFecha.Clear;
  edFecha2.Clear;
  edFechaTXT.Clear;
  edFecha2TXT.Clear;
  edHora.Clear;
  edHora2.Clear;
  edObservaciones.Clear;
  sdqEvSini.Close;
  chkSerolOdont.Checked := false;
  vclextra.lockcontrols(chkSerolOdont, true);
end;

procedure TfrmAbandonoTratamiento.btnSiniMasDatosClick(Sender: TObject);
var frmDatosSiniestro : TfrmDatosSiniestro;
begin
  frmDatosSiniestro := TfrmDatosSiniestro.Create(Self);
  Try
    frmDatosSiniestro.ShowDialog(edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida);
  finally
    frmDatosSiniestro.Free;
  end;
end;

procedure TfrmAbandonoTratamiento.btnBuscarSiniClick(Sender: TObject);
var dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    if dlgBusqSini.ShowModal = mrOk then
    begin
      edSiniestroABM.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
      edSiniestroABMSelect(Nil);
    end;
  finally
    dlgBusqSini.Free;
  end;
end;

procedure TfrmAbandonoTratamiento.edSiniestroABMSelect(Sender: TObject);
begin
  Do_RefrescarGrillaABM;
end;

procedure TfrmAbandonoTratamiento.btnGetTurnoClick(Sender: TObject);     // + Turno 1
var sMedico: string;
begin
  if Verificar((fraMedico.IsEmpty and fraPrestador.IsEmpty), pnlPrestador, 'Debe ingresar el Prestador o el Médico en Consultorio para continuar') and
     Verificar(edFecha.IsEmpty, edFecha, 'Debe ingresar la fecha del turno') and
     verificar(fraEventoABM.IsEmpty, fraEventoABM, 'Debe seleccionar un evento para continuar')
  then
    if (not fraMedico.IsEmpty) then          // Por Medico en consultorio
      DoObtenerTurno(edFecha.Date, fraMedico.Codigo, 1)
    else begin                               // Por Prestador            // TK 38001
      sMedico := ValorSql('SELECT au_auditor FROM art.mau_auditores ' +
                           'WHERE au_prestador = ' + SqlValue(fraPrestador.IDPrestador));
      DoObtenerTurno(edFecha.Date, sMedico, 1);
    end;
end;

{procedure TfrmAbandonoTratamiento.DoObtenerTurno(dFecha: TDate; sMedico: String; iTurno: integer);
var
  sTurno, sSql :String;
begin
  sSql := 'SELECT art.amebpba.get_proximoturno(' +
                 SqlValue(sMedico) + ',' +
                 SqlDate(dFecha) + ') FROM dual';
  sTurno := ValorSql(sSql);
  if (length(sTurno) = 5) then //dio un horario como resultado
  begin
     if (iTurno = 1) then
      edHora.Text := sTurno;
  end else
    MsgBox(sTurno);
end; }

procedure TfrmAbandonoTratamiento.pnlConsultorioExit(Sender: TObject);
var sSql :String;
    bTieneTurnos :Boolean;
begin
  if rbConsultorio.Checked then
  begin
    bTieneTurnos        := False;
    iDelegacionCitacion := GetDelegacionCitacion;
    if not(fraMedico.IsEmpty) then
    begin
      sSql := 'SELECT 1 FROM stm_turnosmedicos ' +
              ' WHERE tm_auditor = ' + SqlInt(StrToInt(fraMedico.Codigo)) +
                ' AND tm_fechabaja IS NULL';
      bTieneTurnos := ExisteSql(sSql);
    end;
    DoHabilitarFechaHora(((iDelegacionCitacion > 0) and bTieneTurnos));
  end;
end;

procedure TfrmAbandonoTratamiento.pnlPrestadorExit(Sender: TObject);    // TK 38001
var sSql :String;
    bTieneTurnos :Boolean;
begin
  if rbPrestador.Checked then
  begin
    bTieneTurnos        := False;
    iDelegacionCitacion := GetDelegacionCitacion;
    if not (fraPrestador.IsEmpty) then
    begin
      sSql := 'SELECT 1 FROM art.stm_turnosmedicos, art.mau_auditores ' +
              ' WHERE tm_auditor = au_auditor ' +
                ' AND tm_fechabaja IS NULL ' +
                ' AND au_prestador = ' + SqlValue(fraPrestador.IDPrestador);
      bTieneTurnos := ExisteSql(sSql);
    end;
    DoHabilitarFechaHora(((iDelegacionCitacion > 0) and bTieneTurnos));
  end;
end;

function TfrmAbandonoTratamiento.GetDelegacionCitacion: Integer;
begin
  if rbConsultorio.Checked and (fraConsultorio.Especial1 <> '') then
  //la delegacion de citacion al consultorio está en TB_ESPECIAL1
    Result := StrToInt(fraConsultorio.Especial1)
  else if rbPrestador.Checked and
  //si es al prestador, va la delegacion del mismo
  (ValorSql('SELECT ca_consultorio FROM cpr_prestador ' +
            ' WHERE ca_identificador = ' + SqlValue(fraPrestador.IDPrestador))='S')
  then
    Result := ValorSqlInteger('SELECT nvl(ca_delegacion, 0) FROM cpr_prestador ' +
                              ' WHERE ca_identificador = ' + SqlValue(fraPrestador.IDPrestador))
  else
    Result := 0;
end;

procedure TfrmAbandonoTratamiento.DoHabilitarFechaHora(bHabilitar: boolean);
begin
  edHora.Clear;
  edHora.Enabled       := not(bHabilitar);
  btnGetTurno.Visible  := bHabilitar;
{  edHora2.Clear;
  edHora2.Enabled      := not(bHabilitar);
  btnGetTurno2.Visible := bHabilitar;          }
end;

procedure TfrmAbandonoTratamiento.edFechaExit(Sender: TObject);
begin
  if edFecha.Date > 0 then
    edFechaTXT.Text := DateFormat(edFecha.Date, dfLong)
  else
    edFechaTXT.Text := '';
end;

procedure TfrmAbandonoTratamiento.ProcesarCartaDoc(tImprimir: TTipoImpresion; sFirmante,sCodEvento: String;
                                                   iNroEvento, iSiniestro, iOrden, iRecaida: integer);
var sSql, sFormatoEmpresa, sFormatoTrabajador: String;
begin
  if ValidarEmpresaConfidencial(iNroEvento, iSiniestro, iOrden, AREA_MED) then
  begin
    Try
      sSql := 'SELECT ae_codcartadoc_emp, ae_codcartadoc_trab ' +
               ' FROM art.sae_abandonoeventos ' +
              ' WHERE ae_codigo = :codEv ';

      with GetQueryEx(sSql, [sCodEvento]) do
      try
        sFormatoEmpresa    := FieldByName('AE_CODCARTADOC_EMP').AsString;
        sFormatoTrabajador := FieldByName('AE_CODCARTADOC_TRAB').AsString;
      finally
        Free;
      end;

      if (tImprimir = tiNone) then           // Cartas que No se imprimen
        Do_InsertarCartaCCA_CARTA(iSiniestro, iOrden, iRecaida, iNroEvento, sFormatoEmpresa, sFirmante);
    Except
      on E: Exception do raise Exception.Create('Error al procesar la Carta Documento ' + #13 + E.Message);
    end;

  end;
end;


procedure TfrmAbandonoTratamiento.Do_InsertarCartaCCA_CARTA(iSiniestro, iOrden, iRecaida, iNroEvento: Integer;
                                                            sFormatoEmpresa, sFirmante: string);
var sSql :String;
    iIdFormato, iDestinatario, idCarta :Integer;
begin
  sSql  := 'SELECT tc_id, tc_destinatario ' +
            ' FROM ctc_textocarta ' +
           ' WHERE tc_codigo = :CodCarta ';
  with GetQueryEx(sSql, [sFormatoEmpresa]) do
  try
    iIdFormato    := FieldByName('TC_ID').AsInteger;
    iDestinatario := FieldByName('TC_DESTINATARIO').AsInteger;
  finally
    Free;
  end;

  idCarta := DoInsertarCarta(iIdFormato, iSiniestro, iOrden, iRecaida, sFirmante,
                            AREA_MED, False, ART_EMPTY_ID, IIF(iDestinatario = 2, tdTrabajador, tdEmpresa),
                            '', 0, 0, 0, 0, 0, '', 0, 0, iNroEvento);

  if (idCarta > 0) and (chkSerolOdont.Checked) then
  begin
    ssql := ' update cca_carta ' +
              '  set ca_marcagrupomixto = ''S'' ' +
            '  where ca_id = :idcarta ';
    EjecutarSqlSTEx(ssql, [idCarta]);
  end;

end;

procedure TfrmAbandonoTratamiento.btnTrabajadorClick(Sender: TObject);
begin
  if not edSiniestroABM.IsEmpty then
    with TfrmContratoTrabajador.Create(Self) do
    try
      CargarDatosTrabajador(sdqConsultaTJ_ID.AsInteger,
                            ValorSQLIntegerEx('SELECT rl_id ' +
                                               ' FROM crl_relacionlaboral ' +
                                              ' WHERE rl_contrato = :CONTRATO ' +
                                                ' AND rl_idtrabajador = :IDTRABAJADOR',
                                                     [sdqConsultaEX_CONTRATO.AsInteger,
                                                      sdqConsultaTJ_ID.AsInteger]));
      ShowModal;
    finally
      Free;
    end;
end;


procedure TfrmAbandonoTratamiento.Do_LimpiarChecks(tLimpia: TTipoLugarCitacion);
begin
  case tLimpia of
      tlPrestador:   begin
                       fraConsultorio.Clear;
                       fraMedico.Clear;
                       fraDomicilioOtro.Clear;
                     end;
      tlConsultorio: begin
                       fraPrestador.Clear;
                       fraDomicilioOtro.Clear;
                     end;
      tlOtro:        begin
                       fraPrestador.Clear;
                       fraConsultorio.Clear;
                       fraMedico.Clear;
                     end;
  end;
end;

procedure TfrmAbandonoTratamiento.Do_LimpiarTurno;
begin
  edFecha.Clear;
  btnGetTurno.Visible := false;
  edHora.Clear;
  edFechaTXT.Clear;
  edFecha2.Clear;
  btnGetTurno2.Visible := false;
  edHora2.Clear;
  edFecha2TXT.Clear;
end;

procedure TfrmAbandonoTratamiento.OnEventoChange(Sender: TObject);
begin
  vclextra.lockcontrols(chkSerolOdont, not (ValorSqlEx('select AE_PERMITEMARCARMIXTO from SAE_ABANDONOEVENTOS where AE_ID = :aeid',
                                      [fraEventoABM.ID]) = 'S'));
  chkSerolOdont.Checked := false;
  DoHabilitarSegundaFecha(ExigirSegundaFechaCitacion(fraEventoABM.Codigo));
end;

function TfrmAbandonoTratamiento.ExigirSegundaFechaCitacion(sCodEv: String): Boolean;
begin
  Result := (ValorSqlEx('SELECT AE_EXIGESEGFECHACIT FROM ART.SAE_ABANDONOEVENTOS ' +
                        ' WHERE AE_CODIGO = :codEv', [sCodEv]) = 'S');
end;

procedure TfrmAbandonoTratamiento.btnGetTurno2Click(Sender: TObject);    // + Turno 2
var sMedico: string;
begin
  if Verificar((fraMedico.IsEmpty and fraPrestador.IsEmpty), pnlPrestador, 'Debe ingresar el Prestador o el Médico en Consultorio para continuar') and
     Verificar(edFecha2.IsEmpty, edFecha2, 'Debe ingresar la segunda fecha del turno')
  then
    if (not fraMedico.IsEmpty) then          // Por Medico en consultorio
      DoObtenerTurno(edFecha2.Date, fraMedico.Codigo, 2)
    else
    begin                               // Por Prestador            // TK 38001
      sMedico := ValorSql('SELECT au_auditor FROM art.mau_auditores ' +
                           'WHERE au_prestador = ' + SqlValue(fraPrestador.IDPrestador));
      DoObtenerTurno(edFecha2.Date, sMedico, 2);
    end;
end;  

procedure TfrmAbandonoTratamiento.DoObtenerTurno(dFecha: TDate; sMedico: String; iTurno: integer);
var
  sTurno, sSql :String;
begin
  sSql := 'SELECT art.amebpba.get_proximoturno(' +
                 SqlValue(sMedico) + ',' +
                 SqlDate(dFecha) + ') FROM dual';
  sTurno := ValorSql(sSql);
  if (length(sTurno) = 5) then //dio un horario como resultado
  begin
     if (iTurno = 1) then
     begin
      edHora.Text := sTurno;
      if valorsql('select AE_EXIGESEGFECHACIT from art.sae_abandonoeventos where ae_codigo = ' + SqlValue(fraEventoABM.Codigo)) = 'N' then
        abort;
      //la segunda fecha debe ser al menos un dia habil por medio despues de la primera
      edFecha2.Date    := ValorSqlDateTime('SELECT art.amebpba.calcdiashabiles(' + SqlDate(edFecha.Date) + ' , 2) FROM dual');
      edFecha2.MinDate := edFecha2.Date;
     end else
       edHora2.Text := sTurno;
  end else
    MsgBox(sTurno);
end;


procedure TfrmAbandonoTratamiento.edFecha2Exit(Sender: TObject);
begin
  if edFecha2.Date > 0 then
    edFecha2TXT.Text := DateFormat(edFecha2.Date, dfLong)
  else
    edFecha2TXT.Text := '';
end;

procedure TfrmAbandonoTratamiento.DoHabilitarSegundaFecha(bHabilitado: boolean);
begin
  label11.Visible := bHabilitado;
  edfecha2.Visible := bHabilitado;
  edHora2.Visible := bHabilitado;
  edFecha2TXT.Visible := bHabilitado;
  edFecha2.Clear;
  btnGetTurno2.Visible := false;
  edHora2.Clear;
  edFecha2TXT.Clear;

end;

end.
