unit unDenunciaStandard;

interface

uses
  {$IFDEF VER180}
  rxPlacemnt, rxToolEdit,
  {$ELSE}
  Placemnt, ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSinForm, SDEngine, DB, artSeguridad, unFraCodigoDescripcion,
  unfraCtbTablas, unFraCIE10, StdCtrls, Mask, DateComboBox,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unfraCPR_PRESTADOR,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, DBCtrls, ExtCtrls,
  DateTimeEditors, PatternEdit, DBPatternEdit, unFraSDA_DETALLEARCHIVO,
  unFraSMC_MOTIVONOCARGA, unFraStaticCodDesc, unFraSTG_TIPOGRAVEDAD,
  unFraSLA_LESIONAGENTE, unFraSLF_LESIONFORMA, RXDBCtrl, IntEdit,
  unFraCDG_DIAGNOSTICO, unFraSTC_TIPOGRAVEDAD_CIE10, unFraTipoSiniestro,
  unFraSLN_LESIONNATURALEZA, unFraSLZ_LESIONZONA, unFraCodDesc, unFraCPA_PAISES,
  unFraCCI_CIUO, JvExControls, JvComponent, unFraDomicilio,
  unFraPrestadorFueraDeContrato, JvExMask, JvToolEdit, JvMaskEdit,
  JvDBControls, JvgGroupBox, XPMenu, ActnList,
  unFraCCO_PARTIDOS_CODIGOSPOSTALES, JvgCheckBox, JvExStdCtrls, JvCheckBox,
  JvExExtCtrls, JvDBRadioPanel, Grids, BaseGrid, AdvGrid, DBAdvGrid,
  AsgLinks, DBAdvNavigator, ComCtrls, ToolWin, DBGrids, ArtComboBox,
  ArtDBGrid, unFraSLM_LESIONAGENTEMATERIAL, ImgList, Buttons, FormPanel,
  RxToolEdit, JvExtComponent, RxPlacemnt;

type
  TfrmDenunciaSTD = class(TSinForm)
    sdqDatosDE_ID: TFloatField;
    sdqDatosDE_IDEXPEDIENTE: TFloatField;
    sdqDatosDE_TAREAHABITUAL: TFloatField;
    sdqDatosDE_TAREAACCIDENTE: TFloatField;
    sdqDatosDE_ANTIGUEDADPUESTO: TDateTimeField;
    sdqDatosDE_ANIOSPUESTO: TFloatField;
    sdqDatosDE_MESESPUESTO: TFloatField;
    sdqDatosDE_IDGRAVEDAD: TFloatField;
    sdqDatosDE_DESCRIPCION: TStringField;
    sdqDatosDE_DIAGNOSTICO: TStringField;
    sdqDatosDE_IDDIAGNOSTICO: TFloatField;
    sdqDatosDE_IDLESIONFORMA: TFloatField;
    sdqDatosDE_IDLESIONAGENTE: TFloatField;
    sdqDatosDE_IDLESIONNATURALEZA: TFloatField;
    sdqDatosDE_IDLESIONZONA: TFloatField;
    sdqDatosDE_HORJORNADA1DESDE: TStringField;
    sdqDatosDE_HORJORNADA1HASTA: TStringField;
    sdqDatosDE_HORJORNADA2DESDE: TStringField;
    sdqDatosDE_HORJORNADA2HASTA: TStringField;
    sdqDatosDE_IDPRESTADOR: TFloatField;
    sdqDatosDE_EPMANIFESTACION: TDateTimeField;
    sdqDatosDE_EPEXPUESTODESDE: TDateTimeField;
    sdqDatosDE_OBSERVACIONES: TStringField;
    sdqDatosDE_FECHARECEPCION: TDateTimeField;
    sdqDatosUSUARIO: TStringField;
    sdqDatosDE_FECHAALTA: TDateTimeField;
    sdqDatosDE_USUMODIF: TStringField;
    sdqDatosDE_FECHAMODIF: TDateTimeField;
    sdqDatosDE_IDMOTIVONOCARGA: TFloatField;
    sdqDatosDE_IDGRAVEDAD_CIE10: TFloatField;
    sdqDatosSE_SECTOR: TStringField;
    sdqDatosEX_FECHAALTA: TDateTimeField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosFACCREC: TDateTimeField;
    sdqDatosEX_TIPO: TStringField;
    sdqDatosEX_FECHARECEPCION: TDateTimeField;
    sdqDatosDE_TIPO: TStringField;
    sdqDatosUBICACION_DENUNCIA: TStringField;
    sdqDatosDE_UBICACION_ESTABLECIMIENTO: TFloatField;
    sdqDatosDE_UBICACION_NOMBRE: TStringField;
    sdqDatosDE_UBICACION_CALLE: TStringField;
    sdqDatosDE_UBICACION_NUMERO: TStringField;
    sdqDatosDE_UBICACION_PISO: TStringField;
    sdqDatosDE_UBICACION_DEPARTAMENTO: TStringField;
    sdqDatosDE_UBICACION_LOCALIDAD: TStringField;
    sdqDatosDE_UBICACION_CPOSTAL: TStringField;
    sdqDatosDE_UBICACION_CPOSTALA: TStringField;
    sdqDatosDE_UBICACION_PROVINCIA: TStringField;
    sdqDatosDE_UBICACION_TELEFONOS: TStringField;
    sdqDatosDE_UBICACION_PAIS: TStringField;
    sdqDatosDE_UBICACION_CODAREATELEFONOS: TStringField;
    sdqDatosDE_UBICACION_CUITOCURRE: TStringField;
    sdqDatosDE_ITINERE_DENUNCIAPOLICIAL: TStringField;
    sdqDatosDE_ITINERE_COMISARIA: TStringField;
    sdqDatosDE_ITINERE_COM_CALLE: TStringField;
    sdqDatosDE_ITINERE_COM_NUMERO: TStringField;
    sdqDatosDE_ITINERE_COM_PISO: TStringField;
    sdqDatosDE_ITINERE_COM_DEPARTAMENTO: TStringField;
    sdqDatosDE_ITINERE_COM_CPOSTAL: TStringField;
    sdqDatosDE_ITINERE_COM_CPOSTALA: TStringField;
    sdqDatosDE_ITINERE_COM_LOCALIDAD: TStringField;
    sdqDatosDE_ITINERE_COM_PROVINCIA: TStringField;
    sdqDatosDE_ITINERE_NRODENUNCIA: TStringField;
    sdqDatosDE_ITINERE_PRIMEROS_AUXILIOS: TStringField;
    sdqDatosDE_ITINERE_COM_TELEFONOS: TStringField;
    sdqDatosPROV_1: TStringField;
    sdqDatosPROV_2: TStringField;
    sdqDatosDE_ITINERE_TESTIGO1_NOMBRE: TStringField;
    sdqDatosDE_ITINERE_TESTIGO1_DOMICILIO: TStringField;
    sdqDatosDE_ITINERE_TESTIGO1_TELEFONOS: TStringField;
    sdqDatosDE_ITINERE_TESTIGO2_NOMBRE: TStringField;
    sdqDatosDE_ITINERE_TESTIGO2_DOMICILIO: TStringField;
    sdqDatosDE_ITINERE_TESTIGO2_TELEFONOS: TStringField;
    sdqDatosDE_ITINERE_TERCERO_RESP_NOMBRE: TStringField;
    sdqDatosDE_ITINERE_TERCERO_RESP_DOM: TStringField;
    sdqDatosDE_ITINERE_TERCERO_RESP_TEL: TStringField;
    sdqDatosDE_ACCIDENTETRANSITO: TStringField;
    sdqDatosDE_INTERNACION: TStringField;
    sdqDatosDE_PRESTADOR_NOMBRE: TStringField;
    sdqDatosDE_PRESTADOR_TELEFONOS: TStringField;
    sdqDatosDE_PRESTADOR_CALLE: TStringField;
    sdqDatosDE_PRESTADOR_NUMERO: TStringField;
    sdqDatosDE_PRESTADOR_PISO: TStringField;
    sdqDatosDE_PRESTADOR_DEPARTAMENTO: TStringField;
    sdqDatosDE_PRESTADOR_LOCALIDAD: TStringField;
    sdqDatosDE_PRESTADOR_CPOSTAL: TStringField;
    sdqDatosDE_PRESTADOR_CPOSTALA: TStringField;
    sdqDatosDE_PRESTADOR_PROVINCIA: TStringField;
    sdqDatosDA_OPCION: TStringField;
    sdqDatosDA_HOJAS: TFloatField;
    sdqDatosUD_SECUENCIA_PARTIDOLOCALIDAD: TFloatField;
    sdqDatosUD_NROESTABLECIMIENTOAFIP: TFloatField;
    sdqDatosDE_INICIOINASISTENCIALABORAL: TDateTimeField;
    sdqDatosEX_HORAACCIDENTE: TStringField;
    sdqDatosDE_SUBTIPO: TStringField;
    sdqEnfermedadProfesional: TSDQuery;
    dsEnfermedadProfesional: TDataSource;
    sdqEnfermedadProfesionalEP_IDEXPEDIENTE: TFloatField;
    sdqEnfermedadProfesionalEP_IDLESIONAGENTE: TFloatField;
    sdqEnfermedadProfesionalEP_DIAGNOSTICO: TStringField;
    sdqEnfermedadProfesionalEP_IDDIAGNOSTICO: TFloatField;
    sdqEnfermedadProfesionalEP_IDGRAVEDAD_CIE10: TFloatField;
    sdqEnfermedadProfesionalEP_IDLESIONAGENTEMATERIAL: TFloatField;
    sdqEnfermedadProfesionalEP_IDLESIONZONA: TFloatField;
    sdqEnfermedadProfesionalEP_TIEMPOEXPOSICION: TDateTimeField;
    sdqEnfermedadProfesionalEP_FECHADIAGNOSTICO: TDateTimeField;
    sdqEnfermedadProfesionalEP_FORMADIAGNOSTICO: TFloatField;
    sdqEnfermedadProfesionalEP_FECHAINICIOINASISTENCIALABO: TDateTimeField;
    sduEnfermedadProfesional: TSDUpdateSQL;
    sdqEnfermedadProfesionalEP_FECHABAJA: TDateTimeField;
    sdqEnfermedadProfesionalEP_USUBAJA: TStringField;
    sdqEnfermedadProfesionalTC_DESCRIPCION: TStringField;
    sdqEnfermedadProfesionalLA_DESCRIPCION: TStringField;
    sdqEnfermedadProfesionalDG_DESCRIPCION: TStringField;
    sdqEnfermedadProfesionalLM_DESCRIPCION: TStringField;
    sdqDatosDE_TAREAANTERIOR: TFloatField;
    sdqDatosDE_ANTIGUEDADPUESTOANTERIOR: TDateTimeField;
    sdqDatosDE_ANIOSPUESTOANTERIOR: TFloatField;
    sdqDatosDE_MESESPUESTOANTERIOR: TFloatField;
    sdqEnfermedadProfesionalMD_DESCRIPCION: TStringField;
    sdqEnfermedadProfesionalEP_MODODETECCION: TFloatField;
    pgSolapas: TPageControl;
    tsA: TTabSheet;
    tsAC: TTabSheet;
    tsEP: TTabSheet;
    tsDP: TTabSheet;
    sbA: TScrollBox;
    gbUbicacion: TJvgGroupBox;
    lbValidacionCUIT: TLabel;
    Label29: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    rgEstablecimiento: TDBRadioGroup;
    pnlEstablecimientoExtra: TPanel;
    Label18: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label42: TLabel;
    edDE_UBICACION_TELEFONOS: TDBEdit;
    edDE_UBICACION_CODAREATELEFONOS: TDBEdit;
    fraDE_UBICACION_PAIS: TfraCPA_PAISES;
    edDE_UBICACION_NOMBRE: TDBEdit;
    edUD_NROESTABLECIMIENTOAFIP: TDBEdit;
    fraDomicilioEstablecimiento: TfraDomicilio;
    edDE_UBICACION_CUITOCURRE: TJvDBMaskEdit;
    fraUD_SECUENCIA_PARTIDOLOCALIDAD: TfraCCO_PARTIDOS_CODIGOSPOSTALES;
    chkEmpresaContratada: TJvCheckBox;
    gbDatos1: TJvgGroupBox;
    Label23: TLabel;
    fraTipoSiniestro: TfraTipoSiniestro;
    rpDE_SUBTIPO: TJvDBRadioPanel;
    sbB: TScrollBox;
    gbAccidenteDeTrabajo: TJvgGroupBox;
    lbForma: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label20: TLabel;
    Label40: TLabel;
    Label46: TLabel;
    fraDE_IDLESIONFORMA: TfraSLF_LESIONFORMA;
    fraDE_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA;
    fraDE_IDLESIONZONA: TfraSLZ_LESIONZONA;
    edDE_DESCRIPCION: TDBMemo;
    edEX_FECHAACCIDENTE: TDBDateEdit;
    edEX_HORAACCIDENTE: TTimeEditor;
    gbAdicionalesAccidenteDeTrabajo: TJvgGroupBox;
    Label10: TLabel;
    Label7: TLabel;
    Label21: TLabel;
    fraDE_IDMOTIVONOCARGA: TfraSMC_MOTIVONOCARGA;
    fraDE_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD;
    edDE_OBSERVACIONES: TDBMemo;
    rgDE_ACCIDENTETRANSITO: TDBRadioGroup;
    gbDiagnostico: TJvgGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    fraDE_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    fraDE_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;
    edDE_DIAGNOSTICO: TDBMemo;
    chkInternado: TDBCheckBox;
    ImageListTabs: TImageList;
    sbC: TScrollBox;
    gbEnfermedadProfesional: TJvgGroupBox;
    gbDatosEnfermedadProfesional: TJvgGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    fraEP_IDLESIONAGENTE: TfraSLA_LESIONAGENTE;
    fraEP_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    edEP_DIAGNOSTICO: TDBMemo;
    fraEP_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;
    edEP_FECHADIAGNOSTICO: TDBDateEdit;
    fraEP_IDLESIONZONA: TfraSLZ_LESIONZONA;
    edEP_TIEMPOEXPOSICION: TDBDateEdit;
    fraEP_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL;
    ToolBarEnfermedadProfesional: TToolBar;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    tbSep1: TToolButton;
    tbGuardar: TToolButton;
    tbCancelar: TToolButton;
    GridEnfermedadesProfesionales: TArtDBGrid;
    sbD: TScrollBox;
    gbDenunciaPolicial: TJvgGroupBox;
    rgDenunciaPolicial: TDBRadioGroup;
    pnl: TPanel;
    Label30: TLabel;
    Label32: TLabel;
    Label41: TLabel;
    edDE_ITINERE_COM_TELEFONOS: TDBEdit;
    edDE_ITINERE_COMISARIA: TDBEdit;
    edDE_ITINERE_NRODENUNCIA: TDBEdit;
    fraDomicilioDenuncia: TfraDomicilio;
    pnlTestigo1: TPanel;
    Label27: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    edDE_ITINERE_TESTIGO1_TELEFONOS: TDBEdit;
    edDE_ITINERE_TESTIGO1_DOMICILIO: TDBEdit;
    edDE_ITINERE_TESTIGO1_NOMBRE: TDBEdit;
    pnlTestigo2: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    edDE_ITINERE_TESTIGO2_TELEFONOS: TDBEdit;
    edDE_ITINERE_TESTIGO2_DOMICILIO: TDBEdit;
    edDE_ITINERE_TESTIGO2_NOMBRE: TDBEdit;
    pnlTerceros: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edDE_ITINERE_TERCERO_RESP_TEL: TDBEdit;
    edDE_ITINERE_TERCERO_RESP_DOM: TDBEdit;
    edDE_ITINERE_TERCERO_RESP_NOMBRE: TDBEdit;
    fraDE_IDDIAGNOSTICO1: TfraCDG_DIAGNOSTICO;
    Label60: TLabel;
    fraDE_IDLESIONNATURALEZA2: TfraSLN_LESIONNATURALEZA;
    fraDE_IDLESIONZONA2: TfraSLZ_LESIONZONA;
    fraDE_IDDIAGNOSTICO2: TfraCDG_DIAGNOSTICO;
    fraDE_IDLESIONNATURALEZA3: TfraSLN_LESIONNATURALEZA;
    fraDE_IDLESIONZONA3: TfraSLZ_LESIONZONA;
    fraDE_IDDIAGNOSTICO3: TfraCDG_DIAGNOSTICO;
    sdqDatosDE_IDDIAGNOSTICO2: TFloatField;
    sdqDatosDE_IDDIAGNOSTICO3: TFloatField;
    sdqDatosDE_IDLESIONNATURALEZA2: TFloatField;
    sdqDatosDE_IDLESIONNATURALEZA3: TFloatField;
    sdqDatosDE_IDLESIONZONA2: TFloatField;
    sdqDatosDE_IDLESIONZONA3: TFloatField;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    gbLaboral: TJvgGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    edDE_ANIOSPUESTO: TDBPatternEdit;
    edDE_MESESPUESTO: TDBPatternEdit;
    edDE_ANTIGUEDADPUESTO: TDBDateEdit;
    fraDE_TAREAHABITUAL: TfraCCI_CIUO;
    fraDE_TAREAACCIDENTE: TfraCCI_CIUO;
    edDE_ANIOSPUESTOANTERIOR: TDBPatternEdit;
    edDE_MESESPUESTOANTERIOR: TDBPatternEdit;
    edDE_ANTIGUEDADPUESTOANTERIOR: TDBDateEdit;
    fraDE_TAREAANTERIOR: TfraCCI_CIUO;
    tsE: TTabSheet;
    gbPrestador: TJvgGroupBox;
    fraDE_IDPRESTADOR: TfraPrestadorFueraDeContrato;
    gbArchivo: TJvgGroupBox;
    Label19: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    edDE_FECHARECEPCION: TDBDateEdit;
    edSector: TDBEdit;
    edDE_FECHAALTA: TDBDateEdit;
    Label44: TLabel;
    Label15: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edDE_INICIOINASISTENCIALABORAL: TDBDateEdit;
    edDE_HORJORNADA1DESDE: TTimeEditor;
    edDE_HORJORNADA1HASTA: TTimeEditor;
    edDE_HORJORNADA2DESDE: TTimeEditor;
    edDE_HORJORNADA2HASTA: TTimeEditor;
    gbObservacionesEP: TJvgGroupBox;
    edDE_OBSERVACIONES_EP: TDBMemo;
    sdqEnfermedadProfesionalROWID: TStringField;
    fraEP_MODODETECCION: TfraCodDesc;
    Label70: TLabel;
    Label71: TLabel;
    fraDE_IDMOTIVONOCARGA2: TfraSMC_MOTIVONOCARGA;
    fraDE_IDLESIONAGENTE: TfraSLM_LESIONAGENTEMATERIAL;
    rpDE_QUIENDENUNCIA: TJvDBRadioPanel;
    lbTextoDenuncia: TLabel;
    sdqDatosDE_QUIENDENUNCIA: TStringField;
    fpEstableciTemporales: TFormPanel;
    Bevel18: TBevel;
    lblTitulo: TLabel;
    btnAceptarEstTemp: TBitBtn;
    dbgEstableciTemporales: TArtDBGrid;
    sdqEstableciTemporales: TSDQuery;
    dsEstableciTemporales: TDataSource;
    sdqDatosUD_ESTABLECIMIENTO_TEMP: TFloatField;
    sdqDatosUD_IDEXPEDIENTE: TFloatField;
    Label52: TLabel;
    edDE_FECHABAJAMEDICA: TDBDateEdit;
    sdqDatosde_bajamedica: TDateTimeField;
    sdqDatosEX_ALTAMEDICA: TDateTimeField;
    procedure FSFormCreate(Sender: TObject);
    procedure sdqDatosNewRecord(DataSet: TDataSet);
    procedure Validar(DataSet: TDataSet); //Este método es el sdqDatosBeforePost
    procedure dsDatosUpdateData(Sender: TObject);
    procedure edDE_HORJORNADA1DESDEExit(Sender: TObject);
    procedure edDE_HORJORNADA1HASTAExit(Sender: TObject);
    procedure edDE_HORJORNADA2DESDEExit(Sender: TObject);
    procedure edDE_HORJORNADA2HASTAExit(Sender: TObject);
    procedure rgEstablecimientoChange(Sender: TObject);
    procedure edDE_UBICACION_CUITOCURREChange(Sender: TObject);
    procedure rgDenunciaPolicialChange(Sender: TObject);
    procedure fraDomicilioEstablecimientoedCPostalChange(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqEnfermedadProfesionalAfterScroll(DataSet: TDataSet);
    procedure sdqEnfermedadProfesionalAfterOpen(DataSet: TDataSet);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure sdqEnfermedadProfesionalAfterPost(DataSet: TDataSet);
    procedure sdqEnfermedadProfesionalAfterCancel(DataSet: TDataSet);
    procedure OnExit(Sender: TObject);
    procedure OnEnter(Sender: TObject);
    procedure fraDE_IDDIAGNOSTICOPropiedadesChange(Sender: TObject);
    procedure fraCDG_DIAGNOSTICO1PropiedadesChange(Sender: TObject);
    procedure fraTipoSiniestroPropiedadesChange(Sender: TObject);
    procedure FSFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridEnfermedadesProfesionalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsEnfermedadProfesionalUpdateData(Sender: TObject);
    procedure edDE_DESCRIPCIONChange(Sender: TObject);
    procedure rpDE_QUIENDENUNCIAChange(Sender: TObject);
    procedure rgEstablecimientoClick(Sender: TObject);
    procedure btnAceptarEstTempClick(Sender: TObject);
    procedure fpEstableciTemporalesBeforeShow(Sender: TObject);
    procedure dbgEstableciTemporalesDblClick(Sender: TObject);
    procedure Delete; override;

  private
    procedure ActivarEP(AValue: Boolean);
    procedure Bajas(AValue: Boolean);
    function Esta_CuitEnEstablecimientoTemporal(IdExped:integer):boolean;  // TK 21228
    procedure Do_CargarEstablecimientosTemporales;       // TK 21228
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    procedure Clear; override;                    
    procedure LoadData; override;
    function  Save: boolean; override;
    procedure Cancel(ASinPreguntar: Boolean = False); override;
    procedure Edit; override;
    procedure Print; override;
  end;

var
  frmDenunciaSTD: TfrmDenunciaSTD;
  vEstablecimientoTemp: integer;

implementation

uses
  unDmPrincipal, unArt, AnsiSql, DbFuncs, unSesion, CustomDlgs, Math,
  unEspera, unSiniestros, DateTimeFuncs, unDlgBusEstablecimiento, VCLExtra,
  General, CUIT, unRptDenunciaStandardS;

{$R *.dfm}

var
  nDefasaje: Integer;

procedure TfrmDenunciaSTD.Cancel(ASinPreguntar: Boolean = False);
var
  bInsertando: boolean;
begin
  bInsertando := sdqDatos.State = dsInsert;
  inherited;
  with sdqEnfermedadProfesional do
  if Active then
  begin
    if dsEnfermedadProfesional.State in dsEditModes then
      Cancel;
      
    CancelUpdates;
    RollbackUpdates;
  end;
  
  if bInsertando then
  begin
    fraDomicilioDenuncia.Clear;
    fraDomicilioEstablecimiento.Clear;
  end;
  fraTipoSiniestroPropiedadesChange(nil);  
end;

procedure TfrmDenunciaSTD.Edit;
begin
  if not Inserting then
    Bajas(True);
    
  inherited;
  fraSDA_DETALLEARCHIVO.Clear;
  ActivarEP(False);
  VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);
  VCLExtra.LockControls([chkEmpresaContratada, edEX_FECHAACCIDENTE], True);
//  VCLExtra.LockControls([edEX_HORAACCIDENTE], not edEX_HORAACCIDENTE.IsValid()); 

  VCLExtra.LockControls([edDE_UBICACION_NOMBRE,
                         edUD_NROESTABLECIMIENTOAFIP,
                         edDE_UBICACION_CODAREATELEFONOS,
                         edDE_UBICACION_TELEFONOS,
                         fraDE_UBICACION_PAIS,
                         fraDomicilioEstablecimiento], (rgEstablecimiento.ItemIndex <> 1) or (Recaida > 0));
  VCLExtra.LockControls([rgEstablecimiento, edDE_UBICACION_CUITOCURRE, chkEmpresaContratada, fraUD_SECUENCIA_PARTIDOLOCALIDAD], (Recaida > 0));
  VCLExtra.LockControls([edDE_ITINERE_TESTIGO1_NOMBRE,
                         edDE_ITINERE_TESTIGO1_DOMICILIO,
                         edDE_ITINERE_TESTIGO1_TELEFONOS,
                         edDE_ITINERE_TESTIGO2_NOMBRE,
                         edDE_ITINERE_TESTIGO2_DOMICILIO,
                         edDE_ITINERE_TESTIGO2_TELEFONOS,
                         edDE_ITINERE_TERCERO_RESP_NOMBRE,
                         edDE_ITINERE_TERCERO_RESP_DOM,
                         edDE_ITINERE_TERCERO_RESP_TEL,
                         edDE_ITINERE_COMISARIA,
                         edDE_ITINERE_NRODENUNCIA,
                         edDE_ITINERE_COM_TELEFONOS,
                         fraDomicilioDenuncia], rgDenunciaPolicial.ItemIndex <> 0);

  if rpDE_QUIENDENUNCIA.ItemIndex = -1 then
    rpDE_QUIENDENUNCIA.ItemIndex := 0;
    
  fraTipoSiniestroPropiedadesChange(nil);
end;

procedure TfrmDenunciaSTD.LoadData;
begin
  fraSDA_DETALLEARCHIVO.Clear;
  fraDE_IDLESIONNATURALEZA.ClearGrid;

  if TipoAccidente = TA_ENFERMEDAD then
    fraDE_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' AND LN_CODIGO IN (''17'', ''18'', ''21'', ''99'') '
  else
    fraDE_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' ';

  Bajas(True);
  sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  fraTipoSiniestroPropiedadesChange(nil);

  if not sdqDatos.IsEmpty then
    sdqDatos.Last;

  if rpDE_QUIENDENUNCIA.ItemIndex = -1 then
    rpDE_QUIENDENUNCIA.ItemIndex := 0;

  if sdqDatos.RecordCount > 1 then
    InfoHint(edDE_DIAGNOSTICO, 'La consulta devolvió mas de una denuncia. Si este dato no es correcto consulte a sistemas.');
end;

function TfrmDenunciaSTD.Save: boolean;
begin
  Result := False;

  if sdqDatos.Active then
  begin
    if sdqDatos.State in [dsInsert, dsEdit] then
    begin
      if sdqDatos.FieldByName('DE_ID').AsInteger = ART_EMPTY_ID Then
      begin
        sdqDatos.Edit;
        sdqDatos.FieldByName('DE_ID').AsInteger := GetSecNextVal('SIN.SEQ_SDE_ID');
      end;

      if (vEstablecimientoTemp = 0) then   // TK 21228
        sdqDatos.FieldByName('UD_ESTABLECIMIENTO_TEMP').Value := Null
      else
        sdqDatos.FieldByName('UD_ESTABLECIMIENTO_TEMP').AsInteger := vEstablecimientoTemp;

      fraDE_IDPRESTADOR.Change;

      if dsEnfermedadProfesional.State in dsEditModes then
        tbGuardarClick(nil);

      sdqDatos.Post;
      sdqEnfermedadProfesional.CommitUpdates;
      fraTipoSiniestroPropiedadesChange(nil);
    end;

    Result := inherited Save;

    // TK 43664
    Do_CopiarFechaBajaMedica(sdqDatos.FieldByName('DE_ID').AsInteger, idExpediente, sdqDatos.FieldByName('DE_BAJAMEDICA').AsDateTime,
                             sdqDatos.FieldByName('DE_FECHARECEPCION').AsDateTime, sdqDatos.FieldByName('EX_ALTAMEDICA').AsDateTime);

    LoadData;
  end;
end;

procedure TfrmDenunciaSTD.FSFormCreate(Sender: TObject);
begin
  with fraEP_MODODETECCION do
  begin
    TableName   := 'SIN.SMD_MODODETECCION';
    FieldID     := 'MD_ID';
    FieldCodigo := 'MD_CODIGO';
    FieldDesc   := 'MD_DESCRIPCION';
    FieldBaja   := 'MD_FECHABAJA';
//    DataSource  := dsEnfermedadProfesional;
//    DataField   := 'EP_MODODETECCION';
  end;

  inherited;
  pgSolapas.ActivePage := tsA;
  fraDomicilioEstablecimiento.AutoSize := False;
  fraDomicilioDenuncia.AutoSize := False;
  lbValidacionCUIT.Caption := '';
  acEliminar.Enabled := seguridad.activar(acEliminar);

  with fraDE_IDPRESTADOR do
  begin
    AutoSize := False;
    Anchors := Anchors + [akRight];
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'DE_IDPRESTADOR';
    PrefijoTabla := 'DE_';
  end;

  vEstablecimientoTemp := 0;
  Bajas(True);

  TTimeEditorMsk(edDE_HORJORNADA1DESDE).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edDE_HORJORNADA1HASTA).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edDE_HORJORNADA2DESDE).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edDE_HORJORNADA2HASTA).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edEX_HORAACCIDENTE).EditMask    := FormatToMask('HH:mm');


end;

procedure TfrmDenunciaSTD.Bajas(AValue: Boolean);
begin
  fraDE_IDPRESTADOR.ShowBajas            := AValue;
  fraDE_IDLESIONFORMA.ShowBajas          := AValue;
  fraDE_IDLESIONAGENTE.ShowBajas         := AValue;
  fraDE_IDLESIONNATURALEZA.ShowBajas     := AValue;
  fraDE_IDLESIONNATURALEZA2.ShowBajas    := AValue;
  fraDE_IDLESIONNATURALEZA3.ShowBajas    := AValue;
  fraDE_IDLESIONZONA.ShowBajas           := AValue;
  fraDE_IDLESIONZONA2.ShowBajas          := AValue;
  fraDE_IDLESIONZONA3.ShowBajas          := AValue;
  fraEP_IDLESIONZONA.ShowBajas           := AValue;
  fraEP_IDLESIONAGENTEMATERIAL.ShowBajas := AValue;
  fraEP_IDLESIONAGENTE.ShowBajas         := AValue;
end;

procedure TfrmDenunciaSTD.sdqDatosNewRecord(DataSet: TDataSet);
var
  sSQL: string;
begin
  with DataSet do
  begin
    Bajas(False);  

    FieldByName('DE_ID').AsInteger := ART_EMPTY_ID;
    FieldByName('DE_IDEXPEDIENTE').AsInteger := FIdExpediente;
    FieldByName('DE_FECHAALTA').AsDateTime := dHoy;
    FieldByName('DE_SUBTIPO').AsInteger := 6;
    FieldByName('DE_QUIENDENUNCIA').AsInteger := -1;

    edDE_HORJORNADA1DESDE.Clear;
    edDE_HORJORNADA1HASTA.Clear;
    edDE_HORJORNADA2DESDE.Clear;
    edDE_HORJORNADA2HASTA.Clear;

    FieldByName('DE_ACCIDENTETRANSITO').AsString := AccidenteDeTransito;
    FieldByName('DE_INTERNACION').AsString := 'N';
    FieldByName('DE_TIPO').AsString := TipoAccidente;    
    FieldByName('UBICACION_DENUNCIA').AsString   := 'S';

    fraTipoSiniestroPropiedadesChange(nil);
    VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);

    sSQL := 'SELECT PI_DIAGNOSTICO, PI_IDDIAGNOSTICO, PI_IDGRAVEDAD_CIE10, ' +
//                   'ART.SINIESTRO.GET_CIE10EGRESO(PI_IDEXPEDIENTE) as CIE10, ' +
//                   'ART.SINIESTRO.GET_GRAVEDADCIE10_EGRESO(PI_IDEXPEDIENTE) as GRAVEDAD_CIE10, ' +
//                   'PI_IDPRESTADOR ' +
                  ' UD_TIPO_ESTAB AS UBICACION_DENUNCIA, ' +
                  'UD_CALLE, UD_NUMERO, UD_PISO, UD_DEPARTAMENTO, UD_CPOSTAL, UD_CPOSTALA, ' +
                  'UD_LOCALIDAD, UD_PROVINCIA, PV_DESCRIPCION PROVINCIA, UD_ESTABLECIMIENTO, UD_NOMBRE, ' +
                  'EX_FECHAACCIDENTE, EX_HORAACCIDENTE ' +
              'FROM ART.SEX_EXPEDIENTES EXPEDIENTE ' +
         'LEFT JOIN SIN.SUD_UBICACIONDENUNCIA ON UD_IDEXPEDIENTE = ART.SINIESTRO.GET_IDEXPEDIENTE(EX_SINIESTRO, EX_ORDEN, 0) ' +
         'LEFT JOIN SIN.SPI_PARTEDEINGRESO ON PI_IDEXPEDIENTE = EX_ID ' +
         'LEFT JOIN ART.CPV_PROVINCIAS ON PV_CODIGO = UD_PROVINCIA ' +
             'WHERE EX_ID = :ID';

    with GetQueryEx(sSQL, [FIdExpediente]) do
    try
      if not IsEmpty then
      begin
        sdqDatos.FieldByName('DE_DIAGNOSTICO').AsString := FieldByName('PI_DIAGNOSTICO').AsString;
        sdqDatos.FieldByName('DE_IDGRAVEDAD_CIE10').Value := FieldByName('PI_IDGRAVEDAD_CIE10').Value;
        sdqDatos.FieldByName('DE_IDDIAGNOSTICO').Value := FieldByName('PI_IDDIAGNOSTICO').Value;

        sdqDatos.FieldByName('DE_UBICACION_NOMBRE').Value := FieldByName('UD_NOMBRE').Value;
        sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').Value := FieldByName('UD_ESTABLECIMIENTO').Value;

        sdqDatos.FieldByName('EX_FECHAACCIDENTE').Value := FieldByName('EX_FECHAACCIDENTE').Value;
//        sdqDatos.FieldByName('EX_HORAACCIDENTE').Value := FieldByName('EX_HORAACCIDENTE').Value;

        if not FieldByName('EX_HORAACCIDENTE').IsNull then
          edEX_HORAACCIDENTE.EditText := FieldByName('EX_HORAACCIDENTE').AsString;

        rgEstablecimiento.OnChange := nil;
        sdqDatos.FieldByName('UBICACION_DENUNCIA').Value := FieldByName('UBICACION_DENUNCIA').Value;
        rgEstablecimiento.OnChange := rgEstablecimientoChange;

        with fraDomicilioEstablecimiento do
        begin
          Calle        := FieldByName('UD_CALLE').AsString;
          Numero       := IIF(FieldByName('UD_NUMERO').IsNull, 'S/N', FieldByName('UD_NUMERO').AsString);
          Piso         := FieldByName('UD_PISO').AsString;
          Departamento := FieldByName('UD_DEPARTAMENTO').AsString;
          CodigoPostal := FieldByName('UD_CPOSTAL').AsString;
          CPA          := FieldByName('UD_CPOSTALA').AsString;
          Localidad    := FieldByName('UD_LOCALIDAD').AsString;
          Prov         := StrToIntDef(FieldByName('UD_PROVINCIA').AsString, -1);
          Provincia    := FieldByName('PROVINCIA').AsString;
        end;
{
        sdqDatos.FieldByName('DE_IDGRAVEDAD_CIE10').Value := FieldByName('GRAVEDAD_CIE10').Value;
        sdqDatos.FieldByName('DE_IDDIAGNOSTICO').Value := FieldByName('CIE10').Value;
        sdqDatos.FieldByName('DE_IDPRESTADOR').Value := FieldByName('PI_IDPRESTADOR').Value;
}        
      end;
    finally
      Free;
    end;

    VCLExtra.LockControls([chkEmpresaContratada, edEX_FECHAACCIDENTE], True);
//    VCLExtra.LockControls([edEX_HORAACCIDENTE], not edEX_HORAACCIDENTE.IsValid());
  end;
end;
{-------------------Este método es el sdqDatosBeforePost-----------------------}
procedure TfrmDenunciaSTD.Validar(DataSet: TDataSet);
{
const
  Msg_01 = 'Debe indicar la gravedad si selecciona un diagnóstico.';
  Msg_02 = 'Debe completar la descripción del hecho.';
  Msg_03 = 'La fecha de recepción es obligatoria.';
  Msg_04 = 'La fecha de recepción no puede ser posterior a la de hoy %s.';
  Msg_05 = 'La fecha de recepción no puede ser posterior a la fecha de carga del siniestro, para el primer parte ingresado %s.';
  Msg_06 = 'La fecha de recepción no puede ser anterior a la fecha del accidente/recaída %s.';
  Msg_07 = 'La fecha de recepción no puede ser posterior a la de alta %s del parte.';
  Msg_08 = 'La fecha de antigüedad en el puesto no puede ser posterior a la de hoy %s.';
  Msg_09 = 'La fecha de antigüedad en el puesto no puede ser posterior a la del accidente %s.';
  Msg_10 = 'La cantidad de meses en el puesto es incorrecta.';
NOMsg_11 = 'La fecha de baja médica no puede ser posterior a la de hoy %s.';
NOMsg_12 = 'La fecha de baja médica no puede ser anterior a la fecha del accidente/recaída %s.';
NOMsg_13 = 'La fecha de baja médica no puede ser posterior a la de alta %s.';
NOMsg_14 = 'La fecha de recepción no puede ser anterior a la fecha de baja médica %s.';
  Msg_15 = 'La fecha de denuncia debe ser anterior a la fecha de recepción %s.';
}
  function GetParentTabSheet(AControl: TWinControl): TTabSheet;
  begin
    if Assigned(AControl) then
      if (AControl.ClassType <> TTabSheet) then
        Result := GetParentTabSheet(AControl.Parent)
      else
        Result := TTabSheet(AControl)
    else
      Result := nil;
  end;

  function Verificar(Condicion: Boolean; AControl: TWinControl; AText: String): Boolean;
  begin
    if Condicion then
    begin
      pgSolapas.ActivePage := GetParentTabSheet(AControl);
      Result := CustomDlgs.Verificar(Condicion, AControl, AText);
    end else
      Result := False;
  end;
  
var dFecha: TDateTime; ssql: string;
begin
//  IniciarEspera('Validando...');
  try
    inherited;
    Verificar(fraTipoSiniestro.IsEmpty, fraTipoSiniestro.edCodigo, Msg_70);
    Verificar(rpDE_QUIENDENUNCIA.ItemIndex = -1, rpDE_QUIENDENUNCIA, Msg_81);
    Verificar(not fraTipoSiniestro.EsEnfermedadProfesional and (rpDE_SUBTIPO.ItemIndex = 6), rpDE_SUBTIPO, Msg_69);
    Verificar((rgEstablecimiento.ItemIndex = -1) and (Recaida = 0), rgEstablecimiento, Msg_88);
    Verificar(fraDomicilioEstablecimiento.IsEmpty and (rgEstablecimiento.ItemIndex <> 2), fraDomicilioEstablecimiento, 'Debe completar el domicilio para poder grabar.');
    Verificar(not fraTipoSiniestro.EsEnfermedadProfesional and (Trim(edDE_DESCRIPCION.Text) = ''), edDE_DESCRIPCION, Msg_02);

    if fraDomicilioEstablecimiento.IsSelected and (rgEstablecimiento.ItemIndex <> 0) and not fraDomicilioEstablecimiento.IsValid then
    begin
      pgSolapas.ActivePage := GetParentTabSheet(fraDomicilioEstablecimiento);
      Abort;
    end;

    Verificar(edDE_ANTIGUEDADPUESTO.Date > dHoy, edDE_ANTIGUEDADPUESTO, Format(Msg_08, [DateToStr(dHoy)]));
    Verificar(edDE_ANTIGUEDADPUESTO.Date > FechaAccidente, edDE_ANTIGUEDADPUESTO, Format(Msg_09, [DateToStr(FechaAccidente)]));
    Verificar(not VarIsNull(edDE_MESESPUESTO.Field.Value) and (edDE_MESESPUESTO.Field.Value > 11), edDE_MESESPUESTO, Msg_10);
//    Verificar((edDE_FECHADENUNCIA.Date <> 0) and (edDE_FECHADENUNCIA.Date > edDE_FECHARECEPCION.Date), edDE_FECHADENUNCIA, Format(Msg_15, [DateToStr(edDE_FECHARECEPCION.Date)]));
    Verificar((edDE_INICIOINASISTENCIALABORAL.Date > 0) and (edDE_INICIOINASISTENCIALABORAL.Date < FechaAccidenteRecaida), edDE_INICIOINASISTENCIALABORAL, Format(Msg_75, [DateToStr(edDE_INICIOINASISTENCIALABORAL.Date), DateToStr(FechaAccidenteRecaida)]));

    Verificar(fraDE_IDLESIONAGENTE.IsSelected and (fraDE_IDLESIONAGENTE.IsSubTitulo or fraDE_IDLESIONAGENTE.IsTitulo), fraDE_IDLESIONAGENTE.edCodigo, Format(Msg_74, ['un agente']));
    Verificar(fraDE_IDLESIONAGENTE.IsSelected and fraDE_IDLESIONAGENTE.IsBaja, fraDE_IDLESIONAGENTE.edCodigo, Format(Msg_73, ['un agente']));

    Verificar(fraDE_IDLESIONFORMA.IsSelected and fraDE_IDLESIONFORMA.IsSubTitulo, fraDE_IDLESIONFORMA.edCodigo, Format(Msg_74, ['una forma']));
    Verificar(fraDE_IDLESIONFORMA.IsSelected and fraDE_IDLESIONFORMA.IsBaja, fraDE_IDLESIONFORMA.edCodigo, Format(Msg_73, ['una forma']));

    Verificar(fraDE_IDGRAVEDAD_CIE10.IsEmpty and fraDE_IDDIAGNOSTICO.IsSelected, fraDE_IDGRAVEDAD_CIE10.edCodigo, Msg_01);
    Verificar(fraDE_IDDIAGNOSTICO1.IsSelected and fraDE_IDDIAGNOSTICO2.IsSelected and (fraDE_IDDIAGNOSTICO1.Value = fraDE_IDDIAGNOSTICO2.Value), fraDE_IDDIAGNOSTICO1.edCodigo, Format(Msg_76, [fraDE_IDDIAGNOSTICO1.Descripcion]));
    Verificar(fraDE_IDDIAGNOSTICO2.IsSelected and fraDE_IDDIAGNOSTICO3.IsSelected and (fraDE_IDDIAGNOSTICO2.Value = fraDE_IDDIAGNOSTICO3.Value), fraDE_IDDIAGNOSTICO2.edCodigo, Format(Msg_76, [fraDE_IDDIAGNOSTICO2.Descripcion]));
    Verificar(fraDE_IDDIAGNOSTICO3.IsSelected and fraDE_IDDIAGNOSTICO1.IsSelected and (fraDE_IDDIAGNOSTICO3.Value = fraDE_IDDIAGNOSTICO1.Value), fraDE_IDDIAGNOSTICO3.edCodigo, Format(Msg_76, [fraDE_IDDIAGNOSTICO3.Descripcion]));

    Verificar((not fraDE_IDDIAGNOSTICO1.IsSelected) and (fraDE_IDLESIONNATURALEZA.IsSelected or fraDE_IDLESIONZONA.IsSelected), fraDE_IDDIAGNOSTICO1.edCodigo, Msg_79);
    Verificar((not fraDE_IDDIAGNOSTICO2.IsSelected) and (fraDE_IDLESIONNATURALEZA2.IsSelected or fraDE_IDLESIONZONA2.IsSelected), fraDE_IDDIAGNOSTICO2.edCodigo, Msg_79);
    Verificar((not fraDE_IDDIAGNOSTICO3.IsSelected) and (fraDE_IDLESIONNATURALEZA3.IsSelected or fraDE_IDLESIONZONA3.IsSelected), fraDE_IDDIAGNOSTICO3.edCodigo, Msg_79);

    Verificar((not fraDE_IDDIAGNOSTICO1.IsSelected) and fraDE_IDDIAGNOSTICO2.IsSelected, fraDE_IDDIAGNOSTICO1.edCodigo, Msg_80);
    Verificar((not fraDE_IDDIAGNOSTICO2.IsSelected) and fraDE_IDDIAGNOSTICO3.IsSelected, fraDE_IDDIAGNOSTICO2.edCodigo, Msg_80);

    Verificar(fraDE_IDLESIONNATURALEZA.IsSelected and fraDE_IDLESIONNATURALEZA.IsBaja, fraDE_IDLESIONNATURALEZA.edCodigo, Format(Msg_73, ['una naturaleza']));
    Verificar(fraDE_IDLESIONNATURALEZA2.IsSelected and fraDE_IDLESIONNATURALEZA2.IsBaja, fraDE_IDLESIONNATURALEZA2.edCodigo, Format(Msg_73, ['una naturaleza']));
    Verificar(fraDE_IDLESIONNATURALEZA3.IsSelected and fraDE_IDLESIONNATURALEZA3.IsBaja, fraDE_IDLESIONNATURALEZA3.edCodigo, Format(Msg_73, ['una naturaleza']));

    Verificar(fraDE_IDLESIONZONA.IsSelected and fraDE_IDLESIONZONA.IsBaja, fraDE_IDLESIONZONA.edCodigo, Format(Msg_73, ['una zona']));
    Verificar(fraDE_IDLESIONZONA2.IsSelected and fraDE_IDLESIONZONA2.IsBaja, fraDE_IDLESIONZONA2.edCodigo, Format(Msg_73, ['una zona']));
    Verificar(fraDE_IDLESIONZONA3.IsSelected and fraDE_IDLESIONZONA3.IsBaja, fraDE_IDLESIONZONA3.edCodigo, Format(Msg_73, ['una zona']));

    Verificar(edDE_FECHARECEPCION.Date = 0, edDE_FECHARECEPCION, Msg_03);
    Verificar(edDE_FECHARECEPCION.Date > dHoy, edDE_FECHARECEPCION, Format(Msg_04, [DateToStr(dHoy)]));
    Verificar(edDE_FECHARECEPCION.Date < FechaAccidenteRecaida, edDE_FECHARECEPCION, Format(Msg_06, [DateToStr(FechaAccidenteRecaida)]));
    Verificar((sdqDatos.State = dsEdit) and (edDE_FECHARECEPCION.Date > sdqDatosDE_FECHAALTA.AsDateTime), edDE_FECHARECEPCION, Format(Msg_07, [sdqDatosDE_FECHAALTA.AsString]));
    Verificar((FechaRecepcion = 0) and (edDE_FECHARECEPCION.Date > FechaAlta), edDE_FECHARECEPCION, Format(Msg_05, [DateToStr(FechaAlta)]));

    Verificar(chkInternado.Checked and fraDE_IDPRESTADOR.IsEmpty, fraDE_IDPRESTADOR.cmbCA_DESCRIPCION, Msg_60);
    Verificar((not fraDE_IDPRESTADOR.IsEmpty) and chkInternado.Checked and (fraDE_IDPRESTADOR.CUIT = cNroCuitART), fraDE_IDPRESTADOR.cmbCA_DESCRIPCION, Msg_63);

    Verificar((edDE_FECHABAJAMEDICA.Date <> 0) and (edDE_FECHABAJAMEDICA.Date > dHoy), edDE_FECHABAJAMEDICA, Format(Msg_11, ['baja médica', DateToStr(dHoy)]));
    Verificar((edDE_FECHABAJAMEDICA.Date <> 0) and (edDE_FECHABAJAMEDICA.Date < FechaAccidenteRecaida), edDE_FECHABAJAMEDICA, Format(Msg_12, [DateToStr(FechaAccidenteRecaida)]));
    Verificar((edDE_FECHABAJAMEDICA.Date <> 0) and (edDE_FECHARECEPCION.Date < edDE_FECHABAJAMEDICA.Date), edDE_FECHARECEPCION, Format(Msg_14, ['baja médica', DateToStr(edDE_FECHABAJAMEDICA.Date)]));
    dFecha := Obtener_MinFechaLiquidacionILT(IdExpediente);
    Verificar((dFecha > 0) and (edDE_FECHABAJAMEDICA.Date > dFecha), edDE_FECHABAJAMEDICA, Format(Msg_17, [DateToStr(dFecha)]));
    sSQL := 'SELECT MAX(EX_ALTAMEDICA) ' +
              'FROM SEX_EXPEDIENTES ' +
             'WHERE EX_SINIESTRO = :SIN ' +
               'AND EX_ORDEN = :ORD ' +
               'AND EX_RECAIDA < :REC ' +
               'AND EX_INTERCURRENCIA <> ''S'' ';
    dFecha := ValorSQLDateTimeEx(sSQL, [Siniestro, Orden, Recaida]);
    Verificar((dFecha > 0) and (edDE_FECHABAJAMEDICA.Date < dFecha), edDE_FECHABAJAMEDICA, Format(Msg_19, [DateToStr(dFecha)]));
    sSQL := 'SELECT PE_FECHAALTAMEDICA ' +
              'FROM SIN.SPE_PARTEDEEGRESO ' +
             'WHERE PE_IDEXPEDIENTE = :ID ' +
               'AND PE_AUTOMATICO <> ''S'' ';               
    dFecha := ValorSQLDateTimeEx(sSQL, [IDExpediente]);                                ;
    Verificar((dFecha > 0) and (edDE_FECHABAJAMEDICA.Date > dFecha), edDE_FECHABAJAMEDICA, Format(Msg_72, [DateToStr(dFecha)]));

    if (rgDenunciaPolicial.ItemIndex = 0) and fraDomicilioDenuncia.IsSelected and not fraDomicilioDenuncia.IsValid then
    begin
      pgSolapas.ActivePage := GetParentTabSheet(fraDomicilioDenuncia);
      Abort;
    end;

    fraSDA_DETALLEARCHIVO.Validate(GetParentTabSheet(fraSDA_DETALLEARCHIVO).TabIndex);
  finally
//    DetenerEspera;
  end;
end;

procedure TfrmDenunciaSTD.dsDatosUpdateData(Sender: TObject);
begin
  inherited;
  with sdqDatos do
  begin
    FieldByName('USUARIO').AsString := Sesion.UserID;
    FieldByName('DE_HORJORNADA1DESDE').AsString := edDE_HORJORNADA1DESDE.EditText;
    FieldByName('DE_HORJORNADA1HASTA').AsString := edDE_HORJORNADA1HASTA.EditText;
    FieldByName('DE_HORJORNADA2DESDE').AsString := edDE_HORJORNADA2DESDE.EditText;
    FieldByName('DE_HORJORNADA2HASTA').AsString := edDE_HORJORNADA2HASTA.EditText;
    FieldByName('EX_HORAACCIDENTE').AsString    := edEX_HORAACCIDENTE.EditText;

    with fraDomicilioEstablecimiento do
    begin
      FieldByName('DE_UBICACION_CALLE').AsString          := Calle;
      FieldByName('DE_UBICACION_NUMERO').AsString         := IIF(Numero = 'S/N', '', Numero);
      FieldByName('DE_UBICACION_PISO').AsString           := Piso;
      FieldByName('DE_UBICACION_DEPARTAMENTO').AsString   := Departamento;
      FieldByName('DE_UBICACION_CPOSTAL').AsString        := CodigoPostal;
      FieldByName('DE_UBICACION_CPOSTALA').AsString       := CPA;
//      FieldByName('DE_UBICACION_LOCALIDAD').AsString      := IIF(edCPostal.Text = '', '', Localidad);
      FieldByName('DE_UBICACION_PROVINCIA').AsString      := IIF(Prov = -1, '', IntToStr(Prov));

      if rgEstablecimiento.ItemIndex > 0 then
        FieldByName('DE_UBICACION_LOCALIDAD').AsString    := IIF(CodigoPostal = '', '', Localidad)
      else
        FieldByName('DE_UBICACION_LOCALIDAD').AsString    := Localidad;
    end;

    with fraDomicilioDenuncia do
    begin
      FieldByName('DE_ITINERE_COM_CALLE').AsString        := Calle;
      FieldByName('DE_ITINERE_COM_NUMERO').AsString       := IIF(Numero = 'S/N', '', Numero);
      FieldByName('DE_ITINERE_COM_PISO').AsString         := Piso;
      FieldByName('DE_ITINERE_COM_DEPARTAMENTO').AsString := Departamento;
      FieldByName('DE_ITINERE_COM_CPOSTAL').AsString      := CodigoPostal;
      FieldByName('DE_ITINERE_COM_CPOSTALA').AsString     := CPA;
      FieldByName('DE_ITINERE_COM_LOCALIDAD').AsString    := IIF(CodigoPostal = '', '', Localidad);
      FieldByName('DE_ITINERE_COM_PROVINCIA').AsString    := IIF(Prov = -1, '', IntToStr(Prov));
    end;

    FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').Value := fraUD_SECUENCIA_PARTIDOLOCALIDAD.Value;
    FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
    FieldByName('DA_HOJAS').AsInteger := fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value;
  end;
end;

procedure TfrmDenunciaSTD.edDE_HORJORNADA1DESDEExit(Sender: TObject);
begin
  edDE_HORJORNADA1HASTA.MinTime := edDE_HORJORNADA1DESDE.Time;
  OnExit(edDE_HORJORNADA1DESDE);
end;

procedure TfrmDenunciaSTD.edDE_HORJORNADA1HASTAExit(Sender: TObject);
begin
  edDE_HORJORNADA1DESDE.MaxTime := edDE_HORJORNADA1HASTA.Time;
  OnExit(edDE_HORJORNADA1HASTA);
end;

procedure TfrmDenunciaSTD.edDE_HORJORNADA2DESDEExit(Sender: TObject);
begin
  edDE_HORJORNADA2HASTA.MinTime := edDE_HORJORNADA2DESDE.Time;
  OnExit(edDE_HORJORNADA2DESDE);
end;

procedure TfrmDenunciaSTD.edDE_HORJORNADA2HASTAExit(Sender: TObject);
begin
  edDE_HORJORNADA2DESDE.MaxTime := edDE_HORJORNADA2HASTA.Time;
  OnExit(edDE_HORJORNADA2HASTA);
end;

procedure TfrmDenunciaSTD.rgEstablecimientoChange(Sender: TObject);
  procedure LimpiarInterno;
  begin
    with sdqDatos do
    begin
      FieldByName('DE_UBICACION_ESTABLECIMIENTO').Clear;
      FieldByName('DE_UBICACION_NOMBRE').Clear;
      FieldByName('DE_UBICACION_CODAREATELEFONOS').Clear;
      FieldByName('DE_UBICACION_TELEFONOS').Clear;
      FieldByName('DE_UBICACION_PAIS').Clear;
      FieldByName('DE_UBICACION_CALLE').Clear;
      FieldByName('DE_UBICACION_CPOSTAL').Clear;
      fraDomicilioEstablecimiento.Clear;
    end;
{
    fraDomicilioEstablecimiento.Clear;
    edDE_UBICACION_NOMBRE.Clear;
    edUD_NROESTABLECIMIENTOAFIP.Clear;
    edDE_UBICACION_CODAREATELEFONOS.Clear;
    edDE_UBICACION_TELEFONOS.Clear;
    fraDE_UBICACION_PAIS.Clear;
}    
  end;
var
  sSQL: string;
  iEstablecimiento: TTableID;
begin
  if sdqDatos.State in [dsInsert, dsEdit] then
    VCLExtra.LockControls([edDE_UBICACION_NOMBRE,
                           edUD_NROESTABLECIMIENTOAFIP,
                           edDE_UBICACION_CODAREATELEFONOS,
                           edDE_UBICACION_TELEFONOS,
                           fraDE_UBICACION_PAIS,
                           fraDomicilioEstablecimiento], rgEstablecimiento.ItemIndex <> 1);

  case rgEstablecimiento.ItemIndex of
    0: begin
         vEstablecimientoTemp := 0;
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           iEstablecimiento := GetIdEstablecimiento(ValorSqlIntegerEx('SELECT ART.AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE) FROM SEX_EXPEDIENTES WHERE EX_ID = :ID', [IDExpediente]));
           sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').AsInteger := iEstablecimiento;
         end else
           iEstablecimiento := sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').AsInteger;

         sSQL := 'SELECT A.*, PV_DESCRIPCION FROM AES_ESTABLECIMIENTO A, CPV_PROVINCIAS WHERE PV_CODIGO = ES_PROVINCIA AND ES_ID = :ID_ESTABLECIMIENTO';

         //DIRECCION A LA ANTIGUA...
         with GetQueryEx(sSQL, [iEstablecimiento]), fraDomicilioEstablecimiento do
         begin
           edDE_UBICACION_NOMBRE.Text           := FieldByName('ES_NOMBRE').AsString;
           edUD_NROESTABLECIMIENTOAFIP.Text     := '';
           edDE_UBICACION_CODAREATELEFONOS.Text := FieldByName('ES_CODAREATELEFONOS').AsString;
           edDE_UBICACION_TELEFONOS.Text        := FieldByName('ES_TELEFONOS').AsString;
           fraDE_UBICACION_PAIS.Codigo          := '054';

           Calle        := FieldByName('ES_CALLE').AsString;
           Localidad    := FieldByName('ES_LOCALIDAD').AsString;
           Prov         := StrToIntDef(FieldByName('ES_PROVINCIA').AsString, -1);
           Provincia    := FieldByName('PV_DESCRIPCION').AsString;
           Numero       := IIF(FieldByName('ES_NUMERO').IsNull, 'S/N', FieldByName('ES_NUMERO').AsString);
           Piso         := FieldByName('ES_PISO').AsString;
           Departamento := FieldByName('ES_DEPARTAMENTO').AsString;
           CodigoPostal := FieldByName('ES_CPOSTAL').AsString;
           CPA          := FieldByName('ES_CPOSTALA').AsString;
         end;
       end;
    1: begin
         vEstablecimientoTemp := 0;
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           LimpiarInterno;
           if edDE_UBICACION_NOMBRE.CanFocus then
             edDE_UBICACION_NOMBRE.SetFocus;
         end;
       end;
    2: begin
         vEstablecimientoTemp := 0;
         if sdqDatos.State in [dsInsert, dsEdit] then
           LimpiarInterno;
       end;
    3: begin  // TK 21228
         if (sdqDatos.State in [dsInsert, dsEdit]) then
           if Esta_CuitEnEstablecimientoTemporal(FIdExpediente) then
             Do_CargarEstablecimientosTemporales
           else begin
             MsgBox('No se puede seleccionar esta opción debido a que la empresa no posee Establecimientos de Terceros');
           //  rgEstablecimiento.Value := ValorSqlEx('SELECT ud_tipo_estab FROM SIN.SUD_UBICACIONDENUNCIA WHERE UD_IDEXPEDIENTE = :idexp ', [FIdExpediente]);
             rgEstablecimiento.ItemIndex := -1;
             rgEstablecimiento.SetFocus;
           end;
       end;
  end;
end;

procedure TfrmDenunciaSTD.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControls([edDE_UBICACION_NOMBRE,
                         edUD_NROESTABLECIMIENTOAFIP,
                         edDE_UBICACION_CODAREATELEFONOS,
                         edDE_UBICACION_TELEFONOS,
                         fraDE_UBICACION_PAIS,
                         edDE_ITINERE_TESTIGO1_NOMBRE,
                         edDE_ITINERE_TESTIGO1_DOMICILIO,
                         edDE_ITINERE_TESTIGO1_TELEFONOS,
                         edDE_ITINERE_TESTIGO2_NOMBRE,
                         edDE_ITINERE_TESTIGO2_DOMICILIO,
                         edDE_ITINERE_TESTIGO2_TELEFONOS,
                         edDE_ITINERE_TERCERO_RESP_NOMBRE,
                         edDE_ITINERE_TERCERO_RESP_DOM,
                         edDE_ITINERE_TERCERO_RESP_TEL,
                         edDE_ITINERE_COMISARIA,
                         edDE_ITINERE_NRODENUNCIA,
                         edDE_ITINERE_COM_TELEFONOS,
                         fraDomicilioDenuncia], Value);
end;

procedure TfrmDenunciaSTD.edDE_UBICACION_CUITOCURREChange(Sender: TObject);
begin
  lbValidacionCUIT.Caption := '';
  if (Length(Trim(edDE_UBICACION_CUITOCURRE.Text)) = 11) and IsCuit(edDE_UBICACION_CUITOCURRE.Text) then
  begin
    lbValidacionCUIT.Caption := 'El número de CUIT es correcto';
    lbValidacionCUIT.Font.Color := clTeal;
  end else
  if (Length(Trim(edDE_UBICACION_CUITOCURRE.Text)) > 0) then
  begin
    lbValidacionCUIT.Caption := 'El número de CUIT es incorrecto';
    lbValidacionCUIT.Font.Color := clMaroon;
  end;
  chkEmpresaContratada.Checked := (Trim(edDE_UBICACION_CUITOCURRE.Text) > '');
end;

procedure TfrmDenunciaSTD.rgDenunciaPolicialChange(Sender: TObject);
  procedure LimpiarInterno;
  begin
  {
    fraDomicilioDenuncia.Clear;
    edDE_ITINERE_COMISARIA.Clear;
    edDE_ITINERE_NRODENUNCIA.Clear;
    edDE_ITINERE_COM_TELEFONOS.Clear;
    edDE_ITINERE_TESTIGO1_NOMBRE.Clear;
    edDE_ITINERE_TESTIGO1_DOMICILIO.Clear;
    edDE_ITINERE_TESTIGO1_TELEFONOS.Clear;
    edDE_ITINERE_TESTIGO2_NOMBRE.Clear;
    edDE_ITINERE_TESTIGO2_DOMICILIO.Clear;
    edDE_ITINERE_TESTIGO2_TELEFONOS.Clear;
    edDE_ITINERE_TERCERO_RESP_NOMBRE.Clear;
    edDE_ITINERE_TERCERO_RESP_DOM.Clear;
    edDE_ITINERE_TERCERO_RESP_TEL.Clear;
   }
    with sdqDatos do
    begin
      FieldByName('DE_ITINERE_COMISARIA').Clear;
      FieldByName('DE_ITINERE_NRODENUNCIA').Clear;
      FieldByName('DE_ITINERE_COM_TELEFONOS').Clear;
      FieldByName('DE_ITINERE_TESTIGO1_NOMBRE').Clear;
      FieldByName('DE_ITINERE_TESTIGO1_DOMICILIO').Clear;
      FieldByName('DE_ITINERE_TESTIGO1_TELEFONOS').Clear;
      FieldByName('DE_ITINERE_TESTIGO2_NOMBRE').Clear;
      FieldByName('DE_ITINERE_TESTIGO2_DOMICILIO').Clear;
      FieldByName('DE_ITINERE_TESTIGO2_TELEFONOS').Clear;
      FieldByName('DE_ITINERE_TERCERO_RESP_NOMBRE').Clear;
      FieldByName('DE_ITINERE_TERCERO_RESP_DOM').Clear;
      FieldByName('DE_ITINERE_TERCERO_RESP_TEL').Clear;
    end;
  end;
begin
  if sdqDatos.State in [dsInsert, dsEdit] then
    VCLExtra.LockControls([edDE_ITINERE_TESTIGO1_NOMBRE,
                           edDE_ITINERE_TESTIGO1_DOMICILIO,
                           edDE_ITINERE_TESTIGO1_TELEFONOS,
                           edDE_ITINERE_TESTIGO2_NOMBRE,
                           edDE_ITINERE_TESTIGO2_DOMICILIO,
                           edDE_ITINERE_TESTIGO2_TELEFONOS,
                           edDE_ITINERE_TERCERO_RESP_NOMBRE,
                           edDE_ITINERE_TERCERO_RESP_DOM,
                           edDE_ITINERE_TERCERO_RESP_TEL,
                           edDE_ITINERE_COMISARIA,
                           edDE_ITINERE_NRODENUNCIA,
                           edDE_ITINERE_COM_TELEFONOS,
                           fraDomicilioDenuncia], rgDenunciaPolicial.ItemIndex <> 0);

  case rgDenunciaPolicial.ItemIndex of
    0: begin
         if (sdqDatos.State in [dsInsert, dsEdit]) and edDE_ITINERE_NRODENUNCIA.CanFocus then
           edDE_ITINERE_NRODENUNCIA.SetFocus;
       end;
    1: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           LimpiarInterno;
           sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').Value := null;
         end;
       end;
  end;
end;

procedure TfrmDenunciaSTD.fraDomicilioEstablecimientoedCPostalChange(Sender: TObject);
begin
  inherited;
  fraUD_SECUENCIA_PARTIDOLOCALIDAD.CodigoPostal := TIntEdit(Sender).Value;
end;

procedure TfrmDenunciaSTD.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with sdqDatos do
  begin
    edDE_HORJORNADA1DESDE.EditText := FieldByName('DE_HORJORNADA1DESDE').AsString;
    edDE_HORJORNADA1HASTA.EditText := FieldByName('DE_HORJORNADA1HASTA').AsString;
    edDE_HORJORNADA2DESDE.EditText := FieldByName('DE_HORJORNADA2DESDE').AsString;
    edDE_HORJORNADA2HASTA.EditText := FieldByName('DE_HORJORNADA2HASTA').AsString;

    if not FieldByName('EX_HORAACCIDENTE').IsNull then
      edEX_HORAACCIDENTE.EditText    := FieldByName('EX_HORAACCIDENTE').AsString;

    fraUD_SECUENCIA_PARTIDOLOCALIDAD.Value := FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').AsInteger;
  end;

  with sdqDatos, fraDomicilioEstablecimiento do
  begin
    Calle        := FieldByName('DE_UBICACION_CALLE').AsString;
    Numero       := IIF(FieldByName('DE_UBICACION_NUMERO').IsNull, 'S/N', FieldByName('DE_UBICACION_NUMERO').AsString);
    Piso         := FieldByName('DE_UBICACION_PISO').AsString;
    Departamento := FieldByName('DE_UBICACION_DEPARTAMENTO').AsString;
    CodigoPostal := FieldByName('DE_UBICACION_CPOSTAL').AsString;
    CPA          := FieldByName('DE_UBICACION_CPOSTALA').AsString;
    Localidad    := FieldByName('DE_UBICACION_LOCALIDAD').AsString;
    Prov         := StrToIntDef(FieldByName('DE_UBICACION_PROVINCIA').AsString, -1);
    Provincia    := FieldByName('PROV_1').AsString;
  end;

  with sdqDatos, fraDomicilioDenuncia do
  begin
    Calle        := FieldByName('DE_ITINERE_COM_CALLE').AsString;
    Numero       := IIF(FieldByName('DE_ITINERE_COM_NUMERO').IsNull, 'S/N', FieldByName('DE_ITINERE_COM_NUMERO').AsString);
    Piso         := FieldByName('DE_ITINERE_COM_PISO').AsString;
    Departamento := FieldByName('DE_ITINERE_COM_DEPARTAMENTO').AsString;
    CodigoPostal := FieldByName('DE_ITINERE_COM_CPOSTAL').AsString;
    CPA          := FieldByName('DE_ITINERE_COM_CPOSTALA').AsString;
    Localidad    := FieldByName('DE_ITINERE_COM_LOCALIDAD').AsString;
    Prov         := StrToIntDef(FieldByName('DE_ITINERE_COM_PROVINCIA').AsString, -1);
    Provincia    := FieldByName('PROV_2').AsString;
  end;

  OpenQueryEx(sdqEnfermedadProfesional, [sdqDatos.Params[0].Value]);
end;

procedure TfrmDenunciaSTD.Clear;
begin
  inherited;
  fraDomicilioDenuncia.Clear;
  fraDomicilioEstablecimiento.Clear;
  sdqEnfermedadProfesional.Close;
  edEX_HORAACCIDENTE.Clear;
  edDE_HORJORNADA1DESDE.Clear;
  edDE_HORJORNADA1HASTA.Clear;
  edDE_HORJORNADA2DESDE.Clear;
  edDE_HORJORNADA2HASTA.Clear;
end;

procedure TfrmDenunciaSTD.tbNuevoClick(Sender: TObject);
begin
  Verificar(not fraTipoSiniestro.EsEnfermedadProfesional, nil, 'El tipo de siniestro seleccionado no corresponde a una enfermedad profesional.');
  BeginTrans(True);
  sdqEnfermedadProfesional.Insert;
  ActivarEP(True);

  if (dsEnfermedadProfesional.State in dsEditModes) and (sdqDatosDE_INICIOINASISTENCIALABORAL.AsDateTime > 0) then
    sdqEnfermedadProfesionalEP_FECHAINICIOINASISTENCIALABO.AsDateTime := sdqDatosDE_INICIOINASISTENCIALABORAL.AsDateTime;
end;

procedure TfrmDenunciaSTD.tbModificarClick(Sender: TObject);
begin
  if ToolBarEnfermedadProfesional.Enabled and tbModificar.Enabled then
  begin
    BeginTrans(True);
    sdqEnfermedadProfesional.Edit;
    ActivarEP(True);

    if (dsEnfermedadProfesional.State in dsEditModes) and sdqEnfermedadProfesionalEP_FECHAINICIOINASISTENCIALABO.IsNull then
      sdqEnfermedadProfesionalEP_FECHAINICIOINASISTENCIALABO.AsDateTime := sdqDatosDE_INICIOINASISTENCIALABORAL.AsDateTime;
  end;
end;

procedure TfrmDenunciaSTD.tbEliminarClick(Sender: TObject);
begin
  if MsgAsk('¿Está seguro que desea dar de baja la enfermedad profesional?') then
  begin
    with sdqEnfermedadProfesional do
    begin
      Delete;
      if UpdatesPending then
        ApplyUpdates;
      Close;
      Open;
    end;
    ActivarEP(False);
  end;
end;

procedure TfrmDenunciaSTD.sdqEnfermedadProfesionalAfterScroll(DataSet: TDataSet);
begin
//  tbCancelarClick(nil);
end;

procedure TfrmDenunciaSTD.ActivarEP(AValue: Boolean);
begin
  if AValue then
    gbEnfermedadProfesional.Height := 268 {Altura del panel padre} + nDefasaje
  else
    gbEnfermedadProfesional.Height := 160 {Altura del panel detalle} + 16 {Panel colapsado} + nDefasaje;

  gbDatosEnfermedadProfesional.Collapsed := not AValue;
  VCLExtra.LockControls(gbDatosEnfermedadProfesional, not CanSaveCancel or not AValue);
  VCLExtra.LockControls(GridEnfermedadesProfesionales, not CanSaveCancel or AValue);

  with sdqEnfermedadProfesional do
  begin
    tbNuevo.Enabled := Active {and (RecordCount < 9)} and (dsEnfermedadProfesional.State = dsBrowse);
    tbModificar.Enabled := Active {and not IsEmpty} and (dsEnfermedadProfesional.State = dsBrowse);
    tbEliminar.Enabled := Active {and not IsEmpty} and (dsEnfermedadProfesional.State = dsBrowse);
    tbGuardar.Enabled := Active and (dsEnfermedadProfesional.State in dsEditModes);
    tbCancelar.Enabled := Active and (dsEnfermedadProfesional.State in dsEditModes);
  end;

  if AValue and fraEP_IDLESIONAGENTE.edCodigo.CanFocus then
    fraEP_IDLESIONAGENTE.edCodigo.SetFocus;
end;

procedure TfrmDenunciaSTD.sdqEnfermedadProfesionalAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(GridEnfermedadesProfesionales);
  nDefasaje := Max(sdqEnfermedadProfesional.RecordCount - 1, 0) * 16;
  ActivarEP(False);
end;

procedure TfrmDenunciaSTD.tbGuardarClick(Sender: TObject);
var
  sSQL: String;
begin
//  Verificar(fraEP_IDLESIONAGENTE.IsEmpty, fraEP_IDLESIONAGENTE.edCodigo, 'Debe indicar el agente causante.');
  Verificar(Trim(edEP_DIAGNOSTICO.Lines.Text) = '', edEP_DIAGNOSTICO, 'Debe indicar la descripción del diagnóstico.');
  Verificar(fraEP_IDDIAGNOSTICO.IsEmpty, fraEP_IDDIAGNOSTICO.edCodigo, 'Debe indicar el diagnóstico.');
  Verificar(fraEP_IDGRAVEDAD_CIE10.IsEmpty, fraEP_IDGRAVEDAD_CIE10.edCodigo, 'Debe indicar la gravedad del diagnóstico.');
  Verificar((edEP_TIEMPOEXPOSICION.Date > 0) and (edEP_TIEMPOEXPOSICION.Date > FechaAccidenteRecaida), edEP_TIEMPOEXPOSICION,
            Format('La fecha de exposición no puede ser posterior a la del accidente/recaída (%s).', [DateToStr(FechaAccidenteRecaida)]));  

  if fraEP_IDLESIONAGENTE.IsSelected then
  begin
    sSQL := 'SELECT 1 ' +
              'FROM SIN.SEP_ENFERMEDADPROFESIONAL ' +
             'WHERE EP_IDEXPEDIENTE = :V1 ' +
               'AND EP_IDLESIONAGENTE = :V2 ' +
               'AND EP_IDDIAGNOSTICO = :V3';

    if (sdqEnfermedadProfesional.State <> dsInsert) then
      sSQL := sSQL + ' AND ROWID <> ' + SQLValue(sdqEnfermedadProfesional.FieldByName('ROWID').AsString);

    Verificar(ExisteSQLEx(sSQL, [IdExpediente, fraEP_IDLESIONAGENTE.Value, fraEP_IDDIAGNOSTICO.Value]),
              fraEP_IDLESIONAGENTE.edCodigo, 'Ya se indicó la combinación de agente con diagnóstico indicado.');
  end else
  begin
    sSQL := 'SELECT 1 ' +
              'FROM SIN.SEP_ENFERMEDADPROFESIONAL ' +
             'WHERE EP_IDEXPEDIENTE = :V1 ' +
               'AND EP_IDDIAGNOSTICO = :V2';

    if (sdqEnfermedadProfesional.State <> dsInsert) then
      sSQL := sSQL + ' AND ROWID <> ' + SQLValue(sdqEnfermedadProfesional.FieldByName('ROWID').AsString);

    Verificar(ExisteSQLEx(sSQL, [IdExpediente, fraEP_IDDIAGNOSTICO.Value]), fraEP_IDDIAGNOSTICO.edCodigo, 'Ya se indicó este diagnóstico para el expediente activo.');
  end;

  with sdqEnfermedadProfesional do
  begin
    FieldByName('EP_IDEXPEDIENTE').AsInteger := IdExpediente;

    if dsEnfermedadProfesional.State in dsEditModes then
      Post;
    if UpdatesPending then
      ApplyUpdates;

    Close;
    Open;
  end;
end;

procedure TfrmDenunciaSTD.tbCancelarClick(Sender: TObject);
begin
  if dsEnfermedadProfesional.State in dsEditModes then
    sdqEnfermedadProfesional.Cancel;
  ActivarEP(False);
end;

procedure TfrmDenunciaSTD.sdqEnfermedadProfesionalAfterPost(DataSet: TDataSet);
begin
  ActivarEP(False);
end;

procedure TfrmDenunciaSTD.sdqEnfermedadProfesionalAfterCancel(DataSet: TDataSet);
begin
  ActivarEP(False);
end;

procedure TfrmDenunciaSTD.OnExit(Sender: TObject);
begin
  if (Sender is TControl) and (TColorControl(Sender).Color = clMoneyGreen) then
    TColorControl(Sender).Color := clWindow;
end;

procedure TfrmDenunciaSTD.OnEnter(Sender: TObject);
begin
  if (Sender is TControl) and (TColorControl(Sender).Color = clWindow) then
    TColorControl(Sender).Color := clMoneyGreen;
end;

procedure TfrmDenunciaSTD.fraDE_IDDIAGNOSTICOPropiedadesChange(Sender: TObject);
begin
//  if fraDE_IDDIAGNOSTICO1.Value <> fraDE_IDDIAGNOSTICO.Value then
//    fraDE_IDDIAGNOSTICO1.Value := fraDE_IDDIAGNOSTICO.Value;
end;

procedure TfrmDenunciaSTD.fraCDG_DIAGNOSTICO1PropiedadesChange(Sender: TObject);
begin
  if fraDE_IDDIAGNOSTICO1.IsSelected then
    fraDE_IDDIAGNOSTICO.Value := fraDE_IDDIAGNOSTICO1.Value;
end;

procedure TfrmDenunciaSTD.fraTipoSiniestroPropiedadesChange(Sender: TObject);
begin
  tsAC.TabVisible := not CanSaveCancel or not fraTipoSiniestro.EsEnfermedadProfesional;
  tsDP.TabVisible := not CanSaveCancel or not fraTipoSiniestro.EsEnfermedadProfesional;
  tsEP.TabVisible := not CanSaveCancel or fraTipoSiniestro.EsEnfermedadProfesional;
  rpDE_SUBTIPO.Enabled := not fraTipoSiniestro.EsEnfermedadProfesional;

  if fraTipoSiniestro.EsEnfermedadProfesional then
    rpDE_SUBTIPO.ItemIndex := -1;
end;

procedure TfrmDenunciaSTD.FSFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
{
  if CanSaveCancel and (Key = Ord('W')) and (ssAlt in Shift) then
  begin
    pgSolapas.ActivePage := tsEP;
    tbNuevo.Click;
  end else
}
  if (ssCtrl in Shift) and (ssShift in Shift) then
    case Key of
      Ord('N'): tbNuevoClick(nil);
      Ord('M'): tbModificarClick(nil);
      Ord('E'): tbEliminarClick(nil);
      Ord('G'): tbGuardarClick(nil);
      Ord('C'): tbCancelarClick(nil);
    end;

  inherited;
end;

procedure TfrmDenunciaSTD.GridEnfermedadesProfesionalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
{
  if CanSaveCancel and (Key = Ord('W')) and (ssAlt in Shift) then
  begin
    pgSolapas.ActivePage := tsEP;
    tbNuevo.Click;
  end else
}
  inherited;
end;

procedure TfrmDenunciaSTD.dsEnfermedadProfesionalUpdateData(Sender: TObject);
begin
  inherited;
  with sdqEnfermedadProfesional do
  begin
    FieldByName('EP_MODODETECCION').Value := fraEP_MODODETECCION.Value;
  end;
end;

procedure TfrmDenunciaSTD.edDE_DESCRIPCIONChange(Sender: TObject);
begin
  inherited;
  edDE_DESCRIPCION.Hint := edDE_DESCRIPCION.Text;
end;

procedure TfrmDenunciaSTD.rpDE_QUIENDENUNCIAChange(Sender: TObject);
begin
  inherited;
  case rpDE_QUIENDENUNCIA.ItemIndex of
    0: lbTextoDenuncia.Caption := 'Sin datos' + CRLF + 'sobre la' + CRLF + 'denuncia';
    1: lbTextoDenuncia.Caption := 'Denunciado' + CRLF + 'por el' + CRLF + 'trabajador';
    2: lbTextoDenuncia.Caption := 'Denunciado' + CRLF + 'por otra' + CRLF + 'persona';
  end;
end;

procedure TfrmDenunciaSTD.Print;
begin
  inherited;
  with TqrDenunciaStandardS.Create(Self) do
  try
    Imprimir(SiniestroCompleto, IdExpediente, Siniestro);
  finally
    Free;
  end;
end;

function TfrmDenunciaSTD.Esta_CuitEnEstablecimientoTemporal(IdExped: integer): boolean;    // TK 21228
var sSql: string;
begin
  sSql := 'SELECT 1 FROM sin.set_establecimiento_temporal ' +
          ' WHERE et_cuit = (SELECT ex_cuit FROM art.sex_expedientes ' +  // cuit del siniestro
                            ' WHERE ex_id = :idexp) ';

  Result := ExisteSqlEx(sSql, [IdExped]);
end;

procedure TfrmDenunciaSTD.rgEstablecimientoClick(Sender: TObject);  // TK 21228
begin
  if (rgEstablecimiento.ItemIndex = 3) and (not Esta_CuitEnEstablecimientoTemporal(FIdExpediente)) then
  begin
    MsgBox('No se puede seleccionar esta opción debido a que la empresa no posee Establecimientos de Terceros');
    rgEstablecimiento.ItemIndex := -1;
    rgEstablecimiento.SetFocus;  // Esto lo pongo porque al hacer el Close tiene el foco en el tercer ítem si paso por el evento Change del rgEstablecimiento, y pasa por aca dando el cartel al final.
  end;
end;

procedure TfrmDenunciaSTD.Do_CargarEstablecimientosTemporales;    // TK 21228
begin
  if (fpEstableciTemporales.ShowModal = mrOk) then
  begin
    with sdqEstableciTemporales, fraDomicilioEstablecimiento do
    begin
      edDE_UBICACION_NOMBRE.Text           := FieldByName('ET_NOMBRE').AsString;
      edUD_NROESTABLECIMIENTOAFIP.Text     := '';
      edDE_UBICACION_CODAREATELEFONOS.Text := '';
      edDE_UBICACION_TELEFONOS.Text        := FieldByName('ET_TELEFONOS').AsString;
      fraDE_UBICACION_PAIS.Codigo          := '054';
      edDE_UBICACION_CUITOCURRE.Text       := FieldByName('ET_CUIT_TEMPORAL').AsString;

      Calle        := FieldByName('ET_CALLE').AsString;
      Localidad    := FieldByName('ET_LOCALIDAD').AsString;
      Prov         := StrToIntDef(FieldByName('ET_PROVINCIA').AsString, -1);
      Provincia    := FieldByName('PROVINCIA').AsString;
      Numero       := IIF(FieldByName('ET_NUMERO').IsNull, 'S/N', FieldByName('ET_NUMERO').AsString);
      Piso         := FieldByName('ET_PISO').AsString;
      Departamento := FieldByName('ET_DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName('ET_CPOSTAL').AsString;
      CPA          := FieldByName('ET_CPOSTALA').AsString;

      vEstablecimientoTemp := FieldByName('ET_ID').AsInteger;
    end;
  end;
end;

procedure TfrmDenunciaSTD.btnAceptarEstTempClick(Sender: TObject);  // TK 21228
begin
  fpEstableciTemporales.ModalResult := mrOk;
end;

procedure TfrmDenunciaSTD.fpEstableciTemporalesBeforeShow(Sender: TObject);  // TK 21228
begin
  sdqEstableciTemporales.SQL.text :=
          'SELECT et_id, et_nroestableci, et_nombre, et_cuit_temporal, et_calle, et_numero, ' +
                ' et_piso, et_departamento, et_localidad, et_cpostal, et_provincia, ' +
                ' pv_descripcion provincia, et_cpostala, et_telefonos, et_cuit_temporal ' +
           ' FROM sin.set_establecimiento_temporal, art.cpv_provincias ' +
          ' WHERE et_provincia = pv_codigo ' +
            ' AND et_cuit = (SELECT ex_cuit FROM art.sex_expedientes ' +  // cuit del siniestro
                            ' WHERE ex_id = :idexp) ';

  OpenQueryEx(sdqEstableciTemporales, [FIdExpediente]);
end;

procedure TfrmDenunciaSTD.dbgEstableciTemporalesDblClick(Sender: TObject);   // TK 21228
begin
  fpEstableciTemporales.ModalResult := mrOk;
end;


procedure TfrmDenunciaSTD.Delete;
begin
  if MsgAsk('¿Está seguro que desea eliminar?' + CRLF + CRLF +
            'Tenga en cuenta que se generará un parte evolutivo con la información del mismo.') then
  begin
    sdqDatos.Delete;
    DoAplicarUpdates(sdqDatos);
    dsDatosStateChange(nil);
  end;
end;

end.
