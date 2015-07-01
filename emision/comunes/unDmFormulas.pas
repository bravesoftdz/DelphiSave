unit unDmFormulas;

interface

uses
  SysUtils, Classes, DB, SDEngine, unFormulaUtils, Variants, unUtils, unConstEmision, 
  JvComponent, JvInterpreter;

type
  TObservacion = integer;
  TObservaciones = array of TObservacion;

  //Clase base para fórmulas de emisión.
  TFormulaContainer = Class(TObject)
    FSeteo : integer;
    FDescripcion : string;
    FFormula : TFormula;
    FCodigo : string;
    FOrden  : integer;
    FTipoVariable : string;
  private
    procedure SetCodigo(const Value: string);
    procedure SetDescripcion(const Value: string);
    procedure SetFormula(const Value: Tformula);
    procedure SetOrden(const Value: integer);
    procedure SetSeteo(const Value: integer);
  public
    property Seteo : integer read FSeteo write SetSeteo;
    property Descripcion : string read FDescripcion write SetDescripcion;
    property Formula : Tformula read FFormula write SetFormula;
    property Codigo : string read FCodigo write SetCodigo;
    property Orden : integer read FOrden write SetOrden;
    constructor create;
  end;


  //Formula de Estado.,
  TFormulaEstado   = Class(TFormulaContainer)
  public
    constructor create(AId : Integer);
  end;

  //Formula de Variable.
  TFormulaVariable = Class(TFormulaContainer)
  public
    constructor create(AId : Integer);
  end;


  //Listado de Formulas de Estado de D o T
  TFormulasEstado = class
    Items : Array of TFormulaEstado;
  public
    constructor create(ASeteo : Integer; ATipo : String);
  end;

  //Lista de Formulas de Variables de D o T
  TFormulasVariable = class
    Items : Array of TFormulaVariable;
  public
    constructor create(ASeteo : Integer; ATipo : String);
  end;



  TReglaEstado = class
    FSeteoEstado : Integer; //Identificador del estado a titulo informativo.. ?¿??¿¿
    FObservacion : TObservacion; //Id de observacion a setear si se cumple la condicion establecida en relación.
    FRelacion    : Boolean; //Valor que debe cumplirse para setearse la observacion.
    FValorEstado : Boolean; //Valor actual de la variable.
  private
    function GetObservacion: TObservacion;
  public
    constructor create(AId : Integer);
    property    Observacion : TObservacion Read GetObservacion;
  end;


  TReglaVariable = class
    FSeteoVariable : integer; //Identificador del estado a titulo informativo.. ?¿??¿¿
    FObservacion   : TObservacion;
    FRelacion      : string;
    FValorUnario   : variant;
    FValorBinario  : variant;
    FValorVariable : variant;
    FInterpreter    : TJvInterpreterProgram;
  private
    function GetObservacion: TObservacion;
  public
    constructor Create(AId : Integer);
    destructor  Destroy; override;
    property    Observacion : Integer Read GetObservacion;
  end;


  TReglasEstado    = class
    FItems : Array of TReglaEstado;
  public
    constructor create(ASeteo : Integer; ATipo : String);
    procedure   GetEstados(AEstados : Integer);
    function    AplicarReglas : TObservaciones;
  end;

  TReglasVariables = class
    FItems : Array of TReglaVariable;
  public
    constructor Create(ASeteo : Integer; ATipo : String);
    procedure   GetVariables(AVariables : String);
    function    AplicarReglas : TObservaciones;
  end;

  //Todas las formulas de calculo asociados con un seteo.
  TFormulasCalculo = Class
    FIdSeteo     : Integer;

    //Formulas
    FFormulasEstadoDDJJ : TFormulasEstado;
    FFormulasVariablesDDJJ : TFormulasVariable;
    FFormulasEstadoTrabajador : TFormulasEstado;
    FFormulasVariablesTrabajador : TFormulasVariable;
    //Reglas
    FReglasEstadoDDJJ : TReglasEstado;
    FReglasVariableDDJJ : TReglasVariables;
    FReglasEstadoTrabajador : TReglasEstado;
    FReglasVariableTrabajador : TReglasVariables;
  private
  public
    property FormulasEstadoDDJJ : TFormulasEstado read FFormulasEstadoDDJJ;
    property FormulasVariablesDDJJ : TFormulasVariable read FFormulasVariablesDDJJ;
    property FormulasEstadoTrabajador : TFormulasEstado  read FFormulasEstadoTrabajador;
    property FormulasVariablesTrabajador : TFormulasVariable read FFormulasVariablesTrabajador;
    constructor Create; overload;
    constructor Create(AIdSeteo : Integer); overload;
    procedure ActualizarVariable(ATipo : string; AResultados : array of Variant; AId : Integer);
    procedure ActualizarEstado(ATipo: string; AResultados: array of Variant; AId: Integer);
    procedure ActualizarObservaciones(ATipo : string; AResultados : TObservaciones; AId : Integer);
  end;



  TdmFormula = class(TDataModule)
    sdqSeteoEstado: TSDQuery;
    sdqSeteoVariable: TSDQuery;
    sdqCamposBase: TSDQuery;
    sdqDDJJ: TSDQuery;
    sdqDDJJTrabajador: TSDQuery;
    sdqDDJJTrabajadorID: TFloatField;
    sdqDDJJTrabajadorCUIT: TStringField;
    sdqDDJJTrabajadorPERIODO: TStringField;
    sdqDDJJTrabajadorEMPLEADOS: TFloatField;
    sdqDDJJTrabajadorMASASALARIAL: TFloatField;
    sdqDDJJTrabajadorESTADO: TFloatField;
    sdqDDJJTrabajadorSUSS: TStringField;
    sdqDDJJTrabajadorCONTRATO: TFloatField;
    sdqDDJJTrabajadorFECHAPRESENTACION: TDateTimeField;
    sdqDDJJTrabajadorIMPORTESCERO: TFloatField;
    sdqDDJJTrabajadorCUIL: TStringField;
    sdqDDJJTrabajadorCODIGOSITUACION: TStringField;
    sdqDDJJTrabajadorCODIGOCONDICION: TStringField;
    sdqDDJJTrabajadorACTIVIDAD: TStringField;
    sdqDDJJTrabajadorMODOCONTRATACION: TStringField;
    sdqDDJJTrabajadorZONA: TStringField;
    sdqDDJJTrabajadorREMUNERACION: TFloatField;
    sdqDDJJTrabajadorCODIGOOBRASOCIAL: TStringField;
    sdqDDJJTrabajadorVALORESVARIABLES: TStringField;
    sdqDDJJTrabajadorVALORESESTADOS: TFloatField;
    sdqActualizaVariablesTrabajador: TSDQuery;
    sdqActualizarVariablesDeclaracion: TSDQuery;
    sdqActualizarEstadosDeclaracion: TSDQuery;
    sdqActualizaEstadosTrabajador: TSDQuery;
    sdqDDJJID: TFloatField;
    sdqDDJJCUIT: TStringField;
    sdqDDJJPERIODO: TStringField;
    sdqDDJJEMPLEADOS: TFloatField;
    sdqDDJJMASASALARIAL: TFloatField;
    sdqDDJJESTADO: TFloatField;
    sdqDDJJSUSS: TStringField;
    sdqDDJJCONTRATO: TFloatField;
    sdqDDJJFECHAPRESENTACION: TDateTimeField;
    sdqDDJJIMPORTESCERO: TFloatField;
    sdqDDJJADEUDADAS: TFloatField;
    sdqDDJJRECTIFICATIVA: TStringField;
    sdqDDJJORIGEN: TFloatField;
    sdqDDJJVALORESVARIABLES: TStringField;
    sdqDDJJVALORESESTADOS: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FFormulasCalculo : TFormulasCalculo;
    FIdCabeceraImportacion : Integer;

    { Private declarations }
    // function  VerificarCuitPeriodo(ACUIT, APeriodo: String) : integer;

    procedure CalculoVariablesDDJJ(ADJ : TFields);
    procedure CalculoVariablesTrabajador(ATrabajador : TFields);
    procedure CalculoEstadoDDJJ(ADJ : TFields);
    procedure CalculoEstadoTrabajador(ATrabajador : TFields);
    procedure AplicarReglasEstadosDDJJ(ADJ : TFields);
    procedure AplicarReglasEstadosTrabajador(ATrabajador : TFields);
    procedure AplicarReglasVariablesDDJJ(ADJ : TFields);
    procedure AplicarReglasVariablesTrabajador(ATrabajador : TFields);
    procedure GetQueryDDJJ(ACUIT, APeriodo: String);
    function GetQueryDDJJPeriodo(APeriodo: String): TSDQuery;
    procedure GetQueryDDJJTrabajador(AIdDDJJ: Integer);
    procedure SetIdCabeceraImportacion(const Value: Integer);

  public
    { Public declarations }
    procedure AplicarFormulas(ACUIT: string; APeriodo : String); overload;
    procedure AplicarFormulas(APeriodo : String); overload;
    procedure AplicarReglas(ACUIT : string; APeriodo : String);
    property IdCabeceraImportacion : Integer read FIdCabeceraImportacion write SetIdCabeceraImportacion;
  end;

var
  dmFormula: TdmFormula;

implementation


uses unCustomDataModule, unDmPrincipal, AnsiSql, SqlFuncs, DBFuncs, General,
     StrFuncs, VclExtra, Cuit, Math, unParams, unFuncionesEmision;

{$R *.dfm}

{ TFormulaContainer }

constructor TFormulaContainer.create;
begin
  FFormula := TFormula.Create;
end;

procedure TFormulaContainer.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TFormulaContainer.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TFormulaContainer.SetFormula(const Value: Tformula);
begin
  FFormula := Value;
end;

procedure TFormulaContainer.SetOrden(const Value: integer);
begin
  FOrden := Value;
end;

procedure TFormulaContainer.SetSeteo(const Value: integer);
begin
  FSeteo := Value;
end;


{ TFormulaEstado }

constructor TFormulaEstado.create(AId: Integer);
var
 Q : TSDQuery;
begin
  inherited Create;
  Q := GetQuery('select * from emi.ist_seteoestado ' +
              ' where st_id = ' + SqlValue(AId) + ' and st_fechabaja is null ');
  try
    if Q.RecordCount > 0 then
    begin
      with FFormula do
      begin
        Formula.Text        := Q.FieldByName('ST_FORMULA').AsString;
        TipoDatoRetorno     := 'B';
        LongitudDatoRetorno := 1;
      end;

      FSeteo        := Q.FieldByName('st_idseteo').AsInteger;
      FDescripcion  := Q.FieldByName('st_descripcion').AsString;
      FCodigo       := Q.FieldByName('st_codigo').AsString;
      FOrden        := Q.FieldByName('st_orden').AsInteger;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;


{ TFormulaVariable }

constructor TFormulaVariable.create(AId: Integer);
var
  Q : TSDQuery;
begin
  inherited Create;
  Q := GetQuery('select * from emi.isv_seteovariable ' +
              ' where sv_id = ' + SqlValue(AId) + ' and sv_fechabaja is null ');
  try
    if Q.RecordCount > 0 then
    begin
      with FFormula do
      begin
        Formula.Text := Q.FieldByName('sv_formadecalculo').AsString;
        TipoDatoRetorno := Q.FieldByName('sv_tipoparametro').AsString;
        LongitudDatoRetorno := Q.FieldByName('sv_tamanio').AsInteger;
      end;

      FSeteo := Q.FieldByName('sv_idseteo').AsInteger;
      FDescripcion := Q.FieldByName('sv_descripcion').AsString;
      FCodigo := Q.FieldByName('sv_codigo').AsString;
      FOrden := Q.FieldByName('sv_orden').AsInteger;
      FTipoVariable := Q.FieldByName('sv_tipoparametro').AsString;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;

{ TFormulasEstado }

constructor TFormulasEstado.create(ASeteo: Integer; ATipo: String);
var
  Q : TSDQuery;
  i : integer;
begin
  Q := GetQuery('select * from emi.ist_seteoestado ' +
              ' where st_idseteo = ' + SqlValue(ASeteo) +
              '   and st_idtipo = ' + SqlValue(ATipo) + ' and st_fechabaja is null ');
  try
    SetLength(Items, Q.RecordCount);
    i := 0;
    while not Q.Eof do
    begin
      Items[i] := TFormulaEstado.create(Q.FieldByName('st_id').AsInteger);
      inc(i);
      Q.Next;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;

{ TFormulasVariable }

constructor TFormulasVariable.create(ASeteo : Integer; ATipo : String);
var
  Q : TSDQuery;
  i : integer;
begin
  Q := GetQuery('select sv_id from emi.isv_seteovariable ' +
              ' where sv_idseteo = ' + SqlValue(ASeteo) +
              '   and sv_idtipo = ' + SqlValue(ATipo) + ' and sv_fechabaja is null ');
  try
    SetLength(Items, Q.RecordCount);
    i := 0;

    while not Q.Eof do
    begin
      Items[i] := TFormulaVariable.create(Q.FieldByName('sv_id').AsInteger);
      inc(i);
      Q.Next;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;


{ TFormulasCalculo }

constructor TFormulasCalculo.Create;
begin
  FIdSeteo := ValorSql('SELECT NVL(MAX(se_id), 0) FROM  emi.ise_seteo WHERE ' +
                           'se_fechavigenciadesde <= SYSDATE AND                ' +
                           '(se_fechavigenciahasta >= SYSDATE OR se_fechavigenciahasta IS NULL)');
  Create(FIdSeteo);
end;

constructor TFormulasCalculo.Create(AIdSeteo: Integer);
begin
  FIdSeteo := AIdSeteo;

  Assert(FIdSeteo > 0, 'No existe un seteo activo para el cálculo de variables y estados.');

  //Formulas
  FFormulasEstadoDDJJ := TFormulasEstado.Create(FIdSeteo, 'D');
  FFormulasVariablesDDJJ := TFormulasVariable.Create(FIdSeteo, 'D');
  FFormulasEstadoTrabajador := TFormulasEstado.Create(FIdSeteo, 'T');
  FFormulasVariablesTrabajador := TFormulasVariable.Create(FIdSeteo, 'T');

  //Reglas
  FReglasEstadoDDJJ := TReglasEstado.create(FIdSeteo, 'D');
  FReglasVariableDDJJ := TReglasVariables.create(FIdSeteo, 'D');
  FReglasEstadoTrabajador := TReglasEstado.create(FIdSeteo, 'T');
  FReglasVariableTrabajador := TReglasVariables.create(FIdSeteo, 'T');
end;


{-----------------------------------------------------------------------------------------------------------}
{ TFormulasCalculo.ActualizarVariable: Guarda Los resultados del calculo de las variables para la DJ o
      trabajador.
  Parámetros: ATipo - Tipo de Calculo .D _ Declaracion jurada, T _ Trabajador
              AResultados: Array de Resultados del Cálculo de Variables
              AId: Id del trabajador sobre el que se generó el cálculo o Id de la declaración segun sea el
                   parámetro ATipo.                                                                         }
{-----------------------------------------------------------------------------------------------------------}
procedure TFormulasCalculo.ActualizarVariable(ATipo : string; AResultados : Array of Variant; AId : Integer);
var
 resultado : string;
 i : integer;
begin
  resultado := '';

  //Las variables se guardan de izquierda a derecha siguiendo el orden
  //(Orden 1 la variable mas a la derecha, Orden n variable mas a la izquierda.)
  //para compatibilizar con el formato de estado (binario) donde el orden 1
  //es el bit mas a la derecha y el bit mas significativo es el estado de mayor orden.
  for i := 0 to high(AResultados) do
   if resultado = '' then resultado := Trim(AResultados[i])
   else resultado := Trim(AResultados[i]) +  '|' + resultado;


  //Si es un calculo de Declaración Jurada.
  if ATipo = 'D' then
  begin
    with dmFormula.sdqActualizarVariablesDeclaracion do
    begin
      params[0].asstring := resultado;
      params[1].asinteger := FIdSeteo;
      params[2].asinteger := AId;
      ExecSQL;
    end;
  end
  else   //Si es un calculo de Trabajador.
  begin
    with dmFormula.sdqActualizaVariablesTrabajador do
    begin
      params[0].asstring := resultado;
      params[1].asinteger := FIdSeteo;
      params[2].asinteger := AId;
      ExecSQL;
    end;
  end;
end;


{-----------------------------------------------------------------------------------------------------------}
{ TFormulasCalculo.ActualizarEstado: Guarda Los resultados del calculo de los estados para la DJ o trabajador.
  Parámetros: ATipo - Tipo de Calculo .D _ Declaracion jurada, T _ Trabajador
              AResultados: Array de Resultados del Cálculo de Estados.
              AId: Id del trabajador sobre el que se generó el cálculo o Id de la declaración segun sea el
                   parámetro ATipo.                                                                         }
{-----------------------------------------------------------------------------------------------------------}
procedure TFormulasCalculo.ActualizarEstado(ATipo : string; AResultados : Array of Variant; AId : Integer);
var
 resultado : integer;
 i : integer;
begin
  resultado := 0;
  for i := 0 to high(AResultados) do
    resultado := resultado or ( integer(AResultados[i]) shl i );

  if ATipo = 'D' then
  begin
    with dmFormula.sdqActualizarEstadosDeclaracion do
    begin
      params[0].asinteger := resultado;
      params[1].asinteger := FIdSeteo;
      params[2].asinteger := AId;
      ExecSQL;
    end;
  end
  else   //Si es un calculo de Trabajador.
  begin
    with dmFormula.sdqActualizaEstadosTrabajador do
    begin
      params[0].asinteger := resultado;
      params[1].asinteger := FIdSeteo;
      params[2].asinteger := AId;
      ExecSQL;      
    end;
  end;
end;

procedure TFormulasCalculo.ActualizarObservaciones(ATipo: string;
  AResultados: TObservaciones; AId: Integer);
var
 i : integer;
begin
  for i := low(AResultados) to high(AResultados) do
    do_setobservacion(AId, ATipo, AResultados[i]);
end;

(*******************************************************************************)
(*******************************************************************************)
(*******************************************************************************)
{ TdmFormula }

procedure TdmFormula.DataModuleCreate(Sender: TObject);
begin
  FFormulasCalculo := TFormulasCalculo.Create;
  sdqDDJJ.Prepare;
  sdqDDJJTrabajador.Prepare;
  sdqActualizaVariablesTrabajador.Prepare;
  sdqActualizarVariablesDeclaracion.Prepare;
  sdqActualizaEstadosTrabajador.Prepare;
  sdqActualizarEstadosDeclaracion.Prepare;
end;

procedure TdmFormula.DataModuleDestroy(Sender: TObject);
begin
  sdqDDJJ.UnPrepare;
  sdqDDJJTrabajador.UnPrepare;
end;

function TdmFormula.GetQueryDDJJPeriodo(APeriodo : String) : TSDQuery;
begin
  Result := GetQuery('SELECT * FROM  emi.idj_ddjj IDJ                              ' +
                ' WHERE DJ_IDDDJJCABECERAIMPORTACION = (                      ' +
                '                 SELECT MAX(DJ_IDDDJJCABECERAIMPORTACION)    ' +
                '                   FROM EMI.IDJ_DDJJ IDJ2                    ' +
                '                  WHERE IDJ2.DJ_CUIT    = IDJ.DJ_CUIT        ' +
                '                    AND IDJ2.DJ_PERIODO = IDJ.DJ_PERIODO     ' +
                '               GROUP BY DJ_CUIT, DJ_PERIODO)                 ' +
                '   AND DJ_PERIODO = ' + SqlValue(APeriodo));


end;

procedure TdmFormula.AplicarFormulas(ACUIT: string; APeriodo : String);
begin
  GetQueryDDJJ(ACuit, APeriodo);
  GetQueryDDJJTrabajador(sdqDDJJ.Fields[0].AsInteger);
  try
    if sdqDDJJ.RecordCount = 0 then exit;
    CalculoVariablesDDJJ(sdqDDJJ.Fields);
    CalculoEstadoDDJJ(sdqDDJJ.Fields);
    while not sdqDDJJTrabajador.Eof do
    begin
      CalculoVariablesTrabajador(sdqDDJJTrabajador.Fields);
      CalculoEstadoTrabajador(sdqDDJJTrabajador.Fields);
      sdqDDJJTrabajador.Next;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error al Aplicar la Fórmula para CUIT: ' + ACUIT + ', período: ' + APeriodo + #13#10 +
          'Mensaje de Error Original: ' + E.Message);
  end;
end;

procedure TdmFormula.AplicarFormulas(APeriodo: String);
var
 Q : TSDQuery;
begin
  Q := GetQueryDDJJPeriodo(APeriodo);

  try
    if Q.RecordCount = 0 then exit;
    while not Q.Eof do
    begin
      CalculoVariablesDDJJ(Q.Fields);
      CalculoEstadoDDJJ(Q.Fields);
      Q.Next;
    end;
  finally
    Q.Close;
    Q.free;
  end;
end;

procedure TdmFormula.AplicarReglas(ACUIT : string; APeriodo : String);
begin
  GetQueryDDJJ(ACuit, APeriodo);
  GetQueryDDJJTrabajador(sdqDDJJ.Fields[0].asinteger);
  try
    if sdqDDJJ.RecordCount = 0 then exit;
    do_inicializarobservaciones(sdqDDJJ.Fields[0].AsInteger, 'D');
    AplicarReglasEstadosDDJJ(sdqDDJJ.Fields)                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ;
    AplicarReglasVariablesDDJJ(sdqDDJJ.Fields);
    while not sdqDDJJTrabajador.Eof do
    begin
      do_inicializarobservaciones(sdqDDJJTrabajador.Fields[0].AsInteger, 'T');
      AplicarReglasEstadosTrabajador(sdqDDJJTrabajador.Fields);
      AplicarReglasVariablesTrabajador(sdqDDJJTrabajador.Fields);
      sdqDDJJTrabajador.Next;
    end;
// FIXME .. mover de acá..
//    do_actualizarestadoverif(sdqDDJJ.Fields[0].AsInteger);
//Completar el manejo de errores.
  except
     on E : Exception do
       raise Exception.Create('Error al Aplicar la Fórmula para CUIT: ' + ACUIT + ', período: ' + APeriodo + #13#10 +
          'Mensaje de Error Original: ' + E.Message);
  end;
end;

procedure TdmFormula.CalculoVariablesDDJJ(ADJ : TFields);
var
 i : integer;
 resultados : array of variant;
begin
  with FFormulasCalculo.FFormulasVariablesDDJJ do
  begin
    SetLength(resultados, Length(Items));
    for i := 0 to High(Items) do
    begin
       Items[i].Formula.Source := ADJ.DataSet;
//       Items[i].Formula.CheckSintaxis;
       resultados[i] := Items[i].Formula.Execute;
    end;

    FFormulasCalculo.ActualizarVariable('D', resultados, ADJ.Fields[0].AsInteger);
  end;
end;

procedure TdmFormula.CalculoVariablesTrabajador(ATrabajador : TFields);
var
 i : integer;
 resultados : array of variant;
begin
  with FFormulasCalculo.FFormulasVariablesTrabajador do
  begin
    SetLength(resultados, Length(Items));
    for i := 0 to High(Items) do
    begin
       Items[i].Formula.Source := ATrabajador.DataSet;
//       Items[i].Formula.CheckSintaxis;
       resultados[i] := Items[i].Formula.Execute;
    end;
    FFormulasCalculo.ActualizarVariable('T', resultados, ATrabajador.FieldByName('id').AsInteger);
  end;
end;

procedure TdmFormula.CalculoEstadoDDJJ(ADJ: TFields);
var
 i : integer;
 resultados : array of variant;
begin
  with FFormulasCalculo.FFormulasEstadoDDJJ do
  begin
    SetLength(resultados, Length(Items));
    for i := 0 to High(Items) do
    begin
       Items[i].Formula.Source := ADJ.DataSet;
//       Items[i].Formula.CheckSintaxis;
       resultados[i] := Items[i].Formula.Execute;
    end;
    FFormulasCalculo.ActualizarEstado('D', resultados, ADJ.FieldByName('id').AsInteger);
  end;
end;

procedure TdmFormula.CalculoEstadoTrabajador(ATrabajador: TFields);
var
 i : integer;
 resultados : array of variant;
begin
  with FFormulasCalculo.FFormulasEstadoTrabajador do
  begin
    SetLength(resultados, Length(Items));
    for i := 0 to High(Items) do
    begin
       Items[i].Formula.Source := ATrabajador.DataSet;
//       Items[i].Formula.CheckSintaxis;
       resultados[i] := Items[i].Formula.Execute;
    end;
    FFormulasCalculo.ActualizarEstado('T', resultados, ATrabajador.FieldByName('id').AsInteger);
  end;
end;


////////////////////////////////////////////////////////////////////////////////
{                 Reglas - Aplicación de Reglas                                }
////////////////////////////////////////////////////////////////////////////////

procedure TdmFormula.AplicarReglasEstadosDDJJ(ADJ: TFields);
var
 observaciones : TObservaciones;
begin
  observaciones := nil;
  with FFormulasCalculo.FReglasEstadoDDJJ do
  begin
    if not ADJ.FieldByName('valoresestados').IsNull then
    begin
      GetEstados(ADJ.FieldByName('valoresestados').AsInteger);
      observaciones := AplicarReglas;
      FFormulasCalculo.ActualizarObservaciones('D', observaciones, ADJ.FieldByName('id').AsInteger);
    end;
  end;
end;

procedure TdmFormula.AplicarReglasEstadosTrabajador(ATrabajador: TFields);
var
 observaciones : TObservaciones;
begin
  observaciones := nil;
  with FFormulasCalculo.FReglasEstadoTrabajador do
  begin
    if not ATrabajador.FieldByName('valoresestados').IsNull then
    begin
      GetEstados(ATrabajador.FieldByName('valoresestados').AsInteger);
      observaciones := AplicarReglas;
      FFormulasCalculo.ActualizarObservaciones('T', observaciones, ATrabajador.FieldByName('id').AsInteger);
    end;
  end;
end;

procedure TdmFormula.AplicarReglasVariablesDDJJ(ADJ: TFields);
var
 observaciones : TObservaciones;
begin
  observaciones := nil;
  with FFormulasCalculo.FReglasVariableTrabajador do
  begin
    if not ADJ.FieldByName('valoresvariables').IsNull then
    begin
      GetVariables(ADJ.FieldByName('valoresvariables').Value);
      observaciones := AplicarReglas;
      FFormulasCalculo.ActualizarObservaciones('D', observaciones, ADJ.FieldByName('id').AsInteger);
    end;
  end;
end;

procedure TdmFormula.AplicarReglasVariablesTrabajador(
  ATrabajador: TFields);
var
 observaciones : TObservaciones;
begin
  observaciones := nil;
  with FFormulasCalculo.FReglasVariableTrabajador do
  begin
    if not ATrabajador.FieldByName('valoresvariables').IsNull then
    begin
      GetVariables(ATrabajador.FieldByName('valoresvariables').Value);
      observaciones := AplicarReglas;
      FFormulasCalculo.ActualizarObservaciones('T', observaciones, ATrabajador.FieldByName('id').AsInteger);
    end;
  end;
end;

{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
procedure TdmFormula.GetQueryDDJJ(ACUIT, APeriodo: String);
begin
  if sdqDDJJ.Active then sdqDDJJ.close;
  try
    sdqDDJJ.ParamByName('cuit').AsString := ACUIT;
    sdqDDJJ.ParamByName('periodo').AsString := APeriodo;
    sdqDDJJ.ParamByName('idddjjcabeceraimportacion').AsInteger := FIdCabeceraImportacion;
  finally
    sdqDDJJ.Open;
  end;
end;

procedure TdmFormula.GetQueryDDJJTrabajador(AIdDDJJ: Integer);
begin
  if sdqDDJJTrabajador.Active then sdqDDJJTrabajador.close;
  try
    sdqDDJJTrabajador.ParamByName('idddjj').AsInteger := AIdDDJJ;
  finally
    sdqDDJJTrabajador.Open;
  end;
end;

procedure TdmFormula.SetIdCabeceraImportacion(const Value: Integer);
begin
  FIdCabeceraImportacion := Value;
end;

{ TReglasEstado }

constructor TReglasEstado.create(ASeteo: Integer; ATipo: String);
var
  Q : TSDQuery;
  i : integer;
begin
  Q := GetQuery('select * from emi.ioe_observacionestado ioe, emi.ist_seteoestado ist ' +
              ' where ioe.oe_idseteoestado  = ist.st_id    ' +
              '   and ist.st_idseteo = ' + SqlValue(ASeteo)  +
              '   and ist.st_idtipo = ' + SqlValue(ATipo)    +
              '   and ist.st_fechabaja is null and ioe.oe_fechabaja is null ' );

  SetLength(FItems, Q.RecordCount);
  i := 0;
  try
    while not Q.Eof do
    begin
      FItems[i] := TReglaEstado.create(Q.FieldByName('oe_id').AsInteger);
      inc(i);
      Q.Next;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TReglasEstado.GetEstados(AEstados: Integer);
var
 i : integer;
begin
    // FItems[i].FEstado es el orden del la variable que estoy buscando dentro del mapa de bit
    // Representado en AEstados. Ej : AEstados = 561 : 001000110001 visto en binario.
    //           si    FEstado = 5. Significa que estoy interesado en la quinta variable
    //                              empezando desde la derecha. En este caso un uno.
    // Aplicando (AEstado and 000000010000) vuelve a dar 000000010000 solo si AEstado está seteado
    // en la 5 posición, de otro modo daría 000000000000. Esto es precisamenete lo que quiero determinar.
    // Para obtener 000000010000 para la quinta posicion simplemente desplazo un uno 5 posiciones. 1 shl 5.

    // El grado de la abstracción a esta altura es un poco difuso no transferir información extrameta-esquema
    // tan abajo en la jerarquía.
    for i := Low(FItems) to High(FItems) do
      FItems[i].FValorEstado := (AEstados and (1 shl i)) = (1 shl i);
end;
{------------------------------------------------------------------------------}
function TReglasEstado.AplicarReglas: TObservaciones;
var
 i : integer;
 Observacion : TObservacion;
begin
    SetLength(result, 0);
    for i := Low(FItems) to High(FItems) do
    begin
      Observacion := FItems[i].GetObservacion;
      if Observacion > 0 then
      begin
        SetLength(result, Length(result) + 1);
        result[High(result)] := Observacion;
      end;
    end;
end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}


{ TReglasVariables }
{------------------------------------------------------------------------------}
constructor TReglasVariables.create(ASeteo: Integer; ATipo: String);
var
  Q : TSDQuery;
  i : integer;
begin
  Q := GetQuery('select * from emi.iov_observacionvariable iov, emi.isv_seteovariable isv ' +
              ' where iov.ov_idseteovariable  = isv.sv_id    ' +
              '   and isv.sv_idseteo = ' + SqlValue(ASeteo)  +
              '   and isv.sv_idtipo = ' + SqlValue(ATipo)  +
              '   and isv.sv_fechabaja is null and iov.ov_fechabaja is null ');

  SetLength(FItems, Q.RecordCount);
  i := 0;
  try
    while not Q.Eof do
    begin
      FItems[i] := TReglaVariable.create(Q.FieldByName('ov_id').AsInteger);
      inc(i);
      Q.Next;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TReglasVariables.GetVariables(AVariables: String);
var
 S : TStringList;
 i : Integer;
begin
  S := TStringList.Create;
  try
    S.Delimiter := '|';
    S.DelimitedText := AVariables;
    for i := Low(FItems) to High(FItems) do
      FItems[i].FValorVariable := S.Strings[i];
  finally
    S.Free;
  end;
end;
{------------------------------------------------------------------------------}
function TReglasVariables.AplicarReglas: TObservaciones;
var
 i : integer;
 Observacion : TObservacion;
begin
    SetLength(result, 0);
    for i := Low(FItems) to High(FItems) do
    begin
      Observacion := FItems[i].GetObservacion;
      if Observacion > 0 then
      begin
        SetLength(result, Length(result) + 1);
        result[High(result)] := Observacion;
      end;
    end;
end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}

{ TReglaEstado }
constructor TReglaEstado.create(AId : Integer);
var
 Q : TSDQuery;
begin
  inherited Create;
  Q := GetQuery('select * from emi.ioe_observacionestado ' +
                ' where oe_id = ' + SqlValue(AId) + ' and oe_fechabaja is null ') ;
  try
    if Q.RecordCount > 0 then
    begin
      FObservacion := Q.FieldByName('oe_idobservacion').AsInteger;
      FSeteoEstado := Q.FieldByName('oe_idseteoestado').AsInteger;
      FRelacion    := Q.FieldByName('oe_relacion').AsString = 'S';
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;

function TReglaEstado.GetObservacion: TObservacion;
begin
  if FRelacion = FValorEstado then
       result := FObservacion
  else result := 0;
end;

{ TReglaVariable }

constructor TReglaVariable.Create(AId : Integer);
var
 Q : TSDQuery;
begin
  inherited Create;

  FInterpreter := TJvInterpreterProgram.Create(nil);

  Q := GetQuery('select * from emi.iov_observacionvariable ' +
                ' where ov_id = ' + SqlValue(AId) + ' and ov_fechabaja is null ');
  try
    if Q.RecordCount > 0 then
    begin
      FSeteoVariable :=  Q.FieldByName('ov_idseteovariable').AsInteger;
      FObservacion   := Q.FieldByName('ov_idobservacion').AsInteger;
      FRelacion      := Q.FieldByName('ov_relacion').AsString;
      FValorUnario   := Q.FieldByName('ov_valorunario').Value;
      FValorBinario  := Q.FieldByName('ov_valorbinario').Value;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;

destructor TReglaVariable.Destroy;
begin
  FInterpreter.Free;
end;

function TReglaVariable.GetObservacion: TObservacion;
var
 sl : TStringList;
 i : integer;
begin
  result := 0;

  case ArrayPos(FRelacion, RELACIONES) of
  0 : if FValorVariable = FValorUnario then result := FObservacion;
  1 : if FValorVariable > FValorUnario then result := FObservacion;
  2 : if FValorVariable < FValorUnario then result := FObservacion;
  3 : if FValorVariable >= FValorUnario then result := FObservacion;
  4 : if FValorVariable <= FValorUnario then result := FObservacion;
  5 : if FValorVariable <> FValorUnario then result := FObservacion;
  6 : if (FValorVariable >= FValorUnario) and
         (FValorVariable <= FValorBinario) then result := FObservacion;
  7 : if not ((FValorVariable >= FValorUnario) and
         (FValorVariable <= FValorBinario)) then result := FObservacion;
  8 : begin
        sl := TStringList.Create;
        try
          sl.CommaText := AnsiUpperCase(FValorUnario);

          for i := 0 to sl.Count - 1 do
          if sl[i] =  AnsiUpperCase(FValorVariable) then
          begin
             result := FObservacion;
             break;
          end;
        finally
          sl.Free;
        end;
      end;
  9 : begin
        sl := TStringList.Create;
        try
          result := FObservacion;
          sl.CommaText := AnsiUpperCase(FValorUnario);
          for i := 0 to sl.Count - 1 do
           if sl[i] =  AnsiUpperCase(FValorVariable) then
           begin
             result := 0;
             break;
           end;
        finally
          sl.Free;
        end;
      end;
  10 : if pos(string(FValorUnario), string(FValorVariable)) > 0 then result := FObservacion;
  11 : if not pos(string(FValorUnario), string(FValorVariable)) > 0 then result := FObservacion;
  end;
end;

end.

