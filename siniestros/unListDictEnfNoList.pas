unit unListDictEnfNoList;      {creado por TK 4220}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, SinEdit, StdCtrls, Mask, ToolEdit, DateComboBox,
  CheckPanel, CustomDlgs, AnsiSql, unArtFrame, unfraUsuarios,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, unFraEmpresa,
  unArtDbFrame, unFraTrabajador;

type
  TfrmListDictEnfNoList = class(TfrmCustomConsulta)
    chkSiniestro: TCheckPanel;
    edSiniestro: TSinEdit;
    chkFecMarcaENL: TCheckPanel;
    Label8: TLabel;
    dcMarcaDesde: TDateComboBox;
    dcMarcaHasta: TDateComboBox;
    chkFecEvento: TCheckPanel;
    Label1: TLabel;
    dcFecEventoDesde: TDateComboBox;
    dcFecEventoHasta: TDateComboBox;
    chkTrabajador: TCheckPanel;
    fraTrabajador: TfraTrabajador;
    chkEmpresa: TCheckPanel;
    fraEmpresa: TfraEmpresa;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure chkFecEventoChange(Sender: TObject);
    procedure chkSiniestroChange(Sender: TObject);
    procedure QueryPrintReportBegin(Sender: TObject);
    procedure chkEmpresaChange(Sender: TObject);
    procedure chkTrabajadorChange(Sender: TObject);
    procedure chkFecMarcaENLChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListDictEnfNoList: TfrmListDictEnfNoList;

implementation

{$R *.dfm}

procedure TfrmListDictEnfNoList.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  sSql := 'SELECT ex_siniestro, ex_orden, ex_recaida, nl_tarea, nl_enfermedad, nl_obsmarca, ' +
                ' nl_fechamarca, nl_usumarca, ev_codigo, ev_fecha, ev_porcincapacidad, ' +
                ' tj_nombre, tj_cuil, em_nombre, em_cuit ' +
           ' FROM art.sev_eventosdetramite, art.sex_expedientes, afi.aem_empresa, ctj_trabajador, ' +
                ' sin.sei_eventoincapacidad, sin.snl_enfermedadnolistada, sin.sti_tipoeventoinca ' +
          ' WHERE ex_id = nl_idexpediente ' +
            ' AND ev_idexpediente = ex_id ' +
            ' AND ex_idtrabajador = tj_id ' +
            ' AND em_cuit = ex_cuit ' +
            ' AND ev_codigo = ei_codigo ' +
            ' AND ei_tipoevento = ti_id ' +
            ' AND ti_codigo IN (''D'',''H'',''T'') ' +    // "T" = continua tratamiento
            ' AND ev_evento > 0 ' +
            ' AND nl_fechadesmarca IS NULL ' +
            ' AND nl_fechabaja IS NULL ';

  if chkFecMarcaENL.Checked then
    sSql := sSql + ' AND nl_fechamarca BETWEEN ' + dcMarcaDesde.SqlText  +
                                     ' and ' + dcMarcaHasta.SqlText;
  if chkFecEvento.Checked then
    sSql := sSql + ' AND EV_FECHA between ' + SqlDate(dcFecEventoDesde.Date) +
                                    ' and ' + SqlDate(dcFecEventoHasta.Date);
  if chkSiniestro.Checked then
    sSql := sSql + ' AND EX_SINIESTRO = ' + edSiniestro.SiniestroSql +
                   ' AND EX_ORDEN = ' + edSiniestro.OrdenSql +
                   ' AND EX_RECAIDA = ' + edSiniestro.RecaidaSql;

  if chkEmpresa.Checked then
    sSql := sSql + ' AND EM_CUIT = ' + SqlString(fraEmpresa.CUIT, true);

  if chkTrabajador.Checked then
    sSql := sSql + ' AND TJ_CUIL = ' + SqlString(fraTrabajador.CUIL, true);

  sdqConsulta.SQL.Text := sSql;  // saco el OrderBy porque tarda mucho // + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmListDictEnfNoList.tbLimpiarClick(Sender: TObject);
begin
  chkFecEvento.Checked   := False;
  chkFecMarcaENL.Checked := False;
  chkSiniestro.Checked   := False;
  chkTrabajador.Checked  := False;
  chkEmpresa.Checked     := False;
  inherited;
end;

procedure TfrmListDictEnfNoList.chkFecEventoChange(Sender: TObject);
begin
  if not chkFecEvento.Checked then
  begin
    dcFecEventoDesde.Clear;
    dcFecEventoHasta.Clear;
  end;
end;

procedure TfrmListDictEnfNoList.chkSiniestroChange(Sender: TObject);
begin
  if not chkSiniestro.Checked then
    edSiniestro.Clear;
end;

procedure TfrmListDictEnfNoList.QueryPrintReportBegin(Sender: TObject);
begin
  QueryPrint.SubTitle.Lines.Clear;
  if chkSiniestro.Checked then
    QueryPrint.SubTitle.Lines.Add('Siniestro: ' + edSiniestro.SinOrdRec);
  if chkFecMarcaENL.Checked then
    QueryPrint.SubTitle.Lines.Add('Fecha de Marca de ENL: ' + dcMarcaDesde.Text + ' al ' + dcMarcaHasta.Text);
  if chkFecEvento.Checked then
    QueryPrint.SubTitle.Lines.Add('Fecha Evento: ' + dcFecEventoDesde.Text + ' al ' + dcFecEventoHasta.Text);
  if chkTrabajador.Checked then
    QueryPrint.SubTitle.Lines.Add('Trabajador: ' + fraTrabajador.Nombre);
  if chkEmpresa.Checked then
    QueryPrint.SubTitle.Lines.Add('Empresa: ' + fraEmpresa.RazonSocial);
  QueryPrint.SubTitle.Lines.Add('');
end;

procedure TfrmListDictEnfNoList.chkEmpresaChange(Sender: TObject);
begin
  if not chkEmpresa.Checked then
    fraEmpresa.Clear;
end;

procedure TfrmListDictEnfNoList.chkTrabajadorChange(Sender: TObject);
begin
  if not chkTrabajador.Checked then
    fraTrabajador.Clear;
end;

procedure TfrmListDictEnfNoList.chkFecMarcaENLChange(Sender: TObject);
begin
  if not chkFecMarcaENL.Checked then
  begin
    dcMarcaDesde.Clear;
    dcMarcaHasta.Clear;
  end;
end;

end.
