unit unSeleccionTareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvGlowButton, AdvOfficeStatusBar, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, AdvToolBar, AdvToolBarStylers,
  AdvOfficePager, AdvOfficePagerStylers, AdvOfficeStatusBarStylers, DB,
  SDEngine, ImgList, unFraTrabajador, unFraCodigoDescripcion,
  unFraEstablecimiento, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, JvgGroupBox,unCustomForm, unGrids;

type
  TfrmSeleccionTareas = class(TfrmCustomForm)
    dsTareas: TDataSource;
    sdqTareas: TSDQuery;
    sdqTareasTIPO: TStringField;
    sdqTareasAT_ID: TFloatField;
    sdqTareasAT_IDUSUARIO: TFloatField;
    sdqTareasAT_IDTIPOEVENTO: TFloatField;
    sdqTareasAT_TODOELDIA: TStringField;
    sdqTareasAT_IDTIPOREPETICION: TFloatField;
    sdqTareasAT_DESCRIPCION: TStringField;
    sdqTareasAT_CONTRATO: TFloatField;
    sdqTareasAT_IDTRABAJADOR: TFloatField;
    sdqTareasAT_NROESTABLECI: TFloatField;
    sdqTareasAT_REQUIEREUBICACIONESTAB: TStringField;
    sdqTareasAT_CALLE: TStringField;
    sdqTareasAT_NUMERO: TStringField;
    sdqTareasAT_PISO: TStringField;
    sdqTareasAT_DEPARTAMENTO: TStringField;
    sdqTareasAT_CPOSTAL: TStringField;
    sdqTareasAT_CPOSTALA: TStringField;
    sdqTareasAT_LOCALIDAD: TStringField;
    sdqTareasAT_PROVINCIA: TStringField;
    sdqTareasAT_NUMEROTELEFONO: TStringField;
    sdqTareasAT_IDCONTACTO: TFloatField;
    sdqTareasAT_USUALTA: TStringField;
    sdqTareasAT_FECHAALTA: TDateTimeField;
    sdqTareasAT_USUMODIF: TStringField;
    sdqTareasAT_FECHAMODIF: TDateTimeField;
    sdqTareasAT_USUBAJA: TStringField;
    sdqTareasAT_FECHABAJA: TDateTimeField;
    sdqTareasAT_CONTACTO: TStringField;
    sdqTareasAT_DOMICILIOCONTRATO: TStringField;
    sdqTareasAT_FECHAVENCIMIENTO: TDateTimeField;
    sdqTareasAT_PRIORIDAD: TFloatField;
    sdqTareasAT_IDEVENTOTAREA: TFloatField;
    sdqTareasAT_LEIDO: TStringField;
    sdqTareasAT_ESTADO: TFloatField;
    sdqTareasAT_IDAGENDAEVENTO: TFloatField;
    sdqTareasmi_DESCRIPCION: TStringField;
    sdqTareasEM_NOMBRE: TStringField;
    sdqTareasEM_CUIT: TStringField;
    sdqTareasTJ_CUIL: TStringField;
    sdqTareasTJ_NOMBRE: TStringField;
    sdqTareasSELECTED: TStringField;
    toolBarStyleAgenda: TAdvOfficeStatusBarOfficeStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler;
    Panel1: TPanel;
    GridTareas: TArtDBGrid;
    AdvOfficeStatusBar1: TAdvOfficeStatusBar;
    btnNuevaTarea: TAdvGlowButton;
    btnModificarTareas: TAdvGlowButton;
    btnEliminarTareas: TAdvGlowButton;
    btnSeleccionarTodasTareas: TAdvGlowButton;
    btnDeseleccionarTodasTareas: TAdvGlowButton;
    Panel2: TPanel;
    Bevel1: TBevel;
    btnCancelarTareas: TAdvGlowButton;
    btnAceptarTareas: TAdvGlowButton;
    btnRefrescar: TAdvGlowButton;
    pnFiltros: TJvgGroupBox;
    pnlBusqueda: TPanel;
    Label4: TLabel;
    edPreventor: TEdit;
    pnlFiltro0: TPanel;
    Label1: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    pnlFiltro1: TPanel;
    Label2: TLabel;
    fraEstablecimientoFiltro: TfraEstablecimiento;
    pnlFiltro2: TPanel;
    Label3: TLabel;
    fraTrabajadorFiltro: TfraTrabajador;
    AdvToolBarPager: TAdvToolBarPager;
    IconosVista: TImageList;
    procedure btnCancelarTareasClick(Sender: TObject);
    procedure GridTareasDblClick(Sender: TObject);
    procedure GridTareasCellClick(Column: TColumn);
    procedure GridTareasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridTareasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNuevaTareaClick(Sender: TObject);
    procedure btnModificarTareasClick(Sender: TObject);
    procedure btnEliminarTareasClick(Sender: TObject);
    procedure btnSeleccionarTodasTareasClick(Sender: TObject);
    procedure btnDeseleccionarTodasTareasClick(Sender: TObject);
    procedure btnAceptarTareasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    SelectedList: TBookMarkLst;
    FAgendaEvento : Integer;
    FConsultaTareas : String;
    procedure fraEmpresaOnChange(Sender: TObject);
  public
    procedure Load(AgendaEvento: Integer; Contrato: Integer; Estableci: Integer; Trabajador: Integer);
  end;

var
  frmSeleccionTareas: TfrmSeleccionTareas;

implementation

uses
  VCLExtra, unDmPrincipal, AnsiSql, CustomDlgs, unContratoContacto, General,
  JvTFMonths, JvTFGlance, unSesion, unABMAgendaBaseTarea, unABMAgendaBase,
  unAgenda, unSIC;
{$R *.dfm}

procedure TfrmSeleccionTareas.btnCancelarTareasClick(Sender: TObject);
begin
  SelectedList.Clear;
  Close;
end;

procedure TfrmSeleccionTareas.GridTareasDblClick(Sender: TObject);
begin
  btnModificarTareasClick(nil);
end;

procedure TfrmSeleccionTareas.GridTareasCellClick(Column: TColumn);
begin
  if sdqTareas.Active and not sdqTareas.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqTareas.FieldByName('AT_ID').AsString) = -1 then
      SelectedList.Add(sdqTareas.FieldByName('AT_ID').AsString)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqTareas.FieldByName('AT_ID').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmSeleccionTareas.GridTareasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    GridTareas.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqTareas.FieldByName('AT_ID').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(GridTareas.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmSeleccionTareas.GridTareasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    GridTareasCellClick(GridTareas.ColumnByField['SELECTED']);
end;

procedure TfrmSeleccionTareas.btnNuevaTareaClick(Sender: TObject);
begin
  Abrir(TfrmABMAgendaBaseTarea, frmABMAgendaBaseTarea, tmvNormal, nil);
  with frmABMAgendaBaseTarea do
  begin
    AltaTarea;
    Visible := False;
    if ShowModal = mrOk then
      sdqTareas.Refresh;
  end;
end;

procedure TfrmSeleccionTareas.btnModificarTareasClick(Sender: TObject);
begin
  if sdqTareas.Active and (not sdqTareas.IsEmpty) then
  begin
    Abrir(TfrmABMAgendaBaseTarea, frmABMAgendaBaseTarea, tmvNormal, nil);
    with frmABMAgendaBaseTarea do
    begin
//      CargarTarea(sdqTareas.fieldByName('AT_ID').AsInteger);
      Visible :=False;
      ShowModal;
      sdqTareas.Refresh;
    end;
  end;
end;

procedure TfrmSeleccionTareas.btnEliminarTareasClick(Sender: TObject);
begin
  if sdqTareas.Active and (not sdqTareas.IsEmpty) then
  begin
    if MsgBox('¿Esta seguro de dar de baja la tarea seleccionada?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      EliminarTarea(sdqTareas.fieldByName('AT_ID').AsInteger);
      sdqTareas.Refresh;
    end;
  end;
end;

procedure TfrmSeleccionTareas.btnSeleccionarTodasTareasClick(Sender: TObject);
var
  i: integer;
begin
  with sdqTareas do
  begin
    DisableControls;
    AfterScroll := nil;
    try
      First;
      while not Eof do
      begin
          i:= SelectedList.IndexOf(FieldByName('AT_ID').AsString);
          if (i = -1) then
            SelectedList.AddObject(FieldByName('AT_ID').AsString, GetBookmark);
        Next;
      end;
    finally
      EnableControls;
      GridTareas.Refresh;
    end;
  end;
end;

procedure TfrmSeleccionTareas.btnDeseleccionarTodasTareasClick(Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqTareas.FreeBookmark(TBookmark(SelectedList.Objects[i]));
{$ENDIF}
  SelectedList.Clear;
  GridTareas.Refresh;
end;

procedure TfrmSeleccionTareas.btnAceptarTareasClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  BeginTrans(true);
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      GridTareas.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      EjecutarSqlST(
        ' UPDATE AGENDA.AAT_AGENDATAREA '+
        '    SET AT_IDAGENDAEVENTO = '+SqlValue(FAgendaEvento)+
        '  WHERE AT_ID = '+SqlValue(SelectedList.Strings[i]));

    end;
    CommitTrans(true);
    SelectedList.Clear;
    ModalResult := mrOk;

//    sdqDatosEmpresaAfterScroll( dbgEmpresa.DataSource.DataSet);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al asignar Tareas.');
    end;
  end;
  sdqTareas.Refresh;

end;

procedure TfrmSeleccionTareas.FormCreate(Sender: TObject);
begin
  SelectedList := TBookMarkLst.Create;
  AdvToolBarPager.ToolBarStyler :=  AdvToolBarOfficeStyler;
  fraEmpresaFiltro.ShowBajas := True;
  fraEstablecimientoFiltro.ShowBajas := True;
  fraTrabajadorFiltro.ShowBajas := True;
  sdqTareas.ParamByName('idusuario').AsInteger := Sesion.ID;
  fraEmpresaFiltro.OnChange := fraEmpresaOnChange;
  FConsultaTareas := sdqTareas.SQL.Text;
  sdqTareas.Open;
  vclExtra.LockControls(fraEstablecimientoFiltro);
  HideTitleBar;
end;

procedure TfrmSeleccionTareas.fraEmpresaOnChange(Sender: TObject);
begin
  if fraEmpresaFiltro.IsSelected then
  begin
    vclExtra.LockControls(fraEstablecimientoFiltro,False);
    fraEstablecimientoFiltro.Contrato := fraEmpresaFiltro.Contrato;
  end
  else
  begin
    vclExtra.LockControls(fraEstablecimientoFiltro,True);
    fraEstablecimientoFiltro.Clear;
  end;
end;

procedure TfrmSeleccionTareas.btnRefrescarClick(Sender: TObject);
var
  sSql : String;
begin
  sSql := '';

  if fraEmpresaFiltro.IsSelected then
    sSql := sSql + ' AND tarea.AT_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);
  if fraEstablecimientoFiltro.IsSelected then
    sSql := sSql + ' AND tarea.AT_nroestableci = '+SqlValue(fraEstablecimientoFiltro.NroEstablecimiento);
  if fraTrabajadorFiltro.IsSelected then
    sSql := sSql + ' AND tarea.AT_idtrabajador = '+SqlValue(fraTrabajadorFiltro.Value);

  OpenQueryEx(sdqTareas, [Sesion.ID], FConsultaTareas + sSql);
end;

procedure TfrmSeleccionTareas.FormDestroy(Sender: TObject);
begin
  SelectedList.Free;
end;

procedure TfrmSeleccionTareas.Load(AgendaEvento: Integer; Contrato: Integer; Estableci: Integer; Trabajador: Integer);
begin
  FAgendaEvento := AgendaEvento;
  fraEmpresaFiltro.Contrato := Contrato;
  fraEstablecimientoFiltro.Contrato := fraEmpresaFiltro.Contrato;
  if fraEmpresaFiltro.Contrato <> 0 then
    fraEstablecimientoFiltro.Codigo := IntToStr(Estableci);
  fraTrabajadorFiltro.Value := Trabajador;
  fraEmpresaOnChange(nil);
end;

end.



