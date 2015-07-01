unit unTableroControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit,
  ComboEditor, CheckCombo, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, IntEdit,
  unFraCodigoDescripcion, unFraTrabajador, unFraTrabajadorSiniestro_D5,
  unFraTrabajadorSinGrave, unFraDomicilio, unFraEstablecimiento,unHistoricoEstado,
  unHistoricoPrevAccidente, unInfInvestigacionAccidentes,unSeguimientoAccidente,
  unSeguimientoInvestigacion, unEventosAccidentes,unReasignacionCP,
  unFraTrabajadorSiniestro, unNotificacionSiniestros, unGrids;

type
  TfrmTableroControl = class(TfrmCustomGridABM)
    pcFiltros: TPageControl;
    tbGeneral: TTabSheet;
    fraEmpresaFiltro: TfraEmpresa;
    lbCUITFiltro: TLabel;
    lbEstadoFiltro: TLabel;
    lbFechaAccidenteFiltro: TLabel;
    edFechaAccidenteFiltro: TDateEdit;
    Label4: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
//    sdqConsultaAE_FECHA: TDateTimeField;
    PageControl: TPageControl;
    tbSiniestro: TTabSheet;
    tbInvestigacion: TTabSheet;
    ScrollBox1: TScrollBox;
    sdqListaPrevSugeridos: TSDQuery;
    ToolButton1: TToolButton;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodos: TToolButton;
    Panel1: TPanel;
    lbColor2: TLabel;
    lbColor3: TLabel;
    lbColor1: TLabel;
    fpCambioEstadoTerminado: TFormPanel;
    Bevel4: TBevel;
    Label37: TLabel;
    btnAceptarCambioTerminado: TButton;
    btnCancel: TButton;
    edFechaCierreMasivo: TDateEdit;
    tbCambiarTerminado: TToolButton;
    fpCambioNoInvestigar: TFormPanel;
    Bevel1: TBevel;
    Label9: TLabel;
    btnAceptarCambioNoInvestigar: TButton;
    btnCancelarNoInvestigar: TButton;
    edFechaCierreNoInvestigar: TDateEdit;
    edObservacionesNoInvestigar: TMemo;
    Label10: TLabel;
    tbCambiarNoInvestigar: TToolButton;
    ScrollBox: TScrollBox;
    gbDatosEmpresa: TGroupBox;
    lbCUIT: TLabel;
    lbDomicilioempresa: TLabel;
    lbTelefonoEmpresa: TLabel;
    lbCIIU: TLabel;
    lbDescripcion: TLabel;
    fraEmpresa: TfraEmpresa;
    fraDomicilioEmpresa: TfraDomicilio;
    edTelefonoEmpresa: TPatternEdit;
    edCIIU: TEdit;
    edCiiuDescripcion: TEdit;
    gbDatosTrabajador: TGroupBox;
    Label1: TLabel;
    lbTelefono: TLabel;
    fraDomicilioAccidente: TfraDomicilio;
    edTelefonoAccidente: TPatternEdit;
    GroupBox1: TGroupBox;
    lbFechaAccidente: TLabel;
    edFechaAccidente: TDateEdit;
    gbDescripciones: TGroupBox;
    lbBreveDescripcion: TLabel;
    lbObservacionExpediente: TLabel;
    lbDescripcionDenuncia: TLabel;
    lbObservacionDenuncia: TLabel;
    lbDescripcionOtros: TLabel;
    lbObservacionOtros: TLabel;
    edBreveDescripcion: TMemo;
    edObservacionesExpediente: TMemo;
    edDescripcionDenuncia: TMemo;
    edObservacionDenuncia: TMemo;
    edDescripcionOtros: TMemo;
    edObservacionOtros: TMemo;
    gbEstado: TGroupBox;
    tbCambioEstado: TToolBar;
    tbHistoricoEstado: TToolButton;
    fraEstado: TfraCodigoDescripcion;
    lbEstado: TLabel;
    gbLugarAccidenteInvestigado: TGroupBox;
    fraDomicilioAccidenteInvestigado: TfraDomicilio;
    GroupBox2: TGroupBox;
    lbEstablecimientoTrabajador: TLabel;
    fraEstablecimientoTrabajador: TfraEstablecimiento;
    gbPreventor: TGroupBox;
    tbCambioPreventor: TToolBar;
    tbHistoricoPreventor: TToolButton;
    fraPreventorAsignado: TfraCodigoDescripcion;
    lbPreventorAsignado: TLabel;
    cbPreventorSugerido: TCheckBox;
    Label20: TLabel;
    edFechaAsiganicion: TDateEdit;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    edFechaInvestigacion: TDateEdit;
    Label2: TLabel;
    edFechaVencimientoInvestigacion: TDateEdit;
    Label8: TLabel;
    edFechaCierre: TDateEdit;
    GroupBox4: TGroupBox;
    edObservaciones: TMemo;
    lbObservaciones: TLabel;
    pnlColor1: TPanel;
    pnlColor2: TPanel;
    pnlColor3: TPanel;
    ColorDialog: TColorDialog;
    Label24: TLabel;
    Label25: TLabel;
    pnlColor4: TPanel;
    Label22: TLabel;
    pnlColor5: TPanel;
    Label3: TLabel;
    pnlColor6: TPanel;
    Label5: TLabel;
    pnlColor7: TPanel;
    Label7: TLabel;
    cmbEstado: TCheckCombo;
    cbVencidos: TCheckBox;
    ToolBar1: TToolBar;
    tbInvestigacionAccidente: TToolButton;
    tbSeguimientoAccidente: TToolButton;
    tbSeguimientoInvestigacion: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    tsEventos: TTabSheet;
    tbPreventor: TToolButton;
    fraDomicilioEstablecimiento: TfraDomicilio;
    fraTrabajadorABM: TfraTrabajadorSiniestro;
    lbCalle: TLabel;
    tbNotifAdicional: TToolButton;

    procedure FormCreate(Sender: TObject);
    procedure cbPreventorSugeridoClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodosClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAceptarCambioTerminadoClick(Sender: TObject);
    procedure tbCambiarTerminadoClick(Sender: TObject);
    procedure btnAceptarCambioNoInvestigarClick(Sender: TObject);
    procedure tbCambiarNoInvestigarClick(Sender: TObject);
    procedure tbHistoricoEstadoClick(Sender: TObject);
    procedure tbHistoricoPreventorClick(Sender: TObject);
    procedure tbInvestigacionAccidenteClick(Sender: TObject);
    procedure pnlColorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbPanelClick(Sender: TObject);
    procedure lbColorClick(Sender: TObject);
    procedure tbSeguimientoAccidenteClick(Sender: TObject);
    procedure tbSeguimientoInvestigacionClick(Sender: TObject);
    procedure tbPreventorClick(Sender: TObject);
    procedure fraEstablecimientoOnChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);virtual;
    procedure tbNotifAdicionalClick(Sender: TObject);
  private
    SelectedList: TBookMarkLst;
  protected
    FId : Integer;
    FIdExpediente : Integer;
    FFrmEventosAccidentes   : TfrmEventosAccidentes;
    FFechaHoy : TDateTime;
    procedure ClearControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmTableroControl: TfrmTableroControl;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, SqlOracle,
  unCustomConsulta, DateUtils, General, Registros;

{ TfrmManObservaciones }

procedure TfrmTableroControl.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  fraTrabajadorABM.Clear;
  edFechaAccidente.Clear;
  fraDomicilioAccidente.Clear;
  edTelefonoAccidente.Clear;
  fraDomicilioEmpresa.Clear;
  edTelefonoEmpresa.Clear;
  edCIIU.Clear;
  edCiiuDescripcion.Clear;
  edBreveDescripcion.Clear;
  edObservacionesExpediente.Clear;
  edDescripcionDenuncia.Clear;
  edObservacionDenuncia.Clear;
  edDescripcionOtros.Clear;
  edObservacionOtros.Clear;
  fraEstado.Clear;
  fraDomicilioAccidenteInvestigado.Clear;
  fraEstablecimientoTrabajador.Clear;
  edObservaciones.Clear;
  fraPreventorAsignado.Clear;
  cbPreventorSugerido.Checked := False;
  edFechaVencimientoInvestigacion.Clear;
  edFechaCierre.Clear;
  fraEstablecimientoTrabajador.Modified := False;
  fraDomicilioAccidenteInvestigado.Modified := False;
end;

procedure TfrmTableroControl.FormCreate(Sender: TObject);
begin
  inherited;
  tbSalir.Left := 500;
  vclExtra.LockControl(fraDomicilioEstablecimiento, true);
  SelectedList := TBookMarkLst.Create;
  PageControl.ActivePageIndex := 0;
  vclextra.LockControls([fraEmpresa,edFechaAccidente,fraTrabajadorABM,
                         fraDomicilioAccidente,edTelefonoAccidente,
                         fraDomicilioEmpresa,edTelefonoEmpresa,edCIIU,edCiiuDescripcion,
                         edBreveDescripcion,edObservacionesExpediente,
                         edDescripcionDenuncia,edObservacionDenuncia,
                         edDescripcionOtros,edObservacionOtros,
                         edFechaAsiganicion,edFechaInvestigacion],True);
  fraTrabajadorABM.ShowBajas := True;
  with fraPreventorAsignado do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraEmpresa do
  begin
    ShowBajas := True;
  end;
  with fraEmpresaFiltro do
  begin
    ShowBajas := True;
  end;
  with fraPreventorFiltro do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  {with fraEstadoFiltro do
  begin
    TableName := 'hys.heg_estadogestionaccidente';
    FieldDesc := 'EG_DESCRIPCION';
    FieldID := 'EG_ID';
    FieldCodigo := 'EG_ID';
    FieldBaja := 'EG_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;}

  FFrmEventosAccidentes := TfrmEventosAccidentes.Create( Self );
  FFrmEventosAccidentes.Parent     := tsEventos;
  FFrmEventosAccidentes.Visible    := True;
  FFrmEventosAccidentes.Align      := alClient;

 // FieldBaja := 'GA_FECHABAJA';

 FFechaHoy := DBDate;
 fraEstablecimientoTrabajador.ShowBajas := True;
 fraEstablecimientoTrabajador.OnChange := fraEstablecimientoOnChange;

  Sql.TableName := 'HYS.HGA_GESTIONACCIDENTE';
  //-------[ Carga los Colores ]----------------------------------------------------------------//
  lbColor1.Font.Color := StrToInt(GetRegFromValue(Self, lbColor1.Caption, IntToStr(lbColor1.Font.Color)));
  lbColor2.Font.Color := StrToInt(GetRegFromValue(Self, lbColor2.Caption, IntToStr(lbColor2.Font.Color)));
  lbColor3.Font.Color := StrToInt(GetRegFromValue(Self, lbColor3.Caption, IntToStr(lbColor3.Font.Color)));
  pnlColor4.Color := StrToInt(GetRegFromValue(Self, pnlColor4.Hint, IntToStr(pnlColor4.Color)));
  pnlColor5.Color := StrToInt(GetRegFromValue(Self, pnlColor5.Hint, IntToStr(pnlColor5.Color)));
  pnlColor6.Color := StrToInt(GetRegFromValue(Self, pnlColor6.Hint, IntToStr(pnlColor6.Color)));
  pnlColor7.Color := StrToInt(GetRegFromValue(Self, pnlColor7.Hint, IntToStr(pnlColor7.Color)));
end;



function TfrmTableroControl.Validar: Boolean;
begin
  Verificar((fraEstado.Codigo <> '1') and (fraEstado.Codigo <> '4') and (fraEstado.Codigo <> '6') and not(fraPreventorAsignado.IsSelected),
            fraPreventorAsignado,'Debe Asignar el Preventor.');
  Verificar(not fraEstado.IsSelected, fraEstado, 'Debe Seleccionar un Estado.');
  Verificar(fraPreventorAsignado.IsSelected and (fraEstado.Codigo = '1'),fraEstado,'El Estado no Puede ser Sin Asignar cuando tiene un preventor asignado.');
  Verificar(((fraEstado.Codigo = '4')or (fraEstado.Codigo = '5'))and (edFechaCierre.Date = 0),edFechaCierre,'Debe estar Especificada la fecha de cierre.');
  Verificar(((fraEstado.Codigo <> '4')and (fraEstado.Codigo <> '5'))and (edFechaCierre.Date <> 0),fraEstado,'Debe ser No investigar o Cerrado si tiene fecha de cierre.');
  Verificar(ExisteSql(
    ' SELECT 1 '+
    '   FROM pit_firmantes '+
    '  WHERE it_id = '+SqlValue(fraPreventorAsignado.Codigo)+' AND it_email IS NULL'
            ),fraPreventorAsignado,'Debe tener mail asignado el preventor.');

  Verificar(
      Trim(fraDomicilioAccidenteInvestigado.CPA) = '',
      fraDomicilioAccidenteInvestigado,
      'Debe ingresar un código de CPA.'
  );

  Result := True;
  if not (fraEstado.Descripcion = 'NO INVESTIGAR') and not(fraEstado.Codigo = '6') then
  begin
    Verificar(not fraEstablecimientoTrabajador.IsSelected, fraEstablecimientoTrabajador,'Debe Seleccionar Establecimiento.');
    if not fraDomicilioAccidenteInvestigado.IsEmpty and not fraDomicilioAccidenteInvestigado.IsValid then
      Result := false;
  end;
end;

procedure TfrmTableroControl.cbPreventorSugeridoClick(Sender: TObject);
var
  sqlIn: String;
  cpostal, provincia,actividad,sector :String;
  idtipoestab, idActividad, cantempleados : Integer;
begin
  if cbPreventorSugerido.Checked then
  begin
    fraPreventorAsignado.Clear;
    sqlIn := '';
    sdqListaPrevSugeridos.SQL.Clear;
    sdqListaPrevSugeridos.ParamCheck := false;
    with GetQuery(
        ' SELECT es_cpostal, es_provincia, '+
        '        NVL ((SELECT ep_idtipoestabprev '+
        '               FROM hys.hep_estabporpreventor '+
        '               WHERE ep_cuit = em_cuit AND ep_estableci = es_nroestableci), '+
        '             5 '+
        '            ) ep_idtipoestabprev, '+
        '        NVL ((SELECT ep_actividad '+
        '                FROM hys.hep_estabporpreventor '+
        '               WHERE ep_cuit = em_cuit AND ep_estableci = es_nroestableci), '+
        '             art.hys.getactividadestablecimiento (em_cuit, es_nroestableci) '+
        '            ) actividad, '+
        '        em_sector, es_idactividad, '+
        '        NVL (co_totempleadosactual, co_totempleados) empleados '+
        '   FROM aco_contrato, afi.aem_empresa, afi.aes_establecimiento '+
        '  WHERE co_contrato = es_contrato AND em_id = co_idempresa AND es_id = '+ SqlValue(fraEstablecimientoTrabajador.Value)
      ) do
      try
        cpostal       := FieldByName('es_cpostal').AsString;
        provincia     := FieldByName('es_provincia').AsString;
        actividad     := FieldByName('actividad').AsString;
        sector        := FieldByName('em_sector').AsString;
        idtipoestab   := FieldByName('ep_idtipoestabprev').AsInteger;
        idActividad   := FieldByName('es_idactividad').AsInteger;
        cantempleados := FieldByName('empleados').AsInteger;
      finally
        free;
      end;


      sdqListaPrevSugeridos.SQL.Add(
        ' begin '+
        '   art.hys.get_listapreventor_sugerido('+ SqlValue(cpostal)+', '+ SqlValue(provincia)+', '+
        SqlValue(idtipoestab)+', '+ SqlValue(actividad)+', '+ SqlValue(sector)+', '+
        SqlValue(idActividad)+', '+ SqlValue(cantempleados)+',:cursor);'+
        ' end;');
      sdqListaPrevSugeridos.Params.Clear;
      sdqListaPrevSugeridos.Params.CreateParam(ftCursor, 'cursor', ptOutput);

    {else
    begin
      if not fraDomicilioAccidenteInvestigado.IsEmpty then
        sdqListaPrevSugeridos.SQL.Add(
          ' SELECT distinct hpc.pc_idpreventor as idpreventor '+
          '   FROM hys.hpc_perfilcondicionprev hpcp, hys.hpc_preventorcpostal hpc '+
          '  WHERE pc_codigo = '+SqlValue(fraDomicilioAccidenteInvestigado.CodigoPostal)+
          '    AND pc_provincia = '+SqlValue(fraDomicilioAccidenteInvestigado.Prov)+
          '    AND hpcp.pc_idpreventor = hpc.pc_idpreventor '+
          '    AND pc_fechabaja IS NULL ' )
      else
        sdqListaPrevSugeridos.SQL.Add(
          ' SELECT distinct hpc.pc_idpreventor as idpreventor '+
          '   FROM hys.hpc_perfilcondicionprev hpcp, hys.hpc_preventorcpostal hpc '+
          '  WHERE pc_codigo = '+SqlValue(fraDomicilioAccidente.CodigoPostal)+
          '    AND pc_provincia = '+SqlValue(fraDomicilioAccidente.Prov)+
          '    AND hpcp.pc_idpreventor = hpc.pc_idpreventor '+
          '    AND pc_fechabaja IS NULL ' );
      sdqListaPrevSugeridos.Params.Clear;
    end;

    }
    sdqListaPrevSugeridos.Prepare;
    sdqListaPrevSugeridos.Open;
    while not sdqListaPrevSugeridos.Eof do
    begin
      if sqlIn <> '' then
        sqlIn := sqlIn + ', ';
      sqlIn := sqlIn + sdqListaPrevSugeridos.fieldbyname('idpreventor').AsString;
      sdqListaPrevSugeridos.Next;
    end;
    sdqListaPrevSugeridos.Close;
    if (sqlIn <> '') then
    begin
      fraPreventorAsignado.ExtraCondition := fraPreventorAsignado.ExtraCondition + ' and it_id in ( ' + sqlIn + ')';
      fraPreventorAsignado.cmbDescripcionDropDown(sender);
      if fraPreventorAsignado.sdqDatos.RecordCount = 1 then
        fraPreventorAsignado.SelectFirst;
    end
    else
      fraPreventorAsignado.ExtraCondition := ' and 1 = 2 ';
  end
  else begin
    fraPreventorAsignado.ExtraCondition := '';
    fraPreventorAsignado.Clear;
  end;
end;

procedure TfrmTableroControl.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('ga_id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('ga_id').AsString, sdqConsulta.GetBookmark)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('ga_id').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmTableroControl.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmTableroControl.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('ga_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmTableroControl.tbDesSeleccionarTodoClick(Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
{$ENDIF}
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmTableroControl.tbSeleccionarTodosClick(Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ga_id').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('ga_id').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;
end;

procedure TfrmTableroControl.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;



procedure TfrmTableroControl.btnAceptarCambioTerminadoClick(Sender: TObject);
var
 i : Integer;
begin
  BeginTrans(True);
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      if ExisteSql(
        ' SELECT 1 FROM hys.hga_gestionaccidente WHERE ga_fechacierre is null '+
        '    AND ga_id = '+SelectedList.Strings[i]) then
      EjecutarSqlST(
        ' UPDATE hys.hga_gestionaccidente '+
        '    SET ga_idestado = 5, '+
        '        ga_fechacierre = '+SqlValue(edFechaCierreMasivo.Date)+', '+
        '        ga_fechamodif = sysdate,'+
        '        ga_usumodif   = '+ SqlValue(Sesion.UserID)+
        '  WHERE ga_id = '+SelectedList.Strings[i]);
    end;
    CommitTrans(true);
    SelectedList.Clear;
    fpCambioEstadoTerminado.ModalResult := mrOk;
    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al cambiar el Estado.');
    end;
  end;
end;

procedure TfrmTableroControl.tbCambiarTerminadoClick(Sender: TObject);
begin
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  edFechaCierreMasivo.Clear;
  fpCambioEstadoTerminado.ShowModal;
end;

procedure TfrmTableroControl.btnAceptarCambioNoInvestigarClick(
  Sender: TObject);
var
 i:Integer;
begin
  BeginTrans(True);
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      if ExisteSql(
        ' SELECT 1 FROM hys.hga_gestionaccidente WHERE ga_fechacierre is null '+
        '    AND ga_id = '+SelectedList.Strings[i]) then
      EjecutarSqlST(
        ' UPDATE hys.hga_gestionaccidente '+
        '    SET ga_idestado = 4, '+
        '        ga_fechacierre = '+SqlValue(edFechaCierreNoInvestigar.Date)+','+
        '        ga_observaciones = '+SqlValue(edObservacionesNoInvestigar.Text)+', '+
        '        ga_fechamodif = sysdate,'+
        '        ga_usumodif   = '+ SqlValue(Sesion.UserID)+
        '  WHERE ga_id = '+SelectedList.Strings[i]);
    end;
    CommitTrans(true);
    SelectedList.Clear;
    fpCambioEstadoTerminado.ModalResult := mrOk;
    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al cambiar el Estado.');
    end;
  end;
end;

procedure TfrmTableroControl.tbCambiarNoInvestigarClick(Sender: TObject);
begin
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  edFechaCierreNoInvestigar.Clear;
  edObservacionesNoInvestigar.Clear;
  fpCambioNoInvestigar.ShowModal;
end;



procedure TfrmTableroControl.tbHistoricoEstadoClick(Sender: TObject);
begin
  with TfrmHistoricoEstado.Create(nil) do
  try
    MostrarHistorico(FId);
    tbRefrescar.Visible := False;
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmTableroControl.tbHistoricoPreventorClick(Sender: TObject);
begin
  with TfrmHistoricoPrevAccidente.Create(nil) do
  try
    MostrarHistorico(FId);
    tbRefrescar.Visible := False;
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmTableroControl.tbInvestigacionAccidenteClick(
  Sender: TObject);
begin
  with TfrmInfInvestigacionAccidentes.Create(nil) do
  try
    FormStyle := fsNormal;
    fraTrabajadorSinGraveBusq.IdSiniestro := FIdExpediente;
    OnfraTrabajadorSinGraveBusqChange(nil);
    tbModificarClick(nil);
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmTableroControl.pnlColorClick(Sender: TObject);
begin
  ColorDialog.Color := TPanel(Sender).Color;
  if ColorDialog.Execute then
    TPanel(Sender).Color := ColorDialog.Color;
end;

procedure TfrmTableroControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SetRegFromValue(Self, lbColor1.Caption, IntToStr(lbColor1.Font.Color));
  SetRegFromValue(Self, lbColor2.Caption, IntToStr(lbColor2.Font.Color));
  SetRegFromValue(Self, lbColor3.Caption, IntToStr(lbColor3.Font.Color));
  SetRegFromValue(Self, pnlColor4.Hint, IntToStr(pnlColor4.Color));
  SetRegFromValue(Self, pnlColor5.Hint, IntToStr(pnlColor5.Color));
  SetRegFromValue(Self, pnlColor6.Hint, IntToStr(pnlColor6.Color));
  SetRegFromValue(Self, pnlColor7.Hint, IntToStr(pnlColor7.Color));
end;

procedure TfrmTableroControl.LbPanelClick(Sender: TObject);
begin
  pnlColorClick(TLabel(Sender).FocusControl);
end;

procedure TfrmTableroControl.lbColorClick(Sender: TObject);
begin
  ColorDialog.Color := TLabel(Sender).Font.Color;
  if ColorDialog.Execute then
    TLabel(Sender).Font.Color := ColorDialog.Color;

end;

procedure TfrmTableroControl.tbSeguimientoAccidenteClick(
  Sender: TObject);
begin
  inherited;
  with TfrmSeguimientoAccidente.Create(nil) do
  try
    FormStyle := fsNormal;
    fraTrabajadorSinGraveFiltro.IdSiniestro := FIdExpediente;
    Visible := false;
    cmbEstado.ClearChecks();
    cbPRAM.Checked := False;
    cbGrave.Checked := False;
    tbRefrescarClick(nil);
    tbModificarClick(nil);
  finally
    Free;
  end;
end;

procedure TfrmTableroControl.tbSeguimientoInvestigacionClick(
  Sender: TObject);
begin
  inherited;
  with TfrmSeguimientoInvestigacion.Create(nil) do
  try
    FormStyle := fsNormal;
    fraTrabajadorSinGraveFiltro.IdSiniestro := FIdExpediente;
    cmbEstado.ClearChecks();
    cbPRAM.Checked := False;
    cbGrave.Checked := False;
    tbRefrescarClick(nil);
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmTableroControl.tbPreventorClick(Sender: TObject);
begin
  inherited;
  with TfrmReasignacionCP.Create(nil) do
  try
    {FormStyle := fsNormal;
    fraTrabajadorSinGraveFiltro.IdSiniestro := FIdExpediente;
    cmbEstado.ClearChecks();
    cbPRAM.Checked := False;
    cbGrave.Checked := False;
    tbRefrescarClick(nil);   }
    pnAceptarPreventor.Visible := True;
    Visible := false;
    ShowModal;
    if FIDPreventor <> 0 then
      fraPreventorAsignado.Codigo := IntToStr(FIDPreventor);
  finally
    Free;
  end;

end;

procedure TfrmTableroControl.fraEstablecimientoOnChange(Sender: TObject);
begin
  with GetQuery(
      ' SELECT es_calle, es_numero, es_piso, es_departamento, es_cpostala, '+
      '        es_localidad, es_cpostal, es_provincia, pv_descripcion '+
      '   FROM aes_establecimiento, art.cpv_provincias '+
      '  WHERE es_id = '+SqlValue(fraEstablecimientoTrabajador.Value)+' AND es_provincia = pv_codigo')do
  begin
    fraDomicilioEstablecimiento.Cargar(FieldByName('es_calle').AsString,FieldByName('es_cpostal').AsString,
      FieldByName('es_localidad').AsString,FieldByName('es_numero').AsString,FieldByName('es_piso').AsString,
      FieldByName('es_departamento').AsString,FieldByName('es_provincia').AsString,FieldByName('es_cpostala').AsString);
  end;
end;

procedure TfrmTableroControl.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  cmbEstado.Clear;
  edFechaAccidenteFiltro.Clear;
  fraPreventorFiltro.Clear;
end;

procedure TfrmTableroControl.tbNotifAdicionalClick(Sender: TObject);
begin
  with TfrmNotificacionSiniestros.Create(nil) do
  try
    if not self.sdqConsulta.IsEmpty then
      Contrato :=  self.sdqConsulta.FieldByName('co_contrato').AsInteger;

    FormStyle := fsNormal;
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

end.
