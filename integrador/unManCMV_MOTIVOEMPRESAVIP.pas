unit unManCMV_MOTIVOEMPRESAVIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManCMV_MOTIVOEMPRESAVIP = class(TfrmCustomGridABM)
    Label1: TLabel;
    edDescripcion: TEdit;
    sdqConsultaMV_ID: TFloatField;
    sdqConsultaMV_DESCRIPCION: TStringField;
    sdqConsultaMV_USUALTA: TStringField;
    sdqConsultaMV_FECHAALTA: TDateTimeField;
    sdqConsultaMV_USUMODIF: TStringField;
    sdqConsultaMV_FECHAMODIF: TDateTimeField;
    sdqConsultaMV_USUBAJA: TStringField;
    sdqConsultaMV_FECHABAJA: TDateTimeField;
    sdqConsultaUSUALTA: TStringField;
    sdqConsultaUSUMODIF: TStringField;
    sdqConsultaUSUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCMV_MOTIVOEMPRESAVIP: TfrmManCMV_MOTIVOEMPRESAVIP;

implementation

uses
  unDmPrincipal, CustomDlgs, Strfuncs, SqlFuncs, General, unFiltros, unSesion, VCLExtra;

{$R *.dfm}

procedure TfrmManCMV_MOTIVOEMPRESAVIP.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CMV_MOTIVOEMPRESAVIP';
  FieldBaja := 'MV_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManCMV_MOTIVOEMPRESAVIP.ClearControls;
begin
  inherited;
  edDescripcion.Clear;
end;

procedure TfrmManCMV_MOTIVOEMPRESAVIP.ClearData;
begin
  inherited;

end;

function TfrmManCMV_MOTIVOEMPRESAVIP.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('MV_ID', sdqConsulta.FieldByName('MV_ID').AsInteger);
    Sql.Fields.Add('MV_FECHABAJA', exDate);
    Sql.Fields.Add('MV_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('MV_ID', GetSecNextVal('COMUNES.SEQ_CMV_ID'));
      Sql.Fields.Add('MV_FECHAALTA', exDate);
      Sql.Fields.Add('MV_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('MV_ID', sdqConsulta.FieldByName('MV_ID').AsInteger);
      Sql.Fields.Add('MV_FECHAMODIF', exDate);
      Sql.Fields.Add('MV_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('MV_DESCRIPCION', edDescripcion.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCMV_MOTIVOEMPRESAVIP.LoadControls;
begin
  with sdqConsulta do
  begin
    edDescripcion.Text := FieldByName('MV_DESCRIPCION').AsString;
  end;
end;

procedure TfrmManCMV_MOTIVOEMPRESAVIP.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManCMV_MOTIVOEMPRESAVIP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid, 25, True, True);
end;

function TfrmManCMV_MOTIVOEMPRESAVIP.Validar: Boolean;
begin
  Verificar(IsEmptyString(edDescripcion.Text), edDescripcion, 'Debe indicar la descripción del motivo por el cual indicará que las empresas sean considerará que son Grandes Cuentas.');  
  Result := True;
end;

end.
