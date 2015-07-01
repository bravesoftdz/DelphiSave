unit unCeseILT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, StdCtrls, Mask, ToolEdit, DateComboBox,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, Menus, Buttons,
  unfraFirmante, FormPanel, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraDelegacion, unFraGrupoTrabajo, SinEdit,
  CheckPanel, unfraCtbTablas, RxToolEdit, RxPlacemnt;

type
  TfrmCeseILT = class(TfrmCustomConsulta)
    gbFechaCarga: TGroupBox;
    DTPHasta: TDateComboBox;
    Label2: TLabel;
    DTPDesde: TDateComboBox;
    gpGrupoTrabajo: TGroupBox;
    gbDelegacion: TGroupBox;
    fpGenerarCarta: TFormPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    btnAceptarCarta: TBitBtn;
    fraFirmante: TfraCodigoDescripcion;
    tbEnviarEmail: TToolButton;
    tbGenerarCartaTrab: TToolButton;
    tbSalir2: TToolButton;
    ToolButton9: TToolButton;
    fraDelegacion: TfraDelegacion;
    gbDiasDif: TGroupBox;
    rbMenorDias: TRadioButton;
    rbMayorDias: TRadioButton;
    rbTodosDias: TRadioButton;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    gbOrigen: TGroupBox;
    fraMotivos: TfraCodigoDescripcion;
    tbGenerarCartaEmpl: TToolButton;
    ToolButton1: TToolButton;
    fpFechaILT: TFormPanel;
    Label33: TLabel;
    Bevel7: TBevel;
    btnAceptarILT: TBitBtn;
    dcCeseILT: TDateComboBox;
    tbCeseILT: TToolButton;
    ToolButton7: TToolButton;
    Label3: TLabel;
    SinCese: TSinEdit;
    cpSiniestro: TCheckPanel;
    edSiniestro: TSinEdit;
    mnuImprimir: TPopupMenu;
    mnuImprimirGrilla: TMenuItem;
    mnuImprimirCeseILT: TMenuItem;
    Panel1: TPanel;
    chkTrabGenerada: TCheckBox;
    chkEmplGenerada: TCheckBox;
    chkMailGenerado: TCheckBox;
    gbRegionSanitPrest: TGroupBox;
    fraRegionSanitaria: TfraCtbTablas;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure btnAceptarCartaClick(Sender: TObject);
    procedure fpGenerarCartaBeforeShow(Sender: TObject);
    procedure tbGenerarCartaTrabClick(Sender: TObject);
    procedure tbEnviarEmailClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbGenerarCartaEmplClick(Sender: TObject);
    procedure tbCeseILTClick(Sender: TObject);
    procedure btnAceptarILTClick(Sender: TObject);
    procedure fpFechaILTBeforeShow(Sender: TObject);
    procedure OnMotivoChange(Sender: TObject);
    procedure cpSiniestroChange(Sender: TObject);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure mnuImprimirCeseILTClick(Sender: TObject);
    procedure edSiniestroSelect(Sender: TObject);
    procedure fpGenerarCartaShow(Sender: TObject);
  private
    FRegistrosSeleccionados: TStringList;
    procedure DoEnviarMailEmpleador(Cuit :String; IdContrato, IdSeg :Integer; EsReenvio :Boolean);
    procedure DoEnviarCartaMail(bSoloMail, bCartaTrab :Boolean);
    procedure DoActualizarSeg(IdSeg :Integer; bEsCarta, bCartaTrab :Boolean);
    procedure DoHabilitarBotones;
    procedure DoCargarPorSiniestro;
    procedure DoHabilitarFiltros(bHabilitar :Boolean);
    function HayRegistroActivo :Boolean;
  public
    { Public declarations }
  end;

var
  frmCeseILT: TfrmCeseILT;

implementation

uses CustomDlgs, AnsiSql, uncomunes, unDmPrincipal, General, unSesion,
     VCLExtra, unArt, unRptCartaDocHeader, unRptCeseDeILT, unTercerizadoras, unSiniestros;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  FRegistrosSeleccionados.Clear;
  DoHabilitarBotones;
  edSiniestro.Clear;
  DTPDesde.Clear;
  DTPHasta.Clear;
  fraGrupoTrabajo.Clear;
  fraDelegacion.Clear;
  chkTrabGenerada.Checked := False;
  chkEmplGenerada.Checked := False;
  chkMailGenerado.Checked := False;
  rbMenorDias.Checked     := True;
  fraMotivos.Value        := '1';
  fraRegionSanitaria.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(edSiniestro.IsEmpty and DTPDesde.IsEmpty, DTPDesde, 'Debe seleccionar rango de fechas.');
  Verificar(edSiniestro.IsEmpty and DTPHasta.IsEmpty, DTPHasta, 'Debe seleccionar rango de fechas.');
  Verificar(edSiniestro.IsEmpty and fraMotivos.IsEmpty, fraMotivos, 'Debe seleccionar el origen del cese.');

  FRegistrosSeleccionados.Clear;
  sSql := 'SELECT null checkbox, ex_id, ex_siniestro, ex_orden, ex_recaida, gc_fechaalta, ' +
                ' utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, utiles.armar_cuit(em_cuit) cuit, ' +
                ' em_nombre empresa, ''('' || ca_identificador || '') - '' || ca_descripcion prestador, ' +
                ' gp_nombre gtrabajo, lg_nombre delegacion, tj_id, co_contrato, ' +
                ' siniestro.get_usuariogestor(ex_id) usugestor, gc_dias, ' +
                ' gc_fechamail, gc_fechacartaemp, gc_fechacartatrab, gc_id, ' +
                ' sc_idtextocartatrab, sc_id idaccion, sc_idtextocartaempl, ' +
                ' gc_notificacionenviada, gc_fechaform, sc_idtextocartatrabgob, ' +
                ' gp_codigo, lg_codigo, ex_fechaaccidente, ex_cuit, region.tb_descripcion RegSanitPrest ' +
           ' FROM sex_expedientes, ctj_trabajador, aem_empresa, cpr_prestador, ' +
                ' dlg_delegaciones, mgp_gtrabajo, aco_contrato, sin.sgc_seguimientocese, ' +
                ' sin.ssc_situacionorigen, art.crp_regionesprestador, art.ctb_tablas region ' +   // TK 26875
          ' WHERE ex_id = gc_idexpediente ' +
            ' AND gc_origen = sc_id ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND co_idempresa = em_id' +
            ' AND co_contrato = NVL(afiliacion.get_contratovigente(ex_cuit, ex_fechaaccidente),afiliacion.GET_ULTCONTRATO(ex_cuit)) ' +
            ' AND NVL(gc_idprestador, ex_prestador) = ca_identificador ' +
            ' AND ex_gtrabajo = gp_codigo ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND gc_fechabaja IS NULL ' +
            ' AND NVL(ex_causafin,''0'') NOT IN (''02'', ''99'', ''95'') ' +
            ' AND RP_PRESTADOR(+) = CA_IDENTIFICADOR ' +     // TK 26875
            ' AND region.tb_clave(+) = ''REGSA'' ' +
            ' AND region.tb_codigo(+) = rp_region ' +
            ' AND rp_domicilio(+) = ''S'' ' ;

  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND gc_idexpediente = ' + SqlInt(Get_IdExpediente(edSiniestro.Siniestro,
                                                                       edSiniestro.Orden,
                                                                       edSiniestro.Recaida))
  else begin
    sSql := sSql + ' AND gc_fechaalta BETWEEN ' + SqlDate(DTPDesde.Date) + ' AND ' + SqlDate(DTPHasta.Date) +
                   ' AND gc_notificacionenviada = ' + IIF(chkMailGenerado.Checked, '''S''', '''N''') +
                   ' AND gc_fechacartaemp IS ' + IIF(chkEmplGenerada.Checked, 'NOT', '') + ' NULL ' +
                   ' AND gc_origen = ' + SqlInt(fraMotivos.ID);

    if chkTrabGenerada.Checked then
      sSql := sSql + ' AND ((gc_fechacartatrab IS NOT NULL) or (gc_fechaform IS NOT NULL)) '
    else
      sSql := sSql + ' AND gc_fechacartatrab IS NULL AND gc_fechaform IS NULL ';

    if not(fraDelegacion.IsEmpty) then
      sSql := sSql + ' AND lg_codigo = ' + SqlValue(fraDelegacion.Codigo);

    if not(fraGrupoTrabajo.IsEmpty) then
      sSql := sSql + ' AND gp_codigo = ' + SqlValue(fraGrupoTrabajo.Codigo);

    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
      sSql := sSql + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

    if rbMenorDias.Checked then
      sSql := sSql + ' AND (gc_dias <= 20) ';

    if rbMayorDias.Checked then
      sSql := sSql + ' AND (gc_dias > 20) ';

    if not(fraRegionSanitaria.IsEmpty) then         // TK 26875
      sSql := sSql + ' AND rp_region = ' + SqlValue(fraRegionSanitaria.Codigo);

    if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
      sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  end;
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  DoCargarPorSiniestro;
  DoHabilitarBotones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.FormCreate(Sender: TObject);
begin
  inherited;
  FRegistrosSeleccionados       := TStringList.Create;
  tbGenerarCartaEmpl.ImageIndex := 22;
  tbGenerarCartaTrab.ImageIndex := 22;
  tbEnviarEmail.ImageIndex      := 39;
  tbSalir2.ImageIndex           := 8;
  tbCeseILT.ImageIndex          := 38;

  with fraFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := True;
    Sql         := ' SELECT DISTINCT fi_id AS ID, fi_id AS codigo, ' +
                          ' fi_firmante AS descripcion, fa_fechabaja AS baja ' +
                     ' FROM cat_areatexto, cfa_firmantearea, cfi_firma ' +
                    ' WHERE fa_idfirmante = fi_id ' +
                      ' AND fa_idareatexto = at_id ' +
                      ' AND at_area = ' +  SqlValue(AREA_MED) +
                      ' AND fa_fechabaja IS NULL ' +
                      ' AND fi_fechabaja IS NULL ' +
                      ' AND at_fechabaja IS NULL ';
    OrderBy   := 'fi_firmante';
  end;

  with fraMotivos do
  begin
    TableName   := 'sin.ssc_situacionorigen';
    FieldID     := 'sc_id';
    FieldCodigo := 'sc_id';
    FieldDesc   := 'sc_descripcion';
    FieldBaja   := 'sc_fechabaja';
    ShowBajas   := False;
    OrderBy     := 'sc_id';
    ExtraFields := ', sc_idtextocartatrab, sc_idtextocartaempl, sc_requierecartatrab, ' +
                    ' sc_requieremail, sc_requierecartaempl, sc_cargacese, sc_ambascartas, ' +
                    ' sc_forzarcartatrab, sc_firmaaval ';
    SelectFirst;
    Enabled     := Seguridad.Claves.IsActive('VerOrigenCompleto');
    OnChange    := OnMotivoChange;
  end;

  with fraRegionSanitaria do  // TK 26875
  begin
    Clave     := 'REGSA';
    ShowBajas := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.GridCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('ex_id').AsString);
    Grid.Repaint;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCeseILT.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not sdqConsulta.IsEmpty;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
                                         DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
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
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.btnMarcarTodos(Sender: TObject);
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
      FRegistrosSeleccionados.Add(FieldByName('ex_id').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    Screen.Cursor := crDefault;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.FSFormDestroy(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.DoEnviarMailEmpleador(Cuit :String; IdContrato, IdSeg :Integer; EsReenvio :Boolean);
begin
  if ValidarEmpresaConfidencial(Cuit, AREA_MED) then
  begin
    Do_EnviarMailCeseILT(IdContrato, IdSeg, EsReenvio);
    DoActualizarSeg(IdSeg, False, False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.btnAceptarCartaClick(Sender: TObject);
begin
  Verificar(fraFirmante.IsEmpty, fraFirmante, 'Debe seleccionar el firmante.');
  fpGenerarCarta.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.fpGenerarCartaBeforeShow(Sender: TObject);
begin
  fraFirmante.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.tbGenerarCartaTrabClick(Sender: TObject);
begin
  DoEnviarCartaMail(False, (fraMotivos.sdqDatos.FieldByName('sc_requieremail').AsString = 'S'));
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.tbEnviarEmailClick(Sender: TObject);
begin
  DoEnviarCartaMail(True, True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.DoEnviarCartaMail(bSoloMail, bCartaTrab :Boolean);
var
  aLista :TStringList;
  aMetodo :TDataSetNotifyEvent;
  aPointer :TBookMark;
  bEsSinGob :Boolean;
  sArea :String;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');
  if (not(bSoloMail) and MsgAsk('¿Confirma generar la carta documento para el/los registro/s seleccionado/s?') and
     (fpGenerarCarta.ShowModal = mrOk)) or
     (bSoloMail and MsgAsk('¿Confirma enviar el mail para el/los registro/s seleccionado/s?')) then
  begin
    aLista                  := TStringList.Create;
    aMetodo                 := sdqConsulta.AfterScroll;
    sdqConsulta.AfterScroll := nil;
    aPointer                := sdqConsulta.GetBookmark;
    sArea := IIF(AreIn(fraMotivos.Codigo, ['7','8']), AREA_RECA, AREA_MED);
    with sdqConsulta do
    try
      DisableControls;
      First;
      BeginTrans;
      while not Eof do
      try
        if FRegistrosSeleccionados.IndexOf(FieldByName('ex_id').AsString) > -1 then
        begin
          if not bSoloMail then
          begin
            bEsSinGob := Is_SiniestroDeGobernacion(FieldByName('ex_id').AsInteger);
            DoInsertarCarta(IIF(bCartaTrab, IIF(bEsSinGob, FieldByName('sc_idtextocartatrabgob').AsInteger,
                                                           FieldByName('sc_idtextocartatrab').AsInteger),
                                            FieldByName('sc_idtextocartaempl').AsInteger),
                            FieldByName('ex_siniestro').AsInteger,
                            FieldByName('ex_orden').AsInteger,
                            FieldByName('ex_recaida').AsInteger,
                            fraFirmante.Codigo, sArea, False,
                            ART_EMPTY_ID,
                            Iif(bCartaTrab, tdTrabajador, tdEmpresa), '', 0, 0, 0, 0, 0, '', 0, 0, 0, '',
                            iif(fraMotivos.sdqDatos.FieldByName('sc_firmaaval').AsString <> '', fraMotivos.sdqDatos.FieldByName('sc_firmaaval').AsInteger, 0));
            DoActualizarSeg(FieldByName('gc_id').AsInteger, True, bCartaTrab);
          end;
          if bCartaTrab and (FieldByName('gc_notificacionenviada').AsString = 'N') then
            DoEnviarMailEmpleador(FieldByName('ex_cuit').AsString,
                                  FieldByName('co_contrato').AsInteger,
                                  FieldByName('gc_id').AsInteger,
                                  bSoloMail and not(FieldByName('gc_fechamail').IsNull));
        end;
        Next;
      except
        on E:Exception do
        begin
          Rollback(True);
          ErrorMsg(E, 'Error al intentar guardar los datos.');
          Exit;
        end;
      end;
      CommitTrans;
      MsgBox('La operación se llevó a cabo de manera exitosa.');
    finally
      aLista.Free;
      AfterScroll := aMetodo;
      GotoBookmark(APointer);
      EnableControls;
    end;
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.DoActualizarSeg(IdSeg :Integer; bEsCarta, bCartaTrab :Boolean);
var
  sSql :String;
begin
  sSql      := 'UPDATE sin.sgc_seguimientocese ';
  if bEsCarta then
  begin
    sSql := sSql + ' SET gc_estado = ''M'', ';
    if bCartaTrab then
      sSql := sSql + ' gc_fechacartatrab = actualdate, ' +
                     ' gc_usucartatrab = ' + SqlValue(Sesion.UserID)
    else
      sSql := sSql + ' gc_fechacartaemp = actualdate, ' +
                     ' gc_usucartaemp = ' + SqlValue(Sesion.UserID);
  end
  else
    sSql := sSql + ' SET gc_estado = ''T'', ' +
                       ' gc_fechamail = actualdate, ' +
                       ' gc_usumail = ' + SqlValue(Sesion.UserID);

  sSql := sSql + ' WHERE gc_id = ' + SqlInt(IdSeg);
  EjecutarSqlST(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.DoHabilitarBotones;
var
  bHabilitaMailEmpleador, bHabilitaCartaEmpleador :Boolean;
begin
  bHabilitaMailEmpleador      := (fraMotivos.sdqDatos.FieldByName('sc_requieremail').AsString = 'S') and
                                 not(chkMailGenerado.Checked) and not(sdqConsulta.EOF);

  bHabilitaCartaEmpleador     := (fraMotivos.sdqDatos.FieldByName('sc_requierecartaempl').AsString = 'S') and
                                 not(chkEmplGenerada.Checked) and not(sdqConsulta.EOF);

  tbGenerarCartaTrab.Enabled  := (fraMotivos.sdqDatos.FieldByName('sc_requierecartatrab').AsString = 'S') and
                                 (not(chkTrabGenerada.Checked) or (fraMotivos.sdqDatos.FieldByName('sc_forzarcartatrab').AsString = 'S')) and
                                 (not(bHabilitaCartaEmpleador) or (fraMotivos.sdqDatos.FieldByName('sc_ambascartas').AsString = 'S')) and
                                  not(sdqConsulta.EOF);
  tbGenerarCartaEmpl.Enabled  := bHabilitaCartaEmpleador;
  tbEnviarEmail.Enabled       := bHabilitaMailEmpleador;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.tbGenerarCartaEmplClick(Sender: TObject);
begin
  DoEnviarCartaMail(False, False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.tbCeseILTClick(Sender: TObject);
var
  sSql :String;
begin
  if not(sdqConsulta.Active) or sdqConsulta.IsEmpty then Exit;
  if (fpFechaILT.ShowModal = mrOk) then
  try
    BeginTrans;
    sSql := 'UPDATE sex_expedientes ' +
              ' SET ex_fechaceseilt = ' + SqlDate(dcCeseILT.Date) + ',' +
                  ' ex_usumodif = ' + SqlValue(Sesion.UserID) + ',' + 
                  ' ex_origenceseilt = ''I'' ' +
            ' WHERE ex_id = ' + SqlInt(sdqConsulta.FieldByName('ex_id').AsInteger);
    EjecutarSqlST(sSql);
    if MsgAsk('¿Desea enviar el mail de aviso al empleador?') then
      DoEnviarMailEmpleador(sdqConsulta.FieldByName('ex_cuit').AsString,
                            sdqConsulta.FieldByName('co_contrato').AsInteger,
                            sdqConsulta.FieldByName('gc_id').AsInteger,
                            not(sdqConsulta.FieldByName('gc_fechamail').IsNull));
    CommitTrans;
    tbRefrescarClick(Nil);
  except
    on E:exception do
    begin
      ErrorMsg(E);
      Rollback;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.btnAceptarILTClick(Sender: TObject);
begin
  Verificar(dcCeseILT.IsEmpty, dcCeseILT, 'Debe seleccionar fecha');
  fpFechaILT.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.fpFechaILTBeforeShow(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT ex_fechaceseilt ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_id = :IdExped ';
  dcCeseILT.Date := ValorSqlDateTimeEx(sSql, [sdqConsulta.FieldByName('ex_id').AsInteger]);
  SinCese.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsInteger,
                    sdqConsulta.FieldByName('ex_orden').AsInteger,
                    sdqConsulta.FieldByName('ex_recaida').AsInteger);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.OnMotivoChange(Sender: TObject);
begin
  tbCeseILT.Enabled := Seguridad.Activar(tbCeseILT) and
                       (fraMotivos.sdqDatos.FieldByName('sc_cargacese').AsString = 'S');//solo para incapacidades
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.cpSiniestroChange(Sender: TObject);
begin
  tbLimpiarClick(Nil);
  DoHabilitarFiltros(not cpSiniestro.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.DoCargarPorSiniestro;
begin
  if not(edSiniestro.IsEmpty) then
    if (sdqConsulta.IsEmpty) then
      MsgBox('El siniestro ingresado no se encuentra disponible para Notificación de Cese.')
    else begin
      DTPDesde.Date                   := sdqConsulta.FieldByName('gc_fechaalta').AsDateTime;
      DTPHasta.Date                   := sdqConsulta.FieldByName('gc_fechaalta').AsDateTime;
      fraMotivos.Codigo               := sdqConsulta.FieldByName('idaccion').AsString;
      chkTrabGenerada.Checked         := not(sdqConsulta.FieldByName('gc_fechacartatrab').IsNull) or
                                         not(sdqConsulta.FieldByName('gc_fechaform').IsNull);
      chkMailGenerado.Checked         := (sdqConsulta.FieldByName('gc_notificacionenviada').AsString = 'S');
      chkEmplGenerada.Checked         := not(sdqConsulta.FieldByName('gc_fechacartaemp').IsNull);
      fraGrupoTrabajo.Codigo          := sdqConsulta.FieldByName('gp_codigo').AsString;
      fraGrupoTrabajo.cmbGestor.Text  := sdqConsulta.FieldByName('usugestor').AsString;
      fraDelegacion.Codigo            := sdqConsulta.FieldByName('lg_codigo').AsString;
      rbMenorDias.Checked             := (sdqConsulta.FieldByName('gc_dias').AsInteger <= 20);
      rbMayorDias.Checked             := (sdqConsulta.FieldByName('gc_dias').AsInteger > 20);
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.DoHabilitarFiltros(bHabilitar :Boolean);
begin
  LockControls([DTPDesde, DTPHasta, fraMotivos, fraGrupoTrabajo, chkTrabGenerada,
                chkEmplGenerada, chkMailGenerado, rbMenorDias, rbMayorDias,
                rbTodosDias, fraDelegacion, fraRegionSanitaria], not bHabilitar);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.mnuImprimirGrillaClick(Sender: TObject);
begin
  QueryPrint.Title.Text := 'Notificaciones de Cese de ILT';
  QueryPrint.Print;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.mnuImprimirCeseILTClick(Sender: TObject);   // TK 10544    ***...????????
var rptCeseDeILT: TrptCeseDeILT;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');
  Verificar((FRegistrosSeleccionados.Count > 1), Grid, 'Debe seleccionar un solo registro para obtener el reporte de Cese de ILT');

  rptCeseDeILT := TrptCeseDeILT.Create(Self);
  Try
    rptCeseDeILT.Imprimir(sdqConsulta.FieldByName('EX_ID').AsInteger, True);
  finally
    rptCeseDeILT.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCeseILT.edSiniestroSelect(Sender: TObject);
begin
  if (not ValidarSiniestroUsuarioTerce(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)) then       // por Plan Ioma - Tercerizadoras
  begin
    MsgBox('Ud. no posee permisos para visualizar este siniestro.', MB_ICONEXCLAMATION);
    tbLimpiarClick(nil);
  end;
end;

procedure TfrmCeseILT.fpGenerarCartaShow(Sender: TObject);
begin
  fraFirmante.Codigo := fraMotivos.sdqDatos.FieldByName('sc_firmaaval').AsString;
  vclextra.LockControls(fraFirmante, fraMotivos.sdqDatos.FieldByName('sc_firmaaval').AsString <> '');

end;

end.
