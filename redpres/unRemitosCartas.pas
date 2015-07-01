unit unRemitosCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, FormPanel,
  Menus, Buttons, PatternEdit, IntEdit, unfraVolante, CurrEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, ComboEditor, CheckCombo,
  DBCheckCombo, unfraUsuarios;

type
  TfrmRemitosCartas = class(TfrmCustomConsulta)
    gbFechaAlta: TGroupBox;
    Label8: TLabel;
    dcAltaDesde: TDateComboBox;
    dcAltaHasta: TDateComboBox;
    gbFechaRevision: TGroupBox;
    Label1: TLabel;
    dcRevDesde: TDateComboBox;
    dcRevHasta: TDateComboBox;
    pMnuImprimir: TPopupMenu;
    mnuImprimirGrilla: TMenuItem;
    mnuImprimirRemito: TMenuItem;
    fpDetalle: TFormPanel;
    dbgDetalle: TArtDBGrid;
    btnCerrarDetalle: TBitBtn;
    Bevel5: TBevel;
    btnQuitarCarta: TBitBtn;
    sdqRemito: TSDQuery;
    dsRemito: TDataSource;
    edPorFuera: TIntEdit;
    Label9: TLabel;
    btnGrabarCant: TBitBtn;
    Label2: TLabel;
    edHojas: TIntEdit;
    tbRevision: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbImputar: TToolButton;
    fpImputar: TFormPanel;
    grpFacturas: TGroupBox;
    fraVolantes: TfraVolantes;
    Bevel1: TBevel;
    DGImputar: TArtDBGrid;
    dsImputar: TDataSource;
    sdqImputar: TSDQuery;
    Label3: TLabel;
    btnCerrarImput: TBitBtn;
    edMontoSel: TCurrencyEdit;
    btnImputar: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    fraUsuario: TfraUsuario;
    btnBajaRevision: TBitBtn;
    fpAltaRemito: TFormPanel;
    Bevel2: TBevel;
    dgAltaRemito: TArtDBGrid;
    BitBtn1: TBitBtn;
    dsAltaRemito: TDataSource;
    sdqAltaRemito: TSDQuery;
    tbAgregarCarta: TToolButton;
    btnAgregarCarta: TBitBtn;
    lblAgregar: TLabel;
    cmbCuenta: TArtComboBox;
    dsCuenta: TDataSource;
    sdqCuenta: TSDQuery;
    cmbCuentaImp: TArtComboBox;
    Label4: TLabel;
    Label5: TLabel;
    dcFCargaImpD: TDateComboBox;
    dcFCargaImpH: TDateComboBox;
    Label6: TLabel;
    rbTlg: TRadioButton;
    rbCartas: TRadioButton;
    btnActImp: TSpeedButton;
    gbTlgCarta: TGroupBox;
    rbCartasR: TRadioButton;
    rbTlgR: TRadioButton;
    rbTodosR: TRadioButton;
    GroupBox3: TGroupBox;
    edNroRemito: TIntEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure mnuImprimirRemitoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure btnQuitarCartaClick(Sender: TObject);
    procedure fpDetalleClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarCantClick(Sender: TObject);
    procedure sdqRemitoAfterScroll(DataSet: TDataSet);
    procedure tbSalir2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRevisionClick(Sender: TObject);
    procedure DGImputarCellClick(Column: TColumn);
    procedure fpImputarClose(Sender: TObject; var Action: TCloseAction);
    procedure DGImputarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DGImputarGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImputarClick(Sender: TObject);
    procedure DGImputarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImputarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnBajaRevisionClick(Sender: TObject);
    procedure tbAgregarCartaClick(Sender: TObject);
    procedure btnAgregarCartaClick(Sender: TObject);
    procedure fpAltaRemitoClose(Sender: TObject; var Action: TCloseAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnActImpClick(Sender: TObject);
  private
    bRefrescar :Boolean;
    FRegistrosSeleccionados: TStringList;
    dPendiente :Double;
    procedure OnVolanteChange(Sender: TObject);
    procedure DoLimpiarImput;
    procedure DoBajaCartaRemito(iIdCarta, iIdRemito, iIdCuentaRev :Integer;
                                bPrimerRemito :Boolean);
    function HayRegistroActivo :Boolean;
    function ChequearUltimaCarta :Boolean;
  public
    { Public declarations }
  end;

var
  frmRemitosCartas: TfrmRemitosCartas;

implementation

uses AnsiSql, unRptRemitoCartas, CustomDlgs, unSesion, SqlFuncs, unDmPrincipal,
     Numeros, General, Strfuncs;

const
  sqlImp = ' SELECT null checkbox, rc_id, rc_cantcartas, rc_fechaalta, rc_nrocorreo, ' +
                  ' rc_fecharevision, rc_usurevision, cu_cuenta, NVL(rc_cantfuera, 0) rc_cantfuera, ' +
                  ' amebpba.get_costoremito(rc_id, rc_telegramas) costo, rc_telegramas ' +
            ' FROM crc_remitoscartas, ccu_cuentausuario ' +
           ' WHERE rc_idcuenta = cu_id ' +
             ' AND rc_fecharevision IS NOT NULL ' +
             ' AND rc_fechabaja IS NULL ' +
             ' AND rc_volante IS NULL ';

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT rc_id, rc_cantcartas, rc_fechaalta, rc_nrocorreo, rc_fecharevision, ' +
                ' rc_usurevision, rc_volante, cu_cuenta, NVL(rc_cantfuera, 0) rc_cantfuera, ' +
                ' rc_observaciones, rc_usualta, rc_idcuenta, rc_telegramas, ' +
                ' amebpba.get_cantenrevision(rc_idcuenta) cantrev ' +
           ' FROM crc_remitoscartas, ccu_cuentausuario ' +
          ' WHERE rc_idcuenta = cu_id ' +
            ' AND rc_fechabaja IS NULL ';

  if not(edNroRemito.IsEmpty) then
    sSql := sSql + ' AND rc_id = ' + SqlInt(edNroRemito.Value);

  if not(dcAltaDesde.IsEmpty) then
    sSql := sSql + ' AND rc_fechaalta >= ' + SqlDate(dcAltaDesde.Date);

  if not(dcAltaHasta.IsEmpty) then
    sSql := sSql + ' AND rc_fechaalta <= ' + SqlDate(dcAltaHasta.Date);

  if not(dcRevDesde.IsEmpty) then
    sSql := sSql + ' AND rc_fecharevision >= ' + SqlDate(dcRevDesde.Date);

  if not(dcRevHasta.IsEmpty) then
    sSql := sSql + ' AND rc_fecharevision <= ' + SqlDate(dcRevHasta.Date);

  if not(fraUsuario.IsEmpty) then
    sSql := sSql + ' AND rc_usualta = ' + SqlValue(fraUsuario.edCodigo.Text);

  if (cmbCuenta.Text <> '') then
    sSql := sSql + ' AND cu_cuenta = ' + SqlValue(cmbCuenta.Text);

  if not(rbTodosR.Checked) then
    sSql := sSql + ' AND rc_telegramas = ' + SqlBoolean(rbTlgR.Checked);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
function TfrmRemitosCartas.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.mnuImprimirGrillaClick(Sender: TObject);
begin
  inherited tbImprimirClick(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.mnuImprimirRemitoClick(Sender: TObject);
begin
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un remito.');
  DoImprimirRemito(sdqConsulta.FieldByName('rc_id').AsInteger);
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbModificarClick(Sender: TObject);
begin
  bRefrescar := False;
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un remito.');
  Verificar(sdqConsulta.FieldByName('rc_telegramas').AsString = 'S', Grid,
            'Los remitos de telegramas no se pueden modificar.');  
  sdqRemito.Close;
  sdqRemito.ParamByName('IdRemito').AsInteger := sdqConsulta.FieldByName('rc_id').AsInteger;
  sdqRemito.Open;
  fpDetalle.Caption   := 'Detalle de remito número ' + sdqConsulta.FieldByName('rc_id').AsString;
  edPorFuera.Value    := sdqConsulta.FieldByName('rc_cantfuera').AsInteger;
  edPorFuera.Modified := False;
  fpDetalle.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.GridDblClick(Sender: TObject);
begin
  tbModificarClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.btnQuitarCartaClick(Sender: TObject);
begin
  Verificar(not(sdqRemito.Active) or sdqRemito.IsEmpty, dbgDetalle, 'No hay ninguna carta seleccionada.');
  Verificar(not(sdqConsulta.FieldByName('rc_fecharevision').IsNull), btnQuitarCarta, 'El remito ya ha sido revisado.');
  if MsgAsk('¿Confirma quitar la carta seleccionada del remito?') then
    DoBajaCartaRemito(sdqRemito.FieldByName('ca_id').AsInteger,
                      sdqConsulta.FieldByName('rc_id').AsInteger, 0,
                      sdqRemito.FieldByName('ca_idremitoreimpresion').IsNull);
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.fpDetalleClose(Sender: TObject; var Action: TCloseAction);
begin
  if bRefrescar then sdqConsulta.Refresh;
end;
{-------------------------------------------------------------------------------}
function TfrmRemitosCartas.ChequearUltimaCarta :Boolean;
var
  sSql :String;
begin
  if (sdqRemito.RecordCount > 1) then
    Result := True
  else if MsgAsk('Atención: si elimina la última carta, también ' + #13 +
                 'se dará de baja el remito, ¿Desea continuar?') then
  begin
    sSql := 'UPDATE crc_remitoscartas ' +
              ' SET rc_fechabaja = actualdate, ' +
                  ' rc_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE rc_id = ' + SqlInt(sdqConsulta.FieldByName('rc_id').AsInteger);
    EjecutarSqlST(sSql);
    Result := True;
  end
  else Result := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.btnGrabarCantClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(sdqConsulta.FieldByName('rc_fecharevision').IsNull), btnGrabarCant, 'El remito ya ha sido revisado.');
  try
    BeginTrans(True);
    if edPorFuera.Modified then
    begin
      sSql := 'UPDATE crc_remitoscartas ' +
                ' SET rc_cantfuera = ' + SqlInt(edPorFuera.Value) + ',' +
                    ' rc_cantcartas = rc_cantcartas - ' +
                                      SqlInt(sdqConsulta.FieldByName('rc_cantfuera').AsInteger) + ' + ' +
                                      SqlInt(edPorFuera.Value) + ',' +
                    ' rc_fechamodif = actualdate, ' +
                    ' rc_usumodif = ' + SqlValue(Sesion.UserID) +
              ' WHERE rc_id = ' + SqlInt(sdqConsulta.FieldByName('rc_id').AsInteger);
      EjecutarSqlST(sSql);
      bRefrescar := True;
    end;

    if edHojas.Modified then
    begin
      sSql := 'UPDATE cca_carta ' +
                ' SET ca_canthojas = ' + SqlInt(edHojas.Value) + ',' +
                    ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' ca_fechamodif = actualdate ' +
              ' WHERE ca_id = ' + SqlInt(sdqRemito.FieldByName('ca_id').AsInteger);
      EjecutarSqlST(sSql);
      sdqRemito.Refresh;
    end;
    CommitTrans(True);
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al intentar grabar las cantidades');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.sdqRemitoAfterScroll(DataSet: TDataSet);
begin
  edHojas.Value     := sdqRemito.FieldByName('ca_canthojas').AsInteger;
  edHojas.Modified  := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.FormCreate(Sender: TObject);
begin
  inherited;
  tbSalir2.ImageIndex       := 8;
  tbRevision.ImageIndex     := 38;
  tbImputar.ImageIndex      := 34;
  tbAgregarCarta.ImageIndex := 44;
  fraVolantes.OnChange      := OnVolanteChange;
  FRegistrosSeleccionados   := TStringList.Create;
  sdqCuenta.Open;
  tbRevision.Enabled      := Seguridad.Claves.IsActive('Revision');
  btnBajaRevision.Enabled := Seguridad.Claves.IsActive('Revision');
  tbAgregarCarta.Enabled  := Seguridad.Claves.IsActive('Revision');
  cmbCuenta.DataSource    := dsCuenta;  //EL DATASOURCE ME TIENE RE PODRIDO!!
  cmbCuentaImp.DataSource := dsCuenta;
  fraUsuario.cmbDescripcion.DataSource := fraUsuario.dsDatos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbRevisionClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not HayRegistroActivo, tbRevision, 'Debe seleccionar un remito.');
  Verificar(not sdqConsulta.FieldByName('rc_fecharevision').IsNull, tbRevision,
            'El remito ya se encuentra revisado.');
  if MsgAsk('¿Confirma la revisión del remito seleccionado?') then
  begin
    sSql := 'UPDATE crc_remitoscartas ' +
              ' SET rc_fecharevision = actualdate, ' +
                  ' rc_usurevision = ' + SqlValue(Sesion.UserID) +
            ' WHERE rc_id = ' + SqlInt(sdqConsulta.FieldByName('rc_id').AsInteger);
    EjecutarSql(sSql);
    sdqConsulta.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.OnVolanteChange(Sender: TObject);
begin
  if fraVolantes.Estado <> 'P' then
  begin
    MsgBox('El volante no se encuentra en estado Pendiente', MB_ICONEXCLAMATION);
    DoLimpiarImput;
  end;
  DGImputar.Enabled := (fraVolantes.edNumero.Value > 0);
  if (fraVolantes.edNumero.Value > 0) then
  begin
    dPendiente := ValorSqlExtendedEx('SELECT ((vo_monto - vo_montopercepcion - vo_montodebito ) - vo_facpen) ' +
                                      ' FROM svo_volantes ' +
                                     ' WHERE vo_volante = :Vol', [fraVolantes.edNumero.Value]);
    FRegistrosSeleccionados.Clear;
    DGImputar.Repaint;
  end
  else
    dPendiente := 0;
  edMontoSel.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.DGImputarCellClick(Column: TColumn);
var
  dMontoSel :Double;
begin
  if not(sdqImputar.Eof) and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqImputar.FieldByName('rc_id').AsString) > -1 then
    begin
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqImputar.FieldByName('rc_id').AsString));
      edMontoSel.Value := edMontoSel.Value - sdqImputar.FieldByName('costo').AsFloat;
    end
    else begin
      dMontoSel := edMontoSel.Value + sdqImputar.FieldByName('costo').AsFloat;
      if (dMontoSel > dPendiente) then
        MsgBox('No se puede seleccionar el remito ya que el superaría el monto pendiente del volante.')
      else begin
        edMontoSel.Value := dMontoSel;
        FRegistrosSeleccionados.Add(sdqImputar.FieldByName('rc_id').AsString);
      end;
    end;
    DGImputar.Repaint;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.fpImputarClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqImputar.Close;
  DoLimpiarImput;
  DGImputar.Enabled := False;
  edMontoSel.Clear;
  if bRefrescar and sdqConsulta.Active then
    sdqConsulta.Refresh;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.DGImputarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    DGImputar.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqImputar.FieldByName('rc_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DGImputar.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.DGImputarGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if FRegistrosSeleccionados.IndexOf(sdqImputar.FieldByName('rc_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbImputarClick(Sender: TObject);
begin
  DoLimpiarImput;
  btnActImpClick(Nil);
  fpImputar.ShowModal;
  bRefrescar := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.DGImputarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DGImputarCellClick(DGImputar.ColumnByField['CHECKBOX']);
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.DoLimpiarImput;
begin
  fraVolantes.Limpiar;
  FRegistrosSeleccionados.Clear;
  cmbCuentaImp.Clear;
  dcFCargaImpD.Clear;
  dcFCargaImpH.Clear;
  rbCartas.Checked := True;
  DGImputar.Repaint;
  dPendiente := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.btnImputarClick(Sender: TObject);
var
  aPointer :TBookMark;
  sSql, sMens :String;
begin
  Verificar(fraVolantes.edNumero.Value = 0, fraVolantes, 'Debe seleccionar un volante.');
  Verificar(FRegistrosSeleccionados.Count = 0, DGImputar, 'Debe seleccionar al menos un remito.');
  if MsgAsk('¿Confirma la imputación del/los remito/s al volante seleccionado?') then
  begin
    sSql      := 'art.amebpba.do_imputar_remito(:IdRemito, :IdVolante, :Usuario, :EsTlg);';
    aPointer  := sdqImputar.GetBookmark;
    with sdqImputar do
    try
      DisableControls;
      First;
      BeginTrans;
      while not Eof do
      try
        if FRegistrosSeleccionados.IndexOf(FieldByName('rc_id').AsString) > -1 then
        begin
          EjecutarStoreSTEx(sSql, [FieldByName('rc_id').AsInteger,
                                   fraVolantes.edNumero.Value, Sesion.UserID,
                                   FieldByName('rc_telegramas').AsString]);
          bRefrescar := True;                                   
        end;
        Next;
      except
        on E:Exception do
        begin
          Rollback(True);
          ErrorMsg(E, 'Error al intentar guardar los datos.');
          Exit;
        end;
      end;
      CommitTrans;
      sSql := 'SELECT vo_estado ' +
               ' FROM svo_volantes ' +
              ' WHERE vo_volante = :Vol ';
      if AreIn(ValorSqlEx(sSql, [fraVolantes.edNumero.Value]), ['L', 'LM', 'LG']) then
        sMens := #13 + 'El volante ha sido liquidado en su totalidad.';
      MsgBox('La operación se llevó a cabo de manera exitosa.' + sMens);
    finally
      GotoBookmark(APointer);
      EnableControls;
    end;
    DoLimpiarImput;
    sdqImputar.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edNroRemito.Clear;
  dcAltaDesde.Clear;
  dcAltaHasta.Clear;
  dcRevDesde.Clear;
  dcRevHasta.Clear;
  fraUsuario.Limpiar;
  cmbCuenta.Clear;
  rbTodosR.Checked := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.btnBajaRevisionClick(Sender: TObject);
begin
  Verificar(not(sdqRemito.Active) or sdqRemito.IsEmpty, dbgDetalle, 'No hay ninguna carta seleccionada.');
  Verificar(not(sdqConsulta.FieldByName('rc_fecharevision').IsNull), btnQuitarCarta, 'El remito ya ha sido revisado.');
  if MsgAsk('¿Confirma la baja por revisión de la carta seleccionada?') then
    DoBajaCartaRemito(sdqRemito.FieldByName('ca_id').AsInteger,
                      sdqConsulta.FieldByName('rc_id').AsInteger,
                      sdqConsulta.FieldByName('rc_idcuenta').AsInteger,
                      sdqRemito.FieldByName('ca_idremitoreimpresion').IsNull);
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.tbAgregarCartaClick(Sender: TObject);
begin
  bRefrescar := False;
  Verificar(not HayRegistroActivo, Grid, 'Debe seleccionar un remito.');
  Verificar(not(sdqConsulta.FieldByName('rc_fecharevision').IsNull), btnQuitarCarta, 'El remito ya ha sido revisado.');
  Verificar(sdqConsulta.FieldByName('rc_telegramas').AsString = 'S', btnQuitarCarta, 'Los remitos de telegramas no se pueden modificar.');
  sdqAltaRemito.Close;
  sdqAltaRemito.ParamByName('pIdCuenta').AsInteger := sdqConsulta.FieldByName('rc_idcuenta').AsInteger;
  sdqAltaRemito.Open;
  Verificar(sdqAltaRemito.IsEmpty, Grid, 'La cuenta del remito seleccionado no tiene cartas en revisión.');
  lblAgregar.Caption := 'Agregar cartas al remito número ' + sdqConsulta.FieldByName('rc_id').AsString;
  fpAltaRemito.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.btnAgregarCartaClick(Sender: TObject);
var
  sSql, sCampo :String;
begin
  Verificar(not(sdqAltaRemito.Active) or sdqAltaRemito.IsEmpty, dgAltaRemito, 'No hay ninguna carta seleccionada.');
  if MsgAsk('¿Confirma agregar la carta seleccionada al remito actual?') then
  try
    BeginTrans;
    sCampo := IIF(sdqAltaRemito.FieldByName('ca_idremito').IsNull,
                  'ca_idremito', 'ca_idremitoreimpresion');
    sSql := 'UPDATE cca_carta ' +
              ' SET ' + sCampo + ' = ' + SqlInt(sdqConsulta.FieldByName('rc_id').AsInteger) + ',' +
                  ' ca_idcuentarevision = Null, ' +
                  ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' ca_fechamodif = ActualDate ' +
            ' WHERE ca_id = ' + SqlInt(sdqAltaRemito.FieldByName('ca_id').AsInteger);
    EjecutarSqlST(sSql);
    sSql := 'UPDATE crc_remitoscartas ' +
              ' SET rc_cantcartas = rc_cantcartas + 1, ' +
                  ' rc_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' rc_fechamodif = ActualDate ' +
            ' WHERE rc_id = ' + SqlInt(sdqConsulta.FieldByName('rc_id').AsInteger);
    EjecutarSqlST(sSql);
    bRefrescar := True;
    CommitTrans;
    sdqAltaRemito.Refresh;
  except
    on E:Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar quitar la carta');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.fpAltaRemitoClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqAltaRemito.Close;
  if bRefrescar then sdqConsulta.Refresh;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  sdqCuenta.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.btnActImpClick(Sender: TObject);
begin
  sdqImputar.Close;
  sdqImputar.SQL.Text := sqlImp + IIF(cmbCuentaImp.Text <> '',  ' AND cu_cuenta = ' + SqlValue(cmbCuentaImp.Text), '') +
                                  IIF(not(dcFCargaImpD.IsEmpty), ' AND rc_fechaalta >= ' + SqlDate(dcFCargaImpD.Date), '') +
                                  IIF(not(dcFCargaImpH.IsEmpty), ' AND rc_fechaalta <= ' + SqlDate(dcFCargaImpH.Date), '') +
                                  ' AND rc_telegramas = ' + SqlBoolean(rbTlg.Checked);
  sdqImputar.Open;
end;
{-------------------------------------------------------------------------------}
procedure TfrmRemitosCartas.DoBajaCartaRemito(iIdCarta, iIdRemito, iIdCuentaRev :Integer;
                                              bPrimerRemito :Boolean);
var
  sSql, sCampo :String;
begin
  try
    BeginTrans;
    if ChequearUltimaCarta then
    begin
      sCampo := IIF(bPrimerRemito, 'ca_idremito', 'ca_idremitoreimpresion');
      sSql := 'UPDATE cca_carta ' +
                ' SET ' + sCampo + ' = Null,';
      if (iIdCuentaRev > 0) then
        sSql := sSql + ' ca_idcuentarevision = ' + SqlInt(iIdCuentaRev) + ','
      else
        sSql := sSql + ' ca_incluirenremito = ''S'', ';
      sSql := sSql + ' ca_usumodif = :usuario, ' +
                     ' ca_fechamodif = actualdate ' +
               ' WHERE ca_id = :idcarta ';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, iIdCarta]);
      sSql := 'UPDATE crc_remitoscartas ' +
                ' SET rc_cantcartas = rc_cantcartas - 1, ' +
                    ' rc_usumodif = :usuario, ' +
                    ' rc_fechamodif = ActualDate ' +
              ' WHERE rc_id = :idremito';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, iIdRemito]);
      bRefrescar := True;
      sdqRemito.Refresh;
      CommitTrans;
    end
    else Rollback;
  except
    on E:Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar quitar la carta');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
end.
