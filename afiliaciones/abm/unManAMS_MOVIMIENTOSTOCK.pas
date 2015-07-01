unit unManAMS_MOVIMIENTOSTOCK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtDbFrame, unFraEmpresa,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, Mask, ToolEdit,
  CurrEdit, unFraUsuario, BaseGrid, AdvGrid, unFraStaticCodigoDescripcion,
  PatternEdit, IntEdit, CustomDlgs, AnsiSql, DateComboBox, unFraEmpresaAfi,
  unFraEmpresaSolicitud, unfraEmpresaSolicitudAGENDA, unFraStaticCTB_TABLAS,
  AdvObj, RxToolEdit, RxPlacemnt;

type
  TfrmManAMS_MOVIMIENTOSTOCK = class(TfrmCustomGridABM)
    pnl1: TPanel;
    fraDeposito: TfraCodigoDescripcion;
    fraMaterial: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnl2: TPanel;
    fraDepositoDestino: TfraCodigoDescripcion;
    Label4: TLabel;
    pnl3: TPanel;
    Label5: TLabel;
    pnl4: TPanel;
    edObservaciones: TMemo;
    Label6: TLabel;
    fpABMEntrega: TFormPanel;
    Bevel1: TBevel;
    btnAceptarEntregar: TButton;
    Button2: TButton;
    Panel4: TPanel;
    lbCuit: TLabel;
    fraDepositoEntrega: TfraCodigoDescripcion;
    Label8: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    rbAlta: TRadioButton;
    rbAjuste: TRadioButton;
    rbMovimiento: TRadioButton;
    rbEntrega: TRadioButton;
    rbDevolucion: TRadioButton;
    edCantidad: TIntEdit;
    GroupBox1: TGroupBox;
    edImpresionDesde: TDateComboBox;
    Label18: TLabel;
    edImpresionHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    edCarta: TIntEdit;
    Label17: TLabel;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    fraDepositoFiltro: TfraCodigoDescripcion;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    fraMaterialFiltro: TfraCodigoDescripcion;
    GridMateriales: TAdvStringGrid;
    fraEmpresaEntrega: TfraEmpresaSolicitud;
    fraEmpresaFiltro: TfraEmpresaSolicitud;
    fraEmpresaAlta: TfraEmpresaSolicitud;
    rbEntregaInterno: TRadioButton;
    Panel8: TPanel;
    Label7: TLabel;
    fraEntregaEnMano: TfraUsuarios;
    Label9: TLabel;
    edSIC: TIntEdit;
    fraFirmante: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    fraCtbTablasCorreo: TfraStaticCTB_TABLAS;
    Label11: TLabel;
    cboxConCarta: TComboBox;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnAgregarMaterialClick(Sender: TObject);
    procedure btnCancelarMaterialClick(Sender: TObject);
    procedure fpABMEntregaShow(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
    procedure btnAceptarEntregarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure fraDepositoEntregaExit(Sender: TObject);
    procedure GridMaterialesSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure GridMaterialesExit(Sender: TObject);
    procedure fraEntregaEnManoExit(Sender: TObject);
    procedure fraCtbTablasCorreoExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraFirmanteEnter(Sender: TObject);
  private
    { Private declarations }
    FPermisoAUM : String;
    FTipoEntrega: String;
    FFirstStart : Boolean;
    function VerificarPermisos(const aIdDeposito: Integer): boolean;
    function MaterialCargado(const aIdMaterial: Integer; ZeroCantidad: boolean): boolean;
    function ValidarEntrega: boolean;
    function HayAlgunMaterialParaEntregar: boolean;
    function GetStockMaterial(const aIdMaterial, aIdDeposito: Integer): Integer;
    function GetIdMaterialAgregado(const aIdCarta, aIdMaterial: Integer): Integer;
    function TienePermisoParaAlgo: Boolean;

    procedure LoadSqlString;
    procedure InsertSecundarioMovimiento;
    procedure SetGridEntregaDescripcion;
    procedure CheckGrillaSinRegistros;
    procedure AgregarMaterial(const aIdMaterial, aCodigoMaterial, aCantidad, aStock: Integer;const aNombreMaterial: String);
    procedure EliminarEntrega;
    procedure EliminarTareaSic(const aidTareaSic : Integer);
    procedure GenerarDevolucion(const aIdCarta : Integer);
    procedure InsertarDevolucion(const aIdMaterial, aIdDeposito, aCantidad: Integer); //ver que pasa al modificar y quitar material
    procedure SetFechaBajaEntrega(const aIdCarta : Integer);
    procedure LoadControlsEntrega(const aIdCarta : Integer);
    procedure LockEntregaMaterial(const aLocked: boolean);
    procedure DarDeBajaEnModificacionEntrega(const aIdCarta: Integer);
    procedure EntregaModificacion;
    procedure EntregaAlta;
    procedure LoadListaMaterialesEntrega(const aIdDeposito: Integer);
    procedure SetControlsEntregaCliente(const EntregaCliente: boolean);
    procedure GenerarDevolucionIndividual(const aIdMovimiento : Integer);
    procedure SetBajaEntregaIndividual(const aIdMovimiento : Integer);
    procedure SetCaptionABM(Sender: TObject);
  public
    { Public declarations }
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;
var
  frmManAMS_MOVIMIENTOSTOCK: TfrmManAMS_MOVIMIENTOSTOCK;

implementation

uses unPrincipal, unDmPrincipal, SQLFuncs, unAfiGeneracionCartas, VCLExtra;

{$R *.dfm}

procedure TfrmManAMS_MOVIMIENTOSTOCK.ClearControls;
begin
  inherited;
  fraDeposito.Clear;
  fraMaterial.Clear;
  edCantidad.Value := 0;
  fraDepositoDestino.Clear;
  fraEmpresaAlta.Clear;
  edObservaciones.Clear;
  fraEmpresaEntrega.Clear;
  fraDepositoEntrega.Clear;
  GridMateriales.Clear;
  fraCtbTablasCorreo.Clear;
  fraEntregaEnMano.Clear;
  fraFirmante.Clear;
  edSIC.Clear;

  FPermisoAUM := '';
end;

function TfrmManAMS_MOVIMIENTOSTOCK.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.ams_movimientostock';

  BeginTrans;
  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('ms_id',    sdqConsulta.FieldByName('ms_id').AsInteger);
      Sql.Fields.Add('ms_fechabaja', exDateTime);
      Sql.Fields.Add('ms_usubaja',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      if ModoABM = maAlta then
      begin
        Sql.Fields.Add('ms_fechaalta',        exDateTime);
        Sql.Fields.Add('ms_usualta',          frmPrincipal.DBLogin.UserID);
        Sql.SqlType := stInsert;
      end
      else
      begin { maModificacion }
        Sql.PrimaryKey.Add('ms_id',     sdqConsulta.FieldByName('ms_id').AsInteger);
        Sql.Fields.Add('ms_fechamodif', exDateTime);
        Sql.Fields.Add('ms_usumodif',   frmPrincipal.DBLogin.UserID);
        Sql.SqlType := stUpdate;
      end;
      Sql.Fields.Add('ms_idmaterial', fraMaterial.Value);
      Sql.Fields.Add('ms_iddeposito',   fraDeposito.Value);
      if not rbMovimiento.Checked then
        Sql.Fields.Add('ms_cantidad',   edCantidad.Value) //si no es movimiento lo dejo como esta
      else
        Sql.Fields.Add('ms_cantidad',   (edCantidad.Value * -1)); //si es movimiento este cantidad debe ser negativa
                                                                //y positiva en el insert secundario del otro deposito
      Sql.Fields.Add('ms_usuario',  frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ms_fecha',   exDateTime);

      if rbAlta.Checked then
        Sql.Fields.Add('ms_motivo',   'ALTA')
      else
      if rbAjuste.Checked then
      begin
        Sql.Fields.Add('ms_motivo',   'AJUSTE');
        Sql.Fields.Add('ms_observacion',   edObservaciones.Text);
      end
      else
      if rbMovimiento.Checked then
        Sql.Fields.Add('ms_motivo',   'MOVIMIENTO')
      else
      if rbDevolucion.Checked then
      begin
        Sql.Fields.Add('ms_motivo',   'DEVOLUCION');
        Sql.Fields.Add('ms_idformulario',   fraEmpresaAlta.Value);
        Sql.Fields.Add('ms_observacion',   edObservaciones.Text);
      end
    end;

    Result := inherited DoABM;

    if (rbMovimiento.Checked) and Result then //Si es movimiento y el resultado ok insertar el material en el dep destino
      InsertSecundarioMovimiento;

    CommitTrans;
  except
    Rollback;
    Result := False;
    ShowMessage('Error al guardar datos');
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.FormCreate(Sender: TObject);
begin
  LoadSqlString;
  inherited;
  Sql.TableName := 'afi.ams_movimientostock';
  FieldBaja := 'ms_fechabaja';

  fraEmpresaAlta.ShowBajas := True;
  fraEmpresaFiltro.ShowBajas := True;

  with fraDeposito do
  begin
    TableName   := 'afi.ade_deposito';
    FieldID     := 'de_id';
    FieldCodigo := 'de_codigo';
    FieldDesc   := 'de_descripcion';
    FieldBaja   := 'de_fechabaja';
  end;

  with fraDepositoDestino do
  begin
    TableName   := 'afi.ade_deposito';
    FieldID     := 'de_id';
    FieldCodigo := 'de_codigo';
    FieldDesc   := 'de_descripcion';
    FieldBaja   := 'de_fechabaja';
  end;

  with fraDepositoFiltro do
  begin
    TableName   := 'afi.ade_deposito';
    FieldID     := 'de_id';
    FieldCodigo := 'de_codigo';
    FieldDesc   := 'de_descripcion';
    FieldBaja   := 'de_fechabaja';
  end;

  with fraDepositoEntrega do
  begin
    TableName   := 'afi.ade_deposito';
    FieldID     := 'de_id';
    FieldCodigo := 'de_codigo';
    FieldDesc   := 'de_descripcion';
    FieldBaja   := 'de_fechabaja';
  end;

  with fraMaterial do
  begin
    TableName   := 'afi.ama_material';
    FieldID     := 'ma_id';
    FieldCodigo := 'ma_codigo';
    FieldDesc   := 'ma_descripcion';
    FieldBaja   := 'ma_fechabaja';
  end;

  with fraFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;
  end;

  {with fraMaterialAgregar do
  begin
    TableName   := 'afi.ama_material';
    FieldID     := 'ma_id';
    FieldCodigo := 'ma_codigo';
    FieldDesc   := 'ma_descripcion';
    FieldBaja   := 'ma_fechabaja';
  end;   }

  with fraMaterialFiltro do
  begin
    TableName   := 'afi.ama_material';
    FieldID     := 'ma_id';
    FieldCodigo := 'ma_codigo';
    FieldDesc   := 'ma_descripcion';
    FieldBaja   := 'ma_fechabaja';
  end;

  with fraCtbTablasCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := False;
  end;

  FFirstStart := True;

  fraEmpresaEntrega.IncluirContratos := True;
  fraEmpresaEntrega.ShowBajas := True;
  fraEmpresaFiltro.IncluirContratos := True;
  fraEmpresaFiltro.ShowBajas := True;
  fraEmpresaAlta.IncluirContratos := True;
  fraEmpresaAlta.ShowBajas := True;


  SetGridEntregaDescripcion;
  GridMateriales.ColWidths[0] := 0;
  fraDepositoEntrega.ExtraCondition :=
                      ' AND (1 = (SELECT 1 ' +
                      '       FROM afi.aum_usuariomateriales' +
                      '      WHERE um_usuario = ''' + frmPrincipal.DBLogin.UserID + '''' +
                      '       AND um_entrega = ''S'' AND um_ideposito = de_id))';
  SetControlsEntregaCliente(fraEmpresaEntrega.Visible);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.LoadControls;
begin
  inherited;
  fraDeposito.Value := sdqConsulta.FieldByName('ms_iddeposito_origen').AsInteger;
  fraMaterial.Value := sdqConsulta.FieldByName('ms_idmaterial').AsInteger;
  edCantidad.Value := sdqConsulta.FieldByName('cantidad').AsInteger;
  fraDeposito.Value := sdqConsulta.FieldByName('ms_iddeposito').AsInteger;
  fraEmpresaAlta.Value := sdqConsulta.FieldByName('ms_idformulario').AsInteger;
  edObservaciones.Text := sdqConsulta.FieldByName('ms_observacion').AsString;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.LoadSqlString;
var
  sSql: String;
  sWhere: String;
begin
  //sSql :=
   { 'SELECT ms_id, ms_idmaterial, ms_fecha, ms_cantidad, ms_iddeposito, ms_usuario, ms_observacion, ms_idcarta, ms_motivo,' +
      '     ms_iddeposito_origen, ms_usuario_entrega, ms_contrato, ms_idsic, ms_usualta, ms_fechaalta,' +
      '     ms_fechamodif, ms_usumodif, ms_usubaja, ms_fechabaja,' +
      '     fi_firmante, fi_caracter, co_contrato, em_nombre, em_cuit, fi_firma, ma_descripcion, ca_fechaimpresion' +
     ' FROM afi.ams_movimientostock' +
     '  LEFT JOIN cca_carta ON ca_id = ms_idcarta' +
     '  LEFT JOIN cfi_firma ON ca_idfirma = fi_id' +
     '  LEFT JOIN aco_contrato ON ca_idformulario = co_idformulario' +
     '  LEFT JOIN aem_empresa ON co_idempresa = em_id' +
     '  LEFT JOIN afi.ama_material on ms_idmaterial = ma_id' +
     ' WHERE 1 = 1';  }

  if not fraEmpresaFiltro.IsEmpty then
    sWhere := sWhere + ' AND ms_idformulario = ' + SQLValue(fraEmpresaFiltro.Value);
  if not fraMaterialFiltro.IsEmpty then
    sWhere := sWhere + ' AND ms_idmaterial =' + SQLValue(fraMaterialFiltro.Value);
  if not fraDepositoFiltro.IsEmpty then
    sWhere := sWhere + ' AND ms_iddeposito =' + SQLValue(fraDepositoFiltro.Value);
  if not edImpresionDesde.IsEmpty then
    sWhere := sWhere + ' AND ca_fechaimpresion >= ' + SQLDate(edImpresionDesde.Date);
  if not edImpresionHasta.IsEmpty then
    sWhere := sWhere + ' AND ca_fechaimpresion <= ' + SQLDate(edImpresionHasta.Date);
  if not edCarta.IsEmpty then
    sWhere := sWhere + ' AND ms_idcarta = '+ SQLValue(edCarta.Value);
  if cboxConCarta.ItemIndex = 0 then
    sWhere := sWhere + ' AND ms_idcarta IS NOT NULL'
  else
    if cboxConCarta.ItemIndex = 1 then
      sWhere := sWhere + ' AND ms_idcarta IS NULL';



  sSQL := 'SELECT b.ms_idcarta, ms_idmaterial, null cantidad, fi_firmante, fi_caracter, ms_idformulario, '+
            '       COALESCE(em_nombre, sa_nombre) empresa, em_cuit, ca_fechaimpresion, ' +
            '       afiliacion.get_materiales_stock(b.ms_idcarta) materiales, ca_fecharecepcion, fo_formulario,' +
            '       ms_id, ms_fecha, ms_iddeposito, ms_usuario, ms_observacion, ms_motivo, ms_iddeposito_origen,' +
            '       ms_usuario_entrega,'+
            '       ms_idsic, ms_usualta, ms_fechaalta, ms_fechamodif, ms_usumodif, ms_usubaja,'+
            '       ms_fechabaja, de_descripcion, co_contrato,' +
            '       null cantparcial' +
            ' FROM (SELECT  MAX(ROWID) x ' +
            '       FROM afi.ams_movimientostock  ' +
            '      WHERE MS_IDCARTA IS NOT NULL ' +
            sWhere +
            '      GROUP BY MS_IDCARTA)a , afi.ams_movimientostock b ' +
            '       LEFT JOIN cca_carta ON ca_id = ms_idcarta ' +
            '       LEFT JOIN cfi_firma ON ca_idfirma = fi_id ' +
            '       LEFT JOIN aco_contrato ON ms_idformulario = co_idformulario ' +
            '       LEFT JOIN aem_empresa ON co_idempresa = em_id ' +
            '       LEFT JOIN afi.ama_material ON ms_idmaterial = ma_id ' +
            '       LEFT JOIN afi.ade_deposito ON ms_iddeposito = de_id ' +
            '       LEFT JOIN asa_solicitudafiliacion on ms_idformulario = sa_idformulario' +
            '       JOIN afo_formulario ON ms_idformulario = fo_id ' +
            'WHERE a.x = b.ROWID ' +
            'UNION ' +
            ' SELECT  ms1.ms_idcarta, ms1.ms_idmaterial, ms1.ms_cantidad cantidad, fi_firmante, fi_caracter, ms1.ms_idformulario,' +
            '       NULL empresa , em_cuit, ca_fechaimpresion, ' +
            '       ma_descripcion materiales, ca_fecharecepcion, fo_formulario, ' +
            '       ms1.ms_id, ms1.ms_fecha, ms1.ms_iddeposito, ms1.ms_usuario, ms1.ms_observacion, ms1.ms_motivo, ms1.ms_iddeposito_origen, '+
            '       ms1.ms_usuario_entrega,'+
            '       ms1.ms_idsic, ms1.ms_usualta, ms1.ms_fechaalta, ms1.ms_fechamodif, ms1.ms_usumodif, ms1.ms_usubaja, ms1.ms_fechabaja,' +
            '       de_descripcion, co_contrato,' +
            '       (SELECT SUM(ms.ms_cantidad)' +
            '            FROM afi.ams_movimientostock ms' +
            '          WHERE ms1.ms_idmaterial = ms.ms_idmaterial' +
            '                AND ms.ms_iddeposito = ms_iddeposito' +
            '                AND ms.ms_fechabaja IS NULL' +
            '                AND ms_id <= ms1.ms_id) cantparcial' +
            '  FROM afi.ams_movimientostock ms1 ' +
            '       LEFT JOIN cca_carta ON ca_id = ms1.ms_idcarta ' +
            '       LEFT JOIN cfi_firma ON ca_idfirma = fi_id ' +
            '       LEFT JOIN aco_contrato ON ms1.ms_idformulario = co_idformulario ' +
            '       LEFT JOIN aem_empresa ON co_idempresa = em_id ' +
            '       LEFT JOIN afi.ama_material ON ms1.ms_idmaterial = ma_id  ' +
            '       LEFT JOIN afi.ade_deposito ON ms1.ms_iddeposito = de_id ' +
            '       LEFT JOIN afo_formulario ON ms1.ms_idformulario = fo_id ' +
            'WHERE ms_idcarta IS NULL ' + sWhere;


  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.RefreshData;
begin
  if not FFirstStart then  //esto es para que noo les salga un cartel diciendo que no tienen filtros al mostrar la pantalla
  begin
    LoadSqlString;
    Verificar((fraEmpresaFiltro.IsEmpty) and
              (edImpresionDesde.IsEmpty) and
              (edImpresionHasta.IsEmpty) and
              (fraDepositoFiltro.IsEmpty) and
              (edCarta.Text = '') and
              (fraMaterialFiltro.IsEmpty) and
              ((cboxConCarta.ItemIndex = 3) or (cboxConCarta.ItemIndex = -1)), pnlFiltros, 'Por favor seleccione un filtro.');
    inherited
  end
  else
    FFirstStart :=  False;
end;

function TfrmManAMS_MOVIMIENTOSTOCK.Validar: Boolean;
begin
  Verificar(edCantidad.Value = 0, edCantidad, 'La Cantidad no puede quedar en 0');
  Verificar(fraDeposito.IsEmpty, fraDeposito, 'El Depósito no puede quedar vacío');
  Verificar(VerificarPermisos(fraDeposito.Value)= false, fraDeposito, 'No tiene permiso para realizar este movimiento en el depósito');
  Verificar(fraMaterial.IsEmpty, fraMaterial, 'El Material no puede quedar vacío');
  if (rbAlta.Checked or rbMovimiento.Checked or rbDevolucion.Checked) then
    Verificar(edCantidad.Value < 0, edCantidad, 'La Cantidad debe ser mayor a 0 para el Alta o Movimientos de materiales');

  if (rbAjuste.Checked or rbMovimiento.Checked or rbDevolucion.Checked) and (ModoABM = maAlta)then
    Verificar(Trim(edObservaciones.Text) = '', edObservaciones, 'Es necesario un texto de observación para realizar el ajuste');

  if rbMovimiento.Checked then
  begin
    Verificar(fraDepositoDestino.IsEmpty, fraDepositoDestino, 'El depósito destino esta vacío');
    Verificar(fraDepositoDestino.Value = fraDeposito.Value, fraDepositoDestino, 'El depósito destino no puede ser igual al depósito origen');
  end;

  if rbDevolucion.Checked then
    Verificar(fraEmpresaAlta.IsEmpty, fraEmpresaAlta, 'El Contrato no puede quedar vacío');

  Result := True;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.tbNuevoClick(Sender: TObject);
begin
  Verificar(not TienePermisoParaAlgo, Panel7, 'No tiene permisos para realizar esta acción');
  ModoABM := maAlta;
  ModoABMToSqlType;
  ClearControls;
  if rbEntrega.Checked or rbEntregaInterno.Checked then   //Si es entrega de materiales se abre este FormPanel
  begin
    GridMateriales.RowCount := 2;
    LockEntregaMaterial(false);
    //fpABMEntrega.Caption := 'Nueva Entrega de Materiales';
    SetCaptionABM(Sender);
    fraEmpresaEntrega.Visible := rbEntrega.Checked; //Con esto veo luego si es una entrega interna (sin formulario) o a cliente (con formulario)
    lbCuit.Visible := rbEntrega.Checked;
    fpABMEntrega.ShowModal;
    FTipoEntrega := 'ALTA';
  end
  else
  begin
    Verificar((not rbAlta.Checked) and (not rbMovimiento.Checked) and (not rbAjuste.Checked) and (not rbDevolucion.Checked), Panel7, 'Debe seleccionar un tipo de movimiento');
    //fpABM.Caption := 'Nueva Entrega de Materiales';
    SetCaptionABM(Sender);
    fpABM.ShowModal;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.fpAbmShow(Sender: TObject);
var
  sMotivo : String;
begin
  inherited;
  sMotivo := '';
  if ModoABM  = maModificacion then
    sMotivo := sdqConsulta.FieldByName('ms_motivo').AsString;

  if (rbAlta.Checked) or (sMotivo = 'ALTA') then   //solo deposito material y cantidad
  begin
    pnl1.Visible := True;
    pnl2.Visible := False;
    pnl3.Visible := False;
    pnl4.Visible := False;
    fpABM.Caption := 'Alta de Stock';
    FPermisoAUM := 'um_alta';
  end
  else
  if (rbAjuste.Checked) or (sMotivo = 'AJUSTE')  then //solo deposito material cantidad y observaciones
  begin
    pnl1.Visible := True;
    pnl2.Visible := False;
    pnl3.Visible := False;
    pnl4.Visible := True;
    fpABM.Caption := 'Ajuste de Stock';
    FPermisoAUM := 'um_ajuste';
  end
  else
  if (rbMovimiento.Checked) or (sMotivo = 'MOVIMIENTO') then //solo deposito material cantidad, observaciones y dep. destino
  begin
    pnl1.Visible := True;
    pnl2.Visible := True;
    pnl3.Visible := False;
    pnl4.Visible := True;
    fpABM.Caption := 'Movimiento de Stock';
    FPermisoAUM := 'um_movimiento';
  end
  else
  if (rbDevolucion.Checked) or (sMotivo = 'DEVOLUCION') then //solo deposito, material, cantidad, observaciones, dep. destino y contrato
  begin
    pnl1.Visible := True;
    pnl2.Visible := False;
    pnl3.Visible := True;
    pnl4.Visible := True;
    fpABM.Caption := 'Devolución de Stock';
    FPermisoAUM := 'um_devolucion';
  end;

  fraDeposito.ExtraCondition :=
                      ' AND (1 = (SELECT 1 ' +
                      '       FROM afi.aum_usuariomateriales' +
                      '      WHERE um_usuario = ''' + frmPrincipal.DBLogin.UserID + '''' +
                      '       AND '+ FPermisoAUM + '= ''S'' AND um_ideposito = de_id))';
end;

{procedure TfrmManAMS_MOVIMIENTOSTOCK.ActualizarPermisos;
var
  sSql: String;
begin
  sSql := 'SELECT um_alta, um_ajuste, um_movimiento, um_entrega, um_devolucion' +
          '  FROM afi.aum_usuariomateriales' +
          ' WHERE um_usuario =:usuario';
  with GetQueryEx(sSql, [frmPrincipal.DBLogin.UserID]) do
  try
    rbAlta.Enabled := FieldByName('um_alta').AsString = 'S';
    rbAjuste.Enabled := FieldByName('um_ajuste').AsString = 'S';
    rbMovimiento.Enabled := FieldByName('um_movimiento').AsString = 'S';
    rbEntrega.Enabled := FieldByName('um_entrega').AsString = 'S';
    rbDevolucion.Enabled := FieldByName('um_devolucion').AsString = 'S';
  finally
    Free;
  end;  }
function TfrmManAMS_MOVIMIENTOSTOCK.VerificarPermisos(const aIdDeposito: Integer): boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
          '  FROM afi.aum_usuariomateriales' +
          ' WHERE um_usuario =:usuario'+
          '  AND '+ FPermisoAUM +' = ''S''' +
          '  AND um_ideposito =:iddeposito';
  Result := ValorSqlIntegerEx(sSql, [frmPrincipal.DBLogin.UserID, aIdDeposito], 0) = 1;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.InsertSecundarioMovimiento;
var
  sSqlTrans: TSql;
begin
  sSqlTrans := TSQL.Create('afi.ams_movimientostock');

  sSqlTrans.Fields.Add('ms_fechaalta',        exDateTime);
  sSqlTrans.Fields.Add('ms_usualta',          frmPrincipal.DBLogin.UserID);
  sSqlTrans.Fields.Add('ms_usuario',  frmPrincipal.DBLogin.UserID);
  sSqlTrans.Fields.Add('ms_fecha',   exDateTime);
  sSqlTrans.Fields.Add('ms_idmaterial', fraMaterial.Value);
  sSqlTrans.Fields.Add('ms_iddeposito',   fraDepositoDestino.Value);
  sSqlTrans.Fields.Add('ms_cantidad',   edCantidad.Value);
  sSqlTrans.Fields.Add('ms_iddeposito_origen', fraDeposito.Value);
  sSqlTrans.Fields.Add('ms_motivo',   'MOVIMIENTO');

  sSqlTrans.SqlType := stInsert;
  try
    EjecutarSQLST(sSqlTrans.Sql);
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.btnAgregarClick(Sender: TObject);
begin
  inherited;
  Verificar(fraDepositoEntrega.IsEmpty, fraDepositoEntrega, 'Antes de agregar un material es necesario conocer el depósito');
 // if fpAgregarMaterial.ShowModal = MrOk then
  begin
  //
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.btnAgregarMaterialClick(
  Sender: TObject);
begin
  //Verificar(fraMaterialAgregar.IsEmpty, fraMaterialAgregar, 'Este material ya esta en la lista');
 // Verificar(edCantidadAgregar.Value <= 0, edCantidadAgregar, 'La cantidad debe ser mayor que 0');
 // Verificar(MaterialCargado(fraMaterialAgregar.Value), fraMaterialAgregar, 'Este material ya esta cargado');
  //AgregarMaterial(fraMaterialAgregar.Value, fraMaterialAgregar.VariantValue, edCantidadAgregar.Value,
                  //GetStockMaterial(fraMaterialAgregar.Value, fraDepositoEntrega.Value),
                  //fraMaterialAgregar.cmbDescripcion.Text);
  //fpAgregarMaterial.ModalResult := MrOk;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.btnCancelarMaterialClick(
  Sender: TObject);
begin
  //fpAgregarMaterial.ModalResult := MrCancel;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.fpABMEntregaShow(Sender: TObject);
begin
  inherited;
  //si esto que esta comentado se hace aca no se porque no anda la primera vez...

 { fraEmpresaEntrega.IncluirContratos := True;
  fraEmpresaEntrega.ShowBajas := True;
  fraEmpresaFiltro.IncluirContratos := True;
  fraEmpresaFiltro.ShowBajas := True;
  fraEmpresaAlta.IncluirContratos := True;
  fraEmpresaAlta.ShowBajas := True;    }

 { SetGridEntregaDescripcion;
  GridMateriales.ColWidths[0] := 0;
  fraDepositoEntrega.ExtraCondition :=
                      ' AND (1 = (SELECT 1 ' +
                      '       FROM afi.aum_usuariomateriales' +
                      '      WHERE um_usuario = ''' + frmPrincipal.DBLogin.UserID + '''' +
                      '       AND um_entrega = ''S'' AND um_ideposito = de_id))'; }

  SetControlsEntregaCliente(fraEmpresaEntrega.Visible);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.AgregarMaterial(const aIdMaterial, aCodigoMaterial,
  aCantidad, aStock: Integer; const aNombreMaterial: String);
begin
  if (not MaterialCargado(aIdMaterial, false)) then
  begin
    if (GridMateriales.RowCount = 2) and (GridMateriales.Cells[0, 1] = '') and (GridMateriales.Cells[1, 1] = '') then
    begin
      GridMateriales.RemoveRows(1, 1);
      GridMateriales.Clear;
    end;
    GridMateriales.AddRow;
    GridMateriales.Cells[0, GridMateriales.RowCount - 1] := IntToStr(aIdMaterial);
    GridMateriales.Cells[1, GridMateriales.RowCount - 1] := IntToStr(aCodigoMaterial);
    GridMateriales.Cells[2, GridMateriales.RowCount - 1] := aNombreMaterial;
    GridMateriales.Cells[4, GridMateriales.RowCount - 1] := IntToStr(aCantidad);
    GridMateriales.Cells[3, GridMateriales.RowCount - 1] := IntToStr(aStock);
    SetGridEntregaDescripcion;
  end;
end;

function TfrmManAMS_MOVIMIENTOSTOCK.MaterialCargado(
  const aIdMaterial: Integer; ZeroCantidad : boolean): boolean;
var
  aLoc: TPoint;
  aFp: TFindParams;
  bRes: Boolean;
begin
  bRes := False;

  aLoc := Point(-1, -1);
  aFp := [fnMatchRegular];

  repeat
    aLoc := GridMateriales.Find(aLoc, IntToStr(aIdMaterial), aFp);
    if not ((aLoc.X = -1) or (aLoc.Y = -1) or (aLoc.X <> 1){columna que espero}) then
    begin
      if ZeroCantidad then
      begin
        if GridMateriales.Cells[4, aLoc.Y] <> '0' then
          bRes := True
      end
      else
       bRes := True;
    end;
  until (aLoc.X = -1) or (aLoc.Y = -1);

  Result := bRes;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.SetGridEntregaDescripcion;
begin
  GridMateriales.Cells[0, 0] := 'Id.';
  GridMateriales.Cells[1, 0] := 'Cod. Mat.';
  GridMateriales.Cells[2, 0] := 'Material';
  GridMateriales.Cells[4, 0] := 'Cantidad';
  GridMateriales.Cells[3, 0] := 'Stock';
  if GridMateriales.RowCount > 1 then
    GridMateriales.FixedRows := 1;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.btnQuitarClick(Sender: TObject);
begin
  GridMateriales.RemoveSelectedRows;
  CheckGrillaSinRegistros;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.CheckGrillaSinRegistros;
begin
  if GridMateriales.RowCount = 1 then
  begin
    GridMateriales.RowCount := 2;
    GridMateriales.FixedRows := 1;
    GridMateriales.Clear;
    SetGridEntregaDescripcion;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.btnAceptarEntregarClick(Sender: TObject);
begin
  FPermisoAUM := 'um_entrega';
  if not ValidarEntrega then
    Abort;
  if ModoABM = maAlta then
    EntregaAlta
  else
    EntregaModificacion;
  //tbRefrescarClick(nil);
end;

function TfrmManAMS_MOVIMIENTOSTOCK.ValidarEntrega: boolean;
var
  sSql : String;
begin
  if fraEmpresaEntrega.Visible then
    Verificar(fraEmpresaEntrega.IsEmpty, fraEmpresaEntrega, 'Debe seleccionar una Empresa');

  Verificar(fraDepositoEntrega.IsEmpty, fraDepositoEntrega, 'Debe seleccionar un Depósito');
  Verificar(VerificarPermisos(fraDepositoEntrega.Value)= false, fraDepositoEntrega, 'No tiene permiso para realizar este movimiento en el depósito');
  Verificar(not HayAlgunMaterialParaEntregar, GridMateriales, 'No hay ningún material para entregar');

  if fraCtbTablasCorreo.IsEmpty then
    Verificar(fraEntregaEnMano.IsEmpty, fraEntregaEnMano, 'Debe seleccionar quién entrega el material');
  Verificar(fraFirmante.IsEmpty, fraFirmante, 'No hay firmante del documento');

  //Validar Tarea Sic a cerrar
  if edSic.Text <> '' then
  begin
    sSql := 'SELECT 1 FROM agenda.aat_agendatarea WHERE at_id = :id';
    Verificar(not ExisteSQlEx(sSql, [edSic.Value]), edSic, 'No se encuentra la Tarea SIC');

    sSql := 'SELECT 1 FROM agenda.aat_agendatarea WHERE at_estado = 1 AND at_id = :id';
    Verificar(not ExisteSQlEx(sSql, [edSic.Value]), edSic, 'La Tarea SIC no esta Pendiente');
  end;

  if (Panel6.Visible)then
  begin
    if (fraEntregaEnMano.IsEmpty) and (fraCtbTablasCorreo.IsEmpty) then
      Verificar(fraCtbTablasCorreo.IsEmpty, fraCtbTablasCorreo, 'Debe seleccionar un tipo de correo si no entrega en mano');

    if (not fraEntregaEnMano.IsEmpty) and (not fraCtbTablasCorreo.IsEmpty) then
      Verificar(not fraCtbTablasCorreo.IsEmpty, fraCtbTablasCorreo, 'Debe seleccionar un tipo de correo solo si no se entrega en mano');
  end;
  //fin validar sic


  Result := True;
end;

function TfrmManAMS_MOVIMIENTOSTOCK.HayAlgunMaterialParaEntregar: boolean;
begin
  Result :=  (GridMateriales.Cells[0, 1] <> '') and (GridMateriales.Cells[1, 1] <> '');
end;

function TfrmManAMS_MOVIMIENTOSTOCK.GetStockMaterial(const aIdMaterial,
  aIdDeposito: Integer): integer;
var
  sSql: String;
begin
  sSql := 'SELECT SUM(ms_cantidad) ' +
          '  FROM afi.ams_movimientostock' +
          ' WHERE ms_idmaterial =:idmaterial'+
          '  AND  ms_iddeposito =:iddeposito' +
          '  AND  ms_fechabaja IS NULL';
  Result := ValorSqlIntegerEx(sSql, [aIdMaterial, aIdDeposito], 0);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.tbModificarClick(Sender: TObject);
begin
  Verificar(not TienePermisoParaAlgo, Panel7, 'No tiene permisos para realizar esta modificación');
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    ModoABM := maModificacion;
    ModoABMToSqlType;
    if (sdqConsulta.FieldByName('ms_motivo').AsString <> 'ENTREGA') and (sdqConsulta.FieldByName('ms_motivo').AsString <> 'ENTREGA CLIENTE') then
    begin
      LoadControls;
      fpABM.Caption := 'Modificación de Entrega de Materiales';
      fpABM.ShowModal;
    end
    else
    begin
      Verificar(not sdqConsulta.FieldByName('ms_fechabaja').IsNull, tbModificar, 'Estos materiales estan dados de baja');
      FTipoEntrega := 'MOD';
      GridMateriales.Clear;
      GridMateriales.RowCount := 2;
      LoadControlsEntrega(sdqConsulta.FieldByName('ms_idcarta').AsInteger);
      fpABMEntrega.Caption := 'Modificación de Entrega de Materiales';
      fpABMEntrega.ShowModal;
    end;
    FPermisoAUM := 'um_entrega';
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.tbEliminarClick(Sender: TObject);
begin
  Verificar(not TienePermisoParaAlgo, Panel7, 'No tiene permisos para realizar esta baja');
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    ModoABM := maBaja;
    ModoABMToSqlType;
    if (sdqConsulta.FieldByName('ms_motivo').AsString <> 'ENTREGA') and (sdqConsulta.FieldByName('ms_motivo').AsString <> 'ENTREGA CLIENTE') then
    begin
      if DoABM then
      begin
    	  if sdqConsulta.Active then
     	  begin
      	  sdqConsulta.Refresh;
      	  CheckButtons;
     	  end
        else
      	  tbRefrescarClick(nil);
		  end;
    end
    else
    begin
      BeginTrans;
      try
        EliminarEntrega;
        CommitTrans;
      except
        Rollback;
      end;
    end;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  edImpresionDesde.Clear;
  edImpresionHasta.Clear;
  fraDepositoFiltro.Clear;
  fraMaterialFiltro.Clear;
  edCarta.Clear;
  cboxConCarta.ItemIndex := -1;
  inherited;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.EliminarEntrega;
var
  sSql: String;
  idTareaSic: Integer;
begin
  Verificar(not sdqConsulta.FieldByName('ca_fecharecepcion').IsNull, tbEliminar, 'La carta ya fue recepcionada, no se puede eliminar');

  sSql := 'SELECT at_id FROM agenda.aat_agendatarea WHERE at_id = :id AND at_estado = 1';
  idTareaSic := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('ms_idsic').AsInteger], -1);

  if idTareaSic > 0 then
    EliminarTareaSic(idTareaSic); //Esto cierra la tarea

  if not sdqConsulta.FieldByName('ms_idcarta').IsNull then
  begin
    GenerarDevolucion(sdqConsulta.FieldByName('ms_idcarta').AsInteger);//aca genera la devolucion de todos los materiales de esa carta
    SetFechaBajaEntrega(sdqConsulta.FieldByName('ms_idcarta').AsInteger); //set fecha de baja a todos los materiales entregados antes
  end
  else
  begin
    GenerarDevolucionIndividual(sdqConsulta.FieldByName('ms_id').AsInteger);
    SetBajaEntregaIndividual(sdqConsulta.FieldByName('ms_id').AsInteger);
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.EliminarTareaSic(
  const aidTareaSic: Integer);
var
  sSql : String;
begin
  sSql := 'UPDATE agenda.aat_agendatarea SET at_estado = 5 WHERE at_id = :id';
  EjecutarSqlSTEx(sSql,[aidTareaSic]);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.GenerarDevolucion(
  const aIdCarta: Integer);
var
  sSql : String;
begin
  sSql :=
          ' SELECT  ms_idmaterial, ms_iddeposito, ms_fecha, ms_cantidad,  ms_usuario, ms_motivo'+
            '  FROM afi.ams_movimientostock  ' +
            ' WHERE ms_idcarta = :carta';
  with GetQueryEx(sSql, [aIdCarta]) do
  while not Eof do
  begin
    InsertarDevolucion(FieldByName('ms_idmaterial').AsInteger, FieldByName('ms_iddeposito').AsInteger, FieldByName('ms_cantidad').AsInteger);
    Next;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.InsertarDevolucion(const aIdMaterial,
  aIdDeposito, aCantidad: Integer);
var
  sSql : String;
begin
  sSql := 'INSERT INTO afi.ams_movimientostock (ms_idmaterial, ms_iddeposito, ms_fecha,' +
                                              ' ms_cantidad, ms_usuario, ms_motivo, ms_usualta, ms_fechaalta)'+
                                            'VALUES '+
                                            ' (:idmaterial, :iddeposito, SYSDATE,'+
                                            '  :cantidad, :usuario, ''DEVOLUCION'', :usuario, SYSDATE)';

  EjecutarSqlSTEx(sSql,[aIdMaterial, aIdDeposito, aCantidad, frmPrincipal.DBLogin.UserID]);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.SetFechaBajaEntrega(
  const aIdCarta: Integer);
var
  sSql : String;
begin
  sSql := 'UPDATE afi.ams_movimientostock SET ms_fechabaja = SYSDATE, ms_usubaja = :usuario WHERE ms_idcarta =:carta';
  EjecutarSqlSTEx(sSql,[frmPrincipal.DBLogin.UserID, aIdCarta]);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.LoadControlsEntrega(
  const aIdCarta: Integer);
var
  sSql : String;
begin
  sSql :=
          ' SELECT  ms_idmaterial, ms_iddeposito, ms_fecha, ms_cantidad, ms_usuario, ms_motivo, ms_idformulario, ma_codigo, '+
            '       ms_usuario_entrega, ms_idsic, ma_descripcion, ma_id, ms_idfirma, ms_correo, ms_idcarta' +
            '  FROM afi.ams_movimientostock  ' +
            ' LEFT JOIN afi.ama_material ON ms_idmaterial = ma_id' +
            ' LEFT JOIN cca_carta ON ms_idcarta = ca_id' +
            ' WHERE (ms_idcarta = :carta OR ms_id =:id)' +
            '  AND ms_fechabaja IS NULL';

  with GetQueryEx(sSql, [aIdCarta, sdqConsulta.FieldByName('ms_id').AsInteger]) do
  try
    if not IsEmpty then
    begin
      fraEmpresaEntrega.Value := FieldByName('ms_idformulario').AsInteger;
      fraDepositoEntrega.Value := FieldByName('ms_iddeposito').AsInteger;
      fraEntregaEnMano.Value := FieldByName('ms_usuario_entrega').AsString;
      fraFirmante.Value := FieldByName('ms_idfirma').AsInteger;
      edSIC.Text := FieldByName('ms_idsic').AsString;
      fraCtbTablasCorreo.Value := FieldByName('ms_correo').AsString;
      SetControlsEntregaCliente(Not FieldByName('ms_idcarta').IsNull);
    end;

    while not Eof do
    begin
      AgregarMaterial(FieldByName('ms_idmaterial').AsInteger, FieldByName('ma_id').AsInteger, FieldByName('ms_cantidad').AsInteger * -1,
                  GetStockMaterial(FieldByName('ms_idmaterial').AsInteger, FieldByName('ms_iddeposito').AsInteger),
                  FieldByName('ma_descripcion').AsString);
      Next;
    end
  finally
    Free;
  end;

  LockEntregaMaterial(not sdqConsulta.FieldByName('ca_fechaimpresion').IsNull);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.LockEntregaMaterial(
  const aLocked: boolean);
begin
  LockControls([fraEmpresaEntrega, fraDepositoEntrega, fraEntregaEnMano,
               fraFirmante], aLocked);

  VCLExtra.LockControl(GridMateriales, aLocked);
  VCLExtra.LockControl(edSIC, aLocked);
  VCLExtra.LockControl(btnAceptarEntregar, aLocked);
  {btnAgregar.Enabled := not aLocked;
  btnQuitar.Enabled := not aLocked;
  btnAceptarEntregar.Enabled := not aLocked;}
end;

function TfrmManAMS_MOVIMIENTOSTOCK.GetIdMaterialAgregado(const aIdCarta,
  aIdMaterial: Integer): Integer;
var
  sSql : String;
begin
  sSql := 'SELECT ms_id FROM afi.ams_movimientostock WHERE ms_idcarta = :idcarta AND ms_idmaterial =:idmaterial AND ms_fechabaja IS NULL';
  Result := ValorSqlIntegerEx(sSql, [aIdCarta, aIdMaterial], 0);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.DarDeBajaEnModificacionEntrega(const aIdCarta: Integer);
var
  sSql : String;
begin
 sSql :=
          ' SELECT ms_id, ms_idmaterial  '+
            '  FROM afi.ams_movimientostock  ' +
            ' WHERE ms_idcarta = :carta' +
            '  AND ms_fechabaja IS NULL';
  with GetQueryEx(sSql, [aIdCarta]) do
  begin
    while not eof do
    begin
     // ShowMessage(FieldByName('ms_idmaterial').AsString + ' id ' + FieldByName('ms_id').AsString);
      if not MaterialCargado(FieldByName('ms_idmaterial').AsInteger, true) then
         EjecutarSqlSTEx('UPDATE afi.ams_movimientostock '+
                          '  SET ms_fechabaja = SYSDATE, ms_usubaja= :usuario '+
                          ' WHERE ms_id =:id', [frmPrincipal.DBLogin.UserID, FieldByName('ms_id').AsInteger]);
      Next;
    end;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.EntregaAlta;
var
  iLoop : Integer;
  aSql: TSQL;
  sInSql : String;
  iId : Integer;
  bImprimir : boolean;
begin
  sInSql := '';
  BeginTrans;
  aSql := TSQL.Create('afi.ams_movimientostock');
  try
    try
      for iLoop := 1 to GridMateriales.RowCount - 1 do
      begin
        if GridMateriales.Cells[4,iLoop] <> '0' then
        begin
          iId := ValorSqlInteger('SELECT AFI.SEQ_AMS_IDMOVSTOCK.NEXTVAL FROM DUAL', 0);
          sInSql := sInSql + IntToStr(iId) + ',';
          aSql.Fields.Add('ms_id',               iId);
          aSql.Fields.Add('ms_fechaalta',        exDateTime);
          aSql.Fields.Add('ms_usualta',          frmPrincipal.DBLogin.UserID);
          aSql.SqlType := stInsert;

          aSql.Fields.Add('ms_idmaterial', StrToint(GridMateriales.Cells[0,iLoop]));
          aSql.Fields.Add('ms_iddeposito',   fraDepositoEntrega.Value);
          aSql.Fields.Add('ms_cantidad',   StrToInt(GridMateriales.Cells[4,iLoop]) * -1); //NEGATIVOOOO
          aSql.Fields.Add('ms_usuario',  frmPrincipal.DBLogin.UserID);
          aSql.Fields.Add('ms_fecha',   exDateTime);
          if fraEmpresaEntrega.Visible then
          begin //si es entrega a cliente, va con formulario/contrato sino no.
            aSql.Fields.Add('ms_idformulario',   fraEmpresaEntrega.Value);
            aSql.Fields.Add('ms_motivo',   'ENTREGA CLIENTE')
          end
          else
            aSql.Fields.Add('ms_motivo',   'ENTREGA');


          aSql.Fields.Add('ms_usuario_entrega',  fraEntregaEnMano.Value);

          aSql.Fields.Add('ms_idfirma',   fraFirmante.Value);
          if fraCtbTablasCorreo.Visible then
            aSql.Fields.Add('ms_correo',   fraCtbTablasCorreo.Value);

          if edSic.Text <> '' then
            aSql.Fields.Add('ms_idsic',  edSic.Value);

          EjecutarSqlST(aSql.Sql);
          aSql.Clear;
        end;
      end;
      SetLength(sInSql,Length(sInSql)-1);  //borro el ,

      if fraEmpresaEntrega.Visible then
      begin
        with TfrmAfiGeneracionCartas.Create(Self) do
          try
            bImprimir := MsgAsk('¿Imprimir carta?');
            if not ExecuteEntregaMaterial(sInSql, fraEmpresaEntrega.Value, fraFirmante.Value, bImprimir) then
            begin
              Abort;
            end;
          finally
            Free;
          end;
      end;

      CommitTrans;
      ShowMessage('Movimiento de material generado correctamente.');
      fpABMEntrega.ModalResult := MrOk;
    except
      Rollback;
      ShowMessage('Error al guardar datos');
      fpABMEntrega.ModalResult := MrCancel;
    end;
  finally
    aSql.Free;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.EntregaModificacion;
var
  iLoop : Integer;
  aSql: TSQL;
  sInSql : String;
  iId : Integer;
begin
  if not ValidarEntrega then
    Abort;
  sInSql := '';
  BeginTrans;
  aSql := TSQL.Create('afi.ams_movimientostock');
  try
    try
      DarDeBajaEnModificacionEntrega(sdqConsulta.FieldByName('ms_idcarta').AsInteger);
      for iLoop := 1 to GridMateriales.RowCount - 1 do
      begin
        if GridMateriales.Cells[4,iLoop] <> '0' then
        begin
          iId := GetIdMaterialAgregado(sdqConsulta.FieldByName('ms_idcarta').AsInteger, StrToint(GridMateriales.Cells[0,iLoop]));
          if (iId = 0) then
            ModoABM := maAlta
          else
            ModoABM := maModificacion;

          if ModoABM = maAlta then
          begin
            iId := ValorSqlInteger('SELECT AFI.SEQ_AMS_IDMOVSTOCK.NEXTVAL FROM DUAL', 0);
            sInSql := sInSql + IntToStr(iId) + ',';
            aSql.Fields.Add('ms_id',               iId);
            aSql.Fields.Add('ms_fechaalta',        exDateTime);
            aSql.Fields.Add('ms_usualta',          frmPrincipal.DBLogin.UserID);
            aSql.Fields.Add('ms_idcarta',   sdqConsulta.FieldByName('ms_idcarta').AsInteger);
            aSql.SqlType := stInsert;
          end
          else
          begin { maModificacion }
            aSql.PrimaryKey.Add('ms_id',     iId);
            aSql.Fields.Add('ms_fechamodif', exDateTime);
            aSql.Fields.Add('ms_usumodif',   frmPrincipal.DBLogin.UserID);
            aSql.SqlType := stUpdate;
          end;
          aSql.Fields.Add('ms_idmaterial', StrToint(GridMateriales.Cells[0,iLoop]));
          aSql.Fields.Add('ms_iddeposito',   fraDepositoEntrega.Value);
          aSql.Fields.Add('ms_cantidad',   StrToInt(GridMateriales.Cells[4,iLoop]) * -1); //NEGATIVOOOO
          aSql.Fields.Add('ms_usuario',  frmPrincipal.DBLogin.UserID);
          aSql.Fields.Add('ms_fecha',   exDateTime);
          aSql.Fields.Add('ms_motivo',   'ENTREGA');
          if fraEmpresaEntrega.Visible then //si es entrega a cliente, va con formulario/contrato sino no.
          begin
            aSql.Fields.Add('ms_idformulario',   fraEmpresaEntrega.Value);
            aSql.Fields.Add('ms_motivo',   'ENTREGA CLIENTE');
          end
          else
            aSql.Fields.Add('ms_motivo',   'ENTREGA');


          aSql.Fields.Add('ms_usuario_entrega',  fraEntregaEnMano.Value);

          aSql.Fields.Add('ms_idfirma',   fraFirmante.Value);
          if fraCtbTablasCorreo.Visible then
            aSql.Fields.Add('ms_correo',   fraCtbTablasCorreo.Value);

          if edSic.Text <> '' then
            aSql.Fields.Add('ms_idsic',  edSic.Value);
          EjecutarSqlST(aSql.Sql);
          aSql.Clear;
        end;
      end;
      CommitTrans;
      ShowMessage('Movimiento de material generado correctamente.');
      fpABMEntrega.ModalResult := MrOk;
    except
      Rollback;
      ShowMessage('Error al guardar datos');
      fpABMEntrega.ModalResult := MrCancel;
    end;
  finally
    aSql.Free;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.LoadListaMaterialesEntrega(
  const aIdDeposito: Integer);
var
  sSql : String;
begin
  sSql :=
          ' SELECT  ma_id, ma_codigo, ma_descripcion, ' +
                    'NVL((SELECT SUM(ms_cantidad) ' +
                        '  FROM afi.ams_movimientostock ' +
                        ' WHERE ms_idmaterial = ma_id AND ms_iddeposito = :iddeposito),0) cantidad' +
            '  FROM afi.ama_material  ' +
            ' WHERE ma_fechabaja IS NULL';
  if fraEmpresaEntrega.Visible then
    sSql := sSql + ' AND ma_entregable = ''S''';
  with GetQueryEx(sSql, [aIdDeposito]) do
  begin
    while not Eof do
    begin
      AgregarMaterial(FieldByName('ma_id').AsInteger, FieldByName('ma_id').AsInteger, 0,
                        FieldByName('cantidad').AsInteger,
                        FieldByName('ma_descripcion').AsString);
      Next;
    end;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.fraDepositoEntregaExit(
  Sender: TObject);
begin
  inherited;
  fraDepositoEntrega.FrameExit(Sender);
  if not fraDepositoEntrega.IsEmpty then
    LoadListaMaterialesEntrega(fraDepositoEntrega.Value);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.GridMaterialesSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  if aCol = 4 then
    GridMateriales.Options := GridMateriales.Options + [goEditing]
  else
    GridMateriales.Options := GridMateriales.Options - [goEditing];
end;

function TfrmManAMS_MOVIMIENTOSTOCK.TienePermisoParaAlgo: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
          '  FROM afi.aum_usuariomateriales' +
          ' WHERE um_usuario =:usuario'+
          '  AND (um_entrega = ''S'' OR um_alta = ''S'' OR um_devolucion = ''S'' OR um_ajuste = ''S'' OR um_movimiento = ''S'')';
  Result := ValorSqlIntegerEx(sSql, [frmPrincipal.DBLogin.UserID], 0) = 1;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.GridMaterialesExit(Sender: TObject);
var
 Cant : Integer;
 iLoop: Integer;
begin
 for iLoop := 1 to GridMateriales.RowCount -1 do
 begin
  if GridMateriales.Cells[4, iLoop] <> '' then
    try
      Cant := StrToIntDef(GridMateriales.Cells[4, iLoop], -1);
      if Cant < 0 then
      begin
        InvalidMsg(GridMateriales, 'El valor es invalido', 'Error de Validación');
        GridMateriales.Cells[4, iLoop] := '0';
      end;
    except
      GridMateriales.Cells[4, iLoop] := '0';
    end;
 end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.SetCaptionABM(Sender: TObject);
begin
  if TToolButton(Sender).Name = 'tbNuevo' then
  begin
    if rbAlta.Checked then
      fpAbm.Caption := 'Nueva Alta de Materiales'
    else if rbMovimiento.Checked then
      fpAbm.Caption := 'Nuevo Movimiento de Materiales'
    else if rbAjuste.Checked then
      fpAbm.Caption := 'Nuevo Ajuste de Materiales'
    else if rbDevolucion.Checked then
      fpAbm.Caption := 'Nueva Devolución de Materiales'
    else if rbEntrega.Checked then
      fpAbmEntrega.Caption := 'Nueva Entrega de Materiales a Clientes'
    else if rbEntregaInterno.Checked then
      fpAbmEntrega.Caption := 'Nueva Entrega de Materiales'
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.SetControlsEntregaCliente(
  const EntregaCliente: boolean);
begin
  if not EntregaCliente then //Si es entrega al cliente
  begin
    fraEntregaEnMano.Sql := '';
    fraFirmante.Sql := '';
    Panel6.Visible := True;
    fraEmpresaEntrega.Visible := False;
  end
  else
  begin
    with fraEntregaEnMano do
    begin
      Sql :=
       'SELECT   se_usuario as ' + CD_ALIAS_ID + ', se_usuario as ' + CD_ALIAS_CODIGO + ', se_nombre as ' + CD_ALIAS_DESC + ', se_fechabaja as ' + CD_ALIAS_BAJA +
         ' FROM art.use_usuarios, art.usc_sectores' +
        ' WHERE se_sector = sc_codigo' +
          ' AND (   se_sector IN(''COME'', ''TECNICO'')' +
               ' OR sc_delegacion <> 840' +
               ' OR se_usuario IN (''JBALESTRINI'', ''MCLERICI'', ''FMFIRENZE'',  ''JISABELLA'', ''LSARTORI'')' +
               ' OR se_idsector = 33042)' +    // Sector Afiliaciones
          ' AND se_fechabaja IS NULL' +
          ' AND se_usuariogenerico = ''N''';
    end;
    fraFirmante.Sql := '';
    Panel6.Visible := False;
    fraEmpresaEntrega.Visible := True;
  end;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.GenerarDevolucionIndividual(
  const aIdMovimiento: Integer);
var
  sSql : String;
begin
  sSql :=
          ' SELECT  ms_idmaterial, ms_iddeposito, ms_fecha, ms_cantidad,  ms_usuario, ms_motivo'+
            '  FROM afi.ams_movimientostock  ' +
            ' WHERE ms_id = :idmovimiento';
  with GetQueryEx(sSql, [aIdMovimiento]) do
  if not Eof then
    InsertarDevolucion(FieldByName('ms_idmaterial').AsInteger, FieldByName('ms_iddeposito').AsInteger, FieldByName('ms_cantidad').AsInteger);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.SetBajaEntregaIndividual(
  const aIdMovimiento: Integer);
var
  sSql : String;
begin
  sSql := 'UPDATE afi.ams_movimientostock SET ms_fechabaja = SYSDATE, ms_usubaja = :usuario WHERE ms_id =:id';
  EjecutarSqlSTEx(sSql,[frmPrincipal.DBLogin.UserID, aIdMovimiento]);
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.fraEntregaEnManoExit(Sender: TObject);
begin
  inherited;
  fraEntregaEnMano.FrameExit(Sender);
  if not fraEntregaEnMano.IsEmpty then
    fraCtbTablasCorreo.Clear;
end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.fraFirmanteEnter(Sender: TObject);
begin
  fraFirmante.Sql := 'SELECT fi_id ' + CD_ALIAS_ID + ',' +
                                    ' fi_id ' + CD_ALIAS_CODIGO + ',' +
                                    ' fi_firmante ' + CD_ALIAS_DESC + ',' +
                                    ' fi_fechabaja ' + CD_ALIAS_BAJA +
                               ' FROM cfi_firma, cfa_firmantearea' +
                              ' WHERE fa_idfirmante = fi_id' +
                                ' AND fa_fechabaja IS NULL' +
                                ' AND fa_idareatexto = 132';
                                //' AND fa_idareatexto = 20';

end;

procedure TfrmManAMS_MOVIMIENTOSTOCK.fraCtbTablasCorreoExit(
  Sender: TObject);
begin
  inherited;
  fraCtbTablasCorreo.FrameExit(Sender);
  if not fraCtbTablasCorreo.IsEmpty then
    fraEntregaEnMano.Clear;
end;

end.
