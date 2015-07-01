unit unAgendaVistaGenerica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ExtCtrls, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraVistaEventos, ImgList, XPMenu, Placemnt, unFraEmpresa,
  StdCtrls, JvgGroupBox, unFraTitulo, unFraCodDesc, unArt,
  unFraCodigoDescripcion, unfraCPR_PRESTADOR, unfraPrestadorAGENDA,
  unfraEmpresaAGENDA, Mask, ToolEdit, DateComboBox, AdvGlowButton,
  JvExExtCtrls, JvComponent, JvPanel, JvExtComponent, RxToolEdit, RxPlacemnt,
  unFraTrabajador, unFraTrabajadorSiniestro, unfraTrabajadorSiniestroAGENDA;

type
  TfrmAgendaVistaGenerica = class(TfrmCustomForm)
    fraAE_IDPRESTADOR: TfraPrestadorAGENDA;
    fraIDSECTORALTA: TfraCodDesc;
    fraTituloVistaEmpresa: TfraTitulo;
    fraVistaEventosGenerica: TfraVistaEventos;
    gbCondicionesAdicionales: TJvgGroupBox;
    gbFiltrosPrestador: TJvgGroupBox;
    Label19: TLabel;
    pnlFiltros: TPanel;
    gbFiltrosEmpresa: TJvgGroupBox;
    fraAE_CONTRATO: TfraEmpresaAGENDA;
    edAE_FECHAALTAHasta: TDateComboBox;
    lbl1: TLabel;
    pnlFechaDesde: TPanel;
    lbl2: TLabel;
    edAE_FECHAALTADesde: TDateComboBox;
    lbl3: TLabel;
    fraAE_IDTIPOEVENTO: TfraCodDesc;
    pnlLeftToolbar: TJvPanel;
    lblEventos: TLabel;
    btnConsultar: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnOrdenar: TAdvGlowButton;
    btnLimpiar: TAdvGlowButton;
    pnlAux: TPanel;
    gbAreaMedica: TJvgGroupBox;
    fraAE_IDEXPEDIENTE: TfraTrabajadorSiniestroAGENDA;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraIDSECTORALTAPropiedadesChange(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacActualizarExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacEliminarEventoExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacLimpiarExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacModificarEventoExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacNuevoEventoExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacOrdenarExecute(Sender: TObject);
  private
    FAutoAjustarGrilla: Boolean;
    FSQL: String;
    function GetContrato: TTableID;
    function GetIdPrestador: TTableID;
    function GetSectorID: TTableID;
    procedure SetContrato(const Value: TTableID);
    procedure SetIdPrestador(const Value: TTableID);
    procedure SetSectorID(const Value: TTableID);
    function GetIdExpediente: TTableID;
    procedure SetIdExpediente(const Value: TTableID);
  public
    procedure DoMostrarEventosAgenda; overload;
    procedure DoMostrarEventosAgendaContrato(AContrato: Integer); overload;
    procedure DoMostrarEventosAgendaExpediente(AIdExpediente: Integer); overload;
    procedure DoMostrarEventosAgendaPrestador(AIdPrestador: Integer); overload;
    property Contrato: TTableID read GetContrato write SetContrato;
    property IdPrestador: TTableID read GetIdPrestador write SetIdPrestador;
    property IdExpediente: TTableID read GetIdExpediente write SetIdExpediente;
    property SectorID: TTableID read GetSectorID write SetSectorID;
  end;

  procedure DoMostrarEventosAgendaContrato(AContrato: Integer);

var
  frmAgendaVistaGenerica: TfrmAgendaVistaGenerica;

implementation

uses
  unFiltros, CustomDlgs, General, unDmPrincipal, unSesion,  DateTimeFuncs, VCLExtra;

{$R *.dfm}

procedure DoMostrarEventosAgendaContrato(AContrato: Integer);
begin
  frmAgendaVistaGenerica := TfrmAgendaVistaGenerica.Create(nil);
  frmAgendaVistaGenerica.DoMostrarEventosAgendaContrato(AContrato);
  frmAgendaVistaGenerica.ShowModal;
end;

procedure TfrmAgendaVistaGenerica.DoMostrarEventosAgenda;
begin
  VCLExtra.LockControls([fraAE_IDPRESTADOR], fraAE_IDPRESTADOR.IsSelected);
  VCLExtra.LockControls([fraAE_IDEXPEDIENTE], fraAE_IDEXPEDIENTE.IsSelected);
  fraVistaEventosGenerica.acActualizar.Execute;
end;

procedure TfrmAgendaVistaGenerica.DoMostrarEventosAgendaContrato(AContrato: Integer);
begin
  fraAE_CONTRATO.Contrato := AContrato;
  DoMostrarEventosAgenda;
end;

procedure TfrmAgendaVistaGenerica.DoMostrarEventosAgendaExpediente(AIdExpediente: Integer);
begin
  fraAE_IDEXPEDIENTE.IdExpediente := AIdExpediente;
  DoMostrarEventosAgenda;
end;

procedure TfrmAgendaVistaGenerica.DoMostrarEventosAgendaPrestador(AIdPrestador: Integer);
begin
  fraAE_IDPRESTADOR.Value := AIdPrestador;
  DoMostrarEventosAgenda;
end;

procedure TfrmAgendaVistaGenerica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with fraVistaEventosGenerica do
  begin
    FormStorage.WriteInteger('GridEventos_Width', GridEventos.Width);
    FormStorage.WriteInteger('pnlDescripcionEvento_Height', pnlDescripcionEvento.Height);
    FormStorage.WriteInteger('pnlDescripcionTarea_Height', pnlDescripcionTarea.Height);
  end;
end;

procedure TfrmAgendaVistaGenerica.FormCreate(Sender: TObject);
begin
  HideTitlebar;
  inherited;
  fraAE_IDPRESTADOR.ShowBajas := True;
  fraAE_IDEXPEDIENTE.ShowBajas := True;
  fraAE_CONTRATO.ShowBajas := True;
  edAE_FECHAALTADesde.Date := DBDate - 180;

  if FormStorage.ReadInteger('GridEventos_Width', 0) = 0 then
  begin
    Self.Height := Screen.Height - 96;
    Self.Width := Screen.Width - 96;
    Self.Top := 48;
    Self.Left := 48;
    FAutoAjustarGrilla := True;
  end else
    FAutoAjustarGrilla := False;

  with fraVistaEventosGenerica do
  begin
    FSQL := sdqEventos.SQL.Text;
    GridEventos.Width := FormStorage.ReadInteger('GridEventos_Width', Screen.Width - 256);
    pnlDescripcionEvento.Height := FormStorage.ReadInteger('pnlDescripcionEvento_Height', 200);
    pnlDescripcionTarea.Height := FormStorage.ReadInteger('pnlDescripcionTarea_Height', 200);
  end;
end;

procedure TfrmAgendaVistaGenerica.fraIDSECTORALTAPropiedadesChange(Sender: TObject);
begin
  inherited;
  fraVistaEventosGenerica.acActualizar.Execute;
end;

procedure TfrmAgendaVistaGenerica.fraVistaEventosPorEmpresaacActualizarExecute(Sender: TObject);
var
  sSQL: String;
begin
  inherited;

  with fraVistaEventosGenerica do
  try
    sSQL := FSQL + DoFiltro(pnlFiltros);
    Verificar(FSQL = sSQL, nil, 'Debe seleccionar al menos un filtro para poder ver los eventos cargados.');

    sSQL := sSQL + iif(SortDialog.OrderBy = '', ' ORDER BY AE_FECHAALTA DESC ', SortDialog.OrderBy);
    sdqEventos.Close;

    OpenQueryEx(sdqEventos, [Sesion.ID, TDateTimeEx.Create(ART_MINFECHA)], sSQL);
    if FAutoAjustarGrilla then
      mnuAjustarGrillaClick(nil);
  except
  end;
end;

procedure TfrmAgendaVistaGenerica.fraVistaEventosPorEmpresaacEliminarEventoExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosGenerica.acEliminarEventoExecute(Sender);
end;

procedure TfrmAgendaVistaGenerica.fraVistaEventosPorEmpresaacLimpiarExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmAgendaVistaGenerica.fraVistaEventosPorEmpresaacModificarEventoExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosGenerica.acModificarEventoExecute(Sender);
end;

procedure TfrmAgendaVistaGenerica.fraVistaEventosPorEmpresaacNuevoEventoExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosGenerica.acNuevoEventoExecute(Sender);
end;

procedure TfrmAgendaVistaGenerica.fraVistaEventosPorEmpresaacOrdenarExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosGenerica.acOrdenarExecute(Sender);
end;

function TfrmAgendaVistaGenerica.GetContrato: TTableID;
begin
  Result := fraAE_CONTRATO.Contrato;
end;

function TfrmAgendaVistaGenerica.GetIdExpediente: TTableID;
begin
  Result := fraAE_IDEXPEDIENTE.IdExpediente;
end;

function TfrmAgendaVistaGenerica.GetIdPrestador: TTableID;
begin
  Result := fraAE_IDPRESTADOR.IdPrestador;
end;

function TfrmAgendaVistaGenerica.GetSectorID: TTableID;
begin
  Result := StrToIntDef(fraIDSECTORALTA.Codigo, 0);
end;

procedure TfrmAgendaVistaGenerica.SetContrato(const Value: TTableID);
begin
  fraAE_CONTRATO.Contrato := Value;
end;

procedure TfrmAgendaVistaGenerica.SetIdExpediente(const Value: TTableID);
begin
  fraAE_IDEXPEDIENTE.IdExpediente := Value;
end;

procedure TfrmAgendaVistaGenerica.SetIdPrestador(const Value: TTableID);
begin
  fraAE_IDPRESTADOR.Value := Value;
end;

procedure TfrmAgendaVistaGenerica.SetSectorID(const Value: TTableID);
begin
  fraIDSECTORALTA.Codigo := IntToStr(Value);
end;

end.
