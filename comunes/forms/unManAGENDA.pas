unit unManAGENDA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomForm, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ImgList,
  XPMenu, Placemnt, Db, artSeguridad, SDEngine, StdCtrls, Mask,
  PatternEdit, IntEdit, ComCtrls, JvExComCtrls, JvComCtrls, ExtCtrls,
  ToolWin, JvExControls, JvComponent, JvDBLookup, JvExStdCtrls,
  JvDBCombobox, JvExExtCtrls, JvNavigationPane, JvExDBGrids, JvDBGrid,
  FormPanel, JvDBLookupTreeView, DBCtrls;

type
  TfrmManAGENDA = class(TfrmCustomForm)
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    Seguridad: TSeguridad;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    Label1: TLabel;
    edMinutos: TIntEdit;
    Paginas: TJvPageControl;
    tsami_motivoingreso: TTabSheet;
    tsATE_TIPOEVENTO: TTabSheet;
    AG_IDMOTIVO: TTabSheet;
    AG_IDRESPUESTA: TTabSheet;
    pnlBottom: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Label2: TLabel;
    edCantidadMaxima: TIntEdit;
    sdqEventosDisponibles0: TSDQuery;
    dsEventosDisponibles0: TDataSource;
    sdqEventosAsociados0: TSDQuery;
    dsEventosAsociados0: TDataSource;
    sdqMotivosDisponibles1: TSDQuery;
    dsMotivosDisponibles1: TDataSource;
    sdqMotivosAsociados1: TSDQuery;
    dsMotivosAsociados1: TDataSource;
    dsTareasAsociadas2: TDataSource;
    sdqTareasAsociadas2: TSDQuery;
    sdqTareasDisponibles2: TSDQuery;
    dsTareasDisponibles2: TDataSource;
    sdqRespuestasAsociadas3: TSDQuery;
    sdqRespuestasDisponibles3: TSDQuery;
    dsRespuestasDisponibles3: TDataSource;
    dsRespuestasAsociadas3: TDataSource;
    btnAplicar: TButton;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Panel4: TPanel;
    Panel5: TPanel;
    ToolBar3: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel6: TPanel;
    btnActivar: TButton;
    btnDesactivar: TButton;
    chkSaludo: TCheckBox;
    pnlArbol: TPanel;
    JvOutlookSplitter1: TJvOutlookSplitter;
    JvNavPaneStyleManager1: TJvNavPaneStyleManager;
    JvOutlookSplitter4: TJvOutlookSplitter;
    JvOutlookSplitter5: TJvOutlookSplitter;
    JvOutlookSplitter8: TJvOutlookSplitter;
    JvOutlookSplitter10: TJvOutlookSplitter;
    dbgEventosDisponibles: TJvDBGrid;
    dbgEventosAsociados: TJvDBGrid;
    Panel8: TPanel;
    cmbEventoMotivos: TJvDBLookupCombo;
    Label4: TLabel;
    dbgIngresosAsociados1: TJvDBGrid;
    dbgIngresosDisponibles1: TJvDBGrid;
    dbgMotivoIngresosAsociados2: TJvDBGrid;
    dbgMotivoIngresosDisponibles2: TJvDBGrid;
    dbgRespuestasAsociados3: TJvDBGrid;
    dbgRespuestasDisponibles3: TJvDBGrid;
    JvOutlookSplitter2: TJvOutlookSplitter;
    sdqEventos: TSDQuery;
    dsEventos: TDataSource;
    fpDatos: TFormPanel;
    BevelAbm: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    btnAceptarDatos: TButton;
    btnCancelarDatos: TButton;
    cmbPrivacidad: TComboBox;
    chkHito: TCheckBox;
    chkRequiereRespuesta: TCheckBox;
    cmbOperacion: TComboBox;
    Panel9: TPanel;
    Label7: TLabel;
    cmbItemsSector: TJvDBLookupCombo;
    sdqItemsSector: TSDQuery;
    dsItemsSector: TDataSource;
    chkObligatorio: TCheckBox;
    sdqMotivos: TSDQuery;
    dsMotivos: TDataSource;
    pnlTopTareas: TPanel;
    pnlEvento: TPanel;
    Label3: TLabel;
    Panel10: TPanel;
    Label8: TLabel;
    lstEventoTareas: TJvDBLookupList;
    lstMotivoTareas: TJvDBLookupList;
    chkRequiereRespuestaTabulada: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sdqSectorAfterScroll(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure AjustarGrillas(Sender: TObject);
    procedure AsociacionesDeItems(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);
    procedure btnDesactivarClick(Sender: TObject);
    procedure chkSaludoClick(Sender: TObject);
    procedure lstEventoTareasChange(Sender: TObject);
    procedure SeleccionarArbol(Sender: TObject; Node: TTreeNode);
    procedure btnAceptarDatosClick(Sender: TObject);
    procedure fpDatosShow(Sender: TObject);
    procedure cmbEventoMotivosChange(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure cmbItemsSectorChange(Sender: TObject);
    procedure lstMotivoTareasChange(Sender: TObject);
    procedure chkRequiereRespuestaClick(Sender: TObject);
    procedure chkRequiereRespuestaTabuladaClick(Sender: TObject);
  private
    iTabIndex: Integer;
    procedure RefrescarConsultas;
    procedure AgregarQuitar(bAgregar: boolean; Sender: TObject);
    procedure ActivarDesactivar(AValue: boolean);
  end;

var
  frmManAGENDA: TfrmManAGENDA;

implementation

uses
  unAlarmas, unDmPrincipal, StrFuncs, unSesion, VCLExtra, CustomDlgs, Variants, General, unArbolSectores,
  AnsiSql, SqlFuncs, unPrincipal;

var
  frmArbolSectoresEmbebido: TfrmArbolSectores;

{$R *.DFM}

procedure TfrmManAGENDA.FormCreate(Sender: TObject);
begin
  frmArbolSectoresEmbebido := TfrmArbolSectores.Create(pnlArbol);
  with frmArbolSectoresEmbebido do
  begin
    ModoAgenda := True;
    Parent := pnlArbol;
    Align := alClient;
    pnlBottom.Visible := False;
    BorderStyle := TFormBorderStyle(bsNone);
    Constraints.MinHeight := 150;
    MostrarSector(Sesion.IdSectorIntranet);
    Visible := True;
    tvSectores.OnChange := SeleccionarArbol;
    DragMode := dmAutomatic;    
  end;

  inherited;
  edMinutos.Value         := Round(Alarma.Intervalo / 60000);
  edCantidadMaxima.Value  := Alarma.CantidadMaxima;
  Paginas.ActivePageIndex := tsami_motivoingreso.TabIndex;
  OpenQuery(sdqSector);
  if sdqSector.Locate('SC_CODIGO', Sesion.Sector, []) then
    pnlArbol.Enabled := AreIn(Sesion.Sector, ['COMPUTOS', 'GERGEN', 'CALIDAD', 'CONTGEST']) or frmPrincipal.Seguridad.Claves.IsActive('Administrador');

  ActivarDesactivar(Alarma.Activas);
  chkSaludo.Checked := Alarma.Saludo;
  BeginTrans(True);
end;

procedure TfrmManAGENDA.SeleccionarArbol(Sender: TObject; Node: TTreeNode);
begin
  with frmArbolSectoresEmbebido do
  begin
    if sdqSectores.Active and not sdqSectores.FieldByName('SE_ID').IsNull then
      RefrescarConsultas;

    Paginas.Visible := sdqSectores.FieldByName('PRIVACIDAD').IsNull and (sdqSectores.FieldByName('NIVEL').AsInteger = 4);
  end;
end;

procedure TfrmManAGENDA.RefrescarConsultas;
var
  i: integer;
begin
  if (Paginas.ActivePageIndex = 1) or (Paginas.ActivePageIndex = 2) then
  begin
    if (Screen.ActiveControl <> lstEventoTareas) then
      OpenQuery(sdqEventos);

    if sdqEventosAsociados0.Active and not sdqEventosAsociados0.IsEmpty then
    begin
      {No estoy loco, pregunto esto 2 veces porque a veces es lógico que el query quede cerrado!}
      if Assigned(sdqEventosAsociados0.FindField('ID')) then
        cmbEventoMotivos.KeyValue := sdqEventosAsociados0.FieldByName('ID').AsInteger;
      if Assigned(sdqEventosAsociados0.FindField('ID')) then
        lstEventoTareas.KeyValue := sdqEventosAsociados0.FieldByName('ID').AsInteger;
    end;

    if (Screen.ActiveControl <> lstMotivoTareas) then
    begin
      sdqMotivos.ParamByName('IdMotivoIngreso').AsInteger := iif(VarIsNull(lstEventoTareas.KeyValue), -1, lstEventoTareas.KeyValue);
      sdqMotivos.ParamByName('IDSECTOR').AsInteger := frmArbolSectoresEmbebido.IdSectorSeleccionado;
      OpenQuery(sdqMotivos);
    end;
  end;

  if (Paginas.ActivePageIndex = 3) then
  begin
    sdqItemsSector.ParamByName('IDSECTOR').AsInteger := frmArbolSectoresEmbebido.IdSectorSeleccionado;
    OpenQuery(sdqItemsSector);
    
    if (iTabIndex = 1) and sdqMotivosAsociados1.Active and not sdqMotivosAsociados1.IsEmpty then
      cmbItemsSector.KeyValue := sdqMotivosAsociados1.FieldByName('ID').AsInteger;

    if (iTabIndex = 2) and sdqTareasAsociadas2.Active and not sdqTareasAsociadas2.IsEmpty then
      cmbItemsSector.KeyValue := sdqTareasAsociadas2.FieldByName('ID').AsInteger;
  end;

  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i].ClassType = TSDQuery) and (Components[i] <> sdqSector) then
    begin
      if StrRight(TSDQuery(Components[i]).Name, 1) = IntToStr(Paginas.ActivePageIndex) then
      begin
        if Assigned(TSDQuery(Components[i]).ParamByName('IDSECTOR')) then
          TSDQuery(Components[i]).ParamByName('IDSECTOR').AsInteger := frmArbolSectoresEmbebido.IdSectorSeleccionado;

        if (Paginas.ActivePageIndex = 1) then
         if Assigned(TSDQuery(Components[i]).ParamByName('IdMotivoIngreso')) then
            TSDQuery(Components[i]).ParamByName('IdMotivoIngreso').AsInteger := iif(VarIsNull(cmbEventoMotivos.KeyValue), -1, cmbEventoMotivos.KeyValue);

        if (Paginas.ActivePageIndex = 2) then
        begin
          TSDQuery(Components[i]).ParamByName('IdMotivoIngreso').AsInteger := iif(VarIsNull(lstEventoTareas.KeyValue), -1, lstEventoTareas.KeyValue);
          TSDQuery(Components[i]).ParamByName('IDPADRE').AsInteger := iif(VarIsNull(lstMotivoTareas.KeyValue), -1, lstMotivoTareas.KeyValue);
        end;

        if (Paginas.ActivePageIndex = 3) then
          TSDQuery(Components[i]).ParamByName('IDTIPOEVENTOSECTOR').AsInteger := StrToIntDef(VarToStr(cmbItemsSector.KeyValue), 0);

        TSDQuery(Components[i]).Close;
        OpenQuery(TSDQuery(Components[i]));
      end else
        if (TSDQuery(Components[i]) <> sdqMotivos) and (TSDQuery(Components[i]) <> sdqEventos) and (TSDQuery(Components[i]) <> sdqItemsSector) then
          TSDQuery(Components[i]).Close;
    end;
  end;
end;

procedure TfrmManAGENDA.sdqSectorAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if DataSet.Active and not DataSet.IsEmpty then
    RefrescarConsultas;
end;

procedure TfrmManAGENDA.btnCancelarClick(Sender: TObject);
begin
  RollBack(True);
  Close;
end;

procedure TfrmManAGENDA.btnAceptarClick(Sender: TObject);
begin
  btnAplicarClick(nil);
  CommitTrans(True);
  Close;
end;

procedure TfrmManAGENDA.btnAplicarClick(Sender: TObject);
begin
  Alarma.Intervalo      := edMinutos.Value;
  Alarma.CantidadMaxima := edCantidadMaxima.Value;
  CommitTrans(True);
  BeginTrans(True);
end;

procedure TfrmManAGENDA.PaginasChange(Sender: TObject);
begin
  inherited;
  RefrescarConsultas;
end;

procedure TfrmManAGENDA.AjustarGrillas(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to TTabSheet(Sender).ControlCount - 1 do
    if TTabSheet(Sender).Controls[i] is TCustomDBGrid then
      TCustomDBGrid(TTabSheet(Sender).Controls[i]).Width := Round(TTabSheet(Sender).Width / 2) - StrToInt(iif(TTabSheet(Sender).TabIndex = 0, 4, 31));

  pnlEvento.Width := Round(pnlTopTareas.Width / 2);
end;

procedure TfrmManAGENDA.AsociacionesDeItems(Sender: TObject);
begin
  if TControl(Sender).Enabled then
  begin
    AgregarQuitar((Sender as TComponent).Tag = 0, Sender);
    frmArbolSectoresEmbebido.sdqSectores.Refresh;
    //frmArbolSectoresEmbebido.MostrarSector(frmArbolSectoresEmbebido.sdqSectores.FieldByName('ID').AsInteger);
  end;
end;

procedure TfrmManAGENDA.AgregarQuitar(bAgregar: boolean; Sender: TObject);
var
  i: integer;
  objSQL: TSQL;
  sPrefijo: String;
  sdqQuery: TSDQuery;
begin
  {Busco la solapa donde estamos parados...}
  while not (Sender is TTabSheet) do
    Sender := TControl(Sender).Parent;

  objSQL := TSQL.Create();

  try
    for i := 0 to TTabSheet(Sender).ControlCount - 1 do
      if TTabSheet(Sender).Controls[i] is TCustomDBGrid then
      begin
        with objSQL do
        begin
          case TTabSheet(Sender).TabIndex of
            1, 2:
              TableName := 'AGENDA.ATS_TIPOEVENTOSECTOR';
            3:
              TableName := 'AGENDA.ARE_RESPUESTAEVENTO';
          end;

          sPrefijo := StrMid(TableName, Pos('.', TableName) + 2, 3);
          sdqQuery := TSDQuery(TCustomDBGrid(TTabSheet(Sender).Controls[i]).DataSource.DataSet);

          if bAgregar and (Pos('Disponibles', sdqQuery.Name) > 0) then
          begin
            Verificar(sdqQuery.IsEmpty, TWinControl(Sender), 'No existe el elemento seleccionado.');
            SqlType := stInsert;
            PrimaryKey.AddExpression(sPrefijo + 'ID', 'AGENDA.SEQ_A' + sPrefijo + 'ID.NEXTVAL');
            Fields.Add(sPrefijo + 'FECHABAJA', exNull);
            Fields.Add(sPrefijo + 'USUBAJA', exNull);
            Fields.Add(sPrefijo + 'USUALTA', Sesion.UserID);
            Fields.Add(sPrefijo + 'FECHAALTA', exDateTime);

            case TTabSheet(Sender).TabIndex of
              1: begin
                   Fields.Add(sPrefijo + 'IDTIPOEVENTO', sdqQuery.FieldByName('ID').AsInteger, dtNumber);
                 end;
              2: begin
                   Fields.Add(sPrefijo + 'IDTIPOEVENTO', sdqQuery.FieldByName('ID').AsInteger, dtNumber);
                 end;
              3: begin
                   Verificar(VarIsNull(cmbItemsSector.KeyValue) or (cmbItemsSector.KeyValue = -1), cmbItemsSector, 'Debe indicar el ítem al cual quiere asociar la respuesta.');
                   Fields.Add(sPrefijo + 'IDTIPOEVENTOSECTOR', cmbItemsSector.KeyValue, dtNumber);
                   Fields.Add(sPrefijo + 'IDRESPUESTA', sdqQuery.FieldByName('ID').AsInteger, dtNumber);
                   if not MsgAsk('¿Confirma que desea asociar el ítem seleccionado?') then
                     Abort;                   
                 end;
            end;

            if (TTabSheet(Sender).TabIndex = 1) or (TTabSheet(Sender).TabIndex = 2) then
            begin
              if fpDatos.ShowModal = mrOk then
              begin
                Fields.Add(sPrefijo + 'PRIVACIDAD', StrLeft(cmbPrivacidad.Items[cmbPrivacidad.ItemIndex], 2));
                Fields.Add(sPrefijo + 'TIPOOPERACION', iif(cmbOperacion.ItemIndex = 0, 'A', 'M'), dtString);
                Fields.Add(sPrefijo + 'REQUIERERESPUESTA', SqlBoolean(chkRequiereRespuesta.Checked, False));
                Fields.Add(sPrefijo + 'REQUIERERESPUESTATABULADA', SqlBoolean(chkRequiereRespuestaTabulada.Checked, False));                
                Fields.Add(sPrefijo + 'OBLIGATORIO', SqlBoolean(chkObligatorio.Checked, False));                
                Fields.Add(sPrefijo + 'HITO', SqlBoolean(chkHito.Checked, False));
              end else
                Break;
            end;
          end else
          if (not bAgregar) and (Pos('Asocia', sdqQuery.Name) > 0) then
          begin
            Verificar(sdqQuery.IsEmpty, TWinControl(Sender), 'No existe el elemento seleccionado.');
            SqlType := stUpdate;
            PrimaryKey.Add(sPrefijo + 'ID', sdqQuery.FieldByName('ID').AsInteger);
            Fields.Add(sPrefijo + 'FECHABAJA', exDateTime);
            Fields.Add(sPrefijo + 'USUBAJA', Sesion.UserID);
          end;

          if PrimaryKey.Count > 0 then
          begin
            if (TTabSheet(Sender).TabIndex = 1) or (TTabSheet(Sender).TabIndex = 2) then
              Fields.Add(sPrefijo + 'IDSECTOR', frmArbolSectoresEmbebido.IdSectorSeleccionado);
              
            if bAgregar or MsgAsk('¿Confirma que desea remover la asociación seleccionada?') then
              EjecutarSQLST(Sql);
          end;
          Clear;
        end;
      end;
  finally
    objSQL.Free;
  end;

  RefrescarConsultas;
end;

procedure TfrmManAGENDA.btnActivarClick(Sender: TObject);
begin
  Alarma.Activar;
  ActivarDesactivar(Alarma.Activas);
end;

procedure TfrmManAGENDA.btnDesactivarClick(Sender: TObject);
begin
  Alarma.Desactivar;
  ActivarDesactivar(Alarma.Activas);  
end;

procedure TfrmManAGENDA.ActivarDesactivar(AValue: boolean);
begin
  btnActivar.Enabled := not AValue;
  btnDesActivar.Enabled := AValue;
end;

procedure TfrmManAGENDA.chkSaludoClick(Sender: TObject);
begin
  Alarma.Saludo := (Sender as TCheckBox).Checked;
end;

procedure TfrmManAGENDA.lstEventoTareasChange(Sender: TObject);
begin
  if (lstEventoTareas.KeyValue <> Null) then
    RefrescarConsultas;
end;

procedure TfrmManAGENDA.btnAceptarDatosClick(Sender: TObject);
begin
  Verificar(cmbPrivacidad.ItemIndex = -1, cmbPrivacidad, 'Debe indicar la privacidad del elemento.');
  Verificar(cmbOperacion.ItemIndex = -1, cmbOperacion, 'Debe indicar el tipo de operación del elemento.');
  Verificar(chkHito.State = cbGrayed, chkHito, 'Debe indicar si el elemento representa un hito o no.');
  Verificar(chkRequiereRespuesta.State = cbGrayed, chkRequiereRespuesta, 'Debe indicar si el elemento requiere respuesta.');
  Verificar(chkRequiereRespuestaTabulada.State = cbGrayed, chkRequiereRespuestaTabulada, 'Debe indicar si el elemento requiere respuesta tabulada.');  
//  Verificar(chkObligatorio.State = cbGrayed, chkObligatorio, 'Debe indicar si el elemento es obligatorio o no.');
  fpDatos.ModalResult := mrOk;
end;

procedure TfrmManAGENDA.fpDatosShow(Sender: TObject);
begin
  if True then
  begin
    cmbPrivacidad.ItemIndex := 2;
    cmbOperacion.ItemIndex := 1;
    chkHito.State := cbUnchecked;
    chkRequiereRespuesta.State := cbUnchecked;
    chkRequiereRespuestaTabulada.State := cbUnchecked;    
    chkObligatorio.State := cbUnchecked;
  end;
end;

procedure TfrmManAGENDA.cmbEventoMotivosChange(Sender: TObject);
begin
  if cmbEventoMotivos.KeyValue <> Null then
    RefrescarConsultas;
end;

procedure TfrmManAGENDA.PaginasChanging(Sender: TObject; var AllowChange: Boolean);
begin
  iTabIndex := Paginas.ActivePageIndex;
end;

procedure TfrmManAGENDA.cmbItemsSectorChange(Sender: TObject);
begin
  if cmbItemsSector.KeyValue <> Null then
    RefrescarConsultas;
end;

procedure TfrmManAGENDA.lstMotivoTareasChange(Sender: TObject);
begin
  if (lstEventoTareas.KeyValue <> Null) and (lstMotivoTareas.KeyValue <> Null) then
    RefrescarConsultas;
end;

procedure TfrmManAGENDA.chkRequiereRespuestaClick(Sender: TObject);
begin
  if not chkRequiereRespuesta.Checked then
    chkRequiereRespuestaTabulada.Checked := False;
end;

procedure TfrmManAGENDA.chkRequiereRespuestaTabuladaClick(Sender: TObject);
begin
  if chkRequiereRespuestaTabulada.Checked then
    chkRequiereRespuesta.Checked := True;
end;

end.
