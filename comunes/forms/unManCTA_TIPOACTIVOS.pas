unit unManCTA_TIPOACTIVOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManCTA_TIPOACTIVOS = class(TfrmCustomGridABM)
    Label3: TLabel;
    edTA_DESCRIPCION: TEdit;
    sdqConsultaTA_ID: TFloatField;
    sdqConsultaTA_DESCRIPCION: TStringField;
    sdqConsultaTA_FECHAALTA: TDateTimeField;
    sdqConsultaTA_USUALTA: TStringField;
    sdqConsultaTA_FECHAMODIF: TDateTimeField;
    sdqConsultaTA_USUMODIF: TStringField;
    sdqConsultaTA_FECHABAJA: TDateTimeField;
    sdqConsultaTA_USUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCTA_TIPOACTIVOS: TfrmManCTA_TIPOACTIVOS;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal;

{$R *.dfm}

procedure TfrmManCTA_TIPOACTIVOS.ClearControls;
begin
  inherited;
  edTA_DESCRIPCION.Clear;
end;

function TfrmManCTA_TIPOACTIVOS.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('TA_ID', sdqConsulta.FieldByName('TA_ID').AsInteger);
     Sql.Fields.Add('TA_FECHABAJA', exDate);
     Sql.Fields.Add('TA_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('TA_ID', ValorSQLInteger('SELECT NVL(MAX(TA_ID), 0) FROM COMUNES.CTA_TIPOACTIVOS') + 1);
       Sql.Fields.Add('TA_FECHAALTA', exDate);
       Sql.Fields.Add('TA_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('TA_ID', sdqConsulta.FieldByName('TA_ID').AsInteger);
       Sql.Fields.Add('TA_FECHAMODIF', exDate);
       Sql.Fields.Add('TA_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('TA_DESCRIPCION', edTA_DESCRIPCION.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCTA_TIPOACTIVOS.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CTA_TIPOACTIVOS';
  FieldBaja := 'TA_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManCTA_TIPOACTIVOS.LoadControls;
begin
  edTA_DESCRIPCION.Text := sdqConsulta.FieldByName('TA_DESCRIPCION').AsString;
end;

procedure TfrmManCTA_TIPOACTIVOS.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCTA_TIPOACTIVOS.Validar: Boolean;
begin
  Verificar(Trim(edTA_DESCRIPCION.Text) = '', edTA_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCTA_TIPOACTIVOS.SeguridadAfterExecute(Sender: TObject);
begin
  inherited;
  tbNuevo.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbNuevo);
  tbModificar.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbModificar);
  tbEliminar.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbEliminar);    
end;

end.
