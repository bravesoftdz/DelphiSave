unit unConfirmaTarifa;

interface

uses                  
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDbFrame, unFraEmpresa, FormPanel, unArtDBAwareFrame, PatternEdit, CardinalEdit, Menus,
  unFraStaticCodigoDescripcion, unfraMotivoEndoso, unFraStaticCTB_TABLAS;

type
  TfrmConfirmaTarifa = class(TfrmCustomConsulta)
    rgCA_CODRECEPCION: TRadioGroup;
    fpVigencia: TFormPanel;
    btnAceptar: TButton;
    Bevel1: TBevel;
    cmbEN_FECHAVIGENCIA: TDateComboBox;
    Label7: TLabel;
    btnCancelar: TButton;
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    lbRSocial: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cmbCA_FECHAIMPRESIONDesde: TDateComboBox;
    cmbET_VIGENCIATARIFA: TDateComboBox;
    cmbCA_FECHAIMPRESIONHasta: TDateComboBox;
    cmbET_FECHAAUTORIZADesde: TDateComboBox;
    cmbET_FECHAAUTORIZAHasta: TDateComboBox;
    GroupBox10: TGroupBox;
    Label8: TLabel;
    edContratos: TEdit;
    ToolBar1: TToolBar;
    tAgregarTXT: TToolButton;
    tbLimpiarTXT: TToolButton;
    OpenDialog: TOpenDialog;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    tbCalcularTotal: TToolButton;
    Label9: TLabel;
    edSeleccion: TCardinalEdit;
    Label10: TLabel;
    edTotal: TCardinalEdit;
    Registros: TGroupBox;
    chkActivos: TCheckBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    edCartas: TEdit;
    ToolBar2: TToolBar;
    tbAgregarCarta: TToolButton;
    tbEliminarCarta: TToolButton;
    tbFormatoCarta: TToolButton;
    tbFormatoContrato: TToolButton;
    chkContratosActivos: TCheckBox;
    popupImprimir: TPopupMenu;
    mnuGrilla: TMenuItem;
    mnuEndoso: TMenuItem;
    GroupBox4: TGroupBox;
    rgLotes: TRadioGroup;
    GroupBox5: TGroupBox;
    chkRgrl: TCheckBox;
    rgTipoAplicacion: TRadioGroup;
    Label3: TLabel;
    edFechaIncumplimientoDesde: TDateComboBox;
    fraMotivoEndoso: TfraStaticCTB_TABLAS;
    tbNuevaCarta: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tAgregarTXTClick(Sender: TObject);
    procedure tbLimpiarTXTClick(Sender: TObject);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridCellClick(Column: TColumn);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEliminarCartaClick(Sender: TObject);
    procedure tbAgregarCartaClick(Sender: TObject);
    procedure tbFormatoCartaClick(Sender: TObject);
    procedure tbFormatoContratoClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure mnuEndosoClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fpVigenciaBeforeShow(Sender: TObject);
    procedure tbNuevaCartaClick(Sender: TObject);
  private
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure CalcularFilas;
    procedure ConfirmarTarifa(bDesconciliarPer: Boolean);
  public
  end;

var
  frmConfirmaTarifa: TfrmConfirmaTarifa;

implementation

uses
  unPrincipal, CustomDlgs, VCLExtra, General, AnsiSQL, SqlFuncs, unDmPrincipal, unCuadroTarifarioContrato,
  unAfiliaciones, unARt, unComunes, unAfiGeneracionCartas, unAfiCartasDoc, unCustomDataModule, DateTimeFuncs, DateUtils,
  unGenerarMultiplesCartasPorContrato;

{$R *.DFM}

procedure Verificar(aCondicion: Boolean; aControl: TWinControl; aText: String);
begin
  if aCondicion then
  begin
    InvalidMsg(aControl, aText);
    Abort;
  end;
end;

procedure TfrmConfirmaTarifa.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
    'SELECT aco.co_contrato, aco.co_vigenciadesde, aco.co_vigenciahasta, aem.em_cuit, aem.em_nombre, tet.et_porcmasa,' +
          ' tet.et_sumafija, tet.et_alicuotapesos, tet.et_vigenciatarifa, tet.et_fechaautoriza,' +
          ' tet.et_usuarioautoriza, ac_codigo, ac_descripcion, motivo.tb_descripcion, cca.ca_nrocartadoc,' +
          ' cca.ca_fechaimpresion, cca.ca_id, cor.tb_descripcion correo, cca.ca_recepcionok, cca.ca_fecharecepcion,' +
          ' cca.ca_codrecepcion, rec.tb_descripcion desc_recepcion, tet.et_id, cca.ca_idendosotemp,' +
          ' aco.co_idactividad, aco.co_idactividad2, aco.co_idactividad3, tet.et_idactividad, tet.et_idactividad2,' +
          ' tet.et_idactividad3, tet.et_vigenciaendoso, tet.et_motivo, tet.et_enviosrt, tet.et_tipodetarifa,' +
          ' tet.et_porcmasatarifa, tet.et_porcdescvolumen, tet.et_porcdescnivel, tet.et_sumafijatarifa,' +
          ' tet.et_cargoadmin, tet.et_recargosin, tet.et_recargosin_sobrefijo, tet.et_recargosin_montofijo,' +
          ' tet.et_recargoesp, tet.et_recargoesp_sobrefijo, tet.et_usualta, tet.et_fechaalta, tet.et_usumodif,' +
          ' tet.et_fechamodif, tet.et_usubaja, tet.et_fechabaja, co_idformulario, co_fechabaja,' +
          ' motib.tb_descripcion motib, tet.et_incumplido_desde, tet.et_incumplido_hasta, tet.et_incumplido_sumafija,' +
          ' tet.et_incumplido_porcmasa, art.hys.get_cumplimientorelev(et_contrato) rgrl, et_tipolote' +
     ' FROM cac_actividad, aco_contrato aco, aem_empresa aem, cca_carta cca, ctb_tablas cor, ctb_tablas rec,' +
          ' ctb_tablas motivo, ctb_tablas motib, tmp.tet_endosotarifa tet' +
    ' WHERE tet.et_contrato = aco.co_contrato' +
      ' AND aco.co_idempresa = aem.em_id' +
      ' AND tet.et_id = cca.ca_idendosotemp(+)' +
      ' AND NVL(cca.ca_correoreimpresion, cca.ca_correo) = cor.tb_codigo(+)' +
      ' AND cor.tb_clave(+) = ''CORRE''' +
      ' AND cca.ca_codrecepcion = rec.tb_codigo(+)' +
      ' AND rec.tb_clave(+) = ''CODRE''' +
      ' AND et_idactividad = ac_id' +
      ' AND tet.et_motivo = motivo.tb_codigo' +
      ' AND motivo.tb_clave = ''MOTEN''' +
      ' AND aco.co_motivobaja = motib.tb_codigo(+)' +
      ' AND motib.tb_clave(+) = ''MOTIB''' +
        IIF(not fraEmpresa.edContrato.IsEmpty, ' AND aco.co_contrato = ' + SqlValue(fraEmpresa.edContrato.Value), '') +
        IIF(not fraMotivoEndoso.IsEmpty, ' AND et_motivo = ' + SqlValue(fraMotivoEndoso.Value), '') +
        IIF(not cmbCA_FECHAIMPRESIONDesde.IsEmpty, ' AND cca.ca_fechaimpresion >= ' + SqlDate(cmbCA_FECHAIMPRESIONDesde.Date), '') +
        IIF(not cmbCA_FECHAIMPRESIONHasta.IsEmpty, ' AND cca.ca_fechaimpresion <= ' + SqlDate(cmbCA_FECHAIMPRESIONHasta.Date), '') +
        IIF(not cmbET_VIGENCIATARIFA.IsEmpty, ' AND tet.et_vigenciatarifa = ' + SqlDate(cmbET_VIGENCIATARIFA.Date), '') +
        IIF(not cmbET_FECHAAUTORIZADesde.IsEmpty, ' AND tet.et_fechaautoriza >= ' + SqlDate(cmbET_FECHAAUTORIZADesde.Date), '') +
        IIF(not cmbET_FECHAAUTORIZAHasta.IsEmpty, ' AND tet.et_fechaautoriza <= ' + SqlDate(cmbET_FECHAAUTORIZAHasta.Date), '') +
        IIF(edContratos.Text = '', '', ' AND aco.co_contrato IN (' + edContratos.Text + ')') +
        IIF(edCartas.Text = '', '', ' AND cca.ca_nrocartadoc IN (' + edCartas.Text + ')') +
        IIF(rgCA_CODRECEPCION.ItemIndex = 0, ' AND cca.ca_recepcionok = ''S''', '') +
        IIF(rgCA_CODRECEPCION.ItemIndex = 1, ' AND cca.ca_recepcionok = ''N''', '') +
        IIF(rgLotes.ItemIndex = 0, ' AND et_motivo = ''03.01''', '') +
        IIF(rgLotes.ItemIndex = 1, ' AND et_motivo = ''03.02''', '') +
        IIF(rgLotes.ItemIndex = 2, ' AND et_motivo NOT LIKE ''03.%''', '') +
        IIF(chkActivos.Checked,' AND et_fechabaja IS NULL', '') +
        IIF(chkContratosActivos.Checked,' AND aco.co_estado = 1 ', '') +
        IIF(chkRgrl.Checked,' AND art.hys.get_cumplimientorelev(et_contrato) = ''S''', '') +
        SortDialog.OrderBy;

  inherited;

  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
    EnableControls([tbNuevo, tbEliminar, tbPropiedades, tbImprimir, tbExportar], False);
  end
  else
    EnableControls([tbNuevo, tbEliminar, tbPropiedades, tbImprimir, tbExportar]);

  CalcularFilas;
end;

procedure TfrmConfirmaTarifa.tbNuevoClick(Sender: TObject);
var
  bCancelar: Boolean;
  bDesconciliarPer: Boolean;
  iLoop: Integer;
  sMotivoEndoso: String;
  dFecha : TDate;
begin
  Verificar((not Seguridad.Claves.IsActive('PermisoGenerarEliminar')), Grid, 'No tiene autorización para esta opción.');
  Verificar((Grid.SelectedRows.Count <= 0), Grid, 'Debe seleccionar al menos un registro.');

  dFecha := sdqConsulta.FieldByName('et_vigenciatarifa').AsDateTime;

  //tk 55797 Siempre que se seleccione mas de un registro y no coincidan las f vigencia de tarifa el sistema no debe permitir aplicar los endosos, arrogando un cartel indicando esta situación.
  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    Grid.DataSource.DataSet.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    Verificar(dFecha <> sdqConsulta.FieldByName('et_vigenciatarifa').AsDateTime, Grid, 'Las fechas de vigencia de tarifa son diferentes');
  end;

  cmbEN_FECHAVIGENCIA.Date := sdqConsulta.FieldByName('et_vigenciaendoso').AsDateTime;

  if fpVigencia.ShowModal = mrOk then
  begin
    BeginTrans;
    try
      bCancelar := False;
      bDesconciliarPer := (MsgBox('¿ En caso de ser necesario, desea desconciliar los períodos a devengar ?', MB_ICONQUESTION + MB_YESNO) = IDYES);

      for iLoop := 0 to Grid.SelectedRows.Count - 1 do
      begin
        Grid.DataSource.DataSet.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

        if iLoop = 0 then
          sMotivoEndoso := Grid.DataSource.DataSet.FieldByName('et_motivo').AsString;

        if sMotivoEndoso <> Grid.DataSource.DataSet.FieldByName('et_motivo').AsString then
        begin
          bCancelar := True;
          InvalidMsg(Grid, 'Para generar endosos múltiples, todos los contratos seleccionados tienen que tener el mismo motivo de endoso.');
          Break;
        end;

        ConfirmarTarifa(bDesconciliarPer);
      end;

      if not bCancelar then
      begin
        CommitTrans;
        sdqConsulta.Close;
        OpenQuery(sdqConsulta);
        MessageDlg('La operación se ha realizado con éxito.', mtInformation, [mbOK], 0);
      end;
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al generar el endoso.');
      end;
    end;
  end;
end;

procedure TfrmConfirmaTarifa.tbEliminarClick(Sender: TObject);
var
  iLoop: Integer;
  sMsg: String;
begin
  Verificar((not Seguridad.Claves.IsActive('PermisoGenerarEliminar')), Grid, 'No tiene autorización para esta opción.');
  Verificar((not sdqConsulta.Active or sdqConsulta.Eof), Grid, 'No hay datos para eliminar.');
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'Por favor seleccione un registro.');
  Verificar((not sdqConsulta.FieldByName('et_fechabaja').IsNull), Grid, 'El registro ya ha sido eliminado.');

  if Grid.SelectedRows.Count = 1 then
    sMsg := '¿ Realmente desea eliminar este registro ?'
  else
    sMsg := '¿ Realmente desea eliminar estos registros ?';

  if MsgBox(sMsg, MB_ICONINFORMATION + MB_YESNO) = idNo then
    Abort;

  BeginTrans;
  Grid.DataSource.DataSet.DisableControls;


  with TSql.Create('tet_endosotarifa') do
  try
    SqlType := stUpdate;

    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

      Clear;
      PrimaryKey.Add('et_id',    sdqConsulta.FieldByName('et_id').AsInteger);
      Fields.Add('et_usubaja',   frmPrincipal.DBLogin.UserId);
      Fields.Add('et_fechabaja', SQL_ACTUALDATE, false);

      try
        EjecutarSQLST(Sql);
      except
        on E: Exception do
        begin
          RollBack;
          ErrorMsg(E, 'Error al eliminar los datos.');
        end;
      end;
    end;

    CommitTrans;
    MessageDlg('La operación se ha realizado con éxito.', mtInformation, [mbOK], 0);
    sdqConsulta.Close;
    OpenQuery(sdqConsulta);
  finally
    Grid.DataSource.DataSet.EnableControls;
    Free;
  end;
end;

procedure TfrmConfirmaTarifa.tbPropiedadesClick(Sender: TObject);
// Cuadro Tarifario
var
  frm: TfrmContratoTarifa;
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No hay datos seleccionados.');
    Abort;
  end;

  inherited;

  frm := TfrmContratoTarifa.Create(Self);
  try
    frm.DoCargarDatos(sdqConsulta.FieldByName('co_contrato').AsInteger, sdqConsulta.FieldByName('et_id').AsInteger);
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmConfirmaTarifa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuConfirmacionEndosos.Enabled := True;
  Action := caFree;
  frmConfirmaTarifa := nil;
  
  inherited;
end;

procedure TfrmConfirmaTarifa.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  if fraEmpresa.Locked then
    chkContratosActivos.Checked := False
  else
    fraEmpresa.Clear;

  fraMotivoEndoso.Clear;
  rgLotes.ItemIndex := 3;
  chkRgrl.Checked := False;
  cmbCA_FECHAIMPRESIONDesde.Clear;
  cmbCA_FECHAIMPRESIONHasta.Clear;
  cmbET_VIGENCIATARIFA.Clear;
  cmbET_FECHAAUTORIZADesde.Clear;
  cmbET_FECHAAUTORIZAHasta.Clear;
  edContratos.Clear;
  edCartas.Clear;
  rgCA_CODRECEPCION.ItemIndex := 2;
  chkActivos.Checked := True;
end;

procedure TfrmConfirmaTarifa.btnAceptarClick(Sender: TObject);
var 
  wDay: Word;
  wMonth: Word;
  wYear: Word;
begin
  Verificar((rgTipoAplicacion.ItemIndex = -1), rgTipoAplicacion, 'Debe indicar el Tipo de Endoso.');
  Verificar(cmbEN_FECHAVIGENCIA.IsEmpty, cmbEN_FECHAVIGENCIA, 'Debe ingresar una Fecha de Vigencia.');

  DecodeDate(cmbEN_FECHAVIGENCIA.Date, wYear, wMonth, wDay);
  Verificar((wDay <> 1) and (cmbEN_FECHAVIGENCIA.Date <> sdqConsulta.FieldByName('co_vigenciadesde').AsDateTime), cmbEN_FECHAVIGENCIA, 'La fecha de vigencia de la tarifa debe empezar el primer día de cada mes o ser igual a la fecha de inicio del contrato');

  //pedido via oral del trio Vila Grossi y Allo. No manifestaron tener algun Tk.
  Verificar((cmbEN_FECHAVIGENCIA.Date < sdqConsulta.FieldByName('co_vigenciadesde').AsDateTime) or
            (cmbEN_FECHAVIGENCIA.Date > IncYear(sdqConsulta.FieldByName('co_vigenciahasta').AsDateTime, 1)),
             cmbEN_FECHAVIGENCIA, 'La fecha de vigencia de la tarifa no deberá superar los 12 meses de la vigencia hasta del contrato.');

  //Verificar(((cmbEN_FECHAVIGENCIA.Date < sdqConsulta.FieldByName('co_vigenciadesde').AsDateTime) or (cmbEN_FECHAVIGENCIA.Date > sdqConsulta.FieldByName('co_vigenciahasta').AsDateTime)) and (sdqConsulta.FieldByName('co_fechabaja').IsNull), cmbEN_FECHAVIGENCIA, 'La fecha de vigencia de la tarifa debe estar dentro de la vigencia del contrato');
  Verificar((rgTipoAplicacion.ItemIndex > 0) and (edFechaIncumplimientoDesde.IsEmpty), edFechaIncumplimientoDesde, 'El campo F. Inc. Desde es obligatorio.');

  fpVigencia.ModalResult := mrOk;
end;

procedure TfrmConfirmaTarifa.btnCancelarClick(Sender: TObject);
begin
  fpVigencia.ModalResult := mrCancel;
end;

procedure TfrmConfirmaTarifa.FormCreate(Sender: TObject);
begin
  inherited;

  frmPrincipal.mnuConfirmacionEndosos.Enabled := False;

  fraEmpresa.ShowBajas := True;

  fraMotivoEndoso.Clave     := 'MOTEN';
  fraMotivoEndoso.Especial1 := '1';

  tbEliminar.Left := 308;
end;

procedure TfrmConfirmaTarifa.ConfirmarTarifa(bDesconciliarPer: Boolean);
var
  IdEndoso: TTableId;
  LocalContrato: String;
  sMotivoEndoso: String;
  SqlACO: TSql;
  SqlATC: TSql;
  SqlCCA: TSql;
  SqlTET: TSql;
  sSql: String;
  UpdatearContrato: Boolean;
{$IFNDEF ESSISTEMANUEVOEMI}
  bPuedeDesconciliar: Boolean;
{$ENDIF}
begin
// Genera Endoso

  UpdatearContrato :=
    (sdqConsulta.FieldByName('co_idactividad').AsString <> sdqConsulta.FieldByName('et_idactividad').AsString) or
    (sdqConsulta.FieldByName('co_idactividad2').AsString <> sdqConsulta.FieldByName('et_idactividad2').AsString) or
    (sdqConsulta.FieldByName('co_idactividad3').AsString <> sdqConsulta.FieldByName('et_idactividad3').AsString);

  SqlACO := TSql.Create('aco_contrato');
  SqlATC := TSql.Create('atc_tarifariocontrato');
  SqlCCA := TSql.Create('cca_carta');
  SqlTET := TSql.Create('tet_endosotarifa');
  try
    if UpdatearContrato then
    begin
      SqlACO.SqlType := stUpdate;
      SqlACO.PrimaryKey.Add('co_contrato', sdqConsulta.FieldByName('co_contrato').AsString);
      SqlACO.Fields.Add('co_idactividad',  sdqConsulta.FieldByName('et_idactividad').AsString);
      SqlACO.Fields.Add('co_idactividad2', sdqConsulta.FieldByName('et_idactividad2').AsString);
      SqlACO.Fields.Add('co_idactividad3', sdqConsulta.FieldByName('et_idactividad3').AsString);
    end;

    LocalContrato := sdqConsulta.FieldByName('co_contrato').AsString;

    SqlATC.SqlType := stUpdate;
    SqlATC.PrimaryKey.Add('tc_contrato',                 sdqConsulta.FieldByName('co_contrato').AsString);
    SqlATC.Fields.AddExtended('tc_sumafija',             sdqConsulta.FieldByName('et_sumafija').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_sumafijatarifa',       sdqConsulta.FieldByName('et_sumafijatarifa').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_porcmasatarifa',       sdqConsulta.FieldByName('et_porcmasatarifa').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_porcdescvolumen',      sdqConsulta.FieldByName('et_porcdescvolumen').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_porcdescnivel',        sdqConsulta.FieldByName('et_porcdescnivel').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_recargosin',           sdqConsulta.FieldByName('et_recargosin').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_recargosin_sobrefijo', sdqConsulta.FieldByName('et_recargosin_sobrefijo').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_recargosin_montofijo', sdqConsulta.FieldByName('et_recargosin_montofijo').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_recargoesp',           sdqConsulta.FieldByName('et_recargoesp').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_recargoesp_sobrefijo', sdqConsulta.FieldByName('et_recargoesp_sobrefijo').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.AddExtended('tc_cargoadmin',           sdqConsulta.FieldByName('et_cargoadmin').AsFloat, ALL_DECIMALS, False);
    SqlATC.Fields.Add('tc_tipodetarifa',                 sdqConsulta.FieldByName('et_tipodetarifa').AsString);
    SqlATC.Fields.Add('tc_vigenciatarifa',               cmbEN_FECHAVIGENCIA.Date);
    SqlATC.Fields.Add('tc_fechaautoriza',                sdqConsulta.FieldByName('et_fechaautoriza').AsDateTime);
    SqlATC.Fields.Add('tc_usuarioautoriza',              sdqConsulta.FieldByName('et_usuarioautoriza').AsString);
    SqlATC.Fields.Add('tc_usualta',                      sdqConsulta.FieldByName('et_usualta').AsString);
    SqlATC.Fields.Add('tc_fechaalta',                    sdqConsulta.FieldByName('et_fechaalta').AsDateTime);
    SqlATC.Fields.Add('tc_usumodif',                     sdqConsulta.FieldByName('et_usumodif').AsString);
    SqlATC.Fields.Add('tc_fechamodif',                   sdqConsulta.FieldByName('et_fechamodif').AsDateTime);

    if rgTipoAplicacion.ItemIndex = 0 then
    begin
      SqlATC.Fields.AddExtended('tc_alicuotapesos',        sdqConsulta.FieldByName('et_sumafija').AsFloat + 0.60, ALL_DECIMALS, False);
      SqlATC.Fields.AddExtended('tc_porcmasa',             sdqConsulta.FieldByName('et_porcmasa').AsFloat, ALL_DECIMALS, False);
      SqlATC.Fields.AddExtended('tc_incumplido_sumafija',  0, ALL_DECIMALS, False);
      SqlATC.Fields.AddExtended('tc_incumplido_porcmasa',  0, ALL_DECIMALS, False);
      SqlATC.Fields.AddDate('tc_incumplido_desde',         0, True);
    end
    else
    begin
      SqlATC.Fields.AddExtended('tc_alicuotapesos',        sdqConsulta.FieldByName('et_alicuotapesos').AsFloat, ALL_DECIMALS, False);
      SqlATC.Fields.AddExtended('tc_porcmasa',             sdqConsulta.FieldByName('et_porcmasa').AsFloat, ALL_DECIMALS, False);
      SqlATC.Fields.AddExtended('tc_incumplido_sumafija',  sdqConsulta.FieldByName('et_incumplido_sumafija').AsFloat, ALL_DECIMALS, False);
      SqlATC.Fields.AddExtended('tc_incumplido_porcmasa',  sdqConsulta.FieldByName('et_incumplido_porcmasa').AsFloat, ALL_DECIMALS, False);
      SqlATC.Fields.AddDate('tc_incumplido_desde',         edFechaIncumplimientoDesde.Date, True);
    end;


    SqlCCA.SqlType := stUpdate;
    SqlCCA.PrimaryKey.Add('ca_id', sdqConsulta.FieldByName('ca_id').AsInteger);
    SqlCCA.Fields.Add('ca_id', sdqConsulta.FieldByName('ca_id').AsInteger);   // Agrego esto para que no de error el update..

    sMotivoEndoso := sdqConsulta.FieldByName('et_motivo').AsString;

    sSql :=
      'SELECT COUNT(*)' +
       ' FROM tet_endosotarifa, cca_carta' +
      ' WHERE ca_idendosotemp = et_id' +
        ' AND et_id = :id';

    if ((rgTipoAplicacion.ItemIndex = 0) and (sdqConsulta.FieldByName('et_motivo').AsString = '03.01')) or
       (ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('et_id').AsInteger]) > 1) then    // Si aplica solo aumento y el tipo de lote del registro es aumento + incumplimiento..
    begin
      sMotivoEndoso := '02';
      SqlTET.SqlType := stUpdate;
      SqlTET.PrimaryKey.Add('et_id',    sdqConsulta.FieldByName('et_id').AsInteger);
      SqlTET.Fields.Add('et_fechabaja', DBDateTime);
      SqlTET.Fields.Add('et_usubaja',   frmPrincipal.DBLogin.UserId);
    end
    else
    begin
      SqlTET.SqlType := stDelete;
      SqlTET.PrimaryKey.Add('et_id', sdqConsulta.FieldByName('et_id').AsInteger);
    end;


    if UpdatearContrato then
      EjecutarSQLST(SqlACO.Sql);
    EjecutarSQLST(SqlATC.Sql);
    IdEndoso := DoEndosoGrabar(StrToInt(LocalContrato), cmbEN_FECHAVIGENCIA.Date, sMotivoEndoso,
                               sdqConsulta.FieldByName('et_enviosrt').AsString, 'S', 'N', frmPrincipal.DBLogin.UserId, False);

    {$IFDEF ESSISTEMANUEVOEMI}
    sSql := 'emi.utiles.do_marcarperiodostarifa(:contrato, :fechavigencia);';
    EjecutarStoreSTEx(sSql, [sdqConsulta.FieldByName('co_contrato').AsInteger, TDateTimeEx.Create(cmbEN_FECHAVIGENCIA.Date)]);
    {$ELSE}
    sSql :=
      'SELECT cobranza.puededesconciliarempresa(:contrato)' +
       ' FROM DUAL';
    bPuedeDesconciliar := (ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_contrato').AsInteger]) = 'S') and bDesconciliarPer;

    DoDevengado_Actualizar(frmPrincipal.DBLogin.UserId, sdqConsulta.FieldByName('co_contrato').AsInteger, cmbEN_FECHAVIGENCIA.Date, bPuedeDesconciliar);
    {$ENDIF}

    if IdEndoso = ART_EMPTY_ID then
    begin
      MessageDlg('Se produjo un error al recuperar el número de endoso.', mtWarning, [mbOK], 0);
      Abort;
    end;

    if not ((rgTipoAplicacion.ItemIndex = 0) and (sdqConsulta.FieldByName('et_motivo').AsString = '03.01')) then    // Si NO aplica solo aumento y el tipo de lote del registro es aumento + incumplimiento..
    begin
      SqlCCA.Fields.Add('ca_idendoso',     IdEndoso, False);
      SqlCCA.Fields.Add('ca_idendosotemp', SQL_NULL, False);
    end;
    
    EjecutarSqlST(SqlCCA.Sql);

    EjecutarSqlST(SqlTET.Sql);

    if (rgTipoAplicacion.ItemIndex = 0) and (sdqConsulta.FieldByName('et_motivo').AsString = '03.01') then    // Si aplica solo aumento y el tipo de lote del registro es aumento + incumplimiento..
    begin
      sSql :=
        'INSERT INTO tet_endosotarifa' +
                   ' (et_id, et_contrato, et_tipodetarifa, et_porcmasatarifa, et_porcdescvolumen, et_porcdescnivel,' +
                    ' et_porcmasa, et_sumafija, et_sumafijatarifa, et_cargoadmin, et_vigenciatarifa, et_fechaautoriza,' +
                    ' et_usuarioautoriza, et_recargosin, et_recargosin_sobrefijo, et_recargosin_montofijo,' +
                    ' et_recargoesp, et_recargoesp_sobrefijo, et_idactividad, et_vigenciaendoso, et_motivo,' +
                    ' et_enviosrt, et_usualta, et_fechaalta, et_idactividad2, et_idactividad3, et_nivel,' +
                    ' et_alicuotapesos, et_incumplido_hasta, et_incumplido_sumafija, et_incumplido_porcmasa,' +
                    ' et_tipolote, et_incumplido_desde, et_cantestablecimientosact)' +
         ' SELECT seq_tet_id.NEXTVAL, et_contrato, et_tipodetarifa, et_porcmasatarifa, et_porcdescvolumen,' +
                ' et_porcdescnivel, et_porcmasa, et_sumafija, et_sumafijatarifa, et_cargoadmin, et_vigenciatarifa,' +
                ' et_fechaautoriza, et_usuarioautoriza, et_recargosin, et_recargosin_sobrefijo,' +
                ' et_recargosin_montofijo, et_recargoesp, et_recargoesp_sobrefijo, et_idactividad, et_vigenciaendoso,' +
                ' :estado, et_enviosrt, :usualta, :fechaalta, et_idactividad2, et_idactividad3, et_nivel,' +
                ' et_alicuotapesos, et_incumplido_hasta, et_incumplido_sumafija, et_incumplido_porcmasa, et_tipolote,' +
                ' et_incumplido_desde, et_cantestablecimientosact' +
           ' FROM tet_endosotarifa' +
          ' WHERE et_id = :ID';
      EjecutarSqlSTEx(sSql, ['03.02', frmPrincipal.DBLogin.UserId, TDateTimeEx.Create(DBDateTime){SQL_ACTUALDATE},
                             sdqConsulta.FieldByName('et_id').AsInteger]);
    end;
  finally
    SqlACO.Free;
    SqlATC.Free;
    SqlCCA.Free;
    SqlTET.Free;
  end;
end;

procedure TfrmConfirmaTarifa.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  MenuGrilla : TPopUpMenu;
  Item : TMenuItem;
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

procedure TfrmConfirmaTarifa.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
  CalcularFilas;
end;

procedure TfrmConfirmaTarifa.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilas;
end;

procedure TfrmConfirmaTarifa.tAgregarTXTClick(Sender: TObject);
var
  Archivo: TextFile;
  Contratos: String;
  Temp: String;
begin
  inherited;

  OpenDialog.Title      := 'Archivo de contratos';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter     := 'Archivos de Texto(*.txt)|*.txt';
  if OpenDialog.Execute then
  try
    try
      AssignFile(Archivo, OpenDialog.FileName);
      Reset(Archivo);
      while not Eof(Archivo) do
      begin
        Readln(Archivo, Temp);
        if StrToInt(Temp) <> 0 then //Con esto chequeo que no ingrese cualquier cosa
          Contratos := Contratos + Temp + ',';
      end;
      edContratos.Text := Copy(Contratos, 1, Length(Contratos) - 1);
    except
      edContratos.Text := '';
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
    //Quito la coma que sobra
  finally
    CloseFile(Archivo);
  end;
end;

procedure TfrmConfirmaTarifa.tbLimpiarTXTClick(Sender: TObject);
begin
  edContratos.Clear;
end;

procedure TfrmConfirmaTarifa.CalcularFilas;
begin
  edSeleccion.Value := grid.SelectedRows.Count;
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotal.Value := sdqConsulta.RecordCount
  else
    edTotal.Value := 0;
end;

procedure TfrmConfirmaTarifa.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;

procedure TfrmConfirmaTarifa.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;

procedure TfrmConfirmaTarifa.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularFilas;
end;

procedure TfrmConfirmaTarifa.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                               Highlight: Boolean);
begin
  inherited;

  if not sdqConsulta.FieldByName('et_fechabaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;

procedure TfrmConfirmaTarifa.tbEliminarCartaClick(Sender: TObject);
begin
  edCartas.Clear;
end;

procedure TfrmConfirmaTarifa.tbAgregarCartaClick(Sender: TObject);
var
  Archivo: TextFile;
  Cartas: String;
  Temp: String;
begin
  inherited;

  OpenDialog.Title      := 'Archivo de Cartas Documento';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter     := 'Archivos de Texto(*.txt)|*.txt';
  if OpenDialog.Execute then
  try
    try
      AssignFile(Archivo, OpenDialog.FileName);
      Reset(Archivo);
      while (not Eof(Archivo)) do
      begin
        Readln(Archivo, Temp);
        if StrToInt64(Temp) <> 0 then   // Con esto chequeo que no ingrese cualquier cosa..
          Cartas := Cartas + Temp + ',';
      end;
      edCartas.Text := Copy(Cartas, 1, Length(Cartas) - 1);
    except
      edCartas.Text := '';
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
    //Quito la coma que sobra
  finally
    CloseFile(Archivo);
  end;
end;

procedure TfrmConfirmaTarifa.tbFormatoCartaClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:'+ #13#10 +
             '* Extensión: .TXT' + #13#10 +
             '* Encabezado: No debe ingresarse encabezado' + #13#10 +
             '* Cuerpo: ' + #13#10 + '   - Campos: 1) NroDeCartaDoc' + #13#10 +
             '   - Obs: No deben ingresarse más campos que el de NroDeCartaDoc' + #13#10 +
             '          Se debe efectuar un salto de línea (Enter) al final de cada línea (incluyendo la última)'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmConfirmaTarifa.tbFormatoContratoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + #13#10 +
             '* Extensión: .TXT' + #13#10 +
             '* Encabezado: No debe ingresarse encabezado' + #13#10 +
             '* Cuerpo: ' + #13#10 + '   - Campos: 1) NroDeContrato' + #13#10 +
             '   - Obs: No deben ingresarse más campos que el de NroDeContrato' + #13#10 +
             '          Se debe efectuar un salto de línea (Enter) al final de cada línea (incluyendo la última)'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmConfirmaTarifa.mnuGrillaClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmConfirmaTarifa.mnuEndosoClick(Sender: TObject);
begin
  with TAfiCartasDoc.Create do
  try
    MostrarCartaDocumento(sdqConsulta.FieldByName('ca_id').AsInteger, tmBeginEnd, False, 1, False, False, False, False,
                          True, False, False, False, 'carta_tarifa_comercial');
  finally
    Free;
  end;
end;

procedure TfrmConfirmaTarifa.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConfirmaTarifa.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  with sdqConsulta do
    mnuEndoso.Enabled := FieldByName('co_fechabaja').IsNull and FieldByName('et_fechabaja').IsNull;
end;

procedure TfrmConfirmaTarifa.fpVigenciaBeforeShow(Sender: TObject);
begin
  rgTipoAplicacion.ItemIndex := 0;

  rgTipoAplicacion.Buttons[1].Enabled := False;
  rgTipoAplicacion.Buttons[2].Enabled := False;

  edFechaIncumplimientoDesde.Clear;
end;

procedure TfrmConfirmaTarifa.tbNuevaCartaClick(Sender: TObject);
var
  iLoop : Integer;
  aContratos : Array of TEndososTemporales;
begin
   SetLength(aContratos, Self.Grid.SelectedRows.Count);
   with sdqConsulta do
    begin
      DisableControls;
      try
        for iLoop := 0 to Grid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

            aContratos[iLoop].aContrato := FieldByName('co_contrato').AsInteger;
            aContratos[iLoop].aIdEndosoTemp :=  FieldByName('et_id').AsInteger
        end;
      finally
        EnableControls;
        Grid.UnSelectAll;
      end;
    end;


  with TfrmGenerarMultiplesCartasPorContrato.Create(Self) do
    try
       GenerarCartas(aContratos);
       ShowModal;
    finally
      Free;
    end;

{  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla.')
  else
    with TfrmAfiGeneracionCartas.Create(Self) do
    try
      IdCarta := ART_EMPTY_ID;
      fraEmpresaCartaDoc.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
      pnEmpresa.Visible := False;
      Label1.Visible := False;
      if Execute(IdCarta) and sdqConsulta.Active then
        sdqConsulta.Refresh;
    finally
      free;
    end; }
end;

end.
