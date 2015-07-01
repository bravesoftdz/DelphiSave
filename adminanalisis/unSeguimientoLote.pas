{-----------------------------------------------------------------------------
 Unit Name: unSeguimientoLote
 Author:    racastro
 Date:      01-Jun-2007
 Purpose:   Seguimiento de Lotes de Estudios
 History:
-----------------------------------------------------------------------------}

unit unSeguimientoLote;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraEstudio, StdCtrls, Mask, ToolEdit, DateComboBox, CustomDlgs,
  unFraCodigoDescripcion, General, unfraEstablecimiento_OLD, unArtFrame,
  unArtDbFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unSesion,
  JvgGroupBox, FormPanel, unfraPrestadorAMPCuit, ExComboBox, PatternEdit,
  IntEdit, FSPageControl, Menus, unFraEmpresa, Buttons, unFraRiesgo,
  JvExMask, JvToolEdit, JvDBLookup, JvExControls, JvComponent, unFraCodDesc,
  GroupCheckBox, CheckLst, DateTimeFuncs, ARTCheckListBox, unExportPDF,
  QRExport, unArt, unComunes, JvCombobox, ComboEditor, CheckCombo,
  JvExExtCtrls, JvNetscapeSplitter, DateUtils, unComunesAMP, unGrids,
  RxToolEdit, RxPlacemnt;

type
  TfrmSeguimientoLote = class(TfrmCustomConsulta)
    sdqTrabajadores: TSDQuery;
    dsTrabajadores: TDataSource;
    ordTrabajadores: TSortDialog;
    sdqDatosPQ: TSDQuery;
    fpDatosLote: TFormPanel;
    Bevel7: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label2: TLabel;
    cbEstado: TExComboBox;
    pcDatosEstado: TFSPageControl;
    tsAprobacion: TTabSheet;
    tsRechazo: TTabSheet;
    Label4: TLabel;
    edFechaAprobado: TDateComboBox;
    Label3: TLabel;
    edFechaRechazo: TDateComboBox;
    Label5: TLabel;
    fpTrabajador: TFormPanel;
    ToolBar1: TToolBar;
    tbManTrab: TToolButton;
    sdqTrabActivos: TSDQuery;
    dsTrabActivos: TDataSource;
    tbAgregarTrab: TToolButton;
    tbSalirAgregarTrab: TToolButton;
    ToolButton1: TToolButton;
    tbOrdenarTrabAct: TToolButton;
    ordTrabActivos: TSortDialog;
    sdqEstudiosRiesgo: TSDQuery;
    sdqRiesgos: TSDQuery;
    dsRiesgos: TDataSource;
    Panel1: TPanel;
    tsSelEstudios: TFSPageControl;
    tsSelRiesgos: TTabSheet;
    grdRiesgos: TRxDBGrid;
    TabSheet2: TTabSheet;
    tsSelTrabajador: TTabSheet;
    sdqRiesgosReferencia: TSDQuery;
    fraTrabADuplicar: TfraCodDesc;
    sdqEstudiosPosibles: TSDQuery;
    Label7: TLabel;
    clbListaEstudios: TARTCheckListBox;
    lblNoHayEstudios: TLabel;
    tbNotificar: TToolButton;
    mnuNotificar: TPopupMenu;
    mnuNotificaraPrestador: TMenuItem;
    mnuNotificaraEmpresa: TMenuItem;
    Label8: TLabel;
    edFechaPactada: TDateComboBox;
    edObservaciones: TMemo;
    Observaciones: TLabel;
    Label9: TLabel;
    fpMotivoBaja: TFormPanel;
    Bevel1: TBevel;
    btnAceptarBaja: TButton;
    btnCancelarBaja: TButton;
    Label11: TLabel;
    gbEstablecimientos: TJvgGroupBox;
    dbgEstabLote: TArtDBGrid;
    sdqEmpresaEstab: TSDQuery;
    dsEmpresaEstab: TDataSource;
    gbTrabajadores: TJvgGroupBox;
    dbgTrabajadores: TArtDBGrid;
    tbTrabajadores: TToolBar;
    tbNuevoTrab: TToolButton;
    tbReactTrab: TToolButton;
    tbBajaTrab: TToolButton;
    tbOrdenarTrabLote: TToolButton;
    fraMotivosBaja: TfraCodigoDescripcion;
    fraMotivosRechazo: TfraCodigoDescripcion;
    spbMantRechazo: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar2: TToolBar;
    mnuNotificaraEmpresaMovil: TMenuItem;
    tbCambioEstado: TToolButton;
    tsAnulado: TTabSheet;
    Label13: TLabel;
    edFechaAnulado: TDateComboBox;
    Label14: TLabel;
    fraMotivosAnulacion: TfraCodigoDescripcion;
    spbMantAnulacion: TSpeedButton;
    tsRecibido: TTabSheet;
    Label15: TLabel;
    edFechaRecibido: TDateComboBox;
    tsTerminado: TTabSheet;
    Label16: TLabel;
    edFechaTerminado: TDateComboBox;
    Label17: TLabel;
    fraMotivosTerminacion: TfraCodigoDescripcion;
    SpeedButton1: TSpeedButton;
    tsReprogramacion: TTabSheet;
    Label18: TLabel;
    edFechaReprogramado: TDateComboBox;
    tbHistorico: TToolButton;
    fpHistoricoLote: TFormPanel;
    ArtDBGrid1: TArtDBGrid;
    sdqHistLotes: TSDQuery;
    dsHistLote: TDataSource;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    tbAgendaObsLote: TToolButton;
    tbRefrescarEstab: TToolButton;
    ToolButton10: TToolButton;
    tbAgendaObsSubLote: TToolButton;
    tsRealizadoSinEntregar: TTabSheet;
    Label19: TLabel;
    edFechaNotificacion: TDateComboBox;
    Label21: TLabel;
    ToolButton9: TToolButton;
    Label22: TLabel;
    Label23: TLabel;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    tbCartasDoc: TToolButton;
    mnuCartaDoc: TPopupMenu;
    MenuItem4: TMenuItem;
    mnuCDEmitidas: TMenuItem;
    fpNuevaFPactada: TFormPanel;
    Label24: TLabel;
    edNuevaFPactada: TDateComboBox;
    btnAceptarNuevaFPactada: TButton;
    btnCancelarNuevaFPactada: TButton;
    Bevel2: TBevel;
    tbLotesACerrar: TToolButton;
    sbLotesACerrar: TStatusBar;
    sdqEstados: TSDQuery;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    dbgListado: TDBGrid;
    sdqListado: TSDQuery;
    dsListado: TDataSource;
    sdqTrabajadoresrs_cuil: TStringField;
    sdqTrabajadoresrs_nombretrabajador: TStringField;
    sdqTrabajadoresmb_descripcion: TStringField;
    sdqTrabajadoresdl_fechabaja: TDateTimeField;
    sdqTrabajadoresrt_fecha: TDateTimeField;
    sdqTrabajadoresestudios: TStringField;
    sdqTrabajadoresle_id: TFloatField;
    sdqTrabajadoresdl_idtrabajador: TFloatField;
    sdqTrabajadoresfagregado: TDateTimeField;
    mnuExportar: TPopupMenu;
    mnuResumendeLotes: TMenuItem;
    mnuDetalledeLotes: TMenuItem;
    tbAgendaObsAsigLote: TToolButton;
    pnSeleccionHistorico: TPanel;
    btnAceptarHistorico: TButton;
    btnCancelarHistorico: TButton;
    pnlBottom: TPanel;
    tbCambioDeEstado: TToolButton;
    tbListadoRecepcion: TToolButton;
    tbUnSelectAll: TToolButton;
    tbSelectAll: TToolButton;
    pcFilter: TPageControl;
    tbGeneral: TTabSheet;
    tbFechasPrestador: TTabSheet;
    fraEmpresa: TfraEmpresa;
    lbEstableci: TLabel;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    fraPrestador: TfraPrestadorAMPCuit;
    Label6: TLabel;
    Label1: TLabel;
    edLote: TIntEdit;
    lblEstado: TLabel;
    cbEstadoLoteFiltro: TExComboBox;
    Label20: TLabel;
    cbEstadoSubLoteFiltro: TExComboBox;
    Label25: TLabel;
    edDesdeFCDA: TDateComboBox;
    edHastaFCDA: TDateComboBox;
    Label26: TLabel;
    Label27: TLabel;
    edFechaNotifPrestDesde: TDateComboBox;
    Label28: TLabel;
    edFechaNotifPrestHasta: TDateComboBox;
    fpNotificacionEmpresa: TFormPanel;
    Button1: TButton;
    Button2: TButton;
    rgTipoEnvio: TRadioGroup;
    lblModoNotificacionFechaNueva: TLabel;
    lblModoSeleccionadoNuevaFecha: TLabel;
    btnModoNotifNuevaFecha: TSpeedButton;
    chkNotifFechaPactadaVencida: TCheckBox;
    tbCofirmarRecepcionLotePres: TToolButton;
    fpObservacion: TFormPanel;
    BevelAbm: TBevel;
    Button3: TButton;
    Button4: TButton;
    edObservacion: TRichEdit;
    Label29: TLabel;
    edfechaconfreceplotedesde: TDateComboBox;
    Label30: TLabel;
    edfechaconfreceplotehasta: TDateComboBox;
    chksinconfreceplote: TCheckBox;
    mnuNotificarAsignacion: TMenuItem;
    tbFechaEmpresas: TTabSheet;
    Label31: TLabel;
    edFechaLimitePresDesde: TDateComboBox;
    Label32: TLabel;
    edFechaLimitePresHasta: TDateComboBox;
    chkNotifFechaPresEmpVencida: TCheckBox;
    chkTipoNotifEmpresa: TCheckListBox;
    Label33: TLabel;
    Label12: TLabel;
    FPactadaDesde: TDateComboBox;
    Label10: TLabel;
    FPactadaHasta: TDateComboBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edFechaAsigEmpresaDesde: TDateComboBox;
    edFechaAsigEmpresaHasta: TDateComboBox;
    chkSinFechaNotifAsigEmpresa: TCheckBox;
    lblModoNotificacion: TLabel;
    lblModoSeleccionado: TLabel;
    btnModoNotificacion: TSpeedButton;
    tbCambiarEstadoSublote: TToolButton;
    mnuCambiarEstado: TPopupMenu;
    mnuAprobarLotes: TMenuItem;
    mnuAnularLotes: TMenuItem;
    Panel2: TPanel;
    lblSolEnvioInf: TLabel;
    fraDepart: TfraCodDesc;
    Label38: TLabel;
    mnuNotifCitEspecialista: TMenuItem;
    cbEmpresasVIP: TCheckBox;
    cbEmpresasNoVip: TCheckBox;
    Panel3: TPanel;
    grdTrabActivos: TArtDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbBajaTrabClick(Sender: TObject);
    procedure tbReactTrabClick(Sender: TObject);
    procedure dbgTrabajadoresGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fpDatosLoteShow(Sender: TObject);
    procedure cbEstadoChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoTrabClick(Sender: TObject);
    procedure tbManTrabClick(Sender: TObject);
    procedure fpTrabajadorShow(Sender: TObject);
    procedure fpTrabajadorClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirAgregarTrabClick(Sender: TObject);
    procedure tbAgregarTrabClick(Sender: TObject);
    procedure tbOrdenarTrabActClick(Sender: TObject);
    procedure sdqTrabActivosAfterScroll(DataSet: TDataSet);
    procedure tbOrdenarTrabLoteClick(Sender: TObject);
    procedure GenerarPqDatosPrestador(pLote: Integer; pPrestador, pListaEMail: String);
    procedure fpMotivoBajaShow(Sender: TObject);
    procedure btnAceptarBajaClick(Sender: TObject);
    procedure mnuNotificaraPrestadorClick(Sender: TObject);
    procedure mnuNotificaraEmpresaClick(Sender: TObject);
    procedure MantMotivos(CapMotivos, TipoMotivos: String);
    procedure spbMantRechazoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tbCambioEstadoClick(Sender: TObject);
    procedure spbMantAnulacionClick(Sender: TObject);
    procedure mnuNotificaraEmpresaMovilClick(Sender: TObject);
    procedure dbgEstabLoteGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure fpHistoricoLoteShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure tbAgendaObsLoteClick(Sender: TObject);
    procedure tbRefrescarEstabClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure sdqEmpresaEstabAfterScroll(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbAgendaObsSubLoteClick(Sender: TObject);
    procedure mnuCartaDocNoPresentacionEmpresaClick(Sender: TObject);
    procedure grdTrabActivosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mnuCDEmitidasClick(Sender: TObject);
    procedure btnAceptarNuevaFPactadaClick(Sender: TObject);
    procedure tbLotesACerrarClick(Sender: TObject);
    procedure sbLotesACerrarClick(Sender: TObject);
    procedure sdqTrabajadoresCalcFields(DataSet: TDataSet);
    procedure cbEstadoSubLoteFiltroChange(Sender: TObject);
    procedure mnuResumendeLotesClick(Sender: TObject);
    procedure mnuDetalledeLotesClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure ActualizarStatusBar;
    procedure tbAgendaObsAsigLoteClick(Sender: TObject);
    procedure tbCambioDeEstadoClick(Sender: TObject);
    procedure btnAceptarHistoricoClick(Sender: TObject);
    procedure tbListadoRecepcionClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbSelectAllClick(Sender: TObject);
    procedure tbUnSelectAllClick(Sender: TObject);
    procedure btnModoNotificacionClick(Sender: TObject);
    procedure btnModoNotifNuevaFechaClick(Sender: TObject);
    procedure rgTipoEnvioClick(Sender: TObject);
    procedure chkNotifFechaPactadaVencidaClick(Sender: TObject);
    procedure chkNotifFechaPresEmpVencidaClick(Sender: TObject);
    procedure fpNuevaFPactadaShow(Sender: TObject);
    procedure tbCofirmarRecepcionLotePresClick(Sender: TObject);
    procedure mnuNotificarAsignacionClick(Sender: TObject);
    procedure fpNotificacionEmpresaShow(Sender: TObject);
    procedure mnuAprobarLotesClick(Sender: TObject);
    procedure mnuAnularLotesClick(Sender: TObject);
    procedure mnuNotifCitEspecialistaClick(Sender: TObject);
    procedure sdqConsultaSELECTEDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    FACerrar: boolean;
    FFiltros: String;
    FEstado : String;
    SelectedList: TBookMarkLst;
    FOrigen: Boolean;
    procedure OnEmpresaChange(Sender : TObject);
    procedure OnEstablecimientoChange(Sender : TObject);
    procedure NotificarEmpresaPeriodicosFechaPactada(aModoEnvio: integer; AutoCommit: boolean = false);
    procedure NotificarEmpresaReconfirmaciones;
    procedure EnviarMailAnulacionLote;
    procedure ActualizarEstado;
    procedure SetFOrigenAMP(const Value: Boolean);
  protected
    procedure RefreshData; override;
  public
    property FOrigenAMP: Boolean read FOrigen write SetFOrigenAMP;
  end;

var
  frmSeguimientoLote : TfrmSeguimientoLote;
  frmSeguimientoLoteReconf : TfrmSeguimientoLote;

implementation

uses unPrincipal, unDmPrincipal, AnsiSql, unRptInformeAPrestador,
  unVisualizador, unContratoTrabajador, unGenLotesAMP,
  unRptInformeAEmpresa, unListaEMail, unManMotivosRechazo, unManMotivosBaja,
  unRptInformeMovilSanitario, unObsLote, unObsSubLote, ArchFuncs,
  unGeneracionCartasAdmin, unAMPAdministracionCartas, unRptPersonalExtra,
  unMoldeEnvioMail, unRptLotesACerrar, unRptInfEmpresaReconf,
  unRptInfPrestadorReconf, unObsAsigLote, unListadoRecepcion,
  VclExtra;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoLote.ActualizarStatusBar;
begin
  sbLotesACerrar.Visible := FOrigenAMP and
                            ExisteSQL('SELECT 1 ' +
                                      '  FROM hys.hel_estadolote ' +
                                      ' WHERE el_estado = ''D'' ' +
                                      '   AND el_fechapactada < art.actualdate')
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoLote.RefreshData;
var
  sEstab: String;
  sIn: String;
  i: integer;
  sWhereDepart: string;
begin
  sdqEmpresaEstab.Close;
  sdqHistLotes.Close;
  sdqTrabajadores.Close;
  SelectedList.Clear;

  FFiltros := '';
  sEstab   := '';
  sIn      := '';

  if fraEstablecimiento.IsSelected then
    sEstab := sEstab + ' AND es_nroestableci = ' + fraEstablecimiento.edCodigo.TextSql + ' ';

  if fraEmpresa.IsSelected or fraEstablecimiento.IsSelected then
    FFiltros := FFiltros + ' AND EXISTS (SELECT 1 ' +
                           '               FROM afi.aes_establecimiento, hys.hdl_detallelote ' +
                           '              WHERE dl_idlote = le_id ' +
                           '               AND dl_idestableci = es_id ' +
                           '               AND dl_idempresa = ' + SqlValue(fraEmpresa.Value) +
                                          sEstab
                                     + ')';

  if cbEmpresasVIP.Checked then
    FFiltros := FFiltros +
      ' AND EXISTS(SELECT DISTINCT 1 '+
      '        FROM comunes.cev_empresavip,hys.hdl_detallelote '+
      '       WHERE ev_idempresa = dl_idempresa '+
      '         AND dl_idlote = le_id '+
      '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';

  if cbEmpresasNoVIP.Checked then
    FFiltros := FFiltros +
      ' AND NOT EXISTS(SELECT DISTINCT 1 '+
      '        FROM comunes.cev_empresavip,hys.hdl_detallelote '+
      '       WHERE ev_idempresa = dl_idempresa '+
      '         AND dl_idlote = le_id '+
      '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';


  (*
    FFiltros := FFiltros + ' AND EXISTS (SELECT 1 ' +
                           '               FROM afi.aco_contrato, afi.aes_establecimiento, hys.hrl_relevamientolote, hys.hel_estadolote ' +
                           '              WHERE es_id = rl_idestableci ' +
                           '               AND co_contrato = es_contrato ' +
                           '               AND el_idlote = le_id' +
                           '               AND el_rlid = rl_id ' +
                           '               AND co_idempresa = ' + SqlValue(fraEmpresa.Value) +
                                          sEstab
                                     + ')';
   *)

  if fraPrestador.IsSelected then
    FFiltros := FFiltros + ' AND ca_identificador = ' + SqlValue(fraPrestador.Value) + ' ';

  if not edLote.IsEmpty then
    FFiltros := FFiltros + ' AND le_id = ' + edLote.TextSql + ' ';

  if cbEstadoLoteFiltro.ItemIndex >= 0 then
    FFiltros := FFiltros + ' AND le_estado LIKE ' + SqlValue(cbEstadoLoteFiltro.Value + '%') + ' ';

  if FOrigenAMP then
    FFiltros := FFiltros + ' AND le_reconfirmacion = ''N'' '
  else
    FFiltros := FFiltros + ' AND le_reconfirmacion = ''S'' ';

  if cbEstadoSubLoteFiltro.ItemIndex >= 0 then
    FFiltros := FFiltros + ' AND EXISTS (SELECT 1 ' +
                           '               FROM hys.hel_estadolote ' +
                           '              WHERE (el_idlote = le_id) ' +
                           '                AND el_estado LIKE ' + SqlValue(cbEstadoSubLoteFiltro.Value + '%') + ')';

  if not (edDesdeFCDA.IsEmpty or edHastaFCDA.IsEmpty) then
    FFiltros := FFiltros + ' AND EXISTS (SELECT 1 ' +
                           '               FROM hys.hel_estadolote ' +
                           '              WHERE (el_idlote = le_id) ' +
                           SqlBetweenDateTime(' AND el_fcda ', edDesdeFCDA.Date, edHastaFCDA.Date, True) + ')';

  FFiltros := FFiltros + SqlBetweenDateTime (' AND (SELECT MAX(dl_fechapactada) ' +
                                             '        FROM hys.hdl_detallelote ' +
                                             '       WHERE dl_idlote = le_id) ',
                                             FPactadaDesde.Date,
                                             FPactadaHasta.Date) + ' ';
  if tbMaxRegistros.Down Then
    FFiltros := FFiltros + ' AND ROWNUM <= ' + IntToStr(MaxRegistros) + ' ';


  FFiltros := FFiltros +  SqlBetweenDateTime ( ' AND le_fechanotificacion ', edFechaNotifPrestDesde.Date, edFechaNotifPrestHasta.Date);
  FFiltros := FFiltros +  SqlBetweenDateTime ( ' AND le_fechanotificacion + 90 ', edFechaLimitePresDesde.Date, edFechaLimitePresHasta.Date);

  FFiltros := FFiltros +  SqlBetweenDateTime ( ' AND le_fechanotifasig ', edFechaAsigEmpresaDesde.Date, edFechaAsigEmpresaHasta.Date);

  FFiltros := FFiltros +  SqlBetweenDateTime ( ' AND le_fechaconfreceplote ', edfechaconfreceplotedesde.Date, edfechaconfreceplotehasta.Date);

  if chksinconfreceplote.Checked then
    FFiltros := FFiltros + ' AND le_fechaconfreceplote IS NULL ';

  if chkSinFechaNotifAsigEmpresa.Checked then
    FFiltros := FFiltros + ' AND le_fechanotifasig IS NULL ';

  if chkTipoNotifEmpresa.Checked[4] then
    FFiltros := FFiltros + ' AND le_fechanotifiempresa IS NULL ';

  for i:=0 to chkTipoNotifEmpresa.Count-2 do
  begin
    if chkTipoNotifEmpresa.Checked[i] then
    begin
      if (sIn <> '') then
        sIn := sIn + ', ';
      sIn := sIn + SqlValue(Decode(IntToStr(i), ['0', '1', '2', '3'], ['M', 'F', 'C', 'V']))
    end;
  end;

  if (sIn <> '') then
    FFiltros := FFiltros + ' AND le_tiponotifempresa in (' + sIn + ') ';

  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;

  if (fraDepart.IsSelected) then
    sWhereDepart :=
              'AND EXISTS (SELECT  1 '
            + '                  FROM  afi.aes_establecimiento, '
            + '                        hys.hrl_relevamientolote hrl, '
            + '                        hys.hel_estadolote hel '
            + '                 WHERE  rl_idestableci = es_id '
            + '                    AND rl_id = hel.el_rlid '
            + '                    AND hel.el_idlote = le_id '
            + '                    AND art.utiles.get_partido ( '
            + '                                                es_cpostal, '
            + '                                                es_provincia '
            + '                                               ) = ' + SqlValue(fraDepart.cmbDescripcion.Text) + ')'
            ;

  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text := 'SELECT          le_id, le_estado, ' +
                          '                (SELECT de_descripcion ' +
                          '                  FROM hys.hde_descripcionestadolote ' +
                          '                  WHERE de_codigo = le_estado) estadolote, ' +
                          '                ca_identificador, ca_descripcion, ca_direlectronica, ' +
                          '                ca_telefono, le_fechanotificacion, le_fechanotifiempresa, ' +
                          '                DECODE ' +
                          '                   ((SELECT COUNT(DISTINCT el_fechapactada) ' +
                          '                       FROM hys.hel_estadolote ' +
                          '                      WHERE el_idlote = le_id), ' +
                          '                    NULL, '''', ' +
                          '                    0, '''', ' +
                          '                    1, (SELECT TO_CHAR (MAX(el_fechapactada), ''DD/MM/YYYY'') ' +
                          '                          FROM hys.hel_estadolote ' +
                          '                         WHERE el_idlote = le_id), ' +
                          '                    ''Ver Sublotes'') dl_fechapactada, ' +
                          '                       (SELECT MAX(os_id) ' +
                          '                        FROM hys.hos_observacionessublote ' +
                          '                        WHERE os_idtipoobservacion = 5 and os_fechabaja is null ' +
                          '                          AND os_idlote = le_id ) SolInforme, ' +
                          '                TO_CHAR(le_monto, ''999G999G999D99'') monto, ' +
                          '                TRIM(le_observaciones || '' '' || le_obsseguimiento) "Observaciones", ' +
                          '                le_fechabaja, le_fechaalta, (le_fechanotificacion + 90) fechalimite, ' +
                          '                le_fechaconfreceplote,  ' +
                          '                le_tiponotifempresa, decode(le_tiponotifempresa, ''F'', ''Fax'', ''M'', ''Mail'', ''V'', ''Ventanilla'', ''C'', ''Carta'') desctiponotif, ' +
                          '                le_fechanotifasig, ' +
                          '                le_usunotifasig, ' +
                          '                le_tiponotifasig, decode(le_tiponotifasig, ''F'', ''Fax'', ''M'', ''Mail'', ''V'', ''Ventanilla'', ''C'', ''Carta'') desctiponotifasig, ' +
                          '                le_fechaingresoweb ' +
                          '           FROM hys.hle_loteestudio, ' +
                          '                art.cpr_prestador ' +
                          '          WHERE ca_identificador = le_idprestador ' +
                          FFiltros +
                          iif (FACerrar,
                               'AND EXISTS (SELECT 1 ' +
                               '              FROM hys.hel_estadolote ' +
                               '             WHERE el_idlote = le_id ' +
                               '               AND el_fechapactada < art.actualdate ' +
                               '               AND el_estado = ''D'') ',
                               '') +
                          sWhereDepart  +
                          SortDialog.OrderBy;
  sdqConsulta.Open;

  if FACerrar then
    FFiltros := FFiltros + ' AND el_fechapactada < art.actualdate ';

  sdqListado.Sql.Clear;
  sdqListado.Sql.Text:= 'SELECT DISTINCT le_id "LOTE", hde1.de_descripcion "ESTADO LOTE", ' +
                        '                ca_descripcion "PRESTADOR", ' +
                        '                le_fechanotificacion "FECHA NOTIF PRESTADOR", ' +
                        '                le_fechanotifiempresa "FECHA NOTIF EMPRESA", le_monto "MONTO", ' +
                        '                TRIM(le_observaciones || '' '' ' +
                        '                     || le_obsseguimiento) "OBSERVACIONES", ' +
                        '                em_cuit "CUIT", em_nombre "RAZON SOCIAL", ' +
                        '                es_nroestableci "ESTAB.", es_nombre "NOMBRE", ' +
                        '                es_contrato "CONTRATO", hde2.de_descripcion "ESTADO SUBLOTE", ' +
                        '                el_fecharelevamiento "FECHA RELEVAMIENTO", ' +
                        '                el_fechapactada "FECHA PACTADA", ' +
                        '                TRUNC(el_fechaaprobado) "FECHA APROBADO", ' +
                        '                el_fecharechazo "FECHA RECHAZO", ' +
                        '                NVL(el_fechaanulado, TRUNC(el_fechabaja)) "FECHA ANULADO", ' +
                        '                el_fecharecibido "FECHA RECIBIDO", ' +
                        '                TRUNC(el_fechaterminado) "FECHA TERMINADO", ' +
                        '                el_idmotivo "MOTIVO RECHAZO", ' +
                        '                DECODE(el_operativo, ''A'', ''Anual'', ''S'', ''Semestral'', ''R'', ''Reconfirmación'', ''N/D'') "OPERATIVO", ' +
                        '                (SELECT COUNT(*) ' +
                        '                   FROM hys.hlc_lotecartadoc ' +
                        '                  WHERE lc_idestableci = dl_idestableci ' +
                        '                    AND lc_idlote = le_id) "CANT.CC.DD.", ' +
                        '                (SELECT MAX(ca_fechaalta) ' +
                        '                   FROM hys.hlc_lotecartadoc, cca_carta ' +
                        '                  WHERE ca_id = lc_idcarta ' +
                        '                    AND lc_idestableci = dl_idestableci ' +
                        '                    AND lc_idlote = le_id) "FECHA CC.DD.", ' +
                        '                tj_cuil "CUIL", tj_nombre "TRABAJADOR", ' +
                        '                dl_motivobaja "MOTIVO BAJA", ' +
                        '                NVL2(dl_fuerarelevamiento, ' +
                        '                     TRUNC(dl_fechaalta), NULL) "FECHA AGREGADO", dl_idtrabajador, ' +
                        '                el_fcda ''F.Carta Doc.Aus.'' ' +
                        '           FROM hys.hle_loteestudio, hys.hel_estadolote, ' +
                        '                hys.hrl_relevamientolote, hys.hdl_detallelote, ' +
                        '                afi.aem_empresa, afi.aes_establecimiento, ' +
                        '                comunes.ctj_trabajador, hys.hde_descripcionestadolote hde1, ' +
                        '                hys.hde_descripcionestadolote hde2, art.cpr_prestador ' +
                        '          WHERE el_idlote = le_id ' +
                        '            AND rl_id = el_rlid ' +
                        '            AND rl_fecha = el_fecharelevamiento ' +
                        '            AND dl_idlote = le_id ' +
                        '            AND dl_idestableci = rl_idestableci ' +
                        '            AND em_id = dl_idempresa ' +
                        '            AND es_id = dl_idestableci ' +
                        '            AND tj_id = dl_idtrabajador ' +
                        '            AND hde1.de_codigo = le_estado ' +
                        '            AND hde2.de_codigo = el_estado ' +
                        '            AND ca_identificador = le_idprestador ' +
                        FFiltros;

  ActualizarStatusBar;

  inherited;

  tbNuevo.Enabled := false;
  tbModificar.Enabled := false;
  tbEliminar.Enabled := false;
  tbPropiedades.Enabled := false;
  tbEnviarMail.Enabled := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoLote.FormCreate(Sender: TObject);
begin
  inherited;

  pcFilter.ActivePageIndex := 0;

  FOrigenAMP := true;

  tbNotificar.Left := tbSalir.Left - 20;
  tbLotesACerrar.Left := tbSalir.Left - 20;
  tbAgendaObsLote.Left := tbSalir.Left - 1;
  tbCambioDeEstado.Left := tbSalir.Left - 5;
  tbListadoRecepcion.Left := tbSalir.Left - 5;
  tbCofirmarRecepcionLotePres.Left := tbSalir.Left - 5;
  tbCambiarEstadoSublote.Left := tbSalir.Left - 5;
  tbUnSelectAll.Left := tbSalir.Left - 5;
  tbSelectAll.Left := tbSalir.Left - 5;

  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEmpresa.ContratoActivo := True;
  fraEmpresa.ShowBajas      := True;

  fraEstablecimiento.OnChange := OnEstablecimientoChange;
  gbEstablecimientos.Collapsed := true;
  gbTrabajadores.Collapsed := true;

  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL) depto WHERE 1=1'
            ;

  end;

  with fraMotivosBaja do
  begin
    TableName := 'hys.hmb_motivobaja';
    FieldId := 'mb_id';
    FieldCodigo := 'mb_id';
    FieldDesc := 'mb_descripcion';
    FieldBaja := 'mb_fechabaja';
    ExtraCondition := ' AND mb_id <> 1 ';
    ShowBajas := true
  end;

  with fraMotivosRechazo do
  begin
    TableName := 'hys.hmr_motivorechazo';
    FieldId := 'mr_id';
    FieldCodigo := 'mr_id';
    FieldDesc := 'mr_descripcion';
    FieldBaja := 'mr_fechabaja';
    ShowBajas := true;
    ExtraCondition := ' AND mr_tiporechazo = ''R'' ';
  end;

  with fraMotivosAnulacion do
  begin
    TableName := 'hys.hmr_motivorechazo';
    FieldId := 'mr_id';
    FieldCodigo := 'mr_id';
    FieldDesc := 'mr_descripcion';
    FieldBaja := 'mr_fechabaja';
    ShowBajas := true;
    ExtraCondition := ' AND mr_tiporechazo = ''A'' ';
  end;

  with fraMotivosTerminacion do
  begin
    TableName := 'hys.hmr_motivorechazo';
    FieldId := 'mr_id';
    FieldCodigo := 'mr_id';
    FieldDesc := 'mr_descripcion';
    FieldBaja := 'mr_fechabaja';
    ShowBajas := true;
    ExtraCondition := ' AND mr_tiporechazo = ''T'' ';
  end;

  // Genera la lista de Estados de Lote (estados padre)
  cbEstadoLoteFiltro.Clear;
  with sdqEstados do
  begin
    SQL.Text := 'SELECT de_codigo || ''='' || de_descripcion item ' +
                '  FROM hys.hde_descripcionestadolote ' +
                ' WHERE de_valor = TRUNC(de_valor) ';
    Open;
    while not EoF do
    begin
      cbEstadoLoteFiltro.Items.Add(FieldByName('item').AsString);

      Next
    end;
    Close
  end;

  // Genera la lista de Estados de SubLotes (estados hijo)
  cbEstadoSubLoteFiltro.Clear;
  with sdqEstados do
  begin
    SQL.Text := 'SELECT de_codigo || ''='' || de_descripcion item ' +
                        '  FROM hys.hde_descripcionestadolote';
    Open;
    while not EoF do
    begin
      cbEstadoSubLoteFiltro.Items.Add(FieldByName('item').AsString);

      Next
    end;
    Close
  end;

  ActualizarStatusBar;

  SelectedList := TBookMarkLst.Create;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoLote.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.mskCUIT.Text ;
  sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoLote.OnEstablecimientoChange(Sender: TObject);
begin
  sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoLote.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraEstablecimiento.Clear;
  fraPrestador.Clear;
  edLote.Clear;
  cbEstadoLoteFiltro.ItemIndex := -1;
  cbEstadoSubLoteFiltro.ItemIndex := -1;
  sdqTrabajadores.Close;
  sdqEmpresaEstab.Close;
  FACerrar := false;
  edDesdeFCDA.Clear;
  edhastaFCDA.Clear;
  FPactadaDesde.Clear;
  FPactadaHasta.Clear;
  edFechaNotifPrestDesde.Clear;
  edFechaNotifPrestHasta.Clear;
  edFechaLimitePresDesde.Clear;
  edFechaLimitePresHasta.Clear;
  chkNotifFechaPactadaVencida.Checked := false;
  chkNotifFechaPresEmpVencida.Checked := false;
  fraDepart.Clear;
  inherited;
end;

procedure TfrmSeguimientoLote.tbBajaTrabClick(Sender: TObject);
begin
  if sdqTrabajadores.IsEmpty then
    Exit;

  //Para que funcione el multiselect de cambio de estado
  GridCellClick(Grid.ColumnByField['SELECTED']);

  if (not sdqTrabajadores.FieldByName ('dl_fechabaja').IsNull) or
     (not AreIn(sdqEmpresaEstab.FieldByName('el_estado').AsString, ['A', 'I' ,'P', 'S', 'M'])) then
  begin
    MsgBox('Acción no válida en este estado.', MB_ICONERROR + MB_OK);
    Exit
  end;

  if fpMotivoBaja.ShowModal = mrOk then
  begin
    BeginTrans;
    try
      EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                    '   SET dl_fechabaja = SYSDATE, ' +
                    '       dl_motivobaja = ' + SqlValue (fraMotivosBaja.Value) + ', ' +
                    '       dl_usubaja = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                    ' WHERE dl_idlote = ' + SqlValue (sdqTrabajadores.FieldByName ('le_id').AsInteger) +
                    '   AND dl_idtrabajador = ' + SqlValue (sdqTrabajadores.FieldByName ('dl_idtrabajador').AsInteger));

      if ExisteSQLEx ('SELECT 1 ' +
                      '  FROM hys.hdl_detallelote ' +
                      ' WHERE dl_fechabaja IS NOT NULL ' +
                      '   AND dl_idlote = :pidlote ' +
                      '   AND dl_idempresa = :pidempresa ' +
                      '   AND dl_idestableci = :pidestableci ',
                      [sdqTrabajadores.FieldByName ('le_id').AsInteger,
                       sdqEmpresaEstab.FieldByName ('em_id').AsInteger,
                       sdqEmpresaEstab.FieldByName ('es_id').AsInteger]) then
      begin
        FEstado := 'N';
        fpDatosLote.ShowModal
      end
      else
        // Calculo el costo total de los estudios
        EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                      '   SET le_monto = (SELECT NVL(SUM(dl_monto), 0) ' +
                      '                     FROM hys.hdl_detallelote ' +
                      '                    WHERE dl_idlote = le_id ' +
                      '                      AND dl_fechabaja IS NULL) ' +
                      ' WHERE le_id = ' + SqlValue (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

      if InTransaction then
        CommitTrans;

      if sdqTrabajadores.Active then
        sdqTrabajadores.Refresh
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg (E, 'Error en la baja del trabajador en el lote');
      end
    end
  end
end;

procedure TfrmSeguimientoLote.tbReactTrabClick(Sender: TObject);
begin
  if sdqTrabajadores.IsEmpty then
    Exit;

  if not AreIn(sdqEmpresaEstab.FieldByName('el_estado').AsString, ['A', 'I' ,'P', 'S', 'M']) then
  begin
    MsgBox('Acción no válida en este estado.', MB_ICONERROR + MB_OK);
    Exit
  end;

  BeginTrans;
  try
    EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                  '   SET dl_fechabaja = NULL, ' +
                  '       dl_motivobaja = NULL, ' +
                  '       dl_usubaja = NULL ' +
                  ' WHERE dl_idlote = ' + SqlValue (sdqTrabajadores.FieldByName ('le_id').AsInteger) +
                  '   AND dl_idtrabajador = ' + SqlValue (sdqTrabajadores.FieldByName ('dl_idtrabajador').AsInteger));

    CommitTrans;
    if sdqTrabajadores.Active then
      sdqTrabajadores.Refresh
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg (E, 'Error al reactivar el trabajador en el lote');
    end
  end
end;

procedure TfrmSeguimientoLote.dbgTrabajadoresGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqTrabajadores.FieldByName('dl_fechabaja').IsNull then
    AFont.Color := clRed
  else
    if not sdqTrabajadores.FieldByName('fagregado').IsNull then
    begin
      if Highlight then
      begin
        AFont.Color := clWhite;
        Background := clNavy
      end
      else
        Background := clAqua;
    end
end;

procedure TfrmSeguimientoLote.fpDatosLoteShow(Sender: TObject);
begin
  // Defino posibles estados en base al estado actual
  cbEstado.Items.Clear;
  lblModoSeleccionado.Tag := -1;
  lblModoSeleccionado.Caption := '<Sin Selección>';
  if not FOrigenAMP then
  begin
    lblModoNotificacion.Visible  := false;
    lblModoSeleccionado.Visible := false;
    btnModoNotificacion.Visible := false;
  end;

  with sdqEstados do
  begin
    SQL.Text := 'SELECT de_codigo || ''='' || de_descripcion item ' +
                '  FROM hys.hte_transicionestado, hys.hde_descripcionestadolote ' +
                ' WHERE de_codigo = te_final ' +
                '   AND te_fechabaja IS NULL ';
      if FEstado='' then
        SQL.Text := SQL.Text +  '   AND te_inicial = UPPER(' + SqlValue(sdqEmpresaEstab.FieldByName('el_estado').AsString) + ')';
    Open;
    while not EoF do
    begin
      cbEstado.Items.Add(FieldByName('item').AsString);
      Next
    end;
    Close
  end;

  pcDatosEstado.Visible := False;
  edFechaAprobado.Clear;
  edFechaRechazo.Clear;
  edFechaPactada.Clear;
  edFechaRecibido.Clear;
  edFechaAnulado.Clear;
  fraMotivosRechazo.Clear;
  edObservaciones.Clear;

  if FEstado = '' then
  begin
    cbEstado.ItemIndex := -1;
    LockControl(cbEstado, false);
  end
  else begin
    cbEstado.Value := FEstado;
    cbEstado.OnChange(Sender);
    LockControl(cbEstado, true);
    if FEstado = 'N' then
    begin
      edFechaAnulado.Date := Date;
      fraMotivosAnulacion.Value := 37;
    end
    else if (FEstado = 'A') then
      edFechaAprobado.Date := Date;
  end;

  inherited;
end;

procedure TfrmSeguimientoLote.cbEstadoChange(Sender: TObject);
var
  aParent: TWinControl;
begin
  inherited;

  pcDatosEstado.Visible := AreIn(cbEstado.Value, ['A', 'R' ,'N', 'B', 'T', 'M', 'S', 'I', 'E', 'V']);

  if pcDatosEstado.Visible then
    pcDatosEstado.ActivePageIndex := iif(cbEstado.Value = 'R',
                                         0,
                                         iif(cbEstado.Value = 'A',
                                             1,
                                             iif(AreIn(cbEstado.Value, ['N', 'E']),
                                                 2,
                                                 iif(cbEstado.Value = 'B',
                                                     3,
                                                     iif (cbEstado.Value = 'T',
                                                           4,
                                                           iif(AreIn(cbEstado.Value, ['S', 'I', 'V']),
                                                               6,

                                                               5))))));
  aParent := nil;
  if (pcDatosEstado.ActivePage = tsReprogramacion) then
    aParent := tsReprogramacion;
  if (pcDatosEstado.ActivePage = tsAprobacion) then
    aParent := tsAprobacion;
  if Assigned(aParent) then
  begin
    lblModoNotificacion.Parent := aParent;
    lblModoSeleccionado.Parent := aParent;
    btnModoNotificacion.Parent := aParent;
  end;
end;

procedure TfrmSeguimientoLote.btnAceptarClick(Sender: TObject);
var
  LoteLiquidado: Boolean;
  i:integer;
begin
  LoteLiquidado := false;
  if cbEstado.Value = 'L' then
    LoteLiquidado := ValorSqlIntegerEx ('SELECT count(*) ' +
                                        '  FROM hys.hdl_detallelote ' +
                                        ' WHERE dl_fechabaja IS NULL ' +
                                        '   and dl_idlote = :pidlote ' +
                                        '   and dl_idestableci = :pidestableci ',
                                        [sdqEmpresaEstab.FieldByName ('le_id').AsInteger,
                                         sdqEmpresaEstab.FieldByName ('es_id').AsInteger], 0) =
                     ValorSqlIntegerEx ('SELECT count(*) ' +
                                        '  FROM hys.hel_estadolote, hys.hrl_relevamientolote, hys.hdl_detallelote ' +
                                        ' WHERE rl_id = el_rlid ' +
                                        '   AND dl_fechabaja IS NULL ' +
                                        '   AND dl_idlote = el_idlote ' +
                                        '   AND dl_idestableci = rl_idestableci ' +
                                        '   AND dl_iddetvolante IS NOT NULL ' +
                                        '   AND dl_idlote = :pidlote ' +
                                        '   AND dl_idestableci = :pidestableci ',
                                        [sdqEmpresaEstab.FieldByName ('le_id').AsInteger,
                                         sdqEmpresaEstab.FieldByName ('es_id').AsInteger], 0);

  VerificarMultiple (['Cambio de Estado',
                      cbEstado,
                      cbEstado.Value <> '',
                      'Debe indicar el nuevo Estado',

                      edFechaAprobado,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'A')) or ((cbEstado.Value = 'A') and (not edFechaAprobado.IsEmpty)))),
                      'Debe indicar la Fecha de Aprobación',

                      edFechaPactada,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'A')) or ((cbEstado.Value = 'A') and (not edFechaPactada.IsEmpty)))),
                      'Debe indicar la Fecha Pactada',

                      lblModoSeleccionado,
                      (not pcDatosEstado.Visible) or (not lblModoSeleccionado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'A')) or ((cbEstado.Value = 'A') and (lblModoSeleccionado.Tag <> -1)))),
                      'Debe seleccionar un modo de notificación',

                      edFechaReprogramado,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'M')) or ((cbEstado.Value = 'M') and (not edFechaReprogramado.IsEmpty)))),
                      'Debe indicar la nueva Fecha Pactada por Reprogramación de la realización de estudios',

                      edFechaRechazo,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'R')) or ((cbEstado.Value = 'R') and (not edFechaRechazo.IsEmpty)))),
                      'Debe indicar la Fecha de Rechazo',

                      fraMotivosRechazo,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'R')) or ((cbEstado.Value = 'R') and fraMotivosRechazo.IsSelected))),
                      'Debe indicar el Motivo de Rechazo',

                      edFechaRecibido,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'B')) or ((cbEstado.Value = 'B') and (not edFechaRecibido.IsEmpty)))),
                      'Debe indicar la Fecha de Recepción',

                      edFechaAnulado,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'N')) or ((cbEstado.Value = 'N') and (not edFechaAnulado.IsEmpty)))),
                      'Debe indicar la Fecha de Anulación',

                      edFechaAnulado,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'E')) or ((cbEstado.Value = 'E') and (not edFechaAnulado.IsEmpty)))),
                      'Debe indicar la Fecha de Anulación',

                      edFechaNotificacion,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'S')) or ((cbEstado.Value = 'S') and (not edFechaNotificacion.IsEmpty)))),
                      'Debe indicar la Fecha de Notificación de Realización sin Entrega',

                      edFechaNotificacion,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'I')) or ((cbEstado.Value = 'I') and (not edFechaNotificacion.IsEmpty)))),
                      'Debe indicar la Fecha de Notificación de Realización Parcial',

                      fraMotivosAnulacion,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'N')) or ((cbEstado.Value = 'N') and fraMotivosAnulacion.IsSelected))),
                      'Debe indicar el Motivo de Anulación',

                      fraMotivosAnulacion,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'E')) or ((cbEstado.Value = 'E') and fraMotivosAnulacion.IsSelected))),
                      'Debe indicar el Motivo de Cierre',

                      cbEstado,
                      (not pcDatosEstado.Visible) or
                      (pcDatosEstado.Visible and (((cbEstado.Value <> 'L')) or ((cbEstado.Value = 'L') and LoteLiquidado))),
                      'Los estudios no han sido liquidados en su totalidad']);

  Verificar(pcDatosEstado.Visible and (cbEstado.Value = 'B') and
            (edFechaRecibido.Date > ValorSqlDateTime('select art.actualdate from dual')),edFechaRecibido,
            'La fecha de recibido no puede ser mayor a hoy.');


  if (cbEstado.Value = 'M') then
    Verificar(pcDatosEstado.Visible and (edFechaReprogramado.Date < sdqEmpresaEstab.FieldByName('dl_fechapactada').AsDateTime) and
              (edFechaRecibido.Date > ValorSqlDateTime('select art.actualdate from dual')),edFechaReprogramado,
              Format('Está efectuando una Reprogramación de la realización de estudios. Debe indicar la nueva Fecha Pactada posterior a %s', [sdqEmpresaEstab.FieldByName('dl_fechapactada').AsString]));

  if cbEstado.Enabled then ActualizarEstado
  else begin
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      tbRefrescarEstabClick(Sender);
      sdqEmpresaEstab.First;
      while not sdqEmpresaEstab.EoF do
      begin
        if ExisteSql( 'SELECT 1 ' +
                      '  FROM hys.hte_transicionestado, hys.hde_descripcionestadolote ' +
                      ' WHERE de_codigo = te_final ' +
                      '   AND te_fechabaja IS NULL ' +
                      '   AND de_codigo = ' + SqlValue(FEstado) +
                      '   AND te_inicial = UPPER(' + SqlValue(sdqEmpresaEstab.FieldByName('el_estado').AsString) + ')') then
        begin
          if (sdqEmpresaEstab.FieldByName('el_fechabaja').IsNull) and not AreIn(sdqEmpresaEstab.FieldByName('el_estado').AsString, ['L', 'N' ,'R']) then
            ActualizarEstado
          else
            MsgBox('El lote ' + sdqEmpresaEstab.FieldByName('le_id').AsString + ' no puede cambiarse a este estado.')
        end
        else
          MsgBox('El lote ' + sdqEmpresaEstab.FieldByName('le_id').AsString + ' no puede cambiarse a este estado.');
        sdqEmpresaEstab.Next;
      end;
    end;
    SelectedList.Clear;
  end;
  fpDatosLote.ModalResult := mrOk;
  sdqConsulta.Refresh;

  if sdqEmpresaEstab.Active then
    sdqEmpresaEstab.Refresh;

  if sdqHistLotes.Active then
    sdqHistLotes.Refresh;

  if sdqTrabajadores.Active then
    sdqTrabajadores.Refresh;
end;

procedure TfrmSeguimientoLote.tbNuevoTrabClick(Sender: TObject);
begin
  if sdqTrabajadores.IsEmpty then
    Exit;

  if not FOrigenAMP then
  begin
    MsgBox('No se pueden agregar trabajadores en un lote de Reconfirmación.', MB_ICONERROR + MB_OK);
    Exit
  end;

  if not AreIn(sdqEmpresaEstab.FieldByName('el_estado').AsString, ['A', 'I' ,'P', 'S', 'M', 'B']) then
  begin
    MsgBox('Acción no válida en este estado.', MB_ICONERROR + MB_OK);
    Exit
  end;

  fpTrabajador.ShowModal
end;

procedure TfrmSeguimientoLote.tbManTrabClick(Sender: TObject);
begin
  DoContratoTrabajador(0, 0);
  if sdqTrabActivos.Active then
    sdqTrabActivos.Refresh
end;

procedure TfrmSeguimientoLote.fpTrabajadorShow(Sender: TObject);
begin
  sdqTrabActivos.Close;
  sdqTrabActivos.ParamByName('pcontrato').Value := sdqEmpresaEstab.FieldByName('Contrato').AsInteger;
//  sdqTrabActivos.ParamByName('pfecha').Value := sdqEmpresaEstab.FieldByName('rl_fecha').AsString;
  sdqTrabActivos.Open;

  with sdqEstudiosPosibles do
  begin
    Close;
    ParamByName('pcontrato').Value := sdqEmpresaEstab.FieldByName('contrato').AsInteger;
    Open;

    clbListaEstudios.Values.Clear;
    clbListaEstudios.Items.Clear;
    clbListaEstudios.Visible := not IsEmpty;

    while not EoF do
    begin
      clbListaEstudios.Add(FieldByName('es_descripcion').AsString,
                           FieldByName('er_estudio').AsString);
      Next
    end;

    Close
  end;

  tsSelEstudios.ActivePageIndex := 0
end;

procedure TfrmSeguimientoLote.fpTrabajadorClose(Sender: TObject;
  var Action: TCloseAction);
var
  rptPersonalExtra: TrptPersonalExtra;

  FDirectorioEMail,
  FAsunto,
  FBody,
  FArchivo,
  FListaMail: String;
begin
  if ExisteSqlEx ('SELECT 1 ' +
                  '  FROM hys.hdl_detallelote ' +
                  ' WHERE dl_idlote = :pidlote ' +
                  '   AND dl_idestableci = :pidestableci ' +
                  '   AND dl_fuerarelevamiento = ''S'' ' +
                  '   AND TRUNC(dl_fechaalta) = art.actualdate ',
                  [sdqConsulta.FieldByName('le_id').AsInteger,
                   sdqEmpresaEstab.FieldByName('es_id').AsInteger]) then
  begin
    FDirectorioEMail := TempPath;
    FListaMail := Get_DireccionesEnvioMail('AUSAMP_3');

    // Notificar de los trabajadores agregados
    rptPersonalExtra := TrptPersonalExtra.Create( Self );
    try
      rptPersonalExtra.FIDLoteRpt     := sdqConsulta.FieldByName('le_id').AsInteger;
      rptPersonalExtra.FIDEstableciRpt:= sdqEmpresaEstab.FieldByName('es_id').AsInteger;

      FAsunto := Format('Personal agregado al CUIT %s, Estab. %s',
                        [sdqEmpresaEstab.FieldByName('em_cuit').AsString,
                         sdqEmpresaEstab.FieldByName('es_nroestableci').AsString]);

      FArchivo := FDirectorioEMail + FAsunto + '.pdf';

      FBody := Format('Al CUIT %s, Estab. %s, cuya fecha de relevamiento es %s, ' +
                      'se le han agregado los ESOP detallados en adjunto.',
                      [sdqEmpresaEstab.FieldByName('em_cuit').AsString,
                       sdqEmpresaEstab.FieldByName('es_nroestableci').AsString,
                       sdqEmpresaEstab.FieldByName('rl_fecha').AsString]);

      ExportarPDF(rptPersonalExtra.qrPersonalExtra, FArchivo);
      EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody,
                   GetAttachments(FArchivo, 0));
    finally
      rptPersonalExtra.Free;
    end
  end;

  inherited
end;

procedure TfrmSeguimientoLote.tbSalirAgregarTrabClick(Sender: TObject);
begin
  fpTrabajador.Close
end;

procedure TfrmSeguimientoLote.tbAgregarTrabClick(Sender: TObject);
var
  i, t,
  FIDLote,
  FIDTrabajador,
  FIDEstableci,
  FNroEstableci,
  FIDEmpresa,
  FIDRiesgo : integer;
  FValorEstudio : double;
  FCUIL,
  FCUIT,
  FCodRiesgo,
  FEstudio,
  FPeriodicidad,
  FNombreTrab: String;
  FFechaCarga,
  FFechaAlta: TDateTime;


  procedure AgregarEnRiesTrab;
  begin
    if not ExisteSql ('SELECT 1 ' +
                      '  FROM art.prt_riestrab ' +
                      ' WHERE rt_cuit = ' + SqlValue (FCUIT) +
                      '   AND rt_estableci = ' + SqlValue (FNroEstableci) +
                      '   AND rt_fecha = ' + SqlValue (FFechaCarga) +
                      '   AND rt_riesgo = ' + SqlValue (FCodRiesgo) +
                      '   AND rt_cuil = ' + SqlValue (FCUIL)) then
      EjecutarSqlST('INSERT INTO art.prt_riestrab ( ' +
                    '  rt_cuit, ' +
                    '  rt_estableci, ' +
                    '  rt_fecha, ' +
                    '  rt_riesgo, ' +
                    '  rt_cuil, ' +
                    '  rt_nombre, ' +
                    '  rt_fechainiexpo, ' +
                    '  rt_usualta, ' +
                    '  rt_fechaalta, ' +
                    '  rt_idrg) ' +
                    'VALUES ( ' +
                       SqlValue (FCUIT) + ', ' +
                       SqlValue (FNroEstableci) + ', ' +
                       SqlValue (FFechaCarga) + ', ' +
                       SqlValue (FCodRiesgo) + ', ' +
                       SqlValue (FCUIL) + ', ' +
                       SqlValue (FNombreTrab) + ', ' +
                       'NULL, ' +
                       SqlValue (frmPrincipal.DBLogin.UserID) + ', ' +
                       SqlValue (FFechaAlta) + ', ' +
                       SqlValue (FIDRiesgo) + ')');
  end;

  procedure AgregarEstudioEnDetalleLote;
  begin
    if (not ExisteSql ('SELECT 1 ' +
                       '  FROM hys.hdl_detallelote ' +
                       ' WHERE dl_idempresa = ' + SqlValue (FIDEmpresa) +
                       '   AND dl_idestableci = ' + SqlValue (FIDEstableci) +
                       '   AND dl_idtrabajador = ' + SqlValue (FIDTrabajador) +
                       '   AND dl_idestudio = ' + SqlValue (FEstudio) +
                       '   AND dl_idlote = ' + SqlValue(FIDLote) + 
                       '   AND dl_fechabaja IS NULL')) or
        ExisteSql ('SELECT 1 ' +
                   '  FROM hys.hdl_detallelote ' +
                   ' WHERE dl_idempresa = ' + SqlValue (FIDEmpresa) +
                   '   AND dl_idestableci = ' + SqlValue (FIDEstableci) +
                   '   AND dl_idtrabajador = ' + SqlValue (FIDTrabajador) +
                   '   AND dl_idestudio = ' + SqlValue (FEstudio) +
                   '   AND dl_fechabaja IS NULL' +
                   '   AND ADD_MONTHS(TRUNC(dl_fecharealizacion), ' + SqlInt (FPeriodicidad) + ') <= TRUNC(SYSDATE)')
      then
        EjecutarSqlST('INSERT INTO HYS.hdl_detallelote ( ' +
                      '  dl_id, ' +
                      '  dl_idlote, ' +
                      '  dl_idestableci, ' +
                      '  dl_idtrabajador, ' +
                      '  dl_idestudio, ' +
                      '  dl_monto, ' +
                      '  dl_fechaalta, ' +
                      '  dl_usualta, ' +
                      '  dl_fechapactada, ' +
                      '  dl_idempresa, ' +
                      '  dl_fuerarelevamiento) ' +
                      'VALUES ( ' +
                      '  hys.seq_hdl_id.NEXTVAL, ' +
                         SqlValue (FIDLote) + ', ' +
                         SqlValue (FIDEstableci) + ', ' +
                         SqlValue (FIDTrabajador) + ', ' +
                         SqlValue (FEstudio) + ', ' +                                          
                         SqlNumber (FValorEstudio) + ', ' +
                         'SYSDATE , ' +
                         SqlValue (frmPrincipal.DBLogin.UserID) + ', ' +
                         '(SELECT MAX(dl2.dl_fechapactada) ' +
                         '   FROM hys.hdl_detallelote dl2 ' +
                         '  WHERE dl2.dl_fechapactada IS NOT NULL ' +
                         '    AND dl2.dl_idlote =  ' + SqlValue(FIDLote) + '), ' +
                         SqlValue (FIDEmpresa) + ', ''S'')');
  end;

  procedure AgregarEstudiosEnDetalleLote;
  begin
    // Selecciono los datos de los estudios asociados al riesgo
    with sdqEstudiosRiesgo do
    begin
      Close;
      ParamByName('pidprestador').Value:= sdqConsulta.FieldByName('ca_identificador').AsInteger;
      ParamByName('pidestableci').Value:= sdqEmpresaEstab.FieldByName('es_id').AsInteger;
      ParamByName('pidriesgo').Value := FIDRiesgo;
      ParamByName('pesreconf').Value := String(iif (FOrigenAMP, 'N', 'S'));
      Open;

      while not EoF do
      begin
        FEstudio     := sdqEstudiosRiesgo.FieldByName ('er_estudio').AsString;
        FValorEstudio:= sdqEstudiosRiesgo.FieldByName ('pd_valor').AsFloat;
        FPeriodicidad:= sdqEstudiosRiesgo.FieldByName ('er_periodicidad').AsString;

        AgregarEstudioEnDetalleLote;

        Next
      end;

      Close
    end
  end;
begin
  case tsSelEstudios.ActivePageIndex of
    0: VerificarMultiple (['Agregar trabajador',
                           grdTrabActivos,
                           grdTrabActivos.SelCount > 0,
                           'Debe seleccionar solamente un trabajador para asociar varios riesgos.',
                           grdRiesgos,
                           grdRiesgos.SelCount > 0,
                           'Debe seleccionar al menos un riesgo.']);

    1: VerificarMultiple (['Agregar trabajador(es)',
                           grdTrabActivos,
                           grdTrabActivos.SelCount > 0,
                           'Debe seleccionar al menos un trabajador.',
                           grdTrabActivos,
                           clbListaEstudios.Visible,
                           'No hay estudios seleccionables.',
                           clbListaEstudios,
                           clbListaEstudios.CheckCount > 0,
                           'Debe seleccionar al menos un estudio.']);

    2: VerificarMultiple (['Agregar trabajador',
                           grdTrabActivos,
                           grdTrabActivos.SelCount > 0,
                           'Debe seleccionar solamente un trabajador para duplicar los estudios de otro trabajador.',
                           fraTrabADuplicar,
                           fraTrabADuplicar.IsSelected and (not fraTrabADuplicar.IsEmpty),
                           'Debe indicar el trabajador de referencia para duplicar sus estudios.']);
  end;

  // acá viene el quilombete
  try
    BeginTrans;
    try
      FIDLote      := sdqEmpresaEstab.FieldByName('le_id').AsInteger;
      FCUIT        := sdqEmpresaEstab.FieldByName('em_cuit').AsString;
      FIDEstableci := sdqEmpresaEstab.FieldByName('es_id').AsInteger;
      FNroEstableci:= sdqEmpresaEstab.FieldByName('es_nroestableci').AsInteger;

      FIDEmpresa   := sdqEmpresaEstab.FieldByName('em_id').AsInteger;

      FFechaCarga := sdqEmpresaEstab.FieldByName('rl_fecha').AsDateTime;
      FFechaAlta  := DBDateTime;

(*
      FFechaCarga  := ValorSql ('SELECT ur_fecharelev ' +
                                '  FROM hys.hur_ultimorelevamiento ' +
                                ' WHERE ur_cuit = ' + SqlValue (FCUIT) +
                                '   AND ur_estableci =' + SqlValue (FNroEstableci));

      FFechaAlta   := ValorSql ('SELECT TRUNC(ur_fechaaltarelev) ' +
                                '  FROM hys.hur_ultimorelevamiento ' +
                                ' WHERE ur_cuit = ' + SqlValue (FCUIT) +
                                '   AND ur_estableci = ' + SqlValue (FNroEstableci));
*)

      // analizo qué tipo de estudios debo generar
      case tsSelEstudios.ActivePageIndex of
        0: begin // por Riesgos
          FIDTrabajador:= sdqTrabActivos.FieldByName('tj_id').AsInteger;
          FCUIL        := sdqTrabActivos.FieldByName('tj_cuil').AsString;

          for i := 0 to grdRiesgos.SelCount - 1 do
          begin
            grdRiesgos.GotoSelection (i);

            FIDRiesgo   := sdqRiesgos.FieldByname('rg_id').AsInteger;
            FCodRiesgo  := sdqRiesgos.FieldByname('rg_codigo').AsString;
            FNombreTrab := sdqTrabActivos.FieldByName('tj_nombre').AsString;

            // Agrego en prt_riestrab
            AgregarEnRiesTrab;

            // Agrego los estudios del riesgo detalle del lote
            AgregarEstudiosEnDetalleLote;
          end
        end;

        1: begin // por selección de estudios
          for t := 0 to grdTrabActivos.SelCount - 1 do
          begin
            grdTrabActivos.GotoSelection (t);

            for i := 0 to clbListaEstudios.Items.Count-1 do
              if clbListaEstudios.Checked[i] then
              begin
                FIDTrabajador:= sdqTrabActivos.FieldByName('tj_id').AsInteger;
                FEstudio     := clbListaEstudios.Values[i];
                FValorEstudio:= ValorSql ('SELECT art.amp.get_costo_estudio(' + SqlInteger(sdqConsulta.FieldByName('ca_identificador').AsInteger) + ',' +
                                                                                SqlInteger(sdqEmpresaEstab.FieldByName('es_id').AsInteger) + ',' +
                                                                                SqlValue(FEstudio) + ', art.actualdate, ' +
                                                                                SqlValue(String(iif (FOrigenAMP, 'N', 'S'))) +  ') FROM DUAL');
                FPeriodicidad:= '0';

                AgregarEstudioEnDetalleLote;
              end
          end;

          grdTrabActivos.UnselectAll;
          clbListaEstudios.ClearChecks
        end;

        2: begin // duplicar estudios de otro trabajador
          FIDTrabajador:= sdqTrabActivos.FieldByName('tj_id').AsInteger;
          FCUIL        := sdqTrabActivos.FieldByName('tj_cuil').AsString;
          FNombreTrab := sdqTrabActivos.FieldByName('tj_nombre').AsString;

          with sdqRiesgosReferencia do
          begin
            Close;
            ParamByName ('pcuit').Value := FCUIT;
            ParamByName ('pidestableci').Value := FNroEstableci;//FIDEstableci;
            ParamByName ('pfechacarga').Value := FFechaCarga;
            ParamByName ('pcuil').Value := fraTrabADuplicar.Codigo;
            Open;

            while not EoF do
            begin
              FIDRiesgo    := sdqRiesgosReferencia.FieldByname('rt_idrg').AsInteger;
              FCodRiesgo   := sdqRiesgosReferencia.FieldByname('rt_riesgo').AsString;

              // Agrego en prt_riestrab
              AgregarEnRiesTrab;

              // Agrego los estudios del riesgo detalle del lote
              AgregarEstudiosEnDetalleLote;

              Next
            end;

            Close
          end;
        end
      end;

      EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                    '   SET le_monto = (SELECT NVL(SUM(dl_monto), 0) ' +
                    '                     FROM hys.hdl_detallelote ' +
                    '                    WHERE dl_idlote = le_id), ' +
                    '       le_fechamodif = SYSDATE, ' +
                    '       le_usumodif = ' + SqlValue (frmPrincipal.DBLogin.UserID) +
                    ' WHERE le_id = ' + SqlValue (FIDLote));

      CommitTrans;
      if sdqTrabActivos.Active then
        sdqTrabActivos.Refresh
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg (E, 'Error al incorporar trabajador(es) al lote de estudios');
      end;
    end;
  finally
    grdTrabActivos.UnselectAll;
    grdRiesgos.UnselectAll;
    if sdqRiesgos.Active then
      sdqRiesgos.Refresh;
    if sdqTrabActivos.Active then
      sdqTrabActivos.Refresh;
    if sdqTrabajadores.Active then
      sdqTrabajadores.Refresh;
  end;
end;

procedure TfrmSeguimientoLote.tbOrdenarTrabActClick(Sender: TObject);
begin
  ordTrabActivos.Execute
end;

procedure TfrmSeguimientoLote.sdqTrabActivosAfterScroll(DataSet: TDataSet);
begin
  with sdqRiesgos do
  begin
    Close;

//    ParamByName('pcontrato').Value  := sdqConsulta.FieldByName ('contrato').AsString;
    ParamByName('pcuit').Value      := sdqEmpresaEstab.FieldByName ('em_cuit').AsString;
    ParamByName('pestableci').Value := sdqEmpresaEstab.FieldByName ('es_nroestableci').AsInteger;
    ParamByName('pcuil').Value      := sdqTrabActivos.FieldByName('tj_cuil').AsString;

    Open
  end;

  with fraTrabADuplicar do
  begin
    ShowBajas := true;
    Clear;
    Propiedades.SQL := 'SELECT DISTINCT tj_id as id, tj_cuil as codigo, tj_nombre as descripcion, null as baja ' +
                       '           FROM hys.hle_loteestudio, hys.hdl_detallelote, ' +
                       '                comunes.ctj_trabajador ' +
                       '          WHERE dl_fechabaja IS NULL ' +
                       '            AND dl_idlote = le_id ' +
                       '            AND tj_id = dl_idtrabajador ' +
                       '            AND dl_idtrabajador <>  ' + SqlValue (sdqTrabActivos.FieldByName('tj_id').AsString) +
                       '            AND le_id =  ' + SqlValue (sdqConsulta.FieldByName ('le_id').AsString);
  end
end;

procedure TfrmSeguimientoLote.tbOrdenarTrabLoteClick(Sender: TObject);
begin
  ordTrabajadores.Execute
end;

procedure TfrmSeguimientoLote.GenerarPqDatosPrestador(pLote: Integer; pPrestador, pListaEMail: String);
var
  NroPedido: Integer;
  IDPedidoWEB: Integer;
  rptInformeAPrestador: TrptInformeAPrestador;
  rptInfPrestadorReconf: TrptInfPrestadorReconf;
  FDirectorioEMail,
  FListaMail: String;
begin
  FListaMail := pListaEMail;

  GenerarListaEMail (FListaMail);
  if FListaMail = '' then
    Exit;

  EjecutarSql('UPDATE hys.hle_loteestudio ' +
              '   SET le_fechanotificacion = TRUNC(SYSDATE), ' +
              '       le_usunotificacion = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
              ' WHERE le_fechanotificacion IS NULL' +
              '   AND le_id = ' + SqlValue (pLote));

  with sdqDatosPQ do
  begin
    sdqDatosPQ.Close;
    ParamByName('le_id').Value := pLote;
    Open;

    FDirectorioEMail := IncludeTrailingPathDelimiter(ValorSql('SELECT tb_especial1 ' +
                                                              '  FROM art.ctb_tablas ' +
                                                              ' WHERE tb_clave = ''PATHS'' ' +
                                                              '   AND tb_codigo = ''005'' '));

    if FOrigenAMP then
    begin
      rptInformeAPrestador := TrptInformeAPrestador.Create( Self );
      try
        rptInformeAPrestador.FIDLoteRpt := pLote;
        ExportarPDF(rptInformeAPrestador.qrInformeAPrestador, FDirectorioEMail + Format('LOTE %d.pdf',[pLote]));
      finally
        rptInformeAPrestador.Free;
      end
    end
    else begin
      rptInfPrestadorReconf := TrptInfPrestadorReconf.Create( Self );
      try
        rptInfPrestadorReconf.FIDLoteRpt := pLote;
        ExportarPDF(rptInfPrestadorReconf.qrInformeAPrestador, FDirectorioEMail + Format('LOTE %d.pdf',[pLote]));
      finally
        rptInfPrestadorReconf.Free;
      end
    end;

    // Obtengo el nro. de Pedido
    NroPedido := GetSecNextVal('hys.seq_hpr_id');

    // Inserto el nuevo pedido
    EjecutarSql(
      'INSERT INTO hys.hpr_pedidosreporte(pr_id, pr_emailrespuesta, pr_fechaalta, pr_usualta, pr_origenpedido, pr_asunto) ' +
      'VALUES (' + SqlValue(NroPedido) + ', ' + SqlValue(FListaMail) +
      ', sysdate, ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' + SqlValue('A') + ', ' +
      iif(FOrigenAMP, SqlValue ('Estudios Periódicos - ' + FieldByName('em_nombre').AsString), SqlValue ('Reconfirmación de estudios - ' + FieldByName('em_nombre').AsString)) + ')'
    );

    while not EoF do
    begin
      // AMP
      IDPedidoWEB := GetSecNextVal ('hys.seq_hpw_id');
      EjecutarSql(
        'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
        'VALUES (' + SqlValue (IDPedidoWEB) + ', ' + iif(FOrigenAMP, SqlValue (101), SqlValue (179)) + ', sysdate, ' +
        SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' + SqlValue(NroPedido) + ')'
      );

      // Inserto parámetro Lote
      EjecutarSql(
        'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE, PP_IDPEDIDOWEB) ' +
        'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('LOTEFILTRO') + ', ' +
        SqlValue (pLote) + ', ' + SqlValue(NroPedido) + ', ' + SqlValue (IDPedidoWEB) + ')'
      );

      // Inserto parámetro IDEmpresa
      EjecutarSql(
        'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE, PP_IDPEDIDOWEB) ' +
        'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('IDEMPRESAFILTRO') + ', ' +
        SqlValue (FieldByName('dl_idempresa').AsInteger) + ', ' + SqlValue(NroPedido) + ', ' + SqlValue (IDPedidoWEB) + ')'
      );

      // Inserto parámetro e-Mail
      EjecutarSql(
        'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE, PP_IDPEDIDOWEB) ' +
        'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('EMAILFILTRO') + ', ' +
        SqlValue (FListaMail) + ', ' + SqlValue(NroPedido) + ', ' + SqlValue (IDPedidoWEB) + ')'
      );

      Next
    end;

    sdqDatosPQ.Close
  end
end;


procedure TfrmSeguimientoLote.fpMotivoBajaShow(Sender: TObject);
begin
  fraMotivosBaja.Clear
end;

procedure TfrmSeguimientoLote.btnAceptarBajaClick(Sender: TObject);
begin
  VerificarMultiple (['Baja del Trabajador',
                      fraMotivosBaja,
                      fraMotivosBaja.IsSelected,
                      'Debe indicar el Motivo de la Baja']);

  fpMotivoBaja.ModalResult := mrOk;
end;

procedure TfrmSeguimientoLote.mnuNotificaraPrestadorClick(Sender: TObject);
var
  i: integer;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');


  sdqConsulta.DisableControls;

  try
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      tbRefrescarEstabClick(Sender);

      VerificarMultiple (['Notificar al Prestador',
                          Grid,
                          not AreIn(sdqConsulta.FieldByName('le_estado').AsString, ['T', 'R' ,'N', 'L']),
                          'La notificación no puede realizarse con el lote en este Estado']);

      try
        GenerarPqDatosPrestador(sdqConsulta.FieldByName('le_id').AsInteger,
                                sdqConsulta.FieldByName('ca_descripcion').AsString,
                                Trim(sdqConsulta.FieldByName('ca_direlectronica').AsString));

      except
        on E: Exception do
          ErrorMsg (E, 'Error en la notificación al Prestador.');
      end
    end;
  finally
    SelectedList.Clear;
    sdqConsulta. EnableControls;
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmSeguimientoLote.mnuNotificaraEmpresaClick(Sender: TObject);
var
  i:integer;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');

  if (fpNotificacionEmpresa.ShowModal = mrOk) and (rgTipoEnvio.ItemIndex <> 4) then
  begin

    sdqEmpresaEstab.DisableControls;
    sdqConsulta.DisableControls;

    try
      for i:=0 to SelectedList.Count-1 do
      begin
        Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        VerificarMultiple (['Notificar a la Empresa',
                            dbgEstabLote,
                            not AreIn(sdqConsulta.FieldByName('le_estado').AsString, ['T', 'P', 'R' ,'N', 'L']),
                            'El lote no está en estado Aprobado']);
        tbRefrescarEstabClick(Sender);

        sdqEmpresaEstab.First;
        while not sdqEmpresaEstab.EoF do
        begin
          if sdqEmpresaEstab.FieldByName('el_fechabaja').IsNull and
             not sdqEmpresaEstab.FieldByName('dl_fechapactada').IsNull then
          begin
            if FOrigenAMP then
              NotificarEmpresaPeriodicosFechaPactada(rgTipoEnvio.ItemIndex, true)
            else
              NotificarEmpresaReconfirmaciones;
          end;
        sdqEmpresaEstab.Next
        end;
      end;
    finally
      SelectedList.Clear;
      sdqEmpresaEstab.EnableControls;
      sdqConsulta.EnableControls;
      sdqConsulta.Refresh;
    end;
  end;
end;

procedure TfrmSeguimientoLote.MantMotivos(CapMotivos, TipoMotivos: String);
var
  frmMotivo: TfrmManMotivosRechazo;
begin
  frmMotivo := TfrmManMotivosRechazo.Create( Self );
  with frmMotivo do
    try
      FormStyle := fsNormal;
      if Visible then
        Hide;
      Caption := CapMotivos;
      FTipo := TipoMotivos;
      tbRefrescarClick(nil);
      ShowModal;
      BringToFront;
    finally
      Free;
    end;
end;

procedure TfrmSeguimientoLote.spbMantRechazoClick(Sender: TObject);
begin
  MantMotivos ('Motivos de Rechazo de Lotes', 'R')
end;

procedure TfrmSeguimientoLote.SpeedButton2Click(Sender: TObject);
begin
  Abrir(TfrmManMotivosBaja, frmManMotivosBaja, tmvModal, frmPrincipal.mnuMotivosBajaTrab);
end;

procedure TfrmSeguimientoLote.tbCambioEstadoClick(Sender: TObject);
begin
  if sdqEmpresaEstab.IsEmpty or (not sdqEmpresaEstab.FieldByName('el_fechabaja').IsNull) then
    Exit;

  if AreIn(sdqEmpresaEstab.FieldByName('el_estado').AsString, ['L', 'N' ,'R']) then
  begin
    MsgBox('Acción no válida en este estado.', MB_ICONERROR + MB_OK);
    Exit
  end;

  FEstado := '';
  fpDatosLote.ShowModal
end;

procedure TfrmSeguimientoLote.spbMantAnulacionClick(Sender: TObject);
begin
  MantMotivos ('Motivos de Anulación de Lotes', 'A')
end;

procedure TfrmSeguimientoLote.mnuNotificaraEmpresaMovilClick(
  Sender: TObject);
var
  rptInformeAEmpresa: TrptInformeMovilSanitario;
  FDirectorioEMail,
  FListaMail: String;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  if not FOrigenAMP then
  begin
    MsgBox('Este tipo de notificación no se emite para un lote de Reconfirmación.', MB_ICONERROR + MB_OK);
    Exit
  end;

  tbRefrescarEstabClick(Sender);

  VerificarMultiple (['Notificar a la Empresa',
                      dbgEstabLote,
                      not AreIn(sdqConsulta.FieldByName('le_estado').AsString, ['T', 'P', 'R' ,'N', 'L']),
                      'El estudio no está en estado Aprobado']);

  FDirectorioEMail := TempPath;

  sdqEmpresaEstab.DisableControls;
  sdqEmpresaEstab.First;

  while not sdqEmpresaEstab.EoF do
  begin
    if sdqEmpresaEstab.FieldByName('el_fechabaja').IsNull and
       (not sdqEmpresaEstab.FieldByName('dl_fechapactada').IsNull) then
    begin
      rptInformeAEmpresa := TrptInformeMovilSanitario.Create( Self );
      try
        with rptInformeAEmpresa do
        begin
          FIDLoteRpt := sdqConsulta.FieldByName('le_id').AsInteger;
          FIDEmpresa := sdqEmpresaEstab.FieldByName('em_id').AsInteger;
          FFechaLimite:= sdqEmpresaEstab.FieldByName('dl_fechapactada').AsString;
          FListaMail := Trim(ValorSql('SELECT dc_mail ' +
                                      '  FROM afi.adc_domiciliocontrato ' +
                                      ' WHERE ROWNUM = 1 ' +
                                      '   AND dc_contrato = ' + SqlValue (sdqEmpresaEstab.FieldByName('contrato').AsInteger)));

          EjecutarSql('UPDATE hys.hle_loteestudio ' +
                      '   SET le_fechanotifiempresa = TRUNC(SYSDATE), ' +
                      '       le_usunotifempresa  = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                      ' WHERE le_fechanotifiempresa IS NULL' +
                      '   AND le_id = ' + SqlValue (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

          // imprimir
          rptInformeAEmpresa.qrInformeAEmpresa.Preview;
(*
          if MsgBox('Desea enviar la Notificación también por e-mail?', MB_ICONQUESTION + MB_YESNO) =   then
          begin
            GenerarListaEMail (FListaMail);
            if FListaMail <> '' then
              FArchivo := FDirectorioEMail + Format('Notif. Lote %d a %s.pdf', [FIDLoteRpt, sdqEmpresaEstab.FieldByName('em_nombre').AsString]);
              FAsunto := 'Notificación de Estudios Médicos Periódicos';

              ExportarPDF(rptInformeAEmpresa.qrInformeAEmpresa, FArchivo);
              SendByMailSender(FListaMail, '', FAsunto, FArchivo, '', False, False);
            end
          end
*)
        end;
      finally
        rptInformeAEmpresa.Free;
      end;
    end;

    sdqEmpresaEstab.Next
  end;
  
  sdqEmpresaEstab.First;
  sdqEmpresaEstab.EnableControls;

  sdqConsulta.Refresh;
end;

procedure TfrmSeguimientoLote.dbgEstabLoteGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if ValorSql(' SELECT ART.AFILIACION.IS_EMPRESAVIP('+sdqEmpresaEstab.FieldByName('CONTRATO').ASSTRING+') FROM DUAL ') = 'S' THEN
    AFont.Color := clPurple;
  if not sdqEmpresaEstab.FieldByName('el_fechabaja').IsNull then
    AFont.Color := clRed


end;

procedure TfrmSeguimientoLote.SpeedButton1Click(Sender: TObject);
begin
  MantMotivos ('Motivos de Terminación de Lotes', 'T')
end;

procedure TfrmSeguimientoLote.tbTotalesRegGrillaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  MsgBox('Cantidad de Lotes de la consulta: ' + IntToStr(sdqConsulta.RecordCount), MB_ICONINFORMATION + MB_OK)
end;

procedure TfrmSeguimientoLote.tbHistoricoClick(Sender: TObject);
begin
  if sdqEmpresaEstab.IsEmpty then
    Exit;

  pnSeleccionHistorico.Visible := False;
  fpHistoricoLote.ShowModal
end;

procedure TfrmSeguimientoLote.fpHistoricoLoteShow(Sender: TObject);
begin
  fpHistoricoLote.Caption := Format ('Datos históricos del Lote %s - Establecimiento %s',
                                     [sdqEmpresaEstab.FieldByName('le_id').AsString,
                                      sdqEmpresaEstab.FieldByName('es_nroestableci').AsString]);
  inherited;
end;

procedure TfrmSeguimientoLote.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName ('le_fechabaja').IsNull then
    AFont.Color := clRed
  else begin
    if not sdqConsulta.FieldByName ('SolInforme').IsNull then
      Background := clGray;
    if AreIn (sdqConsulta.FieldByName ('le_estado').AsString, ['N', 'NT', 'R', 'RT', 'J', 'E', 'ET']) then
      AFont.Color := clTeal;
  end;
end;

procedure TfrmSeguimientoLote.ToolButton2Click(Sender: TObject);
begin
  if sdqTrabajadores.IsEmpty then
    Exit;

  MsgBox('Cantidad de Trabajadores: ' + IntToStr(sdqTrabajadores.RecordCount), MB_ICONINFORMATION + MB_OK)
end;

procedure TfrmSeguimientoLote.ToolButton7Click(Sender: TObject);
begin
  if sdqEmpresaEstab.IsEmpty then
    Exit;

  MsgBox('Cantidad de Establecimientos: ' + IntToStr(sdqEmpresaEstab.RecordCount), MB_ICONINFORMATION + MB_OK)
end;

procedure TfrmSeguimientoLote.tbAgendaObsLoteClick(Sender: TObject);
var
  fObsLote: TfrmObsLote;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  fObsLote := TfrmObsLote.Create( Self );
  try
    fObsLote.Caption := 'Observaciones Adicionales para el Lote Nº ' + sdqConsulta.FieldByName('le_id').AsString;
    fObsLote.FIDLote := sdqConsulta.FieldByName('le_id').AsInteger;
    fObsLote.tbRefrescarClick(Sender);
    Abrir(TfrmObsLote, fObsLote, tmvModal, nil);
  finally
    fObsLote.Free;
  end;
end;

procedure TfrmSeguimientoLote.tbRefrescarEstabClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  sdqHistLotes.Close;
  sdqEmpresaEstab.Close;
  sdqTrabajadores.Close;

  sdqEmpresaEstab.Sql.Clear;
  sdqEmpresaEstab.Sql.Text := 'SELECT DISTINCT el_id, le_id, el_rlid, rl_fecha, em_id, em_cuit, em_nombre, es_id, ' +
                              '                es_nroestableci, es_nombre, el_estado, ' +
                              '                art.afiliacion.get_contratovigente(em_cuit) AS contrato, ' +
                              '                (SELECT de_descripcion ' +
                              '                  FROM hys.hde_descripcionestadolote ' +
                              '                  WHERE de_codigo = el_estado) estado, ' +
                              '                TRUNC(el_fechaterminado) el_fechaterminado, ' +
                              '                el_fechabaja, TRUNC(el_fechaaprobado), el_fecharechazo, ' +
                              '                NVL(el_fechaanulado, TRUNC(el_fechabaja)) el_fechaanulado, ' +
                              '                el_fecharecibido, ' +
                              '                NVL(mr_descripcion, ' +
                              '                    (SELECT de_descripcion ' +
                              '                       FROM hys.hde_descripcionestadolote ' +
                              '                      WHERE de_codigo = el_estado)) mr_descripcion, ' +
                              '                el_fechapactada dl_fechapactada, el_operativo tipooperativo, ' +
                              '                DECODE(el_operativo, ''A'', ''Anual'', ''S'', ''Semestral'', ''R'', ''Reconfirmación'', ''N/D'') el_operativo, ' +
                              '                (SELECT COUNT(*) ' +
                              '                   FROM hys.hlc_lotecartadoc ' +
                              '                  WHERE lc_idestableci = es_id ' +
                              '                    AND lc_idlote = le_id) cantcd, ' +
                              '                (SELECT MAX(ca_fechaalta) ' +
                              '                   FROM hys.hlc_lotecartadoc, cca_carta ' +
                              '                  WHERE ca_id = lc_idcarta ' +
                              '                    AND lc_idestableci = es_id ' +
                              '                    AND lc_idlote = le_id) fecha_cartadoc, el_fcda, el_fecharecepucap, '+
                              '                (SELECT MAX (os_fecharecepcionucap) '+
                              '                   FROM hys.hos_observacionessublote '+
                              '                  WHERE os_idlote = le_id '+
                              '                    AND os_idestableci = es_id '+
                              '                    AND os_fechabaja is null ' +
                              '                    AND os_fecha = el_fecharecibido) AS fecharecepucap, ' +
                              '                (SELECT max(os_idproceso) '+
                              '                   FROM hys.hos_observacionessublote hos '+
                              '                  WHERE os_idlote = le_id '+
                              '                    AND os_idestableci = es_id '+
                              '                    AND os_fecha = el_fecharecibido '+
                              '                    AND os_fechabaja is null ' +
                              '                    AND os_fecharecepcionucap = '+
                              '                          (SELECT MAX (os_fecharecepcionucap) '+
                              '                             FROM hys.hos_observacionessublote hos2 '+
                              '                            WHERE hos2.os_idlote = hos.os_idlote '+
                              '                              AND hos2.os_idestableci = hos.os_idestableci '+
                              '                              AND os_fechabaja is null ' + 
                              '                              AND hos2.os_fecha = hos.os_fecha)) idproceso, '+
                              '                   decode(el_idcartacitesp, null, ''No'', ''Si'') citacionesp '+
                              '           FROM hys.hle_loteestudio, hys.hdl_detallelote, ' +
                              '                hys.hrl_relevamientolote, afi.aem_empresa, ' +
                              '                afi.aes_establecimiento, hys.hel_estadolote, ' +
                              '                hys.hmr_motivorechazo ' +
                              '          WHERE dl_idlote = le_id ' +
                              '            AND rl_idestableci = dl_idestableci ' +
                              '            AND em_id = dl_idempresa ' +
                              '            AND es_id = dl_idestableci ' +
                              '            AND el_rlid = rl_id ' +
                              '            AND mr_id(+) = el_idmotivo ' +
                              '            AND rl_fecha = el_fecharelevamiento '+
                              '            AND le_id = ' + SqlValue(sdqConsulta.FieldByName('le_id').AsInteger) +
                              '            AND el_idlote = le_id ';
  if fraEmpresa.IsSelected then
    sdqEmpresaEstab.Sql.Add ('            AND em_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text));
  if fraEstablecimiento.IsSelected then
    sdqEmpresaEstab.Sql.Add ('            AND es_nroestableci = ' + fraEstablecimiento.edCodigo.TextSql);
  if cbEstadoSubLoteFiltro.ItemIndex >= 0 then
    sdqEmpresaEstab.Sql.Add ('            AND el_estado LIKE ' + SqlValue(cbEstadoSubLoteFiltro.Value + '%'));
  if FACerrar then
    sdqEmpresaEstab.Sql.Add ('            AND el_fechapactada < art.actualdate ');

  sdqEmpresaEstab.Open;
  sdqHistLotes.Open;

  inherited;
end;

procedure TfrmSeguimientoLote.ToolButton10Click(Sender: TObject);
begin
  if sdqEmpresaEstab.IsEmpty then
    Exit;

  with sdqTrabajadores do
  begin
    Close;

    ParamByName('em_cuit').Value:= sdqEmpresaEstab.FieldByName('em_cuit').AsString;
    ParamByName('es_nroestableci').Value := sdqEmpresaEstab.FieldByName('es_nroestableci').AsString;
    ParamByName('le_id').Value  := sdqEmpresaEstab.FieldByName('le_id').AsString;
    ParamByName('em_id').Value  := sdqEmpresaEstab.FieldByName('em_id').AsString;
    ParamByName('es_id').Value  := sdqEmpresaEstab.FieldByName('es_id').AsString;

    Open
  end;

  inherited;
end;

procedure TfrmSeguimientoLote.sdqEmpresaEstabAfterScroll(
  DataSet: TDataSet);
begin
  sdqTrabajadores.Close;
end;

procedure TfrmSeguimientoLote.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  sdqEmpresaEstab.Close;
  sdqTrabajadores.Close;
end;

procedure TfrmSeguimientoLote.tbAgendaObsSubLoteClick(Sender: TObject);
var
  fObsSubLote: TfrmObsSubLote;
begin
  if sdqEmpresaEstab.IsEmpty then
    Exit;

  fObsSubLote := TfrmObsSubLote.Create( Self );
  try
    fObsSubLote.Caption := 'Obs. Lote Nº ' + sdqConsulta.FieldByName('le_id').AsString +
                           ' - CUIT ' + sdqEmpresaEstab.FieldByName('em_cuit').AsString +
                           ' - Est. ' + sdqEmpresaEstab.FieldByName('es_nroestableci').AsString;
    fObsSubLote.FIDLote := sdqConsulta.FieldByName('le_id').AsInteger;
    fObsSubLote.FIDEstableci := sdqEmpresaEstab.FieldByName('es_id').AsInteger;
    fObsSubLote.tbRefrescarClick(Sender);
    Abrir(TfrmObsSubLote, fObsSubLote, tmvModal, nil);
  finally
    fObsSubLote.Free;
  end;
end;

procedure TfrmSeguimientoLote.mnuCartaDocNoPresentacionEmpresaClick(
  Sender: TObject);
begin
  if sdqEmpresaEstab.IsEmpty or (not sdqEmpresaEstab.FieldByName('el_fechabaja').IsNull) then
    Exit;

  VerificarMultiple (['Carta Documento a Empresa',
                      dbgEstabLote,
                      not sdqEmpresaEstab.FieldByName('dl_fechapactada').IsNull,
                      'El lote aún no ha sido Aprobado por el Prestador',
                      dbgEstabLote,
                      AreIn (sdqEmpresaEstab.FieldByName('el_estado').AsString, ['A', 'V']),
                      'No corresponde emitir una Carta Documento en este estado'
                     ]);

  edNuevaFPactada.Clear;
  if fpNuevaFPactada.ShowModal = mrOk then
    with TfrmGeneracionCartasAdmin.Create(Self) do
    try
      fraEmpresa.ShowBajas := true;
      fraEmpresa.ExtraCondition := ' AND CO_ESTADO IN (1, 9) ';
      IdEmpresa := sdqEmpresaEstab.FieldByName('em_id').AsInteger;
      IDEstableci := sdqEmpresaEstab.FieldByName('es_id').AsInteger;
      IDLote := sdqConsulta.FieldByName('le_id').AsInteger;
      IdCarta := ART_EMPTY_ID;

      CodArea := AREA_MLB;
      Preparar(IdCarta);

      Mostrar;

      if FCartaGenerada then
        EjecutarSql('UPDATE hys.hel_estadolote ' +
                      '   SET el_estado = ''D'', ' +
                      '       el_fechapactada = ' + SqlDate(edNuevaFPactada.Date) + ', ' +
                      '       el_fechanotificacion = art.actualdate, ' +
                      '       el_usunotificacion = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                      ' WHERE el_rlid = ' + SqlInteger (sdqEmpresaEstab.FieldByName ('el_rlid').AsInteger) +
                      '   AND el_idlote = ' + SqlInteger (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

      tbRefrescarEstabClick(Sender);
    finally
      free;
    end;
end;

procedure TfrmSeguimientoLote.grdTrabActivosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
(*
  if not sdqTrabActivos.FieldByName('tj_cuil').IsNull then
    AFont.Color := clBlue;

  if Highlight then
  begin
    AFont.Color := clWhite;
    Background := clNavy
  end
*)  
end;

procedure TfrmSeguimientoLote.mnuCDEmitidasClick(Sender: TObject);
var
  frmCartas: TfrmAMPAdministracionCartas;
begin
  if sdqEmpresaEstab.IsEmpty then
    Exit;

  Abrir(TfrmAMPAdministracionCartas, frmCartas, tmvMDIChild, frmPrincipal.mnuAdmCartasDoc);

  with frmCartas do
  begin
    Area := AREA_MLB;
    Caption := 'Administración de Cartas Documento AMP';
    edLote.Value := sdqEmpresaEstab.FieldByName('le_id').AsInteger;
    fraEmpresaDeudora.edContrato.Value := sdqEmpresaEstab.FieldByName('contrato').AsInteger;
    tbRefrescarClick(Sender)
  end
end;

procedure TfrmSeguimientoLote.btnAceptarNuevaFPactadaClick(Sender: TObject);
begin
  VerificarMultiple (['Notificación por Carta Documento',
                      edNuevaFPactada,
                      not edNuevaFPactada.IsEmpty,
                      'Debe indicar la Nueva Fecha Pactada',
                      lblModoSeleccionadoNuevaFecha,
                      (not lblModoSeleccionadoNuevaFecha.Visible) or
                      (lblModoSeleccionadoNuevaFecha.Tag <> -1),
                      'Debe seleccionar un modo de notificación']
                      );

  fpNuevaFPactada.ModalResult := mrOk
end;

procedure TfrmSeguimientoLote.tbLotesACerrarClick(Sender: TObject);
begin
  with TrptLotesACerrar.Create(nil) do
    try
      qryConsulta.Open;
      Visualizar(qrLotesACerrar, GetValores(), [oForceShowModal])
    finally
      qryConsulta.Close;
      free;
    end;
end;

procedure TfrmSeguimientoLote.sbLotesACerrarClick(Sender: TObject);
begin
  tbLimpiarClick(Sender);

  cbEstadoSubLoteFiltro.Value := 'D';
  FACerrar := true;

  RefreshData;
end;

procedure TfrmSeguimientoLote.sdqTrabajadoresCalcFields(DataSet: TDataSet);
var
  tslEstudios: TStringList;
  sEstudios: String;
  i: integer;
begin
  tslEstudios := ValoresSqlEx('SELECT ' + iif(FOrigenAMP, 'DISTINCT ', '') +
                              '       es_codigo || '' '' || es_descripcion ' +
                              '  FROM hys.hdl_detallelote, art.aes_estudios ' +
                              ' WHERE es_codigo = dl_idestudio ' +
                              '   AND dl_idtrabajador = :idtrabajador ' +
                              '   AND dl_idlote = :idlote ' +
                              'ORDER BY es_codigo || '' '' || es_descripcion ',
                              [sdqTrabajadores.FieldByName ('dl_idtrabajador').AsInteger,
                               sdqEmpresaEstab.FieldByName('le_id').AsInteger]);
  try
    sEstudios := '';
    for i := 0 to tslEstudios.Count - 1 do
      sEstudios := sEstudios + tslEstudios[i] + ', ';

    DataSet.FieldByName('estudios').AsString := sEstudios;
  finally
    tslEstudios.Free;
  end;
end;

procedure TfrmSeguimientoLote.cbEstadoSubLoteFiltroChange(Sender: TObject);
begin
  if cbEstadoSubLoteFiltro.Value <> 'D' then
    FACerrar := false;
end;

procedure TfrmSeguimientoLote.mnuResumendeLotesClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  tbExportar.Enabled := False;
  try
    ExportDialog.DataSet := sdqConsulta;
    ExportDialog.Fields.Assign(Grid.Columns);
    ExportDialog.Fields.Delete(ExportDialog.Fields.ItemByName['SELECTED'].Index);
    ExportDialog.Execute;
  finally
    tbExportar.Enabled := True;
  end;
end;

procedure TfrmSeguimientoLote.mnuDetalledeLotesClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  OpenQuery(sdqListado);
  if sdqListado.Active and (not sdqListado.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      ExportDialog.DataSet := sdqListado;
      ExportDialog.Fields.Assign(dbgListado.Columns );
      ExportDialog.Execute;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmSeguimientoLote.tbExportarClick(Sender: TObject);
begin
  mnuResumendeLotesClick(Sender)
end;

procedure TfrmSeguimientoLote.tbAgendaObsAsigLoteClick(Sender: TObject);
var
  fObsAsigLote: TfrmObsAsigLote;
begin
  if sdqEmpresaEstab.IsEmpty then
    Exit;

  fObsAsigLote := TfrmObsAsigLote.Create( Self );
  try
    fObsAsigLote.Caption    := 'Obs. en Asignaciones para el CUIT ' + sdqEmpresaEstab.FieldByName('em_cuit').AsString +
                               ' - Estab. ' + sdqEmpresaEstab.FieldByName('es_nroestableci').AsString;
    fObsAsigLote.FCUIT      := sdqEmpresaEstab.FieldByName('em_cuit').AsString;
    fObsAsigLote.FEstableci := sdqEmpresaEstab.FieldByName('es_nroestableci').AsInteger;
    fObsAsigLote.tbRefrescarClick(Sender);

    Abrir(TfrmObsAsigLote, fObsAsigLote, tmvModal, nil);
  finally
    fObsAsigLote.Free;
  end;
end;

procedure TfrmSeguimientoLote.tbCambioDeEstadoClick(Sender: TObject);
begin
  if sdqEmpresaEstab.IsEmpty then
    Exit;
  pnSeleccionHistorico.Visible := True;

  fpHistoricoLote.ShowModal;
end;

procedure TfrmSeguimientoLote.btnAceptarHistoricoClick(Sender: TObject);
begin
  Verificar(sdqHistLotes.IsEmpty, btnAceptarHistorico, 'Debe seleccionar un histórico.');
  EjecutarSql(
    ' UPDATE hys.hdl_detallelote '+
    '    SET dl_fechabaja = NULL, '+
    '        dl_usubaja = NULL, '+
    '        dl_motivobaja = NULL '+
    '  WHERE dl_idlote = ' + SqlValue(sdqEmpresaEstab.FieldByName ('le_id').AsInteger) +
    '    AND dl_idestableci = ' + SqlValue(sdqEmpresaEstab.FieldByName ('es_id').AsInteger));

  EjecutarSql(
    ' UPDATE hys.hel_estadolote '+
    '    SET (el_estado, el_fechabaja, el_usubaja, el_fechaaprobado, el_usuaprobado, '+
    '         el_fecharechazo, el_usurechazo, el_fechaanulado, el_usuanulado, '+
    '         el_idmotivo, el_fecharecibido, el_usurecibido, el_fechaterminado, '+
    '         el_usuterminado, el_fechareprogramado, el_usureprogramado, '+
    '         el_fechapactada, el_fechanotificacion, el_usunotificacion, '+
    '         el_fechacartadoctrabajadores, el_usucartadoctrabajadores, '+
    '         el_fechacartadocempresa, el_usuariocartadocempresa, el_fcda, el_ffea, '+
    '         el_fechanogestionaus) = '+
    '          (SELECT he_estado, he_fechabaja, he_usubaja, he_fechaaprobado, '+
    '                  he_usuaprobado, he_fecharechazo, he_usurechazo, '+
    '                  he_fechaanulado, he_usuanulado, he_idmotivo, '+
    '                  he_fecharecibido, he_usurecibido, he_fechaterminado, '+
    '                  he_usuterminado, he_fechareprogramado, he_usureprogramado, '+
    '                  he_fechapactada, he_fechanotificacion, he_usunotificacion, '+
    '                  NULL, NULL, NULL, NULL, NULL, NULL, NULL '+
    '             FROM hys.hhe_histestadolote '+
    '            WHERE he_id = '+
    '                    (SELECT MAX (he_id) '+
    '                       FROM hys.hhe_histestadolote hhe '+
    '                      WHERE he_rlid =  '+SqlValue(sdqEmpresaEstab.FieldByName ('el_rlid').AsInteger)+
    '                        AND he_idlote = '+SqlValue(sdqEmpresaEstab.FieldByName ('le_id').AsInteger)+
    '                        AND he_estado = (SELECT de_codigo '+
    '                                           FROM hys.hde_descripcionestadolote '+
    '                                          WHERE de_descripcion = '+SqlValue(sdqHistLotes.FieldByName ('ESTADO').AsString)+')))'+
    '  WHERE el_idlote = '+ SqlValue(sdqEmpresaEstab.FieldByName ('le_id').AsInteger) +
    '  AND el_rlid = ' +  SqlValue(sdqEmpresaEstab.FieldByName ('el_rlid').AsInteger)  );
    
  EjecutarSql(
    ' UPDATE hys.hle_loteestudio '+
    '    SET le_estado = art.amp.get_estado_lote (le_id), '+
    '        le_monto = (SELECT sum(dl_monto) ' +
    '                FROM hys.hdl_detallelote ' +
    '               WHERE dl_idlote = le_id ' +
    '                 AND dl_fechabaja IS NULL) ' +
    ' WHERE le_id = '+SqlValue(sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

  if ValorSqlIntegerEx('SELECT art.amp.get_ultimolote_no_anulado(:idestab) ' +
                    'FROM dual ', [sdqEmpresaEstab.FieldByName('es_id').AsInteger]) = sdqConsulta.FieldByName('le_id').AsInteger then
    EjecutarSqlEx('UPDATE hys.hal_asignacionlote ' +
                  '   SET al_idultsubloteasignado = :pidsublote, ' +
                  '       al_idultsubloteauditado = NULL, ' +
//                  '       al_secuencia = al_secuencia + 1, ' +
                  '       al_usumodif = :pusuario, ' +
                  '       al_fechamodif = SYSDATE ' +
                  ' WHERE al_idempresa = :pidempresa ' +
                  '   AND al_nroestableci = :pnroestableci ',
                  [sdqConsulta.FieldByName('le_id').AsInteger,
                   Sesion.UserID,
                   sdqEmpresaEstab.FieldByName('em_cuit').AsString,
                   sdqEmpresaEstab.FieldByName('es_nroestableci').AsInteger]);

  fpHistoricoLote.Close;
  tbRefrescar.Click;
  tbRefrescarEstab.Click;
end;

procedure TfrmSeguimientoLote.tbListadoRecepcionClick(Sender: TObject);
begin
  Abrir(TfrmListadoRecepcion,frmListadoRecepcion,tmvMDIChild,nil);
end;

procedure TfrmSeguimientoLote.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if SelectedList.IndexOf(sdqConsulta.FieldByName('LE_ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmSeguimientoLote.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmSeguimientoLote.GridCellClick(Column: TColumn);
var
 i :integer;
begin
  inherited;
  if not (sdqConsulta.Active and (not sdqConsulta.IsEmpty)) then Exit;

  if (Column.FieldName = 'SELECTED') then
  begin
    i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('LE_ID').AsString);
    if (i = -1) then
      SelectedList.AddObject(sdqConsulta.fieldbyname('LE_ID').AsString, sdqConsulta.GetBookmark)
    else begin
      {$IFDEF VER150}
      sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
      {$ENDIF}
      SelectedList.Delete(i);
    end;
    Column.Grid.Refresh;
  end;
end;

procedure TfrmSeguimientoLote.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmSeguimientoLote.tbSelectAllClick(Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('LE_ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('LE_ID').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
    sdqConsulta.EnableControls;
    Grid.Refresh;
  end;
end;

procedure TfrmSeguimientoLote.tbUnSelectAllClick(Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
  {$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
  {$ENDIF}
  SelectedList.Clear;
  Grid.Refresh;
end;

procedure TfrmSeguimientoLote.btnModoNotificacionClick(Sender: TObject);
begin
  if fpNotificacionEmpresa.ShowModal = mrOk then
  begin
    lblModoSeleccionado.Tag := rgTipoEnvio.ItemIndex;
    lblModoSeleccionado.Caption := rgTipoEnvio.Items[rgTipoEnvio.ItemIndex];
  end;
end;

procedure TfrmSeguimientoLote.btnModoNotifNuevaFechaClick(Sender: TObject);
begin
  if fpNotificacionEmpresa.ShowModal = mrOk then
  begin
    lblModoSeleccionadoNuevaFecha.Tag := rgTipoEnvio.ItemIndex;
    lblModoSeleccionadoNuevaFecha.Caption := rgTipoEnvio.Items[rgTipoEnvio.ItemIndex];
  end;
end;

procedure TfrmSeguimientoLote.NotificarEmpresaPeriodicosFechaPactada(aModoEnvio: integer; AutoCommit: boolean);
var
  rptInformeAEmpresa: TrptInformeAEmpresa;
  bNotifico: boolean;
begin
  bNotifico := false;
  if AutoCommit then BeginTrans;
  try
    //Carta o Fax
    if (rgTipoEnvio.ItemIndex = 1) or (rgTipoEnvio.ItemIndex = 2) then
    begin
      rptInformeAEmpresa := TrptInformeAEmpresa.Create( Self );
      try
        with rptInformeAEmpresa do
        begin
          FIDLoteRpt   := sdqConsulta.FieldByName('le_id').AsInteger;
          FIDEmpresa   := sdqEmpresaEstab.FieldByName('em_id').AsInteger;
          FNroEstableci:= sdqEmpresaEstab.FieldByName('es_nroestableci').AsInteger;
          FFechaLimite := sdqEmpresaEstab.FieldByName('dl_fechapactada').AsString;
          // imprimir
          rptInformeAEmpresa.qrInformeAEmpresa.Preview;
          bNotifico := true;
        end;
      finally
        rptInformeAEmpresa.Free;
      end;
    end
    else //Mail
      if (rgTipoEnvio.ItemIndex = 0) then
      begin
        if ExisteSqlEx('SELECT 1 ' +
                       'FROM afi.aco_contrato ' +
                       'WHERE co_direlectronica IS NOT NULL ' +
                       'AND co_contrato = :contrato ', [sdqEmpresaEstab.FieldByName('contrato').AsInteger]) then
        begin
          EjecutarStoreStEx('art.intraweb.do_notificarperiodicos(:usuario,:contrato,:idlote,:esreenvio);',
                            [Sesion.UserID, sdqEmpresaEstab.FieldByName('contrato').AsInteger,
                             sdqConsulta.FieldByName('le_id').AsInteger, 'N']);
          bNotifico := true;
        end;
      end;

    if bNotifico then
      EjecutarSqlSt('UPDATE hys.hle_loteestudio ' +
                  '   SET le_fechanotifiempresa = TRUNC(SYSDATE), ' +
                  '       le_usunotifempresa  = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
                  '       le_tiponotifempresa = ' + SqlValue( Decode(IntToStr(rgTipoEnvio.ItemIndex), ['0', '1', '2', '3'], ['M', 'F', 'C', 'V'])) +
                  ' WHERE le_fechanotifiempresa IS NULL' +
                  '   AND le_id = ' + SqlValue (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));


    if AutoCommit then CommitTrans;
  except
    on E: Exception do
    begin
      if AutoCommit then Rollback;
      ErrorMsg (E, 'Error al generar notificación.');
    end;
  end;
end;

procedure TfrmSeguimientoLote.NotificarEmpresaReconfirmaciones;
var
  rptInfEmpresaReconf: TrptInfEmpresaReconf;
begin
  rptInfEmpresaReconf := TrptInfEmpresaReconf.Create( Self );
  try
    with rptInfEmpresaReconf do
    begin
      FIDLoteRpt   := sdqConsulta.FieldByName('le_id').AsInteger;
      FIDEmpresa   := sdqEmpresaEstab.FieldByName('em_id').AsInteger;
      FNroEstableci:= sdqEmpresaEstab.FieldByName('es_nroestableci').AsInteger;
      FFechaLimite := sdqEmpresaEstab.FieldByName('dl_fechapactada').AsString;

      EjecutarSql('UPDATE hys.hle_loteestudio ' +
                  '   SET le_fechanotifiempresa = TRUNC(SYSDATE), ' +
                  '       le_usunotifempresa  = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                  ' WHERE le_fechanotifiempresa IS NULL' +
                  '   AND le_id = ' + SqlValue (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

      // imprimir
      rptInfEmpresaReconf.qrInformeAEmpresa.Preview;
    end;
  finally
    rptInfEmpresaReconf.Free;
  end;
end;

procedure TfrmSeguimientoLote.rgTipoEnvioClick(Sender: TObject);
begin
  if (SelectedList.Count = 1)
      and (rgTipoEnvio.ItemIndex = 0)
      and not ExisteSqlEx('SELECT 1 ' +
                          'FROM afi.aco_contrato ' +
                          'WHERE co_direlectronica IS NOT NULL ' +
                          'AND co_contrato = :contrato ', [sdqEmpresaEstab.FieldByName('contrato').AsInteger]) then
  begin
    rgTipoEnvio.ItemIndex := -1;
    Verificar(true, rgTipoEnvio, 'La empresa seleccionado no tiene Email cargado.');
  end;
end;

procedure TfrmSeguimientoLote.chkNotifFechaPactadaVencidaClick(
  Sender: TObject);
begin
  inherited;
  if chkNotifFechaPactadaVencida.Checked then
  begin
    edFechaNotifPrestHasta.Date :=  IncDay(DBDate, -7);
    cbEstadoLoteFiltro.Value := 'P';
  end
  else begin
    edFechaNotifPrestHasta.Clear;
    cbEstadoLoteFiltro.ItemIndex := -1;
  end;
end;

procedure TfrmSeguimientoLote.chkNotifFechaPresEmpVencidaClick(
  Sender: TObject);
begin
  inherited;
  if chkNotifFechaPresEmpVencida.Checked then
  begin
    edFechaLimitePresHasta.Date :=  IncDay(DBDate, -1);
    cbEstadoLoteFiltro.Value := 'A';
  end
  else begin
    edFechaLimitePresHasta.Clear;
    cbEstadoLoteFiltro.ItemIndex := -1;
  end;
end;

procedure TfrmSeguimientoLote.fpNuevaFPactadaShow(Sender: TObject);
begin
  inherited;
  if FOrigenAMP then
  begin
    lblModoNotificacionFechaNueva.Visible  := false;
    lblModoSeleccionadoNuevaFecha.Visible := false;
    btnModoNotifNuevaFecha.Visible := false;
  end;
end;

procedure TfrmSeguimientoLote.tbCofirmarRecepcionLotePresClick(
  Sender: TObject);
var
  i: integer;
begin
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  edObservacion.Clear;

  if fpObservacion.ShowModal = mrOk then
  begin
    try
      for i:=0 to SelectedList.Count-1 do
      begin
        Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        tbRefrescarEstabClick(Sender);

        sdqEmpresaEstab.First;
        while not sdqEmpresaEstab.EoF do
        begin
          if sdqConsulta.FieldByName('le_fechaconfreceplote').IsNull then
          begin
            BeginTrans;
            EjecutarSqlSt('UPDATE hys.hle_loteestudio ' +
                        '   SET le_fechaconfreceplote = TRUNC(SYSDATE), ' +
                        '       le_usuconfreceplote  = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                        ' WHERE le_id = ' + SqlValue (sdqConsulta.FieldByName ('le_id').AsInteger));
            AgregarObservacion(sdqConsulta.FieldByName ('le_id').AsInteger, sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                               edObservacion.Text,17);
            CommitTrans;
          end;
        sdqEmpresaEstab.Next
        end;
      end;
    finally
      SelectedList.Clear;
      sdqEmpresaEstab.EnableControls;
      sdqConsulta.EnableControls;
      sdqConsulta.Refresh;
    end;
  end;
end;

procedure TfrmSeguimientoLote.mnuNotificarAsignacionClick(Sender: TObject);
var
  i:integer;
begin
  if sdqConsulta.IsEmpty then
    Exit;

  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');

  if (fpNotificacionEmpresa.ShowModal = mrOk) and (rgTipoEnvio.ItemIndex <> 4) then
  begin

    sdqEmpresaEstab.DisableControls;
    sdqConsulta.DisableControls;

    try
      for i:=0 to SelectedList.Count-1 do
      begin
        Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        VerificarMultiple (['Notificar a la Empresa',
                           Grid,
                           not AreIn(sdqConsulta.FieldByName('le_estado').AsString, ['T', 'R' ,'N', 'L']),
                          'La notificación no puede realizarse con el lote en este Estado']);
        tbRefrescarEstabClick(Sender);

        sdqEmpresaEstab.First;
        while not sdqEmpresaEstab.EoF do
        begin
          if FOrigenAMP then
            NotificarEmpresaPeriodicos(sdqConsulta.FieldByName('le_id').AsInteger, sdqEmpresaEstab.FieldByName('contrato').AsInteger, sdqEmpresaEstab.FieldByName('es_id').AsInteger, rgTipoEnvio.ItemIndex);
          sdqEmpresaEstab.Next
        end;
      end;
    finally
      SelectedList.Clear;
      sdqEmpresaEstab.EnableControls;
      sdqConsulta.EnableControls;
      sdqConsulta.Refresh;
    end;
  end;
end;

procedure TfrmSeguimientoLote.fpNotificacionEmpresaShow(Sender: TObject);
begin
  tbRefrescarEstabClick(Sender);
  if (SelectedList.Count <= 1) then
    rgTipoEnvio.Items[0] := 'Email - ' +
                              ValorSqlEx('SELECT nvl(co_direlectronica, ''Sin Email'')' +
                             'FROM afi.aco_contrato ' +
                             'WHERE co_contrato = :contrato ', [sdqEmpresaEstab.FieldByName('contrato').AsInteger], '')
  else
    rgTipoEnvio.Items[0] := 'Email';
end;

procedure TfrmSeguimientoLote.EnviarMailAnulacionLote;
var
  sDireccionDestino, sAsunto, sTexto: String;
begin
  sDireccionDestino := ValorSqlEx(' SELECT ca_direlectronica ' +
                                  ' FROM art.cpr_prestador ' +
                                  ' WHERE ca_identificador = :ID ', [sdqConsulta.FieldByName('ca_identificador').AsString]);
  sAsunto := 'Anulación Lote ' + sdqConsulta.FieldByName('le_id').AsString;

  sTexto := 'Sres. ' + sdqConsulta.FieldByName('ca_descripcion').AsString + #13#10 + #13#10 +
            'Por medio de la presente notificamos que se ha anulado el lote ' + sdqConsulta.FieldByName('le_id').AsString + ' / '  +
            sdqEmpresaEstab.FieldByName('em_nombre').AsString + ' - ' + sdqEmpresaEstab.FieldByName('es_nroestableci').AsString + '.'+  #13#10 + #13#10 +
            'Ante cualquier consulta comunicarse con PROVINCIA ART.' + #13#10 + #13#10 +  #13#10 + #13#10 +  #13#10 +  #13#10 +  #13#10 +
            'Medicina Laboral' + #13#10 +
            'Provincia ART' + #13#10 +
            'medicinalaboral@provart.com.ar' + #13#10 +
            'Tel.: (011) 4335-5100 Int. 5193 / 5202 / 5207 / 5211';

  EnviarMailBD(sDireccionDestino, sAsunto , [oBodyIsRTF], sTexto,nil,0,tcDefault,False);
end;

procedure TfrmSeguimientoLote.mnuAprobarLotesClick(Sender: TObject);
begin
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  FEstado := 'A';
  fpDatosLote.ShowModal;
end;

procedure TfrmSeguimientoLote.ActualizarEstado;
var
  Estado: String;
  idTipoObservacion : Integer;
  bPrimerPresupuesto : Boolean;
  FechaPresup: TDateTime;
  sNumerosdePresupuesto, sDireccionDestino, sAsunto, sTexto: String;
  sEmpresa, sNroEstableci : String;
begin
  BeginTrans;
  try
    EjecutarSqlST('UPDATE hys.hel_estadolote ' +
                  '   SET EL_ESTADO = ' + SqlValue(cbEstado.Value) +

                  iif (cbEstado.Value = 'A', '       ,EL_FECHAAPROBADO = ' + edFechaAprobado.SqlText, '') +
                  iif (cbEstado.Value = 'A', '       ,EL_FECHAPACTADA = ' + edFechaPactada.SqlText, '') +
                  iif (cbEstado.Value = 'A', '       ,EL_USUAPROBADO = '   + SqlValue (frmPrincipal.DBLogin.LoginName), '') +

                  iif (cbEstado.Value = 'R', '       ,EL_FECHABAJA = SYSDATE ', '') +
                  iif (cbEstado.Value = 'R', '       ,EL_USUBAJA = '    + SqlValue (frmPrincipal.DBLogin.LoginName), '') +
                  iif (cbEstado.Value = 'R', '       ,EL_FECHARECHAZO = '  + edFechaRechazo.SqlText, '') +
                  iif (cbEstado.Value = 'R', '       ,EL_USURECHAZO = '    + SqlValue (frmPrincipal.DBLogin.LoginName), '') +
                  iif (cbEstado.Value = 'R', '       ,EL_IDMOTIVO = ' + SqlValue (fraMotivosRechazo.Value), '') +

                  iif (cbEstado.Value = 'N', '       ,EL_FECHABAJA = SYSDATE ', '') +
                  iif (cbEstado.Value = 'N', '       ,EL_USUBAJA = '    + SqlValue (frmPrincipal.DBLogin.LoginName), '') +
                  iif (cbEstado.Value = 'N', '       ,EL_FECHAANULADO = ' + edFechaAnulado.SqlText, '') +
                  iif (cbEstado.Value = 'N', '       ,EL_USUANULADO = '   + SqlValue (frmPrincipal.DBLogin.LoginName), '') +
                  iif (cbEstado.Value = 'N', '       ,EL_IDMOTIVO = ' + SqlValue (fraMotivosAnulacion.Value), '') +

                  iif (cbEstado.Value = 'E', '       ,EL_FECHABAJA = SYSDATE ', '') +
                  iif (cbEstado.Value = 'E', '       ,EL_USUBAJA = '    + SqlValue (frmPrincipal.DBLogin.LoginName), '') +
                  iif (cbEstado.Value = 'E', '       ,EL_FECHAANULADO = ' + edFechaAnulado.SqlText, '') +
                  iif (cbEstado.Value = 'E', '       ,EL_USUANULADO = '   + SqlValue (frmPrincipal.DBLogin.LoginName), '') +
                  iif (cbEstado.Value = 'E', '       ,EL_IDMOTIVO = ' + SqlValue (fraMotivosAnulacion.Value), '') +

                  iif (cbEstado.Value = 'M', '       ,EL_FECHAREPROGRAMADO = ' + edFechaReprogramado.SqlText, '') +
                  iif (cbEstado.Value = 'M', '       ,EL_FECHAPACTADA = ' + edFechaReprogramado.SqlText, '') +
                  iif (cbEstado.Value = 'M', '       ,EL_USUREPROGRAMADO = '   + SqlValue (frmPrincipal.DBLogin.LoginName), '') +

                  iif (cbEstado.Value = 'B', '       ,EL_FECHARECIBIDO = ' + edFechaRecibido.SqlText, '') +
                  iif (cbEstado.Value = 'B', '       ,EL_USURECIBIDO = '   + SqlValue (frmPrincipal.DBLogin.LoginName), '') +

                  iif (cbEstado.Value = 'S', '       ,EL_FECHANOTIFICACION = ' + edFechaNotificacion.SqlText, '') +
                  iif (cbEstado.Value = 'S', '       ,EL_USUNOTIFICACION = ' + SqlValue (frmPrincipal.DBLogin.LoginName), '') +

                  iif (cbEstado.Value = 'I', '       ,EL_FECHANOTIFICACION = ' + edFechaNotificacion.SqlText, '') +
                  iif (cbEstado.Value = 'I', '       ,EL_USUNOTIFICACION = ' + SqlValue (frmPrincipal.DBLogin.LoginName), '') +

                  iif (cbEstado.Value = 'C', '       ,EL_FECHANOTIFICACION = SYSDATE ', '') +
                  iif (cbEstado.Value = 'C', '       ,EL_USUNOTIFICACION = ' + SqlValue (frmPrincipal.DBLogin.LoginName), '') +

                  iif (cbEstado.Value = 'V', '       ,EL_FECHANOTIFICACION = ' + edFechaNotificacion.SqlText, '') +
                  iif (cbEstado.Value = 'V', '       ,EL_USUNOTIFICACION = ' + SqlValue (frmPrincipal.DBLogin.LoginName), '') +

                  ' WHERE el_rlid = ' + SqlInteger (sdqEmpresaEstab.FieldByName ('el_rlid').AsInteger) +
                  '   AND el_idlote = ' + SqlInteger (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

    Estado := ValorSQL ('SELECT art.amp.get_estado_lote (' + SqlInteger (sdqEmpresaEstab.FieldByName ('le_id').AsInteger) + ') FROM dual');
    EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                    '   SET le_fechamodif = SYSDATE, ' +
                    '       le_usumodif = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
                    '       le_estado   = ' + SqlValue (Estado) +
                    ' WHERE le_id = ' + SqlInteger (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

    // Inserto, si existe, observación para seg. del sublote
    if (Trim(edObservaciones.Text) <> '') or (cbEstado.Value = 'B') then
    begin
      case ArrayPos(cbEstado.Value, ['A', 'B']) of
        0: idTipoObservacion := 21;
        1:  begin
              idTipoObservacion := 8;
              if Trim(edObservaciones.Text) = '' then
                edObservaciones.Text := 'Lote recibido.';
            end;
        else
          idTipoObservacion := 1;

      end;

      AgregarObservacion(sdqEmpresaEstab.FieldByName ('le_id').AsInteger,
                        sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                        edObservaciones.Text,
                        idTipoObservacion);

    end;
    if AreIn (cbEstado.Value, ['R', 'N', 'E']) then
    begin
      EjecutarSqlST('UPDATE hys.hdl_detallelote ' +
                    '   SET dl_fechabaja = SYSDATE, ' +
                    '       dl_usubaja = ' + SqlValue (frmPrincipal.DBLogin.LoginName) +
                    ' WHERE dl_idlote = ' + SqlInteger(sdqEmpresaEstab.FieldByName ('le_id').AsInteger) +
                    '   AND dl_idestableci = ' + SqlInteger(sdqEmpresaEstab.FieldByName ('es_id').AsInteger));

      // Calculo el costo total de los estudios
      EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                    '   SET le_monto = (SELECT NVL(SUM(dl_monto), 0) ' +
                    '                     FROM hys.hdl_detallelote ' +
                    '                    WHERE dl_idlote = le_id ' +
                    '                      AND dl_fechabaja IS NULL) ' +
                    ' WHERE le_id = ' + SqlValue (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));
    end;


    EjecutarSqlST('UPDATE hys.hle_loteestudio ' +
                  '   SET le_monto = (SELECT NVL(SUM(dl_monto), 0) ' +
                  '                     FROM hys.hdl_detallelote ' +
                  '                    WHERE dl_idlote = le_id ' +
                  '                      AND dl_fechabaja IS NULL) ' +
                  ' WHERE le_id = ' + SqlValue (sdqEmpresaEstab.FieldByName ('le_id').AsInteger));

    if FOrigenAMP then
    begin
      EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                      '   SET ur_operultlote = art.amp.get_operativoultlote(:pidestableci), ' +
                      '       ur_estadoultlote = art.amp.get_estadoultlote(:pidestableci), ' +
                      '       ur_operproxlote = art.amp.get_operativoproxlote(:pidestableci), ' +
                      '       ur_fechaproxlote = art.amp.get_fechaproxlote(:pidestableci) ' +
                      ' WHERE ur_cuit = :pcuit ' +
                      '   AND ur_estableci = :pnroestableci ',
                      [sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                       sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                       sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                       sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                       sdqEmpresaEstab.FieldByName ('em_cuit').AsString,
                       sdqEmpresaEstab.FieldByName ('es_nroestableci').AsInteger]);

      //Si aprueba o reprograma
      if AreIn (cbEstado.Value, ['A', 'M']) then
        NotificarEmpresaPeriodicosFechaPactada(lblModoSeleccionado.Tag);

      //Si se anula enviamos el mail al prestador
      if (cbEstado.Value = 'N') then
        EnviarMailAnulacionLote;


      if cbEstado.Value = 'N' then
      begin

        EjecutarSqlSTEx('DELETE FROM hys.hro_relevoperativo WHERE ro_idsublote = :idsublote', [sdqEmpresaEstab.FieldByName ('el_id').AsInteger]);

        with GetQuery(
          '   SELECT sp_id, co_contrato, em_cuit, em_nombre, es_nroestableci '+
          '     FROM comunes.csp_solicitudpresupuesto, '+
          '          afi.aco_contrato, afi.aem_empresa, '+
          '          afi.aes_establecimiento '+
          '    WHERE sp_contrato = co_contrato '+
          '      AND es_id = sp_idestablecimiento '+
          '      AND em_id = co_idempresa '+
          '      AND sp_fechabaja IS NULL '+
          '      AND NVL (sp_operativo, ''A'') <> ''R'' '+
          '      AND sp_contrato =  '+SqlValue(sdqEmpresaEstab.FieldByName ('contrato').AsInteger)+
          '      AND sp_idestablecimiento = '+SqlValue(sdqEmpresaEstab.FieldByName ('es_id').AsInteger)+
          '      AND NOT EXISTS (SELECT 1 ' +
          '                        FROM COMUNES.CPP_PRESUPUESTOPRESTADOR ' +
          '                       WHERE PP_IDESTABLECIMIENTO = SP_IDESTABLECIMIENTO ' +
          '                         AND SP_FECHASOLICITUD <= PP_FECHAALTA)'+
          ' ORDER BY 1') do
        begin
          if not IsEmpty then
          begin
            bPrimerPresupuesto := False;
            sEmpresa := FieldByName('em_cuit').AsString+
                        ' - ' + FieldByName('em_nombre').AsString +' ('+
                        FieldByName('co_contrato').AsString+ ')';
            sNroEstableci := FieldByName('es_nroestableci').AsString;
            while not Eof do
            begin
              if not bPrimerPresupuesto then
              begin
                sNumerosdePresupuesto := FieldByName('sp_id').AsString;
                bPrimerPresupuesto := True;
              end
              else
                sNumerosdePresupuesto := sNumerosdePresupuesto +', '+FieldByName('sp_id').AsString;
              Next;
            end;
            sDireccionDestino := ValorSql(
              ' SELECT art.varios.get_direccionesenviomail(''AMP_SOLPRE'') '+
              '   FROM dual ');
            sAsunto := 'Baja de Solicitud de Presupuesto';
            sTexto := ' Empresa: '+sEmpresa+ #13#10+
                      ' Establecimiento: '+ sNroEstableci + #13#10 +
                      ' Motivo: Por Anulacion de Lote'+ #13#10+
                      ' Solicitud de Presupuestos: '+sNumerosdePresupuesto+ #13#10;

            EnviarMailBD(sDireccionDestino, sAsunto , [oBodyIsRTF], sTexto,nil,0,tcDefault,False);
          end;
        end;



        EjecutarSqlST(
          ' UPDATE comunes.csp_solicitudpresupuesto '+
          '    SET sp_fechabaja = SYSDATE, '+
          '        sp_usubaja = '+SqlValue(Sesion.UserID)+
          '  WHERE sp_fechabaja IS NULL '+
          '    AND NVL(sp_operativo, ''A'') <> ''R'' '+
          '    AND sp_contrato = '+SqlValue(sdqEmpresaEstab.FieldByName ('contrato').AsInteger)+
          '    AND sp_idestablecimiento =  ' +SqlValue(sdqEmpresaEstab.FieldByName ('es_id').AsInteger)+
          '      AND NOT EXISTS (SELECT 1 ' +
          '                        FROM COMUNES.CPP_PRESUPUESTOPRESTADOR ' +
          '                       WHERE PP_IDESTABLECIMIENTO = SP_IDESTABLECIMIENTO ' +
          '                         AND SP_FECHASOLICITUD <= PP_FECHAALTA)');
      end;

      // Recupera fecha del último presupuesto en caso que corresponda
      // según el nuevo estado
      if (ValorSqlEx('SELECT NVL(de_recuperaultpresup, ''N'') ' +
                     '  FROM hys.hde_descripcionestadolote ' +
                     ' WHERE de_codigo = :pcodigo ',
                     [cbEstado.Value]) = 'S') then
      begin
        if ExisteSQLEx ('SELECT 1 ' +
                        '  FROM comunes.csp_solicitudpresupuesto ' +
                        ' WHERE sp_contrato = :pcontrato ' +
                        '   AND sp_fechabaja IS NULL '+
                        '   AND NVL(sp_operativo, ''A'') <> ''R'' '+
                        '   AND sp_idestablecimiento = :pidestableci ' +
                        '   AND sp_operativo = :poperativo ',
                        [sdqEmpresaEstab.FieldByName ('contrato').AsInteger,
                         sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                         sdqEmpresaEstab.FieldByName ('tipooperativo').AsString]) then
          FechaPresup := ValorSqlDateTimeEx('SELECT MAX(sp_fechasolicitud) ' +
                                            '  FROM comunes.csp_solicitudpresupuesto ' +
                                            ' WHERE sp_contrato = :pcontrato ' +
                                            '   AND sp_fechabaja IS NULL '+
                                            '   AND NVL(sp_operativo, ''A'') <> ''R'' '+
                                            '   AND sp_idestablecimiento = :pidestableci ' +
                                            '   AND sp_operativo = :poperativo ',
                                            [sdqEmpresaEstab.FieldByName ('contrato').AsInteger,
                                             sdqEmpresaEstab.FieldByName ('es_id').AsInteger,
                                             sdqEmpresaEstab.FieldByName ('tipooperativo').AsString])
        else
          FechaPresup := ValorSqlDateTimeEx('SELECT MAX(sp_fechasolicitud) ' +
                                            '  FROM comunes.csp_solicitudpresupuesto ' +
                                            ' WHERE sp_contrato = :pcontrato ' +
                                            '   AND sp_fechabaja IS NULL '+
                                            '   AND NVL(sp_operativo, ''A'') <> ''R'' '+
                                            '   AND sp_idestablecimiento = :pidestableci ',
                                            [sdqEmpresaEstab.FieldByName ('contrato').AsInteger,
                                             sdqEmpresaEstab.FieldByName ('es_id').AsInteger]);

        EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                        '   SET ur_fechaultsolpresup = ' + SqlDateTime(FechaPresup) +
                        ' WHERE ur_cuit = :pcuit ' +
                        '   AND ur_estableci = :pnroestableci ',
                        [sdqEmpresaEstab.FieldByName ('em_cuit').AsString,
                         sdqEmpresaEstab.FieldByName ('es_nroestableci').AsInteger])
      end
    end
    else begin
      if (AreIn (cbEstado.Value, ['R', 'N'])) and
         (MsgBox('Desea que los estudios del lote rechazado/anulado puedan ' +
                 'reasignarse nuevamente desde Reconfirmaciones?',
                 MB_ICONQUESTION + MB_YESNO) = mrYes)  then
        EjecutarSQLSTEx('UPDATE hys.hgr_gestionreconfirmacion ' +
                        '   SET gr_idlote = NULL ' +
                        ' WHERE gr_estado = ''AP'' ' +
                        '   AND gr_enfprofesional = ''N'' ' +
                        '   AND gr_fechabaja IS NULL ' +
                        '   AND gr_idlote = :pidlote ' +
                        '   AND EXISTS (SELECT 1 ' +
                        '                 FROM hys.hdl_detallelote ' +
                        '                WHERE dl_id = gr_iddetallelote ' +
                        '                      AND dl_idestableci = :pidestableci) ',
                        [sdqEmpresaEstab.FieldByName ('le_id').AsInteger,
                         sdqEmpresaEstab.FieldByName ('es_id').AsInteger]);
    end;

    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg (E, 'Error al cambiar el Estado');
    end
  end
end;

procedure TfrmSeguimientoLote.mnuAnularLotesClick(Sender: TObject);
begin
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  FEstado := 'N';
  fpDatosLote.ShowModal;
end;

procedure TfrmSeguimientoLote.SetFOrigenAMP(const Value: Boolean);
begin
  FOrigen := Value;
  if not FOrigen then
  begin
    mnuNotificarAsignacion.Visible := false;
    tbCofirmarRecepcionLotePres.Visible := false;
    tbCambiarEstadoSublote.Visible := false;
    mnuNotifCitEspecialista.Visible := true;
    mnuNotificaraEmpresa.Caption := 'Notificar a Empresa asignación de Prestador';
    Grid.ColumnByField['le_fechanotifiempresa'].Title.Caption := 'F.Notif.Asig.Empresa';
    Grid.ColumnByField['desctiponotifasig'].Visible := False;
    Grid.ColumnByField['le_fechanotifasig'].Visible := False;
    Grid.ColumnByField['desctiponotif'].Visible := False;
  end;
end;

procedure TfrmSeguimientoLote.mnuNotifCitEspecialistaClick(
  Sender: TObject);
begin
  tbRefrescarEstabClick(Sender);

  if sdqEmpresaEstab.IsEmpty or (not sdqEmpresaEstab.FieldByName('el_fechabaja').IsNull) then
    Exit;

  VerificarMultiple (['Carta Documento a Empresa',
                      dbgEstabLote,
                      not AreIn (sdqEmpresaEstab.FieldByName('el_estado').AsString, ['T', 'R' ,'N', 'L']),
                      'No corresponde emitir una Carta Documento en este estado'
                     ]);

  with TfrmGeneracionCartasAdmin.Create(Self) do
  try
    fraEmpresa.ShowBajas := true;
    fraEmpresa.ExtraCondition := ' AND CO_ESTADO IN (1, 9) ';
    IDEmpresa := sdqEmpresaEstab.FieldByName('em_id').AsInteger;

    IDEstableci := sdqEmpresaEstab.FieldByName('es_id').AsInteger;
    IDLote := sdqConsulta.FieldByName('le_id').AsInteger;
    IdCarta := ART_EMPTY_ID;

    CodArea := AREA_MLB;
    Preparar(IdCarta);

    Mostrar;

    if FCartaGenerada then
      EjecutarSqlEx('UPDATE hys.hel_estadolote ' +
                    '   SET el_idcartacitesp = :idcarta ' +
                    ' WHERE el_rlid = ' + SqlInteger (sdqEmpresaEstab.FieldByName ('el_rlid').AsInteger) +
                    '   AND el_idlote = ' + SqlInteger (sdqEmpresaEstab.FieldByName ('le_id').AsInteger), [IdCarta]);

    tbRefrescarEstabClick(Sender);

  finally
    free;
  end;
end;

procedure TfrmSeguimientoLote.sdqConsultaSELECTEDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if (SelectedList.IndexOf(sdqConsulta.fieldbyname('LE_ID').AsString) <> -1) then
    Text := 'S'
  else
    Text := '';
end;

end.

