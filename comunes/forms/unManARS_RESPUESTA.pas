unit unManARS_RESPUESTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManARS_RESPUESTA = class(TfrmCustomGridABM)
    Label3: TLabel;
    edrs_DESCRIPCION: TEdit;
    sdqConsultars_ID: TFloatField;
    sdqConsultars_DESCRIPCION: TStringField;
    sdqConsultars_FECHAALTA: TDateTimeField;
    sdqConsultars_USUALTA: TStringField;
    sdqConsultars_FECHAMODIF: TDateTimeField;
    sdqConsultars_USUMODIF: TStringField;
    sdqConsultars_FECHABAJA: TDateTimeField;
    sdqConsultars_USUBAJA: TStringField;
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
  frmManARS_RESPUESTA: TfrmManARS_RESPUESTA;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal;

{$R *.dfm}

procedure TfrmManARS_RESPUESTA.ClearControls;
begin
  inherited;
  edrs_DESCRIPCION.Clear;
end;

function TfrmManARS_RESPUESTA.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('rs_ID', sdqConsulta.FieldByName('rs_ID').AsInteger);
     Sql.Fields.Add('rs_FECHABAJA', exDate);
     Sql.Fields.Add('rs_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('rs_ID', ValorSQLInteger('SELECT NVL(MAX(rs_ID), 0) FROM AGENDA.ARS_RESPUESTA') + 1);
       Sql.Fields.Add('rs_FECHAALTA', exDate);
       Sql.Fields.Add('rs_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('rs_ID', sdqConsulta.FieldByName('rs_ID').AsInteger);
       Sql.Fields.Add('rs_FECHAMODIF', exDate);
       Sql.Fields.Add('rs_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('rs_DESCRIPCION', edrs_DESCRIPCION.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManARS_RESPUESTA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'AGENDA.ARS_RESPUESTA';
  FieldBaja := 'rs_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManARS_RESPUESTA.LoadControls;
begin
  edrs_DESCRIPCION.Text := sdqConsulta.FieldByName('rs_DESCRIPCION').AsString;
end;

procedure TfrmManARS_RESPUESTA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManARS_RESPUESTA.Validar: Boolean;
begin
  Verificar(Trim(edrs_DESCRIPCION.Text) = '', edrs_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

end.
