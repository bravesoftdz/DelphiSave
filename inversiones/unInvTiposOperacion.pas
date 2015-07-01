unit unInvTiposOperacion;

interface

uses
  {$IFDEF VER150} Placemnt, {$ELSE} rxPlacemnt, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmInvTiposOperacion = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edDescripcionAltaModif: TEdit;
    rgSignoAltaModif: TRadioGroup;
    chkGeneraResultAltaModif: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvTiposOperacion: TfrmInvTiposOperacion;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmInvTiposOperacion.ClearControls;
begin
  edDescripcionAltaModif.Clear;
  rgSignoAltaModif.ItemIndex       := -1;
  chkGeneraResultAltaModif.Checked := False;
end;

function TfrmInvTiposOperacion.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('TO_ID',          GetSecNextVal('INV.SEQ_NTO_ID'));
          Fields.Add('TO_FECHAALTA',       exDateTime);
          Fields.Add('TO_USUALTA',         Sesion.UserID );
          Fields.Add('TO_DESCRIPCION',     Trim(edDescripcionAltaModif.Text));
          Fields.Add('TO_SIGNO',           String(Decode(IntToStr(rgSignoAltaModif.ItemIndex), ['0', '1', '2'], ['1', '-1', '0'])));
          Fields.Add('TO_GENERARESULTADO', chkGeneraResultAltaModif.Checked);

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('TO_ID',          sdqConsulta.FieldByName('CODIGO').AsInteger);
          Fields.Add('TO_FECHABAJA',       exDateTime);
          Fields.Add('TO_USUBAJA',         Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

procedure TfrmInvTiposOperacion.LoadControls;
begin
  with sdqConsulta do
    begin
      edDescripcionAltaModif.Text      := FieldByName('TIPO_OPERACION').AsString;
      rgSignoAltaModif.ItemIndex       := StrToInt(Decode(sdqConsulta.FieldByName('SIGNO').AsString, ['1', '-1', '0'], ['0', '1', '2']));
      chkGeneraResultAltaModif.Checked := (FieldByName('GENERA_RESULTADO').AsString = 'S');
    end;
end;

function TfrmInvTiposOperacion.Validar: Boolean;
begin
  Verificar(IsEmptyString(edDescripcionAltaModif.Text), edDescripcionAltaModif, 'El nombre es obligatorio.');
  Verificar(rgSignoAltaModif.ItemIndex = -1, rgSignoAltaModif, 'El signo es obligatorio.');

  Result := True;
end;

procedure TfrmInvTiposOperacion.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT TO_ID CODIGO, TO_DESCRIPCION TIPO_OPERACION, ' +
                 'DECODE(TO_SIGNO, -1, ''(-)'', 0, ''(=)'', ''(+)'') SIGNO, ' +
                 'TO_FECHABAJA FECHA_BAJA, TO_GENERARESULTADO GENERA_RESULTADO ' +
            'FROM NTO_TIPOOPERACION ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND TO_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmInvTiposOperacion.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NTO_TIPOOPERACION';
end;

procedure TfrmInvTiposOperacion.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El tipo de operación ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmInvTiposOperacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

end.

