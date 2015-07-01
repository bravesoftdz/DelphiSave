unit unManMotivosBajaSeguimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit, ansiSQL, sqlfuncs, customdlgs, undmprincipal;

type
  TfrmMotivosBajaSeguimientos = class(TfrmCustomGridABM)
    ieCodigo: TIntEdit;
    mDescripcion: TMemo;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmMotivosBajaSeguimientos: TfrmMotivosBajaSeguimientos;

implementation

uses unPrincipal, unCustomConsulta;

{$R *.dfm}

procedure TfrmMotivosBajaSeguimientos.ClearControls;
begin
  ieCodigo.Clear;
  mDescripcion.Clear;

end;

procedure TfrmMotivosBajaSeguimientos.LoadControls;
begin
  ieCodigo.Text := sdqConsulta.fieldbyname('MS_CODIGO').AsString;
  mDescripcion.Lines.Text := sdqConsulta.fieldbyname('MS_DESCRIPCION').AsString;
end;

function TfrmMotivosBajaSeguimientos.DoABM: Boolean;
var proxID: integer;
begin
  sql.Clear;
  if ModoABM = maAlta Then
  begin
    proxID := GetSecNextVal('SIN.SEQ_SMS_ID');
    Sql.PrimaryKey.Add('MS_ID', proxID);
    Sql.Fields.Add('MS_CODIGO', ieCodigo.Value);
    Sql.Fields.Add('MS_DESCRIPCION', mDescripcion.Lines.Text);
    Sql.Fields.Add('MS_USUALTA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('MS_FECHAALTA', exDateTime);
  end
  else
  begin
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('MS_ID', sdqConsulta.FieldByName('MS_ID').AsString);
      Sql.Fields.Add('MS_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('MS_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.PrimaryKey.Add('MS_ID', sdqConsulta.FieldByName('MS_ID').AsString);
      Sql.Fields.Add('MS_CODIGO', ieCodigo.Text);
      Sql.Fields.Add('MS_DESCRIPCION', mDescripcion.Lines.Text);
      Sql.Fields.Add('MS_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('MS_FECHAMODIF', exDateTime);
    end;
  end;
  result := inherited DoABM;
 //
end;

function TfrmMotivosBajaSeguimientos.Validar : Boolean;
begin
  Verificar(ieCodigo.Text='', ieCodigo, 'El campo código no puede estar vacío');
  verificar(mDescripcion.Lines.Text = '', mDescripcion, 'La descripción no puede estar vacía');
  if ModoABM = maAlta then
    verificar(ExisteSqlEx('select MS_CODIGO from sin.sms_motivosbajaseguimiento where MS_CODIGO = :cod',[ieCodigo.value]), ieCodigo, 'El código ya existe');
  if ModoABM = maModificacion then
    verificar((ExisteSqlEx('select MS_CODIGO from sin.sms_motivosbajaseguimiento where MS_CODIGO = :cod',[ieCodigo.value])) and (ieCodigo.Value <> sdqConsulta.FieldByName('MS_CODIGO').AsInteger), ieCodigo, 'El código ya existe');
  result := true;
end;

procedure TfrmMotivosBajaSeguimientos.FormCreate(Sender: TObject);
begin
  inherited;
  sql.TableName := 'sin.sms_motivosbajaseguimiento';
  FieldBaja := 'MS_FECHABAJA';

end;

procedure TfrmMotivosBajaSeguimientos.fpAbmShow(Sender: TObject);
begin
  ieCodigo.SetFocus;
end;

procedure TfrmMotivosBajaSeguimientos.tbModificarClick(Sender: TObject);
begin
  if not isbaja then
    inherited
  else
    messagedlg('El registro está dado de baja', mtInformation, [mbOk],0);
end;

end.
