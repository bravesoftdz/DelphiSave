unit unManEmpresasPagoDirectoILT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManEmpresasPagoDirectoILT = class(TfrmCustomGridABM)
    fraEmpresaPagoDir: TfraEmpresa;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;

  public
    { Public declarations }
  end;

var
  frmManEmpresasPagoDirectoILT: TfrmManEmpresasPagoDirectoILT;

implementation

uses unArt, CustomDlgs, SqlFuncs, unSesion, AnsiSql, unDmPrincipal;

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TfrmManEmpresasPagoDirectoILT.ClearControls;
begin
  fraEmpresaPagoDir.Clear;
end;
{------------------------------------------------------------------------------}
function TfrmManEmpresasPagoDirectoILT.DoABM: Boolean;
var
  PDIId: TTableId;
begin
  Sql.Clear;
  Sql.TableName := 'sin.spd_empresaspagodirecto';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    PDIId := sdqConsulta.FieldByName('pd_id').AsInteger;

    Sql.Fields.Add('pd_usubaja',   Sesion.UserID);
    Sql.Fields.Add('pd_fechabaja', SQL_ACTUALDATE, False);
  end
  else begin
    Sql.SqlType := stInsert;
    PDIId  := GetSecNextVal('sin.seq_spd_id');

    Sql.Fields.Add('pd_usualta',   Sesion.UserID);
    Sql.Fields.Add('pd_fechaalta', SQL_ACTUALDATE, False);
    Sql.Fields.Add('pd_cuit',      fraEmpresaPagoDir.CUIT);
  end;

  Sql.PrimaryKey.Add('pd_id', PDIId, False);

  Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
function TfrmManEmpresasPagoDirectoILT.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraEmpresaPagoDir.IsEmpty, fraEmpresaPagoDir.mskCUIT, 'Debe ingresar una empresa');
  sSql := 'SELECT 1 ' +
           ' FROM sin.spd_empresaspagodirecto ' +
          ' WHERE pd_cuit = :cuit ' +
            ' AND pd_fechabaja IS NULL ';
  Verificar(ExisteSqlEx(sSql, [fraEmpresaPagoDir.CUIT]), fraEmpresaPagoDir.mskCUIT, 'La empresa ya está ingresada.');
  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmManEmpresasPagoDirectoILT.FormCreate(Sender: TObject);
begin
  fraEmpresaPagoDir.ShowBajas   := True;
  fraEmpresaPagoDir.UltContrato := True;
  FieldBaja := 'pd_fechabaja';
  inherited;
end;
{------------------------------------------------------------------------------}
end.
