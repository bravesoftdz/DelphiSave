unit unTareasaRevisar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, DBCtrls, PatternEdit,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask,
  ToolEdit, DateComboBox, AnsiSql, VclExtra, unDmPrincipal, General,
  unSesion, SqlFuncs, CustomDlgs;

type
  TfrmTareasaRevisar = class(TfrmCustomGridABM)
    edObservacionGrilla: TDBMemo;
    Label44: TLabel;
    edFechaAltaDesde: TDateComboBox;
    Label46: TLabel;
    edFechaAltaHasta: TDateComboBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label18: TLabel;
    Label19: TLabel;
    edEstablecimiento: TPatternEdit;
    Label1: TLabel;
    edFechaRevisionDesde: TDateComboBox;
    Label2: TLabel;
    edFechaRevisionHasta: TDateComboBox;
    chkPendientes: TCheckBox;
    Label3: TLabel;
    edFechaRevision: TDateComboBox;
    edObservacion: TMemo;
    Label4: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FSql: String;
  public
    { Public declarations }
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmTareasaRevisar: TfrmTareasaRevisar;

implementation

uses unCustomConsulta;

{$R *.dfm}

procedure TfrmTareasaRevisar.ClearControls;
begin
  inherited;
  edFechaRevision.Date := DBDate;
  edObservacion.Clear;
end;

function TfrmTareasaRevisar.DoABM: Boolean;
begin
  BeginTrans;
  try
    Sql.Clear;
    Sql.Fields.Add('TE_USUREVISION', Sesion.LoginName);
    Sql.Fields.Add('TE_FECHAREVISION', edFechaRevision.Date);
    Sql.Fields.Add('TE_OBSERVACION', edObservacion.Text);
    Sql.SqlType := stUpdate;

    Sql.PrimaryKey.Add('TE_ID', sdqConsulta.FieldByName('TE_ID').AsInteger);
    EjecutarSQLST(Sql.Sql);
    CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
       Result := false;
       Rollback;
       ErrorMsg(E, 'Error al guardar la observación.');
    end;
  end;
end;

procedure TfrmTareasaRevisar.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hte_tareaerror';
  ShowActived := false;
  FSql := sdqConsulta.SQL.Text;
  fraEmpresaFiltro.ShowBajas := true;
  VclExtra.LockControl(edFechaRevision, true);
end;

procedure TfrmTareasaRevisar.LoadControls;
begin
  inherited;
  if not sdqConsulta.FieldbyName('te_fecharevision').IsNull then
  begin
    edFechaRevision.Date := sdqConsulta.FieldbyName('te_fecharevision').AsDateTime;
    edObservacion.Text := sdqConsulta.FieldbyName('te_observacion').AsString;
  end
  else begin
    edFechaRevision.Date := DBDate;
    edObservacion.Clear;
  end;
end;

procedure TfrmTareasaRevisar.RefreshData;
begin
  sdqConsulta.Sql.Text := FSql;

  if fraEmpresaFiltro.IsSelected then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' AND te_idempresa = ' + SqlValue(fraEmpresaFiltro.Value);

  if edEstablecimiento.Text <> '' then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' AND te_estableci IN  ('+edEstablecimiento.Text+')';

  if edFechaAltaDesde.Date > 0 then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' AND trunc(te_fechaalta) >= ' + SqlValue(edFechaAltaDesde.Date);

  if edFechaAltaHasta.Date > 0 then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' AND trunc(te_fechaalta) <= ' + SqlValue(edFechaAltaHasta.Date);

  if edFechaRevisionDesde.Date > 0 then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' AND trunc(te_fecharevision) >= ' + SqlValue(edFechaRevisionDesde.Date);

  if edFechaRevisionHasta.Date > 0 then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' AND trunc(te_fecharevision) <= ' + SqlValue(edFechaRevisionHasta.Date);

  if chkPendientes.Checked then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' AND te_fecharevision IS NULL AND te_fechafinalizado IS NULL ';

  if SortDialog.OrderBy = '' then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' ORDER BY te_fechaalta '
  else
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmTareasaRevisar.tbLimpiarClick(Sender: TObject);
begin
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaRevisionDesde.Clear;
  edFechaRevisionHasta.Clear;
  fraEmpresaFiltro.Clear;
  edEstablecimiento.Clear;
  chkPendientes.Checked := true;
  inherited;
end;

function TfrmTareasaRevisar.Validar: Boolean;
begin
  Verificar(trim(edObservacion.Text)='', edObservacion, 'Debe ingresar una observación');
  result := true;
end;

end.
