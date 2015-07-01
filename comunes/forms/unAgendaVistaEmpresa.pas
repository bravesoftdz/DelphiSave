unit unAgendaVistaEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ExtCtrls, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraVistaEventos, ImgList, XPMenu, Placemnt, unFraEmpresa,
  StdCtrls, JvgGroupBox, unfraEmpresaAGENDA, unFraTitulo, unFraCodDesc, unArt,
  unFraCodigoDescripcion;

type
  TfrmAgendaVistaEmpresa = class(TfrmCustomForm)
    fraVistaEventosPorEmpresa: TfraVistaEventos;
    pnlFiltros: TPanel;
    gbFiltrosEmpresa: TJvgGroupBox;
    fraAE_CONTRATO: TfraEmpresaAGENDA;
    fraTituloVistaEmpresa: TfraTitulo;
    gbCondicionesAdicionales: TJvgGroupBox;
    Label19: TLabel;
    fraIDSECTORALTA: TfraCodDesc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacActualizarExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacEliminarEventoExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacLimpiarExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacModificarEventoExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacNuevoEventoExecute(Sender: TObject);
    procedure fraVistaEventosPorEmpresaacOrdenarExecute(Sender: TObject);
    procedure fraIDSECTORALTAPropiedadesChange(Sender: TObject);
  private
    FSQL: String;
    function GetContrato: TTableID;
    procedure SetContrato(const Value: TTableID);
    function GetSectorID: TTableID;
    procedure SetSectorID(const Value: TTableID);
  public
    property Contrato: TTableID read GetContrato write SetContrato;
    property SectorID: TTableID read GetSectorID write SetSectorID;
    procedure DoMostrarEventosAgenda(AContrato: Integer); overload;
    procedure DoMostrarEventosAgenda; overload;
  end;

  procedure DoMostrarEventosAgenda(AContrato: Integer);

var
  frmAgendaVistaEmpresa: TfrmAgendaVistaEmpresa;

implementation

uses
  unFiltros, CustomDlgs, General, unDmPrincipal, unSesion,  DateTimeFuncs, VCLExtra;

{$R *.dfm}

procedure DoMostrarEventosAgenda(AContrato: Integer);
begin
  frmAgendaVistaEmpresa := TfrmAgendaVistaEmpresa.Create(nil);
  frmAgendaVistaEmpresa.DoMostrarEventosAgenda(AContrato);
  frmAgendaVistaEmpresa.ShowModal;
end;

procedure TfrmAgendaVistaEmpresa.FormCreate(Sender: TObject);
begin
  HideTitlebar;
  inherited;
  fraAE_CONTRATO.ShowBajas := True;

  with fraVistaEventosPorEmpresa do
  begin
    FSQL := sdqEventos.SQL.Text;
    GridEventos.Width := FormStorage.ReadInteger('GridEventos_Width', 478);
    pnlDescripcionEvento.Height := FormStorage.ReadInteger('pnlDescripcionEvento_Height', 478);
    pnlDescripcionTarea.Height := FormStorage.ReadInteger('pnlDescripcionTarea_Height', 478);
  end;
end;

procedure TfrmAgendaVistaEmpresa.DoMostrarEventosAgenda(AContrato: Integer);
begin
  fraAE_CONTRATO.Contrato := AContrato;
  DoMostrarEventosAgenda;
end;

procedure TfrmAgendaVistaEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with fraVistaEventosPorEmpresa do
  begin
    FormStorage.WriteInteger('GridEventos_Width', GridEventos.Width);
    FormStorage.WriteInteger('pnlDescripcionEvento_Height', pnlDescripcionEvento.Height);
    FormStorage.WriteInteger('pnlDescripcionTarea_Height', pnlDescripcionTarea.Height);
  end;
end;

procedure TfrmAgendaVistaEmpresa.fraVistaEventosPorEmpresaacActualizarExecute(Sender: TObject);
var
  sSQL: String;
begin
  inherited;

  with fraVistaEventosPorEmpresa do
  try
    sSQL := FSQL + DoFiltro(pnlFiltros);
    Verificar(FSQL = sSQL, nil, 'Debe seleccionar al menos un filtro para poder ver los eventos cargados.');

    sSQL := sSQL + iif(SortDialog.OrderBy = '', ' ORDER BY AE_FECHAALTA DESC ', SortDialog.OrderBy);
    sdqEventos.Close;

    OpenQueryEx(sdqEventos, [Sesion.ID, TDateTimeEx.Create(ART_MINFECHA)], sSQL);
  except
  end;
end;

procedure TfrmAgendaVistaEmpresa.fraVistaEventosPorEmpresaacEliminarEventoExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosPorEmpresa.acEliminarEventoExecute(Sender);
end;

procedure TfrmAgendaVistaEmpresa.fraVistaEventosPorEmpresaacLimpiarExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmAgendaVistaEmpresa.fraVistaEventosPorEmpresaacModificarEventoExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosPorEmpresa.acModificarEventoExecute(Sender);
end;

procedure TfrmAgendaVistaEmpresa.fraVistaEventosPorEmpresaacNuevoEventoExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosPorEmpresa.acNuevoEventoExecute(Sender);
end;

procedure TfrmAgendaVistaEmpresa.fraVistaEventosPorEmpresaacOrdenarExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventosPorEmpresa.acOrdenarExecute(Sender);
end;

procedure TfrmAgendaVistaEmpresa.fraIDSECTORALTAPropiedadesChange(Sender: TObject);
begin
  inherited;
  fraVistaEventosPorEmpresa.acActualizar.Execute;
end;

function TfrmAgendaVistaEmpresa.GetContrato: TTableID;
begin
  Result := fraAE_CONTRATO.Contrato;
end;

procedure TfrmAgendaVistaEmpresa.SetContrato(const Value: TTableID);
begin
  fraAE_CONTRATO.Contrato := Value;
end;

function TfrmAgendaVistaEmpresa.GetSectorID: TTableID;
begin
  Result := StrToIntDef(fraIDSECTORALTA.Codigo, 0);
end;

procedure TfrmAgendaVistaEmpresa.SetSectorID(const Value: TTableID);
begin
  fraIDSECTORALTA.Codigo := IntToStr(Value);
end;

procedure TfrmAgendaVistaEmpresa.DoMostrarEventosAgenda;
begin
  VCLExtra.LockControls([fraAE_CONTRATO], True);
  fraVistaEventosPorEmpresa.acActualizar.Execute;
end;

end.
