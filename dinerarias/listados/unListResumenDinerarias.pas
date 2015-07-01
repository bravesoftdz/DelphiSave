unit unListResumenDinerarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unFraTrabajador, unFraTrabajadorSiniestro,
  Mask, ToolEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmListResumenDinerarias = class(TfrmCustomConsulta)
    lbCUIT: TLabel;
    Label1: TLabel;
    CUIL: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label35: TLabel;
    fraEmpresa: TfraEmpresa;
    edSinFecha: TDateEdit;
    fraTrabajadorSIN: TfraTrabajadorSiniestro;
    edDELEGACION: TEdit;
    edJUICIO: TEdit;
    edEX_ESTADO: TEdit;
    gbEventos: TGroupBox;
    rbEstadoTodos: TRadioButton;
    rbEstadoActivos: TRadioButton;
    GroupBox8: TGroupBox;
    rbAntigTodos: TRadioButton;
    rbAntigUltimo: TRadioButton;
    edEX_TIPO: TEdit;
    Label39: TLabel;
    Label48: TLabel;
    edEX_GRAVEDAD: TEdit;
    Bevel9: TBevel;
    gbConcepto: TGroupBox;
    rbTipoTodos: TRadioButton;
    rbTipoILT: TRadioButton;
    rbTipoILP: TRadioButton;
    rbTipoMort: TRadioButton;
    sdqBusqueda: TSDQuery;
    dsBusqueda: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    Siniestro, Orden, Recaida, IdExpediente: Integer;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure DoCargarLiquidaciones;
    procedure DoLimpiarDatos;
  public
    { Public declarations }
  end;

var
  frmListResumenDinerarias: TfrmListResumenDinerarias;

implementation

uses unComunes, General, CustomDlgs, unSiniestros, SqlFuncs, AnsiSql;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.FormCreate(Sender: TObject);
begin
  inherited;
  fraTrabajadorSIN.OnChange             := OnTrabajadorChange;
  fraEmpresa.OnChange                   := OnEmpresaChange;
  fraEmpresa.ShowBajas                  := True;
  fraTrabajadorSIN.MostrarRelaLaboral   := True;
  fraTrabajadorSIN.SinEstablecimiento   := True;
  fraTrabajadorSIN.SoloSiniestrados     := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.OnEmpresaChange(Sender: TObject);
begin
  fraTrabajadorSIN.CUIL := fraEmpresa.CUIT;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.OnTrabajadorChange(Sender: TObject);
begin
  fraEmpresa.Value := fraTrabajadorSIN.IdEmpresa;
  DoCargarLiquidaciones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.DoCargarLiquidaciones;
begin
  DoLimpiarDatos;
  if fraTrabajadorSIN.edSiniestro.IsEmpty then Exit;

  Siniestro    := fraTrabajadorSIN.edSiniestro.Siniestro;
  Orden        := fraTrabajadorSIN.edSiniestro.Orden;
  Recaida      := fraTrabajadorSIN.edSiniestro.Recaida;
  IdExpediente := Get_IdExpediente(Siniestro, Orden, Recaida);

  //---------------------------------------------------------------------------//
  with sdqBusqueda do
  begin
    Close;
    ParamByName('pIdExped').AsInteger := IdExpediente;
    Open;
  end;
  //---------------------------------------------------------------------------//
  if sdqBusqueda.Eof then
  begin
    ChkDialog('liqincapac_NoSini', 'No existe el siniestro buscado. Verifique los datos ingresados.', 'Error de Busqueda', '', mtInformation);
    Exit;
  end
  else begin
    //------------------------------------------------------------------------//
    if fraEmpresa.mskCUIT.Text <> sdqBusqueda.FieldByName('ex_cuit').AsString then
      fraEmpresa.CUIT := sdqBusqueda.FieldByName('ex_cuit').AsString;
    //------------------------------------------------------------------------//
    if fraTrabajadorSIN.CUIL <> sdqBusqueda.FieldByName('ex_cuil').AsString then
      fraTrabajadorSIN.CUIL := sdqBusqueda.FieldByName('ex_cuil').AsString;
    //------------------------------------------------------------------------//
    edSinFecha.Date         := sdqBusqueda.FieldByName('ex_fechaaccidente').AsDateTime;
    edDELEGACION.Text       := sdqBusqueda.FieldByName('delegacion').AsString;
    edEX_ESTADO.Text        := sdqBusqueda.FieldByName('estado').AsString;
    if sdqBusqueda.FieldByName('ex_causafin').IsNull then
    begin
      edEX_ESTADO.Font.Color := clBlack;
      edEX_ESTADO.Font.Style := edEX_ESTADO.Font.Style - [fsBold];
    end
    else begin
      edEX_ESTADO.Font.Color := clRed;
      edEX_ESTADO.Font.Style := edEX_ESTADO.Font.Style + [fsBold];
    end;
    edJUICIO.Text           := sdqBusqueda.FieldByName('juicio').AsString;
    edJUICIO.Hint           := sdqBusqueda.FieldByName('juicio').AsString;
    edEX_GRAVEDAD.Text      := NVL(sdqBusqueda.FieldByName('gravedad').AsString, '-');
    edEX_TIPO.Text          := sdqBusqueda.FieldByName('tipo').AsString;
    //------------------------------------------------------------------------//
    if Trim(edJUICIO.Text) > '' then
      InfoHint(edJUICIO, 'Existe uno o más juicios para el siniestro seleccionado.');

    if AreIn(sdqBusqueda.FieldByName('ex_causafin').AsString, ['99','95']) then
      MsgBox('El siniestro seleccionado ha sido cerrado por error de carga', MB_ICONEXCLAMATION);

    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.tbLimpiarClick(Sender: TObject);
begin
  DoLimpiarDatos;
  fraEmpresa.Clear;
  fraTrabajadorSIN.Clear;
  rbAntigTodos.Checked    := True;
  rbEstadoActivos.Checked := True;
  rbTipoTodos.Checked     := True;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT cp_denpago, cp_tipo, le_tipoliqui, ' +
                ' le_estado, le_fproceso, le_fechades, le_fechahas, ' +
                ' DECODE(cp_tipo, ''P'', ''Incapacidades'', ''M'', ''Mortales'', ' +
                                 ' ''I'', DECODE(le_tipoliqui, ''D'', ''ILT Pago Directo'', ''L'', ''Reintegro'')) tipoliq, ' +
                ' CASE ' +
                  ' WHEN(le_estado IN(''C'', ''M'', ''R'')) THEN ''En proceso'' ' +
                  ' ELSE art.liq.get_estadoliquidacionilp(le_tipoliqui, le_estado) ' +
                ' END AS estado ' +
           ' FROM art.sle_liquiempsin, art.scp_conpago ' +
          ' WHERE le_conpago = cp_conpago ' +
            ' AND le_siniestro = ' + SqlInt(Siniestro) +
            ' AND le_orden = ' + SqlInt(Orden) +
            ' AND le_recaida = ' + SqlInt(Recaida);

  sSql := sSql + IIF(rbEstadoActivos.Checked, ' AND NVL(le_estado, '' '') <> ''A'' ', '');
  sSql := sSql + IIF(rbAntigUltimo.Checked, ' AND le_fproceso > TRUNC(SysDate) - 365 ', '');
  if rbTipoTodos.Checked then
    sSql := sSql + ' AND cp_tipo IN(''M'', ''P'', ''I'') '
  else if rbTipoILT.Checked then
    sSql := sSql + ' AND cp_tipo = ''I'' '
  else if rbTipoILP.Checked then
    sSql := sSql + ' AND cp_tipo = ''P'' '
  else if rbTipoMort.Checked then
    sSql := sSql + ' AND cp_tipo = ''M'' ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.DoLimpiarDatos;
begin
  edSinFecha.Clear;
  edDELEGACION.Clear;
  edEX_ESTADO.Clear;
  edJUICIO.Clear;
  edJUICIO.Hint := '';
  edEX_GRAVEDAD.Clear;
  edEX_TIPO.Clear;
  Siniestro    := 0;
  Orden        := 0;
  Recaida      := 0;
  IdExpediente := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Title.Text := 'Resumen de liquidaciones - Siniestro: ' + sdqBusqueda.FieldByName('sincompleto').AsString;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListResumenDinerarias.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not Highlight then
  begin
    if sdqConsulta.FieldByName('le_tipoliqui').AsString = 'W' then
      AFont.Color := clGreen
    else begin
      if sdqConsulta.FieldByName('le_estado').AsString = 'A'  then
        AFont.Color := clRed
      else if sdqConsulta.FieldByName('le_estado').AsString = 'X'  then
        AFont.Color := clSilver
      else if sdqConsulta.FieldByName('le_estado').AsString = 'E'  then
        AFont.Color := clBlue;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
end.
