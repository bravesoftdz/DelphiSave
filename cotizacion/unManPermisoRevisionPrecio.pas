unit unManPermisoRevisionPrecio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, DB, SDEngine,
  Placemnt, artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Grids, StaticGrid, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, Buttons, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, BaseGrid, AdvGrid,
  JvComponent, JvPrvwRender;

type
  TfrmManPermisoRevisionPrecio = class(TfrmCustomPanelABM)
    tbRefresh: TToolButton;
    tbGuardar: TToolButton;
    GridConPermiso: TAdvStringGrid;
    Label1: TLabel;
    GridSinPermiso: TAdvStringGrid;
    Panel1: TPanel;
    btnAgregar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Splitter1: TSplitter;
    procedure FSFormCreate(Sender: TObject);
    procedure tbRefreshClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
  private
    procedure AgregarPermiso(const aCodigo, aClave: String);
    procedure AgregarPermitido(const aCodigo, aDescripcion: String; var aTargetGrid: TAdvStringGrid);
    procedure GridPasarSeleccionados(var aSourceGrid, aTargetGrid: TAdvStringGrid);
    procedure LoadGrillaEstados(const aClave: String);  //clave ej. ESSOL ACOES
    procedure LoadGrillaEstadosConPermiso(const aClave: String);
    procedure QuitarPermiso (const aCodigo, aClave : String);
    procedure SetGridDescripcion;

    function CambiosNoAplicados: Boolean;
    function ExistePermiso(const aCodigo, aClave: String): Boolean;
  public
  end;

var
  frmManPermisoRevisionPrecio: TfrmManPermisoRevisionPrecio;

implementation

uses
  AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal;

{$R *.dfm}

procedure TfrmManPermisoRevisionPrecio.FSFormCreate(Sender: TObject);
begin
  inherited;
  
  LockControls(False);
  //GridSinPermiso.ColWidths[0] := 8;
  SetGridDescripcion;
  GridSinPermiso.DefaultRowHeight := 18;
  GridConPermiso.DefaultRowHeight := 18;
  toolButton6.Left := 0;
  tbGuardar.Left := 0;
  tbImprimir.Left := 0;
  toolButton4.Left := 0;
  tbRefresh.Left := 0;
  tbRefreshClick(nil);
end;

procedure TfrmManPermisoRevisionPrecio.LoadGrillaEstados(const aClave: String);
var
  sSql: String;
begin
  sSql :=
  'SELECT tb_codigo, tb_descripcion' +
   ' FROM art.ctb_tablas' +
  ' WHERE tb_clave = :clave' +
    ' AND tb_fechabaja IS NULL' +
    ' AND tb_modulo IN (''A'', ''R'' )' +
    ' AND (SELECT pr_codigo' +
           ' FROM apr_permiterecotizar' +
          ' WHERE pr_clave = :clave' +
            ' AND pr_codigo = tb_codigo' +
            ' AND pr_fechabaja IS NULL) IS NULL';
  with GetQueryEx(sSql, [aClave]) do
  try
    GridSinPermiso.RowCount := 2;
    while not Eof do
    begin
      GridSinPermiso.Cells[0, GridSinPermiso.RowCount - 1] := FieldByName('tb_codigo').AsString;
      GridSinPermiso.Cells[1, GridSinPermiso.RowCount - 1] := FieldByName('tb_descripcion').AsString;

      GridSinPermiso.RowCount := GridSinPermiso.RowCount + 1;

      Next;
    end;
    GridSinPermiso.RowCount := GridSinPermiso.RowCount - 1;
  finally
    Free;
  end;
end;

procedure TfrmManPermisoRevisionPrecio.tbRefreshClick(Sender: TObject);
begin
  inherited;

  if CambiosNoAplicados then
    if MsgBox('Existen cambios no aplicados, si continua se perderán. ¿ Desea continuar ?', MB_YESNO) = mrNo then
      Abort;

  LoadGrillaEstados('ACOES');
  LoadGrillaEstadosConPermiso('ACOES');
  SetGridDescripcion;
end;

procedure TfrmManPermisoRevisionPrecio.tbGuardarClick(Sender: TObject);
var
  i: Integer;
begin
  BeginTrans;
  try
    for i := 1 to GridConPermiso.RowCount - 1 do
      if not ExistePermiso(GridConPermiso.Cells[0, i], 'ACOES') then
        AgregarPermiso(GridConPermiso.Cells[0, i], 'ACOES');

    for i := 1 to GridSinPermiso.RowCount - 1 do
      if ExistePermiso(GridSinPermiso.Cells[0, i], 'ACOES') then
        QuitarPermiso(GridSinPermiso.Cells[0, i], 'ACOES');
  except
    on E: Exception do
    begin
      RollBack;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
  CommitTrans;
end;

procedure TfrmManPermisoRevisionPrecio.tbImprimirClick(Sender: TObject);
begin
  GridConPermiso.Print;
end;

procedure TfrmManPermisoRevisionPrecio.AgregarPermitido(const aCodigo, aDescripcion: String; var aTargetGrid: TAdvStringGrid);
begin
  aTargetGrid.AddRow;
  aTargetGrid.Cells[0, aTargetGrid.RowCount - 1] := aCodigo;
  aTargetGrid.Cells[1, aTargetGrid.RowCount - 1] := aDescripcion;
end;

procedure TfrmManPermisoRevisionPrecio.LoadGrillaEstadosConPermiso(const aClave: String);
var
  sSql: String;
begin
  GridConPermiso.RowCount := 2;
  GridConPermiso.Clear;

  sSql :=
    'SELECT pr_codigo, (SELECT tb_descripcion' +
                        ' FROM art.ctb_tablas' +
                       ' WHERE tb_clave = :clave' +
                         ' AND tb_codigo = pr_codigo) descripcion' +
     ' FROM apr_permiterecotizar' +
    ' WHERE pr_clave = :clave' +
      ' AND pr_fechabaja IS NULL';
  with GetQueryEx(sSql, [aClave]) do
  try
    GridConPermiso.RowCount := 2;
    while not Eof do
    begin
      GridConPermiso.Cells[0, GridConPermiso.RowCount - 1] := FieldByName('pr_codigo').AsString;
      GridConPermiso.Cells[1, GridConPermiso.RowCount - 1] := FieldByName('descripcion').AsString;
      GridConPermiso.RowCount := GridConPermiso.RowCount + 1;

      Next;
    end;
    GridConPermiso.RowCount := GridConPermiso.RowCount - 1;
  finally
    Free;
  end;
end;

procedure TfrmManPermisoRevisionPrecio.btnAgregarClick(Sender: TObject);
begin
  GridPasarSeleccionados(GridSinPermiso, GridConPermiso);
end;

procedure TfrmManPermisoRevisionPrecio.GridPasarSeleccionados(var aSourceGrid, aTargetGrid: TAdvStringGrid);
var
  i: Integer;
begin
  if (aTargetGrid.RowCount = 2) and (aTargetGrid.Cells[0, 1] = '') and (aTargetGrid.Cells[1, 1] = '') then
  begin
    aTargetGrid.RemoveRows(1, 1);
    aTargetGrid.Clear;
  end;

  for i := 1 to aSourceGrid.RowCount - 1 do
    if aSourceGrid.RowSelect[i] {GridSinPermiso.SelectedCells[0, i - 1]} then
      AgregarPermitido(aSourceGrid.Cells[0, i], aSourceGrid.Cells[1, i], aTargetGrid);
  aSourceGrid.RemoveSelectedRows;

  if aSourceGrid.RowCount = 1 then
  begin
    aSourceGrid.RowCount := 2;
    aSourceGrid.FixedRows := 1;
    aSourceGrid.Clear;
  end;
  aTargetGrid.FixedRows := 1;
  SetGridDescripcion;
end;

procedure TfrmManPermisoRevisionPrecio.SpeedButton2Click(Sender: TObject);
begin
  GridPasarSeleccionados(GridConPermiso, GridSinPermiso);
end;

procedure TfrmManPermisoRevisionPrecio.SetGridDescripcion;
begin
  GridSinPermiso.Cells[0,0] := 'Código';
  GridSinPermiso.Cells[1,0] := 'Descripción';

  GridConPermiso.Cells[0,0] := 'Código';
  GridConPermiso.Cells[1,0] := 'Descripción';
end;

function TfrmManPermisoRevisionPrecio.ExistePermiso(const aCodigo, aClave: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM apr_permiterecotizar' +
    ' WHERE pr_clave = :clave' +
      ' AND pr_codigo = :codigo' +
      ' AND pr_fechabaja IS NULL';
 Result := ExisteSqlEx(sSql, [aClave, aCodigo]);
end;

procedure TfrmManPermisoRevisionPrecio.AgregarPermiso(const aCodigo, aClave: String);
var
  sSql: String;
begin
  if (aCodigo <> '') and (aClave <> '') then //por las dudas
  begin
    sSql :=
      'INSERT INTO apr_permiterecotizar (pr_clave, pr_codigo, pr_usualta, pr_fechaalta)' +
                               ' VALUES (:clave, :codigo, :usualta, SYSDATE)';
    EjecutarSqlSTEx(sSql,[aClave, aCodigo, Sesion.UserID]);
  end;
end;

procedure TfrmManPermisoRevisionPrecio.QuitarPermiso(const aCodigo, aClave: String);
var
  sSql: String;
begin
  if (aCodigo <> '') and (aClave <> '') then //por las dudas
  begin
    sSql :=
      'UPDATE apr_permiterecotizar' +
        ' SET pr_fechabaja = SYSDATE,' +
            ' pr_usubaja = :usuario' +
      ' WHERE pr_id IN (SELECT pr_id' +
                        ' FROM apr_permiterecotizar' +
                       ' WHERE pr_clave = :clave' +
                         ' AND pr_codigo = :codigo' +
                         ' AND pr_fechabaja IS NULL)';
    EjecutarSqlSTEx(sSql, [Sesion.UserID, aClave, aCodigo]);
  end;
end;

function TfrmManPermisoRevisionPrecio.CambiosNoAplicados: Boolean;
var
  bRes: Boolean;
  i: Integer;
begin
    bRes := False;
    i := 1;

    while (i <= GridConPermiso.RowCount -1) and (not bRes) do
    begin
      if not ExistePermiso(GridConPermiso.Cells[0, i], 'ACOES') and (GridConPermiso.Cells[0, i] <> '') then
        bRes := True;
      Inc(i);
    end;

    i := 1;
    while (i <= GridSinPermiso.RowCount - 1)  and (not bRes) do
    begin
      if ExistePermiso(GridSinPermiso.Cells[0, i], 'ACOES') and (GridSinPermiso.Cells[0, i] <> '') then
        bRes := True;
      Inc(i);
    end;

    Result := bRes;
end;

procedure TfrmManPermisoRevisionPrecio.tbSalirClick(Sender: TObject);
begin
  if CambiosNoAplicados then
    if MsgBox('Existen cambios no aplicados, si continua se perderán. ¿ Desea Continuar ?', MB_YESNO) = mrNo then
      Abort;

  inherited;
end;

end.
