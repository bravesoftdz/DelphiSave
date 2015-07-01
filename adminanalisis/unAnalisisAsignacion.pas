unit unAnalisisAsignacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unfraEstablecimiento_OLD, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, StdCtrls, Mask, ToolEdit,
  DateComboBox, ExComboBox, PatternEdit, ComboEditor, CheckCombo;

type
  TCodigoEstado = class
  private
    FEstado: String;
  public
    property Estado: String read FEstado;
    constructor Create(aCodigoEstado: String); overload;
  end;

  TfrmAnalisisAsignacion = class(TfrmCustomConsulta)
    Bevel2: TBevel;
    lbCUIT: TLabel;
    fraEmpresa: TfraEmpresa;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    lblFechaRelev: TLabel;
    edFechaRelevDesde: TDateComboBox;
    lblRelevHasta: TLabel;
    edFechaRelevHasta: TDateComboBox;
    chkRelevConLotes: TCheckBox;
    edFechaNotifHasta: TDateComboBox;
    Label1: TLabel;
    edFechaNotifDesde: TDateComboBox;
    Label2: TLabel;
    Label20: TLabel;
    cbEstadoSubLote: TCheckCombo;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
  private
    procedure OnEmpresaChange(Sender : TObject);
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

var
  frmAnalisisAsignacion: TfrmAnalisisAsignacion;

implementation

uses
  AnsiSql;

{$R *.dfm}

{ TfrmCustomConsulta1 }

procedure TfrmAnalisisAsignacion.ClearData;
begin
  inherited;

end;

procedure TfrmAnalisisAsignacion.RefreshData;
var
  sSQL1, sSQL2,
  sOrderBy, SWhere,
  SWhere1, SWhere2, sIn: String;
  i: integer;
begin
  sSQL1:= ' SELECT  hcn.cn_cuit, em_nombre, hcn.cn_estableci, es_nombre, hcn.cn_fecharelevamiento, her.er_descripcion estado, ' +
          '         DECODE(el_operativo, ''A'', ''Anual'', ''S'', ''Semestral'', el_operativo) operativo, le_fechanotificacion, el_idlote, de_descripcion, ' +
          '         (SELECT COUNT (DISTINCT dl_idtrabajador) ' +
          '          FROM hys.hdl_detallelote ' +
          '          WHERE dl_idlote = el_idlote ' +
          '          AND dl_idestableci = es_id) canttrab,cn_consemestral, ' +
          '         (SELECT ep_fechaultrelev '+
          '            FROM hys.hep_estabporpreventor '+
          '           WHERE ep_cuit = cn_cuit '+
          '             AND ep_estableci = cn_estableci) fechaultrelev, '+
          '         (SELECT MIN(dl_fecharealizacion) ' +
          '          FROM hys.hdl_detallelote ' +
          '          WHERE dl_idlote = el_idlote ' +
          '          AND dl_idestableci = es_id) fechaprimerexamen ' +
          ' FROM hys.hcn_cabeceranomina hcn ' +
          '      INNER JOIN hys.her_estadorelevamiento her ON cn_idestado = er_id ' +
          '      INNER JOIN afi.aem_empresa ON em_cuit = cn_cuit ' +
          '      INNER JOIN afi.aco_contrato ON co_idempresa = em_id AND NVL(art.afiliacion.get_contratovigente(cn_cuit, cn_fecharelevamiento), art.get_vultcontrato(cn_cuit)) = co_contrato ' +
          '      INNER JOIN afi.aes_establecimiento ON es_contrato = co_contrato AND es_nroestableci = cn_estableci ' +
          '      INNER JOIN hys.hrl_relevamientolote hrl ON hrl.rl_idestableci = es_id AND hrl.rl_fecha = hcn.cn_fecharelevamiento ' +
          '      INNER JOIN hys.hel_estadolote hel ON el_rlid = rl_id ' +
          '      INNER JOIN hys.hle_loteestudio ON le_id = el_idlote ' +
          '      INNER JOIN hys.hde_descripcionestadolote ON el_estado = de_codigo ' +
          ' WHERE le_reconfirmacion = ''N'' ';

  sSQL2:= ' UNION ALL ' +
          ' SELECT   hcn.cn_cuit, em_nombre, hcn.cn_estableci, es_nombre, hcn.cn_fecharelevamiento, her.er_descripcion estado, NULL, NULL, ' +
          '          NULL, NULL, 0, cn_consemestral, ' +
          '         (SELECT ep_fechaultrelev '+
          '            FROM hys.hep_estabporpreventor '+
          '           WHERE ep_cuit = cn_cuit '+
          '             AND ep_estableci = cn_estableci) fechaultrelev, '+
          '         NULL ' +
          ' FROM hys.hcn_cabeceranomina hcn ' +
          '      INNER JOIN hys.her_estadorelevamiento her ON cn_idestado = er_id ' +
          '      INNER JOIN afi.aem_empresa ON em_cuit = cn_cuit ' +
          '      INNER JOIN afi.aco_contrato ON co_idempresa = em_id AND NVL(art.afiliacion.get_contratovigente(cn_cuit, cn_fecharelevamiento), art.get_vultcontrato(cn_cuit)) = co_contrato ' +
          '      INNER JOIN afi.aes_establecimiento ON es_contrato = co_contrato AND es_nroestableci = cn_estableci ' +
          ' WHERE NOT EXISTS(SELECT 1 ' +
          '                    FROM hys.hrl_relevamientolote hrl ' +
          '                   WHERE hrl.rl_idestableci = es_id ' +
          '                     AND hrl.rl_fecha = hcn.cn_fecharelevamiento) ';

  if fraEmpresa.IsSelected then
    SWhere := SWhere + ' AND CN_CUIT = ' +  SqlValue(fraEmpresa.CUIT);

  if fraEstablecimiento.IsSelected then
    SWhere := SWhere + ' AND CN_ESTABLECI = ' +  SqlValue(fraEstablecimiento.edCodigo.Value);

  if edFechaRelevDesde.Date > 0 then
    SWhere := SWhere + ' AND CN_FECHARELEVAMIENTO >= ' +  SqlValue(edFechaRelevDesde.Date);

  if edFechaRelevHasta.Date > 0 then
    SWhere := SWhere + ' AND CN_FECHARELEVAMIENTO <= ' +  SqlValue(edFechaRelevHasta.Date);

  if edFechaNotifDesde.Date > 0 then
  begin
    SWhere1 := SWhere1 + ' AND LE_FECHANOTIFICACION >= ' +  SqlValue(edFechaNotifDesde.Date);
    SWhere2 := SWhere2 + ' AND 1=2';
  end;

  if edFechaNotifHasta.Date > 0 then
  begin
    SWhere1 := SWhere1 + ' AND LE_FECHANOTIFICACION <= ' +  SqlValue(edFechaNotifHasta.Date);
    SWhere2 := SWhere2 + ' AND 1=2';
  end;

  sIn := '';
  for i:=0 to cbEstadoSubLote.Items.Count-1 do
    if cbEstadoSubLote.Checked[i] then
    begin
      if sIn <> '' then
        sIn := sIn + ', ';
      sIn := sIn + '''' + TCodigoEstado(cbEstadoSubLote.Items.Objects[i]).Estado + '''';
    end;

  if (sIn <> '') then
    SWhere1 := SWhere1 + ' AND el_estado in (' + sIn + ') ';

  if SortDialog.OrderBy <> '' then
    sOrderBy := SortDialog.OrderBy
  else
    sOrderBy := ' ORDER BY cn_cuit, cn_estableci, cn_fecharelevamiento, el_idlote ';

  sdqConsulta.SQL.Text := sSQL1 + SWhere + SWhere1;

  if not chkRelevConLotes.Checked then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + sSQL2 + SWhere + SWhere2;

    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + sOrderBy;
  inherited;
end;

procedure TfrmAnalisisAsignacion.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa.ShowBajas      := True;
  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEmpresa.ContratoActivo := True;

  cbEstadoSubLote.Items.AddObject('Aprobado', TCodigoEstado.Create('A'));
  cbEstadoSubLote.Items.AddObject('Recibido', TCodigoEstado.Create('B'));
  cbEstadoSubLote.Items.AddObject('Carta Documento', TCodigoEstado.Create('D'));
  cbEstadoSubLote.Items.AddObject('Cerrado con Carta Documento', TCodigoEstado.Create('E'));
  cbEstadoSubLote.Items.AddObject('Realizado Parcialmente', TCodigoEstado.Create('I'));
  cbEstadoSubLote.Items.AddObject('Baja Contrato', TCodigoEstado.Create('J'));
  cbEstadoSubLote.Items.AddObject('Liquidado', TCodigoEstado.Create('L'));
  cbEstadoSubLote.Items.AddObject('Reprogramado', TCodigoEstado.Create('M'));
  cbEstadoSubLote.Items.AddObject('Anulado', TCodigoEstado.Create('N'));
  cbEstadoSubLote.Items.AddObject('Pendiente', TCodigoEstado.Create('P'));
  cbEstadoSubLote.Items.AddObject('Rechazado', TCodigoEstado.Create('R'));
  cbEstadoSubLote.Items.AddObject('Realizado sin Entregar', TCodigoEstado.Create('S'));
  cbEstadoSubLote.Items.AddObject('Realizado sin Entregar', TCodigoEstado.Create('S'));
  cbEstadoSubLote.Items.AddObject('Terminado', TCodigoEstado.Create('T'));
  cbEstadoSubLote.Items.AddObject('Notificado a Preventor', TCodigoEstado.Create('V'));
end;

procedure TfrmAnalisisAsignacion.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.CUIT;
  sdqConsulta.Close;
end;

procedure TfrmAnalisisAsignacion.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraEstablecimiento.Clear;
  edFechaRelevDesde.Clear;
  edFechaRelevHasta.Clear;
  edFechaNotifDesde.Clear;
  edFechaNotifHasta.Clear;
  chkRelevConLotes.Checked := true;
  cbEstadoSubLote.Clear;
  inherited;
end;

{ TCodigoEstado }

constructor TCodigoEstado.Create(aCodigoEstado: String);
begin
  inherited Create;
  FEstado := aCodigoEstado;
end;

procedure TfrmAnalisisAsignacion.FSFormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to cbEstadoSubLote.Items.Count-1 do
    cbEstadoSubLote.Items.Objects[i].Free;

  inherited;
end;

end.
