unit unListSiniConLiqMensuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unArtDbFrame, unFraEmpresa,
  SinEdit, unFraTrabajador, PatternEdit, IntEdit, ComboEditor, CheckCombo,
  DBCheckCombo;

type
  TfrmListSiniConLiqMensuales = class(TfrmCustomConsulta)
    gbFechaDeLiquidacion: TGroupBox;
    Label1: TLabel;
    dcFecLiquiDesde: TDateComboBox;
    dcFecLiquiHasta: TDateComboBox;
    gbConceptoPago: TGroupBox;
    GroupBox2: TGroupBox;
    rbSiCasosActualizados: TRadioButton;
    rbNoCasosActualizados: TRadioButton;
    rbTodosCasosActualizados: TRadioButton;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbTrabajador: TGroupBox;
    fraTrabajador: TfraTrabajador;
    GroupBox1: TGroupBox;
    rbSiPostDecre: TRadioButton;
    rbNoPostDecre: TRadioButton;
    rbTodosPostDecre: TRadioButton;
    GroupBox3: TGroupBox;
    rbSiDesvinculados: TRadioButton;
    rbNoDesvinculados: TRadioButton;
    rbTodosDesvinculados: TRadioButton;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    edSinHasta: TIntEdit;
    edSinDesde: TIntEdit;
    cmbConceptoPago: TDBCheckCombo;
    dsConceptoPago: TDataSource;
    sdqConceptoPago: TSDQuery;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FRegistrosSeleccionados: TStringList;
    function HayRegistroActivo :Boolean;
    function ValidarActualizarBase: boolean;
  public
    { Public declarations }
  end;

var
  frmListSiniConLiqMensuales: TfrmListSiniConLiqMensuales;

implementation

uses unComunes, AnsiSql, Menus, CustomDlgs, unDmPrincipal, unSesion;

{$R *.dfm}

procedure TfrmListSiniConLiqMensuales.tbRefrescarClick(Sender: TObject);
var sSql :String;
begin
  Verificar((dcFecLiquiDesde.Date = 0) or (dcFecLiquiHasta.Date = 0), gbFechaDeLiquidacion, 'El Rango de la Fecha de Liquidación es obligatorio.');
  FRegistrosSeleccionados.Clear;
  sSql := 'SELECT DISTINCT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_id, art.utiles.armar_cuit(ex_cuit) cuit, ' +
                ' em_nombre empresa, art.utiles.armar_cuit(ex_cuil) cuil, tj_nombre trabajador, cp_denpago conpago, cp_titpago, ' +
                ' art.dinerarias.get_fechadespido(ex_siniestro, ex_orden) fdesvinculacion, ' +
                ' art.dinerarias.get_baseactualizada(ex_siniestro, ex_orden) actualizado, null CHECKBOX, le_fproceso FLiquidacion, ' +
                ' ex_fechaaccidente FechaAccidente, ex_siniestro, ex_orden ' +
           ' FROM art.sex_expedientes, ctj_trabajador, aem_empresa, art.sle_liquiempsin, art.scp_conpago ' +
          ' WHERE ex_idtrabajador = tj_id ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND le_siniestro = ex_siniestro ' +
            ' AND le_orden = ex_orden ' +
            ' AND le_recaida = ex_recaida ' +
            ' AND le_conpago = cp_conpago ' +
            ' AND NVL(le_estado, '' '') NOT IN(''A'', ''X'', ''Z'') ' +
            ' AND cp_tipo IN(''I'', ''P'') ' +
            ' AND cp_espagomensual = ''S'' ';

  if not(edSinDesde.IsEmpty) and not(edSinHasta.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro BETWEEN ' + edSinDesde.TextSql + ' AND ' + edSinHasta.TextSql
  else if not(edSinDesde.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro >= ' + edSinDesde.TextSql
  else if not(edSinHasta.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro <= ' + edSinHasta.TextSql;

  if not dcFecLiquiDesde.IsEmpty then
    sSql := sSql + ' AND le_fproceso >= ' + SqlDate(dcFecLiquiDesde.Date);

  if not dcFecLiquiHasta.IsEmpty then
    sSql := sSql + ' AND le_fproceso <= ' + SqlDate(dcFecLiquiHasta.Date);

  if (cmbConceptoPago.CheckedCount > 0) then
    sSql := sSql + ' and le_conpago ' + cmbConceptoPago.InSql;


  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if rbSiCasosActualizados.Checked then
    sSql := sSql + ' AND art.dinerarias.get_baseactualizada(ex_siniestro, ex_orden) = ''S'' '
  else if rbNoCasosActualizados.Checked then
    sSql := sSql + ' AND art.dinerarias.get_baseactualizada(ex_siniestro, ex_orden) = ''N'' ';

  if not fraTrabajador.IsEmpty then
    sSql := sSql + ' AND ex_cuil = ' + SqlValue(fraTrabajador.CUIL);

  if rbSiPostDecre.Checked then
    sSql := sSql + ' AND ex_fechaaccidente >= ' + sqldate(strtodate(FECHA_DECRETO_1694_09))
  else if rbNoPostDecre.Checked then
    sSql := sSql + ' AND ex_fechaaccidente <  ' + sqldate(strtodate(FECHA_DECRETO_1694_09));

  if rbSiDesvinculados.Checked then
    sSql := sSql + ' AND art.dinerarias.get_fechadespido(ex_siniestro, ex_orden) IS NOT NULL '
  else if rbNoDesvinculados.Checked then
    sSql := sSql + ' AND art.dinerarias.get_fechadespido(ex_siniestro, ex_orden) IS NULL ';


  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;

end;


procedure TfrmListSiniConLiqMensuales.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  FRegistrosSeleccionados.Clear;
  edSinDesde.Clear;
  edSinHasta.Clear;
  dcFecLiquiDesde.Clear;
  dcFecLiquiHasta.Clear;
  cmbConceptoPago.ClearChecks;
  fraEmpresa.Clear;
  fraTrabajador.Clear;
  rbTodosCasosActualizados.Checked := True;
  rbTodosPostDecre.Checked         := True;
  rbTodosDesvinculados.Checked     := True;
end;

procedure TfrmListSiniConLiqMensuales.FormCreate(Sender: TObject);
begin
  inherited;
  FRegistrosSeleccionados := TStringList.Create;
end;

procedure TfrmListSiniConLiqMensuales.FSFormDestroy(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  inherited;
end;

function TfrmListSiniConLiqMensuales.HayRegistroActivo: Boolean;
begin
  Result := sdqConsulta.Active and not sdqConsulta.IsEmpty;
end;

procedure TfrmListSiniConLiqMensuales.GridCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('ex_id').AsString);
    Grid.Repaint;
  end;
end;

procedure TfrmListSiniConLiqMensuales.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmListSiniConLiqMensuales.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ex_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen
end;

procedure TfrmListSiniConLiqMensuales.GridContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  Item: TMenuItem;
  MenuGrilla: TPopUpMenu;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla  := TPopUpMenu.Create(Self);
  Item        := TMenuItem.Create(Self);
  try
    if HayRegistroActivo then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmListSiniConLiqMensuales.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;

procedure TfrmListSiniConLiqMensuales.btnMarcarTodos(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  APointer := sdqConsulta.GetBookmark;

  FRegistrosSeleccionados.Clear;
  Screen.Cursor := crSQLWait;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(FieldByName('ex_id').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmListSiniConLiqMensuales.tbPropiedadesClick(Sender: TObject);    // Boton de Actualizar Base
var
  aLista: TStringList;
  aMetodo: TDataSetNotifyEvent;
  aPointer: TBookMark;
  sSql: String;
begin
  if ValidarActualizarBase and MsgAsk('¿Confirma actualizar la base para el/los registro/s seleccionado/s?') then
  begin
    aLista   := TStringList.Create;
    aMetodo  := sdqConsulta.AfterScroll;
    sdqConsulta.AfterScroll := nil;
    aPointer := sdqConsulta.GetBookmark;

    with sdqConsulta do
    try
      DisableControls;
      First;
      BeginTrans;
      while not Eof do
      Try
        if FRegistrosSeleccionados.IndexOf(FieldByName('ex_id').AsString) > -1 then
        begin
          sSql := ' BEGIN ' +
                    ' art.dinerarias.do_actualizarbasesipa(:psiniestro, :porden, :pusuario); ' +
                  ' END; ';

          EjecutarSqlSTEx(sSql, [FieldByName('ex_siniestro').AsInteger, FieldByName('ex_orden').AsInteger, Sesion.UserID]);
        end;
        Next;
      Except
        on E:Exception do
        begin
          Rollback(True);
          ErrorMsg(E, 'Error al intentar guardar los datos.');
          Exit;
        end;
      end;

      CommitTrans;
      MsgBox('La operación se llevó a cabo de manera exitosa.');
      tbRefrescarClick(Nil);
    finally
      aLista.Free;
      AfterScroll := aMetodo;
      GotoBookmark(APointer);
      EnableControls;
    end;
  end;
end;

function TfrmListSiniConLiqMensuales.ValidarActualizarBase: boolean;
var
  aLista :TStringList;
  aMetodo :TDataSetNotifyEvent;
  aPointer :TBookMark;
begin

 // Result := False;
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');

  aLista   := TStringList.Create;
  aMetodo  := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  aPointer := sdqConsulta.GetBookmark;

  with sdqConsulta do
  Try
    DisableControls;

    First;
    while not Eof do
    begin
      if (FRegistrosSeleccionados.IndexOf(FieldByName('ex_id').AsString) > -1) then
      begin
        Verificar((FieldByName('ACTUALIZADO').AsString = 'S'), Grid, 'Existen registros seleccionados que ya se encuentran actualizados. Por favor, revisar la selección.');
        Verificar((FieldByName('FECHAACCIDENTE').AsDateTime < strtodate(FECHA_DECRETO_1694_09)), Grid, 'Existen registros seleccionados con fecha de accidente anterior al decreto 1694/09. Por favor, revisar la selección.');
        Verificar((FieldByName('FDESVINCULACION').IsNull), Grid, 'Existen registros seleccionados sin Fecha de Despido. Por favor, revisar la selección.');
      end;

      Next;
    end;
  Finally
    aLista.Free;
    AfterScroll := aMetodo;
    GotoBookmark(APointer);
    EnableControls;
  end;

  Result := True;
end;

procedure TfrmListSiniConLiqMensuales.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;

end.
