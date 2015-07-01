unit unGestionDeVisitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt, unfraContacto, unfraContactoAgenda, unArtDbFrame, unFraEmpresa, unfraEmpresaAGENDA, unFraPreguntas,
  Vcl.Buttons, Vcl.CheckLst, ARTCheckListBox, pngextra, AdvGlowButton, Vcl.Mask, PatternEdit, IntEdit, RxToolEdit, DateComboBox, Vcl.ActnList, JvExExtCtrls,
  JvExtComponent, JvPanel, unFraTema, unFraTemas, unFraEstablecimiento, unFraEstablecimientoAGENDA, unFraDomicilio, unFraDomicilioEmpresa, unFraWebBrowser, unFraGIS_APIv3,
  unFraDomicilioGIS, unFraTitulo, AdvToolBar, Vcl.Menus, unfraEntidadVendedorAGENDA,
  AdvGroupBox, AdvOfficeButtons, JvComponentBase, JvAppEvent, Vcl.DBCtrls,
  JvDBImage, AdvPicture, DBAdvPicture;

type
  TfrmGestionDeVisitas = class(TfrmCustomGridABM)
    ShortCutControlHijo: TShortCutControl;
    lblDescripcionFiltro: TLabel;
    fraVI_IDVISITA: TfraCodDesc;
    TiempoCarga: TTimer;
    tbAsignar: TToolButton;
    sdqSinAsignar: TSDQuery;
    sdqAsignarVISITAS: TSDQuery;
    fraVI_RESPONSABLE: TfraCodDesc;
    Label5: TLabel;
    edVI_ID: TIntEdit;
    Label6: TLabel;
    edVI_FECHAALTADesde: TDateComboBox;
    edVI_FECHAALTAHasta: TDateComboBox;
    Label7: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    cblVI_ESTADO: TARTCheckListBox;
    tbReporte: TToolButton;
    btFinalizarVISITA: TButton;
    Label8: TLabel;
    edVI_FECHAMODIFDesde: TDateComboBox;
    Label9: TLabel;
    edVI_FECHAMODIFHasta: TDateComboBox;
    Label10: TLabel;
    Label11: TLabel;
    tbNoRealizada: TToolButton;
    fpNoRealizada: TFormPanel;
    bvlNoRealizada: TBevel;
    btAceptarNoAsignada: TButton;
    btCancelarNoRealizada: TButton;
    Label12: TLabel;
    fraVI_CONTRATO: TfraEmpresa;
    fraMotivoNoRealizada: TfraCodDesc;
    sdqMotivoNoRealizada: TSDQuery;
    Label13: TLabel;
    fraVI_IDMOTIVONOREALIZADA: TfraCodDesc;
    pgVisita: TPageControl;
    tsVisita: TTabSheet;
    tsMapa: TTabSheet;
    pnlVisitaTemas: TJvPanel;
    fraTemasVisita: TfraTemas;
    sdqConsultaVI_ID: TFloatField;
    sdqConsultaVI_IDVISITA: TFloatField;
    sdqConsultaVI_CONTRATO: TFloatField;
    sdqConsultaVI_IDCONTACTO: TFloatField;
    sdqConsultaVI_IDESTABLECIMIENTO: TFloatField;
    sdqConsultaVI_IDTAREASIC: TFloatField;
    sdqConsultaVI_RESPONSABLE: TStringField;
    sdqConsultaVI_ESTADO: TStringField;
    sdqConsultaVI_IDMOTIVONOREALIZADA: TFloatField;
    sdqConsultaVI_USUALTA: TStringField;
    sdqConsultaVI_FECHAALTA: TDateTimeField;
    sdqConsultaVI_USUMODIF: TStringField;
    sdqConsultaVI_FECHAMODIF: TDateTimeField;
    sdqConsultaVI_USUBAJA: TStringField;
    sdqConsultaVI_FECHABAJA: TDateTimeField;
    sdqConsultaVI_FECHAINICIOVISITA: TDateTimeField;
    sdqConsultaVI_FECHAFINVISITA: TDateTimeField;
    sdqConsultaVI_USUARIOVISITA: TStringField;
    sdqConsultaVS_ID: TFloatField;
    sdqConsultaVS_DESCRIPCION: TStringField;
    sdqConsultaVS_USUALTA: TStringField;
    sdqConsultaVS_FECHAALTA: TDateTimeField;
    sdqConsultaVS_USUMODIF: TStringField;
    sdqConsultaVS_FECHAMODIF: TDateTimeField;
    sdqConsultaVS_USUBAJA: TStringField;
    sdqConsultaVS_FECHABAJA: TDateTimeField;
    sdqConsultaVS_IDTIPOEVENTO: TFloatField;
    sdqConsultaVS_IDMOTIVOINGRESO: TFloatField;
    sdqConsultaVE_DESCRIPCION: TStringField;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaCT_CONTACTO: TStringField;
    Panel3: TPanel;
    sdqConsultaVI_OBSERVACIONES: TStringField;
    fraDomicilioGISVisita: TfraDomicilioGIS;
    sdqConsultaFECHA_VISITA: TDateTimeField;
    sdqConsultaHORA_INICIO: TStringField;
    sdqConsultaHORA_FIN: TStringField;
    sdqConsultaSE_USUARIO: TStringField;
    edVI_FECHAINICIOVISITADesde: TDateComboBox;
    edVI_FECHAINICIOVISITAHasta: TDateComboBox;
    Label2: TLabel;
    Label4: TLabel;
    fraVI_USUARIOVISITA: TfraCodDesc;
    Label17: TLabel;
    fraTituloABM: TfraTitulo;
    fraTituloVisita: TfraTitulo;
    bvlLeft: TBevel;
    bvlRight: TBevel;
    bvlBottom: TBevel;
    sdqConsultaES_NOMBRE: TStringField;
    pnlVisitaDetalle: TJvPanel;
    pnlFechaVisita: TPanel;
    lbFechaVisita: TLabel;
    lbHasta: TLabel;
    Label3: TLabel;
    edFechaVisita: TDateComboBox;
    edHoraVisitaInicio: TDateTimePicker;
    edHoraVisitaFin: TDateTimePicker;
    pnlUsuarioVisita: TPanel;
    lbUsuarioVisita: TLabel;
    fraUsuarioVisita: TfraCodDesc;
    pnlVisita: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    fraVisita: TfraCodDesc;
    fraResponsable: TfraCodDesc;
    edEstado: TEdit;
    advVisita: TAdvPage;
    advMapa: TAdvPage;
    TiempoContacto: TTimer;
    pmAgendarVisita: TPopupMenu;
    sdqUpdateVisita: TSDQuery;
    sdqDiasMenuVisita: TSDQuery;
    sdqConsultaCUANDO: TStringField;
    rgVI_FECHAINICIOVISITA: TAdvOfficeRadioGroup;
    sdqConsultaVI_IDENTIDAD: TFloatField;
    sdqConsultaVI_IDVENDEDOR: TFloatField;
    sdqConsultaVS_DESTINATARIO: TFloatField;
    sdqConsultaENTIDAD: TStringField;
    sdqConsultaVENDEDOR: TStringField;
    fraEntidadVendedorAGENDABuscar: TfraEntidadVendedorAGENDA;
    sdqMotivoDeingreso: TSDQuery;
    pnlEstados: TPanel;
    pnlP: TJvPanel;
    pnlA: TJvPanel;
    pnlN: TJvPanel;
    pnlR: TJvPanel;
    TiempoMapa: TTimer;
    sdqHolding: TSDQuery;
    pnlGen: TPanel;
    pnlEmpresa: TPanel;
    pnlEntidadVendedor: TPanel;
    Label19: TLabel;
    edVI_FECHAVENCIMIENTODesde: TDateComboBox;
    Label20: TLabel;
    edVI_FECHAVENCIMIENTOHasta: TDateComboBox;
    rgVencimientoBuscar: TAdvOfficeRadioGroup;
    sdqConsultaVI_FECHAVENCIMIENTO: TDateTimeField;
    sdqConsultaVI_IDMOTIVOINGRESO: TFloatField;
    sdqConsultaID_ESTADO_VENCIMIENTO: TFloatField;
    sdqConsultaESTADO_VENCIMIENTO: TStringField;
    pnl1: TJvPanel;
    pnl2: TJvPanel;
    pnlMotivoIngreso: TPanel;
    fraMotivoDeIngreso: TfraCodDesc;
    Label18: TLabel;
    pnlReferenciasEstadoVto: TJvPanel;
    pnlReferencias: TJvPanel;
    JvAppEvents: TJvAppEvents;
    sdqFotoMobile: TSDQuery;
    pnlBottom: TPanel;
    pnlObservaciones: TPanel;
    Label1: TLabel;
    mObservaciones: TMemo;
    pnlFoto: TPanel;
    dsFotoMobile: TDataSource;
    pnlTituloFoto: TPanel;
    Label21: TLabel;
    dbiFoto: TDBAdvPicture;
    sdqConsultaDOMICILIO: TStringField;
    sdqConsultaEM_CUIT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraVisitaPropiedadesChange(Sender: TObject);
    procedure TiempoCargaTimer(Sender: TObject);
    procedure AsignarVisita(AIdVisita: Integer; AUsuario: String);
    procedure tbReporteClick(Sender: TObject);
    procedure btFinalizarVisitaClick(Sender: TObject);
    procedure BloquearVisita(ALocked: Boolean);
    procedure tbNoRealizadaClick(Sender: TObject);
    procedure btAceptarNoAsignadaClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fpAbmShow(Sender: TObject);
    function ExisteRelacion(AUsuario: String): Boolean;
    procedure fraVI_IDVISITAPropiedadesChange(Sender: TObject);
    procedure edVI_IDKeyPress(Sender: TObject; var Key: Char);
    procedure tsVisitaResize(Sender: TObject);
    procedure fraTituloABMAdvToolBarPagerChange(Sender: TObject);
    procedure TiempoContactoTimer(Sender: TObject);
    procedure FSFormActivate(Sender: TObject);
    procedure mnuCancelarVisitaClick(Sender: TObject);
    procedure mnuAgendarVisitaClick(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure pnlPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlAMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlNMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlReferenciasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlRMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TiempoMapaTimer(Sender: TObject);
    procedure cblVI_ESTADOClick(Sender: TObject);
    procedure pnl1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnl2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlReferenciasEstadoVtoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure edEstadoChange(Sender: TObject);
    procedure JvAppEventsIdle(Sender: TObject; var Done: Boolean);
    procedure fraUsuarioVisitaPropiedadesChange(Sender: TObject);
    procedure edFechaVisitaExit(Sender: TObject);
    procedure pmAgendarVisitaPopup(Sender: TObject);
  private
    fraEmpresaVisita: TfraEmpresaAGENDA;
    fraEstablecimientoVisita: TfraEstablecimientoAGENDA;
    fraContactoVisita: TfraContactoAGENDA;
    fraEntidadVendedorVisita: TfraEntidadVendedorAGENDA;

    mnuCancelarVisita: TMenuItem;

    fraGIS_MapaVisita: TfraGIS_APIv3;
    FSQL: String;
    FSQLSinAsignar: String;
    FSQLAsignarVisitas: String;
    FFinalizarVisita: Boolean;
    FSQLUpdateVisita: String;
    FHoy: TDateTime;
    procedure EmpresaChange(Sender: TObject);
    procedure EstablecimientoChange(Sender: TObject);
    procedure DomicilioChange(Sender: TObject);
    procedure AgendarVisita(AFecha: TDateTime; AEstado: String);
    procedure ArmarMenuAgendarVisita;
    procedure PanelMouseDown(APanel: TPanel; AIndex: Integer; ARefresh: Boolean = True);
    procedure PanelVencidasMouseDown(APanel: TPanel; AIndex: Integer);
    procedure ClearPanelesEstado;
    procedure CargarFotoMobile;
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
  frmGestionDeVisitas: TfrmGestionDeVisitas;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt, Strfuncs, unRptVisita, Numeros, DateTimeFuncs, unGIS, unAlarmas,
  unOutlook, uncomunes;

{$R *.dfm}

procedure TfrmGestionDeVisitas.BloquearVisita(ALocked: Boolean);
begin
  VCLExtra.LockControls([fraVisita, fraResponsable, fraEmpresaVisita, fraEstablecimientoVisita, fraEntidadVendedorVisita, edFechaVisita, edHoraVisitaInicio, edHoraVisitaFin, fraUsuarioVisita, mObservaciones, btFinalizarVisita, fraMotivoDeIngreso, btnAceptar], ALocked);
  fraTemasVisita.Locked := ALocked;
end;

procedure TfrmGestionDeVisitas.btAceptarNoAsignadaClick(Sender: TObject);
begin
  Verificar(fraMotivoNoRealizada.isEmpty, fraMotivoNoRealizada, 'Debe seleccionar un motivo.');
  fpNoRealizada.ModalResult := mrOk;
end;

procedure TfrmGestionDeVisitas.btFinalizarVisitaClick(Sender: TObject);
begin
  if MsgBox('¿Desea finalizar esta visita?', MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    FFinalizarVisita := True;
    try
      btnAceptarClick(Sender);
    finally
      FFinalizarVisita := False;
    end;
  end;
end;

procedure TfrmGestionDeVisitas.cblVI_ESTADOClick(Sender: TObject);
begin
  case cblVI_ESTADO.ItemIndex of
    0: PanelMouseDown(TPanel(pnlP), 0);
    1: PanelMouseDown(TPanel(pnlA), 1);
    2: PanelMouseDown(TPanel(pnlR), 2);
    3: PanelMouseDown(TPanel(pnlN), 3);
  end;
end;

procedure TfrmGestionDeVisitas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Grid.ColumnByField['ESTADO_VENCIMIENTO'].Width := 61;
  Grid.ColumnByField['VI_FECHAVENCIMIENTO'].Width := 60;
  Grid.ColumnByField['VI_FECHAMODIF'].Width := 65;
end;

procedure TfrmGestionDeVisitas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  tbEliminar.Enabled := AreIn(sdqConsulta.FieldByName('VI_ESTADO').AsString, ['P', 'A']);
  tbReporte.Enabled := sdqConsulta.Active and (sdqConsulta.FieldByName('VI_ID').AsInteger > 0);
end;

procedure TfrmGestionDeVisitas.ClearControls;
begin
  ClearComponentData(fpAbm);
  BloquearVisita(False);
  fraTemasVisita.Destruir;
  VCLExtra.LockControls([fraVisita], False);
  pnlEmpresa.Visible := False;
  pnlEntidadVendedor.Visible := False;
  pnlMotivoIngreso.Visible := False;
  fraResponsable.Codigo := Sesion.UserID;
  fraUsuarioVisita.Codigo := Sesion.UserID;
  fraTituloABM.AdvToolBarPager.Caption.Caption := 'Nueva visita';
end;

procedure TfrmGestionDeVisitas.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
  tbAsignar.Enabled := False;
  fraVI_IDMOTIVONOREALIZADA.Propiedades.ExtraCondition := '';
  edVI_FECHAALTADesde.Date := Now - 365;
  edVI_FECHAALTAHasta.Date := Now;
  rgVI_FECHAINICIOVISITA.ItemIndex := 0;
  fraEntidadVendedorAGENDABuscar.Clear;
  rgVencimientoBuscar.ItemIndex := 0;
  ClearPanelesEstado;
end;

function TfrmGestionDeVisitas.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('VI_ID', sdqConsulta.FieldByName('VI_ID').AsInteger);
     Sql.Fields.Add('VI_FECHABAJA', exDate);
     Sql.Fields.Add('VI_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('VI_ID', GetSecNextVal('COMERCIAL.SEQ_CVI_ID'));
      Sql.Fields.Add('VI_FECHAALTA', exDate);
      Sql.Fields.Add('VI_USUALTA', Sesion.UserID);
      Sql.Fields.AddString('VI_ESTADO', iif(FFinalizarVisita, 'R', iif(Trunc(edFechaVisita.Date) = 0, 'P', 'A')));
      Sql.Fields.AddDateTime('VI_FECHAVENCIMIENTO', CalcDiasHabiles(DBDate, 22), True);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('VI_ID', sdqConsulta.FieldByName('VI_ID').AsInteger);
      Sql.Fields.Add('VI_FECHAMODIF', exDate);
      Sql.Fields.Add('VI_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('VI_FECHABAJA', exNull);
      Sql.Fields.Add('VI_USUBAJA', exNull);
      Sql.Fields.AddString('VI_ESTADO', iif(FFinalizarVisita, 'R', iif(edFechaVisita.IsEmpty, 'P', sdqConsulta.FieldByName('VI_ESTADO').AsString)));
      Sql.SqlType := stUpdate;
    end;
    Sql.Fields.Add('VI_IDVISITA', fraVisita.Codigo);
    Sql.Fields.Add('VI_RESPONSABLE', fraResponsable.Codigo);
    Sql.Fields.AddInteger('VI_CONTRATO', fraEmpresaVisita.Contrato, True);
    Sql.Fields.Add('VI_IDESTABLECIMIENTO', fraEstablecimientoVisita.IdEstablecimiento, True);
    Sql.Fields.AddInteger('VI_IDCONTACTO', fraContactoVisita.ContactoId, True);
    Sql.Fields.AddInteger('VI_IDENTIDAD', fraEntidadVendedorVisita.IdEntidad, True);
    Sql.Fields.AddInteger('VI_IDVENDEDOR', fraEntidadVendedorVisita.IdVendedor, True);
    Sql.Fields.AddDateTime('VI_FECHAINICIOVISITA', Trunc(edFechaVisita.Date) + GetDecimales(edHoraVisitaInicio.DateTime), True);
    Sql.Fields.AddDateTime('VI_FECHAFINVISITA', Trunc(edFechaVisita.Date) + GetDecimales(edHoraVisitaFin.DateTime), True);
    Sql.Fields.Add('VI_USUARIOVISITA', fraUsuarioVisita.Codigo);
    Sql.Fields.Add('VI_OBSERVACIONES', mObservaciones.Lines.Text);
    Sql.Fields.Add('VI_IDMOTIVOINGRESO', fraMotivoDeIngreso.Value, True);
  end;

  BeginTrans(True);
  try
    Result := inherited DoABM;
    if ModoABM <> maBaja then
    begin
      fraTemasVisita.GuardarTemas(Sql.PrimaryKey.FieldByName['VI_ID'].Value, ModoABM);
      EjecutarStoreSTEx('visita.gestionar_detalle_visita(:id);', [Sql.PrimaryKey.FieldByName['VI_ID'].Value]);
    end;
    CommitTrans(True);

    if FFinalizarVisita then
      TqrVisita.GenerarPDF(Sql.PrimaryKey.FieldByName['VI_ID'].Value);
  except
    on E: Exception do
    begin
      Result := False;
      RollBack(True);
      ErrorMsg(E);
    end;
  end;
end;

procedure TfrmGestionDeVisitas.DomicilioChange(Sender: TObject);
begin
  if not ((fraGIS_MapaVisita.GISInfo.Origin.Point.Latitude = fraDomicilioGISVisita.Address.Point.Latitude)
  and     (fraGIS_MapaVisita.GISInfo.Origin.Point.Longitude = fraDomicilioGISVisita.Address.Point.Longitude)) then
    fraGIS_MapaVisita.ShowAddress(fraDomicilioGISVisita.Address);
end;

procedure TfrmGestionDeVisitas.edEstadoChange(Sender: TObject);
begin
  if (ModoABM = maModificacion) and (not sdqConsulta.IsEmpty) then
    edEstado.Color := TPanel(FindComponent('pnl' + sdqConsulta.FieldByName('VI_ESTADO').AsString)).Color
  else
    VCLExtra.LockControls([edEstado], True);
end;

procedure TfrmGestionDeVisitas.edFechaVisitaExit(Sender: TObject);
begin
  CargarFotoMobile;
end;

procedure TfrmGestionDeVisitas.edVI_IDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr( VK_RETURN )  then
    tbRefrescarClick(nil);
end;

procedure TfrmGestionDeVisitas.FormCreate(Sender: TObject);
  procedure SetearFrame(AFrame: TFrame; AParent: TPanel);
  begin
    AFrame.Parent := AParent;
    AFrame.Align := alTop;
    AFrame.Top := 0;
    AParent.AutoSize := False;
    AParent.AutoSize := True;
  end;
var
  fMaxl, fMaxt, fMaxw, fMaxh: Integer;
begin
  inherited;
  HideTitlebar;
  GetDesktopDimentions(fMaxl, fMaxt, fMaxw, fMaxh);
  with fpABM do
  begin
    Left   := fMaxl + 10;
    Top    := fMaxt + 10;
    Height := fMaxh - 20;
    Width  := fMaxw - 20;
  end;

  fraEmpresaVisita := TfraEmpresaAGENDA.Create(Self);
  fraEstablecimientoVisita := TfraEstablecimientoAGENDA.Create(Self);
  fraContactoVisita := TfraContactoAGENDA.Create(Self);
  fraEntidadVendedorVisita := TfraEntidadVendedorAGENDA.Create(Self);

  SetearFrame(fraEntidadVendedorVisita, pnlEntidadVendedor);
  SetearFrame(fraContactoVisita, pnlEmpresa);
  SetearFrame(fraEstablecimientoVisita, pnlEmpresa);
  SetearFrame(fraEmpresaVisita, pnlEmpresa);

  SQL.TableName := 'COMERCIAL.CVI_VISITAINSTANCIA';
  FieldBaja := 'VI_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  FSQLSinAsignar := sdqSinAsignar.SQL.Text;
  FSQLAsignarVisitas := sdqAsignarVisitas.SQL.Text;
  FSQLUpdateVisita := sdqUpdateVisita.Sql.Text;
  AutoColWidths := True;
  with fraEmpresaVisita do
  begin
    FrameContacto := fraContactoVisita;
    ShowBajas := True;
  end;
  fraVI_CONTRATO.ShowBajas := True;
  fraContactoVisita.fraTelefonos.Initialize(True, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');
  VCLExtra.LockControls([fraContactoVisita, edEstado, fraDomicilioGISVisita], True);
  fraContactoVisita.TabStop := True;
  tbNorealizada.Left := tbPropiedades.Left + 1;
  tbReporte.Left := tbPropiedades.Left + 1;
  tbAsignar.Left := tbPropiedades.Left + 1;
  tbAsignar.Enabled := False;
  fraEstablecimientoVisita.fraEmpresa := fraEmpresaVisita;
  fraEmpresaVisita.OnChange := EmpresaChange;
  fraEstablecimientoVisita.OnChange := EstablecimientoChange;
  fraDomicilioGISVisita.OnChange := DomicilioChange;
  FHoy := DBDate;
  ArmarMenuAgendarVisita;
  ClearData;
  ShowActived := False;
  fraMotivoDeIngreso.Propiedades.Sql := sdqMotivoDeIngreso.SQL.Text;
  if not Sesion.TieneGenteACargo then
    fraVI_RESPONSABLE.Codigo := Sesion.UserID;
end;

procedure TfrmGestionDeVisitas.fpAbmShow(Sender: TObject);
begin
  fraEmpresaVisita.MostrarMensajeInformacion := not fraEmpresaVisita.Locked;
  inherited;
  pgVisita.ActivePage := tsVisita;
  fraTituloABM.AdvToolBarPager.ActivePageIndex := 0;
  fraVisita.edCodigo.SetFocus;
  if not Assigned(fraGIS_MapaVisita) then
    TiempoMapa.Enabled := True;
end;

procedure TfrmGestionDeVisitas.fraVI_IDVISITAPropiedadesChange(Sender: TObject);
begin
  if fraVI_IDVISITA.Value > 0 then
    fraVI_IDMOTIVONOREALIZADA.Propiedades.ExtraCondition := 'and EM_IDVISITA = ' + SqlValue(fraVI_IDVISITA.Value);
end;

procedure TfrmGestionDeVisitas.FSFormActivate(Sender: TObject);
begin
  inherited;
  FHoy := DBDate;
end;

procedure TfrmGestionDeVisitas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FullName, ['VE_DESCRIPCION']) then
  try
    if Field.DataSet.Active and not Field.DataSet.IsEmpty then
      Background := TPanel(FindComponent('pnl' + Field.DataSet.FieldByName('VI_ESTADO').AsString)).Color;
  except
  end;

  if AreIn(Field.FullName, ['ESTADO_VENCIMIENTO']) then
  try
    if Field.DataSet.Active and not Field.DataSet.IsEmpty then
      Background := TPanel(FindComponent('pnl' + Field.DataSet.FieldByName('ID_ESTADO_VENCIMIENTO').AsString)).Color;
  except
  end;
end;

procedure TfrmGestionDeVisitas.GridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if sdqConsulta.Active then
    pmAgendarVisita.Autopopup := (sdqConsulta.RecordCount > 0) and AreIn(sdqConsulta.FieldByName('VI_ESTADO').AsString, ['P', 'A']);
end;

procedure TfrmGestionDeVisitas.JvAppEventsIdle(Sender: TObject; var Done: Boolean);
begin
  inherited;
  if not Assigned(fraGIS_MapaVisita) then
    TiempoMapaTimer(nil);
end;

procedure TfrmGestionDeVisitas.pnlReferenciasEstadoVtoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ClearPanelesEstado;
  tbRefrescar.Click;
end;

procedure TfrmGestionDeVisitas.fraTituloABMAdvToolBarPagerChange(Sender: TObject);
begin
  inherited;
  pgVisita.ActivePageIndex := fraTituloABM.AdvToolBarPager.ActivePageIndex;
  EmpresaChange(nil);
  EstablecimientoChange(nil);
end;

procedure TfrmGestionDeVisitas.fraUsuarioVisitaPropiedadesChange(Sender: TObject);
begin
  CargarFotoMobile;
end;

procedure TfrmGestionDeVisitas.fraVisitaPropiedadesChange(Sender: TObject);
var
  iDestinatario: Integer;
begin
  if fraVisita.IsSelected then
  begin
    fraTemasVisita.Instanciar(fraVisita.Value);
    fraContactoVisita.Clear;
    fraEstablecimientoVisita.Clear;
    fraEmpresaVisita.Clear;
    fraEntidadVendedorVisita.Clear;
    iDestinatario := fraVisita.sdqDatos.FieldByName('VS_DESTINATARIO').AsInteger;
    pnlEmpresa.Visible := iDestinatario = 0;
    pnlEntidadVendedor.Visible := iDestinatario = 1;
    pnlFechaVisita.Top := 1000;
    pnlUsuarioVisita.Top := 1001;
    fraMotivoDeIngreso.Propiedades.Sql := sdqMotivoDeIngreso.SQL.Text + ' AND idtipoevento = ' + SqlInteger(fraVisita.sdqDatos.FieldByName('VS_IDTIPOEVENTO').AsInteger , True);
    pnlMotivoIngreso.Visible := (not fraVisita.sdqDatos.FieldByName('VS_IDTIPOEVENTO').IsNull) and fraMotivoDeIngreso.TieneDatosSeleccionables;
  end;
end;

procedure TfrmGestionDeVisitas.LoadControls;
begin
  fraEmpresaVisita.Clear;
  fraEstablecimientoVisita.Clear;
  fraDomicilioGISVisita.Clear;

  if Assigned(fraGIS_MapaVisita) then
    fraGIS_MapaVisita.Clear;

  fraVisita.Value := sdqConsulta.FieldByName('VI_IDVISITA').AsInteger;
  fraVisitaPropiedadesChange(nil);

  edEstado.Text                  := sdqConsulta.FieldByName('VE_DESCRIPCION').AsString;
  fraResponsable.Codigo          := sdqConsulta.FieldByName('SE_USUARIO').AsString;
  edFechaVisita.Date             := sdqConsulta.FieldByName('VI_FECHAINICIOVISITA').AsDateTime;
  edHoraVisitaInicio.Time        := sdqConsulta.FieldByName('VI_FECHAINICIOVISITA').AsDateTime;
  edHoraVisitaFin.Time           := sdqConsulta.FieldByName('VI_FECHAFINVISITA').AsDateTime;
  fraUsuarioVisita.Codigo        := sdqConsulta.FieldByName('VI_USUARIOVISITA').AsString;
  mObservaciones.Lines.Text      := sdqConsulta.FieldByName('VI_OBSERVACIONES').AsString;

  fraEmpresaVisita.Contrato           := sdqConsulta.FieldByName('VI_CONTRATO').AsInteger;
  TiempoContacto.Enabled              := True;
  fraEstablecimientoVisita.Value      := sdqConsulta.FieldByName('VI_IDESTABLECIMIENTO').AsInteger;
  fraContactoVisita.ContactoId        := sdqConsulta.FieldByName('VI_IDCONTACTO').AsInteger;
  fraEntidadVendedorVisita.IdEntidad  := sdqConsulta.FieldByName('VI_IDENTIDAD').AsInteger;
  fraEntidadVendedorVisita.IdVendedor := sdqConsulta.FieldByName('VI_IDVENDEDOR').AsInteger;

  BloquearVisita((sdqConsulta.FieldByName('VI_ESTADO').AsString = 'R') or (sdqConsulta.FieldByName('VI_ESTADO').AsString = 'N'));
  fraTemasVisita.CargarTemas(sdqConsulta.FieldByName('VI_ID').AsInteger);
  TiempoCarga.Enabled := True;
  VCLExtra.LockControls([fraVisita], True);
  fraTituloABM.AdvToolBarPager.Caption.Caption := 'Visita N° ' + sdqConsulta.FieldByName('VI_ID').AsString;
  CargarFotoMobile;
end;

procedure TfrmGestionDeVisitas.CargarFotoMobile;
begin
  OpenQueryEx(sdqFotoMobile, [fraUsuarioVisita.Codigo, TDateTimeEx.Create(edFechaVisita.Date)]);
  pnlFoto.Visible := not sdqFotoMobile.IsEmpty;
//  dbiFoto.rotate
end;

procedure TfrmGestionDeVisitas.AfterConstruction;
begin
  inherited;
  PanelMouseDown(TPanel(pnlP), 0, False);
  PanelMouseDown(TPanel(pnlA), 1);
end;

procedure TfrmGestionDeVisitas.AgendarVisita(AFecha: TDateTime; AEstado: String);
begin
  EjecutarSqlEx(FSQLUpdateVisita, [TDateTimeEx.Create(AFecha), AEstado, sdqConsulta.FieldByName('VI_ID').AsInteger]);

  if (AFecha > 0) {and (Sesion.Sector = 'COMPUTOS')} then
  with sdqConsulta do
  try
    CreateNewAppointment('Visita N°' + FieldByName('VI_ID').AsString + ' ' + FieldByName('EM_NOMBRE').AsString,
                         'Empresa: ' + FieldByName('EM_NOMBRE').AsString + CRLF +
                         'Contrato: ' + FieldByName('VI_CONTRATO').AsString + CRLF +
                         'CUIT: ' + FieldByName('EM_CUIT').AsString + CRLF +
                         'Contacto: ' + FieldByName('CT_CONTACTO').AsString,
                         FieldByName('DOMICILIO').AsString,
                         AFecha + 10 * 1/24,
                         1/24);
  except
    InfoHint(nil, 'Ocurrió un problema al intentar agendar esta visita en su Calendario del Outlook. Esta funcionalidad aún es experimental.')
  end;

  sdqConsulta.Refresh;
end;

procedure TfrmGestionDeVisitas.mnuAgendarVisitaClick(Sender: TObject);
var
  menuItem: TMenuItem;
begin
  if Sender is TMenuItem then
  begin
    menuItem := TMenuItem(Sender);
    AgendarVisita(StrToDate(menuItem.Hint), 'A');
  end;
end;

procedure TfrmGestionDeVisitas.mnuCancelarVisitaClick(Sender: TObject);
begin
  if ExisteRelacion(sdqConsulta.FieldByName('VI_RESPONSABLE').AsString) then
    AgendarVisita(0, 'P')
  else
    MessageDlg('No tiene permiso para cancelar el día de esta visita.', mtWarning, [mbOK], 0);
end;

procedure TfrmGestionDeVisitas.PanelVencidasMouseDown(APanel: TPanel; AIndex: Integer);
begin
  APanel.Tag := 1 - APanel.Tag;
  APanel.BevelOuter := iif(APanel.Tag = 1, bvLowered, bvNone);
  APanel.BorderStyle := iif(APanel.Tag = 1, bsSingle, bsNone);

  if APanel.Tag = 1 then
    APanel.Font.Style := [fsBold]
  else
    APanel.Font.Style := [];

  if ((pnl1.Tag = 0) and (pnl2.Tag = 1)) or ((pnl1.Tag = 1) and (pnl2.Tag = 0))  then
    rgVencimientoBuscar.ItemIndex := 2 - pnl1.Tag
  else
    rgVencimientoBuscar.ItemIndex := 0;

  tbRefrescar.Click;
end;

procedure TfrmGestionDeVisitas.pmAgendarVisitaPopup(Sender: TObject);
begin
  mnuCancelarVisita.Visible := sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not sdqConsultaVI_FECHAINICIOVISITA.IsNull);
end;

procedure TfrmGestionDeVisitas.pnl1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelVencidasMouseDown(TPanel(Sender), 1);
end;

procedure TfrmGestionDeVisitas.pnl2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelVencidasMouseDown(TPanel(Sender), 2);
end;

procedure TfrmGestionDeVisitas.PanelMouseDown(APanel: TPanel; AIndex: Integer; ARefresh: Boolean = True);
begin
  APanel.Tag := 1 - APanel.Tag;
  APanel.BevelOuter := iif(APanel.Tag = 1, bvLowered, bvNone);
  APanel.BorderStyle := iif(APanel.Tag = 1, bsSingle, bsNone);

  if APanel.Tag = 1 then
    APanel.Font.Style := [fsBold]
  else
    APanel.Font.Style := [];

  cblVI_ESTADO.Checked[AIndex] := APanel.Tag = 1;

  if ARefresh then
    RefreshData;
end;

procedure TfrmGestionDeVisitas.pnlPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 0);
end;

procedure TfrmGestionDeVisitas.pnlAMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 1);
end;

procedure TfrmGestionDeVisitas.pnlRMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 2);
end;

procedure TfrmGestionDeVisitas.pnlNMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(TPanel(Sender), 3);
end;

procedure ClearPanelEstado(APanel: TJvPanel);
begin
  with APanel do
  begin
    BorderStyle := Vcl.Forms.bsNone;
    BevelOuter := bvNone;
    Font.Color := clWindowText;
    Tag := 0;
  end;
end;

procedure TfrmGestionDeVisitas.ClearPanelesEstado;
begin
  ClearPanelEstado(pnlP);
  ClearPanelEstado(pnlA);
  ClearPanelEstado(pnlR);
  ClearPanelEstado(pnlN);
  ClearPanelEstado(pnl1);
  ClearPanelEstado(pnl2);
  cblVI_ESTADO.ClearChecks;
  rgVencimientoBuscar.ItemIndex := 0;
end;

procedure TfrmGestionDeVisitas.pnlReferenciasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ClearPanelesEstado;
  tbRefrescar.Click;
end;

procedure TfrmGestionDeVisitas.RefreshData;
var
  sFiltros: String;
begin
  sFiltros := FSQL;
  case rgVI_FECHAINICIOVISITA.ItemIndex of
    1: AddCondition(sFiltros, ' vi_fechainiciovisita < TRUNC(SYSDATE) - 28 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) ');
    2: AddCondition(sFiltros, ' TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(SYSDATE) - 27 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) AND  TRUNC(SYSDATE) - 21 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) ');
    3: AddCondition(sFiltros, ' TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(SYSDATE) - 20 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) AND  TRUNC(SYSDATE) - 14 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) ');
    4: AddCondition(sFiltros, ' TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(SYSDATE) - 13 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) AND  TRUNC(SYSDATE) - 07 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) ');
    5: AddCondition(sFiltros, ' TO_CHAR(SYSDATE-7, ''IW'') = TO_CHAR(vi_fechainiciovisita, ''IW'') ');
    6: AddCondition(sFiltros, ' TO_CHAR(SYSDATE, ''IW'') = TO_CHAR(vi_fechainiciovisita, ''IW'') ');
    7: AddCondition(sFiltros, ' TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(SYSDATE) + 08 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) AND  TRUNC(SYSDATE) + 14 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) ');
    8: AddCondition(sFiltros, ' TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(SYSDATE) + 15 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) AND  TRUNC(SYSDATE) + 21 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) ');
    9: AddCondition(sFiltros, ' TRUNC(vi_fechainiciovisita) > TRUNC(SYSDATE) + 22 - TO_NUMBER(TO_CHAR(SYSDATE, ''d'')) ');
    10: AddCondition(sFiltros, ' vi_fechainiciovisita is null ');
  end;

  if rgVencimientoBuscar.ItemIndex > 0 then
    AddCondition(sFiltros, ' ID_ESTADO_VENCIMIENTO = ' + SqlValue(rgVencimientoBuscar.ItemIndex));

  if fraEntidadVendedorAGENDABuscar.IdEntidad > 0 then
    AddCondition(sFiltros, ' VI_IDENTIDAD = ' + SqlValue(fraEntidadVendedorAGENDABuscar.IdEntidad));

  if fraEntidadVendedorAGENDABuscar.IdVendedor > 0 then
    AddCondition(sFiltros, ' VI_IDVENDEDOR = ' + SqlValue(fraEntidadVendedorAGENDABuscar.IdVendedor));

  sdqConsulta.SQL.Text := sFiltros + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmGestionDeVisitas.EmpresaChange(Sender: TObject);
begin
  if Assigned(fraEmpresaVisita) then
  begin
    if fraEmpresaVisita.IsEmpty then
    begin
      fraDomicilioGISVisita.Clear;
      if Assigned(fraGIS_MapaVisita) then
        fraGIS_MapaVisita.Clear;
    end else
    if Assigned(Sender) then
    begin
      OpenQueryEx(sdqHolding, [fraEmpresaVisita.Contrato, fraEmpresaVisita.Contrato]);
      MostrarAlarma('Atención', sdqHolding.FieldByName('TEXTO').AsString);
    end;

    if fraEmpresaVisita.Contrato <> fraEstablecimientoVisita.Contrato then
      fraEstablecimientoVisita.Clear;

    if (pgVisita.ActivePage = tsMapa) and fraEmpresaVisita.IsSelected and fraDomicilioGISVisita.IsEmpty and fraEstablecimientoVisita.IsEmpty then
      fraDomicilioGISVisita.CUIT := fraEmpresaVisita.CUIT;
  end;
end;

procedure TfrmGestionDeVisitas.EstablecimientoChange(Sender: TObject);
begin
  if Assigned(fraEstablecimientoVisita) then
  begin
    if (pgVisita.ActivePage = tsMapa) and fraEstablecimientoVisita.IsSelected then
      fraDomicilioGISVisita.IdEstablecimiento := fraEstablecimientoVisita.IdEstablecimiento;
  end;
end;

function TfrmGestionDeVisitas.ExisteRelacion(AUsuario: String): Boolean;
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

function TfrmGestionDeVisitas.Validar: Boolean;
begin
  Verificar(fraVisita.IsEmpty, fraVisita.edCodigo, 'Debe seleccionar una visita.');
  Verificar((fraResponsable.IsEmpty) or (not fraResponsable.Locked) and (fraResponsable.IsBaja), fraResponsable.edCodigo, 'Debe seleccionar un responsable activo.');
  Verificar(not (fraResponsable.IsEmpty or ExisteRelacion(fraResponsable.Codigo)), fraResponsable.edCodigo, 'No puede asignar a este usuario.');

  Verificar(fraEmpresaVisita.IsEmpty and (fraVisita.sdqDatos.FieldByName('VS_DESTINATARIO').AsInteger = 0), fraEmpresaVisita.edContrato, 'Debe seleccionar una empresa.');
  Verificar(GetDecimales(edHoraVisitaFin.Time) < GetDecimales(edHoraVisitaInicio.Time), edHoraVisitaFin, 'La hora de finalización debe ser mayor que la hora de inicio.');

  if FFinalizarVisita then
  begin
    Verificar(fraEstablecimientoVisita.IsEmpty and (fraVisita.sdqDatos.FieldByName('VS_DESTINATARIO').AsInteger = 0), fraEstablecimientoVisita.edCodigo, 'Debe seleccionar un establecimiento.');
    Verificar(fraContactoVisita.IsEmpty and (fraVisita.sdqDatos.FieldByName('VS_DESTINATARIO').AsInteger = 0), fraContactoVisita.tbContacto, 'Debe seleccionar un contacto.');
    Verificar((fraEntidadVendedorVisita.IdEntidad <= 0)  and (fraVisita.sdqDatos.FieldByName('VS_DESTINATARIO').AsInteger = 1), fraEstablecimientoVisita.edCodigo, 'Debe seleccionar una entidad.');
    Verificar((fraEntidadVendedorVisita.IdVendedor <= 0) and (fraVisita.sdqDatos.FieldByName('VS_DESTINATARIO').AsInteger = 1), fraEstablecimientoVisita.edCodigo, 'Debe seleccionar un vendedor.');
    Verificar(edFechaVisita.IsEmpty, edFechaVisita, 'Debe ingresar la fecha que se realizó la visita.');
    Verificar(edFechaVisita.Date > FHoy, edFechaVisita, 'La fecha de la visita no puede ser mayor a hoy si desea indicar que ya fue realizada.');
    Verificar(GetDecimales(edHoraVisitaInicio.Time) = 0, edHoraVisitaInicio, 'Debe ingresar la hora de inicio de la visita.');
    Verificar(GetDecimales(edHoraVisitaFin.Time) = 0, edHoraVisitaFin, 'Debe ingresar la hora de finalización de la visita.');
    Verificar(fraUsuarioVisita.IsEmpty, fraUsuarioVisita.edCodigo, 'Debe seleccionar el usuario que realizó la visita.');

    try
      Result := fraTemasVisita.ValidarTemas;
    finally

    end;
  end
  else
    Result := True;

  Result := Result or fraTemasVisita.ValidarTemas;
end;

procedure TfrmGestionDeVisitas.ArmarMenuAgendarVisita;
var
  miMenuItem, miAgendarPara, miSubMenu: TMenuItem;
  iSemana, i: Integer;
begin
  pmAgendarVisita.Items.Clear;
  miAgendarPara := TMenuItem.Create(pmAgendarVisita);
  miAgendarPara.Caption := 'Agendar visita para el día...';
  pmAgendarVisita.Items.Add(miAgendarPara);

  miMenuItem := TMenuItem.Create(pmAgendarVisita);
  miMenuItem.Caption := '-';
  pmAgendarVisita.Items.Add(miMenuItem);

  miMenuItem := TMenuItem.Create(pmAgendarVisita);
  miMenuItem.Name := 'mnuCancelarVisita';
  miMenuItem.Caption := 'Cancelar día de visita';
  miMenuItem.OnClick := mnuCancelarVisitaClick;
  mnuCancelarVisita := miMenuItem;
  pmAgendarVisita.Items.Add(miMenuItem);

  OpenQuery(sdqDiasMenuVisita);
  iSemana := sdqDiasMenuVisita.FieldByName('SEMANA').AsInteger;
  miSubMenu := miAgendarPara;
  i := 1;
  while not sdqDiasMenuVisita.Eof do
  begin
    if iSemana <> sdqDiasMenuVisita.FieldByName('SEMANA').AsInteger then
    begin
      if i = 1 then
      begin
        miMenuItem := TMenuItem.Create(miAgendarPara);
        miMenuItem.Caption := '-';
        miAgendarPara.Add(miMenuItem);
      end;

      miSubMenu := TMenuItem.Create(pmAgendarVisita);
      miSubMenu.Caption := iif(i = 1, 'La semana que viene...', 'Dentro de ' + IntToStr(i) + ' semanas...');
      inc(i);
      miAgendarPara.Add(miSubMenu);
    end;

    miMenuItem := TMenuItem.Create(miSubMenu);
    miMenuItem.Caption := sdqDiasMenuVisita.FieldByName('DIA_POWER').AsString + '  ' + sdqDiasMenuVisita.FieldByName('FECHA').AsString;
    miMenuItem.Hint := sdqDiasMenuVisita.FieldByName('FECHA').AsString;
    miMenuItem.OnClick := mnuAgendarVisitaClick;
    miSubMenu.Add(miMenuItem);
    iSemana := sdqDiasMenuVisita.FieldByName('SEMANA').AsInteger;

    sdqDiasMenuVisita.Next;
  end;
end;

procedure TfrmGestionDeVisitas.AsignarVisita(AIdVisita: Integer; AUsuario: String);
begin
//  EjecutarSqlEx('UPDATE comercial.cvi_visitainstancia ' +
//                   'SET VI_RESPONSABLE = :idusuario, ' +
//                       'VI_ESTADO = ''A'', ' +
//                       'VI_FECHAMODIF = SYSDATE, ' +
//                       'VI_USUMODIF = :usuario ' +
//                 'WHERE VI_ID = :idvisita '
//                 , [AUsuario, Sesion.UserID, AIdVisita]);
end;

procedure TfrmGestionDeVisitas.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

procedure TfrmGestionDeVisitas.tbNoRealizadaClick(Sender: TObject);
begin
  fraMotivoNoRealizada.Clear;
  fraMotivoNoRealizada.Propiedades.ExtraCondition := ' AND VM_IDVISITA = ' + SqlValue(sdqConsulta.FieldByName('VI_IDVISITA').AsInteger);
  fraMotivoNoRealizada.Value := sdqConsulta.FieldByname('VI_IDMOTIVONOREALIZADA').AsInteger;
  if fpNoRealizada.ShowModal = mrOk then
  begin
    EjecutarSqlEx('UPDATE COMERCIAL.CVI_VISITAINSTANCIA SET VI_IDMOTIVONOREALIZADA = :idmotivo, VI_FECHAMODIF = SYSDATE, VI_ESTADO = :estado WHERE VI_ID = :idinstancia ', [fraMotivoNoRealizada.Value, 'N', sdqConsulta.FieldByName('VI_ID').AsInteger]);
    RefreshData;
  end;
end;

procedure TfrmGestionDeVisitas.tbReporteClick(Sender: TObject);
begin
  Application.CreateForm(TqrVisita, qrVisita);
  try
    qrVisita.IdVisitaInstancia := sdqConsulta.FieldByName('VI_ID').AsInteger;
  finally
    FreeAndNil(qrVisita);
  end;
end;

procedure TfrmGestionDeVisitas.TiempoCargaTimer(Sender: TObject);
begin
  TiempoCarga.Enabled := False;
  EmpresaChange(fraEmpresaVisita);
end;

procedure TfrmGestionDeVisitas.TiempoContactoTimer(Sender: TObject);
begin
  TiempoContacto.Enabled := False;
  fraEmpresaVisita.Change;
  fraContactoVisita.ContactoId := sdqConsulta.FieldByName('VI_IDCONTACTO').AsInteger;
end;

procedure TfrmGestionDeVisitas.TiempoMapaTimer(Sender: TObject);
begin
  TiempoMapa.Enabled := False;
  if not Assigned(fraGIS_MapaVisita) then
  begin
    fraGIS_MapaVisita := TfraGIS_APIv3.CreateWithoutNavigation(Self);
    fraGIS_MapaVisita.Parent := tsMapa;
    fraGIS_MapaVisita.Align := alClient;
  end;
end;

procedure TfrmGestionDeVisitas.tsVisitaResize(Sender: TObject);
begin
  inherited;
  pnlVisitaDetalle.Width := Round((tsVisita.Width) / 2);
end;

end.
