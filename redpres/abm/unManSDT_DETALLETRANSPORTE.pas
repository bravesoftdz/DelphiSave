unit unManSDT_DETALLETRANSPORTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraPrestador, Spin, Mask, RxPlacemnt;

type
  TfrmManSDT_DETALLETRANSPORTE = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraCA_IDENTIFICADOR: TfraPrestador;
    sdqConsultaDT_ID: TFloatField;
    sdqConsultaDT_IDPRESTADOR: TFloatField;
    sdqConsultaDT_PATENTE: TStringField;
    sdqConsultaDT_DESCRIPCION: TStringField;
    sdqConsultaDT_USUALTA: TStringField;
    sdqConsultaDT_FECHAALTA: TDateTimeField;
    sdqConsultaDT_USUMODIF: TStringField;
    sdqConsultaDT_FECHAMODIF: TDateTimeField;
    sdqConsultaDT_USUBAJA: TStringField;
    sdqConsultaDT_FECHABAJA: TDateTimeField;
    sdqConsultaDT_CANTLUGARES: TFloatField;
    sdqConsultaCA_DESCRIPCION: TStringField;
    fraDT_IDPRESTADOR: TfraPrestador;
    Label2: TLabel;
    edDT_DESCRIPCION: TEdit;
    Label3: TLabel;
    edDT_CANTLUGARES: TSpinEdit;
    Label4: TLabel;
    ShortCutControlHijo: TShortCutControl;
    edDT_PATENTE: TMaskEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    FSQL: String;
    FPrestador: integer;
    procedure SetPrestador(const Value: integer);
    procedure PrestadorChange(Sender: TObject);
  protected
    procedure ClearData; override;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    procedure RefreshData; override;
  public
    property  Prestador: integer read FPrestador write SetPrestador;
  end;

var
  frmManSDT_DETALLETRANSPORTE: TfrmManSDT_DETALLETRANSPORTE;

implementation

uses
  unFiltros, CustomDlgs, General, VCLExtra, SqlFuncs, AnsiSql, unSesion,
  unDmPrincipal, unCustomConsulta;

{$R *.dfm}

procedure TfrmManSDT_DETALLETRANSPORTE.ClearControls;
begin
  VCLExtra.LockControls([fraDT_IDPRESTADOR, edDT_CANTLUGARES], False);
  edDT_DESCRIPCION.Clear;
  edDT_PATENTE.Clear;
  edDT_CANTLUGARES.Value := 0;
  fraDT_IDPRESTADOR.Cargar(fraCA_IDENTIFICADOR.IDPrestador, True);
end;

function TfrmManSDT_DETALLETRANSPORTE.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('DT_ID', sdqConsulta.FieldByName('DT_ID').AsInteger);
     Sql.Fields.Add('DT_FECHABAJA', exDate);
     Sql.Fields.Add('DT_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.Add('DT_ID', ValorSQLInteger('SELECT MAX(DT_ID) FROM SIN.SDT_DETALLETRANSPORTE') + 1);
       Sql.Fields.Add('DT_FECHAALTA', exDate);
       Sql.Fields.Add('DT_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('DT_ID', sdqConsulta.FieldByName('DT_ID').AsInteger);
       Sql.Fields.Add('DT_FECHAMODIF', exDate);
       Sql.Fields.Add('DT_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('DT_IDPRESTADOR', fraDT_IDPRESTADOR.IDPrestador);
     Sql.Fields.Add('DT_DESCRIPCION', edDT_DESCRIPCION.Text);
     Sql.Fields.Add('DT_PATENTE', edDT_PATENTE.Text);
     Sql.Fields.Add('DT_CANTLUGARES', edDT_CANTLUGARES.Value);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManSDT_DETALLETRANSPORTE.LoadControls;
begin
  edDT_DESCRIPCION.Text := sdqConsulta.FieldByName('DT_DESCRIPCION').AsString;
  edDT_PATENTE.Text := sdqConsulta.FieldByName('DT_PATENTE').AsString;
  edDT_CANTLUGARES.Value := sdqConsulta.FieldByName('DT_CANTLUGARES').AsInteger;
  fraDT_IDPRESTADOR.Cargar(sdqConsulta.FieldByName('DT_IDPRESTADOR').AsInteger, True);
  VCLExtra.LockControls([fraDT_IDPRESTADOR, edDT_CANTLUGARES], True);
end;

procedure TfrmManSDT_DETALLETRANSPORTE.RefreshData;
var
  sSQL: String;
begin
  sSQL := FSQL + DoFiltro(pnlFiltros);

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManSDT_DETALLETRANSPORTE.SetPrestador(const Value: integer);
begin
  FPrestador := Value;
  fraCA_IDENTIFICADOR.Cargar(Value, True);
end;

function TfrmManSDT_DETALLETRANSPORTE.Validar: Boolean;
begin
  Verificar(Trim(edDT_DESCRIPCION.Text) = '', edDT_DESCRIPCION, 'Debe completar la descripción.');
  Verificar(Trim(edDT_PATENTE.Text) = '', edDT_PATENTE, 'Debe completar la patente del vehículo.');
  Result := True;
end;

procedure TfrmManSDT_DETALLETRANSPORTE.PrestadorChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmManSDT_DETALLETRANSPORTE.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  fraCA_IDENTIFICADOR.OnChange := PrestadorChange;
  fraCA_IDENTIFICADOR.ExtraCondition := 'and ca_especialidad = ''063''';
  fraDT_IDPRESTADOR.ExtraCondition := 'and ca_especialidad = ''063''';
  inherited;
  Sql.TableName := 'SIN.SDT_DETALLETRANSPORTE';
  FieldBaja     := 'DT_FECHABAJA';
end;

procedure TfrmManSDT_DETALLETRANSPORTE.ClearData;
begin
  fraCA_IDENTIFICADOR.Clear;
  inherited;
end;

procedure TfrmManSDT_DETALLETRANSPORTE.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

procedure TfrmManSDT_DETALLETRANSPORTE.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

end.
