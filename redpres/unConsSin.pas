unit unConsSin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ShortCutControl, QueryPrint, SortDlg, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, StdCtrls, ToolEdit, Mask, DateComboBox, unfraPrestador,
  IntEdit, ExtCtrls, Placemnt, unFraCIE10, Db, SDEngine, unFraTrabajadorSIN, unFraEmpresa, QueryToFile, ExportDialog,
  unDmPrincipal, artSeguridad, unArtFrame, unArtDbFrame, PatternEdit, unArtDBAwareFrame, QRCtrls, QuickRpt, Menus,
  unCustomForm, ImgList, XPMenu, CheckPanel, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unFraCodigoDescripcion, unFraGrupoTrabajo, FormPanel, Buttons,
  unfraCtbTablas, RxToolEdit, RxPlacemnt;

type
  TfrmConsSin = class(TfrmCustomForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    tbDetalles: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton1: TToolButton;
    tbOrden: TToolButton;
    Sep1: TToolButton;
    tbImprimir: TToolButton;
    Sep3: TToolButton;
    tbMaxRegistros: TToolButton;
    ToolButton2: TToolButton;
    tbOcultarMostrar: TToolButton;
    ToolButton6: TToolButton;
    dbgListado: TArtDBGrid;
    SortDialog: TSortDialog;
    QueryPrint: TQueryPrint;
    ShortCutControl: TShortCutControl;
    tbExportar: TToolButton;
    FormPlacement: TFormPlacement;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    pcFiltros: TPageControl;
    sdDatosSin: TTabSheet;
    TabSheet2: TTabSheet;
    pnlSiniestro: TPanel;
    Label7: TLabel;
    edNumDesde: TIntEdit;
    edNumHasta: TIntEdit;
    chkNumero: TCheckBox;
    chkCIE10: TCheckBox;
    chkFechaAlta: TCheckBox;
    pnlFechaAlta: TPanel;
    Label2: TLabel;
    deFechaAltaDesde: TDateComboBox;
    deFechaAltaHasta: TDateComboBox;
    chkEstado: TCheckBox;
    pnlEstado: TPanel;
    chkGTrabajo: TCheckBox;
    pnlGTrabajo: TPanel;
    pnlCIE10: TPanel;
    fraCIE10: TfraCIE10;
    chkEmpresa: TCheckBox;
    pnlEmpresa: TPanel;
    pnlTrabajador: TPanel;
    chkTrabajador: TCheckBox;
    fraEmpresa: TfraEmpresa;
    fraTrabajadorSIN: TfraTrabajadorSIN;
    pnlFechaAcci: TPanel;
    Label1: TLabel;
    deFechaAcciDesde: TDateComboBox;
    deFechaAcciHasta: TDateComboBox;
    chkFechaAcci: TCheckBox;
    chkFechaReca: TCheckBox;
    pnlFechaReca: TPanel;
    Label3: TLabel;
    deFechaRecaDesde: TDateComboBox;
    deFechaRecaHasta: TDateComboBox;
    ExportDialog: TExportDialog;
    cmbEstado: TComboBox;
    pnlDelegacion: TPanel;
    cmbDelegacion: TArtComboBox;
    chkDelegacion: TCheckBox;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    pnlFechaReasignacion: TPanel;
    Label4: TLabel;
    deFechaReasigDesde: TDateComboBox;
    deFechaReasigHasta: TDateComboBox;
    chkFechaReasignacion: TCheckBox;
    tbTotales: TToolButton;
    PrintDialog: TPrintDialog;
    edDelegacion: TEdit;
    pnlPrestador: TPanel;
    fraPrestador: TfraPrestador;
    chkPrestador: TCheckBox;
    sdqTipoAccidente: TSDQuery;
    dsTipoAccidente: TDataSource;
    pnlTipoAccidente: TPanel;
    cmbTipoAccidente: TArtComboBox;
    edTipoAccidente: TEdit;
    chkTipoAccidente: TCheckBox;
    pnlGravedad: TPanel;
    chkGravedad: TCheckBox;
    edGravedad: TEdit;
    cmbGravedad: TArtComboBox;
    sdqGravedad: TSDQuery;
    dsGravedad: TDataSource;
    tbOcultarColumnas: TToolButton;
    tbCostos: TToolButton;
    tbSalir: TToolButton;
    Seguridad: TSeguridad;
    tbOcultarColumnasEmp: TToolButton;
    tbMortales: TToolButton;
    ToolButton3: TToolButton;
    ScrollBox1: TScrollBox;
    qrResumenSiniestros: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel23: TQRLabel;
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlSeleccion: TQRLabel;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel26: TQRLabel;
    qrlEmpresa: TQRLabel;
    pmImprimir: TPopupMenu;
    mnuListado: TMenuItem;
    mnuResumenSiniestros: TMenuItem;
    QRShape1: TQRShape;
    QRDBText18: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel2: TQRLabel;
    tbEnfProfesional: TToolButton;
    pnlEEPP: TPanel;
    deFechaEEPPHasta: TDateComboBox;
    Label17: TLabel;
    deFechaEEPPDesde: TDateComboBox;
    chkEEPP: TCheckBox;
    pnlSectorEmpr: TPanel;
    chkSectorEmpr: TCheckBox;
    fraSectorEmpr: TfraStaticCTB_TABLAS;
    tbPasoRegionalizacion: TToolButton;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    tbModifDatosSin: TToolButton;
    ToolButton5: TToolButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    fpDatosSiniestro: TFormPanel;
    lblNroSiniestro: TLabel;
    gbDatosSinMixtos: TGroupBox;
    chkOdontologico: TCheckBox;
    chkSerologico: TCheckBox;
    gbGestAud: TGroupBox;
    dcGestAud: TDateComboBox;
    pnlGestAud: TPanel;
    Label5: TLabel;
    deGestAudHasta: TDateComboBox;
    deGestAudDesde: TDateComboBox;
    chkGestAud: TCheckBox;
    pnlRemis: TPanel;
    chkRemis: TCheckBox;
    rbSiRemis: TRadioButton;
    rbNoRemis: TRadioButton;
    pnlEstadoCron: TPanel;
    chkEstadoCron: TCheckBox;
    rbActivoCron: TRadioButton;
    rbSinACron: TRadioButton;
    rbInactivoCron: TRadioButton;
    chkRegSanitPrestador: TCheckPanel;
    fraRegionSanitaria: TfraCtbTablas;
    tbHistGTrabajo: TToolButton;
    fpHistGT: TFormPanel;
    gridHGTrabajo: TArtDBGrid;
    BevelAbm: TBevel;
    btnCancelar: TButton;
    sdqhgtrabajo: TSDQuery;
    dsHGtrabajo: TDataSource;
    pnlDelegacionContrato: TPanel;
    cmbDelegacionContrato: TArtComboBox;
    edDelegacionContrato: TEdit;
    chkDelegacionContrato: TCheckBox;
    gbUsuariosPorPrest: TGroupBox;
    fraUsuariosPorPrest: TfraCodigoDescripcion;
    cbPrestSinAsignar: TCheckBox;
    Panel1: TPanel;
    chkSRT: TCheckBox;
    chkReq: TCheckBox;
    chkPostAlta: TCheckBox;
    chkSinMixOdontologico: TCheckBox;
    chkSinMixSerologico: TCheckBox;
    chkGSueldos: TCheckBox;
    chkComMed: TCheckBox;
    chkInvestAdmin: TCheckBox;
    chkIntercurrencia: TCheckBox;
    chkPsiquiatria: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbDetallesClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbMaxRegistrosClick(Sender: TObject);
    procedure tbOcultarMostrarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkCIE10Click(Sender: TObject);
    procedure chkGTrabajoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkNumeroClick(Sender: TObject);
    procedure dbgListadoGetCellParams(Sender: TObject; Field: TField;AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkPrestadorClick(Sender: TObject);
    procedure chkEmpresaClick(Sender: TObject);
    procedure chkTrabajadorClick(Sender: TObject);
    procedure chkFechaAltaClick(Sender: TObject);
    procedure chkEstadoClick(Sender: TObject);
    procedure chkFechaAcciClick(Sender: TObject);
    procedure chkFechaRecaClick(Sender: TObject);
    procedure chkDelegacionClick(Sender: TObject);
    procedure chkFechaReasignacionClick(Sender: TObject);
    procedure dbgListadoPaintFooter(Sender: TObject; Column: String;var Value: String; var CellColor, FontColor: TColor;
                                    var AlignFooter: TAlingFooter);
    procedure tbTotalesClick(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure edDelegacionKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDelegacionCloseUp(Sender: TObject);
    procedure cmbDelegacionChange(Sender: TObject);
    procedure edDelegacionContratoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDelegacionContratoCloseUp(Sender: TObject);
    procedure cmbDelegacionContratoChange(Sender: TObject);
    procedure edTipoAccidenteKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoAccidenteChange(Sender: TObject);
    procedure cmbTipoAccidenteCloseUp(Sender: TObject);
    procedure edGravedadKeyPress(Sender: TObject; var Key: Char);
    procedure cmbGravedadChange(Sender: TObject);
    procedure cmbGravedadCloseUp(Sender: TObject);
    procedure chkTipoAccidenteClick(Sender: TObject);
    procedure chkGravedadClick(Sender: TObject);
    procedure tbOcultarColumnasClick(Sender: TObject);
    procedure tbCostosClick(Sender: TObject);
    procedure tbOcultarColumnasEmpClick(Sender: TObject);
    procedure tbMortalesClick(Sender: TObject);
    procedure mnuListadoClick(Sender: TObject);
    procedure mnuResumenSiniestrosClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tbEnfProfesionalClick(Sender: TObject);
    procedure chkEEPPClick(Sender: TObject);
    procedure chkSectorEmprClick(Sender: TObject);
    procedure tbPasoRegionalizacionClick(Sender: TObject);
    procedure tbModifDatosSinClick(Sender: TObject);
    procedure chkGestAudClick(Sender: TObject);
    procedure chkRemisClick(Sender: TObject);
    procedure chkEstadoCronClick(Sender: TObject);
    procedure chkRegSanitPrestadorClick(Sender: TObject);
    procedure tbHistGTrabajoClick(Sender: TObject);
    procedure chkDelegacionContratoClick(Sender: TObject);
    procedure cbPrestSinAsignarClick(Sender: TObject);
  private
    sFiltros: String;
    SqlCtbCausa: String;
    SqlCtbEstado: String;
    SqlCtbGrav: String;
    SqlCtbTipo: String;
    SqlWhere: String;
    Totales: TDynStringArray;

    procedure CalcTotales;
    procedure MakeSubTitle;
    procedure Inicializa_fpDatosSiniestro;
    function IsRegistroEPValido :Boolean;
  public
  end;

const
  ColTotales: Array[0..4] of String = ('SINIESTRO', 'IMPORTELIQUIDADOILP', 'IMPORTELIQUIDADOMORT', 'IMPORTECONCEPTOS',
                                       'IMPORTEPRESTMEDICAS');

var
  frmConsSin: TfrmConsSin;

implementation

uses
  unPrincipal, CustomDlgs, unDatosSiniestro, General, unCostosxSiniestro, unSesion, AnsiSql,
  uncomunes, artDbLogin, unTercerizadoras, unSiniestros, vclextra;

{$R *.DFM}

procedure TfrmConsSin.tbRefrescarClick(Sender: TObject);
var
  Sql, sEstado, SqlSelect_Investig, SqlFrom_Investig, SqlWhere_Investig, SqlFrom, SqlSelect: String;
begin
  if (chkempresa.Checked) and (not fraempresa.IsEmpty) then
    LogAuditoria('LCS', fraEmpresa.CUIT);

  if SqlCtbTipo = '' then
  begin
    SqlCtbTipo   := GetDecodeFromCTB('EX_TIPO',     'STIPO', '1', True);
    SqlCtbGrav   := GetDecodeFromCTB('EX_GRAVEDAD', 'SGRAV', '1', True);
    SqlCtbCausa  := GetDecodeFromCTB('EX_CAUSAFIN', 'CATER');
    SqlCtbEstado := GetDecodeFromCTB('EX_ESTADO',   'SIEST');
  end;

  sFiltros := '';
  SqlWhere := '';
  SqlSelect_Investig := '';
  SqlFrom_Investig   := '';
  SqlWhere_Investig  := '';
  SqlFrom := '';
  SqlSelect := '';

  if chkNumero.Checked then
    if (edNumDesde.Text <> '') and (edNumHasta.Text <> '') then
    begin
      SqlWhere := SqlWhere + ' AND EX_SINIESTRO BETWEEN ' + edNumDesde.TextSql + ' AND ' + edNumHasta.TextSql;
      sFiltros := sFiltros + ' - Siniestro desde: ' + edNumDesde.Text + ' hasta: ' + edNumHasta.Text;
    end
    else if (edNumDesde.Text <> '') then
    begin
      SqlWhere := SqlWhere + ' AND EX_SINIESTRO > ' + edNumDesde.TextSql;
      sFiltros := sFiltros + ' - Siniestro desde: ' + edNumDesde.Text;
    end
    else if (edNumHasta.Text <> '') then
    begin
      SqlWhere := SqlWhere + ' AND EX_SINIESTRO < ' + edNumHasta.TextSql;
      sFiltros := sFiltros + ' - Siniestro hasta: ' + edNumHasta.Text;
    end;

  if chkCIE10.Checked then
    if fraCIE10.edCodigo.Text = '' then
    begin
      SqlWhere := SqlWhere + ' AND EX_DIAGNOSTICOOMS IS NOT NULL';
      sFiltros := sFiltros + ' - CIE10 no nulo';
    end
    else
    begin
      SqlWhere := SqlWhere + ' AND EX_DIAGNOSTICOOMS = ' + SqlValue(fraCIE10.edCodigo.Text);
      sFiltros := sFiltros + ' - CIE10: ' + fraCIE10.edCodigo.Text;
    end;

  if chkFechaAcci.Checked then
    if (deFechaAcciDesde.Date <> 0) and (deFechaAcciHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAACCIDENTE BETWEEN ' + deFechaAcciDesde.SqlText + ' AND ' + deFechaAcciHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Accid. desde: ' + deFechaAcciDesde.Text + ' hasta: ' + deFechaAcciHasta.Text;
    end
    else if (deFechaAcciDesde.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAACCIDENTE > ' + deFechaAcciDesde.SqlText;
      sFiltros := sFiltros + ' - Fecha Accid. desde: ' + deFechaAcciDesde.Text;
    end
    else if (deFechaAcciHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAACCIDENTE < ' + deFechaAcciHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Accid. hasta: ' + deFechaAcciHasta.Text
    end;

  if chkFechaReca.Checked then
    if (deFechaRecaDesde.Date <> 0) and (deFechaRecaHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHARECAIDA BETWEEN ' + deFechaRecaDesde.SqlText + ' AND ' + deFechaRecaHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Recaida desde: ' + deFechaRecaDesde.Text + ' hasta: ' + deFechaRecaHasta.Text;
    end
    else if (deFechaRecaDesde.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHARECAIDA > ' + deFechaRecaDesde.SqlText;
      sFiltros := sFiltros + ' - Fecha Recaida desde: ' + deFechaRecaDesde.Text;
    end
    else if (deFechaRecaHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHARECAIDA < ' + deFechaRecaHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Recaida hasta: ' + deFechaRecaHasta.Text;
    end
    else
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHARECAIDA IS NOT NULL';
      sFiltros := sFiltros + ' - Fecha Recaida no nula';
    end;

  if chkFechaAlta.Checked then
    if (deFechaAltaDesde.Date <> 0) and (deFechaAltaHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAALTA BETWEEN ' + deFechaAltaDesde.SqlText + ' AND ' + deFechaAltaHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Alta desde: ' + deFechaAltaDesde.Text + ' hasta: ' + deFechaAltaHasta.Text;
    end
    else if (deFechaAltaDesde.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAALTA > ' + deFechaAltaDesde.SqlText;
      sFiltros := sFiltros + ' - Fecha Alta desde: ' + deFechaAltaDesde.Text;
    end
    else if (deFechaAltaHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAALTA < ' + deFechaAltaHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Alta hasta: ' + deFechaAltaHasta.Text;
    end;

  if chkEEPP.Checked then
    if (deFechaEEPPDesde.Date <> 0) and (deFechaEEPPDesde.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAPOSIBLEEEPP BETWEEN ' + deFechaEEPPDesde.SqlText + ' AND ' + deFechaEEPPHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Posible enf. prof.: ' + deFechaEEPPDesde.Text + ' hasta: ' + deFechaEEPPHasta.Text;
    end
    else if (deFechaEEPPDesde.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAPOSIBLEEEPP > ' + deFechaEEPPDesde.SqlText;
      sFiltros := sFiltros + ' - Fecha Posible enf. prof. desde: ' + deFechaEEPPDesde.Text;
    end
    else if (deFechaEEPPHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAPOSIBLEEEPP < ' + deFechaEEPPHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Posible enf. prof. hasta: ' + deFechaEEPPHasta.Text;
    end;

  if (fraPrestador.IDPrestador <> 0) then
  begin
    SqlWhere := SqlWhere + ' AND EX_PRESTADOR = ' + SqlInt(fraPrestador.IDPrestador);
    sFiltros := sFiltros + ' - Prestador: ' + fraPrestador.RazonSocial;
  end;

  if chkEstado.Checked then
  begin
    case cmbEstado.ItemIndex of
      0:  SqlWhere := SqlWhere + ' AND EX_ESTADO IN (''01'', ''02'')';
      1:  SqlWhere := SqlWhere + ' AND EX_ESTADO = ''03''';
      2:  SqlWhere := SqlWhere + ' AND EX_CAUSAFIN = ''02''';
    end;
    sFiltros := sFiltros + ' - Estado: ' + cmbEstado.Text;
  end;

  if chkEmpresa.Checked then
    SqlWhere := SqlWhere + ' AND EX_CUIT = ' + SQLValue(fraEmpresa.CUIT);

  if chkTrabajador.Checked then
  begin
    SqlWhere := SqlWhere + ' AND EX_CUIL = ' + SqlValue(fraTrabajadorSIN.mskTrabCUIL.Text);
    sFiltros := sFiltros + ' - Trabajador: ' + fraTrabajadorSIN.dbcTrabNombre.Text;
  end;

  if chkGTrabajo.Checked then
  begin
    // Lu 03/04/2008  agregue esto por cambio de Personalizacion de siniestros.
    if  (fraGrupoTrabajo.ID <> '') then
       SqlWhere := SqlWhere + ' AND ex_gtrabajo = ' + SqlValue(fraGrupoTrabajo.ID);

    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
       SqlWhere := SqlWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

    sFiltros := sFiltros + ' - G. Trabajo: ' +  fraGrupoTrabajo.edCodigo.Text + ' - U. Gestor: ' + fraGrupoTrabajo.cmbGestor.Text;
  end;

  if chkDelegacion.Checked then
  begin         //las comillas son para que no tome el indice por delegación (porque se va a la misma m....)
    SqlWhere := SqlWhere + ' AND '''' || ex_delegacion = ' + SqlValue(edDelegacion.Text);
    sFiltros := sFiltros + ' - Delegación siniestro: ' + edDelegacion.Text;
  end;

  {if chkDelegacionContrato.Checked then
  begin
    SqlSelect := ', dcon.el_nombre delcontrato ';
    SqlFrom := ', adc_delegacioncontrato, del_delegacion dcon ';
  end; }

  if chkFechaReasignacion.Checked then
    if (deFechaReasigDesde.Date <> 0) and (deFechaReasigHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAREASIGNACION BETWEEN ' + deFechaReasigDesde.SqlText + ' AND ' + deFechaReasigHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Reasig. desde: ' + deFechaReasigDesde.Text + ' hasta: ' + deFechaReasigDesde.Text;
    end
    else if (deFechaReasigDesde.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAREASIGNACION > ' + deFechaReasigDesde.SqlText;
      sFiltros := sFiltros + ' - Fecha Reasig. desde: ' + deFechaReasigDesde.Text;
    end else if (deFechaReasigHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAREASIGNACION < ' + deFechaReasigHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Reasig. hasta: ' + deFechaReasigHasta.Text;
    end;

  if chkSRT.Checked then
  begin
    SqlWhere := SqlWhere + ' AND EXISTS (SELECT 1' +
                                 ' FROM sin.sdg_denunciagrave' +
                                ' WHERE dg_idexpediente = ex_id)';
    sFiltros := sFiltros + ' - SRT';
  end;

  if chkReq.Checked then
  begin
    SqlWhere := SqlWhere + ' AND amebpba.is_requerimientosrt(ex_siniestro, ex_orden, ex_recaida) = ''S''';
    sFiltros := sFiltros + ' - Req.';
  end;

  if chkTipoAccidente.Checked then
  begin
    SqlWhere := SqlWhere + IIF(edTipoAccidente.Text = '1', ' and ( (EX_TIPO is null) or (EX_TIPO = '' '') or (EX_TIPO = ''1'') ) ', ' and Ex_tipo = ''' + edTipoAccidente.Text + '''');
    if (cmbTipoAccidente.Text <> '') then
      sFiltros := sFiltros + ' - Tipo de Accidente: ' + cmbTipoAccidente.Text;
  end;

  if chkGravedad.Checked then
  begin
    SqlWhere := SqlWhere + IIF(edGravedad.Text = '1', ' and ( (EX_GRAVEDAD is null) or (EX_GRAVEDAD = ''1'') )', ' and Ex_gravedad = ''' + edGravedad.Text + '''');
    sFiltros := sFiltros + ' - Gravedad: ' + cmbGravedad.Text;
  end;

  if chkSectorEmpr.Checked then
  begin
    SqlWhere := SqlWhere + ' AND EM_SECTOR = ' + SqlValue(fraSectorEmpr.Codigo);
    sFiltros := sFiltros + ' - Sector Empr.: ' + fraSectorEmpr.cmbDescripcion.Text;
  end;

  if tbMaxRegistros.Down then
  begin
    SqlWhere := SqlWhere + ' AND ROWNUM <= ' + IntToStr(tbMaxRegistros.Tag);
    sFiltros := sFiltros + ' - Limitado a: ' + IntToStr(tbMaxRegistros.Tag) + ' registros';
  end;

  if chkSinMixSerologico.Checked then
  begin
    SqlWhere := SqlWhere + ' AND EX_SINMIXSEROL = ' + SqlString('S',True);
    sFiltros := sFiltros + ' - Sin. Mixtos Serológicos ';
  end;

  if chkSinMixOdontologico.Checked then
  begin
    SqlWhere := SqlWhere + ' AND EX_SINMIXODONT = ' + SqlString('S',True);
    sFiltros := sFiltros + ' - Sin. Mixtos Odontológicos ';
  end;

  if chkGestAud.Checked then   // Lu WF 7781
    if (deGestAudDesde.Date <> 0) and (deGestAudHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAGESTAUD BETWEEN ' + deGestAudDesde.SqlText + ' AND ' + deGestAudHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Gest. Aud. desde: ' + deGestAudDesde.Text + ' hasta: ' + deGestAudHasta.Text;
    end
    else if (deGestAudDesde.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAGESTAUD > ' + deGestAudDesde.SqlText;
      sFiltros := sFiltros + ' - Fecha Gest. Aud. desde: ' + deGestAudDesde.Text;
    end
    else if (deGestAudHasta.Date <> 0) then
    begin
      SqlWhere := SqlWhere + ' AND EX_FECHAGESTAUD < ' + deGestAudHasta.SqlText;
      sFiltros := sFiltros + ' - Fecha Gest. Aud. hasta: ' + deGestAudHasta.Text;
    end;

  if chkRemis.Checked then
  begin
    SqlWhere := SqlWhere + ' AND NVL(ex_ameritaremis, ''S'') = ' + SqlBoolean(rbSiRemis.Checked);
    sFiltros := sFiltros + ' - Amerita remis: ' + IIF(rbSiRemis.Checked, 'Si', 'No');
  end;

  if chkGSueldos.Checked then
  begin
    SqlWhere := SqlWhere + ' AND art.trabajador.get_isgrandessueldos(ex_cuil, ex_contrato) = ''S'' ';
    sFiltros := sFiltros + ' - Grandes sueldos ';
  end;

  if chkEstadoCron.Checked then
  begin
    sEstado  := IIF(rbActivoCron.Checked, 'A', IIF(rbSinACron.Checked, 'S', 'I'));
    SqlWhere := SqlWhere + ' AND NVL(ex_estadocronico, '' '') = ' + SqlValue(sEstado);
    sFiltros := sFiltros + ' - Estado crónicos: ' + sEstado;
  end;

  if EsUsuarioDeTercerizadora then    // plan Ioma - Tercerizadoras
  begin
    SqlWhere := SqlWhere + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';
    sFiltros := sFiltros + ' - Siniestros tercerizados ';
  end;

  if chkInvestAdmin.Checked then    // TK 22116
  begin
    SqlWhere := SqlWhere + ' AND art.siniestro.Get_NroAutoriz_Invest(ex_id) IS NOT NULL ';
    sFiltros := sFiltros + ' - Investigación Administrativa';
  end;

  if chkIntercurrencia.Checked then    // TK 57097
  begin
    SqlWhere := SqlWhere + ' AND ex_intercurrencia = ''S'' ';
    sFiltros := sFiltros + ' - Intercurrencia';
  end;

  if chkPsiquiatria.Checked then
  begin
    SqlWhere := SqlWhere + ' AND pe_psiquiatria = ''S'' ';
    sFiltros := sFiltros + ' - Psiquiatría';
  end;

  if Is_UsuarioSML(Sesion.UserID) then   // Plan - SML
  begin
    SqlWhere := SqlWhere + ' AND art.siniestro.get_siniestrosml(ex_id) = ''S'' ';
    sFiltros := sFiltros +  ' - Siniestros de SML';
  end;

  if fraUsuariosPorPrest.IsSelected then
  begin
    SqlWhere := SqlWhere + '  AND ex_prestador IN (SELECT pu_idprestador ' +
                                                  ' FROM cpu_prestadorusuario ' +
                                                 ' WHERE pu_usuario = ' + SqlValue(fraUsuariosPorPrest.Codigo) +
                                                   ' AND pu_fechabaja IS NULL) ';
    sFiltros := sFiltros + ' - Usuario/s por Prest: ' + fraUsuariosPorPrest.Descripcion;
  end;

  if cbPrestSinAsignar.Checked = true then
  begin
    SqlWhere := SqlWhere + ' AND ex_prestador IN ( ' +
                               ' SELECT ca_identificador ' +
                                 ' FROM art.cpr_prestador ' +
                                ' WHERE ca_fechabaja IS NULL ' +
                                  ' AND ca_identificador NOT IN (SELECT pu_idprestador ' +
                                                                 ' FROM art.cpu_prestadorusuario ' +
                                                                ' WHERE pu_fechabaja IS NULL)) ';
    sFiltros := sFiltros + ' - Usuario/s por Prest: ' + fraUsuariosPorPrest.Descripcion;
  end;

  Sql :=
    'SELECT ex_id, ex_siniestro, ex_orden, ex_recaida,' +
          ' utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida, ''-'') SINIESTRO, ex_cuil, tj_nombre, ex_cuit,' +
          ' em_nombre, ex_fechaaccidente, ex_fecharecaida, ex_bajamedica, ex_altamedica,' +
          ' ex_fechareasignacion F_REASIGNACION, dsin.el_nombre delsiniestro, ex_diagnosticooms, ex_fechaalta, P_SIN.ca_descripcion PrestadorSIN,' +
          ' P_SIN.ca_fechabaja, P_SIN.ca_codarea || '' '' || P_SIN.ca_telefono P_SIN_ca_telefono, P_SIN.ca_localidad, pv_descripcion PROVPREST, gp_nombre,' +
          ' art.siniestro.get_motivorechazo(ex_siniestro, ex_orden, ex_recaida) MotivoRechazo,' +
          ' art.liq.Get_ImporteLiquidadoILT(ex_siniestro, ex_orden, ex_recaida) ImporteLiquidadoILT,' +
          ' art.liq.Get_ImporteLiquidadoILP(ex_siniestro, ex_orden, ex_recaida) ImporteLiquidadoILP,' +
          ' art.liq.Get_ImporteLiquidadoMortales(ex_siniestro, ex_orden, ex_recaida) ImporteLiquidadoMort,' +
          ' art.liq.Get_ImporteConceptos(ex_siniestro, ex_orden, ex_recaida) ImporteConceptos,' +
          ' art.sin.Get_CantDiasCaidos(ex_siniestro, ex_orden, ex_recaida) DIASCAIDOS,' +
          ' art.amebpba.Get_ImportePrestMedicas(ex_siniestro, ex_orden, ex_recaida) ImportePrestMedicas,' +
          ' art.varios.get_regionsanitaria(tj_cpostal, tj_localidad) RegionSanitaria, NULL CATEGORIA,' +
          ' ex_horaaccidente, ex_brevedescripcion, nvl(ex_posiblerecupero, ''N'') PosRecupero,' +
          ' art.liq.get_importeporconcepto(ex_siniestro, ex_orden, ex_recaida, ''53'') Anticipo,' +
          ' art.liq.get_importeporconcepto(ex_siniestro, ex_orden, ex_recaida, ''8'') Definitivo,' +
          ' art.liq.get_importeporconcepto(ex_siniestro, ex_orden, ex_recaida, ''55'') PagoUnico,' +
          ' art.liq.get_destinatporconcepto(ex_siniestro, ex_orden, ex_recaida, ''8'') BenefDefi,' +
          ' art.liq.get_importeporotrosconceptos(ex_siniestro, ex_orden, ex_recaida, ''5'') Sepelio,' +
          ' art.liq.get_maxfechaporotrosconceptos(ex_siniestro, ex_orden, ex_recaida, ''5'') FLiqSepelio,' +
          ' art.liq.get_destinatporotrosconceptos(ex_siniestro, ex_orden, ex_recaida, ''5'') BenefSepelio,' +
          ' art.amebpba.get_denunciasrt(ex_siniestro, ex_orden, ex_recaida)	DenunciaSRT,' +
          ' nvl(ex_fecharecaida, ex_fechaaccidente) fechaaccidente,' +
          ' art.liq.get_importeliquidadoilt(ex_siniestro, ex_orden, ex_recaida) +' +
          ' art.liq.get_importeconceptos(ex_siniestro, ex_orden, ex_recaida) pagos, lf_descripcion forma,' +
          ' la_descripcion agente, ln_descripcion naturaleza, lz_descripcion zona, dg_descripcion, ex_fecharecepcion,' +
          ' ex_diagnostico,' +
          ' art.utiles.armar_domicilio(P_SIN.ca_calle, P_SIN.ca_numero, P_SIN.ca_piso, P_SIN.ca_departamento, P_SIN.ca_localidad) domprest,' +
          ' art.liq.get_maxporcliquidado(ex_siniestro, ex_orden, ex_recaida) PorcentLiquidado,' +
          ' amebpba.get_cantreqsrt(ex_siniestro, ex_orden, ex_recaida) ReqSRT,' +
          SqlCtbEstado + ' Estado,' +
          SqlCtbCausa  + ' Causafin,' +
          SqlCtbTipo   + ' TipoAccidente,' +
          SqlCtbGrav   + ' Gravedad,' +
          ' ex_posibleeepp, ex_usuposibleeepp, ex_fechaposibleeepp, cont.is_empresafondo(ex_cuit) isempfondo,' +
          ' nvl(ex_tipo, ''1'') tiposin, co_contrato, ex_siniestrored, sect.tb_descripcion descrsector,' +
          ' ex_liberatrabajo, ex_gtrabajo, NVL(ex_gravedad, ''1'') ex_gravedad, ex_usuliberatrabajo,' +
          ' ex_fechaliberatrabajo, substr(art.inca.get_descripcioninca(ex_siniestro, ex_orden, ''M''), 15, 7) Por_Inca,' +
          ' substr(art.inca.get_descripcioninca(ex_siniestro, ex_orden, ''M''), 31) Eve_Inca,' +
          ' substr(art.inca.get_descripcioninca(ex_siniestro, ex_orden, ''M''), 1, 10) Fec_Inca, ' +
          ' tt_postalta postalta, siniestro.get_usuariogestor(ex_id) USUGESTOR, ' +
          ' ex_sinmixserol, ex_sinmixodont, ex_fechagestaud, NVL(ex_ameritaremis, ''S'') ex_ameritaremis, ' +
          ' art.trabajador.get_isgrandessueldos(ex_cuil, ex_contrato) gransueldo, ' +
          ' art.inca.is_dictamencommed(ex_siniestro, ex_orden) commed, ' +
          ' DECODE(ex_estadocronico, ''A'', ''Activo'', ''S'', ''Sin actualización'', ''I'', ''Inactivo'', Null) EstadoCron, ' +
          ' art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) Juicio,  ' +
          ' au_fechapro, au_usuapro, au_estado, P_INV.ca_descripcion Prest_Investig, ' +    // TK 22116
          ' region.tb_descripcion RegSanitPrest, art.siniestro.get_descripcionCIE10(ex_id) descCIE10, ' + // TK 26039
          ' art.siniestro.get_establecimiento(ex_cuit, ex_cuil, ex_fechaaccidente) Establecimiento, ' +
          ' art.utiles.armar_domicilio(ud_calle,ud_numero,ud_piso,ud_departamento,ud_localidad) Domic_Denuncia, ' +   // TK 35600
          ' art.protocolo.get_proximocontrol(ex_siniestro, ex_orden, ex_recaida) as fecha_prox_control, ' +  // TK 36363
          ' dcon.el_nombre delcontrato, pe_psiquiatria, pe_fechareconsulta, ex_observaciones ' +
     ' FROM ctb_tablas sect, aco_contrato, del_delegacion dsin, mgp_gtrabajo, cpv_provincias, cpr_prestador P_SIN, aem_empresa,' +
          ' ctj_trabajador, sex_expedientes, cdg_diagnostico, sin.slf_lesionforma, sin.sla_lesionagente,' +
          ' sin.sln_lesionnaturaleza, sin.slz_lesionzona, sin.spe_partedeegreso,  ' +
          ' sin.stt_tipotratamiento, ' +
          ' art.sau_autorizaciones, art.cpr_prestador P_INV,  art.crp_regionesprestador, art.ctb_tablas region, ' +   // TK 22116
          ' SIN.SUD_UBICACIONDENUNCIA, SIN.SDE_DENUNCIA, adc_delegacioncontrato, del_delegacion dcon ' +  // TK 35600
    ' WHERE ex_cuil = tj_cuil' +
      ' AND ex_cuit = em_cuit' +
      ' AND co_idempresa = em_id' +
      ' AND co_contrato = NVL(afiliacion.get_contratovigente(ex_cuit, ex_fechaaccidente),afiliacion.GET_ULTCONTRATO(ex_cuit)) ' +
      ' AND ex_prestador = P_SIN.ca_identificador (+)' +
      ' AND ex_gtrabajo = gp_codigo' +
      ' AND nvl(ex_causafin, ''0'') NOT IN (''99'', ''95'')' +
      ' AND ex_delegacion = dsin.el_id' +
      ' AND pv_codigo(+) = P_SIN.ca_provincia' +
      ' AND dg_codigo(+) = ex_diagnosticooms' +
      ' AND lf_id(+) = ex_idforma' +
      ' AND la_id(+) = ex_idagente' +
      ' AND ln_id(+) = ex_idnaturaleza' +
      ' AND lz_id(+) = ex_idzona' +
      ' AND sect.tb_clave = ''SECT''' +
      ' AND sect.tb_codigo = em_sector ' +
      ' AND ex_id = pe_idexpediente(+) ' +
      ' AND pe_idtipotratamiento = tt_id(+) ' +
      ' AND ex_id = au_idexpediente(+) ' +
      ' AND au_numauto(+) = art.siniestro.Get_NroAutoriz_Invest(ex_id) ' +
      ' AND au_identifapro = P_INV.ca_identificador(+) ' +
      ' AND RP_PRESTADOR(+) = au_identifPrestador ' +   // TK 26039
      ' AND region.tb_clave(+) = ''REGSA'' ' +
      ' AND region.tb_codigo(+) = rp_region ' +
      ' AND rp_domicilio(+) = ''S'' ' +
      ' AND EX_ID = DE_IDEXPEDIENTE (+) ' +   // TK 35600
      ' AND EX_ID = UD_IDEXPEDIENTE (+) ' +
      ' AND tj_id = EX_IDTRABAJADOR ' +
      ' AND ex_contrato = dc_contrato(+) ' +
      ' AND dc_iddelegacion = dcon.el_id(+) ' +
      ' AND actualdate BETWEEN dc_fecha_desde(+) AND NVL(dc_fecha_hasta(+), SYSDATE + 2) ';

   if ValorSql('SELECT count(*)' +
                ' FROM cae_accesoempresa' +
               ' WHERE ae_usuario = ' + SqlValue(Sesion.UserID)) > 0 then
   begin
    SqlWhere := SqlWhere +
      ' AND ex_cuit IN (SELECT ae_cuit' +
                        ' FROM cae_accesoempresa' +
                       ' WHERE ae_usuario = ' + SqlValue(Sesion.UserID) + ')';
   end;

   if chkPostAlta.Checked then
   begin
     Sql := Sql + ' AND tt_postalta = ''S'' ';
     sFiltros := sFiltros + ' - Post Alta';
   end;

   if chkComMed.Checked then
   begin
     Sql := Sql + ' AND art.inca.is_dictamencommed(ex_siniestro, ex_orden) = ''S'' ';
     sFiltros := sFiltros + ' - Comisión medica';
   end;

   if fraRegionSanitaria.IsSelected then     // TK 26039
   begin
     Sql := Sql + ' AND rp_region = ' + SqlValue(fraRegionSanitaria.Codigo);
     sFiltros := sFiltros + ' - Región Sanitaria del Prest.: ' + fraRegionSanitaria.Descripcion;
   end;

   if chkDelegacionContrato.Checked then
   begin
     Sql := Sql + ' AND '''' || dcon.el_id = ' + SqlValue(edDelegacionContrato.Text);
     sFiltros := sFiltros + ' - Delegación contrato: ' + edDelegacionContrato.Text;
   end;

   Sql := Sql + SqlWhere + SortDialog.OrderBy;
   OpenQuery(sdqDatos, Sql, True);

   CalcTotales;
   mnuResumenSiniestros.Enabled := not fraEmpresa.IsEmpty;
end;

procedure TfrmConsSin.tbDetallesClick(Sender: TObject);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then   
    with TfrmDatosSiniestro.Create(Self) do
    try
      ShowDialog(Self.sdqDatos.FieldByName('EX_SINIESTRO').AsInteger,
                 Self.sdqDatos.FieldByName('EX_ORDEN').AsInteger,
                 Self.sdqDatos.FieldByName('EX_RECAIDA').AsInteger);  // ¡¡ No Sacar el Self !!
    finally
      Free;
    end;
end;

procedure TfrmConsSin.tbLimpiarClick(Sender: TObject);
begin
  chkNumero.Checked             := False;
  chkNumeroClick(nil);

  chkCIE10.Checked              := False;
  chkCIE10Click(nil);

  chkFechaAcci.Checked          := False;
  chkFechaAcciClick(nil);

  chkFechaReca.Checked          := False;
  chkFechaRecaClick(nil);

  chkFechaAlta.Checked          := False;
  chkFechaAltaClick(nil);

  chkFechaReasignacion.Checked  := False;
  chkFechaReasignacionClick(nil);

  chkPrestador.Checked          := False;
  chkPrestadorClick(nil);

  chkEstado.Checked             := False;
  chkEstadoClick(nil);

  chkGTrabajo.Checked           := False;
  chkGTrabajoClick(nil);

  chkTipoAccidente.Checked      := False;
  chkTipoAccidenteClick(nil);

  chkGravedad.Checked           := False;
  chkGravedadClick(nil);

  chkEmpresa.Checked            := False;
  chkEmpresaClick(nil);

  chkTrabajador.Checked         := False;
  chkTrabajadorClick(nil);

  chkDelegacion.Checked         := False;
  chkDelegacionClick(nil);

  chkEEPP.Checked               := False;
  chkEEPPClick(nil);

  chkRegSanitPrestador.Checked  := False;     // TK 26039
  fraRegionSanitaria.Clear;

  chkSectorEmpr.Checked         := False;
  chkSectorEmprClick(nil);

  chkSinMixSerologico.Checked   := False;
  chkSinMixOdontologico.Checked := False;

  tbEnfProfesional.Down         := False;
  chkSRT.Checked                := False;
  chkReq.Checked                := False;
  chkPostAlta.Checked           := False;
  chkRemis.Checked              := False;
  chkGSueldos.Checked           := False;
  chkComMed.Checked             := False;
  chkEstadoCron.Checked         := False;
  chkInvestAdmin.Checked        := False;     // TK 22116
  chkIntercurrencia.Checked     := False;     // TK 57097
  chkPsiquiatria.Checked        := False;

  fraUsuariosPorPrest.Clear;
  cbPrestSinAsignar.Checked     := false;

  sdqDatos.Close;
end;

procedure TfrmConsSin.tbOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
end;

procedure TfrmConsSin.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsSin.tbMaxRegistrosClick(Sender: TObject);
begin
  if tbMaxRegistros.Down then
  begin
    tbMaxRegistros.Tag  := InputBoxInteger('Limitar el Máximo de Registros por Consulta', 'Ingrese la cantidad máxima de registros que traerá la consulta.', 50);
    tbMaxRegistros.Down := tbMaxRegistros.Tag > 0;
  end;
end;

procedure TfrmConsSin.tbOcultarMostrarClick(Sender: TObject);
begin
  if tbOcultarMostrar.Down then
  begin
    pcFiltros.Visible     := False;
    tbOcultarMostrar.Hint := 'Mostrar Filtros';
    tbOcultarMostrar.ImageIndex := 17;
  end
  else begin
    pcFiltros.Visible     := True;
    tbOcultarMostrar.Hint := 'Ocultar Filtros';
    tbOcultarMostrar.ImageIndex := 18;
  end;
end;

procedure TfrmConsSin.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsSin.tbExportarClick(Sender: TObject);
begin
  ExportDialog.Fields[62].Save := Seguridad.Claves.IsActive('VerColumnaJuicio');  // TK 15887
  ExportDialog.Execute;
end;

procedure TfrmConsSin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmConsSin.chkCIE10Click(Sender: TObject);
begin
  if chkCIE10.Checked then
  begin
    pnlCIE10.Enabled := True;
    fraCIE10.edCodigo.SetFocus;
  end
  else begin
    pnlCIE10.Enabled := False;
    fraCIE10.Limpiar;
  end;
end;

procedure TfrmConsSin.chkGTrabajoClick(Sender: TObject);
begin
  if chkGTrabajo.Checked then
  begin
    pnlGTrabajo.Enabled := True;
    fraGrupoTrabajo.cmbDescripcion.SetFocus;
    fraGrupoTrabajo.cmbDescripcion.DoDropDown;
  end
  else begin
    pnlGTrabajo.Enabled := False;
    fraGrupoTrabajo.Clear;
  end;

end;

procedure TfrmConsSin.chkTipoAccidenteClick(Sender: TObject);
begin
  if chkTipoAccidente.Checked then
  begin
    pnlTipoAccidente.Enabled := True;
    cmbTipoAccidente.SetFocus;
    cmbTipoAccidente.DoDropDown;
    edTipoAccidente.Enabled  := True;
  end
  else begin
    pnlTipoAccidente.Enabled    := False;
    cmbTipoAccidente.FieldValue := '';
    edTipoAccidente.Enabled     := False;
    edTipoAccidente.Text        := '';
  end;
end;

procedure TfrmConsSin.chkGravedadClick(Sender: TObject);
begin
  if chkGravedad.Checked then
  begin
    pnlGravedad.Enabled := True;
    cmbGravedad.SetFocus;
    cmbGravedad.DoDropDown;
    edGravedad.Enabled  := True;
  end
  else begin
    pnlGravedad.Enabled    := False;
    cmbGravedad.FieldValue := '';
    edGravedad.Enabled     := False;
    edGravedad.Text        := '';
  end;
end;

procedure TfrmConsSin.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  SqlCtbTipo := ''; // Cuando haga por primera vez una consulta se cargaranco en el Decode de la CTB_TABLAS
  SqlCtbGrav := '';
  for i := 0 to dbgListado.Columns.Count - 1 do
    if (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTELIQUIDADOILT']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTELIQUIDADOILP']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTECONCEPTOS']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTEPRESTMEDICAS']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTELIQUIDADOMORT']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['PORCENTLIQUIDADO']) > -1) then
    begin
      QueryPrint.FieldByName[dbgListado.Columns[i].FieldName].Visible := tbOcultarColumnasEmp.Down;
      ExportDialog.FieldbyName[dbgListado.Columns[i].FieldName].Save  := tbOcultarColumnasEmp.Down;
      dbgListado.Columns[i].Visible := tbOcultarColumnasEmp.Down;
      if tbOcultarColumnasEmp.Down and (dbgListado.Columns[i].Width > 300) then
        dbgListado.Columns[i].Width := 300;
    end;

  fraSectorEmpr.Clave := 'SECT';

  OpenQuery(sdqDelegacion);
  OpenQuery(sdqTipoAccidente);
  OpenQuery(sdqGravedad);

  tbOcultarColumnasClick(nil); // Oculta las columnas que no tiene que mostrar

  with QueryPrint.Title.Logo do
  begin
    Picture.Assign(frmPrincipal.imgLogo.Picture);
    Height := frmPrincipal.imgLogo.Picture.Height * 4;
    Width  := frmPrincipal.imgLogo.Picture.Width * 5;
  end;
  pcFiltros.ActivePageIndex := 0;
  tbMortales.Enabled := Seguridad.Claves.IsActive('VerInfoMortales');
  dbgListado.ColumnByField['JUICIO'].Visible := Seguridad.Claves.IsActive('VerColumnaJuicio');   // TK 15689

  fraEmpresa.Tercerizadoras       := EsUsuarioDeTercerizadora;
  fraTrabajadorSIN.Tercerizadoras := fraEmpresa.Tercerizadoras;

  with fraRegionSanitaria do  // TK 26039
  begin
    Clave     := 'REGSA';
    ShowBajas := True;
  end;

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

end;

procedure TfrmConsSin.chkNumeroClick(Sender: TObject);
begin
  if chkNumero.Checked then
  begin
    pnlSiniestro.Enabled := True;
    edNumDesde.SetFocus;
  end
  else begin
    pnlSiniestro.Enabled := False;
    edNumDesde.Text := '';
    edNumHasta.Text := '';
  end;
end;

procedure TfrmConsSin.dbgListadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                              Highlight: Boolean);
begin
  if Assigned(Field) and (Field.FieldName = 'PRESTADORSIN') and
     (not sdqDatos.FieldByName('CA_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmConsSin.chkPrestadorClick(Sender: TObject);
begin
  if chkPrestador.Checked then
  begin
    pnlPrestador.Enabled := True;
    fraPrestador.IDPrestadorFocus;
  end
  else begin
    pnlPrestador.Enabled := False;
    fraPrestador.Limpiar;
  end;
end;

procedure TfrmConsSin.chkEmpresaClick(Sender: TObject);
begin
  if chkEmpresa.Checked then
  begin
    pnlEmpresa.Enabled := True;
    fraEmpresa.mskCUIT.SetFocus;
  end
  else begin
    pnlEmpresa.Enabled := False;
    fraEmpresa.Clear;
  end;
end;

procedure TfrmConsSin.chkTrabajadorClick(Sender: TObject);
begin
  if chkTrabajador.Checked then
  begin
    pnlTrabajador.Enabled := True;
    fraTrabajadorSIN.mskTrabCUIL.SetFocus;
  end
  else begin
    pnlTrabajador.Enabled := False;
    fraTrabajadorSIN.Limpiar;
  end;
end;

procedure TfrmConsSin.chkFechaAltaClick(Sender: TObject);
begin
  if chkFechaAlta.Checked then
  begin
    pnlFechaAlta.Enabled := True;
    deFechaAltaDesde.SetFocus;
  end
  else begin
    pnlFechaAlta.Enabled  := False;
    deFechaAltaDesde.Date := 0;
    deFechaAltaHasta.Date := 0;
  end;
end;

procedure TfrmConsSin.chkFechaReasignacionClick(Sender: TObject);
begin
  if chkFechaReasignacion.Checked then
  begin
    pnlFechaReasignacion.Enabled := True;
    deFechaReasigDesde.SetFocus;
  end
  else begin
    pnlFechaReasignacion.Enabled  := False;
    deFechaReasigDesde.Date       := 0;
    deFechaReasigHasta.Date       := 0;
  end;
end;

procedure TfrmConsSin.chkEstadoClick(Sender: TObject);
begin
  if chkEstado.Checked then
  begin
    pnlEstado.Enabled     := True;
    cmbEstado.ItemIndex   := 0;
    cmbEstado.DroppedDown := True;
  end
  else begin
    pnlEstado.Enabled     := False;
    cmbEstado.ItemIndex   := -1;
  end;
end;

procedure TfrmConsSin.chkFechaAcciClick(Sender: TObject);
begin
  if chkFechaAcci.Checked then
  begin
    pnlFechaAcci.Enabled := True;
    deFechaAcciDesde.SetFocus;
  end
  else begin
    pnlFechaAcci.Enabled  := False;
    deFechaAcciDesde.Date := 0;
    deFechaAcciHasta.Date := 0;
  end;
end;

procedure TfrmConsSin.chkGestAudClick(Sender: TObject);   // Lu WF 7781: lo hice con panel y checkbox porque sino quedaba distinto a los demas visualmente.
begin
  if chkGestAud.Checked then
  begin
    pnlGestAud.Enabled := True;
    deGestAudDesde.SetFocus;
  end
  else begin
    pnlGestAud.Enabled  := False;
    deGestAudDesde.Date := 0;
    deGestAudHasta.Date := 0;
  end;
end;

procedure TfrmConsSin.chkFechaRecaClick(Sender: TObject);
begin
  if chkFechaReca.Checked then
  begin
    pnlFechaReca.Enabled := True;
    deFechaRecaDesde.SetFocus;
  end
  else begin
    pnlFechaReca.Enabled := False;
    deFechaRecaDesde.Date := 0;
    deFechaRecaHasta.Date := 0;
  end;
end;

procedure TfrmConsSin.chkDelegacionClick(Sender: TObject);
begin
  if chkDelegacion.Checked then
  begin
    pnlDelegacion.Enabled := True;
    cmbDelegacion.SetFocus;
    cmbDelegacion.DoDropDown;
  end
  else begin
    pnlDelegacion.Enabled := False;
    cmbDelegacion.FieldValue := '';
    edDelegacion.Text := ''
  end;
end;

procedure TfrmConsSin.MakeSubTitle;
const
  STAB = #9;
begin
  with QueryPrint.SubTitle.Lines do
  begin
    Clear;
    Add('Filtros:');
    //---------------------------------------------------------------------------------------------------------------//
    if chkNumero.Checked then
      if (edNumDesde.Text <> '') and (edNumHasta.Text <> '') then
        Add(STAB + 'Siniestros entre ' + edNumDesde.TextSql + ' y ' + edNumHasta.TextSql)
      else if (edNumDesde.Text <> '') then
        Add(STAB + 'Siniestros mayores a ' + edNumDesde.TextSql)
      else if (edNumHasta.Text <> '') then
        Add(STAB + 'Siniestros menores a ' + edNumHasta.TextSql);
    //---------------------------------------------------------------------------------------------------------------//
    if chkCIE10.Checked then
      if fraCIE10.edCodigo.Text <> '' then
        Add(STAB + 'CIE10: ' + fraCIE10.cmbDescripcion.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkFechaAcci.Checked then
      if (deFechaAccidesde.Text <> '') and (deFechaAcciHasta.Text <> '') then
        Add(STAB + 'Fecha de Accidente entre ' + deFechaAccidesde.Text + ' y ' + deFechaAcciHasta.Text)
      else if (deFechaAcciDesde.Text <> '') then
        Add(STAB + 'Fecha de Accidente mayores a ' + deFechaAcciDesde.Text)
      else if (deFechaAcciHasta.Text <> '') then
        Add(STAB + 'Fecha de Accidente menores a ' + deFechaAcciHasta.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkFechaReca.Checked then
      if (deFechaRecaDesde.Text <> '') and (deFechaRecaHasta.Text <> '') then
        Add(STAB + 'Fecha de Recaida entre ' + deFechaRecaDesde.Text + ' y ' + deFechaRecaHasta.Text)
      else if (deFechaRecaDesde.Text <> '') then
        Add(STAB + 'Fecha de Recaida mayores a ' + deFechaRecaDesde.Text)
      else if (deFechaRecaHasta.Text <> '') then
        Add(STAB + 'Fecha de Recaida menores a ' + deFechaRecaHasta.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkFechaAlta.Checked then
      if (deFechaAltaDesde.Text <> '') and (deFechaAltaHasta.Text <> '') then
        Add(STAB + 'Fecha de Carga entre ' + deFechaAltaDesde.Text + ' y ' + deFechaAltaHasta.Text)
      else if (deFechaAltaDesde.Text <> '') then
        Add(STAB + 'Fecha de Carga mayores a ' + deFechaAltaDesde.Text)
      else if (deFechaAltaHasta.Text <> '') then
        Add(STAB + 'Fecha de Carga menores a ' + deFechaAltaHasta.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkEEPP.Checked then
      if (deFechaEEPPDesde.Text <> '') and (deFechaEEPPHasta.Text <> '') then
        Add(STAB + 'Fecha de posible enf. prof. entre ' + deFechaEEPPDesde.Text + ' y ' + deFechaEEPPHasta.Text)
      else if (deFechaEEPPDesde.Text <> '') then
        Add(STAB + 'Fecha de posible enf. prof. mayores a ' + deFechaEEPPDesde.Text)
      else if (deFechaEEPPHasta.Text <> '') then
        Add(STAB + 'Fecha de posible enf. prof. menores a ' + deFechaEEPPHasta.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if (fraPrestador.IDPrestador <> 0) then
      Add(STAB + 'Prestador ' + fraPrestador.RazonSocial);
    //---------------------------------------------------------------------------------------------------------------//
    if chkEstado.Checked  then
      Add(STAB + 'Estado ' + cmbEstado.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkGTrabajo.Checked then
      Add(STAB + 'Grupo de Trabajo ' + fraGrupoTrabajo.cmbDescripcion.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if (fraEmpresa.IsSelected) then
      Add(STAB + 'Empresa ' + fraEmpresa.RazonSocial);
    //---------------------------------------------------------------------------------------------------------------//
    if (fraTrabajadorSIN.mskTrabCUIL.Text <> '') then
      Add(STAB + 'Trabajador ' + fraTrabajadorSIN.dbcTrabNombre.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkDelegacion.Checked then
      Add(STAB + 'Delegación ' + cmbDelegacion.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkTipoAccidente.Checked then
      Add(STAB + 'Tipo de Accidente ' + cmbTipoAccidente.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkGravedad.Checked then
      Add(STAB + 'Gravedad ' + cmbGravedad.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkSRT.Checked then
      Add(STAB + 'SRT');
    //---------------------------------------------------------------------------------------------------------------//
    if chkReq.Checked then
      Add(STAB + 'Req.');
    //---------------------------------------------------------------------------------------------------------------//
    if chkPostAlta.Checked then
      Add(STAB + 'Post Alta');
    //---------------------------------------------------------------------------------------------------------------//
    if chkGSueldos.Checked then
      Add(STAB + 'Grandes sueldos');
    //---------------------------------------------------------------------------------------------------------------//
    if chkComMed.Checked then
      Add(STAB + 'Comisión medica');
    //---------------------------------------------------------------------------------------------------------------//
    if chkInvestAdmin.Checked then            // TK 22116
      Add(STAB + 'Investigación Administrativa');
    //---------------------------------------------------------------------------------------------------------------//
    if chkIntercurrencia.Checked then         // TK 57097
      Add(STAB + 'Intercurrencia');
    //---------------------------------------------------------------------------------------------------------------//
    if chkPsiquiatria.Checked then
      Add(STAB + 'Psiquiatría');
    //---------------------------------------------------------------------------------------------------------------//
    if fraSectorEmpr.IsSelected then
      Add(STAB + 'Sector Empr. ' + fraSectorEmpr.cmbDescripcion.Text);
    //---------------------------------------------------------------------------------------------------------------//
    if chkRemis.Checked then
      Add(STAB + 'Amerita remis: ' + IIF(rbSiRemis.Checked, 'Si', 'No'));
    //---------------------------------------------------------------------------------------------------------------//      
    if chkRegSanitPrestador.Checked then
      Add(STAB + 'Región Sanitaria Prestador: ' + fraRegionSanitaria.Descripcion);
  end; // del with
end;
{---------------------------------------------------------------------------------------------}
procedure TfrmConsSin.dbgListadoPaintFooter(Sender: TObject;Column: String; var Value: String;
                                            var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  iPos := ArrayPos(Column, ColTotales);
  if (iPos > -1) and (iPos <= High(Totales)) then
    Value := Totales[iPos];
end;

procedure TfrmConsSin.tbTotalesClick(Sender: TObject);
begin
  dbgListado.FooterBand := tbTotales.Down;

  if tbTotales.Down and sdqDatos.Active and (High(Totales) = -1) then
    CalcTotales;
end;

procedure TfrmConsSin.CalcTotales;
var
  Sql: String;
begin
  if tbTotales.Down then
  try
    Sql :=
      'SELECT count(*), sum(liq.get_importeliquidadoilp(ex_siniestro, ex_orden, ex_recaida)) ImporteLiquidadoILP,' +
            ' sum(liq.get_importeliquidadomortales(ex_siniestro, ex_orden, ex_recaida)) ImporteLiquidadoMort,' +
            ' sum(liq.get_importeconceptos(ex_siniestro, ex_orden, ex_recaida)) ImporteConceptos,' +
            ' sum(amebpba.get_importeprestmedicas(ex_siniestro, ex_orden, ex_recaida)) ImportePrestMedicas' +
       ' FROM aem_empresa, sex_expedientes' +
      ' WHERE NVL(ex_causafin, ''0'') <> ''99''' +
        ' AND ex_cuit = em_cuit';
    DynArrayColSql(Sql + SqlWhere, Totales);
  except
    on E: Exception do
      ErrorMsg(E, 'Error al Calcular los Subtotales.');
  end
  else
    SetLength(Totales, 0);
end;

procedure TfrmConsSin.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
var
  iPos: Integer;
begin
  iPos := ArrayPos(Field.DataField, ColTotales);
  if (iPos > -1) and (iPos <= High(Totales)) then
    Value := Totales[iPos];
end;

{----[Delegación siniestro]-----------------------------------------------------------------------------}
procedure TfrmConsSin.edDelegacionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cmbDelegacion.FieldValue := edDelegacion.Text;
end;

procedure TfrmConsSin.cmbDelegacionCloseUp(Sender: TObject);
begin
  if (Trim(cmbDelegacion.Text) <> '') then
    edDelegacion.Text := cmbDelegacion.FieldValue;
end;

procedure TfrmConsSin.cmbDelegacionChange(Sender: TObject);
begin
  if Trim(cmbDelegacion.Text) = '' then
    edDelegacion.Text := '';
end;

{----[Delegación contrato]-----------------------------------------------------------------------------}
procedure TfrmConsSin.edDelegacionContratoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cmbDelegacionContrato.FieldValue := edDelegacionContrato.Text;
end;

procedure TfrmConsSin.cmbDelegacionContratoCloseUp(Sender: TObject);
begin
  if (Trim(cmbDelegacionContrato.Text) <> '') then
    edDelegacionContrato.Text := cmbDelegacionContrato.FieldValue;
end;

procedure TfrmConsSin.cmbDelegacionContratoChange(Sender: TObject);
begin
  if Trim(cmbDelegacionContrato.Text) = '' then
    edDelegacionContrato.Text := '';
end;

{----[Tipo Accidente]-------------------------------------------------------------------------}
procedure TfrmConsSin.edTipoAccidenteKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    cmbTipoAccidente.FieldValue := edTipoAccidente.Text;
end;

procedure TfrmConsSin.cmbTipoAccidenteChange(Sender: TObject);
begin
  if Trim(cmbTipoAccidente.Text) = '' then
    edTipoAccidente.Text := '';
end;

procedure TfrmConsSin.cmbTipoAccidenteCloseUp(Sender: TObject);
begin
  if (Trim(cmbTipoAccidente.Text) <> '') then
    edTipoAccidente.Text := cmbTipoAccidente.FieldValue;
end;

{----[Gravedad]-------------------------------------------------------------------------------}
procedure TfrmConsSin.edGravedadKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    cmbGravedad.FieldValue := edGravedad.Text;
end;

procedure TfrmConsSin.cmbGravedadChange(Sender: TObject);
begin
  if Trim(cmbGravedad.Text) = '' then
    edGravedad.Text := '';
end;

procedure TfrmConsSin.cmbGravedadCloseUp(Sender: TObject);
begin
  if (Trim(cmbGravedad.Text) <> '') then
    edGravedad.Text := cmbGravedad.FieldValue;
end;

procedure TfrmConsSin.tbOcultarColumnasClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to dbgListado.Columns.Count - 1 do
    if (ArrayPos(dbgListado.Columns[i].FieldName, ['DIASCAIDOS']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['EX_ALTAMEDICA']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['POR_INCA']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['EVE_INCA']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['FEC_INCA']) > -1) then
    begin
      QueryPrint.FieldByName[dbgListado.Columns[i].FieldName].Visible := tbOcultarColumnas.Down;
      ExportDialog.FieldbyName[dbgListado.Columns[i].FieldName].Save  := tbOcultarColumnas.Down;
      dbgListado.Columns[i].Visible := tbOcultarColumnas.Down;
      if tbOcultarColumnas.Down and (dbgListado.Columns[i].Width > 300) then
        dbgListado.Columns[i].Width := 300;
    end;
end;

procedure TfrmConsSin.tbCostosClick(Sender: TObject);
var
  frmCostos :TfrmCostosxSiniestro;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then
  begin
    frmCostos:= TfrmCostosxSiniestro.Create(Self);
    frmCostos.edSOR.SiniestroS := sdqDatos.FieldByName('Ex_Siniestro').AsString;
    frmCostos.edSOR.OrdenS     := sdqDatos.FieldByName('Ex_Orden').AsString;
    frmCostos.edSOR.RecaidaS   := sdqDatos.FieldByName('Ex_Recaida').AsString;
    frmCostos.tbRefrescar.Click;
    frmCostos.show;
  end;
end;

procedure TfrmConsSin.tbOcultarColumnasEmpClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to dbgListado.Columns.Count - 1 do
    if (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTELIQUIDADOILT']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTELIQUIDADOILP']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTECONCEPTOS']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTEPRESTMEDICAS']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['IMPORTELIQUIDADOMORT']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['PORCENTLIQUIDADO']) > -1) then
    begin
      QueryPrint.FieldByName[dbgListado.Columns[i].FieldName].Visible := tbOcultarColumnasEmp.Down;
      ExportDialog.FieldbyName[dbgListado.Columns[i].FieldName].Save  := tbOcultarColumnasEmp.Down;
      dbgListado.Columns[i].Visible := tbOcultarColumnasEmp.Down;
      if tbOcultarColumnasEmp.Down and (dbgListado.Columns[i].Width > 300) then
        dbgListado.Columns[i].Width := 300;
    end;
end;

procedure TfrmConsSin.tbMortalesClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to dbgListado.Columns.Count - 1 do
    if (ArrayPos(dbgListado.Columns[i].FieldName, ['POSRECUPERO']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['ANTICIPO']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['DEFINITIVO']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['PAGOUNICO']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['BENEFDEFI']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['SEPELIO']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['FLIQSEPELIO']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['BENEFSEPELIO']) > -1) or
       (ArrayPos(dbgListado.Columns[i].FieldName, ['DENUNCIASRT']) > -1) then
    begin
      ExportDialog.FieldbyName[dbgListado.Columns[i].FieldName].Save  := tbMortales.Down;
      dbgListado.Columns[i].Visible := tbMortales.Down;
      if tbMortales.Down and (dbgListado.Columns[i].Width > 150) then
        dbgListado.Columns[i].Width := 150;
    end;
end;

procedure TfrmConsSin.mnuListadoClick(Sender: TObject);
begin
  if PrintDialog.Execute then
  try
    tbImprimir.Enabled     := False;
    QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
    MakeSubTitle;
    QueryPrint.Print;
  finally
    tbImprimir.Enabled := True;
  end;
end;

procedure TfrmConsSin.mnuResumenSiniestrosClick(Sender: TObject);
begin
  qrlEmpresa.Caption := fraEmpresa.RazonSocial;
  qrlSeleccion.Caption := Copy(sFiltros, 3, Length(sFiltros)) + '.';
  qrResumenSiniestros.PreviewModal;
end;

procedure TfrmConsSin.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  tbEnfProfesional.Enabled := Seguridad.Activar(tbEnfProfesional) and
                             (DataSet.FieldByName('ISEMPFONDO').AsString = 'S') and
                             (DataSet.FieldByName('TIPOSIN').AsString <> '2');
  tbEnfProfesional.Down    := (DataSet.FieldByName('EX_POSIBLEEEPP').AsString = 'S');

  tbPasoRegionalizacion.Enabled := Seguridad.Activar(tbPasoRegionalizacion) and
                                   (DataSet.FieldByName('ex_liberatrabajo').AsString = 'N') and
                                   (DataSet.FieldByName('ex_gtrabajo').AsString = '78') and
                                   (DataSet.FieldByName('ex_gravedad').AsString = '1');       
end;

procedure TfrmConsSin.tbEnfProfesionalClick(Sender: TObject);
var
  sSql, sValor, sMens :String;
begin
  if IsRegistroEPValido then
  begin
    if tbEnfProfesional.Down then
    begin
      sValor := 'S';
      sMens  := 'agregada';
    end
    else begin
      sValor := 'N';
      sMens  := 'quitada';
    end;
    sSql := 'UPDATE sex_expedientes' +
              ' SET ex_posibleeepp = ' + SqlValue(sValor) + ',' +
                  ' ex_usuposibleeepp = :USUARIO,' +
                  ' ex_fechaposibleeepp = ActualDate' +
            ' WHERE ex_id = :IDEXP';
    EjecutarSqlEx(sSql, [Sesion.UserID, sdqDatos.FieldByName('EX_ID').AsInteger]);
    MsgBox('Marca ' + sMens + ' correctamente.', MB_ICONINFORMATION);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmConsSin.chkEEPPClick(Sender: TObject);
begin
  if chkEEPP.Checked then
  begin
    pnlEEPP.Enabled := True;
    deFechaEEPPDesde.SetFocus;
  end
  else begin
    pnlEEPP.Enabled := False;
    deFechaEEPPDesde.Date := 0;
    deFechaEEPPHasta.Date := 0;
  end;
end;

procedure TfrmConsSin.chkSectorEmprClick(Sender: TObject);
begin
  if chkSectorEmpr.Checked then
  begin
    pnlSectorEmpr.Enabled := True;
    fraSectorEmpr.edCodigo.SetFocus;
  end
  else begin
    pnlSectorEmpr.Enabled := False;
    fraSectorEmpr.Clear;
  end;
end;

procedure TfrmConsSin.tbPasoRegionalizacionClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and MsgAsk('¿Confirma el Paso de Regionalización?') then
  begin
    sSql :=
      'UPDATE sex_expedientes' +
        ' SET ex_liberatrabajo = ''S'',' +
            ' ex_usuliberatrabajo = :usuario,' +
            ' ex_fechaliberatrabajo = actualdate' +
      ' WHERE ex_id = :idexp';
    EjecutarSqlEx(sSql, [Sesion.UserID, sdqDatos.FieldByName('EX_ID').AsInteger]);

    EjecutarStoreEx('art.siniestro.set_gtrabajo(:v1);', [sdqDatos.FieldByName('EX_ID').AsInteger]);

    MsgBox('Acción realizada correctamente', MB_ICONINFORMATION);
    tbRefrescarClick(nil);
  end
end;

// Lu WF 7341
procedure TfrmConsSin.tbModifDatosSinClick(Sender: TObject);
var sSql:string;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then
  begin
    Inicializa_fpDatosSiniestro;
    if fpDatosSiniestro.ShowModal = mrOk then
    begin
      try
        sSql := 'UPDATE sex_expedientes ' +
                  ' SET ex_sinmixserol = ' + SqlString(IIF(chkSerologico.Checked, 'S', 'N'), True) +
                     ' ,ex_sinmixodont = ' + SqlString(IIF(chkOdontologico.Checked, 'S', 'N'), True);

        if (dcGestAud.Date <> 0) then
          sSql := sSql + ' ,ex_fechaGestAud = ' + dcGestAud.SqlText + 
                         ' ,ex_usuGestAud = ' + SqlString(Seguridad.DBLogin.UserId, True);

        sSql := sSql + ' WHERE ex_id = ' + SqlInt(sdqDatos.FieldByName('ex_id').AsInteger);

        EjecutarSql(sSql);
        tbRefrescarClick(nil);
      except
        on e:exception do
          ErrorMsg(E, 'Ha ocurrido un error al intentar guardar los datos');
      end;
    end;
  end;
end;

// Lu WF 7341
procedure TfrmConsSin.Inicializa_fpDatosSiniestro;
begin
  lblNroSiniestro.Caption := ' Siniestro:  ' + sdqDatos.FieldByName('SINIESTRO').AsString;
  chkSerologico.Checked   := (sdqDatos.FieldByName('EX_SINMIXSEROL').AsString = 'S');
  chkOdontologico.Checked := (sdqDatos.FieldByName('EX_SINMIXODONT').AsString = 'S');
  dcGestAud.Date          := sdqDatos.FieldByName('EX_FECHAGESTAUD').AsDateTime;  // Lu WF 7781
end;

function TfrmConsSin.IsRegistroEPValido :Boolean;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and
    ((sdqDatos.FieldByName('ex_posibleeepp').AsString = 'N') or
     ((sdqDatos.FieldByName('ex_posibleeepp').AsString = 'S') and Seguridad.Claves.IsActive('DesmarcarPosEP'))) and
     MsgAsk('¿Confirma modificar la marca de posible enfermedad profesional al siniestro seleccionado?') then
    Result := True
  else begin
    tbEnfProfesional.Down := not tbEnfProfesional.Down; //lo vuelvo al estado anterior
    Result                := False;
  end;
end;

procedure TfrmConsSin.chkRemisClick(Sender: TObject);
begin
  if chkRemis.Checked then
  begin
    pnlRemis.Enabled  := True;
    rbSiRemis.Checked := True;
  end
  else begin
    pnlRemis.Enabled  := False;
    rbSiRemis.Checked := False;
    rbNoRemis.Checked := False;
  end;
end;

procedure TfrmConsSin.chkEstadoCronClick(Sender: TObject);
begin
  if chkEstadoCron.Checked then
  begin
    pnlEstadoCron.Enabled := True;
    rbActivoCron.Checked  := True;
  end
  else begin
    pnlEstadoCron.Enabled   := False;
    rbActivoCron.Checked    := False;
    rbSinACron.Checked      := False;
    rbInactivoCron.Checked  := False;
  end;
end;

procedure TfrmConsSin.chkRegSanitPrestadorClick(Sender: TObject);
begin
  if not chkRegSanitPrestador.checked then
    fraRegionSanitaria.Enabled := True
  else begin
    fraRegionSanitaria.Enabled := False;
    fraRegionSanitaria.Clear;
  end;

end;

procedure TfrmConsSin.tbHistGTrabajoClick(Sender: TObject);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then
  begin
    sdqhgtrabajo.Close;
    sdqhgtrabajo.ParamByName('sin').AsString := sdqDatos.fieldbyname('ex_siniestro').AsString;
    sdqhgtrabajo.ParamByName('ord').AsString := sdqDatos.fieldbyname('ex_orden').AsString;
    sdqhgtrabajo.ParamByName('rec').AsString := sdqDatos.fieldbyname('ex_recaida').AsString;
    sdqhgtrabajo.Open;
    fpHistGT.ShowModal;
  end;
end;

procedure TfrmConsSin.chkDelegacionContratoClick(Sender: TObject);
begin
  if chkDelegacionContrato.Checked then
  begin
    pnlDelegacionContrato.Enabled := True;
    cmbDelegacionContrato.SetFocus;
    cmbDelegacionContrato.DoDropDown;
  end
  else begin
    pnlDelegacionContrato.Enabled := False;
    cmbDelegacionContrato.FieldValue := '';
    edDelegacionContrato.Text := ''
  end;

end;

procedure TfrmConsSin.cbPrestSinAsignarClick(Sender: TObject);
begin
  if cbPrestSinAsignar.Checked = true then
  begin
    fraUsuariosPorPrest.Clear;
    LockControl(fraUsuariosPorPrest, true);
  end
  else
    LockControl(fraUsuariosPorPrest, false);

end;

end.
