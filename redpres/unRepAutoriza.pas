//IMPORTANTE!!!: Los reportes repREsAutoriza y qrAutoriza estan debajo de Grilla}
unit unRepAutoriza;

interface
                  
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Db, ComCtrls, ImgList, ToolEdit, ArtComboBox,
  StdCtrls, Mask, DateComboBox, ToolWin, SDEngine, Menus, Qrctrls,
  QueryToFile, Placemnt, SinEdit, Buttons, SortDlg, ExportDialog,
  unfraPrestador, Grids, DBGrids, RXDBCtrl, ArtDBGrid, ShortCutControl,
  unfraSubPrestacion, DBCheckCombo, artSeguridad,
  PatternEdit, ComboEditor, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArtDbFrame,
  unFraCodigoDescripcion, unFraGrupoTrabajo, unfraUsuarios, unfraDelegacion,
  unfraPrestaciones, CheckCombo, FormPanel, unfraCtbTablas, unSesion, sqlfuncs,
  unfraNomenclador, unFraNavegadorWEB, unFraGIS_APIv3, unFraDomicilio,
  unFraDomicilioGIS, RxPlacemnt, RxToolEdit;

type
  TqrpAutoriza = class(TForm)
    sdqAutoriza: TSDQuery;
    tbarAutoriza: TToolBar;
    dsAutoriza: TDataSource;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    tbLimpiar: TToolButton;
    tbPreview: TToolButton;
    tbPrint: TToolButton;
    tbGuardar: TToolButton;
    tbExit: TToolButton;
    ToolButton1: TToolButton;
    SortDialog: TSortDialog;
    tbOrdenar: TToolButton;
    ToolButton3: TToolButton;
    ExportDialog: TExportDialog;
    tbOcultarMostrar: TToolButton;
    dbgDatos: TArtDBGrid;
    tbRefrescar: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ShortCutControl: TShortCutControl;
    lblTitResultados: TLabel;
    ScrollBox1: TScrollBox;
    qrAutoriza: TQuickRep;
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    lblCriterio: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRDBText12: TQRDBText;
    QRShape12: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRBand6: TQRBand;
    QRLabel19: TQRLabel;
    QRShape14: TQRShape;
    qrlUsuario2: TQRLabel;
    QRSysData6: TQRSysData;
    ToolButton2: TToolButton;
    QRLabel12: TQRLabel;
    QRDBText16: TQRDBText;
    lblCantResultados: TLabel;
    QRBand3: TQRBand;
    qrlTitResultados: TQRLabel;
    qrlCantResultados: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape13: TQRShape;
    pmnuExportar: TPopupMenu;
    mnuExportarGrilla: TMenuItem;
    mnuExportarTraslados: TMenuItem;
    Seguridad: TSeguridad;
    ExportDialogTraslados: TExportDialog;
    PrintDialog: TPrintDialog;
    tbEnviarMail: TToolButton;
    QRShape16: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape15: TQRShape;
    dsUsuAprob: TDataSource;
    sdqUsuAprob: TSDQuery;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    tsFiltros1: TTabSheet;
    gbSiniestro: TGroupBox;
    SinEdit: TSinEdit;
    sbtnBuscar: TSpeedButton;
    gbDatosSin: TGroupBox;
    chkSinEvolucion: TCheckBox;
    chkInforme: TCheckBox;
    GroupBox1: TGroupBox;
    cmbEstado: TDBCheckCombo;
    GroupBox2: TGroupBox;
    fraPrestadorFiltro: TfraPrestador;
    gbGrupoTrabAut: TGroupBox;
    gbGrupoTrabSin: TGroupBox;
    fraGrupoTrabajo_Sin: TfraGrupoTrabajo;
    gbUsuarioAprobacion: TGroupBox;
    cmbUsuAprob: TDBCheckCombo;
    gbDelegacion: TGroupBox;
    GroupBox3: TGroupBox;
    dcmbRecepDesde: TDateComboBox;
    dcmbRecepHasta: TDateComboBox;
    Label6: TLabel;
    gbTurno: TGroupBox;
    cmbTurnoDesde: TDateComboBox;
    cmbTurnoHasta: TDateComboBox;
    Label1: TLabel;
    rbAuditadas: TRadioGroup;
    gbPrestacion: TGroupBox;
    gbSubPrestacion: TGroupBox;
    fraSubPrestacion: TfraSubPrestacion;
    gbMotivoAnulacion: TGroupBox;
    GroupBox5: TGroupBox;
    fraStaticCtbMotivoAnulac: TfraStaticCTB_TABLAS;
    fraStaticCtbMotivoRechazo: TfraStaticCTB_TABLAS;
    gbDatosEst: TGroupBox;
    chkSinImprimir: TCheckBox;
    chkSinMail: TCheckBox;
    fraDelegacion: TfraDelegacion;
    gbUsuariosPorPrest: TGroupBox;
    fraUsuariosPorPrest: TfraCodigoDescripcion;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    dcmbAproDesde: TDateComboBox;
    dcmbAproHasta: TDateComboBox;
    tbAnular: TToolButton;
    fpAnular: TFormPanel;
    Bevel3: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    btnAnuAceptar: TButton;
    btnAnuCancelar: TButton;
    edObservacionesAnu: TMemo;
    fraMotivoAnulacion: TfraCodigoDescripcion;
    gbRegionSanitPrest: TGroupBox;
    fraRegionSanitaria: TfraCtbTablas;
    cbPrestSinAsignar: TCheckBox;
    pmEnviarMail: TPopupMenu;
    mnuEnviarTraslados: TMenuItem;
    mnuEnviarAutorizaciones: TMenuItem;
    ExportDialogAutorizaciones: TExportDialog;
    rgEnvioMail: TRadioGroup;
    dbChkPrestacion: TDBCheckCombo;
    sdqPrestacion: TSDQuery;
    dsPrestacion: TDataSource;
    cbGtrabajoAut: TDBCheckCombo;
    sdqGtrabajo: TSDQuery;
    dsGtrabajo: TDataSource;
    tbViajeCompartido: TToolButton;
    fpCambioPrestacion: TFormPanel;
    lbPrestacion: TLabel;
    btnCamPrestCancelar: TButton;
    btnCamPrestAceptar: TButton;
    fraNomencladorCambio: TfraNomenclador;
    GroupBox6: TGroupBox;
    fraPrestadorCambio: TfraPrestador;
    pnlGIS: TPanel;
    Label3: TLabel;
    fraDomicilioGISDestino: TfraDomicilioGIS;
    pnlBottom: TPanel;
    btnCancelar: TButton;
    btnConfirmarViaje: TButton;
    FormStorage: TFormStorage;
    btnVerEnGoogleMaps: TButton;
    tbViajar: TToolButton;
    pmViajar: TPopupMenu;
    mnuViajarAutorizaciones: TMenuItem;
    fpVerCompartido: TFormPanel;
    pnlCompartido: TPanel;
    btnCerrar: TButton;
    pmContextual: TPopupMenu;
    mnuVerCompartido: TMenuItem;
    gbFechaAlta: TGroupBox;
    Label5: TLabel;
    dcmbAltaDesde: TDateComboBox;
    dcmbAltaHasta: TDateComboBox;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbPreviewClick(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure tbExitClick(Sender: TObject);
    procedure qrAutorizaBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbOcultarMostrarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure mnuExportarGrillaClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure mnuExportarTrasladosClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure tbAnularClick(Sender: TObject);
    procedure sdqAutorizaAfterScroll(DataSet: TDataSet);
    procedure btnAnuAceptarClick(Sender: TObject);
    procedure btnAnuCancelarClick(Sender: TObject);
    procedure fpAnularBeforeShow(Sender: TObject);
    procedure cbPrestSinAsignarClick(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
    procedure mnuEnviarTrasladosClick(Sender: TObject);
    procedure mnuEnviarAutorizacionesClick(Sender: TObject);
    procedure tbViajeCompartidoClick(Sender: TObject);
    procedure btnCamPrestAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarViajeClick(Sender: TObject);
    procedure fpCambioPrestacionShow(Sender: TObject);
    procedure btnVerEnGoogleMapsClick(Sender: TObject);
    procedure mnuViajarAutorizacionesClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure pmContextualPopup(Sender: TObject);
    procedure mnuVerCompartidoClick(Sender: TObject);
    procedure fpVerCompartidoShow(Sender: TObject);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure pmViajarPopup(Sender: TObject);
  private
    FPrimeraVezGIS: Boolean;
    lstOrderedAddress: TList;    
    fraGIS_APIv3: TfraGIS_APIv3;
    
    procedure DoUpdateFechaMail;
    procedure DoUpdateFechaMailAuto;
    function GenerarConsulta :Boolean;
    function HayRegistroActivo :Boolean;
    function Es_SiniestroCerrado(iIdExped: integer): Boolean;  // TK 24434
    procedure Do_UpdateAnularAutorizacion_ST(sEstado, sObservaciones, sMotivoAnulacion: string; iIdAuto: integer);  // TK 24434
    procedure Do_AnularAutorizacionDerivado_ST(iIdAuto, iSiniestro, iOrden, iRecaida: integer; sObservaciones: string);  // TK 24434
    procedure Do_UpdateSDO_DOCUMUTUAL_ST(iSiniestro, iOrden, iRecaida, iNumAuto: integer);  // TK 24434
    procedure Do_Update_MMS_MOVIM_STOCK_ST(iIdStock, iIdAuto: integer);     // TK 24434
    procedure DoFechaCargaAutorizDefault; // TK 38164
    function Do_EvaluarFiltros: boolean;  // TK 38164
  public
    cCriteria :String;
  end;

const FechaInicioART = '01/07/1996';

var
  qrpAutoriza: TqrpAutoriza;

implementation

uses
  unDmPrincipal, unPrincipal, unBusqSini, General, AnsiSql, CustomDlgs, unMoldeEnvioMail, ArchFuncs, unArt,
  unTercerizadoras, VCLExtra, unSiniestros, unGIS, ShellAPI, Strfuncs, DateTimeFuncs, Math,
  unRedPres, unAutSelPorSiniestro;

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------}
function TqrpAutoriza.GenerarConsulta :Boolean;
var
  sSql, sSqlWhere, sSqlWhere1, sSqlWhere2, sSqlSelect, sSqlSelect1, sSqlSelect2 :String;
  Resultado :Boolean;
  sRegSanitPrest, sViajeCompartido: String;
begin
   qrlUsuario2.Caption := Sesion.Usuario;
   sSqlWhere    := '';
   sSqlSelect   := '';
   sSqlSelect1  := '';
   sSqlSelect2  := '';

 // Validación -----------------------------------------------------------
   cCriteria    := '';
   Resultado    := False;

   if (dcmbAltaDesde.Date <> 0) and (dcmbAltaHasta.Date <> 0) and (dcmbAltaDesde.Date > dcmbAltaHasta.Date) then
      MessageDlg('Error en rangos de Fecha de Carga de Autorización' + #13 + #10 + 'Valor Fecha Desde Mayor que Valor Fecha Hasta', mtError, [mbOK], 0)

   else if (dcmbRecepDesde.Date <> 0) and (dcmbRecepHasta.Date <> 0) and (dcmbRecepDesde.Date > dcmbRecepHasta.Date) then
      MessageDlg('Error en rangos de Fecha de Recepción'+#13+#10+'Valor Fecha Desde Mayor que Valor Fecha Hasta', mtError, [mbOK], 0)
   else
      Resultado := True;

   if Resultado and Do_EvaluarFiltros then    // TK 38164
   begin
     // Carga los Filtros en los Sql -----------------------------------------
     // Consulta entre Rangos de Fecha de Carga de la Autorización
     if (dcmbAltaDesde.Date <> 0) and (dcmbAltaHasta.Date <> 0) then
     begin
        sSqlSelect   := ' /*+ index(art.sau_autorizaciones art.ndx_saufechalta) */ '; // por TK 38164, no acumulo porque es uno u otro... o blanco.
        sSqlWhere    := sSqlWhere + ' and au_fechaalta Between ' + dcmbAltaDesde.SqlText + ' and ' + dcmbAltaHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha de Alta: Del ' + dcmbAltaDesde.EditText + ' al ' + dcmbAltaHasta.EditText + #13+#10;
     end;
     // Consulta Desde Fecha de Carga de Autorización sin Hasta
     if (dcmbAltaDesde.Date <> 0) and (dcmbAltaHasta.Date = 0) then
     begin
        if (sSqlSelect = '') then // pregunto si no paso por el if de arriba, entonces lo completo.
          sSqlSelect  := ' /*+ index(art.sau_autorizaciones art.ndx_saufechalta) */ '; // TK 38164
        sSqlWhere    := sSqlWhere + ' and au_fechaalta >= ' + dcmbAltaDesde.SqlText;
        cCriteria    := cCriteria + 'Fecha de Alta: Desde el ' + dcmbAltaDesde.EditText + #13+#10;
     end;
     // Consulta Hasta Fecha de Carga de Autorización sin Desde
     if (dcmbAltaDesde.Date = 0) and (dcmbAltaHasta.Date <> 0) then
     begin
        (*
        if (sSqlSelect = '') then // pregunto si no paso por el if de arriba, entonces lo completo.
          sSqlSelect  := ' /*+ index(art.sau_autorizaciones art.ndx_saufechalta) */ '; // TK 38164
        *)
        sSqlWhere    := sSqlWhere + ' and au_fechaalta <= ' + dcmbAltaHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha de Alta: Hasta el ' + dcmbAltaHasta.EditText + #13+#10;
     end;
     // Consulta entre Rangos de Fecha de Recepción
     if (dcmbRecepDesde.Date <> 0) and (dcmbRecepHasta.Date <> 0) then
     begin
        if (sSqlSelect = '') then // pregunto si no paso por el if de arriba, entonces lo completo.
          sSqlSelect := ' /*+ index(art.sau_autorizaciones art.ndx_saufecharecep) */ '; // TK 38164
        sSqlWhere    := sSqlWhere + ' and Au_FechaRecep Between ' + dcmbRecepDesde.SqlText + ' and ' + dcmbRecepHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha de Recepción: Del ' + dcmbRecepDesde.EditText + ' al ' + dcmbRecepHasta.EditText + #13+#10;
     end;
     // Consulta Desde Fecha de Recepcion sin Hasta
     if (dcmbRecepDesde.Date <> 0) and (dcmbRecepHasta.Date = 0) then
     begin
        if (sSqlSelect = '') then // pregunto si no paso por el if de arriba, entonces lo completo.
          sSqlSelect := ' /*+ index(art.sau_autorizaciones art.ndx_saufecharecep) */ '; // TK 38164
        sSqlWhere    := sSqlWhere + ' and Au_FechaRecep >= ' + dcmbRecepDesde.SqlText;
        cCriteria    := cCriteria + 'Fecha de Recepción: Desde el ' + dcmbRecepDesde.EditText + #13+#10;
     end;
     // Consulta Hasta Fecha de Recepcion sin Desde
     if (dcmbRecepDesde.Date = 0) and (dcmbRecepHasta.Date <> 0) then
     begin
        (*
        if (sSqlSelect = '') then // pregunto si no paso por el if de arriba, entonces lo completo.
          sSqlSelect := ' /*+ index(art.sau_autorizaciones art.ndx_saufecharecep) */ '; // TK 38164
        *)
        sSqlWhere    := sSqlWhere + ' and Au_FechaRecep <= ' + dcmbRecepHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha de Recepción: Hasta el ' + dcmbRecepHasta.EditText + #13+#10;
     end;
     // Consulta de Turno (by LU. 10/04/2001)
     if (cmbTurnoDesde.Date <> 0) and (cmbTurnoHasta.Date <> 0) or (Abs(cmbTurnoDesde.Date - DBDate) < 30) then
     begin
        if (sSqlSelect = '') then
          if (sSqlSelect1 = '') then    // TK 38164
            sSqlSelect1 := ' /*+ index(art.str_traslados art.ndx_str_fecha) */ ';
          if (sSqlSelect2 = '') then
            sSqlSelect2 := ' /*+ index(art.sau_autorizaciones art.ind_sau_turno) */ ';

        sSqlWhere1   := ' and Tr_Fecha Between ' + cmbTurnoDesde.SqlText + ' and ' + cmbTurnoHasta.SqlText;
        sSqlWhere2   := ' and Au_Turno Between ' + cmbTurnoDesde.SqlText + ' and ' + cmbTurnoHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha del Turno: Del ' + cmbTurnoDesde.EditText + ' al ' + cmbTurnoHasta.EditText + #13+#10;
     end;
     // Consulta de Turno sin Desde. by LU
     if (cmbTurnoDesde.Date = 0) and (cmbTurnoHasta.Date <> 0) then
     begin
        if (sSqlSelect = '') then
          if (sSqlSelect1 = '') then    // TK 38164
            sSqlSelect1 := ' /*+ index(art.str_traslados art.ndx_str_fecha) */ ';
          if (sSqlSelect2 = '') then
            sSqlSelect2 := ' /*+ index(art.sau_autorizaciones art.ind_sau_turno) */ ';

        sSqlWhere1   := ' and Tr_Fecha <= ' + cmbTurnoHasta.SqlText;
        sSqlWhere2   := ' and Au_Turno <= ' + cmbTurnoHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha del Turno: Hasta el ' + cmbTurnoHasta.EditText + #13+#10;
     end;
     // Consulta de Turno sin Hasta. by LU
     if (cmbTurnoDesde.Date <> 0) and (cmbTurnoHasta.Date = 0) then
     begin
        if (sSqlSelect = '') then
          if (sSqlSelect1 = '') then    // TK 38164
            sSqlSelect1 := ' /*+ index(art.str_traslados art.ndx_str_fecha) */ ';
          if (sSqlSelect2 = '') then
            sSqlSelect2 := ' /*+ index(art.sau_autorizaciones art.ind_sau_turno) */ ';

        sSqlWhere1   := ' and Tr_Fecha >= ' + cmbTurnoDesde.SqlText;
        sSqlWhere2   := ' and Au_Turno >= ' + cmbTurnoDesde.SqlText;
        cCriteria    := cCriteria + 'Fecha de Turno: Desde el ' + cmbTurnoDesde.EditText + #13+#10;
     end;
     // Consulta entre Rangos de Fecha de Aprobacion
     if (dcmbAproDesde.Date <> 0) and (dcmbAproHasta.Date <> 0) then
     begin
        if (sSqlSelect = '') and (sSqlSelect1 = '') and (sSqlSelect2 = '') then
          sSqlSelect := ' /*+ index(art.sau_autorizaciones art.ndx_saufechapro) */ ';
        sSqlWhere    := sSqlWhere + ' and au_fechapro Between ' + dcmbAproDesde.SqlText + ' and ' + dcmbAproHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha de Aprobación: Del ' + dcmbAproDesde.EditText + ' al ' + dcmbAproHasta.EditText + #13+#10;
     end;
     // Consulta Desde Fecha de Aprobacion sin Hasta
     if (dcmbAproDesde.Date <> 0) and (dcmbAproHasta.Date = 0) then
     begin
        if (sSqlSelect = '') and (sSqlSelect1 = '') and (sSqlSelect2 = '') then
          sSqlSelect := ' /*+ index(art.sau_autorizaciones art.ndx_saufechapro) */ ';
        sSqlWhere    := sSqlWhere + ' and au_fechapro >= ' + dcmbAproDesde.SqlText;
        cCriteria    := cCriteria + 'Fecha de Aprobación: Desde el ' + dcmbAproDesde.EditText + #13+#10;
     end;
     // Consulta Hasta Fecha de Aprobacion sin Desde
     if (dcmbAproDesde.Date = 0) and (dcmbAproHasta.Date <> 0) then
     begin
        if (sSqlSelect = '') and (sSqlSelect1 = '') and (sSqlSelect2 = '') then
          sSqlSelect := ' /*+ index(art.sau_autorizaciones art.ndx_saufechapro) */ ';
        sSqlWhere    := sSqlWhere + ' and au_fechapro <= ' + dcmbAproHasta.SqlText;
        cCriteria    := cCriteria + 'Fecha de Aprobación: Hasta el ' + dcmbAproHasta.EditText + #13+#10;
     end;

     // Consulta con Estado
     if (cmbEstado.CheckedCount > 0) then
     begin
        sSqlWhere    := sSqlWhere + ' and au_estado ' + cmbestado.InSql; //  sdqEstados.FieldByName('tb_codigo').AsString + '''';
        cCriteria    := cCriteria + 'Estado/s: ' + Copy(cmbestado.Text, 0, Length(cmbEstado.Text)-2) + #13+#10;
     end;

     // Consulta con Grupo de Trabajo de la Autorización   // Lu 04/09/2008
     if not cbGtrabajoAut.IsEmpty then
     begin
        if (sSqlSelect = '') and (sSqlSelect1 = '') and (sSqlSelect2 = '') then // pregunto si no paso por el de la Fechaalta, porque sino tiene prioridad ese, y este no lo completo.
          sSqlSelect  := ' /*+ index(art.sau_autorizaciones art.ndx_sau_autorizaciones_gtrabaj) */ '; // TK 38164
        sSqlWhere    := sSqlWhere + ' and au_trabajo ' + cbGtrabajoAut.InSql;
        cCriteria    := cCriteria + 'Grupo de Trabajo de la Autorización: ' + cbGtrabajoAut.Text + #13+#10;
     end;

     // Consulta con Prestador (by LU)
     if fraPrestadorFiltro.IDPrestador <> 0 then
     begin
        if (cmbTurnoDesde.Date <> 0) or (cmbTurnoHasta.Date <> 0) then   // para que no use índice por identifprestador sino por fecha (Tr_Fecha y Au_Turno)
          sSqlWhere    := sSqlWhere + ' and NVL(AU_IDENTIFPRESTADOR, 0) = ' + SqlValue(fraPrestadorFiltro.IDPrestador)
        else
          sSqlWhere    := sSqlWhere + ' and AU_IDENTIFPRESTADOR = ' + SqlValue(fraPrestadorFiltro.IDPrestador);
        cCriteria    := cCriteria + 'Prestador: ' +  fraPrestadorFiltro.RazonSocial + #13+#10;
     end;

     // Consulta con Delegación
     if not fraDelegacion.IsEmpty then
     begin
       sSqlWhere    := sSqlWhere + ' AND NVL(ex_Delegacion, ''840'') = ' + SqlValue(fraDelegacion.Codigo);
       cCriteria    := cCriteria + 'Delegación: ' + SqlValue(fraDelegacion.Descripcion) + #13+#10;
     end;

     // Consulta con Prestaciones
     if (dbChkPrestacion.text <> '') then
     begin
       sSqlWhere    := sSqlWhere + ' and NVL(au_presapro,au_pressol) ' + dbChkPrestacion.InSql;
       cCriteria    := cCriteria + 'Prestación: ' + dbChkPrestacion.Text + #13+#10;
     end;

     // Consulta con SubPrestaciones (by LU. 10/04/2001)
     if Trim(fraSubprestacion.edCodigo.Text) <> '' then
     begin
       sSqlWhere    := sSqlWhere + ' and NVL(au_subapro,Au_SubPrest) = ''' + fraSubprestacion.edCodigo.Text + '''';
       cCriteria    := cCriteria + 'SubPrestación: ' + fraSubprestacion.cmbDescripcion.Text + #13+#10;
     end;
     // Consulta Sin Imprimir
     if chkSinImprimir.Checked then
     begin
       sSqlWhere    := sSqlWhere + ' AND AU_FECHAIMPRESION IS NULL';
       cCriteria    := cCriteria + 'Sin Imprimir' + #13+#10;
     end;
     // Consulta Sin mail
     if chkSinMail.Checked then
     begin
       sSqlWhere    := sSqlWhere + ' AND AU_FECHAMAIL IS NULL';
       cCriteria    := cCriteria + 'Sin mail' + #13+#10;
     end;
     // Consulta Sin Auditar
     case rbAuditadas.ItemIndex of
       0: begin
            sSqlWhere    := sSqlWhere + ' AND ((au_fechaauditoria IS NOT NULL) ' +
                                          ' OR (art.siniestro.get_autorizacionexigeaudit(au_id) = ''N'')) ';
            cCriteria    := cCriteria + 'Auditados'#13#10;
          end;
       1: begin
            sSqlWhere    := sSqlWhere + ' AND au_fechaauditoria IS NULL ' +
                                        ' AND art.siniestro.get_autorizacionexigeaudit(au_id) = ''S'' ';
            cCriteria    := cCriteria + 'Sin Auditar'#13#10;
          end;
       2: begin
            cCriteria    := cCriteria + 'Auditados y No Auditados'#13#10;
          end;
     end;

     // Autorizaciones enviadas por mail
     case rgEnvioMail.ItemIndex of
       0: begin
            sSqlWhere    := sSqlWhere + ' AND au_fechamaillist IS NOT NULL ';
            cCriteria    := cCriteria + 'Enviadas por mail'#13#10;
          end;
       1: begin
            sSqlWhere    := sSqlWhere + ' AND au_fechamaillist IS NULL ';
            cCriteria    := cCriteria + 'No enviadas por mail'#13#10;
          end;
       2: begin
            cCriteria    := cCriteria + 'Enviadas y no enviadas por mail'#13#10;
          end;
     end;

     if fraStaticCtbMotivoAnulac.IsSelected then
     begin
       sSqlWhere    := sSqlWhere + ' and au_MotivoAnulacion=' + SqlValue(fraStaticCtbMotivoAnulac.Value);
       cCriteria    := cCriteria + 'Mot. Anulación: ' + fraStaticCtbMotivoAnulac.cmbDescripcion.Text + #13+#10;
     end;

     if fraStaticCtbMotivoRechazo.IsSelected then
     begin
       sSqlWhere    := sSqlWhere + ' and au_MotivoRechazo=' + SqlValue(fraStaticCtbMotivoRechazo.Value);
       cCriteria    := cCriteria + 'Mot. Rechazo: ' + fraStaticCtbMotivoRechazo.cmbDescripcion.Text + #13+#10;
     end;

     // Consulta con Grupo de Trabajo del Siniestro. Modificada Lu 16/04/2008 por Personalizacion de Siniestros
     if fraGrupoTrabajo_Sin.IsSelected then
     begin
       if fraGrupoTrabajo_Sin.edCodigo.Text <> '' then
       begin
         sSqlWhere    := sSqlWhere + ' AND ex_gtrabajo = ' + fraGrupoTrabajo_Sin.ID;
         cCriteria    := cCriteria + 'Grupo de Trabajo del Siniestro: ' + fraGrupoTrabajo_Sin.ID + #13+#10;
       end;
       if fraGrupoTrabajo_Sin.cmbGestor.Text <> '' then
       begin
         sSqlWhere    := sSqlWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo_Sin.cmbGestor.Text);
         cCriteria    := cCriteria + 'Usuario Gestor del Siniestro: ' + fraGrupoTrabajo_Sin.cmbGestor.Text + #13+#10;
       end;
     end;

     //Consulta de usuario de aprobación
     if cmbUsuAprob.Text <> '' then
     begin
       sSqlWhere := sSqlWhere + ' AND au_usuapro ' + cmbUsuAprob.InSql;
       cCriteria := cCriteria + 'Usuario/s aprobación: ' + Copy(cmbUsuAprob.Text, 0, Length(cmbUsuAprob.Text)-2) + #13+#10;
     end;

     if fraUsuariosPorPrest.IsSelected then
     begin
       sSqlWhere := sSqlWhere + '  AND ex_prestador IN (SELECT pu_idprestador ' +
                                                     ' FROM cpu_prestadorusuario ' +
                                                    ' WHERE pu_usuario = ' + SqlValue(fraUsuariosPorPrest.Codigo) +
                                                      ' AND pu_fechabaja IS NULL) ';
       cCriteria := cCriteria + 'Usuario/s por Prest: ' + fraUsuariosPorPrest.Descripcion + #13+#10;
     end;

     if cbPrestSinAsignar.Checked = true then
     begin
       sSqlWhere := sSqlWhere + ' AND ex_prestador IN ( ' +
                                 ' SELECT ca_identificador ' +
                                   ' FROM art.cpr_prestador ' +
                                  ' WHERE ca_fechabaja IS NULL ' +
                                    ' AND ca_identificador NOT IN (SELECT pu_idprestador ' +
                                                                   ' FROM art.cpu_prestadorusuario ' +
                                                                  ' WHERE pu_fechabaja IS NULL)) ';

       cCriteria := cCriteria + 'Usuario/s por Prest: ' + fraUsuariosPorPrest.Descripcion + #13+#10;
     end;

     if EsUsuarioDeTercerizadora then     // por Plan Ioma - Tercerizadoras
     begin
       sSqlWhere := sSqlWhere + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';
       cCriteria := cCriteria + 'Siniestros tercerizados' + #13+#10;
     end;

     if fraRegionSanitaria.IsSelected then     // TK 26039
     begin
       sSqlWhere := sSqlWhere + ' AND EXISTS(SELECT 1 FROM art.crp_regionesprestador WHERE ca_identificador = rp_prestador AND rp_region = ' + SqlValue(fraRegionSanitaria.Codigo) + ') ';
       cCriteria := cCriteria + 'Región Sanitaria del Prest.: ' + fraRegionSanitaria.Descripcion + #13+#10;
     end;

     if Is_UsuarioSML(Sesion.UserID) then   // Plan - SML
     begin
       sSqlWhere := sSqlWhere + ' AND art.siniestro.get_siniestrosml(au_idexpediente) = ''S'' ';
       cCriteria := cCriteria + 'Siniestros de SML' + #13+#10;
     end;

     // Consulta con Numero de Siniestro
     if (SinEdit.Siniestro > 0) then
     begin               // Ignoro todos los filtros anteriores
        sSqlWhere    := sSqlWhere + ' and au_siniestro = ' + SqlInt(SinEdit.Siniestro) +
                                    ' and au_orden = ' + SqlInt(SinEdit.Orden) +
                                    ' and au_recaida = ' + SqlInt(SinEdit.Recaida);
        cCriteria    := cCriteria + 'Siniestro Nº: ' + SinEdit.Text + #13+#10;
     end;

     sRegSanitPrest := ' (SELECT region.tb_descripcion ' +
                           'FROM art.crp_regionesprestador, art.ctb_tablas region ' +
                          'WHERE ca_identificador = rp_prestador ' +
                            'AND region.tb_clave = ''REGSA'' ' +
                            'AND region.tb_codigo = rp_region ' +
                            'AND rp_domicilio = ''S'') AS regsanitprest ';

     sViajeCompartido := ' (SELECT vc_url ' +
                             'FROM amed.mvc_viajecompartido, amed.mvd_viajecompartido_detalle ' +
                            'WHERE tr_id = vd_idtraslado ' +
                              'AND vd_idviajecompartido = vc_id) AS vc_url';


     //----Realiza la consulta ----------------------------------------------------------------
     if not chkSinEvolucion.Checked then
     begin
       ssql := ' Select ' + sSqlSelect + sSqlSelect1 + ' au_siniestro, au_orden, au_recaida, au_numauto, au_trabajo, au_presapro,au_pressol, ' +
                      ' art.utiles.Armar_Siniestro(au_siniestro, au_orden, au_recaida,''-'') NRO_SINIESTRO, ' +
                      ' tj_nombre, tj_cuil, art.Cuit_PonerGuiones(tj_cuil) CUIL_GUIONES,' +
                      ' NVL(ex_fecharecaida,ex_fechaaccidente) FECHA_REC_ACCI, ex_fecharecaida, ex_fechaaccidente, ' +
                      ' PR_DESCRIPCION || ''; '' || au_detalle PRESTACION, ' +
                      ' NVL(tr_fecha,au_turno) turno,au_turno, NVL(tr_hora,au_turnohora) Hora, ' +
                      ' au_fechasoli, au_fechaalta, NVL(au_cantapro, au_cantidad) as au_cantidad,' +
                      ' EST.tb_descripcion ESTADO, ex_altamedica, ex_delegacion, el_Nombre DELEGACION, ' +
                      ' AUT.gp_nombre GRUPO_AUT, SIN.gp_nombre GRUPO_SIN, CA_DESCRIPCION , SUB.tb_descripcion SUBPRESTACION,nvl(au_impoapro, au_importe) IMPORTE,' +
                      ' au_dcalle, au_dnumero, au_dpiso, au_ddepartamento, au_dlocalidad, au_dprovincia, au_dcpostal, ' +
                      ' au_hcalle, au_hnumero, au_hlocalidad, au_hprovincia, au_hcpostal, ' +
                      ' (SELECT ca_descripcion FROM art.cpr_prestador WHERE ca_identificador = au_presthasta) prestador_hasta, ' +
                      ' art.UTILES.Armar_Domicilio(au_dcalle, au_dnumero, au_dpiso, au_ddepartamento, au_dlocalidad) DOMICILIO_DESDE,' +
                      ' art.UTILES.Armar_Domicilio(au_hcalle, au_hnumero, au_hpiso, au_hdepartamento, au_hlocalidad) DOMICILIO_HASTA,' +
                      ' art.UTILES.Armar_Domicilio(au_dcalle, au_dnumero, au_dpiso, au_ddepartamento) DIRECCION_DESDE, au_dlocalidad LOCALIDAD_DESDE,' +
                      ' art.UTILES.Armar_Domicilio(au_hcalle, au_hnumero, au_hpiso, au_hdepartamento) DIRECCION_HASTA, au_hlocalidad LOCALIDAD_HASTA,' +
                      ' art.trabajador.get_telefono(tj_id, 4) TEL, au_acompanante ACOMP, au_espera ESPERA, au_retorno RETORNO, ca_Identificador, au_Observaciones, au_ObservacionesImpresion,' +
                      ' au_fechaauditoria, au_usuauditoria, au_fechapro, au_usuapro,' +
                      ' pv_fecharecepcion Recep_Info, pv_fechaalta Carga_Info, au_motivoanulacion, au_motivorechazo, au_kmbase, au_kmviaje, au_kmexcedente, NVL(au_kmbase, 0) + au_kmviaje + NVL(au_kmexcedente, 0) kmtotal, ' +
                      ' MOTREC.tb_descripcion descrmotivorechazo, MOTANUL.tb_descripcion descrmotivoanulacion, art.siniestro.get_usuariogestor(ex_id) USUGESTOR, aut.gp_email, ' +
                      ' au_estado, au_id, au_idexpediente, pr_formulario, au_idstock, ' +
                      ' ' + sRegSanitPrest + ', au_fechamaillist, nvl(au_detalleapro, au_detalle) au_detalleapro, ' +
                      ' au_detalleapro detalleapro, au_tdesde, au_thasta, au_cantapro, au_cantconsu, au_identifapro, tr_id, ' + sViajeCompartido + ', AU_FENTREGAORTOP, ' +
                      ' pv_desde.pv_descripcion as prov_desde, pv_hasta.pv_descripcion as prov_hasta, ' +
                      ' au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, au_pres_nomenclador || ''-'' || au_pres_capitulo || ''-'' || au_pres_codigo as MODULO ' +
               ' From ctj_trabajador, art.ctb_tablas MOTREC, art.ctb_tablas MOTANUL, art.ctb_tablas EST, art.ctb_tablas SUB, art.mgp_gtrabajo AUT, art.mgp_gtrabajo SIN, art.CPR_PRESTADOR, art.sex_expedientes, ' +
                     ' art.del_delegacion, art.mpr_prestaciones, art.str_traslados, art.sau_autorizaciones, art.spv_parteevolutivo spv, ' +
                     ' art.cpv_provincias pv_desde, art.cpv_provincias pv_hasta ' +
               ' Where au_idexpediente = ex_id ' +
                     ' AND au_id = tr_idauto ' +
                     ' AND tr_fechabaja IS NULL ' +
                     ' AND tr_fechaanulacion IS NULL ' +
                     ' AND ex_idtrabajador = tj_id ' +
                     ' AND au_dprovincia = pv_desde.pv_codigo(+) ' +
                     ' AND au_hprovincia = pv_hasta.pv_codigo(+) ' +
                     ' AND EST.tb_clave = ''MUAUT'' ' +
                     ' AND SUB.tb_clave(+) = ''SUBPR'' ' +
                     ' AND EST.tb_codigo = au_estado ' +
                     ' AND SUB.tb_codigo(+) = NVL(AU_SUBAPRO, au_subprest) ' +
                     ' AND au_trabajo = AUT.gp_codigo ' +
                     ' AND ex_gtrabajo = SIN.gp_codigo ' +
                     ' AND CA_IDENTIFICADOR = AU_IDENTIFPRESTADOR ' +
                     ' AND EL_ID = EX_DELEGACION ' +
                     ' AND PR_CODIGO = nvl(au_presapro,au_pressol) ' +
                     ' AND au_siniestro = pv_siniestro(+) ' +
                     ' AND au_orden = pv_orden(+) ' +
                     ' AND au_recaida = pv_recaida(+) ' +
                     ' AND spv.pv_fechabaja(+) IS NULL ' +
                     ' AND au_numauto = pv_autorizacion(+) ' +
                     ' AND MOTREC.tb_clave(+) = ''MOTR'' ' +
                     ' AND MOTREC.tb_codigo(+) = au_motivorechazo ' +
                     ' AND MOTANUL.tb_clave(+) = ''MOTAN'' ' +
                     ' AND MOTANUL.tb_codigo(+) = au_motivoanulacion ' +
               sSqlWhere + sSqlWhere1 +

               ' Union All ' +

               ' Select ' + sSqlSelect + sSqlSelect2 + ' au_siniestro, au_orden, au_recaida, au_numauto, au_trabajo, au_presapro,au_pressol, ' +
                      ' art.utiles.Armar_Siniestro(au_siniestro, au_orden, au_recaida,''-'') NRO_SINIESTRO, ' +
                      ' tj_nombre, tj_cuil, art.Cuit_PonerGuiones(tj_cuil) CUIL_GUIONES,' +
                      ' NVL(ex_fecharecaida,ex_fechaaccidente) FECHA_REC_ACCI, ex_fecharecaida, ex_fechaaccidente, ' +
                      ' PR_DESCRIPCION || ''; '' || au_detalle PRESTACION, ' +
                      ' NVL(tr_fecha,au_turno) turno,au_turno, NVL(tr_hora,au_turnohora) Hora, ' +
                      ' au_fechasoli, au_fechaalta, NVL(au_cantapro, au_cantidad) as au_cantidad,' +
                      ' EST.tb_descripcion ESTADO, ex_altamedica, ex_delegacion, el_Nombre DELEGACION, ' +
                      ' AUT.gp_nombre GRUPO_AUT, SIN.gp_nombre GRUPO_SIN, CA_DESCRIPCION , SUB.tb_descripcion SUBPRESTACION,nvl(au_impoapro, au_importe) IMPORTE,' +
                      ' au_dcalle, au_dnumero, au_dpiso, au_ddepartamento, au_dlocalidad, au_dprovincia, au_dcpostal, ' +
                      ' au_hcalle, au_hnumero, au_hlocalidad, au_hprovincia, au_hcpostal, ' +
                      ' (SELECT ca_descripcion FROM art.cpr_prestador WHERE ca_identificador = au_presthasta) prestador_hasta, ' +                      
                      ' art.UTILES.Armar_Domicilio(au_dcalle, au_dnumero, au_dpiso, au_ddepartamento, au_dlocalidad) DOMICILIO_DESDE,' +
                      ' art.UTILES.Armar_Domicilio(au_hcalle, au_hnumero, au_hpiso, au_hdepartamento, au_hlocalidad) DOMICILIO_HASTA,' +
                      ' art.UTILES.Armar_Domicilio(au_dcalle, au_dnumero, au_dpiso, au_ddepartamento) DIRECCION_DESDE, au_dlocalidad LOCALIDAD_DESDE,' +
                      ' art.UTILES.Armar_Domicilio(au_hcalle, au_hnumero, au_hpiso, au_hdepartamento) DIRECCION_HASTA, au_hlocalidad LOCALIDAD_HASTA,' +
                      ' art.trabajador.get_telefono(tj_id, 4) TEL, au_acompanante ACOMP, au_espera ESPERA, au_retorno RETORNO, ca_Identificador, au_Observaciones, au_ObservacionesImpresion,' +
                      ' au_fechaauditoria, au_usuauditoria, au_fechapro, au_usuapro,' +
                      ' pv_fecharecepcion Recep_Info, pv_fechaalta Carga_Info, au_motivoanulacion, au_motivorechazo, au_kmbase, au_kmviaje, au_kmexcedente, NVL(au_kmbase, 0) + au_kmviaje + NVL(au_kmexcedente, 0) kmtotal, ' +
                      ' MOTREC.tb_descripcion descrmotivorechazo, MOTANUL.tb_descripcion descrmotivoanulacion, art.siniestro.get_usuariogestor(ex_id) USUGESTOR, aut.gp_email, ' +
                      ' au_estado, au_id, au_idexpediente, pr_formulario, au_idstock, ' +
                      ' ' + sRegSanitPrest + ', au_fechamaillist, nvl(au_detalleapro, au_detalle) au_detalleapro, ' +
                      ' au_detalleapro detalleapro, au_tdesde, au_thasta, au_cantapro, au_cantconsu, au_identifapro, tr_id, ' + sViajeCompartido + ', AU_FENTREGAORTOP, ' +
                      ' pv_desde.pv_descripcion as prov_desde, pv_hasta.pv_descripcion as prov_hasta, ' +
                      ' au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, au_pres_nomenclador || ''-'' || au_pres_capitulo || ''-'' || au_pres_codigo as MODULO ' +
               ' From ctj_trabajador, art.ctb_tablas MOTREC, art.ctb_tablas MOTANUL, art.ctb_tablas EST, art.ctb_tablas SUB, art.mgp_gtrabajo AUT, art.mgp_gtrabajo SIN, art.CPR_PRESTADOR, art.sex_expedientes, ' +
                     ' art.del_delegacion, art.mpr_prestaciones, art.str_traslados, art.sau_autorizaciones, art.spv_parteevolutivo spv, ' +
                     ' art.cpv_provincias pv_desde, art.cpv_provincias pv_hasta ' +
               ' Where au_idexpediente = ex_id ' +
                     ' AND au_id = tr_idauto(+) ' +
                     ' AND tr_fechabaja IS NULL ' +
                     ' AND tr_fechaanulacion IS NULL ' +
                     ' AND ex_idtrabajador = tj_id ' +
                     ' AND au_dprovincia = pv_desde.pv_codigo(+) ' +
                     ' AND au_hprovincia = pv_hasta.pv_codigo(+) ' +
                     ' AND EST.tb_clave = ''MUAUT'' ' +
                     ' AND SUB.tb_clave(+) = ''SUBPR'' ' +
                     ' AND EST.tb_codigo = au_estado ' +
                     ' AND SUB.tb_codigo(+) = NVL(AU_SUBAPRO, au_subprest) ' +
                     ' AND au_trabajo = AUT.gp_codigo ' +
                     ' AND ex_gtrabajo = SIN.gp_codigo ' +
                     ' AND CA_IDENTIFICADOR = AU_IDENTIFPRESTADOR ' +
                     ' AND EL_ID = EX_DELEGACION ' +
                     ' AND PR_CODIGO = nvl(au_presapro,au_pressol) ' +
                     ' AND au_siniestro = pv_siniestro(+) ' +
                     ' AND au_orden = pv_orden(+) ' +
                     ' AND au_recaida = pv_recaida(+) ' +
                     ' AND spv.pv_fechabaja(+) IS NULL ' +
                     ' AND au_numauto = pv_autorizacion(+) ' +
                     ' AND tr_siniestro IS NULL ' +
                     ' AND MOTREC.tb_clave(+) = ''MOTR'' ' +
                     ' AND MOTREC.tb_codigo(+) = au_motivorechazo ' +
                     ' AND MOTANUL.tb_clave(+) = ''MOTAN'' ' +
                     ' AND MOTANUL.tb_codigo(+) = au_motivoanulacion ' +

               sSqlWhere + sSqlWhere2 + ' ';

       ssql    := ssql + SortDialog.OrderBy;
       qrlTitulo.Caption := 'Consulta de Autorizaciones';
     end
     else begin    {Listado sin Evolución}
       { by NWK, 18/06/03, PAtlante le sacó todos los permisos al check chkSinEvolucion, porque esta opción no se está usando }
       ssql := ' SELECT UTILES.Armar_Siniestro(au_siniestro, au_orden, au_recaida, ''-'') NRO_SINIESTRO, ex_delegacion, ' +
                      ' NVL(ex_fecharecaida,ex_fechaaccidente) FECHA_REC_ACCI, ex_fecharecaida, ex_fechaaccidente, ' +
                      ' PR_DESCRIPCION || ''; '' || au_detalle PRESTACION, au_fechaalta, ' +
                      ' au_turno turno, au_turno, au_turnohora Hora, au_trabajo, ' +
                      ' art.Cuit_PonerGuiones(tj_cuil) CUIL_GUIONES, ' +
                      ' tj_nombre, tj_cuil, au_siniestro, au_orden, au_recaida, au_numauto, au_fechasoli, NVL(au_cantapro, au_cantidad) as au_cantidad, ex_altamedica, el_Nombre DELEGACION,' +
                      ' AUT.gp_nombre GRUPO_AUT, SIN.gp_nombre GRUPO_SIN, ca_descripcion, ''Sin Evolución'' ESTADO, au_presapro, au_pressol, SUB.tb_descripcion SUBPRESTACION,nvl(au_impoapro, au_importe) IMPORTE, ' +
                      ' NULL au_dcalle, NULL au_dnumero, NULL au_dpiso, NULL au_ddepartamento, NULL au_dlocalidad, NULL au_dprovincia, NULL au_dcpostal, ' +
                      ' NULL au_hcalle, NULL au_hnumero, NULL au_hlocalidad, NULL au_hprovincia, NULL au_hcpostal, ' +
                      ' (SELECT ca_descripcion FROM art.cpr_prestador WHERE ca_identificador = au_presthasta) prestador_hasta, ' +
                      ' NULL DOMICILIO_DESDE, NULL DOMICILIO_HASTA,' +
                      ' NULL DIRECCION_DESDE, NULL LOCALIDAD_DESDE,' +
                      ' NULL DIRECCION_HASTA, NULL LOCALIDAD_HASTA,' +
                      ' NULL TEL, NULL ACOMP, NULL ESPERA, NULL RETORNO, ca_Identificador, au_Observaciones, au_ObservacionesImpresion,' +
                      ' au_fechaauditoria, au_usuauditoria, au_fechapro, au_usuapro,' +
                      ' pv_fecharecepcion Recep_Info, pv_fechaalta Carga_Info, au_motivoanulacion, au_motivorechazo, au_kmbase, au_kmviaje, au_kmexcedente, NVL(au_kmbase, 0) + au_kmviaje + NVL(au_kmexcedente, 0) kmtotal, ' +
                      ' MOTREC.tb_descripcion descrmotivorechazo, MOTANUL.tb_descripcion descrmotivoanulacion, art.siniestro.get_usuariogestor(ex_id) USUGESTOR, aut.gp_email, ' +
                      ' au_estado, au_id, au_idexpediente, pr_formulario, au_idstock, ' +
                      ' ' + sRegSanitPrest + ', au_fechamaillist, nvl(au_detalleapro, au_detalle) au_detalleapro, ' +  // TK 26039
                      ' au_detalleapro detalleapro, au_tdesde, au_thasta, au_cantapro, au_cantconsu, au_identifapro, tr_id, ' + sViajeCompartido + ', AU_FENTREGAORTOP, ' +
                      ' pv_desde.pv_descripcion as prov_desde, pv_hasta.pv_descripcion as prov_hasta, ' +
                      ' au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, au_pres_nomenclador || ''-'' || au_pres_capitulo || ''-'' || au_pres_codigo as MODULO ' +
               ' FROM ctj_trabajador, ctb_tablas MOTREC, ctb_tablas MOTANUL, ctb_tablas SUB, mgp_gtrabajo AUT, ' +
                    ' mgp_gtrabajo SIN, cpr_prestador, sex_expedientes, sau_autorizaciones, mpr_prestaciones, ' +
                    ' del_delegacion, str_traslados, spv_parteevolutivo spv, ' +
                    ' art.cpv_provincias pv_desde, art.cpv_provincias pv_hasta ' +
               ' WHERE au_idexpediente = ex_id ' +
                 ' AND ex_cuil = tj_cuil ' +
                 ' AND au_trabajo = AUT.gp_codigo ' +
                 ' AND ex_gtrabajo = SIN.gp_codigo ' +
                 ' AND ca_identificador (+) = au_identifprestador ' +
                 ' AND au_estado = ''E'' ' +
                 ' AND (((au_turno IS NOT NULL) AND (au_turno + pr_diasevo <= SYSDATE)) OR ' +
                     ' ((au_turno IS NULL) AND (au_fechapro + pr_diasevo <= SYSDATE)))  ' +
                 ' AND el_id = EX_DELEGACION ' +
                 ' AND PR_CODIGO = nvl(au_presapro,au_pressol) ' +
                 ' AND SUB.tb_clave = ''SUBPR'' ' +
                 ' AND SUB.tb_codigo = NVL(AU_SUBAPRO, au_subprest)  ' +
                 ' And au_id = tr_idauto(+) ' +
                 ' AND au_dprovincia = pv_desde.pv_codigo(+) ' +
                 ' AND au_hprovincia = pv_hasta.pv_codigo(+) ' +
                 ' AND tr_fechabaja IS NULL ' +
                 ' AND tr_fechaanulacion IS NULL ' +
                 ' AND au_siniestro = pv_siniestro(+) ' +
                 ' AND au_orden = pv_orden(+) ' +
                 ' AND au_recaida = pv_recaida(+) ' +
                 ' AND spv.pv_fechabaja(+) IS NULL ' +
                 ' AND au_numauto = pv_autorizacion(+) ' +
                 ' AND MOTREC.tb_clave(+) = ''MOTR'' ' +
                 ' AND MOTREC.tb_codigo(+) = au_motivorechazo ' +
                 ' AND MOTANUL.tb_clave(+) = ''MOTAN'' ' +
                 ' AND MOTANUL.tb_codigo(+) = au_motivoanulacion ' ;

       ssql    := ssql + sSqlWhere + SortDialog.OrderBy;
       qrlTitulo.Caption := 'Consulta de Autorizaciones Sin Evolución';
     end;

     if (cCriteria = '') then
       cCriteria := 'TODAS LAS AUTORIZACIONES';

     sdqAutoriza.Close;
     sdqAutoriza.SQL.Text := sSql;
     OpenQuery(sdqAutoriza);

     if sdqAutoriza.EOF then
     begin
        MsgBox('No se encontraron datos para generar el Reporte.' + #13 + 'Verifique la Selección', MB_ICONINFORMATION,'Selección Inválida');
        Resultado := False;
     end;
   end;

   if not sdqAutoriza.isEmpty then
   begin
       lblTitResultados.Caption   := ' Cantidad de Autorizaciones: ';
       lblCantResultados.Caption  := IntToStr(SdqAutoriza.RecordCount);
   end
   else begin
       lblTitResultados.Caption   := ' ';
       lblCantResultados.Caption  := ' ';
   end;
   Result := Resultado;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbLimpiarClick(Sender: TObject);
begin
 // dcmbAltaDesde.ClearDate;
 // dcmbAltaHasta.ClearDate;

  DoFechaCargaAutorizDefault;

  dcmbRecepDesde.ClearDate;
  dcmbRecepHasta.ClearDate;
  cmbTurnoDesde.ClearDate;
  cmbTurnoHasta.ClearDate;
  dcmbAproDesde.ClearDate;
  dcmbAproHasta.ClearDate;
  SinEdit.Clear;
  cmbEstado.ClearChecks;
  cbGtrabajoAut.Clear;
  fraGrupoTrabajo_Sin.Clear;
  fraDelegacion.Clear;
  dbChkPrestacion.Clear;
  fraSubprestacion.Limpiar;
  lblTitResultados.Caption      := ' ';
  lblCantResultados.Caption     := ' ';
  chkSinEvolucion.Checked       := False;
  chkSinImprimir.Checked        := False;
  chkSinMail.Checked            := False;
  chkInforme.Checked            := False;
  fraStaticCtbMotivoAnulac.Clear;
  fraStaticCtbMotivoRechazo.Clear;
  fraPrestadorFiltro.Limpiar;
  sdqAutoriza.Close;
  cmbUsuAprob.Clear;
  fraUsuariosPorPrest.Clear;
  tbAnular.Enabled := False; // TK 24434
  fraRegionSanitaria.Clear;  // TK 26039
  cbPrestSinAsignar.Checked := false;
  rbAuditadas.ItemIndex := 2;
  rgEnvioMail.ItemIndex := 2;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  sdqEstados.Close;
  Action := caFree;
  frmPrincipal.mnuAutConsulta.Enabled := True;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.FormCreate(Sender: TObject);
begin
  FPrimeraVezGIS := True;
  fraStaticCtbMotivoAnulac.Clave  := 'MOTAN';
  fraStaticCtbMotivoRechazo.Clave := 'MOTR';

  sdqEstados.Open;
  sdqUsuAprob.Open;
  pcFiltros.ActivePage := tsFiltros0;  // Lu 04/09/2008
  tbAnular.Enabled     := False;       // TK 24434
  {with fraGrupoTrabAut do
  begin
    TableName   := 'MGP_GTRABAJO';
    FieldID     := 'GP_CODIGO';
    FieldCodigo := 'GP_CODIGO';
    FieldDesc   := 'GP_NOMBRE';
    FieldBaja   := 'GP_FBAJA';
    ShowBajas   := True;
    OrderBy     := 'GP_NOMBRE';
  end;}

  with fraUsuariosPorPrest do
  begin
    ShowBajas   := False;
    TableName   := 'USE_USUARIOS';
    FieldID     := 'SE_USUARIO';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'SE_FECHABAJA';
    Sql         := 'SELECT DISTINCT se_usuario as id, se_usuario as codigo, ' +
                         ' se_nombre as descripcion, se_fechabaja as baja ' +  
                    ' FROM cpu_prestadorusuario, use_usuarios ' +
                   ' WHERE pu_usuario = se_usuario ' +
                     ' AND pu_fechabaja IS NULL ' +
                     ' AND se_fechabaja IS NULL';
  end;
  with fraRegionSanitaria do  // TK 26039
  begin
    Clave     := 'REGSA';
    ShowBajas := True;
  end;

  DoFechaCargaAutorizDefault;  // TK 38164
  VCLExtra.LockControls([fraPrestadorCambio], True);

  if (not dmPrincipal.Is_ConectadoProduccion) and (Sesion.UserID = 'PTAVASCI') then
  begin
    fraPrestadorFiltro.Cargar(18119);//19160);
    dcmbAltaDesde.ClearDate();
    dcmbAltaHasta.ClearDate();
    cmbTurnoDesde.Date := StrToDate('10/05/2013');
    cmbTurnoHasta.Date := StrToDate('10/05/2013');
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbPreviewClick(Sender: TObject);
begin
  if HayRegistroActivo then
    with qrAutoriza do begin
       qrlCantResultados.Caption := lblCantResultados.Caption;
       PreviewModal;
    end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbPrintClick(Sender: TObject);
begin
  if HayRegistroActivo then
     with qrAutoriza do begin
        qrlCantResultados.Caption := lblCantResultados.Caption;
        if PrintDialog.Execute then Print;
     end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbExitClick(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.qrAutorizaBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  lblCriterio.Caption := cCriteria;
  qriLogo.Picture.Assign(frmPrincipal.imgLogo.Picture);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.sbtnBuscarClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
     dlgBusqSini.Siniestro  := SinEdit.Siniestro;
     dlgBusqSini.Orden      := SinEdit.Orden;
     dlgBusqSini.Recaida    := SinEdit.Recaida;
     if dlgBusqSini.ShowModal = mrOk then
     begin
       Self.SinEdit.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
       SinEditSelect(nil);
     end;
  finally
     dlgBusqSini.Free;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbOcultarMostrarClick(Sender: TObject);
begin
   if tbOcultarMostrar.Down then
   begin
      pcFiltros.Visible     := False;
      tbOcultarMostrar.Hint := 'Mostrar Filtros';
      tbOcultarMostrar.ImageIndex := 18;
   end
   else begin
      pcFiltros.Visible     := True;
      tbOcultarMostrar.Hint := 'Ocultar Filtros';
      tbOcultarMostrar.ImageIndex := 17;
   end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbRefrescarClick(Sender: TObject);
begin
  GenerarConsulta;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.mnuExportarGrillaClick(Sender: TObject);
begin
  if HayRegistroActivo then
  begin
    ExportDialog.FieldbyName['RECEP_INFO'].Save := chkInforme.Checked;
    ExportDialog.FieldbyName['CARGA_INFO'].Save := chkInforme.Checked;
    ExportDialog.Execute;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbGuardarClick(Sender: TObject);
begin
  tbGuardar.CheckMenuDropdown;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.mnuExportarTrasladosClick(Sender: TObject);
begin
  if HayRegistroActivo then ExportDialogTraslados.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
//camarillo - 06/06/07 - envia por mail las autorizaciones que se exportan y luego updatea la au_fechamail
procedure TqrpAutoriza.tbEnviarMailClick(Sender: TObject);
var
  sMailPrestador, sNombreArchivo :String;
  ResultadoEnvio: TResultadoEnvio;
begin
  Verificar(fraPrestadorFiltro.IsEmpty, fraPrestadorFiltro, 'Debe seleccionar prestador para el envío del mail.');
  Verificar(not(HayRegistroActivo), dbgDatos, 'No hay registros para enviar.');
  Verificar((fraPrestadorFiltro.CorreoElectronico = ''), fraPrestadorFiltro, 'El prestador no tiene dirección de mail.');

  GenerarConsulta;  // por ticket 32631: ya que puede enviarse al prestador algo que no corresponde, si el usuario no refresco antes.

  sMailPrestador := fraPrestadorFiltro.CorreoElectronico;
  if ExportDialogTraslados.Execute then
  begin
    sNombreArchivo := ExportDialogTraslados.OutputFile;
    ResultadoEnvio := unMoldeEnvioMail.EnviarMailBDWithResults(sMailPrestador, 'Datos de Autorizaciones.',
                                                              [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                                              'Se adjuntan datos de autorizaciones correspondientes.' + CRLF + CRLF + 'Provincia ART',
                                                              GetAttachments(sNombreArchivo, 7));
    if ResultadoEnvio.EnvioOk then DoUpdateFechaMail;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TqrpAutoriza.HayRegistroActivo :Boolean;
begin
  Result := sdqAutoriza.Active and not(sdqAutoriza.IsEmpty);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.DoUpdateFechaMail;
var
  sSql :String;
  b : TBookmark;
begin
  with sdqAutoriza do
  begin
    b := GetBookmark;
    try
      BeginTrans;
      First;
      while not Eof do
      begin
        sSql := 'UPDATE sau_autorizaciones ' +
                  ' SET au_fechamail = ActualDate ' +
                ' WHERE au_siniestro = ' + SqlInt(FieldByName('AU_SINIESTRO').AsInteger) +
                  ' AND au_orden = ' + SqlInt(FieldByName('AU_ORDEN').AsInteger) +
                  ' AND au_recaida = ' + SqlInt(FieldByName('AU_RECAIDA').AsInteger) +
                  ' AND au_numauto = ' + SqlInt(FieldByName('AU_NUMAUTO').AsInteger);
        EjecutarSqlST(sSql);
        Next;
      end;
      CommitTrans;
    except
      on E: Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E, 'Error al guardar la fecha de envío de mail.');
      end;
    end;
  GotoBookmark(b);
  end;
end;

procedure TqrpAutoriza.DoUpdateFechaMailAuto;
var
  sSql :String;
begin
  with sdqAutoriza do
  begin
    try
      BeginTrans;
      First;
      while not Eof do
      begin
        sSql := 'UPDATE sau_autorizaciones ' +
                  ' SET au_fechamaillist = ActualDate, ' +
                      ' au_usumaillist = ' + SqlValue(sesion.UserID) +
                ' WHERE au_siniestro = ' + SqlInt(FieldByName('AU_SINIESTRO').AsInteger) +
                  ' AND au_orden = ' + SqlInt(FieldByName('AU_ORDEN').AsInteger) +
                  ' AND au_recaida = ' + SqlInt(FieldByName('AU_RECAIDA').AsInteger) +
                  ' AND au_numauto = ' + SqlInt(FieldByName('AU_NUMAUTO').AsInteger);
        EjecutarSqlST(sSql);
        Next;
      end;
      CommitTrans;
    except
      on E: Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E, 'Error al guardar la fecha de envío de mail.');
      end;
    end;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TqrpAutoriza.tbAnularClick(Sender: TObject);   // TK 24434
var
  iIdAuto, iNumAuto, iOrden, iRecaida, iSiniestro : Integer;
  sEstado, sEstadoAct, sObservaciones: String;
begin  // TK 24434: Por ahora solo anulará autorizaciones de siniestros cerrados (ya que las otras anulaciones se pueden hacer desde unAutSelPorSiniestro.
  if HayRegistroActivo then
  begin
    iSiniestro    := sdqAutoriza.FieldByName('AU_SINIESTRO').AsInteger;
    iOrden        := sdqAutoriza.FieldByName('AU_ORDEN').AsInteger;
    iRecaida      := sdqAutoriza.FieldByName('AU_RECAIDA').AsInteger;
    iNumAuto      := sdqAutoriza.FieldByName('AU_NUMAUTO').AsInteger;
    iIdAuto       := sdqAutoriza.FieldByName('AU_ID').AsInteger;
    sEstadoAct    := sdqAutoriza.FieldByName('AU_ESTADO').AsString;
    sEstado       := '';

    if AreIn(sEstadoAct, ['T', 'P']) then       {T = En Tramite, P = Pendiente  => N = Anulada}
      sEstado := 'N'
    else if AreIn(sEstadoAct, ['A', 'E']) then  {A = Aprobada, E = Sin Informe  => U = Aprobación Anulada}
      sEstado := 'U'
    else
    begin
      MsgBox('La Autorizacion seleccionada no se encuentra en el Estado Correcto para ser anulada.', MB_ICONEXCLAMATION);
      Exit;
    end;

    sObservaciones := '';
    if fpAnular.ShowModal = mrOk then
      sObservaciones := Trim(edObservacionesAnu.Lines.Text)
    else
      Exit;

    try
      BeginTrans;
      Do_UpdateAnularAutorizacion_ST(sEstado, sObservaciones, fraMotivoAnulacion.Codigo, iIdAuto);

      Do_AnularAutorizacionDerivado_ST(iIdAuto, iSiniestro, iOrden, iRecaida, sObservaciones);

      {Cuando estado = "En Tramite" y do_fecharecepcion es nula, hay que updatearla en la sdo_documutual. by Lu 11/07/01}
      if (sEstadoAct = 'T') then
        Do_UpdateSDO_DOCUMUTUAL_ST(iSiniestro, iOrden, iRecaida, iNumAuto);

      Do_Update_MMS_MOVIM_STOCK_ST(sdqAutoriza.FieldByName('AU_IDSTOCK').AsInteger, iIdAuto);

      CommitTrans;
      tbRefrescarClick(Nil);
    except
      on E:Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E);
      end;
    end;

  end;
end;

procedure TqrpAutoriza.sdqAutorizaAfterScroll(DataSet: TDataSet);    // TK 24434
begin
  // se habilita solo si es un siniestro cerrado.
  tbAnular.Enabled := Seguridad.Activar(tbAnular) and
                      Es_SiniestroCerrado(sdqAutoriza.FieldByName('AU_IDEXPEDIENTE').AsInteger); // Optimizar esto!!!
end;

function TqrpAutoriza.Es_SiniestroCerrado(iIdExped: integer): Boolean;   // TK 24434
var sSql: string;
begin
  sSql := 'SELECT ex_estado FROM art.sex_expedientes ' +
          ' WHERE ex_id = :idexp ';
  Result := (ValorSqlEx(sSql, [iIdExped]) = '03');     // Optimizar esto!!! 
end;

procedure TqrpAutoriza.Do_UpdateAnularAutorizacion_ST(sEstado, sObservaciones, sMotivoAnulacion: string; iIdAuto: integer);  // TK 24434
var sSql: string;
begin
  sSql := 'UPDATE sau_autorizaciones' +
            ' SET au_estado = ' + SqlValue(sEstado) + ',' +
                ' au_impoapro = 0,' +
                  IIF(sObservaciones = '', '', ' au_observaciones = ' + SqlValue(sObservaciones) + ',') +
                ' au_fechamodif = trunc(sysdate),' +
                ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' au_motivoanulacion = ' + SqlValue(sMotivoAnulacion) + ',' +
                ' au_fechaanulacion = trunc(sysdate), ' +              // TK 21531
                ' au_usuanulacion = ' + SqlValue(Sesion.UserID) +
          ' WHERE au_id = ' + SqlInt(iIdAuto);
  EjecutarSqlST(sSql);
end;

procedure TqrpAutoriza.Do_AnularAutorizacionDerivado_ST(iIdAuto, iSiniestro, iOrden, iRecaida: integer; sObservaciones: string);       // TK 24434
var iNumAutoDeriv: integer;
    sSql, sEstadoAct: string;
begin
  iNumAutoDeriv := 0;
  sEstadoAct    := sdqAutoriza.FieldByName('AU_ESTADO').AsString;
  {Si se anula un aprobado que depende de un derivado, al primero se le cambia de
   estado a: "Derivado Anulado", au_estado:"V", aquí tomo el au_numautoderiv. by Lu 23/01/2001}
  if AreIn(sEstadoAct,  ['A', 'E']) then
    iNumAutoDeriv := ValorSqlInteger('SELECT au_numautoderiv' +              // estaba mal, lo arregle (Lu 17/09/2010)
                                        ' FROM sau_autorizaciones' +
                                       ' WHERE au_id = ' + SqlInt(iIdAuto));
  if (iNumAutoDeriv > 0) then
  begin
    sSql := 'UPDATE sau_autorizaciones' +
              ' SET au_estado = ''V'',' +
                   IIF(sObservaciones = '', '', ' AU_OBSERVACIONES = ' + SqlValue(sObservaciones) + ',') +
                  ' au_fechamodif = actualdate,' +
                  ' au_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                  ' au_fechaanulacion = trunc(sysdate), ' +             // TK 21531
                  ' au_usuanulacion = ' + SqlValue(Sesion.UserID) +
            ' WHERE au_siniestro = ' + SqlInt(iSiniestro) +
              ' AND au_orden = ' + SqlInt(iOrden) +
              ' AND au_recaida = ' + SqlInt(iRecaida) +
              ' AND au_numauto = ' + SqlInt(iNumAutoDeriv);             // estaba mal, lo arregle (Lu 17/09/2010)
    EjecutarSqlST(sSql);
  end;
end;

procedure TqrpAutoriza.Do_UpdateSDO_DOCUMUTUAL_ST(iSiniestro, iOrden, iRecaida, iNumAuto: integer);  // TK 24434
var sSql: string;
begin
  // IMPORTANTE: Hago dos querys porque si pusiera este update arriba, me tomaria las dos condiciones con un 'and' y puedo llegar a pisar datos.
  {Update de fechaRecepcion}
  sSql := 'UPDATE sdo_documutual ' +
            ' SET do_fecharecepcion = trunc(sysdate) ' +
          ' WHERE do_siniestro = ' + SqlInt(iSiniestro) +
            ' AND do_orden = ' + SqlInt(iOrden) +
            ' AND do_recaida = ' + SqlInt(iRecaida) +
            ' AND do_numero = ' + SqlInt(iNumAuto) +
            ' AND do_fecharecepcion IS NULL ';
  EjecutarSqlST(sSql);
  {Update de fechaImpresion}
  sSql := 'UPDATE sdo_documutual ' +
            ' SET do_fechaimpresion = trunc(sysdate) ' +
           'WHERE do_siniestro = ' + SqlInt(iSiniestro) +
            ' AND do_orden = ' + SqlInt(iOrden) +
            ' AND do_recaida = ' + SqlInt(iRecaida) +
            ' AND do_numero = ' + SqlInt(iNumAuto) +
            ' AND do_fechaimpresion IS NULL ';
  EjecutarSqlST(sSql);
end;

procedure TqrpAutoriza.Do_Update_MMS_MOVIM_STOCK_ST(iIdStock, iIdAuto: integer);   // TK 24434
var sSql: string;
begin
  if (iIdStock > 0) then
  begin
    sSql := 'UPDATE amed.mms_movim_stock ' +
              ' SET ms_fechabaja = actualdate, ' +
                  ' ms_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE ms_idstock = ' + SqlInt(iIdStock) +
              ' AND ms_idautorizacion = ' + SqlInt(iIdAuto);
    EjecutarSqlST(sSql);
  end;
end;

procedure TqrpAutoriza.btnAnuAceptarClick(Sender: TObject);
begin
  Verificar(fraMotivoAnulacion.IsEmpty, fraMotivoAnulacion, 'Debe ingresar un motivo de anulación');
  fpAnular.ModalResult := mrOk;
end;

procedure TqrpAutoriza.btnAnuCancelarClick(Sender: TObject);
begin
  fpAnular.ModalResult := mrCancel;
end;

procedure TqrpAutoriza.fpAnularBeforeShow(Sender: TObject);
begin
  edObservacionesAnu.Clear;
  with fraMotivoAnulacion do
  begin
    Clear;
    ShowBajas := False;
    if (sdqAutoriza.FieldByName('pr_formulario').AsString = 'T') then
    begin
      TableName       := 'SMT_MOTANULTRASLADOS';
      FieldID         := 'MT_ID';
      FieldCodigo     := 'MT_CODIGO';
      FieldDesc       := 'MT_DESCRIPCION';
      FieldBaja       := 'MT_FECHABAJA';
      ExtraCondition  := '';
      ExtraFields     := ', MT_PERMITELIQUIDAR ';
    end
    else begin
      TableName       := 'CTB_TABLAS';
      FieldID         := 'TB_CODIGO';
      FieldCodigo     := 'TB_CODIGO';
      FieldDesc       := 'TB_DESCRIPCION';
      FieldBaja       := 'TB_FECHABAJA';
      ExtraCondition  := ' AND TB_CLAVE = ''MOTAN'' AND TB_CODIGO <> ''0'' ';
      ExtraFields     := '';
    end;
  end;
end;

procedure TqrpAutoriza.cbPrestSinAsignarClick(Sender: TObject);
begin
  if cbPrestSinAsignar.Checked = true then
  begin
    fraUsuariosPorPrest.Clear;
    LockControl(fraUsuariosPorPrest, true);
  end
  else
    LockControl(fraUsuariosPorPrest, false);
end;

procedure TqrpAutoriza.SinEditSelect(Sender: TObject);
begin
  if  (not Validar_SML(Sesion.UserID, Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)))
   or (not ValidarSiniestroUsuarioTerce(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then      // por plan Ioma - Tercerizadoras
  begin
    InfoHint(SinEdit, 'Usted no posee permisos para visualizar este siniestro.');
    tbLimpiarClick(nil);
  end;
end;

procedure TqrpAutoriza.mnuEnviarTrasladosClick(Sender: TObject);
begin
  tbEnviarMailClick(Sender);
end;

procedure TqrpAutoriza.mnuEnviarAutorizacionesClick(Sender: TObject);
var
  sMailPrestador, sNombreArchivo :String;
  ResultadoEnvio: TResultadoEnvio;
begin
  Verificar(fraPrestadorFiltro.IsEmpty, fraPrestadorFiltro, 'Debe seleccionar prestador para el envío del mail.');
  Verificar(not(HayRegistroActivo), dbgDatos, 'No hay registros para enviar.');
  Verificar((fraPrestadorFiltro.CorreoElectronico = ''), fraPrestadorFiltro, 'El prestador no tiene dirección de mail.');

  GenerarConsulta;  // por ticket 32631: ya que puede enviarse al prestador algo que no corresponde, si el usuario no refresco antes.
  ExportDialogAutorizaciones.FieldbyName['RECEP_INFO'].Save := chkInforme.Checked;
  ExportDialogAutorizaciones.FieldbyName['CARGA_INFO'].Save := chkInforme.Checked;
  sMailPrestador := fraPrestadorFiltro.CorreoElectronico;
  if ExportDialogAutorizaciones.Execute then
  begin
    sNombreArchivo := ExportDialogAutorizaciones.OutputFile;
    ResultadoEnvio := unMoldeEnvioMail.EnviarMailBDWithResults(sMailPrestador, 'Datos de Autorizaciones.',
                                                              [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                                              'Se adjuntan datos de autorizaciones correspondientes.' + CRLF + CRLF + 'Provincia ART',
                                                              GetAttachments(sNombreArchivo, 7));
    if ResultadoEnvio.EnvioOk then DoUpdateFechaMailAuto;
  end;

end;

procedure TqrpAutoriza.DoFechaCargaAutorizDefault;    // TK 38164
begin
  dcmbAltaHasta.Date := DBDate;
  dcmbAltaDesde.Date := (DBDate - 90);
end;

function TqrpAutoriza.Do_EvaluarFiltros: boolean;    // TK 38164
begin
  Result := True;
  if SinEdit.IsEmpty and
     fraPrestadorFiltro.IsEmpty and
     (dcmbAltaDesde.Date = 0)  and (dcmbAltaHasta.Date = 0)  and
     (dcmbRecepDesde.Date = 0) and (dcmbRecepHasta.Date = 0) and
     (cmbTurnoDesde.Date = 0)  and (cmbTurnoHasta.Date = 0)  and
     (dcmbAproDesde.Date = 0)  and (dcmbAproHasta.Date = 0) then
     if (MsgBox ('Atención: Debido a los filtros que ha seleccionado, esta consulta puede demorar varios minutos.' + CRLF +
                 '¿Desea continuar?', MB_ICONEXCLAMATION + MB_YESNO) = mrNo) then
       Result := False;
end;

procedure TqrpAutoriza.tbViajeCompartidoClick(Sender: TObject);
begin
  if not pnlBottom.Visible then
  begin
    Verificar(sdqAutoriza.IsEmpty, tbViajeCompartido, 'La consulta debe tener registros para establecer un viaje compartido.');
    if not dbgDatos.RowColorsUse then
    begin
      dbgDatos.RowColorsUse := True;
      dbgDatos.MultiSelect := True;
      dbgDatos.Options := dbgDatos.Options + [dgMultiSelect];
      pnlBottom.Show;
      if FPrimeraVezGIS then
        InfoHint(btnConfirmarViaje, 'Seleccione dos o mas pacientes de la grilla sosteniendo la tecla "Ctrl" para especificar quienes comparten el viaje, al finalizar esta selección presione &Confirmar.', False, 'Información sobre el modo de uso');
      FPrimeraVezGIS := False;        
    end
  end else
  begin
    dbgDatos.RowColorsUse := False;
    dbgDatos.MultiSelect := False;
    dbgDatos.Options := dbgDatos.Options - [dgMultiSelect];
    pnlBottom.Hide;    
  end;
end;

procedure TqrpAutoriza.btnCamPrestAceptarClick(Sender: TObject);
begin
  Verificar(not fraNomencladorCambio.IsSelected, fraNomencladorCambio, 'Debe seleccionar la prestación que desea cambiar.');
  fpCambioPrestacion.ModalResult := mrOk;
end;

procedure TqrpAutoriza.btnCancelarClick(Sender: TObject);
begin
  tbViajeCompartido.Click;

  if Assigned(lstOrderedAddress) then
    FreeAndNil(lstOrderedAddress);

  if Assigned(fraGIS_APIv3) then
    FreeAndNil(fraGIS_APIv3);
end;

procedure TqrpAutoriza.btnConfirmarViajeClick(Sender: TObject);
var
  iAux, iIdPrestador, iTrasladosActivos, iNumAuto, iViajeCompartido, iTurnoTraslado: Integer;
  sAuxCalle, sAuxNumero, sAuxCPostal, sAuxLocalidad, sAuxProvincia, sSQL, sNuevoEstado, sObservaciones: String;
  dMinHora, dMaxHora: TDateTime;
  tslRegistros: TStringList;
  (* No borrar esto...
  bEsUltimoTramo: Boolean;
  sCalle, sNumero, sPiso, sDepartamento, sCPostal, sLocalidad, sProvincia: String; // Campos para almacenar el nuevo domicilio HASTA
  *)  
begin
  Verificar((dbgDatos.SelectedRows.Count < 2) or (dbgDatos.SelectedRows.Count > 4), btnConfirmarViaje, 'Debe seleccionar entre dos y cuatro pacientes para que compartan el viaje.');
  iIdPrestador := ART_EMPTY_ID;
  tslRegistros := TStringList.Create;
  
  with sdqAutoriza do
  begin
    dMinHora := HoursPerDay;
    dMaxHora := 0;
    
    for iAux := 0 to dbgDatos.SelectedRows.Count - 1 do
    begin
      dbgDatos.GotoSelection(iAux);
      if iAux > 0 then
      begin
        Verificar(FieldByName('AU_HPROVINCIA').IsNull, btnConfirmarViaje, 'Debe seleccionar solamente autorizaciones de traslados.');
        Verificar(not AreIn(FieldByName('AU_ESTADO').AsString, ['A', 'C', 'E']), btnConfirmarViaje, 'Solo se puede cambiar la prestación de las autorizaciones en estado "Aprobada" o "Sin Evolución"');
        Verificar(iIdPrestador <> FieldByName('CA_IDENTIFICADOR').AsInteger, btnConfirmarViaje, 'No todos los pacientes seleccionados se dirigen al mismo destino.');
        Verificar(not ((Trim(sAuxCalle) = Trim(FieldByName('AU_HCALLE').AsString)) and
                       (sAuxNumero = FieldByName('AU_HNUMERO').AsString) and
                       (sAuxCPostal = FieldByName('AU_HCPOSTAL').AsString) and
                       (sAuxLocalidad = FieldByName('AU_HLOCALIDAD').AsString) and
                       (sAuxProvincia = FieldByName('AU_HPROVINCIA').AsString)), btnConfirmarViaje, 'No todos los pacientes seleccionados se dirigen al mismo domicilio.');
      end;

      dMinHora      := Max(StrToTime('00:00'), Min(dMinHora, StrToTime(FieldByName('HORA').AsString)));
      dMaxHora      := Max(dMaxHora, Min(StrToTime('23:59'), StrToTime(FieldByName('HORA').AsString)));
      iIdPrestador  := FieldByName('CA_IDENTIFICADOR').AsInteger;
      sAuxCalle     := FieldByName('AU_HCALLE').AsString;
      sAuxNumero    := FieldByName('AU_HNUMERO').AsString;
      sAuxCPostal   := FieldByName('AU_HCPOSTAL').AsString;
      sAuxLocalidad := FieldByName('AU_HLOCALIDAD').AsString;
      sAuxProvincia := FieldByName('AU_HPROVINCIA').AsString;

      tslRegistros.Add(FieldByName('NRO_SINIESTRO').AsString);
    end;

    Verificar((dMaxHora - dMinHora) * 24 > 2, btnConfirmarViaje, 'Los pacientes seleccionados deben realizar el traslado de manera muy espaciada en el tiempo.'); 
  end;

  try
    if fpCambioPrestacion.ShowModal = mrOK then
    begin
      BeginTrans(True);
      iViajeCompartido := GetSecNextVal('amed.seq_mvc_id');

      {Inserto el viaje compartido en otra tabla para poder reconstruirlo en otro momento}
      sSQL := 'INSERT INTO amed.mvc_viajecompartido (vc_id, vc_usualta, vc_fechaalta, vc_distanciatotal, vc_url, vc_cantidadpacientes) ' +
              ' VALUES (:id, :usualta, SYSDATE, :distanciatotal, :url, :cantidadpacientes)';
      EjecutarSqlSTEx(sSQL, [iViajeCompartido, Sesion.UserID, fraGIS_APIv3.GISInfo.TotalDistance, fraGIS_APIv3.URL, dbgDatos.SelectedRows.Count]);

      for iAux := 0 to dbgDatos.SelectedRows.Count - 1 do
      with sdqAutoriza do
      try
        dbgDatos.GotoSelection(TAddress(lstOrderedAddress.Items[iAux]).SelectionOrder);

        {Veo cuanto traslados tiene la autorización, cuantos aprobados, cuantos cancelados y determino que hago}
        iTrasladosActivos := ValorSQLEx('SELECT COUNT(*) ' +
                                          'FROM str_traslados ' +
                                         'WHERE tr_idauto = :idauto ' +
                                           'AND tr_fechabaja IS NULL ' +
                                           'AND tr_fechaanulacion IS NULL', [FieldByName('AU_ID').AsInteger]);
                                           
        Verificar(iTrasladosActivos < 1, btnCamPrestAceptar, 'No se pueden anular todos los traslados del siniestro ' + FieldByName('NRO_SINIESTRO').AsString + ' autorización ' + FieldByName('AU_NUMAUTO').AsString + '.');

        sObservaciones := 'Viaje compartido con ' + StringReplace(StringReplace(StringReplace(tslRegistros.CommaText, FieldByName('NRO_SINIESTRO').AsString, '', [rfReplaceAll]), ',', ' ', [rfReplaceAll]), '  ', ' ', [rfReplaceAll]);

        if StrRight(sObservaciones, 1) = ',' then
          sObservaciones := StrLeft(sObservaciones, Length(sObservaciones) - 1);
          
        (* No borrar esto...
        bEsUltimoTramo := (TAddress(lstOrderedAddress.Items[iAux]).Order = dbgDatos.SelectedRows.Count - 1);

        if not bEsUltimoTramo then
        begin
          dbgDatos.GotoSelection(fraGIS_APIv3.GISInfo.GetNextSelectionOrder(TAddress(lstOrderedAddress.Items[iAux]).Order));

          sCalle        := FieldByName('AU_DCALLE').AsString;
          sNumero       := FieldByName('AU_DNUMERO').AsString;
          sPiso         := FieldByName('AU_DPISO').AsString;
          sDepartamento := FieldByName('AU_DDEPARTAMENTO').AsString;
          sCPostal      := FieldByName('AU_DCPOSTAL').AsString;
          sLocalidad    := FieldByName('AU_DLOCALIDAD').AsString;
          sProvincia    := FieldByName('AU_DPROVINCIA').AsString;

          dbgDatos.GotoSelection(TAddress(lstOrderedAddress.Items[iAux]).SelectionOrder);
        end;
        *)
        {Cambio la prestación para esta autorización si esta "Aprobada" y contiene un solo traslado activo}
        if (iTrasladosActivos = 1) and (FieldByName('AU_ESTADO').AsString = 'A') then
        begin
          sSQL := 'UPDATE sau_autorizaciones ' +
                     'SET au_pres_nomenclador = :nomenclador, ' +
                         'au_pres_capitulo = :capitulo, ' +
                         'au_pres_codigo = :codigo, ' +
                         'au_observacionesimpresion = :observacionesimpresion, ' +
                         'au_presapro = :presapro, ' +
                         (* No borrar esto...
                         'au_kmviaje = ' + SqlValue(TRoute(fraGIS_APIv3.GISInfo.Routes[iAux]).Distance) + ', ' +

                         {Si no es el último tramo actualizo los dato del domicilio hasta y el kilometraje parcial del tramo en cuestión}
                         iif( not bEsUltimoTramo,
                         'au_hcalle = ' + SqlValue(sCalle) + ', ' +
                         'au_hnumero = ' + SqlValue(sNumero) + ', ' +
                         'au_hpiso = ' + SqlValue(sPiso) + ', ' +
                         'au_hdepartamento = ' + SqlValue(sDepartamento) + ', ' +
                         'au_hcpostal = ' + SqlValue(sCPostal) + ', ' +
                         'au_hlocalidad = ' + SqlValue(sLocalidad) + ', ' +
                         'au_hprovincia = ' + SqlValue(sProvincia) + ', '
                         ,
                         '') +
                         *)
                         'au_impoapro = art.amebpba.get_val_prestacion(au_identifapro, :nomenclador, :capitulo, :codigo, ' +
                                                                     ' au_siniestro, au_orden, au_recaida, au_turno, au_id, NULL, ' +
                                                                     ' ((NVL(au_kmviaje, 0) + NVL(au_kmbase, 0)) * ' +
                                                                     StringReplace(FloatToStr(PORC_DESVIO_GIS), ',', '.', []) + ') + NVL(au_kmexcedente, 0)) ' +
                  ' WHERE au_siniestro = :siniestro ' +
                    ' AND au_orden = :orden ' +
                    ' AND au_recaida = :recaida ' +
                    ' AND au_numauto = :numauto';

          with fraNomencladorCambio do
            EjecutarSqlSTEx(sSQL, [Nomenclador, Capitulo, Codigo, sObservaciones, TRASLADO_COMPARTIDO, Nomenclador, Capitulo, Codigo, 
                                   FieldByName('AU_SINIESTRO').AsInteger, FieldByName('AU_ORDEN').AsInteger, FieldByName('AU_RECAIDA').AsInteger, FieldByName('AU_NUMAUTO').AsInteger]);

          iTurnoTraslado := FieldByName('TR_ID').AsInteger;
        end else
        begin
          if (FieldByName('AU_ESTADO').AsString = 'C') then
          begin
            Verificar(FieldByName('AU_CANTAPRO').AsInteger - FieldByName('AU_CANTCONSU').AsInteger < 1, btnCamPrestAceptar, 'Hay un problema relacionado con la cantidad consumida parcialmente de la autorización ' + FieldByName('AU_NUMAUTO').AsString + ' del siniestro ' + FieldByName('NRO_SINIESTRO').AsString + '.');

            if (FieldByName('AU_CANTAPRO').AsInteger - FieldByName('AU_CANTCONSU').AsInteger = 1) then
              sNuevoEstado := 'L'
            else
              sNuevoEstado := 'C'
          end else
            sNuevoEstado := FieldByName('AU_ESTADO').AsString; // Dejo el mismo...

          {Anulo el turno de la autorización seleccionada si corresponde, si es el último de muchos el estado pasa a "Liquidada"}
          sSQL := 'UPDATE str_traslados ' +
                    ' SET tr_fechaanulacion = actualdate, ' +
                        ' tr_usuanulacion = :usuario, ' +
                        ' tr_codanulacion = :motivo ' +
                  ' WHERE tr_idauto = :idauto ' +
                    ' AND tr_fecha = :fecha ' +
                    ' AND tr_hora = :hora ';
          EjecutarSqlSTEx(sSQL, [Sesion.UserID, '16' {Motivo de anulación}, FieldByName('AU_ID').AsInteger, TDateTimeEx.Create(FieldByName('TURNO').AsDateTime), FieldByName('HORA').AsString]);

          {Actualizo la autorización >> estado / importe aprobado / cantidad aprobada}
          sSQL := 'UPDATE sau_autorizaciones ' +
                    ' SET au_estado = :estado, ' +
                        ' au_cantapro = au_cantapro - 1, ' +
                        ' au_usumodif = :usuario, ' +
                        ' au_fechamodif = ART.ACTUALDATE, ' +
                        ' au_impoapro = art.amebpba.get_val_prestacion(au_identifapro, au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, ' +
                                                                     ' au_siniestro, au_orden, au_recaida, au_turno, au_id, NULL, ' +
                                                                     ' ((NVL(au_kmviaje, 0) + NVL(au_kmbase, 0)) * ' +
                                                                     StringReplace(FloatToStr(PORC_DESVIO_GIS), ',', '.', []) + ') + NVL(au_kmexcedente, 0)) * (au_cantapro - 1) ' +
                  ' WHERE au_id = :idauto';
          EjecutarSqlSTEx(sSQL, [sNuevoEstado, Sesion.UserID, FieldByName('AU_ID').AsInteger]);

          iNumAuto := ValorSQLIntegerEx('SELECT TO_NUMBER(''0'' || MAX(au_numauto)) + 1 FROM sau_autorizaciones WHERE au_idexpediente = :idexpediente', [FieldByName('AU_IDEXPEDIENTE').AsInteger]);

          {Doy de alta una nueva autorización si corresponde}
          sSQL := 'INSERT INTO art.sau_autorizaciones ' +
                  '      (au_siniestro, au_orden, au_recaida, au_numauto, au_identifprestador, au_fechasoli, au_fecharecep, ' +
                  '       au_pressol, au_cantidad, au_fechadesde, au_fechahasta, au_estado, au_usualta, au_fechaalta, au_detalle, ' +
                  '       au_trabajo, au_usuapro, au_fechapro, au_presapro, au_cantapro, au_observaciones, au_identifapro, ' +
                  '       au_importe, au_impoapro, au_medico, au_detalleapro, au_aval, au_cantconsu, au_turno, au_turnohora, ' +
                  '       au_implante, au_subprest, au_subapro, au_diasdevol, au_nropedido, au_eltraslado, au_solicitante, ' +
                  '       au_dcalle, au_dnumero, au_dpiso, au_ddepartamento, au_dcpostal, au_dlocalidad, au_dprovincia, ' +
                  '       au_hcalle, au_hnumero, au_hpiso, au_hdepartamento, au_hcpostal, au_hlocalidad, au_hprovincia, ' +
                  '       au_acompanante, au_espera, au_elcontencion, au_elcontencion2, au_elcontencion3, au_tdesde, au_thasta, ' +
                  '       au_prestdesde, au_presthasta, au_retorno, au_fechaimpresion, au_pres_nomenclador, au_pres_capitulo, ' +
                  '       au_pres_codigo, au_numautoderiv, au_fechaauditoria, au_usuauditoria, au_fechahabilitacion, '+
                  '       au_usuhabilitacion, au_observacionesimpresion, au_fechamail, au_accionauditoria, au_diagnosticooms, ' +
                  '       au_porcincapacidad, au_fechacarga, au_estadoverificacion, au_motivoanulacion, au_motivorechazo, ' +
                  '       au_cantrealizadas, au_gravedadcie10, au_idcitacionconsultorio, au_nrovuelovuelta, au_nrovueloida, ' +
                  '       au_idexpediente, au_idstock, au_idpresupuesto, au_nombreacomp, au_dniacomp, au_solicitud, ' +
                  '       au_fentregaortop, au_idautorizacionorigen, au_kmexcedente, au_kmviaje, au_dlat, au_dlng, au_hlat, au_hlng, ' +
                  '       au_extension, au_fechaliquidada, au_fechaanulacion, au_usuanulacion, au_fechaenvioanul, ' +
                  '       au_usuenvioanul, au_importemulta, au_tiempoespera, ' +
                  '       au_idbaseremis, au_kmbase) ' +
                  
                  'SELECT au_siniestro, au_orden, au_recaida, :numauto, au_identifprestador, au_fechasoli, au_fecharecep, ' +
                  '       au_pressol, 1 /*au_cantidad*/, au_fechadesde, au_fechahasta, :estado, :usualta, SYSDATE, au_detalle, ' +
                  '       au_trabajo, :usuapro, SYSDATE, :presapro, 1 /*au_cantapro*/, ' +
                  '       au_observaciones, au_identifapro, ' +
                  '       au_importe, art.amebpba.get_val_prestacion(au_identifapro, :nomenclador, :capitulo, :codigo, ' +
                                                                   ' au_siniestro, au_orden, au_recaida, au_turno, au_id, NULL, ' +
                                                                   ' ((NVL(au_kmviaje, 0) + NVL(au_kmbase, 0)) * ' + StringReplace(FloatToStr(PORC_DESVIO_GIS), ',', '.', []) + ') + NVL(au_kmexcedente, 0)), ' +
                  '       au_medico, au_detalleapro, au_aval, 0 /*au_cantconsu*/, au_turno, au_turnohora, ' +
                  '       au_implante, au_subprest, au_subapro, au_diasdevol, au_nropedido, au_eltraslado, au_solicitante, ' +
                  '       au_dcalle, au_dnumero, au_dpiso, au_ddepartamento, au_dcpostal, au_dlocalidad, au_dprovincia, ' +

                  '       au_hcalle, au_hnumero, au_hpiso, au_hdepartamento, au_hcpostal, au_hlocalidad, au_hprovincia, ' +
                  (* No borrar esto...
                  iif( bEsUltimoTramo,
                  '       au_hcalle, au_hnumero, au_hpiso, au_hdepartamento, au_hcpostal, au_hlocalidad, au_hprovincia, ',
                  '       ' + SqlValue(sCalle) + ', ' + SqlValue(sNumero) + ', ' + SqlValue(sPiso) + ', ' + SqlValue(sDepartamento) + ', ' + SqlValue(sCPostal) + ', ' + SqlValue(sLocalidad) + ', ' + SqlValue(sProvincia) + ', '
                  ) +
                  *)
                  '       au_acompanante, au_espera, au_elcontencion, au_elcontencion2, au_elcontencion3, au_tdesde, au_thasta, ' +
                  '       au_prestdesde, au_presthasta, au_retorno, au_fechaimpresion, :nomenclador, :capitulo, ' +
                  '       :codigo, au_numautoderiv, au_fechaauditoria, au_usuauditoria, au_fechahabilitacion, ' +
                  '       au_usuhabilitacion, DECODE(au_observacionesimpresion, NULL, '''', au_observacionesimpresion || '' '') || :observaciones, ' +
                  '       au_fechamail, au_accionauditoria, au_diagnosticooms, ' +
                  '       au_porcincapacidad, SYSDATE, au_estadoverificacion, au_motivoanulacion, au_motivorechazo, ' +
                  '       au_cantrealizadas, au_gravedadcie10, au_idcitacionconsultorio, au_nrovuelovuelta, au_nrovueloida, ' +
                  '       au_idexpediente, au_idstock, au_idpresupuesto, au_nombreacomp, au_dniacomp, au_solicitud, ' +
                  '       au_fentregaortop, au_idautorizacionorigen, au_kmexcedente, ' +
                  //'       :kmviaje, ' +
                  '       au_kmviaje, ' +
                  '       au_dlat, au_dlng, au_hlat, au_hlng, ' +
                  '       au_extension, au_fechaliquidada, au_fechaanulacion, au_usuanulacion, au_fechaenvioanul, ' +
                  '       au_usuenvioanul, au_importemulta, au_tiempoespera, ' +
                  '       au_idbaseremis, ' + iif(iAux > 0, 'NULL', 'au_kmbase') {Sólo le asigno la base de la remisería si es el primer paso del recorrido...} +
                  '  FROM art.sau_autorizaciones sau ' +
                  ' WHERE au_id = :idauto';    //Lo ideal sería corregir también el kilometraje parcial y el domicilio HASTA
          with fraNomencladorCambio do
            EjecutarSqlSTEx(sSQL, [iNumAuto, 'A', Sesion.UserID, Sesion.UserID, TRASLADO_COMPARTIDO, Nomenclador, Capitulo, Codigo,
                                   Nomenclador, Capitulo, Codigo, sObservaciones,
                                   //TRoute(fraGIS_APIv3.GISInfo.Routes[iAux]).Distance,
                                   FieldByName('AU_ID').AsInteger]);

          iTurnoTraslado := InsertarTraslado(FieldByName('AU_SINIESTRO').AsInteger, FieldByName('AU_ORDEN').AsInteger,
                                             FieldByName('AU_RECAIDA').AsInteger, iNumAuto,
                                             FieldByName('TURNO').AsDateTime + StrToTime(FieldByName('HORA').AsString), False);
        end;

        {Inserto el detalle del viaje compartido en otra tabla para poder reconstruirlo en otro momento}
        sSQL := 'INSERT INTO amed.mvd_viajecompartido_detalle ' +
                       ' (vd_id, vd_idviajecompartido, vd_orden, vd_calle, vd_numero, ' +
                       '  vd_cpostal, vd_localidad, vd_provincia, vd_idautorizacion, vd_idtraslado) ' +
                ' VALUES (amed.seq_mvd_id.NextVal, :idviajecompartido, :orden, :calle, :numero, ' +
                        ' :cpostal, :localidad, :provincia, :idautorizacion, :idtraslado)';        
        EjecutarSqlSTEx(sSQL, [iViajeCompartido, iAux + 1, FieldByName('AU_DCALLE').AsString, FieldByName('AU_DNUMERO').AsString,
                               FieldByName('AU_DCPOSTAL').AsString, FieldByName('AU_DLOCALIDAD').AsString, FieldByName('AU_DPROVINCIA').AsString,
                               FieldByName('AU_ID').AsInteger, iTurnoTraslado]);

        {Grabo un registro en el log de auditoría, Dios sabe para qué...}       
        sSQL := 'INSERT INTO SIART_AUDITLOG (MODULO, USUARIO, FECHA, OPCION, ACCION, OBS) ' +
                ' VALUES (''REDPRES'' ,  ''' + Sesion.LoginName + ''', SYSDATE, ' +
                          '''APROBACION AUTORIZACIONES'', ''MODIFICACION'', ''"CAMB-PRESTACION";"' +
                          FieldByName('AU_SINIESTRO').AsString + '/' +
                          FieldByName('AU_ORDEN').AsString + '/' +
                          FieldByName('AU_RECAIDA').AsString + '/' +
                          FieldByName('AU_NUMAUTO').AsString + '";"' +
                          FieldByName('AU_IDENTIFAPRO').AsString + '"'')';
        EjecutarSqlST(sSQL);
      except
        on E: Exception do
        begin
          MsgBox('Ocurrió un error al generar el cambio de la prestación.' + CRLF + E.Message);
          RollBack(True);
        end;
      end;

      CommitTrans(True);
      sdqAutoriza.Refresh;

      if Assigned(lstOrderedAddress) then
        FreeAndNil(lstOrderedAddress);
    end;
  finally
    FreeAndNil(fraGIS_APIv3);
    tslRegistros.Free;
    tbViajeCompartido.Click;
  end;
end;

procedure TqrpAutoriza.fpCambioPrestacionShow(Sender: TObject);
var
  i, j, iAux, iIndice, iPacientesSeleccionados, iItemDesde, iItemHasta: Integer;
  fDistanciaParcial, fMinDistanciaParcial: Extended;
  lstAddress: TList;
  objOrigen: TAddress;
  saCombinaciones: TStringArray;
begin
  fraGIS_APIv3 := TfraGIS_APIv3.CreateWithoutNavigation(pnlGIS);
  fraGIS_APIv3.Parent := pnlGIS;
  fraGIS_APIv3.Align := alClient;
  fraNomencladorCambio.Clear;
  fraPrestadorCambio.Cargar(sdqAutoriza.FieldByName('CA_IDENTIFICADOR').AsInteger);
  fraNomencladorCambio.Cargar('1', 'MT', '1.01.03', True);

  with sdqAutoriza do
  begin
    fraDomicilioGISDestino.Cargar(FieldByName('AU_HCALLE').AsString,
                                  FieldByName('AU_HCPOSTAL').AsString,
                                  FieldByName('AU_HLOCALIDAD').AsString,
                                  FieldByName('AU_HNUMERO').AsString, '', '',
                                  FieldByName('AU_HPROVINCIA').AsString, '');
    fraDomicilioGISDestino.GeoCodificar(True, FieldByName('AU_THASTA').AsString);
  end;

  VCLExtra.LockControls([fraPrestadorCambio, fraDomicilioGISDestino], True);

  lstAddress := TList.Create;
  try
    iPacientesSeleccionados := dbgDatos.SelectedRows.Count;

    with sdqAutoriza do
    begin
      for iAux := 0 to iPacientesSeleccionados - 1 do
      begin
        dbgDatos.GotoSelection(iAux);
        lstAddress.Insert(lstAddress.Count, GetAddress(FieldByName('AU_DCALLE').AsString,
                                                       StrToIntDef(FieldByName('AU_DNUMERO').AsString, 0),
                                                       FieldByName('AU_DCPOSTAL').AsInteger,
                                                       FieldByName('AU_DLOCALIDAD').AsString,
                                                       '', FieldByName('AU_DPROVINCIA').AsString,
                                                       True, FieldByName('AU_TDESDE').AsString,
                                                       iAux));
      end;
    end;

    {Agrego el destino en la última posición, inamovible al calcular las distancias parciales}
    lstAddress.Insert(lstAddress.Count, fraDomicilioGISDestino.Address);

    {Reordenamiento de acuerdo a las distancias parciales}
    saCombinaciones := GetCombinacionesFactorial(iPacientesSeleccionados);
    fMinDistanciaParcial := 0;
    iItemHasta := 0;
    iIndice := 0;

    for i := Low(saCombinaciones) to High(saCombinaciones) do
    begin
      fDistanciaParcial := 0;

      for j := 1 to iPacientesSeleccionados - 1 do
      begin
        iItemDesde := StrToInt(saCombinaciones[i][j]) - 1;
        iItemHasta := StrToInt(saCombinaciones[i][j+1]) - 1;

        // Tomo de a pares
        fDistanciaParcial := fDistanciaParcial + CalculateDistance(TAddress(lstAddress.Items[iItemDesde]).Point, TAddress(lstAddress.Items[iItemHasta]).Point);
      end;

      {Calculo la distancia al destino final, usando el último "hasta" como "desde" y el siguiente elemento, que viene a ser el destino final}
      fDistanciaParcial := fDistanciaParcial + CalculateDistance(TAddress(lstAddress.Items[iItemHasta]).Point, TAddress(lstAddress.Items[iItemHasta + 1]).Point);

      if (fMinDistanciaParcial = 0) or (fDistanciaParcial < fMinDistanciaParcial) then
      begin
        iIndice := i;
        fMinDistanciaParcial := fDistanciaParcial;
      end;
    end;

    {Borro el destino, no es un waypoint}
    lstAddress.Delete(lstAddress.Count - 1);

    lstOrderedAddress := TList.Create;
    try
      for i := 0 to iPacientesSeleccionados - 1 do
      begin
        iAux := StrToInt(saCombinaciones[iIndice][i + 1]);
        TAddress(lstAddress.Items[iAux - 1]).Order := i;
        lstOrderedAddress.Insert(i, lstAddress.Items[iAux - 1]);
      end;

      {Extraigo el primer paciente para establecer el origen}
      objOrigen := lstOrderedAddress.Items[0];

      {Borro el primer paciente}
      lstOrderedAddress.Delete(0);

      fraGIS_APIv3.TraceRoute(objOrigen, fraDomicilioGISDestino.Address, lstOrderedAddress);

      {Lo vuelvo a poner usarlo en el método btnConfirmarViajeClick}
      lstOrderedAddress.Insert(0, objOrigen);
    finally
      //lstOrderedAddress.Free;                     Lo libero en el método btnConfirmarViajeClick...
    end;
  finally
    if Assigned(lstAddress) then
      FreeAndNil(lstAddress);
  end;
end;

procedure TqrpAutoriza.btnVerEnGoogleMapsClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(fraGIS_APIv3.URL), '', '', SW_SHOWNORMAL);
end;

procedure TqrpAutoriza.mnuViajarAutorizacionesClick(Sender: TObject);
begin
  if sdqAutoriza.IsEmpty then
    Exit;

  with frmAutSelPorSiniestro do
  begin
    if not(Assigned(frmAutSelPorSiniestro)) then
    begin
      frmAutSelPorSiniestro := TfrmAutSelPorSiniestro.Create(frmPrincipal);
      MenuItem              := frmPrincipal.mnuAutAprobacion;
      FormStyle             := fsMDIChild;
    end;

    with Self.sdqAutoriza do
      SinEdit.SetValues(FieldByName('AU_SINIESTRO').AsInteger, FieldByName('AU_ORDEN').AsInteger, FieldByName('AU_RECAIDA').AsInteger);
    tbRefrescarClick(nil);
    sdqBusqueda.Locate('AU_NUMAUTO', Self.sdqAutoriza.FieldByName('AU_NUMAUTO').AsInteger, [loPartialKey]);
    Show;
  end;
end;

procedure TqrpAutoriza.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;

procedure TqrpAutoriza.pmContextualPopup(Sender: TObject);
begin
  mnuVerCompartido.Visible := not sdqAutoriza.FieldByName('VC_URL').IsNull;
end;

procedure TqrpAutoriza.mnuVerCompartidoClick(Sender: TObject);
begin
  fraGIS_APIv3 := TfraGIS_APIv3.CreateWithoutNavigation(pnlGIS);
  fraGIS_APIv3.Parent := pnlCompartido;
  fraGIS_APIv3.Align := alClient;
  try
    fpVerCompartido.ShowModal;
  finally
    FreeAndNil(fraGIS_APIv3);
  end;
end;

procedure TqrpAutoriza.fpVerCompartidoShow(Sender: TObject);
begin
  fraGIS_APIv3.Navigate(sdqAutoriza.FieldByName('VC_URL').AsString);
end;

procedure TqrpAutoriza.dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Field.DataSet.IsEmpty then
    if Field.DataSet.FieldByName('AU_PRESAPRO').AsString = TRASLADO_COMPARTIDO then
      Background := $0072B1EB;
end;

procedure TqrpAutoriza.pmViajarPopup(Sender: TObject);
begin
  mnuViajarAutorizaciones.Enabled := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuAutAprobacion);   // habilitaciones Btn Viajar
end;

end.
