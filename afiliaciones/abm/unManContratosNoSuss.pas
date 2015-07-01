unit unManContratosNoSuss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, RxPlacemnt;

type
  TfrmManContratosNoSuss = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure fraEmpresaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure LoadSQL;
  end;

var
  frmManContratosNoSuss: TfrmManContratosNoSuss;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Strfuncs;

{$R *.dfm}

{ TfrmManContratosTrabNoConfirmados }

procedure TfrmManContratosNoSuss.ClearControls;
begin
  fraEmpresa.Clear;
end;

function TfrmManContratosNoSuss.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('cn_id',    sdqConsulta.FieldByName('cn_id').AsInteger);
    Sql.Fields.Add('cn_fechabaja', exDateTime);
    Sql.Fields.Add('cn_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.Fields.Add('cn_fechaalta',        exDateTime);
      Sql.Fields.Add('cn_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('cn_id',     sdqConsulta.FieldByName('cn_id').AsInteger);
      Sql.Fields.Add('cn_fechamodif', exDateTime);
      Sql.Fields.Add('cn_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('cn_contrato', fraEmpresa.Contrato);

  end;

   Result := inherited DoABM;
end;

procedure TfrmManContratosNoSuss.LoadControls;
begin
  fraEmpresa.Contrato := sdqConsulta.FieldByName('cn_contrato').AsInteger;
end;

function TfrmManContratosNoSuss.Validar: Boolean;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'El contrato no puede quedar vacío');
  Result := True;
end;

procedure TfrmManContratosNoSuss.FormCreate(Sender: TObject);
begin
  LoadSQL;
  inherited;
  Sql.TableName := 'AFI.ACN_CONTRATO_NOSUSS';
  FieldBaja     := 'cn_fechabaja';
  fraEmpresa.ShowBajas := True;
end;

procedure TfrmManContratosNoSuss.fraEmpresaExit(Sender: TObject);
var sSql : String;
begin
  inherited;
  fraEmpresa.FrameExit(Sender);
  sSql := 'SELECT 1 FROM aem_empresa WHERE em_id =:id AND em_suss = 2';
  if not ExisteSQLex(sSql, [fraEmpresa.Value]) then
  begin
    ShowMessage('La empresa debe ser NO SUSS');
    fraEmpresa.Clear;
  end;

end;

procedure TfrmManContratosNoSuss.LoadSQL;
begin
  sdqConsulta.SQL.Text :=
    'SELECT cn_id, em_cuit, em_nombre, cn_contrato, cn_fechaalta, cn_usualta, ' +
    '       cn_fechamodif, cn_usumodif, cn_fechabaja, cn_usubaja' +
    ' FROM afi.acn_contrato_nosuss' +
    ' LEFT JOIN aco_contrato ON co_contrato = cn_contrato' +
    ' LEFT JOIN aem_empresa ON em_id = co_idempresa';
end;

end.
