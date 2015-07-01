unit UnConsTlgCartas;

interface

uses
  General,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, ImgList, StdCtrls, FormPanel, ComboEditor,
  DBComboGrid, unFraCtbTablas, unfraPrestador, Mask, ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcion,
  QuickRpt, Qrctrls, Menus, strfuncs, Buttons, unArtDBAwareFrame, unArtDbFrame,
  unFraDomicilio, untercerizadoras, unFraTrabajador,
  unFraTrabajadorSiniestro, DBCtrls;

type
  TfrmConsTlgCartas = class(TfrmCustomConsulta)
    FPnlAlta: TFormPanel;
    LblTEnvio: TLabel;
    LblFormato: TLabel;
    LblFecControl: TLabel;
    LblHrControl: TLabel;
    LblPrestador: TLabel;
    LblMotCitac: TLabel;
    LblObserv: TLabel;
    CmbTipoEnvio: TComboBox;
    CmbFechaCtrl: TDateComboBox;
    fraMotCitac: TfraCtbTablas;
    TxtObservac: TMemo;
    CmdAceptar: TButton;
    btnCancelar: TButton;
    fraPrestador: TfraPrestador;
    sdqTrabajador: TSDQuery;
    fraFormato: TfraCodigoDescripcion;
    Label1: TLabel;
    edCT_MEDICO: TEdit;
    FPBajaTlg: TFormPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FechaB: TDateComboBox;
    fraFormatoB: TfraCodigoDescripcion;
    btnAceptar: TButton;
    Button3: TButton;
    MnuImpre: TPopupMenu;
    ImprimirListado1: TMenuItem;
    ImprimirTextodelTelegrama1: TMenuItem;
    Panel1: TPanel;
    RptTlg: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ArtDBGrid1: TArtDBGrid;
    DataSource1: TDataSource;
    SDQPrintTlg: TSDQuery;
    DSPrintTlg: TDataSource;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Label5: TLabel;
    fraMedPCons: TfraCodigoDescripcion;
    ObsTeleg: TMemo;
    Label6: TLabel;
    SDQRptData: TSDQuery;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    fraSector: TfraCtbTablas;
    Label12: TLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    btnGetTurno: TSpeedButton;
    edHora: TMaskEdit;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    ToolBar1: TToolBar;
    tbEditarDomicilio: TToolButton;
    fpEditarDomicilioTeleg: TFormPanel;
    btnAceptarDomic: TButton;
    btnCancelDomic: TButton;
    ToolBar2: TToolBar;
    fraDomicilioEditTeleg: TfraDomicilio;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnGetTurnoRec: TSpeedButton;
    HoraB: TMaskEdit;
    ToolBarTrabajador: TToolBar;
    tbManTrab: TToolButton;
    imgIconos: TImageList;
    fraEX_ID: TfraTrabajadorSiniestro;
    Label7: TLabel;
    ToolBar3: TToolBar;
    tbManTrabFiltro: TToolButton;
    TimerSMS: TTimer;
    ShortCutControlHijo: TShortCutControl;
    edTexto: TDBMemo;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure CmbTipoEnvioChange(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure ImprimirListado1Click(Sender: TObject);
    procedure ImprimirTextodelTelegrama1Click(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnGetTurnoClick(Sender: TObject);
    procedure CmbFechaCtrlChange(Sender: TObject);
    procedure btnAceptarDomicClick(Sender: TObject);
    procedure tbEditarDomicilioClick(Sender: TObject);
    procedure btnCancelDomicClick(Sender: TObject);
    procedure btnGetTurnoRecClick(Sender: TObject);
    procedure FPBajaTlgShow(Sender: TObject);
    procedure tbManTrabClick(Sender: TObject);
    procedure FPnlAltaShow(Sender: TObject);
    procedure TimerSMSTimer(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure fraPrestadorExit(Sender: TObject);
  private
    FContrato: Integer;
    FCUIL, FSQL: String;
    FIdExpediente: Integer;

    function GetOrden: Integer;
    function GetRecaida: Integer;
    function GetSiniestro: Integer;
    function IsValido: Boolean;
    function ValidarDomicilioTeleg: Boolean;

    procedure DoHabilitarFechaHora(bHabilitar: Boolean);
    procedure DoInsertarTelegrama(iSiniestro, iOrden, iRecaida, IdCartaTelegrama: Integer; sFirmante, sFirmante2, sTexto, sFormato: String);
    procedure DoLimpiarPnlAlta;
    function DoObtenerTurno(dFecha :TDate; sMedico :String): string;
    procedure HabilitarBotones;
    procedure SetOrden(const Value: Integer);
    procedure SetRecaida(const Value: Integer);
    procedure SetSiniestro(const Value: Integer);
    procedure OnFormatoChange(Sender: TObject);     // TK 17438 : se cambia los OnExit por OnChange.
    procedure OnPrestadorChange(Sender: TObject);
    procedure OnMedPConsChange(Sender: TObject);
    procedure OnfraFormatoBChange(Sender: TObject);
    procedure DoHabilitar_EditarDomicilio;
    procedure SetIdExpediente(const Value: Integer);   // TK 34260
  public
    property Contrato     : Integer read FContrato     write FContrato;
    property CUIL         : String  read FCUIL         write FCUIL;
    property IdExpediente : Integer read FIdExpediente write SetIdExpediente;
    property Orden        : Integer read GetOrden      write SetOrden;
    property Recaida      : Integer read GetRecaida    write SetRecaida;
    property Siniestro    : Integer read GetSiniestro  write SetSiniestro;
  end;

var
  frmConsTlgCartas: TfrmConsTlgCartas;
  iSiniestro: Integer;
  iOrden: Integer;
  iRecaida: Integer;

implementation

uses
  CustomDlgs, unDmPrincipal, unArt, AnsiSql, unSesion, DateTimeFuncs, ValFuncs, unParteEvolutivo,
  unComunes, VCLExtra, StrUtils, unmoldeenviomail, unSMS, unContratoTrabajador, unCustomDataModule,
  unFiltros;

var
  iDelegacionCitacion: Integer;
  bEditadoDomicOdonto: Boolean;

{$R *.DFM}

function TfrmConsTlgCartas.GetOrden: Integer;
begin
  Result := iOrden;
end;

function TfrmConsTlgCartas.GetRecaida: Integer;
begin
  Result := iRecaida;
end;

function TfrmConsTlgCartas.GetSiniestro: Integer;
begin
  Result := iSiniestro;
end;

procedure TfrmConsTlgCartas.SetOrden(const Value: Integer);
begin
  iOrden := Value;
end;
procedure TfrmConsTlgCartas.tbRefrescarClick(Sender: TObject);
begin
  VCLExtra.LockControls([fraEX_ID], fraEX_ID.IsSelected);   
  Verificar(fraEX_ID.IsEmpty, fraEX_ID.edSiniestro, 'Debe seleccionar un siniestro.');
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited;
  HabilitarBotones;
end;

procedure TfrmConsTlgCartas.SetRecaida(const Value: Integer);
begin
  iRecaida := Value;
end;

procedure TfrmConsTlgCartas.SetSiniestro(const Value: Integer);
begin
  iSiniestro := Value;
end;

procedure TfrmConsTlgCartas.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;

  CmbFechaCtrl.MinDate := Date;
  FechaB.MinDate       := Date;
  
  with fraFormato do
  begin
    TableName      := 'art.tft_formatotelegrama';
    FieldID        := 'ft_codigo';
    FieldCodigo    := 'ft_codigo';
    FieldDesc      := 'ft_descripcion';
    ExtraFields    := ', (SELECT ''S'' FROM comunes.cts_textosms WHERE ts_idformatotelegrama = ft_id AND ts_fechabaja IS NULL) as SMS ';
    ExtraCondition := ' AND (substr(ft_codigo, 1, 2) = ''TE'' or substr(ft_codigo, 1, 2) = ''CG'')' +
                              ' and substr(ft_codigo, 1, 3) <> ''TEA'' AND ft_seleccionable = ''S'' ';
  end;
  
  with fraFormatoB do
  begin
    TableName   := 'art.tft_formatotelegrama';
    FieldID     := 'ft_codigo';
    FieldCodigo := 'ft_codigo';
    FieldDesc   := 'ft_descripcion';
    ExtraCondition := ' AND substr(ft_codigo, 1, 3) = ''TEA'' AND ft_seleccionable = ''S''';
  end;
  
  fraMotCitac.Clave       := 'MOTRT';
  {fraformato.Sql          := 'SELECT tt_formato ID, tt_formato CODIGO, tt_descripcion DESCRIPCION, null BAJA' +
                              ' FROM art.tft_formatotelegrama ' +
                             ' WHERE (substr(tt_formato, 1, 2) = ''TE'' or substr(tt_formato, 1, 2) = ''CG'')' +
                              ' and substr(tt_formato, 1, 3) <> ''TEA'''; }

  fraformato.ShowBajas    := True;
  {fraformatoB.Sql         := 'SELECT tt_formato ID , tt_formato CODIGO, tt_descripcion DESCRIPCION, null BAJA' +
                              ' FROM art.tft_formatotelegrama ' +
                             ' WHERE substr(tt_formato, 1, 3) = ''TEA'''; }
  fraformatoB.ShowBajas   := True;
  fraPrestador.sql        := 'SELECT ca_clave, ca_secuencia, ca_identificador, ca_descripcion, ca_domicilio,' +
                                   ' ca_localidad, ca_codpostal, pv_descripcion provincia, ca_codarea || '' '' || ca_telefono ca_telefono, ca_codarea, ca_fechabaja,' +
                                   ' ca_asistencial, ca_concertado, ca_iva, ca_tipocomprobante, ca_direlectronica,' +
                                   ' ca_nombrefanta, ca_fechaconexia, ca_habilitaciones, ca_esreferente ' +
                              ' FROM cpr_prestador,cpv_provincias, mes_especialidades,cpe_prestaespeci' +
                             ' WHERE pe_prestador=ca_identificador' +
                               ' AND pe_fechabaja IS NULL' +
                               ' AND pe_especialidad = es_codigo' +
                               ' AND es_continua = ''S''' +
                               ' AND ca_provincia = pv_codigo (+)';
  with fraMedPCons do
  begin
    FieldID     := 'au_auditor';
    FieldCodigo := 'au_auditor';
    FieldDesc   := 'au_nombre';
    TableName   := 'mau_auditores';
    FieldBaja   := 'au_fbaja';
    ShowBajas   := False;
    if EsUsuarioDeTercerizadora then
      ExtraCondition := ' and au_tercerizadora = ''S'' ';
  end;
  fraSector.Clave := 'SUBSE';
  tbEditarDomicilio.Enabled := false;
  bEditadoDomicOdonto := False;  // TK 90100

  fraFormato.OnChange   := OnFormatoChange;    // TK 17438
  fraPrestador.OnChange := OnPrestadorChange;
  fraMedPCons.OnChange  := OnMedPConsChange;
  fraFormatoB.OnChange  := OnfraFormatoBChange;

  fraEX_ID.SoloSiniestrados := True;
  VCLExtra.LockControls([fraEX_ID, edTexto], True);
end;

procedure TfrmConsTlgCartas.tbNuevoClick(Sender: TObject);
var
  sSql: String;
begin
  if (ValorSql('SELECT IIF_NULL(tj_calle, ''1'', ''0'') || IIF_NULL(tj_localidad,''1'',''0'') ' +
                ' FROM ctj_trabajador ' +
               ' WHERE tj_cuil=''' + CUIL + '''') <> '00') then
    MsgBox('No se puede emitir el telegrama porque el destinatario no posee una dirección válida.', 0, 'Datos Inválidos')
  else if Is_EmpresaConfidencial(Siniestro, Orden, Recaida) then
    MsgBox('No se puede emitir el telegrama ya que el trabajador pertenece a una empresa confidencial.', 0, 'Datos Inválidos')
  else begin // WF 6682
    // Leo datos domicilio trabajador
    sdqTrabajador.SQL.Text :=
      'SELECT tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad, tj_cpostal, tj_provincia,' +
            ' mt_telefono telefono' +
       ' FROM ctj_trabajador, sex_expedientes, comunes.cmt_movitrabajador' +
      ' WHERE ex_siniestro = ' + SqlValue(Siniestro) +
        ' AND ex_orden = ' + SqlValue(Orden) +
        ' AND ex_recaida = ' + SqlValue(Recaida) +
        ' AND tj_cuil = ex_cuil' +
        ' AND mt_idtrabajador = tj_id';
    sdqTrabajador.Open;

    sSql := 'SELECT 1' +
             ' FROM tlg_telegramas' +
            ' WHERE lg_estado NOT IN(''T'', ''9'')' +
              ' AND lg_siniestro = :psiniestro' +
              ' AND lg_orden = :porden' +
              ' AND lg_recaida = :precaida' +
              ' AND ((lg_calle = :pcalle) or (lg_calle IS NULL))' +
              ' AND ((lg_numero = :pnumero) or (lg_numero IS NULL))' +
              ' AND ((lg_piso = :ppiso) or (lg_piso IS NULL))' +
              ' AND ((lg_departamento = :pdepartamento) or (lg_departamento IS NULL))' +
              ' AND ((lg_localidad = :plocalidad) or (lg_localidad IS NULL))' +
              ' AND ((lg_cpostal = :pcpostal) or (lg_cpostal IS NULL))' +
              ' AND ((lg_provincia = :pprovincia) or (lg_provincia IS NULL))';

    if ExisteSqlEx(sSql, [Siniestro, Orden, Recaida,
                          sdqTrabajador.FieldByName('TJ_CALLE').AsString,
                          sdqTrabajador.FieldByName('TJ_NUMERO').AsString,
                          sdqTrabajador.FieldByName('TJ_PISO').AsString,
                          sdqTrabajador.FieldByName('TJ_DEPARTAMENTO').AsString,
                          sdqTrabajador.FieldByName('TJ_LOCALIDAD').AsString,
                          sdqTrabajador.FieldByName('TJ_CPOSTAL').AsString,
                          sdqTrabajador.FieldByName('TJ_PROVINCIA').AsString]) then
      MsgBox('Inconvenientes en el resultado de envíos de Telegramas / CD.' + #13 +
             IIF(sdqTrabajador.FieldByName('telefono').IsNull,
                 'Verificar medio de contacto con el trabajador ya que no se dispone de nro. telefónico del mismo',
                 Format('Contactarse telefónicamente con el trabajador al teléfono %s',
                        [sdqTrabajador.FieldByName('telefono').AsString])),
             0, 'Advertencia');

    sdqTrabajador.Close;
    DoLimpiarPnlAlta;
    fraDomicilioEditTeleg.Clear;
    FPnlAlta.Tag := 1;
    FPnlAlta.ShowModal;
  end;
end;

procedure TfrmConsTlgCartas.CmdAceptarClick(Sender: TObject);
  function ReemplazarVariable(ATexto, AVariable, AValor: String): String;
  begin
    Result := StringReplace(StringReplace(ATexto, '@' + AVariable, AValor, [rfReplaceAll, rfIgnoreCase]), '  ', ' ', [rfReplaceAll]);
  end;
var
  sTMP, sSQL, sTTexto, sTextoSMS, sTipoPEvolutivo, sTextoPEvolutivo, sSqlPresentarseEn, sMedico, sSqLSPV, sCelular: String;
  nNuevoPE, nIDCarta: Integer;
begin
  if IsValido then
  try
    (* Esto no se USA mas!!!!
    if FPnlAlta.Tag = 2 then
    begin
      EjecutarSQLEx('DELETE FROM tlg_telegramas WHERE lg_idcarta_telegrama = :id', [sdqConsulta.FieldByName('CE_ID').AsInteger]);
      EjecutarSQLEx('DELETE FROM sct_carta_telegrama WHERE ct_id = :id', [sdqConsulta.FieldByName('CE_ID').AsInteger]);
      sIDCarta := sdqConsulta.FieldByName('CE_ID').AsString
    end
    else
    *)
      nIDCarta := ValorSql('SELECT SEQ_SCT_ID.NEXTVAL FROM DUAL');

    BeginTrans(True);
    sSQL:=
      'INSERT INTO sct_carta_telegrama (ct_id, ct_siniestro, ct_orden, ct_recaida, ct_tipo, ct_formato,' +
                                      ' ct_fechacontrol, ct_hora, ct_prestador, ct_motivo, ct_observaciones,' +
                                      ' ct_usualta, ct_fechaalta, ct_medico, ct_medico_interno, ct_observa_tlg)' +
                              ' VALUES (' + IntToStr(nIDCarta) + ',' + IntToStr(Siniestro) + ',' + IntToStr(Orden) + ',' +
                                            IntToStr(Recaida) + ',''' + Copy(cmbtipoenvio.Text, 0, 1) + ''',' +
                                            SqlValue(fraformato.Value)+ ',' + cmbfechactrl.SqlText + ',' +
                                            SqlValue(edHora.Text) + ',' + SqlInt(fraPrestador.IDPrestador) + ',' +
                                            SqlValue(framotcitac.Value) + ',' + SqlValue(txtobservac.Text) + ',' +
                                            SqlValue(Sesion.UserID) + ' ,ACTUALDATE,' + SqlValue(edCT_MEDICO.Text) + ',' +
                                            SqlValue(fraMedPCons.Codigo) + ',' + SqlValue(Obsteleg.Text) + ')';
    EjecutarSqlST(sSQL);

    (* ------------ Preparación de algunos valores ------------ *)
    // TK 9011: si se modificó el domicilio del telegrama
    // (para que no vaya al prestador odontologico sino a otro), entonces se modifica el @PRESTA, del sTTexto. lpiparo 31/08/2009
    sSqlPresentarseEn := 'SELECT ca_nombrefanta ';
    if bEditadoDomicOdonto then
      sSqlPresentarseEn := sSqlPresentarseEn + ' || '','' || ''' + fraDomicilioEditTeleg.Calle +
                                                           ' ' + fraDomicilioEditTeleg.Numero +
                                                           IIF(fraDomicilioEditTeleg.Piso <> '', ' Piso ' + fraDomicilioEditTeleg.Piso, '') +
                                                           IIF(fraDomicilioEditTeleg.Departamento <> '', ' Dto. ' + fraDomicilioEditTeleg.Departamento, '') +
                                                           ' (' + fraDomicilioEditTeleg.CodigoPostal + ') - ' +
                                                           fraDomicilioEditTeleg.Localidad + ' - ' +
                                                           fraDomicilioEditTeleg.Provincia + '. '' PrestYDom '
    else
      sSqlPresentarseEn := sSqlPresentarseEn + ' || '','' || ca_domicilio || '' - '' || ' +
                                               ' art.utiles.armar_localidad(ca_codpostal,ca_codpostala,ca_localidad,ca_provincia) ';

    sSqlPresentarseEn := sSqlPresentarseEn + ' FROM cpr_prestador WHERE ca_identificador = ' + IntToStr(fraPrestador.IDPrestador);
    (* -------------------------------------------------------- *)

    (* Por ahora se va a usar solo la opción Telegrama y el SMS será automático si tiene bien cargado algún celular...
    if Copy(cmbtipoenvio.Text,0,1) = 'T' then
    *)
    begin
      //Texto del Telegrama
      sTTexto := ValorSqlEx('SELECT ft_texto FROM art.tft_formatotelegrama WHERE ft_codigo = :codigo', [fraformato.Value]);

      //Reemplazo de variables para el TELEGRAMA
      sTTexto := ReemplazarVariable(sTTexto, 'FECHA', cmbfechactrl.Text);
      sTTexto := ReemplazarVariable(sTTexto, 'HORA', edHora.Text);

      sTTexto := ReemplazarVariable(sTTexto, 'PRESTA', ValorSql(sSqlPresentarseEn));
      sTTexto := ReemplazarVariable(sTTexto, 'MOTIVO', Get_DescripcionCTBTablas('MOTRT', framotcitac.Value));

      sMedico := IIF(edCT_MEDICO.Text <> '', edCT_MEDICO.text, fraMedPCons.Descripcion);
      sTTexto := ReemplazarVariable(sTTexto, 'MEDICO', sMedico);

      if Obsteleg.Text <> '' then
        sTMP:= ' - ' + Obsteleg.Text
      else
        sTMP:= '';

      DoInsertarTelegrama(Siniestro, Orden, Recaida, nIDCarta, Sesion.UserId, 'PROVINCIA ART S.A.', sTTexto + sTMP, fraFormato.Codigo);  { by NWK, 02/04/03 }

      // Agrega a la lista de Partes Evolutivos adicionales
      sTipoPEvolutivo := ValorSql('SELECT ft_tipopevolutivo FROM art.tft_formatotelegrama WHERE ft_codigo = ' + SqlValue(fraformato.Value));
      if sTipoPEvolutivo <> '' then
      begin
        sTextoPEvolutivo := ValorSql('SELECT ft_textopevolutivo ' +
                                     '  FROM art.tft_formatotelegrama ' +
                                     ' WHERE ft_codigo = ' + SqlValue(fraformato.Value));

        // Nro. de PE
        nNuevoPE := ValorSqlInteger ('SELECT NVL(MAX(pv_nroparte), 0) + 1 ' +
                                     '  FROM spv_parteevolutivo ' +
                                     ' WHERE pv_siniestro = ' + SqlInt(Siniestro) +
                                     '   AND pv_orden = ' + SqlInt(Orden) +
                                     '   AND pv_recaida = ' + SqlInt(Recaida));

        sSqLSPV := 'INSERT INTO spv_parteevolutivo ' +
                      '(pv_siniestro, pv_orden, pv_recaida, pv_nroparte, ' +
                      ' pv_identifprestador, pv_observaciones, pv_fechacontrol,' +
                      ' pv_fecharecepcion, pv_tipoparte, pv_usualta, pv_fechaalta, ' +
                      ' pv_fechacarga, pv_turno, pv_turnohora, pv_medico) VALUES (' +
                      SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' +
                      SqlInt(nNuevoPE) + ', 9753, ' + SqlValue(sTextoPEvolutivo + ' - ' + txtobservac.Text) + ',' +  // TK 19455
                      ' actualdate, actualdate, ' + SqlValue(sTipoPEvolutivo) + ', ' +
                      SqlValue(Sesion.UserID) + ', actualdate, sysdate, ' +
                      SqlString(cmbfechactrl.Text, True, True) + ',' +
                      SqlString(edHora.Text, True, True) + ',' +
                      SqlString(sMedico, True, True) + ') ';

        EjecutarSqlST(sSqLSPV);

        frmParteEvolutivo.SinEditSelect(Sender);

        ShowMessage ('Se ha generado un Parte Evolutivo de tipo ' +
                     ValorSql('SELECT tb_descripcion ' +
                              '  FROM ctb_tablas ' +
                              ' WHERE tb_clave = ''TIPEV'' ' +
                              '   AND tb_codigo = ' + SqlValue(sTipoPEvolutivo)))
      end;

      ssql := ' SELECT ft_generaturnoconsultorio ' +
                ' FROM art.tft_formatotelegrama ' +
               ' WHERE ft_codigo = :form ';

      if (iDelegacionCitacion > 0) and (ValorSqlEx(ssql, [fraFormato.Value]) <> 'N') then   // el "(fraFormato.Value <> 'TE09')"  es por el ticket 34937 de MGuevara
        CitarPaciente(Siniestro, Orden, Recaida, iDelegacionCitacion, CmbFechaCtrl.Date,
                      edHora.Text, fraMedPCons.Codigo, fraSector.Codigo, '', 0, 0,
                      fraPrestador.IDPrestador, nIDCarta, '', txtobservac.Text);    // TK 19455

    end;

    if nIDCarta > 0 then
    begin
      (* Envío de SMS *)
      sCelular := GetCelularesTrabajador(fraEX_ID.CUIL);

      if Trim(sCelular) > '' then
      begin
        //Texto del SMS
        sTextoSMS := ValorSqlEx('SELECT ts_texto FROM art.tft_formatotelegrama, comunes.cts_textosms WHERE ts_idformatotelegrama = ft_id AND ft_codigo = :codigo', [fraformato.Value]);
        if IsEmptyString(sTextoSMS) then
          if not MsgAsk('El formato de telegrama seleccionado no posee un texto asociado para enviar el SMS.' + CRLF + CRLF + '¿Desea continuar?') then
            Abort;

        //Reemplazo de variables para el SMS
        sTextoSMS := ReemplazarVariable(sTextoSMS, 'PACIENTE', fraEX_ID.Nombre);

        sTextoSMS := ReemplazarVariable(sTextoSMS, 'FECHA', cmbfechactrl.Text);
        sTextoSMS := ReemplazarVariable(sTextoSMS, 'HORA', edHora.Text);

        sTextoSMS := ReemplazarVariable(sTextoSMS, 'PRESTA', ValorSql(sSqlPresentarseEn));
        sTextoSMS := ReemplazarVariable(sTextoSMS, 'MOTIVO', Get_DescripcionCTBTablas('MOTRT', framotcitac.Value));

        sMedico := IIF(edCT_MEDICO.Text <> '', edCT_MEDICO.text, fraMedPCons.Descripcion);
        sTextoSMS := ReemplazarVariable(sTextoSMS, 'MEDICO', sMedico);

        if not IsEmptyString(sTextoSMS) then
          EnviarSMS_Telegrama(sCelular, sTextoSMS, tmNone, nIDCarta);
      end;
    end;

    CommitTrans;
    tbRefrescarClick(Self);
    MsgBox('Los datos se guardaron con éxito.', 0, 'Datos Guardados');
    DoLimpiarPnlAlta;
    fraDomicilioEditTeleg.Clear;
    FPnlAlta.ModalResult := mrOK;
  except
    on E: Exception do
    begin
      ErrorMsg(E);
      Rollback;
    end;
  end;
end;

function TfrmConsTlgCartas.IsValido: Boolean;
var
  TipoPrest:String;
begin
  Verificar((cmbtipoenvio.Text = ''), CmbTipoEnvio, 'Debe seleccionar un tipo de envío');
  Verificar(fraFormato.IsEmpty, fraFormato, 'Debe seleccionar un formato de envío');
  Verificar(fraSector.IsEmpty, fraSector, 'Debe seleccionar un sector de citación');
  Verificar(fraPrestador.IsEmpty, fraPrestador, 'Debe seleccionar un prestador');
  Verificar(fraMotCitac.IsEmpty, fraMotCitac, 'Debe seleccionar un motivo de citación');
  if (ValorSql('SELECT ft_medico FROM art.tft_formatotelegrama ' +
               ' WHERE ft_codigo =' + SqlValue(fraformato.Value)) = 'S') then
  begin
    TipoPrest:= ValorSql('SELECT ft_tipoprestador FROM art.tft_formatotelegrama ' +
                         ' WHERE ft_codigo=' + SqlValue(fraformato.Value));
    if (TipoPrest ='S') or
       (ExisteSql('SELECT 1 FROM cpr_prestador ' +
                  ' WHERE ca_identificador = ' + SqlInt(fraPrestador.IDPrestador) +
                    ' AND ca_consultorio = ''S'' ')) then
      Verificar(fraMedPCons.IsEmpty, fraMedPCons, 'Debe completar el campo médico para consulta')
    else
      Verificar((Trim(edCT_MEDICO.Text) = ''), edCT_MEDICO, 'Debe completar el campo médico');
  end;
  Verificar(CmbFechaCtrl.IsEmpty, CmbFechaCtrl, 'Debe seleccionar una fecha de control');
  Verificar((edHora.Text = '  :  ') or not(IsTime(edHora.Text)), edHora, 'Hora de Control inválida');

  Result := True;
end;

procedure TfrmConsTlgCartas.tbModificarClick(Sender: TObject);
begin
  Verificar(True, nil, 'No se pueden modificar las cartas o telegramas desde este módulo.');
{
  FPnlAlta.Tag :=2;
  if sdqConsulta.FieldByName('CE_FECHAIMPRESION').IsNull then begin
//         SDQCTlg.SQL.Text := ' SELECT * FROM SCT_CARTA_TELEGRAMA  WHERE CT_SINIESTRO=' + inttostr(Siniestro) +
//                             ' AND CT_ORDEN=' + inttostr(Orden) + ' AND CT_RECAIDA=' + inttostr(Recaida);
//         sdqConsulta.Open;
         if  Copy(sdqConsulta.FieldByName('CE_TIPO').AsString,0,1) = 'T' then
         begin
             CmbTipoEnvio.ItemIndex := 0;
         end else begin
             CmbTipoEnvio.ItemIndex := 1;
         end;
         FraFormato.Value := sdqConsulta.FieldByName('CE_CODFORMATO').AsString;
         CmbFechaCtrl.Date := sdqConsulta.FieldByName('CE_FCONTROL').AsDateTime;
         CmbHora.time:= strtotime(sdqConsulta.FieldByName('CE_HORA').AsString);
(*         if not sdqConsulta.FieldByName('CE_FECHA').IsNull then begin
                  CmbFechaCtrl.Text := copy(sdqConsulta.FieldByName('CE_FECHA').AsString,0,10);
                  if copy(sdqConsulta.FieldByName('CE_FECHA').AsString,(length(sdqConsulta.FieldByName('CE_FECHA').AsString)),1) = ':' then begin
                     CmbHora.time:= strtotime(copy(sdqConsulta.FieldByName('CE_FECHA').AsString,14,4));
                  end else begin
                     CmbHora.time:= strtotime(copy(sdqConsulta.FieldByName('CE_FECHA').AsString,14,5));
                  end;
         end;*)
         if not sdqConsulta.FieldByName('CE_CODPRES').IsNull then begin
                  fraPrestador.Value := sdqConsulta.FieldByName('CE_CODPRES').AsInteger;
         end;
         fraMotCitac.Value := sdqConsulta.FieldByName('CE_CODMOTIVO').AsString;
         TxtObservac.Text := sdqConsulta.FieldByName('CE_OBSERVACIONES').AsString;
         fraMedPCons.edCodigo.text:= sdqConsulta.FieldByName('CE_CODMOTIVO').AsString;
try
         Obsteleg.Text := sdqConsulta.FieldByName('CE_OBSERVA_TLG').AsString;
except
// agregué este try except porque patlante dijo que no quería agregar el campo a la vista, ok?
end;
         FPnlAlta.ShowModal;
  end else begin
         MsgBox('No se puede modificar el registro seleccionado porque ya ha sido impreso',0,'Imposible Modificar');
  end;
}  
end;

procedure TfrmConsTlgCartas.CmbTipoEnvioChange(Sender: TObject);
begin
  inherited;
  {if copy(CmbTipoEnvio.Text,0,1)='T' then begin
     fraformato.Sql := 'SELECT ft_codigo as ID, ft_codigo as CODIGO, ft_descripcion as DESCRIPCION, NULL as BAJA ' +
                        ' FROM art.tft_formatotelegrama ' +
                       ' WHERE ft_anulacion = ''N'' ';  }
  {end else begin
     fraformato.Sql := 'SELECT tt_formato as ID,tt_formato as CODIGO,tt_descripcion as DESCRIPCION, NULL as BAJA ' +
                        ' FROM ctt_textoscartasdoctrab ' +
                       ' WHERE substr(tt_formato,1,2)=''CD''';}
  //end ;
  fraformato.edCodigo.Text := '';
  fraformato.cmbDescripcion.Clear ;
end;

procedure TfrmConsTlgCartas.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(sdqConsulta.FieldByName('CE_ID').IsNull, nil, 'No se pueden dar de baja cartas/telegramas que no tengan identificación única.');

  if (sdqConsulta.FieldByName('CE_TIPO').AsString='T') and
     not(sdqConsulta.FieldByName('CE_FECHAIMPRESION').IsNull) then
  begin
    inherited;
    {fraFormatoB.sdqDatos.Sql.text := 'SELECT ft_codigo AS ID, ft_codigo AS CODIGO, ' +
                                           ' ft_descripcion AS DESCRIPCION, NULL AS BAJA ' +
                                      ' FROM art.tft_formatotelegrama ' +
                                     ' WHERE ft_anulacion = ''S'' ';}
    FPBajaTlg.ShowModal;
  end
  //si no se ha generado el telegrama, se puede dar de baja directamente
  else if ((sdqConsulta.FieldByName('CE_TIPO').AsString='TE') or
           (sdqConsulta.FieldByName('CE_TIPO').AsString='T')) and
          (sdqConsulta.FieldByName('CE_FECHAIMPRESION').IsNull) and
          (MessageDlg('¿Confirma la eliminación del telegrama seleccionado?', mtConfirmation, [mbYes, mbNo], 0) =  idYes)
  then begin
    sSql := 'UPDATE tlg_telegramas ' +
              ' SET lg_fechabaja = actualdate, ' +
                  ' lg_usubaja = ' + SqlValue(Sesion.LoginName);
    if (sdqConsulta.FieldByName('CE_TIPO').AsString='TE') then
      sSql := sSql + ' WHERE lg_idtelegrama = ' + SqlInt(sdqConsulta.FieldByName('CE_ID').AsInteger)
    else
      sSql := sSql + ' WHERE lg_idcarta_telegrama = ' + SqlInt(sdqConsulta.FieldByName('CE_ID').AsInteger);

    EjecutarSql(sSql);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmConsTlgCartas.btnAceptarClick(Sender: TObject);
var
  NextID, iDelegacion :Integer;
  StrPrest, hctrl, fecctrl, sSQL, sTTexto, sSector: String;
begin
  if fechab.IsEmpty then
    FecCtrl := 'Null'
  else
    FecCtrl := fechab.SqlText;

  //hCtrl  := '''' + TimeToString(HoraB.time, True, thMinutos) + '''';
  hCtrl  := QuotedStr(HoraB.Text);
  NextID := GetSecNextVal('SEQ_SCT_ID');

 // Verificar(fraformatob.IsEmpty, fraFormatob, 'Debe ingresar un Formato');

  if not fraformatob.IsEmpty then
  begin
    try
      BeginTrans;
      sSQL := ' INSERT INTO sct_carta_telegrama ' +
              '(ct_siniestro, ct_orden, ct_recaida, ct_tipo, ct_formato, ' +
              ' ct_fechacontrol, ct_hora, ct_prestador, ct_usualta, ct_fechaalta, ct_id) ' +
              ' SELECT ct_siniestro, ct_orden, ct_recaida, ''T'', :Formato, ' +
                       FecCtrl + ',' +  hCtrl + ',' +
                       ValorSqlEx('SELECT ct_prestador ' +
                                    'FROM sct_carta_telegrama ' +
                                   'WHERE ct_id = :V1', [sdqConsulta.FieldByName('CE_ID').AsString]) +
                      ', :Usuario , ActualDate, :NextID ' +
                ' FROM sct_carta_telegrama WHERE ct_id = :ID';
      EjecutarSqlSTEx(sSQL, [fraFormatoB.Value, Sesion.UserID, NextID, sdqConsulta.FieldByName('CE_ID').AsString]);

      //Insertar un registro en la tabla de la interfaz de telegramas:

      sTTexto:= ValorSql('SELECT ft_texto FROM art.tft_formatotelegrama WHERE ft_codigo = ' + SqlValue(fraFormatoB.Value));
      sTTexto:= stringreplace(sTTexto,'@FECHA', FechaB.Text,[rfReplaceAll, rfIgnoreCase]);
      sTTexto:= stringreplace(sTTexto,'@HORA', HoraB.Text, [rfReplaceAll, rfIgnoreCase]);
      sTTexto:= stringreplace(sTTexto,'@ANTERIORFECHA', sdqconsulta.FieldByName('Fec').AsString  ,[rfReplaceAll, rfIgnoreCase]);

      DoInsertarTelegrama(sdqconsulta.FieldByName('CE_SINIESTRO').AsInteger, sdqconsulta.FieldByName('CE_ORDEN').AsInteger,
                          sdqconsulta.FieldByName('CE_RECAIDA').AsInteger, NextID, Sesion.UserID, 'PROVINCIA ART S.A.',
                          STTexto, fraFormatoB.Codigo);

      //AhoRa me fijo si hay una citación a consultorio y si existe la borro
      if (sdqconsulta.FieldByName('CE_PRESTADOR').AsString = '') or
         (sdqconsulta.FieldByName('CE_PRESTADOR').IsNull)
      then
        StrPrest:= 'NULL'
      else
        StrPrest:= sdqconsulta.FieldByName('CE_CODPRES').AsString;

      if (ValorSql('SELECT ft_tipoprestador ' +
                    ' FROM art.tft_formatotelegrama ' +
                   ' WHERE ft_codigo = ' + SqlValue(sdqConsulta.FieldByName('CE_CODFORMATO').AsString)) = 'S') or
          ExisteSql('SELECT 1 ' +
                     ' FROM cpr_prestador ' +
                    ' WHERE ca_identificador = ' + StrPrest +
                      ' AND ca_consultorio = ''S'' ') then
      begin
        sSQL := 'UPDATE art.mcc_citacionconsultorio ' +
                  ' SET cc_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                      ' cc_fechabaja = ACTUALDATE ' +
                ' WHERE cc_id_cartatelegrama = ' + SqlInt(sdqConsulta.FieldByName('CE_ID').AsInteger);
        EjecutarSQLST(sSQL);
        if not(fechab.IsEmpty) and
           ExisteSqlEx('SELECT 1 ' +
                        ' FROM mcc_citacionconsultorio ' +
                       ' WHERE cc_id_cartatelegrama = :ID', [sdqConsulta.FieldByName('CE_ID').AsInteger]) then
        begin
          iDelegacion := ValorSqlIntegerEx('SELECT ca_delegacion ' +
                                            ' FROM cpr_prestador ' +
                                           ' WHERE ca_identificador = :V1',
                                           [sdqConsulta.FieldByName('CE_CODPRES').AsInteger]);
          sSector     := ValorSqlEx('SELECT cc_sector ' +
                                     ' FROM mcc_citacionconsultorio ' +
                                    ' WHERE cc_id_cartatelegrama = :ID', [sdqConsulta.FieldByName('CE_ID').AsInteger]);

          sSQL:=' SELECT ct_siniestro, ct_orden, ct_recaida, ct_medico_interno ' +
                  ' FROM art.sct_carta_telegrama ' +
                 ' WHERE ct_id = :id ';
          with GetQueryEx(sSQL, [sdqConsulta.FieldByName('CE_ID').AsInteger]) do
          try
            ActualizarTurno(FieldByName('ct_siniestro').AsInteger, FieldByName('ct_orden').AsInteger,
                            FieldByName('ct_recaida').AsInteger, iDelegacion, FechaB.Date,
                            HoraB.Text, FieldByName('ct_medico_interno').AsString,
                            sSector, '', sdqConsulta.FieldByName('CC_ID').AsInteger, 0, sdqConsulta.FieldByName('CE_CODPRES').AsInteger, NextID);   // agregue el sdqConsulta.FieldByName('CE_ID').AsInteger al parametro iIdTurno (estaba en 0, por eso el error del TK 16520).
           finally
            Free;
          end;
        end;
      end;

      MsgBox('El registro se ha borrado con éxito.',0,'Datos Guardados');
      FraFormatoB.edCodigo.Clear;
      FraFormatoB.cmbDescripcion.clear;
      FechaB.Clear;
      FPBajaTlg.ModalResult:=mrOK;
      CommitTrans;
    except
      on E: Exception do
      begin
         ErrorMsg(E);
         Rollback;
      end;
    end;
    tbRefrescarClick(nil);
  end else
    MsgBox ('Debe ingresar un Formato');       
end;

procedure TfrmConsTlgCartas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  HabilitarBotones;                   
end;

procedure TfrmConsTlgCartas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsTlgCartas.ImprimirListado1Click(Sender: TObject);
begin
  queryprint.Print;
end;

procedure TfrmConsTlgCartas.ImprimirTextodelTelegrama1Click(Sender: TObject);
begin
  if not sdqconsulta.FieldByName('CE_ID').IsNull then
  begin
    SDQRptData.ParamByName ('pSin').Value   := sdqconsulta.FieldByName('CE_SINIESTRO').AsString ;
    SDQRptData.ParamByName ('pOrd').Value   := sdqconsulta.FieldByName('CE_ORDEN').AsString ;
    SDQRptData.ParamByName ('pReca').Value  := sdqconsulta.FieldByName('CE_RECAIDA').AsString ;
    SDQRptData.Open;

    sdqprinttlg.ParamByName('TlgID').Value := sdqconsulta.FieldByName('CE_ID').AsInteger;
    sdqprinttlg.ParamByName('pSin').Value  := sdqconsulta.FieldByName('CE_SINIESTRO').AsInteger;
    sdqprinttlg.ParamByName('pOrd').Value  := sdqconsulta.FieldByName('CE_ORDEN').AsInteger;
    sdqprinttlg.ParamByName('pReca').Value := sdqconsulta.FieldByName('CE_RECAIDA').AsInteger;
    sdqprinttlg.Open;

    RptTlg.Refresh;
    RptTlg.Preview;
    sdqprinttlg.Close;
  end else
    MsgBox ('No se puede imprimir el texto del telegrama dado que este no posee un identificador que lo individualice.');
end;


{ Inserta un registro en la tabla de telegramas }
procedure TfrmConsTlgCartas.DoInsertarTelegrama(iSiniestro, iOrden, iRecaida, IdCartaTelegrama: Integer; sFirmante, sFirmante2, sTexto, sFormato: String);
var
  sCalleTrabajador, sNumeroTrabajador, sPisoTrabajador, sDepartamentoTrabajador, sMail: String;
  sLocTrabajador, sCPostalTrabajador, sProvTrabajador, sSql: String;
begin
  SSQL := 'SELECT tj_nombre, tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad, ' +
                ' tj_cpostal, tj_provincia, mp_calle, mp_numero, mp_piso, mp_departamento, ' +
                ' mp_localidad, mp_cpostal, mp_provincia ' +
           ' FROM ctj_trabajadores, cmp_empresas, sex_expedientes ' +
          ' WHERE ex_siniestro = ' + SqlValue(iSiniestro) + ' ' +
            ' AND ex_orden = ' + SqlValue(iOrden) + ' ' +
            ' AND ex_recaida = ' + SqlValue(iRecaida) + ' ' +
            ' AND ex_cuit = mp_cuit ' +
            ' AND ex_cuil = tj_cuil ';
  sdqTrabajador.SQL.Text := sSql;
  sdqTrabajador.Open;

  if Is_EmpresaConfidencial(Siniestro, Orden, Recaida) then  // si el trabajador pertenece a una empresa condifencial, entonces solo se manda el telegrama a la dirección de la empresa, by NWK, 02/04/03
  begin
    sCalleTrabajador        := sdqTrabajador.FieldByName('MP_CALLE').AsString;
    sNumeroTrabajador       := sdqTrabajador.FieldByName('MP_NUMERO').AsString;
    sPisoTrabajador         := sdqTrabajador.FieldByName('MP_PISO').AsString;
    sDepartamentoTrabajador := sdqTrabajador.FieldByName('MP_DEPARTAMENTO').AsString;
    sLocTrabajador          := sdqTrabajador.FieldByName('MP_LOCALIDAD').AsString;
    sCPostalTrabajador      := sdqTrabajador.FieldByName('MP_CPOSTAL').AsString;
    sProvTrabajador         := sdqTrabajador.FieldByName('MP_PROVINCIA').AsString;
  end
  else begin
    sCalleTrabajador        := sdqTrabajador.FieldByName('TJ_CALLE').AsString;
    sNumeroTrabajador       := sdqTrabajador.FieldByName('TJ_NUMERO').AsString;
    sPisoTrabajador         := sdqTrabajador.FieldByName('TJ_PISO').AsString;
    sDepartamentoTrabajador := sdqTrabajador.FieldByName('TJ_DEPARTAMENTO').AsString;
    sLocTrabajador          := sdqTrabajador.FieldByName('TJ_LOCALIDAD').AsString;
    sCPostalTrabajador      := sdqTrabajador.FieldByName('TJ_CPOSTAL').AsString;
    sProvTrabajador         := sdqTrabajador.FieldByName('TJ_PROVINCIA').AsString;
  end;

  sSQL:= 'INSERT INTO tlg_telegramas ' +
         ' (lg_siniestro, lg_orden, lg_recaida, lg_destinatario, lg_calle, lg_numero, ' +
          ' lg_piso, lg_departamento, lg_localidad, lg_cpostal, lg_provincia, lg_firmante, ' +
          ' lg_firmante2, lg_fechaalta, lg_texto, lg_idcarta_telegrama, lg_formato) VALUES (' +
            SqlValue(iSiniestro) + ', ' +
            SqlValue(iOrden) + ', ' +
            SqlValue(iRecaida) + ', ' +
            SqlValue(sdqTrabajador.FieldByName('TJ_NOMBRE').AsString) + ', ' +
            SqlValue(sCalleTrabajador) + ', ' +
            SqlValue(sNumeroTrabajador) + ', ' +
            SqlValue(sPisoTrabajador) + ', ' +
            SqlValue(sDepartamentoTrabajador) + ', ' +
            SqlValue(sLocTrabajador) + ', ' +
            SqlValue(sCpostalTrabajador) + ', ' +
            SqlValue(sProvTrabajador) + ', ' +
            SqlValue(sFirmante) + ', ' +
            SqlValue(sFirmante2) + ', ' +
            'ACTUALDATE , ' +
            SqlValue(sTexto) + ', ' +
            SqlValue(IdCartaTelegrama) + ', ' +
            SqlValue(sFormato) + ')';
  EjecutarSqlST(sSql);

  sMail := ValorSqlEx(' select ca_direlectronica from cpr_prestador ' +
                      ' where ca_identificador = art.siniestro.get_prestadorcabecera(:sin, :ord, :rec)', [iSiniestro, iOrden, iRecaida]);

  if (fraFormato.Codigo = 'TE04') and (MidStr(fraSector.Especial1, 1, 1) = 'S') and
     ((fraPrestador.IDPrestador = 9753) or (fraPrestador.IDPrestador = 10177)) then
    EnviarMailBD(sMail, 'Citación a consultorio', [oAutoFirma], 'El paciente ' +
                 sdqTrabajador.FieldByName('TJ_NOMBRE').AsString + ' se encuentra citado a Provincia ART el día ' +
                 CmbFechaCtrl.Text + ' a las ' +  edHora.Text + ' con el Dr. ' + fraMedPCons.Descripcion +
                 ' para auditoría médica ', nil, 0, tcDefault, false);

  sdqTrabajador.Close;
end;

procedure TfrmConsTlgCartas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                              Highlight: Boolean);
begin
  inherited;
  
  if not sdqconsulta.FieldByName('CE_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmConsTlgCartas.HabilitarBotones;
var
  bHabilitar :Boolean;
begin
  bHabilitar := ((not sdqconsulta.Eof) and
                 (sdqconsulta.FieldByName('CE_FECHABAJA').IsNull) and
                 (
                  (sdqconsulta.FieldByName('CE_TIPO').AsString='T')
                   or
                  ((sdqconsulta.FieldByName('CE_TIPO').AsString='TE') and
                   (sdqConsulta.FieldByName('CE_FECHAIMPRESION').IsNull))
                 )
                );
  tbEliminar.Enabled := bHabilitar;
end;

procedure TfrmConsTlgCartas.DoHabilitarFechaHora(bHabilitar :boolean);
begin
  edHora.Clear;
  VCLExtra.LockControls([edHora], bHabilitar);
  btnGetTurno.Visible := bHabilitar;
end;

procedure TfrmConsTlgCartas.btnGetTurnoClick(Sender: TObject);
var
  sTurno: string;
begin
  if Verificar(fraMedPCons.IsEmpty, fraMedPCons, 'Debe ingresar el médico') and
    Verificar(CmbFechaCtrl.IsEmpty, CmbFechaCtrl, 'Debe ingresar la Fecha de Control') then
  begin
    sTurno := DoObtenerTurno(CmbFechaCtrl.Date, fraMedPCons.Codigo);
    if (Length(sTurno) = 5) then //dio un horario como resultado
      edHora.Text := sTurno
    else
      MsgBox(sTurno);
  end;
end;

function TfrmConsTlgCartas.DoObtenerTurno(dFecha :TDate; sMedico :String): string;
var
  sSql: String;
begin
  sSql := 'SELECT art.amebpba.get_proximoturno(' + SqlValue(sMedico) + ',' + SqlDate(dFecha) + ') FROM dual';
  DoObtenerTurno := ValorSql(sSql);
  
  {if (Length(sTurno) = 5) then //dio un horario como resultado
    edHora.Text := sTurno
  else
    MsgBox(sTurno);}
end;

procedure TfrmConsTlgCartas.CmbFechaCtrlChange(Sender: TObject);
begin
  if (iDelegacionCitacion > 0) then
    edHora.Clear;
end;

procedure TfrmConsTlgCartas.DoLimpiarPnlAlta;
begin
  cmbTipoEnvio.ItemIndex := 0; //Solo telegramas por ahora
  fraFormato.Clear;
  fraSector.Limpiar;
  fraPrestador.Limpiar;
  fraMotCitac.Limpiar;
  edCT_MEDICO.Clear;
  CmbFechaCtrl.Clear;
  edHora.Clear;
  TxtObservac.Clear;
  ObsTeleg.Clear;
end;

procedure TfrmConsTlgCartas.btnAceptarDomicClick(Sender: TObject);   // TK 9011
begin
  if ValidarDomicilioTeleg then
    fpEditarDomicilioTeleg.ModalResult := mrOK;
end;

procedure TfrmConsTlgCartas.btnCancelDomicClick(Sender: TObject);   // TK 9011
begin
  inherited;
  fpEditarDomicilioTeleg.ModalResult := mrCancel;
end;

function TfrmConsTlgCartas.ValidarDomicilioTeleg: Boolean;   // TK 9011
begin
  Verificar(fraDomicilioEditTeleg.IsEmpty, fraDomicilioEditTeleg, 'Debe ingresar el domicilio');
  Result := True;
end;

procedure TfrmConsTlgCartas.tbEditarDomicilioClick(Sender: TObject);    // TK 9011
begin
  if fpEditarDomicilioTeleg.Showmodal = mrOk then
  begin
    bEditadoDomicOdonto := True;
    showmessage('Se ha modificado el domicilio del telegrama exitosamente');
  end
  else begin
    bEditadoDomicOdonto := False;
    fraDomicilioEditTeleg.Clear;
    showmessage('No se ha modificado el domicilio del telegrama.' + #10 +
                'El mismo saldrá, con el domicilio del Prestador ' + fraPrestador.RazonSocial);
  end;
end;


procedure TfrmConsTlgCartas.OnFormatoChange(Sender: TObject);
var
  TipoPrest:String;
begin
  inherited;
  TipoPrest:= ValorSqlEx('SELECT ft_tipoprestador FROM art.tft_formatotelegrama WHERE ft_codigo = :cod', [fraformato.Value]);
  fraFormato.FrameExit(Sender);

  edCT_MEDICO.Text := '';
  fraMedPCons.Clear;

  if TipoPrest <> 'G'  then
  begin
    fraPrestador.sql := 'SELECT ca_clave, ca_secuencia, ca_identificador,ca_descripcion, ca_domicilio, ' +
                              ' ca_localidad,ca_codpostal, pv_descripcion provincia, ca_codarea || '' '' || ca_telefono ca_telefono, ca_fechabaja,' +
                              ' ca_asistencial,ca_concertado, ca_iva, ca_tipocomprobante, ca_direlectronica, ' +
                              ' ca_nombrefanta, ca_fechaconexia, ca_habilitaciones, ca_esreferente ' +
                         ' FROM cpr_prestador,cpv_provincias, mes_especialidades,cpe_prestaespeci ' +
                        ' WHERE pe_prestador=ca_identificador ' +
                          ' AND pe_fechabaja IS NULL ' +
                          ' AND pe_especialidad=es_codigo ' +
                          ' AND es_continua=''S'' ' +
                          ' AND ca_provincia = pv_codigo (+) ';
  end else begin
    fraPrestador.Sql :='SELECT ca_clave, ca_secuencia, ca_identificador,ca_descripcion, ca_domicilio, ' +
                             ' ca_localidad,ca_codpostal, pv_descripcion provincia, ca_codarea || '' '' || ca_telefono ca_telefono, ca_fechabaja, ' +
                             ' ca_asistencial,ca_concertado, ca_iva, ca_tipocomprobante, ca_direlectronica, ' +
                             ' ca_nombrefanta, ca_fechaconexia, ca_habilitaciones, ca_esreferente ' +
                        ' FROM cpr_prestador, cpv_provincias ' +
                       ' WHERE ca_provincia = pv_codigo (+)';
  end;

  OnPrestadorChange(nil);
  TimerSMS.Enabled := True;  
end;


procedure TfrmConsTlgCartas.OnMedPConsChange(Sender: TObject);
var
  sSql :String;
  bTieneTurnos :Boolean;
begin
  bTieneTurnos := False;
  iDelegacionCitacion := ValorSqlIntegerEx('SELECT nvl(ca_delegacion,0) ' +
                                          ' FROM cpr_prestador' +
                                         ' WHERE ca_identificador = :idprest', [fraPrestador.IDPrestador]);
  if not(fraMedPCons.IsEmpty) then
  begin
    sSql := 'SELECT 1' +
             ' FROM stm_turnosmedicos' +
            ' WHERE tm_auditor = ' + SqlInt(StrToInt(fraMedPCons.Codigo)) +
              ' AND tm_fechabaja IS NULL';
    if ExisteSql(sSql) then
      bTieneTurnos := True;
  end;
  DoHabilitarFechaHora(((iDelegacionCitacion > 0) and bTieneTurnos));
end;

procedure TfrmConsTlgCartas.OnfraFormatoBChange(Sender: TObject);
var
  sSQL: String;
  bGeneraTurno: Boolean;
begin
  sSQL := ' SELECT ft_generaturnoconsultorio ' +
            ' FROM art.tft_formatotelegrama ' +
           ' WHERE ft_codigo = :formato ';

  bGeneraTurno := ValorsqlEx(sSQL, [fraFormatoB.codigo]) = 'S';
  VCLExtra.LockControls([FechaB, HoraB], not bGeneraTurno);

  if bGeneraTurno and (ValorSqlIntegerEx('SELECT nvl(ca_delegacion,0) ' +
                                          ' FROM cpr_prestador' +
                                         ' WHERE ca_identificador = :idprest', [sdqConsulta.FieldByName('cc_idprestador').AsInteger]) > 0)
                  and (ExisteSqlEx('SELECT 1 ' +
                                     'FROM stm_turnosmedicos' +
                                   ' WHERE tm_auditor = :med ' +
                                     ' AND tm_fechabaja IS NULL', [sdqConsulta.FieldByName('cc_medico').AsInteger])) then
    btnGetTurnoRec.Visible := true
  else
    btnGetTurnoRec.Visible := false;
    
end;

procedure TfrmConsTlgCartas.OnPrestadorChange(Sender: TObject);
var bTieneAuditor: boolean;
begin
  iDelegacionCitacion := 0;

  if (ValorSql('SELECT ft_medico FROM art.tft_formatotelegrama ' +
              ' WHERE ft_codigo = ' + SqlValue(fraFormato.Value)) = 'S') and
     (fraPrestador.IDPrestador > 0)
  then begin
    if (ValorSql('SELECT ft_tipoprestador FROM art.tft_formatotelegrama ' +
                 ' WHERE ft_codigo = ' + SqlValue(fraFormato.Value)) = 'S') or
       (ExisteSql('SELECT 1 FROM cpr_prestador ' +
                  ' WHERE ca_identificador = ' + SqlInt(fraPrestador.IDPrestador) +
                    ' AND ca_consultorio = ''S'' '))
    then begin
      VCLExtra.LockControls([fraMedPCons], False);
      VCLExtra.LockControls([edCT_MEDICO], True);
      edCT_MEDICO.Clear;
    end
    else begin
      VCLExtra.LockControls([edCT_MEDICO], False);
      VCLExtra.LockControls([fraMedPCons], True);
      fraMedPCons.Clear;
    end;
  end;

  DoHabilitar_EditarDomicilio;
  iDelegacionCitacion := ValorSqlIntegerEx('SELECT nvl(ca_delegacion,0) ' +    // lo agrego por ticket 32414
                                            ' FROM cpr_prestador ' +
                                           ' WHERE ca_identificador = :idprest', [fraPrestador.IDPrestador]);

  if EsUsuarioDeTercerizadora then
    fraMedPCons.ExtraCondition := ' and au_tercerizadora = ''S'' '
  else
    fraMedPCons.ExtraCondition := '';

  if fraPrestador.IDPrestador <> 0 then
  begin
    bTieneAuditor := ExisteSqlEx(' select 1 from SIN.sap_auditoresporprestador where ap_prestador = :prest ' +
                              ' and ap_fechabaja is null ', [fraPrestador.IDPrestador]);

    if bTieneAuditor then
      fraMedPCons.ExtraCondition := fraMedPCons.ExtraCondition + ' and au_auditor in (select ap_auditor from SIN.sap_auditoresporprestador ' +
                                                                 ' where ap_prestador = ' + sqlvalue(fraPrestador.IDPrestador) + ' and ap_fechabaja is null) ';
  end;
end;

procedure TfrmConsTlgCartas.DoHabilitar_EditarDomicilio;
var
  sSql: String;
begin
  sSql := 'SELECT NVL(ca_prestderiv, ''N'') ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = :ident ';
                                                                                                // TK 34260
  tbEditarDomicilio.Enabled := ((ValorSqlEx(sSql, [fraPrestador.IDPrestador]) = 'S') or ((fraFormato.Value = 'TE04') and Is_SiniestroGobernacion(Siniestro) )) and
                                Seguridad.Claves.IsActive('PuedeEditarDomic');   // TK 9011
end;

procedure TfrmConsTlgCartas.btnGetTurnoRecClick(Sender: TObject);
var
  sTurno: String;
begin
  if Verificar(FechaB.IsEmpty, FechaB, 'Debe ingresar la Fecha de Control') then
    sTurno := DoObtenerTurno(FechaB.Date, sdqconsulta.fieldbyname('cc_medico').AsString);

  if (Length(sTurno) = 5) then //dio un horario como resultado
    HoraB.Text := sTurno
  else
    MsgBox(sTurno);
end;

procedure TfrmConsTlgCartas.FPBajaTlgShow(Sender: TObject);
begin
  HoraB.Clear;
  FechaB.Clear;
  fraFormatoB.Clear;
  btnGetTurnoRec.Visible := false;
end;

procedure TfrmConsTlgCartas.tbManTrabClick(Sender: TObject);
begin
  with TfrmContratoTrabajador.Create(Self) do
  try
    CargarDatosTrabajador(fraEX_ID.IdTrabajador, fraEX_ID.IdRelacionLaboral);
    ShowModal;
  finally
    Free;
  end;
  TimerSMS.Enabled := True;  
end;

procedure TfrmConsTlgCartas.SetIdExpediente(const Value: Integer);
begin
  FIdExpediente := Value;
  fraEX_ID.IdSiniestro := Value;
end;

procedure TfrmConsTlgCartas.FPnlAltaShow(Sender: TObject);
begin
  VCLExtra.LockControls([edCT_MEDICO, fraMedPCons], True);
  TimerSMS.Enabled := True;
end;

procedure TfrmConsTlgCartas.TimerSMSTimer(Sender: TObject);
var
  sCelulares, sCelularesValidos: String;
begin
  TimerSMS.Enabled := False;
  inherited;
  if FPnlAlta.Showing and fraFormato.IsSelected and (fraFormato.sdqDatos.FieldByName('SMS').AsString = 'S') then
  begin
    sCelulares := GetCelularesTrabajador(fraEX_ID.CUIL);
    sCelularesValidos := GetCelularesValidosTrabajador(fraEX_ID.CUIL);
    if not IsEmptyString(sCelulares) then
    begin
      if sCelularesValidos = sCelulares then
        InfoHint(tbManTrab, 'Se enviará un SMS al celular del trabajador.');
      if (sCelularesValidos <> sCelulares) then
        InvalidHint(tbManTrab, 'Se podría enviar un SMS al celular del trabajador pero alguno de sus teléfonos registrados no tiene un formato válido, por favor revíselos.', 'Advertencia', blnWarning);
    end else
      InvalidHint(tbManTrab, 'El trabajador no registra ningún teléfono celular, no podremos enviarle un SMS.', 'Advertencia', blnError);
  end;
end;

procedure TfrmConsTlgCartas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

procedure TfrmConsTlgCartas.fraPrestadorExit(Sender: TObject);
begin
  inherited;
  fraPrestador.FrameExit(Sender);
  if fraPrestador.IsEmpty then
    OnPrestadorChange(nil);

end;

end.
