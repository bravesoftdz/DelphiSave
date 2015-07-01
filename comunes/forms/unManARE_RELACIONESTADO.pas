unit unManARE_RELACIONESTADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, DB, SDEngine,
  Placemnt, artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Buttons, Grids, BaseGrid, AdvGrid;

type
  TfrmManARE_RELACIONESTADO = class(TfrmCustomPanelABM)
    GridRelacion: TAdvStringGrid;
    tbRefresh: TToolButton;
    tbGuardar: TToolButton;
    GroupBox1: TGroupBox;
    GridESSOL: TAdvStringGrid;
    GridACOES: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Splitter2: TSplitter;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FSFormCreate(Sender: TObject);
    procedure tbRefreshClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GridESSOLScrollCell(Sender: TObject; ACol, ARow, ScrollPosition, ScrollMin, ScrollMax: Integer);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure GridACOESSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);

  private
    function CambiosNoAplicados: Boolean;
    function ExisteEstado(const aEstado: String): Boolean;
    function ExisteLineaRelacion(const aCodigoESSOL, aCodigoACOES: String): Boolean;
    function ExisteRelacion(const aCodigoESSOL, aCodigoACOES: String): Boolean;

    procedure AgregarPermitido(const aCodigoESSOL, aDescripcionESSOL, aCodigoACOES, aDescripcionACOES: String;
                               var aTargetGrid: TAdvStringGrid);
    procedure AgregarRelacion(const aCodigoESSOL, aCodigoACOES: String);
    procedure CargarGrillaESSOL(const aCodigoACOES: String; var aGrilla: TAdvStringGrid);
    procedure CheckGrillaSinRegistros(var aGrilla: TAdvStringGrid);
    procedure DarBajas;
    procedure DarBajaSql(const aCodigoESSOL, aCodigoACOES: String);
    procedure GridPasarSeleccionados(var aSourceGridESSOL, aSourceGridACOES, aTargetGrid: TAdvStringGrid);
    procedure LoadGrillaEstados(const aClave: String; var aGrilla: TAdvStringGrid);
    procedure LoadGrillaRelaciones;
    procedure SeleccionarValor(const aCodigo: String; var aGrilla: TAdvStringGrid);
    procedure SeleccionarValoresRelacionados(aCodigoESSOL: String);
    procedure SetGridDescripcion;
  public
  end;

var
  frmManARE_RELACIONESTADO: TfrmManARE_RELACIONESTADO;

implementation

uses
  AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal;

{$R *.dfm}

procedure TfrmManARE_RELACIONESTADO.FSFormCreate(Sender: TObject);
begin
  tbGuardar.Left := 0;
  tbImprimir.Left := 0;
  toolButton4.Left := 0;
  tbRefresh.Left := 0;

  LoadGrillaRelaciones;
  LoadGrillaEstados('ACOES', GridACOES);
  LoadGrillaEstados('ESSOL', GridESSOL);
  LockControls(False);
  SetGridDescripcion;
end;

procedure TfrmManARE_RELACIONESTADO.LoadGrillaEstados(const aClave: String; var aGrilla: TAdvStringGrid);
var
  sSql: String;
begin
  sSql :=
    'SELECT tb_codigo, tb_descripcion' +
     ' FROM art.ctb_tablas' +
    ' WHERE tb_clave = :clave' +
      ' AND tb_fechabaja IS NULL' +
      ' AND tb_codigo <> ''0''';

  with GetQueryEx(sSql, [aClave]) do
  try
    aGrilla.RowCount := 2;
    while not Eof do
    begin
      aGrilla.Cells[0, aGrilla.RowCount - 1] := FieldByName('tb_codigo').AsString;
      aGrilla.Cells[1, aGrilla.RowCount - 1] := FieldByName('tb_descripcion').AsString;

      aGrilla.RowCount := aGrilla.RowCount + 1;

      Next;
    end;
    aGrilla.RowCount := aGrilla.RowCount - 1;
  finally
    Free;
  end;
end;

procedure TfrmManARE_RELACIONESTADO.tbRefreshClick(Sender: TObject);
begin
  if CambiosNoAplicados then
    if MsgBox('Existen cambios no aplicados, si continua se perderán. ¿ Desea Continuar ?', MB_YESNO) = mrNo then
      Abort;

  LoadGrillaRelaciones;
  LoadGrillaEstados('ESSOL', GridESSOL);
  LoadGrillaEstados('ACOES', GridACOES);
end;

procedure TfrmManARE_RELACIONESTADO.GridPasarSeleccionados(var aSourceGridESSOL, aSourceGridACOES, aTargetGrid: TAdvStringGrid);
var
  i, y: Integer;
begin
  if (aTargetGrid.RowCount = 2) and (aTargetGrid.Cells[0, 1] = '') and (aTargetGrid.Cells[1, 1] = '') then
  begin
    aTargetGrid.RemoveRows(1, 1);
    aTargetGrid.Clear;
  end;

  for i := 1 to aSourceGridESSOL.RowCount - 1 do
    if aSourceGridESSOL.RowSelect[i] then
      for y := 1 to aSourceGridACOES.RowCount - 1 do
        if aSourceGridACOES.RowSelect[y] then
          if not ExisteEstado(aSourceGridESSOL.Cells[0, i]) then
            if not ExisteLineaRelacion(aSourceGridESSOL.Cells[0, i], aSourceGridACOES.Cells[0, y]) then
              AgregarPermitido(aSourceGridESSOL.Cells[0, i], aSourceGridESSOL.Cells[1, i], aSourceGridACOES.Cells[0, y], aSourceGridACOES.Cells[1, y], aTargetGrid);

  SetGridDescripcion;
end;

procedure TfrmManARE_RELACIONESTADO.SetGridDescripcion;
begin
  GridACOES.Cells[0, 0] := 'Código';
  GridACOES.Cells[1, 0] := 'Descripción';

  GridESSOL.Cells[0, 0] := 'Código';
  GridESSOL.Cells[1, 0] := 'Descripción';
  if GridRelacion.RowCount > 1 then
    GridRelacion.FixedRows := 1;


  GridRelacion.Cells[0, 0] := 'Código';
  GridRelacion.Cells[1, 0] := 'Descripción Afiliación';
  GridRelacion.Cells[2, 0] := 'Código';
  GridRelacion.Cells[3, 0] := 'Descripción Suscripción';
end;

procedure TfrmManARE_RELACIONESTADO.AgregarPermitido(const aCodigoESSOL, aDescripcionESSOL, aCodigoACOES,
                                                     aDescripcionACOES: String; var aTargetGrid: TAdvStringGrid);
begin
  aTargetGrid.AddRow;

  aTargetGrid.Cells[0, aTargetGrid.RowCount - 1] := aCodigoESSOL;
  aTargetGrid.Cells[1, aTargetGrid.RowCount - 1] := aDescripcionESSOL;
  aTargetGrid.Cells[2, aTargetGrid.RowCount - 1] := aCodigoACOES;
  aTargetGrid.Cells[3, aTargetGrid.RowCount - 1] := aDescripcionACOES;
end;

procedure TfrmManARE_RELACIONESTADO.SpeedButton2Click(Sender: TObject);
begin
  GridPasarSeleccionados(GridESSOL, GridACOES, GridRelacion);
  GridESSOL.RemoveSelectedRows;
  CheckGrillaSinRegistros(GridESSOL);
end;

procedure TfrmManARE_RELACIONESTADO.LoadGrillaRelaciones;
var
  sSql: String;
begin
  sSql :=
    'SELECT re_estado_afiliacion, essol.tb_descripcion descsol, re_estado_suscripcion, acoes.tb_descripcion descaco' +
     ' FROM are_relacionestado' +
' LEFT JOIN art.ctb_tablas essol ON re_estado_afiliacion = essol.tb_codigo' +
' LEFT JOIN art.ctb_tablas acoes ON re_estado_suscripcion = acoes.tb_codigo' +
    ' WHERE essol.tb_clave = ''ESSOL''' +
      ' AND acoes.tb_clave = ''ACOES''' +
      ' AND re_fechabaja IS NULL';
  with GetQuery(sSql) do
  try
    GridRelacion.RowCount := 2;
    while not Eof do
    begin
      GridRelacion.Cells[0, GridRelacion.RowCount - 1] := FieldByName('re_estado_afiliacion').AsString;
      GridRelacion.Cells[1, GridRelacion.RowCount - 1] := FieldByName('descsol').AsString;

      GridRelacion.Cells[2, GridRelacion.RowCount - 1] := FieldByName('re_estado_suscripcion').AsString;
      GridRelacion.Cells[3, GridRelacion.RowCount - 1] := FieldByName('descaco').AsString;

      GridRelacion.RowCount := GridRelacion.RowCount + 1;

      Next;
    end;
    GridRelacion.RowCount := GridRelacion.RowCount -1;
  finally
    Free;
  end;
end;

function TfrmManARE_RELACIONESTADO.ExisteLineaRelacion(const aCodigoESSOL, aCodigoACOES: String): Boolean;
var
  aLoc: TPoint;
  aFp: TFindParams;
  bRes: Boolean;
begin
  bRes := False;
  aLoc := Point(-1, -1);
  aFp := [fnMatchRegular];
  //GridRelacion.Sear

  repeat
    aLoc := GridRelacion.Find(aLoc, aCodigoESSOL, aFp);
    if not ((aLoc.X = -1) or (aLoc.Y = -1) or (aLoc.X = 2)) then
      if GridRelacion.Cells[2, aLoc.Y] = aCodigoACOES then
        bRes := True;
  until (aLoc.X = -1) or (aLoc.Y = -1);
  Result := bRes;
end;

function TfrmManARE_RELACIONESTADO.ExisteEstado(const aEstado: String): Boolean;
var
  aLoc: TPoint;
  aFp: TFindParams;
  bRes: Boolean;
begin
  bRes := False;

  aLoc := Point(-1, -1);
  aFp := [fnMatchRegular];

  repeat
    aLoc := GridRelacion.Find(aLoc, aEstado, aFp);
    if not ((aLoc.X = -1) or (aLoc.Y = -1) or (aLoc.X = 2)) then
      bRes := True;
  until (aLoc.X = -1) or (aLoc.Y = -1);

  Result := bRes;
end;

procedure TfrmManARE_RELACIONESTADO.SpeedButton1Click(Sender: TObject);
begin
  GridRelacion.RemoveSelectedRows;
  CheckGrillaSinRegistros(GridRelacion);
  GridESSOL.ClearRowSelect;
  GridACOES.ClearRowSelect;

  //LoadGrillaEstados('ACOES', GridACOES);
  //LoadGrillaEstados('ESSOL', GridESSOL);
end;

procedure TfrmManARE_RELACIONESTADO.SeleccionarValoresRelacionados(aCodigoESSOL: String);
var
  aLoc: TPoint;
  aFp: TFindParams;
begin
  aLoc := Point(-1, -1);
  aFp := [fnMatchRegular];
  GridRelacion.ClearRowSelect;
  GridESSOL.ClearRowSelect;

  repeat
    aLoc := GridRelacion.Find(aLoc, aCodigoESSOL, aFp);
    if not ((aLoc.X = -1) or (aLoc.Y = -1) or (aLoc.X = 2)) then
      SeleccionarValor(GridRelacion.Cells[2, aLoc.Y], GridESSOL);
  until (aLoc.X = -1) or (aLoc.Y = -1);
end;

procedure TfrmManARE_RELACIONESTADO.SeleccionarValor(const aCodigo: String; var aGrilla: TAdvStringGrid);
var
  aLoc: TPoint;
  aFp: TFindParams;
begin
  aLoc := Point(-1, -1);
  aFp := [fnMatchRegular];
  //GridRelacion.Sear

  repeat
    aLoc := aGrilla.Find(aLoc, aCodigo, aFp);
    if not ((aLoc.X = -1) or (aLoc.Y = -1) or (aLoc.X = 1)) then
      aGrilla.RowSelect[aLoc.Y] := True;
  until (aLoc.X = -1) or (aLoc.Y = -1);
end;

procedure TfrmManARE_RELACIONESTADO.GridESSOLScrollCell(Sender: TObject; ACol, ARow, ScrollPosition, ScrollMin, ScrollMax: Integer);
begin
  SeleccionarValoresRelacionados(GridESSOL.Cells[0, ARow]);
end;

procedure TfrmManARE_RELACIONESTADO.tbGuardarClick(Sender: TObject);
var
  i: Integer;
begin
 { if CambiosNoAplicados then
    if MsgBox('Existen cambios no aplicados, si continua se perderán. ¿Desea Continuar?', MB_YESNO) = mrNo then
      Abort;
         }

  BeginTrans;
  try
    DarBajas;
    for i := 1 to GridRelacion.RowCount - 1 do
      if not ExisteRelacion(GridRelacion.Cells[0, i], GridRelacion.Cells[2, i]) then
        AgregarRelacion(GridRelacion.Cells[0, i], GridRelacion.Cells[2, i]);

    CommitTrans;
  except
    on E: Exception do
    begin
      RollBack;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
  tbRefreshClick(nil);
end;

procedure TfrmManARE_RELACIONESTADO.AgregarRelacion(const aCodigoESSOL, aCodigoACOES: String);
var
  sSql : String;
begin
  if (aCodigoESSOL <> '') and (aCodigoACOES <> '') then //por las dudas
  begin
    sSql :=
      'INSERT INTO art.are_relacionestado (re_id, re_estado_afiliacion, re_estado_suscripcion, re_usualta, re_fechaalta)' +
                                 ' VALUES (ART.SEQ_ID_RELACIONESTADO.NEXTVAL, :aCodigoESSOL, :aCodigoACOES, :usuario, SYSDATE)';
    // ART.SEQ_APC_ID
    EjecutarSqlSTEx(sSql,[aCodigoESSOL, aCodigoACOES, Sesion.UserID]);
  end;
end;

function TfrmManARE_RELACIONESTADO.ExisteRelacion(const aCodigoESSOL, aCodigoACOES: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM art.are_relacionestado' +
    ' WHERE re_estado_afiliacion = :aCodigoESSOL' +
      ' AND re_estado_suscripcion = :aCodigoACOES' +
      ' AND re_fechabaja IS NULL';
  Result := ExisteSqlEx(sSql, [aCodigoESSOL, aCodigoACOES]);
end;

procedure TfrmManARE_RELACIONESTADO.DarBajas;
var
  sSql: String;
begin
  sSql :=
    'SELECT re_estado_afiliacion, re_estado_suscripcion' +
     ' FROM are_relacionestado' +
    ' WHERE re_fechabaja IS NULL';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      if not ExisteLineaRelacion(FieldByName('re_estado_afiliacion').AsString, FieldByName('re_estado_suscripcion').AsString) then
        DarBajaSql(FieldByName('re_estado_afiliacion').AsString,  FieldByName('re_estado_suscripcion').AsString);

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmManARE_RELACIONESTADO.DarBajaSql(const aCodigoESSOL, aCodigoACOES: String);
var
  sSql: String;
begin
  if (aCodigoESSOL <> '') and (aCodigoACOES <> '') then //por las dudas
  begin
    sSql :=
      'UPDATE art.are_relacionestado' +
        ' SET re_fechabaja = SYSDATE, re_usubaja = :usuario' +
      ' WHERE re_id IN (SELECT re_id' +
                        ' FROM art.are_relacionestado' +
                       ' WHERE re_estado_afiliacion = :CodigoEssol' +
                         ' AND re_estado_suscripcion = :CodigoAcoes' +
                         ' AND re_fechabaja IS NULL)';
    EjecutarSqlSTEx(sSql,[Sesion.UserID, aCodigoESSOL, aCodigoACOES]);
  end;
end;

function TfrmManARE_RELACIONESTADO.CambiosNoAplicados: Boolean;
var
  bCambios: Boolean;
  i: Integer;
  sSql: String;
begin
  bCambios := False;
  sSql :=
    'SELECT re_estado_afiliacion, re_estado_suscripcion' +
     ' FROM are_relacionestado' +
    ' WHERE re_fechabaja IS NULL';
  with GetQuery(sSql) do
  try
    while (not Eof) and (not bCambios) do
    begin
      if not ExisteLineaRelacion(FieldByName('re_estado_afiliacion').AsString, FieldByName('re_estado_suscripcion').AsString) then
        bCambios := True;

      Next;
    end;
  finally
    Free;
  end;

  if not bCambios then
    for i := 1 to GridRelacion.RowCount - 1 do
      if not ExisteRelacion(GridRelacion.Cells[0, i], GridRelacion.Cells[2, i]) then
        bCambios := True;

  Result := bCambios;
end;

procedure TfrmManARE_RELACIONESTADO.tbImprimirClick(Sender: TObject);
begin
  GridRelacion.Print;
end;

procedure TfrmManARE_RELACIONESTADO.CargarGrillaESSOL(const aCodigoACOES: String; var aGrilla: TAdvStringGrid);
var
  sSql: String;
begin
  if aCodigoACOES = '' then
    Abort;

  sSql :=
    'SELECT tb_codigo, tb_descripcion' +
     ' FROM art.ctb_tablas' +
    ' WHERE tb_clave = ''ESSOL''' +
      ' AND tb_fechabaja IS NULL' +
      ' AND tb_codigo <> ''0''';
  with GetQuery(sSql) do
  try
    aGrilla.RowCount := 2;
    while not Eof do
    begin
      if not ExisteLineaRelacion(FieldByName('tb_codigo').AsString, aCodigoACOES) then
      begin
        aGrilla.Cells[0, aGrilla.RowCount - 1] := FieldByName('tb_codigo').AsString;
        aGrilla.Cells[1, aGrilla.RowCount - 1] := FieldByName('tb_descripcion').AsString;

        aGrilla.RowCount := aGrilla.RowCount + 1;
      end;

      Next;
    end;

    aGrilla.RowCount := aGrilla.RowCount - 1;
  finally
    Free;
  end;
end;

procedure TfrmManARE_RELACIONESTADO.CheckGrillaSinRegistros(var aGrilla: TAdvStringGrid);
begin
  if aGrilla.RowCount = 1 then
  begin
    aGrilla.RowCount := 2;
    aGrilla.FixedRows := 1;
    aGrilla.Clear;
    SetGridDescripcion;
  end;
end;

procedure TfrmManARE_RELACIONESTADO.GridACOESSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow <> -1) and (ARow <> 0) and (GridACOES.Cells[0, ARow] <> '') then
  begin
    CargarGrillaESSOL(GridACOES.Cells[0, ARow], GridESSOL);
    CheckGrillaSinRegistros(GridESSOL);
  end;
end;

end.
