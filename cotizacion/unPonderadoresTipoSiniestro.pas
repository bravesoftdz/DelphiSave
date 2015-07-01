unit unPonderadoresTipoSiniestro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit,
  CurrEdit, RxToolEdit, RxCurrEdit, RxPlacemnt, PatternEdit, IntEdit;

type
  TfrmPonderadoresTipoSiniestro = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edIlt: TEdit;
    edIncap050: TEdit;
    edIncap5066: TEdit;
    edIncap66100: TEdit;
    edMuerte: TEdit;
    edPT_ILTREFCARTERA: TCurrencyEdit;
    edPT_INCAP050REFCARTERA: TCurrencyEdit;
    edPT_INCAP5066REFCARTERA: TCurrencyEdit;
    edPT_INCAP66100REFCARTERA: TCurrencyEdit;
    edPT_MUERTEREFCARTERA: TCurrencyEdit;
    edPT_ILTREFCUIT: TCurrencyEdit;
    edPT_INCAP050REFCUIT: TCurrencyEdit;
    edPT_INCAP5066REFCUIT: TCurrencyEdit;
    edPT_INCAP66100REFCUIT: TCurrencyEdit;
    edPT_MUERTEREFCUIT: TCurrencyEdit;
    edPT_ILTMINIMOFREC: TCurrencyEdit;
    edPT_INCAP050MINIMOFREC: TCurrencyEdit;
    edPT_ILTMAXIMOFREC: TCurrencyEdit;
    edPT_INCAP050MAXIMOFREC: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    edPT_INCAP050MINIMOINCAP: TCurrencyEdit;
    edPT_INCAP5066MINIMOINCAP: TCurrencyEdit;
    edPT_INCAP66100MINIMOINCAP: TCurrencyEdit;
    edPT_INCAP050MAXIMOINCAP: TCurrencyEdit;
    edPT_INCAP5066MAXIMOINCAP: TCurrencyEdit;
    edPT_INCAP66100MAXIMOINCAP: TCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edDesde: TIntEdit;
    edHasta: TIntEdit;
    Label19: TLabel;
    Label20: TLabel;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmPonderadoresTipoSiniestro: TfrmPonderadoresTipoSiniestro;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra;

{$R *.dfm}

function TfrmPonderadoresTipoSiniestro.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'comunes.cpt_ponderadorestiposiniestro';

  // Va a ser siempre modificación..
  ModoABM := maModificacion;
  Sql.Fields.Add('pt_usumodif',   Sesion.UserId);
  Sql.Fields.Add('pt_fechamodif', SQL_ACTUALDATE, False);
  Sql.PrimaryKey.Add('pt_id',     sdqConsulta.FieldByName('pt_id').AsInteger, False);
  Sql.SqlType := stUpdate;

  Sql.Fields.Add('pt_iltrefcartera',         edPT_ILTREFCARTERA.Value);
  Sql.Fields.Add('pt_iltrefcuit',            edPT_ILTREFCUIT.Value);
  Sql.Fields.Add('pt_iltminimofrec',         edPT_ILTMINIMOFREC.Value);
  Sql.Fields.Add('pt_iltmaximofrec',         edPT_ILTMAXIMOFREC.Value);
  Sql.Fields.Add('pt_incap050refcartera',    edPT_INCAP050REFCARTERA.Value);
  Sql.Fields.Add('pt_incap050refcuit',       edPT_INCAP050REFCUIT.Value);
  Sql.Fields.Add('pt_incap050minimofrec',    edPT_INCAP050MINIMOFREC.Value);
  Sql.Fields.Add('pt_incap050maximofrec',    edPT_INCAP050MAXIMOFREC.Value);
  Sql.Fields.Add('pt_incap050minimoincap',   edPT_INCAP050MINIMOINCAP.Value);
  Sql.Fields.Add('pt_incap050maximoincap',   edPT_INCAP050MAXIMOINCAP.Value);
  Sql.Fields.Add('pt_incap5066refcartera',   edPT_INCAP5066REFCARTERA.Value);
  Sql.Fields.Add('pt_incap5066refcuit',      edPT_INCAP5066REFCUIT.Value);
  Sql.Fields.Add('pt_incap5066minimoincap',  edPT_INCAP5066MINIMOINCAP.Value);
  Sql.Fields.Add('pt_incap5066maximoincap',  edPT_INCAP5066MAXIMOINCAP.Value);
  Sql.Fields.Add('pt_incap66100refcartera',  edPT_INCAP66100REFCARTERA.Value);
  Sql.Fields.Add('pt_incap66100refcuit',     edPT_INCAP66100REFCUIT.Value);
  Sql.Fields.Add('pt_incap66100minimoincap', edPT_INCAP66100MINIMOINCAP.Value);
  Sql.Fields.Add('pt_incap66100maximoincap', edPT_INCAP66100MAXIMOINCAP.Value);
  Sql.Fields.Add('pt_muerterefcartera',      edPT_MUERTEREFCARTERA.Value);
  Sql.Fields.Add('pt_muerterefcuit',         edPT_MUERTEREFCUIT.Value);

  Result := inherited DoABM;
end;

function TfrmPonderadoresTipoSiniestro.Validar: Boolean;
begin
  Result := True;
end;


procedure TfrmPonderadoresTipoSiniestro.ClearControls;
begin
  edPT_ILTREFCARTERA.Clear;
  edPT_ILTREFCUIT.Clear;
  edPT_ILTMINIMOFREC.Clear;
  edPT_ILTMAXIMOFREC.Clear;
  edPT_INCAP050REFCARTERA.Clear;
  edPT_INCAP050REFCUIT.Clear;
  edPT_INCAP050MINIMOFREC.Clear;
  edPT_INCAP050MAXIMOFREC.Clear;
  edPT_INCAP050MINIMOINCAP.Clear;
  edPT_INCAP050MAXIMOINCAP.Clear;
  edPT_INCAP5066REFCARTERA.Clear;
  edPT_INCAP5066REFCUIT.Clear;
  edPT_INCAP5066MINIMOINCAP.Clear;
  edPT_INCAP5066MAXIMOINCAP.Clear;
  edPT_INCAP66100REFCARTERA.Clear;
  edPT_INCAP66100REFCUIT.Clear;
  edPT_INCAP66100MINIMOINCAP.Clear;
  edPT_INCAP66100MAXIMOINCAP.Clear;
  edPT_MUERTEREFCARTERA.Clear;
  edPT_MUERTEREFCUIT.Clear;
end;

procedure TfrmPonderadoresTipoSiniestro.LoadControls;
begin
  with sdqConsulta do
  begin
    edDesde.Value                    := FieldByName('pt_capitasdesde').AsInteger;
    edHasta.Value                    := FieldByName('pt_capitashasta').AsInteger;
    edPT_ILTREFCARTERA.Value         := FieldByName('pt_iltrefcartera').AsFloat;
    edPT_ILTREFCUIT.Value            := FieldByName('pt_iltrefcuit').AsFloat;
    edPT_ILTMINIMOFREC.Value         := FieldByName('pt_iltminimofrec').AsFloat;
    edPT_ILTMAXIMOFREC.Value         := FieldByName('pt_iltmaximofrec').AsFloat;
    edPT_INCAP050REFCARTERA.Value    := FieldByName('pt_incap050refcartera').AsFloat;
    edPT_INCAP050REFCUIT.Value       := FieldByName('pt_incap050refcuit').AsFloat;
    edPT_INCAP050MINIMOFREC.Value    := FieldByName('pt_incap050minimofrec').AsFloat;
    edPT_INCAP050MAXIMOFREC.Value    := FieldByName('pt_incap050maximofrec').AsFloat;
    edPT_INCAP050MINIMOINCAP.Value   := FieldByName('pt_incap050minimoincap').AsFloat;
    edPT_INCAP050MAXIMOINCAP.Value   := FieldByName('pt_incap050maximoincap').AsFloat;
    edPT_INCAP5066REFCARTERA.Value   := FieldByName('pt_incap5066refcartera').AsFloat;
    edPT_INCAP5066REFCUIT.Value      := FieldByName('pt_incap5066refcuit').AsFloat;
    edPT_INCAP5066MINIMOINCAP.Value  := FieldByName('pt_incap5066minimoincap').AsFloat;
    edPT_INCAP5066MAXIMOINCAP.Value  := FieldByName('pt_incap5066maximoincap').AsFloat;
    edPT_INCAP66100REFCARTERA.Value  := FieldByName('pt_incap66100refcartera').AsFloat;
    edPT_INCAP66100REFCUIT.Value     := FieldByName('pt_incap66100refcuit').AsFloat;
    edPT_INCAP66100MINIMOINCAP.Value := FieldByName('pt_incap66100minimoincap').AsFloat;
    edPT_INCAP66100MAXIMOINCAP.Value := FieldByName('pt_incap66100maximoincap').AsFloat;
    edPT_MUERTEREFCARTERA.Value      := FieldByName('pt_muerterefcartera').AsFloat;
    edPT_MUERTEREFCUIT.Value         := FieldByName('pt_muerterefcuit').AsFloat;
  end;
end;

procedure TfrmPonderadoresTipoSiniestro.RefreshData;
begin
  sdqConsulta.Sql.Text :=
    'SELECT *' +
     ' FROM comunes.cpt_ponderadorestiposiniestro' +
    ' WHERE 1 = 1';

  inherited;
end;

procedure TfrmPonderadoresTipoSiniestro.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(DataSet.FieldByName('pt_iltrefcartera')).DisplayFormat         := ',0.00';
  TFloatField(DataSet.FieldByName('pt_iltrefcuit')).DisplayFormat            := ',0.00';
  TFloatField(DataSet.FieldByName('pt_iltminimofrec')).DisplayFormat         := ',0.00';
  TFloatField(DataSet.FieldByName('pt_iltmaximofrec')).DisplayFormat         := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap050refcartera')).DisplayFormat    := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap050refcuit')).DisplayFormat       := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap050minimofrec')).DisplayFormat    := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap050maximofrec')).DisplayFormat    := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap050minimoincap')).DisplayFormat   := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap050maximoincap')).DisplayFormat   := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap5066refcartera')).DisplayFormat   := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap5066refcuit')).DisplayFormat      := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap5066minimofrec')).DisplayFormat   := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap5066maximofrec')).DisplayFormat   := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap5066minimoincap')).DisplayFormat  := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap5066maximoincap')).DisplayFormat  := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap66100refcartera')).DisplayFormat  := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap66100refcuit')).DisplayFormat     := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap66100minimofrec')).DisplayFormat  := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap66100maximofrec')).DisplayFormat  := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap66100minimoincap')).DisplayFormat := ',0.00';
  TFloatField(DataSet.FieldByName('pt_incap66100maximoincap')).DisplayFormat := ',0.00';
  TFloatField(DataSet.FieldByName('pt_muerterefcartera')).DisplayFormat      := ',0.00';
  TFloatField(DataSet.FieldByName('pt_muerterefcuit')).DisplayFormat         := ',0.00';
  TFloatField(DataSet.FieldByName('pt_muerteminimofrec')).DisplayFormat      := ',0.00';
  TFloatField(DataSet.FieldByName('pt_muertemaximofrec')).DisplayFormat      := ',0.00';
end;

procedure TfrmPonderadoresTipoSiniestro.FormCreate(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControls([edIlt, edIncap050, edIncap5066, edIncap66100, edMuerte], True);
end;

end.
