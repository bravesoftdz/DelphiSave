unit unManCAG_AGENDA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ImgList, XPMenu, Placemnt, Db, artSeguridad, SDEngine, StdCtrls, Mask, PatternEdit, IntEdit,
  ComCtrls, JvExComCtrls, JvComCtrls, ExtCtrls, JvgSplit, ToolWin, JvExControls, JvComponent, JvDBLookup, JvExStdCtrls,
  JvDBCombobox;

type
  TfrmManCAG_AGENDA = class(TfrmCustomForm)
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    Seguridad: TSeguridad;
    pnlLeft: TPanel;
    dbgSectores: TArtDBGrid;
    pnlRight: TPanel;
    pnlTop: TPanel;
    Label1: TLabel;
    edMinutos: TIntEdit;
    Paginas: TJvPageControl;
    AG_IDEVENTO: TTabSheet;
    AG_IDINGRESOEVENTO: TTabSheet;
    AG_IDMOTIVO: TTabSheet;
    AG_IDRESPUESTA: TTabSheet;
    dbgEventosAsociados: TArtDBGrid;
    dbgEventosDisponibles: TArtDBGrid;
    dbgIngresosAsociados1: TArtDBGrid;
    dbgIngresosDisponibles1: TArtDBGrid;
    dbgMotivoIngresosAsociados2: TArtDBGrid;
    dbgMotivoIngresosDisponibles2: TArtDBGrid;
    dbgRespuestasAsociados3: TArtDBGrid;
    dbgRespuestasDisponibles3: TArtDBGrid;
    pnlBottom: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Label2: TLabel;
    edCantidadMaxima: TIntEdit;
    sdqEventosDisponibles0: TSDQuery;
    dsEventosDisponibles0: TDataSource;
    sdqEventosAsociados0: TSDQuery;
    dsEventosAsociados0: TDataSource;
    sdqIngresosDisponibles1: TSDQuery;
    dsIngresosDisponibles1: TDataSource;
    sdqIngresosAsociados1: TSDQuery;
    dsIngresosAsociados1: TDataSource;
    splBottom: TJvgSplitter;
    dsMotivoIngresosAsociados2: TDataSource;
    sdqMotivoIngresosAsociados2: TSDQuery;
    sdqMotivoIngresosDisponibles2: TSDQuery;
    dsMotivoIngresosDisponibles2: TDataSource;
    sdqRespuestasAsociados3: TSDQuery;
    sdqRespuestasDisponibles3: TSDQuery;
    dsRespuestasDisponibles3: TDataSource;
    dsRespuestasAsociados3: TDataSource;
    btnAplicar: TButton;
    JvgSplitter1: TJvgSplitter;
    pnlDivisorEventos: TPanel;
    tbEventos: TToolBar;
    tbAgregarEventos: TToolButton;
    tbQuitarEventos: TToolButton;
    pnlRelleno: TPanel;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    JvgSplitter2: TJvgSplitter;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Panel4: TPanel;
    JvgSplitter3: TJvgSplitter;
    Panel5: TPanel;
    ToolBar3: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel6: TPanel;
    JvgSplitter4: TJvgSplitter;
    Panel7: TPanel;
    FiltroIngresos: TJvDBLookupCombo;
    btnActivar: TButton;
    btnDesactivar: TButton;
    chkSaludo: TCheckBox;
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
    procedure FiltroIngresosChange(Sender: TObject);
  private
    procedure ActivarDesactivar(AValue: Boolean);
    procedure AgregarQuitar(bAgregar: Boolean; Sender: TObject);
    procedure RefrescarConsultas;
  end;

var
  frmManCAG_AGENDA: TfrmManCAG_AGENDA;

implementation

uses
  unPrincipal, unAlarmas, unDmPrincipal, StrFuncs, unSesion, VCLExtra, CustomDlgs, Variants, General;

{$R *.DFM}

procedure TfrmManCAG_AGENDA.FormCreate(Sender: TObject);
begin
  inherited;

  edMinutos.Value        := Round(Alarma.Intervalo / 60000);
  edCantidadMaxima.Value := Alarma.CantidadMaxima;

  OpenQuery(sdqSector);
  if sdqSector.Locate('sc_codigo', Sesion.Sector, []) then
    dbgSectores.Enabled := AreIn(Sesion.Sector, ['COMPUTOS', 'CALIDAD']);

  ActivarDesactivar(Alarma.Activas);
  chkSaludo.Checked := Alarma.Saludo;
  BeginTrans;
end;

procedure TfrmManCAG_AGENDA.RefrescarConsultas;
var
  iLoop: Integer;
begin
  for iLoop := 0 to ComponentCount - 1 do
  begin
    if (Components[iLoop].ClassType = TSDQuery) and (Components[iLoop] <> sdqSector) then
    begin
      TSDQuery(Components[iLoop]).ParamByName('sector').AsString := sdqSector.FieldByName('sc_codigo').AsString;

      if StrRight(TSDQuery(Components[iLoop]).Name, 1) = IntToStr(Paginas.ActivePageIndex) then
        OpenQuery(TSDQuery(Components[iLoop]))
      else
        TSDQuery(Components[iLoop]).Close;
    end;
  end;

  if (Paginas.ActivePageIndex = 2) and sdqIngresosDisponibles1.IsEmpty then
  begin
    OpenQuery(sdqIngresosDisponibles1);
    FiltroIngresos.KeyValue := sdqIngresosDisponibles1.FieldByName('ie_id').AsInteger;
    sdqMotivoIngresosDisponibles2.Close;
    sdqMotivoIngresosAsociados2.Close;
    if sdqIngresosDisponibles1.Active and not sdqIngresosDisponibles1.IsEmpty then
    begin
      OpenQueryEx(sdqMotivoIngresosDisponibles2, [sdqSector.FieldByName('sc_codigo').AsString, sdqIngresosDisponibles1.FieldByName('ie_id').AsInteger, sdqSector.FieldByName('sc_codigo').AsString]);
      OpenQueryEx(sdqMotivoIngresosAsociados2, [sdqSector.FieldByName('sc_codigo').AsString, sdqIngresosDisponibles1.FieldByName('ie_id').AsInteger, sdqSector.FieldByName('sc_codigo').AsString]);
    end;
  end;
end;

procedure TfrmManCAG_AGENDA.sdqSectorAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if DataSet.Active and not DataSet.IsEmpty then
    RefrescarConsultas;
end;

procedure TfrmManCAG_AGENDA.btnCancelarClick(Sender: TObject);
begin
  RollBack;
  Close;
end;

procedure TfrmManCAG_AGENDA.btnAceptarClick(Sender: TObject);
begin
  btnAplicarClick(nil);
  CommitTrans;
  Close;
end;

procedure TfrmManCAG_AGENDA.btnAplicarClick(Sender: TObject);
begin
  Alarma.Intervalo      := edMinutos.Value;
  Alarma.CantidadMaxima := edCantidadMaxima.Value;
  CommitTrans;
  BeginTrans;
end;

procedure TfrmManCAG_AGENDA.PaginasChange(Sender: TObject);
begin
  inherited;
  RefrescarConsultas;
end;

procedure TfrmManCAG_AGENDA.AjustarGrillas(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to TTabSheet(Sender).ControlCount - 1 do
    if TTabSheet(Sender).Controls[iLoop] is TArtDBGrid then
    begin
      TArtDBGrid(TTabSheet(Sender).Controls[iLoop]).Width            := Round(TTabSheet(Sender).Width / 2) - 33;
      TArtDBGrid(TTabSheet(Sender).Controls[iLoop]).Columns[0].Width := TArtDBGrid(TTabSheet(Sender).Controls[iLoop]).Width - 22;
    end;
end;

procedure TfrmManCAG_AGENDA.AsociacionesDeItems(Sender: TObject);
begin
  if TControl(Sender).Enabled then
    AgregarQuitar((Sender as TComponent).Tag = 1, Sender);
end;

procedure TfrmManCAG_AGENDA.AgregarQuitar(bAgregar: Boolean; Sender: TObject);
var
  iLoop: Integer;
  sdqQuery: TSDQuery;
  sSql: String;
begin
  {Busco la solapa donde estamos parados...}
  while not (Sender is TTabSheet) do
    Sender := TControl(Sender).Parent;

  for iLoop := 0 to TTabSheet(Sender).ControlCount - 1 do
    if TTabSheet(Sender).Controls[iLoop] is TArtDBGrid then
    begin
      sdqQuery := TSDQuery(TArtDBGrid(TTabSheet(Sender).Controls[iLoop]).DataSource.DataSet);

      if bAgregar and (Pos('Asociados', sdqQuery.Name) > 0) then
      begin
        Verificar(sdqQuery.IsEmpty, TWinControl(Sender), 'No existe el elemento seleccionado.');
        sSql :=
          'INSERT INTO cag_agenda' +
                     ' (AG_ID, AG_SECTOR, ' + TTabSheet(Sender).Name {Nombre del campo de la CAG_AGENDA} + ',' +
                      ' AG_USUALTA, AG_FECHAALTA)' +
              ' VALUES (seq_cag_id.nextval, :sector, :valor, :usuario, SYSDATE)';
        EjecutarSqlSTEx(sSql, [sdqSector.FieldByName('sc_codigo').AsString, sdqQuery.FieldByName('id').AsInteger, Sesion.UserID]);
      end
      else if (not bAgregar) and (Pos('Disponibles', sdqQuery.Name) > 0) then
      begin
        Verificar(sdqQuery.IsEmpty, TWinControl(Sender), 'No existe el elemento seleccionado.');
        sSql :=
          'UPDATE cag_agenda' +
            ' SET ag_usubaja = :usuario,' +
                ' ag_fechabaja = SYSDATE' +
          ' WHERE ag_sector = :sector' +
            ' AND ' + TTabSheet(Sender).Name {Nombre del campo de la CAG_AGENDA} + ' = :Valor';
        EjecutarSqlSTEx(sSql, [Sesion.UserID, sdqSector.FieldByName('sc_codigo').AsString, sdqQuery.FieldByName('id').AsInteger]);
      end;
    end;

  RefrescarConsultas;
end;

procedure TfrmManCAG_AGENDA.btnActivarClick(Sender: TObject);
begin
  Alarma.Activar;
  ActivarDesactivar(Alarma.Activas);
end;

procedure TfrmManCAG_AGENDA.btnDesactivarClick(Sender: TObject);
begin
  Alarma.Desactivar;
  ActivarDesactivar(Alarma.Activas);  
end;

procedure TfrmManCAG_AGENDA.ActivarDesactivar(AValue: boolean);
begin
  btnActivar.Enabled := not AValue;
  btnDesActivar.Enabled := AValue;
end;

procedure TfrmManCAG_AGENDA.chkSaludoClick(Sender: TObject);
begin
  Alarma.Saludo := (Sender as TCheckBox).Checked;
end;

procedure TfrmManCAG_AGENDA.FiltroIngresosChange(Sender: TObject);
begin
  inherited;
  if FiltroIngresos.KeyValue <> Null then
    RefrescarConsultas;
end;

end.
