unit unMotivosBajaPrest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, sqlfuncs,
  customdlgs, undmprincipal, internet, strutils, vclextra;

type
  TfrmMotivosBajaPrest = class(TfrmCustomGridABM)
    edMotivo: TEdit;
    lblMotivo: TLabel;
    Label1: TLabel;
    edCodigo: TEdit;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMotivosBajaPrest: TfrmMotivosBajaPrest;

implementation

uses unPrincipal;

{$R *.dfm}

procedure TfrmMotivosBajaPrest.FormCreate(Sender: TObject);
begin
  inherited;
  sql.TableName := 'SIN.smp_motivobajaprestador';
  ShowActived := false;
  FieldBaja := 'MP_FECHABAJA';

end;


procedure TfrmMotivosBajaPrest.ClearControls;
begin
  inherited;
  edMotivo.Clear;
  edCodigo.Clear;

end;

procedure TfrmMotivosBajaPrest.LoadControls;
begin
  inherited;
  edMotivo.Text := sdqConsulta.fieldbyname('MP_DESCRIPCION').AsString;
  edCodigo.Text := sdqConsulta.fieldbyname('MP_CODIGO').AsString;

end;


function TfrmMotivosBajaPrest.DoABM: boolean;
var proxID: integer;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      proxID := GetSecNextVal('SIN.SEQ_SMP_PK');
      Sql.PrimaryKey.Add('MP_ID', proxID);
      Sql.Fields.Add('MP_CODIGO', edCodigo.Text);
      Sql.Fields.Add('MP_DESCRIPCION', edMotivo.Text);
      Sql.Fields.Add('MP_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('MP_FECHAALTA', exDateTime);
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('MP_ID', sdqConsulta.FieldByName('MP_ID').AsString);
      Sql.Fields.Add('MP_CODIGO', edCodigo.Text);
      Sql.Fields.Add('MP_DESCRIPCION', edMotivo.Text);
      Sql.Fields.Add('MP_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('MP_FECHAMODIF', exDateTime);
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('MP_ID', sdqConsulta.FieldByName('MP_ID').AsString);
      Sql.Fields.Add('MP_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('MP_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmMotivosBajaPrest.Validar: boolean;
var ssql: string;
begin
  verificar(edCodigo.Text = '', edCodigo, 'Debe ingresar un código para el motivo');

  if ModoABM = maAlta then
  begin
    ssql := ' select mp_id from SIN.smp_motivobajaprestador ' +
            ' where mp_codigo = :cod and mp_fechabaja is null ';

    verificar(ExisteSqlEx(ssql, [edCodigo.Text]), edCodigo, 'El código ingresado ya existe para otro motivo');
  end;

  verificar(edMotivo.Text = '', edMotivo, 'Debe ingresar una descripción para el motivo');

  result := true;
end;

procedure TfrmMotivosBajaPrest.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' SELECT mp_id, mp_codigo, mp_fechabaja, mp_descripcion ' +
            ' FROM SIN.smp_motivobajaprestador ';

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;
  
end;

procedure TfrmMotivosBajaPrest.fpAbmShow(Sender: TObject);
begin
  inherited;
  if ModoABM = maModificacion then
    vclextra.LockControls([edMotivo, edCodigo])
  else
    vclextra.LockControls([edMotivo, edCodigo], false);
end;

end.
