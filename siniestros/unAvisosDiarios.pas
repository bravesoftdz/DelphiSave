unit unAvisosDiarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  unArtFrame, unfraUsuarios, unFraTrabajador, unFraTrabajadorSiniestro,
  unArtDbFrame, unFraEmpresa, Vcl.Mask, RxToolEdit, DateComboBox, Menus, unDmPrincipal,
  unArtDBAwareFrame, unFraCodigoDescripcion, AnsiSql, unSiniestros, VCLExtra, unSesion, CustomDlgs, unSinForm;

type
  TfrmAvisosDiarios = class(TfrmCustomConsulta)
    fraDestinatario: TfraUsuario;
    Label8: TLabel;
    fraAviso: TfraCodigoDescripcion;
    Label1: TLabel;
    gbFechaSiniestro: TGroupBox;
    Label2: TLabel;
    dcFAvisoDesde: TDateComboBox;
    dcFAvisoHasta: TDateComboBox;
    gbVerVistos: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Label3: TLabel;
    Label4: TLabel;
    rbVistos_Si: TRadioButton;
    rbVistos_No: TRadioButton;
    rbVistos_Todos: TRadioButton;
    gbVerBajas: TGroupBox;
    rbBajas_Si: TRadioButton;
    rbBajas_No: TRadioButton;
    rbBajas_Todos: TRadioButton;
    fraTrabajadorSIN: TfraTrabajadorSiniestro;
    tbVisto: TToolButton;
    tbNoVisto: TToolButton;
    ToolButton7: TToolButton;
    tbSalir2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbVistoClick(Sender: TObject);
    procedure tbNoVistoClick(Sender: TObject);
    procedure fraDestinatarioedCodigoChange(Sender: TObject);
  private
    { Private declarations }
    dHoy: TDateTime;
    FRegistrosSeleccionados: TStringList;
    procedure OnTrabajadorChange(Sender: TObject);
    procedure OnEmpresaChange(Sender: TObject);
    function HayRegistroActivo :Boolean;
    procedure Do_ColocarMarcaVisto(sMarca:string);
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmAvisosDiarios: TfrmAvisosDiarios;

implementation

{$R *.dfm}



procedure TfrmAvisosDiarios.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;

procedure TfrmAvisosDiarios.btnMarcarTodos(Sender: TObject);
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
      FRegistrosSeleccionados.Add(FieldByName('ai_id').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmAvisosDiarios.FormCreate(Sender: TObject);
begin
  inherited;
  dHoy := DBDateTime;
  FRegistrosSeleccionados := TStringList.Create;

  fraTrabajadorSIN.OnChange     := OnTrabajadorChange;
  fraEmpresa.OnChange           := OnEmpresaChange;
  fraDestinatario.Sector        := 'INCAP';
  fraDestinatario.UsuariosGenericos   := False;
  fraDestinatario.edCodigo.Text       := Sesion.UserID;
  fraDestinatario.cmbDescripcion.Text := Sesion.Usuario;

  with fraAviso do
  begin
    Sql := ' SELECT ad_codigo CODIGO, ad_descripcion DESCRIPCION, ad_id ID, ad_fechabaja ' +
             ' FROM SIN.sui_usuarioavisoinca, SIN.SAD_AVISOSDIARIOS ' +
            ' WHERE ui_idaviso = ad_id ' +
              ' AND ui_usuario = ' + SqlValue(Sesion.UserID);

  //  TableName   := 'SIN.SAD_AVISOSDIARIOS';

    FieldID     := 'AD_ID';
    FieldCodigo := 'AD_CODIGO';
    FieldDesc   := 'AD_DESCRIPCION';
    FieldBaja   := 'AD_FECHABAJA';
    ShowBajas   := False;

    OrderBy     := 'AD_DESCRIPCION';
  end;

  LockControls(fraDestinatario, not Seguridad.Claves.IsActive('Cambiar_Destinatario'));
  dcFAvisoDesde.Date  := dHoy;
  dcFAvisoHasta.Date  := dHoy;
  rbVistos_No.Checked := True;
  rbBajas_No.Checked  := True;

end;

procedure TfrmAvisosDiarios.fraDestinatarioedCodigoChange(Sender: TObject);
begin
  inherited;
  fraAviso.Sql := ' SELECT ad_codigo CODIGO, ad_descripcion DESCRIPCION, ad_id ID, ad_fechabaja ' +
                    ' FROM SIN.sui_usuarioavisoinca, SIN.SAD_AVISOSDIARIOS ' +
                   ' WHERE ui_idaviso = ad_id ' +
                     ' AND ui_usuario = ' + SqlValue(fraDestinatario.edCodigo.Text);
end;

procedure TfrmAvisosDiarios.FSFormDestroy(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  inherited;
end;

procedure TfrmAvisosDiarios.GridCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ai_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ai_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('ai_id').AsString);
    Grid.Repaint;
  end;
end;

procedure TfrmAvisosDiarios.GridContextPopup(Sender: TObject; MousePos: TPoint;var Handled: Boolean);
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

procedure TfrmAvisosDiarios.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Check: Integer;
    R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ai_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmAvisosDiarios.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('FBAJA').IsNull then
    AFont.Color :=  clRed;
  if (sdqConsulta.FieldByName('VISTO').AsString = 'N') then
    AFont.Style := AFont.Style + [fsBold];

  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('ai_id').AsString) > -1 then
    BackGround := TColor($00BBDDFF);
end;

procedure TfrmAvisosDiarios.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;

function TfrmAvisosDiarios.HayRegistroActivo: Boolean;
begin
  Result := sdqConsulta.Active and not sdqConsulta.IsEmpty;
end;

procedure TfrmAvisosDiarios.OnEmpresaChange(Sender: TObject);
begin
  fraTrabajadorSIN.CUIL := fraEmpresa.CUIT;
end;

procedure TfrmAvisosDiarios.OnTrabajadorChange(Sender: TObject);
begin
  fraEmpresa.Value := fraTrabajadorSIN.IdEmpresa;
end;

procedure TfrmAvisosDiarios.RefreshData;
var sSql: String;
begin
  Verificar(fraAviso.IsEmpty, fraAviso, 'Debe ingresar el Aviso.');

  FRegistrosSeleccionados.Clear;
  sSql := ' SELECT null checkbox, ai_id, ai_visto visto, ai_fechaalta faviso, ai_usuario destinatario, ' +
                 ' art.utiles.armar_siniestro (ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                 ' ev_fecha fevento, ev_codigo codevento, cm_descripcion comision, ' +
                 ' art.utiles.armar_cuit (tj_cuil) cuil, tj_nombre trabajador, tj_localidad localidadtrab, ' +
                 ' art.utiles.armar_cuit (em_cuit) cuit, em_nombre empresa, ex_altamedica faltamedica, ' +
                 ' ai_fechabaja fbaja ' +
            ' FROM SIN.sai_avisosinca, art.sex_expedientes, ctj_trabajador, aem_empresa, art.sev_eventosdetramite, ' +
                 ' SIN.spe_partedeegreso, SIN.scm_comisionmedica ' +
           ' WHERE ai_idaviso = ' + SqlInt(fraAviso.ID) +
             ' AND ai_usuario = ' + SqlValue(fraDestinatario.edCodigo.Text) +
             ' AND ai_idexpediente = ex_id ' +
             ' AND ex_idtrabajador = tj_id ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND ai_ideventoinca = ev_idevento(+) ' +
             ' AND ex_id = pe_idexpediente(+) ' +
             ' AND ev_comision = cm_codigo(+) ';

  if rbVistos_Si.Checked then
    sSql := sSql + ' AND ai_visto = ''S'' '
  else if rbVistos_No.Checked then
    sSql := sSql + ' AND ai_visto = ''N'' ';

  if rbBajas_Si.Checked then
    sSql := sSql + ' AND ai_fechabaja is not null '
  else if rbBajas_No.Checked then
    sSql := sSql + ' AND ai_fechabaja is null ';

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if (fraTrabajadorSIN.CUIL <> '') then
    sSql := sSql + ' AND ex_cuil = ' + SqlValue(fraTrabajadorSIN.CUIL);

  if (fraTrabajadorSIN.edSiniestro.Siniestro > 0) then
    sSql := sSql + ' AND ai_idexpediente = ' + SqlInt(Get_IdExpediente(fraTrabajadorSIN.edSiniestro.Siniestro,
                                                                       fraTrabajadorSIN.edSiniestro.Orden,
                                                                       fraTrabajadorSIN.edSiniestro.Recaida));

  if (dcFAvisoDesde.Date > 0) and (dcFAvisoHasta.Date > 0) then
    sSql := sSql + ' AND TRUNC(ai_fechaalta) between ' + SqlDate(dcFAvisoDesde.Date) + ' and ' + SqlDate(dcFAvisoHasta.Date);


  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;


end;

procedure TfrmAvisosDiarios.tbEliminarClick(Sender: TObject);
var aLista :TStringList;
    aMetodo :TDataSetNotifyEvent;
    aPointer :TBookMark;
    sSql: string;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');
  if MsgBox('¿Confirma que desea eliminar el/los registros seleccionados?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    aLista                  := TStringList.Create;
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
        if (FRegistrosSeleccionados.IndexOf(FieldByName('ai_id').AsString) > -1) then
        begin
          sSql := 'UPDATE SIN.sai_avisosinca ' +
                    ' SET ai_fechabaja = art.actualdate, ' +
                        ' ai_usubaja = :usu ' +
                  ' WHERE ai_id = :id ';
          EjecutarSqlSTEx(sSql, [Sesion.UserID, FieldByName('ai_id').AsInteger]);
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
      MsgBox('La operación se llevó a cabo de manera exitosa.');
    finally
      aLista.Free;
      AfterScroll := aMetodo;
      GotoBookmark(APointer);
      EnableControls;
    end;
    tbRefrescarClick(Nil);

  end;
end;

procedure TfrmAvisosDiarios.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Title.Text := fraAviso.cmbDescripcion.Text;
  inherited;
end;

procedure TfrmAvisosDiarios.tbLimpiarClick(Sender: TObject);
begin
  fraDestinatario.Clear;
  fraAviso.Clear;
  fraEmpresa.Clear;
  fraTrabajadorSIN.Clear;
  rbVistos_No.Checked := true;
  rbBajas_No.Checked  := true;
  dcFAvisoDesde.Clear;
  dcFAvisoHasta.Clear;
  FRegistrosSeleccionados.Clear;
  inherited;
end;

procedure TfrmAvisosDiarios.tbSalir2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvisosDiarios.tbVistoClick(Sender: TObject);
begin
  Do_ColocarMarcaVisto('S');
end;

procedure TfrmAvisosDiarios.tbNoVistoClick(Sender: TObject);
begin
  Do_ColocarMarcaVisto('N');
end;

procedure TfrmAvisosDiarios.Do_ColocarMarcaVisto(sMarca: string);
var aLista :TStringList;
    aMetodo :TDataSetNotifyEvent;
    aPointer :TBookMark;
    sSql, sLeyenda: string;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');

  if (sMarca = 'S') then
    sLeyenda := 'Visto'
  else
    sLeyenda := 'No Visto';

  if MsgBox('¿Confirma que desea colocar la marca de ' + sLeyenda + ' a el/los registros seleccionados?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    aLista                  := TStringList.Create;
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
        if (FRegistrosSeleccionados.IndexOf(FieldByName('ai_id').AsString) > -1) then
        begin
          sSql := 'UPDATE SIN.sai_avisosinca ' +
                    ' SET ai_visto = ' + SqlValue(sMarca) + ', ' +
                        ' ai_fechamodif = art.actualdate, ' +
                        ' ai_usumodif = :usu ' +
                  ' WHERE ai_id = :id ';
          EjecutarSqlSTEx(sSql, [Sesion.UserID, FieldByName('ai_id').AsInteger]);
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
      MsgBox('La operación se llevó a cabo de manera exitosa.');
    finally
      aLista.Free;
      AfterScroll := aMetodo;
      GotoBookmark(APointer);
      EnableControls;
    end;
    tbRefrescarClick(Nil);
  end;
end;


end.
