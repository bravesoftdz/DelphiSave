unit unCompensarIntereses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, ExtCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Menus, RxPlacemnt;

type
  TfrmCompensarIntereses = class(TfrmCustomConsulta)
    Splitter1: TSplitter;
    pnlDeudor: TPanel;
    Panel1: TPanel;
    GroupBox1: TPanel;
    GridAcreedor: TArtDBGrid;
    pnlAcreedor: TPanel;
    fraEmpresaComp: TfraEmpresa;
    lbContrato: TLabel;
    sdqAcreedor: TSDQuery;
    dsAcreedor: TDataSource;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    OpenDialog: TOpenDialog;
    pmnuMarcarDeudores: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    pmnuMarcarAcreedores: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqAcreedorAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridAcreedorPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridCellClick(Column: TColumn);
    procedure GridAcreedorCellClick(Column: TColumn);
    procedure GridAcreedorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure CalcTotales;
  public
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('IMPORTE');

var
  frmCompensarIntereses: TfrmCompensarIntereses;
  TotalConsultaD: Array of Extended;
  TotalConsultaA: Array of Extended;

implementation

uses
  CustomDlgs, unDmPrincipal, unSesion, AnsiSql, unArt, StrFuncs, DbFuncs, General,
  unGrids;

{$R *.dfm}

procedure TfrmCompensarIntereses.FormCreate(Sender: TObject);
begin
  inherited;

  Grid.Parent     := pnlDeudor;
  pnlDeudor.Align := alClient;

  with fraEmpresaComp do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  SetLength(TotalConsultaD, MAXCOLS + 1);
  SetLength(TotalConsultaA, MAXCOLS + 1);
end;

procedure TfrmCompensarIntereses.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaComp.Clear;
  sdqAcreedor.Close;
  fraEmpresaComp.mskCUIT.SetFocus;
end;

procedure TfrmCompensarIntereses.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  Verificar(fraEmpresaComp.IsEmpty, fraEmpresaComp.edContrato, 'Debe ingresar el nro. de contrato.');

  sSql := 'COMPDEUDA.DO_CARGARPERIODOSCOMPINTERESES(:Contrato, :Usuario);';
  EjecutarStoreEx(sSql, [fraEmpresaComp.ContratoExt, Sesion.UserId]);

  sSql := 'SELECT CD_PERIODO PERIODO, CD_DEUDA IMPORTE ' +
            'FROM TCD_COMPENSADEUDA ' +
           'WHERE CD_USUARIO = ' + SqlValue(Sesion.UserId) + ' ';

  sWhere := ' AND CD_CONTRATO = ' + SqlValue(fraEmpresaComp.ContratoExt) + ' ';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;

  sSql := 'SELECT CA_PERIODO PERIODO, CA_SALDO IMPORTE ' +
            'FROM TCA_COMPENSAACREEDOR ' +
           'WHERE CA_USUARIO = ' + SqlValue(Sesion.UserId) + ' ';

  sWhere := ' AND CA_CONTRATO = ' + SqlValue(fraEmpresaComp.ContratoExt) + ' ';

  sdqAcreedor.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  OpenQuery(sdqAcreedor);

  CalcTotales;
end;

procedure TfrmCompensarIntereses.tbPropiedadesClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  Verificar(fraEmpresaComp.IsEmpty, fraEmpresaComp.edContrato, 'Debe ingresar el nro. de contrato.');
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un periodo de la grilla de Intereses Adeudados.');
  Verificar(GridAcreedor.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un periodo de la grilla de Intereses Pagados.');

  if MsgBox('¿Confirma la compensación de los periodos seleccionados?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            sSql := 'UPDATE TCD_COMPENSADEUDA ' +
                       'SET CD_MARCADO = ''S'' ' +
                     'WHERE CD_USUARIO = :Usuario ' +
                       'AND CD_CONTRATO = :Contrato ' +
                       'AND CD_PERIODO = :Periodo';
            EjecutarSqlSTEx(sSql, [Sesion.UserId, fraEmpresaComp.ContratoExt, sdqConsulta.FieldByName('PERIODO').AsString]);
          end;

        for i := 0 to GridAcreedor.SelectedRows.Count - 1 do
          begin
            sdqAcreedor.GotoBookmark(pointer(GridAcreedor.SelectedRows.Items[i]));

            sSql := 'UPDATE TCA_COMPENSAACREEDOR ' +
                       'SET CA_MARCADO = ''S'' ' +
                     'WHERE CA_USUARIO = :Usuario ' +
                       'AND CA_CONTRATO = :Contrato ' +
                       'AND CA_PERIODO = :Periodo';
            EjecutarSqlSTEx(sSql, [Sesion.UserId, fraEmpresaComp.ContratoExt, sdqAcreedor.FieldByName('PERIODO').AsString]);
          end;

        sSql := 'COMPDEUDA.DO_COMPENSARINTERESES(:Usuario);';
        EjecutarStoreSTEx(sSql, [Sesion.UserId]);

        CommitTrans;
        MsgBox('Los periodos se han compensado correctamente.', MB_ICONINFORMATION);

        tbRefrescarClick(nil);
      except
        on E: Exception do
          begin
            RollBack;

            Raise Exception.Create(E.Message + CRLF + 'Error al compensar los periodos.');
          end;
      end;
    end;
end;

procedure TfrmCompensarIntereses.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmCompensarIntereses.sdqAcreedorAfterOpen(DataSet: TDataSet);
begin
  if sdqAcreedor.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqAcreedor.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmCompensarIntereses.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  SortDialog.DataSet := sdqAcreedor;
  SortDialog.DoModifySql;
  SortDialog.DataSet := sdqConsulta;
end;

procedure TfrmCompensarIntereses.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcTotales;
end;

procedure TfrmCompensarIntereses.MenuItem1Click(Sender: TObject);
begin
  GridAcreedor.SelectAll;
  CalcTotales;
end;

procedure TfrmCompensarIntereses.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  CalcTotales;
end;

procedure TfrmCompensarIntereses.MenuItem2Click(Sender: TObject);
begin
  GridAcreedor.UnselectAll;
  CalcTotales;
end;

procedure TfrmCompensarIntereses.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if sdqConsulta.Active then
        TotalConsultaD[0] := ObtenerSuma(Grid, 'IMPORTE', True);

      if sdqAcreedor.Active then
        TotalConsultaA[0] := ObtenerSuma(GridAcreedor, 'IMPORTE', True);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmCompensarIntereses.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsultaD[iPos]), '$');
end;

procedure TfrmCompensarIntereses.GridAcreedorPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsultaA[iPos]), '$');
end;

procedure TfrmCompensarIntereses.GridCellClick(Column: TColumn);
begin
  CalcTotales;
end;

procedure TfrmCompensarIntereses.GridAcreedorCellClick(Column: TColumn);
begin
  CalcTotales;
end;

procedure TfrmCompensarIntereses.GridAcreedorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcTotales;
end;

procedure TfrmCompensarIntereses.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcTotales;
end;

end.

