unit unManContratosTrabNoConfirmados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa;

type
  TfrmManContratosTrabNoConfirmados = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
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
  frmManContratosTrabNoConfirmados: TfrmManContratosTrabNoConfirmados;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Strfuncs;

{$R *.dfm}

{ TfrmManContratosTrabNoConfirmados }

procedure TfrmManContratosTrabNoConfirmados.ClearControls;
begin
  fraEmpresa.Clear;
end;

function TfrmManContratosTrabNoConfirmados.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('ct_id',    sdqConsulta.FieldByName('ct_id').AsInteger);
    Sql.Fields.Add('ct_fechabaja', exDateTime);
    Sql.Fields.Add('ct_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.Fields.Add('ct_fechaalta',        exDateTime);
      Sql.Fields.Add('ct_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('ct_id',     sdqConsulta.FieldByName('ct_id').AsInteger);
      Sql.Fields.Add('ct_fechamodif', exDateTime);
      Sql.Fields.Add('ct_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('ct_contrato', fraEmpresa.Contrato);

  end;

   Result := inherited DoABM;
end;

procedure TfrmManContratosTrabNoConfirmados.LoadControls;
begin
  fraEmpresa.Contrato := sdqConsulta.FieldByName('ct_contrato').AsInteger;
end;

function TfrmManContratosTrabNoConfirmados.Validar: Boolean;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'El contrato no puede quedar vacío');
  Result := True;
end;

procedure TfrmManContratosTrabNoConfirmados.FormCreate(Sender: TObject);
begin
  LoadSQL;
  inherited;
  Sql.TableName := 'afi.act_cont_trab_noconf';
  FieldBaja     := 'ct_fechabaja';
end;

procedure TfrmManContratosTrabNoConfirmados.LoadSQL;
begin
  sdqConsulta.SQL.Text :=
    'SELECT ct_id, em_cuit, em_nombre, ct_contrato, ct_fechaalta, ct_usualta, ct_fechamodif, ct_usumodif, ct_fechabaja, ct_usubaja' +
    ' FROM afi.act_cont_trab_noconf' +
    ' LEFT JOIN aco_contrato ON co_contrato = ct_contrato' +
    ' LEFT JOIN aem_empresa ON em_id = co_idempresa';
end;

end.
