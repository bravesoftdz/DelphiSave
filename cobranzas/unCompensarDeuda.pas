unit unCompensarDeuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, ExtCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Menus, RxPlacemnt;

type
  TfrmCompensarDeuda = class(TfrmCustomConsulta)
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
    tbCompensMasiva: TToolButton;
    OpenDialog: TOpenDialog;
    pmnuMarcarDeudores: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    pmnuMarcarAcreedores: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqAcreedorAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbCompensMasivaClick(Sender: TObject);
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
  frmCompensarDeuda: TfrmCompensarDeuda;
  TotalConsultaD: Array of Extended;
  TotalConsultaA: Array of Extended;

implementation

uses
  CustomDlgs, unDmPrincipal, unSesion, AnsiSql, unArt, StrFuncs, DbFuncs, General,
  unGrids, unCobranzas;

{$R *.dfm}

procedure TfrmCompensarDeuda.FormCreate(Sender: TObject);
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

procedure TfrmCompensarDeuda.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaComp.Clear;
  sdqAcreedor.Close;
  fraEmpresaComp.mskCUIT.SetFocus;
end;

procedure TfrmCompensarDeuda.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  Verificar(fraEmpresaComp.IsEmpty, fraEmpresaComp.edContrato, 'Debe ingresar el nro. de contrato.');

  sSql := 'COMPDEUDA.DO_CARGARPERIODOSCOMPSDOACRE(:Contrato, :Usuario);';
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

procedure TfrmCompensarDeuda.tbPropiedadesClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  Verificar(fraEmpresaComp.IsEmpty, fraEmpresaComp.edContrato, 'Debe ingresar el nro. de contrato.');
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un periodo de la grilla de Saldos Deudores.');
  Verificar(GridAcreedor.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un periodo de la grilla de Saldos Acreedores.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      if IsCorrespondePagoFG(fraEmpresaComp.Contrato, sdqConsulta.FieldByName('PERIODO').AsString) then
        MsgBox('Corresponde el pago al Fondo de Garantía. Se sugiere revisar si el saldo a favor es real.', MB_ICONINFORMATION);
    end;

  for i := 0 to GridAcreedor.SelectedRows.Count - 1 do
    begin
      sdqAcreedor.GotoBookmark(pointer(GridAcreedor.SelectedRows.Items[i]));

      if IsCorrespondePagoFG(fraEmpresaComp.Contrato, sdqConsulta.FieldByName('PERIODO').AsString) then
        MsgBox('Corresponde el pago al Fondo de Garantía. Se sugiere revisar si el saldo a favor es real.', MB_ICONINFORMATION);
    end;

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

        sSql := 'COMPDEUDA.DO_COMPENSARSDOACREEDOR(:Usuario);';
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

procedure TfrmCompensarDeuda.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmCompensarDeuda.sdqAcreedorAfterOpen(DataSet: TDataSet);
begin
  if sdqAcreedor.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqAcreedor.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmCompensarDeuda.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  SortDialog.DataSet := sdqAcreedor;
  SortDialog.DoModifySql;
  SortDialog.DataSet := sdqConsulta;
end;

procedure TfrmCompensarDeuda.tbCompensMasivaClick(Sender: TObject);
var
  Archivo: TextFile;
  sSql, sTemp, sContratos: String;
begin
  sContratos := '';

  OpenDialog.Title      := 'Archivo de contratos';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter     := 'Archivos de Texto(*.txt)|*.txt';

  if OpenDialog.Execute then
    try
      try
        AssignFile(Archivo, OpenDialog.FileName);
        Reset(Archivo);

        while (not Eof(Archivo)) do
          begin
            Readln(Archivo, sTemp);

            if StrToInt(sTemp) <> 0 then   // Con esto chequeo que no ingrese cualquier cosa
              sContratos := sContratos + sTemp + ',';
          end;

        if sContratos <> '' then
          begin
            sContratos := Copy(sContratos, 1, Length(sContratos) - 1);

            BeginTrans;
            try
              sSql := 'DELETE FROM TCC_COMPENSACONTRATO ' +
                       'WHERE CC_USUARIO = :Usuario';
              EjecutarSqlSTEx(sSql, [Sesion.UserId]);

              sSql := 'INSERT INTO TCC_COMPENSACONTRATO(CC_CONTRATO, CC_USUARIO) ' +
                           'SELECT CO_CONTRATO, ' + SqlValue(Sesion.UserId) + ' ' +
                             'FROM ACO_CONTRATO ' +
                            'WHERE CO_CONTRATO IN (' + sContratos + ')';
              EjecutarSqlST(sSql);

              sSql := 'COMPDEUDA.DO_COMPMASIVASDOACREEDOR(:Usuario);';
              EjecutarStoreSTEx(sSql, [Sesion.UserId]);

              CommitTrans;
              MsgBox('Los contratos se han compensado correctamente.', MB_ICONINFORMATION);
            except
              on E: Exception do
                begin
                  RollBack;

                  Raise Exception.Create(E.Message + CRLF + 'Error al compensar los contratos.');
                end;
            end;
          end;
      except
        MsgBox('El archivo no posee un formato válido.', MB_ICONERROR);
      end;
    finally
      CloseFile(Archivo);
    end;
end;

procedure TfrmCompensarDeuda.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcTotales;
end;

procedure TfrmCompensarDeuda.MenuItem1Click(Sender: TObject);
begin
  GridAcreedor.SelectAll;
  CalcTotales;
end;

procedure TfrmCompensarDeuda.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  CalcTotales;
end;

procedure TfrmCompensarDeuda.MenuItem2Click(Sender: TObject);
begin
  GridAcreedor.UnselectAll;
  CalcTotales;
end;

procedure TfrmCompensarDeuda.CalcTotales;
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

procedure TfrmCompensarDeuda.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsultaD[iPos]), '$');
end;

procedure TfrmCompensarDeuda.GridAcreedorPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsultaA[iPos]), '$');
end;

procedure TfrmCompensarDeuda.GridCellClick(Column: TColumn);
begin
  CalcTotales;
end;

procedure TfrmCompensarDeuda.GridAcreedorCellClick(Column: TColumn);
begin
  CalcTotales;
end;

procedure TfrmCompensarDeuda.GridAcreedorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcTotales;
end;

procedure TfrmCompensarDeuda.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcTotales;
end;

end.


