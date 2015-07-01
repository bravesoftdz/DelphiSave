{----------------------------------------------------------------------------------------------------------------------
   Modulo de consulta General de Asuntos judiciales.
   Desde este modulo se administra la carga de Asuntos Judiciales.
   Autor: EVila.

   Modificado:
   FFirenze 29/05/2003
----------------------------------------------------------------------------------------------------------------------}
unit unConsultaAdminstracionJuicio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales,
  unFraCtbTablas, FieldHider, Mask, ToolEdit, DateComboBox, IntEdit, unFraEmpresa, CurrEdit, unArtDbFrame, PatternEdit,
  unArtDBAwareFrame, ExComboBox;

type
  TfrmConsultaAdminstracionJuicio = class(TfrmCustomConsulta)
    lbCaratula: TLabel;
    edCaratula: TEdit;
    lbNroOrden: TLabel;
    edNroOrden: TEdit;
    lbTipo: TLabel;
    lbAbogado: TLabel;
    fraAbogados: TfraAbogadosLegales;
    fraTipo: TfraCtbTablas;
    fraFuero: TfraCtbTablas;
    fraEstado: TfraCtbTablas;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    fraEmpresaGestion: TfraEmpresa;
    edGD_JUZGADO: TIntEdit;
    lbJuzgado: TLabel;
    lbSecretaria: TLabel;
    edGD_SECRETARIA: TIntEdit;
    CmbIniHta: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    CmbIniDde: TDateComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LblCierrehta: TLabel;
    CmbCierrehta: TDateComboBox;
    CmbCierredde: TDateComboBox;
    fraGestor: TfraCodigoDescripcion;
    lbGestor: TLabel;
    Label1: TLabel;
    edFechaAsignDesde: TDateComboBox;
    Label10: TLabel;
    edFechaAsignHasta: TDateComboBox;
    lbCartera: TLabel;
    edCartera: TIntEdit;
    Label11: TLabel;
    edImpReclaDesde: TCurrencyEdit;
    Label12: TLabel;
    edImpReclaHasta: TCurrencyEdit;
    Label13: TLabel;
    edImpDemaDesde: TCurrencyEdit;
    Label14: TLabel;
    edImpDemaHasta: TCurrencyEdit;
    lbUltEvento: TLabel;
    fraUltimoEvento: TfraCtbTablas;
    tbSumatoria: TToolButton;
    tbSeparador: TToolButton;
    StaticText1: TStaticText;
    Label15: TLabel;
    Label16: TLabel;
    edDeudaNADesde: TCurrencyEdit;
    edDeudaNAHasta: TCurrencyEdit;
    Label17: TLabel;
    fraMotivoDevol: TfraCtbTablas;
    ShortCutControl1: TShortCutControl;
    tbVerUsuarioAlta: TToolButton;
    tbSeparador2: TToolButton;
    chkSoloActivos: TCheckBox;
    tbSeparador3: TToolButton;
    Label18: TLabel;
    edDeudaTotActDesde: TCurrencyEdit;
    Label19: TLabel;
    edDeudaTotActHasta: TCurrencyEdit;
    fraJurisdiccion: TfraCodigoDescripcion;
    chkSoloContrActivos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure DoCargaAdministracionJuicio(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure QueryPrintGetSubTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbVerUsuarioAltaClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;  AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fraEmpresaGestionChange(Sender: TObject);
  private
    FTotales: Array[0..3] of Extended;

    procedure CalcularSumatoria;
    function IsBaja: Boolean;
  public
  end;

var
  frmConsultaAdminstracionJuicio: TfrmConsultaAdminstracionJuicio;

implementation

uses
	AnsiSql, unPrincipal, unABMAdminstracionJuicio, unRPTJudicial, General, dbFuncs,
  unSesion, SqlFuncs, unDmPrincipal, CustomDlgs, StrFuncs;

const
	CamposSumatoria: Array[0..3] of String = ('GD_IMPORTEDEMANDADO', 'GD_IMPORTERECLAMADO', 'GD_IMPORTESENTENCIA', 'TOTGS' );

{$R *.DFM}

procedure TfrmConsultaAdminstracionJuicio.FormCreate(Sender: TObject);
begin
  inherited;
//  IMG_FILTROS_SHOW      := 10;
//  IMG_FILTROS_HIDE      := 11;
  fraTipo.Clave         := 'TIPGD';
  fraFuero.Clave        := 'FUERO';
  with fraJurisdiccion do
  begin
    TableName   := 'legales.lju_jurisdiccion';
    FieldID     := 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc   := 'ju_descripcion';
    FieldBaja   := 'ju_fechabaja';
    ShowBajas := true;
  end;
  fraEstado.Clave       := 'LGEST';
  fraUltimoEvento.Clave := 'EVEGD';

  with fraEmpresaGestion do
  begin
    ShowBajas   := True;
    UltContrato := True;
    OnChange    := fraEmpresaGestionChange;
  end;

  with fraGestor do
  begin
    TableName   := 'AGE_GESTORCUENTA';
    FieldID     := 'GE_CODGESTOR';
    FieldCodigo := 'GE_CODGESTOR';
    FieldDesc   := 'GE_NOMBRE';
  end;
{
Ejemplo para la creacion de un Frame utilizando el unFraCodigoDescripcion

  fraMotivo.FieldID     := '';
  fraMotivo.TableName   := '';
  fraMotivo.FieldCodigo := '';
  fraMotivo.FieldDesc   := '';

Ejemplo para modificar el Sql de un fra...
  fraMotivo.Sql := 'SELECT ID AS ' + CD_ALIAS_ID + ', '+
                           'CODIGO AS ' + CD_ALIAS_CODIGO + ', '+
                           'DESCRIPCION AS '+ CD_ALIAS_DESC +', '+
                           'BAJA AS '+ CD_ALIAS_BAJA +' FROM XXXXXX';
}
  tbSeparador.Left := 360;
  tbSumatoria.Left := 360;

  tbSeparador2.Left     := 360;
  tbVerUsuarioAlta.Left := 360;

  fraMotivoDevol.Clave := 'LGMDV';
  fraMotivoDevol.ShowBajas := True;
  fraMotivoDevol.ExtraCondition := ' AND tb_codigo <> ''0'' ';

  fraAbogados.Parte := paPropia;
end;

procedure TfrmConsultaAdminstracionJuicio.tbRefrescarClick(Sender: TObject);
var
  sSql,
  sWhere,
  sWhereAbo,
  sWhereAbo2: String;
begin
	sWhereAbo  := '';
  sWhereAbo2 := '';
  if fraAbogados.Codigo <> '' then
  begin
  	sWhereAbo  := ' AND ABO.BO_ID = ' + SqlString(fraAbogados.Codigo, True);
    sWhereAbo2 := ' AND 1=2';
  end;

  if fraTipo.Value <> '' then
    sWhere := sWhere + ' AND GES.GD_TIPO = '+ SqlString( fraTipo.Value, True );
  if fraEmpresaGestion.IsSelected then
    sWhere := sWhere + ' AND GES.GD_CONTRATO = '+ SqlValue( fraEmpresaGestion.Contrato);
  if fraFuero.Value <> '' then
    sWhere := sWhere + ' AND GES.GD_FUERO = '+ SqlString( fraFuero.Value, True );
  if fraJurisdiccion.IsSelected then
    sWhere := sWhere + ' AND GES.GD_JURISDICCION = '+ SqlString( fraJurisdiccion.Codigo, True );
  if fraEstado.Value <> '' then
    sWhere := sWhere + ' AND GES.GD_ESTADO = '+ SqlString( fraEstado.Value, True );
  if fraUltimoEvento.Value <> '' then
    sWhere := sWhere + ' AND LEGALES.GET_MAXEVENTOGD(GES.GD_NROORDEN) = '+ SqlString( fraUltimoEvento.Value, True );
  if edCaratula.Text <> '' then
    sWhere := sWhere + ' AND GES.GD_CARATULA LIKE ''%'+ edCaratula.Text + '%'' ';
  if edNroOrden.Text <> '' then
    sWhere := sWhere + ' AND GES.GD_NROORDEN = '+ SqlString( edNroOrden.Text );
  if edGD_JUZGADO.Text <> '' then
    sWhere := sWhere + ' AND GES.GD_JUZGADO = '+ SqlString( edGD_JUZGADO.Text,false );
  if edGD_SECRETARIA.Text <> '' then
    sWhere := sWhere + ' AND GES.GD_SECRETARIA = '+ SqlString( edGD_SECRETARIA.Text,false );

  if not CmbIniDde.IsEmpty then
    if not CmbIniHta.IsEmpty then
    	sWhere := sWhere + ' AND ' + SqlBetween('GD_FECHAINICIO',CmbIniDde.Date, CmbIniHta.Date)
    else
    	sWhere := sWhere + ' AND ' + SqlBetween('GD_FECHAINICIO',CmbIniDde.Date, 0)
  else
  	if not CmbIniHta.IsEmpty then
    	sWhere := sWhere + ' AND ' + SqlBetween('GD_FECHAINICIO',0,CmbIniHta.Date);

  if not CmbCierreDde.IsEmpty  then
  	if not CmbCierreHta.IsEmpty then
    	sWhere := sWhere + ' AND ' + SqlBetween('GD_FECHATERMINADO',CmbCierreDde.Date, CmbCierreHta.Date)
    else
    	sWhere := sWhere + ' AND ' + SqlBetween('GD_FECHATERMINADO',CmbCierreDde.Date, 0)
  else
  	if not CmbCierreHta.IsEmpty then
   		sWhere := sWhere + ' AND ' + SqlBetween('GD_FECHATERMINADO', 0, CmbCierreHta.Date);

  if fraGestor.IsSelected then
  	sWhere := sWhere + ' AND GD_GESTOR = ' + SqlValue(fraGestor.Value);

  sWhere := sWhere + SqlBetween(' AND GD_FECHAASIGN', edFechaAsignDesde.Date, edFechaAsignHasta.Date);

  if not edCartera.IsEmpty then
  	sWhere := sWhere + ' AND GD_CARTERA = ' + SqlValue(edCartera.Value);

  if (edDeudaNAHasta.Value > 0) and (edDeudaNADesde.Value <= edDeudaNAHasta.Value) then
  	sWhere := sWhere + ' AND deuda.get_totaldeuda (aco.co_contrato) >= ' + sqlValue(edDeudaNADesde.Value) +
                       ' AND deuda.get_totaldeuda (aco.co_contrato) <= ' + sqlValue(edDeudaNAHasta.Value);

  if fraMotivoDevol.IsSelected then
  	sWhere := sWhere + ' AND GD_MOTIVODEVOLUCION = ' + sqlValue(fraMotivoDevol.Value);

  sWhere := sWhere + SqlBetween(' AND GD_IMPORTERECLAMADO ',  edImpReclaDesde.Value, edImpReclaHasta.Value);
  sWhere := sWhere + SqlBetween(' AND GD_IMPORTEDEMANDADO ',  edImpDemaDesde.Value, edImpDemaHasta.Value);
  sWhere := sWhere + SqlBetween(' AND DEUDA.GET_DEUDATOTALCONSOLIDADA (ACO.CO_CONTRATO, NULL, ACTUALDATE, ''S'') ',  edDeudaTotActDesde.Value, edDeudaTotActHasta.Value);

  sWhere := sWhere + Iif(chkSoloActivos.Checked, ' AND GD_FECHABAJA IS NULL', '') +
                     Iif(chkSoloContrActivos.Checked, ' AND ACO.CO_ESTADO = ''1''', '');

  sSql := 'Select ges.gd_nroorden, gd_tipo, tip.tb_descripcion As desc_tipo, ges.gd_cuit, ' +
          '       aem.em_nombre As nombre, aco.co_contrato As contrato, ' +
          '       ges.gd_caratula As caratula, ges.gd_abogado, abo.bo_nombre As abogado, ' +
          '       ges.gd_fuero As cod_fuero, fue.tb_descripcion As fuero, ' +
          '       ges.gd_secretaria As secretaria, ges.gd_juzgado As juzgado, ' +
          '       ges.gd_jurisdiccion As cod_jurisdiccion, ' +
          '       ges.gd_motivodevolacobranzas motivodevolacobranzas, ' +
          '       ju_descripcion As jurisdiccion, ges.gd_fechainicio, ' +
          '       ges.gd_importedemandado, ges.gd_estado As cod_estado, ' +
          '       est.tb_descripcion As estado, ges.gd_fechaterminado, ' +
          '       ges.gd_abogadodemandada As abo_demanadada, ges.gd_importesentencia, ' +
          '       ges.gd_gestor, Null As gestor, ges.gd_fechaasign, ' +
          '       ges.gd_importereclamado, ges.gd_cartera, ' +
          '       dev.tb_descripcion As mot_devol, ' +
          '       ultevent.tb_descripcion As maxevento, ' +
          '       legales.get_maxobsgd (ges.gd_nroorden) As maxobs, ' +
          '       legales.get_totgsgd (ges.gd_nroorden) As totgs, gd_contrato, ' +
          '	      legales.get_fechaconcurso (aem.em_cuit) As concurso, ' +
          '       legales.get_fechaquiebra (aem.em_cuit) As quiebra, ' +
          '	      deuda.get_deudatotalconsolidada (aco.co_contrato, null, null, ''S'') As deuda_nom_actual, ' +
          '	      deuda.get_deudatotalconsolidada (aco.co_contrato, null, actualdate, ''S'') As deuda_tot_actual, ' +
          '       gd_motivodevolucion,  dev.tb_descripcion motivodevol, ' +
          '       ges.gd_usualta usualta, trunc(ges.gd_fechaalta) fechaalta, ' +
          '       ges.gd_usumodif usumodif, trunc(ges.gd_fechamodif) fechamodif, ' +
          '       ges.gd_usubaja, ges.gd_fechabaja, ges.gd_deudanominal, ges.gd_intereses ' +
          '  From AEM_EMPRESA aem, ' +
          '  	    ACO_CONTRATO aco, ' +
          '       CTB_TABLAS tip, ' +
          '       legales.LBO_ABOGADO abo, ' +
          '       legales.lju_jurisdiccion, ' +
          '       CTB_TABLAS fue, ' +
          '       CTB_TABLAS est, ' +
          '       CTB_TABLAS ultevent, ' +
          '	      CTB_TABLAS dev, ' +
          '       LGD_GESTIONDEUDA ges ' +
          ' Where ges.gd_abogado = abo.bo_id ' +
          '   And ges.gd_contrato = aco.co_contrato ' +
          '   And aem.em_id = aco.co_idempresa ' +
          '   And ges.gd_tipo = tip.tb_codigo ' +
          '   And tip.tb_clave = ''TIPGD'' ' +
          '   And ges.gd_fuero = fue.tb_codigo(+) ' +
          '   And fue.tb_clave(+) = ''FUERO'' ' +
          '   And ges.gd_jurisdiccion = ju_id(+) ' +
          '   And ges.gd_estado = est.tb_codigo ' +
          '   And est.tb_clave = ''LGEST'' ' +
          '   And ultevent.tb_clave(+) = ''EVEGD'' ' +
          '   And ges.gd_motivodevolucion = dev.tb_codigo(+) ' +
          '   And dev.tb_clave(+) = ''LGMDV'' ' +
          '   And legales.get_maxeventogd (ges.gd_nroorden) = ultevent.tb_codigo(+) ' +
          '   And ges.gd_abogado Is Not Null ' +
              sWhere +
              sWhereAbo +
          ' Union All ' +
          'Select ges.gd_nroorden As nro_orden, gd_tipo, tip.tb_descripcion As desc_tipo, ' +
          '       ges.gd_cuit, aem.em_nombre As nombre, aco.co_contrato As contrato, ' +
          '       ges.gd_caratula As caratula, ges.gd_abogado, Null As abogado, ' +
          '       ges.gd_fuero As cod_fuero, Null As fuero, ' +
          '       ges.gd_secretaria As secretaria, ges.gd_juzgado As juzgado, ' +
          '       ges.gd_jurisdiccion As cod_jurisdiccion, ' +
          '       ges.gd_motivodevolacobranzas motivodevolacobranzas, ' +
          '       Null As jurisdiccion, ges.gd_fechainicio, ges.gd_importedemandado, ' +
          '       ges.gd_estado As cod_estado, est.tb_descripcion As estado, ' +
          '       ges.gd_fechaterminado, ges.gd_abogadodemandada As abo_demanadada, ' +
          '       ges.gd_importesentencia, ges.gd_gestor, age.ge_nombre As gestor, ' +
          '       ges.gd_fechaasign, ges.gd_importereclamado, ges.gd_cartera, ' +
          '	      dev.tb_descripcion As mot_devol, ' +
          '       ultevent.tb_descripcion As maxevento, ' +
          '       art.legales.get_maxobsgd (ges.gd_nroorden) As maxobs, ' +
          '       art.legales.get_totgsgd (ges.gd_nroorden) As totgs, gd_contrato, ' +
          '	      legales.get_fechaconcurso (aem.em_cuit) As concurso, ' +
          '       legales.get_fechaquiebra (aem.em_cuit) As quiebra, ' +
          '	      deuda.get_deudatotalconsolidada (aco.co_contrato, null, null, ''S'') As deuda_nom_actual, ' +
          '	      deuda.get_deudatotalconsolidada (aco.co_contrato, null, actualdate, ''S'') As deuda_tot_actual, ' +
          '       gd_motivodevolucion, dev.tb_descripcion motivodevol, ' +
          '       ges.gd_usualta usualta, trunc(ges.gd_fechaalta) fechaalta, ' +
          '       ges.gd_usumodif usumodif, trunc(ges.gd_fechamodif) fechamodif, ' +
          '       ges.gd_usubaja, ges.gd_fechabaja, ges.gd_deudanominal, ges.gd_intereses ' +
          '  From AEM_EMPRESA aem, ' +
          '       ACO_CONTRATO aco, ' +
          '       CTB_TABLAS tip, ' +
          '       AGE_GESTORCUENTA age, ' +
          '       CTB_TABLAS est, ' +
          '       CTB_TABLAS ultevent, ' +
          '       CTB_TABLAS dev, ' +
          '       LGD_GESTIONDEUDA ges ' +
          ' Where ges.gd_gestor = age.ge_codgestor ' +
          '   And ges.gd_contrato = aco.co_contrato ' +
          '   And aem.em_id = aco.co_idempresa ' +
          '   And ges.gd_tipo = tip.tb_codigo ' +
          '   And tip.tb_clave = ''TIPGD'' ' +
          '   And ges.gd_estado = est.tb_codigo ' +
          '   And est.tb_clave = ''LGEST'' ' +
          '   And ultevent.tb_clave(+) = ''EVEGD'' ' +
          '   And ges.gd_motivodevolucion = dev.tb_codigo(+) ' +
          '   And dev.tb_clave(+) = ''LGMDV'' ' +
          '   And legales.get_maxeventogd (ges.gd_nroorden) = ultevent.tb_codigo(+) ' +
          '   And ges.gd_gestor Is Not Null ' +
              sWhere +
              sWhereAbo2;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  CalcularSumatoria;
  if Assigned(Sender) and (sdqConsulta.RecordCount = 1) then
  	DoCargaAdministracionJuicio(nil);
end;

procedure TfrmConsultaAdminstracionJuicio.tbNuevoClick(Sender: TObject);
var
  frmABMAdminstracionJuicio: TfrmABMAdminstracionJuicio;
begin
  frmABMAdminstracionJuicio := TfrmABMAdminstracionJuicio.Create(Self);
  try
    frmABMAdminstracionJuicio.Caption := LGD_GESTION_ALTA;
    frmABMAdminstracionJuicio.edGD_NROORDEN.Enabled := False;
    if frmABMAdminstracionJuicio.ShowModal = mrOK then
    	tbRefrescarClick(nil);
  finally
    frmABMAdminstracionJuicio.Free;
  end;
end;

procedure TfrmConsultaAdminstracionJuicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuGesDeudAdmin.Enabled := True;
end;

procedure TfrmConsultaAdminstracionJuicio.tbModificarClick(Sender: TObject);
begin
  DoCargaAdministracionJuicio(nil);
end;

procedure TfrmConsultaAdminstracionJuicio.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edNroOrden.Clear;
  fraTipo.Limpiar;
  fraEmpresaGestion.CUIT := '';
  fraEmpresaGestion.ShowBajas := true;
  fraAbogados.Clear;
  edCaratula.Clear;
  fraFuero.Limpiar;
  fraJurisdiccion.Clear;
  fraEstado.Limpiar;
  fraUltimoEvento.Limpiar;
  edGD_JUZGADO.Clear;
  edGD_SECRETARIA.Clear;
  CmbIniDde.Clear;
  CmbIniHta.Clear;
  CmbCierredde.Clear;
  CmbCierrehta.Clear;
  edFechaAsignDesde.Clear;

  fraGestor.Clear;
  edFechaAsignHasta.Clear;
  edCartera.Clear;
  edImpReclaDesde.Clear;
  edImpReclaHasta.Clear;
  edImpDemaDesde.Clear;
  edImpDemaHasta.Clear;
  edDeudaNADesde.Clear;
  edDeudaNAHasta.Clear;
  edDeudaTotActDesde.Clear;
  edDeudaTotActHasta.Clear;
  fraMotivoDevol.Clear;

  chkSoloActivos.Checked      := True;
  chkSoloContrActivos.Checked := False;
end;

procedure TfrmConsultaAdminstracionJuicio.DoCargaAdministracionJuicio(Sender: TObject);
var
  frmABMAdminstracionJuicio : TfrmABMAdminstracionJuicio;
begin
  if not sdqConsulta.IsEmpty then
  begin
    frmABMAdminstracionJuicio := TfrmABMAdminstracionJuicio.Create( Self );
    try
      frmABMAdminstracionJuicio.Visible := True;
      frmABMAdminstracionJuicio.Caption               := LGD_GESTION_MODIF;
      frmABMAdminstracionJuicio.edGD_NROORDEN.Enabled := True;
      frmABMAdminstracionJuicio.DoCargarDatos(sdqConsulta);
      frmABMAdminstracionJuicio.Visible := False;

      if frmABMAdminstracionJuicio.ShowModal = mrOK then
        tbRefrescarClick(nil);
    finally
      frmABMAdminstracionJuicio.Free;
    end;
  end;
end;

procedure TfrmConsultaAdminstracionJuicio.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('GD_IMPORTEDEMANDADO') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('GD_IMPORTEDEMANDADO')).Currency := True;

  if sdqConsulta.FieldByName('GD_IMPORTERECLAMADO') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('GD_IMPORTERECLAMADO')).Currency := True;

  if sdqConsulta.FieldByName('GD_IMPORTESENTENCIA') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('GD_IMPORTESENTENCIA')).Currency := True;

  if sdqConsulta.FieldByName('TOTGS') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('TOTGS')).Currency := True;

  if sdqConsulta.FieldByName('DEUDA_NOM_ACTUAL') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('DEUDA_NOM_ACTUAL')).Currency := True;

  if sdqConsulta.FieldByName('DEUDA_TOT_ACTUAL') is TFloatField then
   TFloatField(sdqConsulta.FieldByName('DEUDA_TOT_ACTUAL')).Currency := True;
end;

procedure TfrmConsultaAdminstracionJuicio.QueryPrintGetSubTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  inherited;
  if Value <> '' then
    Value := '$ ' + Trim(Format('%10.2f', [StrToCurr(Value)]));
end;

procedure TfrmConsultaAdminstracionJuicio.GridPaintFooter(Sender: TObject; Column: String; var Value: String;
	var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iCol: Integer;
begin
  iCol := ArrayPos(Column, CamposSumatoria);
  if iCol > -1 then
  	Value := Format('$ %0.2f', [FTotales[iCol]]);
end;

procedure TfrmConsultaAdminstracionJuicio.CalcularSumatoria;
begin
  if tbSumatoria.Down and sdqConsulta.Active then
    SumFields(sdqConsulta, CamposSumatoria, FTotales);
  Grid.FooterBand := tbSumatoria.Down;
end;

procedure TfrmConsultaAdminstracionJuicio.tbSumatoriaClick(Sender: TObject);
begin
  CalcularSumatoria;
end;

procedure TfrmConsultaAdminstracionJuicio.tbVerUsuarioAltaClick(Sender: TObject);
var
  bMostrar: Boolean;
begin
  bMostrar := tbVerUsuarioAlta.Down;

  Grid.ColumnByField['usualta'].Visible    := bMostrar;
  Grid.ColumnByField['fechaalta'].Visible  := bMostrar;
  Grid.ColumnByField['usumodif'].Visible   := bMostrar;
  Grid.ColumnByField['fechamodif'].Visible := bMostrar;
end;

procedure TfrmConsultaAdminstracionJuicio.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox('¿ Desea dar de baja el registro seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
    begin
      with TSql.Create('LGD_GESTIONDEUDA') do
        try
          try
            PrimaryKey.Add('GD_NROORDEN', 	sdqConsulta.FieldByName('GD_NROORDEN').AsInteger);
            Fields.Add('GD_USUBAJA', 	      Sesion.UserId);
            Fields.Add('GD_FECHABAJA',      exDateTime);
            SqlType := stUpdate;

            EjecutarSql(Sql);

            sdqConsulta.Refresh;
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar la baja.');
          end;
        finally
          Free;
        end;
    end;
end;

procedure TfrmConsultaAdminstracionJuicio.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if IsBaja then
    AFont.Color := clRed;
end;

function TfrmConsultaAdminstracionJuicio.IsBaja: Boolean;
begin
  Result := sdqConsulta.Active and (not sdqConsulta.FieldByName('GD_FECHABAJA').IsNull);
end;

procedure TfrmConsultaAdminstracionJuicio.fraEmpresaGestionChange(Sender: TObject);
var
  sSql: String;
  iNroCarpeta: Integer;
begin
  if fraEmpresaGestion.IsSelected then
    begin
      sSql := 'SELECT MAX(JT_NUMEROCARPETA) ' +
                'FROM LEGALES.LOD_ORIGENDEMANDA, LEGALES.LJT_JUICIOENTRAMITE ' +
               'WHERE JT_ESTADOMEDIACION = ''A'' ' +
                 'AND JT_IDESTADO NOT IN (3) ' +
                 'AND OD_IDJUICIOENTRAMITE = JT_ID ' +
                 'AND OD_CONTRATO = :Contrato ' +
                 'AND OD_IDRECLAMANTE = 4 ' +
                 'AND OD_FECHABAJA IS NULL';
      iNroCarpeta := ValorSqlIntegerEx(sSql, [fraEmpresaGestion.Contrato]);

      if iNroCarpeta > 0 then
        begin
          sSql := 'SELECT ''Nº Juicio Parte Actora: '' || ' + SqlValue(IntToStr(iNroCarpeta)) + ' || CHR(10) || CHR(13) || ' +
                          '''Carátula: '' || JT_DEMANDANTE || '' C/ '' || JT_DEMANDADO ' +
                    'FROM LEGALES.LJT_JUICIOENTRAMITE ' +
                   'WHERE JT_ESTADOMEDIACION = ''A'' ' +
                     'AND JT_NUMEROCARPETA = :NroCarpeta';
          MsgBox(ValorSqlEx(sSql, [iNroCarpeta]), MB_ICONINFORMATION);
       end;
    end;
end;

end.

