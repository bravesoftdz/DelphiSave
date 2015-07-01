unit unABMUsuAvisoVol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unfraUsuarios, StdCtrls, FormPanel, VCLExtra;

type
  TfrmABMUsuAvisoVol = class(TfrmCustomConsulta)
    FPAlta: TFormPanel;
    Label1: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraUsuario: TfraUsuario;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    pbEsAlta: Boolean;
    function Validar: Boolean;
  public
    { Public declarations }
  end;

var
  frmABMUsuAvisoVol: TfrmABMUsuAvisoVol;

implementation

uses unPrincipal, AnsiSql, unDmPrincipal, CustomDlgs;

{$R *.dfm}

procedure TfrmABMUsuAvisoVol.tbNuevoClick(Sender: TObject);
begin
  fraUsuario.Limpiar;
  VCLExtra.LockControl(fraUsuario, False);

  pbEsAlta := True;
  fpAlta.Caption := 'Agregar usuario';
  fpAlta.ShowModal;
end;

procedure TfrmABMUsuAvisoVol.btnAceptarClick(Sender: TObject);
var
  SQL: TSQL;
  SSQL: String;
begin
  if Validar then
  try
    SQL := TSql.Create;
    try
      SQL.TableName := 'SVR_USUARIOAVISOVOLANTE';

      SQL.Fields.Add('VR_USUARIO',  fraUsuario.edCodigo.Text);
      SQL.Fields.Add('VR_CODAVISO', sdqConsulta.ParamByName('CODAVISO').AsString);

      if pbEsAlta then
      begin
        SQL.PrimaryKey.Add('VR_ID',    'SEQ_SVR_ID.NEXTVAL', False);
        SQL.Fields.Add('VR_FECHAALTA', 'ACTUALDATE', False);
        SQL.Fields.Add('VR_USUALTA',    frmprincipal.DBLogin.UserID, True);
        SSQL := SQL.InsertSql;
      end;

      EjecutarSqlST(SSQL);
    finally
      SQL.Free;
    end;

    tbRefrescarClick(nil);
    fpAlta.close;
  except
    MsgBox('Ha ocurrido un error al grabar el usuario.');
  end;
end;

procedure TfrmABMUsuAvisoVol.tbEliminarClick(Sender: TObject);
var
  SSQL: String;
begin
  SSQL :=
    'UPDATE SVR_USUARIOAVISOVOLANTE' +
      ' SET VR_FECHABAJA = TRUNC(SYSDATE),' +
          ' VR_USUBAJA = ' + SqlValue(frmprincipal.DBLogin.UserId) +
    ' WHERE VR_ID = ' + SqlValue(sdqConsulta.FieldByName('VR_ID').AsInteger);
  try
    EjecutarSqlST(SSQL);
    tbRefrescarClick(nil);
  except
    MsgBox('Ha ocurrido un error y no se puede eliminar el registro.');
  end;
end;

procedure TfrmABMUsuAvisoVol.GridGetCellParams(Sender: TObject;Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('VR_FECHABAJA').IsNull then
    AFont.Color := clred;
end;

procedure TfrmABMUsuAvisoVol.btnCancelarClick(Sender: TObject);
begin
  fpAlta.Close;
end;

function TfrmABMUsuAvisoVol.Validar: Boolean;
var
  sSql: String;
begin
  if pbEsAlta then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM SVR_USUARIOAVISOVOLANTE' +
      ' WHERE VR_USUARIO = ' + SqlValue(fraUsuario.edCodigo.Text) +
        ' AND VR_CODAVISO = ' + SqlValue(sdqConsulta.ParamByName('CODAVISO').AsString) +
        ' AND VR_FECHABAJA IS NULL';

    if ExisteSql(sSql) then
    begin
      InvalidMsg(fraUsuario.edCodigo, 'El usuario ya existe en el aviso.');
      Result := False;
    end
    else
      Result := True;
  end
  else
    Result := True;
end;

end.
