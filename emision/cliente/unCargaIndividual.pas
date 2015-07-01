{-----------------------------------------------------------------------------
 Nombre Unidad: unCargaIndividual
 Autor:         cchiappero
 Fecha:         28-Agosto-2005
 Proposito:     incorporación de nóminas manuales con y sin persona,
                mono y multiperíodo.
 Versiones:     0.1 - Inicial
-----------------------------------------------------------------------------}
unit unCargaIndividual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, unArtDbFrame, unFraEmpresa, StdCtrls, PeriodoPicker,
  Placemnt, artSeguridad, ExtCtrls, Buttons, unArtDBAwareFrame, Mask,
  PatternEdit, IntEdit, unFraStaticCodigoDescripcion, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, FormPanel, ToolEdit,
  CurrEdit, DB, SDEngine, DateTimeEditors, unFraCodigoDescripcion, unFrmSimulacion;

type
  TModoEjecucion = (meAlta, meModificacion, meBaja);

  TfrmCargaIndividual = class(TForm)
    FormStorage: TFormStorage;
    Seguridad: TSeguridad;
    sdqObservacionesDDJJ: TSDQuery;
    dsObservaciones: TDataSource;
    sdqNota: TSDQuery;
    gbNota: TGroupBox;
    lblFechaSolicitud: TLabel;
    edtFechaSolicitud: TDateEditor;
    lblFechaRecepcionART: TLabel;
    edtFechaRecepcionARTFiltro: TDateEditor;
    lblObservacionesSolicitud: TLabel;
    edtNroBibliorato: TIntEdit;
    lbContrato: TLabel;
    lblNroBibliorato: TLabel;
    lblNroSecuencia: TLabel;
    edtNroSecuencia: TIntEdit;
    fpFormularioIndividual: TFormPanel;
    bvSeparador1: TBevel;
    btnAceptarFormulario: TButton;
    btnCancelarFormulario: TButton;
    gbEmpresa: TGroupBox;
    lbPerDesde: TLabel;
    lbCodRect: TLabel;
    lbTipoNomina: TLabel;
    ppPeriodoPresentacionMono: TPeriodoPicker;
    edCodRectificativaMono: TIntEdit;
    fraTipoFormularioMono: TfraStaticCodigoDescripcion;
    fraSolicitante: TfraStaticCodigoDescripcion;
    lblSolicitante: TLabel;
    dbgPeriodos: TArtDBGrid;
    CoolBar: TCoolBar;
    tbOpciones: TToolBar;
    btnNuevo: TToolButton;
    btnEditar: TToolButton;
    btnEliminar: TToolButton;
    btnOrdenar: TToolButton;
    btnImprimir: TToolButton;
    btnExportar: TToolButton;
    btnSalir: TToolButton;
    sbCargaIndividual: TStatusBar;
    edtNroVerificacionMono: TIntEdit;
    lblNroVerificacion: TLabel;
    edtFechaPresentacionMono: TDateEditor;
    lblFechaPresentacion: TLabel;
    bvSeparador2: TBevel;
    lblObserv: TLabel;
    lblObservacionesFormulario: TLabel;
    mDetalleObservacionesMono: TMemo;
    fraEmpresaFormulario: TfraEmpresa;
    lbCuit: TLabel;
    fpFormularioMultiperiodo: TFormPanel;
    bvSeparador3: TBevel;
    btnAceptarMultiperiodo: TButton;
    btnCancelarMultiperiodo: TButton;
    gbGrupoMultiperiodo: TGroupBox;
    lblPeriodoMultiperiodo: TLabel;
    lblTipoFormularioMultiperiodo: TLabel;
    lblEmpleadosMultiperiodo: TLabel;
    lblMasaSalarialMultiperiodo: TLabel;
    lblEnCeroMultiperiodo: TLabel;
    lblFechaPresentacionMultiperiodo: TLabel;
    BvSeparador4: TBevel;
    ppPeriodoPresentacionMultiperiodo: TPeriodoPicker;
    fraTipoFormularioMultiperiodo: TfraStaticCodigoDescripcion;
    edtCantidadEmpleadosMultiperiodo: TIntEdit;
    edtMasaSalarialMultiperiodo: TCurrencyEdit;
    edtSalariosEnCeroMultiperiodo: TIntEdit;
    edtFechaPresentacionMultiperiodo: TDateEditor;
    lblObservacionesMultiperiodo: TLabel;
    lblDetalleObservacion: TLabel;
    fraObservacionMultiperiodo: TfraStaticCodigoDescripcion;
    mObservacionMultiperiodo: TMemo;
    gbObservacionesMultiperiodo: TGroupBox;
    tbProcesosEmision: TToolBar;
    btnAgregarPeriodo: TToolButton;
    btnEliminarMultiperiodo: TToolButton;
    dbgMultiperiodo: TArtDBGrid;
    sdqContratoPeriodo: TSDQuery;
    dsContratoPeriodo: TDataSource;
    fraEmpresaMultiperiodo: TfraEmpresa;
    lblCuitMultiperiodo: TLabel;
    dsNota: TDataSource;
    btnRefrescar: TToolButton;
    btnLimpiar: TToolButton;
    fraTipoFormularioFiltro: TfraStaticCodigoDescripcion;
    lblTipoFormularioFiltro: TLabel;
    btnMultiperiodo: TToolButton;
    btnDesdeArchivo: TToolButton;
    lblCuit: TLabel;
    fraEmpresaMono: TfraEmpresa;
    gbOpcionesPresentacion: TGroupBox;
    chkNotaDelLaEmpresa: TCheckBox;
    chkTodosLosContratosDelCuit: TCheckBox;
    lblFechaRecepcionARTMono: TLabel;
    edtFechaRecepcionARTMono: TDateEditor;
    lbl: TLabel;
    edtFechaRecepcArtMultiperiodo: TDateEditor;
    lblNroBiblioratoMulti: TLabel;
    edtBiblioratoMultiperiodo: TIntEdit;
    lblNroSecuenciaMulti: TLabel;
    edtSecuenciaMultiperiodo: TIntEdit;
    lblNroBiblioratoMono: TLabel;
    edtNroBiblioratoMono: TIntEdit;
    lblNroSecuenciaMono: TLabel;
    edtNroSecuenciaMono: TIntEdit;
    pnPersonal: TPanel;
    lbEmpleados: TLabel;
    lbMSalarial: TLabel;
    lbEmpleadosMasaEnCero: TLabel;
    lblCantidadEmpleadosDeclar: TLabel;
    lblMasaSalarialLTR: TLabel;
    lblSalarioEnCeroDeclar: TLabel;
    edtEmpleadosMono: TIntEdit;
    edtMasaSalarialMono: TCurrencyEdit;
    edtEmpleadosMasaEnCeroMono: TIntEdit;
    edtEmpleadosDeclarMono: TIntEdit;
    edtMasaSalarialDeclarMono: TCurrencyEdit;
    edtSalariosEnCeroDeclarMono: TIntEdit;
    btnCopiar: TButton;
    lblTipoNomina: TLabel;
    fraTipoNominaMultiperiodo: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    fraTipoNominaMono: TfraStaticCodigoDescripcion;
    lblCodigoRectificativaMultiperiodo: TLabel;
    edtCodigoRectificativaMultiperiodo: TIntEdit;
    btnIncorporarNomina: TToolButton;
    GroupBox1: TGroupBox;
    lblReferenciaPeriodoEstimado: TLabel;
    pn: TPanel;
    btnSimulacion: TButton;
    btnSimulacionMultiperiodo: TButton;
    fraObservacionesMono: TfraCodigoDescripcion;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnCancelarMultiperiodoClick(Sender: TObject);
    procedure btnAceptarMultiperiodoClick(Sender: TObject);
    procedure btnAceptarFormularioClick(Sender: TObject);
    procedure btnMultiperiodoClick(Sender: TObject);
    procedure ppPeriodoPresentacionMonoExit(Sender: TObject);
    procedure btnAgregarPeriodoClick(Sender: TObject);
    procedure btnEliminarMultiperiodoClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure ppPeriodoPresentacionMultiperiodoExit(Sender: TObject);
    procedure dbgPeriodosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnIncorporarNominaClick(Sender: TObject);
    procedure btnSimulacionClick(Sender: TObject);
  private
    FModo : TModoEjecucion;
    FContrato : Integer;
    FPeriodo : String;
    FIdNota  : Integer;
    FSinPersonal : boolean;
    procedure Refrescar;
    procedure Limpiar;
    procedure Inicializar;
    procedure LimpiarPeriodoIndividual;
    procedure LimpiarMultiPeriodo;
    procedure LimpiarPersonal;
    procedure SetearSinPersonal;
    procedure AltaIndividual;
    procedure AltaMultiperiodo;
    procedure Modifacion(AFields: TFields);
    procedure OnChangeTipoFormulario(Sender: TObject);
    function ValidarPeriodoIndividual: Boolean;
    procedure IncorporarDeclaracion;
    procedure IncorporarDeclaracionSim;
    procedure LimpiarAltaPeriodo;
    procedure GuardarPeriodo;
    procedure ValidarPeriodo;
    procedure ValidarCabecera;
    procedure GuardarCabecera;
    procedure RefrecarPeriodos;

    function ValidarMasaYPersonal(SinPersonal: boolean; Empleados,
      EmpleadosDeclar, SalariosEnCero : Integer; MasaSalarial,
      MasaSalarialDeclar: Currency): boolean;
    procedure VerificarPeriodo(contrato : integer; periodo : TPeriodoPicker);
    procedure OnChangeTipoFormularioMultiperiodo(Sender: TObject);
    procedure SetearSinPersonalMultiperiodo;

  public
    procedure CargarIndividual; overload;
    procedure CargarIndividual(AContrato : Integer; APeriodo : String); overload;
  end;

implementation

uses AnsiSql, CustomDlgs, unDmPrincipal, SqlFuncs, StrFuncs, unArt, Periodo, General, unDmEmision, unSesion, unConstEmision,
  unFuncionesEmision;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnRefrescarClick(Sender: TObject);
begin
  Refrescar;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnLimpiarClick(Sender: TObject);
begin
  Limpiar;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.FormShow(Sender: TObject);
begin
  btnLimpiarClick( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnNuevoClick(Sender: TObject);
begin
  FContrato := -1; FPeriodo := '';
  AltaIndividual;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnMultiperiodoClick(Sender: TObject);
begin
  AltaMultiperiodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.tbModificarClick(Sender: TObject);
begin
  Modifacion(sdqNota.Fields);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnAceptarFormularioClick(Sender: TObject);
begin
  ValidarPeriodoIndividual;

  try
    BeginTrans(true);
    IncorporarDeclaracion;

    do_activardeclaracion(fraEmpresaMono.Contrato, ppPeriodoPresentacionMono.Periodo.Valor);
    //Pablo
    do_devengarinvalidcontrato(fraEmpresaMono.Contrato);
    //Pablo  do_devengadocontrato(fraEmpresaMono.Contrato, ppPeriodoPresentacionMono.Periodo.Valor);

    CommitTrans(true);
    fpFormularioIndividual.Close;

  except
    Rollback(true);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnCancelarClick(Sender: TObject);
begin
  fpFormularioIndividual.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnCancelarMultiperiodoClick(
  Sender: TObject);
begin
  fpFormularioMultiperiodo.close;
  Rollback(true);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnAceptarMultiperiodoClick(Sender: TObject);
begin
  sdqContratoPeriodo.DisableControls;
  try

    if sdqContratoPeriodo.RecordCount <= 0 then
    begin
      MessageDlg('Debe especificar al menos un período '+#13+#10+'para poder continual.', mtInformation, [mbOK], 0);
      exit;
    end;

    CommitTrans(true);

    sdqContratoPeriodo.First;
    while not sdqContratoPeriodo.Eof do
    begin
      do_activardeclaracion(
          sdqContratoPeriodo.FieldByName('dj_contrato').AsInteger,
          sdqContratoPeriodo.FieldByName('dj_periodo').AsString);
//Pablo
      do_devengarinvalidcontrato(sdqContratoPeriodo.FieldByName('dj_contrato').AsInteger);
//Pablo      do_devengadocontrato(
//Pablo          sdqContratoPeriodo.FieldByName('dj_contrato').AsInteger,
//Pablo          sdqContratoPeriodo.FieldByName('dj_periodo').AsString);
      sdqContratoPeriodo.Next;
    end;
    fpFormularioMultiperiodo.Close;
  finally
    sdqContratoPeriodo.EnableControls;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.Inicializar;
begin
  with fraTipoFormularioMono do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ExtraCondition := ' AND TF_NOMINA = ''S'' ' +
                      ' AND TF_TRABAJADORES = ''N'' ' +
                      ' AND TF_MULTIPERIODO = ''N'' ' +
                      ' AND TF_PRESENTACIONMANUAL = ''S'' ';
    ExtraFields := ', TF_SINPERSONAL AS SIN_PERSONAL ';
    DynamicCols := true;

    ShowBajas   := False;
    OnChange := OnChangeTipoFormulario;
  end;

  with fraTipoFormularioMultiperiodo do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ExtraCondition := ' AND TF_NOMINA = ''S'' ' +
                      ' AND TF_TRABAJADORES = ''S'' ' +
                      ' AND TF_MULTIPERIODO = ''S'' ' +
                      ' AND TF_PRESENTACIONMANUAL = ''S'' ';
    ExtraFields := ', TF_SINPERSONAL AS SIN_PERSONAL ';
    DynamicCols := true;    
    ShowBajas   := False;

    OnChange := OnChangeTipoFormularioMultiperiodo;
  end;

  with fraTipoFormularioFiltro do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ExtraCondition := ' AND TF_NOMINA = ''S'' ' +
                      ' AND TF_TRABAJADORES = ''S'' ' +
                      ' AND TF_PRESENTACIONMANUAL = ''S'' ';
    ShowBajas   := True;
  end;

  with fraObservacionMultiperiodo do
  begin
    TableName   := 'EMI.IOB_OBSERVACION';
    FieldID     := 'OB_ID';
    FieldCodigo := 'OB_ID';
    FieldDesc   := 'OB_DESCRIPCION';
    FieldBaja   := 'OB_FECHABAJA';
    ShowBajas   := false;
  end;

  with fraObservacionesMono do
  begin
    TableName   := 'EMI.IOB_OBSERVACION';
    FieldID     := 'OB_ID';
    FieldCodigo := 'OB_ID';
    FieldDesc   := 'OB_DESCRIPCION';
    FieldBaja   := 'OB_FECHABAJA';
    ExtraFields := ' ,DECODE(OB_RECHAZO, ''S'', ''Rechazo y Gestión'',  ''N'', ''Acepta'', ''G'', ''Acepta y Gestión'', ''I'', ''Informa'', ''X'', ''Rechaza'') Tipo ';
    ExtraCondition := ' and OB_TIPO = ''D'' ';
    ShowBajas   := false;
  end;

  with fraSolicitante do
  begin
    TableName   := 'USE_USUARIOS';
    FieldID     := 'SE_USUARIO';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'SE_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraTipoNominaMultiperiodo do
  begin
    TableName   := 'EMI.ITN_TIPONOMINA';
    FieldID     := 'TN_ID';
    FieldCodigo := 'TN_ID';
    FieldDesc   := 'TN_DESCRIPCION';
    FieldBaja   := 'TN_FECHABAJA';
    ShowBajas   := False;
    ExtraCondition := ' AND TN_CARGAMANUAL = ''S''';
  end;

  with fraTipoNominaMono do
  begin
    TableName   := 'EMI.ITN_TIPONOMINA';
    FieldID     := 'TN_ID';
    FieldCodigo := 'TN_ID';
    FieldDesc   := 'TN_DESCRIPCION';
    FieldBaja   := 'TN_FECHABAJA';
    ExtraCondition := ' AND TN_CARGAMANUAL = ''S''';
    ShowBajas   := False;
  end;

  fraEmpresaFormulario.ShowBajas := True;
  fraEmpresaMultiperiodo.ShowBajas := True;
  fraEmpresaMono.ShowBajas := True;

  LimpiarPeriodoIndividual;
  LimpiarMultiPeriodo;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.LimpiarPeriodoIndividual;
begin
  fraEmpresaMono.clear;
  fraEmpresaMono.Enabled := true;  
  fraEmpresaMono.ShowBajas := True;

  fraTipoNominaMono.Clear;
  fraTipoNominaMono.ShowBajas := false;

  if FContrato > -1 then
  begin
    fraEmpresaMono.Contrato := FContrato;
    fraEmpresaMono.Enabled := false;
  end;

  ppPeriodoPresentacionMono.Enabled := true;
  ppPeriodoPresentacionMono.Clear;
  ppPeriodoPresentacionMono.Periodo.MinPeriodo := '199601';
//Pablo  ppPeriodoPresentacionMono.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);

  if FPeriodo <> '' then
  begin
    ppPeriodoPresentacionMono.Periodo.Valor := FPeriodo;
    ppPeriodoPresentacionMono.Enabled := false;
  end;

  fraTipoFormularioMono.Clear;
  edtFechaPresentacionMono.Clear;
  edtFechaRecepcionARTMono.Clear;

  edtNroBiblioratoMono.Clear;
  edtNroSecuenciaMono.Clear;

  edCodRectificativaMono.Value := 0;
  edtNroVerificacionMono.Value := 0;

  LimpiarPersonal;

  fraObservacionesMono.Clear;
  mDetalleObservacionesMono.Text := '';
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.LimpiarMultiPeriodo;
begin
  fraEmpresaMultiperiodo.Clear;
  fraTipoFormularioMultiperiodo.Clear;
  fraTipoNominaMultiperiodo.Clear;
  edtFechaPresentacionMultiperiodo.Clear;
  edtFechaRecepcArtMultiperiodo.Clear;
  edtBiblioratoMultiperiodo.Clear;
  edtSecuenciaMultiperiodo.Clear;
  edtCodigoRectificativaMultiperiodo.Clear;
  sdqContratoPeriodo.Close;

  LimpiarAltaPeriodo;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.LimpiarAltaPeriodo;
begin
  ppPeriodoPresentacionMultiperiodo.Clear;
  ppPeriodoPresentacionMultiperiodo.Periodo.MinPeriodo := '199601';
//Pablo  ppPeriodoPresentacionMultiperiodo.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);

  edtCantidadEmpleadosMultiperiodo.Value := 0;
  edtMasaSalarialMultiperiodo.Value := 0;
  edtSalariosEnCeroMultiperiodo.Value := 0;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.LimpiarPersonal;
begin
  edtEmpleadosMono.Value := 0;
  edtEmpleadosDeclarMono.Value := 0;
  edtEmpleadosMasaEnCeroMono.Value := 0;
  edtSalariosEnCeroDeclarMono.Value := 0;
  edtMasaSalarialMono.Value := 0;
  edtMasaSalarialDeclarMono.Value := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.Refrescar;
var
 sSql : String;
begin
  try
    sdqNota.DisableControls;

    sSql :=  'select ino.no_id,       ino.no_solicitante,       ino.no_fecharecepcion,  ' +
             '   ino.no_fecharecepcionart,       ino.no_contrato,       ino.no_derivado,  ' +
             '   ino.no_fechaderivado,       ino.no_observaciones,       ino.no_bibliorato,  ' +
             '   ino.no_secuencia, ino.no_usuariocumplimiento,  ' +
             '   ino.no_idevento,       ino.no_usualta,       ino.no_fechaalta,  ' +
             '   ino.no_usumodif,       ino.no_fechamodif,       ino.no_fechabaja,  ' +
             '   ino.no_usubaja,       ino.no_idmotivosolicitudnota,       ino.no_observacionescumplimiento,  ' +
             '   ino.no_idestadonota,       (select count (*)  from emi.inp_notacontratoperiodo  ' +
             '                              where np_idnota = ino.no_id) "Periodos",  ' +
             '   DECODE ((SELECT COUNT (*)                        ' +
             '            FROM emi.inp_notacontratoperiodo        ' +
             '            WHERE np_idnota = ino.no_id), 1,        ' +
             '            ''Presentación de Período'',            ' +
             '            ''Presentación Multi-período'') "Tipo", ' +
             '   emi.utiles.get_periodosnota (no_id) "Presentes", ' +
             '   em_nombre "Razon Social"                         ' +
             ' from emi.ino_nota ino, aco_contrato aco, aem_empresa aem ' +
             ' where exists (select 1                             ' +
             '          from emi.inp_notacontratoperiodo          ' +
             '         where np_idnota = ino.no_id)               ' +
             ' and  ino.no_idmotivosolicitudnota = 2 AND aco.co_idempresa = aem.em_id AND no_contrato = co_contrato';

    if fraEmpresaFormulario.IsSelected then
    begin
      if chkTodosLosContratosDelCuit.Checked then
        sSql := sSql + ' and (no_cuit = ' +  SqlValue(fraEmpresaFormulario.CUIT) + ') '
      else
        sSql := sSql + ' and (no_contrato = ' +  SqlValue(fraEmpresaFormulario.contrato) + ') ';
    end;

    if not IsEmptyString(edtNroBibliorato.Text) then
    begin
      sSql := sSql + ' and (no_bibliorato = ' + SqlValue(edtNroBibliorato.Text) + ' ) ';

      if not IsEmptyString(edtNroSecuencia.Text) then
       sSql := sSql + ' and (no_secuencia = ' + SqlValue(edtNroBibliorato.Text) + ' ) ';

    end;

    if edtFechaSolicitud.Date > 0 then
       sSql := sSql + ' and (no_fecharecepcion = ' + SqlDate(edtFechaSolicitud.Date) + ' ) ';

    if edtFechaRecepcionARTFiltro.Date > 0  then
       sSql := sSql + ' and (no_fecharecepcionart = ' + SqlDate(edtFechaRecepcionARTFiltro.Date) + ' ) ';

    if fraSolicitante.IsSelected then
       sSql := sSql + ' and (no_solicitante = ' + SqlValue(fraSolicitante.Codigo) + ' ) ';

    if chkNotaDelLaEmpresa.Checked then
       sSql := sSql + ' and (no_notaempresa = ''S'') ';

  finally
    sdqNota.SQL.Text := sSql;
    sdqNota.Open;
    sdqNota.EnableControls;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmCargaIndividual.Limpiar;
begin
  fraEmpresaFormulario.Clear;
  edtNroBibliorato.Text := '';
  edtNroSecuencia.Text := '';
  edtFechaSolicitud.Clear;
  edtFechaRecepcionARTFiltro.Date := 0;
  fraSolicitante.Clear;
  chkTodosLosContratosDelCuit.Checked := false;
  chkNotaDelLaEmpresa.Checked := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.IncorporarDeclaracion;
var
 idobservacion : integer;
begin
  ValidarPeriodoIndividual;

  if fraObservacionesMono.IsSelected then
       idobservacion := strtoint(fraObservacionesMono.codigo)
  else idobservacion := 0;

  do_incorporardeclaracionnota(fraEmpresaMono.Contrato,
     ppPeriodoPresentacionMono.Text, edtEmpleadosDeclarMono.Value, edtMasaSalarialMono.Value,
     edtSalariosEnCeroDeclarMono.Value, fraTipoFormularioMono.Value, fraTipoNominaMono.Value,
     edCodRectificativaMono.Text,
     edtMasaSalarialMono.Value, edtEmpleadosMono.Value, edtEmpleadosMasaEnCeroMono.Value,
     edtFechaRecepcionARTMono.Date, edtFechaPresentacionMono.Date,
     edtNroBiblioratoMono.Value, edtNroSecuenciaMono.Value, idobservacion,
     mDetalleObservacionesMono.Text);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.AltaIndividual;
begin
  FModo := meAlta;
  LimpiarPeriodoIndividual;

  fpFormularioIndividual.ShowModal;
  Refrescar;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.AltaMultiperiodo;
begin
  BeginTrans(true);
  FModo := meAlta;
  FIdNota := -1;

  LimpiarMultiperiodo;
  fpFormularioMultiperiodo.ShowModal;

  Refrescar;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.Modifacion(AFields : TFields);
begin
//FIXME.. completar
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.OnChangeTipoFormularioMultiperiodo(Sender : TObject);
begin
  SetearSinPersonalMultiperiodo;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.SetearSinPersonalMultiperiodo;
begin
  if fraTipoFormularioMultiperiodo.IsSelected then
   if fraTipoFormularioMultiperiodo.FieldValue('SIN_PERSONAL') = 'S' then
   begin
      LimpiarAltaPeriodo;
      edtCantidadEmpleadosMultiperiodo.Enabled := false;
      edtMasaSalarialMultiperiodo.Enabled := false;
      edtSalariosEnCeroMultiperiodo.Enabled := false;
      FSinPersonal := true;
   end
   else FSinPersonal := False;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.OnChangeTipoFormulario(Sender : TObject);
begin
  SetearSinPersonal;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.SetearSinPersonal;
begin
  if fraTipoFormularioMono.IsSelected then
   if fraTipoFormularioMono.FieldValue('SIN_PERSONAL') = 'S' then
   begin
      pnPersonal.Enabled := false;
      LimpiarPersonal;
   end
   else pnPersonal.Enabled := true;

   FSinPersonal := not pnPersonal.Enabled;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.ppPeriodoPresentacionMonoExit(Sender: TObject);
begin
  if edtFechaPresentacionMono.IsValid(edtFechaPresentacionMono.Date) then
   if ppPeriodoPresentacionMono.Periodo.Valor >
      ppPeriodoPresentacionMono.Periodo.GetPeriodoFromDate(edtFechaPresentacionMono.Date) then
    InvalidMsg(ppPeriodoPresentacionMono, 'El período informado no puede ser posterior a la fecha de presentación.' );

  if fraEmpresaMono.isSelected and (ppPeriodoPresentacionMono.Periodo.Valor <> '') then
   VerificarPeriodo(fraEmpresaMono.Contrato, ppPeriodoPresentacionMono);
end;

{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.CargarIndividual;
begin
  Showmodal;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.CargarIndividual(AContrato : Integer; APeriodo: String);
begin
  FContrato := AContrato;
  FPeriodo := APeriodo;
  AltaIndividual;
  close;
end;

procedure TfrmCargaIndividual.RefrecarPeriodos;
begin
  if FIdNota > 0 then
  try
    sdqContratoPeriodo.DisableControls;
    if sdqContratoPeriodo.Active then sdqContratoPeriodo.Close;
    sdqContratoPeriodo.ParamByName('nota').AsInteger := FIdNota;
    sdqContratoPeriodo.Open;
  finally
   sdqContratoPeriodo.EnableControls;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.GuardarCabecera;
begin
  if (FModo = meAlta) and (FIdNota = -1) then
  begin
    FIdNota := GetSecNextVal('emi.seq_ino_id');
    do_incorporardeclcabeceranota(FIdNota, fraEmpresaMultiperiodo.Contrato ,
       edtFechaRecepcArtMultiperiodo.Date, edtFechaPresentacionMultiperiodo.Date,
       edtBiblioratoMultiperiodo.Value, edtSecuenciaMultiperiodo.Value);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.GuardarPeriodo;
begin
  do_incorporardeclperiodonota(FIdNota, ppPeriodoPresentacionMultiperiodo.Text,
     edtCantidadEmpleadosMultiperiodo.Value, edtMasaSalarialMultiperiodo.Value,
     edtSalariosEnCeroMultiperiodo.Value,
     edtMasaSalarialMultiperiodo.Value,
     edtCantidadEmpleadosMultiperiodo.Value,
     edtSalariosEnCeroMultiperiodo.Value,
     fraTipoFormularioMultiperiodo.Value,
     fraTipoNominaMultiperiodo.Value, edtCodigoRectificativaMultiperiodo.Text,
     fraObservacionMultiperiodo.Value, mObservacionMultiperiodo.Text);
  RefrecarPeriodos;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnAgregarPeriodoClick(Sender: TObject);
begin
  if (FModo = meAlta) and (FIdNota = -1) then
  begin
    ValidarCabecera;
    GuardarCabecera;
  end;

  ValidarPeriodo;
  GuardarPeriodo;
  LimpiarAltaPeriodo;

  ppPeriodoPresentacionMultiperiodo.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnEliminarMultiperiodoClick(
  Sender: TObject);
begin
  if ( sdqContratoPeriodo.RecordCount > 0 )  and
     (MessageBox(0, '¿Confirma la eliminación del período de presentación?',
                    'Confirmación de eliminación', MB_ICONQUESTION or MB_YESNO) = idYes) then
   begin
     EjecutarSqlST('delete emi.inp_notacontratoperiodo where np_id = ' + SqlValue(sdqContratoPeriodo.FieldByName('np_id').AsInteger) );
     do_actualizarcodigorect(sdqContratoPeriodo.FieldByName('no_contrato').AsInteger,
                             sdqContratoPeriodo.FieldByName('np_periodo').asString);
   end;
  LimpiarAltaPeriodo;
  RefrecarPeriodos;

  ppPeriodoPresentacionMultiperiodo.SetFocus;  
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.btnCopiarClick(Sender: TObject);
begin
  edtEmpleadosDeclarMono.Text := edtEmpleadosMono.Text;
  edtMasaSalarialDeclarMono.Text := edtMasaSalarialMono.Text;
  edtSalariosEnCeroDeclarMono.Text := edtEmpleadosMasaEnCeroMono.Text;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.ppPeriodoPresentacionMultiperiodoExit(
  Sender: TObject);
begin
  if edtFechaPresentacionMultiperiodo.IsValid(edtFechaPresentacionMultiperiodo.Date) then
   if ppPeriodoPresentacionMultiperiodo.Periodo.Valor >
      ppPeriodoPresentacionMultiperiodo.Periodo.GetPeriodoFromDate(edtFechaPresentacionMultiperiodo.Date) then
    InvalidMsg(ppPeriodoPresentacionMultiperiodo, 'El período informado no puede ser posterior a la fecha de presentación.' );

  if fraEmpresaMultiperiodo.isSelected and (ppPeriodoPresentacionMultiperiodo.Periodo.Valor <> '') then
   VerificarPeriodo(fraEmpresaMultiperiodo.Contrato, ppPeriodoPresentacionMultiperiodo);
end;


{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.VerificarPeriodo(contrato: integer;
  periodo: TPeriodoPicker);
begin
   if not Get_CoberturaCobranza(fraEmpresaMono.Contrato, periodo.Periodo.Valor)
   then
        periodo.Color := $00E1FFFF
   else periodo.Color := clWindow;
end;
{------------------------------------------------------------------------------}
function TfrmCargaIndividual.ValidarPeriodoIndividual: Boolean;
begin
  Result := False;


  VerificarMultiple(['Validando Período Individual',
      fraEmpresaMono, fraEmpresaMono.IsSelected, 'Debe seleccionar una empresa.',
      fraTipoFormularioMono, fraTipoFormularioMono.IsSelected, 'Debe seleccionar un formulario',
      fraTipoNominaMono, fraTipoNominaMono.IsSelected, 'Debe seleccionar un tipo de nomina',
      edtFechaPresentacionMono, (edtFechaPresentacionMono.Date > 0), 'Debe Especificar una fecha de presentación',
      edtFechaPresentacionMono, (edtFechaPresentacionMono.Date <= DBDate), 'Fecha de presentación no puede establecerse en el futuro.',
      edtFechaRecepcionARTMono, (edtFechaRecepcionARTMono.Date > 0), 'Debe especificar una fecha de presentación',
      edtFechaRecepcionARTMono, (edtFechaRecepcionARTMono.Date >= edtFechaPresentacionMono.Date),
                             'La Fecha de Recepción ART debe ser anterior a la de presentación',
      edtFechaRecepcionARTMono, edtFechaRecepcionARTMono.Date <= DBDate, 'La Fecha de Presentanción no puede está en el futuro',
//Pablo      ppPeriodoPresentacionMono, (ppPeriodoPresentacionMono.Periodo.Valor > '199606'), 'Período Inválido.',
      edtNroBiblioratoMono, edtNroBiblioratoMono.Value > 0, 'Debe indicar el nro. de bibliorato',
      edtNroSecuenciaMono, edtNroSecuenciaMono.Value > 0 , 'Debe inidicar la secuencia',
      edtEmpleadosMono, ValidarMasaYPersonal(FSinPersonal,
           edtEmpleadosMono.Value, edtEmpleadosDeclarMono.Value, edtEmpleadosMasaEnCeroMono.Value,
           edtMasaSalarialMono.Value, edtMasaSalarialDeclarMono.Value),
                             'La especificación de cantidad de empleados y masa para este formulario es incorrecta.',
      edtFechaPresentacionMono, (ValorSql('SELECT NVL(EMI.UTILES.get_idddjj(' +
                                SqlValue(fraEmpresaMono.CUIT) + ', ' +
                                SqlValue(ppPeriodoPresentacionMono.Periodo.Valor) + ',' +
                                SqlDate (edtFechaPresentacionMono.Date) + '), -1) from dual ') = -1),
                                'Ya existe una nómina para con la misma fecha de presentación.']);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.ValidarPeriodo;
begin
  VerificarMultiple(['Registrando Período',
        ppPeriodoPresentacionMultiperiodo,
        Get_ValidarPeriodoPresentacionNota(FIdNota,ppPeriodoPresentacionMultiperiodo.Periodo.Valor),
        'El período ya se encuentra cargado.']);

  VerificarMultiple(['Registrando Período',
    ppPeriodoPresentacionMultiperiodo, Not IsEmptyString(ppPeriodoPresentacionMultiperiodo.Text), 'Debe seleccionar un período.',
//Pablo    ppPeriodoPresentacionMultiperiodo, (ppPeriodoPresentacionMultiperiodo.Periodo.Valor > '199606'), 'Período Inválido.',
    ppPeriodoPresentacionMultiperiodo,
                ppPeriodoPresentacionMultiperiodo.Periodo.Valor <=
                ppPeriodoPresentacionMultiperiodo.Periodo.GetPeriodoFromDate(edtFechaPresentacionMultiperiodo.Date),
                'El Período debe ser anterior a la fecha de presentación',
     edtCantidadEmpleadosMultiperiodo, ValidarMasaYPersonal(FSinPersonal,
           edtCantidadEmpleadosMultiperiodo.Value, edtCantidadEmpleadosMultiperiodo.Value,
           edtSalariosEnCeroMultiperiodo.Value, edtMasaSalarialMultiperiodo.Value,
           edtMasaSalarialMultiperiodo.Value),
                             'La especificación de cantidad de empleados y masa para este formulario es incorrecta.',
      edtFechaPresentacionMultiperiodo, (ValorSql('SELECT NVL(EMI.UTILES.get_idddjj(' +
                                SqlValue(fraEmpresaFormulario.CUIT) + ', ' +
                                SqlValue(ppPeriodoPresentacionMultiperiodo.Periodo.Valor) + ',' +
                                SqlDate (edtFechaPresentacionMultiperiodo.Date) + '), -1) from dual ') = -1),
                                'Ya existe una nómina para con la misma fecha de presentación.']);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaIndividual.ValidarCabecera;
begin
  VerificarMultiple(['Validando Período Individual',
    fraEmpresaMultiperiodo, fraEmpresaMultiperiodo.IsSelected, 'Debe seleccionar una empresa.',
    fraTipoFormularioMultiperiodo, fraTipoFormularioMultiperiodo.IsSelected, 'Debe seleccionar un formulario',

    edtFechaPresentacionMultiperiodo, edtFechaPresentacionMultiperiodo.Date > 0, 'Debe Especificar una fecha de presentación',
    edtFechaPresentacionMultiperiodo, edtFechaPresentacionMultiperiodo.Date <= DBDate, 'La fecha de presentación no puede ser establecida en el futuro',
    edtFechaRecepcArtMultiperiodo, edtFechaRecepcArtMultiperiodo.Date > 0, 'Debe establecer una Fecha de Recepción ante la ART',
    edtFechaRecepcArtMultiperiodo, edtFechaRecepcArtMultiperiodo.Date <= DBDate, 'La Fecha de Recepción no puede ser establecida en el futuro',
    edtFechaRecepcArtMultiperiodo,  edtFechaRecepcArtMultiperiodo.Date >= edtFechaRecepcArtMultiperiodo.Date,
                          'La Fecha de Recepción ART debe ser anterior a la de presentación',
    edtBiblioratoMultiperiodo, edtBiblioratoMultiperiodo.Value > 0, 'Debe indicar el nro. de bibliorato.',
    edtSecuenciaMultiperiodo, edtSecuenciaMultiperiodo.Value > 0 , 'Debe inidicar la secuencia.',
    edtCodigoRectificativaMultiperiodo,
       edtCodigoRectificativaMultiperiodo.Text <> '',
       'Debe especificar un código de rectificativa',
    fraTipoNominaMultiperiodo, fraTipoNominaMultiperiodo.IsSelected, 'Debe seleccionar un tipo de nómina.']);
end;
{------------------------------------------------------------------------------}
function TfrmCargaIndividual.ValidarMasaYPersonal(SinPersonal : boolean; Empleados,
      EmpleadosDeclar, SalariosEnCero : Integer; MasaSalarial, MasaSalarialDeclar : Currency ) : boolean;
begin
  result := ( not  SinPersonal
              and  (Empleados > 0)
              and ((EmpleadosDeclar > 0)
              and  (MasaSalarial > 0)
              and  (MasaSalarialDeclar > 0))
              and  (Empleados > SalariosEnCero)
             )
           or
             (SinPersonal
              and  (Empleados    = 0)
              and ((EmpleadosDeclar = 0)
              and  (MasaSalarial = 0)
              and  (MasaSalarialDeclar = 0))
           );
end;
{-------------------------------------------------------------------------------}

procedure TfrmCargaIndividual.dbgPeriodosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqNota.FieldByName('no_idestadonota').AsInteger = 1{ESTADO_NOTA_PENDIENTE} then
  begin
    if HighLight then Background := clTeal else Background := $00EEFFFF;
  end

end;

procedure TfrmCargaIndividual.btnIncorporarNominaClick(Sender: TObject);
begin
  if (sdqNota.RecordCount > 0) and
     (sdqNota.FieldByName('no_idestadonota').AsInteger = 1{ESTADO_NOTA_PENDIENTE} ) and
     (MessageDlg('¿Confirma la activación y devengado de la presentación', mtConfirmation, [mbYes, mbNo], 0) = mrYes) 
  then
    do_activarpresentacionesnota(sdqNota.FieldByName('no_id').asinteger);
  Refrescar;
end;

procedure TfrmCargaIndividual.btnSimulacionClick(Sender: TObject);
begin

  ValidarPeriodoIndividual;

  with TFrmSimulacion.create(self) do
  begin
    Hide;
    FormStyle := fsNormal;
    SimularContrato(fraEmpresaMono.Contrato);
    Do_ActualizaNominaSim(fraEmpresaMono.Contrato,
                          ppPeriodoPresentacionMono.Text, edtEmpleadosDeclarMono.Value, edtMasaSalarialMono.Value,
                          edtSalariosEnCeroDeclarMono.Value, fraTipoFormularioMono.Value, fraTipoNominaMono.Value,
                          edCodRectificativaMono.Text,
                          edtMasaSalarialMono.Value, edtEmpleadosMono.Value, edtEmpleadosMasaEnCeroMono.Value,
                          edtFechaRecepcionARTMono.Date, edtFechaPresentacionMono.Date);
    ShowModal;
  end;

(*
  ValidarPeriodoIndividual;
  IncorporarDeclaracionSim;
  fpFormularioIndividual.Close;
*)
end;

procedure TfrmCargaIndividual.IncorporarDeclaracionSim;
begin
  ValidarPeriodoIndividual;

(* Ver
  do_incorporardeclaracionsim(fraEmpresaMono.Contrato,
     ppPeriodoPresentacionMono.Text, edtEmpleadosDeclarMono.Value, edtMasaSalarialMono.Value,
     edtSalariosEnCeroDeclarMono.Value, fraTipoFormularioMono.Value, fraTipoNominaMono.Value,
     edCodRectificativaMono.Text,
     edtMasaSalarialMono.Value, edtEmpleadosMono.Value, edtEmpleadosMasaEnCeroMono.Value,
     edtFechaRecepcionARTMono.Date, edtFechaPresentacionMono.Date,
     edtNroBiblioratoMono.Value, edtNroSecuenciaMono.Value, -1,
     '');
*)
end;

end.


