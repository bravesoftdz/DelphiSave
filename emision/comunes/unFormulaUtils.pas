unit unFormulaUtils;

interface

uses classes, DB, SDEngine, SysUtils, Variants, Strfuncs;


type
   TFormula = Class(TObject)
   private
     FFormula : TStringList;
     FPreparedFormula : String;
     FSql : TSDQuery;
     FIsPrepared : Boolean;
     FIsVerified : Boolean;
     FIsChecked  : Boolean;
     FResult : Variant;
     FParams : TParams;
     FSource : TDataset;
     FTipoDato : string;
     FDDJJ : TSDQuery;
     FTrabajadores : TSDQuery;
    FLongitudDatoRetorno: integer;
     procedure ReemplazarParametros(ASentecia : TStrings; Fields : TFields);
     function  ReemplazarValoresParametros(const AQuery : TSdQuery; AFields : TFields): string;
     procedure SetFormula(const Value: TStringList);
     procedure SetParamsList(const Value: TParams);
     procedure SetSource(const Value: TDataSet);
     function GetEof: boolean;
     procedure SetTipoDato(const Value: string);
     function GetTipoVariableDatabase(ATipoDato: String; ALongitud : Integer): string;
     procedure SetLongitudDatoRetorno(const Value: integer);
     procedure   Prepare;
     //procedure   UnPrepare;
     procedure   VerifyFormula;
    function GetTipoVariable(ATipoDato: String): TFieldType;
   public
     constructor Create;
     destructor  Destroy; override;
     property    Formula : TStringList read FFormula write SetFormula;
     property    PreparedFormula : String read FPreparedFormula;
     property    IsPrepared : Boolean read FIsPrepared;
     property    IsVerified : Boolean read FIsVerified;
     property    IsChecked : Boolean read FIsChecked;
     property    Result : Variant read FResult;
     property    Params: TParams read FParams write SetParamsList;
     function    Execute : variant;
     property    Source : TDataSet read FSource write SetSource;
     procedure   First;
     procedure   Next;
     property    Eof : boolean read GetEof;
     procedure   CheckSintaxis;
     property    TipoDatoRetorno : string read FTipoDato write SetTipoDato;
     property    LongitudDatoRetorno : integer read FLongitudDatoRetorno write SetLongitudDatoRetorno;
   protected

   end;



implementation


uses unDmPrincipal, SqlFuncs, MaskUtils;


constructor TFormula.Create;
begin
  inherited;
  FSql := TSDQuery.Create(nil);
  FDDJJ := TSDQuery.Create(nil);
  FTrabajadores := TSDQuery.Create(nil);

  SetDatabaseToQuery(FSql);
  SetDatabaseToQuery(FDDJJ);
  SetDatabaseToQuery(FTrabajadores);
  FFormula := TStringList.Create;
  FPreparedFormula := '';
  FIsPrepared := False;
  FIsVerified := False;
  FResult := Null;
end;

destructor TFormula.Destroy;
begin
  FreeAndNil(FSql);
  FreeAndNil(FFormula);
  FreeAndNil(FDDJJ);
  FreeAndNil(FTrabajadores);  
  inherited;
end;


procedure TFormula.CheckSintaxis;
var
 buffer : string;
begin
  try
    if not FIsPrepared then Prepare;

    FSql.SQL.Text :=  FPreparedFormula;
    with FSql.ParamByName('RESULT') do
    begin
      DataType := GetTipoVariable(FTipoDato);
      Size := FLongitudDatoRetorno;
      ParamType := ptOutput;
      Value := lpad(Buffer,'0', FLongitudDatoRetorno);
    end;
    FSql.Prepare;

    FIsChecked := true;
  except
    on E : Exception do begin
      raise Exception.Create('Error de sintaxis en la fórmula. ' + #13#10 + E.Message);
      FIsChecked := true;
    end;
  end;
end;

procedure TFormula.Prepare;
var
 s : TStringList;
 i : integer;
 position : integer;
begin
  try
    if not FSource.Active then FSource.Open;
  except
    On E: Exception do
      raise exception.Create('La fuente de datos no contiene una consulta válida. Produjo el siguiente error:'
                            + #13#10
                            + #13#10 + E.Message);
  end;

  s := TStringList.Create;
  try
    s.Text := AnsiUpperCase(FFormula.Text);

    ReemplazarParametros(s, FSource.Fields);
    //Tratando de completar la formula.
    //Si no encuentro ni
    if (FindClause( s.Text, 'DECLARE' ) = -1) and
       (FindLastClause(s.Text, 'END') = -1) then
    begin
      s.Text := 'DECLARE' + #13#10 +
                'BEGIN' + #13#10 +
                s.Text + #13#10 +
                'END;';
    end;
    //Si no encuentro la palabra clave declare en toda la formula
    //lo agrego para poder agregar la variable valor.
    position := FindClause( s.Text, 'DECLARE' );
    if position < 0 then
    begin
      s.Insert(0,'DECLARE');
      position := 0;
    end;

    s.Insert(position + 1,' VALOR '  +  GetTipoVariableDatabase(TipoDatoRetorno, LongitudDatoRetorno) +  ';');

    //Busco el ultimo end para colcar el valor de retorno.
    for i := s.Count - 1 downto 0 do
     if pos('END;' , s.Strings[i] ) > 0 then
     begin
       s.Insert(i, ':RESULT ::= VALOR;');
       break;
     end;

    FIsPrepared := true;
    FPreparedFormula := s.text;



  finally
    s.Free;
  end;
end;

procedure TFormula.ReemplazarParametros(ASentecia : TStrings; Fields : TFields);
var
 i : integer;
 old, new : string;
begin
  for i := 0 to Fields.Count - 1 do
  begin
    ASentecia.Text := UpperCase(ASentecia.Text);
    old := '<' + StringReplace(UpperCase(Fields[i].DisplayName), '&', '', [rfReplaceAll]) + '>';
    new := ':p' + UpperCase(Fields[i].FieldName);
    ASentecia.Text := StringReplace(ASentecia.Text, old, new, [rfIgnoreCase,rfReplaceAll] );
  end;
  ASentecia.Text := StringReplace(ASentecia.Text,'<VALOR>', 'VALOR' , [rfIgnoreCase,rfReplaceAll] );
  ASentecia.Text := StringReplace(ASentecia.Text,':=', '::=' , [rfIgnoreCase,rfReplaceAll] );
end;

function TFormula.ReemplazarValoresParametros(const AQuery : TSdQuery; AFields : TFields): string;
var
 i : integer;
 p : TParam;
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
{-------------------------------------------------------------------------------------------------------}
procedure TFormula.VerifyFormula;
var
 i,j  : integer;
 position : integer;
 str : string;
begin
  FIsVerified := false;
  for i := 0 to FFormula.count - 1 do
  begin
    str := AnsiUpperCase(FFormula.Strings[i]);
    position := pos('VALOR', str);
    if position > 0 then
    begin
      for j := position to length(str) - 3  do
      begin
        if (str[j] = ':') and (str[j + 1] = '=') then
        begin
          FIsVerified := true;
          break;
        end;
      end;
    end;
  end;

  Assert(FIsVerified, 'La fórmula no es válida. Debe contener el parámetro valor como término.');
end;

procedure TFormula.SetFormula(const Value: TStringList);
begin
  FIsChecked := false;
  FIsVerified := false;
  FIsPrepared := false;
  FFormula.Text := Value.Text;
end;

procedure TFormula.SetParamsList(const Value: TParams);
begin
  FParams.AssignValues(Value);
end;

procedure TFormula.SetSource(const Value: TDataset);
begin
  FSource := Value;
end;

function TFormula.Execute : variant;
begin
  FResult := Null;

  if not FIsPrepared then Prepare;
  if not FIsVerified then VerifyFormula;
  if not FIsChecked  then CheckSintaxis;

  try
    ReemplazarValoresParametros(FSql, FSource.Fields);
    FSql.ExecSQL;
    FResult := FSql.ParamByName('result').Value;

  finally
    FSql.Close;
    result := FResult;
  end;
end;


procedure TFormula.First;
begin
  if FSource.Active then FSource.First;
end;

procedure TFormula.Next;
begin
  if FSource.Active and not FSource.Eof then FSource.Next;
end;

function TFormula.GetEof: boolean;
begin
  result := FSource.Eof;
end;

procedure TFormula.SetTipoDato(const Value: string);
begin
  FTipoDato := Value;
end;

function TFormula.GetTipoVariable(ATipoDato : String) : TFieldType;
begin
       if ATipoDato = 'B' then  Result := ftSmallint
  else if ATipoDato = 'I' then  Result := ftInteger
  else if ATipoDato = 'D' then  Result := ftDate
  else if ATipoDato = 'DT' then Result := ftDateTime
  else if ATipoDato = 'T' then  Result := ftTimeStamp
  else if ATipoDato = 'L' then  Result := ftString
  else if ATipoDato = 'N' then  Result := ftFloat
  else if ATipoDato = 'P' then  Result := ftString
  else if ATipoDato = 'C' then  Result := ftString
  else if ATipoDato = 'V' then  Result := ftString
  else Result := ftUnknown;
end;


function TFormula.GetTipoVariableDatabase(ATipoDato : String; ALongitud : Integer) : string;
begin
  if ATipoDato = 'B' then
    Result := 'NUMBER(1)'
  else
  if ATipoDato = 'I' then
    Result := 'NUMBER(' + IntToStr(ALongitud)  + ')'
  else
  if ATipoDato = 'D' then
    Result := 'DATE'
  else
  if ATipoDato = 'DT' then
    Result := 'DATE'
  else
  if ATipoDato = 'T' then
    Result := 'DATE'
  else
  if ATipoDato = 'L' then
    Result := 'NUMBER(' + IntToStr(ALongitud)  + ',2)'
  else
  if ATipoDato = 'N' then
    Result := 'NUMBER(' + IntToStr(ALongitud)  + ')'
  else
  if ATipoDato = 'P' then
    Result := 'VARCHAR2(' + IntToStr(ALongitud)  + ')'
  else
  if ATipoDato = 'C' then
    Result := 'VARCHAR(' + IntToStr(ALongitud)  +  ')'
  else
  if ATipoDato = 'V' then
    Result := 'VARCHAR(' + IntToStr(ALongitud)  +  ')';


end;

procedure TFormula.SetLongitudDatoRetorno(const Value: integer);
begin
  FLongitudDatoRetorno := Value;
end;

(*procedure TFormula.UnPrepare;
begin
  if Assigned(FSql) and (FSql.Prepared) then
   FSql.UnPrepare;
end;*)

end.
