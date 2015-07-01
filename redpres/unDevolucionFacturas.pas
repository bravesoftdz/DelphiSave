unit unDevolucionFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraPrestador, Mask, ToolEdit, DateComboBox,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, CurrEdit, unFraOPV_PROVEEDOR,
  unFraCodigoDescripcion, Menus;

type
  TfrmDevolucionFacturas = class(TfrmCustomGridABM)
    GroupBox3: TGroupBox;
    Label4: TLabel;
    dcHastaDevol: TDateComboBox;
    dcDesdeDevol: TDateComboBox;
    GroupBox1: TGroupBox;
    fraPrestadorFiltro: TfraPrestador;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    dcFechaABM: TDateComboBox;
    rbPrestadorABM: TRadioButton;
    rbProveedorABM: TRadioButton;
    fraPrestadorABM: TfraPrestador;
    Label2: TLabel;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    cmbTipoFacABM: TArtComboBox;
    dsTipoFactura: TDataSource;
    sdqTipoFactura: TSDQuery;
    Label5: TLabel;
    edNroFacABM: TEdit;
    dcFechaFacABM: TDateComboBox;
    Label6: TLabel;
    Label7: TLabel;
    edImpFacABM: TCurrencyEdit;
    GroupBox6: TGroupBox;
    rbDevolCorreoABM: TRadioButton;
    rbDevolBolsinABM: TRadioButton;
    rbDevolPersonalABM: TRadioButton;
    rbNoIngresadoABM: TRadioButton;
    dcFechaRecABM: TDateComboBox;
    Label8: TLabel;
    pnlNoIngresado: TPanel;
    mskCUITNI: TMaskEdit;
    lbCUIT: TLabel;
    Label9: TLabel;
    edNombreNI: TEdit;
    fraProveedorFiltro: TfraOPV_PROVEEDOR;
    Label10: TLabel;
    fraProveedorABM: TfraOPV_PROVEEDOR;
    lblCuitProv: TLabel;
    fraMotivoABM: TfraCodigoDescripcion;
    fraMotivoFiltro: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    tbEnviarCarta: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure rbPrestadorABMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbModificarClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbEnviarCartaClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
  private
    FRegistrosSeleccionados: TStringList;  
    procedure DoVisibleFrame(bLimpiar: Boolean);
    procedure DoEnviarCarta;
    function HayRegistroActivo :Boolean;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmDevolucionFacturas: TfrmDevolucionFacturas;

implementation

uses unCustomConsulta, unDmPrincipal, AnsiSql, CustomDlgs, CUIT, General, unSesion,
     unRptDevolucionFacturas, unVisualizador;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.ClearControls;
begin
  dcFechaABM.Date           := DBDate;
  rbPrestadorABM.Checked    := True;
  rbDevolCorreoABM.Checked  := True;
  fraPrestadorABM.Clear;
  fraMotivoABM.Clear;
  cmbTipoFacABM.Clear;
  edNroFacABM.Clear;
  dcFechaFacABM.Clear;
  dcFechaRecABM.Clear;
  edImpFacABM.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.LoadControls;
begin
  DoVisibleFrame(True);
  dcFechaABM.Date           := sdqConsulta.FieldByName('df_fechadevol').AsDateTime;
  if (sdqConsulta.FieldByName('df_codtipo').AsString = 'P') then
  begin
    rbPrestadorABM.Checked    := True;
    fraPrestadorABM.Value     := sdqConsulta.FieldByName('df_idprestador').AsInteger;
  end
  else if (sdqConsulta.FieldByName('df_codtipo').AsString = 'V') then
  begin
    rbProveedorABM.Checked    := True;
    fraProveedorABM.Value     := sdqConsulta.FieldByName('df_idproveedor').AsInteger;
  end
  else begin
    rbNoIngresadoABM.Checked  := True;
    mskCUITNI.Text            := sdqConsulta.FieldByName('df_cuit').AsString;
    edNombreNI.Text           := sdqConsulta.FieldByName('df_nombre').AsString;
  end;
  fraMotivoABM.Value          := sdqConsulta.FieldByName('df_idmotivodevol').AsString;
  cmbTipoFacABM.FieldValue    := sdqConsulta.FieldByName('df_idtipofac').AsString;
  edNroFacABM.Text            := sdqConsulta.FieldByName('df_numerofac').AsString;
  dcFechaFacABM.Date          := sdqConsulta.FieldByName('df_fechafac').AsDateTime;
  dcFechaRecABM.Date          := sdqConsulta.FieldByName('df_fecharecepfac').AsDateTime;
  edImpFacABM.Value           := sdqConsulta.FieldByName('df_importefac').AsCurrency;
  rbDevolCorreoABM.Checked    := (sdqConsulta.FieldByName('df_codmediodevol').AsString = 'C');
  rbDevolBolsinABM.Checked    := (sdqConsulta.FieldByName('df_codmediodevol').AsString = 'B');
  rbDevolPersonalABM.Checked  := (sdqConsulta.FieldByName('df_codmediodevol').AsString = 'P');
end;
{-------------------------------------------------------------------------------}
function TfrmDevolucionFacturas.Validar: Boolean;
begin
  Verificar(dcFechaABM.IsEmpty, dcFechaABM, 'Debe ingresar la fecha de devolución.');
  Verificar(rbPrestadorABM.Checked and fraPrestadorABM.IsEmpty, fraPrestadorABM, 'Debe ingresar el prestador.');
  Verificar(rbProveedorABM.Checked and fraProveedorABM.IsEmpty, fraProveedorABM, 'Debe ingresar el proveedor.');
  Verificar(rbNoIngresadoABM.Checked and ((Trim(mskCUITNI.Text) = '') or (Trim(edNombreNI.Text) = '')),
            pnlNoIngresado, 'Debe ingresar el CUIT y el Nombre.');
  Verificar(rbNoIngresadoABM.Checked and not(IsCuit(mskCUITNI.Text)), mskCUITNI, 'Debe ingresar un CUIT válido.');
  Verificar(fraMotivoABM.IsEmpty, fraMotivoABM, 'Debe seleccionar un motivo.');
  Verificar(dcFechaRecABM.IsEmpty, dcFechaRecABM, 'Debe ingresar la fecha de recepción.');
  Verificar(cmbTipoFacABM.FieldValue = '', cmbTipoFacABM, 'Debe seleccionar el tipo de factura.');
  Verificar(Trim(edNroFacABM.Text) = '', edNroFacABM, 'Debe ingresar el número de factura.');
  Verificar(dcFechaFacABM.IsEmpty, dcFechaFacABM, 'Debe ingresar la fecha de la factura.');
  Verificar((edImpFacABM.Value = 0) and (ValorSqlEx('select md_permitecero from SIN.smd_motivodevolfacturas where md_id = :id',
                                        [fraMotivoABM.ID]) = 'N'), edImpFacABM, 'Debe ingresar el importe de la factura.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmDevolucionFacturas.DoABM: Boolean;
var
  sSql :String;
begin
  try
    if (ModoABM = maAlta)  then
    begin
      sSql := 'INSERT INTO SIN.sdf_devolucionfacturas (' +
              'df_tipo, df_idproveedor, df_idprestador, df_idmotivodevol, df_fechadevol, df_idtipofac, ' +
              'df_numerofac, df_fechafac, df_importefac, df_fecharecepfac, df_cuitnoingresado, ' +
              'df_nombrenoingresado, df_mediodevol, df_usualta, df_fechaalta) VALUES (' +
              IIF(rbPrestadorABM.Checked, '''P''', IIF(rbProveedorABM.Checked, '''V''', '''N''')) + ',' +
              SqlInt(fraProveedorABM.Value, True) + ',' + SqlInt(fraPrestadorABM.IDPrestador, True) + ',' +
              SqlInt(fraMotivoABM.ID) + ',' + SqlDate(dcFechaABM.Date) + ',' +
              SqlInt(cmbTipoFacABM.FieldValue) + ',' + SqlValue(edNroFacABM.Text) + ',' +
              SqlDate(dcFechaFacABM.Date) + ',' + SqlNumber(edImpFacABM.Value) + ',' +
              SqlDate(dcFechaRecABM.Date) + ',' + SqlValue(mskCUITNI.Text) + ',' +
              SqlValue(edNombreNI.Text) + ',' +
              IIF(rbDevolCorreoABM.Checked, '''C''', IIF(rbDevolBolsinABM.Checked, '''B''', '''P''')) + ',' +
              SqlValue(Sesion.UserID) + ', ActualDate)';
    end
    else if (ModoABM = maModificacion) then
    begin
      sSql := 'UPDATE SIN.sdf_devolucionfacturas ' +
                 'SET df_tipo = ' + IIF(rbPrestadorABM.Checked, '''P''', IIF(rbProveedorABM.Checked, '''V''', '''N''')) + ',' +
                    ' df_idproveedor = ' +  SqlInt(Integer(IIF(rbProveedorABM.Checked, fraProveedorABM.Value, 0)), True) + ',' +
                    ' df_idprestador = ' + SqlInt(Integer(IIF(rbPrestadorABM.Checked, fraPrestadorABM.IDPrestador, 0)), True) + ',' +
                    ' df_idmotivodevol = ' + SqlInt(fraMotivoABM.ID) + ',' +
                    ' df_fechadevol = ' + SqlDate(dcFechaABM.Date) + ',' +
                    ' df_idtipofac = ' + SqlInt(cmbTipoFacABM.FieldValue) + ',' +
                    ' df_numerofac = ' + SqlValue(edNroFacABM.Text) + ',' +
                    ' df_fechafac = ' + SqlDate(dcFechaFacABM.Date) + ',' +
                    ' df_importefac = ' + SqlNumber(edImpFacABM.Value) + ',' +
                    ' df_fecharecepfac = ' + SqlDate(dcFechaRecABM.Date) + ',' +
                    ' df_cuitnoingresado = ' + IIF(rbNoIngresadoABM.Checked, SqlValue(mskCUITNI.Text), 'Null') + ',' +
                    ' df_nombrenoingresado = ' + IIF(rbNoIngresadoABM.Checked, SqlValue(edNombreNI.Text), 'Null') + ',' +
                    ' df_mediodevol = ' + IIF(rbDevolCorreoABM.Checked, '''C''', IIF(rbDevolBolsinABM.Checked, '''B''', '''P''')) + ',' +
                    ' df_usubaja = Null, ' +
                    ' df_fechabaja = Null, ' +
                    ' df_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' df_fechamodif = ActualDate ' +
              ' WHERE df_id = ' + SqlInt(sdqConsulta.FieldByName('df_id').AsInteger);
    end
    else if (ModoABM = maBaja) then
    begin
      sSql := 'UPDATE SIN.sdf_devolucionfacturas ' +
                 'SET df_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                    ' df_fechabaja = ActualDate ' +
              ' WHERE df_id = ' + SqlInt(sdqConsulta.FieldByName('df_id').AsInteger);
    end;
    EjecutarSql(sSql);
    FRegistrosSeleccionados.Clear;
    Grid.Repaint;
    Result := True;
  except
    on E: Exception do
    begin
       ErrorMsg(E);
       Result := False;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  FRegistrosSeleccionados.Clear;
  
  sSql := 'SELECT NULL checkbox, s.* ' +
           ' FROM art.v_sdf_devolucionfacturas s ' +
          ' WHERE 1 = 1';

  if not dcDesdeDevol.IsEmpty then
    sSql := sSql + ' AND df_fechadevol >= ' + SqlDate(dcDesdeDevol.Date);

  if not dcHastaDevol.IsEmpty then
    sSql := sSql + ' AND df_fechadevol <= ' + SqlDate(dcHastaDevol.Date);

  if fraPrestadorFiltro.IsSelected then
    sSql := sSql + ' AND df_idprestador = ' + SqlInt(fraPrestadorFiltro.Value);

  if fraProveedorFiltro.IsSelected then
    sSql := sSql + ' AND df_idproveedor = ' + SqlInt(fraProveedorFiltro.Value);

  if fraMotivoFiltro.IsSelected then
    sSql := sSql + ' AND df_idmotivodevol = ' + SqlInt(fraMotivoFiltro.ID);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.rbPrestadorABMClick(Sender: TObject);
begin
  DoVisibleFrame(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.DoVisibleFrame(bLimpiar: Boolean);
begin
  if (ModoABM = maAlta) or bLimpiar then
  begin
    fraPrestadorABM.Clear;
    fraProveedorABM.Clear;
    mskCUITNI.Clear;
    edNombreNI.Clear;
  end;
  fraPrestadorABM.Visible := rbPrestadorABM.Checked;
  fraProveedorABM.Visible := rbProveedorABM.Checked;
  lblCuitProv.Visible     := rbProveedorABM.Checked;
  pnlNoIngresado.Visible  := rbNoIngresadoABM.Checked;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  FRegistrosSeleccionados   := TStringList.Create;
  tbEnviarCarta.ImageIndex  := 39;
  tbSalir2.ImageIndex       := 8;
  with fraMotivoABM do
  begin
    TableName   := 'SIN.smd_motivodevolfacturas';
    FieldID     := 'md_id';
    FieldCodigo := 'md_codigo';
    FieldDesc   := 'md_descripcion';
    FieldBaja   := 'md_fechabaja';
    ShowBajas   := False;
    OrderBy     := 'md_codigo';
    IdType      := ctInteger;
  end;
  with fraMotivoFiltro do
  begin
    TableName   := 'SIN.smd_motivodevolfacturas';
    FieldID     := 'md_id';
    FieldCodigo := 'md_codigo';
    FieldDesc   := 'md_descripcion';
    FieldBaja   := 'md_fechabaja';
    ShowBajas   := False;
    OrderBy     := 'md_codigo';
    IdType      := ctInteger;
  end;

  sSql := ' SELECT * FROM ( ' +
                 ' SELECT pv_id ID, pv_numero numero, pv_cuit cuit, ' +
                        ' pv_nombre nombre, NULL fecha_baja ' +
                   ' FROM art.v_opv_proveedor ' +
                  ' UNION ALL ' +
                 ' SELECT vendor_id, segment1, ' +
                        ' REPLACE(global_attribute4, ''-''), vendor_name, NULL ' +
                   ' FROM po_vendors@realfcl ' +
                  ' WHERE enabled_flag = ''Y'' ' +
                    ' AND pay_group_lookup_code LIKE ''Comision%'' ' +
                    ' AND global_attribute10 IN(''80'', ''82'') ' +
          ' ) WHERE 1 = 1';

  with fraProveedorFiltro do
  begin
    FieldId      := 'ID';
    FieldNumero  := 'NUMERO';
    FieldNombre  := 'NOMBRE';
    FieldCUIT    := 'CUIT';
    FieldBaja    := 'FECHA_BAJA';
    Sql          := sSql;
  end;
  with fraProveedorABM do
  begin
    FieldId      := 'ID';  
    FieldNumero  := 'NUMERO';
    FieldNombre  := 'NOMBRE';
    FieldCUIT    := 'CUIT';
    FieldBaja    := 'FECHA_BAJA';
    Sql          := sSql;
  end;

  sdqTipoFactura.Open;
  inherited;
  ShowActived := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.tbLimpiarClick(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  dcDesdeDevol.Clear;
  dcHastaDevol.Clear;
  fraPrestadorFiltro.Clear;
  fraProveedorFiltro.Clear;
  fraMotivoFiltro.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('df_fechabaja').IsNull then
    AFont.Color := clRed;
  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('df_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.tbModificarClick(Sender: TObject);
begin
  if Seguridad.Claves.IsActive('Modificar') and
    (sdqConsulta.FieldByName('df_fechabaja').IsNull or
    (not(sdqConsulta.FieldByName('df_fechabaja').IsNull) and
    MsgAsk('Se dispone a modificar un registro eliminado, al modificarlo lo reactivará.' + #13 +
           '¿Desea continuar?'))) then
    inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.tbEnviarCartaClick(Sender: TObject);
begin
  DoEnviarCarta;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.DoEnviarCarta;
var
  aMetodo: TDataSetNotifyEvent;
  aPointer: TBookMark;
  aResult: TResultados;
  sSql: String;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');

  if MsgAsk('¿Confirma enviar la carta para el/los registro/s seleccionado/s?') then
  begin
    aMetodo                 := sdqConsulta.AfterScroll;
    sdqConsulta.AfterScroll := nil;
    aPointer                := sdqConsulta.GetBookmark;
    with sdqConsulta do
    try
      DisableControls;
      First;
      BeginTrans;
      while not Eof do
      try
        if FRegistrosSeleccionados.IndexOf(FieldByName('df_id').AsString) > -1 then
        begin
          Application.CreateForm(TqrDevolucionFacturas, qrDevolucionFacturas);
          try
            aResult := qrDevolucionFacturas.Preparar(FieldByName('df_id').AsInteger);
          finally
            FreeAndNil(qrDevolucionFacturas);
          end;
          if (rImpresora in aResult) then
          begin
            sSql := 'UPDATE SIN.sdf_devolucionfacturas ' +
                      ' SET df_usuimpre = ' + SqlValue(Sesion.UserID) + ',' +
                          ' df_fechaimpre = ActualDate ' +
                    ' WHERE df_id = ' + SqlInt(FieldByName('df_id').AsInteger);
            EjecutarSqlST(sSql);
          end;
          if (rMail in aResult) then
          begin
            sSql := 'UPDATE SIN.sdf_devolucionfacturas ' +
                      ' SET df_usumail = ' + SqlValue(Sesion.UserID) + ',' +
                          ' df_fechamail = ActualDate ' +
                    ' WHERE df_id = ' + SqlInt(FieldByName('df_id').AsInteger);
            EjecutarSqlST(sSql);
          end;
        end;
        Next;
      except
        on E:Exception do
        begin
          Rollback(True);
          ErrorMsg(E, 'Error al intentar generar la carta.');
          Exit;
        end;
      end;
      CommitTrans;
    finally
      AfterScroll := aMetodo;
      GotoBookmark(APointer);
      EnableControls;
    end;
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmDevolucionFacturas.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not sdqConsulta.IsEmpty;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.GridCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') and
     sdqConsulta.FieldByName('df_fechabaja').IsNull then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('df_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('df_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('df_id').AsString);
    Grid.Repaint;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('df_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.GridContextPopup(Sender: TObject;
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
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.btnMarcarTodos(Sender: TObject);
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
      FRegistrosSeleccionados.Add(FieldByName('df_id').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    Screen.Cursor := crDefault;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDevolucionFacturas.FSFormDestroy(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
end.
