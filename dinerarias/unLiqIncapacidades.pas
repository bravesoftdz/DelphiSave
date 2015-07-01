unit unLiqIncapacidades;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, Mask, ComCtrls, ToolWin, unFraEmpresa,
  StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraTrabajador,
  unFraTrabajadorSiniestro, Buttons, ExtCtrls, ImgList, XPMenu,
  SinEdit, PatternEdit, DateTimeEditors, QueryToFile, ExportDialog,
  SortDlg, DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  DateComboBox, ShortCutControl, QueryPrint, artSeguridad,
  unFraCodigoDescripcion, unfraCtbTablas, unfraDelegacion, unFraCodDesc,
  ComboEditor, DBComboGrid, DBCtrls, Menus, unClassLiquidacion, IntEdit,
  FormPanel, unFraStaticCodigoDescripcion, General, AdvPageControl,
  unFraDomicilio, unComunes, unAltaModifCCP_CUENTAPAGO, RxToolEdit, RxCurrEdit,
  RxPlacemnt, unJustificacionILT, unDinerarias, ShellApi;

type

  TDictamenes = record
    Id            :integer;
    Codigo        :string[10];
    Fechadesde    :TDate;
    Fechahasta    :TDate;
    Grado         :string[1];
    Caracter      :string[1];
    Porcentaje    :double;
  end;

  TRecibo = record
    Calle: String;
    Numero: String;
    Piso: String;
    Departamento: String;
    CodigoPostal: String;
    CPA: String;
    Localidad: String;
    Prov: Integer;
  end;

  TfrmLiqIncapacidades = class(TfrmCustomForm)
    pnlTop: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbExportar: TToolButton;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    tbSeparador3: TToolButton;
    tbImprimir: TToolButton;
    tbSeparador4: TToolButton;
    tbSalir: TToolButton;
    dsILP: TDataSource;
    sdqILP: TSDQuery;
    sdILP: TSortDialog;
    ExportDialog: TExportDialog;
    dsBusqueda: TDataSource;
    sdqBusqueda: TSDQuery;
    ShortCutControl: TShortCutControl;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    tbOrdenar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Seguridad: TSeguridad;
    PageControl: TAdvPageControl;
    tsILP: TAdvTabSheet;
    tsILT: TAdvTabSheet;
    PnlILT: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edDesdeILT: TDateComboBox;
    edHastaILT: TDateComboBox;
    edChequeNombreILT: TEdit;
    GridILT: TArtDBGrid;
    chkBaseMopresILT: TCheckBox;
    Label32: TLabel;
    tsPrestaciones: TAdvTabSheet;
    ScrollBox2: TScrollBox;
    GridPresMed: TArtDBGrid;
    dsILT: TDataSource;
    sdqILT: TSDQuery;
    dsPresMed: TDataSource;
    sdqPresMed: TSDQuery;
    sdPresMed: TSortDialog;
    sdILT: TSortDialog;
    tsOtrosPagos: TAdvTabSheet;
    Panel2: TPanel;
    Label33: TLabel;
    GridOPagos: TArtDBGrid;
    sdOPagos: TSortDialog;
    dsOPagos: TDataSource;
    sdqOPagos: TSDQuery;
    edNumPagoOP: TCurrencyEdit;
    lblLiqAnulOP: TLabel;
    GroupBox1: TGroupBox;
    Label34: TLabel;
    fraTipoAcreedOP: TfraCtbTablas;
    lblRSocialOP: TLabel;
    Label37: TLabel;
    chkPagoJudOP: TCheckBox;
    Label38: TLabel;
    lblCuitOP: TLabel;
    edCuitOP: TMaskEdit;
    Label40: TLabel;
    edCAIOP: TEdit;
    Label41: TLabel;
    fraConPagoOP: TfraCodDesc;
    Label44: TLabel;
    Label45: TLabel;
    edNroCuentaOP: TEdit;
    tsLegales: TAdvTabSheet;
    ScrollBox3: TScrollBox;
    GridLegales: TArtDBGrid;
    sdLegales: TSortDialog;
    dsLegales: TDataSource;
    sdqLegales: TSDQuery;
    tbNuevo: TToolButton;
    ToolButton4: TToolButton;
    tbGuardar: TToolButton;
    tbCancelar: TToolButton;
    dsRSocialOP: TDataSource;
    sdqRSocialOP: TSDQuery;
    edRazonSocialOP: TArtComboBox;
    fraDelegOP: TfraCodDesc;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    ToolButton5: TToolButton;
    fraEmpresa: TfraEmpresa;
    lbCUIT: TLabel;
    edSinFecha: TDateEdit;
    Label1: TLabel;
    fraTrabajadorSIN: TfraTrabajadorSiniestro;
    CUIL: TLabel;
    tbBuscarSiniestro: TToolButton;
    Label2: TLabel;
    edDELEGACION: TEdit;
    btnCambioDelegacion: TSpeedButton;
    Label3: TLabel;
    edJUICIO: TEdit;
    Label35: TLabel;
    edEX_ESTADO: TEdit;
    pnlInfo: TPanel;
    Label39: TLabel;
    Label48: TLabel;
    edEX_TIPO: TEdit;
    edEX_GRAVEDAD: TEdit;
    fraDelegacionILT: TfraDelegacion;
    fraTipoILT: TfraCodDesc;
    Label51: TLabel;
    tsDatosEcon: TAdvTabSheet;
    sdqDERemuneraciones: TSDQuery;
    dsDERemuneraciones: TDataSource;
    sdqDERemuneracionesRE_ID: TFloatField;
    sdqDERemuneracionesPERIODO: TStringField;
    sdqDERemuneracionesDIAS: TFloatField;
    sdqDERemuneracionesIMPORTE_INFORMADO: TFloatField;
    sdqDERemuneracionesIMPORTE_AMPOTOPEADO: TFloatField;
    sdqDERemuneracionesIMPORTE_DGI: TFloatField;
    gbDocumentacionDE: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    edFecRecDocILTDE: TDateComboBox;
    edFecRecDocMortDE: TDateComboBox;
    edFecRecDocILPDE: TDateComboBox;
    edFecRecDocContriDE: TDateComboBox;
    sduDERemuneraciones: TSDUpdateSQL;
    sdqDERemuneracionesIMPORTE_AMPO: TFloatField;
    gbContribucionesDE: TGroupBox;
    pcAportes: TAdvPageControl;
    tsAportesILTDatosEcon: TAdvTabSheet;
    tsAportesILPDatosEcon: TAdvTabSheet;
    GridAportesILTDE: TArtDBGrid;
    sduAportesILTDE: TSDUpdateSQL;
    sdqAportesILTDE: TSDQuery;
    dsAportesILTDE: TDataSource;
    sdqAportesILTDEID: TFloatField;
    sdqAportesILTDECONCEPTO: TStringField;
    sdqAportesILTDEPORCEMPR: TFloatField;
    sdqAportesILTDEPORCTRAB: TFloatField;
    sdqAportesILTDECODIGO: TFloatField;
    GridAportesILPDE: TArtDBGrid;
    sduAportesILPDE: TSDUpdateSQL;
    sdqAportesILPDE: TSDQuery;
    sdqAportesILPDEID: TFloatField;
    sdqAportesILPDECONCEPTO: TStringField;
    sdqAportesILPDEPORCEMPR: TFloatField;
    sdqAportesILPDEPORCTRAB: TFloatField;
    sdqAportesILPDECODIGO: TFloatField;
    dsAportesILPDE: TDataSource;
    gbGeneralesDE: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    edBajaMedicaDE: TDateComboBox;
    edAltaMedicaDE: TDateComboBox;
    edBaseDiariaILTDE: TCurrencyEdit;
    edFranquiciaDE: TIntEdit;
    edCantHijosSinDiscapDE: TIntEdit;
    edCantHijosDiscapDE: TIntEdit;
    edFDespidoDE: TDateComboBox;
    chkBaseMopresDE: TCheckBox;
    fraOSocialDE: TfraCodigoDescripcion;
    fraAFJPDE: TfraCodigoDescripcion;
    fraCeseRentaDE: TfraCtbTablas;
    mnuImprimir: TPopupMenu;
    mnuImprResultados: TMenuItem;
    mnuImprLiquidacion: TMenuItem;
    mnuImprOrdenPago: TMenuItem;
    mnuImprRemuneraciones: TMenuItem;
    Label69: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    edEnvioOP: TEdit;
    fraMetodoPagoOP: TfraCtbTablas;
    edObsOP: TMemo;
    gbImportes: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edIBDILT: TCurrencyEdit;
    edDiasILT: TCurrencyEdit;
    edImpLiquidadoILT: TCurrencyEdit;
    edPorcContribILT: TCurrencyEdit;
    edImpContribILT: TCurrencyEdit;
    edPorcAportesILT: TCurrencyEdit;
    edImpAportesILT: TCurrencyEdit;
    edSalarioFamiliarILT: TCurrencyEdit;
    edAPagarILT: TCurrencyEdit;
    edImpARTILT: TCurrencyEdit;
    edImpEmpresaILT: TCurrencyEdit;
    edDiferenciaILT: TCurrencyEdit;
    udDiasILT: TUpDown;
    btnAsigFamILT: TButton;
    edObservILT: TMemo;
    fraMetodoPagoILT: TfraCtbTablas;
    Label80: TLabel;
    Label81: TLabel;
    edEnvioILT: TEdit;
    btnCuentasOP: TSpeedButton;
    tbTrabajador: TToolButton;
    sdqRemuneraciones: TSDQuery;
    dsRemuneraciones: TDataSource;
    edAltaFecha: TDateEdit;
    Label89: TLabel;
    GroupBox5: TGroupBox;
    Label54: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    dcFechaLiqOP: TDateComboBox;
    edSinRetGanOP: TCurrencyEdit;
    edConRetGanOP: TCurrencyEdit;
    dcFechaEmOP: TDateComboBox;
    Label36: TLabel;
    Label43: TLabel;
    dcFechaFacOP: TDateComboBox;
    Label42: TLabel;
    edLetraFacOP: TEdit;
    edSituFacOP: TEdit;
    edNumFacOP: TEdit;
    tbDatosEconomicos: TToolButton;
    mnuDatosEcon: TPopupMenu;
    mnuDatosPago: TMenuItem;
    Remuneracionesdeclaradas1: TMenuItem;
    SegurodeRetiro1: TMenuItem;
    ToolButton1: TToolButton;
    edFDepositoDE: TDateComboBox;
    Label90: TLabel;
    edFJubilacionDE: TDateComboBox;
    Label91: TLabel;
    btnEnvioOP: TSpeedButton;
    edDNIOP: TEdit;
    btnEnvioILT: TBitBtn;
    gbEventos: TGroupBox;
    rbEstadoTodos: TRadioButton;
    rbEstadoActivos: TRadioButton;
    GroupBox8: TGroupBox;
    rbAntigTodos: TRadioButton;
    rbAntigUltimo: TRadioButton;
    GroupBox9: TGroupBox;
    lblPoseeDni: TLabel;
    lblRecibos: TLabel;
    lblDenuncia: TLabel;
    chkPluriempleo: TCheckBox;
    mnuImpResumen: TMenuItem;
    tbNomina: TToolButton;
    tbDatosEmpresa: TToolButton;
    pmILPILT: TPopupMenu;
    mnuImpLiqILPILT: TMenuItem;
    sduILP: TSDUpdateSQL;
    sduILT: TSDUpdateSQL;
    tsAportesILTPDDatosEcon: TAdvTabSheet;
    GridAportesILTPDDE: TArtDBGrid;
    sduAportesILTPDDE: TSDUpdateSQL;
    sdqAportesILTPDDE: TSDQuery;
    sdqAportesILTPDDEID: TFloatField;
    sdqAportesILTPDDECONCEPTO: TStringField;
    sdqAportesILTPDDEPORCEMPR: TFloatField;
    sdqAportesILTPDDEPORCTRAB: TFloatField;
    sdqAportesILTPDDECODIGO: TFloatField;
    dsAportesILTPDDE: TDataSource;
    munImpFormSeleccion: TMenuItem;
    mnuImpSolCotizacion: TMenuItem;
    tbViajar: TToolButton;
    tbSeparadorViajar: TToolButton;
    mnuViajar: TPopupMenu;
    mnuViajarSiniestros: TMenuItem;
    mnuViajarIncapacidades: TMenuItem;
    mnuLiqMortales: TMenuItem;
    edRecibosILT: TMemo;
    Label4: TLabel;
    btnVerDatosAFIP: TSpeedButton;
    mnGenIntILPILT: TMenuItem;
    chkApyConDE: TCheckBox;
    mnGenTasaJusticiaILPILT: TMenuItem;
    mnuEmbargo: TMenuItem;
    sbPaneles: TScrollBox;
    fpImpCheque: TFormPanel;
    gbImpCheque: TGroupBox;
    Label7: TLabel;
    Label71: TLabel;
    chkImpCheque: TCheckBox;
    edImpCheque: TCurrencyEdit;
    chkIVA: TCheckBox;
    chkIngBruto: TCheckBox;
    chkRenta: TCheckBox;
    edIVA: TCurrencyEdit;
    edIngBruto: TCurrencyEdit;
    edRenta: TCurrencyEdit;
    edSellados: TCurrencyEdit;
    edOtros: TCurrencyEdit;
    chkSellados: TCheckBox;
    chkOtros: TCheckBox;
    edTotalImp: TCurrencyEdit;
    edImpIndemn: TCurrencyEdit;
    btnCancelarCH: TBitBtn;
    btnAceptarCH: TBitBtn;
    fpEnvioFondos: TFormPanel;
    gbEnvioFondos: TGroupBox;
    Label83: TLabel;
    rbBancoFondos: TRadioButton;
    rbDelegacionFondos: TRadioButton;
    rbCentralFondos: TRadioButton;
    fraDelegacionFondos: TfraDelegacion;
    fraBancoFondos: TfraCodigoDescripcion;
    fraSucursalFondos: TfraCodigoDescripcion;
    rbNingunoFondos: TRadioButton;
    btnCancelarFondosILT: TBitBtn;
    btnAceptarFondosILT: TBitBtn;
    fpImprimirLiq: TFormPanel;
    gbCantCopias: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    Label82: TLabel;
    edCantRec: TIntEdit;
    edCantRes: TIntEdit;
    edCantDig: TIntEdit;
    btnCerrarImp: TBitBtn;
    btnAceptarImp: TBitBtn;
    fpEmbargos: TFormPanel;
    GroupBox6: TGroupBox;
    btnCancelarEmb: TBitBtn;
    btnAceptarEmb: TBitBtn;
    rbPorcentajeEmb: TRadioButton;
    rbSumaFijaEmb: TRadioButton;
    edSumaFijaEmb: TCurrencyEdit;
    edPorcentajeEmb: TCurrencyEdit;
    rbNingunoEmb: TRadioButton;
    fraMetodoPagoEmb: TfraCtbTablas;
    Label6: TLabel;
    edEnvioEmb: TEdit;
    Label8: TLabel;
    edChequeNombreEmb: TEdit;
    Label9: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    edRecibosEmb: TEdit;
    mnuImpReciboRetiraDocum: TMenuItem;
    gbRemuneracionesDE: TGroupBox;
    pcRemuneraciones: TAdvPageControl;
    tsAnteriorDecreto: TAdvTabSheet;
    GridDERemuneraciones: TArtDBGrid;
    tsPosteriorDecreto: TAdvTabSheet;
    dgRemuVarPosDecre: TArtDBGrid;
    dgRemuFijaPosDecre: TArtDBGrid;
    GroupBox12: TGroupBox;
    edBaseDiariaPostDE: TCurrencyEdit;
    Label13: TLabel;
    dcVigHastaDE: TDateComboBox;
    Label67: TLabel;
    dcVigDesdeDE: TDateComboBox;
    Label68: TLabel;
    dsRemuVarPosDecre: TDataSource;
    sdqRemuVarPosDecre: TSDQuery;
    sdqRemuFijaPosDecre: TSDQuery;
    dsRemuFijaPosDecre: TDataSource;
    sduRemuVarPosDecre: TSDUpdateSQL;
    sduRemuFijaPosDecre: TSDUpdateSQL;
    sdqRemuFijaPosDecreTIPOREMU: TStringField;
    sdqRemuFijaPosDecreDIAS: TFloatField;
    sdqRemuFijaPosDecreMD_MONTO: TFloatField;
    sdqRemuVarPosDecreMD_PERIODO: TStringField;
    sdqRemuVarPosDecreDIAS: TFloatField;
    sdqRemuVarPosDecreMD_MONTO: TFloatField;
    sdqRemuVarPosDecreID: TFloatField;
    sdqRemuFijaPosDecreID: TFloatField;
    sdqRemuFijaPosDecreMONTODIARIO: TCurrencyField;
    tbRemuPostDecre: TToolBar;
    tbAntRemu: TToolButton;
    tbDespRemu: TToolButton;
    tbBajaRemu: TToolButton;
    ToolButton7: TToolButton;
    Bevel3: TBevel;
    sdqRemuVarPosDecreUSUARIO: TStringField;
    sdqRemuFijaPosDecreUSUARIO: TStringField;
    Label72: TLabel;
    edImpEmpNoRemILT: TCurrencyEdit;
    sdqRemuVarPosDecreMD_MONTONOREMUN: TFloatField;
    fraBancoILT: TfraCodigoDescripcion;
    Label75: TLabel;
    fraBancoOP: TfraCodigoDescripcion;
    Label76: TLabel;
    fraBancoEmb: TfraCodigoDescripcion;
    Label77: TLabel;
    sdqRemuDDJJ: TSDQuery;
    dsRemuDDJJ: TDataSource;
    fpDatosAFIP: TFormPanel;
    btnCancelarAFIP: TBitBtn;
    btnAceptarAFIP: TBitBtn;
    GroupBox10: TGroupBox;
    Label70: TLabel;
    Label5: TLabel;
    fraZonaAFIPDE: TfraCodigoDescripcion;
    fraCondicionAFIPDE: TfraCodigoDescripcion;
    fpRemuneraciones: TFormPanel;
    btnCerrarRem: TBitBtn;
    btnCargarRem: TBitBtn;
    btnImprimirRem: TBitBtn;
    dgRemuneraciones: TArtDBGrid;
    fpRemuDDJJ: TFormPanel;
    btnCerrarDDJJ: TBitBtn;
    btnCargaDDJJ: TBitBtn;
    btnExportarDDJJ: TBitBtn;
    dgRemuDDJJ: TArtDBGrid;
    Bevel4: TBevel;
    Bevel5: TBevel;
    sdqRemuFijaPosDecreMD_TIPOREMU: TStringField;
    edBaseDiariaPostDENoRem: TCurrencyEdit;
    Label93: TLabel;
    MnuRemuAnteriorDecreto: TMenuItem;
    mnuRemuPosteriorDecreto: TMenuItem;
    edDDJJ: TExportDialog;
    sdqRemuDDJJPERIODO: TStringField;
    sdqRemuDDJJNOREMUNERATIVO: TFloatField;
    sdqRemuDDJJREMIMPONIBLE: TFloatField;
    sdqRemuDDJJREMTOT: TFloatField;
    sdqRemuDDJJLABORABLES: TFloatField;
    sdqRemuDDJJSUELDOCONADIC: TFloatField;
    sdqRemuDDJJSAC: TFloatField;
    sdqRemuDDJJZONADES: TFloatField;
    sdqRemuDDJJEXTRAS: TFloatField;
    sdqRemuDDJJVACACIONES: TFloatField;
    sdqRemuDDJJMODCONTR: TStringField;
    sdqRemuDDJJDESMODCONTR: TStringField;
    sdqRemuDDJJAPOBLISS: TFloatField;
    sdqRemuDDJJAPVOLSS: TFloatField;
    sdqRemuDDJJCONDICION: TStringField;
    sdqRemuDDJJDT_ADICIONALES: TFloatField;
    sdqRemuDDJJDT_PREMIOS: TFloatField;
    sdqRemuDDJJDT_CODIGOSITUACIONMS: TStringField;
    sdqRemuDDJJDESCODSITUACMS: TStringField;
    sdqRemuDDJJSINCONILT: TStringField;
    sdqRemuDDJJCODSINI: TStringField;
    sdqRemuDDJJDESCODSIN: TStringField;
    gbFijas: TGroupBox;
    edMontoFijoPostDE: TCurrencyEdit;
    edDiasFijoPostDE: TIntEdit;
    Label73: TLabel;
    Label94: TLabel;
    chkCalcSACNoRemPostDE: TCheckBox;
    edMontoFijoNoRemPostDE: TCurrencyEdit;
    Label95: TLabel;
    chkEspecialPostDE: TCheckBox;
    btnImprimirDDJJ: TBitBtn;
    qpDDJJ: TQueryPrint;
    sdqRemuDDJJDJ_FECHAPRESENTACION: TDateTimeField;
    mnuCuentasBancarias: TMenuItem;
    mnuExcluirDiskete: TMenuItem;
    edIBDNoRemILT: TCurrencyEdit;
    Bevel6: TBevel;
    Label24: TLabel;
    Label25: TLabel;
    edImpARTNoRemILT: TCurrencyEdit;
    edDiferenciaNoRemILT: TCurrencyEdit;
    edImpLiquidadoNoRemILT: TCurrencyEdit;
    Bevel7: TBevel;
    lblLiqConEmbILT: TLabel;
    pnlILP: TPanel;
    lbDesde: TLabel;
    lbHasta: TLabel;
    lbTipo: TLabel;
    lbFormula: TLabel;
    lbDelegacion: TLabel;
    Label84: TLabel;
    Label88: TLabel;
    Label74: TLabel;
    Label31: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label85: TLabel;
    edDesdeILP: TDateComboBox;
    edHastaILP: TDateComboBox;
    edTipoILP: TEdit;
    edFormulaILP: TEdit;
    edChequeNombreILP: TEdit;
    fraDelegacionILP: TfraDelegacion;
    GroupBox7: TGroupBox;
    lbImpLiquidado: TLabel;
    lbPorcContrib: TLabel;
    lbImpContrib: TLabel;
    lbPorcAportes: TLabel;
    lbImpAportes: TLabel;
    lbSalarioFamiliar: TLabel;
    lbMopre: TLabel;
    lbAPagar: TLabel;
    lbDias: TLabel;
    lbIBD: TLabel;
    edImpLiquidadoILP: TCurrencyEdit;
    edPorcContribILP: TCurrencyEdit;
    edImpContribILP: TCurrencyEdit;
    edPorcAportesILP: TCurrencyEdit;
    edImpAportesILP: TCurrencyEdit;
    edSalarioFamiliarILP: TCurrencyEdit;
    edMopreILP: TCurrencyEdit;
    edAPagarILP: TCurrencyEdit;
    edDiasILP: TCurrencyEdit;
    edIBDILP: TCurrencyEdit;
    udDiasILP: TUpDown;
    btnAsigFamILP: TButton;
    edObservILP: TMemo;
    fraMetodoPagoILP: TfraCtbTablas;
    edEnvioILP: TEdit;
    chkBaseMopresILP: TCheckBox;
    edRecibosILP: TMemo;
    btnEnvioILP: TBitBtn;
    fraBancoILP: TfraCodigoDescripcion;
    GridILP: TArtDBGrid;
    Bevel2: TBevel;
    fpDictamenes: TFormPanel;
    Bevel8: TBevel;
    btnCancelarDic: TBitBtn;
    btnAceptarDic: TBitBtn;
    rgDictamenes: TRadioGroup;
    gbConceptoPago: TGroupBox;
    rbConceptoPagoUnico: TRadioButton;
    rbConceptoAnticipo: TRadioButton;
    rbConceptoRentaPer: TRadioButton;
    rbConceptoIndemnizacion: TRadioButton;
    rbConceptoAsignFamiliar: TRadioButton;
    rbConceptoRentaDev: TRadioButton;
    rbConceptoDifRentaPer: TRadioButton;
    chkConceptoAnticipo: TCheckBox;
    lblTipoLiqILP: TLabel;
    Label92: TLabel;
    Label96: TLabel;
    edIBDNoRemILP: TCurrencyEdit;
    edImpLiquidNoRemILP: TCurrencyEdit;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    chkCalcSACRemPostDE: TCheckBox;
    btnRecibosILT: TBitBtn;
    fpDomicilioRecibos: TFormPanel;
    btnCancelarDomRecibo: TBitBtn;
    btnAceptarDomRecibo: TBitBtn;
    pnlDomicilio: TPanel;
    fraDomicilioRecibos: TfraDomicilio;
    rbDomicilio_Recibos: TRadioButton;
    Panel1: TPanel;
    rbOtro_Recibos: TRadioButton;
    MemoOtroRecibos: TMemo;
    btnRecibosILP: TBitBtn;
    sdqRemuDDJJEX_FECHAACCIDENTE: TDateTimeField;
    mnuCompensacion: TMenuItem;
    fpCompensacion: TFormPanel;
    dbgCompensacion: TArtDBGrid;
    ToolBar1: TToolBar;
    tbCompExportar: TToolButton;
    tbCompImprimir: TToolButton;
    tbCompSalir: TToolButton;
    ToolButton12: TToolButton;
    sdqCompensacion: TSDQuery;
    dsCompensacion: TDataSource;
    ExportDialogComp: TExportDialog;
    QueryPrintComp: TQueryPrint;
    Panel3: TPanel;
    Label97: TLabel;
    lCompCUIL: TLabel;
    Label99: TLabel;
    lCompTrabajador: TLabel;
    fpSelSiniestroRecaida: TFormPanel;
    btnCerrarRecSin: TBitBtn;
    btnAceptarRecSin: TBitBtn;
    GroupBox2: TGroupBox;
    lblRecaida: TLabel;
    lblSiniestro: TLabel;
    cmbRecaida: TArtComboBox;
    cmbSiniestro: TArtComboBox;
    dsSiniestros: TDataSource;
    sdqSiniestros: TSDQuery;
    sdqRecaidas: TSDQuery;
    dsRecaidas: TDataSource;
    fraMotivoDiferencia: TfraCodigoDescripcion;
    Label98: TLabel;
    mnGenCompDaniosILP: TMenuItem;
    fpModifImporte: TFormPanel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Bevel12: TBevel;
    edMotivoModif: TMemo;
    edNuevoImporte: TCurrencyEdit;
    btnCancelarMod: TBitBtn;
    btnAceptarMod: TBitBtn;
    mnEditarImporte: TMenuItem;
    mnuMostrarReserva: TMenuItem;
    tbJustifILT: TToolButton;
    ToolButton8: TToolButton;
    Label103: TLabel;
    edImpContribILT_NoRem: TCurrencyEdit;
    Label104: TLabel;
    edPorcContribILT_NoRem: TCurrencyEdit;
    Label105: TLabel;
    edRecibosOP: TMemo;
    btnRecibosOP: TBitBtn;
    sdqCasosActivosPD: TSDQuery;
    dsCasosActivosPD: TDataSource;
    fpCasosActivosPD: TFormPanel;
    Label106: TLabel;
    Bevel13: TBevel;
    cbCasosARelacionar: TArtComboBox;
    btnAceptarBaja: TButton;
    btnCancelarBaja: TButton;
    sduOPagos: TSDUpdateSQL;
    edCompDanos: TCurrencyEdit;
    edPagoAdic: TCurrencyEdit;
    Label107: TLabel;
    Label108: TLabel;
    lblOtrosPagos: TLabel;
    edOtrosPagos: TCurrencyEdit;
    EdNewCD: TCurrencyEdit;
    EdNewPA: TCurrencyEdit;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    edNewTotal: TCurrencyEdit;
    sdqRemuDDJJDDJJ: TStringField;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    mnuLinks: TPopupMenu;
    mnuAnses: TMenuItem;
    mnuAfip: TMenuItem;
    mnuSSS: TMenuItem;
    mnuARTs: TMenuItem;
    mnuSRT: TMenuItem;
    mnuBNA: TMenuItem;
    mnuCorreo: TMenuItem;
    mnuBcoPatag: TMenuItem;
    mnuSSN: TMenuItem;
    mnuUART: TMenuItem;
    mnuInfoleg: TMenuItem;
    lModifNoAutorizada_OP: TLabel;
    lModifNoAutorizada_ILP: TLabel;
    lModifNoAutorizada_ILT: TLabel;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure fraTrabajadorSINedSiniestroSelect(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqILPAfterOpen(DataSet: TDataSet);
    procedure DoCargarDatosILP(DataSet: TDataSet);
    procedure DoCargarDatosILT(DataSet: TDataSet);
    procedure DoCargarDatosOPagos(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbDatosPagoClick(Sender: TObject);
    procedure udDiasILPChange(Sender: TObject);
    procedure GridILTGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqILTAfterOpen(DataSet: TDataSet);
    procedure sdqPresMedAfterOpen(DataSet: TDataSet);
    procedure GridPresMedGetCellParams(Sender: TObject; Field: TField;AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqOPagosAfterOpen(DataSet: TDataSet);
    procedure GridOPagosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridILPGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure edRazonSocialOPDropDown(Sender: TObject);
    procedure edRazonSocialOPCloseUp(Sender: TObject);
    procedure fraConPagoOPPropiedadesChange(Sender: TObject);
    procedure udDiasILPChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbBuscarSiniestroClick(Sender: TObject);
    procedure sdqLegalesAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDiferenciaILTChange(Sender: TObject);
    procedure fraDelegacionILTExit(Sender: TObject);
    procedure edDesdeILTExit(Sender: TObject);
    procedure edHastaILTExit(Sender: TObject);
    procedure edImpEmpresaILTExit(Sender: TObject);
    procedure edSalarioFamiliarILTExit(Sender: TObject);
    procedure edChequeNombreILTExit(Sender: TObject);
    procedure sdqDERemuneracionesDIASValidate(Sender: TField);
    procedure sdqDERemuneracionesIMPORTE_INFORMADOValidate(Sender: TField);
    procedure sdqDERemuneracionesIMPORTE_INFORMADOChange(Sender: TField);
    procedure sdqDERemuneracionesPERIODOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure GridDERemuneracionesPaintFooter(Sender: TObject; Column: String; var Value: String;
                                              var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridDERemuneracionesKeyPress(Sender: TObject; var Key: Char);
    procedure sdqDERemuneracionesAfterOpen(DataSet: TDataSet);
    procedure sdqDERemuneracionesDIASChange(Sender: TField);
    procedure sdqDERemuneracionesIMPORTE_AMPOChange(Sender: TField);
    procedure sdqDERemuneracionesBeforePost(DataSet: TDataSet);
    procedure sdqDERemuneracionesAfterPost(DataSet: TDataSet);
    procedure sdqDERemuneracionesAfterScroll(DataSet: TDataSet);
    procedure sdqDERemuneracionesAfterInsert(DataSet: TDataSet);
    procedure sdqAportesILTDEAfterInsert(DataSet: TDataSet);
    procedure sdqAportesILTDEAfterOpen(DataSet: TDataSet);
    procedure sdqAportesILTDEPORCEMPRChange(Sender: TField);
    procedure GridAportesILTDEPaintFooter(Sender: TObject; Column: String; var Value: String;
                                          var CellColor, FontColor: TColor;  var AlignFooter: TAlingFooter);
    procedure sdqAportesILTDEAfterPost(DataSet: TDataSet);
    procedure sdqAportesILTDEAfterScroll(DataSet: TDataSet);
    procedure sdqAportesILTDEPORCEMPRValidate(Sender: TField);
    procedure sdqAportesILPDEAfterInsert(DataSet: TDataSet);
    procedure sdqAportesILPDEAfterOpen(DataSet: TDataSet);
    procedure sdqAportesILPDEAfterPost(DataSet: TDataSet);
    procedure sdqAportesILPDEAfterScroll(DataSet: TDataSet);
    procedure sdqAportesILPDEPORCEMPRChange(Sender: TField);
    procedure sdqAportesILPDEPORCEMPRValidate(Sender: TField);
    procedure pcAportesChange(Sender: TObject);
    procedure GridAportesILTDEKeyPress(Sender: TObject; var Key: Char);
    procedure mnuImprResultadosClick(Sender: TObject);
    procedure mnuImprLiquidacionClick(Sender: TObject);
    procedure mnuImprOrdenPagoClick(Sender: TObject);
    procedure udDiasILTClick(Sender: TObject; Button: TUDBtnType);
    procedure udDiasILPClick(Sender: TObject; Button: TUDBtnType);
    procedure PageControlChange(Sender: TObject);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure mnuImprRemuneracionesClick(Sender: TObject);
    procedure edNumFacOPExit(Sender: TObject);
    procedure edSituFacOPExit(Sender: TObject);
    procedure GridOPagosDblClick(Sender: TObject);
    procedure edLetraFacOPKeyPress(Sender: TObject; var Key: Char);
    procedure edSituFacOPKeyPress(Sender: TObject; var Key: Char);
    procedure btnAsigFamILTClick(Sender: TObject);
    procedure edObservILTExit(Sender: TObject);
    procedure fraMetodoPagoILTExit(Sender: TObject);
    procedure edEnvioILTExit(Sender: TObject);
    procedure btnCuentasOPClick(Sender: TObject);
    procedure tbTrabajadorClick(Sender: TObject);
    procedure btnCargarRemClick(Sender: TObject);
    procedure fpRemuneracionesBeforeShow(Sender: TObject);
    procedure btnCerrarRemClick(Sender: TObject);
    procedure btnImprimirRemClick(Sender: TObject);
    procedure btnAceptarImpClick(Sender: TObject);
    procedure btnEnvioILTClick(Sender: TObject);
    procedure fraBancoFondosOnChange(Sender: TObject);
    procedure fpEnvioFondosBeforeShow(Sender: TObject);
    procedure rbBancoFondosClick(Sender: TObject);
    procedure rbDelegacionFondosClick(Sender: TObject);
    procedure rbCentralFondosClick(Sender: TObject);
    procedure btnAceptarFondosILTClick(Sender: TObject);
    procedure rbRemActualClick(Sender: TObject);
    procedure rbRemOriginalClick(Sender: TObject);
    procedure edHastaILPExit(Sender: TObject);
    procedure edDesdeILPExit(Sender: TObject);
    procedure fraMetodoPagoILPExit(Sender: TObject);
    procedure fraDelegacionILPExit(Sender: TObject);
    procedure edEnvioILPExit(Sender: TObject);
    procedure btnEnvioILPClick(Sender: TObject);
    procedure edChequeNombreILPExit(Sender: TObject);
    procedure edObservILPExit(Sender: TObject);
    procedure edSalarioFamiliarILTEnter(Sender: TObject);
    procedure fpDictamenesBeforeShow(Sender: TObject);
    procedure btnAceptarDicClick(Sender: TObject);
    procedure edSalarioFamiliarILPExit(Sender: TObject);
    procedure edSalarioFamiliarILPEnter(Sender: TObject);
    procedure tbRemuneracionesClick(Sender: TObject);
    procedure edImpLiquidadoILPExit(Sender: TObject);
    procedure rgDictamenesClick(Sender: TObject);
    procedure btnAsigFamILPClick(Sender: TObject);
    procedure tbDatosEconomicosClick(Sender: TObject);
    procedure mnuDatosPagoClick(Sender: TObject);
    procedure SegurodeRetiro1Click(Sender: TObject);
    procedure edRecibosILPExit(Sender: TObject);
    procedure btnEnvioOPClick(Sender: TObject);
    procedure mnuImpResumenClick(Sender: TObject);
    procedure tbNominaClick(Sender: TObject);
    procedure tbDatosEmpresaClick(Sender: TObject);
   // procedure mnGenComBanILPILTClick(Sender: TObject);
    procedure fpImpChequeBeforeShow(Sender: TObject);
    //procedure mnGenChequeILPILTClick(Sender: TObject);
    procedure chkImpChequeClick(Sender: TObject);
    procedure chkIVAClick(Sender: TObject);
    procedure chkIngBrutoClick(Sender: TObject);
    procedure chkRentaClick(Sender: TObject);
    procedure chkSelladosClick(Sender: TObject);
    procedure chkOtrosClick(Sender: TObject);
    procedure edOtrosChange(Sender: TObject);
    procedure edSelladosChange(Sender: TObject);
    procedure btnAceptarCHClick(Sender: TObject);
    procedure pmILPILTPopup(Sender: TObject);
    procedure sdqAportesILTPDDEAfterInsert(DataSet: TDataSet);
    procedure sdqAportesILTPDDEAfterOpen(DataSet: TDataSet);
    procedure sdqAportesILTPDDEAfterPost(DataSet: TDataSet);
    procedure sdqAportesILTPDDEAfterScroll(DataSet: TDataSet);
    procedure GridAportesILTPDDEKeyPress(Sender: TObject; var Key: Char);
    procedure munImpFormSeleccionClick(Sender: TObject);
    procedure mnuImpSolCotizacionClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure mnuViajarSiniestrosClick(Sender: TObject);
    procedure mnuViajarIncapacidadesClick(Sender: TObject);
    procedure sdqAportesILTPDDEPORCEMPRChange(Sender: TField);
    procedure sdqAportesILTPDDEPORCTRABChange(Sender: TField);
    procedure sdqAportesILTPDDEPORCEMPRValidate(Sender: TField);
    procedure sdqAportesILTPDDEPORCTRABValidate(Sender: TField);
    procedure PageControlCanChange(Sender: TObject; FromPage,
      ToPage: Integer; var AllowChange: Boolean);
    procedure edIngBrutoChange(Sender: TObject);
    procedure edIVAChange(Sender: TObject);
    procedure mnuLiqMortalesClick(Sender: TObject);
    procedure edRecibosILTExit(Sender: TObject);
    procedure fraTipoILTPropiedadesChange(Sender: TObject);
    procedure btnVerDatosAFIPClick(Sender: TObject);
    procedure btnAceptarAFIPClick(Sender: TObject);
    procedure btnCancelarAFIPClick(Sender: TObject);
    procedure mnGenIntILPILTClick(Sender: TObject);
    procedure mnGenTasaJusticiaILPILTClick(Sender: TObject);
    procedure mnuEmbargoClick(Sender: TObject);
    procedure rbPorcentajeEmbClick(Sender: TObject);
    procedure btnAceptarEmbClick(Sender: TObject);
    procedure fpEmbargosBeforeShow(Sender: TObject);
    procedure mnuImpReciboRetiraDocumClick(Sender: TObject);
    procedure dgRemuVarPosDecreKeyPress(Sender: TObject; var Key: Char);
    procedure dgRemuFijaPosDecreKeyPress(Sender: TObject; var Key: Char);
    procedure dgRemuVarPosDecrePaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
    procedure sdqRemuVarPosDecreAfterInsert(DataSet: TDataSet);
    procedure sdqRemuVarPosDecreAfterOpen(DataSet: TDataSet);
    procedure sdqRemuVarPosDecreAfterPost(DataSet: TDataSet);
    procedure sdqRemuVarPosDecreAfterScroll(DataSet: TDataSet);
    procedure sdqRemuVarPosDecreDIASChange(Sender: TField);
    procedure sdqRemuVarPosDecreMD_MONTOChange(Sender: TField);
    procedure sdqRemuVarPosDecreDIASValidate(Sender: TField);
    procedure sdqRemuVarPosDecreMD_MONTOValidate(Sender: TField);
    procedure sdqRemuFijaPosDecreAfterScroll(DataSet: TDataSet);
    procedure sdqRemuFijaPosDecreDIASValidate(Sender: TField);
    procedure sdqRemuFijaPosDecreMD_MONTOValidate(Sender: TField);
    procedure sdqRemuFijaPosDecreCalcFields(DataSet: TDataSet);
    procedure sdqRemuFijaPosDecreAfterInsert(DataSet: TDataSet);
    procedure tbBajaRemuClick(Sender: TObject);
    procedure tbAntRemuClick(Sender: TObject);
    procedure tbDespRemuClick(Sender: TObject);
    procedure dgRemuVarPosDecreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgRemuFijaPosDecreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgRemuVarPosDecreExit(Sender: TObject);
    procedure dgRemuFijaPosDecreExit(Sender: TObject);
    procedure fraBancoILPOnChange(Sender: TObject);
    procedure fraBancoILTOnChange(Sender: TObject);
    procedure fpRemuDDJJBeforeShow(Sender: TObject);
    procedure sdqRemuDDJJAfterOpen(DataSet: TDataSet);
    procedure btnCargaDDJJClick(Sender: TObject);
    procedure MnuRemuAnteriorDecretoClick(Sender: TObject);
    procedure mnuRemuPosteriorDecretoClick(Sender: TObject);
    procedure sdqRemuFijaPosDecreAfterPost(DataSet: TDataSet);
    procedure sdqRemuFijaPosDecreAfterOpen(DataSet: TDataSet);
    procedure btnExportarDDJJClick(Sender: TObject);
    procedure edDiasFijoPostDEChange(Sender: TObject);
    procedure edMontoFijoPostDEChange(Sender: TObject);
    procedure chkCalcSACNoRemPostDEClick(Sender: TObject);
    procedure btnImprimirDDJJClick(Sender: TObject);
    procedure mnuExcluirDisketeClick(Sender: TObject);
    procedure edImpEmpNoRemILTExit(Sender: TObject);
    procedure edDiferenciaNoRemILTChange(Sender: TObject);
    procedure pcRemuneracionesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnRecibosILTClick(Sender: TObject);
    procedure btnAceptarDomReciboClick(Sender: TObject);
    procedure rbDomicilio_RecibosClick(Sender: TObject);
    procedure rbOtro_RecibosClick(Sender: TObject);
    procedure fpDomicilioRecibosBeforeShow(Sender: TObject);
    procedure btnRecibosILPClick(Sender: TObject);
    procedure tbCompSalirClick(Sender: TObject);
    procedure mnuCompensacionClick(Sender: TObject);
    procedure fpCompensacionBeforeShow(Sender: TObject);
    procedure tbCompExportarClick(Sender: TObject);
    procedure tbCompImprimirClick(Sender: TObject);
    procedure dbgCompensacionGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarRecSinClick(Sender: TObject);
    procedure fpSelSiniestroRecaidaBeforeShow(Sender: TObject);
    procedure fraMotivoDiferenciaExit(Sender: TObject);
    procedure mnGenCompDaniosILPClick(Sender: TObject);
    procedure mnEditarImporteClick(Sender: TObject);
    procedure btnAceptarModClick(Sender: TObject);
    procedure fpModifImporteBeforeShow(Sender: TObject);
    procedure mnuMostrarReservaClick(Sender: TObject);
    procedure mnuViajarPopup(Sender: TObject);
    procedure tbJustifILTClick(Sender: TObject);
    procedure btnRecibosOPClick(Sender: TObject);
    procedure btnAceptarBajaClick(Sender: TObject);
    procedure edNuevoImporteExit(Sender: TObject);
    procedure EdNewPAExit(Sender: TObject);
    procedure EdNewCDExit(Sender: TObject);
    procedure fpCasosActivosPDShow(Sender: TObject);
    procedure mnuAnsesClick(Sender: TObject);
    procedure mnuAfipClick(Sender: TObject);
    procedure mnuSSSClick(Sender: TObject);
    procedure mnuARTsClick(Sender: TObject);
    procedure mnuSRTClick(Sender: TObject);
    procedure mnuBNAClick(Sender: TObject);
    procedure mnuCorreoClick(Sender: TObject);
    procedure mnuBcoPatagClick(Sender: TObject);
    procedure mnuSSNClick(Sender: TObject);
    procedure mnuUARTClick(Sender: TObject);
    procedure mnuInfolegClick(Sender: TObject);
    {procedure fpCartaDocumento2Show(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    function ValidarDirCDO: boolean;
    procedure btnCancelarClick(Sender: TObject);}


  private
    Dictamenes : Array of TDictamenes;
    vSiniestro, vOrden, vRecaida, vSecPrestador, vIdExpediente, vNumLiq, vIdRem :Integer;
    iCondAnt, iZonaAnt: Integer;
    vSalFamiliar: Currency;
    sSecMutual, sTipoAcr :String;
    pSuperUser, bVerILT, bVerILP, bCalcuPost: Boolean;
    Accion :TAccionLiq;
    oILT: TILT;
    oILP: TILP;
    oILT2: TILT;   { Los uso en unMotivoCancelacionLiq para Validar la liquidacion a insertar en el caso del plan Reemplazo de Siniestro/recaida (PC05)}
    tReciboOP: TRecibo;
    pTopeIBDSiniestro: Currency;
    function ValidarOPagos :Boolean;
    function HayRegistroActivo :Boolean;
    function GetFormapago :String;
    function ConfirmaCancelar :Boolean;
    function ValidarDatosEconomicos: Boolean;
    function ValidarCuentaOP: Boolean;
    function ValidarCuentaOP_CBU_Autoriz: Boolean;    // TK 54975
    function DoCargarDictamenes(bSoloDefyTot: Boolean): Boolean;
    function IsConceptoSel :Boolean;
    function GetValidaAsigFamiliar :String;
    function GetIdTipo :Integer;
    function GetExtraFiltro: String;
    //function GetImpuestos(dImporte: Double): Boolean;
    function EsUsuarioLegales(sUsuario: String): Boolean;  // TK 14614
    function PoseePermisos: Boolean;
    function TieneDictamenAutorizado(sFormulario: String): Boolean;
    function PuedeModificarDEAprob(bSoloPost: Boolean): Boolean;
    function EsPeriodoFechaAccidente(sPeriodoEvaluado: string; dFechaAccid: TDateTime): Boolean;  // Por Plan Carga del Periodo de Fec. Accid. en Datos Econ.

    procedure OnEmpresaChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure OnTipoAcreedOPChange(Sender: TObject);
    procedure OnMetodoPagoOPChange(Sender: TObject);
    procedure OnMetodoPagoILTChange(Sender: TObject);
    procedure OnMetodoPagoILPChange(Sender: TObject);
    procedure OnMetodoPagoEmbChange(Sender: TObject);

    procedure DoLimpiarFiltros;
    procedure DoLimpiarDatosLiquidacion;
    procedure DoHabilitarBotonesLiquidacion(bHabilitar: Boolean);
    procedure DoHabilitarMostrarReserva(bHabilitar: Boolean);   // TK 53237
    procedure CargarFinancials(sdqActual :TSDQuery; dgActual :TArtDBGrid; EsIncapacidad: Boolean);
    procedure DoCargarFinancial;
    procedure DoMostrarColFinancials(bMostrar: Boolean);
    procedure DoNuevoILP;
    procedure DoCargarILP;
    procedure DoRefrescarILP;
    procedure DoBajaILP;
    procedure DoLimpiarILP(bCerrarQry :Boolean);
    procedure DoHabilitarILP(bHabilitar :Boolean);
    procedure DoGrabarILP(Confirmar: Boolean; ObjILP: TILP; iSiniestro, iOrden, iRecaida: Integer; aAccion: TAccionLiq; var iResValida:integer; bConTransaccion: Boolean = True);
  //  procedure Do_GenerarPagoUnico(obILP: TILP);
    procedure DoNuevoILT;
    procedure DoCargarILT;
    procedure DoRefrescarILT;
    procedure DoBajaILT;
    procedure DoLimpiarILT(bCerrarQry :Boolean);
    procedure DoHabilitarILT(bHabilitar :Boolean);
    procedure DoGrabarILT(Confirmar: Boolean; ObjILT: TILT; iSiniestro, iOrden, iRecaida: Integer; aAccion: TAccionLiq; var iResValida:Integer; bConTransaccion: Boolean = True);


    procedure DoCargarPresMed;
    procedure DoLimpiarPresMed;
    procedure DoNuevoOPagos;
    procedure DoCargarOPagos;
    procedure DoModifOPagos;

    procedure DoModifILP;
    procedure DoModifILT;

    procedure DoBajaOPagos;
    procedure DoLimpiarOPagos(bCerrarQry :Boolean);
    procedure DoHabilitarOPagos(bHabilitar :Boolean);
    procedure DoGrabarOPagos;
    procedure Do_GuardarRecibosOP;
    procedure Do_CargarRecibosOP;
    procedure Do_CargarFrameRecibosOP;
    procedure Do_LimpiarRecibosOP;
    procedure SetSqlRSocialOP;
    procedure DoCargarLegales;
    procedure DoLimpiarLegales;
    procedure DoCargarOrden(sDialog :TSortDialog; dgActual :TArtDBGrid);
    procedure DoImprimirGrilla(dsActual :TDataSource; dgActual :TArtDBGrid;
                               sCaption :String; Orientacion :TPageOrientation = pxLandscape);
    procedure DoHabilitarAlta(bHabilitar :Boolean);
    procedure DoHabilitarCuit;
    procedure DoCrearObjILT(iSiniestro, iOrden, iRecaida, iNroLiquidacion: Integer; var ObjILT: TILT);
    procedure DoCrearObjILP(iSiniestro, iOrden, iRecaida, iNroLiquidacion: Integer; var ObjILP: TILP);
    procedure DoLimpiarTempAportesDatEcon;
    procedure DoCargarTempAportesDatEcon(Tipo: String; Siniestro, Orden: Integer);
    procedure DoCargarAportesDatEcon(Siniestro, Orden, Recaida: Integer);
    procedure DoCargarGrillaRemuneracionesDatEcon(Siniestro, Orden: Integer; Cuit: String; FechaAccidente: TDateTime);
    procedure DoCargarRemuneracionesDatEcon(Siniestro, Orden, Recaida: Integer);
    procedure DoCargarDatosEconomicos;
    procedure DoModifDatosEconomicos;
    procedure DoLimpiarDatosEconomicos;
    procedure DoHabilitarDatosEconomicos(bHabilitar :Boolean);
    procedure DoGrabarRemuneracionesDatEcon(Siniestro, Orden, Recaida: Integer);
    procedure DoGrabarAportesDatEcon(Siniestro, Orden, Recaida: Integer);
    procedure DoGrabarRemuPostDecreto(Siniestro, Orden: Integer);
    procedure DoGrabarDatosEconomicos;
    procedure CalcTotalesDatosEconomicos;
    procedure CalcTotalesPostDecreto;
    procedure CalcTotalesAportes(sdqAportesDE: TSDQuery);
    procedure DoVerificarPorcentajes(Sender: TField; sdqAportesDE: TSDQuery);
    procedure GetPorcAportes(Tipo: String; Codigo: Integer; var PorcEmpr, PorcTrab: Double);
    procedure ActualizarDias(edDias: TCurrencyEdit; Button: TUDBtnType);
    procedure DoImprimirOPagos(iNumLiq :Integer; sEstado, sCuitP, sEmpresaP :String);
    procedure DoNuevoDatosEcon;
    procedure DoHabilitarFondos;
    procedure SetEnvioFondosILT;
    procedure SetEnvioFondosILP;
    procedure SetChequeANombreILT;
    procedure SetChequeANombreILP;
    procedure SetRecibosILT;
    procedure AbrirRemuneraciones;
    procedure DoLimpiarConceptos;
    procedure DoMostrarDatosDigitalizacion;
    procedure DoCalcularTotalReintegrar;
    procedure DoGrabarEmbargo(oLiqui: TLiquidacion; ImporteRemun, ImporteNoRemun: Currency);
    procedure DoCargarGrillaRemunPostDecreto(dDesde: TDate = 0; sSigno: String = '');
    procedure DoCalcularRemuFija;
    procedure SetLblTipoLiq;
    procedure Do_GuardarRecibosILT;             // TK 28814
    procedure Do_LimpiarFrameDomicRec_ILT;
    procedure DoBeforeShowILT;
    procedure Do_GuardarRecibosILP;             // TK 28814
    procedure DoBeforeShowILP;
    procedure Do_Validar180Dias;   // Plan Carga de datos del Periodo del Accidente
    procedure DoGuardarCuentaCorriente_Suma(iNroLiq: integer; cuAPagar: Currency; bConTransaccion: Boolean = True);        // Plan Registro de Pagos cancelados
    procedure DoGuardarCuentaCorriente_Resta(cuSaldo, cuAPagar: Currency; iNroLiqui: integer; sCuil: string);  // Plan Registro de Pagos cancelados
    function TrabajadorExisteEnCtaCte(sCuil:string; var iIdMaxCtaCte:integer):boolean;    // Plan Registro de Pagos cancelados
    procedure DoRefrescarGrillaCompensacion(sCuil: string);                               // Plan Registro de Pagos cancelados
    procedure DoEvaluarCompensacion(iNroLiqui: integer; cuAPagar: Currency);              // Plan Registro de Pagos cancelados
    function Get_SaldoDeCtaCte(iIdMaxCtaCte: integer): Currency;                          // Plan Registro de Pagos cancelados
    procedure Do_Insertar_CompensacionLiquidaciones(iNroLiq: integer; sCuil: string; cuAPagar, cuSaldo: Currency; sSuma:string; bConTransaccion: Boolean = True);  // Plan Registro de Pagos cancelados
    procedure Do_Modificar_TotalAPagar(iNroLiq: integer; cuAPagar: Currency; cuSaldoAnt: Currency = 0);            // Plan Registro de Pagos cancelados
    procedure DoImprimirCompensacionYaRealizada(iSiniestro, iOrden, iRecaida: Integer; bConTransaccion: boolean = True);  // Plan Registro de Pagos cancelados
    procedure DoSetearEsCompensacion;                                                    // Plan Registro de Pagos cancelados
    function NuevoILT(iSiniestro, iOrden, iRecaida: integer; var ObjILT: TILT): Boolean;
    function NuevoILP(iSiniestro, iOrden, iRecaida: integer; var ObjILP: TILP): Boolean;
    procedure DoLoadPropertys_ILT2(iSiniestro, iOrden, iRecaida, iNroLiq: integer);
 //   procedure DoLoadPropertys_ILP2(iSiniestro, iOrden, iRecaida, iNroLiq: integer);
    procedure DoEvaluar_Baja(sMotivoCancelacion: string; var bExcepcion: boolean; var bTieneRegistros: boolean);    // Plan Registro de Pagos cancelados
    procedure Do_ReemplazoPorCierreRecaida(var bExcepcion: boolean; var bTieneRecaidas: boolean);
    procedure Do_ReemplazoDeSiniestro(var bExcepcion: boolean; var bTieneSiniestros: boolean);
    procedure Do_HabilitarSinReca(iSiniReca: string);
    function EsMotivo_CierraRecaida(sMotivo: string): boolean;
    function EsMotivo_CierraSiniestro(sMotivo: string): boolean;
    procedure SetMotivoDiferencia;
    function Get_ImporteNetoCompResta(iIdMaxCtaCte: integer): Currency;  // Plan Registro de Pagos cancelados (arreglo del ImporPeri)
    //function Validar_CompensacionPorDanios(iNumLiqui:Integer; cConMensaje: boolean = true): boolean;                     // Por plan Generar compensación por daños
    //function Validar_CompensacionPorDanios_Total: boolean;               // Por plan Generar compensación por daños
    //procedure Generar_Liquidacion_CompPorDanios_Parcial(bAutomatica: boolean = true);   // Por plan Generar compensación por daños
    //procedure Generar_Liquidacion_CompPorDanios_Total;                                // Por plan Generar compensación por daños
    //procedure Do_GenerarCompDaniosAutomatico;                                         // Por plan Generar compensación por daños
    function Es_PagoJudicial: boolean;          // Por Plan de Pagos Judiciales
    function Get_IsBloqueoDinerarias: string;   // Por Plan de Pagos Judiciales
    procedure Do_CargarCamposDeLegales;         // Por Plan de Pagos Judiciales
    procedure DoCargarPropertys_LegalesILP(sdqQuery: TSDQuery); // Por Plan de Pagos Judiciales
    procedure DoCargarCampos_LegalesILP(sdqQuery: TSDQuery);    // Por Plan de Pagos Judiciales
    procedure DoDeshabilitarCampos_LegalesILP;                  // Por Plan de Pagos Judiciales
    function Get_IdCasoJudicial: integer;                       // Por Plan de Pagos Judiciales
    procedure Do_UpdateEstadoPagoJudicial(iIdCasoJudicial: integer);   // Por Plan de Pagos Judiciales
    procedure Do_UpdateIDPagoJudicial_SLE(iNroLiquidacion, iSiniestro, iOrden, iRecaida, iIdCasoJud: Integer);   // Por Plan de Pagos Judiciales
    function ValidarBajaOP_Usuarios(sUsuAltaOP:string):boolean;  // TK 52630
    function HabilitaEditarImporte:boolean;  // TK 53197
  //  procedure DoEvaluarCartelSiniestroConAnioILT; // TK 46933
    procedure DoHabilitacionBtn;
    procedure GenerarLiqManual(sConcepto: string; cMonto: currency = 0; dDesde: TDateTime = 0; dHasta: TDateTime = 0;
                               rTasaOriginal: real = 0; rTasaFinal: real = 0; sTipoInt: String = ''; sTipoTasaJus: String = '');
    function ValidarModifValores: boolean;
    procedure CalcTotalEditarImporte;
    function doSeleccionarCasoPuestaDisp(iIdTipoCaso, iIdLiquidacion: integer): boolean;
    function LiqPoseeChequeGenerado_ILP: Boolean;     // Plan Reliquidaciones Automáticas
    function LiqExisteEnCircuitoOP_ILP: Boolean;
    procedure DoHabilitarILP_Reliq(vHabilitar: boolean);
    procedure DoGrabarILP_Reliquidacion(ObjILP: TILP; iSiniestro, iOrden, iRecaida: integer);

    function LiqPoseeChequeGenerado_ILT: Boolean;     // Plan Reliquidaciones Automáticas
    function LiqExisteEnCircuitoOP_ILT: Boolean;
    procedure DoHabilitarILT_Reliq(vHabilitar: boolean);
    procedure DoGrabarILT_Reliquidacion(ObjILT: TILT; iSiniestro, iOrden, iRecaida: integer);

    function LiqPoseeChequeGenerado_OPagos: Boolean;     // Plan Reliquidaciones Automáticas
    function LiqExisteEnCircuitoOP_OPagos: Boolean;
    procedure DoHabilitarOPagos_Reliq(vHabilitar: boolean);
    procedure DoGrabarOPagos_Reliquidacion(iSiniestro, iOrden, iRecaida: integer);

  //  function IsModifNoAutorizada_ILP: boolean;  // Plan Reliquidaciones Automaticas
  //  function IsModifNoAutorizada_ILT: boolean;  // Plan Reliquidaciones Automaticas
  //  function IsModifNoAutorizada_OP: boolean;   // Plan Reliquidaciones Automaticas

    procedure LeyendaModifAutorizada(iIdExpediente, iNumLiq: integer; sTabla, sSolapa:string);
//    function ContabilizarFranquicia(iFranquicia, iFranquiciaTomada:integer):boolean;  // TK 65834
 //   function ExisteJustificacionILT_RecaAnterior: boolean;
    function ExisteJustifILT_entreFAltaYFReca(iSini, iOrd, iReca: integer): integer;
    function LiquidaRechazado(sCausafin: String): boolean;

  public
    procedure DoCargarLiquidaciones(bCargarSini: Boolean);
    procedure Do_GenerarLiquidacion_Recaida(iRecaidaSelecc: integer; var iResValida: integer);
    procedure Do_GenerarLiquidacion_Siniestro(iSelSiniestro, iSelOrden, iSelRecaida: integer; var iResValida: integer);
  end;

const
  ctsILP         = 0;
  ctsILT         = 1;
  ctsOPagos      = 2;
  ctsDatosEcon   = 3;
  ctsPresMedicas = 4; //están asi a proposito hasta que las saque
  ctsLegales     = 5; //están asi a proposito hasta que las saque

  ctsAportesILT   = 0;
  ctsAportesILTPD = 1;
  ctsAportesILP   = 2;

  ctsRemunAnterior  = 0;
  ctsRemunPosterior = 1;

  DiasMes     = 30;
  DiasMesEsp  = 22;

  cRECA = 'RECAIDA';
  cSINI = 'SINIESTRO';

  MAXCOLSDE = 3;
  CAMPOS_SUMADE: Array [0..MAXCOLSDE] of String = ('DIAS', 'IMPORTE_INFORMADO', 'IMPORTE_DGI', 'IMPORTE_AMPOTOPEADO');

  MAXCOLSREMVAR = 2;
  CAMPOS_SUMAREMVAR:  Array [0..MAXCOLSREMVAR] of String = ('DIAS', 'MD_MONTO', 'MD_MONTONOREMUN');
  CAMPOS_SUMAREMFIJA: Array [0..0] of String = ('MONTODIARIO');

  MAXCOLSAP = 1;
  CAMPOS_SUMAAP: Array [0..MAXCOLSAP] of String = ('PORCEMPR', 'PORCTRAB');

  cSECTOR_LIQUIDACIONES   = 'LIQUI';
  cSECTOR_PRESTDINERARIAS = 'PRESDIN';

var
  frmLiqIncapacidades: TfrmLiqIncapacidades;
  TotalConsultaDE: Array of Extended;
  TotalConsultaAP: Array of Extended;
  TotalConsultaRemVar: Array of Extended;
  TotalConsultaRemFija: Array of Extended;
  tTipoCheck: TTipoCheckDC; // TK 44193

implementation

{$IFNDEF DINERARIAS}
  {$IFNDEF LEGALES}
    {$DEFINE VIAJAR_SIN}
  {$ENDIF}
{$ENDIF}
{$IFNDEF LEGALES}
  {$IFNDEF DINERARIAS}
    {$DEFINE VIAJAR_SIN}
  {$ENDIF}
{$ENDIF}

uses
  unDmPrincipal, unSesion, AnsiSql, CustomDlgs, unDlgBusSiniestro, unArt, unDmFinancials,
  unPrincipal, Strfuncs, VCLExtra, CUIT, Periodo, unSiniestros,
  unMotivoCancelacionLiq, unCustomDataModule, DateTimeFuncs, Numeros, DbFuncs,
  SqlFuncs, unRptRemuneraciones, Math, QuickRpt, unLiqAsigFam, unManCCP_CUENTAPAGO,
  unContratoTrabajador, unCompaniaSeguroRetiro, unClassTrabajador, {$IFNDEF LEGALES}unRptResumen, {$ENDIF}
  unConsultaNomina, unRptFormSelRetiro, unRptFormularioCotizacion, unVisualizador,
  {$IFNDEF LEGALES}unConsultaEmpresa, {$ENDIF}
  {$IFDEF VIAJAR_SIN}unSegIncapacidades, unAdmSiniestros, {$ENDIF}
  {$IFDEF DINERARIAS} UnLiqBeneficiarios, {$ENDIF}
  unUtilsArchivo, unGeneracionIntereses, unGeneracionOPagos,
  unGeneracionTasaJusticia, unRptFormularioCotizacionTot, unRptReciboRetiraDocum,
  DateUtils, unDireccionCDO, unTercerizadoras;

const
  CaptionBase: string = 'Administración de Liquidaciones';

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbLimpiarClick(Sender: TObject);
begin
  DoLimpiarFiltros;
  DoLimpiarDatosLiquidacion;
  DoHabilitarBotonesLiquidacion(False);
  DoHabilitarMostrarReserva(False);  // TK 53237
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.FormCreate(Sender: TObject);
begin
  inherited;
  fraMetodoPagoOP.OnChange              := OnMetodoPagoOPChange;
  fraMetodoPagoILT.OnChange             := OnMetodoPagoILTChange;
  fraMetodoPagoILP.OnChange             := OnMetodoPagoILPChange;
  fraMetodoPagoEmb.OnChange             := OnMetodoPagoEmbChange;
  fraTipoAcreedOP.OnChange              := OnTipoAcreedOPChange;
  fraTrabajadorSIN.OnChange             := OnTrabajadorChange;
  fraEmpresa.OnChange                   := OnEmpresaChange;
  fraEmpresa.ShowBajas                  := True;
  fraTrabajadorSIN.MostrarRelaLaboral   := True;
  fraTrabajadorSIN.SinEstablecimiento   := True;
  fraTrabajadorSIN.SoloSiniestrados     := True;
  bCalcuPost                            := True;
  btnEnvioILT.Enabled                   := False;
  btnRecibosILT.Enabled                 := False;
  btnEnvioILP.Enabled                   := False;
  btnRecibosILP.Enabled                 := False;
  btnRecibosOP.Enabled                  := False;
  tTipoCheck                            := t_DevuelveFondos;

  with fraTipoAcreedOP do
  begin
    Clave     := 'TACRE';
    Especial1 := 'S';
    ShowBajas := True;
  end;

  pSuperUser := Seguridad.Claves.IsActive('SuperUsuario');

  with fraOSocialDE do
  begin
    TableName   := 'COS_OSOCIAL';
    FieldID     := 'OS_CODIGO';
    FieldCodigo := 'OS_CODIGO';
    FieldDesc   := 'OS_DESCRIPCION || DECODE(OS_TIPO, ''S'', '' (SUSS)'', ''N'', '' (NO SUSS)'') ';
    FieldBaja   := 'OS_FECBAJA';
    ExtraFields := ', OS_TIPO ';
    ShowBajas   := False;
    IDType      := unFraCodigoDescripcion.TCodigoType(ctString);
  end;

  with fraAFJPDE do
  begin
    TableName   := 'SJU_JUBILACION';
    FieldID     := 'JU_CODIGO';
    FieldCodigo := 'JU_CODIGO';
    FieldDesc   := 'JU_NOMBRE || DECODE(JU_TIPO, ''S'', '' (SUSS)'', ''N'', '' (NO SUSS)'') ';
    FieldBaja   := 'JU_FECHABAJA';
    ExtraFields := ', JU_TIPO ';
    ShowBajas   := False;
    IDType      := unFraCodigoDescripcion.TCodigoType(ctString);
  end;

  fraCeseRentaDE.Clave := 'MCERE';

  with fraZonaAFIPDE do
  begin
    TableName   := 'SZA_ZONAAFIP';
    FieldID     := 'ZA_ID';
    FieldCodigo := 'ZA_ZONA';
    FieldDesc   := 'ZA_LOCALIDAD';
    FieldBaja   := 'ZA_FECHABAJA';
    ShowBajas   := False;
    Sql := 'SELECT ZA_ID ' + CD_ALIAS_ID + ', ' +
                  'ZA_ZONA ' + CD_ALIAS_CODIGO + ', ' +
                  'ZA_LOCALIDAD || '' ('' || PV_DESCRIPCION || '')'' '  + CD_ALIAS_DESC + ', ' +
                  'ZA_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
             'FROM CPV_PROVINCIAS, SZA_ZONAAFIP ' +
            'WHERE ZA_PROVINCIA = PV_CODIGO';
  end;

  with fraBancoFondos do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraFields    := ', BA_TIENESUCURSALES ';
    if not(Seguridad.Claves.IsActive('VerTodosBancos')) then
      ExtraCondition := 'AND BA_DATANET IN (''S'', ''s'')';
    OnChange       := fraBancoFondosOnChange;
  end;

  with fraSucursalFondos do
  begin
    TableName      := 'ZSB_SUCURSALBANCO';
    FieldID        := 'SB_ID';
    FieldCodigo    := 'SB_CODIGO';
    FieldDesc      := 'SB_NOMBRE';
    FieldBaja      := 'SB_FECHABAJA';
    ExtraCondition := ' AND 1 = 2 ';
  end;

  with fraBancoILP do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraCondition := 'AND ((ba_giro = ''S'') OR (ba_transferencia = ''S'') ' +
                       ' OR (ba_depositocuenta = ''S'') OR (ba_cheque = ''S'') OR (ba_pagoelectronico = ''S''))  ';      // por tk 60615 agregue el ba_pagoelectronico
    OnChange       := fraBancoILPOnChange;
  end;

  with fraBancoILT do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraCondition := 'AND ((ba_giro = ''S'') OR (ba_transferencia = ''S'') ' +
                       ' OR (ba_depositocuenta = ''S'') OR (ba_cheque = ''S'') OR (ba_pagoelectronico = ''S'')) ';     // por tk 60615 agregue el ba_pagoelectronico
    OnChange       := fraBancoILTOnChange;
  end;

  with fraMotivoDiferencia do     // TK 39345
  begin
    TableName      := 'SIN.SMD_MOTIVODIFERENCIA';
    FieldID        := 'MD_ID';
    FieldDesc      := 'MD_DESCRIPCION';
    FieldCodigo    := 'MD_CODIGO';
    FieldBaja      := 'MD_FECHABAJA';
  end;

  with fraBancoOP do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraCondition := 'AND ((ba_giro = ''S'') OR (ba_transferencia = ''S'') ' +
                       ' OR (ba_depositocuenta = ''S'') OR (ba_cheque = ''S'') OR (ba_pagoelectronico = ''S'') ) ';    // por TK 60615 agregue el ba_pagoelectronico
  end;

  with fraBancoEmb do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraCondition := 'AND ((ba_giro = ''S'') OR (ba_transferencia = ''S'') ' +
                       ' OR (ba_depositocuenta = ''S'') OR (ba_cheque = ''S'') OR (ba_pagoelectronico = ''S'')) ';
  end;

  with fraCondicionAFIPDE do
  begin
    TableName   := 'SIN.SCA_CONDICIONAFIP';
    FieldID     := 'CA_ID';
    FieldCodigo := 'CA_ID';
    FieldDesc   := 'CA_DESCRIPCION';
    FieldBaja   := 'CA_FECHABAJA';
    ShowBajas   := True;
    IDType      := unFraCodigoDescripcion.TCodigoType(ctInteger);
  end;

  fraMetodoPagoOP.Clave       := 'COBRO';
  fraMetodoPagoOP.ShowBajas   := False;

  fraMetodoPagoILT.Clave      := 'COBRO';
  fraMetodoPagoILT.ShowBajas  := False;

  fraMetodoPagoILP.Clave      := 'COBRO';
  fraMetodoPagoILP.ShowBajas  := False;

  fraMetodoPagoEmb.Clave      := 'COBRO';
  fraMetodoPagoEmb.ShowBajas  := False;

  fraDelegacionILT.OnLine     := False;
  fraDelegacionILP.OnLine     := False;
  fraDelegacionFondos.OnLine  := False;

  SetLength(TotalConsultaDE, MAXCOLSDE + 1);
  SetLength(TotalConsultaAP, MAXCOLSAP + 1);
  SetLength(TotalConsultaRemVar, MAXCOLSREMVAR + 1);
  SetLength(TotalConsultaRemFija, 1);

  bVerILP := Seguridad.Claves.IsActive('VerILP');
  bVerILT := Seguridad.Claves.IsActive('VerILT');
  PageControl.ActivePageIndex := IIF(bVerILP, ctsILP, IIF(bVerILT, ctsILT, ctsOPagos));

  lModifNoAutorizada_OP.Caption  := '';
  lModifNoAutorizada_ILT.Caption := '';
  lModifNoAutorizada_ILP.Caption := '';

  {$IFNDEF VIAJAR_SIN}
    tsPrestaciones.TabVisible       := False; //a estos tabs despues los tengo que sacar
    tsLegales.TabVisible            := False; //a estos tabs despues los tengo que sacar
    mnuViajarSiniestros.Visible     := False;
    mnuViajarIncapacidades.Visible  := False;
    mnuLiqMortales.Visible          := True;
  {$ELSE}
    mnuViajarSiniestros.Visible     := True;
    mnuViajarIncapacidades.Visible  := True;
    mnuLiqMortales.Visible          := False;
  {$ENDIF}
  tbLimpiarClick(Nil);
  DoHabilitacionBtn;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.OnEmpresaChange(Sender: TObject);
begin
  fraTrabajadorSIN.CUIL := fraEmpresa.CUIT;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.OnTrabajadorChange(Sender: TObject);
begin
  fraEmpresa.Value := fraTrabajadorSIN.IdEmpresa;
  MsgSiniestroPosibleRecupero(fraTrabajadorSIN.CUIL,
                              Get_IdExpediente(fraTrabajadorSIN.edSiniestro.Siniestro,
                                               fraTrabajadorSIN.edSiniestro.Orden,
                                               fraTrabajadorSIN.edSiniestro.Recaida),
                              'S');
  DoCargarLiquidaciones(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.PageControlChange(Sender: TObject);
begin
  DoCargarLiquidaciones(False);
  DoHabilitacionBtn;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := ConfirmaCancelar;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarLiquidaciones(bCargarSini: Boolean);
var
  sBloqueados: String;
begin
  if bCargarSini then
  begin
    vSiniestro    := fraTrabajadorSIN.edSiniestro.Siniestro;
    vOrden        := fraTrabajadorSIN.edSiniestro.Orden;
    vRecaida      := fraTrabajadorSIN.edSiniestro.Recaida;
    vIdExpediente := Get_IdExpediente(vSiniestro, vOrden, vRecaida);

    if fraTrabajadorSIN.edSiniestro.IsEmpty or (not(PoseePermisos)) then
    begin
      tbLimpiarClick(Nil);
      Exit;
    end;

    //---------------------------------------------------------------------------//
    with sdqBusqueda do
    begin
      Close;
      ParamByName('pIdExped').AsInteger := vIdExpediente;
      Open;
    end;
    //---------------------------------------------------------------------------//
    if sdqBusqueda.Eof then
    begin
      ChkDialog('liqincapac_NoSini', 'No existe el siniestro buscado. Verifique los datos ingresados.', 'Error de Busqueda', '', mtInformation);
      DoHabilitarBotonesLiquidacion(False);
      DoHabilitarMostrarReserva(False);  // TK 53237 
      Exit;
    end
    else begin
      //------------------------------------------------------------------------//
      if fraEmpresa.mskCUIT.Text <> sdqBusqueda.FieldByName('EX_CUIT').AsString then
        fraEmpresa.CUIT := sdqBusqueda.FieldByName('EX_CUIT').AsString;
      //------------------------------------------------------------------------//
      if fraTrabajadorSIN.CUIL <> sdqBusqueda.FieldByName('EX_CUIL').AsString then
        fraTrabajadorSIN.CUIL := sdqBusqueda.FieldByName('EX_CUIL').AsString;
      //------------------------------------------------------------------------//
      edSinFecha.Date         := sdqBusqueda.FieldByName('EX_FECHAACCIDENTE').AsDateTime;
      edAltaFecha.Date        := sdqBusqueda.FieldByName('EX_ALTAMEDICA').AsDateTime;
      edDELEGACION.Text       := sdqBusqueda.FieldByName('DELEGACION').AsString;
      edEX_ESTADO.Text        := sdqBusqueda.FieldByName('ESTADO').AsString;
      chkPluriempleo.Checked  := IIF(sdqBusqueda.FieldByName('EX_PLURIEMPLEO').AsString = 'S', True, False);
      mnuEmbargo.Checked      := SiniTieneEmbargo(vIdExpediente);
      DoMostrarDatosDigitalizacion;
      if sdqBusqueda.FieldByName('EX_CAUSAFIN').IsNull then
      begin
        edEX_ESTADO.Font.Color := clBlack;
        edEX_ESTADO.Font.Style := edEX_ESTADO.Font.Style - [fsBold];
      end
      else begin
        edEX_ESTADO.Font.Color := clRed;
        edEX_ESTADO.Font.Style := edEX_ESTADO.Font.Style + [fsBold];
      end;
      edJUICIO.Text           := sdqBusqueda.FieldByName('JUICIO').AsString;
      edJUICIO.Hint           := sdqBusqueda.FieldByName('JUICIO').AsString;
      edEX_GRAVEDAD.Text      := NVL(sdqBusqueda.FieldByName('GRAVEDAD').AsString, '-');
      edEX_TIPO.Text          := sdqBusqueda.FieldByName('TIPO').AsString;
      //------------------------------------------------------------------------//
      if Trim(edJUICIO.Text) > '' then
        InfoHint(edJUICIO, 'Existe uno o más juicios para el siniestro seleccionado.');

      if AreIn(sdqBusqueda.FieldByName('ex_causafin').AsString, ['99', '95']) then
        MsgBox('El siniestro seleccionado ha sido cerrado por error de carga', MB_ICONEXCLAMATION);

      sBloqueados := GetConceptosBloqueados(vIdExpediente);
      if (sBloqueados <> '') then
        InfoHint(fraTrabajadorSIN.edSiniestro, 'Atención: el siniestro posee los siguientes conceptos bloqueados: ' + sBloqueados);
    end;
  end;

  if not sdqBusqueda.Eof then
  begin
    Accion := l_None;
    DoLimpiarDatosLiquidacion;
    case PageControl.ActivePageIndex  of
      ctsILP        : DoCargarILP;
      ctsILT        : DoCargarILT;
      ctsPresMedicas: DoCargarPresMed;
      ctsOPagos     : DoCargarOPagos;
      ctsLegales    : DoCargarLegales;
      ctsDatosEcon  : DoCargarDatosEconomicos;
    end;
    DoHabilitarAlta(False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarDatosLiquidacion;
begin
  case PageControl.ActivePageIndex of
    ctsILP        : DoLimpiarILP(True);
    ctsILT        : DoLimpiarILT(True);
    ctsPresMedicas: DoLimpiarPresMed;
    ctsDatosEcon  : DoLimpiarDatosEconomicos;      // Esto lo agregue yo, muy raro que no tuviera el limpiar de esta solapa (aunque el procedimiento de limpiar datos econ ya estaba hecho). estara bien??? (por TK 14614)
    ctsOPagos     : DoLimpiarOPagos(True);
    ctsLegales    : DoLimpiarLegales;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraTrabajadorSINedSiniestroSelect(Sender: TObject);
begin
  inherited;
  fraTrabajadorSIN.edSiniestroSelect(Sender);
  DoCargarLiquidaciones(True);
  DoEvaluarCartelSiniestroConAnioILT(vSiniestro, vOrden, vRecaida);  // TK 46933
  if sdqBusqueda.FieldByName('EX_PLURIEMPLEO').AsString = 'S' then
    InfoHint(fraTrabajadorSIN.edSiniestro, 'Siniestro en situación de pluriempleo');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarBotonesLiquidacion(bHabilitar: Boolean);
begin
//deshabilitar alta, cancelacion, datos del pago, sel. cia. retiro
  mnuDatosPago.Enabled := bHabilitar and Seguridad.Activar(mnuDatosPago);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarMostrarReserva(bHabilitar: Boolean);   // TK 53237
begin
  mnuMostrarReserva.Enabled := bHabilitar and Seguridad.Activar(mnuMostrarReserva);
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbRefrescarClick(Sender: TObject);
begin
  DoCargarLiquidaciones(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqILPAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqILP.FieldByName('LIQUIDADO') is TFloatField then
    TFloatField(sdqILP.FieldByName('LIQUIDADO')).Currency := True;

  if sdqILP.FieldByName('APORTES_IMPORTE') is TFloatField then
    TFloatField(sdqILP.FieldByName('APORTES_IMPORTE')).Currency := True;

  if sdqILP.FieldByName('SAL_FAMILIAR') is TFloatField then
    TFloatField(sdqILP.FieldByName('SAL_FAMILIAR')).Currency := True;

  if sdqILP.FieldByName('A_PAGAR') is TFloatField then
    TFloatField(sdqILP.FieldByName('A_PAGAR')).Currency := True;

  if sdqILP.FieldByName('DIFERENCIA') is TFloatField then
    TFloatField(sdqILP.FieldByName('DIFERENCIA')).Currency := True;

  if sdqILP.FieldByName('DIAS') is TFloatField then
    TFloatField(sdqILP.FieldByName('DIAS')).DisplayFormat := '0.00;-0.00';
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarDatosILP(DataSet: TDataSet);
begin
  inherited;
  with sdqILP do
    if Active and (Accion = l_None) then
    begin
      DoCrearObjILP(vSiniestro, vOrden, vRecaida, FieldByName('nro').AsInteger, oILP);
      oILP.EstadoOperacion := eoEstadoConsulta;
      DoRefrescarILP;
      DoHabilitarILP(False);
    end;

  //lModifNoAutorizada_ILP.Visible := IsModifNoAutorizada_ILP;   // Plan Reliquidaciones automaticas
  LeyendaModifAutorizada(sdqILP.FieldByName('LE_IDEXPEDIENTE').AsInteger, sdqILP.FieldByName('NRO').AsInteger, 'SLE', 'ILP');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoImprimirGrilla(dsActual :TDataSource; dgActual :TArtDBGrid;
                                                sCaption :String; Orientacion :TPageOrientation = pxLandscape);
begin
  with QueryPrint do
  begin
    Fields.Clear;
    PageOrientation := Orientacion;
    DataSource      := dsActual;
    SetGridColumns(dgActual, True, [baDetail, baHeader, baTotal, baSubTotal]);
    Title.Text := CaptionBase + ' - ' + sCaption;
    SubTitle.Text := 'Siniestro:' + IntToStr(vSiniestro) +
                                ' - Orden:' + IntToStr(vOrden) +
                                ' - Recaida:' + IntToStr(vRecaida) +
                                ' - ' + fraTrabajadorSIN.Nombre + '(' + fraTrabajadorSIN.CUIL + ')';
    Print;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.HayRegistroActivo :Boolean;
begin
  case PageControl.ActivePageIndex of
    ctsILP        : Result := sdqILP.Active and not(sdqILP.IsEmpty);
    ctsILT        : Result := sdqILT.Active and not(sdqILT.IsEmpty);
    ctsPresMedicas: Result := sdqPresMed.Active and not(sdqPresMed.IsEmpty);
    ctsOPagos     : Result := sdqOPagos.Active and not(sdqOPagos.IsEmpty);
    ctsLegales    : Result := sdqLegales.Active and not(sdqLegales.IsEmpty);
    ctsDatosEcon  : Result := True;
  else
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbOrdenarClick(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    ctsILP        : DoCargarOrden(sdILP, GridILP);
    ctsILT        : DoCargarOrden(sdILT, GridILT);
    ctsPresMedicas: DoCargarOrden(sdPresMed, GridPresMed);
    ctsOPagos     : DoCargarOrden(sdOPagos, GridOPagos);
    ctsLegales    : DoCargarOrden(sdLegales, GridLegales);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarOrden(sDialog :TSortDialog; dgActual :TArtDBGrid);
begin
  LoadDynamicSortFields(sDialog.SortFields, dgActual.Columns);
  sDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbExportarClick(Sender: TObject);
begin
  if HayRegistroActivo then
  begin
    case PageControl.ActivePageIndex of
      ctsILP        : ExportDialog.DataSet := sdqILP;
      ctsILT        : ExportDialog.DataSet := sdqILT;
      ctsPresMedicas: ExportDialog.DataSet := sdqPresMed;
      ctsOPagos     : ExportDialog.DataSet := sdqOPagos;
      ctsLegales    : ExportDialog.DataSet := sdqLegales;
    end;
    ExportDialog.Execute;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbDatosPagoClick(Sender: TObject);
begin
  DoCargarFinancial;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.CargarFinancials(sdqActual :TSDQuery; dgActual :TArtDBGrid; EsIncapacidad: Boolean);
var
  sdqFnclDatos, sdqRCEDatos: TSDQuery;
  Bookmk: {$IFDEF VER150}TBookmarkStr{$ELSE}TBookmark{$ENDIF};
  sTipo, sSql: String;
  bBuscaFinan: Boolean;
begin
  if not(sdqActual.Active) then Exit;

  bBuscaFinan := False;
  //primero me fijo si el dato está en la tabla rce_chequeemitido
  //para intentar evitar ir a la base de datos de financials.....
  sSql := 'SELECT ce_ordenpago, ce_fechaop, ce_numero, ce_fechacheque, ' +
                ' tb_descripcion, ce_fechasituacion, ce_observaciones ' +
           ' FROM rce_chequeemitido, art.ctb_tablas ' +
          ' WHERE ce_situacion = tb_codigo ' +
            ' AND tb_clave = ''SITCH'' ' +
            ' AND ce_id = :ID';
  with sdqActual do
  try
    DisableControls;
    Bookmk := Bookmark;
    First;
    while not EOF do
    begin
      if FieldByName('idchequeemitido').IsNull then
        bBuscaFinan := True
      else begin
        sdqRCEDatos := TSDQuery.Create(Self);
        try
          sdqRCEDatos.SQL.Text                    := sSql;
          sdqRCEDatos.ParamByName('id').AsInteger := FieldByName('idchequeemitido').AsInteger;
          sdqRCEDatos.DatabaseName                := 'dbPrincipal';
          sdqRCEDatos.Open;
          {------------------------------------}
          Edit;
          FieldByName('ordennro').Value    := sdqRCEDatos.FieldByName('ce_ordenpago').Value;
          FieldByName('ordenfecha').Value  := sdqRCEDatos.FieldByName('ce_fechaop').Value;
          FieldByName('chequenro').Value   := sdqRCEDatos.FieldByName('ce_numero').Value;
          FieldByName('chequefecha').Value := sdqRCEDatos.FieldByName('ce_fechacheque').Value;
          FieldByName('situacion').Value   := sdqRCEDatos.FieldByName('tb_descripcion').Value;
          FieldByName('fsituacion').Value  := sdqRCEDatos.FieldByName('ce_fechasituacion').Value;
          FieldByName('obscheque').Value   := sdqRCEDatos.FieldByName('ce_observaciones').Value;
          Post;
          {------------------------------------}
        finally
          sdqRCEDatos.Free;
        end;
      end;
      Next;
    end;
    Bookmark := Bookmk;
  finally
    EnableControls;
  end;

  if bBuscaFinan then
  begin
    dmFinancials.Conectar;
    try
      sdqActual.DisableControls;
      try
        Bookmk := sdqActual.Bookmark;
        try
          sdqFnclDatos := TSDQuery.Create(Self);
          try
            sTipo := Iif(EsIncapacidad, 'SLE', 'SPR');

            sSql := 'SELECT jl.jl_ar_b_payment_orders_all.payment_order_id ordennro, ' +
                          ' trunc(jl.jl_ar_b_payment_orders_all.payment_date) ordenfecha, ' +
                          ' jl.jl_ar_b_checks_all.check_number chequenro, ' +
                          ' trunc(nvl(jl.jl_ar_b_checks_all.date_issued, jl.jl_ar_b_payment_methods_all.cashflow_date-2)) chequefecha ' +
                     ' FROM ap.ap_invoices_all, ap.ap_invoice_payments_all, jl.jl_ar_b_payment_orders_all, ' +
                          ' jl.jl_ar_b_checks_all, jl.jl_ar_b_payment_methods_all ' +
                    ' WHERE ap.ap_invoices_all.invoice_id = ap.ap_invoice_payments_all.invoice_id ' +
                      ' AND ap.ap_invoice_payments_all.jlar_payment_order_id = jl.jl_ar_b_payment_orders_all.payment_order_id ' +
                      ' AND jl.jl_ar_b_payment_orders_all.payment_order_id = jl.jl_ar_b_checks_all.payment_order_id ' +
                      ' AND jl.jl_ar_b_payment_orders_all.payment_number = jl.jl_ar_b_payment_methods_all.payment_order_id ' +
                      ' AND ap.ap_invoices_all.pay_group_lookup_code = ''Siniestros'' ' +
                      ' AND jl.jl_ar_b_checks_all.status <> ''VOID'' ' +
                      ' AND ap.ap_invoices_all.attribute6 = :pSiniestro ' +
                      ' AND ap.ap_invoices_all.attribute7 = :pOrden ' +
                      ' AND ap.ap_invoices_all.attribute8 = :pRecaida ' +
                      ' AND ap.ap_invoices_all.attribute9 = :pNumLiqui ' +
                      ' AND ap.ap_invoices_all.attribute11 = :pTipo ' +

                  ' UNION ALL ' +

                   ' SELECT ch.check_id ordennro, ch.check_date ordenfecha, ' +
                           'ch.check_number chequenro, ch.check_date chequefecha' +
                     ' FROM ap_checks_all ch, ap_invoice_payments_all aip, ap_invoices_all ai ' +
                    ' WHERE ai.invoice_id=aip.invoice_id ' +
                      ' AND aip.check_id=ch.check_id ' +
                      ' AND ch.status_lookup_code=''NEGOTIABLE'' ' +
                      ' AND ai.attribute6 = :pSiniestro ' +
                      ' AND ai.attribute7 = :pOrden ' +
                      ' AND ai.attribute8 = :pRecaida ' +
                      ' AND ai.attribute9 = :pNumLiqui ' +
                      ' AND ai.attribute11 = :pTipo';

            dmFinancials.SetDatabaseToQuery(sdqFnclDatos);
            sdqFnclDatos.SQL.Text := sSql;
            sdqActual.First;
            while not sdqActual.EOF do
            begin
              if sdqActual.FieldByName('idchequeemitido').IsNull then
              begin
                sdqFnclDatos.ParamByName('pSiniestro').AsString := sdqActual.FieldByName('LE_SINIESTRO').AsString;
                sdqFnclDatos.ParamByName('pOrden').AsString     := sdqActual.FieldByName('LE_ORDEN').AsString;
                sdqFnclDatos.ParamByName('pRecaida').AsString   := sdqActual.FieldByName('LE_RECAIDA').AsString;
                sdqFnclDatos.ParamByName('pNumLiqui').AsString  := sdqActual.FieldByName('NRO').AsString;
                sdqFnclDatos.ParamByName('pTipo').AsString      := sTipo;

                dmFinancials.OpenQuery(sdqFnclDatos);
                {------------------------------------}
                sdqActual.Edit;
                sdqActual.FieldByName('OrdenNro').Value    :=  sdqFnclDatos.FieldByName('OrdenNro').Value;
                sdqActual.FieldByName('OrdenFecha').Value  :=  sdqFnclDatos.FieldByName('OrdenFecha').Value;
                sdqActual.FieldByName('ChequeNro').Value   :=  sdqFnclDatos.FieldByName('ChequeNro').Value;
                sdqActual.FieldByName('ChequeFecha').Value :=  sdqFnclDatos.FieldByName('ChequeFecha').Value;
                sdqActual.Post;
                {------------------------------------}
                sdqFnclDatos.Close;
              end;
              sdqActual.Next;
            end;
          finally
            sdqFnclDatos.Free;
          end;
        finally
          sdqActual.Bookmark := Bookmk;
        end;
      finally
        sdqActual.EnableControls;
      end;
    finally
      dmFinancials.Desconectar;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarILP(bCerrarQry :Boolean);
begin
  edDesdeILP.Clear;
  edHastaILP.Clear;
  edIBDILP.Clear;
  edIBDNoRemILP.Clear;
  edDiasILP.Clear;
  edImpLiquidadoILP.Clear;
  edImpLiquidNoRemILP.Clear;
  edPorcContribILP.Clear;
  edImpContribILP.Clear;
  edPorcAportesILP.Clear;
  edImpAportesILP.Clear;
  edCompDanos.Clear;
  edPagoAdic.Clear;
  edOtrosPagos.Clear;
  edSalarioFamiliarILP.Clear;
  edMopreILP.Clear;
  edAPagarILP.Clear;
  edTipoILP.Clear;
  edFormulaILP.Clear;
  fraDelegacionILP.Clear;
  edObservILP.Clear;
  edRecibosILP.Clear;
  edChequeNombreILP.Clear;
  fraMetodoPagoILP.Clear;
  fraBancoILP.Clear;
  edEnvioILP.Clear;
  edTipoILP.Hint            := '';
  udDiasILP.Position        := 0;
  if bCerrarQry then sdqILP.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarILP;
begin
  with sdqILP do
  begin
    Close;
    Sql.Text :=
      'SELECT le_numliqui NRO, liq.get_estadoliquidacionilp(le_tipoliqui, le_estado) ESTADO, ' +
            ' le_fechades DESDE, le_fechahas HASTA, le_diasaplica DIAS, le_impiltp LIQUIDADO, ' +
            ' le_icontra APORTES_IMPORTE, le_asigfamiliar SAL_FAMILIAR, le_imporperi A_PAGAR, ' +
            ' le_fproceso FPROC, le_usualta UPROC, le_femision FIMPRE, le_faprobado FAPROB, ' +
            ' le_aprobado UAPROB, le_ibasediaria IMPORTEBASE, le_paporemp CONT_PORC, ' +
            ' le_iconemp CONT_IMPORTE, le_paportra APORTES_PORC, le_plusampo MOPRE, ' +
            ' cp_titpago || ''  '' || TO_CHAR(le_porcincapacidad, ''999.00'') || ''% - NAC.: '' || tj_fnacimiento TIPO, ' +
            ' le_formula CALCULO, le_delegacion  DELEGACION, le_comentario OBSERVACIONES, ' +
            ' le_chequenombre CHEQUE_A_NOMBRE, le_estado, le_tipoliqui, le_conpago, ' +
            ' le_siniestro, le_orden, le_recaida, ml_descripcion MOTIVOCANCELACION, ' +
            ' to_number(null) ORDENNRO, to_date(null) ORDENFECHA, to_number(null) CHEQUENRO, ' +
            ' to_date(null) CHEQUEFECHA, ex_fechaaccidente, cp_tipo, cp_denpago, ' +
            ' Nvl(la_hijo,0) ASIGHIJO, Nvl(la_hijodiscapacitado,0) ASIGHIJODISC, ' +
            ' Nvl(la_ayudaescolar,0) ASIGESCOLAR, Nvl(la_prenatal,0) ASIGPRENATAL, ' +
            ' Nvl(la_maternidad,0) ASIGMATERNIDAD, tj_id, le_diferencia DIFERENCIA, ' +
            ' le_obrasocial OBRASOCIAL, ' +
            ' Decode(le_obrasocial_suss, ''S'', ''SUSS'', ''N'', ''NO SUSS'', '''') OBRASOCIALSUSS, ' +
            ' Decode(le_afjp_suss, ''S'', ''SUSS'', ''N'', ''NO SUSS'', '''') AFJPSUSS, ' +
            ' le_afjp AFJP, le_numpagocomi, le_numpagocheque, le_numintereses, ' +
            ' le_ideventoinca, le_idchequeemitido idchequeemitido, cast(null as varchar2(50)) SITUACION,  ' +
            ' to_date(null) FSITUACION, cast(null as varchar2(150)) OBSCHEQUE, ' +
            ' le_numtasajusticia, Decode(le_idembargo, Null, ''N'', ''S'') embargo, ' +
            ' art.dinerarias.get_fechapagoaportes(le_siniestro, le_orden, le_recaida, le_numliqui) fpagoaportes, cp_conpago,' +
            ' le_devuelvefondos, ex_cuil CUIL, LE_NUMLIQUI_COMPDANIOS, ' +
            ' DECODE(le_idpagojudicial, null, ''N'', ''S'') PagoJudicial, ' +
            ' LTRIM(TO_CHAR(((SELECT NVL(SUM(rp_res_art), 0) reserva ' +
                              ' FROM actuarial.urp_reservaincapacidad ' +
                             ' WHERE rp_siniestro = ex_siniestro ' +
                               ' AND rp_orden = ex_orden ' +
                               ' AND rp_periodo = (SELECT MAX(b.rp_periodo) ' +
                                                   ' FROM actuarial.urp_reservaincapacidad b))), ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''''')) RESERVAILP, ' +    // TK 53237
            ' le_montocompdanios, le_montopagoadic, le_formula, le_porcincapacidad, le_metodopago, le_enviofondos, le_tipoenviofondos, le_idenviofondos, ' +
            ' le_recibos, le_idbanco, le_ibasediarianorem, le_idbasepost, le_rchkdomicilio, le_rchkotro, le_rcalle, le_rnumero, le_rpiso, le_rdepartamento, ' +
            ' le_rcpostal, le_rlocalidad, le_rprovincia, le_rotro, le_id, decode(le_conceptootrospagos, ''20'', ''Intereses'', ''127'', ''Tasa Justicia'') ConceptoOP, ' +
            ' le_subtotal, le_idexpediente, le_metodopago ' +

       ' FROM scp_conpago, sle_liquiempsin, sex_expedientes, ' +
            ' ctj_trabajador, sin.sml_motivocancliquidaciones, sla_liqasignaciones ' +
      ' WHERE le_siniestro =' + SqlInt(vSiniestro) +
        ' AND le_orden =' + SqlInt(vOrden) +
        ' AND le_recaida =' + SqlInt(vRecaida) +
        ' AND ml_codigo(+) = le_mcancelacion ' +
        ' AND le_conpago = cp_conpago ' +
        ' AND cp_tipo = ''P'' ' +
        ' AND le_siniestro = ex_siniestro ' +
        ' AND le_orden = ex_orden ' +
        ' AND le_recaida = ex_recaida ' +
        ' AND ex_cuil = tj_cuil ' +
        ' AND le_siniestro = la_siniestro(+) ' +
        ' AND le_orden = la_orden(+) ' +
        ' AND le_recaida = la_recaida(+) ' +
        ' AND le_numliqui = la_numliqui(+) ' +
        GetExtraFiltro + sdILP.OrderBy;

    Open;

    DoHabilitarBotonesLiquidacion(not Eof);
    DoHabilitarMostrarReserva(not Eof);
    DoCargarFinancial;
    DoHabilitarILP(False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.udDiasILPChange(Sender: TObject);
begin
  DoCargarLiquidaciones(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarFiltros;
begin
  fraEmpresa.Clear;
  fraTrabajadorSIN.Clear;
  edSinFecha.Clear;
  edAltaFecha.Clear;
  edDELEGACION.Clear;
  edEX_ESTADO.Clear;
  edJUICIO.Clear;
  edJUICIO.Hint := '';
  edEX_GRAVEDAD.Clear;
  edEX_TIPO.Clear;
  vSiniestro    := 0;
  vOrden        := 0;
  vRecaida      := 0;
  vIdExpediente := 0;
  rbAntigUltimo.Checked   := True;
  rbEstadoActivos.Checked := True;
  chkPluriempleo.Checked  := False;
  mnuEmbargo.Checked      := False;
  DoMostrarDatosDigitalizacion;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarILT;
begin
  with sdqILT do
  begin
    Close;
    Sql.Text :=
      'SELECT le_numliqui NRO, liq.get_estadoliquidacionilt(le_tipoliqui, le_estado) ESTADO, ' +
            ' le_fechades DESDE, le_fechahas HASTA, le_diasaplica DIAS, le_subtotal LIQUIDADO, ' +
            ' le_iconemp CONTRIB, le_asigfamiliar SAL_FAMILIAR, le_imporperi A_PAGAR, ' +
            ' le_diferencia DIFERENCIA, le_impiltp IMPORTEART, ' +
            ' le_declaraemp IMPORTEEMPRESA, le_estado, le_tipoliqui, le_conpago, ' +
            ' le_fproceso FPROC, le_usualta UPROC, le_femision FIMPRE, le_faprobado FAPROB, ' +
            ' le_aprobado UAPROB, le_ibasediaria IMPORTEBASE, le_paporemp CONT_PORC, ' +
            ' le_iconemp CONT_IMPORTE, le_paportra APORTES_PORC, le_plusampo MOPRE, ' +
            ' cp_titpago || '' - NAC.: '' || tj_fnacimiento TIPO, ' +
            ' le_formula CALCULO, le_delegacion DELEGACION, le_comentario OBSERVACIONES, ' +
            ' le_chequenombre CHEQUE_A_NOMBRE, le_icontra APORTES_IMPORTE, ' +
            ' le_siniestro, le_orden, le_recaida, ml_descripcion MOTIVOCANCELACION, ' +
            ' to_number(null) ORDENNRO, to_date(null) ORDENFECHA, to_number(null) CHEQUENRO, ' +
            ' to_date(null) CHEQUEFECHA, ex_fechaaccidente, cp_tipo, cp_denpago, ' +
            ' Nvl(la_hijo,0) ASIGHIJO, Nvl(la_hijodiscapacitado,0) ASIGHIJODISC, ' +
            ' Nvl(la_ayudaescolar,0) ASIGESCOLAR, Nvl(la_prenatal,0) ASIGPRENATAL, ' +
            ' Nvl(la_maternidad,0) ASIGMATERNIDAD, tj_id, le_obrasocial OBRASOCIAL, ' +
            ' Decode(le_obrasocial_suss, ''S'', ''SUSS'', ''N'', ''NO SUSS'', '''') OBRASOCIALSUSS, ' +
            ' Decode(le_afjp_suss, ''S'', ''SUSS'', ''N'', ''NO SUSS'', '''') AFJPSUSS, ' +
            ' le_afjp AFJP, le_base_3mopres, le_metodopago, le_enviofondos, ' +
            ' le_numpagocomi, le_numpagocheque, le_recibos, le_numintereses, ' +
            ' le_ideventoinca, le_idchequeemitido idchequeemitido, cast(null as varchar2(50)) SITUACION,  ' +
            ' to_date(null) FSITUACION, cast(null as varchar2(150)) OBSCHEQUE, ' +
            ' le_numtasajusticia, Decode(le_idembargo, Null, ''N'', ''S'') embargo, ' +
            ' le_ibasediarianorem, le_impiltpnorem, le_noremundeclaraemp, ' +
            ' le_diferencianorem, le_subtotalnorem, le_idexpediente, ' +
            ' art.dinerarias.get_fechapagoaportes(le_siniestro, le_orden, le_recaida, le_numliqui) fpagoaportes, cp_conpago, ' +
            ' le_devuelvefondos, ex_cuil cuil, le_idbanco, le_tipoenviofondos, le_idenviofondos, le_idmotivodiferencia, ' +  // TK 39345 (el campo "le_idmotivodiferencia")
            ' le_rcalle, le_rnumero, le_rpiso, le_rdepartamento, le_rcpostal, le_rlocalidad, le_rprovincia,  '  +
            ' le_rchkotro, le_rotro, le_rchkdomicilio ' +
       ' FROM scp_conpago, sle_liquiempsin, sex_expedientes, ' +
            ' ctj_trabajador, sin.sml_motivocancliquidaciones, sla_liqasignaciones ' +
      ' WHERE le_siniestro =' + SqlInt(vSiniestro) +
        ' AND le_orden =' + SqlInt(vOrden) +
        ' AND le_recaida =' + SqlInt(vRecaida) +
        ' AND ml_codigo(+) = le_mcancelacion ' +
        ' AND le_conpago = cp_conpago ' +
        ' AND cp_tipo = ''I'' ' +
        ' AND le_siniestro = ex_siniestro ' +
        ' AND le_orden = ex_orden ' +
        ' AND le_recaida = ex_recaida ' +
        ' AND ex_cuil = tj_cuil ' +
        ' AND le_siniestro = la_siniestro(+) ' +
        ' AND le_orden = la_orden(+) ' +
        ' AND le_recaida = la_recaida(+) ' +
        ' AND le_numliqui = la_numliqui(+) ' +
        GetExtraFiltro + sdILT.OrderBy;
    Open;

    DoHabilitarBotonesLiquidacion(not Eof);
    DoCargarFinancial;
    DoHabilitarILT(False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridILTGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                    var Background: TColor; Highlight: Boolean);
begin
  if not Highlight then
  begin
    if (sdqILT.FieldByName('LE_ESTADO').AsString = 'E') then
      AFont.Color := clBlue
    else if ((sdqILT.FieldByName('LE_ESTADO').AsString = 'X') or
             (sdqILT.FieldByName('LE_ESTADO').AsString = 'A') or
             (sdqILT.FieldByName('LE_TIPOLIQUI').AsString = 'W') or
             (sdqILT.FieldByName('LE_TIPOLIQUI').AsString = 'X') or
             (sdqILT.FieldByName('LE_TIPOLIQUI').AsString = 'Y') or
             (sdqILT.FieldByName('LE_TIPOLIQUI').AsString = 'Z')) then
      AFont.Color := clGray;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarILT(bCerrarQry :Boolean);
begin
  fraTipoILT.Clear;
  edDesdeILT.Clear;
  edHastaILT.Clear;
  edIBDILT.Clear;
  edIBDNoRemILT.Clear;
  edDiasILT.Clear;
  edImpLiquidadoILT.Clear;
  edImpLiquidadoNoRemILT.Clear;
  edPorcContribILT.Clear;
  edPorcContribILT_NoRem.Clear;  // TK 51343 que pasa a plan
  edImpContribILT.Clear;
  edImpContribILT_NoRem.Clear;
  edPorcAportesILT.Clear;
  edImpAportesILT.Clear;
  edSalarioFamiliarILT.Clear;
  edAPagarILT.Clear;
  fraDelegacionILT.Clear;
  fraMetodoPagoILT.Clear;
  fraBancoILT.Clear;
  fraMotivoDiferencia.Clear;  // TK 39345
  edEnvioILT.Clear;
  edObservILT.Clear;
  edChequeNombreILT.Clear;
  edRecibosILT.Clear;
  edImpARTILT.Clear;
  edImpARTNoRemILT.Clear;
  edImpEmpresaILT.Clear;
  edImpEmpNoRemILT.Clear;
  edDiferenciaILT.Clear;
  edDiferenciaNoRemILT.Clear;
  chkBaseMopresILT.Checked := False;
  udDiasILT.Position := 0;
  if bCerrarQry then sdqILT.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarDatosILT(DataSet: TDataSet);
begin
  inherited;
  with sdqILT do
    if Active and (Accion = l_None) then
    begin
      DoCrearObjILT(vSiniestro, vOrden, vRecaida, FieldByName('nro').AsInteger, oILT);
      oILT.EstadoOperacion := eoEstadoConsulta;
      DoRefrescarILT;
      DoHabilitarILT(False);
      DoSetearEsCompensacion;  // Plan
    end;
 // lModifNoAutorizada_ILT.Visible := IsModifNoAutorizada_ILT;   // Plan Reliquidaciones automaticas
  LeyendaModifAutorizada(sdqILT.FieldByName('LE_IDEXPEDIENTE').AsInteger, sdqILT.FieldByName('NRO').AsInteger, 'SLE', 'ILT');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqILTAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqILT.FieldByName('LIQUIDADO') is TFloatField then
    TFloatField(sdqILT.FieldByName('LIQUIDADO')).Currency := True;
  if sdqILT.FieldByName('CONTRIB') is TFloatField then
    TFloatField(sdqILT.FieldByName('CONTRIB')).Currency := True;
  if sdqILT.FieldByName('SAL_FAMILIAR') is TFloatField then
    TFloatField(sdqILT.FieldByName('SAL_FAMILIAR')).Currency := True;
  if sdqILT.FieldByName('A_PAGAR') is TFloatField then
    TFloatField(sdqILT.FieldByName('A_PAGAR')).Currency := True;
  if sdqILT.FieldByName('DIFERENCIA') is TFloatField then
    TFloatField(sdqILT.FieldByName('DIFERENCIA')).Currency := True;
  if sdqILT.FieldByName('DIAS') is TFloatField then
    TFloatField(sdqILT.FieldByName('DIAS')).DisplayFormat := '0.00;-0.00';
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarPresMed;
begin
  with sdqPresMed do
  begin
    Close;
    Sql.Text :=
    ' SELECT iv_numpago, tb_descripcion estado, cp_denpago, iv_fecpresta, iv_cantapro, iv_impfacturado, ' +
           ' NVL(art.amebpba.nomenclador(iv_pres_nomenclador, iv_pres_capitulo, iv_pres_codigo), iv_presdet) detalle, ' +
           ' iv_volante, iv_fecalta, iv_usualta, ca_descripcion, vo_fechapro, vo_usuapro, iv_numauto ' +
      ' FROM siv_itemvolante, svo_volantes, ctb_tablas, scp_conpago, cpr_prestador ' +
     ' WHERE iv_siniestro = ' + SqlInt(vSiniestro) +
       ' AND iv_orden = ' + SqlInt(vOrden) +
       ' AND iv_recaida = ' + SqlInt(vRecaida) +
       ' AND tb_codigo(+) = iv_estado ' +
       ' AND tb_clave(+) = ''MUVOL'' ' +
       ' AND iv_conpago = cp_conpago(+) ' +
       ' AND iv_volante = vo_volante(+) ' +
       ' AND vo_prestador = ca_identificador(+) ' +
        GetExtraFiltro + sdPresMed.OrderBy;
    Open;
    DoHabilitarBotonesLiquidacion(False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarPresMed;
begin
  sdqPresMed.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqPresMedAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqPresMed.FieldByName('IV_IMPFACTURADO') is TFloatField then
    TFloatField(sdqPresMed.FieldByName('IV_IMPFACTURADO')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridPresMedGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Highlight then
  begin
    if (sdqPresMed.FieldByName('IV_IMPFACTURADO').AsCurrency < 0) then
      AFont.Color := clGray;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqOPagosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqOPagos.FieldByName('PR_IMPORPAGO') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('PR_IMPORPAGO')).Currency := True;
  if sdqOPagos.FieldByName('PR_IMPCHEQUE') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('PR_IMPCHEQUE')).Currency := True;
  if sdqOPagos.FieldByName('PR_IVA') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('PR_IVA')).Currency := True;
  if sdqOPagos.FieldByName('PR_INGRESOBRUTO') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('PR_INGRESOBRUTO')).Currency := True;
  if sdqOPagos.FieldByName('PR_RENTA') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('PR_RENTA')).Currency := True;
  if sdqOPagos.FieldByName('PR_SELLADOS') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('PR_SELLADOS')).Currency := True;
  if sdqOPagos.FieldByName('PR_OTROS') is TFloatField then
    TFloatField(sdqOPagos.FieldByName('PR_OTROS')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarOPagos;
begin
  with sdqOPagos do
  begin
    Close;
    Sql.Text :=
    ' SELECT pr_numpago, pr_estado, pr_acreedor, utiles.armar_cuit(pr_cuitcuil) cuitcuil, ' +
           ' pr_letrafac, pr_situfac, pr_numfac, pr_fechafac, pr_femision, pr_fechapago, pr_faprobado, ' +
           ' pr_imporpago, pr_importeconretencion, pr_conpago, pr_comentario, ' +
           ' pr_ctagasto, pr_fechafac, cp_titpago, tb_descripcion, pr_prestadorsecuencia, ' +
           ' pr_prestadormutual, pr_pagojudicial, pr_delegacion, pr_fechalta, pr_cai, pr_chequenombre, ' +
           ' liq.get_estadoliquidacionopagos(pr_estado) estado, pr_cuitcuil, ' +
           ' pr_letrafac || ''-'' || pr_situfac || ''-'' || pr_numfac factura, ' +
           ' liq.get_acreedor(pr_acreedor, REPLACE(pr_cuitcuil, ''-''), pr_prestadormutual) acreedor, ' +
           ' pr_formapago, pr_metodopago, pr_enviofondos, pr_idbanco, pr_usualta, ' +
           ' pr_impcheque, pr_iva, pr_ingresobruto, pr_renta, pr_sellados, pr_otros, ' +
           ' pr_tipotasa, pr_fechadesde, pr_fechahasta, pr_tasaoriginal, pr_tasafinal, ' +
           ' DECODE(pr_tipotasajusticia, ''S'', ''Suma fija'', ''P'', ''Porcentaje'', Null) tasajus, ' +
           ' pr_rcalle, pr_rnumero, pr_rpiso, pr_rdepartamento, pr_rcpostal, pr_rlocalidad, NVL(pr_rprovincia, 0) provrec, ' +
           ' pr_idchequeemitido idchequeemitido, to_number(null) ORDENNRO, to_date(null) ORDENFECHA, ' +
           ' to_number(null) CHEQUENRO, to_date(null) CHEQUEFECHA, cast(null as varchar2(50)) SITUACION, ' +
           ' to_date(null) FSITUACION, cast(null as varchar2(150)) OBSCHEQUE, pr_siniestro le_siniestro, ' +
           ' pr_orden le_orden, pr_recaida le_recaida, pr_numpago NRO, pr_idexpediente, pr_rprovincia ' +
      ' FROM spr_pagoexpesin, scp_conpago, sex_expedientes, ctb_tablas ' +
     ' WHERE ex_siniestro = pr_siniestro ' +
       ' AND pr_orden = ex_orden ' +
       ' AND pr_recaida = ex_recaida ' +
       ' AND pr_conpago = cp_conpago ' +
       ' AND pr_acreedor = tb_codigo ' +
       ' AND tb_clave = ''TACRE'' ' +
       ' AND ex_siniestro = ' + SqlInt(vSiniestro) +
       ' AND ex_orden = ' + SqlInt(vOrden) +
       ' AND ex_recaida = ' + SqlInt(vRecaida) +
        GetExtraFiltro + sdOPagos.OrderBy;
    Open;
    DoHabilitarBotonesLiquidacion(not Eof);
    DoCargarFinancial;
    DoHabilitarOPagos(False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridOPagosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                       var Background: TColor; Highlight: Boolean);
var
  bGris :Boolean;
begin
  if not Highlight then
  begin
    bGris := (sdqOPagos.FieldByName('PR_ESTADO').AsString = 'X') or
             (sdqOPagos.FieldByName('PR_ESTADO').AsString = 'A') or
             (sdqOPagos.FieldByName('PR_ESTADO').AsString = 'Z');
    if bGris then AFont.Color := clGray;

    if not(sdqOPagos.FieldByName('PR_FAPROBADO').IsNull) then
    begin
      if bGris then
        AFont.Color := clNavy
      else
        AFont.Color := clBlue;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarDatosOPagos(DataSet: TDataSet);
begin
  inherited;
  if sdqOPagos.Active and (Accion = l_None) then
    with sdqOPagos do
    begin
      lblLiqAnulOP.Visible      := (GetChar(FieldByName('PR_ESTADO').AsString) in ['A','X','Z']);
      edNumPagoOP.Value         := FieldByName('PR_NUMPAGO').AsInteger;
      dcFechaLiqOP.Date         := FieldByName('PR_FECHAPAGO').AsDateTime;
      dcFechaEmOP.Date          := FieldByName('PR_FEMISION').AsDateTime;
      fraTipoAcreedOP.Codigo    := FieldByName('PR_ACREEDOR').AsString;
      chkPagoJudOP.Checked      := (FieldByName('PR_PAGOJUDICIAL').AsString = 'S');
      fraDelegOP.Codigo         := FieldByName('PR_DELEGACION').AsString;
      edCAIOP.Text              := FieldByName('PR_CAI').AsString;
      fraConPagoOP.Codigo       := FieldByName('PR_CONPAGO').AsString;
      edLetraFacOP.Text         := FieldByName('PR_LETRAFAC').AsString;
      edSituFacOP.Text          := FieldByName('PR_SITUFAC').AsString;
      edNumFacOP.Text           := FieldByName('PR_NUMFAC').AsString;
      dcFechaFacOP.Date         := FieldByName('PR_FECHAFAC').AsDateTime;
      edObsOP.Lines.Text        := FieldByName('PR_COMENTARIO').AsString;
      edNroCuentaOP.Text        := FieldByName('PR_CTAGASTO').AsString;
      edSinRetGanOP.Value       := FieldByName('PR_IMPORPAGO').AsCurrency -
                                   FieldByName('PR_IMPORTECONRETENCION').AsCurrency;
      edConRetGanOP.Value       := FieldByName('PR_IMPORTECONRETENCION').AsCurrency;
      vSecPrestador             := FieldByName('PR_PRESTADORSECUENCIA').AsInteger;
      sSecMutual                := FieldByName('PR_PRESTADORMUTUAL').AsString;
      fraTipoAcreedOP.OnChange(Nil);
      edRazonSocialOP.Text      := FieldByName('ACREEDOR').AsString;
      if (fraTipoAcreedOP.Codigo = 'BE') then
      begin
        edDNIOP.Visible         := True;
        edDNIOP.Text            := FieldByName('PR_CUITCUIL').AsString;
      end
      else begin
        edDNIOP.Visible         := False;
        edCuitOP.Text           := FieldByName('PR_CUITCUIL').AsString;
      end;
      fraMetodoPagoOP.Codigo    := FieldByName('PR_METODOPAGO').AsString;
      edEnvioOP.Text            := FieldByName('PR_ENVIOFONDOS').AsString;

      with tReciboOP do
        begin
          Calle                 := FieldByName('PR_RCALLE').AsString;
          Numero                := FieldByName('PR_RNUMERO').AsString;
          Piso                  := FieldByName('PR_RPISO').AsString;
          Departamento          := FieldByName('PR_RDEPARTAMENTO').AsString;
          CodigoPostal          := FieldByName('PR_RCPOSTAL').AsString;
          Localidad             := FieldByName('PR_RLOCALIDAD').AsString;
          Prov                  := FieldByName('PROVREC').AsInteger;

          Do_CargarFrameRecibosOP;
          Do_CargarRecibosOP;
        end;

      DoHabilitarOPagos(False);
      fraBancoOP.Value          := FieldByName('PR_IDBANCO').AsInteger;
     // lModifNoAutorizada_OP.Visible := IsModifNoAutorizada_OP;   // Plan Reliquidaciones automaticas
      LeyendaModifAutorizada(sdqOPagos.FieldByName('PR_IDEXPEDIENTE').AsInteger, sdqOPagos.FieldByName('NRO').AsInteger, 'SPR', 'OP');
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarOPagos(bCerrarQry :Boolean);
begin
  edNumPagoOP.Clear;
  dcFechaLiqOP.Clear;
  dcFechaEmOP.Clear;
  fraTipoAcreedOP.Limpiar;
  fraDelegOP.Clear;
  edRazonSocialOP.Clear;
  edCuitOP.Clear;
  edDNIOP.Clear;
  edCAIOP.Clear;
  fraConPagoOP.Clear;
  edNroCuentaOP.Clear;
  edLetraFacOP.Clear;
  edSituFacOP.Clear;
  edNumFacOP.Clear;
  dcFechaFacOP.Clear;
  edSinRetGanOP.Clear;
  edConRetGanOP.Clear;
  edObsOP.Clear;
  fraMetodoPagoOP.Clear;
  fraBancoOP.Clear;
  edEnvioOP.Clear;
  edRecibosOP.Clear;
  chkPagoJudOP.Checked  := False;
  lblLiqAnulOP.Visible  := False;

  if bCerrarQry then
    sdqOPagos.Close
  else
    dcFechaLiqOP.Date := DBDate;

  Do_LimpiarRecibosOP;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarLegales;
begin
  with sdqLegales do
  begin
    Close;
    Sql.Text :=
      ' SELECT jt.jt_id idjuicio, lpl.pl_idliquidacion liquidacion, jt.jt_numerocarpeta carpeta, ' +
             ' lpl.pl_letrafactura || ''-'' || lpl.pl_situacionfactura || ''-'' || lpl.pl_numerofactura factura, ' +
             ' lpl.pl_fechafactura fechafactura, scp.cp_denpago || '': '' || irj.ir_detalle concepto, ' +
             ' lpl.pl_detallebeneficiario beneficiario, lpl.pl_fechaaprobado fechaaprobado, ' +
             ' lpl.pl_chequenombre chequenombre, lpl.pl_importepago importesinret, ' +
             ' lpl.pl_importeconretencion importeconret, ' +
             ' liq.get_estadoliquidacionlegales(pl_estado, pl_fechaemision) estado, ' +
             ' DECODE(pl_estado, ''E'', lpl.pl_usuarioaprobado, ' +
             ' ''C'', DECODE(pl_fechaemision, NULL, pl_usualta, lpl.pl_usuarioemision), lpl.pl_usumodif) usuario, ' +
             ' lpl.pl_fechaalta fechaalta ' +
        ' FROM legales.lsj_siniestrosjuicioentramite sj, legales.lod_origendemanda od, ' +
             ' legales.ljt_juicioentramite jt, legales.lpl_pagolegal lpl, ' +
             ' legales.lbp_beneficiariopago lbp, art.scp_conpago scp, legales.lir_importesreguladosjuicio irj ' +
       ' WHERE od.od_id = sj.sj_idorigendemanda ' +
         ' AND jt.jt_id = od.od_idjuicioentramite ' +
         ' AND lpl.pl_idjuicioentramite = od.od_idjuicioentramite ' +
         ' AND lbp.bp_id(+) = lpl.pl_idbeneficiariopago ' +
         ' AND lpl.pl_conpago = scp.cp_conpago ' +
         ' AND irj.ir_nropago(+) = lpl.pl_id ' +
         ' AND od.od_fechabaja IS NULL ' +      // estas dos lineas (esta y la siguiente) fueron agregadas por ticket 61176 GLopez  (segun mail PMarrone)
         ' AND sj.sj_fechabaja IS NULL ' +

         {' AND sj.sj_siniestro = ' + SqlInt(vSiniestro) +
         ' AND sj.sj_orden = ' + SqlInt(vOrden) +
         ' AND sj.sj_recaida = ' + SqlInt(vRecaida) +  }
         ' AND sj_idsiniestro = ' + SqlInt(vIdExpediente) +
      'UNION ALL ' +
      ' SELECT pm_idmediacion idjuicio, pm_idliquidacion liquidacion, NULL carpeta, ' +
             ' pm_letrafactura || ''-'' || pm_situacionfactura || ''-'' || pm_numerofactura factura, ' +
             ' pm_fechafactura fechafactura, NVL (cp_titpago, cp_denpago) concepto, ' +
             ' pm_detallebeneficiario beneficiario, pm_fechaaprobado fechaaprobado, ' +
             ' pm_chequenombre chequenombre, pm_importepago importesinret, ' +
             ' pm_importeconretencion importeconret, ' +
             ' liq.get_estadoliquidacionlegales(pm_estado, pm_fechaemision) estado, ' +
             ' DECODE (pm_estado, ''E'', pm_usuarioaprobado, ''C'', DECODE (pm_fechaemision, ' +
             '         NULL, pm_usualta, pm_usuarioemision), pm_usumodif) usuario, ' +
             ' pm_fechaalta fechaalta ' +
        ' FROM legales.lpm_pagomediacion, art.scp_conpago, legales.lme_mediacion ' +
       ' WHERE pm_conpago = cp_conpago ' +
         ' AND pm_estado IN (''C'', ''E'') ' +
         ' AND pm_idmediacion = me_id ' +
         ' AND me_idexpediente = ' + SqlInt(vIdExpediente) +
        sdLegales.OrderBy;
    Open;
    DoHabilitarBotonesLiquidacion(False);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarLegales;
begin
  sdqLegales.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridILPGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Highlight then
  begin
    if sdqILP.FieldByName('LE_TIPOLIQUI').AsString = 'W' then
      AFont.Color := clGreen
    else begin
      if sdqILP.FieldByName('LE_ESTADO').AsString = 'A'  then
        AFont.Color := clRed
      else if sdqILP.FieldByName('LE_ESTADO').AsString = 'X'  then
        AFont.Color := clSilver
      else if sdqILP.FieldByName('LE_ESTADO').AsString = 'E'  then
        AFont.Color := clBlue;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbNuevoClick(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    ctsILP        :DoNuevoILP;
    ctsILT        :DoNuevoILT;
    ctsOPagos     :DoNuevoOPagos;
    ctsDatosEcon  :DoNuevoDatosEcon;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoNuevoILT;
begin
  if NuevoILT(vSiniestro, vOrden, vRecaida, oILT) then
  begin
    Accion := l_Alta;
    DoHabilitarILT(True);
    DoHabilitarAlta(True);
    DoRefrescarILT;
    LockControl(edChequeNombreILT, (fraTipoILT.Codigo = 'L')); // si es Reintegro, lo deshabilita - Tk 39134
  end
  else
    DoHabilitarAlta(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarILT(bHabilitar :Boolean);
begin
  LockControls([fraTipoILT, edDesdeILT, edHastaILT, edImpEmpresaILT, fraDelegacionILT,
                edObservILT, edChequeNombreILT, udDiasILT, btnAsigFamILT, edSalarioFamiliarILT,
                fraMetodoPagoILT, fraBancoILT, fraMotivoDiferencia, edImpEmpNoRemILT, edEnvioILT, edRecibosILT], not bHabilitar);

//  LockControl(edRecibosILT, not(bHabilitar) or (oILT.Tipo <> 'D') );     por TK 28814: ahora el edRecibosLLT queda por siempre deshabilitado (ReadOnly = True), ya que se modifica con el boton.

  mnuCuentasBancarias.Enabled := bHabilitar;

  if not bHabilitar then begin
    btnEnvioILT.Enabled   := False;
    btnRecibosILT.Enabled := False;
  end;

  if bHabilitar and edDesdeILT.CanFocus then
    edDesdeILT.SetFocus;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoNuevoOPagos;
begin
  Accion := l_Alta;
  DoLimpiarOPagos(False);
  DoHabilitarOPagos(True);
  DoHabilitarAlta(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarOPagos(bHabilitar :Boolean);
begin
  LockControls([dcFechaLiqOP, fraTipoAcreedOP, edRazonSocialOP, chkPagoJudOP,
                fraDelegOP, edCuitOP, edCAIOP, fraConPagoOP, edLetraFacOP, edSituFacOP,
                edNumFacOP, dcFechaFacOP, edSinRetGanOP, edConRetGanOP, edObsOP,
                fraMetodoPagoOP, fraBancoOP, edEnvioOP, btnRecibosOP, edRecibosOP], not bHabilitar);
  DoHabilitarCuit;
  btnCuentasOP.Enabled        := bHabilitar;
  mnuCuentasBancarias.Enabled := bHabilitar;

  if not dcFechaLiqOP.ReadOnly then dcFechaLiqOP.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarDatosEconomicos(bHabilitar :Boolean);
var
  bHabil, bClave: Boolean;
begin
  LockControls([edFecRecDocILTDE, edFecRecDocILPDE, edFecRecDocMortDE, edFecRecDocContriDE,
                edCantHijosSinDiscapDE, edCantHijosDiscapDE, edFDespidoDE, chkBaseMopresDE,
                edFDepositoDE, edFJubilacionDE, fraCeseRentaDE, fraZonaAFIPDE, GridAportesILTDE,
                GridAportesILTPDDE, chkApyConDE, fraOSocialDE, fraAFJPDE, fraZonaAFIPDE,
                fraCondicionAFIPDE, GridAportesILPDE], not bHabilitar);

  bClave := Seguridad.Claves.IsActive('ModifDEVigenciaCerrada') or
            Seguridad.Claves.IsActive('ModifDEAprob');
  bHabil := bHabilitar and (Accion = l_Alta) or (((Accion = l_Edicion) and dcVigHastaDE.IsEmpty)) or
                                               ((Accion = l_Edicion) and not(dcVigHastaDE.IsEmpty) and bClave);
  LockControls([dgRemuVarPosDecre, chkCalcSACNoRemPostDE, chkEspecialPostDE,
                edDiasFijoPostDE, edMontoFijoPostDE, dcVigDesdeDE,
                edMontoFijoNoRemPostDE, chkCalcSACRemPostDE], not bHabil);

  if not fraOSocialDE.edCodigo.ReadOnly then
    fraOSocialDE.edCodigo.SetFocus;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarAlta(bHabilitar :Boolean);
var
  bImprimir: Boolean;
begin
  tbGuardar.Enabled   := bHabilitar and Seguridad.Activar(tbGuardar);
  tbCancelar.Enabled  := bHabilitar and Seguridad.Activar(tbCancelar);
  tbLimpiar.Enabled   := IIF(bHabilitar, False, Seguridad.Activar(tbLimpiar));
  tbOrdenar.Enabled   := IIF(bHabilitar, False, Seguridad.Activar(tbOrdenar));
  tbImprimir.Enabled  := IIF(bHabilitar, False, Seguridad.Activar(tbImprimir));
  tbExportar.Enabled  := IIF(bHabilitar, False, Seguridad.Activar(tbExportar));
  tbRefrescar.Enabled := IIF(bHabilitar, False, Seguridad.Activar(tbRefrescar));

  case PageControl.ActivePageIndex of
    ctsILP:
      begin
        tbNuevo.Enabled       := IIF(bHabilitar, False, Seguridad.Claves.IsActive('AltaILP'));
        tbModificar.Enabled   := IIF(bHabilitar, False, Seguridad.Claves.IsActive('ModifILP'));
        tbEliminar.Enabled    := IIF(bHabilitar, False, Seguridad.Claves.IsActive('BajaILP'));
        btnRecibosILP.Enabled := bHabilitar;
        LockControl(fraDomicilioRecibos, False);
        LockControl(MemoOtroRecibos, True);
      end;
    ctsILT:
      begin
        tbNuevo.Enabled       := IIF(bHabilitar, False, Seguridad.Claves.IsActive('AltaILT'));
        tbModificar.Enabled   := IIF(bHabilitar, False, Seguridad.Claves.IsActive('ModifILT'));
        tbEliminar.Enabled    := IIF(bHabilitar, False, Seguridad.Claves.IsActive('BajaILT'));
        LockControl(fraDomicilioRecibos, False);
        LockControl(MemoOtroRecibos, True);
      end;
    ctsOPagos:
      begin
        tbNuevo.Enabled       := IIF(bHabilitar, False, Seguridad.Claves.IsActive('AltaOP'));
        tbModificar.Enabled   := IIF(bHabilitar, False, Seguridad.Claves.IsActive('ModifOP'));
        tbEliminar.Enabled    := IIF(bHabilitar, False, Seguridad.Claves.IsActive('BajaOP'));
        LockControl(fraDomicilioRecibos, False);
      end;
    ctsDatosEcon:
      begin
        LockControls(GridDERemuneraciones, not bHabilitar);
        tbNuevo.Enabled       := IIF(bHabilitar, False, Seguridad.Claves.IsActive('AltaDE'));
        tbModificar.Enabled   := IIF(bHabilitar, False, Seguridad.Claves.IsActive('ModifDE'));
        tbEliminar.Enabled    := IIF(bHabilitar, False, Seguridad.Claves.IsActive('BajaDE'));
        tbBajaRemu.Enabled    := IIF(bHabilitar, Seguridad.Activar(tbBajaRemu), False);
        tbAntRemu.Enabled     := IIF(bHabilitar, False, True);
        tbDespRemu.Enabled    := IIF(bHabilitar, False, True);
      end;
    else
      begin
        tbNuevo.Enabled     := False;
        tbModificar.Enabled := False;
        tbEliminar.Enabled  := False;
      end;
  end;

  bImprimir := (PageControl.ActivePageIndex = ctsOPagos) or
               ((PageControl.ActivePageIndex = ctsILP) and Seguridad.Claves.IsActive('ReimprimirILP')) or
               ((PageControl.ActivePageIndex = ctsILT) and Seguridad.Claves.IsActive('ReimprimirILT'));
  mnuImprLiquidacion.Enabled := bImprimir;

  bImprimir := (PageControl.ActivePageIndex = ctsILP) or (PageControl.ActivePageIndex = ctsILT);
  mnuImprOrdenPago.Enabled   := bImprimir;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbCancelarClick(Sender: TObject);
begin
  if ConfirmaCancelar then DoCargarLiquidaciones(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbGuardarClick(Sender: TObject);
var iResValida: integer;
begin
  case PageControl.ActivePageIndex of
    ctsILP:
      begin
        DoPerderFoco(edObservILP, edImpAportesILP);
        if (Accion = l_Reliquidacion) then
          DoGrabarILP_Reliquidacion(oILP, vSiniestro, vOrden, vRecaida)   // Plan Reliquidaciones Automaticas
        else
          DoGrabarILP(False, oILP, vSiniestro, vOrden, vRecaida, Accion, iResValida);  // si el primer parametro es True genera la liq en estado Pendiente
      end;
    ctsILT:
      begin
        DoPerderFoco(edObservILT, edImpARTILT);
        if (Accion = l_Reliquidacion) then
          DoGrabarILT_Reliquidacion(oILT, vSiniestro, vOrden, vRecaida)   // Plan Reliquidaciones Automaticas
        else
          DoGrabarILT(False, oILT, vSiniestro, vOrden, vRecaida, Accion, iResValida);  // si el primer parametro es True genera la liq en estado Pendiente
      end;
    ctsOPagos:
      begin
        if (Accion = l_Reliquidacion) then
          DoGrabarOPagos_Reliquidacion(vSiniestro, vOrden, vRecaida)
        else
          DoGrabarOPagos;
      end;
    ctsDatosEcon:
      begin
        DoPerderFoco(edFecRecDocILTDE, edFecRecDocILPDE);
        DoGrabarDatosEconomicos;
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarOPagos;
var
  sSql :String;
  iNumPago :Integer;
  seguir: boolean;
begin
  seguir := true;
  if ValidarOPagos then
  with TfrmDireccionCDO.Create(nil) do
  try
    try
      iNumpago := GetProxPagoSPR(vSiniestro, vOrden, vRecaida);
      BeginTrans;
      if (Sesion.Sector = 'PRESDIN') and (Mostrar(vIdExpediente, iNumPago, 'OP') = false) then
        seguir := false;
      if seguir then
      begin
        if (Accion = l_Alta) then
        begin
          with tReciboOP do
            sSql :=
              'INSERT INTO spr_pagoexpesin ' +
              '(pr_siniestro, pr_orden, pr_recaida, pr_numpago, pr_fechapago, pr_conpago, pr_femision, ' +
              ' pr_acreedor, pr_cuitcuil, pr_letrafac, pr_situfac, pr_numfac, pr_fechafac, pr_imporpago, ' +
              ' pr_importeconretencion, pr_formapago, pr_ctagasto, pr_comentario, pr_usualta, pr_fechalta, ' +
              ' pr_estado, pr_prestadorsecuencia, pr_prestadormutual, pr_pagojudicial, pr_delegacion, ' +
              ' pr_cai, pr_metodopago, pr_enviofondos, pr_idbanco, pr_rcalle, pr_rnumero, pr_rpiso, pr_rdepartamento, ' +
              ' pr_rcpostal, pr_rlocalidad, pr_rprovincia) VALUES ( ' +
              SqlInt(vSiniestro) + ',' + SqlInt(vOrden) + ',' + SqlInt(vRecaida) + ',' +
              SqlInt(iNumPago) + ',' + SqlDate(dcFechaLiqOP.Date) + ',' +
              SqlValue(fraConPagoOP.Codigo) + ', Null, ' +
              SqlValue(fraTipoAcreedOP.Codigo) + ',' + IIF(edDNIOP.Visible, SqlValue(edDNIOP.Text), SqlValue(edCuitOP.Text)) + ',' +
              SqlValue(edLetraFacOP.Text) + ',' + SqlValue(edSituFacOP.Text) + ',' +
              SqlValue(edNumFacOP.Text) + ',' + SqlDate(dcFechaFacOP.Date) + ',' +
              SqlNumber(edSinRetGanOP.Value + edConRetGanOP.Value, True) + ',' +
              SqlNumber(edConRetGanOP.Value) + ',' +
              SqlString(GetFormaPago, True, True) + ',' +
              SqlValue(edNroCuentaOP.Text) + ',' + SqlValue(edObsOP.Lines.Text) + ',' +
              SqlValue(Sesion.UserID) + ', ActualDate, ''C'', ' +
              SqlInt(vSecPrestador) + ',' + SqlValue(sSecMutual) + ',' +
              IIF(chkPagoJudOP.Checked, '''S''', '''N''') + ',' +
              SqlValue(fraDelegOP.Codigo) + ',' +  SqlValue(Trim(edCAIOP.Text)) + ',' +
              SqlValue(fraMetodoPagoOP.Codigo) + ',' + SqlValue(edEnvioOP.Text) + ',' +
              SqlInt(fraBancoOP.Value, True) + ',' +
              SqlValue(Calle) + ',' +
              SqlValue(Numero) + ',' +
              SqlValue(Piso) + ',' +
              SqlValue(Departamento) + ',' +
              SqlValue(CodigoPostal) + ',' +
              SqlValue(Localidad) + ',' +
              SqlInt(Prov, True) + ')';
          EjecutarSqlST(sSql);

          if MsgAsk('Alta efectuada correctamente, ¿Desea imprimir la liquidación ahora?') then
            DoImprimirOPagos(iNumPago, 'C', IIF(edDNIOP.Visible, edDNIOP.Text, edCuitOP.Text), edRazonSocialOP.Text);

          DoGenerarOPAutomatica(vSiniestro, vOrden, vRecaida, fraMetodoPagoOP.Codigo,
                                IntToStr(iNumpago), fraTipoAcreedOP.Codigo,
                                IIF(edDNIOP.Visible, edDNIOP.Text, edCuitOP.Text), edLetraFacOP.Text,
                                edSituFacOP.Text, edNumFacOP.Text, GetFormaPago, sSecMutual,
                                IIF(chkPagoJudOP.Checked, 'S', 'N'), fraDelegOP.Codigo, Trim(edCAIOP.Text),
                                edEnvioOP.Text, 'Otros Pagos.', edRazonSocialOP.Text, '', '', dcFechaLiqOP.Date,
                                dcFechaFacOP.Date, 0, 0, vSecPrestador, fraBancoOP.Value,
                                ComBanco, 0, 0, 0, 0, 0, 0, 0, 0, False, False, False, False, False, False);
        end
        else if (Accion = l_Edicion) then
        begin
          with tReciboOP do
            sSql := ' UPDATE spr_pagoexpesin ' +
                       ' SET pr_fechapago = ' + SqlDate(dcFechaLiqOP.Date) + ',' +
                           ' pr_conpago = ' + SqlValue(fraConPagoOP.Codigo) + ',' +
                           ' pr_acreedor = ' + SqlValue(fraTipoAcreedOP.Codigo) + ',' +
                           ' pr_cuitcuil = ' +  IIF(edDNIOP.Visible, SqlValue(edDNIOP.Text), SqlValue(edCuitOP.Text)) + ',' +
                           ' pr_letrafac = ' +  SqlValue(edLetraFacOP.Text) + ',' +
                           ' pr_situfac = ' + SqlValue(edSituFacOP.Text) + ',' +
                           ' pr_numfac = '  + SqlValue(edNumFacOP.Text) + ',' +
                           ' pr_fechafac = ' + SqlDate(dcFechaFacOP.Date) + ',' +
                           ' pr_imporpago = ' + SqlNumber(edSinRetGanOP.Value + edConRetGanOP.Value, True) + ',' +
                           ' pr_importeconretencion = ' + SqlNumber(edConRetGanOP.Value) + ',' +
                           ' pr_formapago = '  + SqlString(GetFormaPago, True, True) + ',' +
                           ' pr_ctagasto = ' + SqlValue(edNroCuentaOP.Text) + ',' +
                           ' pr_comentario = ' + SqlValue(edObsOP.Lines.Text) + ',' +
                           ' pr_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                           ' pr_fmodif = Actualdate, ' +
                           ' pr_hmodif = TO_CHAR(SYSDATE, ''hh:mi''), ' +
                           ' pr_estado = ''M'', ' +
                           ' pr_prestadorsecuencia = ' + SqlInt(vSecPrestador) + ',' +
                           ' pr_prestadormutual = ' + SqlValue(sSecMutual) + ',' +
                           ' pr_pagojudicial = ' + IIF(chkPagoJudOP.Checked, '''S''', '''N''') + ',' +
                           ' pr_delegacion = ' + SqlValue(fraDelegOP.Codigo) + ',' +
                           ' pr_cai = ' + SqlValue(Trim(edCAIOP.Text)) + ',' +
                           ' pr_metodopago = ' + SqlValue(fraMetodoPagoOP.Codigo) + ',' +
                           ' pr_enviofondos = ' + SqlValue(edEnvioOP.Text) + ',' +
                           ' pr_idbanco = ' + SqlInt(fraBancoOP.Value, True) + ',' +
                           ' pr_rcalle = ' + SqlValue(Calle) + ',' +
                           ' pr_rnumero = ' + SqlValue(Numero) + ',' +
                           ' pr_rpiso = ' + SqlValue(Piso) + ',' +
                           ' pr_rdepartamento = ' + SqlValue(Departamento) + ',' +
                           ' pr_rcpostal = ' + SqlValue(CodigoPostal) + ',' +
                           ' pr_rlocalidad = ' + SqlValue(Localidad) + ',' +
                           ' pr_rprovincia = ' + SqlInt(Prov, True) +
                     ' WHERE pr_siniestro = ' + SqlInt(vSiniestro) +
                       ' AND pr_orden = ' + SqlInt(vOrden) +
                       ' AND pr_recaida = ' + SqlInt(vRecaida) +
                       ' AND pr_numpago = ' + SqlInt(vNumLiq);
          EjecutarSqlST(sSql);
          MsgBox('Modificación efectuada correctamente', MB_ICONINFORMATION);
        end;
        CommitTrans;
        DoCargarLiquidaciones(False);
      end
      else
        Rollback;
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  finally
    Free;
  end;
  Accion := l_None;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.ValidarOPagos :Boolean;
var
  sSql, sRetGan, sMetodo :String;
  dFecha :TDate;
begin
  Verificar(dcFechaLiqOP.IsEmpty, dcFechaLiqOP, 'Debe ingresar la fecha de liquidación.');
  Verificar(fraTipoAcreedOP.IsEmpty, fraTipoAcreedOP, 'Debe ingresar el tipo de acreedor.');
  Verificar(edDNIOP.Visible and (Trim(edDNIOP.Text) = ''), edDNIOP, 'No se ha cargado el DNI del beneficiario.');
  Verificar(not(edDNIOP.Visible) and ((Length(edCuitOP.Text) <> 11) or not(IsCuit(edCuitOP.Text))),
            edCuitOP, 'Debe ingresar el CUIT o CUIL del acreedor.');
  Verificar((sdqBusqueda.FieldByName('ex_gravedad').AsString = '5') and (fraTipoAcreedOP.Codigo = 'TA'),
            fraTipoAcreedOP, 'Para un siniestro mortal no se puede seleccionar el Trabajador Afiliado.');

  if AreIn(sTipoAcr, ['CA','OA','PA']) then
  begin
    if (Accion = l_Edicion) then
      dFecha := ValorSqlDateTimeEx('SELECT pr_fechalta ' +
                                    ' FROM spr_pagoexpesin ' +
                                   ' WHERE pr_siniestro = :sin ' +
                                     ' AND pr_orden = :ord ' +
                                     ' AND pr_recaida = :reca ' +
                                     ' AND pr_numpago = :liq', [vSiniestro, vOrden, vRecaida, vNumLiq])
    else
      dFecha := DBDate;

    if (sTipoAcr = 'CA') then
      sSql := 'SELECT 1 FROM cpr_prestador ' +
              ' WHERE ca_clave = ' + SqlValue(edCuitOP.Text) +
                ' AND ca_secuencia = ' + SqlInt(vSecPrestador, True) +
                ' AND ca_prestadormutual = ' + SqlValue(sSecMutual) +
                ' AND (ca_fechabaja IS NULL ' +
                 ' OR ca_fechabaja > ' + SqlDate(dFecha) + ')'
    else
      sSql := 'SELECT 1 FROM spa_pagoacre ' +
              ' WHERE pa_cuitcuil =  ' + SqlValue(edCuitOP.Text) +
                ' AND (pa_fechabaja IS NULL ' +
                 ' OR pa_fechabaja > ' + SqlDate(dFecha) + ')';

    Verificar(not(ExisteSql(sSql)), edRazonSocialOP, 'El acreedor se encuentra dado de baja');
  end;
  //valido delegacion
  Verificar((sTipoAcr = 'DI') and fraDelegOP.IsEmpty, fraDelegOP, 'Debe ingresar la delegación');

  //valido forma de pago
  Verificar(fraMetodoPagoOP.IsEmpty, fraMetodoPagoOP, 'Debe seleccionar la forma de pago.');

  sMetodo := fraMetodoPagoOP.Codigo;

  Verificar(AreIn(sMetodo, ['GI', 'TR', 'DC']) and fraBancoOP.IsEmpty, fraBancoOP,
            'Para esta forma de pago, debe seleccionar el Banco.');
  if not(AreIn(sMetodo, ['GI', 'TR', 'DC'])) then
    OnMetodoPagoOPChange(Nil);

  Verificar(((sMetodo = 'PE') and (sTipoAcr = 'PA')) or
            (not(AreIn(sTipoAcr, ['BE', 'TA', 'EM', 'OA', 'FF'])) and AreIn(sMetodo, ['TR', 'DC'])),
            fraMetodoPagoOP, 'La forma de pago no es compatible con el tipo de acreedor.');

  //valido concepto de pago
  Verificar(fraConPagoOP.IsEmpty, fraConPagoOP, 'Debe ingresar el concepto de pago');

  sSql := 'SELECT 1 FROM scp_conpago ' +
          ' WHERE cp_conpago = :Con ';
  if AreIn(sTipoAcr, ['EM', 'DI', 'TA', 'BE', 'FF']) then
    sSql := sSql + ' AND ((cp_tipo IN (''O'', ''E'')) ' +
                     ' OR (cp_altamanual = ''S'')) '
  else if AreIn(sTipoAcr, ['OA', 'PA']) then
    sSql := sSql + ' AND ((cp_tipo = ''O'') ' +
                     ' OR (cp_altamanual = ''S'')) '
  else
    sSql := sSql + ' AND cp_tipo = ''XXX'' ';
  Verificar(not(ExisteSqlEx(sSql, [fraConPagoOP.Codigo])), fraConPagoOP, 'El concepto de pago es inválido.');

  Verificar((fraConPagoOP.sdqDatos.FieldByName('cp_otropagomortal').AsString = 'S') and
            (sdqBusqueda.FieldByName('ex_gravedad').AsString <> '5'), fraConPagoOP,
            'El siniestro no ha sido registrado como mortal.');

  //valido la cuenta relacionada
  Verificar(AreIn(sTipoAcr, ['TA', 'EM', 'OA', 'BE', 'FF']) and (sMetodo = 'DC') and
            not ValidarCuentaOP, edRazonSocialOP, 'El acreedor no posee una cuenta cargada ó ' +  #13 +
                                                  'la cuenta no está relacionada con el concepto de pago.');

  Verificar(((sMetodo = 'DC') or (sMetodo = 'PE')) and (not ValidarCuentaOP_CBU_Autoriz), fraTipoAcreedOP, 'El CBU de la cuenta bancaria no esta cargado o bien no ha sido autorizado.' );   // TK 54975

  Verificar((Trim(edLetraFacOP.Text) = ''), edLetraFacOP, 'Debe ingresar el tipo de factura.');
  Verificar((Trim(edSituFacOP.Text) = ''), edSituFacOP, 'Debe ingresar el código de factura.');
  Verificar((Trim(edNumFacOP.Text) = ''), edNumFacOP, 'Debe ingresar el número de factura.');
  Verificar(dcFechaFacOP.IsEmpty, dcFechaFacOP, 'Debe ingresar la fecha de factura.');
  Verificar(dcFechaFacOP.Date > DBDate, dcFechaFacOP, 'La fecha de factura no puede ser posterior al día de hoy.');  
  Verificar(edSinRetGanOP.Value < 0, edSinRetGanOP, 'El importe no puede ser menor que 0.');
  Verificar(edConRetGanOP.Value < 0, edConRetGanOP, 'El importe no puede ser menor que 0.');  
  Verificar((edSinRetGanOP.Value + edConRetGanOP.Value) = 0, edSinRetGanOP,
            'El importe de la liquidación debe ser distinto de cero');

  //valido que si el acreedor no retiene ganancias, no ingrese el importe con retención
  if (sTipoAcr ='OA') or (sTipoAcr ='PA') then
  begin
    sSql := 'SELECT pa_retganancias ' +
             ' FROM spa_pagoacre ' +
            ' WHERE pa_cuitcuil = :cuit ';
    sRetGan := ValorSqlEx(sSql, [edCuitOP.Text]);
    Verificar((sRetGan = ''), edCuitOP,
              'El acreedor seleccionado no dispone del tipo de retención de ganancias.');
    Verificar((sRetGan = '99') and (edConRetGanOP.Value <> 0), edConRetGanOP,
              'El acreedor seleccionado no retiene ganancias, de modo que el importe sujeto a retención debe ser igual a 0.');
  end;

  Verificar((Trim(edCAIOP.Text) <> '') and (InStr(Trim(edCAIOP.Text), ' ') > 0), edCAIOP, 'El CAI es inválido.');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.OnTipoAcreedOPChange(Sender: TObject);
begin
  sTipoAcr := fraTipoAcreedOP.Codigo;

  if AreIn(sTipoAcr, ['EM','FF']) then
  begin
    lblRSocialOP.Caption  := 'Razón social';
    lblCuitOP.Caption     := 'CUIT';
    edRazonSocialOP.Text  := fraEmpresa.cmbRSocial.Text;
    edCuitOP.Text         := fraEmpresa.CUIT;
    edDNIOP.Visible       := False;
  end
  else if (sTipoAcr ='DI') then
  begin
    lblRSocialOP.Caption  := 'Razón social';
    lblCuitOP.Caption     := 'CUIT';
    edRazonSocialOP.Text  := ValorSqlEx('SELECT mp_nombre FROM cmp_empresas ' +
                                        ' WHERE mp_cuit = :cuit ', [GERENCIAR_CUIT]);
    edCuitOP.Text         := GERENCIAR_CUIT;
    edDNIOP.Visible       := False;
  end
  else if (sTipoAcr = 'CA') then
  begin
    lblRSocialOP.Caption  := 'Centro asist.';
    lblCuitOP.Caption     := 'CUIT';
    edRazonSocialOP.Text  := '';
    edCuitOP.Text         := '';
    edDNIOP.Visible       := False;
  end
  else if AreIn(sTipoAcr, ['OA','PA']) then
  begin
    lblRSocialOP.Caption  := 'Acreedor';
    lblCuitOP.Caption     := 'CUIT o CUIL';
    edRazonSocialOP.Text  := '';
    edCuitOP.Text         := '';
    edDNIOP.Visible       := False;
  end
  else if (sTipoAcr = 'TA') then
  begin
    lblRSocialOP.Caption  := 'Apellido nom.';
    lblCuitOP.Caption     := 'CUIL';
    edRazonSocialOP.Text  := fraTrabajadorSIN.Nombre;
    edCuitOP.Text         := fraTrabajadorSIN.CUIL;
    edDNIOP.Visible       := False;
  end
  else if (sTipoAcr = 'BE') then
  begin
    lblRSocialOP.Caption  := 'Apellido nom.';
    lblCuitOP.Caption     := 'DNI';
    edRazonSocialOP.Text  := '';
    edDNIOP.Text          := '';
    edDNIOP.Visible       := True;
  end;
  DoHabilitarCuit;
  vSecPrestador := 0;
  sSecMutual    := '';
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edRazonSocialOPDropDown(Sender: TObject);
begin
  Verificar(fraTipoAcreedOP.IsEmpty, fraTipoAcreedOP, 'Primero debe indicar un tipo de acreeedor');
  SetSqlRSocialOP;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarCuit;
begin
  edCuitOP.Enabled := edRazonSocialOP.Enabled and
                      not(fraTipoAcreedOP.IsEmpty) and
                      not(AreIn(fraTipoAcreedOP.Codigo, ['EM', 'TA', 'DI', 'FF']));
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edRazonSocialOPCloseUp(Sender: TObject);
begin
  inherited;
  if edDNIOP.Visible then
    edDNIOP.Text := sdqRSocialOP.FieldByName('CUITCUIL').AsString
  else
    edCuitOP.Text := sdqRSocialOP.FieldByName('CUITCUIL').AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraConPagoOPPropiedadesChange(Sender: TObject);
begin
  if fraConPagoOP.IsSelected and (Accion <> l_None) and
     (fraConPagoOP.sdqDatos.FieldByname('CP_BLOQUEOMANUAL').AsString = 'S') then
     fraConPagoOP.Clear;
  if fraConPagoOP.IsSelected then
    edNroCuentaOP.Text := fraConPagoOP.sdqDatos.FieldByname('CP_CTAPAGO').AsString;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.udDiasILPChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := ConfirmaCancelar;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbModificarClick(Sender: TObject);
begin
  if HayRegistroActivo then
    // no se permite edicion de ILT ni de ILP
    case PageControl.ActivePageIndex of

      ctsILP : DoModifILP;     // Plan Reliquidaciones Automaticas
      ctsILT : DoModifILT;     // Plan Reliquidaciones Automaticas  (ILT PD)

      ctsOPagos    : DoModifOPagos;
      ctsDatosEcon : DoModifDatosEconomicos;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoModifOPagos;
const
  sLeyendaValid = 'No se puede realizar la modificación: ' + #13#10;
var
  bHabilitar: Boolean;
begin
  bHabilitar := not(AreIn(sdqOPagos.FieldByName('pr_estado').AsString, ['E','A','X','Z']));

  if bHabilitar then
  begin
    Accion  := l_Edicion;
    vNumLiq := sdqOPagos.FieldByName('pr_numpago').AsInteger;
    DoHabilitarOPagos(True);
    DoHabilitarAlta(True);
  end;

  if (sdqOPagos.FieldByName('pr_estado').AsString = 'E') then     // Plan Reliquidaciones Automaticas
  begin
    if (Seguridad.Claves.IsActive('Modificar_LiquidacionesAprobadas')) then
    begin
      if not LiqPoseeChequeGenerado_OPagos then
        Msgbox(sLeyendaValid + 'La liquidación no posee un cheque generado.')
      else if LiqExisteEnCircuitoOP_OPagos then
        Msgbox(sLeyendaValid + 'La liquidación ya se encuentra incluida en el proceso de cambio de Orden de Pago.')
      else begin
        Accion := l_Reliquidacion;
        DoHabilitarOpagos_Reliq(True);
      end;
    end;
  end;

end;


function TfrmLiqIncapacidades.LiqPoseeChequeGenerado_OPagos: Boolean;     // Plan Reliquidaciones Automáticas
begin
  Result := not sdqOPagos.FieldByName('IDCHEQUEEMITIDO').IsNull;
end;

function TfrmLiqIncapacidades.LiqExisteEnCircuitoOP_OPagos: Boolean;
var sSql: string;
begin
  sSql := 'SELECT 1 ' +
            ' FROM din.dml_modifliquidacion ' +
           ' WHERE ml_fechabaja is null ' +
             ' AND ml_idexpediente = :idexp ' +
             ' AND ml_numliqui = :numliq ' +
             ' AND ml_tablaliqui = ''SPR'' ';
  Result := ExisteSqlEx(sSql, [sdqOPagos.FieldByName('PR_IDEXPEDIENTE').AsInteger, sdqOPagos.FieldByName('NRO').AsInteger]);
end;

procedure TfrmLiqIncapacidades.DoHabilitarOPagos_Reliq(vHabilitar: boolean);
begin
  LockControls([fraMetodoPagoOP, fraBancoOP, edEnvioOP, edRecibosOP], not vHabilitar);

  btnEnvioOP.Enabled   := vHabilitar;
  btnRecibosOP.Enabled := vHabilitar;
  tbGuardar.Enabled     := Seguridad.Activar(tbGuardar) and vHabilitar;
  tbCancelar.Enabled    := vHabilitar;
end;

procedure TfrmLiqIncapacidades.DoGrabarOPagos_Reliquidacion(iSiniestro, iOrden, iRecaida: integer);
var sSql: string;
begin
  if ValidarOPagos then
  begin
    Try
      BeginTrans;

      sSql := ' INSERT into din.dml_modifliquidacion ' +
                ' (ml_idexpediente, ml_numliqui, ml_tablaliqui, ml_metodopago, ml_idbanco, ' +
                 ' ml_enviofondos,  ' +
                 ' ml_rcalle, ml_rnumero, ml_rpiso, ml_rdepartamento, ml_rcpostal, ml_rlocalidad, ml_rprovincia, ' +
                 ' ml_idchequeoriginal, ' +
                 ' ml_usualta, ml_fechaalta, ' +

                 ' ml_metodopagoorig, ml_idbancoorig, ml_enviofondosorig, ml_rcalleorig, ml_rnumeroorig, ml_rpisoorig, ml_rdepartamentoorig, ' +
                 ' ml_rcpostalorig, ml_rlocalidadorig, ml_rprovinciaorig ' + ') ' +
              ' VALUES ' +
              '(' + SqlInt(sdqOPagos.FieldByName('pr_idexpediente').AsInteger) + ','
                  + SqlInt(sdqOPagos.FieldByName('NRO').AsInteger) +
                  ', ''SPR'', ' +
                  SqlValue(fraMetodoPagoOP.Codigo) + ',' +
                  SqlInt(fraBancoOP.Value, True) + ',' +
                  SqlValue(edEnvioOP.Text) + ',' +

                  SqlValue(tReciboOP.Calle)  + ',' +
                  SqlValue(tReciboOP.Numero) + ',' +
                  SqlValue(tReciboOP.Piso)   + ',' +
                  SqlValue(tReciboOP.Departamento) + ',' +
                  SqlValue(tReciboOP.CodigoPostal) + ',' +
                  SqlValue(tReciboOP.Localidad) + ',' +
                  SqlInt(tReciboOP.Prov, True)  + ',' +
                  SqlInt(sdqOPagos.FieldByName('idchequeemitido').AsInteger) + ',' +
                  SqlValue(Sesion.UserID) + ',' +
                  ' art.actualdate, ' +

                  SqlValue(sdqOPagos.FieldByName('pr_metodopago').AsString)    + ', ' +
                  SqlInt(sdqOPagos.FieldByName('pr_idbanco').AsInteger, true)  + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_enviofondos').AsString)   + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_rcalle').AsString)        + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_rnumero').AsString)       + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_rpiso').AsString)         + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_rdepartamento').AsString) + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_rcpostal').AsString)      + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_rlocalidad').AsString)    + ', ' +
                  SqlValue(sdqOPagos.FieldByName('pr_rprovincia').AsString)    + ') ';

      EjecutarSqlST(sSql);
      CommitTrans;
      DoHabilitarOPagos_Reliq(False);
      Msgbox('Modificación efectuada correctamente. El caso pasará a ser parte del circuito de cambio de Orden de Pago, para que sea autorizado.');
      DoCargarLiquidaciones(True);  // Esto lo pongo porque no refresca bien la pantalla despues de guardar
    Except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  end;

end;




{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoModifILP;                                // Plan Reliquidaciones Automáticas
const sLeyendaValid = 'No se puede realizar la modificación: ' + #13#10;
begin
  if (sdqILP.FieldByName('LE_ESTADO').AsString = 'E') and
     not AreIn(sdqILP.FieldByName('LE_TIPOLIQUI').AsString, ['W', 'X', 'Y', 'Z']) and
     (Seguridad.Claves.IsActive('Modificar_LiquidacionesAprobadas')) then
  begin
     if not LiqPoseeChequeGenerado_ILP then
       Msgbox(sLeyendaValid + 'La liquidación no posee un cheque generado.')
     else if LiqExisteEnCircuitoOP_ILP then
       Msgbox(sLeyendaValid + 'La liquidación ya se encuentra incluida en el proceso de cambio de Orden de Pago.')
     else begin
       Accion := l_Reliquidacion;
       DoHabilitarILP_Reliq(True);
     end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.LiqExisteEnCircuitoOP_ILP: Boolean;         // Plan Reliquidaciones Automáticas
var sSql: string;
begin
   sSql := 'SELECT 1 ' +
            ' FROM din.dml_modifliquidacion ' +
           ' WHERE ml_fechabaja is null ' +
             ' AND ml_idexpediente = :idexp ' +
             ' AND ml_numliqui = :numliq ' +
             ' AND ml_tablaliqui = ''SLE'' ';
  Result := ExisteSqlEx(sSql, [sdqILP.FieldByName('LE_IDEXPEDIENTE').AsInteger, sdqILP.FieldByName('NRO').AsInteger]);
end;

{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.LiqPoseeChequeGenerado_ILP: Boolean;         // Plan Reliquidaciones Automáticas
begin
   Result := not sdqILP.FieldByName('IDCHEQUEEMITIDO').IsNull;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarILP_Reliq(vHabilitar: boolean);   // Plan Reliquidaciones Automáticas
begin
  LockControls([fraDelegacionILP, fraMetodoPagoILP, fraBancoILP, edEnvioILP, edChequeNombreILP, edRecibosILP], not vHabilitar);

  btnEnvioILP.Enabled   := vHabilitar;
  btnRecibosILP.Enabled := vHabilitar;
  tbGuardar.Enabled     := Seguridad.Activar(tbGuardar) and vHabilitar;
  tbCancelar.Enabled    := vHabilitar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarILP_Reliquidacion(ObjILP: TILP; iSiniestro, iOrden, iRecaida: integer);    // Plan Reliquidaciones Automáticas
var sSql, sProv: string;
begin
  if (ObjILP.Error <> '') then
  begin
    MsgBox('No se puede modificar la liquidación: ' + ObjILP.Error, MB_ICONEXCLAMATION + MB_OK);
    DoHabilitarILP_Reliq(False);
    DoCargarLiquidaciones(True);
  end
  else begin
    Try
      BeginTrans;

      if ObjILP.ProvRec < 0 then
        sProv := ''
      else
        sProv := IntToStr(ObjILP.ProvRec);

      sSql := ' INSERT into din.dml_modifliquidacion ' +
                ' (ml_idexpediente, ml_numliqui, ml_tablaliqui, ml_metodopago, ml_idbanco, ' +
                 ' ml_enviofondos, ml_tipoenviofondos, ml_idenviofondos, ml_chequenombre, ' +
                 ' ml_recibos, ml_idchequeoriginal, ml_delegacion, ml_tipoliqui, ' +
                 ' ml_usualta, ml_fechaalta, ' +
                 ' ml_rchkdomicilio, ml_rchkotro, ml_rcalle, ml_rnumero, ml_rpiso, ml_rdepartamento, ml_rcpostal, ml_rlocalidad, ml_rprovincia, ml_rotro, ' +

                 ' ml_metodopagoorig, ml_idbancoorig, ml_enviofondosorig, ml_tipoenviofondosorig, ' +
                 ' ml_idenviofondosorig, ml_chequenombreorig, ml_recibosorig, ml_rcalleorig, ' +
                 ' ml_rnumeroorig, ml_rpisoorig, ml_rdepartamentoorig, ml_rcpostalorig, ' +
                 ' ml_rlocalidadorig, ml_rprovinciaorig, ml_rchkdomicilioorig, ml_rchkotroorig, ' +
                 ' ml_rotroorig, ml_delegacionorig ' +
                 ' ) ' +
              ' VALUES ' +
              '(' + SqlInt(ObjILP.Expediente.Id) + ',' + SqlInt(ObjILP.NroLiquidacion) + ', ''SLE'', ' + SqlValue(ObjILP.MetodoPago) + ',' + SqlInt(ObjILP.IdBanco) + ',' +
              SqlValue(ObjILP.EnvioFondos) + ',' + SqlValue(ObjILP.TipoFondos) + ',' + SqlInt(ObjILP.CodigoFondos) + ',' + SqlValue(ObjILP.ANombreDe) + ',' +
              SqlValue(ObjILP.Recibos) + ',' + SqlInt(sdqILP.FieldByName('idchequeemitido').AsInteger) + ',' + SqlValue(ObjILP.Delegacion) + ',' + SqlValue(ObjILP.Tipo) + ',' +
              SqlValue(Sesion.UserID) + ', art.actualdate, ' +
              Iif(ObjILP.ChkDomicilioRec, '''S''', '''N''') + ',' +  Iif(ObjILP.ChkOtroRec, '''S''', '''N''') + ',' +
              SqlValue(ObjILP.CalleRec) + ',' +  SqlValue(ObjILP.NumeroRec) + ',' + SqlValue(ObjILP.PisoRec) + ',' + SqlValue(ObjILP.DepartamentoRec) + ',' +
              SqlValue(ObjILP.CodigoPostalRec) + ',' + SqlValue(ObjILP.LocalidadRec) + ',' +  SqlValue(sProv) + ',' + SqlValue(ObjILP.OtroRec) + ',' +

              SqlValue(sdqILP.FieldByName('le_metodopago').AsString)    + ',' + SqlInt(sdqILP.FieldByName('le_idbanco').AsInteger)          + ',' +
              SqlValue(sdqILP.FieldByName('le_enviofondos').AsString)   + ',' + SqlValue(sdqILP.FieldByName('le_tipoenviofondos').AsString) + ',' +
              SqlInt(sdqILP.FieldByName('le_idenviofondos').AsInteger)  + ',' + SqlValue(sdqILP.FieldByName('CHEQUE_A_NOMBRE').AsString)    + ',' +
              SqlValue(sdqILP.FieldByName('le_recibos').AsString)       + ',' + SqlValue(sdqILP.FieldByName('le_rcalle').AsString)          + ',' +
              SqlValue(sdqILP.FieldByName('le_rnumero').AsString)       + ',' + SqlValue(sdqILP.FieldByName('le_rpiso').AsString)           + ',' +
              SqlValue(sdqILP.FieldByName('le_rdepartamento').AsString) + ',' + SqlValue(sdqILP.FieldByName('le_rcpostal').AsString)        + ',' +
              SqlValue(sdqILP.FieldByName('le_rlocalidad').AsString)    + ',' + SqlValue(sdqILP.FieldByName('le_rprovincia').AsString)      + ',' +
              SqlValue(sdqILP.FieldByName('le_rchkdomicilio').AsString) + ',' + SqlValue(sdqILP.FieldByName('le_rchkotro').AsString)        + ',' +
              SqlValue(sdqILP.FieldByName('le_rotro').AsString)         + ',' + SqlValue(sdqILP.FieldByName('DELEGACION').AsString)         +
              ')';

      EjecutarSqlST(sSql);
      CommitTrans;
      DoHabilitarILP_Reliq(False);
      Msgbox('Modificación efectuada correctamente. El caso pasará a ser parte del circuito de cambio de Orden de Pago, para que sea autorizado.');
      DoCargarLiquidaciones(True);
    Except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoModifILT;                          // Plan Reliquidaciones Automáticas  (ILT PD)
const sLeyendaValid = 'No se puede realizar la modificación: ' + #13#10;
begin
  if (sdqILT.FieldByName('LE_ESTADO').AsString = 'E') and
     (sdqILT.FieldByName('LE_TIPOLIQUI').AsString = 'D') and   // Pago Directo
     not AreIn(sdqILT.FieldByName('LE_TIPOLIQUI').AsString, ['W', 'X', 'Y', 'Z']) and
     (Seguridad.Claves.IsActive('Modificar_LiquidacionesAprobadas')) then
  begin
     if not LiqPoseeChequeGenerado_ILT then
       Msgbox(sLeyendaValid + 'La liquidación no posee un cheque generado.')
     else if LiqExisteEnCircuitoOP_ILT then
       Msgbox(sLeyendaValid + 'La liquidación ya se encuentra incluida en el proceso de cambio de Orden de Pago.')
     else begin
       Accion := l_Reliquidacion;
       DoHabilitarILT_Reliq(True);
     end;
  end;
end;


function TfrmLiqIncapacidades.LiqPoseeChequeGenerado_ILT: Boolean;
begin
  Result := not sdqILT.FieldByName('IDCHEQUEEMITIDO').IsNull;
end;

function TfrmLiqIncapacidades.LiqExisteEnCircuitoOP_ILT: Boolean;
var sSql: string;
begin
  sSql := 'SELECT 1 ' +
            ' FROM din.dml_modifliquidacion ' +
           ' WHERE ml_fechabaja is null ' +
             ' AND ml_idexpediente = :idexp ' +
             ' AND ml_numliqui = :numliq ' +
             ' AND ml_tablaliqui = ''SLE'' ';
  Result := ExisteSqlEx(sSql, [sdqILT.FieldByName('LE_IDEXPEDIENTE').AsInteger, sdqILT.FieldByName('NRO').AsInteger]);
end;

procedure TfrmLiqIncapacidades.DoHabilitarILT_Reliq(vHabilitar: boolean);
begin
  LockControls([fraDelegacionILT, fraMetodoPagoILT, fraBancoILT, edEnvioILT, edChequeNombreILT, edRecibosILT], not vHabilitar);

  btnEnvioILT.Enabled   := vHabilitar;
  btnRecibosILT.Enabled := vHabilitar;
  tbGuardar.Enabled     := Seguridad.Activar(tbGuardar) and vHabilitar;
  tbCancelar.Enabled    := vHabilitar;
end;

procedure TfrmLiqIncapacidades.DoGrabarILT_Reliquidacion(ObjILT: TILT; iSiniestro, iOrden, iRecaida: integer);
var sSql, sProv: string;
begin
  if (ObjILT.Error <> '') then
  begin
    MsgBox('No se puede modificar la liquidación: ' + ObjILT.Error, MB_ICONEXCLAMATION + MB_OK);
    DoHabilitarILT_Reliq(False);
    DoCargarLiquidaciones(True);
  end
  else begin
    Try
      if ObjILT.ProvRec < 0 then
        sProv := ''
      else
        sProv := IntToStr(ObjILT.ProvRec);

      BeginTrans;
      sSql := ' INSERT into din.dml_modifliquidacion ' +
                ' (ml_idexpediente, ml_numliqui, ml_tablaliqui, ml_metodopago, ml_idbanco, ' +
                 ' ml_enviofondos, ml_tipoenviofondos, ml_idenviofondos, ml_chequenombre, ' +
                 ' ml_recibos, ml_idchequeoriginal, ml_delegacion, ml_tipoliqui, ' +
                 ' ml_usualta, ml_fechaalta, ' +
                 ' ml_rchkdomicilio, ml_rchkotro, ml_rcalle, ml_rnumero, ml_rpiso, ml_rdepartamento, ml_rcpostal, ml_rlocalidad, ml_rprovincia, ml_rotro, ' +

                 ' ml_metodopagoorig, ml_idbancoorig, ml_enviofondosorig, ml_tipoenviofondosorig, ' +
                 ' ml_idenviofondosorig, ml_chequenombreorig, ml_recibosorig, ml_rcalleorig, ' +
                 ' ml_rnumeroorig, ml_rpisoorig, ml_rdepartamentoorig, ml_rcpostalorig, ' +
                 ' ml_rlocalidadorig, ml_rprovinciaorig, ml_rchkdomicilioorig, ml_rchkotroorig, ' +
                 ' ml_rotroorig, ml_delegacionorig ' +
                 ' ) ' +
              ' VALUES ' +
              '(' + SqlInt(ObjILT.Expediente.Id) + ',' + SqlInt(ObjILT.NroLiquidacion) + ', ''SLE'', ' + SqlValue(ObjILT.MetodoPago) + ',' + SqlInt(ObjILT.IdBanco) + ',' +
              SqlValue(ObjILT.EnvioFondos) + ',' + SqlValue(ObjILT.TipoFondos) + ',' + SqlInt(ObjILT.CodigoFondos) + ',' + SqlValue(ObjILT.ANombreDe) + ',' +
              SqlValue(ObjILT.Recibos) + ',' + SqlInt(sdqILT.FieldByName('idchequeemitido').AsInteger) + ',' + SqlValue(ObjILT.Delegacion) + ',' + SqlValue(ObjILT.Tipo) + ',' +
              SqlValue(Sesion.UserID) + ', art.actualdate, ' +
              Iif(ObjILT.ChkDomicilioRec, '''S''', '''N''') + ',' +  Iif(ObjILT.ChkOtroRec, '''S''', '''N''') + ',' +
              SqlValue(ObjILT.CalleRec) + ',' +  SqlValue(ObjILT.NumeroRec) + ',' + SqlValue(ObjILT.PisoRec) + ',' + SqlValue(ObjILT.DepartamentoRec) + ',' +
              SqlValue(ObjILT.CodigoPostalRec) + ',' + SqlValue(ObjILT.LocalidadRec) + ',' + SqlValue(sProv) + ',' + SqlValue(ObjILT.OtroRec) + ',' +

              SqlValue(sdqILT.FieldByName('le_metodopago').AsString)    + ',' + SqlInt(sdqILT.FieldByName('le_idbanco').AsInteger)          + ',' +
              SqlValue(sdqILT.FieldByName('le_enviofondos').AsString)   + ',' + SqlValue(sdqILT.FieldByName('le_tipoenviofondos').AsString) + ',' +
              SqlInt(sdqILT.FieldByName('le_idenviofondos').AsInteger)  + ',' + SqlValue(sdqILT.FieldByName('CHEQUE_A_NOMBRE').AsString)    + ',' +
              SqlValue(sdqILT.FieldByName('le_recibos').AsString)       + ',' + SqlValue(sdqILT.FieldByName('le_rcalle').AsString)          + ',' +
              SqlValue(sdqILT.FieldByName('le_rnumero').AsString)       + ',' + SqlValue(sdqILT.FieldByName('le_rpiso').AsString)           + ',' +
              SqlValue(sdqILT.FieldByName('le_rdepartamento').AsString) + ',' + SqlValue(sdqILT.FieldByName('le_rcpostal').AsString)        + ',' +
              SqlValue(sdqILT.FieldByName('le_rlocalidad').AsString)    + ',' + SqlValue(sdqILT.FieldByName('le_rprovincia').AsString)      + ',' +
              SqlValue(sdqILT.FieldByName('le_rchkdomicilio').AsString) + ',' + SqlValue(sdqILT.FieldByName('le_rchkotro').AsString)        + ',' +
              SqlValue(sdqILT.FieldByName('le_rotro').AsString)         + ',' + SqlValue(sdqILT.FieldByName('DELEGACION').AsString)         + ')';

      EjecutarSqlST(sSql);
      CommitTrans;
      DoHabilitarILT_Reliq(False);
      Msgbox('Modificación efectuada correctamente. El caso pasará a ser parte del circuito de cambio de Orden de Pago, para que sea autorizado.');
      DoCargarLiquidaciones(True);
    Except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  end;
end;


{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.GetFormapago :String;
begin
  if (sTipoAcr = 'OA') or (sTipoAcr = 'PA') then
    Result := ValorSqlEx('SELECT pa_formacobro ' +
                          ' FROM spa_pagoacre ' +
                         ' WHERE pa_cuitcuil = :cuit ', [edCuitOP.Text])
  else
    Result := '';
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SetSqlRSocialOP;
var
  sSql :String;
begin
  if AreIn(sTipoAcr, ['EM', 'FF'])  then
    sSql := 'SELECT mp_cuit cuitcuil, mp_nombre denominacion, mp_localidad localidad ' +
             ' FROM cmp_empresas ' +
            ' WHERE mp_cuit = ' + SqlValue(edCuitOP.Text)
  else if (sTipoAcr ='OA') or (sTipoAcr ='PA') then
    if edCuitOP.Text <> '' then
      sSql := 'SELECT pa_cuitcuil cuitcuil, pa_denomina denominacion, pa_localidad localidad ' +
               ' FROM spa_pagoacre ' +
              ' WHERE pa_cuitcuil = ' + SqlValue(edCuitOP.Text) +
                ' AND pa_acreedor = ' + SqlValue(fraTipoAcreedOP.Codigo) +
                ' AND pa_fechabaja IS NULL'
    else
      sSql := 'SELECT pa_cuitcuil cuitcuil, pa_denomina denominacion, pa_localidad localidad ' +
               ' FROM spa_pagoacre ' +
              ' WHERE upper(pa_denomina) like ''' + edRazonSocialOP.Text + '%''' +
                ' AND pa_acreedor = ' + SqlValue(fraTipoAcreedOP.Codigo) +
                ' AND pa_fechabaja IS NULL ' +
              ' ORDER BY pa_denomina'
  else if (sTipoAcr ='TA') then
    sSql := 'SELECT tj_cuil cuitcuil, tj_nombre denominacion, tj_localidad localidad ' +
             ' FROM ctj_trabajador ' +
            ' WHERE tj_cuil = ' + SqlValue(edCuitOP.Text)
  else if (sTipoAcr ='DI') then
    sSql := 'SELECT mp_cuit cuitcuil, mp_nombre denominacion, mp_localidad localidad ' +
             ' FROM cmp_empresas ' +
            ' WHERE mp_cuit = ' + SqlValue(GERENCIAR_CUIT)
  else if (sTipoAcr = 'BE') then
    sSql := 'SELECT eb_documento cuitcuil, eb_nombre denominacion, eb_localidad localidad ' +
             ' FROM seb_beneficiarios ' +
            ' WHERE eb_siniestro = ' + SqlInt(vSiniestro) +
              ' AND eb_orden = ' + SqlInt(vOrden) +
              ' AND eb_recaida = ' + SqlInt(vRecaida) +
              ' AND eb_fechabaja IS NULL ' +
              ' AND ((art.varios.get_edad(eb_fechanacimiento) >= 18) AND (NVL(eb_porcentaje, 0) > 0) ' +
                ' OR (eb_replegal = ''S'')) ';

  if (sSql <> '') then
  begin
    sdqRSocialOP.Close;
    sdqRSocialOP.SQL.Text := sSql;
    sdqRSocialOP.Open;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.ConfirmaCancelar :Boolean;
begin
  Result := (Accion = l_None) or
            ((Accion <> l_None) and MsgAsk('Se encuentra en una operación ¿Desea cancelar los cambios?'));
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbEliminarClick(Sender: TObject);
begin
  if HayRegistroActivo then
    case PageControl.ActivePageIndex of
      ctsILP        :DoBajaILP;
      ctsILT        :DoBajaILT;
      ctsOPagos     :DoBajaOPagos;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoBajaOPagos;
var
  bInvalida, bAprobada :Boolean;
  sSql, sWhere :String;
  iNumPago :Integer;
begin
  bInvalida := (GetChar(sdqOPagos.FieldByName('PR_ESTADO').AsString) in ['A','X','Z']);
  bAprobada := not(sdqOPagos.FieldByName('PR_FAPROBADO').IsNull);
  iNumPago  := sdqOPagos.FieldByName('PR_NUMPAGO').AsInteger;

  Verificar(bInvalida, GridOPagos,'No es posible anular esta liquidación.');

  if ValidarBajaOP_Usuarios(sdqOPagos.FieldByName('PR_USUALTA').AsString) then  // TK 52630
  begin

    sWhere := ' WHERE pr_siniestro = ' + SqlInt(vSiniestro) +
                ' AND pr_orden = ' + SqlInt(vOrden) +
                ' AND pr_recaida = ' + SqlInt(vRecaida) +
                ' AND pr_numpago = ' + SqlInt(iNumPago);
    try
      BeginTrans;
      if not bAprobada and MsgAsk('¿Confirma la Anulación de la liquidación nº ' + IntToStr(iNumPago) + '?') then
      begin
        sSql := 'UPDATE spr_pagoexpesin ' +
                  ' SET pr_estado = ''A'', ' +
                      ' pr_femision = ActualDate, ' +
                      ' pr_imporpago = 0, ' +
                      ' pr_usumodif= ' + SqlValue(Sesion.UserID) + ',' +
                      ' pr_fmodif = Actualdate ' + sWhere;
        EjecutarSqlST(sSql);

        Grabar_RegAuditLog('LIQ. CONC. PAGO', 'ANULACION',
                           IntToStr(vSiniestro) + '/' + IntToStr(vOrden) + '/' +
                           IntToStr(vRecaida) + ' - ' + IntToStr(iNumPago), False);

        MsgBox('Anulación efectuada correctamente', MB_ICONINFORMATION);
      end
      else if bAprobada and MsgAsk('¿Confirma la Cancelación de la liquidación nº ' + IntToStr(iNumPago) + '?') then
      begin //Cancelacion de Liq. APROBADA
        sSql := ' UPDATE spr_pagoexpesin ' +
                   ' SET pr_estado = ''X'', ' +
                       ' pr_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' pr_fmodif = Actualdate ' + sWhere;
        EjecutarSqlST(sSql);

        with tReciboOP do
          sSql := 'INSERT INTO spr_pagoexpesin ( ' +
                  ' pr_siniestro, pr_orden, pr_recaida, pr_numpago, pr_fechapago, pr_conpago, ' +
                  ' pr_femision, pr_acreedor, pr_cuitcuil, pr_letrafac, pr_situfac, pr_numfac, ' +
                  ' pr_fechafac, pr_imporpago, pr_importeconretencion, pr_formapago, pr_ctagasto, ' +
                  ' pr_comentario, pr_usualta, pr_fechalta, pr_estado, pr_prestadorsecuencia, ' +
                  ' pr_prestadormutual, pr_pagojudicial, pr_delegacion, pr_cai, pr_chequenombre, ' +
                  ' pr_aprobado, pr_faprobado, pr_metodopago, pr_enviofondos, pr_idbanco, pr_rcalle, ' +
                  ' pr_rnumero, pr_rpiso, pr_rdepartamento, pr_rcpostal, pr_rlocalidad, pr_rprovincia) VALUES ( ' +
                  SqlInt(vSiniestro) + ','  + SqlInt(vOrden) + ',' + SqlInt(vRecaida) + ',' +
                  SqlInt(GetProxPagoSPR(vSiniestro, vOrden, vRecaida)) + ',' + SqlDate(dcFechaLiqOP.Date) + ',' +
                  SqlValue(fraConPagoOP.Codigo) + ', Null, ' + SqlValue(fraTipoAcreedOP.Codigo) + ',' +
                  IIF(edDNIOP.Visible, SqlValue(edDNIOP.Text), SqlValue(edCuitOP.Text)) + ',' +
                  SqlValue(edLetraFacOP.Text) + ',' +
                  SqlValue(edSituFacOP.Text) + ',' + SqlValue(edNumFacOP.Text) + ',' +
                  SqlDate(dcFechaFacOP.Date) + ',' +
                  SqlNumber(-1 * (edSinRetGanOP.Value + edConRetGanOP.Value), True) + ',' +
                  SqlNumber(-1 * edConRetGanOP.Value) + ',' +
                  SqlString(GetFormaPago, True, True) + ',' +
                  SqlValue(edNroCuentaOP.Text) + ',' + SqlValue(edObsOP.Lines.Text) + ',' +
                  SqlValue(Sesion.UserID) + ', ActualDate, ''E'', ' +
                  SqlInt(vSecPrestador) + ',' + SqlValue(sSecMutual) + ',' +
                  IIF(chkPagoJudOP.Checked, '''S''', '''N''') + ',' +
                  SqlValue(fraDelegOP.Codigo) + ',' +  SqlValue(Trim(edCAIOP.Text)) + ',' +
                  SqlString(sdqOPagos.FieldByName('PR_CHEQUENOMBRE').AsString, True, True) + ',' +
                  SqlValue(Sesion.UserID) + ', ActualDate, ' +
                  SqlValue(fraMetodoPagoOP.Codigo) + ',' + SqlValue(edEnvioOP.Text) + ',' +
                  SqlInt(fraBancoOP.Value, True) + ',' + SqlValue(Calle) + ',' +
                  SqlValue(Numero) + ',' + SqlValue(Piso) + ',' +
                  SqlValue(Departamento) + ',' + SqlValue(CodigoPostal) + ',' +
                  SqlValue(Localidad) + ',' + SqlInt(Prov, True) + ')';
        EjecutarSqlST(sSql);

        Grabar_RegAuditLog('LIQ. CONC. PAGO', 'CANCELACION', '', False);

        MsgBox('Cancelación efectuada correctamente', MB_ICONINFORMATION);
      end;
      CommitTrans;
      DoCargarLiquidaciones(False);
     except
       on E:Exception do
       begin
         Rollback(True);
         ErrorMsg(E, 'Error al intentar la operación');
       end;
     end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbBuscarSiniestroClick(Sender: TObject);
var
  iOldIdSiniestro, iNewIdSiniestro: integer;
begin
  ShortCutControl.Enabled := False;
  try
    iOldIdSiniestro := fraTrabajadorSIN.IdSiniestro;
    iNewIdSiniestro := GetIdSiniestro(fraEmpresa.Value, fraTrabajadorSIN.Value,
                                       fraTrabajadorSIN.IdSiniestro, edSinFecha.Date, True);
    fraTrabajadorSIN.IdSiniestro := iNewIdSiniestro;
    if (fraTrabajadorSIN.IdSiniestro <> ART_EMPTY_ID) and
       (iOldIdSiniestro <> fraTrabajadorSIN.IdSiniestro) then
      fraTrabajadorSIN.Change;
  finally
    ShortCutControl.Enabled := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqLegalesAfterOpen(DataSet: TDataSet);
begin
  if sdqLegales.FieldByName('IMPORTESINRET') is TFloatField then
    TFloatField(sdqLegales.FieldByName('IMPORTESINRET')).Currency := True;

  if sdqLegales.FieldByName('IMPORTECONRET') is TFloatField then
    TFloatField(sdqLegales.FieldByName('IMPORTECONRET')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DoLiberarLiquidacion(oILT);
  DoLiberarLiquidacion(oILP);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCrearObjILT(iSiniestro, iOrden, iRecaida, iNroLiquidacion: Integer; var ObjILT: TILT);
begin
//  DoLiberarLiquidacion(ObjILT);  

  ObjILT := TILT.Create(iSiniestro, iOrden, iRecaida, iNroLiquidacion,
                        pSuperUser, False, True,
                        Seguridad.Claves.IsActive('LiquidarReintegrosGBAILT'),
                        Seguridad.Claves.IsActive('CargarPrescriptasILT'),
                        Seguridad.Claves.IsActive('LiquidarPrescriptasILT'),
                        Seguridad.Claves.IsActive('CargarObservadasILT'),
                        Seguridad.Claves.IsActive('LiquidarObservadasILT'));

end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCrearObjILP(iSiniestro, iOrden, iRecaida, iNroLiquidacion: Integer; var ObjILP: TILP);
begin
  ObjILP := TILP.Create(iSiniestro, iOrden, iRecaida, iNroLiquidacion, pSuperUser, False);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.NuevoILT(iSiniestro, iOrden, iRecaida: integer; var ObjILT: TILT): Boolean;
var
  bContinuar: Boolean;
  iConsumirDiasFranq, iFranquiciaTomada: integer;
begin
  bContinuar := True;
  DoCrearObjILT(iSiniestro, iOrden, iRecaida, 0, ObjILT);
  ObjILT.EstadoOperacion := eoEstadoAlta;

  if not ObjILT.Expediente.TrabajadorDeclarado then
    MsgBox('El empleador omitió declarar su obligación de pago.' + CRLF + 'Pagos a recuperar del empleador.', MB_ICONEXCLAMATION + MB_OK);

  if ObjILT.Error <> '' then
  begin
    if pSuperUser or ((ObjILT.Expediente.Estado = SIEST_SUSPPLAZOS) and Seguridad.Claves.IsActive('ExpedSuspPlazos')) or LiquidaRechazado(ObjILT.Expediente.CausaFin) then
    begin
      if MsgBox(ObjILT.Error + CRLF + '¿Continúa de todos modos?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        ObjILT.Error := ''
      else
        bContinuar := False;
    end
    else begin
      MsgBox(ObjILT.Error, MB_ICONEXCLAMATION + MB_OK);
      bContinuar := False;
    end;
  end;

  if bContinuar then
  begin
    if (ObjILT.Expediente.FechaBajaMedica <> 0) and not HayRegistroActivo then
    begin
      ObjILT.EstadoOperacion := eoEstadoAltaNoValidar;

      // TK 69514
      iFranquiciaTomada  := ObjILT.FranquiciaTomada;

      iConsumirDiasFranq := ExisteJustifILT_entreFAltaYFReca(iSiniestro, iOrden, iRecaida);  // Si esta funcion da > 0, es porque existe justificacion de ILT dentro del periodo de Fecha de alta medica de la reca anterior y Fecha de Recaida de la reca actual.
      if (iConsumirDiasFranq > 0) then
        if (iFranquiciaTomada + iConsumirDiasFranq) <= ObjILT.Expediente.Franquicia then     // si sumando los dias a consumir, la suma da menor o igual a 10, entonces se lo sumo. Pero si se pasa de 10, le pongo justo 10.
          iFranquiciaTomada := iFranquiciaTomada + iConsumirDiasFranq
        else
          iFranquiciaTomada := ObjILT.Expediente.Franquicia;

      ObjILT.Desde := ObjILT.Expediente.FechaBajaMedica + (ObjILT.Expediente.Franquicia - iFranquiciaTomada);     // reemplazo por la variable iFranquiciaTomada

      ObjILT.EstadoOperacion := eoEstadoAlta;
    end;
  end;

  Result := bContinuar;
end;

{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.ExisteJustifILT_entreFAltaYFReca(iSini, iOrd, iReca: integer): integer;
var dFechaAltaMed_RecaAnt, dFechaRecaida_RecaActual: TDateTime;
    sSql: string;
    iIdExped: integer;
begin
  Result := 0;
  if (iReca > 0) then
  begin
    // Fecha de alta medica de la recaída anterior a la actual.
    dFechaAltaMed_RecaAnt := ValorSqlDateTimeEx('SELECT ex_altamedica ' +
                                                 ' FROM art.sex_expedientes ' +
                                                ' WHERE ex_siniestro = :sini ' +
                                                  ' AND ex_orden = :orden ' +
                                                  ' AND ex_recaida = :reca ', [iSini, iOrd, (iReca-1)]);

    if (dFechaAltaMed_RecaAnt > 0) then
    begin
      dFechaRecaida_RecaActual := ValorSqlDateTimeEx('SELECT ex_fecharecaida ' +
                                                      ' FROM art.sex_expedientes ' +
                                                     ' WHERE ex_siniestro = :sini ' +
                                                       ' AND ex_orden = :orden ' +
                                                       ' AND ex_recaida = :reca ', [iSini, iOrd, iReca]);


      if (dFechaAltaMed_RecaAnt < dFechaRecaida_RecaActual) then
      begin
        // ahora me fijo si existe Justificacion de ILT entre esas dos fechas:
        sSql := ' SELECT ji_chkjustificacionilt, ji_fdesde1, ji_fhasta1 ' +
                  ' FROM SIN.SJI_JUSTIFICACIONILT ' +
                 ' WHERE ji_idexpediente = :idexped ' +
                   ' AND ji_fechabaja is null ';

        iIdExped := Get_IdExpediente(iSini, iOrd, (iReca-1));

        with GetQueryEx(sSql, [iIdExped]) do
        try
          if (not Eof) and (FieldByName('JI_CHKJUSTIFICACIONILT').AsString = 'S') then
            if (dFechaAltaMed_RecaAnt <= FieldByName('JI_FDESDE1').AsDateTime)
               and (dFechaRecaida_RecaActual >= FieldByName('JI_FHASTA1').AsDateTime) then
              Result := Trunc(dFechaRecaida_RecaActual) - Trunc(dFechaAltaMed_RecaAnt);   // Si Existe justificacion de ILT dentro de ese periodo, devuelvo la cantidad de dias que hay dentro de ese periodo, para que luego sean descontados de la franquicia tomada.
        finally
          Free;
        end;
      end;

    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoRefrescarILT;
begin
  with oILT do
  begin
    fraTipoILT.Codigo             := Tipo;
    edDesdeILT.Date               := Desde;
    edHastaILT.Date               := Hasta;
    edDiasILT.Value               := Dias;
    edIBDILT.Value                := BaseDiaria;
    edIBDNoRemILT.Value           := BaseDiariaNoRem;
    edImpARTILT.Value             := ImporteART;
    edImpARTNoRemILT.Value        := ImporteARTNoRem;
    edImpEmpresaILT.Value         := ImporteEmpresa;
    edImpEmpNoRemILT.Value        := ImporteEmpNoRem;
    edDiferenciaILT.Value         := Diferencia;
    edDiferenciaNoRemILT.Value    := DiferenciaNoRem;
    edImpLiquidadoILT.Value       := ImporteLiquidado;
    edImpLiquidadoNoRemILT.Value  := ImporteLiquidNoRem;
    edImpContribILT.Value         := Contribuciones;
    edImpContribILT_NoRem.Value   := Contribuciones_NoRem;    // TK 51343 que pasa a plan

    edImpAportesILT.Value         := Aportes;
    edSalarioFamiliarILT.Value    := SalarioFamiliar;
    edAPagarILT.Value             := TotalAPagar;
    edObservILT.Lines.Text        := Observaciones;
    edChequeNombreILT.Text        := ANombreDe;
    edPorcContribILT.Value        := PorcContrib;
    edPorcContribILT_NoRem.Value  := PorcContrib_NoRem;   // TK 51343 que pasa a plan

    edPorcAportesILT.Value        := PorcAportes;
    fraDelegacionILT.Codigo       := Delegacion;
    fraMotivoDiferencia.Value     := IdMotivoDiferencia;  // TK 39345
    fraMetodoPagoILT.Codigo       := MetodoPago;
    fraBancoILT.Value             := IdBanco;
    edEnvioILT.Text               := EnvioFondos;
    chkBaseMopresILT.Checked      := (BaseMopres = 'S');
    lblLiqConEmbILT.Visible       := GeneraEmbargo;
    edRecibosILT.Lines.Text       := Recibos;
    if ChkDomicilioRec then
      fraDomicilioRecibos.Cargar(CalleRec, CodigoPostalRec, LocalidadRec, NumeroRec,
                                 PisoRec, DepartamentoRec, ProvinciaRec, CPARec)
    else
      MemoOtroRecibos.Lines.Text  := OtroRec;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoRefrescarILP;
var
  bHabilitar, bHabilitar2 :Boolean;
begin
  with oILP do
  begin
    edDesdeILP.Date            := Desde;
    edHastaILP.Date            := Hasta;
    edIBDILP.Value             := BaseDiaria;
    edIBDNoRemILP.Value        := BaseDiariaNoRem;
    edDiasILP.Value            := Dias;
    edImpLiquidadoILP.Value    := ImporteLiquidado;
    edImpLiquidNoRemILP.Value  := ImporteLiquidNoRem;
    edPorcContribILP.Value     := PorcContrib;
    edImpContribILP.Value      := Contribuciones;
    edPorcAportesILP.Value     := PorcAportes;
    edImpAportesILP.Value      := Aportes;
    edCompDanos.Value          := MontoCompDanos;
    edPagoAdic.Value           := MontoPagoAdic;
    edOtrosPagos.Value         := MontoOtrosPagos;
    if MontoOtrosPagos <> 0 then
      lblOtrosPagos.Caption :=  sdqILP.FieldByName('ConceptoOP').AsString;

    edSalarioFamiliarILP.Value := SalarioFamiliar;
    edMopreILP.Value           := PlusAMPO;
    edAPagarILP.Value          := TotalAPagar;
    edTipoILP.Text             := DescripcionTipo;
    edFormulaILP.Text          := Formula;
    fraDelegacionILP.Codigo    := Delegacion;
    edObservILP.Lines.Text     := Observaciones;
    edChequeNombreILP.Text     := ANombreDe;
    fraMetodoPagoILP.Codigo    := MetodoPago;
    edEnvioILP.Text            := EnvioFondos;
    fraBancoILP.Value          := IdBanco;
    chkBaseMopresILP.Checked   := (BaseMopres = 'S');
    edRecibosILP.Lines.Text    := Recibos;

    SetLblTipoLiq;
    if ChkDomicilioRec then
      fraDomicilioRecibos.Cargar(CalleRec, CodigoPostalRec, LocalidadRec, NumeroRec,
                                 PisoRec, DepartamentoRec, ProvinciaRec, CPARec)
    else
      MemoOtroRecibos.Lines.Text := OtroRec;
  end;

  bHabilitar  := (Accion <> l_None) and not(oILP.GenerarPagoUnico or oILP.LiqIndemnizacion or oILP.LiqDifRtaPeriodica);
  LockControl(edDesdeILP, not bHabilitar);
  bHabilitar2 := bHabilitar and (oILP.IsPeriodica or oILP.IsGranInvalidezDefinitiva);
  LockControls([edHastaILP, udDiasILP], not bHabilitar2);
  bHabilitar2 := bHabilitar and oILP.IsPeriodica and not(oILP.LiqAsigFamiliar);
  LockControl(edSalarioFamiliarILP, not bHabilitar2);
  btnAsigFamILP.Enabled := bHabilitar2;
  bHabilitar  := bHabilitar and Seguridad.Claves.IsActive('PagoUnicoLiquidadoILP') and
                 (not(oILP.IsPeriodica) and not(oILP.IsGranInvalidezDefinitiva)) or
                 oILP.LiqAsigFamiliar;
  LockControl(edImpLiquidadoILP, not bHabilitar);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edDiferenciaILTChange(Sender: TObject);
begin
  edDiferenciaILT.Font.Color := IIF((edDiferenciaILT.Value < 0), clRed, clBlack);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoBajaILT;
var
  sMotivoCanc, sCodEstado: String;
  bDevolFondos, bCompensaPag, bExcepcion, bTieneRegistros: boolean;
  cuAPagar: Currency;
  iNroliq: integer;
begin
  oILT.EstadoOperacion := eoEstadoBaja;
  iNroLiq    := oILT.NroLiquidacion;   // lo tomo aca porque despues se va el foco
  cuAPagar   := oILT.TotalAPagar;      // Idem
  sCodEstado := sdqILT.FieldByName('LE_ESTADO').AsString;
  bExcepcion := False;

  if Get_MotivoCancelacionLiq(sMotivoCanc, bDevolFondos, bCompensaPag, sCodEstado, vSiniestro, vOrden, vRecaida, iNroLiq) then
  begin
    if bCompensaPag then  // TK 44193
      tTipoCheck := t_CompensaPag
    else
      tTipoCheck := t_DevuelveFondos;

    BeginTrans;
    Try
      if oILT.Borrar(sMotivoCanc, bDevolFondos, False) then
      begin
        DoEvaluar_Baja(sMotivoCanc, bExcepcion, bTieneRegistros);

        if bExcepcion and not bTieneRegistros then
        begin
          if EsMotivo_CierraRecaida(sMotivoCanc) then
            raise Exception.Create('No existen mas Recaídas para este Siniestro')
          else if EsMotivo_CierraSiniestro(sMotivoCanc) then
            raise Exception.Create('No existen mas Siniestros para este Trabajador');
        end
        else if bExcepcion then

          raise Exception.Create('No se han guardado los cambios');

        DoCargarILT;
        if bCompensaPag then   // Tipo de cancelacion: Compensa con pagos futuros (Por Plan Registro de pagos cancelados)
          DoGuardarCuentaCorriente_Suma(iNroLiq, cuAPagar, False);      // Le paso el total a pagar porque el realizar el borrado cambia de foco y me traia siempre el primero.
      end
      else
      begin
        if oILT.Error <> '' then
          MsgBox(oILT.Error, MB_ICONEXCLAMATION + MB_OK);
      end;
      CommitTrans;
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos (DoBajaILT).');
        Rollback;
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoBajaILP;
var
  sMotivoCanc, sCodEstado: String;
  bDevolFondos, bCompensaPag: boolean;
  cuAPagar: Currency;
  iNroLiq: integer;
begin
  oILP.EstadoOperacion := eoEstadoBaja;
  iNroLiq    := oILP.NroLiquidacion;  // lo tomo aca porque despues se va el foco
  cuAPagar   := oILP.TotalAPagar;     // Idem
  sCodEstado := sdqILP.FieldByName('LE_ESTADO').AsString;

  if Get_MotivoCancelacionLiq(sMotivoCanc, bDevolFondos, bCompensaPag, sCodEstado, vSiniestro, vOrden, vRecaida, iNroLiq) then
  begin
    if bCompensaPag then  // TK 44193
      tTipoCheck := t_CompensaPag
    else
      tTipoCheck := t_DevuelveFondos;

    BeginTrans;
    Try
      if oILP.Borrar(sMotivoCanc, bDevolFondos, False) then
      begin
        DoCargarILP;
        if bCompensaPag then   // Tipo de cancelacion: Compensa con pagos futuros (Por Plan Registro de pagos cancelados)
          DoGuardarCuentaCorriente_Suma(iNroLiq, cuAPagar, False);
      end
      else begin
        if oILP.Error <> '' then
          MsgBox(oILP.Error, MB_ICONEXCLAMATION + MB_OK);
      end;
      CommitTrans;
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos (DoBajaILP).');
        Rollback;
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarILT(Confirmar: Boolean; ObjILT: TILT; iSiniestro, iOrden, iRecaida: Integer; aAccion: TAccionLiq; var iResValida:Integer; bConTransaccion: Boolean = True);
var
  sTipoSuss: String;
  bSeguir: Boolean;
  cEmbargo, cEmbargoRemun, cEmbargoNoRemun: Currency;
begin
  begin
    if ((aAccion = l_Alta) and ObjILT.Cambios) or (aAccion = l_Clonacion) then
    begin
      bSeguir := not Confirmar or (MsgBox('Se han realizado cambios en los datos.' + CRLF + '¿Quiere grabarlos?', MB_ICONQUESTION + MB_YESNO) = IDYES);

      if bSeguir then
      begin
        if ObjILT.PermitirLiquidarDesdeSistema then
        begin
          iResValida := ObjILT.Validar;

          if (aAccion = l_Clonacion) then                    // Plan pagos cancelados
          begin
            if (ObjILT.BaseDiaria <> oILT.BaseDiaria)           or
               (ObjILT.BaseDiariaNoRem <> oILT.BaseDiariaNoRem) or
               (ObjILT.PorcContrib <> oILT.PorcContrib)       or
               (ObjILT.PorcAportes <> oILT.PorcAportes)       then
            begin
              iResValida   := 2;
              ObjILT.Error := 'Los siniestros deben tener los mismos valores en: Base Diaria, Porcentajes de Aportes y Contribuciones';
            end;
          end;

          if iResValida = 1 then    // dio algún tipo de error por CUIL inconsistente
            sTipoSuss := ObjILT.Expediente.TipoSussVigente;

          if iResValida <> 2 then   // si no es alguna validación que requiera el dato obligatoriamente siempre
            if ((iResValida = 1) and (sTipoSuss = '2')) or (((iResValida = 0) or (iResValida = 1)) and pSuperUser) or
               ((iResValida = 3) and ObjILT.LiquidarObservadas) or
               (iResValida = 4) then
              iResValida := Iif(MsgBox(ObjILT.Error + CRLF + '¿Continúa de todos modos?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES, -1, 0);

          cEmbargoRemun   := ObjILT.ImporteEmbargoRemun;
          cEmbargoNoRemun := ObjILT.ImporteEmbargoNoRemun;
          cEmbargo        := cEmbargoRemun + cEmbargoNoRemun;

          if iResValida <> -1 then
            MsgBox(ObjILT.Error, MB_ICONEXCLAMATION + MB_OK)
          else
          begin
            with TfrmDireccionCDO.Create(nil) do
            try
              BeginTrans;
              try

                if ObjILT.Grabar(aAccion, false, tTipoCheck) then               // TK 44193
                begin

                  if (fraTipoILT.Codigo = 'D') then                  //Pago directo
                    bSeguir := doSeleccionarCasoPuestaDisp(1, ObjILT.IdLiquidacion);

                  if (bSeguir = true) and (fraTipoILT.Codigo = 'D') and (Mostrar(vIdExpediente, ObjILT.NroLiquidacion, 'ILT') = false) then          //Pago directo
                    bSeguir := false;

                  if bSeguir then
                  begin
                    DoEvaluarCompensacion(ObjILT.NroLiquidacion, ObjILT.TotalAPagar);  // por Plan Registro de pagos cancelados (para resta)
                    DoSetearEsCompensacion;

                    MsgBox('Alta efectuada correctamente', MB_ICONINFORMATION);

                    if ((ObjILT.Error = '') or (ObjILT.EsCompensacion)) and (MsgBox('¿Quiere imprimir la liquidación ahora?', MB_ICONQUESTION + MB_YESNO) = IDYES) then   // por Plan
                    begin
                      DoCrearObjILT(iSiniestro, iOrden, iRecaida, ObjILT.NroLiquidacion, ObjILT); // para que se actualicen todas las propiedades antes de imprimir
                      if (fpImprimirLiq.ShowModal = mrOk) then
                        ObjILT.Imprimir(edCantRec.Value, edCantRes.Value, edCantDig.Value, True, false);
                    end;

                    DoImprimirCompensacionYaRealizada(iSiniestro, iOrden, iRecaida, false); // Evalúa si hubo una compensacion y ya se compenso todo, entonces pregunta si desea imprimir las liquidaciones compensadas (por Plan Registro de Pagos Cancelados).

                    CommitTrans;
                  end
                  else
                    Rollback;

                end
                else
                begin
                  Rollback;
                  if ObjILT.Error <> '' then
                    MsgBox(ObjILT.Error, MB_ICONEXCLAMATION + MB_OK);
                end;

              except
                on e: exception do
                begin
                  ErrorMsg(e, e.message);
                  Rollback;
                end;
              end;
            finally
              Free;
            end;
          end;

          if bSeguir then
          begin
            if (cEmbargo > 0) and ((iResValida = -1) or (ObjILT.TotalAPagar <= 0)) then
              DoGrabarEmbargo(ObjILT, cEmbargoRemun, cEmbargoNoRemun);

            if (iResValida = -1) then
            begin
              Accion := l_None;
              DoCargarILT;
              DoHabilitarAlta(False);
            end;
          end;
        end;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoMostrarColFinancials(bMostrar: Boolean);
var
  dgActual: TArtDBGrid;
begin
  case PageControl.ActivePageIndex of
    ctsILP     : dgActual := GridILP;
    ctsILT     : dgActual := GridILT;
    ctsOPagos  : dgActual := GridOPagos;
  else
    dgActual := nil;
  end;

  if assigned(dgActual) then
  begin
    dgActual.ColumnByField['OrdenNro'].Visible    := bMostrar;
    dgActual.ColumnByField['OrdenFecha'].Visible  := bMostrar;
    dgActual.ColumnByField['ChequeNro'].Visible   := bMostrar;
    dgActual.ColumnByField['ChequeFecha'].Visible := bMostrar;
    dgActual.ColumnByField['Situacion'].Visible   := bMostrar;
    dgActual.ColumnByField['FSituacion'].Visible  := bMostrar;
    dgActual.ColumnByField['ObsCheque'].Visible   := bMostrar;            
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarFinancial;
begin
  if mnuDatosPago.Checked then
  begin
    case PageControl.ActivePageIndex of
      ctsILP     : CargarFinancials(sdqILP, GridILP, True);
      ctsILT     : CargarFinancials(sdqILT, GridILT, True);
      ctsOPagos  : CargarFinancials(sdqOPagos, GridOPagos, False);
    end;
  end;
  DoMostrarColFinancials(mnuDatosPago.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraDelegacionILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    fraDelegacionILT.FrameExit(Sender);
    oILT.Delegacion := fraDelegacionILT.Codigo;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edDesdeILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.ResetearAsignacionFamiliar;
    oILT.Desde := edDesdeILT.Date;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edHastaILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.ResetearAsignacionFamiliar;
    oILT.Hasta := edHastaILT.Date;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edImpEmpresaILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.ImporteEmpresa := edImpEmpresaILT.Value;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edSalarioFamiliarILTExit(Sender: TObject);
begin
  if (Accion <> l_None) and (vSalFamiliar <> edSalarioFamiliarILT.Value) then
  begin
    oILT.AsgnFamiliares.SalarioManual := edSalarioFamiliarILT.Value;
    oILT.SalarioFamiliar              := edSalarioFamiliarILT.Value;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edChequeNombreILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.ANombreDe := edChequeNombreILT.Text;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarILP(bHabilitar: Boolean);
begin
  LockControls([edDesdeILP, fraDelegacionILP, edObservILP, edChequeNombreILP,
                fraMetodoPagoILP, fraBancoILP, edEnvioILP, edRecibosILP], not bHabilitar);

  mnuCuentasBancarias.Enabled   := bHabilitar;
  if not bHabilitar then
  begin
    btnEnvioILP.Enabled     := False;
    btnRecibosILP.Enabled   := False;
    LockControls([edHastaILP, udDiasILP, edImpLiquidadoILP], True);
  end;
    if bHabilitar and edDesdeILP.CanFocus then
    edDesdeILP.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarDatosEconomicos;
begin
  sdqDERemuneraciones.Close;
  sdqAportesILTDE.Close;
  sdqAportesILTPDDE.Close;
  sdqRemuVarPosDecre.Close;
  sdqRemuFijaPosDecre.Close;
  edBajaMedicaDE.Clear;
  edAltaMedicaDE.Clear;
  edFranquiciaDE.Clear;
  edBaseDiariaILTDE.Clear;
  edFecRecDocILTDE.Clear;
  edFecRecDocILPDE.Clear;
  edFecRecDocMortDE.Clear;
  edFecRecDocContriDE.Clear;
  edCantHijosSinDiscapDE.Clear;
  edCantHijosDiscapDE.Clear;
  edFDespidoDE.Clear;
  edFDepositoDE.Clear;
  edFJubilacionDE.Clear;
  chkBaseMopresDE.Checked := False;
  chkApyConDE.Checked     := False;
  fraCondicionAFIPDE.Clear;
  fraOSocialDE.Clear;
  fraAFJPDE.Clear;
  fraCeseRentaDE.Clear;
  fraZonaAFIPDE.Clear;
  edBaseDiariaPostDE.Clear;
  edBaseDiariaPostDENoRem.Clear;
  dcVigDesdeDE.Clear;
  dcVigHastaDE.Clear;
  edDiasFijoPostDE.Clear;
  edMontoFijoPostDE.Clear;
  edMontoFijoNoRemPostDE.Clear;
  chkCalcSACNoRemPostDE.Checked  := False;
  chkEspecialPostDE.Checked      := False;
  chkCalcSACRemPostDE.Checked    := True; 
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarTempAportesDatEcon;
var
  sSql: String;
begin
  sSql := 'DELETE FROM TPO_APORTESCONTR ' +
           'WHERE PO_USUARIO = :Usuario';
  EjecutarSqlSTEx(sSql, [Sesion.UserID]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarTempAportesDatEcon(Tipo: String; Siniestro, Orden: Integer);
var
  sSuf, sSql: String;
begin
  if Tipo = 'ILT' then
    sSuf  := '_ILT'
  else if Tipo = 'ILTPD' then
    sSuf  := '_ILTPD'
  else
    sSuf  := '';

  sSql := 'INSERT INTO TPO_APORTESCONTR ' +
                 '(PO_ID, PO_USUARIO, PO_TIPO, PO_CODIGO, PO_CONCEPTO, PO_PORCEMPR, PO_PORCTRAB) ' +
            'SELECT SEQ_TPO_ID.NEXTVAL, :User, :Tipo, A0, A1, A2, A3 ' +
              'FROM ' +
                '(SELECT 1 A0, ''Jubilación'' A1, EPA_PEJUBILA' + sSuf + ' A2, ' + 'EPA_PTJUBILA' + sSuf + ' A3 ' +
                  ' FROM SECB_CBASEEXPSIN, SEX_EXPEDIENTES ' +
                  'WHERE EX_SINIESTRO = :Siniestro ' +
                    'AND EX_ORDEN = :Orden ' +
                    'AND EX_RECAIDA = 0 ' +
                    'AND EX_SINIESTRO = CB_SINIESTRO(+) ' +
                    'AND EX_ORDEN = CB_ORDEN(+) ' +
                 'UNION ALL ' +
                 'SELECT 2, ''INSSJP'' CINSSJP, EPA_PEINSSJP' + sSuf + ', ' + 'EPA_PTINSSJP' + sSuf +
                  ' FROM SECB_CBASEEXPSIN, SEX_EXPEDIENTES ' +
                  'WHERE EX_SINIESTRO = :Siniestro ' +
                    'AND EX_ORDEN = :Orden ' +
                    'AND EX_RECAIDA = 0 ' +
                    'AND EX_SINIESTRO = CB_SINIESTRO(+) ' +
                    'AND EX_ORDEN = CB_ORDEN(+) ' +
                 'UNION ALL ' +
                 'SELECT 3, ''F.N.EMPLEO'' CFNEMPLEO, EPA_PEFNEMPLEO' + sSuf + ', NULL' +
                  ' FROM SECB_CBASEEXPSIN, SEX_EXPEDIENTES ' +
                  'WHERE EX_SINIESTRO = :Siniestro ' +
                    'AND EX_ORDEN = :Orden ' +
                    'AND EX_RECAIDA = 0 ' +
                    'AND EX_SINIESTRO = CB_SINIESTRO(+) ' +
                    'AND EX_ORDEN = CB_ORDEN(+) ' +
                 'UNION ALL ' +
                 'SELECT 4, ''Salario Familiar'' CSFAMILIAR, EPA_PESFAMILIAR' + sSuf + ', NULL' +
                  ' FROM SECB_CBASEEXPSIN, SEX_EXPEDIENTES ' +
                  'WHERE EX_SINIESTRO = :Siniestro ' +
                    'AND EX_ORDEN = :Orden ' +
                    'AND EX_RECAIDA = 0 ' +
                    'AND EX_SINIESTRO = CB_SINIESTRO(+) ' +
                    'AND EX_ORDEN = CB_ORDEN(+) ' +
                 'UNION ALL ' +
                 'SELECT 5, ''ANSSAL'' CANSSAL, EPA_PEANSSAL' + sSuf + ', ' + 'EPA_PTANSSAL' + sSuf +
                  ' FROM SECB_CBASEEXPSIN, SEX_EXPEDIENTES ' +
                  'WHERE EX_SINIESTRO = :Siniestro ' +
                    'AND EX_ORDEN = :Orden ' +
                    'AND EX_RECAIDA = 0 ' +
                    'AND EX_SINIESTRO = CB_SINIESTRO(+) ' +
                    'AND EX_ORDEN = CB_ORDEN(+) ' +
                 'UNION ALL ' +
                 'SELECT 6, ''Obra Social'' COSOCIAL, EPA_PEOSOCIAL' + sSuf + ', ' + 'EPA_PTOSOCIAL' + sSuf +
                  ' FROM SECB_CBASEEXPSIN, SEX_EXPEDIENTES ' +
                  'WHERE EX_SINIESTRO = :Siniestro ' +
                    'AND EX_ORDEN = :Orden ' +
                    'AND EX_RECAIDA = 0 ' +
                    'AND EX_SINIESTRO = CB_SINIESTRO(+) ' +
                    'AND EX_ORDEN = CB_ORDEN(+))';
  EjecutarSqlSTEx(sSql, [Sesion.UserID, Tipo, Siniestro, Orden,
                         Siniestro, Orden, Siniestro, Orden,
                         Siniestro, Orden, Siniestro, Orden,
                         Siniestro, Orden]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarAportesDatEcon(Siniestro, Orden, Recaida: Integer);
var
  sSql: String;
begin
  sSql := 'SELECT cb_ibasediaria, cb_obrasocial, cb_afjp, NVL(cb_canthijos, 0) cb_canthijos,  ' +
                 'NVL(cb_canthijosdiscap, 0) cb_canthijosdiscap, cb_fechadespido, cb_frecepdocumen, ' +
                 'cb_frecepilp, cb_frecepmort, cb_frecepcont, cb_base_3mopres, ' +
                 'NVL(cb_obrasocial_suss, ''X'') cb_obrasocial_suss,  NVL(cb_afjp_suss, ''X'') cb_afjp_suss, ' +
                 'cb_ceserenta, cb_idzonaafip, cb_fdepositoilp, cb_fjubilacion, ' +
                 'art.liq.get_fechadocumentacion(:Sin, :Ord, :Reca, ''T'') filt, ' +
                 'art.liq.get_fechadocumentacion(:Sin, :Ord, :Reca, ''P'') filp, ' +
                 'art.liq.get_fechadocumentacion(:Sin, :Ord, :Reca, ''M'') fmort, ' +
                 'NVL(cb_condicionafip, 1) cb_condicionafip, cb_incluirapycon ' +
            'FROM secb_cbaseexpsin ' +
           'WHERE cb_siniestro = :Sin ' +
             'AND cb_orden = :Ord';

  with GetQueryEx(sSql, [vSiniestro, vOrden, vRecaida]) do
  try
    if not Eof then
    begin
      edBaseDiariaILTDE.Value      := FieldByName('cb_ibasediaria').AsCurrency;
      edFecRecDocContriDE.Date     := FieldByName('cb_frecepcont').AsDateTime;
      edCantHijosSinDiscapDE.Value := FieldByName('cb_canthijos').AsInteger;
      edCantHijosDiscapDE.Value    := FieldByName('cb_canthijosdiscap').AsInteger;
      edFDespidoDE.Date            := FieldByName('cb_fechadespido').AsDateTime;
      edFDepositoDE.Date           := FieldByName('cb_fdepositoilp').AsDateTime;
      edFJubilacionDE.Date         := FieldByName('cb_fjubilacion').AsDateTime;
      chkBaseMopresDE.Checked      := (FieldByName('cb_base_3mopres').AsString = 'S');
      fraOSocialDE.Codigo          := FieldByName('cb_obrasocial').AsString;
      edFecRecDocILTDE.Date        := FieldByName('filt').AsDateTime;
      edFecRecDocILPDE.Date        := FieldByName('filp').AsDateTime;
      edFecRecDocMortDE.Date       := FieldByName('fmort').AsDateTime;
      fraCondicionAFIPDE.Value     := FieldByName('cb_condicionafip').AsInteger;
      fraAFJPDE.Codigo             := FieldByName('cb_afjp').AsString;
      fraCeseRentaDE.Codigo        := FieldByName('cb_ceserenta').AsString;
      fraZonaAFIPDE.Value          := FieldByName('cb_idzonaafip').AsInteger;
      chkApyConDE.Checked          := (FieldByName('cb_incluirapycon').AsString = 'S');
    end;
  finally
    Free;
  end;

  BeginTrans;
  try
    DoLimpiarTempAportesDatEcon;

    DoCargarTempAportesDatEcon('ILT', Siniestro, Orden);
    DoCargarTempAportesDatEcon('ILTPD', Siniestro, Orden);
    DoCargarTempAportesDatEcon('ILP', Siniestro, Orden);
    CommitTrans;

    OpenQueryEx(sdqAportesILTDE, [Sesion.UserID, 'ILT']);
    OpenQueryEx(sdqAportesILTPDDE, [Sesion.UserID, 'ILTPD']);
    OpenQueryEx(sdqAportesILPDE, [Sesion.UserID, 'ILP']);

    CalcTotalesAportes(sdqAportesILTDE);
    pcAportes.ActivePageIndex         := ctsAportesILT;
    pcRemuneraciones.ActivePageIndex  := ctsRemunAnterior;
  except
    on E: Exception do
    begin
      RollBack(True);
      ErrorMsg(E, 'Error al generar grilla aportes y contribuciones.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarGrillaRemuneracionesDatEcon(Siniestro, Orden: Integer;
                                                                   Cuit: String; FechaAccidente: TDateTime);
begin
  if DoGenerarTempRemunDatEcon(Siniestro, Orden, Cuit, FechaAccidente) then
    OpenQueryEx(sdqDERemuneraciones, [Sesion.UserID]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarRemuneracionesDatEcon(Siniestro, Orden, Recaida: Integer);
var
  sSql: String;
begin
  sSql := 'SELECT ex_fechaaccidente, ex_fecharecaida, ex_altamedica, ex_cuit, ' +
                 'afiliacion.get_franquicia(afiliacion.get_contratovigente(ex_cuit, to_char(ex_fechaaccidente, ''yyyymm'')), ex_fechaaccidente) franquicia, ' +
                 ' art.siniestro.getbajamedica(ex_id) bajamedica ' +
            'FROM sex_expedientes ' +
           'WHERE ex_siniestro = :Siniestro ' +
            'AND ex_orden = :Orden ' +
            'AND ex_recaida = :Recaida';

  with GetQueryEx(sSql, [vSiniestro, vOrden, vRecaida]) do
  try
    edBajaMedicaDE.Date  := FieldByName('bajamedica').AsDateTime;
    edAltaMedicaDE.Date  := FieldByName('ex_altamedica').AsDateTime;
    edFranquiciaDE.Value := FieldByName('franquicia').AsInteger;

    DoCargarGrillaRemuneracionesDatEcon(Siniestro, Orden, FieldByName('ex_cuit').AsString,
                                        FieldByName('ex_fechaaccidente').AsDateTime);
    DoCargarGrillaRemunPostDecreto;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarDatosEconomicos;
begin
  DoLimpiarDatosEconomicos;
  DoCargarRemuneracionesDatEcon(vSiniestro, vOrden, vRecaida);
  DoCargarAportesDatEcon(vSiniestro, vOrden, vRecaida);
  pTopeIBDSiniestro := Get_TopeIBDSiniestro(vSiniestro, vOrden, vRecaida);
  DoHabilitarBotonesLiquidacion(False);
  DoHabilitarDatosEconomicos(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesDIASValidate(Sender: TField);
begin
  Verificar((sdqDERemuneraciones.RecNo = 13{$IFNDEF VER150}+ 1{$ENDIF}) or (sdqDERemuneraciones.RecNo = 14{$IFNDEF VER150}+ 1{$ENDIF}),
            GridDERemuneraciones, 'No puede cambiar los datos del SAC.');
  if Sender.IsNull then Sender.Value := 0;
  Verificar(Sender.Value < 0, GridDERemuneraciones, 'El día debe ser mayor o igual a 0');
  Verificar(Sender.Value > GetDay(LastDayOfPeriodo(sdqDERemuneraciones.FieldByName('PERIODO').AsString)),
            GridDERemuneraciones, 'El día es inválido.');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesIMPORTE_INFORMADOValidate(Sender: TField);
begin
  if Sender.IsNull then Sender.Value := 0;
  Verificar(Sender.Value < 0, GridDERemuneraciones, 'El importe informado debe ser mayor o igual a 0');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesIMPORTE_INFORMADOChange(Sender: TField);
begin
  CalcTotalesDatosEconomicos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesPERIODOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString <> '' then
    Text := FormatPeriodo(Sender.AsString);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.CalcTotalesDatosEconomicos;
var
  PrevCursor: TCursor;
  iPosAMPO, iPosDias: Integer;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if sdqDERemuneraciones.Active then
      begin
        SumFields(sdqDERemuneraciones, CAMPOS_SUMADE, TotalConsultaDE);
        iPosDias := ArrayPos('DIAS', CAMPOS_SUMADE);
        if TotalConsultaDE[iPosDias] = 0 then
          edBaseDiariaILTDE.Value := 0
        else begin
          iPosAMPO                := ArrayPos('IMPORTE_AMPOTOPEADO', CAMPOS_SUMADE);
          edBaseDiariaILTDE.Value := MinFloat(TotalConsultaDE[iPosAMPO] / TotalConsultaDE[iPosDias], pTopeIBDSiniestro);
        end;
      end;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales de datos económicos.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridDERemuneracionesPaintFooter(Sender: TObject; Column: String; var Value: String;
                                                               var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMADE);
  if (iPos > -1) and (iPos <= MAXCOLSDE) then
    if iPos = 0 then
      Value := Get_AjusteDecimales(FloatToStr(TotalConsultaDE[iPos]), '', 0)
    else
      Value := Get_AjusteDecimales(FloatToStr(TotalConsultaDE[iPos]), '$');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridDERemuneracionesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key :=  PatchComma(Key);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcTotalesDatosEconomicos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesDIASChange(Sender: TField);
begin
  inherited;
  CalcTotalesDatosEconomicos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesIMPORTE_AMPOChange(Sender: TField);
begin
  inherited;
  CalcTotalesDatosEconomicos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesBeforePost(DataSet: TDataSet);
begin
  inherited;
  with sdqDERemuneracionesIMPORTE_AMPOTOPEADO do
    begin
      ReadOnly := False;
      sdqDERemuneraciones.FieldByName('IMPORTE_AMPOTOPEADO').AsCurrency :=
                         MinFloat(sdqDERemuneraciones.FieldByName('IMPORTE_INFORMADO').AsCurrency,
                                  sdqDERemuneraciones.FieldByName('IMPORTE_AMPO').AsCurrency);
      ReadOnly := True;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (Accion <> l_None) then
    DoAplicarUpdates(sdqDERemuneraciones);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sdqDERemuneraciones.Edit;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqDERemuneracionesAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoModifDatosEconomicos;
var
  bPost: Boolean;
begin
  bPost := (pcRemuneraciones.ActivePageIndex = 1) and Is_SiniPostDecreto1694(edSinFecha.Date);
  if HayRegistroActivo and (Accion = l_None) and PuedeModificarDEAprob(bPost) then
  begin
    Accion := l_Edicion;
    DoHabilitarDatosEconomicos(True);
    DoHabilitarAlta(True);
  end;
end;

{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.ValidarDatosEconomicos: Boolean;
var
  sSql: String;
  FActual, FIntegracion: TDateTime;
begin
  FActual := DBDate;

  if not edFDespidoDE.IsEmpty then
  begin
    Verificar(edFDespidoDE.Date > FActual, edFDespidoDE,
              'La fecha de despido no puede ser posterior al día de hoy.');
    Verificar(edFDespidoDE.Date < ART_MINFECHA, edFDespidoDE,
              'La fecha de despido no puede ser menor al ' + DateToStr(ART_MINFECHA) + '.');
  end;

  if edFDepositoDE.IsEmpty and
    (ValorSqlDateTimeEx('SELECT cb_fdepositoilp FROM secb_cbaseexpsin ' +
                         'WHERE cb_siniestro = :Siniestro ' +
                           'AND cb_orden = :Orden', [vSiniestro, vOrden]) <> 0) then
    Verificar(True, edFDepositoDE, 'No se puede borrar la fecha anterior.');

  if not edFDepositoDE.IsEmpty then
  begin
    FIntegracion := ValorSqlDateTimeEx('SELECT art.liq.get_fechaintegracion(:Siniestro,:Orden,:Letra) FROM DUAL',
                                       [vSiniestro, vOrden, 'A']);
    Verificar(FIntegracion = 0, edFDepositoDE,
              'No se ingresó la fecha de depósito del capital.');
    Verificar(FIntegracion > edFDepositoDE.Date, edFDepositoDE,
              'La fecha estimada de depósito no puede ser anterior a la fecha de aprobación.');
    Verificar((Now + 30) < edFDepositoDE.Date, edFDepositoDE,
              'La fecha estimada de depósito no puede ser mayor a 1 mes a partir de hoy.');
  end;

  if edFJubilacionDE.IsEmpty and
    (ValorSqlDateTimeEx('SELECT cb_fjubilacion FROM secb_cbaseexpsin ' +
                         'WHERE cb_siniestro = :Siniestro ' +
                           'AND cb_orden = :Orden', [vSiniestro, vOrden]) <> 0) then
    Verificar(True, edFJubilacionDE, 'No se puede borrar la fecha anterior.');

  Verificar(not(edFJubilacionDE.IsEmpty) and (edSinFecha.Date >= StrToDateTime(FECHA_LIQ)),
            edFJubilacionDE, 'Sólo puede ingresar la Fecha de Jubilación en siniestros anteriores al ' + FECHA_LIQ + '.');

  if not edFecRecDocILTDE.IsEmpty then
  begin
    Verificar(edFecRecDocILTDE.Date > FActual, edFecRecDocILTDE,
              'La fecha de recepción de la documentación ILT no puede ser posterior al día de hoy.');
    Verificar(edFecRecDocILTDE.Date < ART_MINFECHA, edFecRecDocILTDE,
              'La fecha de recepción de la documentación ILT no puede ser menor al ' + DateToStr(ART_MINFECHA) + '.');
  end;

  if not edFecRecDocILPDE.IsEmpty then
  begin
    Verificar(edFecRecDocILPDE.Date > FActual, edFecRecDocILPDE,
              'La fecha de recepción de la documentación ILP no puede ser posterior al día de hoy.');
    Verificar(edFecRecDocILPDE.Date < ART_MINFECHA, edFecRecDocILPDE,
              'La fecha de recepción de la documentación ILP no puede ser menor al ' + DateToStr(ART_MINFECHA) + '.');
  end;

  if not edFecRecDocMortDE.IsEmpty then
  begin
    Verificar(edFecRecDocMortDE.Date > FActual, edFecRecDocMortDE,
              'La fecha de recepción de la documentación de mortales no puede ser posterior al día de hoy.');
    Verificar(edFecRecDocMortDE.Date < ART_MINFECHA, edFecRecDocMortDE,
              'La fecha de recepción de la documentación de mortales no puede ser menor al ' + DateToStr(ART_MINFECHA) + '.');
  end;

  if not edFecRecDocContriDE.IsEmpty then
  begin
    Verificar(edFecRecDocContriDE.Date > FActual, edFecRecDocContriDE,
              'La fecha de recepción de la documentación de las contribuciones no puede ser posterior al día de hoy.');
    Verificar(edFecRecDocContriDE.Date < ART_MINFECHA, edFecRecDocContriDE,
              'La fecha de recepción de la documentación de las contribuciones no puede ser menor al ' + DateToStr(ART_MINFECHA) + '.');
  end;

  Verificar((edBaseDiariaILTDE.Value = 0) and chkBaseMopresDE.Checked, chkBaseMopresDE,
            'Solo puede seleccionar estimada si ha cargado la base diaria.');

  { a partir de aca va lo de las solapas }
  
  Verificar((pcRemuneraciones.ActivePage = tsPosteriorDecreto) and Is_SiniPostDecreto1694(edSinFecha.Date) and (edBaseDiariaPostDE.Value > 0) and
            dcVigDesdeDE.IsEmpty, dcVigDesdeDE, 'Debe ingresar la fecha de vigencia desde.');
  Verificar((pcRemuneraciones.ActivePage = tsPosteriorDecreto) and Is_SiniPostDecreto1694(edSinFecha.Date) and not(dcVigDesdeDE.IsEmpty) and
            (edBaseDiariaPostDE.Value = 0) and (edBaseDiariaPostDENoRem.Value = 0),
            edBaseDiariaPostDE, 'No se ha calculado la base diaria.');

  {if (pcRemuneraciones.ActivePage = tsPosteriorDecreto) then
  begin
    sSql := 'SELECT MAX(rm_vigenciahasta) ' +
             ' FROM sin.srm_remumaestropostdecreto ' +
            ' WHERE rm_siniestro = :sin ' +
              ' AND rm_orden = :ord ' +
              ' AND rm_id < :idrem ' +
              ' AND rm_fechabaja IS NULL';
    dMaxMin := ValorSqlDateTimeEx(sSql, [vSiniestro, vOrden, vIdRem]);
    Verificar((dMaxMin > 0) and (dcVigDesdeDE.Date <= dMaxMin), dcVigDesdeDE,
              'La vigencia desde se superpone con alguna vigencia anterior.');

    if not dcVigHastaDE.IsEmpty then
    begin
      sSql := 'SELECT MIN(rm_vigenciadesde) ' +
               ' FROM sin.srm_remumaestropostdecreto ' +
              ' WHERE rm_siniestro = :sin ' +
                ' AND rm_orden = :ord ' +
                ' AND rm_id > :idrem ' +
                ' AND rm_fechabaja IS NULL';
      dMaxMin := ValorSqlDateTimeEx(sSql, [vSiniestro, vOrden, vIdRem]);
      Verificar((dMaxMin > 0) and (dcVigHastaDE.Date >= dMaxMin), dcVigHastaDE,
                'La vigencia hasta se superpone con alguna vigencia posterior.');
    end;
  end; }

  if (pcRemuneraciones.ActivePage = tsPosteriorDecreto) then     // Pasar a Diego este cambio .. todo este if (se cambiaron los selects estos)
  begin
    sSql := 'SELECT 1 ' +
             ' FROM SIN.srm_remumaestropostdecreto a ' +
            ' WHERE a.rm_id = :idrem ' +
              ' AND EXISTS(SELECT 1 ' +
                           ' FROM SIN.srm_remumaestropostdecreto b ' +
                          ' WHERE b.rm_siniestro = a.rm_siniestro  ' +
                            ' AND b.rm_orden = a.rm_orden ' +
                            ' AND b.rm_fechabaja IS NULL ' +
                            ' AND b.rm_id <> a.rm_id ' +
                            ' AND b.rm_vigenciadesde <= a.rm_vigenciadesde ' +
                            ' AND b.rm_vigenciahasta >= ' + SqlDate(dcVigDesdeDE.Date) + ') ';

    Verificar(ExisteSqlEx(sSql, [vIdRem]), dcVigDesdeDE,
              'La vigencia desde se superpone con alguna vigencia anterior.');

    if not dcVigHastaDE.IsEmpty then
    begin
      sSql := ' SELECT 1 ' +
              ' FROM SIN.srm_remumaestropostdecreto a ' +
             ' WHERE a.rm_id = :idrem ' +
               ' AND EXISTS(SELECT 1 ' +
                            ' FROM SIN.srm_remumaestropostdecreto b ' +
                           ' WHERE b.rm_siniestro = a.rm_siniestro ' +
                             ' AND b.rm_orden = a.rm_orden ' +
                             ' AND b.rm_fechabaja IS NULL ' +
                             ' AND b.rm_id <> a.rm_id ' +
                             ' AND b.rm_vigenciadesde >= a.rm_vigenciadesde ' +
                             ' AND b.rm_vigenciadesde <= ' +  SqlDate(dcVigHastaDE.Date) + ')';

      Verificar(ExisteSqlEx(sSql, [vIdRem]), dcVigHastaDE,
                'La vigencia hasta se superpone con alguna vigencia posterior.');
    end;
  end;

  Result := True;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarRemuneracionesDatEcon(Siniestro, Orden, Recaida: Integer);
var
  sSql: String;
begin
  sSql := 'INSERT INTO SERS_RECISALASIN(RS_SINIESTRO, RS_ORDEN, RS_PERSALA, ' +
                                       'RS_DIASPER, RS_IMPOMES, RS_IMPOAMPO, ' +
                                       'RS_USUALTA, RS_FECHAALTA) ' +
                      '(SELECT :Siniestro, :Orden, RE_PERIODO, NVL(RE_DIASPER, 0), NVL(RE_IMPOMES, 0), ' +
                              'NVL(RE_IMPOAMPOTOPEADO, 0), RE_USUARIO, ACTUALDATE ' +
                         'FROM TRE_REMUNERACION ' +
                        'WHERE RE_USUARIO = :Usuario ' +
                          'AND NOT EXISTS (SELECT 1 ' +
                                            'FROM SERS_RECISALASIN ' +
                                           'WHERE RS_SINIESTRO = :Siniestro ' +
                                             'AND RS_ORDEN = :Orden ' +
                                             'AND RS_PERSALA = RE_PERIODO))';
  EjecutarSqlSTEx(sSql, [Siniestro, Orden, Sesion.UserId, Siniestro, Orden]);

  sSql := 'UPDATE SERS_RECISALASIN ' +
                'SET (RS_DIASPER, RS_IMPOMES, RS_IMPOAMPO, RS_USUMODIF, RS_FECHAMODIF) = ' +
                      '(SELECT NVL(RE_DIASPER, 0), NVL(RE_IMPOMES, 0), ' +
                              'NVL(RE_IMPOAMPOTOPEADO, 0), RE_USUARIO, ACTUALDATE ' +
                         'FROM TRE_REMUNERACION ' +
                        'WHERE RE_USUARIO = :Usuario ' +
                          'AND RE_PERIODO = RS_PERSALA) ' +
          'WHERE RS_SINIESTRO = :Siniestro ' +
            'AND RS_ORDEN = :Orden ' +
            'AND RS_PERSALA IN (SELECT RE_PERIODO ' +
                                 'FROM TRE_REMUNERACION ' +
                                'WHERE RE_USUARIO = :Usuario ' +
                                  'AND EXISTS (SELECT 1 ' +
                                                'FROM SERS_RECISALASIN ' +
                                               'WHERE RS_SINIESTRO = :Siniestro ' +
                                                 'AND RS_ORDEN = :Orden ' +
                                                 'AND RS_PERSALA = RE_PERIODO ' +
                                                 'AND (NVL(RS_DIASPER, 0) <> NVL(RE_DIASPER, 0) ' +
                                                   'OR NVL(RS_IMPOMES, 0) <> NVL(RE_IMPOMES, 0) ' +
                                                   'OR NVL(RS_IMPOAMPO, 0) <> NVL(RE_IMPOAMPOTOPEADO, 0))))';
  EjecutarSqlSTEx(sSql, [Sesion.UserId, Siniestro, Orden, Sesion.UserId, Siniestro, Orden]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarAportesDatEcon(Siniestro, Orden, Recaida: Integer);
var
  sSql: String;
  PorcEmpr, PorcTrab: Double;
begin
  with TSql.Create('SECB_CBASEEXPSIN') do
    try
      PrimaryKey.Add('CB_SINIESTRO',                Siniestro, dtNumber);
      PrimaryKey.Add('CB_ORDEN',                    Orden, dtNumber);

      GetPorcAportes('ILP', 1, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEJUBILA',                    PorcEmpr, dtNumber);
      Fields.Add('EPA_PTJUBILA',                    PorcTrab, dtNumber);

      GetPorcAportes('ILP', 2, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEINSSJP',                    PorcEmpr, dtNumber);
      Fields.Add('EPA_PTINSSJP',                    PorcTrab, dtNumber);

      GetPorcAportes('ILP', 3, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEFNEMPLEO',                  PorcEmpr, dtNumber);

      GetPorcAportes('ILP', 4, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PESFAMILIAR',                 PorcEmpr, dtNumber);

      GetPorcAportes('ILP', 5, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEANSSAL',                    PorcEmpr, dtNumber);
      Fields.Add('EPA_PTANSSAL',                    PorcTrab, dtNumber);

      GetPorcAportes('ILP', 6, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEOSOCIAL',                   PorcEmpr, dtNumber);
      Fields.Add('EPA_PTOSOCIAL',                   PorcTrab, dtNumber);

      GetPorcAportes('ILT', 1, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEJUBILA_ILT',                PorcEmpr, dtNumber);
      Fields.Add('EPA_PTJUBILA_ILT',                PorcTrab, dtNumber);

      GetPorcAportes('ILT', 2, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEINSSJP_ILT',                PorcEmpr, dtNumber);
      Fields.Add('EPA_PTINSSJP_ILT',                PorcTrab, dtNumber);

      GetPorcAportes('ILT', 3, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEFNEMPLEO_ILT',              PorcEmpr, dtNumber);

      GetPorcAportes('ILT', 4, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PESFAMILIAR_ILT',             PorcEmpr, dtNumber);

      GetPorcAportes('ILT', 5, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEANSSAL_ILT',                PorcEmpr, dtNumber);
      Fields.Add('EPA_PTANSSAL_ILT',                PorcTrab, dtNumber);

      GetPorcAportes('ILT', 6, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEOSOCIAL_ILT',               PorcEmpr, dtNumber);
      Fields.Add('EPA_PTOSOCIAL_ILT',               PorcTrab, dtNumber);

      GetPorcAportes('ILTPD', 1, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEJUBILA_ILTPD',                PorcEmpr, dtNumber);
      Fields.Add('EPA_PTJUBILA_ILTPD',                PorcTrab, dtNumber);

      GetPorcAportes('ILTPD', 2, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEINSSJP_ILTPD',                PorcEmpr, dtNumber);
      Fields.Add('EPA_PTINSSJP_ILTPD',                PorcTrab, dtNumber);

      GetPorcAportes('ILTPD', 3, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEFNEMPLEO_ILTPD',              PorcEmpr, dtNumber);

      GetPorcAportes('ILTPD', 4, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PESFAMILIAR_ILTPD',             PorcEmpr, dtNumber);

      GetPorcAportes('ILTPD', 5, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEANSSAL_ILTPD',                PorcEmpr, dtNumber);
      Fields.Add('EPA_PTANSSAL_ILTPD',                PorcTrab, dtNumber);

      GetPorcAportes('ILTPD', 6, PorcEmpr, PorcTrab);
      Fields.Add('EPA_PEOSOCIAL_ILTPD',               PorcEmpr, dtNumber);
      Fields.Add('EPA_PTOSOCIAL_ILTPD',               PorcTrab, dtNumber);

      Fields.Add('CB_IBASEDIARIA',                  edBaseDiariaILTDE.Value, dtNumber);
      Fields.Add('CB_OBRASOCIAL',                   fraOSocialDE.Codigo);
      if fraOSocialDE.IsEmpty then
        Fields.Add('CB_OBRASOCIAL_SUSS',            '')
      else
        Fields.Add('CB_OBRASOCIAL_SUSS',            fraOSocialDE.sdqDatos.FieldByName('OS_TIPO').AsString);
      Fields.Add('CB_AFJP',                         fraAFJPDE.Codigo);
      if fraAFJPDE.IsEmpty then
        Fields.Add('CB_AFJP_SUSS',                  '')
      else
        Fields.Add('CB_AFJP_SUSS',                  fraAFJPDE.sdqDatos.FieldByName('JU_TIPO').AsString);
      Fields.Add('CB_CANTHIJOS',                    edCantHijosSinDiscapDE.Value, dtNumber);
      Fields.Add('CB_CANTHIJOSDISCAP',              edCantHijosDiscapDE.Value, dtNumber);
      Fields.Add('CB_FECHADESPIDO',                 edFDespidoDE.Date, dtDate);
      Fields.Add('CB_FJUBILACION',                  edFJubilacionDE.Date, dtDate);
      Fields.Add('CB_FDEPOSITOILP',                 edFDepositoDE.Date, dtDate);
      Fields.Add('CB_FRECEPDOCUMEN',                edFecRecDocILTDE.Date, dtDate);
      Fields.Add('CB_FRECEPILP',                    edFecRecDocILPDE.Date, dtDate);
      Fields.Add('CB_FRECEPMORT',                   edFecRecDocMortDE.Date, dtDate);
      Fields.Add('CB_FRECEPCONT',                   edFecRecDocContriDE.Date, dtDate);
      Fields.Add('CB_BASE_3MOPRES',                 String(Iif(chkBaseMopresDE.Checked, 'S', 'N')));
      Fields.Add('CB_CESERENTA',                    fraCeseRentaDE.Codigo);
      Fields.AddInteger('CB_IDZONAAFIP',            fraZonaAFIPDE.Value, True);
      if fraCondicionAFIPDE.IsEmpty then
        Fields.AddInteger('CB_CONDICIONAFIP',       1, True)
      else
        Fields.AddInteger('CB_CONDICIONAFIP',       fraCondicionAFIPDE.Value, True);
      Fields.Add('CB_INCLUIRAPYCON',                String(Iif(chkApyConDE.Checked, 'S', 'N')));

      sSql := 'SELECT 1 ' +
                'FROM SECB_CBASEEXPSIN ' +
               'WHERE CB_SINIESTRO = :Siniestro ' +
                 'AND CB_ORDEN = :Orden';

      if ExisteSqlEx(sSql, [Siniestro, Orden]) then
      begin
        Fields.Add('CB_USUMODIF',                 Sesion.UserId);
        Fields.Add('CB_FMODIF',                   SQL_ACTUALDATE, False);
        SqlType := stUpdate
      end
      else begin
        Fields.Add('CB_USUALTA',                  Sesion.UserId);
        Fields.Add('CB_FPROCESO',                 SQL_ACTUALDATE, False);
        SqlType := stInsert;
      end;

      EjecutarSqlST(Sql);
    finally
      Free;
    end;

  // Grabar SDO_DOCUMUTUAL
  if not edFecRecDocILTDE.IsEmpty then
    begin
      sSql := 'UPDATE ART.SDO_DOCUMUTUAL ' +
                 'SET DO_FECHARECEPCION = :FRecepcion, ' +
                     'DO_FECHAIMPRESION = NVL(DO_FECHAIMPRESION, :FRecepcion) ' +
               'WHERE DO_SINIESTRO = :Siniestro ' +
                 'AND DO_ORDEN = :Orden ' +
                 'AND DO_RECAIDA = :Recaida ' +
                 'AND DO_DOCUMENTO IN (''117'', ''118'')';
      EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(edFecRecDocILTDE.Date),
                             TDateTimeEx.Create(edFecRecDocILTDE.Date),
                             Siniestro, Orden, Recaida]);
    end;

  if not edFecRecDocContriDE.IsEmpty then
    begin
      sSql := 'UPDATE ART.SDO_DOCUMUTUAL ' +
                 'SET DO_FECHARECEPCION = :FRecepcion, ' +
                     'DO_FECHAIMPRESION = NVL(DO_FECHAIMPRESION, :FRecepcion) ' +
               'WHERE DO_SINIESTRO = :Siniestro ' +
                 'AND DO_ORDEN = :Orden ' +
                 'AND DO_RECAIDA = :Recaida ' +
                 'AND DO_DOCUMENTO IN (''119'', ''120'')';
      EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(edFecRecDocILTDE.Date),
                             TDateTimeEx.Create(edFecRecDocILTDE.Date),
                             Siniestro, Orden, Recaida]);
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarDatosEconomicos;
begin
  if ValidarDatosEconomicos then
  begin
    BeginTrans;
    try
      DoGrabarRemuneracionesDatEcon(vSiniestro, vOrden, vRecaida);
      DoGrabarAportesDatEcon(vSiniestro, vOrden, vRecaida);
      if Is_SiniPostDecreto1694(edSinFecha.Date) and
        ((edBaseDiariaPostDE.Value > 0) or (edBaseDiariaPostDENoRem.Value > 0)) then
        DoGrabarRemuPostDecreto(vSiniestro, vOrden);
      MsgBox('Modificación efectuada correctamente', MB_ICONINFORMATION);
      CommitTrans;
      DoCargarDatosEconomicos;
      DoHabilitarAlta(False);
      Accion := l_None;
    except
      on E:Exception do
      begin
        Rollback(True);
        ErrorMsg(E, 'Error al intentar guardar los datos.');
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTDEAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.CalcTotalesAportes(sdqAportesDE: TSDQuery);
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if sdqAportesDE.Active then
        SumFields(sdqAportesDE, CAMPOS_SUMAAP, TotalConsultaAP);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales de aportes y contribuciones.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTDEAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcTotalesAportes(sdqAportesILTDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTDEPORCEMPRChange(Sender: TField);
begin
  inherited;
  CalcTotalesAportes(sdqAportesILTDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridAportesILTDEPaintFooter(Sender: TObject; Column: String; var Value: String;
                                                           var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMAAP);
  if (iPos > -1) and (iPos <= MAXCOLSAP) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsultaAP[iPos]));
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTDEAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (Accion <> l_None) then
    DoAplicarUpdates(sdqAportesILTDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTDEAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sdqAportesILTDE.Edit;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoVerificarPorcentajes(Sender: TField; sdqAportesDE: TSDQuery);
begin
  if Sender.IsNull then Sender.Value := 0;
  Verificar(Sender.Value < 0, nil, 'El porcentaje debe ser mayor o igual a 0');
  Verificar(Sender.Value >= 100, nil, 'El porcentaje debe ser menor a 100');
  Verificar((Sender.FieldName = 'PORCTRAB') and (AreIn(sdqAportesDE.FieldByName('CODIGO').AsString, ['3', '4'])),
            nil, 'No se pueden ingresar estos datos');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTDEPORCEMPRValidate(Sender: TField);
begin
  DoVerificarPorcentajes(Sender, sdqAportesILTDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILPDEAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILPDEAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcTotalesAportes(sdqAportesILPDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILPDEAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (Accion <> l_None) then
    DoAplicarUpdates(sdqAportesILPDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILPDEAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sdqAportesILPDE.Edit;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILPDEPORCEMPRChange(Sender: TField);
begin
  inherited;
  CalcTotalesAportes(sdqAportesILPDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILPDEPORCEMPRValidate(Sender: TField);
begin
  DoVerificarPorcentajes(Sender, sdqAportesILPDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.pcAportesChange(Sender: TObject);
begin
  case pcAportes.ActivePageIndex of
    ctsAportesILT:   CalcTotalesAportes(sdqAportesILTDE);
    ctsAportesILTPD: CalcTotalesAportes(sdqAportesILTPDDE);
    ctsAportesILP:   CalcTotalesAportes(sdqAportesILPDE);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GetPorcAportes(Tipo: String; Codigo: Integer; var PorcEmpr, PorcTrab: Double);
var
  sSql: String;
begin
  sSql := 'SELECT po_porcempr porcempr, po_porctrab porctrab ' +
            'FROM tpo_aportescontr ' +
           'WHERE po_usuario = :Usuario ' +
             'AND po_tipo = :Tipo ' +
             'AND po_codigo = :Codigo';

  with GetQueryEx(sSql, [Sesion.UserID, Tipo, Codigo]) do
    try
      PorcEmpr := FieldByName('PORCEMPR').AsFloat;
      PorcTrab := FieldByName('PORCTRAB').AsFloat;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridAportesILTDEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key :=  PatchComma(Key);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuImprResultadosClick(Sender: TObject);
begin
  if HayRegistroActivo and PrintDialog.Execute then
  case PageControl.ActivePageIndex of
    ctsILP        : DoImprimirGrilla(dsILP, GridILP, 'ILP');
    ctsILT        : DoImprimirGrilla(dsILT, GridILT, 'ILT');
    ctsPresMedicas: DoImprimirGrilla(dsPresMed, GridPresMed, 'Prestaciones Médicas');
    ctsOPagos     : DoImprimirGrilla(dsOPagos, GridOPagos, 'Otros Pagos');
    ctsLegales    : DoImprimirGrilla(dsLegales, GridLegales, 'Legales');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuImprLiquidacionClick(Sender: TObject);
begin
  if HayRegistroActivo then
    case PageControl.ActivePageIndex of
      ctsOPagos:  DoImprimirOPagos(sdqOPagos.FieldByName('pr_numpago').AsInteger,
                                   sdqOPagos.FieldByName('pr_estado').AsString,
                                   sdqOPagos.FieldByName('pr_cuitcuil').AsString,
                                   sdqOPagos.FieldByName('acreedor').AsString);
      ctsILP:     if (fpImprimirLiq.ShowModal = mrOk) then
                    oILP.Imprimir(edCantRec.Value, edCantRes.Value, edCantDig.Value, True);
      ctsILT:     if (fpImprimirLiq.ShowModal = mrOk) then
                    oILT.Imprimir(edCantRec.Value, edCantRes.Value, edCantDig.Value, True);
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuImprOrdenPagoClick(Sender: TObject);
begin
  if HayRegistroActivo and PrintDialog.Execute then
    case PageControl.ActivePageIndex of
      ctsILP: oILP.ImprimirOrdenDePago(2);
      ctsILT: oILT.ImprimirOrdenDePago(2);
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.ActualizarDias(edDias: TCurrencyEdit; Button: TUDBtnType);
begin
  case Button of
    btNext:
      edDias.Value := edDias.Value + 0.2;
    btprev:
      begin
        if edDias.Value >= 0.2 then
          edDias.Value := edDias.Value - 0.2;
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.udDiasILTClick(Sender: TObject; Button: TUDBtnType);
begin
  ActualizarDias(edDiasILT, Button);
  oILT.Dias := edDiasILT.Value;
  DoRefrescarILT;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.udDiasILPClick(Sender: TObject; Button: TUDBtnType);
begin
  ActualizarDias(edDiasILP, Button);
  oILP.Dias := edDiasILP.Value;
  DoRefrescarILP;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuImprRemuneracionesClick(Sender: TObject);
begin
  if fraTrabajadorSIN.edSiniestro.IsEmpty then Exit;

  with TqrRemuneraciones.Create(nil) do
  try
    Preparar(vSiniestro, vOrden);
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoImprimirOPagos(iNumLiq :Integer; sEstado, sCuitP, sEmpresaP :String);
begin
  with TfrmGeneracionOPagos.Create(Self) do
  try
    Siniestro   := vSiniestro;
    Orden       := vOrden;
    Recaida     := vRecaida;
    NumLiq      := iNumLiq;
    Estado      := sEstado;
    Cuit        := sCuitP;
    Empresa     := sEmpresaP;
    DoCargarDatos;
    ShowModal;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edNuevoImporteExit(Sender: TObject);
begin
  CalcTotalEditarImporte;
end;

procedure TfrmLiqIncapacidades.edNumFacOPExit(Sender: TObject);
begin
  if (edNumFacOP.Text <> '') then
    edNumFacOP.Text := Lpad(edNumFacOP.Text, '0', 8);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edSituFacOPExit(Sender: TObject);
begin
  if (edSituFacOP.Text <> '') then
    edSituFacOP.Text := Lpad(edSituFacOP.Text, '0', 4);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridOPagosDblClick(Sender: TObject);
begin
  if tbModificar.Enabled then tbModificarClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edLetraFacOPKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in [#8, #9, 'a', 'A', 'b', 'B', 'c', 'C', 'm', 'M']) then
    Key := #0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edSituFacOPKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in [#8, #9, '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    Key := #0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.OnMetodoPagoOPChange(Sender: TObject);
var
  bHabil :Boolean;
begin
  btnEnvioOP.Enabled  := (Accion <> l_None) and AreIn(fraMetodoPagoOP.Codigo, ['TR', 'EF', 'CH']);
  bHabil              := (Accion <> l_None) and AreIn(fraMetodoPagoOP.Codigo, ['CH', 'GI', 'TR', 'DC']);
  LockControl(fraBancoOP, not bHabil);
  fraBancoOP.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAsigFamILTClick(Sender: TObject);
begin
  if AdmiteAsignacionFamiliar('ILT', oILT.CodigoConcepto, vSiniestro, vOrden, vRecaida) and
     PermitirCargarAsignacionFamiliar(oILT.CodigoConcepto, edDesdeILT.Date, edHastaILT.Date) then
  begin
    with TfrmLiqAsigFam.Create(Self) do
    try
      Siniestro       := vSiniestro;
      Orden           := vOrden;
      Recaida         := vRecaida;
      Desde           := edDesdeILT.Date;
      Hasta           := edHastaILT.Date;
      HabilitarAlta   := True;
      TipoIncap       := 'ILT';
      IdTrabajador    := fraTrabajadorSIN.Value;
      Cuit            := fraEmpresa.CUIT;
      ImpLiquidado    := edImpLiquidadoILT.Value;
      if (ShowModal = mrOk) then
      begin
        edSalarioFamiliarILT.Value  := edAsigTotal.Value;
        with oILT.AsgnFamiliares do
        begin
          SalarioManual  := 0;
          HijoDiscapacit := AsigHijoDiscap;
          Hijo           := AsigHijo;
          Maternidad     := AsigMatern;
          Prenatal       := AsigPrenatal;
          AyudaEscolar   := AsigEscolar;
        end;
        oILT.SalarioFamiliar := edSalarioFamiliarILT.Value;
        DoRefrescarILT;
      end;
    finally
      Free;
    end
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edObservILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.Observaciones := edObservILT.Text;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.OnMetodoPagoILTChange(Sender: TObject);
var
  bHabil :Boolean;
begin
  bHabil := (Accion <> l_None) and
            ((fraTipoILT.Codigo = 'D') and AreIn(fraMetodoPagoILT.Codigo, ['GI', 'TR', 'DC', 'CH']) or
             (fraTipoILT.Codigo = 'L') and AreIn(fraMetodoPagoILT.Codigo, ['CH']));
  LockControl(fraBancoILT, not bHabil);

  fraBancoILT.Clear;
  oILT.IdBanco := 0;
  if (fraMetodoPagoILT.Codigo = 'DA') or (fraMetodoPagoILT.Codigo = 'PE') then   // por TK 52355    // 'PE' por ticket 59014
  begin
    LockControl(fraBancoILT, False);
    if (fraMetodoPagoILT.Codigo = 'PE') and (fraTipoILT.Codigo = 'L') then       // TK 60615
    begin
      fraBancoILT.Value := BANCO_SANTANDER;
      oILT.IdBanco      := BANCO_SANTANDER;
    end
    else begin
      fraBancoILT.Value := BANCO_PATAGONIA;
      oILT.IdBanco      := BANCO_PATAGONIA;
    end;
  end;

  SetEnvioFondosILT;
  SetChequeANombreILT;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraMetodoPagoILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    inherited;
    fraMetodoPagoILT.FrameExit(Sender);
    oILT.MetodoPago := fraMetodoPagoILT.Codigo;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.ValidarCuentaOP: Boolean;
var
  sSql, sTipoA :String;
begin
  sTipoA := IIF((sTipoAcr = 'BE'), 'TA', sTipoAcr);

  if (sTipoA = 'TA') then
    sSql := 'SELECT 1 ' +
             ' FROM ccp_cuentapago, scc_cuentaconcepto, ctj_trabajador ' +
            ' WHERE cp_id = cc_idcuentapago ' +
              ' AND cp_idacreedor = tj_id ' +
              ' AND cp_idacreedor = ' + SqlInt(fraTrabajadorSIN.Value)
  else if (sTipoA = 'EM') then
    sSql := 'SELECT 1 ' +
             ' FROM ccp_cuentapago, scc_cuentaconcepto, aem_empresa ' +
            ' WHERE cp_id = cc_idcuentapago ' +
              ' AND cp_idacreedor = em_id ' +
              ' AND cp_idacreedor = ' +  SqlInt(fraEmpresa.ID)
  else if (sTipoA = 'OA') then
    sSql := 'SELECT 1 ' +
             ' FROM ccp_cuentapago, scc_cuentaconcepto, spa_pagoacre ' +
            ' WHERE cp_id = cc_idcuentapago ' +
              ' AND cp_cuitcuil = pa_cuitcuil ' +
              ' AND cp_tipoacreedor = pa_acreedor ' +
              ' AND pa_fechabaja IS NULL ' +
              ' AND cp_cuitcuil = ' + SqlValue(edCuitOP.Text);

  sSql := sSql + ' AND cp_fechabaja IS NULL ' +
                 ' AND cc_fechabaja IS NULL ' +
                 ' AND cc_conceptopago = ' + SqlInt(fraConPagoOP.Value) +
                 ' AND cp_tipoacreedor = ' +  SqlValue(sTipoA);

  Result := ExisteSql(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edEnvioILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.EnvioFondos := edEnvioILT.Text;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnCuentasOPClick(Sender: TObject);
begin
  Verificar((PageControl.ActivePageIndex = ctsOPagos) and fraTipoAcreedOP.IsEmpty,
            fraTipoAcreedOP, 'Debe seleccionar el acreedor.');
  Verificar((PageControl.ActivePageIndex = ctsOPagos) and not AreIn(sTipoAcr, ['BE', 'TA', 'EM', 'OA', 'FF']),
            fraTipoAcreedOP, 'Para el tipo de acreedor seleccionado no se relacionan cuentas.');
  Verificar((PageControl.ActivePageIndex = ctsILT) and (oILT.CodigoConcepto <> CONCEPTO_ILT_PAGODIRECTO),
            fraTipoILT, 'Este tipo de liquidación no requiere cuenta bancaria.');

  with TfrmManCCP_CUENTAPAGO.Create(Self) do
  try
    case PageControl.ActivePageIndex of
      ctsOPagos:
        Execute(IIF((sTipoAcr = 'BE'), 'TA', sTipoAcr),
                IIF(AreIn(sTipoAcr, ['BE','TA']), fraTrabajadorSIN.Value,
                    IIF(sTipoAcr = 'EM', fraEmpresa.ID, ART_EMPTY_ID)),
                        IIF(sTipoAcr = 'OA', edCuitOP.Text, ''));
      ctsILT:
        begin
          Execute('TA', fraTrabajadorSIN.Value, '');
          SetEnvioFondosILT;
        end;
      ctsILP:
        begin
          Execute('TA', fraTrabajadorSIN.Value, '');
          SetEnvioFondosILP;
        end;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoNuevoDatosEcon;
var
  i, iDias :Integer;
  bPost: Boolean;
begin
  bPost := (pcRemuneraciones.ActivePageIndex = 1) and Is_SiniPostDecreto1694(edSinFecha.Date);
  if HayRegistroActivo and (Accion = l_None) and PuedeModificarDEAprob(bPost) then
  begin
    Accion := l_Alta;
    DoHabilitarDatosEconomicos(True);
    DoHabilitarAlta(True);
    fpRemuneraciones.Tag := 1;
    fpRemuDDJJ.Tag       := 1;

    if (pcRemuneraciones.ActivePageIndex = 1) and Is_SiniPostDecreto1694(edSinFecha.Date) and
       (fpRemuDDJJ.ShowModal = mrOk) then
    begin
      sdqRemuDDJJ.First;
      bCalcuPost := False;
      for i := 0 to sdqRemuDDJJ.RecordCount - 1 do
      begin
        if not EsPeriodoFechaAccidente(sdqRemuDDJJ.FieldByName('periodo').AsString, sdqRemuDDJJ.FieldByName('ex_fechaaccidente').AsDateTime) then   // Por Plan Carga Periodo de Fecha de Accidente en Datos Econ.
          if sdqRemuVarPosDecre.Locate('md_periodo', sdqRemuDDJJ.FieldByName('periodo').AsString, []) then
          begin
            iDias := Max(IIF(sdqRemuDDJJ.FieldByName('laborables').AsInteger = 0, 30,
                             sdqRemuDDJJ.FieldByName('laborables').AsInteger), 0);
            iDias := Min(Min(GetDay(LastDayOfPeriodo(sdqRemuDDJJ.FieldByName('periodo').AsString)), iDias), 30);
            dgRemuVarPosDecre.Fields[1].AsInteger    := iDias;
            dgRemuVarPosDecre.Fields[2].AsCurrency   := MaxFloat(0, sdqRemuDDJJ.FieldByName('remimponible').AsCurrency -
                                                                    sdqRemuDDJJ.FieldByName('sac').AsCurrency -
                                                                    sdqRemuDDJJ.FieldByName('vacaciones').AsCurrency);
            dgRemuVarPosDecre.Fields[3].AsCurrency   := MaxFloat(0, IIF(sdqRemuDDJJ.FieldByName('noremunerativo').IsNull,
                                                                        sdqRemuDDJJ.FieldByName('remtot').AsCurrency -
                                                                        sdqRemuDDJJ.FieldByName('remimponible').AsCurrency -
                                                                        sdqRemuDDJJ.FieldByName('sac').AsCurrency,
                                                                        sdqRemuDDJJ.FieldByName('noremunerativo').AsCurrency));
          end;
        sdqRemuDDJJ.Next;
      end;
      bCalcuPost := True;
      DoAplicarUpdates(sdqRemuVarPosDecre);      
      CalcTotalesPostDecreto;
      if dcVigDesdeDE.CanFocus then
        dcVigDesdeDE.SetFocus;
    end
    else if (pcRemuneraciones.ActivePageIndex = 0) and (fpRemuneraciones.ShowModal = mrOk) then
    begin
      sdqDERemuneraciones.First;
      for i := 0 to sdqDERemuneraciones.RecordCount - 1 do
      begin
        GridDERemuneraciones.Row := i+1;
        if sdqRemuneraciones.Locate('periodo', sdqDERemuneracionesPERIODO.AsString, []) and
          (sdqRemuneraciones.FieldByName('ev_estado').AsString = 'A') then
        begin
          GridDERemuneraciones.Fields[1].AsInteger := GetDay(LastDayOfPeriodo(sdqDERemuneracionesPERIODO.AsString));
          GridDERemuneraciones.Fields[2].AsString  := sdqRemuneraciones.FieldByName('remun').AsString;
        end;
        sdqDERemuneraciones.Next;
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
// Por Plan Carga del Periodo de Fec. Accid. en Datos Econ.
function TfrmLiqIncapacidades.EsPeriodoFechaAccidente(sPeriodoEvaluado: string; dFechaAccid: TDateTime): Boolean;
var sPeriodoAccidente: String;
begin
  sPeriodoAccidente := IntToStr(GetYear(dFechaAccid)) + LPad(IntToStr(GetMonth(dFechaAccid)), '0', 2);
  Result := (sPeriodoEvaluado = sPeriodoAccidente);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbTrabajadorClick(Sender: TObject);
begin
  with TfrmContratoTrabajador.Create(Self) do
  try
    if Self.fraTrabajadorSIN.IsSelected and Self.fraTrabajadorSIN.TieneSiniestro then
      CargarDatosTrabajador(Self.fraTrabajadorSIN.Value,
                            ValorSQLIntegerEx('SELECT rl_id ' +
                                                'FROM crl_relacionlaboral ' +
                                               'WHERE rl_contrato = :CONTRATO ' +
                                                 'AND rl_idtrabajador = :IDTRABAJADOR',
                            [Self.fraTrabajadorSIN.Contrato, Self.fraTrabajadorSIN.Value]))
    else if Self.fraTrabajadorSIN.IsSelected then
      BuscarTrabajadores(' TJ_CUIL = ' + SqlValue(Self.fraTrabajadorSIN.CUIL), ART_EMPTY_ID)
    else
      DoCargarDatos(fraEmpresa.Contrato);   // por cambio de Alvaro en unContratoTrabajador: cambió el procedimiento DoCargarDatos (parametros).

    ShowModal;
    fraTrabajadorSIN.Reload;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnCargarRemClick(Sender: TObject);
begin
  if MsgAsk('¿Confirma cargar los valores activos a los datos económicos?') then
    fpRemuneraciones.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fpRemuneracionesBeforeShow(Sender: TObject);
begin
  AbrirRemuneraciones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnCerrarRemClick(Sender: TObject);
begin
  DoHabilitarAlta(False);
  DoHabilitarDatosEconomicos(False);
  Accion := l_None;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnImprimirRemClick(Sender: TObject);
begin
  if PrintDialog.Execute then
    DoImprimirGrilla(dsRemuneraciones, dgRemuneraciones, 'Remuneraciones declaradas', pxPortrait);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAceptarImpClick(Sender: TObject);
begin
  Verificar((edCantRes.Value = 0) and (edCantRec.Value = 0),
             gbCantCopias, 'Ambas cantidades no pueden ser 0.');
  fpImprimirLiq.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnEnvioILTClick(Sender: TObject);
var
  sRecibos: string;
begin
  Verificar(oILT.MetodoPago = '', fraMetodoPagoILT, 'Primero debe seleccionar la forma de pago.');
  fpEnvioFondos.Tag := 1;
  if (fpEnvioFondos.ShowModal = mrOk) then
  begin
    if rbBancoFondos.Checked then
    begin
      oILT.TipoFondos   := fraBancoFondos.Codigo;
      oILT.CodigoFondos := fraSucursalFondos.Value;
      oILT.EnvioFondos  := fraBancoFondos.Descripcion +
                           IIF(not(fraSucursalFondos.IsEmpty), ' - SUCURSAL ' +
                           fraSucursalFondos.Descripcion + ' (' + fraSucursalFondos.Codigo + ')', '');
    end
    else if rbDelegacionFondos.Checked then
    begin
      oILT.TipoFondos   := 'D';
      oILT.CodigoFondos := fraDelegacionFondos.Value;
      oILT.EnvioFondos  := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
      oILT.DoLimpiarRecibosA;
      sRecibos          := IIF(oILT.Tipo = 'D', 'DELEGACION ' + fraDelegacionFondos.Descripcion, '');
      if (oILT.Tipo = 'D') then
        oILT.ChkOtroRec := True;
      oILT.Recibos      := sRecibos;
      oILT.OtroRec      := sRecibos;
    end
    else if rbCentralFondos.Checked then
    begin
      oILT.TipoFondos   := 'C';
      oILT.CodigoFondos := 0;
      oILT.EnvioFondos  := 'CASA CENTRAL';
      oILT.DoLimpiarRecibosA;
      sRecibos          := IIF(oILT.Tipo = 'D', 'CASA CENTRAL', '');
      if (oILT.Tipo = 'D') then
        oILT.ChkOtroRec := True;
      oILT.Recibos      := sRecibos;
      oILT.OtroRec      := sRecibos;
    end
    else begin
      oILT.DoLimpiarRecibosA;
      oILT.TipoFondos   := '';
      oILT.CodigoFondos := 0;
      oILT.EnvioFondos  := '';
      oILT.Recibos      := '';
    end;

    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraBancoFondosOnChange(Sender: TObject);
begin
  fraSucursalFondos.Clear;
  LockControl(fraSucursalFondos, fraBancoFondos.IsEmpty or
                                (fraBancoFondos.sdqDatos.FieldByName('ba_tienesucursales').AsString = 'N'));
  if fraBancoFondos.IsSelected then
    fraSucursalFondos.ExtraCondition := ' AND sb_idbanco = ' + SqlInt(fraBancoFondos.Value)
  else
    fraSucursalFondos.ExtraCondition := ' AND 1 = 2 ';
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fpEnvioFondosBeforeShow(Sender: TObject);
begin
  rbNingunoFondos.Checked := True;

  if (fpEnvioFondos.Tag = 1) then  //si estamos en ILT
  begin
    if (oILT.TipoFondos = 'D') then
    begin
      rbDelegacionFondos.Checked  := True;
      fraDelegacionFondos.Value   := oILT.CodigoFondos;
    end
    else if (oILT.TipoFondos = 'C') then
      rbCentralFondos.Checked := True
    else if (oILT.TipoFondos <> '') then
    begin
      rbBancoFondos.Checked       := True;
      fraBancoFondos.Codigo       := oILT.TipoFondos;
      fraBancoFondosOnChange(Nil); //no se porqué no hace el OnChange solo...
      if oILT.CodigoFondos > 0 then
        fraSucursalFondos.Value   := oILT.CodigoFondos;
    end
  end
  else if (fpEnvioFondos.Tag = 2) then //si estamos en ILP
  begin
    if (oILP.TipoFondos = 'D') then
    begin
      rbDelegacionFondos.Checked  := True;
      fraDelegacionFondos.Value   := oILP.CodigoFondos;
    end
    else if (oILP.TipoFondos = 'C') then
      rbCentralFondos.Checked := True
    else if (oILP.TipoFondos <> '') then
    begin
      rbBancoFondos.Checked       := True;
      fraBancoFondos.Codigo       := oILP.TipoFondos;
      fraBancoFondosOnChange(Nil); //no se porqué no hace el OnChange solo...
      if (oILP.CodigoFondos > 0) then
        fraSucursalFondos.Value   := oILP.CodigoFondos;
    end

  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.rbBancoFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitarFondos;
begin
  LockControl(fraBancoFondos, rbDelegacionFondos.Checked or rbCentralFondos.Checked or rbNingunoFondos.Checked);
  LockControl(fraSucursalFondos, True);
  LockControl(fraDelegacionFondos, rbBancoFondos.Checked or rbCentralFondos.Checked or rbNingunoFondos.Checked);
  fraBancoFondos.Clear;
  fraSucursalFondos.Clear;
  fraDelegacionFondos.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.rbDelegacionFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.rbCentralFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAceptarFondosILTClick(Sender: TObject);
begin
  if (fpEnvioFondos.Tag = 1) then  //ILT
  begin
    Verificar((AreIn(oILT.MetodoPago, ['EF', 'CH']) and rbBancoFondos.Checked) or
              ((oILT.MetodoPago = 'TR') and not(rbBancoFondos.Checked or rbNingunoFondos.Checked)),
              gbEnvioFondos, 'La forma de pago seleccionada (' + oILT.MetodoPago + ') no corresponde con ésta opción.');
    Verificar(not(fraBancoFondos.IsEmpty) and not(fraBancoILT.IsEmpty) and
              (fraBancoFondos.Value <> fraBancoILT.Value),fraBancoFondos,
              'El banco no corresponde con el seleccionado anteriormente.');
  end
  else if (fpEnvioFondos.Tag = 2) then  //ÎLP
  begin
    Verificar((AreIn(oILP.MetodoPago, ['EF', 'CH']) and rbBancoFondos.Checked) or
              ((oILP.MetodoPago = 'TR') and not(rbBancoFondos.Checked or rbNingunoFondos.Checked)),
              gbEnvioFondos, 'La forma de pago seleccionada (' + oILP.MetodoPago + ') no corresponde con ésta opción.');
    Verificar(not(fraBancoFondos.IsEmpty) and not(fraBancoILP.IsEmpty) and
              (fraBancoFondos.Value <> fraBancoILP.Value), fraBancoFondos,
              'El banco seleccionado no corresponde con el seleccionado anteriormente.');
  end;
  Verificar(rbBancoFondos.Checked and fraBancoFondos.IsEmpty, fraBancoFondos,
            'Debe seleccionar el banco.');
  Verificar(rbBancoFondos.Checked and fraSucursalFondos.IsEmpty and not(fraSucursalFondos.Locked),
            fraSucursalFondos, 'Debe seleccionar la sucursal.');
  Verificar(rbDelegacionFondos.Checked and fraDelegacionFondos.IsEmpty, fraDelegacionFondos,
            'Debe seleccionar la delegación.');

  fpEnvioFondos.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SetEnvioFondosILT;
var
  sEnvio :String;
begin
  if (Accion <> l_None) then
  begin
    btnEnvioILT.Enabled := AreIn(fraMetodoPagoILT.Codigo, ['TR', 'EF', 'CH']);
    sEnvio              := IIF((fraMetodoPagoILT.Codigo = 'DC'),
                               GetCuenta('TA', fraTrabajadorSIN.Value, 0, '', StrToInt(oILT.CodigoConcepto)), '');
    oILT.EnvioFondos    := sEnvio;
    edEnvioILT.Text     := sEnvio;
  end;
end;
{-------------------------------------------------------------------------------}
{procedure TfrmLiqIncapacidades.SetChequeANombreILT;
var
  sNombre :String;
begin
  if (Accion <> l_None) then
  begin
    if (fraTipoILT.Codigo = 'L') then
      sNombre := fraEmpresa.NombreEmpresa
    else begin
      if AreIn(fraMetodoPagoILT.Codigo, ['EF', 'CH']) or
        ((fraMetodoPagoILT.Codigo = 'TR') and AreIn(fraBancoILT.ID, [IntToStr(BANCO_PROVINCIA),
                                                                     IntToStr(BANCO_PATAGONIA)])) then
        sNombre := fraTrabajadorSIN.Nombre
      else if AreIn(fraMetodoPagoILT.Codigo, ['DC', 'TR']) then
        sNombre := IIF(fraBancoILT.IsSelected, fraBancoILT.Descripcion, '');
    end;
    oILT.ANombreDe          := sNombre;
    edChequeNombreILT.Text  := sNombre;
    oILT.IdBanco            := fraBancoILT.Value;
  end;
end;         }
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SetChequeANombreILT;
var
  sNombre, sSql :String;
begin
  if (Accion <> l_None) then
  begin
    if (fraTipoILT.Codigo = 'L') then
    begin
     // sNombre := fraEmpresa.NombreEmpresa
     // TK 39134
      if (fraMetodoPagoILT.Codigo = 'CH') then
      begin
        sSql := 'SELECT be_beneficiario ' +
                 ' FROM SIN.sbe_beneficiariosporempresa ' +
                ' WHERE be_cuit = :cuit ' +
                  ' AND be_conpago = :concepto ' +
                  ' AND be_fechabaja IS NULL ' +
                  ' AND be_autorizado = ''S'' ';
        sNombre := ValorSqlEx(sSql, [fraEmpresa.CUIT, oILT.CodigoConcepto]);

        if (sNombre = '') then
          sNombre := fraEmpresa.NombreEmpresa;
     {   else
          LockControl(edChequeNombreILT, True);   }

      end
      else
        sNombre := fraEmpresa.NombreEmpresa
    end
    else begin

    {  if AreIn(fraMetodoPagoILT.Codigo, ['EF', 'CH']) or
        ((fraMetodoPagoILT.Codigo = 'TR') and AreIn(fraBancoILT.ID, [IntToStr(BANCO_PROVINCIA),
                                                                     IntToStr(BANCO_PATAGONIA)])) then   }    // por ticket 47963

      if (fraMetodoPagoILT.Codigo <> '') and (fraBancoILT.ID <> '') and (ValorSql('SELECT art.dinerarias.is_chequealtrabajador(' + SqlValue(fraMetodoPagoILT.Codigo) + ',' + SqlValue(fraBancoILT.ID) + ') from dual ') = 'S') then
        sNombre := fraTrabajadorSIN.Nombre
      else if AreIn(fraMetodoPagoILT.Codigo, ['DC', 'TR']) then
        sNombre := IIF(fraBancoILT.IsSelected, fraBancoILT.Descripcion, '');
    end;
    oILT.ANombreDe          := sNombre;
    edChequeNombreILT.Text  := sNombre;
    oILT.IdBanco            := fraBancoILT.Value;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.NuevoILP(iSiniestro, iOrden, iRecaida: integer; var ObjILP: TILP): Boolean;
var
  bContinuar: Boolean;
begin
  DoCrearObjILP(iSiniestro, iOrden, iRecaida, 0, ObjILP);
  ObjILP.EstadoOperacion := eoEstadoAlta;

  bContinuar := ObjILP.PermitirLiquidarDesdeSistema(True) and DoCargarDictamenes(False);

  if bContinuar then
  begin
    if not ObjILP.Expediente.TrabajadorDeclarado then
      MsgBox('El empleador omitió declarar su obligación de pago.' + CRLF + 'Pagos a recuperar del empleador.', MB_ICONEXCLAMATION + MB_OK);

    if (ObjILP.BaseDiaria = 0) and (ObjILP.BaseDiariaNoRem = 0) {and not(ObjILP.IsPagoUnico)} then      // comentado por ticket 43610
      ObjILP.Error := 'Falta calcular la Base Diaria. No podrá liquidar hasta completarla.';

    if ObjILP.Error <> '' then
    begin
      if pSuperUser then
      begin
        if MsgBox(ObjILP.Error + CRLF + '¿Continúa de todos modos?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
          ObjILP.Error := ''
        else
          bContinuar := False;
      end
      else begin
        MsgBox(ObjILP.Error, MB_ICONEXCLAMATION + MB_OK);
        bContinuar := False;
      end;
    end;
  end;

  if bContinuar then
    ObjILP.EstadoOperacion := eoEstadoAlta;

  Result := bContinuar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoNuevoILP;
var sIsBloqueoDin, sSql: string;
    iIdCasoJudicial: integer;
begin
  if Es_PagoJudicial then     // Por Plan de Pagos Judiciales
  begin
    sIsBloqueoDin := Get_IsBloqueoDinerarias;
    Verificar((sIsBloqueoDin = 'S'), nil, 'No se puede liquidar ya que corresponde a un Pago Judicial y falta aprobación de Legales.');
  end;

  if NuevoILP(vSiniestro, vOrden, vRecaida, oILP) then
  begin
    Accion := l_Alta;
    DoHabilitarILP(True);
    DoHabilitarAlta(True);
    DoRefrescarILP;
  end
  else
    DoHabilitarAlta(False);

  // Por Plan de Pagos Judiciales
  if (sIsBloqueoDin = 'N') then
  begin
    iIdCasoJudicial := Get_IdCasoJudicial;
    if (iIdCasoJudicial > 0) then
    begin
      sSql := 'SELECT pj_estado, pj_decisionlegales FROM SIN.spj_pagosjudiciales WHERE pj_id = ' + SqlInt(iIdCasoJudicial);
      with GetQuery(sSql) do
      try
        if not Eof then
        begin
          // si es un caso judicial "Aprobado" y la decision de legales es "Si corresponde", entonces carga los campos de la tabla SPJ
          // (los Vencidos y No corresponde, siguen de largo, quedan en estado Normal)
          if ((FieldByName('PJ_ESTADO').AsString = 'A') and (FieldByName('PJ_DECISIONLEGALES').AsString = 'S')) then
            Do_CargarCamposDeLegales;
        end;
      finally
        Free;
      end;
    end;
  end;

end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.AbrirRemuneraciones;
var
  sSql: String;
begin
  btnCargarRem.Visible := (fpRemuneraciones.Tag = 1);
  {sSql := 'SELECT dj_periodo periodo, dj_fechapresentacion fecha, dt_remuneracion remun, ' +
                ' dt_diaslaborales dias, dt_sac sac, ev_descripcion estado, ' +
                ' dj_codigorectificativaoriginal rectifica, ev_estado ' +
           ' FROM emi.idt_ddjjtrabajador, emi.iev_estadoverificado, emi.idj_ddjj ' +
          ' WHERE dt_idddjj = dj_id ' +
            ' AND ev_id = dj_estado ' +
            ' AND dj_cuit = :cuit ' +
            ' AND dt_cuil = :cuil ' +
           'ORDER BY 1 ';}


  sSql := 'SELECT *' +
          '  FROM (SELECT rg_periodo periodo, rg_fechaalta fecha, rg_montorem remun, rg_diastrabajados dias, (SELECT' +
          '                                                                                                          SUM(rg_montorem)' +
          '                                                                                                     FROM din.drg_remuneracion_gpba c' +
          '                                                                                                    WHERE a.rg_cuil = c.rg_cuil' +
          '                                                                                                      AND a.rg_cuit = c.rg_cuit' +
          '                                                                                                      AND a.rg_periodo = c.rg_periodo' +
          '                                                                                                      AND NVL(c.rg_sac, 0) > 0) sac,' +
          '       ''Activo'' estado, TO_CHAR(NULL) rectifica, TO_CHAR(NULL) ev_estado, rg_cuit cuit, rg_cuil cuil, ''N'' ddjj' +
          '  FROM din.drg_remuneracion_gpba a, aem_empresa, art.sex_expedientes' +
          ' WHERE rg_cuit = em_cuit' +
          '   AND rg_cuit = ex_cuit' +
          '   AND rg_cuil = ex_cuil' +
          '   AND NVL(em_idgrupoeconomico, 0) = 87 ' +

          '   AND NVL(rg_sac, 0) = 0' +
          '   AND rg_rectificativa = (SELECT MAX(b.rg_rectificativa)' +
          '                             FROM din.drg_remuneracion_gpba b' +
          '                            WHERE a.rg_cuil = b.rg_cuil' +
          '                              AND a.rg_cuit = b.rg_cuit' +
          '                              AND a.rg_periodo = b.rg_periodo' +
          '                              AND NVL(b.rg_sac, 0) = 0)' +
          '   AND ex_id = :idexpediente' +
          '   AND art.dinerarias.get_declararemungpba(:idexpediente, ''N'') = ''S'' ' +
          'UNION ALL ' +
          'SELECT dj_periodo periodo, dj_fechapresentacion fecha, dt_remuneracion remun, dt_diaslaborales dias, dt_sac sac, ev_descripcion estado, ' +
          '       dj_codigorectificativaoriginal rectifica, ev_estado, dj_cuit cuit, dt_cuil cuil, ''S'' ddjj' +
          '  FROM emi.idt_ddjjtrabajador, emi.iev_estadoverificado, emi.idj_ddjj, aem_empresa, art.sex_expedientes' +
          ' WHERE dt_idddjj = dj_id' +
          '   AND ev_id = dj_estado' +
          '   AND dj_cuit = em_cuit' +
          '   AND dj_cuit = ex_cuit' +
          '   AND dt_cuil = ex_cuil' +
          '   AND ex_id = :idexpediente' +
          '   AND art.dinerarias.get_declararemungpba(:idexpediente, ''N'') = ''N'')' +
          ' ORDER BY 1';

  with sdqRemuneraciones do
  begin
    Close;
    SQL.Text := sSql;
    ParamByName('idexpediente').AsInteger := vIdExpediente;
    Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.rbRemActualClick(Sender: TObject);
begin
  AbrirRemuneraciones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.rbRemOriginalClick(Sender: TObject);
begin
  AbrirRemuneraciones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edHastaILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    inherited;
    oILP.Hasta := edHastaILP.Date;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edDesdeILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    inherited;
    oILP.Desde := edDesdeILP.Date;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarILP(Confirmar: Boolean; ObjILP: TILP; iSiniestro, iOrden, iRecaida: Integer; aAccion: TAccionLiq; var iResValida:integer; bConTransaccion: Boolean = True);
var
  sTipoSuss, sEstadoPJ: String;
  bSeguir, guardado: Boolean;
  cEmbargo, cEmbargoRemun, cEmbargoNoRemun: Currency;
  iIdCasoJud: integer;
begin
  guardado := False;
  if ((aAccion = l_Alta) and ObjILP.Cambios) or (aAccion = l_Clonacion) then
  begin
    bSeguir := not Confirmar or (MsgBox('Se han producido cambios en los datos.' + CRLF + '¿Quiere grabarlos?', MB_ICONQUESTION + MB_YESNO) = IDYES);

    if bSeguir and ObjILP.PermitirLiquidarDesdeSistema(True) then
    begin
      iResValida := ObjILP.Validar;

      if (aAccion = l_Clonacion) then
      begin
        if (ObjILP.BaseDiaria <> oILP.BaseDiaria)           or
           (ObjILP.BaseDiariaNoRem <> oILP.BaseDiariaNoRem) or
           (ObjILP.PorcContrib <> oILP.PorcContrib)       or
           (ObjILP.PorcAportes <> oILP.PorcAportes)       then
        begin
          iResValida   := 2;
          ObjILP.Error := 'Los siniestros deben tener los mismos valores en: Base Diaria, Porcentajes de Aportes y Contribuciones';
        end;
      end;

      if iResValida = 1 then    // dio algún tipo de error por CUIL inconsistente
        sTipoSuss := ObjILP.Expediente.TipoSussVigente;

      if iResValida <> 2 then   // si no es alguna validación que requiera el dato obligatoriamente siempre
        if ((iResValida = 1) and (sTipoSuss = '2')) or (((iResValida = 0) or (iResValida = 1)) and pSuperUser) or (iResValida = 3) then
          iResValida := Iif(MsgBox(ObjILP.Error + CRLF + '¿Continúa de todos modos?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES, -1, 0);

      cEmbargoRemun   := ObjILP.ImporteEmbargoRemun;
      cEmbargoNoRemun := ObjILP.ImporteEmbargoNoRemun;
      cEmbargo        := cEmbargoRemun + cEmbargoNoRemun;

      if iResValida <> -1 then
        MsgBox(ObjILP.Error, MB_ICONEXCLAMATION + MB_OK)
      else
      begin
        try
          BeginTrans;
          with TfrmDireccionCDO.Create(nil) do
          begin
            try
              if ObjILP.Grabar(aAccion, false, tTipoCheck) then    // TK 44193
              begin

                {with sdqCasosActivosPD do
                begin
                  Close;
                  ParamByName('idtipocaso').AsInteger := 3;
                  ParamByName('idexped').AsInteger := vIdExpediente;
                  Open;
                end;

                if sdqCasosActivosPD.RecordCount > 0 then
                begin

                  if sdqCasosActivosPD.RecordCount > 1 then
                  begin
                    bSeguir2 := (fpCasosActivosPD.ShowModal = mrOk);
                    sIdCasoARelacionar := cbCasosARelacionar.FieldValue;
                  end
                  else
                    if sdqCasosActivosPD.RecordCount = 1 then
                      sIdCasoARelacionar := sdqCasosActivosPD.FieldByName('idcaso').AsString;

                  if bSeguir2 then
                    EjecutarSqlSTEx('UPDATE din.dcl_casosparaliquidar SET cl_idestado = 16, ' +
                                    '       cl_idliquidacion = :idliq, ' +
                                    '       cl_anticipo = :anticipo, ' +
                                    '       cl_usumodif = :usuario, ' +
                                    '       cl_fechamodif = SYSDATE' +
                                    ' WHERE cl_id = :idcaso', [ObjILP.IdLiquidacion, IIF(oILP.GenerarAnticipo, 'S', 'N'),
                                    Sesion.UserID, sIdCasoARelacionar]);
                end;}

                bSeguir := doSeleccionarCasoPuestaDisp(3, ObjILP.IdLiquidacion);

                if bSeguir and Mostrar(vIdExpediente, ObjILP.NroLiquidacion, 'ILP', oOtros, Dictamenes[rgDictamenes.ItemIndex].Id) then
                begin
                  DoEvaluarCompensacion(ObjILP.NroLiquidacion, ObjILP.TotalAPagar);   // por Plan Registro de pagos cancelados

                  DoImprimirCompensacionYaRealizada(iSiniestro, iOrden, iRecaida, false); // Evalúa si hubo una compensacion y ya se compenso todo, entonces pregunta si desea imprimir las liquidaciones compensadas (por Plan Registro de Pagos Cancelados).

                  {if ObjILP.GeneraComBancaria then
                    DoGenerarOPAutomatica(iSiniestro, iOrden, iRecaida, ObjILP.MetodoPago,
                                          IntToStr(ObjILP.NroLiquidacion), 'TA',
                                          ObjILP.Expediente.Trabajador.Cuil, 'A', '0001', '00000001',
                                          '', '', 'N', ObjILP.Delegacion, '', ObjILP.EnvioFondos, 'ILP.',
                                          ObjILP.Expediente.Trabajador.Nombre, '', '', DBDate, DBDate,
                                          0, 0, 0, ObjILP.IdBanco, ComBanco, 0, 0, 0, 0, 0, 0, 0, 0,
                                          True, False, False, False, False, False);}

                  // Por Plan de Pagos Judiciales (pone  la "L" en pj_estado, si corresponde) y guarda el pj_id en el campo le_idpagojudicial
                  if Es_PagoJudicial and (Get_IsBloqueoDinerarias = 'N') then
                  begin
                    iIdCasoJud := Get_IdCasoJudicial;
                    sEstadoPJ  := ValorSqlEx('SELECT pj_estado FROM SIN.spj_pagosjudiciales WHERE pj_id = :id', [iIdCasoJud]);
                    if (sEstadoPJ = 'A') then
                    begin
                      Do_UpdateEstadoPagoJudicial(iIdCasoJud);  // guarda la "L"
                      Do_UpdateIDPagoJudicial_SLE(ObjILP.NroLiquidacion, iSiniestro, iOrden, iRecaida, iIdCasoJud);
                    end;
                  end;
                  guardado := true;

                end
                else
                  Rollback;

              end
              else
              begin
                Rollback;
                if ObjILP.Error <> '' then
                  MsgBox(ObjILP.Error, MB_ICONEXCLAMATION + MB_OK);
              end;

            finally
              Free;
            end;
          end;

          if guardado then
          begin
            if (cEmbargo > 0) and ((iResValida = -1) or (ObjILP.TotalAPagar <= 0)) then
              DoGrabarEmbargo(ObjILP, cEmbargoRemun, cEmbargoNoRemun);

            if (MsgBox('Alta efectuada correctamente' + #13 +'¿Quiere imprimir la liquidación ahora?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
            begin
              DoCrearObjILP(iSiniestro, iOrden, iRecaida, ObjILP.NroLiquidacion, ObjILP); // para que se actualicen todas las propiedades antes de imprimir
              if (fpImprimirLiq.ShowModal = mrOk) then
                ObjILP.Imprimir(edCantRec.Value, edCantRes.Value, edCantDig.Value, True, false);
            end;

            if (iResValida = -1) then
            begin
              Accion := l_None;
              DoCargarILP;
              DoHabilitarAlta(False);
            end;
            CommitTrans;
          end;

        except
          on e:exception do
          begin
            ErrorMsg(e, e.Message);
            Rollback;
          end;
        end;
      end;

    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SetEnvioFondosILP;
var
  sEnvio :String;
begin
  if (Accion <> l_None) then
  begin
    btnEnvioILP.Enabled := AreIn(fraMetodoPagoILP.Codigo, ['TR', 'EF', 'CH', 'DC']);
    sEnvio              := IIF((fraMetodoPagoILP.Codigo = 'DC'),
                               GetCuenta('TA', fraTrabajadorSIN.Value, 0, '', StrToInt(oILP.CodigoConcepto)), '');
    oILP.EnvioFondos    := sEnvio;
    edEnvioILP.Text     := sEnvio;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.OnMetodoPagoILPChange(Sender: TObject);
var
  bHabil :Boolean;
begin
  bHabil := (Accion <> l_None) and AreIn(fraMetodoPagoILP.Codigo, ['GI', 'TR', 'DC', 'CH', 'DA']);   // Agrego el 'DA' por ticket 52355
  LockControl(fraBancoILP, not bHabil);
  fraBancoILP.Clear;
  oILP.IdBanco := 0;
  if (fraMetodoPagoILP.Codigo = 'DA') then   // por TK 52355
  begin
    fraBancoILP.Value := BANCO_PATAGONIA;
    oILP.IdBanco      := BANCO_PATAGONIA;
  end;
  SetEnvioFondosILP;
  SetChequeANombreILP;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SetChequeANombreILP;
var
  sNombre :String;
begin
  if (Accion <> l_None) then
  begin
 {   if AreIn(fraMetodoPagoILP.Codigo, ['EF', 'CH']) or
       ((fraMetodoPagoILP.Codigo = 'TR') and AreIn(fraBancoILP.ID, [IntToStr(BANCO_PROVINCIA),
                                                                    IntToStr(BANCO_PATAGONIA)])) then   }   // por ticket 47963

   // if EsChequeANombreTrabajador(fraMetodoPagoILP.Codigo, fraBancoILP.ID) then

    if (fraMetodoPagoILP.Codigo <> '') and (fraBancoILP.ID <> '') and (ValorSql('SELECT art.dinerarias.is_chequealtrabajador(' + SqlValue(fraMetodoPagoILP.Codigo) + ',' + SqlValue(fraBancoILP.ID) + ') from dual ') = 'S') then
      sNombre := fraTrabajadorSIN.Nombre
    else if AreIn(fraMetodoPagoILP.Codigo, ['DC', 'TR']) then
      sNombre := IIF(fraBancoILP.IsSelected, fraBancoILP.Descripcion, '');

    oILP.ANombreDe          := sNombre;
    edChequeNombreILP.Text  := sNombre;
    oILP.IdBanco            := fraBancoILP.Value;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraMetodoPagoILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    inherited;
    fraMetodoPagoILP.FrameExit(Sender);
    oILP.MetodoPago := fraMetodoPagoILP.Codigo;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraDelegacionILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    inherited;
    fraDelegacionILP.FrameExit(Sender);
    oILP.Delegacion := fraDelegacionILP.Codigo;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edEnvioILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    inherited;
    oILP.EnvioFondos := edEnvioILP.Text;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnEnvioILPClick(Sender: TObject);
begin
  Verificar(oILP.MetodoPago = '', fraMetodoPagoILP, 'Primero debe seleccionar la forma de pago.');
  fpEnvioFondos.Tag := 2;
  if (fpEnvioFondos.ShowModal = mrOk) then
  begin
    if rbBancoFondos.Checked then
    begin
      oILP.TipoFondos   := fraBancoFondos.Codigo;
      oILP.CodigoFondos := fraSucursalFondos.Value;
      oILP.EnvioFondos  := fraBancoFondos.Descripcion +
                           IIF(not(fraSucursalFondos.IsEmpty), ' - SUCURSAL ' +
                           fraSucursalFondos.Descripcion + ' (' + fraSucursalFondos.Codigo + ')', '');
    end
    else if rbDelegacionFondos.Checked then
    begin
      oILP.TipoFondos   := 'D';
      oILP.CodigoFondos := fraDelegacionFondos.Value;
      oILP.EnvioFondos  := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
      oILP.Recibos      := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
      oILP.DoLimpiarRecibosA;
      oILP.ChkOtroRec      := True;
      oILP.OtroRec         := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
    end
    else if rbCentralFondos.Checked then
    begin
      oILP.TipoFondos   := 'C';
      oILP.CodigoFondos := 0;
      oILP.EnvioFondos  := 'CASA CENTRAL';
      oILP.Recibos      := 'CASA CENTRAL';
      oILP.DoLimpiarRecibosA;
      oILP.ChkOtroRec      := True;
      oILP.OtroRec         := 'CASA CENTRAL';
    end
    else begin
      oILP.DoLimpiarRecibosA;
      oILP.TipoFondos   := '';
      oILP.CodigoFondos := 0;
      oILP.EnvioFondos  := '';
      oILP.Recibos      := '';
    end;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edChequeNombreILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILP.ANombreDe := edChequeNombreILP.Text;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edObservILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILP.Observaciones := edObservILP.Lines.Text;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edSalarioFamiliarILTEnter(Sender: TObject);
begin
  vSalFamiliar := edSalarioFamiliarILT.Value;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.DoCargarDictamenes(bSoloDefyTot: Boolean) :Boolean;
var
  sSql, sDescr :String;
  i :Integer;
begin
  sSql := 'SELECT da_idexpediente, da_idevento, da_codigo, da_expediente, da_fecha, ' +
                ' da_porcentaje, da_grado, da_caracter, da_fechadesde, da_fechahasta ' +
           ' FROM art.sda_dictamenesautorizados ' +
          ' WHERE da_idexpediente = :idexpediente ';
  if bSoloDefyTot then
    sSql := sSql + ' AND ((da_porcentaje > 50) OR (da_grado = ''T'')) ' +
                    ' AND da_caracter = ''D'' ';

  gbConceptoPago.Enabled      := not(bSoloDefyTot);
  chkConceptoAnticipo.Enabled := not(bSoloDefyTot);

  with GetQueryEx(sSql, [vIdExpediente]) do
  try
    if Eof then
    begin
      MsgBox('El siniestro no posee dictámenes en condiciones de ser liquidados.', MB_ICONEXCLAMATION);
      Result := False;
    end
    else begin
      rgDictamenes.Items.Clear;
      SetLength(Dictamenes, RecordCount);
      for i := 0 to RecordCount - 1 do
      begin
        sDescr := 'Dict. ' + FieldByName('da_codigo').AsString + ': ' + FieldByName('da_fecha').AsString + ' - ' +
                  FieldByName('da_porcentaje').AsString + '% - ' + FieldByName('da_grado').AsString +
                  FieldByName('da_caracter').AsString + ' - Desde: ' + FieldByName('da_fechadesde').AsString + 
                  IIF(FieldByName('da_fechahasta').IsNull, '', '- Hasta: ' + FieldByName('da_fechahasta').AsString) +
                  IIF(FieldByName('da_expediente').IsNull, '', '- Exped.: ' + FieldByName('da_expediente').AsString);
        Dictamenes[i].Id          := FieldByName('da_idevento').AsInteger;
        Dictamenes[i].Codigo      := FieldByName('da_codigo').AsString;
        Dictamenes[i].Fechadesde  := FieldByName('da_fechadesde').AsDateTime;
        Dictamenes[i].Fechahasta  := FieldByName('da_fechahasta').AsDateTime;
        Dictamenes[i].Grado       := FieldByName('da_grado').AsString;
        Dictamenes[i].Caracter    := FieldByName('da_caracter').AsString;
        Dictamenes[i].Porcentaje  := FieldByName('da_porcentaje').AsCurrency;
        rgDictamenes.Items.Add(sDescr);
        Next;
      end;
      Result := (fpDictamenes.ShowModal = mrOk);
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fpDictamenesBeforeShow(Sender: TObject);
var
  i: Integer;
  bFechaPosterior :Boolean;
begin
  bFechaPosterior := (edSinFecha.Date >= StrToDateTime(FECHA_LIQ));

  if gbConceptoPago.Enabled then //significa que estoy en el alta de una liquidacion
  begin
    for i := 0 to rgDictamenes.Items.Count - 1 do
    begin
      if Dictamenes[i].Id = oILP.IdEvento then
        rgDictamenes.ItemIndex := i;
    end;
    rbConceptoPagoUnico.Enabled := (edSinFecha.Date >= StrToDate(FECHA_LIQ)) and not(oILP.ExisteLiqPagoUnico);
    rbConceptoAnticipo.Enabled  := not bFechaPosterior;
    rbConceptoRentaPer.Enabled  := not bFechaPosterior;
    rbConceptoPagoUnico.Enabled := bFechaPosterior;
    rbConceptoRentaDev.Enabled  := bFechaPosterior;
  end;

  if bFechaPosterior then
  begin
    rbConceptoIndemnizacion.Tag := 4;
    rbConceptoDifRentaPer.Tag   := 7;
  end
  else begin
    rbConceptoIndemnizacion.Tag := 8;
    rbConceptoDifRentaPer.Tag   := 9;
  end;
  DoLimpiarConceptos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAceptarDicClick(Sender: TObject);
var
  gradocar, mensaje: String;
  porcinca: Currency;
  bes5065: Boolean;
begin
  Verificar(rgDictamenes.ItemIndex = -1, rgDictamenes, 'Debe seleccionar un dictamen.');

  if gbConceptoPago.Enabled then //significa que estoy en el alta de la liquidacion
  begin
    gradocar  := Dictamenes[rgDictamenes.ItemIndex].Grado + Dictamenes[rgDictamenes.ItemIndex].Caracter;
    porcinca  := Dictamenes[rgDictamenes.ItemIndex].Porcentaje;
    bEs5065   := ((gradocar = 'PP') or (gradocar = 'PD')) and (porcinca <= 66) and
                ((porcinca > 50) or ((porcinca = 50) and (edSinFecha.Date >= StrToDate(FECHA_LIQ))));

    if IsConceptoSel then
    begin
      if chkConceptoAnticipo.Checked and not(rbConceptoPagoUnico.Checked or rbConceptoIndemnizacion.Checked) then
        mensaje := 'El anticipo sólo corresponde con Suma Fija ó Indemnización.'
      else if (gradocar = 'PD') and bEs5065 and rbConceptoRentaPer.Checked then
        mensaje := 'Para el dictamen seleccionado, el concepto no puede ser Renta Periódica.'
      else if (gradocar = 'PD') and not(bEs5065) and not(rbConceptoAnticipo.Checked or rbConceptoIndemnizacion.Checked) then
        mensaje := 'Para el dictamen seleccionado, solamente se puede seleccionar Anticipo ó Indemnización.'
      else if
        ((gradocar <> 'PD') and (rbConceptoAsignFamiliar.Checked or rbConceptoRentaDev.Checked or rbConceptoDifRentaPer.Checked)) or
        (((gradocar = 'GD') or (gradocar = 'PP')) and not(rbConceptoPagoUnico.Checked or rbConceptoAnticipo.Checked or rbConceptoIndemnizacion.Checked)) or
        ((gradocar = 'TD') and not(rbConceptoPagoUnico.Checked or rbConceptoAnticipo.Checked or rbConceptoIndemnizacion.Checked)) or
        (((gradocar = 'GP') or (gradocar = 'TP')) and not(rbConceptoAnticipo.Checked)) then
        mensaje := 'El dictamen seleccionado no corresponde con el concepto de pago.'
      else if rbConceptoAsignFamiliar.Checked then
        mensaje := GetValidaAsigFamiliar
      else if rbConceptoDifRentaPer.Checked and
             (ValorSqlDateTimeEx('SELECT cb_fjubilacion ' +
                                  ' FROM secb_cbaseexpsin ' +
                                  'WHERE cb_siniestro = :Siniestro ' +
                                    'AND cb_orden = :Orden', [vSiniestro, vOrden]) = 0) and
             (ValorSqlDateTimeEx('SELECT art.liq.get_fechaintegracion(:sin, :ord, :letra) ' +
                                  ' FROM dual', [vSiniestro, vOrden, 'D']) = 0) then
        mensaje := 'Todavía no se ingresó la fecha de depósito.';

      if (mensaje <> '') then
      begin
        DoLimpiarConceptos;
        Verificar(True, gbConceptoPago, mensaje);
      end;
    end;

    edHastaILP.Clear;
    edDesdeILP.Clear;
    oILP.CheckPeriodo(False);
    oILP.GenerarPagoUnico     := rbConceptoPagoUnico.Checked;
    oILP.LiqIndemnizacion     := rbConceptoIndemnizacion.Checked;
    oILP.GenerarAnticipo      := rbConceptoAnticipo.Checked or chkConceptoAnticipo.Checked;
    oILP.LiqRentaPeriodica    := rbConceptoRentaPer.Checked;
    oILP.LiqAsigFamiliar      := rbConceptoAsignFamiliar.Checked;
    oILP.LiqRtaDevengada      := rbConceptoRentaDev.Checked;
    oILP.LiqDifRtaPeriodica   := rbConceptoDifRentaPer.Checked;
    oIlP.IdTipo               := GetIdTipo;
    SetLblTipoLiq;
    oILP.SetIncapacidad(Dictamenes[rgDictamenes.ItemIndex].Id,
                        Dictamenes[rgDictamenes.ItemIndex].Codigo,
                        Dictamenes[rgDictamenes.ItemIndex].Grado,
                        Dictamenes[rgDictamenes.ItemIndex].Caracter,
                        Dictamenes[rgDictamenes.ItemIndex].Porcentaje,
                        Dictamenes[rgDictamenes.ItemIndex].Fechadesde,
                        Dictamenes[rgDictamenes.ItemIndex].Fechahasta);
    DoRefrescarILP;
    edTipoILP.Hint := 'Dictamen: ' + rgDictamenes.Items.Strings[rgDictamenes.ItemIndex];
  end;
  fpDictamenes.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edSalarioFamiliarILPExit(Sender: TObject);
begin
  if (Accion <> l_None) and (vSalFamiliar <> edSalarioFamiliarILP.Value) then
  begin
    oILP.AsgnFamiliares.SalarioManual := edSalarioFamiliarILP.Value;
    oILP.SalarioFamiliar              := edSalarioFamiliarILP.Value;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edSalarioFamiliarILPEnter(Sender: TObject);
begin
  vSalFamiliar := edSalarioFamiliarILP.Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbRemuneracionesClick(Sender: TObject);
begin
  if not fraTrabajadorSIN.edSiniestro.IsEmpty then
  begin
    fpRemuneraciones.Tag := 0;
    fpRemuneraciones.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edImpLiquidadoILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILP.ImporteLiquidado := edImpLiquidadoILP.Value;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.rgDictamenesClick(Sender: TObject);
begin
  DoLimpiarConceptos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoLimpiarConceptos;
begin
  rbConceptoPagoUnico.Checked     := False;
  rbConceptoAnticipo.Checked      := False;
  rbConceptoRentaPer.Checked      := False;
  rbConceptoIndemnizacion.Checked := False;
  rbConceptoAsignFamiliar.Checked := False;
  rbConceptoRentaDev.Checked      := False;
  rbConceptoDifRentaPer.Checked   := False;
  chkConceptoAnticipo.Checked     := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAsigFamILPClick(Sender: TObject);
begin
  if AdmiteAsignacionFamiliar('ILP', oILP.CodigoConcepto, vSiniestro, vOrden, vRecaida) and
     PermitirCargarAsignacionFamiliar(oILP.CodigoConcepto, edDesdeILP.Date, edHastaILP.Date) then
  begin
    with TfrmLiqAsigFam.Create(Self) do
    try
      Siniestro       := vSiniestro;
      Orden           := vOrden;
      Recaida         := vRecaida;
      Desde           := edDesdeILP.Date;
      Hasta           := edHastaILP.Date;
      HabilitarAlta   := True;
      TipoIncap       := 'ILP';
      IdTrabajador    := fraTrabajadorSIN.Value;
      Cuit            := fraEmpresa.CUIT;
      ImpLiquidado    := edImpLiquidadoILP.Value;
      if (ShowModal = mrOk) then
      begin
        edSalarioFamiliarILP.Value  := edAsigTotal.Value;
        with oILP.AsgnFamiliares do
        begin
          SalarioManual  := 0;
          HijoDiscapacit := AsigHijoDiscap;
          Hijo           := AsigHijo;
          Maternidad     := AsigMatern;
          Prenatal       := AsigPrenatal;
          AyudaEscolar   := AsigEscolar;
        end;
        oILP.SalarioFamiliar := edSalarioFamiliarILP.Value;
        DoRefrescarILP;
      end;
    finally
      Free;
    end
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.IsConceptoSel :Boolean;
begin
  Result := (rbConceptoPagoUnico.Checked or rbConceptoAnticipo.Checked or
             rbConceptoRentaPer.Checked  or rbConceptoIndemnizacion.Checked or
             rbConceptoAsignFamiliar.Checked or rbConceptoRentaDev.Checked or
             rbConceptoDifRentaPer.Checked);
end;

{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.GetValidaAsigFamiliar :String;
var
  sSql, sRes :String;
begin
  // compañia de seguro de retiro
  sSql := 'SELECT cb_seguroretiro ' +
           ' FROM secb_cbaseexpsin ' +
          ' WHERE cb_siniestro = :Sin ' +
            ' AND cb_orden = :Ord ';
  if IsEmptyString(ValorSqlEx(sSql, [vSiniestro, vOrden])) then
    sRes := 'No se ha especificado la Compañía de Seguro de Retiro'
  else begin
    // cuit de la compañia de seguros de retiro
    sSql := 'SELECT ur_cuit ' +
             ' FROM secb_cbaseexpsin, sur_seguroretiro ' +
            ' WHERE cb_siniestro = :Sin ' +
              ' AND cb_orden = :Ord ' +
              ' AND cb_seguroretiro = ur_codigo ';
    if IsEmptyString(ValorSqlEx(sSql, [vSiniestro, vOrden])) then
      sRes := 'No se ha ingresado el CUIT de la Compañía de Seguro de Retiro';
  end;
  Result := sRes;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbDatosEconomicosClick(Sender: TObject);
begin
  tbDatosEconomicos.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuDatosPagoClick(Sender: TObject);
begin
  mnuDatosPago.Checked := not mnuDatosPago.Checked;
  DoCargarFinancial;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuMostrarReservaClick(Sender: TObject);             // TK 53237
begin
  mnuMostrarReserva.Checked := not mnuMostrarReserva.Checked;
  GridILP.ColumnByField['RESERVAILP'].Visible := mnuMostrarReserva.Checked;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SegurodeRetiro1Click(Sender: TObject);
begin
  if (PageControl.ActivePageIndex = ctsILP) and  not(fraTrabajadorSIN.edSiniestro.IsEmpty) then
    with TfrmCompaniaSeguroRetiro.Create(Self) do
    try
      Siniestro    := vSiniestro;
      Orden        := vOrden;
      Recaida      := vRecaida;
      ConceptoPago := StrToInt(CONCEPTO_PARCIALDEF_ASIGFAM);
      ShowModal;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edRecibosILPExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILP.Recibos := edRecibosILP.Lines.Text;
    DoRefrescarILP;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnEnvioOPClick(Sender: TObject);
begin
  Verificar(fraMetodoPagoOP.IsEmpty, fraMetodoPagoOP, 'Primero debe seleccionar la forma de pago.');
  fpEnvioFondos.Tag := 3;
  if (fpEnvioFondos.ShowModal = mrOk) then
  begin
    if rbBancoFondos.Checked then
      edEnvioOP.Text  := fraBancoFondos.Descripcion +
                         IIF(not(fraSucursalFondos.IsEmpty), ' - SUCURSAL ' +
                         fraSucursalFondos.Descripcion + ' (' + fraSucursalFondos.Codigo + ')', '')
    else if rbDelegacionFondos.Checked then
      edEnvioOP.Text := 'DELEGACION ' + fraDelegacionFondos.Descripcion
    else if rbCentralFondos.Checked then
      edEnvioOP.Text := 'CASA CENTRAL'
    else
      edEnvioOP.Text := '';
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.GetIdTipo :Integer;
begin
  Result := IIF(rbConceptoPagoUnico.Checked, rbConceptoPagoUnico.Tag,
            IIF(rbConceptoIndemnizacion.Checked, rbConceptoIndemnizacion.Tag,
            IIF(rbConceptoAnticipo.Checked, rbConceptoAnticipo.Tag,
            IIF(rbConceptoRentaPer.Checked, rbConceptoRentaPer.Tag,
            IIF(rbConceptoAsignFamiliar.Checked, rbConceptoAsignFamiliar.Tag,
            IIF(rbConceptoRentaDev.Checked, rbConceptoRentaDev.Tag,
            IIF(rbConceptoDifRentaPer.Checked, rbConceptoDifRentaPer.Tag, 0)))))));
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.GetExtraFiltro: String;
var
  sSql: String;
begin
  sSql := '';
  case PageControl.ActivePageIndex of
    ctsILP, ctsILT:
      begin
        sSql := sSql + IIF(rbEstadoActivos.Checked, ' AND NVL(le_estado, '' '') <> ''A'' ', '');
        sSql := sSql + IIF(rbAntigUltimo.Checked, ' AND le_fproceso > TRUNC(SYSDATE) - 365 ', '');
      end;
    ctsPresMedicas:
      begin
        sSql := sSql + IIF(rbEstadoActivos.Checked, ' AND NVL(iv_estado, '' '') NOT IN (''X'', ''Z'') ', '');
        sSql := sSql + IIF(rbAntigUltimo.Checked, ' AND iv_fecalta > TRUNC(SYSDATE) - 365 ', '');
      end;
    ctsOPagos:
      begin
        sSql := sSql + IIF(rbEstadoActivos.Checked, ' AND NVL(pr_estado, '' '') <> ''A'' ', '');
        sSql := sSql + IIF(rbAntigUltimo.Checked, ' AND pr_fechalta > TRUNC(SYSDATE) - 365 ', '');
      end;
  end;

  if EsUsuarioDeTercerizadora then                                                    // por plan Ioma (Tercerizadoras)
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';

  Result := sSql;
end;            
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoMostrarDatosDigitalizacion;
var
  bPosee: Boolean;
begin
  bPosee := not(fraTrabajadorSIN.edSiniestro.IsEmpty) and
            Is_ExisteDocumentoSiniestro(vSiniestro, vOrden, 'P31');
  lblPoseeDni.Enabled := bPosee;
  lblPoseeDni.Color   := IIF(bPosee, clGray, clBtnFace);

  bPosee := not(fraTrabajadorSIN.edSiniestro.IsEmpty) and
            Is_ExisteDocumentoSiniestro(vSiniestro, vOrden, 'P49');
  lblRecibos.Enabled := bPosee;
  lblRecibos.Color   := IIF(bPosee, clGray, clBtnFace);

  bPosee := not(fraTrabajadorSIN.edSiniestro.IsEmpty) and
            Is_ExisteDocumentoSiniestro(vSiniestro, vOrden, 'DEN');
  lblDenuncia.Enabled := bPosee;
  lblDenuncia.Color   := IIF(bPosee, clGray, clBtnFace);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuImpResumenClick(Sender: TObject);
begin
  {$IFNDEF LEGALES}
  if fraTrabajadorSIN.edSiniestro.IsEmpty then Exit;
  with TrptResumen.Create(Self) do
  try
    Imprimir(sdqBusqueda.FieldByName('SINCOMPLETO').AsString, vIdExpediente, vSiniestro);
  finally
    Free;
  end;
  {$ENDIF}
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbNominaClick(Sender: TObject);
begin
  with TfrmConsultaNomina.Create(Self) do
  try
    btnAceptar.Visible := False;
    Caption   := 'Nómina de la empresa ' + fraEmpresa.NombreEmpresa;
    Contrato  := fraEmpresa.Contrato;
    ShowModal;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbDatosEmpresaClick(Sender: TObject);
begin
  {$IFNDEF LEGALES}
  with TfrmConsultaEmpresa.Create(Self) do
  try
    IdEmpresa := fraEmpresa.Value;
    ShowModal;
  finally
    Free;
  end;
  {$ENDIF}
end;
{-------------------------------------------------------------------------------}
{procedure TfrmLiqIncapacidades.mnGenComBanILPILTClick(Sender: TObject);
var
  Liqui: TLiquidacion;
begin
  if HayRegistroActivo then
  begin
    if (PageControl.ActivePageIndex = ctsILP) then
      Liqui := oILP
    else
      Liqui := oILT;
    with Liqui do
    begin
      if GeneraComBancaria then
      try
        BeginTrans;
        DoGenerarOPAutomatica(vSiniestro, vOrden, vRecaida, MetodoPago,
                              IntToStr(NroLiquidacion), 'TA', Expediente.Trabajador.Cuil,
                              'A', '0001', '00000001', '', '', 'N', Delegacion, '', EnvioFondos,
                              IIF((Liqui is TILP), 'ILP.', 'ILT.'), Expediente.Trabajador.Nombre,
                              '', '', DBDate, DBDate, 0, 0, 0, Liqui.IdBanco, ComBanco,
                              0, 0, 0, 0, 0, 0, 0, 0, True, False, False, False, False, False, true);
        CommitTrans;
        if (Liqui is TILP) then
        begin
          sdqILP.Refresh;
          Liqui.NumPagoComi := sdqILP.FieldByName('le_numpagocomi').AsInteger;
        end
        else begin
          sdqILT.Refresh;
          Liqui.NumPagoComi := sdqILT.FieldByName('le_numpagocomi').AsInteger;
        end;
      except
        on E:Exception do
        begin
          ErrorMsg(E, 'Error al intentar generar la comisión bancaria.');
          Rollback;
        end;
      end;
    end;
  end;
end; }
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fpImpChequeBeforeShow(Sender: TObject);
begin
  chkImpCheque.Checked  := False;
  chkIVA.Checked        := False;
  chkIngBruto.Checked   := False;
  chkRenta.Checked      := False;
  chkSellados.Checked   := False;
  chkOtros.Checked      := False;
end;
{-------------------------------------------------------------------------------}
{procedure TfrmLiqIncapacidades.mnGenChequeILPILTClick(Sender: TObject);
var
  Liqui: TLiquidacion;
begin
  if HayRegistroActivo then
  begin
    if (PageControl.ActivePageIndex = ctsILP) then
      Liqui := oILP
    else
      Liqui := oILT;
    with Liqui do
    begin
      if GeneraImpCheque and GetImpuestos(TotalAPagar) then
      try
        BeginTrans;
        DoGenerarOPAutomatica(vSiniestro, vOrden, vRecaida, MetodoPago,
                              IntToStr(NroLiquidacion), 'TA', Expediente.Trabajador.Cuil,
                              'A', '0001', '00000001', '', '', 'N', Delegacion, '', EnvioFondos,
                              IIF((Liqui is TILP), 'ILP.', 'ILT.'), Expediente.Trabajador.Nombre,
                              '', '', DBDate, DBDate, 0, 0, 0, Liqui.IdBanco, edTotalImp.Value,
                              edImpCheque.Value, edIVA.Value, edIngBruto.Value,edRenta.Value,
                              edSellados.Value, edOtros.Value, 0, 0, True, True, False, False, False, False, true);
        CommitTrans;
        if (Liqui is TILP) then
        begin
          sdqILP.Refresh;
          Liqui.NumPagoCheque := sdqILP.FieldByName('le_numpagocheque').AsInteger;
        end
        else begin
          sdqILT.Refresh;
          Liqui.NumPagoCheque := sdqILT.FieldByName('le_numpagocheque').AsInteger;
        end;
      except
        on E:Exception do
        begin
          ErrorMsg(E, 'Error al intentar generar impuesto al cheque.');
          Rollback;
        end;
      end;
    end;
  end;
end;}
{-------------------------------------------------------------------------------}
{function TfrmLiqIncapacidades.GetImpuestos(dImporte: Double): Boolean;
begin
  edImpIndemn.Value := dImporte;
  Result := (fpImpCheque.ShowModal = mrOk);
end;}
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.chkImpChequeClick(Sender: TObject);
begin
  edImpCheque.Value := IIF(chkImpCheque.Checked, edImpIndemn.Value * ImpCheque, 0);
  DoCalcularTotalReintegrar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.chkIVAClick(Sender: TObject);
begin
  if chkIVA.Checked then chkImpCheque.Checked := True;
  LockControl(edIVA, not chkIVA.Checked);
  edIVA.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.chkIngBrutoClick(Sender: TObject);
begin
  if chkIngBruto.Checked then chkImpCheque.Checked := True;
  LockControl(edIngBruto, not chkIngBruto.Checked);
  edIngBruto.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.chkRentaClick(Sender: TObject);
begin
  edRenta.Value := IIF(chkRenta.Checked, edImpIndemn.Value * Renta, 0);
  DoCalcularTotalReintegrar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCalcularTotalReintegrar;
begin
  edTotalImp.Value := edImpCheque.Value + edIVA.Value + edIngBruto.Value +
                      edRenta.Value + edSellados.Value + edOtros.Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.chkSelladosClick(Sender: TObject);
begin
  LockControl(edSellados, not chkSellados.Checked);
  edSellados.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.chkOtrosClick(Sender: TObject);
begin
  LockControl(edOtros, not chkOtros.Checked);
  edOtros.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edOtrosChange(Sender: TObject);
begin
  DoCalcularTotalReintegrar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edSelladosChange(Sender: TObject);
begin
  DoCalcularTotalReintegrar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAceptarCHClick(Sender: TObject);
begin
  Verificar(not(chkImpCheque.Checked or chkIVA.Checked or chkIngBruto.Checked or
                chkRenta.Checked or chkSellados.Checked or chkOtros.Checked), gbImpCheque,
            'Debe seleccionar algun impuesto.');
  Verificar(chkSellados.Checked and (edSellados.Value = 0), edSellados, 'Debe ingresar el importe correspondiente.');
  Verificar(chkOtros.Checked and (edOtros.Value = 0), edOtros, 'Debe ingresar el importe correspondiente.');
  Verificar(edTotalImp.Value > edImpIndemn.Value, edTotalImp, 'El total a reintegrar no puede ser mayor que el importe liquidado.');
  fpImpCheque.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.pmILPILTPopup(Sender: TObject);
begin
  {mnGenComBanILPILT.Enabled       := Seguridad.Activar(mnGenComBanILPILT) and
                                    ((PageControl.ActivePageIndex = ctsILP) or (PageControl.ActivePageIndex = ctsILT));
  mnGenChequeILPILT.Enabled       := Seguridad.Activar(mnGenChequeILPILT) and
                                    ((PageControl.ActivePageIndex = ctsILP) or (PageControl.ActivePageIndex = ctsILT));}
  mnGenIntILPILT.Enabled          := Seguridad.Activar(mnGenIntILPILT) and (PageControl.ActivePageIndex = ctsILP);
  mnGenTasaJusticiaILPILT.Enabled := Seguridad.Activar(mnGenTasaJusticiaILPILT) and
                                    ((PageControl.ActivePageIndex = ctsILP) or (PageControl.ActivePageIndex = ctsOPagos));
  mnGenCompDaniosILP.Enabled      := Seguridad.Activar(mnGenCompDaniosILP) and (PageControl.ActivePageIndex = ctsILP);   // Por plan Generar compensación por daños
  mnEditarImporte.Enabled         := (PageControl.ActivePageIndex = ctsILP) and Seguridad.Claves.IsActive('HabilitaModifImporte') and HabilitaEditarImporte;     // por ticket 53197
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcTotalesAportes(sdqAportesILTPDDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (Accion <> l_None) then
    DoAplicarUpdates(sdqAportesILTPDDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sdqAportesILTPDDE.Edit;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.GridAportesILTPDDEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key :=  PatchComma(Key);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.munImpFormSeleccionClick(Sender: TObject);
begin
  if fraTrabajadorSIN.IsSelected and
     TieneDictamenAutorizado('formulario de selección') then
    with TrptFormSelRetiro.Create(Self) do
      Preparar(vIdExpediente);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuImpSolCotizacionClick(Sender: TObject);
var
  dMonto: Double;
begin
  if fraTrabajadorSIN.IsSelected and
     TieneDictamenAutorizado('solicitud de cotización') and
     DoCargarDictamenes(True) then
  begin
    if (oILP = nil) then        // TK 46693
      DoCrearObjILP(vSiniestro, vOrden, vRecaida, 1, oILP);

    if (oILP.BaseDiaria = 0) and (oILP.BaseDiariaNoRem = 0) and not(oILP.IsPagoUnico) then
      MsgBox('Falta calcular la Base Diaria. No podrá continuar hasta completarla.', MB_ICONEXCLAMATION + MB_OK)
    else begin
      dMonto := GetMontoIndemnizacion(vSiniestro, vOrden, vRecaida, rbConceptoIndemnizacion.Tag,
                                      Dictamenes[rgDictamenes.ItemIndex].Codigo,
                                      Dictamenes[rgDictamenes.ItemIndex].Grado,
                                      Dictamenes[rgDictamenes.ItemIndex].Caracter,
                                      Dictamenes[rgDictamenes.ItemIndex].Porcentaje);

      if AreIn(Dictamenes[rgDictamenes.ItemIndex].Grado, ['G', 'T']) then
        with TrptFormularioCotizacionTot.Create(Self) do
          Preparar(Dictamenes[rgDictamenes.ItemIndex].Id, vIdExpediente,
                   edSinFecha.Date < StrToDateTime(FECHA_LIQ), dMonto)
      else
        with TrptFormularioCotizacion.Create(Self) do
            Preparar(Dictamenes[rgDictamenes.ItemIndex].Id, vSiniestro, vOrden, vRecaida,
                    edSinFecha.Date < StrToDateTime(FECHA_LIQ), dMonto);
    end;
  end;
end;


{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuViajarSiniestrosClick(Sender: TObject);
{$IFDEF VIAJAR_SIN}
var
  frmAdmSiniestros :TfrmAdmSiniestros;
begin
  if not fraTrabajadorSIN.IsEmpty then
    with frmAdmSiniestros do
    begin
      frmAdmSiniestros          := TfrmAdmSiniestros.Create(frmPrincipal);
      MenuItem                  := frmPrincipal.mnuAdmSiniestros;
      fraTrabajador.IdSiniestro := fraTrabajadorSIN.IdSiniestro;
      OnfraTrabajadorChange(nil);
      Show;
      Self.Close;
    end;
{$ELSE}
begin  
{$ENDIF}
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuViajarIncapacidadesClick(Sender: TObject);
{$IFDEF VIAJAR_SIN}
var
  frmSegIncapacidades :TfrmSegIncapacidades;
begin
  if not fraTrabajadorSIN.IsEmpty then
    with frmSegIncapacidades do
    begin
      frmSegIncapacidades           := TfrmSegIncapacidades.Create(frmPrincipal);
      MenuItem                      := frmPrincipal.mnuSegIncapacidades;
      edSiniestro.SetValues(Self.fraTrabajadorSIN.edSiniestro.Siniestro,
                            Self.fraTrabajadorSIN.edSiniestro.Orden,
                            Self.fraTrabajadorSIN.edSiniestro.Recaida);
      tbRefrescarClick(Nil);
      Show;
      Self.Close;
    end;
{$ELSE}
begin  
{$ENDIF}
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEPORCEMPRChange(Sender: TField);
begin
  inherited;
  CalcTotalesAportes(sdqAportesILTPDDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEPORCTRABChange(Sender: TField);
begin
  inherited;
  CalcTotalesAportes(sdqAportesILTPDDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEPORCEMPRValidate(Sender: TField);
begin
  inherited;
  DoVerificarPorcentajes(Sender, sdqAportesILTPDDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqAportesILTPDDEPORCTRABValidate(Sender: TField);
begin
  inherited;
  DoVerificarPorcentajes(Sender, sdqAportesILTPDDE);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.PageControlCanChange(Sender: TObject;
  FromPage, ToPage: Integer; var AllowChange: Boolean);
begin
  AllowChange := ((ToPage <> ctsILP) and (ToPage <> ctsILT)) or
                 ((ToPage = ctsILP) and bVerILP) or
                 ((ToPage = ctsILT) and bVerILT);
  if not AllowChange then
    InfoHint(Nil, 'Usted no posee permisos para ver esta solapa.');
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edIngBrutoChange(Sender: TObject);
begin
  DoCalcularTotalReintegrar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edIVAChange(Sender: TObject);
begin
  DoCalcularTotalReintegrar;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.EsUsuarioLegales(sUsuario: String): Boolean;    // TK 14614
var sSql: string;
begin
  sSql := ' SELECT 1 FROM art.use_usuarios ' +
           ' WHERE se_sector = ''LEGAL'' ' +
             ' AND SE_FECHABAJA IS NULL ' +
             ' AND SE_USUARIO = :Usuario ';
  Result := (ValorSqlEx(sSql, [sUsuario]) = '1');
end;
{-------------------------------------------------------------------------------}
{function TfrmLiqIncapacidades.PoseePermisos: Boolean;
  function PoseePermisosJuiciosRecuperos: boolean;
  var
    bTieneJuicio, bTieneRecupero, bPermisoJuicio, bPermisoRecupero: Boolean;
  begin
    bTieneJuicio      := SiniTieneJuicios(vSiniestro, vOrden, vRecaida);
    bPermisoJuicio    := Seguridad.Claves.IsActive('LegalesJuicios');
    bTieneRecupero    := SiniTieneRecuperos(vSiniestro, vOrden);
    bPermisoRecupero  := Seguridad.Claves.IsActive('LegalesRecuperos');

    Verificar(not(bTieneJuicio) and not(bTieneRecupero),
              fraTrabajadorSIN.edSiniestro, 'El Siniestro no posee Juicios ni Recuperos');
    Verificar(not(bPermisoJuicio) and not(bPermisoRecupero),
              fraTrabajadorSIN.edSiniestro, 'Usted no posee permisos para visualizar este Siniestro');
    Verificar(not(bPermisoJuicio) and bTieneJuicio and
              bPermisoRecupero and not(bTieneRecupero),
              fraTrabajadorSIN.edSiniestro, 'El siniestro no posee Recuperos');
    Verificar(bPermisoJuicio and not(bTieneJuicio) and
              not(bPermisoRecupero) and bTieneRecupero,
              fraTrabajadorSIN.edSiniestro, 'El siniestro no posee Juicios');

    Result := True;
  end;
begin
  Result := not(EsUsuarioLegales(Sesion.UserID)) or
           (EsUsuarioLegales(Sesion.UserID) and Seguridad.Claves.IsActive('LegalesVerTodo')) or
           PoseePermisosJuiciosRecuperos;
end;      }

{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.PoseePermisos: Boolean;
  function PoseePermisosJuiciosRecuperos: boolean;
  var
    bTieneJuicio, bTieneRecupero, bPermisoJuicio, bPermisoRecupero, bTieneMediacion, bPermisoMediacion: Boolean;
  begin
    bTieneJuicio      := SiniTieneJuicios(vSiniestro, vOrden, vRecaida);
    bPermisoJuicio    := Seguridad.Claves.IsActive('LegalesJuicios');
    bTieneRecupero    := SiniTieneRecuperos(vSiniestro, vOrden);
    bPermisoRecupero  := Seguridad.Claves.IsActive('LegalesRecuperos');
    bTieneMediacion   := SiniTieneMediacion(vIdExpediente);
    bPermisoMediacion := Seguridad.Claves.IsActive('LegalesMediaciones');

    Verificar(not(bTieneJuicio) and not(bTieneRecupero) and not (bTieneMediacion),
              fraTrabajadorSIN.edSiniestro, 'El Siniestro no posee Juicios, Recuperos ni Mediaciones');

    {Verificar(not(bPermisoJuicio) and not(bPermisoRecupero) and not (bPermisoMediacion),
              fraTrabajadorSIN.edSiniestro, 'Usted no posee permisos para visualizar este Siniestro'); }

    if ((bTieneJuicio and bPermisoJuicio) or
        (bTieneRecupero and bPermisoRecupero) or
        (bTieneMediacion and bPermisoMediacion)) then
        result := true
    else
    begin
      Verificar(true,fraTrabajadorSIN.edSiniestro, 'Usted no posee permisos para visualizar este Siniestro');
      Result := False;
    end;
    {Verificar(bPermisoJuicio and not(bTieneJuicio) and
              not(bPermisoRecupero) and bTieneRecupero,
              fraTrabajadorSIN.edSiniestro, 'El siniestro no posee Juicios');}

  end;
begin
  Result := not(EsUsuarioLegales(Sesion.UserID)) or
           (EsUsuarioLegales(Sesion.UserID) and Seguridad.Claves.IsActive('LegalesVerTodo')) or
           PoseePermisosJuiciosRecuperos;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuLiqMortalesClick(Sender: TObject);
{$IFDEF DINERARIAS}
var
  frmLiqBeneficiarios: tfrmliqbeneficiarios;
begin
  Verificar(sdqBusqueda.FieldByName('ex_gravedad').AsString <> '5', fraTrabajadorSIN.edSiniestro,
            'El siniestro seleccionado no es mortal');
  if not fraTrabajadorSIN.IsEmpty then
    with frmLiqBeneficiarios  do
    begin
      frmLiqBeneficiarios   := TfrmLiqBeneficiarios.Create(frmPrincipal);
      MenuItem              := frmPrincipal.mnuLiqMortCalculos;
      fraTrabajadorSIN.edSiniestro.SetValues(Self.fraTrabajadorSIN.edSiniestro.Siniestro,
                                             Self.fraTrabajadorSIN.edSiniestro.Orden,
                                             Self.fraTrabajadorSIN.edSiniestro.Recaida);
      fraTrabajadorSINedSiniestroSelect(Nil);
      Show;
      Self.Close;
    end;
{$ELSE}
begin
{$ENDIF}
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edRecibosILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.Recibos := edRecibosILT.Lines.Text;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraTipoILTPropiedadesChange(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    fraTipoILT.FrameExit(Sender);
    oILT.Tipo := fraTipoILT.Codigo;
    SetChequeANombreILT;
    SetRecibosILT;
    SetMotivoDiferencia;   // TK 39345
    DoRefrescarILT;
    LockControl(edChequeNombreILT, (fraTipoILT.Codigo = 'L')); // si es Reintegro, lo deshabilita - Tk 39134
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SetRecibosILT;
var
  sRecibos: String;
begin
  if (Accion <> l_None) then
  begin
    btnRecibosILT.Enabled := (oILT.Tipo = 'D');
 //   LockControl(btnRecibosILT, (oILT.Tipo <> 'D'));      // por TK 28814

    sRecibos := IIF(oILT.Tipo = 'D', IIF(oILT.Recibos = '', oILT.Expediente.Trabajador.Domicilio, oILT.Recibos), '');

    if (oILT.Tipo = 'D') then   // Pago Directo
    begin
      oILT.ChkDomicilioRec := True;
      oILT.ChkOtroRec      := False;
      oILT.CalleRec        := oILT.Expediente.Trabajador.Calle;
      oILT.NumeroRec       := oILT.Expediente.Trabajador.Numero;
      oILT.PisoRec         := oILT.Expediente.Trabajador.Piso;
      oILT.DepartamentoRec := oILT.Expediente.Trabajador.Departamento;
      oILT.CodigoPostalRec := oILT.Expediente.Trabajador.CPostal;
      oILT.CPARec          := oILT.Expediente.Trabajador.CPostala;
      oILT.LocalidadRec    := oILT.Expediente.Trabajador.Localidad;
      oILT.ProvinciaRec    := oILT.Expediente.Trabajador.Provincia;
      oILT.ProvRec         := oILT.Expediente.Trabajador.Prov;
    end
    else begin  // si no es pago directo
      Do_LimpiarFrameDomicRec_ILT;
      oILT.DoLimpiarRecibosA;
    end;

    edRecibosILT.Lines.Text := sRecibos;
    oILT.Recibos            := sRecibos;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnVerDatosAFIPClick(Sender: TObject);
begin
  iCondAnt := fraCondicionAFIPDE.Value;
  iZonaAnt := fraZonaAFIPDE.Value;
  fpDatosAFIP.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAceptarAFIPClick(Sender: TObject);
begin
  Verificar(fraCondicionAFIPDE.ID = '', fraCondicionAFIPDE, 'Debe seleccionar la condición.');
  fpDatosAFIP.ModalResult := mrOk;
end;
procedure TfrmLiqIncapacidades.btnAceptarBajaClick(Sender: TObject);
begin
  //Verificar(cbCasosARelacionar.Text = '', cbCasosARelacionar, 'Debe seleccionar un caso');
  fpCasosActivosPD.ModalResult := mrOk;

end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnCancelarAFIPClick(Sender: TObject);
begin
  inherited;
  if (iCondAnt > 0) then
    fraCondicionAFIPDE.Value  := iCondAnt
  else
    fraCondicionAFIPDE.Clear;
  fraZonaAFIPDE.Value         := iZonaAnt;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnGenIntILPILTClick(Sender: TObject);
var
  Liqui: TLiquidacion;
begin

  if HayRegistroActivo and (sdqILP.FieldByName('le_numintereses').AsString = '') and (sdqILP.FieldByName('le_subtotal').AsCurrency > 0) and
    (sdqILP.FieldByName('le_ideventoinca').AsInteger > 0) then
  begin
    Liqui := oILP;
    if Liqui.GeneraIntereses then
      with TfrmGeneracionIntereses.Create(Nil) do
      try
        ConPago   := sdqILP.FieldByName('le_conpago').AsInteger;
        IdEvento  := sdqILP.FieldByName('le_ideventoinca').AsInteger;
        FechaSin  := edSinFecha.Date;
        Capital   := sdqILP.FieldByName('a_pagar').AsFloat;
        if (ShowModal = mrOk) then
          GenerarLiqManual(CONCEPTO_INTERESES_DIN, edInteresesInt.Value, edDesdeInt.Date, edHastaInt.Date,
                           edTasaOrigInt.Value, edTasaFinInt.Value, IIF(rbRecapitInt.Checked, 'R', IIF(rbActivaInt.Checked, 'A', 'P')));

        sdqILP.Refresh;
        Liqui.NumIntereses := sdqILP.FieldByName('le_numintereses').AsInteger;
      finally
        Free;
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnGenTasaJusticiaILPILTClick(Sender: TObject);
var
  Liqui: TLiquidacion;
begin
  if HayRegistroActivo and (sdqILP.FieldByName('le_numtasajusticia').AsString = '') and (sdqILP.FieldByName('le_subtotal').AsCurrency > 0) then
  begin
    if (PageControl.ActivePageIndex = ctsILP) then
    begin
      Liqui := oILP;
      if Liqui.GeneraTasaJusticia then
        with TfrmGeneracionTasaJusticia.Create(Nil) do
        try
          Capital := sdqILP.FieldByName('a_pagar').AsFloat;
          if (ShowModal = mrOk) then
            GenerarLiqManual(CONCEPTO_TASA_JUSTICIA_CAMFED, edTasaJusticia.Value, 0, 0, 0, 0, '', IIF(rbPorcentajeTJ.Checked, 'P', 'S'));

          sdqILP.Refresh;
          Liqui.NumTasaJusticia := sdqILP.FieldByName('le_numtasajusticia').AsInteger;
        finally
          Free;
        end;
    end
    else if (PageControl.ActivePageIndex = ctsOPagos) and
            (sdqOPagos.FieldByName('pr_conpago').AsString = CONCEPTO_INTERESES_DIN) then
    begin
      with TfrmGeneracionTasaJusticia.Create(Nil) do
      try
        Capital := sdqOPagos.FieldByName('pr_imporpago').AsFloat;
        if (ShowModal = mrOk) then
        try
          BeginTrans;
          DoGenerarOPAutomatica(vSiniestro, vOrden, vRecaida,
                                sdqOPagos.FieldByName('pr_metodopago').AsString,
                                sdqOPagos.FieldByName('pr_numpago').AsString, 'TA',
                                sdqOPagos.FieldByName('pr_cuitcuil').AsString, 'A',
                                '0001', '00000001', '', '', 'N',
                                sdqOPagos.FieldByName('pr_delegacion').AsString, '',
                                sdqOPagos.FieldByName('pr_enviofondos').AsString,
                                'Otros Pagos.', sdqOPagos.FieldByName('ACREEDOR').AsString,
                                '',  IIF(rbPorcentajeTJ.Checked, 'P', 'S'), DBDate, DBDate,
                                0, 0, 0, sdqOPagos.FieldByName('pr_idbanco').AsInteger,
                                edTasaJusticia.Value, 0, 0, 0, 0, 0, 0, 0, 0,
                                False, False, False, True, False, False, true);
          CommitTrans;
          sdqOPagos.Refresh;
        except
          on E:Exception do
          begin
            ErrorMsg(E, 'Error al intentar generar la tasa de justicia.');
            Rollback;
          end;
        end;
      finally
        Free;
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuEmbargoClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  if not fraTrabajadorSIN.IsEmpty and
    (fpEmbargos.ShowModal = mrOk) then
  begin
    sWhere := ' WHERE ce_idexpediente = ' + SqlInt(vIdExpediente) +
                ' AND ce_fechabaja IS NULL ' +
                ' AND ((ce_tipo = ''P'') ' +
                 ' OR ((ce_tipo = ''S'') AND (ce_sumafija > 0)))';

    if rbNingunoEmb.Checked then
      sSql := 'UPDATE sin.sce_siniestrosconembargo ' +
                ' SET ce_fechabaja = actualdate, ' +
                    ' ce_usubaja = ' + SqlValue(Sesion.UserID) + sWhere
    else if SiniTieneEmbargo(vIdExpediente) then
      sSql := 'UPDATE sin.sce_siniestrosconembargo ' +
                ' SET ce_tipo = ' + SqlBoolean(rbPorcentajeEmb.Checked, True, 'P', 'S') + ',' +
                    ' ce_porcentaje = ' + SqlNumber(edPorcentajeEmb.Value, True) + ',' +
                    ' ce_sumafija = ' + SqlNumber(edSumaFijaEmb.Value, True) + ',' +
                    ' ce_formapago = ' + SqlValue(fraMetodoPagoEmb.Codigo) + ',' +
                    ' ce_idbanco = ' + SqlInt(fraBancoEmb.Value, True) + ',' +
                    ' ce_enviofondos = ' + SqlValue(edEnvioEmb.Text) + ',' +
                    ' ce_chequenombre = ' + SqlValue(edChequeNombreEmb.Text) + ',' +
                    ' ce_recibos = ' + SqlValue(edRecibosEmb.Text) + ',' +
                    ' ce_fechamodif = actualdate, ' +
                    ' ce_usumodif = ' + SqlValue(Sesion.UserID) + sWhere
    else
      sSql := 'INSERT INTO sin.sce_siniestrosconembargo ' +
              '(ce_idexpediente, ce_tipo, ce_porcentaje, ce_sumafija, ce_formapago, ' +
              ' ce_idbanco, ce_enviofondos, ce_chequenombre, ce_recibos, ce_fechaalta, ' +
              ' ce_usualta) VALUES (' +
               SqlInt(vIdExpediente) + ',' + SqlBoolean(rbPorcentajeEmb.Checked, True, 'P', 'S') + ',' +
               SqlNumber(edPorcentajeEmb.Value, True) + ',' + SqlNumber(edSumaFijaEmb.Value, True) + ',' +
               SqlValue(fraMetodoPagoEmb.Codigo) + ',' + SqlInt(fraBancoEmb.Value, True) + ',' +
               SqlValue(edEnvioEmb.Text) + ',' + SqlValue(edChequeNombreEmb.Text) + ',' +
               SqlValue(edRecibosEmb.Text) + ',' + 'ActualDate, ' + SqlValue(Sesion.UserID) + ')';

    EjecutarSql(sSql);
    mnuEmbargo.Checked := not(rbNingunoEmb.Checked);    
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.rbPorcentajeEmbClick(Sender: TObject);
begin
  edPorcentajeEmb.Clear;
  edSumaFijaEmb.Clear;
  LockControl(edPorcentajeEmb, rbNingunoEmb.Checked or rbSumaFijaEmb.Checked);
  LockControl(edSumaFijaEmb, rbNingunoEmb.Checked or rbPorcentajeEmb.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAceptarEmbClick(Sender: TObject);
begin
  Verificar(not(rbPorcentajeEmb.Checked) and not(rbSumaFijaEmb.Checked) and
            not(rbNingunoEmb.Checked), rbPorcentajeEmb, 'Debe seleccionar el tipo de embargo.');
  Verificar(rbPorcentajeEmb.Checked and (edPorcentajeEmb.Value = 0), edPorcentajeEmb,
            'Debe ingresar el porcentaje del embargo.');
  Verificar(rbSumaFijaEmb.Checked and (edSumaFijaEmb.Value = 0), edSumaFijaEmb,
            'Debe ingresar la suma del embargo.');
  Verificar(fraMetodoPagoEmb.IsEmpty, fraMetodoPagoEmb, 'Debe seleccionar la forma de pago.');
  Verificar(not(fraBancoEmb.edCodigo.ReadOnly) and fraBancoEmb.IsEmpty, fraBancoEmb,
            'Debe seleccionar el banco.');
  Verificar(Trim(edEnvioEmb.Text) = '', edEnvioEmb, 'Debe ingresar el envío de fondos.');
  Verificar(Trim(edChequeNombreEmb.Text) = '', edChequeNombreEmb, 'Debe ingresar el cheque a nombre.');
  Verificar(Trim(edRecibosEmb.Text) = '', edRecibosEmb, 'Debe ingresar los recibos a.');

  if not(rbNingunoEmb.Checked) or
    (rbNingunoEmb.Checked and MsgAsk('¿Confirma que el siniestro NO posee embargo?')) then
    fpEmbargos.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fpEmbargosBeforeShow(Sender: TObject);
var
  sSql: String;
  bUsado: Boolean;
begin
  sSql := 'SELECT ce_id, ce_tipo, ce_porcentaje, ce_sumafija, ce_formapago, ' +
                ' ce_enviofondos, ce_idbanco, ce_chequenombre, ce_recibos ' +
           ' FROM sin.sce_siniestrosconembargo ' +
          ' WHERE ce_idexpediente = :IdExp ' +
            ' AND ce_fechabaja IS NULL ' +
            ' AND ((ce_tipo = ''P'') ' +
             ' OR ((ce_tipo = ''S'') AND (ce_sumafija > 0)))';

  with GetQueryEx(sSql, [vIdExpediente]) do
  try
    if Eof then
    begin
      rbNingunoEmb.Checked      := True;
      edEnvioEmb.Clear;
      fraMetodoPagoEmb.Clear;
      fraBancoEmb.Clear;
      edChequeNombreEmb.Clear;
      edRecibosEmb.Clear;
      LockControls([rbPorcentajeEmb, rbSumaFijaEmb, rbNingunoEmb], False);
    end
    else begin
      if (FieldByName('ce_tipo').AsString = 'P') then
      begin
        rbPorcentajeEmb.Checked := True;
        edPorcentajeEmb.Value   := FieldByName('ce_porcentaje').AsCurrency;
      end
      else if (FieldByName('ce_tipo').AsString = 'S') then
      begin
        rbSumaFijaEmb.Checked   := True;
        edSumaFijaEmb.Value     := FieldByName('ce_sumafija').AsCurrency;
      end;
      fraMetodoPagoEmb.Codigo   := FieldByName('ce_formapago').AsString;
      fraBancoEmb.Value         := FieldByName('ce_idbanco').AsInteger;
      edEnvioEmb.Text           := FieldByName('ce_enviofondos').AsString;
      edChequeNombreEmb.Text    := FieldByName('ce_chequenombre').AsString;
      edRecibosEmb.Text         := FieldByName('ce_recibos').AsString;

      //si el embargo ya fue usado en alguna liquidacion, sólo se permite darlo de baja...
      bUsado := ExisteSqlEx('SELECT 1 ' +
                             ' FROM art.sle_liquiempsin ' +
                            ' WHERE le_siniestro = :sin ' +
                              ' AND le_orden = :ord ' +
                              ' AND le_recaida = :reca ' +
                              ' AND le_idembargo = :idemb',
                             [vSiniestro, vOrden, vRecaida, FieldByName('ce_id').AsInteger]);
      if bUsado then
        LockControls([rbPorcentajeEmb, rbSumaFijaEmb, edPorcentajeEmb, edSumaFijaEmb], True);
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.OnMetodoPagoEmbChange(Sender: TObject);
var
  bHabil :Boolean;
begin
  bHabil := AreIn(fraMetodoPagoEmb.Codigo, ['GI', 'TR', 'DC', 'CH', 'DA']);
  LockControl(fraBancoEmb, not bHabil);
  fraBancoEmb.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarEmbargo(oLiqui: TLiquidacion; ImporteRemun, ImporteNoRemun: Currency);
var
  sSql :String;
begin
  with oLiqui do
  try
    BeginTrans;
    EstadoOperacion   := eoEstadoAlta;
    NroLiquidacion    := 0;

    sSql := 'SELECT ce_id, ce_tipo, ce_formapago, ce_enviofondos, ce_idbanco, ' +
                  ' ce_chequenombre, ce_recibos, tb_descripcion descpago ' +
             ' FROM sin.sce_siniestrosconembargo, ctb_tablas ' +
            ' WHERE ce_idexpediente = :IdExp ' +
              ' AND tb_codigo(+) = ce_formapago ' +
              ' AND tb_clave(+) = ''COBRO'' ' +
              ' AND ce_fechabaja IS NULL ' +
              ' AND ((ce_tipo = ''P'') ' +
               ' OR ((ce_tipo = ''S'') AND (ce_sumafija > 0)))';

    with GetQueryEx(sSql, [vIdExpediente]) do
    try
      MetodoPago         := FieldByName('ce_formapago').AsString;
      DescMetodoPago     := FieldByName('descpago').AsString;
      EnvioFondos        := FieldByName('ce_enviofondos').AsString;
      IdBanco            := FieldByName('ce_idbanco').AsInteger;
      ANombreDe          := FieldByName('ce_chequenombre').AsString;
      Recibos            := FieldByName('ce_recibos').AsString;
      IdEmbargo          := FieldByName('ce_id').AsInteger;
      Observaciones      := 'EMBARGO JUDICIAL';
      MantenerFormula    := True;
      ImporteLiquidado   := ImporteRemun;
      ImporteLiquidNoRem := ImporteNoRemun;
      MantenerFormula    := False;
      if (FieldByName('ce_tipo').AsString = 'S') then
        EjecutarSqlST('UPDATE sin.sce_siniestrosconembargo ' +
                        ' SET ce_sumafija = ce_sumafija - ' + SqlNumber(ImporteRemun + ImporteNoRemun) +
                      ' WHERE ce_idexpediente = ' + SqlInt(oLiqui.Expediente.Id) +
                        ' AND ce_fechabaja IS NULL ' +
                        ' AND ce_sumafija > 0');
    finally
      Free;
    end;
    Grabar;
    if MsgAsk('¿Desea imprimir la liquidación correspondiente al embargo ahora?') then
    begin
      if (fpImprimirLiq.ShowModal = mrOk) then
        oLiqui.Imprimir(edCantRec.Value, edCantRes.Value, edCantDig.Value, True);
    end;

    Accion := l_None;
    if (oLiqui is TILP) then
      DoCargarILP
    else
      DoCargarILT;
    DoHabilitarAlta(False);
  except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar generar el embargo.');
      Rollback(True);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuImpReciboRetiraDocumClick(Sender: TObject);
begin
  if fraTrabajadorSIN.IsSelected and
     TieneDictamenAutorizado('recibo de documentación') then
    with TrptReciboRetiraDocum.Create(Self) do
      Preparar(vIdExpediente);
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.TieneDictamenAutorizado(sFormulario: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM art.sda_dictamenesautorizados ' +
          ' WHERE da_idexpediente = :idexped ' +
            ' AND ((da_porcentaje > 50) OR (da_grado = ''T'')) ' +
            ' AND da_caracter = ''D'' ';
  if ExisteSqlEx(sSql, [vIdExpediente]) then
    Result := True
  else begin
    MsgBox('El siniestro seleccionado no posee dictamenes autorizados ' + #13 +
           'en condiciones de generar el ' + sFormulario + '.',  MB_ICONEXCLAMATION);
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCargarGrillaRemunPostDecreto(dDesde: TDate = 0; sSigno: String = '');
var
  sSql: String;
begin
  vIdRem := 0;
  if Is_SiniPostDecreto1694(edSinFecha.Date) then
  begin
    vIdRem := DoGenerarTempRemunPostDecre(vSiniestro, vOrden, edSinFecha.Date, dDesde, sSigno);
    OpenQueryEx(sdqRemuFijaPosDecre, [Sesion.UserID]);
    OpenQueryEx(sdqRemuVarPosDecre, [Sesion.UserID]);
    sSql := 'SELECT rm_vigenciadesde, rm_vigenciahasta, rm_basediaria, rm_basediarianorem, ' +
                  ' rm_diasfijo, rm_montofijo, rm_calcsacnorem, rm_montofijonoremun,  ' +
                  ' rm_contratoespecial, rm_calcsacrem ' +
             ' FROM sin.srm_remumaestropostdecreto ' +
            ' WHERE rm_id = :idrem ';
    with GetQueryEx(sSql, [vIdRem]) do
    try
      dcVigDesdeDE.Date             := FieldByName('rm_vigenciadesde').AsDateTime;
      dcVigHastaDE.Date             := FieldByName('rm_vigenciahasta').AsDateTime;
      edBaseDiariaPostDE.Value      := FieldByName('rm_basediaria').AsFloat;
      edBaseDiariaPostDENoRem.Value := FieldByName('rm_basediarianorem').AsFloat;
      edDiasFijoPostDE.Value        := FieldByName('rm_diasfijo').AsInteger;
      edMontoFijoPostDE.Value       := FieldByName('rm_montofijo').AsFloat;
      edMontoFijoNoRemPostDE.Value  := FieldByName('rm_montofijonoremun').AsFloat;
      chkEspecialPostDE.Checked     := (FieldByName('rm_contratoespecial').AsString = 'S');
      chkCalcSACNoRemPostDE.Checked := (FieldByName('rm_calcsacnorem').AsString = 'S');
      chkCalcSACRemPostDE.Checked   := FieldByName('rm_calcsacrem').IsNull or
                                      (FieldByName('rm_calcsacrem').AsString = 'S');
    finally
      Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.dgRemuVarPosDecreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key :=  PatchComma(Key);
end;
{-------------------------------------------------------------------------------}

procedure TfrmLiqIncapacidades.dgRemuFijaPosDecreKeyPress(Sender: TObject;  var Key: Char);
begin
  inherited;
  Key :=  PatchComma(Key);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.dgRemuVarPosDecrePaintFooter(
  Sender: TObject; Column: String; var Value: String; var CellColor,
  FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMAREMVAR);
  if (iPos > -1) and (iPos <= MAXCOLSREMVAR) then
    if iPos = 0 then
      Value := FloatToStr(TotalConsultaRemVar[iPos])
    else
      Value := Get_AjusteDecimales(FloatToStr(TotalConsultaRemVar[iPos]), '$');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.CalcTotalesPostDecreto;
var
  PrevCursor: TCursor;
  sSql: String;
begin
  if bCalcuPost then
  begin
    PrevCursor := Screen.Cursor;
    try
      Screen.Cursor := crHourGlass;
      try
        if sdqRemuVarPosDecre.Active and not(sdqRemuVarPosDecre.Eof) then
        begin
          sSql := 'SELECT SUM(md_dias) dias, ROUND(SUM(md_monto)/SUM(md_dias), 2) montoremun,  ' +
                        ' ROUND(SUM(md_montonoremun)/SUM(md_dias), 2) montonoremun ' +
                   ' FROM tmp.tmd_remudetallepostdecreto ' +
                  ' WHERE ((md_monto IS NOT NULL) OR ' +
                         ' (md_montonoremun IS NOT NULL)) ' +
                    ' AND md_dias IS NOT NULL ' +
                    ' AND md_dias  > 0 ' +
                    ' AND md_tiporemu = ''V'' ' +
                    ' AND md_usuario = :usuario';
          with GetQueryEx(sSql, [Sesion.UserID]) do
          try
            TotalConsultaRemVar[0] := FieldByName('dias').AsCurrency;
            TotalConsultaRemVar[1] := FieldByName('montoremun').AsCurrency;
            TotalConsultaRemVar[2] := FieldByName('montonoremun').AsCurrency;
          finally
            Free;
          end;
//          sSql := 'SELECT ROUND(SUM(md_montonoremun)/SUM(md_dias), 2) montonoremun ' +
//                   ' FROM tmp.tmd_remudetallepostdecreto ' +
//                  ' WHERE md_montonoremun IS NOT NULL ' +
//                    ' AND md_montonoremun > 0 ' +
//                    ' AND NVL(md_dias, 0) > 0 ' +
//                    ' AND md_tiporemu = ''V'' ' +
//                    ' AND md_usuario = :usuario';
//          TotalConsultaRemVar[2] := ValorSqlExtendedEx(sSql, [Sesion.UserID]);
        end;

        if (Accion <> l_None) and sdqRemuFijaPosDecre.Active then
        begin
          sdqRemuFijaPosDecre.DisableControls;
          SumFields(sdqRemuFijaPosDecre, CAMPOS_SUMAREMFIJA, TotalConsultaRemFija);
          DoCalcularRemuFija;
          sdqRemuFijaPosDecre.EnableControls;
        end;
      except
        on E: Exception do
          ErrorMsg(E, 'Error al Calcular los totales de remuneraciones post decreto.');
      end;
    finally
      Screen.Cursor := PrevCursor;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcTotalesPostDecreto;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (Accion <> l_None) then
  begin
    DoAplicarUpdates(sdqRemuVarPosDecre);
    CalcTotalesPostDecreto;

    Do_Validar180Dias;  // Plan
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sdqRemuVarPosDecre.Edit;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreDIASChange(Sender: TField);
begin
  inherited;
  if (Accion <> l_None) then
    CalcTotalesPostDecreto;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreMD_MONTOChange(Sender: TField);
begin
  inherited;
  if (Accion <> l_None) then
    CalcTotalesPostDecreto;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreDIASValidate(Sender: TField);
begin
  inherited;
  Verificar(Sender.IsNull or (Sender.Value <= 0) or (Sender.Value > 30),
            dgRemuVarPosDecre, 'El día es inválido.');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuVarPosDecreMD_MONTOValidate(Sender: TField);
begin
  inherited;
  if Sender.IsNull then Sender.Value := 0;
  Verificar(Sender.Value < 0, dgRemuVarPosDecre, 'El importe debe ser mayor o igual a 0');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuFijaPosDecreAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sdqRemuFijaPosDecre.Edit;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuFijaPosDecreDIASValidate(Sender: TField);
begin
  inherited;
  Verificar(Sender.IsNull or (Sender.Value <= 0) or (Sender.Value > 30),
            dgRemuFijaPosDecre, 'El día es inválido.');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuFijaPosDecreMD_MONTOValidate(Sender: TField);
begin
  inherited;
  if Sender.IsNull then Sender.Value := 0;
  Verificar(Sender.Value < 0, dgRemuFijaPosDecre, 'El importe debe ser mayor o igual a 0');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuFijaPosDecreCalcFields(DataSet: TDataSet);
var
  iDias: Integer;
begin
  inherited;
  iDias := IIF(DataSet.FieldByName('dias').IsNull, 1,
               IIF(chkEspecialPostDE.Checked, DiasMes, DataSet.FieldByName('dias').AsInteger));
  sdqRemuFijaPosDecreMONTODIARIO.AsCurrency := RoundNumber(DataSet.FieldByName('md_monto').AsCurrency /
                                                           iDias, 2);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoGrabarRemuPostDecreto(Siniestro, Orden: Integer);
var
  iIdRem: Integer;
  sSql: String;
begin
  if (vIdRem > 0) then
  begin
    sSql := 'UPDATE sin.srd_remudetallepostdecreto ' +
              ' SET (rd_dias, rd_monto, rd_montonoremun, rd_usumodif, rd_fechamodif) = ' +
           ' (SELECT md_dias, md_monto, md_montonoremun, :usuario, actualdate ' +
             ' FROM tmp.tmd_remudetallepostdecreto ' +
             ' WHERE md_id = rd_id ' +
               ' AND md_usuario = :usuario) ' +
             ' WHERE rd_idremu = :idremu ';
    EjecutarSqlSTEx(sSql, [Sesion.UserID, Sesion.UserID, vIdRem]);

    sSql := 'UPDATE sin.srm_remumaestropostdecreto ' +
              ' SET rm_vigenciadesde = :desde, ' +
                  ' rm_basediaria = :basediaria, ' +
                  ' rm_basediarianorem = :bdnorem, ' +
                  ' rm_diasfijo = :diasf, ' +
                  ' rm_montofijo = :montof, ' +
                  ' rm_montofijonoremun = :norem, ' +
                  ' rm_calcsacnorem = :calc, ' +
                  ' rm_calcsacrem = :sacrem, ' +
                  ' rm_contratoespecial = :espe, ' +
                  ' rm_usumodif = :usuario, ' +
                  ' rm_fechamodif = ActualDate ' +
            ' WHERE rm_id = :idremu ';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(dcVigDesdeDE.Date), edBaseDiariaPostDE.Value,
                           edBaseDiariaPostDENoRem.Value, edDiasFijoPostDE.Value,
                           edMontoFijoPostDE.Value, edMontoFijoNoRemPostDE.Value,
                           SqlBoolean(chkCalcSACNoRemPostDE.Checked, False),
                           SqlBoolean(chkCalcSACRemPostDE.Checked, False),                           
                           SqlBoolean(chkEspecialPostDE.Checked, False),
                           Sesion.UserID, vIdRem]);
  end                                                  
  else begin
    iIdRem := GetSecNextVal('sin.seq_srm_id');
    sSql   := 'INSERT INTO sin.srm_remumaestropostdecreto ' +
              '(rm_id, rm_siniestro, rm_orden, rm_vigenciadesde, rm_basediaria, ' +
              ' rm_basediarianorem, rm_diasfijo, rm_montofijo, rm_montofijonoremun, ' +
              ' rm_calcsacnorem, rm_calcsacrem, rm_contratoespecial, rm_usualta, ' +
              ' rm_fechaalta) VALUES (' +
              SqlInt(iIdRem) + ',' + SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' +
              SqlDate(dcVigDesdeDE.Date) + ',' + SqlNumber(edBaseDiariaPostDE.Value) + ',' +
              SqlNumber(edBaseDiariaPostDENoRem.Value) + ',' + SqlInt(edDiasFijoPostDE.Value) + ',' +
              SqlNumber(edMontoFijoPostDE.Value) + ',' + SqlNumber(edMontoFijoNoRemPostDE.Value) + ',' +
              SqlBoolean(chkCalcSACNoRemPostDE.Checked) + ',' + SqlBoolean(chkCalcSACRemPostDE.Checked) + ',' +
              SqlBoolean(chkEspecialPostDE.Checked) + ',' + SqlValue(Sesion.UserID) + ', ActualDate)';
    EjecutarSqlST(sSql);

    sSql := 'INSERT INTO SIN.srd_remudetallepostdecreto ' +
            '(rd_id, rd_idremu, rd_tiporemu, rd_dias, rd_periodo, rd_monto, ' +
            ' rd_montonoremun, rd_usualta, rd_fechaalta) ' +
            ' SELECT md_id, :idrem, md_tiporemu, md_dias, md_periodo, md_monto, ' +
                   ' md_montonoremun, :usuario, actualdate ' +
              ' FROM tmp.tmd_remudetallepostdecreto ' +
             ' WHERE md_usuario = :usuario ';
    EjecutarSqlSTEx(sSql, [iIdRem, Sesion.UserID]);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuFijaPosDecreAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbBajaRemuClick(Sender: TObject);
var
  sSql: String;
  iIdRem: Integer;
  dHasta: TDate;
begin
  Verificar(not(dcVigHastaDE.IsEmpty), dcVigHastaDE, 'La vigencia ya se encuentra cerrada.');
  sSql   := 'SELECT rm_id ' +
             ' FROM sin.srm_remumaestropostdecreto ' +
            ' WHERE rm_siniestro = :sin ' +
              ' AND rm_orden = :ord ' +
              ' AND rm_vigenciahasta IS NULL ' +
              ' AND rm_fechabaja IS NULL ';
  iIdRem := ValorSqlIntegerEx(sSql, [vSiniestro, vOrden]);

  if (iIdRem > 0) and MsgAsk('¿Confirma dar de baja las remuneraciones actuales?') then
  begin
    dHasta := InputBoxDate('Vigencia hasta', 'Ingrese la fecha de vigencia hasta',
                           DBDate, dcVigDesdeDE.Date);
    if (dHasta <= 0) then
      InfoHint(dcVigHastaDE, 'No se ingresó una fecha valida de vigencia hasta.')
    else begin
      sSql := 'UPDATE sin.srm_remumaestropostdecreto ' +
                ' SET rm_vigenciahasta = :fecha, ' +
                    ' rm_usumodif = :usuario, ' +
                    ' rm_fechamodif = ActualDate ' +
              ' WHERE rm_id = :idrem ';
      EjecutarSqlEx(sSql, [TDateTimeEx.Create(dHasta), Sesion.UserID, iIdRem]);
      MsgBox('Vigencia cerrada correctamente.', MB_ICONINFORMATION);
      DoCargarGrillaRemunPostDecreto;
      dcVigDesdeDE.Date := dHasta + 1;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbAntRemuClick(Sender: TObject);
begin
  DoCargarGrillaRemunPostDecreto(dcVigDesdeDE.Date, '<');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbDespRemuClick(Sender: TObject);
begin
  DoCargarGrillaRemunPostDecreto(dcVigDesdeDE.Date, '>');
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.dgRemuVarPosDecreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Accion <> l_None) and (Key in [13,20,37,38,39,40]) then
  begin
    DoAplicarUpdates(sdqRemuVarPosDecre);
    CalcTotalesPostDecreto;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.dgRemuFijaPosDecreKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Accion <> l_None) and (Key in [13,20,37,38,39,40]) then
    DoAplicarUpdates(sdqRemuFijaPosDecre);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.dgRemuVarPosDecreExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    DoAplicarUpdates(sdqRemuVarPosDecre);
    CalcTotalesPostDecreto;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.dgRemuFijaPosDecreExit(Sender: TObject);
begin
  if (Accion <> l_None) then
    DoAplicarUpdates(sdqRemuFijaPosDecre);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraBancoILPOnChange(Sender: TObject);
begin
  SetChequeANombreILP;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fraBancoILTOnChange(Sender: TObject);
begin
  SetChequeANombreILT;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.fpRemuDDJJBeforeShow(Sender: TObject);
begin
  btnCargaDDJJ.Visible := (fpRemuDDJJ.Tag = 1);
  with sdqRemuDDJJ do
  begin
    Close;
    ParamByName('idexpediente').AsInteger := vIdExpediente;
    Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuDDJJAfterOpen(DataSet: TDataSet);
begin
  if sdqRemuDDJJ.FieldByName('noremunerativo') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('noremunerativo')).Currency := True;
  if sdqRemuDDJJ.FieldByName('remimponible') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('remimponible')).Currency := True;
  if sdqRemuDDJJ.FieldByName('remtot') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('remtot')).Currency := True;
  if sdqRemuDDJJ.FieldByName('sueldoconadic') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('sueldoconadic')).Currency := True;
  if sdqRemuDDJJ.FieldByName('sac') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('sac')).Currency := True;
  if sdqRemuDDJJ.FieldByName('zonades') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('zonades')).Currency := True;
  if sdqRemuDDJJ.FieldByName('extras') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('extras')).Currency := True;
  if sdqRemuDDJJ.FieldByName('vacaciones') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('vacaciones')).Currency := True;
  if sdqRemuDDJJ.FieldByName('dt_adicionales') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('dt_adicionales')).Currency := True;
  if sdqRemuDDJJ.FieldByName('dt_premios') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('dt_premios')).Currency := True;
  if sdqRemuDDJJ.FieldByName('apvolss') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('apvolss')).Currency := True;
  if sdqRemuDDJJ.FieldByName('apobliss') is TFloatField then
    TFloatField(sdqRemuDDJJ.FieldByName('apobliss')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnCargaDDJJClick(Sender: TObject);
begin
  if sdqRemuDDJJ.Active and not(sdqRemuDDJJ.IsEmpty) and
     MsgAsk('¿Confirma cargar los valores declarados a los datos económicos?') then
    fpRemuDDJJ.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoCalcularRemuFija;
var
  i, iDias: Integer;
  cFijo, cNoRemun, cRemun, cSacNoRemun, cMontoFijo, cMontoFijoNoRem: Currency;
//  sPerAnt: String;
//  Bookmk: TBookmarkStr;
begin
{a esto lo dejo comentado porque cuando quieran volver a sacar el mayor entre el
 promedio y el ultimo, ya esta aca....}
//  sPerAnt     := ValorSqlEx('SELECT TO_CHAR(ADD_MONTHS(ex_fechaaccidente, -1), ''yyyymm'') ' +
//                             ' FROM sex_expedientes ' +
//                            ' WHERE ex_id = :idexped', [vIdExpediente]);
//  cUltimo     := 0;
//  with sdqRemuVarPosDecre do
//  try
//    DisableControls;
//    Bookmk := Bookmark;
//    if Locate('md_periodo', sPerAnt, []) then
//      cUltimo := FieldByName('md_monto').AsCurrency;
//    Bookmark := Bookmk;
//  finally
//    EnableControls;
//  end;

  iDias         := IIF(chkEspecialPostDE.Checked, DiasMesEsp, DiasMes);
  cRemun        := 0;
  cNoRemun      := 0;
  cFijo         := TotalConsultaRemVar[1] * iDias;

  if (edMontoFijoPostDE.Value > 0) and (edDiasFijoPostDE.Value > 0) then
    cMontoFijo := (edMontoFijoPostDE.Value / edDiasFijoPostDE.Value) * iDias
  else
    cMontoFijo := 0;

  if (edMontoFijoNoRemPostDE.Value > 0) and (edDiasFijoPostDE.Value > 0) then
    cMontoFijoNoRem := (edMontoFijoNoRemPostDE.Value / edDiasFijoPostDE.Value) * iDias
  else
    cMontoFijoNoRem := 0;

  with sdqRemuFijaPosDecre do
  try
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      if (FieldByName('md_tiporemu').AsString = 'F') then //el importe fijo/remunerativo
      begin
        dgRemuFijaPosDecre.Fields[1].AsInteger  := iDias;
        dgRemuFijaPosDecre.Fields[2].AsCurrency := cFijo + cMontoFijo;
        cRemun := dgRemuFijaPosDecre.Fields[3].AsCurrency;
      end
      else if (FieldByName('md_tiporemu').AsString = 'S') then //el SAC
      begin
        dgRemuFijaPosDecre.Fields[1].AsInteger  := iDias;
        dgRemuFijaPosDecre.Fields[2].AsCurrency := IIF((cFijo + cMontoFijo > 0) and chkCalcSACRemPostDE.Checked,
                                                       ((cFijo + cMontoFijo) * PorcSAC) / 100, 0);
        cRemun := cRemun + dgRemuFijaPosDecre.Fields[3].AsCurrency;
      end
      else if (FieldByName('md_tiporemu').AsString = 'N') then //el importe no remunerativo
      begin
        cNoRemun := TotalConsultaRemVar[2];
        dgRemuFijaPosDecre.Fields[1].AsInteger  := iDias;
        dgRemuFijaPosDecre.Fields[2].AsCurrency := (cNoRemun * iDias) + cMontoFijoNoRem;
        cNoRemun := dgRemuFijaPosDecre.Fields[3].AsCurrency
      end
      else if (FieldByName('md_tiporemu').AsString = 'R') then //el importe SAC no remunerativo
      begin
        cSacNoRemun := (TotalConsultaRemVar[2] * iDias) + cMontoFijoNoRem;
        cSacNoRemun := IIF((cSacNoRemun > 0) and chkCalcSACNoRemPostDE.Checked,
                           (cSacNoRemun * PorcSAC) / 100, 0);
        dgRemuFijaPosDecre.Fields[1].AsInteger  := iDias;
        dgRemuFijaPosDecre.Fields[2].AsCurrency := cSacNoRemun;
        cNoRemun := cNoRemun + dgRemuFijaPosDecre.Fields[3].AsCurrency;
      end;
      Next;
    end;
  finally
    EnableControls;
  end;

  edBaseDiariaPostDE.Value      := cRemun;
  edBaseDiariaPostDENoRem.Value := cNoRemun;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.MnuRemuAnteriorDecretoClick(Sender: TObject);
begin
  if not(fraTrabajadorSIN.edSiniestro.IsEmpty) and (Accion = l_None) then
  begin
    fpRemuneraciones.Tag := 0;
    fpRemuneraciones.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuRemuPosteriorDecretoClick(Sender: TObject);
begin
  if not(fraTrabajadorSIN.edSiniestro.IsEmpty) and (Accion = l_None) and
     Is_SiniPostDecreto1694(edSinFecha.Date) then
  begin
    fpRemuDDJJ.Tag := 0;
    fpRemuDDJJ.ShowModal;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuFijaPosDecreAfterPost(DataSet: TDataSet);
begin
  if (Accion <> l_None) then
    DoAplicarUpdates(sdqRemuFijaPosDecre);
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.sdqRemuFijaPosDecreAfterOpen(DataSet: TDataSet);
begin
  if (Accion <> l_None) then
    sdqRemuFijaPosDecre.Edit;
  inherited;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqIncapacidades.PuedeModificarDEAprob(bSoloPost: Boolean): Boolean;
const
  sMens = 'No es posible modificar las remuneraciones actuales ya que ' + #13 +
          'existen liquidaciones aprobadas con estos valores.';
var
  sSql: String;
  bTieneApro: Boolean;
begin
  sSql   := 'SELECT 1 ' +
             ' FROM sle_liquiempsin, secb_cbaseexpsin ' +
             ' WHERE le_siniestro = cb_siniestro ' +
               ' AND le_orden = cb_orden ' +
               ' AND le_siniestro = :sini ' +
               ' AND le_orden = :ord ' +
               ' AND le_recaida = :reca ' +
               ' AND NVL(le_estado, '' '') IN  (''E'', ''P'')';
  if bSoloPost then
  begin
    sSql        := sSql + ' AND le_tipoliqui IN (''I'', ''L'', ''D'') ' +
                          ' AND le_idbasepost = :idbase ';
    bTieneApro  := ExisteSqlEx(sSql, [vSiniestro, vOrden, vRecaida, vIdRem]);
    if not(bTieneApro) then
      Result := True
    else if Seguridad.Claves.IsActive('ModifDEAprob') then
      Result := MsgAsk('Atención: existen liquidaciones aprobadas con estos valores, ¿desea continuar?')
    else begin
      MsgBox(sMens, MB_ICONEXCLAMATION);
      Result := False;
    end;
  end
  else begin
    sSql    := sSql + ' AND le_tipoliqui IN (''I'', ''D'') ' +
                      ' AND le_base_3mopres = ''N'' ' +
                      ' AND cb_base_3mopres = ''N'' ' +
                      ' AND le_esanticipomopres = ''N'' ';
    if Seguridad.Claves.IsActive('ModifDEAprob') or
       not(ExisteSqlEx(sSql, [vSiniestro, vOrden, vRecaida])) then
      Result := True
    else begin
      MsgBox(sMens, MB_ICONEXCLAMATION);
      Result := False;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnExportarDDJJClick(Sender: TObject);
begin
  edDDJJ.Title := 'Declaración jurada de remuneraciones - Siniestro : ' + fraTrabajadorSIN.Siniestro;
  edDDJJ.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edDiasFijoPostDEChange(Sender: TObject);
begin
  if (Accion <> l_None) and sdqRemuFijaPosDecre.Active then
  begin
    if (edDiasFijoPostDE.Value = 0) then
    begin
      edMontoFijoPostDE.Value       := 0;
      edMontoFijoNoRemPostDE.Value  := 0;
    end;
    DoCalcularRemuFija;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edMontoFijoPostDEChange(Sender: TObject);
begin
  if (Accion <> l_None) and sdqRemuFijaPosDecre.Active then
  begin
    if (edMontoFijoPostDE.Value = 0) and
       (edMontoFijoNoRemPostDE.Value = 0) then
    edDiasFijoPostDE.Value := 0;
    DoCalcularRemuFija;
  end;
end;
procedure TfrmLiqIncapacidades.EdNewCDExit(Sender: TObject);
begin
  CalcTotalEditarImporte;
end;

procedure TfrmLiqIncapacidades.EdNewPAExit(Sender: TObject);
begin
  CalcTotalEditarImporte;
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.chkCalcSACNoRemPostDEClick(Sender: TObject);
begin
  if (Accion <> l_None) and sdqRemuFijaPosDecre.Active then
    DoCalcularRemuFija;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnImprimirDDJJClick(Sender: TObject);
begin
  if PrintDialog.Execute then
  begin
    qpDDJJ.Title.Text     := 'DDJJ de remuneraciones';
    qpDDJJ.SubTitle.Text  := 'Siniestro:' + IntToStr(vSiniestro) +
                                ' - Orden:' + IntToStr(vOrden) +
                                ' - Recaida:' + IntToStr(vRecaida) +
                                ' - ' + fraTrabajadorSIN.Nombre + '(' + fraTrabajadorSIN.CUIL + ')';
    qpDDJJ.Print;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.mnuExcluirDisketeClick(Sender: TObject);
var
  oLiq: TLiquidacion;
begin
  if HayRegistroActivo then
  begin
    oLiq := TLiquidacion(IIF(PageControl.ActivePage = tsILT, oILT, oILP));
    if oLiq.IsExcluibleDkt then
    begin
      oLiq.DoGrabarMarcaGeneraAsignacion('N');
      MsgBox('La liquidación ha sido excluida del diskette', MB_ICONINFORMATION + MB_OK);
    end
    else
      MsgBox('Esta liquidación no se puede excluir del diskette', MB_ICONEXCLAMATION + MB_OK);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edImpEmpNoRemILTExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    oILT.ImporteEmpNoRem := edImpEmpNoRemILT.Value;
    DoRefrescarILT;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.edDiferenciaNoRemILTChange(Sender: TObject);
begin
  edDiferenciaNoRemILT.Font.Color := IIF((edDiferenciaNoRemILT.Value < 0), clRed, clBlack);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.SetLblTipoLiq;
begin
  with oILP do
    lblTipoLiqILP.Caption := IIF(GenerarPagoUnico, 'Suma fija',
                                IIF(LiqIndemnizacion, 'Indemnización',
                                   IIF(GenerarAnticipo, 'Anticipo',
                                      IIF(LiqRtaDevengada, 'Rta. devengada',
                                         IIF(LiqDifRtaPeriodica, 'Dif. rta. periódica',
                                            IIF(LiqAsigFamiliar, 'Asign. familiar', 'Pago mensual'))))));
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.pcRemuneracionesChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if ConfirmaCancelar then
  begin
    AllowChange := True;
    if (Accion <> l_None) then DoCargarLiquidaciones(False);
  end
  else
    AllowChange := False;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnRecibosILTClick(Sender: TObject);
begin
  rbOtro_Recibos.Enabled := True;
  if fpDomicilioRecibos.ShowModal = mrOk then
    Do_GuardarRecibosILT;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnRecibosOPClick(Sender: TObject);
begin
  rbOtro_Recibos.Enabled      := False;
  rbDomicilio_Recibos.Checked := True;
  try
    if Accion = l_Alta then
      fraDomicilioRecibos.Clear
    else
      Do_CargarFrameRecibosOP;

    if fpDomicilioRecibos.ShowModal = mrOk then
      Do_GuardarRecibosOP;
  finally
    rbDomicilio_Recibos.Checked := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnRecibosILPClick(Sender: TObject);
begin
  rbOtro_Recibos.Enabled := True;
  if fpDomicilioRecibos.ShowModal = mrOk then
    Do_GuardarRecibosILP;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.btnAceptarDomReciboClick(Sender: TObject);
begin
  Verificar(rbDomicilio_Recibos.Checked and
           ((fraDomicilioRecibos.IsEmpty) or
            (fraDomicilioRecibos.Calle = '') or
            (fraDomicilioRecibos.CodigoPostal = '')),
            fraDomicilioRecibos, 'Debe completar el Domicilio para el envío de Recibos.');
  fpDomicilioRecibos.ModalResult := mrOk
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.Do_GuardarRecibosILT;
begin
  // Guardo en las propertys
  oILT.CodigoPostalRec := fraDomicilioRecibos.CodigoPostal;
  oILT.CalleRec        := fraDomicilioRecibos.Calle;
  oILT.LocalidadRec    := fraDomicilioRecibos.Localidad;
  oILT.ProvinciaRec    := fraDomicilioRecibos.Provincia;
  oILT.ProvRec         := fraDomicilioRecibos.Prov;
  oILT.NumeroRec       := fraDomicilioRecibos.Numero;
  oILT.PisoRec         := fraDomicilioRecibos.Piso;
  oILT.DepartamentoRec := fraDomicilioRecibos.Departamento;
  oILT.CPARec          := fraDomicilioRecibos.CPA;
  oILT.OtroRec         := MemoOtroRecibos.Lines.text;
  oILT.ChkOtroRec      := rbOtro_Recibos.Checked;
  oILT.ChkDomicilioRec := rbDomicilio_Recibos.Checked;

  if rbDomicilio_Recibos.Checked then
    oILT.Recibos := fraDomicilioRecibos.Calle + ' ' +
                    IIF(fraDomicilioRecibos.Numero <> '', fraDomicilioRecibos.Numero, '') +
                    IIF(fraDomicilioRecibos.Piso <> '', ' Piso ' + fraDomicilioRecibos.Piso, '') +
                    IIF(fraDomicilioRecibos.Departamento <> '', ' Dpto.' + fraDomicilioRecibos.Departamento, '') +
                    IIF(fraDomicilioRecibos.Localidad <> '', ' Loc.' + fraDomicilioRecibos.Localidad, '')
  else
    oILT.Recibos := MemoOtroRecibos.Lines.Text;

  edRecibosILT.Lines.Text := oILT.Recibos;
end;

procedure TfrmLiqIncapacidades.Do_LimpiarFrameDomicRec_ILT;
begin
  with fraDomicilioRecibos do
  begin
    Calle        := '';
    Numero       := '';
    Piso         := '';
    Departamento := '';
    CodigoPostal := '';
    CPA          := '';
    Localidad    := '';
    Provincia    := '';
    Prov         := 0;
  end;
end;

procedure TfrmLiqIncapacidades.rbDomicilio_RecibosClick(Sender: TObject);
begin
  LockControl(fraDomicilioRecibos, False);
  LockControl(MemoOtroRecibos, True);
  MemoOtroRecibos.Clear;
end;

procedure TfrmLiqIncapacidades.rbOtro_RecibosClick(Sender: TObject);
begin
  LockControl(MemoOtroRecibos, False);
  LockControl(fraDomicilioRecibos, True);
  fraDomicilioRecibos.Clear;
end;

procedure TfrmLiqIncapacidades.fpDomicilioRecibosBeforeShow(Sender: TObject);
begin
  case PageControl.ActivePageIndex  of
    ctsILP  : DoBeforeShowILP;
    ctsILT  : DoBeforeShowILT;
  end;
end;

procedure TfrmLiqIncapacidades.Do_GuardarRecibosILP;
begin
  // Guardo en las propertys
  oILP.CodigoPostalRec := fraDomicilioRecibos.CodigoPostal;
  oILP.CalleRec        := fraDomicilioRecibos.Calle;
  oILP.LocalidadRec    := fraDomicilioRecibos.Localidad;
  oILP.ProvinciaRec    := fraDomicilioRecibos.Provincia;
  oILP.ProvRec         := fraDomicilioRecibos.Prov;
  oILP.NumeroRec       := fraDomicilioRecibos.Numero;
  oILP.PisoRec         := fraDomicilioRecibos.Piso;
  oILP.DepartamentoRec := fraDomicilioRecibos.Departamento;
  oILP.CPARec          := fraDomicilioRecibos.CPA;
  oILP.OtroRec         := MemoOtroRecibos.Lines.text;
  oILP.ChkOtroRec      := rbOtro_Recibos.Checked;
  oILP.ChkDomicilioRec := rbDomicilio_Recibos.Checked;

  if rbDomicilio_Recibos.Checked then
    oILP.Recibos := fraDomicilioRecibos.Calle + ' ' +
                    IIF(fraDomicilioRecibos.Numero <> '', fraDomicilioRecibos.Numero, '') +
                    IIF(fraDomicilioRecibos.Piso <> '', ' Piso ' + fraDomicilioRecibos.Piso, '') +
                    IIF(fraDomicilioRecibos.Departamento <> '', ' Dpto.' + fraDomicilioRecibos.Departamento, '') +
                    IIF(fraDomicilioRecibos.Localidad <> '', ' Loc.' + fraDomicilioRecibos.Localidad, '')
  else
    oILP.Recibos := MemoOtroRecibos.Lines.Text;

  edRecibosILP.Lines.Text := oILP.Recibos;

end;

procedure TfrmLiqIncapacidades.DoBeforeShowILP;
begin
  rbDomicilio_Recibos.Checked := oILP.ChkDomicilioRec;
  rbOtro_Recibos.Checked      := oILP.ChkOtroRec;

  if oILP.ChkDomicilioRec then    // Domicilio
    fraDomicilioRecibos.Cargar(oILP.CalleRec, oILP.CodigoPostalRec, oILP.LocalidadRec,
                               oILP.NumeroRec, oILP.PisoRec, oILP.DepartamentoRec,
                               oILP.ProvinciaRec, oILP.CPARec)
  else
    MemoOtroRecibos.Lines.text := oILP.OtroRec;
end;

procedure TfrmLiqIncapacidades.DoBeforeShowILT;
begin
  rbDomicilio_Recibos.Checked := oILT.ChkDomicilioRec;
  rbOtro_Recibos.Checked      := oILT.ChkOtroRec;

  if oILT.ChkDomicilioRec then    // Domicilio
    fraDomicilioRecibos.Cargar(oILT.CalleRec, oILT.CodigoPostalRec, oILT.LocalidadRec,
                               oILT.NumeroRec, oILT.PisoRec, oILT.DepartamentoRec,
                               oILT.ProvinciaRec, oILT.CPARec)
  else
    MemoOtroRecibos.Lines.text := oILT.OtroRec;
end;


procedure TfrmLiqIncapacidades.Do_Validar180Dias;   // Plan Carga de datos del Periodo del accidente
var sSql: string;
begin
  sSql := 'SELECT SUM(md_dias) dias ' +
           ' FROM tmp.tmd_remudetallepostdecreto ' +
          ' WHERE ((md_monto IS NOT NULL) OR ' +
                   ' (md_montonoremun IS NOT NULL)) ' +
            ' AND md_dias IS NOT NULL ' +
            ' AND md_dias  > 0 ' +
            ' AND md_tiporemu = ''V'' ' +
            ' AND md_usuario = :usuario';
  with GetQueryEx(sSql, [Sesion.UserID]) do
  try
    if (FieldByName('dias').AsCurrency > 180) then
    begin
      sdqRemuVarPosDecre.Edit;
      sdqRemuVarPosDecre.FieldByName('md_monto').value        := Null;
      sdqRemuVarPosDecre.FieldByName('md_montonoremun').value := Null;
      sdqRemuVarPosDecre.Post;
      CalcTotalesPostDecreto;
      Verificar(True, GridDERemuneraciones, 'La cantidad de días total ingresados no puede superar los 180. Por favor edite la grilla.');
    end;
  finally
    Free;
  end;
end;

function TfrmLiqIncapacidades.TrabajadorExisteEnCtaCte(sCuil: string; var iIdMaxCtaCte:integer): boolean;   // Plan Registro de Pagos cancelados
var sSql: string;
begin
  Result := False;
  sSql   := ' SELECT MAX(cl_id) id FROM sin.scl_compensacionliquidaciones ' +
             ' WHERE cl_cuil = :CUIL ' +
               ' AND cl_fechabaja IS NULL ';

  with GetQueryEx(sSql, [sCuil]) do
  try
    if (not Eof) and (not FieldByName('ID').isNull) then  // este not is null lo pongo porque el MAX siempre arroja un registro.
    begin
      Result       := true;   // porque existe
      iIdMaxCtaCte := FieldByName('ID').AsInteger;  // trae el maximo Id de ese cuil (trabajador) en donde esta acumulado el ultimo saldo
    end;
  finally
    Free;
  end;
end;

procedure TfrmLiqIncapacidades.DoGuardarCuentaCorriente_Suma(iNroLiq: integer; cuAPagar: Currency; bConTransaccion: Boolean = True);   // Plan Registro de Pagos cancelados
var iIdMaxCtaCte: integer;
    cuSaldo: Currency;
begin
  if TrabajadorExisteEnCtaCte(fraTrabajadorSIN.CUIL, iIdMaxCtaCte) then // si ya tiene Cta Cte
    cuSaldo := Get_SaldoDeCtaCte(iIdMaxCtaCte) + cuAPagar    // Acumulo
  else                             // si no posee Cta Cte, se inserta (con importe neto = saldo), y el Saldo es el APagar.
    cuSaldo := cuAPagar;
  Do_Insertar_CompensacionLiquidaciones(iNroLiq, fraTrabajadorSIN.CUIL, cuAPagar, cuSaldo, 'S', bConTransaccion);
end;

procedure TfrmLiqIncapacidades.tbCompSalirClick(Sender: TObject);                 // Plan Registro de Pagos cancelados
begin
  fpCompensacion.ModalResult := mrOk;
end;

procedure TfrmLiqIncapacidades.mnuCompensacionClick(Sender: TObject);             // Plan Registro de Pagos cancelados
begin
  if (PageControl.ActivePageIndex in [ctsILP, ctsILT]) and (not fraTrabajadorSIN.IsEmpty) then
    fpCompensacion.ShowModal;
end;

procedure TfrmLiqIncapacidades.fpCasosActivosPDShow(Sender: TObject);
begin
  cbCasosARelacionar.Clear;
end;

procedure TfrmLiqIncapacidades.fpCompensacionBeforeShow(Sender: TObject);         // Plan Registro de Pagos cancelados
begin
  lCompCUIL.Caption       := PonerGuiones(fraTrabajadorSIN.Cuil);
  lCompTrabajador.Caption := fraTrabajadorSIN.Nombre;
  DoRefrescarGrillaCompensacion(fraTrabajadorSIN.Cuil);
end;

procedure TfrmLiqIncapacidades.DoRefrescarGrillaCompensacion(sCuil: string);      // Plan Registro de Pagos cancelados
begin
  with sdqCompensacion do
  begin
    Close;
    ParamByName('pcuil').AsString := sCuil;
    Open;
  end;
end;

procedure TfrmLiqIncapacidades.tbCompExportarClick(Sender: TObject);    // Plan Registro de Pagos cancelados
begin
  ExportDialogComp.Title := 'Estado de compensación - CUIL ' + PonerGuiones(fraTrabajadorSIN.Cuil) + ' - Trabajador ' + fraTrabajadorSIN.Nombre;
  ExportDialogComp.Execute;
end;

procedure TfrmLiqIncapacidades.tbCompImprimirClick(Sender: TObject);    // Plan Registro de Pagos cancelados
begin
  QueryPrintComp.Title.Text := 'Estado de compensación - CUIL ' + PonerGuiones(fraTrabajadorSIN.Cuil) + ' - Trabajador ' + fraTrabajadorSIN.Nombre;
  QueryPrintComp.Print;
end;

function TfrmLiqIncapacidades.Get_SaldoDeCtaCte(iIdMaxCtaCte: integer): Currency;     // por Plan Registro de pagos cancelados
var sSql: string;
begin
  sSql := 'SELECT cl_saldo FROM sin.scl_compensacionliquidaciones ' +
          ' WHERE cl_id = :id ';

  Result := ValorSqlExtendedEx(sSql, [iIdMaxCtaCte]);
end;

procedure TfrmLiqIncapacidades.DoEvaluarCompensacion(iNroLiqui: integer; cuAPagar: Currency);   // Plan Registro de Pagos cancelados (cuando se Resta la liquidación)
var iIdMaxCC: integer;
    cuSaldo: Currency;
begin
  iIdMaxCC := 0;
  if ( (PageControl.ActivePageIndex = ctsILP) or ((PageControl.ActivePageIndex = ctsILT) and (fraTipoILT.Code <> 'L')))  // o es ILP, o si es ILT tiene que ser distinto a Reintegro
    and TrabajadorExisteEnCtaCte(fraTrabajadorSIN.CUIL, iIdMaxCC) then   // Si existe en la compensacion
  begin
    // Obtengo el Saldo en la Cta Cte
    cuSaldo := Get_SaldoDeCtaCte(iIdMaxCC);
    if (cuSaldo > 0) then // ya que si llego a 0, ya esta todo compensado y no hace nada
      DoGuardarCuentaCorriente_Resta(cuSaldo, cuAPagar, iNroLiqui, fraTrabajadorSIN.CUIL);
  end;
end;

procedure TfrmLiqIncapacidades.Do_Insertar_CompensacionLiquidaciones(iNroLiq: integer; sCuil: string; cuAPagar, cuSaldo: Currency; sSuma:string; bConTransaccion: Boolean = True);
var sSqlInsert:string;
begin
  try
    if bConTransaccion then BeginTrans;
    sSqlInsert := 'INSERT INTO sin.scl_compensacionliquidaciones ' +
                  ' (cl_idexpediente, cl_liquidacion, cl_cuil, cl_neto, cl_saldo, cl_suma, cl_fechaalta, cl_usualta) ' +
                  ' VALUES ' +
                  '( ' + SqlInt(vIdExpediente) + ',' + SqlInt(iNroLiq) + ',' +
                  SqlValue(sCuil) + ',' + SqlNumber(cuAPagar) + ',' +
                  SqlNumber(cuSaldo) + ', ' + SqlValue(sSuma) + ', ART.actualdate, ' + SqlValue(Sesion.UserID) + ')';

    EjecutarSqlST(sSqlInsert);
    if bConTransaccion then CommitTrans;
  except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar guardar los datos. (Cta.Cte.).');
      if bConTransaccion then Rollback;
    end;
  end;
end;

procedure TfrmLiqIncapacidades.DoGuardarCuentaCorriente_Resta(cuSaldo, cuAPagar: Currency; iNroLiqui: integer; sCuil: string);
var cuResultado: Currency;
begin
  cuResultado := (cuSaldo - cuAPagar);

  if (cuSaldo >= cuAPagar) then
  begin
    Do_Insertar_CompensacionLiquidaciones(iNroLiqui, sCuil, cuAPagar, cuResultado, 'N');
    Do_Modificar_TotalAPagar(iNroLiqui, 0, cuSaldo);
  end
  else if (cuSaldo < cuAPagar) then
  begin
    Do_Insertar_CompensacionLiquidaciones(iNroLiqui, sCuil, cuAPagar, 0, 'N');
    Do_Modificar_TotalAPagar(iNroLiqui, (- cuResultado), cuSaldo);
  end;

end;

procedure TfrmLiqIncapacidades.Do_Modificar_TotalAPagar(iNroLiq: integer; cuAPagar: Currency; cuSaldoAnt: Currency = 0);
var sSql, sObs, sSqlObs, sLiquiComp, sSiniestro, sSaldoComp: string;
    iIdMaxCC: integer;
    cuSaldo, cuImporteNeto, cuImporteResta: Currency;
begin
  Try
    BeginTrans;

    // para Observaciones
    iIdMaxCC := 0;
    TrabajadorExisteEnCtaCte(fraTrabajadorSIN.CUIL, iIdMaxCC);  // esto lo hago solamente para sacar el iIdMaxCC
    cuSaldo       := Get_SaldoDeCtaCte(iIdMaxCC);
    cuImporteNeto := Get_ImporteNetoCompResta(iIdMaxCC);   // Plan Registro de Pagos cancelados (arreglo del ImporPeri)

    if (cuSaldo = 0) then
      sObs := 'Con esta liquidación finaliza la compensación. Las liquidaciones subsiguientes estarán a vuestra disposición en los plazos legales.'
    else begin

      sSqlObs := ' SELECT A.cl_liquidacion liqui, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro ' +
                   ' FROM sin.scl_compensacionliquidaciones A, art.sex_expedientes ' +
                  ' WHERE ex_id = A.cl_idexpediente ' +
                    ' AND A.cl_id = (SELECT max(B.cl_id) ' +
                                     ' FROM sin.scl_compensacionliquidaciones B ' +
                                    ' WHERE B.cl_cuil = :cuil ' +
                                      ' AND B.cl_suma = ''S'') ';

      with GetQueryEx(sSqlObs, [fraTrabajadorSIN.CUIL]) do
      try
        sLiquiComp        := FieldByName('LIQUI').AsString;
        sSiniestro        := FieldByName('SINIESTRO').AsString;
      finally
        Free;
      end;

      sSqlObs := ' SELECT A.cl_saldo ' +
                   ' FROM sin.scl_compensacionliquidaciones A ' +
                  ' WHERE A.cl_id = (SELECT max(B.cl_id) ' +
                                     ' FROM sin.scl_compensacionliquidaciones B ' +
                                    ' WHERE B.cl_cuil = :cuil ' +
                                      ' AND B.cl_suma = ''N'') ';
      sSaldoComp := ValorSqlEx(sSqlObs, [fraTrabajadorSIN.CUIL]);
      sObs := 'No genera cheque - Compensa con Siniestro ' + sSiniestro + ', liquidación número ' + sLiquiComp +
              ' - Saldo $ ' + sSaldoComp;
    end;


    cuImporteResta := MinFloat(cuSaldoAnt, cuImporteNeto); // minimo entre el Saldo anterior y el Neto:  cuSaldoAnt y  cuImporteNeto

    sSql := 'UPDATE art.sle_liquiempsin ' +
              ' SET le_montocompensado = :ImporteResta, ' +    // cambio "le_imporperi" por "le_montocompensado" por  Plan Registro de Pagos cancelados (arreglo del ImporPeri)
                 ' le_comentario = :obs ';

    if (cuAPagar = 0) then
      sSql := sSql + ', le_estado = ''E'' ' +
                     ', LE_APROBADO = ' + SqlValue(Sesion.UserID) +
                     ', LE_FAPROBADO = art.actualdate ';


    sSql := sSql + ' WHERE le_siniestro = :sini ' +
                     ' AND le_orden = :orden ' +
                     ' AND le_recaida = :reca ' +
                     ' AND le_numliqui = :liq ';

    EjecutarSqlSTEx(sSql, [cuImporteResta, sObs, fraTrabajadorSIN.edSiniestro.Siniestro,      // cambie el cuAPagar por  "sImporteResta" (importe que resta) / por  Plan Registro de Pagos cancelados (arreglo del ImporPeri)
                           fraTrabajadorSIN.edSiniestro.Orden, fraTrabajadorSIN.edSiniestro.Recaida, iNroLiq]);
    CommitTrans;
  except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar guardar los datos. (Modif.TotAPag)');
      Rollback;
    end;
  end;
end;

procedure TfrmLiqIncapacidades.dbgCompensacionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;Highlight: Boolean);
begin
  inherited;
  if (sdqCompensacion.FieldByName('cl_suma').AsString = 'N') then
     AFont.Color := clRed;
end;

procedure TfrmLiqIncapacidades.DoImprimirCompensacionYaRealizada(iSiniestro, iOrden, iRecaida: Integer; bConTransaccion: boolean = True);   // Plan Registro de Pagos cancelados
var iIdMaxCC: integer;
    cuSaldo: Currency;
    sSql: string;
    sdqLiquis: TSDQuery;
begin
  iIdMaxCC := 0;
  if ((PageControl.ActivePageIndex = ctsILP) or (PageControl.ActivePageIndex = ctsILT))
     and TrabajadorExisteEnCtaCte(fraTrabajadorSIN.CUIL, iIdMaxCC) then   // Si existe en la compensacion
  begin
    // Obtengo el Saldo en la Cta Cte
    cuSaldo := Get_SaldoDeCtaCte(iIdMaxCC);
    if (cuSaldo = 0) and (MsgBox('¿Desea imprimir las liquidaciones que compensaron la Cancelación?', MB_ICONQUESTION + MB_YESNO) = IDYES) then // si llego a 0, ya esta todo compensado.
    begin
      sSql := ' SELECT A.cl_liquidacion ' +
                ' FROM SIN.scl_compensacionliquidaciones A ' +
               ' WHERE A.cl_cuil = :cuil ' +
                 ' AND A.cl_fechabaja IS NULL ' +
                 ' AND A.cl_suma = ''N'' ' +
                 ' AND A.cl_id > (SELECT MAX(B.cl_id) ' +
                                  ' FROM SIN.scl_compensacionliquidaciones B ' +
                                 ' WHERE B.cl_cuil = A.cl_cuil ' +
                                   ' AND B.cl_fechabaja IS NULL ' +
                                   ' AND B.cl_suma = ''S'') ' +
              ' ORDER BY A.cl_liquidacion ';
      sdqLiquis := GetQueryEx(sSql, [fraTrabajadorSIN.CUIL]);
      Try
        repeat
           case PageControl.ActivePageIndex of
             ctsILP: begin
                       DoCrearObjILP(vSiniestro, vOrden, vRecaida, sdqLiquis.FieldByName('CL_LIQUIDACION').AsInteger, oILP); // para que se actualicen todas las propiedades antes de imprimir
                       oILP.Imprimir(0, 1, 0, True, bConTransaccion);   // lo imprimo derecho con cant. de copias 1, porque sino estaria preguntando una por una las liquidaciones cuantas copias quiere...
                     end;
             ctsILT: begin
                       DoCrearObjILT(vSiniestro, vOrden, vRecaida, sdqLiquis.FieldByName('CL_LIQUIDACION').AsInteger, oILT); // para que se actualicen todas las propiedades antes de imprimir
                       oILT.Imprimir(0, 1, 0, True, bConTransaccion);   // lo imprimo derecho con cant. de copias 1, porque sino estaria preguntando una por una las liquidaciones cuantas copias quiere...
                     end;
           end;
           sdqLiquis.Next;

        until sdqLiquis.Eof;
      finally
        sdqLiquis.Free;
      end;
    end;
  end;
end;

procedure TfrmLiqIncapacidades.DoSetearEsCompensacion;    // Plan Registro de Pagos cancelados
begin
  oILT.EsCompensacion := ExisteSqlEx('SELECT 1 FROM SIN.SCL_COMPENSACIONLIQUIDACIONES ' +
                                     ' WHERE cl_idexpediente = :exp ' +
                                       ' AND cl_cuil = :cuil ' +
                                       ' AND cl_fechabaja IS NULL ' +
                                       ' AND cl_liquidacion = :liq ' +
                                       ' AND cl_suma = ''N'' ',[vIdExpediente, fraTrabajadorSIN.CUIL, oILT.NroLiquidacion]);
end;

procedure TfrmLiqIncapacidades.Do_GenerarLiquidacion_Recaida(iRecaidaSelecc: integer; var iResValida: integer);
begin
  case PageControl.ActivePageIndex of   // si es ILP no hace nada...
    ctsILT: begin
              Try
                if NuevoILT(vSiniestro, vOrden, iRecaidaSelecc, oILT2) then
                begin
                  oILT2.IdExpedienteOrigen := oILT.Expediente.Id;
                  DoLoadPropertys_ILT2(vSiniestro, vOrden, iRecaidaSelecc, oILT.NroLiquidacion);          // el anterior
                  DoGrabarILT(False, oILT2, vSiniestro, vOrden, iRecaidaSelecc, l_Clonacion, iResValida, False);
                end;
              finally
                DoLiberarLiquidacion(oILT2);
              end;
            end;
  end;
end;

procedure TfrmLiqIncapacidades.Do_GenerarLiquidacion_Siniestro(iSelSiniestro, iSelOrden, iSelRecaida: integer; var iResValida: integer);
begin
  case PageControl.ActivePageIndex of
    ctsILT: begin
              Try
                if NuevoILT(iSelSiniestro, iSelOrden, iSelRecaida, oILT2) then
                begin
                  DoLoadPropertys_ILT2(vSiniestro, vOrden, iSelRecaida, oILT.NroLiquidacion);              // el anterior
                  DoGrabarILT(False, oILT2, iSelSiniestro, iSelOrden, iSelRecaida, l_Clonacion, iResValida, False);
                end;
              finally
                DoLiberarLiquidacion(oILT2);
              end;
            end;
  end;
end;

procedure TfrmLiqIncapacidades.DoLoadPropertys_ILT2(iSiniestro, iOrden, iRecaida, iNroLiq: integer);
begin
  with oILT2 do
  begin
    PeriodoTipo          := ptPeriodo_Existe;
    Tipo                 := oILT.Tipo;
    Desde                := oILT.Desde;
    Hasta                := oILT.Hasta;
    Dias                 := oILT.Dias;
    Observaciones        := oILT.Observaciones;
    ANombreDe            := oILT.ANombreDe;
    Delegacion           := oILT.Delegacion;
    LiqCalculada         := oILT.LiqCalculada;
    ImporteLiquidado     := oILT.ImporteLiquidado;
    ImporteLiquidNoRem   := oILT.ImporteLiquidNoRem;
    Contribuciones       := oILT.Contribuciones;
    Contribuciones_NoRem := oILT.Contribuciones_NoRem;  // TK 51343 que pasa a plan
    Aportes              := oILT.Aportes;
    TotalAPagar          := oILT.TotalAPagar;
//  REVISAR      FechaVencimiento     := FieldByName('LE_FVENCIMI').AsDateTime;
    Concepto             := oILT.Concepto;
    MetodoPago           := oILT.MetodoPago;
    DescMetodoPago       := oILT.DescMetodoPago;
    EnvioFondos          := oILT.EnvioFondos;
    TipoFondos           := oILT.TipoFondos;
    CodigoFondos         := oILT.CodigoFondos;
    Recibos              := oILT.Recibos;
    IdBanco              := oILT.IdBanco;
    IdMotivoDiferencia   := oILT.IdMotivoDiferencia;  // TK 39345

    BaseDiaria           := oILT.BaseDiaria;
    SalarioFamiliar      := oILT.SalarioFamiliar;
    BaseDiariaNoRem      := oILT.BaseDiariaNoRem;

    ImporteEmpresa       := oILT.ImporteEmpresa;
    ImporteEmpNoRem      := oILT.ImporteEmpNoRem;
  end;
end;

procedure TfrmLiqIncapacidades.DoEvaluar_Baja(sMotivoCancelacion: string; var bExcepcion: boolean; var bTieneRegistros: boolean);
begin
    if EsMotivo_CierraRecaida(sMotivoCancelacion) then // por Plan Registro de pagos cancelados
    begin
      Do_HabilitarSinReca(cRECA);
      Do_ReemplazoPorCierreRecaida(bExcepcion, bTieneRegistros);
    end
    else if EsMotivo_CierraSiniestro(sMotivoCancelacion) then
    begin
      Do_HabilitarSinReca(cSINI);
      Do_ReemplazoDeSiniestro(bExcepcion, bTieneRegistros);
    end;
end;

procedure TfrmLiqIncapacidades.Do_ReemplazoPorCierreRecaida(var bExcepcion: boolean; var bTieneRecaidas: boolean);
var sSql: String;
    iResValida: Integer;
begin
  bTieneRecaidas := True;
  bExcepcion     := True;
  sSql := 'SELECT A.ex_recaida Recaida ' +
           ' FROM art.sex_expedientes A ' +
          ' WHERE A.ex_siniestro = ' + SqlInt(vSiniestro) +
            ' AND A.ex_orden = '     + SqlInt(vOrden) +
            ' AND A.ex_recaida <> '  + SqlInt(vRecaida) +
            ' AND NVL(ex_causafin, '' '') NOT IN (''02'', ''99'', ''95'') ';

  sdqRecaidas.SQL.Text := sSql;
  sdqRecaidas.Open;
  if (sdqRecaidas.RecordCount > 0) then
  begin
    if (fpSelSiniestroRecaida.showmodal = mrOk) then
    begin
      Do_GenerarLiquidacion_Recaida(sdqRecaidas.FieldByName('RECAIDA').AsInteger, iResValida);  // Plan
      if (iResValida = -1) then
        bExcepcion := False;
    end;
  end
  else
    bTieneRecaidas := False;
end;

procedure TfrmLiqIncapacidades.Do_ReemplazoDeSiniestro(var bExcepcion: boolean; var bTieneSiniestros: boolean);
var iIdTrab, iResValida: integer;
    sSql: string;
begin
  bTieneSiniestros := True;
  bExcepcion       := True;
  iIdTrab := ValorSqlEx('SELECT ex_idtrabajador ' +
                         ' FROM art.sex_expedientes ' +
                        ' WHERE ex_siniestro = :sini ' +
                          ' AND ex_orden = :orden ' +
                          ' AND ex_recaida = :reca ', [vSiniestro, vOrden, vRecaida]);

  sSql := 'SELECT ex_siniestro, ex_orden, ex_recaida, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) Sini, ex_id ' +
           ' FROM art.sex_expedientes, ctj_trabajador ' +
          ' WHERE ex_idtrabajador = tj_id ' +
            ' AND NVL(ex_causafin, '' '') NOT IN (''02'',''95'',''99'') ' +
            ' AND tj_id = ' + SqlInt(iIdTrab) +
            ' AND ex_siniestro <> ' + SqlInt(vSiniestro);

  sdqSiniestros.SQL.Text := sSql;
  sdqSiniestros.Open;
  if (sdqSiniestros.RecordCount > 0) then
  begin
    if (fpSelSiniestroRecaida.showmodal = mrOk) then
    begin
      Do_GenerarLiquidacion_Siniestro(sdqSiniestros.FieldByName('EX_SINIESTRO').AsInteger,          // Plan
                                      sdqSiniestros.FieldByName('EX_ORDEN').AsInteger,
                                      sdqSiniestros.FieldByName('EX_RECAIDA').AsInteger,
                                      iResValida);
      if (iResValida = -1) then
        bExcepcion := False;
    end;
  end
  else
    bTieneSiniestros := False;
end;

procedure TfrmLiqIncapacidades.Do_HabilitarSinReca(iSiniReca: string);
begin
  if (iSiniReca = cRECA) then
  begin
    lblRecaida.Visible   := True;
    cmbRecaida.Visible   := True;
    lblSiniestro.Visible := False;
    cmbSiniestro.Visible := False;
    fpSelSiniestroRecaida.Caption := 'Seleccione la Recaída';
  end
  else if (iSiniReca = cSINI) then
  begin
    lblRecaida.Visible   := False;
    cmbRecaida.Visible   := False;
    lblSiniestro.Visible := True;
    cmbSiniestro.Visible := True;
    fpSelSiniestroRecaida.Caption := 'Seleccione el Siniestro';
  end;
end;

procedure TfrmLiqIncapacidades.btnAceptarRecSinClick(Sender: TObject);
begin
  inherited;
  Verificar((cmbRecaida.Visible) and (cmbRecaida.FieldValue = ''), cmbRecaida, 'Debe seleccionar una Recaída');
  Verificar((cmbSiniestro.Visible) and (cmbSiniestro.FieldValue = ''), cmbSiniestro, 'Debe seleccionar un Siniestro');
  fpSelSiniestroRecaida.ModalResult := mrOk;
end;

procedure TfrmLiqIncapacidades.fpSelSiniestroRecaidaBeforeShow(Sender: TObject);
begin
  inherited;
  cmbRecaida.Clear;
  cmbSiniestro.Clear;
end;

function TfrmLiqIncapacidades.EsMotivo_CierraRecaida(sMotivo: string): boolean;      // Plan
begin
  Result := (ValorSqlEx('SELECT ml_cierrarecaida FROM sin.sml_motivocancliquidaciones ' +
                        ' WHERE ml_codigo = :codigo ', [sMotivo]) = 'S');
end;

function TfrmLiqIncapacidades.EsMotivo_CierraSiniestro(sMotivo: string): boolean;    // Plan
begin
  Result := (ValorSqlEx('SELECT ml_cierrasiniestro FROM sin.sml_motivocancliquidaciones ' +
                        ' WHERE ml_codigo = :codigo ', [sMotivo]) = 'S');
end;

procedure TfrmLiqIncapacidades.fraMotivoDiferenciaExit(Sender: TObject);
begin
  if (Accion <> l_None) then
  begin
    inherited;
    fraMotivoDiferencia.FrameExit(Sender);
    oILT.IdMotivoDiferencia := fraMotivoDiferencia.Value;
    DoRefrescarILT;
  end;
end;

procedure TfrmLiqIncapacidades.SetMotivoDiferencia;     // TK 39345
begin
  LockControl(fraMotivoDiferencia, False);
  if (fraTipoILT.Codigo <> 'L') then
  begin
    oILT.IdMotivoDiferencia   := 0;
    LockControl(fraMotivoDiferencia, True);
  end;

end;

function TfrmLiqIncapacidades.Get_ImporteNetoCompResta(iIdMaxCtaCte: integer): Currency;  // Plan Registro de Pagos cancelados (arreglo del ImporPeri)
var sSql: string;
begin
  sSql := 'SELECT cl_neto FROM sin.scl_compensacionliquidaciones ' +
          ' WHERE cl_id = :idCC ';
  Result := ValorSqlExtendedEx(sSql, [iIdMaxCtaCte]);
end;

procedure TfrmLiqIncapacidades.mnGenCompDaniosILPClick(Sender: TObject);   // Por plan Generar compensación por daños
begin

  if HayRegistroActivo and (sdqILP.FieldByName('le_numliqui_compdanios').AsString = '') and
     (sdqILP.FieldByName('le_subtotal').AsCurrency > 0) then
  begin
    if oILP.DoValidarGeneraCompDanos('N') and
        MsgAsk('¿Esta seguro que desea generar la Compensación por Daños de la Liquidación N°' + IntToStr(oILP.NroLiquidacion) + '?') then     // Grado Parcial
      GenerarLiqManual(CONCEPTO_COMPENSACIONDANIOS)
    else if oILP.Error <> '' then
      MsgBox(oILP.Error);
  end;
end;


procedure TfrmLiqIncapacidades.GenerarLiqManual(sConcepto: string; cMonto: currency = 0; dDesde: TDateTime = 0; dHasta: TDateTime = 0;
                                                rTasaOriginal: real = 0; rTasaFinal: real = 0; sTipoInt: String = ''; sTipoTasaJus: String = '');
var sSql, sCampo: string; oILPLiqManual: TILP;
begin

  if sConcepto = CONCEPTO_INTERESES_DIN then
    sCampo := 'le_numintereses'
  else
    if sConcepto = CONCEPTO_TASA_JUSTICIA_CAMFED then
      sCampo := 'le_numtasajusticia'
    else
      if sConcepto = CONCEPTO_COMPENSACIONDANIOS then
        sCampo := 'le_numliqui_compdanios';

  if (sdqILP.FieldByName('le_estado').AsString <> 'A') and (sdqILP.FieldByName('le_estado').AsString <> 'X') then
  begin
    DoCrearObjILP(sdqILP.FieldByName('le_siniestro').AsInteger, sdqILP.FieldByName('le_orden').AsInteger,
                  sdqILP.FieldByName('le_recaida').AsInteger, sdqILP.FieldByName('NRO').AsInteger, oILPLiqManual);

    oILPLiqManual.LiqManual := True;
    oILPLiqManual.ImporteLiquidado := 0;
    oILPLiqManual.LiqCalculada := 0;
    //oILPLiqManual.TotalAPagar := 0;
    if sConcepto = CONCEPTO_COMPENSACIONDANIOS then
      oILPLiqManual.CalcularCompDanos(false)
    else
    begin
      oILPLiqManual.ConceptoOtrosPagos := sConcepto;
      oILPLiqManual.MontoOtrosPagos := cMonto;
      oILPLiqManual.PeriodoTipo := ptPeriodo_Nuevo;
      oILPLiqManual.Desde := dDesde;
      oILPLiqManual.Hasta := dHasta;
      oILPLiqManual.TasaOriginal := rTasaOriginal;
      oILPLiqManual.TasaFinal := rTasaFinal;
      oILPLiqManual.TipoInteres := sTipoInt;
      oILPLiqManual.TipoTasaJus := sTipoTasaJus;
      oILPLiqManual.TotalAPagar := cMonto;
      oILPLiqManual.MontoCompDanos := 0;
      oILPLiqManual.MontoPagoAdic := 0;
    end;

    BeginTrans;
    Try

      if oILPLiqManual.Grabar(l_alta, false, tTipoCheck) then
      begin

        sSql   := 'UPDATE sle_liquiempsin ' +
                    ' SET ' + sCampo + ' = :Num ' +
                ' WHERE le_id = :idliq ';

        EjecutarSqlSTEx(sSql, [oILPLiqManual.NroLiquidacion, sdqILP.FieldByName('le_id').AsInteger]);

        CommitTrans;

        if (MsgBox('Alta efectuada correctamente' + #13 +'¿Quiere imprimir la liquidación ahora?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
        begin
          DoCrearObjILP(oILPLiqManual.Expediente.Siniestro, oILPLiqManual.Expediente.Orden, oILPLiqManual.Expediente.Recaida,
                        oILPLiqManual.NroLiquidacion, oILPLiqManual); // para que se actualicen todas las propiedades antes de imprimir
          if (fpImprimirLiq.ShowModal = mrOk) then
            oILPLiqManual.Imprimir(edCantRec.Value, edCantRes.Value, edCantDig.Value, True, false);
        end;
      end
      else
      begin
        Rollback;
        if oILPLiqManual.Error <> '' then
          MsgBox(oILPLiqManual.Error, MB_ICONEXCLAMATION + MB_OK);

      end;

      sdqILP.Refresh;

    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Ha surgido un error al insertar la liquidación de Compensación por daños');
      end;
    end;
  end
  else
    invalidhint(GridILP, 'La liquidación no debe estar Anulada ni Aprobada(Cancelada)');

end;



{procedure TfrmLiqIncapacidades.Generar_Liquidacion_CompPorDanios_Total;   // Por plan Generar compensación por daños (sólo para ILP)
var sSql: string; iProxLiq: integer;
begin
  BeginTrans;
  Try
    sSql := 'SELECT sum(le_imporperi) ' +
             ' FROM art.sle_liquiempsin ' +
            ' WHERE le_siniestro = :siniestro ' +
              ' AND le_orden = :orden ' +
              ' AND le_recaida = :recaida ' +
              ' AND le_tipoliqui = ''I'' ' +
              ' AND NVL(le_estado,'' '') NOT IN (''A'',''X'') ' +
              ' AND le_conpago in (13, 78) ';

    cuSumaTotAPagar := ValorSqlEx(sSql, [vSiniestro, vOrden, vRecaida]);

    sSql := 'SELECT art.dinerarias.get_montocompensacion(''' + oILP.Grado + oILP.Caracter + ''' , to_date(''' + sdqBusqueda.FieldByName('EX_FECHAACCIDENTE').AsString + ''', ''dd/mm/yyyy'')) FROM dual';

    cuMontoMinimo := ValorSql(sSql);
    cuSumaTotAPagar :=  RoundNumber( ((cuSumaTotAPagar * 20) /100), 2);   // Veinte por ciento

    if (cuSumaTotAPagar < cuMontoMinimo) then
      cuSumaTotAPagar := cuMontoMinimo;

    iProxLiq := oILP.GetProxNroLiquidacion;

    sSql := 'INSERT INTO  sle_liquiempsin (le_diasperi, le_diasdere, le_impiltp, le_declaraemp, le_noremundeclaraemp,' +
              '       le_diferencia, le_diferencianorem, le_plusampo, le_cantidadampo, le_formula, le_porcincapacidad,' +
              '       le_espagounico, le_esanticipomopres, le_ideventoinca, le_pejubila, le_peinssjp, le_pefnempleo,' +
              '       le_pesfamiliar, le_peanssal, le_peosocial, le_ptjubila, le_ptinssjp, le_ptanssal, le_ptosocial, le_siniestro,' +
              '       le_orden, le_recaida, le_numliqui, le_fproceso, le_fsolicita, le_tipoliqui, le_estado, le_fechades,' +
              '       le_fechahas, le_diasaplica, le_ibasediaria, le_subtotal, le_subtotalnorem, le_paporemp, le_paporemp_norem,' +
              '       le_iconemp, le_iconemp_norem, le_paportra, le_icontra, le_asigfamiliar, le_imporperi, le_montocompensado,' +
              '       le_comentario, le_chequenombre, le_usualta, le_conpago, le_delegacion, le_obrasocial,' +
              '       le_obrasocial_suss, le_afjp, le_afjp_suss, le_base_3mopres, le_metodopago, le_enviofondos,' +
              '       le_tipoenviofondos, le_idenviofondos, le_recibos, le_idembargo, le_idbanco, le_ibasediarianorem,' +
              '       le_idbasepost, le_rchkdomicilio, le_rchkotro, le_rcalle, le_rnumero, le_rpiso, le_rdepartamento, le_rcpostal,' +
              '       le_rlocalidad, le_rprovincia, le_rotro, le_montocompdanios)' +
             ' VALUES (0, 0, 0, 0, 0, 0, 0, 0, 0, :formulaoriginal, :porcentajeoriginal, ''N'', ''N'',  :ideventoincaoriginal, 0,' +
              '       0, 0, 0, 0, 0, 0, 0, 0, 0, :siniestro, :orden, :recaida, :numliqui, actualdate, actualdate, ''I'', ''C'', NULL,' +
              '       NULL, 0, :basediariaoriginal, 0, 0, 0, 0, 0, 0, 0, 0, 0, :montonuevo, 0, NULL, :chequenombreoriginal,' +
              '       :usuario, :conpagonuevo, :delegacionoriginal, NULL, NULL, NULL, NULL, ''N'', ' +
              '       :metodopagooriginal, :enviofondosoriginal, :tipoenviooriginal, :idenviooriginal, :recibosoriginal, NULL,' +
              '       :idbancooriginal, :basenoremoriginal, :idbasepostoriginal, :domicoriginal, :otrooriginal, :calleoriginal,' +
              '       :numerooriginal, :pisooriginal, :deptooriginal, :cpostaloriginal, :localidadoriginal, :provinciaoriginal,' +
              '       :otrooriginal, :le_montocompdanios)';
      EjecutarSqlSTEx(ssql, [sdqILP.FieldByName('le_formula').AsString, sdqILP.FieldByName('le_porcincapacidad').AsString, sdqILP.FieldByName('le_ideventoinca').AsString,
                             sdqILP.FieldByName('le_siniestro').AsString, sdqILP.FieldByName('le_orden').AsString, sdqILP.FieldByName('le_recaida').AsString,
                             iProxLiq, sdqILP.FieldByName('le_ibasediaria').AsString, oILP.MontoCompDanos,
                             sdqILP.FieldByName('le_chequenombre').AsString, Sesion.UserID, CONCEPTO_COMPENSACIONDANIOS, sdqILP.FieldByName('le_delegacion').AsString,
                             sdqILP.FieldByName('le_metodopago').AsString, sdqILP.FieldByName('le_enviofondos').AsString, sdqILP.FieldByName('le_tipoenviofondos').AsString,
                             sdqILP.FieldByName('le_idenviofondos').AsString, sdqILP.FieldByName('le_recibos').AsString, sdqILP.FieldByName('le_idbanco').AsString,
                             sdqILP.FieldByName('le_ibasediarianorem').AsString, sdqILP.FieldByName('le_idbasepost').AsString, sdqILP.FieldByName('le_rchkdomicilio').AsString,
                             sdqILP.FieldByName('le_rchkotro').AsString, sdqILP.FieldByName('le_rcalle').AsString, sdqILP.FieldByName('le_rnumero').AsString,
                             sdqILP.FieldByName('le_rpiso').AsString, sdqILP.FieldByName('le_rdepartamento').AsString, sdqILP.FieldByName('le_rcpostal').AsString,
                             sdqILP.FieldByName('le_rlocalidad').AsString, sdqILP.FieldByName('le_rprovincia').AsString, sdqILP.FieldByName('le_rotro').AsString,
                             oILP.MontoCompDanos]);

      ssql := ' UPDATE sle_liquiempsin ' +
              '    SET le_numliqui_compdanios = :numliqui' +
              '  WHERE = le_id = :idliq ';

      EjecutarSqlSTEx(ssql, [iProxLiq, sdqILP.FieldByName('le_id').AsInteger]);

    CommitTrans;
    sdqILP.Refresh;
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Ha surgido un error al insertar la liquidación de Compensación por daños');
    end;
  end;

end;}

function TfrmLiqIncapacidades.Es_PagoJudicial:boolean;       // Por Plan de Pagos Judiciales
begin
  Result := (ValorSqlEx('SELECT art.dinerarias.is_pagojudicial(:pidexped) FROM dual', [vIdExpediente]) = 'S');
end;

function TfrmLiqIncapacidades.Get_IsBloqueoDinerarias: string;   // Por Plan de Pagos Judiciales
begin
  Result := ValorSqlEx('SELECT art.dinerarias.is_bloqueadodinerarias(:pidexped) FROM dual', [vIdExpediente]);
end;

procedure TfrmLiqIncapacidades.Do_CargarCamposDeLegales;     // Por Plan de Pagos Judiciales
var sSql: string;
    sdqQuery: TSDQuery;
begin
  sSql := 'SELECT pj_metodopago, pj_idbanco, pj_enviofondos, pj_tipoenviofondos, pj_idenviofondos, ' +
                ' pj_chequenombre, pj_recibos, pj_observaciones, ' +
                ' pj_tiporecibos, pj_rotro, pj_rcpostal, pj_rcalle, pj_rlocalidad, pj_rprovincia, pj_rnumero, pj_rpiso, ' +
                ' pj_rdepartamento, pj_delegacion ' +
           ' FROM SIN.spj_pagosjudiciales ' +
          ' WHERE pj_idexpediente = :idexped ' +
            ' AND pj_fechabaja IS NULL ';

  sdqQuery := GetQueryEx(sSql, [vIdExpediente]);
  with sdqQuery do
  try
    DoCargarPropertys_LegalesILP(sdqQuery);
    DoCargarCampos_LegalesILP(sdqQuery);
    DoDeshabilitarCampos_LegalesILP;
  finally
    Free;
  end;

end;

procedure TfrmLiqIncapacidades.DoCargarPropertys_LegalesILP(sdqQuery: TSDQuery);
begin
  with sdqQuery do
  begin
    if not Eof then
    begin
      oILP.MetodoPago  := FieldByName('pj_metodopago').AsString;
      oILP.IdBanco     := FieldByName('pj_idbanco').AsInteger;
      oILP.EnvioFondos := FieldByName('pj_enviofondos').AsString;
      oILP.TipoFondos  := FieldByName('pj_tipoenviofondos').AsString;

      if (oILP.TipoFondos <> '') then
      begin
        if (oILP.TipoFondos = 'C') then
          rbCentralFondos.Checked := True
        else if (oILP.TipoFondos = 'D') then
          rbDelegacionFondos.Checked := True
        else
          rbBancoFondos.Checked := True;
      end;

      oILP.CodigoFondos  := FieldByName('pj_idenviofondos').AsInteger;
      oILP.ANombreDe     := FieldByName('pj_chequenombre').AsString;
      oILP.Recibos       := FieldByName('pj_recibos').AsString;
      oILP.Observaciones := FieldByName('pj_observaciones').AsString;
      oILP.Delegacion    := FieldByName('pj_delegacion').AsString;

      if (not FieldByName('pj_tiporecibos').IsNull) then
      begin
        if (FieldByName('pj_tiporecibos').AsString = 'D') then
        begin
          oILP.ChkDomicilioRec        := True;
          rbDomicilio_Recibos.Checked := true;

          oILP.CalleRec        := FieldByName('pj_rcalle').AsString;
          oILP.NumeroRec       := FieldByName('pj_rnumero').AsString;
          oILP.PisoRec         := FieldByName('pj_rpiso').AsString;
          oILP.DepartamentoRec := FieldByName('pj_rdepartamento').AsString;
          oILP.CodigoPostalRec := FieldByName('pj_rcpostal').AsString;
          oILP.LocalidadRec    := FieldByName('pj_rlocalidad').AsString;
          oILP.ProvinciaRec    := FieldByName('pj_rprovincia').AsString;
        end
        else if (FieldByName('pj_tiporecibos').AsString = 'O') then
        begin
          oILP.ChkOtroRec        := True;
          rbOtro_Recibos.Checked := True;
          oILP.OtroRec           := FieldByName('pj_rotro').AsString;
        end;
      end;
    end;
  end;
end;

procedure TfrmLiqIncapacidades.DoCargarCampos_LegalesILP(sdqQuery: TSDQuery);
begin
  with sdqQuery do
  begin
    fraMetodoPagoILP.Codigo := FieldByName('pj_metodopago').AsString;
    fraBancoILP.Value       := FieldByName('pj_idbanco').AsInteger;
    edEnvioILP.Text         := FieldByName('pj_enviofondos').AsString;

    if (not FieldByName('pj_tipoenviofondos').IsNull) then
    begin
      if (FieldByName('pj_tipoenviofondos').AsString = 'C') then
        rbCentralFondos.Checked := True
      else if (FieldByName('pj_tipoenviofondos').AsString = 'D') then
        rbDelegacionFondos.Checked := True
      else begin
        rbBancoFondos.Checked   := True;
      end;
    end;

    fraSucursalFondos.Value := FieldByName('pj_idenviofondos').AsInteger;

    edChequeNombreILP.Text  := FieldByName('pj_chequenombre').AsString;
    edRecibosILP.Text       := FieldByName('pj_recibos').AsString;
    edObservILP.Text        := FieldByName('pj_observaciones').AsString;
    fraDelegacionILP.Codigo := FieldByName('pj_delegacion').AsString;

    if (not FieldByName('pj_tiporecibos').IsNull) then
    begin
      if (FieldByName('pj_tiporecibos').AsString = 'D') then
      begin
        rbDomicilio_Recibos.Checked      := true;
        fraDomicilioRecibos.Calle        := FieldByName('pj_rcalle').AsString;
        fraDomicilioRecibos.Numero       := FieldByName('pj_rnumero').AsString;
        fraDomicilioRecibos.Piso         := FieldByName('pj_rpiso').AsString;
        fraDomicilioRecibos.Departamento := FieldByName('pj_rdepartamento').AsString;
        fraDomicilioRecibos.CodigoPostal := FieldByName('pj_rcpostal').AsString;
        fraDomicilioRecibos.Localidad    := FieldByName('pj_rlocalidad').AsString;
        fraDomicilioRecibos.Prov         := StrToInt(FieldByName('pj_rprovincia').AsString);
      end
      else if (FieldByName('pj_tiporecibos').AsString = 'O') then
      begin
        rbOtro_Recibos.Checked     := True;
        MemoOtroRecibos.Lines.Text := FieldByName('pj_rotro').AsString;
      end;
    end;
  end;
end;

procedure TfrmLiqIncapacidades.DoDeshabilitarCampos_LegalesILP;
begin
  LockControls([fraDelegacionILP, fraMetodoPagoILP, fraBancoILP, btnEnvioILP, edChequeNombreILP, btnRecibosILP, edObservILP], True);
end;

function TfrmLiqIncapacidades.Get_IdCasoJudicial: integer;   // por plan Pagos Judiciales
begin
  Result := ValorSqlIntegerEx('SELECT art.dinerarias.get_idcasojudicial(:pidexped) FROM dual', [vIdExpediente]);
end;

procedure TfrmLiqIncapacidades.Do_UpdateEstadoPagoJudicial(iIdCasoJudicial: integer);   // Por Plan de Pagos Judiciales
var sSql:string;
begin
  sSql := 'UPDATE SIN.spj_pagosjudiciales ' +
                ' SET pj_estado = ''L'' ' +
              ' WHERE pj_id = ' + SqlInt(iIdCasoJudicial);
  EjecutarSqlST(sSql);
end;

procedure TfrmLiqIncapacidades.Do_UpdateIDPagoJudicial_SLE(iNroLiquidacion, iSiniestro, iOrden, iRecaida, iIdCasoJud: Integer);   // Por Plan de Pagos Judiciales
var sSql:string;
begin
  sSql := 'UPDATE ART.sle_liquiempsin ' +
            ' SET le_idpagojudicial = ' + SqlInt(iIdCasoJud) +
          ' WHERE le_siniestro = ' + SqlInt(iSiniestro) +
            ' AND le_orden = ' + SqlInt(iOrden) +
            ' AND le_recaida = ' + SqlInt(iRecaida) +
            ' AND le_numliqui = ' + SqlInt(iNroLiquidacion);
  EjecutarSqlST(sSql);
end;

function TfrmLiqIncapacidades.ValidarBajaOP_Usuarios(sUsuAltaOP:string):boolean;  // TK 52630
var sSectorUsuAlta, sSectorUsu: string;
begin
  Result := True;
  sSectorUsuAlta := ValorSqlEx('SELECT se_sector FROM art.use_usuarios WHERE se_usuario = :usu ', [sUsuAltaOP]);    // Sector del usuario de Alta
  sSectorUsu     := ValorSqlEx('SELECT se_sector FROM art.use_usuarios WHERE se_usuario = :usu ', [Sesion.UserID]); // Sector del usuario actual conectado que quiere dar de baja el reg.

  if ((sSectorUsuAlta = cSECTOR_LIQUIDACIONES) and (sSectorUsu = cSECTOR_PRESTDINERARIAS)) OR
     ((sSectorUsuAlta = cSECTOR_PRESTDINERARIAS) and (sSectorUsu = cSECTOR_LIQUIDACIONES)) then
  begin
    Result := False;
    InfoHint(tbEliminar, 'No se puede eliminar esta liquidación debido a que pertenece a otro Sector');
  end;
end;


procedure TfrmLiqIncapacidades.mnEditarImporteClick(Sender: TObject);
begin
   edNuevoImporte.Value := sdqILP.FieldByName('le_subtotal').AsCurrency;
   EdNewPA.Value := sdqILP.FieldByName('le_montopagoadic').AsCurrency;
   EdNewCD.Value := sdqILP.FieldByName('le_montocompdanios').AsCurrency;
   edNewTotal.Value := sdqILP.FieldByName('A_PAGAR').AsCurrency;
   edMotivoModif.Clear;
   fpModifImporte.showmodal;
end;

procedure TfrmLiqIncapacidades.btnAceptarModClick(Sender: TObject);      // TK 53197
var sSql: string;
begin
  {Verificar((edNuevoImporte.Value = 0), edNuevoImporte, 'El nuevo importe no puede ser 0');
  Verificar((edNuevoImporte.Value > sdqILP.FieldByName('a_pagar').AsCurrency), edNuevoImporte, 'El nuevo importe no puede ser mayor al actual (actual: ' + sdqILP.FieldByName('a_pagar').AsString + ').' );
  Verificar((Trim(edMotivoModif.Text) = ''), edMotivoModif, 'Debe ingresar un motivo.' );}

  if ValidarModifValores then
  BeginTrans;
  Try
    sSql := 'UPDATE ART.sle_liquiempsin ' +
              ' SET le_modifimporteviejo = :imporperi, ' +
                  ' le_motmodi_importe = :motivo, ' +
                  ' le_impiltp = DECODE(NVL(le_impiltp, 0), 0, 0, :impiltp), ' +
                  ' le_subtotal = :importe2, ' +
                  ' le_montopagoadic = :pa, ' +
                  ' le_montocompdanios = :cd, ' +
                  ' le_imporperi = :total, ' +
                  ' le_usumodif = :usumodif, ' +
                  ' le_fmodif = art.actualdate ' +
            ' WHERE le_id =  :idliq ';

    EjecutarSqlSTEx(sSql, [sdqILP.FieldByName('a_pagar').AsCurrency, Trim(edMotivoModif.Text), edNuevoImporte.Value, edNuevoImporte.Value, EdNewPA.Value,
                           EdNewCD.Value, edNuevoImporte.Value + EdNewPA.Value + EdNewCD.Value, Sesion.UserID, sdqILP.FieldByName('le_id').AsInteger]);

    CommitTrans;

    tbRefrescarClick(Self);
    DoRefrescarILP;
  Except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar guardar los datos.');
      Rollback;
    end;
  end;

  fpModifImporte.ModalResult := mrOk;
end;


function TfrmLiqIncapacidades.HabilitaEditarImporte: boolean;  // TK 53197
var sSql: string;
begin
  // Me fijo si el concepto de pago, el estado, el importe y el tipo liquicacion estan habilitados para realizar la modificacion del importe
  sSql := ' SELECT 1 ' +
            ' FROM art.scp_conpago, art.sle_liquiempsin ' +
           ' WHERE cp_tipo IN(''P'') ' +
             ' AND cp_espagomensual = ''N'' ' +
             ' AND le_conpago = cp_conpago ' +
             ' AND le_siniestro = ' + SqlInt(vSiniestro) +
             ' AND le_orden = ' + SqlInt(vOrden) +
             ' AND le_recaida = ' + SqlInt(vRecaida) +
             ' AND le_numliqui = ' + SqlInt(sdqILP.FieldByName('NRO').AsInteger) +
             ' AND le_estado NOT IN (''X'', ''A'', ''Z'', ''E'', ''P'', ''V'') ' +
             //' AND le_impiltp = le_imporperi ' +
             ' AND le_subtotal + le_montocompdanios + le_montopagoadic = le_imporperi ' +
             ' AND le_tipoliqui <> ''W'' ' +
             ' AND cp_conpago = ' + SqlInt(sdqILP.FieldByName('LE_CONPAGO').AsInteger);

  Result := ExisteSql(sSql);
end;

procedure TfrmLiqIncapacidades.fpModifImporteBeforeShow(Sender: TObject);  // TK 53197
begin
  edMotivoModif.Lines.Clear;
end;

{procedure TfrmLiqIncapacidades.DoEvaluarCartelSiniestroConAnioILT;   // TK 46933
var sSql, sSqlCasos, sMensaje, sSiniestros: string;
begin
  sMensaje    := 'Para  este  trabajador se  posee  uno  o  mas  Siniestros ' + #13#10 +
                 'anteriores con ILT para el año anterior a la contingencia. ' + #13#10 + #13#10 +
                 'Siniestro/s N°: ' + #13#10;
  sSiniestros := '';

  // Veo si existe al menos un caso con las condiciones dadas
  sSql := ' SELECT A.ex_cuil cuil, A.ex_fecharecaida FechaRecaida, A.ex_fechaaccidente FechaAccidente ' +
            ' FROM art.sex_expedientes A ' +
           ' WHERE A.ex_siniestro = :sini ' +
             ' AND A.ex_orden = :orden ' +
             ' AND A.ex_recaida = :recaida ' +
             ' AND exists (SELECT 1 FROM art.sex_expedientes B ' +
                          ' WHERE B.ex_cuil = A.ex_cuil ' +
                            ' AND ((B.ex_siniestro <> A.ex_siniestro) or (B.ex_recaida <> A.ex_recaida)) ' +  // no pongo que las fechas de accidente sean distintas sino no me toma el siniestro de la recaida anterior
                            ' AND nvl(B.ex_fecharecaida, B.ex_fechaaccidente) < nvl(A.ex_fecharecaida, A.ex_fechaaccidente) ' +
                            ' AND (nvl(B.ex_altamedica, art.actualdate) - B.ex_fechaaccidente) > 1 ' +
                            ' AND art.siniestro.getbajamedica(B.ex_id) > (art.actualdate - 365) ) ';

  // si existe al menos un caso, saco los siniestros que lo cumplen para enviar el mensaje
  with GetQueryEx(sSql, [vSiniestro, vOrden, vRecaida]) do
  try
    if not Eof then
    begin
      sSqlCasos := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro ' +
                    ' FROM art.sex_expedientes ' +
                   ' WHERE ex_cuil = ' + SqlValue(FieldByName('CUIL').AsString) +
                     ' AND ((ex_siniestro <> ' + SqlInt(vSiniestro) + ') or (ex_recaida <> ' + SqlInt(vRecaida) + ')) ' +
                     ' AND nvl(ex_fecharecaida, ex_fechaaccidente) < nvl( ' + SqlDateTime(FieldByName('FECHARECAIDA').AsDateTime) + ', ' + SqlDateTime(FieldByName('FECHAACCIDENTE').AsDateTime) + ') ' +
                     ' AND (nvl(ex_altamedica,art.actualdate) - ex_fechaaccidente) > 1 ' +
                     ' AND art.siniestro.getbajamedica(ex_id) > (art.actualdate - 365) ';

      with GetQuery(sSqlCasos) do
      try
        while not Eof do
        begin
          sSiniestros := sSiniestros + #13#10 + FieldByName('SINIESTRO').AsString;
          Next;
        end;

        if (sSiniestros <> '') then
          MsgBox(sMensaje + sSiniestros);
      finally
        Free;
      end;

    end;
  finally
    Free;
  end;

end;    }


{procedure TfrmLiqIncapacidades.fpCartaDocumento2Show(Sender: TObject);
var ssql: string;
begin
  ssql := ' select pd_numero, pd_piso, pd_departamento, pd_calle, pd_cpostal, pd_cpostal, pd_provincia, pd_fvencimiento ' +
          '   from sin.spd_puestadisposicion ' +
          '  where pd_idexpediente = :idex ';

  with GetQueryEx(ssql, [fraTrabajadorSIN.IdExpediente]) do
  begin
    fraDirCDO.Cargar(fieldbyname('pd_calle').AsString, fieldbyname('pd_cpostal').AsString, fieldbyname('pd_cpostal').AsString,
                     fieldbyname('pd_numero').AsString, fieldbyname('pd_piso').AsString, fieldbyname('pd_departamento').AsString,
                     fieldbyname('pd_provincia').AsString, '');

    deFechaVenc.Date := fieldbyname('pd_fvencimiento').AsDateTime;
  end;

  if fraDirCDO.IsEmpty then
  begin
    ssql := ' select tj_calle, tj_numero, tj_localidad, tj_cpostal, tj_provincia, tj_piso, tj_departamento ' +
            '   from ctj_trabajador ' +
            '  where tj_id = :idtrab ';

    with GetQueryEx(ssql, [fraTrabajadorSIN.IdTrabajador]) do
    begin
      fraDirCDO.Cargar(fieldbyname('tj_calle').AsString, fieldbyname('tj_cpostal').AsString, fieldbyname('tj_localidad').AsString,
                       fieldbyname('tj_numero').AsString, fieldbyname('tj_piso').AsString, fieldbyname('tj_departamento').AsString,
                       fieldbyname('tj_provincia').AsString, '');

    end;

  end;

  if (deFechaVenc.Date = 0) and (PageControl.ActivePageIndex = ctsILP) then
  begin
    ssql := ' select ev_fecha + 14 from sev_eventosdetramite ' +
             ' where ev_idevento = :idev ';

    deFechaVenc.Date := ValorSqlEx(ssql, [Dictamenes[rgDictamenes.ItemIndex].Id]);
  end;

end;

procedure TfrmLiqIncapacidades.btnAceptarClick(Sender: TObject);
var ssql: string;
begin
  if ValidarDirCDO then
  begin
    ssql := ' INSERT INTO SIN.scp_casospuestadisp ' +
                 ' VALUES (NULL, :idexp, :numliq, NULL, :usu, TRUNC(SYSDATE), NULL, NULL) ';

    EjecutarSqlSTEx(ssql, [vIdExpediente, vNumLiq, sesion.UserID]);

    ssql := ' SELECT 1 FROM sin.spd_puestadisposicion ' +
             ' WHERE pd_idexpediente = :idex AND pd_fechabaja IS NULL ';

    if ExisteSqlEx(ssql, [vIdExpediente]) then
    begin
      ssql := 'UPDATE sin.spd_puestadisposicion ' +
               '  SET pd_fvencimiento = :fven, pd_calle = :calle, pd_numero = :num, pd_piso = :piso ' +
               '      pd_departamento = :dep, pd_cpostal = :cp, pd_localidad = :loc, pd_provincia = :pro, ' +
               '      pd_codpostala = :cpa, pd_fechamodif = TRUNC (SYSDATE), pd_usumodif = :usu' +
              ' WHERE pd_idexpediente = :idex and pd_fechabaja IS NULL';
      EjecutarSqlSTEx(ssql, [deFechaVenc.Date, fraDirCDO.Calle, fraDirCDO.Numero, fraDirCDO.Piso, fraDirCDO.Departamento,
                             fraDirCDO.CodigoPostal, fraDirCDO.Localidad, fraDirCDO.Prov, fraDirCDO.CPA, Sesion.UserID]);
    end
    else
    begin
      ssql := ' INSERT INTO sin.spd_puestadisposicion ' +
                   ' VALUES (NULL, :idex, :fven, :num, :piso, :dep, :calle, :cp, :loc, :pro, ' +
                          ' :cpa, :usu, TRUNC (SYSDATE), NULL, NULL, NULL, NULL) ';
      EjecutarSqlSTEx(ssql, [vIdExpediente, deFechaVenc.Date, fraDirCDO.Numero, fraDirCDO.Piso, fraDirCDO.Departamento,
                             fraDirCDO.Calle, fraDirCDO.CodigoPostal, fraDirCDO.Localidad, fraDirCDO.Prov, fraDirCDO.CPA,
                             sesion.UserID]);
    end;
    fpCartaDocumento.ModalResult := mrOK;
  end;

end;

function TfrmLiqIncapacidades.ValidarDirCDO: boolean;
begin
  verificar(fraDirCDO.IsEmpty, fraDirCDO, 'Debe completar la dirección');
  verificar(deFechaVenc.Date = 0, deFechaVenc, 'Debe completar la fecha de vencimiento');
  ValidarDirCDO := true;
end;

procedure TfrmLiqIncapacidades.btnCancelarClick(Sender: TObject);
begin
  if msgbox('Desea descartar los cambios?', MB_YESNO + MB_ICONQUESTION) = id_yes then
    fpCartaDocumento.ModalResult := mrCancel;

end; }

function TfrmLiqIncapacidades.ValidarCuentaOP_CBU_Autoriz: Boolean;             // TK 54975  -- Esto debe pasarse en la unidad que tiene Diego
var IdAcreedor: TTableId;
    sSql: String;
    bMetodoPagoCuenta: Boolean;
begin
  Result := True;
  bMetodoPagoCuenta := not AreIn(fraMetodoPagoOP.edCodigo.Text, ['CH', 'EF', 'GI']);

  if  bMetodoPagoCuenta then
  begin
    IdAcreedor := IIF(AreIn(sTipoAcr, ['BE','TA']), fraTrabajadorSIN.Value, IIF(sTipoAcr = 'EM', fraEmpresa.ID, ART_EMPTY_ID));
    if (IdAcreedor <> ART_EMPTY_ID) then
    begin
      sSql := 'SELECT trunc(cp_fechaaltamcarga) faprobado ' +
                'FROM ccp_cuentapago, zba_banco, zsb_sucursalbanco, ' +
                    ' ctb_tablas tp, ctb_tablas tc ' +
              ' WHERE cp_idbanco = ba_id ' +
                ' AND tc.tb_clave(+) = ''BCOCT'' ' +
                ' AND tc.tb_codigo(+) = cp_tipocuenta ' +
                ' AND tp.tb_codigo(+) = cp_propiedad ' +
                ' AND tp.tb_clave(+) = ''PROCT'' ' +
                ' AND cp_idsucursal = sb_id(+) ' +
                ' AND cp_idacreedor = ' + IntToStr(IdAcreedor) +
                ' AND cp_fechaalta IS NOT NULL ' +
                ' and cp_fechabaja is null ';
                                                           
      with GetQuery(sSql) do
      try
        if (RecordCount > 0) then
          Result := not FieldByName('faprobado').IsNull
        else
          Result := False;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmLiqIncapacidades.mnuViajarPopup(Sender: TObject);
begin
{$IFDEF SINIESTROS}
  mnuViajarSiniestros.Enabled    := frmPrincipal.Seguridad.Claves.IsActive('VerSiniestros');
  mnuViajarIncapacidades.Enabled := frmPrincipal.Seguridad.Claves.IsActive('VerIncapacidades');
{$ENDIF}
{$IFDEF DINERARIAS}
  mnuLiqMortales.Enabled         := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuLiqMortCalculos);
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.DoHabilitacionBtn;
begin
  tbJustifILT.Enabled := Seguridad.Activar(tbJustifILT) and (PageControl.ActivePageIndex = ctsILT);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqIncapacidades.tbJustifILTClick(Sender: TObject);    // Plan de Rocio
begin
  if not fraTrabajadorSIN.edSiniestro.IsEmpty then
  begin
    with TfrmJustificacionILT.Create(Self) do
    try
      IDExpediente := vIdExpediente;
      ModoModificacion := False;

      ShowModal;

    finally
      Free;
    end;
  end;
end;

procedure TfrmLiqIncapacidades.Do_CargarRecibosOP;
begin
  if IsEmptyString(fraDomicilioRecibos.Calle) then
    edRecibosOP.Lines.Text := ''
  else
    edRecibosOP.Lines.Text := fraDomicilioRecibos.Calle + ' ' +
                              IIF(fraDomicilioRecibos.Numero <> '', fraDomicilioRecibos.Numero, '') +
                              IIF(fraDomicilioRecibos.Piso <> '', ' Piso ' + fraDomicilioRecibos.Piso, '') +
                              IIF(fraDomicilioRecibos.Departamento <> '', ' Dpto.' + fraDomicilioRecibos.Departamento, '') +
                              IIF(fraDomicilioRecibos.Localidad <> '', ' Loc.' + fraDomicilioRecibos.Localidad, '');
end;

procedure TfrmLiqIncapacidades.Do_CargarFrameRecibosOP;
begin
  with tReciboOP do
    fraDomicilioRecibos.Cargar(Calle, CodigoPostal, Localidad, Numero,
                               Piso, Departamento, Trim(IntToStr(Prov)), CPA);
end;

procedure TfrmLiqIncapacidades.Do_GuardarRecibosOP;
begin
  // Guardo en las propertys
  with tReciboOP do
    begin
      Calle        := fraDomicilioRecibos.Calle;
      Numero       := fraDomicilioRecibos.Numero;
      Piso         := fraDomicilioRecibos.Piso;
      Departamento := fraDomicilioRecibos.Departamento;
      CodigoPostal := fraDomicilioRecibos.CodigoPostal;
      Localidad    := fraDomicilioRecibos.Localidad;
      Prov         := fraDomicilioRecibos.Prov;
    end;

  Do_CargarRecibosOP;
end;

procedure TfrmLiqIncapacidades.Do_LimpiarRecibosOP;
begin
  with tReciboOP do
    begin
      Calle        := '';
      Numero       := '';
      Piso         := '';
      Departamento := '';
      CodigoPostal := '';
      Localidad    := '';
      Prov         := 0;
    end;
end;


function TfrmLiqIncapacidades.ValidarModifValores: Boolean;
begin
  Verificar(edNuevoImporte.Value > sdqilp.FieldByName('le_subtotal').AsCurrency, edNuevoImporte, 'El monto no puede ser mayor al anterior');
  Verificar(EdNewPA.Value > sdqilp.FieldByName('le_montopagoadic').AsCurrency, EdNewPA, 'El monto no puede ser mayor al anterior');
  Verificar(EdNewCD.Value > sdqilp.FieldByName('le_montocompdanios').AsCurrency, EdNewCD, 'El monto no puede ser mayor al anterior');
  Verificar(Trim(edMotivoModif.Text) = '', edMotivoModif, 'Debe ingresar un motivo para el cambio del importe de la liquidación');
  ValidarModifValores := True;

end;

procedure TfrmLiqIncapacidades.CalcTotalEditarImporte;
begin
  edNewTotal.Value := edNuevoImporte.Value + EdNewPA.Value + EdNewCD.Value;
end;

function TfrmLiqIncapacidades.doSeleccionarCasoPuestaDisp(iIdTipoCaso, iIdLiquidacion: integer): boolean;
var sIdCasoARelacionar, ssql: String;
    bSeguir: Boolean; iIdEstado: integer;
begin
  bSeguir := True;
  iIdEstado := 0;

  case iIdTipoCaso of
    1: iIdEstado := 6;               //PD ILT
    3: iIdEstado := 16;              //ILP
  end;

  with sdqCasosActivosPD do
  begin
    Close;
    ParamByName('idtipocaso').AsInteger := iIdTipoCaso;
    ParamByName('idexped').AsInteger := vIdExpediente;
    Open;
  end;

  //if sdqCasosActivosPD.RecordCount > 0 then
  //begin

    if sdqCasosActivosPD.RecordCount > 1 then
    begin
      bSeguir := (fpCasosActivosPD.ShowModal = mrOk);
      sIdCasoARelacionar := cbCasosARelacionar.FieldValue;
    end
    else                 // sdqCasosActivosPD.RecordCount = 1
      sIdCasoARelacionar := sdqCasosActivosPD.FieldByName('idcaso').AsString;

    if bSeguir then
    begin
      ssql := 'UPDATE din.dcl_casosparaliquidar SET cl_idestado = :idestado, ' +
                      '       cl_idliquidacion = :idliq, ' +
                      '       cl_usumodif = :usuario, ' +
                      '       cl_fechamodif = SYSDATE';
      if iIdTipoCaso = 3 then
        ssql := ssql + ', cl_anticipo = ' + QuotedStr(IIF(oILP.GenerarAnticipo, 'S', 'N'));

      ssql := ssql + ' WHERE cl_id = :idcaso';

      EjecutarSqlSTEx(ssql, [iIdEstado, iIdLiquidacion, Sesion.UserID, sIdCasoARelacionar]);
    end;
  {end
  else
    if iIdTipoCaso = 1 then
    begin
      bSeguir := False;
      MsgBox('No se encontró ningun caso en el seguimiento. No se puede liquidar. ');
    end; }

  doSeleccionarCasoPuestaDisp := bSeguir;
end;


procedure TfrmLiqIncapacidades.mnuAfipClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.afip.gob.ar/home/index.html'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuAnsesClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.anses.gob.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuSSSClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.sssalud.gov.ar'), '', '', SW_SHOWNORMAL);
end;


procedure TfrmLiqIncapacidades.mnuARTsClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.arts.gob.ar'), '', '', SW_SHOWNORMAL);
end;


procedure TfrmLiqIncapacidades.mnuSRTClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.srt.gob.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuBNAClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.bna.com.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuCorreoClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.correo-argentino.com'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuBcoPatagClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.bancopatagonia.com/personas/personas.shtml'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuSSNClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www2.ssn.gob.ar'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuUARTClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.uart.org.ar/~uart'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmLiqIncapacidades.mnuInfolegClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.infoleg.gov.ar'), '', '', SW_SHOWNORMAL);
end;

{function TfrmLiqIncapacidades.IsModifNoAutorizada_ILP: boolean;
var sSql:string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM din.dml_modifliquidacion ' +
          ' WHERE ml_idexpediente = :idexp ' +
            ' AND ml_numliqui = :liqui ' +
            ' AND ml_fechaaprob is null ' +
            ' AND ml_tablaliqui = ''SLE'' ' +
            ' AND ml_fechabaja is null ';
  Result := ExisteSqlEx(sSql, [sdqILP.FieldByName('LE_IDEXPEDIENTE').AsInteger, sdqILP.FieldByName('NRO').AsInteger]);
end;

function TfrmLiqIncapacidades.IsModifNoAutorizada_ILT: boolean;
var sSql:string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM din.dml_modifliquidacion ' +
          ' WHERE ml_idexpediente = :idexp ' +
            ' AND ml_numliqui = :liqui ' +
            ' AND ml_fechaaprob is null ' +
            ' AND ml_tablaliqui = ''SLE'' ' +
            ' AND ml_fechabaja is null ';
  Result := ExisteSqlEx(sSql, [sdqILT.FieldByName('LE_IDEXPEDIENTE').AsInteger, sdqILT.FieldByName('NRO').AsInteger]);
end;

function TfrmLiqIncapacidades.IsModifNoAutorizada_OP: boolean;
var sSql:string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM din.dml_modifliquidacion ' +
          ' WHERE ml_idexpediente = :idexp ' +
            ' AND ml_numliqui = :liqui ' +
            ' AND ml_fechaaprob is null ' +
            ' AND ml_tablaliqui = ''SPR'' ' +
            ' AND ml_fechabaja is null ';
  Result := ExisteSqlEx(sSql, [sdqOPagos.FieldByName('PR_IDEXPEDIENTE').AsInteger, sdqOPagos.FieldByName('NRO').AsInteger]);
end;         }

procedure TfrmLiqIncapacidades.LeyendaModifAutorizada(iIdExpediente, iNumLiq: integer; sTabla, sSolapa: string);
var sSql: string;
begin
  lModifNoAutorizada_ILP.Caption := '';
  lModifNoAutorizada_ILT.Caption := '';
  lModifNoAutorizada_OP.Caption  := '';

  sSql := 'SELECT ml_fechaaprob ' +
           ' FROM din.dml_modifliquidacion ' +
          ' WHERE ml_idexpediente = :idexp ' +
            ' AND ml_numliqui = :liqui ' +
            ' AND ml_tablaliqui = ' + SqlValue(sTabla) +
            ' AND ml_fechabaja is null ';

  with GetQueryEx(sSql, [iIdExpediente, iNumLiq]) do
  try
    if not Eof then
    begin
      if (sSolapa = 'ILP') then
      begin
        if FieldByName('ML_FECHAAPROB').IsNull then
        begin
          lModifNoAutorizada_ILP.Caption    := 'Modificación no autorizada';
          lModifNoAutorizada_ILP.Font.Color := clRed;
        end
        else begin
          lModifNoAutorizada_ILP.Caption    := 'Modificación autorizada';
          lModifNoAutorizada_ILP.Font.Color := clBlue;
        end;
      end
      else if (sSolapa = 'ILT') then
      begin
        if FieldByName('ML_FECHAAPROB').IsNull then
        begin
          lModifNoAutorizada_ILT.Caption    := 'Modificación ' + #13#10 + 'no autorizada';
          lModifNoAutorizada_ILT.Font.Color := clRed;
        end
        else begin
          lModifNoAutorizada_ILT.Caption    := 'Modificación ' + #13#10 + 'autorizada';
          lModifNoAutorizada_ILT.Font.Color := clBlue;
        end;
      end
      else if (sSolapa = 'OP') then
      begin
        if FieldByName('ML_FECHAAPROB').IsNull then
        begin
          lModifNoAutorizada_OP.Caption    := 'Modificación no autorizada';
          lModifNoAutorizada_OP.Font.Color := clRed;
        end
        else begin
          lModifNoAutorizada_OP.Caption    := 'Modificación autorizada';
          lModifNoAutorizada_OP.Font.Color := clBlue;
        end;
      end;
    end;

  finally
    Free;
  end;
end;

{function TfrmLiqIncapacidades.ContabilizarFranquicia(iFranquicia, iFranquiciaTomada:integer): boolean;    // TK 65834 y 66067
begin
  // Si estoy en una recaida, si la recaida en la que estoy esta justificada por ILT y Si la franquicia esta totalmente consumida, entonces no se debe contabilizar la Franquicia
  if (vRecaida > 0) and
     ExisteJustificacionILT_RecaAnterior and
     ((iFranquicia - iFranquiciaTomada) <= 0)  then
    Result := False
  else
    Result := True;

end;  }

{function TfrmLiqIncapacidades.ExisteJustificacionILT_RecaAnterior: boolean;
var sSql: string;
    iRecaAnt: integer;
begin
   iRecaAnt := -1;
   sSql := 'SELECT max(ex_recaida) ' +
            ' FROM art.sex_expedientes ' +
           ' WHERE ex_siniestro = ' + sqlValue(vSiniestro) +
             ' AND ex_orden = ' + sqlValue(vOrden) +
             ' AND ex_recaida < ' + sqlValue(vRecaida) +
             ' AND NVL(ex_causafin, ''0'') NOT IN(''99'', ''95'') ';

   if ExisteSql(sSql) then
   begin
     iRecaAnt := ValorSql(sSql);

     sSql := 'SELECT 1 ' +
              ' FROM SIN.SJI_JUSTIFICACIONILT ' +
             ' WHERE ji_idexpediente = ' + SqlValue(Get_Idexpediente(vSiniestro, vOrden, iRecaAnt)) +
               ' AND ji_fechabaja is null ';

     Result := ExisteSql(sSql);
   end
   else
     Result := False;

end; }

function TfrmLiqIncapacidades.LiquidaRechazado(sCausafin: String): boolean;
begin
  LiquidaRechazado := Seguridad.Claves.IsActive('ReintegroSiniestrosRechazados') and
                      (sCausafin = '02') and
                      ExisteSqlEx('select 1 from art.aer_empresasreintsinrech where er_idempresa = :id and er_fechabaja is null', [fraEmpresa.ID]);

end;

end.

