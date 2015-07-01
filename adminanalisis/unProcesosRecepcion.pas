unit unProcesosRecepcion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unCustomGridABM, Mask,
  ToolEdit, DateComboBox, unGrids;

type
  TfrmProcesosRecepcion = class(TfrmCustomGridABM)
    lbProceso: TLabel;
    edFechaProcesoDesde: TDateEdit;
    lbHasta: TLabel;
    Panel1: TPanel;
    btnAceptarSel: TButton;
    Button2: TButton;
    pnlBottom: TPanel;
    edFechaProcesoHasta: TDateEdit;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    sdqConsultaLR_ID: TFloatField;
    sdqConsultaLR_FECHA: TDateTimeField;
    sdqConsultaLR_USUALTA: TStringField;
    sdqConsultaLR_FECHAALTA: TDateTimeField;
    sdqConsultaLR_USUMODIF: TStringField;
    sdqConsultaLR_FECHAMODIF: TDateTimeField;
    sdqConsultaLR_USUBAJA: TStringField;
    sdqConsultaLR_FECHABAJA: TDateTimeField;
    sdqConsultaSELECTED: TStringField;
    Panel2: TPanel;
    GridListado: TArtDBGrid;
    dsListadoRecepcion: TDataSource;
    sdqListadoRecepcion: TSDQuery;
    tbSeparator: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnAceptarSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridCellClick(Column: TColumn);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FCodigo : String;
    SelectedList: TBookMarkLst;
    { Private declarations }
  protected
    { Protected declarations }
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    function ObtenerMediador: String;
    procedure CargarFechas(FechaDesde, fechaHasta: tdate);
    { Public declarations }
  end;

var
  frmProcesosRecepcion: TfrmProcesosRecepcion;

implementation

uses
  unDmPrincipal, AnsiSql,unSesion, CustomDlgs, unrptListadoRecepcion;


{$R *.dfm}

procedure TfrmProcesosRecepcion.tbRefrescarClick(Sender: TObject);
var
  sSql : String;
begin
  sSql :=
   ' SELECT * '+
   '   FROM hys.hlr_listadorecepcion '+
   '  WHERE 1 = 1 ';
  if edFechaProcesoDesde.Date <> 0 then
    sSql := sSql + ' AND lr_fecha >= '+SqlValue(edFechaProcesoDesde.Date);
  if edFechaProcesoHasta.Date <> 0 then
    sSql := sSql + ' AND lr_fecha <= '+SqlValue(edFechaProcesoHasta.Date);
  sdqConsulta.SQL.Text := sSql;
  inherited;
end;

procedure TfrmProcesosRecepcion.btnAceptarSelClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, btnAceptarSel, 'Debe seleccionar un Mediador.');
  FCodigo := sdqConsulta.FieldByName('lr_id').AsString;
  ModalResult := mrOK;
end;

procedure TfrmProcesosRecepcion.CargarFechas(fechaDesde : tdate; fechaHasta : tdate);
begin
  edFechaProcesoDesde.Date := fechaDesde;
  edFechaProcesoHasta.Date := fechaHasta;
end;

function TfrmProcesosRecepcion.ObtenerMediador: String;
begin
  Result := Fcodigo;
end;

procedure TfrmProcesosRecepcion.FormCreate(Sender: TObject);
begin
  SelectedList := TBookMarkLst.Create;
  tbDesSeleccionarTodo.Left    := tbSalir.Left - 5;
  tbSeleccionarTodo.Left    := tbSalir.Left - 5;
  tbSeparator.Left    := tbSalir.Left - 5;
  inherited;
  tbModificar.ImageIndex := 39;

end;

procedure TfrmProcesosRecepcion.tbSeleccionarTodoClick(Sender: TObject);
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
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('lr_id').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('lr_id').AsString, sdqConsulta.GetBookmark);
        sdqConsulta.Next;
      end;
    finally
      sdqConsulta.EnableControls;
      DBGrid.Refresh;
    end;
  end;
end;

procedure TfrmProcesosRecepcion.tbDesSeleccionarTodoClick(Sender: TObject);
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

procedure TfrmProcesosRecepcion.GridDrawColumnCell(Sender: TObject;
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
    if SelectedList.IndexOf(sdqConsulta.FieldByName('lr_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmProcesosRecepcion.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmProcesosRecepcion.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('lr_id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('lr_id').AsString, sdqConsulta.GetBookmark)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('lr_id').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmProcesosRecepcion.ClearControls;
begin
  inherited;

end;

function TfrmProcesosRecepcion.DoABM: Boolean;
begin
  Result := True;
end;

procedure TfrmProcesosRecepcion.LoadControls;
begin
  inherited;
  IF Assigned(sdqListadoRecepcion) THEN
    sdqListadoRecepcion.Close;
  sdqListadoRecepcion.ParamByName('idproceso').AsInteger := sdqConsulta.FieldByName('lr_id').AsInteger;
  sdqListadoRecepcion.Open;
end;

procedure TfrmProcesosRecepcion.tbImprimirClick(Sender: TObject);
var
  observaciones : string;
  masDeUnCaso : Boolean;
  i : Integer;
begin
  //inherited;
  try
    if SelectedList.Count >= 0 then
    begin
      for i:=0 to SelectedList.Count-1 do
      begin
        DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        observaciones := '';
        with GetQuery(
          ' SELECT os_id '+
          '   FROM hys.hos_observacionessublote '+
          '  WHERE os_idproceso = '+SqlValue(SelectedList.Strings[i])+
          '    AND os_fechabaja IS NULL ') do
        try
          masDeUnCaso := False;
          while not Eof do
          begin
            if masDeUnCaso then
            begin
              observaciones := observaciones+ ','+FieldByName('os_id').AsString;
            end
            else
            begin
              masDeUnCaso := True;
              observaciones := FieldByName('os_id').AsString;
            end;
            Next;
          end;
        finally
          Free;
        end;
        if observaciones <> '' then
          with TrptListadoRecepcion.Create(Self) do
          try
            Load(observaciones);
            Imprimir;
          finally
            Free;
          end
        else
          MsgBox('El proceso no tiene observaciones asociadas.', MB_ICONEXCLAMATION);
      end;
      SelectedList.Clear;
    end;
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al mostrar Listados.');
    end;
  end;
end;

function TfrmProcesosRecepcion.Validar: Boolean;
begin
  Result := True;
end;

procedure TfrmProcesosRecepcion.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFechaProcesoDesde.Clear;
  edFechaProcesoHasta.Clear;
end;

end.
