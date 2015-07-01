unit unAMPAdministracionCartas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unBaseAdministracionCartas, SDEngine, Menus,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, ComCtrls,
  StdCtrls, unFraDomicilioTrab, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, CardinalEdit,
  ToolWin, ToolEdit, DateComboBox, unFraUsuario, ComboEditor, CheckCombo, unFraStaticCTB_TABLAS, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, Mask, PatternEdit, IntEdit, unArtDbFrame, unFraEmpresa, unArt,
  unFraCodigoDescripcion, unImpoExpoWizard, SinEdit, unFraEstablecimiento,
  DBCheckCombo, unfraCtbTablas, unfraFirmante, unFraSDA_DETALLEARCHIVO;

type
  TfrmAMPAdministracionCartas = class(TfrmBaseAdministracionCartas)
    fraEmpresaDeudora: TfraEmpresa;
    fraEmpresaDatosCartaDoc: TfraEmpresa;
    fraEmpresaDatosActuales: TfraEmpresa;
    gbLote: TGroupBox;
    edLote: TIntEdit;
    gbEstablecimiento: TGroupBox;
    fraEstablecimiento: TfraEstablecimiento;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRecepcionMasivaClick(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure tbRecepcionDocumClick(Sender: TObject);
    procedure edNroCartaDocDesdeExit(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
//    function EsConfidencial(sCuit :String) :Boolean;
    function UnaFilaSeleccionada: Boolean;
    function ValidarDireccion(IdTrabEmp: Integer; bEsEmpresa: Boolean): Boolean;

    procedure DoLimpiarTemporal;
  protected
    function GetSql: String; override;
    function GetWhere: String; override;
    
    procedure DoCargarDatosActuales(IdEndoso: TTableId); override;
    procedure DoCargarDatosCartaDoc(IdEndoso: TTableId); override;

    procedure InicializarComponentes; override;
    procedure NuevaCarta(Sender: TObject); override;
    procedure OnEmpresaDeudoraChange(Sender : TObject);

    procedure ValidacionesAdicRegistrosImpresionCartaDoc; override;
    procedure ValidacionesAdicRegistrosEnvioVentElectronica; override;
  public
    procedure MostrarCarta(IdCarta: integer); override;
  end;

implementation

uses
  AnsiSql, unComunes, unCustomDataModule, unRptCartaDocumento, unCobranzas, unDmPrincipal, CustomDlgs, Printers,
  unRptCartaDocHeader, General, unSesion, unCustomConsulta, unGeneracionCartasAdmin, unPrincipal;

{$R *.DFM}

procedure TfrmAMPAdministracionCartas.DoCargarDatosActuales(IdEndoso: TTableId);
var
  sSql: String;
begin
  inherited;

  // datos de la empresa
  sSql :=
    'SELECT hm_nombre rsocial, hm_cuit cuit, hc_contrato contrato' +
     ' FROM ahm_historicoempresa, ahc_historicocontrato, aen_endoso, afo_formulario' +
    ' WHERE en_id = ' + SqlValue(IdEndoso) +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND en_idhistoricocontrato = hc_id' +
      ' AND hc_idformulario = fo_id';

  with GetQuery(sSql) do
  try
    if not IsEmpty then
      with fraEmpresaDatosActuales do
      begin
        mskCUIT.Text     := FieldByName('CUIT').AsString;
        cmbRSocial.Text  := FieldByName('RSOCIAL').AsString;
        edContrato.Value := FieldByName('CONTRATO').AsInteger;
      end;
  finally
    Free;
  end;
end;

procedure TfrmAMPAdministracionCartas.DoCargarDatosCartaDoc(IdEndoso: TTableId);
var
  sSql: String;
begin
  inherited;

  // datos de la empresa
  sSql :=
    'SELECT hm_nombre rsocial, hm_cuit cuit, hc_contrato contrato' +
     ' FROM ahm_historicoempresa, ahc_historicocontrato, aen_endoso, afo_formulario' +
    ' WHERE en_id = ' + SqlValue(IdEndoso) +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND en_idhistoricocontrato = hc_id' +
      ' AND hc_idformulario = fo_id';

  with GetQuery(sSql) do
  try
    if not IsEmpty then
      with fraEmpresaDatosCartaDoc do
      begin
        mskCUIT.Text     := FieldByName('CUIT').AsString;
        cmbRSocial.Text  := FieldByName('RSOCIAL').AsString;
        edContrato.Value := FieldByName('CONTRATO').AsInteger;
      end;
  finally
    Free;
  end;
end;

function TfrmAMPAdministracionCartas.GetSql: String;
var
  sCAT: String;
  sSql: String;
begin
  if not fraEmpresaDeudora.IsEmpty then
    sCAT := ''''' || '  // para que no utilice el índice por AT_AREA
  else
    sCAT := '';

  sSql :=
    'SELECT utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocartadoc, utiles.armar_cuit(em_cuit) cuit,' +
          ' em_nombre empresa, es_contrato contrato, tc_nombre tipocarta, tc_destinatario, tc_id,' +
          ' correo.tb_descripcion ultcorreo, ca_usuimpresion, em_cuit,  TRUNC(ca_fechaimpresion) fechaimpresion,' +
          ' lc_idlote lote, DECODE(ca_recepcionok, ''S'', ''Sí'', ''No'') recepcionok, ca_fecharecepcion,' +
          ' codre.tb_descripcion desc_recepcion, TO_CHAR(fi_id) codigofirma, fi_firmante,' +
          ' TRUNC(ca_fechareimpresion) fechareimpresion, ca_observaciones, ca_usureimpresion, ca_id, ca_manual,' +
          ' ca_fechabaja, NVL(ca_correoreimpresion, ca_correo) correo, ca_idcartaareemplazar, ca_recepcionok,' +
          ' ca_codrecepcion, NULL ca_idformulario, ca_idendoso, ca_usualta, TRUNC(ca_fechaalta) fechaalta, el_nombre,' +
          ' ca_idareatexto, NULL porcvariable, NULL sumafija, at_area, tc_formatorel, tc_codigo,' +
          ' ca_idrecepcioncartadoc, rc_codigobarras_cd trackytrace, ca_ideventoinca, ca_fechaaltamedica, ''N'' tc_textomodificable, ' +
          ' NVL(ca_ventanilla, ''N'') ca_ventanilla, ca_idtextocarta, at_modulo ' +
     ' FROM crc_recepcioncartadoc, ctc_textocarta, cfi_firma, ctb_tablas salida, ctb_tablas correo, ctb_tablas codre,' +
          ' cat_areatexto, cta_textoarea, del_delegacion, cca_carta, afi.aem_empresa, afi.aco_contrato,' +
          ' afi.aes_establecimiento, hys.hlc_lotecartadoc' +
    ' WHERE ca_idtextocarta = tc_id' +
      ' AND ta_idtextocarta = tc_id' +
      ' AND ta_idareatexto = at_id' +
      ' AND ca_idareatexto = at_id' +
      ' AND ' + sCAT + 'at_area IN ('+ Area + ')' +
      ' AND correo.tb_codigo(+) = NVL(ca_correoreimpresion, ca_correo)' +
      ' AND correo.tb_clave(+) = ''CORRE''' +
      ' AND codre.tb_codigo(+) = ca_codrecepcion' +
      ' AND codre.tb_clave(+) = ''CODRE''' +
      ' AND salida.tb_clave = ''TSCDO''' +
      ' AND salida.tb_codigo = ca_tiposalida' +
      ' AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id' +
      ' AND em_id = co_idempresa' +
      ' AND co_contrato = es_contrato' +
      ' AND es_id = lc_idestableci' +
      ' AND ca_iddelegacion = el_id(+)' +
      ' AND ca_idrecepcioncartadoc = rc_id(+)' +
      ' AND ca_id = lc_idcarta ' + GetWhere;

  Result := sSql;
end;

function TfrmAMPAdministracionCartas.GetWhere: String;
var
  sSql: String;
begin
  if not fraEmpresaDeudora.IsEmpty then
    sSql := ' AND es_contrato = ' + SqlInt(fraEmpresaDeudora.Contrato);

  if not fraEstablecimiento.IsEmpty then
    sSql := ' AND lc_idestableci = ' + SqlInt(fraEstablecimiento.Value);

  if edLote.Value > 0 then
    sSql := ' AND lc_idlote = ' + SqlInt(edLote.Value);

  Result := inherited GetWhere + sSql;
end;

procedure TfrmAMPAdministracionCartas.InicializarComponentes;
begin
  inherited;
(*
  tbCalcularTotal.ImageIndex      := 26;
  tbRecepcion.ImageIndex          := 31;
  tbRecepcionMasiva.ImageIndex    := 24;
  tbReemplazo.ImageIndex          := 30;
  tbTrackTrace.ImageIndex         := 15;
*)
  fraEmpresaDatosCartaDoc.Locked  := True;
  fraEmpresaDatosActuales.Locked  := True;
  fraEmpresaDeudora.ShowBajas     := True;
end;

procedure TfrmAMPAdministracionCartas.NuevaCarta(Sender: TObject);
begin
  with TfrmGeneracionCartasAdmin.Create(Self) do
  try
    if Sender = tbNuevo then
    begin
      fraEmpresa.Value := fraEmpresaDeudora.Value;
      IDEstableci := fraEstablecimiento.Value;
      IDLote := edLote.Value;
      IdCarta := ART_EMPTY_ID
    end
    else
    begin
      fraEmpresa.Contrato := sdqConsulta.FieldByName('contrato').AsInteger;
      IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;
    end;

    CodArea := Self.Area;
    
    Preparar(IdCarta);

    if Mostrar and sdqConsulta.Active then
      sdqConsulta.Refresh;
  finally
    free;
  end;
end;

procedure TfrmAMPAdministracionCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaDeudora.Clear;
  fraEstablecimiento.Clear;
  edLote.Clear;
end;

procedure TfrmAMPAdministracionCartas.tbRecepcionMasivaClick(Sender: TObject);
begin
  ImpoExpoWizard('RECCD');
end;

procedure TfrmAMPAdministracionCartas.btnCancelarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;

procedure TfrmAMPAdministracionCartas.btnAceptarImpresionClick(Sender: TObject);
var
  i: Integer;
  IdCarta: Integer;
  OldImpresora{, idTrabajador}: Integer;
  tModulo: TTipoModulo;
  sSalida: TSalidaReport;
  {bEsConfidencial, }bFaltanDirecciones, bEsSinGobernacion, bALaEmpresa:Boolean;
begin
  inherited;

  if ContinuarImpresion() then
  begin
    OldImpresora := Printer.PrinterIndex;
    Printer.PrinterIndex := cmbImpresoras.ItemIndex;
    try
      PararImpresion := False;
      btnParar.Enabled := True;
      DoLimpiarTemporal;
      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        Verificar(PararImpresion, btnAceptarImpresion, 'Ha decidido cancelar la impresión.');

        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
        IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;
        if (sdqConsulta.FieldByName('AT_AREA').AsString = AREA_MED) then
          tModulo := taAreaMedica
        else if (sdqConsulta.FieldByName('AT_AREA').AsString = AREA_SIN) then
          tModulo := taSiniestros
        else if (sdqConsulta.FieldByName('AT_AREA').AsString = AREA_INC) then
          tModulo := taIncapacidades
        else if (sdqConsulta.FieldByName('AT_AREA').AsString = AREA_MLB) then
          tModulo := taAreaMedlab
        else tModulo := taDinerarias;

        if rbPreview.Checked then
          sSalida := srPreview
        else
          sSalida := srPrint;

        bEsSinGobernacion   := false;
        bALaEmpresa         := true;
        //idTrabajador        := 0;
        bFaltanDirecciones  := not ValidarDireccion(sdqConsulta.FieldByName('CA_IDENDOSO').AsInteger, bALaEmpresa);
        //bEsConfidencial     := EsConfidencial(sdqConsulta.FieldByName('em_cuit').AsString);

        if bFaltanDirecciones then
        begin
          MsgBox('No se puede emitir la carta porque el destinatario no posee una dirección válida.', 0, 'Datos Inválidos');
          DoLimpiarTemporal;
        end
        else
          DoImprimirCarta(IdCarta, tModulo, sSalida, tmBeginEnd, edCantCopias.Value, True, True,
                          False, False, True, False, False, True, bEsSinGobernacion, True);
        BarProgreso.Position := Round((i + 1) / Grid.SelectedRows.Count * 100);
        Application.ProcessMessages;
      end;
      fpOpcionesImpresion.ModalResult := mrOk;
      Grid.UnSelectAll;
      sdqConsulta.Refresh;
    finally
      Printer.PrinterIndex := OldImpresora;
      btnParar.Enabled := False;
    end;
  end;    
end;
{-------------------------------------------------------------------------------
function TfrmAMPAdministracionCartas.EsConfidencial(sCuit :String) :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT afiliacion.IsEmpresaConfidencial(NVL(' + SqlValue(sCuit) + ', '' '')) FROM dual';
  Result := (ValorSql(sSql) = 'S');
end;
{-------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.MostrarCarta(IdCarta: integer);
begin
//
end;
{-------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.DoLimpiarTemporal;
var
  sSql :String;
begin
  sSql := 'DELETE FROM tmp_dirincompletas ' +
          ' WHERE mp_usuario = ' + SqlValue(Sesion.UserID);
  EjecutarSql(sSql);
end;
{-------------------------------------------------------------------------------}
function TfrmAMPAdministracionCartas.ValidarDireccion(IdTrabEmp :Integer; bEsEmpresa :Boolean): Boolean;
var
  sSql :String;
  SqlResults :TStringList;
begin
  if bEsEmpresa then
    sSql := 'SELECT hm_nombre empresa, null trabajador, hd_cpostal cpostal, ' +
                  ' hd_localidad localidad, pv_descripcion provincia, hd_calle calle ' +
            ' FROM aen_endoso, ahm_historicoempresa, ' +
                  ' ahd_historicodomicilio, cpv_provincias ' +
           ' WHERE hm_id = en_idhistoricoempresa ' +
             ' AND hd_id = en_idhistoricodomicilio ' +
             ' AND hd_provincia = pv_codigo(+) ' +
             ' AND en_id = ' + SqlInt(IdTrabEmp)
  else
    sSql := 'SELECT null empresa, tj_nombre trabajador, tj_cpostal cpostal, ' +
                  ' tj_localidad localidad, pv_descripcion provincia, tj_calle calle ' +
            ' FROM ctj_trabajador, cpv_provincias ' +
           ' WHERE tj_provincia = pv_codigo(+) ' +
             ' AND tj_id = ' + SqlInt(IdTrabEmp);

  SqlResults := ValoresColSql(sSql);
  try
    if (SqlResults[2] = '') or (SqlResults[3] = '') or
       (SqlResults[4] = '') or (SqlResults[5] = '') then
    begin
      sSql := ' INSERT INTO tmp_dirincompletas ' +
              ' (mp_usuario, mp_sincompleto, mp_nombretrab, mp_nombreempr, mp_formato) VALUES (' +
              SqlValue(Sesion.UserID) + ',' + SqlValue(sdqConsulta.FieldByName('SINIESTRO').AsString) + ',' +
              SqlValue(SqlResults[1]) + ',' + SqlValue(SqlResults[0]) + ',' +
             SqlValue(sdqConsulta.FieldByName('TC_CODIGO').AsString) + ')';
      EjecutarSql(sSql);
      Result := False;
    end
    else Result := True;

  finally
     SqlResults.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.tbRecepcionDocumClick(Sender: TObject);
begin
  if UnaFilaSeleccionada and (fpRecepcionCartaDoc.ShowModal = mrOk) then
    sdqConsulta.Refresh;
end;
{-------------------------------------------------------------------------------}
function TfrmAMPAdministracionCartas.UnaFilaSeleccionada :Boolean;
begin
  Result := False;
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla.')
  else
    Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.edNroCartaDocDesdeExit(Sender: TObject);
begin
  inherited;
  if edNroCartaDocHasta.Text = '3779' then edNroCartaDocHasta.Text := edNroCartaDocDesde.Text;
end;
{------------------------------------------------------------------------------}
(*procedure TfrmAMPAdministracionCartas.cmbModuloChange(Sender: TObject);
begin

  if not cmbModulo.IsEmpty then
    fraCodTexto.Sql := 'SELECT tc_id AS ' + CD_ALIAS_ID + ', ' +
                             ' tc_id AS ' + CD_ALIAS_CODIGO + ', ' +
                             ' tc_nombre AS ' + CD_ALIAS_DESC + ', ' +
                             ' tc_fechabaja AS ' + CD_ALIAS_BAJA +
                        ' FROM ctc_textocarta, cta_textoarea ' +
                       ' WHERE tc_id = ta_idtextocarta ' +
                         ' AND ta_idareatexto = ' + SqlValue(fraModulo.Value)
  else
    fraCodTexto.Sql := 'SELECT DISTINCT tc_id AS ' + CD_ALIAS_ID + ', ' +
                                      ' tc_id AS ' + CD_ALIAS_CODIGO + ', ' +
                                      ' tc_nombre AS ' + CD_ALIAS_DESC + ', ' +
                                      ' tc_fechabaja AS ' + CD_ALIAS_BAJA + ' ' +
                                 ' FROM ctc_textocarta, cat_areatexto, cta_textoarea ' +
                                ' WHERE tc_id = ta_idtextocarta ' +
                                  ' AND at_id=ta_idareatexto ' +
                                  ' AND at_area IN (' + SqlValue(Area) + ')';

end;*)
{------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.tbNuevoClick(Sender: TObject);
  function ExisteLote(idLote, idEstableci: integer): boolean;
  begin
    Result := ExisteSqlEx('SELECT 1 ' +
                          '  FROM hys.hel_estadolote, hys.hrl_relevamientolote ' +
                          ' WHERE el_estado = ''T'' ' +
                          '   AND rl_id = el_rlid ' +
                          '   AND rl_idestableci = :pidestableci ' +
                          '   AND el_idlote = :pidlote ',
                          [idEstableci, idLote])
  end;
begin
  VerificarMultiple(['Nueva Carta Documento',
                     edLote,
                     edLote.Value > 0,
                     'Debe indicarse el Nro. de Lote para el cual se emitirá la Carta Documento',
                     fraEmpresaDeudora,
                     not (fraEmpresaDeudora.IsEmpty),
                     'Debe indicarse la Empresa para la cual se emitirá la Carta Documento',
                     fraEstablecimiento,
                     not (fraEstablecimiento.IsEmpty),
                     'Debe indicarse el Establecimiento de la Empresa para la cual se emitirá la Carta Documento',
                     edLote,
                     ExisteLote(edLote.Value, fraEstablecimiento.Value),
                     'No existe el Lote para el Establecimiento indicado o no está aún Terminado'
                    ]);

  NuevaCarta(Sender);
end;
{------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.FormCreate(Sender: TObject);
begin
  inherited;
  IMG_FILTROS_SHOW := 17;
  IMG_FILTROS_HIDE := 18;

  fraEmpresaDeudora.OnChange := OnEmpresaDeudoraChange;
end;
{------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.OnEmpresaDeudoraChange(Sender: TObject);
begin
  fraEstablecimiento.IdEmpresa := fraEmpresaDeudora.Value;
  sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.ValidacionesAdicRegistrosImpresionCartaDoc;
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAMPAdministracionCartas.ValidacionesAdicRegistrosEnvioVentElectronica;
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

