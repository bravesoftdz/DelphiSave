unit unManCTB_CODRE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, PatternEdit, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, Mask, unArtDBAwareFrame;

type
  TfrmManCTB_CODRE = class(TfrmManCtbTablas)
    fraTB_ESPECIAL1: TfraCtbTablas;
    chkEndoso: TCheckBox;
    procedure FormCreate(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function GetSql: String; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure DoABMAddFields; override;
    procedure LoadControls; override;
    procedure SetEspecialVisible(const Value: Boolean); override;
  end;

var
  frmManCTB_CODRE: TfrmManCTB_CODRE;

implementation

uses
  unPrincipal, CustomDlgs, AnsiSql, unDmPrincipal;

{$R *.DFM}

procedure TfrmManCTB_CODRE.ClearControls;
begin
  inherited;
  
  fraTB_ESPECIAL1.Clear;
  chkEndoso.Checked := False;
end;

function TfrmManCTB_CODRE.DoABM: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT tb_especial2' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''CORRE''' +
      ' AND tb_codigo = :codigo';
  edEspecial.Text := ValorSqlEx(sSql, [fraTB_ESPECIAL1.Value]);
  
  Result := inherited DoABM;
end;

procedure TfrmManCTB_CODRE.DoABMAddFields;
begin
  inherited;
  if chkEndoso.Checked then
    Sql.Fields.Add('tb_especial2', '1')
  else
    Sql.Fields.Add('tb_especial2', '0')
end;

procedure TfrmManCTB_CODRE.FormCreate(Sender: TObject);
begin
  inherited;
  Clave                 := 'CODRE';
  fraTB_ESPECIAL1.Clave := 'CORRE';
  EspecialVisible       := True;
end;

procedure TfrmManCTB_CODRE.LoadControls;
begin
  inherited;
  
  fraTB_ESPECIAL1.Value := sdqConsulta.FieldByName('tb_especial1').AsString;
  chkEndoso.Checked     := (sdqConsulta.FieldByName('tb_especial2').AsString = '1');
end;

procedure TfrmManCTB_CODRE.SetEspecialVisible(const Value: Boolean);
begin
  inherited;
  
  edEspecial.Visible := False;
end;

function TfrmManCTB_CODRE.Validar: Boolean;
begin
  Result := inherited Validar;
  
  if Result and fraTB_ESPECIAL1.IsEmpty then
  begin
    Result := False;
    InvalidMsg(fraTB_ESPECIAL1.edCodigo, 'Debe seleccionar el Correo.');
  end;
end;

function TfrmManCTB_CODRE.GetSql: String;
var
  sSql: String;
begin
  Result := inherited GetSQL;
  sSql := sdqConsulta.SQL.Text;
  Result := sSql;
end;

end.
