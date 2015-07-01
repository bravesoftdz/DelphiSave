unit unCartaRechPr;

{-----------------------------------------------------------------------------
 Unit Name: unCartaRechPr
 Author:    rsouto
-----------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, IntEdit, Mask, ToolEdit, DateComboBox,
  CheckPanel, unfraPrestador, Menus,strfuncs, FormPanel, General, undmprincipal, DBCtrls, PatternEdit,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraCodigoDescripcion, unFraGrupoTrabajo, unfraFirmantes,
  unfraDelegacion, unfraCtbTablas;

type
  TfrmCartaRechPr = class(TfrmCustomConsulta)
    pnlGTrabajo: TCheckPanel;
    pnlDelegacion: TCheckPanel;
    MnuPrint: TPopupMenu;
    mnuImprimirCartaSel: TMenuItem;
    mnuImprimirgrilla: TMenuItem;
    ImprimirCartaTodosRegistrosGrupo: TMenuItem;
    fpEmisionCarta: TFormPanel;
    TxtCarta: TMemo;
    LblTitulo: TLabel;
    btnImprimir: TButton;
    btnEnviarMail: TButton;
    btnEnviarFax: TButton;
    Label5: TLabel;
    Label6: TLabel;
    TxtEmail: TEdit;
    Label7: TLabel;
    FPBaja: TFormPanel;
    Label9: TLabel;
    Observac: TMemo;
    btnSiBaja: TButton;
    btnNoBaja: TButton;
    Label10: TLabel;
    mnuImprimirCartaTodosRegistros: TMenuItem;
    fpWait: TFormPanel;
    lbProcesando: TLabel;
    edPrestador: TEdit;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    fraFirmantes: TfraFirmantes;
    ShortCutControlHijo: TShortCutControl;
    fraDelegacion: TfraDelegacion;
    pnlSiniestro: TCheckPanel;
    Label1: TLabel;
    edSiniDesde: TIntEdit;
    edSiniHasta: TIntEdit;
    pnlPrestador: TCheckPanel;
    fraPrestador: TfraPrestador;
    pnlFechaRechazo: TCheckPanel;
    Label2: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    pnlEstado: TCheckPanel;
    cmbEstado: TComboBox;
    pnlAccion: TCheckPanel;
    cmbAccion: TComboBox;
    chkRegionSanitPrest: TCheckPanel;
    fraRegionSanitaria: TfraCtbTablas;
    procedure tbRefrescarClick(Sender: TObject);
    procedure mnuImprimirgrillaClick(Sender: TObject);
    procedure pnlGTrabajoChange(Sender: TObject);
    procedure pnlDelegacionChange(Sender: TObject);
    procedure mnuImprimirCartaSelClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnEnviarMailClick(Sender: TObject);
    procedure btnEnviarFaxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnSiBajaClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure pnlSiniestroChange(Sender: TObject);
    procedure pnlPrestadorChange(Sender: TObject);
    procedure pnlEstadoChange(Sender: TObject);
    procedure pnlAccionChange(Sender: TObject);
    procedure pnlFechaRechazoChange(Sender: TObject);
    procedure chkRegionSanitPrestChange(Sender: TObject);
  private
    psRegistros: String;
    psTipoSalida: String;

    function EmitirCarta(Tipo: String; bPrimeraCarta: Boolean; Registros: String): Boolean;
    function GetMailRemitenteCartaDocumento: String;
    function GetUpdateCartaRechazoPrestador(UsuImpresion, Accion: String; Siniestro, Orden, Recaida,
                                            Prestador, Firma :Integer; TipoSalida :String): String;
    function IsImpresionRegistro_Grupo(sRegistros: String): Boolean;
    
    procedure DoImprimirCarta(bImpresionRegistro_Grupo: Boolean);
    procedure DoObtener_TextoCarta_Descripcion_Prestador(sAccion: String; var sTextoCarta, sDescripcion: String);
    procedure Do_GenerarParteAdministrativo(iSiniestro, iOrden, iRecaida, iIdPrestador: integer);  // TK 21005
  end;

var
  frmCartaRechPr: TfrmCartaRechPr;
  QueryforRpt: String;

implementation

uses
  unRptRechPr, sqlFuncs, AnsiSql, ArchFuncs, VCLExtra, unArt, unExportPDF, unSesion,
  unComunes, CustomDlgs, unRedPres, unTercerizadoras, unMoldeEnvioMail;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT ex_siniestro || ''/'' || ex_orden || ''/'' || ex_recaida SOR, em_nombre, ex_diagnostico, tj_cuil,' +
          ' tj_nombre, ca_codarea || '' '' || ca_telefono ca_telefono, ca_descripcion || ''('' || ca_identificador || '')'' PRCP,' +
          ' ''('' || ca_codpostal || '') '' || ca_localidad CPLOC, ca_identificador, ca_domicilio,' +
          ' cp_siniestro Siniestro, cp_orden Orden, cp_recaida recaida, cp_accion,' +
          ' DECODE(cp_origen, ''C'', ''Cierre Multiple'', ''S'', ''Siniestros'', ''M'', ''Médica'') Modulo,' +
          ' DECODE(cp_accion, ''R'', ''Rechazo'', ''A'', ''Acep/Rech'', ''C'', ''Reversión Rechazo'') Accion,' +
          ' cp_fechaalta f_rechazo, ca_descripcion prestador, cp_fechabaja f_suspensión, cp_accion,' +
          ' cp_fechaimpresion f_impresion, cp_observaciones observaciones, ex_gtrabajo, ex_delegacion,' +
          ' art.amebpba.get_nombregtrabajo(ex_gtrabajo) g_trabajo, cp_prestador,' +
          ' art.amebpba.get_nombredelegacion(ex_siniestro, ex_orden, ex_recaida) delegacion, ' +
          ' ex_siniestro, ex_orden, ex_recaida,' +
          ' nvl(ex_fecharecaida, ex_fechaaccidente) f_acci, ca_direlectronica,' +
          ' tiposalida.tb_descripcion tiposalidadescr, dcd_causa, ' +
          ' nvl(cp_fechaimpresion, actualdate) fechaimpresion, ' +
          ' siniestro.get_usuariogestor(ex_id) usugestor, ' +
          ' region.tb_descripcion RegSanitPrest, NVL(TRIM(ex_diagnostico), NVL(TRIM(ex_mecanismoaccid), ex_brevedescripcion)) diagnostico ' +
     ' FROM art.sex_expedientes, ctj_trabajador, art.cpr_prestador, aem_empresa, ' +
          ' mcp_cartarechazoprestador, art.ctb_tablas tiposalida, sdcd_decausadensin, ' +
          ' art.crp_regionesprestador, art.ctb_tablas region ' +  // TK 26875
    ' WHERE ex_siniestro = cp_siniestro' +
      ' AND ex_orden = cp_orden' +
      ' AND ex_recaida = cp_recaida' +
      ' AND ex_id = dcd_idexpediente(+) ' +
      ' AND ca_identificador = cp_prestador ' +
      ' AND ex_idtrabajador = tj_id ' +
      ' AND ex_cuit = em_cuit ' +
      ' AND TipoSalida.tb_clave(+) = ''TIPSA'' ' +
      ' AND TipoSalida.tb_codigo(+) = cp_tiposalida ' +
      ' AND cp_accion <> ''L'' ' + //excluyo las cartas de Alta Laboral
      ' AND RP_PRESTADOR(+) = CA_IDENTIFICADOR ' +     // TK 26875
      ' AND region.tb_clave(+) = ''REGSA'' ' +
      ' AND region.tb_codigo(+) = rp_region ' +
      ' AND rp_domicilio(+) = ''S'' ' ;

  if (pnlSiniestro.Checked) and (edsinidesde.Text <> '') and (edsinihasta.Text <> '') then
    sSql := sSql + ' and cp_siniestro between ' + edsinidesde.Text + ' and ' + edsinihasta.Text;

  if (pnlFechaRechazo.Checked) and not(edFechaDesde.IsEmpty and edFechaHasta.IsEmpty) then
    AddCondition(sSQL, SqlBetweenDateTime('cp_fechaalta', edFechaDesde.Date, edFechaHasta.Date));

  if (pnlAccion.Checked) then
    case cmbaccion.ItemIndex of
      0:  sSql := sSql + ' and cp_accion = ''R''';
      1:  sSql := sSql + ' and cp_accion = ''C''';
      2:  sSql := sSql + ' and cp_accion = ''A''';
      3:  sSql := sSql + ' and cp_accion in(''R'', ''C'', ''A'')';
    end;

  if (pnlEstado.Checked) then
    case cmbEstado.ItemIndex  of
      0:  sSql := sSql + ' and cp_fechaimpresion is null';
      1:  sSql := sSql + ' and cp_fechaimpresion is not null';
      2:  sSql := sSql + ' and cp_fechabaja is not null';
      3:  sSql := sSql;
    end;

  if (pnlPrestador.Checked) and (fraprestador.IDPrestador <> 0) then
    sSql := sSql + ' and ca_identificador = ' + SqlValue(fraprestador.IDPrestador);

  if (pnlgtrabajo.Checked) then    // Lu 03/04/2008
  begin
    if  (fraGrupoTrabajo.ID <> '') then
      sSQL := sSQL + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
      sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
  end;

  if (pnldelegacion.Checked) and fraDelegacion.IsSelected then
    sSql := sSql + ' AND ex_delegacion = ' + SqlValue(fraDelegacion.ID);

  if EsUsuarioDeTercerizadora then
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if (chkRegionSanitPrest.Checked) and not (fraRegionSanitaria.IsEmpty) then   // TK 26875
    sSql := sSql + ' AND rp_region = ' + SqlValue(fraRegionSanitaria.Codigo);

  sdqconsulta.SQL.text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.mnuImprimirgrillaClick(Sender: TObject);
begin
  queryprint.Print;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.pnlGTrabajoChange(Sender: TObject);
begin
  if pnlGTrabajo.Checked then
    fraGrupoTrabajo.cmbDescripcion.DoDropDown
  else
    fraGrupoTrabajo.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.pnlDelegacionChange(Sender: TObject);
begin
  if pnlDelegacion.Checked then
    fraDelegacion.cmbDescripcion.DoDropDown
  else
    fraDelegacion.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.mnuImprimirCartaSelClick(Sender: TObject);
var
  bEmisionCartaOk, bPrestadoresSinDirElectronica, bPrimeraCarta: Boolean;
  iPrestador, iStartPosFrom, iStartPosOrderBy: Integer;
  QueryforRpt1, sAccion, sSql, Tipo: String;
begin
  if sdqconsulta.FieldByName('F_Suspensión').IsNull then
  begin
    bEmisionCartaOk := False;

    if Sender = mnuImprimirCartaSel then
      psRegistros := 'RS'
    else if Sender = ImprimirCartaTodosRegistrosGrupo then
      psRegistros := 'TR'
    else if Sender = mnuImprimirCartaTodosRegistros then
      psRegistros := 'TS';

    Tipo := sdqconsulta.fieldbyname('cp_accion').AsString;

    QueryforRpt1 := sdqConsulta.SQL.text;
    iStartPosOrderBy := FindComplexClause(QueryforRpt1, SQL_ORDERBY);
    Delete(QueryforRpt1, iStartPosOrderBy, MaxInt);

    QueryforRpt1 := QueryforRpt1 + ' AND cp_fechabaja IS NULL ';

    if IsImpresionRegistro_Grupo(psRegistros) then
    begin
      if psRegistros='RS' then
        //le agrego filtros al query para imprimir solo el regitro seleccionado
        QueryforRpt  := QueryforRpt1 + ' and ex_siniestro=' + sdqConsulta.fieldbyname('ex_siniestro').asstring +
                                       ' and ex_orden=' + sdqConsulta.fieldbyname('ex_orden').asstring +
                                       ' and ex_recaida=' + sdqConsulta.fieldbyname('ex_recaida').asstring +
                                       ' and cp_accion='''  + sdqConsulta.fieldbyname('cp_accion').asstring + ''''

      else if psRegistros = 'TR' then
        //le agrego filtros al query para imprimir solo los registros con el prestador del seleccionado y la misma acción
        QueryforRpt := QueryforRpt1 + ' and ca_identificador=' + SqlValue(sdqConsulta.fieldbyname('ca_identificador').asinteger) +
                                      ' and cp_accion=' + SqlValue(sdqConsulta.fieldbyname('cp_accion').asstring);

      bEmisionCartaOk := EmitirCarta(Tipo, True, psRegistros);
    end
    else if psRegistros = 'TS' then
    begin
      // impresión de todos los registros de la grilla, agrupados por prestador y acción
      bPrimeraCarta                 := True;
      bPrestadoresSinDirElectronica := False;

      iStartPosFrom := FindComplexClause(QueryforRpt1, SQL_FROM);

      sSql := 'SELECT DISTINCT cp_prestador, cp_accion, ca_descripcion, ca_direlectronica ' +
              Copy(QueryforRpt1, iStartPosFrom, MaxInt);

      with GetQuery(sSql) do
      begin
        try
          edPrestador.Clear;
          fpWait.ShowOnTop;

          try
            while not EOF do
            begin
              iPrestador  := FieldByName('cp_prestador').AsInteger;
              sAccion     := FieldByName('cp_accion').AsString;

              QueryforRpt := QueryforRpt1 + ' AND ca_identificador=' + SqlValue(iPrestador) +
                                            ' AND cp_accion=' + SqlValue(sAccion);
              bEmisionCartaOk := EmitirCarta(Tipo, bPrimeraCarta, psRegistros);
              if not bEmisionCartaOk then
                break;
              edPrestador.Text := FieldByName('ca_descripcion').AsString;
              Sleep(250);
              application.ProcessMessages;

              if bPrimeraCarta then
                bPrimeraCarta := False;

              if psTipoSalida = 'MAIL' then
                if FieldByName('ca_direlectronica').IsNull then
                  bPrestadoresSinDirElectronica := True;

              Next;
            end;
          finally
            fpWait.Close;
          end;

          if bEmisionCartaOk and (psTipoSalida = 'MAIL') and bPrestadoresSinDirElectronica then
            msgbox('Se encontraron prestadores sin dirección de correo electrónico a los que no se les ha podido enviar la carta de rechazo');
        finally
          free;
        end;
      end;
    end;

    if bEmisionCartaOk then
      RefreshData;
  end
  else
    MsgBox('No puede imprimir registros dados de baja.');
end;
{-------------------------------------------------------------------------------}
function TfrmCartaRechPr.EmitirCarta(Tipo: String; bPrimeraCarta: Boolean; Registros: String): Boolean;
var
  bImpresionRegistro_Grupo: Boolean;
  sDescripcionCarta: String;
  sTextoCarta: String;
begin
  bImpresionRegistro_Grupo := IsImpresionRegistro_Grupo(Registros);

  if bPrimeraCarta then
  begin
    if bImpresionRegistro_Grupo then
    begin
      LockControl(TxtEmail, False);
      LockControl(TxtCarta, False);
      TxtEmail.Text := sdqConsulta.fieldbyname('ca_direlectronica').AsString;
      DoObtener_TextoCarta_Descripcion_Prestador(Tipo, sTextoCarta, sDescripcionCarta);
      Lbltitulo.Caption := sDescripcionCarta;
      TxtCarta.Text := sTextoCarta;
    end
    else
    begin
      Lbltitulo.Caption := '';
      TxtEmail.Clear;
      LockControl(TxtEmail);
      TxtCarta.Clear;
      LockControl(TxtCarta);
    end;

    fraFirmantes.Limpiar;
    Result := (fpEmisionCarta.ShowModal = mrOk);
  end
  else
  begin
    DoImprimirCarta(bImpresionRegistro_Grupo);
    Result := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.tbImprimirClick(Sender: TObject);
begin
  tbimprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.btnImprimirClick(Sender: TObject);
var
  bImpresionRegistro_Grupo: Boolean;
begin
  bImpresionRegistro_Grupo := IsImpresionRegistro_Grupo(psRegistros);  { by NWK, 28/02/03 }
  Verificar(fraFirmantes.IsEmpty, fraFirmantes, 'No se puede emitir sin seleccionar un firmante.');
  Verificar(bImpresionRegistro_Grupo and (Trim(txtCarta.Text) = ''), TxtCarta,
            'No se puede emitir sin ingresar un texto de la carta.');
  { by NWK, 21/02/03 }
  psTipoSalida := 'IMPRESION';
  DoImprimirCarta(bImpresionRegistro_Grupo);
  fpEmisionCarta.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.DoImprimirCarta(bImpresionRegistro_Grupo: Boolean);
var
  Rpt: trptCartaRech;
  sDescripcionCarta, sDireccionDestinatario, sFileName, sSalida, SSQL,
  sTextoCarta, sAsunto: String;
  tslDirecciones: TStringList;
begin
  Rpt := trptCartaRech.Create(Self);

  try
    Rpt.sdqRPT.SQL.Text := QueryforRpt;
    Rpt.sdqRPT.Open;
    DoObtener_TextoCarta_Descripcion_Prestador(Rpt.sdqRPT.fieldbyname('cp_accion').AsString, sTextoCarta, sDescripcionCarta);  { by NWK, 28/02/03 }

    if (Rpt.sdqRPT.fieldbyname('cp_accion').AsString = 'A') then
    begin
      Rpt.qrlDiagnostico.Caption := 'Patología Rechazada';
      Rpt.qrdbDiagnostico.DataField := 'dcd_causa';
      sAsunto := 'Carta para el prestador - Patología de base rechazada';
    end
    else
    begin
      Rpt.qrlDiagnostico.Caption := 'Diagnóstico';
      Rpt.qrdbDiagnostico.DataField := 'diagnostico';
      sAsunto := 'Carta de Rechazo para el prestador';
    end;

    if bImpresionRegistro_Grupo then   { by NWK, 28/02/03 }
      Rpt.TxtCuerpo.Lines.Add(TxtCarta.text)
    else
      Rpt.TxtCuerpo.Lines.Add(sTextoCarta);

    Rpt.qrlFechaImpresion.Caption                := Rpt.sdqRPT.fieldbyname('FechaImpresion').AsString;
    Rpt.qrlDescripcionCarta.Caption              := 'Ref.: ' + sDescripcionCarta;  { by NWK, 28/02/03 }
    Rpt.sdqFirma.ParamByName('pFirma').AsInteger := fraFirmantes.Value;
    Rpt.sdqFirma.Open;

    if (psTipoSalida = 'IMPRESION') then
    begin
      sSalida := 'C';
      Rpt.Preview;
    end
    else if (psTipoSalida = 'MAIL') then
    begin
      sSalida := 'M';
      rpt.qrlTipoEgreso.Width := 0;
      sFileName := IncludeTrailingBackslash(TempPath) + 'Carta_Rechazo' +
                                            Rpt.sdqRPT.FieldByName('EX_SINIESTRO').AsString +
                                            Rpt.sdqRPT.FieldByName('EX_ORDEN').AsString +
                                            Rpt.sdqRPT.FieldByName('EX_RECAIDA').AsString + '.PDF';

      if bImpresionRegistro_Grupo then
        sDireccionDestinatario := txtEMail.text
      else
        sDireccionDestinatario := Rpt.sdqRPT.FieldByName('CA_DIRELECTRONICA').AsString;

      tslDirecciones := TStringList.Create;
      try
        while Pos(' ', sDireccionDestinatario) > 0 do
          sDireccionDestinatario := StringReplace(sDireccionDestinatario, ' ', ',', [rfReplaceAll]);

        tslDirecciones.CommaText := StringReplace(sDireccionDestinatario,';', ',', [rfReplaceAll]);
        ExportarPDF(Rpt, sFileName);
        EnviarMailBD(tslDirecciones.CommaText, sAsunto, [oAutoFirma, oDeleteAttach],
                     'Provincia ART', GetAttachments(sFileName, 7));
        if (Rpt.sdqRPT.fieldbyname('cp_accion').AsString = 'R') then   // Solo si es "Rechazo" genera el parte administrativo (TK 24225)
          Do_GenerarParteAdministrativo(Rpt.sdqRPT.FieldByName('ex_siniestro').AsInteger,
                                        Rpt.sdqRPT.FieldByName('ex_orden').AsInteger,
                                        Rpt.sdqRPT.FieldByName('ex_recaida').AsInteger,
                                        Rpt.sdqRPT.FieldByName('cp_prestador').AsInteger);  // TK 21005
      finally
        tslDirecciones.Free;
      end;
    end;

    BeginTrans;
    try
      Rpt.sdqRPT.First;
      while not Rpt.sdqRPT.Eof do
      begin
        SSQL := GetUpdateCartaRechazoPrestador(Sesion.UserID, Rpt.sdqRPT.FieldByName('cp_accion').AsString,
                                               Rpt.sdqRPT.FieldByName('ex_siniestro').AsInteger,
                                               Rpt.sdqRPT.FieldByName('ex_orden').AsInteger,
                                               Rpt.sdqRPT.FieldByName('ex_recaida').AsInteger,
                                               Rpt.sdqRPT.FieldByName('cp_prestador').AsInteger,
                                               fraFirmantes.Value, sSalida);
        EjecutarSQLST(SSQL);
        Rpt.sdqRPT.next;
      end;
      CommitTrans;
    except
      on E: Exception do
      begin
        Rollback;
        raise Exception.Create(E.Message + CRLF + 'Error al grabar en la carta de rechazo al prestador.');
      end;
    end;
  finally
    Rpt.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.btnEnviarMailClick(Sender: TObject);
var
  bImpresionRegistro_Grupo: Boolean;
  MailRemitenteCartaDocumento: String;
begin
  bImpresionRegistro_Grupo := IsImpresionRegistro_Grupo(psRegistros);  { by NWK, 28/02/03 }
  Verificar(fraFirmantes.IsEmpty, fraFirmantes,'No se puede emitir sin seleccionar un firmante.');
  Verificar(bImpresionRegistro_Grupo and (Trim(txtCarta.Text) = ''), TxtCarta,
            'No se puede emitir sin ingresar un texto de la carta.');
  Verificar(bImpresionRegistro_Grupo and (Trim(txtEmail.Text) = ''), TxtEmail,
            'No se puede emitir sin seleccionar un destinatario.');

  MailRemitenteCartaDocumento := GetMailRemitenteCartaDocumento();
  Verificar(Trim(MailRemitenteCartaDocumento) = '', nil,
            'No se puede determinar la dirección electrónica del remitente de la carta documento.');
  psTipoSalida := 'MAIL';
  DoImprimirCarta(bImpresionRegistro_Grupo);
  fpEmisionCarta.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
{ Arma el update para actualizar los datos de la carta de rechazo al prestador, luego de su impresión/envío }
function TfrmCartaRechPr.GetUpdateCartaRechazoPrestador(UsuImpresion, Accion: String;
                                                        Siniestro, Orden, Recaida, Prestador,
                                                        Firma :Integer; TipoSalida :String): String;

var
  sSql: String;
begin
  sSql := 'UPDATE mcp_cartarechazoprestador' +
            ' SET cp_fechaImpresion = ActualDate,' +
                ' cp_usuimpresion = ' + SqlValue(UsuImpresion)+ ',' +
                ' cp_firma = ' + SqlInt(Firma) + ',' +
                ' cp_tiposalida = ' + SqlValue(TipoSalida) +
          ' WHERE cp_siniestro = ' + SqlValue(Siniestro) +
            ' AND cp_orden = ' + SqlValue(Orden) +
            ' AND cp_recaida = ' + SqlValue(Recaida) +
            ' AND cp_prestador = ' + SqlValue(Prestador) +
            ' AND cp_accion = ' + SqlValue(Accion) +
            ' AND cp_fechaimpresion IS NULL';
  Result := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.btnEnviarFaxClick(Sender: TObject);
begin
  Verificar(frafirmantes.IsEmpty, fraFirmantes,'No se puede emitir sin seleccionar un firmante.');
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.FormCreate(Sender: TObject);
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
procedure TfrmCartaRechPr.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('F_Suspensión').IsNull then
    MsgBox('El registro ya se encuentra dado de baja.')
  else
  begin
    Self.FPBaja.ShowModal;
    inherited;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.btnSiBajaClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'UPDATE art.mcp_cartarechazoprestador ' +
            ' SET cp_fechabaja = Actualdate,' +
                ' cp_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                ' cp_observaciones = ' + SqlValue(Observac.Text) +
          ' WHERE cp_siniestro = ' + SqlInt(sdqconsulta.FieldByName('ex_siniestro').AsInteger) +
            ' AND cp_orden = ' + SqlInt(sdqconsulta.FieldByName('ex_orden').AsInteger) +
            ' AND cp_recaida = ' + SqlInt(sdqconsulta.FieldByName('ex_recaida').AsInteger);
  try
    EjecutarSql(sSql);
    tbrefrescar.Click;
  except
    MsgBox('Ha ocurrido un error al intentar eliminar el registro.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                            var Background: TColor; Highlight: Boolean);
begin
  if not sdqconsulta.FieldByName('F_Suspensión').IsNull then
    Afont.Color := clRed;
  inherited;
end;
{-------------------------------------------------------------------------------}
{ Devuelve la dirección de e-mail del remitente de la carta documento }
{ by NWK, 20/02/03 }
function TfrmCartaRechPr.GetMailRemitenteCartaDocumento: String;
var
  sSql: String;
begin
  sSql := 'SELECT tb_especial1' +
           ' FROM ctb_tablas' +
          ' WHERE tb_clave = ''DIREL''' +
            ' AND tb_codigo = ''01''';
  Result := ValorSql(sSql);
end;
{-------------------------------------------------------------------------------}
{ by NWK, 28/02/03 }
{ Devuelve el texto de la carta al prestador y su descripción, según la acción indicada }
procedure TfrmCartaRechPr.DoObtener_TextoCarta_Descripcion_Prestador(sAccion: String; var sTextoCarta, sDescripcion: String);
var
  sSql: String;
begin
  sSql := 'SELECT tp_texto, tp_descripcion' +
           ' FROM ctp_textocartaprestador' +
          ' WHERE tp_accion = :accion ';
  with GetQueryEx(sSql, [sAccion]) do
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
{ by NWK, 28/02/03 }
{ Devuelve verdadero si se realiza la impresión de la carta del reg. seleccionado o del grupo del registro seleccionado }
function TfrmCartaRechPr.IsImpresionRegistro_Grupo(sRegistros: String): Boolean;
begin
  Result := (sRegistros = 'TR') or (sRegistros = 'RS');  // imprimir carta del reg. seleccionado / del grupo del reg. seleccionado
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  pnlGTrabajo.Checked     := False;
  pnlSiniestro.Checked    := False;
  pnlFechaRechazo.Checked := False;
  pnlAccion.Checked       := False;
  pnlEstado.Checked       := False;
  pnlPrestador.Checked    := False;
  pnlDelegacion.Checked   := False;
  chkRegionSanitPrest.Checked := False; // TK 26875
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.Do_GenerarParteAdministrativo(iSiniestro, iOrden, iRecaida, iIdPrestador: integer);    // TK 21005
var iNuevoParte: integer;
begin
  iNuevoParte := ValorSqlEx('SELECT NVL(MAX(pv_nroparte), 0) + 1 ' +  // TK 24057 
                               ' FROM art.spv_parteevolutivo ' +
                              ' WHERE pv_siniestro = :Sin ' +
                                ' AND pv_orden = :Orden ' +
                                ' AND pv_recaida = :Reca', [iSiniestro, iOrden, iRecaida]);

  InsertarParteEvolutivo(True, iSiniestro, iOrden, iRecaida, iIdPrestador,
                         iNuevoParte, 'A', DBDate,
                         0, 0, 0, '', 0, DBDate,
                         '[Generado desde Cartas de Rechazo al Prestador] -' +
                         ' Se envio la Notificación del Rechazo al Prestador.');
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.pnlSiniestroChange(Sender: TObject);
begin
  edSiniDesde.Clear;
  edSiniHasta.Clear;  
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.pnlPrestadorChange(Sender: TObject);
begin
  if pnlPrestador.Checked then
    fraPrestador.IDPrestadorFocus
  else
    fraPrestador.Limpiar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.pnlEstadoChange(Sender: TObject);
begin
  cmbEstado.ItemIndex := -1;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.pnlAccionChange(Sender: TObject);
begin
  cmbAccion.ItemIndex := -1;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.pnlFechaRechazoChange(Sender: TObject);
begin
  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaRechPr.chkRegionSanitPrestChange(Sender: TObject);
begin
    fraRegionSanitaria.Enabled := chkRegionSanitPrest.Checked;       // TK 26875
  if not chkRegionSanitPrest.Checked then
    fraRegionSanitaria.Clear;
end;

end.
