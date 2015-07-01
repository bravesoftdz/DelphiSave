unit unFraFormEscuelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ComCtrls, ToolWin, CurrEdit,
  StdCtrls, ToolEdit, DateComboBox, Mask, PatternEdit, IntEdit, VCLExtra, CustomDlgs, Cuit,
  unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql, SDEngine, unConstEmision,
  unFuncionesEmision, Strfuncs, General;

type
  TfraFormEscuelas = class(TFrame)
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
    tbComandosDetalle900_926: TToolBar;
    tbAddFile: TToolButton;
    tbLimpiar: TToolButton;
    edArchivo: TEdit;
    OpenDialog: TOpenDialog;
    tbProcesar: TToolButton;
    edTextoGestion: TMemo;
    lblTextoGestion: TLabel;
    procedure tbAddFileClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbProcesarClick(Sender: TObject);
    procedure cdsRegistrosAfterOpen(DataSet: TDataSet);
  private
    FContrato: integer;
    procedure GuardarDetalleBorrador(aIdNotaPeriodo: integer; aCuil: String; aMasaSalarialAdic: Real;
      aFechaPresentacion: TDateTime; idddjj: integer; idtrabajador: integer);
    procedure EliminarDetalleBorrador(aIdNota: integer);
    procedure ParsearLinea(aLinea: String; aNroLinea: integer);
    procedure ProcesarRegistros;
    procedure MostrarValores(aIdNotaPeriodo: integer);
  public
    property Contrato: integer read FContrato write FContrato;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    procedure Init;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario: integer; aIdNota: integer);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure CargarArchivo(aArchivo: String);
  end;

implementation

{$R *.dfm}

procedure TfraFormEscuelas.ActivarControles(aActive: boolean);
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
  tbLimpiar.Enabled := aActive;
end;

procedure TfraFormEscuelas.Init;
begin
  cdsRegistros.CreateDataSet;
  cdsRegistros.EmptyDataSet;
end;

procedure TfraFormEscuelas.LimpiarControles;
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

procedure TfraFormEscuelas.tbAddFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfraFormEscuelas.CargarArchivo(aArchivo: String);
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

procedure TfraFormEscuelas.tbLimpiarClick(Sender: TObject);
begin
  LimpiarControles;
end;

function TfraFormEscuelas.Validar(aIdFormulario: integer): boolean;
begin
  Verificar(cdsRegistros.IsEmpty, dbgRegistros, 'Debe ingresar un archivo.');

  cdsRegistros.First;
  while not cdsRegistros.Eof do
    begin
      Verificar(edTextoGestion.Enabled and (trim(edTextoGestion.Text) = ''), edTextoGestion, 'El archivo no se gestionará. Debe ingresar un texto de gestión.');
      Verificar(cdsRegistros.FieldByName('Error').AsString <> '', dbgRegistros, 'Se han encontrados errores en el archivo.');
//      Verificar(not cdsRegistros.FieldByName('Error').IsNull, dbgRegistros, 'Se han encontrados errores en el archivo.');

      cdsRegistros.Next;
    end;


  result := true;
end;

procedure TfraFormEscuelas.GuardarBorrador(aIdFormulario: integer; aIdNota: integer);
var
  aIdNotaPeriodo: integer;
begin
  aIdNotaPeriodo := 0;

  EliminarDetalleBorrador(aIdNota);

  cdsRegistros.First;
  while not cdsRegistros.Eof do
  begin
    aIdNotaPeriodo := ValorSqlInteger(' SELECT NP_ID ' +
                                      ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                      ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                                      ' AND NP_PERIODO = ' + SqlValue(cdsRegistros.FieldByName('Periodo').AsString) +
                                      ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario), -1);

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

      SaveBlob('UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
               'SET NP_TEXTOOBSNOTA = :TS_TEXTO ' +
               'WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo),
               edTextoGestion.Lines);

      GuardarDetalleBorrador(aIdNotaPeriodo,
                             cdsRegistros.FieldByName('Cuil').AsString,
                             cdsRegistros.FieldByName('MasaSalarialAdic').AsFloat,
                             cdsRegistros.FieldByName('FechaPresentacion').AsDateTime,
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

procedure TfraFormEscuelas.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
  aIdNota :integer;
begin

  aIdNota := ValorSqlInteger('SELECT NP_IDNOTA FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));

  Q := GetQuery(' SELECT am_id, am_idnotacontratoperiodo, am_cuil, am_fechapresentacion, am_masaadicional, np_periodo, am_idddjj, am_iddttrabajador ' +
                ' FROM emi.inp_notacontratoperiodo, emi.iam_adicionalmasa ' +
                ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                ' AND am_idnotacontratoperiodo = np_id');

  try
    while not Q.Eof do
    begin
      cdsRegistros.Append;
      cdsRegistros.FieldByName('Cuil').AsString := Q.fieldbyname('am_cuil').AsString;
      cdsRegistros.FieldByName('Periodo').AsString := Q.fieldbyname('np_periodo').AsString;
      cdsRegistros.FieldByName('MasaSalarialAdic').AsFloat := Q.fieldbyname('am_masaadicional').AsFloat;
      cdsRegistros.FieldByName('FechaPresentacion').AsDateTime := Q.fieldbyname('am_fechapresentacion').AsDateTime;
      cdsRegistros.FieldByName('idDetalle').AsInteger := Q.fieldbyname('am_id').AsInteger;
      cdsRegistros.FieldByName('idddjj').AsInteger := Q.fieldbyname('am_idddjj').AsInteger;
      cdsRegistros.FieldByName('idtrabajador').AsInteger := Q.fieldbyname('am_iddttrabajador').AsInteger;
      cdsRegistros.FieldByName('ExisteDDJJ').AsString := iif(not (Q.fieldbyname('am_idddjj').IsNull), 'S', 'N');
      cdsRegistros.FieldByName('ExisteTrabajador').AsString := iif(not (Q.fieldbyname('am_iddttrabajador').IsNull), 'S', 'N');


      edTotalRegistros.Value := edTotalRegistros.Value + 1; 
      if (Q.fieldbyname('am_iddttrabajador').AsInteger <> 0) then
      begin
        cdsRegistros.FieldByName('TotalMasaSalarial').AsFloat := ValorSqlExtended('select dt_remuneracion ' +
                                                                                  'from emi.idt_ddjjtrabajador ' +
                                                                                  'where dt_id = ' + SqlValue(Q.fieldbyname('am_iddttrabajador').AsInteger)) +
                                                                                  cdsRegistros.FieldByName('MasaSalarialAdic').AsFloat;
        edTrabEncontrados.Value := edTrabEncontrados.Value + 1;
      end
      else begin
        cdsRegistros.FieldByName('TotalMasaSalarial').Value := null;
        edTrabNoEncontrados.Value := edTrabNoEncontrados.Value + 1;
      end;


      cdsRegistros.Post;
      Q.Next;
    end;
  finally
    Q.free;
  end;

  tbAddFile.Enabled := (cdsRegistros.RecordCount = 0);
  tbProcesar.Enabled := (cdsRegistros.RecordCount = 0);

  BlobSql('SELECT NP_TEXTOOBSNOTA FROM EMI.INP_NOTACONTRATOPERIODO ' +
           'WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo),
           edTextoGestion.Lines);

end;

procedure TfraFormEscuelas.GuardarDetalleBorrador(aIdNotaPeriodo: integer; aCuil: String; aMasaSalarialAdic: Real;
    aFechaPresentacion: TDateTime; idddjj: integer; idtrabajador: integer);
begin
  EjecutarSqlST(' INSERT INTO EMI.IAM_ADICIONALMASA ' +
                ' VALUES (EMI.SEQ_IAM_ID.NEXTVAL, ' + SqlValue(aIdNotaPeriodo) + ', ' +
                  SqlValue(aCuil) + ', ' +
                  SqlNumber(aMasaSalarialAdic) + ', ' +
                  SqlDate(aFechaPresentacion)  + ', ' +
                  SqlNumber(idddjj) + ', ' +
                  SqlNumber(idtrabajador) + ')' );
end;

procedure TfraFormEscuelas.ParsearLinea(aLinea: String; aNroLinea: integer);
var
  Arr: TStringArray;
  strError: String;
  MasaAdic: Real;
  FechaPres: TDate;
  Dia, Mes, Ano: Word;
  format : TFormatSettings;
begin
  if (aNroLinea > 1) then
  begin
    //Cuil--Periodo--Masa Adicional--Fecha Presentacion
    Split(aLinea, #9, Arr);

    strError  := '';
    FechaPres := 0;
    MasaAdic  := 0;

    if (Length(Arr) >= 4) then
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
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Masa Adicional incluye puntos (.) ' + trim(Arr[2]) + #13#10;

  //    Arr[2] := StringReplace(Arr[2], '.', '',  [rfReplaceAll]);
      Arr[2] := StringReplace(Arr[2], ',', '.', [rfReplaceAll]);

      format.DecimalSeparator := '.';
      MasaAdic := StrToFloatDef(Arr[2], -1,format);

      if (MasaAdic < 0) then
        strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Masa Adicional Inválida ' + trim(Arr[2]) + #13#10;

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
    end
    else
      strError := strError + 'Línea: ' + IntToStr(aNroLinea) + ' Error: Faltan Campos ' + #13#10;
                   
    if strError <> '' then
      strError := CutRight(strError, 2);
      
    cdsRegistros.Append;

    cdsRegistros.FieldByName('Cuil').AsString :=  trim(Arr[0]);
    cdsRegistros.FieldByName('Periodo').AsString := trim(Arr[1]);
    cdsRegistros.FieldByName('MasaSalarialAdic').AsFloat := MasaAdic;
    cdsRegistros.FieldByName('FechaPresentacion').AsDateTime := FechaPres;
    cdsRegistros.FieldByName('idDetalle').AsInteger := -1;
    cdsRegistros.FieldByName('Error').AsString :=  strError;

    cdsRegistros.Post;
  end;
end;

procedure TfraFormEscuelas.tbProcesarClick(Sender: TObject);
begin
  if (OpenDialog.FileName = '') then Exit;
  CargarArchivo(OpenDialog.FileName);
  ProcesarRegistros;
  tbAddFile.Enabled := (cdsRegistros.RecordCount = 0);
  tbProcesar.Enabled := (cdsRegistros.RecordCount = 0);
end;

procedure TfraFormEscuelas.ProcesarRegistros;
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
                     TF_DocumentacionEscuelas,
                     idddj,
                     idddjjtrabajador);
      cdsRegistros.FieldByName('idddjj').AsInteger := idddj;
      cdsRegistros.FieldByName('idtrabajador').AsInteger := idddjjtrabajador;

      edTotalRegistros.Value := edTotalRegistros.Value + 1;

      if (idddjjtrabajador <> 0) then
      begin
        cdsRegistros.FieldByName('TotalMasaSalarial').AsFloat := ValorSqlExtended('select dt_remuneracion ' +
                                                                                  'from emi.idt_ddjjtrabajador ' +
                                                                                  'where dt_id = ' + SqlValue(idddjjtrabajador)) +
                                                                                  cdsRegistros.FieldByName('MasaSalarialAdic').AsFloat;
        edTrabEncontrados.Value := edTrabEncontrados.Value + 1;
      end
      else begin
        cdsRegistros.FieldByName('TotalMasaSalarial').Value := null;
        edTrabNoEncontrados.Value := edTrabNoEncontrados.Value + 1;
      end;

      cdsRegistros.FieldByName('ExisteDDJJ').AsString := iif((idddj <> 0), 'S', 'N');
      cdsRegistros.FieldByName('ExisteTrabajador').AsString := iif((idddjjtrabajador <> 0), 'S', 'N');

      if (not edTextoGestion.Enabled) and ((cdsRegistros.FieldByName('ExisteDDJJ').AsString = 'N') or (cdsRegistros.FieldByName('ExisteTrabajador').AsString = 'N')) then
        edTextoGestion.Enabled := true;
        
      cdsRegistros.UpdateRecord;

      cdsRegistros.Next;
    end;
  finally
    cdsRegistros.EnableControls;
  end;
end;

procedure TfraFormEscuelas.EliminarDetalleBorrador(aIdNota: integer);
begin
  EjecutarSqlST(' DELETE FROM EMI.IAM_ADICIONALMASA ' +
                ' WHERE AM_IDNOTACONTRATOPERIODO IN (SELECT NP_ID ' +
                                                    'FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                                    'WHERE NP_IDNOTA = ' + SqlValue(aIdNota) + ')');

end;

procedure TfraFormEscuelas.MostrarValores(aIdNotaPeriodo: integer);
var
  sSql: String;
begin
  do_aplicarcaso19(FContrato, aIdNotaPeriodo, true);
  sSql := ' SELECT np_totalempleados, np_totalmasasintopear, np_totalmasasalarial, np_textonota FROM emi.inp_notacontratoperiodo WHERE np_id = :id';

  with GetQueryEx(sSql, [aIdNotaPeriodo]) do
  try
    if not IsEmpty then
      ShowMessage(Format('Masa sin Tope: %12.2f ' + #13#10 + 'Masa Topeada: %12.2f ' +  #13#10 + '%s' + #13#10 + #13#10,
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
            '  FROM (SELECT dt_remuneracion + NVL(am_masaadicional, 0) dt_remuneracion, ' +
            '               emi.utiles.get_remuneraciontopeada(dj_cuit, am_cuil, NVL(dt_codigosituacionms, dt_codigosituacion), dj_periodo, ' +
            '                                                  dt_remuneracion + NVL(am_masaadicional, 0), dt_vacaciones, ' +
            '                                                  nvl(dt_diaslaborales, dt_diaslaborales), NVL2(dt_codigosituacionms, ''S'', ''D'')) remtop, ' +
            '               emi.utiles.is_remuneraciontopeada(dj_cuit, am_cuil, NVL(dt_codigosituacionms, dt_codigosituacion), dj_periodo, ' +
            '                                                 dt_remuneracion + NVL(am_masaadicional, 0), dt_vacaciones, ' +
            '                                                 dt_diaslaborales, NVL2(dt_codigosituacionms, ''S'', ''D'')) isremtop ' +
            '          FROM emi.idj_ddjj, emi.idt_ddjjtrabajador, emi.iam_adicionalmasa, emi.inp_notacontratoperiodo ' +
            '         WHERE dj_id = dt_idddjj ' +
            '           AND am_iddttrabajador = dt_id ' +
            '           AND am_idnotacontratoperiodo = np_id ' +
            '           AND np_id = ' + SqlValue(aIdNotaPeriodo) +
            '        UNION ALL ' +
            '        SELECT dt_remuneracion, ' +
            '               emi.utiles.get_remuneraciontopeada(dj_cuit, dt_cuil, NVL(dt_codigosituacionms, dt_codigosituacion), dj_periodo, dt_remuneracion, ' +
            '                                                  dt_vacaciones, dt_diaslaborales, NVL2(dt_codigosituacionms, ''S'', ''D'')) remtop, ' +
            '               emi.utiles.is_remuneraciontopeada(dj_cuit, dt_cuil, NVL(dt_codigosituacionms, dt_codigosituacion), dj_periodo, dt_remuneracion, ' +
            '                                                 dt_vacaciones, dt_diaslaborales, NVL2(dt_codigosituacionms, ''S'', ''D'')) isremtop ' +
            '          FROM emi.idj_ddjj, emi.idt_ddjjtrabajador ' +
            '         WHERE dj_id = dt_idddjj ' +
            '           AND dj_id IN(SELECT am_idddjj ' +
            '                          FROM emi.iam_adicionalmasa, emi.inp_notacontratoperiodo ' +
            '                         WHERE am_idnotacontratoperiodo = np_id ' +
            '                           AND np_id = ' + SqlValue(aIdNotaPeriodo)  +
            '                           AND am_iddttrabajador IS NOT NULL) ' +
            '           AND NOT EXISTS(SELECT 1 ' +
            '                            FROM emi.iam_adicionalmasa, emi.inp_notacontratoperiodo ' +
            '                           WHERE am_idnotacontratoperiodo = np_id ' +
            '                             AND np_id = ' + SqlValue(aIdNotaPeriodo) +
            '                             AND am_iddttrabajador IS NOT NULL ' +
            '                             AND am_iddttrabajador = dt_id)) ';

  with GetQuery(sSql) do
  try
    if not IsEmpty then
      ShowMessage(Format('Masa sin Tope: %12.2f ' + #13#10 + 'Masa Topeada: %12.2f ' +  #13#10 + 'Trabajadores Topeados: %8.0f',
      [FieldByName('remu').AsFloat,
      FieldByName('remtop').AsFloat,
      FieldByName('isremtop').AsFloat]));
  finally
    Free;
  end;
end;
}

procedure TfraFormEscuelas.cdsRegistrosAfterOpen(DataSet: TDataSet);
begin
  if DataSet.Fields.FindField('TotalMasaSalarial') is TFloatField then
    TFloatField(DataSet.FieldByName( 'TotalMasaSalarial')).Currency := True;

  if DataSet.Fields.FindField('MasaSalarialAdic') is TFloatField then
    TFloatField(DataSet.FieldByName( 'MasaSalarialAdic')).Currency := True;
end;

end.
