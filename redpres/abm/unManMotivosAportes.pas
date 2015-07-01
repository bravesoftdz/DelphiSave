unit unManMotivosAportes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosAportes = class(TfrmCustomGridABM)
    Label1: TLabel;
    gbMotivode: TGroupBox;
    rbBajaABM: TRadioButton;
    rbModifABM: TRadioButton;
    chkSiguienteABM: TCheckBox;
    edCodigoABM: TEdit;
    edDescripcionABM: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManMotivosAportes: TfrmManMotivosAportes;

implementation

uses
  CustomDlgs, StrFuncs, unSesion, SqlFuncs, AnsiSql, unCustomConsulta;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmManMotivosAportes.ClearControls;
begin
  rbBajaABM.Checked       := False;
  rbModifABM.Checked      := False;
  chkSiguienteABM.Checked := False;
  edCodigoABM.Clear;
  edDescripcionABM.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManMotivosAportes.LoadControls;
begin
  rbBajaABM.Checked       := (sdqConsulta.FieldByName('ma_esbaja').AsString = 'S');
  rbModifABM.Checked      := (sdqConsulta.FieldByName('ma_esbaja').AsString = 'N');
  chkSiguienteABM.Checked := (sdqConsulta.FieldByName('ma_periodosiguiente').AsString = 'S');
  edCodigoABM.Text        := sdqConsulta.FieldByName('ma_codigo').AsString;
  edDescripcionABM.Text   := sdqConsulta.FieldByName('ma_descripcion').AsString;
end;
{-------------------------------------------------------------------------------}
function TfrmManMotivosAportes.Validar: Boolean;
begin
  Verificar(not(rbBajaABM.Checked) and not(rbModifABM.Checked), gbMotivode, 'Debe seleccionar el motivo.');
  Verificar(rbModifABM.Checked and chkSiguienteABM.Checked, chkSiguienteABM, 'Esta opción es sólo para las bajas.');
  Verificar(Trim(edCodigoABM.Text) = '', edCodigoABM, 'Debe ingresar el código.');
  Verificar(Trim(edDescripcionABM.Text) = '', edDescripcionABM, 'Debe ingresar la descripción.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmManMotivosAportes.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'sin.sma_motivosaportes';

    case ModoABM of
      maAlta, maModificacion:
      begin
        if ModoABM = maAlta then
        begin
          SqlType := stInsert;
          Fields.Add('ma_usualta', Sesion.UserID);
          Fields.Add('ma_fechaalta', exDateTime);
        end
        else begin
          SqlType := stUpdate;
          PrimaryKey.Add('ma_id', sdqConsulta.FieldByName('ma_id').AsInteger, False);
          Fields.Add('ma_usumodif', Sesion.UserID);
          Fields.Add('ma_fechamodif', exDateTime);
        end;
        Fields.Add('ma_esbaja', SqlBoolean(rbBajaABM.Checked, False));
        Fields.Add('ma_periodosiguiente', SqlBoolean(chkSiguienteABM.Checked, False));
        Fields.Add('ma_codigo', Trim(edCodigoABM.Text));
        Fields.Add('ma_descripcion', Trim(edDescripcionABM.Text));
      end;

      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('ma_id', sdqConsulta.FieldByName('ma_id').AsInteger, False);
        Fields.Add('ma_usubaja', Sesion.UserID);
        Fields.Add('ma_fechabaja', exDateTime);
      end;
    end;

    Result := inherited DoABM;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManMotivosAportes.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ma_fechabaja';
end;
{-------------------------------------------------------------------------------}
procedure TfrmManMotivosAportes.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT ma_id, ma_codigo, ma_descripcion, ma_periodosiguiente, ma_esbaja, ' +
                ' ma_fechabaja, DECODE(ma_esbaja, ''S'', ''Baja'', ''N'', ''Modificación'') motivo ' +
           ' FROM sin.sma_motivosaportes';
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManMotivosAportes.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  LockControl(gbMotivode, (ModoABM = maModificacion));
end;
{-------------------------------------------------------------------------------}
end.
