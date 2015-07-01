unit unManAMI_MOTIVOINGRESO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManAMI_MOTIVOINGRESO = class(TfrmCustomGridABM)
    Label3: TLabel;
    edmi_DESCRIPCION: TEdit;
    sdqConsultami_ID: TFloatField;
    sdqConsultami_DESCRIPCION: TStringField;
    sdqConsultami_FECHAALTA: TDateTimeField;
    sdqConsultami_USUALTA: TStringField;
    sdqConsultami_FECHAMODIF: TDateTimeField;
    sdqConsultami_USUMODIF: TStringField;
    sdqConsultami_FECHABAJA: TDateTimeField;
    sdqConsultami_USUBAJA: TStringField;
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
  frmManAMI_MOTIVOINGRESO: TfrmManAMI_MOTIVOINGRESO;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal;

{$R *.dfm}

procedure TfrmManAMI_MOTIVOINGRESO.ClearControls;
begin
  inherited;
  edmi_DESCRIPCION.Clear;
end;

function TfrmManAMI_MOTIVOINGRESO.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('mi_ID', sdqConsulta.FieldByName('mi_ID').AsInteger);
     Sql.Fields.Add('mi_FECHABAJA', exDate);
     Sql.Fields.Add('mi_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('mi_ID', ValorSQLInteger('SELECT NVL(MAX(mi_ID), 0) FROM AGENDA.AMI_MOTIVOINGRESO') + 1);
       Sql.Fields.Add('mi_FECHAALTA', exDate);
       Sql.Fields.Add('mi_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('mi_ID', sdqConsulta.FieldByName('mi_ID').AsInteger);
       Sql.Fields.Add('mi_FECHAMODIF', exDate);
       Sql.Fields.Add('mi_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('mi_DESCRIPCION', edmi_DESCRIPCION.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManAMI_MOTIVOINGRESO.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'AGENDA.AMI_MOTIVOINGRESO';
  FieldBaja := 'mi_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManAMI_MOTIVOINGRESO.LoadControls;
begin
  edmi_DESCRIPCION.Text := sdqConsulta.FieldByName('mi_DESCRIPCION').AsString;
end;

procedure TfrmManAMI_MOTIVOINGRESO.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManAMI_MOTIVOINGRESO.Validar: Boolean;
begin
  Verificar(Trim(edmi_DESCRIPCION.Text) = '', edmi_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

end.
