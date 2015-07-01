unit unFrmObras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, IntEdit, Mask, ToolEdit, DateComboBox, GroupCheckBox,
  ComCtrls, Db, SDEngine, ToolWin, Grids, DBGrids, RXDBCtrl, ImgList,
  ImageComboBox, FormPanel, QueryPrint, QueryToFile, SortDlg, ExportDialog,
  ShortCutControl, unFraCtbTablas, unArtFrame, unFraCodigoDescripcion,
  PatternEdit, unArtDBAwareFrame, unArtDbFrame, unfraEstablecimientoDomic,
  unfraEstablecimiento, unfraContacto, unGestionEmpresasPreventor,unContratoContacto,
  unfraUsuarios, ArtComboBox, ArtDBGrid, VclExtra, DBClient,unPreventorAprobo,
  unRptResolucionSrt, unRptResolucionSrt51, unRptResolucionSRT51SinVisita, unProgramasdeSeguridad,
  unRptInformeProgSeg,unRptActividades, unRptActividades51, unSeleccionResponsableHYS,
  unDomicilio319, CheckLst, JvExCheckLst, JvCheckListBox, ARTCheckListBox,
  Placemnt, RxPlacemnt, RxToolEdit;

type
  TfrmObras = class(TForm)
    ScrollBox: TScrollBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    chgObraOtras: TCheckGroup;
    chgObraRedes: TCheckGroup;
    chgObraDuctos: TCheckGroup;
    chgObraMontInd: TCheckGroup;
    chgObraArq: TCheckGroup;
    chgObraIngCivil: TCheckGroup;
    edObraFechaRecepcion: TDateComboBox;
    edObraFechaDeclaracion: TDateComboBox;
    edObraNroPlantas: TIntEdit;
    edObraSuperficie: TIntEdit;
    edObraFechaFin: TDateComboBox;
    edObraFechaSusp: TDateComboBox;
    edObraFechaReinicio: TDateComboBox;
    grpObraActividad: TGroupBox;
    Label21: TLabel;
    Bevel3: TBevel;
    chgObraActividad: TCheckGroup;
    edObraActOtros: TEdit;
    edObraObservaciones: TMemo;
    Label1: TLabel;
    Bevel1: TBevel;
    fpCopiarEstableci: TFormPanel;
    BevelAbm: TBevel;
    btnCopEstAceptar: TButton;
    btnCopEstCancelar: TButton;
    fraEstabCopia: TfraEstablecimientoDomic;
    btnAnexo2Copiar: TButton;
    Label2: TLabel;
    edObraFechaExtension: TDateComboBox;
    lblRecep: TLabel;
    edRecep: TIntEdit;
    Label3: TLabel;
    edFechaVenProg: TDateComboBox;
    cbProgSeg: TCheckBox;
    Bevel2: TBevel;
    pnl4: TPanel;
    grbContacto: TGroupBox;
    fraContactoObra: TfraContacto;
    tsAvisoObra: TPageControl;
    tsAvisoObraInt: TTabSheet;
    lvAnexo2_A: TListView;
    tsProgramaDeSeg: TTabSheet;
    ToolBar2: TToolBar;
    Label6: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    lbDenunciaSrt: TLabel;
    cdsRegistros: TClientDataSet;
    dsConsulta: TDataSource;
    Panel2: TPanel;
    ToolBar5: TToolBar;
    tbEliminar: TToolButton;
    fraResolucionAvisoObra: TfraCodigoDescripcion;
    Label24: TLabel;
    ToolButton4: TToolButton;
    tbResolucion: TToolButton;
    ScrollBox1: TScrollBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    edFechaAprobado: TDateComboBox;
    edObservaciones: TMemo;
    edCantidadVisitas: TIntEdit;
    edPeriodicidad: TIntEdit;
    edFechaRecepcion: TDateComboBox;
    edCantidadTrabajadores: TIntEdit;
    edFechaRetiro: TDateComboBox;
    fraResolucion: TfraCodigoDescripcion;
    Grid: TArtDBGrid;
    ToolBar3: TToolBar;
    tbLimpiar: TToolButton;
    ToolBar4: TToolBar;
    tbGenerar: TToolButton;
    ToolButton3: TToolButton;
    tbLimpiarVisita: TToolButton;
    ToolButton5: TToolButton;
    tbMaxVisitas: TToolButton;
    ToolButton2: TToolButton;
    tbEliminarFechas: TToolButton;
    ToolBar6: TToolBar;
    btnCantPreventor: TToolButton;
    rgAplicaProg: TRadioGroup;
    cdsRegistrosIdVisita: TIntegerField;
    edFechaExtension: TDateComboBox;
    Label26: TLabel;
    edRetiro: TEdit;
    ToolBar7: TToolBar;
    tbCambioResolucion: TToolButton;
    fpCambioRecepcion: TFormPanel;
    Bevel4: TBevel;
    btnCopRecepAceptar: TButton;
    btnCopRecepCancelar: TButton;
    edCambRecep: TIntEdit;
    Label27: TLabel;
    edFechaInicio: TDateComboBox;
    Label4: TLabel;
    tbNuevo: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    tbProgramasSeguridad: TToolButton;
    cbFechaAnexo: TCheckBox;
    edFechaAnexo: TDateComboBox;
    Label28: TLabel;
    ToolButton8: TToolButton;
    tbInformeProg: TToolButton;
    fraAprobo: TfraCodigoDescripcion;
    ToolButton9: TToolButton;
    tbActividades: TToolButton;
    Label29: TLabel;
    edDescObra: TMemo;
    tbBuscarResponsableExistente: TToolButton;
    tbResposablesHys: TToolButton;
    tsDomicilio319: TTabSheet;
    cdsRegistrosObligatorio: TStringField;
    gbExcavacion: TGroupBox;
    edFechaExcavacion: TDateComboBox;
    edFechaExcavacionHasta: TDateComboBox;
    cbSubmuraciones: TCheckBox;
    cbSubsuelos: TCheckBox;
    Label30: TLabel;
    Label31: TLabel;
    gbDemolicion: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    edFechaDemolicionHasta: TDateComboBox;
    edFechaDemolicion: TDateComboBox;
    cbTotal: TCheckBox;
    cbParcial: TCheckBox;
    cdsRegistrosFecha: TDateTimeField;
    edFechaVisita: TDateComboBox;
    ToolBar8: TToolBar;
    tbAgregarVisita: TToolButton;
    cbDemolicion: TCheckBox;
    cbExcavacion: TCheckBox;
    cbCopia: TCheckBox;
    tsRechazo: TTabSheet;
    gbRechazoAvisoObra: TGroupBox;
    cbNoCorrespondePresentacion: TCheckBox;
    Label34: TLabel;
    edObservacionesRechazo: TMemo;
    cbRechazoAO: TCheckBox;
    cbIncompleto: TCheckBox;
    cbFaltanFirmas: TCheckBox;
    cbContratoInactivo: TCheckBox;
    edFechaRechazoAO: TDateComboBox;
    Label35: TLabel;
    GroupBox2: TGroupBox;
    Label36: TLabel;
    edFechaRechazoPS: TDateComboBox;
    cbRechazoPS: TCheckBox;
    clRechazosProgramaSeguridad: TARTCheckListBox;
    edUsuAltaAO: TEdit;
    lblDescripcion: TLabel;
    edFechaAltaAO: TDateComboBox;
    Label37: TLabel;
    edUsuAltaPS: TEdit;
    Label38: TLabel;
    edFechaAltaPS: TDateComboBox;
    Label39: TLabel;
    GroupBox1: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    edFechaExc503Hasta: TDateComboBox;
    edFechaExc503Desde: TDateComboBox;
    cbExcavacion503: TCheckBox;
    Label42: TLabel;
    edDetalleRes503: TEdit;
    lbDetalle: TLabel;
    cdsRegistrosFechaDesde: TDateTimeField;
    pnlboton: TPanel;
    btnProcesar: TButton;
    btnRechazar: TButton;
    tbImpresionFormularioAO: TToolButton;
    rgTipo: TRadioGroup;
    GroupBox3: TGroupBox;
    edCuitComitente: TMaskEdit;
    edRazonSocialComitente: TEdit;
    Label43: TLabel;
    Label45: TLabel;
    cbComitente: TCheckBox;
    GroupBox4: TGroupBox;
    Label44: TLabel;
    Label46: TLabel;
    edCuitContratista: TMaskEdit;
    edRazonSocialContratista: TEdit;
    cbContratista: TCheckBox;
    GroupBox5: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    edCuitSubcontratista: TMaskEdit;
    edRazonSocialSubContratista: TEdit;
    cbSubcontratista: TCheckBox;
    GroupBox6: TGroupBox;
    Label50: TLabel;
    edNombreResp: TEdit;
    edApellidoResp: TEdit;
    edCodAreaResp: TEdit;
    edTelefonoResp: TEdit;
    fraTipoTelResp: TfraCodigoDescripcion;
    Label53: TLabel;
    Label54: TLabel;
    edEmailResp: TEdit;
    Label55: TLabel;
    edTipoDocumentoResp: TEdit;
    Label56: TLabel;
    edNumeroDocumentoResp: TEdit;
    lbApellido: TLabel;
    lbTelefono: TLabel;
    fpMotivoRechazo: TFormPanel;
    Bevel5: TBevel;
    Label49: TLabel;
    btnAceptarCambioTipoPrev: TButton;
    btnCancelarCambioTipoPrev: TButton;
    fraMotivoRechazo: TfraCodigoDescripcion;
    tbEnvioMailAO: TToolButton;
    FormPlacement: TFormPlacement;
    cbFaltaFisico: TCheckBox;
    cbFormularioWeb: TCheckBox;
    edFechaRecepFormFisico: TDateComboBox;
    fraUsuarioRecepFormFisico: TfraUsuario;
    Label51: TLabel;
    Label52: TLabel;
    Label57: TLabel;
    cbRespSexoMasc: TCheckBox;
    cbRespSexoFem: TCheckBox;
    Panel1: TPanel;
    Label58: TLabel;
    GroupBox7: TGroupBox;
    fraContactoPS: TfraContacto;
    ToolBar9: TToolBar;
    tbAsignarResponsableHYSPS: TToolButton;
    tbBuscaResponsableExistentePS: TToolButton;
    tbResponsableHYSPS: TToolButton;
    cbExcavacion503VsitasPS: TCheckBox;

    procedure fpCopiarEstableciBeforeShow(Sender: TObject);
    procedure btnAnexo2CopiarClick(Sender: TObject);
    procedure btnCopEstAceptarClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure edObraFechaDeclaracionExit(Sender: TObject);
    procedure cbProgSegClick(Sender: TObject);
    procedure chgObraActividadClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMaxVisitasClick(Sender: TObject);
    procedure tbEliminarFechasClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnCantPreventorClick(Sender: TObject);
    procedure tbResolucionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbCambioResolucionClick(Sender: TObject);
    procedure btnCopRecepAceptarClick(Sender: TObject);
    procedure tsAvisoObraChange(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbProgramasSeguridadClick(Sender: TObject);
    procedure cbFechaAnexoClick(Sender: TObject);
    procedure tbInformeProgClick(Sender: TObject);
    procedure tbActividadesClick(Sender: TObject);
    procedure tbBuscarResponsableExistenteClick(Sender: TObject);
    procedure tbResposablesHysAOClick(Sender: TObject);
    procedure ScrollBoxMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBoxMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure edFechaExcavacionExit(Sender: TObject);
    procedure edFechaDemolicionExit(Sender: TObject);
    procedure tbAgregarVisitaClick(Sender: TObject);
    procedure cbRechazoAOClick(Sender: TObject);
    procedure cbRechazoPSClick(Sender: TObject);
    procedure clRechazosProgramaSeguridadClick(Sender: TObject);
    procedure cbIncompletoClick(Sender: TObject);
    procedure cbFaltanFirmasClick(Sender: TObject);
    procedure cbContratoInactivoClick(Sender: TObject);
    procedure chgObraIngCivilClick(Sender: TObject);
    procedure cdsRegistrosAfterPost(DataSet: TDataSet);
    procedure cdsRegistrosAfterDelete(DataSet: TDataSet);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnRechazarClick(Sender: TObject);
    procedure tbImpresionFormularioAOClick(Sender: TObject);
    procedure btnAceptarCambioTipoPrevClick(Sender: TObject);
    procedure tbEnvioMailAOClick(Sender: TObject);
    procedure cbFormularioWebClick(Sender: TObject);
    procedure tbAsignarResponsableHYSPSClick(Sender: TObject);
    procedure tbBuscaResponsableExistentePSClick(Sender: TObject);
    procedure tbResposablesHysClick(Sender: TObject);
  private
    FCuit             : String;
    FTipo             : String;
    FOperativo        : String;
    FEstableci        : Integer;
    FModificado       : Boolean;
    FAltaProg         : Boolean;
    FPSModificado     : Boolean;
    FSubmuraciones    : Boolean;
    FSubSuelo         : Boolean;
    FTotal            : Boolean;
    FParcial          : Boolean;
    FFaltaFisico      : Boolean;
    FFormularioWeb    : Boolean;
    FCarga            : Boolean;
    FCopia            : Boolean;
    FRequiereFecha    : Boolean;
    FExcavacionRes503 : Boolean;
    FComitente        : Boolean;
    FContratista      : Boolean;
    FSubContratista   : Boolean;
    FRespSexoFem      : Boolean;
    FRespSexoMasc      : Boolean;
    fechaExtensionInicial : TDate;
    frmDomicilio319 : TfrmDomicilio319;
    procedure setPSModificado(const Value: Boolean);
    procedure OnResolucionChange(Sender: TObject);
    procedure OnResolucionAvisoChange(Sender: TObject);
    function GetModified: Boolean;
    function GetModifiedProgSeg: Boolean;
    function GetModifiedRechazoAO: Boolean;
    function GetModifiedRechazoPS: Boolean;
    procedure SetModificado(const Value: Boolean);
    procedure SetModified(const Value: Boolean);
    procedure SetModifiedProgSeg(const Value: Boolean);
    procedure SetModifiedRechazoAO(const Value: Boolean);
    procedure SetModifiedRechazoPS(const Value: Boolean);
    function ObtenerPeriodicidadVisitas: Integer;
    procedure GuardarNroRecepcion;
    //procedure setModificadoRechazoAO(const Value: Boolean);
    //procedure setModificadoRechazoPS(const Value: Boolean);
  public
    FID           : String;
    FIDAOWeb      : Integer;
    FAOWEB319 : Boolean;
    ObraActividadCarga : String;
    FModifiedCronograma : Boolean;
    FContrato     : Integer;
    procedure ActivarPreventor;
    procedure Load(ACuit : String; AEstableci : Integer; ATipo, AOperativo : String);
    function Validar: boolean;
    function IsEmpty: boolean;
    procedure Save;
    procedure SaveArchivos;
    procedure SaveRechazo;
    procedure LoadRechazo;
    procedure SaveProgSeg;
    procedure SaveCronogramaVisitas;
    procedure LoadProgSeg;
    procedure Clear;
    procedure ClearProgSeg;
    procedure ClearDomicilio319;
    procedure ClearRechazo;
    function ValidarProgSeg : Boolean;
    function ValidarRechazoAO: Boolean;
    function ValidarRechazoPS: Boolean;
    procedure ExportarProgramaSeguridadAprobado;
    procedure ExportarResolucionPDFResolucion;
    procedure ExportarProgramaSeguridadRechazo;
    procedure ExportarAvisoObraRechazo;
    procedure SetDomModificado(Value : Boolean);
    procedure CargarAvisodeObraWeb(idavisoobraweb : Integer; ACuit : String; AEstableci : Integer; ATipo, AOperativo: String);
    property Modificado          : Boolean  read FModificado write setModificado;
    property PSModificado        : Boolean  read FPSModificado write setPSModificado;
  published
    property Modified           : Boolean  read GetModified        write SetModified;
    property ModifiedCronograma : Boolean  read FModifiedCronograma write FModifiedCronograma;
    property ModifiedProgSeg    : Boolean  read GetModifiedProgSeg write SetModifiedProgSeg;
    property ModifiedRechazoAO  : Boolean  read GetModifiedRechazoAO write SetModifiedRechazoAO;
    property ModifiedRechazoPS  : Boolean  read GetModifiedRechazoPS write SetModifiedRechazoPS;
  end;

implementation

uses unDmPrincipal, AnsiSql, SqlFuncs, unPrincipal, StrFuncs, CustomDlgs, General, Numeros, unFet,
     unCustomGridABM, unFraEmpresa, DateUtils, Math,unVisualizador, dateTimeFuncs, unFrmCargaDocumentacion,
     unConstantArchivo, unComunesArchivo, unArt, unUtilsArchivo,unMoldeEnvioMail, unSesion,
     unRptAvisoObraRechazado, unRptProgramaSeguridadRechazo,unRptProgramaSeguridadAprobado,ArchFuncs,
     unRptFormularioAvisoObra, CUIT, unComunesFet;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmObras }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.Clear;
begin
   edObraFechaRecepcion.Date    := 0;
   edObraFechaDeclaracion.Date  := 0;
   edObraSuperficie.Text        := '';
   edObraNroPlantas.Text        := '';

   edRecep.Clear;
   cbProgSeg.Checked := false;
   edFechaVenProg.Date := 0;
//   fraComitente.Clear;
   fraContactoObra.Clear;

   cbFormularioWeb.Checked := False;
   cbFaltaFisico.Checked := False;
   edFechaRecepFormFisico.Clear;
   fraUsuarioRecepFormFisico.Clear;
   chgObraIngCivil.Clear ;
   chgObraMontInd.Clear ;
   chgObraDuctos.Clear ;
   chgObraRedes.Clear ;
   chgObraOtras.Clear ;
   chgObraArq.Clear ;
   chgObraActividad.OnClick := nil;
   chgObraActividad.Clear ;
   chgObraActividad.OnClick := chgObraActividadClick;
   edFechaExcavacion.Clear;
   edFechaExcavacionHasta.Clear;
   edFechaDemolicion.Clear;
   edFechaDemolicionHasta.Clear;
   cbSubmuraciones.Checked := False;
   cbSubsuelos.Checked := False;
   cbTotal.Checked := False;
   cbParcial.Checked := False;
   cbExcavacion503.Checked := False;
   edFechaExc503Desde.Clear;
   edFechaExc503Hasta.Clear;
   edDetalleRes503.Clear;

   cbComitente.Checked := False;
   edCuitComitente.Clear;
   edRazonSocialComitente.Clear;
   cbContratista.Checked := False;
   edCuitContratista.Clear;
   edRazonSocialContratista.Clear;
   cbSubcontratista.Checked := False;
   edCuitSubcontratista.Clear;
   edRazonSocialSubContratista.Clear;
   edNombreResp.Clear;
   edApellidoResp.Clear;
   fraTipoTelResp.Clear;
   edCodAreaResp.Clear;
   edTelefonoResp.Clear;
   edEmailResp.Clear;
   edTipoDocumentoResp.Clear;
   edNumeroDocumentoResp.Clear;
   cbRespSexoMasc.Checked := False;
   cbRespSexoFem.Checked := False;


   fraResolucionAvisoObra.Clear;

   edObraActOtros.Text          := '';

   edObraFechaFin.Date          := 0;
   edObraFechaSusp.Date         := 0;
   edObraFechaReinicio.Date     := 0;
   edObraFechaExtension.Date    := 0;

   edObraObservaciones.Text     := '';

   SetModified( False );

end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObras.GetModified: Boolean;
begin
    Result := (edObraFechaRecepcion.Date   <> edObraFechaRecepcion.Tag) or
              (edObraFechaDeclaracion.Date <> edObraFechaDeclaracion.Tag) or
               edObraSuperficie.Modified or
               (edFechaVenProg.Date <> edFechaVenProg.Tag) or
//               edRecep.Modified or
//               fraComitente.Modified or
               fraContactoObra.Modified or
                fraResolucionAvisoObra.Modified or//and (edObraFechaRecepcion.Date > 0)) or //hago esto por si al cargar solo el PS tocan el frame de resolucion de obra
               edObraNroPlantas.Modified or
               (chgObraIngCivil.tag <> 0 ) or
               chgObraMontInd.Modified or
               chgObraDuctos.Modified or
               chgObraRedes.Modified or
               chgObraOtras.Modified or
               chgObraArq.Modified or
               chgObraActividad.Modified or
              (edFechaExcavacion.Date <> edFechaExcavacion.Tag) or
              (edFechaExcavacionHasta.Date <> edFechaExcavacionHasta.Tag) or
              (edFechaDemolicion.Date <> edFechaDemolicion.Tag) or
              (edFechaDemolicionHasta.Date <> edFechaDemolicionHasta.Tag) or
              (edFechaExc503Desde.Date <> edFechaExc503Desde.Tag) or
              (edFechaExc503Hasta.Date <> edFechaExc503Hasta.Tag) or
              edDetalleRes503.Modified or
              (cbExcavacion503.Checked <> FExcavacionRes503) or
              (cbSubmuraciones.Checked <> FSubmuraciones) or
              (cbSubsuelos.Checked <> FSubSuelo) or
              (cbTotal.Checked <> FTotal) or
              (cbParcial.Checked <> FParcial) or
              (cbFaltaFisico.Checked <> FFaltaFisico) or
              (cbFormularioWeb.Checked <> FFormularioWeb) or
              (edFechaRecepFormFisico.Date <> edFechaRecepFormFisico.Tag) or
              fraUsuarioRecepFormFisico.Modified or
               edObraActOtros.Modified or
              (edObraFechaFin.Date <> edObraFechaFin.Tag) or
              (edObraFechaSusp.Date <> edObraFechaSusp.Tag) or
              (edObraFechaReinicio.Date <> edObraFechaReinicio.Tag) or
              (edObraFechaExtension.Date <> edObraFechaExtension.Tag) or
              (cbComitente.Checked <> FComitente) or
              edCuitComitente.Modified or
              edRazonSocialComitente.Modified or
              (cbContratista.Checked <> FContratista) or
              edCuitContratista.Modified or
              edRazonSocialContratista.Modified or
              (cbSubcontratista.Checked <> FSubContratista) or
              (cbRespSexoMasc.Checked <> FRespSexoMasc) or
              (cbRespSexoFem.Checked <> FRespSexoFem) or
              edCuitSubcontratista.Modified or
              edRazonSocialSubContratista.Modified or
              edNombreResp.Modified or
              edApellidoResp.Modified or
              fraTipoTelResp.Modified or
              edCodAreaResp.Modified or
              edTelefonoResp.Modified or
              edEmailResp.Modified or
              edTipoDocumentoResp.Modified or
              edNumeroDocumentoResp.Modified;

    if result then
      Modificado := True;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.Load(ACuit : String; AEstableci : Integer; ATipo, AOperativo: String);
var
  sSql    : String;
  sdqObra : TSDQuery;
  sdqFechaVisita : TSDQuery;
begin
  tsAvisoObra.ActivePageIndex := 0;
  ScrollBox.VertScrollBar.Position := 0;
  tsAvisoObraInt.Font.Color := clWindowText;
  VCLExtra.LockControls(edRecep, true);
  VCLExtra.LockControls(fraResolucion,false);
//  with fraComitente do
//  begin
//    TableName   := 'hys.hoc_obrascomitente';
//    FieldID     := 'oc_id';
//    FieldCodigo := 'oc_id';
//    FieldDesc   := 'oc_descripcion';
//    Showbajas   := true;
//    FieldBaja   := 'oc_fechabaja';
//  end;

  with fraResolucionAvisoObra do
  begin
    TableName   := 'hys.hor_obrasresolucion';
    FieldID     := 'or_id';
    FieldCodigo := 'or_id';
    FieldDesc   := 'or_descripcion';
    Showbajas   := true;
    FieldBaja   := 'or_fechabaja';
    onChange    := OnResolucionAvisoChange;
  end;

  with fraResolucion do
  begin
    TableName   := 'hys.hor_obrasresolucion';
    FieldID     := 'or_id';
    FieldCodigo := 'or_id';
    FieldDesc   := 'or_descripcion';
    Showbajas   := true;
    FieldBaja   := 'or_fechabaja';
    OnChange    := OnResolucionChange;
  end;
  fraContactoObra.fraTelefonos.Initialize(False, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');


     FCuit      := ACuit;
     FEstableci := AEstableci;
     FTipo      := ATipo;
     FOperativo := AOperativo;

     LoadProgSeg;
     LoadRechazo;
     sSql := 'SELECT AO_FECHARECEPCION, AO_FECHAINICIO, AO_SUPERFICIE, AO_PLANTAS, ' +
                    'AO_INGENIERIACIVIL, AO_MONTAJEINDUSTIAL, AO_DUCTOS, AO_REDES, ' +
                    'AO_OTRAS, AO_ARQUITECTURA, AO_ACTIVIDAD, AO_ACTIVIDAD_OTROS, ' +
                    'AO_FECHAFINDEOBRA, AO_FECHASUSPENSION, AO_FECHAREINICIO, ' +
                    'AO_OBSERVACIONES, AO_OPERATIVO, AO_TIPO,  AO_FECHAEXTENSION, AO_RECEPCION, '+
                    'AO_FECHAVENCPROG, AO_CONTACTO, AO_REQUIEREPROG, AO_FECHABAJA, AO_NRORESOLUCION, ' +
                    'AO_FECHAEXCAVACION, AO_FECHADEMOLICION,AO_FECHAEXCAVACIONHASTA, AO_FECHADEMOLICIONHASTA, '+
                    'AO_SUBMURACIONES, AO_SUBSUELOS, AO_TOTAL, AO_PARCIAL, AO_USUALTA, AO_FECHAALTA, '+
                    'AO_EXCAVACION503, AO_FECHADESDEEXCAVACION503, AO_FECHAHASTAEXCAVACION503, '+
                    'AO_DETALLEEXCAVACION503,ao_comitenteweb, ao_cuitcomitente, '+
                    'ao_razonsocialcomitente, ao_contratista, '+
                    'ao_cuitcontratista, ao_razonsocialcontratista, '+
                    'ao_subcontratista, ao_cuitsubcontratista, '+
                    'ao_razonsocialsubcontratista, ao_nombreresp, '+
                    'ao_apellidoresp, ao_codarearesp, ao_telefonoresp, '+
                    'ao_tipotelefonoresp, ao_emailresp, ao_tipodocumentoresp, '+
                    'ao_numerodocumentoresp, ao_sexoresp, AO_TIPOFORMULARIO, AO_FALTAFISICO, '+
                    'ao_formularioweb, ao_fecharecepformfisico, ao_usurecepformfisico '+
               'FROM PAO_AVISOOBRA ' +
              'WHERE AO_CUIT = ''' + FCuit + ''' ' +
                'AND AO_ESTABLECI = ' +  IntToStr( FEstableci ) + ' ' +
//                'AND AO_TIPO = ''' + FTipo + ''' ' +
                'AND AO_OPERATIVO = (SELECT MAX(AO_OPERATIVO) ' +
                                    ' FROM PAO_AVISOOBRA PAO ' +
                                    ' WHERE PAO.AO_CUIT = ''' + FCuit + ''' ' +
                                    ' AND PAO.AO_ESTABLECI = ' +  IntToStr( FEstableci ) +  ')' ;
//                                    ' AND PAO.AO_TIPO = ''' + FTipo + ''' ' + ')' ;
//                'AND AO_OPERATIVO = ''' + FOperativo + ''' ';

     sdqObra := GetQuery( sSql );
     if Assigned(sdqObra) and sdqObra.Active and (not sdqObra.IsEmpty) Then begin
        FCarga                        := True;
        edObraFechaRecepcion.Date     := sdqObra.FieldByName( 'AO_FECHARECEPCION' ).AsDateTime;
        edObraFechaDeclaracion.Date   := sdqObra.FieldByName( 'AO_FECHAINICIO' ).AsDateTime;
        //if not edObraSuperficie.IsEmpty then
          edObraSuperficie.Value        := sdqObra.FieldByName( 'AO_SUPERFICIE' ).AsInteger;
        //if not edObraNroPlantas.IsEmpty then
          edObraNroPlantas.Value        := sdqObra.FieldByName( 'AO_PLANTAS' ).AsInteger;
        chgObraIngCivil.Value         := sdqObra.FieldByName( 'AO_INGENIERIACIVIL' ).AsString;
        chgObraMontInd.Value          := sdqObra.FieldByName( 'AO_MONTAJEINDUSTIAL' ).AsString;
        chgObraDuctos.Value           := sdqObra.FieldByName( 'AO_DUCTOS' ).AsString;
        chgObraRedes.Value            := sdqObra.FieldByName( 'AO_REDES' ).AsString;
        chgObraOtras.Value            := sdqObra.FieldByName( 'AO_OTRAS' ).AsString;
        chgObraArq.Value              := sdqObra.FieldByName( 'AO_ARQUITECTURA' ).AsString;

        ObraActividadCarga            := sdqObra.FieldByName( 'AO_ACTIVIDAD' ).AsString;
        if ObraActividadCarga[15] = 'S' then ObraActividadCarga[11] := 'S';
        chgObraActividad.Value        := copy(ObraActividadCarga, 1, 14);
        //chgObraActividad.Value        := sdqObra.FieldByName( 'AO_ACTIVIDAD' ).AsString;


        edObraActOtros.Text           := sdqObra.FieldByName( 'AO_ACTIVIDAD_OTROS' ).AsString;
        edObraFechaFin.Date           := sdqObra.FieldByName( 'AO_FECHAFINDEOBRA' ).AsDateTime;
        edObraFechaSusp.Date          := sdqObra.FieldByName( 'AO_FECHASUSPENSION' ).AsDateTime;
        edObraFechaReinicio.Date      := sdqObra.FieldByName( 'AO_FECHAREINICIO' ).AsDateTime;
        edObraFechaExtension.Date     := sdqObra.FieldByName( 'AO_FECHAEXTENSION' ).AsDateTime;
        edFechaExcavacion.Date        := sdqObra.FieldByName( 'AO_FECHAEXCAVACION' ).AsDateTime;
        edFechaDemolicion.Date        := sdqObra.FieldByName( 'AO_FECHADEMOLICION' ).AsDateTime;
        edFechaExc503Desde.Date       := sdqObra.FieldByName( 'AO_FECHADESDEEXCAVACION503' ).AsDateTime;
        edFechaExc503Hasta.Date       := sdqObra.FieldByName( 'AO_FECHAHASTAEXCAVACION503' ).AsDateTime;
        edDetalleRes503.Text          := sdqObra.FieldByName( 'AO_DETALLEEXCAVACION503' ).AsString;
        cbExcavacion503.Checked       := sdqObra.FieldByName( 'AO_EXCAVACION503' ).AsString = 'S';
        FExcavacionRes503             := sdqObra.FieldByName( 'AO_EXCAVACION503' ).AsString = 'S';

        fechaExtensionInicial         := sdqObra.FieldByName( 'AO_FECHAEXTENSION' ).AsDateTime;
        edObraObservaciones.Text      := sdqObra.FieldByName( 'AO_OBSERVACIONES' ).AsString;
        edFechaExcavacionHasta.Date   := sdqObra.FieldByName( 'AO_FECHAEXCAVACIONHASTA' ).AsDateTime;
        edFechaDemolicionHasta.Date   := sdqObra.FieldByName( 'AO_FECHADEMOLICIONHASTA' ).AsDateTime;
        cbSubmuraciones.Checked       := sdqObra.FieldByName( 'AO_SUBMURACIONES' ).AsString = 'S';
        FSubmuraciones                := sdqObra.FieldByName( 'AO_SUBMURACIONES' ).AsString = 'S';
        cbSubsuelos.Checked           := sdqObra.FieldByName( 'AO_SUBSUELOS' ).AsString = 'S';
        FSubSuelo                     := sdqObra.FieldByName( 'AO_SUBSUELOS' ).AsString = 'S';
        cbTotal.Checked               := sdqObra.FieldByName( 'AO_TOTAL' ).AsString = 'S';
        FTotal                        := sdqObra.FieldByName( 'AO_TOTAL' ).AsString = 'S';
        cbParcial.Checked             := sdqObra.FieldByName( 'AO_PARCIAL' ).AsString = 'S';
        FParcial                      := sdqObra.FieldByName( 'AO_PARCIAL' ).AsString = 'S';
        edFechaAltaAO.Date            := sdqObra.FieldByName( 'AO_FECHAALTA' ).AsDateTime;
        edUsuAltaAO.Text              := sdqObra.FieldByName( 'AO_USUALTA' ).AsString;

        cbProgSeg.Checked             := sdqObra.FieldByName( 'AO_REQUIEREPROG' ).AsString = 'S';
        edFechaVenProg.Date           := sdqObra.FieldByName( 'AO_FECHAVENCPROG' ).AsDateTime;
//        fraComitente.Codigo           := sdqObra.FieldByName( 'AO_COMITENTE' ).AsString;
        fraContactoObra.ContactoID        := sdqObra.FieldByName( 'AO_CONTACTO' ).AsInteger;
        fraResolucionAvisoObra.Codigo := sdqObra.FieldByName( 'AO_NRORESOLUCION' ).AsString;

        cbComitente.Checked              := sdqObra.FieldByName( 'AO_COMITENTEWEB' ).AsString = 'S';
        FComitente                       := cbComitente.Checked;
        edCuitComitente.Text             := sdqObra.FieldByName( 'AO_CUITCOMITENTE' ).AsString;
        edRazonSocialComitente.Text      := sdqObra.FieldByName( 'AO_RAZONSOCIALCOMITENTE' ).AsString;
        cbContratista.Checked            := sdqObra.FieldByName( 'AO_CONTRATISTA' ).AsString = 'S';
        FContratista                     := cbContratista.Checked;
        edCuitContratista.Text           := sdqObra.FieldByName( 'AO_CUITCONTRATISTA' ).AsString;
        edRazonSocialContratista.Text    := sdqObra.FieldByName( 'AO_RAZONSOCIALCONTRATISTA' ).AsString;
        cbSubcontratista.Checked         := sdqObra.FieldByName( 'AO_SUBCONTRATISTA' ).AsString = 'S';
        FSubContratista                  := cbSubcontratista.Checked;
        edCuitSubcontratista.Text        := sdqObra.FieldByName( 'AO_CUITSUBCONTRATISTA' ).AsString;
        edRazonSocialSubContratista.Text := sdqObra.FieldByName( 'AO_RAZONSOCIALSUBCONTRATISTA' ).AsString;
        edNombreResp.Text                := sdqObra.FieldByName( 'AO_NOMBRERESP' ).AsString;
        edApellidoResp.Text              := sdqObra.FieldByName( 'AO_APELLIDORESP' ).AsString;
        fraTipoTelResp.Codigo            := sdqObra.FieldByName( 'AO_TIPOTELEFONORESP' ).AsString;
        edCodAreaResp.Text               := sdqObra.FieldByName( 'AO_CODAREARESP' ).AsString;
        edTelefonoResp.Text              := sdqObra.FieldByName( 'AO_TELEFONORESP' ).AsString;
        edEmailResp.Text                 := sdqObra.FieldByName( 'AO_EMAILRESP' ).AsString;
        edTipoDocumentoResp.Text         := sdqObra.FieldByName( 'AO_TIPODOCUMENTORESP' ).AsString;
        edNumeroDocumentoResp.Text       := sdqObra.FieldByName( 'AO_NUMERODOCUMENTORESP' ).AsString;
        cbRespSexoMasc.Checked           := sdqObra.FieldByName( 'AO_SEXORESP' ).AsString = 'M';
        cbRespSexoFem.Checked            := sdqObra.FieldByName( 'AO_SEXORESP' ).AsString = 'F';

        if sdqObra.FieldByName( 'AO_TIPOFORMULARIO' ).AsString = 'AO' then
          rgTipo.ItemIndex :=0
        else if sdqObra.FieldByName( 'AO_TIPOFORMULARIO' ).AsString = 'E' then
          rgTipo.ItemIndex :=1
        else if sdqObra.FieldByName( 'AO_TIPOFORMULARIO' ).AsString = 'S' then
          rgTipo.ItemIndex :=2
        else if sdqObra.FieldByName( 'AO_TIPOFORMULARIO' ).AsString = 'SD' then
          rgTipo.ItemIndex :=3
        else
          rgTipo.ItemIndex :=-1;

        cbFaltaFisico.Checked := sdqObra.FieldByName( 'AO_FALTAFISICO' ).AsString = 'S';
        FFaltaFisico := cbFaltaFisico.Checked;
        cbFormularioWeb.Checked := sdqObra.FieldByName( 'AO_FORMULARIOWEB' ).AsString = 'S';
        FFormularioWeb := cbFormularioWeb.Checked;
        cbFormularioWebClick(nil);
        edFechaRecepFormFisico.Date := sdqObra.FieldByName( 'ao_fecharecepformfisico' ).AsDateTime;
        fraUsuarioRecepFormFisico.Cargar(sdqObra.FieldByName('ao_usurecepformfisico').AsString);

        if sdqObra.FieldByName('AO_FECHABAJA').IsNull Then
          tsAvisoObraInt.Font.Color := clWindowText
        else
          tsAvisoObraInt.Font.Color := clRed;

        FOperativo                 := sdqObra.FieldByName('AO_OPERATIVO').AsString;
        FTipo                      := sdqObra.FieldByName('AO_TIPO').AsString;
        FCarga                     := False;
        {---[ Carga las Otras Solapas ]----------------------------------------}
     end else
        Clear;

     edRecep.Text := ValorSql('SELECT ar_nrorecepcion '+
                              '  FROM hys.har_avisoobranrorecepcion '+
                              ' WHERE ar_cuit = '+SqlValue(FCuit)+
                              '   AND ar_estableci = '+SqlValue(FEstableci)+
                              '   AND ar_fechabaja IS NULL');

     if(fraResolucion.IsEmpty and not fraResolucionAvisoObra.IsEmpty) then
       fraresolucion.Codigo := fraResolucionAvisoObra.Codigo
     else if(fraResolucionAvisoObra.IsEmpty and not fraResolucion.IsEmpty) then
       fraResolucionAvisoObra.Codigo := fraResolucion.Codigo;
     chgObraActividadClick(nil);
     OnResolucionChange(nil);
     SetModified( False );

    sdqFechaVisita := GetQuery(
        ' SELECT fv_fecha, fv_idvisita, fv_obligatorio, fv_fechadesde '+
        '   FROM hys.hfv_fechasvisitas '+
        '  WHERE fv_cuit ='+ SqlValue(FCuit)+
        '    AND fv_estableci = '+SqlValue(FEstableci)+ ' ORDER BY fv_fecha' );

    if Assigned(sdqFechaVisita) and sdqFechaVisita.Active and (not sdqFechaVisita.IsEmpty) Then
    begin
      cdsRegistros.EmptyDataSet;
      while not sdqFechaVisita.Eof do
      begin
        cdsRegistros.Append;
        cdsRegistros.FieldByName('Fecha').AsDateTime := sdqFechaVisita.FieldByName('fv_fecha').AsDateTime;
        cdsRegistros.FieldByName('Idvisita').AsInteger := sdqFechaVisita.FieldByName('fv_idvisita').AsInteger;
        cdsRegistros.FieldByName('Obligatorio').AsString := sdqFechaVisita.FieldByName('fv_obligatorio').AsString;
        cdsRegistros.FieldByName('FechaDesde').AsDateTime := sdqFechaVisita.FieldByName('fv_fechadesde').AsDateTime;
        cdsRegistros.Post;
        sdqFechaVisita.Next;
      end;
    end;
  FModifiedCronograma := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.Save;
Var Sql : TSql;
    Actividad : string;
    idobra : Integer;
    sEmpresa, sContrato, sCuit, sDescCiuu, sTipoObra,sDomicilio, sMailResp, sMailDestino,sMailContacto, sMailAlta :String;
begin
    if not ValidarProgSeg and ModifiedProgSeg then Exit;
    if not IsEmpty and GetModified Then begin
        Sql := TSql.Create( 'PAO_AVISOOBRA' );
        try
           { Primary Key }
           Sql.PrimaryKey.Add( 'AO_CUIT', FCuit );
           Sql.PrimaryKey.Add( 'AO_ESTABLECI', FEstableci );
           Sql.PrimaryKey.Add( 'AO_TIPO', FTipo );
//           if (trim(FOperativo) = '') then
             Sql.PrimaryKey.Add( 'AO_OPERATIVO', FOperativo );
//           else
//             Sql.PrimaryKey.Add( 'AO_OPERATIVO', FOperativo );
           { Campos }
           Sql.Fields.Add( 'AO_FECHARECEPCION', edObraFechaRecepcion.Date );
           Sql.Fields.Add( 'AO_FECHAINICIO', edObraFechaDeclaracion.Date );
           Sql.Fields.AddDate( 'AO_FECHAEXCAVACION', edFechaExcavacion.Date,True );
           Sql.Fields.AddDate( 'AO_FECHADEMOLICION', edFechaDemolicion.Date,True );

           Sql.Fields.AddString( 'AO_EXCAVACION503', IIF(cbExcavacion503.Checked,'S','N') );
           Sql.Fields.AddDate( 'AO_FECHADESDEEXCAVACION503', edFechaExc503Desde.Date,True );
           Sql.Fields.AddDate( 'AO_FECHAHASTAEXCAVACION503', edFechaExc503Hasta.Date,True );
           Sql.Fields.Add( 'AO_DETALLEEXCAVACION503', edDetalleRes503.Text);

           Sql.Fields.AddDate( 'AO_FECHAEXCAVACIONHASTA', edFechaExcavacionHasta.Date,True );
           Sql.Fields.AddDate( 'AO_FECHADEMOLICIONHASTA', edFechaDemolicionHasta.Date,True );
           Sql.Fields.AddString( 'AO_SUBMURACIONES', IIF(cbSubmuraciones.Checked,'S','N') );
           Sql.Fields.AddString( 'AO_SUBSUELOS', IIF(cbSubsuelos.Checked,'S','N') );
           Sql.Fields.AddString( 'AO_TOTAL', IIF(cbTotal.Checked,'S','N') );
           Sql.Fields.AddString( 'AO_PARCIAL', IIF(cbParcial.Checked,'S','N') );
           Sql.Fields.Add( 'AO_SUPERFICIE', edObraSuperficie.Value );
           Sql.Fields.Add( 'AO_PLANTAS', edObraNroPlantas.Value );
           Sql.Fields.Add( 'AO_INGENIERIACIVIL', chgObraIngCivil.Value );
           Sql.Fields.Add( 'AO_MONTAJEINDUSTIAL', chgObraMontInd.Value );
           Sql.Fields.Add( 'AO_DUCTOS', chgObraDuctos.Value );
           Sql.Fields.Add( 'AO_REDES', chgObraRedes.Value );
           Sql.Fields.Add( 'AO_OTRAS', chgObraOtras.Value );
           Sql.Fields.Add( 'AO_ARQUITECTURA', chgObraArq.Value );
           Sql.Fields.Add( 'AO_ACTIVIDAD', chgObraActividad.Value );
           Sql.Fields.Add( 'AO_ACTIVIDAD_OTROS', edObraActOtros.Text );
           Sql.Fields.Add( 'AO_FECHAFINDEOBRA', edObraFechaFin.Date );
           Sql.Fields.Add( 'AO_FECHASUSPENSION', edObraFechaSusp.Date );
           Sql.Fields.Add( 'AO_FECHAREINICIO', edObraFechaReinicio.Date );
           Sql.Fields.Add( 'AO_OBSERVACIONES', edObraObservaciones.Text );
           Sql.Fields.Add( 'AO_FECHAEXTENSION', edObraFechaExtension.Date );
           Sql.Fields.Add( 'AO_NRORESOLUCION', fraResolucionAvisoObra.Codigo );

           Sql.Fields.AddString( 'AO_COMITENTEWEB', IIF(cbComitente.Checked,'S','N') );
           Sql.Fields.Add( 'AO_CUITCOMITENTE', edCuitComitente.Text );
           Sql.Fields.Add( 'AO_RAZONSOCIALCOMITENTE', edRazonSocialComitente.Text );
           Sql.Fields.AddString( 'AO_CONTRATISTA', IIF(cbContratista.Checked,'S','N') );
           Sql.Fields.Add( 'AO_CUITCONTRATISTA', edCuitContratista.Text );
           Sql.Fields.Add( 'AO_RAZONSOCIALCONTRATISTA', edRazonSocialContratista.Text );
           Sql.Fields.AddString( 'AO_SUBCONTRATISTA', IIF(cbSubcontratista.Checked,'S','N') );
           Sql.Fields.Add( 'AO_CUITSUBCONTRATISTA', edCuitSubcontratista.Text );
           Sql.Fields.Add( 'AO_RAZONSOCIALSUBCONTRATISTA', edRazonSocialSubContratista.Text );
           Sql.Fields.Add( 'AO_NOMBRERESP', edNombreResp.Text );
           Sql.Fields.Add( 'AO_APELLIDORESP', edApellidoResp.Text );
           Sql.Fields.Add( 'AO_TIPOTELEFONORESP', fraTipoTelResp.Codigo );
           Sql.Fields.Add( 'AO_CODAREARESP', edCodAreaResp.Text );
           Sql.Fields.Add( 'AO_TELEFONORESP', edTelefonoResp.Text );
           Sql.Fields.Add( 'AO_EMAILRESP', edEmailResp.Text );
           Sql.Fields.Add( 'AO_TIPODOCUMENTORESP', edTipoDocumentoResp.Text );
           Sql.Fields.Add( 'AO_NUMERODOCUMENTORESP', edNumeroDocumentoResp.Text );
           if cbRespSexoMasc.Checked then
             Sql.Fields.Add( 'AO_SEXORESP', 'M')
           else if cbRespSexoFem.Checked then
             Sql.Fields.Add( 'AO_SEXORESP', 'F')
           else
             Sql.Fields.Add( 'AO_SEXORESP', exNull);

//           Sql.Fields.Add( 'AO_RECEPCION', edRecep.Text );
           Sql.Fields.Add( 'AO_FECHAVENCPROG', edFechaVenProg.Date );
//           Sql.Fields.Add( 'AO_COMITENTE', fraComitente.Codigo );
           Sql.Fields.Add( 'AO_CONTACTO', fraContactoObra.ContactoID );
           if rgTipo.ItemIndex = 0 then
             Sql.Fields.Add( 'AO_TIPOFORMULARIO', 'AO' )
           else if rgTipo.ItemIndex = 1 then
             Sql.Fields.Add( 'AO_TIPOFORMULARIO', 'E' )
           else if rgTipo.ItemIndex = 2 then
             Sql.Fields.Add( 'AO_TIPOFORMULARIO', 'S' )
           else if rgTipo.ItemIndex = 3 then
             Sql.Fields.Add( 'AO_TIPOFORMULARIO', 'SD' );

           Sql.Fields.AddString( 'AO_FALTAFISICO', IIF(cbFaltaFisico.Checked,'S','N') );
           Sql.Fields.AddString( 'ao_formularioweb', IIF(cbFormularioWeb.Checked,'S','N') );
           Sql.Fields.Add( 'ao_fecharecepformfisico', edFechaRecepFormFisico.Date );
           Sql.Fields.Add( 'ao_usurecepformfisico', fraUsuarioRecepFormFisico.UserID);

           Actividad := chgObraActividad.Value;

           if cbProgSeg.Checked then
              Sql.Fields.Add( 'AO_REQUIEREPROG', 'S')
           else
              Sql.Fields.Add( 'AO_REQUIEREPROG', 'N');

           if ExisteSql('SELECT 1 FROM PAO_AVISOOBRA ' + Sql.Where ) Then begin
              Sql.SqlType := stUpdate;
              Sql.Fields.Add( 'AO_FECHAMODIF', exDateTime );
              Sql.Fields.Add( 'AO_USUMODIF', frmPrincipal.dbLogin.UserId );
              Sql.Fields.Add( 'AO_FECHABAJA', exNull );
              Sql.Fields.Add( 'AO_USUBAJA', exNull );
              tsAvisoObraInt.Font.Color := clWindowText;
           end else begin
              Sql.SqlType := stInsert;
              Sql.Fields.Add( 'AO_FECHAALTA', exDateTime );
              Sql.Fields.Add( 'AO_USUALTA', frmPrincipal.dbLogin.UserId );
           end;

           Actividad := chgObraActividad.Value;
           if (Actividad[1] = 'S') or (Actividad[2] = 'S') or (Actividad[9] = 'S') or (Actividad[11] = 'S') or
              (Actividad[12] = 'S') or (Actividad[13] = 'S') or (Actividad[14] = 'S') or (cbExcavacion503.Checked) then
//              (Actividad[15] = 'S')

                Sql.Fields.Add( 'AO_INFORMARSRT', 'S')
           else
                Sql.Fields.Add( 'AO_INFORMARSRT', 'N');
           Try
              if (Sql.SqlType = stInsert) then
              begin
                GuardarNroRecepcion;
              end;

              EjecutarSqlST( Sql.Sql );

              SetModified( False );
           Except
              On E: Exception do
                 Raise Exception.Create( 'Error al guardar los Aviso de Obra' + #13 + E.Message );
           end;
        finally
            Sql.Free ;
        end;
    end;

    if (FIDAOWeb > 0) and not FAOWEB319 then
    begin
      idobra := ValorSqlIntegerEx('SELECT AO_ID FROM PAO_AVISOOBRA a WHERE AO_CUIT = :cuit AND AO_ESTABLECI = :estableci AND AO_FECHABAJA IS NULL '+
                                  'AND AO_OPERATIVO = (SELECT MAX(AO_OPERATIVO) FROM PAO_AVISOOBRA PAO WHERE PAO.AO_CUIT = a.ao_cuit AND PAO.AO_ESTABLECI = a.AO_ESTABLECI)', [FCuit, FEstableci]);
      EjecutarSqlST('UPDATE hys.haw_avisoobraweb '+
                    '   SET aw_idavisoobra = '+SqlValue(idobra)+','+
                    '       AW_ESTABLECI = '+SqlValue(FEstableci)+','+
                    '       aw_usumodif = '+SqlValue(Sesion.UserID)+','+
                    '       aw_fechamodif = SYSDATE '+
                    ' WHERE aw_id = '+SqlValue(FIDAOWeb));
      tbEnvioMailAO.Click;

    end;

    if faoweb319 then
    begin
       with GetQuery(
        'SELECT em_nombre, co_contrato, em_cuit, ac_descripcion, '+
        '       DECODE(ao_tipoformulario, '+
        '              ''AO'', ''Obra'', '+
        '              ''E'', ''Extensión'', '+
        '              ''S'', ''Suspensión'', '+
        '              ''SD'', ''Suspensión Definitiva'', '+
        '              ''M'', ''Modificación Aviso de Obra'') ao_tipoformulario, '+
        '       AO_EMAILRESP, '+
        '       (SELECT ct_direlectronica FROM afi.act_contacto WHERE ct_id = ao_contacto) mailcontacto '+
        '  FROM afi.aco_contrato, afi.aem_empresa, afi.aes_establecimiento, comunes.cac_actividad, art.pao_avisoobra '+
        ' WHERE em_cuit = '+SqlValue(FCuit)+
        '   AND es_nroestableci =  '+SqlValue(FEstableci)+
        '   AND co_contrato = art.get_vultcontrato(em_cuit) '+
        '   AND co_idempresa = em_id '+
        '   AND co_contrato = es_contrato '+
        '   AND es_idactividad = ac_id '+
        '   AND ao_estableci = es_nroestableci '+
        '   AND ao_cuit = em_cuit ') do
      try
        sEmpresa      := FieldByName('em_nombre').AsString;
        sContrato     := FieldByName('co_contrato').AsString;
        sCuit         := FieldByName('em_cuit').AsString;
        sDescCiuu     := FieldByName('ac_descripcion').AsString;
        sTipoObra     := FieldByName('ao_tipoformulario').AsString;

        sMailResp     := FieldByName('AO_EMAILRESP').AsString;
        sMailContacto := FieldByName('mailcontacto').AsString;
      finally
        Free;
      end;
      with GetQuery(
        'SELECT art.utiles.armar_domicilio (aw_calle, aw_numero, NULL, NULL, art.utiles.armar_localidad (aw_cpostal, '+
        '       '''', aw_localidad, aw_provincia), '''') domic, '+
        '       CASE WHEN aw_usualta LIKE ''%@%'' THEN aw_usualta ELSE NULL END mailalta '+
        '  FROM hys.haw_avisoobraweb '+
        ' WHERE aw_id = '+SqlValue(FIDAOWeb)
        ) do
      try
        sDomicilio    := FieldByName('domic').AsString;
        sMailAlta    := FieldByName('mailalta').AsString;
      finally
        free;
      end;

      sMailDestino := '';
      if sMailResp <> '' then
      begin
        if smaildestino = '' then
          sMailDestino := sMailResp
        else
          sMailDestino := sMailDestino+','+sMailResp;
      end;
      if sMailContacto <> '' then
      begin
        if smaildestino = '' then
          sMailDestino := sMailContacto
        else
          sMailDestino := sMailDestino+','+sMailContacto;
      end;
      if sMailAlta <> '' then
      begin
        if smaildestino = '' then
          sMailDestino := sMailAlta
        else
          sMailDestino := sMailDestino+','+sMailAlta;
      end;
       EnviarMailBD(sMailDestino,'Aviso de Obra Recepcionado',[oAlwaysShowDialog,oBodyIsRTF],
                '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}'+
                '\viewkind4\uc1\pard\lang11274\b\f0\fs20Sres. '+sEmpresa+'\par '+
                '\fs20 Contrato: '+sContrato+'  \tab\tab\tab CUIT: '+sCuit+'\b0\par '+
                'CIUU \''f3n, reforma y reparaci\''f3n de redes\par '+
                'Ref : Aviso de Obra Res. 319/99 Recepcionado.\par \par '+
                'De nuestra consideraci\''f3n:\par \par '+
                'Por el presente le informamos que el \b Aviso de Obra Res. 319/99\b0  ha sido RECEPCIONADO oportunamente, para la direcci\''f3n de \b '+sDomicilio+'\b0 .\par \par '+
                'Tenga en cuenta que Seg\''fan Res. SRT 319/199, Anexo II \lang1033\f1\endash\lang11274\f0  3) La ART correspondiente recibir\''e1 y aprobar\''e1 los programas de seguridad '+
                'conforme a lo establecido en la Resoluci\''f3n SRT N\lang1033\f1\''b0\lang11274\f0  51/97, con la salvedad de que dicha aprobaci\''f3n para el caso de los trabajos repetitivos '+
                'y corta duraci\''f3n, tendr\''e1 una validez de seis (6) meses, pudiendo extender la vigencia de la validez por un nuevo periodo de la misma duraci\''f3n, previa solicitud '+
                'y actualizaci\''f3n del empleador.\par \par '+
                'Este mismo documento le sirve a ud., como acuse de recibo ante la presentaci\''f3n y recepci\''f3n de los documentos a los cuales aqu\''ed se hace referencia.\par \par '+
                '\b Atte. \par Gerencia Prevenci\''f3n \par \pard\b0\i0\f2\fs22\par \par \b0} ',nil,0,tcDefault, false);

    end;

    if (FModifiedCronograma or ((edObraFechaExtension.Date <> fechaExtensionInicial) and (fraResolucion.value in [2,3]))) and (edRecep.Text <> '') then
      SaveCronogramaVisitas;

    if ((FModificado) or (FPSModificado) or (frmDomicilio319.DomModificado)) and (edRecep.Text <> '') then
      SaveArchivos;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.SetModified(const Value: Boolean);
begin
   edObraSuperficie.Modified    := Value;
   edObraNroPlantas.Modified    := Value;

   edRecep.Modified             := Value;
   edFechaVenProg.Modified      := Value;
//   fraComitente.Modified        := Value;
   fraContactoObra.Modified         := Value;
   fraUsuarioRecepFormFisico.Modified := Value;
   if value then
     chgObraIngCivil.Tag          := 1
   else
     chgObraIngCivil.Tag          := 0;
   chgObraIngCivil.Modified     := Value;
   chgObraMontInd.Modified      := Value;
   chgObraDuctos.Modified       := Value;
   chgObraRedes.Modified        := Value;
   chgObraOtras.Modified        := Value;
   chgObraArq.Modified          := Value;
   chgObraActividad.Modified    := Value;
   edObraActOtros.Modified      := Value;
   edDetalleRes503.Modified     := Value;
   edObraObservaciones.Modified := Value;
   edDetalleRes503.Modified     := Value;


   if not Value Then begin
      edObraFechaRecepcion.Tag     := Trunc( edObraFechaRecepcion.Date );    // La fecha se guarda en la parte entera
      edObraFechaDeclaracion.Tag   := Trunc( edObraFechaDeclaracion.Date );  // en la decimal se guarda la hora

      edFechaVenProg.Tag           := Trunc( edFechaVenProg.Date );

      edObraFechaFin.Tag           := Trunc( edObraFechaFin.Date );
      edObraFechaSusp.Tag          := Trunc( edObraFechaSusp.Date );
      edObraFechaReinicio.Tag      := Trunc( edObraFechaReinicio.Date );
      edObraFechaExtension.Tag     := Trunc( edObraFechaExtension.Date );
      edFechaExcavacion.Tag        := Trunc( edFechaExcavacion.Date );
      edFechaExc503Desde.Tag       := Trunc( edFechaExc503Desde.Date );
      edFechaExc503Hasta.Tag       := Trunc( edFechaExc503Hasta.Date );
      edFechaDemolicion.Tag        := Trunc( edFechaDemolicion.Date );
      edFechaExcavacionHasta.Tag   := Trunc( edFechaExcavacionHasta.Date );
      edFechaDemolicionHasta.Tag   := Trunc( edFechaDemolicionHasta.Date );
      edFechaRecepFormFisico.Tag   := Trunc( edFechaRecepFormFisico.Date );
      FSubmuraciones               := cbSubmuraciones.Checked;
      FSubSuelo                    := cbSubsuelos.Checked;
      FTotal                       := cbTotal.Checked;
      FParcial                     := cbParcial.Checked;
      FFaltaFisico                 := cbFaltaFisico.Checked;
      FFormularioWeb               := cbFormularioWeb.Checked; 
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.fpCopiarEstableciBeforeShow(Sender: TObject);
begin
  fraEstabCopia.CUIT           := FCuit;
  fraEstabCopia.ExtraCondition := ' AND ST_CLAVE <> ' + SqlInt(FEstableci) + ' ';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.btnAnexo2CopiarClick(Sender: TObject);
Var sSql : String;
begin
  if fpCopiarEstableci.ShowModal = mrOk Then begin
     sSql := 'SELECT 1 ' +
               'FROM PAO_AVISOOBRA ' +
              'WHERE AO_CUIT = ' +  SqlValue(FCuit) +
                'AND AO_ESTABLECI = ' + fraEstabCopia.edCodigo.TextSql + ' ' +
                'AND AO_TIPO = ' + SqlValue(FTipo);
     if not ExisteSql( sSql ) Then
        MsgBox( 'No se encontraron datos para copiar', MB_ICONERROR )
     else begin
        Try
          sSql := 'INSERT INTO PAO_AVISOOBRA (ao_cuit, ao_estableci, ao_fecharecepcion, ao_fechainicio, ' +
                                             'ao_superficie, ao_plantas, ao_ingenieriacivil, ' +
                                             'ao_montajeindustial, ao_ductos, ao_redes, ao_otras, ' +
                                             'ao_arquitectura, ao_actividad, ao_actividad_otros, ' +
                                             'ao_fechafindeobra, ao_fechasuspension, ao_fechareinicio, ' +
                                             'ao_fechaalta, ao_usualta, ' +
                                             'ao_fechaexport, ao_usuexport, ao_tipo, ao_operativo, ' +
                                             'ao_observaciones, ao_fechaextension,ao_recepcion,ao_fechavencprog,'+
                                             'ao_contacto,ao_requiereprog) ' +
                  'SELECT AO_CUIT, ' + SqlValue(FEstableci)  + ', ao_fecharecepcion, ao_fechainicio, ' +
                         'ao_superficie, ao_plantas, ao_ingenieriacivil, ' +
                         'ao_montajeindustial, ao_ductos, ao_redes, ao_otras, ' +
                         'ao_arquitectura, ao_actividad, ao_actividad_otros, ' +
                         'ao_fechafindeobra, ao_fechasuspension, ao_fechareinicio, ' +
                         'sysdate, ' + SqlValue(frmPrincipal.dbLogin.UserId) + ',' +
                         'null, null, ao_tipo, ' + SqlValue(FOperativo) + ',' +
                         'ao_observaciones, ao_fechaextension, (select max(ao_recepcion)+1 from PAO_AVISOOBRA),'+
                         'ao_fechavencprog,ao_contacto,ao_requiereprog ' +
                    'FROM PAO_AVISOOBRA ' +
                   'WHERE AO_CUIT = ' + SqlValue(FCuit) +
                     'AND AO_ESTABLECI = ' + fraEstabCopia.edCodigo.TextSql + ' ' +
                     'AND AO_TIPO = ' + SqlValue(FTipo);
          EjecutarSqlST( sSql );
        except
          Raise;
        end;

         Load(FCuit, FEstableci, FTipo, FOperativo);
     end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.btnCopEstAceptarClick(Sender: TObject);
begin
   if fraEstabCopia.IsEmpty Then
      InvalidMsg( fraEstabCopia.edCodigo, 'Debe seleccionar un establecimiento' )

   else if fraEstabCopia.edCodigo.Value = FEstableci Then
      InvalidMsg( fraEstabCopia.edCodigo, 'No puede copiar datos del mismo establecimiento' )

   else
      fpCopiarEstableci.ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObras.Validar: boolean;
var
  fechaDiasHabiles : TDate;
begin
  if Modified then
  begin
    result := not ((chgObraIngCivil.SelCount = 0) and
                   (chgObraArq.SelCount = 0) and
                   (chgObraMontInd.SelCount = 0) and
                   (chgObraDuctos.SelCount = 0) and
                   (chgObraRedes.SelCount = 0) and
                   (chgObraOtras.SelCount = 0)
                  );
    if result then
      if cbProgSeg.Checked and (edFechaVenProg.Date = 0) then
        Result := false;
    if not result and cbProgSeg.Checked and (edFechaVenProg.Date = 0) then
      InvalidMsg(ScrollBox, 'Se requiere fecha de vencimiento de programa.')
    else
    if not result then
      InvalidMsg(ScrollBox, 'Debe especificar el tipo de obra.');

    if fraResolucionAvisoObra.Value <> 1 then
      Verificar(edObraSuperficie.text = '',edObraSuperficie,'La superficie no puede estar vacia.' );
    Verificar(edObraNroPlantas.text = '' ,edObraNroPlantas,'La cantidad de plantas no puede estar vacio.' );
    if Result and (edFechaDemolicion.Date <> 0) and((edFechaExcavacion.Date <= edFechaDemolicion.Date) and (edFechaExcavacionHasta.Date >= edFechaDemolicion.Date))  then
    begin
      if MsgBox('La fecha de demolición se superpone con la de excavación ¿Desea continuar con la grabacion del Aviso de obra?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES then
        Result := True
      else
        Result := False;
  end;

  end
  else result := true;

    Verificar(
      ExisteSql(
                 'SELECT  1 '
              + '  FROM  afi.aem_empresa, '
              + '        afi.aes_establecimiento, '
              + '        afi.aco_contrato, '
              + '        art.pao_avisoobra '
              + ' WHERE  em_cuit = ' + SqlValue(FCuit)
              + '    AND es_nroestableci = ' + SqlValue(FEstableci)
              + '    AND es_eventual = ''N'' '
              + '    AND em_id = co_idempresa '
              + '    AND co_contrato = es_contrato '
              + '    AND es_contrato = art.get_vultcontrato (em_cuit) '
              + '    AND es_fechabaja IS NULL '
              + '    AND ao_cuit = em_cuit '
              + '    AND ao_estableci = es_nroestableci '
              + '    AND ao_fechabaja IS NULL '),
              tsAvisoObraInt,
              'Debe ser eventual el establecimiento.');


  Verificar(edObraFechaRecepcion.Date > DBDate,edObraFechaRecepcion,'La fecha de recepción no puede ser mayor a hoy.');
  Verificar(not cbFaltaFisico.Checked and cbFormularioWeb.Checked and (edFechaRecepFormFisico.Date = 0),edFechaRecepFormFisico,'Debe completar la fecha de recepción de formulario físico.');
  Verificar(not cbFaltaFisico.Checked and cbFormularioWeb.Checked and not(fraUsuarioRecepFormFisico.IsSelected),fraUsuarioRecepFormFisico,'Debe completar el usuario de recepción de formulario físico.');
  Verificar((edObraFechaRecepcion.date <> 0) and (edObraFechaRecepcion.Date < ValorSqlDateTime('SELECT TO_DATE(''01/01/1996'', ''DD/MM/YYYY'') FROM DUAL')),edObraFechaDeclaracion,'La fecha de recepción no puede ser menor a 1996.');
  Verificar((edObraFechaDeclaracion.date <> 0) and (edObraFechaDeclaracion.Date < ValorSqlDateTime('SELECT TO_DATE(''01/01/1996'', ''DD/MM/YYYY'') FROM DUAL')),edObraFechaDeclaracion,'La fecha de inicio no puede ser menor a 1996.');
  Verificar(edObraFechaFin.Date = 0, edObraFechaFin, 'Debe ingresar la fecha de finalización de la obra.');
  Verificar(not fraResolucionAvisoObra.IsSelected, fraResolucionAvisoObra, 'Debe ingresar la resolución de la obra.');
  Verificar((edObraFechaSusp.date <> 0) and (edObraFechaReinicio.date <> 0) and   (edObraFechaReinicio.Date < edObraFechaSusp.Date), edObraFechaReinicio, 'La fecha de reinicio no puede ser menor a la fecha de suspensión.');
  Verificar((edObraFechaFin.date <> 0) and   (edObraFechaFin.Date < edObraFechaDeclaracion.Date), edObraFechaFin, 'La fecha de fin de obra no puede ser menor a la fecha de inicio.');
  Verificar((edObraFechaSusp.date <> 0) and   (edObraFechaSusp.Date < edObraFechaDeclaracion.Date), edObraFechaSusp, 'La fecha de fin de suspensión no puede ser menor a la fecha de inicio.');
  if edCuitComitente.Text <> '' then
    Verificar(not IsCuit(edCuitComitente.Text),edCuitComitente,'Debe ingresar un cuit valido.');
  if edCuitContratista.Text <> '' then
    Verificar(not IsCuit(edCuitContratista.Text),edCuitContratista,'Debe ingresar un cuit valido.');
  if edCuitSubcontratista.Text <> '' then
    Verificar(not IsCuit(edCuitSubcontratista.Text),edCuitSubcontratista,'Debe ingresar un cuit valido.');

  if edObraFechaExtension.Date <> 0 then
  begin
    Verificar(edObraFechaExtension.Date < edObraFechaDeclaracion.Date, edObraFechaExtension, ' La fecha de extension no puede ser menor a la declarada.');
  end;

  Verificar(ExisteSql(' SELECT DISTINCT 1 '+
                      '   FROM hys.hrl_relevriesgolaboral '+
                      '  WHERE rl_contrato = art.get_vultcontrato ('+SqlValue(FCuit)+')'+
                      '    AND rl_estableci = '+SqlValue(FEstableci)+
                      '    AND rl_idresolucionanexo IN(1, 3) '+
                      '    AND rl_valido = ''S'' '+
                      '    AND rl_fechabaja IS NULL '), edObraFechaRecepcion,'Tiene cargado un RGRL del tipo A o C no puede cargarle un aviso de obra.');

  Verificar(ExisteSql(' SELECT DISTINCT 1 '+
                      '   FROM hys.hrl_relevriesgolaboral '+
                      '  WHERE rl_contrato = art.get_vultcontrato ('+SqlValue(FCuit)+')'+
                      '    AND rl_estableci = '+SqlValue(FEstableci)+
                      '    AND rl_idresolucionanexo IN(2) '+
                      '    AND rl_valido = ''S'' '+
                      '    AND MONTHS_BETWEEN('+SqlValue(edObraFechaFin.Date)+', '+SqlValue(edObraFechaDeclaracion.Date)+') < 12 '+
                      '    AND rl_fechabaja IS NULL '), edObraFechaRecepcion,'Tiene cargado un RGRL de tipo B y la no es mayor a un año el aviso de obra.');

  if not ExisteSql('SELECT 1 FROM PAO_AVISOOBRA WHERE AO_FECHAALTA <= TO_DATE(''23/06/2011'',''DD/MM/YYYY'') AND AO_CUIT = '+SqlValue(FCuit)+' AND AO_ESTABLECI ='+SqlValue(FEstableci)+
              ' AND AO_TIPO = '+SqlValue(FTipo) +' AND AO_OPERATIVO = '+SqlValue(FOperativo)) THEN
  begin
    Verificar((chgObraActividad.Value[1] = 'S') and (edFechaExcavacion.Date = 0),edFechaExcavacion,'Debe Ingresar Fecha de Excavación.');
    Verificar((chgObraActividad.Value[1] = 'S') and (edFechaExcavacionHasta.Date = 0),edFechaExcavacionHasta,'Debe Ingresar Fecha de Excavación.');
    Verificar((chgObraActividad.Value[2] = 'S') and (edFechaDemolicion.Date = 0),edFechaDemolicion,'Debe Ingresar Fecha de Demolición.');
    Verificar((chgObraActividad.Value[2] = 'S') and (edFechaDemolicionHasta.Date = 0),edFechaDemolicionHasta,'Debe Ingresar Fecha de Demolición.');
  end;


  if not ExisteSql('SELECT 1 FROM PAO_AVISOOBRA WHERE AO_CUIT = '+SqlValue(FCuit)+' AND AO_ESTABLECI ='+SqlValue(FEstableci)+
               ' AND AO_TIPO = '+SqlValue(FTipo) +' AND AO_OPERATIVO = '+SqlValue(FOperativo)) THEN
  begin
    if lbDenunciaSrt.Visible then
    begin
      fechaDiasHabiles := ValorSqlDateTime('SELECT art.amebpba.calcdiashabiles(art.actualdate,-2) FROM dual ');
      if result then
        if (edObraFechaRecepcion.Date < fechaDiasHabiles) then
        begin
          if MsgBox('¿La fecha de recepcion es mas antigua que 2 días de la fecha actual Desea Guardar el Aviso de obra?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES then
            Result := True
          else
            Result := False;
        end;
    end
    else
      Verificar(edObraFechaRecepcion.Date < DBDate - 60, edObraFechaRecepcion, 'La fecha no puede ser mas antigua que 2 meses del dia de hoy.');

    if result then
      if (edObraFechaDeclaracion.Date < (DBDate - 30)) or (edObraFechaDeclaracion.Date > (DBDate + 30)) then
        if MsgBox('¿La fecha de declaración es menor o mayor a un mes de la fecha actual Desea Guardar el Aviso de obra?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES then
          Result := True
        else
          Result := False;
    if result then
      if (edObraFechaFin.Date > AddYears(DBDate ,2 ) ) then
        if MsgBox('¿La fecha de fin es mayor a 2 años de la fecha actual Desea Guardar el Aviso de obra?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES then
          Result := True
        else
          Result := False;
  end;
  ValidarProgSeg;
  ValidarRechazoAO;
  ValidarRechazoPS;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObras.IsEmpty: boolean;
begin
  result := edObraFechaRecepcion.IsEmpty and
            (edObraSuperficie.IsEmpty or (edObraNroPlantas.Value = 0)) and
            edObraFechaDeclaracion.IsEmpty and
            ((edObraNroPlantas.Text = '') or (edObraNroPlantas.Value = 0)) and
            edObraFechaFin.IsEmpty and
            edObraFechaSusp.IsEmpty and
            edObraFechaReinicio.IsEmpty;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.ToolButton1Click(Sender: TObject);
var
  idcontactohys : Integer;
begin
 //idcontacto := fraContacto.ContactoID;
 with TfrmContratoContacto.Create(Self) do
  try
    AutoCommit := false;
    DoCargar(FCuit, FContrato);
    SelectCargoContacto := '01090';

    ShowModal;

    idcontactohys := ValorSqlInteger(
      ' SELECT ct_id '+
      '   FROM act_contacto, aco_contrato '+
      '  WHERE ct_cargo = ''01090'' '+
      '    AND co_contrato = '+IntToStr(FContrato)+
      '    AND ct_idempresa = co_idempresa '+
      '    AND ct_fechabaja IS NULL' );
  finally
    Free;
  end;
  if idcontactohys = 0 then
    fraContactoObra.Clear
  else
    fraContactoObra.ContactoID := idcontactohys;
  fraContactoObra.Modified := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.edObraFechaDeclaracionExit(Sender: TObject);
begin
{  if ExisteSql(
    ' SELECT 1 '+
    '   FROM pao_avisoobra '+
    '  WHERE ao_cuit = '+SqlValue(FCuit)+
    '    AND ao_recepcion IS NOT NULL') then
      edRecep.Text := IntToStr(IncSql(
        ' SELECT distinct ao_recepcion '+
        '   FROM pao_avisoobra '+
        '  WHERE ao_cuit = '+SqlValue(FCuit)+
        '    AND ao_recepcion IS not NULL',0))
  else
    edRecep.Text := IntToStr(IncSql(
        ' SELECT NVL (MAX (ao_recepcion), 0) '+
        '   FROM pao_avisoobra '+
        '  WHERE ao_recepcion IS NOT NULL '));
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.cbProgSegClick(Sender: TObject);
begin
  if cbProgSeg.Checked and (edObraFechaRecepcion.Date <> 0) then
    edFechaVenProg.Date := edObraFechaRecepcion.Date + 10;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObras.GetModifiedProgSeg: Boolean;
begin
    Result := fraResolucion.Modified or
              (edFechaAprobado.Date <> edFechaAprobado.Tag) or
              (edFechaRetiro.Date <> edFechaRetiro.Tag) or
              fraAprobo.Modified or
              fraContactoPS.Modified or
              edRetiro.Modified or
              edObservaciones.Modified or
              edDescObra.Modified or
              edCantidadTrabajadores.Modified or
              (edFechaRecepcion.Date <> edFechaRecepcion.Tag) or
              (edFechaExtension.Date <> edFechaExtension.Tag) or
              ((edObraFechaExtension.Date <> fechaExtensionInicial) and
              ExisteSql(
                '  SELECT 1 '+
                '  FROM hys.hps_programaseguridad '+
                ' WHERE ps_cuit = '+SqlValue(FCuit)+
                '   AND ps_establecimiento = '+sqlvalue(FEstableci)+
                '   AND ps_resolucion in (2,3) '+
                '   AND ps_fecharecepcion = (SELECT max(ps_fecharecepcion)'+
                '                              FROM hys.hps_programaseguridad '+
                '                             WHERE ps_cuit = '+SqlValue(FCuit)+
                '                               AND ps_establecimiento = '+SqlValue(FEstableci)+')')) or
              (edFechaInicio.Date <> edFechaInicio.Tag) or
              (edFechaAnexo.Date <> edFechaAnexo.Tag) or
              (cbCopia.Checked <> FCopia) or
              (cbFechaAnexo.Checked <> FRequiereFecha);

    if result then
      PSModificado := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.SetModifiedProgSeg(const Value: Boolean);
begin

  fraResolucion.Modified     := Value;
  fraresolucionavisoobra.modified := Value;
  fraAprobo.Modified         := Value;
  edRetiro.Modified          := Value;
  fraContactoPS.Modified     := Value;
  edObservaciones.Modified   := Value;
  edDescObra.Modified        := Value;
//  edCantidadVisitas.Modified := Value;

  if not Value Then begin
     edFechaAprobado.Tag     := Trunc( edFechaAprobado.Date );    // La fecha se guarda en la parte entera
     edFechaRetiro.Tag       := Trunc( edFechaRetiro.Date );
     edFechaRecepcion.Tag    := Trunc( edFechaRecepcion.Date );
     edFechaExtension.Tag    := Trunc( edFechaExtension.Date );
     edFechaInicio.Tag       := Trunc( edFechaInicio.Date );
     edFechaAnexo.Tag        := Trunc( edFechaAnexo.Date)
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.SaveProgSeg;
Var
  SqlProg : TSql;
  direccionmail : String;
  body : String;
begin
  if GetModifiedProgSeg Then begin
    SqlProg := TSql.Create( 'HYS.HPS_PROGRAMASEGURIDAD' );
    try
      { Primary Key }
      cdsRegistros.DisableControls;
      SqlProg.PrimaryKey.Add( 'PS_CUIT', FCuit );
      //if(rgAplicaProg.ItemIndex = 1)then
      SqlProg.PrimaryKey.Add( 'PS_ESTABLECIMIENTO', FEstableci );
      { Campos }
      SqlProg.Fields.Add( 'PS_RESOLUCION', fraResolucion.Codigo );
      SqlProg.Fields.Add( 'PS_FECHAAPROBADO', edFechaAprobado.Date );
      SqlProg.Fields.Add( 'PS_FECHARETIRO', edFechaRetiro.Date );
      SqlProg.Fields.Add( 'PS_FECHAINICIO', edFechaInicio.Date );
      SqlProg.Fields.Add( 'PS_APROBO', fraAprobo.Value );
      SqlProg.Fields.Add( 'PS_RETIRO', edRetiro.Text );
      SqlProg.Fields.Add( 'PS_OBSERVACIONES', edObservaciones.Text );
      SqlProg.Fields.Add( 'PS_DESCOBRAS', edDescObra.Text );
//      SqlProg.Fields.Add( 'PS_CANTVISITAS', edCantidadVisitas.Text );
      SqlProg.Fields.Add( 'PS_CANTTRABAJADORES', edCantidadTrabajadores.Text );
      SqlProg.Fields.Add( 'PS_FECHARECEPCION', edFechaRecepcion.Date );
      SqlProg.Fields.Add( 'PS_FECHAEXTENSION', edFechaExtension.Date );
      SqlProg.Fields.Add( 'PS_FECHAANEXO', edFechaAnexo.Date );
      SqlProg.Fields.Add( 'PS_CONTACTO', fraContactoPS.ContactoID );
      if cbFechaAnexo.Checked then
        SqlProg.Fields.Add( 'PS_REQUIEREFECHAANEXO', 'S' )
      else
        SqlProg.Fields.Add( 'PS_REQUIEREFECHAANEXO', 'N' );

      if cbCopia.Checked then
      begin
        SqlProg.Fields.Add( 'PS_COPIA', 'S' );
        if (FID <> '') and
            ExisteSql('SELECT 1 '+
                      '  FROM hys.hps_programaseguridad '+
                      ' WHERE ps_fechacopia IS NULL '+
                      '   AND ps_id = '+SqlValue(FID)) then
        begin
          SqlProg.Fields.Add( 'PS_FECHACOPIA', exDateTime );
          SqlProg.Fields.Add( 'PS_REENVIOAVISOCOPIA', 'N' );
          direccionmail := ValorSql(
            ' SELECT prev.it_email || NVL2(prev.it_email, '','' || cor.it_email, cor.it_email) '+
            '   FROM art.pit_firmantes prev, art.pit_firmantes cor '+
            '  WHERE prev.it_idsupervisor = cor.it_id '+
            '    AND prev.it_id = '+SqlValue(fraAprobo.Value));

          if direccionmail <> '' then
            direccionmail := direccionmail + ','+ Sesion.UserMail
          else
            direccionmail := Sesion.UserMail;

          body := 'CUIT:'+FCuit+#13#10+
                  'RAZON SOCIAL:'+ValorSql(
                                  ' SELECT em_nombre '+
                                  '   FROM afi.aem_empresa '+
                                  '  WHERE em_cuit = '+ SqlValue(FCUIT))+#13#10+
                  'ESTABLECIMIENTO:'+IntToStr(FEstableci)+#13#10+
                  'DIRECCIÓN:'+ValorSql(
                                ' SELECT art.afi.armar_domicilio(es_calle, es_numero, '+
                                '        es_piso, es_departamento, es_localidad) || '' '' || pv_descripcion '+
                                '   FROM afi.aes_establecimiento, art.cpv_provincias '+
                                '  WHERE es_nroestableci = '+SqlValue(FEstableci)+
                                '    AND es_provincia = pv_codigo '+
                                '    AND es_contrato = art.get_vultcontrato('+SqlValue(FCuit)+')'
                               )+#13#10+
                  'FECHA DE APROBADO:'+DateToStr(edFechaAprobado.Date)+#13#10+
                  'APROBÓ:'+fraAprobo.Descripcion+#13#10;



          EnviarMailBD(direccionmail,'Adeuda programa de seguridad ORIGINAL',[oAutoFirma, oDeleteAttach],
                       Body, nil, 0, tcDefault, False)
        end;
      end
      else
        SqlProg.Fields.Add( 'PS_COPIA', 'N' );

      if FID <> '' then begin
         SqlProg.SqlType := stUpdate;
         SqlProg.PrimaryKey.Add( 'PS_ID', FID);
         SqlProg.Fields.Add( 'PS_FECHAMODIF', exDateTime );
         SqlProg.Fields.Add( 'PS_USUMODIF', frmPrincipal.dbLogin.UserId );
         SqlProg.Fields.Add( 'PS_FECHABAJA', exNull );
         SqlProg.Fields.Add( 'PS_USUBAJA', exNull );
         tsProgramaDeSeg.Font.Color := clWindowText;
      end else begin
         SqlProg.SqlType := stInsert;
         if not ExisteSql(' SELECT 1 FROM hys.har_avisoobranrorecepcion '+
               '  WHERE AR_CUIT = '+SqlValue(FCuit)+
               '    AND AR_ESTABLECI = '+SqlValue(FEstableci)) then
         begin
           GuardarNroRecepcion;
         end;
         FID := IntToStr(GetSecNextVal('hys.SEQ_HPS_ID'));
         if fraResolucion.Codigo = '1' then
           SqlProg.Fields.Add( 'PS_ESTABLECIMIENTO319', FEstableci );
         SqlProg.Fields.Add( 'PS_ID',FID );
         SqlProg.Fields.Add( 'PS_FECHAALTA', exDateTime );
         SqlProg.Fields.Add( 'PS_USUALTA', frmPrincipal.dbLogin.UserId );
      end;

      if not fraResolucion.IsEmpty and (edFechaRecepcion.Date <> 0) then
      begin
        try
          EjecutarSqlST( SqlProg.Sql );
        except
           On E: Exception do
              Raise Exception.Create( 'Error al guardar los Programas de Seguridad' + #13 + E.Message );
        end;
      end;

    finally
      SqlProg.Free;
      cdsRegistros.EnableControls;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.LoadProgSeg;
Var  sSql : String;
     sdqProgSeg : TSDQuery;
begin
     sSql := 'SELECT ps_id, ps_cuit, ps_establecimiento, ps_resolucion, ps_fechaaprobado,ps_fecharetiro, '+
             '       ps_aprobo, ps_retiro, ps_observaciones,ps_descobras, ps_cantvisitas,ps_canttrabajadores,'+
             '       ps_fecharecepcion, ps_fechabaja,ps_fechaextension,ps_fechainicio, ps_requierefechaanexo, '+
             '       ps_fechaanexo,ps_copia, ps_fechaalta, ps_usualta, ps_contacto '+
             '  FROM hys.hps_programaseguridad '+
             ' WHERE ps_cuit = '+SqlValue(FCuit)+
             '   AND ps_establecimiento = '+sqlvalue(FEstableci)+
             '   and ps_fecharecepcion = (SELECT max(ps_fecharecepcion)'+
             '                              FROM hys.hps_programaseguridad '+
             '                             WHERE ps_cuit = '+SqlValue(FCuit)+
             '                               AND ps_establecimiento = '+SqlValue(FEstableci)+')';

     fraContactoPS.fraTelefonos.Initialize(False, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');
     sdqProgSeg := GetQuery( sSql );
     if Assigned(sdqProgSeg) and sdqProgSeg.Active and (not sdqProgSeg.IsEmpty) Then begin
        FID                              := sdqProgSeg.FieldByName( 'PS_ID' ).AsString;
        fraResolucion.Codigo             := sdqProgSeg.FieldByName( 'PS_RESOLUCION' ).AsString;
        edFechaAprobado.Date             := sdqProgSeg.FieldByName( 'PS_FECHAAPROBADO' ).AsDateTime;
        edFechaRetiro.Date               := sdqProgSeg.FieldByName( 'PS_FECHARETIRO' ).AsDateTime;
        fraAprobo.Value                  := sdqProgSeg.FieldByName( 'PS_APROBO' ).AsInteger;
        edRetiro.Text                    := sdqProgSeg.FieldByName( 'PS_RETIRO' ).AsString;
        edObservaciones.Text             := sdqProgSeg.FieldByName( 'PS_OBSERVACIONES' ).AsString;
        edDescObra.Text                  := sdqProgSeg.FieldByName( 'PS_DESCOBRAS' ).AsString;
        //edCantidadVisitas.Text         := sdqProgSeg.FieldByName( 'PS_CANTVISITAS' ).AsString;
        edCantidadTrabajadores.Text      := sdqProgSeg.FieldByName( 'PS_CANTTRABAJADORES' ).AsString;
        edFechaRecepcion.Date            := sdqProgSeg.FieldByName( 'PS_FECHARECEPCION' ).AsDateTime;
        edFechaExtension.Date            := sdqProgSeg.FieldByName( 'PS_FECHAEXTENSION' ).AsDateTime;
        edFechaInicio.Date               := sdqProgSeg.FieldByName( 'PS_FECHAINICIO' ).AsDateTime;
        edFechaAnexo.Date                := sdqProgSeg.FieldByName( 'PS_FECHAANEXO' ).AsDateTime;
        cbFechaAnexo.Checked             := sdqProgSeg.FieldByName( 'PS_REQUIEREFECHAANEXO' ).AsString = 'S';
        FRequiereFecha                   := cbFechaAnexo.Checked;
        edUsuAltaPS.Text                 := sdqProgSeg.FieldByName( 'PS_USUALTA' ).AsString;
        edFechaAltaPS.Date               := sdqProgSeg.FieldByName( 'PS_FECHAALTA' ).AsDateTime;
        cbCopia.Checked                  := sdqProgSeg.FieldByName( 'PS_COPIA' ).AsString = 'S';
        fraContactoPS.ContactoID         := sdqProgSeg.FieldByName( 'PS_CONTACTO' ).AsInteger;
        FCopia                           := cbCopia.Checked;

        if sdqProgSeg.FieldByName( 'PS_RESOLUCION' ).AsString = '1' then
        begin
          frmDomicilio319.FIDProgramaSeguridad :=  sdqProgSeg.FieldByName('PS_ID').AsInteger;
        end;

        if sdqProgSeg.FieldByName('PS_FECHABAJA').IsNull Then
          tsProgramaDeSeg.Font.Color := clWindowText
        ELSE
          tsProgramaDeSeg.Font.Color := clRed;

        rgAplicaProg.ItemIndex  := 1;
        OnResolucionChange(nil);
     end else
       FID := '';
     cbFechaAnexoClick(nil);
     frmDomicilio319.tbRefrescarClick(nil);
     SetModifiedProgSeg( False );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.ClearProgSeg;
begin
   edFechaAprobado.Date := 0;
   edCantidadVisitas.Clear;
   fraResolucion.Clear;
   edCantidadTrabajadores.Clear;
   edFechaExtension.Clear;
   edFechaInicio.Clear;
   edFechaRecepcion.Clear;
   edFechaRetiro.Date := 0;
   fraAprobo.Clear;
   edRetiro.Clear;
   edFechaAnexo.Clear;
   cbFechaAnexo.Checked := False;
   edObservaciones.Clear;
   edDescObra.Clear;
   rgAplicaProg.ItemIndex := -1;
   btnLimpiarClick(nil);
   edFechaVisita.Clear;
   cbExcavacion.Checked := False;
   cbDemolicion.Checked := False;
   cbExcavacion503VsitasPS.Checked := False;
   cbFechaAnexo.Checked := False;
   fraContactoPS.Clear;
   cbCopia.Checked := False;
   FCopia := False;
   FRequiereFecha := False;
   SetModifiedProgSeg(False);
end;

procedure TfrmObras.ClearRechazo;
begin
  cbRechazoAO.Checked := False;
   cbRechazoAO.OnClick(nil);
   cbNoCorrespondePresentacion.Checked := False;
   edObservacionesRechazo.Clear;
   edFechaRechazoAO.Clear;
   edFechaRechazoAO.Tag := 0;
   edFechaRechazoPS.Clear;
   edFechaRechazoPS.Tag := 0;
   cbRechazoPS.Checked := False;
   cbRechazoPS.OnClick(nil);
   cbRechazoAO.Tag := 0;
   cbIncompleto.Tag := 0;
   cbFaltanFirmas.Tag := 0;
   cbContratoInactivo.Tag := 0;
   cbRechazoPS.Tag := 0;
   clRechazosProgramaSeguridad.Tag := 0;
   clRechazosProgramaSeguridad.UncheckAll;
   SetModifiedRechazoAO(False);
   SetModifiedRechazoPS(False);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmObras.ValidarProgSeg: Boolean;
begin
  if ModifiedProgSeg then
  begin
    result := {((edFechaRetiro.IsEmpty and (edRetiro.Text = '')) or
              (not edFechaRetiro.IsEmpty and not (edRetiro.Text = '')))and}
              not ((edFechaAprobado.Date <> 0) and fraResolucion.IsEmpty) and
              not (not (edRetiro.Text = '') and fraResolucion.IsEmpty) and
              not ((edObservaciones.Text<>'') and fraResolucion.IsEmpty) and
           //   not ((edCantidadVisitas.Text<>'') and fraResolucion.IsEmpty)and
              not((edFechaInicio.date= 0)and not edFechaInicio.ReadOnly) and
              not (edFechaRecepcion.Date > DBDate) and
              (edFechaRecepcion.Date <> 0) and not fraResolucion.IsEmpty;

    if (edFechaExtension.Date <> 0) and (edFechaInicio.Date > edFechaExtension.Date) then
    begin
      result := false;
      InvalidMsg(edFechaExtension, 'La fecha de inicio debe ser mayor que la fecha de recepción.');
    end;

    if (edFechaInicio.date = 0) and not (edFechaInicio.ReadOnly) then
      InvalidMsg(edFechaInicio, 'Se debe completar la fecha de inicio del Programa de seguridad.');
    //  if not ((edFechaAprobado.IsEmpty and fraAprobo.IsEmpty) or
    //          (not edFechaAprobado.IsEmpty and not fraAprobo.IsEmpty))then
    //  InvalidMsg(edFechaAprobado, 'Se debe completar la fecha y el usuario que aprobo o dejar ambos vacios.');

    {if not ((edFechaRetiro.IsEmpty and (edRetiro.Text = '')) or
              (not edFechaRetiro.IsEmpty and not (edRetiro.Text = '')))then
      InvalidMsg(edFechaRetiro, 'Se debe completar la fecha y el usuario que retiro o dejar ambos vacios.');}

    if((edFechaAprobado.Date <> 0) and fraResolucion.IsEmpty)then
      InvalidMsg(fraResolucion, 'No puede ingresar la fecha de aprobado sin estar la Resolución.');

    if(not (edRetiro.Text = '') and fraResolucion.IsEmpty)then
      InvalidMsg(fraResolucion, 'No puede ingresar el retiró sin estar la Resolución.');

    if((edObservaciones.Text<>'') and fraResolucion.IsEmpty)then
      InvalidMsg(fraResolucion, 'No puede ingresar la observación sin estar la Resolución.');

//    if((edCantidadVisitas.Text<>'') and fraResolucion.IsEmpty)then
//      InvalidMsg(fraResolucion, 'No puede ingresar la cantidad de visitas sin estar la Resolución.');

    if(edFechaRecepcion.Date = 0)then
      InvalidMsg(edFechaRecepcion, 'Debe Ingresar la fecha de Recepción.');

    if(edFechaRecepcion.Date > DBDate)then
      InvalidMsg(edFechaRecepcion, 'La fecha de recepción del programa no puede ser mayor a hoy.');
  end
  else result := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.chgObraActividadClick(Sender: TObject);
var
  Actividad :String;
begin
  Actividad := chgObraActividad.Value;
  if (Actividad[1] = 'S') or (Actividad[2] = 'S') or (Actividad[9] = 'S') or (Actividad[11] = 'S') or
    (Actividad[12] = 'S') or (Actividad[13] = 'S') or (Actividad[14] = 'S') or (cbExcavacion503.Checked)  then
  begin
    lbDenunciaSrt.Visible := True;
    VclExtra.LockControls(cbProgSeg,true);
    cbProgSeg.Checked := True;
    cbProgSegClick(nil);
  end
  else
  begin
    lbDenunciaSrt.Visible := False;
    VclExtra.LockControls(cbProgSeg,False);
  end;
  if (ObraActividadCarga <> '') and (not FCarga)then
  begin
    if Actividad[1] <> ObraActividadCarga[1] then
      InvalidHint(edFechaExcavacion,'Esta modificación afecta al plan de visitas del programa de seguridad, por favor verifique si el cronograma actual es el correcto.','Warning',blnInfo,1,false);
    if Actividad[2] <> ObraActividadCarga[2] then
      InvalidHint(edFechaDemolicion,'Esta modificación afecta al plan de visitas del programa de seguridad, por favor verifique si el cronograma actual es el correcto.','Warning',blnInfo,1,false);
    if cbExcavacion503.Checked <> FExcavacionRes503 then
      InvalidHint(cbExcavacion503,'Esta modificación afecta al plan de visitas del programa de seguridad, por favor verifique si el cronograma actual es el correcto.','Warning',blnInfo,1,false);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.tbLimpiarClick(Sender: TObject);
begin
  ClearProgSeg;
  ClearRechazo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.OnResolucionChange(Sender: TObject);
begin
  if fraResolucion.Codigo <> '1' then
  begin
    //rgAplicaProg.Enabled := False;
    vclextra.LockControl(edFechaExtension,true);
    vclextra.LockControl(edFechaInicio,true);
    edFechaExtension.Date := 0;
    edFechaInicio.Date := 0;
    //rgAplicaProg.ItemIndex := 1;
  end
  else
  begin
    vclextra.LockControl(edFechaExtension,false);
    vclextra.LockControl(edFechaInicio,false);
    //rgAplicaProg.Enabled := false;
    //rgAplicaProg.ItemIndex := 0;
  end;
  fraResolucionAvisoObra.Codigo := fraResolucion.Codigo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.btnGenerarClick(Sender: TObject);
var
  cantVisitasPosibles, cantVisitas, periodoVisita,
  i, mes, anio, mesant, anioant : Integer; // Periodo de visitas en meses
  diaaux,mesaux, anioaux : Word;
  fechainicio : TDateTime;
  fechaPeriodo : TDateTime;
  fechaInicioDemEx : TDateTime;
  primerDiaMesSig : TDateTime;
  fechamaxvisitaDemExc : TDateTime;
  fechaInicioDemExAnt : TDateTime;
begin
//  edCantidadVisitas.Modified := True;
  cdsRegistros.EmptyDataSet;
  fechamaxvisitaDemExc := 0;

  if (MsgBox('¿Desea traer la periodicidad automática?',  MB_ICONQUESTION + MB_YESNO, 'Periodicidad automática') = IDYES) then
  begin
    edPeriodicidad.Value := ObtenerPeriodicidadVisitas;
    btnMaxVisitasClick(nil);
  end;

  Verificar(edCantidadVisitas.IsEmpty, edCantidadVisitas,'La cantidad de visitas no puede estar vacia.');
  Verificar(edPeriodicidad.IsEmpty, edPeriodicidad,'La Periodicidad no puede estar vacia.');
  Verificar(StrToInt(edPeriodicidad.Text) = 0,edPeriodicidad,'No puede ser 0 la Perioricidad.');
  Verificar(edObraFechaDeclaracion.Date = 0, edCantidadVisitas,'La Fecha Declarada no puede estar vacia.');
  Verificar(StrToInt(edCantidadVisitas.Text) = 0,edCantidadVisitas,'No puede ser 0 la cantidad de Visitas.');

  if (chgObraActividad.Value[1] = 'S') then
  begin
    Verificar(edFechaExcavacion.Date = 0, edFechaExcavacion,'Debe Tener Fecha de Excavación.');
    Verificar(edFechaExcavacionHasta.Date = 0, edFechaExcavacionHasta,'Debe Tener Fecha de Excavación.');
    fechainicio := edFechaExcavacionHasta.Date;
  end
  else if (chgObraActividad.Value[2] = 'S') then
  begin
    Verificar(edFechaDemolicion.Date = 0, edFechaDemolicion,'Debe Tener Fecha de Demolición.');
    Verificar(edFechaDemolicionHasta.Date = 0, edFechaDemolicionHasta,'Debe Tener Fecha de Demolición.');
    fechainicio := edFechaDemolicionHasta.Date;
  end
  else
    fechainicio := edObraFechaDeclaracion.Date;

  primerDiaMesSig := ValorSqlDateTime('SELECT LAST_DAY(art.actualdate) + 1 FROM DUAL');

  if fechainicio < primerDiaMesSig then
    fechainicio := primerDiaMesSig;

  //Demolicion
  if (chgObraActividad.Value[2] = 'S') then
  begin
    if edFechaDemolicion.Date > edObraFechaRecepcion.Date then 
      fechaInicioDemEx := edFechaDemolicion.Date
    else
      fechaInicioDemEx := edObraFechaRecepcion.Date;

    //Visita a las 48hs habiles
    fechaInicioDemExAnt := fechaInicioDemEx;
    fechaInicioDemEx := ValorSqlDateTime('SELECT art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ', 2) FROM DUAL');
    if (fechaInicioDemEx >= DBDate) and (fechaInicioDemEx <= edFechaDemolicionHasta.Date) then
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsDateTime :=  fechaInicioDemEx;
      cdsRegistros.FieldByName('FechaDesde').AsDateTime := fechaInicioDemExAnt;
      cdsRegistros.FieldByName('Obligatorio').AsString := 'D';
      cdsRegistros.Post;
      fechamaxvisitaDemExc := fechaInicioDemEx;
    end;

    //Visita cada 7 dias corridos
    while (ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 7 ), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 7, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 7, -1)) FROM DUAL ') <= edFechaDemolicionHasta.Date) do
    begin
      fechaInicioDemExAnt := ValorSqlDateTime('SELECT art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx)+', 1) FROM DUAL ');;
      fechaInicioDemEx := ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 7 ), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 7, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 7, -1)) FROM DUAL ');


      if (fechaInicioDemEx >= DBDate) then
      begin
        cdsRegistros.Append;
        cdsRegistros.FieldByName('Fecha').AsDateTime := fechaInicioDemEx;
        cdsRegistros.FieldByName('FechaDesde').AsDateTime := fechaInicioDemExAnt;
        cdsRegistros.FieldByName('Obligatorio').AsString := 'D';
        cdsRegistros.Post;
        fechamaxvisitaDemExc := fechaInicioDemEx;
      end;
    end;
  end;

  //Excavacion
  if (chgObraActividad.Value[1] = 'S') then
  begin
    if edFechaExcavacion.Date > edObraFechaRecepcion.Date then
      fechaInicioDemEx := edFechaExcavacion.Date
    else
      fechaInicioDemEx := edObraFechaRecepcion.Date;

    //Visita a las 7 dias corridos
    fechaInicioDemExAnt := fechaInicioDemEx;
    fechaInicioDemEx := ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 7), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 7, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 7, -1)) FROM DUAL ');
    if (fechaInicioDemEx >= DBDate) and (fechaInicioDemEx <= edFechaExcavacionHasta.Date) then
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsDateTime :=  fechaInicioDemEx;
      cdsRegistros.FieldByName('FechaDesde').AsDateTime := fechaInicioDemExAnt;
      cdsRegistros.FieldByName('Obligatorio').AsString := 'E';
      cdsRegistros.Post;
      if fechamaxvisitaDemExc < fechaInicioDemEx then
        fechamaxvisitaDemExc := fechaInicioDemEx;
    end;

    //Visita cada 10 dias corridos
    while (ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 10 ), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 10, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 10, -1)) FROM DUAL ') <= edFechaExcavacionHasta.Date) do
    begin
      fechaInicioDemExAnt := ValorSqlDateTime('SELECT art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx)+', 1) FROM DUAL ');;
      fechaInicioDemEx := ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 10 ), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 10, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 10, -1)) FROM DUAL ');
      if (fechaInicioDemEx >= DBDate) then
      begin
        cdsRegistros.Append;
        cdsRegistros.FieldByName('Fecha').AsDateTime := fechaInicioDemEx;
        cdsRegistros.FieldByName('FechaDesde').AsDateTime := fechaInicioDemExAnt;
        cdsRegistros.FieldByName('Obligatorio').AsString := 'E';
        cdsRegistros.Post;
        if fechamaxvisitaDemExc < fechaInicioDemEx then
          fechamaxvisitaDemExc := fechaInicioDemEx;
      end;
    end;
  end;

  //Excavacion 503
  if (cbExcavacion503.Checked) then
  begin
    if edFechaExc503Desde.Date > edObraFechaRecepcion.Date then
      fechaInicioDemEx := edFechaExc503Desde.Date
    else
      fechaInicioDemEx := edObraFechaRecepcion.Date;

    //Visita a las 7 dias corridos
    fechaInicioDemExAnt := fechaInicioDemEx;
    fechaInicioDemEx := ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 7), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 7, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 7, -1)) FROM DUAL ');
    if (fechaInicioDemEx >= DBDate) and (fechaInicioDemEx <= edFechaExc503Hasta .Date) then
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsDateTime :=  fechaInicioDemEx;
      cdsRegistros.FieldByName('FechaDesde').AsDateTime := fechaInicioDemExAnt;
      cdsRegistros.FieldByName('Obligatorio').AsString := 'X';
      cdsRegistros.Post;
      if fechamaxvisitaDemExc < fechaInicioDemEx then
        fechamaxvisitaDemExc := fechaInicioDemEx;
    end;

    //Visita cada 15 dias corridos
    while (ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 15 ), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 15, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 15, -1)) FROM DUAL ') <= edFechaExc503Hasta.Date) do
    begin
      fechaInicioDemExAnt := ValorSqlDateTime('SELECT art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx)+', 1) FROM DUAL ');
      fechaInicioDemEx := ValorSqlDateTime('SELECT DECODE(art.amebpba.isdiahabil(' + SqlValue(fechaInicioDemEx) + ' + 15 ), ' +
                                           '              ''S'',' + SqlValue(fechaInicioDemEx) + ' + 15, ' +
                                           '              art.amebpba.calcdiashabiles(' + SqlValue(fechaInicioDemEx) + ' + 15, -1)) FROM DUAL ');
      if (fechaInicioDemEx >= DBDate) then
      begin
        cdsRegistros.Append;
        cdsRegistros.FieldByName('Fecha').AsDateTime := fechaInicioDemEx;
        cdsRegistros.FieldByName('FechaDesde').AsDateTime := fechaInicioDemExAnt;
        cdsRegistros.FieldByName('Obligatorio').AsString := 'X';
        cdsRegistros.Post;
        if fechamaxvisitaDemExc < fechaInicioDemEx then
          fechamaxvisitaDemExc := fechaInicioDemEx;
      end;
    end;
  end;


(*
  if (chgObraActividad.Value[2] = 'S') then
  begin
    cdsRegistros.Append;
    cdsRegistros.FieldByName('Fecha').AsDateTime := edFechaDemolicion.Date;
    cdsRegistros.FieldByName('Obligatorio').AsString := 'D';
    cdsRegistros.Post;
    cdsRegistros.Append;
    cdsRegistros.FieldByName('Fecha').AsDateTime := edFechaDemolicionHasta.Date;
    cdsRegistros.FieldByName('Obligatorio').AsString := 'D';
    cdsRegistros.Post;
  end;

  if (chgObraActividad.Value[1] = 'S') then
  begin
    cdsRegistros.Append;
    cdsRegistros.FieldByName('Fecha').AsDateTime := edFechaExcavacion.Date;
    cdsRegistros.FieldByName('Obligatorio').AsString := 'E';
    cdsRegistros.Post;
    cdsRegistros.Append;
    cdsRegistros.FieldByName('Fecha').AsDateTime := edFechaExcavacionHasta.Date;
    cdsRegistros.FieldByName('Obligatorio').AsString := 'E';
    cdsRegistros.Post;
  end;
*)

  if fechamaxvisitaDemExc > 0 then
  begin
    if MonthOf(fechamaxvisitaDemExc) <> 12 then
      fechainicio := EncodeDate(YearOf(fechamaxvisitaDemExc), MonthOf(fechamaxvisitaDemExc) + 1, 1)
    else
      fechainicio := EncodeDate(YearOf(fechamaxvisitaDemExc)+1, 1, 1)
  end;

  mes := MonthOf(fechainicio);
  anio := YearOf(fechainicio);

  if (edObraFechaFin.Date = 0) then
  begin
    cantVisitas := StrToInt(edCantidadVisitas.Text);
    periodoVisita := StrToInt(edPeriodicidad.Text);
  end
  else
  begin
    if (MonthsBetween(fechainicio,edObraFechaFin.Date) < 0) then
      cantVisitasPosibles := 0
    else
      cantVisitasPosibles := MonthsBetween(fechainicio,edObraFechaFin.Date);
    if dayof(fechainicio)< 15 then
      cantVisitasPosibles := cantVisitasPosibles +1;
    if dayof(edObraFechaFin.Date)> 15 then
      cantVisitasPosibles := cantVisitasPosibles +1;
    if cantVisitasPosibles < 1 then
      cantVisitasPosibles := 1;
    Verificar(cantVisitasPosibles < StrToInt(edCantidadVisitas.Text), edCantidadVisitas, 'Supera el máximo de visitas posibles.');
    cantVisitas := StrToInt(edCantidadVisitas.Text);
    periodoVisita := StrToInt(edPeriodicidad.Text);

    DecodeDate(fechainicio,anioaux,mesaux,diaaux);
    IncAMonth(anioaux,mesaux,diaaux,(periodoVisita*(cantVisitas-1)));
    fechaPeriodo :=EncodeDate(anioaux,mesaux,diaaux);
    Verificar(fechaperiodo > edObraFechaFin.Date,edPeriodicidad,'Con el periodo y la cantidad seleccionada supera la fecha de fin alguna visita.');
  end;

  mesant := mes;
  anioant := anio;

  if DayOf(fechainicio)>= 15 then
    mes := mes + 1;
  if (MonthOf(edObraFechaFin.Date) + 1 = mes) and (YearOf(edObraFechaFin.Date) = anio) then
    mes := mes - 1;
  for i := 1 to cantVisitas do
  begin
    if i <> 1 then
    begin
      if mes+1 < 13 then
      begin
        mesant := mes+1;
        anioant := anio;
      end
      else
      begin
        mesant := 1;
        anioant := anio+1;
      end;
      mes := mes + periodoVisita;
    end;
    If (mes < 13) then
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsDateTime := ValorSqlDateTime('SELECT LAST_DAY(TO_DATE(''01/'' || LPAD('+SqlValue(IntToStr(mes)+'/'+IntToStr(anio))+', 7, ''0''), ''DD/MM/YYYY'')) FROM DUAL') ;
      cdsRegistros.FieldByName('FechaDesde').AsDateTime := ValorSqlDateTime('SELECT TO_DATE(''01/'' || LPAD('+SqlValue(IntToStr(mesant)+'/'+IntToStr(anioant))+', 7, ''0''), ''DD/MM/YYYY'') FROM DUAL') ;
      cdsRegistros.FieldByName('Obligatorio').AsString := 'N';
      cdsRegistros.Post;
    end
    else
    begin
      mes := mes - 12;
      anio := anio + 1;
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Fecha').AsDateTime := ValorSqlDateTime('SELECT LAST_DAY(TO_DATE(''01/'' || LPAD('+SqlValue(IntToStr(mes)+'/'+IntToStr(anio))+', 7, ''0''), ''DD/MM/YYYY'')) FROM DUAL');
      cdsRegistros.FieldByName('FechaDesde').AsDateTime := ValorSqlDateTime('SELECT TO_DATE(''01/'' || LPAD('+SqlValue(IntToStr(mesant)+'/'+IntToStr(anioant))+', 7, ''0''), ''DD/MM/YYYY'') FROM DUAL') ;
      cdsRegistros.FieldByName('Obligatorio').AsString := 'N';
      cdsRegistros.Post;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.btnLimpiarClick(Sender: TObject);
begin
  if not cdsRegistros.IsEmpty then
    cdsRegistros.EmptyDataSet;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmObras.FormCreate(Sender: TObject);
begin
  FAltaProg := False;
  FAOWEB319 := False;
  tsAvisoObra.ActivePageIndex := 0;
  Modificado := False;
  FModifiedCronograma := False;
  cdsRegistros.Close;
  cdsRegistros.CreateDataSet;
  cdsRegistros.EmptyDataSet;
  rgAplicaProg.Enabled := False;
  fraUsuarioRecepFormFisico.UsuariosGenericos := False; 
  with fraAprobo do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_ID';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraMotivoRechazo do
  begin
    TableName := 'HYS.HAM_AVISOOBRAMOTIVORECHAZO';
    FieldDesc := 'AM_DESCRIPCION';
    FieldID := 'AM_ID';
    FieldCodigo := 'AM_ID';
    FieldBaja := 'AM_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraTipoTelResp do
  begin
    TableName := 'ATT_TIPOTELEFONO';
    FieldDesc := 'TT_DESCRIPCION';
    FieldID := 'TT_ID';
    FieldCodigo := 'TT_ID';
    CaseSensitive := false;
  end;
  frmDomicilio319 := TfrmDomicilio319.Create( Self );
  frmDomicilio319.Parent    := tsDomicilio319;
  frmDomicilio319.Visible   := True;
  frmDomicilio319.Align     := alClient;
end;

procedure TfrmObras.btnMaxVisitasClick(Sender: TObject);
var
  cantVisitasPosibles : Integer;
  fechainicio : TDateTime;
  primerDiaMesSig : TDateTime;
begin
  Verificar(edPeriodicidad.IsEmpty, edPeriodicidad,'La Periodicidad no puede estar vacia.');
  Verificar(StrToInt(edPeriodicidad.Text) = 0,edPeriodicidad,'No puede ser 0 la Perioricidad.');
  if (chgObraActividad.Value[1] = 'S') then
  begin
    Verificar(edFechaExcavacion.Date = 0, edFechaExcavacion,'Debe Tener Fecha de Excavación.');
    Verificar(edFechaExcavacionHasta.Date = 0, edFechaExcavacionHasta,'Debe Tener Fecha de Excavación.');
    fechainicio := edFechaExcavacion.Date;
  end
  else if (chgObraActividad.Value[2] = 'S') then
  begin
    Verificar(edFechaDemolicion.Date = 0, edFechaExcavacion,'Debe Tener Fecha de Demolición.');
    Verificar(edFechaDemolicionHasta.Date = 0, edFechaExcavacion,'Debe Tener Fecha de Demolición.');
    fechainicio := edFechaDemolicion.Date;
  end
  else
    fechainicio := edObraFechaDeclaracion.Date;

  primerDiaMesSig := ValorSqlDateTime('SELECT LAST_DAY(art.actualdate) + 1 FROM DUAL');

  if fechainicio < primerDiaMesSig then
    fechainicio := primerDiaMesSig;

  if (edObraFechaFin.Date <> 0) then
  begin
    if (MonthsBetween(fechainicio,edObraFechaFin.Date) < 0) then
      cantVisitasPosibles := 0
    else
      cantVisitasPosibles := trunc(MonthsBetween(fechainicio,edObraFechaFin.Date)/StrToInt(edPeriodicidad.Text));
    if dayof(fechainicio)< 15 then
      cantVisitasPosibles := cantVisitasPosibles +1;
    if cantVisitasPosibles < 1 then
      cantVisitasPosibles := 1;
    edCantidadVisitas.Text := IntToStr(cantVisitasPosibles);
    btnLimpiarClick(nil);
  end;
end;

procedure TfrmObras.ActivarPreventor;
begin
  with TfrmGestionEmpresasPreventor.Create(self) do
  try
    Visible := False;
    HacerCommit := False;
    fraEmpresaFiltro.mskCUIT.Text := FCuit;
    edEstablecimiento.Text := IntToStr(FEstableci);
    cbCtosActivos.Checked := False;
    cbExcluirBajas.Checked := False;
    tbRefrescarClick(nil);
    tbModificarClick(nil);
  finally
    Free
  end;
  frmFet.edPreventor.Text := ValorSql ('SELECT it_nombre ' +
                                  '  FROM art.pit_firmantes ' +
                                  ' WHERE it_codigo = art.hys.get_preventor_estab(' + SqlValue(FCuit) + ', ' +
                                                                                      SqlValue(FEstableci) + ', ' +
                                                                                  'SYSDATE)');

end;

procedure TfrmObras.SetModificado(const Value: Boolean);
begin
  FModificado := Value;
end;

procedure TfrmObras.tbEliminarFechasClick(Sender: TObject);
begin
  cdsRegistros.Delete;
end;

procedure TfrmObras.tbEliminarClick(Sender: TObject);
var
  sSql: string;

begin
  if tsAvisoObra.ActivePageIndex = 0 then
  begin
    if (MsgBox('¿Desea dar de baja el aviso de obra?',  MB_ICONQUESTION + MB_YESNO, 'Baja Aviso de Obra') = IDYES) then
    begin
      tsAvisoObraInt.Font.Color := clred;
        sSql :=
        ' UPDATE art.pao_avisoobra '+
        '    SET ao_fechabaja = SYSDATE, '+
        '        ao_usubaja = '+SqlValue(frmPrincipal.DBLogin.UserID)+
        '  WHERE ao_cuit = '+SqlValue(FCuit)+
        '    AND ao_estableci = '+SqlValue(FEstableci)+
        '    AND ao_tipo = '+SqlValue(FTipo)+
        '    AND ao_operativo = '+SqlValue(FOperativo);
      EjecutarSqlST(sSql);
    end;
  end
  else
  begin
    if (MsgBox('¿Desea dar de baja el Programa de seguridad?',  MB_ICONQUESTION + MB_YESNO, 'Baja Programa Seguridad') = IDYES) then
    begin
      tsProgramaDeSeg.Font.Color := clred;
      sSql :=
        ' UPDATE hys.hps_programaseguridad '+
        '    SET ps_fechabaja = SYSDATE, '+
        '        ps_usubaja = '+SqlValue(frmPrincipal.DBLogin.UserID)+
        '  WHERE ps_id = '+ SqlValue(FID);
      //if FID <> '' then
      //   sSql := sSql + ' AND ps_id = '+ SqlValue(FID);
      //if (rgAplicaProg.ItemIndex = 1) then
      //  sSql := sSql + ' AND ps_establecimiento = '+ SqlValue(FEstableci);
      EjecutarSqlST(sSql);
    end;
  end;
end;

procedure TfrmObras.OnResolucionAvisoChange(Sender: TObject);
begin
  if fraResolucionAvisoObra.IsEmpty then
  begin
    VCLExtra.LockControl(fraResolucion,false);
  end
  else
  begin
    VCLExtra.LockControl(fraResolucion,True);
    fraResolucion.Codigo := fraResolucionAvisoObra.Codigo;
    OnResolucionChange(nil);
  end;
end;

procedure TfrmObras.btnCantPreventorClick(Sender: TObject);
begin
 with TfrmPreventorAprobo.Create(Self) do
  try
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmObras.tbResolucionClick(Sender: TObject);
//var
//  resolucion,sSql : String;
begin
(*
  sSql :=
    ' SELECT or_descripcion '+
    '   FROM hys.hps_programaseguridad, hys.hor_obrasresolucion '+
    '  WHERE ps_resolucion = or_id '+
    '    AND ps_cuit = ' + SqlValue(FCuit);
  if FID <> '' then
    sSql := sSql + ' AND ps_id = '+ SqlValue(FID);

    sSql := sSql + ' AND ps_establecimiento = '+ SqlValue(FEstableci);
  resolucion := ValorSql(sSql);
*)
//  if (resolucion = '35') or (resolucion = '51') then
  if (fraResolucionAvisoObra.Value = 2) or (fraResolucionAvisoObra.Value = 3) then
  begin
    if ExisteSql('Select 1 from hys.hfv_fechasvisitas where fv_Cuit = ' + SqlValue(FCuit) + ' and fv_estableci = ' + SqlValue(FEstableci))then
    begin
      with TrptResolucionSRT51.Create(Self) do
      try
        cambioResolucion(fraResolucionAvisoObra.Codigo);
        Load(FCuit,FEstableci,FTipo,FID);
      finally
        Free;
      end;
    end
    else
    begin
      with TrptResolucionSRT51SinVisita.Create(Self) do
      try
        cambioResolucion(fraResolucionAvisoObra.Codigo);
        Load(FCuit,FEstableci,FTipo);
      finally
        Free;
      end;
    end;
  end
  else if fraResolucionAvisoObra.Value = 1 then
  begin
    with TrptResolucionSRT.Create(Self) do
    try
      Load(FCuit,FEstableci,FTipo);
    finally
      Free;
    end;
  end;
end;

procedure TfrmObras.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if cdsRegistros.FieldByName('IdVisita').asinteger > 0  Then
    AFont.Color := clPurple;
  if cdsRegistros.FieldByName('Obligatorio').AsString = 'D' Then
    Background := clGreen;
  if cdsRegistros.FieldByName('Obligatorio').AsString = 'E' Then
    Background := clSkyBlue;
  if cdsRegistros.FieldByName('Obligatorio').AsString = 'X'  Then
    Background := clMoneyGreen;
end;

procedure TfrmObras.tbCambioResolucionClick(Sender: TObject);
begin
  fpCambioRecepcion.ShowModal;
  edCambRecep.Text := edRecep.Text;
end;

procedure TfrmObras.btnCopRecepAceptarClick(Sender: TObject);
var
orden : Integer;
begin
  if edCambRecep.Text = '' Then
    InvalidMsg( edCambRecep, 'Debe Ingresar un Nro. de recepción.')
  //else if (fraResolucionAvisoObra.Descripcion <> '319') or (fraResolucion.Descripcion <> '319') then
  //  InvalidMsg( edCambRecep, 'Solo se puede Cambiar para una resolución Nro 319.')
  else
  begin
    orden := IncSql(
      ' SELECT nvl(MAX (AR_ORDEN),0) '+
      '   FROM hys.har_avisoobranrorecepcion '+
      '  WHERE AR_NRORECEPCION = '+SqlValue(edCambRecep.Text));
    EjecutarSqlST(
    ' UPDATE hys.har_avisoobranrorecepcion '+
    '    SET AR_NRORECEPCION = '+SqlValue(edCambRecep.Text)+', '+
    '        AR_ORDEN = '+SqlValue(orden)+
    '  WHERE ar_cuit = '+SqlValue(FCuit)+' AND ar_estableci = '+SqlValue(FEstableci));
    edRecep.Text := edCambRecep.Text;
    fpCambioRecepcion.ModalResult := mrOk;
  end;
end;

procedure TfrmObras.tsAvisoObraChange(Sender: TObject);
begin
  if tsAvisoObra.TabIndex = 1 then
  begin
    tbNuevo.Enabled := True;
  end
  else
    tbNuevo.Enabled := True;
end;

procedure TfrmObras.tbNuevoClick(Sender: TObject);
begin
  ClearProgSeg;
  ClearRechazo;
  FAltaProg := True;
  FID := '';
end;

procedure TfrmObras.tbProgramasSeguridadClick(Sender: TObject);
begin
  with TfrmProgramasDeSeguridad.Create(Self) do
  try
    Visible := false;
    Load(FCuit,FEstableci,FTipo);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmObras.cbFechaAnexoClick(Sender: TObject);
begin
  if cbFechaAnexo.Checked then
    VclExtra.LockControl(edFechaAnexo,False)
  else
  begin
    VclExtra.LockControl(edFechaAnexo,True);
    edFechaAnexo.Clear;
  end;
end;

procedure TfrmObras.tbInformeProgClick(Sender: TObject);
var
  sSQL : String;
  empresa, Contrato, Obra, Resolucion, preventor : String;
begin

  sSQL :=
   '  SELECT aem.em_nombre, co_contrato, art.afi.armar_domicilio(es_calle, '+
   '         es_numero, '+
   '         es_piso, '+
   '         es_departamento, '+
   '         es_localidad)||'' - ''||pv_descripcion as obra,decode(PS_RESOLUCION,1,''319/99'',2,''35/98'',3,''51/97'') as resolucion,'+
   '         (SELECT it_nombre FROM art.pit_firmantes '+
   '           WHERE it_codigo = art.hys.get_preventor_estab(aem.em_cuit, es_nroestableci, SYSDATE)) preventor '+
   '       FROM afi.aem_empresa aem, '+
   '            afi.aco_contrato aco, '+
   '            afi.aes_establecimiento aes, '+
   '            hys.hps_programaseguridad, '+
   '            art.cpv_provincias '+
   '      WHERE co_contrato = art.get_vultcontrato (em_cuit) '+
   '        AND aem.em_id = aco.co_idempresa '+
   '        AND aco.co_contrato = aes.es_contrato '+
   '        AND NVL (co_estado, '''') = ''1'' '+
   '        AND es_provincia = pv_codigo(+) '+
   '        AND ps_id = '+ SqlValue(FID)+
   '        AND em_cuit = '+ SqlValue(FCuit)+
   '        AND aes.es_nroestableci = '+SqlValue(FEstableci);
  with GetQuery(sSQL) do
  try
    empresa   := FieldByName('em_nombre').AsString;
    Contrato := FieldByName('co_contrato').AsString;
    Obra := FieldByName('obra').AsString;
    Resolucion := FieldByName('resolucion').AsString;
    Preventor := FieldByName('preventor').AsString;
  finally
    Free;
  end;

  with TrptInformeProgSeg.Create(Self) do
  try
    Load(empresa, Contrato, Obra, Resolucion, edRecep.Text,Preventor);
    qrResolucion.Prepare;
    Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, unVisualizador.oAlwaysShowdialog, unVisualizador.oAutoFirma, oForceDB])
  finally
    Free;
  end;
end;

procedure TfrmObras.tbActividadesClick(Sender: TObject);
var
  sSql,Resolucion : String;
begin
  sSql :=
    ' SELECT or_descripcion '+
    '   FROM hys.hps_programaseguridad, hys.hor_obrasresolucion '+
    '  WHERE ps_resolucion = or_id '+
    '    AND PS_CUIT = '+SqlValue(FCuit);
  if FID <> '' then
    sSql := sSql + ' AND ps_id = '+ SqlValue(FID);

    sSql := sSql + ' AND ps_establecimiento = '+ SqlValue(FEstableci);
  resolucion := ValorSql(sSql);
  if (resolucion = '35') or (Resolucion = '51') or (Resolucion = '') then
  begin
    with TrptActividades51.Create(Self) do
    try
      cambioResolucion(Resolucion);
      Load(FCuit, FEstableci, FTipo, FOperativo);
    finally
      Free;
    end;
  end
  else
  if resolucion = '319' then
  begin
    with TrptActividades.Create(Self) do
    try
      Load(FCuit, FEstableci, FTipo, FOperativo);
    finally
      Free;
    end;
  end;
end;

procedure TfrmObras.tbBuscaResponsableExistentePSClick(Sender: TObject);
var
  idcontactoHys : Integer;
begin
  idcontactoHys := ValorSqlInteger(
      ' SELECT ct_id '+
      '   FROM act_contacto, aco_contrato '+
      '  WHERE ct_cargo = ''01090'' '+
      '    AND co_contrato = '+IntToStr(FContrato)+
      '    AND ct_idempresa = co_idempresa '+
      '    AND ct_fechabaja IS NULL' );
  if idcontactoHys = 0 then
    fraContactoPS.Clear
  else
    fraContactoPS.ContactoID := idcontactoHys;
  fraContactoPS.Modified := true;
end;

procedure TfrmObras.tbBuscarResponsableExistenteClick(Sender: TObject);
var
  idcontactoHys : Integer;
begin
  idcontactoHys := ValorSqlInteger(
      ' SELECT ct_id '+
      '   FROM act_contacto, aco_contrato '+
      '  WHERE ct_cargo = ''01090'' '+
      '    AND co_contrato = '+IntToStr(FContrato)+
      '    AND ct_idempresa = co_idempresa '+
      '    AND ct_fechabaja IS NULL' );
  if idcontactoHys = 0 then
    fraContactoObra.Clear
  else
    fraContactoObra.ContactoID := idcontactoHys;
  fraContactoObra.Modified := true;
end;

procedure TfrmObras.tbResposablesHysAOClick(Sender: TObject);
begin
  with TfrmSeleccionResponsableHYS.Create(Self) do
  begin
    FContrato := IntToStr(Self.Fcontrato);
    Visible := False;
    ShowModal;
    if FCodigo <> '' then
      fraContactoObra.ContactoID := StrToInt(FCodigo);
  end;
end;

procedure TfrmObras.tbResposablesHysClick(Sender: TObject);
begin
  with TfrmSeleccionResponsableHYS.Create(Self) do
  begin
    FContrato := IntToStr(Self.Fcontrato);
    Visible := False;
    ShowModal;
    if FCodigo <> '' then
      fraContactoPS.ContactoID := StrToInt(FCodigo);
  end;
end;

procedure TfrmObras.SaveArchivos;
var
  Id: TTableId;
begin
  if (MsgBox('¿Desea Cargar Documentación?', MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES) then
  begin
    if not VerificarClaveExiste(ID_CARPETA_CONSTRUCC, edRecep.Text, Id) then
      DoInsertArchivo(ID_CARPETA_CONSTRUCC, TIPOUBICACION_GUARDA,
                      '', 0, '', frmPrincipal.dbLogin.UserId, edRecep.Text,
                      False, 'ALTA INICIAL');

    with TfrmCargaDocumentacion.Create(Self) do
    begin
      fraFiltroArchivoCapturaContenido.Visible := False;
      fraFiltroArchivoCapturaContenido.Tipo := ID_CARPETA_CONSTRUCC;
      fraFiltroArchivoCapturaContenido.OnArchivoChange(nil);
      OnChangeTipoDocumento(nil);
      fraTipoArchivoPropiedadesChange(nil);
      fraFiltroArchivoCapturaContenido.edNumNumeroDesde.Text := edRecep.Text;
      fraTipoDocumento.Codigo := 'AO';
      edHojas.Value := 1;
      edCodigoDocumento.Clear;
      edObservaciones.Text := '';
      rgbOpcionDestino.ItemIndex := 0;
      edNroEstableci.Value := FEstableci;
      edFechaVisita.Clear;
      Commit          := False;
      SoloUnaEtiqueta := True;
      fraFiltroArchivoCapturaContenido.Visible := True;
      fraFiltroArchivoCapturaContenido.fraTipoARchivo.Enabled := False;

      ShowModal;
    end;
  end
end;

procedure TfrmObras.setPSModificado(const Value: Boolean);
begin
  FPSModificado := Value;
end;

procedure TfrmObras.ScrollBoxMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position + 7
end;

procedure TfrmObras.ScrollBoxMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position - 7
end;

procedure TfrmObras.clearDomicilio319;
begin
  frmDomicilio319.FIDProgramaSeguridad := 0;
  frmDomicilio319.tbRefrescarClick(nil);
end;

procedure TfrmObras.SetDomModificado(Value: Boolean);
begin
  frmDomicilio319.DomModificado := Value;
end;

procedure TfrmObras.edFechaExcavacionExit(Sender: TObject);
begin
  if edFechaExcavacion.IsValid then
    if (edFechaExcavacion.Date <> 0) and (edFechaExcavacion.Tag <> 0) and (edFechaExcavacion.Date <> edFechaExcavacion.Tag) then
      InvalidHint(edFechaExcavacion,'Esta modificación afecta al plan de visitas del programa de seguridad, por favor verifique si el cronograma actual es el correcto.','Warning',blnInfo,1,false);
end;

procedure TfrmObras.edFechaDemolicionExit(Sender: TObject);
begin
  if edFechaDemolicion.IsValid then
    if (edFechaDemolicion.Date <> 0) and (edFechaDemolicion.Tag <> 0) and (edFechaDemolicion.Date <> edFechaDemolicion.Tag) then
      InvalidHint(edFechaDemolicion,'Esta modificación afecta al plan de visitas del programa de seguridad, por favor verifique si el cronograma actual es el correcto.','Warning',blnInfo,1,false);
end;

procedure TfrmObras.tbAgregarVisitaClick(Sender: TObject);
begin
  Verificar(edFechaVisita.Date < ValorSqlDateTime('SELECT ''01/'' || TO_CHAR('+SqlDate(edObraFechaDeclaracion.Date)+', ''MM/YYYY'') '+
                                                  '  FROM DUAL '),edFechaVisita, 'No puede ser menor al primer dia del mes de la fecha declarada.');
  cdsRegistros.Append;
  cdsRegistros.FieldByName('Fecha').AsDateTime := edFechaVisita.Date;
  cdsRegistros.FieldByName('FechaDesde').AsDateTime := edFechaVisita.Date;
  if cbDemolicion.Checked then
    cdsRegistros.FieldByName('Obligatorio').AsString := 'D'
  else if cbExcavacion.Checked then
    cdsRegistros.FieldByName('Obligatorio').AsString := 'E'
  else if cbExcavacion503VsitasPS.Checked then
    cdsRegistros.FieldByName('Obligatorio').AsString := 'X'
  else
    cdsRegistros.FieldByName('Obligatorio').AsString := 'N';

  cdsRegistros.Post;
end;

procedure TfrmObras.tbAsignarResponsableHYSPSClick(Sender: TObject);
var
  idcontactohys : Integer;
begin
 with TfrmContratoContacto.Create(Self) do
  try
    AutoCommit := false;
    DoCargar(FCuit, FContrato);
    SelectCargoContacto := '01090';

    ShowModal;

    idcontactohys := ValorSqlInteger(
      ' SELECT ct_id '+
      '   FROM act_contacto, aco_contrato '+
      '  WHERE ct_cargo = ''01090'' '+
      '    AND co_contrato = '+IntToStr(FContrato)+
      '    AND ct_idempresa = co_idempresa '+
      '    AND ct_fechabaja IS NULL' );
  finally
    Free;
  end;
  if idcontactohys = 0 then
    fraContactoPS.Clear
  else
    fraContactoPS.ContactoID := idcontactohys;
  fraContactoPS.Modified := true;
end;

procedure TfrmObras.cbRechazoAOClick(Sender: TObject);
begin
  vclExtra.LockControls([cbIncompleto,cbFaltanFirmas,cbContratoInactivo],not cbRechazoAO.Checked);
  if not cbRechazoAO.Checked then
  begin
    cbIncompleto.Checked       := False;
    cbFaltanFirmas.Checked     := False;
    cbContratoInactivo.Checked := False;
  end;
  cbRechazoAO.Tag := 1;
end;

procedure TfrmObras.cbRechazoPSClick(Sender: TObject);
begin
  vclExtra.LockControls([clRechazosProgramaSeguridad],not cbRechazoPS.Checked);
  cbRechazoPS.Tag := 1;
  If not cbRechazoPS.Checked then
    clRechazosProgramaSeguridad.UncheckAll;
end;

function TfrmObras.ValidarRechazoAO: Boolean;
begin
  if ModifiedRechazoAO then
  begin
    result := (edFechaRechazoAO.Date > 0) and
              ((cbRechazoAO.Checked) or cbNoCorrespondePresentacion.Checked) and
              (not cbRechazoAO.Checked or (cbRechazoAO.Checked and
              (cbIncompleto.Checked or cbFaltanFirmas.Checked or
              cbContratoInactivo.Checked)));

    if (edFechaRechazoAO.Date <> 0) and not cbRechazoAO.Checked and not cbNoCorrespondePresentacion.Checked then
    begin
      result := false;
      InvalidMsg(edFechaRechazoAO, 'Debe Indicar si esta rechazado o No corresponde presentación.');
    end;
    if (cbRechazoAO.Checked or cbNoCorrespondePresentacion.Checked) and (edFechaRechazoAO.Date = 0) then
    begin
      result := false;
      InvalidMsg(edFechaRechazoAO, 'Debe cargar la fecha de rechazo.');
    end;
    if cbRechazoAO.Checked and not(cbIncompleto.Checked or cbFaltanFirmas.Checked or cbContratoInactivo.Checked) then
    begin
      result := false;
      InvalidMsg(cbIncompleto, 'Debe cargar algún motivo de rechazo.');
    end;

  end
  else result := true;

end;

function TfrmObras.ValidarRechazoPS: Boolean;
begin
  if ModifiedRechazoPS then
  begin
    result := (edFechaRechazoPS.Date > 0) and
              (cbRechazoPS.Checked) and (clRechazosProgramaSeguridad.CheckCount >0);

    if (edFechaRechazoPS.Date <> 0) and not cbRechazoPS.Checked  then
    begin
      result := false;
      InvalidMsg(cbRechazoPS, 'Debe Indicar si esta rechazado.');
    end;
    if (cbRechazoPS.Checked) and (edFechaRechazoPS.Date = 0) then
    begin
      result := false;
      InvalidMsg(edFechaRechazoPS, 'Debe cargar la fecha de rechazo.');
    end;
    if cbRechazoPS.Checked and (clRechazosProgramaSeguridad.CheckCount = 0) then
    begin
      result := false;
      InvalidMsg(clRechazosProgramaSeguridad, 'Debe cargar algún motivo de rechazo.');
    end;

  end
  else result := true;

end;


function TfrmObras.GetModifiedRechazoAO: Boolean;
begin
  Result := (edFechaRechazoAO.Date <> edFechaRechazoAO.Tag) or
            (cbRechazoAO.Tag <> 0) or  (cbIncompleto.Tag <> 0) or
            (cbFaltanFirmas.Tag <> 0) or (cbContratoInactivo.Tag <> 0) or
            (cbNoCorrespondePresentacion.Tag <> 0) or
             edObservacionesRechazo.Modified;

end;

procedure TfrmObras.SaveRechazo;
Var
  SqlProg : TSql;
  i, iIdRechazoAO, iIdRechazoPS, iIdEmpresa : Integer;
  //direccionmail : String;
  //body : String;
//  sSql : String;
begin
  if GetModifiedRechazoAO Then
  begin
    iIdRechazoAO := ValorSqlInteger('SELECT rb_id FROM hys.hrb_rechazoavisoobra WHERE rb_cuit = '+SqlValue(FCuit)+
                                    '   AND rb_estableci = '+SqlValue(FEstableci),0);
    SqlProg := TSql.Create( 'HYS.HRB_RECHAZOAVISOOBRA' );
    try
      { Primary Key }

      SqlProg.PrimaryKey.Add( 'RB_CUIT', FCuit );
      //if(rgAplicaProg.ItemIndex = 1)then
      SqlProg.PrimaryKey.Add( 'RB_ESTABLECI', FEstableci );
      { Campos }
      SqlProg.Fields.Add( 'RB_FECHARECHAZO', edFechaRechazoAO.Date );

      if cbNoCorrespondePresentacion.Checked then
        SqlProg.Fields.Add( 'RB_NOCORRESPONDEPRESENTACION', 'S' )
      else
        SqlProg.Fields.Add( 'RB_NOCORRESPONDEPRESENTACION', 'N' );

      if cbIncompleto.Checked then
        SqlProg.Fields.Add( 'RB_INCOMPLETO', 'S' )
      else
        SqlProg.Fields.Add( 'RB_INCOMPLETO', 'N' );

      if cbFaltanFirmas.Checked then
        SqlProg.Fields.Add( 'RB_FALTANFIRMAS', 'S' )
      else
        SqlProg.Fields.Add( 'RB_FALTANFIRMAS', 'N' );

      if cbContratoInactivo.Checked then
        SqlProg.Fields.Add( 'RB_CONTRATOINACTIVO', 'S' )
      else
        SqlProg.Fields.Add( 'RB_CONTRATOINACTIVO', 'N' );


      SqlProg.Fields.Add( 'RB_OBSERVACIONES', edObservacionesRechazo.Text);

      if iIdRechazoAO <> 0 then begin
        SqlProg.SqlType := stUpdate;
        SqlProg.PrimaryKey.Add( 'RB_ID', iIdRechazoAO);
        SqlProg.Fields.Add( 'RB_FECHAMODIF', exDateTime );
        SqlProg.Fields.Add( 'RB_USUMODIF', frmPrincipal.dbLogin.UserId );
        SqlProg.Fields.Add( 'RB_FECHABAJA', exNull );
        SqlProg.Fields.Add( 'RB_USUBAJA', exNull );
        tsProgramaDeSeg.Font.Color := clWindowText;
      end else begin
        SqlProg.SqlType := stInsert;
        iIdRechazoAO := GetSecNextVal('hys.SEQ_HRB_ID');
        SqlProg.Fields.Add( 'RB_ID',iIdRechazoAO );
        SqlProg.Fields.Add( 'RB_FECHAALTA', exDateTime );
        SqlProg.Fields.Add( 'RB_USUALTA', frmPrincipal.dbLogin.UserId );

      end;
      EjecutarSqlST( SqlProg.Sql );
      EjecutarSqlST( ' UPDATE afi.aes_establecimiento '+
                     '    SET es_fechabaja = SYSDATE, '+
                     '        es_fecharecepcionbaja = SYSDATE, '+
                     '        ES_IDMOTIVOBAJA = 2, '+
                     '        es_usubaja = '+SqlValue(frmPrincipal.dbLogin.UserId)+
                     '  WHERE ES_CONTRATO = '+SqlValue(FContrato)+
                     '    AND ES_NROESTABLECI = '+SqlValue(FEstableci));
      iIdEmpresa := ValorSql('SELECT co_idempresa FROM afi.aco_contrato WHERE co_contrato = '+SqlValue(FContrato));
      EjecutarStoreSTEx( 'art.hys.do_actualizarestado (:idempresa, :estableci); ',[iIdEmpresa,FEstableci]);
    finally
      SqlProg.Free;
    end;
  end;

  if GetModifiedRechazoPS Then begin
    iIdRechazoPS := ValorSqlInteger('SELECT RQ_ID FROM hys.HRQ_RECHAZOPS WHERE RQ_CUIT = '+SqlValue(FCuit)+
                                    '   AND RQ_ESTABLECI = '+SqlValue(FEstableci),0);
    SqlProg := TSql.Create( 'HYS.HRQ_RECHAZOPS' );
    try
      { Primary Key }

      SqlProg.PrimaryKey.Add( 'RQ_CUIT', FCuit );
      //if(rgAplicaProg.ItemIndex = 1)then
      SqlProg.PrimaryKey.Add( 'RQ_ESTABLECI', FEstableci );
      { Campos }
      SqlProg.Fields.Add( 'RQ_FECHARECHAZO', edFechaRechazoPS.Date );

      if iIdRechazoPS <> 0 then begin
         SqlProg.SqlType := stUpdate;
         SqlProg.PrimaryKey.Add( 'RQ_ID', iIdRechazoPS);
         SqlProg.Fields.Add( 'RQ_FECHAMODIF', exDateTime );
         SqlProg.Fields.Add( 'RQ_USUMODIF', frmPrincipal.dbLogin.UserId );
         SqlProg.Fields.Add( 'RQ_FECHABAJA', exNull );
         SqlProg.Fields.Add( 'RQ_USUBAJA', exNull );
         tsProgramaDeSeg.Font.Color := clWindowText;

      end else begin
         SqlProg.SqlType := stInsert;
         iIdRechazoPS := GetSecNextVal('hys.SEQ_HRB_ID');

         SqlProg.Fields.Add( 'RQ_ID',iIdRechazoPS );
         SqlProg.Fields.Add( 'RQ_FECHAALTA', exDateTime );
         SqlProg.Fields.Add( 'RQ_USUALTA', frmPrincipal.dbLogin.UserId );
      end;

      EjecutarSqlST( SqlProg.Sql );
      EjecutarSqlST( ' UPDATE afi.aes_establecimiento '+
                     '    SET es_fechabaja = SYSDATE, '+
                     '        es_fecharecepcionbaja = SYSDATE, '+
                     '        ES_IDMOTIVOBAJA = 2, '+
                     '        es_usubaja = '+SqlValue(frmPrincipal.dbLogin.UserId)+
                     '  WHERE ES_CONTRATO = '+SqlValue(FContrato)+
                     '    AND ES_NROESTABLECI = '+SqlValue(FEstableci));
      iIdEmpresa := ValorSql('SELECT co_idempresa FROM afi.aco_contrato WHERE co_contrato = '+SqlValue(FContrato));
      EjecutarStoreSTEx( 'art.hys.do_actualizarestado (:idempresa, :estableci); ',[iIdEmpresa,FEstableci]);

      for i := 0 to clRechazosProgramaSeguridad.Items.Count - 1 do
      begin
        if clRechazosProgramaSeguridad.Checked[i] then
        begin
          if not ExisteSql('SELECT 1 '+
                           '  FROM hys.hrm_rechazomotivops '+
                           ' WHERE rm_idrechazops = '+SqlValue(iIdRechazoPS)+
                           '   AND rm_codigomotivorechazo = '+SqlString(clRechazosProgramaSeguridad.Values[i]) ) then
            EjecutarSqlST(' INSERT INTO hys.hrm_rechazomotivops (rm_id, rm_idrechazops, '+
                                                               ' rm_codigomotivorechazo, rm_fechaalta, rm_usualta) '+
                               ' VALUES (hys.seq_hrm_id.NEXTVAL, '+SqlValue(iIdRechazoPS)+','+
                                         SqlValue(clRechazosProgramaSeguridad.Values[i])+', SYSDATE,'+SqlValue(Sesion.UserID) +')')
          else
            EjecutarSqlST(' UPDATE hys.hrm_rechazomotivops '+
                          '    SET rm_fechamodif = sysdate, '+
                          '        rm_usumodif = '+SqlValue(Sesion.UserID)+','+
                          '        rm_fechabaja = NULL, '+
                          '        rm_usubaja = NULL '+
                          '  WHERE rm_idrechazops = '+SqlValue(iIdRechazoPS)+
                          '    AND rm_codigomotivorechazo = '+SqlValue(clRechazosProgramaSeguridad.Values[i]));
        end
        else
        begin
          if ExisteSql('SELECT 1 '+
                       '  FROM hys.hrm_rechazomotivops '+
                       ' WHERE rm_idrechazops = '+SqlValue(iIdRechazoPS)+
                       '   AND rm_codigomotivorechazo = '+SqlString(clRechazosProgramaSeguridad.Values[i])) then
          begin
            EjecutarSqlST(' UPDATE hys.hrm_rechazomotivops '+
                          '    SET rm_fechabaja = SYSDATE, '+
                          '        rm_usubaja = '+SqlValue(Sesion.UserID)+
                          '  WHERE rm_idrechazops = '+SqlValue(iIdRechazoPS)+
                          '    AND rm_codigomotivorechazo = '+SqlString(clRechazosProgramaSeguridad.Values[i]));
          end;
        end;
      end;
    finally
      SqlProg.Free;
    end;
  end;
end;

function TfrmObras.GetModifiedRechazoPS: Boolean;
begin
  Result := (edFechaRechazoPS.Date <> edFechaRechazoPS.Tag) or
            (cbRechazoPS.Tag <> 0) or  (clRechazosProgramaSeguridad.Tag <> 0);

end;

procedure TfrmObras.SetModifiedRechazoAO(const Value: Boolean);
begin
  edObservacionesRechazo.Modified := Value;

  if not Value Then begin
    edFechaRechazoAO.Tag    := Trunc( edFechaRechazoAO.Date );
    cbRechazoAO.Tag := 0;
    cbIncompleto.Tag := 0;
    cbFaltanFirmas.Tag := 0;
    cbContratoInactivo.Tag := 0;
    cbNoCorrespondePresentacion.Tag := 0;
  end;
end;

procedure TfrmObras.SetModifiedRechazoPS(const Value: Boolean);
begin
  if not Value Then begin
    edFechaRechazoPS.Tag := Trunc( edFechaRechazoPS.Date );
    cbRechazoPS.Tag := 0;
    clRechazosProgramaSeguridad.Tag := 0;
  end
  else
  begin
    cbRechazoPS.Tag := 1;
  end;
end;

procedure TfrmObras.clRechazosProgramaSeguridadClick(Sender: TObject);
begin
  clRechazosProgramaSeguridad.Tag := 1;
end;

procedure TfrmObras.LoadRechazo;
Var
  sSql    : String;
  sdqRechazoAO, sdqRechazoPS, sdqRechazoMotivoPS : TSDQuery;
begin
  sSql := ' SELECT rb_id, rb_fecharechazo, rb_nocorrespondepresentacion, rb_incompleto, '+
          '        rb_faltanfirmas, rb_contratoinactivo, rb_observaciones, rb_fechaalta, '+
          '        rb_usualta, rb_fechamodif, rb_usumodif, rb_fechabaja, rb_usubaja, '+
          '        rb_cuit, rb_estableci '+
          '   FROM hys.hrb_rechazoavisoobra '+
          '  WHERE rb_cuit = '+SqlValue(FCuit)+
          '    AND rb_estableci = '+SqlValue(FEstableci);

  sdqRechazoAO := GetQuery( sSql );
  if Assigned(sdqRechazoAO) and sdqRechazoAO.Active and (not sdqRechazoAO.IsEmpty) Then begin
    edFechaRechazoAO.Date               := sdqRechazoAO.FieldByName('RB_FECHARECHAZO').AsDateTime;
    edFechaRechazoAO.Tag                := Trunc( edFechaRechazoAO.Date );
    cbIncompleto.Checked                := sdqRechazoAO.FieldByName('RB_INCOMPLETO').AsString = 'S';
    cbFaltanFirmas.Checked              := sdqRechazoAO.FieldByName('RB_FALTANFIRMAS').AsString = 'S';
    cbContratoInactivo.Checked          := sdqRechazoAO.FieldByName('RB_CONTRATOINACTIVO').AsString = 'S';
    cbNoCorrespondePresentacion.Checked := sdqRechazoAO.FieldByName('RB_NOCORRESPONDEPRESENTACION').AsString = 'S';
    cbRechazoAO.Checked                 := cbIncompleto.Checked or cbFaltanFirmas.Checked or cbContratoInactivo.Checked;
    edObservacionesRechazo.Text         := sdqRechazoAO.FieldByName('RB_OBSERVACIONES').AsString;
    cbRechazoAOClick(nil);
    cbRechazoAO.Tag := 0;
  end;

  sSql := ' SELECT rq_id, rq_fecharechazo, rq_fechaalta, rq_usualta, '+
          '        rq_fechamodif, rq_usumodif, rq_fechabaja, rq_usubaja, '+
          '        rq_cuit, rq_estableci '+
          '   FROM hys.hrq_rechazops  '+
          '  WHERE rq_cuit = '+SqlValue(FCuit)+
          '    AND rq_fechabaja IS NULL '+
          '    AND rq_estableci = '+SqlValue(FEstableci);

  sdqRechazoPS := GetQuery( sSql );
  if Assigned(sdqRechazoPS) and sdqRechazoPS.Active and (not sdqRechazoPS.IsEmpty) Then begin
    edFechaRechazoPS.Date               := sdqRechazoPS.FieldByName('RQ_FECHARECHAZO').AsDateTime;
    edFechaRechazoPS.Tag                := trunc(edFechaRechazoPS.Date);
    cbRechazoPS.Checked                 := True;
    cbRechazoPSClick(nil);
    sSql := ' SELECT rm_id, rm_idrechazops, rm_codigomotivorechazo, rm_fechaalta, '+
            '        rm_usualta, rm_fechamodif, rm_usumodif, rm_fechabaja, rm_usubaja '+
            '   FROM hys.hrm_rechazomotivops '+
            '  WHERE rm_idrechazops = '+SqlValue(sdqRechazoPS.FieldByName('rq_id').AsInteger)+
            '    AND rm_fechabaja IS NULL ';

    sdqRechazoMotivoPS := GetQuery( sSql );
    if Assigned(sdqRechazoMotivoPS) and sdqRechazoMotivoPS.Active and (not sdqRechazoMotivoPS.IsEmpty) Then
    begin
      while not sdqRechazoMotivoPS.Eof do
      begin
        clRechazosProgramaSeguridad.Check(sdqRechazoMotivoPS.FieldByName('rm_codigomotivorechazo').AsString);
        sdqRechazoMotivoPS.Next;
      end;
    end;
  end;
  SetModifiedRechazoPS(False);
  SetModifiedRechazoAO(False);
end;


procedure TfrmObras.cbIncompletoClick(Sender: TObject);
begin
  cbIncompleto.Tag := 1;
end;

procedure TfrmObras.cbFaltanFirmasClick(Sender: TObject);
begin
  cbFaltanFirmas.Tag := 1;
end;

procedure TfrmObras.cbContratoInactivoClick(Sender: TObject);
begin
  cbContratoInactivo.Tag := 1;
end;

procedure TfrmObras.chgObraIngCivilClick(Sender: TObject);
begin
  chgObraIngCivil.Tag := 1;
end;

procedure TfrmObras.ExportarResolucionPDFResolucion;
var
  sPath, sBody, sMail : String;
  vAdjuntos: TArrayOfAttach;
begin
(*
  sSql :=
    ' SELECT or_descripcion '+
    '   FROM hys.hps_programaseguridad, hys.hor_obrasresolucion '+
    '  WHERE ps_resolucion = or_id '+
    '    AND PS_CUIT = '+SqlValue(FCuit);
  if FID <> '' then
    sSql := sSql + ' AND ps_id = '+ SqlValue(FID);

    sSql := sSql + ' AND ps_establecimiento = '+ SqlValue(FEstableci);
  resolucion := ValorSql(sSql);
*)
  sPath := IncludeTrailingBackslash(TempPath) +  'resolucionProgSeg.pdf';
  if (fraResolucionAvisoObra.Value = 3) or (fraResolucionAvisoObra.Value = 2) then
  begin
    if ExisteSql('Select 1 from hys.hfv_fechasvisitas where fv_Cuit = ' + SqlValue(FCuit) + ' and fv_estableci = ' + SqlValue(FEstableci))then
    begin
      with TrptResolucionSRT51.Create(Self) do
      try
        cambioResolucion(fraResolucionAvisoObra.Descripcion);
        Exportar(FCuit,FEstableci,FTipo,FID,sPath);
      finally
        Free;
      end;
    end
    else
    begin
      with TrptResolucionSRT51SinVisita.Create(Self) do
      try
        cambioResolucion(fraResolucionAvisoObra.Descripcion);
        Exportar(FCuit,FEstableci,FTipo,sPath);
      finally
        Free;
      end;
    end;
  end
  else if fraResolucionAvisoObra.Value = 1 then
  begin
    with TrptResolucionSRT.Create(Self) do
    try
      Exportar(FCuit,FEstableci,FTipo,sPath);
    finally
      Free;
    end;
  end;

  SetLength(vAdjuntos, 1);
  vAdjuntos[0] := GetAttach(sPath, 0);

  sMail := ValorSql(' SELECT prev.it_email || '';'' || cor.it_email '+
           '   FROM art.pit_firmantes prev, art.pit_firmantes cor '+
           '  WHERE prev.it_codigo = art.hys.get_preventor_estab(' + SqlValue(FCuit) + ', ' +
                                                                                      SqlValue(FEstableci) + ', ' +
                                                                                  'SYSDATE) '+
           '    AND prev.it_idsupervisor = cor.it_id ');

  if (chgObraActividad.Value[2] = 'S') or (chgObraActividad.Value[1] = 'S') then
    sMail:= sMail+';ncapararo;smeza';


  sBody := 'El preventor es: '+ValorSql ('SELECT it_nombre ' +
                                  '  FROM art.pit_firmantes ' +
                                  ' WHERE it_codigo = art.hys.get_preventor_estab(' + SqlValue(FCuit) + ', ' +
                                                                                      SqlValue(FEstableci) + ', ' +
                                                                                  'SYSDATE)');
  if FModifiedCronograma then
  begin
    if EnviarMailBD(sMail, 'Carátula de construcción',
          [],
          sBody, vAdjuntos, 0, tcDefault) then
      InfoHint(tsAvisoObra, 'El e-mail con la carátula de construcción ha sido enviado con éxito.')
    else
      InvalidMsg(tsAvisoObra, 'Error al enviar el e-mail con la carátula de construcción.');
  end;
end;

procedure TfrmObras.SaveCronogramaVisitas;
var
  idObra : Integer;
  fechaMax, fechaAntMax, fechaProxVisita: TDateTime;
  mesActual: String;
  periodo: integer;
begin
  idObra := ValorSqlIntegerEx('SELECT AO_ID FROM PAO_AVISOOBRA a WHERE AO_CUIT = :cuit AND AO_ESTABLECI = :estableci AND AO_FECHABAJA IS NULL '+
                              'AND AO_OPERATIVO = (SELECT MAX(AO_OPERATIVO) FROM PAO_AVISOOBRA PAO WHERE PAO.AO_CUIT = a.ao_cuit AND PAO.AO_ESTABLECI = a.AO_ESTABLECI)', [FCuit, FEstableci]);

  EjecutarSqlST(
    ' DELETE hys.hfv_fechasvisitas '+
    '  WHERE fv_idavisoobra = '+Sqlvalue(idObra));
  cdsRegistros.First;
  while not cdsRegistros.Eof do
  begin
    EjecutarSqlST(
      ' INSERT INTO hys.hfv_fechasvisitas '+
      '             (fv_id, fv_fecha, fv_fechadesde, fv_obligatorio, fv_idavisoobra, fv_usualta, fv_fechaalta, fv_estableci, fv_cuit '+
      '             ) '+
      '      VALUES (hys.seq_hfv_id.NEXTVAL, '+SqlValue(cdsRegistros.Fields[0].AsString)+','+SqlDate(cdsRegistros.FieldByName('FechaDesde').AsDateTime)+','+SqlValue(cdsRegistros.Fields[2].AsString)+
      ', '+ SqlValue(idObra)+', '+SqlValue(frmPrincipal.dbLogin.UserId)+', SYSDATE ,'+SqlValue(FEstableci)+ ', ' + FCuit +
      '             )' );
    cdsRegistros.Next;
  end;

  if (edObraFechaExtension.Date <> fechaExtensionInicial) and (fraResolucion.value in [2,3]) then
  begin
    FModifiedCronograma := true;
    fechaMax := ValorSqlDateTime(
      ' SELECT MAX(fv_fecha) '+
      '   FROM hys.hfv_fechasvisitas '+
      '  WHERE fv_idavisoobra = '+SqlValue(idObra));
    fechaAntMax := ValorSqlDateTime(
      ' SELECT MAX(fv_fecha) '+
      '   FROM hys.hfv_fechasvisitas '+
      '  WHERE fv_idavisoobra = '+SqlValue(idObra)+
      '    AND fv_fecha <> '+SqlDate(fechaMax));

    if (fechaMax <> 0) and (fechaAntMax <> 0) then
    begin
      periodo := ValorSqlInteger(
        ' SELECT GREATEST(TRUNC(MONTHS_BETWEEN('+SqlDate(fechaMax)+', '+SqlDate(fechaAntMax)+')), 1)'+
        '   FROM DUAL');

      fechaProxVisita := ValorSqlDateTime(
        ' SELECT ADD_MONTHS('+SqlDate(fechaMax)+','+ SqlValue(periodo)+')'+
        '   FROM DUAL');

      mesActual := FormatDateTime('yyyymm',ValorSqlDateTime('SELECT art.actualdate FROM dual'));
      while (edObraFechaExtension.Date >= fechaProxVisita) do
      begin
        if FormatDateTime('yyyymm',fechaProxVisita) > mesActual then
          EjecutarSqlST(
            ' INSERT INTO hys.hfv_fechasvisitas '+
            '             (fv_id, fv_fecha, fv_fechadesde, fv_idavisoobra, fv_usualta, fv_fechaalta, fv_estableci, fv_cuit '+
            '             ) '+
            '      VALUES (hys.seq_hfv_id.NEXTVAL, '+SqlDate(fechaProxVisita)+ ','+SqlDate(cdsRegistros.FieldByName('FechaDesde').AsDateTime)+
            ', '+ SqlValue(idObra)+', '+SqlValue(frmPrincipal.dbLogin.UserId)+', SYSDATE ,'+SqlValue(FEstableci) + ', ' + SqlValue(FCuit) +
            '             )' );

        fechaProxVisita := ValorSqlDateTime(
          ' SELECT ADD_MONTHS('+SqlDate(fechaProxVisita)+','+SqlValue(periodo)+')'+
          '   FROM DUAL');
      end;
    end;
  end;
  EjecutarStoreST(' art.hys.do_generarvisitasao('+SqlValue(idObra)+');');
end;

procedure TfrmObras.cdsRegistrosAfterPost(DataSet: TDataSet);
begin
  FModifiedCronograma := True;
end;

procedure TfrmObras.cdsRegistrosAfterDelete(DataSet: TDataSet);
begin
  FModifiedCronograma := True;
end;

procedure TfrmObras.ExportarProgramaSeguridadAprobado;
begin
  if fraAprobo.IsSelected and fraAprobo.Modified then
  begin
    with TrptProgramaSeguridadAprobado.Create(Self) do
    try
      Load(FCuit,FEstableci,FOperativo);
    finally
      Free;
    end;
  end;
end;

procedure TfrmObras.ExportarProgramaSeguridadRechazo;
begin
  with TrptProgramaSeguridadRechazo.Create(Self) do
  try
    Load(FCuit,FEstableci,FOperativo);
  finally
    Free;
  end;
end;

procedure TfrmObras.ExportarAvisoObraRechazo;
begin
  with TrptAvisoObraRechazado.Create(Self) do
  try
    Load(FCuit,FEstableci);
  finally
    Free;
  end;
end;

function TfrmObras.ObtenerPeriodicidadVisitas:Integer; //En meses
var
  i : Integer;
  sIn, CantMeses, codPostal: String;
begin
 {
  1_  Meses: _Excavación
  2_  Meses: _Demolición
  3_  Meses: 3_Albañilería
  4_  Meses: 3_HºAº
  5_  Meses: 4_Montajes Electromecánicos
  6_  Meses: 4_Instalaciones Varias
  7_  Meses: 4_Estructuras Metálicas
  8_  Meses: 3_Electricidad
  9_  Meses: 2_Ascensores, montacargas o montapersonas
  10_ Meses: 3_Pintura
  11_ Meses: 2_¿Tiene la obra mas de 1000m² de superficie cubierta o se trabaja a más de 4 mts. de altura?
  12_ Meses: 2_Silletas o Andamios Colgantes
  13_ Meses: 2_Medios de Izaje
  14_ Meses: 2_Alta y media Tensión
  }
  codPostal := ValorSql( ' SELECT es_cpostal '+
                         '   FROM afi.aes_establecimiento '+
                         '  WHERE es_contrato = '+SqlValue(FContrato)+
                         '    AND es_nroestableci = '+SqlValue(FEstableci)+
                         '    AND es_fechabaja IS NULL ');

  i := 3;
  while i < 15 do
  begin
    if chgObraActividad.Value[i] = 'S' then
    begin
      if sIn <> '' then
      begin
        sIn := sIn +','+ IntToStr(i);
      end
      else
      begin
        sIn := IntToStr(i);
      end;
    end;
    Inc(i);
  end;
  if sIn <> '' then
    CantMeses := ValorSql('SELECT MIN (pc_cantidadmeses) '+
                          '  FROM hys.hpc_periodicidadaocodpostal '+
                          ' WHERE pc_idactividad IN ('+sIn+') '+
                          '   AND pc_codigopostaldesde <= '+SqlValue(codPostal)+
                          '   AND pc_codigopostalhasta >= '+SqlValue(codPostal))
  else
    CantMeses := ValorSql('SELECT MIN (pc_cantidadmeses) '+
                          '  FROM hys.hpc_periodicidadaocodpostal '+
                          ' WHERE pc_idactividad IN (15)'+
                          '   AND pc_codigopostaldesde <= '+SqlValue(codPostal)+
                          '   AND pc_codigopostalhasta >= '+SqlValue(codPostal));

  if CantMeses <> '' then
    Result := StrToInt(CantMeses)
  else
  begin
    if (chgObraActividad.Value[9] = 'S') or (chgObraActividad.Value[11] = 'S') or (chgObraActividad.Value[12] = 'S') or
       (chgObraActividad.Value[13] = 'S') or (chgObraActividad.Value[14] = 'S') then
      result := 2
    else if (chgObraActividad.Value[3] = 'S') or (chgObraActividad.Value[4] = 'S') or (chgObraActividad.Value[8] = 'S') or
        (chgObraActividad.Value[10] = 'S') then
      result := 3
    else if (chgObraActividad.Value[5] = 'S') or (chgObraActividad.Value[6] = 'S') or (chgObraActividad.Value[7] = 'S') then
      result := 4
    else
      result := 5;
  end;
end;

procedure TfrmObras.CargarAvisodeObraWeb(idavisoobraweb : Integer; ACuit : String; AEstableci : Integer; ATipo, AOperativo: String);
var
  sSQL : String;
  contactoAOWeb, contactoafi : Integer;
  sdqFechaVisita : TSDQuery;
begin
  tsAvisoObra.ActivePageIndex := 0;
  ScrollBox.VertScrollBar.Position := 0;
  tsAvisoObraInt.Font.Color := clWindowText;
  VCLExtra.LockControls(fraResolucion,false);
  VCLExtra.LockControls(edRecep, true);
  //VCLExtra.LockControls(fraResolucionAvisoObra,True);
  sSQL := 'SELECT * FROM hys.haw_avisoobraweb WHERE AW_ID = '+SqlValue(idavisoobraweb);
  FCarga                        := True;
  with getquery(sSQL) do
  try
    with fraResolucionAvisoObra do
    begin
      TableName   := 'hys.hor_obrasresolucion';
      FieldID     := 'or_id';
      FieldCodigo := 'or_id';
      FieldDesc   := 'or_descripcion';
      Showbajas   := true;
      FieldBaja   := 'or_fechabaja';
    end;

    with fraResolucion do
    begin
      TableName   := 'hys.hor_obrasresolucion';
      FieldID     := 'or_id';
      FieldCodigo := 'or_id';
      FieldDesc   := 'or_descripcion';
      Showbajas   := true;
      FieldBaja   := 'or_fechabaja';
      OnChange    := OnResolucionChange;
    end;

    FCuit      := ACuit;
    FEstableci := AEstableci;
    FTipo      := ATipo;
    FOperativo := AOperativo;

    LoadProgSeg;
    LoadRechazo;

    fraContactoObra.fraTelefonos.Initialize(False, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');
    edObraFechaDeclaracion.Date   := FieldByName( 'aw_fechainicio' ).AsDateTime;
    cbFaltaFisico.Checked         := True;
    cbFormularioWeb.Checked      := True;
    cbFormularioWebClick(nil);
    //if not edObraSuperficie.IsEmpty then
      edObraSuperficie.Value        := FieldByName( 'aw_superficie' ).AsInteger;
    //if not edObraNroPlantas.IsEmpty then
      edObraNroPlantas.Value        := FieldByName( 'aw_plantas' ).AsInteger;
    chgObraIngCivil.Value         := FieldByName( 'aw_ingenieriacivil' ).AsString;
    chgObraMontInd.Value          := FieldByName( 'aw_montajeindustrial' ).AsString;
    chgObraDuctos.Value           := FieldByName( 'aw_ductos' ).AsString;
    chgObraRedes.Value            := FieldByName( 'aw_redes' ).AsString;
    chgObraOtras.Value            := FieldByName( 'aw_otras' ).AsString;
    chgObraArq.Value              := FieldByName( 'aw_arquitectura' ).AsString;

    ObraActividadCarga            := FieldByName( 'aw_actividad' ).AsString;
    if ObraActividadCarga[15] = 'S' then ObraActividadCarga[11] := 'S';
    chgObraActividad.Value        := copy(ObraActividadCarga, 1, 14);
    //chgObraActividad.Value        := sdqObra.FieldByName( 'AO_ACTIVIDAD' ).AsString;

    edObraActOtros.Text           := FieldByName( 'aw_actividadotros' ).AsString;
    edObraFechaFin.Date           := FieldByName( 'aw_fechafindeobra' ).AsDateTime;
    edObraFechaSusp.Date          := FieldByName( 'aw_fechasuspension' ).AsDateTime;
    edObraFechaReinicio.Date      := FieldByName( 'aw_fechareinicio' ).AsDateTime;
    edObraFechaExtension.Date     := FieldByName( 'aw_fechaextension' ).AsDateTime;
    edFechaExcavacion.Date        := FieldByName( 'aw_fechaexcavacion' ).AsDateTime;
    edFechaDemolicion.Date        := FieldByName( 'aw_fechademolicion' ).AsDateTime;
    edFechaExc503Desde.Date       := FieldByName( 'aw_fechadesdeexcavacion503' ).AsDateTime;
    edFechaExc503Hasta.Date       := FieldByName( 'aw_fechahastaexcavacion503' ).AsDateTime;
    edDetalleRes503.Text          := FieldByName( 'aw_detalleexcavacion503' ).AsString;
    cbExcavacion503.Checked       := FieldByName( 'aw_excavacion503' ).AsString = 'S';

    edFechaExcavacionHasta.Date   := FieldByName( 'aw_fechaexcavacionhasta' ).AsDateTime;
    edFechaDemolicionHasta.Date   := FieldByName( 'aw_fechademolicionhasta' ).AsDateTime;
    cbSubmuraciones.Checked       := FieldByName( 'aw_submuraciones' ).AsString = 'S';
    cbSubsuelos.Checked           := FieldByName( 'aw_subsuelos' ).AsString = 'S';
    cbTotal.Checked               := FieldByName( 'aw_total' ).AsString = 'S';
    cbParcial.Checked             := FieldByName( 'aw_parcial' ).AsString = 'S';

    edFechaAltaAO.Date            := FieldByName( 'aw_fechaalta' ).AsDateTime;
    edUsuAltaAO.Text              := FieldByName( 'aw_usualta' ).AsString;
    edObraObservaciones.Text      := FieldByName( 'AW_DESCRIPCIONOBRA' ).AsString;
    fraResolucionAvisoObra.Codigo := FieldByName( 'aw_resolucion' ).AsString;
    //Comitente
    cbComitente.Checked                 := FieldByName( 'AW_COMITENTE' ).AsString = 'S';
    edCuitComitente.Text                := FieldByName( 'AW_CUITCOMITENTE' ).AsString;
    edRazonSocialComitente.Text         := FieldByName( 'AW_RAZONSOCIALCOMITENTE' ).AsString;
    //Contratista
    cbContratista.Checked               := FieldByName( 'AW_CONTRATISTA' ).AsString = 'S';
    edCuitContratista.Text              := FieldByName( 'AW_CUITCONTRATISTA' ).AsString;
    edRazonSocialContratista.Text       := FieldByName( 'AW_RAZONSOCIALCONTRATISTA' ).AsString;
    //SubContratista
    cbSubcontratista.Checked            := FieldByName( 'AW_SUBCONTRATISTA' ).AsString = 'S';
    edCuitSubcontratista.Text           := FieldByName( 'AW_CUITSUBCONTRATISTA' ).AsString;
    edRazonSocialSubContratista.Text    := FieldByName( 'AW_RAZONSOCIALSUBCONTRATISTA' ).AsString;
    FModifiedCronograma := True;

    //Responsable
    edNombreResp.Text           := FieldByName( 'AW_NOMBRERESP' ).AsString;
    edApellidoResp.Text         := FieldByName( 'AW_APELLIDORESP' ).AsString;
    fraTipoTelResp.Codigo       := FieldByName( 'AW_TIPOTELEFONORESP' ).AsString;
    edCodAreaResp.Text          := FieldByName( 'AW_CODAREARESP' ).AsString;
    edTelefonoResp.Text         := FieldByName( 'AW_TELEFONORESP' ).AsString;
    edEmailResp.Text            := FieldByName( 'AW_EMAILRESP' ).AsString;
    edTipoDocumentoResp.Text    := FieldByName( 'AW_TIPODOCUMENTORESP' ).AsString;
    edNumeroDocumentoResp.Text  := FieldByName( 'AW_NUMERODOCUMENTORESP' ).AsString;
    cbRespSexoMasc.Checked      := FieldByName( 'AW_SEXORESP' ).AsString = 'M';
    cbRespSexoFem.Checked       := FieldByName( 'AW_SEXORESP' ).AsString = 'F';



    //Carga de Contacto
    contactoAOWeb := ValorSqlInteger
                              ( ' SELECT CT_ID '+
                                '   FROM act_contacto '+
                                '  WHERE ct_numerodocumento = (SELECT cw_numerodocumento '+
                                '                                FROM hys.hcw_contactoobraweb '+
                                '                               WHERE cw_id = '+SqlValue(FieldByName( 'aw_contactoaoweb' ).AsString)+')');
    if contactoAOWeb > 0 then
    begin
      with GetQuery(' SELECT * FROM hys.hcw_contactoobraweb WHERE cw_id = '+SqlValue(FieldByName( 'aw_contactoaoweb' ).AsString) ) do
      begin
        EjecutarSqlST(' INSERT INTO afi.ATN_TELEFONOCONTACTO( tn_idcontacto, tn_idtipotelefono, tn_area, '+
                       '             tn_numero,tn_INTERNO,tn_principal, Tn_OBSERVACION,  tn_fechaalta, tn_usualta) '+
                       '      SELECT '+SqlValue(contactoAOWeb)+',TA_IDTIPOTELEFONO,TA_AREA,TA_NUMERO,TA_INTERNO,TA_PRINCIPAL,TA_OBSERVACION, '+
                       '              TA_FECHAALTA, TA_USUALTA '+
                       '        FROM hys.hta_telefonoavisoobraweb '+
                       '       WHERE ta_idcontactoavisoobraweb = '+SqlValue(FieldByName( 'cw_id' ).AsString)+
                       '         AND NOT EXISTS(SELECT 1 '+
                       '                          FROM afi.act_contacto, hys.hcw_contactoobraweb, afi.atn_telefonocontacto '+
                       '                         WHERE ct_numerodocumento = cw_numerodocumento '+
                       '                           AND cw_id = ta_idcontactoavisoobraweb '+
                       '                           AND tn_idcontacto = ct_id '+
                       '                           AND tn_numero = ta_numero) ');
        EjecutarSqlST('UPDATE afi.act_contacto '+
                      '   SET ct_contacto = '+SqlValue(FieldByName( 'cw_contacto' ).AsString)+','+
                      '       ct_cargo = '+SqlValue(FieldByName( 'cw_cargo' ).AsString)+','+
                      '       ct_codareatelefonos = '+SqlValue(FieldByName( 'cw_codareatelefonos' ).AsString)+','+
                      '       ct_telefonos = '+SqlValue(FieldByName( 'cw_telefonos' ).AsString)+','+
                      '       ct_codareafax = '+SqlValue(FieldByName( 'cw_codareafax' ).AsString)+','+
                      '       ct_fax = '+SqlValue(FieldByName( 'cw_fax' ).AsString)+','+
                      '       ct_direlectronica = '+SqlValue(FieldByName( 'cw_direlectronica' ).AsString)+','+
                      '       ct_fechamodif = SYSDATE,'+
                      '       ct_usumodif = '+SqlValue(Sesion.UserID)+
                      ' WHERE ct_id = '+SqlValue(contactoAOWeb)
                    );
        fraContactoObra.fraTelefonos.CopiarTelefonosATemp;
      end;

      fraContactoObra.ContactoId := contactoAOWeb;

    end
    else
    begin
      if not FieldByName( 'aw_contactoaoweb' ).IsNull then
      begin
        contactoafi := GetSecNextVal('SEQ_ACT_ID');
        EjecutarSqlST('INSERT INTO afi.act_contacto '+
                    '            (ct_id, ct_idempresa, ct_contacto, ct_cargo, ct_codareatelefonos, ct_telefonos, ct_codareafax, ct_fax, '+
                    '             ct_direlectronica, ct_fechaalta, ct_usualta, ct_tipodocumento, ct_numerodocumento, ct_firmante, ct_remitentecarta, '+
                    '             ct_sexo, ct_tipofirma) '+
                    '      SELECT '+SqlValue(contactoafi)+', (SELECT em_id '+
                    '                                    FROM afi.aem_empresa '+
                    '                                   WHERE em_cuit = '+SqlValue(FCuit)+'), cw_contacto, cw_cargo, cw_codareatelefonos, cw_telefonos, '+
                    '             cw_codareafax, cw_fax, cw_direlectronica, cw_fechaalta, cw_usualta, cw_tipodocumento, cw_numerodocumento, '+
                    '             cw_firmante, cw_remitentecarta, cw_sexo, cw_tipofirma '+
                    '        FROM hys.hcw_contactoobraweb '+
                    '       WHERE cw_id = '+SqlValue(FieldByName( 'aw_contactoaoweb' ).AsString));
        EjecutarSqlST('INSERT INTO afi.ATN_TELEFONOCONTACTO( tn_idcontacto, tn_idtipotelefono, tn_area, '+
                    '  tn_numero,tn_INTERNO,tn_principal, Tn_OBSERVACION,  tn_fechaalta, tn_usualta) '+
                    '      SELECT '+SqlValue(contactoafi)+',TA_IDTIPOTELEFONO,TA_AREA,TA_NUMERO,TA_INTERNO,TA_PRINCIPAL,TA_OBSERVACION, '+
                    '              TA_FECHAALTA, TA_USUALTA '+
                    '        FROM hys.hta_telefonoavisoobraweb '+
                    '       WHERE TA_IDCONTACTOAVISOOBRAWEB = '+SqlValue(FieldByName( 'aw_contactoaoweb' ).AsString));


        fraContactoObra.fraTelefonos.CopiarTelefonosATemp;
        fraContactoObra.ContactoId := contactoafi;
      end;
    end;

    //

    if FieldByName( 'AW_TIPO' ).AsString = 'AO' then
    begin
      rgTipo.ItemIndex :=0;
      edObraFechaRecepcion.Date := DBDate;
    end
    else if FieldByName( 'AW_TIPO' ).AsString = 'E' then
      rgTipo.ItemIndex :=1
    else if FieldByName( 'AW_TIPO' ).AsString = 'S' then
      rgTipo.ItemIndex :=2
    else if FieldByName( 'AW_TIPO' ).AsString = 'SD' then
      rgTipo.ItemIndex :=3
    else
      rgTipo.ItemIndex :=-1;

    if (FieldByName( 'AW_TIPO' ).AsString <> 'AO') and
       (FieldByName( 'AW_TIPO' ).AsString <> '') then
    begin
      edObraFechaRecepcion.Date := ValorSqlDateTime(
         'SELECT AO_FECHARECEPCION '+
         '  FROM PAO_AVISOOBRA ' +
          'WHERE AO_CUIT = ''' + FCuit + ''' ' +
            'AND AO_ESTABLECI = ' +  IntToStr( FEstableci ) + ' ' +
            'AND AO_OPERATIVO = (SELECT MAX(AO_OPERATIVO) ' +
                                ' FROM PAO_AVISOOBRA PAO ' +
                                ' WHERE PAO.AO_CUIT = ''' + FCuit + ''' ' +
                                ' AND PAO.AO_ESTABLECI = ' +  IntToStr( FEstableci ) +  ')' );
      edRecep.Text := ValorSql(
         'SELECT AR_NRORECEPCION '+
         '  FROM hys.har_avisoobranrorecepcion ' +
          'WHERE AR_CUIT = ''' + FCuit + ''' ' +
            'AND AR_ESTABLECI = ' +  IntToStr( FEstableci )  );
      Foperativo := valorsql('SELECT MAX(AO_OPERATIVO) ' +
                              ' FROM PAO_AVISOOBRA PAO ' +
                             ' WHERE PAO.AO_CUIT = ''' + FCuit + ''' ' +
                               ' AND PAO.AO_ESTABLECI = ' +  IntToStr( FEstableci ) );
    end;
    sdqFechaVisita := GetQuery(
        ' SELECT fv_fecha, fv_idvisita, fv_obligatorio, fv_fechadesde '+
        '   FROM hys.hfv_fechasvisitas '+
        '  WHERE fv_cuit ='+ SqlValue(FCuit)+
        '    AND fv_estableci = '+SqlValue(FEstableci)+ ' ORDER BY fv_fecha' );

    if Assigned(sdqFechaVisita) and sdqFechaVisita.Active and (not sdqFechaVisita.IsEmpty) Then
    begin
      cdsRegistros.EmptyDataSet;
      while not sdqFechaVisita.Eof do
      begin
        cdsRegistros.Append;
        cdsRegistros.FieldByName('Fecha').AsDateTime := sdqFechaVisita.FieldByName('fv_fecha').AsDateTime;
        cdsRegistros.FieldByName('Idvisita').AsInteger := sdqFechaVisita.FieldByName('fv_idvisita').AsInteger;
        cdsRegistros.FieldByName('Obligatorio').AsString := sdqFechaVisita.FieldByName('fv_obligatorio').AsString;
        cdsRegistros.FieldByName('FechaDesde').AsDateTime := sdqFechaVisita.FieldByName('fv_fechadesde').AsDateTime;
        cdsRegistros.Post;
        sdqFechaVisita.Next;
      end;
    end;
    if cbProgSeg.Checked then
      cbProgSegClick(nil);
  FModifiedCronograma := false;
  finally
    FCarga := False;
    Free;
  end;
end;

procedure TfrmObras.btnProcesarClick(Sender: TObject);
var
  sOperativo : String;
begin
  Verificar(ValorSql('SELECT aw_estado FROM hys.haw_avisoobraweb WHERE aw_id = '+SqlValue(FIDAOWeb)) <> 'P',btnProcesar,'Debe estar en estado pendiente el aviso de obra web.');
                     Application.CreateForm(TfrmFet, frmFet);
  sOperativo := valorSql(
      ' SELECT MAX (ao_operativo) '+
      '    FROM hys.haw_avisoobraweb, '+
      '         afi.aco_contrato, '+
      '         afi.aem_empresa, '+
      '         art.pao_avisoobra '+
      '   WHERE aw_contrato = co_contrato '+
      '     AND co_idempresa = em_id '+
      '     AND ao_cuit = em_cuit '+
      '     AND aw_estableci = ao_estableci '+
      '     AND aw_id = '+SqlValue(FIDAOWeb) );
  frmFet := TfrmFet.Create(Self);
  with frmFet do
  try

    FIDAvisoObraWeb := FIDAOWeb;
    fraEmpresa.Contrato := FContrato;
    OnEmpresaChange(nil);
    //fraEmpresa.ReadOnly := True;
    if FEstableci = 0 then
    begin
      tbAfiliaciones.Click;
      ShowModal;
    end
    else
    begin
      fraEstableciBusq.Cargar(fraEmpresa.CUIT,
                          FEstableci, false);
      OnfraEstableciBusqChange(nil);
      fraTipoFet.Codigo := 'CO';
      OnTipoFetChange(nil);
      if sOperativo <> '' then
        fraOperativo.Codigo := sOperativo;
      btnBuscar.Click;
      ShowModal;
    end;
    if FGuardadoAOWeb then
    begin
      EjecutarSql('UPDATE hys.haw_avisoobraweb '+
                '   SET aw_estado = ''T'', '+
                '       aw_usumodif = '+SqlValue(Sesion.UserID)+', '+
                '       aw_fechamodif = SYSDATE '+
                ' WHERE aw_id = '+SqlValue(FIDAOWeb));
      MsgBox('El aviso de obra web se ha marcado como Procesado.', MB_OK , 'Aviso de obra Web');

    end;
  finally
    Free;
  end;
  Close;
end;

procedure TfrmObras.btnRechazarClick(Sender: TObject);
var
  sEmpresa, sContrato, sCuit, sDescCiuu, sTipoObra,sDomicilio, sMailResp, sMailContacto :String;
begin
  Verificar(ValorSql('SELECT aw_estado FROM hys.haw_avisoobraweb WHERE aw_id = '+SqlValue(FIDAOWeb)) <> 'P',btnRechazar,'Debe estar en estado pendiente el aviso de obra web.');
  if fpMotivoRechazo.ShowModal = mrOk then
  begin
    with GetQuery(
      'SELECT em_nombre, co_contrato, em_cuit, '''' ac_descripcion, '+
      '       DECODE(aw_tipo, '+
      '              ''AO'', ''Obra'', '+
      '              ''E'', ''Extensión'', '+
      '              ''S'', ''Suspensión'', '+
      '              ''SD'', ''Suspensión Definitiva'', '+
      '              ''M'', ''Modificación Aviso de Obra'') aw_tipo, '+
      '      art.utiles.armar_domicilio(aw_calle, aw_numero, '''', '''', '+
      '                            art.utiles.armar_localidad(aw_cpostal, '''', aw_localidad, aw_provincia), '''') domic, aw_emailresp, '+
      '       (SELECT cw_direlectronica '+
      '          FROM hys.hcw_contactoobraweb '+
      '         WHERE cw_id = aw_contactoaoweb) mailcontacto '+
      '  FROM afi.aco_contrato, afi.aem_empresa, hys.haw_avisoobraweb '+
      ' WHERE aw_id = '+sqlvalue(FIDAOWeb)+
      '   AND aw_contrato = co_contrato '+
      '   AND co_idempresa = em_id ') do
    try
      sEmpresa      := FieldByName('em_nombre').AsString;
      sContrato     := FieldByName('co_contrato').AsString;
      sCuit         := FieldByName('em_cuit').AsString;
      sDescCiuu     := FieldByName('ac_descripcion').AsString;
      sTipoObra     := FieldByName('aw_tipo').AsString;
      sDomicilio    := FieldByName('domic').AsString;
      sMailResp     := FieldByName('aw_emailresp').AsString;
      sMailContacto := FieldByName('mailcontacto').AsString;
    finally
      Free;
    end;
    with TfrmMoldeEnvioMail.Create(Self) do
    begin
      FormStyle := fsNormal;
      Visible := False;
      Opciones := [oAlwaysShowDialog];
      if sMailResp <> '' then
      begin
        edDestinatario.Text := sMailResp;
        btAgregarDestinatarioClick(nil);
      end;
      if sMailContacto <> '' then
      begin
        edDestinatario.Text := sMailContacto;
        btAgregarDestinatarioClick(nil);
      end;
      edAsunto.Text := 'Aviso de Obra No Recepcionado';
      reTextoCuerpo.Lines.Add(
          '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}'+
          '\viewkind4\uc1\pard\lang11274\b\f0\fs20Sres. '+sEmpresa+'\par '+
          '\fs20 Contrato: '+sContrato+'  \tab\tab\tab CUIT: '+sCuit+'\b0\par '+
          'CIUU \b'+sDescCiuu+'\b0\par '+
          'Ref : Aviso de Obra No Recepcionado.\par\par '+
          'De nuestra consideraci\''f3n:\par\par '+
          'Por el presente le informamos que el \b Aviso de '+sTipoObra+'\b0  NO HA SIDO RECEPCIONADO oportunamente, '+          'para la dirección de \b '+sDomicilio+'\b0 .\par\par '+
          'Le pedimos que por favor revea la información suministrada a fin de poder verificar los datos faltantes y hacer efectiva la recepción del formulario. '+          'Puede verificar detalles de su presentación ingresando en la página de Provincia ART.\par\par '+          '\b Atte. \par '+
          'Gerencia Prevención \b0} ');
     ShowModal;
    end;

    EjecutarSql('UPDATE hys.haw_avisoobraweb '+
                '   SET aw_estado = ''R'', '+
                '       aw_usumodif = '+SqlValue(Sesion.UserID)+', '+
                '       AW_IDMOTIVORECHAZADO = '+SqlValue(fraMotivoRechazo.Value)+', '+
                '       aw_fechamodif = SYSDATE '+
                ' WHERE aw_id = '+SqlValue(FIDAOWeb));
    MsgBox('El aviso de obra web se ha marcado como Rechazado.', MB_OK , 'Aviso de obra Web');
  end;
  Close;
end;

procedure TfrmObras.tbImpresionFormularioAOClick(Sender: TObject);
var
  idobra : integer;
begin
  with TrptFormularioAvisodeObra.Create(nil) do
  try
    idobra := ValorSqlIntegerEx('SELECT AO_ID FROM PAO_AVISOOBRA a WHERE AO_CUIT = :cuit AND AO_ESTABLECI = :estableci AND AO_FECHABAJA IS NULL '+
                                'AND AO_OPERATIVO = (SELECT MAX(AO_OPERATIVO) FROM PAO_AVISOOBRA PAO WHERE PAO.AO_CUIT = a.ao_cuit AND PAO.AO_ESTABLECI = a.AO_ESTABLECI)', [FCuit, FEstableci]);
    FidAvisoOWeb := FIDAOWeb;
    if idobra > 0 then
      CargarAvisoDeObra(idobra);
  finally
    free;
  end;
end;

procedure TfrmObras.btnAceptarCambioTipoPrevClick(Sender: TObject);
begin
  Verificar(not fraMotivoRechazo.IsSelected, fraMotivoRechazo, 'Debe seleccionar el motivo de rechazo.');
  fpMotivoRechazo.ModalResult := mrOk;
end;

procedure TfrmObras.cbFormularioWebClick(Sender: TObject);
begin
  if cbFormularioWeb.Checked then
  begin
    vclExtra.LockControls([edFechaRecepFormFisico,fraUsuarioRecepFormFisico ],false);
  end
  else
  begin
    vclExtra.LockControls([edFechaRecepFormFisico,fraUsuarioRecepFormFisico ],true);
    edFechaRecepFormFisico.Clear;
    fraUsuarioRecepFormFisico.Clear;
  end;
end;

procedure TfrmObras.tbEnvioMailAOClick(Sender: TObject);
var
  sEmpresa, sContrato, sCuit, sDescCiuu, sTipoObra,sDomicilio, sMailResp, sMailContacto :String;
  sPathDestino :String;
  idobra : Integer;
begin
  idobra := ValorSqlIntegerEx('SELECT AO_ID FROM PAO_AVISOOBRA a WHERE AO_CUIT = :cuit AND AO_ESTABLECI = :estableci AND AO_FECHABAJA IS NULL '+
                              'AND AO_OPERATIVO = (SELECT MAX(AO_OPERATIVO) FROM PAO_AVISOOBRA PAO WHERE PAO.AO_CUIT = a.ao_cuit AND PAO.AO_ESTABLECI = a.AO_ESTABLECI)', [FCuit, FEstableci]);
  verificar(idobra = 0, tbEnvioMailAO, 'Debe estar guardado el aviso de obra.');
  with GetQuery(
    'SELECT em_nombre, co_contrato, em_cuit, ac_descripcion, '+
    '       DECODE(ao_tipoformulario, '+
    '              ''AO'', ''Obra'', '+
    '              ''E'', ''Extensión'', '+
    '              ''S'', ''Suspensión'', '+
    '              ''SD'', ''Suspensión Definitiva'', '+
    '              ''M'', ''Modificación Aviso de Obra'') ao_tipoformulario, '+
    '       art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, '+
    '       art.utiles.armar_localidad(es_cpostal, '''', es_localidad, es_provincia), '''') domic, AO_EMAILRESP, '+
    '       (SELECT ct_direlectronica FROM afi.act_contacto WHERE ct_id = ao_contacto) mailcontacto '+
    '  FROM afi.aco_contrato, afi.aem_empresa, afi.aes_establecimiento, comunes.cac_actividad, art.pao_avisoobra '+
    ' WHERE em_cuit = '+SqlValue(FCuit)+
    '   AND es_nroestableci =  '+SqlValue(FEstableci)+
    '   AND co_contrato = art.get_vultcontrato(em_cuit) '+
    '   AND co_idempresa = em_id '+
    '   AND co_contrato = es_contrato '+
    '   AND es_idactividad = ac_id '+
    '   AND ao_estableci = es_nroestableci '+
    '   AND ao_cuit = em_cuit ') do
  try
    sEmpresa      := FieldByName('em_nombre').AsString;
    sContrato     := FieldByName('co_contrato').AsString;
    sCuit         := FieldByName('em_cuit').AsString;
    sDescCiuu     := FieldByName('ac_descripcion').AsString;
    sTipoObra     := FieldByName('ao_tipoformulario').AsString;
    sDomicilio    := FieldByName('domic').AsString;
    sMailResp     := FieldByName('AO_EMAILRESP').AsString;
    sMailContacto := FieldByName('mailcontacto').AsString;
  finally
    Free;
  end;

  with TrptFormularioAvisodeObra.Create(nil) do
  try
    sPathDestino := ArmarPathAvisoObra(sContrato,FEstableci);
    //sPathDestino := 'C:\Temp\';
    FidAvisoOWeb := FIDAOWeb;
    Exportar(idobra, sPathDestino);
    sPathDestino := FPath;
  finally
    free;
  end;

  EnviarMailBD(sMailResp+','+sMailContacto,'Aviso de Obra Recepcionado',[oAlwaysShowDialog,oBodyIsRTF],
                '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}'+
                '\viewkind4\uc1\pard\lang11274\b\f0\fs20Sres. '+sEmpresa+'\par '+
                '\fs20 Contrato: '+sContrato+'  \tab\tab\tab CUIT: '+sCuit+'\b0\par '+
                'CIUU \b'+sDescCiuu+'\b0\par '+
                'Ref : Aviso de Obra Recepcionado.\par\par '+
                'De nuestra consideraci\''f3n:\par\par '+
                'Por el presente le informamos que el \b Aviso de '+sTipoObra+'\b0  ha sido RECEPCIONADO oportunamente, '+                'para la dirección de \b '+sDomicilio+'\b0 .\par\par '+
                'Recuerde que el documento recepcionado debe ser descargado de la página de Provincia ART, firmado por el responsable de la empresa o de dicha documentación y presentado oportunamente en '+                'Carlos Pellegrini 91 Piso 2do (junto con la presentación del Programa de Seguridad correspondiente). De lo contrario nos veremos obligados a informar su incumplimiento ante la '+                'Superintendencia de Riesgos de Trabajo (SRT).\par\par '+
                'Este mismo documento le sirve a ud., como acuse de recibo ante la presentación y recepción de los documentos a los cuales aquí se hace referencia.\par\par '+
                '\b Atte. \par '+
                'Gerencia Prevención \b0} ',GetAttachments(sPathDestino, 0),0,tcDefault, false);
end;

procedure TfrmObras.GuardarNroRecepcion;
var
  recepcion, orden : Integer;
begin
  if (edRecep.Text = '') then
  begin
    if fraResolucionAvisoObra.Codigo = '1' then
    begin
      if MsgBox('¿Desea el mismo número de recepción?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES then
      begin
        recepcion := IncSql(
            ' SELECT distinct nvl(MAX (AR_NRORECEPCION), 0) '+
            '   FROM HYS.HAR_AVISOOBRANRORECEPCION '+
            '  WHERE AR_CUIT = '+SqlValue(FCuit)+
            '    AND AR_NRORECEPCION IS NOT NULL '+
            '    AND AR_nroresolucion = 1 ',0);
        if recepcion = 30000 then
          recepcion := 32001;
        if recepcion = 0 then
        begin
          recepcion := IncSql(
            ' SELECT NVL (MAX (ao_recepcion), 0) '+
            '   FROM hys.har_avisoobranrorecepcion '+
            '  WHERE ar_nrorecepcion IS NOT NULL AND ar_nrorecepcion < 100000 ');
          orden := 1;
        end
        else
          orden := IncSql(
            ' SELECT MAX (ar_orden) '+
            '   FROM HYS.HAR_AVISOOBRANRORECEPCION '+
            '  WHERE ar_cuit = '+SqlValue(FCuit)+' AND AR_NRORESOLUCION = 1');
      end
      else
      begin
        recepcion := IncSql(
             ' SELECT NVL (MAX (ar_nrorecepcion), 0) '+
             '   FROM hys.har_avisoobranrorecepcion '+
             '  WHERE ar_nrorecepcion IS NOT NULL AND ar_nrorecepcion < 100000 ');
        orden := 1;
      end;
    end
    else
    begin
      recepcion := IncSql(
        ' SELECT NVL (MAX (ar_nrorecepcion), 0) '+
        '   FROM hys.har_avisoobranrorecepcion '+
        '  WHERE ar_nrorecepcion IS NOT NULL AND ar_nrorecepcion < 100000 ');
      if recepcion = 30000 then
          recepcion := 32001;
      orden := 1;
    end;
    edRecep.Text := IntToStr(recepcion);
    MsgBox('Se guardo con el número de recepción  '+IntToStr(recepcion)+'.',MB_ICONINFORMATION);
  end
  else begin
    recepcion := strToInt(edRecep.text);
    orden := IncSql(' SELECT nvl(MAX (ar_orden),0) '+
                    '   FROM hys.har_avisoobranrorecepcion '+
                    '  WHERE ar_nrorecepcion = '+SqlValue(edRecep.Text));
  end;
  if ExisteSql(' SELECT 1 FROM hys.har_avisoobranrorecepcion '+
               '  WHERE AR_CUIT = '+SqlValue(FCuit)+
               '    AND AR_ESTABLECI = '+SqlValue(FEstableci)) then
  BEGIN
    EjecutarSqlST('UPDATE hys.har_avisoobranrorecepcion '+
                  '   SET ar_nrorecepcion = '+SqlValue(recepcion)+
                  '       ar_orden = '+SqlValue(orden)+ ', '+
                  '       ar_fechamodif = sysdate,'+
                  '       ar_usumodif = '+SqlValue(Sesion.UserID)+
                  ' WHERE ar_cuit = '+SqlValue(FCuit)+
                  '   AND ar_estableci = '+SqlValue(FEstableci));
  END
  else
  begin
    EjecutarSqlST('INSERT INTO hys.har_avisoobranrorecepcion '+
                  '            (ar_id, ar_cuit, ar_estableci, ar_nrorecepcion, '+
                  '             ar_usualta, ar_fechaalta, ar_nroresolucion, ar_orden '+
                  '            ) '+
                  '     VALUES (hys.seq_har_id.NEXTVAL, '+SqlValue(FCuit)+','+SqlValue(FEstableci)+' ,'+
                               SqlValue(recepcion)+', '+SqlValue(Sesion.UserID)+',SYSDATE, '+
                               SqlValue(fraResolucionAvisoObra.Codigo)+','+SqlValue(orden)+')');
  end;
end;

end.


