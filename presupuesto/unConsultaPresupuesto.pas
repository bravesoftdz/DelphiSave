unit unConsultaPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  StdCtrls;

type
  TfrmConsultaPresupuesto = class(TfrmCustomConsulta)
    Label5: TLabel;
    fraPresupuesto: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    procedure DoCargarUltimoPresupuesto;
  public
  end;

var
  frmConsultaPresupuesto: TfrmConsultaPresupuesto;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, SqlFuncs, unArt, CustomDlgs;

procedure TfrmConsultaPresupuesto.FormCreate(Sender: TObject);
begin
  inherited;

  with fraPresupuesto do
    begin
      TableName      := 'OPR_PRESUPUESTO';
      FieldID        := 'PR_ID';
      FieldCodigo    := 'PR_ID';
      FieldDesc      := '''Año '' || PR_AÑO || '' - Versión '' || PR_VERSION';
      FieldBaja      := 'PR_FECHABAJA';
      ShowBajas      := False;
    end;

  DoCargarUltimoPresupuesto;
end;

procedure TfrmConsultaPresupuesto.tbRefrescarClick(Sender: TObject);
var
  sSql, sOrden: String;
  iCorte: Integer;
begin
  Verificar(fraPresupuesto.IsEmpty, nil, 'Debe seleccionar un presupuesto.');

  iCorte := 1;   // anual

  sSql := 'SELECT LPAD('' '', PC_NIVEL * 3, '' '') || PC_DESCRIPCION CONCEPTO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 1) ENERO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 2) FEBRERO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 3) MARZO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 4) ABRIL, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 5) MAYO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 6) JUNIO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 7) JULIO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 8) AGOSTO, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 9) SEPTIEMBRE, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 10) OCTUBRE, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 11) NOVIEMBRE, ' +
           'CONT.GET_IMPORTECONCEPTOPRESUPUESTO(:idpresupuesto, PC_ID, :corte, 12) DICIEMBRE ' +
      'FROM OPC_PRESUPUESTOCONCEPTO ' +
     'WHERE PC_FECHABAJA IS NULL ';

  sOrden := ' ORDER BY PC_ORDEN';

  sdqConsulta.SQL.Text := sSql + sOrden;
  sdqConsulta.ParamByName('idpresupuesto').AsInteger := fraPresupuesto.Value;
  sdqConsulta.ParamByName('corte').AsInteger         := iCorte;

  inherited;
end;

procedure TfrmConsultaPresupuesto.tbLimpiarClick(Sender: TObject);
begin
  fraPresupuesto.Clear;

  inherited;
end;

procedure TfrmConsultaPresupuesto.DoCargarUltimoPresupuesto;
var
  sSql: String;
begin
  sSql := 'SELECT PR_ID ' +
            'FROM OPR_PRESUPUESTO ' +
           'WHERE PR_ACTUAL = ''S'' ' +
             'AND PR_FECHABAJA IS NULL';
  fraPresupuesto.Value := ValorSqlInteger(sSql);
end;

procedure TfrmConsultaPresupuesto.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('ENERO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('ENERO')).Currency := True;

  if sdqConsulta.FieldByName('FEBRERO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('FEBRERO')).Currency := True;

  if sdqConsulta.FieldByName('MARZO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('MARZO')).Currency := True;

  if sdqConsulta.FieldByName('ABRIL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('ABRIL')).Currency := True;

  if sdqConsulta.FieldByName('MAYO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('MAYO')).Currency := True;

  if sdqConsulta.FieldByName('JUNIO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('JUNIO')).Currency := True;

  if sdqConsulta.FieldByName('JULIO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('JULIO')).Currency := True;

  if sdqConsulta.FieldByName('AGOSTO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('AGOSTO')).Currency := True;

  if sdqConsulta.FieldByName('SEPTIEMBRE') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('SEPTIEMBRE')).Currency := True;

  if sdqConsulta.FieldByName('OCTUBRE') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('OCTUBRE')).Currency := True;

  if sdqConsulta.FieldByName('NOVIEMBRE') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('NOVIEMBRE')).Currency := True;

  if sdqConsulta.FieldByName('DICIEMBRE') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('DICIEMBRE')).Currency := True;
end;

end.

