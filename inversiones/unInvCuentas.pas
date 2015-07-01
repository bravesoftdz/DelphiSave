unit unInvCuentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, Mask, PatternEdit;

type
  TfrmInvCuentas = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    edCuentaAltaModif: TPatternEdit;
    Label1: TLabel;
    rgTipoAltaModif: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FIdInstitucion: TTableId;
    procedure SetIdInstitucion(const Value: TTableId);
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
    property IdInstitucion: TTableId     read FIdInstitucion    write SetIdInstitucion;
  end;

var
  frmInvCuentas: TfrmInvCuentas;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs,
  VCLExtra, CustomDlgs;

procedure TfrmInvCuentas.ClearControls;
begin
  edCuentaAltaModif.Clear;
  rgTipoAltaModif.ItemIndex := -1;
end;

function TfrmInvCuentas.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('IC_ID',          GetSecNextVal('INV.SEQ_NIC_ID'));
          Fields.Add('IC_FECHAALTA',       exDateTime);
          Fields.Add('IC_USUALTA',         Sesion.UserID);

          Fields.Add('IC_IDINSTITUCION',   IdInstitucion);
          Fields.Add('IC_NUMERO',          Trim(edCuentaAltaModif.Text));
          Fields.Add('IC_TIPO',            String(Iif(rgTipoAltaModif.ItemIndex = 0, 'C', 'D')));

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('IC_ID',          sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('IC_FECHABAJA',       exDateTime);
          Fields.Add('IC_USUBAJA',         Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvCuentas.Validar: Boolean;
begin
  Verificar(IsEmptyString(edCuentaAltaModif.Text), edCuentaAltaModif, 'Debe indicar la cuenta.');
  Verificar(rgTipoAltaModif.ItemIndex = -1, rgTipoAltaModif, 'Debe indicar el tipo.');

  Result := True;
end;

procedure TfrmInvCuentas.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NIC_INSTITUCIONCUENTA';
end;

procedure TfrmInvCuentas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvCuentas.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'La cuenta ya ha sido dada de baja.');

  inherited;
end;

procedure TfrmInvCuentas.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT IC_NUMERO NUMERO, DECODE(IC_TIPO, ''C'', ''Comitente'', ''D'', ''Depositante'') TIPO, TRUNC(IC_FECHABAJA) FECHA_BAJA, ' +
                 'IC_ID ID ' +
            'FROM NIC_INSTITUCIONCUENTA ' +
           'WHERE IC_IDINSTITUCION = :Institucion';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IC_FECHABAJA IS NULL';

  sdqConsulta.ParamByName('Institucion').AsInteger := IdInstitucion;
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
end;

procedure TfrmInvCuentas.SetIdInstitucion(const Value: TTableId);
begin
  if FIdInstitucion <> Value then
    begin
      FIdInstitucion := Value;
      RefreshData();
    end;
end;

procedure TfrmInvCuentas.LoadControls;
begin
  inherited;
end;

end.

