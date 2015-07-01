unit unConsultaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraCodigoDescripcion, unfraCtbTablas, StdCtrls, Mask,
  ToolEdit, DateComboBox, unArtFrame, unArtDbFrame, unFraEmpresa, unFraEmpresaAfi, ComboEditor, CheckCombo, DBCheckCombo,
  IntEdit, unfraVendedores, unFraEntidades, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unfraLocalidad,
  PatternEdit, unArtDBAwareFrame, unFraCodDesc, unFraCanal, CardinalEdit, unFraUsuario, Menus,
  RxToolEdit, RxPlacemnt;

type
  TfrmConsultaContrato = class(TfrmCustomConsulta)
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    tsFiltros1: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cmbCO_VIGENCIADESDE: TDateComboBox;
    Label2: TLabel;
    cmbCO_VIGENCIAHASTA: TDateComboBox;
    Label3: TLabel;
    cmbCO_FECHARECEPCIONDesde: TDateComboBox;
    Label6: TLabel;
    cmbCO_FECHABAJADesde: TDateComboBox;
    Label5: TLabel;
    LabelN: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbActividad: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    fraEntidades: TfraEntidades;
    fraVendedores: TfraVendedores;
    cmbCO_FECHARECEPCIONHasta: TDateComboBox;
    cmbCO_FECHABAJAHasta: TDateComboBox;
    Label26: TLabel;
    Label27: TLabel;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    edCO_TOTEMPLEADOS_DESDE: TIntEdit;
    Label12: TLabel;
    edCO_TOTEMPLEADOS_HASTA: TIntEdit;
    edCantEmpleadosHasta: TIntEdit;
    Label14: TLabel;
    edCantEmpleadosDesde: TIntEdit;
    Label13: TLabel;
    GroupBox4: TGroupBox;
    cmbCO_ESTADO: TCheckCombo;
    fraCO_MOTIVOALTA: TfraStaticCTB_TABLAS;
    fraEM_SECTOR: TfraStaticCTB_TABLAS;
    fraEM_SUSS: TfraStaticCTB_TABLAS;
    fraEM_FORMAJ: TfraStaticCTB_TABLAS;
    fraCO_ORIGEN: TfraStaticCTB_TABLAS;
    fraCO_MOTIVOBAJA: TfraStaticCTB_TABLAS;
    fraCO_IDEJECUTIVO: TfraStaticCodigoDescripcion;
    fraCO_CLAUSULAESPECIAL: TfraStaticCTB_TABLAS;
    fraCO_IDARTFUTURA: TfraStaticCodigoDescripcion;
    fraCO_IDARTANTERIOR: TfraStaticCodigoDescripcion;
    fraCO_IDGESTOR: TfraStaticCodigoDescripcion;
    edCO_IDACTIVIDAD_RESUMEN: TCheckCombo;
    edCO_IDACTIVIDAD: TComboBox;
    GroupBox5: TGroupBox;
    fraEmpresaAfi: TfraEmpresaAfi;
    lbRSocial: TLabel;
    chkEntidadPorContrato: TCheckBox;
    fraUB_CALLE_POSTAL: TfraLocalidad;
    fraUB_CALLE_LEGAL: TfraLocalidad;
    GroupBox6: TGroupBox;
    edContratoHasta: TIntEdit;
    Label8: TLabel;
    edContratoDesde: TIntEdit;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    edCO_DIASFRANQUICIA_DESDE: TIntEdit;
    Label18: TLabel;
    edCO_DIASFRANQUICIA_HASTA: TIntEdit;
    chkTodosFutura: TCheckBox;
    chkTodosAnterior: TCheckBox;
    tbConsulta: TToolButton;
    Label29: TLabel;
    dcbFechaRecepAfiDesde: TDateComboBox;
    Label30: TLabel;
    dcbFechaRecepAfiHasta: TDateComboBox;
    fraEM_HOLDING: TfraCodDesc;
    Label31: TLabel;
    fraDelegacion: TfraCodDesc;
    fraCanal: TfraCanal;
    Label32: TLabel;
    tbSumatoria: TToolButton;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbVerTarifas: TToolButton;
    fraEjecutivoEnt: TfraStaticCodigoDescripcion;
    lbEjecutivoEnt: TLabel;
    ToolButton2: TToolButton;
    fraUsuarioRevision: TfraUsuarios;
    Label4: TLabel;
    Label28: TLabel;
    edCO_FECHAREVISION_DESDE: TDateComboBox;
    edCO_FECHAREVISION_HASTA: TDateComboBox;
    Label34: TLabel;
    Label33: TLabel;
    edDocFaltante: TCheckCombo;
    tbImprimirUltimaRenovacion: TToolButton;
    mnuRenovacionAutomatica: TPopupMenu;
    mnuImprimirRenovacionAutomatica: TMenuItem;
    mnuMailRenovacionAutomatica: TMenuItem;
    fraOrganizador: TfraCodDesc;
    Label35: TLabel;
    Label36: TLabel;
    fraRegimen: TfraCodDesc;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure edCO_IDACTIVIDAD_RESUMENCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure tbModificarClick(Sender: TObject);
    procedure CargaComboEstado;
    procedure CargaActividad;
    procedure CargaActividadResumen;
    procedure edCO_IDACTIVIDADDropDown(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbConsultaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbVerTarifasClick(Sender: TObject);
    procedure mnuImprimirRenovacionAutomaticaClick(Sender: TObject);
    procedure mnuMailRenovacionAutomaticaClick(Sender: TObject);
    procedure tbImprimirUltimaRenovacionClick(Sender: TObject);
  private
    procedure CalcTotales;
  public
  end;

var
  frmConsultaContrato: TfrmConsultaContrato;
  TotalConsulta: array of extended;

const
  MAXCOLS = 3;
  CAMPOS_SUMA: array [0..MAXCOLS] of string = ('CO_TOTEMPLEADOS', 'CO_MASATOTAL', 'RC_EMPLEADOS', 'RC_MASASALARIAL');

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, VCLExtra, AnsiSql, General, unContratoConsultaEndoso,
  unConsultaTraspasoIngreso, unArt, unComunes, unModificaContrato, DbFuncs, Strfuncs, unAfiliaciones;

{$R *.DFM}

procedure TfrmConsultaContrato.FormCreate(Sender: TObject);
begin
  inherited;

  fraCO_MOTIVOALTA.Clave       := 'MOTIA';
  fraCO_MOTIVOBAJA.Clave       := 'MOTIB';
  fraCO_ORIGEN.Clave           := 'ORSOL';
  fraCO_CLAUSULAESPECIAL.Clave := 'CLAUS';
  fraEM_FORMAJ.Clave           := 'FJURI';
  fraEM_SUSS.Clave             := 'SUSS';
  fraEM_SECTOR.Clave           := 'SECT';

  fraCO_IDEJECUTIVO.TableName   := 'aec_ejecutivocuenta';
  fraCO_IDEJECUTIVO.FieldID     := 'ec_id';
  fraCO_IDEJECUTIVO.FieldCodigo := 'ec_id';
  fraCO_IDEJECUTIVO.FieldDesc   := 'ec_nombre';
  fraCO_IDEJECUTIVO.FieldBaja   := 'ec_fechabaja';

  fraCO_IDGESTOR.TableName   := 'agc_gestorcuenta';
  fraCO_IDGESTOR.FieldID     := 'gc_id';
  fraCO_IDGESTOR.FieldCodigo := 'gc_id';
  fraCO_IDGESTOR.FieldDesc   := 'gc_nombre';
  fraCO_IDGESTOR.FieldBaja   := 'gc_fechabaja';

  fraCO_IDARTANTERIOR.TableName   := 'aar_art';
  fraCO_IDARTANTERIOR.FieldID     := 'ar_id';
  fraCO_IDARTANTERIOR.FieldCodigo := 'ar_id';
  fraCO_IDARTANTERIOR.FieldDesc   := 'ar_nombre';
  fraCO_IDARTANTERIOR.FieldBaja   := 'ar_fechabaja';

  fraCO_IDARTFUTURA.TableName   := 'aar_art';
  fraCO_IDARTFUTURA.FieldID     := 'ar_id';
  fraCO_IDARTFUTURA.FieldCodigo := 'ar_id';
  fraCO_IDARTFUTURA.FieldDesc   := 'ar_nombre';
  fraCO_IDARTFUTURA.FieldBaja   := 'ar_fechabaja';

  //CON ESTO SE PUEDE SETEAR EL CAMPO WHERE EN LA CONSULTA
  fraUB_CALLE_LEGAL.FieldCPostal   := 'adc_legal.dc_cpostal';
  fraUB_CALLE_LEGAL.FieldLocalidad := 'adc_legal.dc_localidad';
  fraUB_CALLE_LEGAL.FieldProvincia := 'adc_legal.dc_provincia';

  fraUB_CALLE_POSTAL.FieldCPostal   := 'adc_postal.dc_cpostal';
  fraUB_CALLE_POSTAL.FieldLocalidad := 'adc_postal.dc_localidad';
  fraUB_CALLE_POSTAL.FieldProvincia := 'adc_postal.dc_provincia';

  fraEntidades.CaseSensitive := False;
  fraVendedores.CaseSensitive := False;
  fraVendedores.ExtraCondition := ' AND ev_fechabaja IS NULL';
  fraCanal.CaseSensitive := False;
  fraCanal.FiltraUsuario := False; //Pedido por Grossi y Vila

  fraEntidades.ExtraCondition := ' AND en_entramite = ''N''';

  with fraEjecutivoEnt do
  begin
    TableName      := 'aec_ejecutivocuenta';
    FieldID        := 'ec_id';
    FieldCodigo    := 'ec_id';
    FieldDesc      := 'ec_nombre';
    FieldBaja      := 'ec_fechabaja';
    ShowBajas      := False;
  end;
  

  fraEmpresaAfi.ShowBajas := True;
  fraEmpresaAfi.ContratoActivo := True;
  CargaActividadResumen;
  CargaComboEstado;
  frmPrincipal.mnuConsultaContrato.Enabled := False;

  SetLength(TotalConsulta, MAXCOLS + 1);

  tbSalir.Left :=  31;
  ToolButton11.Left := 31;
  tbMaxRegistros.Left := 31;
  tbMostrarFiltros.Left := 31;
  ToolButton8.Left := 31;
  tbEnviarMail.Left := 31;
  tbExportar.Left := 31;
  tbImprimirUltimaRenovacion.Left := 31;
  tbImprimir.Left := 31;
  ToolButton6.Left  := 31;
  tbMostrarOcultarColumnas.Left := 31;
  tbOrdenar.Left := 31;
  tbLimpiar.Left := 31;
  ToolButton3.Left := 31;
  tbPropiedades.Left := 31;
  ToolButton4.Left := 31;
  tbEliminar.Left := 31;
  tbModificar.Left := 31;
  tbNuevo.Left := 20;

  tbVerTarifas.Left := 108;
  tbConsulta.Left   := 108;
end;

procedure TfrmConsultaContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmConsultaContrato := nil;
  frmPrincipal.mnuConsultaContrato.Enabled := True;
end;

procedure TfrmConsultaContrato.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  sdqConsulta.Close;
  fraEmpresaAfi.Clear;
  cmbCO_VIGENCIADESDE.Clear;
  cmbCO_VIGENCIAHASTA.Clear;
  cmbCO_FECHARECEPCIONDesde.Clear;
  cmbCO_FECHARECEPCIONHasta.Clear;
  fraCO_MOTIVOALTA.Clear;
  cmbCO_FECHABAJADesde.Clear;
  cmbCO_FECHABAJAHasta.Clear;
  fraCO_MOTIVOBAJA.Clear;
  fraCO_IDEJECUTIVO.Clear;
  fraCO_IDGESTOR.Clear;
  edCO_IDACTIVIDAD_RESUMEN.Clear;
  edCO_IDACTIVIDAD.Clear;
  fraCO_IDARTANTERIOR.Clear;
  edCO_TOTEMPLEADOS_DESDE.Clear;
  edCO_TOTEMPLEADOS_HASTA.Clear;
  fraCO_ORIGEN.Clear;
  edCantEmpleadosDesde.Clear;
  edCantEmpleadosHasta.Clear;
  fraCO_CLAUSULAESPECIAL.Clear;
  edCO_DIASFRANQUICIA_DESDE.Clear;
  edCO_DIASFRANQUICIA_HASTA.Clear;
  fraCO_IDARTFUTURA.Clear;
  fraEM_FORMAJ.Clear;
  fraUB_CALLE_POSTAL.Clear;
  fraUB_CALLE_LEGAL.Clear;
  fraEM_HOLDING.Clear;
  fraEM_SUSS.Clear;
  fraEM_SECTOR.Clear;
  fraEntidades.Clear;
  fraCanal.Clear;
  fraVendedores.Clear;
  cmbCO_ESTADO.Clear;
  dcbFechaRecepAfiDesde.Clear;
  dcbFechaRecepAfiHasta.Clear;
  fraDelegacion.Clear;
  edTotalRegistros.Clear;
  fraUsuarioRevision.Clear;
  edDocFaltante.Clear;
  edCO_FECHAREVISION_DESDE.Clear;
  edCO_FECHAREVISION_HASTA.Clear;
  fraOrganizador.Clear;
  fraRegimen.Clear;
end;

procedure TfrmConsultaContrato.tbRefrescarClick(Sender: TObject);
var
  iLoop: Integer;
  sDocFaltante: String;
  sSql: String;
  sWhere: String;
begin

  // Armo el string para filtrar por documentacion faltante
  for iLoop := 0 to edDocFaltante.Items.Count -1 do
   if edDocFaltante.Checked[iLoop] then
     sDocFaltante := sDocFaltante + '%' + edDocFaltante.Items.Strings[iLoop];

  if sDocFaltante <> '' then
    sDocFaltante := sDocFaltante + '%';

  if ((not fraEntidades.IsEmpty) or (not fraVendedores.IsEmpty) or (not fraCanal.IsEmpty)) and not (chkEntidadPorContrato.Checked) then
    MsgBox('Al seleccionar una entidad, un vendedor o un canal es posible que un mismo contrato se vea repetido.', MB_ICONEXCLAMATION, 'Atención');

  // Armar SQL de sdqConsulta
  sSql :=
    'SELECT aem.em_nombre, aem.em_cuit, aco.co_contrato, estado.tb_descripcion AS estado, aco.co_vigenciadesde,' +
          ' aco.co_vigenciahasta, aco.co_fechaimpresion, aco.co_recepcontrato, afo.fo_formulario,' +
          ' afo.fo_id idformulario, origen.tb_descripcion AS origen, aco.co_fecharecepcion, aem.em_feinicactiv,' +
          ' aco.co_fechaafiliacion, formaj.tb_descripcion AS formaj, sector.tb_descripcion AS sector,' +
          ' holdin.ge_descripcion AS holdin, aem.em_suss, ecuenta.ec_nombre AS ejcuenta, gestor.gc_nombre AS gestor,' +
          ' artact.ar_nombre AS art_act, aco.co_fechabaja, mot_baj.tb_descripcion AS motivo_baja,' +
          ' artfut.ar_nombre AS art_fut, act.ac_descripcion, aco.co_nivel, aco.co_totempleados, aco.co_masatotal,' +
          ' aco.co_observaciones, aco.co_diasfranquicia, aco.co_vigenciafranquicia, aco.co_clausulaespecial,' +
          ' aco.co_vigenciaclausula, atc.tc_alicuotapesos, atc.tc_porcmasa, aco.co_fecharecepcionsectorafi,' +
          ' art.utiles.armar_domicilio(adc_legal.dc_calle, adc_legal.dc_numero, adc_legal.dc_piso,' +
                                     ' adc_legal.dc_departamento, NULL) AS dom_legal,' +
          ' art.utiles.armar_localidad(adc_legal.dc_cpostal, NULL, adc_legal.dc_localidad, adc_legal.dc_provincia) AS loc_legal,' +
          ' art.utiles.armar_domicilio(adc_postal.dc_calle, adc_postal.dc_numero, adc_postal.dc_piso,' +
                                     ' adc_postal.dc_departamento, NULL) AS dom_postal,' +
          ' art.utiles.armar_localidad(adc_postal.dc_cpostal, NULL, adc_postal.dc_localidad,' +
                                     ' adc_postal.dc_provincia) AS loc_postal,' +
          ' afiliacion.get_ultidendoso(aco.co_contrato) AS en_id,' +
          ' (SELECT MIN(aco2.co_contrato)' +
             ' FROM aco_contrato aco2, aem_empresa aem2' +
            ' WHERE aco2.co_idempresa = aem2.em_id' +
              ' AND aem2.em_cuit = aem.em_cuit) AS nro_cliente, xen.en_codbanco xen_en_id, xen.en_nombre, xve.ve_vendedor ve_id,' +
                  ' xve.ve_nombre, ca_codigo codigocanal, ca_descripcion canal, rc_empleados, rc_masasalarial,' +
          ' as_nombre, el_nombre, DECODE(co_presentorgrl, ''T'', ''SI'', ''NO'') fgrl,' +
          ' DECODE(INSTR(NVL(co_dnifirmado, '' ''), ''T''), 0, DECODE(INSTR(NVL(co_dnifirmado, '' ''), ''V''), 0, ''NO'', ''V''), DECODE(INSTR(NVL(co_dnifirmado, '' ''), ''V''), 0, ''A'', ''C'')) dnipoder,' +
          ' su_descripcion, ejecentidad.ec_nombre as ejecutivoentidad, aco.co_usurevision, to_char(aco.co_fecharevision, ''dd/mm/yyyy'') fecharev ,' +
          ' art.afiliacion.falta_doc_contrato (aco.co_contrato) faltarenglon,' +
          ' aco.co_motivoalta,' +
          ' CASE WHEN doc.doc_falta = ''Contrato sin revisión de firmante'' THEN ''S'' ELSE '''' END as Sin_revision,' +
          ' CASE WHEN doc.doc_falta LIKE ''%D.N.I..%'' THEN ''S'' ELSE '''' END as DNI,' +
          ' CASE WHEN doc.doc_falta LIKE ''%D.N.I. sin firma del titular%'' THEN ''S'' ELSE '''' END as DNI_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%D.N.I. sin firma del vendedor%'' THEN ''S'' ELSE '''' END as DNI_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%D.N.I. inconsistente%'' THEN ''S'' ELSE '''' END as DNI_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Poder.%'' THEN ''S'' ELSE '''' END as Poder,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Poder sin firma del titular%'' THEN ''S'' ELSE '''' END as Poder_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Poder sin firma del vendedor%'' THEN ''S'' ELSE '''' END as Poder_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Poder inconsistente%'' THEN ''S'' ELSE '''' END as Poder_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Contrato Social.%'' THEN ''S'' ELSE '''' END as CSocial,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Contrato Social sin firma del titular%'' THEN ''S'' ELSE '''' END as CSocial_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Contrato Social sin firma del vendedor%'' THEN ''S'' ELSE '''' END as CSocial_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Contrato Social inconsistente%'' THEN ''S'' ELSE '''' END as CSocial_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Designación.%'' THEN ''S'' ELSE '''' END as ADesig, ' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Designación sin firma del titular%'' THEN ''S'' ELSE '''' END as ADesig_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Designación sin firma del vendedor%'' THEN ''S'' ELSE '''' END as ADesig_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Designación inconsistente%'' THEN ''S'' ELSE '''' END as ADesig_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Asamblea.%'' THEN ''S'' ELSE '''' END as AAsamblea,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Asamblea sin firma del titular%'' THEN ''S'' ELSE '''' END as AAsamblea_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Asamblea sin firma del vendedor%'' THEN ''S'' ELSE '''' END as AAsamblea_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Acta de Asamblea inconsistente%'' THEN ''S'' ELSE '''' END as AAsamblea_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Particulares.%'' THEN ''S'' ELSE '''' END as CPart,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Particulares sin firma del titular%'' THEN ''S'' ELSE '''' END as CPart_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Particulares sin firma del vendedor%'' THEN ''S'' ELSE '''' END as CPart_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Particulares inconsistente%'' THEN ''S'' ELSE '''' END as CPart_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Generales.%'' THEN ''S'' ELSE '''' END as CGenerales,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Generales sin firma del titular%'' THEN ''S'' ELSE '''' END as CGenerales_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Generales sin firma del vendedor%'' THEN ''S'' ELSE '''' END as CGenerales_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Condiciones Generales inconsistente%'' THEN ''S'' ELSE '''' END as CGenerales_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Cláusulas Adicionales.%'' THEN ''S'' ELSE '''' END as CAdicionales,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Cláusulas Adicionales sin firma del titular%'' THEN ''S'' ELSE '''' END as CAdicionales_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Cláusulas Adicionales sin firma del vendedor%'' THEN ''S'' ELSE '''' END as CAdicionales_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Cláusulas Adicionales inconsistente%'' THEN ''S'' ELSE '''' END as CAdicionales_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Adenda Plan Comercial 2011.%'' THEN ''S'' ELSE '''' END as Plan2011,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Adenda Plan Comercial 2011 sin firma del titular%'' THEN ''S'' ELSE '''' END as Plan2011_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Adenda Plan Comercial 2011 sin firma del vendedor%'' THEN ''S'' ELSE '''' END as Plan2011_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%RGRL.%'' THEN ''S'' ELSE '''' END as RGRL,' +
          ' CASE WHEN doc.doc_falta LIKE ''%RGRL inconsistente%'' THEN ''S'' ELSE '''' END as RGRL_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Ubicación de Riesgo.%'' THEN ''S'' ELSE '''' END as URiesgo,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Ubicación de Riesgo inconsistente%'' THEN ''S'' ELSE '''' END as URiesgo_incon,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Responsabilidad Civil Patronal.%'' THEN ''S'' ELSE '''' END as RC,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Responsabilidad Civil Patronal sin firma del titular%'' THEN ''S'' ELSE '''' END as RC_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Responsabilidad Civil Patronal sin firma del vendedor%'' THEN ''S'' ELSE '''' END as RC_vend,' +
          ' CASE WHEN doc.doc_falta LIKE ''%Formulario PEP%'' THEN ''S'' ELSE '''' END as PEP,' +
          ' CASE WHEN doc.doc_falta LIKE ''%PEP sin firma del titular%'' THEN ''S'' ELSE '''' END as PEP_tit,' +
          ' CASE WHEN doc.doc_falta LIKE ''%PEP sin firma del vendedor%'' THEN ''S'' ELSE '''' END as PEP_vend,' +
          ' DECODE((SELECT 1 FROM agenda.aat_agendatarea WHERE at_idtipoevento IN(354, 356) AND at_idformulario = co_idformulario AND rownum < 2), 1, ''Sí'', ''No'') tareaSic,' +
          ' (SELECT     en_nombre' +
          '     FROM xgo_granorganizador, xen_entidad' +
          '    WHERE go_identorganizador = en_id' +
          '      AND go_fechabaja IS NULL' +
          '      AND go_fechaaprobado IS NOT NULL' +
          '      AND LEVEL = 1' +
          '    START WITH go_identidad = ev_identidad' +
          '    CONNECT BY NOCYCLE PRIOR go_identorganizador = go_identidad) organizador' +
     ' FROM aco_contrato aco, aem_empresa aem, ctb_tablas estado, afo_formulario afo, ctb_tablas origen,' +
          ' ctb_tablas formaj, ctb_tablas sector, age_grupoeconomico holdin, atc_tarifariocontrato atc,' +
          ' afi.aec_ejecutivocuenta ecuenta, afi.aec_ejecutivocuenta ejecentidad, afi.agc_gestorcuenta gestor, aar_art artact, aar_art artfut,' +
          ' ctb_tablas mot_baj, cac_actividad act, adc_domiciliocontrato adc_legal, adc_domiciliocontrato adc_postal,' +
          ' xev_entidadvendedor xev, avc_vendedorcontrato avc, xen_entidad xen, xve_vendedor xve, aca_canal,' +
          ' zrc_resumencobranza, ias_asesoremision, adc_delegacioncontrato delegacion, del_delegacion, asu_sucursal,' +
          ' (SELECT aco.co_contrato as contrato , art.afiliacion.falta_doc_contrato(aco.co_contrato) as doc_falta' +
             ' FROM aco_contrato aco) doc' +
    ' WHERE aem.em_id = aco.co_idempresa' +
      ' AND estado.tb_codigo = aco.co_estado' +
      ' AND estado.tb_clave = ' + SqlValue('AFEST') +
      ' AND afo.fo_id = aco.co_idformulario' +
      ' AND origen.tb_codigo = aco.co_origen' +
      ' AND origen.tb_clave = ' + SqlValue('ORSOL') +
      ' AND formaj.tb_codigo(+) = aem.em_formaj' +
      ' AND formaj.tb_clave(+) = ' + SqlValue('FJURI') +
      ' AND sector.tb_codigo = aem.em_sector' +
      ' AND sector.tb_clave = ' + SqlValue('SECT') +
      ' AND holdin.ge_id(+) = aem.em_idgrupoeconomico' +
      ' AND ecuenta.ec_id(+) = aco.co_idejecutivo' +
      ' AND gestor.gc_id(+) = aco.co_idgestor' +
      ' AND artact.ar_id(+) = aco.co_idartanterior' +
      ' AND mot_baj.tb_codigo(+) = aco.co_motivobaja' +
      ' AND mot_baj.tb_clave(+) = ' + SqlValue('MOTIB') +
      ' AND artfut.ar_id(+) = aco.co_idartfutura' +
      ' AND act.ac_id = aco.co_idactividad' +
      ' AND adc_legal.dc_contrato = aco.co_contrato' +
      ' AND adc_postal.dc_contrato = aco.co_contrato' +
      ' AND adc_legal.dc_tipo = ''L''' +
      ' AND adc_postal.dc_tipo = ''P''' +
      ' AND atc.tc_contrato = aco.co_contrato' +
      ' AND avc.vc_identidadvend = xev.ev_id(+)' +
      ' AND ev_identidad = en_id(+)' +
      ' AND ev_idvendedor = ve_id(+)' +
      ' AND en_idcanal = ca_id(+)' +
      ' AND avc.vc_contrato(+) = aco.co_contrato' +
      ' AND co_idasesoremision = as_id(+)' +
      ' AND co_contrato = delegacion.dc_contrato(+)' +
      ' AND delegacion.dc_fechabaja(+) IS NULL' +
      ' AND delegacion.dc_fecha_hasta(+) IS NULL' +
      ' AND delegacion.dc_iddelegacion = el_id(+)' +
      ' AND vc_idsucursal = su_id(+)' +
      ' AND rc_contrato(+) = aco.co_contrato' +
      ' AND rc_periodo(+) = cobranza.obtener_ultperiododevengado(aco.co_contrato)' +
      ' AND ejecentidad.ec_id(+) = xen.en_idejecutivo' +
      ' AND doc.contrato = aco.co_contrato' ;


  if chkEntidadPorContrato.Checked and ((not fraEntidades.IsEmpty) or (not fraVendedores.IsEmpty) or (not fraCanal.IsEmpty)) then
    sWhere := sWhere + ' AND avc.vc_id = comision.get_ultidentidadvendcontrato(aco.co_contrato) ';

  if chkEntidadPorContrato.Checked then  //tk 59901
    sWhere := sWhere + ' AND art.comision.get_ultidentidadvendcontrato(aco.co_contrato, null, ''N'', TO_CHAR(NVL(aco.co_fechabaja, Sysdate), ''YYYYMM'')) = vc_id(+)';

  //UBICACION LEGAL
  if fraUB_CALLE_LEGAL.IsSelected then
    sWhere := sWhere + fraUB_CALLE_LEGAL.GetWhere;

  //UBICACION POSTAL
  if fraUB_CALLE_POSTAL.IsSelected then
    sWhere := sWhere + fraUB_CALLE_POSTAL.GetWhere;

  sWhere := sWhere +
    IIF(fraEntidades.IsEmpty, '',' AND xev.ev_identidad = ' + SqlValue(fraEntidades.Value)) +
    IIF(fraVendedores.IsEmpty, '',' AND xev.ev_idvendedor = ' + SqlValue(fraVendedores.Value)) +
    IIF(fraCanal.IsEmpty, '',' AND xen.en_idcanal = ' + SqlValue(fraCanal.Value)) +   //Cambio de xve_idcanal a xen_idcanal (pidio Julia via Grossi)
    IIF(fraEmpresaAfi.IsEmpty, '', ' AND aco.co_contrato = ' + SqlValue(fraEmpresaAfi.Contrato)) +
    IIF(edContratoDesde.IsEmpty, '', ' AND aco.co_contrato >= ' + edContratoDesde.Text) +
    IIF(edContratoHasta.IsEmpty, '', ' AND aco.co_contrato <= ' + edContratoHasta.Text) +
    IIF(cmbCO_VIGENCIADESDE.IsEmpty, '', ' AND aco.co_vigenciadesde >= ' + SqlDate(cmbCO_VIGENCIADESDE.Date)) +
   //IIF(cmbCO_VIGENCIAHASTA.IsEmpty, '', ' AND aco.co_vigenciahasta <= ' + SqlDate(cmbCO_VIGENCIAHASTA.Date)) +  TK 27782
    IIF(cmbCO_VIGENCIAHASTA.IsEmpty, '', ' AND aco.co_vigenciadesde <= ' + SqlDate(cmbCO_VIGENCIAHASTA.Date)) +
    IIF(dcbFechaRecepAfiDesde.IsEmpty, '', ' AND aco.co_fecharecepcionsectorafi >= ' + SqlDate(dcbFechaRecepAfiDesde.Date)) +
    IIF(dcbFechaRecepAfiHasta.IsEmpty, '', ' AND aco.do_fecharecepcionsectorafi <= ' + SqlDate(dcbFechaRecepAfiHasta.Date)) +
    IIF(cmbCO_FECHARECEPCIONDesde.IsEmpty, '', ' AND aco.co_fecharecepcion >= ' + SqlDate(cmbCO_FECHARECEPCIONDesde.Date)) +
    IIF(cmbCO_FECHARECEPCIONHasta.IsEmpty, '', ' AND aco.co_fecharecepcion <= ' + SqlDate(cmbCO_FECHARECEPCIONHasta.Date)) +
    IIF(fraCO_MOTIVOALTA.IsEmpty, '', ' AND aco.co_motivoalta = ' + SqlValue(fraCO_MOTIVOALTA.Codigo)) +
    IIF(cmbCO_FECHABAJADesde.IsEmpty, '', ' AND aco.co_fechabaja >= ' + SqlDate(cmbCO_FECHABAJADesde.Date)) +
    IIF(cmbCO_FECHABAJAHasta.IsEmpty, '', ' AND aco.co_fechabaja <= ' + SqlDate(cmbCO_FECHABAJAHasta.Date)) +
    IIF(fraCO_MOTIVOBAJA.IsEmpty, '', ' AND aco.co_motivobaja = ' + SqlValue(fraCO_MOTIVOBAJA.Codigo)) +
    IIF(fraCO_IDEJECUTIVO.IsEmpty, '', ' AND aco.co_idejecutivo = ' + SqlValue(fraCO_IDEJECUTIVO.AsString)) +
    IIF(fraCO_IDGESTOR.IsEmpty, '', ' AND aco.co_idgestor = ' + SqlValue(fraCO_IDGESTOR.AsString)) +
    IIF(fraCO_IDARTANTERIOR.IsEmpty, '', ' AND aco.co_idartanterior = ' + SqlValue(fraCO_IDARTANTERIOR.AsString)) +
    IIF(edCO_TOTEMPLEADOS_DESDE.IsEmpty, '', ' AND aco.co_totempleados >= ' + SqlValue(edCO_TOTEMPLEADOS_DESDE.Value)) +
    IIF(edCO_TOTEMPLEADOS_HASTA.IsEmpty, '', ' AND aco.co_totempleados <= ' + SqlValue(edCO_TOTEMPLEADOS_HASTA.Value)) +
    IIF(edCantEmpleadosDesde.IsEmpty, '', ' AND nomina.get_empleados(aco.co_contrato, cobranza.get_ultperiododevengado(''D'')) >= ' + SqlValue(edCantEmpleadosDesde.Value)) +
    IIF(edCantEmpleadosHasta.IsEmpty, '', ' AND nomina.get_empleados(aco.co_contrato, cobranza.get_ultperiododevengado(''D'')) <= ' + SqlValue(edCantEmpleadosHasta.Value)) +
    IIF(fraCO_ORIGEN.IsEmpty, '', ' AND aco.co_origen = ' + SqlValue(fraCO_ORIGEN.Codigo)) +
    IIF(fraCO_CLAUSULAESPECIAL.IsEmpty, '', ' AND aco.co_clausulaespecial = ' + SqlValue(fraCO_CLAUSULAESPECIAL.Value)) +
    IIF(edCO_DIASFRANQUICIA_DESDE.IsEmpty, '', ' AND aco.co_diasfranquicia >= ' + SqlValue(edCO_DIASFRANQUICIA_DESDE.Value)) +
    IIF(edCO_DIASFRANQUICIA_HASTA.IsEmpty, '', ' AND aco.co_diasfranquicia <= ' + SqlValue(edCO_DIASFRANQUICIA_HASTA.Value)) +
    IIF(fraCO_IDARTFUTURA.IsEmpty, '', ' AND aco.co_idartfutura = ' + SqlValue(fraCO_IDARTFUTURA.AsString)) +
    IIF(fraEM_FORMAJ.IsEmpty, '', ' AND aem.em_formaj = ' + SqlValue(fraEM_FORMAJ.Codigo)) +
    IIF(fraEM_HOLDING.IsEmpty, '', ' AND aem.em_idgrupoeconomico = ' + SqlValue(fraEM_HOLDING.Value)) +
    IIF(fraEM_SUSS.IsEmpty, '', ' AND aem.em_suss = ' + SqlValue(fraEM_SUSS.Codigo)) +
    IIF(fraEM_SECTOR.IsEmpty, '', ' AND aem.em_sector = ' + SqlValue(fraEM_SECTOR.Codigo)) +
    IIF(not chkTodosFutura.Checked, '', ' AND aco.co_idartfutura IS NOT NULL') +
    IIF(not chkTodosAnterior.Checked, '', ' AND aco.co_idartanterior IS NOT NULL') +
    IIF(fraDelegacion.IsEmpty, '', ' AND EXISTS(SELECT 1' +
                                                ' FROM adc_delegacioncontrato' +
                                               ' WHERE dc_contrato = co_contrato' +
                                                 ' AND dc_iddelegacion = ' + SqlValue(fraDelegacion.Value) +
                                                 ' AND dc_fecha_hasta IS NULL)') +
    IIF(fraOrganizador.IsEmpty, '', ' AND ev_identidad IN ( SELECT go_identidad' +
                                              ' FROM xgo_granorganizador' +
                                             ' WHERE go_fechabaja IS NULL' +
                                               ' AND go_fechaaprobado IS NOT NULL' +
                                               ' AND LEVEL = 1' +
                                        ' START WITH go_identorganizador = ' + SqlValue(fraOrganizador.Value) +
                                  ' CONNECT BY NOCYCLE PRIOR go_identidad = go_identorganizador)');

  if cmbCO_ESTADO.Text <> '' then
  begin
    sWhere := sWhere + ' AND aco.co_estado IN (';
    for iLoop := 0 to cmbCO_ESTADO.Items.Count - 1 do
      if cmbCO_ESTADO.Checked[iLoop] then
        sWhere := sWhere + SqlString((cmbCO_ESTADO.Items.Objects[iLoop] as TCadena).Cadena, True) + ',';
    sWhere := Copy(sWhere, 1, Length(sWhere) - 1) + ')';
  end;

  if edCO_IDACTIVIDAD_RESUMEN.Text <> '' then
  begin
    sWhere := sWhere + ' AND (';
    for iLoop := 0 to edCO_IDACTIVIDAD_RESUMEN.Items.Count - 1 do
      if edCO_IDACTIVIDAD_RESUMEN.Checked[iLoop] then
        sWhere := sWhere + ' (SUBSTR(ac_relacion, 1, 1) = ' + (edCO_IDACTIVIDAD_RESUMEN.Items.Objects[iloop] as TCadena).Cadena + ') OR';
    sWhere := Copy(sWhere, 0, Length(sWhere) - 2);
    sWhere := sWhere + ')';
  end;

  if edCO_IDACTIVIDAD.Text <> '' then
    sWhere := sWhere + ' AND ac_relacion = ' + (edCO_IDACTIVIDAD.Items.Objects[edCO_IDACTIVIDAD.itemIndex] as TCadena).Cadena;

  if not fraEjecutivoEnt.IsEmpty then
    sWhere := sWhere + ' AND ejecentidad.ec_id = ' + SqlValue(fraEjecutivoEnt.Codigo);

  if not fraUsuarioRevision.IsEmpty then
    sWhere := sWhere + ' AND aco.co_usurevision = ' + SqlValue(fraUsuarioRevision.Codigo);

  if not edCO_FECHAREVISION_DESDE.IsEmpty then
  begin
    if not edCO_FECHAREVISION_HASTA.IsEmpty then
    begin
      sWhere := sWhere + ' AND aco.co_fecharevision >= ' + SqlDate(edCO_FECHAREVISION_DESDE.Date);
      sWhere := sWhere + ' AND aco.co_fecharevision <= ' + SqlDate(edCO_FECHAREVISION_HASTA.Date);
    end
    else
      sWhere := sWhere + ' AND aco.co_fecharevision >= ' + SqlDate(edCO_FECHAREVISION_DESDE.Date);
  end
  else
    if not edCO_FECHAREVISION_HASTA.IsEmpty then
      sWhere := sWhere + ' AND aco.co_fecharevision <= ' + SqlDate(edCO_FECHAREVISION_HASTA.Date);

    if sDocFaltante <> '' then
    sWhere := sWhere + ' AND art.afiliacion.falta_doc_contrato(aco.co_contrato) LIKE ''' + sDocFaltante + '''';

  IIF(fraRegimen.IsEmpty, '', ' AND aco.CO_IDTIPOREGIMEN ' + SqlValue(fraRegimen.Value));


  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  CalcTotales;

  tbVerTarifasClick(nil);

  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
    EnableControls([tbPropiedades, tbImprimir, tbExportar], false);
  end
  else
    EnableControls([tbPropiedades, tbImprimir, tbExportar]);
end;

procedure TfrmConsultaContrato.edCO_IDACTIVIDAD_RESUMENCloseUp(Sender: TObject; var Cancel: Boolean);
begin
  CargaActividad;
end;

procedure TfrmConsultaContrato.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No hay datos seleccionados.');
    Abort;
  end;

  frmContratoConsultaEndoso.Free;
  frmContratoConsultaEndoso := TfrmContratoConsultaEndoso.Create(Self);
  frmContratoConsultaEndoso.CargarDatos(sdqConsulta.FieldByName('co_contrato').AsInteger);
end;

procedure TfrmConsultaContrato.CargaComboEstado;
var
  aId: TCadena;
  aSDQuery: TSDQuery;
  sSql: String;
begin
  aSDQuery := TSDQuery.Create(Self);
  with aSDQuery do
  try
    DatabaseName := 'dbPrincipal';
    cmbCO_ESTADO.Items.Clear;
    sSql :=
      'SELECT tb_codigo, tb_descripcion' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''AFEST''';
    OpenQuery(aSDQuery, sSql, True);

    while not Eof do
    begin
      aId := TCadena.Create();
      aId.Cadena := FieldByName('tb_codigo').AsString;
      cmbCO_ESTADO.Items.AddObject(aId.Cadena + ' - ' + FieldByName('tb_descripcion').AsString, aId);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmConsultaContrato.CargaActividadResumen;
var
  aId: TCadena;
  aSDQuery: TSDQuery;
  sSql: String;
begin
  aSDQuery := TSDQuery.Create(Self);
  with aSDQuery do
  try
    DatabaseName := 'dbPrincipal';

    sSql :=
      'SELECT DISTINCT a.ac_relacion relacion, b.ac_descripcion descripcion' +
                ' FROM cac_actividad a, cac_actividad b' +
               ' WHERE LENGTH(a.ac_relacion) = 1' +
                 ' AND a.ac_relacion = b.ac_codigo' +
            ' ORDER BY relacion, descripcion';
    OpenQuery(aSDQuery, sSql, True);

    edCO_IDACTIVIDAD_RESUMEN.Items.Clear;
    while not Eof do
    begin
      aId := TCadena.Create();
      aId.Cadena := FieldByName('relacion').AsString;
      edCO_IDACTIVIDAD_RESUMEN.Items.AddObject(FieldByName('relacion').AsString + ' - ' +
                                               FieldByName('descripcion').AsString, aId);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmConsultaContrato.CargaActividad;
var
  aId: TCadena;
  aSDQuery: TSDQuery;
  iLoop: Integer;
  sSql: String;
begin
  aSDQuery := TSDQuery.Create(Self);
  with aSDQuery do
  try
    DatabaseName := 'dbPrincipal';

    edCO_IDACTIVIDAD.Items.Clear;
    if edCO_IDACTIVIDAD_RESUMEN.Text <> '' then
    begin
      sSql :=
        'SELECT DISTINCT a.ac_relacion relacion, b.ac_descripcion descripcion' +
                  ' FROM cac_actividad a, cac_actividad b' +
                 ' WHERE LENGTH(a.ac_relacion) = 6';
      if edCO_IDACTIVIDAD_RESUMEN.Text <> '' then
      begin
        sSql := sSql + ' AND (';
        for iLoop := 0 to  edCO_IDACTIVIDAD_RESUMEN.Items.count - 1 do
          if edCO_IDACTIVIDAD_RESUMEN.Checked[iLoop] then
            sSql := sSql + ' (SUBSTR(a.ac_relacion, 1, 1) = ' + (edCO_IDACTIVIDAD_RESUMEN.Items.Objects[iLoop] as TCadena).Cadena + ') OR';

        sSql := Copy(sSql, 0, Length(sSql) - 2);
        sSql := sSql + ')';
      end;
      sSql := sSql + ' AND a.ac_relacion = b.ac_codigo ORDER BY relacion, descripcion';

      OpenQuery(aSDQuery, sSql, True);

      while not Eof do
      begin
        aId := TCadena.Create();
        aId.Cadena := FieldByName('relacion').AsString;
        edCO_IDACTIVIDAD.Items.AddObject(FieldByName('relacion').AsString + ' - ' +
                                         FieldByName('descripcion').AsString, aId);
        Next;
      end;
    end;
  finally
    Free;
  end;
end;
procedure TfrmConsultaContrato.edCO_IDACTIVIDADDropDown(Sender: TObject);
begin
  CargaActividad;
end;

procedure TfrmConsultaContrato.tbNuevoClick(Sender: TObject);
var
  aIdFormulario: TTableId;
begin
  if not(sdqConsulta.Active and not sdqConsulta.Eof) then
    raise Exception.Create('Debe elegir un registro.');
  {
  Esta llamada a sdqConsulta no se debe efectuar dentro del with
  porque sino considera que se trata del sdqConsulta del Formulario
  }
  aIdFormulario := sdqConsulta.FieldByName('idformulario').AsInteger;

  with TfrmConsultaTraspasoIngreso.Create(Self) do
  try
    DoCargar(aIdFormulario);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmConsultaContrato.tbConsultaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No hay datos seleccionados.');
    Abort;
  end;

  if not Assigned(frmModificacionContrato) then
    frmModificacionContrato := TfrmModificacionContrato.Create(frmPrincipal);
  frmModificacionContrato.DoCargarDatos(sdqConsulta.FieldByName('en_id').AsInteger,
                                        sdqConsulta.FieldByName('co_contrato').AsInteger, fsConsultar);
  frmModificacionContrato.Show;
end;

procedure TfrmConsultaContrato.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;


  with sdqConsulta do
  begin
    TFloatField(FieldByName('co_masatotal')).Currency     := True;
    TFloatField(FieldByName('rc_masasalarial')).Currency  := True;
    TFloatField(FieldByName('tc_alicuotapesos')).Currency := True;
  end;
end;

procedure TfrmConsultaContrato.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;

procedure TfrmConsultaContrato.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active Then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);

      if sdqConsulta.Active and not sdqConsulta.IsEmpty then
        edTotalRegistros.Value := sdqConsulta.RecordCount
      else
        edTotalRegistros.Clear;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmConsultaContrato.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                               FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    if AreIn(LowerCase(Column), ['co_totempleados', 'rc_empleados']) then
      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0)
    else
      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmConsultaContrato.tbVerTarifasClick(Sender: TObject);
begin
  Grid.ColumnByField['tc_alicuotapesos'].Visible := tbVerTarifas.Down;
  Grid.ColumnByField['tc_porcmasa'].Visible      := tbVerTarifas.Down;
end;

procedure TfrmConsultaContrato.mnuImprimirRenovacionAutomaticaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No hay datos seleccionados.');
    Abort;
  end;
  ImprimirUltimaRenovacionAutomatica(sdqConsulta.FieldByName('co_contrato').AsInteger);
end;

procedure TfrmConsultaContrato.mnuMailRenovacionAutomaticaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No hay datos seleccionados.');
    Abort;
  end;
  ImprimirUltimaRenovacionAutomatica(sdqConsulta.FieldByName('co_contrato').AsInteger, True);
end;

procedure TfrmConsultaContrato.tbImprimirUltimaRenovacionClick(Sender: TObject);
begin
  tbImprimirUltimaRenovacion.CheckMenuDropdown;
end;

end.

