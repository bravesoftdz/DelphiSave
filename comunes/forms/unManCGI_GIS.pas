unit unManCGI_GIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManCGI_GIS = class(TfrmCustomGridABM)
    fraProvincia: TfraCodDesc;
    Label1: TLabel;
    fraGI_PROVINCIA: TfraCodDesc;
    Label2: TLabel;
    Label3: TLabel;
    edLocalidad: TEdit;
    chkSinCalles: TCheckBox;
    Label4: TLabel;
    edReemplazarPor: TEdit;
    sdqConsultaGI_LOCALIDAD: TStringField;
    sdqConsultaGI_SIN_CALLES: TStringField;
    sdqConsultaGI_REEMPLAZAR_POR: TStringField;
    sdqConsultaGI_PROVINCIA: TStringField;
    sdqConsultaGI_DEFAULT: TStringField;
    Label5: TLabel;
    edDireccionPredeterminada: TEdit;
    sdqConsultaGI_ID: TFloatField;
    sdqConsultaGI_USUALTA: TStringField;
    sdqConsultaGI_FECHAALTA: TDateTimeField;
    sdqConsultaGI_USUMODIF: TStringField;
    sdqConsultaGI_FECHAMODIF: TDateTimeField;
    sdqConsultaGI_USUBAJA: TStringField;
    sdqConsultaGI_FECHABAJA: TDateTimeField;
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
  frmManCGI_GIS: TfrmManCGI_GIS;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal;

{$R *.dfm}

procedure TfrmManCGI_GIS.ClearControls;
begin
  inherited;
  edLocalidad.Clear;
  edReemplazarPor.Clear;
  edDireccionPredeterminada.Clear;  
  chkSinCalles.Checked := False;
  fraProvincia.Clear;
  VCLExtra.LockControls(edLocalidad, False);  
end;

function TfrmManCGI_GIS.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsInteger);
    Sql.Fields.Add('GI_FECHABAJA', exDate);
    Sql.Fields.Add('GI_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('GI_ID', ValorSQLInteger('SELECT NVL(MAX(GI_ID), 0) FROM COMUNES.CGI_GIS') + 1);
      Sql.Fields.Add('GI_FECHAALTA', exDate);
      Sql.Fields.Add('GI_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsInteger);
      Sql.Fields.Add('GI_FECHAMODIF', exDate);
      Sql.Fields.Add('GI_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('GI_REEMPLAZAR_POR', edReemplazarPor.Text);
    Sql.Fields.Add('GI_DEFAULT', edDireccionPredeterminada.Text);
    Sql.Fields.Add('GI_LOCALIDAD', edLocalidad.Text);
    Sql.Fields.Add('GI_PROVINCIA', fraProvincia.Codigo);
    Sql.Fields.AddString('GI_SIN_CALLES', iif(chkSinCalles.Checked, 'S', 'N'));
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCGI_GIS.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CGI_GIS';
  FieldBaja := 'GI_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManCGI_GIS.LoadControls;
begin
  edLocalidad.Text := sdqConsulta.FieldByName('GI_LOCALIDAD').AsString;
  edReemplazarPor.Text := sdqConsulta.FieldByName('GI_REEMPLAZAR_POR').AsString;  
  fraProvincia.Codigo := sdqConsulta.FieldByName('GI_PROVINCIA').AsString;
  edDireccionPredeterminada.Text := sdqConsulta.FieldByName('GI_DEFAULT').AsString;
  chkSinCalles.Checked := iif(sdqConsulta.FieldByName('GI_SIN_CALLES').AsString = 'S', True, False);
  VCLExtra.LockControls(edLocalidad, True);
end;

procedure TfrmManCGI_GIS.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCGI_GIS.Validar: Boolean;
begin
  Verificar(Trim(edLocalidad.Text) = '', edLocalidad, 'Debe completar la localidad.');
  Result := True;
end;

end.
