unit unRelevamientoCargaRapida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, ExtCtrls, DB, SDEngine,
  ComCtrls, ToolWin, StdCtrls, Buttons, Mask, ToolEdit, PatternEdit,
  IntEdit, unDmPrincipal, AnsiSql, SqlFuncs, General, unSesion, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ExComboBox, artSeguridad, unComunesFet,
  ShortCutControl;

type

  TfrmRelevamientoCargaRapida = class(TfrmCustomForm)
    pnlBottomPanel: TPanel;
    sdqDatosEstimados: TSDQuery;
    btnGuardar: TButton;
    btnCancelar: TButton;
    gbCargaEstimada: TGroupBox;
    edFechaCargaEstimado: TDateEdit;
    gbCargaDefinitiva: TGroupBox;
    lblFechaCargaEstimado: TLabel;
    edRelevamientosRecibidos: TIntEdit;
    lblRelevamientosRecibidos: TLabel;
    lblCantidadEstabEstimado: TLabel;
    edCantidadEstabEstimado: TIntEdit;
    edPrioridadEstimado: TEdit;
    lblPrioridadEstimado: TLabel;
    lblVigenciaEstimado: TLabel;
    edVigenciaEstimado: TEdit;
    lblCumplimientoEstimado: TLabel;
    pnlNavigator: TPanel;
    pnlNavegacion: TPanel;
    btnPrimero: TBitBtn;
    btnAnterior: TBitBtn;
    btnSiguiente: TBitBtn;
    btnUltimo: TBitBtn;
    lblFechaAprobado: TLabel;
    edFechaAprobado: TDateEdit;
    edVigenciaDefinitivo: TEdit;
    lblVigenciaDefinitivo: TLabel;
    edRelevValidos: TIntEdit;
    lblRelevValidos: TLabel;
    lblCantidadEstabDefinitivo: TLabel;
    edCantidadEstabDefinitivo: TIntEdit;
    lblCumplimientoDefinitivo: TLabel;
    edEstadoDefinitivo: TEdit;
    lblEstadoDefinitivo: TLabel;
    btnHistoricoEstimado: TSpeedButton;
    btnHistoricoDefinitivo: TSpeedButton;
    lblUsuarioCargaEstimado: TLabel;
    edUsuarioCargaEstimado: TEdit;
    lblUsuarioAprobado: TLabel;
    edUsuarioAprobado: TEdit;
    pnlTop: TPanel;
    fraEmpresa: TfraEmpresa;
    lblCUIT: TLabel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbNuevo: TToolButton;
    tbEliminar: TToolButton;
    ToolButton4: TToolButton;
    tbVerDetalle: TToolButton;
    ToolButton3: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton11: TToolButton;
    tbSalir: TToolButton;
    sdqDatosDefinitivo: TSDQuery;
    chkPresentoRectEstab: TCheckBox;
    fpDetalle: TFormPanel;
    sdqConsultaDetalle: TSDQuery;
    dsConsultaDetalle: TDataSource;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbDetalleActual: TToolButton;
    Grid: TArtDBGrid;
    fpHistorico: TFormPanel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbHistorico: TToolButton;
    ArtDBGrid1: TArtDBGrid;
    dsConsultaHistorico: TDataSource;
    sdqConsultaHistorico: TSDQuery;
    tbRefrescar: TToolButton;
    ToolButton1: TToolButton;
    pnlFiltroHistorico: TPanel;
    cmbTipoCarga: TExComboBox;
    lblTipodeCarga: TLabel;
    edRelevInval: TIntEdit;
    lblRelevInval: TLabel;
    tbEstablecimientos: TToolButton;
    Seguridad: TSeguridad;
    Label1: TLabel;
    edVigenciaDesde: TDateEdit;
    Label2: TLabel;
    edVigenciaHasta: TDateEdit;
    ShortCutControl1: TShortCutControl;
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edRelevamientosRecibidosChange(Sender: TObject);
    procedure fraEmpresaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbVerDetalleClick(Sender: TObject);
    procedure tbDetalleActualClick(Sender: TObject);
    procedure btnHistoricoEstimadoClick(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnHistoricoDefinitivoClick(Sender: TObject);
    procedure tbEstablecimientosClick(Sender: TObject);
    procedure fraEmpresamskCUITChange(Sender: TObject);
  private
    FModoForm: TModoABM;
    FContrato: integer;
    FIdEstimadoActivo: integer;
    procedure SetModoForm(const Value: TModoABM);
    procedure MoverRegistro(adireccion: integer);
    procedure MoverUltimo;
    procedure MoverPrimero;
    procedure CargarRegistro;
    procedure Limpiar;
    procedure CalcularPrioridad;
  public
    procedure CargarRelevamientos(aContrato: integer);
    procedure AltaEstimado(aContrato: integer);
  end;

var
  frmRelevamientoCargaRapida: TfrmRelevamientoCargaRapida;

implementation

uses
  VCLExtra, CustomDlgs, unContratoEstablecimiento, DateUtils;

{$R *.dfm}

{ TfrmRelevamientoCargaRapida }

procedure TfrmRelevamientoCargaRapida.AltaEstimado(aContrato: integer);
var
  strVigencia: String;
begin
  FContrato := aContrato;
  strVigencia := ValorSqlEx('SELECT hys.get_anionuevorelevriesglab(:contrato, null, ''E'') FROM DUAL', [FContrato]);
  if (strVigencia = '') then
  begin
    MsgBox('Aún no se puede cargar este relevamiento.' + #13#10 + 'Verifique estar detro 60 días antes de la renovación o que no exista uno cargado.', MB_ICONERROR);
    CargarRelevamientos(FContrato);
  end
  else begin
    SetModoForm(mfAlta);
    edVigenciaEstimado.Text := strVigencia;
//    edCantidadEstabEstimado.Value := ValorSqlIntegerEx('SELECT COUNT(*) FROM AFI.AES_ESTABLECIMIENTO WHERE ES_CONTRATO = :contrato AND ES_FECHABAJA IS NULL', [FContrato]);
    edCantidadEstabEstimado.Value := ValorSqlIntegerEx('SELECT hys.get_cantidadestabcump(:contrato) FROM dual', [FContrato]);
  end;
end;

procedure TfrmRelevamientoCargaRapida.CargarRelevamientos(
  aContrato: integer);
begin
  FContrato := aContrato;
  SetModoForm(mfNone);
  with sdqDatosEstimados do
  begin
    Close;
    ParamByName('contrato').AsInteger := FContrato;
    Open;
    MoverRegistro(0);
  end;
end;

procedure TfrmRelevamientoCargaRapida.MoverRegistro(adireccion: integer);
begin
  if not sdqDatosEstimados.IsEmpty then
  begin
    if ((adireccion = -1) and not sdqDatosEstimados.Eof) or
       ((adireccion =  1) and not sdqDatosEstimados.Bof) or
       (adireccion = 0) then
      sdqDatosEstimados.MoveBy(adireccion);
  end;
  CargarRegistro;
end;

procedure TfrmRelevamientoCargaRapida.SetModoForm(const Value: TModoABM);
begin
  FModoForm := Value;

  LockControls([edFechaCargaEstimado, edRelevamientosRecibidos, edUsuarioCargaEstimado, edPrioridadEstimado, edCantidadEstabEstimado, edVigenciaEstimado, chkPresentoRectEstab], true);
  LockControls([edFechaAprobado, edUsuarioAprobado, edRelevValidos, edRelevInval,  edCantidadEstabDefinitivo, edEstadoDefinitivo, edVigenciaDefinitivo], true);

  if FModoForm = mfAlta then
  begin
    Limpiar;
    if not pnlBottomPanel.Visible then
      self.Height := self.Height + pnlBottomPanel.Height;
    pnlBottomPanel.Visible := true;
    LockControl(edRelevamientosRecibidos, false);
    LockControl(chkPresentoRectEstab, false);
    fraEmpresa.Locked := true;
    CalcularPrioridad;
    edRelevamientosRecibidos.SetFocus;
  end
  else begin
    if pnlBottomPanel.Visible then
      self.Height := self.Height - pnlBottomPanel.Height;
    pnlBottomPanel.Visible := false;
    fraEmpresa.Locked := false;
  end;
end;

procedure TfrmRelevamientoCargaRapida.btnAnteriorClick(Sender: TObject);
begin
  MoverRegistro(-1);
end;

procedure TfrmRelevamientoCargaRapida.btnSiguienteClick(Sender: TObject);
begin
  MoverRegistro(1);
end;

procedure TfrmRelevamientoCargaRapida.btnPrimeroClick(Sender: TObject);
begin
  MoverPrimero;
  CargarRegistro;
end;

procedure TfrmRelevamientoCargaRapida.btnUltimoClick(Sender: TObject);
begin
  MoverUltimo;
  CargarRegistro;
end;

procedure TfrmRelevamientoCargaRapida.MoverPrimero;
begin
  sdqDatosEstimados.Last;
end;

procedure TfrmRelevamientoCargaRapida.MoverUltimo;
begin
  sdqDatosEstimados.First;
end;

procedure TfrmRelevamientoCargaRapida.CargarRegistro;
begin
  Limpiar;
(*
  if not sdqDatosEstimados.IsEmpty then
  begin
    edFechaCargaEstimado.Date := sdqDatosEstimados.fieldbyname('er_fechaalta').AsDateTime;
    edUsuarioCargaEstimado.Text := sdqDatosEstimados.fieldbyname('er_usualta').AsString;
    edPrioridadEstimado.Text := sdqDatosEstimados.fieldbyname('prioridad').AsString;
    edPrioridadEstimado.Tag := sdqDatosEstimados.fieldbyname('er_prioridad').AsInteger;
    edRelevamientosRecibidos.Value := sdqDatosEstimados.fieldbyname('er_cantrelevamientos').AsInteger;
    edCantidadEstabEstimado.Value := sdqDatosEstimados.fieldbyname('er_cantestablecimientos').AsInteger;
    edVigenciaEstimado.Text := sdqDatosEstimados.fieldbyname('er_vigencia').AsString;
    chkPresentoRectEstab.Checked := (sdqDatosEstimados.fieldbyname('er_rectificativaestab').AsString = 'S');
    FIdEstimadoActivo := sdqDatosEstimados.fieldbyname('er_id').AsInteger;
    if edRelevamientosRecibidos.Value >= edCantidadEstabEstimado.Value then
      lblCumplimientoEstimado.Caption := 'Cumplimiento SI'
    else
      lblCumplimientoEstimado.Caption := 'Cumplimiento NO';
*)
    with sdqDatosDefinitivo do
    begin
      Close;
      ParamByName('contrato').AsInteger := FContrato;
//      ParamByName('vigencia').AsString := sdqDatosEstimados.fieldbyname('er_vigencia').AsString;
      Open;
      if not IsEmpty then
      begin
        edFechaAprobado.Date := fieldbyname('cr_fechaautorizacion').AsDateTime;
        edUsuarioAprobado.Text := fieldbyname('cr_usuautorizacion').AsString;
        edRelevValidos.Value := fieldbyname('cr_cantrelevamientos').AsInteger;
        edRelevInval.Value := fieldbyname('cr_cantrelevinval').AsInteger;
        if (edRelevValidos.Value <> edRelevamientosRecibidos.Value) then
        begin
          edRelevValidos.Color := clRed;
          edRelevamientosRecibidos.Color := clRed;
        end;
        edCantidadEstabDefinitivo.Value := fieldbyname('cr_cantestablecimientos').AsInteger;
        edVigenciaDefinitivo.Text := fieldbyname('cr_vigencia').AsString;
        edEstadoDefinitivo.Text := fieldbyname('estado').AsString;
        if fieldbyname('CR_CUMPLIMIENTO').AsString  = 'S' then
          lblCumplimientoDefinitivo.Caption := 'Cumplimiento SI'
        else
          lblCumplimientoDefinitivo.Caption := 'Cumplimiento NO';
      end;
    end;
//  end;
end;

procedure TfrmRelevamientoCargaRapida.Limpiar;
begin
  FIdEstimadoActivo := -1;
  edFechaCargaEstimado.Clear;
  edUsuarioCargaEstimado.Clear;
  edPrioridadEstimado.Clear;
  edRelevamientosRecibidos.Clear;
  edCantidadEstabEstimado.Clear;
  edVigenciaEstimado.Clear;
  chkPresentoRectEstab.Checked := false;
  lblCumplimientoEstimado.Caption := 'Cumplimiento ----';

  edFechaAprobado.Clear;
  edRelevValidos.Clear;
  edRelevInval.Clear;
  edCantidadEstabDefinitivo.Clear;
  edUsuarioAprobado.Clear;
  edEstadoDefinitivo.Clear;
  edVigenciaDefinitivo.Clear;
  lblCumplimientoDefinitivo.Caption := 'Cumplimiento ----';
end;

procedure TfrmRelevamientoCargaRapida.btnGuardarClick(Sender: TObject);
begin
  with TSql.Create do
  try
    try
      BeginTrans;
      SqlType := stInsert;
      TableName := 'HYS.HER_ESTIMACIONRELEVAMIENTO';
      Fields.Add('ER_CONTRATO', FContrato);
      Fields.Add('ER_VIGENCIA', edVigenciaEstimado.Text);
      Fields.Add('ER_CANTRELEVAMIENTOS', edRelevamientosRecibidos.Value);
      Fields.Add('ER_CANTESTABLECIMIENTOS', edCantidadEstabEstimado.Value);
      Fields.Add('ER_PRIORIDAD', edPrioridadEstimado.Tag);
      PrimaryKey.Add('ER_ID', GetSecNextVal('hys.seq_her_estrelev'));
      Fields.Add('ER_FECHAALTA', exDateTime);
      Fields.Add('ER_USUALTA', Sesion.LoginName);
      Fields.Add('ER_RECTIFICATIVAESTAB', chkPresentoRectEstab.Checked);
      EjecutarSqlST(Sql);
      EjecutarStoreSTEx('hys.do_procesarcumplimiento(:contrato, :vigencia, :tipocarga, :cantidadrelev, NULL);', [FContrato, edVigenciaEstimado.Text, 'E', edRelevamientosRecibidos.Value]);
      CommitTrans;
      CargarRelevamientos(FContrato);
      SetModoForm(mfNone);
    finally
      free;
    end;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al guardar relevamientos. ' + #13#10 + E.Message );
    end;
  end;
end;

procedure TfrmRelevamientoCargaRapida.btnCancelarClick(Sender: TObject);
begin
  CargarRelevamientos(FContrato);
end;

procedure TfrmRelevamientoCargaRapida.edRelevamientosRecibidosChange(
  Sender: TObject);
begin
  if FModoForm = mfAlta then
  begin
    if edRelevamientosRecibidos.Value >= edCantidadEstabEstimado.Value then
      lblCumplimientoEstimado.Caption := 'Cumplimiento SI'
    else
      lblCumplimientoEstimado.Caption := 'Cumplimiento NO';
  end;
end;

procedure TfrmRelevamientoCargaRapida.fraEmpresaChange(Sender: TObject);
begin
  CargarRelevamientos(fraEmpresa.Contrato);
  if fraEmpresa.IsSelected then
  begin
    edVigenciaDesde.Date := fraEmpresa.sdqDatos.fieldByName('co_vigenciadesde').AsDateTime;
    edVigenciaHasta.Date := fraEmpresa.sdqDatos.fieldByName('co_vigenciahasta').AsDateTime;
  end
  else
  begin
    edVigenciaDesde.Clear;
    edVigenciaHasta.Clear;
  end;
end;

procedure TfrmRelevamientoCargaRapida.FormCreate(Sender: TObject);
begin
  inherited;
  with fraEmpresa do
  begin
    ShowBajas := true;
    OnChange := fraEmpresaChange;
    ExtraFields := ExtraFields+', co_vigenciadesde, co_vigenciahasta ';
  end;
  vclExtra.LockControls([edVigenciaDesde,edVigenciaHasta],True);
  CargarRelevamientos(-1);
end;

procedure TfrmRelevamientoCargaRapida.tbNuevoClick(Sender: TObject);
begin
  inherited;
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe seleccionar una empresa.');
  AltaEstimado(fraEmpresa.Contrato);
end;

procedure TfrmRelevamientoCargaRapida.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  Limpiar;
end;

procedure TfrmRelevamientoCargaRapida.tbSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelevamientoCargaRapida.tbEliminarClick(Sender: TObject);
var
  strVigencia: String;
begin
  inherited;
  strVigencia := ValorSqlEx('SELECT hys.get_anionuevorelevriesglab(:contrato, null, ''E'') FROM DUAL', [FContrato]);

  if edFechaCargaEstimado.Date > 0 then
  begin
    BeginTrans;
    EjecutarSqlST(' UPDATE hys.her_estimacionrelevamiento ' +
                  ' SET ER_FECHABAJA = SYSDATE, ER_USUBAJA = ' + SqlValue(Sesion.LoginName) +
                  ' WHERE ER_ID = ' + SqlValue(FIdEstimadoActivo));

    EjecutarSqlST(' UPDATE hys.hcr_cumplimientorelev ' +
                  ' SET cr_vigenciahasta = SYSDATE, ' +
                  '     cr_fechamodif = SYSDATE, ' +
                  '     cr_usumodif = ' + SqlValue(Sesion.LoginName) +
                  ' WHERE cr_contrato = ' + SqlValue(FContrato) +
                  '  AND cr_vigencia = ' + SqlValue(edVigenciaEstimado.Text) +
                  '  AND cr_vigenciahasta IS NULL ' +
                  '  AND cr_estado = ''A''');
    CommitTrans;
    CargarRelevamientos(FContrato);
  end;
end;

procedure TfrmRelevamientoCargaRapida.tbVerDetalleClick(Sender: TObject);
begin
  inherited;
  with sdqConsultaDetalle do
  begin
    Close;
    ParamByName('contrato').AsInteger := FContrato;
    ParamByName('vigencia').AsString := edVigenciaDefinitivo.Text;
    Open;
  end;
  fpDetalle.Caption := 'Detalle Relevamientos - Contrato ' + IntToStr(FContrato);
  fpDetalle.ShowModal;
end;

procedure TfrmRelevamientoCargaRapida.tbDetalleActualClick(
  Sender: TObject);
begin
  inherited;
  fpDetalle.ModalResult := mrOk;
end;

procedure TfrmRelevamientoCargaRapida.btnHistoricoEstimadoClick(
  Sender: TObject);
begin
  inherited;
  fpHistorico.Caption := 'Histórico Relevamientos - Contrato ' + IntToStr(FContrato);
  cmbTipoCarga.Value := 'E';
  tbRefrescarClick(Sender);
  fpHistorico.ShowModal;
end;

procedure TfrmRelevamientoCargaRapida.tbHistoricoClick(Sender: TObject);
begin
  inherited;
  fpHistorico.ModalResult := mrOk;
end;

procedure TfrmRelevamientoCargaRapida.tbRefrescarClick(Sender: TObject);
begin
  inherited;
  with sdqConsultaHistorico do
  begin
    Close;
    ParamByName('contrato').AsInteger := FContrato;
    ParamByName('vigencia').AsString := edVigenciaDefinitivo.Text;
    ParamByName('tipocarga').AsString := cmbTipoCarga.Value;
    Open;
  end;
end;

procedure TfrmRelevamientoCargaRapida.btnHistoricoDefinitivoClick(
  Sender: TObject);
begin
  inherited;
  fpHistorico.Caption := 'Histórico Relevamientos - Contrato ' + IntToStr(FContrato);
  cmbTipoCarga.Value := 'R';
  tbRefrescarClick(Sender);
  fpHistorico.ShowModal;
end;

procedure TfrmRelevamientoCargaRapida.tbEstablecimientosClick(Sender: TObject);
begin
  with TfrmContratoEstablecimiento.Create(Self) do
  try
    Visible := false;
    SetAutoCommit(true);
    DoCargarDatos(fraEmpresa.Contrato);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmRelevamientoCargaRapida.CalcularPrioridad;
begin
  if MonthsBetween(DBDate, edVigenciaDesde.Date) <=1 then
  begin
    edPrioridadEstimado.Tag := 3;
    edPrioridadEstimado.Text := 'Alta Contrato';
  end
  else
  begin
    if ExisteSqlEx(' SELECT 1 ' +
                   ' FROM afi.ate_traspasoegreso ' +
                   ' WHERE te_fechabaja IS NULL ' +
                   '   AND te_contrato = :contrato ' +
                   '   AND te_codigo = ''001''' +
                   '   AND TO_CHAR(te_fecha, ''YYYYMM'') = TO_CHAR(SYSDATE, ''YYYYMM'')', [fraEmpresa.Contrato]) then
    begin
      edPrioridadEstimado.Tag := 1;
      edPrioridadEstimado.Text := 'Traspaso Egreso';
    end
    else begin
      edPrioridadEstimado.Tag := 2;
      edPrioridadEstimado.Text := 'Renovación';
    end;
  end;
end;

procedure TfrmRelevamientoCargaRapida.fraEmpresamskCUITChange(
  Sender: TObject);
begin
  inherited;
  fraEmpresa.mskCUITChange(Sender);
end;

end.
