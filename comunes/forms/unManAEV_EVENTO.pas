unit unManami_motivoingreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManami_motivoingreso = class(TfrmCustomGridABM)
    Label3: TLabel;
    edEV_DESCRIPCION: TEdit;
    sdqConsultaEV_ID: TFloatField;
    sdqConsultaEV_DESCRIPCION: TStringField;
    sdqConsultaEV_FECHAALTA: TDateTimeField;
    sdqConsultaEV_USUALTA: TStringField;
    sdqConsultaEV_FECHAMODIF: TDateTimeField;
    sdqConsultaEV_USUMODIF: TStringField;
    sdqConsultaEV_FECHABAJA: TDateTimeField;
    sdqConsultaEV_USUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    procedure FormCreate(Sender: TObject);
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
  frmManami_motivoingreso: TfrmManami_motivoingreso;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal;

{$R *.dfm}

procedure TfrmManami_motivoingreso.ClearControls;
begin
  inherited;
  edEV_DESCRIPCION.Clear;
end;

function TfrmManami_motivoingreso.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('EV_ID', sdqConsulta.FieldByName('EV_ID').AsInteger);
     Sql.Fields.Add('EV_FECHABAJA', exDate);
     Sql.Fields.Add('EV_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('EV_ID', ValorSQLInteger('SELECT NVL(MAX(EV_ID), 0) FROM AGENDA.ami_motivoingreso') + 1);
       Sql.Fields.Add('EV_FECHAALTA', exDate);
       Sql.Fields.Add('EV_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('EV_ID', sdqConsulta.FieldByName('EV_ID').AsInteger);
       Sql.Fields.Add('EV_FECHAMODIF', exDate);
       Sql.Fields.Add('EV_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('EV_DESCRIPCION', edEV_DESCRIPCION.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManami_motivoingreso.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'AGENDA.ami_motivoingreso';
  FieldBaja := 'EV_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManami_motivoingreso.LoadControls;
begin
  edEV_DESCRIPCION.Text := sdqConsulta.FieldByName('EV_DESCRIPCION').AsString;
end;

procedure TfrmManami_motivoingreso.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManami_motivoingreso.Validar: Boolean;
begin
  Verificar(Trim(edEV_DESCRIPCION.Text) = '', edEV_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

end.
