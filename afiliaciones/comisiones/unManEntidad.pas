unit unManEntidad;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   07-01-2003
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, IntEdit, Mask, DBCtrls, unArtFrame, unArtDbFrame,
  unFraEmpresa, unCustomGridABM, FormPanel, unFraDomicilio, PatternEdit, ToolEdit, unFraCodigoDescripcion, unfraCtbTablas,
  AnsiSql, CurrEdit, unfraEntidadCUIT, PeriodoPicker, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unFraDomicilioTrab, unArtDBAwareFrame, unArt, unFraCanal, DateComboBox,
  unFraCodDesc;

type
  TfrmManEntidad = class(TfrmCustomGridABM)
    Label1: TLabel;
    edEN_ID: TEdit;
    Label3: TLabel;
    edEN_CUIT: TMaskEdit;
    edEN_NOMBRE: TEdit;
    Label4: TLabel;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label19: TLabel;
    fraEntidadHasta: TfraEntidadCUIT;
    fraEntidadDesde: TfraEntidadCUIT;
    edEN_CODBANCO: TIntEdit;
    fpCerrarVigencia: TFormPanel;
    Bevel1: TBevel;
    btnAceptarCerrarVigencia: TButton;
    edCerrarVigencia: TPeriodoPicker;
    tbExencion: TToolButton;
    tbSeparador: TToolButton;
    btnCancelarCerrarVigencia: TButton;
    Label22: TLabel;
    gbFecha: TGroupBox;
    edEN_FECHAALTADesde: TDateComboBox;
    edEN_FECHAALTAHasta: TDateComboBox;
    Label21: TLabel;
    tbGranOrganizador: TToolButton;
    tbAprobar: TToolButton;
    tbEjecutivoCuenta: TToolButton;
    pgCtrlEntidad: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsComision: TTabSheet;
    tsFacturacion: TTabSheet;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    lbNro: TLabel;
    edEN_RESPONSABLE: TEdit;
    edEN_CODAREATELEFONOS: TIntEdit;
    edEN_TELEFONOS: TPatternEdit;
    edEN_CODAREAFAX: TIntEdit;
    edEN_FAX: TPatternEdit;
    edEN_BENEFICIARIO: TEdit;
    edEN_DOMICILIO: TEdit;
    edEN_MATRICULA: TIntEdit;
    fraDomicilio: TfraDomicilioTrab;
    edEN_FECHAALTA: TDateComboBox;
    Label24: TLabel;
    fraEN_IDCANAL: TfraCanal;
    Label15: TLabel;
    edEN_OBSERVACIONES: TEdit;
    GroupBox6: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    rbEN_CONVENDEDORNo: TRadioButton;
    rbEN_CONVENDEDORSi: TRadioButton;
    edEN_PORCCOMISIONVEND: TCurrencyEdit;
    edEN_PORCCOMISIONENT: TCurrencyEdit;
    edEN_PORCCOMISIONVENDPUB: TCurrencyEdit;
    Label9: TLabel;
    fraEN_MODOLIQ: TfraStaticCTB_TABLAS;
    chkEN_ENTRAMITE: TCheckBox;
    GroupBox7: TGroupBox;
    rbEN_CONVENIONo: TRadioButton;
    rbEN_CONVENIOSi: TRadioButton;
    GroupBox1: TGroupBox;
    rbEN_INGRESOSBRUTOSSi: TRadioButton;
    rbEN_INGRESOSBRUTOSNo: TRadioButton;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    edEN_NUMINGBRUTOS: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edEN_NUMOSOCIAL: TEdit;
    fraEN_GANANCIAS: TfraStaticCTB_TABLAS;
    fraEN_OBRASOCIAL: TfraStaticCTB_TABLAS;
    lbFImpresionFormInscripcion: TLabel;
    edEN_FECHAIMPRESIONFORMINSCR: TDateComboBox;
    Label27: TLabel;
    fraSituacionIVA: TfraStaticCTB_TABLAS;
    Label28: TLabel;
    edEN_FECHAULTCONVENIO: TDateComboBox;
    lbFRevision: TLabel;
    edEN_FECHAREVISION: TDateComboBox;
    pnlBusqueda: TPanel;
    chkSoloActivos: TCheckBox;
    chkEN_CBUINFORMADA: TCheckBox;
    fpEjecutivoCuenta: TFormPanel;
    Label29: TLabel;
    fraEjecutivo: TfraStaticCodigoDescripcion;
    btnAceptarEjCuenta: TButton;
    btnCancelarEjCuenta: TButton;
    rbEN_FACTURA: TGroupBox;
    rbEN_FACTURASi: TRadioButton;
    rbEN_FACTURANo: TRadioButton;
    chkEN_REQUIERESUCURSAL: TCheckBox;
    tbReactivar: TToolButton;
    fraEN_IDDELEGACION: TfraCodDesc;
    Label31: TLabel;
    gbEjecutivo: TGroupBox;
    fraEjecutivoEnt: TfraStaticCodigoDescripcion;
    chkEN_VIP: TCheckBox;
    GroupBox3: TGroupBox;
    fraCanalEnt: TfraCanal;
    tsContactos: TTabSheet;
    GrillaContactos: TArtDBGrid;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbNuevoContacto: TToolButton;
    tbModificarContacto: TToolButton;
    tbEliminarContacto: TToolButton;
    sdqContactos: TSDQuery;
    dsContactos: TDataSource;
    fpContacto: TFormPanel;
    Label25: TLabel;
    btnAceptarContacto: TButton;
    btnCancelarContacto: TButton;
    Label6: TLabel;
    edMailContacto: TEdit;
    Label30: TLabel;
    edNombreContacto: TEdit;
    fraCargoContacto: TfraCtbTablas;
    Label32: TLabel;
    rgRespARTContacto: TRadioGroup;
    edTelContacto: TPatternEdit;
    Bevel2: TBevel;
    edCodAreaTelContacto: TPatternEdit;
    chkEntidadTramite: TCheckBox;
    Label33: TLabel;
    edFNacimientoContacto: TDateComboBox;
    chkAvisoOP: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject); 
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure edEN_COMISIONVENDChange(Sender: TObject);
    procedure edEN_COMISIONENTChange(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fpCerrarVigenciaBeforeShow(Sender: TObject);
    procedure rbEN_INGRESOSBRUTOSSiClick(Sender: TObject);
    procedure rbEN_INGRESOSBRUTOSNoClick(Sender: TObject);
    procedure tbExencionClick(Sender: TObject);
    procedure chkEN_ENTRAMITEClick(Sender: TObject);
    procedure edEN_PORCCOMISIONVENDPUBChange(Sender: TObject);
    procedure tbGranOrganizadorClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure fraSituacionIVAChange(Sender: TObject);
    procedure tbEjecutivoCuentaClick(Sender: TObject);
    procedure btnAceptarEjCuentaClick(Sender: TObject);
    procedure fraEjecutivoEnter(Sender: TObject);
    procedure tbReactivarClick(Sender: TObject);
    procedure fraEntidadDesdeChange(Sender: TObject);
    procedure tbModificarContactoClick(Sender: TObject);
    procedure tbEliminarContactoClick(Sender: TObject);
    procedure tbNuevoContactoClick(Sender: TObject);
    procedure btnAceptarContactoClick(Sender: TObject);
    procedure GrillaContactosDblClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure GrillaContactosGetCellParams(Sender: TObject; Field: TField;  AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    ModoABMContacto: TModoABM;
    procedure ModificaVendedorCero(Id_Entidad: integer; Accion: TModoABM; SQLVendedorCero, SQLEntidadRelacion, SQLEntVendConcepto: TSql);
    function  PoseeVendedoresReales(Id_Entidad: integer): boolean;
    function  PoseeVendedorCero (Id_Entidad: integer): boolean;
    function  PoseeContratosAsociados(Id_Entidad: integer): boolean;
    procedure GetIdEntVendedorCero(Id_Entidad: integer; var Id_Vendedor, Id_EntVendedor: Integer);
    function  EsCUITUnicaEntidad(Cuit: string): boolean;
    function  EsCUITUnicaVendedor(Cuit: string): boolean;
    function  EsNombreEntidadUnico(aNombre: string): boolean;
    function  GetNextEntidadReferencia: TTableId;
    procedure DoReactivarEntidad;
    procedure DoCargarGrillaContacto(IdEntidad: TTableId);
    procedure EnableButtonsContacto(AEnabled: Boolean);
    procedure CheckButtonsContacto;
    procedure ClearControlsContacto;
    procedure LoadControlsContacto;
    function DoABMContacto: Boolean;
    function ValidarContacto: Boolean;
    function IsBajaContacto: Boolean;
    procedure DoHabilitarSolapas(Habilitar: Boolean);
  protected
    procedure PrintResults; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    function  DoABM: Boolean; override;
  public
  end;

const
  PAGE_DATOSGENERALES = 0;
  PAGE_COMISION       = 1;
  PAGE_FACTURACION    = 2;

var
  frmManEntidad: TfrmManEntidad;

implementation

uses
  unPrincipal, unDmPrincipal, SqlFuncs, CustomDlgs, Internet, General, unSesion, CUIT,
  VCLExtra, unRPTEmpresasSinVendedor, unExencionIB, unCuitDuplicada, unFiltros,
  unManEntidadGranOrganizador, StrFuncs, unComisiones, DateTimeFuncs, DBSql;

{$R *.DFM}

procedure TfrmManEntidad.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere : String;
begin
  sSql := 'SELECT EN_ID, EN_CUIT, EN_NOMBRE, EN_RESPONSABLE, EN_BENEFICIARIO, EN_CBUINFORMADA, ' +
                 'EN_CODBANCO, EN_CALLE, EN_LOCALIDAD, EN_CPOSTAL, PV_DESCRIPCION,' +
                 'EN_NUMERO, EN_PISO, EN_DEPARTAMENTO, EN_MATRICULA, EN_IDDELEGACION, ' +
                 'EN_CPOSTALA, EN_CODAREATELEFONOS, EN_TELEFONOS, ' +
                 'EN_CODAREAFAX, EN_FAX, EN_DOMICILIO, EN_FECHAALTA, EN_FECHABAJA, TRUNC(EN_FECHABAJA) FECHABAJA,' +
                 'EN_GANANCIAS, EN_MODOLIQ, EN_IVA, ' +
                 'EN_OBRASOCIAL, EN_NUMOSOCIAL, EN_INGRESOSBRUTOS, EN_FACTURA, ' +
                 'EN_NUMINGBRUTOS, EN_MONOTRIBUTO, EN_CONVENDEDOR, EN_REQUIERESUCURSAL, ' +
                 'EN_PORCCOMISIONENT, EN_OBSERVACIONES, EN_IDCANAL, EN_CONVENIO, EN_FIRMACONVENIO, EN_CREARVENDEDOR, ' +
                 'EN_ENTRAMITE, EN_FECHAIMPRESIONFORMINSCR, CA_DESCRIPCION, ' +
                 'EN_ACTUALIZACONVENIO, TRUNC(EN_FECHAAPROBADO) FECHAAPROBADO, ' +
                 'EN_FECHAULTCONVENIO, EN_FECHAREVISION, EN_SITIVA, EC_ID, EC_NOMBRE EJECUTIVOCTA, ' +
                 'EL_NOMBRE DELEGACION, EN_VIP ' +
           ' FROM DEL_DELEGACION, AEC_EJECUTIVOCUENTA, XEN_ENTIDAD, CPV_PROVINCIAS, ACA_CANAL ' +
          ' WHERE EN_PROVINCIA = PV_CODIGO(+) ' +
            ' AND EN_IDCANAL = CA_ID ' +
            ' AND EN_IDDELEGACION = EL_ID(+) ' +
            ' AND EN_IDEJECUTIVO = EC_ID(+) ';

  sWhere := DoFiltro(gbFecha);
  //Filtros frame Entidad
  if fraEntidadDesde.IsSelected and (fraEntidadDesde.Value = fraEntidadHasta.Value) then
    sWhere := sWhere + ' AND EN_ID = ' + fraEntidadDesde.ID
  else if fraEntidadDesde.IsSelected and (fraEntidadDesde.CUIT = fraEntidadHasta.CUIT) and (fraEntidadDesde.CUIT > '') then
    sWhere := sWhere + ' AND EN_CUIT = ' + SQLValue(fraEntidadDesde.CUIT)
  else begin
    if Trim( fraEntidadDesde.edCodigo.Text ) > '' then
      sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) >= ' + SqlInteger(fraEntidadDesde.CodBanco);
    if Trim( fraEntidadHasta.edCodigo.Text ) > '' then
      sWhere := sWhere + ' AND TO_NUMBER(EN_CODBANCO) <= ' + SqlInteger(fraEntidadHasta.CodBanco);
  end;

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND EN_FECHABAJA IS NULL';

  if chkEntidadTramite.Checked then
    sWhere := sWhere + ' AND EN_ENTRAMITE = ''S''';

  if fraEjecutivoEnt.IsSelected then
    sWhere := sWhere + ' AND EN_IDEJECUTIVO = ' + SqlValue(fraEjecutivoEnt.Value);

  if fraCanalEnt.IsSelected then
    sWhere := sWhere + ' AND CA_ID = ' + SqlValue(fraCanalEnt.Value);

  //Realiza la consulta
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManEntidad.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;

  pgCtrlEntidad.ActivePageIndex  := PAGE_DATOSGENERALES;

  with fraEN_GANANCIAS do
    begin
      Clave          := 'RETGA';
      ExtraCondition := ' AND TB_ESPECIAL2 = ''C''';
    end;  

  with fraEN_IDCANAL do
    begin
      FiltraUsuario         := False;
      DynamicCols           := True;
      VisibleExtraFields[0] := False;
      VisibleExtraFields[1] := False;
      VisibleExtraFields[2] := False;
    end;

  with fraCanalEnt do
    begin
      FiltraUsuario         := False;
      DynamicCols           := True;
      VisibleExtraFields[0] := False;
      VisibleExtraFields[1] := False;
      VisibleExtraFields[2] := False;
      ShowBajas             := False;
    end;

  with fraSituacionIVA do
    begin
      Clave    := 'SIVA';
      OnChange := fraSituacionIVAChange;
    end;

  fraEN_OBRASOCIAL.Clave          := 'RETOS';
  fraEN_MODOLIQ.Clave             := 'MOLIQ';
  Sql.TableName                   := 'XEN_ENTIDAD';
  FieldBaja                       := 'EN_FECHABAJA';

  with fraEjecutivo do
    begin
      TableName      := 'AEC_EJECUTIVOCUENTA';
      FieldID        := 'EC_ID';
      FieldCodigo    := 'EC_ID';
      FieldDesc      := 'EC_NOMBRE';
      FieldBaja      := 'EC_FECHABAJA';
    end;

  with fraEjecutivoEnt do
    begin
      TableName      := 'AEC_EJECUTIVOCUENTA';
      FieldID        := 'EC_ID';
      FieldCodigo    := 'EC_ID';
      FieldDesc      := 'EC_NOMBRE';
      FieldBaja      := 'EC_FECHABAJA';
      ShowBajas      := True;
    end;

  with fraCargoContacto do
    begin
      Clave     := 'CARGO';
      ShowBajas := False;
    end;

  fraEntidadDesde.ShowBajas := True;
  fraEntidadHasta.ShowBajas := True;

  fraEntidadDesde.OnChange := fraEntidadDesdeChange;

  MSG_BAJA := '¿Desea dar de baja el registro seleccionado?';

  tbEjecutivoCuenta.Left := 100;
  tbAprobar.Left         := 100;
  tbGranOrganizador.Left := 100;
  tbExencion.Left        := 100;
  tbSeparador.Left       := 100;
  tbReactivar.Left       := 100;
end;

procedure TfrmManEntidad.ClearControls;
begin
  //Limpio los controles del formulario
  edEN_ID.Clear;
  edEN_NOMBRE.Clear;
  edEN_CODBANCO.Clear;
  edEN_CUIT.Clear;
  edEN_RESPONSABLE.Clear;
  edEN_BENEFICIARIO.Clear;
  edEN_DOMICILIO.Clear;
  fraDomicilio.Clear;
  edEN_CODAREATELEFONOS.Clear;
  edEN_TELEFONOS.Clear;
  edEN_CODAREAFAX.Clear;
  edEN_FAX.Clear;
  edEN_MATRICULA.Clear;
  fraEN_IDDELEGACION.Clear;
  fraEN_GANANCIAS.Clear;
  fraSituacionIVA.Clear;
  fraEN_MODOLIQ.Clear;
  fraEN_IDCANAL.Clear;
  fraEN_OBRASOCIAL.Clear;
  edEN_NUMOSOCIAL.Clear;
  rbEN_INGRESOSBRUTOSNo.Checked := False;
  rbEN_INGRESOSBRUTOSSi.Checked := False;
  rbEN_CONVENIONo.Checked := True;
  rbEN_CONVENIOSi.Checked := False;
  rbEN_FACTURANo.Checked  := False;
  rbEN_FACTURASi.Checked  := False;
  edEN_NUMINGBRUTOS.Clear;
  chkEN_ENTRAMITE.Checked        := False;
  chkEN_REQUIERESUCURSAL.Checked := False;
  rbEN_CONVENDEDORSi.Checked  := False;
  rbEN_CONVENDEDORNo.Checked  := False;
  edEN_PORCCOMISIONVEND.Value    := 0;
  edEN_PORCCOMISIONENT.Value     := 0;
  edEN_PORCCOMISIONVENDPUB.Value := 0;
  edEN_PORCCOMISIONVEND.Text     := '0';
  edEN_PORCCOMISIONENT.Text      := '0';
  edEN_PORCCOMISIONVENDPUB.Text  := '0';
  edEN_FECHAALTA.Clear;
  edEN_FECHAIMPRESIONFORMINSCR.Clear;
  edEN_OBSERVACIONES.Clear;
  edEN_FECHAULTCONVENIO.Clear;
  edEN_FECHAREVISION.Clear;
  edEN_CODBANCO.Value := GetNextEntidadReferencia;
  chkEN_CBUINFORMADA.Checked := False;
  chkEN_VIP.Checked := False;

  VCLExtra.LockControls([edEN_DOMICILIO, edEN_PORCCOMISIONENT], True);
  VCLExtra.LockControls([edEN_PORCCOMISIONVEND, edEN_PORCCOMISIONVENDPUB, fraEN_IDDELEGACION], False);

  DoHabilitarSolapas(True);
  DoCargarGrillaContacto(ART_EMPTY_ID);
end;

function TfrmManEntidad.DoABM: Boolean;
var
  nID_Entidad: TTableId;
  sSqlTransXEV, sSqlTransXVE, sSqlTransXVC: TSql;
  sCBUInformada, sConvenio, sIngrBrutos, sSql: String;
begin
  sSqlTransXVE := TSql.Create('XVE_VENDEDOR');
  sSqlTransXEV := TSql.Create('XEV_ENTIDADVENDEDOR');
  sSqlTransXVC := TSql.Create('XVC_ENTVENDCONCEPTO');
  try
    Sql.Clear;
    if ModoABM = maBaja then
    begin
      if fpCerrarVigencia.ShowModal = mrOK then
      begin
        EjecutarStoreEx('Comision.Do_BajaEntidad(:IdEntidad, :Periodo, :Usuario);',
                        [sdqConsulta.FieldByName('EN_ID').AsInteger, edCerrarVigencia.Periodo.Valor, Sesion.UserID]);
        Result := True;
      end
      else
        Result := False;

      ModificaVendedorCero(sdqConsulta.FieldByName('EN_ID').AsInteger, maBaja, sSqlTransXVE, sSqlTransXEV, sSqlTransXVC);
    end
    else
    begin
      if ModoABM = maAlta then
      begin
        Sql.SqlType  := stInsert;
        nID_Entidad  := ValorSql('SELECT SEQ_XEN_ID.NEXTVAL FROM DUAL');
        edEN_ID.Text := IntToStr(nID_Entidad);

        Sql.PrimaryKey.Add('EN_ID',     nID_Entidad);
        Sql.Fields.Add('EN_FECHAALTA',  edEN_FECHAALTA.Date, dtDate);
        Sql.Fields.Add('EN_USUALTA',    Sesion.UserID);
      end
      else
      begin { ModoABM = maModificacion }
        nID_Entidad := sdqConsulta.FieldByName('EN_ID').AsInteger;
        Sql.PrimaryKey.Add('EN_ID',     nID_Entidad);
        Sql.Fields.Add('EN_FECHAMODIF', exDateTime);
        Sql.Fields.Add('EN_USUMODIF',   Sesion.UserID);
        Sql.SqlType := stUpdate;
      end;

      Sql.Fields.Add('EN_CODBANCO',     edEN_CODBANCO.Text);
      Sql.Fields.Add('EN_NOMBRE',       edEN_NOMBRE.Text);
      Sql.Fields.Add('EN_CUIT',         edEN_CUIT.Text);
      Sql.Fields.Add('EN_RESPONSABLE',  edEN_RESPONSABLE.Text);
      Sql.Fields.Add('EN_BENEFICIARIO', edEN_BENEFICIARIO.Text);
      Sql.Fields.Add('EN_DOMICILIO',    '');
      Sql.Fields.Add('EN_IDDELEGACION', fraEN_IDDELEGACION.Value);

      with fraDomicilio do
      begin
        Sql.Fields.Add('EN_CPOSTAL',      CodigoPostal);
        Sql.Fields.Add('EN_CALLE',        Calle);
        Sql.Fields.Add('EN_LOCALIDAD',    Localidad);
        Sql.Fields.Add('EN_PROVINCIA',    ValorSqlInteger('SELECT PV_CODIGO' +
                                                           ' FROM CPV_PROVINCIAS' +
                                                          ' WHERE PV_DESCRIPCION = ' + SqlValue(Provincia), 0), False);
        Sql.Fields.Add('EN_NUMERO',       Numero);
        Sql.Fields.Add('EN_PISO',         Piso);
        Sql.Fields.Add('EN_DEPARTAMENTO', Departamento);
        Sql.Fields.Add('EN_CPOSTALA',     CPA);
      end;

      Sql.Fields.Add('EN_CODAREATELEFONOS', edEN_CODAREATELEFONOS.Text);
      Sql.Fields.Add('EN_TELEFONOS',        edEN_TELEFONOS.Text);
      Sql.Fields.Add('EN_CODAREAFAX',       edEN_CODAREAFAX.Text);
      Sql.Fields.Add('EN_FAX',              edEN_FAX.Text);

      Sql.Fields.Add('EN_MATRICULA',        edEN_MATRICULA.Text);
      Sql.Fields.Add('EN_GANANCIAS',        fraEN_GANANCIAS.Value);
      Sql.Fields.Add('EN_MODOLIQ',          fraEN_MODOLIQ.Value);
      Sql.Fields.Add('EN_OBRASOCIAL',       fraEN_OBRASOCIAL.Value);
      Sql.Fields.Add('EN_IDCANAL',          fraEN_IDCANAL.Value, True);
      Sql.Fields.Add('EN_NUMOSOCIAL',       edEN_NUMOSOCIAL.Text);

      // CheckBoxes
      sIngrBrutos := Iif(rbEN_INGRESOSBRUTOSNo.Checked, 'N', 'S');
      Sql.Fields.Add('EN_INGRESOSBRUTOS', sIngrBrutos);

      sConvenio := Iif(rbEN_CONVENIONo.Checked, 'N', 'S');
      Sql.Fields.Add('EN_CONVENIO', sConvenio);

      if rbEN_FACTURANo.Checked then
        Sql.Fields.Add('EN_FACTURA', False)
      else
        Sql.Fields.Add('EN_FACTURA', True);

      Sql.Fields.Add('EN_SITIVA',           fraSituacionIVA.Value);

      Sql.Fields.Add('EN_ENTRAMITE',        chkEN_ENTRAMITE.Checked);
      Sql.Fields.Add('EN_REQUIERESUCURSAL', chkEN_REQUIERESUCURSAL.Checked);

      Sql.Fields.Add('EN_NUMINGBRUTOS',     edEN_NUMINGBRUTOS.Text);

      //Comision
      if rbEN_CONVENDEDORNo.Checked then
        Sql.Fields.Add('EN_CONVENDEDOR', False)
      else
        Sql.Fields.Add('EN_CONVENDEDOR', True);

      Sql.Fields.Add('EN_FECHAIMPRESIONFORMINSCR', edEN_FECHAIMPRESIONFORMINSCR.Date, dtDate);
      Sql.Fields.Add('EN_PORCCOMISIONENT',         edEN_PORCCOMISIONENT.Value, dtNumber);
      Sql.Fields.Add('EN_OBSERVACIONES',           edEN_OBSERVACIONES.Text);
      Sql.Fields.Add('EN_FECHAULTCONVENIO',        edEN_FECHAULTCONVENIO.Date, dtDate);
      Sql.Fields.Add('EN_FECHAREVISION',           edEN_FECHAREVISION.Date, dtDate);

      sCBUInformada := Iif(chkEN_CBUINFORMADA.Checked, 'S', 'N');
      Sql.Fields.Add('EN_CBUINFORMADA',            sCBUInformada);

      Sql.Fields.Add('EN_VIP',                     String(Iif(chkEN_VIP.Checked, 'S', 'N')));

      if (ModoABM = maModificacion) then
        begin
          if PoseeVendedorCero(nId_Entidad) then
            ModificaVendedorCero(nID_Entidad, maModificacion, sSqlTransXVE, sSqlTransXEV, sSqlTransXVC)
          else
            ModificaVendedorCero(nID_Entidad, maAlta, sSqlTransXVE, sSqlTransXEV, sSqlTransXVC);
        end
      else if (ModoABM = maAlta) then
        ModificaVendedorCero(nID_Entidad, maAlta, sSqlTransXVE, sSqlTransXEV, sSqlTransXVC);

      //Ejecuta el Sql
      BeginTrans;
      try
        EjecutarSqlST(Sql.Sql);

        //Con esto chequeo si tiene que ejecutar el SQL o no...
        if sSqlTransXVE.Where <> '' then
          EjecutarSqlST(sSqlTransXVE.Sql);

        if sSqlTransXEV.Where <> '' then
          EjecutarSqlST(sSqlTransXEV.Sql);

        if sSqlTransXVC.Where <> '' then
          EjecutarSqlST(sSqlTransXVC.Sql);

        sSql := 'UPDATE XVE_VENDEDOR ' +    // tk 18954
                   'SET (VE_IDDELEGACION, VE_INGRESOSBRUTOS, VE_CONVENIO, ' +
                        'VE_NUMINGBRUTOS, VE_FECHAIMPRESIONFORMINSCR, VE_FECHAREVISION, ' +
                        'VE_SITIVA, VE_GANANCIAS, VE_OBRASOCIAL, ' +
                        'VE_NUMOSOCIAL, VE_CBUINFORMADA, VE_BENEFICIARIO, ' +
                        'VE_DOMICILIO, VE_CPOSTAL, VE_CALLE, ' +
                        'VE_LOCALIDAD, VE_PROVINCIA, VE_NUMERO, ' +
                        'VE_PISO, VE_DEPARTAMENTO, VE_CPOSTALA, ' +
                        'VE_CODAREATELEFONOS, VE_TELEFONOS, ' +
                        'VE_CODAREAFAX, VE_FAX, ' +
                        'VE_MATRICULA, VE_IDCANAL, VE_FECHAULTCONVENIO) = '+
                       '(SELECT EN_IDDELEGACION, EN_INGRESOSBRUTOS, EN_CONVENIO, ' +
                               'EN_NUMINGBRUTOS, EN_FECHAIMPRESIONFORMINSCR, EN_FECHAREVISION, ' +
                               'EN_SITIVA, EN_GANANCIAS, EN_OBRASOCIAL, ' +
                               'EN_NUMOSOCIAL, EN_CBUINFORMADA, EN_BENEFICIARIO, ' +
                               'EN_DOMICILIO, EN_CPOSTAL, EN_CALLE, ' +
                               'EN_LOCALIDAD, EN_PROVINCIA, EN_NUMERO, ' +
                               'EN_PISO, EN_DEPARTAMENTO, EN_CPOSTALA, ' +
                               'EN_CODAREATELEFONOS, EN_TELEFONOS, ' +
                               'EN_CODAREAFAX, EN_FAX, ' +
                               'EN_MATRICULA, EN_IDCANAL, EN_FECHAULTCONVENIO ' +
                            'FROM XEN_ENTIDAD ' +
                           'WHERE EN_ID = :IdEnt) '+
                 'WHERE VE_CUIT = :Cuit ' +
                   'AND VE_VENDEDOR = ''0''';
        EjecutarSqlSTEx(sSql, [nID_Entidad, edEN_CUIT.Text]);

        Result := True;
        CommitTrans;
      except
        on E: Exception do
        begin
          Result := False;
          Rollback;
          ErrorMsg(E);
        end;
      end;
    end; //End del Try inicial
  finally
    sSqlTransXEV.Free;
    sSqlTransXVE.Free;
    sSqlTransXVC.Free;
  end; //End del finally
end;

procedure TfrmManEntidad.LoadControls;
var
  sSql, sEjecutivo: String;
  SqlResults: TStringList;
begin
  chkEN_ENTRAMITE.OnClick := nil;

  // Inhabilito el control
  VCLExtra.LockControls([edEN_PORCCOMISIONVEND, edEN_PORCCOMISIONVENDPUB, edEN_DOMICILIO], True);
  VCLExtra.LockControls([fraEN_GANANCIAS, edEN_PORCCOMISIONENT], False);

  with sdqConsulta do
  begin
    edEN_ID.Text := FieldByName('EN_ID').AsString;

    sEjecutivo := Get_Ejecutivo(StrToInt(edEN_ID.Text));
    VCLExtra.LockControls(fraEN_IDDELEGACION, (not AreIn(IntToStr(Sesion.IdSectorIntranet), ['43052', '89133'])) and not Sesion.DependeDe(sEjecutivo, False));  // Gestión Comercial de Interior o es Jefe del ejecutivo

    edEN_NOMBRE.Text         := FieldByName('EN_NOMBRE').AsString;
    edEN_CODBANCO.Text       := FieldByName('EN_CODBANCO').AsString;
    edEN_CUIT.Text           := FieldByName('EN_CUIT').AsString;
    edEN_RESPONSABLE.Text    := FieldByName('EN_RESPONSABLE').AsString;
    edEN_BENEFICIARIO.Text   := FieldByName('EN_BENEFICIARIO').AsString;
    edEN_DOMICILIO.Text      := FieldByName('EN_DOMICILIO').AsString;
    fraEN_IDDELEGACION.Value := FieldByName('EN_IDDELEGACION').AsInteger;

    with fraDomicilio do
    begin
      CodigoPostal := FieldByName('EN_CPOSTAL').AsString;
      Calle        := FieldByName('EN_CALLE').AsString;
      Localidad    := FieldByName('EN_LOCALIDAD').AsString;
      Provincia    := FieldByName('PV_DESCRIPCION').AsString;
      Numero       := FieldByName('EN_NUMERO').AsString;
      Piso         := FieldByName('EN_PISO').AsString;
      Departamento := FieldByName('EN_DEPARTAMENTO').AsString;
      CPA          := FieldByName('EN_CPOSTALA').AsString;
    end;

    edEN_CODAREATELEFONOS.Text := FieldByName('EN_CODAREATELEFONOS').AsString;
    edEN_TELEFONOS.Text        := FieldByName('EN_TELEFONOS').AsString;
    edEN_CODAREAFAX.Text       := FieldByName('EN_CODAREAFAX').AsString;
    edEN_FAX.Text              := FieldByName('EN_FAX').AsString;
    fraEN_MODOLIQ.Value        := FieldByName('EN_MODOLIQ').AsString;

    fraEN_GANANCIAS.Value      := FieldByName('EN_GANANCIAS').AsString;
    fraEN_OBRASOCIAL.Value     := FieldByName('EN_OBRASOCIAL').AsString;
    edEN_NUMOSOCIAL.Text       := FieldByName('EN_NUMOSOCIAL').AsString;
    edEN_MATRICULA.Text        := FieldByName('EN_MATRICULA').AsString;

    fraSituacionIVA.Value      := FieldByName('EN_SITIVA').AsString;
    fraSituacionIVAChange(nil);

    if FieldByName('EN_IDCANAL').AsString <> '' then
      fraEN_IDCANAL.Value := FieldByName('EN_IDCANAL').AsInteger
    else
      fraEN_IDCANAL.Clear;

    if FieldByName('EN_CONVENIO').AsString = SQL_True then
      rbEN_CONVENIOSi.Checked := True
    else
      rbEN_CONVENIONo.Checked := True;

    if FieldByName('EN_INGRESOSBRUTOS').AsString = SQL_True  then
      rbEN_INGRESOSBRUTOSSi.Checked := True
    else if FieldByName('EN_INGRESOSBRUTOS').AsString = SQL_False then
      rbEN_INGRESOSBRUTOSNo.Checked := True
    else
       rbEN_INGRESOSBRUTOSSi.Checked := True;

    if FieldByName('EN_FACTURA').AsString = SQL_True  then
      rbEN_FACTURASi.Checked := True
    else if FieldByName('EN_FACTURA').AsString = SQL_False then
      rbEN_FACTURANo.Checked := True
    else
       rbEN_FACTURASi.Checked := True;

    edEN_NUMINGBRUTOS.Text := FieldByName('EN_NUMINGBRUTOS').AsString;

    chkEN_REQUIERESUCURSAL.Checked := (FieldByName('EN_REQUIERESUCURSAL').AsString = SQL_True);

    //Comision
    if FieldByName('EN_CONVENDEDOR').AsString = SQL_True then
      rbEN_CONVENDEDORSi.Checked := True
    else
      rbEN_CONVENDEDORNo.Checked := True;

    sSql := 'SELECT VC_PORCPRIVADO, VC_PORCPUBLICO ' +
              'FROM XVC_ENTVENDCONCEPTO, XEV_ENTIDADVENDEDOR ' +
             'WHERE EV_ID = VC_IDENTIDADVEND ' +
               'AND VC_IDCONCEPTO = 1 ' +
               'AND VC_FECHABAJA IS NULL ' +
               'AND EV_IDENTIDAD = ' + SqlValue(FieldByName('EN_ID').AsInteger);

    SqlResults := ValoresColSql(sSql);
    try
      edEN_PORCCOMISIONVEND.Text    := SqlResults[0];
      edEN_PORCCOMISIONVENDPUB.Text := SqlResults[1];
    finally
      SqlResults.Free;
    end;

    edEN_PORCCOMISIONENT.Text     := FieldByName('EN_PORCCOMISIONENT').AsString;

    edEN_FECHAALTA.Date := FieldByName('EN_FECHAALTA').AsDateTime;

    // f. impr. formulario inscr. AFIP
    edEN_FECHAIMPRESIONFORMINSCR.Date := FieldByName('EN_FECHAIMPRESIONFORMINSCR').AsDateTime;

    // f. últ. convenio
    edEN_FECHAULTCONVENIO.Date := FieldByName('EN_FECHAULTCONVENIO').AsDateTime;

    // f. revisión
    edEN_FECHAREVISION.Date := FieldByName('EN_FECHAREVISION').AsDateTime;

    //Observaciones Finales
    edEN_OBSERVACIONES.Text := FieldByName('EN_OBSERVACIONES').AsString;

    chkEN_CBUINFORMADA.Checked := (FieldByName('EN_CBUINFORMADA').AsString = SQL_True);
    chkEN_ENTRAMITE.Checked    := (FieldByName('EN_ENTRAMITE').AsString = SQL_True);
    chkEN_VIP.Checked          := (FieldByName('EN_VIP').AsString = SQL_True);

    DoHabilitarSolapas(True);
    DoCargarGrillaContacto(FieldByName('EN_ID').AsInteger);
  end;

  chkEN_ENTRAMITE.OnClick := chkEN_ENTRAMITEClick;
end;

procedure TfrmManEntidad.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
  inherited;
end;

function TfrmManEntidad.Validar: Boolean;
var
  bPoseeVendedoresReales : boolean;
  bPoseeDomicilioViejo : boolean;
  sEjecutivo, sTipo, sResult: String;
begin
  //Esta consulta permite validar la entrada de Tiene Vendedores
  //Si EsEntidadVendedora=True entonces no tiene vendedores
  if ModoABM = maModificacion then
  begin
    sEjecutivo := Get_Ejecutivo(StrToInt(edEN_ID.Text));
    Verificar(not Sesion.DependeDe(sEjecutivo), nil, 'Solo el ejecutivo asignado o su responsable pueden modificar este registro.');

    bPoseeVendedoresReales := PoseeVendedoresReales(StrToInt(edEN_ID.Text));
  end
  else
    bPoseeVendedoresReales := False;

  if ModoABM = maModificacion then
    bPoseeDomicilioViejo := ( edEN_DOMICILIO.Text <> '' )
  else
    bPoseeDomicilioViejo := False;

  //Inicio con la validacion campo por campo
  Verificar(Trim(edEN_CUIT.Text) = '', edEN_CUIT, 'El nº de CUIT es obligatorio.');
  Verificar(Trim(edEN_CODBANCO.Text) = '', edEN_CODBANCO, 'El código Entidad de Referencia es obligatorio.');
  Verificar(not IsCuit(Trim(edEN_CUIT.Text)), edEN_CUIT, 'El nº de CUIT no es válido.' );
  Verificar(Trim(edEN_NOMBRE.Text) = '', edEN_NOMBRE, 'El nombre es obligatorio.');
  Verificar(not EsNombreEntidadUnico(Trim(edEN_NOMBRE.Text)), edEN_NOMBRE, 'Ya existe una entidad con el nombre indicado.');
  Verificar((chkEN_ENTRAMITE.Checked and (ModoABM <> maAlta) and PoseeContratosAsociados(StrToInt(edEN_ID.Text))), edEN_CUIT, 'La Entidad no puede estar en trámite si tiene contratos asignados.');
  Verificar ((not edEN_FECHAIMPRESIONFORMINSCR.IsEmpty) and (edEN_FECHAIMPRESIONFORMINSCR.Date > DBDate), edEN_FECHAIMPRESIONFORMINSCR, 'La Fecha de Impresión del Formulario de Inscripción a la AFIP no puede ser mayor a la fecha actual.');
  Verificar(fraEN_IDCANAL.IsEmpty, fraEN_IDCANAL.edCodigo, 'El canal es obligatorio.');
  Verificar(fraEN_IDDELEGACION.IsEmpty, fraEN_IDDELEGACION, 'La delegación es obligatoria.');
  Verificar(edEN_PORCCOMISIONVEND.Value = 0, edEN_PORCCOMISIONVEND, 'La comisión es obligatoria.');

  Verificar(not EsCUITUnicaEntidad(Trim(edEN_CUIT.Text)), edEN_CUIT, 'El número de CUIT debe ser único.');

  if not EsCUITUnicaVendedor(Trim(edEN_CUIT.Text)) Then
  begin
    //Muestra la pantalla que permite dar de baja las relaciones
    if MsgAsk('El nº de CUIT ya existe en un vendedor. ¿Desea ver los vendedores activos que poseen dicho nº de CUIT?') then
    with TfrmCuitDuplicada.Create(Self) do
    begin
      if ModoABM = maAlta then
        ID_Entidad := -1
      else
        ID_Entidad := StrToInt(edEN_ID.Text);
      CuitEntidad := edEN_CUIT.Text;
      Visible := False;
      ShowModal;

      Verificar(not EsCUITUnicaVendedor(Trim(edEN_CUIT.Text)), edEN_CUIT, 'El nº de CUIT ya existe en un vendedor.' );
    end else
      Verificar(True, edEN_CUIT, 'El número de CUIT debe ser único.' );
  end;

  if chkEN_ENTRAMITE.Checked and (ModoABM = maAlta) then
  begin
    Result := True;
    Exit;
  end;

  Verificar(bPoseeDomicilioViejo and fraDomicilio.IsEmpty, fraDomicilio, 'Debe completar el domicilio con el nuevo formato.');
  Verificar(not fraDomicilio.IsValid, nil, '');

  sTipo := fraEN_IDCANAL.FieldValue('CA_TIPO', fraEN_IDCANAL.cmbDescripcion.Row);
  Verificar((Trim(edEN_MATRICULA.Text) = '') and (sTipo = 'P'), edEN_MATRICULA, 'La matrícula es obligatoria.');

  Verificar(fraEN_MODOLIQ.IsEmpty, fraEN_MODOLIQ.edCodigo, 'El modo de liquidación es obligatorio.');

  //Relativos a la Comision
  Verificar((not rbEN_CONVENDEDORNo.Checked) AND (not rbEN_CONVENDEDORSi.Checked), rbEN_CONVENDEDORNo, 'El campo tiene vendedores es obligatorio.');
  Verificar(rbEN_CONVENDEDORNo.Checked AND bPoseeVendedoresReales, rbEN_CONVENDEDORNo, 'El campo tiene vendedores no puede ser No cuando existen vendedores para la entidad.');

  if rbEN_INGRESOSBRUTOSSi.Checked and rbEN_CONVENIOSi.Checked then
  begin
    sResult := ValorSql('SELECT CONT.GET_MSGVALIDACIONCM (' + SqlValue(edEN_NUMINGBRUTOS.Text) + ') FROM DUAL');
    Verificar(sResult <> '', edEN_NUMINGBRUTOS, sResult);
  end;

  Verificar((not rbEN_INGRESOSBRUTOSSi.Checked) and (not rbEN_INGRESOSBRUTOSNo.Checked), rbEN_INGRESOSBRUTOSSi, 'El código de Ingresos Brutos es obligatorio.');
  Verificar((rbEN_INGRESOSBRUTOSSi.Checked) AND (trim(edEN_NUMINGBRUTOS.Text) = ''), edEN_NUMINGBRUTOS, 'El número de Ingresos Brutos es obligatorio si se le retiene Ing. Brutos a la entidad.');
  Verificar(fraSituacionIVA.IsEmpty, fraSituacionIVA.edCodigo, 'La condición de IVA es obligatoria.');
  Verificar(chkEN_CBUINFORMADA.Checked and (fraSituacionIVA.Codigo <> '1'), chkEN_CBUINFORMADA, 'La CBU informada solo corresponde a R. Inscripto.');
  Verificar((not rbEN_FACTURASi.Checked) and (not rbEN_FACTURANo.Checked), rbEN_FACTURA, 'Debe indicar si tiene o no factura.');

  Result := True ;
end;

procedure TfrmManEntidad.ModificaVendedorCero(Id_Entidad: Integer; Accion: TModoABM; SQLVendedorCero,
                                              SQLEntidadRelacion, SQLEntVendConcepto: TSql);
var
  IdXEV, nID_Vendedor, nID_EntVendedor: Integer;
begin
  if Accion = maAlta Then
    nID_Vendedor := GetSecNextVal('SEQ_XVE_ID')
  else
    GetIdEntVendedorCero(Id_Entidad, nID_Vendedor, nID_EntVendedor);

  if Accion = maBaja then
  begin
    //Doy de baja al vendedor '0'
    SQLVendedorCero.SqlType := stUpdate;
    SQLVendedorCero.PrimaryKey.Add('VE_ID',    nID_Vendedor);
    SQLVendedorCero.Fields.Add('VE_FECHABAJA', exDateTime);
    SQLVendedorCero.Fields.Add('VE_USUBAJA',   Sesion.UserID);

    //Doy de baja la relacion del vendedor '0'
    SQLEntidadRelacion.SqlType := stUpdate;
    SQLEntidadRelacion.PrimaryKey.Add('EV_IDENTIDAD',  Id_Entidad);
    SQLEntidadRelacion.PrimaryKey.Add('EV_IDVENDEDOR', nID_Vendedor);
    SQLEntidadRelacion.Fields.Add('EV_FECHABAJA',      exDateTime);
    SQLEntidadRelacion.Fields.Add('EV_USUBAJA',        Sesion.UserID);

    //Doy de baja la relacion de la entidad, el vendedor y el concepto del vendedor '0'
    SQLEntVendConcepto.SqlType := stUpdate;
    SQLEntVendConcepto.PrimaryKey.Add('VC_IDENTIDADVEND',  nID_EntVendedor);
    SQLEntVendConcepto.Fields.Add('VC_FECHABAJA',          exDateTime);
    SQLEntVendConcepto.Fields.Add('VC_USUBAJA',            Sesion.UserID);
  end
  else
  begin
    if Accion = maAlta then
    begin
      //Doy de alta el vendedor cero y su correspondiente entidad-relacion
      //Primer el vendedor
      SQLVendedorCero.SqlType := stInsert;
      SQLVendedorCero.PrimaryKey.Add('VE_ID', nID_Vendedor);

      SQLVendedorCero.Fields.Add('VE_USUALTA',   Sesion.UserID);
      SQLVendedorCero.Fields.Add('VE_FECHAALTA', exDateTime);

      //Ingreso los datos en XEV_ENTIDADVENDEDOR
      SQLEntidadRelacion.SqlType := stInsert;
      IdXEV := GetSecNextVal('SEQ_XEV_ID');
      SQLEntidadRelacion.PrimaryKey.Add('EV_ID',                  IdXEV);

      SQLEntidadRelacion.Fields.Add('EV_IDENTIDAD',               Id_Entidad);
      SQLEntidadRelacion.Fields.Add('EV_IDVENDEDOR',              nID_Vendedor);
      SQLEntidadRelacion.Fields.Add('EV_FECHAALTA',               exDateTime);
      SQLEntidadRelacion.Fields.Add('EV_USUALTA',                 Sesion.UserID);

      //Ingreso los datos en XVC_ENTVENDCONCEPTO
      SQLEntVendConcepto.SqlType := stInsert;
      SQLEntVendConcepto.PrimaryKey.AddExpression('VC_ID',        'SEQ_XVC_ID.NEXTVAL');

      SQLEntVendConcepto.Fields.Add('VC_IDENTIDADVEND',           IdXEV);
      SQLEntVendConcepto.Fields.Add('VC_IDCONCEPTO',              1);
      SQLEntVendConcepto.Fields.AddExtended('VC_PORCPRIVADO',     edEN_PORCCOMISIONVEND.Value, ALL_DECIMALS, False);
      SQLEntVendConcepto.Fields.AddExtended('VC_PORCPUBLICO',     edEN_PORCCOMISIONVENDPUB.Value, ALL_DECIMALS, False);
      SQLEntVendConcepto.Fields.Add('VC_FECHAALTA',               exDateTime);
      SQLEntVendConcepto.Fields.Add('VC_USUALTA',                 Sesion.UserID);
    end;

    if Accion = maModificacion then
    begin
      //Actualizo los datos del vendedor '0'
      SQLVendedorCero.SqlType := stUpdate;
      SQLVendedorCero.PrimaryKey.Add('VE_ID',     nID_Vendedor);
      SQLVendedorCero.Fields.Add('VE_FECHAMODIF', exDateTime);
      SQLVendedorCero.Fields.Add('VE_USUMODIF',   Sesion.UserID);
    end;

    //Empiezo con los campos
    SQLVendedorCero.Fields.Add('VE_VENDEDOR', '0');  //Indica que la empresa es vendedor
    SQLVendedorCero.Fields.Add('VE_CUIT',     edEN_CUIT.Text);
    SQLVendedorCero.Fields.Add('VE_NOMBRE',   edEN_NOMBRE.Text);

    with fraDomicilio do
    begin
      SQLVendedorCero.Fields.Add('VE_CPOSTAL',   CodigoPostal);
      SQLVendedorCero.Fields.Add('VE_CALLE',     Calle);
      SQLVendedorCero.Fields.Add('VE_LOCALIDAD', Localidad);
      SQLVendedorCero.Fields.Add('VE_PROVINCIA', ValorSqlInteger('SELECT PV_CODIGO' +
                                                                  ' FROM CPV_PROVINCIAS' +
                                                                 ' WHERE PV_DESCRIPCION = ' + SqlValue(Provincia), 0), False);
      SQLVendedorCero.Fields.Add('VE_NUMERO',       Numero);
      SQLVendedorCero.Fields.Add('VE_PISO',         Piso);
      SQLVendedorCero.Fields.Add('VE_DEPARTAMENTO', Departamento);
      SQLVendedorCero.Fields.Add('VE_CPOSTALA',     CPA);
    end;

    SQLVendedorCero.Fields.Add('VE_CODAREATELEFONOS', edEN_CODAREATELEFONOS.Text);
    SQLVendedorCero.Fields.Add('VE_TELEFONOS',        edEN_TELEFONOS.Text);
    SQLVendedorCero.Fields.Add('VE_CODAREAFAX',       edEN_CODAREAFAX.Text);
    SQLVendedorCero.Fields.Add('VE_FAX',              edEN_FAX.Text);
    SQLVendedorCero.Fields.Add('VE_MATRICULA',        edEN_MATRICULA.Text);

    if rbEN_INGRESOSBRUTOSNo.Checked then
      SQLVendedorCero.Fields.Add('VE_INGRESOSBRUTOS', False)
    else
      SQLVendedorCero.Fields.Add('VE_INGRESOSBRUTOS', True);

    if rbEN_CONVENIONo.Checked then
      SQLVendedorCero.Fields.Add('VE_CONVENIO', False)
    else
      SQLVendedorCero.Fields.Add('VE_CONVENIO', True);

    SQLVendedorCero.Fields.Add('VE_SITIVA',       fraSituacionIVA.Value);

    SQLVendedorCero.Fields.Add('VE_GANANCIAS',    fraEN_GANANCIAS.Value);
    SQLVendedorCero.Fields.Add('VE_NUMINGBRUTOS', edEN_NUMINGBRUTOS.Text);
    SQLVendedorCero.Fields.Add('VE_OBRASOCIAL',   fraEN_OBRASOCIAL.Value);
    SQLVendedorCero.Fields.Add('VE_NUMOSOCIAL',   edEN_NUMOSOCIAL.Text);
    SQLVendedorCero.Fields.Add('VE_BENEFICIARIO', edEN_BENEFICIARIO.Text);
    SQLVendedorCero.Fields.Add('VE_IDDELEGACION', fraEN_IDDELEGACION.Value);
  end;
end;

function TfrmManEntidad.PoseeVendedorCero( Id_Entidad: integer ): boolean;
var
  sSql:string;
begin
  sSql := 'SELECT VE_ID ' +
          '  FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR ' +
          '     WHERE EV_IDVENDEDOR=VE_ID' +
          '           AND EV_IDENTIDAD=' + IntToStr( Id_Entidad )  +
          '           AND EV_FECHABAJA is null ' +
          '           AND VE_VENDEDOR=''0''';

  Result := ExisteSql( sSql );
end;

procedure TfrmManEntidad.GetIdEntVendedorCero(Id_Entidad: integer; var Id_Vendedor, Id_EntVendedor: Integer);
var
  sSql:string;
  SqlResults: TStringList;
begin
  sSql := 'SELECT VE_ID, EV_ID ' +
          '  FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR ' +
          '     WHERE EV_IDVENDEDOR=VE_ID' +
          '           AND EV_IDENTIDAD=' + IntToStr( Id_Entidad )  +
          '           AND EV_FECHABAJA IS NULL ' +
          '           AND VE_FECHABAJA IS NULL ' +
          '           AND VE_VENDEDOR=''0''';

  SqlResults := ValoresColSql(sSql);
  try
    Id_Vendedor    := StrToInt(NVL(SqlResults[0], '-1'));
    Id_EntVendedor := StrToInt(NVL(SqlResults[1], '-1'));
  finally
    SqlResults.Free;
  end;
end;

function TfrmManEntidad.PoseeVendedoresReales(Id_Entidad: integer): boolean;
var
  sSql:string;
begin
  sSql := 'SELECT VE_ID ' +
          '  FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR ' +
          '     WHERE EV_IDVENDEDOR=VE_ID' +
          '           AND EV_IDENTIDAD=' + IntToStr( Id_Entidad )  +
          '           AND EV_FECHABAJA is null ' +
          '           AND VE_FECHABAJA is null ' +
          '           AND VE_VENDEDOR<>''0''';

  Result := ExisteSql( sSql );
end;

function TfrmManEntidad.PoseeContratosAsociados(Id_Entidad: integer): boolean;
var
  sSql:string;
begin
  sSql := 'SELECT 1 ' +
          '  FROM AVC_VENDEDORCONTRATO, XEV_ENTIDADVENDEDOR ' +
          ' WHERE EV_ID = VC_IDENTIDADVEND' +
          '   AND EV_IDENTIDAD = ' + IntToStr( Id_Entidad );

  Result := ExisteSql( sSql );
end;

procedure TfrmManEntidad.tbModificarClick(Sender: TObject);
var
  sEjecutivo: String;
begin
  if not IsBaja then
    begin
      sEjecutivo := Get_Ejecutivo(sdqConsulta.FieldByName('EN_ID').AsInteger);
      Verificar(IsEmptyString(sEjecutivo), nil, 'La entidad no tiene asignado ejecutivo.');

      inherited;
    end;
end;

procedure TfrmManEntidad.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  sdqConsulta.FieldByName('EN_CUIT').EditMask := EMSK_CUIT; {By Fede}
  TDateTimeField(sdqConsulta.FieldByName('EN_FECHAALTA')).DisplayFormat := 'dd/mm/yyyy';
end;

procedure TfrmManEntidad.edEN_COMISIONVENDChange(Sender: TObject);
begin
  if ( edEN_PORCCOMISIONVEND.Text <> '' ) then
    if edEN_PORCCOMISIONVEND.Value > edEN_PORCCOMISIONVEND.MaxValue then {By Fede}
    begin
      MessageDlg('La comisión del sector privado no puede ser mayor de 100.', mtError, [mbOK], 0);
      edEN_PORCCOMISIONVEND.Value := 0;
      edEN_PORCCOMISIONVEND.SelectAll;
    end;
end;

procedure TfrmManEntidad.edEN_COMISIONENTChange(Sender: TObject);
begin
  if ( edEN_PORCCOMISIONENT.Text <> '' ) then
    if edEN_PORCCOMISIONENT.Value > edEN_PORCCOMISIONENT.MaxValue then {By Fede}
    begin
      MessageDlg('La comisión no puede ser mayor de 100.', mtError, [mbOK], 0);
      edEN_PORCCOMISIONENT.Value := 0;
      edEN_PORCCOMISIONENT.SelectAll;
    end;
end;

function TfrmManEntidad.EsNombreEntidadUnico(aNombre: string): boolean;
var
  sSql:string;
begin
  if modoABM = maAlta then
    sSql := 'SELECT EN_NOMBRE ' +
              'FROM XEN_ENTIDAD ' +
             'WHERE EN_FECHABAJA IS NULL ' +
               'AND EN_NOMBRE = ' + SqlValue(aNombre)
  else
    sSql := 'SELECT EN_NOMBRE ' +
              'FROM XEN_ENTIDAD ' +
             'WHERE EN_NOMBRE = ' + SqlValue(aNombre) + ' ' +
               'AND EN_FECHABAJA IS NULL ' +
               'AND EN_ID <> ' + sdqConsulta.FieldByName('EN_ID').AsString;

  result := not ExisteSql( sSql );
end;

procedure TfrmManEntidad.fpAbmBeforeShow(Sender: TObject);
begin
  pgCtrlEntidad.ActivePageIndex := PAGE_DATOSGENERALES;

  if ModoABM = maAlta then
    LockControl(fraEN_GANANCIAS, False);

  VCLExtra.LockControl(edEN_FECHAALTA, True);

  if ModoABM = maAlta then
  begin
    edEN_FECHAALTA.Date := DBDate;
    rbEN_INGRESOSBRUTOSSi.Checked := True
  end;
end;

procedure TfrmManEntidad.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEntidadDesde.Clear;
  fraEntidadHAsta.Clear;
  edEN_FECHAALTADesde.Clear;
  edEN_FECHAALTAHasta.Clear;
  fraEjecutivoEnt.Clear;
  fraCanalEnt.Clear;
  chkSoloActivos.Checked    := True;
  chkEntidadTramite.Checked := False;
end;

(*procedure TfrmManEntidad.ControlaVigencia;
var
  IDEntidad, IDEntidadVendedor, sSql : string;
  ExisteLiquidacion : boolean;

begin
  IDEntidad := sdqConsulta.FieldByName('EN_ID').AsString;
  IDEntidadVendedor := ValorSql ('SELECT EV_ID ' +
                                 ' FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR ' +
                                 ' WHERE VE_VENDEDOR = ''0'' ' +
                                 ' AND EV_IDENTIDAD = ' + IDEntidad +
                                 ' AND EV_FECHABAJA IS NULL');

  ExisteLiquidacion := ExisteSql ('SELECT 1 FROM XLC_LIQCOMISION WHERE LC_IDENTIDAD = ' + IDEntidad);
  if ExisteLiquidacion then
  begin
    if MsgAsk('¿Desea cerrar la vigencia e ingresar la fecha de cierre del último' + CRLF + 'período de cobertura de los vendedores asociados?') and (fpCerrarVigencia.ShowModal = mrOK) then
      sSql := 'UPDATE AVC_VENDEDORCONTRATO '+
              ' SET VC_VIGENCIAHASTA = ''' + StringReplace(edCerrarVigencia.Text, '/', '', []) + ''',' +
              ' VC_FECHACIERRE = SYSDATE, '+
              ' VC_USUCIERRE = ''' + Sesion.UserID + '''' +
              ' WHERE VC_IDENTIDADVEND = ''' + IDEntidadVendedor + '''' +
              ' AND VC_VIGENCIAHASTA IS NULL'
    else
      Abort;
  end
  else
  begin
    sSql := 'UPDATE AVC_VENDEDORCONTRATO '+
            ' SET VC_FECHABAJA = SYSDATE, '+
            ' VC_USUBAJA = ''' + Sesion.UserID + '''' +
            ' WHERE VC_IDENTIDADVEND = ''' + IDEntidadVendedor + '''';
  end;

  EjecutarSql ( sSql );

  with TqrEmpresasSinVendedor.Create(Self) do
  try
    if Prepare(IDEntidadVendedor) then
      PreviewModal;
  finally
    Free;
  end;
end; *)

procedure TfrmManEntidad.fpCerrarVigenciaBeforeShow(Sender: TObject);
begin
  edCerrarVigencia.Periodo.SetPeriodoFromDate(Date); //Fecha Actual
end;

procedure TfrmManEntidad.rbEN_INGRESOSBRUTOSSiClick(Sender: TObject);
begin
  VCLExtra.LockControls(GroupBox7, False);
  VCLExtra.LockControls(GroupBox2, False);
end;

procedure TfrmManEntidad.rbEN_INGRESOSBRUTOSNoClick(Sender: TObject);
begin
  VCLExtra.LockControls(GroupBox7, True);
  VCLExtra.LockControls(GroupBox2, True);
end;

procedure TfrmManEntidad.tbExencionClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Eof or (not sdqConsulta.Active), Grid, 'Debe elegir un registro.');
  Verificar(AreIn(sdqConsulta.FieldByName('EN_MODOLIQ').AsString, ['02', '06']), Grid, 'Esta entidad tiene vendedores. La actualización debe hacerse desde el Mantenimiento de Vendedores.');

  frmExencionIB.Free;
  frmExencionIB := TfrmExencionIB.Create(Self);
  frmExencionIB.DoCargarDatos(sdqConsulta.FieldByName('EN_ID').AsInteger, 'E');
end;

function TfrmManEntidad.GetNextEntidadReferencia: TTableId;
var
  sSql: string;
  ProxNum: TTableId;
begin
  sSql := 'SELECT X1.EN_CODBANCO + 1' +
          '  FROM XEN_ENTIDAD X1' +
          ' WHERE ' + iif(chkEN_ENTRAMITE.Checked, 'X1.EN_CODBANCO >= 90000', '(X1.EN_CODBANCO < 1000 OR X1.EN_CODBANCO > 10000) AND X1.EN_CODBANCO < 90000') +
          '   AND NOT EXISTS ( SELECT 1' +
          '                     FROM XEN_ENTIDAD X2' +
          '                    WHERE X2.EN_CODBANCO = X1.EN_CODBANCO + 1 )' +
          ' ORDER BY X1.EN_FECHAALTA DESC';

  try
    ProxNum := ValorSql( sSql );
  except
    if chkEN_ENTRAMITE.Checked then
      ProxNum := 90000
    else
      ProxNum := 0;
  end;

  Verificar(ProxNum = 0, edEN_CODBANCO, 'No se ha encontrado un número de Entidad de Referencia disponible.');

  Result := ProxNum;
end;

function TfrmManEntidad.EsCUITUnicaEntidad(Cuit: string): boolean;
var
  sSql:string;
begin
  if ModoABM = maAlta then
    sSql := 'SELECT 1 ' +
            '  FROM XEN_ENTIDAD ' +
            ' WHERE EN_CUIT = ' + SqlValue(Cuit)
  else
    sSql := 'SELECT 1 ' +
            '  FROM XEN_ENTIDAD ' +
            ' WHERE EN_CUIT = ' + SqlValue(Cuit) +
            '   AND EN_ID <> ' + SqlValue(sdqConsulta.FieldByName('EN_ID').AsInteger);

  Result := not ExisteSql( sSql );
end;

function TfrmManEntidad.EsCUITUnicaVendedor(Cuit: string): boolean;
var
  sSql:string;
  ID_Entidad: integer;
begin
  //Se fija si la cuit esta activa en la tabla de vendedores
  sSql := 'SELECT 1 ' +
            'FROM XVE_VENDEDOR ' +
           'WHERE VE_CUIT = :CUIT ' +
             'AND NOT EXISTS ( SELECT 1 ' +
                                'FROM XEV_ENTIDADVENDEDOR ' +
                               'WHERE VE_ID = EV_IDVENDEDOR ' +
                                 'AND EV_IDENTIDAD = :ENTIDAD )';
  if ModoABM = maModificacion then
    ID_Entidad := StrToInt(edEN_ID.Text)
  else
    ID_Entidad := -1;
  Result := not ExisteSqlEx(sSql, [Cuit, ID_Entidad]);
end;

procedure TfrmManEntidad.chkEN_ENTRAMITEClick(Sender: TObject);
begin
  inherited;

  edEN_CODBANCO.Value := GetNextEntidadReferencia;
end;

procedure TfrmManEntidad.edEN_PORCCOMISIONVENDPUBChange(Sender: TObject);
begin
  if ( edEN_PORCCOMISIONVENDPUB.Text <> '' ) then
    if edEN_PORCCOMISIONVENDPUB.Value > edEN_PORCCOMISIONVENDPUB.MaxValue then {By Fede}
    begin
      MessageDlg('La comisión del sector público no puede ser mayor de 100.', mtError, [mbOK], 0);
      edEN_PORCCOMISIONVENDPUB.Value := 0;
      edEN_PORCCOMISIONVENDPUB.SelectAll;
    end;
end;

procedure TfrmManEntidad.tbGranOrganizadorClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Eof or (not sdqConsulta.Active), Grid, 'Debe elegir un registro.');
  frmManEntidadGranOrganizador := TfrmManEntidadGranOrganizador.Create(Self);
  with frmManEntidadGranOrganizador do
  try
    ModoStandalone := False;
    IDEntidad      := Self.sdqConsulta.FieldByName('EN_ID').AsInteger;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmManEntidad.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.Eof or not sdqConsulta.Active, Grid, 'Debe elegir un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, Grid, 'La entidad ya ha sido aprobada.');
  Verificar(not sdqConsulta.FieldByName('EN_FECHABAJA').IsNull, Grid, 'La entidad se encuentra dada de baja.');

  if MsgBox('¿Está seguro que desea aprobar?', MB_YESNO + MB_ICONQUESTION ) = mrYes then
    begin
      sSql := 'UPDATE XEN_ENTIDAD ' +
                 'SET EN_APROBADO = ''S'', ' +
                     'EN_USUAPROBADO = :UsuAprobado, ' +
                     'EN_FECHAAPROBADO = SYSDATE ' +
               'WHERE EN_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('EN_ID').AsInteger]);

      MsgBox('Entidad aprobada correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

procedure TfrmManEntidad.fraSituacionIVAChange(Sender: TObject);
begin
  if fraSituacionIVA.Codigo = '4' then         // Monotributista
    begin
      fraEN_GANANCIAS.Value := '99';           // No Retiene
      LockControl(fraEN_GANANCIAS, True);
    end
  else if fraSituacionIVA.Codigo = '5' then    // R.Inscripto Factura M
    begin
      fraEN_GANANCIAS.Value := '17';           // Factura M
      LockControl(fraEN_GANANCIAS, True);
    end
  else
    LockControl(fraEN_GANANCIAS,False);
end;

procedure TfrmManEntidad.tbEjecutivoCuentaClick(Sender: TObject);
var
  sEjecutivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay seleccionada ninguna entidad.');

  sEjecutivo := Get_Ejecutivo(sdqConsulta.FieldByName('EN_ID').AsInteger);
  Verificar(not IsEmptyString(sEjecutivo) and not Sesion.DependeDe(sEjecutivo), nil, 'Solo el ejecutivo asignado o su responsable pueden modificar este registro.');

  if fpEjecutivoCuenta.ShowModal = mrOk then
    tbRefrescarClick(nil);
end;

procedure TfrmManEntidad.btnAceptarEjCuentaClick(Sender: TObject);
begin
  inherited;

  with TSql.Create('XEN_ENTIDAD') do
    try
      SqlType   := stUpdate;

      PrimaryKey.Add('EN_ID', sdqConsulta.FieldByName('EN_ID').AsInteger, False);
      Fields.Add('EN_IDEJECUTIVO', fraEjecutivo.Value, True);

      EjecutarSql(Sql);

      fpEjecutivoCuenta.ModalResult := mrOk;
    finally
      free;
    end;
end;

procedure TfrmManEntidad.fraEjecutivoEnter(Sender: TObject);
begin
  fraEjecutivo.Value := sdqConsulta.FieldByName('EC_ID').AsInteger;
end;

procedure TfrmManEntidad.DoReactivarEntidad;
var
  nID_Entidad: TTableId;
begin
  Sql.Clear;

  nID_Entidad := sdqConsulta.FieldByName('EN_ID').AsInteger;

  Sql.PrimaryKey.Add('EN_ID',     nID_Entidad);
  Sql.Fields.Add('EN_FECHABAJA',  exNull);
  Sql.Fields.Add('EN_USUBAJA',    exNull);
  Sql.Fields.Add('EN_FECHAMODIF', exDateTime);
  Sql.Fields.Add('EN_USUMODIF',   Sesion.UserId);
  Sql.SqlType := stUpdate;

  EjecutarSql(Sql.Sql);
end;

procedure TfrmManEntidad.tbReactivarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'Debe seleccionar un registro.');
  Verificar(not IsBaja, Grid, 'La entidad no se encuentra dada de baja.');

  if MsgBox('¿Desea reactivar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      DoReactivarEntidad;
      sdqConsulta.Refresh;
    end;
end;

procedure TfrmManEntidad.fraEntidadDesdeChange(Sender: TObject);
begin
  if fraEntidadDesde.IsSelected then
    fraEntidadHasta.Value := fraEntidadDesde.Value;
end;

procedure TfrmManEntidad.EnableButtonsContacto(AEnabled: Boolean);
begin
  tbModificarContacto.Enabled := AEnabled and Seguridad.Activar(tbModificarContacto);
  tbEliminarContacto.Enabled  := AEnabled and Seguridad.Activar(tbEliminarContacto);
end;

procedure TfrmManEntidad.CheckButtonsContacto;
begin
  EnableButtonsContacto(sdqContactos.Active and not sdqContactos.IsEmpty);
end;

procedure TfrmManEntidad.DoCargarGrillaContacto(IdEntidad: TTableId);
begin
  with sdqContactos do
    begin
      Close;
      ParamByName('IdEntidad').AsInteger := IdEntidad;
      Open;
    end;
  CheckButtonsContacto;

  VCLExtra.LockControl(tsContactos, (IdEntidad = ART_EMPTY_ID));
end;

procedure TfrmManEntidad.tbNuevoContactoClick(Sender: TObject);
begin
  ModoABMContacto := maAlta;
  ClearControlsContacto;
  fpContacto.Caption := CAPTION_ALTA;
  fpContacto.ShowModal;
end;

procedure TfrmManEntidad.tbModificarContactoClick(Sender: TObject);
begin
  Verificar(IsBajaContacto, GrillaContactos, 'No se puede modificar un registro dado de baja.');

  ModoABMContacto := maModificacion;
  LoadControlsContacto;
  fpContacto.Caption := CAPTION_MODIFIC;
  fpContacto.ShowModal;
end;

procedure TfrmManEntidad.tbEliminarContactoClick(Sender: TObject);
begin
  Verificar(IsBajaContacto, GrillaContactos, 'El registro ya se encuentra dado de baja.');

  if MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      ModoABMContacto := maBaja;
      if DoABMContacto then
        begin
          if sdqContactos.Active then
            begin
              sdqContactos.Refresh;
              CheckButtonsContacto;
            end
          else
            DoCargarGrillaContacto(StrToInt(edEN_ID.Text));
        end;
    end;
end;

procedure TfrmManEntidad.ClearControlsContacto;
begin
  edMailContacto.Clear;
  edNombreContacto.Clear;
  fraCargoContacto.Clear;
  edCodAreaTelContacto.Clear;
  edTelContacto.Clear;
  edFNacimientoContacto.Clear;
  rgRespARTContacto.ItemIndex := -1;
  chkAvisoOP.Checked          := False;
end;

procedure TfrmManEntidad.LoadControlsContacto;
begin
  with sdqContactos do
    begin
      edMailContacto.Text         := FieldByName('MAIL').AsString;
      edNombreContacto.Text       := FieldByName('NOMBRE').AsString;
      fraCargoContacto.Value      := FieldByName('CODCARGO').AsString;
      edCodAreaTelContacto.Text   := FieldByName('CODAREATEL').AsString;
      edTelContacto.Text          := FieldByName('TEL').AsString;
      rgRespARTContacto.ItemIndex := Iif(FieldByName('CODRESPART').AsString = 'S', 0, 1);
      edFNacimientoContacto.Date  := FieldByName('FNACIMIENTO').AsDateTime;
      chkAvisoOP.Checked          := Iif(FieldByName('AVISOOP').AsString = 'S', True, False);
    end;
end;

procedure TfrmManEntidad.btnAceptarContactoClick(Sender: TObject);
begin
	if ValidarContacto and DoABMContacto then
    begin
      if sdqContactos.Active then
        begin
          sdqContactos.Refresh;
          CheckButtonsContacto;
        end
      else
        DoCargarGrillaContacto(StrToInt(edEN_ID.Text));

      fpContacto.ModalResult := mrOk;
    end;
end;

function TfrmManEntidad.DoABMContacto: Boolean;
var
  fId: TTableId;
begin
  with TSql.Create do
    try
      Clear;
      TableName := 'XCE_CONTACTOENTIDAD';

      if ModoABMContacto = maAlta then
        fId := GetSecNextVal('SEQ_XCE_ID')
      else
        fId := sdqContactos.FieldByName('ID').AsInteger;

      PrimaryKey.Add('CE_ID', fId, False);

      if ModoABMContacto = maBaja then
        begin
          SqlType := stUpdate;

          Fields.Add('CE_USUBAJA',            Sesion.UserID);
          Fields.Add('CE_FECHABAJA',          exDateTime);
        end
      else
        begin
          Fields.Add('CE_MAIL',               Trim(edMailContacto.Text));
          Fields.Add('CE_NOMBRE',             Trim(edNombreContacto.Text));
          Fields.Add('CE_CARGO',              fraCargoContacto.Value, True);
          Fields.Add('CE_CODAREATELEFONO',    edCodAreaTelContacto.Text);
          Fields.Add('CE_TELEFONO',           Trim(edTelContacto.Text));
          Fields.Add('CE_RESPONSABLEART',     String(Iif(rgRespARTContacto.ItemIndex = 0, 'S', 'N')));
          Fields.Add('CE_FECHANACIMIENTO',    edFNacimientoContacto.Date);
          Fields.Add('CE_AVISOOP',            String(Iif(chkAvisoOP.Checked, 'S', 'N')));

          if ModoABMContacto = maAlta then
            begin
              SqlType := stInsert;

              Fields.Add('CE_IDENTIDAD',      StrToInt(edEN_ID.Text));
              Fields.Add('CE_USUALTA',        Sesion.UserID);
              Fields.Add('CE_FECHAALTA',      exDateTime);
            end
          else
            begin
              SqlType := stUpdate;

              Fields.Add('CE_USUMODIF',       Sesion.UserID);
              Fields.Add('CE_FECHAMODIF',     exDateTime);
            end;
        end;

      try
        if dmPrincipal.sdbPrincipal.InTransaction then
          EjecutarSqlST(Sql)
        else
          EjecutarSql(Sql);

        Result := True;
      except
        on E: Exception do
          begin
            Result := False;
            ErrorMsg(E);
          end;
      end;
    finally
      Free;
    end;
end;

function TfrmManEntidad.ValidarContacto: Boolean;
begin
  Verificar(IsEmptyString(edMailContacto.Text), edMailContacto, 'Debe indicar el e-mail del contacto.');
  Verificar(not IsEMail(edMailContacto.Text), edMailContacto, 'La dirección de e-mail del contacto no es válida.');
  Verificar(IsEmptyString(edNombreContacto.Text), edNombreContacto, 'Debe indicar el nombre del contacto.');
  Verificar(rgRespARTContacto.ItemIndex = -1, rgRespARTContacto, 'Debe indicar si el contacto es o no responsable ART.');
  Verificar(edFNacimientoContacto.Date > AddYears(DBDate(), -17), edFNacimientoContacto, 'La fecha de nacimiento debe ser de hace al menos 17 años.');

  Result := True;
end;

procedure TfrmManEntidad.GrillaContactosDblClick(Sender: TObject);
begin
  if tbModificarContacto.Visible and tbModificarContacto.Enabled Then
    tbModificarContacto.Click;
end;

function TfrmManEntidad.IsBajaContacto: Boolean;
begin
  Result := sdqContactos.Active and not sdqContactos.FieldByName('FECHABAJA').IsNull;
end;

procedure TfrmManEntidad.btnAceptarClick(Sender: TObject);
begin
	if tsDatosGenerales.Enabled then
    begin
      if  Validar and DoABM then
        begin
          if (ModoABM = maAlta) and (MsgBox('¿Desea dar de alta contactos de la entidad?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
            begin
              DoCargarGrillaContacto(StrToInt(edEN_ID.Text));
              DoHabilitarSolapas(False);
              pgCtrlEntidad.ActivePage := tsContactos;
              ModoABM := maModificacion;
              ModoABMToSqlType;
            end
          else
            begin
              if sdqConsulta.Active then
                begin
                  sdqConsulta.Refresh;
                  CheckButtons;
                end
              else
                tbRefrescarClick(nil);

              fpABM.ModalResult := mrOk;
            end;
        end
    end
  else
    fpABM.ModalResult := mrOk;
end;

procedure TfrmManEntidad.DoHabilitarSolapas(Habilitar: Boolean);
begin
  VCLExtra.LockControls([tsDatosGenerales, tsComision, tsFacturacion], not Habilitar);
end;

procedure TfrmManEntidad.GrillaContactosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBajaContacto then
    AFont.Color := clRed;
end;

end.


