unit unConsultaJuiciosEnTramite;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales,
  unFraCtbTablas, FieldHider, Mask, ToolEdit, DateComboBox, IntEdit, unFraEmpresa, CurrEdit, unArtDbFrame, PatternEdit,
  unArtDBAwareFrame, CardinalEdit, SinEdit, CheckPanel, unfraPrestadorAMP, unDmPrincipal, unConstLegales, unArt,
  Buttons,  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraTrabajador,
  JvMemoryDataset, unfraCPR_PRESTADOR;

type
  TfrmConsultaJuiciosEnTramite = class(TfrmCustomConsulta)
    tbSeparador: TToolButton;
    pcFiltrosBusqueda: TPageControl;
    tsGeneral: TTabSheet;
    gbJuicio: TGroupBox;
    lbNroJuicio: TLabel;
    lblTipoJuicio: TLabel;
    lblCaratula: TLabel;
    lblEstado: TLabel;
    edNroCarpeta: TIntEdit;
    edCARATULA: TEdit;
    fraEstado: TfraCodigoDescripcion;
    tsLetrados: TTabSheet;
    gbLetrados: TGroupBox;
    lblAbogado: TLabel;
    lblAbogadoOponente: TLabel;
    fraAbogadosPropios: TfraAbogadosLegales;
    fraAbogadosParteActora: TfraAbogadosLegales;
    tsJuzgados: TTabSheet;
    gbJuzgado: TGroupBox;
    lbFuero: TLabel;
    lbJurisdiccion: TLabel;
    lbJuzgado: TLabel;
    lbSecretaria: TLabel;
    lblExpediente: TLabel;
    fraFuero: TfraCodigoDescripcion;
    fraJurisdiccion: TfraCodigoDescripcion;
    fraJuzgado: TfraCodigoDescripcion;
    fraSecretaria: TfraCodigoDescripcion;
    tsFechas: TTabSheet;
    gbFechas: TGroupBox;
    lblFechaInicioHasta: TLabel;
    lblFechaInicioDesde: TLabel;
    lblFechaCierreDesde: TLabel;
    LblFechaCierrehasta: TLabel;
    lblFechaAsignacionDesde: TLabel;
    lblFechaAsignacionHasta: TLabel;
    CmbIniHta: TDateComboBox;
    CmbIniDde: TDateComboBox;
    CmbCierrehta: TDateComboBox;
    CmbCierredde: TDateComboBox;
    edFechaAsignDesde: TDateComboBox;
    edFechaAsignHasta: TDateComboBox;
    chkSinAbogadoDesignado: TCheckBox;
    chkFechadeCierre: TCheckBox;
    gbAgenda: TGroupBox;
    lblCitasDesde: TLabel;
    lblCitasHasta: TLabel;
    dcbFechaCitaDesde: TDateComboBox;
    dcbFechaCitaHasta: TDateComboBox;
    tsImportes: TTabSheet;
    gbImporte: TGroupBox;
    lblImporteSentencia: TLabel;
    lblImporteSentenciaHasta: TLabel;
    lblImporteDemandado: TLabel;
    lblImporteDemandadoHasta: TLabel;
    edImpReclaDesde: TCurrencyEdit;
    edImpReclaHasta: TCurrencyEdit;
    edImpDemaDesde: TCurrencyEdit;
    edImpDemaHasta: TCurrencyEdit;
    chkSinImporteSentencia: TCheckBox;
    chkSinImporteDemanda: TCheckBox;
    tsOrigenDemanda: TTabSheet;
    lblVencimientos: TLabel;
    edFechaVencimientoDesde: TDateComboBox;
    lblVencimientosHasta: TLabel;
    edFechaVencimientoHasta: TDateComboBox;
    gbOrigenDemanda: TGroupBox;
    lblReclamante: TLabel;
    lblReclamo: TLabel;
    fraReclamante: TfraCodigoDescripcion;
    fraReclamo: TfraCodigoDescripcion;
    sdqModificacionRegistro: TSDQuery;
    chkJuicios: TCheckBox;
    chkMediaciones: TCheckBox;
    lblTipoMediacion: TLabel;
    fraTipoMediacion: TfraCodigoDescripcion;
    edDemandante: TEdit;
    edDemandado: TEdit;
    lblContra: TLabel;
    tbNuevaMediacion: TToolButton;
    tbSumatoria: TToolButton;
    chkBloqueado: TCheckBox;
    fraTipoJuicio: TfraCodigoDescripcion;
    edSiniestro: TIntEdit;
    lbSiniestro: TLabel;
    sdqConsultaRegistro: TSDQuery;
    tbEvento: TTabSheet;
    fraTipoEvento: TfraCodigoDescripcion;
    lblEvento: TLabel;
    Label1: TLabel;
    edFechaEventodde: TDateComboBox;
    Label2: TLabel;
    edFechaEventohta: TDateComboBox;
    Label3: TLabel;
    edFechaVencEventodde: TDateComboBox;
    Label4: TLabel;
    edFechaVencEventohta: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    edFechaCargaEventodde: TDateComboBox;
    edFechaCargaEventohta: TDateComboBox;
    tbSeleccionar: TToolButton;
    tbSalir2: TToolButton;
    Label7: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    edAnioExpediente: TPatternEdit;
    Label8: TLabel;
    edNroExpediente: TPatternEdit;
    Label9: TLabel;
    edExpedienteExport: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);virtual;abstract;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure QueryPrintGetSubTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure chkFechadeCierreClick(Sender: TObject);
    procedure chkSinAbogadoDesignadoClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSeleccionarClick(Sender: TObject);
  private
    FIdJuicio: TTableId;
    FTotales: Array[0..4] of Extended;
    FVerSeleccionar: Boolean;
    sWhere: String;
  protected
    FNivelUsuario: Integer;
    procedure DoCargaAdministracionJuicio(Sender: TObject); virtual; abstract;
    procedure ChangeReclamante(Sender: TObject); virtual; abstract;
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
  	procedure EnableButtons(AEnabled: Boolean); override;
    procedure CalcularSumatoria;
    procedure SetIdJuicio(const Value: TTableId);
    procedure SetVerSeleccionar(const Value: Boolean);
  public
    FModoConsulta: Boolean;

    property IdJuicio: TTableId      read FIdJuicio       write SetIdJuicio;
    property VerSeleccionar: Boolean read FVerSeleccionar write SetVerSeleccionar;
  end;

implementation

uses
	AnsiSql, unPrincipal, unABMSeguimientoJuicios, unRPTJudicial, General, dbFuncs, unSesion, StrFuncs, unDmLegales,
  UnRptJuicios, Math, CustomDlgs, unLegales;

const
  CamposSumatoria: Array[0..4] of String = ('JT_IMPORTEDEMANDADO', 'JT_IMPORTERESERVA', 'JT_IMPORTESENTENCIA','JT_IMPORTERESERVA', 'JT_IMPORTERESERVAHONORARIOS');   //, 'TOTGS' );

{$R *.DFM}

procedure TfrmConsultaJuiciosEnTramite.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.ShowBajas := True;
  FIdJuicio      := ART_EMPTY_ID;
  VerSeleccionar := False;

  FModoConsulta := False;
  pcFiltrosBusqueda.ActivePageIndex := 0;

  with fraTipoJuicio do
  begin
    TableName   := 'legales.ltj_tipojuicio';
    FieldID     := 'tj_id';
    FieldCodigo := 'tj_id';
    FieldDesc   := 'tj_descripcion';
    FieldBaja   := 'tj_fechabaja';
    Showbajas   := True;
  end;

  with fraReclamante do
  begin
    TableName   := 'legales.lre_reclamante';
    FieldID     := 're_id';
    FieldCodigo := 're_id';
    FieldDesc   := 're_descripcion';
    FieldBaja   := 're_fechabaja';
    Showbajas   := True;

    OnChange    := ChangeReclamante;
  end;

  with fraReclamo do
  begin
    TableName   := 'legales.lrc_reclamo';
    FieldID     := 'rc_id';
    FieldCodigo := 'rc_id';
    FieldDesc   := 'rc_descripcion';
    FieldBaja   := 'rc_fechabaja';
    Showbajas   := True;
  end;

  with fraEstado do
  begin
    TableName   := 'legales.lej_estadojuicio';
    FieldID     := 'ej_id';
    FieldCodigo := 'ej_id';
    FieldDesc   := 'ej_descripcion';
  end;

  with fraFuero do
  begin
    TableName   := 'legales.lfu_fuero';
    FieldID     := 'fu_id';
    FieldCodigo := 'fu_id';
    FieldDesc   := 'fu_descripcion';
    FieldBaja   := 'fu_fechabaja';
    Showbajas   := True;

    ExtraCondition := 'and 1=2';
    OnChange := ChangeFuero;
  end;

  with fraJurisdiccion do
  begin
    TableName   := 'legales.lju_jurisdiccion';
    FieldID     := 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc   := 'ju_descripcion';
    FieldBaja   := 'ju_fechabaja';
    Showbajas   := True;

    OnChange := ChangeJurisdiccion;
  end;

  with fraJuzgado do
  begin
    TableName   := 'legales.ljz_juzgado';
    FieldID     := 'jz_id';
    FieldCodigo := 'jz_id';
    FieldDesc   := 'jz_descripcion';
    ExtraCondition := 'and 1=2';
    FieldBaja   := 'jz_fechabaja';
    Showbajas   := True;

    OnChange := ChangeJuzgado;
  end;

  with fraSecretaria do
  begin
    TableName   := 'legales.lsc_secretaria';
    FieldID     := 'sc_id';
    FieldCodigo := 'sc_id';
    FieldDesc   := 'sc_descripcion';
    ExtraCondition := 'and 1=2';
    FieldBaja   := 'sc_fechabaja';
    Showbajas   := True;
  end;

  with fraTipoMediacion do
  begin
    TableName   := 'legales.ltm_tipomediacion';
    FieldID     := 'tm_id';
    FieldCodigo := 'tm_id';
    FieldDesc   := 'tm_descripcion';
  end;

  fraAbogadosPropios.Parte := paPropia;
  fraAbogadosParteActora.Parte := paContraria;

  tbNuevaMediacion.Left := tbNuevo.Left - 1;

  FNivelUsuario := ValorSql('select NU_IDNIVELSEGURIDAD from LEGALES.LNU_NIVELUSUARIO where NU_USUARIO = ' + SqlValue(Sesion.LoginName), '0');

  if FNivelUsuario = NIVELNORMAL then
  begin
    Grid.ColumnByField['jt_importereserva'].Visible := false;
    Grid.ColumnByField['jt_importereservahonorarios'].Visible := false;
  end;
end;

procedure TfrmConsultaJuiciosEnTramite.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmConsultaJuiciosEnTramite.tbModificarClick(Sender: TObject);
begin
  DoCargaAdministracionJuicio(nil);
end;

procedure TfrmConsultaJuiciosEnTramite.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edNroCarpeta.Clear;
  fraTipoJuicio.Codigo := '';
  edCaratula.Clear;
  edDemandante.Text := '';
  edDemandado.Text := '';
  chkJuicios.Checked := False;
  chkMediaciones.Checked := False;
  chkBloqueado.Checked := False;

  fraEstado.Codigo := '';
  fraTipoMediacion.Codigo := '';

  fraAbogadosPropios.Codigo := '';
  fraAbogadosParteActora.Codigo := '';



  fraFuero.Codigo := '';
  fraJurisdiccion.Codigo := '';
  fraJuzgado.Codigo := '';
  fraSecretaria.Codigo := '';
  edNroExpediente.Text := '';
  edAnioExpediente.Text := '';
  edNroCarpeta.Text := '';


  CmbIniDde.Clear;
  CmbIniHta.Clear;
  CmbCierredde.Clear;
  CmbCierrehta.Clear;
  dcbFechaCitaDesde.Clear;
  dcbFechaCitaHasta.Clear;
  edFechaAsignHasta.Clear;
  chkFechadeCierre.Checked := False;
  chkSinAbogadoDesignado.Checked := False;

  edFechaEventodde.Clear;
  edFechaEventohta.Clear;
  edFechaVencEventodde.Clear;
  edFechaVencEventohta.Clear;
  edFechaCargaEventodde.Clear;
  edFechaCargaEventohta.Clear;

  edImpReclaDesde.Clear;
  edImpReclaHasta.Clear;
  edImpDemaDesde.Clear;
  edImpDemaHasta.Clear;

  chkSinImporteSentencia.Enabled := False;
  chkSinImporteDemanda.Enabled := False;

  fraReclamo.Codigo := '';


  fraReclamante.Codigo := '';

  edSiniestro.Clear;

  fraTipoEvento.Clear;
end;

procedure TfrmConsultaJuiciosEnTramite.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('JT_IMPORTEDEMANDADO') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('JT_IMPORTEDEMANDADO')).Currency := True;

  if sdqConsulta.FieldByName('JT_IMPORTERESERVA') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('JT_IMPORTERESERVA')).Currency := True;

  if sdqConsulta.FieldByName('JT_IMPORTESENTENCIA') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('JT_IMPORTESENTENCIA')).Currency := True;
end;

procedure TfrmConsultaJuiciosEnTramite.QueryPrintGetSubTotals( Sender: TObject; Field: TPrintField; var Value: String);
begin
  inherited;
  if Value <> '' then
    Value := '$ ' + Trim(Format('%10.2f', [StrToCurr(Value)]));
end;

procedure TfrmConsultaJuiciosEnTramite.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
																											 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iCol: Integer;
begin
  if sdqconsulta.FieldByName(Column).Visible then
  begin
    iCol := ArrayPos(Column, CamposSumatoria);
    if iCol > -1 Then
      Value := Format('$ %0.2n', [FTotales[iCol]]);
  end;
end;

procedure TfrmConsultaJuiciosEnTramite.CalcularSumatoria;
begin
  if tbSumatoria.Down and sdqConsulta.Active then
    SumFields(sdqConsulta, CamposSumatoria, FTotales);
  Grid.FooterBand := tbSumatoria.Down;
end;

procedure TfrmConsultaJuiciosEnTramite.tbSumatoriaClick(Sender: TObject);
begin
  CalcularSumatoria;
end;

procedure TfrmConsultaJuiciosEnTramite.ChangeJurisdiccion(Sender: TObject);
begin
	if fraJurisdiccion.IsSelected then
 		with fraFuero do
 		begin
    	fraFuero.Codigo	:= '';
      TableName   	 	:= 'legales.lfu_fuero';
      FieldID     	 	:= 'fu_id';
      FieldCodigo 	 	:= 'fu_id';
      FieldDesc   	 	:= 'fu_descripcion';
      ExtraCondition 	:= ' and fu_id in (select jz_idfuero from LEGALES.LJZ_JUZGADO where jz_idjurisdiccion = ' + SqlValue(strtoint(fraJurisdiccion.Codigo))+ ')';
      OnChange 			 	:= ChangeFuero;
 		end;

	if fraJurisdiccion.IsSelected and fraFuero.IsSelected then
 		with fraJuzgado do
 		begin
    	fraJuzgado.Codigo := '';
	    TableName   	 		:= 'legales.ljz_juzgado';
  	  FieldID     	 		:= 'jz_id';
    	FieldCodigo 	 		:= 'jz_id';
	    FieldDesc   	 		:= 'jz_descripcion';
  	  ExtraCondition 		:= 'and jz_idjurisdiccion = ' + SqlValue(strtoint(fraJurisdiccion.Codigo)) +  ' and jz_idfuero = ' +  SqlValue(strtoint(fraFuero.Codigo));
	 end;
end;

procedure TfrmConsultaJuiciosEnTramite.ChangeFuero(Sender: TObject);
begin
	if fraJurisdiccion.IsSelected and fraFuero.IsSelected then
  	with fraJuzgado do
  	begin
	    TableName   	 := 'legales.ljz_juzgado';
  	  FieldID     	 := 'jz_id';
    	FieldCodigo 	 := 'jz_id';
	    FieldDesc   	 := 'jz_descripcion';
  	  ExtraCondition := 'and jz_idjurisdiccion = ' + SqlValue(StrToInt(fraJurisdiccion.Codigo)) +  ' and jz_idfuero = ' +  SqlValue(StrToInt(fraFuero.Codigo));
 		end;
end;

procedure TfrmConsultaJuiciosEnTramite.ChangeJuzgado(Sender: TObject);
begin
	if fraJuzgado.IsSelected then
  	with fraSecretaria do
  	begin
	    TableName   	 := 'legales.lsc_secretaria';
  	  FieldID     	 := 'sc_id';
    	FieldCodigo 	 := 'sc_id';
	    FieldDesc   	 := 'sc_descripcion';
  	  ExtraCondition := 'and sc_idjuzgado = ' + SqlValue(StrToInt(fraJuzgado.Codigo));
 		end;
end;

procedure TfrmConsultaJuiciosEnTramite.chkFechadeCierreClick(Sender: TObject);
begin
  inherited;
  if chkFechadeCierre.Checked then
  begin
  	CmbCierredde.Date := 0;
    CmbCierrehta.Date := 0;
  end
end;

procedure TfrmConsultaJuiciosEnTramite.chkSinAbogadoDesignadoClick(Sender: TObject);
begin
  inherited;
  if chkFechadeCierre.Checked then
  begin
  	edFechaAsignDesde.Date := 0;
    edFechaAsignHasta.Date := 0;
  end
end;

procedure TfrmConsultaJuiciosEnTramite.tbImprimirClick(Sender: TObject);
begin
	with TRptJuicios.Create(self) do
  try
  	VistaPrevia(sWhere , FNivelUsuario);
  finally
  	Free;
  end;
end;

procedure TfrmConsultaJuiciosEnTramite.tbSeleccionarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla');
  FIdJuicio := sdqConsulta.FieldByName('JT_ID').AsInteger;
  ModalResult := mrOk;
end;

procedure TfrmConsultaJuiciosEnTramite.SetIdJuicio(const Value: TTableId);
begin
  FIdJuicio := Value;
end;

procedure TfrmConsultaJuiciosEnTramite.SetVerSeleccionar(const Value: Boolean);
begin
  FVerSeleccionar := Value;

  tbSeleccionar.Enabled := Seguridad.Activar(tbSeleccionar) and FVerSeleccionar;

  if FVerSeleccionar then
  begin
    tbNuevaMediacion.Enabled := False;
    tbNuevo.Enabled          := False;
    tbModificar.Enabled      := False;
  end;
end;

procedure TfrmConsultaJuiciosEnTramite.EnableButtons(AEnabled: Boolean);
begin
	inherited;
  tbModificar.Enabled  := not FVerSeleccionar;
end;

end.
