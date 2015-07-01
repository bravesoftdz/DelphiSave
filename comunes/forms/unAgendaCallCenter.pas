Esta pantalla ya no va mas... ahora se llama unAgendaCargaConsulta.pas

unit unAgendaCallCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, AdvToolBar,
  AdvToolBarStylers, AdvPanel, ExtCtrls, AdvGlowButton, AdvNavBar,
  StdCtrls, DBCtrls, DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, JvExExtCtrls, JvComponent, unFraTrabajador,
  unfraTrabajadorAGENDA, unFraCodigoDescripcion, unFraEstablecimiento,
  unfraEstablecimientoAGENDA, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unfraEmpresaAGENDA, JvPanel, unfraCPR_PRESTADOR,
  unfraPrestadorAGENDA, ShortCutControl, JvNavigationPane, Mask, ToolEdit,
  DateComboBox, unfraUsuarios, PatternEdit, IntEdit, unFraCodDesc, unAgenda,
  ActnList, Menus, SortDlg, unInterfaces, JvExDBGrids, JvDBGrid;

type
  TfrmAgendaCALLCENTER = class(TfrmCustomForm, IModoABM)
    acAcciones: TActionList;
    acOrdenar: TAction;
    AdvNavBar: TAdvNavBar;
    AdvPage4: TAdvPage;
    AdvPanelStyler: TAdvPanelStyler;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvToolBarPager: TAdvToolBarPager;
    btnConsultar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
    btnOrdenar: TAdvGlowButton;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    dsEstadisticas: TDataSource;
    dsEventos: TDataSource;
    editAE_CONTACTO_LIKE: TEdit;
    edAE_FECHAALTADesde: TDateComboBox;
    edAE_FECHAALTAHasta: TDateComboBox;
    edAE_FECHABAJAADesde: TDateComboBox;
    edAE_FECHABAJAAHasta: TDateComboBox;
    edAE_FECHAHORAINICIODesde: TDateComboBox;
    edAE_FECHAHORAINICIOHasta: TDateComboBox;
    edAE_FECHAMODIFDesde: TDateComboBox;
    edAE_FECHAMODIFHasta: TDateComboBox;
    edAE_FECHAVENCIMIENTODesde: TDateComboBox;
    edAE_FECHAVENCIMIENTOHasta: TDateComboBox;
    edAE_ID: TIntEdit;
    edAE_CONTACTO_LIKE: TEdit;
    edAE_CORREOELECTRONICO_LIKE: TEdit;
    edDescripcion: TDBMemo;
    edDetalle: TDBMemo;
    edAE_NUMEROTELEFONO_LIKE: TPatternEdit;
    fraAE_CONTRATO: TfraEmpresaAGENDA;
    fraAE_IDPRESTADOR: TfraPrestadorAGENDA;
    fraAE_IDTRABAJADOR: TfraTrabajadorAGENDA;
    fraAE_USUALTA: TfraUsuario;
    fraAE_USUBAJA: TfraUsuario;
    fraAE_USUMODIF: TfraUsuario;
    fraES_ID: TfraEstablecimientoAGENDA;
    fraTE_IDEVENTO: TfraCodDesc;
    fraTE_IDPROCESO: TfraCodDesc;
    JvOutlookSplitter: TJvOutlookSplitter;
    JvPanel2: TPanel;
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
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mnuOrdenarPor: TMenuItem;
    nbpEstadisticas: TAdvNavBarPanel;
    nbpNotas: TAdvNavBarPanel;
    pmuMenuEmergente: TPopupMenu;
    pnlBottom: TAdvPanel;
    pnlDatos: TPanel;
    pnlLeftData: TPanel;
    pnlLeftToolbar: TJvPanel;
    sdqEstadisticas: TSDQuery;
    sdqEstadisticasDIARIO: TFloatField;
    sdqEstadisticasMENSUAL: TFloatField;
    sdqEstadisticasSEMANAL: TFloatField;
    sdqEventos: TSDQuery;
    ShortCutControl: TShortCutControl;
    SortDialog: TSortDialog;
    tsEventos: TAdvPage;
    tsUsuariosFechas: TAdvPage;
    dbgTareasAsociadas: TJvDBGrid;
    sdqTareasAsociadas: TSDQuery;
    dsTareasAsociadas: TDataSource;
    acNuevoEvento: TAction;
    acModificarEvento: TAction;
    Modificarevento1: TMenuItem;
    Nuevoevento1: TMenuItem;
    acActualizar: TAction;
    GridEventos: TArtDBGrid;
    mnuAjustarGrilla: TMenuItem;
    JvOutlookSplitter1: TJvOutlookSplitter;
    N1: TMenuItem;
    procedure acActualizarExecute(Sender: TObject);
    procedure acModificarEventoExecute(Sender: TObject);
    procedure acNuevoEventoExecute(Sender: TObject);
    procedure acOrdenarExecute(Sender: TObject);
    procedure btnOrdenarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mnuAjustarGrillaClick(Sender: TObject);
    procedure sdqEventosAfterOpen(DataSet: TDataSet);
    procedure sdqEventosAfterScroll(DataSet: TDataSet);
    procedure sdqTareasAsociadasAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
    FModoABM: TModoABM;
    FIdTabla: Integer;
    FRefreshing: Boolean;
    procedure ClearNotes;
    procedure SetModoABM(const Value: TModoABM);    
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  published
    property ModoABM: TModoABM read FModoABM write SetModoABM;
  end;

var
  frmAgendaCALLCENTER: TfrmAgendaCALLCENTER;

implementation

uses
  General, unDmPrincipal, unSesion, CustomDlgs, VCLExtra,
  unArt, DateTimeFuncs, unFiltros, unGrids, unABMAgendaBaseEvento,
  unABMAgendaBase, DateUtils;

{$R *.dfm}

procedure TfrmAgendaCALLCENTER.acActualizarExecute(Sender: TObject);
var
  sSQL: String;
begin
  FRefreshing := True;
  try
    sSQL := FSQL + DoFiltro(pnlLeftData) + DoFiltro(tsUsuariosFechas) + DoFiltro(nbpNotas) + DoFiltro(tsEventos);
    Verificar(FSQL = sSQL, btnConsultar, 'Debe seleccionar al menos un filtro para poder ver los eventos cargados.'); 

    sSQL := sSQL + iif(SortDialog.OrderBy = '', ' ORDER BY AE_FECHAALTA DESC ', SortDialog.OrderBy);
    sdqEventos.Close;
    OpenQueryEx(sdqEventos, [Sesion.ID, TDateTimeEx.Create(ART_MINFECHA)], sSQL);

    if FIdTabla <> ART_EMPTY_ID then
      try
        sdqEventos.Locate('AE_ID', FIdTabla, []);
      except
      end;
  finally
    FRefreshing := False;
  end;
end;

procedure TfrmAgendaCALLCENTER.acModificarEventoExecute(Sender: TObject);
begin
  ModoABM := abmModificacion;
  try
    Abrir(TfrmABMAgendaBaseEvento, frmABMAgendaBaseEvento, tmvNormal, nil);
    with frmABMAgendaBaseEvento do
    try
      ModoCallCenter := True;
      ModoABM := Self.ModoABM;
      LoadFromQuery(sdqEventos, True, False);
      Visible := False;
      if ShowModal = mrOK then
      begin
        OpenQueryEx(sdqEstadisticas, [Sesion.UserID]);
        //OpenQueryEx(sdqEventos, [Sesion.ID, TDateTimeEx.Create(ART_MINFECHA)]);
        acActualizar.Execute;
        ClearNotes;
      end;
    finally
      FreeAndNil(frmABMAgendaBaseEvento);
    end;
  finally
    ModoABM := abmNone;
  end;
end;

procedure TfrmAgendaCALLCENTER.acNuevoEventoExecute(Sender: TObject);
var
  dAhora: TDateTime;
begin
  ModoABM := abmAlta;
  try
    Abrir(TfrmABMAgendaBaseEvento, frmABMAgendaBaseEvento, tmvNormal, nil);
    with frmABMAgendaBaseEvento do
    try
      ModoCallCenter := True;
      ModoABM := Self.ModoABM;
      RegisterNotes(edAE_CONTACTO_LIKE.Text, edAE_NUMEROTELEFONO_LIKE.Text, edAE_CORREOELECTRONICO_LIKE.Text);
      AltaEvento;

      dAhora := DBDateTime;
      edFechaEvento.Date := Trunc(dAhora);
      edFechaFin.Date := Trunc(dAhora);
      teHoraDesde.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn', dAhora));
      teHoraHasta.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn', dAhora)) + OneMinute;

      Visible := False;
      if ShowModal = mrOK then
      begin
        OpenQueryEx(sdqEstadisticas, [Sesion.UserID]);
        //OpenQueryEx(sdqEventos, [Sesion.ID, TDateTimeEx.Create(ART_MINFECHA)]);
        FIdTabla := ApptObject.IdTabla;
        acActualizar.Execute;
        ClearNotes;
      end;
    finally
      FreeAndNil(frmABMAgendaBaseEvento);
    end;
  finally
    ModoABM := abmNone;
  end;
end;

procedure TfrmAgendaCALLCENTER.acOrdenarExecute(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, GridEventos.Columns);
  SortDialog.Execute;
end;

procedure TfrmAgendaCALLCENTER.btnOrdenarClick(Sender: TObject);
begin
  inherited;
  LoadDynamicSortFields(SortDialog.SortFields, GridEventos.Columns);
  SortDialog.Execute;
end;

procedure TfrmAgendaCALLCENTER.FormCreate(Sender: TObject);
begin
  FRefreshing := False;
  pnlLeftToolbar.Transparent := True;
  btnModificar.Enabled := False;
  inherited;
  edAE_FECHAALTADesde.Date := DBDate - 7;  
  FSQL := sdqEventos.SQL.Text;
  AdvToolBarPager.ActivePageIndex := 0;
  fraAE_CONTRATO.ShowBajas := True;
  fraAE_CONTRATO.FrameEstablecimiento := fraES_ID;
  fraAE_CONTRATO.FrameTrabajador := fraAE_IDTRABAJADOR;
  fraES_ID.ShowBajas := True;
  fraES_ID.fraEmpresa := fraAE_CONTRATO;
  fraAE_IDTRABAJADOR.ShowBajas := True;
  fraAE_IDTRABAJADOR.FrameEmpresa := fraAE_CONTRATO;
  HideTitleBar;
  ClearNotes;
  OpenQueryEx(sdqEstadisticas, [Sesion.UserID]);
  Width := Width + 1;
  Application.ProcessMessages;
  Width := Width - 1;
  acActualizar.Execute;    
end;

procedure TfrmAgendaCALLCENTER.GridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FieldName, ['EV_DESCRIPCION', 'TE_DESCRIPCION']) and (sdqEventos.FieldByName('AE_ESTADO').AsInteger = ESTADO_EVENTO_TERMINADO) then
    AFont.Color := $00215822;
  if AreIn(Field.FieldName, ['SE_NOMBRE']) and (sdqEventos.FieldByName('AE_FECHALEIDO').IsNull) then
    AFont.Style := AFont.Style + [fsBold];
end;

procedure TfrmAgendaCALLCENTER.sdqEventosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  btnModificar.Enabled := not sdqEventos.IsEmpty;
end;

procedure TfrmAgendaCALLCENTER.ClearNotes;
begin
  edAE_CONTACTO_LIKE.Clear;
  edAE_NUMEROTELEFONO_LIKE.Clear;
  edAE_CORREOELECTRONICO_LIKE.Clear;
end;

procedure TfrmAgendaCALLCENTER.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and not WS_CAPTION;
end;

procedure TfrmAgendaCALLCENTER.mnuAjustarGrillaClick(Sender: TObject);
begin
  inherited;
  VCLExtra.DynColWidthsByData(GridEventos);
  GridEventos.Width := GetColumnWidths(GridEventos, True);
end;

procedure TfrmAgendaCALLCENTER.sdqEventosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  OpenQueryEx(sdqTareasAsociadas, [sdqEventos.FieldByName('AE_ID').AsInteger]);

  if not FRefreshing then
  begin
    if sdqEventos.Active and not sdqEventos.IsEmpty then
      FIdTabla := sdqEventos.FieldByName('AE_ID').AsInteger
    else
      FIdTabla := ART_EMPTY_ID;
  end;
end;

procedure TfrmAgendaCALLCENTER.sdqTareasAsociadasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(dbgTareasAsociadas);  
end;

procedure TfrmAgendaCALLCENTER.SetModoABM(const Value: TModoABM);
begin
  FModoABM := Value;
  btnNuevo.Enabled := Value = abmNone;
  btnModificar.Enabled := Value = abmNone;
end;

end.
