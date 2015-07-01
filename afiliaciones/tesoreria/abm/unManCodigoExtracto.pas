unit unManCodigoExtracto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion;

type
  TfrmManCodigoExtracto = class(TfrmCustomGridABM)
    Label2: TLabel;
    edCE_CODIGO: TPatternEdit;
    Label3: TLabel;
    edCE_DESCRIPCION: TEdit;
    fraCE_IDCODIGOCONC: TfraStaticCodigoDescripcion;
    Label8: TLabel;
    chkSinGrupo: TCheckBox;
    ToolButton1: TToolButton;
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkSinGrupoClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManCodigoExtracto: TfrmManCodigoExtracto;

implementation

uses
  unPrincipal, SQLFuncs, StrFuncs, CustomDlgs, unFraCodigoDescripcion, General, VCLExtra,
  unSesion;

{$R *.DFM}

{ TfrmManCodigoExtracto }

procedure TfrmManCodigoExtracto.ClearControls;
begin
  edCE_CODIGO.Clear;
  edCE_DESCRIPCION.Clear;
  fraCE_IDCODIGOCONC.Clear;
end;

function TfrmManCodigoExtracto.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'OCE_CODIGOEXTRACTO';

  if ModoABM = maAlta then
  begin
    Sql.SqlType := stInsert;
    Sql.PrimaryKey.Add('CE_ID', 'SEQ_OCE_ID.NEXTVAL', False);
    Sql.Fields.Add('CE_CODIGO', edCE_CODIGO.Text);
    Sql.Fields.Add('CE_USUALTA', Sesion.UserId);
    Sql.Fields.Add('CE_FECHAALTA', exDateTime);
  end
  else if ModoABM = maModificacion then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('CE_ID', sdqConsulta.FieldByName('CE_ID').AsInteger);
    Sql.Fields.Add('CE_USUMODIF', Sesion.UserId);
    Sql.Fields.Add('CE_FECHAMODIF', exDateTime);
  end;

  Sql.Fields.Add('CE_DESCRIPCION', edCE_DESCRIPCION.Text);
  Sql.Fields.Add('CE_IDCODIGOCONC', fraCE_IDCODIGOCONC.Value, True);

  Result := inherited DoABM;
end;

procedure TfrmManCodigoExtracto.LoadControls;
begin
  edCE_CODIGO.Text         := sdqConsulta.FieldByName('CODIGO').AsString;
  edCE_DESCRIPCION.Text    := sdqConsulta.FieldByName('DESCRIPCION').AsString;
  fraCE_IDCODIGOCONC.Value := sdqConsulta.FieldByName('CE_IDCODIGOCONC').AsInteger;
end;

function TfrmManCodigoExtracto.Validar: Boolean;
begin
  if IsEmptyString(edCE_CODIGO.Text) then
  begin
    InvalidMsg(edCE_CODIGO, 'El código es obligatorio.');
    Abort;
  end;

  Result := True;
end;

procedure TfrmManCodigoExtracto.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControl(edCE_CODIGO, (ModoABM = maModificacion));
end;

procedure TfrmManCodigoExtracto.FormCreate(Sender: TObject);
begin
  inherited;
  
  with fraCE_IDCODIGOCONC do
  begin
    TableName   := 'OCO_CODIGOCONCILIACION';
    FieldId     := 'CO_ID';
    FieldCodigo := 'CO_CODIGO';
    FieldDesc   := 'CO_DESCRIPCION';
    FieldBaja   := 'CO_USUBAJA';
    ShowBajas   := False;
  end;
end;

procedure TfrmManCodigoExtracto.RefreshData;
var
  sSQL: String;
begin
  sSQL := 'SELECT CE_ID, CE_CODIGO CODIGO, CE_DESCRIPCION DESCRIPCION, ' +
                 'CO_DESCRIPCION GRUPO, CE_IDCODIGOCONC ' +
            'FROM OCE_CODIGOEXTRACTO, OCO_CODIGOCONCILIACION ' +
           'WHERE CO_ID (+) = CE_IDCODIGOCONC ';

  if chkSinGrupo.Checked then
    sSQL := sSQL + ' AND CE_IDCODIGOCONC IS NULL';

  sdqConsulta.SQL.Text := sSQL;

  inherited;
end;

procedure TfrmManCodigoExtracto.chkSinGrupoClick(Sender: TObject);
begin
  tbRefrescar.Click;
  if Grid.CanFocus then
    Grid.SetFocus
end;

end.
