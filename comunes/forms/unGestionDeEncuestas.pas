unit unGestionDeEncuestas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt, unfraContacto, unfraContactoAgenda, unArtDbFrame, unFraEmpresa, unfraEmpresaAGENDA, unFraPreguntas,
  Vcl.Buttons, Vcl.CheckLst, ARTCheckListBox, pngextra, AdvGlowButton, Vcl.Mask, PatternEdit, IntEdit, RxToolEdit, DateComboBox, Vcl.ActnList,
  unFraTitulo, JvExExtCtrls, JvExtComponent, JvPanel;

type
  TfrmGestionDeEncuestas = class(TfrmCustomGridABM)
    ShortCutControlHijo: TShortCutControl;
    lblDescripcionFiltro: TLabel;
    sdqConsultaEI_ID: TFloatField;
    sdqConsultaEI_IDENCUESTA: TFloatField;
    sdqConsultaEI_IDTRASPASOEGRESO: TFloatField;
    sdqConsultaEI_CONTRATO: TFloatField;
    sdqConsultaEI_IDCONTACTO: TFloatField;
    sdqConsultaEI_IDTAREASIC: TFloatField;
    sdqConsultaEI_RESPONSABLE: TStringField;
    sdqConsultaEI_ESTADO: TStringField;
    sdqConsultaEI_IDMOTIVONOREALIZADA: TFloatField;
    sdqConsultaEI_USUTERMINADO: TStringField;
    sdqConsultaEI_FECHATERMINADO: TDateTimeField;
    sdqConsultaEI_USUALTA: TStringField;
    sdqConsultaEI_FECHAALTA: TDateTimeField;
    sdqConsultaEI_USUMODIF: TStringField;
    sdqConsultaEI_FECHAMODIF: TDateTimeField;
    sdqConsultaEI_USUBAJA: TStringField;
    sdqConsultaEI_FECHABAJA: TDateTimeField;
    fraEI_IDENCUESTA: TfraCodDesc;
    fraEmpresaEncuesta: TfraEmpresaAGENDA;
    fraContactoEncuesta: TfraContactoAGENDA;
    fraPreguntasEncuesta: TfraPreguntas;
    sdqConsultaEN_DESCRIPCION: TStringField;
    TiempoCarga: TTimer;
    tbAsignar: TToolButton;
    fpAsignarEncuesta: TFormPanel;
    Bevel2: TBevel;
    Label34: TLabel;
    btnAceptarAsignacionEncuesta: TButton;
    btnCancelarAsignacionEncuesta: TButton;
    fraEncuestaAsignar: TfraCodDesc;
    lbSinAsignar: TLabel;
    sdqSinAsignar: TSDQuery;
    pnlUsuarios: TPanel;
    Panel6: TPanel;
    clbAsignarEncuestas: TARTCheckListBox;
    pnlBottom: TPanel;
    pnlLeft: TPanel;
    pnlBotonera: TPanel;
    btPrimeraPregunta: TAdvGlowButton;
    btUltimaPregunta: TAdvGlowButton;
    btPreguntaSiguiente: TAdvGlowButton;
    btPreguntaAnterior: TAdvGlowButton;
    sdqAsignarEncuestas: TSDQuery;
    Label2: TLabel;
    edUsuarios: TEdit;
    pnlEncuesta: TPanel;
    Label1: TLabel;
    fraEncuesta: TfraCodDesc;
    Label3: TLabel;
    edEstado: TEdit;
    fraResponsable: TfraCodDesc;
    Label4: TLabel;
    sdqConsultaEE_DESCRIPCION: TStringField;
    sdqConsultaEN_ID: TFloatField;
    sdqConsultaEN_USUALTA: TStringField;
    sdqConsultaEN_FECHAALTA: TDateTimeField;
    sdqConsultaEN_USUMODIF: TStringField;
    sdqConsultaEN_FECHAMODIF: TDateTimeField;
    sdqConsultaEN_USUBAJA: TStringField;
    sdqConsultaEN_FECHABAJA: TDateTimeField;
    sdqConsultaEN_IDTIPOEVENTO: TFloatField;
    sdqConsultaEN_IDMOTIVOINGRESO: TFloatField;
    sdqConsultaSE_USUARIO: TStringField;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaCT_CONTACTO: TStringField;
    fraEI_RESPONSABLE: TfraCodDesc;
    Label5: TLabel;
    edEI_ID: TIntEdit;
    Label6: TLabel;
    edEI_FECHAALTADesde: TDateComboBox;
    edEI_FECHAALTAHasta: TDateComboBox;
    Label7: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    cblEI_ESTADO: TARTCheckListBox;
    tbReporte: TToolButton;
    btFinalizarEncuesta: TButton;
    Label8: TLabel;
    edEI_FECHATERMINADODesde: TDateComboBox;
    Label9: TLabel;
    edEI_FECHATERMINADOHasta: TDateComboBox;
    Label10: TLabel;
    Label11: TLabel;
    tbNoRealizada: TToolButton;
    fpNoRealizada: TFormPanel;
    Bevel1: TBevel;
    btAceptarNoAsignada: TButton;
    btCancelarNoRealizada: TButton;
    Label12: TLabel;
    fraEI_CONTRATO: TfraEmpresa;
    fraMotivoNoRealizada: TfraCodDesc;
    sdqMotivoNoRealizada: TSDQuery;
    alNavegacion: TActionList;
    acFirst: TAction;
    acNext: TAction;
    acLast: TAction;
    acPrior: TAction;
    Label13: TLabel;
    fraEI_IDMOTIVONOREALIZADA: TfraCodDesc;
    pnlEstados: TPanel;
    pnlC: TJvPanel;
    pnlA: TJvPanel;
    pnlN: TJvPanel;
    pnlR: TJvPanel;
    pnl1: TJvPanel;
    pnl2: TJvPanel;
    pnlReferenciasEstadoVto: TJvPanel;
    pnlReferencias: TJvPanel;
    fraTituloEncuesta: TfraTitulo;
    fraTituloABM: TfraTitulo;
    pnlGeneral: TPanel;
    bvlLeft: TBevel;
    bvlRight: TBevel;
    bvlBottom: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraEncuestaPropiedadesChange(Sender: TObject);
    procedure HabilitarBotonesNavegacion;
    procedure TiempoCargaTimer(Sender: TObject);
    procedure tbAsignarClick(Sender: TObject);
    procedure AsignarEncuesta(AIdEncuesta: Integer; AUsuario: String);
    procedure fraEncuestaAsignarPropiedadesChange(Sender: TObject);
    procedure RegistroUsuarios(Sender: TObject);
    procedure RegistroUsuariosTecla(Sender: TObject; var Key: Char);
    procedure pnlBottomResize(Sender: TObject);
    procedure tbReporteClick(Sender: TObject);
    procedure btFinalizarEncuestaClick(Sender: TObject);
    procedure BloquearEncuesta(ALocked: Boolean);
    procedure fraResponsablePropiedadesChange(Sender: TObject);
    procedure tbNoRealizadaClick(Sender: TObject);
    procedure btAceptarNoAsignadaClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fpAbmShow(Sender: TObject);
    function ExisteRelacion(AUsuario: String): Boolean;
    procedure acFirstExecute(Sender: TObject);
    procedure acPriorExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acLastExecute(Sender: TObject);
    procedure fraEI_IDENCUESTAPropiedadesChange(Sender: TObject);
    procedure edEI_IDKeyPress(Sender: TObject; var Key: Char);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure pnlEstadoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cblEI_ESTADOClick(Sender: TObject);
    procedure pnlCMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlAMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlRMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlNMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FSQL: String;
    FSQLSinAsignar: String;
    FSQLAsignarEncuestas: String;
    FFinalizarEncuesta: Boolean;
    procedure FramePreguntasEncuesta(Sender: TObject);
    procedure PanelMouseDown(APanel: TPanel; AIndex: Integer; ARefresh: Boolean = True);
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  frmGestionDeEncuestas: TfrmGestionDeEncuestas;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt, Strfuncs, unRptEncuesta;

{$R *.dfm}

procedure TfrmGestionDeEncuestas.BloquearEncuesta(ALocked: Boolean);
begin
  VCLExtra.LockControls([fraEncuesta, fraResponsable, fraEmpresaEncuesta, btFinalizarEncuesta, btnAceptar], ALocked);
  fraPreguntasEncuesta.BloquearPreguntas(ALocked);
end;

procedure TfrmGestionDeEncuestas.btAceptarNoAsignadaClick(Sender: TObject);
begin
  Verificar(fraMotivoNoRealizada.isEmpty, fraMotivoNoRealizada, 'Debe seleccionar un motivo.');
  fpNoRealizada.ModalResult := mrOk;
end;

procedure TfrmGestionDeEncuestas.btFinalizarEncuestaClick(Sender: TObject);
begin
  if MsgBox('¿Desea finalizar esta encuesta?', MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    FFinalizarEncuesta := True;
    try
      btnAceptarClick(Sender);
    finally
      FFinalizarEncuesta := False;
    end;
  end;
end;

procedure TfrmGestionDeEncuestas.cblEI_ESTADOClick(Sender: TObject);
begin
  case cblEI_ESTADO.ItemIndex of
    0: PanelMouseDown(TPanel(pnlC), 0);
    1: PanelMouseDown(TPanel(pnlA), 1);
    2: PanelMouseDown(TPanel(pnlR), 2);
    3: PanelMouseDown(TPanel(pnlN), 3);
  end;
end;

procedure TfrmGestionDeEncuestas.RegistroUsuariosTecla(Sender: TObject; var Key: Char);
begin
  RegistroUsuarios(nil);
end;

procedure TfrmGestionDeEncuestas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  btAceptarNoAsignada.Enabled := Seguridad.Activar(tbNoRealizada) and AreIn(sdqConsulta.FieldByName('EI_ESTADO').AsString, ['C', 'A']);
end;

procedure TfrmGestionDeEncuestas.ClearControls;
begin
  ClearComponentData(fpAbm);
  fraPreguntasEncuesta.Destruir;
  HabilitarBotonesNavegacion;
  BloquearEncuesta(False);
  fraTituloABM.AdvToolBarPager.Caption.Caption := 'Nueva encuesta';
end;

procedure TfrmGestionDeEncuestas.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
  tbAsignar.Enabled := False;
  tbReporte.Enabled := False;
  tbNoRealizada.Enabled := False;
  fraEI_IDMOTIVONOREALIZADA.Propiedades.ExtraCondition := '';
  edEI_FECHAALTADesde.Date := Now - 90;
  edEI_FECHAALTAHasta.Date := Now;
end;

function TfrmGestionDeEncuestas.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('EI_ID', sdqConsulta.FieldByName('EI_ID').AsInteger);
     Sql.Fields.Add('EI_FECHABAJA', exDate);
     Sql.Fields.Add('EI_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       //Sql.PrimaryKey.AddInteger('EI_ID', ValorSQLInteger('SELECT NVL(MAX(EI_ID), 0) FROM COMERCIAL.CEI_ENCUESTAINSTANCIA') + 1);
       //Sql.PrimaryKey.AddExpression('EI_ID', 'COMERCIAL.SEQ_CEI_ID.NEXTVAL');
       Sql.PrimaryKey.Add('EI_ID', GetSecNextVal('COMERCIAL.SEQ_CEI_ID'));

       Sql.Fields.Add('EI_FECHAALTA', exDate);
       Sql.Fields.Add('EI_USUALTA', Sesion.UserID);
       Sql.Fields.AddString('EI_ESTADO', iif(FFinalizarEncuesta, 'R', iif(fraResponsable.IsSelected, 'A', 'C')));
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('EI_ID', sdqConsulta.FieldByName('EI_ID').AsInteger);
       Sql.Fields.Add('EI_FECHAMODIF', exDate);
       Sql.Fields.Add('EI_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('EI_FECHABAJA', exNull);
       Sql.Fields.Add('EI_USUBAJA', exNull);
       Sql.Fields.AddString('EI_ESTADO', iif(FFinalizarEncuesta, 'R', sdqConsulta.FieldByName('EI_ESTADO').AsString));
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('EI_IDENCUESTA', fraEncuesta.Codigo);
     Sql.Fields.Add('EI_RESPONSABLE', fraResponsable.Codigo);
     Sql.Fields.AddInteger('EI_CONTRATO', fraEmpresaEncuesta.Contrato, True);
     Sql.Fields.AddInteger('EI_IDCONTACTO', fraContactoEncuesta.ContactoId, True);

     if FFinalizarEncuesta then
     begin
       Sql.Fields.Add('EI_USUTERMINADO', Sesion.UserID);
       Sql.Fields.Add('EI_FECHATERMINADO', exDate);
     end;
  end;

  BeginTrans(True);
  try
    Result := inherited DoABM;
    if ModoABM <> maBaja then
      fraPreguntasEncuesta.GuardarRespuestas(Sql.PrimaryKey.FieldByName['EI_ID'].Value, ModoABM); //no hacerlo en la baja!!!
    CommitTrans(True);

    if FFinalizarEncuesta then
      TqrEncuesta.GenerarPDF(Sql.PrimaryKey.FieldByName['EI_ID'].Value);
  except
    on E: Exception do
    begin
      Result := False;
      RollBack(True);
      ErrorMsg(E);
    end;
  end;
end;

procedure TfrmGestionDeEncuestas.edEI_IDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr( VK_RETURN )  then
    tbRefrescarClick(nil);
end;

procedure TfrmGestionDeEncuestas.FormCreate(Sender: TObject);
begin
  inherited;
  HideTitlebar;
  SQL.TableName := 'COMERCIAL.CEI_ENCUESTAINSTANCIA';
  FieldBaja := 'EI_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  FSQLSinAsignar := sdqSinAsignar.SQL.Text;
  FSQLAsignarEncuestas := sdqAsignarEncuestas.SQL.Text;
  AutoColWidths := True;
  with fraEmpresaEncuesta do
  begin
    FrameContacto := fraContactoEncuesta;
    ShowBajas := True;
  end;
  fraEI_CONTRATO.ShowBajas := True;
  fraContactoEncuesta.fraTelefonos.Initialize(True, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');
  VCLExtra.LockControls([fraContactoEncuesta, edUsuarios, edEstado], True);
  fraContactoEncuesta.TabStop := True;
  tbNorealizada.Left := tbPropiedades.Left + 1;
  tbReporte.Left := tbPropiedades.Left + 1;
  tbAsignar.Left := tbPropiedades.Left + 1;
  tbAsignar.Enabled := False;
  tbReporte.Enabled :=  False;
  fraPreguntasEncuesta.OnChange := FramePreguntasEncuesta;
  ClearData;
  ShowActived := False;
end;

procedure TfrmGestionDeEncuestas.FramePreguntasEncuesta(Sender: TObject);
begin
  HabilitarBotonesNavegacion;
end;

procedure TfrmGestionDeEncuestas.fpAbmShow(Sender: TObject);
begin
  inherited;
  fraEncuesta.edCodigo.SetFocus;
end;

procedure TfrmGestionDeEncuestas.fraEI_IDENCUESTAPropiedadesChange(Sender: TObject);
begin
  if fraEI_IDENCUESTA.Value > 0 then
    fraEI_IDMOTIVONOREALIZADA.Propiedades.ExtraCondition := 'and EM_IDENCUESTA = ' + SqlValue(fraEI_IDENCUESTA.Value);
end;

procedure TfrmGestionDeEncuestas.fraEncuestaAsignarPropiedadesChange(Sender: TObject);
var
  iCant: Integer;
begin
  if not fraEncuestaAsignar.IsEmpty then
  begin
    OpenQueryEx(sdqSinAsignar, [fraEncuestaAsignar.Value]);
    iCant := sdqSinAsignar.RecordCount;
    if iCant = 0 then
      lbSinAsignar.Caption := 'No tiene encuestas sin asignar'
    else
    if iCant = 1 then
      lbSinAsignar.Caption := 'Se detectó 1 encuesta sin asignar'
    else
      lbSinAsignar.Caption := 'Se detectaron ' + IntToStr(iCant) +  ' encuestas sin asignar';
  end;
end;

procedure TfrmGestionDeEncuestas.fraEncuestaPropiedadesChange(Sender: TObject);
begin
  fraPreguntasEncuesta.Instanciar(fraEncuesta.Value);
  BloquearEncuesta(False);
  HabilitarBotonesNavegacion;
  fraPreguntasEncuesta.Change;
end;

procedure TfrmGestionDeEncuestas.fraResponsablePropiedadesChange(Sender: TObject);
begin
  fraPreguntasEncuesta.BloquearPreguntas(fraResponsable.IsEmpty);
end;

procedure TfrmGestionDeEncuestas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FullName, ['EE_DESCRIPCION']) then
  try
    if Field.DataSet.Active and not Field.DataSet.IsEmpty then
      Background := TPanel(FindComponent('pnl' + Field.DataSet.FieldByName('EI_ESTADO').AsString)).Color;
  except
  end;

  if AreIn(Field.FullName, ['ESTADO_VENCIMIENTO']) then
  try
    if Field.DataSet.Active and not Field.DataSet.IsEmpty then
      Background := TPanel(FindComponent('pnl' + Field.DataSet.FieldByName('ID_ESTADO_VENCIMIENTO').AsString)).Color;
  except
  end;
end;

procedure TfrmGestionDeEncuestas.HabilitarBotonesNavegacion;
begin
  with fraPreguntasEncuesta, fraPreguntasEncuesta.pcPreguntas do
  begin
    acFirst.Enabled := (PageCount > 0) and (ActivePageIndex > 0);
    acPrior.Enabled := (PageCount > 0) and (ActivePageIndex > 0);
    acNext.Enabled  := (PageCount > 0) and (ActivePageIndex < PageCount - 1);
    acLast.Enabled  := (PageCount > 0) and (ActivePageIndex < PageCount - 1);

    if PageCount > 0 then
      Encuesta.Frame[pcPreguntas.ActivePageIndex].SetFocus;
  end;
end;

procedure TfrmGestionDeEncuestas.LoadControls;
begin
  fraEncuesta.Value := sdqConsulta.FieldByName('EI_IDENCUESTA').AsInteger;
  fraEmpresaEncuesta.Contrato := sdqConsulta.FieldByName('EI_CONTRATO').AsInteger;
  fraContactoEncuesta.LoadContrato(fraEmpresaEncuesta.Contrato);
  fraContactoEncuesta.ContactoId := sdqConsulta.FieldByName('EI_IDCONTACTO').AsInteger;
  edEstado.Text := sdqConsulta.FieldByName('EE_DESCRIPCION').AsString;
  fraResponsable.Codigo := sdqConsulta.FieldByName('SE_USUARIO').AsString;
  fraPreguntasEncuesta.Instanciar(fraEncuesta.Value);
  fraPreguntasEncuesta.CargarRespuestas(sdqConsulta.FieldByName('EI_ID').AsInteger);
  TiempoCarga.Enabled := True;
  BloquearEncuesta((sdqConsulta.FieldByName('EI_ESTADO').AsString = 'R') or (sdqConsulta.FieldByName('EI_ESTADO').AsString = 'N'));
  VCLExtra.LockControls([fraEncuesta], True);
  btnAceptar.Enabled := Seguridad.Activar(btnAceptar) and AreIn(sdqConsulta.FieldByName('EI_ESTADO').AsString, ['C', 'A']);
  //VCLExtra.LockControls([fraEmpresaEncuesta, fraContactoencuesta], fraPreguntasEncuesta.TieneAlgunaRespuesta);
  fraTituloABM.AdvToolBarPager.Caption.Caption := 'Encuesta N° ' + sdqConsulta.FieldByName('EI_ID').AsString;
end;

procedure TfrmGestionDeEncuestas.pnlAMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 1);
end;

procedure TfrmGestionDeEncuestas.pnlBottomResize(Sender: TObject);
begin
  inherited;
  pnlLeft.Width := Round((pnlBottom.Width - pnlBotonera.Width) / 2);
end;

procedure TfrmGestionDeEncuestas.PanelMouseDown(APanel: TPanel; AIndex: Integer; ARefresh: Boolean = True);
begin
  APanel.Tag := 1 - APanel.Tag;
  APanel.BevelOuter := iif(APanel.Tag = 1, bvLowered, bvNone);
  APanel.BorderStyle := iif(APanel.Tag = 1, bsSingle, bsNone);

  if APanel.Tag = 1 then
    APanel.Font.Style := [fsBold]
  else
    APanel.Font.Style := [];

  cblEI_ESTADO.Checked[AIndex] := APanel.Tag = 1;

  if ARefresh then
    RefreshData;
end;

procedure TfrmGestionDeEncuestas.pnlEstadoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PanelMouseDown(TPanel(Sender), TPanel(Sender).Tag);
end;

procedure TfrmGestionDeEncuestas.pnlNMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 2);
end;

procedure TfrmGestionDeEncuestas.pnlRMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 3);
end;

procedure TfrmGestionDeEncuestas.pnlCMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 0);
end;

procedure TfrmGestionDeEncuestas.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;

  tbAsignar.Enabled := sdqConsulta.Active and (not sdqConsulta.IsEmpty);
  tbReporte.Enabled := sdqConsulta.Active and (not sdqConsulta.IsEmpty);
  tbNoRealizada.Enabled := sdqConsulta.Active and (not sdqConsulta.IsEmpty);
end;

procedure TfrmGestionDeEncuestas.RegistroUsuarios(Sender: TObject);
begin
  edUsuarios.Text := clbAsignarEncuestas.CheckedItems.CommaText;
end;

function TfrmGestionDeEncuestas.ExisteRelacion(AUsuario: String): Boolean;
var
  sSql: String;
begin
  sSql :=
  ' select * FROM ' +
  ' dual where :usu ' +
  ' in( ' +
  ' SELECT se_usuario ' +
          '  FROM art.use_usuarios ' +
          ' WHERE se_fechabaja IS NULL ' +
     ' START WITH se_usuario = :usuario ' +
     ' CONNECT BY PRIOR se_usuario = se_respondea ' +
            ' AND se_usuario <> se_respondea)';
  Result := ExisteSqlEx(sSql, [AUsuario, Sesion.UserID]);
end;

function TfrmGestionDeEncuestas.Validar: Boolean;
begin
  Result := False;
  Verificar(fraEncuesta.IsEmpty, fraEncuesta.edCodigo, 'Debe seleccionar una encuesta.');
  Verificar((not fraResponsable.Locked) and (fraResponsable.IsBaja), fraResponsable.edCodigo, 'Debe seleccionar un responsable activo.');
  Verificar(not (fraResponsable.IsEmpty or ExisteRelacion(fraResponsable.Codigo)), fraResponsable.edCodigo, 'No puede asignar a este usuario.');

  Verificar(fraPreguntasEncuesta.TieneAlgunaRespuesta and fraEmpresaEncuesta.IsEmpty, fraEmpresaEncuesta.edContrato, 'Debe seleccionar una empresa.');
  Verificar(fraPreguntasEncuesta.TieneAlgunaRespuesta and fraContactoEncuesta.IsEmpty, fraContactoEncuesta.tbContacto, 'Debe seleccionar un contacto.');

  if FFinalizarEncuesta then
  begin
    Verificar(fraResponsable.IsEmpty, fraResponsable.edCodigo, 'Debe seleccionar un responsable.');
    Verificar(fraEmpresaEncuesta.IsEmpty, fraEmpresaEncuesta.edContrato, 'Debe seleccionar una empresa.');
    Verificar(fraContactoEncuesta.IsEmpty, fraContactoEncuesta.tbContacto, 'Debe seleccionar un contacto.');
    try
      Result := fraPreguntasEncuesta.ValidarPreguntas;
    finally
      if not Result then
        HabilitarBotonesNavegacion;
    end;
  end else
    Result := True;
end;

procedure TfrmGestionDeEncuestas.acFirstExecute(Sender: TObject);
begin
  fraPreguntasEncuesta.PrimeraPregunta;
  HabilitarBotonesNavegacion;
end;

procedure TfrmGestionDeEncuestas.acLastExecute(Sender: TObject);
begin
  fraPreguntasEncuesta.UltimaPregunta;
  HabilitarBotonesNavegacion;
end;

procedure TfrmGestionDeEncuestas.acNextExecute(Sender: TObject);
begin
  fraPreguntasEncuesta.PreguntaSiguiente;
  HabilitarBotonesNavegacion;
end;

procedure TfrmGestionDeEncuestas.acPriorExecute(Sender: TObject);
begin
  fraPreguntasEncuesta.PreguntaAnterior;
  HabilitarBotonesNavegacion;
end;

procedure TfrmGestionDeEncuestas.AfterConstruction;
begin
  inherited;
  PanelMouseDown(TPanel(pnlC), 0, False);
  PanelMouseDown(TPanel(pnlA), 1);
end;

procedure TfrmGestionDeEncuestas.AsignarEncuesta(AIdEncuesta: Integer; AUsuario: String);
begin
  EjecutarSqlEx('UPDATE comercial.cei_encuestainstancia ' +
                   'SET EI_RESPONSABLE = :idusuario, ' +
                       'EI_ESTADO = ''A'', ' +
                       'EI_FECHAMODIF = SYSDATE, ' +
                       'EI_USUMODIF = :usuario ' +
                 'WHERE EI_ID = :idencuesta '
                 , [AUsuario, Sesion.UserID, AIdEncuesta]);
end;

procedure TfrmGestionDeEncuestas.tbAsignarClick(Sender: TObject);
var
  i: Integer;
begin
  fraEncuestaAsignar.Clear;
  lbSinAsignar.Caption := '';
  clbAsignarEncuestas.ClearChecks;
  edUsuarios.Clear;
  clbAsignarEncuestas.SQL := StrReplace(FSQLAsignarEncuestas, ':usuario', SqlValue(Sesion.UserID));
  if fpAsignarEncuesta.ShowModal = mrOk then
  begin
    i := 0;
    while not sdqSinAsignar.Eof do
    begin
      AsignarEncuesta(sdqSinAsignar.FieldByName('EI_ID').AsInteger, clbAsignarEncuestas.ValuesChecked[i]);
      Inc(i);
      if i = clbAsignarEncuestas.ValuesChecked.Count then
        i := 0;
      sdqSinAsignar.Next;
    end;
    RefreshData;
  end;
end;

procedure TfrmGestionDeEncuestas.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

procedure TfrmGestionDeEncuestas.tbNoRealizadaClick(Sender: TObject);
begin
  fraMotivoNoRealizada.Clear;
  fraMotivoNoRealizada.Propiedades.ExtraCondition := ' AND EM_IDENCUESTA = ' + SqlValue(sdqConsulta.FieldByName('EI_IDENCUESTA').AsInteger);
  fraMotivoNoRealizada.Value := sdqConsulta.FieldByname('EI_IDMOTIVONOREALIZADA').AsInteger;
  if fpNoRealizada.ShowModal = mrOk then
  begin
    EjecutarSqlEx('UPDATE COMERCIAL.CEI_ENCUESTAINSTANCIA SET EI_IDMOTIVONOREALIZADA = :idmotivo' + ', EI_ESTADO = ' + SqlValue('N') + ' WHERE EI_ID = :idinstancia ', [fraMotivoNoRealizada.Value, sdqConsulta.FieldByName('EI_ID').AsInteger]);
    RefreshData;
  end;
end;

procedure TfrmGestionDeEncuestas.tbReporteClick(Sender: TObject);
begin
  Application.CreateForm(TqrEncuesta, qrEncuesta);
  try
    qrEncuesta.IdEncuestaInstancia := sdqConsulta.FieldByName('EI_ID').AsInteger;
  finally
    FreeAndNil(qrEncuesta);
  end;
end;

procedure TfrmGestionDeEncuestas.TiempoCargaTimer(Sender: TObject);
begin
  TiempoCarga.Enabled := False;
  HabilitarBotonesNavegacion;
  fraPreguntasEncuesta.Change;
end;

end.
