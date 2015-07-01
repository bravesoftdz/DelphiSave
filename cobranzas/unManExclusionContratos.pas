unit unManExclusionContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS;

type
  TfrmManExclusionContratos = class(TfrmCustomGridABM)
    fraEmpresaBusq: TfraEmpresa;
    fraEmpresaAlta: TfraEmpresa;
    Label1: TLabel;
    edMotivo: TMemo;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;  
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, unSesion, SqlFuncs, CustomDlgs;

{$R *.DFM}

procedure TfrmManExclusionContratos.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';

  sSql :=
    'SELECT EM_ID, EM_CONTRATO, EM_FECHAALTA, EM_FECHABAJA, EM_MOTIVO' +
     ' FROM ZEM_EMPRESAEXCLUIDAPLAN' +
    ' WHERE 1 = 1';

  if fraEmpresaBusq.IsSelected then
    sWhere := sWhere + ' AND EM_CONTRATO = ' + SqlValue(fraEmpresaBusq.edContrato.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManExclusionContratos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaBusq.Clear;
end;

procedure TfrmManExclusionContratos.ClearControls;
begin
  fraEmpresaAlta.Clear;
  edMotivo.Clear;
end;

function TfrmManExclusionContratos.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('EM_ID',    sdqConsulta.FieldByName('EM_ID').AsInteger);
    Sql.Fields.Add('EM_FECHABAJA', exDate);
    Sql.Fields.Add('EM_USUBAJA',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('EM_ID',    GetSecNextVal('SEQ_ZEM_ID'));
      Sql.Fields.Add('EM_CONTRATO',  fraEmpresaAlta.edContrato.Value);
      Sql.Fields.Add('EM_MOTIVO',    edMotivo.Lines.Text);
      Sql.Fields.Add('EM_FECHAALTA', exDate);
      Sql.Fields.Add('EM_USUALTA',   Sesion.UserID);
      Sql.SqlType := stInsert;
    end;

   Result := inherited DoABM;
end;

function TfrmManExclusionContratos.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraEmpresaAlta.IsEmpty, fraEmpresaAlta.edContrato, 'Debe ingresar el contrato.');

  sSql :=
    'SELECT COUNT(*)' +
     ' FROM ZEM_EMPRESAEXCLUIDAPLAN' +
    ' WHERE EM_CONTRATO = :p1' +
      ' AND EM_FECHABAJA IS NULL';

  Verificar(ValorSqlIntegerEx(sSql, [fraEmpresaAlta.edContrato.Value]) >= 1, fraEmpresaAlta.edContrato, 'El contrato ya se encuentra excluido.');

  Result := True;
end;

procedure TfrmManExclusionContratos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuGestionExclusionContratos.Enabled := True;
end;

procedure TfrmManExclusionContratos.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'ZEM_EMPRESAEXCLUIDAPLAN';
  FieldBaja     := 'EM_FECHABAJA';

  fraEmpresaBusq.ShowBajas := True;
  fraEmpresaAlta.ShowBajas := True;
end;

procedure TfrmManExclusionContratos.LoadControls;
begin
  inherited;
end;

end.
