unit unMedicamentosCronicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Buttons, unArtFrame, unFraDomicilio,
  SinEdit, FormPanel, Mask, PatternEdit, IntEdit, ToolEdit, DateComboBox,
  CheckLst, ARTCheckListBox, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, PeriodoPicker;

type
  TModoABM = (maNone, maAlta, maModificacion);
  TfrmMedicamentosCronicos = class(TfrmCustomConsulta)
    fpAltaPacientes: TFormPanel;
    edSiniestroPac: TSinEdit;
    Label1: TLabel;
    chkPrioridadPac: TCheckBox;
    fraDomicilioPac: TfraDomicilio;
    Label2: TLabel;
    edTrabajadorPac: TEdit;
    Bevel7: TBevel;
    btnAceptarPac: TBitBtn;
    btnCancelarPac: TBitBtn;
    Label3: TLabel;
    edCodAreaPac: TEdit;
    Label4: TLabel;
    edTelefonoPac: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edSinHasta: TIntEdit;
    edSinDesde: TIntEdit;
    edObservPac: TMemo;
    Label6: TLabel;
    gbFechaPostAlta: TGroupBox;
    Label7: TLabel;
    dcMedDesde: TDateComboBox;
    dcMedHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    rbPrioNo: TRadioButton;
    rbPrioSi: TRadioButton;
    rbPrioTodos: TRadioButton;
    fpMedicBase: TFormPanel;
    Label8: TLabel;
    Label9: TLabel;
    edSiniestroBase: TSinEdit;
    edTrabajadorBase: TEdit;
    btnCerrarBase: TBitBtn;
    Bevel2: TBevel;
    ToolButton1: TToolButton;
    tbBaseMedic: TToolButton;
    tbGenPeriodo: TToolButton;
    ToolButton9: TToolButton;
    tbSalir2: TToolButton;
    Label10: TLabel;
    fraMedicBase: TfraCodigoDescripcion;
    Bevel3: TBevel;
    btnAgregarBase: TBitBtn;
    btnQuitarBase: TBitBtn;
    chkSustBase: TCheckBox;
    rbDroga: TRadioButton;
    rbMedic: TRadioButton;
    fraPresentBase: TfraCodigoDescripcion;
    Label11: TLabel;
    fraDrogaBase: TfraCodDesc;
    dgMedicBase: TArtDBGrid;
    dsBase: TDataSource;
    sdqBase: TSDQuery;
    fpPeriodo: TFormPanel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel5: TBevel;
    edSiniestroPer: TSinEdit;
    edTrabajadorPer: TEdit;
    Label14: TLabel;
    ppPeriodos: TPeriodoPicker;
    edMes: TEdit;
    ppPerBase: TPeriodoPicker;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    SinEdit: TSinEdit;
    fpSelPeriodo: TFormPanel;
    Bevel6: TBevel;
    btnAceptarSel: TBitBtn;
    btnCancelarSel: TBitBtn;
    ppSel: TPeriodoPicker;
    Label18: TLabel;
    edSel: TEdit;
    clbPeriodos: TARTCheckListBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbNuevoPer: TToolButton;
    tbModificarPer: TToolButton;
    tbEliminarPer: TToolButton;
    ToolButton2: TToolButton;
    tbGuardarPer: TToolButton;
    tbCancelarPer: TToolButton;
    ToolButton7: TToolButton;
    tbCerrarPer: TToolButton;
    gbFecha: TGroupBox;
    Label17: TLabel;
    dcAcciDesde: TDateComboBox;
    dcAcciHasta: TDateComboBox;
    gbPeriodo: TGroupBox;
    ppPerFiltro: TPeriodoPicker;
    ToolButton10: TToolButton;
    tbCerrarPeriodo: TToolButton;
    Bevel1: TBevel;
    edObserBase: TEdit;
    Label19: TLabel;
    fpModifMedic: TFormPanel;
    Label20: TLabel;
    Bevel4: TBevel;
    Label21: TLabel;
    chkSustituirMod: TCheckBox;
    edObservMod: TEdit;
    btnAceptarMod: TBitBtn;
    btnCancelarMod: TBitBtn;
    edMedicDrogaMod: TEdit;
    Bevel8: TBevel;
    tbProcesarPeriodos: TToolButton;
    ToolButton13: TToolButton;
    rbDescartable: TRadioButton;
    ToolButton12: TToolButton;
    tbComplementario: TToolButton;
    fpComplementario: TFormPanel;
    Label22: TLabel;
    Bevel10: TBevel;
    chkSustComp: TCheckBox;
    edMaterialComp: TEdit;
    btnAceptarComp: TBitBtn;
    btnCancelarComp: TBitBtn;
    tbProcesarPeriodo: TToolButton;
    GroupBox3: TGroupBox;
    rbProceNo: TRadioButton;
    rbProceSi: TRadioButton;
    rbProceTodos: TRadioButton;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure edSinDesdeExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure edSiniestroPacSelect(Sender: TObject);
    procedure btnAceptarPacClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbBaseMedicClick(Sender: TObject);
    procedure rbDrogaClick(Sender: TObject);
    procedure rbMedicClick(Sender: TObject);
    procedure fpMedicBaseClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAgregarBaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraDrogaBasePropiedadesChange(Sender: TObject);
    procedure btnQuitarBaseClick(Sender: TObject);
    procedure tbGenPeriodoClick(Sender: TObject);
    procedure fpAltaPacientesBeforeShow(Sender: TObject);
    procedure ppPeriodosChange(Sender: TObject);
    procedure ppSelChange(Sender: TObject);
    procedure fpSelPeriodoBeforeShow(Sender: TObject);
    procedure tbNuevoPerClick(Sender: TObject);
    procedure btnAceptarSelClick(Sender: TObject);
    procedure tbCancelarPerClick(Sender: TObject);
    procedure tbGuardarPerClick(Sender: TObject);
    procedure tbCerrarPerClick(Sender: TObject);
    procedure tbModificarPerClick(Sender: TObject);
    procedure fpPeriodoBeforeShow(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbEliminarPerClick(Sender: TObject);
    procedure fpMedicBaseBeforeShow(Sender: TObject);
    procedure tbCerrarPeriodoClick(Sender: TObject);
    procedure dgMedicBaseDblClick(Sender: TObject);
    procedure clbPeriodosDblClick(Sender: TObject);
    procedure rbDescartableClick(Sender: TObject);
    procedure tbProcesarPeriodosClick(Sender: TObject);
    procedure tbComplementarioClick(Sender: TObject);
    procedure btnAceptarCompClick(Sender: TObject);
    procedure fpComplementarioBeforeShow(Sender: TObject);
    procedure tbProcesarPeriodoClick(Sender: TObject);
  private
    IdPacAct :Integer;
    ModoPer :TModoABM;
    function HayRegistroActivo :Boolean;
    function GetIdPeriodo :Integer;
    function VerificarPeriodo(iOpcion :Integer; sPeriodo :String = '';
                              sMedic :String = ''; sDroga :String = ''; sPresent :String = '') :Boolean;
    function OuterJoin :String;
    function ConfirmaCantidad :Boolean;    
    procedure DoHabilitarBaseMedic;
    procedure DoCargarFP(Sini :TSinEdit; Trab :TEdit);
    procedure DoCargarPeriodo(sPer :String);
    procedure DoHabilitarCarga(bHabilitar :Boolean; Modo :TModoABM);
    procedure DoActualizarMedic(iIdMedic, iPeriodo :Integer; bCheckeado :Boolean; Modo :TModoAbm);
    procedure SetPeriodoNombre(pPeriodo :TPeriodoPicker; edSel :TEdit);
    procedure DoModificarMedicDroga(bBase :Boolean; IdMedicDroga :Integer);
  public
    { Public declarations }
  end;

var
  frmMedicamentosCronicos: TfrmMedicamentosCronicos;

implementation

uses AnsiSql, unComunes, CustomDlgs, SqlFuncs, unDmPrincipal, General,
  unSesion, VCLExtra, objPeriodo, Strfuncs;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbNuevoClick(Sender: TObject);
begin
  edSiniestroPac.Clear;
  edTrabajadorPac.Clear;
  fraDomicilioPac.Clear;
  edCodAreaPac.Clear;
  edTelefonoPac.Clear;
  edObservPac.Clear;
  chkPrioridadPac.Checked := False;
  fpAltaPacientes.Caption := 'Pacientes crónicos con medicación - Alta';
  fpAltaPacientes.Tag     := 0;
  fpAltaPacientes.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre, gp_nombre, ' +
                ' DECODE(pc_prioridad, 0, ''Si'', ''No'') prioridad, pc_observaciones, ' +
                ' art.utiles.armar_domicilio(pc_calle, pc_numero, pc_piso, pc_departamento, pc_localidad) domicilio, ' +
                ' pc_codareatel || '' - '' || pc_telefono telefono, pc_id, ' +
                ' pc_codareatel, pc_telefono, ex_siniestro, ex_orden, ex_recaida, ' +
                ' pc_calle, pc_cpostal, pc_localidad, pc_numero, pc_piso, pc_departamento, ' +
                ' pc_provincia, pc_prioridad, pc_fechaalta, ex_fechaaccidente, ' +
                ' art.siniestro.get_medicamentosperiodo(pp_id) medic ' +
           ' FROM art.sex_expedientes, ctj_trabajador, art.mgp_gtrabajo, ' +
                ' sin.spc_pacientescronicos, sin.spp_periodospacientes ' +
          ' WHERE ex_id = pc_idexpediente ' +
            ' AND pc_id = pp_idpaciente' + OuterJoin +
            ' AND TO_CHAR(pp_periodo' + OuterJoin + ', ''mm/yyyy'') = ' + SqlValue(ppPerFiltro.Periodo.Valor) +
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_gtrabajo = gp_codigo ' +
            ' AND nvl(ex_causafin, '' '') NOT IN (''02'', ''99'', ''95'') ' +
            ' AND pc_fechabaja IS NULL ' +
            ' AND pp_fechabaja' + OuterJoin + ' IS NULL';
  //---------------------------------------------------------------------------
  if not(SinEdit.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro = ' + SqlInt(SinEdit.Siniestro) +
                   ' AND ex_orden = ' + SqlInt(SinEdit.Orden) +
                   ' AND ex_recaida = '+ SqlInt(SinEdit.Recaida);
  //---------------------------------------------------------------------------
  if not(edSinDesde.IsEmpty) and not(edSinHasta.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro BETWEEN ' + edSinDesde.TextSql + ' AND ' + edSinHasta.TextSql
  else if not(edSinDesde.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro >= ' + edSinDesde.TextSql
  else if not(edSinHasta.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro <= ' + edSinHasta.TextSql;
  //---------------------------------------------------------------------------
  if not(dcMedDesde.IsEmpty) and not(dcMedHasta.IsEmpty) then
    sSql := sSql + ' AND pc_fechaalta BETWEEN ' + dcMedDesde.SqlText + ' AND ' + dcMedHasta.SqlText
  else if not(dcMedDesde.IsEmpty) then
    sSql := sSql + ' AND pc_fechaalta >= ' + dcMedDesde.SqlText
  else if not(dcMedHasta.IsEmpty) then
    sSql := sSql + ' AND pc_fechaalta <= ' + dcMedHasta.SqlText;
  //-------------------------------------------------------------------------
  if not(dcAcciDesde.IsEmpty) and not(dcAcciHasta.IsEmpty) then
    sSql := sSql + ' AND ex_fechaaccidente BETWEEN ' + dcAcciDesde.SqlText + ' AND ' + dcAcciHasta.SqlText
  else if not(dcAcciDesde.IsEmpty) then
    sSql := sSql + ' AND ex_fechaaccidente >= ' + dcAcciDesde.SqlText
  else if not(dcAcciHasta.IsEmpty) then
    sSql := sSql + ' AND ex_fechaaccidente <= ' + dcAcciHasta.SqlText;
  //-------------------------------------------------------------------------
  if not rbPrioTodos.Checked then
    sSql := sSql + ' AND pc_prioridad = ' + IIF(rbPrioSi.Checked, '0', '1');
  //-------------------------------------------------------------------------
  if not rbProceTodos.Checked then
    sSql := sSql + ' AND ' + IIF(rbProceSi.Checked, 'NOT', '') +
                   ' EXISTS(SELECT 1 ' +
                            ' FROM SIN.smp_medicamentospacientes ' +
                           ' WHERE mp_idperiodo = pp_id ' +
                             ' AND mp_fechabaja IS NULL ' +
                             ' AND mp_idautenviada IS NULL) ';
  //-------------------------------------------------------------------------
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.edSinDesdeExit(Sender: TObject);
begin
  if not(edSinDesde.IsEmpty) and edSinHasta.IsEmpty then
    edSinHasta.Value := edSinDesde.Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbLimpiarClick(Sender: TObject);
begin
  edSinDesde.Clear;
  edSinHasta.Clear;
  dcMedDesde.Clear;
  dcMedHasta.Clear;
  SinEdit.Clear;
  dcAcciDesde.Clear;
  dcAcciHasta.Clear;
  ppPerFiltro.Clear;
  rbPrioTodos.Checked   := True;
  rbProceTodos.Checked  := True;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.edSiniestroPacSelect(Sender: TObject);
var
  sSql :String;
begin
  if not(edSiniestroPac.ReadOnly) then
  begin
    sSql := 'SELECT tj_nombre, tj_calle, tj_cpostal, tj_localidad, tj_numero, tj_piso, ' +
                  ' tj_departamento, tj_provincia, tj_cpostala, tj_codareatelefono, ' +
                  ' art.trabajador.get_telefono(tj_id, 4) Telefono ' +
             ' FROM art.sex_expedientes, ctj_trabajador ' +
            ' WHERE ex_cuil = tj_cuil ' +
              ' AND ex_id = :IdExped ';
    with GetQueryEx(sSql, [Get_IdExpediente(edSiniestroPac.Siniestro, edSiniestroPac.Orden, edSiniestroPac.Recaida)]) do
    try
      edTrabajadorPac.Text  := FieldByName('tj_nombre').AsString;
      edCodAreaPac.Text     := FieldByName('tj_codareatelefono').AsString;
      edTelefonoPac.Text    := FieldByName('telefono').AsString;
      fraDomicilioPac.Cargar(FieldByName('tj_calle').AsString, FieldByName('tj_cpostal').AsString,
                             FieldByName('tj_localidad').AsString, FieldByName('tj_numero').AsString,
                             FieldByName('tj_piso').AsString, FieldByName('tj_departamento').AsString,
                             FieldByName('tj_provincia').AsString, FieldByName('tj_cpostala').AsString);
    finally
      Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.btnAceptarPacClick(Sender: TObject);
var
  sSql :String;
  IdExped :Integer;
begin
  Verificar(edSiniestroPac.IsEmpty, edSiniestroPac, 'Debe seleccionar un siniestro.');
  IdExped := Get_IdExpediente(edSiniestroPac.Siniestro, edSiniestroPac.Orden, edSiniestroPac.Recaida);

  if (fpAltaPacientes.Tag = 0) then
  begin
    sSql    := 'SELECT 1 FROM sin.spc_pacientescronicos ' +
               ' WHERE pc_idexpediente = :IdExped ' +
                 ' AND pc_fechabaja IS NULL ';
    Verificar(ExisteSqlEx(sSql, [IdExped]), edSiniestroPac, 'El siniestro seleccionado ya posee un plan de medicamentos.');

    sSql    := 'INSERT INTO sin.spc_pacientescronicos ( ' +
               ' pc_idexpediente, pc_prioridad, pc_observaciones, pc_calle, pc_numero, ' +
               ' pc_piso, pc_departamento, pc_localidad, pc_provincia, pc_cpostal, ' +
               ' pc_codareatel, pc_telefono, pc_fechaalta, pc_usualta) VALUES ( ' +
               SqlInt(IdExped) + ',' + IIF(chkPrioridadPac.Checked, '0', '1') + ',' +
               SqlValue(edObservPac.Lines.Text) + ',' + SqlValue(fraDomicilioPac.Calle) + ',' +
               SqlValue(fraDomicilioPac.Numero) + ',' + SqlValue(fraDomicilioPac.Piso) + ',' +
               SqlValue(fraDomicilioPac.Departamento) + ',' + SqlValue(fraDomicilioPac.Localidad) + ',' +
               SqlValue(fraDomicilioPac.Prov) + ',' + SqlValue(fraDomicilioPac.CodigoPostal) + ',' +
               SqlValue(edCodAreaPac.Text) + ',' + SqlValue(edTelefonoPac.Text) + ',' +
               ' actualdate, ' + SqlValue(Sesion.UserID) + ')';
  end
  else begin
    sSql    := 'UPDATE sin.spc_pacientescronicos  ' +
                 ' SET pc_prioridad = ' + IIF(chkPrioridadPac.Checked, '0', '1') + ',' +
                     ' pc_observaciones = ' + SqlValue(edObservPac.Lines.Text) + ',' +
                     ' pc_calle = ' + SqlValue(fraDomicilioPac.Calle) + ',' +
                     ' pc_numero = ' + SqlValue(fraDomicilioPac.Numero) + ',' +
                     ' pc_piso = ' + SqlValue(fraDomicilioPac.Piso) + ',' +
                     ' pc_departamento = ' + SqlValue(fraDomicilioPac.Departamento) + ',' +
                     ' pc_localidad = ' + SqlValue(fraDomicilioPac.Localidad) + ',' +
                     ' pc_provincia = ' + SqlValue(fraDomicilioPac.Prov) + ',' +
                     ' pc_cpostal = ' + SqlValue(fraDomicilioPac.CodigoPostal) + ',' +
                     ' pc_codareatel = ' + SqlValue(edCodAreaPac.Text) + ',' +
                     ' pc_telefono = ' + SqlValue(edTelefonoPac.Text) + ',' +
                     ' pc_fechamodif = actualdate, ' +
                     ' pc_usumodif = ' + SqlValue(Sesion.UserID) +
               ' WHERE pc_id = ' + SqlInt(IdPacAct);
  end;
  EjecutarSql(sSql);
  if sdqConsulta.Active then sdqConsulta.Refresh;
  fpAltaPacientes.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbModificarClick(Sender: TObject);
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un siniestro.');
  with sdqConsulta do
  begin
    DoCargarFP(edSiniestroPac, edTrabajadorPac);
    fraDomicilioPac.Cargar(FieldByName('pc_calle').AsString, FieldByName('pc_cpostal').AsString,
                           FieldByName('pc_localidad').AsString, FieldByName('pc_numero').AsString,
                           FieldByName('pc_piso').AsString, FieldByName('pc_departamento').AsString,
                           FieldByName('pc_provincia').AsString, '');
    edCodAreaPac.Text       := FieldByName('pc_codareatel').AsString;
    edTelefonoPac.Text      := FieldByName('pc_telefono').AsString;
    chkPrioridadPac.Checked := IIF(FieldByName('pc_prioridad').AsInteger = 0, True, False);
    edObservPac.Lines.Text  := FieldByName('pc_observaciones').AsString;
  end;
  fpAltaPacientes.Caption := 'Pacientes crónicos con medicación - Modificación';
  fpAltaPacientes.Tag     := 1;
  fpAltaPacientes.ShowModal;
end;
{-------------------------------------------------------------------------------}
function TfrmMedicamentosCronicos.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un siniestro.');
  if MsgAsk('¿Confirma la eliminación del paciente seleccionado?' + #13 +
            'Advertencia: se daran de baja todos los períodos generados y sus medicamentos') then
  begin
    sSql := 'UPDATE sin.spc_pacientescronicos ' +
              ' SET pc_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pc_fechabaja = actualdate ' +
            ' WHERE pc_id = ' + SqlInt(sdqConsulta.FieldByName('pc_id').AsInteger);
    EjecutarSql(sSql);
    sdqConsulta.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbBaseMedicClick(Sender: TObject);
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un siniestro.');
  DoCargarFP(edSiniestroBase, edTrabajadorBase);
  sdqBase.ParamByName('IdPac').AsInteger  := IdPacAct;
  sdqBase.Open;
  rbDroga.Checked         := True;
  ppPerBase.Periodo.Valor := sdqBase.FieldByName('ma_periodo').AsString;
  fpMedicBase.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.DoHabilitarBaseMedic;
begin
  fraDrogaBase.Clear;
  fraPresentBase.Clear;
  fraMedicBase.Clear;
  edObserBase.Clear;
  chkSustBase.Checked := False;
  LockControls([fraMedicBase, chkSustBase], rbDroga.Checked or rbDescartable.Checked);
  LockControl(fraDrogaBase, rbMedic.Checked or rbDescartable.Checked);
  LockControl(fraPresentBase, True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.rbDrogaClick(Sender: TObject);
begin
  DoHabilitarBaseMedic;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.rbMedicClick(Sender: TObject);
begin
  DoHabilitarBaseMedic;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.fpMedicBaseClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  sdqBase.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.btnAgregarBaseClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(rbDroga.Checked and fraDrogaBase.IsEmpty, fraDrogaBase, 'Debe seleccionar la droga.');
  Verificar(rbDroga.Checked and fraPresentBase.IsEmpty, fraPresentBase, 'Debe seleccionar la presentación.');
  Verificar(rbMedic.Checked and fraMedicBase.IsEmpty, fraMedicBase, 'Debe seleccionar el medicamento.');
  Verificar(rbDescartable.Checked and IsEmptyString(Trim(edObserBase.Text)), edObserBase,
            'Debe ingresar la descripción del material descartable.');

  if (rbDroga.Checked and VerificarPeriodo(0, '', '', fraDrogaBase.ID, fraPresentBase.ID)) or
     (rbMedic.Checked and VerificarPeriodo(1, '', fraMedicBase.ID, '', '')) or
     rbDescartable.Checked then
  try
    BeginTrans;
    sSql := 'art.siniestro.do_insertarmedicbase(' +
                  SqlInt(IdPacAct) + ',' + SqlValue(Sesion.UserID) + ',' +
                  SqlInt(fraMedicBase.ID, True) + ',' + SqlInt(fraDrogaBase.ID, True) + ',' +
                  SqlInt(fraPresentBase.ID, True) + ',' +
                  SqlValue(Trim(edObserBase.Text)) + ',' +
                  IIF(chkSustBase.Checked, '''N''', IIF(rbMedic.Checked, '''S''', 'NULL')) + ',' +
                  SqlBoolean(rbDescartable.Checked) + ');';
    EjecutarStoreST(sSql);
    CommitTrans;
    sdqBase.Refresh;
    DoHabilitarBaseMedic;
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al intentar agregar medicamento/droga');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.FormCreate(Sender: TObject);
begin
  inherited;
  with fraPresentBase do
  begin
    TableName       := 'MPR_PRESENTACIONES';
    FieldID         := 'PR_ID';
    FieldCodigo     := 'PR_CODIGO';
    FieldDesc       := 'PR_DESCRIPCION';
    FieldBaja       := 'PR_FECHABAJA';
    CaseSensitive   := False;
    ShowBajas       := False;
    ExtraCondition  := ' AND 1 = 2 '
  end;
  with fraMedicBase do
  begin
    TableName       := 'MME_MEDICAMENTOS';
    FieldID         := 'ME_ID';
    FieldCodigo     := 'ME_ID';
    FieldDesc       := 'ME_DESCRIPCION';
    FieldBaja       := 'ME_FECHABAJA';
    ExtraCondition  := ' AND NVL(ME_BAJA, ''0'') = ''0'' ';
    CaseSensitive   := False;
    ShowBajas       := False;
  end;
  tbSalir2.ImageIndex           := 8;
  tbBaseMedic.ImageIndex        := 40;
  tbGenPeriodo.ImageIndex       := 38;
  tbProcesarPeriodos.ImageIndex := 11;
  ppPerFiltro.Periodo.Valor := ValorSql('SELECT TO_CHAR(SYSDATE, ''MM/YYYY'') FROM DUAL');
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.fraDrogaBasePropiedadesChange(Sender: TObject);
begin
  fraPresentBase.Clear;
  if fraDrogaBase.IsEmpty then
    fraPresentBase.ExtraCondition := ' AND 1 = 2 '
  else
    fraPresentBase.ExtraCondition := ' AND pr_id IN (SELECT DISTINCT me_idpresentacion ' +
                                                              ' FROM mme_medicamentos, mdm_drogasxmedicamentos ' +
                                                             ' WHERE me_numeroregistro = dm_numeromedicamento ' +
                                                               ' AND me_baja = 0 ' + 
                                                               ' AND dm_codigodroga = ' + SqlInt(fraDrogaBase.Codigo) + ')';
  LockControl(fraPresentBase, fraDrogaBase.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.btnQuitarBaseClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(sdqBase.Active) or sdqBase.IsEmpty, dgMedicBase, 'Debe seleccionar medicamento/droga/material descartable.');
  if MsgAsk('¿Confirma eliminar de la base el producto seleccionado?') then
  begin
    sSql := 'SELECT 1 FROM sin.smp_medicamentospacientes, sin.spp_periodospacientes ' +
            ' WHERE pp_id = mp_idperiodo ' +
              ' AND pp_idpaciente = :IdPac ' +
              ' AND pp_secuencia <> 0 ' +
              ' AND pp_fechabaja IS NULL ' +
              ' AND mp_fechabaja IS NULL ' +
              ' AND mp_activo = ''S'' ' +
              ' AND ((mp_idmedicamento = :IdMedic ' +
              ' ) OR (mp_iddroga = :IdDroga ' +
               ' AND mp_idpresentacion = :IdPres ' + '))';
    Verificar(ExisteSqlEx(sSql, [IdPacAct, sdqBase.FieldByName('ma_idmedicamento').AsInteger,
                                 sdqBase.FieldByName('ma_iddroga').AsInteger,
                                 sdqBase.FieldByName('ma_idpresentacion').AsInteger]),
              dgMedicBase, 'El producto seleccionado se encuentra aignado a otro período.');

    sSql := 'UPDATE sin.smp_medicamentospacientes ' +
              ' SET mp_fechabaja = actualdate, ' +
                  ' mp_usubaja = ' + SqlValue(Sesion.UserID);

    if (sdqBase.FieldByName('ma_descartable').AsString = 'S') then
      sSql := sSql + ' WHERE mp_id = ' + SqlInt(sdqBase.FieldByName('ma_id').AsInteger)
    else
      sSql := sSql + ' WHERE ((mp_idmedicamento = ' + SqlInt(sdqBase.FieldByName('ma_idmedicamento').AsInteger) +
                      ' ) OR (mp_iddroga = ' + SqlInt(sdqBase.FieldByName('ma_iddroga').AsInteger, True) +
                       ' AND mp_idpresentacion = ' + SqlInt(sdqBase.FieldByName('ma_idpresentacion').AsInteger, True) + '))' +
                       ' AND mp_idperiodo IN (SELECT pp_id ' +
                                              ' FROM sin.spp_periodospacientes ' +
                                             ' WHERE pp_idpaciente = ' + SqlInt(IdPacAct) +
                                               ' AND pp_fechabaja IS NULL) ';
    EjecutarSql(sSql);
    sdqBase.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.DoCargarFP(Sini :TSinEdit; Trab :TEdit);
begin
  Sini.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsInteger,
                 sdqConsulta.FieldByName('ex_orden').AsInteger,
                 sdqConsulta.FieldByName('ex_recaida').AsInteger);
  Trab.Text := sdqConsulta.FieldByName('tj_nombre').AsString;
  IdPacAct  := sdqConsulta.FieldByName('pc_id').AsInteger;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbGenPeriodoClick(Sender: TObject);
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un siniestro.');
  DoCargarFP(edSiniestroPer, edTrabajadorPer);
  ppPeriodos.Clear;
  ppPeriodos.Periodo.Valor := IIF(ppPerFiltro.Periodo.IsNull,
                                  ValorSql('SELECT TO_CHAR(SYSDATE, ''MM/YYYY'') FROM DUAL'),
                                  ppPerFiltro.Periodo.Valor);
  fpPeriodo.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.fpAltaPacientesBeforeShow(Sender: TObject);
begin
  LockControl(edSiniestroPac, fpAltaPacientes.Tag = 1);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.ppPeriodosChange(Sender: TObject);
begin
  SetPeriodoNombre(ppPeriodos, edMes);
  DoCargarPeriodo(ppPeriodos.Periodo.Valor);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.ppSelChange(Sender: TObject);
begin
  SetPeriodoNombre(ppSel, edSel);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.fpSelPeriodoBeforeShow(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT to_char(pp_periodo, ''MM/YYYY'') ' +
           ' FROM sin.spp_periodospacientes ' +
          ' WHERE pp_idpaciente = :IdPac ' +
            ' AND pp_secuencia = 0 ' +
            ' AND pp_fechabaja IS NULL ';
  ppSel.Periodo.Valor := ValorSqlEx(sSql, [IdPacAct]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.DoCargarPeriodo(sPer :String);
var
  sSql :String;
begin
  clbPeriodos.Clear;
  sSql := 'SELECT ma_id, ma_medicdroga || ' +
                ' DECODE(ma_presentacion, NULL, NULL, '' - '' || ma_presentacion) || ' +
                ' DECODE(ma_observaciones, NULL, NULL, '' - '' || ma_observaciones) || ' +
                ' DECODE(ma_sustituir, ''N'', '' (No sustituir)'', '' ''), ' +
                ' ma_activo ' +
            'FROM v_sma_medicamentosasignados ' +
           'WHERE ma_periodo = ' + SqlValue(sPer) +
            ' AND ma_idpaciente = ' + SqlInt(IdPacAct) +
       ' ORDER BY ma_complementario, ma_descartable, ma_medicdroga, ma_nombre, ma_presentacion ';
  with GetQuery(sSql) do
  try
    while not EoF do
    begin
      clbPeriodos.Add(Fields[1].AsString, Fields[0].AsString);
      if (Fields[2].AsString = 'S') then clbPeriodos.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbNuevoPerClick(Sender: TObject);
//var
//  dPer :TDate;
begin
//  dPer := ValorSqlDateTime('SELECT TO_DATE(''01'' || ' + ppPeriodos.Periodo.Valor + ', ''DD/MM/YYYY'') FROM DUAL');
//  Verificar(ppPeriodos.Periodo.Valor < sPer, ppPeriodos, 'No es posible generar un período anterior al actual.');
  if VerificarPeriodo(2, ppPeriodos.Periodo.Valor, '', '', '') and (fpSelPeriodo.ShowModal = mrOk) then
    DoHabilitarCarga(True, maAlta);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.btnAceptarSelClick(Sender: TObject);
begin
  Verificar(ppSel.Periodo.IsNull, ppSel, 'Debe seleccionar un período.');
  if VerificarPeriodo(3, ppSel.Periodo.Valor, '', '', '') then
  begin
    DoCargarPeriodo(ppSel.Periodo.Valor);
    fpSelPeriodo.ModalResult := mrOk;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.DoHabilitarCarga(bHabilitar :Boolean; Modo :TModoABM);
begin
  tbNuevoPer.Enabled      := not bHabilitar;
  tbModificarPer.Enabled  := not bHabilitar;
  tbEliminarPer.Enabled   := not bHabilitar;
  tbGuardarPer.Enabled    := bHabilitar;
  tbCancelarPer.Enabled   := bHabilitar;
  LockControl(ppPeriodos, bHabilitar);
  LockControl(clbPeriodos, not bHabilitar);
  clbPeriodos.ClearSelection;
  ModoPer := Modo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbCancelarPerClick(Sender: TObject);
begin
  if MsgAsk('¿Desea cancelar los cambios realizados?') then
    DoHabilitarCarga(False, maNone);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbGuardarPerClick(Sender: TObject);
var
  sSql :String;
  i, iPer :Integer;
begin
  iPer := 0;
  try
    BeginTrans(True);
    if (ModoPer = maAlta) then
    begin
      sSql := 'art.siniestro.do_generarperiodo( ' + SqlInt(IdPacAct) + ',' +
                                                    SqlValue(Sesion.UserID) + ',' +
                                                    SqlValue(ppPeriodos.Periodo.Valor) + ');';
      EjecutarStoreST(sSql);
      iPer := GetIdPeriodo;
    end;

    for i := 0 to clbPeriodos.Items.Count-1 do
      DoActualizarMedic(StrToInt(clbPeriodos.Values[i]), iPer, clbPeriodos.Checked[i], ModoPer);

    DoHabilitarCarga(False, maNone);
    CommitTrans(True);
    DoCargarPeriodo(ppPeriodos.Periodo.Valor);
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al intentar agregar periodo');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmMedicamentosCronicos.GetIdPeriodo :Integer;
var
  sSql :String;
begin
  sSql := 'SELECT pp_id ' +
           ' FROM sin.spp_periodospacientes a ' +
          ' WHERE a.pp_idpaciente = :IdPac ' +
            ' AND a.pp_fechabaja IS NULL ' +
            ' AND a.pp_secuencia IN (SELECT MAX(b.pp_secuencia) ' +
                                   ' FROM sin.spp_periodospacientes b ' +
                                  ' WHERE a.pp_idpaciente = b.pp_idpaciente ' +
                                    ' AND b.pp_fechabaja IS NULL) ';
  Result := ValorSqlIntegerEx(sSql, [IdPacAct]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.DoActualizarMedic(iIdMedic, iPeriodo :Integer;
                                                     bCheckeado :Boolean; Modo :TModoAbm);
var
  sSql, sCheck :String;
  bModif :Boolean;
begin
  sCheck  := IIF(bCheckeado, 'S', 'N');
  bModif  := False;
  if (Modo = maModificacion) then
  begin
    sSql    := 'SELECT mp_activo ' +
                ' FROM sin.smp_medicamentospacientes ' +
               ' WHERE mp_id = :IdMed ';
    bModif  := (sCheck <> ValorSqlEx(sSql, [iIdMedic]));
  end;

  if bModif or (Modo = maAlta) then
  begin
    sSql := 'art.siniestro.do_actualizarmedicamento(' + SqlInt(iIdMedic) + ',' + SqlInt(iPeriodo) + ',' +
                                                        SqlValue(sCheck) + ',' + SqlBoolean(Modo = maAlta) + ',' +
                                                        SqlValue(Sesion.UserID) + ');';
    EjecutarStoreST(sSql);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbCerrarPerClick(Sender: TObject);
begin
  if (ModoPer = maNone) or
     ((ModoPer <> maNone) and MsgAsk('¿Desea salir sin guardar los cambios?')) then
    fpPeriodo.ModalResult := mrCancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbModificarPerClick(Sender: TObject);
begin
  VerificarPeriodo(4, ppPeriodos.Periodo.Valor, '', '', '');
  VerificarPeriodo(5, ppPeriodos.Periodo.Valor, '', '', '');
  DoHabilitarCarga(True, maModificacion);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.SetPeriodoNombre(pPeriodo :TPeriodoPicker; edSel :TEdit);
var
  sSec, sSql :String;
begin
  sSql := 'SELECT pp_secuencia, pp_cerrado ' +
           ' FROM sin.spp_periodospacientes ' +
          ' WHERE pp_idpaciente = :IdPac ' +
            ' AND to_char(pp_periodo, ''MM/YYYY'') = :Per ' +
            ' AND pp_fechabaja IS NULL ';
  with GetQueryEx(sSql, [IdPacAct, pPeriodo.Periodo.Valor]) do
  try
    if Eof then
      sSec := 'No posee'
    else begin
      sSec := FieldByName('pp_secuencia').AsString;
      sSec := 'Período número: ' + sSec + IIF(sSec = '0', ' (base)', '') +
              IIF(FieldByName('pp_cerrado').AsString = 'S', ' - CERRADO', '');
    end;
  finally
    Free;
  end;
  edSel.Text := pPeriodo.Periodo.GetPeriodoName + ' - ' + sSec;
end;
{-------------------------------------------------------------------------------}
//aca puse todas las verificaciones de los periodos para tenerlas mas juntitas.....
{-------------------------------------------------------------------------------}
function TfrmMedicamentosCronicos.VerificarPeriodo(iOpcion :Integer; sPeriodo :String = '';
                                                   sMedic :String = ''; sDroga :String = '';
                                                   sPresent :String = '') :Boolean;
var
  sSql :String;
begin
  Result := False;
  case iOpcion of
   0: begin
        sSql    := 'SELECT 1 ' +
                    ' FROM sin.smp_medicamentospacientes, sin.spp_periodospacientes ' +
                   ' WHERE mp_idperiodo = pp_id ' +
                     ' AND mp_iddroga = :IdDroga ' +
                     ' AND mp_idpresentacion = :IdPres ' +
                     ' AND pp_idpaciente = :IdPac ' +
                     ' AND pp_secuencia = 0 ' +
                     ' AND mp_fechabaja IS NULL ' +
                     ' AND pp_fechabaja IS NULL ';
        Result  := Verificar(ExisteSqlEx(sSql, [sDroga, sPresent, IdPacAct]), fraDrogaBase, 'La droga ya existe.');
      end;
   1: begin
        sSql    := 'SELECT 1 FROM sin.smp_medicamentospacientes, sin.spp_periodospacientes ' +
                   ' WHERE mp_idperiodo = pp_id ' +
                    '  AND mp_idmedicamento = :IdMedic ' +
                     ' AND pp_idpaciente = :IdPac ' +
                     ' AND pp_secuencia = 0 ' +
                     ' AND mp_fechabaja IS NULL ' +
                     ' AND pp_fechabaja IS NULL ';
        Result := Verificar(ExisteSqlEx(sSql, [sMedic, IdPacAct]), fraMedicBase, 'El medicamento ya existe.');
      end;
   2: begin
        sSql    := 'SELECT 1 FROM sin.spp_periodospacientes ' +
                   ' WHERE to_char(pp_periodo, ''MM/YYYY'') = :Per ' +
                     ' AND pp_idpaciente = :IdPac ' +
                     ' AND pp_fechabaja IS NULL ';
        Result := Verificar(ExisteSqlEx(sSql, [sPeriodo, IdPacAct]), ppPeriodos,
                            'El período seleccionado ya ha sido generado.');
      end;
   3: begin
        sSql    := 'SELECT 1 ' +
                    ' FROM sin.spp_periodospacientes ' +
                   ' WHERE pp_idpaciente = :IdPac ' +
                     ' AND to_char(pp_periodo, ''MM/YYYY'') = :Per ' +
                     ' AND pp_fechabaja IS NULL ';
        Result  := Verificar(not ExisteSqlEx(sSql, [IdPacAct, sPeriodo]), ppSel,
                             'El período seleccionado no ha sido generado.');
      end;
   4: begin
        sSql    := 'SELECT 1 ' +
                    ' FROM sin.spp_periodospacientes ' +
                   ' WHERE to_char(pp_periodo, ''MM/YYYY'') = :Per ' +
                     ' AND pp_idpaciente = :IdPac ' +
                     ' AND pp_fechabaja IS NULL ';
        if Verificar(not ExisteSqlEx(sSql, [sPeriodo, IdPacAct]), ppPeriodos,
                     'Debe seleccionar un período generado.') then
        begin
          sSql    := 'SELECT 1 ' +
                        ' FROM sin.spp_periodospacientes ' +
                     ' WHERE to_char(pp_periodo, ''MM/YYYY'') = :Per ' +
                       ' AND pp_idpaciente = :IdPac ' +
                       ' AND pp_fechabaja IS NULL ' +
                       ' AND pp_secuencia = 0';
          Result := Verificar(ExisteSqlEx(sSql, [sPeriodo, IdPacAct]), ppPeriodos,
                              'No es posible modificar/eliminar desde aqui el período base.');
        end;
      end;
   5: begin
        sSql    := 'SELECT pp_cerrado ' +
                    ' FROM sin.spp_periodospacientes ' +
                   ' WHERE to_char(pp_periodo, ''MM/YYYY'') = :Per ' +
                     ' AND pp_idpaciente = :IdPac ' +
                     ' AND pp_fechabaja IS NULL ';
        Result := Verificar(ValorSqlEx(sSql, [sPeriodo, IdPacAct]) = 'S', ppPeriodos,
                            'El período seleccionado ya ha sido cerrado.');
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.fpPeriodoBeforeShow(Sender: TObject);
begin
  DoHabilitarCarga(False, maNone);
end;
{-------------------------------------------------------------------------------}
function TfrmMedicamentosCronicos.OuterJoin :String;
begin
  Result := IIF(ppPerFiltro.Periodo.IsNull, '(+)', ' ');
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbImprimirClick(Sender: TObject);
begin
  Verificar(ppPerFiltro.Periodo.IsNull, ppPerFiltro, 'Debe seleccionar un período a imprimir.');
  QueryPrint.Title.Text  := 'Medicamentos de pacientes crónicos - Período ' + ppPerFiltro.Periodo.GetPeriodoName;
  QueryPrint.Footer.Text := Sesion.Usuario;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbEliminarPerClick(Sender: TObject);
var
  sSql :String;
begin
  if VerificarPeriodo(4, ppPeriodos.Periodo.Valor, '', '', '') and
     VerificarPeriodo(5, ppPeriodos.Periodo.Valor, '', '', '') and
     MsgAsk('¿Confirma eliminar el período seleccionado?') then
  begin
    sSql := 'UPDATE sin.spp_periodospacientes ' +
              ' SET pp_fechabaja = ActualDate, ' +
                  ' pp_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE to_char(pp_periodo, ''MM/YYYY'') = ' + SqlValue(ppPeriodos.Periodo.Valor) +
              ' AND pp_idpaciente = ' + SqlInt(IdPacAct) +
              ' AND pp_fechabaja IS NULL ';
    EjecutarSql(sSql);
    DoCargarPeriodo(ppPeriodos.Periodo.Valor);    
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.fpMedicBaseBeforeShow(Sender: TObject);
begin
  DoHabilitarBaseMedic;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbCerrarPeriodoClick(Sender: TObject);
var
  sSql :String;
begin
  if VerificarPeriodo(4, ppPeriodos.Periodo.Valor, '', '', '') and
     VerificarPeriodo(5, ppPeriodos.Periodo.Valor, '', '', '') and 
     MsgAsk('¿Confirma cerrar el período seleccionado?') then
  begin
    sSql := 'UPDATE sin.spp_periodospacientes ' +
              ' SET pp_fechamodif = ActualDate, ' +
                  ' pp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pp_cerrado = ''S'' ' +
            ' WHERE to_char(pp_periodo, ''MM/YYYY'') = ' + SqlValue(ppPeriodos.Periodo.Valor) +
              ' AND pp_idpaciente = ' + SqlInt(IdPacAct) +
              ' AND pp_fechabaja IS NULL ';
    EjecutarSql(sSql);
    DoCargarPeriodo(ppPeriodos.Periodo.Valor);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.dgMedicBaseDblClick(Sender: TObject);
begin
  if sdqBase.Active and not(sdqBase.IsEmpty) then
    DoModificarMedicDroga(True, sdqBase.FieldByName('ma_id').AsInteger);
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.DoModificarMedicDroga(bBase :Boolean; IdMedicDroga :Integer);
var
  sSql :String;
  bMedicamento, bComplementario :Boolean;
begin
  if bBase then
  begin
    bMedicamento            := not(sdqBase.FieldByName('ma_idmedicamento').IsNull);
    bComplementario         := False;
    edMedicDrogaMod.Text    := sdqBase.FieldByName('ma_medicdroga').AsString;
    chkSustituirMod.Checked := not(sdqBase.FieldByName('ma_sustituir').IsNull) and
                               (sdqBase.FieldByName('ma_sustituir').AsString = 'N');
    chkSustituirMod.Enabled := bMedicamento;
    edObservMod.Text        := sdqBase.FieldByName('ma_observaciones').AsString;
  end
  else begin
    sSql := 'SELECT ma_idmedicamento, ma_medicdroga, ma_sustituir, ma_observaciones, ' +
                  ' ma_complementario ' +
             ' FROM v_sma_medicamentosasignados ' +
            ' WHERE ma_id = :IdMD ';
    with GetQueryEx(sSql, [IdMedicDroga]) do
    try
      bMedicamento            := not(FieldByName('ma_idmedicamento').IsNull);
      bComplementario         := (FieldByName('ma_complementario').AsString = 'S');
      edMedicDrogaMod.Text    := FieldByName('ma_medicdroga').AsString;
      chkSustituirMod.Checked := not(FieldByName('ma_sustituir').IsNull) and
                                (FieldByName('ma_sustituir').AsString = 'N');
      chkSustituirMod.Enabled := bMedicamento or bComplementario;
      edObservMod.Text        := FieldByName('ma_observaciones').AsString;
    finally
      Free;
    end;
  end;

  if (fpModifMedic.ShowModal = mrOk) then
  begin
    sSql := 'UPDATE sin.smp_medicamentospacientes ' +
              ' SET mp_sustituir = ' + IIF(not(bMedicamento) and not(bComplementario), 'NULL', SqlBoolean(not(chkSustituirMod.Checked))) + ',' +
                  ' mp_observaciones = ' + SqlValue(edObservMod.Text) + ',' +
                  ' mp_fechamodif = ActualDate, ' +
                  ' mp_usumodif = ' + SqlValue(Sesion.UserID) +
            ' WHERE mp_id = ' + SqlInt(IdMedicDroga);
    EjecutarSql(sSql);
    if bBase then
      sdqBase.Refresh
    else
      DoCargarPeriodo(ppPeriodos.Periodo.Valor);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.clbPeriodosDblClick(Sender: TObject);
begin
  if (clbPeriodos.ItemIndex >= 0) and not(ModoPer = maAlta) then
    DoModificarMedicDroga(False, StrToInt(clbPeriodos.Values[clbPeriodos.ItemIndex]));
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.rbDescartableClick(Sender: TObject);
begin
  DoHabilitarBaseMedic;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbProcesarPeriodosClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(ppPerFiltro.Periodo.IsNull, ppPerFiltro, 'Debe seleccionar un período a procesar.');
  if ConfirmaCantidad then
  try
    BeginTrans;
    sSql := 'art.siniestro.do_procesarperiodo(:Per, :Usu);';
    EjecutarStoreSTEx(sSql, [ppPerFiltro.Periodo.Valor, Sesion.UserID]);
    CommitTrans;
    MsgBox('El período se ha procesado con éxito.', MB_ICONINFORMATION);
    tbRefrescarClick(Nil);
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al intentar generar las autorizaciones.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbComplementarioClick(Sender: TObject);
var
  sPerActual, sSql :String;
begin
  sPerActual := ValorSql('SELECT TO_CHAR(SYSDATE, ''MM/YYYY'') FROM DUAL');
  Verificar(ppPeriodos.Periodo.Valor <> sPerActual, ppPeriodos, 'Sólo es posible agregar complementarios al período actual.');
  VerificarPeriodo(4, ppPeriodos.Periodo.Valor, '', '', '');
  if (fpComplementario.ShowModal = mrOk) then
  try
    sSql := 'art.siniestro.do_insertarcomplementario(' + SqlInt(IdPacAct) + ',' +
                                                         SqlBoolean(not(chkSustComp.Checked)) + ',' +
                                                         SqlValue(Trim(edMaterialComp.Text)) + ',' +
                                                         SqlValue(Sesion.UserID) + ');';
    EjecutarStore(sSql);
    DoCargarPeriodo(ppPeriodos.Periodo.Valor);
  except
    on E:Exception do
      ErrorMsg(E, 'Error al intentar agregar material complementario');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.btnAceptarCompClick(Sender: TObject);
begin
  Verificar(IsEmptyString(Trim(edMaterialComp.Text)), edMaterialComp, 'Debe ingresar el nombre del material.');
  fpComplementario.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmMedicamentosCronicos.ConfirmaCantidad :Boolean;
var
  sSql :String;
  iCan :Integer;
begin
  sSql := 'SELECT COUNT(*) ' +
           ' FROM sex_expedientes, SIN.spc_pacientescronicos, SIN.spp_periodospacientes ' +
          ' WHERE ex_id = pc_idexpediente ' +
            ' AND pc_id = pp_idpaciente ' +
            ' AND pp_fechabaja IS NULL ' +
            ' AND pc_fechabaja IS NULL ' +
            ' AND TO_CHAR(pp_periodo, ''mm/yyyy'') = :Per ' +
            ' AND EXISTS(SELECT 1 ' +
                         ' FROM SIN.smp_medicamentospacientes ' +
                        ' WHERE mp_idperiodo = pp_id ' +
                          ' AND mp_fechabaja IS NULL ' +
                          ' AND mp_idautenviada IS NULL) ';
  iCan := ValorSqlIntegerEx(sSql, [ppPerFiltro.Periodo.Valor]);

  Verificar((iCan = 0), nil, 'No existen pacientes que tengan autorizaciones pendientes de generar');

  Result := MsgAsk('Existen ' + IntToStr(iCan) + ' pacientes con autorizaciones pendientes de generar ' + #13 +
                   ' para el período seleccionado, ¿Desea continuar?');
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.fpComplementarioBeforeShow(Sender: TObject);
begin
  edMaterialComp.Clear;
  chkSustComp.Checked := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmMedicamentosCronicos.tbProcesarPeriodoClick(Sender: TObject);
var
  sSql :String;
  idPer :Integer;
begin
  Verificar(ppPeriodos.Periodo.IsNull, ppPeriodos, 'Debe seleccionar un período a procesar.');

  sSql := 'SELECT pp_id ' +
           ' FROM sex_expedientes, SIN.spc_pacientescronicos, SIN.spp_periodospacientes ' +
          ' WHERE ex_id = pc_idexpediente ' +
            ' AND pc_id = pp_idpaciente ' +
            ' AND pp_fechabaja IS NULL ' +
            ' AND pc_fechabaja IS NULL ' +
            ' AND TO_CHAR(pp_periodo, ''mm/yyyy'') = :Per ' +
            ' AND pc_id = :Pac ' +
            ' AND EXISTS(SELECT 1 ' +
                         ' FROM SIN.smp_medicamentospacientes ' +
                        ' WHERE mp_idperiodo = pp_id ' +
                          ' AND mp_fechabaja IS NULL ' +
                          ' AND mp_idautenviada IS NULL) ';
  idPer := ValorSqlIntegerEx(sSql, [ppPeriodos.Periodo.Valor, IdPacAct]);

  Verificar((idPer = 0), nil, 'No existen autorizaciones pendientes de generar para el período seleccionado');

  if MsgAsk('¿Confirma generar la autorización para el período seleccionado?') then
  begin
    BeginTrans;
    sSql := 'art.siniestro.do_procesaridperiodo(:Per, :Usu);';
    EjecutarStoreSTEx(sSql, [idPer, Sesion.UserID]);
    CommitTrans;
    MsgBox('El período se ha procesado con éxito.', MB_ICONINFORMATION);
  end;
end;
{-------------------------------------------------------------------------------}
end.
