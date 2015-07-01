unit unAdmInterfaces;

interface                

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, PatternEdit, DateTimeEditors,
  Buttons, ToolEdit, DateComboBox, unArt, VCLExtra, DateUtil, IntEdit, Placemnt,
  RxPlacemnt, RxToolEdit;

type
  TTipoPagoLegal = (pl_Juicio, pl_Sumario, pl_Mediacion, pl_Honorarios);

  TfrmAdmInterfaces = class(TForm)
    gbFecha: TGroupBox;
    Label1: TLabel;
    chkLimpiarAnteriores: TCheckBox;
    chkCalcularTamanioLote: TCheckBox;
    gbFacturas: TGroupBox;
    chkComisiones: TCheckBox;
    btnEnviar: TBitBtn;
    btnSalir: TBitBtn;
    edFechaEnvio: TDateComboBox;
    btnCancelar: TBitBtn;
    chkPagosLegalesJuicios: TCheckBox;
    chkILTP: TCheckBox;
    chkOtrosConceptos: TCheckBox;
    chkCompensacionDeuda: TCheckBox;
    chkPrestacionesMedicas: TCheckBox;
    Label2: TLabel;
    edIdProceso: TIntEdit;
    chkPagosLegalesSumarios: TCheckBox;
    FormStorage: TFormStorage;
    chkPagosLegalesMediac: TCheckBox;
    chkPagosLegalesHonorarios: TCheckBox;
    chkCobranzas: TCheckBox;
    chkImpuestos: TCheckBox;
    chkMarcarDesmarcar: TCheckBox;
    procedure btnSalirClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkCompensacionDeudaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkMarcarDesmarcarClick(Sender: TObject);
  private
    pbProcesosEjecutados, pbContinuar: Boolean;

    function Get_TipoFactura(Importe: Currency; Tipo: String): String;
    function Obtener_FactorFondo(Fecha: TDateTime; Tipo: String): Extended;
    function Validar: Boolean;

    procedure Actualizar_ProxDigitoFactura_FNCL(Siniestro, Orden, Recaida, NroLiquidacion, Volante: Integer; TipoEnvio: String);
    function Get_ProxNroFactura(Siniestro, Orden, Recaida, NroLiquidacion: Integer): String;
    procedure Do_AnalizarContinuar;
    procedure Do_HabilitarSalirCancelar(Habilitar: Boolean);
    procedure Do_LimpiarEnviosAnteriores;
    procedure Financial_APClear;
    procedure Financial_VendorsClear;

    procedure Limpiar_TablaTemporalProv(TipoListado: String);
    procedure Limpiar_TablaTemporalFactCom(TipoListado: String);
    procedure Limpiar_TablaTemporalFactLiq(TipoListado: String);

    procedure Insert_ErroresExportacionFNCL(Usuario, TipoListado, CodEntidad, NombreEntidad, CodVendedor, NombreVendedor, NombreAcreedor, TipoAcreedor, TipoDoc, NroDoc, MotivoError: String);
    procedure Insert_ErroresExportacionComFNCL(Usuario, TipoListado, CodEntidad, NombreEntidad, CodVendedor, NombreVendedor, TipoDoc, NroDoc: String; ComisionNeto, Iva, Ganancias, IB, OS, Total: Currency; MotivoError: String);
    procedure Insert_ErroresExportacionLiqFNCL(Usuario, TipoListado, NombreAcreedor, TipoDoc, NroDoc, SiniestroCompleto, MotivoError: String; NumLiquidacion: Integer; Importe: Extended; TipoAcreedor: String);

    function Financial_GLGetCodeCombinationID(Cuenta: String): Integer;
    function Get_VendorID(Codigo, TipoDoc: String): Integer;
    function Get_LookUp_Code(Meaning: String): String;
    //function Get_Location_ID(Location_Code: String): Integer;
    function Get_DGI_Code(Category, Letter: String): String;
    function Obtener_CodProvinciaFinancial(DescrProvincia: String): String;
    function Financial_APGetSequence(): Integer;
    function VendorExists(Codigo, TipoDoc: String): Boolean;
    function Get_DatosCuentaBancaria(TipoAcreedor: String; IdAcreedor: TTableId; CuitCuil: String; var TipoCuenta, NroCuenta, CBU1, CBU2, Sucursal: String): Boolean;
    procedure Financial_AjustarFondoILTP(Fecha: TDateTime; TipoEnvio: String);
    function ContinuarProcesamiento(CantReg: Integer; Mensaje: String): Integer;
    // procedure Financial_IngresosBrutosInsert(IB: Currency; IdFactura: TTableId; Sequence: Integer);
    procedure Financial_ConceptosComisionesInsert(IdFactura: TTableId; Sequence: Integer; ImporteFactura: Currency);
    procedure Financial_VolanteInsert(EsFactura, RetieneGan: Boolean; EstadoVol: String;
                                      Volante, Sequence: Integer; NombreAcreedor,
                                      FacturaNro, DebitoNro: String; FechaPago: TDateTime);
    procedure Financial_ContratosFondoGarantiaInsert(IdFactura: TTableId; Sequence: Integer; ImporteFactura: Currency);

    // no tocar, son 3 parámetros por linea
    procedure Insert_AC_AC_B_Vendors_Int(
                     VENDOR_NAME, TERMS_CODE, VENDOR_TYPE_LOOKUP_CODE,
                     CURRENCY_CODE, VAT_CODE, MEANING,
                     DNRP_NUMBER, DOCUMENT_NUMBER, GROSS_INCOME_NUMBER,
                     INTERNAL_TAX_NUMBER, VAT_WH_CONDITION_CODE, VAT_WH_DISCOUNT_PCT,
                     VAT_WH_DISCOUNT_DUE_DATE, VAT_WH_DFLT_CODE, INCOME_WH_CONDITION_CODE,
                     INCOME_WH_DISCOUNT_PCT, INCOME_WH_DISCOUNT_DUE_DATE, INCOME_WH_DFLT_CODE,
                     IB_WH_FLAG, IB_WH_ZONE_CODE, IB_WH_DISCT_PCT,
                     IB_WH_DISCT_DUE_DATE, DEFAULT_CODE, RS_WH_FLAG,
                     TRANSACTION_LETTER, BENEFICIARY_NAME, MAIN_BENEFICIARY,
                     ADDRESS_LINE1, ADDRESS_LINE2, CITY,
                     STATE, ZIP, PROVINCE,
                     COUNTRY, AREA_CODE, PHONE,
                     FAX, FAX_AREA_CODE, DGI_TRANSACTION_TYPE,
                     ACCTS_PAY_CODE_COMBINATION_ID, PREPAY_CODE_COMBINATION_ID, PAY_GROUP_LOOKUP_CODE,
                     VAT_REGISTRATION_NUM, ATTRIBUTE15, ATTRIBUTE1,
                     ATTRIBUTE2, ATTRIBUTE3, ATTRIBUTE4,
                     ATTRIBUTE5, SEVERAL_WH_FLAG, BANK_ACCOUNT_NUM,
                     BANK_NUM, BANK_ACCOUNT_TYPE, ATTRIBUTE14: Variant;
                     DatosCuentaBancaria: Boolean; FONDOTIERRADELFUEGO: Variant);
    // no tocar, son 3 parámetros por linea
    procedure Financial_APHeaderInsert(
                        SourceName, Sequence, Fecha,
                        Descripcion: Variant; Cuenta: String; Importe: Variant;
                        Proveedor: String; FacturaNumero, TipoFactura,
                        GrupoDePagos: Variant; TipoDoc: String; TieneSiniestros,
                        Volante: Variant; EsAjuste: Boolean; FechaAnt: Variant;
                        Grupo, CAI, PagoIndependiente,
                        Beneficiario: String; FechaFactura, Siniestro,
                        Orden, Recaida, NroLiquid: Variant;
                        CodTabla: String; IdJuicio, Carpeta,
                        TipoFondo, MetodoPago, Banco,
                        IdLiq: Variant);

    // no tocar, son 3 parámetros por linea
    procedure Financial_APLineInsert(Sequence: Integer; Descripcion: Variant; Cuenta: String;
                        Codigo, Importe: Variant; ConceptoPago: Variant;
                        Retiene: Boolean);

    procedure Do_GenerarListado_Comisiones(TipoListado: String; Fecha: TDateTime);
    procedure Do_GenerarListado_Siniestros(TipoListado: String; Fecha: TDateTime; IdProceso: Integer);

    procedure Financial_ExportarComisiones(EsVendedor: Boolean; Estado, FacturaNro, DescripcionFactura,
                                           Doc, DocGuiones: String; FechaCont: TDateTime; ImporteFactura, Comision,
                                           Iva, Ganancias, OS, IB, RETIVA: Currency; IdFactura: TTableId;
                                           FacturaTipo: String);
    procedure Financial_ExportarLegales(Estado, FacturaNro, DescripcionFactura,
                                        Doc, DocGuiones: String; FechaCont: TDateTime;
                                        ImporteSinRet, ImporteConRet: Currency; IdLiq: TTableId;
                                        CuentaContable: String; Retencion: Boolean; BeneficiarioCheque,
                                        ConceptoPago, DescripcionConceptoPago, JuicioConSiniestro,
                                        CodTabla, TipoDoc, PagoIndependiente: String;
                                        IdLiquidacion, Carpeta: Integer; MetodoPago: String);
    procedure Financial_ExportarSiniestrosILTP(Estado, FacturaNro, DescripcionFactura,
                                               Descripcion, DocGuiones, ConceptoPago,
                                               TipoDoc, PagoIndependiente, Beneficiario,
                                               Cuenta: String; Fecha, FechaAnt: TDateTime;
                                               Importe: Currency; ActualEsFondo: Boolean; Siniestro,
                                               Orden, Recaida, NroLiquidacion: Integer;
                                               TipoEnvio: String; EsAjuste: Boolean; ImporteFondo,
                                               ImporteCuenta: Extended; ActualizarDigFactura: Boolean; LookUp,
                                               Group, TipoFondo, MetodoPago: String;
                                               Banco: Integer);
    procedure Financial_ExportarOtrosPagos(Estado, FacturaNro, DescripcionFactura,
                                           Descripcion, DocGuiones, ConceptoPago,
                                           TipoDoc, Cuenta: String; Fecha,
                                           FechaAnt: TDateTime; Importe: Currency; ImporteConRetencion,
                                           ImporteSinRetencion: Extended; Grupo, CAI: String;
                                           Siniestro, Orden, Recaida,
                                           NroLiquid: Integer; Beneficiario, MetodoPago: String;
                                           Banco: Integer; Group: String);
    procedure Financial_ExportarFondoGarantia(Estado, FacturaNro, DescripcionFactura,
                                              Doc, DocGuiones: String; FechaCont: TDateTime;
                                              ImporteFactura: Currency; IdFactura: TTableId);
    procedure Financial_ExportarPagoEnExceso(Estado, FacturaNro, DescripcionFactura,
                                             Doc, DocGuiones: String; FechaCont: TDateTime;
                                             ImporteFactura: Currency; IdFactura: TTableId; Beneficiario: String;
                                             Contrato: Integer);
    procedure Financial_ExportarImpuestos(Estado, FacturaNro, DescripcionFactura,
                                          Doc, DocGuiones: String; FechaCont: TDateTime;
                                          ImporteFactura: Currency; Beneficiario: String; IdLiquidacion: TTableId;
                                          Fecha: TDateTime);

    procedure Financial_Comisiones(Fecha: TDateTime);
    procedure Financial_PagosLegales(Fecha: TDateTime; TipoPagoLegal: TTipoPagoLegal);
    procedure Financial_SiniestrosILTP(Fecha: TDateTime; TipoEnvio: String);
    procedure Financial_SiniestrosOtrosPagos(Fecha: TDateTime; TipoEnvio: String);
    procedure Financial_SiniestrosCompensacionDeuda(IdProceso: Integer; TipoEnvio: String);
    procedure Financial_SiniestrosPrestacionesMedicas(Fecha: TDateTime);
  	procedure Financial_FondoGarantia(Fecha: TDateTime);
    procedure Financial_PagoEnExceso(Fecha: TDateTime);
    procedure Financial_Impuestos(Fecha: TDateTime);

    function Financial_SiniestILTP_CantidadReg(Fecha: TDateTime): Integer;
    function Financial_SiniestOtrosPagos_CantidadReg(Fecha: TDateTime): Integer;
    function Financial_SiniestCompenDeuda_CantidadReg(IdProceso: Integer): Integer;
    function Financial_SiniestPrestMedic_CantidadReg(Fecha: TDateTime): Integer;

    function Financial_ProveedoresLegales(Fecha: TDateTime; TipoPagoLegal: TTipoPagoLegal): Boolean;
    function Financial_ProveedoresEntidades(Fecha: TDateTime): Boolean;
    function Financial_ProveedoresVendedores(Fecha: TDateTime): Boolean;
    function Financial_ProveedoresILTP(Fecha: TDateTime): Boolean;
    function Financial_ProveedoresOtrosPagos(Fecha: TDateTime): Boolean;
    function Financial_ProveedoresCompensacionDeuda(IdProceso: Integer): Boolean;
    function Financial_ProveedoresPrestacionesMedicas(Fecha: TDateTime): Boolean;
    function Financial_ProveedoresPagoEnExceso(Fecha: TDateTime): Boolean;
    function Financial_ProveedoresImpuestos(Fecha: TDateTime): Boolean;

    procedure Get_FondoTipo(FondoTipoAnt: String; var EsFondo: Boolean; var Tipo: String);
    function IsTrabajador_PagosLegales(TipoPagoLegal: TTipoPagoLegal; IdBeneficiarioPago: TTableId): Boolean;
  public
  end;

  procedure Do_GenerarAsiento_Comisiones(FDesde, FHasta: TDateTime; IdLiqComision: TTableId; EsContraAsiento: Boolean);

Const
  YES: String               = 'Y';
  NO: String                = 'N';

  SOURCE_NAME: String       = 'AC INTERFACE';

  IVA_INSCRIPTO: String     = 'R.Inscripto';
  IVA_NOINSCRIPTO: String   = 'R.No Inscripto';
  IVA_EXENTO: String        = 'Exento';
  IVA: String               = 'IVA';

  COUNTRY_CODE: String      = 'AR';
  CURRENCY_CODE: String     = 'PES';

  NO_RETIENE: String        = '99';
  NO_RETIENE_MAYUSC: String = 'NO RETIENE';
  NO_RETIENE_MINUSC: String = 'No Retiene';
  ITEM_NO_RETIENE_MAYUSC: String = 'MISCELLANEOUS';

  GAN_LOCACION: String      = '07';
  GAN_HONORARIOS: String    = '09';

  DGI_SERVICIOS: String     = 'Servicios';

  TERMS_CONTADO             = 'CONTADO';
  COMISIONES_TERMS: String  = TERMS_CONTADO;
  SINIESTROS_TERMS: String  = TERMS_CONTADO;
  LEGALES_TERMS: String     = TERMS_CONTADO;
  COBRANZAS_TERMS: String   = TERMS_CONTADO;
  IMPUESTOS_TERMS: String   = TERMS_CONTADO;

  COMISIONES_LOOKUP: String             = 'Comisiones';
  SINIESTROS_LOOKUP: String             = 'Siniestros';
  SINIESTROSCOMPENSACION_LOOKUP: String = 'Siniestros Compensación';
  SINIESTROSDOACREEDOR_LOOKUP: String   = 'SINCOMSDOACREEDOR';
  PRESTMEDICAS_LOOKUP: String           = 'Prestaciones Médicas';
  PRESTMEDICASMUTUAL_LOOKUP: String     = 'Prestaciones Méd. Mutual';
  OTROSPAGOS_LOOKUP: String             = 'Otros Conceptos (A.Méd.)';
  LEGALES_LOOKUP: String                = 'LEGALES_SIART';
  GASTOSGRALES_LOOKUP: String           = 'GTOS.GRALES';
  MEDICINALABORAL_LOOKUP: String        = 'Medicina Laboral';
  COBRANZAS_LOOKUP: String              = 'COBRANZAS';
  IMPUESTOS_LOOKUP: String              = 'Impuestos';

  CUENTA_PASIVO_ILT: String            = '01-212001-000-00-0000-0000-0000';
  CUENTA_PASIVO_COM: String            = '01-241001-000-00-0000-0000-0000';
  CUENTA_PASIVO_PM: String             = '01-212002-000-00-0000-0000-0000';
  CUENTA_PASIVO_CCCOM: String          = '01-241002-000-00-0000-0000-0000';
  CUENTA_ANTICIPO: String              = '01-136101-000-00-0000-0000-0000';
  CUENTA_TAX: String                   = '01-136998-000-00-0000-0000-0000';
  CUENTA_COMISIONES: String            = '01-242001-000-00-0000-0000-0000';
  CUENTA_RET_IMPUESTOGANANCIAS: String = '01-251103-000-00-0000-0000-0000';
  CUENTA_OBRASOCIAL: String            = '01-252002-000-00-0000-0000-0000';
  CUENTA_RETIVA: String                = '01-251106-000-00-0000-0000-0000';
  CUENTA_FONDO: String                 = '01-280003-000-00-0000-0000-0000';
  CUENTA_COMPENSACION: String          = '01-264021-000-00-0000-0000-0000';
  CUENTA_DEBVS: String                 = '01-136413-000-00-0000-0000-0000';
  CUENTA_BONIFICACION: String          = '01-519904-303-00-0000-0000-0000';
  CUENTA_PASIVO_CON_SINIESTRO: String  = '01-212001-000-00-0000-0000-0000';
  CUENTA_PASIVO_SIN_SINIESTRO: String  = '01-264013-000-00-0000-0000-0000';
  CUENTA_JUICIO_SIN_SINIESTRO: String  = '01-440005-000-00-0000-0000-0000';
  CUENTA_MEDIAC_SIN_SINIESTRO: String  = '01-440004-155-00-0000-0000-0000';
  CUENTA_HONORARIOS_LEGALES: String    = '01-419004-155-00-0000-0000-0000';
  CUENTA_COBRANZAS: String             = '01-264022-000-00-0000-0000-0000';
  CUENTA_OBRASOCIAL_PERD: String       = '01-420009-000-00-0000-0000-0000';

  COMISIONES_GROUP: String             = 'Comisiones';
  SINIESTROS_GROUP: String             = 'Siniestros ILT/ILP';
  SINIESTROSDOACREEDOR_GROUP: String   = 'Siniestros Compensa Saldo Acreedor';
  OTROSPAGOS_GROUP: String             = 'Otros Conceptos';
  SINIESTROSCOMPENSACION_GROUP: String = 'Compensación Siniestros';
  PRESTMEDICAS_GROUP: String           = 'Prestaciones Médicas';
  LEGALES_GROUP: String                = 'LEGALES';
  COBRANZAS_GROUP: String              = 'Cobranzas';
  IMPUESTOS_GROUP: String              = 'Impuestos';

  MUTUAL: String                       = 'A.M.E.B.P.B.A.';

  PAYMENT_METHOD_WIRE: String = 'WIRE';

  FECHA_CUENTAGBA = '01/09/2008'; // fecha a partir de cuando se tiene contabilizado en cuentas distintas en el balance los gastos de GBA

  CONCEPTO_HONORARIOS_GESTDEUDA: String = 'Honorarios por Gestión de Deuda';

implementation

uses
  CustomDlgs, unPrincipal, unDmFinancials, DateTimeFuncs, AnsiSql, unSesion, Cuit, unDmPrincipal, SqlFuncs, General,
  StrFuncs, unAltaModifCCP_CUENTAPAGO, Numeros, unrptExcepcionesFNCLComisiones, unRedPres, SDEngine,
  unrptExcepcionesFNCLILTP, unCustomPrincipal, unSiniestros, unComunes, DB, unTesoreria, unCobranzas;

{$R *.DFM}

procedure TfrmAdmInterfaces.btnCancelarClick(Sender: TObject);
begin
  pbContinuar := False;
end;

procedure TfrmAdmInterfaces.Do_AnalizarContinuar;
begin
  Application.ProcessMessages;
  if not pbContinuar then
    raise Exception.Create('');
end;

procedure TfrmAdmInterfaces.Do_HabilitarSalirCancelar(Habilitar: Boolean);
begin
  btnSalir.Enabled                  := Habilitar;
  btnCancelar.Enabled               := not Habilitar;
  btnEnviar.Enabled                 := Habilitar;
  chkLimpiarAnteriores.Enabled      := Habilitar;
  chkCalcularTamanioLote.Enabled    := Habilitar;
  chkComisiones.Enabled             := Habilitar;
  chkPagosLegalesJuicios.Enabled    := Habilitar;
  chkPagosLegalesSumarios.Enabled   := Habilitar;
  chkPagosLegalesMediac.Enabled     := Habilitar;
  chkPagosLegalesHonorarios.Enabled := Habilitar;
  chkILTP.Enabled                   := Habilitar;
  chkOtrosConceptos.Enabled         := Habilitar;
  chkCompensacionDeuda.Enabled      := Habilitar;
  chkPrestacionesMedicas.Enabled    := Habilitar;
  chkCobranzas.Enabled              := Habilitar;
  chkImpuestos.Enabled              := Habilitar;

  VCLExtra.LockControl(edFechaEnvio, not Habilitar);
  VCLExtra.LockControl(edIdProceso, not (Habilitar and chkCompensacionDeuda.Checked));
end;

procedure TfrmAdmInterfaces.FormCreate(Sender: TObject);
begin
  dmFinancials.Conectar;
  Do_HabilitarSalirCancelar(True);
  pbProcesosEjecutados := False;
end;

procedure TfrmAdmInterfaces.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdmInterfaces.chkCompensacionDeudaClick(Sender: TObject);
begin
  VCLExtra.LockControl(edIdProceso, not chkCompensacionDeuda.Checked);

  if not chkCompensacionDeuda.Checked then
    edIdProceso.Clear;
end;

function TfrmAdmInterfaces.Validar: Boolean;
begin
  Verificar(not (chkComisiones.Checked or chkPagosLegalesJuicios.Checked or chkPagosLegalesSumarios.Checked or chkPagosLegalesMediac.Checked or chkPagosLegalesHonorarios.Checked or chkILTP.Checked or chkOtrosConceptos.Checked or chkPrestacionesMedicas.Checked or chkCompensacionDeuda.Checked or chkCobranzas.Checked or chkImpuestos.Checked), nil, 'Debe seleccionar algún tipo de factura.');
  Verificar(chkCompensacionDeuda.Checked and edIdProceso.IsEmpty, edIdProceso, 'Debe ingresar el nro. de proceso de compensación.');
  Verificar((chkComisiones.Checked or chkPagosLegalesJuicios.Checked or chkPagosLegalesSumarios.Checked or chkPagosLegalesMediac.Checked or chkPagosLegalesHonorarios.Checked or chkILTP.Checked or chkOtrosConceptos.Checked or chkPrestacionesMedicas.Checked or chkCobranzas.Checked or chkImpuestos.Checked) and edFechaEnvio.IsEmpty, edFechaEnvio, 'Debe seleccionar alguna fecha de envío.');

  if chkCompensacionDeuda.Checked then   // compensación deuda por siniestros
    Verificar(not Is_ExisteIdCompensacion(edIdProceso.Value), edIdProceso, 'El nro. de proceso de compensación no existe');

  Result := True;
end;

function TfrmAdmInterfaces.ContinuarProcesamiento(CantReg: Integer; Mensaje: String): Integer;
var
  iResp: Integer;
begin
  if CantReg = 0 then
  begin
    MsgBox('No se han encontrado ' + Mensaje + '.', MB_ICONINFORMATION);
    iResp := IDNO;
  end
  else
    iResp := MsgBox('Se procesarán ' + TrimLeft(IntToStr(CantReg)) + ' ' + Mensaje + '. ¿ Continúa ?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);

  Result := iResp;
end;

{$B+}
procedure TfrmAdmInterfaces.btnEnviarClick(Sender: TObject);
var
  bFaltanProvedores: Boolean;
  iCantReg: Integer;
  iResp: Integer;
const
  TipoEnvio_ILT_ILP: String     = 'ILT_ILP';
  TipoEnvio_OTROS_PAGOS: String = 'OTROS_PAGOS';
  TipoEnvio_PREST_MED: String   = 'PREST_MED';
begin
	try
  	Do_HabilitarSalirCancelar(False);
    try
      pbContinuar := True;

      if Validar then
      begin
      	bFaltanProvedores    := False;
        pbProcesosEjecutados := True;

        if chkLimpiarAnteriores.Checked then
        	Do_LimpiarEnviosAnteriores;

        // Comisiones
        if chkComisiones.Checked then
        begin
        	bFaltanProvedores := Financial_ProveedoresEntidades(edFechaEnvio.Date) or bFaltanProvedores;
          bFaltanProvedores := Financial_ProveedoresVendedores(edFechaEnvio.Date) or bFaltanProvedores;

          if not bFaltanProvedores then
          	Financial_Comisiones( edFechaEnvio.Date );
        end;

        // Legales - Juicios
        if chkPagosLegalesJuicios.Checked then
        begin
        	bFaltanProvedores := Financial_ProveedoresLegales(edFechaEnvio.Date, pl_Juicio) or bFaltanProvedores;

          if not bFaltanProvedores then
          	Financial_PagosLegales(edFechaEnvio.Date, pl_Juicio);
        end;

        // Legales - Sumarios
        if chkPagosLegalesSumarios.Checked then
        begin
        	bFaltanProvedores := Financial_ProveedoresLegales(edFechaEnvio.Date, pl_Sumario) or bFaltanProvedores;

          if not bFaltanProvedores then
          	Financial_PagosLegales(edFechaEnvio.Date, pl_Sumario);
        end;

        // Legales - Mediaciones
        if chkPagosLegalesMediac.Checked then
        begin
        	bFaltanProvedores := Financial_ProveedoresLegales(edFechaEnvio.Date, pl_Mediacion) or bFaltanProvedores;

          if not bFaltanProvedores then
          	Financial_PagosLegales(edFechaEnvio.Date, pl_Mediacion);
        end;

        // Legales - Honorarios
        if chkPagosLegalesHonorarios.Checked then
        begin
        	bFaltanProvedores := Financial_ProveedoresLegales(edFechaEnvio.Date, pl_Honorarios) or bFaltanProvedores;

          if not bFaltanProvedores then
          	Financial_PagosLegales(edFechaEnvio.Date, pl_Honorarios);
        end;

        // ILT / ILP
        if chkILTP.Checked then
        begin
        	if chkCalcularTamanioLote.Checked then
          begin
          	iCantReg := Financial_SiniestILTP_CantidadReg(edFechaEnvio.Date);
            iResp := ContinuarProcesamiento(iCantReg, 'liquidaciones de ILT/ILP');
          end
          else
          	iResp := IDYES;

          if iResp = IDYES then
          begin
          	bFaltanProvedores := Financial_ProveedoresILTP(edFechaEnvio.Date) or bFaltanProvedores;

            if not bFaltanProvedores then
            begin
            	Financial_SiniestrosILTP( edFechaEnvio.Date, TipoEnvio_ILT_ILP );
              Financial_AjustarFondoILTP( edFechaEnvio.Date, TipoEnvio_ILT_ILP );
            end;
          end
        end;

        // Otros Conceptos
        if chkOtrosConceptos.Checked then
        begin
        	if chkCalcularTamanioLote.Checked then
          begin
          	iCantReg := Financial_SiniestOtrosPagos_CantidadReg(edFechaEnvio.Date);
            iResp := ContinuarProcesamiento(iCantReg, 'liquidaciones de Otros Conceptos');
          end
          else
          	iResp := IDYES;

          if iResp = IDYES then
          begin
          	bFaltanProvedores := Financial_ProveedoresOtrosPagos(edFechaEnvio.Date) or bFaltanProvedores;

            if not bFaltanProvedores then
            	Financial_SiniestrosOtrosPagos(edFechaEnvio.Date, TipoEnvio_OTROS_PAGOS);
          end;
        end;

        // Compensación Deuda por Siniestros
        if chkCompensacionDeuda.Checked then
        begin
        	if chkCalcularTamanioLote.Checked then
          begin
          	iCantReg := Financial_SiniestCompenDeuda_CantidadReg(edIdProceso.Value);
            iResp := ContinuarProcesamiento(iCantReg, 'liquidaciones de Compensación de Deuda por Siniestros');
          end
          else
          	iResp := IDYES;

          if iResp = IDYES then
          begin
          	bFaltanProvedores := Financial_ProveedoresCompensacionDeuda(edIdProceso.Value) or bFaltanProvedores;

            if not bFaltanProvedores then
            	Financial_SiniestrosCompensacionDeuda(edIdProceso.Value, TipoEnvio_ILT_ILP);
          end
        end;

        // Prestaciones Médicas
        if chkPrestacionesMedicas.Checked then
        begin
        	if chkCalcularTamanioLote.Checked then
          begin
          	iCantReg := Financial_SiniestPrestMedic_CantidadReg(edFechaEnvio.Date);
            iResp := ContinuarProcesamiento(iCantReg, 'volantes de Prestaciones Médicas');
          end
          else
          	iResp := IDYES;

          if iResp = IDYES then
          begin
          	bFaltanProvedores := Financial_ProveedoresPrestacionesMedicas(edFechaEnvio.Date) or bFaltanProvedores;

            if not bFaltanProvedores then
            	Financial_SiniestrosPrestacionesMedicas(edFechaEnvio.Date);
          end;
        end;

        // Cobranzas
        if chkCobranzas.Checked then
          begin
            bFaltanProvedores := Financial_ProveedoresPagoEnExceso( edFechaEnvio.Date );

            if not bFaltanProvedores then
              begin
                Financial_FondoGarantia( edFechaEnvio.Date );
                Financial_PagoEnExceso( edFechaEnvio.Date );
              end;
          end;

        // Impuestos
        if chkImpuestos.Checked then
        begin
        	bFaltanProvedores := Financial_ProveedoresImpuestos(edFechaEnvio.Date) or bFaltanProvedores;

          if not bFaltanProvedores then
          	Financial_Impuestos(edFechaEnvio.Date);
        end;

        if bFaltanProvedores then
        	MsgBox('Se agregaron proveedores, debe correr el proceso de importación en ORACLE antes de proseguir', MB_ICONSTOP + MB_OK);
      end;
    finally
      Do_HabilitarSalirCancelar(True);
      LimpiarEstado;
    end;
  except
  	//
  end;
end;
{$B-}

procedure TfrmAdmInterfaces.Financial_VendorsClear;
var
  sSql: String;
begin
  MostrarEstado('Proveedores: Limpiando tablas ...');
  Do_AnalizarContinuar;

  sSql := 'TRUNCATE TABLE AC.AC_B_Vendors_Int';
  dmFinancials.EjecutarSqlST(sSql);

  LimpiarEstado;
end;

procedure TfrmAdmInterfaces.Financial_APClear;
var
  sSql: String;
begin
  MostrarEstado('Facturas: Limpiando tablas ...');
  Do_AnalizarContinuar;

  sSql := 'TRUNCATE TABLE AP.AP_Invoices_Interface';
  dmFinancials.EjecutarSqlST(sSql);

  sSql := 'TRUNCATE TABLE AP.AP_Invoice_Lines_Interface';
  dmFinancials.EjecutarSqlST(sSql);

  LimpiarEstado;
end;

procedure TfrmAdmInterfaces.Do_LimpiarEnviosAnteriores;
begin
  dmFinancials.BeginTrans;

  try
    Financial_VendorsClear;
    Financial_APClear;

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
      dmFinancials.RollBack;
      if pbContinuar then
        ErrorMsg(E, 'Error al limpiar los envíos anteriores.');
      LimpiarEstado;
    end;
  end;
end;

function TfrmAdmInterfaces.Get_TipoFactura(Importe: Currency; Tipo: String): String;
begin
  Result := IIF(Importe < 0, 'NC ', 'FC ') + Tipo;
end;

procedure TfrmAdmInterfaces.Limpiar_TablaTemporalProv(TipoListado: String);
// limpia la tabla temporal del listado de excepciones de proveedores
var
  sSql: String;
begin
  sSql :=
  	'DELETE FROM TMP_ERRORESEXPORTACIONFNCL' +
    		 ' WHERE MP_USUARIO = :p1' +
         	 ' AND MP_TIPOLISTADO = :p2';
  EjecutarSqlEx(sSql, [Sesion.UserId, TipoListado]);
end;

procedure TfrmAdmInterfaces.Limpiar_TablaTemporalFactCom(TipoListado: String);
// limpia la tabla temporal del listado de excepciones de facturas (entidades y vendedores)
var
  sSql: String;
begin
  sSql :=
  	'DELETE FROM TMP_ERRORESEXPORTACIONCOMFNCL' +
    		 ' WHERE MP_USUARIO = :p1' +
         	 ' AND MP_TIPOLISTADO = :p2';
  EjecutarSqlEx(sSql, [Sesion.UserId, TipoListado]);
end;

procedure TfrmAdmInterfaces.Limpiar_TablaTemporalFactLiq(TipoListado: String);
// limpia la tabla temporal del listado de excepciones de facturas
// (ILT/ILP, otros pagos y compensación de deuda)
var
  sSql: String;
begin
  sSql :=
  	'DELETE FROM TMP_ERRORESEXPORTACIONLIQFNCL' +
    		 ' WHERE MP_USUARIO = :p1' +
         	 ' AND MP_TIPOLISTADO = :p2';
  EjecutarSqlEx(sSql, [Sesion.UserId, TipoListado]);
end;

procedure TfrmAdmInterfaces.Insert_ErroresExportacionFNCL(Usuario, TipoListado, CodEntidad, NombreEntidad, CodVendedor,
																													NombreVendedor, NombreAcreedor, TipoAcreedor, TipoDoc, NroDoc,
                                                          MotivoError: String);
var
  Sql: TSql;
begin
  Sql := TSql.Create('tmp_ErroresExportacionFNCL');

  try
    Sql.Fields.Add('mp_Usuario',        Usuario);
    Sql.Fields.Add('mp_TipoListado',    TipoListado);
    Sql.Fields.Add('mp_Canal2',         CodEntidad);
    Sql.Fields.Add('mp_NombreEntidad',  NombreEntidad);
    Sql.Fields.Add('mp_Canal3',         CodVendedor);
    Sql.Fields.Add('mp_NombreVendedor', NombreVendedor);
    Sql.Fields.Add('mp_NombreAcreedor', NombreAcreedor);
    Sql.Fields.Add('mp_TipoAcreedor',   TipoAcreedor);
    Sql.Fields.Add('mp_TipoDoc',        TipoDoc);
    Sql.Fields.Add('mp_NroDoc',         NroDoc);
    Sql.Fields.Add('mp_MotivoError',    MotivoError);


    Sql.SqlType := stInsert;

    EjecutarSql(Sql.Sql);
  finally
    Sql.Free;
  end;
end;

procedure TfrmAdmInterfaces.Insert_ErroresExportacionComFNCL(Usuario, TipoListado, CodEntidad, NombreEntidad,
																														 CodVendedor, NombreVendedor, TipoDoc, NroDoc: String;
                                                             ComisionNeto, Iva, Ganancias, IB, OS, Total: Currency;
                                                             MotivoError: String);
var
  Sql: TSql;
begin
  Sql := TSql.Create('tmp_ErroresExportacionComFNCL');

  try
    Sql.Fields.Add('mp_Usuario',              Usuario);
    Sql.Fields.Add('mp_TipoListado',          TipoListado);
    Sql.Fields.Add('mp_Canal2',               CodEntidad);
    Sql.Fields.Add('mp_NombreEntidad',        NombreEntidad);
    Sql.Fields.Add('mp_Canal3',               CodVendedor);
    Sql.Fields.Add('mp_NombreVendedor',       NombreVendedor);
    Sql.Fields.Add('mp_TipoDoc',              TipoDoc);
    Sql.Fields.Add('mp_NroDoc',               NroDoc);
    Sql.Fields.AddExtended('mp_ComisionNeto', ComisionNeto, ALL_DECIMALS, False);
    Sql.Fields.AddExtended('mp_Iva',          Iva, ALL_DECIMALS, False);
    Sql.Fields.AddExtended('mp_Ganancias',    Ganancias, ALL_DECIMALS, False);
    Sql.Fields.AddExtended('mp_IB',           IB, ALL_DECIMALS, False);
    Sql.Fields.AddExtended('mp_OS',           OS, ALL_DECIMALS, False);
    Sql.Fields.AddExtended('mp_Total',        Total, ALL_DECIMALS, False);
    Sql.Fields.Add('mp_MotivoError',          MotivoError);

    Sql.SqlType := stInsert;

    EjecutarSql(Sql.Sql);
  finally
    Sql.Free;
  end;
end;

procedure TfrmAdmInterfaces.Insert_ErroresExportacionLiqFNCL(Usuario, TipoListado, NombreAcreedor, TipoDoc, NroDoc,
																														 SiniestroCompleto, MotivoError: String;
                                                             NumLiquidacion: Integer; Importe: Extended;
                                                             TipoAcreedor: String);
var
  Sql: TSql;
begin
  Sql := TSql.Create('tmp_ErroresExportacionLiqFNCL');

  try
    Sql.Fields.Add('mp_Usuario',               Usuario);
    Sql.Fields.Add('mp_TipoListado',           TipoListado);
    Sql.Fields.Add('mp_NombreAcreedor',        NombreAcreedor);
    Sql.Fields.Add('mp_TipoDoc',               TipoDoc);
    Sql.Fields.Add('mp_NroDoc',                NroDoc);
    Sql.Fields.Add('mp_SiniestroCompleto',     SiniestroCompleto);
    Sql.Fields.AddInteger('mp_NumLiquidacion', NumLiquidacion, False);
    Sql.Fields.AddExtended('mp_Importe',       Importe, ALL_DECIMALS, False);
    Sql.Fields.Add('mp_MotivoError',           MotivoError);
    Sql.Fields.Add('mp_TipoAcreedor',          TipoAcreedor);

    Sql.SqlType := stInsert;

    EjecutarSql(Sql.Sql);
  finally
    Sql.Free;
  end;
end;

// no tocar, son 3 parámetros por linea
procedure TfrmAdmInterfaces.Insert_AC_AC_B_Vendors_Int(
          VENDOR_NAME, TERMS_CODE, VENDOR_TYPE_LOOKUP_CODE,
          CURRENCY_CODE, VAT_CODE, MEANING,
          DNRP_NUMBER, DOCUMENT_NUMBER, GROSS_INCOME_NUMBER,
          INTERNAL_TAX_NUMBER, VAT_WH_CONDITION_CODE, VAT_WH_DISCOUNT_PCT,
          VAT_WH_DISCOUNT_DUE_DATE, VAT_WH_DFLT_CODE, INCOME_WH_CONDITION_CODE,
          INCOME_WH_DISCOUNT_PCT, INCOME_WH_DISCOUNT_DUE_DATE, INCOME_WH_DFLT_CODE,
          IB_WH_FLAG, IB_WH_ZONE_CODE, IB_WH_DISCT_PCT,
          IB_WH_DISCT_DUE_DATE, DEFAULT_CODE, RS_WH_FLAG,
          TRANSACTION_LETTER, BENEFICIARY_NAME, MAIN_BENEFICIARY,
          ADDRESS_LINE1, ADDRESS_LINE2, CITY,
          STATE, ZIP, PROVINCE,
          COUNTRY, AREA_CODE, PHONE,
          FAX, FAX_AREA_CODE, DGI_TRANSACTION_TYPE,
          ACCTS_PAY_CODE_COMBINATION_ID, PREPAY_CODE_COMBINATION_ID, PAY_GROUP_LOOKUP_CODE,
          VAT_REGISTRATION_NUM, ATTRIBUTE15, ATTRIBUTE1,
          ATTRIBUTE2, ATTRIBUTE3, ATTRIBUTE4,
          ATTRIBUTE5, SEVERAL_WH_FLAG, BANK_ACCOUNT_NUM,
          BANK_NUM, BANK_ACCOUNT_TYPE, ATTRIBUTE14: Variant;
          DatosCuentaBancaria: Boolean; FONDOTIERRADELFUEGO: Variant);
var
  Sql: TSql;
begin
  Sql := TSql.Create('AC.AC_B_Vendors_Int');

  try
    Sql.Fields.AddString('VENDOR_NAME',                    VENDOR_NAME, 'N', True);
    Sql.Fields.AddString('TERMS_CODE',                     TERMS_CODE, 'N', True);
    Sql.Fields.AddString('VENDOR_TYPE_LOOKUP_CODE',        VENDOR_TYPE_LOOKUP_CODE, 'N', True);
    Sql.Fields.AddString('CURRENCY_CODE',                  CURRENCY_CODE, 'N', True);
    Sql.Fields.AddString('VAT_CODE',                       VAT_CODE, 'N', True);
    Sql.Fields.AddString('DOCUMENT_TYPE_CODE',             Get_LookUp_Code(MEANING), 'N', True);
    Sql.Fields.AddString('DNRP_NUMBER',                    DNRP_NUMBER, 'N', True);
    Sql.Fields.AddString('DOCUMENT_NUMBER',                DOCUMENT_NUMBER, 'N', True);
    Sql.Fields.AddString('GROSS_INCOME_NUMBER',            GROSS_INCOME_NUMBER, 'N', True);
    Sql.Fields.AddInteger('INTERNAL_TAX_NUMBER',           INTERNAL_TAX_NUMBER, 'N', True);
    Sql.Fields.AddString('VAT_WH_CONDITION_CODE',          VAT_WH_CONDITION_CODE, 'N', True);
    Sql.Fields.AddString('VAT_WH_DISCOUNT_PCT',            VAT_WH_DISCOUNT_PCT, 'N', True);
    Sql.Fields.AddString('VAT_WH_DISCOUNT_DUE_DATE',       VAT_WH_DISCOUNT_DUE_DATE, 'N', True);
    Sql.Fields.AddString('VAT_WH_DFLT_CODE',               VAT_WH_DFLT_CODE, 'N', True);
    Sql.Fields.AddString('INCOME_WH_CONDITION_CODE',       INCOME_WH_CONDITION_CODE, 'N', True);
    Sql.Fields.AddString('INCOME_WH_DISCOUNT_PCT',         INCOME_WH_DISCOUNT_PCT, 'N', True);
    Sql.Fields.AddString('INCOME_WH_DISCOUNT_DUE_DATE',    INCOME_WH_DISCOUNT_DUE_DATE, 'N', True);
    Sql.Fields.AddString('INCOME_WH_DFLT_CODE',            INCOME_WH_DFLT_CODE, 'N', True);
    Sql.Fields.AddString('SEVERAL_WH_FLAG',                SEVERAL_WH_FLAG, 'N', True);
    Sql.Fields.AddString('IB_WH_FLAG',                     IB_WH_FLAG, 'N', True);
    Sql.Fields.AddString('IB_WH_ZONE_CODE',                IB_WH_ZONE_CODE, 'N', True);
    Sql.Fields.AddInteger('IB_WH_DISCT_PCT',               IB_WH_DISCT_PCT, 'N', True);
    Sql.Fields.AddDate('IB_WH_DISCT_DUE_DATE',             IB_WH_DISCT_DUE_DATE, 'S', True);
    Sql.Fields.AddString('DEFAULT_CODE',                   DEFAULT_CODE, 'N', True);
    Sql.Fields.AddString('RS_WH_FLAG',                     RS_WH_FLAG, 'N', True);
    Sql.Fields.AddString('TRANSACTION_LETTER',             TRANSACTION_LETTER, 'N', True);
    Sql.Fields.AddString('BENEFICIARY_NAME',               BENEFICIARY_NAME, 'N', True);
    Sql.Fields.AddString('MAIN_BENEFICIARY',               MAIN_BENEFICIARY, 'N', True);
    Sql.Fields.AddString('ADDRESS_LINE1',                  ADDRESS_LINE1, 'N', True);
    Sql.Fields.AddString('ADDRESS_LINE2',                  ADDRESS_LINE2, 'N', True);
    Sql.Fields.AddString('CITY',                           CITY, 'N', True);
    Sql.Fields.AddString('STATE',                          STATE, 'N', True);
    Sql.Fields.AddString('ZIP',                            ZIP, 'N', True);
    Sql.Fields.AddString('PROVINCE',                       PROVINCE, 'N', True);
    Sql.Fields.AddString('COUNTRY',                        COUNTRY, 'N', True);
    Sql.Fields.AddString('AREA_CODE',                      AREA_CODE, 'N', True);
    Sql.Fields.AddString('PHONE',                          PHONE, 'N', True);
    Sql.Fields.AddString('FAX',                            FAX, 'N', True);
    Sql.Fields.AddString('FAX_AREA_CODE',                  FAX_AREA_CODE, 'N', True);
    Sql.Fields.AddString('DGI_TRANSACTION_TYPE',           DGI_TRANSACTION_TYPE, 'N', True);
    Sql.Fields.AddInteger('ACCTS_PAY_CODE_COMBINATION_ID', ACCTS_PAY_CODE_COMBINATION_ID, 'N', True);
    Sql.Fields.AddInteger('PREPAY_CODE_COMBINATION_ID',    PREPAY_CODE_COMBINATION_ID, 'N', True);
    Sql.Fields.AddString('PAY_GROUP_LOOKUP_CODE',          PAY_GROUP_LOOKUP_CODE, 'N', True);
    Sql.Fields.AddString('VAT_REGISTRATION_NUM',           VAT_REGISTRATION_NUM, 'N', True);
    Sql.Fields.AddString('BANK_ACCOUNT_NUM',               BANK_ACCOUNT_NUM, 'N', True);
    Sql.Fields.AddString('BANK_NUM',                       BANK_NUM, 'N', True);
    Sql.Fields.AddString('BANK_ACCOUNT_TYPE',              BANK_ACCOUNT_TYPE, 'N', True);
    Sql.Fields.AddString('ATTRIBUTE14',                    ATTRIBUTE14, 'N', True);
    Sql.Fields.AddString('ATTRIBUTE15',                    ATTRIBUTE15, 'N', True);
    Sql.Fields.AddString('FONDOTIERRADELFUEGO',            FONDOTIERRADELFUEGO, 'N', True);

    if DatosCuentaBancaria then
    begin
      Sql.Fields.AddString('ATTRIBUTE1',                 ATTRIBUTE1);
      Sql.Fields.AddString('ATTRIBUTE2',                 ATTRIBUTE2);
      Sql.Fields.AddString('ATTRIBUTE3',                 ATTRIBUTE3);
      Sql.Fields.AddString('ATTRIBUTE4',                 ATTRIBUTE4);
      Sql.Fields.AddString('ATTRIBUTE5',                 ATTRIBUTE5);
    end;

    Sql.SqlType := stInsert;

    dmFinancials.EjecutarSqlST(Sql.Sql);
  finally
    Sql.Free;
  end;
end;

// no tocar, son 3 parámetros por linea
procedure TfrmAdmInterfaces.Financial_APHeaderInsert(
          SourceName, Sequence, Fecha,
          Descripcion: Variant; Cuenta: String; Importe: Variant;
          Proveedor: String; FacturaNumero, TipoFactura,
          GrupoDePagos: Variant; TipoDoc: String; TieneSiniestros,
          Volante: Variant; EsAjuste: Boolean; FechaAnt: Variant;
          Grupo, CAI, PagoIndependiente,
          Beneficiario: String; FechaFactura, Siniestro,
          Orden, Recaida, NroLiquid: Variant;
          CodTabla: String; IdJuicio, Carpeta,
          TipoFondo, MetodoPago, Banco,
          IdLiq: Variant);
var
  SucursalID, CuentaID, ProveedorID: Integer;
  sMetodoPago, sSql, GroupId, sTipoFactura, sTipoComprobante, sLetra: String;
  Sql: TSql;
begin
  if (Importe <> 0) or EsAjuste then
  begin
    CuentaID    := Financial_GLGetCodeCombinationID(Cuenta);
    ProveedorID := Get_VendorID(Proveedor, TipoDoc);

    sSql :=
    	'SELECT MIN(Vendor_Site_ID)' +
       ' FROM PO.PO_Vendor_Sites_All' +
      ' WHERE Vendor_ID = :p1';
    SucursalID := dmFinancials.ValorSqlIntegerEx(sSql, [ProveedorID]);

    if Grupo = SINIESTROSDOACREEDOR_GROUP then
      GroupId := Grupo
    else
      GroupId := VarToStr(Fecha) + ' - ' + Grupo;

    if Importe >= 0 then
      sTipoFactura := 'STANDARD'
    else
      sTipoFactura := 'CREDIT';

    sTipoComprobante := StrLeft(VarToStr(TipoFactura), 2);

    if GrupoDePagos = LEGALES_LOOKUP then
    begin
      sLetra := StrMid(VarToStr(FacturaNumero), 1, 1);
      FacturaNumero := StrMid(VarToStr(FacturaNumero), 3);
    end
    else
      sLetra := StrMid(VarToStr(TipoFactura), 4, 1);

    // DC - Depósito en Cuenta
    // TR - Transf. Bancaria
    // DA - Débito Automático
    if AreIn(MetodoPago, ['TR', 'DC', 'DA']) and (Is_BancoProvincia(Banco) or Is_BancoNacion(Banco) or Is_BancoPatagonia(Banco)) then
      sMetodoPago := PAYMENT_METHOD_WIRE
    else
      sMetodoPago := '';

    Sql := TSql.Create('AP_Invoices_Interface');
    try
      Sql.Fields.AddInteger('Invoice_ID',                    Sequence, 'N', True);
      Sql.Fields.AddString('Created_By',                     '0');
      Sql.Fields.Add('Creation_Date',                        exDateTime);
      Sql.Fields.AddString('Last_Updated_By',                '0');
      Sql.Fields.Add('Last_Update_Date',                     exDateTime);
      Sql.Fields.AddString('Invoice_Currency_Code',          CURRENCY_CODE);
      Sql.Fields.AddExtended('Invoice_Amount',               RoundNumber(Importe), ALL_DECIMALS, False);
      Sql.Fields.AddDate('Invoice_Date',                     FechaFactura, 'S', True);
      Sql.Fields.AddInteger('Accts_Pay_Code_Combination_ID', CuentaID, False);
      Sql.Fields.AddString('Source',                         SourceName, 'N', True);
      Sql.Fields.AddString('Description',                    Trim(Descripcion), 'N', True);
      Sql.Fields.AddInteger('Vendor_ID',                     ProveedorID, False);
      Sql.Fields.AddInteger('Vendor_Site_ID',                SucursalID, False);
      Sql.Fields.AddString('Invoice_Num',                    sLetra + '-' + FacturaNumero, 'N', True);
      Sql.Fields.AddString('Exclusive_Payment_Flag',         PagoIndependiente, 'N', True);
      Sql.Fields.AddString('Attribute1',                     Beneficiario, 'N', True);
      Sql.Fields.AddString('Attribute3',                     Volante, 'N', True);
      Sql.Fields.AddString('Attribute4',                     FechaAnt, 'N', True);
      Sql.Fields.AddString('Attribute5',                     TieneSiniestros, 'N', True);
      Sql.Fields.AddString('Attribute6',                     Siniestro, 'N', True);
      Sql.Fields.AddString('Attribute7',                     Orden, 'N', True);
      Sql.Fields.AddString('Attribute8',                     Recaida, 'N', True);
      Sql.Fields.AddString('Attribute9',                     NroLiquid, 'N', True);
      if VarType(Siniestro) = varInteger then
        Sql.Fields.AddString('Attribute10',                  Get_IdExpediente(Siniestro, Orden, Recaida), 'N', True);
      Sql.Fields.AddString('Attribute11',                    CodTabla, 'N', True);
      Sql.Fields.AddString('Attribute12',                    IdJuicio, 'N', True);
      Sql.Fields.AddString('Attribute13',                    Carpeta, 'N', True);
      Sql.Fields.AddString('Attribute14',                    TipoFondo, 'N', True);
      Sql.Fields.AddString('Attribute15',                    IdLiq, 'N', True);
      Sql.Fields.AddString('Global_Attribute_Category',      'JL.AR.APXIISIM.INVOICES_FOLDER');
      Sql.Fields.AddString('Global_Attribute11',             sTipoComprobante);
      Sql.Fields.AddString('Global_Attribute12',             sLetra);
      Sql.Fields.AddString('Global_Attribute13',             Get_DGI_Code(sTipoComprobante, sLetra), 'N', True);
      Sql.Fields.AddString('Global_Attribute17',             'N');
      //Sql.Fields.AddString('Global_Attribute18',             Get_Location_ID('PROVART'), 'N', True);
      Sql.Fields.AddString('Global_Attribute19',             CAI, 'N', True);
      Sql.Fields.AddString('Pay_Group_LookUp_Code',          GrupoDePagos, 'N', True);
      Sql.Fields.AddString('Group_Id',                       GroupId, 'N', True);
      Sql.Fields.AddString('Invoice_Type_LookUp_Code',       sTipoFactura, 'N', True);
      Sql.Fields.AddString('Payment_Method_LookUp_Code',     sMetodoPago, 'N', True);

      Sql.SqlType := stInsert;

      dmFinancials.EjecutarSqlST(Sql.Sql);
    finally
      Sql.Free;
    end;
  end;
end;

// no tocar, son 3 parámetros por linea
procedure TfrmAdmInterfaces.Financial_APLineInsert(
          Sequence: Integer; Descripcion: Variant; Cuenta: String;
          Codigo, Importe: Variant; ConceptoPago: Variant;
          Retiene: Boolean);
var
  sAttribute3: String;
  CuentaID: Integer;
  Sql: TSql;
begin
  Importe := RoundNumber(Importe);
  if (Importe <> 0) or (Codigo = 'TAX') then
  begin
    CuentaID := Financial_GLGetCodeCombinationID(Cuenta);

    sAttribute3 := '142';
    if not Retiene then
      Codigo := ITEM_NO_RETIENE_MAYUSC;

    Sql := TSql.Create('AP_Invoice_Lines_Interface');
    try
      Sql.Fields.AddInteger('Invoice_Id',               Sequence, 'N', True);
      Sql.Fields.AddString('Created_By',                '0');
      Sql.Fields.Add('Creation_Date',                   exDateTime);
      Sql.Fields.AddString('Last_Updated_By',           '0');
      Sql.Fields.Add('Last_Update_Date',                exDateTime);
      Sql.Fields.AddInteger('Dist_Code_Combination_Id', CuentaID, False);
      Sql.Fields.AddString('Description',               Trim(Descripcion), 'N', True);
      Sql.Fields.AddString('Line_Type_Lookup_Code',     Codigo, 'N', True);
      Sql.Fields.AddExtended('Amount',                  VarToStr(Importe), ALL_DECIMALS, False);
      Sql.Fields.AddString('Attribute14',               ConceptoPago, 'N', True);
      Sql.Fields.AddInteger('Org_Id',                   122, 'N', True);
      Sql.Fields.AddString('Global_Attribute_Category', 'JL.AR.APXIISIM.LINES_FOLDER');
      Sql.Fields.AddString('Global_Attribute3',         sAttribute3);

      Sql.SqlType := stInsert;

      dmFinancials.EjecutarSqlST(Sql.Sql);
    finally
      Sql.Free;
    end;
  end;
end;

(*procedure TfrmAdmInterfaces.Financial_IngresosBrutosInsert(IB: Currency; IdFactura: TTableId; Sequence: Integer);
var
  sSql: String;
  dTotImportes, dImporte: Currency;
begin
  if IB <> 0 then
  begin
    dTotImportes := 0;

    sSql :=
    	'SELECT ROUND(IL_RETENCION*(LF_MONTO/(LC_COMISION+LC_IVA)), 2) RETENCION, IL_PROVINCIA' +
       ' FROM XLC_LIQCOMISION, XLF_LIQFACTURA, XIL_IBLIQUIDACION' +
      ' WHERE IL_RETENCION <> 0' +
        ' AND LC_ID = LF_IDLIQCOMISION' +
        ' AND IL_IDLIQUIDACION = LC_ID' +
      	' AND LF_IDFACTURA = :p1';

		with GetQueryEx(sSql, [IdFactura]) do
    try
    	while not EOF do
      begin
        if RecNo = RecordCount then
          dImporte := IB - dTotImportes
        else
          begin
            dImporte := FieldByName('Retencion').AsFloat;
            dTotImportes := dTotImportes + dImporte;
          end;

      	Financial_APLineInsert(Sequence, 'DGR-Agente de Retencion Ing. Brutos', '01-251202-000-' + LPad(FieldByName('il_Provincia').AsString, '0', 2) + '-0000-0000-0000',
                               'ITEM', -dImporte, '',
                               False);
        Next;
      end;
    finally
    	Free;
    end;
  end;
end;*)

procedure TfrmAdmInterfaces.Financial_ConceptosComisionesInsert(IdFactura: TTableId; Sequence: Integer; ImporteFactura: Currency);
var
  sSql: String;
  dTotImportes, dImporte: Currency;
begin
  dTotImportes := 0;

  sSql :=
   'SELECT CO_DESCRIPCION DESCRCONCEPTO, ' +
          'ROUND(SUM(PC_COMISION)*(LF_MONTO/(LC_COMISION+LC_IVA)),2) IMPORTE ' +
     'FROM XCO_CONCEPTO, XPC_PAGOCOMISION, XLC_LIQCOMISION, XLF_LIQFACTURA ' +
    'WHERE PC_IDLIQCOMISION = LC_ID ' +
      'AND LF_IDLIQCOMISION = LC_ID ' +
      'AND CO_ID = PC_IDCONCEPTO ' +
      'AND LF_IDFACTURA = :p1 ' +
      'AND LF_FECHABAJA IS NULL ' +
      'AND LC_COMISION+LC_IVA <> 0 ' +
    'GROUP BY CO_DESCRIPCION, LF_MONTO, LC_COMISION, LC_IVA';

  with GetQueryEx(sSql, [IdFactura]) do
  try
    while not EOF do
    begin
      if RecNo = RecordCount then
        dImporte := ImporteFactura - dTotImportes
      else
        begin
          dImporte := FieldByName('Importe').AsFloat;
          dTotImportes := dTotImportes + dImporte;
        end;

      Financial_APLineInsert(Sequence, FieldByName('DescrConcepto').AsString, CUENTA_PASIVO_CCCOM,
                             'ITEM', dImporte, '',
                             False);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmAdmInterfaces.Financial_VolanteInsert(EsFactura, RetieneGan: Boolean; EstadoVol: String;
                                                    Volante, Sequence: Integer; NombreAcreedor,
                                                    FacturaNro, DebitoNro: String; FechaPago: TDateTime);
var
  sTipoLinea, sWhere1, sWhere2, sWhere3, sDescr, sSql: String;
  bRetieneGan: Boolean;
begin
  if EsFactura then
  begin
    sDescr  := ' liquidado al prestador ' + NombreAcreedor + ' por la factura: ' + FacturaNro;
    sWhere1 := 'AND IV_IMPFACTURADO > 0 ' +
               'AND VO_FECHAPAGO = ' + SqlValue(FechaPago) + ' ';
    sWhere2 := 'AND VG_IMPFACTURADO > 0 ' +
               'AND VO_FECHAPAGO = ' + SqlValue(FechaPago) + ' ';
    sWhere3 := 'AND IF_VALORFACTURADO > 0 ' +
               'AND VO_FECHAPAGO = ' + SqlValue(FechaPago) + ' ';
  end
  else   // es nota de débito
  begin
    sDescr  := ' debitado al prestador ' + NombreAcreedor + ' por nota de débito: ' + DebitoNro + ' por la factura: ' + FacturaNro;
    sWhere1 := 'AND IV_IMPFACTURADO < 0 ' +
               'AND VO_FECHAPAGO = ' + SqlValue(FechaPago) + ' ';
    sWhere2 := 'AND VG_IMPFACTURADO < 0 ' +
               'AND VO_FECHAPAGO = ' + SqlValue(FechaPago) + ' ';
    sWhere3 := 'AND IF_VALORFACTURADO < 0 ' +
               'AND VO_FECHAPAGO = ' + SqlValue(FechaPago) + ' ';
  end;

  if EstadoVol = 'E' then
    sSql :=
      'SELECT TO_CHAR(IV_CONPAGO) CONCEPTO, ' +
            ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)) CUENTA, CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION,' +
            ' SUM(IV_IMPFACTURADO) IMPORTE ' +
       ' FROM SVO_VOLANTES, SIV_ITEMVOLANTE, SCP_CONPAGO ' +
      ' WHERE IV_VOLANTE = ' + SqlValue(Volante) +
        ' AND CP_CONPAGO = IV_CONPAGO ' +
        ' AND IV_VOLANTE = VO_VOLANTE ' +
        ' AND IV_ESTADO NOT IN (''X'', ''Z'') ' +
          sWhere1 +
   ' GROUP BY IV_CONPAGO, ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)), CP_DENPAGO ' +
      ' UNION ALL ' +
     ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
            ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)) CUENTA, CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION,' +
            ' ROUND(-SUM(IV_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
       ' FROM SVO_VOLANTES, SIV_ITEMVOLANTE, SCP_CONPAGO ' +
      ' WHERE IV_VOLANTE = VO_VOLANTE ' +
        ' AND VO_VOLANTE = ' + SqlValue(Volante) +
        ' AND CP_CONPAGO = IV_CONPAGO ' +
        ' AND IV_ESTADO NOT IN (''X'', ''Z'') ' +
        ' AND CP_RETIVA = ''S'' ' +
          sWhere1 +
   ' GROUP BY ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO), CP_DENPAGO, VO_MONTOIVA, VO_MONTO ' +
      ' UNION ALL ' +
     ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
              'ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)) CUENTA, ' +
              SqlValue(IVA) + ' DESCRIPCION, ROUND(SUM(IV_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
       ' FROM SVO_VOLANTES, SIV_ITEMVOLANTE, SCP_CONPAGO ' +
      ' WHERE IV_VOLANTE = VO_VOLANTE ' +
        ' AND VO_VOLANTE = ' + SqlValue(Volante) +
        ' AND CP_CONPAGO = IV_CONPAGO ' +
        ' AND IV_ESTADO NOT IN (''X'', ''Z'') ' +
        ' AND CP_RETIVA = ''S'' ' +
          sWhere1 +
   ' GROUP BY ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO), CP_DENPAGO, VO_MONTOIVA, VO_MONTO'

  else if AreIn(EstadoVol, ['EG', 'EAG']) then
    sSql :=
    	'SELECT TO_CHAR(VG_CONPAGO) CONCEPTO, ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA,' +
      			' CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION, SUM(VG_IMPFACTURADO) IMPORTE' +
			 ' FROM SVO_VOLANTES, SVG_VOL_GENERICO, SCP_CONPAGO' +
      ' WHERE VG_VOLANTE = ' + SqlValue(Volante) +
        ' AND VG_VOLANTE = VO_VOLANTE ' +
      	' AND CP_CONPAGO = VG_CONPAGO' +
        ' AND VG_ESTADO NOT IN (''X'', ''Z'')' +
              sWhere2 +
   ' GROUP BY VG_CONPAGO, CP_CTAPAGO, CP_DENPAGO ' +
      ' UNION ALL ' +
     ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
            ' ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA, CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION,' +
            ' ROUND(-SUM(VG_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
       ' FROM SVO_VOLANTES, SVG_VOL_GENERICO, SCP_CONPAGO ' +
      ' WHERE VG_VOLANTE = VO_VOLANTE ' +
        ' AND VO_VOLANTE = ' + SqlValue(Volante) +
        ' AND CP_CONPAGO = VG_CONPAGO ' +
        ' AND VG_ESTADO NOT IN (''X'', ''Z'') ' +
        ' AND CP_RETIVA = ''S'' ' +
          sWhere2 +
   ' GROUP BY CP_CTAPAGO, CP_DENPAGO, VO_MONTOIVA, VO_MONTO ' +
      ' UNION ALL ' +
     ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
            ' ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA, ' +
              SqlValue(IVA) + ' DESCRIPCION, ROUND(SUM(VG_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
       ' FROM SVO_VOLANTES, SVG_VOL_GENERICO, SCP_CONPAGO ' +
      ' WHERE VG_VOLANTE = VO_VOLANTE ' +
        ' AND VO_VOLANTE = ' + SqlValue(Volante) +
        ' AND CP_CONPAGO = VG_CONPAGO ' +
        ' AND VG_ESTADO NOT IN (''X'', ''Z'') ' +
        ' AND CP_RETIVA = ''S'' ' +
          sWhere2 +
   ' GROUP BY VG_CONPAGO, CP_CTAPAGO, VO_MONTOIVA, VO_MONTO'

  else if EstadoVol = 'EM' then
    sSql :=
      'SELECT CONCEPTO, CUENTA, DESCRIPCION, SUM(IMPORTE1) IMPORTE' +
       ' FROM ' +
          '(SELECT TO_CHAR(IV_CONPAGO) CONCEPTO,' +
                ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)) CUENTA, CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION,' +
                ' SUM(IV_IMPFACTURADO) IMPORTE1' +
           ' FROM SVO_VOLANTES, SIV_ITEMVOLANTE, SCP_CONPAGO' +
          ' WHERE IV_VOLANTE = ' + SqlValue(Volante) +
            ' AND CP_CONPAGO = IV_CONPAGO' +
            ' AND IV_VOLANTE = VO_VOLANTE ' +
            ' AND IV_ESTADO NOT IN (''X'', ''Z'')' +
                  sWhere1 +
          ' GROUP BY IV_CONPAGO, ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO), CP_DENPAGO' +
          ' UNION ALL ' +
         ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
                ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)) CUENTA, CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION,' +
                ' ROUND(-SUM(IV_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE1 ' +
           ' FROM SVO_VOLANTES, SIV_ITEMVOLANTE, SCP_CONPAGO ' +
          ' WHERE IV_VOLANTE = VO_VOLANTE ' +
            ' AND VO_VOLANTE = ' + SqlValue(Volante) +
            ' AND CP_CONPAGO = IV_CONPAGO ' +
            ' AND IV_ESTADO NOT IN (''X'', ''Z'') ' +
            ' AND CP_RETIVA = ''S'' ' +
              sWhere1 +
       ' GROUP BY ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO), CP_DENPAGO, VO_MONTOIVA, VO_MONTO ' +
          ' UNION ALL ' +
         ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
                ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)) CUENTA, ' +
                  SqlValue(IVA) + ' DESCRIPCION, ROUND(SUM(IV_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE1 ' +
           ' FROM SVO_VOLANTES, SIV_ITEMVOLANTE, SCP_CONPAGO ' +
          ' WHERE IV_VOLANTE = VO_VOLANTE ' +
            ' AND VO_VOLANTE = ' + SqlValue(Volante) +
            ' AND CP_CONPAGO = IV_CONPAGO ' +
            ' AND IV_ESTADO NOT IN (''X'', ''Z'') ' +
            ' AND CP_RETIVA = ''S'' ' +
              sWhere1 +
       ' GROUP BY ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, ' + SqlValue(FechaPago) + ', IV_CONPAGO)), VO_MONTOIVA, VO_MONTO ' +
          ' UNION ALL ' +
          'SELECT TO_CHAR(VG_CONPAGO) CONCEPTO, ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA,' +
                ' CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION, SUM(VG_IMPFACTURADO) IMPORTE1' +
           ' FROM SVO_VOLANTES, SVG_VOL_GENERICO, SCP_CONPAGO' +
          ' WHERE VG_VOLANTE = ' + SqlValue(Volante) +
            ' AND VG_VOLANTE = VO_VOLANTE ' +
            ' AND CP_CONPAGO = VG_CONPAGO' +
            ' AND VG_ESTADO NOT IN (''X'', ''Z'')' +
                  sWhere2 +
       ' GROUP BY VG_CONPAGO, CP_CTAPAGO, CP_DENPAGO ' +
          ' UNION ALL ' +
         ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
                ' ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA, CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION,' +
                ' ROUND(-SUM(VG_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
           ' FROM SVO_VOLANTES, SVG_VOL_GENERICO, SCP_CONPAGO ' +
          ' WHERE VG_VOLANTE = VO_VOLANTE ' +
            ' AND VO_VOLANTE = ' + SqlValue(Volante) +
            ' AND CP_CONPAGO = VG_CONPAGO ' +
            ' AND VG_ESTADO NOT IN (''X'', ''Z'') ' +
            ' AND CP_RETIVA = ''S'' ' +
              sWhere2 +
       ' GROUP BY CP_CTAPAGO, CP_DENPAGO, VO_MONTOIVA, VO_MONTO ' +
          ' UNION ALL ' +
         ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
                ' ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA, ' +
                  SqlValue(IVA) + ' DESCRIPCION, ROUND(SUM(VG_IMPFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
           ' FROM SVO_VOLANTES, SVG_VOL_GENERICO, SCP_CONPAGO ' +
          ' WHERE VG_VOLANTE = VO_VOLANTE ' +
            ' AND VO_VOLANTE = ' + SqlValue(Volante) +
            ' AND CP_CONPAGO = VG_CONPAGO ' +
            ' AND VG_ESTADO NOT IN (''X'', ''Z'') ' +
            ' AND CP_RETIVA = ''S'' ' +
              sWhere2 +
       ' GROUP BY CP_CTAPAGO, VO_MONTOIVA, VO_MONTO) ' +
     ' GROUP BY CONCEPTO, CUENTA, DESCRIPCION'

  else if EstadoVol = 'EAM' then
    sSql :=
      'SELECT TO_CHAR(CP_CONPAGO) CONCEPTO, ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA, ' +
            ' CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION, SUM(IF_CANTFACTURADA*IF_VALORFACTURADO) IMPORTE ' +
       ' FROM SVO_VOLANTES, SIF_ITEMFACTURAAMP, SCP_CONPAGO ' +
      ' WHERE IF_IDVOLANTE = ' + SqlValue(Volante) +
        ' AND IF_IDVOLANTE = VO_VOLANTE ' +
        ' AND CP_TITPAGO = ''EXAM PERIO'' ' +
        ' AND IF_ESTADO NOT IN (''X'', ''Z'') ' +
              sWhere3 +
      ' GROUP BY CP_CONPAGO, CP_CTAPAGO, CP_DENPAGO ' +
      ' UNION ALL ' +
     ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
            ' ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA, CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION,' +
            ' ROUND(-SUM(IF_VALORFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
       ' FROM SVO_VOLANTES, SIF_ITEMFACTURAAMP, SCP_CONPAGO ' +
      ' WHERE IF_IDVOLANTE = VO_VOLANTE ' +
        ' AND VO_VOLANTE = ' + SqlValue(Volante) +
        ' AND CP_CONPAGO = IF_CONCEPTO ' +
        ' AND CP_TITPAGO = ''EXAM PERIO'' ' +
        ' AND IF_ESTADO NOT IN (''X'', ''Z'') ' +
        ' AND CP_RETIVA = ''S'' ' +
          sWhere3 +
   ' GROUP BY CP_CTAPAGO, CP_DENPAGO, VO_MONTOIVA, VO_MONTO ' +
      ' UNION ALL ' +
     ' SELECT ' + SqlValue(IVA) + ' CONCEPTO, ' +
            ' ART.FNCL.CUENTA_PONERGUIONES(CP_CTAPAGO) CUENTA, ' +
              SqlValue(IVA) + ' DESCRIPCION, ROUND(SUM(IF_VALORFACTURADO)*VO_MONTOIVA/VO_MONTO,2) IMPORTE ' +
       ' FROM SVO_VOLANTES, SIF_ITEMFACTURAAMP, SCP_CONPAGO ' +
      ' WHERE IF_IDVOLANTE = VO_VOLANTE ' +
        ' AND VO_VOLANTE = ' + SqlValue(Volante) +
        ' AND CP_CONPAGO = IF_CONCEPTO ' +
        ' AND CP_TITPAGO = ''EXAM PERIO'' ' +
        ' AND IF_ESTADO NOT IN (''X'', ''Z'') ' +
        ' AND CP_RETIVA = ''S'' ' +
          sWhere3 +
   ' GROUP BY CP_CTAPAGO, VO_MONTOIVA, VO_MONTO';

  sSql := sSql +
    ' UNION ALL ' +
   ' SELECT TO_CHAR(IV_CONPAGO) CONCEPTO, ' +
          ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, IV_FECALTA, IV_CONPAGO)) CUENTA,  ' +
          ' CP_DENPAGO || ' + SqlValue(sDescr) + ' DESCRIPCION, ' +
          ' SUM(IV_IMPFACTURADO) IMPORTE ' +
     ' FROM ART.SIV_ITEMVOLANTE, ART.SCP_CONPAGO, ART.SVO_VOLANTES ' +
    ' WHERE IV_VOLANTE = VO_VOLANTE ' +
      ' AND VO_VOLANTE = ' + SqlValue(Volante) +
      ' AND CP_CONPAGO = IV_CONPAGO ' +
      ' AND IV_FECALTA > VO_FECHAPAGO ' +
      ' AND IV_FECALTA = '  + SqlValue(FechaPago) +
    ' GROUP BY IV_CONPAGO, ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(IV_SINIESTRO, IV_ORDEN, IV_RECAIDA, IV_FECALTA, IV_CONPAGO)), CP_DENPAGO';

  with GetQuery(sSql) do
  try
    while not EOF do
    begin
      if FieldByName('DESCRIPCION').AsString = IVA then
        begin
          sTipoLinea  := 'TAX';
          bRetieneGan := False;
        end
      else
        begin
          sTipoLinea  := 'ITEM';
          bRetieneGan := RetieneGan;
        end;

      Financial_APLineInsert(Sequence, FieldByName('Descripcion').AsString, FieldByName('Cuenta').AsString,
                             sTipoLinea, FieldByName('Importe').AsFloat, FieldByName('concepto').AsString,
                             bRetieneGan);
      Next;
    end;
  finally
    Free;
  end;
end;

function TfrmAdmInterfaces.Financial_GLGetCodeCombinationID(Cuenta: String): Integer;
var
  sSql: String;
  i, n: Integer;
begin
  n := 1;
  sSql := 'Segment1=''';

  for i := 1 to Length(Cuenta) do
    if StrMid(Cuenta, i, 1) = '-' then
    begin
    	Inc(n);
      sSql := sSql + ''' AND Segment' + Trim(IntToStr(n)) + '=''';
    end
    else
      sSql := sSql + StrMid(Cuenta, i, 1);

  sSql := sSql + '''';

  Result := dmFinancials.ValorSqlInteger('SELECT Code_Combination_ID FROM GL.GL_Code_Combinations WHERE ' + sSql);
end;

function TfrmAdmInterfaces.Get_VendorID(Codigo, TipoDoc: String): Integer;
var
  sSql: String;
begin;
  sSql :=
  	'SELECT Vendor_ID' +
     ' FROM PO.PO_VENDORS, APPLSYS.FND_LOOKUP_VALUES' +
    ' WHERE Global_Attribute4 = :p1' +
    	' AND LookUp_Type = ''JLAR_TAXID_TYPE''' +
      ' AND LookUp_Code = Global_Attribute10' +
      ' AND LANGUAGE = ''ESA''' +
      ' AND Meaning = :p2';

  Result := dmFinancials.ValorSqlIntegerEx(sSql, [Codigo, TipoDoc]);
end;

function TfrmAdmInterfaces.Get_LookUp_Code(Meaning: String): String;
var
  sSql: String;
begin;
  sSql :=
  	'SELECT LookUp_Code' +
     ' FROM APPLSYS.FND_LOOKUP_VALUES' +
    ' WHERE LookUp_Type = ''JLAR_TAXID_TYPE''' +
    	' AND Language = ''ESA''' +
      ' AND Meaning = :p1';

  Result := dmFinancials.ValorSqlEx(sSql, [Meaning]);
end;

{function TfrmAdmInterfaces.Get_Location_ID(Location_Code: String): Integer;
var
  sSql: String;
begin;
  sSql := 'SELECT Location_Id ' +
            'FROM HR_Locations ' +
           'WHERE Location_Code=' + SqlValue( Location_Code );

  Result := dmFinancials.ValorSqlInteger( sSql );
end;}

function TfrmAdmInterfaces.Get_DGI_Code(Category, Letter: String): String;
var
  sSql: String;
begin;
  sSql :=
  	'SELECT Dgi_Code' +
     ' FROM JL_AR_AP_TRX_DGI_CODES' +
    ' WHERE Trx_Category = :p1' +
    	' AND Trx_Letter = :p2';

  Result := dmFinancials.ValorSqlEx(sSql, [Category, Letter]);
end;

function TfrmAdmInterfaces.Obtener_CodProvinciaFinancial(DescrProvincia: String): String;
// dada la descripción de la provincia, devuelve el código de la misma del Financial
var
  sSql: String;
begin
  sSql :=
  	'SELECT LookUp_Code' +
     ' FROM JL.JL_AR_B_LOOKUP_CODES' +
    ' WHERE LookUp_Type = ''ARGENTINE_PROVINCE''' +
    	' AND UPPER(Displayed_Field) = :p1';

  Result := dmFinancials.ValorSqlEx(sSql, [DescrProvincia]);
end;

function TfrmAdmInterfaces.Financial_APGetSequence(): Integer;
begin
  Result := dmFinancials.GetSecNextVal('AP_Invoices_Interface_s');
end;

function TfrmAdmInterfaces.Get_DatosCuentaBancaria(TipoAcreedor: String; IdAcreedor: TTableId; CuitCuil: String;
																									 var TipoCuenta, NroCuenta, CBU1, CBU2, Sucursal: String): Boolean;
var
  sSql, FiltroAcreedor: String;
  TipoAcreedorOk, DatosCuentaBancariaOk: Boolean;
begin
  FiltroAcreedor := GetFiltroAcreedor(TipoAcreedor, IdAcreedor, CuitCuil, TipoAcreedorOk);

  if TipoAcreedorOk then
  begin
  	sSql :=
    	'SELECT CP_TIPOCUENTA, CP_NROCUENTA, CP_CBU1, CP_CBU2, SB_CODIGO SUCURSAL' +
       ' FROM ZSB_SUCURSALBANCO, CCP_CUENTAPAGO' +
      ' WHERE CP_FECHAALTAMCARGA IS NOT NULL' +
      	' AND CP_FECHAALTA IS NOT NULL' +
        ' AND CP_FECHABAJA IS NULL ' + 
        ' AND CP_IDSUCURSAL = SB_ID(+) ' + FiltroAcreedor;

    with GetQuery(sSql) do
    try
    	if IsEmpty then
      	DatosCuentaBancariaOk := False
      else
      begin
      	TipoCuenta := FieldByName('CP_TIPOCUENTA').AsString;
        NroCuenta  := FieldByName('CP_NROCUENTA').AsString;
        CBU1       := FieldByName('CP_CBU1').AsString;
        CBU2       := FieldByName('CP_CBU2').AsString;
        Sucursal   := FieldByName('SUCURSAL').AsString;

        DatosCuentaBancariaOk := True;
      end;
    finally
    	Free;
    end;
  end
  else
    DatosCuentaBancariaOk := False;

  Result := DatosCuentaBancariaOk;
end;

function TfrmAdmInterfaces.VendorExists(Codigo, TipoDoc: String): Boolean;
var
	sSql: String;
begin
	sSql :=
		'SELECT 1' +
     ' FROM PO.PO_VENDORS, APPLSYS.FND_LOOKUP_VALUES' +
    ' WHERE Global_Attribute4 = :p1' +
    	' AND LookUp_Type = ''JLAR_TAXID_TYPE''' +
      ' AND LookUp_Code = Global_Attribute10' +
      ' AND LANGUAGE = ''ESA''' +
      ' AND Meaning = :p2';
  VendorExists := dmFinancials.ExisteSqlEx(sSql, [Codigo, TipoDoc]);
end;

procedure TfrmAdmInterfaces.Do_GenerarListado_Comisiones(TipoListado: String; Fecha: TDateTime);
var
  sNombre: String;
  Reporte: TrptExcepcionesFNCLComisiones;
begin
  sNombre := 'rptExcepcionesFNCLComisiones' + TipoListado;
  Reporte := TrptExcepcionesFNCLComisiones(FindComponent(sNombre));

  if Assigned(Reporte) then
    Reporte.Free;

  with TrptExcepcionesFNCLComisiones.Create(Self) do
  begin
    Name := sNombre;
    Preparar(TipoListado, Fecha);
    Sleep(1000);   // para que le de tiempo al reporte a hacer el preview antes de que salga el próximo reporte
  end;
end;

procedure TfrmAdmInterfaces.Do_GenerarListado_Siniestros(TipoListado: String; Fecha: TDateTime; IdProceso: Integer);
var
  sNombre: String;
  Reporte: TrptExcepcionesFNCLILTP;
begin
  sNombre := 'rptExcepcionesFNCLILTP' + TipoListado;
  Reporte := TrptExcepcionesFNCLILTP(FindComponent(sNombre));

  if Assigned(Reporte) then
    Reporte.Free;

  with TrptExcepcionesFNCLILTP.Create(Self) do
  begin
    Name := sNombre;
    Preparar(TipoListado, Fecha, IdProceso);
    Sleep(1000);   // para que le de tiempo al reporte a hacer el preview antes de que salga el próximo reporte
  end;
end;

procedure TfrmAdmInterfaces.Financial_ExportarComisiones(EsVendedor: Boolean; Estado, FacturaNro, DescripcionFactura,
																												 Doc, DocGuiones: String; FechaCont: TDateTime; ImporteFactura, Comision,
                                                         Iva, Ganancias, OS, IB, RETIVA: Currency; IdFactura: TTableId;
                                                         FacturaTipo: String);
var
  sFacturaNro, sGrupoDePagos: String;
  nIdFactura, iSequence: Integer;
  dTotal: Currency;
begin
  MostrarEstado(Estado);

  iSequence     := Financial_APGetSequence;
  sGrupoDePagos := COMISIONES_LOOKUP;

  Financial_APHeaderInsert(SOURCE_NAME, iSequence, FechaCont,
                           DescripcionFactura, CUENTA_PASIVO_COM, ImporteFactura,
                           DocGuiones, FacturaNro, Get_TipoFactura(ImporteFactura, FacturaTipo),
                           sGrupoDePagos, 'CUIT', '',
                           '', False, '',
                           COMISIONES_GROUP, '', '',
                           '', FechaCont, '',
                           '', '', '',
                           '', '', '',
                           '', '', ART_EMPTY_ID,
                           IdFactura);

  Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                         'TAX', 0, '',
                         False);

  if Iva <> 0 then
    Financial_APLineInsert(iSequence, 'IVA - Comisiones Riesgo del Trabajo', CUENTA_PASIVO_CCCOM,
                           'ITEM', Iva, '',
                           False);

  if IdFactura = 0 then
    Financial_APLineInsert(iSequence, 'Comisiones Riesgo del Trabajo', CUENTA_PASIVO_CCCOM,
                           'ITEM', Comision, '',
                           False)
  else
    Financial_ConceptosComisionesInsert(IdFactura, iSequence, ImporteFactura - Iva);


  dTotal := -(Ganancias + OS + RETIVA + IB);
  if dTotal <> 0 then
    begin
      iSequence := Financial_APGetSequence;
      if IdFactura = 0 then
        nIdFactura := iSequence
      else
        nIdFactura := IdFactura;

      sFacturaNro := '0000-' + LPad(Trim(IntToStr(nIdFactura)), '0', 8);

      Financial_APHeaderInsert(SOURCE_NAME, iSequence, FechaCont,
                               'Retenciones', CUENTA_PASIVO_COM, dTotal,
                               DocGuiones, sFacturaNro, Get_TipoFactura(dTotal, 'R'),
                               sGrupoDePagos, 'CUIT', '',
                               '', False, '',
                               COMISIONES_GROUP, '', '',
                               '', FechaCont, '',
                               '', '', '',
                               '', '', '',
                               '', '', ART_EMPTY_ID,
                               IdFactura);

      Financial_APLineInsert(iSequence, 'Retenciones', CUENTA_PASIVO_CCCOM,
                             'ITEM', dTotal, '',
                             False);
    end;
end;

procedure TfrmAdmInterfaces.Financial_ExportarSiniestrosILTP(Estado, FacturaNro, DescripcionFactura,
                                                             Descripcion, DocGuiones, ConceptoPago,
                                                             TipoDoc, PagoIndependiente, Beneficiario,
                                                             Cuenta: String; Fecha, FechaAnt: TDateTime;
                                                             Importe: Currency; ActualEsFondo: Boolean; Siniestro,
                                                             Orden, Recaida, NroLiquidacion: Integer;
                                                             TipoEnvio: String; EsAjuste: Boolean; ImporteFondo,
                                                             ImporteCuenta: Extended; ActualizarDigFactura: Boolean; LookUp,
                                                             Group, TipoFondo, MetodoPago: String;
                                                             Banco: Integer);
var
  iSequence: Integer;
begin
  MostrarEstado(Estado);

  iSequence := Financial_APGetSequence;

  Financial_APHeaderInsert(SOURCE_NAME, iSequence, Fecha,
                           DescripcionFactura, CUENTA_PASIVO_ILT, Importe,
                           DocGuiones, FacturaNro, Get_TipoFactura(Importe, 'S'),
                           LookUp, TipoDoc, '',
                           '', EsAjuste, IIF(FechaAnt = 0, '', IIF(FechaAnt < StrToDate('31/12/2001'), '31/12/2001', DateToStr(FechaAnt))),
                           Group, '', PagoIndependiente,
                           Beneficiario, Fecha, Siniestro,
                           Orden, Recaida, NroLiquidacion,
                           'SLE', '', '',
                           TipoFondo, MetodoPago, Banco,
                           '');

  Financial_APLineInsert(iSequence, IIF(Descripcion <> '', Descripcion + '-', '') + DescripcionFactura, Cuenta,
                         'ITEM', ImporteCuenta, ConceptoPago,
                         False);

	if ActualEsFondo then
    Financial_APLineInsert(iSequence, IIF(Descripcion <> '', Descripcion + '-', '') + DescripcionFactura, CUENTA_FONDO,
                           'ITEM', ImporteFondo, ConceptoPago,
                           False);

  Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                         'TAX', 0, ConceptoPago,
                         False);

  if ActualizarDigFactura then
    Actualizar_ProxDigitoFactura_FNCL(Siniestro, Orden, Recaida, NroLiquidacion, 0, TipoEnvio);   // By Fede 08/03/2002
end;

procedure TfrmAdmInterfaces.Financial_ExportarOtrosPagos(Estado, FacturaNro, DescripcionFactura,
                                                         Descripcion, DocGuiones, ConceptoPago,
                                                         TipoDoc, Cuenta: String; Fecha,
                                                         FechaAnt: TDateTime; Importe: Currency; ImporteConRetencion,
                                                         ImporteSinRetencion: Extended; Grupo, CAI: String;
                                                         Siniestro, Orden, Recaida,
                                                         NroLiquid: Integer; Beneficiario, MetodoPago: String;
                                                         Banco: Integer; Group: String);
var
  iSequence: Integer;
begin
  MostrarEstado(Estado);

  iSequence := Financial_APGetSequence;

  Financial_APHeaderInsert(SOURCE_NAME, iSequence, Fecha,
                           DescripcionFactura, CUENTA_PASIVO_ILT, Importe,
                           DocGuiones, FacturaNro, Get_TipoFactura(Importe, 'S'),
                           Grupo, TipoDoc, '',
                           '', False, IIF(FechaAnt < StrToDate('31/12/2001'), '31/12/2001', DateToStr(FechaAnt)),
                           Group, CAI, Iif(ConceptoPago = '127', YES, ''),    // 127: TASAS DE JUSTICIA CAMARA FEDERAL
                           Beneficiario, Fecha, Siniestro,
                           Orden, Recaida, NroLiquid,
                           'SPR', '', '',
                           '', MetodoPago, Banco,
                           '');

  Financial_APLineInsert(iSequence, Descripcion + '-' + DescripcionFactura, Cuenta,
                         'ITEM', ImporteSinRetencion, ConceptoPago,
                         False);

  Financial_APLineInsert(iSequence, Descripcion + '-' + DescripcionFactura, Cuenta,
                         'ITEM', ImporteConRetencion, ConceptoPago,
                         True);

  Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                         'TAX', 0, ConceptoPago,
                         False);
end;

procedure TfrmAdmInterfaces.Financial_Comisiones(Fecha: TDateTime);
var
  FechaCont, FDesde, FHasta: TDateTime;
  sFacturaNro, DocGuiones, sDescripcionFactura, sEntVend, sSql: String;
  sEntidad, sEstado, sTipoListado, sMotivoError, Doc: String;
  sCodEntidad, sNombreEntidad, sCodVendedor, sNombreVendedor: String;
  bEsVendedor, bHayRegistros, bHuboErrores1, bHuboErrores4: Boolean;
begin
  MostrarEstado('Cuentas a Pagar: Comisiones ...');
  FDesde := FirstLastDayOfMonth(Fecha);
  FHasta := Fecha;

  dmFinancials.BeginTrans;
  try
    MostrarEstado('Cuentas a Pagar: Comisiones liquidadas a las entidades/vendedores...');

    bHuboErrores1 := False;
    bHuboErrores4 := False;
    Limpiar_TablaTemporalFactCom('1');
    Limpiar_TablaTemporalFactCom('4');

    // Comisiones liquidadas a la ENTIDAD / VENDEDOR
    sSql :=
      'SELECT VE_NOMBRE NOMBRE, VE_CUIT CUIT, VE_BENEFICIARIO BENEFICIARIO, ' +
             'SUM(LC_COMISION * (LF_MONTO /(LC_COMISION + LC_IVA))) COMISION, SUM(LC_IVA * (LF_MONTO /(LC_COMISION + LC_IVA))) IVA, ' +
             'SUM(LC_GANANCIAS * (LF_MONTO /(LC_COMISION + LC_IVA))) GANANCIAS, ' +
             'SUM(LC_OBRASOCIAL * (LF_MONTO /(LC_COMISION + LC_IVA))) OS, SUM(LC_INGBRUTOS * (LF_MONTO /(LC_COMISION + LC_IVA))) IB, ' +
             'SUM(LC_COMISIONNETA * (LF_MONTO /(LC_COMISION + LC_IVA))) NETO, ' +
             'SUM(LC_RETIVA * (LF_MONTO /(LC_COMISION + LC_IVA))) RETIVA, FC_FACTURANRO FACTURA, FC_FACTURATIPO FACTURATIPO, ' +
             'FC_FECHAFACTURA FFACTURA, ''Pago de Comisiones'' DESCRFACTURA, FC_ID IDFACTURA, FC_IMPORTE IMPORTEFACTURA, ' +
             'EN_CODBANCO ENTIDAD, VE_VENDEDOR VENDEDOR, DECODE(EN_MODOLIQ, ''02'', ''S'', ''06'', ''S'', ''N'') ESVENDEDOR ' +
        'FROM ART.CPV_PROVINCIAS, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XEN_ENTIDAD, XLC_LIQCOMISION, XLF_LIQFACTURA, XFC_FACTURA ' +
       'WHERE EN_ID = EV_IDENTIDAD ' +
         'AND VE_ID = EV_IDVENDEDOR ' +
         'AND EV_ID = FC_IDENTIDADVEND ' +
         'AND FC_ID = LF_IDFACTURA ' +
         'AND LC_ID = LF_IDLIQCOMISION ' +
         'AND VE_PROVINCIA = PV_CODIGO(+) ' +
         'AND FC_FECHAAPROBADO = :FECHA ' +
         'AND LF_FECHABAJA IS NULL ' +
    'GROUP BY VE_NOMBRE, VE_CUIT, VE_BENEFICIARIO, FC_FACTURANRO, FC_FACTURATIPO, FC_FECHAFACTURA, FC_ID, FC_IMPORTE, EN_CODBANCO, ' +
             'VE_VENDEDOR, EN_MODOLIQ ' +
    'ORDER BY ESVENDEDOR, VE_CUIT';

		with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc         := FieldByName('Cuit').AsString;
        DocGuiones  := PonerGuiones(Doc);
        FechaCont   := Fecha;
        bEsVendedor := (FieldByName('EsVendedor').AsString = 'S');
        sEntVend    := Iif(bEsVendedor, FieldByName('Vendedor').AsString, FieldByName('Entidad').AsString);

        if IsCuit(Doc) and VendorExists(DocGuiones, 'CUIT') then
        begin
        	sEstado             := 'Cuentas a Pagar: Comisiones (' + Iif(bEsVendedor, 'Vendedor', 'Entidad') + ' ' + sEntVend + ' ' + FieldByName('Nombre').AsString + ') ...';
          sFacturaNro         := FieldByName('Factura').AsString;
          sDescripcionFactura := FieldByName('DescrFactura').AsString;

          Financial_ExportarComisiones(bEsVendedor, sEstado, sFacturaNro, sDescripcionFactura,
                                       Doc, DocGuiones, FechaCont, FieldByName('ImporteFactura').AsCurrency,
                                       FieldByName('Comision').AsCurrency, FieldByName('Iva').AsCurrency, FieldByName('Ganancias').AsCurrency,
                                       FieldByName('OS').AsCurrency, FieldByName('IB').AsCurrency, FieldByName('RETIVA').AsCurrency, FieldByName('IdFactura').AsInteger,
                                       FieldByName('FacturaTipo').AsString);
        end
        else
        begin
          sMotivoError := 'Nro. de documento inválido';

          if bEsVendedor then
            begin
            	bHuboErrores4   := True;
              sTipoListado    := '4';
              sCodEntidad     := '';
              sNombreEntidad  := '';
							sCodVendedor    := sEntVend;
              sNombreVendedor := FieldByName('Nombre').AsString;
            end
          else
            begin
            	bHuboErrores1   := True;
              sTipoListado    := '1';
              sCodEntidad     := sEntVend;
              sNombreEntidad  := FieldByName('Nombre').AsString;
							sCodVendedor    := '';
              sNombreVendedor := '';
            end;

          Insert_ErroresExportacionComFNCL(Sesion.UserId, sTipoListado, sCodEntidad, sNombreEntidad, sCodVendedor, sNombreVendedor,
                                           'CUIT', Doc, FieldByName('Comision').AsCurrency, FieldByName('Iva').AsCurrency,
                                           FieldByName('Ganancias').AsCurrency, FieldByName('IB').AsCurrency,
                                           FieldByName('OS').AsCurrency, FieldByName('Neto').AsCurrency, sMotivoError);
        end;

        Next;
      end;
    finally
    	Free;
    end;


    MostrarEstado('Cuentas a Pagar: Comisiones liquidadas a Bancos...');
    sTipoListado := '1';

    // Comisiones liquidadas a BANCOS
    sSql :=
    	'SELECT LC_COMISION COMISION, LC_IVA IVA, LC_GANANCIAS GANANCIAS, LC_OBRASOCIAL OS, LC_INGBRUTOS IB,' +
      			' LC_COMISIONNETA NETO, LC_FECHALIQ FLIQ, TRUNC(LC_FECHAALTA) FALTA, LC_ID IDLIQ, LC_RETIVA RETIVA,' +
            ' ''Pago de Comisiones del Mes '' || TO_CHAR(LC_FECHALIQ, ''MM/YYYY'') DESCRFACTURA, EN_NOMBRE NOMBRE,' +
            ' LC_COMISION + LC_IVA IMPORTEFACTURA, EN_CUIT CUIT, EN_CODBANCO ENTIDAD, 0 IDFACTURA' +
       ' FROM XEN_ENTIDAD, XLC_LIQCOMISION' +
      ' WHERE EN_ID = LC_IDENTIDAD' +
      	' AND LC_FECHALIQ >= :p1' +
        ' AND LC_FECHALIQ <= :p2' +
        ' AND EN_FACTURA = ''N''' +
        ' AND LC_COMISIONNETA <> 0' +
        ' AND LC_ESTADO <> ''C''' +
        ' AND NOT EXISTS (SELECT 1 ' +
                          ' FROM XCP_CIERREPAGO ' +
                         ' WHERE CP_ID = LC_IDCIERREPAGO ' +
                           ' AND CP_EXPORTADOFNCL = ''S'')' +
   ' ORDER BY EN_CODBANCO';

		with GetQueryEx(sSql, [TDateTimeEx.Create(FDesde), TDateTimeEx.Create(FHasta)]) do
    try
      bHayRegistros := not Eof;

    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);
        FechaCont  := FieldByName('FLiq').AsDateTime;
        sEntidad   := FieldByName('Entidad').AsString;

        if VendorExists(DocGuiones, 'CUIT') then
        begin
        	sEstado             := 'Cuentas a Pagar: Comisiones (Entidad ' + sEntidad + ' ' + FieldByName('Nombre').AsString + ') ...';
          sFacturaNro         := StrRight('0000' + sEntidad, 4) + '-' + LPad(FieldByName('IdLiq').AsString, '0', 8);
          sDescripcionFactura := FieldByName('DescrFactura').AsString;

          Financial_ExportarComisiones(False, sEstado, sFacturaNro, sDescripcionFactura,
                                       Doc, DocGuiones, FechaCont, FieldByName('ImporteFactura').AsCurrency,
                                       FieldByName('Comision').AsCurrency, FieldByName('Iva').AsCurrency, FieldByName('Ganancias').AsCurrency,
                                       FieldByName('OS').AsCurrency, FieldByName('IB').AsCurrency, FieldByName('RETIVA').AsCurrency, FieldByName('IdFactura').AsInteger,
                                       'R');
        end
        else
        begin
        	bHuboErrores1 := True;

          sMotivoError := 'Nro. de documento inválido';

          Insert_ErroresExportacionComFNCL(Sesion.UserId, sTipoListado, sEntidad, FieldByName('Nombre').AsString, '', '',
                                           'CUIT', Doc, FieldByName('Comision').AsCurrency, FieldByName('Iva').AsCurrency,
                                           FieldByName('Ganancias').AsCurrency, FieldByName('IB').AsCurrency,
                                           FieldByName('OS').AsCurrency, FieldByName('Neto').AsCurrency, sMotivoError);
        end;

        Next;
      end;
    finally
    	Free;
    end;

    if bHuboErrores1 then
      Do_GenerarListado_Comisiones('1', Fecha);

    if bHuboErrores4 then
      Do_GenerarListado_Comisiones('4', Fecha);

    BeginTrans;
    try
      MostrarEstado('Cuentas a Pagar: Asientos Comisiones...');

      if FHasta = LastDayOfMonth(FHasta) then
        Do_GenerarAsiento_Comisiones(FDesde, FHasta, ART_EMPTY_ID, False);

      if bHayRegistros then
        begin
          sSql :=
            'UPDATE XCP_CIERREPAGO ' +
               'SET CP_EXPORTADOFNCL = ''S'' ' +
             'WHERE CP_ID IN (SELECT LC_IDCIERREPAGO ' +
                               'FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
                              'WHERE EN_ID = LC_IDENTIDAD ' +
                                'AND LC_FECHALIQ >= :p1 ' +
                                'AND LC_FECHALIQ <= :p2 ' +
                                'AND EN_FACTURA = ''N'' ' +
                                'AND LC_COMISIONNETA <> 0 ' +
                                'AND LC_ESTADO <> ''C'')';
          EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(FDesde), TDateTimeEx.Create(FHasta)]);
        end;

      CommitTrans;
    except
      on E: Exception do
      begin
        RollBack;
        dmFinancials.RollBack;
        if pbContinuar then
          ErrorMsg(E, 'Error al exportar Comisiones - Cierre Pago.');
        raise;
      end;
    end;

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Comisiones.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.Financial_SiniestrosILTP(Fecha: TDateTime; TipoEnvio: String);
var
  sNombreBanco, sFacturaNro, DocGuiones, sDescripcionFactura, sSql, sTipoFondo: String;
  sNumeroLiq, sPagoIndependiente, sEstado, sTipoListado, sMotivoError, Doc, sTipoDoc: String;
  bActualEsFondo, bHuboErrores: Boolean;
  dImporte, dFactorFondo, dImporteFondo, dImporteCuenta: Extended;
begin
  MostrarEstado('Cuentas a Pagar: Siniestros ...');

  dmFinancials.BeginTrans;
  try
    bHuboErrores := False;
    sTipoListado := '2';
    Limpiar_TablaTemporalFactLiq(sTipoListado);

    sSql :=
			'SELECT DECODE(UR_CUIT, NULL, EX_CUIT, UR_CUIT) CUIT, LE_SINIESTRO SINIESTRO, LE_ORDEN ORDEN, LE_RECAIDA RECAIDA, LE_NUMLIQUI NUMERO,' +
      			' LE_IMPORPERI IMPORTE, TJ_NOMBRE NOMBRE, ART.SIN.GET_MAXESFONDO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, LE_FAPROBADO) ESFONDO,' +
            ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, LE_FAPROBADO, CP_CONPAGO)) CUENTA,' +
            ' TJ_CUIL CUIL, CP_TIPO TIPO, CP_CONPAGO,' +
            ' ART.SIN.GET_PAGODIRECTO(LE_CONPAGO) PAGO_DIRECTO,' +
            ' INITCAP(NVL(NVL(CP_DESCRIPCIONCOMPLETA, CP_DESCRIPCION), CP_DENPAGO)) DESCRIPCION, ' +
            ' ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINCOMPLETO, EX_FECHARECEPCION FECHAANT,' +
            ' ART.CONT.IS_EMPRESAFONDO(EX_CUIT) ESEMPRESAFONDO, ART.DINERARIAS.GET_PERTENECECOMPENSACION(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, LE_NUMLIQUI) COMPENSA, ' +
            ' NVL(LE_CHEQUENOMBRE, ART.UTILES.IIF_COMPARA(''IN'', LE_TIPOLIQUI, ''DIW'', TJ_NOMBRE, DECODE(UR_CUIT, NULL, EM_NOMBRE, UR_NOMBRE))) BENEFICIARIO,' +
            ' ART.SIN.GET_MAXTIPOFONDO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, LE_FAPROBADO) TIPOFONDO, UR_CUIT, LE_METODOPAGO METODOPAGO, LE_IDBANCO BANCO,' +
            ' BA_NOMBRE NOMBREBANCO' +
			 ' FROM ZBA_BANCO, SUR_SEGURORETIRO, AEM_EMPRESA, ART.SCP_CONPAGO, CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ART.SLE_LIQUIEMPSIN' +
			' WHERE LE_SINIESTRO = EX_SINIESTRO' +
				' AND LE_ORDEN = EX_ORDEN' +
				' AND LE_RECAIDA = EX_RECAIDA' +
				' AND TJ_CUIL = EX_CUIL' +
        ' AND EX_CUIT = EM_CUIT' +
				' AND CP_CONPAGO = LE_CONPAGO' +
				' AND LE_IMPORPERI <> 0' +
				' AND LE_FAPROBADO = :p1' +
				' AND ((NVL(LE_ESTADO, '' '') = ''E'')' +
				 ' OR (NVL(LE_ESTADO, '' '') = ''X''' +
				' AND LE_FMODIF = LE_FAPROBADO)) ' +
        ' AND LE_CODSEGURORETIRO = UR_CODIGO(+)' +
        ' AND NVL(LE_IDBANCO, 3) = BA_ID';     // 3: BANCO DE LA PROVINCIA DE BUENOS AIRES

    with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        sSql :=
        	'SELECT ''Y''' +
           ' FROM DUAL' +
          ' WHERE :p1 IN (''5'', ''53'', ''55'', ''10'', ''13'', ''16'', ''78'', ''77'', ''98'', ''95'')';
        sPagoIndependiente := ValorSqlEx(sSql, [FieldByName('cp_ConPago').AsString]);
        if IsEmptyString(sPagoIndependiente) then
          sPagoIndependiente := 'N';

        bActualEsFondo := ((FieldByName('esfondo').AsString = 'S') and (FieldByName('EsEmpresaFondo').AsString = 'S'));   // By Fede 08/03/2002, NWK 03/09/2003
        dImporte       := FieldByName('Importe').AsCurrency;
        sTipoFondo     := FieldByName('tipofondo').AsString;

        if bActualEsFondo then
        begin
          dFactorFondo   := Obtener_FactorFondo(Fecha, sTipoFondo);
        	dImporteFondo  := RoundNumber(dImporte * dFactorFondo, 2);
          dImporteCuenta := dImporte - dImporteFondo;
        end
        else
        begin
        	dImporteFondo  := 0;
          dImporteCuenta := dImporte;
        end;

        sNumeroLiq          := IIF(FieldByName('Numero').AsInteger <= 99, LPad(FieldByName('Numero').AsString, '0', 2), FieldByName('Numero').AsString);
        sFacturaNro         := '0' + StrRight(FieldByName('Recaida').AsString, 1) + Lpad(FieldByName('Orden').AsString, '0', 2) + '-' + LPad(FieldByName('Siniestro').AsString, '0', Iif(length(FieldByName('Siniestro').AsString) <= 6, 6, 7)) + sNumeroLiq;
        sDescripcionFactura := FieldByName('SinCompleto').AsString + '-' + sNumeroLiq + ' ' + FieldByName('Tipo').AsString + ' ' + FieldByName('nombre').AsString;

        sNombreBanco := FieldByName('NOMBREBANCO').AsString;

        if (FieldByName('pago_directo').AsString = 'N') or not FieldByName('UR_CUIT').IsNull then
        begin
        	Doc        := FieldByName('Cuit').AsString;
          DocGuiones := PonerGuiones(Doc);
          sTipoDoc   := 'CUIT';

          if IsCuit(Doc) and VendorExists(DocGuiones, sTipoDoc) then
          begin
          	sEstado := 'Cuentas a Pagar: Siniestros ILT (' + Doc + ') ...';

            Financial_ExportarSiniestrosILTP(sEstado, sFacturaNro, sDescripcionFactura,
                                             FieldByName('Descripcion').AsString, DocGuiones, FieldByName('cp_ConPago').AsString,
                                             sTipoDoc, sPagoIndependiente, FieldByName('Beneficiario').AsString,
                                             FieldByName('Cuenta').AsString, Fecha, FieldByName('FechaAnt').AsDateTime,
                                             dImporte, bActualEsFondo, FieldByName('Siniestro').AsInteger,
                                             FieldByName('Orden').AsInteger, FieldByName('Recaida').AsInteger, FieldByName('Numero').AsInteger,
                                             TipoEnvio, False, dImporteFondo,
                                             dImporteCuenta, False, SINIESTROS_LOOKUP,
                                             SINIESTROS_GROUP + ' - ' + sNombreBanco, sTipoFondo, FieldByName('Metodopago').AsString,
                                             FieldByName('Banco').AsInteger);
          end
          else
          begin
          	bHuboErrores := True;

            if not IsCuit(Doc) then
            	sMotivoError := 'El CUIT es inválido'
            else
            	sMotivoError := 'Proveedor inexistente';

              Insert_ErroresExportacionLiqFNCL(Sesion.UserId, sTipoListado, FieldByName('Nombre').AsString, 'CUIT', Doc,
                                               FieldByName('SinCompleto').AsString, sMotivoError, FieldByName('Numero').AsInteger,
                                               dImporte, '');
          end;
        end
        else
        begin
        	Doc        := FieldByName('Cuil').AsString;
          DocGuiones := PonerGuiones(Doc);

          if StrMid(Doc, 11, 1) = '*' then
          	sTipoDoc := 'CUILPD'
          else
          	sTipoDoc := 'CUIL';

          if IsCuil(Doc) and VendorExists(DocGuiones, sTipoDoc) then
          begin
          	sEstado := 'Cuentas a Pagar: Siniestros ILT (' + Doc + ') ...';

            Financial_ExportarSiniestrosILTP(sEstado, sFacturaNro, sDescripcionFactura,
                                             FieldByName('Descripcion').AsString, DocGuiones, FieldByName('cp_ConPago').AsString,
                                             sTipoDoc, sPagoIndependiente, FieldByName('Beneficiario').AsString,
                                             FieldByName('Cuenta').AsString, Fecha, FieldByName('FechaAnt').AsDateTime,
                                             dImporte, bActualEsFondo, FieldByName('Siniestro').AsInteger,
                                             FieldByName('Orden').AsInteger, FieldByName('Recaida').AsInteger, FieldByName('Numero').AsInteger,
                                             TipoEnvio, False, dImporteFondo,
                                             dImporteCuenta, False, Iif(FieldByName('COMPENSA').AsString = 'S', SINIESTROSDOACREEDOR_LOOKUP, SINIESTROS_LOOKUP),
                                             Iif(FieldByName('COMPENSA').AsString = 'S', SINIESTROSDOACREEDOR_GROUP, SINIESTROS_GROUP + ' - ' + sNombreBanco), sTipoFondo, FieldByName('Metodopago').AsString,
                                             FieldByName('Banco').AsInteger);
          end
          else
        	begin
          	bHuboErrores := True;

            if not IsCuil(Doc) then
            	sMotivoError := 'El CUIL es inválido'
            else
            	sMotivoError := 'Proveedor inexistente';

            Insert_ErroresExportacionLiqFNCL(Sesion.UserId, sTipoListado, FieldByName('Nombre').AsString, 'CUIL', Doc,
                                             FieldByName('SinCompleto').AsString, sMotivoError, FieldByName('Numero').AsInteger,
                                             dImporte, '');
          end;
        end;

        Next;
      end;
    finally
    	Free;
    end;

    if bHuboErrores then
      Do_GenerarListado_Siniestros(sTipoListado, Fecha, 0);

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar ILT/ILP.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.Financial_SiniestrosOtrosPagos(Fecha: TDateTime; TipoEnvio: String);
var
  sProvinciaDescripc, sNombreAcr, sFacturaNro, sDescripcionFactura, sSql: String;
  sDocument, sDocum, sDoc, sTipoAcreedor, sEstado, sTipoListado, sMotivoError: String;
  sBeneficiario, Doc, sTipoDoc, sCuenta, sGrupo: String;
  bOK, bHuboErrores: Boolean;
  dImporteConRetencion, dImporteSinRetencion, dImporte: Extended;
  qry: TSDQuery;
begin
  MostrarEstado('Cuentas a Pagar: Otros Conceptos ...');

  dmFinancials.BeginTrans;
  try
    bHuboErrores := False;
    sTipoListado := '3';
    Limpiar_TablaTemporalFactLiq(sTipoListado);

    sSql :=
    	'SELECT REPLACE(DECODE(PR_ACREEDOR, ''BE'', EX_CUIL, PR_CUITCUIL), ''*'', ''0'') CUIT, PR_DELEGACION DELEGACION, ' +
            ' PR_SINIESTRO SINIESTRO, PR_ORDEN ORDEN, PR_RECAIDA RECAIDA, PR_NUMPAGO NUMERO, PR_IMPORPAGO IMPORTE,' +
            ' PR_IMPORTECONRETENCION IMPORTECONRETENCION, TJ_NOMBRE NOMBRE, CP_TITPAGO TIPO,' +
            ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, PR_FAPROBADO, CP_CONPAGO)) CUENTA,' +
            ' CP_DENPAGO DESCRIPCION, PR_ACREEDOR, PR_PRESTADORSECUENCIA, PR_PRESTADORMUTUAL, NVL(PR_CAI, '''') CAI,' +
            ' SE_SECTOR, ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINCOMPLETO,' +
            ' PR_CUITCUIL DOCUMENT, CP_CONPAGO, ART.SIN.OMSCIE10_ESFONDO(EX_DIAGNOSTICOOMS) ESFONDO,' +
            ' EX_FECHARECEPCION FECHAANT, PR_CHEQUENOMBRE, PR_METODOPAGO METODOPAGO, PR_IDBANCO BANCO,' +
            ' BA_NOMBRE NOMBREBANCO' +
       ' FROM ZBA_BANCO, CTJ_TRABAJADOR, ART.SCP_CONPAGO, ART.SEX_EXPEDIENTES, ART.SPR_PAGOEXPESIN, ART.USE_USUARIOS' +
			' WHERE PR_SINIESTRO = EX_SINIESTRO' +
        ' AND PR_ORDEN = EX_ORDEN' +
        ' AND PR_RECAIDA = EX_RECAIDA' +
        ' AND TJ_CUIL(+) = EX_CUIL' +
        ' AND PR_CONPAGO = CP_CONPAGO' +
        ' AND PR_APROBADO = SE_USUARIO(+)' +
        ' AND PR_IMPORPAGO <> 0' +
        ' AND PR_FAPROBADO = :p1' +
        ' AND ((NVL(PR_ESTADO, '' '') = ''E'')' +
         ' OR (NVL(PR_ESTADO, '' '') = ''X''' +
        ' AND PR_FMODIF = PR_FAPROBADO))' +
        ' AND NVL(PR_IDBANCO, 3) = BA_ID';     // 3: BANCO DE LA PROVINCIA DE BUENOS AIRES

    with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        sTipoAcreedor := FieldByName('pr_Acreedor').AsString;

        if sTipoAcreedor = 'DI' then         // Delegación del interior Provincia Aseguradoras
        begin
        	sTipoDoc := 'CIDG';
          sDocum   := FieldByName('Delegacion').AsString;
          sDoc     := sDocum;
        end
        else if AreIn(sTipoAcreedor, ['TA', 'BE']) then    // Trabajador Afiliado
        begin
        	sTipoDoc := 'CUIL';
          sDocum   := FieldByName('Cuit').AsString;
          sDoc     := PonerGuiones(sDocum);
        end
        else
        begin
        	sTipoDoc := 'CUIT';
          sDocum   := FieldByName('Cuit').AsString;
          sDoc     := PonerGuiones(sDocum);
        end;

        Doc       := FieldByName('Cuit').AsString;
        sDocument := FieldByName('document').AsString;
        dImporte  := FieldByName('Importe').AsCurrency;

        if sTipoAcreedor = 'CA' then    // Centro Asistencial
        	sSql :=
          	'SELECT 1' +
             ' FROM CPR_PRESTADOR ' +
            ' WHERE CA_CLAVE = ' + SqlValue(Doc) +
            	' AND CA_SECUENCIA = NVL(' + SqlInteger(FieldByName('pr_PrestadorSecuencia').AsInteger, True) + ', 1)' +
              ' AND CA_PRESTADORMUTUAL = ' + SqlValue(FieldByName('pr_PrestadorMutual').AsString) +
              ' AND (CA_FECHABAJA IS NULL' +
                ' OR CA_FECHABAJA > ' + SqlValue(Fecha) + ')'
        else if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then    // Otros Acreedores - Persona Autorizada
        	sSql :=
          	'SELECT 1' +
             ' FROM SPA_PAGOACRE' +
            ' WHERE PA_CUITCUIL = ' + SqlValue(Doc) +
            	' AND (PA_FECHABAJA IS NULL' +
              	' OR PA_FECHABAJA > ' +  SqlValue(Fecha) + ')';

        if (sTipoAcreedor = 'CA') or (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then    // Centro Asistencial - Otros Acreedores - Persona Autorizada
        begin
        	if ExisteSql(sSql) then
          	bOK := True
          else
          begin
          	bOK := False;
            sMotivoError := 'Acreedor inexistente o dado de baja.';
          end;
        end
        else
        	bOK := True;

        if bOK then
        begin
        	if sTipoDoc = 'CUIT' then
          begin
          	if not IsCuit(sDocum) then
            begin
            	bOK := False;
              sMotivoError := 'El CUIT es inválido.';
            end;
          end
          else if sTipoDoc = 'CUIL' then
          begin
          	if not IsCuil(sDocum) then
            begin
            	bOK := False;
              sMotivoError := 'El CUIL es inválido.';
            end;
          end
        end;

        if VendorExists(sDoc, sTipoDoc) then
        begin
        	sEstado := 'Cuentas a Pagar: Otros Conceptos (' + Doc + ' ' + sDoc + ') ...';

          if sTipoAcreedor = 'CA' then         // Centro Asistencial
          	sSql :=
            	'SELECT NVL(CA_RETENCAJAMED, '') RETENCIONCAJAMED, NVL(RT_RETENCAJAMED, 0) PORCRETENCIONCAJAMED,' +
              			' NVL(RT_PROVINCIA, '') PROVINCIA, PV_DESCRIPCION PROVINCIADESCR, CA_DESCRIPCION NOMBRE' +
               ' FROM CPR_PRESTADOR, CRT_RETENCIONES, CPV_PROVINCIAS' +
              ' WHERE CA_CLAVE = ' + SqlValue(Doc) +
              	' AND CA_SECUENCIA = NVL(' + SqlInteger(FieldByName('pr_PrestadorSecuencia').AsInteger, True) + ', 1)' +
                ' AND CA_PRESTADORMUTUAL = ' + SqlValue(FieldByName('pr_PrestadorMutual').AsString) +
                ' AND ART.UTILES.IIF_CHAR(CA_PROVINCIA, ''50'', ''2'', CA_PROVINCIA) = RT_PROVINCIA(+)' +
                ' AND ART.UTILES.IIF_CHAR(CA_PROVINCIA, ''50'', ''2'', CA_PROVINCIA) = PV_CODIGO(+)'
          else if (sTipoAcreedor = 'EM') or (sTipoAcreedor = 'FF') then    // Empresa Afiliada - Fondo Fijo
          	sSql :=
            	'SELECT PV_DESCRIPCION PROVINCIADESCR, EM_NOMBRE NOMBRE' +
               ' FROM ADC_DOMICILIOCONTRATO, ACO_CONTRATO, AEM_EMPRESA, CPV_PROVINCIAS' +
              ' WHERE EM_CUIT = ' + SqlValue(sDocument) +
              	' AND CO_IDEMPRESA = EM_ID' +
                ' AND CO_CONTRATO = GET_VULTCONTRATO(EM_CUIT)' +
                ' AND CO_CONTRATO = DC_CONTRATO' +
                ' AND DC_TIPO = ''L''' +
                ' AND ART.UTILES.IIF_CHAR(DC_PROVINCIA, ''50'', ''2'', DC_PROVINCIA) = PV_CODIGO(+)'
          else if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then    // Otros Acreedores - Persona Autorizada
          	sSql :=
            	'SELECT NVL(PA_RETENCAJAMED,'') RETENCIONCAJAMED, NVL(RT_RETENCAJAMED, 0) PORCRETENCIONCAJAMED,' +
              			' NVL(RT_PROVINCIA, '') PROVINCIA, PV_DESCRIPCION PROVINCIADESCR, PA_DENOMINA NOMBRE' +
               ' FROM SPA_PAGOACRE, CRT_RETENCIONES, CPV_PROVINCIAS' +
              ' WHERE PA_CUITCUIL = ' + SqlValue(Doc) +
              	' AND ART.UTILES.IIF_CHAR(PA_PROVINCIA, ''50'', ''2'', PA_PROVINCIA) = RT_PROVINCIA(+)' +
                ' AND ART.UTILES.IIF_CHAR(PA_PROVINCIA, ''50'', ''2'', PA_PROVINCIA) = PV_CODIGO(+)'
          else if AreIn(sTipoAcreedor, ['BE', 'TA']) then    // Trabajador Afiliado
          	sSql :=
            	'SELECT PV_DESCRIPCION PROVINCIADESCR, TJ_NOMBRE NOMBRE' +
               ' FROM CTJ_TRABAJADOR, CPV_PROVINCIAS' +
              ' WHERE TJ_CUIL = ' + SqlValue(sDocument) +
              	' AND ART.UTILES.IIF_CHAR(TJ_PROVINCIA, ''50'', ''2'', TJ_PROVINCIA) = PV_CODIGO(+)'
          else if sTipoAcreedor = 'DI' then    // Delegación del interior Provincia Aseguradoras
          	sSql :=
            	'SELECT PV_DESCRIPCION PROVINCIADESCR, LG_NOMBRE NOMBRE' +
               ' FROM DLG_DELEGACIONES, CPV_PROVINCIAS' +
              ' WHERE LG_CODIGO = ' + SqlValue(FieldByName('Delegacion').AsString) +
              	' AND ART.UTILES.IIF_CHAR(LG_PROVINCIA, ''50'', ''2'', LG_PROVINCIA) = PV_CODIGO(+)';

          qry := GetQuery(sSql);
          try
          	if qry.Eof then
              begin
              	sProvinciaDescripc := '';
                sBeneficiario      := '';
              end
            else
            	sProvinciaDescripc := qry.FieldByName('ProvinciaDescr').AsString;

              if not FieldByName('pr_ChequeNombre').IsNull then
                sBeneficiario := FieldByName('pr_ChequeNombre').AsString
              else
                sBeneficiario := qry.FieldByName('nombre').AsString;

                  (*if (sTipoAcreedor = 'CA') or (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then
                    begin
                      if qry.Eof then
                        sRetenCajaMed := ''
                      else
                        sRetenCajaMed := FieldByName('RetencionCajaMed').AsString;

                      if sRetenCajaMed = 'S' then
                        begin
                          sCodigoRetencionesVarias := LPad( qry.FieldByName('Provincia').AsString, '0', 2 );
                          RetencionMed             := qry.FieldByName('PorcRetencionCajaMed').Value;
                        end
                      else
                        begin
                          sCodigoRetencionesVarias := '';
                          RetencionMed             := ''
                        end
                    end
                  else
                    begin
                      sCodigoRetencionesVarias := '';
                      RetencionMed             := '';
                    end;*)
          finally
          	qry.Free;
          end;

          if (FieldByName('se_Sector').AsString = 'LIQUI') or (FieldByName('se_Sector').AsString = 'REINTPM') or (FieldByName('se_Sector').AsString = 'AMED') then
          	sGrupo := OTROSPAGOS_LOOKUP
          else
          	sGrupo := SINIESTROS_LOOKUP;

          sFacturaNro         := '1' + StrRight(FieldByName('Recaida').AsString, 1) + Lpad(FieldByName('Orden').AsString, '0', 2) + '-' + LPad(FieldByName('Siniestro').AsString, '0', Iif(length(FieldByName('Siniestro').AsString) <= 6, 6, 7)) + LPad(FieldByName('Numero').AsString, '0', 3);
          sDescripcionFactura := FieldByName('SinCompleto').AsString + '-' + LPad(FieldByName('Numero').AsString, '0', 2) + ' O/C ' + FieldByName('Tipo').AsString + ' ' + FieldByName('nombre').AsString;
          sCuenta             := FieldByName('Cuenta').AsString;

          dImporteSinRetencion := dImporte - FieldByName('ImporteConRetencion').AsCurrency;
          dImporteConRetencion := FieldByName('ImporteConRetencion').AsCurrency;

          Financial_ExportarOtrosPagos(sEstado, sFacturaNro, sDescripcionFactura,
                                       FieldByName('Descripcion').AsString, sDoc, FieldByName('cp_ConPago').AsString,
                                       sTipoDoc, FieldByName('Cuenta').AsString, Fecha,
                                       FieldByName('FechaAnt').AsDateTime, dImporte, dImporteConRetencion,
                                       dImporteSinRetencion, sGrupo, FieldByName('CAI').AsString,
                                       FieldByName('Siniestro').AsInteger, FieldByName('Orden').AsInteger, FieldByName('Recaida').AsInteger,
                                       FieldByName('Numero').AsInteger, sBeneficiario, FieldByName('Metodopago').AsString,
                                       FieldByName('Banco').AsInteger, OTROSPAGOS_GROUP + ' - ' + FieldByName('NombreBanco').AsString);
        end;

        if not bOK then
        begin
        	bHuboErrores := True;

          if sTipoAcreedor = 'CA' then         // Centro Asistencial
          	sSql :=
            	'SELECT CA_DESCRIPCION' +
               ' FROM CPR_PRESTADOR' +
              ' WHERE CA_CLAVE = ' + SqlValue(sDocument) +
              	' AND CA_SECUENCIA = NVL(' + SqlInteger(FieldByName('pr_PrestadorSecuencia').AsInteger, True) + ', 1)' +
                ' AND CA_PRESTADORMUTUAL = ' + SqlValue(FieldByName('pr_PrestadorMutual').AsString)
          else if (sTipoAcreedor = 'EM') or (sTipoAcreedor = 'FF') then    // Empresa Afiliada - Fondo Fijo
          	sSql :=
            	'SELECT EM_NOMBRE' +
               ' FROM AEM_EMPRESA' +
              ' WHERE EM_CUIT = ' + SqlValue(sDocument)
          else if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then    // Otros Acreedores - Persona Autorizada
          	sSql :=
            	'SELECT PA_DENOMINA' +
               ' FROM SPA_PAGOACRE' +
              ' WHERE PA_CUITCUIL = ' + SqlValue(sDocument)
          else if AreIn(sTipoAcreedor, ['TA', 'BE']) then    // Trabajador Afiliado
          	sSql :=
            	'SELECT TJ_NOMBRE' +
               ' FROM CTJ_TRABAJADOR' +
              ' WHERE TJ_CUIL = ' + SqlValue(sDocument)
          else if sTipoAcreedor = 'DI' then    // Delegación del interior Provincia Aseguradoras
          	sSql :=
            	'SELECT LG_NOMBRE' +
               ' FROM DLG_DELEGACIONES' +
              ' WHERE LG_CODIGO = ' + SqlValue(FieldByName('Delegacion').AsString);

          sNombreAcr := ValorSql(sSql);

          Insert_ErroresExportacionLiqFNCL(Sesion.UserId, sTipoListado, sNombreAcr, sTipoDoc, sDocum,
                                           FieldByName('SinCompleto').AsString, sMotivoError, FieldByName('Numero').AsInteger,
                                           dImporte, sTipoAcreedor);
        end;

        Next;
      end;
    finally
    	Free;
    end;

    if bHuboErrores then
      Do_GenerarListado_Siniestros(sTipoListado, Fecha, 0);

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Otros Conceptos.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.Financial_SiniestrosCompensacionDeuda(IdProceso: Integer; TipoEnvio: String);
var
  sNumeroLiq, sNroCartaDoc, sFacturaNro, DocGuiones, sDescripcionFactura, sSql: String;
  sEstado, sTipoListado, sMotivoError, Doc, sTipoDoc: String;
  bActualEsFondo, bHuboErrores: Boolean;
  dTotal, dImporte, dFactorFondo, dImporteFondo, dImporteCuenta: Extended;
begin
  MostrarEstado('Cuentas a Pagar: Compensación Deuda Siniestros ...');

  dmFinancials.BeginTrans;
  try
    bHuboErrores := False;
    sTipoListado := '5';
    Limpiar_TablaTemporalFactLiq(sTipoListado);

    sTipoDoc     := 'CUIT';

    sSql :=
    	'SELECT EX_CUIT CUIT, SLE.LE_SINIESTRO SINIESTRO, SLE.LE_ORDEN ORDEN, SLE.LE_RECAIDA RECAIDA,' +
      			' SLE.LE_NUMLIQUI NUMERO, SLE.LE_IMPORPERI IMPORTE, TJ_NOMBRE NOMBRE,' +
            ' ART.SIN.GET_MAXESFONDO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, LE_FAPROBADO) ESFONDO,' +
            ' ART.CONT.IS_EMPRESAFONDO(EX_CUIT) ESEMPRESAFONDO,' +
            ' ART.SIN.GET_MAXTIPOFONDO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, LE_FAPROBADO) TIPOFONDO,' +
            ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, SLE.LE_FAPROBADO, CP_CONPAGO)) CUENTA,' +
            ' ART.FNCL.TIPO(SLE.LE_CONPAGO) TIPO, ART.FNCL.DESCRIPCION(LE_CONPAGO, SLE.LE_TIPOLIQUI) DESCRIPCION,' +
            ' ART.AFILIACION.GET_NOMBREEMPRESA(EX_CUIT),' +
            ' ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINCOMPLETO, V_FECHA, CP_CONPAGO,' +
            ' LE_FAPROBADO' +
       ' FROM SCP_CONPAGO, CTJ_TRABAJADOR, SEX_EXPEDIENTES, SLE_LIQUIEMPSIN SLE, SLE_LIQPENDIENTESDEUDA SLEDEUDA,' +
       			' V_CED_ESTADODEUDA' +
      ' WHERE V_ID = :p1' +
        ' AND SLEDEUDA.LE_IDCOMPENSACION = V_ID' +
        ' AND SLEDEUDA.LE_CUIT = ART.AFILIACION.GET_CUITEMPRESA(V_CONTRATO)' +
        ' AND SLEDEUDA.LE_SINIESTRO = SLE.LE_SINIESTRO' +
        ' AND SLEDEUDA.LE_ORDEN = SLE.LE_ORDEN' +
        ' AND SLEDEUDA.LE_RECAIDA = SLE.LE_RECAIDA' +
        ' AND SLEDEUDA.LE_NUMLIQUI = SLE.LE_NUMLIQUI' +
        ' AND SLE.LE_IMPORPERI <> 0' +
        ' AND SLEDEUDA.LE_SINIESTRO = EX_SINIESTRO' +
        ' AND SLEDEUDA.LE_ORDEN = EX_ORDEN' +
        ' AND SLEDEUDA.LE_RECAIDA = EX_RECAIDA' +
        ' AND CP_CONPAGO = SLE.LE_CONPAGO' +
        ' AND TJ_CUIL = EX_CUIL';

		with GetQueryEx(sSql, [IdProceso]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        bActualEsFondo := ((FieldByName('esfondo').AsString = 'S') and (FieldByName('EsEmpresaFondo').AsString = 'S'));   // By Fede 08/03/2002, NWK 03/09/2003
        dImporte       := FieldByName('Importe').AsCurrency;

        if bActualEsFondo then
        begin
          dFactorFondo   := Obtener_FactorFondo(FieldByName('le_faprobado').AsDateTime, FieldByName('tipofondo').AsString);
        	dImporteFondo  := RoundNumber(dImporte * dFactorFondo, 2);
          dImporteCuenta := dImporte - dImporteFondo;
        end
        else
        begin
        	dImporteFondo  := 0;
          dImporteCuenta := dImporte;
        end;

        Doc        := FieldByName('Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);

        if IsCuit(Doc) and VendorExists(DocGuiones, sTipoDoc) then
        begin
        	sEstado             := 'Cuentas a Pagar: Compensación liquidaciones (' + Doc + ') ...';
          sNumeroLiq          := IIF(FieldByName('Numero').AsInteger <= 99, LPad(FieldByName('Numero').AsString, '0', 2), FieldByName('Numero').AsString);
          sFacturaNro         := '0' + StrRight(FieldByName('Recaida').AsString, 1) + Lpad(FieldByName('Orden').AsString, '0', 2) + '-' + LPad(FieldByName('Siniestro').AsString, '0', Iif(length(FieldByName('Siniestro').AsString) <= 6, 6, 7)) + sNumeroLiq;
          sDescripcionFactura := FieldByName('SinCompleto').AsString + '-' + LPad(FieldByName('Numero').AsString, '0', 2) + ' Comp. ' + FieldByName('Tipo').AsString + ' ' + FieldByName('nombre').AsString;

          Financial_ExportarSiniestrosILTP(sEstado, sFacturaNro, sDescripcionFactura,
                                           FieldByName('Descripcion').AsString, DocGuiones, FieldByName('cp_ConPago').AsString,
                                           sTipoDoc, '', '',
                                           FieldByName('Cuenta').AsString, FieldByName('v_Fecha').AsDateTime, 0,
                                           dImporte, bActualEsFondo, FieldByName('Siniestro').AsInteger,
                                           FieldByName('Orden').AsInteger, FieldByName('Recaida').AsInteger, FieldByName('Numero').AsInteger,
                                           TipoEnvio, False, dImporteFondo,
                                           dImporteCuenta, False, SINIESTROSCOMPENSACION_LOOKUP,
                                           SINIESTROSCOMPENSACION_GROUP, '', '',
                                           ART_EMPTY_ID);
        end
        else
        begin
        	bHuboErrores := True;

          if not IsCuit(Doc) then
          	sMotivoError := 'El CUIT es inválido'
          else
          	sMotivoError := 'Proveedor inexistente';

          Insert_ErroresExportacionLiqFNCL(Sesion.UserId, sTipoListado, FieldByName('Nombre').AsString, sTipoDoc, Doc,
                                           FieldByName('SinCompleto').AsString, sMotivoError, FieldByName('Numero').AsInteger,
                                           dImporte, '');
        end;

        Next;
      end;
    finally
    	Free;
    end;

    // notas de crédito (total de la deuda por empresa)
    sSql :=
    	'SELECT V_FECHA, EM_CUIT CUIT, -V_TOTAL IMPORTE, V_NROCARTADOC NROCARTADOC' +
       ' FROM ACO_CONTRATO, AEM_EMPRESA, V_CED_ESTADODEUDA' +
      ' WHERE CO_IDEMPRESA = EM_ID' +
      	' AND CO_CONTRATO = V_CONTRATO' +
        ' AND V_ID = :p1' +
        ' AND V_TOTAL <> 0';

		with GetQueryEx(sSql, [IdProceso]) do
    try
      dTotal := 0;
    	while not Eof do
      begin
      	Doc        := FieldByName('Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);

        if IsCuit(Doc) and VendorExists(DocGuiones, sTipoDoc) then
        begin
        	sEstado             := 'Cuentas a Pagar: Compensación liquidaciones N.C. (' + Doc + ') ...';
          sNroCartaDoc        := FieldByName('NroCartaDoc').AsString;
          sFacturaNro         := '0001-' + Lpad(StrMid(sNroCartaDoc, 5, 8), '0', 8);
          sDescripcionFactura := Doc + ' Compensación ' + sNroCartaDoc;

          dImporte := FieldByName('Importe').AsCurrency;
          dTotal   := dTotal + dImporte;

          Financial_ExportarSiniestrosILTP(sEstado, sFacturaNro, sDescripcionFactura,
                                           '', DocGuiones, '',
                                           sTipoDoc, '', '',
                                           CUENTA_COMPENSACION, FieldByName('v_Fecha').AsDateTime, 0,
                                           dImporte, False, 0,
                                           0, 0, 0,
                                           TipoEnvio, False, 0,
                                           dImporte, False, SINIESTROSCOMPENSACION_LOOKUP,
                                           SINIESTROSCOMPENSACION_GROUP, '', '',
                                           ART_EMPTY_ID);
        end;

        Next;
      end;
    finally
    	Free;
    end;

    if dTotal <> 0 then
      begin
      	Doc        := cNroCuitPROVARTCOMPENS;
        DocGuiones := PonerGuiones(Doc);
        sTipoDoc   := 'CUIL';

        if IsCuit(Doc) and VendorExists(DocGuiones, sTipoDoc) then
          begin
            dTotal              := -dTotal;
            sEstado             := 'Cuentas a Pagar: Compensación liquidaciones N.C. (' + Doc + ') ...';
            sNroCartaDoc        := '';
            sFacturaNro         := '0001-' + Lpad(IntToStr(IdProceso), '0', 8);
            sDescripcionFactura := 'Pago F817-Compensación Nro. ' + IntToStr(IdProceso);

            Financial_ExportarSiniestrosILTP(sEstado, sFacturaNro, sDescripcionFactura,
                                             '', DocGuiones, '',
                                             sTipoDoc, YES, 'BAPRO MEDIOS DE PAGO S.A.',
                                             CUENTA_COMPENSACION, DBDate(), 0,
                                             dTotal, False, 0,
                                             0, 0, 0,
                                             TipoEnvio, False, 0,
                                             dTotal, False, SINIESTROSCOMPENSACION_LOOKUP,
                                             SINIESTROSCOMPENSACION_GROUP, '', '',
                                             ART_EMPTY_ID);
          end;
      end;

    sSql := 'UPDATE ZCO_COMPENSACION ' +
               'SET CO_FECHAINTERFASE = SYSDATE ' +
             'WHERE CO_ID = :IdProceso ' +
               'AND CO_FECHAINTERFASE IS NULL';
    EjecutarSqlSTEx(sSql, [IdProceso]);

    if bHuboErrores then
      Do_GenerarListado_Siniestros(sTipoListado, 0, IdProceso);

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Compensación Deuda Siniestros.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.Financial_SiniestrosPrestacionesMedicas(Fecha: TDateTime);
var
  sTipoComprobante, sProvinciaDescripc, sNombreAcreedor, sTipoFact, sGrupo: String;
  sSource, sEstadoVol, sCuenta, sFacturaNro, sDescripcionFactura, sSql: String;
  sTieneSiniestros, sDestinatario, sCodProvincia, sEstado, Doc, sTipoDoc: String;
  sDescripcionDebito, sDebitoNro, sTipoFactura: String;
  iSequence, iVolante: Integer;
  bRetieneGan: Boolean;
  dMonto, dMontoDebito, dMontoPercepcion, dImporte: Extended;
  FechaPago: TDateTime;
begin
  MostrarEstado('Cuentas a Pagar: Prestaciones Médicas ...');

  dmFinancials.BeginTrans;
  try
    sSql :=
    	'SELECT VO_VOLANTE VOLANTE, CA_CLAVE DOCUMENT, VO_AJUSTE, VO_FECHAFACTURA, VO_FACTURATIPO TIPO,' +
      			' VO_FACTURAESTABLE ESTABLE, VO_FACTURANRO NUMERO, VO_MONTO IMPORTE, VO_NOTADEBITO NOTADEBITO,' +
            ' VO_MONTOBONI BONIFICACION, CA_DESCRIPCION NOMBRE, VO_ESTADO ESTADO, CA_IDENTIFICADOR PRESTADOR,' +
            ' CA_ASISTENCIAL PRESTADOR_ASIST, VO_DESTINATARIO DESTINATARIO, NVL(TB_ESPECIAL1, ''FC'') TCOMPROBANTE,' +
            ' VO_MONTOPERCEPCION, VO_MONTODEBITO, NVL(SUBSTR(VO_OBSERVACIONDEBITO, 1, 240), ''Debitado por error de facturación'') VO_OBSERVACIONDEBITO, ' +
            ' CA_PROVINCIA, VO_DELEGACION, NVL(VO_CAI, '''') CAI, VO_FECHAPAGO FECHAPAGO' +
       ' FROM SVO_VOLANTES, CPR_PRESTADOR, CTB_TABLAS' +
      ' WHERE VO_FECHAPAGO = :p1' +
      	' AND VO_MONTO <> 0' +
        ' AND VO_ESTADO IN (''E'', ''EG'', ''EM'', ''EAM'', ''EAG'')' +
        ' AND VO_PRESTADOR = CA_IDENTIFICADOR' +
        ' AND TB_CLAVE(+) = ''TCOMP''' +
        ' AND TB_CODIGO(+) = CA_TIPOCOMPROBANTE' +
      ' UNION ALL' +
     ' SELECT VO_VOLANTE VOLANTE, CA_CLAVE DOCUMENT, VO_AJUSTE, VO_FECHAFACTURA, ''X'' TIPO,' +
      			' TO_CHAR(MAX(IV_NUMPAGO)) ESTABLE, TO_CHAR(VO_VOLANTE) NUMERO, SUM(IV_IMPFACTURADO) IMPORTE, NULL NOTADEBITO,' +
            ' NULL BONIFICACION, CA_DESCRIPCION NOMBRE, VO_ESTADO ESTADO, CA_IDENTIFICADOR PRESTADOR,' +
            ' CA_ASISTENCIAL PRESTADOR_ASIST, VO_DESTINATARIO DESTINATARIO, NVL(TB_ESPECIAL1, ''FC'') TCOMPROBANTE,' +
            ' NULL VO_MONTOPERCEPCION, NULL VO_MONTODEBITO, NULL VO_OBSERVACIONDEBITO, CA_PROVINCIA, VO_DELEGACION,' +
            ' NVL(VO_CAI, '''') CAI, MIN(IV_FECALTA) FECHAPAGO' +
       ' FROM SIV_ITEMVOLANTE, SVO_VOLANTES, CPR_PRESTADOR, CTB_TABLAS' +
      ' WHERE IV_FECALTA = :p1' +
      	' AND VO_MONTO <> 0' +
        ' AND VO_ESTADO IN (''E'', ''EG'', ''EM'', ''EAM'', ''EAG'')' +
        ' AND VO_PRESTADOR = CA_IDENTIFICADOR' +
        ' AND TB_CLAVE(+) = ''TCOMP''' +
        ' AND TB_CODIGO(+) = CA_TIPOCOMPROBANTE' +
        ' AND IV_VOLANTE = VO_VOLANTE' +
        ' AND IV_FECALTA > VO_FECHAPAGO' +
      ' GROUP BY VO_VOLANTE, CA_CLAVE, VO_AJUSTE, VO_FECHAFACTURA, VO_FACTURATIPO,' +
               ' CA_DESCRIPCION, VO_ESTADO, CA_IDENTIFICADOR,' +
               ' CA_ASISTENCIAL, VO_DESTINATARIO, TB_ESPECIAL1,' +
               ' CA_PROVINCIA, VO_DELEGACION, VO_CAI ' +
     ' HAVING MIN(IV_SINIESTRO) < ' + SqlValue(MIN_SINIESTRO_GOB) + ' AND MAX(IV_SINIESTRO) > ' + SqlValue(MIN_SINIESTRO_GOB);

		with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha), TDateTimeEx.Create(Fecha)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        sCodProvincia := FieldByName('ca_provincia').AsString;
        sDestinatario := FieldByName('destinatario').AsString;
        dImporte      := FieldByName('Importe').AsCurrency;

        if sDestinatario = 'M' then
        begin
        	sTipoDoc := 'IDPRES';
          Doc      := FieldByName('document').AsString + ' ' + FieldByName('prestador_asist').AsString;
          sCuenta  := CUENTA_PASIVO_PM;
        end
        else
        begin
        	sTipoDoc := 'ARTID';
          Doc      := FieldByName('document').AsString + ' ' + FieldByName('prestador').AsString;
          sCuenta  := CUENTA_PASIVO_ILT;
        end;

        if VendorExists(Doc, sTipoDoc) then
        begin
        	iVolante   := FieldByName('volante').AsInteger;
          sEstadoVol := FieldByName('estado').AsString;
          FechaPago  := FieldByName('fechapago').AsDateTime;

          sEstado    := 'Cuentas a Pagar: Liquidación (' + IntToStr(iVolante) + ') ...';

          if sdestinatario = 'M' then
          begin
          	sGrupo             := PRESTMEDICASMUTUAL_LOOKUP;
            bRetieneGan        := False;
            sTipoFact          := 'M';
            sNombreAcreedor    := MUTUAL;
            sSource            := SOURCE_NAME + ' MUTUAL';
            sProvinciaDescripc := '';
          end
          else
          begin
            if AreIn(sEstadoVol, ['EAM', 'EAG']) then
            	sGrupo := MEDICINALABORAL_LOOKUP
            else
            	sGrupo := PRESTMEDICAS_LOOKUP;

            sTipoFact := FieldByName('tipo').AsString;

            bRetieneGan := True;
            
            sNombreAcreedor := FieldByName('nombre').AsString;
            sSource         := SOURCE_NAME;

            sSql :=
            	'SELECT PV_DESCRIPCION' +
               ' FROM CPR_PRESTADOR, CPV_PROVINCIAS' +
              ' WHERE CA_IDENTIFICADOR = :p1' +
              	' AND ART.UTILES.IIF_CHAR(CA_PROVINCIA, ''50'', ''2'', CA_PROVINCIA) = PV_CODIGO(+)';
            sProvinciaDescripc := ValorSqlEx(sSql, [FieldByName('prestador').AsInteger]);
          end;

          sTipoComprobante    := FieldByName('tcomprobante').AsString + ' ' + sTipoFact;
          sFacturaNro         := LPad(FieldByName('estable').AsString, '0', 4) + '-' + LPad(FieldByName('Numero').AsString, '0', 8);
          sDescripcionFactura := Doc + ' - ' + sNombreAcreedor + ' Factura: ' + sFacturaNro;

          if (sEstadoVol = 'E') or (sEstadoVol = 'EM') then
          	sTieneSiniestros := 'S'
          else       // estado = EG, EAM
          	sTieneSiniestros := 'N';

          if FieldByName('vo_ajuste').IsNull then
          	sTipoFactura := IIF(dImporte < 0, 'NC ' + sTipoFact, sTipoComprobante)
          else
          	sTipoFactura := 'DV ' + sTipoFact;

          MostrarEstado(sEstado);

          iSequence := Financial_APGetSequence;

          Financial_APHeaderInsert(sSource, iSequence, Fecha,
                                   sDescripcionFactura, sCuenta, dImporte,
                                   Doc, sFacturaNro, sTipoFactura,
                                   sGrupo, sTipoDoc, sTieneSiniestros,
                                   iVolante, True, '',
                                   PRESTMEDICAS_GROUP, FieldByName('CAI').AsString, '',
                                   '', FieldByName('vo_FechaFactura').AsDateTime, '',
                                   '', '', '',
                                   '', '', '',
                                   '', '', ART_EMPTY_ID,
                                   '');

          Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                                 'TAX', 0, '',
                                 False);

          dMontoPercepcion := FieldByName('vo_montopercepcion').AsCurrency;
          if dMontoPercepcion <> 0 then
          	Financial_APLineInsert(iSequence, 'Percepción de Ingresos Brutos', '01-136417-000-' + LPad(sCodProvincia, '0', 2) + '-0000-0000-0000',
                                   'ITEM', dMontoPercepcion, '',
                                   False);

          dMontoDebito := FieldByName('vo_montodebito').AsCurrency;
          if dMontoDebito <> 0 then
          	Financial_APLineInsert(iSequence, FieldByName('vo_observaciondebito').AsString, CUENTA_DEBVS,
                                   'ITEM', dMontoDebito, '',
                                   False);

          Financial_VolanteInsert(True, bRetieneGan, sEstadoVol,
                                  iVolante, iSequence, sNombreAcreedor,
                                  sFacturaNro, '', FechaPago);

          if not FieldByName('notadebito').IsNull then
          begin
          	if (sEstadoVol = 'E') or (sEstadoVol = 'EM') then
            	sSql :=
              	'SELECT SUM(ND_MONTO)' +
                 ' FROM MND_NOTADEBITO' +
                ' WHERE ND_VOLANTE = :p1'
            else if AreIn(sEstadoVol, ['EG', 'EAG']) then
            	sSql :=
              	'SELECT SUM(ND_MONTO)' +
                 ' FROM MNG_NOTADEBITOGEN' +
                ' WHERE NG_VOLANTE = :p1'
            else if sEstadoVol = 'EAM' then
            	sSql :=
              	'SELECT SUM(ND_MONTO)' +
                 ' FROM MND_NOTADEBITOAMP' +
                ' WHERE ND_IDVOLANTE = :p1';

            dMonto := ValorSqlExtendedEx(sSql, [iVolante]);

            sDebitoNro         := '0000-' + LPad(FieldByName('notadebito').AsString, '0', 8);
            sDescripcionDebito := Doc + ' - ' + sNombreAcreedor + ' - Crédito ' + FieldByName('notadebito').AsString + ' para aplicar a Factura ' + sFacturaNro;

            iSequence := Financial_APGetSequence;

            Financial_APHeaderInsert(sSource, iSequence, Fecha,
                                     sDescripcionDebito, sCuenta, dMonto,
                                     Doc, sDebitoNro, 'NC ' + sTipoFact,
                                     sGrupo, sTipoDoc, sTieneSiniestros,
                                     iVolante, False, '',
                                     PRESTMEDICAS_GROUP, FieldByName('CAI').AsString, '',
                                     '', FieldByName('vo_FechaFactura').AsDateTime, '',
                                     '', '', '',
                                     '', '', '',
                                     '', '', ART_EMPTY_ID,
                                     '');

            Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                                   'TAX', 0, '',
                                   False);

            if dMontoDebito <> 0 then
            	Financial_APLineInsert(iSequence, FieldByName('vo_observaciondebito').AsString, CUENTA_DEBVS,
                                     'ITEM', -dMontoDebito, '',
                                     False);

            Financial_VolanteInsert(False, bRetieneGan, sEstadoVol,
                                    iVolante, iSequence, sNombreAcreedor,
                                    sFacturaNro, sDebitoNro, FechaPago);

            if not FieldByName('bonificacion').IsNull then
            	Financial_APLineInsert(iSequence, 'BONIFICACIONES Y DESCUENTOS otorgados por ' + sNombreAcreedor + ' sobre la factura ' + sFacturaNro, CUENTA_BONIFICACION,
                                     'ITEM', FieldByName('bonificacion').AsCurrency, '',
                                     bRetieneGan);
          end;
        end;

        Next;
      end;
    finally
    	Free;
    end;

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
  		dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Prestaciones Médicas.');
      raise;
    end;
  end;
end;

function TfrmAdmInterfaces.Financial_SiniestILTP_CantidadReg(Fecha: TDateTime): Integer;
var
  sSql: String;
begin
  sSql :=
  	'SELECT COUNT(*)' +
     ' FROM SLE_LIQUIEMPSIN' +
    ' WHERE LE_FAPROBADO = :p1' +
    	' AND LE_IMPORPERI <> 0' +
      ' AND ((NVL(LE_ESTADO, '' '') = ''E'')' +
       ' OR (NVL(LE_ESTADO, '' '') = ''X''' +
      ' AND LE_FMODIF = LE_FAPROBADO))';		// APROBADA

  Result := ValorSqlIntegerEx(sSql, [TDateTimeEx.Create(Fecha)]);
end;

function TfrmAdmInterfaces.Financial_SiniestOtrosPagos_CantidadReg(Fecha: TDateTime): Integer;
var
  sSql: String;
begin
  sSql :=
  	'SELECT COUNT(*)' +
     ' FROM SPR_PAGOEXPESIN' +
    ' WHERE PR_FAPROBADO = :p1'  +
    	' AND PR_IMPORPAGO <> 0' +
      ' AND ((NVL(PR_ESTADO, '' '') = ''E'')' +
       ' OR (NVL(PR_ESTADO, '' '') = ''X''' +
      ' AND PR_FMODIF = PR_FAPROBADO))';		// APROBADA

  Result := ValorSqlIntegerEx(sSql, [TDateTimeEx.Create(Fecha)]);
end;

function TfrmAdmInterfaces.Financial_SiniestCompenDeuda_CantidadReg(IdProceso: Integer): Integer;
var
  sSql: String;
begin
  sSql :=
  	'SELECT COUNT(*)' +
     ' FROM SLE_LIQUIEMPSIN SLE, SLE_LIQPENDIENTESDEUDA SLEDEUDA' +
    ' WHERE SLEDEUDA.LE_IDCOMPENSACION = :p1' +
    	' AND SLEDEUDA.LE_SINIESTRO = SLE.LE_SINIESTRO' +
      ' AND SLEDEUDA.LE_ORDEN = SLE.LE_ORDEN' +
      ' AND SLEDEUDA.LE_RECAIDA = SLE.LE_RECAIDA' +
      ' AND SLEDEUDA.LE_NUMLIQUI = SLE.LE_NUMLIQUI' +
      ' AND SLE.LE_IMPORPERI <> 0';

  Result := ValorSqlIntegerEx(sSql, [IdProceso]);
end;

function TfrmAdmInterfaces.Financial_SiniestPrestMedic_CantidadReg(Fecha: TDateTime): Integer;
var
  sSql: String;
begin
  sSql :=
  	'SELECT COUNT(*)' +
     ' FROM SVO_VOLANTES' +
    ' WHERE VO_FECHAPAGO = :p1' +
    	' AND VO_MONTO <> 0' +
      ' AND '''' || VO_ESTADO IN (''E'', ''EG'', ''EM'', ''EAM'', ''EAG'')';

  Result := ValorSqlIntegerEx(sSql, [TDateTimeEx.Create(Fecha)]);
end;
                                                    
function TfrmAdmInterfaces.Financial_ProveedoresEntidades(Fecha: TDateTime): Boolean;
var
  sNombreEntidad, sTipoAcreedor, Doc, DocGuiones, sEntidad, sSql, sTipoListado: String;
  sMotivoError, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal: String;
  bDatosCuentaBancaria, bResult, bOk: Boolean;
  IdAcreedor: TTableId;
begin
  bResult := False;
  MostrarEstado('Proveedores: Entidades ...');

  sTipoListado := '1';
  Limpiar_TablaTemporalProv(sTipoListado);

  sSql :=
    'SELECT DISTINCT EN_CUIT, EN_CODBANCO, EN_NOMBRE, EN_INGRESOSBRUTOS, EN_GANANCIAS, EN_BENEFICIARIO, ' +
           'DECODE(EN_CALLE, NULL, SUBSTR(EN_DOMICILIO, 1, INSTR(EN_DOMICILIO, '' LOC:'') - 1), ' +
           'ART.UTILES.ARMAR_DOMICILIO(EN_CALLE, EN_NUMERO, EN_PISO, EN_DEPARTAMENTO, NULL)) DOMICILIO, ' +
           'NVL(EN_LOCALIDAD, UPPER(SUBSTR(EN_DOMICILIO, INSTR(EN_DOMICILIO, ''LOC:'') + 5, ' +
           'INSTR(EN_DOMICILIO, ''CP:'') - INSTR(EN_DOMICILIO, ''LOC:'') - 6))) LOCALIDAD, ' +
           'NVL(EN_CPOSTAL, SUBSTR(EN_DOMICILIO, INSTR(EN_DOMICILIO, ''CP:'') + 4, ' +
           'INSTR(EN_DOMICILIO, ''PROV:'') - INSTR(EN_DOMICILIO, ''CP:'') - 5)) CPOSTAL, EN_CODAREATELEFONOS, ' +
           'EN_TELEFONOS, EN_ID, PV_DESCRIPCION, TB_DESCRIPCION SITUACIONIVA ' +
      'FROM CTB_TABLAS, CPV_PROVINCIAS, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XFC_FACTURA ' +
     'WHERE EN_ID = EV_IDENTIDAD ' +
       'AND EV_ID  = FC_IDENTIDADVEND ' +
       'AND EN_PROVINCIA = PV_CODIGO(+) ' +
       'AND FC_FECHAAPROBADO = :p1 ' +
       'AND EN_MODOLIQ IN (''01'', ''04'') ' +
       'AND TB_CLAVE(+) = ''SIVA'' ' +
       'AND TB_CODIGO(+) = EN_SITIVA ' +
     'ORDER BY EN_CODBANCO';

  with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('en_Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);
        sEntidad   := FieldByName('en_CodBanco').AsString;

        bOK := False;
        if sEntidad = '' then
        	sMotivoError := 'La entidad no existe'
        else if Doc = '' then
        	sMotivoError := 'El CUIT es nulo'
        else if not IsCuit( Doc ) then
        	sMotivoError := 'El CUIT es inválido'
        else
        	bOK := True;

        if bOK then
        begin
        	sNombreEntidad := FieldByName('en_Nombre').AsString;
          MostrarEstado('Proveedores: Entidades (' + sEntidad + ' ' + sNombreEntidad + ') ...');

          sTipoAcreedor := 'PR';     // Productores
          sSql := 'SELECT VE_ID ' +
                    'FROM XVE_VENDEDOR ' +
                   'WHERE VE_VENDEDOR IN (''1'', ''0'') ' +
                     'AND VE_CUIT = :Cuit ' +
                     'AND VE_FECHABAJA IS NULL';
          IdAcreedor := ValorSqlIntegerEx(sSql, [FieldByName('en_cuit').AsString], ART_EMPTY_ID);
          if IdAcreedor = ART_EMPTY_ID then
          	bDatosCuentaBancaria := False
          else
          	bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta,
            																								sCBU1, sCBU2, sSucursal);

          Insert_AC_AC_B_Vendors_Int(sNombreEntidad, COMISIONES_TERMS, COMISIONES_LOOKUP,
                                     CURRENCY_CODE, Iif(FieldByName('SituacionIVA').IsNull, IVA_EXENTO, FieldByName('SituacionIVA').AsString), 'CUIT',
                                     Doc, DocGuiones, FieldByName('en_IngresosBrutos').AsString,
                                     '', YES, '0',
                                     '', NO_RETIENE, YES,
                                     '0', '', Iif(NVL(FieldByName('en_Ganancias').AsString, '99') = '0', GAN_HONORARIOS, Iif(NVL(FieldByName('en_Ganancias').AsString, '99') = '20', GAN_LOCACION, NO_RETIENE)),
                                     YES, NO_RETIENE_MINUSC, 0,
                                     '', NO_RETIENE_MINUSC, NO,
                                     'R', StrLeft(NVL(FieldByName('en_Beneficiario').AsString, sNombreEntidad), 80), YES,
                                     StrLeft(FieldByName('Domicilio').AsString, 35), StrMid(FieldByName('Domicilio').AsString, 36, 35), StrLeft(FieldByName('Localidad').AsString, 25),
                                     '', FieldByName('CPostal').AsString, FieldByName('pv_Descripcion').AsString,
                                     COUNTRY_CODE, FieldByName('en_CodAreaTelefonos').AsString, StrLeft(FieldByName('en_Telefonos').AsString, 15),
                                     '', '', DGI_SERVICIOS,
                                     Financial_GLGetCodeCombinationID(CUENTA_PASIVO_COM), Financial_GLGetCodeCombinationID(CUENTA_ANTICIPO), COMISIONES_LOOKUP,
                                     DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('pv_Descripcion').AsString), sTipoCuenta,
                                     sNroCuenta, sSucursal, sCBU1,
                                     sCBU2, NO, '',
                                     '', '', '',
                                     bDatosCuentaBancaria, 'N');

          if not VendorExists(DocGuiones, 'CUIT') then
          	bResult := True;
        end
        else
        	Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, sEntidad, sNombreEntidad,
                                        '', '', '', '', 'CUIT', Doc, sMotivoError);

        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg( E, 'Error al exportar Proveedores Entidades.' );
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

function TfrmAdmInterfaces.Financial_ProveedoresVendedores(Fecha: TDateTime): Boolean;
var
  sTipoAcreedor, Doc, DocGuiones, sEntidad, sSql, sTipoListado, sMotivoError: String;
  sNombreVendedor, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal: String;
  bDatosCuentaBancaria, bResult, bOk: Boolean;
begin
  bResult := False;
  MostrarEstado('Proveedores: Vendedores ...');

  sTipoListado := '4';
  Limpiar_TablaTemporalProv(sTipoListado);

  sSql :=
    'SELECT DISTINCT VE_CUIT, VE_VENDEDOR, VE_NOMBRE, VE_INGRESOSBRUTOS, VE_GANANCIAS, VE_BENEFICIARIO, EN_CODBANCO, ' +
           'EN_NOMBRE, DECODE(VE_CALLE, NULL, UPPER(SUBSTR(VE_DOMICILIO, 1, INSTR(VE_DOMICILIO, '' LOC:'') - 1)), ' +
           'ART.UTILES.ARMAR_DOMICILIO(VE_CALLE, VE_NUMERO, VE_PISO, VE_DEPARTAMENTO, NULL)) DOMICILIO, ' +
           'NVL(VE_LOCALIDAD, UPPER(SUBSTR(VE_DOMICILIO, INSTR(VE_DOMICILIO, ''LOC:'') + 5, ' +
           'INSTR(VE_DOMICILIO, ''CP:'') - INSTR(VE_DOMICILIO, ''LOC:'') - 6))) LOCALIDAD, ' +
           'NVL(VE_CPOSTAL, SUBSTR(VE_DOMICILIO, INSTR(VE_DOMICILIO, ''CP:'') + 4, ' +
           'INSTR(VE_DOMICILIO, ''PROV:'') - INSTR(VE_DOMICILIO, ''CP:'') - 5)) CPOSTAL, VE_CODAREATELEFONOS, ' +
           'VE_TELEFONOS, PV_DESCRIPCION, VE_ID, TB_DESCRIPCION SITUACIONIVA ' +
      'FROM CTB_TABLAS, CPV_PROVINCIAS, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XEN_ENTIDAD, XFC_FACTURA ' +
     'WHERE EN_ID = EV_IDENTIDAD ' +
       'AND VE_ID = EV_IDVENDEDOR ' +
       'AND EV_ID = FC_IDENTIDADVEND ' +
       'AND VE_PROVINCIA = PV_CODIGO(+) ' +
       'AND FC_FECHAAPROBADO = :p1 ' +
       'AND EN_MODOLIQ IN (''02'', ''06'') ' +
       'AND TB_CLAVE(+) = ''SIVA'' ' +
       'AND TB_CODIGO(+) = VE_SITIVA ' +
     'ORDER BY EN_CODBANCO, VE_VENDEDOR';

	with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('ve_Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);
        sEntidad   := FieldByName('en_CodBanco').AsString;

        bOK := False;
        if Doc = '' then
        	sMotivoError := 'El CUIT es nulo'
        else if not IsCuit(Doc) then
        	sMotivoError := 'El CUIT es inválido'
        else
        	bOK := True;

        if bOK then
        begin
        	sNombreVendedor := FieldByName('ve_Nombre').AsString;
          MostrarEstado('Proveedores: Vendedores (' + sEntidad + '/' + FieldByName('ve_Vendedor').AsString + ' ' + sNombreVendedor + ') ...');

          sTipoAcreedor := 'PR';     // Productores
          bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, FieldByName('ve_Id').AsInteger, '', sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal);

          Insert_AC_AC_B_Vendors_Int(sNombreVendedor, COMISIONES_TERMS, COMISIONES_LOOKUP,
                                     CURRENCY_CODE, Iif(FieldByName('SituacionIVA').IsNull, IVA_EXENTO, FieldByName('SituacionIVA').AsString), 'CUIT',
                                     Doc, DocGuiones, FieldByName('ve_IngresosBrutos').AsString,
                                     '', YES, '0',
                                     '', NO_RETIENE, YES,
                                     '0', '', Iif(NVL(FieldByName('ve_Ganancias').AsString, '99') = '0', GAN_HONORARIOS, Iif(NVL(FieldByName('ve_Ganancias').AsString, '99') = '20', GAN_LOCACION, NO_RETIENE)),
                                     YES, NO_RETIENE_MINUSC, 0,
                                     '', NO_RETIENE_MINUSC, NO,
                                     'R', StrLeft(NVL(FieldByName('ve_Beneficiario').AsString, sNombreVendedor), 80), YES,
                                     StrLeft(FieldByName('Domicilio').AsString, 35), StrMid(FieldByName('Domicilio').AsString, 36, 35), StrLeft(FieldByName('Localidad').AsString, 25),
                                     '', FieldByName('CPostal').AsString, FieldByName('pv_Descripcion').AsString,
                                     COUNTRY_CODE, FieldByName('ve_CodAreaTelefonos').AsString, StrLeft(FieldByName('ve_Telefonos').AsString, 15),
                                     '', '', DGI_SERVICIOS,
                                     Financial_GLGetCodeCombinationID(CUENTA_PASIVO_COM), Financial_GLGetCodeCombinationID(CUENTA_ANTICIPO), COMISIONES_LOOKUP,
                                     DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('pv_Descripcion').AsString), sTipoCuenta,
                                     sNroCuenta, sSucursal, sCBU1,
                                     sCBU2, NO, '',
                                     '', '', '',
                                     bDatosCuentaBancaria, 'N');

          if not VendorExists(DocGuiones, 'CUIT') then
          	bResult := True;
        end
        else
        	Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, sEntidad, FieldByName('en_Nombre').AsString,
                                        FieldByName('ve_Vendedor').AsString, sNombreVendedor, '', '',
                                        'CUIT', Doc, sMotivoError);

        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg(E, 'Error al exportar Proveedores Vendedores.');
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

function TfrmAdmInterfaces.Financial_ProveedoresILTP(Fecha: TDateTime): Boolean;
var
  sNombreEmpresa, sTipoAcreedor, Doc, DocGuiones, sSql, sTipoListado, sBeneficiario: String;
  sMotivoError, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal, sDomicilio, sNombreTrab: String;
  sTipoDoc: String;
  bDatosCuentaBancaria, bResult, bOk: Boolean;
  IdAcreedor: TTableId;
begin
  bResult := False;
  MostrarEstado('Proveedores: Empresas siniestradas ...');

  sTipoListado := '2';
  Limpiar_TablaTemporalProv(sTipoListado);

  sSql :=
  	'SELECT DECODE(UR_CUIT, NULL, EM_CUIT, UR_CUIT) CUIT, EM_ID, DECODE(UR_CUIT, NULL, EM_NOMBRE, UR_NOMBRE) NOMBRE, ' +
          ' DECODE(UR_CUIT, NULL, DC_CALLE, UR_CALLE) CALLE, DECODE(UR_CUIT, NULL, DC_NUMERO, UR_NUMERO) NUMERO, ' +
          ' DECODE(UR_CUIT, NULL, DC_PISO, UR_PISO) PISO, DECODE(UR_CUIT, NULL, DC_DEPARTAMENTO, UR_DEPARTAMENTO) DEPARTAMENTO, ' +
          ' DECODE(UR_CUIT, NULL, DC_LOCALIDAD, UR_LOCALIDAD) LOCALIDAD, DECODE(UR_CUIT, NULL, DC_CPOSTAL, UR_CPOSTAL) CPOSTAL,' +
    			' DECODE(UR_CUIT, NULL, DC_CODAREATELEFONOS, NULL) CODAREATELEFONOS, DECODE(UR_CUIT, NULL, DC_TELEFONOS, UR_TELEFONOS) TELEFONOS, ' +
          ' TJ_NOMBRE, TJ_CUIL, TJ_ID, LE_TIPOLIQUI, LE_CHEQUENOMBRE, LE_CONPAGO,' +
          ' PV_DESCRIPCION, ART.SIN.GET_PAGODIRECTO(LE_CONPAGO) PAGO_DIRECTO, UR_CUIT ' +
     ' FROM SUR_SEGURORETIRO, CTJ_TRABAJADOR, ADC_DOMICILIOCONTRATO, ACO_CONTRATO, AEM_EMPRESA, SEX_EXPEDIENTES, SLE_LIQUIEMPSIN,' +
     			' CPV_PROVINCIAS' +
    ' WHERE LE_FAPROBADO = :p1' +
      ' AND LE_IMPORPERI <> 0' +
      ' AND LE_SINIESTRO = EX_SINIESTRO' +
      ' AND LE_ORDEN = EX_ORDEN' +
      ' AND LE_RECAIDA = EX_RECAIDA' +
      ' AND ((NVL(LE_ESTADO, '' '') = ''E'')' +
       ' OR (NVL(LE_ESTADO, '' '') = ''X''' +
      ' AND LE_FMODIF = LE_FAPROBADO))' +		// APROBADA
      ' AND EM_CUIT = EX_CUIT' +
      ' AND TJ_CUIL = EX_CUIL' +
      ' AND CO_IDEMPRESA = EM_ID' +
      ' AND CO_CONTRATO = GET_VULTCONTRATO(EM_CUIT)' +
      ' AND CO_CONTRATO = DC_CONTRATO' +
      ' AND DC_TIPO = ''L''' +
      ' AND DECODE(UR_CUIT, NULL, DC_PROVINCIA, UR_PROVINCIA) = PV_CODIGO ' +
      ' AND LE_CODSEGURORETIRO = UR_CODIGO(+)';

	with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        if (FieldByName('pago_directo').AsString = 'N') or not FieldByName('UR_CUIT').IsNull then
        begin
        	Doc        := FieldByName('Cuit').AsString;
          DocGuiones := PonerGuiones(Doc);

          bOK := False;
          if Doc = '' then
          	sMotivoError := 'El CUIT es nulo'
          else if not IsCuit(Doc) then
          	sMotivoError := 'El CUIT es inválido'
          else
          	bOK := True;

          if bOK then
          begin
          	sNombreEmpresa := FieldByName('Nombre').AsString;
            MostrarEstado('Proveedores: Siniestros Empresas (' + Doc + ' ' + sNombreEmpresa + ') ...');

            sDomicilio := ValorSqlEx('SELECT UTILES.ARMAR_DOMICILIO(:p1, :p2, :p3, :p4) FROM DUAL',
            												[FieldByName('Calle').AsString, FieldByName('Numero').AsString,
                                     FieldByName('Piso').AsString, FieldByName('Departamento').AsString]);
            if not FieldByName('le_ChequeNombre').IsNull then
            	sBeneficiario := FieldByName('le_ChequeNombre').AsString
            else if FieldByName('le_Conpago').AsString = CONCEPTO_ILT_REINTEGRO then     // IND.INC.LAB.TEMPORARIA-REINTEGRO
            	sBeneficiario := sNombreEmpresa;

            sTipoAcreedor := 'EM';     // Empresa Afiliada
            IdAcreedor    := FieldByName('em_id').AsInteger;

            bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal);

            Insert_AC_AC_B_Vendors_Int(sNombreEmpresa, SINIESTROS_TERMS, SINIESTROS_LOOKUP,
                                       CURRENCY_CODE, IVA_EXENTO, 'CUIT',
                                       Doc, DocGuiones, '',
                                       '', YES, '0',
                                       '', NO_RETIENE, YES,
                                       '0', '', NO_RETIENE,
                                       YES, NO_RETIENE_MINUSC, 0,
                                       '', NO_RETIENE_MINUSC, NO,
                                       'S', StrLeft(sBeneficiario, 80), YES,
                                       StrLeft(sDomicilio, 35), StrMid(sDomicilio, 36, 35), StrLeft(FieldByName('Localidad').AsString, 25),
                                       '', FieldByName('CPostal').AsString, FieldByName('pv_Descripcion').AsString,
                                       COUNTRY_CODE, FieldByName('CodAreaTelefonos').AsString, StrLeft(FieldByName('Telefonos').AsString, 15),
                                       '', '', DGI_SERVICIOS,
                                       Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), SINIESTROS_LOOKUP,
                                       DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('pv_Descripcion').AsString), sTipoCuenta,
                                       sNroCuenta, sSucursal, sCBU1,
                                       sCBU2, NO, '',
                                       '', '', '',
                                       bDatosCuentaBancaria, 'N');

          	if not VendorExists(DocGuiones, 'CUIT') then
            	bResult := True;
          end
          else
          	Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, '', '',
                                          '', '', sNombreEmpresa, '', 'CUIT', Doc, sMotivoError);
        end
        else
        begin
        	Doc        := FieldByName('tj_Cuil').AsString;
          DocGuiones := PonerGuiones(Doc);

          bOK := False;
          if Doc = '' then
          	sMotivoError := 'El CUIL es nulo'
          else if not IsCuil(Doc) then
          	sMotivoError := 'El CUIL es inválido'
          else
          	bOK := True;

          if bOK then
          begin
          	sNombreTrab := FieldByName('tj_Nombre').AsString;
            MostrarEstado('Proveedores: Siniestros Trabajadores (' + Doc + ' ' + sNombreTrab + ') ...');

            sDomicilio := ValorSqlEx('SELECT UTILES.ARMAR_DOMICILIO(:p1, :p2, :p3, :p4) FROM DUAL',
            												[FieldByName('Calle').AsString, FieldByName('Numero').AsString,
                                     FieldByName('Piso').AsString, FieldByName('Departamento').AsString]);
            if not FieldByName('le_ChequeNombre').IsNull then
            	sBeneficiario := FieldByName('le_ChequeNombre').AsString
            else
            	sBeneficiario := sNombreTrab;

            if StrMid(DocGuiones, 13, 1) = '*' then
            	sTipoDoc := 'CUILPD'
            else
            	sTipoDoc := 'CUIL';

            sTipoAcreedor := 'TA';     // Trabajador Afiliado
            IdAcreedor    := FieldByName('tj_id').AsInteger;

            bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta,
            																								sCBU1, sCBU2, sSucursal);

            Insert_AC_AC_B_Vendors_Int(sNombreTrab, SINIESTROS_TERMS, SINIESTROS_LOOKUP,
                                       CURRENCY_CODE, IVA_EXENTO, sTipoDoc,
                                       StringReplace(Doc, '*', '', [rfReplaceAll]), DocGuiones, '',
                                       '', YES, '0',
                                       '', NO_RETIENE, YES,
                                       '0', '', NO_RETIENE,
                                       YES, NO_RETIENE_MINUSC, 0,
                                       '', NO_RETIENE_MINUSC, NO,
                                       'S', StrLeft(sBeneficiario, 80), YES,
                                       StrLeft(sDomicilio, 35), StrMid(sDomicilio, 36, 35), StrLeft(FieldByName('Localidad').AsString, 25),
                                       '', FieldByName('CPostal').AsString, FieldByName('pv_Descripcion').AsString,
                                       COUNTRY_CODE, FieldByName('CodAreaTelefonos').AsString, StrLeft(FieldByName('Telefonos').AsString, 15),
                                       '', '', DGI_SERVICIOS,
                                       Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), SINIESTROS_LOOKUP,
                                       DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('pv_Descripcion').AsString), sTipoCuenta,
                                       sNroCuenta, sSucursal, sCBU1,
                                       sCBU2, NO, '',
                                       '', '', '',
                                       bDatosCuentaBancaria, 'N');

            if not VendorExists(DocGuiones, sTipoDoc) then
            	bResult := True;
          end
          else
          	Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, '', '',
                                          '', '', sNombreTrab, '', 'CUIL', Doc, sMotivoError);
        end;

        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg(E, 'Error al exportar Proveedores ILT / ILP.');
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

function TfrmAdmInterfaces.Financial_ProveedoresOtrosPagos(Fecha: TDateTime): Boolean;
var
  sNombreAcr, sTipoAcreedor, Doc, DocGuiones, sSql, sTipoListado, sBeneficiario: String;
  sMotivoError, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal, sDomicilio: String;
  sTipoDoc, sDoc, sDocGuiones, sCuitCuil: String;
  bDatosCuentaBancaria, bResult, bOk: Boolean;
  IdAcreedor: TTableId;
  qryAcreedor: TSDQuery;
begin
  bResult := False;
  MostrarEstado('Proveedores: Pago por otros conceptos ...');

  sTipoListado := '3';
  Limpiar_TablaTemporalProv(sTipoListado);

  sSql :=
  	'SELECT PR_ACREEDOR, DECODE(PR_ACREEDOR, ''BE'', (SELECT EX_CUIL ' +
                                                      ' FROM ART.SEX_EXPEDIENTES ' +
                                                     ' WHERE EX_SINIESTRO = PR_SINIESTRO ' +
                                                       ' AND EX_ORDEN = PR_ORDEN ' +
                                                       ' AND EX_RECAIDA = PR_RECAIDA), PR_CUITCUIL) DOCUMENT, ' +
           'PR_PRESTADORSECUENCIA SECUENCIA, PR_PRESTADORMUTUAL SECUENCIAMUTUAL,' +
    			' PR_CHEQUENOMBRE, PR_DELEGACION' +
     ' FROM SPR_PAGOEXPESIN' +
    ' WHERE PR_FAPROBADO = :p1' +
    	' AND PR_IMPORPAGO <> 0' +
      ' AND ((NVL(PR_ESTADO, '' '') = ''E'')' +
       ' OR (NVL(PR_ESTADO, '' '') = ''X''' +
      ' AND PR_FMODIF = PR_FAPROBADO))';		// APROBADA

	with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        sTipoAcreedor := FieldByName('pr_Acreedor').AsString;

        if sTipoAcreedor = 'CA' then    // Centro Asistencial
        	sSql :=
          	'SELECT ''CUIT'' DOCUMENT_TYPE, CA_CLAVE DOCUMENT, CA_DESCRIPCION NOMBRE, CA_DOMICILIO DOMICILIO,' +
            			' CA_LOCALIDAD LOCALIDAD, CA_CODPOSTAL CODIGOPOSTAL, PV_DESCRIPCION PROVINCIA, CA_TELEFONO TELEFONO,' +
                  ' NULL CODAREATELEFONO, NVL(CA_RETGANANCIAS, ' +  SqlValue(NO_RETIENE) + ') RETGANANCIAS,' +
                  ' CA_IDENTIFICADOR IDENTIFICADOR' +
             ' FROM CPR_PRESTADOR, CPV_PROVINCIAS' +
            ' WHERE CA_CLAVE = ' + SqlValue(FieldByName('DOCUMENT').AsString) +
            	' AND CA_SECUENCIA = NVL(' + SqlInteger(FieldByName('SECUENCIA').AsInteger, True) + ', 1)' +
              ' AND CA_PRESTADORMUTUAL = ' + SqlValue(FieldByName('SECUENCIAMUTUAL').AsString) +
              ' AND (CA_FECHABAJA IS NULL' +
                ' OR CA_FECHABAJA > ' + SqlValue(Fecha) + ')' +
              ' AND CA_PROVINCIA = PV_CODIGO(+)'
        else if (sTipoAcreedor = 'EM') or (sTipoAcreedor = 'FF') then    // Empresa Afiliada - Fondo Fijo
        	sSql :=
          	'SELECT ''CUIT'' DOCUMENT_TYPE, EM_CUIT DOCUMENT, EM_NOMBRE NOMBRE, EM_ID ID,' +
            			' UTILES.ARMAR_DOMICILIO(DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO) DOMICILIO,' +
                  ' DC_LOCALIDAD LOCALIDAD, DC_CPOSTAL CODIGOPOSTAL, PV_DESCRIPCION PROVINCIA, DC_TELEFONOS TELEFONO,' +
                  ' DC_CODAREATELEFONOS CODAREATELEFONO, ' +  SqlValue(NO_RETIENE) + ' RETGANANCIAS, EM_CUIT CUIT_CUIL' +
          	 ' FROM ADC_DOMICILIOCONTRATO, ACO_CONTRATO, AEM_EMPRESA, CPV_PROVINCIAS' +
            ' WHERE EM_CUIT = ' + SqlValue(FieldByName('DOCUMENT').AsString) +
            	' AND CO_IDEMPRESA = EM_ID' +
              ' AND CO_CONTRATO = GET_VULTCONTRATO(EM_CUIT)' +
              ' AND CO_CONTRATO = DC_CONTRATO' +
              ' AND DC_TIPO = ''L''' +
              ' AND DC_PROVINCIA = PV_CODIGO(+)'
        else if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then    // Otros Acreedores - Persona Autorizada
        	sSql :=
          	'SELECT ''CUIT'' DOCUMENT_TYPE, REPLACE(PA_CUITCUIL, ''*'' , ''0'') DOCUMENT, PA_DENOMINA NOMBRE,' +
            			' PA_DOMICILIO DOMICILIO, PA_LOCALIDAD LOCALIDAD, PA_CODPOSTAL CODIGOPOSTAL,' +
                  ' PV_DESCRIPCION PROVINCIA, PA_TELNUM TELEFONO, PA_TELCOD CODAREATELEFONO,' +
                  ' NVL(PA_RETGANANCIAS, ' + SqlValue(NO_RETIENE) + ') RETGANANCIAS, PA_CUITCUIL CUIT_CUIL' +
             ' FROM SPA_PAGOACRE, CPV_PROVINCIAS' +
            ' WHERE PA_CUITCUIL = ' + SqlValue(FieldByName('DOCUMENT').AsString) +
            	' AND (PA_FECHABAJA IS NULL' +
                ' OR PA_FECHABAJA > ' + SqlValue(Fecha) + ')' +
              ' AND PA_PROVINCIA = PV_CODIGO(+)'
        else if AreIn(sTipoAcreedor, ['TA', 'BE']) then    // Trabajador Afiliado
        	sSql :=
          	'SELECT ''CUIL'' DOCUMENT_TYPE, REPLACE(TJ_CUIL, ''*'', ''0'') DOCUMENT, TJ_NOMBRE NOMBRE, TJ_ID ID,' +
            			' UTILES.ARMAR_DOMICILIO(TJ_CALLE, TJ_NUMERO, TJ_PISO, TJ_DEPARTAMENTO) DOMICILIO,' +
                  ' TJ_LOCALIDAD LOCALIDAD, TJ_CPOSTAL CODIGOPOSTAL, PV_DESCRIPCION PROVINCIA, TJ_TELEFONO TELEFONO,' +
                  ' TJ_CODAREATELEFONO CODAREATELEFONO, ' + SqlValue(NO_RETIENE) + ' RETGANANCIAS, TJ_CUIL CUIT_CUIL' +
             ' FROM CTJ_TRABAJADOR, CPV_PROVINCIAS' +
            ' WHERE TJ_CUIL = ' + SqlValue(FieldByName('DOCUMENT').AsString) + 
            	' AND TJ_PROVINCIA = PV_CODIGO(+)'
        else if sTipoAcreedor = 'DI' then    // Delegación del interior Provincia Aseguradoras
        	sSql :=
          	'SELECT ''CIDG'' DOCUMENT_TYPE, LG_CODIGO DOCUMENT, LG_NOMBRE NOMBRE,' +
            			' ART.UTILES.ARMAR_DOMICILIO(LG_CALLE, LG_NUMERO, LG_PISO, LG_DEPARTAMENTO) DOMICILIO,' +
                  ' LG_LOCALIDAD LOCALIDAD, LG_CPOSTAL CODIGOPOSTAL, PV_DESCRIPCION PROVINCIA, LG_TELEFONO TELEFONO,' +
                  ' LG_CODAREATELEFONO CODAREATELEFONO, ' + SqlValue(NO_RETIENE) + ' RETGANANCIAS' +
             ' FROM DLG_DELEGACIONES, CPV_PROVINCIAS' +
            ' WHERE LG_CODIGO = ' + SqlValue(FieldByName('PR_DELEGACION').AsString) +
            	' AND LG_PROVINCIA = PV_CODIGO(+)';

        qryAcreedor := GetQuery(sSql);
        try
        	if not qryAcreedor.Eof then
          begin
          	sTipoDoc   := qryAcreedor.FieldByName('document_type').AsString;
            Doc        := qryAcreedor.FieldByName('document').AsString;
            sNombreAcr := qryAcreedor.FieldByName('nombre').AsString;

            if sTipoDoc = 'CUIT' then
            begin
            	if IsCuit(Doc) then
              	bOK := True
              else
              begin
              	bOK := False;
                sMotivoError := 'El CUIT es inválido';
              end;
            end
            else if sTipoDoc = 'CUIL' then
            begin
            	if IsCuil(Doc) then
              	bOK := True
              else
              begin
              	bOK := False;
                sMotivoError := 'El CUIL es inválido';
              end;
            end
            else
            	bOK := True;

            if not FieldByName('pr_ChequeNombre').IsNull then
            	sBeneficiario := FieldByName('pr_ChequeNombre').AsString
            else
            	sBeneficiario := sNombreAcr;

            MostrarEstado('Proveedores: Siniestros Empresas (' + Doc + ' ' + sNombreAcr + ') ...');

            if (sTipoDoc = 'CUIT') or (sTipoDoc = 'CUIL') then
            begin
            	DocGuiones  := PonerGuiones(Doc);
              sDoc        := Doc;
              sDocGuiones := DocGuiones;
            end
            else
            begin
            	DocGuiones  := Doc;
              sDoc        := '';
              sDocGuiones := '';
            end;

            sDomicilio := qryAcreedor.FieldByName('Domicilio').AsString;

            if sTipoAcreedor = 'DI' then    // Delegación del interior Provincia Aseguradoras
            	bDatosCuentaBancaria := False
            else
            begin
            	if sTipoAcreedor = 'CA' then                                   // Centro Asistencial
              begin
              	sCuitCuil  := '';
                IdAcreedor := qryAcreedor.FieldByName('Identificador').AsInteger;
              end
              else if (sTipoAcreedor = 'EM') or (sTipoAcreedor = 'FF') then  // Empresa Afiliada, Fondo Fijo
              begin
              	sCuitCuil  := '';
                IdAcreedor := qryAcreedor.FieldByName('Id').AsInteger;
              end
              else if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then  // Otros Acreedores, Persona Autorizada
              begin
              	sCuitCuil  := qryAcreedor.FieldByName('Cuit_Cuil').AsString;
                IdAcreedor := ART_EMPTY_ID;
              end
              else if AreIn(sTipoAcreedor, ['TA', 'BE']) then                // Trabajador Afiliado
              begin
              	sCuitCuil  := '';
                IdAcreedor := qryAcreedor.FieldByName('Id').AsInteger;
              end
              else
              begin
              	sCuitCuil  := '';
                IdAcreedor := ART_EMPTY_ID;
              end;

              bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, sCuitCuil, sTipoCuenta,
              																								sNroCuenta, sCBU1, sCBU2, sSucursal);
            end;

            Insert_AC_AC_B_Vendors_Int(sNombreAcr, SINIESTROS_TERMS, SINIESTROS_LOOKUP,
                                       CURRENCY_CODE, IVA_EXENTO, sTipoDoc,
                                       sDoc, DocGuiones, '',
                                       '', YES, '0',
                                       '', NO_RETIENE, YES,
                                       '0', '', qryAcreedor.FieldByName('RetGanancias').AsString,
                                       YES, NO_RETIENE_MINUSC, 0,
                                       '', NO_RETIENE_MINUSC, NO,
                                       'S', StrLeft(sBeneficiario, 80), YES,
                                       StrLeft(sDomicilio, 35), StrMid(sDomicilio, 36, 35), StrLeft(qryAcreedor.FieldByName('Localidad').AsString, 25),
                                       '', qryAcreedor.FieldByName('CodigoPostal').AsString, qryAcreedor.FieldByName('Provincia').AsString,
                                       COUNTRY_CODE, qryAcreedor.FieldByName('CodAreaTelefono').AsString, StrLeft(qryAcreedor.FieldByName('CodAreaTelefono').AsString, 15),
                                       '', '', DGI_SERVICIOS,
                                       Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), SINIESTROS_LOOKUP,
                                       sDocGuiones, Obtener_CodProvinciaFinancial(qryAcreedor.FieldByName('Provincia').AsString), sTipoCuenta,
                                       sNroCuenta, sSucursal, sCBU1,
                                       sCBU2, NO, '',
                                       '', '', '',
                                       bDatosCuentaBancaria, 'N');

            if not VendorExists(DocGuiones, sTipoDoc) then
            	bResult := True;

            if not bOk then
            	Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, '', '',
                                            '', '', sNombreAcr, sTipoAcreedor, sTipoDoc, Doc, sMotivoError);
          end;
        finally
        	qryAcreedor.Free;
        end;

        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg(E, 'Error al exportar Proveedores Otros Conceptos.');
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

function TfrmAdmInterfaces.Financial_ProveedoresCompensacionDeuda(IdProceso: Integer): Boolean;
var
  sNombreEmpresa, sTipoAcreedor, Doc, DocGuiones, sSql, sTipoListado: String;
  sMotivoError, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal: String;
  sDomicilio, sBeneficiario: String;
  bDatosCuentaBancaria, bResult, bOk: Boolean;
  IdAcreedor: TTableId;
begin
  bResult := False;
  MostrarEstado('Proveedores: Empresas compensadas ...');

  sTipoListado := '5';
  Limpiar_TablaTemporalProv(sTipoListado);

  sSql :=
  	'SELECT EM_ID, TJ_NOMBRE, SLE.LE_TIPOLIQUI, SLE.LE_CHEQUENOMBRE, SLE.LE_CONPAGO, PV_DESCRIPCION, EM_CUIT,' +
    			' EM_NOMBRE, DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO, DC_LOCALIDAD, DC_CPOSTAL, DC_CODAREATELEFONOS,' +
          ' DC_TELEFONOS' +
     ' FROM CTJ_TRABAJADOR, ADC_DOMICILIOCONTRATO, ACO_CONTRATO, AEM_EMPRESA, SEX_EXPEDIENTES, SLE_LIQUIEMPSIN SLE,' +
     			' CPV_PROVINCIAS, SLE_LIQPENDIENTESDEUDA SLEDEUDA' +
    ' WHERE SLEDEUDA.LE_IDCOMPENSACION = :p1' +
    	' AND SLEDEUDA.LE_SINIESTRO = SLE.LE_SINIESTRO' +
      ' AND SLEDEUDA.LE_ORDEN = SLE.LE_ORDEN' +
      ' AND SLEDEUDA.LE_RECAIDA = SLE.LE_RECAIDA' +
      ' AND SLEDEUDA.LE_NUMLIQUI = SLE.LE_NUMLIQUI' +
      ' AND SLE.LE_IMPORPERI <> 0' +
      ' AND SLEDEUDA.LE_SINIESTRO = EX_SINIESTRO' +
      ' AND SLEDEUDA.LE_ORDEN = EX_ORDEN' +
      ' AND SLEDEUDA.LE_RECAIDA = EX_RECAIDA' +
      ' AND EM_CUIT = EX_CUIT' +
      ' AND TJ_CUIL = EX_CUIL' +
      ' AND CO_IDEMPRESA = EM_ID' +
      ' AND CO_CONTRATO = GET_VULTCONTRATO(EM_CUIT)' +
      ' AND CO_CONTRATO = DC_CONTRATO' +
      ' AND DC_TIPO = ''L''' +
      ' AND DC_PROVINCIA = PV_CODIGO';

  with GetQueryEx(sSql, [IdProceso]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('em_Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);

        bOK := False;
        if Doc = '' then
        	sMotivoError := 'El CUIT es nulo'
        else if not IsCuit( Doc ) then
        	sMotivoError := 'El CUIT es inválido'
        else
        	bOK := True;

        if bOK then
        begin
        	sNombreEmpresa := FieldByName('em_Nombre').AsString;
          MostrarEstado('Proveedores: Siniestros Empresas (' + Doc + ' ' + sNombreEmpresa + ') ...');

          sDomicilio := ValorSqlEx('SELECT UTILES.ARMAR_DOMICILIO(:p1, :p2, :p3, :p4) FROM DUAL',
          												[FieldByName('dc_Calle').AsString, FieldByName('dc_Numero').AsString,
                                   FieldByName('dc_Piso').AsString, FieldByName('dc_Departamento').AsString]);
          if not FieldByName('le_ChequeNombre').IsNull then
          	sBeneficiario := FieldByName('le_ChequeNombre').AsString
          else if FieldByName('le_Conpago').AsString = CONCEPTO_ILT_REINTEGRO then     // IND.INC.LAB.TEMPORARIA-REINTEGRO
          	sBeneficiario := sNombreEmpresa;

          sTipoAcreedor := 'EM';     // Empresa Afiliada
          IdAcreedor    := FieldByName('em_id').AsInteger;

          bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal);

          Insert_AC_AC_B_Vendors_Int(sNombreEmpresa, SINIESTROS_TERMS, SINIESTROS_LOOKUP,
                                     CURRENCY_CODE, IVA_EXENTO, 'CUIT',
                                     Doc, DocGuiones, '',
                                     '', YES, '0',
                                     '', NO_RETIENE, YES,
                                     '0', '', NO_RETIENE,
                                     YES, NO_RETIENE_MINUSC, 0,
                                     '', NO_RETIENE_MINUSC, NO,
                                     'S', StrLeft(sBeneficiario, 62), YES,
                                     StrLeft(sDomicilio, 35), StrMid(sDomicilio, 36, 35), StrLeft(FieldByName('dc_Localidad').AsString, 25),
                                     '', FieldByName('dc_CPostal').AsString, FieldByName('pv_Descripcion').AsString,
                                     COUNTRY_CODE, FieldByName('dc_CodAreaTelefonos').AsString, StrLeft(FieldByName('dc_Telefonos').AsString, 15),
                                     '', '', DGI_SERVICIOS,
                                     Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), SINIESTROSCOMPENSACION_LOOKUP,
                                     DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('pv_Descripcion').AsString), sTipoCuenta,
                                     sNroCuenta, sSucursal, sCBU1,
                                     sCBU2, NO, '',
                                     '', '', '',
                                     bDatosCuentaBancaria, 'N');

          if not VendorExists(DocGuiones, 'CUIT') then
          	bResult := True;
        end
        else
        	Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, '', '',
                                        '', '', sNombreEmpresa, '', 'CUIT', Doc, sMotivoError);
        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg( E, 'Error al exportar Proveedores Compensacion de Deuda.' );
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

function TfrmAdmInterfaces.Financial_ProveedoresPrestacionesMedicas(Fecha: TDateTime): Boolean;
var
  sNombrePrestador, sTipoAcreedor, Doc, DocGuiones, sSql, sTipoDoc: String;
  sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal, sRetieneIngBrutos: String;
  sDomicilio, sBeneficiario, sSeveral_wh_flag: String;
  bDatosCuentaBancaria, bResult: Boolean;
  IdAcreedor: TTableId;
begin
  bResult := False;
  MostrarEstado('Proveedores: Pago por Prestaciones Médicas ...');

  sSql :=
  	'SELECT CA_CLAVE DOCUMENT, CA_ASISTENCIAL IDPRES, CA_DESCRIPCION NOMBRE, CA_RETIENEINGBRUTOS,' +
    			' CA_RETINGRESOSBRUTOS,' +
          ' UTILES.ARMAR_DOMICILIO(CA_CALLELEGAL, CA_NUMEROLEGAL, CA_PISOLEGAL, CA_DEPARTAMENTOLEGAL) DOMICILIO,' +
          ' CA_LOCALIDADLEGAL LOCALIDAD, CA_CODPOSTALLEGAL CODIGOPOSTAL, PV_DESCRIPCION PROVINCIA,' +
          ' CA_TELEFONO TELEFONO, NULL CODAREATELEFONO, NVL(CA_RETGANANCIAS, ' + SqlValue(NO_RETIENE) + ') RETGANANCIAS,' +
          ' CA_BANCO BANCO, CA_TIPOCUENTA TCUENTA, CA_CUENTA CUENTA, VO_DESTINATARIO DESTINATARIO,' +
          ' VO_FACTURATIPO TIPO, NVL(CA_RETENCAJAMED, ''N'') RETENCAJAMED, IB_WH_ZONE_CODE, IB_WH_CONC_CODE,' +
          ' TB_DESCRIPCION SITUACIONIVA, VO_CHEQUENOMBRE, CA_IDENTIFICADOR IDENTIFICADOR, TP_DESCRIPCION ESPECIALIDAD, ' +
          ' CA_FDOTIERRADELFUEGO FDOTIERRADELFUEGO' +
     ' FROM SVO_VOLANTES, CPR_PRESTADOR, CPV_PROVINCIAS, MTP_TIPOPRESTADOR, RIB_RETENCIONINGBRUTOS, CTB_TABLAS' +
    ' WHERE VO_FECHAPAGO = :p1' +
      ' AND VO_MONTO <> 0' +
      ' AND ''''||VO_ESTADO IN (''E'', ''EG'', ''EM'', ''EAM'', ''EAG'')' +
      ' AND VO_PRESTADOR = CA_IDENTIFICADOR' +
      ' AND CA_PROVINCIALEGAL = PV_CODIGO (+)' +
      ' AND IB_PROVINCIA(+) = CA_PROVINCIALEGAL' +
      ' AND IB_CODIGO(+) = CA_INGRESOSBRUTOS' +
      ' AND TB_CLAVE(+) = ''SIVA''' +
      ' AND TB_CODIGO(+) = CA_IVA' +
      ' AND CA_ESPECIALIDAD = TP_CODIGO(+)';

	with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        DocGuiones := PonerGuiones(FieldByName('document').AsString);
        sNombrePrestador := FieldByName('Nombre').AsString;

        if not FieldByName('vo_ChequeNombre').IsNull then
        	sBeneficiario := FieldByName('vo_ChequeNombre').AsString
        else
        	sBeneficiario := sNombrePrestador;

        if FieldByName('document').AsString = '30708574836' then   // CORREO OFICIAL DE LA REPUBLICA ARGENTINA SOCIEDAD ANONIMA
          begin
            sTipoDoc   := 'CUIT';
            Doc        := DocGuiones;
          end
        else
          begin
            sTipoDoc         := 'ARTID';
            Doc              := FieldByName('document').AsString + ' ' + FieldByName('Identificador').AsString;
            sNombrePrestador := 'ART- ' + sNombrePrestador;
          end;

        MostrarEstado('Proveedores: Siniestros Empresas (' + Doc + ' ' + sNombrePrestador + ') ...');

        if FieldByName('RetenCajaMed').AsString = NO then
        	sSeveral_wh_flag := NO
        else
        	sSeveral_wh_flag := YES;

        if FieldByName('ca_RetieneIngBrutos').AsString = 'S' then
        	sRetieneIngBrutos := YES
        else
        	sRetieneIngBrutos := '';

        sDomicilio := FieldByName('Domicilio').AsString;

        sTipoAcreedor := 'CA';     // Centro Asistencial
        IdAcreedor    := FieldByName('Identificador').AsInteger;

        bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal);

        Insert_AC_AC_B_Vendors_Int(sNombrePrestador, SINIESTROS_TERMS, PRESTMEDICAS_LOOKUP,
                                   CURRENCY_CODE, Iif(FieldByName('SituacionIVA').IsNull, IVA_EXENTO, FieldByName('SituacionIVA').AsString), sTipoDoc,
                                   FieldByName('document').AsString, Doc, FieldByName('ca_RetIngresosBrutos').AsString,
                                   '', YES, '0',
                                   '', NO_RETIENE, YES,
                                   '0', '', FieldByName('RetGanancias').AsString,
                                   sRetieneIngBrutos, FieldByName('ib_wh_Zone_Code').AsString, 0,
                                   '', FieldByName('ib_wh_Conc_Code').AsString, NO,
                                   FieldByName('Tipo').AsString, StrLeft(sBeneficiario, 62), YES,
                                   StrLeft(sDomicilio, 35), StrMid(sDomicilio, 36, 35), StrLeft(FieldByName('Localidad').AsString, 25),
                                   '', FieldByName('CodigoPostal').AsString, FieldByName('Provincia').AsString,
                                   COUNTRY_CODE, FieldByName('CodAreaTelefono').AsString, StrLeft(FieldByName('Telefono').AsString, 15),
                                   '', '', DGI_SERVICIOS,
                                   Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), Financial_GLGetCodeCombinationID(CUENTA_PASIVO_ILT), PRESTMEDICAS_LOOKUP,
                                   DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('Provincia').AsString), sTipoCuenta,
                                   sNroCuenta, sSucursal, sCBU1,
                                   sCBU2, sSeveral_wh_flag, FieldByName('cuenta').AsString,
                                   FieldByName('banco').AsString, FieldByName('tcuenta').AsString, FieldByName('especialidad').AsString,
                                   bDatosCuentaBancaria, FieldByName('fdotierradelfuego').AsString);

        if not VendorExists(Doc, sTipoDoc) then
        	bResult := True;

        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg(E, 'Error al exportar Proveedores Pago por Prestaciones Médicas.');
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

function TfrmAdmInterfaces.Obtener_FactorFondo(Fecha: TDateTime; Tipo: String): Extended;
var
  sSql: String;
begin
  sSql :=
  	'SELECT ART.SIN.GET_FACTORFONDOHIPOACUSIA(:dFecha, :dTipo)' +
     ' FROM DUAL';
  Result := ValorSqlExtendedEx(sSql, [TDateTimeEx.Create(Fecha), Tipo]);
end;

procedure TfrmAdmInterfaces.Actualizar_ProxDigitoFactura_FNCL(Siniestro, Orden, Recaida, NroLiquidacion, Volante: Integer; TipoEnvio: String);
var
  sSql: String;
begin
  if TipoEnvio = 'ILT_ILP' then
    sSql := 'UPDATE SLE_LIQUIEMPSIN ' +
               'SET LE_PROXDIGFACTURA_FNCL=NVL(LE_PROXDIGFACTURA_FNCL+1, 2) ' +     // el primer próximo dígito debe ser 2
             'WHERE LE_SINIESTRO=' + SqlValue( Siniestro ) + ' ' +
               'AND LE_ORDEN=' + SqlValue( Orden ) + ' ' +
               'AND LE_RECAIDA=' + SqlValue( Recaida ) + ' ' +
               'AND LE_NUMLIQUI=' + SqlValue( NroLiquidacion ) + ' ' +
               'AND NVL(LE_PROXDIGFACTURA_FNCL, 2)<9'
  else if TipoEnvio = 'OTROS_PAGOS' then
    sSql := 'UPDATE SPR_PAGOEXPESIN ' +
               'SET PR_PROXDIGFACTURA_FNCL=NVL(PR_PROXDIGFACTURA_FNCL+1, 2) ' +     // el primer próximo dígito debe ser 2
             'WHERE PR_SINIESTRO=' + SqlValue( Siniestro ) + ' ' +
               'AND PR_ORDEN=' + SqlValue( Orden ) + ' ' +
               'AND PR_RECAIDA=' + SqlValue( Recaida ) + ' ' +
               'AND PR_NUMPAGO=' + SqlValue( NroLiquidacion ) + ' ' +
               'AND NVL(PR_PROXDIGFACTURA_FNCL, 2)<9'
  else if TipoEnvio = 'PREST_MED' then
    sSql := 'UPDATE SVO_VOLANTES ' +
               'SET VO_PROXDIGFACTURA=NVL(VO_PROXDIGFACTURA+1, 2) ' +               // el primer próximo dígito debe ser 2
             'WHERE VO_VOLANTE=' + SqlValue( Volante ) + ' ' +
               'AND NVL(VO_PROXDIGFACTURA, 2)<9';

  EjecutarSql( sSql );
end;

procedure TfrmAdmInterfaces.Financial_AjustarFondoILTP(Fecha: TDateTime; TipoEnvio: String);
var
  sTipoFondoAnt, sProxDigFactura, sFacturaNro, DocGuiones, sDescripcionFactura, sSql: String;
  sFondoTipoAnt, sActualTipoFondo, sTipoDoc, sEstado, Doc, sSqlSincr: String;
  iNroLiqui, iSiniestro, iOrden, iRecaida: Integer;
  qry: TSDQuery;
  bSeguir, bEsFondoAnt, bActualEsFondo: Boolean;
  dIcon, dImporteFondoAct, dImporteFondoAnt, dImporte, dFactorFondoAnt, dFactorFondoAct: Extended;
begin
  MostrarEstado('Cuentas a Pagar: Ajuste Fondo Siniestros ...');

  dmFinancials.BeginTrans;
  try
    sSql :=
    	'SELECT HF_SINIESTRO, HF_ORDEN, HF_RECAIDA, MAX(HF_FECHAALTA) ULTFECHAALTAOMSCIE10' +
       ' FROM SEX_EXPEDIENTES, SHF_HISTFONDO_SINIESTROS' +
      ' WHERE HF_SINCRO_ILT_ILP = ''N''' +   // esta condición es solo para reducir la búsqueda
      	' AND ART.SIN.ACTUALIZAR_FONDO_SINIESTROS(HF_SINIESTRO, HF_ORDEN, HF_RECAIDA, :p1) = ''S''' +
        ' AND HF_SINIESTRO = EX_SINIESTRO' +
        ' AND HF_ORDEN = EX_ORDEN' +
        ' AND HF_RECAIDA = EX_RECAIDA' +
        ' AND CONT.IS_EMPRESAFONDO(EX_CUIT) = ''S''' +
   ' GROUP BY HF_SINIESTRO, HF_ORDEN, HF_RECAIDA';

		with GetQueryEx(sSql, [TipoEnvio]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        iSiniestro := FieldByName('hf_Siniestro').AsInteger;
        iOrden     := FieldByName('hf_Orden').AsInteger;
        iRecaida   := FieldByName('hf_Recaida').AsInteger;

        sSql := 'SELECT ART.SIN.GET_ULTESTADO_FONDO_SINESTR(:siniestro, :orden, :recaida, :tipoliquid) ' +
                  'FROM DUAL';
        sFondoTipoAnt := ValorSqlEx(sSql, [iSiniestro, iOrden, iRecaida, TipoEnvio]);
        Get_FondoTipo(sFondoTipoAnt, bEsFondoAnt, sTipoFondoAnt);

        sSql :=
        	'SELECT DECODE(UR_CUIT, NULL, EX_CUIT, UR_CUIT) CUIT, LE_SINIESTRO SINIESTRO, LE_ORDEN ORDEN, LE_RECAIDA RECAIDA, LE_NUMLIQUI NUMERO,' +
          			' LE_IMPORPERI IMPORTE, TJ_NOMBRE NOMBRE, HF_ESFONDO ESFONDO, HF_TIPO TIPOFONDO, ' +
                ' ART.FNCL.CUENTA_PONERGUIONES(ART.FNCL.GET_CUENTAPAGOFACTURA(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, LE_FAPROBADO, CP_CONPAGO)) CUENTA,' +
                ' ART.FNCL.TIPO(LE_CONPAGO) TIPO, CP_CONPAGO, TJ_CUIL CUIL, UR_CUIT,' +
                ' ART.FNCL.DESCRIPCION(LE_CONPAGO, LE_TIPOLIQUI) DESCRIPCION, EM_NOMBRE,' +
                ' ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINCOMPLETO, LE_FAPROBADO FAPROBADO,' +
                ' EX_FECHARECEPCION FECHAANT, ART.SIN.GET_PAGODIRECTO(LE_CONPAGO) PAGO_DIRECTO, ' +
                ' LE_ICONTRA, LE_ICONEMP ' +
           ' FROM SUR_SEGURORETIRO, SHF_HISTFONDO_SINIESTROS, SCP_CONPAGO, CTJ_TRABAJADOR, SEX_EXPEDIENTES, SLE_LIQUIEMPSIN, AEM_EMPRESA' +
          ' WHERE LE_FAPROBADO < :p1' +
            ' AND LE_IMPORPERI <> 0' +
            ' AND LE_SINIESTRO = EX_SINIESTRO' +
            ' AND LE_ORDEN = EX_ORDEN' +
            ' AND LE_RECAIDA = EX_RECAIDA' +
            ' AND CP_CONPAGO(+) = LE_CONPAGO' +
            ' AND NVL(LE_ESTADO, '' '') = ''E''' +     // Aprobada
            ' AND TJ_CUIL = EX_CUIL' +
            ' AND EM_CUIT = EX_CUIT' +
            ' AND HF_SINIESTRO = LE_SINIESTRO' +
            ' AND HF_ORDEN = LE_ORDEN' +
            ' AND HF_RECAIDA = LE_RECAIDA' +
            ' AND HF_FECHAALTA = :p2' +
            ' AND LE_CODSEGURORETIRO = UR_CODIGO(+) ' +
            ' AND LE_SINIESTRO = :p3' +
            ' AND LE_ORDEN = :p4' +
            ' AND LE_RECAIDA = :p5';

        qry := GetQueryEx(sSql, [TDateTimeEx.Create(Fecha),
        												 TDateTimeEx.Create(FieldByName('ultfechaaltaomscie10').AsDateTime), iSiniestro, iOrden,
                                 iRecaida]);
        try
        	while not qry.Eof do
          begin
            if (qry.FieldByName('pago_directo').AsString = 'N') or not qry.FieldByName('UR_CUIT').IsNull then
            begin
              Doc        := qry.FieldByName('Cuit').AsString;
              DocGuiones := PonerGuiones(Doc);
              sTipoDoc   := 'CUIT';

              bSeguir := (IsCuit(Doc) and VendorExists(DocGuiones, sTipoDoc));
            end
            else
            begin
              Doc        := qry.FieldByName('Cuil').AsString;
              DocGuiones := PonerGuiones(Doc);

              if StrMid(Doc, 11, 1) = '*' then
                sTipoDoc := 'CUILPD'
              else
                sTipoDoc := 'CUIL';

              bSeguir := (IsCuil(Doc) and VendorExists(DocGuiones, sTipoDoc));
            end;

            if bSeguir then
            begin
            	iNroLiqui := qry.FieldByName('Numero').AsInteger;

              sEstado             := 'Cuentas a Pagar: Siniestros ILT (' + Doc + ') ...';
              sDescripcionFactura := qry.FieldByName('SinCompleto').AsString + '-' + LPad( IntToStr(iNroLiqui), '0', 2) + ' ' + qry.FieldByName('Tipo').AsString + ' ' + qry.FieldByName('nombre').AsString;

              bActualEsFondo   := (qry.FieldByName('esfondo').AsString = 'S');
              sActualTipoFondo := qry.FieldByName('tipofondo').AsString;

              dFactorFondoAct := Obtener_FactorFondo(qry.FieldByName('FAprobado').AsDateTime, sActualTipoFondo);
              dFactorFondoAnt := Obtener_FactorFondo(qry.FieldByName('FAprobado').AsDateTime, sTipoFondoAnt);

              dImporte := qry.FieldByName('Importe').AsCurrency;

              if bActualEsFondo and bEsFondoAnt then
                begin
                  dImporteFondoAct := RoundNumber(dImporte * dFactorFondoAct, 2);
                  dImporteFondoAnt := -RoundNumber(dImporte * dFactorFondoAnt, 2);
                end
              else
                begin
                  if bActualEsFondo then
                    begin
                    	dImporteFondoAct := RoundNumber(dImporte * dFactorFondoAct, 2);
                      dImporteFondoAnt := 0;
                    end
                  else
                    begin
                      dImporteFondoAct := 0;
                    	dImporteFondoAnt := -RoundNumber(dImporte * dFactorFondoAnt, 2);
                    end;
                end;

              if not AreIn(qry.FieldByName('cp_ConPago').AsString, [CONCEPTO_ILT_REINTEGRO, CONCEPTO_IPPD_CONTRIB]) and (((sTipoFondoAnt = 'NL') or (sActualTipoFondo  = 'NL')) and (sTipoFondoAnt <> sActualTipoFondo)) and ((qry.FieldByName('le_IconTra').AsFloat <> 0) or (qry.FieldByName('le_IconEmp').AsFloat <> 0)) then
                begin
                   dIcon := qry.FieldByName('le_IconTra').AsFloat + qry.FieldByName('le_IconEmp').AsFloat;

                   if dImporteFondoAct <> 0 then
                      dImporteFondoAct := dImporteFondoAct + dIcon
                   else if dImporteFondoAnt <> 0 then
                      dImporteFondoAnt := dImporteFondoAnt + dIcon;
                end;

              if dImporteFondoAct <> 0 then
                begin
                  sProxDigFactura := Get_ProxNroFactura(iSiniestro, iOrden, iRecaida, iNroLiqui);
                  sFacturaNro     := LPad(sProxDigFactura, '0', 1) + StrRight(IntToStr(iRecaida), 1) + Lpad(IntToStr(iOrden), '0', 2) + '-' + LPad(IntToStr(iSiniestro), '0', 6) + LPad(IntToStr(iNroLiqui), '0', 2);

                  Financial_ExportarSiniestrosILTP(sEstado, sFacturaNro, sDescripcionFactura,
                                                   qry.FieldByName('Descripcion').AsString, DocGuiones, qry.FieldByName('cp_ConPago').AsString,
                                                   sTipoDoc, '', '',
                                                   qry.FieldByName('Cuenta').AsString, Fecha, qry.FieldByName('FechaAnt').AsDateTime,
                                                   0, True, iSiniestro,
                                                   iOrden, iRecaida, iNroLiqui,
                                                   TipoEnvio, True, dImporteFondoAct,
                                                   -dImporteFondoAct, True, SINIESTROS_LOOKUP,
                                                   SINIESTROS_GROUP, sActualTipoFondo, '',
                                                   ART_EMPTY_ID);
                end;

              if dImporteFondoAnt <> 0 then
                begin
                  sProxDigFactura := Get_ProxNroFactura(iSiniestro, iOrden, iRecaida, iNroLiqui);
                  sFacturaNro     := LPad(sProxDigFactura, '0', 1) + StrRight(IntToStr(iRecaida), 1) + Lpad(IntToStr(iOrden), '0', 2) + '-' + LPad(IntToStr(iSiniestro), '0', 6) + LPad(IntToStr(iNroLiqui), '0', 2);

                  Financial_ExportarSiniestrosILTP(sEstado, sFacturaNro, sDescripcionFactura,
                                                   qry.FieldByName('Descripcion').AsString, DocGuiones, qry.FieldByName('cp_ConPago').AsString,
                                                   sTipoDoc, '', '',
                                                   qry.FieldByName('Cuenta').AsString, Fecha, qry.FieldByName('FechaAnt').AsDateTime,
                                                   0, True, iSiniestro,
                                                   iOrden, iRecaida, iNroLiqui,
                                                   TipoEnvio, True, dImporteFondoAnt,
                                                   -dImporteFondoAnt, True, SINIESTROS_LOOKUP,
                                                   SINIESTROS_GROUP, sActualTipoFondo, '',
                                                   ART_EMPTY_ID);
                end;
            end;

            qry.Next;
          end;
        finally
        	qry.Free;
        end;

        sSqlSincr := 'ART.SIN.SINCR_HIST_FONDO_SINIESTROS(:Siniestro, :Orden, :Recaida, :TipoEnvio);';
        EjecutarStoreEx(sSqlSincr, [iSiniestro, iOrden, iRecaida, TipoEnvio]);

        Next;
      end;
    finally
    	Free;
    end;

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al ajustar fondo ILT/ILP.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmFinancials.DesConectar;

  if pbProcesosEjecutados then
    MsgBox('Por favor, recuerde ejecutar SIEMPRE la Interfase de Proveedores en Financials.', MB_ICONINFORMATION);
end;

{- Legales ------------------------------------------------------------------------------------------------------------}

function TfrmAdmInterfaces.IsTrabajador_PagosLegales(TipoPagoLegal: TTipoPagoLegal; IdBeneficiarioPago: TTableId): Boolean;
var
  bTrabajador: Boolean;
begin
  bTrabajador := False;

  case TipoPagoLegal of
    pl_Juicio, pl_Sumario, pl_Honorarios:  // Pagos de Juicios, Pagos de Sumarios, Pagos de Honorarios
      bTrabajador := False;
    pl_Mediacion:                          // Pagos de Mediaciones
      bTrabajador := (IdBeneficiarioPago = 2);
  end;

  Result := bTrabajador;
end;
                    
function TfrmAdmInterfaces.Financial_ProveedoresLegales(Fecha: TDateTime; TipoPagoLegal: TTipoPagoLegal): Boolean;
var
  FDesde, FHasta: TDateTime;
  sTipoAcreedor, Doc, DocGuiones, sSql, sTipoListado, sMotivoError: String;
  sNombreAcreedor, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal: String;
  sTipoDoc, sRetieneIngBrutos: String;
  IdSPA, IdAcreedor: TTableId;
  bEsTrabajador, bDatosCuentaBancaria, bResult, bOk: Boolean;
  INCOME_WH_DFLT_CODE, VAT_CODE: Variant;
  SqlResults: TStringList;
begin
  bResult := False;
  MostrarEstado('Proveedores: Acreedores Legales ...');

  FDesde := Fecha;
  FHasta := IncDay(Fecha, 1);

  case TipoPagoLegal of
    pl_Juicio:     // Pagos de Juicios
      begin
        sTipoListado := '6';
        if Fecha <= StrToDate('28/02/2011') then
          sSql :=
            'SELECT pl_iddetallebeneficiario iddetallebeneficiario, pl_cuitcuil cuitcuil, pl_paguesea nombre,' +
                  ' tb_descripcion retiva, ''N'' ibrutos, nvl(pa_retganancias, ' + SqlValue(NO_RETIENE) + ') retgan,' +
                  ' pl_chequenombre beneficiario, NULL domicilio, NULL localidad, NULL cpostal, NULL codareatelefonos,' +
                  ' NULL telefonos, pv_descripcion provincia,' +
                  ' DECODE(jt_juicionosiniestro, 1, REPLACE(' + SqlValue (CUENTA_JUICIO_SIN_SINIESTRO) + ', ''-''), cp_ctapago) ctapago,' +
                  ' pl_letrafactura letrafactura, pl_idbeneficiariopago idbeneficiariopago, ' +
                  ' ib_wh_zone_code, ib_wh_conc_code ' +
             ' FROM spa_pagoacre, ctb_tablas, legales.lpl_pagolegal pl, art.scp_conpago cp, legales.ljt_juicioentramite jt,' +
                  ' legales.lju_jurisdiccion ju, art.cpv_provincias pv, rib_retencioningbrutos ' +
            ' WHERE cp.cp_conpago = pl.pl_conpago' +
              ' AND pl_cuitcuil = pa_cuitcuil' +
              ' AND ib_provincia(+) = pa_provincia' +
              ' AND ib_codigo(+) = pa_retingresosbrutos' +
              ' AND tb_clave(+) = ''SIVA''' +
              ' AND tb_codigo(+) = pa_iva' +
              ' AND pl.pl_estado IN (''E'', ''X'') ' +
              ' AND pl.pl_fechaaprobado >= :p1' +
              ' AND pl.pl_fechaaprobado < :p2' +
              ' AND jt.jt_id = pl.pl_idjuicioentramite' +
              ' AND ju.ju_id = jt.jt_idjurisdiccion' +
              ' AND pv.pv_codigo = ju.ju_idprovincia'
        else
          sSql :=
            'SELECT lj_beneficiario iddetallebeneficiario, lj_cuitcuil cuitcuil, lj_paguesea nombre,' +
                  ' tb_descripcion retiva, ''N'' ibrutos, nvl(pa_retganancias, ' + SqlValue(NO_RETIENE) + ') retgan,' +
                  ' lj_chequenombre beneficiario, NULL domicilio, pa_localidad localidad, pa_codpostal cpostal, pa_telcod codareatelefonos,' +
                  ' pa_telnum telefonos, pv_descripcion provincia,' +
                  SqlValue (CUENTA_PASIVO_CON_SINIESTRO) + ' ctapago,' +
                  ' lj_idbeneficiario idbeneficiariopago, ' +
                  ' ib_wh_zone_code, ib_wh_conc_code ' +
             ' FROM art.cpv_provincias, legales.llj_liquidacionjuicio, spa_pagoacre, ctb_tablas, rib_retencioningbrutos ' +
            ' WHERE lj_cuitcuil = pa_cuitcuil' +
              ' AND tb_clave(+) = ''SIVA''' +
              ' AND tb_codigo(+) = pa_iva' +
              ' AND ib_provincia(+) = pa_provincia' +
              ' AND ib_codigo(+) = pa_retingresosbrutos' +
              ' AND pa_provincia = pv_codigo(+) ' +
              ' AND lj_fechaaprobado >= :p1' +
              ' AND lj_fechaaprobado < :p2';
      end;
    pl_Sumario:    // Pagos de Sumarios
      begin
        sTipoListado := '7';
        if Fecha <= StrToDate('28/02/2011') then
          sSql :=
            'SELECT ps_iddetallebeneficiario iddetallebeneficiario, ps_cuitcuil cuitcuil, ps_paguesea nombre, ' +
                    SqlValue(IVA_EXENTO) + ' retiva, ''N'' ibrutos, ' + SqlValue(NO_RETIENE) + ' retgan,' +
                  ' ps_chequenombre beneficiario, NULL domicilio, NULL localidad, NULL cpostal, NULL codareatelefonos,' +
                  ' NULL telefonos, pv_descripcion provincia, cp_ctapago ctapago, ps_letrafactura letrafactura, ' +
                  ' ps_idbeneficiariopago idbeneficiariopago, ' +
                  ' NULL ib_wh_zone_code, NULL ib_wh_conc_code ' +
             ' FROM legales.lps_pagosumario ps, art.scp_conpago cp, legales.lsu_sumario su, legales.lju_jurisdiccion ju,' +
                  ' art.cpv_provincias pv ' +
            ' WHERE cp.cp_conpago = ps.ps_conpago' +
              ' AND ps.ps_estado IN (''E'', ''X'') ' +
              ' AND ps.ps_fechaaprobado >= :p1' +
              ' AND ps.ps_fechaaprobado < :p2' +
              ' AND su.su_id = ps.ps_idsumario' +
              ' AND ju.ju_id = su.su_idjurisdiccion' +
              ' AND pv.pv_codigo = ju.ju_idprovincia'
        else
          sSql :=
            'SELECT ls_beneficiario iddetallebeneficiario, ls_cuitcuil cuitcuil, ls_paguesea nombre,' +
                  ' tb_descripcion retiva, ''N'' ibrutos, nvl(pa_retganancias, ' + SqlValue(NO_RETIENE) + ') retgan,' +
                  ' ls_chequenombre beneficiario, NULL domicilio, pa_localidad localidad, pa_codpostal cpostal, pa_telcod codareatelefonos,' +
                  ' pa_telnum telefonos, pv_descripcion provincia,' +
                  SqlValue (CUENTA_PASIVO_CON_SINIESTRO) + ' ctapago,' +
                  ' ls_idbeneficiario idbeneficiariopago, ' +
                  ' ib_wh_zone_code, ib_wh_conc_code ' +
             ' FROM art.cpv_provincias, legales.lls_liquidacionsumario, spa_pagoacre, ctb_tablas, rib_retencioningbrutos ' +
            ' WHERE ls_cuitcuil = pa_cuitcuil' +
              ' AND tb_clave(+) = ''SIVA''' +
              ' AND tb_codigo(+) = pa_iva' +
              ' AND ib_provincia(+) = pa_provincia' +
              ' AND ib_codigo(+) = pa_retingresosbrutos' +
              ' AND pa_provincia = pv_codigo(+) ' +
              ' AND ls_fechaaprobado >= :p1' +
              ' AND ls_fechaaprobado < :p2';
      end;
    pl_Mediacion:  // Pagos de Mediaciones
      begin
        sTipoListado := '8';
        if Fecha <= StrToDate('28/02/2011') then
          sSql :=
            'SELECT pm_iddetallebeneficiario iddetallebeneficiario, pm_cuitcuil cuitcuil, pm_paguesea nombre, ' +
                    SqlValue(IVA_EXENTO) + ' retiva, ''N'' ibrutos, ' + SqlValue(NO_RETIENE) + ' retgan,' +
                  ' pm_chequenombre beneficiario, NULL domicilio, NULL localidad, NULL cpostal, NULL codareatelefonos,' +
                  ' NULL telefonos, NULL provincia,' +
                  ' DECODE(me_nosiniestro, ''S'', REPLACE(' + SqlValue (CUENTA_MEDIAC_SIN_SINIESTRO) + ', ''-''), cp_ctapago) ctapago,' +
                  ' pm_letrafactura letrafactura, pm_idbeneficiariopago idbeneficiariopago, ' +
                  ' NULL ib_wh_zone_code, NULL ib_wh_conc_code ' +
             ' FROM legales.lpm_pagomediacion pm, art.scp_conpago cp, legales.lme_mediacion me' +
            ' WHERE cp.cp_conpago = pm.pm_conpago' +
              ' AND pm.pm_estado IN (''E'', ''X'') ' +
              ' AND pm.pm_fechaaprobado >= :p1' +
              ' AND pm.pm_fechaaprobado < :p2' +
              ' AND me.me_id = pm.pm_idmediacion'
        else
          sSql :=
            'SELECT lm_beneficiario iddetallebeneficiario, lm_cuitcuil cuitcuil, lm_paguesea nombre,' +
                  ' tb_descripcion retiva, ''N'' ibrutos, nvl(pa_retganancias, ' + SqlValue(NO_RETIENE) + ') retgan,' +
                  ' lm_chequenombre beneficiario, NULL domicilio, pa_localidad localidad, pa_codpostal cpostal, pa_telcod codareatelefonos,' +
                  ' pa_telnum telefonos, pv_descripcion provincia,' +
                  SqlValue (CUENTA_PASIVO_CON_SINIESTRO) + ' ctapago,' +
                  ' lm_idbeneficiario idbeneficiariopago, ' +
                  ' ib_wh_zone_code, ib_wh_conc_code ' +
             ' FROM art.cpv_provincias, legales.llm_liquidacionmediacion, spa_pagoacre, ctb_tablas, ' +
                  ' rib_retencioningbrutos ' +
            ' WHERE lm_cuitcuil = pa_cuitcuil' +
              ' AND tb_clave(+) = ''SIVA''' +
              ' AND tb_codigo(+) = pa_iva' +
              ' AND ib_provincia(+) = pa_provincia' +
              ' AND ib_codigo(+) = pa_retingresosbrutos' +
              ' AND pa_provincia = pv_codigo(+) ' +
              ' AND lm_fechaaprobado >= :p1' +
              ' AND lm_fechaaprobado < :p2';
      end;
    pl_Honorarios:  // Pagos de Honorarios
      begin
        sTipoListado := '9';
        sSql :=
          'SELECT NULL iddetallebeneficiario, gc_cuit cuitcuil, gc_nombre nombre,' +
                ' tb_descripcion retiva, ''N'' ibrutos, nvl(gc_ganancias, ' + SqlValue(NO_RETIENE) + ') retgan,' +
                ' gc_nombre beneficiario, art.utiles.armar_domicilio(gc_calle, gc_numero, gc_piso, gc_departamento, NULL) domicilio, gc_localidad localidad,' +
                ' gc_cpostal cpostal, gc_codareatelefonos codareatelefonos,' +
                ' gc_telefonos telefonos, pv_descripcion provincia,' +
                ' REPLACE(' + SqlValue (CUENTA_HONORARIOS_LEGALES) + ', ''-'') ctapago,' +
                ' fh_tipo letrafactura, gc_id idbeneficiariopago, ' +
                ' NULL ib_wh_zone_code, NULL ib_wh_conc_code ' +
           ' FROM ctb_tablas, art.cpv_provincias, agc_gestorcuenta, lfh_facturahonorario' +
          ' WHERE gc_id = fh_idgestor' +
            ' AND gc_provincia = pv_codigo(+)' +
            ' AND tb_clave(+) = ''SIVA''' +
            ' AND tb_codigo(+) = gc_iva' +
            ' AND fh_fechaaprobado >= :p1' +
            ' AND fh_fechaaprobado < :p2';
      end;
  end;

  Limpiar_TablaTemporalProv(sTipoListado);

	with GetQueryEx(sSql, [TDateTimeEx.Create(FDesde), TDateTimeEx.Create(FHasta)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('cuitcuil').AsString;
        DocGuiones := PonerGuiones(Doc);

        if Not FieldByName('ib_wh_zone_code').IsNull then
        	sRetieneIngBrutos := YES
        else
        	sRetieneIngBrutos := '';

        bEsTrabajador := IsTrabajador_PagosLegales(TipoPagoLegal, FieldByName('idbeneficiariopago').AsInteger);

        bOK := False;

        if bEsTrabajador then
          begin
            if Doc = '' then
              sMotivoError := 'El CUIL es nulo'
            else if not IsCuil(Doc) then
              sMotivoError := 'El CUIL es inválido'
            else
              bOK := True;
          end
        else
          begin
            if Doc = '' then
              sMotivoError := 'El CUIT es nulo'
            else if not IsCuit(Doc) then
              sMotivoError := 'El CUIT es inválido'
            else
              bOK := True;
          end;

        if bOK then
        begin
        	sNombreAcreedor := FieldByName('nombre').AsString;
          MostrarEstado('Proveedores: Acreedores Legales (' + FieldByName('iddetallebeneficiario').AsString + ' - ' + sNombreAcreedor + ') ...');

          if bEsTrabajador then
            begin
              if StrMid(DocGuiones, 13, 1) = '*' then
                sTipoDoc := 'CUILPD'
              else
                sTipoDoc := 'CUIL';

              sTipoAcreedor := 'TA';     // Trabajador Afiliado
              IdAcreedor    := FieldByName('iddetallebeneficiario').AsInteger;

              bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta,
                                                              sCBU1, sCBU2, sSucursal);

              VAT_CODE            := IVA_EXENTO;
              INCOME_WH_DFLT_CODE := NO_RETIENE;
            end
          else
            begin
              if TipoPagoLegal = pl_Honorarios then
                bDatosCuentaBancaria := Get_DatosCuentaBancaria('EJ', FieldByName('idbeneficiariopago').AsInteger, '', sTipoCuenta, sNroCuenta,
                                                                sCBU1, sCBU2, sSucursal)
              else
                begin
                  sSql := 'SELECT PA_ID, PA_ACREEDOR ' +
                            'FROM SPA_PAGOACRE ' +
                           'WHERE PA_CUITCUIL = ' + SqlValue(Doc);

                  SqlResults := ValoresColSql(sSql);
                  try
                    if SqlResults[0] = '' then
                      bDatosCuentaBancaria := False
                    else
                      begin
                        IdSPA         := StrToInt(SqlResults[0]);
                        sTipoAcreedor := SqlResults[1];

                        bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdSPA, '', sTipoCuenta, sNroCuenta,
                                                                        sCBU1, sCBU2, sSucursal);
                      end;
                  finally
                    SqlResults.Free;
                  end;
                end;

              sTipoDoc := 'CUIT';

              VAT_CODE            := Iif(FieldByName('retiva').IsNull, IVA_EXENTO, FieldByName('retiva').AsString);
              INCOME_WH_DFLT_CODE := FieldByName('retgan').AsString;
            end;

          Insert_AC_AC_B_Vendors_Int(sNombreAcreedor, LEGALES_TERMS, LEGALES_GROUP,
                                     CURRENCY_CODE, VAT_CODE, sTipoDoc,
                                     StringReplace(Doc, '*', '', [rfReplaceAll]), DocGuiones, FieldByName('ibrutos').AsString,
                                     '', YES, '0',
                                     '', NO_RETIENE, YES,
                                     '0', '', INCOME_WH_DFLT_CODE,
                                     sRetieneIngBrutos, FieldByName('ib_wh_Zone_Code').AsString, 0,
                                     '', FieldByName('ib_wh_Conc_Code').AsString, NO,
                                     'R', StrLeft(NVL(FieldByName('beneficiario').AsString, sNombreAcreedor), 80), YES,
                                     StrLeft(FieldByName('domicilio').AsString, 35), StrMid(FieldByName('domicilio').AsString, 36, 35), StrLeft(FieldByName('localidad').AsString, 25),
                                     '', FieldByName('cpostal').AsString, FieldByName('provincia').AsString,
                                     COUNTRY_CODE, FieldByName('codareatelefonos').AsString, StrLeft(FieldByName('telefonos').AsString, 15),
                                     '', '', DGI_SERVICIOS,
                                     Financial_GLGetCodeCombinationID(FieldByName('ctapago').AsString), Financial_GLGetCodeCombinationID(FieldByName('ctapago').AsString), LEGALES_LOOKUP,
                                     DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('provincia').AsString), sTipoCuenta,
                                     sNroCuenta, sSucursal, sCBU1,
                                     sCBU2, NO, '',
                                     '','','',
                                     bDatosCuentaBancaria, 'N');

          if not VendorExists( DocGuiones, sTipoDoc ) then
          	bResult := True;
        end
        else
        	Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, '', FieldByName('nombre').AsString,
                                        FieldByName('iddetallebeneficiario').AsString, sNombreAcreedor, '', '',
                                        sTipoDoc, Doc, sMotivoError);
        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg(E, 'Error al exportar Proveedores Acreedores Legales.');
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

procedure TfrmAdmInterfaces.Financial_PagosLegales(Fecha: TDateTime; TipoPagoLegal: TTipoPagoLegal);
var
  FechaCont, FDesde, FHasta: TDateTime;
  sFacturaNro, DocGuiones, sDescripcionFactura, sAcreedor, sSql: String;
  sEstado, sTipoListado: String;
  sTipoDoc, sMotivoError, Doc: String;
  bEsTrabajador, bHuboErrores: Boolean;
begin
  FDesde := Fecha;
  FHasta := IncDay(Fecha, 1);

  dmFinancials.BeginTrans;
  try
    MostrarEstado('Cuentas a Pagar: Pagos Legales...');

    bHuboErrores := False;

    // Liquidaciones a pagar
    case TipoPagoLegal of
      pl_Juicio:     // Pagos de Juicios
        begin
          sTipoListado := '6';
          if Fecha <= StrToDate('28/02/2011') then
            sSql :=
              'SELECT DISTINCT pl.pl_id idpago, pl.pl_cuitcuil cuitcuil, pl_idbeneficiariopago idbeneficiariopago,' +
                             ' pl_idjuicioentramite idjuicio, pl_numpago numpago,' +
                             ' pl.pl_letrafactura || ''-'' || pl.pl_situacionfactura || ''-'' || pl.pl_numerofactura nrofactura,' +
                             ' NVL(pl.pl_importepago, 0) importesinret, NVL(pl.pl_importeconretencion, 0) importeconret,' +
                             ' pl.pl_iddetallebeneficiario iddetallebeneficiario, pl.pl_paguesea nombre,' +
                             ' cp.cp_conpago conpago,' +
                             ' cp.cp_denpago || '' - CARPETA '' || TO_CHAR(jt.jt_numerocarpeta) denpago,' +
                             ' CASE ' +
                             ' WHEN (jt.jt_juicionosiniestro = 1 AND cp.cp_conpago <> ''109'') THEN ' + SqlValue(CUENTA_JUICIO_SIN_SINIESTRO) +
                             ' ELSE ART.FNCL.cuenta_ponerguiones(ART.FNCL.get_cuentapagofacturajuicios(jt.jt_gpba, pl.pl_fechaaprobado, pl.pl_conpago)) ' +
                             ' END ctapago,' +
                             ' cp.cp_retencion retencion, pl.pl_chequenombre chequenombre,' +
                             ' DECODE(jt.jt_juicionosiniestro, NULL, ''S'', 0, ''S'', 1, ''N'') consiniestro, ''LPL '' codtabla,' +
                             ' pl_pagoexclusivo pagoexclusivo, jt.jt_numerocarpeta carpeta, NULL metodopago ' +
                        ' FROM legales.lpl_pagolegal pl, art.scp_conpago cp, legales.ljt_juicioentramite jt' +
                       ' WHERE cp.cp_conpago = pl.pl_conpago' +
                         ' AND jt.jt_id = pl.pl_idjuicioentramite' +
                         ' AND pl.pl_fechaaprobado >= :p1' +
                         ' AND pl.pl_fechaaprobado < :p2' +
                         ' AND pl.pl_estado IN (''E'', ''X'')'
          else
            sSql :=
              'SELECT lj_id idpago, lj_cuitcuil cuitcuil, lj_beneficiario idbeneficiariopago,' +
                             ' NULL idjuicio, NULL numpago,' +
                             ' ''L-0000-'' || LPAD(lj_id, 8, ''0'') nrofactura,' +
                             ' SUM(NVL(pl_importepago, 0)) importesinret, SUM(NVL(pl_importeconretencion, 0)) importeconret,' +
                             ' lj_idbeneficiario iddetallebeneficiario, lj_paguesea nombre,' +
                             ' NULL conpago,' +
                             ' NULL denpago,' +
                             ' NULL ctapago,' +
                             ' NULL retencion, lj_chequenombre chequenombre,' +
                             ' NULL consiniestro, ''LPL'' codtabla,' +
                             ' lj_pagoexclusivo pagoexclusivo, 0 carpeta, CASE WHEN MAX(lj_cbu1) IS NOT NULL THEN ''TR'' END metodopago ' +
                        ' FROM legales.lpl_pagolegal,legales.llj_liquidacionjuicio' +
                       ' WHERE lj_id = pl_idliquidacion ' +
                         ' AND lj_fechaaprobado >= :p1' +
                         ' AND lj_fechaaprobado < :p2' +
                         ' AND pl_estado IN (''E'', ''X'')' +
                       ' GROUP BY lj_id, lj_cuitcuil, lj_beneficiario,' +
                             ' lj_idbeneficiario, lj_paguesea,' +
                             ' lj_chequenombre,' +
                             ' lj_pagoexclusivo';
        end;
      pl_Sumario:    // Pagos de Sumarios
        begin
          sTipoListado := '7';
          if Fecha <= StrToDate('28/02/2011') then
            sSql :=
              'SELECT DISTINCT ps_id idpago, ps_cuitcuil cuitcuil, ps_idbeneficiariopago idbeneficiariopago,' +
                             ' ps_idsumario idjuicio, ps_numpago numpago,' +
                             ' ps_letrafactura || ''-'' || ps_situacionfactura || ''-'' || ps_numerofactura nrofactura,' +
                             ' NVL(ps_importepago, 0) importesinret, NVL(ps_importeconretencion, 0) importeconret,' +
                             ' ps_iddetallebeneficiario iddetallebeneficiario, ps_paguesea nombre, cp_conpago conpago,' +
                             ' cp_denpago || '' - SUMARIO '' || TO_CHAR(su_numerosumario) denpago, ' +
                             ' ART.FNCL.cuenta_ponerguiones(ART.FNCL.get_cuentapagofacturasumarios(su.su_idart, ps.ps_fechaaprobado, ps.ps_conpago)) ctapago,' +
                             ' cp_retencion retencion, ps_chequenombre chequenombre,' +
                             ' DECODE((SELECT DISTINCT 1' +
                                                ' FROM ctb_tablas, ctj_trabajadores, cmp_empresas, sex_expedientes expe,' +
                                                     ' legales.lss_siniestrosumario lss' +
                                               ' WHERE NVL(ex_tipo, ''1'') = tb_codigo(+)' +
                                                 ' AND tb_clave = ''STIPO''' +
                                                 ' AND mp_cuit = ex_cuit' +
                                                 ' AND tj_cuil = ex_cuil' +
                                                 ' AND ex_siniestro = lss.ss_siniestro' +
                                                 ' AND expe.ex_orden = lss.ss_orden' +
                                                 ' AND expe.ex_recaida = lss.ss_recaida' +
                                                 ' AND lss.ss_idsumario = su.su_id), NULL, ''N'', ''S'') consiniestro,' +
                             ' ''LPS '' codtabla, ps_pagoexclusivo pagoexclusivo, su_numerosumario carpeta, NULL metodopago ' +
                        ' FROM legales.lps_pagosumario ps, art.scp_conpago cp, legales.lsu_sumario su' +
                       ' WHERE cp.cp_conpago = ps.ps_conpago' +
                         ' AND su.su_id = ps.ps_idsumario' +
                         ' AND ps.ps_fechaaprobado >= :p1' +
                         ' AND ps.ps_fechaaprobado < :p2' +
                         ' AND ps.ps_estado IN (''E'', ''X'')'
          else
            sSql :=
              'SELECT ls_id idpago, ls_cuitcuil cuitcuil, ls_beneficiario idbeneficiariopago,' +
                             ' NULL idjuicio, NULL numpago,' +
                             ' ''L-0001-'' || LPAD(ls_id, 8, ''0'') nrofactura,' +
                             ' SUM(NVL(ps_importepago, 0)) importesinret, SUM(NVL(ps_importeconretencion, 0)) importeconret,' +
                             ' ls_idbeneficiario iddetallebeneficiario, ls_paguesea nombre,' +
                             ' NULL conpago,' +
                             ' NULL denpago,' +
                             ' NULL ctapago,' +
                             ' NULL retencion, ls_chequenombre chequenombre,' +
                             ' NULL consiniestro, ''LPS'' codtabla,' +
                             ' ls_pagoexclusivo pagoexclusivo, 0 carpeta, NULL metodopago ' +
                        ' FROM legales.lps_pagosumario, legales.lls_liquidacionsumario' +
                       ' WHERE ls_id = ps_idliquidacion ' +
                         ' AND ls_fechaaprobado >= :p1' +
                         ' AND ls_fechaaprobado < :p2' +
                         ' AND ps_estado IN (''E'', ''X'')' +
                       ' GROUP BY ls_id, ls_cuitcuil, ls_beneficiario,' +
                             ' ls_idbeneficiario, ls_paguesea,' +
                             ' ls_chequenombre,' +
                             ' ls_pagoexclusivo';
        end;
      pl_Mediacion:  // Pagos de Mediaciones
        begin
          sTipoListado := '8';
          if Fecha <= StrToDate('28/02/2011') then
            sSql :=
              'SELECT DISTINCT pm.pm_id idpago, pm.pm_cuitcuil cuitcuil, pm_idbeneficiariopago idbeneficiariopago,' +
                             ' pm_idmediacion idjuicio, pm_numpago numpago,' +
                             ' pm.pm_letrafactura || ''-'' || pm.pm_situacionfactura || ''-'' || pm.pm_numerofactura nrofactura,' +
                             ' NVL(pm.pm_importepago, 0) importesinret, NVL(pm.pm_importeconretencion, 0) importeconret,' +
                             ' pm.pm_iddetallebeneficiario iddetallebeneficiario, pm.pm_paguesea nombre,' +
                             ' cp.cp_conpago conpago,' +
                             ' cp.cp_denpago || '' - FOLIO '' || TO_CHAR(me.me_numerofolio) denpago,' +
                             ' DECODE(me.me_nosiniestro, ''S'', ' + SqlValue(CUENTA_MEDIAC_SIN_SINIESTRO) + ', ART.FNCL.cuenta_ponerguiones(ART.FNCL.get_cuentapagofacturamediacion(me.me_gpba, pm.pm_fechaaprobado, pm.pm_conpago))) ctapago,' +
                             ' cp.cp_retencion retencion, pm.pm_chequenombre chequenombre,' +
                             ' NVL(me.me_nosiniestro, ''S'') consiniestro, ''LPM '' codtabla,' +
                             ' pm_pagoexclusivo pagoexclusivo, me.me_numerofolio carpeta, NULL metodopago ' +
                        ' FROM legales.lpm_pagomediacion pm, art.scp_conpago cp, legales.lme_mediacion me' +
                       ' WHERE cp.cp_conpago = pm.pm_conpago' +
                         ' AND me.me_id = pm.pm_idmediacion' +
                         ' AND pm.pm_fechaaprobado >= :p1' +
                         ' AND pm.pm_fechaaprobado < :p2' +
                         ' AND pm.pm_estado IN (''E'', ''X'')'
          else
            sSql :=
              'SELECT lm_id idpago, lm_cuitcuil cuitcuil, lm_beneficiario idbeneficiariopago,' +
                             ' NULL idjuicio, NULL numpago,' +
                             ' ''L-0002-'' || LPAD(lm_id, 8, ''0'') nrofactura,' +
                             ' SUM(NVL(pm_importepago, 0)) importesinret, SUM(NVL(pm_importeconretencion, 0)) importeconret,' +
                             ' lm_idbeneficiario iddetallebeneficiario, lm_paguesea nombre,' +
                             ' NULL conpago,' +
                             ' NULL denpago,' +
                             ' NULL ctapago,' +
                             ' NULL retencion, lm_chequenombre chequenombre,' +
                             ' NULL consiniestro, ''LPM'' codtabla,' +
                             ' lm_pagoexclusivo pagoexclusivo, 0 carpeta, NULL metodopago ' +
                        ' FROM legales.lpm_pagomediacion, legales.llm_liquidacionmediacion' +
                       ' WHERE lm_id = pm_idliquidacion ' +
                         ' AND lm_fechaaprobado >= :p1' +
                         ' AND lm_fechaaprobado < :p2' +
                         ' AND pm_estado IN (''E'', ''X'')' +
                       ' GROUP BY lm_id, lm_cuitcuil, lm_beneficiario,' +
                             ' lm_idbeneficiario, lm_paguesea,' +
                             ' lm_chequenombre,' +
                             ' lm_pagoexclusivo';
        end;
      pl_Honorarios:  // Pagos de Honorarios
        begin
          sTipoListado := '9';
          sSql :=
            'SELECT fh_id idpago, gc_cuit cuitcuil, gc_id idbeneficiariopago, NULL idjuicio, 0 numpago,' +
                  ' fh_tipo || ''-'' || fh_numero nrofactura, fh_iva importesinret, fh_importe importeconret, NULL iddetallebeneficiario,' +
                  ' gc_nombre nombre, NULL conpago, ' + SqlValue(CONCEPTO_HONORARIOS_GESTDEUDA) + ' denpago,' +
                  SqlValue(CUENTA_HONORARIOS_LEGALES) + ' ctapago, NULL retencion, gc_nombre chequenombre,' +
                  ' NULL consiniestro, ''LFH'' codtabla, ''N'' pagoexclusivo, 0 carpeta, NULL metodopago' +
             ' FROM agc_gestorcuenta, lfh_facturahonorario' +
            ' WHERE gc_id = fh_idgestor' +
              ' AND fh_fechaaprobado >= :p1' +
              ' AND fh_fechaaprobado < :p2';
        end;
    end;

    Limpiar_TablaTemporalFactLiq(sTipoListado);

    with GetQueryEx(sSql, [TDateTimeEx.Create(FDesde), TDateTimeEx.Create(FHasta)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('cuitcuil').AsString;
        DocGuiones := PonerGuiones(Doc);
        FechaCont  := Fecha;
        sAcreedor  := FieldByName('iddetallebeneficiario').AsString;

        bEsTrabajador := IsTrabajador_PagosLegales(TipoPagoLegal, FieldByName('idbeneficiariopago').AsInteger);

        if bEsTrabajador then
          begin
            if StrMid(Doc, 11, 1) = '*' then
              sTipoDoc := 'CUILPD'
            else
              sTipoDoc := 'CUIL';
          end
        else
          sTipoDoc   := 'CUIT';

        if ((bEsTrabajador and IsCuil(Doc)) or (not bEsTrabajador and IsCuit(Doc))) and VendorExists(DocGuiones, sTipoDoc) then
        begin
        	sEstado             := 'Cuentas a Pagar: Legales (' + sAcreedor + ' - ' + FieldByName('nombre').AsString + ') ...';
          sFacturaNro         :=  FieldByName('nrofactura').AsString;
          if FieldByName('denpago').IsNull then
            sDescripcionFactura := 'FCT ' + FieldByName('nrofactura').AsString
          else
            sDescripcionFactura := 'FCT ' + FieldByName('nrofactura').AsString + ' - ' + FieldByName('denpago').AsString;

          Financial_ExportarLegales(sEstado, sFacturaNro, sDescripcionFactura,
                                    Doc, DocGuiones, FechaCont,
                                    FieldByName('importesinret').AsCurrency, FieldByName('importeconret').AsCurrency, FieldByName('idpago').AsInteger,
                                    FieldByName('ctapago').AsString, FieldByName('retencion').AsString = 'S', FieldByName('chequenombre').AsString,
                                    FieldByName('conpago').AsString, FieldByName('denpago').AsString, FieldByName('consiniestro').AsString,
                                    FieldByName('codtabla').AsString, sTipoDoc, FieldByName('pagoexclusivo').AsString,
                                    FieldByName('idpago').AsInteger, FieldByName('carpeta').AsInteger, FieldByName('metodopago').AsString);
        end
        else
        begin
        	bHuboErrores := True;

          if bEsTrabajador and not IsCuil(Doc) then
            sMotivoError := 'El CUIL es inválido'
          else if not bEsTrabajador and not IsCuit(Doc) then
            sMotivoError := 'El CUIT es inválido'
          else
            sMotivoError := 'Proveedor inexistente';

          Insert_ErroresExportacionLiqFNCL(Sesion.UserId, sTipoListado, FieldByName('Nombre').AsString, sTipoDoc, Doc,
                                           '', sMotivoError, FieldByName('numpago').AsInteger,
                                           FieldByName('importesinret').AsCurrency + FieldByName('importeconret').AsCurrency, '');
        end;

        Next;
      end;
    finally
    	Free;
    end;

    if bHuboErrores then
      Do_GenerarListado_Siniestros(sTipoListado, Fecha, 0);

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Pagos Legales.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.Financial_ExportarLegales(Estado, FacturaNro, DescripcionFactura,
                                                      Doc, DocGuiones: String; FechaCont: TDateTime;
                                                      ImporteSinRet, ImporteConRet: Currency; IdLiq: TTableId;
                                                      CuentaContable: String; Retencion: Boolean; BeneficiarioCheque,
                                                      ConceptoPago, DescripcionConceptoPago, JuicioConSiniestro,
                                                      CodTabla, TipoDoc, PagoIndependiente: String;
                                                      IdLiquidacion, Carpeta: Integer; MetodoPago: String);
var
  iSequence: Integer;
  sSql, sPagoIndependiente: String;
  IdBanco: TTableId;
begin
  MostrarEstado(Estado);

  iSequence := Financial_APGetSequence();

  if PagoIndependiente = 'N' then
    sPagoIndependiente := NO
  else if PagoIndependiente = 'S' then
    sPagoIndependiente := YES
  else
    sPagoIndependiente := '';

  if IsEmptyString(MetodoPago) then
    IdBanco := ART_EMPTY_ID
  else
    IdBanco := 3;     // id del Banco Provincia

  Financial_APHeaderInsert(SOURCE_NAME, iSequence, FechaCont,
                           DescripcionFactura, IIF(JuicioConSiniestro = 'S', CUENTA_PASIVO_CON_SINIESTRO, CUENTA_PASIVO_SIN_SINIESTRO), ImporteSinRet+ImporteConRet,
                           DocGuiones, FacturaNro, Get_TipoFactura(ImporteSinRet+ImporteConRet, 'R'),
                           LEGALES_LOOKUP, TipoDoc, '',
                           '', True, '',
                           LEGALES_GROUP, '', sPagoIndependiente,
                           BeneficiarioCheque, FechaCont, '',
                           '', '', '',
                           CodTabla, IdLiquidacion, Carpeta,
                           '', MetodoPago, IdBanco,
                           '');

  if (FechaCont <= StrToDate('28/02/2011')) or (CodTabla = 'LFH') then
    begin
      Financial_APLineInsert(iSequence, Iif(DescripcionConceptoPago = CONCEPTO_HONORARIOS_GESTDEUDA, IVA, DescripcionConceptoPago), CuentaContable,
                             ITEM_NO_RETIENE_MAYUSC, ImporteSinRet, ConceptoPago,
                             False);

      if ImporteConRet <> 0 then
        Financial_APLineInsert(iSequence, DescripcionConceptoPago, CuentaContable,
                               'ITEM', ImporteConRet, ConceptoPago,
                               True);

      Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                             'TAX', 0, ConceptoPago,
                             False);
    end
  else
    begin
      if CodTabla = 'LPL' then
          sSql := 'SELECT pl.pl_id idpago, ' +
                        ' NVL(pl.pl_importepago, 0) importesinret, NVL(pl.pl_importeconretencion, 0) importeconret,' +
                        ' cp.cp_conpago conpago,' +
                        ' ''FACTURA '' || pl.pl_letrafactura || ''-'' || pl.pl_situacionfactura || ''-'' || pl.pl_numerofactura || '' '' || cp.cp_denpago || '' - CARPETA '' || TO_CHAR(jt.jt_numerocarpeta) denpago,' +
                        ' CASE ' +
                        ' WHEN (jt.jt_juicionosiniestro = 1 AND cp.cp_conpago <> ''109'') THEN ' + SqlValue(CUENTA_JUICIO_SIN_SINIESTRO) +
                        ' ELSE ART.FNCL.cuenta_ponerguiones(ART.FNCL.get_cuentapagofacturajuicios(jt.jt_gpba, pl.pl_fechaaprobado, pl.pl_conpago)) ' +
                        ' END ctapago,' +
                        ' ''LPL '' codtabla' +
                   ' FROM legales.lpl_pagolegal pl, art.scp_conpago cp, legales.ljt_juicioentramite jt' +
                  ' WHERE cp.cp_conpago = pl.pl_conpago' +
                    ' AND jt.jt_id = pl.pl_idjuicioentramite' +
                    ' AND pl.pl_idliquidacion = ' + SqlValue(IdLiquidacion) +
                    ' AND pl.pl_estado IN (''E'', ''X'')'
     else begin
        if CodTabla = 'LPS' then
          sSql := 'SELECT  ps_id idpago, ' +
              ' NVL(ps_importepago, 0) importesinret, NVL(ps_importeconretencion, 0) importeconret,' +
              ' cp_conpago conpago,' +
              ' ''FACTURA '' || ps_letrafactura || ''-'' || ps_situacionfactura || ''-'' || ps_numerofactura || '' '' || cp_denpago || '' - SUMARIO '' || TO_CHAR(su_numerosumario) denpago,' +
              ' ART.FNCL.cuenta_ponerguiones(ART.FNCL.get_cuentapagofacturasumarios(su_idart, ps_fechaaprobado, ps_conpago)) ctapago,' +
              ' ''LPS '' codtabla' +
         ' FROM legales.lps_pagosumario, art.scp_conpago, legales.lsu_sumario' +
        ' WHERE cp_conpago = ps_conpago' +
          ' AND su_id = ps_idsumario' +
          ' AND ps_idliquidacion = ' + SqlValue(IdLiquidacion) +
          ' AND ps_estado IN (''E'', ''X'')'
        else
          if CodTabla = 'LPM' then
            sSql := 'SELECT  pm_id idpago, ' +
                ' NVL(pm_importepago, 0) importesinret, NVL(pm_importeconretencion, 0) importeconret,' +
                ' cp_conpago conpago,' +
                ' ''FACTURA '' || pm_letrafactura || ''-'' || pm_situacionfactura || ''-'' || pm_numerofactura || '' '' || cp_denpago || '' - FOLIO '' || TO_CHAR(me_numerofolio) denpago,' +
                ' DECODE(me_nosiniestro, ''S'', ' + SqlValue(CUENTA_MEDIAC_SIN_SINIESTRO) + ', ART.FNCL.cuenta_ponerguiones(ART.FNCL.get_cuentapagofacturamediacion(me_gpba, pm_fechaaprobado, pm_conpago))) ctapago,' +
                ' ''LPM '' codtabla' +
           ' FROM legales.lpm_pagomediacion, art.scp_conpago, legales.lme_mediacion' +
          ' WHERE cp_conpago = pm_conpago' +
            ' AND me_id = pm_idmediacion' +
            ' AND pm_idliquidacion = ' + SqlValue(IdLiquidacion) +
            ' AND pm_estado IN (''E'', ''X'')';
      end;

        with GetQuery(sSql) do
          try
            while not Eof do
              begin
                Financial_APLineInsert(iSequence, FieldByName('denpago').AsString, FieldByName('ctapago').AsString,
                                       ITEM_NO_RETIENE_MAYUSC, FieldByName('importesinret').AsCurrency, FieldByName('conpago').AsString,
                                       False);

                if FieldByName('importeconret').AsCurrency <> 0 then
                  Financial_APLineInsert(iSequence, FieldByName('denpago').AsString, FieldByName('ctapago').AsString,
                                         'ITEM', FieldByName('importeconret').AsCurrency, FieldByName('conpago').AsString,
                                         True);

                Next;
              end;
              Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                                      'TAX', 0, '',
                                      False);
          finally
            free;
          end;
    end;
end;

{- Fin Legales --------------------------------------------------------------------------------------------------------}

procedure TfrmAdmInterfaces.Financial_ContratosFondoGarantiaInsert(IdFactura: TTableId; Sequence: Integer; ImporteFactura: Currency);
var
  sSql: String;
begin
  sSql := 'SELECT CO_CONTRATOPRINCIPAL CONTRATO, EM_NOMBRE NOMBRE, SUM(DP_IMPORTE) IMPORTE ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO_EXT, ZDP_DETALLEPAGOFONDOGTIA, ZPF_PAGOFONDOGARANTIA ' +
           'WHERE PF_ID = DP_IDPAGO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND CO_CONTRATO = DP_CONTRATO ' +
             'AND PF_ID = :IdFactura ' +
           'GROUP BY CO_CONTRATOPRINCIPAL, EM_NOMBRE';

  with GetQueryEx(sSql, [IdFactura]) do
  try
    while not EOF do
    begin
      Financial_APLineInsert(Sequence, 'Contrato: ' + FieldByName('contrato').AsString + ' - ' + FieldByName('nombre').AsString, CUENTA_COBRANZAS,
                             'ITEM', FieldByName('importe').AsCurrency, '',
                             False);
                             
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmAdmInterfaces.Financial_ExportarFondoGarantia(Estado, FacturaNro, DescripcionFactura,
                                                            Doc, DocGuiones: String; FechaCont: TDateTime;
                                                            ImporteFactura: Currency; IdFactura: TTableId);
var
  sGrupoDePagos: String;
  iSequence: Integer;
begin
  MostrarEstado(Estado);

  iSequence     := Financial_APGetSequence;
  sGrupoDePagos := COBRANZAS_LOOKUP;

  Financial_APHeaderInsert(SOURCE_NAME, iSequence, FechaCont,
                           DescripcionFactura, CUENTA_PASIVO_SIN_SINIESTRO, ImporteFactura,
                           DocGuiones, FacturaNro, Get_TipoFactura(ImporteFactura, 'Z'),
                           sGrupoDePagos, 'CUIT', '',
                           '', False, '',
                           COBRANZAS_GROUP, '', YES,
                           'BANCO DE LA NACION ARGENTINA', FechaCont, '',
                           '', '', '',
                           'ZPF', IdFactura, '',
                           '', '', ART_EMPTY_ID,
                           '');

  Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                         'TAX', 0, '',
                         False);

  Financial_ContratosFondoGarantiaInsert(IdFactura, iSequence, ImporteFactura);
end;

procedure TfrmAdmInterfaces.Financial_FondoGarantia(Fecha: TDateTime);
var
  FechaCont: TDateTime;
  sFacturaNro, DocGuiones, sDescripcionFactura, sSql: String;
  sEstado, Doc: String;
begin
  MostrarEstado('Cuentas a Pagar: Fondo de Garantía ...');

  dmFinancials.BeginTrans;
  try
    // Fondo de garantía liquidado a la SRT
    sSql := 'SELECT PF_ID NRO_PAGO, PF_IMPORTE IMPORTE ' +
              'FROM ZPF_PAGOFONDOGARANTIA ' +
             'WHERE PF_FECHAALTA >= :FECHA ' +
               'AND PF_FECHAALTA < :FECHA + 1 ' +
               'AND PF_FECHABAJA IS NULL ' +
             'ORDER BY PF_ID';

		with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc         := cNroCuitSRT;
        DocGuiones  := PonerGuiones(Doc);
        FechaCont   := Fecha;

        if IsCuit(Doc) and VendorExists(DocGuiones, 'CUIT') then
        begin
        	sEstado             := 'Cuentas a Pagar: Fondo de Garantía (Pago Nro. ' + FieldByName('nro_pago').AsString + ') ...';
          sFacturaNro         := '0000-' + LPad(FieldByName('nro_pago').AsString, '0', 8);
          sDescripcionFactura := 'Pago Nro. ' + FieldByName('nro_pago').AsString + ' del Fondo de Garantía';

          Financial_ExportarFondoGarantia(sEstado, sFacturaNro, sDescripcionFactura,
                                          Doc, DocGuiones, FechaCont,
                                          FieldByName('Importe').AsCurrency, FieldByName('nro_pago').AsInteger);
        end
        else
          MsgBox('Nro. de documento inválido', MB_ICONERROR);

        Next;
      end;
    finally
    	Free;
    end;

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Fondo de Garantía.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.Get_FondoTipo(FondoTipoAnt: String; var EsFondo: Boolean; var Tipo: String);
begin
  EsFondo := (StrLeft(FondoTipoAnt, 1) = 'S');
  Tipo    := StrMid(FondoTipoAnt, 2, 2);
end;

function TfrmAdmInterfaces.Get_ProxNroFactura(Siniestro, Orden, Recaida, NroLiquidacion: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT LE_PROXDIGFACTURA_FNCL' +
     ' FROM SLE_LIQUIEMPSIN' +
    ' WHERE LE_SINIESTRO = :p1' +
      ' AND LE_ORDEN = :p2' +
      ' AND LE_RECAIDA = :p3' +
      ' AND LE_NUMLIQUI = :p4';
  Result := Trim(ValorSqlEx(sSql, [Siniestro, Orden, Recaida, NroLiquidacion]));
end;

procedure Do_GenerarAsiento_Comisiones(FDesde, FHasta: TDateTime; IdLiqComision: TTableId; EsContraAsiento: Boolean);
var
  sEntidad, sFiltro, sSql: String;
  iAux_GroupId: Integer;
  bEsComisiones: Boolean;
  dDebito, dCredito: Currency;
  dtExHasta: TDateTimeEx;
begin
  iAux_GroupId := dmFinancials.GetSecNextVal('GL_interface_control_s');

  dtExHasta := nil;
  try
    if IdLiqComision = ART_EMPTY_ID then
      begin
        sFiltro   := 'AND CP_FECHACIERRE BETWEEN ' + SqlValue(FDesde) + ' AND ' + SqlValue(FHasta) + ' ' +
                     'AND CP_EXPORTADOFNCL IS NULL ' +
                     'AND LC_ESTADO <> ''C''';
        dtExHasta := TDateTimeEx.Create(FHasta, False);

        sEntidad := '';
      end
    else
      begin
        sFiltro   := 'AND LC_ID = ' + SqlValue(IdLiqComision);
        dtExHasta := TDateTimeEx.Create(DbDate(), False);

        sSql := 'SELECT EN_NOMBRE ' +
                  'FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
                 'WHERE EN_ID = LC_IDENTIDAD ' +
                   'AND LC_ID = :Id ' +
                 'UNION ALL ' +
                'SELECT VE_NOMBRE ' +
                  'FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
                 'WHERE EV_ID = LC_IDENTIDADVENDEDOR ' +
                   'AND VE_ID = EV_IDVENDEDOR ' +
                   'AND LC_ID = :Id';
        sEntidad := ValorSqlEx(sSql, [IdLiqComision, IdLiqComision]) + ' ';
      end;
    sFiltro := sFiltro + ' ';

    sSql:=
      'SELECT CONCEPTO, TOTAL, CUENTA, ESCOMISIONES ' +
        'FROM (SELECT ' + SqlValue(IVA) + ' CONCEPTO, NVL(SUM(PC_IVA), 0) TOTAL, ART.FNCL.CUENTA_PONERGUIONES(CO_CUENTACONTABLE) CUENTA, ' +
                    '''S'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION, XPC_PAGOCOMISION, XCO_CONCEPTO ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 'AND LC_ID = PC_IDLIQCOMISION ' +
                 'AND CO_ID = PC_IDCONCEPTO ' +
                 sFiltro +
               'GROUP BY CO_CUENTACONTABLE ' +
               'UNION ALL ' +
              'SELECT CO_DESCRIPCION CONCEPTO, SUM(PC_COMISION) TOTAL, ART.FNCL.CUENTA_PONERGUIONES(CO_CUENTACONTABLE) CUENTA, ''S'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION, XPC_PAGOCOMISION, XCO_CONCEPTO ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 'AND LC_ID = PC_IDLIQCOMISION ' +
                 'AND CO_ID = PC_IDCONCEPTO ' +
                 sFiltro +
               'GROUP BY CO_DESCRIPCION, CO_CUENTACONTABLE ' +
               'UNION ALL ' +
              'SELECT ''Retención Obra Social'' CONCEPTO, SUM(LC_OBRASOCIAL) TOTAL, ' + SqlValue(CUENTA_OBRASOCIAL) + ' CUENTA, ''N'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 sFiltro +
               'UNION ALL ' +
              'SELECT ''Retención IB '' || PV_DESCRIPCION || '' - '' || TB_DESCRIPCION CONCEPTO, SUM(IL_RETENCION) TOTAL, ''01-'' || TB_ESPECIAL1 || ''-000-'' || LPAD(IL_PROVINCIA, 2, ''0'') || ''-0000-0000-0000'' CUENTA, ''N'' ESCOMISIONES ' +
                'FROM CTB_TABLAS, CPV_PROVINCIAS, XCP_CIERREPAGO, XIL_IBLIQUIDACION, XLC_LIQCOMISION ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 'AND LC_ID = IL_IDLIQUIDACION ' +
                 'AND PV_CODIGO = IL_PROVINCIA ' +
                 'AND TB_CLAVE = ''RETIB'' ' +
                 'AND TB_CODIGO = IL_CONCEPTO ' +
                 sFiltro +
               'GROUP BY IL_PROVINCIA, PV_DESCRIPCION, TB_ESPECIAL1, TB_DESCRIPCION ' +
               'UNION ALL ' +
              'SELECT ''Retención Ganancias'' CONCEPTO, SUM(LC_GANANCIAS) TOTAL, ' + SqlValue(CUENTA_RET_IMPUESTOGANANCIAS) + ' CUENTA, ''N'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 sFiltro +
               'UNION ALL ' +
              'SELECT ''Retención IVA'' CONCEPTO, SUM(LC_RETIVA) TOTAL, ' + SqlValue(CUENTA_RETIVA) + ' CUENTA, ''N'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 sFiltro +
               'UNION ALL ' +
              'SELECT ''Aportes Obra Social'' CONCEPTO, SUM(LC_OBRASOCIAL) TOTAL, ' + SqlValue(CUENTA_OBRASOCIAL) + ' CUENTA, ''N'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 'AND NVL(LC_IDENTIDAD, 0) <> 9003 ' +
                 sFiltro +
               'UNION ALL ' +
              'SELECT ''Aportes Obra Social'' CONCEPTO, SUM(LC_OBRASOCIAL) TOTAL, ' + SqlValue(CUENTA_OBRASOCIAL_PERD) + ' CUENTA, ''S'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 'AND NVL(LC_IDENTIDAD, 0) <> 9003 ' +
                 sFiltro +
               'UNION ALL ' +
              'SELECT ''Cuenta Corriente Productores'' CONCEPTO, SUM(LC_COMISIONNETA) TOTAL, ' + SqlValue(CUENTA_PASIVO_CCCOM) + ' CUENTA, ''N'' ESCOMISIONES ' +
                'FROM XCP_CIERREPAGO, XLC_LIQCOMISION ' +
               'WHERE CP_ID = LC_IDCIERREPAGO ' +
                 sFiltro + ') ' +
       'WHERE TOTAL <> 0';

      with GetQuery(sSql) do
      try
        while not Eof do
        begin
          bEsComisiones := (FieldByName('ESCOMISIONES').AsString = 'S');

          if (bEsComisiones and not EsContraAsiento) or (not bEsComisiones and EsContraAsiento) then
            begin
              dDebito  := FieldByName('TOTAL').AsCurrency;
              dCredito := 0;
            end
          else
            begin
              dDebito  := 0;
              dCredito := FieldByName('TOTAL').AsCurrency;
            end;

          if dCredito < 0 then
            begin
              dDebito  := -dCredito;
              dCredito := 0;
            end
          else if dDebito < 0 then
            begin
              dCredito := -dDebito;
              dDebito  := 0;
            end;

          sSql :=
           'INSERT INTO gl_interface ' +
           '(status, accounting_date, created_by, entered_dr, entered_cr, actual_flag, set_of_books_id, user_je_source_name, ' +
            'user_je_category_name, currency_code, reference1, reference2, reference4, reference5, reference10, code_combination_id, ' +
            'date_created, segment1, segment2, segment3, segment4, segment5, segment6, segment7, group_id) ' +
             'SELECT ''NEW'', :fFechaHasta, 1014, :Debito, :Credito, ''A'', 1, ''SIArt'', ''Comisiones'', ''PES'', ''Comisiones '' || :fFechaHasta, ' +
                    '''Comisiones '' || :fFechaHasta, ''Liquidación del Día '' || :fFechaHasta, ''Liquidación del Día '' || :fFechaHasta, ' +
                    ':Entidad || ''Concepto: '' || :concepto, code_combination_id, SYSDATE, segment1, segment2, segment3, segment4, segment5, segment6, segment7, :aux_group_id ' +
               'FROM gl_code_combinations ' +
              'WHERE segment1 || segment2 || segment3 || segment4 || segment5 || segment6 || segment7 = REPLACE(:CuentaContable, ''-'')';
          dmFinancials.EjecutarSqlSTEx(sSql, [dtExHasta, dDebito, dCredito, dtExHasta, dtExHasta, dtExHasta, dtExHasta, sEntidad, FieldByName('concepto').AsString, iAux_GroupId, FieldByName('cuenta').AsString]);

          Next;
        end;
      finally
        Free;
      end;

      sSql := 'UPDATE XLC_LIQCOMISION A ' +
                 'SET A.LC_FECHACONTABLE = :fechacont ' +
               'WHERE A.LC_ID IN (SELECT LC_ID ' +
                                   'FROM XCP_CIERREPAGO, XLC_LIQCOMISION B ' +
                                  'WHERE CP_ID = B.LC_IDCIERREPAGO ' +
                                   sFiltro + ') ' +
                 'AND A.LC_FECHACONTABLE IS NULL';
      EjecutarSqlSTEx(sSql, [dtExHasta]);

      sSql := 'UPDATE XCC_CUENTACORRIENTE A ' +
                 'SET A.CC_FECHA = :fechacont ' +
               'WHERE A.CC_IDLIQUIDACION IN (SELECT LC_ID ' +
                                              'FROM XCP_CIERREPAGO, XLC_LIQCOMISION B ' +
                                             'WHERE CP_ID = B.LC_IDCIERREPAGO ' +
                                              sFiltro + ') ' +
                 'AND A.CC_FECHA IS NULL';
      EjecutarSqlSTEx(sSql, [dtExHasta]);
  finally
    dtExHasta.Free;
  end;
end;

procedure TfrmAdmInterfaces.Financial_ExportarPagoEnExceso(Estado, FacturaNro, DescripcionFactura,
                                                           Doc, DocGuiones: String; FechaCont: TDateTime;
                                                           ImporteFactura: Currency; IdFactura: TTableId; Beneficiario: String;
                                                           Contrato: Integer);
var
  sGrupoDePagos: String;
  iSequence: Integer;
begin
  MostrarEstado(Estado);

  iSequence     := Financial_APGetSequence;
  sGrupoDePagos := COBRANZAS_LOOKUP;

  Financial_APHeaderInsert(SOURCE_NAME, iSequence, FechaCont,
                           DescripcionFactura, CUENTA_PASIVO_SIN_SINIESTRO, ImporteFactura,
                           DocGuiones, FacturaNro, Get_TipoFactura(ImporteFactura, 'Z'),
                           sGrupoDePagos, 'CUIT', '',
                           '', False, '',
                           COBRANZAS_GROUP, '', YES,
                           Beneficiario, FechaCont, '',
                           '', '', '',
                           'ZPE', IdFactura, '',
                           '', '', ART_EMPTY_ID,
                           '');

  Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                         'TAX', 0, '',
                         False);

  Financial_APLineInsert(iSequence, 'Contrato: ' + IntToStr(Contrato) + ' - ' + Beneficiario, CUENTA_COBRANZAS,
                         'ITEM', ImporteFactura, '',
                         False);
end;

procedure TfrmAdmInterfaces.Financial_PagoEnExceso(Fecha: TDateTime);
var
  FechaCont: TDateTime;
  sFacturaNro, DocGuiones, sDescripcionFactura, sSql: String;
  sBeneficiario, sEstado, Doc: String;
  iContrato: Integer;
begin
  MostrarEstado('Cuentas a Pagar: Devolución Pago en Exceso ...');

  dmFinancials.BeginTrans;
  try
    sSql := 'SELECT PE_ID NRO_PAGO, PE_IMPORTE IMPORTE, EM_CUIT CUIT, EM_NOMBRE NOMBRE, ' +
                   'CO_CONTRATO CONTRATO, TRIM(PE_BENEFICIARIO) BENEFICIARIO ' +
              'FROM AEM_EMPRESA, ACO_CONTRATO, ZPE_DEVOLUCIONPAGOEXCESO ' +
             'WHERE PE_FECHAALTA >= :FECHA ' +
               'AND PE_FECHAALTA < :FECHA + 1 ' +
               'AND PE_FECHABAJA IS NULL ' +
               'AND CO_IDEMPRESA = EM_ID ' +
               'AND CO_CONTRATO = PE_CONTRATO ' +
             'ORDER BY PE_ID';

		with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc         := FieldByName('CUIT').AsString;
        DocGuiones  := PonerGuiones(Doc);
        FechaCont   := Fecha;

        if IsCuit(Doc) and VendorExists(DocGuiones, 'CUIT') then
        begin
        	sEstado             := 'Cuentas a Pagar: Devolución Pago en Exceso (Pago Nro. ' + FieldByName('nro_pago').AsString + ') ...';
          sFacturaNro         := '0000-' + LPad(FieldByName('nro_pago').AsString, '0', 8);
          sDescripcionFactura := 'Pago Nro. ' + FieldByName('nro_pago').AsString + ' de la Devolución por Pago en Exceso';
          iContrato           := FieldByName('contrato').AsInteger;
          sBeneficiario       := FieldByName('beneficiario').AsString;

          Financial_ExportarPagoEnExceso(sEstado, sFacturaNro, sDescripcionFactura,
                                         Doc, DocGuiones, FechaCont,
                                         FieldByName('Importe').AsCurrency, FieldByName('nro_pago').AsInteger, sBeneficiario,
                                         iContrato);
        end
        else
          MsgBox('Nro. de documento inválido', MB_ICONERROR);

        Next;
      end;
    finally
    	Free;
    end;

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Devolución Pago en Exceso.');
      raise;
    end;
  end;
end;

function TfrmAdmInterfaces.Financial_ProveedoresPagoEnExceso(Fecha: TDateTime): Boolean;
var
  sNombreEmpresa, sTipoAcreedor, Doc, DocGuiones, sSql, sTipoListado, sBeneficiario: String;
  sMotivoError, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal, sDomicilio: String;
  bDatosCuentaBancaria, bResult, bOk: Boolean;
  IdAcreedor: TTableId;
begin
  bResult := False;
  MostrarEstado('Proveedores: Devolución Pago en Exceso ...');

  sTipoListado := '10';
  Limpiar_TablaTemporalProv(sTipoListado);

  sSql := 'SELECT EM_CUIT CUIT, EM_ID, EM_NOMBRE NOMBRE, DC_CALLE CALLE, DC_NUMERO NUMERO, ' +
                 'DC_PISO PISO, DC_DEPARTAMENTO DEPARTAMENTO, DC_LOCALIDAD LOCALIDAD, DC_CPOSTAL CPOSTAL, ' +
                 'DC_CODAREATELEFONOS CODAREATELEFONOS, DC_TELEFONOS TELEFONOS, PV_DESCRIPCION, ' +
                 'CO_CONTRATO CONTRATO, TRIM(PE_BENEFICIARIO) BENEFICIARIO ' +
            'FROM CPV_PROVINCIAS, ADC_DOMICILIOCONTRATO, AEM_EMPRESA, ACO_CONTRATO, ZPE_DEVOLUCIONPAGOEXCESO ' +
           'WHERE PE_FECHAALTA >= :FECHA ' +
             'AND PE_FECHAALTA < :FECHA + 1 ' +
             'AND PE_FECHABAJA IS NULL ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND CO_CONTRATO = PE_CONTRATO ' +
             'AND CO_CONTRATO = DC_CONTRATO ' +
             'AND DC_TIPO = ''L'' ' +
             'AND DC_PROVINCIA = PV_CODIGO ' +
           'ORDER BY PE_ID';

	with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);

        bOK := False;
        if Doc = '' then
          sMotivoError := 'El CUIT es nulo'
        else if not IsCuit(Doc) then
          sMotivoError := 'El CUIT es inválido'
        else
          bOK := True;

        if bOK then
        begin
          sNombreEmpresa := FieldByName('Nombre').AsString;
          MostrarEstado('Proveedores: Devolución (' + Doc + ' ' + sNombreEmpresa + ') ...');

          sDomicilio := ValorSqlEx('SELECT UTILES.ARMAR_DOMICILIO(:p1, :p2, :p3, :p4) FROM DUAL',
                                  [FieldByName('Calle').AsString, FieldByName('Numero').AsString,
                                   FieldByName('Piso').AsString, FieldByName('Departamento').AsString]);

          sBeneficiario := FieldByName('beneficiario').AsString;
          sTipoAcreedor := 'EM';     // Empresa Afiliada
          IdAcreedor    := FieldByName('em_id').AsInteger;

          bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal);

          Insert_AC_AC_B_Vendors_Int(sNombreEmpresa, COBRANZAS_TERMS, COBRANZAS_LOOKUP,
                                     CURRENCY_CODE, IVA_EXENTO, 'CUIT',
                                     Doc, DocGuiones, '',
                                     '', YES, '0',
                                     '', NO_RETIENE, YES,
                                     '0', '', NO_RETIENE,
                                     YES, NO_RETIENE_MINUSC, 0,
                                     '', NO_RETIENE_MINUSC, NO,
                                     'S', StrLeft(sBeneficiario, 80), YES,
                                     StrLeft(sDomicilio, 35), StrMid(sDomicilio, 36, 35), StrLeft(FieldByName('Localidad').AsString, 25),
                                     '', FieldByName('CPostal').AsString, FieldByName('pv_Descripcion').AsString,
                                     COUNTRY_CODE, FieldByName('CodAreaTelefonos').AsString, StrLeft(FieldByName('Telefonos').AsString, 15),
                                     '', '', DGI_SERVICIOS,
                                     Financial_GLGetCodeCombinationID(CUENTA_PASIVO_SIN_SINIESTRO), Financial_GLGetCodeCombinationID(CUENTA_PASIVO_SIN_SINIESTRO), COBRANZAS_LOOKUP,
                                     DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('pv_Descripcion').AsString), sTipoCuenta,
                                     sNroCuenta, sSucursal, sCBU1,
                                     sCBU2, NO, '',
                                     '', '', '',
                                     bDatosCuentaBancaria, 'N');

          if not VendorExists(DocGuiones, 'CUIT') then
            bResult := True;
        end
        else
          Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, '', '',
                                        '', '', sNombreEmpresa, '', 'CUIT', Doc, sMotivoError);

        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg(E, 'Error al exportar Proveedores Devolución Pago en Exceso.');
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

function TfrmAdmInterfaces.Financial_ProveedoresImpuestos(Fecha: TDateTime): Boolean;
var
  sTipoAcreedor, sNombre, Doc, DocGuiones, sSql, sTipoListado, sBeneficiario: String;
  sMotivoError, sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal, sDomicilio: String;
  bDatosCuentaBancaria, bResult, bOk: Boolean;
  IdAcreedor: TTableId;
begin
  bResult := False;
  MostrarEstado('Proveedores: Impuestos ...');

  sTipoListado := '11';
  Limpiar_TablaTemporalProv(sTipoListado);

  sSql := 'SELECT DISTINCT IE_CUIT CUIT, IE_ID, IE_NOMBRE NOMBRE, NULL CALLE, NULL NUMERO, NULL PISO, NULL DEPARTAMENTO, NULL LOCALIDAD, ' +
                 'NULL CPOSTAL, NULL CODAREATELEFONOS, NULL TELEFONOS, NULL PV_DESCRIPCION, NVL(IL_BENEFICIARIO, IX_BENEFICIARIO) BENEFICIARIO ' +
            'FROM CONT.OIE_IMPENTIDAD, CONT.OIL_IMPLIQUIDACION, CONT.OIX_IMPENTIDADCONCEPTO, CONT.OIC_IMPCONCEPTO, CONT.OID_IMPLIQUIDACIONDETALLE ' +
           'WHERE IL_FECHAAPROBADO >= :FECHA ' +
             'AND IL_FECHAAPROBADO < :FECHA + 1 ' +
             'AND IL_FECHABAJA IS NULL ' +
             'AND IL_IDENTIDAD = IE_ID ' +
             'AND IX_IDENTIDAD = IE_ID ' +
             'AND IX_IDCONCEPTO = IC_ID ' +
             'AND ID_IDCONCEPTO = IC_ID ' +
             'AND ID_IDLIQUIDACION = IL_ID ' +
           'ORDER BY IE_ID';

	with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
  try
  	dmFinancials.BeginTrans;

    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc        := FieldByName('Cuit').AsString;
        DocGuiones := PonerGuiones(Doc);

        bOK := False;
        if Doc = '' then
          sMotivoError := 'El CUIT es nulo'
        else if not IsCuit(Doc) then
          sMotivoError := 'El CUIT es inválido'
        else
          bOK := True;

        if bOK then
        begin
          sNombre := FieldByName('Nombre').AsString;
          MostrarEstado('Proveedores: Impuestos (' + Doc + ' ' + sNombre + ') ...');

          sDomicilio := ValorSqlEx('SELECT UTILES.ARMAR_DOMICILIO(:p1, :p2, :p3, :p4) FROM DUAL',
                                  [FieldByName('Calle').AsString, FieldByName('Numero').AsString,
                                   FieldByName('Piso').AsString, FieldByName('Departamento').AsString]);
          sBeneficiario := FieldByName('Beneficiario').AsString;;

          sTipoAcreedor := 'IM';     // Impuestos
          IdAcreedor    := FieldByName('ie_id').AsInteger;

          bDatosCuentaBancaria := Get_DatosCuentaBancaria(sTipoAcreedor, IdAcreedor, '', sTipoCuenta, sNroCuenta, sCBU1, sCBU2, sSucursal);

          Insert_AC_AC_B_Vendors_Int(sNombre, IMPUESTOS_TERMS, IMPUESTOS_LOOKUP,
                                     CURRENCY_CODE, IVA_EXENTO, 'C.D.I.',
                                     Doc, DocGuiones, '',
                                     '', YES, '0',
                                     '', NO_RETIENE, YES,
                                     '0', '', NO_RETIENE,
                                     YES, NO_RETIENE_MINUSC, 0,
                                     '', NO_RETIENE_MINUSC, NO,
                                     'S', StrLeft(sBeneficiario, 80), YES,
                                     StrLeft(sDomicilio, 35), StrMid(sDomicilio, 36, 35), StrLeft(FieldByName('Localidad').AsString, 25),
                                     '', FieldByName('CPostal').AsString, FieldByName('pv_Descripcion').AsString,
                                     COUNTRY_CODE, FieldByName('CodAreaTelefonos').AsString, StrLeft(FieldByName('Telefonos').AsString, 15),
                                     '', '', DGI_SERVICIOS,
                                     Financial_GLGetCodeCombinationID(CUENTA_PASIVO_SIN_SINIESTRO), Financial_GLGetCodeCombinationID(CUENTA_PASIVO_SIN_SINIESTRO), IMPUESTOS_LOOKUP,
                                     DocGuiones, Obtener_CodProvinciaFinancial(FieldByName('pv_Descripcion').AsString), sTipoCuenta,
                                     sNroCuenta, sSucursal, sCBU1,
                                     sCBU2, NO, '',
                                     '', '', '',
                                     bDatosCuentaBancaria, 'N');

          if not VendorExists(DocGuiones, 'C.D.I.') then
            bResult := True;
        end
        else
          Insert_ErroresExportacionFNCL(Sesion.UserId, sTipoListado, '', '',
                                        '', '', sNombre, '', 'C.D.I.', Doc, sMotivoError);

        Next;
      end;

      dmFinancials.CommitTrans;
    except
    	on E: Exception do
      begin
      	dmFinancials.RollBack;
        if pbContinuar then
        	ErrorMsg(E, 'Error al exportar Proveedores Impuestos.');
        raise;
      end;
    end;
  finally
  	Free;
    LimpiarEstado;
  end;

  Result := bResult;
end;

procedure TfrmAdmInterfaces.Financial_Impuestos(Fecha: TDateTime);
var
  FechaCont: TDateTime;
  sFacturaNro, DocGuiones, sDescripcionFactura, sSql: String;
  sEstado, Doc: String;
begin
  MostrarEstado('Cuentas a Pagar: Impuestos ...');

  dmFinancials.BeginTrans;
  try
    sSql := 'SELECT IE_CUIT CUIT, IE_ID, IL_BENEFICIARIO NOMBRE, IL_MONTO IMPORTE, ' +
                   'IL_NUMERO NRO_PAGO, IL_FECHA FECHA, IL_ID ID, ' +
                   '''Pago de Impuestos''|| DECODE(IL_PERIODO, NULL, NULL, '' Periodo: ''||IL_PERIODO)|| ' +
                   'DECODE(IL_OBSERVACIONES, NULL, NULL, '' ''||IL_OBSERVACIONES) DESCRIPCION ' +
              'FROM CONT.OIE_IMPENTIDAD, CONT.OIL_IMPLIQUIDACION ' +
             'WHERE IL_FECHAAPROBADO >= :FECHA ' +
               'AND IL_FECHAAPROBADO < :FECHA + 1 ' +
               'AND IL_FECHABAJA IS NULL ' +
               'AND IL_IDENTIDAD = IE_ID ' +
             'ORDER BY IL_ID';

		with GetQueryEx(sSql, [TDateTimeEx.Create(Fecha)]) do
    try
    	while not Eof do
      begin
      	Do_AnalizarContinuar;

        Doc         := FieldByName('CUIT').AsString;
        DocGuiones  := PonerGuiones(Doc);
        FechaCont   := Fecha;

        if IsCuit(Doc) and VendorExists(DocGuiones, 'C.D.I.') then
        begin
        	sEstado             := 'Cuentas a Pagar: Impuestos (Pago Nro. ' + FieldByName('nro_pago').AsString + ') ...';
          sFacturaNro         := FieldByName('nro_pago').AsString;
          sDescripcionFactura := FieldByName('Descripcion').AsString;

          Financial_ExportarImpuestos(sEstado, sFacturaNro, sDescripcionFactura,
                                      Doc, DocGuiones, FechaCont,
                                      FieldByName('Importe').AsCurrency, FieldByName('nombre').AsString, FieldByName('Id').AsInteger,
                                      FieldByName('Fecha').AsDateTime);
        end
        else
          MsgBox('Nro. de documento inválido', MB_ICONERROR);

        Next;
      end;
    finally
    	Free;
    end;

    dmFinancials.CommitTrans;
  except
    on E: Exception do
    begin
    	dmFinancials.RollBack;
      if pbContinuar then
      	ErrorMsg(E, 'Error al exportar Impuestos.');
      raise;
    end;
  end;
end;

procedure TfrmAdmInterfaces.Financial_ExportarImpuestos(Estado, FacturaNro, DescripcionFactura,
                                                        Doc, DocGuiones: String; FechaCont: TDateTime;
                                                        ImporteFactura: Currency; Beneficiario: String; IdLiquidacion: TTableId;
                                                        Fecha: TDateTime);
var
  sSql, sGrupoDePagos: String;
  iSequence: Integer;
begin
  MostrarEstado(Estado);

  iSequence     := Financial_APGetSequence;
  sGrupoDePagos := IMPUESTOS_LOOKUP;

  sSql := 'SELECT DISTINCT IX_BENEFICIARIO BENEFICIARIO, IX_METODOPAGO METODOPAGO ' +
            'FROM CONT.OIC_IMPCONCEPTO, CONT.OID_IMPLIQUIDACIONDETALLE, CONT.OIX_IMPENTIDADCONCEPTO ' +
           'WHERE IX_IDCONCEPTO = IC_ID ' +
             'AND ID_IDCONCEPTO = IC_ID ' +
             'AND ID_FECHABAJA IS NULL ' +
             'AND ID_IDLIQUIDACION = :IdLiquidacion';

  with GetQueryEx(sSql, [IdLiquidacion]) do
    try
      Financial_APHeaderInsert(SOURCE_NAME, iSequence, FechaCont,
                               DescripcionFactura, CUENTA_PASIVO_SIN_SINIESTRO, ImporteFactura,
                               DocGuiones, FacturaNro, Get_TipoFactura(ImporteFactura, 'I'),
                               sGrupoDePagos, 'C.D.I.', '',
                               '', False, '',
                               IMPUESTOS_GROUP, '', YES,
                               NVL(Beneficiario, FieldByName('Beneficiario').AsString), Fecha, '',
                               '', '', '',
                               'OIL', IdLiquidacion, '',
                               '', FieldByName('MetodoPago').AsString, 3,    // 3: ID Banco de la Provincia de Bs. As.
                               '');
    finally
      Free;
    end;

  Financial_APLineInsert(iSequence, 'TAX', CUENTA_TAX,
                         'TAX', 0, '',
                         False);

  sSql := 'SELECT IM_DESCRIPCION||'' ''||IT_DESCRIPCION||'' ''||IC_CONCEPTO DENPAGO, ART.FNCL.CUENTA_PONERGUIONES(IC_CTACONTABLE) CTAPAGO, ID_IMPORTE IMPORTE, IC_ID CONPAGO ' +
            'FROM CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO, CONT.OIC_IMPCONCEPTO, CONT.OID_IMPLIQUIDACIONDETALLE ' +
           'WHERE ID_FECHABAJA IS NULL ' +
             'AND ID_IDLIQUIDACION = :IdLiquidacion ' +
             'AND ID_IDCONCEPTO = IC_ID ' +
             'AND IC_IDIMPUESTO = IM_ID ' +
             'AND IC_IDTIPO = IT_ID ' +
           'ORDER BY ID_ID';

  with GetQueryEx(sSql, [IdLiquidacion]) do
    try
      while not Eof do
        begin
          if FieldByName('importe').AsCurrency <> 0 then
            Financial_APLineInsert(iSequence, FieldByName('denpago').AsString, FieldByName('ctapago').AsString,
                                   ITEM_NO_RETIENE_MAYUSC, FieldByName('importe').AsCurrency, FieldByName('conpago').AsString,
                                   True);

          Next;
        end;
    finally
      Free;
    end;
end;

procedure TfrmAdmInterfaces.chkMarcarDesmarcarClick(Sender: TObject);
var
  bMarcar: Boolean;
begin
  bMarcar := chkMarcarDesmarcar.Checked;

  chkILTP.Checked                   := bMarcar;
  chkOtrosConceptos.Checked         := bMarcar;
  chkCobranzas.Checked              := bMarcar;
  chkComisiones.Checked             := bMarcar;
  chkPrestacionesMedicas.Checked    := bMarcar;
  chkPagosLegalesJuicios.Checked    := bMarcar;
  chkPagosLegalesSumarios.Checked   := bMarcar;
  chkPagosLegalesMediac.Checked     := bMarcar;
  chkPagosLegalesHonorarios.Checked := bMarcar;
  chkImpuestos.Checked              := bMarcar;
end;

end.

