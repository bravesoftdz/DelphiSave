unit unTiposAplicacionRecursosExtraord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit;

type
  TfrmTiposAplicacionRecursosExtraord = class(TfrmCustomGridABM)
    Label1: TLabel;
    edCodigoAlta: TPatternEdit;
    Label2: TLabel;
    edDescripcionAlta: TEdit;
    rgOperacionAlta: TRadioGroup;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmTiposAplicacionRecursosExtraord: TfrmTiposAplicacionRecursosExtraord;

implementation
{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, General, CustomDlgs, Strfuncs, DbFuncs, unArt,
  unPrincipal, unSesion, SqlFuncs;

procedure TfrmTiposAplicacionRecursosExtraord.ClearControls;
begin
  edCodigoAlta.Clear;
  edDescripcionAlta.Clear;
  rgOperacionAlta.ItemIndex := -1;
end;

function TfrmTiposAplicacionRecursosExtraord.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'LTR_TIPOAPLICACIONRECEXT';

      if ModoABM = maBaja then
        begin
          PrimaryKey.Add('TR_ID',      sdqConsulta.FieldByName('TRID').AsInteger);
          Fields.Add('TR_FECHABAJA',   exDateTime);
          Fields.Add('TR_USUBAJA',     Sesion.UserId);

          SqlType := stUpdate;
        end
      else if ModoABM = maAlta then
        begin
          PrimaryKey.AddExpression('TR_ID', 'SEQ_LTR_ID.NEXTVAL');
          Fields.Add('TR_FECHAALTA',   exDateTime);
          Fields.Add('TR_USUALTA',     Sesion.UserId);

          Fields.Add('TR_CODIGO',      edCodigoAlta.Text);
          Fields.Add('TR_DESCRIPCION', edDescripcionAlta.Text);
          Fields.Add('TR_OPERACION',   Integer(Iif(rgOperacionAlta.ItemIndex = 0, 1, -1)));

          SqlType := stInsert;
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmTiposAplicacionRecursosExtraord.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived  := True;
  FieldBaja    := 'FECHABAJA';
end;

function TfrmTiposAplicacionRecursosExtraord.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(IsEmptyString(edCodigoAlta.Text), edCodigoAlta, 'El código es obligatorio.');
  Verificar(IsEmptyString(edDescripcionAlta.Text), edDescripcionAlta, 'La descripción es obligatoria.');
  Verificar(rgOperacionAlta.ItemIndex = -1, rgOperacionAlta, 'La operación es obligatoria.');

  sSql := 'SELECT 1 ' +
            'FROM LTR_TIPOAPLICACIONRECEXT ' +
           'WHERE TR_CODIGO = :Codigo';
  Verificar(ExisteSqlEx(sSql, [edCodigoAlta.Text]), edCodigoAlta, 'El código ya existe.');

  Result := True;
end;

end.
 