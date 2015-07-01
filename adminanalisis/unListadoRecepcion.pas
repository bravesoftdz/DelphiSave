unit unListadoRecepcion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  unCustomGridABM, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unGrids;

type
  TfrmListadoRecepcion = class(TfrmCustomConsulta)
    Label1: TLabel;
    Label2: TLabel;
    edFechaRecibido: TDateComboBox;
    edFechaHasta: TDateComboBox;
    tbSeleccionarTodo: TToolButton;
    tbDesSeleccionarTodo: TToolButton;
    tbListadoRecepcion: TToolButton;
    fpListadoRecepcion: TFormPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    btnAceptarCambioTerminado: TButton;
    btnCancel: TButton;
    edFechaRecepcionUcap: TDateEdit;
    Label4: TLabel;
    fraProceso: TfraCodigoDescripcion;
    tbEdicionAbogado: TToolBar;
    tbNuevoAbogado: TToolButton;
    tbsalir2: TToolButton;
    tbImprimirRecepcion: TToolButton;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure tbListadoRecepcionClick(Sender: TObject);
    procedure btnAceptarCambioTerminadoClick(Sender: TObject);
    procedure tbNuevoAbogadoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirRecepcionClick(Sender: TObject);
  private
    FReimprimir : Boolean;
    SelectedList: TBookMarkLst;
  public
    { Public declarations }
  end;

var
  frmListadoRecepcion: TfrmListadoRecepcion;

implementation

uses
  unDmPrincipal, unProcesosRecepcion, vclExtra, AnsiSql,unSesion, CustomDlgs, unrptListadoRecepcion;

{$R *.dfm}

procedure TfrmListadoRecepcion.tbRefrescarClick(Sender: TObject);
var
  sSQL : String;
begin
  sSQL :=
    ' SELECT em_nombre, el_idlote, el_operativo || '+
    '        '' '' || TO_CHAR(le_fechanotificacion,''YY'') operativo, '+
    '        os_fecha, os_id, es_nroestableci, ca_identificador, '+
    '        ca_descripcion, os_fecharecepcionucap, '+
    '        DECODE (os_idtipoobservacion, 6, ''R'', '''') res '+
    '   FROM hys.hel_estadolote, '+
    '        afi.aem_empresa, '+
    '        afi.aco_contrato, '+
    '        afi.aes_establecimiento, '+
    '        hys.hle_loteestudio, '+
    '        art.cpr_prestador, '+
    '        hys.hos_observacionessublote '+
    '  WHERE el_idlote = os_idlote '+
    '    AND em_id = co_idempresa '+
    '    AND es_contrato = co_contrato '+
    '    AND es_id = os_idestableci '+
    '    AND le_id = el_idlote '+
    '    AND ca_identificador = le_idprestador '+
    '    AND os_idtipoobservacion + 0 IN (8, 6) '+
    '    AND NVL (el_operativo, '' '') <> ''R'' ';

  if (edFechaRecibido.Date = edFechaHasta.Date) and (edFechaRecibido.date <> 0) then
    sSQL := sSQL + ' AND OS_FECHA = '+SqlValue(edFechaRecibido.Date)
  else
  begin
    if edFechaRecibido.Date <> 0 then
      sSQL := sSQL + ' AND OS_FECHA >= '+SqlValue(edFechaRecibido.Date);
    if edFechaHasta.Date <> 0 then
      sSQL := sSQL + ' AND OS_FECHA <= '+SqlValue(edFechaHasta.Date);
  end;

  if fraProceso.IsSelected then
  begin
    sSQL := sSQL + ' AND os_idproceso = '+SqlValue(fraProceso.Codigo);
    FReimprimir := True;
  end
  else
  begin
    sSQL := sSQL + ' AND os_idproceso IS NULL';
    FReimprimir := False;
  end;

  sdqConsulta.SQL.Text := sSQL;
  inherited;
  tbSeleccionarTodoClick(nil);
  if fraProceso.IsSelected then
  begin
    //Grid.ColumnByField['SELECTED'].Visible := False;
    tbListadoRecepcion.Enabled := True;
  end
  else
  begin
    //Grid.ColumnByField['SELECTED'].Visible := True;
    tbListadoRecepcion.Enabled := False;
  end;

end;

procedure TfrmListadoRecepcion.FormCreate(Sender: TObject);
begin
  inherited;
  with fraProceso do
  begin
    TableName   := 'hys.hlr_listadorecepcion';
    FieldID     := 'lr_id';
    FieldCodigo := 'lr_id';
    FieldDesc   := 'lr_fecha';
    FieldBaja   := 'lr_fechabaja';
    Showbajas   := True;
  end;
  SelectedList := TBookMarkLst.Create;
//  tbDesSeleccionarTodo.Left  := tbSalir.Left - 5;
//  tbSeleccionarTodo.Left     := tbSalir.Left - 5;
//  tbListadoRecepcion.Left    := tbSalir.Left - 5;
  tbListadoRecepcion.Enabled := False;
  edFechaRecibido.Date := ValorSqlDateTime(' select art.actualdate from dual');
  vclExtra.LockControls([fraProceso.cmbDescripcion],True);
end;

procedure TfrmListadoRecepcion.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmListadoRecepcion.tbSeleccionarTodoClick(Sender: TObject);
var
  i: integer;
begin
  if sdqConsulta.Active then
  begin
    sdqConsulta.DisableControls;
    //sdqConsulta.AfterScroll := nil;
    try
      sdqConsulta.First;
      while not sdqConsulta.Eof do
      begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('os_id').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('os_id').AsString, sdqConsulta.GetBookmark);
        sdqConsulta.Next;
      end;
    finally
      sdqConsulta.EnableControls;
      DBGrid.Refresh;
    end;
  end;
end;

procedure TfrmListadoRecepcion.tbDesSeleccionarTodoClick(Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(SelectedList.Objects[i]);
{$ENDIF}
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmListadoRecepcion.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('os_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmListadoRecepcion.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmListadoRecepcion.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('os_id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('os_id').AsString, sdqConsulta.GetBookmark)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('os_id').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmListadoRecepcion.tbListadoRecepcionClick(Sender: TObject);
begin
  Verificar(SelectedList.Count = 0, nil, 'Debe haber item seleccionados');
  edFechaRecepcionUcap.Clear;
 // vclExtra.LockControls([edFechaRecepcionUcap],FReimprimir);
  fpListadoRecepcion.ShowModal;
end;

procedure TfrmListadoRecepcion.btnAceptarCambioTerminadoClick(
  Sender: TObject);
var
  observaciones : string;
  masDeUnCaso : Boolean;
  i : Integer;
begin
  Verificar(edFechaRecepcionUcap.Date = 0, edFechaRecepcionUcap,'Debe Ingresar la Fecha.');

  masDeUnCaso := False;
  try
    if SelectedList.Count >= 0 then
    begin
      for i:=0 to SelectedList.Count-1 do
      begin
        DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        if masDeUnCaso then
        begin
          observaciones := observaciones+ ','+SelectedList.Strings[i];
        end
        else
        begin
          masDeUnCaso := True;
          observaciones := observaciones+ SelectedList.Strings[i];
        end;
      end;
      EjecutarSql(
        ' UPDATE hys.hos_observacionessublote '+
        '    SET os_fecharecepcionucap = '+SqlValue(edFechaRecepcionUcap.Date)+','+
        '        os_fechamodif = sysdate,'+
        '        os_usumodif = '+ SqlValue(Sesion.UserID)+
        '  WHERE os_id in ('+observaciones+')');
      SelectedList.Clear;
      fpListadoRecepcion.ModalResult := mrOk;
      tbRefrescarClick(nil);
    end
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al mostrar Listados.');
    end;
  end;
end;

procedure TfrmListadoRecepcion.tbNuevoAbogadoClick(Sender: TObject);
begin
  with TfrmProcesosRecepcion.Create(Self) do
  begin
    FormStyle := fsNormal;
    CargarFechas(edFechaRecibido.Date, edFechaHasta.Date);
    Visible := False;
    ShowModal;
    fraProceso.Codigo := ObtenerMediador;
  end;
end;

procedure TfrmListadoRecepcion.tbLimpiarClick(Sender: TObject);
begin
  edFechaRecibido.Clear;
  edFechaHasta.Clear;
  fraProceso.Clear;
end;

procedure TfrmListadoRecepcion.tbImprimirRecepcionClick(Sender: TObject);
var
  observaciones : string;
  masDeUnCaso : Boolean;
  i, idProceso : Integer;
begin
  if FReimprimir then
    tbSeleccionarTodoClick(nil);
  masDeUnCaso := False;
  try
    if SelectedList.Count > 0 then
    begin
      BeginTrans();
      for i:=0 to SelectedList.Count-1 do
      begin
        DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        if masDeUnCaso then
        begin
          observaciones := observaciones+ ','+SelectedList.Strings[i];
        end
        else
        begin
          masDeUnCaso := True;
          observaciones := observaciones+ SelectedList.Strings[i];
        end;
      end;
      if not FReimprimir then
      begin
        idProceso := GetSecNextVal('hys.SEQ_HLR_ID');
        EjecutarSqlST(
          'INSERT INTO hys.hlr_listadorecepcion( lr_id, lr_fecha, lr_usualta, lr_fechaalta)'+
          '     VALUES ('+SqlValue(idProceso)+', art.actualdate,'+SqlValue(Sesion.UserID)+',sysdate)');
        EjecutarSqlST(
            ' UPDATE hys.hos_observacionessublote '+
            '    SET os_idproceso = '+ SqlValue(idProceso)+','+
            '        os_fechamodif = sysdate,'+
            '        os_usumodif = '+ SqlValue(Sesion.UserID)+
            '  WHERE os_id in ('+observaciones+')');
      end;
      with TrptListadoRecepcion.Create(Self) do
      try
        Load(observaciones);
        Mostrar;
      finally
        Free;
      end;
      SelectedList.Clear;
      fpListadoRecepcion.ModalResult := mrOk;
      tbRefrescarClick(nil);
      CommitTrans();
    end
    else
      InvalidMsg(tbImprimirRecepcion, 'Debe Seleccionar algun registro.');
  except
    on E: Exception do
    begin
      Rollback();
      ErrorMsg(E, 'Error al mostrar Listados.');
    end;
  end;
end;

end.
