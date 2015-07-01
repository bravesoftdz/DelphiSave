unit unModificacionProvinciaZona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmModificacionProvinciaZona = class(TfrmCustomGridABM)
    lbZonaFiltro: TLabel;
    fraZonaFiltro: TfraCodigoDescripcion;
    fraProvincia: TfraCodigoDescripcion;
    lbProvincia: TLabel;
    fraZona: TfraCodigoDescripcion;
    lbZona: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmModificacionProvinciaZona: TfrmModificacionProvinciaZona;

implementation

uses unCustomConsulta, CustomDlgs,unDmPrincipal, unSesion, SqlFuncs, AnsiSql, vclExtra;

{$R *.dfm}

{ TfrmModificacionProvinciaZona }

procedure TfrmModificacionProvinciaZona.ClearControls;
begin
  inherited;
  fraProvincia.Clear;
  fraZona.Clear;
end;

function TfrmModificacionProvinciaZona.DoABM: Boolean;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    Sql.Fields.Add('PV_IDZONACOTI', fraZona.Codigo);
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('PV_CODIGO', sdqConsulta.FieldByName('PV_CODIGO').AsInteger);
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar las observaciones.');
    end;
  end;
end;

procedure TfrmModificacionProvinciaZona.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'PV_FECHABAJA';
  Sql.TableName := 'art.cpv_provincias';
  with fraZonaFiltro do
  begin
    TableName   := 'hys.hzc_zonacotizacion';
    FieldID     := 'zc_id';
    FieldCodigo := 'zc_id';
    FieldDesc   := 'zc_descripcion';
    FieldBaja   := 'zc_fechabaja';
    Showbajas   := false;
  end;
  with fraZona do
  begin
    TableName   := 'hys.hzc_zonacotizacion';
    FieldID     := 'zc_id';
    FieldCodigo := 'zc_id';
    FieldDesc   := 'zc_descripcion';
    FieldBaja   := 'zc_fechabaja';
    Showbajas   := false;
  end;
  with fraProvincia do
  begin
    TableName   := 'art.cpv_provincias';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
    FieldBaja   := 'PV_FECHABAJA';
    Showbajas   := False;
  end;
  vclExtra.LockControls([fraProvincia], True);
end;

procedure TfrmModificacionProvinciaZona.LoadControls;
begin
  inherited;
  ClearControls;
  fraProvincia.Codigo := sdqConsulta.FieldByName('PV_CODIGO').AsString;
  fraZona.Codigo := sdqConsulta.FieldByName('PV_IDZONACOTI').AsString;
end;

function TfrmModificacionProvinciaZona.Validar: Boolean;
begin
  Verificar(not fraZona.IsSelected,fraZona,'Debe Seleccionar una zona.');
  Result := True;
end;

procedure TfrmModificacionProvinciaZona.tbRefrescarClick(Sender: TObject);
var
  sWhere : String;
begin

  if fraZonaFiltro.IsSelected then
    sWhere := ' AND PV_IDZONACOTI = '+SqlValue(fraZonaFiltro.Value);

  sdqConsulta.SQL.Text := ' SELECT * FROM hys.hzc_zonacotizacion, art.cpv_provincias '+
                          ' WHERE pv_idzonacoti = zc_id(+)'+sWhere;
  inherited;                        
end;

procedure TfrmModificacionProvinciaZona.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraZonaFiltro.Clear;
end;

end.
