unit unManWAP_ACCIONPARAMETROS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, DBCtrls, AdvMemo, JvExExtCtrls,
  JvNavigationPane, mwCustomEdit, mwHighlighter, mwSqlSyn, ImgList;

type
  TfrmManWAP_ACCIONPARAMETROS = class(TfrmCustomGridABM)
    Label3: TLabel;
    edAP_DESCRIPCION: TEdit;
    Label4: TLabel;
    edAP_CLAVE: TEdit;
    fraAW_ID: TfraCodDesc;
    Label6: TLabel;
    sdqConsultaAP_IDACCIONWEB: TFloatField;
    sdqConsultaAP_DESCRIPCION: TStringField;
    sdqConsultaAP_CLAVE: TStringField;
    sdqConsultaAP_VALORFIJO: TStringField;
    sdqConsultaAP_CONSULTA: TStringField;
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
    pnlBottom: TPanel;
    edConsulta: TDBMemo;
    edValorFijo: TDBMemo;
    pcOpciones: TPageControl;
    tsValorFijo: TTabSheet;
    tsConsulta: TTabSheet;
    edAP_VALORFIJO: TMemo;
    fraAP_IDACCIONWEB: TfraCodDesc;
    Label1: TLabel;
    sdqConsultaAP_USUALTA: TStringField;
    sdqConsultaAP_FECHAALTA: TDateTimeField;
    sdqConsultaAP_USUMODIF: TStringField;
    sdqConsultaAP_FECHAMODIF: TDateTimeField;
    sdqConsultaAP_USUBAJA: TStringField;
    sdqConsultaAP_FECHABAJA: TDateTimeField;
    sdqConsultaAP_ID: TFloatField;
    ShortCutControlHijo: TShortCutControl;
    Splitter1: TJvOutlookSplitter;
    JvOutlookSplitter1: TJvOutlookSplitter;
    mwSqlSyn: TmwSqlSyn;
    edAP_CONSULTA: TmwCustomEdit;
    pnlRight: TPanel;
    ToolBarSQL: TToolBar;
    tbSintaxis: TToolButton;
    IconosXP: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure tbSintaxisClick(Sender: TObject);
  private
    FSQL: String;
    procedure CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
  public
		procedure RefreshData; override;
  end;

var
  frmManWAP_ACCIONPARAMETROS: TfrmManWAP_ACCIONPARAMETROS;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, Strfuncs;

{$R *.dfm}

procedure TfrmManWAP_ACCIONPARAMETROS.ClearControls;
begin
  inherited;
  fraAP_IDACCIONWEB.Clear;
  edAP_DESCRIPCION.Clear;
  edAP_CLAVE.Clear;
  edAP_CONSULTA.Lines.Text := ' ';
  edAP_VALORFIJO.Clear;
end;

procedure TfrmManWAP_ACCIONPARAMETROS.ClearData;
begin
  fraAW_ID.Clear;
end;

function TfrmManWAP_ACCIONPARAMETROS.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('AP_ID', sdqConsulta.FieldByName('AP_ID').AsInteger);
    Sql.Fields.Add('AP_FECHABAJA', exDate);
    Sql.Fields.Add('AP_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('AP_ID', ValorSQLInteger('SELECT NVL(MAX(AP_ID), 0) FROM WEB.WAP_ACCIONPARAMETROS') + 1);
      Sql.Fields.Add('AP_FECHAALTA', exDate);
      Sql.Fields.Add('AP_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('AP_ID', sdqConsulta.FieldByName('AP_ID').AsInteger);
      Sql.Fields.Add('AP_FECHAMODIF', exDate);
      Sql.Fields.Add('AP_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('AP_IDACCIONWEB', fraAP_IDACCIONWEB.Codigo);
    Sql.Fields.Add('AP_DESCRIPCION', edAP_DESCRIPCION.Text);
    Sql.Fields.Add('AP_CLAVE', edAP_CLAVE.Text);
    Sql.Fields.Add('AP_CONSULTA', edAP_CONSULTA.Lines.Text);
    Sql.Fields.Add('AP_VALORFIJO', edAP_VALORFIJO.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManWAP_ACCIONPARAMETROS.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'WEB.WAP_ACCIONPARAMETROS';
  FSQL := sdqConsulta.SQL.Text;
  VCLExtra.LockControls([edValorFijo, edConsulta], True);
  FieldBaja := 'AP_FECHABAJA';
end;

procedure TfrmManWAP_ACCIONPARAMETROS.LoadControls;
begin
  fraAP_IDACCIONWEB.Codigo := sdqConsulta.FieldByName('AP_IDACCIONWEB').AsString;
  edAP_DESCRIPCION.Text := sdqConsulta.FieldByName('AP_DESCRIPCION').AsString;
  edAP_CLAVE.Text := sdqConsulta.FieldByName('AP_CLAVE').AsString;
  edAP_VALORFIJO.Text := sdqConsulta.FieldByName('AP_VALORFIJO').AsString;

  if IsEmptyString(sdqConsulta.FieldByName('AP_CONSULTA').AsString) then
    edAP_CONSULTA.Lines.Text := ' '
  else
    edAP_CONSULTA.Lines.Text := sdqConsulta.FieldByName('AP_CONSULTA').AsString;
end;

procedure TfrmManWAP_ACCIONPARAMETROS.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManWAP_ACCIONPARAMETROS.Validar: Boolean;
begin
  Verificar(Trim(edAP_DESCRIPCION.Text) = '', edAP_DESCRIPCION, 'Debe completar la descripción del parámetro de la acción web.');
  Result := True;
end;

procedure TfrmManWAP_ACCIONPARAMETROS.tbSintaxisClick(Sender: TObject);
var
  sdqSintaxis: TSDQuery;
begin
  try
    sdqSintaxis := TSDQuery.Create( Self );
    try
      SetDatabaseToQuery(sdqSintaxis);
      CheckSintaxis(sdqSintaxis, (Sender = tbSintaxis));
    finally
      sdqSintaxis.Free;
    end;

    InfoHint(tbSintaxis, 'La comprobación de sintaxis fue satisfactoria.');
  except
    on E: Exception do
      InvalidMsg(tbSintaxis, 'Error al comprobar la sintaxis del script.');
  end;
end;

procedure TfrmManWAP_ACCIONPARAMETROS.CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
var
	sSql : String;
begin
  sSql := edAP_CONSULTA.Lines.Text;
  CheckAndOpenQuery(AQuery, sSql, ArchivoSql);
end;

end.
