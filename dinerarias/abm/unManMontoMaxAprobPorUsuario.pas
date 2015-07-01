unit unManMontoMaxAprobPorUsuario;      // por TK 43455

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unfraUsuarios,
  Mask, ToolEdit, CurrEdit, SqlFuncs, unSesion, General, unDmPrincipal, CustomDlgs,
  AnsiSql, VCLExtra;

type
  TfrmManMontoMaxAprobPorUsuario = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraUsuario: TfraUsuario;
    Label2: TLabel;
    pnlTipoLiquidacion: TPanel;
    rbILT: TRadioButton;
    rbILP: TRadioButton;
    Label3: TLabel;
    edMontoMaximo: TCurrencyEdit;
    pnlLimite: TPanel;
    rbSinLimite: TRadioButton;
    rbConLimite: TRadioButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbILPClick(Sender: TObject);
    procedure rbILTClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rbConLimiteClick(Sender: TObject);
    procedure rbSinLimiteClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
  private
    { Private declarations }
    procedure Do_ResaltarRB;
    procedure Do_HabMontoMaximo;

  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

  public
    { Public declarations }
  end;

var
  frmManMontoMaxAprobPorUsuario: TfrmManMontoMaxAprobPorUsuario;

implementation

{$R *.dfm}

procedure TfrmManMontoMaxAprobPorUsuario.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  inherited;
  sSql := 'SELECT mu_id, se_nombre usuario, decode(mu_montomax, 0, ''Sin límite'', mu_montomax) montomax, mu_montomax, ' +
                ' decode(mu_tipoliq,''I'', ''ILP'', ''ILT'') TipoLiq, mu_fechabaja, mu_usuario, mu_tipoliq ' +
           ' FROM sin.smu_montomaxaprobporusuario, art.use_usuarios ' +
          ' WHERE mu_usuario = se_usuario ' +
            ' AND mu_fechabaja is null ';  // no muestro los dados de baja

  sdqConsulta.SQL.Text := ssql;
  sdqConsulta.Open;
end;

procedure TfrmManMontoMaxAprobPorUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  FieldBaja     := 'MU_FECHABAJA';
  Sql.TableName := 'SIN.SMU_MONTOMAXAPROBPORUSUARIO';
  tbRefrescarClick(nil);
end;

procedure TfrmManMontoMaxAprobPorUsuario.ClearControls;
begin
 fraUsuario.Clear;
 rbILP.Checked := false;
 rbILT.Checked := false;
 edMontoMaximo.Clear;
 rbConLimite.Checked := True;
 rbSinLimite.Checked := False;
 LockControls([edMontoMaximo], False);
 rbILP.Font.Style := [];
 rbILT.Font.Style := [];
 rbILT.Font.Color := clWindowText;
 rbILP.Font.Color := clWindowText;
end;

function TfrmManMontoMaxAprobPorUsuario.DoABM: Boolean;
var sTipoLiq: string;
begin
  with Sql do
  begin
    Clear;
    case ModoABM of

      maAlta, maModificacion:
      begin
        if (ModoABM = maAlta) then
        begin
          SqlType := stInsert;
          Fields.Add('mu_usuario', Trim(fraUsuario.edCodigo.text));
          Fields.Add('mu_fechaalta', exDateTime);
          Fields.Add('mu_usualta', Sesion.UserID);
        end
        else begin
          SqlType := stUpdate;
          PrimaryKey.Add('mu_id', sdqConsulta.FieldByName('mu_id').AsInteger, False);
          Fields.Add('mu_usumodif', Sesion.UserID);
          Fields.Add('mu_fechamodif', exDateTime);
        end;
        if rbILP.Checked then
          sTipoLiq := 'I'
        else
          sTipoLiq := 'L';
        Fields.Add('mu_tipoliq', sTipoLiq);
        Fields.Add('mu_montomax', edMontoMaximo.Value);
      end;

      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('mu_id',    sdqConsulta.FieldByName('mu_id').AsString);
        Fields.Add('mu_usubaja',   Sesion.UserID);
        Fields.Add('mu_fechabaja', exDateTime);
      end;

    end;
    Result := inherited DoABM;
  end;
end;

procedure TfrmManMontoMaxAprobPorUsuario.LoadControls;
var bSinLimite: boolean;
begin
  fraUsuario.edCodigo.text       := sdqConsulta.FieldByName('mu_usuario').AsString;
  fraUsuario.cmbDescripcion.text := sdqConsulta.FieldByName('usuario').AsString;;
  
  rbILP.Checked            := (sdqConsulta.FieldByName('mu_tipoliq').AsString = 'I');
  rbILT.Checked            := (sdqConsulta.FieldByName('mu_tipoliq').AsString = 'L');

  edMontoMaximo.Value      := sdqConsulta.FieldByName('mu_montomax').AsCurrency;
  bSinLimite := (sdqConsulta.FieldByName('mu_montomax').AsCurrency = 0);
  rbConLimite.Checked      := not bSinLimite;
  rbSinLimite.Checked      := bSinLimite;
end;

function TfrmManMontoMaxAprobPorUsuario.Validar: Boolean;
var sSql, sTipoLiq: string;
begin
  Verificar(Trim(fraUsuario.edCodigo.Text) = '', fraUsuario, 'Debe completar el Usuario');
  Verificar((not rbILP.Checked) and (not rbILT.Checked), pnlTipoLiquidacion, 'Debe completar el Tipo de Liquidación');
  Verificar((edMontoMaximo.Value = 0) and rbConLimite.Checked, edMontoMaximo, 'Debe completar el Monto máximo');

  if (ModoABM = maAlta) then
  begin
    if rbILP.Checked then
      sTipoLiq := 'I'
    else
      sTipoLiq := 'L';

    sSql := 'SELECT 1 FROM sin.smu_montomaxaprobporusuario ' +
            ' WHERE mu_usuario = ' + SqlValue(fraUsuario.edCodigo.text) +
              ' AND mu_tipoliq = ' + SqlValue(sTipoLiq) +
              ' AND mu_fechabaja is null';
    Verificar(ExisteSql(sSql), fraUsuario, 'La relación Usuario-Tipo Liquidación ya existe en la tabla');
  end;

  Result := True;
end;

procedure TfrmManMontoMaxAprobPorUsuario.rbILPClick(Sender: TObject);
begin
  Do_ResaltarRB;
end;

procedure TfrmManMontoMaxAprobPorUsuario.rbILTClick(Sender: TObject);
begin
  Do_ResaltarRB;
end;

procedure TfrmManMontoMaxAprobPorUsuario.Do_ResaltarRB;
begin
  if rbILP.Checked then
  begin
    rbILP.Font.Style := [fsBold];
    rbILP.Font.Color := clMaroon;
    rbILT.Font.Style := [];
    rbILT.Font.Color := clWindowText;
  end
  else begin
    rbILP.Font.Style := [];
    rbILP.Font.Color := clWindowText;
    rbILT.Font.Style := [fsBold];
    rbILT.Font.Color := clNavy;
  end;
end;

procedure TfrmManMontoMaxAprobPorUsuario.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (sdqconsulta.FieldByName('mu_tipoliq').AsString = 'I') then
    AFont.Color := IIF(Highlight, clBtnHighlight, clMaroon)
  else if (sdqconsulta.FieldByName('mu_tipoliq').AsString = 'L') then
    AFont.Color := IIF(Highlight, clBtnHighlight, clNavy);
end;

procedure TfrmManMontoMaxAprobPorUsuario.rbConLimiteClick(Sender: TObject);
begin
  Do_HabMontoMaximo;
end;

procedure TfrmManMontoMaxAprobPorUsuario.rbSinLimiteClick(Sender: TObject);
begin
  Do_HabMontoMaximo;
end;

procedure TfrmManMontoMaxAprobPorUsuario.Do_HabMontoMaximo;
begin
  if rbSinLimite.Checked then
    edMontoMaximo.Clear;
  VCLExtra.LockControls([edMontoMaximo], not rbConLimite.Checked);
end;

procedure TfrmManMontoMaxAprobPorUsuario.fpAbmBeforeShow(Sender: TObject);
begin
  VCLExtra.LockControl(fraUsuario, (ModoABM = maModificacion));
  VCLExtra.LockControl(btnAceptar, (ModoABM = maModificacion) and (not sdqConsulta.FieldByName('MU_FECHABAJA').IsNull));
end;

end.
