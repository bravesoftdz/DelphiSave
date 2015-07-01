unit unHistoricoCargaNomina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, FormPanel, StdCtrls, PeriodoPicker, Mask, ToolEdit;

type
  TfrmHistoricoCargaNomina = class(TfrmCustomConsulta)
    fpObservaciones: TFormPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFechaRecepcion: TDateEdit;
    edPeriodo: TPeriodoPicker;
    memoObservaciobes: TMemo;
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fpObservacionesBeforeShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FContrato: Integer;

    procedure FormateaPeriodo(aSender: TField; var aText: String; aDisplayText: Boolean);
    procedure FormateaTexto(aSender: TField; var aText: String; aDisplayText: Boolean);
    procedure SetContrato(const Value: Integer);
  public
    property Contrato: Integer read FContrato write SetContrato;
  end;

var
  frmHistoricoCargaNomina: TfrmHistoricoCargaNomina;

implementation

uses
  AnsiSql, General, CustomDlgs, SqlFuncs, Strfuncs, unPrincipal, unSesion, unDmPrincipal;

{$R *.DFM}

procedure TfrmHistoricoCargaNomina.FormateaPeriodo(aSender: TField; var aText: String; aDisplayText: Boolean);
begin
  try
    aText := Format('%s-%s', [Copy(aSender.AsString, 1, 4), Copy(aSender.AsString, 5, 2)]);
  except
    aText := aSender.AsString;
  end;
end;

procedure TfrmHistoricoCargaNomina.FormateaTexto(aSender: TField; var aText: String; aDisplayText: Boolean);
begin
  try
    aText := CurrToStrF(StrToCurr(aSender.AsString), ffCurrency, 2)
  except
    aText := aSender.AsString;
  end;
end;

procedure TfrmHistoricoCargaNomina.SetContrato(const Value: Integer);
begin
  FContrato := Value;
  tbRefrescarClick(nil);
end;

procedure TfrmHistoricoCargaNomina.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM adn_diskettenomina' +
    ' WHERE dn_contrato = ' + SqlValue(FContrato);

  sdqConsulta.SQL.Text := sSql;

  inherited;

  if sdqConsulta.IsEmpty then
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
end;

procedure TfrmHistoricoCargaNomina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmHistoricoCargaNomina := nil;

  inherited;
end;

procedure TfrmHistoricoCargaNomina.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
    FieldByName('dn_totalmasadsk').OnGetText     := FormateaTexto;
    FieldByName('dn_totalmasaaltadsk').OnGetText := FormateaTexto;
    FieldByName('dn_cantidadbajabase').OnGetText := FormateaTexto;
    FieldByName('dn_totalmasabase').OnGetText    := FormateaTexto;
    FieldByName('dn_periodo').OnGetText          := FormateaPeriodo;
  end;
end;

procedure TfrmHistoricoCargaNomina.tbPropiedadesClick(Sender: TObject);
begin
  if fpObservaciones.ShowModal = mrOk then
  begin
    with TSql.Create('adn_diskettenomina') do
    try
      SqlType := stInsert;

      Fields.AddExpression('dn_id',       'SEQ_ADN_ID.NEXTVAL');
      Fields.Add('dn_contrato',            FContrato);
      Fields.Add('dn_idestablecimiento',   -1);
      Fields.Add('dn_estado',              '-1');
      Fields.Add('dn_periodo',             StrReplace(edPeriodo.Periodo.Valor, '/', ''));
      Fields.Add('dn_actualizamovimiento', '-');
      Fields.Add('dn_usualta',             Format('%s/%s', [frmPrincipal.DBLogin.WindowsComputerName, Sesion.UserID]));
      Fields.Add('dn_fechaalta',           exDateTime);
      Fields.Add('dn_fecharecepcion',      edFechaRecepcion.Date);
      Fields.Add('dn_observaciones',       memoObservaciobes.Lines.Text);
      Fields.Add('dn_disketteaveriado',    'T');

      EjecutarSql(Sql);

      tbRefrescarClick(nil);
    finally
      Free;
    end;
  end;
end;

procedure TfrmHistoricoCargaNomina.fpObservacionesBeforeShow(Sender: TObject);
begin
  edFechaRecepcion.Clear;
  edPeriodo.Clear;
  memoObservaciobes.Clear;
end;

procedure TfrmHistoricoCargaNomina.btnAceptarClick(Sender: TObject);
begin
  Verificar((edFechaRecepcion.Date = 0), edFechaRecepcion, 'El campo Fecha de Recepción es obligatorio.');
  Verificar((edPeriodo.Text = ''), edPeriodo, 'El campo Período es obligatorio.');
  Verificar((memoObservaciobes.Lines.Text = ''), memoObservaciobes, 'El campo Observaciones es obligatorio.');

  fpObservaciones.ModalResult := mrOk;
end;

end.
