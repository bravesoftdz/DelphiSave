unit unAbmPatronesBusqueda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, StdCtrls, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, IntEdit, Mask, PatternEdit, unArtFrame,
  unFraCodigoDescripcion, unArtDBAwareFrame;

type
  TfrmAbmPatronesBusqueda = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label3: TLabel;
    edID: TIntEdit;
    edValor: TEdit;
    fraCampos: TfraCodigoDescripcion;
    lblCampo: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FIdSumario: Integer;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    procedure MostrarPatronesBusqueda(IdSumario: Integer);
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Internet;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmCustomGridABM1 }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAbmPatronesBusqueda.ClearControls;
begin
  edID.Value := GetSecNextVal('LEGALES.SEQ_LPA_ID');
  edValor.Clear;
  fraCampos.Clear;
end;

function TfrmAbmPatronesBusqueda.DoABM: Boolean;
begin
  Result := False;

  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('PA_ID',        sdqConsulta.FieldByName('PA_ID').AsInteger);
    Sql.PrimaryKey.Add('PA_IDSUMARIO', FIdSumario);
    Sql.Fields.Add('PA_USUBAJA',       frmPrincipal.dbLogin.UserId);
    Sql.Fields.Add('PA_FECHABAJA',     exDateTime);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    Sql.PrimaryKey.Add('PA_ID',          edID.Value);
    Sql.PrimaryKey.Add('PA_IDSUMARIO',   FIdSumario);
    Sql.Fields.Add('PA_VALORBUSQUEDA',   edValor.Text);
    Sql.Fields.Add('PA_IDCAMPOBUSQUEDA', fraCampos.Codigo);
    if ModoABM = maAlta Then
    begin
      Sql.Fields.Add('PA_USUALTA',   frmPrincipal.dbLogin.UserId);
      Sql.Fields.Add('PA_FECHAALTA', exDateTime);
    end
    else
    begin
      Sql.Fields.Add('PA_USUMODIF',   frmPrincipal.dbLogin.UserId);
      Sql.Fields.Add('PA_FECHAMODIF', exDateTime);
      Sql.Fields.Add('PA_USUBAJA',    exNull);
      Sql.Fields.Add('PA_FECHABAJA',  exNull);
    end;
  end;

  try
    EjecutarSqlST(GetSqlABM);
    Result := True;
  except
    on E: Exception do
      ErrorMsg(E);
  end;
end;

procedure TfrmAbmPatronesBusqueda.LoadControls;
begin
  with sdqConsulta do
  begin
    edID.Value       := FieldByName('PA_ID').AsInteger;
    fraCampos.Codigo := FieldByName('PA_IDCAMPOBUSQUEDA').AsString;
    edValor.Text     := FieldByName('PA_VALORBUSQUEDA').AsString;
  end;
end;

function TfrmAbmPatronesBusqueda.Validar: Boolean;
begin
  Result := False;
  if not fraCampos.IsSelected then
    InvalidMsg(fraCampos, 'Debe ingresar el campo por el cual se realizará la búsqueda.');
  if Trim(edValor.Text) = '' then
    InvalidMsg(edValor, 'Debe ingresar el valor a buscar.')
  else
    Result := True;
end;

procedure TfrmAbmPatronesBusqueda.FormCreate(Sender: TObject);
begin
  inherited;
  
  FieldBaja := 'PA_FECHABAJA';
  Sql.TableName := 'legales.lpa_patronesantecedente';
  CheckPK := True;

  with fraCampos do
  begin
    TableName   := 'legales.LCA_CAMPOSBUSQUEDA';
    FieldID     := 'ca_id';
    FieldCodigo := 'ca_id';
    FieldDesc   := 'ca_descripcion';
  end;
end;

procedure TfrmAbmPatronesBusqueda.MostrarPatronesBusqueda(IdSumario: Integer);
begin
  FIdSumario := IdSumario;

  sdqConsulta.SQL.Text :=
    'SELECT *' +
     ' FROM legales.LCA_CAMPOSBUSQUEDA LCA, legales.lpa_patronesantecedente LPA' +
    ' WHERE LCA.ca_id = LPA.pa_idcampobusqueda' +
      ' AND LPA.pa_idsumario = ' + SqlValue(FIdSumario);
  tbRefrescarClick(Self);

  Self.Visible := False;
  Self.ShowModal;
end;

end.
