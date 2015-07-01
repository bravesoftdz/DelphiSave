unit unfraVistaEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, DB, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, DBCtrls, StdCtrls, ExtCtrls,
  JvExExtCtrls, JvNavigationPane, AdvPageControl, Menus, ActnList, ImgList,
  SortDlg, Placemnt, JvExDBGrids, JvDBGrid, FieldHider, QueryPrint,
  QueryToFile, ExportDialog, JvExStdCtrls, JvMemo, JvComponent, JvComponentBase,
  RxPlacemnt;

type
  TfraVistaEventos = class(TArtDbFrame)
    pnlReferencias: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label40: TLabel;
    pnlEventoAjeno: TPanel;
    pnlEventoCerrado: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Panel6: TPanel;
    ilToolbar: TImageList;
    acAcciones: TActionList;
    acOrdenar: TAction;
    acNuevoEvento: TAction;
    acModificarEvento: TAction;
    acActualizar: TAction;
    acLimpiar: TAction;
    pmuMenuEmergente: TPopupMenu;
    mnuNuevoEvento: TMenuItem;
    mnuModificarEvento: TMenuItem;
    mnuEliminarEvento: TMenuItem;
    mnuOrdenarPor: TMenuItem;
    N1: TMenuItem;
    mnuAjustarGrilla: TMenuItem;
    pgBarraLateral: TAdvPageControl;
    tsEvento: TAdvTabSheet;
    os2: TJvOutlookSplitter;
    pgBarraLateralEvento: TAdvPageControl;
    tsDetalleEvento: TAdvTabSheet;
    edDetalle: TDBMemo;
    tsRespuesta: TAdvTabSheet;
    edRespuesta: TDBMemo;
    pnlDescripcionEvento: TPanel;
    pnlTituloDescEvento: TPanel;
    edDescripcion: TDBMemo;
    tsTareas: TAdvTabSheet;
    pnlBottomTarea: TPanel;
    os3: TJvOutlookSplitter;
    Panel3: TPanel;
    DBText4: TDBText;
    DBText5: TDBText;
    edEstadoTarea: TDBText;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBText8: TDBText;
    Label37: TLabel;
    Panel4: TPanel;
    lbTarea: TLabel;
    tbTareas: TToolBar;
    tbAnterior: TToolButton;
    tbSiguiente: TToolButton;
    AdvPageControlTareas: TAdvPageControl;
    AdvTabSheet1: TAdvTabSheet;
    edDETALLE_TAREA: TDBMemo;
    tsRESPUESTA_TAREA: TAdvTabSheet;
    edRESPUESTA_TAREA: TDBMemo;
    pnlDescripcionTarea: TPanel;
    Panel8: TPanel;
    edDESCRIPCION_TAREA: TDBMemo;
    os1: TJvOutlookSplitter;
    GridEventos: TArtDBGrid;
    acEliminarEvento: TAction;
    SortDialog: TSortDialog;
    sdqEventos: TSDQuery;
    dsEventos: TDataSource;
    sdqTareasAsociadas: TSDQuery;
    dsTareasAsociadas: TDataSource;
    sdqEventoResuelto: TSDQuery;
    ilColor: TImageList;
    ilByN: TImageList;
    FormStorage: TFormStorage;
    Label1: TLabel;
    tsObservacionesEVENTO: TAdvTabSheet;
    sdqObservacionesEVENTO: TSDQuery;
    dsObservacionesEVENTO: TDataSource;
    Panel7: TPanel;
    lbObservacion: TLabel;
    ToolBar1: TToolBar;
    tbObsAnteriorEVENTO: TToolButton;
    tbObSiguienteEVENTO: TToolButton;
    edObservacionesEVENTO: TDBMemo;
    FieldHider: TFieldHider;
    N2: TMenuItem;
    mnuMostrarOcultarColumnas: TMenuItem;
    ExportDialog: TExportDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    mnuExportar: TMenuItem;
    ExportDialogDetalle: TExportDialog;
    mnuExportarDetalle: TMenuItem;
    pnlTareaGestionada: TPanel;
    lbTareaGestionada: TLabel;
    pnlDatosTareaGestionada: TPanel;
    Label3: TLabel;
    edFechaAltaTarea: TDBText;
    edUsuarioAltaTarea: TDBText;
    JvNavPaneStyleManager: TJvNavPaneStyleManager;
    pnlInstrucciones: TPanel;
    pnlDetalleInstrucciones: TJvMemo;
    Panel5: TPanel;
    Panel9: TPanel;
    Label4: TLabel;
    edFechaAltaObservacion: TDBText;
    edUsuarioAltaObservacion: TDBText;
    TimerAjusteColumnas: TTimer;
    procedure acEliminarEventoExecute(Sender: TObject);
    procedure acModificarEventoExecute(Sender: TObject);
    procedure acNuevoEventoExecute(Sender: TObject);
    procedure acOrdenarExecute(Sender: TObject);
    procedure AnalizarTareas(DataSet: TDataSet);
    procedure edEstadoTareaClick(Sender: TObject);
    procedure edRespuestaChange(Sender: TObject);
    procedure edRESPUESTA_TAREAChange(Sender: TObject);
    procedure mnuExportarClick(Sender: TObject);
    procedure GridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mnuAjustarGrillaClick(Sender: TObject);
    procedure mnuMostrarOcultarColumnasClick(Sender: TObject);
    procedure pmuMenuEmergentePopup(Sender: TObject);
    procedure sdqEventosAfterClose(DataSet: TDataSet);
    procedure sdqEventosAfterOpen(DataSet: TDataSet);
    procedure sdqEventosAfterScroll(DataSet: TDataSet);
    procedure AnalizarObservacionesEVENTO(DataSet: TDataSet);
    procedure mnuExportarDetalleClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbObsAnteriorEVENTOClick(Sender: TObject);
    procedure tbObSiguienteEVENTOClick(Sender: TObject);
    procedure tbSiguienteClick(Sender: TObject);
    procedure TimerAjusteColumnasTimer(Sender: TObject);
  public
    constructor Create(AComponent: TComponent); override;
  end;

var
  fraVistaEventos: TfraVistaEventos;

implementation

uses
  VCLExtra, CustomDlgs, unDmPrincipal, General, unAgenda, Strfuncs, unSesion, unGrids, unArt,
  unABMAgendaBaseEvento, unInterfaces, DateTimeFuncs, DateUtils, unSIC;

{$R *.dfm}

var
  iVeces: Integer;

procedure TfraVistaEventos.acEliminarEventoExecute(Sender: TObject);
begin
  Verificar(sdqEventos.IsEmpty, nil, 'Debe seleccionar un evento para ser dado de baja.');
  Verificar(sdqEventos.FieldByName('TIPO').AsString = 'TAREA', nil, 'El registro seleccionado corresponde a una tarea en curso.');
  EliminarEvento(sdqEventos.FieldByName('AE_ID').AsInteger);
  acActualizar.Execute;
end;

constructor TfraVistaEventos.Create(AComponent: TComponent);
begin
  inherited;
  pnlInstrucciones.Align := alClient;
  tsRespuesta.TabVisible := False;
  tsTareas.TabVisible := False;
  tsObservacionesEVENTO.TabVisible := False;
  pgBarraLateral.ActivePageIndex := 0;
  AdvPageControlTareas.ActivePageIndex := 0;
  pnlEventoAjeno.Color := COLOR_EVENTO_AJENO;
  pnlEventoCerrado.Color := COLOR_EVENTO_TERMINADO;
  sdqEventosAfterScroll(sdqEventos);
  pnlDetalleInstrucciones.Left := 16;
  pnlDetalleInstrucciones.Width := pnlInstrucciones.Width - iif(csLoading in ComponentState, 48, 32);
end;

procedure TfraVistaEventos.acModificarEventoExecute(Sender: TObject);
begin
  Verificar(sdqEventos.IsEmpty, nil, 'Debe seleccionar un evento para modificarlo.');
  Verificar(sdqEventos.FieldByName('TIPO').AsString = 'TAREA', nil, 'El registro seleccionado corresponde a una tarea en curso.');

  Abrir(TfrmABMAgendaBaseEvento, frmABMAgendaBaseEvento, tmvNormal, nil);
  with frmABMAgendaBaseEvento do
  try
    ModoCallCenter := True;
    ModoABM := abmModificacion;
    LoadFromQuery(sdqEventos, True, False);
    Visible := False;
    if ShowModal = mrOK then
      acActualizar.Execute;
  finally
    Application.ProcessMessages;
  end;

  if Assigned(frmABMAgendaBaseEvento) then
  try
    //FreeAndNil(frmABMAgendaBaseEvento);
  except
    frmABMAgendaBaseEvento := nil;
  end;
end;

procedure TfraVistaEventos.acNuevoEventoExecute(Sender: TObject);
var
  dAhora: TDateTime;
begin
  Cursor := crHourGlass;
  Abrir(TfrmABMAgendaBaseEvento, frmABMAgendaBaseEvento, tmvNormal, nil);
  with frmABMAgendaBaseEvento do
  try
    ModoCallCenter := True;
    ModoABM := abmAlta;
    AltaEvento;

    dAhora := DBDateTime;
    edFechaEvento.Date := Trunc(dAhora);
    edFechaFin.Date := Trunc(dAhora);
    teHoraDesde.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn', dAhora));
    teHoraHasta.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn', dAhora)) + OneMinute;

    Visible := False;
    Cursor := crArrow;    
    ShowModal;
  finally
    Application.ProcessMessages;
    try
      //FreeAndNil(frmABMAgendaBaseEvento);
    except
      frmABMAgendaBaseEvento := nil;
    end;
  end;
end;

procedure TfraVistaEventos.acOrdenarExecute(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, GridEventos.Columns);
  SortDialog.Execute;
end;

procedure TfraVistaEventos.AnalizarTareas(DataSet: TDataSet);
  procedure LimpioEstadoTarea;
  begin
    with edEstadoTarea do
    begin
      Cursor := crDefault;
      Font.Color := $00723708;
      Hint := '';
    end
  end;
begin
  inherited;
  if Assigned(sdqTareasAsociadas.FindField('at_fechavencimiento')) then
    TDateTimeField(sdqTareasAsociadas.FindField('at_fechavencimiento')).DisplayFormat := 'dd/mm/yyyy hh:nn"hs"';

  tbAnterior.Enabled := (not DataSet.IsEmpty) and (DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
  tbSiguiente.Enabled := (not DataSet.IsEmpty) and ((DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF}) < DataSet.RecordCount);

  if not DataSet.IsEmpty then
  begin
    lbTarea.Caption := 'Tarea ' + IntToStr(DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF}) + '/' + IntToStr(DataSet.RecordCount);
    tsTareas.TabVisible := True;

    if (not sdqTareasAsociadas.FieldByName('AT_IDEVENTOTAREA').IsNull) and (sdqTareasAsociadas.FieldByName('AT_ESTADO').AsInteger = ESTADO_TAREA_AGENDADA) then
    with edEstadoTarea do
    begin
      Cursor := crHandPoint;
      Font.Color := clBlue;
      Hint := 'Ver evento';
    end else
    LimpioEstadoTarea;
    tsRESPUESTA_TAREA.TabVisible := not sdqTareasAsociadas.FieldByName('RESPUESTA').IsNull;
  end else
  begin
    lbTarea.Caption := '';
    tsTareas.TabVisible := False;
    pgBarraLateral.ActivePageIndex := 0;
    tsRESPUESTA_TAREA.TabVisible := False;
    LimpioEstadoTarea;
  end;
end;

procedure TfraVistaEventos.edEstadoTareaClick(Sender: TObject);
begin
  if (not sdqTareasAsociadas.FieldByName('AT_IDEVENTOTAREA').IsNull) and (sdqTareasAsociadas.FieldByName('AT_ESTADO').AsInteger = ESTADO_TAREA_AGENDADA) then
  begin
    Abrir(TfrmABMAgendaBaseEvento, frmABMAgendaBaseEvento, tmvNormal, nil);
    with frmABMAgendaBaseEvento do
    try
      ModoCallCenter := True;
      ModoABM := abmModificacion;
      OpenQueryEx(sdqEventoResuelto, [Sesion.ID, Self.sdqTareasAsociadas.FieldByName('AT_IDEVENTOTAREA').AsInteger]);
      LoadFromQuery(sdqEventoResuelto, True, False);
      Visible := False;
      ShowModal;
    finally
      FreeAndNil(frmABMAgendaBaseEvento);
    end;
  end;
end;

procedure TfraVistaEventos.edRespuestaChange(Sender: TObject);
begin
  tsRespuesta.TabVisible := not IsEmptyString((Sender as TCustomEdit).Text);
end;

procedure TfraVistaEventos.edRESPUESTA_TAREAChange(Sender: TObject);
begin
  tsRESPUESTA_TAREA.TabVisible := not IsEmptyString((Sender as TCustomEdit).Text);
end;

procedure TfraVistaEventos.mnuExportarClick(Sender: TObject);
var
  AutoCols: Boolean;
begin
  if sdqEventos.Active and (not sdqEventos.IsEmpty) then
  begin
    mnuExportar.Enabled := False;
    sdqEventos.DisableControls;
    try
      AutoCols := ExportDialog.Fields.Count = 0;
      try
        if AutoCols then
          ExportDialog.Fields.Assign(GridEventos.Columns);

        try
          ExportDialog.Execute;
        except
          on e:Exception do
            InvalidHint(GridEventos, e.Message, 'Error en la exportación');
        end;
      finally
        if AutoCols then
          ExportDialog.Fields.Clear;
      end;
    finally
      mnuExportar.Enabled := True;
      sdqEventos.EnableControls;
    end;
  end;
end;

procedure TfraVistaEventos.GridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if AreIn(Field.FieldName, ['SE_NOMBRE']) and (sdqEventos.FieldByName('AE_IDUSUARIO').AsInteger <> Sesion.Id) then
  begin
    AFont.Color := clBlack;
    Background := COLOR_EVENTO_AJENO;
  end;

  if AreIn(Field.FieldName, ['MI_DESCRIPCION', 'TE_DESCRIPCION']) then
  begin
    if (sdqEventos.FieldByName('TAREAS_PENDIENTES').AsString = 'S') then
      Background := COLOR_EVENTO_TAREASPENDIENTES
    else if (sdqEventos.FieldByName('AE_ESTADO').AsInteger = ESTADO_EVENTO_TERMINADO) then
      Background := COLOR_EVENTO_TERMINADO
    else if (sdqEventos.FieldByName('AE_ESTADO').AsInteger = ESTADO_EVENTO_PENDIENTEAUTORIZACION) then
      Background := COLOR_EVENTO_AUTORIZAR;

    if (not Highlight) or (Background = COLOR_EVENTO_TAREASPENDIENTES) or (Background = COLOR_EVENTO_TERMINADO)
    or (Background = COLOR_EVENTO_AUTORIZAR)  then
      AFont.Color := clBlack;
  end;

  if AreIn(Field.FieldName, ['AE_ID']) and (sdqEventos.FieldByName('INSATISFACCION').AsString = 'S') then
    AFont.Color := $0016659A;

  if AreIn(Field.FieldName, ['SE_NOMBRE']) and (sdqEventos.FieldByName('AE_FECHALEIDO').IsNull) and
                                               (sdqEventos.FieldByName('AE_ESTADO').AsInteger <> ESTADO_EVENTO_TERMINADO) then
    AFont.Style := AFont.Style + [fsBold];

  if AreIn(Field.FieldName, ['TE_DESCRIPCION']) and (not sdqEventos.FieldByName('AE_FECHABAJA').IsNull) then
    AFont.Style := AFont.Style + [fsStrikeOut];

  if AreIn(Field.FieldName, ['TE_DESCRIPCION']) and (not sdqEventos.FieldByName('TE_FECHABAJA').IsNull) then
    AFont.Color := clRed;

  if not sdqEventos.FieldByName('AE_FECHABAJA').IsNull then
  begin
    AFont.Style := AFont.Style + [fsStrikeOut];
    AFont.Color := clRed;
  end;

  if sdqEventos.FieldByName('TIPO').AsString = 'TAREA' then
  begin
    AFont.Style := AFont.Style + [fsItalic];
    AFont.Color := clMaroon;
  end;
end;

procedure TfraVistaEventos.mnuAjustarGrillaClick(Sender: TObject);
begin
  VCLExtra.DynColWidthsByData(GridEventos);
  GridEventos.Width := GetColumnWidths(GridEventos, True) - 7;
  pnlDescripcionEvento.Height := tsEvento.Height div 2;
  pnlDescripcionTarea.Height := (tsTareas.Height - Panel3.Height) div 2;
end;

procedure TfraVistaEventos.mnuMostrarOcultarColumnasClick(Sender: TObject);
begin
  FieldHider.Execute;
end;

procedure TfraVistaEventos.pmuMenuEmergentePopup(Sender: TObject);
begin
  mnuEliminarEvento.Visible := AreIn(Sesion.Sector, ['COMPUTOS', 'CALIDAD']);
end;

procedure TfraVistaEventos.sdqEventosAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdqTareasAsociadas.Close;
  sdqObservacionesEVENTO.Close;
  AnalizarTareas(DataSet);
  sdqEventosAfterScroll(DataSet);
end;

procedure TfraVistaEventos.sdqEventosAfterOpen(DataSet: TDataSet);
begin
  Inc(iVeces);
  TDateTimeField(DataSet.FieldByName('fechahora')).DisplayFormat := 'dd/mm/yyyy hh:nn';

  if Assigned(DataSet.FindField('at_fechaalta')) then
    TDateTimeField(DataSet.FindField('at_fechaalta')).DisplayFormat := 'dd/mm/yyyy hh:nn"hs"';

//  if iVeces = 1 then
  TimerAjusteColumnas.Enabled := True;
end;

procedure TfraVistaEventos.sdqEventosAfterScroll(DataSet: TDataSet);
var
  iAux: Integer;
begin
  if not(mnuExportar.Enabled and mnuExportarDetalle.Enabled) then
    Exit;

  if sdqEventos.Active and (not sdqEventos.IsEmpty) then
  begin
    iAux := pgBarraLateralEvento.ActivePageIndex;
    try
      if (sdqEventos.FieldByName('TIPO').AsString = 'TAREA') then
      begin
        tsEvento.Caption := 'Tarea';
        pnlTituloDescEvento.Caption := 'Descripción de la tarea';
      end else
      begin
        tsEvento.Caption := 'Evento';
        pnlTituloDescEvento.Caption := 'Descripción del evento';
      end;
      Application.ProcessMessages;
      tsRespuesta.TabVisible := not sdqEventos.FieldByName('RESPUESTA').IsNull;
      pnlTareaGestionada.Visible := not sdqEventos.FieldByName('AT_FECHAALTA').IsNull;
      pnlDatosTareaGestionada.Visible := DataSet.FieldByName('SE_NOMBRE').AsString <> DataSet.FieldByName('USUALTATAREA').AsString;

      if pnlDatosTareaGestionada.Visible then
      begin
        if sdqEventos.FieldByName('TIPO').AsString = 'TAREA' then
          lbTareaGestionada.Caption := 'Tarea a gestionar'
        else if sdqEventos.FieldByName('AE_ESTADO').AsInteger = ESTADO_EVENTO_TERMINADO then
          lbTareaGestionada.Caption := 'Tarea gestionada'
        else
          lbTareaGestionada.Caption := 'Tarea agendada (gestión pendiente)';

        pnlTareaGestionada.Height := 34;
      end else
      begin
        lbTareaGestionada.Caption := 'Autogestión';
        pnlTareaGestionada.Height := 20;
      end;

      OpenQueryEx(sdqTareasAsociadas, [Sesion.ID, sdqEventos.FieldByName('AE_ID').AsInteger]);
      OpenQueryEx(sdqObservacionesEVENTO, [sdqEventos.FieldByName('AE_ID').AsInteger, 'N', sdqEventos.FieldByName('AE_ID').AsInteger, 'N', sdqEventos.FieldByName('ID').AsInteger]);
      tsObservacionesEVENTO.TabVisible := not sdqObservacionesEVENTO.IsEmpty;
    finally
      if pgBarraLateralEvento.Pages[iAux].TabVisible then
        pgBarraLateralEvento.ActivePageIndex := iAux;
    end
  end else
  begin
    sdqTareasAsociadas.Close;
  end;

  pgBarraLateral.Visible := sdqEventos.Active and (not sdqEventos.IsEmpty);
  pnlInstrucciones.Visible := not pgBarraLateral.Visible;
end;

procedure TfraVistaEventos.AnalizarObservacionesEVENTO(DataSet: TDataSet);
begin
  inherited;
  tbObsAnteriorEVENTO.Enabled := (not DataSet.IsEmpty) and (DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
  tbObSiguienteEVENTO.Enabled := (not DataSet.IsEmpty) and ((DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF}) < DataSet.RecordCount);

  if Assigned(DataSet.FindField('oe_fechaalta')) then
    TDateTimeField(DataSet.FindField('oe_fechaalta')).DisplayFormat := 'dd/mm/yyyy hh:nn"hs"';

  if DataSet.IsEmpty then
    lbObservacion.Caption := ''
  else
    lbObservacion.Caption := 'Observación ' + IntToStr(DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF}) + '/' + IntToStr(DataSet.RecordCount);
end;

procedure TfraVistaEventos.mnuExportarDetalleClick(Sender: TObject);
begin
  if sdqEventos.Active and (not sdqEventos.IsEmpty) then
  begin
    mnuExportarDetalle.Enabled := False;
    sdqEventos.DisableControls;
    try
      try
        ExportDialogDetalle.Execute;
      except
        on e:Exception do
          InvalidHint(GridEventos, e.Message, 'Error en la exportación'); 
      end;
    finally
      mnuExportarDetalle.Enabled := True;
      sdqEventos.EnableControls;
    end;
  end;
end;

procedure TfraVistaEventos.tbAnteriorClick(Sender: TObject);
begin
  sdqTareasAsociadas.Prior;
end;

procedure TfraVistaEventos.tbObsAnteriorEVENTOClick(Sender: TObject);
begin
  sdqObservacionesEVENTO.Prior;
end;

procedure TfraVistaEventos.tbObSiguienteEVENTOClick(Sender: TObject);
begin
  sdqObservacionesEVENTO.Next;
end;

procedure TfraVistaEventos.tbSiguienteClick(Sender: TObject);
begin
  sdqTareasAsociadas.Next;
end;

procedure TfraVistaEventos.TimerAjusteColumnasTimer(Sender: TObject);
begin
  inherited;
  TimerAjusteColumnas.Enabled:= False;
  mnuAjustarGrillaClick(nil);
end;

end.
