unit unEndososMultiples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraCodigoDescripcion, unfraCtbTablas, StdCtrls, Mask,
  ToolEdit, DateComboBox, unArtFrame, unArtDbFrame, unFraEmpresa, unFraEmpresaAfi, CheckCombo, DBCheckCombo,
  IntEdit, unFraDomicilio, unfraVendedores, unFraEntidades, PatternEdit, ComboEditor, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unfraLocalidad, unArtDBAwareFrame, PeriodoPicker, FormPanel, OleServer, JvExControls,
  JvComponent, JvSpecialProgress, unFraCodDesc, Variants, Excel2000, RxToolEdit,
  RxPlacemnt;

type
  TfrmEndososMultiples = class(TfrmCustomConsulta)
    sdq_Actividad_Resumen: TSDQuery;
    ds_Actividad_Resumen: TDataSource;
    dsActividad: TDataSource;
    sdqActividad: TSDQuery;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    tsFiltros1: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
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
    edCO_IDACTIVIDAD_RESUMEN: TDBCheckCombo;
    edCO_IDACTIVIDAD: TDBCheckCombo;
    fraEntidades: TfraEntidades;
    fraVendedores: TfraVendedores;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edCantEmpleadosDesde: TIntEdit;
    edCantEmpleadosHasta: TIntEdit;
    GroupBox4: TGroupBox;
    fraEmpresaAfi: TfraEmpresaAfi;
    lbRSocial: TLabel;
    GroupBox5: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    edCO_TOTEMPLEADOS_DESDE: TIntEdit;
    edCO_TOTEMPLEADOS_HASTA: TIntEdit;
    GroupBox6: TGroupBox;
    edCO_DIASFRANQUICIA_HASTA: TIntEdit;
    edCO_DIASFRANQUICIA_DESDE: TIntEdit;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox7: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    cmbCO_VIGENCIAHASTA: TDateComboBox;
    cmbCO_VIGENCIADESDE: TDateComboBox;
    GroupBox8: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    cmbCO_FECHARECEPCION: TDateComboBox;
    cmbCO_FECHABAJA: TDateComboBox;
    GroupBox9: TGroupBox;
    Label8: TLabel;
    fraCO_ESTADO: TfraCtbTablas;
    GroupBox10: TGroupBox;
    edContratos: TEdit;
    Label1: TLabel;
    ToolBar1: TToolBar;
    tAgregarTXT: TToolButton;
    tbLimpiarTXT: TToolButton;
    OpenDialog: TOpenDialog;
    fraCO_MOTIVOALTA: TfraStaticCTB_TABLAS;
    fraCO_IDEJECUTIVO: TfraStaticCodigoDescripcion;
    fraCO_CLAUSULAESPECIAL: TfraStaticCTB_TABLAS;
    fraCO_IDARTFUTURA: TfraStaticCodigoDescripcion;
    fraEM_SECTOR: TfraStaticCTB_TABLAS;
    fraCO_MOTIVOBAJA: TfraStaticCTB_TABLAS;
    fraCO_IDGESTOR: TfraStaticCodigoDescripcion;
    fraCO_IDARTANTERIOR: TfraStaticCodigoDescripcion;
    fraCO_ORIGEN: TfraStaticCTB_TABLAS;
    fraEM_FORMAJ: TfraStaticCTB_TABLAS;
    fraEM_SUSS: TfraStaticCTB_TABLAS;
    fraUB_CALLE_POSTAL: TfraLocalidad;
    fraUB_CALLE_LEGAL: TfraLocalidad;
    fpVigencia: TFormPanel;
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edPeriodo: TPeriodoPicker;
    Label2: TLabel;
    tbFormatoContrato: TToolButton;
    tbImportarArchivo: TToolButton;
    fpImportarArchivo: TFormPanel;
    GroupBox11: TGroupBox;
    edArchivo: TEdit;
    ToolBar2: TToolBar;
    tbAgregarArchivo: TToolButton;
    tbVerFormato: TToolButton;
    btnAceptar2: TButton;
    btnCerrar: TButton;
    t1: TTimer;
    fpProcesando: TFormPanel;
    lbAccion: TLabel;
    progress: TJvSpecialProgress;
    Button1: TButton;
    Label17: TLabel;
    fraEM_HOLDING: TfraCodDesc;
    ExcelApp: TExcelApplication;
    ExcelWS: TExcelWorksheet;
    ExcelWB: TExcelWorkbook;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure edCO_IDACTIVIDAD_RESUMENCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure tbCambioTarifaClick(Sender: TObject);
    procedure tbRenovacionesVigenciaClick(Sender: TObject);
    procedure tbEndosoClick(Sender: TObject);
    procedure tbLimpiarTXTClick(Sender: TObject);
    procedure tAgregarTXTClick(Sender: TObject);
    procedure pcFiltrosChange(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbFormatoContratoClick(Sender: TObject);
    procedure tbVerFormatoClick(Sender: TObject);
    procedure tbAgregarArchivoClick(Sender: TObject);
    procedure fpImportarArchivoBeforeShow(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure t1Timer(Sender: TObject);
    procedure tbImportarArchivoClick(Sender: TObject);
    procedure fpProcesandoBeforeShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure fpVigenciaBeforeShow(Sender: TObject);
  private
    FCancelarProceso: Boolean;

    function GetCountLineasExcel: Integer;
    function IsEmptyLine(const aValor1, aValor2, aValor3: String): Boolean;

    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure ExtenderVigencia;
    procedure ValidarSeleccion;
    procedure VerificarExcel;
  public
  end;

var
  frmEndososMultiples: TfrmEndososMultiples;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, VCLExtra, AnsiSql, General, unContratoConsultaEndoso, sqlFuncs,
  unModificaContrato, Periodo, unCambioTarifaArchivoExterno, unAfiliaciones, unArt, Menus, DateTimeFuncs, unSesion;

{$R *.DFM}

procedure TfrmEndososMultiples.FormCreate(Sender: TObject);
begin
  inherited;

  fraEntidades.ExtraCondition := ' AND en_entramite = ''N'' ';

  fraCO_MOTIVOALTA.Clave := 'MOTIA';
  fraCO_MOTIVOBAJA.Clave := 'MOTIB';
  fraCO_ESTADO.Clave := 'AFEST';
  fraCO_ORIGEN.Clave := 'ORSOL';
  fraCO_CLAUSULAESPECIAL.Clave := 'CLAUS';
  fraEM_FORMAJ.Clave := 'FJURI';
  fraEM_SUSS.Clave := 'SUSS';
  fraEM_SECTOR.Clave := 'SECT';

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

  fraEmpresaAfi.ShowBajas := True;
  frmPrincipal.mnuEndososMultiples.Enabled := False;

  tbImportarArchivo.Left := 96;

  EnableControls([tbModificar]);
end;

procedure TfrmEndososMultiples.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmEndososMultiples := nil;
  frmPrincipal.mnuEndososMultiples.Enabled := True;
end;

procedure TfrmEndososMultiples.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  sdqConsulta.Close;
  fraEmpresaAfi.Clear;
  cmbCO_VIGENCIADESDE.Clear;
  cmbCO_VIGENCIAHASTA.Clear;
  cmbCO_FECHARECEPCION.Clear;
  fraCO_MOTIVOALTA.Clear;
  cmbCO_FECHABAJA.Clear;
  fraCO_MOTIVOBAJA.Clear;
  fraCO_ESTADO.Clear;
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
  fraVendedores.Clear;
  tbLimpiarTXTClick(nil);
end;

procedure TfrmEndososMultiples.tbRefrescarClick(Sender: TObject);
begin
  if not fraEntidades.IsEmpty or not fraVendedores.IsEmpty then
    MsgBox('Al seleccionar una entidad o un vendedor es posible que un mismo contrato se vea repetido.', MB_ICONEXCLAMATION, 'Atención');

  // Armar SQL de sdqConsulta
  sdqConsulta.SQL.Text :=
    'SELECT aem.em_nombre, aem.em_cuit, aco.co_contrato, aco.co_idempresa, estado.tb_descripcion estado,' +
          ' aco.co_vigenciadesde, aco.co_estado, aco.co_vigenciahasta, aco.co_fechaimpresion, aco.co_recepcontrato,' +
          ' afo.fo_formulario, origen.tb_descripcion origen, aco.co_fecharecepcion, aem.em_feinicactiv,' +
          ' aco.co_fechaafiliacion, formaj.tb_descripcion formaj, sector.tb_descripcion sector,' +
          ' holdin.ge_descripcion holdin, aem.em_suss, ecuenta.ec_nombre ejcuenta, gestor.gc_nombre gestor,' +
          ' artact.ar_nombre art_act, aco.co_fechabaja, mot_baj.tb_descripcion motivo_baja, artfut.ar_nombre art_fut,' +
          ' act.ac_descripcion, aco.co_nivel, aco.co_totempleados, aco.co_masatotal, aco.co_observaciones,' +
          ' aco.co_diasfranquicia, aco.co_vigenciafranquicia, aco.co_clausulaespecial, aco.co_vigenciaclausula,' +
          ' afiliacion.check_cobertura(aco.co_contrato) esbaja' +
     ' FROM aco_contrato aco, aem_empresa aem, ctb_tablas estado, afo_formulario afo, ctb_tablas origen,' +
          ' ctb_tablas formaj, ctb_tablas sector, age_grupoeconomico holdin, afi.aec_ejecutivocuenta ecuenta,' +
          ' afi.agc_gestorcuenta gestor, aar_art artact, aar_art artfut, ctb_tablas mot_baj, cac_actividad act,' +
          ' adc_domiciliocontrato adc_legal, adc_domiciliocontrato adc_postal' +
            IIF(fraEntidades.IsEmpty, '', ', xen_entidad xen') +
            IIF(fraEntidades.IsEmpty and fraVendedores.IsEmpty, '', ', xev_entidadvendedor xev, avc_vendedorcontrato avc') +
    ' WHERE aem.em_id = aco.co_idempresa' +
      ' AND estado.tb_codigo = aco.co_estado' +
      ' AND estado.tb_clave = ''AFEST''' +
      ' AND afo.fo_id = aco.co_idformulario' +
      ' AND origen.tb_codigo = aco.co_origen' +
      ' AND origen.tb_clave = ''ORSOL''' +
      ' AND formaj.tb_codigo(+) = aem.em_formaj' +
      ' AND formaj.tb_clave(+) = ''FJURI''' +
      ' AND sector.tb_codigo(+) = aem.em_sector' +
      ' AND sector.tb_clave(+) = ''SECT''' +
      ' AND holdin.ge_id(+) = aem.em_idgrupoeconomico' +
      ' AND ecuenta.ec_id(+) = aco.co_codejecutivo' +
      ' AND gestor.gc_id(+) = aco.co_idgestor' +
      ' AND artact.ar_id(+) = aco.co_idartanterior' +
      ' AND mot_baj.tb_codigo(+) = aco.co_motivobaja' +
      ' AND mot_baj.tb_clave(+) = ''MOTIB''' +
      ' AND artfut.ar_id(+) = aco.co_idartfutura' +
      ' AND act.ac_id(+) = aco.co_idactividad' +
      ' AND adc_legal.dc_contrato = aco.co_contrato' +
      ' AND adc_legal.dc_tipo = ''L''' +
      ' AND adc_postal.dc_contrato = aco.co_contrato' +
      ' AND adc_postal.dc_tipo = ''P''' +
        IIF(fraEntidades.IsEmpty and fraVendedores.IsEmpty, '', ' AND aco.co_contrato = avc.vc_contrato AND avc.vc_identidadvend = xev.ev_id') +
        IIF(fraEntidades.IsEmpty, '', ' AND xen.en_id = xev.ev_identidad AND xen.en_entramite = ''N'' AND xev.ev_identidad = ' + SqlValue(fraEntidades.Value)) +
        IIF(fraVendedores.IsEmpty, '', ' AND xev.ev_idvendedor = ' + SqlValue(fraVendedores.Value)) +

        // FILTROS
        IIF(fraEmpresaAfi.IsEmpty, '', ' AND aco.co_contrato = ' + SqlValue(fraEmpresaAfi.Contrato)) +
        IIF(cmbCO_VIGENCIADESDE.IsEmpty, '', ' AND aco.co_vigenciadesde >= ' + SqlDate(cmbCO_VIGENCIADESDE.Date)) +
        IIF(cmbCO_VIGENCIAHASTA.IsEmpty, '', ' AND aco.co_vigenciahasta <= ' + SqlDate(cmbCO_VIGENCIAHASTA.Date)) +
        IIF(cmbCO_FECHARECEPCION.IsEmpty, '', ' AND aco.co_fecharecepcion = ' + SqlDate(cmbCO_FECHARECEPCION.Date)) +
        IIF(fraCO_MOTIVOALTA.IsEmpty, '', ' AND aco.co_motivoalta = ' + fraCO_MOTIVOALTA.AsString) +
        IIF(cmbCO_FECHABAJA.IsEmpty, '', ' AND aco.co_fechabaja = ' + SqlDate(cmbCO_FECHABAJA.Date)) +
        IIF(fraCO_MOTIVOBAJA.IsEmpty, '', ' AND aco.co_motivobaja = ' + fraCO_MOTIVOBAJA.AsString) +
        IIF(fraCO_ESTADO.IsEmpty, '', ' AND aco.co_estado = ' + fraCO_ESTADO.Value) +
        IIF(fraCO_IDEJECUTIVO.IsEmpty, '', ' AND aco.co_idejecutivo = ' + fraCO_IDEJECUTIVO.AsString) +
        IIF(fraCO_IDGESTOR.IsEmpty, '', ' AND aco.co_idgestor = ' + fraCO_IDGESTOR.AsString) +
        IIF(fraCO_IDARTANTERIOR.IsEmpty, '', ' AND aco.co_idartanterior = ' + fraCO_IDARTANTERIOR.AsString) +
        IIF(edCO_IDACTIVIDAD.Text = '', '', ' AND aco.co_idactividad ' + edCO_IDACTIVIDAD.InSql) +
        IIF(edCO_TOTEMPLEADOS_DESDE.IsEmpty, '', ' AND aco.co_totempleados >= ' + SqlValue(edCO_TOTEMPLEADOS_DESDE.Value)) +
        IIF(edCO_TOTEMPLEADOS_HASTA.IsEmpty, '', ' AND aco.co_totempleados <= ' + SqlValue(edCO_TOTEMPLEADOS_HASTA.Value)) +
        IIF(fraCO_ORIGEN.IsEmpty, '', ' AND aco.co_origen = ' + fraCO_ORIGEN.AsString) +
        IIF(fraCO_CLAUSULAESPECIAL.IsEmpty, '', ' AND aco.co_clausulaespecial = ' + fraCO_CLAUSULAESPECIAL.Value) +
        IIF(edCO_DIASFRANQUICIA_DESDE.IsEmpty, '', ' AND aco.co_diasfranquicia >= ' + SqlValue(edCO_DIASFRANQUICIA_DESDE.Value)) +
        IIF(edCO_DIASFRANQUICIA_HASTA.IsEmpty, '', ' AND aco.co_diasfranquicia <= ' + SqlValue(edCO_DIASFRANQUICIA_HASTA.Value)) +
        IIF(fraCO_IDARTFUTURA.IsEmpty, '', ' AND aco.co_idartfutura = ' + fraCO_IDARTFUTURA.AsString) +
        IIF(fraEM_FORMAJ.IsEmpty, '', ' AND aem.em_formaj = ' + fraEM_FORMAJ.AsString) +
        IIF(fraEM_HOLDING.IsEmpty, '', ' AND aem.em_idgrupoeconomico = ' + SqlValue(fraEM_HOLDING.Value)) +
        IIF(fraEM_SUSS.IsEmpty, '', ' AND aem.em_suss = ' + fraEM_SUSS.AsString) +
        IIF(fraEM_SECTOR.IsEmpty, '', ' AND aem.em_sector = ' + fraEM_SECTOR.AsString) +
        IIF(edContratos.Text='', '', ' AND aco.co_contrato IN (' + edContratos.Text + ')') +
        IIF(fraUB_CALLE_POSTAL.IsEmpty, '', fraUB_CALLE_POSTAL.GetWhere) +
        IIF(fraUB_CALLE_LEGAL.IsEmpty, '', fraUB_CALLE_LEGAL.GetWhere);

  inherited;

  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
    EnableControls([tbPropiedades, tbImprimir, tbExportar], false);
  end
  else
    EnableControls([tbPropiedades, tbImprimir, tbExportar]);

  EnableControls([tbModificar]);
end;

procedure TfrmEndososMultiples.edCO_IDACTIVIDAD_RESUMENCloseUp(Sender: TObject; var Cancel: Boolean);
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_id, ac_descripcion' +
     ' FROM cac_actividad' +
    ' WHERE LENGTH(ac_codigo) = 6';
  if edCO_IDACTIVIDAD_RESUMEN.Text <> '' then
    sSql := sSql + ' AND SUBSTR(ac_codigo, 1, 1) ' + edCO_IDACTIVIDAD_RESUMEN.InSql;
  sdqActividad.SQL.Text := sSql + ' ORDER BY ac_descripcion';
  OpenQuery(sdqActividad);
end;

procedure TfrmEndososMultiples.tbCambioTarifaClick(Sender: TObject);
var
  iLoop: Integer;
  aIdsContratos: Array of Integer;
begin
  ValidarSeleccion;
  SetLength(aIdsContratos, Grid.SelectedRows.Count);

  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    aIdsContratos[iLoop] := sdqConsulta.FieldByName('co_contrato').AsInteger;
  end;

  with TfrmCambioTarifaArchivoExterno.Create(Self) do
  try
    DoCargarDatos(aIdsContratos);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEndososMultiples.tbRenovacionesVigenciaClick(Sender: TObject);
begin
  fpVigencia.ShowModal;
end;

procedure TfrmEndososMultiples.tbEndosoClick(Sender: TObject);
var
  iLoop: integer;
  aIdsContratos: Array of TTableId;
  aIdsEmpresas: Array of TTableId;
begin
  ValidarSeleccion;
  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));
    if sdqConsulta.FieldByName('esbaja').AsString <> '1' then
    begin
      if MsgBox('Ha elegido una empresa que no está activa. ¿ Desea continuar ?', MB_ICONINFORMATION + MB_YESNO) = idYes then
        Break
      else
        Abort;
    end;
  end;

  SetLength(aIdsContratos, Grid.SelectedRows.Count);
  SetLength(aIdsEmpresas, Grid.SelectedRows.Count);
  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    aIdsContratos[iLoop] := sdqConsulta.FieldByName('co_contrato').AsInteger;
    aIdsEmpresas[iLoop]  := sdqConsulta.FieldByName('co_idempresa').AsInteger;
  end;

  frmModificacionContrato.Free;
  frmModificacionContrato := TfrmModificacionContrato.Create(Self);
  frmModificacionContrato.DoCargarDatos(aIdsContratos, aIdsEmpresas);
end;

procedure TfrmEndososMultiples.tbLimpiarTXTClick(Sender: TObject);
begin
  edContratos.Clear;
end;

procedure TfrmEndososMultiples.tAgregarTXTClick(Sender: TObject);
var
  aArchivo: TextFile;
  sContratos: String;
  sTemp: String;
begin
  inherited;
  OpenDialog.Title := 'Archivo de contratos';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter     := 'Archivos de Texto(*.txt)|*.txt';
  if OpenDialog.Execute then
  try
    try
      AssignFile(aArchivo, OpenDialog.FileName);
      Reset(aArchivo);
      while (not Eof(aArchivo)) do
      begin
        ReadLn(aArchivo, sTemp);
        if StrToInt(sTemp) <> 0 then //Con esto chequeo que no ingrese cualquier cosa
          sContratos := sContratos + sTemp + ',';
      end;
      edContratos.Text := Copy(sContratos, 1, Length(sContratos) - 1);
    except
      edContratos.Text := '';
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
    //Quito la coma que sobra
  finally
    CloseFile(aArchivo);
  end;
end;

procedure TfrmEndososMultiples.ValidarSeleccion;
begin
  if Grid.SelectedRows.Count = 0 then
  begin
    MsgBox('No hay elementos seleccionados.');
    Abort;
  end;
end;

procedure TfrmEndososMultiples.pcFiltrosChange(Sender: TObject);
begin
  if (sdq_Actividad_Resumen.State = dsInactive) or (sdqActividad.State = dsInactive) then
  begin
    OpenQuery(sdq_Actividad_Resumen);
    OpenQuery(sdqActividad);
  end;
  
  inherited;
end;

procedure TfrmEndososMultiples.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  MenuGrilla: TPopUpMenu;
  Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqConsulta.Active and (not sdqConsulta.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);
      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmEndososMultiples.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

procedure TfrmEndososMultiples.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmEndososMultiples.ExtenderVigencia;
var
  sSql: String;
begin
  sSql := 'afiliacion.actualizar_vigencia(:periodo, :user);';

  BeginTrans;
  try
    EjecutarStoreSTEx(sSql, [TDateTimeEx.Create(LastDayOfPeriodo(edPeriodo.Periodo.Valor)), Sesion.UserId]);

    CommitTrans;
    MessageDlg('La operación se realizó con exito.', mtInformation, [mbOK], 0);
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;

procedure TfrmEndososMultiples.btnAceptarClick(Sender: TObject);
var
  dProximoPeriodo: TDateTime;
begin
  if edPeriodo.Periodo.IsNull then
    raise Exception.Create('El periodo no puede estar vacío.');

  //Se fija que el periodo de vigencia hasta actual no sea superior al proximo periodo
  dProximoPeriodo := AddMonths(Date, 1);
  if edPeriodo.Periodo.Valor > FormatDateTime('yyyymm', dProximoPeriodo) then
    raise Exception.Create('El período de vigencia hasta debe ser menor o igual que el período siguiente al de la fecha actual.');

  if MsgAsk('¿ Realmente desea extender la vigencia de los contratos ?') then
    ExtenderVigencia;
end;

procedure TfrmEndososMultiples.btnCancelarClick(Sender: TObject);
begin
  fpVigencia.ModalResult := mrCancel;
end;

procedure TfrmEndososMultiples.tbFormatoContratoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + #13 + #10 +
             '* Extensión: .TXT' + #13 + #10 +
             '* Encabezado: No debe ingresarse encabezado' + #13 + #10 +
             '* Cuerpo: ' + #13 + #10 + '   - Campos: 1) Nro de Contrato' + #13 + #10 +
             '   - Obs: Si se agregan más campos deben estar separados por '';''' + #13 + #10 +
             '          Se debe efectuar un salto de línea (Enter) al final de cada línea (incluyendo la última)'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmEndososMultiples.tbVerFormatoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + #13 + #10 +
             '* Extensión: .XLS' + #13 + #10 +
             '* Encabezado: No debe ingresarse encabezado' + #13 + #10 +

             '* Cuerpo: ' + #13 + #10 +
             '   - Campos: ' + #13 + #10 +
             '             1) Nro de Contrato' + #13 + #10 +
             '             2) Fecha de Baja (dd/mm/yyyy)' + #13 + #10 +
             '             3) Código de ART Futura ' + #13 + #10 +
             '* Errores: Las líneas con errores no serán procesadas.'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmEndososMultiples.tbAgregarArchivoClick(Sender: TObject);
begin
  inherited;

  OpenDialog.Title      := 'Archivo de contratos';
  OpenDialog.DefaultExt := 'xls';
  OpenDialog.Filter     := 'Archivos de Excel(*.xls)|*.xls';

  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfrmEndososMultiples.fpImportarArchivoBeforeShow(Sender: TObject);
begin
  edArchivo.Clear;
end;

procedure TfrmEndososMultiples.btnAceptar2Click(Sender: TObject);
begin
  Verificar(not FileExists(edArchivo.Text), edArchivo, 'Por favor, elija el archivo a procesar.');

  fpProcesando.ShowModal;
end;

procedure TfrmEndososMultiples.btnCerrarClick(Sender: TObject);
begin
  fpImportarArchivo.Close;
end;

procedure TfrmEndososMultiples.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  VerificarExcel;
end;

procedure TfrmEndososMultiples.VerificarExcel;
  function AddError(aErrores: TStringList; const aNroLinea: Integer; const aMsgError: String; const aError: Boolean): Boolean;
  begin
    if aError then
      aErrores.Add(Format('Línea %d: %s', [aNroLinea, aMsgError]));

    Result := aError;
  end;

var
  aErrores: TStringList;
  aFechaBaja: TDate;
  aFormEndoso: TfrmModificacionContrato;
  bError: Boolean;
  iLCid: Integer;
  iRow: Integer;
  sColA: String;
  sColB: String;
  sColC: String;
  sSql: String;
begin
  aErrores := TStringList.Create;
  aFechaBaja := 0;

  aFormEndoso := TfrmModificacionContrato.Create(Self);
  aFormEndoso.FormStyle := fsNormal;
  aFormEndoso.Visible := False;
  aFormEndoso.WindowState := wsMinimized;

  iLCid := GetUserDefaultLCID;

  try
    ExcelApp.Workbooks.Open(edArchivo.Text, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
    ExcelApp.Visible[0] := False;
    ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
    ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
    ExcelWS.Activate;
    with ExcelWS do
    begin
      iRow := 1;

      sColA := Range['A1', 'A1'].Value2;
      sColB := Range['B1', 'B1'].Value2;
      sColC := Range['C1', 'C1'].Value2;
      progress.Maximum := GetCountLineasExcel;

      while not IsEmptyLine(sColA, sColB, sColC) do
      begin
        try
          if FCancelarProceso then
            Break;

          aFormEndoso.FCurrentLine := IntToStr(iRow); //Me guardo la linea para acceder desde otro lado


          bError := False;

          // ***  VERIFICO QUE EL Nº DE CONTRATO SEA VÁLIDO  ***
          if not bError then
          try
            StrToInt(sColA);
          except
            bError := AddError(aErrores, iRow, 'Nº de contrato inválido.', True);
          end;

          if not bError then
          begin
            sSql :=
              'SELECT co_fechaafiliacion, co_vigenciadesde, co_vigenciahasta' +
               ' FROM aco_contrato' +
              ' WHERE co_contrato = :contrato';
            with GetQueryEx(sSql, [sColA]) do
            try
              // ***  VERIFICO SI EXISTE ESE Nº CONTRATO EN LA BASE DE DATOS  ***
              if IsEmpty then
                bError := AddError(aErrores, iRow, 'Nº de contrato inexistente.', True);

              // ***  VERIFICO QUE LA FECHA SEA VÁLIDA  ***
              aFechaBaja := 0;
              if not bError then
              try
                aFechaBaja := StrToInt(sColB);
              except
                bError := AddError(aErrores, iRow, 'Formato de fecha inválido.', True);
              end;

              if not bError then
                bError := AddError(aErrores, iRow, 'Fecha de baja menor a la fecha de afiliación.', (aFechaBaja < FieldByName('co_fechaafiliacion').AsDateTime));

              if not bError then
                bError := AddError(aErrores, iRow, 'Fecha de baja menor a la fecha de vigencia desde.', (aFechaBaja < FieldByName('co_vigenciadesde').AsDateTime));

              if not bError then
                bError := AddError(aErrores, iRow, 'Fecha de baja mayor a la fecha de vigencia hasta.', (aFechaBaja > FieldByName('co_vigenciahasta').AsDateTime));

              // ***  VERIFICO QUE EL CÓDIGO DE ART FUTURA SEA VÁLIDO  ***
              if not bError then
              try
                StrToInt(sColC);
              except
                bError := AddError(aErrores, iRow, 'Código de ART futura inválido.', True);
              end;

              if not bError then
              begin
                sSql :=
                  'SELECT 1' +
                   ' FROM aar_art' +
                  ' WHERE ar_id = :id';
                if not ExisteSqlEx(sSql, [sColC]) then
                  bError := AddError(aErrores, iRow, 'Código de ART futura inexistente.', True);
              end;
            finally
              Free;
            end;
          end;

          if not bError then
            aFormEndoso.DoAutoEndoso(StrToInt(sColA), StrToInt(sColC), aFechaBaja, '6', '07', '07')
          else
          begin
            aFormEndoso.DoAgregarLinea(IntToStr(iRow), sColA, '', '', '', '', aErrores.Text);
            aErrores.Clear;
          end;
        except
          // Nada..
        end;

        Inc(iRow);
        progress.StepIt;
        if (iRow mod 20) = 0 then
          Forms.Application.ProcessMessages;

        sColA := Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2;
        sColB := Range['B' + IntToStr(iRow), 'B' + IntToStr(iRow)].Value2;
        sColC := Range['C' + IntToStr(iRow), 'C' + IntToStr(iRow)].Value2;
      end;
    end;

    if FCancelarProceso then
      fpProcesando.ModalResult := mrCancel
    else
      fpProcesando.ModalResult := mrOk;

    fpImportarArchivo.ModalResult := mrOk;
  finally
    aErrores.Free;

    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Quit;
    ExcelApp.Disconnect;
    aFormEndoso.fpErroresEndoso.ShowModal;
    aFormEndoso.Close;
  end;
end;

function TfrmEndososMultiples.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColA: String;
  sColB: String;
  sColC: String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
    begin
      sColA := Range['A' + IntToStr(iLineNumber), 'A' + IntToStr(iLineNumber)].Value2;
      sColB := Range['B' + IntToStr(iLineNumber), 'B' + IntToStr(iLineNumber)].Value2;
      sColC := Range['C' + IntToStr(iLineNumber), 'C' + IntToStr(iLineNumber)].Value2;
    end;

    if IsEmptyLine(sColA, sColB, sColC) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

function TfrmEndososMultiples.IsEmptyLine(const aValor1, aValor2, aValor3: String): Boolean;
begin
  Result := (aValor1 = '') and (aValor2 = '') and (aValor3 = '');
end;

procedure TfrmEndososMultiples.tbImportarArchivoClick(Sender: TObject);
begin
  fpImportarArchivo.ShowModal;
end;

procedure TfrmEndososMultiples.fpProcesandoBeforeShow(Sender: TObject);
begin
  FCancelarProceso := False;

  progress.Position := 0;
  progress.Minimum := 0;

  lbAccion.Caption := 'Procesando archivo...';
  t1.Enabled := True;
end;

procedure TfrmEndososMultiples.Button1Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmEndososMultiples.fpVigenciaBeforeShow(Sender: TObject);
begin
  edPeriodo.Periodo.SetPeriodoFromDate(DBDate);
end;

end.
