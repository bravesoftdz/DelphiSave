unit unDmLegales;

interface

uses
  SysUtils, Classes, ImgList, Controls, DB, SDEngine, ArtDatabase;

type
  TTipoReserva = (trCapitalJuicio, trHonorariosJuicio, trCapitalSumario, trHonorariosSumario);

  TdmLegales = class(TDataModule)
    ilColor: TImageList;
    ilByN: TImageList;
    sdqCalculoReservaJuicio: TSDQuery;
    sdqCalculoReservaJuicioJT_PORCENTAJERESULTADOPROBABLE: TFloatField;
    sdqCalculoReservaJuicioJT_IMPORTERESERVAHONORARIOS: TFloatField;
    sdqCalculoReservaJuicioJT_IMPORTERESERVA: TFloatField;
    sdqCalculoReservaJuicioOD_DENTRODELREGIMEN: TStringField;
    sdqCalculoReservaJuicioOD_CUMPLENORMASHYS: TStringField;
    sdqCalculoReservaJuicioOD_PORCENTAJEINCAPACIDADCALC: TFloatField;
    sdqCalculoReservaJuicioRT_MONTODEMANDADO: TFloatField;
    sdqCalculoReservaJuicioRT_PORCENTAJEINCAPACIDAD: TFloatField;
    sdqCalculoReservaJuicioRC_RECLAMAINCAPACIDAD: TStringField;
    sdqCalculoReservaJuicioRE_TIPO: TStringField;
    sdqCalculoReservaJuicioJT_ID: TFloatField;
    sdqCalculoReservaJuicioJT_IDTIPO: TFloatField;
    sdqCalculoReservaJuicioRT_IDRECLAMO: TFloatField;
    sdqCalculoReservaJuicioRT_PORCENTAJEINCAPACIDADPERITO: TFloatField;
    sdqCalculoReservaJuicioBO_PROVINCIART: TStringField;
    dbWorkflow: TArtDatabase;
    sdqCalculoReservaSumario: TSDQuery;
    sdqCalculoReservaSumarioSU_ID: TFloatField;
    sdqCalculoReservaSumarioSU_INSTANCIAADMINISTRATIVA: TStringField;
    sdqCalculoReservaSumarioSU_IMPORTERESERVAHONORARIOS: TFloatField;
    sdqCalculoReservaSumarioSU_IMPORTERESERVA: TFloatField;
    sdqCalculoReservaSumarioRS_ID: TFloatField;
    sdqCalculoReservaSumarioRS_IDNORMA: TFloatField;
    sdqCalculoReservaSumarioRS_ARTICULO: TFloatField;
    sdqCalculoReservaSumarioRS_INCISO: TStringField;
    sdqCalculoReservaSumarioRS_APARTADO: TStringField;
    sdqCalculoReservaSumarioRS_ANEXO: TStringField;
    sdqCalculoReservaSumarioNO_NRO: TStringField;
    sdqCalculoReservaSumarioNO_IDTIPONORMA: TFloatField;
    sdqCalculoReservaSumarioBO_PROVINCIART: TStringField;
  private
  public
  end;

  TFormula = class
  private
//    FIsValid: Boolean;
    FFormula: String;
//    FPreparedFormula: String;
//    FSql: TSDQuery;
    FDataSource: TSDQuery;

    function GetIsValid: Boolean;
    function GetPreparedFormula: String;

    procedure SetDataSource(const Value: TSDQuery);
    procedure SetFormula(const Value: String);
  public
    procedure Execute;

    property DataSource: TSDQuery read FDataSource write SetDataSource;
    property Formula: String read FFormula write SetFormula;
    property IsValid: Boolean read GetIsValid;
    property PreparedFormula: String read GetPreparedFormula;
  end;

  TModoEjecucion = (meAlta, meModificacion, meBaja, meConsulta);

var
  dmLegales: TdmLegales;

function CheckSintaxis(AQuery: TSDQuery; ASql: String): Boolean;
function GetNivelAccesoUsuarioAJuicio: Integer;
function PrepararSentencia(ATipoReserva: TTipoReserva; ASentecia: TStrings; Fields: TFields): String;
function ReemplazarValoresParametros(const AQuery: TSdQuery; AFields: TFields): String;
function VerificarFormula(s: TStrings): Boolean;

procedure AplicarFormula(ATipoCalculoReserva: TTipoReserva; const AFormula: String; AFields: TFields);
procedure ReemplazarParametros(ASentecia: TStrings; Fields: TFields);

implementation

{$R *.dfm}

uses
	unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unPrincipal, DateUtils,
  unConstLegales, unSesion;

function CheckSintaxis(AQuery: TSDQuery; ASql: String): Boolean;
begin
  try
    CheckAndOpenQuery(AQuery, ASql, False);
    Result := True;
  except
    Result := False;
  end;
end;

function PrepararSentencia(ATipoReserva: TTipoReserva; ASentecia: TStrings; Fields: TFields): String;
var
	i: Integer;
 	position: Integer;
 	s: TStringList;
begin
  s := TStringList.Create;
  try
    s.Text := ASentecia.Text;
    ReemplazarParametros(s, Fields);

    //Tratando de completar la formula.
    //Si no encuentro ni
    if (FindClause(s.Text, 'DECLARE') = -1) and (FindLastClause(s.Text, 'END') = -1) then
    begin
    	s.Text := 'DECLARE' + #13#10 +
                'BEGIN' + #13#10 +
                s.Text + #13#10 +
                'END;';
    end;

    //Si no encuentro la palabra clave declare en toda la formula
    //lo agrego para poder agregar la variable valor.
    position := FindClause(s.Text, 'DECLARE');
    if position < 0 then
    begin
      s.Insert(0,'DECLARE');
      position := 0;
    end;

    s.Insert(position + 1,' VALOR NUMBER(11,2); ');

    for i := s.Count - 1 downto 0 do
    begin
    	if FindClause(s.Strings[i], 'END') >= 0 then
      begin
      	case ATipoReserva of
        	trCapitalJuicio: 			s.Insert(i - 1,' UPDATE LEGALES.LJT_JUICIOENTRAMITE SET JT_RESERVACAPITALCALCULADA = VALOR WHERE JT_ID = :pJT_ID;');
          trHonorariosJuicio: 	s.Insert(i - 1,' UPDATE LEGALES.LJT_JUICIOENTRAMITE SET JT_RESERVAHONORARIOCALCULADA = VALOR WHERE JT_ID = :pJT_ID;');
          trCapitalSumario: 		s.Insert(i - 1,' UPDATE LEGALES.LSU_SUMARIO SET SU_RESERVACAPITALCALCULADA = VALOR WHERE SU_ID = :pSU_ID;');
          trHonorariosSumario:	s.Insert(i - 1,' UPDATE LEGALES.LSU_SUMARIO SET SU_RESERVAHONORARIOCALCULADA = VALOR WHERE SU_ID = :pSU_ID;');
        end;
        Break;
      end;
    end;
  finally
    Result := s.text;
    s.Free;
  end;
end;

procedure AplicarFormula(ATipoCalculoReserva: TTipoReserva; const AFormula: String; AFields: TFields);
var
 	Q: TSDQuery;
	sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Text := AFormula;
    Q := TSDQuery.Create(nil);
    SetDatabaseToQuery(Q);

    //Corregir la sintaxis de la consulta completandola.
    sl.Text := PrepararSentencia(ATipoCalculoReserva, sl, AFields);
    Q.SQL.text := sl.text;

    //Asignar los valores  a los parametros que se pueden haber generado en la correccion.
    ReemplazarValoresParametros(Q, AFields);
//    Q.ParamByName('jt_id').AsInteger := FIdJuicioEnTramite;
    if Length(Q.SQL.text) > 0 then
      Q.ExecSQL;
  finally
    sl.Free;
    Q.Free;
  end;
end;

procedure ReemplazarParametros(ASentecia: TStrings; Fields: TFields);
var
	i: Integer;
	old, new: String;
begin
  for i := 0 to Fields.Count - 1 do
  begin
    old := '<"' + StringReplace(Fields[i].DisplayName, '&', '', [rfReplaceAll]) + '">';
    new := ':p' + Fields[i].FieldName;
    ASentecia.Text := StringReplace(ASentecia.Text, old, new, [rfIgnoreCase,rfReplaceAll]);
  end;

  ASentecia.Text := StringReplace(ASentecia.Text, '<"Valor">', 'Valor', [rfIgnoreCase, rfReplaceAll]);
  ASentecia.Text := StringReplace(ASentecia.Text, ':=', '::=', [rfIgnoreCase, rfReplaceAll]);
end;

function ReemplazarValoresParametros(const AQuery: TSdQuery; AFields: TFields): String;
var
	i: integer;
 	p: TParam;
begin
  for i := 0 to AFields.Count - 1 do
  begin
    p := AQuery.Params.FindParam('p' + AFields[i].FieldName);
    if Assigned(p) then
    begin
      p.DataType := AFields[i].DataType;
      p.Value := AFields[i].Value;
    end;
  end;
end;

function VerificarFormula(s: TStrings): Boolean;
var
	i,j: Integer;
	position: Integer;
 	str: String;
begin
  Result := False;
  for i := 0 to s.Count - 1 do
  begin
    str := AnsiUpperCase(s.Strings[i]);
    position := Pos('VALOR', str);
    if position > 0 then
    begin
      for j := position to Length(str) - 3 do
      begin
        if (str[j] = ':') and (str[j + 1] = '=') then
        begin
          Result := True;
          Break;
        end;
      end;
    end;
  end;
end;

function GetNivelAccesoUsuarioAJuicio: Integer;
var
	sSql: String;
begin
	sSql :=
		'SELECT nu_idnivelseguridad' +
     ' FROM legales.lnu_nivelusuario ' +
    ' WHERE nu_usuario = ' + SqlValue(Sesion.LoginName);
  Result := ValorSql(sSql, '0');
end;


{ TFormula }

procedure TFormula.Execute;
begin

end;

procedure TFormula.SetFormula(const Value: String);
begin
  FFormula := Value;
end;

function TFormula.GetIsValid: Boolean;
begin
  Result := False;
end;

function TFormula.GetPreparedFormula: String;
begin
//
end;

procedure TFormula.SetDataSource(const Value: TSDQuery);
begin
  FDataSource := Value;
end;

end.
