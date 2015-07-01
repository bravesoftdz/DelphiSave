unit unManVendedor;
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
  PatternEdit, unFraDomicilio, Mask, unFraCodigoDescripcion, unfraCtbTablas, unfraVendedores,
  ToolEdit, CurrEdit, Menus, unfraVendedoresCUIT, unfraEntidadCUIT, PeriodoPicker, unFraDomicilioTrab, DateComboBox,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraCanal, unArt, unFraStaticCTB_TABLAS, unFraCodDesc;

type
  TfrmManVendedor = class(TfrmCustomGridABM)
    pgCtrlVendedor: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsFacturacion: TTabSheet;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    edVE_CODAREATELEFONOS: TIntEdit;
    edVE_TELEFONOS: TPatternEdit;
    Label8: TLabel;
    edVE_CODAREAFAX: TIntEdit;
    edVE_FAX: TPatternEdit;
    Label6: TLabel;
    edVE_DIRELECTRONICA: TEdit;
    Label9: TLabel;
    edVE_MATRICULA: TIntEdit;
    GroupBox2: TGroupBox;
    rbVE_DOMICILIO_VENDEDORVendedor: TRadioButton;
    rbVE_DOMICILIO_VENDEDOREntidad: TRadioButton;
    Label10: TLabel;
    fraVE_IDENTIDAD_CORREO: TfraCodigoDescripcion;
    Label11: TLabel;
    fraVE_GANANCIAS: TfraCtbTablas;
    Label13: TLabel;
    fraVE_OBRASOCIAL: TfraCtbTablas;
    Label14: TLabel;
    edVE_NUMOSOCIAL: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edVE_CUIT: TMaskEdit;
    Label4: TLabel;
    edVE_NOMBRE: TEdit;
    edVE_BENEFICIARIO: TEdit;
    Label16: TLabel;
    edVE_VENDEDOR: TPatternEdit;
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpEtiquetas: TMenuItem;
    Label23: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    fraVendedorDesde: TfraVendedoresCUIT;
    fraVendedorHasta: TfraVendedoresCUIT;
    Label19: TLabel;
    edVE_DOMICILIO: TEdit;
    tbSalir2: TToolButton;
    Label26: TLabel;
    GroupBox7: TGroupBox;
    rbVE_CONVENIONo: TRadioButton;
    rbVE_CONVENIOSi: TRadioButton;
    GroupBox3: TGroupBox;
    rbVE_INGRESOSBRUTOSSi: TRadioButton;
    rbVE_INGRESOSBRUTOSNo: TRadioButton;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    edVE_NUMINGBRUTOS: TEdit;
    tbCuentasBancarias: TToolButton;
    fraDomicilio: TfraDomicilioTrab;
    chkSoloActivos: TCheckBox;
    lbFImpresionFormInscripcion: TLabel;
    edVE_FECHAIMPRESIONFORMINSCR: TDateComboBox;
    gbFecha: TGroupBox;
    Label21: TLabel;
    edVE_FECHAALTADesde: TDateComboBox;
    edVE_FECHAALTAHasta: TDateComboBox;
    edVE_FECHAALTA: TDateComboBox;
    lbPiso: TLabel;
    fraVE_IDCANAL: TfraCanal;
    tbObjetivos: TToolButton;
    chkSoloObjetivos: TCheckBox;
    tbAprobar: TToolButton;
    Label28: TLabel;
    edVE_FECHAULTCONVENIO: TDateComboBox;
    Label27: TLabel;
    fraSituacionIVA: TfraStaticCTB_TABLAS;
    lbFRevision: TLabel;
    edVE_FECHAREVISION: TDateComboBox;
    chkVE_CBUINFORMADA: TCheckBox;
    Label31: TLabel;
    fraVE_IDDELEGACION: TfraCodDesc;
    tbReactivar: TToolButton;
    gbDelegacion: TGroupBox;
    fraDelegacionVend: TfraCodDesc;
    tbEjecutivoCuenta: TToolButton;
    fpEjecutivoCuenta: TFormPanel;
    Label29: TLabel;
    fraEjecutivo: TfraStaticCodigoDescripcion;
    btnAceptarEjCuenta: TButton;
    btnCancelarEjCuenta: TButton;
    ToolButton7: TToolButton;
    Label2: TLabel;
    edVE_PROVINCIASEGUROS: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpEtiquetasClick(Sender: TObject);
    procedure CambiaEstadoCheck (Sender : TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure rbVE_INGRESOSBRUTOSSiClick(Sender: TObject);
    procedure rbVE_INGRESOSBRUTOSNoClick(Sender: TObject);
    procedure tbCuentasBancariasClick(Sender: TObject);
    procedure tbObjetivosClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure fraSituacionIVAChange(Sender: TObject);
    procedure tbReactivarClick(Sender: TObject);
    procedure tbEjecutivoCuentaClick(Sender: TObject);
    procedure btnAceptarEjCuentaClick(Sender: TObject);
    procedure fpEjecutivoCuentaEnter(Sender: TObject);
  private
    function  EsCUITUnicaEntidad(Cuit: string; IdVendedor: TTableId): boolean;
    function  EsCUITUnicaVendedor(Cuit: string): boolean;
    procedure btnMarcarTodos(Sender: TObject);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure MostrarRelacionesActivas;
    procedure DoReactivarVendedor;
    function GetNextVendedorReferencia: Integer;
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
  frmManVendedor: TfrmManVendedor;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, unSesion, CustomDlgs, CUIT, unRptVendedorEtiquetas, VCLExtra,
  General, unManCCP_CUENTAPAGO, Internet, unCuitDuplicada, unFiltros, unObjetivos, StrFuncs;

{$R *.DFM}

const
  PAGE_DATOSGENERALES = 0;
  PAGE_FACTURACION    = 1;

procedure TfrmManVendedor.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
  Sql.TableName                         := 'XVE_VENDEDOR';
  FieldBaja                             := 'VE_FECHABAJA';
  pgCtrlVendedor.ActivePageIndex        := PAGE_DATOSGENERALES;

  fraVE_GANANCIAS.Clave                 := 'RETGA';
  fraVE_GANANCIAS.ExtraCondition        := ' AND TB_ESPECIAL2 = ''C''';

  fraVE_OBRASOCIAL.Clave                := 'RETOS';

  fraVE_IDENTIDAD_CORREO.TableName      := 'XEN_ENTIDAD';
  fraVE_IDENTIDAD_CORREO.FieldCodigo    := 'EN_CODBANCO';
  fraVE_IDENTIDAD_CORREO.FieldID        := 'EN_ID';
  fraVE_IDENTIDAD_CORREO.FieldDesc      := 'EN_NOMBRE';
  fraVE_IDENTIDAD_CORREO.ExtraCondition := 'AND EN_FECHABAJA IS NULL AND EN_CONVENDEDOR =''S''';
  fraVE_IDENTIDAD_CORREO.FieldBaja      := 'EN_FECHABAJA';
  fraVE_IDENTIDAD_CORREO.ShowBajas      := True;

  fraVE_IDCANAL.FiltraUsuario           := False;

  //No muestra los vendedores 0
  fraVendedorDesde.ShowBajas      := TRUE;
  fraVendedorHasta.ShowBajas      := TRUE;

  with fraSituacionIVA do
    begin
      Clave    := 'SIVA';
      OnChange := fraSituacionIVAChange;
    end;

  with fraEjecutivo do
    begin
      TableName      := 'AEC_EJECUTIVOCUENTA';
      FieldID        := 'EC_ID';
      FieldCodigo    := 'EC_ID';
      FieldDesc      := 'EC_NOMBRE';
      FieldBaja      := 'EC_FECHABAJA';
    end;

  MSG_BAJA := '¿Desea dar de baja el registro seleccionado?';

  tbReactivar.Left := 100;
end;

procedure TfrmManVendedor.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT VE_ID, VE_VENDEDOR, VE_CUIT, VE_CBUINFORMADA,' +
          '       VE_NOMBRE, VE_CALLE, VE_LOCALIDAD, VE_CPOSTAL, PV_DESCRIPCION,' +
          '       VE_NUMERO, VE_PISO,  VE_DEPARTAMENTO, ' +
          '       VE_CPOSTALA,  VE_CODAREATELEFONOS, VE_TELEFONOS, ' +
          '       VE_CODAREAFAX, VE_FAX, VE_FECHAALTA, VE_FECHABAJA, ' +
          '       VE_DIRELECTRONICA, VE_GANANCIAS, VE_IVA, ' +
          '       VE_OBRASOCIAL, VE_NUMOSOCIAL, VE_INGRESOSBRUTOS, ' +
          '       VE_NUMINGBRUTOS, VE_MONOTRIBUTO, VE_PROVINCIASEGUROS, ' +
          '       VE_BENEFICIARIO, VE_MATRICULA, VE_DOMICILIO_VENDEDOR, ' +
          '       VE_IDENTIDAD_CORREO, VE_DOMICILIO, VE_CONVENIO, ' +
          '       VE_FIRMACONVENIO, VE_FECHAIMPRESIONFORMINSCR, ' +
          '       VE_IDCANAL, CA_DESCRIPCION, OB_DESCRIPCION DESCROBJETIVO, ' +
          '       TRUNC(OV_FECHAAPROBADO) FAPROBADOOBJETIVO, VE_FECHAREVISION, ' +
          '       VE_ACTUALIZACONVENIO, TRUNC(VE_FECHAAPROBADO) FECHAAPROBADO, ' +
          '       VE_FECHAULTCONVENIO, VE_SITIVA, VE_IDDELEGACION, VE_USUALTA, ' +
          '       EL_NOMBRE DELEGACION, EC_ID, EC_NOMBRE EJECUTIVOCTA ' +
          '  FROM AEC_EJECUTIVOCUENTA, DEL_DELEGACION, XOB_OBJETIVO, XOV_OBJETIVOVENDEDOR, ' +
          '       ACA_CANAL, XVE_VENDEDOR, CPV_PROVINCIAS ' +
          ' WHERE VE_PROVINCIA = PV_CODIGO (+)' +
          '   AND VE_IDCANAL = CA_ID(+) ' +
          '   AND VE_ID = OV_IDVENDEDOR(+) ' +
          '   AND OV_FECHABAJA(+) IS NULL ' +
          '   AND OV_IDOBJETIVO = OB_ID(+) ' +
          '   AND OB_FECHABAJA(+) IS NULL ' +
          '   AND VE_IDDELEGACION = EL_ID(+) ' +
          '   AND VE_IDEJECUTIVO = EC_ID(+) ';

  sWhere := DoFiltro(gbFecha);

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

  if fraDelegacionVend.IsSelected then
    sWhere := sWhere + ' AND VE_IDDELEGACION = ' + SqlValue(fraDelegacionVend.Value);

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND VE_FECHABAJA IS NULL ';

  if chkSoloObjetivos.Checked then
    sWhere := sWhere + ' AND OV_IDOBJETIVO IS NOT NULL ';

  //Realiza la consulta
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  OpenQuery(sdqConsulta);
  CheckButtons;
end;

procedure TfrmManVendedor.ClearControls;
begin
  // Habilito el control
  VCLExtra.LockControl(edVE_VENDEDOR, True);
  VCLExtra.LockControl(edVE_DOMICILIO, True);

  //Limpio los controles del formulario
  edVE_VENDEDOR.Text := IntToStr(GetNextVendedorReferencia());
  edVE_NOMBRE.Clear;
  edVE_CUIT.Clear;

  //Pagina 1
  edVE_DOMICILIO.Clear;
  fraDomicilio.Clear;
  edVE_CODAREATELEFONOS.Clear;
  edVE_TELEFONOS.Clear;
  edVE_CODAREAFAX.Clear;
  edVE_FAX.Clear;
  edVE_DIRELECTRONICA.Clear;
  edVE_MATRICULA.Clear;
  rbVE_DOMICILIO_VENDEDORVendedor.Checked := FALSE;
  rbVE_DOMICILIO_VENDEDOREntidad.Checked := FALSE;
  fraVE_IDENTIDAD_CORREO.Clear;
  fraVE_IDCANAL.Clear;
  VCLExtra.LockControl(fraVE_IDENTIDAD_CORREO, False);
  edVE_FECHAULTCONVENIO.Clear;
  edVE_FECHAREVISION.Clear;
  fraSituacionIVA.Clear;
  fraVE_IDDELEGACION.Clear;
  edVE_PROVINCIASEGUROS.Clear;

  //Pagina 2
  fraVE_GANANCIAS.Clear;
  fraVE_OBRASOCIAL.Clear;
  edVE_NUMOSOCIAL.Clear;
  rbVE_INGRESOSBRUTOSNo.Checked := FALSE;
  rbVE_INGRESOSBRUTOSSi.Checked := FALSE;
  rbVE_CONVENIONo.Checked := TRUE;
  rbVE_CONVENIOSi.Checked := FALSE;
  edVE_NUMINGBRUTOS.Clear;
  edVE_BENEFICIARIO.Clear;
  edVE_FECHAIMPRESIONFORMINSCR.Clear;
  chkVE_CBUINFORMADA.Checked := FALSE;
end;

function TfrmManVendedor.DoABM: Boolean;
var
  nID_Vendedor: TTableId;
begin
  Sql.Clear;
  if (ModoABM = maAlta) then
    nID_Vendedor := ValorSql('SELECT SEQ_XVE_ID.NEXTVAL FROM DUAL')
  else
    nID_Vendedor := sdqConsulta.FieldByName('VE_ID').AsInteger;

  if ModoABM = maBaja then
  begin
    //Doy de baja al vendedor
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('VE_ID',    nID_Vendedor);
    Sql.Fields.Add('VE_FECHABAJA', exDateTime);
    Sql.Fields.Add('VE_USUBAJA',   Sesion.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.Add('VE_ID',    nID_Vendedor);
      Sql.Fields.Add('VE_USUALTA',   Sesion.UserID);
      Sql.Fields.Add('VE_FECHAALTA', edVE_FECHAALTA.Date, dtDate);
    end;

    if ModoABM = maModificacion then
    begin
      //Actualizo los datos del vendedor
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('VE_ID',     nID_Vendedor);
      Sql.Fields.Add('VE_FECHAMODIF', exDateTime);
      Sql.Fields.Add('VE_USUMODIF',   Sesion.UserID);
    end;

    //Empiezo con los campos
    Sql.Fields.Add('VE_VENDEDOR',  edVE_VENDEDOR.Text);
    Sql.Fields.Add('VE_CUIT',      edVE_CUIT.Text);
    Sql.Fields.Add('VE_NOMBRE',    edVE_NOMBRE.Text);
    Sql.Fields.Add('VE_DOMICILIO', '');

    with fraDomicilio do
    begin
      Sql.Fields.Add('VE_CPOSTAL',   CodigoPostal);
      Sql.Fields.Add('VE_CALLE',     Calle);
      Sql.Fields.Add('VE_LOCALIDAD', Localidad);
      Sql.Fields.Add('VE_PROVINCIA', ValorSqlInteger('SELECT PV_CODIGO' +
                                                      ' FROM CPV_PROVINCIAS' +
                                                     ' WHERE PV_DESCRIPCION = ' + SqlValue(Provincia), 0), False);
      Sql.Fields.Add('VE_NUMERO',       Numero);
      Sql.Fields.Add('VE_PISO',         Piso);
      Sql.Fields.Add('VE_DEPARTAMENTO', Departamento);
      Sql.Fields.Add('VE_CPOSTALA',     CPA);
    end;

    Sql.Fields.Add('VE_CODAREATELEFONOS', edVE_CODAREATELEFONOS.Text);
    Sql.Fields.Add('VE_TELEFONOS',        edVE_TELEFONOS.Text);
    Sql.Fields.Add('VE_CODAREAFAX',       edVE_CODAREAFAX.Text);
    Sql.Fields.Add('VE_FAX',              edVE_FAX.Text);
    Sql.Fields.Add('VE_DIRELECTRONICA',   edVE_DIRELECTRONICA.Text);
    Sql.Fields.Add('VE_IDCANAL',          fraVE_IDCANAL.Value, True);

    if rbVE_DOMICILIO_VENDEDORVendedor.Checked then
    begin
      Sql.Fields.Add('VE_DOMICILIO_VENDEDOR', True);
      Sql.Fields.Add('VE_IDENTIDAD_CORREO', '');
    end
    else
    begin
      Sql.Fields.Add('VE_DOMICILIO_VENDEDOR', False);
      Sql.Fields.Add('VE_IDENTIDAD_CORREO',   fraVE_IDENTIDAD_CORREO.Value);
    end;

    Sql.Fields.Add('VE_IDDELEGACION',         fraVE_IDDELEGACION.Value);

    if rbVE_INGRESOSBRUTOSNo.Checked then
      Sql.Fields.Add('VE_INGRESOSBRUTOS', False)
    else
      Sql.Fields.Add('VE_INGRESOSBRUTOS', True);

    Sql.Fields.Add('VE_SITIVA', fraSituacionIVA.Value);

    if rbVE_CONVENIONo.Checked then
      Sql.Fields.Add('VE_CONVENIO', False)
    else
      Sql.Fields.Add('VE_CONVENIO', True);

    Sql.Fields.Add('VE_GANANCIAS',               fraVE_GANANCIAS.Value);
    Sql.Fields.Add('VE_NUMINGBRUTOS',            edVE_NUMINGBRUTOS.Text);
    Sql.Fields.Add('VE_OBRASOCIAL',              fraVE_OBRASOCIAL.Value);
    Sql.Fields.Add('VE_NUMOSOCIAL',              edVE_NUMOSOCIAL.Text);
    Sql.Fields.Add('VE_MATRICULA',               edVE_MATRICULA.Text);
    Sql.Fields.Add('VE_BENEFICIARIO',            edVE_BENEFICIARIO.Text);
    Sql.Fields.Add('VE_FECHAIMPRESIONFORMINSCR', edVE_FECHAIMPRESIONFORMINSCR.Date, dtDate);
    Sql.Fields.Add('VE_FECHAULTCONVENIO',        edVE_FECHAULTCONVENIO.Date, dtDate);
    Sql.Fields.Add('VE_FECHAREVISION',           edVE_FECHAREVISION.Date, dtDate);
    Sql.Fields.Add('VE_CBUINFORMADA',            chkVE_CBUINFORMADA.Checked);
    Sql.Fields.Add('VE_PROVINCIASEGUROS',        edVE_PROVINCIASEGUROS.Text);
  end;

  try
    BeginTrans;

    if ModoABM = maAlta then
      //Ejecuto las modificaciones en el vendedor
      EjecutarSqlST(Sql.Sql);

    if ModoABM <> maAlta then
     //Ejecuto las modificaciones en el vendedor
     EjecutarSqlST(Sql.Sql);

    CommitTrans;
    Result := True;
  except
    Rollback;
    raise;
  end;
end;

procedure TfrmManVendedor.LoadControls;
begin
  LockControl(tsDatosGenerales, not Seguridad.Claves.IsActive('PermisoModificarDatosGenerales'));
  LockControl(tsFacturacion, not Seguridad.Claves.IsActive('PermisoModificarFacturacion'));

  // Habilito el control
  VCLExtra.LockControl(edVE_VENDEDOR, True);
  VCLExtra.LockControl(edVE_DOMICILIO, True);

  edVE_VENDEDOR.Text  := sdqConsulta.FieldByName('VE_VENDEDOR').AsString;
  edVE_NOMBRE.Text    := sdqConsulta.FieldByName('VE_NOMBRE').AsString;
  edVE_CUIT.Text      := sdqConsulta.FieldByName('VE_CUIT').AsString;
  edVE_DOMICILIO.Text := sdqConsulta.FieldByName('VE_DOMICILIO').AsString;
  edVE_FECHAALTA.Date := sdqConsulta.FieldByName('VE_FECHAALTA').AsDateTime;

  with fraDomicilio do
  begin
    CodigoPostal := sdqConsulta.FieldByName('VE_CPOSTAL').AsString;
    Calle        := sdqConsulta.FieldByName('VE_CALLE').AsString;
    Localidad    := sdqConsulta.FieldByName('VE_LOCALIDAD').AsString;
    Provincia    := sdqConsulta.FieldByName('PV_DESCRIPCION').AsString;
    Numero       := sdqConsulta.FieldByName('VE_NUMERO').AsString;
    Piso         := sdqConsulta.FieldByName('VE_PISO').AsString;
    Departamento := sdqConsulta.FieldByName('VE_DEPARTAMENTO').AsString;
    CPA          := sdqConsulta.FieldByName('VE_CPOSTALA').AsString;
  end;
  
  edVE_CODAREATELEFONOS.Text := sdqConsulta.FieldByName('VE_CODAREATELEFONOS').AsString;
  edVE_TELEFONOS.Text        := sdqConsulta.FieldByName('VE_TELEFONOS').AsString;
  edVE_CODAREAFAX.Text       := sdqConsulta.FieldByName('VE_CODAREAFAX').AsString;
  edVE_FAX.Text              := sdqConsulta.FieldByName('VE_FAX').AsString;
  edVE_DIRELECTRONICA.Text   := sdqConsulta.FieldByName('VE_DIRELECTRONICA').AsString;
  fraVE_GANANCIAS.Value      := sdqConsulta.FieldByName('VE_GANANCIAS').AsString;
  fraVE_OBRASOCIAL.Value     := sdqConsulta.FieldByName('VE_OBRASOCIAL').AsString;
  edVE_NUMOSOCIAL.Text       := sdqConsulta.FieldByName('VE_NUMOSOCIAL').AsString;
  edVE_MATRICULA.Text        := sdqConsulta.FieldByName('VE_MATRICULA').AsString;
  fraVE_IDCANAL.Value        := sdqConsulta.FieldByName('VE_IDCANAL').AsInteger;
  edVE_FECHAULTCONVENIO.Date := sdqConsulta.FieldByName('VE_FECHAULTCONVENIO').AsDateTime;
  edVE_FECHAREVISION.Date    := sdqConsulta.FieldByName('VE_FECHAREVISION').AsDateTime;
  fraVE_IDDELEGACION.Value   := sdqConsulta.FieldByName('VE_IDDELEGACION').AsInteger;
  edVE_PROVINCIASEGUROS.Text := sdqConsulta.FieldByName('VE_PROVINCIASEGUROS').AsString;

  if sdqConsulta.FieldByName('VE_CONVENIO').AsString = SQL_TRUE then
    rbVE_CONVENIOSi.Checked := True
  else
    rbVE_CONVENIONo.Checked := True;

  if sdqConsulta.FieldByName('VE_INGRESOSBRUTOS').AsString = SQL_TRUE then
    rbVE_INGRESOSBRUTOSSi.Checked := True
  else
    rbVE_INGRESOSBRUTOSNo.Checked := True;

  edVE_NUMINGBRUTOS.Text := sdqConsulta.FieldByName('VE_NUMINGBRUTOS').AsString;

  fraSituacionIVA.Value := sdqConsulta.FieldByName('VE_SITIVA').AsString;
  fraSituacionIVAChange(nil);

  edVE_BENEFICIARIO.Text            := sdqConsulta.FieldByName('VE_BENEFICIARIO').AsString;
  edVE_FECHAIMPRESIONFORMINSCR.Date := sdqConsulta.FieldByName('VE_FECHAIMPRESIONFORMINSCR').AsDateTime;

  chkVE_CBUINFORMADA.Checked        := (sdqConsulta.FieldByName('VE_CBUINFORMADA').AsString = SQL_TRUE);

  if sdqConsulta.FieldByName('VE_DOMICILIO_VENDEDOR').AsString = SQL_TRUE then
    rbVE_DOMICILIO_VENDEDORVendedor.Checked := True
  else
    rbVE_DOMICILIO_VENDEDOREntidad.Checked  := True;
  fraVE_IDENTIDAD_CORREO.Value := sdqConsulta.FieldByName('VE_IDENTIDAD_CORREO').AsInteger;

  // Con esto me aseguro que se actualice el estado del campo IDENTIDAD_CORREO(habilitado o no)
  CambiaEstadoCheck(nil);
end;

procedure TfrmManVendedor.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  inherited;
end;

function TfrmManVendedor.Validar: Boolean;
  procedure InvMsg(aTabIndex: Integer; aCondicion: Boolean; aControl: TWinControl; aMessage: String);
  begin
    pgCtrlVendedor.ActivePageIndex:= ATabIndex;
    Verificar(aCondicion, aControl, aMessage);
  end;
var
  bCargaDatosGenerales, bCargaFacturacion, bPoseeDomicilioViejo: Boolean;
  sResult: String;
  veId: TTableId;
begin
  Result := False;

  if (ModoABM = maModificacion) then
    begin
      Verificar(edVE_VENDEDOR.Text = '0', edVE_VENDEDOR, 'No se pueden modificar los datos del código de vendedor 0.');

      bPoseeDomicilioViejo := (edVE_DOMICILIO.Text <> '');
      bCargaDatosGenerales := Seguridad.Claves.IsActive('PermisoModificarDatosGenerales');
      bCargaFacturacion    := Seguridad.Claves.IsActive('PermisoModificarFacturacion');
    end
  else
    begin
      bPoseeDomicilioViejo := False;
      bCargaDatosGenerales := True;
      bCargaFacturacion    := True;
    end;

  // Inicio con la validación campo por campo..
  if bCargaDatosGenerales then
    begin
      InvMsg(PAGE_DATOSGENERALES, (not IsCUIT(Trim(edVE_CUIT.Text))), edVE_CUIT, 'El número de CUIT no es válido.');
      InvMsg(PAGE_DATOSGENERALES, (not EsCUITUnicaVendedor(Trim(edVE_CUIT.Text))), edVE_CUIT, 'Existe otro vendedor con el mismo número de CUIT.');
    end;

  if ModoABM = maAlta then
    veId := ART_EMPTY_ID
  else
    veId := sdqConsulta.FieldByName('VE_ID').AsInteger;

  if not EsCUITUnicaEntidad(Trim(edVE_CUIT.Text), veId) then
  begin
    if MsgAsk('El número de CUIT ya existe en una entidad.' + CRLF + '¿ Desea ver todas las entidades activas que poseen el mismo cuit ?') then
    begin
      MostrarRelacionesActivas; //Muestra la pantalla que permite dar de baja las relaciones
      btnAceptar.Click;
    end
    else
      Result := False;

    Exit;
  end;

  if bCargaDatosGenerales then
    begin
      InvMsg(PAGE_DATOSGENERALES, (Trim(edVE_NOMBRE.Text) = ''), edVE_NOMBRE, 'El nombre del vendedor es obligatorio.');
      InvMsg(PAGE_DATOSGENERALES, (bPoseeDomicilioViejo and fraDomicilio.IsEmpty), fraDomicilio, 'Debe completar el domicilio con el nuevo formato.');
      InvMsg(PAGE_DATOSGENERALES, ((Trim(edVE_DIRELECTRONICA.Text) <> '') and (not IsEMail(edVE_DIRELECTRONICA.Text))), edVE_DIRELECTRONICA, 'La dirección de correo electrónico no es válida.');
      InvMsg(PAGE_DATOSGENERALES, (((not rbVE_DOMICILIO_VENDEDORVendedor.checked ) and (not rbVE_DOMICILIO_VENDEDOREntidad.checked ))), nil, 'La dirección de envío es obligatoria.');
      InvMsg(PAGE_DATOSGENERALES, (((rbVE_DOMICILIO_VENDEDOREntidad.checked) and (fraVE_IDENTIDAD_CORREO.IsEmpty))), fraVE_IDENTIDAD_CORREO.edCodigo, 'La entidad de envío es obligatoria si la dirección de envío es entidad.');
      InvMsg(PAGE_DATOSGENERALES, fraVE_IDDELEGACION.IsEmpty, fraVE_IDDELEGACION, 'La delegación es obligatoria.');
    end;

  if bCargaFacturacion then
    begin
      if rbVE_INGRESOSBRUTOSSi.Checked and rbVE_CONVENIOSi.Checked then
      begin
        sResult := ValorSql('SELECT CONT.GET_MSGVALIDACIONCM (' + SqlValue(edVE_NUMINGBRUTOS.Text) + ') FROM DUAL');
        InvMsg(PAGE_FACTURACION, (sResult <> ''), edVE_NUMINGBRUTOS, sResult);
      end;

      InvMsg(PAGE_FACTURACION, (fraSituacionIVA.IsEmpty), fraSituacionIVA.edCodigo, 'La condición de IVA es obligatoria.');
      InvMsg(PAGE_FACTURACION, (fraVE_GANANCIAS.IsEmpty), fraVE_GANANCIAS.edCodigo, 'El código de retención de ganancias es obligatorio.');
      InvMsg(PAGE_FACTURACION, (fraVE_OBRASOCIAL.IsEmpty), fraVE_OBRASOCIAL.edCodigo, 'El código de Obra Social es obligatorio.');
      InvMsg(PAGE_FACTURACION, ((not rbVE_INGRESOSBRUTOSSi.Checked) and (not rbVE_INGRESOSBRUTOSNo.Checked)), nil, 'El código de Ingresos Brutos es obligatorio.');
      InvMsg(PAGE_FACTURACION, ((rbVE_INGRESOSBRUTOSSi.Checked) and (trim(edVE_NUMINGBRUTOS.Text) = '')), edVE_NUMINGBRUTOS, 'El número de Ingresos Brutos es obligatorio si se le retiene Ingresos Brutos a la entidad.');
      InvMsg(PAGE_FACTURACION, ((not edVE_FECHAIMPRESIONFORMINSCR.IsEmpty) and (edVE_FECHAIMPRESIONFORMINSCR.Date > DBDate)), edVE_FECHAIMPRESIONFORMINSCR, 'La Fecha de Impresión del Formulario de Inscripción a la AFIP no puede ser mayor a la fecha actual.');
      InvMsg(PAGE_FACTURACION, chkVE_CBUINFORMADA.Checked and (fraSituacionIVA.Codigo <> '1'), chkVE_CBUINFORMADA, 'La CBU informada solo corresponde a R. Inscripto.');
    end;

  pgCtrlVendedor.ActivePageIndex := PAGE_DATOSGENERALES;
  Result := not bCargaDatosGenerales or fraDomicilio.IsValid;
end;                 

procedure TfrmManVendedor.tbModificarClick(Sender: TObject);
begin
  if not IsBaja then
    inherited;
end;

procedure TfrmManVendedor.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  pgCtrlVendedor.ActivePageIndex := PAGE_DATOSGENERALES;

  VCLExtra.LockControl(edVE_FECHAALTA, True);

  if ModoABM = maAlta then
    edVE_FECHAALTA.Date := DBDate;
end;

procedure TfrmManVendedor.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  sdqConsulta.FieldByName('VE_CUIT').EditMask := EMSK_CUIT;
end;

procedure TfrmManVendedor.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
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

procedure TfrmManVendedor.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmManVendedor.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmManVendedor.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmManVendedor.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmManVendedor.mnuImpEtiquetasClick(Sender: TObject);
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

procedure TfrmManVendedor.CambiaEstadoCheck(Sender: TObject);
begin
  if rbVE_DOMICILIO_VENDEDOREntidad.Checked then
    VCLExtra.LockControl (fraVE_IDENTIDAD_CORREO, False)
  else
    VCLExtra.LockControl (fraVE_IDENTIDAD_CORREO, True);
end;

procedure TfrmManVendedor.RefreshData;
begin
  inherited;
end;

procedure TfrmManVendedor.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoABM Then
  begin
     tbRefrescarClick(nil);
     fpABM.ModalResult := mrOk;
  end;
end;

procedure TfrmManVendedor.tbLimpiarClick(Sender: TObject);
begin
  fraVendedorDesde.Clear;
  fraVendedorHasta.Clear;
  edVE_FECHAALTADesde.Clear;
  edVE_FECHAALTAHasta.Clear;
  fraDelegacionVend.Clear;
  chkSoloActivos.Checked   := True;
  chkSoloObjetivos.Checked := False;
  sdqConsulta.Close;
end;

procedure TfrmManVendedor.rbVE_INGRESOSBRUTOSSiClick(Sender: TObject);
begin
  VCLExtra.LockControls(GroupBox7, False);
  VCLExtra.LockControls(GroupBox8, False);
end;

procedure TfrmManVendedor.rbVE_INGRESOSBRUTOSNoClick(Sender: TObject);
begin
  VCLExtra.LockControls(GroupBox7, True);
  VCLExtra.LockControls(GroupBox8, True);
end;

procedure TfrmManVendedor.tbCuentasBancariasClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    if Trim( sdqConsulta.FieldByName('VE_CUIT').AsString ) <> '' then
    begin
      with TfrmManCCP_CUENTAPAGO.Create(Self) do
      try
        Execute('PR', Self.sdqConsulta.FieldByName('VE_ID').AsInteger, '')  // no quitar el Self
      finally
        Free;
      end
    end
    else
      InfoHint(Grid, 'El vendedor debe tener CUIT.');
  end
  else
    InfoHint(Grid, 'No ha seleccionado ningún vendedor.');
end;

procedure TfrmManVendedor.MostrarRelacionesActivas;
begin
  frmCuitDuplicada.Free;
  frmCuitDuplicada := TfrmCuitDuplicada.Create(Self);
  frmCuitDuplicada.CuitVendedor := edVE_CUIT.Text;
  frmCuitDuplicada.Visible := False;
  frmCuitDuplicada.ShowModal;
end;

function TfrmManVendedor.EsCUITUnicaEntidad(Cuit: String; IdVendedor: TTableId): Boolean;
var
  sSql: String;
begin
  if ModoABM = maAlta then
    sSql := 'SELECT 1 ' +
            '  FROM XEN_ENTIDAD ' +
            ' WHERE EN_CUIT = ' + SqlValue(Cuit)
  else
    //El número de cuit puede estar, pero sólo si es el registro que estoy modificando...
    sSql := 'SELECT 1 ' +
            '  FROM XEN_ENTIDAD ' +
            ' WHERE EN_CUIT = ' + SqlValue(Cuit) +
            '   AND NOT EXISTS (SELECT 1 ' +
            '                     FROM XEV_ENTIDADVENDEDOR ' +
            '                    WHERE EV_IDENTIDAD = EN_ID ' +
            '                      AND EV_IDVENDEDOR = ' + SqlValue(IdVendedor) +
            '                      AND EV_FECHABAJA IS NULL)';

  Result := not ExisteSql(sSql);
end;

function TfrmManVendedor.EsCUITUnicaVendedor(Cuit: String): Boolean;
var
  sSql: String;
begin
  if ModoABM = maAlta then
    sSql := 'SELECT 1 ' +
            '  FROM XVE_VENDEDOR ' +
            ' WHERE VE_CUIT = ' + SqlValue(Cuit)
  else
    //El número de cuit puede estar, pero sólo si es el registro que estoy modificando...
    sSql := 'SELECT 1 ' +
            '  FROM XVE_VENDEDOR ' +
            ' WHERE VE_CUIT = ' + SqlValue(Cuit) +
            '   AND VE_ID <> ' + SqlValue(sdqConsulta.FieldByName('VE_ID').AsInteger);
  Result := not ExisteSql(sSql);
end;

procedure TfrmManVendedor.tbObjetivosClick(Sender: TObject);
var
  aIdVendedor: Integer;
begin
  if not sdqConsulta.Active then
    Exit;

  aIdVendedor := sdqConsulta.FieldByName('VE_ID').AsInteger;
  with TfrmObjetivos.Create(Self) do
  try
    IdVendedor := aIdVendedor;
    ShowModal;
  finally
    Free;
  end;

  tbRefrescarClick( nil );
end;             

procedure TfrmManVendedor.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.Eof or not sdqConsulta.Active, Grid, 'Debe elegir un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, Grid, 'El vendedor ya ha sido aprobado.');
  Verificar(not sdqConsulta.FieldByName('VE_FECHABAJA').IsNull, Grid, 'El vendedor se encuentra dado de baja.');

  if MsgBox('¿Está seguro que desea aprobar?', MB_YESNO + MB_ICONQUESTION ) = mrYes then
    begin
      sSql := 'UPDATE XVE_VENDEDOR ' +
                 'SET VE_APROBADO = ''S'', ' +
                     'VE_USUAPROBADO = :UsuAprobado, ' +
                     'VE_FECHAAPROBADO = SYSDATE ' +
               'WHERE VE_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('VE_ID').AsInteger]);

      MsgBox('Vendedor aprobado correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

procedure TfrmManVendedor.fraSituacionIVAChange(Sender: TObject);
begin
  if fraSituacionIVA.Codigo = '4' then        // Monotributista
    begin
      fraVE_GANANCIAS.Value := '99';          // No Retiene
      LockControl(fraVE_GANANCIAS, True);
    end
  else if fraSituacionIVA.Codigo = '5' then   // R.Inscripto Factura M
    begin
      fraVE_GANANCIAS.Value := '17';          // Factura M
      LockControl(fraVE_GANANCIAS, True);
    end
  else
    LockControl(fraVE_GANANCIAS,False);
end;

procedure TfrmManVendedor.DoReactivarVendedor;
var
  nID_Vendedor: TTableId;
begin
  Sql.Clear;

  nID_Vendedor := sdqConsulta.FieldByName('VE_ID').AsInteger;

  Sql.PrimaryKey.Add('VE_ID',     nID_Vendedor);
  Sql.Fields.Add('VE_FECHABAJA',  exNull);
  Sql.Fields.Add('VE_USUBAJA',    exNull);
  Sql.Fields.Add('VE_FECHAMODIF', exDateTime);
  Sql.Fields.Add('VE_USUMODIF',   Sesion.UserId);
  Sql.SqlType := stUpdate;

  EjecutarSql(Sql.Sql);
end;

procedure TfrmManVendedor.tbReactivarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'Debe seleccionar un registro.');
  Verificar(not IsBaja, Grid, 'El vendedor no se encuentra dado de baja.');

  if MsgBox('¿Desea reactivar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      DoReactivarVendedor;
      sdqConsulta.Refresh;
    end;
end;

procedure TfrmManVendedor.tbEjecutivoCuentaClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay seleccionado ningún vendedor.');

  if fpEjecutivoCuenta.ShowModal = mrOk then
    tbRefrescarClick(nil);
end;

procedure TfrmManVendedor.btnAceptarEjCuentaClick(Sender: TObject);
begin
  inherited;

  with TSql.Create('XVE_VENDEDOR') do
    try
      SqlType   := stUpdate;

      PrimaryKey.Add('VE_ID', sdqConsulta.FieldByName('VE_ID').AsInteger, False);
      Fields.Add('VE_IDEJECUTIVO', fraEjecutivo.Value, True);

      EjecutarSql(Sql);

      fpEjecutivoCuenta.ModalResult := mrOk;
    finally
      free;
    end;
end;

procedure TfrmManVendedor.fpEjecutivoCuentaEnter(Sender: TObject);
begin
  fraEjecutivo.Value := sdqConsulta.FieldByName('EC_ID').AsInteger;
end;

function TfrmManVendedor.GetNextVendedorReferencia: Integer;
var
  sSql: string;
  ProxNum: Integer;
begin
  sSql := 'SELECT MIN(NROVEND) ' +
            'FROM (SELECT TO_NUMBER(X1.VE_VENDEDOR) + 1  NROVEND ' +
                    'FROM XVE_VENDEDOR X1 ' +
                   'WHERE X1.VE_CUIT IS NOT NULL ' +
                     'AND ART.UTILES.ISNUMBER(X1.VE_VENDEDOR) = 1 ' +
                     'AND NOT EXISTS(SELECT 1 ' +
                                      'FROM XVE_VENDEDOR X2 ' +
                                     'WHERE TO_NUMBER(X2.VE_VENDEDOR) = TO_NUMBER(X1.VE_VENDEDOR) + 1 ' +
                                       'AND X2.VE_CUIT IS NOT NULL ' +
                                       'AND ART.UTILES.ISNUMBER(X2.VE_VENDEDOR) = 1)) ' +
           'WHERE DECODE(ART.UTILES.ISNUMBER(NROVEND), 1, NROVEND, 0) >= 1000';

  ProxNum := ValorSql(sSql);

  Result := ProxNum;
end;

end.

