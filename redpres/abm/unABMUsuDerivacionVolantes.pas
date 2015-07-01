unit unABMUsuDerivacionVolantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unfraUsuarios, StdCtrls, FormPanel;

type
  TfrmABMUsuDerivacionVolantes = class(TfrmCustomConsulta)
    fpAlta: TFormPanel;
    Label1: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraUsuarioDerivacion: TfraUsuario;
    chkNotificaGestor: TCheckBox;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnCancelarClick(Sender: TObject);
  private
    pbEsAlta: Boolean;

    function Validar: Boolean;
  public
  end;

implementation

uses
  unDmPrincipal, unPrincipal, VCLExtra, AnsiSql, CustomDlgs, General;

{$R *.DFM}

procedure TfrmABMUsuDerivacionVolantes.tbNuevoClick(Sender: TObject);
begin
  fraUsuarioDerivacion.Limpiar;
  VCLExtra.LockControl(fraUsuarioDerivacion, False);

  pbEsAlta := True;
  fpAlta.Caption := 'Agregar usuario a la derivación';
  fpAlta.ShowModal;
end;

procedure TfrmABMUsuDerivacionVolantes.btnAceptarClick(Sender: TObject);
var
  SQL: TSQL;
  SSQL: String;
begin
  if Validar then
  try
    SQL := TSql.Create;
    try
      SQL.TableName := 'SUD_USUARIODERIVACIONVOLANTE';

      SQL.Fields.Add('UD_USUARIO',       fraUsuarioDerivacion.edCodigo.Text);
      SQL.Fields.Add('UD_CODDERIVACION', sdqConsulta.ParamByName('CODDERIVACION').AsString);
      SQL.Fields.Add('ud_enviaralgestor', string(iif(chkNotificaGestor.Checked, 'S', 'N')));

      if pbEsAlta then
      begin
        SQL.PrimaryKey.Add('UD_ID',    'SEQ_SUD_ID.NEXTVAL', False);
        SQL.Fields.Add('UD_FECHAALTA', 'ACTUALDATE', False);
        SQL.Fields.Add('UD_USUALTA',    frmprincipal.DBLogin.UserID, True);
        SSQL := SQL.InsertSql;
      end;

      EjecutarSqlST(SSQL);
    finally
      SQL.Free;
    end;

    tbRefrescarClick(nil);
    fpAlta.close;
  except
    MsgBox('Ha ocurrido un error al grabar el usuario de la derivación.');
  end;
end;

procedure TfrmABMUsuDerivacionVolantes.tbEliminarClick(Sender: TObject);
var
  SSQL: String;
begin
  SSQL :=
    'UPDATE SUD_USUARIODERIVACIONVOLANTE' +
      ' SET UD_FECHABAJA = ACTUALDATE,' +
          ' UD_USUBAJA = ' + SqlValue(frmprincipal.DBLogin.UserId) +
    ' WHERE UD_ID = ' + SqlValue(sdqConsulta.FieldByName('UD_ID').AsInteger);
  try
    EjecutarSqlST(SSQL);
    tbRefrescarClick(nil);
  except
    MsgBox('Ha ocurrido un error y no se puede eliminar el registro.');
  end;
end;

procedure TfrmABMUsuDerivacionVolantes.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                         var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('UD_FECHABAJA').IsNull then
    AFont.Color := clred;
end;

function TfrmABMUsuDerivacionVolantes.Validar: Boolean;
var
  sSql: String;
begin
  if pbEsAlta then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM SUD_USUARIODERIVACIONVOLANTE' +
      ' WHERE UD_USUARIO = ' + SqlValue(fraUsuarioDerivacion.edCodigo.Text) +
        ' AND UD_CODDERIVACION = ' + SqlValue(sdqConsulta.ParamByName('CODDERIVACION').AsString) + 
        ' AND UD_FECHABAJA IS NULL';

    if ExisteSql(sSql) then
    begin
      InvalidMsg(fraUsuarioDerivacion.edCodigo, 'El usuario ya existe en la derivación.');
      Result := False;
    end
    else
      Result := True;
  end
  else
    Result := True;
end;

procedure TfrmABMUsuDerivacionVolantes.btnCancelarClick(Sender: TObject);
begin
  fpAlta.Close;
end;

end.
