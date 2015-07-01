unit unAgendaProtocolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, SinEdit, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unFraCodDesc, unfraAlarmasPorProtocolo, unFraCIE10, unfraPrestador, Mask, ToolEdit, DateComboBox,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, Menus, QuickRpt, QRCtrls, unArtDBAwareFrame, unArtDbFrame;

type
  TDatosAlarmas = record
    IdExpediente: Integer;
    NumAuto     : Integer;
  end;

  TfrmAgenda = class(TfrmCustomGridABM)
    chkRealizado: TCheckBox;
    Label1: TLabel;
    edObservaciones: TMemo;
    fraMotivo: TfraCtbTablas;
    Label2: TLabel;
    pnlSpacer: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    edObservacionesViejas: TMemo;
    ColorDialog: TColorDialog;
    sdqGtrabajo: TSDQuery;
    dsGtrabajo: TDataSource;
    tbViajar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton2: TToolButton;
    pMenuViajar: TPopupMenu;
    MnuViajarParte: TMenuItem;
    mnuViajarAutorizaciones: TMenuItem;
    ScrollBox1: TScrollBox;
    qrAlarmas: TQuickRep;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    pMenuMail: TPopupMenu;
    mnuListadoAlarmas: TMenuItem;
    mnuSolicitudPrestador: TMenuItem;
    ScrollBox2: TScrollBox;
    qrPedido: TQuickRep;
    PageHeaderBand2: TQRBand;
    qriLogo: TQRImage;
    QRSysData1: TQRSysData;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRMemo2: TQRMemo;
    qrlDomPrestador: TQRLabel;
    qrlPrestador: TQRLabel;
    ColumnHeaderBand2: TQRBand;
    DetailBand2: TQRBand;
    QRLabel18: TQRLabel;
    QRShape14: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrdbSiniestro: TQRDBText;
    sdqPedido: TSDQuery;
    dsPedido: TDataSource;
    qrdbCUIL: TQRDBText;
    qrdbTrabajador: TQRDBText;
    QRShape1: TQRShape;
    qrlLocPrestador: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    qrlEnviarSol: TQRLabel;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRLabel22: TQRLabel;
    QRShape16: TQRShape;
    QRLabel23: TQRLabel;
    QRShape17: TQRShape;
    qrlFechaTurno: TQRLabel;
    qrlPractica: TQRLabel;
    dsGestor: TDataSource;
    sdqGestor: TSDQuery;
    pcFiltros: TPageControl;
    TabSheet1: TTabSheet;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    gbProtocolo: TGroupBox;
    fraProtocolo: TfraCtbTablas;
    gbAlarma: TGroupBox;
    fraAlarmasPorProtocolo: TfraAlarmasPorProtocolo;
    gbCIE10: TGroupBox;
    fraCIE10: TfraCodDesc;
    gbDelegacion: TGroupBox;
    fraDelegacion: TfraCodDesc;
    GroupBox6: TGroupBox;
    cmbEstado: TComboBox;
    gbFecha: TGroupBox;
    Label8: TLabel;
    cmbDA_FECHADesde: TDateComboBox;
    cmbDA_FECHAHasta: TDateComboBox;
    gbRealizado: TGroupBox;
    rbRealizadoSi: TRadioButton;
    rbRealizadoNo: TRadioButton;
    rbRealizadoTodos: TRadioButton;
    gbGrupoTrabajo: TGroupBox;
    cmbGtrabajo: TDBCheckCombo;
    gbGestor: TGroupBox;
    cmbGestor: TArtComboBox;
    chkCitacionCons: TCheckBox;
    chkSolicitudAud: TCheckBox;
    TabSheet2: TTabSheet;
    gbPrestadorCabecera: TGroupBox;
    fraPrestadorCabecera: TfraPrestador;
    gbPrestadorEfector: TGroupBox;
    fraPrestadorEfector: TfraPrestador;
    gbUsuarios: TGroupBox;
    fraUsuarios: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraAlarmasPorProtocolocmbDescripcionDropDown(Sender: TObject);
    procedure fraCIE10cmbDescripcionDropDown(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                var Background: TColor; Highlight: Boolean);
    procedure CambioColor(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure MnuViajarParteClick(Sender: TObject);
    procedure mnuViajarAutorizacionesClick(Sender: TObject);
    procedure tbEnviar_MailClick(Sender: TObject);
    procedure mnuListadoAlarmasClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure mnuSolicitudPrestadorClick(Sender: TObject);
    procedure qrPedidoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure GridPaintFooter(Sender: TObject; Column: String;
                              var Value: String; var CellColor, FontColor: TColor;
                              var AlignFooter: TAlingFooter);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
  private
    DatosAlarmas : Array of TDatosAlarmas;
    procedure fraProtocoloOnChange(Sender: TObject);
    procedure EnviarMailAgenda;
    procedure DoGenerarEvolutivo(sSiniestros :String; iIdPrest: integer);
    procedure SetFechaPrestacion(iExped, iNumAuto :Integer);
    function GetMailDestino:String;
    function HayRegistroActivo :Boolean;
    function Hay1RegistroActivo :Boolean;
    function HayAlMenos1RegistroActivo :Boolean;
    function SolicitudYaEnviada :Boolean;  // TK 14646
  public
    procedure LoadControls; override;
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    function  Validar : Boolean; override;
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses
  unFiltros, unDmPrincipal, CustomDlgs, AnsiSQL, SqlFuncs, unSesion, unART,
  General, VCLExtra, unParteEvolutivo, unPrincipal, unAutSelPorSiniestro,
  ArchFuncs, unMoldeEnvioMail, unExportPDF, unEnvioMail, uncomunes,
  Strfuncs, unCustomConsulta;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbRefrescarClick(Sender: TObject);
var
  sSQL :string;
  bHabilitarMail :Boolean;
begin
  sSQL := 'SELECT ap_prioridad prioridad, da_fecha f_alarma, da_siniestro siniestro, ' +
                ' da_orden orden, da_recaida recaida, a.tb_descripcion protocolo, ' +
                ' ap_id id_alarma, ap_descripcion alarma, da_ocurrencia dias_alarma, ' +
                ' ex_diagnosticooms cie10, nvl(ex_fecharecaida,ex_fechaaccidente) f_accidente, ' +
                ' ex_cuil cuil, tj_nombre paciente, ap_diasrepe, ' +
                ' art.actualdate-(nvl(ex_bajamedica, nvl(ex_fecharecaida, ex_fechaaccidente))) diascaidos, ' +
                ' cab.ca_descripcion pres_cabecera, cab.ca_codarea || '' '' || cab.ca_telefono cab_tel, ' +
                ' efe.ca_descripcion pres_practica, efe.ca_codarea || '' '' || efe.ca_telefono efe_tel, ' +
                ' lg_nombre delegacion, art.amebpba.get_nombregtrabajo(da_equipo) gtrabajo, ' +
                ' da_realizado cumplido, da_motivonocumpli, b.tb_descripcion no_cumplimiento, ' +
                ' art.protocolo.get_proximocontrol(ex_siniestro, ex_orden, ex_recaida) as fecha_prox_control, ' +
                ' da_observaciones observaciones, da_idalarmasporprotocolo, ' +
                ' em_nombre, dc_telefonos, da_presefector, ex_prestador, ' +
                ' decode(ap_id,''PG02'', da_autorizacion, ' +
                             ' ''PG12'', da_autorizacion, ' +
                             ' ''PG19'', da_autorizacion, null) da_autorizacion, ' + //solo se muestra para estas alarmas
                ' decode(da_estadocie10, ''V'', ''Vencido'', ''A'', ''A Vencer'', ''N'', ''Normal'') estadoCie10, ' +
                ' da_citaconsultorio, da_solauditoria, ex_id, ex_delegacion, ' +
                ' siniestro.get_usuariogestor(ex_id) usugestor ' + 
           ' FROM adc_domiciliocontrato, aem_empresa, ctb_tablas a, ctb_tablas b, ' +
                ' dlg_delegaciones, ctj_trabajador, sex_expedientes, ' +
                ' amed.map_alarmasporprotocolo, amed.mda_detallealarmas, ' +
                ' cpr_prestador cab, cpr_prestador efe ' +
          ' WHERE da_idalarmasporprotocolo = ap_id ' +
            ' AND a.tb_clave = ''PROTO'' ' +
            ' AND a.tb_codigo = ap_protocolo ' +
            ' AND b.tb_clave(+) = ''MOTPR'' ' +
            ' AND b.tb_codigo(+) = da_motivonocumpli ' +
            ' AND ex_siniestro = da_siniestro ' +
            ' AND ex_orden = da_orden ' +
            ' AND ex_recaida = da_recaida ' +
            ' AND cab.ca_identificador(+) = ex_prestador ' +
            ' AND efe.ca_identificador(+) = da_presefector ' +
            ' AND(da_ocurrencia <= ap_diasrepe ' +
             ' OR ap_diasrepe IS NULL ' +
             ' OR (da_ocurrencia = 14 AND da_idalarmasporprotocolo LIKE ''G%'')) ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND dc_contrato = art.afiliacion.get_ultcontrato(ex_cuit) ' +
            ' AND dc_tipo = ''L'' ';

  if not edSiniestro.IsEmpty then
    sSQL := sSQL + ' AND da_siniestro = ' + edSiniestro.SiniestroSQL +
                   ' AND da_orden = ' + edSiniestro.OrdenSQL +
                   ' AND da_recaida = ' + edSiniestro.RecaidaSQL;

  if fraProtocolo.IsSelected then
    sSQL := sSQL + DoFiltroComponente(fraProtocolo, ' '''' || AP_PROTOCOLO');

  if fraAlarmasPorProtocolo.IsSelected then
    sSQL := sSQL + DoFiltroComponente(fraAlarmasPorProtocolo, ' '''' || DA_IDALARMASPORPROTOCOLO');

  if fraCIE10.IsSelected then
    sSQL := sSQL + DoFiltroComponente(fraCIE10, ' '''' || EX_DIAGNOSTICOOMS');

  if fraDelegacion.IsSelected then
    sSQL := sSQL + DoFiltroComponente(fraDelegacion, ' '''' || EX_DELEGACION');

  if (cmbGtrabajo.Text <> '') then
     sSQL := sSQL + ' AND da_equipo ' + cmbGtrabajo.InSql;

  if (cmbGestor.Text <> '') then
     sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text);

  sSQL := sSQL + DoFiltro(gbFecha);

  if rbRealizadoSi.Checked then
    sSQL := sSQL + ' AND da_realizado = ''S'' '
  else if rbRealizadoNo.Checked then
    sSQL := sSQL + ' AND da_realizado = ''N'' ';

  if chkCitacionCons.Checked then
    sSQL := sSQL + ' AND ((da_citaconsultorio IS NULL) OR (da_citaconsultorio <= actualdate)) ';

  if chkSolicitudAud.Checked then
    sSQL := sSQL + ' AND ((da_solauditoria IS NULL) OR (da_solauditoria <= (actualdate - 7))) ';

  case cmbEstado.ItemIndex of
    0: sSQL := sSQL + ' AND da_estadocie10 = ''A'' ';
    1: sSQL := sSQL + ' AND da_estadocie10 = ''N'' ';
    2: sSQL := sSQL + ' AND da_estadocie10 = ''V'' ';
  end;

  if not fraPrestadorCabecera.IsEmpty then
    sSQL := sSQL + ' AND '''' || ex_prestador = ' + SqlInt(fraPrestadorCabecera.IDPrestador);

  if not fraPrestadorEfector.IsEmpty then
    sSQL := sSQL + ' AND '''' || da_presefector = ' + SqlInt(fraPrestadorEfector.IDPrestador);

  if fraUsuarios.IsSelected then
    sSQL := sSQL + ' AND ex_prestador IN (SELECT pu_idprestador ' +
                                          ' FROM cpu_prestadorusuario ' +
                                         ' WHERE pu_usuario = ' + SqlValue(fraUsuarios.Codigo) +
                                           ' AND pu_fechabaja IS NULL) ';   

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;

  bHabilitarMail := not(sdqConsulta.Eof) and
                   (fraPrestadorCabecera.IsSelected or
                    fraPrestadorEfector.IsSelected);
  tbEnviarMail.Enabled          := True;
  mnuListadoAlarmas.Enabled     := bHabilitarMail;
  mnuSolicitudPrestador.Enabled := bHabilitarMail;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived                 := False;
  fraProtocolo.Clave          := 'PROTO';
  fraMotivo.Clave             := 'MOTPR';
  cmbDA_FECHADesde.Date       := DBDate;
  cmbDA_FECHAHasta.Date       := DBDate;
  Sql.TableName               := 'AMED.MDA_DETALLEALARMAS';
  fraProtocolo.OnChange       := fraProtocoloOnChange;
  pcFiltros.ActivePageIndex   := 0;
  sdqGtrabajo.Open;
  with fraUsuarios do
  begin
    ShowBajas   := False;
    TableName   := 'USE_USUARIOS';
    FieldID     := 'SE_USUARIO';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'SE_FECHABAJA';
    Sql         := 'SELECT DISTINCT se_usuario as id, se_usuario as codigo, ' +
                         ' se_nombre as descripcion, se_fechabaja as baja ' +  
                    ' FROM cpu_prestadorusuario, use_usuarios ' +
                   ' WHERE pu_usuario = se_usuario ' +
                     ' AND pu_fechabaja IS NULL ' +
                     ' AND se_fechabaja IS NULL';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edSiniestro.Clear;
  fraProtocolo.Clear;
  fraAlarmasPorProtocolo.Clear;
  fraCIE10.Clear;
  fraDelegacion.Clear;
  cmbDA_FECHADesde.Date     := DBDate;
  cmbDA_FECHAHasta.Date     := DBDate;
  rbRealizadoTodos.Checked  := True;
  cmbEstado.ItemIndex       := 3;
  chkCitacionCons.Checked   := False;
  chkSolicitudAud.Checked   := False;
  fraPrestadorCabecera.Clear;
  fraPrestadorEfector.Clear;
  cmbGtrabajo.Clear;
  cmbGestor.Clear;
  fraUsuarios.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.fraAlarmasPorProtocolocmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  Verificar(fraProtocolo.IsEmpty, fraProtocolo.edCodigo, 'Debe seleccionar el protocolo para ver las alarmas.');
  fraAlarmasPorProtocolo.Propiedades.ExtraCondition := ' AND AP_PROTOCOLO = ' + SQLValue(fraProtocolo.Value) + ' ';
  fraAlarmasPorProtocolo.cmbDescripcionDropDown(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.LoadControls;
begin
  chkRealizado.Checked              := sdqConsulta.FieldByName('CUMPLIDO').AsString = 'S';
  fraMotivo.Value                   := sdqConsulta.FieldByName('DA_MOTIVONOCUMPLI').AsString;
  edObservacionesViejas.Lines.Text  := sdqConsulta.FieldByName('OBSERVACIONES').AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.ClearControls;
begin
  chkRealizado.Checked := False;
  fraMotivo.Clear;
  edObservaciones.Lines.Clear;
  edObservacionesViejas.Lines.Clear;
end;
{-------------------------------------------------------------------------------}
function TfrmAgenda.Validar: Boolean;
begin
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.fraCIE10cmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  Verificar(fraProtocolo.IsEmpty, fraProtocolo.edCodigo, 'Debe seleccionar el protocolo para ver los diagnósticos.');
  fraCIE10.Propiedades.ExtraCondition := ' AND dg_codigo IN (SELECT pc_cie10 ' +
                                                             ' FROM amed.mpc_protocolocie10 ' +
                                                            ' WHERE pc_protocolo = ' + SQLValue(fraProtocolo.Value) + ') ';
  fraCIE10.cmbDescripcionDropDown(Sender);
end;
{-------------------------------------------------------------------------------}
function TfrmAgenda.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maModificacion then
  begin
    Sql.PrimaryKey.Add('DA_SINIESTRO', sdqConsulta.FieldByName('SINIESTRO').AsInteger);
    Sql.PrimaryKey.Add('DA_ORDEN', sdqConsulta.FieldByName('ORDEN').AsInteger);
    Sql.PrimaryKey.Add('DA_RECAIDA', sdqConsulta.FieldByName('RECAIDA').AsInteger);
    Sql.PrimaryKey.Add('DA_IDALARMASPORPROTOCOLO', sdqConsulta.FieldByName('DA_IDALARMASPORPROTOCOLO').AsString);
    Sql.PrimaryKey.Add('DA_OCURRENCIA', sdqConsulta.FieldByName('DIAS_ALARMA').AsInteger);
    Sql.Fields.Add('DA_FECHAMODIF', exDateTime);
    Sql.Fields.Add('DA_USUMODIF', Sesion.UserID);
    Sql.Fields.Add('DA_OBSERVACIONES', String(edObservacionesViejas.Lines.Text +
                                       iif((Trim(edObservacionesViejas.Lines.Text) = '') or
                                           (Trim(edObservaciones.Lines.Text) = ''), '', CRLF) +
                                       edObservaciones.Lines.Text));
    Sql.Fields.Add('DA_MOTIVONOCUMPLI', fraMotivo.Value);
    Sql.Fields.Add('DA_REALIZADO', SqlBoolean(chkRealizado.Checked, True), False);
    Sql.SqlType := stUpdate;
  end;
  Result := inherited DoABM;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                       var Background: TColor; Highlight: Boolean);
begin
  if Field.FullName = 'PRIORIDAD' then
  begin
    if Field.Value = '1' then Background := pnl1.Color;
    if Field.Value = '2' then Background := pnl2.Color;
    if Field.Value = '3' then Background := pnl3.Color;
  end;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.CambioColor(Sender: TObject);
begin
  ColorDialog.Color := TPanel(Sender).Color;
  if ColorDialog.Execute then
    TPanel(Sender).Color := ColorDialog.Color;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbPropiedadesClick(Sender: TObject);
begin
  if Hay1RegistroActivo then
  begin
    if inherited DoABM then tbRefrescarClick(nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.fpAbmBeforeShow(Sender: TObject);
begin
  VCLExtra.LockControls(fraMotivo, not sdqConsulta.FieldByName('AP_DIASREPE').IsNull);
  edObservaciones.Lines.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.fraProtocoloOnChange(Sender: TObject);
begin
  inherited;
  fraAlarmasPorProtocolo.Clear;
  fraCIE10.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.MnuViajarParteClick(Sender: TObject);
begin
  if not(HayRegistroActivo) and edSiniestro.IsEmpty then Exit;
  with frmParteEvolutivo do
  begin
    if not(Assigned(frmParteEvolutivo)) then
    begin
      frmParteEvolutivo := TfrmParteEvolutivo.Create(frmPrincipal);
      MenuItem          := frmPrincipal.mnuParteEvolutivoCarga;
      FormStyle         := fsMDIChild;
    end;
    if Self.edSiniestro.IsEmpty then
      SinEdit.SetValues(Self.sdqConsulta.FieldByName('SINIESTRO').AsInteger,
                        Self.sdqConsulta.FieldByName('ORDEN').AsInteger,
                        Self.sdqConsulta.FieldByName('RECAIDA').AsInteger)
    else
      SinEdit.SetValues(Self.edSiniestro.Siniestro,
                        Self.edSiniestro.Orden,
                        Self.edSiniestro.Recaida);
    CargarPartes;
    Show;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.mnuViajarAutorizacionesClick(Sender: TObject);
begin
  if edSiniestro.IsEmpty and not(sdqConsulta.Active) then exit;

  with frmAutSelPorSiniestro do
  begin
    if not(Assigned(frmAutSelPorSiniestro)) then
    begin
      frmAutSelPorSiniestro := TfrmAutSelPorSiniestro.Create(frmPrincipal);
      MenuItem              := frmPrincipal.mnuAutAprobacion;
      FormStyle             := fsMDIChild;
    end;
    if not(Self.edSiniestro.IsEmpty) then
      SinEdit.SetValues(Self.edSiniestro.Siniestro, Self.edSiniestro.Orden, Self.edSiniestro.Recaida)
    else
    SinEdit.SetValues(Self.sdqConsulta.FieldByName('SINIESTRO').AsInteger,
                      Self.sdqConsulta.FieldByName('ORDEN').AsInteger,
                      Self.sdqConsulta.FieldByName('RECAIDA').AsInteger);
    tbRefrescarClick(Nil);
    Show;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbEnviar_MailClick(Sender: TObject);
begin
  tbEnviarMail.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.EnviarMailAgenda;
var
  vMailPrestador, vNombreArchivo :String;
begin
  try
    vNombreArchivo := IncludeTrailingBackslash(TempPath) + 'Agenda.PDF';
    vMailPrestador := GetMailDestino;
    ExportarPDF(qrAlarmas, vNombreArchivo);
    unMoldeEnvioMail.EnviarMailBD(vMailPrestador, 'Listado de Alarmas.', [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                 'Se adjunta Listado de Alarmas' + CRLF + CRLF + 'Provincia ART',
                                  GetAttachments(vNombreArchivo, 7));
  except
    on E:Exception do ErrorMsg( E, 'Informe a sistemas de este error.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.mnuListadoAlarmasClick(Sender: TObject);
begin
  if MsgBox('¿Desea enviar un correo electrónico con la información seleccionada?',
             MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    EnviarMailAgenda;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbModificarClick(Sender: TObject);
begin
  if Hay1RegistroActivo then inherited;
end;
{-------------------------------------------------------------------------------}
function TfrmAgenda.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
function TfrmAgenda.Hay1RegistroActivo :Boolean;
begin
  Result := HayRegistroActivo and (Grid.SelectedRows.Count = 1);
end;
{-------------------------------------------------------------------------------}
function TfrmAgenda.HayAlMenos1RegistroActivo :Boolean;
begin
  Result := HayRegistroActivo and (Grid.SelectedRows.Count >= 1);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.mnuSolicitudPrestadorClick(Sender: TObject);
var
  sSql, sAnd, sNombreArchivo, sMailPrestador,
  sAlarmas, sWhere :String;
  i, iIdPrestador :Integer;
  Resultado :TResultadoEnvio;
begin
  if HayAlMenos1RegistroActivo and (not SolicitudYaEnviada) then
  try

    SetLength(DatosAlarmas, 0);

    sSql := 'SELECT ex_id, utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                  ' utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, ' +
                  ' nvl(ex_fecharecaida, ex_fechaaccidente) fechasin ' +
             ' FROM sex_expedientes, ctj_trabajador ' +
            ' WHERE tj_cuil = ex_cuil ' +
              ' AND ex_id IN (';

    sAlarmas := 'UPDATE amed.mda_detallealarmas ' +
                  ' SET da_fechamodif = sysdate, ' +
                      ' da_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                      ' da_realizado = ''S'', ' +  // Lu (03/02/2010) supuestamente con esta marca se da por realizado, y eso quiere decir que se envió el mail al prestador (Solicitud al prestador).  Ya que es el unico lugar donde se updatea. => "Realizado"="se envio la solicitud al prestador"
                      ' da_observaciones = da_observaciones || iif_null(da_observaciones, Null, '' - '') || ' +
                        ' ''Mail de solicitud de información enviado'' ';

    BeginTrans;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
      sAnd := sAnd + ',' + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger);
      sWhere := ' WHERE da_siniestro = ' + SqlInt(sdqConsulta.FieldByName('SINIESTRO').AsInteger) +
                  ' AND da_orden = ' + SqlInt(sdqConsulta.FieldByName('ORDEN').AsInteger) +
                  ' AND da_recaida = ' + SqlInt(sdqConsulta.FieldByName('RECAIDA').AsInteger) +
                  ' AND da_idalarmasporprotocolo = ' + SqlValue(sdqConsulta.FieldByName('DA_IDALARMASPORPROTOCOLO').AsString) +
                  ' AND da_ocurrencia = ' + SqlInt(sdqConsulta.FieldByName('DIAS_ALARMA').AsInteger);
      EjecutarSqlST(sAlarmas + sWhere);
      if (sdqConsulta.FieldByName('DA_AUTORIZACION').AsInteger > 0) then
      begin
        SetLength(DatosAlarmas, Length(DatosAlarmas) + 1);
        DatosAlarmas[High(DatosAlarmas)].IdExpediente := sdqConsulta.FieldByName('EX_ID').AsInteger;
        DatosAlarmas[High(DatosAlarmas)].NumAuto      := sdqConsulta.FieldByName('DA_AUTORIZACION').AsInteger;
      end;
    end;

    sMailPrestador := GetMailDestino;
    iIdPrestador   := IIF(fraPrestadorCabecera.IsSelected,
                      SqlInt(sdqConsulta.FieldByName('EX_PRESTADOR').AsInteger),
                      SqlInt(sdqConsulta.FieldByName('DA_PRESEFECTOR').AsInteger));   // TK 21331

    sAnd := Copy(sAnd, 2, Length(sAnd)) + ')';
    DoGenerarEvolutivo(sAnd, iIdPrestador);
    sdqPedido.Close;
    sdqPedido.SQL.Text := sSql + sAnd;
    sdqPedido.Open;
    sNombreArchivo := IncludeTrailingBackslash(TempPath) + 'SolicitudInfo.PDF';

    ExportarPDF(qrPedido, sNombreArchivo);
    Resultado := unMoldeEnvioMail.EnviarMailBDWithResults
                  (sMailPrestador, 'Solicitud de información.',
                  [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                  'Se adjunta solicitud de información' + CRLF + CRLF + 'Provincia ART',
                  GetAttachments(sNombreArchivo, 7), 0, tcDefault, False);
    if Resultado.EnvioOk then
    begin
      CommitTrans;
      tbRefrescarClick(Nil);
    end
    else Rollback;
  except
    on E:Exception do
    begin
      if InTransaction then Rollback;
      ErrorMsg( E, 'Informe a sistemas de este error.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmAgenda.GetMailDestino:String;
var
  sSql :String;
begin
  sSql := 'SELECT ca_direlectronica ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = ' + IIF(fraPrestadorCabecera.IsSelected,
                                             SqlInt(sdqConsulta.FieldByName('EX_PRESTADOR').AsInteger),
                                             SqlInt(sdqConsulta.FieldByName('DA_PRESEFECTOR').AsInteger));
  Result := ValorSql(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.qrPedidoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qriLogo.Picture.Assign(frmPrincipal.imgLogo.Picture);
  qrlPrestador.Caption    := IIF(fraPrestadorCabecera.IsEmpty,
                                 fraPrestadorEfector.RazonSocial,
                                 fraPrestadorCabecera.RazonSocial);
  qrlDomPrestador.Caption := IIF(fraPrestadorCabecera.IsEmpty,
                                 fraPrestadorEfector.Domicilio,
                                 fraPrestadorCabecera.Domicilio);
  qrlLocPrestador.Caption := IIF(fraPrestadorCabecera.IsEmpty,
                                 fraPrestadorEfector.Localidad  + ' - ' +  fraPrestadorEfector.Provincia,
                                 fraPrestadorCabecera.Localidad + ' - ' +  fraPrestadorCabecera.Provincia);
  qrlEnviarSol.Caption    := IIF((cmbGtrabajo.CheckedCount = 1) and
                                 (not(sdqGtrabajo.FieldByName('GP_FAX').IsNull) or
                                  not(sdqGtrabajo.FieldByName('GP_EMAIL').IsNull)),
                                 'Enviar información solicitada al fax: ' + sdqGtrabajo.FieldByName('GP_FAX').AsString +
                                 ' o a la dirección de mail: ' + sdqGtrabajo.FieldByName('GP_EMAIL').AsString, '');
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.DoGenerarEvolutivo(sSiniestros :String; iIdPrest: integer);
var
  sSql :String;
  SqlResults :TStringList;
  sdqAux :TSDQuery;
begin
  sSql := 'SELECT ex_id, ex_delegacion ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_id IN (' + sSiniestros;
  sdqAux := GetQuery(sSql);
  try
    while not sdqAux.Eof do
    begin
     { sSql  := 'SELECT ca_identificador ' +
                ' FROM cpr_prestador ' +
               ' WHERE ca_delegparte = :Del ';
      iPres := ValorSqlIntegerEx(sSql, [sdqAux.FieldByName('ex_delegacion').AsString], 9753); }    // TK 21331 esto estaba antes, ahora paso el parametro iIdPrest (para que sea el mismo prestador al que se envía el mail).

      sSql := 'SELECT ex_diagnostico, dg_id, tc_id ' +
               ' FROM sex_expedientes, cdg_diagnostico, sin.stc_tipogravedad_cie10  ' +
              ' WHERE ex_diagnosticooms = dg_codigo(+) ' +
                ' AND ex_gravedadcie10 = tc_codigo(+) ' +
                ' AND ex_id = ' + SqlInt(sdqAux.FieldByName('EX_ID').AsInteger);
      SqlResults := ValoresColSQL(sSql);
      try
        sSql := ' declare ' +
                '   idprestador number; ' +
                ' begin ' +
                ' idprestador := ' + SqlInt(iIdPrest) + ';' +     // TK 21331
                ' art.siniestro.do_generarevolutivo(Null, ' + SqlInt(sdqAux.FieldByName('EX_ID').AsInteger) + ', idprestador ,' +
                                                   SqlValue(SqlResults[0]) + ',' + SqlInt(SqlResults[1], True) + ',' +
                                                   SqlInt(SqlResults[2], True) + ', ActualDate, ActualDate, Null, ' +
                                                   ' ''Se solicitó evolución, informe de practica y/o alta medica al prestador.''' + ',' +
                                                   ' Null, Null, Null, Null, Null, Null, Null, Null, Null, ' +
                                                   ' Null, Null, ''A'', ' + SqlValue(Sesion.UserID) + ', ''REDPRES'');' +
                ' end; ';
        EjecutarSqlST(sSql);
      finally
        SqlResults.Free;
      end;
      sdqAux.Next;
    end;
  finally
    sdqAux.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.GridPaintFooter(Sender: TObject; Column: String; var Value: String;
                                     var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  inherited;
  if (Column = 'F_ALARMA') then
    Value := 'Total: ' +  IntToStr(sdqConsulta.RecordCount);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmAgenda := Nil;
  frmPrincipal.mnuAgenda.Enabled := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.DetailBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i, IdExp :integer;
begin
  inherited;
  qrlFechaTurno.Caption := '';
  qrlPractica.Caption   := '';
  IdExp := sdqPedido.FieldByName('EX_ID').AsInteger;
  for i := 0 to High(DatosAlarmas) do
  begin
    if DatosAlarmas[i].IdExpediente = IdExp then
    begin
      SetFechaPrestacion(DatosAlarmas[i].IdExpediente,
                         DatosAlarmas[i].NumAuto);
      Exit;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.SetFechaPrestacion(iExped, iNumAuto :Integer);
var
  sSql :String;
  sdqAux :TSDQuery;
begin
  sSql := 'SELECT au_turno, pr_descripcion ' +
           ' FROM sau_autorizaciones, mpr_prestaciones ' +
          ' WHERE nvl(au_presapro, au_pressol) = pr_codigo(+) ' +
            ' AND au_idexpediente = ' + SqlInt(iExped) +
            ' AND au_numauto = ' + SqlInt(iNumAuto);
  sdqAux := GetQuery(sSql);
  try
    qrlFechaTurno.Caption := sdqAux.FieldByName('AU_TURNO').AsString;
    qrlPractica.Caption   := sdqAux.FieldByName('PR_DESCRIPCION').AsString;
  finally
    sdqAux.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.tbEnviarMailClick(Sender: TObject);
begin
  tbEnviarMail.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAgenda.cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
var
  sSql :String;
begin
  cmbGestor.Clear;
  if Trim(cmbGTrabajo.Text) <> '' then  // Lu 04/04/2008 pongo este if para que ejecute lo siguiente solo si se ingreso algo en el combo.
  begin
    sSql := 'SELECT ug_id, ug_usuario ' +
             ' FROM mgp_gtrabajo, mug_usuariogrupotrabajo, ctb_tablas ' +
            ' WHERE ug_fechabaja IS NULL ' +
              ' AND ug_tipousuario = tb_codigo ' +
              ' AND tb_clave = ''TUSU'' ' +
              ' AND tb_especial1 = ''S'' ' +
              ' AND gp_codigo = ug_grupo ' +
              ' AND gp_gestionado = ''S'' ' +
              ' AND gp_codigo ' + cmbGtrabajo.InSql;
    sdqGestor.Close;
    sdqGestor.SQL.Text := sSql;
    sdqGestor.Open;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmAgenda.SolicitudYaEnviada: Boolean;     // TK 14646
var sSql:string;
begin
  Result := False;
  sSql := ' SELECT da_realizado ' +
            ' FROM amed.mda_detallealarmas ' +
           ' WHERE da_siniestro = :sini ' +
             ' AND da_orden = :orden ' +
             ' AND da_recaida = :reca ' +
             ' AND da_idalarmasporprotocolo = :alarma ' +
             ' AND da_ocurrencia = :ocurr ';
  if ( ValorSqlEx(sSql, [sdqConsulta.FieldByName('SINIESTRO').AsInteger,
                         sdqConsulta.FieldByName('ORDEN').AsInteger,
                         sdqConsulta.FieldByName('RECAIDA').AsInteger,
                         sdqConsulta.FieldByName('DA_IDALARMASPORPROTOCOLO').AsString,
                         sdqConsulta.FieldByName('DIAS_ALARMA').AsInteger]) = 'S' ) then
  begin
    Infohint(tbEnviarMail, 'Esta solicitud ya ha sido enviada');
    Result := True;
  end;
end;

end.
