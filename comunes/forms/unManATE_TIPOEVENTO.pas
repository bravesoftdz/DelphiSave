unit unManATE_TIPOEVENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  AnsiSql, unFraCodigoDescripcion, unFraCodDesc, ImgList, JvExDBGrids, JvDBGrid,
  DBCtrls, JvExControls, JvComponent, JvLabel, JvExStdCtrls, JvMemo,
  AdvMemo, AdvmPS, Mask, PatternEdit, IntEdit, JvExComCtrls, JvStatusBar,
  Menus, CheckLst, ARTCheckListBox, JvExExtCtrls, JvNavigationPane,
  unArtDbFrame, unFraUsuarioConSectorIntranet, unfraSectores, AdvmSQLS,
  AdvCardList, DBAdvCardList, JvToolBar, AdvGroupBox, AdvOfficeButtons,
  AdvDBLookupComboBox, AdvPageControl, DBAdvOfficeButtons, dblookup,
  RxLookup, JvComponentBase, RxPlacemnt;

type
  TfrmManATE_TIPOEVENTO = class(TfrmCustomGridABM)
    AdvSQLMemoStyler: TAdvSQLMemoStyler;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnAceptarDatos: TButton;
    btnAceptarTC: TButton;
    btnAplicar: TButton;
    btnCancelarDatos: TButton;
    btnCancelarImpresion: TButton;
    btnCancelarTC: TButton;
    btnImprimir: TButton;
    btnValidarConsulta: TButton;
    bvlTareasConcatenadas: TBevel;
    chkModulos: TCheckBox;
    chkMotivoIngreso: TCheckBox;
    chkObligatorio: TCheckBox;
    chkTS_FECHABAJA: TCheckBox;
    clbConsultaMotivosDeIngreso: TARTCheckListBox;
    clbFiltroMotivosIngreso: TARTCheckListBox;
    clbMotivoIngreso: TARTCheckListBox;
    DBAdvCardListTareasConcatenadas: TDBAdvCardList;
    dbgAsociados: TJvDBGrid;
    dbgDisponibles: TJvDBGrid;
    dbgModulos: TJvDBGrid;
    dbgUsuarios: TArtDBGrid;
    dbgVinculoSectores: TArtDBGrid;
    DBText2: TDBText;
    DBText3: TDBText;
    dsAsociados: TDataSource;
    dsDisponibles: TDataSource;
    dsMotivosDeIngreso: TDataSource;
    dsRespuestas: TDataSource;
    dsTareaConcatenada: TDataSource;
    dsUsuarios: TDataSource;
    dsVinculoSectores: TDataSource;
    edAyuda: TDBMemo;
    edDIAS_RESOLUCION: TIntEdit;
    edHORAS_RESOLUCION: TIntEdit;
    edMINUTOS_RESOLUCION: TIntEdit;
    edRespuestaFija: TDBMemo;
    edTC_SQL: TAdvMemo;
    edTE_AYUDA: TMemo;
    edTE_DESCRIPCION: TEdit;
    edTE_RESPUESTASUGERIDAFIJA: TMemo;
    fpDatos: TFormPanel;
    fpPrint: TFormPanel;
    fpTareasConcatenadas: TFormPanel;
    fraMotivoPadre: TfraCodDesc;
    fraNuevaTarea: TfraCodDesc;
    fraPROCESO: TfraCodDesc;
    fraSE_CARGO: TfraCodDesc;
    fraSE_IDSECTOR: TfraCodDesc;
    fraSE_SECTOR: TfraCodDesc;
    fraTE_IDDESTINATARIO: TfraCodDesc;
    fraTE_IDPADRE: TfraCodDesc;
    fraTE_IDPROCESO: TfraCodDesc;
    fraTIPODESTINATARIO: TfraCodDesc;
    ilByN: TImageList;
    ilColor: TImageList;
    ilIconosABM: TImageList;
    imgGrid: TImageList;
    JvNavPaneStyleManager: TJvNavPaneStyleManager;
    JvOutlookSplitter1: TJvOutlookSplitter;
    JvOutlookSplitter2: TJvOutlookSplitter;
    JvOutlookSplitterHorizontal: TJvOutlookSplitter;
    BarraHerramientas_TareasConcatenadas: TJvToolBar;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblAux: TLabel;
    lblMotivoIngreso: TLabel;
    lblTarea: TLabel;
    lbPregunta: TMemo;
    lbTiempoDeResolucion: TLabel;
    MemoAux: TMemo;
    mnuMarcaNOobligatorio: TMenuItem;
    mnuMarcaObligatorio: TMenuItem;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    pcModulos: TPageControl;
    pcTareaConcatenada: TAdvPageControl;
    pcRESPUESTA: TPageControl;
    pmuModulosAsociados: TPopupMenu;
    pnlBottom: TPanel;
    pnlFiltrosFiltrables: TPanel;
    pnlFiltrosUsuarios: TPanel;
    pnlLeft: TPanel;
    pnlMedio: TPanel;
    pnlOrdenamiento: TPanel;
    pnlSector: TPanel;
    pnlTotalRegistros: TPanel;
    rgAccion: TAdvOfficeRadioGroup;
    rgBajas: TAdvOfficeRadioGroup;
    rgCondicion: TAdvOfficeRadioGroup;
    rgSQL: TAdvOfficeRadioGroup;
    rgTipo: TAdvOfficeRadioGroup;
    rgTipoEvento: TAdvOfficeRadioGroup;
    sbEstado: TJvStatusBar;
    sdqAsociados: TSDQuery;
    sdqAsociadosDEPENDE_DE: TStringField;
    sdqAsociadosmo_CODIGOPANEL: TFloatField;
    sdqAsociadosmo_DESCRIPCION: TStringField;
    sdqAsociadosmo_FECHAALTA: TDateTimeField;
    sdqAsociadosmo_FECHABAJA: TDateTimeField;
    sdqAsociadosmo_FECHAMODIF: TDateTimeField;
    sdqAsociadosmo_ID: TFloatField;
    sdqAsociadosmo_TIPOMODULO: TStringField;
    sdqAsociadosmo_TIPOMODULODEPENDIENTE: TStringField;
    sdqAsociadosmo_USUALTA: TStringField;
    sdqAsociadosmo_USUBAJA: TStringField;
    sdqAsociadosmo_USUMODIF: TStringField;
    sdqAsociadosTM_FECHAALTA: TDateTimeField;
    sdqAsociadosTM_FECHABAJA: TDateTimeField;
    sdqAsociadosTM_FECHAMODIF: TDateTimeField;
    sdqAsociadosTM_ID: TFloatField;
    sdqAsociadosTM_IDMODULOEVENTO: TFloatField;
    sdqAsociadosTM_IDTIPOEVENTO: TFloatField;
    sdqAsociadosTM_OBLIGATORIO: TStringField;
    sdqAsociadosTM_ORDEN: TStringField;
    sdqAsociadosTM_USUALTA: TStringField;
    sdqAsociadosTM_USUBAJA: TStringField;
    sdqAsociadosTM_USUMODIF: TStringField;
    sdqConsultaSQL: TSDQuery;
    sdqDisponibles: TSDQuery;
    sdqDisponiblesDEPENDE_DE: TStringField;
    sdqDisponiblesmo_DESCRIPCION: TStringField;
    sdqDisponiblesmo_FECHAALTA: TDateTimeField;
    sdqDisponiblesmo_FECHABAJA: TDateTimeField;
    sdqDisponiblesmo_FECHAMODIF: TDateTimeField;
    sdqDisponiblesmo_ID: TFloatField;
    sdqDisponiblesmo_TIPOMODULO: TStringField;
    sdqDisponiblesmo_TIPOMODULODEPENDIENTE: TStringField;
    sdqDisponiblesmo_USUALTA: TStringField;
    sdqDisponiblesmo_USUBAJA: TStringField;
    sdqDisponiblesmo_USUMODIF: TStringField;
    sdqMotivosDeIngreso: TSDQuery;
    sdqRespuestas: TSDQuery;
    sdqTareaConcatenada: TSDQuery;
    sdqTareaConcatenadaACCION: TStringField;
    sdqTareaConcatenadaCONDICION: TStringField;
    sdqTareaConcatenadaTAREA_CREADA: TStringField;
    sdqTareaConcatenadaTC_ACCION: TStringField;
    sdqTareaConcatenadaTC_CONDICION: TStringField;
    sdqTareaConcatenadaTC_ID: TFloatField;
    sdqTareaConcatenadaTC_IDMOTIVOINGRESO: TFloatField;
    sdqTareaConcatenadaTC_IDRESPUESTA: TFloatField;
    sdqTareaConcatenadaTC_IDTAREA_CREADA: TFloatField;
    sdqTareaConcatenadaTC_IDTAREA_ORIGINANTE: TFloatField;
    sdqTareaConcatenadaTC_SQL: TMemoField;
    sdqUsuarios: TSDQuery;
    sdqVinculoSectores: TSDQuery;
    ShortCutControlHijo: TShortCutControl;
    Splitter1: TJvOutlookSplitter;
    tbAsociar: TToolButton;
    tbBajar: TToolButton;
    tbConfiguracion: TToolButton;
    tbEliminarTareaConcatenada: TToolButton;
    tbModificarTareaConcatenada: TToolButton;
    tbModulos: TToolBar;
    tbNuevaTareaConcatenada: TToolButton;
    tbOrdenamientoModulos: TToolBar;
    tbRemover: TToolButton;
    tbSubir: TToolButton;
    tsAux: TAdvTabSheet;
    tsConsultaSQL: TTabSheet;
    tsDestinatarios: TTabSheet;
    tsModulos: TTabSheet;
    tsRESPUESTADINAMICA: TTabSheet;
    tsRESPUESTASUGERIDAFIJA: TTabSheet;
    tsScriptTareaConcatenada: TAdvTabSheet;
    tsSector: TTabSheet;
    tsTareaConcatenada: TAdvTabSheet;
    tsTareasConcatenadas: TTabSheet;
    fraTC_IDRESPUESTA: TfraCodDesc;
    fraTC_IDMOTIVOINGRESO: TfraCodDesc;
    sdqTareaConcatenadaMOTIVOINGRESO: TStringField;
    TimerScroll: TTimer;
    chkTC_COPIAADJUNTO: TCheckBox;
    chkTC_COPIADESCRIPCION: TCheckBox;
    chkTC_COPIARESPUESTA: TCheckBox;
    chkTC_AVISOMAIL: TCheckBox;
    sdqTareaConcatenadaTC_COPIAADJUNTO: TStringField;
    sdqTareaConcatenadaTC_COPIADESCRIPCION: TStringField;
    sdqTareaConcatenadaTC_COPIARESPUESTA: TStringField;
    sdqTareaConcatenadaTC_AVISOMAIL: TStringField;
    clbFiltroModulos: TARTCheckListBox;
    pnlFiltroSector: TPanel;
    fraTS_IDSECTOR: TfraCodDesc;
    Label19: TLabel;
    pnlExplicacionRespuesta: TPanel;
    edTE_SQLEXPLICACION: TMemo;
    Panel12: TPanel;
    Panel13: TPanel;
    edTE_SQL: TAdvMemo;
    pnlTextoReemplazo: TPanel;
    BarraHerramientas_TextoReemplazo: TJvToolBar;
    tbAgregarTexto: TToolButton;
    tbModificarTexto: TToolButton;
    tbEliminarTexto: TToolButton;
    JvOutlookSplitter3: TJvOutlookSplitter;
    sdqTextoReemplazo: TSDQuery;
    dsTextoReemplazo: TDataSource;
    pnlDatosTextoReemplazo: TPanel;
    Label20: TLabel;
    edTR_CLAVE: TDBEdit;
    Label21: TLabel;
    edTR_TEXTO: TDBMemo;
    edFilaReemplazoTexto: TDBText;
    Label22: TLabel;
    edTotalReemplazoTexto: TLabel;
    Label24: TLabel;
    edTR_EXPLICACION: TDBMemo;
    sdqTextoReemplazoTR_ID: TFloatField;
    sdqTextoReemplazoTR_IDTIPOEVENTO: TFloatField;
    sdqTextoReemplazoTR_CLAVE: TStringField;
    sdqTextoReemplazoTR_TEXTO: TStringField;
    sdqTextoReemplazoTR_USUALTA: TStringField;
    sdqTextoReemplazoTR_FECHAALTA: TDateTimeField;
    sdqTextoReemplazoTR_USUMODIF: TStringField;
    sdqTextoReemplazoTR_FECHAMODIF: TDateTimeField;
    sdqTextoReemplazoTR_USUBAJA: TStringField;
    sdqTextoReemplazoTR_FECHABAJA: TDateTimeField;
    sdqTextoReemplazoTR_EXPLICACION: TStringField;
    tbAceptarTexto: TToolButton;
    tbCancelarTexto: TToolButton;
    sduTextoReemplazo: TSDUpdateSQL;
    sduTareaConcatenada: TSDUpdateSQL;
    pnlFiltroCanal: TPanel;
    Label2: TLabel;
    fraTI_IDMOTIVOINGRESO: TfraCodDesc;
    sdqTextoReemplazoFILA: TFloatField;
    chkTC_COPIARCANAL: TCheckBox;
    sdqTareaConcatenadaTC_COPIARCANAL: TStringField;
    chkRespuestasPredefinidas: TCheckBox;
    tsHistorico: TTabSheet;
    sdqHistorico: TSDQuery;
    dsHistorico: TDataSource;
    sdqHistoricoHT_ID: TFloatField;
    sdqHistoricoHT_IDTIPOEVENTO: TFloatField;
    sdqHistoricoHT_USUARIO: TStringField;
    sdqHistoricoHT_FECHA: TDateTimeField;
    sdqHistoricoHT_DESCRIPCION: TStringField;
    sdqHistoricoUSUARIO: TStringField;
    pnlLeftHistorico: TPanel;
    pnlTopHistorico: TPanel;
    pnlHistorico: TPanel;
    DBAdvCardListHistorico: TDBAdvCardList;
    edUltimoCambio: TMemo;
    Panel8: TPanel;
    edMotivoCambio: TMemo;
    procedure ActualizarUsuarios(Sender: TObject);
    procedure AjusteDestinatarios(Sender: TObject);
    procedure AnalizoRespuestas(DataSet: TDataSet);
    procedure btnAceptarDatosClick(Sender: TObject);
    procedure btnAceptarTCClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCancelarTCClick(Sender: TObject);
    procedure btnValidarConsultaClick(Sender: TObject);
    procedure chkTS_FECHABAJAClick(Sender: TObject);
    procedure DBAdvCardListTareasConcatenadasCardDblClick(Sender: TObject; Card: TAdvCard);
    procedure dbgVinculoSectoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edTE_SQLKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmResize(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure fpDatosShow(Sender: TObject);
    procedure fpPrintShow(Sender: TObject);
    procedure fpTareasConcatenadasClose(Sender: TObject; var Action: TCloseAction);
    procedure fraNuevaTareaPropiedadesChange(Sender: TObject);
    procedure fraSE_CARGOcmbDescripcionDropDown(Sender: TObject);
    procedure fraSE_IDSECTORcmbDescripcionDropDown(Sender: TObject);
    procedure fraTE_IDPADREPropiedadesChange(Sender: TObject);
    procedure fraTIPODESTINATARIOPropiedadesChange(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MarcaObligatorio(Sender: TObject);
    procedure pcModulosChange(Sender: TObject);
    procedure pmuModulosAsociadosPopup(Sender: TObject);
    procedure rgAccionChange(Sender: TObject);
    procedure rgCondicionChange(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure rgTipoEventoClick(Sender: TObject);
    procedure sdqAsociadosAfterScroll(DataSet: TDataSet);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure sdqConsultaCalcFields(DataSet: TDataSet);
    procedure sdqDisponiblesAfterScroll(DataSet: TDataSet);
    procedure sdqUsuariosAfterOpen(DataSet: TDataSet);
    procedure sdqVinculoSectoresAfterOpen(DataSet: TDataSet);
    procedure tbAsociarClick(Sender: TObject);
    procedure tbConfiguracionClick(Sender: TObject);
    procedure tbEliminarTareaConcatenadaClick(Sender: TObject);
    procedure tbModificarTareaConcatenadaClick(Sender: TObject);
    procedure tbNuevaTareaConcatenadaClick(Sender: TObject);
    procedure tbOrdenamientoClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbRemoverClick(Sender: TObject);
    procedure tsModulosResize(Sender: TObject);
    procedure TimerScrollTimer(Sender: TObject);
    procedure tbAgregarTextoClick(Sender: TObject);
    procedure tbAceptarTextoClick(Sender: TObject);
    procedure tbCancelarTextoClick(Sender: TObject);
    procedure tbModificarTextoClick(Sender: TObject);
    procedure tbEliminarTextoClick(Sender: TObject);
    procedure pcRESPUESTAChange(Sender: TObject);
    procedure sdqTextoReemplazoAfterOpen(DataSet: TDataSet);
    procedure chkTC_COPIARCANALClick(Sender: TObject);
  private
    bAplicarEnAlta: Boolean;
    FSQL, FSqlComboMotivos: String;
    objSQL: TSQL;
    SQL_USUARIOS, SQL_VINCULO_SECTORES: String;
    procedure AnalizoTareaConcatenada;
    procedure SeleccionarArbol(Sender: TObject; Node: TTreeNode);
    procedure GestionarABMTextoReemplazo(AHabilitado: Boolean);
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
    function  Validar : Boolean; override;
  end;

var
  frmManATE_TIPOEVENTO: TfrmManATE_TIPOEVENTO;

implementation

uses
  unSesion, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unCustomConsulta, unArt, unArbolSectores, unGrids,
  Strfuncs, unRptConfiguracionAGENDA, unVisualizador, DbFuncs;

var
  frmArbolSectoresEmbebido: TfrmArbolSectores;

{$R *.dfm}

procedure TfrmManATE_TIPOEVENTO.ActualizarUsuarios(Sender: TObject);
begin
  OpenQuery(sdqUsuarios, SQL_USUARIOS + DoFiltro(pnlFiltrosUsuarios));
end;

procedure TfrmManATE_TIPOEVENTO.AjusteDestinatarios(Sender: TObject);
begin
  if sdqUsuarios.Active and not sdqUsuarios.IsEmpty then
  begin
    VCLExtra.DynColWidthsByData(dbgUsuarios);
    dbgUsuarios.Width := GetColumnWidths(dbgUsuarios, True);
  end;
end;

procedure TfrmManATE_TIPOEVENTO.AnalizoRespuestas(DataSet: TDataSet);
begin
  fraTC_IDRESPUESTA.Propiedades.Sql := sdqRespuestas.SQL.Text + ' AND idtipoevento = ' + SqlInteger(sdqConsulta.FieldByName('TE_ID').AsInteger, True);
  tbModificarTareaConcatenada.Enabled := not DataSet.IsEmpty and Seguridad.Activar(tbModificarTareaConcatenada);
  tbEliminarTareaConcatenada.Enabled := not DataSet.IsEmpty and Seguridad.Activar(tbEliminarTareaConcatenada);  
end;

procedure TfrmManATE_TIPOEVENTO.btnAceptarDatosClick(Sender: TObject);
begin
  Verificar(chkObligatorio.State = cbGrayed, chkObligatorio, 'Debe indicar si el elemento es obligatorio o no.');
  fpDatos.ModalResult := mrOk;
end;

procedure TfrmManATE_TIPOEVENTO.btnAceptarTCClick(Sender: TObject);
begin
  Verificar(rgAccion.ItemIndex = -1, rgAccion, 'Debe seleccionar una acción para ejecutar al cerrar esta tarea.');
  Verificar(rgCondicion.ItemIndex = -1, rgCondicion, 'Debe seleccionar una condición bajo la cual se ' + IIF(rgAccion.ItemIndex = 0, 'creará la tarea', 'ejecutará la secuencia de comandos') + ' al cerrar esta tarea.');
  Verificar((rgCondicion.ItemIndex = 1) and fraTC_IDRESPUESTA.IsEmpty, fraTC_IDRESPUESTA.edCodigo, 'Debe seleccionar una respuesta si considera que es condición necesaria para determinar la creación la nueva tarea.');
  Verificar((rgAccion.ItemIndex = 0) and (fraNuevaTarea.IsEmpty), fraNuevaTarea.edCodigo, 'Debe seleccionar la nueva tarea que se creará al cerrar la tarea ' + edTE_DESCRIPCION.Text + '.');
  Verificar((rgAccion.ItemIndex = 0) and fraTC_IDMOTIVOINGRESO.IsEmpty and (not chkTC_COPIARCANAL.Checked), fraTC_IDMOTIVOINGRESO.edCodigo, 'Debe seleccionar un motivo de ingreso para la nueva tarea, a menos que seleccione que se empleará el mismo motivo de ingreso que el de la tarea originante.');
  Verificar((rgAccion.ItemIndex = 1) and (not CheckAndOpenQuery(sdqConsultaSQL, edTC_SQL.Lines.Text, False)), btnAceptarTC, 'La secuencia de comandos no es válida');
//  Verificar(ExisteSQLEx('SELECT 1 FROM agenda.a')
  {$MESSAGE 'Falta elaborar la validación necesaria para que no den de alta tareas concatenadas que puedan generar una inconsistencia a raiz del motivo de ingreso'}
  BeginTrans(True);
  try
    with TSql.Create('AGENDA.ATC_TAREACONCATENADA') do
    try
      if fpTareasConcatenadas.Tag = 1 {dsTareaConcatenada.State = dsInsert} then
      begin
        SqlType := stInsert;
        PrimaryKey.AddInteger('TC_ID', GetSecNextVal('AGENDA.SEQ_ATC_ID'));
      end else
        if fpTareasConcatenadas.Tag = 2 {dsTareaConcatenada.State = dsEdit} then
        begin
          SqlType := stUpdate;
          PrimaryKey.Add('TC_ID', sdqTareaConcatenada.FieldByName('TC_ID').AsInteger);
        end;

      Fields.AddInteger('TC_IDTAREA_ORIGINANTE', sdqConsulta.FieldByName('TE_ID').AsInteger);
      Fields.AddString('TC_ACCION', IIF(rgAccion.ItemIndex = 0, 'C', 'S'));
      Fields.AddString('TC_CONDICION', IIF(rgCondicion.ItemIndex = 0, 'S', 'R'));

      case rgAccion.ItemIndex of
        0: begin
             Fields.AddInteger('TC_IDTAREA_CREADA', fraNuevaTarea.ID);
             Fields.AddInteger('TC_IDMOTIVOINGRESO', StrToIntDef(fraTC_IDMOTIVOINGRESO.ID, 0), True);
             Fields.AddString('TC_COPIAADJUNTO', IIF(chkTC_COPIAADJUNTO.Checked, 'S', 'N'));
             Fields.AddString('TC_COPIARCANAL', IIF(chkTC_COPIARCANAL.Checked, 'S', 'N'));
             Fields.AddString('TC_COPIADESCRIPCION', IIF(chkTC_COPIADESCRIPCION.Checked, 'S', 'N'));
             Fields.AddString('TC_COPIARESPUESTA', IIF(chkTC_COPIARESPUESTA.Checked, 'S', 'N'));
             Fields.AddString('TC_AVISOMAIL', IIF(chkTC_AVISOMAIL.Checked, 'S', 'N'));
             Fields.AddExpression('TC_SQL', exNull);
           end;

        1: begin
             Fields.AddExpression('TC_IDTAREA_CREADA', exNull);
             Fields.AddExpression('TC_IDRESPUESTA', exNull);
             Fields.AddExpression('TC_IDMOTIVOINGRESO', exNull);
             Fields.AddString('TC_COPIAADJUNTO', 'N');
             Fields.AddString('TC_COPIADESCRIPCION', 'N');
             Fields.AddString('TC_COPIARESPUESTA', 'N');
             Fields.AddString('TC_AVISOMAIL', 'N');
           end;
      end;

      case rgCondicion.ItemIndex of
        0: if rgAccion.ItemIndex = 0 then
             Fields.AddExpression('TC_IDRESPUESTA', exNull);
        1: Fields.AddInteger('TC_IDRESPUESTA', fraTC_IDRESPUESTA.Codigo);
      end;

      EjecutarSqlST(Sql);
      if not IsEmptyString(edTC_SQL.Lines.Text) then
        SaveBlob('SELECT TC_SQL FROM AGENDA.ATC_TAREACONCATENADA WHERE TC_ID = ' + SqlString(PrimaryKey.FieldByName['TC_ID'].Value),
                 'UPDATE AGENDA.ATC_TAREACONCATENADA SET TC_SQL = :TC_SQL WHERE TC_ID = ' + SqlString(PrimaryKey.FieldByName['TC_ID'].Value),
                 'TC_SQL', edTC_SQL.Lines);

      CommitTrans(True);
    finally
      Free;
    end;
  except
    on E: Exception do
    begin
      Rollback(True);
      InfoHint(btnAceptarTC, E.Message, True, 'Error al guardar', blnError);
    end;
  end;
  sdqTareaConcatenada.Refresh;
  fpTareasConcatenadas.ModalResult := mrOk;
end;

procedure TfrmManATE_TIPOEVENTO.btnAplicarClick(Sender: TObject);
begin
  if ModoABM = maAlta then
    bAplicarEnAlta := True;

  inherited;
 if Validar and DoABM then
  begin
   if sdqConsulta.Active then
    begin
     sdqConsulta.Refresh;
      CheckButtons;
    end
    else
     tbRefrescarClick(nil);

    ModoABM := maModificacion;
    ModoABMToSqlType;
    fpAbmShow(nil);
    fpABM.Caption := CAPTION_MODIFIC;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.btnCancelarClick(Sender: TObject);
begin
  Rollback(True);
  fpAbm.ModalResult := mrCancel;
  inherited;
end;

procedure TfrmManATE_TIPOEVENTO.btnCancelarTCClick(Sender: TObject);
begin
  sdqTareaConcatenada.Cancel;
  sdqTareaConcatenada.CancelUpdates;
  fpTareasConcatenadas.ModalResult := mrCancel;
end;

procedure TfrmManATE_TIPOEVENTO.btnValidarConsultaClick(Sender: TObject);
var
  bAbortar: Boolean;
begin
  bAbortar := False;
  if (Trim(edTE_SQL.Lines.Text) > '') then
    try
      CheckAndOpenQuery(sdqConsultaSQL, edTE_SQL.Lines.Text);
      if not Assigned(sdqConsultaSQL.FindField('TEXTO')) then
      begin
        pcModulos.ActivePageIndex := tsConsultaSQL.PageIndex;
        InvalidMsg(edTE_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Texto" para ser mostrado.');
        bAbortar := True;
      end;
    except
      pcModulos.ActivePageIndex := tsConsultaSQL.PageIndex;
      InvalidMsg(edTE_SQL, 'La consulta SQL no es válida.');
      bAbortar := True;
    end;

  if bAbortar then
    Abort;
end;

procedure TfrmManATE_TIPOEVENTO.chkTS_FECHABAJAClick(Sender: TObject);
begin
  OpenQueryEx(sdqVinculoSectores, [sdqConsulta.FieldByName('TE_ID').AsInteger], SQL_VINCULO_SECTORES + iif(not chkTS_FECHABAJA.Checked, ' AND TS_FECHABAJA IS NULL ', ''));
end;

procedure TfrmManATE_TIPOEVENTO.dbgVinculoSectoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FieldName, ['SECTOR']) and not sdqVinculoSectores.FieldByName('TS_FECHABAJA').IsNull then
  begin
    AFont.Color := clRed;
    AFont.Style := AFont.Style + [fsStrikeOut];
  end;
end;

procedure TfrmManATE_TIPOEVENTO.edTE_SQLKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  edTE_RESPUESTASUGERIDAFIJA.Clear;
end;

procedure TfrmManATE_TIPOEVENTO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  objSQL.Free;
end;

procedure TfrmManATE_TIPOEVENTO.FormCreate(Sender: TObject);
begin
  SQL_USUARIOS := sdqUsuarios.SQL.Text;
  SQL_VINCULO_SECTORES := sdqVinculoSectores.SQL.Text;
  frmArbolSectoresEmbebido := TfrmArbolSectores.Create(tsSector);
  with frmArbolSectoresEmbebido do
  begin
    ModoAgenda := True;
    Parent := tsSector;
    Align := alClient;
    pnlBottom.Visible := False;
    BorderStyle := TFormBorderStyle(bsNone);
    Constraints.MinHeight := 150;
//    MostrarSector(Sesion.IdSectorIntranet);
    Visible := True;
    tvSectores.OnChange := SeleccionarArbol;
  end;

  FSqlComboMotivos := 'SELECT DISTINCT MI_DESCRIPCION, MI_ID ' +
                        'FROM AGENDA.ATE_TIPOEVENTO, AGENDA.AMI_MOTIVOINGRESO, AGENDA.ATI_TIPOEVENTOMOTIVOINGRESO ' +
                       'WHERE MI_ID = TI_IDMOTIVOINGRESO(+) ' +
                         'AND TI_IDTIPOEVENTO = TE_ID(+) ' +
                         'AND TI_FECHABAJA IS NULL ' +
                         'AND TE_FECHABAJA IS NULL ' +                         
                    'ORDER BY MI_DESCRIPCION';
  inherited;
  ShowActived := False;
  AutoColWidths := True;
  tbConfiguracion.Left := tbEliminar.Left + 1;
  clbFiltroMotivosIngreso.SQL := FSqlComboMotivos;
  VCLExtra.LockControls([edAyuda, edRespuestaFija, clbConsultaMotivosDeIngreso, dbgModulos, edUltimoCambio], True);
  GestionarABMTextoReemplazo(False);
  SQL.TableName := 'AGENDA.ATE_TIPOEVENTO';
  FieldBaja := 'TE_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  objSQL := TSQL.Create;
  objSQL.TableName := 'AGENDA.ATM_TIPOMODULOEVENTO';
end;

procedure TfrmManATE_TIPOEVENTO.fpAbmResize(Sender: TObject);
begin
  inherited;
  dbgDisponibles.Width := Round(tsModulos.Width / 2) - Round(tbModulos.Width / 2);
end;

procedure TfrmManATE_TIPOEVENTO.fpAbmShow(Sender: TObject);
var
  nId: Integer;
begin
  bAplicarEnAlta := False;
  VCLExtra.LockControls([edTE_SQL], Sesion.Sector <> 'COMPUTOS');
  inherited;
  tsModulos.Enabled := (ModoABM = maModificacion);
  if tsModulos.Enabled then
  begin
    OpenQueryEx(sdqDisponibles, [sdqConsulta.FieldByName('TE_ID').AsInteger]);

    if sdqAsociados.Active and not sdqAsociados.IsEmpty then
      nId := sdqAsociadosTM_ID.AsInteger
    else
      nId := 0;

    OpenQueryEx(sdqAsociados, [sdqConsulta.FieldByName('TE_ID').AsInteger]);

    if nId > 0 then
      sdqAsociados.Locate('TM_ID', nId, []);
  end else
  begin
    sdqDisponibles.Close;
    sdqAsociados.Close;
  end;
  fpAbmResize(nil);
  pcModulosChange(nil);
end;

procedure TfrmManATE_TIPOEVENTO.fpDatosShow(Sender: TObject);
begin
  chkObligatorio.State := cbGrayed;
end;

procedure TfrmManATE_TIPOEVENTO.fpPrintShow(Sender: TObject);
begin
  chkMotivoIngreso.Checked := False;
  chkModulos.Checked := False;
  chkRespuestasPredefinidas.Checked := False;
end;

procedure TfrmManATE_TIPOEVENTO.fpTareasConcatenadasClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsTareaConcatenada.State in [dsInsert, dsEdit] then
    sdqTareaConcatenada.Cancel;

  fpTareasConcatenadas.Tag := 0;    
end;

procedure TfrmManATE_TIPOEVENTO.fraNuevaTareaPropiedadesChange(Sender: TObject);
begin
  fraTC_IDMOTIVOINGRESO.Propiedades.Sql := sdqMotivosDeIngreso.SQL.Text + ' AND idtipoevento = ' + SqlInteger(fraNuevaTarea.Id, True);
end;

procedure TfrmManATE_TIPOEVENTO.fraSE_CARGOcmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  if fraSE_SECTOR.IsSelected then
    fraSE_CARGO.Propiedades.ExtraCondition := ' AND exists(SELECT 1 FROM art.use_usuarios WHERE tb_codigo = se_cargo AND se_sector = ' + SQLValue(fraSE_SECTOR.Codigo) + ') '
  else
    fraSE_CARGO.Propiedades.ExtraCondition := ' ';

  fraSE_CARGO.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManATE_TIPOEVENTO.fraSE_IDSECTORcmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  if fraSE_SECTOR.IsSelected then
    fraSE_IDSECTOR.Propiedades.ExtraCondition := ' AND se_nivel = 4 AND se_id IN (SELECT se_idsector FROM art.use_usuarios WHERE se_sector = ' + SQLValue(fraSE_SECTOR.Codigo) + ') '
  else
    fraSE_IDSECTOR.Propiedades.ExtraCondition := ' AND se_nivel = 4 ';

  fraSE_IDSECTOR.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManATE_TIPOEVENTO.fraTE_IDPADREPropiedadesChange(Sender: TObject);
begin
  inherited;
  if fraTE_IDPADRE.IsSelected then
    rgTipoEvento.ItemIndex := 2;
  tbRefrescarClick(nil);
end;

procedure TfrmManATE_TIPOEVENTO.fraTIPODESTINATARIOPropiedadesChange(Sender: TObject);
begin
  inherited;
  tsDestinatarios.TabVisible := (rgTipo.ItemIndex = 1) and fraTIPODESTINATARIO.IsSelected and (fraTIPODESTINATARIO.ID = '-1');
end;

procedure TfrmManATE_TIPOEVENTO.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  bitmap: TBitmap;
  fixRect: TRect;
  bmpWidth: integer;
  imgIndex: integer;
begin
  fixRect := Rect;

  if Column.Field = sdqConsulta.FieldByName('TE_TIPOEVENTO') then
  begin
    //adding some logic to grab the required image
    if sdqConsulta.FieldByName('TE_TIPOEVENTO').AsString = 'E' then
      imgIndex := 0
    else if sdqConsulta.FieldByName('TE_TIPOEVENTO').AsString = 'T' then
      imgIndex := 1
    else
      imgIndex := -1;

    bitmap := TBitmap.Create;
    try
      //grab the image from the ImageList 
      //(using the "Salary" field's value)
      imgGrid.GetBitmap(imgIndex,bitmap);
      //Fix the bitmap dimensions
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;
      //draw the bitmap
      Grid.Canvas.StretchDraw(fixRect,bitmap);
    finally
      bitmap.Free;
    end;

    // reset the output rectangle, 
    // add space for the graphics
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;

  //draw default text (fixed position)
  Grid.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
end;

procedure TfrmManATE_TIPOEVENTO.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FieldName, ['TE_DESCRIPCION']) and (sdqConsulta.FieldByName('RI').AsString = vSI) then
    AFont.Color := clMaroon;

  if AreIn(Field.FieldName, ['TIENE_TAREAS']) then
  begin
    if (sdqConsulta.FieldByName('TIENE_TAREAS').AsString = vSI) then
      AFont.Color := clTeal
    else
      AFont.Color := clMaroon;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.MarcaObligatorio(Sender: TObject);
begin
{
  lbPregunta.Lines.Text := Format('Estado de la asociación entre el módulo %s y el evento %s.', [sdqAsociadosmo_DESCRIPCION.AsString, edTE_DESCRIPCION.Text]);
  if fpDatos.ShowModal = mrOk then
}
  with objSQL do
  begin
    try
      BeginTrans(True);
      SqlType := stUpdate;
      PrimaryKey.Clear;
      PrimaryKey.AddInteger('TM_ID', sdqAsociadosTM_ID.AsInteger);
      Fields.Clear;
      Fields.Add('TM_FECHABAJA', exNull);
      Fields.Add('TM_USUBAJA', exNull);
      Fields.Add('TM_USUMODIF', Sesion.UserID);
      Fields.Add('TM_FECHAMODIF', exDateTime);
      Fields.Add('TM_OBLIGATORIO', SqlBoolean((Sender = mnuMarcaObligatorio), False));

      EjecutarSqlST(Sql);
      fpAbmShow(nil);
    except
      on e: Exception do
        InfoHint(tbAsociar, E.Message);
    end;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.pcModulosChange(Sender: TObject);
begin
  if pcModulos.ActivePage = tsSector then
    frmArbolSectoresEmbebido.MostrarEventoTarea(sdqConsulta.FieldByName('TE_ID').AsInteger);

  if pcModulos.ActivePage = tsTareasConcatenadas then
    OpenQueryEx(sdqTareaConcatenada, [sdqConsulta.FieldByName('TE_ID').AsInteger]);

  if pcModulos.ActivePage = tsHistorico then
    OpenQueryEx(sdqHistorico, [sdqConsulta.FieldByName('TE_ID').AsInteger]);

  pcRESPUESTAChange(nil);
end;

procedure TfrmManATE_TIPOEVENTO.pmuModulosAsociadosPopup(Sender: TObject);
begin
  mnuMarcaObligatorio.Visible := sdqAsociados.Active and (not sdqAsociados.IsEmpty) and (sdqAsociadosTM_OBLIGATORIO.AsString <> 'S');
  mnuMarcaNOobligatorio.Visible := sdqAsociados.Active and (not sdqAsociados.IsEmpty) and (sdqAsociadosTM_OBLIGATORIO.AsString <> 'N');
end;

procedure TfrmManATE_TIPOEVENTO.rgAccionChange(Sender: TObject);
begin
  AnalizoTareaConcatenada();
  if (rgAccion.ItemIndex = 1) and (rgCondicion.ItemIndex = 1) then
    rgCondicion.ItemIndex := 0;
end;

procedure TfrmManATE_TIPOEVENTO.rgCondicionChange(Sender: TObject);
begin
  VCLExtra.LockControls([fraTC_IDRESPUESTA], rgCondicion.ItemIndex <> 1);
  AnalizoTareaConcatenada();
end;

procedure TfrmManATE_TIPOEVENTO.rgTipoClick(Sender: TObject);
begin
  VCLExtra.LockControls([fraTIPODESTINATARIO, fraMotivoPadre,
                         edDIAS_RESOLUCION, edHORAS_RESOLUCION, edMINUTOS_RESOLUCION], rgTipo.ItemIndex = 0);
  if rgTipo.ItemIndex = 0 then
  begin
    fraTIPODESTINATARIO.Clear;
    fraMotivoPadre.Clear;
  end;
  tsDestinatarios.TabVisible := (rgTipo.ItemIndex = 1) and fraTIPODESTINATARIO.IsSelected and (fraTIPODESTINATARIO.ID = '-1');
  tsTareasConcatenadas.TabVisible := rgTipo.ItemIndex = 1;
end;

procedure TfrmManATE_TIPOEVENTO.rgTipoEventoClick(Sender: TObject);
begin
  VCLExtra.LockControls(fraTE_IDPADRE, rgTipoEvento.ItemIndex = 1);
  if rgTipoEvento.ItemIndex = 1 then
    fraTE_IDPADRE.Clear;

  RefreshData;
end;

procedure TfrmManATE_TIPOEVENTO.sdqAsociadosAfterScroll(DataSet: TDataSet);
begin
  tbRemover.Enabled := sdqAsociados.Active and not sdqAsociados.IsEmpty;
  tbBajar.Enabled := sdqAsociados.Active and not sdqAsociados.IsEmpty and (sdqAsociados.RecNo < sdqAsociados.RecordCount - 1);
  tbSubir.Enabled := sdqAsociados.Active and not sdqAsociados.IsEmpty and (sdqAsociados.RecNo > 0);
  
end;

procedure TfrmManATE_TIPOEVENTO.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  DataSet.Fields.Clear;
end;

procedure TfrmManATE_TIPOEVENTO.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  sbEstado.Panels[0].Text := Format('Se encontraron %d registros que coinciden con el filtro actual', [sdqConsulta.RecordCount]);
  pnlTotalRegistros.Caption := 'Se encontraron: ' + IntToStr(sdqConsulta.RecordCount) + ' registros';
  pnlTotalRegistros.Visible := True;
  pnlTotalRegistros.Parent := Toolbar;
  pnlTotalRegistros.Left := Width;
  Grid.ColumnByField['TE_TIPOEVENTO'].Width := 27;
end;

procedure TfrmManATE_TIPOEVENTO.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  clbConsultaMotivosDeIngreso.ClearChecks;
  sdqAsociados.Close;
  TimerScroll.Enabled := False;
  TimerScroll.Enabled := True;
end;

procedure TfrmManATE_TIPOEVENTO.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldDefs.Update;
    if FieldDefs.IndexOf('RTA_SUGERIDA') = -1 then
    begin
      TDataSetCracker(DataSet).CreateFields;
      with TStringField.Create(DataSet) do
      begin
        Name := 'sdqConsultaRTA_SUGERIDA';
        FieldName := 'RTA_SUGERIDA';
        DataSet := sdqConsulta;
        FieldKind := fkCalculated;
        Size := 8000;
        edRespuestaFija.DataField := 'RTA_SUGERIDA';
      end;

      with TStringField.Create(DataSet) do
      begin
        Name := 'sdqConsultaSQL';
        FieldName := 'SQL';
        DataSet := sdqConsulta;
        FieldKind := fkCalculated;
        Calculated := True;
        Size := 8000;
      end;

      with TStringField.Create(DataSet) do
      begin
        Name := 'sdqConsultaSQLEXPLICACION';
        FieldName := 'SQLEXPLICACION';
        DataSet := sdqConsulta;
        FieldKind := fkCalculated;
        Size := 8000;
      end;
    end;
    AutoCalcFields := True;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.sdqConsultaCalcFields(DataSet: TDataSet);
var
  sAux: String;
  tslAux: TStringList;
begin
  if DataSet.Active {and not DataSet.IsEmpty} then
  begin
    tslAux := TStringList.Create;
    try
      if not DataSet.FieldByName('TE_SQL').IsNull then
        BlobSql('SELECT TE_SQL FROM AGENDA.ATE_TIPOEVENTO WHERE TE_ID = ' + DataSet.FieldByName('TE_ID').AsString, tslAux);

      // Cargo por adelantado el memo...
      //MemoAux.Lines.Text := RemoveFirstSQLCommment(tslAux.Text);
      DataSet.FieldByName('SQL').AsString := tslAux.Text;

      if DataSet.FieldByName('TE_RESPUESTASUGERIDAFIJA').IsNull then
      begin
        if DataSet.FieldByName('RI').AsString = vSI then
        begin
          sAux := GetFirstSQLCommment(tslAux.Text);//DataSet.FieldByName('SQL').AsString);
          if not IsEmptyString(sAux) then
          begin
            DataSet.FieldByName('RTA_SUGERIDA').Value := sAux;
            DataSet.FieldByName('SQLEXPLICACION').Value := sAux;
          end;
        end
      end else
        DataSet.FieldByName('RTA_SUGERIDA').AsString := DataSet.FieldByName('TE_RESPUESTASUGERIDAFIJA').AsString;
    finally
      tslAux.Free;
    end;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.sdqDisponiblesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  tbAsociar.Enabled := sdqDisponibles.Active and not sdqDisponibles.IsEmpty;
end;

procedure TfrmManATE_TIPOEVENTO.sdqUsuariosAfterOpen(DataSet: TDataSet);
begin
  AjusteDestinatarios(nil);
end;

procedure TfrmManATE_TIPOEVENTO.sdqVinculoSectoresAfterOpen(DataSet: TDataSet);
begin
  if sdqVinculoSectores.Active and not sdqVinculoSectores.IsEmpty then
  begin
    VCLExtra.DynColWidthsByData(dbgVinculoSectores);
    pnlSector.Width := GetColumnWidths(dbgVinculoSectores, True);
  end;
end;

procedure TfrmManATE_TIPOEVENTO.tbAsociarClick(Sender: TObject);
begin
  lbPregunta.Lines.Text := Format('¿Confirma que desea asociar el módulo %s al evento %s?', [sdqDisponiblesmo_DESCRIPCION.AsString, edTE_DESCRIPCION.Text]);

  if fpDatos.ShowModal = mrOk then
  with objSQL do
  begin
    try
      BeginTrans(True);
      SqlType := stInsert;
      PrimaryKey.Clear;
      PrimaryKey.AddExpression('TM_ID', 'AGENDA.SEQ_ATM_ID.NEXTVAL');
      Fields.Clear;
      Fields.Add('TM_FECHABAJA', exNull);
      Fields.Add('TM_USUBAJA', exNull);
      Fields.Add('TM_USUALTA', Sesion.UserID);
      Fields.Add('TM_FECHAALTA', exDateTime);
      Fields.Add('TM_IDTIPOEVENTO', sdqConsulta.FieldByName('TE_ID').AsInteger);
      Fields.Add('TM_IDMODULOEVENTO', sdqDisponiblesMO_ID.AsInteger);
      Fields.Add('TM_ORDEN', sdqAsociados.RecordCount + 1);
      Fields.Add('TM_OBLIGATORIO', SqlBoolean(chkObligatorio.Checked, False));

      EjecutarSqlST(Sql);
      fpAbmShow(nil);
    except
      on e: Exception do
        InfoHint(tbAsociar, E.Message);
    end;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.tbConfiguracionClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbConfiguracion, 'Debe seleccionar al menos un evento o tarea.');
  if fpPrint.ShowModal = mrOk then
  begin
    qrConfiguracionAGENDA := TqrConfiguracionAGENDA.Create(Self);
    with qrConfiguracionAGENDA do
    try
      sdqDatos.SQL.Text := RemoveOrderBy(sdqConsulta.SQL.Text) + ' ORDER BY DECODE(TE_TIPOEVENTO, ''E'', TE_ID, TE_IDPADRE), TE_TIPOEVENTO ';
      OpenQueryEx(sdqDatos, []);
      Modulos := chkModulos.Checked;
      MotivoIngreso := chkMotivoIngreso.Checked;
      RespuestasTabuladas := chkRespuestasPredefinidas.Checked;
      Visualizar(qrConfiguracionAGENDA, GetValores(), [oAlwaysShowDialog, oForceShowModal, oForceDB, oAutoFirma], True, '', '', True);
    finally
      qrConfiguracionAGENDA.Free;
    end;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.tbEliminarTareaConcatenadaClick(Sender: TObject);
begin
  BeginTrans(True);
  sdqTareaConcatenada.Delete;
  CommitTrans(True);
end;

procedure TfrmManATE_TIPOEVENTO.tbModificarTareaConcatenadaClick(Sender: TObject);
var
  tslAux: TStrings;
begin
  Verificar(sdqTareaConcatenada.IsEmpty, tbModificarTareaConcatenada, 'Debe seleccionar un registro para poder editarlo.');
  with sdqTareaConcatenada do
  begin
    rgAccion.ItemIndex := Integer(IIF(FieldByName('TC_ACCION').AsString = 'C', 0, 1));
    rgCondicion.ItemIndex := Integer(IIF(FieldByName('TC_CONDICION').AsString = 'S', 0, 1));
    fraNuevaTarea.Codigo := FieldByName('TC_IDTAREA_CREADA').AsString;
    fraNuevaTareaPropiedadesChange(nil);
    fraTC_IDMOTIVOINGRESO.Codigo := FieldByName('TC_IDMOTIVOINGRESO').AsString;
    fraTC_IDRESPUESTA.Codigo := FieldByName('TC_IDRESPUESTA').AsString;
    chkTC_COPIAADJUNTO.Checked := FieldByName('TC_COPIAADJUNTO').AsString = 'S';
    chkTC_COPIARCANAL.Checked := FieldByName('TC_COPIARCANAL').AsString = 'S';
    chkTC_COPIADESCRIPCION.Checked := FieldByName('TC_COPIADESCRIPCION').AsString = 'S';
    chkTC_COPIARESPUESTA.Checked := FieldByName('TC_COPIARESPUESTA').AsString = 'S';
    chkTC_AVISOMAIL.Checked := FieldByName('TC_AVISOMAIL').AsString = 'S';
    chkTC_COPIARCANALClick(nil);

    tslAux := TStringList.Create;
    try
      if not FieldByName('TC_SQL').IsNull then
        BlobSql('SELECT TC_SQL FROM AGENDA.ATC_TAREACONCATENADA WHERE TC_ID = ' + FieldByName('TC_ID').AsString, tslAux);

      edTC_SQL.Lines.Text := tslAux.Text;
    finally
      tslAux.Free;
    end;
  end;
  AnalizoTareaConcatenada();
  fpTareasConcatenadas.Tag := 2;  
  fpTareasConcatenadas.ShowModal;  
end;

procedure TfrmManATE_TIPOEVENTO.tbNuevaTareaConcatenadaClick(Sender: TObject);
begin
  rgAccion.ItemIndex := -1;
  rgCondicion.ItemIndex := -1;
  fraTC_IDRESPUESTA.Clear;
  fraNuevaTarea.Clear;
  fraTC_IDMOTIVOINGRESO.Clear;
  edTC_SQL.Clear;
  chkTC_COPIAADJUNTO.Checked := True;
  chkTC_COPIARCANAL.Checked := False;
  chkTC_COPIADESCRIPCION.Checked := True;
  chkTC_COPIARESPUESTA.Checked := True;
  chkTC_AVISOMAIL.Checked := True;
  AnalizoTareaConcatenada();
  fpTareasConcatenadas.Tag := 1;
  fpTareasConcatenadas.ShowModal;
end;

procedure TfrmManATE_TIPOEVENTO.tbOrdenamientoClick(Sender: TObject);
var
  bSube: Boolean;
begin
  bSube := (Sender as TToolButton) = tbSubir;
  
  with objSQL do
    try
      BeginTrans(True);
      SqlType := stUpdate;
      PrimaryKey.Clear;
      PrimaryKey.Add('TM_ID', sdqAsociadosTM_ID.AsInteger);
      Fields.Clear;
      Fields.Add('TM_FECHABAJA', exNull);
      Fields.Add('TM_USUBAJA', exNull);
      Fields.Add('TM_FECHAMODIF', exDateTime);
      Fields.Add('TM_USUMODIF', Sesion.UserID);
      Fields.Add('TM_ORDEN', sdqAsociadosTM_ORDEN.AsInteger + StrToInt(iif(bSube, -1, 1)));
      ExtraCondition := '';

      EjecutarSqlST(Sql);

      {Ahora reacomodo el resto de los índices}
      PrimaryKey.Clear;
      PrimaryKey.Add('TM_IDTIPOEVENTO', sdqConsulta.FieldByName('TE_ID').AsInteger);
      Fields.Clear;
      Fields.AddExpression('TM_ORDEN', String(' TM_ORDEN ' + iif(bSube, '+', '-') + ' 1 '));
      Fields.Add('TM_USUMODIF', Sesion.UserID);
      Fields.Add('TM_FECHAMODIF', exDateTime);

      ExtraCondition := ' AND TM_ORDEN = ' + sdqAsociados.FieldByName('TM_ORDEN').AsString + iif(bSube, ' - 1 ', ' + 1 ') +
                        ' AND TM_ID <> ' + sdqAsociados.FieldByName('TM_ID').AsString;
      EjecutarSqlST(Sql);
      ExtraCondition := '';
      fpAbmShow(nil);
    except
      on e: Exception do
        InfoHint(tbAsociar, E.Message);
    end;
end;

procedure TfrmManATE_TIPOEVENTO.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbPropiedades, 'Debe seleccionar un registro para duplicarlo.');
  inherited;
  ModoABM := maAlta;
  ModoABMToSqlType;
  ClearControls;
  fpABM.Caption := CAPTION_ALTA;
  LoadControls;
  fpABM.ShowModal;
end;

procedure TfrmManATE_TIPOEVENTO.tbRemoverClick(Sender: TObject);
begin
  if MsgAsk('¿Confirma que desea remover la asociación?') then
  with objSQL do
  begin
    try
      BeginTrans(True);
      SqlType := stUpdate;
      PrimaryKey.Clear;
      PrimaryKey.Add('TM_ID', sdqAsociadosTM_ID.AsInteger);
      Fields.Clear;
      Fields.Add('TM_FECHABAJA', exDateTime);
      Fields.Add('TM_USUBAJA', Sesion.UserID);

      EjecutarSqlST(Sql);
      fpAbmShow(nil);
    except
      on e: Exception do
        InfoHint(tbRemover, E.Message);
    end;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.tsModulosResize(Sender: TObject);
begin
  inherited;
  dbgDisponibles.Width := Round((tsModulos.Width - pnlMedio.Width - pnlOrdenamiento.Width) / 2);
end;

procedure TfrmManATE_TIPOEVENTO.AnalizoTareaConcatenada;
begin
  fraNuevaTarea.Propiedades.ExtraCondition := ' AND te_tipoevento = ''T'' AND te_idproceso = ' + fraPROCESO.ID;  
  pcTareaConcatenada.Enabled := (rgAccion.ItemIndex > -1) and (rgCondicion.ItemIndex > -1);
  TAdvOfficeRadioButton(THackCustomAdvOfficeRadioGroup(rgCondicion).Buttons[1]).Enabled := rgAccion.ItemIndex = 0;

  try
    tsAux.TabVisible := True;
    tsScriptTareaConcatenada.TabVisible := True;
    tsTareaConcatenada.TabVisible := True;

    tsTareaConcatenada.TabVisible := rgAccion.ItemIndex = 0;
    tsScriptTareaConcatenada.TabVisible := rgAccion.ItemIndex = 1;
    tsAux.TabVisible := not (tsTareaConcatenada.TabVisible or tsScriptTareaConcatenada.TabVisible);
  except
  end;
end;

procedure TfrmManATE_TIPOEVENTO.SeleccionarArbol(Sender: TObject; Node: TTreeNode);
begin
  with frmArbolSectoresEmbebido do
  begin
    if sdqSectores.Active and not sdqSectores.FieldByName('SE_ID').IsNull then
//      RefrescarConsultas;

//    Paginas.Visible := sdqSectores.FieldByName('PRIVACIDAD').IsNull;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.ClearControls;
begin
  inherited;
  edTE_DESCRIPCION.Clear;
  edTE_AYUDA.Clear;
  fraPROCESO.Clear;
  fraTIPODESTINATARIO.Clear;
  fraMotivoPadre.Clear;
  edTE_SQL.Lines.Clear;
  edTE_RESPUESTASUGERIDAFIJA.Clear;
  edDIAS_RESOLUCION.Clear;
  edHORAS_RESOLUCION.Clear;
  edMINUTOS_RESOLUCION.Clear;
  rgTipo.ItemIndex := -1;
  clbMotivoIngreso.ClearChecks;
  fraSE_IDSECTOR.Clear;
  fraSE_SECTOR.Clear;
  fraSE_CARGO.Clear;
  edTE_SQLEXPLICACION.Clear;
  edUltimoCambio.Lines.Clear;
  edMotivoCambio.Lines.Clear;
  sdqUsuarios.Close;
  rgTipoClick(nil);
  pcModulos.ActivePage := tsConsultaSQL;
  pcRESPUESTA.ActivePage := tsRESPUESTASUGERIDAFIJA;
  tsModulos.TabVisible := False;
  tsSector.TabVisible := False;
end;

procedure TfrmManATE_TIPOEVENTO.ClearData;
begin
  inherited;
  fraTI_IDMOTIVOINGRESO.Clear;
  fraTE_IDPROCESO.Clear;
  fraTE_IDPADRE.Clear;
  rgTipoEvento.ItemIndex := 0;
  rgSQL.ItemIndex := 0;
  rgBajas.ItemIndex := 1;
  sbEstado.Panels[0].Text := '';
  clbConsultaMotivosDeIngreso.ClearChecks;
  clbFiltroMotivosIngreso.ClearChecks;
  clbFiltroModulos.ClearChecks;
  pnlTotalRegistros.Caption := '';
  pnlTotalRegistros.Visible := False;
  pnlTotalRegistros.Parent := nil;
end;

procedure TfrmManATE_TIPOEVENTO.DBAdvCardListTareasConcatenadasCardDblClick(Sender: TObject; Card: TAdvCard);
begin
  tbModificarTareaConcatenada.Click;
end;

function TfrmManATE_TIPOEVENTO.DoABM: Boolean;
var
  sSQL, sTextoAux: String;
  i, IdTabla: Integer;
  tslRespuesta: TStringList;
begin
  tslRespuesta := TStringList.Create;
  Result := False;
  try
    BeginTrans(True);
    try
      Sql.Clear;
      if ModoABM = maBaja then
      begin
        Sql.PrimaryKey.Add('TE_ID', sdqConsulta.FieldByName('TE_ID').AsInteger);
        Sql.Fields.Add('TE_FECHABAJA', exDate);
        Sql.Fields.Add('TE_USUBAJA', Sesion.UserID);
        Sql.SqlType := stUpdate;
      end else
      begin
        if (ModoABM = maAlta) or bAplicarEnAlta then
        begin
          Sql.PrimaryKey.AddInteger('TE_ID', ValorSQLInteger('SELECT NVL(MAX(TE_ID), 0) FROM AGENDA.ATE_TIPOEVENTO') + 1);
          Sql.Fields.Add('TE_FECHAALTA', exDate);
          Sql.Fields.Add('TE_USUALTA', Sesion.UserID);
          Sql.SqlType := stInsert;
        end else
        if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.Add('TE_ID', sdqConsulta.FieldByName('TE_ID').AsInteger);
          Sql.Fields.Add('TE_FECHAMODIF', exDate);
          Sql.Fields.Add('TE_USUMODIF', Sesion.UserID);
          Sql.Fields.Add('TE_FECHABAJA', exNull);
          Sql.Fields.Add('TE_USUBAJA', exNull);
          Sql.SqlType := stUpdate;
        end;

        Sql.Fields.Add('TE_DESCRIPCION', edTE_DESCRIPCION.Text);
        Sql.Fields.Add('TE_AYUDA', edTE_AYUDA.Lines.Text);
        Sql.Fields.Add('TE_IDPADRE', fraMotivoPadre.Value, True);
        Sql.Fields.Add('TE_RESPUESTASUGERIDAFIJA', Trim(edTE_RESPUESTASUGERIDAFIJA.Lines.Text));
        Sql.Fields.Add('TE_IDPROCESO', fraPROCESO.Value);
        Sql.Fields.Add('TE_IDDESTINATARIO', fraTIPODESTINATARIO.Value, True);
        Sql.Fields.Add('TE_TIPOEVENTO', iif(rgTipo.ItemIndex = 0, 'E', 'T'), dtString);
        Sql.Fields.Add('TE_ULTIMOCAMBIO', Trim(edMotivoCambio.Lines.Text));

        if rgTipo.ItemIndex = 1 then
          Sql.Fields.AddInteger('TE_TIEMPORESOLUCION', Trunc(edDIAS_RESOLUCION.Value*24*60) + Trunc(edHORAS_RESOLUCION.Value*60) + edMINUTOS_RESOLUCION.Value, True)
        else
          Sql.Fields.AddExpression('TE_TIEMPORESOLUCION', exNull);

        tslRespuesta.Text := String(iif(Trim(edTE_SQLEXPLICACION.Lines.Text) > '', (SQL_OPEN_COMMENT + Trim(edTE_SQLEXPLICACION.Lines.Text) + SQL_CLOSE_COMMENT + CRLF), '')) + Trim(edTE_SQL.Lines.Text);

        if Length(tslRespuesta.Text) <= 4000 then
//          Sql.Fields.Add('TE_SQL', StringReplace(tslRespuesta.Text, #$D#$A, ' '' || CHR(13) || CHR(10) || '' ' + #$D#$A, [rfReplaceAll]));
          Sql.Fields.Add('TE_SQL', tslRespuesta.Text);
      end;

      if fraTIPODESTINATARIO.IsSelected and (fraTIPODESTINATARIO.Id = '-1') then
      begin
        Sql.Fields.AddInteger('TE_DESTINATARIO_IDSECTOR', StrToIntDef(fraSE_IDSECTOR.Id, 0), True);
        Sql.Fields.Add('TE_DESTINATARIO_SECTOR', fraSE_SECTOR.Codigo);
        Sql.Fields.Add('TE_DESTINATARIO_CARGO', fraSE_CARGO.Codigo);
      end else
      begin
        Sql.Fields.AddExpression('TE_DESTINATARIO_IDSECTOR', exNull);
        Sql.Fields.AddExpression('TE_DESTINATARIO_SECTOR', exNull);
        Sql.Fields.AddExpression('TE_DESTINATARIO_CARGO', exNull);
      end;

      Result := inherited DoABM;

      if Length(tslRespuesta.Text) > 4000 then
        SaveBlob('SELECT TE_SQL FROM AGENDA.ATE_TIPOEVENTO WHERE TE_ID = ' + SqlString(Sql.PrimaryKey.FieldByName['TE_ID'].Value),
                 'UPDATE AGENDA.ATE_TIPOEVENTO SET TE_SQL = :TE_SQL WHERE TE_ID = ' + SqlString(Sql.PrimaryKey.FieldByName['TE_ID'].Value),
                 'TE_SQL', tslRespuesta);


      sSQL := FSqlComboMotivos;
      AddCondition(sSQL, ' TI_IDTIPOEVENTO = :ID ');
      AddCondition(sSQL, ' TI_FECHABAJA IS NULL ');

      IdTabla := Sql.PrimaryKey.FieldByName['TE_ID'].Value;

      with GetQueryEx(sSQL, [IdTabla]) do
      try
        while not Eof do
        begin
          sTextoAux := Fields[0].AsString;
          if clbMotivoIngreso.ItemsChecked.IndexOf(sTextoAux) = -1 then
            EjecutarSQLSTEx('UPDATE agenda.ati_tipoeventomotivoingreso ' +
                               'SET ti_usubaja = :usuario, ' +
                                   'ti_fechabaja = SYSDATE ' +
                             'WHERE ti_idtipoevento = :id ' +
                               'AND ti_idmotivoingreso = :idmotivo ' +
                               'AND ti_fechabaja IS NULL', [Sesion.UserID, IdTabla, Fields[1].AsInteger]);
          Next;
        end;

        for i := 0 to clbMotivoIngreso.ValuesChecked.Count - 1 do
          if not Locate('MI_ID', clbMotivoIngreso.ValuesChecked[i], []) then
            EjecutarSQLSTEx('INSERT INTO agenda.ati_tipoeventomotivoingreso ' +
                            ' (ti_id, ti_idtipoevento, ti_idmotivoingreso, ti_usualta, ti_fechaalta) ' +
                            ' VALUES ' +
                            ' (agenda.seq_ati_id.NextVal, :idtipoevento, :idmotivoingreso, :usuario, SYSDATE) ',
                            [IdTabla, clbMotivoIngreso.ValuesChecked[i], Sesion.UserID]);
      finally
        Free;
      end;

      CommitTrans(True);
      sdqConsultaAfterScroll(nil);
    except
      on E: Exception do
      begin
        RollBack(True);
        raise Exception.Create('Ocurrió un error al momento de almacenar los datos.' + CRLF + E.Message);
      end;
    end;
  finally
    tslRespuesta.Free;
  end;
end;

procedure TfrmManATE_TIPOEVENTO.LoadControls;
var
  sSQL: String;
  tslAux: TStringList;
begin
  with sdqConsulta do
  begin
    edTE_DESCRIPCION.Text := FieldByName('TE_DESCRIPCION').AsString;
    edTE_AYUDA.Lines.Text := FieldByName('TE_AYUDA').AsString;
    fraPROCESO.Value := FieldByName('TE_IDPROCESO').AsInteger;
    fraTIPODESTINATARIO.Value := FieldByName('TE_IDDESTINATARIO').AsInteger;
    fraTIPODESTINATARIOPropiedadesChange(nil);
    fraMotivoPadre.Value := FieldByName('TE_IDPADRE').AsInteger;

    tslAux := TStringList.Create;
    try
      BlobSql('SELECT TE_SQL FROM AGENDA.ATE_TIPOEVENTO WHERE TE_ID = ' + FieldByName('TE_ID').AsString, tslAux);
      edTE_SQL.Lines.Text := RemoveFirstSQLCommment(tslAux.Text);
    finally
      tslAux.Free;
    end;

    edTE_SQLEXPLICACION.Lines.Text := FieldByName('SQLEXPLICACION').AsString;
    edTE_RESPUESTASUGERIDAFIJA.Lines.Text := FieldByName('TE_RESPUESTASUGERIDAFIJA').AsString;
    edUltimoCambio.Lines.Text := FieldByName('TE_ULTIMOCAMBIO').AsString;
    edMotivoCambio.Lines.Clear;

    if fraTIPODESTINATARIO.IsSelected and (fraTIPODESTINATARIO.Id = '-1') then
    begin
      fraSE_IDSECTOR.Propiedades.ExtraCondition := ' AND se_nivel = 4 ';
      fraSE_CARGO.Propiedades.ExtraCondition := ' ';

      fraSE_IDSECTOR.Value := FieldByName('TE_DESTINATARIO_IDSECTOR').AsInteger;
      fraSE_SECTOR.Codigo := FieldByName('TE_DESTINATARIO_SECTOR').AsString;
      fraSE_CARGO.Codigo := FieldByName('TE_DESTINATARIO_CARGO').AsString;
      ActualizarUsuarios(nil);
    end else
    begin
      fraSE_IDSECTOR.Clear;
      fraSE_SECTOR.Clear;
      fraSE_CARGO.Clear;
      sdqUsuarios.Close;
    end;

    if IsEmptyString(edTE_RESPUESTASUGERIDAFIJA.Lines.Text) and not IsEmptyString(edTE_SQL.Lines.Text) then
      pcRESPUESTA.ActivePageIndex := 1
    else
      pcRESPUESTA.ActivePageIndex := 0;

    edDIAS_RESOLUCION.Value := FieldByName('DIAS_RESOLUCION').AsInteger;
    edHORAS_RESOLUCION.Value := FieldByName('HORAS_RESOLUCION').AsInteger;
    edMINUTOS_RESOLUCION.Value := FieldByName('MINUTOS_RESOLUCION').AsInteger;
    rgTipo.ItemIndex := StrToInt(iif(FieldByName('TE_TIPOEVENTO').AsString = 'E', 0, 1));
  end;

  clbMotivoIngreso.ClearChecks;
  clbMotivoIngreso.SQL := FSqlComboMotivos;

  sSQL := FSqlComboMotivos;
  AddCondition(sSQL, ' TI_FECHABAJA IS NULL ');
  AddCondition(sSQL, ' TI_IDTIPOEVENTO = :ID ');

  with GetQueryEx(sSQL, [sdqConsulta.FieldByName('TE_ID').AsInteger]) do
  try
    while not Eof do
    begin
      clbMotivoIngreso.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
  chkTS_FECHABAJAClick(nil);
  tsModulos.TabVisible := True;
  tsSector.TabVisible := True;
  pcModulos.ActivePageIndex := 0;
end;

procedure TfrmManATE_TIPOEVENTO.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltrosFiltrables);
  case rgTipoEvento.ItemIndex of
    1: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_TIPOEVENTO = ''E'' ';
    2: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_TIPOEVENTO = ''T'' ';
  end;
  case rgSQL.ItemIndex of
    1: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_SQL IS NOT NULL ';
    2: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_SQL IS NULL ';
  end;
  case rgBajas.ItemIndex of
    1: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_FECHABAJA IS NULL ';
    2: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_FECHABAJA IS NOT NULL ';
  end;

  if clbFiltroMotivosIngreso.CheckedValues.Count > 0 then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND EXISTS(SELECT 1 FROM AGENDA.ATI_TIPOEVENTOMOTIVOINGRESO WHERE TI_IDTIPOEVENTO = TE_ID AND TI_FECHABAJA IS NULL ' + clbFiltroMotivosIngreso.InSQL_IntegerValues('TI_IDMOTIVOINGRESO') + ') ';

  if clbFiltroModulos.CheckedValues.Count > 0 then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND EXISTS(SELECT 1 FROM AGENDA.ATM_TIPOMODULOEVENTO WHERE TM_IDTIPOEVENTO = TE_ID AND TM_FECHABAJA IS NULL ' + clbFiltroModulos.InSQL_IntegerValues('TM_IDMODULOEVENTO') + ') ';

  if fraTS_IDSECTOR.IsSelected then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND EXISTS(SELECT 1 FROM AGENDA.ATS_TIPOEVENTOSECTOR WHERE TS_IDSECTOR = ' + SQLValue(fraTS_IDSECTOR.Value) + ') ';

  if fraTI_IDMOTIVOINGRESO.IsSelected then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND EXISTS(SELECT 1 FROM AGENDA.ATI_TIPOEVENTOMOTIVOINGRESO WHERE TI_IDTIPOEVENTO = TE_ID AND TI_FECHABAJA IS NULL AND TI_IDMOTIVOINGRESO = ' + SQLValue(fraTI_IDMOTIVOINGRESO.Value) + ') ';

  sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManATE_TIPOEVENTO.Validar: Boolean;
begin
  Verificar(Trim(edTE_DESCRIPCION.Text) = '', edTE_DESCRIPCION, 'Debe completar la descripción.');
  Verificar(clbMotivoIngreso.CheckedItems.Count = 0, clbMotivoIngreso, 'Debe seleccionar el evento al que pertenece este motivo o tarea.');
  Verificar(fraPROCESO.IsEmpty, fraPROCESO.edCodigo, 'Debe seleccionar el proceso al que pertenece este motivo o tarea.');
  Verificar(Pos(':', edTE_SQLEXPLICACION.Lines.Text) > 0, edTE_SQLEXPLICACION, 'No se puede usar el caracter ":" en este texto explicativo.');
  Verificar((rgTipo.ItemIndex = 1) and (not fraTIPODESTINATARIO.IsSelected), fraTIPODESTINATARIO.edCodigo, 'Debe seleccionar un destinatario conceptual para esta tarea.');
  Verificar(fraTIPODESTINATARIO.IsSelected and (fraTIPODESTINATARIO.Codigo = '-1') and fraSE_SECTOR.IsEmpty and fraSE_CARGO.IsEmpty and fraSE_IDSECTOR.IsEmpty, fraSE_SECTOR.edCodigo, 'Debe seleccionar al menos un sector o un cargo.');  

  if fraTIPODESTINATARIO.IsSelected and (fraTIPODESTINATARIO.Codigo = '-1') and sdqUsuarios.Active and (not sdqUsuarios.IsEmpty) and (sdqUsuarios.RecordCount > 10) then
  begin
    if not MsgAsk('Ante la carga de una tarea de esta naturaleza se involucrarán a mas de 10 personas.' + CRLF + '¿Está seguro que desea continuar?') then
      Abort;
  end;  

  if Trim(edTE_RESPUESTASUGERIDAFIJA.Lines.Text) > '' then
    edTE_SQL.Lines.Text := 'SELECT ' + SQLValue(edTE_RESPUESTASUGERIDAFIJA.Lines.Text) + ' as texto FROM dual';
    
  btnValidarConsulta.Click;
  Verificar(IsEmptyString(edMotivoCambio.Lines.Text), edMotivoCambio, 'Debe indicar el motivo del cambio.');
  Result := True;
end;

procedure TfrmManATE_TIPOEVENTO.TimerScrollTimer(Sender: TObject);
var
  sSQL: String;
begin
  TimerScroll.Enabled := False;
  if sdqConsulta.IsEmpty then
  begin
    RefreshData;
    Exit;
  end;

  clbConsultaMotivosDeIngreso.ClearChecks;
  clbConsultaMotivosDeIngreso.SQL := FSqlComboMotivos;

  sSQL := FSqlComboMotivos;
  AddCondition(sSQL, ' TI_FECHABAJA IS NULL ');
  AddCondition(sSQL, ' TI_IDTIPOEVENTO = :ID ');

  with GetQueryEx(sSQL, [sdqConsulta.FieldByName('TE_ID').AsInteger]) do
  try
    while not Eof do
    begin
      clbConsultaMotivosDeIngreso.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;

  OpenQueryEx(sdqAsociados, [sdqConsulta.FieldByName('TE_ID').AsInteger]);
end;

procedure TfrmManATE_TIPOEVENTO.GestionarABMTextoReemplazo(AHabilitado: Boolean);
begin
  VCLExtra.LockControls(pnlDatosTextoReemplazo, not AHabilitado);
  tbAgregarTexto.Visible := not AHabilitado;
  tbModificarTexto.Visible := not AHabilitado;
  tbEliminarTexto.Visible := not AHabilitado;
  tbAceptarTexto.Visible := AHabilitado;
  tbCancelarTexto.Visible := AHabilitado;

  tbModificarTexto.Enabled := not sdqTextoReemplazo.IsEmpty;
  tbEliminarTexto.Enabled := not sdqTextoReemplazo.IsEmpty;
end;

procedure TfrmManATE_TIPOEVENTO.tbAgregarTextoClick(Sender: TObject);
begin
  GestionarABMTextoReemplazo(True);
  sdqTextoReemplazo.Insert;
end;

procedure TfrmManATE_TIPOEVENTO.tbAceptarTextoClick(Sender: TObject);
begin
  Verificar(IsEmptyString(edTR_CLAVE.Text), edTR_CLAVE, 'Debe indicar el texto que se quiere reemplazar.');
  Verificar(IsEmptyString(edTR_TEXTO.Text), edTR_TEXTO, 'Debe indicar el texto que va a reemplazar.');
  Verificar(edTR_CLAVE.Text = edTR_TEXTO.Text, edTR_TEXTO, 'No tiene sentido que el texto a reemplazar y el que lo reemplace sean iguales.');
  Verificar(IsEmptyString(edTR_EXPLICACION.Text), edTR_EXPLICACION, 'Debe indicar la explicación sobre el texto que va a reemplazar.');
  sdqTextoReemplazo.FieldByName('TR_IDTIPOEVENTO').AsInteger := sdqConsulta.FieldByName('TE_ID').AsInteger;
  sdqTextoReemplazo.Post;
  sdqTextoReemplazo.ApplyUpdates;
  GestionarABMTextoReemplazo(False);
end;

procedure TfrmManATE_TIPOEVENTO.tbCancelarTextoClick(Sender: TObject);
begin
  sdqTextoReemplazo.Cancel;
  sdqTextoReemplazo.CancelUpdates;
  GestionarABMTextoReemplazo(False);
end;

procedure TfrmManATE_TIPOEVENTO.tbModificarTextoClick(Sender: TObject);
begin
  GestionarABMTextoReemplazo(True);
end;

procedure TfrmManATE_TIPOEVENTO.tbEliminarTextoClick(Sender: TObject);
begin
  BeginTrans(True);
  sdqTextoReemplazo.Delete;
  CommitTrans(True);
end;

procedure TfrmManATE_TIPOEVENTO.pcRESPUESTAChange(Sender: TObject);
begin
  if (pcModulos.ActivePage = tsConsultaSQL) and (pcRESPUESTA.ActivePage = tsRESPUESTADINAMICA) then
    OpenQueryEx(sdqTextoReemplazo, [sdqConsulta.FieldByName('TE_ID').AsInteger]);
end;

procedure TfrmManATE_TIPOEVENTO.sdqTextoReemplazoAfterOpen(DataSet: TDataSet);
begin
  edTotalReemplazoTexto.Caption := IntToStr(sdqTextoReemplazo.RecordCount);
  GestionarABMTextoReemplazo(False);
end;

procedure TfrmManATE_TIPOEVENTO.chkTC_COPIARCANALClick(Sender: TObject);
begin
  inherited;
  VCLEXtra.LockControls([fraTC_IDMOTIVOINGRESO], chkTC_COPIARCANAL.Checked);
  if chkTC_COPIARCANAL.Checked then
    fraTC_IDMOTIVOINGRESO.Clear;
end;

end.
