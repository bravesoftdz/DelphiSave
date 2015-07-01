unit unConsultaDictamenesAcusatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, StdCtrls, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales, unFraCtbTablas,
  FieldHider, Mask, ToolEdit, DateComboBox, IntEdit, unFraEmpresa, CurrEdit,
  unArtDbFrame, PatternEdit, unArtDBAwareFrame, CardinalEdit, SinEdit,
  CheckPanel, unFraNormaLegal, ExComboBox, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmConsultaDictamenesAcustorios = class(TfrmCustomConsulta)
    sdqModificacionRegistro: TSDQuery;
    pcFiltrosBusqueda: TPageControl;
    tsGeneralAdm: TTabSheet;
    tsLetrados: TTabSheet;
    tsJuzgados: TTabSheet;
    tsFechas: TTabSheet;
    tsSiniestros: TTabSheet;
    gbOrigenDemanda: TGroupBox;
    edExpedienteSRT: TPatternEdit;
    Label1: TLabel;
    edAnioExpedienteSRT: TPatternEdit;
    fraAreas: TfraCodigoDescripcion;
    Label4: TLabel;
    fraEstado: TfraCodigoDescripcion;
    lblEstadoJuicio: TLabel;
    lblNroExpedienteMediacion: TLabel;
    edNroSumario: TPatternEdit;
    Label2: TLabel;
    fraAbogadosPropios: TfraAbogadosLegales;
    Label3: TLabel;
    fraAbogadoSumariante: TfraAbogadosLegales;
    lblFechaAbogadoSumariante: TLabel;
    fraAreaSRT: TfraCodigoDescripcion;
    lblAreaSRT: TLabel;
    fraFirmanteSRT: TfraCodigoDescripcion;
    lblFirmanteSRT: TLabel;
    tsDACSAL: TTabSheet;
    lblNroDac: TLabel;
    edNroDAC: TPatternEdit;
    lblFechaDAC: TLabel;
    edFechaDacdde: TDateComboBox;
    Label8: TLabel;
    edFechaNotificacionDacdde: TDateComboBox;
    lblDispocisionSAL: TLabel;
    edDisposicionSAL: TPatternEdit;
    lblFechaSal: TLabel;
    edFechaSaldde: TDateComboBox;
    tsGeneralJudicial: TTabSheet;
    fraFuero: TfraCodigoDescripcion;
    lbFuero: TLabel;
    fraJurisdiccion: TfraCodigoDescripcion;
    lbJurisdiccion: TLabel;
    fraJuzgado: TfraCodigoDescripcion;
    lbJuzgado: TLabel;
    fraSecretaria: TfraCodigoDescripcion;
    lbSecretaria: TLabel;
    lblMulta: TLabel;
    edMultaJudicialdde: TCurrencyEdit;
    lblMopresJuidicialdde: TLabel;
    edMopersJudicialdde: TPatternEdit;
    edHonorarioAbogadoPropiodde: TCurrencyEdit;
    edTotaldde: TCurrencyEdit;
    lblTotalCostosGastosDemanda: TLabel;
    edMultaTJdde: TCurrencyEdit;
    edGastosJudicialdde: TCurrencyEdit;
    lblGastosJudicial: TLabel;
    lblMultaTasaJusticia: TLabel;
    edTasaJusticiadde: TCurrencyEdit;
    lblTasaJusticia: TLabel;
    edCostasJudicialdde: TCurrencyEdit;
    lblCostasJudicial: TLabel;
    lblHonorarioAbogado: TLabel;
    CmbSentenciahta: TDateComboBox;
    CmbSentenciadde: TDateComboBox;
    lblFechaSentenciaDesde: TLabel;
    LblFechaCierrehasta: TLabel;
    chkFechadeSentencia: TCheckBox;
    Label5: TLabel;
    edMultaJudicialhta: TCurrencyEdit;
    Label7: TLabel;
    edCostasJudicialhta: TCurrencyEdit;
    Label9: TLabel;
    edGastosJudicialhta: TCurrencyEdit;
    edMopersJudicialhta: TPatternEdit;
    Label10: TLabel;
    Label11: TLabel;
    edTasaJusticiahta: TCurrencyEdit;
    Label12: TLabel;
    edHonorarioAbogadoPropiohta: TCurrencyEdit;
    Label13: TLabel;
    edMultaTJhta: TCurrencyEdit;
    Label14: TLabel;
    edTotalhta: TCurrencyEdit;
    Label15: TLabel;
    edFechaDachta: TDateComboBox;
    Label16: TLabel;
    edFechaNotificacionDachta: TDateComboBox;
    edFechaSalhta: TDateComboBox;
    Label17: TLabel;
    lblFechaAudienciaDescargo: TLabel;
    edFechaAudienciaDescargodde: TDateComboBox;
    Label22: TLabel;
    edFechaAudienciaDescargohta: TDateComboBox;
    lblNroResolucion: TLabel;
    lblFechaResolucion: TLabel;
    lblFechaNotificacionResolucion: TLabel;
    lblMultaSRT: TLabel;
    lblMopresAdministrativo: TLabel;
    edMopresdde: TPatternEdit;
    edMultaSRTdde: TCurrencyEdit;
    edFechaNotificacionResoluciondde: TDateComboBox;
    edFechaResoluciondde: TDateComboBox;
    edNroResolucion: TPatternEdit;
    edFechaResolucionhta: TDateComboBox;
    edFechaNotificacionResolucionhta: TDateComboBox;
    edMultaSRThta: TCurrencyEdit;
    edMopreshta: TPatternEdit;
    Label21: TLabel;
    Label20: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    fraNormaLegalImputada: TfraNormaLegal;
    gbEmpresaRelacionada: TGroupBox;
    fraEmpresaDemandante: TfraEmpresa;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    cbMulta: TCheckBox;
    cbFechaNotifDac: TCheckBox;
    cbFechaAudDesc: TCheckBox;
    cbFNotifRes: TCheckBox;
    Label23: TLabel;
    edFechaFindde: TDateComboBox;
    Label24: TLabel;
    edFechaFinhta: TDateComboBox;
    chkFechadeFin: TCheckBox;
    TotalStatusBar: TStatusBar;
    lbSiniestro: TLabel;
    edSiniestro: TIntEdit;
    sdqConsultaRegistro: TSDQuery;
    ckbDetalleSiniestros: TCheckBox;
    ToolButton1: TToolButton;
    fraArts: TfraCodigoDescripcion;
    lblArts: TLabel;
    Label6: TLabel;
    cbResponsabilidadProvart: TExComboBox;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure DoCarga(Sender: TObject);
    procedure chkFechadeSentenciaClick(Sender: TObject);
    procedure cbMultaClick(Sender: TObject);
    procedure cbFechaNotifDacClick(Sender: TObject);
    procedure cbFechaAudDescClick(Sender: TObject);
    procedure cbFNotifResClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
  private
    FsFields: string;
    FsFrom  : string;
    FsWhere : string;
    procedure CalcularFiltro(var from, where: string);
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
    procedure ChangefraArts(Sender: TObject);
  public
  end;

Const
  FACTOR_MULTIPLICATIVO = 80;

var
  frmConsultaJuiciosEnTramite: TfrmConsultaDictamenesAcustorios;

implementation
uses AnsiSql, unPrincipal, General, dbFuncs, unSesion, StrFuncs,
  unFrmSeguimientoDictamenesAcusatorios, unConstLegales, unDmPrincipal, SDCommon;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.FormCreate(Sender: TObject);
begin
  inherited;

  fraAbogadosPropios.Parte := paPropia;
  fraAbogadoSumariante.Parte := paSumariante;

  with fraEstado do
  begin
    TableName   := 'legales.lej_estadojuicio';
    FieldID     := 'ej_id';
    FieldCodigo := 'ej_id';
    FieldDesc   := 'ej_descripcion';
    ExtraCondition := ' and (ej_etapa like ''%S%'') ';
    Showbajas   := true;
  end;

  with fraAreas do
  begin
    TableName   := 'ART.USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_CODIGO';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas := true;
  end;

  with fraAreaSRT do
  begin
    TableName :=  'LEGALES.LAS_AREASRT';
    FieldID     := 'AS_ID';
    FieldCodigo := 'AS_ID';
    FieldDesc   := 'AS_AREASTR';
    FieldBaja   := 'AS_FECHABAJA';
    ShowBajas := true;
  end;

  with fraFirmanteSRT do
  begin
    TableName :=  'LEGALES.LFS_FIRMANTESRT';
    FieldID     := 'FS_ID';
    FieldCodigo := 'FS_ID';
    FieldDesc   := 'FS_FIRMANTESTR';
    FieldBaja   := 'FS_FECHABAJA';
    ShowBajas := true;
  end;

  with fraFuero do
  begin
    TableName   := 'legales.lfu_fuero';
    FieldID     := 'fu_id';
    FieldCodigo := 'fu_id';
    FieldDesc   := 'fu_descripcion';
    FieldBaja   := 'fu_fechabaja';
    Showbajas   := true;

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
    Showbajas   := true;

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
    Showbajas   := true;

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
    Showbajas   := true;
  end;

  with fraArts do
  begin
    TableName   := 'afi.aar_art';
    FieldID     := 'ar_id';
    FieldCodigo := 'ar_codigosrt';
    FieldDesc   := 'ar_nombre';
    ExtraCondition := ' AND ar_codigosrt IN(''00051'', ''50040'') ';
    FieldBaja   := 'ar_fechabaja';
    Showbajas   := false;
    OnChange    := ChangefraArts;
  end;

  fraArts.Codigo := '00051';

  fraNormaLegalImputada.Init;

  pcFiltrosBusqueda.ActivePageIndex := 0;

  fraEmpresaDemandante.ShowBajas      := True;
  fraEmpresaDemandante.ExtraCondition := '     AND co_contrato = '+
                                         ' (SELECT MAX (b.co_contrato) '+
                                         '    FROM aco_contrato b '+
                                         '   WHERE b.co_idempresa = em_id '+
                                         '     AND NOT EXISTS (SELECT 1 '+
                                         '    FROM art.abc_bajadecontrato '+
                                         '   WHERE b.co_contrato = bc_contrato)) ';

  ckbDetalleSiniestros.Checked := False;
  FsFields:= '';
  FsFrom  := '';
  FsWhere := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.CalcularFiltro(var from, where : string);
begin
////*********************** GENERAL ********************** //////

  if not IsEmptyString(edNroSumario.Text) then
  begin
    Where := Where + ' AND lsu.SU_numerosumario = ' +  edNroSumario.Text;
    exit;
  end;

  if fraAbogadosPropios.IsSelected then
    Where := Where +  ' AND lsu.SU_ABOGADO=' + fraAbogadosPropios.Codigo;

  if fraAbogadoSumariante.IsSelected then
    Where := Where +  ' AND lsu.su_abogadosumariante=' + fraAbogadoSumariante.Codigo;

  if fraEstado.IsSelected then
    Where := Where + ' AND lsu.SU_idestado = ' + fraEstado.Codigo;


  if fraAreas.IsSelected then
    Where := Where + ' AND lsu.SU_area = ' + SqlValue(fraAreas.Codigo);

  if fraAreaSRT.IsSelected then
    Where := Where + ' AND lsu.su_areasrt = ' + fraAreaSRT.Codigo;

  if fraFirmanteSRT.IsSelected then
    Where := Where + ' AND lsu.su_firmantesrt = ' + fraFirmanteSRT.Codigo;

  if not IsEmptyString(edExpedienteSRT.text) then
   Where := Where + ' AND lsu.su_numeroexpediente = ' +  SqlValue(Trim(edExpedienteSRT.text));

  if not IsEmptyString(edAnioExpedienteSRT.text) then
   Where := Where + ' AND lsu.su_anioexpediente = ' +  SqlValue(Trim(edAnioExpedienteSRT.text));

  (*
  if not IsEmptyString(edExpedienteSRT.text) and
    not IsEmptyString(edAnioExpedienteSRT.Text) then
  begin
   Where := Where + ' AND lsu.SU_EXPEDIENTESRT = ' +  SqlValue(Trim(edExpedienteSRT.text) + '/' + Trim(edAnioExpedienteSRT.text));
  end;
  *)

  if fraJurisdiccion.IsSelected then
   Where := Where + ' AND lsu.su_IDJURISDICCION=' + fraJurisdiccion.Codigo;

  if fraFuero.IsSelected then
   Where := Where + ' AND lsu.su_IDFUERO=' + fraFuero.Codigo;

  if fraJuzgado.IsSelected then
   Where := Where + ' AND lsu.su_IDJUZGADO=' + fraJuzgado.Codigo;

  if fraSecretaria.IsSelected then
   Where := Where + ' AND lsu.su_IDSECRETARIA=' + fraSecretaria.Codigo;

  if chkFechadeSentencia.Checked then begin
    Where := Where + ' AND lsu.su_fechaSentencia IS NULL ' + #13#10;
  end else
  if not CmbSentenciaDde.IsEmpty  then begin
    if not CmbSentenciaHta.IsEmpty then begin
          Where := Where + ' AND ' + SqlBetween('lsu.su_fechaSentencia ',CmbSentenciaDde.Date, CmbSentenciaHta.Date);
    end else begin
          Where := Where + ' AND ' + SqlBetween('lsu.su_fechaSentencia ',CmbSentenciaDde.Date, 0);
    end;
  end else if not CmbSentenciaHta.IsEmpty then
    Where := Where + ' AND ' + SqlBetween('lsu.su_fechaSentencia ', 0, CmbSentenciaHta.Date);


  if chkFechadeFin.Checked then begin
    Where := Where + ' AND lsu.su_fechafin IS NULL ' + #13#10;
  end else
  if not edFechaFindde.IsEmpty  then begin
    if not edFechaFinhta.IsEmpty then begin
          Where := Where + ' AND ' + SqlBetween('lsu.su_fechafin ',edFechaFindde.Date, edFechaFinhta.Date);
    end else begin
          Where := Where + ' AND ' + SqlBetween('lsu.su_fechafin ',edFechaFindde.Date, 0);
    end;
  end else if not edFechaFinhta.IsEmpty then
    Where := Where + ' AND ' + SqlBetween('lsu.su_fechafin ', 0, edFechaFinhta.Date);

(*
  if not CmbIniDde.IsEmpty then begin
   if not CmbIniHta.IsEmpty then begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fechainicio',CmbIniDde.Date, CmbIniHta.Date);
   end else begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fechainicio',CmbIniDde.Date, 0);
   end;
  end else begin
   if not CmbIniHta.IsEmpty then begin
       Where := Where + ' AND ' + SqlBetween('lsu.su_fechainicio',0,CmbIniHta.Date);
   end;
  end;
*)

  if cbMulta.Checked then begin
    Where := Where + ' AND lsu.su_multasentecia is null ';
  end else
    if (edMultaJudicialdde.Value <> 0) or (edMultaJudicialhta.Value <> 0) then
      Where := Where + ' AND ' + SqlBetween('lsu.su_multasentecia',edMultaJudicialdde.Value, edMultaJudicialhta.Value);

(*
  if cbFechaMulta.Checked then begin
    Where := Where + ' AND lsu.su_fechamultasentencia IS NULL ' + #13#10;
  end
  else begin
    if not edFechaMultaJudicialdde.IsEmpty then begin
     if not edFechaMultaJudicialhta.IsEmpty then begin
             Where := Where + ' AND ' + SqlBetween('lsu.su_fechamultasentencia',edFechaMultaJudicialdde.Date, edFechaMultaJudicialhta.Date);
     end else begin
             Where := Where + ' AND ' + SqlBetween('lsu.su_fechamultasentencia',edFechaMultaJudicialhta.Date, 0);
     end;
    end else begin
     if not edFechaMultaJudicialhta.IsEmpty then begin
         Where := Where + ' AND ' + SqlBetween('lsu.su_fechamultasentencia',0,edFechaMultaJudicialhta.Date);
     end;
    end;
  end;
 *)
  if (trim(edMopersJudicialdde.Text) <> '') or (trim(edMopersJudicialhta.text) <> '') then
    Where := Where + ' AND ' + SqlBetween('lsu.su_multasentecia', strtoint(edMopersJudicialdde.Text)*FACTOR_MULTIPLICATIVO, strtoint(edMopersJudicialhta.Text)*FACTOR_MULTIPLICATIVO);

  if (edTasaJusticiadde.Value <> 0) or (edTasaJusticiahta.Value <> 0) then
    Where := Where + ' AND ' + SqlBetween('lsu.su_tasasjusticia',edTasaJusticiadde.Value, edTasaJusticiahta.Value);

  if (edCostasJudicialdde.Value <> 0) or (edCostasJudicialhta.Value <> 0) then
    Where := Where + ' AND ' + SqlBetween('lsu.su_costas',edCostasJudicialdde.Value, edCostasJudicialhta.Value);

  if (edGastosJudicialdde.Value <> 0) or (edGastosJudicialhta.Value <> 0) then
    Where := Where + ' AND ' + SqlBetween('lsu.su_gastos',edGastosJudicialdde.Value, edGastosJudicialhta.Value);

  if (edHonorarioAbogadoPropiodde.Value <> 0) or (edHonorarioAbogadoPropiohta.Value <> 0) then
    Where := Where + ' AND ' + SqlBetween('lsu.SU_HONORARIOSABOGADOSPROPIOS',edHonorarioAbogadoPropiodde.Value, edHonorarioAbogadoPropiohta.Value);

  if (edMultaTJdde.Value <> 0) or (edMultaTJhta.Value <> 0) then
    Where := Where + ' AND ' + SqlBetween('lsu.SU_MULTATASASJUSTICIA',edMultaTJdde.Value, edMultaTJhta.Value);

  if (edTotaldde.Value <> 0) or (edTotalhta.Value <> 0) then
    Where := Where + ' AND ' + SqlBetween('lsu.SU_MULTATASASJUSTICIA + lsu.SU_HONORARIOSABOGADOSPROPIOS + lsu.su_gastos + lsu.su_costas + lsu.su_tasasjusticia + lsu.su_multasentecia',
                                edTotaldde.Value, edTotalhta.Value);

  if not IsEmptyString(edNroDAC.Text) then
    Where := Where + ' AND lsu.su_numerodac=' + SqlValue(edNroDAC.Text);

  if not edFechaDacdde.IsEmpty then begin
   if not edFechaDachta.IsEmpty then begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fechadac',edFechaDacdde.Date, edFechaDachta.Date);
   end else begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fechadac',edFechaDacdde.Date, 0);
   end;
  end else begin
   if not edFechaDachta.IsEmpty then begin
       Where := Where + ' AND ' + SqlBetween('lsu.su_fechadac',0,edFechaDachta.Date);
   end;
  end;

  if cbFechaNotifDac.Checked then begin
    Where := Where + ' AND lsu.su_fechanotificaciondac is null ';
  end
  else begin
    if not edFechaNotificacionDacdde.IsEmpty then begin
     if not edFechaNotificacionDachta.IsEmpty then begin
             Where := Where + ' AND ' + SqlBetween('lsu.su_fechanotificaciondac',edFechaNotificacionDacdde.Date, edFechaNotificacionDachta.Date);
     end else begin
             Where := Where + ' AND ' + SqlBetween('lsu.su_fechanotificaciondac',edFechaNotificacionDacdde.Date, 0);
     end;
    end else begin
     if not edFechaNotificacionDachta.IsEmpty then begin
         Where := Where + ' AND ' + SqlBetween('lsu.su_fechanotificaciondac',0,edFechaNotificacionDachta.Date);
     end;
    end;
  end;

  if not IsEmptyString(edDisposicionSAL.Text) then
    Where := Where + ' AND lsu.su_disposicionsal=' + SqlValue(edDisposicionSAL.Text);

  if not edFechaSaldde.IsEmpty then begin
   if not edFechaSalhta.IsEmpty then begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fechasal',edFechaSaldde.Date, edFechaSalhta.Date);
   end else begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fechasal',edFechaSaldde.Date, 0);
   end;
  end else begin
   if not edFechaSalhta.IsEmpty then begin
       Where := Where + ' AND ' + SqlBetween('lsu.su_fechasal',0,edFechaSalhta.Date);
   end;
  end;

  if cbFechaAudDesc.Checked then begin
    Where := Where + ' AND lsu.SU_FECHAAUDIENCIADESCARGO is null ';
  end
  else begin
    if not edFechaAudienciaDescargodde.IsEmpty then begin
     if not edFechaAudienciaDescargohta.IsEmpty then begin
             Where := Where + ' AND ' + SqlBetween('lsu.SU_FECHAAUDIENCIADESCARGO',edFechaAudienciaDescargodde.Date, edFechaAudienciaDescargohta.Date);
     end else begin
             Where := Where + ' AND ' + SqlBetween('lsu.SU_FECHAAUDIENCIADESCARGO',edFechaAudienciaDescargodde.Date, 0);
     end;
    end else begin
     if not edFechaAudienciaDescargohta.IsEmpty then begin
         Where := Where + ' AND ' + SqlBetween('lsu.SU_FECHAAUDIENCIADESCARGO',0,edFechaAudienciaDescargohta.Date);
     end;
    end;
  end;

  if not IsEmptyString(edNroResolucion.Text) then
    Where := Where + ' AND lsu.su_numeroresolucion=' + SqlValue(edNroResolucion.Text);

  if not edFechaResoluciondde.IsEmpty then begin
   if not edFechaResolucionhta.IsEmpty then begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fecharesolucion',edFechaResoluciondde.Date, edFechaResolucionhta.Date);
   end else begin
           Where := Where + ' AND ' + SqlBetween('lsu.su_fecharesolucion',edFechaResoluciondde.Date, 0);
   end;
  end else begin
   if not edFechaResolucionhta.IsEmpty then begin
       Where := Where + ' AND ' + SqlBetween('lsu.su_fecharesolucion',0,edFechaResolucionhta.Date);
   end;
  end;

  if cbFNotifRes.Checked then begin
    Where := Where + ' AND lsu.SU_FECHANOTIFRESOL is null ';
  end
  else begin
    if not edFechaNotificacionResoluciondde.IsEmpty then begin
     if not edFechaNotificacionResolucionhta.IsEmpty then begin
             Where := Where + ' AND ' + SqlBetween('lsu.SU_FECHANOTIFRESOL',edFechaNotificacionResoluciondde.Date, edFechaNotificacionResolucionhta.Date);
     end else begin
             Where := Where + ' AND ' + SqlBetween('lsu.SU_FECHANOTIFRESOL',edFechaNotificacionResoluciondde.Date, 0);
     end;
    end else begin
     if not edFechaNotificacionResolucionhta.IsEmpty then begin
         Where := Where + ' AND ' + SqlBetween('lsu.SU_FECHANOTIFRESOL',0,edFechaNotificacionResolucionhta.Date);
     end;
    end;
  end;

  if (edMultaSRTdde.Value <> 0) or (edMultaSRThta.Value <> 0) then
    Where := Where + ' AND ' + SqlBetween('lsu.SU_MULTASRT',edMultaSRTdde.Value, edMultaSRThta.Value);

  if (trim(edMopresdde.Text) <> '') or (trim(edMopreshta.Text) <> '') then
    Where := Where + ' AND ' + SqlBetween('lsu.SU_MULTASRT', StrToInt(edMopresdde.text)*FACTOR_MULTIPLICATIVO, StrToInt(edMopreshta.Text)*FACTOR_MULTIPLICATIVO);

  if fraNormaLegalImputada.fraNombreNorma.IsSelected
     or fraNormaLegalImputada.fraNorma.IsSelected
     or not IsEmptyString(fraNormaLegalImputada.edArticulo.Text)
     or not IsEmptyString(fraNormaLegalImputada.edInciso.Text)
     or not IsEmptyString(fraNormaLegalImputada.edApartado.Text)
     or not IsEmptyString(fraNormaLegalImputada.edAnexo.Text)
     or not IsEmptyString(fraNormaLegalImputada.edDescripcion.Text)
     or not (fraNormaLegalImputada.edFechaNorma.IsEmpty)
     or not (fraNormaLegalImputada.edFechaPublicacion.IsEmpty)
     or not (fraNormaLegalImputada.edFechaDerogacion.IsEmpty) then
  begin
      From := From + ', LEGALES.LRS_RECLAMOSUMARIO LRS, legales.lno_norma LNO, legales.ltn_tiponorma LTN ';
      Where := Where + ' AND LSU.SU_ID = LRS.RS_IDSUMARIO AND LNO.NO_ID = LRS.RS_IDNORMA AND LNO.NO_IDTIPONORMA = LTN.TN_ID ';
  end;

  if not IsEmptyString(fraNormaLegalImputada.fraNorma.Codigo) then
    Where := Where + ' AND LTN.TN_ID = ' + SqlValue(fraNormaLegalImputada.fraNorma.Codigo);

  if fraNormaLegalImputada.fraNombreNorma.IsSelected then
    Where := Where + ' AND LRS.RS_IDNORMA = ' + SqlValue(fraNormaLegalImputada.fraNombreNorma.Codigo);

(*
  if not IsEmptyString(fraNormaLegalImputada.edDescripcion.Text) then
      Where := Where + ' AND LNO.NO_NRO = ' + SqlValue(fraNormaLegalImputada.edDescripcion.Text);

  if not fraNormaLegalImputada.edFechaNorma.IsEmpty then
      Where := Where + ' AND LNO.NO_FECHANORMA = ' + SqlValue(fraNormaLegalImputada.edFechaNorma.Date);

  if not fraNormaLegalImputada.edFechaPublicacion.IsEmpty then
      Where := Where + ' AND LNO.NO_FECHAPUBLICACION = ' + SqlValue(fraNormaLegalImputada.edFechaPublicacion.Date);

  if not fraNormaLegalImputada.edFechaDerogacion.IsEmpty then
      Where := Where + ' AND LNO.NO_FECHADEROGACION = ' + SqlValue(fraNormaLegalImputada.edFechaDerogacion.Date);
*)
  if not IsEmptyString(fraNormaLegalImputada.edArticulo.Text) then
      Where := Where + ' AND LRS.RS_ARTICULO = ' + SqlValue(fraNormaLegalImputada.edArticulo.Text);

  if not IsEmptyString(fraNormaLegalImputada.edInciso.Text) then
      Where := Where + ' AND LRS.RS_INCISO = ' + SqlValue(fraNormaLegalImputada.edInciso.Text);

  if not IsEmptyString(fraNormaLegalImputada.edApartado.Text) then
      Where := Where + ' AND LRS.RS_APARTADO = ' + SqlValue(fraNormaLegalImputada.edApartado.Text);

  if not IsEmptyString(fraNormaLegalImputada.edanexo.Text) then
      Where := Where + ' AND LRS.RS_ANEXO = ' + SqlValue(fraNormaLegalImputada.edanexo.Text);

  if fraEmpresaDemandante.IsSelected then
  begin
    From := From   + ' ,CTJ_TRABAJADORES, legales.lss_siniestrosumario lss, CMP_EMPRESAS, SEX_EXPEDIENTES EXPE ';
    where := Where + ' AND LSU.SU_ID = lss.SS_IDSUMARIO ';
    where := Where + ' AND MP_CUIT = EX_CUIT';
    where := Where + ' AND TJ_CUIL = EX_CUIL';
    where := Where + ' AND EX_SINIESTRO = lss.ss_siniestro';
    where := Where + ' AND EXPE.ex_orden = lss.ss_orden';
    where := Where + ' AND EXPE.ex_recaida = lss.ss_recaida';
    where := where + ' and MP_CUIT = ' + SqlValue(fraEmpresaDemandante.CUIT);
  end;

  if not IsEmptyString(edSiniestro.Text) then
  begin
    if pos('legales.lss_siniestrosumario', from) = 0 then
      From := From   + ' ,legales.lss_siniestrosumario lss ';
    where := Where + ' AND LSU.SU_ID = lss.SS_IDSUMARIO AND lss.ss_siniestro = ' + SqlValue(edSiniestro.Text);
  end;

  if fraArts.IsSelected then
    where := Where + ' AND LSU.SU_IDART = ' + SqlValue(fraArts.Value);

  if (cbResponsabilidadProvart.ItemIndex > 0) then
    where := Where + ' AND LSU.SU_RESPONSABILIDADPROVINCIA = ' + SqlValue(cbResponsabilidadProvart.Value);
end;

procedure TfrmConsultaDictamenesAcustorios.tbRefrescarClick(Sender: TObject);
var
  sFields,
  sWhere,
  sFrom: String;
begin
  sFields:= FsFields;
  sWhere := FsWhere;
  sFrom  := FsFrom;

  CalcularFiltro(sFrom, sWhere);

  sdqConsulta.SQL.Text :=  'SELECT DISTINCT su_id, su_numerosumario, su_instanciaadministrativa, ' +
                           '                su_registracion, su_numeroexpediente, su_anioexpediente, ' +
                           '                su_area, su_abogado, su_abogadosumariante, su_areasrt, ' +
                           '                su_firmantesrt, su_numerodac, su_fechadac, ' +
                           '                su_fechanotificaciondac, su_disposicionsal, su_fechasal, ' +
                           '                su_numeroresolucion, su_fecharesolucion, su_multasrt, ' +
                           '                su_multasentecia, su_idtiporesultadosentencia, su_costas, ' +
                           '                su_gastos, su_honorariosabogadospropios, su_tasasjusticia, ' +
                           '                su_multatasasjusticia, su_idmesaentradalegal, ' +
                           '                su_idjurisdiccion, su_idfuero, su_idjuzgado, su_idsecretaria, ' +
                           '                su_importereservahonorarios, su_importereserva, ' +
                           '                su_reservahonorariocalculada, su_reservacapitalcalculada, ' +
                           '                su_usuarioaprobacionreservas, su_fechaaprobacionreservas, ' +
                           '                su_montoembargo, su_fechaembargo, su_bloqueado, ' +
                           '                su_fechanotifresol, su_fechasentencia, su_fechafin, ' +
                           '                su_textosentencia, su_fechaalta, su_usualta, su_fechamodif, ' +
                           '                su_usumodif, lju_jurisdiccion.ju_descripcion, ' +
                           '                ljz_juzgado.jz_descripcion, su_idestado, ' +
                           '                lej_estadojuicio.ej_descripcion estado, ' +
                           '                usc.sc_descripcion area, lbo_abogado.bo_nombre abogado, ' +
                           '                abogadosum.bo_nombre abogadosum, tr_descripcion, ' +
                           '                aar.ar_nombre, su_fechanotifbudi, su_fechanotifsentencia, ' +
                           '                (SELECT NVL ' +
                           '                           (  SUM (NVL (ps_importepago, 0)) ' +
                           '                            + SUM (NVL (ps_importeconretencion, 0)), ' +
                           '                            0 ' +
                           '                           ) ' +
                           '                   FROM legales.lps_pagosumario ' +
                           '                  WHERE ps_idsumario = su_id ' +
                           '                    AND ps_estado NOT IN (''A'') ' +
                           '                    AND ps_conpago IN (180, 183)) AS pagoporresolucion, ' +
                           '                su_gpbaincumplimiento, su_fechaincumplimiento, ' +
                           '                NVL2 ' +
                           '                   (su_fechaincumplimiento, ' +
                           '                    ROUND (  su_multasrt ' +
                           '                           / (SELECT am_valorampo ' +
                           '                                FROM art.cam_topeampos cam ' +
                           '                               WHERE am_periodo = ' +
                           '                                        (SELECT MAX (a.am_periodo) ' +
                           '                                           FROM art.cam_topeampos a ' +
                           '                                          WHERE a.am_periodo <= ' +
                           '                                                   TO_CHAR ' +
                           '                                                      (su_fechaincumplimiento, ' +
                           '                                                       ''YYYYMM'' ' +
                           '                                                      ))) ' +
                           '                          ), ' +
                           '                ROUND (su_multasrt / 80) ' +
                           '                   ) mopres ' +
                           sFields +
                           '           FROM legales.lsu_sumario lsu, ' +
                           '                art.usc_sectores usc, ' +
                           '                legales.lej_estadojuicio, ' +
                           '                legales.lbo_abogado, ' +
                           '                legales.lbo_abogado abogadosum, ' +
                           '                legales.lju_jurisdiccion, ' +
                           '                legales.lfu_fuero, ' +
                           '                legales.ljz_juzgado, ' +
                           '                legales.lsc_secretaria, ' +
                           '                legales.ltr_tiporesultadosentencia tiporesultado, ' +
                           '                afi.aar_art aar ' +
                           sFrom +
                           '          WHERE (lsu.su_idjurisdiccion = lju_jurisdiccion.ju_id(+)) ' +
                           '            AND (lsu.su_idfuero = lfu_fuero.fu_id(+)) ' +
                           '            AND (lsu.su_idjuzgado = ljz_juzgado.jz_id(+)) ' +
                           '            AND (lsu.su_idsecretaria = lsc_secretaria.sc_id(+)) ' +
                           '            AND (lsu.su_abogado = lbo_abogado.bo_id(+)) ' +
                           '            AND (lsu.su_abogadosumariante = abogadosum.bo_id(+)) ' +
                           '            AND (lsu.su_idestado = lej_estadojuicio.ej_id(+)) ' +
                           '            AND (lsu.su_idtiporesultadosentencia = tiporesultado.tr_id(+)) ' +
                           '            AND (lsu.su_area = usc.sc_id(+)) ' +
                           '            AND aar.ar_id = lsu.su_idart '+
                           sWhere ;



  sdqConsulta.SQL.Add(SortDialog.OrderBy);
  inherited;

  if sdqConsulta.RecordCount > 0 then
   TotalStatusBar.Panels[1].Text := 'Total de Sumarios Listados: ' + inttostr(sdqConsulta.RecordCount) + '   '
  else
   TotalStatusBar.Panels[1].Text := '';

  if Assigned(Sender) and (sdqConsulta.RecordCount = 1) then
    DoCarga(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.tbNuevoClick(Sender: TObject);
begin
  with TfrmSeguimientoDictamenesAcusatorios.Create( Self ) do
  Try
    if AltaDictamen and sdqConsulta.Active then  sdqConsulta.Refresh;
  finally
    Free;
  end;
end;


{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.tbModificarClick(Sender: TObject);
begin
  DoCarga(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edNroSumario.Text := '';
  edExpedienteSRT.Text := '';
  edAnioExpedienteSRT.Text := '';

  fraAbogadosPropios.Codigo := '';
  fraAbogadoSumariante.Codigo := '';
  fraEstado.Codigo := '';
  fraAreas.Codigo := '';
  fraAreaSRT.Codigo := '';
  fraFirmanteSRT.Codigo := '';
  fraJurisdiccion.Codigo := '';
  fraFuero.Codigo := '';
  fraJuzgado.Codigo := '';
  fraSecretaria.Codigo := '';

//  CmbIniDde.Date := 0;
//  CmbIniHta.Date := 0;

  CmbSentenciahta.Date := 0;
  CmbSentenciadde.Date := 0;
  edFechaFindde.Clear;
  edFechaFinhta.Clear;
  chkFechadeSentencia.Checked := false;
  chkFechadeFin.Checked := false;

  edMultaJudicialdde.Clear;
  edMopersJudicialdde.Clear;
  edCostasJudicialdde.Clear;
  edHonorarioAbogadoPropiodde.Clear;
  edTotaldde.Clear;
  edMultaJudicialhta.Clear;
  edMopersJudicialhta.Clear;
  edCostasJudicialhta.Clear;
  edHonorarioAbogadoPropiohta.Clear;
  edTotalhta.Clear;
  cbMulta.Checked := false;
  edTasaJusticiadde.Clear;
  edGastosJudicialdde.Clear;
  edMultaTJdde.Clear;
  edTasaJusticiahta.Clear;
  edGastosJudicialhta.Clear;
  edMultaTJhta.Clear;

  fraNormaLegalImputada.Limpiar;
  fraEmpresaDemandante.Clear;

  edFechaNotificacionDacdde.Date := 0;
  edFechaNotificacionDachta.Date := 0;
  edFechaDacdde.Clear;
  edFechaDachta.Clear;
  edDisposicionSAL.Clear;
  edFechaSaldde.Clear;
  edFechaSalhta.Clear;
  edFechaAudienciaDescargodde.Clear;
  edFechaAudienciaDescargohta.Clear;

  cbFechaNotifDac.Checked := false;
  cbFechaAudDesc.Checked := false;
  edNroResolucion.Clear;
  edFechaResoluciondde.Clear;
  edNroDAC.Clear;
  edFechaResolucionhta.Clear;
  edFechaNotificacionResoluciondde.Clear;
  edFechaNotificacionResolucionhta.Clear;
  cbFNotifRes.Checked := false;
  edMultaSRTdde.Clear;
  edMultaSRThta.Clear;
  edMopresdde.Clear;
  edMopreshta.Clear;
  edSiniestro.Clear;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.DoCarga(Sender: TObject);
begin
  if NOT sdqConsulta.IsEmpty then
  begin
    with TfrmSeguimientoDictamenesAcusatorios.Create( Self ) do
    Try
      sdqModificacionRegistro.ParamByName('SU_id').AsInteger := sdqConsulta.FieldByName('SU_id').AsInteger;
      try
        sdqModificacionRegistro.Open;
//        GuardarInfoBloqueo(sdqConsulta.FieldByName('su_id').AsInteger, 'S', Sesion.LoginName);
        ModificacionDictamen(sdqModificacionRegistro);
//        BeginTrans(true);
//        EliminarInfoBloqueo(dmPrincipal, sdqConsulta.FieldByName('su_id').AsInteger, 'S', Sesion.LoginName);
//        CommitTrans(true);
      except
        on E : ESDEngineError do
        begin
          if E.NativeError = 54 then
          begin
            Rollback(true);
            MessageDlg('El registro está siendo utilizado por el usuario ' +
//            GetInfoBloqueo(sdqConsulta.FieldByName('su_id').AsInteger, 'S') +
            '.' + #13#10 + 'Por esa razón no podrá guardar ningún cambio.', mtWarning, [mbOK], 0);
            sdqConsultaRegistro.ParamByName('su_id').AsInteger := sdqConsulta.FieldByName('su_id').AsInteger;
            sdqConsultaRegistro.Open;
            ConsultaDictamen(sdqConsultaRegistro);
          end;
        end;
      end;
    finally
      sdqModificacionRegistro.Close;
      sdqConsultaRegistro.Close;
      sdqConsulta.Refresh;
      Free;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaDictamenesAcustorios.ChangeFuero(Sender: TObject);
begin
 if fraJurisdiccion.IsSelected and fraFuero.IsSelected then begin
  with fraJuzgado do
  begin
    TableName   := 'legales.ljz_juzgado';
    FieldID     := 'jz_id';
    FieldCodigo := 'jz_id';
    FieldDesc   := 'jz_descripcion';
    ExtraCondition := 'and jz_idjurisdiccion = ' + SqlValue(strtoint(fraJurisdiccion.Codigo)) +  ' and jz_idfuero = ' +  SqlValue(strtoint(fraFuero.Codigo));
  end;
 end;
end;

procedure TfrmConsultaDictamenesAcustorios.ChangeJuzgado(Sender: TObject);
begin
 if fraJuzgado.IsSelected then begin
  with fraSecretaria do
  begin
    TableName   := 'legales.lsc_secretaria';
    FieldID     := 'sc_id';
    FieldCodigo := 'sc_id';
    FieldDesc   := 'sc_descripcion';
    ExtraCondition := 'and sc_idjuzgado = ' + SqlValue(strtoint(fraJuzgado.Codigo));
  end;
 end;
end;

procedure TfrmConsultaDictamenesAcustorios.ChangeJurisdiccion(
  Sender: TObject);
begin
 if fraJurisdiccion.IsSelected then
 with fraFuero do
 begin
      fraFuero.Codigo := '';
      TableName   := 'legales.lfu_fuero';
      FieldID     := 'fu_id';
      FieldCodigo := 'fu_id';
      FieldDesc   := 'fu_descripcion';
      ExtraCondition := ' and fu_id in (select jz_idfuero from LEGALES.LJZ_JUZGADO where jz_idjurisdiccion = ' + SqlValue(strtoint(fraJurisdiccion.Codigo))+ ')';
      OnChange := ChangeFuero;
 end;

 if fraJurisdiccion.IsSelected and fraFuero.IsSelected then
 with fraJuzgado do
 begin
    fraJuzgado.Codigo := '';
    TableName   := 'legales.ljz_juzgado';
    FieldID     := 'jz_id';
    FieldCodigo := 'jz_id';
    FieldDesc   := 'jz_descripcion';
    ExtraCondition := 'and jz_idjurisdiccion = ' + SqlValue(strtoint(fraJurisdiccion.Codigo)) +  ' and jz_idfuero = ' +  SqlValue(strtoint(fraFuero.Codigo));
 end;

end;
procedure TfrmConsultaDictamenesAcustorios.chkFechadeSentenciaClick(
  Sender: TObject);
begin
  inherited;
  if chkFechadeSentencia.Checked then
  begin
      CmbSentenciadde.Date := 0;
      CmbSentenciahta.Date := 0;
  end
end;

procedure TfrmConsultaDictamenesAcustorios.cbMultaClick(Sender: TObject);
begin
  inherited;
  if cbMulta.Checked then begin
    edMultaJudicialdde.Value := 0;
    edMultaJudicialhta.Value := 0;
  end;
end;

procedure TfrmConsultaDictamenesAcustorios.cbFechaNotifDacClick(
  Sender: TObject);
begin
  inherited;
  if cbFechaNotifDac.Checked then begin
    edFechaNotificacionDacdde.Date := 0;
    edFechaNotificacionDachta.Date := 0;
  end;
end;

procedure TfrmConsultaDictamenesAcustorios.cbFechaAudDescClick(
  Sender: TObject);
begin
  inherited;
  if cbFechaAudDesc.Checked then begin
    edFechaAudienciaDescargodde.Date := 0;
    edFechaAudienciaDescargohta.Date := 0;
  end;
end;

procedure TfrmConsultaDictamenesAcustorios.cbFNotifResClick(
  Sender: TObject);
begin
  inherited;
  if cbFNotifRes.Checked then begin
    edFechaNotificacionResoluciondde.Date := 0;
    edFechaNotificacionResolucionhta.Date := 0;
  end;
end;

procedure TfrmConsultaDictamenesAcustorios.tbExportarClick(
  Sender: TObject);
var
  c: integer;
begin
  exportDialog.Fields.Clear;

  if ckbDetalleSiniestros.Checked then
  begin
    for c := 37 to Grid.Columns.Count-1 do
      Grid.Columns[c].Visible := true;

    FsFields := ', ' +
                'ex_siniestro, ' +
                'ex_orden, ' +
                'ex_recaida, ' +
                'mp_contrato, ' +
                'mp_cuit, ' +
                'mp_nombre, ' +
                'tj_cuil, ' +
                'tj_nombre, ' +
                'ex_diagnostico, ' +
                'ex_fechaaccidente, ' +
                'ex_bajamedica, ' +
                'ex_fecharecaida, ' +
                'ex_altamedica, ' +
                'tb_descripcion ';

    FsFrom := ', ' +
              'ctb_tablas, ' +
              'ctj_trabajadores, ' +
              'cmp_empresas, ' +
              'sex_expedientes expe, ' +
              'legales.lss_siniestrosumario lss ';

    FsWhere:= ' AND NVL (ex_tipo, ''1'') = tb_codigo(+) ' +
              ' AND tb_clave = ''STIPO'' ' +
              ' AND mp_cuit = ex_cuit ' +
              ' AND tj_cuil = ex_cuil ' +
              ' AND ex_siniestro = lss.ss_siniestro ' +
              ' AND expe.ex_orden = lss.ss_orden ' +
              ' AND expe.ex_recaida = lss.ss_recaida ' +
              ' AND lss.ss_idsumario = su_id ';

  end
  else begin
    FsFields := ', ' +
                'null ex_siniestro, ' +
                'null ex_orden, ' +
                'null ex_recaida, ' +
                'null mp_contrato, ' +
                'null mp_cuit, ' +
                'null mp_nombre, ' +
                'null tj_cuil, ' +
                'null tj_nombre, ' +
                'null ex_diagnostico, ' +
                'null ex_fechaaccidente, ' +
                'null ex_bajamedica, ' +
                'null ex_fecharecaida, ' +
                'null ex_altamedica, ' +
                'null tb_descripcion ';
  end;
  tbRefrescarClick(Sender);

  inherited;

  if ckbDetalleSiniestros.Checked then
  begin
    for c := 37 to Grid.Columns.Count-1 do
      Grid.Columns[c].Visible := false;

    FsFields:= '';
    FsFrom  := '';
    FsWhere := '';

    ckbDetalleSiniestros.Checked := false;
    tbRefrescarClick(Sender);
  end

end;

procedure TfrmConsultaDictamenesAcustorios.ChangefraArts(Sender: TObject);
begin
  if (fraArts.Value = CODIGO_ART_PROVINCIA) then
    cbResponsabilidadProvart.ItemIndex := 0;

  cbResponsabilidadProvart.Enabled := (fraArts.Value <> CODIGO_ART_PROVINCIA);
end;

end.

