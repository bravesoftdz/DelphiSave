unit unConsultaVisitasAnual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, PeriodoPicker, Vcl.Mask, PatternEdit, unArtDbFrame,
  unFraEmpresa, RxPlacemnt;

type
  TfrmConsultaVisitasAnual = class(TfrmCustomGridABM)
    pnlBottom: TPanel;
    btnSeleccionar: TButton;
    btnNoSeleccionar: TButton;
    pcFilter: TPageControl;
    tbGeneral: TTabSheet;
    tbAfiliaciones: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    edEstablecimiento: TPatternEdit;
    Label2: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label1: TLabel;
    edMes: TPeriodoPicker;
    Label9: TLabel;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
  private
    FPreventorId: integer;
    FVerPanelSeleccion: boolean;
    FEstablecimiento: integer;
    FContrato: integer;
    procedure CargarDetalle;
    procedure SetPreventorId(const Value: integer);
    procedure SetVerPanelSeleccion(const Value: boolean);
    procedure SetContrato(const Value: integer);
    procedure SetEstablecimiento(const Value: integer);
  public
    property PreventorId: integer read FPreventorId write SetPreventorId;
    property Contrato: integer read FContrato write SetContrato;
    property Establecimiento: integer read FEstablecimiento write SetEstablecimiento;
    property VerPanelSeleccion: boolean read FVerPanelSeleccion write SetVerPanelSeleccion;
  protected
    procedure RefreshData; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmConsultaVisitasAnual: TfrmConsultaVisitasAnual;

implementation

uses
  AnsiSql, unEspera, unPlanVisitasDetalle, unCustomConsulta;

{$R *.dfm}

{ TfrmCustomGridABM1 }

procedure TfrmConsultaVisitasAnual.RefreshData;
var
  sSql, sSqlWhere, sWhereMes1, sWhereMes2: String;
begin
  sSqlWhere := '';
  sWhereMes1 := '';
  sWhereMes2 := '';

  if fraPreventorFiltro.IsSelected then
    sSqlWhere := sSqlWhere + ' AND it_id = ' + SqlValue(fraPreventorFiltro.Value);

  if fraCoordinadorFiltro.IsSelected then
    sSqlWhere := sSqlWhere + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);

  if fraEmpresaFiltro.IsSelected then
    sSqlWhere := sSqlWhere + ' AND ps_idempresa = ' + SqlValue(fraEmpresaFiltro.Value);

  if edEstablecimiento.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND ps_estableci IN  ('+edEstablecimiento.Text+')';

  if not edMes.Periodo.IsNull then
  begin
    sWhereMes1 := sWhereMes1 + ' AND TO_CHAR(ps_fechahasta, ''YYYYMM'') = ' + SqlValue(edMes.Periodo.Valor);
    sWhereMes2 := sWhereMes2 + ' AND pv_mes = ' + SqlValue(edMes.Periodo.Valor);
  end;


  sSql := ' SELECT  art.hys.get_nombre_preventor_coord(it_codigo) coordinador, ps_idpreventor, it_nombre, ' +
          '         TO_CHAR(ps_fechahasta, ''YYYYMM'') mes, ' +
          '          SUM(CASE ' +
          '                WHEN ps_fechabaja IS NULL ' +
          '                AND ps_tipovisita NOT IN(3, 5) ' +
          '                AND NOT(    ps_tipovisita = 1 ' +
          '                        AND ps_visitaotroperiodo = ''S'') THEN 1 ' +
          '                ELSE 0 ' +
          '              END) total, ' +
          '          art.hys_plan.get_cantidadvisitasmax(TO_DATE(TO_CHAR(ps_fechahasta, ''YYYYMM''), ''YYYYMM''), ' +
          '                                              LAST_DAY(TO_DATE(TO_CHAR(ps_fechahasta, ''YYYYMM''), ''YYYYMM'')), ' +
          '                                              ps_idpreventor, TO_DATE(TO_CHAR(ps_fechahasta, ''YYYYMM''), ''YYYYMM'')) visitamax, ' +
          '          (art.hys_plan.get_cantidadvisitasmax(TO_DATE(TO_CHAR(ps_fechahasta, ''YYYYMM''), ''YYYYMM''), ' +
          '                                              LAST_DAY(TO_DATE(TO_CHAR(ps_fechahasta, ''YYYYMM''), ''YYYYMM'')), ' +
          '                                              ps_idpreventor, TO_DATE(TO_CHAR(ps_fechahasta, ''YYYYMM''), ''YYYYMM'')) ' +
          '           - SUM(CASE ' +
          '                   WHEN ps_fechabaja IS NULL ' +
          '                   AND ps_tipovisita NOT IN(3, 5) ' +
          '                   AND (NOT(    ps_tipovisita = 1 ' +
          '                            AND ps_visitaotroperiodo = ''S'')) THEN 1 ' +
          '                   ELSE 0 ' +
          '                 END)) diferencia ' +
          '     FROM art.pit_firmantes, hys.hps_planhys, hys.hpv_procesovisita ' +
          '    WHERE pv_id = ps_idproceso ' +
          '      AND it_id = ps_idpreventor ' +
          '      AND pv_id = 99 ' +
          '      AND ps_fechahasta <= pv_fechafinal ' + sSqlWhere +  sWhereMes1 +
          ' GROUP BY ps_idpreventor, it_codigo, it_nombre, TO_CHAR(ps_fechahasta, ''YYYYMM'') ' +
          ' UNION ALL ' +
          ' SELECT   art.hys.get_nombre_preventor_coord(it_codigo) coordinador, ps_idpreventor, it_nombre, ' +
          '          pv_mes mes, ' +
          '          SUM(CASE ' +
          '                WHEN ps_fechabaja IS NULL ' +
          '                AND ps_tipovisita NOT IN(3, 5) ' +
          '                AND NOT(    ps_tipovisita = 1 ' +
          '                        AND ps_visitaotroperiodo = ''S'') THEN 1 ' +
          '                ELSE 0 ' +
          '              END) total, ' +
          '          art.hys_plan.get_cantidadvisitasmax(pv_id, ps_idpreventor, pv_fechainicial) visitamax, ' +
          '          (art.hys_plan.get_cantidadvisitasmax(pv_id, ps_idpreventor, pv_fechainicial) ' +
          '           - SUM(CASE ' +
          '                   WHEN ps_fechabaja IS NULL ' +
          '                   AND ps_tipovisita NOT IN(3, 5) ' +
          '                   AND (NOT(    ps_tipovisita = 1 ' +
          '                            AND ps_visitaotroperiodo = ''S'')) THEN 1 ' +
          '                   ELSE 0 ' +
          '                 END)) diferencia ' +
          '     FROM art.pit_firmantes, hys.hps_planhys, hys.hpv_procesovisita ' +
          '    WHERE pv_id = ps_idproceso ' +
          '      AND it_id = ps_idpreventor ' +
          '      AND pv_id = art.hys_plan.get_idproceso(''M'', TRUNC(SYSDATE, ''MM''), LAST_DAY(TRUNC(SYSDATE, ''MM''))) ' + sSqlWhere + sWhereMes2 +
          ' GROUP BY ps_idpreventor, it_codigo, it_nombre, pv_id, pv_fechainicial, pv_mes';

  if SortDialog.OrderBy = '' then
    sdqConsulta.Sql.Text := sSql + ' ORDER BY it_nombre, mes '
  else
    sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmConsultaVisitasAnual.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (Field.FieldName = 'TOTAL') then
  begin
    if not sdqConsulta.FieldByName('visitamax').IsNull then
    begin
      if sdqConsulta.FieldByName('total').AsInteger > sdqConsulta.FieldByName('visitamax').AsInteger then
        Background := clRed;
      if sdqConsulta.FieldByName('total').AsInteger < sdqConsulta.FieldByName('visitamax').AsInteger then
        Background := clGreen;
    end;

    if (sdqConsulta.FieldByName('visitamax').IsNull) or (sdqConsulta.FieldByName('total').AsInteger = sdqConsulta.FieldByName('visitamax').AsInteger) then
    begin
      Background := clYellow;
      AFont.Color := clWindowText;
    end;
  end;
end;

procedure TfrmConsultaVisitasAnual.CargarDetalle;
var
  bmk: TBookmark;
begin
  if sdqConsulta.IsEmpty then Exit;

  bmk := self.sdqConsulta.GetBookmark;
  IniciarEspera; //Pongo esto aca porque por algun error de la grilla me selecciona el primer item cuando
                 //esta tiene registros hasta el final
  with TfrmPlanVisitasDetalle.Create(self) do
  try
    FormStyle := fsNormal;
    Visible := false;

    IdProceso := 99;

    Prioritarias := true;
    Compensatorias := false;
    CompensatoriasOtroPeriodo := false;
    CompensatoriasManual := false;
    NoProgramadas := false;
    Emergentes := false;
    PrioritariasOtroPeriodo := false;
    EmergentesOtroPeriodo := false;

    Contrato := self.fraEmpresaFiltro.Contrato;
    Establecimiento := self.edEstablecimiento.Text;

    if self.sdqConsulta.fieldbyname('ps_idpreventor').IsNull then
    begin
      PreventorId := -1;
      chkSinPreventor.Checked := true;
    end
    else begin
      PreventorId := self.sdqConsulta.fieldbyname('ps_idpreventor').AsInteger;
      chkSinPreventor.Checked := false;
    end;

    VerPendientes := false;
    VerParciales := false;
    VerTerminados := false;
    VerTerminadasUcap := false;

    DetenerEspera;
    tbRefrescarClick(self);
    ShowModal;
    self.tbRefrescar.Click;
  finally
    free;
    self.sdqConsulta.GotoBookmark(bmk);
  end;
end;

procedure TfrmConsultaVisitasAnual.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmConsultaVisitasAnual.SetContrato(const Value: integer);
begin
  FContrato := Value;
  fraEmpresaFiltro.Contrato := Value;
end;

procedure TfrmConsultaVisitasAnual.SetEstablecimiento(const Value: integer);
begin
  FEstablecimiento := Value;
  edEstablecimiento.Text := IntToStr(Value);
end;

procedure TfrmConsultaVisitasAnual.SetPreventorId(const Value: integer);
begin
  FPreventorId := Value;
  fraPreventorFiltro.Value := Value;
end;

procedure TfrmConsultaVisitasAnual.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := false;
  pcFilter.ActivePageIndex := 0;

  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraCoordinadorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ExtraCondition := ' AND IT_IDROLPREVENTOR >= 5 '; 
    ShowBajas := true;
  end;
end;

procedure TfrmConsultaVisitasAnual.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  edMes.Clear;
  fraEmpresaFiltro.Clear;
  edEstablecimiento.Clear;
end;

procedure TfrmConsultaVisitasAnual.SetVerPanelSeleccion(
  const Value: boolean);
begin
  FVerPanelSeleccion := Value;
  pnlBottom.Visible := Value;
end;

procedure TfrmConsultaVisitasAnual.btnSeleccionarClick(Sender: TObject);
begin
  inherited;
  PreventorId := sdqConsulta.fieldbyname('ps_idpreventor').AsInteger;
  ModalResult := mrOk;
end;

procedure TfrmConsultaVisitasAnual.ClearControls;
begin
  inherited;
end;

procedure TfrmConsultaVisitasAnual.LoadControls;
begin
  inherited;
end;

function TfrmConsultaVisitasAnual.Validar: Boolean;
begin
  result := true;
end;

end.
