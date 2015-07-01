unit unfrmGestionAnalisisEmision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, PatternEdit, IntEdit, PeriodoPicker,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ToolEdit,
  DateComboBox, unFraCodigoDescripcion, unfraCodigoDescripcionExt,
  FormPanel, JvgGroupBox, VclExtra, unEspera, unFrmAdministracionNominas,
  unfrmRecalculoDevengado, CurrEdit, unArt, ComboEditor, CheckCombo;

type
  TfrmGestionAnalisisEmision = class(TfrmCustomConsulta)
    StatusBar1: TStatusBar;
    fpAutorizacionSimple: TFormPanel;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    pnColorSolicitudCumplida: TPanel;
    lblReferenciaSolicitudCumplida: TLabel;
    ShortCutControlSinHerenciaDelOrto: TShortCutControl;
    gbFiltro: TJvgGroupBox;
    lblEmpresa: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    lblPeriodosFiltro: TLabel;
    ppPeriodosDesdeFiltro: TPeriodoPicker;
    lblHastaPeriodosFiltro: TLabel;
    ppPeriodosHastaFiltro: TPeriodoPicker;
    lblFechaDesdeFiltro: TLabel;
    edFechaDesde: TDateComboBox;
    lblFechaHastaFIltro: TLabel;
    edFechaHasta: TDateComboBox;
    lblNivelRequeridoFiltro: TLabel;
    fraAutorizacionRequerimiento: TfraCodigoDescripcionExt;
    GroupBox1: TGroupBox;
    chkAnalizada: TCheckBox;
    chkSinAnalizar: TCheckBox;
    pnlBottom: TJvgGroupBox;
    gbObservacionesAutorizacion: TGroupBox;
    Label7: TLabel;
    lblObservacionesAutorizacion: TLabel;
    lblFechaAutorizacion: TLabel;
    lblMotivoAut: TLabel;
    edtFechaAutorizacion: TDateComboBox;
    mObservacionAutorizacion: TMemo;
    fraMotivoAut: TfraCodigoDescripcionExt;
    btnAceptarObs: TButton;
    btnCancelarObs: TButton;
    Bevel1: TBevel;
    btnAutorizar: TButton;
    btnNoAutorizar: TButton;
    btnCancelar: TButton;
    pnlDatosContratoAutorizacion: TJvgGroupBox;
    gbDatosContratoAutorizacion: TGroupBox;
    Label3: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edEstado: TEdit;
    edVigDesde: TDateComboBox;
    edVigHasta: TDateComboBox;
    edBaja: TEdit;
    edSuss: TEdit;
    mskCUITAut: TMaskEdit;
    edEjecutivo: TEdit;
    edAsesor: TEdit;
    edHolding: TEdit;
    edEmplContr: TCurrencyEdit;
    edMasaSalarContr: TCurrencyEdit;
    edFInscripcion: TDateComboBox;
    edActividad: TEdit;
    pnlTop: TJvgGroupBox;
    gbDatosSolicitudAutorizacion: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    edtContrato: TEdit;
    edtRazonSocial: TEdit;
    gbCobranzaPeriodo: TGroupBox;
    Label2: TLabel;
    edDevengadoCuota: TCurrencyEdit;
    Label1: TLabel;
    edPagadoCuota: TCurrencyEdit;
    Label28: TLabel;
    edCantSiniestrosPer: TCurrencyEdit;
    btnAgendarObs: TButton;
    chkAgendadas: TCheckBox;
    pnColorSolicitudAgendada: TPanel;
    Label31: TLabel;
    lblFechaCumplimiento: TLabel;
    edFechaAnalisisDesde: TDateComboBox;
    Label35: TLabel;
    edFechaAnalisisHasta: TDateComboBox;
    cmbUsuarioAnalisis: TCheckCombo;
    lblUsuarioCumplimiento: TLabel;
    lblPeriodo: TLabel;
    edtPeriodo: TEdit;
    lblDevporCapita: TLabel;
    edDevporCapita: TCurrencyEdit;
    Label23: TLabel;
    edEmplPer: TCurrencyEdit;
    Label24: TLabel;
    edMasaSalarPer: TCurrencyEdit;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    edDevengadoCuotaAnt: TCurrencyEdit;
    edPagadoCuotaAnt: TCurrencyEdit;
    edtPeriodoAnt: TEdit;
    edDevporCapitaAnt: TCurrencyEdit;
    edEmplPerAnt: TCurrencyEdit;
    edMasaSalarPerAnt: TCurrencyEdit;
    Label30: TLabel;
    edDifDevporCapita: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    lblPeriodoDDJJ: TLabel;
    lblTipoDevengado: TLabel;
    edCodRectifDDJJPer: TCurrencyEdit;
    edFPresentacDDJJPer: TDateComboBox;
    Label32: TLabel;
    edEmplDDJJ: TCurrencyEdit;
    Label36: TLabel;
    edDDJJMasa: TCurrencyEdit;
    GroupBox4: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    edEmplDDJJAnt: TCurrencyEdit;
    edDDJJMasaAnt: TCurrencyEdit;
    Label33: TLabel;
    edCodRectifDDJJPerAnt: TCurrencyEdit;
    Label34: TLabel;
    edFPresentacDDJJPerAnt: TDateComboBox;
    lblPeriodoDDJJAnt: TLabel;
    lblTipoDevengadoAnt: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnNoAutorizarClick(Sender: TObject);
    procedure btnAutorizarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure gbFiltroCollapsed(Sender: TObject);
    procedure gbFiltroExpanded(Sender: TObject);
    procedure fpAutorizacionSimpleShow(Sender: TObject);
    procedure btnAceptarObsClick(Sender: TObject);
    procedure btnCancelarObsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FNivelUsuario: integer;
    FAutoriza: boolean;
    function GetFiltro : string;
    procedure LimpiarFiltros;
    procedure GuardarAutorizacion(Agendar: Boolean);
    procedure GuardarNoAutorizacion(Agendar: Boolean);
    procedure ValidarAutorizacion;
    procedure ValidarNoAutorizacion;
    procedure MostrarAutorizacion;
    procedure Do_CargarDatosSelecSimpleAutorizacion;
    procedure Do_CargarDatosContrato(Contrato: Integer);
    procedure Do_CargarDatosAnalisisPerActual;
    procedure Do_CargarDatosAnalisisPerAnterior;
    procedure Do_CargarDatosCobranza;
    procedure Do_CargarDatosSiniestro(Contrato: Integer; Periodo: string);

    function IsSolicitudAgendada(TipoCumplimiento: String): boolean;
  public
    frmAdministracionNominas: TfrmAdministracionNominas;
    procedure MostrarAutorizaciones(Contrato : integer; Periodo : string);
  end;

var
  frmGestionAnalisisEmision: TfrmGestionAnalisisEmision;

implementation

uses unDmEmision, unDmPrincipal, unUtils, unSesion, SqlFuncs, Strfuncs, Periodo,
      AnsiSql, CustomDlgs, DBFuncs, General, unConstEmision, unFuncionesEmision,
      unfrmObservacion, Periodos;

{$R *.dfm}

{------------------------------------------------------------------------------}
function TfrmGestionAnalisisEmision.GetFiltro : string;
var
 sWhere : string;
 sSql : string;
 sInEstado: string;
 subWhere, sInUsuario: string;
 i: integer;
begin
  sWhere := '';
  sInEstado := '';
  subWhere := '';
  sInUsuario := '';

  if fraEmpresaFiltro.IsSelected then
  begin
    sWhere := sWhere + ' AND ae_contrato = ' + SqlValue(fraEmpresaFiltro.Contrato);
  end;

  if not IsEmptyString(ppPeriodosDesdeFiltro.Text)  then
  begin
     if not IsEmptyString(ppPeriodosHastaFiltro.Text) then
     begin
       sWhere := sWhere +  ' AND ae_periodo >= '+ SqlValue(ppPeriodosDesdeFiltro.Text)  +
                           ' AND ae_periodo <= '+ SqlValue(ppPeriodosHastaFiltro.Text);
     end else
     begin

       sWhere := sWhere +  ' AND ae_periodo >= '+ SqlValue(ppPeriodosDesdeFiltro.Text);
     end;
  end
  else begin
    if not IsEmptyString(ppPeriodosHastaFiltro.Text)  then
    begin
       sWhere := sWhere +  ' AND ae_periodo <= '+ SqlValue(ppPeriodosHastaFiltro.Text);
    end;
  end;

  if edFechaDesde.Date > 0  then
  begin
     if edFechaHasta.Date > 0  then
     begin
       sWhere := sWhere + ' AND TRUNC(ea_fechaalta) BETWEEN '
               + SqlDate(edFechaDesde.Date) + ' AND '
               + SqlDate(edFechaHasta.Date);
     end else
     begin
       sWhere := sWhere + ' AND TRUNC(ea_fechaalta) >= ' + SqlDate(edFechaDesde.Date);
     end;
  end
  else begin
    if edFechaHasta.Date > 0  then
      sWhere := sWhere + ' AND TRUNC(ea_fechaalta) <= ' + SqlDate(edFechaHasta.Date);
  end;

  if edFechaAnalisisDesde.Date > 0  then
  begin
     if edFechaAnalisisHasta.Date > 0  then
     begin
       sWhere := sWhere + ' AND TRUNC(ae_fechaanalisis) BETWEEN '
               + SqlDate(edFechaAnalisisDesde.Date) + 'and '
               + SqlDate(edFechaAnalisisHasta.Date);
     end else
     begin
       sWhere := sWhere + ' AND TRUNC(ae_fechaanalisis) >= ' + SqlDate(edFechaAnalisisDesde.Date);
     end;
  end
  else begin
    if edFechaAnalisisHasta.Date > 0  then
      sWhere := sWhere + ' AND TRUNC(ae_fechaanalisis) <= ' + SqlDate(edFechaAnalisisHasta.Date);
  end;

  if fraAutorizacionRequerimiento.IsSelected then
    sWhere := sWhere + ' and ae_idnivelautorizacion = ' + fraAutorizacionRequerimiento.Codigo;

  if chkAnalizada.Checked then
    sInEstado := sInEstado + iif(sInEstado<>'', ', ', '') + '''A'', ''N''';

  if chkAgendadas.Checked then
    sInEstado := sInEstado + iif(sInEstado<>'', ', ', '') + '''U'', ''O''';

  if chkSinAnalizar.Checked then
  begin
    if (sInEstado = '') then
      sWhere := sWhere +   ' and ae_estado = ''P'' '
    else begin
      sInEstado := sInEstado + ', ''P''';
      sWhere := sWhere + ' and ae_estado in (' + sInEstado + ') ';
    end;
  end
  else begin
    if sInEstado <> '' then
      sWhere := sWhere + ' and ae_estado in (' + sInEstado + ') ';
  end;

  if (cmbUsuarioAnalisis.CheckedCount > 0) then
  begin
    for i:=0 to cmbUsuarioAnalisis.Items.Count-1 do
    begin
        if cmbUsuarioAnalisis.Checked[i] then
        begin
          if (sInUsuario <> '') then
            sInUsuario := sInUsuario + ', ';
          sInUsuario := sInUsuario +  SqlValue(cmbUsuarioAnalisis.Items[i]);
        end;
    end;
    if (sInUsuario <> '') then
      subWhere := subWhere + ' AND ae_usuarioanalisis IN (' + sInUsuario + ') ';
  end;

    sSql :=   'SELECT iae.ae_id,                                    ' +
            '       ina.na_descripcion,                             ' +
            '       ina.na_id,                                      ' +
            '       iae.ae_contrato,                                ' +
            '       iae.ae_motivoanalisis,                          ' +
            '       aem.em_nombre,                                  ' +
            '       iae.ae_periodo,                                 ' +
            '       iae.ae_devcuota,                                ' +
            '       iae.ae_empleados,                               ' +
            '       iae.ae_masasalarial,                            ' +
            '       iae.ae_devcuotaanterior,                        ' +
            '       iae.ae_empleadosanterior,                       ' +
            '       iae.ae_masasalarialanterior,                    ' +
            '       iae.ae_fechaanalisis,                           ' +
            '       iae.ae_estado,                                  ' +
            '       (ae_devcuota / ae_empleados) devporcapita,      ' +
            '       (ae_devcuotaanterior / ae_empleadosanterior) devporcapitaant, ' +
            '       ABS((ae_devcuota / ae_empleados) -(ae_devcuotaanterior / ae_empleadosanterior)) dif, ' +
             '       decode(iae.ae_estado,                           ' +
            '       ''A'', ''Aprobada'',                            ' +
            '       ''N'', ''No Aprobada'',                         ' +
            '       ''U'', ''Agendada Aprobación'',                 ' +
            '       ''O'', ''Agendada No Aprobación'',              ' +
            '       ''P'', ''Pendiente'') Estado,                   ' +
            '       ma_descripcion,                                 ' +
            '       iae.ae_usuarioanalisis,                         ' +
            '       iae.ae_observacion,                             ' +
            '       ea_fechaalta,                                   ' +
            '       ea_usualta                                      ' +
            '  FROM afi.aco_contrato aco,                           ' +
            '       afi.aem_empresa aem,                            ' +
            '       emi.ina_nivelautorizacion ina,                  ' +
            '       emi.ima_motivoaceprech,                        ' +
            '       emi.iea_ejecucionanalisis,                      ' +
            '       emi.iae_analisisemision iae                    ' +
            '  WHERE     (aco.co_contrato = iae.ae_contrato)        ' +
            '        AND (aem.em_id = aco.co_idempresa)             ' +
            '        AND (ina.na_id = iae.ae_idnivelautorizacion)   ' +
            '        AND (ea_id = iae.ae_idejecucionanalisis)       ' + 
            '        AND (iae.ae_motivoanalisis =  ma_id(+))        ' +
            sWhere + subWhere;

  if trim (SortDialog.OrderBy) <> '' then
    sSql := sSql + SortDialog.OrderBy
  else
    sSql := sSql + ' order by ae_contrato desc ';

  result := sSql;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text := GetFiltro;
  inherited;
  if (sdqConsulta.RecordCount = 1) then
    Grid.SelectAll;
end;

procedure TfrmGestionAnalisisEmision.FormCreate(Sender: TObject);
begin
  frmAdministracionNominas := nil;

  FNivelUsuario := get_nivelautorizacionusuario(Sesion.LoginName);

  fraEmpresaFiltro.ShowBajas := true;

  with fraAutorizacionRequerimiento do
  begin
    TableName := 'EMI.INA_NIVELAUTORIZACION';
    FieldID := 'NA_ID';
    FieldCodigo := 'NA_ID';
    FieldDesc := 'NA_DESCRIPCION';
    FieldBaja := 'NA_FECHABAJA';
    ShowBajas := true;
  end;

  fraAutorizacionRequerimiento.Codigo := IntToStr(FNivelUsuario);

  with fraMotivoAut do
  begin
    TableName := 'EMI.IMA_MOTIVOACEPRECH';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_ID';
    FieldDesc := 'MA_DESCRIPCION';
    ShowBajas := false;
  end;

  cmbUsuarioAnalisis.Clear;
  with GetQuery('SELECT SE_USUARIO, SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABAJA, SE_MAIL ' +
                ' FROM ART.USE_USUARIOS WHERE SE_SECTOR = ' + SqlValue('EMI')) do
  try
   while not Eof do
   begin
    cmbUsuarioAnalisis.Items.Add(FieldbyName('SE_USUARIO').AsString);
    Next;
   end;
  finally
    Free;
  end;

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (sdqConsulta.FieldByName('ae_estado').AsString = 'P') and
     not IsSolicitudAgendada(sdqConsulta.FieldByName('ae_estado').asstring) then
  begin
    if HighLight then Background := clTeal else Background := $00E1FFFF;
  end;

  if IsSolicitudAgendada(sdqConsulta.FieldByName('ae_estado').asstring) then
    if HighLight then Background := clTeal else Background := pnColorSolicitudAgendada.Color;
end;

procedure TfrmGestionAnalisisEmision.LimpiarFiltros;
begin
  fraEmpresaFiltro.clear;
  ppPeriodosDesdeFiltro.Clear;
  ppPeriodosHastaFiltro.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  fraAutorizacionRequerimiento.Clear;
  chkAnalizada.Checked  := false;
  chkSinAnalizar.Checked := false;
  chkAgendadas.Checked    := false;

  ppPeriodosDesdeFiltro.Periodo.MinPeriodo := '199601';
  ppPeriodosDesdeFiltro.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);

  ppPeriodosHastaFiltro.Periodo.MinPeriodo := '199601';
  ppPeriodosHastaFiltro.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);
  cmbUsuarioAnalisis.Clear;
  edFechaAnalisisDesde.Clear;
  edFechaAnalisisHasta.Clear;

  edEmplDDJJ.Clear;
  edCodRectifDDJJPer.Clear;
  lblTipoDevengado.Caption := '';
  lblPeriodoDDJJ.Caption := '';
  edDDJJMasa.Clear;
  edFPresentacDDJJPer.Clear;

  edEmplDDJJAnt.Clear;
  edCodRectifDDJJPerAnt.Clear;
  lblTipoDevengadoAnt.Caption := '';
  lblPeriodoDDJJAnt.Caption := '';
  edDDJJMasaAnt.Clear;
  edFPresentacDDJJPerAnt.Clear;

  edtPeriodoAnt.Clear;
  edDevengadoCuotaAnt.Clear;
  edEmplPerAnt.Clear;
  edDevporCapitaAnt.Clear;
  edPagadoCuotaAnt.Clear;
  edMasaSalarPerAnt.Clear;
  edDifDevporCapita.Clear;
end;

procedure TfrmGestionAnalisisEmision.tbLimpiarClick(Sender: TObject);
begin
  LimpiarFiltros;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.ValidarAutorizacion;
begin
  Verificar(not fraMotivoAut.IsSelected, fraMotivoAut, 'Debe seleccionar un motivo.');
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.MostrarAutorizacion;
begin
  edtFechaAutorizacion.Date := DBDate;

  pnlBottom.Parent := fpAutorizacionSimple;

  edtContrato.Text     := sdqConsulta.FieldByName('ae_contrato').AsString;
  edtRazonSocial.Text  := sdqConsulta.FieldByName('em_nombre').AsString;
  edtPeriodo.Text      := sdqConsulta.FieldByName('ae_periodo').AsString;

  fpAutorizacionSimple.ShowModal;

  sdqConsulta.Refresh;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.tbModificarClick(Sender: TObject);
begin
 if (FNivelUsuario <> sdqConsulta.FieldByName('na_id').AsInteger) then
 begin
   MessageDlg('El usuario no tiene el nivel de aprobación requerido.', mtError, [mbOK], 0);
   exit;
 end;

 if not (sdqConsulta.FieldByName('ae_estado').AsString = 'P') and not IsSolicitudAgendada(sdqConsulta.FieldByName('ae_estado').asstring) then
 begin
   MessageDlg('No se puede tomar esta acción sobre una solicitud ya procesada.', mtError, [mbOK], 0);
   exit;
 end;

 MostrarAutorizacion;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.btnNoAutorizarClick(Sender: TObject);
begin
  VCLExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], false);
  fraMotivoAut.ExtraJoinCondition := ' MA_TIPO = ''R''';
  btnAutorizar.Enabled   := false;
  btnNoAutorizar.Enabled := false;
  btnCancelar.Enabled    := false;
  FAutoriza := false;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.btnAutorizarClick(Sender: TObject);
begin
  VCLExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], false);
  fraMotivoAut.ExtraJoinCondition := ' MA_TIPO = ''A''';
  btnAutorizar.Enabled   := false;
  btnNoAutorizar.Enabled := false;
  btnCancelar.Enabled    := false;
  FAutoriza := true;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.GuardarNoAutorizacion(Agendar: Boolean);
begin
  if (MsgBox('¿Confirma el RECHAZO de la nómina?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = mrYes) then
  begin
    sdqConsulta.DisableControls;
    try
      BeginTrans;
      do_aprobaranalisis(sdqConsulta.FieldByName('ae_id').asinteger, String(iif(Agendar, 'O', 'N')), fraMotivoAut.Value, mObservacionAutorizacion.Text, Sesion.LoginName);
      CommitTrans;
    except
      on E : Exception do
      begin
        Rollback;
        MsgBox('Error al aplicar aprobación.' + #13#10 +  E.Message, MB_ICONERROR or MB_OK, 'Aprobación');
      end;
    end;
    tbRefrescar.Click;
    sdqConsulta.EnableControls;
  end
  else abort;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.GuardarAutorizacion(Agendar: Boolean);
begin
  if MsgBox('¿Confirma la aprobación del análisis?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = mrYes then
  begin
    try
      BeginTrans;
      do_aprobaranalisis(sdqConsulta.FieldByName('ae_id').asinteger, String(iif(Agendar, 'U', 'A')), fraMotivoAut.Value, mObservacionAutorizacion.Text, Sesion.LoginName);
      CommitTrans;
    except
      on E : Exception do
      begin
        Rollback;
        MsgBox('Error al aplicar aprobación.' + #13#10 +  E.Message, MB_ICONERROR or MB_OK, 'Aprobación');
      end;
    end;
    tbRefrescar.Click;
  end
  else abort;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.MostrarAutorizaciones(Contrato: integer; Periodo: string);
begin
  tbMostrarFiltros.Down := true;
  fraEmpresaFiltro.Contrato := Contrato;
  ppPeriodosDesdeFiltro.Periodo.Valor := Periodo;
  ppPeriodosHastaFiltro.Periodo.Valor := Periodo;
  tbRefrescar.Click;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.tbNuevoClick(Sender: TObject);
begin
//  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.gbFiltroCollapsed(Sender: TObject);
begin
  pnlFiltros.Visible := False;
  if Visible and Grid.CanFocus then Grid.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.gbFiltroExpanded(Sender: TObject);
begin
  pnlFiltros.Visible := True;
  if Visible then
    SelectNext(pnlFiltros, True, True);
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.fpAutorizacionSimpleShow(Sender: TObject);
begin
  VclExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], true);
  VclExtra.LockControls([edVigDesde, edVigHasta, edBaja, edEstado, edSuss, mskCUITAut, edEjecutivo, edAsesor, edHolding, edEmplContr, edMasaSalarContr,
                        edFInscripcion, edActividad, edEmplPer, edMasaSalarPer, edCodRectifDDJJPer, edFPresentacDDJJPer, edDevengadoCuota,
                        edPagadoCuota, edCantSiniestrosPer, edDevporCapita, edtPeriodoAnt, edDevengadoCuotaAnt, edEmplPerAnt, edMasaSalarPerAnt,
                        edDevporCapitaAnt, edPagadoCuotaAnt, edCodRectifDDJJPerAnt, edFPresentacDDJJPerAnt, edDifDevporCapita, edEmplDDJJ, edDDJJMasa,
                        edEmplDDJJAnt, edDDJJMasaAnt], true);
  VclExtra.LockControls([edtContrato, edtRazonSocial, edtPeriodo, edtFechaAutorizacion], true);

  btnAutorizar.Enabled   := true;
  btnNoAutorizar.Enabled := true;
  btnCancelar.Enabled    := true;

  if IsSolicitudAgendada(sdqConsulta.FieldByName('ae_estado').asstring) then
    begin
      if sdqConsulta.FieldByName('ae_estado').asstring = 'U' then  // agendar analisis
        btnAutorizarClick(nil)
      else
        btnNoAutorizarClick(nil);

      fraMotivoAut.Value            := sdqConsulta.FieldByName('ae_motivoanalisis').asinteger;
      mObservacionAutorizacion.Text := sdqConsulta.FieldByName('ae_observacion').asstring;
    end
  else
    begin
      fraMotivoAut.Clear;
      mObservacionAutorizacion.Clear;
    end;

  Do_CargarDatosSelecSimpleAutorizacion;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.ValidarNoAutorizacion;
begin
  Verificar(not fraMotivoAut.IsSelected, fraMotivoAut, 'Debe seleccionar un motivo.');
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.btnAceptarObsClick(Sender: TObject);
var
  bAgendar: Boolean;
begin
  bAgendar := (Sender = btnAgendarObs);

  if FAutoriza then
  begin
    ValidarAutorizacion;
    GuardarAutorizacion(bAgendar);
  end
  else begin
    ValidarNoAutorizacion;
    GuardarNoAutorizacion(bAgendar);
  end;
  fpAutorizacionSimple.close;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.btnCancelarObsClick(Sender: TObject);
begin
  VCLExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], true);
  btnAutorizar.Enabled := true;
  btnNoAutorizar.Enabled := true;
  btnCancelar.Enabled := true;
  fraMotivoAut.Clear;
  mObservacionAutorizacion.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(frmAdministracionNominas) then
    frmAdministracionNominas.Refrescar;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.Do_CargarDatosSelecSimpleAutorizacion;
begin
  Do_CargarDatosContrato(sdqConsulta.FieldByName('ae_contrato').AsInteger);
  Do_CargarDatosAnalisisPerActual;
  Do_CargarDatosAnalisisPerAnterior;
  Do_CargarDatosCobranza;
  Do_CargarDatosSiniestro(sdqConsulta.FieldByName('ae_contrato').AsInteger,
                          edtPeriodo.Text);
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.Do_CargarDatosContrato(Contrato: Integer);
var
  sSql: String;
  SqlResults: TStringList;
begin

  sSql := 'SELECT CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
                 'TO_CHAR(CO_FECHABAJA, ''DD/MM/YYYY'') || ''  '' || BAJ.TB_DESCRIPCION MOTIVOBAJA, ' +
                 'AFEST.TB_CODIGO || ''  '' || AFEST.TB_DESCRIPCION ESTADO, ' +
                 'SUSS.TB_DESCRIPCION DESCRSUSS, EM_CUIT, EC_NOMBRE, AS_NOMBRE, ' +
                 'GE_DESCRIPCION, CO_TOTEMPLEADOS, CO_MASATOTAL, CO_FECHAINSCRIPCION, ' +

                 'AC_CODIGO || ''  '' || AC_DESCRIPCION ' +
            'FROM CAC_ACTIVIDAD, CTB_TABLAS SUSS, CTB_TABLAS BAJ, CTB_TABLAS AFEST, ' +
                 'AGE_GRUPOECONOMICO, IAS_ASESOREMISION, AEC_EJECUTIVOCUENTA, ' +
                 'AEM_EMPRESA, ACO_CONTRATO ' +
           'WHERE EM_ID = CO_IDEMPRESA ' +
             'AND BAJ.TB_CLAVE(+) = ''MOTIB'' ' +
             'AND BAJ.TB_CODIGO(+) = CO_MOTIVOBAJA ' +
             'AND AFEST.TB_CLAVE  = ''AFEST'' ' +
             'AND AFEST.TB_CODIGO = CO_ESTADO ' +
             'AND SUSS.TB_CLAVE = ''SUSS'' ' +
             'AND SUSS.TB_CODIGO = EM_SUSS ' +
             'AND CO_IDEJECUTIVO = EC_ID(+) ' +
             'AND CO_IDASESOREMISION = AS_ID(+) ' +
             'AND EM_HOLDING = GE_CODIGO(+) ' +
             'AND CO_IDACTIVIDAD = AC_ID ' +
             'AND CO_CONTRATO = ' + SqlValue(Contrato);

  SqlResults := ValoresColSql(sSql);
  try
    edVigDesde.Text          := SqlResults[0];
    edVigHasta.Text          := SqlResults[1];
    edBaja.Text              := SqlResults[2];
    edEstado.Text            := SqlResults[3];
    edSuss.Text              := SqlResults[4];
    mskCUITAut.Text          := SqlResults[5];
    edEjecutivo.Text         := SqlResults[6];
    edAsesor.Text            := SqlResults[7];
    edHolding.Text           := SqlResults[8];
    edEmplContr.Text         := SqlResults[9];
    edMasaSalarContr.Text    := SqlResults[10];
    edFInscripcion.Text      := SqlResults[11];
    edActividad.Text         := SqlResults[12];
  finally
    SqlResults.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.Do_CargarDatosAnalisisPerActual;
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT DJ_CODIGORECTIFICATIVA, DJ_FECHAPRESENTACION, DJ_PERIODO, DJ_EMPLEADOS, DJ_MASASALARIAL ' +
            'FROM EMI.IDJ_DDJJ ' +
           'WHERE DJ_ID = ' + SqlValue(Get_UltimaIdDeclaracion(sdqConsulta.fieldbyname('ae_contrato').AsInteger,
                                                               sdqConsulta.fieldbyname('ae_periodo').AsString));

  SqlResults := ValoresColSql(sSql);
  try
   edCodRectifDDJJPer.Text := '';
   edFPresentacDDJJPer.Text := '';
   lblTipoDevengado.Caption := 'Estimado';
   lblPeriodoDDJJ.Caption := '';

   if (SqlResults.Count > 0) and (SqlResults[2] <> '') then
    begin
      edCodRectifDDJJPer.Text  := SqlResults[0];
      if (SqlResults[2] = sdqConsulta.fieldbyname('ae_periodo').AsString) then
      begin
        edFPresentacDDJJPer.Text := SqlResults[1];
        lblTipoDevengado.Caption := 'Real';
      end
      else begin
        edFPresentacDDJJPer.Text := '';
        lblTipoDevengado.Caption := 'Estimado';
      end;
      lblPeriodoDDJJ.Caption := SqlResults[2];
      edEmplDDJJ.Value         := StrToCurrDef(SqlResults[3], 0);
      edDDJJMasa.Value         := StrToCurrDef(SqlResults[4], 0);
    end;
    edDevengadoCuota.Value   := sdqConsulta.fieldbyname('ae_devcuota').AsCurrency;
    edEmplPer.Text           := sdqConsulta.fieldbyname('ae_empleados').AsString;
    edMasaSalarPer.Value     := sdqConsulta.fieldbyname('ae_masasalarial').AsCurrency;
    edDevporCapita.Value     := sdqConsulta.fieldbyname('devporcapita').AsCurrency;
    edDifDevporCapita.Value  := sdqConsulta.fieldbyname('dif').AsCurrency;
  finally
    SqlResults.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.Do_CargarDatosCobranza;
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT RC_PAGOCUOTA+RC_RECUPEROCUOTA ' +
            'FROM ZRC_RESUMENCOBRANZA ' +
           'WHERE RC_CONTRATO = ' + SqlValue(sdqConsulta.fieldbyname('ae_contrato').AsInteger) + ' ' +
             'AND RC_PERIODO = ' + SqlValue(sdqConsulta.fieldbyname('ae_periodo').AsString);

  SqlResults := ValoresColSql(sSql);
  try
    edPagadoCuota.Text    := SqlResults[0];
  finally
    SqlResults.Free;
  end;

  sSql := 'SELECT RC_PAGOCUOTA+RC_RECUPEROCUOTA ' +
            'FROM ZRC_RESUMENCOBRANZA ' +
           'WHERE RC_CONTRATO = ' + SqlValue(sdqConsulta.fieldbyname('ae_contrato').AsInteger) + ' ' +
             'AND RC_PERIODO = ' + SqlValue(PrevPeriodo(sdqConsulta.fieldbyname('ae_periodo').AsString));

  SqlResults := ValoresColSql(sSql);
  try
    edPagadoCuotaAnt.Text    := SqlResults[0];
  finally
    SqlResults.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.Do_CargarDatosSiniestro(Contrato: Integer; Periodo: string);
begin
  edCantSiniestrosPer.Value := Get_CantSiniestrosPeriodo(Contrato, Periodo);
end;
{------------------------------------------------------------------------------}
function TfrmGestionAnalisisEmision.IsSolicitudAgendada(TipoCumplimiento: String): boolean;
begin
  Result := (Instr('UO', TipoCumplimiento) > 0);
end;
{------------------------------------------------------------------------------}
procedure TfrmGestionAnalisisEmision.sdqConsultaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('AE_DEVCUOTA') is TFloatField then
    TFloatField(DataSet.FieldByName('AE_DEVCUOTA')).Currency := True;

  if DataSet.FieldByName('AE_MASASALARIAL') is TFloatField then
    TFloatField(DataSet.FieldByName('AE_MASASALARIAL')).Currency := True;

  if DataSet.FieldByName('AE_DEVCUOTAANTERIOR') is TFloatField then
    TFloatField(DataSet.FieldByName('AE_DEVCUOTAANTERIOR')).Currency := True;

  if DataSet.FieldByName('AE_MASASALARIALANTERIOR') is TFloatField then
    TFloatField(DataSet.FieldByName('AE_MASASALARIALANTERIOR')).Currency := True;

  if DataSet.FieldByName('DEVPORCAPITA') is TFloatField then
    TFloatField(DataSet.FieldByName('DEVPORCAPITA')).Currency := True;

  if DataSet.FieldByName('DEVPORCAPITAANT') is TFloatField then
    TFloatField(DataSet.FieldByName('DEVPORCAPITAANT')).Currency := True;

  if DataSet.FieldByName('DIF') is TFloatField then
    TFloatField(DataSet.FieldByName('DIF')).Currency := True;
end;

procedure TfrmGestionAnalisisEmision.Do_CargarDatosAnalisisPerAnterior;
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT DJ_CODIGORECTIFICATIVA, DJ_FECHAPRESENTACION, DJ_PERIODO, DJ_EMPLEADOS, DJ_MASASALARIAL  ' +
            'FROM EMI.IDJ_DDJJ ' +
           'WHERE DJ_ID = ' + SqlValue(Get_UltimaIdDeclaracion(sdqConsulta.fieldbyname('ae_contrato').AsInteger,
                                                               PrevPeriodo(sdqConsulta.fieldbyname('ae_periodo').AsString)));

  SqlResults := ValoresColSql(sSql);
  try
   edCodRectifDDJJPerAnt.Text := '';
   edFPresentacDDJJPerAnt.Text := '';
   lblTipoDevengadoAnt.Caption := 'Estimado';
   lblPeriodoDDJJAnt.Caption := '';

    edEmplPerAnt.Text           := sdqConsulta.fieldbyname('ae_empleadosanterior').AsString;
    edMasaSalarPerAnt.Value     := sdqConsulta.fieldbyname('ae_masasalarialanterior').AsCurrency;

   if (SqlResults.Count > 0) and (SqlResults[2] <> '') then
    begin
      edCodRectifDDJJPerAnt.Text  := SqlResults[0];
      if (SqlResults[2] = PrevPeriodo(sdqConsulta.fieldbyname('ae_periodo').AsString)) then
      begin
        edFPresentacDDJJPerAnt.Text := SqlResults[1];
        lblTipoDevengadoAnt.Caption := 'Real'
      end
      else begin
        edFPresentacDDJJPerAnt.Text := '';
        lblTipoDevengadoAnt.Caption := 'Estimado';
      end;
      lblPeriodoDDJJAnt.Caption := SqlResults[2];
      edEmplDDJJAnt.Value         := StrToCurrDef(SqlResults[3], 0);
      edDDJJMasaAnt.Value         := StrToCurrDef(SqlResults[4], 0);

      if (edEmplDDJJ.Value <> edEmplPer.Value) then
      begin
        edEmplPer.Font.Color := clRed;
        edEmplDDJJ.Font.Color := clRed;
      end
      else begin
        edEmplPer.Font.Color := clWindowText;
        edEmplDDJJ.Font.Color := clWindowText;
      end;

      if (edMasaSalarPer.Value <> edDDJJMasa.Value) then
      begin
        edMasaSalarPer.Font.Color := clRed;
        edDDJJMasa.Font.Color := clRed;
      end
      else begin
        edMasaSalarPer.Font.Color := clWindowText;
        edDDJJMasa.Font.Color := clWindowText;
      end;

      if (edEmplPerAnt.Value <> edEmplDDJJAnt.Value) then
      begin
        edEmplPerAnt.Font.Color := clRed;
        edEmplDDJJAnt.Font.Color := clRed;
      end
      else begin
        edEmplPerAnt.Font.Color := clWindowText;
        edEmplDDJJAnt.Font.Color := clWindowText;
      end;

      if (edMasaSalarPerAnt.Value <> edDDJJMasaAnt.Value) then
      begin
        edMasaSalarPerAnt.Font.Color := clRed;
        edDDJJMasaAnt.Font.Color := clRed;
      end
      else begin
        edMasaSalarPerAnt.Font.Color := clWindowText;
        edDDJJMasaAnt.Font.Color := clWindowText;
      end;
    end
    else begin
      edEmplDDJJAnt.Clear;
      edCodRectifDDJJPerAnt.Clear;
      edDDJJMasaAnt.Clear;
      edFPresentacDDJJPerAnt.Clear;
      lblTipoDevengadoAnt.Caption := '';
      lblPeriodoDDJJAnt.Caption := '';
      edDDJJMasaAnt.Font.Color := clWindowText;
    end;
    edtPeriodoAnt.Text          := PrevPeriodo(sdqConsulta.fieldbyname('ae_periodo').AsString);
    edDevengadoCuotaAnt.Value   := sdqConsulta.fieldbyname('ae_devcuotaanterior').AsCurrency;
    edDevporCapitaAnt.Value     := sdqConsulta.fieldbyname('devporcapitaant').AsCurrency;
  finally
    SqlResults.Free;
  end;
end;

end.

