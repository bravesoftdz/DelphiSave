unit unManRelacionEntVend;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   09-01-2003
 ULTIMA MODIFICACION: 16-10-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, IntEdit, unArtFrame, unArtDbFrame, unFraEmpresa,
  PatternEdit, unFraDomicilio, Mask, unFraCodigoDescripcion, unfraCtbTablas, unfraVendedores, ToolEdit, CurrEdit, Menus,
  unfraVendedoresCUIT, unfraEntidadCUIT, PeriodoPicker, unFraDomicilioTrab, DateComboBox, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraCanal, unArt, ComboEditor, CheckCombo,
  DBCheckCombo;

type
  TfrmManRelacionEntVend = class(TfrmCustomGridABM)
    GroupBox5: TGroupBox;
    GroupBox1: TGroupBox;
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpEtiquetas: TMenuItem;
    Label23: TLabel;
    fraEntidadHasta: TfraEntidadCUIT;
    fraEntidadDesde: TfraEntidadCUIT;
    Label2: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    fraVendedorDesde: TfraVendedoresCUIT;
    fraVendedorHasta: TfraVendedoresCUIT;
    tbSalir2: TToolButton;
    tbExencion: TToolButton;
    chkRelActivas: TCheckBox;
    chkSoloActivos: TCheckBox;
    chkEntActivas: TCheckBox;
    rgVendedores: TRadioGroup;
    ToolButton7: TToolButton;
    fraEV_IDVENDEDOR: TfraVendedoresCUIT;
    Label1: TLabel;
    Label3: TLabel;
    fraEV_IDENTIDAD: TfraEntidadCUIT;
    tbConceptos: TToolButton;
    gbCanal: TGroupBox;
    fraCanalBusq: TfraCanal;
    GroupBox2: TGroupBox;
    fraConceptoBusq: TfraCodigoDescripcion;
    chkEntidadVIP: TCheckBox;
    gbGranOrganizador: TGroupBox;
    fraGranOrganizador: TfraEntidadCUIT;
    chkGranOrganizador: TCheckBox;
    sdqEjecutivo: TSDQuery;
    dsEjecutivo: TDataSource;
    gbEjecutivo: TGroupBox;
    cmbEjecutivo: TDBCheckCombo;
    gbDelegacion: TGroupBox;
    cmbDelegacion: TDBCheckCombo;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    gbPeriodo: TGroupBox;
    edPeriodo: TPeriodoPicker;
    tbDocumentacion: TToolButton;
    pmnuDocumentacion: TPopupMenu;
    mnuCargarDocumentacion: TMenuItem;
    mnuVerDocumentacion: TMenuItem;
    ToolButton1: TToolButton;
    chkEntidadTramite: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpEtiquetasClick(Sender: TObject);
    procedure fraEntidadDesdeExit(Sender: TObject);
    procedure fraVendedorHastaEnter(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbExencionClick(Sender: TObject);
    procedure tbConceptosClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure mnuCargarDocumentacionClick(Sender: TObject);
    procedure mnuVerDocumentacionClick(Sender: TObject);
    procedure tbDocumentacionClick(Sender: TObject);
  private
    procedure btnMarcarTodos(Sender: TObject);
    procedure btnDesmarcarTodos(Sender: TObject);
    function DoValidarDocumentacionAGA(ValidarCarpeta: Boolean; var Clave: String; var arId: TTableId): Boolean;
  protected
    function Validar: Boolean; override;
    function DoABM: Boolean; override;

    procedure PrintResults; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmManRelacionEntVend: TfrmManRelacionEntVend;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, unSesion, CustomDlgs, CUIT, unRptVendedorEtiquetas,
  VCLExtra, General, unExencionIB, Internet, unCuitDuplicada, unFiltros, unManRelacionEntVendConcepto,
  StrFuncs, unFrmDetalleArchivo, unConstantArchivo, unComunesArchivo, unFrmCargaDocumentacion,
  unArchivo;

{$R *.DFM}

const
  PAGE_ENTIDADES = 0;

procedure TfrmManRelacionEntVend.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
  FieldBaja   := 'EV_FECHABAJA';

  fraEntidadDesde.ShowBajas  := True;
  fraEntidadHasta.ShowBajas  := True;

  fraVendedorDesde.ShowBajas := True;
  fraVendedorHasta.ShowBajas := True;

  with fraCanalBusq do
    begin
      FiltraUsuario         := False;
      DynamicCols           := True;
      VisibleExtraFields[0] := False;
      VisibleExtraFields[1] := False;
      VisibleExtraFields[2] := False;
      ShowBajas             := False;
    end;

  with fraEV_IDVENDEDOR do
    begin
      ExtraCondition := 'AND VE_FECHAAPROBADO IS NOT NULL';
      ShowBajas := False;
    end;

  with fraEV_IDENTIDAD do
    begin
      TableName      := 'XEN_ENTIDAD';
      FieldCodigo    := 'EN_ID';
      FieldID        := 'EN_ID';
      FieldDesc      := 'EN_NOMBRE';
      ExtraCondition := 'AND EN_FECHABAJA IS NULL AND EN_MODOLIQ <> ''03'' AND EN_FECHAAPROBADO IS NOT NULL';
      ShowBajas      := False;
    end;

  with fraConceptoBusq do
    begin
      TableName   := 'COM.XCO_CONCEPTO';
      FieldCodigo := 'CO_ID';
      FieldID     := 'CO_ID';
      FieldDesc   := 'CO_DESCRIPCION';
      FieldBaja   := 'CO_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraGranOrganizador do
    begin
      FieldCodigo    := 'EN_CODBANCO';
      ExtraCondition := ' AND EXISTS (SELECT 1 FROM XGO_GRANORGANIZADOR WHERE GO_IDENTORGANIZADOR = EN_ID) ';
      ShowBajas      := True;
    end;

  sdqEjecutivo.Open;
  sdqDelegacion.Open;
end;

procedure TfrmManRelacionEntVend.RefreshData;
var
  sSql, sWhere: String;
  bPorPeriodo: Boolean;
begin
  bPorPeriodo := not IsEmptyString(edPeriodo.Periodo.Valor);

  sSql := 'SELECT XEN.EN_ID, XEN.EN_CUIT, XEN.EN_NOMBRE, XEN.EN_CODBANCO, XEN.EN_FECHABAJA, VE_ID, VE_VENDEDOR, VE_CUIT, ' +
                 'VE_NOMBRE, VE_FECHABAJA, EV_ID, EV_FECHABAJA, CA_DESCRIPCION DESCRCANAL, XEN.EN_ENTRAMITE, ' +
                 'EC_NOMBRE, EL_NOMBRE DELEGACION, XEN.EN_VIP, XENORG.EN_NOMBRE GRANORGANIZADOR, ' +
                 Iif(bPorPeriodo, 'NVL(CONTRATOS, 0) CONTRATOS, NVL(CAPITAS, 0) CAPITAS, NVL(PRIMA, 0) PRIMA'
                                , 'NULL CONTRATOS, NULL CAPITAS, NULL PRIMA') + ' ' +
            'FROM XEN_ENTIDAD XENORG, XGO_GRANORGANIZADOR, DEL_DELEGACION, AEC_EJECUTIVOCUENTA, ACA_CANAL, XEN_ENTIDAD XEN, XVE_VENDEDOR, ' +
                 'XEV_ENTIDADVENDEDOR ' +
                 Iif(bPorPeriodo, ', (SELECT /*+ INDEX(AVC_VENDEDORCONTRATO NDX_AVC_IDENTIDADVEND)*/ ' +
                                            'VC_IDENTIDADVEND, COUNT(*) CONTRATOS, SUM(RC_EMPLEADOS) CAPITAS, SUM(RC_DEVENGADOCUOTA) PRIMA ' +
                                       'FROM ZRC_RESUMENCOBRANZA, AVC_VENDEDORCONTRATO ' +
                                      'WHERE RC_CONTRATO = VC_CONTRATO ' +
                                        'AND VC_FECHABAJA IS NULL ' +
                                        'AND RC_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor) + ' ' +
                                        'AND RC_EMPLEADOS > 0 ' +
                                        'AND VC_IDCONCEPTO = 1 ' +     // 1: Comisiones
                                        'AND RC_PERIODO BETWEEN VC_VIGENCIADESDE AND NVL(VC_VIGENCIAHASTA, ''999912'') ' +
                                   'GROUP BY VC_IDENTIDADVEND)'
                                , '') + ' ' +
           'WHERE VE_ID = EV_IDVENDEDOR(+) ' +
             'AND XEN.EN_ID(+) = EV_IDENTIDAD ' +
             'AND EC_ID(+) = XEN.EN_IDEJECUTIVO ' +
             'AND XEN.EN_IDCANAL = CA_ID(+) ' +
             'AND VE_IDDELEGACION = EL_ID(+) ' +
             'AND GO_IDENTIDAD(+) = XEN.EN_ID ' +
             'AND GO_FECHABAJA(+) IS NULL ' +
             'AND GO_FECHAAPROBADO(+) IS NOT NULL ' +
             'AND GO_IDENTORGANIZADOR = XENORG.EN_ID(+) ' +
             Iif(bPorPeriodo, 'AND EV_ID = VC_IDENTIDADVEND(+)'
                            , '');

  sWhere := '';

  //Filtros frame Entidad
  if fraEntidadDesde.IsSelected and (fraEntidadDesde.Value = fraEntidadHasta.Value) then
    sWhere := sWhere + ' AND XEN.EN_ID = ' + fraEntidadDesde.ID
  else if fraEntidadDesde.IsSelected and (fraEntidadDesde.CUIT = fraEntidadHasta.CUIT) and (fraEntidadDesde.CUIT > '') then
    sWhere := sWhere + ' AND XEN.EN_CUIT = ' + SQLValue(fraEntidadDesde.CUIT)
  else
  begin
    if Trim(fraEntidadDesde.edCodigo.Text) > '' then
      sWhere := sWhere + ' AND TO_NUMBER(XEN.EN_CODBANCO) >= ' + SqlInteger(fraEntidadDesde.CodBanco);
    if Trim(fraEntidadHasta.edCodigo.Text) > '' then
      sWhere := sWhere + ' AND TO_NUMBER(XEN.EN_CODBANCO) <= ' + SqlInteger(fraEntidadHasta.CodBanco);
  end;

  // Filtros frame Vendedor
  if fraVendedorDesde.IsSelected and (fraVendedorDesde.Value = fraVendedorHasta.Value) then
    sWhere := sWhere + ' AND VE_ID = ' + fraVendedorDesde.ID
  else if fraVendedorDesde.IsSelected and (fraVendedorDesde.CUIT = fraVendedorHasta.CUIT) then
    sWhere := sWhere + ' AND VE_CUIT = ' + SQLValue(fraVendedorDesde.CUIT)
  else
  begin
    if Trim(fraVendedorDesde.edCodigo.Text) > '' then
      sWhere := sWhere + ' AND VE_VENDEDOR >= ' + SqlValue(fraVendedorDesde.edCodigo.Text);
    if Trim(fraVendedorHasta.edCodigo.Text) > '' then
      sWhere := sWhere + ' AND VE_VENDEDOR <= ' + SqlValue(fraVendedorHasta.edCodigo.Text);
  end;

  if fraCanalBusq.IsSelected then
    sWhere := sWhere + ' AND CA_ID = ' + SqlValue(fraCanalBusq.Value);

  if fraConceptoBusq.IsSelected then
    sWhere := sWhere + ' AND EXISTS (SELECT 1 ' +
                                      'FROM XCO_CONCEPTO, XVC_ENTVENDCONCEPTO ' +
                                     'WHERE EV_ID = VC_IDENTIDADVEND ' +
                                       'AND VC_IDCONCEPTO = CO_ID ' +
                                       'AND VC_FECHABAJA IS NULL ' +
                                       'AND CO_ID = ' + SqlValue(fraConceptoBusq.Value) + ')';

  if fraGranOrganizador.IsSelected then
    sWhere := sWhere + ' AND XENORG.EN_ID = ' + SqlValue(fraGranOrganizador.Value);

  if not IsEmptyString(cmbEjecutivo.Text) then
    sWhere := sWhere + ' AND XEN.EN_IDEJECUTIVO ' + cmbEjecutivo.InSql;

  if not IsEmptyString(cmbDelegacion.Text) then
    sWhere := sWhere + ' AND VE_IDDELEGACION ' + cmbDelegacion.InSql;

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND VE_FECHABAJA IS NULL AND VE_ID IS NOT NULL';

  if chkRelActivas.Checked then
    sWhere := sWhere + ' AND EV_FECHABAJA IS NULL AND EV_ID IS NOT NULL';

  if chkEntActivas.Checked then
    sWhere := sWhere + ' AND XEN.EN_FECHABAJA IS NULL AND XEN.EN_ID IS NOT NULL';

  if chkEntidadVIP.Checked then
    sWhere := sWhere + ' AND XEN.EN_VIP = ''S''';

  if chkGranOrganizador.Checked then
    sWhere := sWhere + ' AND XENORG.EN_ID IS NOT NULL';

  if chkEntidadTramite.Checked then
    sWhere := sWhere + ' AND XEN.EN_ENTRAMITE = ''S''';

  case rgVendedores.ItemIndex of
    0: ; //Nada
    1: sWhere := sWhere + ' AND XEN.EN_ID IS NOT NULL ';
    2: sWhere := sWhere + ' AND XEN.EN_ID IS NULL ';
  end;

  //Realiza la consulta
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManRelacionEntVend.ClearControls;
begin
  fraEV_IDENTIDAD.Clear;
  fraEV_IDVENDEDOR.Clear;
end;

function TfrmManRelacionEntVend.DoABM: Boolean;
var
  fId: TTableId;
begin
  Sql.Clear;
  Sql.TableName := 'XEV_ENTIDADVENDEDOR';

  if ModoABM = maAlta then
    fId := GetSecNextVal('SEQ_XEV_ID')
  else
    fId := sdqConsulta.FieldByName('EV_ID').AsInteger;

  Sql.PrimaryKey.Add('EV_ID', fId, False);

  if ModoABM = maBaja then
    begin
      Sql.SqlType := stUpdate;

      Sql.Fields.Add('EV_USUBAJA',     Sesion.UserID);
      Sql.Fields.Add('EV_FECHABAJA',   SQL_DATETIME, False);
    end
  else
    begin   // es un alta
      Sql.SqlType := stInsert;

      Sql.Fields.Add('EV_IDENTIDAD',   fraEV_IDENTIDAD.Value);
      Sql.Fields.Add('EV_IDVENDEDOR',  fraEV_IDVENDEDOR.Value);
      Sql.Fields.Add('EV_USUALTA',     Sesion.UserID);
      Sql.Fields.Add('EV_FECHAALTA',   SQL_DATETIME, False);
    end;

  Result := inherited DoABM;
end;

procedure TfrmManRelacionEntVend.LoadControls;
begin
  inherited;
end;

procedure TfrmManRelacionEntVend.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  inherited;
end;

function TfrmManRelacionEntVend.Validar: Boolean;
var
  sTipo, sMatricula, sSql: String;
begin
  Result := False;

  Verificar(fraEV_IDENTIDAD.IsEmpty, fraEV_IDENTIDAD, 'Debe seleccionar una entidad.');
  Verificar(fraEV_IDVENDEDOR.IsEmpty, fraEV_IDVENDEDOR, 'Debe seleccionar un vendedor.');

  sSql := 'SELECT 1 ' +
            'FROM XEV_ENTIDADVENDEDOR ' +
           'WHERE EV_FECHABAJA IS NULL ' +
             'AND EV_IDENTIDAD = :ENTIDAD ' +
             'AND EV_IDVENDEDOR = :VENDEDOR';
  Verificar(ExisteSqlEx(sSql, [fraEV_IDENTIDAD.Value, fraEV_IDVENDEDOR.Value]), fraEV_IDENTIDAD.edCodigo, 'Ya existe la relación.');

  if ModoABM = maAlta then
    begin
      sSql := 'SELECT CA_TIPO ' +
                'FROM ACA_CANAL, XEN_ENTIDAD ' +
               'WHERE EN_IDCANAL = CA_ID(+) ' +
                 'AND EN_ID = :ENTIDAD';
      sTipo := ValorSqlEx(sSql, [fraEV_IDENTIDAD.Value]);

      sSql := 'SELECT VE_MATRICULA ' +
                'FROM XVE_VENDEDOR ' +
               'WHERE VE_ID = :VENDEDOR';
      sMatricula := ValorSqlEx(sSql, [fraEV_IDVENDEDOR.Value]);

      Verificar((Trim(sMatricula) = '') and (sTipo = 'P'), fraEV_IDVENDEDOR.edCodigo, 'La matrícula del vendedor es obligatoria.');
      Verificar((Trim(sMatricula) <> '') and (sTipo <> 'P'), fraEV_IDVENDEDOR.edCodigo, 'Si no es Productor, entonces no debe haber matrícula.');
    end;

  sSql := 'SELECT 1 ' +
            'FROM XEV_ENTIDADVENDEDOR ' +
           'WHERE EV_FECHABAJA IS NULL ' +
             'AND EV_IDVENDEDOR = :VENDEDOR';

  if ExisteSqlEx(sSql, [fraEV_IDVENDEDOR.Value]) then
    begin
      if Seguridad.Claves.IsActive('PermisoAgregarVariasEntidades') then
        begin
          if not MsgAsk('Está por asignar este vendedor a más de una entidad. ' + #13 + #10 + '¿ Desea continuar ?', 'Advertencia') then
            Exit;
        end
      else
        Verificar(True, nil, 'Debe haber solo una entidad activa.');
    end;

  Result := True;
end;

procedure TfrmManRelacionEntVend.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  sdqConsulta.FieldByName('VE_CUIT').EditMask := EMSK_CUIT;
  sdqConsulta.FieldByName('EN_CUIT').EditMask := EMSK_CUIT;

  if sdqConsulta.FieldByName('PRIMA') is TFloatField Then
    TFloatField(sdqConsulta.FieldByName('PRIMA')).Currency := True;
end;

procedure TfrmManRelacionEntVend.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
   Menu: TPopUpMenu;
   Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  Menu := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    Item.Caption := 'Marcar Todos';
    Item.OnClick := btnMarcarTodos;
    Menu.Items.Add(Item);

    Item := TMenuItem.Create(Self);
    Item.Caption := 'Desmarcar Todos';
    Item.OnClick := btnDesMarcarTodos;
    Menu.Items.Add(Item);

    Menu.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    Menu.Free;
    Item.Free;
  end;
end;

procedure TfrmManRelacionEntVend.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmManRelacionEntVend.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmManRelacionEntVend.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmManRelacionEntVend.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmManRelacionEntVend.mnuImpEtiquetasClick(Sender: TObject);
var
  iloop: Integer;
  Vendedores: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un registro.');

  for iloop := 0 to (Grid.SelectedRows.Count - 1) do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iloop]));
      if (iloop <> (Grid.SelectedRows.Count - 1)) then
        Vendedores := Vendedores + sdqConsulta.FieldByName('VE_ID').AsString + ','
      else
        Vendedores := Vendedores + sdqConsulta.FieldByName('VE_ID').AsString;
    end;

  with TrptVendedorEtiquetas.Create(Self) do
    try
      Vendedores_seleccionados := Vendedores;
      PreviewModal;
    finally
      Free;
    end;
end;

procedure TfrmManRelacionEntVend.fraEntidadDesdeExit(Sender: TObject);
begin
  inherited;

  fraEntidadDesde.FrameExit(Sender);
  if fraEntidadHasta.Value = 0 then
    fraEntidadHasta.Value := fraEntidadDesde.Value;
end;

procedure TfrmManRelacionEntVend.fraVendedorHastaEnter(Sender: TObject);
begin
  inherited;

  if fraEntidadDesde.Value = fraEntidadHasta.Value then
    begin
      fraVendedorDesde.Entidad := fraEntidadDesde.Value;
      fraVendedorHasta.Entidad := fraEntidadDesde.Value;
    end
  else
    begin
      fraVendedorDesde.Entidad := 0;
      fraVendedorHasta.Entidad := 0;
    end;

  fraVendedorDesde.ShowBajas := not chkSoloActivos.Checked;
  fraVendedorHasta.ShowBajas := not chkSoloActivos.Checked;
end;

procedure TfrmManRelacionEntVend.tbLimpiarClick(Sender: TObject);
begin
  fraEntidadDesde.Clear;
  fraEntidadHasta.Clear;
  fraVendedorDesde.Clear;
  fraVendedorHasta.Clear;
  fraCanalBusq.Clear;
  fraConceptoBusq.Clear;
  fraGranOrganizador.Clear;
  cmbEjecutivo.Clear;
  cmbDelegacion.Clear;
  edPeriodo.Clear;
  chkSoloActivos.Checked     := True;
  chkRelActivas.Checked      := True;
  chkEntActivas.Checked      := True;
  chkEntidadVIP.Checked      := False;
  chkGranOrganizador.Checked := False;
  chkEntidadTramite.Checked  := False;
  rgVendedores.ItemIndex     := 0;

  inherited;
end;

procedure TfrmManRelacionEntVend.tbExencionClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Eof or (not sdqConsulta.Active), Grid, 'Debe elegir un registro.');
  Verificar(Grid.SelectedRows.Count > 1, nil, 'Debe seleccionar solo un registro.');
  Verificar(sdqConsulta.FieldByName('EV_ID').IsNull, nil, 'No hay una relación creada para este vendedor.');

  frmExencionIB.Free;
  frmExencionIB := TfrmExencionIB.Create(Self);
  frmExencionIB.DoCargarDatos(sdqConsulta.FieldByName('EV_ID').AsInteger, 'V');
end;

procedure TfrmManRelacionEntVend.tbConceptosClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar un registro.');
  Verificar(Grid.SelectedRows.Count > 1, nil, 'Debe seleccionar solo un registro.');
  Verificar(sdqConsulta.FieldByName('EV_ID').IsNull, nil, 'No hay una relación creada para este vendedor.');

  with TfrmManRelacionEntVendConcepto.Create(nil) do
    try
      IdEntidadVend := Self.sdqConsulta.FieldByName('EV_ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmManRelacionEntVend.tbEliminarClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count > 1, nil, 'Debe seleccionar solo un registro.');
  Verificar(sdqConsulta.FieldByName('EV_ID').IsNull, nil, 'No hay una relación creada para este vendedor.');

  inherited;
end;

function TfrmManRelacionEntVend.DoValidarDocumentacionAGA(ValidarCarpeta: Boolean; var Clave: String; var arId: TTableId): Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay seleccionado ningún vendedor.');
  Verificar(sdqConsulta.FieldByName('EN_CODBANCO').IsNull, Grid, 'Solo se puede cargar documentación de entidades con código.');
  Verificar(sdqConsulta.FieldByName('VE_VENDEDOR').IsNull, Grid, 'Solo se puede cargar documentación de vendedores con código.');

  Clave := GetClaveArmada(2, sdqConsulta.FieldByName('EN_CODBANCO').AsString, sdqConsulta.FieldByName('VE_VENDEDOR').AsString, '', '');

  if ValidarCarpeta then
    Verificar(not VerificarClaveExiste(ID_CARPETA_LEGVENDEDOR, Clave, arId), nil, 'La carpeta no existe.');

  Result := True;
end;

procedure TfrmManRelacionEntVend.mnuCargarDocumentacionClick(Sender: TObject);
var
  arId: TTableId;
  sClave: String;
begin
  if DoValidarDocumentacionAGA(False, sClave, arId) then
    TfrmCargaDocumentacion.ShowCargaDocumento(Self, ID_CARPETA_LEGVENDEDOR, sClave);
end;

procedure TfrmManRelacionEntVend.mnuVerDocumentacionClick(Sender: TObject);
var
  arId: TTableId;
  sClave: String;
begin
  if DoValidarDocumentacionAGA(True, sClave, arId) then
    TFrmDetalleArchivo.MostrarDetalleArchivo(Self, arId);
end;

procedure TfrmManRelacionEntVend.tbDocumentacionClick(Sender: TObject);
begin
  tbDocumentacion.CheckMenuDropdown;
end;

end.

