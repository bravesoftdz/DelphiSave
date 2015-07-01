unit unManWAW_ACCIONWEB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManWAW_ACCIONWEB = class(TfrmCustomGridABM)
    Label3: TLabel;
    edAW_DESCRIPCION: TEdit;
    Label4: TLabel;
    edAW_MOTIVOMAIL: TEdit;
    Label5: TLabel;
    edAW_ARCHIVO: TEdit;
    sdqConsultaAW_ID: TFloatField;
    sdqConsultaAW_DESCRIPCION: TStringField;
    sdqConsultaAW_ARCHIVO: TStringField;
    sdqConsultaAW_MOTIVOMAIL: TStringField;
    sdqConsultaAW_HTMLMAIL: TStringField;
    sdqConsultaAW_HTMLNOTIFICACION: TStringField;
    sdqConsultaAW_USUALTA: TStringField;
    sdqConsultaAW_FECHAALTA: TDateTimeField;
    sdqConsultaAW_USUMODIF: TStringField;
    sdqConsultaAW_FECHAMODIF: TDateTimeField;
    sdqConsultaAW_USUBAJA: TStringField;
    sdqConsultaAW_FECHABAJA: TDateTimeField;
    Label1: TLabel;
    edAW_HTMLMAIL: TEdit;
    Label2: TLabel;
    edAW_HTMLNOTIFICACION: TEdit;
    ShortCutControlHijo: TShortCutControl;
    btnParametros: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnParametrosClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
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
  frmManWAW_ACCIONWEB: TfrmManWAW_ACCIONWEB;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unManWAP_ACCIONPARAMETROS, unPrincipal;

{$R *.dfm}

procedure TfrmManWAW_ACCIONWEB.ClearControls;
begin
  inherited;
  edAW_DESCRIPCION.Clear;
  edAW_MOTIVOMAIL.Clear;
  edAW_ARCHIVO.Clear;
  edAW_HTMLMAIL.Clear;
  edAW_HTMLNOTIFICACION.Clear;
end;

function TfrmManWAW_ACCIONWEB.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('AW_ID', sdqConsulta.FieldByName('AW_ID').AsInteger);
    Sql.Fields.Add('AW_FECHABAJA', exDate);
    Sql.Fields.Add('AW_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('AW_ID', ValorSQLInteger('SELECT NVL(MAX(AW_ID), 0) FROM WEB.WAW_ACCIONWEB') + 1);
      Sql.Fields.Add('AW_FECHAALTA', exDate);
      Sql.Fields.Add('AW_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('AW_ID', sdqConsulta.FieldByName('AW_ID').AsInteger);
      Sql.Fields.Add('AW_FECHAMODIF', exDate);
      Sql.Fields.Add('AW_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('AW_DESCRIPCION', edAW_DESCRIPCION.Text);
    Sql.Fields.Add('AW_MOTIVOMAIL', edAW_MOTIVOMAIL.Text);
    Sql.Fields.Add('AW_ARCHIVO', edAW_ARCHIVO.Text);
    Sql.Fields.Add('AW_HTMLMAIL', edAW_HTMLMAIL.Text);
    Sql.Fields.Add('AW_HTMLNOTIFICACION', edAW_HTMLNOTIFICACION.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManWAW_ACCIONWEB.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'WEB.WAW_ACCIONWEB';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManWAW_ACCIONWEB.LoadControls;
begin
  edAW_DESCRIPCION.Text := sdqConsulta.FieldByName('AW_DESCRIPCION').AsString;
  edAW_MOTIVOMAIL.Text := sdqConsulta.FieldByName('AW_MOTIVOMAIL').AsString;
  edAW_ARCHIVO.Text := sdqConsulta.FieldByName('AW_ARCHIVO').AsString;
  edAW_HTMLMAIL.Text := sdqConsulta.FieldByName('AW_HTMLMAIL').AsString;
  edAW_HTMLNOTIFICACION.Text := sdqConsulta.FieldByName('AW_HTMLNOTIFICACION').AsString;
end;

procedure TfrmManWAW_ACCIONWEB.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManWAW_ACCIONWEB.Validar: Boolean;
begin
  Verificar(Trim(edAW_DESCRIPCION.Text) = '', edAW_DESCRIPCION, 'Debe completar la descripción de la acción web.');
  Result := True;
end;

procedure TfrmManWAW_ACCIONWEB.btnParametrosClick(Sender: TObject);
begin
  inherited;
  if MsgAsk('¿Desea guardar estos datos?') then
  begin
    btnAceptar.Click;
    Abrir(TfrmManWAP_ACCIONPARAMETROS, frmManWAP_ACCIONPARAMETROS, tmvMDIChild, frmPrincipal.mnuParametrosWEB);
    frmManWAP_ACCIONPARAMETROS.fraAW_ID.Codigo := sdqConsultaAW_ID.AsString;
    frmManWAP_ACCIONPARAMETROS.RefreshData;
  end;
end;

procedure TfrmManWAW_ACCIONWEB.fpAbmShow(Sender: TObject);
begin
  inherited;
  btnParametros.Enabled := ModoABM = maModificacion;
end;

end.
