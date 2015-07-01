unit unManRAD_ARCHIVODOCUMENTO;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, StdCtrls, ExComboBox, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Db, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion,
  unFraUsuario, Mask, PatternEdit, ComboEditor, DBComboGrid,
  unArtDBAwareFrame;

type
  TfrmManRAD_ARCHIVODOCUMENTO = class(TfrmCustomGridABM)
    lbTipoArchivo: TLabel;
    lbDocumento: TLabel;
    cmbAD_IDDOCUMENTO: TDBIncComboGrid;
    sdqDocumentos: TSDQuery;
    dsDocumentos: TDataSource;
    ShortCutControl1: TShortCutControl;
    fraTipoArchivoBusqueda: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    procedure fraTipoArchivoBusquedaChange(Sender: TObject);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  public
    class procedure DoMostrarDocsArchivo(CodTipoArchivo: String);
  end;

var
  frmManRAD_ARCHIVODOCUMENTO: TfrmManRAD_ARCHIVODOCUMENTO;

implementation

uses
  unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal, General;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.ClearControls;
begin
  cmbAD_IDDOCUMENTO.KeyValue := Null;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRAD_ARCHIVODOCUMENTO.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maAlta then
  begin
    Sql.PrimaryKey.Add('AD_ID',           GetSecNextVal('SEQ_RAD_ID'));
    Sql.Fields.Add('AD_IDTIPOARCHIVO',    fraTipoArchivoBusqueda.Value);
    Sql.Fields.Add('AD_IDTIPODOCUMENTO',  cmbAD_IDDOCUMENTO.KeyValue, dtString);
    Sql.Fields.Add('AD_USUALTA',          frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('AD_FECHAALTA',        exDateTime);
  end
  else begin
    Sql.PrimaryKey.Add('AD_ID',           sdqConsulta.FieldByName('AD_ID').AsInteger);
    Sql.Fields.Add('AD_IDTIPOARCHIVO',    sdqConsulta.FieldByName('AD_IDTIPOARCHIVO').AsInteger);
    Sql.Fields.Add('AD_IDTIPODOCUMENTO',  sdqConsulta.FieldByName('AD_IDTIPODOCUMENTO').AsString);

    if ModoABM = maBaja then
    begin
      Sql.Fields.Add('AD_USUBAJA',        frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('AD_FECHABAJA',      exDateTime);
    end else
    begin
      Sql.Fields.Add('AD_USUBAJA',        exNull);
      Sql.Fields.Add('AD_FECHABAJA',      exNull);
    end;
    Sql.SqlType := stUpdate;
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;

  with fraTipoArchivoBusqueda do
  begin
    TableName   := 'RTA_TIPOARCHIVO';
    FieldID     := 'TA_ID';
    FieldCodigo := 'TA_CODIGO';
    FieldDesc   := 'TA_DESCRIPCION';
    ShowBajas   := True;          
    OnChange    := fraTipoArchivoBusquedaChange;
  end;

  FieldBaja     := 'FECHABAJA';
  Sql.TableName := 'RAD_TIPOARCHIVODOCUMENTO';
  AutoLock      := True;

  OpenQuery(sdqDocumentos);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.LoadControls;
begin
  cmbAD_IDDOCUMENTO.KeyValue := sdqConsulta.FieldByName('ad_idtipodocumento').Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRAD_ARCHIVODOCUMENTO.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(cmbAD_IDDOCUMENTO.KeyValue = Null, cmbAD_IDDOCUMENTO, 'Debe seleccionar un usuario.');

  if ModoABM = maAlta then
    begin
      sSql := 'SELECT 1 ' +
                'FROM RAD_TIPOARCHIVODOCUMENTO ' +
               'WHERE AD_IDTIPOARCHIVO = :IdTipoArchivo ' +
                 'AND AD_IDTIPODOCUMENTO = :IdTipoDocumento';
      Verificar(ExisteSqlEx(sSql, [fraTipoArchivoBusqueda.Value, cmbAD_IDDOCUMENTO.KeyValue]), cmbAD_IDDOCUMENTO, 'La relación entre el tipo de archivo y el documento ya existe.');
    end;

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.RefreshData;
var
  sSql: string;
begin
  Verificar(fraTipoArchivoBusqueda.IsEmpty, fraTipoArchivoBusqueda, 'Debe seleccionar un tipo de Archivo.');

  sSql := 'SELECT AD_ID, TA_DESCRIPCION, TD_CODIGO, TD_DESCRIPCION, AD_IDTIPOARCHIVO, AD_IDTIPODOCUMENTO, ' +
                 'TRUNC(AD_FECHABAJA) FECHABAJA, TRUNC(TD_FECHABAJA) FECHABAJADOC ' +
            'FROM RAD_TIPOARCHIVODOCUMENTO, RTD_TIPODOCUMENTO, RTA_TIPOARCHIVO ' +
           'WHERE TA_ID = AD_IDTIPOARCHIVO ' +
             'AND TD_ID = AD_IDTIPODOCUMENTO ';

  if fraTipoArchivoBusqueda.IsSelected then
    sSql := sSql + ' AND AD_IDTIPOARCHIVO = ' + SqlValue(fraTipoArchivoBusqueda.Value) + ' ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.tbNuevoClick(Sender: TObject);
begin
  Verificar(fraTipoArchivoBusqueda.IsEmpty, fraTipoArchivoBusqueda, 'Debe seleccionar un tipo de Archivo.');

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.tbModificarClick(Sender: TObject);
begin
  if IsBaja and (MsgBox('¿Desea reestablecer el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
    begin
      ModoABM := maModificacion;
      DoABM;
      sdqConsulta.Refresh;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraTipoArchivoBusqueda.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAD_ARCHIVODOCUMENTO.fraTipoArchivoBusquedaChange(Sender: TObject);
begin
  if fraTipoArchivoBusqueda.IsSelected then
    RefreshData
  else
    tbLimpiarClick(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
class procedure TfrmManRAD_ARCHIVODOCUMENTO.DoMostrarDocsArchivo(CodTipoArchivo: String);
begin
  Abrir(TfrmManRAD_ARCHIVODOCUMENTO, frmManRAD_ARCHIVODOCUMENTO, tmvMDIChild, nil);

  with frmManRAD_ARCHIVODOCUMENTO do
    begin
      fraTipoArchivoBusqueda.Codigo := CodTipoArchivo;

      RefreshData;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

