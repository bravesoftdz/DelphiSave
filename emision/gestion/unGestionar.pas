unit unGestionar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, FSForm, unDmPrincipal, unCustomConsulta, unFrmConsultaNotas, {unAdministracionEventosEMISION, }
  unConsultaGestiones, unCustomForm, StdCtrls, ExtCtrls, unFrmAdministracionNominas,
  unAgendaCargaConsulta;

type
  TfrmGestionar = class(TfrmCustomForm)
    pcGestionar: TPageControl;
    tbGestion: TTabSheet;
    tbEventosSGC: TTabSheet;
    tbNotas: TTabSheet;
    Panel1: TPanel;
    lblInformacion: TListBox;
    Label1: TLabel;
    tbNominas: TTabSheet;
    tsSIC: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FContrato: integer;
    FfrmConsultaNotas: TfrmConsultaNotas;
    FfrmConsultaGestiones: TfrmConsultaGestiones;
    //FfrmAdministracionEventosEMISION: TfrmAdministracionEventosEMISION;
    FfrmAdministracionNominas: TfrmAdministracionNominas;
    procedure setContrato(const Value: integer);
    //procedure LimpiarConsultaAdministracionEventos(Sender: TObject);
    procedure LimpiarConsultaNotas(Sender: TObject);
    procedure LimpiarConsultaGestiones(Sender: TObject);
    procedure LimpiarConsultaNominas(Sender: TObject);
    procedure CargarInformacionAdic;
  public
    property Contrato: integer read FContrato write setContrato;
    procedure RefrescarFormularios;
  end;


var
  frmGestionar: TfrmGestionar;

implementation

uses
  AnsiSql, unConstEmision, DB;

{$R *.dfm}

procedure TfrmGestionar.CargarInformacionAdic;
var
  sSql: String;
begin
  sSql  := ' SELECT SUM(DECODE(ge_obligatorio, ''S'', 1, 0)) Obligatorio, COUNT(*) Pendientes ' +
           ' FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.ids_detallesublote, ' +
           '      art.use_usuarios, emi.isl_sublote, emi.ilo_lote ' +
           ' WHERE sl_idlote = lo_id ' +
           '   AND se_id = sl_idusuariogestion ' +
           '   AND ds_idsublote = sl_id ' +
           '   AND dg_iddetallesublote = ds_id ' +
           '   AND ge_id = dg_idgestionable ' +
           '   AND sl_fechabaja is null ' +
           '   AND ds_fechabaja is null ' +
           '   AND dg_fechabaja is null ' +
           '   AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
           '   AND dg_idestadogestion <> ' + SqlValue(GESTION_FINALIZADA) +
           '   AND ds_contrato = ' + SqlValue(FContrato);

  with GetQuery(sSql) do
  try
    if FieldByName('Pendientes').AsInteger > 0 then
      lblInformacion.Items.Add('Existen Gestiones Pendientes');
    if FieldByName('Obligatorio').AsInteger > 0 then
      lblInformacion.Items.Add('Existen Gestiones Obligatorias');
  finally
    free;
  end;

end;

procedure TfrmGestionar.FormCreate(Sender: TObject);
begin
  pcGestionar.ActivePageIndex := 0;

  FfrmConsultaGestiones := TfrmConsultaGestiones.Create(self);
  with FfrmConsultaGestiones do
  begin
    FormStyle := fsNormal;
    fraEmpresa.Locked := true;
    tbLimpiar.OnClick := LimpiarConsultaGestiones;
    WindowState := wsNormal;
    Parent := tbGestion;
    Align := alClient;
    BorderStyle := bsNone;
    tbModificar.Visible := false;
    tbNuevo.Visible := true;
    tbSalir.Visible := false;
    Visible := true;
    ModoForm := mfConsulta;
  end;

  {
  FfrmAdministracionEventosEMISION := TfrmAdministracionEventosEMISION.Create(self);
  with FfrmAdministracionEventosEMISION do
  begin
    FormStyle := fsNormal;
    fraFiltroEmpresa.Locked := true;
    gbFiltrosEventos.Collapse(true);
    tbSalir.Visible := false;
    tbLimpiar.OnClick := LimpiarConsultaAdministracionEventos;
    chkSoloSector.Checked := true;
    WindowState := wsNormal;
    Parent := tbEventosSGC;
    tbSalir.Visible := false;
    tbSalir2.Visible := false;
    Align := alClient;
    BorderStyle := bsNone;
    Visible := true;
  end;
  }

  FfrmConsultaNotas := TfrmConsultaNotas.Create(self);
  with FfrmConsultaNotas do
  begin
    FormStyle := fsNormal;
    fraEmpresaNota.Locked := true;
    tbSalir.Visible := false;
    tbLimpiar.OnClick := LimpiarConsultaNotas;
    WindowState := wsNormal;
    Parent := tbNotas;
    Align := alClient;
    BorderStyle := bsNone;
    Visible := true;
  end;

  FfrmAdministracionNominas:= TfrmAdministracionNominas.Create(self);
  with FfrmAdministracionNominas do
  begin
    FormStyle := fsNormal;
    Visible := false;
    tbSalir.Visible := false;
    tsProcesosEmision.TabVisible := false;
    fraEmpresaPresentacion.Locked := true;
    tbLimpiar.OnClick := LimpiarConsultaNominas;
    WindowState := wsNormal;
    Parent := tbNominas;
    Align := alClient;
    BorderStyle := bsNone;
    Visible := true;
  end;

end;
{
procedure TfrmGestionar.LimpiarConsultaAdministracionEventos(Sender: TObject);
begin
  FfrmAdministracionEventosEMISION.tbLimpiarClick(Sender);
  setContrato(FContrato);
end;
}
procedure TfrmGestionar.LimpiarConsultaGestiones(Sender: TObject);
begin
  FfrmConsultaGestiones.tbLimpiarClick(Sender);
  setContrato(FContrato);
end;

procedure TfrmGestionar.LimpiarConsultaNominas(Sender: TObject);
begin
  FfrmAdministracionNominas.tbLimpiarClick(Sender);
  setContrato(FContrato);
end;

procedure TfrmGestionar.LimpiarConsultaNotas(Sender: TObject);
begin
  FfrmConsultaNotas.tbLimpiarClick(Sender);
  setContrato(FContrato);
end;

procedure TfrmGestionar.RefrescarFormularios;
begin
  FfrmConsultaGestiones.tbRefrescar.Click;
  //FfrmAdministracionEventosEMISION.tbRefrescar.Click;
  FfrmConsultaNotas.tbRefrescar.Click;
  FfrmAdministracionNominas.tbRefrescar.Click;
end;

procedure TfrmGestionar.setContrato(const Value: integer);
begin
  if (FContrato <> Value) then
  begin
    FContrato := Value;
    CargarInformacionAdic;
  end;

  FfrmConsultaNotas.fraEmpresaNota.Contrato := FContrato;
  //FfrmAdministracionEventosEMISION.fraFiltroEmpresa.Contrato := FContrato;
  FfrmConsultaGestiones.fraEmpresa.Contrato := FContrato;
  FfrmAdministracionNominas.fraEmpresaPresentacion.Contrato := FContrato;
  FfrmAdministracionNominas.EmpresaOnchange(self);
end;

procedure TfrmGestionar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FfrmConsultaNotas.Close;
  //FfrmAdministracionEventosEMISION.Close;
  FfrmConsultaGestiones.Close;
  FfrmAdministracionNominas.Close;
  inherited;
end;

end.
