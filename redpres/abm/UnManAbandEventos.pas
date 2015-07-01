unit UnManAbandEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, undmprincipal, unsesion, sqlfuncs,
  customdlgs, ansisql;

type
  TfrmManAbandEventos = class(TfrmCustomGridABM)
    lblCodigo: TLabel;
    ieCodigo: TIntEdit;
    lblDescripcion: TLabel;
    edDescripcion: TEdit;
    fraCartaDoc: TfraCodigoDescripcion;
    lblCartaDoc: TLabel;
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public

    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    { Public declarations }
  end;

var
  frmManAbandEventos: TfrmManAbandEventos;

implementation

uses unCustomConsulta;

{$R *.dfm}

procedure TfrmManAbandEventos.FormCreate(Sender: TObject);
begin
  inherited;

  with fraCartaDoc do
  begin
    TableName := 'ctc_textocarta';
    FieldID := 'TC_ID';
    FieldCodigo := 'TC_CODIGO';
    FieldDesc := 'TC_NOMBRE';
    FieldBaja := 'TC_FECHABAJA';
    ShowBajas := false;
    Sql := 'SELECT tc_codigo codigo, tc_nombre descripcion, tc_id id, tc_fechabaja baja ' +
           'FROM ctc_textocarta, cta_textoarea, cat_areatexto ' +
           'WHERE tc_id = ta_idtextocarta ' +
           'AND ta_idareatexto = at_id ' +
           'AND at_area = ''30'' ' +
           'AND at_modulo = ''16'' ' +
           'AND tc_destinatario = ''1'' ' +
           'AND tc_fechabaja IS NULL ' +
           'AND ta_fechabaja IS NULL ' +
           'AND at_fechabaja IS NULL';

  end;
end;


procedure TfrmManAbandEventos.ClearControls;
begin
  ieCodigo.Clear;
  edDescripcion.Text := '';
  fraCartaDoc.Clear;
end;

procedure TfrmManAbandEventos.LoadControls;
begin
  ieCodigo.Value := sdqConsulta.FieldValues['ae_codigo'];
  edDescripcion.Text := sdqConsulta.FieldValues['ae_descripcion'];
  fraCartaDoc.Codigo := sdqConsulta.Fieldbyname('tc_codigo').AsString;
end;

function TfrmManAbandEventos.Validar;
begin
  verificar(ieCodigo.IsEmpty, ieCodigo, 'Debe seleccionar un código');
  verificar(edDescripcion.Text = '', edDescripcion, 'Debe seleccionar una descripción');
  result := true;
end;

function TfrmManAbandEventos.DoABM: Boolean;
var valsiguiente: integer;
begin
  sql.clear;
  sql.TableName := 'art.sae_abandonoeventos';
  if ModoABM = maAlta then
  begin
    valsiguiente := valorsqlinteger('select max(ae_id) +1 from art.sae_abandonoeventos');
    sql.PrimaryKey.Add('AE_ID', valsiguiente);
    sql.Fields.Add('AE_CODIGO', sqlvalue(ieCodigo.Value));
    sql.Fields.Add('AE_DESCRIPCION', edDescripcion.Text);
    sql.Fields.Add('AE_CODCARTADOC_EMP', fraCartaDoc.Codigo);
    sql.Fields.Add('AE_USUALTA', sesion.UserID);
    sql.Fields.Add('AE_FECHAALTA', exDateTime);
  end
  else
  begin
    if ModoABM = maBaja then
    begin
      sql.PrimaryKey.Add ('AE_ID', sdqConsulta.FieldByName('AE_ID').AsInteger);
      sql.Fields.Add('AE_USUBAJA', sesion.UserID);
      sql.Fields.Add('AE_FECHABAJA', exDateTime);
      sql.SqlType := stUpdate;
    end
    else
    begin
      sql.PrimaryKey.Add ('AE_ID', sdqConsulta.FieldByName('AE_ID').AsInteger);
      sql.Fields.Add('AE_CODIGO', sqlvalue(ieCodigo.Value));
      sql.Fields.Add('AE_DESCRIPCION', edDescripcion.Text);
      sql.Fields.Add('AE_CODCARTADOC_EMP', fraCartaDoc.Codigo);
      sql.Fields.Add('AE_USUMODIF', sesion.UserID);
      sql.Fields.Add('AE_FECHAMODIF', exDateTime);
    end;
  end;
  result:= inherited DoABM;
end;



end.
