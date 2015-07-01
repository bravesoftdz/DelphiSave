unit unManProcesosOracle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, StdCtrls, Db, SDEngine,
  Placemnt, artSeguridad, ShortCutControl, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unCustomAccionABM,
  unFraCodigoDescripcion, mwCustomEdit, mwHighlighter, mwSqlSyn, IntEdit, unArtDBAwareFrame;

type
  TfrmManProcesosOracle = class(TfrmCustomAccionABM)
    Label2: TLabel;
    edDescripcion: TEdit;
    Label3: TLabel;
    mwSqlSyn: TmwSqlSyn;
    Panel1: TPanel;
    mwSql: TmwCustomEdit;
    ToolButton1: TToolButton;
    tbSintaxisCheck: TToolButton;
    sduConsulta: TSDUpdateSQL;
    tbSalir2: TToolButton;
    procedure FSFormCreate(Sender: TObject);
    procedure tbSintaxisCheckClick(Sender: TObject);
  private
  public
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls(ClearPK: Boolean = False); override;
    procedure LoadControls; override;
    procedure LockControls(ALocked: Boolean = True); override;
  end;

implementation

uses
  unPrincipal, CustomDlgs, unDmPrincipal, AnsiSql, SqlFuncs, unImpoExpo, General, unArt, unImpoExpoUtils;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManProcesosOracle }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProcesosOracle.ClearControls(ClearPK: Boolean);
begin
  inherited;

  if ClearPK then
    fraPrimaryKey.Clear;

  edDescripcion.Text := '';
  mwSql.Text         := ' ';
end;

(*
function TfrmManProcesosOracle.DoABM: Boolean;
begin
  with sdqConsulta do
  begin
    case ModoABM of
      maAlta:
      begin
        Insert;
        FieldByName('PS_ID').AsInteger     := IncSql('SELECT MAX(PS_ID) FROM IPS_PROCESOSERVER');
        FieldByName('PS_USUALTA').AsString := frmPrincipal.DBLogin.UserID;
      end;
      maModificacion:
      begin
      end;
      maBaja:
      begin
      end;
    end;
    {--------------------------------------------}
  end;
end;*)

function TfrmManProcesosOracle.DoABM: Boolean;
var
  Sql: TSql;
  IdProcesoServer: TTableId;
begin
  Sql := TSql.Create('IPS_PROCESOSERVER');
  try
    if ModoABM = maAlta then
      IdProcesoServer := IncSql('SELECT MAX(PS_ID) FROM IPS_PROCESOSERVER')
    else
      IdProcesoServer := fraPrimaryKey.Value;

    Sql.PrimaryKey.Add('PS_ID', IdProcesoServer);

    if ModoABM = maBaja then
    begin
      Sql.Fields.Add('PS_USUBAJA', frmPrincipal.DBLogin.UserId);
      Sql.Fields.Add('PS_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end else
    begin
      Sql.Fields.Add('PS_DESCRIPCION', edDescripcion.Text);
      //Sql.Fields.Add('PS_SQL', mwSql.Text);

      case ModoABM of
        maAlta:
        begin
          Sql.Fields.Add('PS_USUALTA',   frmPrincipal.DBLogin.UserId);
          Sql.Fields.Add('PS_FECHAALTA', exDateTime);
          Sql.SqlType := stInsert;
        end;
        maModificacion:
        begin
          Sql.Fields.Add('PS_USUMODIF',   frmPrincipal.DBLogin.UserId);
          Sql.Fields.Add('PS_FECHAMODIF', exDateTime);
          Sql.Fields.Add('PS_USUBAJA', exNull);
          Sql.Fields.Add('PS_FECHABAJA', exNull);
          Sql.SqlType := stUpdate;
        end;
      end;
    end;
    { -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- }
    try
      EjecutarSql(Sql.Sql);
      SaveBlob('SELECT PS_SQL FROM IPS_PROCESOSERVER WHERE PS_ID = ' + SqlValue(IdProcesoServer),
               'UPDATE IPS_PROCESOSERVER SET PS_SQL = :PS_SQL WHERE PS_ID = ' + SqlValue(IdProcesoServer),
               'PS_SQL', mwSql.Lines);

      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        ErrorMsg(E);
      end;
    end;
    { -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- }
    if ModoABM = maAlta then
      fraPrimaryKey.Value := IdProcesoServer
    else
      fraPrimaryKey.Reload;
    { -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- }
  finally
    Sql.Free;
  end;
end;

procedure TfrmManProcesosOracle.LoadControls;
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('pCodigo').AsInteger := fraPrimaryKey.Value;
  sdqConsulta.Open;

  inherited;

  edDescripcion.Text := sdqConsulta.FieldByName('PS_DESCRIPCION').AsString;
  mwSql.Text         := sdqConsulta.FieldByName('PS_SQL').AsString;
end;

procedure TfrmManProcesosOracle.LockControls(ALocked: Boolean);
var
  i: Integer;
begin
  inherited;

  if ALocked then
    mwSql.Color := clBtnFace
  else
    mwSql.Color := clWindow;

  for i := 0 to mwSqlSyn.AttrCount - 1 do
    mwSqlSyn.Attribute[i].Background := mwSql.Color;

  mwSql.Repaint;
end;

function TfrmManProcesosOracle.Validar: Boolean;
begin
  Result := False;

  if edDescripcion.Text = '' then
    InvalidMsg( edDescripcion, 'Debe cargar la descripción del proceso.')
  else if Trim(mwSql.Text) = '' then
    InvalidMsg( mwSql, 'Debe ingresar la instrucción Sql.')
  else
    Result := True;
end;

procedure TfrmManProcesosOracle.FSFormCreate(Sender: TObject);
begin
  UnTouch := TList.Create;

  inherited;

  with fraPrimaryKey do
  begin
    FieldID       := 'PS_ID';
    FieldCodigo   := 'PS_ID';
    FieldDesc     := 'PS_DESCRIPCION';
    FieldBaja     := 'PS_FECHABAJA';
    TableName     := 'IPS_PROCESOSERVER';
//    CaseSensitive :=
  end;
  ClearControls;
end;

procedure TfrmManProcesosOracle.tbSintaxisCheckClick(Sender: TObject);
var
  sdqSintaxis: TSDQuery;
  AParams: TParams;
  AParam: TParam;
  sSql: String;
  i, nIdProceso: Integer;
begin
  sSql :=
    'SELECT pa_idproceso' +
     ' FROM ips_procesoserver JOIN ipa_procesoaccion ON(    ps_id = pa_relacion' +
                                                      ' AND pa_tipoaccion = ''P'')' +
                                                 ' AND ps_id = ' + SqlValue(fraPrimaryKey.Value);

  nIdProceso := ValorSqlInteger(sSql);

  try
    AParams := TParams.Create(Self);
    try
      { Agrega los Parámetros del Sistema }
      for i := Low(PARAMETROS_ALL) to High(PARAMETROS_ALL) do
      begin
        AParam := TParam.Create(AParams);
        AParam.Name := PARAMETROS_ALL[i];
        AParam.DataType := PARAMETROS_ALL_TIPO[i];
      end;

      { Agrega los Parámetros de los procesos }
      with GetQueryEx('SELECT DISTINCT PP_CODIGO, PP_TIPO ' +
                        'FROM IPA_PROCESOACCION, IPP_PROCESOPARAMETRO ' +
                       'WHERE PA_TIPOACCION = ''' + TA_PROCESS + ''' ' +
                         'AND PA_IDPROCESO = PP_IDPROCESO ' +
                         'AND PA_RELACION = :Relacion ',
                      [fraPrimaryKey.Value]) do
      try
        First;
        while not EOF do
        begin
          AParam := TParam.Create(AParams);
          AParam.Name := FieldByName('PP_CODIGO').AsString;
          AParam.DataType := TipoDatoToFieldType(FieldByName('PP_TIPO').AsString);

          Next;
        end;
      finally
        Free;
      end;

      sdqSintaxis := TSDQuery.Create(Self);
      try
        SetDatabaseToQuery(sdqSintaxis);
        CheckQuery(nIdProceso, sdqSintaxis, mwSql.Text, False, AParams);
      finally
        sdqSintaxis.Free;
      end;
    finally
      AParams.Free;
    end;

    MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
  except
    on E: Exception do
      ErrorMsg(E, 'Error de Sintaxis');
  end;
end;

end.
