unit unPresupuestos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, SinEdit, FormPanel, unfraPrestador,
  ToolEdit, DateComboBox, CurrEdit, unArt, Menus, unArtFrame, unFraCodigoDescripcion, unFraCodDesc, CheckPanel,
  unArtDBAwareFrame, unArtDbFrame, Math, unDestPapl, unUtilsArchivo, RxToolEdit,
  RxCurrEdit, RxPlacemnt;
  
type
  TfrmPresupuestos = class(TfrmCustomConsulta)
    pnlDatos: TPanel;
    lbSiniestro: TLabel;
    SinEdit: TSinEdit;
    lbTrabCUIL: TLabel;
    mskTrabCUIL: TMaskEdit;
    lbTrabNombre: TLabel;
    edRazonSocial: TEdit;
    lbAutorizacion: TLabel;
    edAutorizacion: TEdit;
    fpAltaMaterialSolicitado: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarMaterialSolic: TButton;
    btnCancelarMaterialSolic: TButton;
    fraPrestadorMatSolic: TfraPrestador;
    edMaterialSolicitado: TMemo;
    lbMaterialSolicitado: TLabel;
    fpDetallePresupuesto: TFormPanel;
    Bevel1: TBevel;
    btnAceptarDetPresupuesto: TButton;
    btnCancelarDetPresupuesto: TButton;
    fraPrestadorDet: TfraPrestador;
    edFechaPedido: TDateComboBox;
    lbMaterialSolicitadoDet: TLabel;
    edMaterialSolicitadoDet: TMemo;
    lbMaterialCotizadoDet: TLabel;
    edMaterialCotizadoDet: TMemo;
    lbFechaPedido: TLabel;
    lbVigDesde: TLabel;
    edVigDesde: TDateComboBox;
    lbVigHasta: TLabel;
    edVigHasta: TDateComboBox;
    lbFecRecepcion: TLabel;
    edFecRecepcion: TDateComboBox;
    edCotizacion: TCurrencyEdit;
    lbCotizacion: TLabel;
    tbAdjudicar: TToolButton;
    fpAdjudicacionPresupuesto: TFormPanel;
    Bevel2: TBevel;
    btnAceptarAdjudicacionPresup: TButton;
    btnCancelarAdjudicacionPresup: TButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    lbImporteAdjudicacion: TLabel;
    edImporteAdjudicacion: TCurrencyEdit;
    lbObservaciones: TLabel;
    edObservaciones: TMemo;
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirPedidodeCotizacion: TMenuItem;
    tbSeleccion: TToolButton;
    EnviarPedidodeCotizacinxmail1: TMenuItem;
    Label1: TLabel;
    fraTipoPresupA: TfraCodDesc;
    Label2: TLabel;
    dcInicioRecuperoA: TDateComboBox;
    dcVencimAlquilerA: TDateComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fraTipoPresupM: TfraCodDesc;
    dcInicioRecuperoM: TDateComboBox;
    dcVencimAlquilerM: TDateComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    fraTipoPresupP: TfraCodDesc;
    dcInicioRecuperoP: TDateComboBox;
    dcVencimAlquilerP: TDateComboBox;
    gbRecuperoA: TGroupBox;
    rbRecuperoSiA: TRadioButton;
    rbRecuperoNoA: TRadioButton;
    rbRecuperoNuloA: TRadioButton;
    gbRecuperoM: TGroupBox;
    rbRecuperoSiM: TRadioButton;
    rbRecuperoNoM: TRadioButton;
    rbRecuperoNuloM: TRadioButton;
    gbRecuperoP: TGroupBox;
    rbRecuperoSiP: TRadioButton;
    rbRecuperoNoP: TRadioButton;
    rbRecuperoNuloP: TRadioButton;
    fpEntrega: TFormPanel;
    gbEntrega: TGroupBox;
    btnAceptarEntrega: TButton;
    rbEntregaPrest: TRadioButton;
    rbEntregaTrab: TRadioButton;
    tbAuditoria: TToolButton;
    Label10: TLabel;
    edMontoBruto: TCurrencyEdit;
    Label11: TLabel;
    edIVA: TCurrencyEdit;
    fpSucursales: TFormPanel;
    Bevel3: TBevel;
    Button2: TButton;
    dgSucursales: TRxDBGrid;
    sdqSucursales: TSDQuery;
    dsSucursales: TDataSource;
    Label13: TLabel;
    edDatosUtiles: TMemo;
    Label14: TLabel;
    btnSucursales: TButton;
    btnAceptarSuc: TButton;
    Label12: TLabel;
    chkASuc: TCheckBox;
    Bevel4: TBevel;
    edEvalArq: TMemo;
    Label15: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarMaterialSolicClick(Sender: TObject);
    procedure fpAltaMaterialSolicitadoEnter(Sender: TObject);
    procedure btnAceptarDetPresupuestoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpDetallePresupuestoEnter(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAdjudicarClick(Sender: TObject);
    procedure btnAceptarAdjudicacionPresupClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure fpAdjudicacionPresupuestoEnter(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                      var ABackground: TColor; var AAlignment: TAlignment);
    procedure mnuImprimirPedidodeCotizacionClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure OnFormShow(Sender: TObject);
    procedure tbSeleccionClick(Sender: TObject);
    procedure EnviarPedidodeCotizacinxmail1Click(Sender: TObject);
    procedure fraTipoPresupMPropiedadesChange(Sender: TObject);
    procedure fraTipoPresupPPropiedadesChange(Sender: TObject);
    procedure fraTipoPresupAPropiedadesChange(Sender: TObject);
    procedure rbRecuperoNoMClick(Sender: TObject);
    procedure rbRecuperoNoAClick(Sender: TObject);
    procedure rbRecuperoNoPClick(Sender: TObject);
    procedure rbRecuperoSiAClick(Sender: TObject);
    procedure rbRecuperoNuloAClick(Sender: TObject);
    procedure rbRecuperoNuloMClick(Sender: TObject);
    procedure rbRecuperoSiMClick(Sender: TObject);
    procedure rbRecuperoNuloPClick(Sender: TObject);
    procedure rbRecuperoSiPClick(Sender: TObject);
    procedure tbAuditoriaClick(Sender: TObject);
    procedure edIVAChange(Sender: TObject);
    procedure edMontoBrutoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraPrestadorMatSolicChange(Sender: TObject);
    procedure btnSucursalesClick(Sender: TObject);
    procedure btnAceptarSucClick(Sender: TObject);
    procedure fpSucursalesShow(Sender: TObject);
    procedure fpEntregaShow(Sender: TObject);
    procedure rbEntregaPrestEnter(Sender: TObject);
    procedure rbEntregaTrabEnter(Sender: TObject);
  private
    FAutorizacion: Integer;
    FOrden: Integer;
    FRecaida: Integer;
    FSiniestro: Integer;
    sMailSucursal: string;

    function GetEstadoAutorizacion(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer): String;
    function IsDatosValidosAdjudicacionPresupuesto: Boolean;
    function IsDatosValidosDetallePresupuesto: Boolean;
    function IsDatosValidosMaterialSolicitado: Boolean;
    function GetExistePresupuestoAdjudicado(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer): Boolean;    

    procedure DoCargarDatosDetallePresupuesto;
    procedure HabilitarDatosPresupuesto(bHabilitar: Boolean);
    procedure SetAutorizacion(const Value: Integer);
    procedure SetOrden(const Value: Integer);
    procedure SetRecaida(const Value: Integer);
    procedure SetSiniestro(const Value: Integer);
  public
    property Autorizacion: Integer read FAutorizacion write SetAutorizacion;
    property Orden: Integer        read FOrden        write SetOrden;
    property Recaida: Integer      read FRecaida      write SetRecaida;
    property Siniestro: Integer    read FSiniestro    write SetSiniestro;
  end;

function GetExistePresupuestoAuditado(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer): Boolean;

implementation

uses
  AnsiSql, unDmPrincipal, unSesion, CustomDlgs, sqlFuncs, DateTimeFuncs, VCLExtra, General, UnFirmantes,
  unRptSolicitudPresupuesto, unSeleccionarPresupuesto, ArchFuncs,
  unComunes;

{$R *.DFM}

procedure TfrmPresupuestos.SetSiniestro(const Value: Integer);
begin
  if FSiniestro <> Value then
    FSiniestro := Value;
end;

procedure TfrmPresupuestos.SetOrden(const Value: Integer);
begin
  if FOrden <> Value then
    FOrden := Value;
end;

procedure TfrmPresupuestos.SetRecaida(const Value: Integer);
begin
  if FRecaida <> Value then
    FRecaida := Value;
end;

procedure TfrmPresupuestos.SetAutorizacion(const Value: Integer);
begin
  if FAutorizacion <> Value then
    FAutorizacion := Value;
end;

procedure TfrmPresupuestos.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT sp_nropedido nro_pedido, sp_presupuesto presupuesto, sp_fechabaja, ca_descripcion prestador, pa_id,' +
          ' nvl(pa_materialcoti, pa_materialsoli) material, trunc(pa_fechaalta) fec_pedido,' +
          ' pa_fecharecepcion fec_recepcion, pa_usurecepcion, pa_cotizacion cotizacion, sp_observaciones observaciones,' +
          ' sp_adjudicado adjudicado, sp_valor_adju valor_adjudicacion, pa_prestador, pa_materialsoli mat_soli,' +
          ' pa_materialcoti mat_coti, pa_vigenciadesde vig_desde, pa_vigenciahasta vig_hasta, ' +
          ' nvl(pa_fechaimpresion, pa_fechamail) pa_fechaimpresion, pa_tipo, sp_recupero, sp_iniciorecupero, sp_vencimiento, tp_descripcion tipopresup,' +
          ' sp_fechaauditoria, pa_montobruto, pa_iva, NVL(pa_usuimpresion, pa_usumail) pa_usuimpresion, sp_fechaadju, sp_usuadju, ' +
          ' ca_identificador, pa_evaluacionarq ' +
     ' FROM cpr_prestador, AMED.MPA_PRESUPUESTOAUTORIZACION, AMED.MSP_SINIESTROPRESUP, amed.mtp_tipopresupuesto' +
    ' WHERE sp_siniestro = ' + SqlValue(Siniestro) +
      ' AND sp_orden = ' + SqlValue(Orden) +
      ' AND sp_recaida = ' + SqlValue(Recaida) +
      ' AND (sp_autooriginal = ' + SqlValue(Autorizacion) + ' OR sp_autoapro = ' + SqlValue(Autorizacion) + ')' +
      ' AND sp_presupuesto = pa_id' +
      ' AND pa_prestador = ca_identificador' +
      ' AND tp_id(+) = pa_tipo';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPresupuestos.tbNuevoClick(Sender: TObject);
begin
  inherited;

  if fpAltaMaterialSolicitado.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmPresupuestos.btnAceptarMaterialSolicClick(Sender: TObject);
var
  IdPresupuesto: TTableId;
begin
  if IsDatosValidosMaterialSolicitado then
  try
    BeginTrans;

    // doy de alta los datos del presupuesto solicitado
    with TSql.Create('MPA_PRESUPUESTOAUTORIZACION') do
    try
      IdPresupuesto := GetSecNextVal('SEQ_MPA_ID');
      PrimaryKey.Add('PA_ID',       IdPresupuesto);
      Fields.Add('PA_PRESTADOR',    fraPrestadorMatSolic.IDPrestador);
      Fields.Add('PA_MATERIALSOLI', edMaterialSolicitado.Text);
      Fields.Add('PA_TIPO',         fraTipoPresupA.Codigo, True);
      Fields.Add('PA_USUALTA',      Sesion.UserId);
      Fields.Add('PA_FECHAALTA',    exDateTime);
      SqlType := stInsert;
      EjecutarSqlST(Sql);
    finally
      Free;
    end;
    
    // creo la relación entre la ortopedia y el presupuesto
    with TSql.Create('MSP_SINIESTROPRESUP') do
    try
      PrimaryKey.Add('SP_NROPEDIDO',  GetSecNextVal('SEQ_MSP_ID'));
      Fields.Add('SP_SINIESTRO',      SqlInt(Siniestro));
      Fields.Add('SP_ORDEN',          SqlInt(Orden));
      Fields.Add('SP_RECAIDA',        SqlInt(Recaida));
      Fields.Add('SP_AUTOORIGINAL',   SqlInt(Autorizacion));
      Fields.Add('SP_PRESUPUESTO',    SqlInt(IdPresupuesto));
      Fields.Add('SP_VALOR_ADJU',     edImporteAdjudicacion.Value);
      Fields.Add('SP_OBSERVACIONES',  edObservaciones.Text);
      Fields.Add('SP_RECUPERO',       String(IIF(rbRecuperoNuloA.Checked, '', IIF(rbRecuperoSiA.Checked, 'S', 'N'))));
      Fields.Add('SP_INICIORECUPERO', dcInicioRecuperoA.Date);
      Fields.Add('SP_VENCIMIENTO',    dcVencimAlquilerA.Date);
      Fields.Add('SP_USUALTA',        Sesion.UserId);
      Fields.Add('SP_FECHAALTA',      exDateTime);
      SqlType := stInsert;
      EjecutarSqlST(Sql);
    finally
      Free;
    end;

    CommitTrans;
    MsgBox('El Presupuesto solicitado se cargó correctamente.', MB_OK + MB_ICONINFORMATION);
    fpAltaMaterialSolicitado.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      if InTransaction then
        RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al cargar el Presupuesto.');
    end;
  end;
end;

{ Determina si los datos ingresados de la solicitud del material son o no válidos }
function TfrmPresupuestos.IsDatosValidosMaterialSolicitado: Boolean;
begin
  Result := False;


  // prestador obligatorio
  if not fraPrestadorMatSolic.IsSelected then
    InvalidMsg(fraPrestadorMatSolic, 'Debe ingresar el prestador.')

  // material solicitado obligatorio
  else if trim(edMaterialSolicitado.Text)='' then
    InvalidMsg (edMaterialSolicitado, 'Debe ingresar el material solicitado.')

  else
    Result := True;
end;

procedure TfrmPresupuestos.fpAltaMaterialSolicitadoEnter(Sender: TObject);
begin
  inherited;

  fraPrestadorMatSolic.Clear;
  edMaterialSolicitado.Clear;
  fraTipoPresupA.Clear;
  dcInicioRecuperoA.Clear;
  dcVencimAlquilerA.Clear;
  rbRecuperoNuloA.Checked := True;
  LockControl(gbRecuperoA, True);
  LockControl(dcVencimAlquilerA, True);
end;

procedure TfrmPresupuestos.btnAceptarDetPresupuestoClick(Sender: TObject);
var
  dVigDesde: TDateTime;
  sDestinoPapel, ssql, codDigitaliz: string;
  iCantHojas: integer;
begin
  iCantHojas := 0;
  if IsDatosValidosDetallePresupuesto then
  try
    ssql := ' select PR_CODDIGITALIZPRESUP ' +
              ' from mpr_prestaciones, sau_autorizaciones ' +
             ' where au_siniestro = :sin and au_orden = :ord and au_recaida = :rec and au_numauto = :auto ' +
               ' and nvl(au_presapro, au_pressol) = pr_codigo and pr_fbaja is null';
    codDigitaliz := ValorSqlEx(ssql, [Siniestro, Orden, Recaida, Autorizacion]);
    if codDigitaliz <> '' then
    begin
      frmDestinoPapel := TfrmDestinoPapel.Create(self);
      try
        frmDestinoPapel.LblCDoc.Caption := 'Tipo de Documento: ' + codDigitaliz;
        frmDestinoPapel.Showmodal;
        sDestinoPapel := frmDestinoPapel.DestinoPapel;
        iCantHojas    := frmDestinoPapel.CantHojas;
      finally
        FreeAndNil(frmDestinoPapel);
      end;
    end;

    
    BeginTrans;

    // actualizo los datos del presupuesto
    with TSql.Create('MPA_PRESUPUESTOAUTORIZACION') do
    try
      if edVigDesde.IsEmpty then
        dVigDesde := sdqConsulta.FieldByName('FEC_PEDIDO').AsDateTime
      else
        dVigDesde := edVigDesde.Date;

      PrimaryKey.Add('PA_ID',         sdqConsulta.FieldByName('PA_ID').AsInteger);
      Fields.Add('PA_MATERIALCOTI',   Nvl(trim(edMaterialCotizadoDet.Text), edMaterialSolicitadoDet.Text));
      Fields.Add('PA_VIGENCIADESDE',  dVigDesde);
      Fields.Add('PA_VIGENCIAHASTA',  edVigHasta.Date);
      Fields.Add('PA_COTIZACION',     edCotizacion.Value);
      Fields.Add('PA_FECHARECEPCION', edFecRecepcion.Date);
      Fields.Add('PA_USURECEPCION',   Sesion.UserID);
      Fields.Add('PA_TIPO',           fraTipoPresupM.Codigo, True);
      Fields.Add('PA_USUMODIF',       Sesion.UserId);
      Fields.Add('PA_FECHAMODIF',     exDateTime);
      Fields.Add('PA_MONTOBRUTO',     edMontoBruto.Value);
      Fields.Add('PA_IVA',            edIVA.Value);
      Fields.Add('PA_EVALUACIONARQ',  Trim(edEvalArq.Text));

      SqlType := stUpdate;
      EjecutarSqlST(Sql);
    finally
      Free;
    end;

    // actualizo los datos del detalle presupuesto
    with TSql.Create('MSP_SINIESTROPRESUP') do
    try
      PrimaryKey.Add('SP_NROPEDIDO',  sdqConsulta.FieldByName('NRO_PEDIDO').AsInteger);
      Fields.Add('SP_RECUPERO',       String(IIF(rbRecuperoNuloM.Checked, '', IIF(rbRecuperoSiM.Checked, 'S', 'N'))));
      Fields.Add('SP_INICIORECUPERO', dcInicioRecuperoM.Date);
      Fields.Add('SP_VENCIMIENTO',    dcVencimAlquilerM.Date);
      Fields.Add('SP_USUMODIF',       Sesion.UserId);
      Fields.Add('SP_FECHAMODIF',     exDateTime);
      SqlType := stUpdate;
      EjecutarSqlST(Sql);
    finally
      Free;
    end;

    if codDigitaliz <> '' then
      if not (sDestinoPapel = '') and (sDestinoPapel <> DP_SINPAPEL) then
        Do_Actualizar_Archivo_Sin(false, Get_IdExpediente(Siniestro, Orden, Recaida), sDestinoPapel, iCantHojas, Sesion.LoginName, codDigitaliz, 0, 'A');

    CommitTrans;
    MsgBox('El detalle del presupuesto se grabó correctamente.', MB_OK + MB_ICONINFORMATION);
    fpDetallePresupuesto.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      if InTransaction then
        Rollback;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el detalle del presupuesto.');
    end;
  end;
end;

{ Determina si los datos ingresados del detalle del presupuesto son o no válidos }
function TfrmPresupuestos.IsDatosValidosDetallePresupuesto: Boolean;
begin
  Result := False;

  // vigencia hasta obligatoria
  Verificar(edVigHasta.IsEmpty, edVigHasta, 'Debe ingresar la vigencia hasta de la cotización.');

  // vigencia hasta<=fecha actual+1 año
  Verificar((edVigHasta.Date > AddYears(DBDateTime, 1)), edVigHasta, 'La vigencia hasta debe ser menor o igual que la fecha actual más 1 año.');

  // vig. desde<=vig. hasta
  if edVigDesde.IsEmpty then
    Verificar((sdqConsulta.FieldByName('FEC_PEDIDO').AsDateTime > edVigHasta.Date), edVigHasta, 'La vigencia hasta debe ser mayor o igual que la vigencia desde (fecha de alta: ' + sdqConsulta.FieldByName('FEC_PEDIDO').AsString + ').')
  else
    Verificar((edVigDesde.Date > edVigHasta.Date), edVigDesde, 'La vigencia desde debe ser menor o igual que la vigencia hasta.');

  if edIVA.Value < 0 then
    InvalidMsg (edIVA, 'El monto de IVA no puede ser menor a 0.')

  else if edMontoBruto.Value < 0 then
    InvalidMsg (edMontoBruto, 'El monto bruto no puede ser menor a 0.')

  // cotización>0
  else if edCotizacion.Value <= 0 then
    InvalidMsg (edCotizacion, 'El monto total de cotización debe ser mayor a 0.')

  else if ((edMontoBruto.Value <> 0) or (edIVA.Value <> 0)) and (RoundTo(edMontoBruto.Value + edIVA.Value, -2) <> RoundTo(edCotizacion.Value, -2)) then      //Agregado el RoundTo porque en algunas PC's no pasaba la validación
    InvalidMsg (edCotizacion, 'La suma entre monto bruto e IVA debe coincidir con el monto total')

  // f. de recepción obligatoria
  else if edFecRecepcion.IsEmpty then
    InvalidMsg (edFecRecepcion, 'Debe ingresar la fecha de recepción.')

  // f. de recepción<=fecha actual
  else if edFecRecepcion.Date > trunc(DBDateTime) then
    InvalidMsg (edFecRecepcion, 'La fecha de recepción debe ser menor o igual que la fecha actual.')

  // f. recepción<=vig. hasta
  else if edFecRecepcion.Date > edVigHasta.Date then
    InvalidMsg (edFecRecepcion, 'La fecha de recepción debe ser menor o igual que la vigencia hasta.')

  else
    Result := True;
end;

{ Habilita/deshabilita los campos editables del presupuesto }
procedure TfrmPresupuestos.HabilitarDatosPresupuesto(bHabilitar: Boolean);
var
  bDeshabilitar: Boolean;
begin
  bDeshabilitar := not bHabilitar;
  LockControl(edMaterialCotizadoDet, bDeshabilitar);
  LockControl(edEvalArq, bDeshabilitar);
  LockControl(edVigDesde, bDeshabilitar);
  LockControl(edVigHasta, bDeshabilitar);
  LockControl(edCotizacion, bDeshabilitar);
  LockControl(edMontoBruto, bDeshabilitar);
  LockControl(edIVA, bDeshabilitar);
  LockControl(edFecRecepcion, bDeshabilitar);
  LockControl(btnAceptarDetPresupuesto, bDeshabilitar);
  LockControl(fraTipoPresupM, bDeshabilitar);
  LockControl(dcInicioRecuperoM, bDeshabilitar);
  LockControl(dcVencimAlquilerM, bDeshabilitar or fraTipoPresupM.IsEmpty or
                                (fraTipoPresupM.sdqDatos.FieldByName('TP_EXIGEVENCIMIENTO').AsString <> 'S'));
  LockControl(gbRecuperoM, bDeshabilitar or fraTipoPresupM.IsEmpty or
                          (fraTipoPresupM.sdqDatos.FieldByName('TP_RECUPERO').AsString <> 'S'));
end;

procedure TfrmPresupuestos.tbModificarClick(Sender: TObject);
begin
  inherited;
  
  if sdqConsulta.FieldByName('SP_FECHABAJA').IsNull then
  begin
    if fpDetallePresupuesto.ShowModal = mrOk then
      sdqConsulta.Refresh;
  end
  else
    MsgBox('El presupuesto se encuentra dado de baja.', MB_OK + MB_ICONWARNING);
end;

procedure TfrmPresupuestos.fpDetallePresupuestoEnter(Sender: TObject);
begin
  inherited;
  DoCargarDatosDetallePresupuesto;
  HabilitarDatosPresupuesto(sdqConsulta.FieldByName('FEC_RECEPCION').IsNull);
end;

{ Carga los datos del presupuesto de ortepedia indicado }
procedure TfrmPresupuestos.DoCargarDatosDetallePresupuesto;
begin
  with sdqConsulta do
  begin
    fraPrestadorDet.Value         := FieldByName('PA_PRESTADOR').AsInteger;
    edFechaPedido.Date            := FieldByName('FEC_PEDIDO').AsDateTime;
    edMaterialSolicitadoDet.Text  := AdjustLineBreaks(FieldByName('MAT_SOLI').AsString);
    edMaterialCotizadoDet.Text    := AdjustLineBreaks(FieldByName('MAT_COTI').AsString);
    edEvalArq.Text                := AdjustLineBreaks(FieldByName('PA_EVALUACIONARQ').AsString);
    edVigDesde.Date               := FieldByName('VIG_DESDE').AsDateTime;
    edVigHasta.Date               := FieldByName('VIG_HASTA').AsDateTime;
    edCotizacion.Value            := FieldByName('COTIZACION').AsCurrency;
    edMontoBruto.Value            := FieldByName('PA_MONTOBRUTO').AsCurrency;
    edIVA.Value                   := FieldByName('PA_IVA').AsCurrency;
    edFecRecepcion.Date           := FieldByName('FEC_RECEPCION').AsDateTime;
    fraTipoPresupM.Codigo         := FieldByName('PA_TIPO').AsString;
    fraTipoPresupMPropiedadesChange(nil);
    dcInicioRecuperoM.Date        := FieldByName('SP_INICIORECUPERO').AsDateTime;
    dcVencimAlquilerM.Date        := FieldByName('SP_VENCIMIENTO').AsDateTime;
    rbRecuperoNuloM.Checked       := FieldByName('SP_RECUPERO').IsNull;
    rbRecuperoSiM.Checked         := (FieldByName('SP_RECUPERO').AsString = 'S');
    rbRecuperoNoM.Checked         := (FieldByName('SP_RECUPERO').AsString = 'N');
  end;
end;

procedure TfrmPresupuestos.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqConsulta.FieldByName('SP_FECHABAJA').IsNull then
  begin
    if MsgBox('¿ Usted está seguro que quiere dar de baja el presupuesto seleccionado ?', MB_YESNO + MB_ICONQUESTION) = IDYES then
    try
      sSql :=
        'UPDATE MSP_SINIESTROPRESUP' +
          ' SET sp_usubaja = '+ SqlValue(Sesion.UserId) + ',' +
              ' sp_fechabaja = ActualDate' +
        ' WHERE sp_nropedido = ' + SqlValue(sdqConsulta.FieldByName('NRO_PEDIDO').AsInteger);

      EjecutarSql(sSql);
      MsgBox('El presupuesto se dio de baja correctamente.', MB_OK + MB_ICONINFORMATION);
      sdqConsulta.Refresh;
    except
      on E: Exception do
        raise Exception.Create(E.Message + CRLF + 'Error al dar de baja el presupuesto.');
    end;
  end
  else
    MsgBox('El presupuesto ya se encuentra dado de baja.', MB_OK + MB_ICONWARNING);
end;

procedure TfrmPresupuestos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                          Highlight: Boolean);
begin
  inherited;

  // así lo muestra con letras en rojo
  if not sdqConsulta.FieldByName('SP_FECHABAJA').IsNull then
    AFont.Color :=  clRed;
end;

procedure TfrmPresupuestos.tbAdjudicarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, tbAdjudicar, 'No se han cargado registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('SP_FECHABAJA').IsNull, tbAdjudicar,
            'El presupuesto se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('FEC_RECEPCION').IsNull, tbAdjudicar,
            'El presupuesto aún no se ha recepcionado.');
  Verificar(GetExistePresupuestoAdjudicado(Siniestro, Orden, Recaida, Autorizacion), tbAdjudicar,
            'Ya existe un presupuesto adjudicado.');

  if fpAdjudicacionPresupuesto.ShowModal = mrOk then
    sdqConsulta.Refresh;
end;

{ Determina si existe algún presupuesto adjudicado }
function TfrmPresupuestos.GetExistePresupuestoAdjudicado(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1' +
           ' FROM MSP_SINIESTROPRESUP' +
          ' WHERE sp_siniestro = ' + SqlValue(iSiniestro) +
            ' AND sp_orden = ' + SqlValue(iOrden) +
            ' AND sp_recaida = ' + SqlValue(iRecaida) +
            ' AND (sp_autooriginal = ' + SqlValue(iAutorizacion) + ' OR sp_autoapro = ' + SqlValue(iAutorizacion) + ')' +
            ' AND sp_adjudicado = ''S''' +
            ' AND sp_fechabaja IS NULL';
  Result := ExisteSql(sSql);
end;

procedure TfrmPresupuestos.btnAceptarAdjudicacionPresupClick(Sender: TObject);
begin
  if IsDatosValidosAdjudicacionPresupuesto() then
  try
    BeginTrans;
    // actualizo los datos de la adjudicación al presupuesto

    with TSql.Create('MSP_SINIESTROPRESUP') do
    try
      PrimaryKey.Add('SP_NROPEDIDO',  sdqConsulta.FieldByName('NRO_PEDIDO').AsInteger);
      Fields.Add('SP_VALOR_ADJU',     edImporteAdjudicacion.Value);
      Fields.Add('SP_OBSERVACIONES',  edObservaciones.Text);
      Fields.Add('SP_ADJUDICADO',     'S');
      Fields.Add('SP_RECUPERO',       String(IIF(rbRecuperoNuloP.Checked, '', IIF(rbRecuperoSiP.Checked, 'S', 'N'))));
      Fields.Add('SP_INICIORECUPERO', dcInicioRecuperoP.Date);
      Fields.Add('SP_VENCIMIENTO',    dcVencimAlquilerP.Date);
      Fields.Add('SP_USUMODIF',       Sesion.UserId);
      Fields.Add('SP_FECHAMODIF',     exDateTime);
      Fields.Add('SP_FECHAADJU',      exDate);
      Fields.Add('SP_USUADJU',        Sesion.UserID);
      SqlType := stUpdate;
      EjecutarSqlST(Sql);
    finally
      Free;
    end;

    with TSql.Create('MPA_PRESUPUESTOAUTORIZACION') do
    try
      PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsInteger);
      Fields.Add('PA_TIPO',   fraTipoPresupP.Codigo, True);
      SqlType := stUpdate;
      EjecutarSqlST(Sql);
    finally
      Free;
    end;

    CommitTrans;
    MsgBox('El presupuesto se adjudicó correctamente.', MB_OK + MB_ICONINFORMATION);
    fpAdjudicacionPresupuesto.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      if InTransaction then
        Rollback;
      raise Exception.Create(E.Message + CRLF + 'Error al adjudicar al presupuesto.');
    end;
  end;
end;

procedure TfrmPresupuestos.tbSalir2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPresupuestos.fpAdjudicacionPresupuestoEnter(Sender: TObject);
begin
  inherited;

  with sdqConsulta do
  begin
    edObservaciones.Clear;
    edImporteAdjudicacion.Value := FieldByName('COTIZACION').AsCurrency;
    fraTipoPresupP.Codigo       := FieldByName('PA_TIPO').AsString;
    fraTipoPresupPPropiedadesChange(Sender);
    dcInicioRecuperoP.Date      := FieldByName('SP_INICIORECUPERO').AsDateTime;
    dcVencimAlquilerP.Date      := FieldByName('SP_VENCIMIENTO').AsDateTime;
    rbRecuperoNuloP.Checked     := FieldByName('SP_RECUPERO').IsNull;
    rbRecuperoSiP.Checked       := (FieldByName('SP_RECUPERO').AsString = 'S');
    rbRecuperoNoP.Checked       := (FieldByName('SP_RECUPERO').AsString = 'N');
  end;
end;

{ Determina si los datos ingresados de la adjudicación de la compra al presupuesto son o no válidos }
function TfrmPresupuestos.IsDatosValidosAdjudicacionPresupuesto: Boolean;
begin
  // valor adjudicado>0
  Verificar((edImporteAdjudicacion.Value <= 0), edImporteAdjudicacion, 'El valor adjudicado debe ser mayor a 0.');

  // valor adjudicado<=valor cotizado
  if Abs(edImporteAdjudicacion.Value - sdqConsulta.FieldByName('COTIZACION').AsCurrency) > ErrorPrecisionReales then
    Verificar((edImporteAdjudicacion.Value > sdqConsulta.FieldByName('COTIZACION').AsCurrency), edImporteAdjudicacion, 'El valor adjudicado debe ser menor o igual que el valor cotizado.');

  Verificar((fraTipoPresupP.IsEmpty), fraTipoPresupP, 'Debe ingresar el tipo de presupuesto.');
  Verificar(((fraTipoPresupP.Codigo = '1') and rbRecuperoNuloP.Checked), gbRecuperoP, 'Debe ingresar valor para el recupero.');
  Verificar((rbRecuperoSiP.Checked and dcInicioRecuperoP.IsEmpty), dcInicioRecuperoP, 'La fecha de inicio de recupero es obligatoria para este tipo de presupuesto.');

  Result := True;
end;

procedure TfrmPresupuestos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmPresupuestos.mnuImprimirResultadosClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT utiles.armar_siniestro(' + SqlValue(SinEdit.Siniestro) + ',' +
                                       SqlValue(SinEdit.Orden) + ',' +
                                       SqlValue(SinEdit.Recaida) + ')' +
     ' FROM DUAL';
  QueryPrint.SubTitle.Lines.Text := ValorSql(sSql) + ' - Nro. Autoriz.: ' + edAutorizacion.Text;
  PrintResults;
end;

procedure TfrmPresupuestos.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                                var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;

  // así lo imprime tachado
  if not sdqConsulta.FieldByName('SP_FECHABAJA').IsNull then
    AFont.Style := [fsStrikeOut];
end;

{ Impresión del pedido de cotización para el prestador }
procedure TfrmPresupuestos.mnuImprimirPedidodeCotizacionClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqConsulta.FieldByName('SP_FECHABAJA').IsNull then
  begin
    if sdqConsulta.FieldByName('FEC_RECEPCION').IsNull then
    begin
      with TfrmFirmantes.Create(Self) do
      try
        Area := AREA_APAU;
        if ShowModal = mrOk then
        begin
          fpEntrega.ShowModal;
          with TqrpSolicitudPresupuesto.Create(Self) do
          try
            EntregaTrabajador := rbEntregaTrab.Checked;
            ImprimirSolicitudPresupuesto(sdqConsulta.FieldByName('PA_ID').AsInteger,
                                         Self.Siniestro, Orden, Recaida, Autorizacion);
            // actualizo datos de la impresión y del firmante (aval)
            try
              sSql :=
                'UPDATE MPA_PRESUPUESTOAUTORIZACION' +
                  ' SET pa_usuimpresion = ' + SqlValue(Sesion.UserId) + ',' +
                      ' pa_fechaimpresion = ActualDate,' +
                      ' pa_aval = ' + SqlInt(sdqFirmasCODFIRMA.AsInteger) +
                ' WHERE pa_id = ' + SqlValue(sdqConsulta.FieldByName('PA_ID').AsInteger);
              EjecutarSql(sSql);
              sdqConsulta.Refresh;
            except
              on E: Exception do
                raise Exception.Create(E.Message + CRLF + 'Error al imprimir el pedido de cotización.');
            end;
          finally
            Free;
          end;
        end;
      finally
        Free;
      end;
    end
    else
      MsgBox('El presupuesto ya ha sido recepcionado.', MB_OK + MB_ICONWARNING);
  end
  else
    MsgBox('El presupuesto se encuentra dado de baja.', MB_OK + MB_ICONWARNING);
end;

procedure TfrmPresupuestos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('COTIZACION') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('COTIZACION')).Currency := True;

  if sdqConsulta.FieldByName('VALOR_ADJUDICACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VALOR_ADJUDICACION')).Currency := True;

  if sdqConsulta.FieldByName('PA_MONTOBRUTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PA_MONTOBRUTO')).Currency := True;

  if sdqConsulta.FieldByName('PA_IVA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PA_IVA')).Currency := True;

end;

procedure TfrmPresupuestos.OnFormShow(Sender: TObject);
var
  bHabilitar: Boolean;
  bCancel: Boolean;
  sEstadoAutorizacion: String;
  sSql: String;
begin
  inherited;

  SinEdit.SetValues(Siniestro, Orden, Recaida);
  edAutorizacion.Text := IntToStr(Autorizacion);
  sSql :=
    'SELECT ex_cuil, tj_nombre' +
     ' FROM sex_expedientes, ctj_trabajadores' +
    ' WHERE ex_siniestro = ' + SqlValue(Siniestro) +
      ' AND ex_orden = ' + SqlValue(Orden) +
      ' AND ex_recaida = ' + SqlValue(Recaida) +
      ' AND ex_cuil = tj_cuil(+)';

  with GetQuery(sSql) do
  try
    if not IsEmpty then
    begin
      mskTrabCUIL.Text   := FieldByName('EX_CUIL').AsString;
      edRazonSocial.Text := FieldByName('TJ_NOMBRE').AsString;
    end;
  finally
    free;
  end;
  
  sEstadoAutorizacion := GetEstadoAutorizacion(Siniestro, Orden, Recaida, Autorizacion);
  bHabilitar          := ((sEstadoAutorizacion = 'P') or (sEstadoAutorizacion = 'T'));
  tbNuevo.Enabled     := bHabilitar;
  tbSeleccion.Enabled := bHabilitar;

  if not bHabilitar then
  begin
    SeguridadDisableComponent(tbModificar, bCancel);
    SeguridadDisableComponent(tbEliminar, bCancel);
  end;

  tbRefrescarClick(nil);
end;

{ Devuelve el estado de la autorización }
function TfrmPresupuestos.GetEstadoAutorizacion(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT au_estado' +
     ' FROM sau_autorizaciones' +
    ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
      ' AND au_orden = ' + SqlValue(iOrden) +
      ' AND au_recaida = ' + SqlValue(iRecaida) +
      ' AND au_numauto = ' + SqlValue(iAutorizacion);
  Result := ValorSql(sSql);
end;

procedure TfrmPresupuestos.tbSeleccionClick(Sender: TObject);
begin
  inherited;

  with TfrmSeleccionarPresupuesto.Create(Self) do
  try
    Siniestro    := Self.Siniestro;
    Orden        := Self.Orden;
    Recaida      := Self.Recaida;
    Autorizacion := Self.Autorizacion;
    if ShowModal = mrOk then
      RefreshData;
  finally
    Free;
  end;
end;

procedure TfrmPresupuestos.EnviarPedidodeCotizacinxmail1Click(Sender: TObject);
begin
  if sdqConsulta.FieldByName('SP_FECHABAJA').IsNull then
  begin
    if sdqConsulta.FieldByName('FEC_RECEPCION').IsNull then
      with TqrpSolicitudPresupuesto.Create(Self) do
      try
        try
          fpEntrega.ShowModal;
          sMailSucursal := '';
          if chkASuc.Checked then
            btnSucursalesClick(nil);
          EntregaTrabajador := rbEntregaTrab.Checked;
          ImprimirSolicitudPresupuesto(sdqConsulta.FieldByName('PA_ID').AsInteger,
                                       Self.Siniestro, Orden, Recaida, Autorizacion,
                                       TempPath + 'ProvART_' + sdqConsulta.FieldByName('PA_ID').AsString + '.pdf', sMailSucursal);
        except
          on E: Exception do
            raise Exception.Create(E.Message + CRLF + 'Error al enviar la solicitud de presupuesto por mail.');
        end;
      finally
        Free;
      end
    else
      MsgBox('El presupuesto ya ha sido recepcionado.', MB_OK + MB_ICONWARNING);
  end
  else
    MsgBox('El presupuesto se encuentra dado de baja.', MB_OK + MB_ICONWARNING);
end;

procedure TfrmPresupuestos.fraTipoPresupMPropiedadesChange(Sender: TObject);
begin
  rbRecuperoNuloM.Checked := True;
  LockControl(gbRecuperoM, fraTipoPresupM.IsEmpty or
                          (fraTipoPresupM.sdqDatos.FieldByName('TP_RECUPERO').AsString <> 'S'));
  dcVencimAlquilerM.Clear;
  LockControl(dcVencimAlquilerM, fraTipoPresupM.IsEmpty or
                                (fraTipoPresupM.sdqDatos.FieldByName('TP_EXIGEVENCIMIENTO').AsString <> 'S'));
end;

procedure TfrmPresupuestos.fraTipoPresupPPropiedadesChange(Sender: TObject);
begin
  rbRecuperoNuloP.Checked := True;
  LockControl(gbRecuperoP, fraTipoPresupP.IsEmpty or
                          (fraTipoPresupP.sdqDatos.FieldByName('TP_RECUPERO').AsString <> 'S'));
  dcVencimAlquilerP.Clear;
  LockControl(dcVencimAlquilerP, fraTipoPresupP.IsEmpty or
                                (fraTipoPresupP.sdqDatos.FieldByName('TP_EXIGEVENCIMIENTO').AsString <> 'S'));
end;

procedure TfrmPresupuestos.fraTipoPresupAPropiedadesChange(Sender: TObject);
begin
  rbRecuperoNuloA.Checked := True;
  LockControl(gbRecuperoA, fraTipoPresupA.IsEmpty or
                          (fraTipoPresupA.sdqDatos.FieldByName('TP_RECUPERO').AsString <> 'S'));
  dcVencimAlquilerA.Clear;
  LockControl(dcVencimAlquilerA, fraTipoPresupA.IsEmpty or
                                (fraTipoPresupA.sdqDatos.FieldByName('TP_EXIGEVENCIMIENTO').AsString <> 'S'));
end;

procedure TfrmPresupuestos.rbRecuperoNoMClick(Sender: TObject);
begin
  if rbRecuperoNoM.Checked then
  begin
    dcInicioRecuperoM.Clear;
    dcInicioRecuperoM.Enabled := False;
  end;
end;

procedure TfrmPresupuestos.rbRecuperoNoAClick(Sender: TObject);
begin
  if rbRecuperoNoA.Checked then
  begin
    dcInicioRecuperoA.Clear;
    dcInicioRecuperoA.Enabled := False;
  end;
end;

procedure TfrmPresupuestos.rbRecuperoNoPClick(Sender: TObject);
begin
  if rbRecuperoNoP.Checked then
  begin
    dcInicioRecuperoP.Clear;
    dcInicioRecuperoP.Enabled := False;
  end;
end;

procedure TfrmPresupuestos.rbRecuperoSiAClick(Sender: TObject);
begin
  dcInicioRecuperoA.Enabled := rbRecuperoSiA.Checked;
end;

procedure TfrmPresupuestos.rbRecuperoNuloAClick(Sender: TObject);
begin
  if rbRecuperoNuloA.Checked then
  begin
    dcInicioRecuperoA.Clear;
    dcInicioRecuperoA.Enabled := False;
  end;
end;

procedure TfrmPresupuestos.rbRecuperoNuloMClick(Sender: TObject);
begin
  if rbRecuperoNuloM.Checked then
  begin
    dcInicioRecuperoM.Clear;
    dcInicioRecuperoM.Enabled := False;
  end;
end;

procedure TfrmPresupuestos.rbRecuperoSiMClick(Sender: TObject);
begin
  dcInicioRecuperoM.Enabled := rbRecuperoSiM.Checked;
end;

procedure TfrmPresupuestos.rbRecuperoNuloPClick(Sender: TObject);
begin
  if rbRecuperoNuloP.Checked then
  begin
    dcInicioRecuperoP.Clear;
    dcInicioRecuperoP.Enabled := False;
  end;
end;

procedure TfrmPresupuestos.rbRecuperoSiPClick(Sender: TObject);
begin
  dcInicioRecuperoP.Enabled := rbRecuperoSiP.Checked;
end;

procedure TfrmPresupuestos.tbAuditoriaClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(sdqConsulta.IsEmpty, tbAuditoria, 'No se han cargado registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('SP_FECHABAJA').IsNull, tbAuditoria,
            'El presupuesto se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('FEC_RECEPCION').IsNull, tbAuditoria,
            'El presupuesto aún no se ha recepcionado.');
  Verificar(sdqConsulta.FieldByName('ADJUDICADO').AsString <> 'S', tbAuditoria,
            'El presupuesto seleccionado no ha sido adjudicado.');
  Verificar(not sdqConsulta.FieldByName('SP_FECHAAUDITORIA').IsNull, tbAuditoria,
            'El presupuesto seleccionado ya ha sido auditado.');

  if MsgAsk('¿Confirma auditar el presupuesto seleccionado?') then
  begin
    sSql := 'UPDATE MSP_SINIESTROPRESUP ' +
              ' SET sp_fechaauditoria = ActualDate, ' +
                  ' sp_usuauditoria = ' + SqlValue(Sesion.UserID) +
            ' WHERE sp_nropedido = ' + SqlInt(sdqConsulta.FieldByName('NRO_PEDIDO').AsInteger);
    EjecutarSql(sSql);
    sdqConsulta.Refresh;
  end;
end;

{ Determina si existe algún presupuesto auditado }
function GetExistePresupuestoAuditado(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1' +
           ' FROM MSP_SINIESTROPRESUP' +
          ' WHERE sp_siniestro = :Sin ' +
            ' AND sp_orden = :Ord ' +
            ' AND sp_recaida = :Reca ' +
            ' AND (sp_autooriginal = :Aut OR sp_autoapro = :Aut) ' +
            ' AND sp_adjudicado = ''S'' ' +
            ' AND sp_fechabaja IS NULL ' +
            ' AND ((sp_valor_adju < 20000) OR (sp_fechaauditoria IS NOT NULL)) ';
  Result := ExisteSqlEx(sSql, [iSiniestro, iOrden, iRecaida, iAutorizacion]);
end;

procedure TfrmPresupuestos.edIVAChange(Sender: TObject);
begin
  edCotizacion.Value := edIVA.Value + edMontoBruto.Value;

end;

procedure TfrmPresupuestos.edMontoBrutoChange(Sender: TObject);
begin
  edCotizacion.Value := edIVA.Value + edMontoBruto.Value;

end;

procedure TfrmPresupuestos.FormCreate(Sender: TObject);
begin
  inherited;
  fraPrestadorMatSolic.OnChange := fraPrestadorMatSolicChange;

end;

procedure TfrmPresupuestos.fraPrestadorMatSolicChange(Sender: TObject);
begin
  //edDatosUtiles.Text := ValorSqlEx('select ca_habilitaciones from cpr_prestador where ca_identificador = :id', [fraPrestadorMatSolic.IDPrestador]);

end;

procedure TfrmPresupuestos.btnSucursalesClick(Sender: TObject);
begin
  sdqSucursales.Close;
  if (Sender <> nil) then  //Sender = TObject -> si se ingresa por el btnSucursales
  begin
    verificar(fraPrestadorMatSolic.IsEmpty, fraPrestadorMatSolic, 'Debe ingresar un prestador');
    sdqSucursales.ParamByName('idprest').AsInteger := fraPrestadorMatSolic.IDPrestador
  end
  else
    sdqSucursales.ParamByName('idprest').AsInteger := sdqConsulta.fieldbyname('ca_identificador').AsInteger;

  sdqSucursales.Open;
  
  if (Sender <> nil) or ((Sender = nil) and (not sdqSucursales.Eof)) then
    fpSucursales.ShowModal;

end;

procedure TfrmPresupuestos.btnAceptarSucClick(Sender: TObject);
begin
  sMailSucursal := sdqSucursales.fieldbyname('sp_mail').AsString;

end;

procedure TfrmPresupuestos.fpSucursalesShow(Sender: TObject);
begin
  edDatosUtiles.Text := ValorSqlEx('select ca_habilitaciones from cpr_prestador where ca_identificador = :id', [fraPrestadorMatSolic.IDPrestador]);

end;

procedure TfrmPresupuestos.fpEntregaShow(Sender: TObject);
begin
  chkASuc.Checked := false;

end;

procedure TfrmPresupuestos.rbEntregaPrestEnter(Sender: TObject);
begin
  //vclextra.LockControls([chkASuc], false);
end;

procedure TfrmPresupuestos.rbEntregaTrabEnter(Sender: TObject);
begin
  {vclextra.LockControls([chkASuc]);
  chkASuc.Checked := false;}
end;

end.

