unit unManVendedoresPorCanal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion, unfraVendedores,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraCanal;

type
  TfrmManVendedoresPorCanal = class(TfrmCustomGridABM)
    fraVE_IDCANAL: TfraCanal;
    Label6: TLabel;
    Label1: TLabel;
    fraVE_ID: TfraVendedores;
    Label2: TLabel;
    Label3: TLabel;
    frafpVE_IDCANAL: TfraCanal;
    frafpVE_ID: TfraVendedores;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmManVendedoresPorCanal: TfrmManVendedoresPorCanal;

implementation

uses
  unFiltros, CustomDlgs, SQLFuncs, VCLExtra;

{$R *.DFM}

{ TfrmManVendedoresPorCanal }

procedure TfrmManVendedoresPorCanal.ClearControls;
begin
  frafpVE_IDCANAL.Clear;
  frafpVE_ID.Clear;
  VCLExtra.LockControls([frafpVE_ID], False);
end;

function TfrmManVendedoresPorCanal.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'xve_vendedor';
  Sql.SqlType := stUpdate;

  if ModoABM = maBaja then
  begin
    Sql.Fields.Add('ve_idcanal', exNull);
    Sql.PrimaryKey.Add('ve_id', sdqConsulta.FieldByName('ve_id').AsInteger, False);
  end
  else
  begin
    Sql.Fields.Add('ve_idcanal', frafpVE_IDCANAL.Value);
    Sql.PrimaryKey.Add('ve_id', frafpVE_ID.Value, False);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManVendedoresPorCanal.LoadControls;
begin
  frafpVE_IDCANAL.Value := sdqConsulta.FieldByName('ca_id').AsInteger;
  frafpVE_ID.Clear;
  frafpVE_ID.Value := sdqConsulta.FieldByName('ve_id').AsInteger;
  VCLExtra.LockControls([frafpVE_ID], True);
end;

function TfrmManVendedoresPorCanal.Validar: Boolean;
begin
  Verificar(frafpVE_IDCANAL.IsEmpty, frafpVE_IDCANAL.edCodigo, 'Debe indicar el Canal a relacionar.');
  Verificar(frafpVE_ID.IsEmpty, frafpVE_ID.edCodigo, 'Debe indicar el Vendedor a relacionar.');
  Result := True;    
end;

procedure TfrmManVendedoresPorCanal.FormCreate(Sender: TObject);
begin
  inherited;
  
  ShowActived := False;

  fraVE_IDCANAL.FiltraUsuario := False;
  frafpVE_IDCANAL.FiltraUsuario := False;
end;

procedure TfrmManVendedoresPorCanal.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT ca_id, ca_descripcion, ve_id, ve_vendedor, ve_nombre' +
     ' FROM aca_canal, xve_vendedor' +
    ' WHERE ca_id = ve_idcanal' +
            DoFiltro(pnlFiltros);

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  
  inherited;
end;

procedure TfrmManVendedoresPorCanal.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  
  fraVE_IDCANAL.Clear;
  fraVE_ID.Clear;
end;

end.
