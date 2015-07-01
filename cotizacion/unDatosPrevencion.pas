unit unDatosPrevencion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl, StdCtrls, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArtDBAwareFrame;

type
  TfrmDatosPrevencion = class(TfrmCustomPanelABM)
    tbGuardar: TToolButton;
    GroupBox1: TGroupBox;
    fraCP_ESTADO: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    edCP_INFORME: TMemo;
    procedure tbGuardarClick(Sender: TObject);
    procedure FSFormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIdCotizacion: Integer;
    FIdPrevencion: Integer;

    procedure CambiaEstado(Sender: TObject);
    procedure Clear;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
  public
    procedure DoCargar(aIdCotizacion: Integer);
  end;
var
  frmDatosPrevencion: TfrmDatosPrevencion;

implementation

{$R *.DFM}

uses
  unPrincipal, unDmprincipal, AnsiSql, VCLExtra, SqlFuncs, CustomDlgs;

procedure TfrmDatosPrevencion.tbGuardarClick(Sender: TObject);
begin
  if Validar then
    DoAbm;
end;

procedure TfrmDatosPrevencion.Clear;
begin
  VCLExtra.EnableControls([tbGuardar, tbLimpiar], False);
  FIdPrevencion := 0;
  fraCP_ESTADO.Clear;
  edCP_INFORME.Clear;
end;

procedure TfrmDatosPrevencion.CambiaEstado(Sender: TObject);
begin
  VCLExtra.LockControls([edCP_INFORME], fraCP_ESTADO.Value <> '04');
end;

function TfrmDatosPrevencion.DoABM: Boolean;
var
  SqlPrevencion: TSql;
begin
  Result := False;
  BeginTrans;
  SqlPrevencion := TSql.Create('acp_cotizacionprevencion');
  try
    try
      SqlPrevencion.SqlType := stUpdate;
      SqlPrevencion.PrimaryKey.Add('cp_id', 		FIdPrevencion, False);
      SqlPrevencion.Fields.Add('cp_fechamodif', SQL_ACTUALDATE, False);
      SqlPrevencion.Fields.Add('cp_usumodif', 	frmPrincipal.DBLogin.UserId);
      SqlPrevencion.Fields.Add('cp_estado', 		fraCP_ESTADO.edCodigo.Text);
      SqlPrevencion.Fields.Add('cp_informe', 		edCP_INFORME.Lines.Text);

      EjecutarSqlST(SqlPrevencion.Sql);
      CommitTrans;
      Result := True;
      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al guardar los datos.');
        RollBack;
      end;
    end;
  finally
    SqlPrevencion.Free;
  end;
end;

function TfrmDatosPrevencion.Validar: Boolean;
begin
  Verificar(fraCP_ESTADO.IsEmpty, fraCP_ESTADO.edCodigo, 'El estado es incorrecto.');
  Result := True;
end;

procedure TfrmDatosPrevencion.DoCargar(aIdCotizacion: Integer);
var
  sSql: String;
begin
  sSql :=
  	'SELECT *' +
     ' FROM acp_cotizacionprevencion' +
    ' WHERE cp_idcotizacion = ' + SqlValue(aIDCotizacion);
  sdqConsulta.SQL.Add(sSql);
  sdqConsulta.Open;

  FIdCotizacion := aIdCotizacion;
  if not sdqConsulta.Eof then
  begin
    VCLExtra.LockControls([edCP_INFORME], True);
    FIdPrevencion := sdqConsulta.FieldByName('cp_id').AsInteger;
    fraCP_ESTADO.Value := sdqConsulta.FieldByName('cp_estado').AsString;
    CambiaEstado(nil);
    edCP_INFORME.Lines.Text := sdqConsulta.FieldByName('cp_informe').AsString;
    VCLExtra.EnableControls([tbGuardar, tbLimpiar], True);
  end
  else
  begin
    Clear;
    MessageDlg('NO SE HA ENCONTRADO EL REGISTRO!', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmDatosPrevencion.FSFormCreate(Sender: TObject);
begin
  inherited;

  tbGuardar.Left := 0;
  fraCP_ESTADO.Clave := 'PREVE';
  fraCP_ESTADO.OnChange := CambiaEstado;
end;

procedure TfrmDatosPrevencion.tbLimpiarClick(Sender: TObject);
begin
  Clear;
end;

procedure TfrmDatosPrevencion.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmDatosPrevencion := nil;
end;

end.
