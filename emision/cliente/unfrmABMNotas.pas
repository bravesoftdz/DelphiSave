unit unfrmABMNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvgGroupBox, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, Mask, PatternEdit, IntEdit, ToolEdit,
  DateComboBox, Grids, DBGrids, ComCtrls, JvExComCtrls, JvComCtrls, ToolWin,
  DB, SDEngine, unDmPrincipal, AnsiSql, unSesion, unfrmFormularioEmi, unConstEmision,
  CustomDlgs, DateTimeFuncs, RXDBCtrl, ArtComboBox, ArtDBGrid, FormPanel,
  unfrmObservacionesNota, ShortCutControl, Login, artDbLogin, artSeguridad,
  unFuncionesEmision, JvComponent, JvAppEvent, CurrEdit, Menus, unfrmObservacion;

type

  TModoABM = (maNone, maAlta, maModificacion, maBaja, maVer, maSimular);

  TfrmABMNotas = class(TForm)
    gbCargaNotas: TJvgGroupBox;
    rgpTipoSolicitante: TRadioGroup;
    fraEmpresa: TfraEmpresa;
    lblCUIT: TStaticText;
    lblBibliorato: TLabel;
    edBiblioratoNota: TIntEdit;
    lblSecuencia: TLabel;
    edSecuenciaNota: TIntEdit;
    fraSolicitanteNota: TfraCodigoDescripcionExt;
    lblSolicitanteSolicitud: TLabel;
    btnBorrador: TButton;
    lblFechaRecepcion: TLabel;
    edFechaRecepcionEmision: TDateComboBox;
    lblFechaRecepcionART: TLabel;
    edFechaRecepcionART: TDateComboBox;
    pcFormularios: TJvPageControl;
    tbForm931: TTabSheet;
    tbForm165_170: TTabSheet;
    dbgForm931: TRxDBGrid;
    dbgForm165_170: TRxDBGrid;
    tbForm900_926: TTabSheet;
    dbgForm900_926: TRxDBGrid;
    tbForm905: TTabSheet;
    dbgForm905: TRxDBGrid;
    tbForm929_569_593: TTabSheet;
    tbFormNota: TTabSheet;
    tbForm924_902: TTabSheet;
    dbgFormNota: TRxDBGrid;
    dbgForm929_569_593: TRxDBGrid;
    dbgForm924_902: TRxDBGrid;
    tbFormResMonoTrib_NoSuss_NoSussCopia: TTabSheet;
    dbgFormResMonoTrib_NoSuss_NoSussCopia: TRxDBGrid;
    tbForm921: TTabSheet;
    dbgForm921: TRxDBGrid;
    tbFormMixta931_170: TTabSheet;
    dbgFormMixta931_170: TRxDBGrid;
    tbFormTicketPresentacion: TTabSheet;
    dbgFormTicketPresentacion: TRxDBGrid;
    tbFormRCompl924_902: TTabSheet;
    dbgFormResComp924_902: TRxDBGrid;
    btnCancel: TButton;
    btnAplicar: TButton;
    tbComandosDetalle: TToolBar;
    tbAddNomina: TToolButton;
    tbDeleteNomina: TToolButton;
    tbLimpiarNomina: TToolButton;
    dsForm931: TDataSource;
    sdqForm931: TSDQuery;
    sdqNota: TSDQuery;
    tbModifyNomina: TToolButton;
    dsForm165_170: TDataSource;
    sdqForm165_170: TSDQuery;
    dsFormMixta931_170: TDataSource;
    sdqFormMixta931_170: TSDQuery;
    dsForm900_926: TDataSource;
    sdqForm900_926: TSDQuery;
    dsForm905: TDataSource;
    sdqForm905: TSDQuery;
    dsForm929_569_593: TDataSource;
    sdqForm929_569_593: TSDQuery;
    dsFormNota: TDataSource;
    sdqFormNota: TSDQuery;
    dsForm924_902: TDataSource;
    sdqForm924_902: TSDQuery;
    dsFRMonoTrib_NoSuss_NoSussCopia: TDataSource;
    sdqFRMonoTrib_NoSuss_NoSussCopia: TSDQuery;
    dsForm921: TDataSource;
    sdqForm921: TSDQuery;
    dsFormTicketPresentacion: TDataSource;
    sdqFormTicketPresentacion: TSDQuery;
    dsFormRCompl924_902: TDataSource;
    sdqFormRCompl924_902: TSDQuery;
    spGetBiblioratoSecuencia: TSDStoredProc;
    fpEnviarA: TFormPanel;
    Bevel5: TBevel;
    btnVerificacion: TButton;
    btnCorregido: TButton;
    gbEnviarA: TJvgGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edEstado: TEdit;
    lblEstado: TLabel;
    lblEstadoPrevisto: TLabel;
    tbMasObservaciones: TToolBar;
    tbAddMasObservaciones: TToolButton;
    tbFormConstMono: TTabSheet;
    dbgFormConstMono: TRxDBGrid;
    dsFormConstMonotributista: TDataSource;
    sdqFormConstMonotributista: TSDQuery;
    tbFormAnexoIIExcep: TTabSheet;
    dbgAnexoIIExcep: TRxDBGrid;
    dsAnexoIIExcep: TDataSource;
    sdqAnexoIIExcep: TSDQuery;
    tbPagos: TTabSheet;
    dbgPagos: TRxDBGrid;
    dsFormPagos: TDataSource;
    sdqFormPagos: TSDQuery;
    ShortCut: TShortCutControl;
    Seguridad: TSeguridad;
    DBLogin: TDBLogin;
    AppEvents: TJvAppEvents;
    IdleTimer: TTimer;
    edBlockNota: TMemo;
    lblBlockNota: TLabel;
    tbFormConstIncrEmpl: TTabSheet;
    dbgConstIncrEmpl: TRxDBGrid;
    dsFormConstInscrEmpl: TDataSource;
    sdqFormConstInscrEmpl: TSDQuery;
    pcSimulacion: TJvPageControl;
    tbNota: TTabSheet;
    tbSimulacion: TTabSheet;
    lblObservacionVerif: TLabel;
    edObservacion: TMemo;
    sdqForm165_170NP_IDTIPOFORMULARIO: TFloatField;
    sdqForm165_170TF_DESCRIPCION: TStringField;
    sdqForm165_170NP_PERIODO: TStringField;
    sdqForm165_170NP_TOTALEMPLEADOS: TFloatField;
    sdqForm165_170NP_TOTALMASASALARIAL: TFloatField;
    sdqForm165_170NP_FECHAPRESENTACION: TDateTimeField;
    sdqForm165_170INSCRIPCION: TStringField;
    sdqForm165_170NP_FECHABAJA: TDateTimeField;
    sdqForm165_170NP_ID: TFloatField;
    sdqForm165_170NP_OBSERVACION: TStringField;
    sdqForm165_170ESTADO: TStringField;
    sdqForm165_170ESTADOSIM: TStringField;
    sdqForm165_170OBS: TStringField;
    sdqForm165_170NP_IDESTADOFORMULARIO: TFloatField;
    sdqForm165_170NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqForm165_170NP_FECHABAJA_1: TDateTimeField;
    sdqForm165_170NP_ILEGIBLE: TStringField;
    sdqForm165_170NP_ACEPTACION: TStringField;
    sdqForm900_926NP_IDTIPOFORMULARIO: TFloatField;
    sdqForm900_926TF_DESCRIPCION: TStringField;
    sdqForm900_926NP_PERIODO: TStringField;
    sdqForm900_926NP_TOTALEMPLEADOS: TFloatField;
    sdqForm900_926NP_TOTALMASASALARIAL: TFloatField;
    sdqForm900_926NP_FECHAPRESENTACION: TDateTimeField;
    sdqForm900_926NP_TOTALHOJAS: TFloatField;
    sdqForm900_926NP_CODIGORECTIFICATIVA: TStringField;
    sdqForm900_926NP_FECHABAJA: TDateTimeField;
    sdqForm900_926NP_ID: TFloatField;
    sdqForm900_926NP_OBSERVACION: TStringField;
    sdqForm900_926ESTADO: TStringField;
    sdqForm900_926ESTADOSIM: TStringField;
    sdqForm900_926OBS: TStringField;
    sdqForm900_926NP_IDESTADOFORMULARIO: TFloatField;
    sdqForm900_926NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqForm900_926NP_FECHABAJA_1: TDateTimeField;
    sdqForm900_926NP_ILEGIBLE: TStringField;
    sdqForm900_926NP_ACEPTACION: TStringField;
    sdqForm905NP_PERIODO: TStringField;
    sdqForm905NP_CONTICKET: TStringField;
    sdqForm905NP_FECHAPRESENTACION: TDateTimeField;
    sdqForm905NP_CODIGORECTIFICATIVA: TStringField;
    sdqForm905NP_FECHABAJA: TDateTimeField;
    sdqForm905NP_ID: TFloatField;
    sdqForm905NP_IDTIPOFORMULARIO: TFloatField;
    sdqForm905NP_OBSERVACION: TStringField;
    sdqForm905ESTADO: TStringField;
    sdqForm905ESTADOSIM: TStringField;
    sdqForm905OBS: TStringField;
    sdqForm905NP_IDESTADOFORMULARIO: TFloatField;
    sdqForm905NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqForm905NP_FECHABAJA_1: TDateTimeField;
    sdqForm905NP_ILEGIBLE: TStringField;
    sdqForm905NP_ACEPTACION: TStringField;
    sdqForm929_569_593NP_IDTIPOFORMULARIO: TFloatField;
    sdqForm929_569_593TF_DESCRIPCION: TStringField;
    sdqForm929_569_593NP_PERIODO: TStringField;
    sdqForm929_569_593NP_CONRESUMEN: TStringField;
    sdqForm929_569_593NP_FECHABAJA: TDateTimeField;
    sdqForm929_569_593NP_ID: TFloatField;
    sdqForm929_569_593NP_OBSERVACION: TStringField;
    sdqForm929_569_593ESTADO: TStringField;
    sdqForm929_569_593ESTADOSIM: TStringField;
    sdqForm929_569_593OBS: TStringField;
    sdqForm929_569_593NP_IDESTADOFORMULARIO: TFloatField;
    sdqForm929_569_593NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqForm929_569_593NP_FECHABAJA_1: TDateTimeField;
    sdqForm929_569_593NP_ILEGIBLE: TStringField;
    sdqForm929_569_593NP_ACEPTACION: TStringField;
    sdqFormNotaNP_PERIODO: TStringField;
    sdqFormNotaNP_TOTALEMPLEADOS: TFloatField;
    sdqFormNotaNP_TOTALMASASALARIAL: TFloatField;
    sdqFormNotaNP_FECHAPRESENTACION: TDateTimeField;
    sdqFormNotaNP_TEXTONOTA: TStringField;
    sdqFormNotaNP_FECHABAJA: TDateTimeField;
    sdqFormNotaNP_ID: TFloatField;
    sdqFormNotaNP_IDTIPOFORMULARIO: TFloatField;
    sdqFormNotaNP_OBSERVACION: TStringField;
    sdqFormNotaESTADO: TStringField;
    sdqFormNotaESTADOSIM: TStringField;
    sdqFormNotaOBS: TStringField;
    sdqFormNotaNP_IDESTADOFORMULARIO: TFloatField;
    sdqFormNotaNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormNotaNP_FECHABAJA_1: TDateTimeField;
    sdqFormNotaNP_ILEGIBLE: TStringField;
    sdqFormNotaNP_ACEPTACION: TStringField;
    sdqForm924_902NP_IDTIPOFORMULARIO: TFloatField;
    sdqForm924_902TF_DESCRIPCION: TStringField;
    sdqForm924_902NP_PERIODO: TStringField;
    sdqForm924_902NP_CONRESUMEN: TStringField;
    sdqForm924_902NP_TOTALEMPLEADOS: TFloatField;
    sdqForm924_902NP_CONTICKET: TStringField;
    sdqForm924_902NP_CODIGORECTIFICATIVA: TStringField;
    sdqForm924_902NP_FECHAPRESENTACION: TDateTimeField;
    sdqForm924_902NP_TOTALMASASALARIAL: TFloatField;
    sdqForm924_902NP_FECHABAJA: TDateTimeField;
    sdqForm924_902NP_ID: TFloatField;
    sdqForm924_902NP_OBSERVACION: TStringField;
    sdqForm924_902ESTADO: TStringField;
    sdqForm924_902ESTADOSIM: TStringField;
    sdqForm924_902OBS: TStringField;
    sdqForm924_902NP_IDESTADOFORMULARIO: TFloatField;
    sdqForm924_902NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqForm924_902NP_FECHABAJA_1: TDateTimeField;
    sdqForm924_902NP_ILEGIBLE: TStringField;
    sdqForm924_902NP_ACEPTACION: TStringField;
    sdqForm921NP_PERIODO: TStringField;
    sdqForm921NP_CONTICKET: TStringField;
    sdqForm921NP_FECHAPRESENTACION: TDateTimeField;
    sdqForm921NP_EMPLEADOSCONALTA: TFloatField;
    sdqForm921NP_EMPLEADOSCONBAJA: TFloatField;
    sdqForm921NP_NUMEROVERIFICADOR: TStringField;
    sdqForm921NP_FECHABAJA: TDateTimeField;
    sdqForm921NP_ID: TFloatField;
    sdqForm921NP_IDTIPOFORMULARIO: TFloatField;
    sdqForm921NP_OBSERVACION: TStringField;
    sdqForm921ESTADO: TStringField;
    sdqForm921ESTADOSIM: TStringField;
    sdqForm921OBS: TStringField;
    sdqForm921NP_IDESTADOFORMULARIO: TFloatField;
    sdqForm921NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqForm921NP_FECHABAJA_1: TDateTimeField;
    sdqForm921NP_ILEGIBLE: TStringField;
    sdqForm921NP_ACEPTACION: TStringField;
    sdqFormMixta931_170NP_PERIODO: TStringField;
    sdqFormMixta931_170NP_TOTALEMPLEADOS: TFloatField;
    sdqFormMixta931_170NP_TOTALMASASALARIAL: TFloatField;
    sdqFormMixta931_170FORM931: TStringField;
    sdqFormMixta931_170FORM170: TStringField;
    sdqFormMixta931_170NP_FECHABAJA: TDateTimeField;
    sdqFormMixta931_170NP_ID: TFloatField;
    sdqFormMixta931_170NP_IDTIPOFORMULARIO: TFloatField;
    sdqFormMixta931_170NP_OBSERVACION: TStringField;
    sdqFormMixta931_170ESTADO: TStringField;
    sdqFormMixta931_170ESTADOSIM: TStringField;
    sdqFormMixta931_170OBS: TStringField;
    sdqFormMixta931_170NP_IDESTADOFORMULARIO: TFloatField;
    sdqFormMixta931_170NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormMixta931_170NP_FECHABAJA_1: TDateTimeField;
    sdqFormMixta931_170NP_ILEGIBLE: TStringField;
    sdqFormMixta931_170NP_ACEPTACION: TStringField;
    sdqFormTicketPresentacionNP_PERIODO: TStringField;
    sdqFormTicketPresentacionNP_NUMEROVERIFICADOR: TStringField;
    sdqFormTicketPresentacionNP_FECHAPRESENTACION: TDateTimeField;
    sdqFormTicketPresentacionNP_FECHABAJA: TDateTimeField;
    sdqFormTicketPresentacionNP_ID: TFloatField;
    sdqFormTicketPresentacionNP_IDTIPOFORMULARIO: TFloatField;
    sdqFormTicketPresentacionNP_OBSERVACION: TStringField;
    sdqFormTicketPresentacionESTADO: TStringField;
    sdqFormTicketPresentacionESTADOSIM: TStringField;
    sdqFormTicketPresentacionOBS: TStringField;
    sdqFormTicketPresentacionNP_IDESTADOFORMULARIO: TFloatField;
    sdqFormTicketPresentacionNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormTicketPresentacionNP_FECHABAJA_1: TDateTimeField;
    sdqFormTicketPresentacionNOTA: TStringField;
    sdqFormTicketPresentacionNP_ILEGIBLE: TStringField;
    sdqFormTicketPresentacionNP_ACEPTACION: TStringField;
    sdqFormRCompl924_902NP_PERIODO: TStringField;
    sdqFormRCompl924_902NP_TOTALMASASALARIAL: TFloatField;
    sdqFormRCompl924_902NP_FECHABAJA: TDateTimeField;
    sdqFormRCompl924_902NP_ID: TFloatField;
    sdqFormRCompl924_902NP_IDTIPOFORMULARIO: TFloatField;
    sdqFormRCompl924_902NP_OBSERVACION: TStringField;
    sdqFormRCompl924_902ESTADO: TStringField;
    sdqFormRCompl924_902ESTADOSIM: TStringField;
    sdqFormRCompl924_902OBS: TStringField;
    sdqFormRCompl924_902NP_IDESTADOFORMULARIO: TFloatField;
    sdqFormRCompl924_902NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormRCompl924_902NP_FECHABAJA_1: TDateTimeField;
    sdqFormRCompl924_902NOTA: TStringField;
    sdqFormRCompl924_902NP_ILEGIBLE: TStringField;
    sdqFormRCompl924_902NP_ACEPTACION: TStringField;
    sdqFormConstMonotributistaNP_IDTIPOFORMULARIO: TFloatField;
    sdqFormConstMonotributistaTF_DESCRIPCION: TStringField;
    sdqFormConstMonotributistaNP_PERIODO: TStringField;
    sdqFormConstMonotributistaNP_FECHABAJA: TDateTimeField;
    sdqFormConstMonotributistaNP_ID: TFloatField;
    sdqFormConstMonotributistaNP_OBSERVACION: TStringField;
    sdqFormConstMonotributistaESTADO: TStringField;
    sdqFormConstMonotributistaESTADOSIM: TStringField;
    sdqFormConstMonotributistaOBS: TStringField;
    sdqFormConstMonotributistaNP_IDESTADOFORMULARIO: TFloatField;
    sdqFormConstMonotributistaNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormConstMonotributistaNOTA: TStringField;
    sdqFormConstMonotributistaNP_FECHABAJA_1: TDateTimeField;
    sdqFormConstMonotributistaNP_ILEGIBLE: TStringField;
    sdqFormConstMonotributistaNP_ACEPTACION: TStringField;
    sdqAnexoIIExcepNP_IDTIPOFORMULARIO: TFloatField;
    sdqAnexoIIExcepTF_DESCRIPCION: TStringField;
    sdqAnexoIIExcepNP_PERIODO: TStringField;
    sdqAnexoIIExcepNP_FECHABAJA: TDateTimeField;
    sdqAnexoIIExcepNP_ID: TFloatField;
    sdqAnexoIIExcepNP_OBSERVACION: TStringField;
    sdqAnexoIIExcepESTADO: TStringField;
    sdqAnexoIIExcepESTADOSIM: TStringField;
    sdqAnexoIIExcepOBS: TStringField;
    sdqAnexoIIExcepNP_IDESTADOFORMULARIO: TFloatField;
    sdqAnexoIIExcepNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqAnexoIIExcepNP_FECHABAJA_1: TDateTimeField;
    sdqAnexoIIExcepNP_ILEGIBLE: TStringField;
    sdqAnexoIIExcepNP_ACEPTACION: TStringField;
    sdqFormPagosNP_IDTIPOFORMULARIO: TFloatField;
    sdqFormPagosTF_DESCRIPCION: TStringField;
    sdqFormPagosNP_PERIODO: TStringField;
    sdqFormPagosNP_FECHABAJA: TDateTimeField;
    sdqFormPagosNP_ID: TFloatField;
    sdqFormPagosNP_OBSERVACION: TStringField;
    sdqFormPagosESTADO: TStringField;
    sdqFormPagosESTADOSIM: TStringField;
    sdqFormPagosOBS: TStringField;
    sdqFormPagosNP_IDESTADOFORMULARIO: TFloatField;
    sdqFormPagosNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormPagosNOTA: TStringField;
    sdqFormPagosNP_FECHABAJA_1: TDateTimeField;
    sdqFormPagosNP_ILEGIBLE: TStringField;
    sdqFormPagosNP_ACEPTACION: TStringField;
    sdqFormConstInscrEmplNP_IDTIPOFORMULARIO: TFloatField;
    sdqFormConstInscrEmplTF_DESCRIPCION: TStringField;
    sdqFormConstInscrEmplNP_PERIODO: TStringField;
    sdqFormConstInscrEmplNP_FECHABAJA: TDateTimeField;
    sdqFormConstInscrEmplNP_ID: TFloatField;
    sdqFormConstInscrEmplNP_OBSERVACION: TStringField;
    sdqFormConstInscrEmplESTADO: TStringField;
    sdqFormConstInscrEmplESTADOSIM: TStringField;
    sdqFormConstInscrEmplOBS: TStringField;
    sdqFormConstInscrEmplNP_IDESTADOFORMULARIO: TFloatField;
    sdqFormConstInscrEmplNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormConstInscrEmplNOTA: TStringField;
    sdqFormConstInscrEmplNP_FECHABAJA_1: TDateTimeField;
    sdqFormConstInscrEmplNP_ILEGIBLE: TStringField;
    sdqFormConstInscrEmplNP_FECHAINSCRIPCIONEMPL: TDateTimeField;
    sdqFormConstInscrEmplNP_ACEPTACION: TStringField;
    sdqForm931NP_ID: TFloatField;
    sdqForm931NP_IDNOTA: TFloatField;
    sdqForm931NP_PERIODO: TStringField;
    sdqForm931NP_USUALTA: TStringField;
    sdqForm931NP_FECHAALTA: TDateTimeField;
    sdqForm931NP_USUMODIF: TStringField;
    sdqForm931NP_FECHAMODIF: TDateTimeField;
    sdqForm931NP_USUBAJA: TStringField;
    sdqForm931NP_FECHABAJA: TDateTimeField;
    sdqForm931NP_IDTIPOFORMULARIO: TFloatField;
    sdqForm931NP_IDDDJJ: TFloatField;
    sdqForm931NP_IDSOLICITUDAUTORIZACION: TFloatField;
    sdqForm931NP_CODIGORECTIFICATIVA: TStringField;
    sdqForm931NP_NUMEROVERIFICADOR: TStringField;
    sdqForm931NP_TOTALEMPLEADOS: TFloatField;
    sdqForm931NP_TOTALMASASALARIAL: TFloatField;
    sdqForm931NP_SINEMPLEADOS: TStringField;
    sdqForm931NP_CONTICKET: TStringField;
    sdqForm931NP_NUMEROVERIFICADOR_2: TStringField;
    sdqForm931NP_FECHAPRESENTACION: TDateTimeField;
    sdqForm931NP_IDINSCRIPCION: TFloatField;
    sdqForm931NP_TOTALHOJAS: TFloatField;
    sdqForm931NP_CONRESUMEN: TStringField;
    sdqForm931NP_TEXTONOTA: TStringField;
    sdqForm931NP_ENMIENDA: TStringField;
    sdqForm931NP_EMPLEADOSCONALTA: TFloatField;
    sdqForm931NP_EMPLEADOSCONBAJA: TFloatField;
    sdqForm931NP_FORMULARIOMIXTO: TStringField;
    sdqForm931NP_OBSERVACION: TStringField;
    sdqForm931NP_IDESTADOFORMULARIO: TFloatField;
    sdqForm931NP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqForm931NP_IDNOTAPERIODORELACIONADA: TFloatField;
    sdqForm931NP_TIPORELACION: TStringField;
    sdqForm931NP_TIPOFORMULARIOPRESENTADO: TFloatField;
    sdqForm931NP_FECHABAJACONTRATO: TDateTimeField;
    sdqForm931NP_ILEGIBLE: TStringField;
    sdqForm931NP_FECHAINSCRIPCIONEMPL: TDateTimeField;
    sdqForm931NP_ACEPTACION: TStringField;
    sdqForm931ESTADO: TStringField;
    sdqForm931ESTADOSIM: TStringField;
    sdqForm931OBS: TStringField;
    sdqForm931CHECK_ESTADO: TStringField;
    sdqForm165_170CHECK_ESTADO: TStringField;
    sdqForm900_926CHECK_ESTADO: TStringField;
    sdqForm905CHECK_ESTADO: TStringField;
    sdqForm929_569_593CHECK_ESTADO: TStringField;
    sdqFormNotaCHECK_ESTADO: TStringField;
    sdqForm924_902CHECK_ESTADO: TStringField;
    sdqFormRCompl924_902CHECK_ESTADO: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaCHECK_ESTADO: TStringField;
    sdqForm921CHECK_ESTADO: TStringField;
    sdqFormMixta931_170CHECK_ESTADO: TStringField;
    sdqFormTicketPresentacionCHECK_ESTADO: TStringField;
    sdqFormConstMonotributistaCHECK_ESTADO: TStringField;
    sdqAnexoIIExcepCHECK_ESTADO: TStringField;
    sdqFormPagosCHECK_ESTADO: TStringField;
    sdqFormConstInscrEmplCHECK_ESTADO: TStringField;
    btnASimulacion: TButton;
    StatusBar: TStatusBar;
    GroupBox1: TGroupBox;
    lblDevActual: TLabel;
    edDevActual: TCurrencyEdit;
    lblDevPrevisto: TLabel;
    edDevPrevisto: TCurrencyEdit;
    Diferencia: TLabel;
    edDiferencia: TCurrencyEdit;
    lblCantPerAfectados: TLabel;
    edCantPerAfectados: TIntEdit;
    edMontoTotalAplic: TCurrencyEdit;
    lblMontoTotalAplic: TLabel;
    edSadoAcreedorPrevisto: TCurrencyEdit;
    Label8: TLabel;
    edSadoAcreedorActual: TCurrencyEdit;
    lbledSadoAcreedorActual: TLabel;
    edPagado: TCurrencyEdit;
    lblPagado: TLabel;
    lblSalProm: TLabel;
    edSalProm: TCurrencyEdit;
    lblCodRecSim: TLabel;
    edCodRectPrev: TIntEdit;
    tbFormDocColegios: TTabSheet;
    dbgDocColegios: TRxDBGrid;
    dsFormDocColegios: TDataSource;
    sdqFormDocColegios: TSDQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField7: TStringField;
    DateTimeField2: TDateTimeField;
    StringField8: TStringField;
    DateTimeField3: TDateTimeField;
    StringField9: TStringField;
    StringField10: TStringField;
    sdqFormDocColegiosAM_CUIL: TStringField;
    sdqFormDocColegiosAM_MASAADICIONAL: TFloatField;
    sdqFormDocColegiosAM_FECHAPRESENTACION: TDateTimeField;
    sdqFormDocColegiosEXISTEDDJJ: TStringField;
    sdqFormDocColegiosEXISTETRAB: TStringField;
    tbGestionado: TTabSheet;
    dbgGestionado: TRxDBGrid;
    dsGestionado: TDataSource;
    sdqGestionado: TSDQuery;
    FloatField5: TFloatField;
    StringField11: TStringField;
    StringField12: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField6: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField17: TStringField;
    DateTimeField5: TDateTimeField;
    StringField18: TStringField;
    DateTimeField6: TDateTimeField;
    StringField19: TStringField;
    StringField20: TStringField;
    sdqGestionadoNP_TEXTONOTA: TStringField;
    pnlHeader: TPanel;
    pnlCaptions: TPanel;
    lblReferenciaDiferenciaDevengado: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblLeyendaPeriodoPendienteAprob: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    tbarSimulacion: TToolBar;
    btnAprobar: TToolButton;
    btnRechazar: TToolButton;
    ToolButton3: TToolButton;
    btnSelectAll: TToolButton;
    mnuSelect: TPopupMenu;
    mnuSeleccionarTodo: TMenuItem;
    mnuSeleccionarResto: TMenuItem;
    btnEliminarMarca: TToolButton;
    lblDiferenciaTotVariac: TLabel;
    edDiferenciaTotVariac: TCurrencyEdit;
    lblSumaVariacion: TLabel;
    edSumaVariacion: TCurrencyEdit;
    lblSumaVariacionAprob: TLabel;
    edSumaVariacionAprob: TCurrencyEdit;
    sdqForm931NP_TEXTOOBSNOTA: TBlobField;
    sdqGestionadoNP_TEXTOOBSNOTA: TBlobField;
    sdqFormConstInscrEmplAnulaFechaInscrip: TStringField;
    sdqForm931NP_ESTADOHISTORICO: TStringField;
    sdqForm931NP_DERIVADOHISTORICO: TStringField;
    sdqForm931NP_IDTIPOFORMULARIOHIST: TFloatField;
    sdqForm931NP_ERRORV28: TStringField;
    sdqForm931NP_IDTIPONOMINA: TFloatField;
    sdqForm931TIPONOMINA: TStringField;
    sdqForm165_170NP_TEXTOOBSNOTA: TBlobField;
    sdqForm900_926NP_TEXTOOBSNOTA: TBlobField;
    sdqForm905NP_TEXTOOBSNOTA: TBlobField;
    sdqForm929_569_593NP_TEXTOOBSNOTA: TBlobField;
    sdqFormNotaNP_TEXTOOBSNOTA: TBlobField;
    sdqForm924_902NP_TEXTOOBSNOTA: TBlobField;
    sdqForm921NP_TEXTOOBSNOTA: TBlobField;
    sdqFormMixta931_170NP_TEXTOOBSNOTA: TBlobField;
    sdqFormTicketPresentacionNP_TEXTOOBSNOTA: TBlobField;
    sdqFormRCompl924_902NP_TEXTOOBSNOTA: TBlobField;
    sdqFormConstMonotributistaNP_TEXTOOBSNOTA: TBlobField;
    sdqAnexoIIExcepNP_TEXTOOBSNOTA: TBlobField;
    sdqFormPagosNP_TEXTOOBSNOTA: TBlobField;
    sdqFormConstInscrEmplNP_TEXTOOBSNOTA: TBlobField;
    sdqFormDocColegiosNP_TEXTOOBSNOTA: TBlobField;
    sdqFormNotaTIPONOMINA: TStringField;
    tbAdicionarResumen: TTabSheet;
    dbgAdicionarResumen: TRxDBGrid;
    dsAdicionarResumen: TDataSource;
    sdqAdicionarResumen: TSDQuery;
    StringField21: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    DateTimeField7: TDateTimeField;
    DateTimeField8: TDateTimeField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    DateTimeField9: TDateTimeField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    sdqAdicionarResumenNP_TEXTONOTA: TStringField;
    sdqAdicionarResumenNP_TEXTOOBSNOTA: TBlobField;
    tbAdicionarDetalle: TTabSheet;
    dbgAdicionarDetalle: TRxDBGrid;
    sdqAdicionarDetalle: TSDQuery;
    StringField38: TStringField;
    dsAdicionarDetalle: TDataSource;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_IDTIPOFORMULARIO: TFloatField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaTF_DESCRIPCION: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_PERIODO: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ENMIENDA: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TOTALEMPLEADOS: TFloatField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TOTALMASASALARIAL: TFloatField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TEXTONOTA: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_FECHAPRESENTACION: TDateTimeField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_FECHABAJA: TDateTimeField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ID: TFloatField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_OBSERVACION: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaESTADO: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaESTADOSIM: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaOBS: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_IDESTADOFORMULARIO: TFloatField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaINSCRIPCION: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNOTA: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_FECHABAJA_1: TDateTimeField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ILEGIBLE: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ACEPTACION: TStringField;
    sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TEXTOOBSNOTA: TBlobField;
    sdqAdicionarDetalleNP_IDTIPOFORMULARIO: TFloatField;
    sdqAdicionarDetalleTF_DESCRIPCION: TStringField;
    sdqAdicionarDetalleNP_PERIODO: TStringField;
    sdqAdicionarDetalleNP_FECHABAJA: TDateTimeField;
    sdqAdicionarDetalleNP_ID: TFloatField;
    sdqAdicionarDetalleNP_OBSERVACION: TStringField;
    sdqAdicionarDetalleESTADOSIM: TStringField;
    sdqAdicionarDetalleOBS: TStringField;
    sdqAdicionarDetalleNP_IDESTADOFORMULARIO: TFloatField;
    sdqAdicionarDetalleNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqAdicionarDetalleNOTA: TStringField;
    sdqAdicionarDetalleNP_FECHABAJA_1: TDateTimeField;
    sdqAdicionarDetalleNP_ILEGIBLE: TStringField;
    sdqAdicionarDetalleNP_FECHAINSCRIPCIONEMPL: TDateTimeField;
    sdqAdicionarDetalleNP_ACEPTACION: TStringField;
    sdqAdicionarDetalleNP_FECHAPRESENTACION: TDateTimeField;
    sdqAdicionarDetalleNP_TOTALEMPLEADOS: TFloatField;
    sdqAdicionarDetalleNP_TOTALMASASALARIAL: TFloatField;
    sdqAdicionarDetalleESTADO: TStringField;
    sdqAdicionarDetalleNP_TEXTOOBSNOTA: TBlobField;
    btnAgendar: TButton;
    tbFormWeb: TTabSheet;
    dbgFormWeb: TRxDBGrid;
    dsFormWeb: TDataSource;
    sdqFormWeb: TSDQuery;
    StringField22: TStringField;
    sdqFormWebNP_PERIODO: TStringField;
    sdqFormWebNP_TOTALEMPLEADOS: TFloatField;
    sdqFormWebNP_TOTALMASASALARIAL: TFloatField;
    sdqFormWebNP_FECHAPRESENTACION: TDateTimeField;
    sdqFormWebNP_TEXTONOTA: TStringField;
    sdqFormWebNP_FECHABAJA: TDateTimeField;
    sdqFormWebNP_ID: TFloatField;
    sdqFormWebNP_IDTIPOFORMULARIO: TFloatField;
    sdqFormWebNP_OBSERVACION: TStringField;
    sdqFormWebESTADO: TStringField;
    sdqFormWebESTADOSIM: TStringField;
    sdqFormWebOBS: TStringField;
    sdqFormWebNP_IDESTADOFORMULARIO: TFloatField;
    sdqFormWebNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormWebNP_FECHABAJA_1: TDateTimeField;
    sdqFormWebNP_ILEGIBLE: TStringField;
    sdqFormWebNP_ACEPTACION: TStringField;
    sdqFormWebNP_TEXTOOBSNOTA: TBlobField;
    sdqFormWebNP_TOTALMASASINTOPEAR: TFloatField;
    tbFormSituacionFacturacion: TTabSheet;
    dbgSituacionFacturacion: TRxDBGrid;
    sdqFormSitFacturacion: TSDQuery;
    StringField30: TStringField;
    dsFormSitFacturacion: TDataSource;
    sdqFormSitFacturacionNP_ID: TFloatField;
    sdqFormSitFacturacionNP_IDNOTA: TFloatField;
    sdqFormSitFacturacionNP_PERIODO: TStringField;
    sdqFormSitFacturacionNP_USUALTA: TStringField;
    sdqFormSitFacturacionNP_FECHAALTA: TDateTimeField;
    sdqFormSitFacturacionNP_USUMODIF: TStringField;
    sdqFormSitFacturacionNP_FECHAMODIF: TDateTimeField;
    sdqFormSitFacturacionNP_USUBAJA: TStringField;
    sdqFormSitFacturacionNP_FECHABAJA: TDateTimeField;
    sdqFormSitFacturacionNP_IDTIPOFORMULARIO: TFloatField;
    sdqFormSitFacturacionNP_IDDDJJ: TFloatField;
    sdqFormSitFacturacionNP_TEXTONOTA: TStringField;
    sdqFormSitFacturacionNP_IDSOLICITUDAUTORIZACION: TFloatField;
    sdqFormSitFacturacionNP_CODIGORECTIFICATIVA: TStringField;
    sdqFormSitFacturacionNP_NUMEROVERIFICADOR: TStringField;
    sdqFormSitFacturacionNP_TOTALEMPLEADOS: TFloatField;
    sdqFormSitFacturacionNP_TOTALMASASALARIAL: TFloatField;
    sdqFormSitFacturacionNP_SINEMPLEADOS: TStringField;
    sdqFormSitFacturacionNP_CONTICKET: TStringField;
    sdqFormSitFacturacionNP_NUMEROVERIFICADOR_2: TStringField;
    sdqFormSitFacturacionNP_FECHAPRESENTACION: TDateTimeField;
    sdqFormSitFacturacionNP_IDINSCRIPCION: TFloatField;
    sdqFormSitFacturacionNP_TOTALHOJAS: TFloatField;
    sdqFormSitFacturacionNP_CONRESUMEN: TStringField;
    sdqFormSitFacturacionNP_ENMIENDA: TStringField;
    sdqFormSitFacturacionNP_EMPLEADOSCONALTA: TFloatField;
    sdqFormSitFacturacionNP_EMPLEADOSCONBAJA: TFloatField;
    sdqFormSitFacturacionNP_FORMULARIOMIXTO: TStringField;
    sdqFormSitFacturacionNP_OBSERVACION: TStringField;
    sdqFormSitFacturacionNP_IDESTADOFORMULARIO: TFloatField;
    sdqFormSitFacturacionNP_IDESTADOFORMULARIOSIM: TFloatField;
    sdqFormSitFacturacionNP_IDNOTAPERIODORELACIONADA: TFloatField;
    sdqFormSitFacturacionNP_TIPORELACION: TStringField;
    sdqFormSitFacturacionNP_TIPOFORMULARIOPRESENTADO: TFloatField;
    sdqFormSitFacturacionNP_FECHAINSCRIPCIONEMPL: TDateTimeField;
    sdqFormSitFacturacionNP_ESTADOHISTORICO: TStringField;
    sdqFormSitFacturacionNP_DERIVADOHISTORICO: TStringField;
    sdqFormSitFacturacionNP_TEXTOOBSNOTA_OLD: TBlobField;
    sdqFormSitFacturacionNP_ILEGIBLE: TStringField;
    sdqFormSitFacturacionNP_FECHABAJACONTRATO: TDateTimeField;
    sdqFormSitFacturacionNP_ACEPTACION: TStringField;
    sdqFormSitFacturacionNP_IDTIPOFORMULARIOHIST: TFloatField;
    sdqFormSitFacturacionNP_ERRORV28: TStringField;
    sdqFormSitFacturacionNP_IDTIPONOMINA: TFloatField;
    sdqFormSitFacturacionNP_IDDETALLESUBLOTEGESTION: TFloatField;
    sdqFormSitFacturacionNP_TOTALMASASINTOPEAR: TFloatField;
    sdqFormSitFacturacionNP_TEXTOOBSNOTA: TMemoField;
    sdqFormSitFacturacionESTADO: TStringField;
    sdqFormSitFacturacionESTADOSIM: TStringField;
    sdqFormSitFacturacionOBS: TStringField;
    sdqFormSitFacturacionTIPONOMINA: TStringField;
    procedure rgpTipoSolicitanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbAddNominaClick(Sender: TObject);
    procedure tbModifyNominaClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnBorradorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgFormDblClick(Sender: TObject);
    procedure fraEmpresaChange(Sender: TObject);
    procedure dbgFormGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqFormAfterScroll(DataSet: TDataSet);
    procedure btnAplicarClick(Sender: TObject);
    procedure tbDeleteNominaClick(Sender: TObject);
    procedure tbAddMasObservacionesClick(Sender: TObject);
    procedure pcFormulariosChange(Sender: TObject);
    procedure AppEventsIdle(Sender: TObject; var Done: Boolean);
    procedure IdleTimerTimer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CamposCalculados(DataSet: TDataSet);
    procedure dbgFormCellClick(Column: TColumn);
    procedure btnASimulacionClick(Sender: TObject);
    procedure btnAprobarClick(Sender: TObject);
    procedure btnRechazarClick(Sender: TObject);
    procedure mnuSeleccionarTodoClick(Sender: TObject);
    procedure mnuSeleccionarRestoClick(Sender: TObject);
    procedure btnEliminarMarcaClick(Sender: TObject);
    function get_observaciongestion(aidObservacion: integer): integer;
    procedure btnAgendarClick(Sender: TObject);
  private
    FIdNota: integer;
    FPeriodo: String;
    ModoABM: TModoABM;
    FAccesoaSimular: Boolean;
    procedure RefrescarFormularios(aIdFormulario: integer);
    function Validar: boolean;
    function ValidarAplicacion: boolean;
    function ValidarSimulacion: boolean;
    procedure GuardarNotaBorrador(aAplica: boolean = false);
    procedure PasarASimulacion;
    procedure AplicarNota;
    procedure AgendarNota;
    procedure AplicarFormulariosNota(aSimula: boolean);
    function TieneDetalle: boolean;
    function ExistsSinAceptacion: boolean;
    function ExistsResumenPersonalOrig: boolean;
    function NoExistsDDJJActivaParaDetalle: boolean;
    function ExistsFormProcesable: boolean;
    procedure ActivarControles(aActive: boolean);
    procedure RefrescarConsulta(aIdNota: integer; aConsulta: TSDQuery; aSolapa: TTabSheet);
    function ExistsConAceptacion: boolean;
    procedure DoCargarSumatoriasVariacionGrilla(aIdNota: integer);
    procedure sdqConsultaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    function ExistsFormSimulable: boolean;
    function ExistFechaPresentacion: boolean;
    procedure HabilitarSimulacion;
  public
    class procedure AltaNota(aContrato: integer; aPeriodo: String = '');
    class procedure ModificarNota(aIdNota: integer);
    class procedure VerNota(aIdNota: integer);
    class procedure SimularNota(aIdNota: integer);
  end;

const TF_TODOS = 0;

var
  frmABMNotas: TfrmABMNotas;

implementation

uses unArt, DateUtils, Math, SDCommon;

{$R *.dfm}

procedure TfrmABMNotas.rgpTipoSolicitanteClick(Sender: TObject);
begin
  fraSolicitanteNota.Clear;

  with fraSolicitanteNota do
  begin
    case rgpTipoSolicitante.ItemIndex of
      0: begin
        TableName := 'art.use_usuarios';
        FieldID := 'se_id';
        FieldCodigo := 'se_usuario';
        FieldDesc := 'se_nombre';
        FieldBaja := 'se_fechabaja';
      end;

      1: begin
        TableName := 'art.usc_sectores';
        FieldID := 'sc_id';
        FieldCodigo := 'sc_codigo';
        FieldDesc := 'sc_descripcion';
        FieldBaja := 'sc_fechabaja';
      end;

      2: begin
        TableName := 'emi.isn_solicitantesnota';
        FieldID := 'sn_id';
        FieldCodigo := 'sn_id';
        FieldDesc := 'sn_descripcion';
        FieldBaja := 'sn_fechabaja';
      end
    end;

    ShowBajas := true
  end;
end;

procedure TfrmABMNotas.FormCreate(Sender: TObject);
begin
  Seguridad.Ejecutar;
  FAccesoaSimular := btnASimulacion.Enabled;
  fraEmpresa.OnChange := fraEmpresaChange;
  rgpTipoSolicitanteClick(Sender);
//  fraSolicitanteNota.Codigo := Sesion.LoginName;
  ModoABM := maNone;
  fraEmpresa.ShowBajas := true;
  pcFormularios.ActivePage := tbForm931;
  pcFormularios.HideAllTabs := true;
  pcSimulacion.HideAllTabs := true;
end;

class procedure TfrmABMNotas.ModificarNota(aIdNota: integer);
begin
  with TfrmABMNotas.Create(nil) do
  try
    try
      Width := 610;
      Height := 541;
      tbarSimulacion.Visible := false;
      pnlCaptions.Visible := true;
      btnAgendar.Enabled := false;
      BeginTrans(true);
      ModoABM := maModificacion;
      pcSimulacion.ActivePageIndex := 0;
      FIdNota:= aIdNota;
      sdqNota.Sql.Add('FOR UPDATE NOWAIT');
      sdqNota.ParamByName('idNota').AsInteger := aIdNota;
      sdqNota.Open;
      if not sdqNota.IsEmpty then
      begin
        GuardarInfoBloqueo(aIdNota, Sesion.LoginName);
        rgpTipoSolicitante.ItemIndex := sdqNota.fieldbyname('NO_TIPOSOLICITANTE').AsInteger;
        fraSolicitanteNota.Value := sdqNota.fieldbyname('NO_SOLICITANTE').AsInteger;
        fraEmpresa.Contrato := sdqNota.fieldbyname('NO_CONTRATO').AsInteger;
        edFechaRecepcionEmision.Date := sdqNota.fieldbyname('NO_FECHARECEPCION').AsDateTime;
        edFechaRecepcionART.Date := sdqNota.fieldbyname('NO_FECHARECEPCIONART').AsDateTime;
        edBiblioratoNota.Value := sdqNota.fieldbyname('NO_BIBLIORATO').AsInteger;
        edSecuenciaNota.Value := sdqNota.fieldbyname('NO_SECUENCIA').AsInteger;
        AplicarFormulariosNota(true);
        RefrescarFormularios(TF_TODOS);
        HabilitarSimulacion;

  (*
        RefrescarForm931(aIdNota);
        RefrescarForm165_170(aIdNota);
        RefrescarForm900_926(aIdNota);
        RefrescarForm905(aIdNota);
        RefrescarForm929_569_593(aIdNota);
        RefrescarFormNota(aIdNota);
        RefrescarForm924_902(aIdNota);
        RefrescarMonoTrib_NoSuss_NoSussCopia(aIdNota);
        RefrescarForm921(aIdNota);
        RefrescarFormMixta931_170(aIdNota);
        RefrescarTicketPresentacion(aIdNota);
        RefrescarResumComplement924_902(aIdNota);
  *)
        fraEmpresaChange(nil);
        //Simulo la nota para actualizar los estados previstos de los formularios
        ShowModal;
      end
      else MsgBox('No se encontró la nota', MB_ICONERROR);
    except
      on E : ESDEngineError do
      begin
        if E.NativeError = 54 then
        begin
          MsgBox('El registro está siendo utilizado por el usuario ' + GetInfoBloqueo(aIdNota) + '.' + #13#10 + 'Por esa razón no podrá guardar ningún cambio.', MB_ICONWARNING);
          VerNota(FIdNota);
        end;
      end;
    end;
  finally
    free;
  end;
end;


class procedure TfrmABMNotas.AltaNota(aContrato: integer; aPeriodo: String);
begin
  BeginTrans(true);
  with TfrmABMNotas.Create(nil) do
  try
    Width := 610;
    Height := 541;
    ModoABM := maAlta;
    rgpTipoSolicitante.ItemIndex := 1;
    rgpTipoSolicitanteClick(nil);
    pcSimulacion.ActivePageIndex := 0;
    tbarSimulacion.Visible := false;
    pnlCaptions.Visible := true;
    btnAgendar.Enabled := false;
    FPeriodo := aPeriodo;
    FIdNota:= GetSecNextVal('emi.seq_ino_id');
    EjecutarSqlST(' insert into emi.ino_nota(no_id, no_solicitante, no_fecharecepcion, ' +
//                  ' no_bibliorato, no_secuencia, no_usualta, no_fechaalta, no_idmotivosolicitudnota, ' +
                  ' no_usualta, no_fechaalta, no_idmotivosolicitudnota, ' +
                  ' no_idestadonota, no_tiposolicitante) ' +
                  ' values(' + SqlValue(FIdNota) + ', ' + SqlValue(fraSolicitanteNota.Value) + ', sysdate, ' +
//                  ' -1, -1, ' + SqlValue(Sesion.LoginName) + ', sysdate, 1, ' +
                  SqlValue(Sesion.LoginName) + ', sysdate, 2, ' +
                  ' 1, 0)');
    if (aContrato > 0) then
    begin
      fraEmpresa.Contrato := aContrato;
      fraEmpresaChange(nil);
    end;
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmABMNotas.tbAddNominaClick(Sender: TObject);
begin
  with TfrmFormularioEmi.Create(self) do
  try
    IdNota := FIdNota;
    Contrato := fraEmpresa.Contrato;
    Periodo := FPeriodo;

    if (ShowModal = mrok) then
    begin
      if fraEmpresa.IsSelected then
        AplicarFormulariosNota(true);
      RefrescarFormularios(TF_TODOS);
      HabilitarSimulacion;
//      RefrescarFormularios(fraNominas.IdFormulario);
    end;
  finally
    Free;
  end;
end;

procedure TfrmABMNotas.tbModifyNominaClick(Sender: TObject);
var
  bc : Tbookmark;
begin
  if pcFormularios.ActivePage = tbGestionado then Exit;

  with TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet do
    if Active and not IsEmpty and tbComandosDetalle.Enabled then
    begin
      with TfrmFormularioEmi.Create(self) do
      try
        bc := TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.GetBookmark;
        IdNota := FIdNota;
        Contrato := fraEmpresa.Contrato;
        CargarFormulario(FieldByName('NP_IDTIPOFORMULARIO').AsInteger,
                         FieldByName('NP_ID').AsInteger,
                         FieldByName('NP_PERIODO').AsString, (ModoABM = maVer) or (ModoABM = maSimular),
                         FieldByName('NP_IDESTADOFORMULARIO').AsInteger,
                         (FieldByName('NP_ILEGIBLE').AsString = 'S'));
        if (ShowModal = mrok) then
        begin
          if fraEmpresa.IsSelected then
            AplicarFormulariosNota(true);
            //fraNominas.SimularEstado(fraEmpresa.Contrato, FieldByName('NP_ID').AsInteger);
          RefrescarFormularios(fraNominas.IdFormulario);
          HabilitarSimulacion;
        end;
      try
        TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.GotoBookmark(bc);
        TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.FreeBookmark(bc);
      except
      end;
      finally
        Free;
      end;
    end;
end;

procedure TfrmABMNotas.btnCancelClick(Sender: TObject);
begin
  if (ModoABM <> maVer) then
    Rollback(true);
  ModalResult := mrCancel;
end;

procedure TfrmABMNotas.RefrescarConsulta(aIdNota: integer; aConsulta: TSDQuery; aSolapa: TTabSheet);
begin
  aConsulta.Close;
  aConsulta.ParamByName('idNota').Value := aIdNota;
  if ModoABM = maSimular then
  begin
    aConsulta.Filtered := true;
    aConsulta.OnFilterRecord := sdqConsultaFilterRecord;
  end
  else begin
    aConsulta.Filtered := false;
    aConsulta.OnFilterRecord := nil;
  end;
  aConsulta.Open;

  if aConsulta.Fields.FindField('NP_TOTALMASASALARIAL') is TFloatField then
    TFloatField(aConsulta.FieldByName( 'NP_TOTALMASASALARIAL')).Currency := True;

  if aConsulta.Fields.FindField('AM_MASAADICIONAL') is TFloatField then
    TFloatField(aConsulta.FieldByName( 'AM_MASAADICIONAL')).Currency := True;

  aSolapa.TabVisible := not aConsulta.IsEmpty;
  if aSolapa.TabVisible then
    pcFormularios.ActivePage := aSolapa;
end;

procedure TfrmABMNotas.btnBorradorClick(Sender: TObject);
begin
  if Validar then
  begin
    GuardarNotaBorrador;
    ModalResult := mrOk;
  end;
end;

function TfrmABMNotas.Validar: boolean;
begin
  Verificar(not fraSolicitanteNota.IsSelected, fraSolicitanteNota, 'Debe ingresar un solicitante.');
  Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe ingresar una empresa.');
  Verificar(edFechaRecepcionEmision.Date = 0, edFechaRecepcionEmision, 'Debe ingresar la fecha de recepción al sector.');
  Verificar(edFechaRecepcionART.Date = 0, edFechaRecepcionART, 'Debe ingresar la fecha de recepción a la ART.');
  Verificar(edFechaRecepcionEmision.Date > DBDateTime, edFechaRecepcionEmision, 'La fecha de recepción al sector debe ser anterior a hoy.');
  Verificar(edFechaRecepcionART.Date > DBDateTime, edFechaRecepcionART, 'La fecha de recepción a la ART debe ser anterior a hoy.');
  Verificar(edFechaRecepcionART.Date > edFechaRecepcionEmision.Date, edFechaRecepcionART, 'La fecha de recepción a la ART debe ser anterior a la del sector.');
  Verificar(not TieneDetalle, tbComandosDetalle, 'Debe ingresar algún detalle para la nota.');
  Verificar((ModoABM = maSimular) and ExistsSinAceptacion, pcFormularios, 'Debe tomar una decisión para cada una de las declaraciones de la nota.');
  Verificar(not ExistFechaPresentacion, pcFormularios, 'Debe ingresar una fecha de Presentación');

  result := true;
end;

procedure TfrmABMNotas.FormDestroy(Sender: TObject);
begin
  if (ModoABM <> maVer) then Rollback(true);
(*
  sdqForm931.Close;
  sdqForm165_170.Close;
  sdqFormMixta931_170.Close;
  sdqForm900_926.Close;
  sdqForm905.Close;
  sdqForm929_569_593.Close;
  sdqFormNota.Close;
  sdqForm924_902.Close;
  sdqFRMonoTrib_NoSuss_NoSussCopia.Close;
  sdqForm921.Close;
  sdqFormTicketPresentacion.Close;
  sdqFormRCompl924_902.Close;
*)  
end;

procedure TfrmABMNotas.GuardarNotaBorrador(aAplica: boolean);
var
  Sql: String;
  EstadoBorrador: String;
  bParar: boolean;
begin
  try

    EstadoBorrador := '';

    if (ValorSql(' SELECT COUNT(*) ' +
                 ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                 ' WHERE NP_OBSERVACION IS NOT NULL AND NP_IDNOTA = ' + SqlValue(FIdNota)) > 0) then
    begin
      if (not aAplica) and (fpEnviarA.ShowModal = mrOk) then EstadoBorrador := 'V'
      else EstadoBorrador := 'C';
    end;

    Sql := ' UPDATE EMI.INO_NOTA ' +
           ' SET NO_TIPOSOLICITANTE = :idtiposolicitante, ' +
           ' NO_SOLICITANTE = :idsolicitante, ' +
           ' NO_CONTRATO = :contrato, ' +
           ' NO_FECHARECEPCION = :fecharecepemi, ' +
           ' NO_FECHARECEPCIONART = :fecharecepart, ' +
           ' NO_ESTADOCORRECCION = ' + SqlString(EstadoBorrador, true, true);

    if (ModoABM = maModificacion) then
    begin
      Sql := Sql + ', NO_FECHAMODIF = SYSDATE, ' +
                   ' NO_USUMODIF = ' + SqlValue(Sesion.LoginName);
    end;

    Sql := Sql + ' WHERE NO_ID = :idNota ';

    EjecutarSqlSTEx(Sql, [rgpTipoSolicitante.ItemIndex,
                          fraSolicitanteNota.Value,
                          fraEmpresa.Contrato,
                          TDateTimeEx.Create(edFechaRecepcionEmision.Date),
                          TDateTimeEx.Create(edFechaRecepcionART.Date),
                          FIdNota]);
//    CommitTrans(true);

    if (ModoABM = maAlta) then
    begin
      bParar := false;
      repeat
        try
          //Generar numero de secuencia
          spGetBiblioratoSecuencia.ParamByName('AIDNOTA').Value := FIdNota;
          spGetBiblioratoSecuencia.ExecProc;
          bParar := true;
          edBiblioratoNota.Value := spGetBiblioratoSecuencia.ParamByName('ABIBLIORATO').AsInteger;
          edSecuenciaNota.Value := spGetBiblioratoSecuencia.ParamByName('ASECUENCIA').AsInteger;
          MsgBox('Número de Bibliorato: ' + edBiblioratoNota.Text + #13#10 + #13#10 +
                 'Número de Secuencia : ' + edSecuenciaNota.Text , MB_ICONINFORMATION, self.Caption);
        except
          on E: Exception do
            bParar := (Pos( 'ORA-00001', E.Message ) = 0);
        end;
        ModoABM := maModificacion;
      until bParar;

    end;

    CommitTrans(true);
  except
    on E: Exception do begin
      Rollback(true);
      MsgBox('Error al guardar la nota. ' + #13#10 + E.Message, MB_ICONERROR, self.Caption)
    end;
  end;
end;

function TfrmABMNotas.TieneDetalle: boolean;
begin
  result :=
  not ( sdqForm931.IsEmpty and
        sdqForm165_170.IsEmpty and
        sdqFormMixta931_170.IsEmpty and
        sdqForm900_926.IsEmpty and
        sdqForm905.IsEmpty and
        sdqForm929_569_593.IsEmpty and
        sdqFormNota.IsEmpty and
        sdqForm924_902.IsEmpty and
        sdqFRMonoTrib_NoSuss_NoSussCopia.IsEmpty and
        sdqForm921.IsEmpty and
        sdqFormTicketPresentacion.IsEmpty and
        sdqFormRCompl924_902.IsEmpty and
        sdqFormConstMonotributista.IsEmpty and
        sdqAnexoIIExcep.IsEmpty and
        sdqFormPagos.IsEmpty and
        sdqFormConstInscrEmpl.IsEmpty and
        sdqFormDocColegios.IsEmpty and
        sdqGestionado.IsEmpty and
        sdqAdicionarResumen.IsEmpty and
        sdqAdicionarDetalle.IsEmpty and
        sdqFormWeb.IsEmpty and
        sdqFormSitFacturacion.IsEmpty
      );
end;

procedure TfrmABMNotas.RefrescarFormularios(aIdFormulario: integer);
begin
  case aIdFormulario of
    TF_931: RefrescarConsulta(FIdNota, sdqForm931, tbForm931);
    TF_165, TF_170: RefrescarConsulta(FIdNota, sdqForm165_170, tbForm165_170);
    TF_900, TF_926: RefrescarConsulta(FIdNota, sdqForm900_926, tbForm900_926);
    TF_905: RefrescarConsulta(FIdNota, sdqForm905, tbForm905);
    TF_929,TF_569,TF_593: RefrescarConsulta(FIdNota, sdqForm929_569_593, tbForm929_569_593);
    TF_Nota: RefrescarConsulta(FIdNota, sdqFormNota, tbFormNota);
    TF_924, TF_902: RefrescarConsulta(FIdNota, sdqForm924_902, tbForm924_902);
    TF_RPMonotributistasSolamente,
    TF_RPNoSussOriginal,
    TF_RPNoSussOriginalCopia: RefrescarConsulta(FIdNota, sdqFRMonoTrib_NoSuss_NoSussCopia, tbFormResMonoTrib_NoSuss_NoSussCopia);
    TF_921: RefrescarConsulta(FIdNota, sdqForm921, tbForm921);
    TF_InfMixta931_170: RefrescarConsulta(FIdNota, sdqFormMixta931_170, tbFormMixta931_170);
    TF_TicketPresentacion: RefrescarConsulta(FIdNota, sdqFormTicketPresentacion, tbFormTicketPresentacion);
    TF_ResumComplement924_902: RefrescarConsulta(FIdNota, sdqFormRCompl924_902, tbFormRCompl924_902);
    TF_ConstanciaMonotributista: RefrescarConsulta(FIdNota, sdqFormConstMonotributista, tbFormConstMono);
    TF_AnexoIIExcepciones: RefrescarConsulta(FIdNota, sdqAnexoIIExcep, tbFormAnexoIIExcep);
    TF_Pagos: RefrescarConsulta(FIdNota, sdqFormPagos, tbPagos);
    TF_ConstInscripEmpleador: RefrescarConsulta(FIdNota, sdqFormConstInscrEmpl, tbFormConstIncrEmpl);
    TF_DocumentacionEscuelas: RefrescarConsulta(FIdNota, sdqFormDocColegios, tbFormDocColegios);
    TF_AdicionarResumen: RefrescarConsulta(FIdNota, sdqAdicionarResumen, tbAdicionarResumen);
    TF_AdicionarDetalle: RefrescarConsulta(FIdNota, sdqAdicionarDetalle, tbAdicionarDetalle);
    TF_FormWebDetalleRNS: RefrescarConsulta(FIdNota, sdqFormWeb, tbFormWeb);
    TF_FormSitFacturacion: RefrescarConsulta(FIdNota, sdqFormSitFacturacion, tbFormSituacionFacturacion);
    TF_TODOS:
      begin
        RefrescarConsulta(FIdNota, sdqForm931, tbForm931);
        RefrescarConsulta(FIdNota, sdqForm165_170, tbForm165_170);
        RefrescarConsulta(FIdNota, sdqForm900_926, tbForm900_926);
        RefrescarConsulta(FIdNota, sdqForm905, tbForm905);
        RefrescarConsulta(FIdNota, sdqForm929_569_593, tbForm929_569_593);
        RefrescarConsulta(FIdNota, sdqFormNota, tbFormNota);
        RefrescarConsulta(FIdNota, sdqForm924_902, tbForm924_902);
        RefrescarConsulta(FIdNota, sdqFRMonoTrib_NoSuss_NoSussCopia, tbFormResMonoTrib_NoSuss_NoSussCopia);
        RefrescarConsulta(FIdNota, sdqForm921, tbForm921);
        RefrescarConsulta(FIdNota, sdqFormMixta931_170, tbFormMixta931_170);
        RefrescarConsulta(FIdNota, sdqFormTicketPresentacion, tbFormTicketPresentacion);
        RefrescarConsulta(FIdNota, sdqFormRCompl924_902, tbFormRCompl924_902);
        RefrescarConsulta(FIdNota, sdqFormConstMonotributista, tbFormConstMono);
        RefrescarConsulta(FIdNota, sdqAnexoIIExcep, tbFormAnexoIIExcep);
        RefrescarConsulta(FIdNota, sdqFormPagos, tbPagos);
        RefrescarConsulta(FIdNota, sdqFormConstInscrEmpl, tbFormConstIncrEmpl);
        RefrescarConsulta(FIdNota, sdqFormDocColegios, tbFormDocColegios);
        RefrescarConsulta(FIdNota, sdqGestionado, tbGestionado);
        RefrescarConsulta(FIdNota, sdqAdicionarResumen, tbAdicionarResumen);
        RefrescarConsulta(FIdNota, sdqAdicionarDetalle, tbAdicionarDetalle);
        RefrescarConsulta(FIdNota, sdqFormWeb, tbFormWeb);
        RefrescarConsulta(FIdNota, sdqFormSitFacturacion, tbFormSituacionFacturacion);
      end;
  end;

  if (ModoABM = maSimular) then
    DoCargarSumatoriasVariacionGrilla(FIdNota);
end;

procedure TfrmABMNotas.dbgFormDblClick(Sender: TObject);
begin
  tbModifyNominaClick(Sender);
end;

(*
  if (UpperCase(Field.FieldName) = 'NP_OBSERVACION') then
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
*)

procedure TfrmABMNotas.dbgFormGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if TDBGrid(Sender).DataSource.DataSet.Active then
  begin
    if  not TDBGrid(Sender).DataSource.DataSet.FieldByName('NP_OBSERVACION').IsNull then
    begin
      Background := clSilver;
      if Highlight then AFont.Color := clBlack;
    end;

    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('np_idestadoformulario').AsInteger = ESTADO_FORMULARIO_REPETIDO) then
    begin
      Background := $00C6FFC6;
      if Highlight then AFont.Color := clBlack;
    end;

    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('np_idestadoformulario').AsInteger = ESTADO_FORMULARIO_NO_PROCESADO) then
    begin
      Background := $00C4C4FF;
      if Highlight then AFont.Color := clBlack;
    end;

    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('np_idestadoformulario').AsInteger = ESTADO_FORMULARIO_PROCESADO) then
    begin
      Background := $00E1FFFF;
      if Highlight then AFont.Color := clBlack;
    end;

    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('np_idestadoformulariosim').AsInteger = ESTADO_FORMULARIO_AUTORIZACION) or
       (TDBGrid(Sender).DataSource.DataSet.FieldByName('np_idestadoformulario').AsInteger = ESTADO_FORMULARIO_AUTORIZACION) then
    begin
      if Highlight then AFont.Color := $00FFD7D7
      else AFont.Color := clNavy;
    end;

    if  not TDBGrid(Sender).DataSource.DataSet.FieldByName('NP_FECHABAJA').IsNull then
    begin
      AFont.Color := clRed;
//      if Highlight then AFont.Color := clBlack;
    end;

   if Field.FieldName = 'CHECK_ESTADO' then
  begin
    Background := clWhite;
    if Field.AsString = vSI then
      AFont.Color := $0000E100
    else if Field.AsString = vNO then
      AFont.Color := clRed
    else
      AFont.Color := clBlack;
  end;

  end;
end;

procedure TfrmABMNotas.sdqFormAfterScroll(DataSet: TDataSet);
var
  Q: TSDQuery;
  empleados, periodos: integer;
  masa, montoactual, montofuturo: real;
  periodopresentacion, codrect: String;
begin
  if (DataSet.FieldByName('np_idestadoformulario').AsInteger = ESTADO_FORMULARIO_PENDIENTE) then
  begin
    lblEstadoPrevisto.Visible := true;
    edEstado.Width := edObservacion.Width - (tbMasObservaciones.Width + lblEstadoPrevisto.Width + 10 );
    edEstado.Text := DataSet.FieldbyName('EstadoSim').AsString;
    if (edEstado.Text <> '') and (DataSet.FieldbyName('Obs').AsString <> '') and
       (DataSet.FieldbyName('np_idestadoformulariosim').AsInteger <> ESTADO_FORMULARIO_FUERA_COBERTURA) then
    begin
      edEstado.Text := edEstado.Text +  ' - ' + DataSet.FieldbyName('Obs').AsString;
      tbMasObservaciones.Enabled := true;
    end
    else tbMasObservaciones.Enabled := (DataSet.FieldByName('np_idestadoformulariosim').AsInteger = ESTADO_FORMULARIO_EXISTE_DDJJ); //tbMasObservaciones.Enabled := false;
  end
  else begin
    lblEstadoPrevisto.Visible := false;
    edEstado.Width := edObservacion.Width - (tbMasObservaciones.Width + 10);
    edEstado.Text := DataSet.FieldbyName('Estado').AsString;
    if (edEstado.Text <> '') and (DataSet.FieldbyName('Obs').AsString <> '') and
       (DataSet.FieldbyName('np_idestadoformulariosim').AsInteger <> ESTADO_FORMULARIO_FUERA_COBERTURA) then
    begin
      edEstado.Text := edEstado.Text +  ' - ' + DataSet.FieldbyName('Obs').AsString;
      tbMasObservaciones.Enabled := true;
    end
    else tbMasObservaciones.Enabled := (DataSet.FieldByName('np_idestadoformulario').AsInteger = ESTADO_FORMULARIO_EXISTE_DDJJ); //tbMasObservaciones.Enabled := false;
  end;

//  if (DataSet.FieldByName('np_idtipoformulario').AsInteger = TF_DocumentacionGestion) then
  if (DataSet.FieldByName('NP_TEXTOOBSNOTA').AsString <> '') then
  begin
    edObservacion.Lines.Text := DataSet.FieldbyName('NP_TEXTOOBSNOTA').AsString;
    lblObservacionVerif.Caption := 'Texto Obs:';
  end
  else begin
    lblObservacionVerif.Caption := 'A Verificar:';
    edObservacion.Lines.Text := DataSet.FieldbyName('NP_OBSERVACION').AsString;
  end;

  if (ModoABM = maSimular) then
  begin
    edDevActual.Value := SumarCodigosReversionCuota(fraEmpresa.Contrato, DataSet.FieldbyName('np_periodo').AsString);
    Get_empleadosymasanota(DataSet.FieldbyName('np_id').AsInteger, empleados, masa, periodopresentacion);
    edDevPrevisto.Value := Get_DevengadoPrevistoSim(fraEmpresa.Contrato, DataSet.FieldbyName('np_periodo').AsString, empleados, masa);

    edDiferencia.Value := edDevPrevisto.Value - edDevActual.Value;
    if (edDiferencia.Value < 0) then
      edDiferencia.Color := clRed
    else if (edDiferencia.Value > 0) then
      edDiferencia.Color := $00EAFFD5
    else
      edDiferencia.Color := clWhite;

    edPagado.Value := get_importepagado(fraEmpresa.Contrato, DataSet.FieldbyName('np_periodo').AsString);

    edSadoAcreedorActual.Value := get_importecodmovimsimilares(fraEmpresa.Contrato, DataSet.FieldbyName('np_periodo').AsString, '799');
    edSadoAcreedorPrevisto.Value := get_ajustesaldoacreedorsim(fraEmpresa.Contrato, DataSet.FieldbyName('np_periodo').AsString, empleados, masa);
    get_impactocambionominasim(fraEmpresa.Contrato,
                               DataSet.FieldbyName('np_periodo').AsString,
                               empleados, masa, montoactual, montofuturo, periodos);
    edCantPerAfectados.Value := periodos;
    edMontoTotalAplic.Value := montofuturo;

    if (empleados <> 0) then
      edSalProm.Value := masa/empleados
    else
      edSalProm.Value := 0;

    if not Assigned(DataSet.FindField('np_codigorectificativa')) then
      codrect := '00'
    else
      codrect := DataSet.FieldbyName('np_codigorectificativa').AsString;

    edCodRectPrev.Value := get_codigorectificsim(fraEmpresa.Contrato, DataSet.FieldbyName('np_periodo').AsString, DataSet.FieldbyName('np_fechapresentacion').AsDateTime, codrect);

    edDiferenciaTotVariac.Value := montofuturo - montoactual;
    if (edDiferenciaTotVariac.Value < 0) then
      edDiferenciaTotVariac.Color := clRed
    else if (edDiferenciaTotVariac.Value > 0) then
      edDiferenciaTotVariac.Color := $00EAFFD5
    else
      edDiferenciaTotVariac.Color := clWhite;
  end;

  if (get_tipodevengado(fraEmpresa.Contrato, DataSet.FieldbyName('np_periodo').AsString) = TIPO_DEVENGADO_ESTIMADO) then
    StatusBar.Panels[0].Text := ' Período Estimado'
  else
    StatusBar.Panels[0].Text := ' Período Real';

  Q := GetQuery(' SELECT a.rc_empleados, a.rc_masasalarial, ' +
                ' afiliacion.get_suma_fija (a.rc_contrato, a.rc_periodo) sumafija, ' +
                ' afiliacion.get_porcmasa (a.rc_contrato, a.rc_periodo) sumavar ' +
                ' FROM zrc_resumencobranza a ' +
                ' WHERE a.rc_periodo = ' + SqlValue(DataSet.FieldbyName('np_periodo').AsString) +
                ' AND a.rc_contrato = ' + SqlValue(fraEmpresa.Contrato));

  try
    if not Q.IsEmpty then
    begin
      StatusBar.Panels[1].Text := Format( '  Emple.: %8.0f  /  Mas Sal.: %12.2f  /  S.Fija: %8.2f  /  Variable: %6.3f',
                                  [Q.fieldbyname('rc_empleados').AsFloat,
                                   Q.fieldbyname('rc_masasalarial').AsFloat,
                                   Q.fieldbyname('sumafija').AsFloat,
                                   Q.fieldbyname('sumavar').AsFloat]);
    end;
  finally
    Q.Free;
  end;

end;

procedure TfrmABMNotas.fraEmpresaChange(Sender: TObject);
begin
  tbComandosDetalle.Enabled := fraEmpresa.IsSelected;
  if fraEmpresa.IsSelected and (ModoABM in [maAlta, maModificacion]) then
  begin
    EjecutarSqlSTEx( ' UPDATE EMI.INO_NOTA ' +
                     ' SET NO_CONTRATO = :contrato ' +
                     ' WHERE NO_ID = :idNota ', [fraEmpresa.Contrato, FIdNota]);

    MostrarInfoBaja(fraEmpresa.Contrato);
    edBlockNota.Lines.Text := GetUltimoBlockNota(fraEmpresa.CUIT);
    if ModoABM <> maVer then
      AplicarFormulariosNota(true);
    RefrescarFormularios(TF_TODOS);
  end;
end;

procedure TfrmABMNotas.btnAplicarClick(Sender: TObject);
begin
  if Validar then
  begin
    GuardarNotaBorrador(true);
    if ValidarAplicacion then
    begin
      if (ModoABM <> maSimular) and (ExistsFormProcesable) and ((ExistsResumenPersonalOrig) or (get_contratonosuss(fraEmpresa.Contrato))) then
      begin
        PasarASimulacion;
        MsgBox('Esta nota no puede ser aplicada y pasará a simulación', MB_ICONINFORMATION);
      end
      else AplicarNota;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmABMNotas.AplicarNota;
begin
  try
    do_aplicarnota(FIdNota);
    RefrescarFormularios(TF_TODOS);
    MsgBox('La nota fue aplicada con éxito.' + #13#10, MB_ICONINFORMATION, self.Caption);
  except
    on E: Exception do begin
      MsgBox('Error al aplicar la nota. ' + #13#10 + E.Message, MB_ICONERROR, self.Caption);
      Abort;
    end;
  end;
end;

class procedure TfrmABMNotas.VerNota(aIdNota: integer);
begin
  with TfrmABMNotas.Create(nil) do
  try
    Width := 610;
    Height := 541;
    ModoABM := maVer;
    tbarSimulacion.Visible := false;
    pnlCaptions.Visible := true;
    ActivarControles(false);
    pcSimulacion.ActivePageIndex := 0;
    FIdNota:= aIdNota;
    sdqNota.ParamByName('idNota').AsInteger := aIdNota;
    sdqNota.Open;
    if not sdqNota.IsEmpty then
    begin
      rgpTipoSolicitante.ItemIndex := sdqNota.fieldbyname('NO_TIPOSOLICITANTE').AsInteger;
      fraSolicitanteNota.Value := sdqNota.fieldbyname('NO_SOLICITANTE').AsInteger;
      fraEmpresa.Contrato := sdqNota.fieldbyname('NO_CONTRATO').AsInteger;
      edFechaRecepcionEmision.Date := sdqNota.fieldbyname('NO_FECHARECEPCION').AsDateTime;
      edFechaRecepcionART.Date := sdqNota.fieldbyname('NO_FECHARECEPCIONART').AsDateTime;
      edBiblioratoNota.Value := sdqNota.fieldbyname('NO_BIBLIORATO').AsInteger;
      edSecuenciaNota.Value := sdqNota.fieldbyname('NO_SECUENCIA').AsInteger;
      RefrescarFormularios(TF_TODOS);
      tbComandosDetalle.Enabled := fraEmpresa.IsSelected;
      fraEmpresaChange(nil);
      ShowModal;
    end
    else MsgBox('No se encontró la nota', MB_ICONERROR);
  finally
    free;
  end;
end;

procedure TfrmABMNotas.ActivarControles(aActive: boolean);
begin
  rgpTipoSolicitante.Enabled := aActive;
  fraSolicitanteNota.Locked := not aActive;
  fraEmpresa.Locked := not aActive;
  edFechaRecepcionEmision.Enabled := aActive;
  edFechaRecepcionART.Enabled := aActive;
  btnAplicar.Enabled := aActive;
  btnBorrador.Enabled := aActive;
  tbAddNomina.Enabled := aActive;
  tbDeleteNomina.Enabled := aActive;
  tbLimpiarNomina.Enabled := aActive;
  btnASimulacion.Enabled := aActive;
  btnAgendar.Enabled := aActive;
  if not aActive then
    btnCancel.Caption := '&Cerrar';
end;

procedure TfrmABMNotas.AplicarFormulariosNota(aSimula: boolean);
begin
  EjecutarStoreST( 'emi.notas.do_aplicarformulariosnota(' + SqlValue(FIdNota) + ', ' +
                                                            SqlValue(fraEmpresa.Contrato) + ', ' +
                                                            SqlValue(aSimula) + ');');
end;

procedure TfrmABMNotas.tbDeleteNominaClick(Sender: TObject);
begin
  with TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet do
    if Active and not IsEmpty and tbComandosDetalle.Enabled then
    begin
//      EjecutarSqlST('delete from emi.inp_notacontratoperiodo where np_id = ' + SqlValue(FieldByName('NP_ID').AsInteger));
      EjecutarSqlST(  ' update emi.inp_notacontratoperiodo set np_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                      ' np_fechabaja = sysdate, ' +
                      ' np_idestadoformulario = null, ' +
                      ' np_idestadoformulariosim = null ' +
                      ' where np_id = ' + SqlValue(FieldByName('NP_ID').AsInteger));
      RefrescarFormularios(FieldByName('NP_IDTIPOFORMULARIO').AsInteger);
      btnASimulacion.Enabled := (ExistsFormProcesable) and ((ExistsFormSimulable) or (get_contratonosuss(fraEmpresa.Contrato)));
    end;
end;

procedure TfrmABMNotas.tbAddMasObservacionesClick(Sender: TObject);
begin
  with TfrmObservacionesNota.Create(nil) do
  try
    NotaAplicada := (TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.FieldByName('np_idestadoformulario').AsInteger <> ESTADO_FORMULARIO_PENDIENTE);
    IdNotaContratoPeriodo := TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.FieldByName('NP_ID').AsInteger;
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmABMNotas.pcFormulariosChange(Sender: TObject);
begin
  if  Assigned(pcFormularios.ActivePage) and TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.Active then
  begin
    sdqFormAfterScroll(TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet);

    if ((ModoABM = maSimular) and (not TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.IsEmpty)) or
       ((ModoABM = maVer) and (ExistsConAceptacion))
    then
      with TDBGrid(pcFormularios.ActivePage.Controls[0]).Columns.Add do
      begin
        FieldName := 'CHECK_ESTADO';
        Font.Name := 'Wingdings';
        Font.Size := 14;
        Title.Caption := ' ¿? ';
        Alignment := taCenter;
        Width := 24;
        Index := 0;
      end;
      if (ModoABM = maVer) then
      begin
        TDBGrid(pcFormularios.ActivePage.Controls[0]).OnCellClick := nil;
        TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.Refresh;
      end;
  end;
end;

procedure TfrmABMNotas.AppEventsIdle(Sender: TObject; var Done: Boolean);
begin
  if (ModoABM = maModificacion) and (IdleTimer.Tag < 1) then
    IdleTimer.Enabled := true;
end;

procedure TfrmABMNotas.IdleTimerTimer(Sender: TObject);
begin
  IdleTimer.Enabled := false;
  IdleTimer.Tag := 1;
  Rollback(true);
  MessageDlg('La nota se cerrará ya que hace 2 (dos) minutos que la aplicación está inactiva...', mtWarning, [mbOk], 0);
  ModalResult := mrOk;
end;

procedure TfrmABMNotas.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  IdleTimer.Enabled := false;
end;

procedure TfrmABMNotas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IdleTimer.Enabled := false;
end;

procedure TfrmABMNotas.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  IdleTimer.Enabled := false;
end;

class procedure TfrmABMNotas.SimularNota(aIdNota: integer);
begin
  with TfrmABMNotas.Create(nil) do
  try
    WindowState := wsMaximized;
    Caption := 'Simulación de Nota';
    btnASimulacion.Enabled := false;
    Width := 692;
    Height := 541;
    tbarSimulacion.Visible := true;
    pnlCaptions.Visible := false;
    BeginTrans(true);
    ModoABM := maSimular;
    pcSimulacion.ActivePageIndex := 1;
    ActivarControles(false);
    btnAplicar.Enabled := True;
    btnAgendar.Enabled := True;
    FIdNota:= aIdNota;
    sdqNota.ParamByName('idNota').AsInteger := aIdNota;
    sdqNota.Open;
    if not sdqNota.IsEmpty then
    begin
      rgpTipoSolicitante.ItemIndex := sdqNota.fieldbyname('NO_TIPOSOLICITANTE').AsInteger;
      fraSolicitanteNota.Value := sdqNota.fieldbyname('NO_SOLICITANTE').AsInteger;
      fraEmpresa.Contrato := sdqNota.fieldbyname('NO_CONTRATO').AsInteger;
      edFechaRecepcionEmision.Date := sdqNota.fieldbyname('NO_FECHARECEPCION').AsDateTime;
      edFechaRecepcionART.Date := sdqNota.fieldbyname('NO_FECHARECEPCIONART').AsDateTime;
      edBiblioratoNota.Value := sdqNota.fieldbyname('NO_BIBLIORATO').AsInteger;
      edSecuenciaNota.Value := sdqNota.fieldbyname('NO_SECUENCIA').AsInteger;
      RefrescarFormularios(TF_TODOS);
      tbComandosDetalle.Enabled := fraEmpresa.IsSelected;
      fraEmpresaChange(nil);
      if not Assigned(pcFormularios.ActivePage) then
      begin
         MsgBox('Las notas han cambiado su estado y ya no son procesables por lo que serán aplicadas directamente.', MB_ICONINFORMATION);
         AplicarNota;
      end
      else
        ShowModal;
    end
    else MsgBox('No se encontró la nota', MB_ICONERROR);
  finally
    free;
  end;
end;

procedure TfrmABMNotas.FormShow(Sender: TObject);
begin
  pcFormulariosChange(nil);
end;

procedure TfrmABMNotas.CamposCalculados(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if Active and (RecordCount > 0) and Assigned(FindField('CHECK_ESTADO')) then
//    if Active and not IsEmpty then
    begin
      if DataSet.FieldByName('NP_ACEPTACION').IsNull then
        DataSet.FieldByName('CHECK_ESTADO').AsString := ''
      else
        if DataSet.FieldByName('NP_ACEPTACION').AsString = 'A' then
          DataSet.FieldByName('CHECK_ESTADO').AsString := vSI
        else
          if DataSet.FieldByName('NP_ACEPTACION').AsString = 'R' then
            DataSet.FindField('CHECK_ESTADO').AsString := vNO;
    end;
  end;
end;

procedure TfrmABMNotas.dbgFormCellClick(Column: TColumn);
//var
//  AceptacionCalc: String;
begin
(*
  if (Column.FieldName = 'CHECK_ESTADO') then
  begin
    with TDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet do
    begin
      if FieldByName('NP_ACEPTACION').AsString = '' then
        AceptacionCalc := 'A'
      else
      begin
        if FieldByName('NP_ACEPTACION').AsString = 'A' then
          AceptacionCalc := 'R'
        else
          AceptacionCalc := '';
      end;

      EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                    'SET NP_ACEPTACION = ' + SqlValue(AceptacionCalc) +
                    'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger)
                   );

      Refresh;
    end;
  end;
*)  
end;

procedure TfrmABMNotas.btnASimulacionClick(Sender: TObject);
begin
  if Validar then
  begin
    GuardarNotaBorrador;
    if ValidarAplicacion then
    begin
      PasarASimulacion;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmABMNotas.PasarASimulacion;
var
  Sql: String;
  nivelautorizacion: integer;
begin
  if ValidarSimulacion then
  begin
    BeginTrans(true);
    try

      nivelautorizacion := get_nivelautrequeridonotasim(FIdNota, 'S');

      Sql := ' UPDATE EMI.INO_NOTA ' +
             ' SET NO_IDESTADONOTA =  ' + SqlValue(ESTADO_NOTA_PEND_SIMULACION);

      Sql := Sql + ', NO_FECHAASIMULACION = SYSDATE, ' +
                   '  NO_USUARIOASIMULACION = ' + SqlValue(Sesion.LoginName) + ', ' +
                   '  NO_IDNIVELAUTORIZACIONSIM = ' + SqlValue(nivelautorizacion);

      Sql := Sql + ' WHERE NO_ID = :idNota ';

      EjecutarSqlSTEx(Sql, [FIdNota]);
      CommitTrans(true);
    except
      on E: Exception do begin
        Rollback(true);
        MsgBox('Error al pasar la nota a simulación. ' + #13#10 + E.Message, MB_ICONERROR, self.Caption);
        Abort;
      end;
    end;
  end;
end;

function TfrmABMNotas.ExistsSinAceptacion: boolean;
begin
  result := ExisteSql(' SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_FECHABAJA IS NULL AND NP_ACEPTACION IS NULL ' +
                      ' AND NP_IDESTADOFORMULARIOSIM = ' + SqlValue(ESTADO_FORMULARIO_PROCESADO) + 
                      ' AND NP_IDNOTA = ' + SqlValue(FIdNota));
end;

function TfrmABMNotas.ExistsConAceptacion: boolean;
begin
  result := ExisteSql(' SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_FECHABAJA IS NULL AND NP_ACEPTACION IS NOT NULL ' +
                      ' AND NP_IDNOTA = ' + SqlValue(FIdNota));
end;


function TfrmABMNotas.ExistsResumenPersonalOrig: boolean;
begin
  result := ExisteSql(' SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_FECHABAJA IS NULL AND NP_IDTIPOFORMULARIO IN (' + SqlValue(TF_RPNoSussOriginal) + ', ' + SqlValue(TF_AdicionarDetalle) + ') ' +
                      ' AND NP_IDNOTA = ' + SqlValue(FIdNota));
end;

function TfrmABMNotas.ExistsFormSimulable: boolean;
begin
  result := ExisteSql(' SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_FECHABAJA IS NULL AND NP_IDTIPOFORMULARIO IN (' + SqlValue(TF_RPNoSussOriginal) + ', '
                                                                                 + SqlValue(TF_ResumComplement924_902) + ', '
                                                                                 + SqlValue(TF_RPMonotributistasSolamente) + ', '
                                                                                 + SqlValue(TF_AdicionarResumen) + ', '
                                                                                 + SqlValue(TF_AdicionarDetalle) + ')');
end;




function TfrmABMNotas.ExistsFormProcesable: boolean;
begin
  result := ExisteSql(' SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_FECHABAJA IS NULL AND NP_IDTIPOFORMULARIO in (' + SqlValue(TF_RPNoSussOriginal) + ', ' + SqlValue(TF_AdicionarDetalle) + ') ' +
                      ' AND NP_IDNOTA = ' + SqlValue(FIdNota) +
                      ' AND NP_IDESTADOFORMULARIOSIM = ' + SqlValue(ESTADO_FORMULARIO_PROCESADO));
end;

procedure TfrmABMNotas.btnAprobarClick(Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
begin
  with TRxDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet do
  begin
    if (not Active) or IsEmpty then Exit;

    if (TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelCount > 0) then
    begin
      DisableControls;
      try
        ABookmark := GetBookmark;
        for i:=0 to TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelCount-1 do
        begin
          TRxDBGrid(pcFormularios.ActivePage.Controls[0]).GotoSelection(i);
          do_eliminarobsformnotatmp(FieldByName('NP_ID').AsInteger, false);
          EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                        'SET NP_ACEPTACION = ' + SqlValue('A') +
                        'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger)
                       );
        end;
        try
          GotoBookmark(ABookmark);
        except
        end;
          FreeBookmark(ABookmark);
      finally
        EnableControls;
      end;
    end
    else begin
      do_eliminarobsformnotatmp(FieldByName('NP_ID').AsInteger, false);
      EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                    'SET NP_ACEPTACION = ' + SqlValue('A') +
                    'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger)
                   );
    end;

    TRxDBGrid(pcFormularios.ActivePage.Controls[0]).UnselectAll;
    Refresh;
    DoCargarSumatoriasVariacionGrilla(FIdNota);
(*
    TDBGrid(pcFormularios.ActivePage.Controls[0]).UnselectAll;
    TDBGrid(pcFormularios.ActivePage.Controls[0]).Refresh;
    cdsConsultaAfterScroll(dbgPeriodos.DataSource.DataSet);
*)
  end;
end;

procedure TfrmABMNotas.btnRechazarClick(Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
  nobservaciongestion: integer;
begin
  if (not TRxDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.Active) or TRxDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet.IsEmpty then Exit;

  with TfrmObservacion.Create(self) do
  try
    TablaObservacion := 'EMI.IMS_MOTIVOSIMULACION';
    FieldId := 'MS_ID';
    FieldCodigo := 'MS_ID';
    FieldDescripcion := 'MS_DESCRIPCION';
    FieldFechaBaja := 'MS_FECHABAJA';
    ShowBajas := true;
    if (ShowModal = mrOk) then
    begin
      with TRxDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet do
      begin
        if (TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelCount > 0) then
        begin
          DisableControls;
          try
            ABookmark := GetBookmark;
            for i:=0 to TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelCount-1 do
            begin
              TRxDBGrid(pcFormularios.ActivePage.Controls[0]).GotoSelection(i);
              EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                            'SET NP_ACEPTACION = ' + SqlValue('R') +
                            'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger)
                           );

              if ObsTString.Count <> 0 then
                SaveBlob('SELECT NP_TEXTOOBSNOTA ' +
                         'FROM EMI.INP_NOTACONTRATOPERIODO ' +
                         'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger),
                         'UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                         'SET NP_TEXTOOBSNOTA = :NP_TEXTOOBSNOTA ' +
                         'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger),
                         'NP_TEXTOOBSNOTA',
                         ObsTString);

              nobservaciongestion := get_observaciongestion(IdObservacion);
              if (nobservaciongestion <> -1) then
                do_seteobsformnota(FieldByName('NP_ID').AsInteger, nobservaciongestion, false);
            end;
            try
              GotoBookmark(ABookmark);
            except
            end;
              FreeBookmark(ABookmark);
          finally
            EnableControls;
          end;
        end
        else begin
          EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                        'SET NP_ACEPTACION = ' + SqlValue('R') +
                        'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger)
                       );
          nobservaciongestion := get_observaciongestion(IdObservacion);
          if (nobservaciongestion <> -1) then
            do_seteobsformnota(FieldByName('NP_ID').AsInteger, nobservaciongestion, false);
        end;

        TRxDBGrid(pcFormularios.ActivePage.Controls[0]).UnselectAll;
        Refresh;
        DoCargarSumatoriasVariacionGrilla(FIdNota);
    (*
        TDBGrid(pcFormularios.ActivePage.Controls[0]).UnselectAll;
        TDBGrid(pcFormularios.ActivePage.Controls[0]).Refresh;
        cdsConsultaAfterScroll(dbgPeriodos.DataSource.DataSet);
    *)
      end;
    end;
  finally
    free;
  end;
end;

procedure TfrmABMNotas.mnuSeleccionarTodoClick(Sender: TObject);
begin
  TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelectAll;
end;

procedure TfrmABMNotas.mnuSeleccionarRestoClick(Sender: TObject);
var
  ABookmark: TBookmark;
begin
  with TRxDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource do
    if Dataset.Active then
    begin
      with Dataset do begin
        if (Dataset.BOF and Dataset.EOF) then Exit;
        Dataset.DisableControls;
        try
          ABookmark := Dataset.GetBookmark;
          try
            Dataset.First;
            while not Dataset.EOF do
            begin
//              if DataSet.FieldByName('CHECK_ESTADO').IsNull then
              if DataSet.FieldByName('NP_ACEPTACION').IsNull then
                TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelectedRows.CurrentRowSelected := True;
              Next;
            end;
          finally
            try
              Dataset.GotoBookmark(ABookmark);
            except
            end;
            Dataset.FreeBookmark(ABookmark);
          end;
        finally
          Dataset.EnableControls;
        end;
      end;
    end;
end;

procedure TfrmABMNotas.btnEliminarMarcaClick(Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
begin
  with TRxDBGrid(pcFormularios.ActivePage.Controls[0]).DataSource.DataSet do
  begin
    if (not Active) or IsEmpty then Exit;

    if (TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelCount > 0) then
    begin
      DisableControls;
      try
        ABookmark := GetBookmark;
        for i:=0 to TRxDBGrid(pcFormularios.ActivePage.Controls[0]).SelCount-1 do
        begin
          TRxDBGrid(pcFormularios.ActivePage.Controls[0]).GotoSelection(i);
          EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                        'SET NP_ACEPTACION = NULL ' +
                        'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger)
                       );
        end;
        try
          GotoBookmark(ABookmark);
        except
        end;
          FreeBookmark(ABookmark);
      finally
        EnableControls;
      end;
    end
    else begin
      EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                    'SET NP_ACEPTACION = NULL ' +
                    'WHERE NP_ID = ' + SqlValue(FieldByName('NP_ID').AsInteger)
                   );
    end;

    TRxDBGrid(pcFormularios.ActivePage.Controls[0]).UnselectAll;
    Refresh;
    DoCargarSumatoriasVariacionGrilla(FIdNota);
  end;
end;

function TfrmABMNotas.get_observaciongestion(aidObservacion: integer): integer;
begin
  result := ValorSqlInteger(' SELECT ob_id ' +
                            ' FROM emi.ims_motivosimulacion, emi.iob_observacion ' +
                            ' WHERE ms_idobservacion = ob_id ' +
                            '  AND ms_id = ' + SqlValue(aidObservacion), -1);
end;

procedure TfrmABMNotas.DoCargarSumatoriasVariacionGrilla(aIdNota: integer);
var
  sSql: String;
  DiferenciaTotVariac, SumaVariacionAprob, SumaVariacion: currency;
  montoactual, montofuturo: real;
  periodos: integer;
begin
  SumaVariacion      := 0;
  SumaVariacionAprob := 0;

  sSql := 'SELECT NO_CONTRATO, NP_PERIODO, NP_TOTALEMPLEADOS EMPLEADOS, NP_ACEPTACION, ' +
                 'EMI.UTILES.GET_SALARIODESESTACIONALIZADO(NP_PERIODO, NP_PERIODO, NP_TOTALMASASALARIAL, NO_CONTRATO) MASA ' +
            'FROM EMI.INO_NOTA, EMI.INP_NOTACONTRATOPERIODO ' +
           'WHERE NO_ID = NP_IDNOTA ' +
             'AND NO_ID = :IdNota';

  with GetQueryEx( sSql, [aIdNota] ) do
    try
      while not eof do
        begin
          get_impactocambionominasim(FieldByName( 'NO_CONTRATO' ).AsInteger,
                                     FieldbyName( 'NP_PERIODO' ).AsString,
                                     FieldByName( 'EMPLEADOS' ).AsInteger,
                                     FieldByName( 'MASA' ).AsCurrency,
                                     montoactual, montofuturo, periodos);

          DiferenciaTotVariac := montofuturo - montoactual;
          SumaVariacion       := SumaVariacion + DiferenciaTotVariac;
          if FieldbyName( 'NP_ACEPTACION' ).AsString = 'A' then
            SumaVariacionAprob := SumaVariacionAprob + DiferenciaTotVariac;

          Next;
        end;    
    finally
      free;
    end;

  edSumaVariacion.Value      := SumaVariacion;
  edSumaVariacionAprob.Value := SumaVariacionAprob;
end;

function TfrmABMNotas.ValidarAplicacion: boolean;
begin
  Verificar(ExisteSql(' SELECT 1 ' +
                       ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                       ' WHERE NP_FECHABAJA IS NULL ' +
                       ' AND NP_IDNOTA = ' + SqlValue(FIdNota) +
                       ' AND NP_PERIODO > emi.utiles.get_maximoperiododev '), pcFormularios, 'Existen DDJJs cuyo período es posterior al máximo período devengable.');
  result := true;
end;

procedure TfrmABMNotas.sdqConsultaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('NP_FECHABAJA').IsNull) and (DataSet.FieldByName('np_idestadoformulariosim').AsInteger = ESTADO_FORMULARIO_PROCESADO) ;
end;

procedure TfrmABMNotas.HabilitarSimulacion;
begin
  btnASimulacion.Enabled := FAccesoaSimular and (ModoABM <> maAlta) and (ExistsFormProcesable) and ((ExistsFormSimulable) or (get_contratonosuss(fraEmpresa.Contrato)));
end;

function TfrmABMNotas.NoExistsDDJJActivaParaDetalle: boolean;
begin
  result := ExisteSql(' SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_FECHABAJA IS NULL AND NP_IDTIPOFORMULARIO in (' + SqlValue(TF_AdicionarDetalle) + ') ' +
                      ' AND NP_IDNOTA = ' + SqlValue(FIdNota) +
                      ' AND NP_IDESTADOFORMULARIOSIM = ' + SqlValue(ESTADO_FORMULARIO_PROCESADO)  +
                      ' AND NOT EXISTS (SELECT 1 ' +
                      '                 FROM EMI.IEV_ESTADOVERIFICADO, EMI.IDJ_DDJJ ' +
                      '                 WHERE DJ_CONTRATO = ' + SqlValue(fraEmpresa.contrato) +
                      '                 AND DJ_PERIODO = NP_PERIODO ' +
                      '                 AND DJ_ESTADO + 0 = EV_ID ' +
                      '                 AND EV_ESTADO = ''A'')');
end;

function TfrmABMNotas.ValidarSimulacion: boolean;
begin
  Verificar(NoExistsDDJJActivaParaDetalle, btnAplicar, 'No existe una DDJJ activa para el período por lo que la nota no podrá pasar a Simulación.');
  result := true;
end;

procedure TfrmABMNotas.btnAgendarClick(Sender: TObject);
begin
  if Validar then
  begin
    GuardarNotaBorrador(true);
    if ValidarAplicacion then
    begin
      AgendarNota;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmABMNotas.AgendarNota;
var
  Sql: String;
begin
  if ValidarSimulacion then
  begin
    BeginTrans(true);
    try
      Sql := ' UPDATE EMI.INO_NOTA ' +
             ' SET NO_IDESTADONOTA =  ' + SqlValue(ESTADO_NOTA_AGENDADA);
      Sql := Sql + ', NO_FECHAAGENDA = SYSDATE, ' +
                   '  NO_USUARIOAGENDA = ' + SqlValue(Sesion.LoginName);
      Sql := Sql + ' WHERE NO_ID = :idNota ';

      EjecutarSqlSTEx(Sql, [FIdNota]);
      CommitTrans(true);
    except
      on E: Exception do begin
        Rollback(true);
        MsgBox('Error al agendar la nota. ' + #13#10 + E.Message, MB_ICONERROR, self.Caption);
        Abort;
      end;
    end;
  end;
end;

function TfrmABMNotas.ExistFechaPresentacion: boolean;
begin
  result := true;
  if tbFormSituacionFacturacion.TabVisible and
      ExisteSqlEx('select 1 from emi.inp_notacontratoperiodo where np_idnota = :idnota and np_fechapresentacion is null', [FIdNota]) then
    result := false; 
end;

end.


