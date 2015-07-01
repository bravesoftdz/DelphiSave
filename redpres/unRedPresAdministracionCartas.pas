unit unRedPresAdministracionCartas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unBaseAdministracionCartas, SDEngine, Menus,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, ComCtrls,
  StdCtrls, unFraDomicilioTrab, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, CardinalEdit,
  ToolWin, ToolEdit, DateComboBox, unFraUsuario, ComboEditor, CheckCombo, unFraStaticCTB_TABLAS, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, Mask, PatternEdit, IntEdit, unArtDbFrame, unFraEmpresa, unArt,
  unFraCodigoDescripcion, unImpoExpoWizard, SinEdit, unFraGrupoTrabajo, unRptCartaDocHeader, DBCheckCombo,
  unfraCtbTablas, unComunes, DBCtrls, unfraPrestador, unfraFirmante, CheckPanel,
  unFraSDA_DETALLEARCHIVO, unConstantArchivo, RxPlacemnt, RxToolEdit;

type
  TfrmRedPresAdministracionCartas = class(TfrmBaseAdministracionCartas)
    fraEmpresaDeudora: TfraEmpresa;
    fraEmpresaDatosCartaDoc: TfraEmpresa;
    fraEmpresaDatosActuales: TfraEmpresa;
    gbSiniestro: TGroupBox;
    Label10: TLabel;
    SinDesde: TSinEdit;
    SinHasta: TSinEdit;
    GroupBox1: TGroupBox;
    edSiniestro: TSinEdit;
    gbGrupoTrab: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    pnlFirmante: TPanel;
    rbFirmanteOrig: TRadioButton;
    rbFirmanteActual: TRadioButton;
    gbSinGobernacion: TGroupBox;
    rbGobSi: TRadioButton;
    rbGobNo: TRadioButton;
    rbGobTodos: TRadioButton;
    gbTipoAccidente: TGroupBox;
    sdqTipoAccidente: TSDQuery;
    dsTipoAccidente: TDataSource;
    cmbTipoAccidente: TDBCheckCombo;
    GroupBox3: TGroupBox;
    fraPrestador: TfraPrestador;
    gbConDomicilio: TGroupBox;
    rbDomSI: TRadioButton;
    rbDomNO: TRadioButton;
    rbDomTODOS: TRadioButton;
    tbCartasErr: TToolButton;
    fpCartasNoImpresasErr: TFormPanel;
    ToolBar1: TToolBar;
    tbRefrescarErr: TToolButton;
    tbLimpiarErr: TToolButton;
    tbOrdernarErr: TToolButton;
    tbSalirErr: TToolButton;
    ToolButton17: TToolButton;
    dsCartasErr: TDataSource;
    sdqCartasErr: TSDQuery;
    dbgCartasErr: TArtDBGrid;
    tbReimprimirCartaErr: TToolButton;
    ToolButton13: TToolButton;
    SortDialogErr: TSortDialog;
    Panel3: TPanel;
    gbFechaImpresionErr: TGroupBox;
    Label15: TLabel;
    edFImprDesde: TDateComboBox;
    edFImprHasta: TDateComboBox;
    ShortCutControlHijo2: TShortCutControl;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRecepcionMasivaClick(Sender: TObject);
    procedure SinDesdeExit(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure tbRecepcionDocumClick(Sender: TObject);
    procedure edNroCartaDocDesdeExit(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbModuloChange(Sender: TObject); override;
    procedure tbSalirErrClick(Sender: TObject);
    procedure tbCartasErrClick(Sender: TObject);
    procedure tbRefrescarErrClick(Sender: TObject);
    procedure tbLimpiarErrClick(Sender: TObject);
    procedure tbOrdernarErrClick(Sender: TObject);
    procedure tbReimprimirCartaErrClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure edSiniestroSelect(Sender: TObject);
  private
    FPermitirSinRechazadoGenCartasAdmin: Boolean;

    function OuterJoin: String;
    function UnaFilaSeleccionada: Boolean;
    function GetTipoSalida: TSalidaReport;

    procedure ValidarDirAval(IdDestinatario: Integer; sDestinatario: TTipoDestinatario;
                             bNuevaCarta, bVentanilla: Boolean; var bFaltaDir, bFaltaAval: Boolean);
    procedure DoActualizarTurno(iCartaEmp, iCartaTrab: Integer);
    procedure DoLimpiarTemporal;
    procedure ImprimirDireccionesFaltantes;
    procedure Do_BlanquearDatosErr(ica_id: integer);
    procedure Do_ImprimirCartaErr(ica_id: integer);
    procedure ValidarImprimirCartasSiniestroVencido(IdCCA, IdExpediente:integer; VAR bEsSiniVencido: boolean); // TK 54662
    function EsSiniestroVencido(IdExpediente:integer): boolean;  // TK 54662
    procedure DoInsertarCartaenTemporal(sLetra:string);  // TK 54662
  protected
    function GetSql: String; override;
    function GetWhere: String; override;

    procedure DoCargarDatosCartaDoc(IdEndoso: TTableId); override;
    procedure DoCargarDatosActuales(IdEndoso: TTableId); override;
    //procedure fraModuloOnChange(Sender: TObject); override;
    procedure fraAreaOnChange(Sender: TObject); override;
    procedure InicializarComponentes; override;
    procedure NuevaCarta(Sender: TObject); override;

    procedure ValidacionesAdicRegistrosImpresionCartaDoc; override;
    procedure ValidacionesAdicRegistrosEnvioVentElectronica; override;
  public
    procedure MostrarCarta(IdCarta: Integer); override;

    property PermitirSinRechazadoGenCartasAdmin: Boolean read FPermitirSinRechazadoGenCartasAdmin write FPermitirSinRechazadoGenCartasAdmin default False;
  end;

implementation

uses
  AnsiSql, unCustomDataModule, unRptCartaDocumento, unCobranzas, unDmPrincipal, CustomDlgs, Printers,
  General, unSesion, unRptDomiciliosIncompletos, unRptCartaDocSinDDJJ, unGeneracionCartasAdmin, unCustomConsulta,
  CUIT, unPrincipal, unSiniestros, unTercerizadoras;

{$R *.DFM}

procedure TfrmRedPresAdministracionCartas.DoCargarDatosActuales(IdEndoso: TTableId);
var
  sSql: String;
begin
  inherited;
  // datos de la empresa
  sSql := 'SELECT hm_nombre rsocial, hm_cuit cuit, hc_contrato contrato' +
           ' FROM ahm_historicoempresa, ahc_historicocontrato, aen_endoso, afo_formulario' +
          ' WHERE en_id = :idendoso ' +
            ' AND en_idhistoricoempresa = hm_id' +
            ' AND en_idhistoricocontrato = hc_id' +
            ' AND hc_idformulario = fo_id';

  with GetQueryEx(sSql, [IdEndoso]) do
  try
    if not IsEmpty then
      with fraEmpresaDatosActuales do
      begin
        CUIT             := FieldByName('cuit').AsString;
        cmbRSocial.Text  := FieldByName('rsocial').AsString;
        edContrato.Value := FieldByName('contrato').AsInteger;
      end;   
  finally
    Free;
  end;
end;

procedure TfrmRedPresAdministracionCartas.DoCargarDatosCartaDoc(IdEndoso: TTableId);
var
  sSql: String;
begin
  inherited;
  // datos de la empresa
  sSql := 'SELECT hm_nombre rsocial, hm_cuit cuit, hc_contrato contrato' +
           ' FROM ahm_historicoempresa, ahc_historicocontrato, aen_endoso, afo_formulario' +
          ' WHERE en_id = :idendoso ' +
            ' AND en_idhistoricoempresa = hm_id' +
            ' AND en_idhistoricocontrato = hc_id' +
            ' AND hc_idformulario = fo_id';

  with GetQueryEx(sSql, [IdEndoso]) do
  try
    if not IsEmpty then
      with fraEmpresaDatosCartaDoc do
      begin
        CUIT             := FieldByName('cuit').AsString;
        cmbRSocial.Text  := FieldByName('rsocial').AsString;
        edContrato.Value := FieldByName('contrato').AsInteger;
      end;
  finally
    Free;
  end;
end;

function TfrmRedPresAdministracionCartas.GetSql: String;
var
  sCAT, sSql: String;
begin
  if not fraEmpresaDeudora.IsEmpty then
    sCAT := ''''' || '  // para que no utilice el índice por AT_AREA
  else
    sCAT := '';

  sSql := 'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' ex_siniestro, ex_orden, ex_recaida, ex_cuil, ex_cuit, ' +
                ' utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocartadoc, utiles.armar_cuit(hm_cuit) cuit, ' +
                ' hm_nombre empresa, hc_contrato contrato, tc_nombre tipocarta, tc_destinatario, tc_id, ' +
                ' correo.tb_descripcion ultcorreo, ca_usuimpresion, trunc(ca_fechaimpresion) fechaimpresion, ' +
                ' decode(ca_recepcionok, ''S'', ''Si'', ''No'') recepcionok, ca_fecharecepcion, ' +
                ' codre.tb_descripcion desc_recepcion, to_char(fi_id) codigofirma, fi_firmante, ' +
                ' trunc(ca_fechareimpresion) fechareimpresion, ca_observaciones, ca_usureimpresion, ' +
                ' ca_id, ca_manual, ca_fechabaja, nvl(ca_correoreimpresion, ca_correo) correo, ' +
                ' ca_idcartaareemplazar, ca_recepcionok, ca_codrecepcion, Null ca_idformulario, ca_idendoso, ' +
                ' ca_usualta, trunc(ca_fechaalta) fechaalta, el_nombre, ca_idareatexto, ' +
                ' Null porcvariable, Null sumafija, utiles.armar_cuit(tj_cuil) cuil, ' +
                ' at_area, tj_nombre trabajador, tc_formatorel, tc_codigo, ca_idtrabajador, ' +
                ' ca_idrecepcioncartadoc, rc_codigobarras_cd trackytrace, ' +
                ' ca_ideventoinca, ca_fechaaltamedica, at_modulo, gp_nombre GTrabajo, ' +
                ' siniestro.get_usuariogestor(ex_id) usugestor, ca_incluirenremito, ' +
                ' ca_idremito, ca_evento, ca_idcomisionmedica, tc_tiposalida, cm_descripcion ComMed, ' +
                ' ca_idexpediente, ca_fechamail, ca_usumail, ' +    // Lu WF 7946 agregue los campos ca_fechamail y ca_usumail
                ' tc_textomodificable, tc_textoaltamanual, ca_observrecepcion, ' +     // Lu TK 790
                ' ca_idremitoreimpresion, ca_idavaldigital, ca_eventoabandono, ' +
                ' fi_codusuario, ca_iddestinatariocarta, ca_idfirmareimpresion, ' +
                ' ca_idfirma, NVL(ca_ventanilla, ''N'') ca_ventanilla, dc_nombre OtroDestinatarioCarta, ' +  // TK 29251
                ' ca_idtextocarta, ca_motivorechazobase, ca_estudiorealizado, ca_patologiaaceptada, ca_nrocartadoc, ca_fechavalmanual, ex_id, ' +     // TK 45302
                ' (SELECT MAX(da_lote) LOTE ' +                                                          // TK 55834 columna del lote
                   ' FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RTD_TIPODOCUMENTO ' +
                  ' WHERE DA_FECHABAJA IS NULL ' +
                    ' AND DA_IDTIPODOCUMENTO = TD_ID ' +
                    ' AND DA_CODIGODOCUMENTO = ca_nrocartadoc ' +
                    ' AND TD_CODIGO = ' + SqlValue(CODDOC_CARTADOC) + ' ' +
                    ' AND DA_LOTE IS NOT NULL) NROLOTE ' +
           ' FROM crc_recepcioncartadoc, aen_endoso, ahc_historicocontrato, ahm_historicoempresa, ' +
                ' ctc_textocarta, cfi_firma, ctb_tablas salida, ' +
                ' ctb_tablas correo, ctb_tablas codre, cat_areatexto, ' +
                ' cta_textoarea, del_delegacion, cca_carta, ' +
                ' sex_expedientes, ctj_trabajador, mgp_gtrabajo, SIN.scm_comisionmedica, cdc_destinatariocarta ' +
          ' WHERE ca_idtextocarta = tc_id ' +
            ' AND ca_idtrabajador = tj_id(+) ' +
            //si esta el filtro de siniestro, le saco el outer join para que vuelva mas rapido...
            ' AND ca_idexpediente = ex_id ' + OuterJoin +
            ' AND ta_idtextocarta = tc_id ' +
            ' AND ta_idareatexto = at_id ' +
            ' AND ca_idareatexto = at_id ' +   // por ahora va esta condición, la agregué porque cuando buscaba una carta de compensación, me la triplicaba en la grilla
            ' AND ca_idcomisionmedica = cm_id(+) ' +
            ' AND ' + sCAT + 'at_area IN ('+ Area + ') ' +
            ' AND correo.tb_codigo(+) = nvl(ca_correoreimpresion, ca_correo) ' +
            ' AND correo.tb_clave(+) = ''CORRE'' ' +
            ' AND codre.tb_codigo(+) = ca_codrecepcion ' +
            ' AND codre.tb_clave(+) = ''CODRE'' ' +
            ' AND salida.tb_clave = ''TSCDO'' ' +
            ' AND salida.tb_codigo = ca_tiposalida ' +
            ' AND en_idhistoricocontrato = hc_id(+) ' +
            ' AND en_idhistoricoempresa = hm_id(+) ' +
            ' AND nvl(ca_idfirmareimpresion, ca_idfirma) = fi_id ' +
            ' AND ca_idendoso = en_id(+) ' +
            ' AND ca_iddelegacion = el_id(+) ' +
            ' AND ca_idrecepcioncartadoc = rc_id(+) ' +
            ' AND ta_fechabaja IS NULL ' +
            ' AND at_fechabaja IS NULL ' +
            ' AND ca_iddestinatariocarta = dc_id(+) ' +   // TK 29251
            ' AND ex_gtrabajo = gp_codigo ' + OuterJoin + GetWhere;

  Result := sSql;
end;

function TfrmRedPresAdministracionCartas.GetWhere: String;
var
  sSql: String;
begin
  if not fraEmpresaDeudora.IsEmpty then
    sSql := ' AND hc_contrato = ' + SqlInt(fraEmpresaDeudora.Contrato);

  if not SinDesde.IsEmpty then
    sSql := sSql + ' AND ex_siniestro BETWEEN ' + SinDesde.SiniestroSql  + ' AND ' + SinHasta.SiniestroSql;

  if not edSiniestro.IsEmpty then
    sSql := sSql + ' AND ex_siniestro = ' + edSiniestro.SiniestroSql +
                   ' AND ex_orden = ' + edSiniestro.OrdenSql +
                   ' AND ex_recaida = ' + edSiniestro.RecaidaSql;

  if  (fraGrupoTrabajo.ID <> '') then
    sSql := sSql + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
    sSql := sSql + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

  if rbGobSi.Checked then
    sSql := sSql + ' AND ex_siniestro >= ' + SqlInt(MIN_SINIESTRO_GOB)
  else if rbGobNo.Checked then
    sSql := sSql + ' AND ex_siniestro < ' + SqlInt(MIN_SINIESTRO_GOB);

  if (cmbTipoAccidente.Text <> '') then
    sSql := sSql + ' AND ex_tipo ' + cmbTipoAccidente.InSql;

  if (not fraPrestador.IsEmpty) then
    sSql := sSql + ' AND dc_prestador = ' + IntToStr(fraPrestador.IdPrestador);

  if Is_UsuarioSML(Sesion.UserID) then   // Plan - SML
    sSql := sSql + ' AND art.siniestro.get_siniestrosml(ex_id) = ''S'' ';

  if rbDomSI.Checked then
    sSql := sSql + ' AND art.varios.is_direccioncompleta (DECODE (ca_idtrabajador, '''', DECODE (ca_idendoso, '''', DECODE (ca_idcomisionmedica, '''', 4, 3), 2), 1), ' +
                       ' NVL (ca_idtrabajador, NVL (ca_idendoso, NVL (ca_idcomisionmedica, ca_iddestinatariocarta)))) = ''S'' ';

  if rbDomNO.Checked then
    sSql := sSql + ' AND art.varios.is_direccioncompleta (DECODE (ca_idtrabajador, '''', DECODE (ca_idendoso, '''', DECODE (ca_idcomisionmedica, '''', 4, 3), 2), 1), ' +
                       ' NVL (ca_idtrabajador, NVL (ca_idendoso, NVL (ca_idcomisionmedica, ca_iddestinatariocarta)))) = ''N'' ';

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  Result := inherited GetWhere + sSql;
end;

procedure TfrmRedPresAdministracionCartas.InicializarComponentes;
begin
  inherited;
  fraEmpresaDatosCartaDoc.Locked  := True;
  fraEmpresaDatosActuales.Locked  := True;
  fraEmpresaDeudora.ShowBajas     := True;
end;

procedure TfrmRedPresAdministracionCartas.NuevaCarta(Sender: TObject);
begin
  with TfrmGeneracionCartasAdmin.Create(Self) do
  try
    if Sender = tbNuevo then
      IdCarta := ART_EMPTY_ID
    else
      IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;

    PermitirSinRechazado := PermitirSinRechazadoGenCartasAdmin;   
    CodArea := Self.Area;
    Preparar(IdCarta);

    if Mostrar and sdqConsulta.Active then
      sdqConsulta.Refresh;
  finally
    free;
  end;
end;

procedure TfrmRedPresAdministracionCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaDeudora.Clear;
  SinDesde.Clear;
  SinHasta.Clear;
  edSiniestro.Clear;
  fraGrupoTrabajo.Clear;
  cmbTipoAccidente.Clear;
  rbGobTodos.Checked         := True;
  rbDomTODOS.Checked         := true;
  fraPrestador.Clear;
end;

procedure TfrmRedPresAdministracionCartas.tbRecepcionMasivaClick(Sender: TObject);
begin
  ImpoExpoWizard('RECCD');
end;

procedure TfrmRedPresAdministracionCartas.SinDesdeExit(Sender: TObject);
begin
  inherited;
  if SinHasta.IsEmpty then
    SinHasta.Siniestro := SinDesde.Siniestro;
end;

procedure TfrmRedPresAdministracionCartas.btnCancelarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;

procedure TfrmRedPresAdministracionCartas.btnAceptarImpresionClick(Sender: TObject);
var
  sDestinatario: TTipoDestinatario; // Lu 02/07
  bAlTrabajador, bEsConfidencial, bEsSinGobernacion, bFaltanDirecciones,
  bCartasSinAval, bFaltaDirEmp, bFaltaDirTrab, bSalioPdf, bVentanilla, bEsSiniestroVencido: Boolean;
  iIdDestinatario, i, iCartaEmp, IdCarta, idTrabajador, OldImpresora, iCantSiniVencido: Integer;
  sSalida: TSalidaReport;
  tModulo: TTipoModulo;
  sModulo, sArea, sMensaje, sNombrePdf: String;
begin
  inherited;
  {$IFDEF RED_PRES}
  sSalida   := srPrint;
  bSalioPdf := False;
  {$ENDIF}
  iCantSiniVencido := 0;

  if ContinuarImpresion() then
  begin
    OldImpresora         := Printer.PrinterIndex;
    Printer.PrinterIndex := cmbImpresoras.ItemIndex;
    sDestinatario        := tdOtros;  // lo inicializo así para el cambio para legales, igualmente luego se asigna el que corresponde.
    iIdDestinatario      := 0;
    try
      PararImpresion      := False;
      btnParar.Enabled    := True;
      bFaltanDirecciones  := False;
      bSalioPdf           := False;
      bEsSiniestroVencido := False;  // TK 54662
      DoLimpiarTemporal;
      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        Verificar(PararImpresion, btnAceptarImpresion, 'Ha decidido cancelar la impresión.');

        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        sSalida := GetTipoSalida;
        sArea   := sdqConsulta.FieldByName('at_area').AsString;
        sModulo := sdqConsulta.FieldByName('at_modulo').AsString;
        IdCarta := sdqConsulta.FieldByName('ca_id').AsInteger;

        if (sArea = AREA_MED) then
          tModulo := taAreaMedica
        else if (sArea = AREA_SIN) then
          tModulo := taSiniestros
        else if (sArea = AREA_INC) then
          tModulo := taIncapacidades
        else if (sArea = AREA_RECA) then
          tModulo := taRecalificacion
        else if (sArea = AREA_DIN) then
          tModulo := taDinerarias
        else
          tModulo := taLegales;

        if not ((tModulo = taDinerarias) and (sModulo = MODULO_PAGOTRABAJADOR)) then   // estas CD se imprimen desde unLiqCartasDocumento
        begin
          bEsSinGobernacion   := Is_SiniestroDeGobernacion(sdqConsulta.FieldByName('ex_id').AsInteger) or
                                 (Get_Holding(SacarGuiones(sdqConsulta.FieldByName('cuit').AsString)) = 'GBA');

          if not sdqConsulta.FieldByName('ca_idtrabajador').IsNull then           // Destino Trabajador
          begin
            sDestinatario   := tdTrabajador;
            iIdDestinatario := sdqConsulta.FieldByName('ca_idtrabajador').AsInteger;
          end
          else if not sdqConsulta.FieldByName('ca_idendoso').IsNull then          // Destino Empresa
          begin
            sDestinatario   := tdEmpresa;
            iIdDestinatario := sdqConsulta.FieldByName('ca_idendoso').AsInteger;
          end
          else if not sdqConsulta.FieldByName('ca_idcomisionmedica').IsNull then  // Destino Comision Medica
          begin
            sDestinatario   := tdComisionMedica;
            iIdDestinatario := sdqConsulta.FieldByName('ca_idcomisionmedica').AsInteger;
          end
          else if not(sdqConsulta.FieldByName('ca_iddestinatariocarta').IsNull) {and (tModulo = taLegales)} then   // TK 29251 comento el "and (tModulo = taLegales)" porque sino no sale la carta, ya que el destinatario es "Otros"
          begin
            sDestinatario   := tdOtros;
            iIdDestinatario := sdqConsulta.FieldByName('ca_iddestinatariocarta').AsInteger;
          end;
          bFaltaDirEmp    := False;
          bFaltaDirTrab   := False;
          bEsConfidencial := Is_EmpresaConfidencial(sdqConsulta.FieldByName('ex_cuit').AsString);
          ValidarDirAval(iIdDestinatario, sDestinatario, False, (sSalida = srPdf),
                         bFaltaDirEmp, bCartasSinAval);

          bAlTrabajador := (sdqConsulta.FieldByName('nrocartadoc').IsNull) and //si no estaba impresa
                           (sDestinatario = tdEmpresa) and
                           (not bEsConfidencial) and //si no es confidencial
                           ((sdqConsulta.FieldByName('tc_destinatario').AsString = DESTI_AMBOS) or  //si el destinatario es AMBOS
                              ((sdqConsulta.FieldByName('tc_destinatario').AsString = DESTI_EMPRESA) and //o si es EMPRESA y tiene formato relacionado
                              (sdqConsulta.FieldByName('tc_formatorel').AsInteger <> 0)));

          if bAlTrabajador then
          begin
            idTrabajador := ValorSqlIntegerEx('SELECT tj_id ' +
                                               ' FROM ctj_trabajador ' +
                                              ' WHERE tj_cuil = :cuil', [sdqConsulta.FieldByName('ex_cuil').AsString]);
            ValidarDirAval(idTrabajador, tdTrabajador, True, False, bFaltaDirTrab, bCartasSinAval);
          end;

          bFaltanDirecciones := bFaltanDirecciones or bFaltaDirEmp or bFaltaDirTrab;

          if sdqConsulta.FieldByName('nrocartadoc').IsNull then    // Valida solo si es una carta no impresa
            ValidarImprimirCartasSiniestroVencido(sdqConsulta.FieldByName('CA_ID').AsInteger, sdqConsulta.FieldByName('CA_IDEXPEDIENTE').AsInteger, bEsSiniestroVencido);  // TK 54662

          if bEsSiniestroVencido then  // TK 54662
            inc(iCantSiniVencido);

          if not(bFaltaDirEmp) and not(bFaltaDirTrab) and not(bEsSiniestroVencido) then
          begin
            if sSalida = srPdf then   //el IIF me falla aca....
            begin
              sNombrePdf  := GetNombreCartaPdf(IdCarta);
              bVentanilla := True;
            end else
            begin
              sNombrePdf  := '';
              bVentanilla := False;
            end;
            if (tModulo = taDinerarias) and (sModulo = MODULO_NOTIFICACIONES) then
              DoImprimirCartaSinDDJJ(IdCarta, sSalida, tmBeginEnd, edCantCopias.Value,
                                     True, True, bEsSinGobernacion)
            else
              DoImprimirCarta(IdCarta, tModulo, sSalida, tmBeginEnd, edCantCopias.Value,
                              True, True, False, False, True, True, False, True, bEsSinGobernacion,
                              True, False, IIF(tModulo = taLegales, True, False),
                              False, '', False, sdqConsulta.FieldByName('nrocartadoc').IsNull,
                              sNombrePdf, IIF(rbFirmanteOrig.Checked, True, False),
                              bVentanilla);
            bSalioPdf := bSalioPdf or bVentanilla;


            if (bAlTrabajador) and (rbImprimir.Checked) then
            begin
              iCartaEmp := idCarta;
            //si el destinatario es "ambos", y no tiene Nro de Carta, significa que es la primera vez y
            //por lo tanto tengo insertar la carta del trabajador e imprimirla
              Delay(1000); //esto es para probar el error de las impresoras lexmarkkk
              Application.ProcessMessages;
              idCarta := DoInsertarCarta(IIF((sdqConsulta.FieldByName('tc_formatorel').AsInteger = 0),
                                             sdqConsulta.FieldByName('tc_id').AsInteger,
                                             sdqConsulta.FieldByName('tc_formatorel').AsInteger),
                                         sdqConsulta.FieldByName('ex_siniestro').AsInteger,
                                         sdqConsulta.FieldByName('ex_orden').AsInteger,
                                         sdqConsulta.FieldByName('ex_recaida').AsInteger,
                                         sdqConsulta.FieldByName('codigofirma').AsString,
                                         sArea, False, ART_EMPTY_ID, tdTrabajador,
                                         sdqConsulta.FieldByName('ca_observaciones').AsString,
                                         sdqConsulta.FieldByName('ca_ideventoinca').AsInteger,
                                         sdqConsulta.FieldByName('ca_fechaaltamedica').AsDateTime, 0,
                                         0, 0, '', sdqConsulta.FieldByName('ca_evento').AsInteger,
                                         sdqConsulta.FieldByName('ca_id').AsInteger,
                                         sdqConsulta.FieldByName('ca_eventoabandono').AsInteger,
                                         sdqConsulta.FieldByName('ca_usualta').AsString,
                                         sdqConsulta.FieldByName('ca_idavaldigital').AsInteger,
                                         sdqConsulta.FieldByName('ca_motivorechazobase').AsString,
                                         0, 0,
                                         sdqConsulta.FieldByName('ca_estudiorealizado').AsString,
                                         sdqConsulta.FieldByName('ca_patologiaaceptada').AsString
                                         );
              DoActualizarTurno(iCartaEmp, IdCarta);
              Delay(1000); //esto es para probar el error de las impresoras lexmarkkk
              Application.ProcessMessages;
              DoImprimirCarta(IdCarta, tModulo, IIF(rbPreview.Checked, srPreview, srPrint),
                              tmBeginEnd, edCantCopias.Value, True, True, False, False,
                              True, True, False, True, bEsSinGobernacion, True, False,
                              IIF(tModulo = taLegales, True, False), False, '', False,
                              False, '', IIF(rbFirmanteOrig.Checked, True, False), False);
            end;
          end;
        end;
        BarProgreso.Position := Round((i + 1) / Grid.SelectedRows.Count * 100);
        Application.ProcessMessages;
      end;

      if bFaltanDirecciones or bCartasSinAval or bSalioPdf or (iCantSiniVencido > 0)  then
      begin
        sMensaje := 'Atención: ' + #10;
        if bFaltanDirecciones then
          sMensaje := sMensaje + '- Al menos una de las cartas no se pudo emitir porque ' + #10 +
                                 '  el destinatario no posee una dirección válida.' + #10;
        if bCartasSinAval then
          sMensaje := sMensaje + '- Al menos una de las cartas ha sido impresa sin aval del firmante.' + #10;

        if bSalioPdf then
          sMensaje := sMensaje + '- Al menos una de las cartas ha sido generada en formato pdf ' + #10 +
                                 '  y se ha enviado a Ventanilla Electrónica.';

        if (iCantSiniVencido > 0) then                                                          // TK 54662
          sMensaje := sMensaje + '- Al menos una de las cartas posee el Siniestro vencido. ';

        MsgBox(sMensaje, MB_ICONINFORMATION, 'Información importante');
        ImprimirDireccionesFaltantes;
        DoLimpiarTemporal;
      end;

      fpOpcionesImpresion.ModalResult := mrOk;
      Grid.UnSelectAll;
      sdqConsulta.Refresh;
    finally
      Printer.PrinterIndex := OldImpresora;
      btnParar.Enabled := False;
      {$IFDEF RED_PRES}
      if (sSalida = srPdf) and bSalioPdf and (sNombrePdf <> '') then  // Borro el PDF (lo hago en este modulo porque es solo para redpres)
      begin
         SysUtils.DeleteFile('E:\Cartas ventanilla' + sNombrePdf);
      end;
      {$ENDIF}
    end;
  end;
end;

procedure TfrmRedPresAdministracionCartas.MostrarCarta(IdCarta: Integer);
begin
//
end;

procedure TfrmRedPresAdministracionCartas.DoLimpiarTemporal;
var
  sSql: String;
begin
  sSql := 'DELETE FROM tmp_dirincompletas' +
          ' WHERE mp_usuario = ' + SqlValue(Sesion.UserID);
  EjecutarSql(sSql);
end;

// Lu 02/07: Se modificó y adecuó agregando la Comision Medica y para cualquier otro destinatario que apareciera a futuro.
procedure TfrmRedPresAdministracionCartas.ValidarDirAval(IdDestinatario: Integer; sDestinatario: TTipoDestinatario;
                                                         bNuevaCarta, bVentanilla: Boolean; var bFaltaDir, bFaltaAval: Boolean);
var
  sSql, sLetra: String;
  bSinDir, bSinAval: Boolean;
  iFirmaDig: Integer;
begin
  if (sdqConsulta.FieldByName('tc_tiposalida').AsString <> 'C') then //solo valido dir si es carta documento
  begin
    bSinDir  := False;
    bSinAval := False;
  end
  else begin
    if sDestinatario = tdEmpresa then
      sSql := 'SELECT hm_nombre empresa, null trabajador, null commedica, hd_cpostal cpostal, ' +
                    ' hd_localidad localidad, pv_descripcion provincia, hd_calle calle' +
               ' FROM aen_endoso, ahm_historicoempresa, ahd_historicodomicilio, cpv_provincias' +
              ' WHERE hm_id = en_idhistoricoempresa' +
                ' AND hd_id = en_idhistoricodomicilio' +
                ' AND hd_provincia = pv_codigo(+)' +
                ' AND en_id = :dest '

    else if sDestinatario = tdTrabajador then
      sSql := 'SELECT null empresa, tj_nombre trabajador, null commedica, tj_cpostal cpostal, ' +
                    ' tj_localidad localidad, pv_descripcion provincia, tj_calle calle' +
               ' FROM ctj_trabajador, cpv_provincias' +
              ' WHERE tj_provincia = pv_codigo(+)' +
                ' AND tj_id = :dest '

    else if sDestinatario = tdComisionMedica then    // Lu 02/07
      sSql := 'SELECT NULL empresa, NULL trabajador, cm_descripcion commedica, cm_cpostal cpostal, ' +
                    ' cm_localidad localidad,  pv_descripcion provincia, cm_calle calle ' +
               ' FROM SIN.scm_comisionmedica, cpv_provincias ' +
              ' WHERE cm_provincia = pv_codigo(+) ' +
                ' AND cm_id = :dest '

    else if sDestinatario = tdOtros then // 05/05/2011 (para legales)
      sSql := ' SELECT NULL empresa, NULL trabajador, NULL commedica, dc_cpostal cpostal, ' +
                     ' dc_localidad localidad, pv_descripcion provincia, dc_calle calle ' +
                ' FROM cdc_destinatariocarta, cpv_provincias ' +
               ' WHERE dc_provincia = pv_codigo(+) ' +
                 ' AND dc_id = :dest ';

    with GetQueryEx(sSql, [IdDestinatario]) do
    try
      bSinDir   := FieldByName('cpostal').IsNull or FieldByName('localidad').IsNull or
                   FieldByName('provincia').IsNull or FieldByName('calle').IsNull;
      iFirmaDig := GetFirmaDigital(sdqConsulta.FieldByName('at_area').AsString,
                                   sdqConsulta.FieldByName('at_modulo').AsString,
                                   sdqConsulta.FieldByName('fi_codusuario').AsString);
      if bNuevaCarta then
        bSinAval := (iFirmaDig > 0) and
                    (iFirmaDig <> sdqConsulta.FieldByName('codigofirma').AsInteger)
      else
        bSinAval := (iFirmaDig > 0) and
                    (sdqConsulta.FieldByName('ca_idavaldigital').AsInteger <>
                     sdqConsulta.FieldByName('codigofirma').AsInteger);

      if bSinDir or bSinAval or bVentanilla then
      begin
        if bSinDir then
          sLetra := 'D'
        else if bSinAval then
          sLetra := 'A'
        else if bVentanilla then
          sLetra := 'P'
        else
          sLetra := '';

        sSql := 'INSERT INTO tmp_dirincompletas' +            // no lo hago con el insertarcartaentemporal porque aca se sacan datos de los sSql anteriores dependiendo de cada condicion (destinatario)
                '(mp_usuario, mp_sincompleto, mp_nombreempr, ' +
                ' mp_nombretrab, mp_nombrecommed, mp_formato, mp_tipo) VALUES (' +
                SqlValue(Sesion.UserID) + ',' +
                SqlValue(sdqConsulta.FieldByName('siniestro').AsString) + ',' +
                SqlValue(FieldByName('empresa').AsString) + ',' +
                SqlValue(FieldByName('trabajador').AsString) + ',' +
                SqlValue(FieldByName('commedica').AsString) + ',' +
                SqlValue(sdqConsulta.FieldByName('tc_codigo').AsString) + ',' +
                SqlValue(sLetra) + ')';
        EjecutarSql(sSql);

      end;
    finally
       Free;
    end;
  end;
  bFaltaDir  := bFaltaDir  or bSinDir;
  bFaltaAval := bFaltaAval or bSinAval;
end;

procedure TfrmRedPresAdministracionCartas.ImprimirDireccionesFaltantes;
var
  sSql: String;
  rptDirecciones: TqrDireccionesFaltantes;
begin
  sSql := 'DELETE FROM tmp_dirincompletas a ' +
          ' WHERE a.mp_tipo = ''P'' ' +
            ' AND a.mp_nombreempr IS NOT NULL ' +
            ' AND EXISTS(SELECT 1 ' +
                         ' FROM tmp_dirincompletas b ' +
                        ' WHERE b.mp_sincompleto = a.mp_sincompleto ' +
                          ' AND b.mp_formato = a.mp_formato ' +
                          ' AND b.mp_usuario = a.mp_usuario ' +
                          ' AND b.mp_tipo = ''D'') ';
  EjecutarSql(sSql); //con esto limpio los casos de ventanilla que quedaron mal debido a que se insertan
                    //primero y despues se valida la direccion del trabajador y falta algun dato (se entendio??)...

  rptDirecciones := TqrDireccionesFaltantes.Create(nil);
  with rptDirecciones do
  try
    sdqDatos.Close;
    sdqDatos.ParamByName('pUsuario').AsString := Sesion.UserID;
    sdqDatos.Open;
    PreviewModal;
  finally
    Free;
  end;
end;

procedure TfrmRedPresAdministracionCartas.tbRecepcionDocumClick(Sender: TObject);
begin
  if UnaFilaSeleccionada and (fpRecepcionCartaDoc.ShowModal = mrOk) then
    sdqConsulta.Refresh;
end;

function TfrmRedPresAdministracionCartas.UnaFilaSeleccionada: Boolean;
begin
  Result := False;
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla.')
  else
    Result := True;
end;

procedure TfrmRedPresAdministracionCartas.edNroCartaDocDesdeExit(Sender: TObject);
begin
  inherited;
  
  if edNroCartaDocHasta.Text = '3779' then
    edNroCartaDocHasta.Text := edNroCartaDocDesde.Text;
end;

{procedure TfrmRedPresAdministracionCartas.fraModuloOnChange(Sender: TObject);
begin
  if fraModulo.IsSelected then
    fraCodTexto.Sql := 'SELECT tc_id AS ' + CD_ALIAS_ID + ', ' +
                             ' tc_codigo AS ' + CD_ALIAS_CODIGO + ', ' +   // Lu 02/07
                             ' tc_nombre AS ' + CD_ALIAS_DESC + ', ' +
                             ' tc_fechabaja AS ' + CD_ALIAS_BAJA +
                        ' FROM ctc_textocarta, cta_textoarea ' +
                       ' WHERE tc_id = ta_idtextocarta ' +
                         ' AND ta_idareatexto = ' + SqlValue(fraModulo.Value)
  else
    fraCodTexto.Sql := 'SELECT DISTINCT tc_id AS ' + CD_ALIAS_ID + ', ' +
                                      ' tc_codigo AS ' + CD_ALIAS_CODIGO + ', ' +   // Lu 02/07
                                      ' tc_nombre AS ' + CD_ALIAS_DESC + ', ' +
                                      ' tc_fechabaja AS ' + CD_ALIAS_BAJA + ' ' +
                                 ' FROM ctc_textocarta, cat_areatexto, cta_textoarea ' +
                                ' WHERE tc_id = ta_idtextocarta ' +
                                  ' AND at_id = ta_idareatexto ' +
                                  ' AND at_area IN (' + SqlValue(Area) + ')';
end;}

procedure TfrmRedPresAdministracionCartas.fraAreaOnChange(Sender: TObject);
var sSql: String;
begin
  sSql := 'SELECT AT_ID AS ID, ' +
                ' AT_ID AS CODIGO, AT_DESCRIPCION AS DESCRIPCION, ' +
                ' AT_ID || '' - '' || AT_DESCRIPCION AS DESCRI, ' +
                ' AT_FECHABAJA AS BAJA ' +
           ' FROM CAT_AREATEXTO ';

  if fraArea.IsSelected then
    sSql := sSql + ' WHERE AT_AREA = ' + SqlValue(fraArea.Value)
  else
    sSql := sSql + ' WHERE AT_AREA IN (' + Area + ')';

  ssql := ssql + ' ORDER BY descripcion ';  
  //fraModulo.Sql := sSql;
  sdqModulo.Close;
  sdqmodulo.SQL.Text := ssql;
  sdqModulo.Open;
end;


procedure TfrmRedPresAdministracionCartas.tbNuevoClick(Sender: TObject);
begin
  NuevaCarta(Sender);
end;

procedure TfrmRedPresAdministracionCartas.FormCreate(Sender: TObject);
begin
  inherited;
  sdqTipoAccidente.Open;

  if Seguridad.Claves.Count = 0 then       // tuve que hacerlo asi porque con el IsActive me da error en caso de no existir la clave...
  begin
    Seguridad.Claves.Add;
    Seguridad.Claves.Items[0].Name := 'BajaCarta';
  end;

  FPermitirSinRechazadoGenCartasAdmin := True; //ticket 27543

  {$IFDEF RED_PRES}        // TK 54389
   tbCartasErr.Visible := True;
  {$ELSE}
   tbCartasErr.Visible := False;
  {$ENDIF}
end;

procedure TfrmRedPresAdministracionCartas.DoActualizarTurno(iCartaEmp, iCartaTrab: Integer);
var
  sSql: String;
begin
  sSql := 'UPDATE mcc_citacionconsultorio' +
            ' SET cc_idcartatrab = :iCartaTrab' +
          ' WHERE cc_idcartaemp = :iCartaEmp';
  EjecutarSqlSTEx(sSql, [iCartaTrab, iCartaEmp]);
end;

function TfrmRedPresAdministracionCartas.OuterJoin :String;
begin
  Result := IIF(edSiniestro.IsEmpty and SinDesde.IsEmpty, '(+)', '');
end;

procedure TfrmRedPresAdministracionCartas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuAdministracionCartas.Enabled := True;
end;

function TfrmRedPresAdministracionCartas.GetTipoSalida: TSalidaReport;
var
  iFirma: Integer;
begin
  if rbPreview.Checked then
    Result := srPreview
  else begin
    iFirma := IIF(rbFirmanteOrig.Checked, sdqConsulta.FieldByName('ca_idfirma').AsInteger,
                                          IIF(sdqConsulta.FieldByName('ca_idfirmareimpresion').IsNull,
                                              sdqConsulta.FieldByName('ca_idfirma').AsInteger,
                                              sdqConsulta.FieldByName('ca_idfirmareimpresion').AsInteger));

    if (sdqConsulta.FieldByName('ca_idavaldigital').AsInteger = iFirma) and       //si el firmante esta avalado digitalmente
        sdqConsulta.FieldByName('nrocartadoc').IsNull and                         //si no esta impresa la carta
        not(sdqConsulta.FieldByName('ca_idendoso').IsNull) and                    //si es a la empresa
        GetEmpresaTieneVentanilla(sdqConsulta.FieldByName('ca_idendoso').AsInteger) and  //si la empresa esta inscripta en ventanilla
        (sdqConsulta.FieldByName('tc_tiposalida').AsString = 'C') then  // TK 38837 solo formato de carta documento
      Result := srPdf
    else
      Result := srPrint;
  end;
end;

procedure TfrmRedPresAdministracionCartas.cmbModuloChange(Sender: TObject);
begin
  if not cmbModulo.IsEmpty then
    fraCodTexto.Sql := 'SELECT tc_id AS ' + CD_ALIAS_ID + ', ' +
                             ' tc_codigo AS ' + CD_ALIAS_CODIGO + ', ' +   // Lu 02/07
                             ' tc_nombre AS ' + CD_ALIAS_DESC + ', ' +
                             ' tc_fechabaja AS ' + CD_ALIAS_BAJA +
                        ' FROM ctc_textocarta, cta_textoarea ' +
                       ' WHERE tc_id = ta_idtextocarta ' +
                         ' AND ta_idareatexto ' + cmbModulo.InSql
  else
    fraCodTexto.Sql := 'SELECT DISTINCT tc_id AS ' + CD_ALIAS_ID + ', ' +
                                      ' tc_codigo AS ' + CD_ALIAS_CODIGO + ', ' +   // Lu 02/07
                                      ' tc_nombre AS ' + CD_ALIAS_DESC + ', ' +
                                      ' tc_fechabaja AS ' + CD_ALIAS_BAJA + ' ' +
                                 ' FROM ctc_textocarta, cat_areatexto, cta_textoarea ' +
                                ' WHERE tc_id = ta_idtextocarta ' +
                                  ' AND at_id = ta_idareatexto ' +
                                  ' AND at_area IN (' + SqlValue(Area) + ')';

end;


procedure TfrmRedPresAdministracionCartas.tbSalirErrClick(Sender: TObject);  // TK 54389
begin
  fpCartasNoImpresasErr.ModalResult := mrOk;
  // aca habria que refrescar la grilla ppal.
end;

procedure TfrmRedPresAdministracionCartas.tbCartasErrClick(Sender: TObject);     // TK 54389
begin
  tbLimpiarErrClick(nil);
  fpCartasNoImpresasErr.ShowModal;
end;

procedure TfrmRedPresAdministracionCartas.tbRefrescarErrClick(Sender: TObject);    // TK 54389
var
  sSql: string;
begin
  Verificar(edFImprDesde.IsEmpty or edFImprHasta.IsEmpty, gbFechaImpresionErr, 'Debe completar el rango de fechas.');
  sSql := 'SELECT /*+ RULE */ a.ca_id, ex_siniestro, ex_orden, ex_recaida, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) SINIESTRO, ' +
                ' art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre TRABAJADOR, ' +
                ' art.utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocartadoc, art.utiles.armar_cuit(ex_cuit) cuit, hm_nombre empresa, ' +
                ' hc_contrato contrato, tc_nombre tipocarta, tc_codigo CodCarta, ca_fechaimpresion fechaimpresion, at_area, at_modulo, tc_formatorel, tc_id, ' +
                ' to_char(fi_id) codigofirma, a.ca_observaciones, a.ca_ideventoinca, a.ca_fechaaltamedica, a.ca_evento, a.ca_eventoabandono, a.ca_usualta, ' +
                ' a.ca_idavaldigital, a.ca_motivorechazobase, a.ca_idtrabajador, a.ca_idendoso, a.ca_idcomisionmedica, a.ca_iddestinatariocarta, ex_cuit, ex_cuil, ' +
                ' c.tc_destinatario, ex_id ' +
           ' FROM cca_carta a, ctc_textocarta c, art.sex_expedientes, ctj_trabajador, ahm_historicoempresa, aen_endoso, ahc_historicocontrato, cat_areatexto, ' +
                ' cfi_firma ' +
          ' WHERE a.ca_nrocartadoc IS NOT NULL ' +
            ' AND a.ca_idexpediente = ex_id ' +
            ' AND c.tc_id = a.ca_idtextocarta ' +
            ' AND c.tc_fechabaja IS NULL ' +
            ' AND a.ca_idendoso IS NOT NULL ' +
            ' AND tj_id = ex_idtrabajador ' +
            ' AND en_idhistoricocontrato = hc_id(+) ' +
            ' AND en_idhistoricoempresa = hm_id(+) ' +
            ' AND a.ca_idendoso = en_id(+) ' +
            ' AND ca_idareatexto = at_id ' +
            ' AND nvl(ca_idfirmareimpresion, ca_idfirma) = fi_id ' +
            ' AND a.ca_fechaimpresion between ' + SqlDate(edFImprDesde.Date) + ' and (' + SqlDate(edFImprHasta.Date) + ' + 1 )' + // filtro
            ' AND (   (c.tc_destinatario = 3) ' +
                  ' OR (    (c.tc_destinatario = 1) ' +
                      ' AND (c.tc_formatorel IS NOT NULL))) ' +
            ' AND NOT EXISTS(SELECT 1 ' +
                             ' FROM cca_carta b ' +
                            ' WHERE b.ca_id > a.ca_id ' +
                              ' AND b.ca_idexpediente = a.ca_idexpediente ' +
                              ' AND b.ca_idtrabajador IS NOT NULL ' +
                              ' AND b.ca_idtextocarta = (SELECT tc_id ' +
                                                         ' FROM ctc_textocarta ' +
                                                        ' WHERE tc_id = NVL(c.tc_formatorel, c.tc_id))) ';
  sdqCartasErr.SQL.Text := sSql;
  OpenQuery(sdqCartasErr);
end;

procedure TfrmRedPresAdministracionCartas.tbLimpiarErrClick(Sender: TObject);   // TK 54389
begin
  inherited;
  edFImprDesde.Clear;
  edFImprHasta.Clear;
  sdqCartasErr.Close;
end;

procedure TfrmRedPresAdministracionCartas.tbOrdernarErrClick(Sender: TObject);  // TK 54389
begin
  inherited;
  SortDialogErr.Execute;
end;

procedure TfrmRedPresAdministracionCartas.tbReimprimirCartaErrClick(Sender: TObject);
begin
  inherited;
  if MsgAsk('¿Esta seguro que desea imprimir la carta documento?') then
  begin
    BeginTrans;
    Try
      Do_BlanquearDatosErr(sdqCartasErr.FieldByName('CA_ID').AsInteger);
      Do_ImprimirCartaErr(sdqCartasErr.FieldByName('CA_ID').AsInteger);

      CommitTrans;
    Except
      on E:Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Ha surgido un error al intentar modificar los datos.' + #13#10 + E.Message);
      end;
    end;
  end;
end;

procedure TfrmRedPresAdministracionCartas.Do_BlanquearDatosErr(ica_id: integer);
var sSql: string;
begin
  sSql := 'UPDATE CCA_CARTA ' +
            ' SET CA_NROCARTADOC = NULL, ' +
                ' CA_USUIMPRESION = NULL, ' +
                ' CA_FECHAIMPRESION = NULL, ' +
                ' CA_USUREIMPRESION = NULL, ' +
                ' CA_FECHAREIMPRESION = NULL ' +
          ' WHERE CA_ID = :id ';
  EjecutarSqlSTEx(sSql, [ica_id]);
end;

procedure TfrmRedPresAdministracionCartas.Do_ImprimirCartaErr(ica_id: integer);
var sSalida: TSalidaReport;
    sModulo, sArea, sNombrePdf : string;
    IdCarta, iCartaEmp: integer;
    tModulo: TTipoModulo;
    bVentanilla, bEsSinGobernacion, bFaltaDirEmp, bFaltaDirTrab: boolean;
begin
  bFaltaDirEmp       := False;
  bFaltaDirTrab      := False;

  sSalida := srPrint;
  sArea   := sdqCartasErr.FieldByName('at_area').AsString;
  sModulo := sdqCartasErr.FieldByName('at_modulo').AsString;
  IdCarta := sdqCartasErr.FieldByName('ca_id').AsInteger;

  // el boton para reimprimir las cartas con error, esta hecho solo para Redpres (directiva de compilacion), pero por las dudas pongo esto completo
  if (sArea = AREA_MED) then
    tModulo := taAreaMedica
  else if (sArea = AREA_SIN) then
    tModulo := taSiniestros
  else if (sArea = AREA_INC) then
    tModulo := taIncapacidades
  else if (sArea = AREA_RECA) then
    tModulo := taRecalificacion
  else if (sArea = AREA_DIN) then
    tModulo := taDinerarias
  else
    tModulo := taLegales;

  bEsSinGobernacion   := Is_SiniestroDeGobernacion(sdqCartasErr.FieldByName('ex_id').AsInteger) or
                         (Get_Holding(SacarGuiones(sdqCartasErr.FieldByName('cuit').AsString)) = 'GBA');

  if sSalida = srPdf then   // lo pongo por si despues lo modifican
  begin
    sNombrePdf  := GetNombreCartaPdf(IdCarta);
    bVentanilla := True;
  end else
  begin
    sNombrePdf  := '';
    bVentanilla := False;
  end;

  if not(bFaltaDirEmp) and not(bFaltaDirTrab) then
  begin
    DoImprimirCarta(IdCarta, tModulo, sSalida, tmNone, 3,                                 // Carta a la Empresa
                    True, True, False, False, True, True, False, True, bEsSinGobernacion,
                    True, False, IIF(tModulo = taLegales, True, False),
                    False, '', False, sdqCartasErr.FieldByName('nrocartadoc').IsNull,
                    sNombrePdf, False,
                    bVentanilla);

    iCartaEmp := idCarta;
    //si el destinatario es "ambos", y no tiene Nro de Carta, significa que es la primera vez y
    //por lo tanto tengo insertar la carta del trabajador e imprimirla
    Application.ProcessMessages;
    idCarta := DoInsertarCarta(IIF((sdqCartasErr.FieldByName('tc_formatorel').AsInteger = 0),
                                     sdqCartasErr.FieldByName('tc_id').AsInteger,
                                     sdqCartasErr.FieldByName('tc_formatorel').AsInteger),
                                 sdqCartasErr.FieldByName('ex_siniestro').AsInteger,
                                 sdqCartasErr.FieldByName('ex_orden').AsInteger,
                                 sdqCartasErr.FieldByName('ex_recaida').AsInteger,
                                 sdqCartasErr.FieldByName('codigofirma').AsString,
                                 sArea, False, ART_EMPTY_ID, tdTrabajador,
                                 sdqCartasErr.FieldByName('ca_observaciones').AsString,
                                 sdqCartasErr.FieldByName('ca_ideventoinca').AsInteger,
                                 sdqCartasErr.FieldByName('ca_fechaaltamedica').AsDateTime, 0,
                                 0, 0, '', sdqCartasErr.FieldByName('ca_evento').AsInteger,
                                 sdqCartasErr.FieldByName('ca_id').AsInteger,
                                 sdqCartasErr.FieldByName('ca_eventoabandono').AsInteger,
                                 Sesion.UserID,
                                 sdqCartasErr.FieldByName('ca_idavaldigital').AsInteger,
                                 sdqCartasErr.FieldByName('ca_motivorechazobase').AsString);
    DoActualizarTurno(iCartaEmp, IdCarta);
    Delay(1000); //
    Application.ProcessMessages;
    DoImprimirCarta(IdCarta, tModulo, sSalida, tmNone, 3,
                    True, True, False, False,
                    True, True, False, True, bEsSinGobernacion, True, False,
                    IIF(tModulo = taLegales, True, False), False, '', False,
                    False, '', False, False);
  end;

  tbRefrescarErrClick(nil);
end;

procedure TfrmRedPresAdministracionCartas.ToolButton10Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRedPresAdministracionCartas.ValidacionesAdicRegistrosImpresionCartaDoc;
begin
  Verificar(Is_EmpresaConfidencial(sdqConsulta.FieldByName('ex_siniestro').AsInteger,
                                   sdqConsulta.FieldByName('ex_orden').AsInteger,
                                   sdqConsulta.FieldByName('ex_recaida').AsInteger), Grid, 'Alguna de las cartas documento pertenece a una empresa confidencial.');
end;

procedure TfrmRedPresAdministracionCartas.ValidacionesAdicRegistrosEnvioVentElectronica;
begin
  inherited;
end;

procedure TfrmRedPresAdministracionCartas.ValidarImprimirCartasSiniestroVencido(IdCCA, IdExpediente: integer; var bEsSiniVencido: boolean);  // TK 54662
var sSql, sSinOrdRec: string;
begin
  bEsSiniVencido := False;
  sSql := 'SELECT tc_validavencimiento ' +
           ' FROM ctc_textocarta, cca_carta ' +
          ' WHERE ca_idtextocarta = tc_id ' +
            ' AND ca_id = :idCCA ';

  with GetQueryEx(sSql, [IdCCA]) do
  try
    sSinOrdRec := ValorSqlEx(' SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) SinOrdRec ' +
                               ' FROM art.sex_expedientes ' +
                              ' WHERE ex_id = :exped ',[IdExpediente]);

    if (FieldByName('tc_validavencimiento').AsString = 'S') and
       (not Seguridad.Claves.IsActive('ImprimirCartasSiniVencidos')) and
        EsSiniestroVencido(IdExpediente)  then
    begin
      DoInsertarCartaenTemporal('V');
      bEsSiniVencido := True;
    end;

  finally
    Free;
  end;
end;

function TfrmRedPresAdministracionCartas.EsSiniestroVencido(IdExpediente: integer): boolean;    // TK 54662
var dFechaRecepcion, d10diashabiles, d10Mas20diascorridos: TDateTime;
    sSql, sCausaFin, sSuspPlazo: string;
begin
  Result := False;

  sSql := 'SELECT ex_fecharecepcion, ex_causafin, ex_suspensionplazo FROM art.sex_expedientes ' +
          ' WHERE ex_id = :idexp';

  with GetQueryEx(sSql, [IdExpediente]) do
  try
    dFechaRecepcion := FieldByName('ex_fecharecepcion').AsDateTime;
    sCausaFin       := FieldByName('ex_causafin').AsString;
    sSuspPlazo      := FieldByName('ex_suspensionplazo').AsString;
    d10diashabiles  := ValorSqlDateTime('SELECT art.amebpba.calcdiashabiles (' + SqlDate(dFechaRecepcion) + ', 10) ' +
                                         ' FROM dual ');
    d10Mas20diascorridos := d10diashabiles + 20; // 20 dias corridos a partir de los 10 habiles.

    if ((sCausaFin = '02') and (d10diashabiles < dbdate)) OR            // Si el siniestro esta rechazado y los 10 dias habiles ya pasaron => esta vencido
       ((sSuspPlazo = 'S') and (d10Mas20diascorridos < dbdate)) then    // Si el siniestro esta suspendido y los 10 habiles + 20 corridos ya pasaron => esta vencido
      Result := True;

  finally
    Free;
  end;
end;

procedure TfrmRedPresAdministracionCartas.DoInsertarCartaenTemporal(sLetra:string);
var sSql: string;
begin
  sSql := 'INSERT INTO tmp_dirincompletas' +
          '(mp_usuario, mp_sincompleto, mp_nombreempr, ' +
          ' mp_nombretrab, mp_nombrecommed, mp_formato, mp_tipo) VALUES (' +
           SqlValue(Sesion.UserID) + ',' +
           SqlValue(sdqConsulta.FieldByName('siniestro').AsString)  + ',' +
           SqlValue(sdqConsulta.FieldByName('empresa').AsString)    + ',' +
           SqlValue(sdqConsulta.FieldByName('trabajador').AsString) + ',' +
           SqlValue(sdqConsulta.FieldByName('commed').AsString)  + ',' +
           SqlValue(sdqConsulta.FieldByName('tc_codigo').AsString)  + ',' +
           SqlValue(sLetra) + ')';
  EjecutarSql(sSql);
end;

procedure TfrmRedPresAdministracionCartas.edSiniestroSelect(Sender: TObject);
begin
  if (not ValidarSiniestroUsuarioTerce(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)) then   // por Plan Ioma - Tercerizadoras
  begin
    InfoHint(edSiniestro, 'Usted no posee permisos para visualizar este siniestro.');
    tbLimpiarClick(nil);
  end;
end;

end.
