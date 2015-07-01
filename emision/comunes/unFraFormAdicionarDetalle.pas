unit unFraFormAdicionarDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ComCtrls, ToolWin, CurrEdit,
  StdCtrls, ToolEdit, DateComboBox, Mask, PatternEdit, IntEdit, VCLExtra, CustomDlgs, Cuit,
  unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql, SDEngine, unConstEmision,
  unFuncionesEmision, Strfuncs, General, QueryToFile, ExportDialog;

type
  TfraFormAdicionarDetalle = class(TFrame)
    gbDetalle: TGroupBox;
    lblSumEmple: TLabel;
    lblCantidadEncontrados: TLabel;
    lblSumCantPeriodos: TLabel;
    dbgRegistros: TDBGrid;
    edTrabEncontrados: TIntEdit;
    edTrabNoEncontrados: TIntEdit;
    cdsRegistros: TClientDataSet;
    dsRegistros: TDataSource;
    edTotalRegistros: TIntEdit;
    tbComandosDetalleAdicDetalle: TToolBar;
    tbAddFile: TToolButton;
    tbLimpiar: TToolButton;
    edArchivo: TEdit;
    OpenDialog: TOpenDialog;
    tbProcesar: TToolButton;
    ExportDialog: TExportDialog;
    tbExport: TToolButton;
    procedure tbAddFileClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbProcesarClick(Sender: TObject);
    procedure cdsRegistrosAfterOpen(DataSet: TDataSet);
    procedure tbExportClick(Sender: TObject);
  private
    FContrato: integer;
    FPeriodoAnt: String;
    FErrorGeneral: String;
    procedure GuardarDetalleBorrador(aIdNotaPeriodo: integer; aCuil: String; aMasaSalarial: Real;
      aFechaPresentacion: TDateTime; DiasTrabajados: integer; idddjj: integer; idtrabajador: integer);
    procedure EliminarDetalleBorrador(aIdNota: integer);
    procedure ParsearLinea(aLinea: String; aNroLinea: integer);
    procedure ProcesarRegistros;
  public
    property Contrato: integer read FContrato write FContrato;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    procedure Init;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario: integer; aIdNota: integer);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure CargarArchivo(aArchivo: String);
    procedure MostrarValores(aIdNotaPeriodo: integer);
  end;

implementation

{$R *.dfm}

procedure TfraFormAdicionarDetalle.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);

  edTotalRegistros.Enabled := False;
  edTrabEncontrados.Enabled := False;
  edTrabNoEncontrados.Enabled := False;

  edTotalRegistros.Readonly := True;
  edTrabEncontrados.Readonly := True;
  edTrabNoEncontrados.Readonly := True;

  edTotalRegistros.Color := $00F4ECEC;
  edTrabEncontrados.Color := $00F4ECEC;
  edTrabNoEncontrados.Color := $00F4ECEC;
  
  edArchivo.ReadOnly := true;

  tbComandosDetalleAdicDetalle.Enabled := true;
  tbProcesar.Enabled := aActive;
  tbAddFile.Enabled := aActive;
  tbLimpiar.Enabled := aActive;
  tbExport.Enabled := true;
end;

procedure TfraFormAdicionarDetalle.Init;
begin
  cdsRegistros.CreateDataSet;
  cdsRegistros.EmptyDataSet;
  FPeriodoAnt := '';
  FErrorGeneral := '';
end;

procedure TfraFormAdicionarDetalle.LimpiarControles;
begin
  edArchivo.Clear;
  cdsRegistros.EmptyDataSet;
  tbAddFile.Enabled := (cdsRegistros.RecordCount = 0);
  tbProcesar.Enabled := (cdsRegistros.RecordCount = 0);

  edTotalRegistros.Value := 0;
  edTrabEncontrados.Value := 0;
  edTrabNoEncontrados.Value := 0;
  
  edArchivo.Clear;
end;

procedure TfraFormAdicionarDetalle.tbAddFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfraFormAdicionarDetalle.CargarArchivo(aArchivo: String);
var
  i: integer;
begin
  with TStringList.Create do
  try
    LoadFromFile(aArchivo);
    for i:=0 to Count-1 do
      ParsearLinea(Strings[i], i+1);
  finally
    free;
  end;
end;

procedure TfraFormAdicionarDetalle.tbLimpiarClick(Sender: TObject);
begin
  LimpiarControles;
end;

function TfraFormAdicionarDetalle.Validar(aIdFormulario: integer): boolean;
begin
  Verificar(cdsRegistros.IsEmpty, dbgRegistros, 'Debe ingresar un archivo.');

  cdsRegistros.First;
  while not cdsRegistros.Eof do
    begin
//      Verificar(edTextoGestion.Enabled and (trim(edTextoGestion.Text) = ''), edTextoGestion, 'El archivo no se gestionará. Debe ingresar un texto de gestión.');
      Verificar(cdsRegistros.FieldByName('Error').AsString <> '', dbgRegistros, 'Se han encontrados errores en el archivo.');
//      Verificar(not cdsRegistros.FieldByName('Error').IsNull, dbgRegistros, 'Se han encontrados errores en el archivo.');

      cdsRegistros.Next;
    end;


  result := true;
end;

procedure TfraFormAdicionarDetalle.GuardarBorrador(aIdFormulario: integer; aIdNota: integer);
var
  aIdNotaPeriodo: integer;
begin
  EliminarDetalleBorrador(aIdNota);

  aIdNotaPeriodo := ValorSqlInteger(' SELECT NP_ID ' +
                                    ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                    ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                                    ' AND NP_PERIODO = ' + SqlValue(cdsRegistros.FieldByName('Periodo').AsString) +
                                    ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario), -1);


  cdsRegistros.First;
  while not cdsRegistros.Eof do
  begin

    with TSql.Create do
    try
      TableName := 'EMI.INP_NOTACONTRATOPERIODO';
      Fields.Add('NP_PERIODO', cdsRegistros.FieldByName('Periodo').AsString);
      Fields.Add('NP_IDNOTA', aIdNota);
      Fields.Add('NP_IDTIPOFORMULARIO', aIdFormulario);

      if (aIdNotaPeriodo = -1) then
      begin
        SqlType := stInsert;
        aIdNotaPeriodo := GetSecNextVal('emi.seq_inp_id');
        PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
        Fields.Add('NP_FECHAALTA', exDateTime);
        Fields.Add('NP_USUALTA', Sesion.LoginName);
      end
      else begin
        SqlType := stUpdate;
        PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
        Fields.Add('NP_FECHAMODIF', exDateTime);
        Fields.Add('NP_USUMODIF', Sesion.LoginName);
        Fields.Add('NP_FECHABAJA', exNull);
        Fields.Add('NP_USUBAJA', exNull);
      end;

      Fields.Add('NP_ILEGIBLE', 'N');
      Fields.Add('NP_FORMULARIOMIXTO', 'N');
      Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);

      EjecutarSqlST(Sql);

      GuardarDetalleBorrador(aIdNotaPeriodo,
                             cdsRegistros.FieldByName('Cuil').AsString,
                             cdsRegistros.FieldByName('MasaSalarial').AsFloat,
                             cdsRegistros.FieldByName('FechaPresentacion').AsDateTime,
                             cdsRegistros.FieldByName('DiasTrabajados').AsInteger,
                             cdsRegistros.FieldByName('idddjj').AsInteger,
                             cdsRegistros.FieldByName('idtrabajador').AsInteger
                             );
    finally
      free;
    end;
    cdsRegistros.Next;
  end;
  MostrarValores(aIdNotaPeriodo);
end;

procedure TfraFormAdicionarDetalle.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
  aIdNota :integer;
begin

  aIdNota := ValorSqlInteger('SELECT NP_IDNOTA FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));

  Q := GetQuery(' SELECT at_id, at_idnotacontratoperiodo, at_cuil, at_fechapresentacion, at_masasalarial, np_periodo, at_idddjj, at_iddttrabajador, at_diastrabajados ' +
                ' FROM emi.inp_notacontratoperiodo, emi.iat_adicionaltrabajador ' +
                ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                ' AND at_idnotacontratoperiodo = np_id');

  try
    while not Q.Eof do
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Cuil').AsString := Q.fieldbyname('at_cuil').AsString;
      cdsRegistros.FieldByName('Periodo').AsString := Q.fieldbyname('np_periodo').AsString;
      cdsRegistros.FieldByName('MasaSalarial').AsFloat := Q.fieldbyname('at_masasalarial').AsFloat;
      cdsRegistros.FieldByName('FechaPresentacion').AsDateTime := Q.fieldbyname('at_fechapresentacion').AsDateTime;
      cdsRegistros.FieldByName('DiasTrabajados').AsInteger := Q.fieldbyname('at_diastrabajados').AsInteger;
      cdsRegistros.FieldByName('idDetalle').AsInteger := Q.fieldbyname('at_id').AsInteger;
      cdsRegistros.FieldByName('idddjj').AsInteger := Q.fieldbyname('at_idddjj').AsInteger;
      cdsRegistros.FieldByName('idtrabajador').AsInteger := Q.fieldbyname('at_iddttrabajador').AsInteger;
      cdsRegistros.FieldByName('ExisteDDJJ').AsString := iif(not (Q.fieldbyname('at_idddjj').IsNull), 'S', 'N');
      cdsRegistros.FieldByName('ExisteTrabajador').AsString := iif(not (Q.fieldbyname('at_iddttrabajador').IsNull), 'S', 'N');


      edTotalRegistros.Value := edTotalRegistros.Value + 1;
      if (Q.fieldbyname('at_iddttrabajador').AsInteger <> 0) then
        edTrabEncontrados.Value := edTrabEncontrados.Value + 1
      else
        edTrabNoEncontrados.Value := edTrabNoEncontrados.Value + 1;


      cdsRegistros.Post;
      Q.Next;
    end;
  finally
    Q.free;
  end;

  tbAddFile.Enabled := (cdsRegistros.RecordCount = 0);
  tbProcesar.Enabled := (cdsRegistros.RecordCount = 0);

end;

procedure TfraFormAdicionarDetalle.GuardarDetalleBorrador(aIdNotaPeriodo: integer; aCuil: String; aMasaSalarial: Real;
    aFechaPresentacion: TDateTime; DiasTrabajados: integer; idddjj: integer; idtrabajador: integer);
begin
  EjecutarSqlST(' INSERT INTO EMI.iat_adicionaltrabajador ' +
                ' VALUES (EMI.SEQ_IAT_ID.NEXTVAL, ' + SqlValue(aIdNotaPeriodo) + ', ' +
                  SqlValue(aCuil) + ', ' +
                  SqlNumber(aMasaSalarial) + ', ' +
                  SqlDate(aFechaPresentacion)  + ', ' +
                  SqlNumber(idddjj, true) + ', ' +
                  SqlNumber(idtrabajador, true) + ', ' +
                  SqlNumber(DiasTrabajados) + ')' );
end;

procedure TfraFormAdicionarDetalle.ParsearLinea(aLinea: String; aNroLinea: integer);
var
  Arr: TStringArray;
  strError: String;
  Masa: Real;
  FechaPres: TDate;
  Dia, Mes, Ano: Word;
  format : TFormatSettings;
  DiasTrabajados: integer;
begin
  DiasTrabajados := 0;

  if (aNroLinea > 1) then
  begin
    //Cuil--Periodo--Masa Adicional--Fecha Presentacion--DiasTrabajados
    Split(aLinea, #9, Arr);

    strError  := '';
    FechaPres := 0;
    Masa  := 0;

    if (Length(Arr) >= 5) then
    begin

      if not IsCuil(trim(Arr[0])) then
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Cuil Inválido ' + trim(Arr[0]) + #13#10;

      try
        StrToInt(Copy(trim(Arr[1]), 5, 2 ));
        StrToInt(Copy(trim(Arr[1]), 1, 4 ));
      except
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Período Inválido ' + trim(Arr[1]) + #13#10;
      end;

      if instr(Arr[2], '.') <> 0 then
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Masa Salarial incluye puntos (.) ' + trim(Arr[2]) + #13#10;

  //    Arr[2] := StringReplace(Arr[2], '.', '',  [rfReplaceAll]);
      Arr[2] := StringReplace(Arr[2], ',', '.', [rfReplaceAll]);

      format.DecimalSeparator := '.';
      Masa := StrToFloatDef(Arr[2], -1,format);

      if (Masa < 0) then
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Masa Salarial Inválida ' + trim(Arr[2]) + #13#10;

      try
        if (Length(trim(Arr[3])) = 10) then
        begin
          Dia := StrToInt(copy(Arr[3],1,2));
          Mes := StrToInt(copy(Arr[3],4,2));
          Ano := StrToInt(copy(Arr[3],7,4));

          FechaPres := EncodeDate(Ano, Mes, Dia);
        end
        else
          strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Fecha Inválida ' + trim(Arr[3]) + #13#10;
      except
        on E: Exception do
          strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Fecha Inválida ' + trim(Arr[3]) + E.Message + #13#10;
      end;

      if (trim(Arr[4]) = '') or (StrToIntDef(Arr[4], -1) < 0) then
      begin
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Días trabajados debe ser numérico ' + trim(Arr[4]) + #13#10;
      end;


      if StrToIntDef(Arr[4], 0) <= ValorSqlInteger(
        'SELECT TO_CHAR(LAST_DAY( '+ 'TO_DATE(''' +  Arr[1] + '01'', ''YYYYMMDD'')' + '), ''DD'') '+
        '  FROM DUAL ') then
        DiasTrabajados := StrToIntDef(Arr[4], 0)
      else
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Días trabajados mayor a los del mes ' + trim(Arr[4]) + #13#10;
    end
    else
      strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Faltan Campos ' + #13#10;

    if strError <> '' then
      strError := CutRight(strError, 2);

    if (FPeriodoAnt <> '') and (FPeriodoAnt <> trim(Arr[1])) then
    begin
      FErrorGeneral := 'Sólo se puede cargar un período a la vez';
      Exit;
    end
    else
      FPeriodoAnt := trim(Arr[1]);

    try
      cdsRegistros.Append;

      cdsRegistros.FieldByName('Cuil').AsString :=  trim(Arr[0]);
      cdsRegistros.FieldByName('Periodo').AsString := trim(Arr[1]);
      cdsRegistros.FieldByName('MasaSalarial').AsFloat := Masa;
      cdsRegistros.FieldByName('FechaPresentacion').AsDateTime := FechaPres;
      cdsRegistros.FieldByName('DiasTrabajados').AsInteger := DiasTrabajados;
      cdsRegistros.FieldByName('idDetalle').AsInteger := -1;
      cdsRegistros.FieldByName('Error').AsString :=  strError;

      cdsRegistros.Post;
    except
      on E: EDBClient do
      begin
        //Key violation
        if E.ErrorCode = 9729 then
        begin
          MsgBox('El Cuil ' + trim(Arr[0]) + ' está duplicado. Corrija el archivo y vuelva a procesarlo.', MB_ICONERROR, Self.Caption);
          cdsRegistros.Cancel;
          LimpiarControles;
          edArchivo.Text := OpenDialog.FileName;
          Abort;
        end
        else
          raise e;
      end;
    end;
  end;
end;

procedure TfraFormAdicionarDetalle.tbProcesarClick(Sender: TObject);
begin
  if (OpenDialog.FileName = '') then Exit;
  CargarArchivo(OpenDialog.FileName);
  ProcesarRegistros;
  Verificar((FErrorGeneral <> ''), edArchivo, FErrorGeneral);
  tbAddFile.Enabled := (cdsRegistros.RecordCount = 0);
  tbProcesar.Enabled := (cdsRegistros.RecordCount = 0);
end;

procedure TfraFormAdicionarDetalle.ProcesarRegistros;
var
  idddj, idddjjtrabajador: integer;
begin
  cdsRegistros.DisableControls;
  try
    cdsRegistros.First;
    while not cdsRegistros.Eof do
    begin
      cdsRegistros.Edit;
      get_Idddjjcuil(contrato,
                     cdsRegistros.FieldByName('Periodo').AsString,
                     cdsRegistros.FieldByName('FechaPresentacion').AsDateTime,
                     cdsRegistros.FieldByName('cuil').AsString,
                     TF_AdicionarDetalle,
                     idddj,
                     idddjjtrabajador);
      cdsRegistros.FieldByName('idddjj').AsInteger := idddj;
      cdsRegistros.FieldByName('idtrabajador').AsInteger := idddjjtrabajador;

      edTotalRegistros.Value := edTotalRegistros.Value + 1;

      if (idddjjtrabajador <> 0) then
      begin
(*
        cdsRegistros.FieldByName('MasaSalarial').AsFloat := ValorSqlExtended('select dt_remuneracion ' +
                                                                                  'from emi.idt_ddjjtrabajador ' +
                                                                                  'where dt_id = ' + SqlValue(idddjjtrabajador));
//                                                                                  cdsRegistros.FieldByName('MasaSalarial').AsFloat;
*)
        edTrabEncontrados.Value := edTrabEncontrados.Value + 1;
      end
      else
        edTrabNoEncontrados.Value := edTrabNoEncontrados.Value + 1;

      cdsRegistros.FieldByName('ExisteDDJJ').AsString := iif((idddj <> 0), 'S', 'N');
      cdsRegistros.FieldByName('ExisteTrabajador').AsString := iif((idddjjtrabajador <> 0), 'S', 'N');

      cdsRegistros.UpdateRecord;

      cdsRegistros.Next;
    end;
  finally
    cdsRegistros.EnableControls;
  end;
end;

procedure TfraFormAdicionarDetalle.EliminarDetalleBorrador(aIdNota: integer);
begin

  EjecutarSqlST(' DELETE FROM EMI.iat_adicionaltrabajador ' +
                ' WHERE AT_IDNOTACONTRATOPERIODO IN (SELECT NP_ID ' +
                                                    'FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                                    'WHERE NP_IDNOTA = ' + SqlValue(aIdNota) + ')');

  EjecutarSqlST(' DELETE FROM EMI.inp_notacontratoperiodo ' +
                ' WHERE NP_IDNOTA IN ( ' + SqlValue(aIdNota) + ')');
end;

procedure TfraFormAdicionarDetalle.cdsRegistrosAfterOpen(DataSet: TDataSet);
begin
  if DataSet.Fields.FindField('MasaSalarial') is TFloatField then
    TFloatField(DataSet.FieldByName('MasaSalarial')).Currency := True;
end;

procedure TfraFormAdicionarDetalle.MostrarValores(aIdNotaPeriodo: integer);
var
  sSql: String;
begin
  do_aplicarcaso21(FContrato, aIdNotaPeriodo, true);
  sSql := ' SELECT np_totalempleados, np_totalmasasintopear, np_totalmasasalarial, np_textonota FROM emi.inp_notacontratoperiodo WHERE np_id = :id';

  with GetQueryEx(sSql, [aIdNotaPeriodo]) do
  try
    if not IsEmpty then
      ShowMessage(Format('Masa sin Tope: %12.2f ' + #13#10 + 'Masa Topeada: %12.2f ' +  #13#10 + '%s' + #13#10 + #13#10 +
      'Los días trab. de la DDJJ tienen prioridad  ' + #13#10 + 'por sobre los cargados en este archivo.',
      [FieldByName('np_totalmasasintopear').AsFloat,
      FieldByName('np_totalmasasalarial').AsFloat,
      FieldByName('np_textonota').AsString
      ]));
  finally
    Free;
  end;
end;
{
var
  sSql: String;
begin
   sSql :=  '  SELECT COUNT(*) canttrab, SUM(dt_remuneracion) remu, SUM(remtop) remtop, SUM(DECODE(isremtop, 1, 1, 2, 1, 3, 1, 0)) isremtop ' +
            '  FROM (SELECT at_masasalarial dt_remuneracion, ' +
            '               emi.utiles.get_remuneraciontopeada(NVL(dj_cuit, art.afiliacion.get_cuitempresa(no_contrato)), at_cuil, ''01'', np_periodo, at_masasalarial, 0, nvl(at_diastrabajados, 31), ''D'') remtop, ' +
            '               emi.utiles.is_remuneraciontopeada(NVL(dj_cuit, art.afiliacion.get_cuitempresa(no_contrato)), at_cuil, ''01'', np_periodo, at_masasalarial, 0, nvl(at_diastrabajados, 31), ''D'') isremtop ' +
            '          FROM emi.idj_ddjj, emi.iat_adicionaltrabajador, emi.ino_nota, emi.inp_notacontratoperiodo ' +
            '         WHERE at_idddjj = dj_id(+) ' +
            '           AND at_idnotacontratoperiodo = np_id ' +
            '           AND no_id = np_idnota ' +
            '           AND np_id = ' + SqlValue(aIdNotaPeriodo) +
            '           AND at_iddttrabajador IS NULL ' +
            '        UNION ALL ' +
            '        SELECT dt_remuneracion + NVL(at_masasalarial, 0) dt_remuneracion, ' +
            '               emi.utiles.get_remuneraciontopeada(dj_cuit, at_cuil, NVL(dt_codigosituacionms, dt_codigosituacion), dj_periodo, ' +
            '                                                  dt_remuneracion + NVL(at_masasalarial, 0), dt_vacaciones, ' +
            '                                                  nvl(dt_diaslaborales, at_diastrabajados), NVL2(dt_codigosituacionms, ''S'', ''D'')) remtop, ' +
            '               emi.utiles.is_remuneraciontopeada(dj_cuit, at_cuil, dt_codigosituacion, dj_periodo, ' +
            '                                                 dt_remuneracion + NVL(at_masasalarial, 0), dt_vacaciones, ' +
            '                                                 nvl(dt_diaslaborales, at_diastrabajados), NVL2(dt_codigosituacionms, ''S'', ''D'')) isremtop ' +
            '          FROM emi.idj_ddjj, emi.idt_ddjjtrabajador, emi.iat_adicionaltrabajador, emi.inp_notacontratoperiodo ' +
            '         WHERE dj_id = dt_idddjj ' +
            '           AND at_iddttrabajador = dt_id ' +
            '           AND at_idnotacontratoperiodo = np_id ' +
            '           AND dt_devengable = ''S'' ' +
            '           AND np_id = ' + SqlValue(aIdNotaPeriodo) +
            '        UNION ALL ' +
            '        SELECT dt_remuneracion, ' +
            '               emi.utiles.get_remuneraciontopeada(dj_cuit, dt_cuil, NVL(dt_codigosituacionms, dt_codigosituacion), dj_periodo, dt_remuneracion, ' +
            '                                                  dt_vacaciones, dt_diaslaborales, NVL2(dt_codigosituacionms, ''S'', ''D'')) remtop, ' +
            '               emi.utiles.is_remuneraciontopeada(dj_cuit, dt_cuil, NVL(dt_codigosituacionms, dt_codigosituacion), dj_periodo, dt_remuneracion, ' +
            '                                                 dt_vacaciones, dt_diaslaborales, NVL2(dt_codigosituacionms, ''S'', ''D'')) isremtop ' +
            '          FROM emi.idj_ddjj, emi.idt_ddjjtrabajador ' +
            '         WHERE dj_id = dt_idddjj ' +
            '           AND dt_devengable = ''S'' ' +
            '           AND dj_id IN(SELECT at_idddjj ' +
            '                          FROM emi.iat_adicionaltrabajador, emi.inp_notacontratoperiodo ' +
            '                         WHERE at_idnotacontratoperiodo = np_id ' +
            '                           AND np_id = ' + SqlValue(aIdNotaPeriodo)  + ' )' +
//            '                           AND at_iddttrabajador IS NOT NULL) ' +
            '           AND NOT EXISTS(SELECT 1 ' +
            '                            FROM emi.iat_adicionaltrabajador, emi.inp_notacontratoperiodo ' +
            '                           WHERE at_idnotacontratoperiodo = np_id ' +
            '                             AND np_id = ' + SqlValue(aIdNotaPeriodo) +
            '                             AND at_iddttrabajador = dt_id)) ';

  with GetQuery(sSql) do
  try
    if not IsEmpty then
      ShowMessage(Format('Masa sin Tope: %12.2f ' + #13#10 + 'Masa Topeada: %12.2f ' +  #13#10 + 'Trabajadores Topeados: %8.0f' + #13#10 + #13#10 +
      'Los días trab. de la DDJJ tienen prioridad  ' + #13#10 + 'por sobre los cargados en este archivo.',
      [FieldByName('remu').AsFloat,
      FieldByName('remtop').AsFloat,
      FieldByName('isremtop').AsFloat]));
      EjecutarSqlST(' UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                    ' SET NP_TOTALEMPLEADOS = ' + SqlValue(FieldByName('canttrab').AsInteger) + ', ' +
                    '     NP_TOTALMASASINTOPEAR = ' + SqlNumber(FieldByName('remu').AsFloat) + ', ' +
                    '     NP_TOTALMASASALARIAL = ' + SqlNumber(FieldByName('remtop').AsFloat) +
                    ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  finally
    Free;
  end;
end;}

procedure TfraFormAdicionarDetalle.tbExportClick(Sender: TObject);
begin
  if not cdsRegistros.IsEmpty then
    ExportDialog.Execute;
end;

end.
