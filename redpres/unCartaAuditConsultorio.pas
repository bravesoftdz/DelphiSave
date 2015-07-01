unit unCartaAuditConsultorio;              // TK 16982

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, CheckPanel, Mask, PatternEdit, IntEdit,
  ToolEdit, DateComboBox, unArtDbFrame, unfraPrestador, unfraDelegacion,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraGrupoTrabajo,
  Menus, RxToolEdit, RxPlacemnt, unRptAuditConsultorio;

type
  TfrmCartaAuditConsultorio = class(TfrmCustomConsulta)
    pnlSiniestro: TCheckPanel;
    edSiniDesde: TIntEdit;
    edSiniHasta: TIntEdit;
    pnlFechaCarga: TCheckPanel;
    Label1: TLabel;
    deFechaDesde: TDateComboBox;
    deFechaHasta: TDateComboBox;
    Label2: TLabel;
    pnlGTrabajo: TCheckPanel;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    pnlDelegacion: TCheckPanel;
    fraDelegacion: TfraDelegacion;
    pnlPrestador: TCheckPanel;
    fraPrestador: TfraPrestador;
    MnuImprimir: TPopupMenu;
    mnuImprimirGrilla: TMenuItem;
    mnuImprimirCartaPrestador: TMenuItem;
    pnlEstado: TCheckPanel;
    cmbEstado: TComboBox;
    tbEnviarAuditoria: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirCartaPrestadorClick(Sender: TObject);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlSiniestroChange(Sender: TObject);
    procedure pnlGTrabajoChange(Sender: TObject);
    procedure pnlFechaCargaChange(Sender: TObject);
    procedure pnlEstadoChange(Sender: TObject);
    procedure pnlDelegacionChange(Sender: TObject);
    procedure pnlPrestadorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbEnviarAuditoriaClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
  private
    { Private declarations }
    FRegistrosSeleccionados: TStringList;
    procedure Do_GuardarFechaEnvio_AuditConsult(iIdExped, iNroParte: integer;  bConTransaccion: boolean = True);
    procedure DoAsignarDatosReporte(var rpt: TrptAuditConsultorio);
    function HayRegistroActivo :Boolean;
  public
    { Public declarations }
  end;

var
  frmCartaAuditConsultorio: TfrmCartaAuditConsultorio;

implementation

uses
  AnsiSql, unSesion, unRptDenunciaStandard, unVisualizador,
  unDmPrincipal, CustomDlgs, unTercerizadoras, ArchFuncs, unExportPDF, unMoldeEnvioMail;

{$R *.dfm}

{-------------------------------------------------------------------------------}

procedure TfrmCartaAuditConsultorio.FormCreate(Sender: TObject);
begin
  inherited;
  FRegistrosSeleccionados := TStringList.Create;
  grid.Columns[23].Width := 103;
end;

procedure TfrmCartaAuditConsultorio.FSFormDestroy(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  inherited;
end;

procedure TfrmCartaAuditConsultorio.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
begin
  FRegistrosSeleccionados.Clear;
  sSql := ' SELECT null CHECKBOX, pv_id, pv_siniestro, pv_orden, pv_recaida, pv_nroparte, pv_fechaalta FechaCarga, ' +
                 ' art.utiles.armar_siniestro(pv_siniestro, pv_orden, pv_recaida) Siniestro, ' +
                 ' gp_nombre Gtrabajo, ex_gestor, el_nombre Delegacion, ' +
                 ' au_nombre Medico, ex_diagnostico, art.sin.gettipo(ex_tipo) tipo, ex_fechaaccidente, ' +
                 ' ex_fecharecaida, ex_altamedica, ex_bajamedica, ex_cuit, em_nombre Empresa, ' +
                 ' ex_cuil, tj_nombre Trabajador,  ' +
                 ' pv_identifprestador PVPrestId, prpv.ca_clave PVPrestCuit, prpv.ca_descripcion PVPrestDesc, ' +    // Prest. del parte evolutivo
                 ' pi_idprestador      PIPrestId, prsi.ca_clave PIPrestCuit, prsi.ca_descripcion PIPrestDesc, ' +     // Prest. del parte de ingreso
                 ' pv_fechacontrol, pv_proximocontrol, pv_probablealta, pv_envioauditconsult, ' +
                 ' pv_internadodesde, pv_internadohasta, pv_sitiointernacion, pv_turno, pv_turnohora, ' +
                 ' pv_tipotratamiento, Trata.tb_descripcion ttratamiento, pv_diagnostico, pv_diagnosticooms, ' +
                 ' dg_descripcion, pv_medico, pv_medicacion, pv_reposo, pv_observaciones, pv_idexpediente, ' +
                 ' prCabecera.ca_descripcion PrestCabecera, prCabecera.ca_direlectronica Dir_PrestCabecera, ' +
                 ' siniestro.get_usuario_telegrama(pv_idcitacion) usutelegrama ' +

            ' FROM art.spv_parteevolutivo, art.sex_expedientes, art.mgp_gtrabajo, ctj_trabajador, ' +
                 ' art.del_delegacion, art.cpr_prestador prpv, ART.cpr_prestador prsi, ' +
                 ' afi.aem_empresa, art.mau_auditores, sin.spi_partedeingreso, art.ctb_tablas Trata, ' +
                 ' art.cdg_diagnostico, art.cpr_prestador prCabecera ' +

           ' WHERE pv_tipoparte = ''C'' ' +  // Auditoria en consultorio
             ' AND pv_idexpediente = ex_id ' +
             ' AND ex_gtrabajo = gp_codigo ' +
             ' AND ex_delegacion = el_id ' +
             ' AND spv_parteevolutivo.pv_fechabaja IS NULL ' +
             ' AND pv_identifprestador = prpv.ca_identificador ' +   // Prest. del parte evolutivo
             ' AND prsi.ca_identificador(+) = pi_idprestador ' +     // Prest. del parte de ingreso
             ' AND ex_id = pi_idexpediente(+) ' +
             ' AND nvl(pv_auditor,0) = au_auditor(+) ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND ex_idtrabajador = tj_id ' +
             ' AND trata.tb_clave(+) = ''TRATA'' ' +
             ' AND trata.tb_codigo(+) = pv_tipotratamiento ' +
             ' AND pv_diagnosticooms = dg_codigo(+) ' +
             ' AND prCabecera.ca_identificador = art.siniestro.get_prestadorcabecera(ex_siniestro, ex_orden, ex_recaida) ';

  if (pnlSiniestro.Checked) and (edsinidesde.Text <> '') and (edsinihasta.Text <> '') then
    sSql := sSql + ' AND pv_siniestro BETWEEN ' + edsinidesde.Text + ' AND ' + edsinihasta.Text;

  if (pnlgtrabajo.Checked) and not (fraGrupoTrabajo.IsEmpty) then
  begin
    sSql := sSql + ' AND NVL(ex_gtrabajo, '''') =' + SqlValue(fraGrupoTrabajo.Codigo);

    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
       sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
  end;

  if (pnlFechaCarga.Checked) and (not deFechaDesde.IsEmpty) and (not deFechaHasta.IsEmpty) then
    sSql := sSql + ' AND pv_fechaalta BETWEEN ' + deFechaDesde.SqlText + ' AND ' + deFechaHasta.SqlText;

  if (pnldelegacion.Checked) and not (fraDelegacion.IsEmpty) then
    sSql := sSql + ' AND NVL(ex_delegacion, '''')=' + SqlValue(fraDelegacion.Codigo);

  if (pnlPrestador.Checked) and (fraprestador.IDPrestador <> 0) then
    sSql := sSql + ' AND pv_identifprestador = ' + SqlInt(fraprestador.IDPrestador);

  if (pnlEstado.Checked) then             // TK 18181
    case cmbEstado.ItemIndex  of
      0:  sSql := sSql + ' AND pv_envioauditconsult IS NULL ';
      1:  sSql := sSql + ' AND pv_envioauditconsult IS NOT NULL ';
      2:  sSql := sSql;
    end;

  if EsUsuarioDeTercerizadora then
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  sdqconsulta.SQL.text := sSql + SortDialog.OrderBy;
  inherited;
end;
procedure TfrmCartaAuditConsultorio.tbSalirClick(Sender: TObject);
begin
close;
end;

{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.mnuImprimirCartaPrestadorClick(Sender: TObject);
var
  Resultado: TResultados;
begin
  try
    rptAuditConsultorio := TrptAuditConsultorio.Create(Application.MainForm);
    with rptAuditConsultorio do
    begin
      qrlSiniestro.Caption        := sdqConsulta.FieldByName('SINIESTRO').AsString;
      qrlDiagnostico.Caption      := sdqConsulta.FieldByName('EX_DIAGNOSTICO').AsString;
      qrlTipo.Caption             := sdqConsulta.FieldByName('TIPO').AsString;
      qrlFechaAccidente.Caption   := sdqConsulta.FieldByName('EX_FECHAACCIDENTE').AsString;
      qrlFechaRecaida.Caption     := sdqConsulta.FieldByName('EX_FECHARECAIDA').AsString;
      qrlAltaMedica.Caption       := sdqConsulta.FieldByName('EX_ALTAMEDICA').AsString;
      qrlBajaMedica.Caption       := sdqConsulta.FieldByName('EX_BAJAMEDICA').AsString;
      qrlCuit.Caption             := sdqConsulta.FieldByName('EX_CUIT').AsString;
      qrlEmpresa.Caption          := sdqConsulta.FieldByName('EMPRESA').AsString;
      qrlCuil.Caption             := sdqConsulta.FieldByName('EX_CUIL').AsString;
      qrlTrabajador.Caption       := sdqConsulta.FieldByName('TRABAJADOR').AsString;

      qrlPrestId.Caption          := sdqConsulta.FieldByName('PIPRESTID').AsString; // Prestador del parte de ingreso
      qrlPrestCuit.Caption        := sdqConsulta.FieldByName('PIPRESTCUIT').AsString;
      qrlPrestRSocial.Caption     := sdqConsulta.FieldByName('PIPRESTDESC').AsString;

      qrlNroParte.Caption         := sdqConsulta.FieldByName('PV_NROPARTE').AsString;
      qrlFechaControl.Caption     := sdqConsulta.FieldByName('PV_FECHACONTROL').AsString;
      qrlProximoControl.Caption   := sdqConsulta.FieldByName('PV_PROXIMOCONTROL').AsString;
      qrlProbableAlta.Caption     := sdqConsulta.FieldByName('PV_PROBABLEALTA').AsString;
      qrlInternadoDesde.Caption   := sdqConsulta.FieldByName('PV_INTERNADODESDE').AsString;
      qrlInternadoHasta.Caption   := sdqConsulta.FieldByName('PV_INTERNADOHASTA').AsString;
      qrlSitioInternacion.Caption := sdqConsulta.FieldByName('PV_SITIOINTERNACION').AsString;
      qrlTurno.Caption            := sdqConsulta.FieldByName('PV_TURNO').AsString;
      qrlTurnoHora.Caption        := sdqConsulta.FieldByName('PV_TURNOHORA').AsString;

      qrlPVPrestId.Caption        := sdqConsulta.FieldByName('PVPRESTID').AsString;   // Prestador del parte evolutivo
      qrlPVPrestCuit.Caption      := sdqConsulta.FieldByName('PVPRESTCUIT').AsString;
      qrlPVPrestRSocial.Caption   := sdqConsulta.FieldByName('PVPRESTDESC').AsString;

      qrlTipoTratamiento.Caption  := sdqConsulta.FieldByName('PV_TIPOTRATAMIENTO').AsString;
      qrlTTratamiento.Caption     := sdqConsulta.FieldByName('TTRATAMIENTO').AsString;
      qrlPVDiagnostico.Caption    := sdqConsulta.FieldByName('PV_DIAGNOSTICO').AsString;
      qrlPVDiagnosticooms.Caption := sdqConsulta.FieldByName('PV_DIAGNOSTICOOMS').AsString;
      qrlDGDiagnosticooms.Caption := sdqConsulta.FieldByName('DG_DESCRIPCION').AsString;
      qrlPVMedico.Caption         := sdqConsulta.FieldByName('PV_MEDICO').AsString;
      qrlPVMedicacion.Caption     := sdqConsulta.FieldByName('PV_MEDICACION').AsString;
      qrlPVReposo.Caption         := sdqConsulta.FieldByName('PV_REPOSO').AsString;
      qrlPVObservaciones.Lines.Text := sdqConsulta.FieldByName('PV_OBSERVACIONES').AsString;
      qrlUsuario.Caption          := Sesion.Usuario;

      Resultado := Visualizar(rptAuditConsultorio, GetValores('AuditoriaEnConsultorio',
                                                              sdqConsulta.FieldByName('DIR_PRESTCABECERA').AsString),
                                                              [oForceShowModal, oForceDB{, oAlwaysShowDialog}]);
      if rMail in Resultado then
        Do_GuardarFechaEnvio_AuditConsult(sdqConsulta.FieldByName('PV_IDEXPEDIENTE').AsInteger,
                                          sdqConsulta.FieldByName('PV_NROPARTE').AsInteger);

    end;
  finally
    rptAuditConsultorio.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  pnlSiniestro.Checked  := False;
  pnlFechaCarga.Checked := False;
  pnlPrestador.Checked  := False;
  pnlGTrabajo.Checked   := False;
  pnlDelegacion.Checked := False;
  pnlEstado.Checked     := False;
  FRegistrosSeleccionados.Clear;
end;
{-------------------------------------------------------------------------------}

procedure TfrmCartaAuditConsultorio.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.mnuImprimirGrillaClick(Sender: TObject);
begin
  QueryPrint.Print;
end;
{-------------------------------------------------------------------------------}

procedure TfrmCartaAuditConsultorio.Do_GuardarFechaEnvio_AuditConsult(iIdExped, iNroParte: integer; bConTransaccion: boolean = True);
var
  sSql: string;
begin
  try
    sSql := 'UPDATE art.spv_parteevolutivo ' +
              ' SET pv_envioauditconsult = trunc(Sysdate) ' +
            ' WHERE pv_idexpediente = :idexp ' +
              ' AND pv_nroparte = :nroparte ';

    if bConTransaccion then
      EjecutarSqlEx(sSql, [iIdExped, iNroParte])
    else
      EjecutarSqlSTEx(sSql, [iIdExped, iNroParte]);

  except
    on E: Exception do
      ErrorMsg(E, 'No se ha podido guardar la fecha de envío.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.pnlSiniestroChange(Sender: TObject);
begin
  edSiniDesde.Clear;
  edSiniHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.pnlGTrabajoChange(Sender: TObject);
begin
  if pnlGTrabajo.Checked then
    fraGrupoTrabajo.cmbDescripcion.DoDropDown
  else
    fraGrupoTrabajo.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.pnlFechaCargaChange(Sender: TObject);
begin
  deFechaDesde.Clear;
  deFechaHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.pnlEstadoChange(Sender: TObject);
begin
  cmbEstado.ItemIndex := -1;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.pnlDelegacionChange(Sender: TObject);
begin
  if pnlDelegacion.Checked then
    fraDelegacion.cmbDescripcion.DoDropDown
  else
    fraDelegacion.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.pnlPrestadorChange(Sender: TObject);
begin
  if pnlPrestador.Checked then
    fraPrestador.IDPrestadorFocus
  else
    fraPrestador.Limpiar;
end;
{-------------------------------------------------------------------------------}   // para TK 65024
function TfrmCartaAuditConsultorio.HayRegistroActivo: Boolean;
begin
  Result := sdqConsulta.Active and not sdqConsulta.IsEmpty;
end;
{-------------------------------------------------------------------------------}   // para TK 65024
procedure TfrmCartaAuditConsultorio.GridCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('pv_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('pv_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('pv_id').AsString);
    Grid.Repaint;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCartaAuditConsultorio.btnMarcarTodos(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  APointer := sdqConsulta.GetBookmark;

  FRegistrosSeleccionados.Clear;
  Screen.Cursor := crSQLWait;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(FieldByName('pv_id').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCartaAuditConsultorio.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Item: TMenuItem;
  MenuGrilla: TPopUpMenu;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla  := TPopUpMenu.Create(Self);
  Item        := TMenuItem.Create(Self);
  try
    if HayRegistroActivo then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;



procedure TfrmCartaAuditConsultorio.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('pv_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCartaAuditConsultorio.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('pv_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen
end;

procedure TfrmCartaAuditConsultorio.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;

procedure TfrmCartaAuditConsultorio.tbEnviarAuditoriaClick(Sender: TObject);
var
  aLista :TStringList;
  aMetodo :TDataSetNotifyEvent;
  aPointer :TBookMark;
  rptAuditConsultorio: TrptAuditConsultorio;
  sFileName: String;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');
  if MsgAsk('¿Confirma que desea enviar la/las auditorias en Consultorio seleccionadas?') then
  begin
    aLista                  := TStringList.Create;
    aMetodo                 := sdqConsulta.AfterScroll;
    sdqConsulta.AfterScroll := nil;
    aPointer                := sdqConsulta.GetBookmark;

    with sdqConsulta do
    try
      DisableControls;
      First;
      BeginTrans;
      while not Eof do
      try
        if FRegistrosSeleccionados.IndexOf(FieldByName('pv_id').AsString) > -1 then
        begin
          rptAuditConsultorio := TrptAuditConsultorio.Create(Application.MainForm);
          Try
            DoAsignarDatosReporte(rptAuditConsultorio);
            sFileName := IncludeTrailingBackslash(TempPath) +
                         'AuditConsultorio_' + FieldByName('pv_id').AsString + '.PDF';


            ExportarPDF(rptAuditConsultorio, sFileName);
            EnviarMailBD(FieldByName('DIR_PRESTCABECERA').AsString,
                         'Auditoria en Consultorio - Siniestro: ' + FieldByName('siniestro').AsString,
                         [oAutoFirma, oDeleteAttach],
                         'Provincia ART', GetAttachments(sFileName, 7), 0, tcDefault, False);

            Do_GuardarFechaEnvio_AuditConsult(sdqConsulta.FieldByName('PV_IDEXPEDIENTE').AsInteger,
                                              sdqConsulta.FieldByName('PV_NROPARTE').AsInteger, False);

          Finally
            rptAuditConsultorio.Free;
          End;
        end;
        Next;
      except
        on E:Exception do
        begin
          Rollback(True);
          ErrorMsg(E, 'Error al intentar realizar el envio.');
          Exit;
        end;
      end;
      CommitTrans;
      MsgBox('La operación se llevó a cabo de manera exitosa.');
      tbRefrescarClick(Self);
    finally
      aLista.Free;
      AfterScroll := aMetodo;
      GotoBookmark(APointer);
      EnableControls;
    end;
  end;

end;


procedure TfrmCartaAuditConsultorio.DoAsignarDatosReporte(var rpt: TrptAuditConsultorio);
begin
  with rpt do
  begin
    qrlSiniestro.Caption        := sdqConsulta.FieldByName('SINIESTRO').AsString;
    qrlDiagnostico.Caption      := sdqConsulta.FieldByName('EX_DIAGNOSTICO').AsString;
    qrlTipo.Caption             := sdqConsulta.FieldByName('TIPO').AsString;
    qrlFechaAccidente.Caption   := sdqConsulta.FieldByName('EX_FECHAACCIDENTE').AsString;
    qrlFechaRecaida.Caption     := sdqConsulta.FieldByName('EX_FECHARECAIDA').AsString;
    qrlAltaMedica.Caption       := sdqConsulta.FieldByName('EX_ALTAMEDICA').AsString;
    qrlBajaMedica.Caption       := sdqConsulta.FieldByName('EX_BAJAMEDICA').AsString;
    qrlCuit.Caption             := sdqConsulta.FieldByName('EX_CUIT').AsString;
    qrlEmpresa.Caption          := sdqConsulta.FieldByName('EMPRESA').AsString;
    qrlCuil.Caption             := sdqConsulta.FieldByName('EX_CUIL').AsString;
    qrlTrabajador.Caption       := sdqConsulta.FieldByName('TRABAJADOR').AsString;

    qrlPrestId.Caption          := sdqConsulta.FieldByName('PIPRESTID').AsString; // Prestador del parte de ingreso
    qrlPrestCuit.Caption        := sdqConsulta.FieldByName('PIPRESTCUIT').AsString;
    qrlPrestRSocial.Caption     := sdqConsulta.FieldByName('PIPRESTDESC').AsString;

    qrlNroParte.Caption         := sdqConsulta.FieldByName('PV_NROPARTE').AsString;
    qrlFechaControl.Caption     := sdqConsulta.FieldByName('PV_FECHACONTROL').AsString;
    qrlProximoControl.Caption   := sdqConsulta.FieldByName('PV_PROXIMOCONTROL').AsString;
    qrlProbableAlta.Caption     := sdqConsulta.FieldByName('PV_PROBABLEALTA').AsString;
    qrlInternadoDesde.Caption   := sdqConsulta.FieldByName('PV_INTERNADODESDE').AsString;
    qrlInternadoHasta.Caption   := sdqConsulta.FieldByName('PV_INTERNADOHASTA').AsString;
    qrlSitioInternacion.Caption := sdqConsulta.FieldByName('PV_SITIOINTERNACION').AsString;
    qrlTurno.Caption            := sdqConsulta.FieldByName('PV_TURNO').AsString;
    qrlTurnoHora.Caption        := sdqConsulta.FieldByName('PV_TURNOHORA').AsString;

    qrlPVPrestId.Caption        := sdqConsulta.FieldByName('PVPRESTID').AsString;   // Prestador del parte evolutivo
    qrlPVPrestCuit.Caption      := sdqConsulta.FieldByName('PVPRESTCUIT').AsString;
    qrlPVPrestRSocial.Caption   := sdqConsulta.FieldByName('PVPRESTDESC').AsString;

    qrlTipoTratamiento.Caption  := sdqConsulta.FieldByName('PV_TIPOTRATAMIENTO').AsString;
    qrlTTratamiento.Caption     := sdqConsulta.FieldByName('TTRATAMIENTO').AsString;
    qrlPVDiagnostico.Caption    := sdqConsulta.FieldByName('PV_DIAGNOSTICO').AsString;
    qrlPVDiagnosticooms.Caption := sdqConsulta.FieldByName('PV_DIAGNOSTICOOMS').AsString;
    qrlDGDiagnosticooms.Caption := sdqConsulta.FieldByName('DG_DESCRIPCION').AsString;
    qrlPVMedico.Caption         := sdqConsulta.FieldByName('PV_MEDICO').AsString;
    qrlPVMedicacion.Caption     := sdqConsulta.FieldByName('PV_MEDICACION').AsString;
    qrlPVReposo.Caption         := sdqConsulta.FieldByName('PV_REPOSO').AsString;
    qrlPVObservaciones.Lines.Text := sdqConsulta.FieldByName('PV_OBSERVACIONES').AsString;
    qrlUsuario.Caption          := Sesion.Usuario;
  end;
end;

end.
