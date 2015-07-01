unit unCartaNotificacionAltas;

{-----------------------------------------------------------------------------
 Unit Name: unCartaNotificacionAltas
 Author:    camarillo
 History:   creacion 01/09/2006
-----------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, ToolEdit, CheckPanel, unfraPrestador,
  DateComboBox, Mask, PatternEdit, IntEdit, undmprincipal, unfraDelegacion, unArtFrame, unFraCodigoDescripcion,
  unfraFirmantes, FormPanel, unMoldeEnvioMail, Menus, Buttons, unArtDBAwareFrame, unArtDbFrame,
  unFraGrupoTrabajo, unfraCtbTablas;

type
  TfrmCartaNotificacionAltas = class(TfrmCustomConsulta)
    pnlGTrabajo: TCheckPanel;
    pnlDelegacion: TCheckPanel;
    fraDelegacion: TfraDelegacion;
    fpEmisionCarta: TFormPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TxtCarta: TMemo;
    TxtEmail: TEdit;
    SDQPDF: TSDQuery;
    MnuPrint: TPopupMenu;
    mnuImprimirCartaSel: TMenuItem;
    ImprimirCartaTodosRegistrosGrupo: TMenuItem;
    btnImprimir: TBitBtn;
    btnEnviarMail: TBitBtn;
    btnCancelar: TBitBtn;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    fraFirmantes: TfraFirmantes;
    pnlSiniestro: TCheckPanel;
    Label1: TLabel;
    edSiniDesde: TIntEdit;
    edSiniHasta: TIntEdit;
    pnlFechaAlta: TCheckPanel;
    Label2: TLabel;
    deFechaDesde: TDateComboBox;
    deFechaHasta: TDateComboBox;
    pnlPrestador: TCheckPanel;
    fraPrestador: TfraPrestador;
    pnlEnviadas: TCheckPanel;
    cmbEnviadas: TComboBox;
    chkRegionSanitPrest: TCheckPanel;
    fraRegionSanitaria: TfraCtbTablas;
    procedure pnlGTrabajoChange(Sender: TObject);
    procedure pnlDelegacionChange(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure mnuImprimirCartaSelClick(Sender: TObject);
    procedure EnviarImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlSiniestroChange(Sender: TObject);
    procedure pnlFechaAltaChange(Sender: TObject);
    procedure pnlPrestadorChange(Sender: TObject);
    procedure pnlEnviadasChange(Sender: TObject);
    procedure chkRegionSanitPrestChange(Sender: TObject);
  private
    psRegistros: String;
    psTipoSalida: String;    
    sDescripcionCarta: String;

    function DoEnviarImprimirCarta(TipoSalida: String): Boolean;
    function EmitirCarta: Boolean;
    function GetSqlCartaPrestador(Siniestro, Orden, Recaida, Prestador, Firma: Integer;
                                  TipoSalida: String; ExisteCarta: Boolean): String;

    procedure DoObtenerTextoCarta(var sTextoCarta, sDescripcion: String);
  public
  end;

var
  frmCartaNotificacionAltas: TfrmCartaNotificacionAltas;
  QueryforRpt: String;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, unRptRechPr, unArt, unExportPDF, ArchFuncs,
  General, CustomDlgs, uncomunes, unTercerizadoras;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.pnlGTrabajoChange(Sender: TObject);
begin
  if pnlGTrabajo.Checked then
    fraGrupoTrabajo.cmbDescripcion.DoDropDown
  else
    fraGrupoTrabajo.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.pnlDelegacionChange(Sender: TObject);
begin
  fraDelegacion.Enabled := pnlDelegacion.Checked;
  if pnlDelegacion.Checked then
    fraDelegacion.cmbDescripcion.DoDropDown
  else
    fraDelegacion.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) SOR, ex_siniestro, ex_orden, ex_recaida,' +
          ' em_nombre, tj_cuil, tj_nombre, pe_fechaalta, pe_fechaaltalaboral,' +
          ' NVL(ex_fecharecaida, ex_fechaaccidente) F_Acci, prCabecera.ca_codarea || '' '' || prCabecera.ca_telefono Cab_ca_telefono, prCabecera.ca_identificador,' +
          ' prCabecera.ca_descripcion || ''('' || prCabecera.ca_identificador || '')'' PRCP,' +
          ' ''('' || prCabecera.ca_codpostal || '') '' || prCabecera.ca_localidad CPLOC, prCabecera.ca_domicilio,' +
          ' prCabecera.ca_descripcion Prestador, prCabecera.ca_direlectronica, cp_accion, cp_observaciones,' +
          ' cp_fechaimpresion, ex_gtrabajo, ex_delegacion, gp_nombre gtrabajo, lg_nombre delegacion,' +
          ' tiposalida.tb_descripcion TipoSalidaDescr, NVL(cp_fechaimpresion, art.actualdate) FechaImpresion,' +
          ' tipoegreso.te_descripcion tipoegreso, siniestro.get_usuariogestor(ex_id) USUGESTOR, region.tb_descripcion RegSanitPrest ' +
     ' FROM mgp_gtrabajo, dlg_delegaciones, sex_expedientes, ctj_trabajador, cpr_prestador prEgreso,' +
          ' cpr_prestador prCabecera, aem_empresa, mcp_cartarechazoprestador, ctb_tablas tiposalida,' +
          ' sin.ste_tipoegreso tipoegreso, sin.spe_partedeegreso, art.crp_regionesprestador, art.ctb_tablas region ' +    // TK 26875
    ' WHERE ex_id = pe_idexpediente' +
      ' AND ex_cuil = tj_cuil' +
      ' AND ex_cuit = em_cuit' +
      ' AND prEgreso.ca_identificador = pe_idprestador' +
      ' AND pregreso.ca_notificaalta = ''S'' ' +

      ' AND prCabecera.ca_identificador = art.siniestro.get_prestadorcabecera(ex_siniestro, ex_orden, ex_recaida)' +
      ' AND ex_siniestro = cp_siniestro(+)' +
      ' AND ex_orden = cp_orden(+)' +
      ' AND ex_recaida = cp_recaida(+)' +
      ' AND cp_accion(+) = ''L''' +
      ' AND cp_fechabaja IS NULL' +
      ' AND tiposalida.tb_clave(+) = ''TIPSA''' +
      ' AND tiposalida.tb_codigo(+) = cp_tiposalida' +
      ' AND te_id = pe_idtipodeegreso' +
      ' AND ex_delegacion = lg_codigo' +
      ' AND ex_gtrabajo = gp_codigo' +
      ' AND RP_PRESTADOR(+) = prCabecera.CA_IDENTIFICADOR ' +     // TK 26875
      ' AND region.tb_clave(+) = ''REGSA'' ' +
      ' AND region.tb_codigo(+) = rp_region ' +
      ' AND rp_domicilio(+) = ''S'' ' ;

  if (pnlSiniestro.Checked) and (edsinidesde.Text <> '') and (edsinihasta.Text <> '') then
    sSql := sSql + ' AND ex_siniestro BETWEEN ' + edsinidesde.Text + ' AND ' + edsinihasta.Text;

  if (pnlFechaAlta.Checked) and (not deFechaDesde.IsEmpty) and (not deFechaHasta.IsEmpty) then
    sSql := sSql + ' AND pe_fechaalta BETWEEN ' + deFechaDesde.SqlText + ' AND ' + deFechaHasta.SqlText;

  if pnlEnviadas.Checked then
    if (cmbEnviadas.ItemIndex = 0) then
      sSql := sSql + ' AND cp_fechaimpresion IS NOT NULL '
    else if (cmbEnviadas.ItemIndex = 1) then
      sSql := sSql + ' AND cp_fechaimpresion IS NULL ';

  if (pnlPrestador.Checked) and (fraprestador.IDPrestador <> 0) then
    sSql := sSql + ' AND prCabecera.ca_identificador=' + SqlInt(fraprestador.IDPrestador);

  if (pnlgtrabajo.Checked) and not (fraGrupoTrabajo.IsEmpty) then
  begin
    sSql := sSql + ' AND NVL(ex_gtrabajo, '''') =' + SqlValue(fraGrupoTrabajo.Codigo);

    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
       sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
  end;

  if (pnldelegacion.Checked) and not (fraDelegacion.IsEmpty) then
    sSql := sSql + ' AND NVL(ex_delegacion, '''')=' + SqlValue(fraDelegacion.Codigo);

  if EsUsuarioDeTercerizadora then
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if (chkRegionSanitPrest.Checked) and not (fraRegionSanitaria.IsEmpty) then   // TK 26875
    sSql := sSql + ' AND rp_region = ' + SqlValue(fraRegionSanitaria.Codigo);

  sdqconsulta.SQL.text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
function TfrmCartaNotificacionAltas.EmitirCarta: Boolean;
var
  sTextoCarta: String;
begin
  LockControl(TxtEmail, False);
  LockControl(TxtCarta, False);
  TxtEmail.Text := sdqConsulta.FieldByName('ca_direlectronica').AsString;
  DoObtenerTextoCarta(sTextoCarta, sDescripcionCarta);
  TxtCarta.Text := sTextoCarta;
  fraFirmantes.Limpiar;
  Result := (fpEmisionCarta.ShowModal = mrOk);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.DoObtenerTextoCarta(var sTextoCarta, sDescripcion: String);
var
  sSql: String;
begin
  sSql := 'SELECT tp_texto, tp_descripcion' +
           ' FROM ctp_textocartaprestador' +
          ' WHERE tp_accion = ''L''';

  with GetQuery(sSql) do
  try
    if IsEmpty then
    begin
      sTextoCarta  := '';
      sDescripcion := '';
    end
    else begin
      sTextoCarta  := AdjustLineBreaks(FieldByName('tp_texto').AsString);
      sDescripcion := FieldByName('tp_descripcion').AsString;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCartaNotificacionAltas.DoEnviarImprimirCarta(TipoSalida: String): Boolean;
var
  Resultado: TResultadoEnvio;
  Rpt: trptCartaRech;
  sFileName: String;
  sSql: String;
begin
  Result := False;
  Rpt := trptCartaRech.Create(Self);
  try
    Rpt.sdqRPT.SQL.Text := QueryforRpt;
    Rpt.sdqRPT.Open;
    Rpt.qrlDiagnostico.Caption    := 'F.Alta M.';
    Rpt.qrdbDiagnostico.DataField := 'pe_fechaaltalaboral';
    Rpt.qrlDiagnostico.Width      := 65;
    Rpt.qrdbDiagnostico.Width     := 65;
    Rpt.TxtCuerpo.Lines.Add(TxtCarta.Text);
    Rpt.qrlFechaImpresion.Caption   := Rpt.sdqRPT.FieldByName('FechaImpresion').AsString;
    Rpt.qrlDescripcionCarta.Caption := 'Ref.: ' + sDescripcionCarta;
    Rpt.sdqFirma.ParamByName('pFirma').AsInteger := fraFirmantes.Value;
    Rpt.sdqFirma.Open;

    if (TipoSalida = 'M') then //si es por mail
    begin
      sFileName := IncludeTrailingBackslash(TempPath) +
                   'Notificación_Alta' +
                   Rpt.sdqRPT.fieldbyname('ex_siniestro').AsString +
                   Rpt.sdqRPT.fieldbyname('ex_orden').AsString +
                   Rpt.sdqRPT.fieldbyname('ex_recaida').AsString + '.PDF';
      ExportarPDF(Rpt, sFileName);
      Resultado := unMoldeEnvioMail.EnviarMailBDWithResults(TxtEmail.Text, 'Notificación de Alta Laboral.',
                                                            [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                                            'Se adjunta Notificación de Alta Laboral correspondiente.' +
                                                            CRLF + CRLF + 'Provincia ART', GetAttachments(sFileName, 7));
    end
    else
      Rpt.Preview; //si es por carta

    if (Resultado.EnvioOk) or (Rpt.bImpreso) then
    //actualizo o inserto en la mcp_cartarechazoprestador segun corresponda
    begin
      BeginTrans;
      try
        Rpt.sdqRPT.First;
        while not Rpt.sdqRPT.Eof do
        begin
          sSql := GetSqlCartaPrestador(Rpt.sdqRPT.FieldByName('ex_siniestro').AsInteger,
                                       Rpt.sdqRPT.FieldByName('ex_orden').AsInteger,
                                       Rpt.sdqRPT.FieldByName('ex_recaida').AsInteger,
                                       Rpt.sdqRPT.FieldByName('ca_identificador').AsInteger,
                                       fraFirmantes.Value, psTipoSalida,
                                       not(Rpt.sdqRPT.FieldByName('cp_fechaimpresion').IsNull));
          EjecutarSQLST(sSql);
          Rpt.sdqRPT.next;
        end;
        CommitTrans;
        Result := True;
      except
        on E: Exception do
        begin
          Rollback;
          raise Exception.Create(E.Message + CRLF + 'Error al grabar en la carta de rechazo al prestador.');
        end;
      end;
    end
    else
      Result := False;
  finally
    Rpt.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.EnviarImprimirClick(Sender: TObject);
begin
  if (Sender = btnEnviarMail) then
    Verificar((Trim(TxtEmail.Text) = ''), TxtEmail, 'No se puede emitir sin seleccionar un destinatario');

  Verificar(fraFirmantes.IsEmpty, fraFirmantes, 'No se puede emitir sin seleccionar un firmante.');
  Verificar((Trim(TxtCarta.Text) = ''), TxtCarta, 'No se puede emitir sin ingresar un texto de la carta.');

  if (Sender = btnEnviarMail) then
    psTipoSalida := 'M'
  else
    psTipoSalida := 'C';

  if DoEnviarImprimirCarta(psTipoSalida) then
    fpEmisionCarta.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.btnCancelarClick(Sender: TObject);
begin
  fpEmisionCarta.ModalResult := mrCancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.mnuImprimirCartaSelClick(Sender: TObject);
var
  bEmisionCartaOk: Boolean;
  iStartPosOrderBy: Integer;
begin
  if sdqconsulta.Active and not (sdqConsulta.Eof) then
  begin
    QueryforRpt      := sdqConsulta.SQL.Text;
    iStartPosOrderBy := FindComplexClause(QueryforRpt, SQL_ORDERBY);
    Delete(QueryforRpt, iStartPosOrderBy, MaxInt);

    if Sender = mnuImprimirCartaSel then
      psRegistros := 'RS'
    else if Sender = ImprimirCartaTodosRegistrosGrupo then
      psRegistros := 'TR';

    if psRegistros='RS' then
    //le agrego filtros al query para imprimir solo el regitro seleccionado
      QueryforRpt  := QueryforRpt + ' AND ex_siniestro=' + SqlInt(sdqConsulta.fieldbyname('ex_siniestro').AsInteger)  +
                                    ' AND ex_orden=' + SqlInt(sdqConsulta.fieldbyname('ex_orden').AsInteger) +
                                    ' AND ex_recaida=' + SqlInt(sdqConsulta.fieldbyname('ex_recaida').AsInteger)
    else if psRegistros = 'TR' then
    //le agrego filtros al query para imprimir solo los registros con el prestador del seleccionado
      QueryforRpt := QueryforRpt + ' AND prCabecera.ca_identificador=' + SqlInt(sdqConsulta.fieldbyname('ca_identificador').AsInteger);

    bEmisionCartaOk := EmitirCarta;
    if bEmisionCartaOk then
      RefreshData;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCartaNotificacionAltas.GetSqlCartaPrestador(Siniestro, Orden, Recaida, Prestador, Firma: Integer;
                                                         TipoSalida: String; ExisteCarta: Boolean): String;
var
  sSql: String;
begin
  if ExisteCarta then
    sSql :=
      'UPDATE mcp_cartarechazoprestador' +
        ' SET cp_fechaImpresion = ActualDate, ' +
            ' cp_usuimpresion = ' + SqlValue(Sesion.UserID) + ',' +
            ' cp_firma = ' + SqlInt(Firma) + ',' +
            ' cp_tiposalida = ' + SqlValue(TipoSalida) +
      ' WHERE cp_siniestro = ' + SqlInt(Siniestro) +
        ' AND cp_orden = ' + SqlInt(Orden) +
        ' AND cp_recaida = ' + SqlInt(Recaida) +
        ' AND cp_prestador = ' + SqlInt(Prestador) +
        ' AND cp_accion = ''L'' '
  else
    sSql := 'INSERT INTO mcp_cartarechazoprestador ' +
            ' (cp_siniestro, cp_orden, cp_recaida, cp_origen, cp_prestador, cp_accion, ' +
            ' cp_fechaalta, cp_usualta, cp_fechaimpresion, cp_usuimpresion, cp_firma,' +
            ' cp_tiposalida) VALUES ( ' +
            SqlInt(Siniestro) + ', ' + SqlInt(Orden) + ', ' + SqlInt(Recaida) + ',' +
            ' ''M'', ' + SqlInt(Prestador) + ', ''L'', ActualDate, ' +
            SqlValue(Sesion.UserID) + ', ActualDate, ' +
            SqlValue(Sesion.UserID) + ',' + SqlInt(Firma) + ',' +
            SqlValue(TipoSalida) + ')';

  Result := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  pnlSiniestro.Checked  := False;
  pnlFechaAlta.Checked  := False;
  pnlPrestador.Checked  := False;
  pnlGTrabajo.Checked   := False;
  pnlDelegacion.Checked := False;
  pnlEnviadas.Checked   := False;
  chkRegionSanitPrest.Checked := False; // TK 26875
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.FormCreate(Sender: TObject);
begin
  inherited;
  fraFirmantes.Area := AREA_RECHPR;
  with fraRegionSanitaria do  // TK 26875
  begin
    Clave     := 'REGSA';
    ShowBajas := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.pnlSiniestroChange(Sender: TObject);
begin
  edSiniDesde.Clear;
  edSiniHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.pnlFechaAltaChange(Sender: TObject);
begin
  deFechaDesde.Clear;
  deFechaHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.pnlPrestadorChange(Sender: TObject);
begin
  if pnlPrestador.Checked then
    fraPrestador.IDPrestadorFocus
  else
    fraPrestador.Limpiar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.pnlEnviadasChange(Sender: TObject);
begin
  if not pnlEnviadas.Checked then cmbEnviadas.ItemIndex := 2;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaNotificacionAltas.chkRegionSanitPrestChange(
  Sender: TObject);
begin
  fraRegionSanitaria.Enabled := chkRegionSanitPrest.Checked;       // TK 26875
  if not chkRegionSanitPrest.Checked then
    fraRegionSanitaria.Clear;
end;

end.
