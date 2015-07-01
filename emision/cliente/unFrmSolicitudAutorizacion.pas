{-----------------------------------------------------------------------------
 Nombre Unidad: unFrmSolicitudAutorizacion
 Autor:         cchiappero
 Fecha:         30-set-2005
 Proposito:    atender las solicitudes de autorizacion generadas automaticamente,
               o por efecto atención de notas.
 Versiones:    0.1 - Inicio
-----------------------------------------------------------------------------}
unit unFrmSolicitudAutorizacion;

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
  TFrmSolicitudAutorizacion = class(TfrmCustomConsulta)
    StatusBar1: TStatusBar;
    tbDerivarAutorizacion: TToolButton;
    fpDerivacionAutorizacion: TFormPanel;
    bvSeparador: TBevel;
    btnAceptarDerivacion: TButton;
    btnCancelarDeriviacion: TButton;
    gbDerivacionNota: TGroupBox;
    lblObservacion: TLabel;
    lblFechaDerivacionNota: TLabel;
    lblObservaciones: TLabel;
    edtFechaDerivacion: TDateComboBox;
    mObservacionesDerivacion: TMemo;
    lblAutorizacionRequerida: TLabel;
    fraAutorizacionSuperior: TfraCodigoDescripcionExt;
    fpAutorizacionSimple: TFormPanel;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    pnColorSolicitudCumplida: TPanel;
    lblReferenciaSolicitudCumplida: TLabel;
    pnPeriodoSinCobertura: TPanel;
    lblEnGestion: TLabel;
    ShortCutControlSinHerenciaDelOrto: TShortCutControl;
    gbFiltro: TJvgGroupBox;
    lblEmpresa: TLabel;
    fraEmpresaNotaFiltro: TfraEmpresa;
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
    lblSolicitudFiltro: TLabel;
    fraSolicitud: TfraCodigoDescripcionExt;
    GroupBox1: TGroupBox;
    chkAutorizadas: TCheckBox;
    chkSinAutorizar: TCheckBox;
    tbSelectAll: TToolButton;
    chkExcluirBajas: TCheckBox;
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
    gbDDJJSelec: TGroupBox;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edEmplDDJJSel: TCurrencyEdit;
    edMasaSalarDDJJSel: TCurrencyEdit;
    edCodRectifDDJJSel: TCurrencyEdit;
    edFPresentacDDJJSel: TDateComboBox;
    edFInscripcion: TDateComboBox;
    edActividad: TEdit;
    gbDDJJPeriodo: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edEmplDDJJPer: TCurrencyEdit;
    edMasaSalarDDJJPer: TCurrencyEdit;
    edCodRectifDDJJPer: TCurrencyEdit;
    edFPresentacDDJJPer: TDateComboBox;
    pnlTop: TJvgGroupBox;
    gbDatosSolicitudAutorizacion: TGroupBox;
    Label5: TLabel;
    lblMotivo: TLabel;
    Label8: TLabel;
    lblPeriodos: TLabel;
    edtMotivo: TEdit;
    edtContrato: TEdit;
    edtRazonSocial: TEdit;
    edtPeriodoDesde: TEdit;
    edtPeriodoHasta: TEdit;
    fpAutorizacionMultiple: TFormPanel;
    pnlTop2: TJvgGroupBox;
    gbDatosSolicitudAutorizacionMult: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    edtCantSolicitudes: TIntEdit;
    tbComandosDelcaracionesJuradas: TToolBar;
    tbAnteriorPeriodo: TToolButton;
    ppPeriodo: TPeriodoPicker;
    tbPosteriorPeriodo: TToolButton;
    gbCobranzaPeriodo: TGroupBox;
    Label2: TLabel;
    edDevengadoCuota: TCurrencyEdit;
    Label1: TLabel;
    edPagadoCuota: TCurrencyEdit;
    Label27: TLabel;
    edRedondeoPrev: TCurrencyEdit;
    Label28: TLabel;
    edCantSiniestrosPer: TCurrencyEdit;
    lblTipoDevengado: TLabel;
    lblPeriodoDDJJ: TLabel;
    btnAgendarObs: TButton;
    chkAgendadas: TCheckBox;
    pnColorSolicitudAgendada: TPanel;
    Label31: TLabel;
    lblFechaCumplimiento: TLabel;
    edFechaCumplimientoDesde: TDateComboBox;
    Label35: TLabel;
    edFechaCumplimientoHasta: TDateComboBox;
    cmbUsuarioCumplimiento: TCheckCombo;
    lblUsuarioCumplimiento: TLabel;
    tbObservacion: TToolButton;
    edPorcentajeVarMasa: TCurrencyEdit;
    Label32: TLabel;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbDerivarAutorizacionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAceptarDerivacionClick(Sender: TObject);
    procedure btnCancelarDeriviacionClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnNoAutorizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAutorizarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure gbFiltroCollapsed(Sender: TObject);
    procedure gbFiltroExpanded(Sender: TObject);
    procedure fpAutorizacionSimpleShow(Sender: TObject);
    procedure tbSelectAllClick(Sender: TObject);
    procedure btnAceptarObsClick(Sender: TObject);
    procedure btnCancelarObsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbPosteriorPeriodoClick(Sender: TObject);
    procedure tbObservacionClick(Sender: TObject);
  private
    FMasaDDJJSelSinSac: Extended;
    FMasaPerSinSac: Extended;
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
    procedure Do_CargarDatosContratoAutorizacion(Contrato: Integer; IdSolicAutorizacion: TTableId);
    procedure Do_CargarDatosUltDDJJAutorizacion(Contrato: Integer; Periodo: string);
    procedure Do_CargarDatosCobranza(Contrato: Integer; Periodo: string);
    procedure Do_CargarDatosSiniestro(Contrato: Integer; Periodo: string);
    function Is_SeleccionMultipleAutorizacion: Boolean;

    procedure GuardarDerivacion;
    procedure MostrarDerivacion;
    procedure ValidarDerivacion;
    function IsSolicitudAgendada(TipoCumplimiento: String): boolean;
  public
    frmAdministracionNominas: TfrmAdministracionNominas;
    procedure MostrarAutorizaciones(Contrato : integer; Periodo : string);
  end;

var
  FrmSolicitudAutorizacion: TFrmSolicitudAutorizacion;

implementation

uses unDmEmision, //unFrmSimulacion,
      unDmPrincipal, unUtils, unSesion, SqlFuncs, Strfuncs, Periodo,
      AnsiSql, CustomDlgs, DBFuncs, General, unConstEmision, unFuncionesEmision,
      unfrmObservacion;

{$R *.dfm}

procedure TFrmSolicitudAutorizacion.tbPropiedadesClick(Sender: TObject);
begin
(*
//  inherited;
  if     (FNivelUsuario < sdqConsulta.FieldByName('na_id').AsInteger) then
  begin
    MessageDlg('El usuario no tiene el nivel de aprobación requerido.', mtError, [mbOK], 0);
    exit;
  end;

  if (sdqConsulta.RecordCount > 0) and
    (sdqConsulta.FieldByName('sa_fechacumplimiento').asstring = '') then
  begin
    with TFrmSimulacion.Create(Self) do
    try
      SimularContrato(Self.sdqConsulta.FieldByName('sa_contrato').AsInteger);
//    Hide;
//    ShowModal;
    finally
//      Free;
    end;
  end;
*)  
end;
{------------------------------------------------------------------------------}
function TFrmSolicitudAutorizacion.GetFiltro : string;
var
 sFrom : string;
 sWhere : string;
 sSql : string;
 sInTipoAuto: string;
 subWhere, sInUsuario: string;
 i: integer;
begin
  sWhere := '';
  sInTipoAuto := '';
  subWhere := '';
  sInUsuario := '';

  if fraEmpresaNotaFiltro.IsSelected then
  begin
    sWhere := sWhere + ' and SA_CONTRATO = ' + SqlValue(fraEmpresaNotaFiltro.Contrato);
  end;

  if not IsEmptyString(ppPeriodosDesdeFiltro.Text)  then
  begin
     if not IsEmptyString(ppPeriodosHastaFiltro.Text) then
     begin
       sWhere := sWhere +  ' AND EXISTS (                                            ' +
                  '           SELECT 1                                      ' +
                  '             FROM emi.isp_solicitudautorizperiodo        ' +
                  '            WHERE sp_idsolicitudautorizacion = sa_id     ' +
                  '              AND (sp_periodo >= '+ SqlValue(ppPeriodosDesdeFiltro.Text)   +
                  '              AND  sp_periodo <= '+ SqlValue(ppPeriodosHastaFiltro.Text)   +  '))';
     end else
     begin

       sWhere := sWhere +  ' AND EXISTS (                                            ' +
                  '           SELECT 1                                      ' +
                  '             FROM emi.isp_solicitudautorizperiodo        ' +
                  '            WHERE sp_idsolicitudautorizacion = sa_id     ' +
                  '              AND sp_periodo >= '+ SqlValue(ppPeriodosDesdeFiltro.Text)   +  ')';
     end;
  end
  else begin
    if not IsEmptyString(ppPeriodosHastaFiltro.Text)  then
    begin
       sWhere := sWhere +  ' AND EXISTS (                                            ' +
                  '           SELECT 1                                      ' +
                  '             FROM emi.isp_solicitudautorizperiodo        ' +
                  '            WHERE sp_idsolicitudautorizacion = sa_id     ' +
                  '              AND sp_periodo <= '+ SqlValue(ppPeriodosHastaFiltro.Text)   +  ')';
    end;
  end;

  if edFechaDesde.Date > 0  then
  begin
     if edFechaHasta.Date > 0  then
     begin
       sWhere := sWhere + ' and trunc(SA_FECHAALTA) between '
               + SqlDate(edFechaDesde.Date) + 'and '
               + SqlDate(edFechaHasta.Date);
     end else
     begin
       sWhere := sWhere + ' and trunc(SA_FECHAALTA) >= ' + SqlDate(edFechaDesde.Date);
     end;
  end
  else begin
    if edFechaHasta.Date > 0  then
      sWhere := sWhere + ' and trunc(SA_FECHAALTA) <= ' + SqlDate(edFechaHasta.Date);
  end;

(*
  if edFechaDesde.Date > 0  then
  begin
     if edFechaHasta.Date > 0  then
     begin
       sWhere := sWhere + ' and trunc(SA_FECHAALTA) between '
               + SqlDate(edFechaDesde.Date) + 'and '
               + SqlDate(edFechaHasta.Date);
     end else
     begin
       sWhere := sWhere + ' and trunc(SA_FECHAALTA) >= ' + SqlDate(edFechaDesde.Date);
     end;
  end
  else begin
    if edFechaHasta.Date > 0  then
      sWhere := sWhere + ' and trunc(SA_FECHAALTA) <= ' + SqlDate(edFechaHasta.Date);
  end;
*)  

  if edFechaCumplimientoDesde.Date > 0  then
  begin
     if edFechaCumplimientoHasta.Date > 0  then
     begin
       sWhere := sWhere + ' and trunc(SA_FECHACUMPLIMIENTO) between '
               + SqlDate(edFechaCumplimientoDesde.Date) + 'and '
               + SqlDate(edFechaCumplimientoHasta.Date);
     end else
     begin
       sWhere := sWhere + ' and trunc(SA_FECHACUMPLIMIENTO) >= ' + SqlDate(edFechaCumplimientoDesde.Date);
     end;
  end
  else begin
    if edFechaCumplimientoHasta.Date > 0  then
      sWhere := sWhere + ' and trunc(SA_FECHACUMPLIMIENTO) <= ' + SqlDate(edFechaCumplimientoHasta.Date);
  end;

  if fraAutorizacionRequerimiento.IsSelected then
    sWhere := sWhere + ' and SA_IDNIVELAUTORIZACION = ' + fraAutorizacionRequerimiento.Codigo;

  if fraSolicitud.IsSelected then
    sWhere := sWhere + ' and SA_IDTIPOAUTORIZACION = ' + fraSolicitud.Codigo;

  if chkAutorizadas.Checked then
    sInTipoAuto := sInTipoAuto + iif(sInTipoAuto<>'', ', ', '') + '''A'', ''N''';

  if chkAgendadas.Checked then
    sInTipoAuto := sInTipoAuto + iif(sInTipoAuto<>'', ', ', '') + '''U'', ''O''';

  if not chkExcluirBajas.Checked then
    sInTipoAuto := sInTipoAuto + iif(sInTipoAuto<>'', ', ', '') + '''E'''
  else
    sWhere := sWhere +   ' and sa_fechabaja is null ';

  if chkSinAutorizar.Checked then
  begin
    if (sInTipoAuto = '') then
      sWhere := sWhere +   ' and sa_tipocumplimiento is null '
    else
      sWhere := sWhere + ' and (sa_tipocumplimiento is null  or '
                       + ' sa_tipocumplimiento in (' + sInTipoAuto + ')) ';
  end
  else begin
    if sInTipoAuto <> '' then
      sWhere := sWhere + ' and sa_tipocumplimiento in (' + sInTipoAuto + ') ';
  end;

  if (cmbUsuarioCumplimiento.CheckedCount > 0) then
  begin
    for i:=0 to cmbUsuarioCumplimiento.Items.Count-1 do
    begin
        if cmbUsuarioCumplimiento.Checked[i] then
        begin
          if (sInUsuario <> '') then
            sInUsuario := sInUsuario + ', ';
          sInUsuario := sInUsuario +  SqlValue(cmbUsuarioCumplimiento.Items[i]);
        end;
    end;
    if (sInUsuario <> '') then
      subWhere := subWhere + ' AND SA_USUARIOCUMPLIMIENTO IN (' + sInUsuario + ') ';
  end;

//  if chkDerivadas.Checked then
//    sWhere := sWhere + 'and sa_idautorizacionrelacionada is not null ';

    sSql :=   'SELECT isa.sa_id, ita.ta_descripcion,                ' +
            '       ita.ta_id,                                      ' +
            '       ina.na_descripcion,                             ' +
            '       ina.na_id,                                      ' +
            '       isa.sa_contrato,                                ' +
            '       isa.sa_idmotivo,                                ' +
            '       aem.em_nombre,                                  ' +
            '       (select min(sp_periodo) FROM                    ' +
            '         emi.isp_solicitudautorizperiodo               ' +
            '        WHERE sp_idsolicitudautorizacion = sa_id) sa_periododesde, ' +
//            '        WHERE sp_idsolicitudautorizacion = sa_id and (sp_fechacumplimiento is null or isa.sa_fechacumplimiento is not null)) sa_periododesde, ' +
            '       (select max(sp_periodo) FROM                    ' +
            '         emi.isp_solicitudautorizperiodo               ' +
            '        WHERE sp_idsolicitudautorizacion = sa_id) sa_periodohasta, ' +
//            '        WHERE sp_idsolicitudautorizacion = sa_id and (sp_fechacumplimiento is null or isa.sa_fechacumplimiento is not null)) sa_periodohasta, ' +
            '       isa.sa_fechacumplimiento,                       ' +
            '       isa.sa_tipocumplimiento,                        ' +
            '       decode(isa.sa_tipocumplimiento,                 ' +
            '       ''A'', ''Aprobada'',                            ' +
            '       ''N'', ''No Aprobada'',                         ' +
            '       ''D'', ''Derivada'',                            ' +
            '       ''E'', ''Eliminada'',                           ' +
            '       ''M'', ''Mixto'',                               ' +
            '       ''U'', ''Agendada Aprobación'',                 ' +
            '       ''O'', ''Agendada No Aprobación'',              ' +
            '       ''Pendiente'') Estado,                          ' +
            '       ita.ta_tipoanalisis,                            ' +
            '       ma_descripcion,                                 ' +
            '       ta_prioridad,                                   ' +
            '       isa.sa_observacion,                             ' +
            '       isa.sa_usuariocumplimiento,                     ' +
            '       isa.sa_fechaalta,                               ' +
            '       isa.sa_usualta,                                 ' +
            '       ita.ta_estado                                   ' +
            '  FROM emi.isa_solicitudautorizacion isa,              ' +
            '       afi.aco_contrato aco,                           ' +
            '       afi.aem_empresa aem,                            ' +
            '       emi.ina_nivelautorizacion ina,                  ' +
            '       emi.ita_tipoautorizacion ita,                   ' +
            '       emi.ima_motivoautorizacion                      ' +
            sFrom                                                     +
            ' WHERE (    (aco.co_contrato = isa.sa_contrato)        ' +
            '        AND (aem.em_id = aco.co_idempresa)             ' +
            '        AND (ina.na_id = isa.sa_idnivelautorizacion)   ' +
            '        AND (isa.sa_idmotivo =  ma_id(+))              ' +
            '        AND (ita.ta_id = isa.sa_idtipoautorizacion))   ' +
            sWhere + subWhere;

  if trim (SortDialog.OrderBy) <> '' then
    sSql := sSql + SortDialog.OrderBy
  else
    sSql := sSql + ' order by sa_contrato desc ';

  result := sSql;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text := GetFiltro;
  inherited;
  if (sdqConsulta.RecordCount = 1) then
    Grid.SelectAll;
end;

procedure TFrmSolicitudAutorizacion.FormCreate(Sender: TObject);
begin
//  FIXME.. Descomentar...

//    FNivelUsuario := 3;
  frmAdministracionNominas := nil;

  FNivelUsuario := get_nivelautorizacionusuario(Sesion.LoginName);

  fraEmpresaNotaFiltro.ShowBajas := true;

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

  with fraSolicitud do
  begin
    TableName := 'EMI.ita_tipoautorizacion';
    FieldID := 'TA_ID';
    FieldCodigo := 'TA_ID';
    FieldDesc := 'TA_DESCRIPCION';
    FieldBaja := 'TA_FECHABAJA';
    ShowBajas := false;
  end;

  with fraAutorizacionSuperior do
  begin
    TableName := 'EMI.INA_NIVELAUTORIZACION';
    FieldID := 'NA_ID';
    FieldCodigo := 'NA_ID';
    FieldDesc := 'NA_DESCRIPCION';
    FieldBaja := 'NA_FECHABAJA';
    // FIXME.. LA JERARQUIA NO DEBERIA ESTÁR RELACIONADA CON LA CLAVE
    // PRIMARIA. DEBERÍA SER OTRO ATRIBUTO.
    ExtraCondition := ' NA_ID > ' + SqlValue(FNivelUsuario);
    ShowBajas := false;
  end;

  with fraMotivoAut do
  begin
    TableName := 'EMI.IMA_MOTIVOAUTORIZACION';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_ID';
    FieldDesc := 'MA_DESCRIPCION';
    ShowBajas := false;
  end;

  cmbUsuarioCumplimiento.Clear;
  with GetQuery('SELECT SE_USUARIO, SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABAJA, SE_MAIL ' +
                ' FROM ART.USE_USUARIOS WHERE SE_SECTOR = ' + SqlValue('EMI')) do
  try
   while not Eof do
   begin
    cmbUsuarioCumplimiento.Items.Add(FieldbyName('SE_USUARIO').AsString);
    Next;
   end;
  finally
    Free;
  end;

  inherited;

  tbDerivarAutorizacion.Left := 108;
  tbSelectAll.Left := 109;
  tbObservacion.Left := 110;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqConsulta.FieldByName('sa_tipocumplimiento').IsNull) and
     (sdqConsulta.FieldByName('sa_tipocumplimiento').asstring <> 'E') and
     not IsSolicitudAgendada(sdqConsulta.FieldByName('sa_tipocumplimiento').asstring) then
  begin
    if HighLight then Background := clTeal else Background := $00E1FFFF;
  end;

(*
  if sdqConsulta.FieldByName('sa_tipocumplimiento').asstring = 'D' then
  begin
    if HighLight then Background := clTeal else Background := $00C1D6FF;
  end;
*)

  if IsSolicitudAgendada(sdqConsulta.FieldByName('sa_tipocumplimiento').asstring) then
    if HighLight then Background := clTeal else Background := pnColorSolicitudAgendada.Color
  else
    if sdqConsulta.FieldByName('sa_tipocumplimiento').IsNull and not sdqConsulta.FieldByName('sa_observacion').IsNull then Background := $00C1D6FF;


  if sdqConsulta.FieldByName('sa_tipocumplimiento').AsString = 'E' then
    AFont.Color := clRed;
end;

procedure TFrmSolicitudAutorizacion.LimpiarFiltros;
begin
  fraEmpresaNotaFiltro.clear;
  ppPeriodosDesdeFiltro.Clear;
  ppPeriodosHastaFiltro.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  fraAutorizacionRequerimiento.Clear;
  fraSolicitud.Clear;
//  edNroNota.Clear;
  chkAutorizadas.Checked  := false;
  chkSinAutorizar.Checked := false;
  chkAgendadas.Checked    := false;
//  chkDerivadas.Checked := false;

  ppPeriodosDesdeFiltro.Periodo.MinPeriodo := '199601';
  ppPeriodosDesdeFiltro.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);

  ppPeriodosHastaFiltro.Periodo.MinPeriodo := '199601';
  ppPeriodosHastaFiltro.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);
  cmbUsuarioCumplimiento.Clear;
  edFechaCumplimientoDesde.Clear;
  edFechaCumplimientoHasta.Clear;
end;

procedure TFrmSolicitudAutorizacion.tbLimpiarClick(Sender: TObject);
begin
  LimpiarFiltros;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.ValidarDerivacion;
begin
  VerificarMultiple(['Derivación de autorización',
                      fraAutorizacionSuperior.edCodigo, fraAutorizacionSuperior.IsSelected, 'Debe seleccionar un nivel a derivar',
                      fraAutorizacionSuperior.edCodigo, fraAutorizacionSuperior.Value > FNivelUsuario, 'Debe seleccionar un nivel superior al actual',
                      mObservacionesDerivacion, not IsEmptyString(mObservacionesDerivacion.Text), 'Debe completar los motivos de la derivación'
                    ]);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.GuardarDerivacion;
begin
  if MsgBox('¿Confirma la derivación de la solicitud?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = mrYes then
  begin
    BeginTrans(true);
    try
      do_derivarautorizacion(sdqConsulta.FieldByName('sa_id').AsInteger,
                             fraAutorizacionSuperior.Value,
                             mObservacionesDerivacion.Text);
      CommitTrans(true);
    except
      Rollback(true);
    end;
  end;

  tbRefrescar.Click;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.MostrarDerivacion;
begin
  edtFechaDerivacion.Date := DBDate;
  fraAutorizacionSuperior.Clear;
  mObservacionesDerivacion.Clear;
  fpDerivacionAutorizacion.ShowModal;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.tbDerivarAutorizacionClick(Sender: TObject);
begin
 if (sdqConsulta.RecordCount > 0) and
    (FNivelUsuario >= sdqConsulta.FieldByName('na_id').AsInteger) and
    (sdqConsulta.FieldByName('sa_tipocumplimiento').asstring = '')
 then
 begin
   if sdqConsulta.RecordCount > 0 then MostrarDerivacion;
 end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.btnAceptarDerivacionClick(Sender: TObject);
begin
  inherited;
  ValidarDerivacion;
  GuardarDerivacion;

  fpDerivacionAutorizacion.close;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.btnCancelarDeriviacionClick(
  Sender: TObject);
begin
  inherited;
  fpDerivacionAutorizacion.close;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.ValidarAutorizacion;
begin
  Verificar(not fraMotivoAut.IsSelected, fraMotivoAut, 'Debe seleccionar un motivo.');
//  Verificar((Grid.SelCount = 1) and (sdqConsulta.FieldByName('ta_prioridad').AsInteger >
//            get_prioridadautorizperiodo(sdqConsulta.FieldByName('sa_id').AsInteger)) , edtMotivo, 'El existe una solicitud con mayor prioridad de autorización para el contrato.');
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.MostrarAutorizacion;
begin
  if (sdqConsulta.FieldByName('ta_id').AsInteger = aut_periodo_recalculo) then
  begin
//    IniciarEspera;
    with TfrmPedidoRecalculoDev.Create(self) do
    try
      try
        FormStyle := fsNormal;
        Visible := false;
        SolicitudAutorizacion := self.sdqConsulta.FieldByName('sa_id').AsInteger;
        Contrato := self.sdqConsulta.FieldByName('sa_contrato').AsInteger;
        if not(self.sdqConsulta.FieldByName('sa_tipocumplimiento').IsNull) then
          CargarPedidoFinalizado(self.sdqConsulta.FieldByName('sa_id').AsInteger)
        else
          CargarSolicitud;
//        DetenerEspera;
        ShowModal;
        self.sdqConsulta.Refresh;
      except
        on E : Exception do
        begin
//          DetenerEspera;
          MsgBox('Error al cargar la autorización.' + #13#10 +  E.Message, MB_ICONERROR or MB_OK, 'Aprobación');
        end;
      end;
    finally
      free;
    end;
  end
  else begin
    edtFechaAutorizacion.Date := DBDate;
//    mObservacionAutorizacion.Clear;

    if Is_SeleccionMultipleAutorizacion then
      begin
        pnlBottom.Parent := fpAutorizacionMultiple;

        edtCantSolicitudes.Value := Grid.SelCount;

        fpAutorizacionMultiple.ShowModal;
        sdqConsulta.Refresh;
      end
    else
      begin
        pnlBottom.Parent := fpAutorizacionSimple;

        edtMotivo.Text       := sdqConsulta.FieldByName('ta_descripcion').AsString;
        edtContrato.Text     := sdqConsulta.FieldByName('sa_contrato').AsString;
        edtRazonSocial.Text  := sdqConsulta.FieldByName('em_nombre').AsString;
        edtPeriodoDesde.Text := sdqConsulta.FieldByName('sa_periododesde').AsString;
        edtPeriodoHasta.Text := sdqConsulta.FieldByName('sa_periodohasta').AsString;

        ppPeriodo.Periodo.Valor := edtPeriodoDesde.Text;

        fpAutorizacionSimple.ShowModal;
        sdqConsulta.Refresh;
      end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.tbModificarClick(Sender: TObject);
begin
 if Grid.SelCount = 0 then
 begin
  InvalidMsg(Grid, 'Debe seleccionar alguna autorización');
  abort;
 end;

 if (Grid.SelCount <= 1) and (FNivelUsuario < sdqConsulta.FieldByName('na_id').AsInteger) then
 begin
   MessageDlg('El usuario no tiene el nivel de aprobación requerido.', mtError, [mbOK], 0);
   exit;
 end;

 if (Grid.SelCount <= 1) and (sdqConsulta.FieldByName('sa_tipocumplimiento').AsString = 'E') then
 begin
   MessageDlg('No se puede tomar esta acción si la solicitud está dada de baja', mtError, [mbOK], 0);
   exit;
 end;

 if (Grid.SelCount <= 1) and (sdqConsulta.FieldByName('ta_id').AsInteger <> aut_periodo_recalculo) and not IsSolicitudAgendada(sdqConsulta.FieldByName('sa_tipocumplimiento').asstring) and not sdqConsulta.FieldByName('sa_tipocumplimiento').IsNull then
 begin
   MessageDlg('No se puede tomar esta acción sobre una solicitud ya procesada.', mtError, [mbOK], 0);
   exit;
 end;

 if (Grid.SelCount <= 1) and (sdqConsulta.FieldByName('ta_prioridad').AsInteger >
            get_prioridadautorizperiodo(sdqConsulta.FieldByName('sa_id').AsInteger)) then
 begin
   MessageDlg('El existe una solicitud con mayor prioridad de autorización para el contrato.', mtError, [mbOK], 0);
   exit;
 end;

 MostrarAutorizacion;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.btnNoAutorizarClick(Sender: TObject);
begin
  VCLExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], false);
  fraMotivoAut.ExtraJoinCondition := ' MA_TIPO = ''N''';
  btnAutorizar.Enabled   := false;
  btnNoAutorizar.Enabled := false;
  btnCancelar.Enabled    := false;
  FAutoriza := false;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.btnCancelarClick(Sender: TObject);
begin
  if Is_SeleccionMultipleAutorizacion then
    fpAutorizacionMultiple.close
  else
    fpAutorizacionSimple.close;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.btnAutorizarClick(Sender: TObject);
begin
  VCLExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], false);
  fraMotivoAut.ExtraJoinCondition := ' MA_TIPO = ''A''';
  btnAutorizar.Enabled   := false;
  btnNoAutorizar.Enabled := false;
  btnCancelar.Enabled    := false;
  FAutoriza := true;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.GuardarNoAutorizacion(Agendar: Boolean);
var
  i: integer;
begin
(*
  if (sdqConsulta.FieldByName('ta_tipoanalisis').AsString = 'M') then
    bResult := MsgBox('¿Confirma el RECHAZO de la nómina?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = mrYes
  else
    bResult := MsgBox('¿Confirma la NO APROBACIÓN de la solicitud de autorización?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = mrYes;
*)

  if (MsgBox('¿Confirma el RECHAZO de la nómina?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = mrYes) then
  begin
//    IniciarEspera;
    sdqConsulta.DisableControls;
    for i:=0 to Grid.SelCount-1 do
    try
      Grid.GotoSelection(i);
      if (FNivelUsuario >= sdqConsulta.FieldByName('na_id').AsInteger) and (sdqConsulta.FieldByName('sa_tipocumplimiento').IsNull or IsSolicitudAgendada(sdqConsulta.FieldByName('sa_tipocumplimiento').asstring)) then
      begin
        BeginTrans(true);
        do_aprobarsolicitud (sdqConsulta.FieldByName('sa_id').asinteger, false, fraMotivoAut.Value, mObservacionAutorizacion.Text, Agendar);
        CommitTrans(true);
      end;
    except
      on E : Exception do
      begin
        Rollback(true);
        MsgBox('Error al aplicar aprobación.' + #13#10 +  E.Message, MB_ICONERROR or MB_OK, 'Aprobación');
      end;
    end;
    tbRefrescar.Click;
    sdqConsulta.EnableControls;
//    DetenerEspera;
  end
  else abort;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.GuardarAutorizacion(Agendar: Boolean);
var
  i: integer;
begin
  if MsgBox('¿Confirma la aprobación de la solicitud?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = mrYes then
  begin
//    IniciarEspera;
    sdqConsulta.DisableControls;
    for i:=0 to Grid.SelCount-1 do
    try
      Grid.GotoSelection(i);
      if (FNivelUsuario >= sdqConsulta.FieldByName('na_id').AsInteger) and (sdqConsulta.FieldByName('sa_tipocumplimiento').IsNull or IsSolicitudAgendada(sdqConsulta.FieldByName('sa_tipocumplimiento').asstring)) then
      begin
        BeginTrans(true);
        do_aprobarsolicitud(sdqConsulta.FieldByName('sa_id').asinteger, true , fraMotivoAut.Value, mObservacionAutorizacion.Text, Agendar);
        CommitTrans(true);
      end;
    except
      on E : Exception do
      begin
        Rollback(true);
        MsgBox('Error al aplicar aprobación.' + #13#10 +  E.Message, MB_ICONERROR or MB_OK, 'Aprobación');
      end;
    end;
    tbRefrescar.Click;
    sdqConsulta.EnableControls;
//    DetenerEspera;
  end
  else abort;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.MostrarAutorizaciones(Contrato: integer; Periodo: string);
begin
  tbMostrarFiltros.Down := true;
  fraEmpresaNotaFiltro.Contrato := Contrato;
  ppPeriodosDesdeFiltro.Periodo.Valor := Periodo;
  ppPeriodosHastaFiltro.Periodo.Valor := Periodo;
  tbRefrescar.Click;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.tbNuevoClick(Sender: TObject);
begin
//  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.gbFiltroCollapsed(Sender: TObject);
begin
  pnlFiltros.Visible := False;
  if Visible and Grid.CanFocus then Grid.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.gbFiltroExpanded(Sender: TObject);
begin
  pnlFiltros.Visible := True;
  if Visible then
    SelectNext(pnlFiltros, True, True);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.fpAutorizacionSimpleShow(Sender: TObject);
begin
(*
  if (sdqConsulta.FieldByName('ta_tipoanalisis').AsString = 'M') then
  begin
    btnAutorizar.Caption   := '&Procesar';
    btnNoAutorizar.Caption := '&Rechazar';
  end
  else begin
    btnAutorizar.Caption   := '&Autorizar';
    btnNoAutorizar.Caption := '&No Autorizar';
  end;
*)

  VclExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], true);
  VclExtra.LockControls([edVigDesde, edVigHasta, edBaja, edEstado, edSuss, mskCUITAut, edEjecutivo, edAsesor, edHolding, edEmplContr, edMasaSalarContr,
                         edFInscripcion, edEmplDDJJSel, edMasaSalarDDJJSel, edCodRectifDDJJSel, edFPresentacDDJJSel, edActividad, edEmplDDJJPer,
                         edMasaSalarDDJJPer, edCodRectifDDJJPer, edFPresentacDDJJPer, edDevengadoCuota, edPagadoCuota, edRedondeoPrev, edCantSiniestrosPer,
                         edPorcentajeVarMasa], true);
  VclExtra.LockControls([edtMotivo, edtContrato, edtRazonSocial, edtPeriodoDesde, edtPeriodoHasta, edtCantSolicitudes, edtFechaAutorizacion], true);

  btnAutorizar.Enabled   := true;
  btnNoAutorizar.Enabled := true;
  btnCancelar.Enabled    := true;

  if IsSolicitudAgendada(sdqConsulta.FieldByName('sa_tipocumplimiento').asstring) then
    begin
      if sdqConsulta.FieldByName('sa_tipocumplimiento').asstring = 'U' then  // agendar autorizacion
        btnAutorizarClick(nil)
      else
        btnNoAutorizarClick(nil);

      fraMotivoAut.Value            := sdqConsulta.FieldByName('sa_idmotivo').asinteger;
      mObservacionAutorizacion.Text := sdqConsulta.FieldByName('sa_observacion').asstring;
    end
  else
    begin
      fraMotivoAut.Clear;
      mObservacionAutorizacion.Clear;
    end;

  Do_CargarDatosSelecSimpleAutorizacion;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.tbSelectAllClick(Sender: TObject);
begin
  inherited;
  Grid.SelectAll;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.ValidarNoAutorizacion;
begin
  Verificar(not fraMotivoAut.IsSelected, fraMotivoAut, 'Debe seleccionar un motivo.');
//  Verificar((Grid.SelCount = 1) and (sdqConsulta.FieldByName('ta_prioridad').AsInteger >
//            get_prioridadautorizperiodo(sdqConsulta.FieldByName('sa_id').AsInteger)) , edtMotivo, 'El existe una solicitud con mayor prioridad de autorización para el contrato.');
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.btnAceptarObsClick(Sender: TObject);
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

  if Is_SeleccionMultipleAutorizacion then
    fpAutorizacionMultiple.close
  else
    fpAutorizacionSimple.close;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.btnCancelarObsClick(Sender: TObject);
begin
  VCLExtra.LockControls([gbObservacionesAutorizacion, fraMotivoAut, mObservacionAutorizacion, btnAceptarObs, btnCancelarObs, btnAgendarObs], true);
  btnAutorizar.Enabled := true;
  btnNoAutorizar.Enabled := true;
  btnCancelar.Enabled := true;
  fraMotivoAut.Clear;
  mObservacionAutorizacion.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(frmAdministracionNominas) then
    frmAdministracionNominas.Refrescar;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.Do_CargarDatosSelecSimpleAutorizacion;
begin
  if not Is_SeleccionMultipleAutorizacion then
    begin
      Do_CargarDatosContratoAutorizacion(sdqConsulta.FieldByName('sa_contrato').AsInteger,
                                         sdqConsulta.FieldByName('sa_id').AsInteger);
      Do_CargarDatosUltDDJJAutorizacion(sdqConsulta.FieldByName('sa_contrato').AsInteger,
                                        ppPeriodo.Periodo.Valor);
      Do_CargarDatosCobranza(sdqConsulta.FieldByName('sa_contrato').AsInteger,
                             ppPeriodo.Periodo.Valor);
      Do_CargarDatosSiniestro(sdqConsulta.FieldByName('sa_contrato').AsInteger,
                              ppPeriodo.Periodo.Valor);

      gbDDJJSelec.Visible := (sdqConsulta.FieldByName('ta_estado').AsString = 'D');

      if (FMasaPerSinSac <> 0) then
        edPorcentajeVarMasa.Value := Abs(((FMasaDDJJSelSinSac / FMasaPerSinSac) - 1) * 100)
      else begin
        if FMasaDDJJSelSinSac > 0 then
          edPorcentajeVarMasa.Value := 100
        else
          edPorcentajeVarMasa.Value := 0;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.Do_CargarDatosContratoAutorizacion(Contrato: Integer; IdSolicAutorizacion: TTableId);
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

  sSql := 'SELECT DJ_EMPLEADOS, DJ_MASASALARIAL, DJ_CODIGORECTIFICATIVA, DJ_FECHAPRESENTACION, EMI.UTILES.GET_MASASAL_SINAGUINALDO(DJ_CONTRATO, DJ_MASASALARIAL, DJ_PERIODO) ' +
            'FROM EMI.IDJ_DDJJ ' +
           'WHERE DJ_IDSOLICITUDAUTORIZACION = ' + SqlValue(IdSolicAutorizacion) +
           ' UNION ALL ' +
          'SELECT NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, 0, TRUNC(NP_FECHAALTA), EMI.UTILES.GET_MASASAL_SINAGUINALDO(NO_CONTRATO, NP_TOTALMASASALARIAL, NP_PERIODO) ' +
            'FROM EMI.INO_NOTA, EMI.INP_NOTACONTRATOPERIODO ' +
           'WHERE NP_IDSOLICITUDAUTORIZACION =  ' + SqlValue(IdSolicAutorizacion) +
           ' AND NO_ID = NP_IDNOTA ';

  SqlResults := ValoresColSql(sSql);
  try
    edEmplDDJJSel.Text       := SqlResults[0];
    edMasaSalarDDJJSel.Text  := SqlResults[1];
    edCodRectifDDJJSel.Text  := SqlResults[2];
    edFPresentacDDJJSel.Text := SqlResults[3];
    FMasaDDJJSelSinSac       := StrToFloatDef(SqlResults[4], 0);
  finally
    SqlResults.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.Do_CargarDatosUltDDJJAutorizacion(Contrato: Integer; Periodo: string);
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT DJ_EMPLEADOS, emi.utiles.get_salariodesestacionalizado( ' + SqlValue(Periodo) + ', DJ_PERIODO,  DJ_MASASALARIAL, DJ_CONTRATO), DJ_CODIGORECTIFICATIVA, DJ_FECHAPRESENTACION, DJ_PERIODO, ' +
          '       emi.utiles.get_masasal_sinaguinaldo(DJ_CONTRATO, DJ_MASASALARIAL, DJ_PERIODO) ' +
            'FROM EMI.IDJ_DDJJ ' +
           'WHERE DJ_ID = ' + SqlValue(Get_UltimaIdDeclaracion(Contrato, Periodo));

  SqlResults := ValoresColSql(sSql);
  try
    if (SqlResults.Count > 0) and (SqlResults[0] <> '') then
    begin
      edEmplDDJJPer.Text       := SqlResults[0];
      edMasaSalarDDJJPer.Text  := SqlResults[1];
      edCodRectifDDJJPer.Text  := SqlResults[2];
      FMasaPerSinSac           := StrToFloatDef(SqlResults[5], 0);

      if SqlResults[4] = Periodo then
      begin
        edFPresentacDDJJPer.Text := SqlResults[3];
        lblTipoDevengado.Caption := 'Real'
      end
      else begin
        edFPresentacDDJJPer.Text := '';
        lblTipoDevengado.Caption := 'Estimado';
      end;
      lblPeriodoDDJJ.Caption := SqlResults[4];
    end
    else begin
      sSql := 'SELECT emi.utiles.get_empleados( ' + SqlValue(Contrato) + ', ' + SqlValue(Periodo) + '),  ' +
              '        emi.utiles.get_masa( ' + SqlValue(Contrato) + ', ' + SqlValue(Periodo) + ')  ' +
              'FROM DUAL ';

      SqlResults := ValoresColSql(sSql);
      if SqlResults.Count > 0 then
      begin
        edEmplDDJJPer.Text       := SqlResults[0];
        edMasaSalarDDJJPer.Text  := SqlResults[1];
        edCodRectifDDJJPer.Text  := '';
        edFPresentacDDJJPer.Text := '';
        lblTipoDevengado.Caption := 'Estimado';
        lblPeriodoDDJJ.Caption := 'Contrato';
        FMasaPerSinSac := StrToFloatDef(SqlResults[1], 0);
      end;
    end;
  finally
    SqlResults.Free;
  end;
end;
{------------------------------------------------------------------------------}
function TFrmSolicitudAutorizacion.Is_SeleccionMultipleAutorizacion: Boolean;
begin
  Result := (Grid.SelCount >= 2);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.tbPosteriorPeriodoClick(Sender: TObject);
var
  Periodo: String;
  iValor: integer;
begin
  Periodo := ppPeriodo.Periodo.Valor;

  if (Sender = tbPosteriorPeriodo) then
    begin
      if (Periodo < edtPeriodoHasta.Text) then
        iValor := 1
      else
        exit;
    end
  else
    begin
      if (Periodo > edtPeriodoDesde.Text) then
        iValor := -1
      else
        exit;
    end;

  Periodo := AddPeriodo(Periodo, iValor);

  Do_CargarDatosUltDDJJAutorizacion(sdqConsulta.FieldByName('sa_contrato').AsInteger, Periodo);
  Do_CargarDatosCobranza(sdqConsulta.FieldByName('sa_contrato').AsInteger, Periodo);
  Do_CargarDatosSiniestro(sdqConsulta.FieldByName('sa_contrato').AsInteger, Periodo);

  ppPeriodo.Periodo.Valor := Periodo;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.Do_CargarDatosCobranza(Contrato: Integer; Periodo: string);
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT RC_DEVENGADOCUOTA, RC_PAGOCUOTA+RC_RECUPEROCUOTA, ' +
                 'EMI.EMISION.GET_IMPORTEAJUSTEPREVISTO(RC_CONTRATO, RC_PERIODO) ' +
            'FROM ZRC_RESUMENCOBRANZA ' +
           'WHERE RC_CONTRATO = ' + SqlValue(Contrato) + ' ' +
             'AND RC_PERIODO = ' + SqlValue(Periodo);

  SqlResults := ValoresColSql(sSql);
  try
    edDevengadoCuota.Text := SqlResults[0];
    edPagadoCuota.Text    := SqlResults[1];
    edRedondeoPrev.Text   := SqlResults[2];
  finally
    SqlResults.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.Do_CargarDatosSiniestro(Contrato: Integer; Periodo: string);
begin
  edCantSiniestrosPer.Value := Get_CantSiniestrosPeriodo(Contrato, Periodo);
end;
{------------------------------------------------------------------------------}
function TFrmSolicitudAutorizacion.IsSolicitudAgendada(TipoCumplimiento: String): boolean;
begin
  Result := (Instr('UO', TipoCumplimiento) > 0);
end;
{------------------------------------------------------------------------------}
procedure TFrmSolicitudAutorizacion.tbObservacionClick(Sender: TObject);
begin
  inherited;
  if not sdqConsulta.IsEmpty then
  begin
    with TfrmObservacion.Create(self) do
    try
      Observacion := sdqConsulta.FieldByName('sa_observacion').asstring;
      if (ShowModal = mrOk) then
        EjecutarSqlEx(' update emi.isa_solicitudautorizacion ' +
                      ' set sa_observacion = :observacion ' +
                      ' where sa_id = :id ', [trim(Observacion), self.sdqConsulta.FieldByName('sa_id').AsInteger]);
        sdqConsulta.Refresh;
    finally
      free;
    end;
  end;
end;

end.

