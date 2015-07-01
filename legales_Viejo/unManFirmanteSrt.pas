unit unManFirmanteSrt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, IntEdit, Mask, PatternEdit;

type
  TfrmManFirmanteSrt = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label3: TLabel;
    edFS_CODIGO: TIntEdit;
    edFS_NOMBRE: TEdit;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;

    function DoABM: Boolean; override;
  public
  end;

implementation

uses unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Internet;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmCustomGridABM1 }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFirmanteSrt.ClearControls;
begin
  edFS_CODIGO.Value := GetSecNextVal('LEGALES.SEQ_LFS_ID');
  edFS_NOMBRE.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManFirmanteSrt.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('FS_ID', sdqConsulta.FieldByName('FS_ID').AsInteger);
    Sql.Fields.Add('FS_USUBJA', frmPrincipal.dbLogin.UserId );
    Sql.Fields.Add('FS_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.PrimaryKey.Add('FS_ID', edFS_CODIGO.Value);
    Sql.Fields.Add('FS_FIRMANTESTR', edFS_NOMBRE.Text);
    if ModoABM = maAlta Then
    begin
      Sql.Fields.Add('FS_USUALTA', frmPrincipal.dbLogin.UserId );
      Sql.Fields.Add('FS_FECHAALTA', exDateTime );
    end else begin
      Sql.Fields.Add('FS_USUMODIF', frmPrincipal.dbLogin.UserId );
      Sql.Fields.Add('FS_FECHAMODIF', exDateTime );
      Sql.Fields.Add('FS_USUBJA', exNull );
      Sql.Fields.Add('FS_FECHABAJA', exNull );
    end;
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFirmanteSrt.LoadControls;
begin
  with sdqConsulta do
  begin
    edFS_CODIGO.Value         := FieldByName('FS_ID').AsInteger;
    edFS_NOMBRE.Text          := FieldByName('FS_FIRMANTESTR').AsString;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManFirmanteSrt.Validar: Boolean;
begin
  Result := False;
  if edFS_NOMBRE.Text = '' Then
    InvalidMsg( edFS_NOMBRE, 'Debe ingresar el Apellido y Nombre del firmante' )
  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManFirmanteSrt.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'FS_FECHABAJA';
  Sql.TableName := 'LEGALES.LFS_FIRMANTESRT';
  CheckPK := True;
end;
end.

