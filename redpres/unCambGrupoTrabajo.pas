unit unCambGrupoTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ExtCtrls, ToolWin, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, StdCtrls, Buttons, SinEdit, ShortCutControl, artSeguridad, Placemnt, Db, SDEngine,
  SortDlg, Mask, ToolEdit, uncambiodelegacion;

type
  TfrmCambGrupoTrabajo = class(TForm)
    pnlFiltros: TPanel;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbDatosSini: TToolButton;
    lbSiniestro: TLabel;
    SinEdit: TSinEdit;
    bvSeparador: TBevel;
    ToolButton3: TToolButton;
    tbSalir: TToolButton;
    ToolButton5: TToolButton;
    bntBuscSiniestro: TSpeedButton;
    chkSinCIE10: TCheckBox;
    DBGrid: TArtDBGrid;
    ShortCutControl: TShortCutControl;
    FormPlacement: TFormPlacement;
    Seguridad: TSeguridad;
    SortDialog: TSortDialog;
    tbOrdenar: TToolButton;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ToolButton1: TToolButton;
    tbLimpiar: TToolButton;
    sdqDatosEX_SINIESTRO: TFloatField;
    sdqDatosEX_ORDEN: TFloatField;
    sdqDatosEX_RECAIDA: TFloatField;
    sdqDatosSINIESTRO: TStringField;
    sdqDatosEX_CUIT: TStringField;
    sdqDatosEM_NOMBRE: TStringField;
    sdqDatosEX_CUIL: TStringField;
    sdqDatosTJ_NOMBRE: TStringField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosEX_FECHARECAIDA: TDateTimeField;
    sdqDatosESTADO: TStringField;
    sdqDatosEX_DIAGNOSTICO: TStringField;
    sdqDatosEX_DIAGNOSTICOOMS: TStringField;
    sdqDatosEX_GTRABAJO: TStringField;
    sdqDatosGP_NOMBRE: TStringField;
    sdqDatosGP_FBAJA: TDateTimeField;
    Bevel1: TBevel;
    sdqGTrabajo: TSDQuery;
    dsGTrabajo: TDataSource;
    cmbGTrabajo: TArtComboBox;
    sdqDatosERRORCARGA: TStringField;
    sdqDatosEX_ESTADO: TStringField;
    sdqDatosCAUSAFIN: TStringField;
    sdqDatosDIAS: TFloatField;
    cmbGestor: TArtComboBox;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
    sdqDatosUSUGESTOR: TStringField;
    tbGuardar: TToolButton;
    sdqDatosEX_ID: TFloatField;
    sdqDatosex_delegacion: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure bntBuscSiniestroClick(Sender: TObject);
    procedure DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                  var Background: TColor; Highlight: Boolean);
    procedure tbSalirClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbDatosSiniClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                   Column: TColumn; State: TGridDrawState);
    procedure DBGridTopLeftChanged(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmbGestorDropDown(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure cmbGTrabajoCloseUp(Sender: TObject);
    procedure cmbGestorCloseUp(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure chkSinCIE10Click(Sender: TObject);
  private
    procedure GuardarDatos;
    function Validar_GrupoYGestor:boolean;
    function GrupoGestionado(CodGrTrabajo:string):boolean;
  public
  end;

var
  frmCambGrupoTrabajo: TfrmCambGrupoTrabajo;
  lGuardado: char;
  bUsuarioTerce: Boolean;

implementation

uses
  unPrincipal, unBusqSini, unDmPrincipal, General, unDatosSiniestro, CustomDlgs,
  AnsiSql, unSesion, unTercerizadoras;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuCambGrupoTrabajo.Enabled := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.tbRefrescarClick(Sender: TObject);
var
  ErrorDeCarga, Sql: String;
begin
  Verificar(SinEdit.IsEmpty and not(chkSinCIE10.Checked), SinEdit,
            'Debe seleccionar como mínimo un filtro para poder listar los resultados.');

   Sql := 'SELECT ex_id, ex_siniestro, ex_orden, ex_recaida, ex_estado, nvl(ex_causafin, '''') errorcarga,' +
                ' utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida, ''-'') siniestro,' +
                ' cater.tb_descripcion causafin, ex_cuit, em_nombre, ex_cuil, tj_nombre, ' +
                ' ex_fechaaccidente, ex_fecharecaida, upper(siest.tb_descripcion) estado, ' +
                ' ex_diagnostico, ex_diagnosticooms, ex_gtrabajo, ex_delegacion, gp_nombre, gp_fbaja, ' ;

   if chkSinCIE10.Checked then
      Sql := Sql + ' nvl(art.sin.get_cantdiascaidos(ex_siniestro, ex_orden, ex_recaida), '
   else
      Sql := Sql + ' nvl(art.sin.get_cantdiascaidos(' + SinEdit.SiniestroS + ',' + SinEdit.ordenS + ',' + SinEdit.RecaidaS + '), ' ;

   Sql := Sql + ' actualdate - nvl(ex_bajamedica, nvl(ex_fecharecaida, ex_fechaaccidente))) as dias, ' +
                ' ex_gestor usugestor ' +
           ' FROM sex_expedientes, aem_empresa, ctj_trabajador, mgp_gtrabajo, ' +
                ' ctb_tablas cater, ctb_tablas siest ' +
          ' WHERE ex_cuit = em_cuit' +
            ' AND ex_idtrabajador = tj_id ' +
            ' AND cater.tb_clave(+) = ''CATER''' +
            ' AND cater.tb_codigo(+) = ex_causafin' +
            ' AND siest.tb_clave(+) = ''SIEST''' +
            ' AND siest.tb_codigo(+) = ex_estado' +
            ' AND ex_gtrabajo = gp_codigo(+)';  // le saqué la cond. EX_ESTADO <> '03', ahora sale solo por error de carga. ver abajo. by Lu. 14/06/2001

   if SinEdit.Siniestro > 0 then
     Sql := Sql + ' AND ex_siniestro = ' + SinEdit.SiniestroSql +
                  ' AND ex_orden = ' + SinEdit.OrdenSql +
                  ' AND ex_recaida = ' + SinEdit.RecaidaSql;

   if chkSinCIE10.Checked then
     Sql := Sql + ' AND gp_tipo = ''O''';

   if bUsuarioTerce then
     Sql := Sql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

   Sql := Sql + SortDialog.OrderBy;

   try
     OpenQuery(sdqDatos, Sql, true);
     DBGrid.col := 1;
     DBGrid.SetFocus;
     ErrorDeCarga := sdqDatosERRORCARGA.Text;
     cmbGTrabajo.Clear;
     cmbGTrabajo.FieldValue := sdqDatosEX_GTRABAJO.AsString;
     cmbGestor.Text         := sdqDatosUSUGESTOR.AsString;

     if AreIn(ErrorDeCarga, ['99', '95']) then
     begin  // by Lu. 14/06/2001
       MsgBox('No se puede cambiar el Grupo de Trabajo, el Siniestro seleccionado está cerrado por Error de carga', MB_ICONWARNING);
       sdqDatos.Close;
     end;
   except
     on E: Exception do
       ErrorMsg(E);
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.bntBuscSiniestroClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    if dlgBusqSini.ShowModal = mrOk then
      SinEdit.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
  finally
    dlgBusqSini.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.DBGridGetCellParams(Sender: TObject; Field: TField;
                                                   AFont: TFont; var Background: TColor;
                                                   Highlight: Boolean);
begin
  if (Field.FieldName = 'GP_NOMBRE') then
    if not sdqDatosGP_FBAJA.IsNull then
      AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.tbSalirClick(Sender: TObject);
begin
  if (lGuardado = 'N') and
     MsgAsk('Se detectaron modificaciones. ¿Desea guardar los cambios realizados?') then
  begin
    if Validar_GrupoYGestor then
    begin
      GuardarDatos;
      Close;
    end;
  end
  else Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.tbLimpiarClick(Sender: TObject);
begin
  SinEdit.Clear;
  chkSinCIE10.Checked := False;
  SinEdit.SetFocus;
  sdqDatos.Close;
  cmbGTrabajo.Text        := '';
  cmbGTrabajo.FieldValue  := '';
  cmbGestor.Text          := '';
  cmbGestor.FieldValue    := '';
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.tbDatosSiniClick(Sender: TObject);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then
    with TfrmDatosSiniestro.Create(Self) do
    try
      ShowDialog(Self.sdqDatosEX_SINIESTRO.AsInteger,
                 Self.sdqDatosEX_ORDEN.AsInteger,
                 Self.sdqDatosEX_RECAIDA.AsInteger);
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  lGuardado     := 'S';
  bUsuarioTerce := EsUsuarioDeTercerizadora;

  sSql := 'SELECT gp_codigo, gp_nombre ' +
           ' FROM mgp_gtrabajo ' +
          ' WHERE gp_fbaja IS NULL' +
            ' AND gp_siniestros = ''S''';

  if bUsuarioTerce then
    sSql := sSql + ' AND gp_idtercerizadora = ' + SqlInt(GetIdTercerizadora);

  if Seguridad.Claves.IsActive('Restringe_Combo') or bUsuarioTerce then
    sdqGTrabajo.Sql.Text := sSql + ' ORDER BY gp_nombre'
  else begin
    sdqGTrabajo.ParamByName('pusu').Value := Sesion.UserID;
    sdqGTrabajo.Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  if not seguridad.Claves.IsActive('Restringe_Combo') and
     not bUsuarioTerce then
    sdqGTrabajo.ParamByName('pdias').Value := sdqDatos.FieldByName('dias').AsString;

  if sdqGTrabajo.Active then sdqGTrabajo.Close;
  sdqGTrabajo.Open;
  cmbGTrabajo.FieldValue := sdqDatosEX_GTRABAJO.AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                    Column: TColumn; State: TGridDrawState);
begin
  if (gdFocused in State) and Column.Showing and (Column.Field.FullName = 'GP_NOMBRE') then
  begin
    SetWindowPos(cmbGTrabajo.Handle, 0, Rect.Left + DBGrid.Left + 1, Rect.Top + DBGrid.Top + 1,
                 Rect.Right - Rect.Left + 2, Rect.Bottom - Rect.Top + 2, SWP_NOZORDER or SWP_SHOWWINDOW);
    cmbGTrabajo.Text    := DBGrid.SelectedField.Text;
    cmbGTrabajo.Visible := True;
  end;

  if (gdFocused in State) and Column.Showing and (Column.Field.FullName = 'USUGESTOR') then
  begin
    SetWindowPos(cmbGestor.Handle, 0, Rect.Left + DBGrid.Left + 1, Rect.Top + DBGrid.Top + 1,
                 Rect.Right - Rect.Left + 2, Rect.Bottom - Rect.Top + 2, SWP_NOZORDER or SWP_SHOWWINDOW);
    cmbGestor.Text    := DBGrid.SelectedField.Text;
    cmbGestor.Visible := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.DBGridTopLeftChanged(Sender: TObject);
begin
  cmbGTrabajo.Visible := False;
  cmbGestor.Visible   := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_DOWN) and cmbGTrabajo.Visible then
  begin
    Key := 0;
    cmbGTrabajo.DoDropDown;
  end;

  if (Shift = [ssAlt]) and (Key = VK_DOWN) and cmbGestor.Visible then
  begin
    Key := 0;
    cmbGestor.DoDropDown;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.cmbGestorDropDown(Sender: TObject);
var
  sSql, sGrupoTrab: string;
begin
  sGrupoTrab := NVL(cmbGTrabajo.FieldValue, sdqDatosEX_GTRABAJO.AsString);
  sdqGestor.Close;
  sSql := ' SELECT ug_id id, ug_usuario descripcion ' +
            ' FROM mug_usuariogrupotrabajo, ctb_tablas ' +
           ' WHERE ug_fechabaja IS NULL ' +
             ' AND ug_tipousuario = tb_codigo ' +
             ' AND tb_clave = ''TUSU'' ' +
             ' AND tb_especial1 = ''S'' ' +
             ' AND ug_grupo = ' + SqlValue(sGrupoTrab);
  if Seguridad.Claves.IsActive('NoRestringe_Gestor') then
    sSql := sSql + ' AND ug_grupo = ' + SqlValue(sGrupoTrab)
  else
    sSql := sSql + ' AND ug_usuario IN (' + SqlValue(Sesion.UserID) + ',' + SqlValue(cmbGestor.Text) + ') ';
  sdqGestor.SQL.Text := sSql;
  sdqGestor.Open;
end;
{-------------------------------------------------------------------------------}
// Lu 11/04/2008
procedure TfrmCambGrupoTrabajo.tbGuardarClick(Sender: TObject);
begin
  if Validar_GrupoYGestor then GuardarDatos;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.GuardarDatos;
var
  sSql: String;
begin
  // Se guardan el Grupo de Trabajo y el Gestor.
  BeginTrans(true);
  try
    // Tabla historica de Grupo de Trabajo
    sSql := 'INSERT INTO shg_historiagrupotrabajo ' +
           ' (hg_siniestro, hg_orden, hg_recaida, hg_gtrabajo, hg_usualta, hg_fechalta, hg_gestor) VALUES (' +
             SINEDIT.SiniestroSql + ',' + SINEDIT.OrdenSql + ',' +
             SINEDIT.RecaidaSql + ',' + SqlValue(sdqDatosEX_GTRABAJO.AsString) + ',' +
             SqlValue(Sesion.UserID) + ', actualdate, ' +
             IIF(sdqDatosUSUGESTOR.IsNull, 'null', SqlValue(sdqDatosUSUGESTOR.AsString)) + ')';
    EjecutarSqlST(sSql);
    // Tabla de Siniestros, se guarda el Grupo de trabajo y Gestor si hubiese.
    sSql := 'UPDATE sex_expedientes ' +
              ' SET ex_gtrabajo = '  + SqlValue(cmbGTrabajo.FieldValue) + ',' +
                  ' ex_mtrabajo = ''S'', '  +
                  ' ex_gestor = ' + SqlString(cmbGestor.Text, True, True) + ', ' +
                  ' ex_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                  ' ex_fechamodif = ACTUALDATE ' +
            ' WHERE ex_id = ' + SqlInt(sdqDatosEX_ID.AsInteger);
    EjecutarSqlST(sSql);
    CommitTrans(true);
    OpenQuery(sdqDatos, '', False, True);
    cmbGTrabajo.Visible := False;
    cmbGestor.Visible   := False;
    DBGrid.Refresh;

    MsgBox('Los datos se guardaron satisfactoriamente');
    lGuardado := 'S';
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.cmbGTrabajoCloseUp(Sender: TObject);
begin
  if cmbGTrabajo.FieldValue <> sdqDatosEX_GTRABAJO.Value then
  begin
     lGuardado  := 'N';
     cmbGestor.Text := '';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.cmbGestorCloseUp(Sender: TObject);
begin
  if cmbGestor.Text <> sdqDatosUSUGESTOR.Value then
     lGuardado := 'N';
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.DBGridCellClick(Column: TColumn);
begin
  if column.FieldName = 'USUGESTOR' then
    cmbGestor.Visible := True;
end;
{-------------------------------------------------------------------------------}
function TfrmCambGrupoTrabajo.Validar_GrupoYGestor: boolean;
var
  Sql: String; frmCambioDelegacion: TfrmCambioDelegacion;
begin
  Result := True;

  if cmbGTrabajo.FieldValue = '' then
  begin
    Result := False;
    msgBox ('Se debe completar el Grupo de Trabajo para guardar los cambios');
  end else if (cmbGTrabajo.FieldValue = '26') and (sdqDatos.FieldByName('ex_delegacion').AsString = '840') then
  begin
    Result := False;
    frmCambioDelegacion := tfrmcambiodelegacion.Create(self);
    frmCambioDelegacion.edSiniestro.SetValues(sinedit.Siniestro, sinedit.Orden, sinedit.Recaida);
    frmCambioDelegacion.fraEX_DELEGACION.Codigo := sdqDatos.FieldByName('ex_delegacion').AsString;
    if frmCambioDelegacion.ShowModal = mrOK then
      Result := true;

  end else if (cmbGestor.Text <> '') and (sdqDatosUSUGESTOR.AsString <> '') then
  begin
    Sql    := ' SELECT 1 ' +
                ' FROM mug_usuariogrupotrabajo ' +
               ' WHERE ug_grupo = ' + SqlInt(cmbGTrabajo.FieldValue) +
                 ' AND ug_usuario = ' + SqlValue(cmbGestor.Text);
    if not(ExisteSql(Sql)) then
    begin
      Result := False;
      msgBox ('No se pueden guardar los cambios: El Usuario Gestor no pertenece al grupo seleccionado');
    end;
  end else if (cmbGestor.Text = '') and GrupoGestionado(cmbGTrabajo.FieldValue) then
  begin
    Result := False;
    MsgBox('Se debe completar el Gestor debido a que el Grupo se encuentra Gestionado');
  end;

end;
{-------------------------------------------------------------------------------}
function TfrmCambGrupoTrabajo.GrupoGestionado(CodGrTrabajo: string): boolean;
var
  sSql: string;
begin
  sSql := ' SELECT gp_gestionado ' +
            ' FROM mgp_gtrabajo ' +
           ' WHERE gp_codigo = :Grupo  ';
  Result := (ValorSqlEx(sSql, [CodGrTrabajo]) = 'S');
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambGrupoTrabajo.chkSinCIE10Click(Sender: TObject);
begin
  if chkSinCIE10.Checked then SinEdit.Clear;
end;
{-------------------------------------------------------------------------------}
end.
