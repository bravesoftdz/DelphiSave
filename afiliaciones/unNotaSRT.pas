unit unNotaSRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Mask, ToolEdit, DateComboBox, StdCtrls, IntEdit,
  unFraCodigoDescripcion, unfraCtbTablas, FormPanel, unArtFrame, unArtDbFrame, unFraEmpresa, Menus, unArtDBAwareFrame,
  PatternEdit, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraUsuario;

type
  TfrmNotaSRT = class(TfrmCustomConsulta)
    rgNS_FECHAENVIO: TRadioGroup;
    rgNS_FECHARESPUESTA: TRadioGroup;
    GroupBox1: TGroupBox;
    cbNS_FECHAIMPRESIONNull: TCheckBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    cmbNS_FECHAENVIODesde: TDateComboBox;
    Label5: TLabel;
    cmbNS_FECHAENVIOHasta: TDateComboBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    cmbNS_FECHARESPUESTADesde: TDateComboBox;
    Label7: TLabel;
    cmbNS_FECHARESPUESTAHasta: TDateComboBox;
    GroupBox4: TGroupBox;
    edNS_NROREFERENCIA: TEdit;
    GroupBox5: TGroupBox;
    fraEM_CUIT: TfraEmpresa;
    Label2: TLabel;
    mnuImpresion: TPopupMenu;
    mnuNota: TMenuItem;
    mnuGrilla: TMenuItem;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    cmbNS_FECHARECEPCIONSRTDesde: TDateComboBox;
    cmbNS_FECHARECEPCIONSRTHasta: TDateComboBox;
    GroupBox7: TGroupBox;
    edNroSRT: TIntEdit;
    GroupBox8: TGroupBox;
    fraNS_TIPONOTA: TfraStaticCTB_TABLAS;
    GroupBox9: TGroupBox;
    fraUsuarios1: TfraUsuarios;
    tbRecepcion: TToolButton;
    fpRecepcion: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label8: TLabel;
    cmbFechaRecepcion: TDateComboBox;
    Label9: TLabel;
    edNroEntradaSRT: TIntEdit;
    tbSeparador: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure rgNS_FECHAENVIOClick(Sender: TObject);
    procedure rgNS_FECHARESPUESTAClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuNotaClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbRecepcionClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    function Validar: Boolean;

    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure EliminarNota;
    procedure ImprimirNotas;
  protected
  public
  end;

var
  frmNotaSRT: TfrmNotaSRT;

implementation

uses
  unPrincipal, unDmPrincipal, General, VCLExtra, AnsiSQL, SQLFuncs, CustomDlgs, unQRNotasSRT, unAltaNotaSRT;

{$R *.DFM}

const
  SQLBASE: String =
    'SELECT ns_id, ns_tiponota, tb_descripcion, ns_nota, ns_contrato, em_cuit, ns_fechaenvio, ns_nroreferencia,' +
          ' ns_fecharespuesta, ns_fecharecepcionsrt, ns_nroentradasrt, ns_descripcionrespuesta, ns_fechaimpresion,' +
          ' ns_fechabaja' +
     ' FROM ans_notasrt, aco_contrato, aem_empresa, ctb_tablas' +
    ' WHERE ns_contrato = co_contrato' +
      ' AND co_idempresa = em_id' +
      ' AND ns_tiponota = tb_codigo' +
      ' AND tb_clave = ''NOSRT''' +
      ' AND ns_fechabaja IS NULL';

procedure TfrmNotaSRT.tbRefrescarClick(Sender: TObject);
var
  sWhere: String;
begin
  sWhere :=
      //IIF(edNS_CONTRATO.Text = '', '', ' AND ns_contrato = ' + edNS_CONTRATO.Text) +
      IIF(edNS_NROREFERENCIA.Text = '', '', ' AND ns_nroreferencia LIKE ' + SqlValue(edNS_NROREFERENCIA.Text + '%')) +
      IIF(fraEM_CUIT.IsEmpty, '', ' AND em_id = ' + IntToStr(fraEM_CUIT.Value)) +
      IIF(cbNS_FECHAIMPRESIONNull.Checked, ' AND ns_fechaimpresion IS NULL', '');
      
  case rgNS_FECHAENVIO.ItemIndex of
    0:  sWhere := sWhere + ' AND ns_fechaenvio IS NULL';
    1:  sWhere := sWhere + ' AND ns_fechaenvio IS NOT NULL';
    2:  //No hace nada
  end;
  
  case rgNS_FECHARESPUESTA.ItemIndex of
    0:  sWhere := sWhere + ' AND ns_fecharespuesta IS NULL';
    1:  sWhere := sWhere + ' AND ns_fecharespuesta IS NOT NULL';
    2:  //No hace nada
  end;

  if (not cmbNS_FECHAENVIODesde.IsEmpty) and (not cmbNS_FECHAENVIODesde.ReadOnly) then
    sWhere := sWhere + ' AND ns_fechaenvio >= ' + SqlValue(cmbNS_FECHAENVIODesde.Date);
  if (not cmbNS_FECHAENVIOHasta.IsEmpty) and (not cmbNS_FECHAENVIOHasta.ReadOnly) then
    sWhere := sWhere + ' AND ns_fechaenvio <= ' + SqlValue(cmbNS_FECHAENVIOHasta.Date);

  if (not cmbNS_FECHARESPUESTADesde.IsEmpty) and (not cmbNS_FECHARESPUESTADesde.ReadOnly) then
    sWhere := sWhere + ' AND ns_fecharespuesta >= ' + SqlValue(cmbNS_FECHARESPUESTADesde.Date);
  if (not cmbNS_FECHARESPUESTAHasta.IsEmpty) and (not cmbNS_FECHARESPUESTAHasta.ReadOnly) then
    sWhere := sWhere + ' AND ns_fecharespuesta <= ' + SqlValue(cmbNS_FECHARESPUESTAHasta.Date);

  if (not cmbNS_FECHARECEPCIONSRTDesde.IsEmpty) and (not cmbNS_FECHARECEPCIONSRTDesde.ReadOnly) then
    sWhere := sWhere + ' AND ns_fecharecepcionsrt >= ' + SqlValue(cmbNS_FECHARECEPCIONSRTDesde.Date);
  if (not cmbNS_FECHARECEPCIONSRTHasta.IsEmpty) and (not cmbNS_FECHARECEPCIONSRTHasta.ReadOnly) then
    sWhere := sWhere + ' AND ns_fecharecepcionsrt <= ' + SqlValue(cmbNS_FECHARECEPCIONSRTHasta.Date);

  if not edNroSRT.IsEmpty then
    sWhere := sWhere + ' AND ns_nroentradasrt = ' + SqlValue(edNroSRT.Value);
    
  if not fraNS_TIPONOTA.IsEmpty then
    sWhere := sWhere + ' AND ns_tiponota = ' + SqlValue(fraNS_TIPONOTA.Value);

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Text := SQLBASE + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmNotaSRT.rgNS_FECHAENVIOClick(Sender: TObject);
begin
  inherited;
  LockControls([cmbNS_FECHAENVIODesde, cmbNS_FECHAENVIOHasta], (rgNS_FECHAENVIO.ItemIndex = 0));
end;

procedure TfrmNotaSRT.rgNS_FECHARESPUESTAClick(Sender: TObject);
begin
  inherited;
  LockControls([cmbNS_FECHARESPUESTADesde, cmbNS_FECHARESPUESTAHasta], (rgNS_FECHARESPUESTA.ItemIndex = 0));
end;

procedure TfrmNotaSRT.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edNS_NROREFERENCIA.Clear;
  fraEM_CUIT.Clear;
  rgNS_FECHAENVIO.ItemIndex := -1;
  cmbNS_FECHAENVIODesde.Clear;
  cmbNS_FECHAENVIOHasta.Clear;
  rgNS_FECHARESPUESTA.ItemIndex := -1;
  cmbNS_FECHARESPUESTADesde.Clear;
  cmbNS_FECHARESPUESTAHasta.Clear;
  cbNS_FECHAIMPRESIONNull.Checked := False;
  edNroSRT.Clear;
  cmbNS_FECHARECEPCIONSRTDesde.Clear;
  cmbNS_FECHARECEPCIONSRTHasta.Clear;
  fraNS_TIPONOTA.Clear;
end;

procedure TfrmNotaSRT.tbNuevoClick(Sender: TObject);
begin
  frmAltaNotaSRT := TfrmAltaNotaSRT.Create(Self);
  try
    frmAltaNotaSRT.Funcion := fNuevo;
    frmAltaNotaSRT.ShowModal;
    tbRefrescarClick(nil);
  finally
    frmAltaNotaSRT.Free;
  end;
end;

procedure TfrmNotaSRT.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ns_fechaimpresion').IsNull then
  begin
    frmAltaNotaSRT := TfrmAltaNotaSRT.Create(Self);
    try
      frmAltaNotaSRT.CargarDatos(sdqConsulta.FieldByName('ns_id').AsInteger);
      if sdqConsulta.FieldByName('ns_fecharespuesta').IsNull then
        frmAltaNotaSRT.Funcion := fModificarNota
      else // tiene respuesta
        frmAltaNotaSRT.Funcion := fModificarRespuesta;
      frmAltaNotaSRT.ShowModal;
      tbRefrescarClick(nil);
    finally
      frmAltaNotaSRT.Free;
    end;
  end
  else // Ya fue impresa
//    MessageDlg('No se puede modificar una nota ya impresa.', mtWarning, [mbOK], 0);
  begin
    frmAltaNotaSRT := TfrmAltaNotaSRT.Create(Self);
    try
      frmAltaNotaSRT.CargarDatos(sdqConsulta.FieldByName('ns_id').AsInteger);
      frmAltaNotaSRT.Funcion := fConsulta;
      frmAltaNotaSRT.ShowModal;
    finally
      frmAltaNotaSRT.Free;
    end;
  end
end;

procedure TfrmNotaSRT.tbEliminarClick(Sender: TObject);
begin
  inherited;

  if MsgBox('¿ Realmente desea borrar la nota ?', MB_YESNO) = mrYes then
    EliminarNota;
end;

procedure TfrmNotaSRT.tbPropiedadesClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ns_fechaimpresion').IsNull then
  begin
    MsgBox('La Nota debe estar impresa antes de cargar la respuesta.');
    Abort;
  end;

  frmAltaNotaSRT := TfrmAltaNotaSRT.Create(Self);
  try
    frmAltaNotaSRT.CargarDatos(sdqConsulta.FieldByName('ns_id').AsInteger);
    frmAltaNotaSRT.Funcion := fModificarRespuesta;
    frmAltaNotaSRT.ShowModal;
  finally
    frmAltaNotaSRT.Free;
  end;
end;

procedure TfrmNotaSRT.EliminarNota;
begin
  if not sdqConsulta.FieldByName('ns_fecharespuesta').IsNull then
  begin
    MsgBox('No se puede eliminar una Nota con Respuesta.');
    Abort;
  end;

  with TSql.Create('ans_notasrt') do
  try
    SqlType := stUpdate;

    PrimaryKey.Add('ns_id',    sdqConsulta.FieldByName('ns_id').AsString, False);
    Fields.Add('ns_usubaja',   frmPrincipal.DBLogin.UserId);
    Fields.Add('ns_fechabaja', SQL_ACTUALDATE, False);
    try
      EjecutarSQL(Sql);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
    tbRefrescarClick(nil);
  finally
    Free;
  end;
end;

procedure TfrmNotaSRT.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                        Highlight: Boolean);
begin
  inherited;

  if not sdqConsulta.FieldByName('ns_fechaimpresion').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clBlue)
end;

procedure TfrmNotaSRT.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmNotaSRT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmNotaSRT := nil;
  frmPrincipal.mnuNotasSRT.Enabled := True;
end;

procedure TfrmNotaSRT.mnuNotaClick(Sender: TObject);
begin
  ImprimirNotas;
end;

procedure TfrmNotaSRT.mnuGrillaClick(Sender: TObject);
begin
  inherited tbImprimirClick (nil);
end;

procedure TfrmNotaSRT.FormCreate(Sender: TObject);
begin
  inherited;

  fraEM_CUIT.ShowBajas := True;
  frmPrincipal.mnuNotasSRT.Enabled := False;
  fraNS_TIPONOTA.Clave := 'NOSRT';
  tbRecepcion.Left := 108;
  tbSeparador.Left := 100;
end;

procedure TfrmNotaSRT.GridDblClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
  begin
    MsgBox('No hay elementos...');
    Abort;
  end;
  tbModificar.Click;
end;

procedure TfrmNotaSRT.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
   MenuGrilla: TPopUpMenu;
   Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqConsulta.Active and (not sdqConsulta.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);
      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
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

procedure TfrmNotaSRT.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmNotaSRT.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmNotaSRT.btnCancelarClick(Sender: TObject);
begin
  fpRecepcion.ModalResult := mrCancel;
end;

procedure TfrmNotaSRT.tbRecepcionClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
  begin
    MsgBox('No hay elementos seleccionados.');
    Abort;
  end;
  
  cmbFechaRecepcion.Clear;
  edNroEntradaSRT.Clear;
  fpRecepcion.ShowModal;
end;

procedure TfrmNotaSRT.btnAceptarClick(Sender: TObject);
var
  iLoop: Integer;
begin
  if Validar then
  begin
    with TSql.Create('ans_notasrt') do
    try
      for iLoop := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));

        // Graba los cambios
        Clear;
        SqlType := stUpdate;
        PrimaryKey.Add('ns_id',            sdqConsulta.FieldByName('ns_id').AsInteger);
        Fields.Add('ns_fecharecepcionsrt', cmbFechaRecepcion.Date);
        Fields.Add('ns_nroentradasrt',     edNroEntradaSRT.Value, False);
        Fields.Add('ns_usumodif',          frmPrincipal.DBLogin.UserId);
        Fields.Add('ns_fechamodif',        SQL_ACTUALDATE, False);
        try
          EjecutarSQL(Sql);
        except
          on E: Exception do
            ErrorMsg(E, 'Error al guardar los datos.');
        end;
      end;
    finally
      Free;
    end;

    fpRecepcion.ModalResult := mrOk;
    tbRefrescarClick(nil);
  end;
end;

function TfrmNotaSRT.Validar: Boolean;
begin
  Result := True;

  if cmbFechaRecepcion.IsEmpty then
    raise Exception.Create('La fecha de recepción es obligatoria.');

  if edNroEntradaSRT.IsEmpty then
    raise Exception.Create('El número de entrada es obligatorio.');
end;

procedure TfrmNotaSRT.ImprimirNotas;
var
  iLoop: Integer;
  sListaId: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay elementos seleccionados.');

  with TSql.Create('ans_notasrt') do
  try
    try
      BeginTrans;
      for iLoop := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));
        
        //Genero la lista de IDs de las notas para el reporte
        sListaId := IIF(sListaId = '', sdqConsulta.FieldByName('ns_id').AsString,
                        sListaId + ',' + sdqConsulta.FieldByName('ns_id').AsString);

        // Grabo la info para las notas que no habian sido impresas
        if sdqConsulta.FieldByName('ns_fechaimpresion').IsNull then
        begin
          Clear;
          SqlType := stUpdate;
          PrimaryKey.Add('ns_id',         sdqConsulta.FieldByName('ns_id').AsInteger);
          Fields.Add('ns_fechaimpresion', SQL_ACTUALDATE, False);
          Fields.Add('ns_usuimpresion',   frmPrincipal.DBLogin.UserId);
          Fields.Add('ns_fechaenvio',     SQL_ACTUALDATE, False);
          EjecutarSQLST(Sql);
        end;
      end;

      //Guarda los cambios en la BD
      CommitTrans;
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    Free;
  end;

  // Muestra el Report..
  Application.CreateForm(TQrNotasSRT, QrNotasSRT);
  with QrNotasSRT do
  try
    Preparar(sListaId);
  finally
    FreeAndNil(QrNotasSRT);
  end;

  tbRefrescarClick(nil);
end;

end.
